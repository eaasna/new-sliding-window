#include <seqan3/io/views/async_input_buffer.hpp>
#include <seqan3/core/debug_stream.hpp>

#include <valik/argument_parsing/search.hpp>
#include <valik/index.hpp>
#include <valik/search/search.hpp>

namespace valik::app
{

void init_search_parser(sharg::parser & parser, search_arguments & arguments)
{
    init_shared_meta(parser);
    parser.add_option(arguments.index_file,
                      sharg::config{.short_id = '\0',
                      .long_id = "index",
                      .description = "Provide a valid path to an IBF.",
                      .required = true,
                      .validator = sharg::input_file_validator{}});
    parser.add_option(arguments.query_file,
                      sharg::config{.short_id = '\0',
                      .long_id = "query",
                      .description = "Provide a path to the query file.",
                      .required = true,
                      .validator = sharg::input_file_validator{}});
    parser.add_option(arguments.out_file,
                      sharg::config{.short_id = '\0',
                      .long_id = "output",
                      .description = "Please provide a valid path to the output.",
                      .required = true,
                      .validator = sharg::output_file_validator{sharg::output_file_open_options::open_or_create, {"gff"}}});
    parser.add_option(arguments.errors,
                      sharg::config{.short_id = '\0',
                      .long_id = "error",
                      .description = "Choose the number of errors.",
                      .validator = positive_integer_validator{true}});
    parser.add_option(arguments.tau,
                      sharg::config{.short_id = '\0',
                      .long_id = "tau",
                      .description = "Used in the dynamic thresholding. The higher tau, the lower the threshold.",
                      .validator = sharg::arithmetic_range_validator{0, 1}});
    parser.add_option(arguments.threshold,
                      sharg::config{.short_id = '\0',
                      .long_id = "threshold",
                      .description = "If set, this threshold is used instead of the probabilistic models.",
                      .validator = sharg::arithmetic_range_validator{0, 1}});
    parser.add_option(arguments.p_max,
                      sharg::config{.short_id = '\0',
                      .long_id = "p_max",
                      .description = "Used in the dynamic thresholding. The higher p_max, the lower the threshold.",
                      .validator = sharg::arithmetic_range_validator{0, 1}});
    parser.add_option(arguments.pattern_size,
                      sharg::config{.short_id = '\0',
                      .long_id = "pattern",
                      .description = "Choose the pattern size. Default: half of first query sequence."});
    parser.add_option(arguments.overlap,
                      sharg::config{.short_id = '\0',
                      .long_id = "overlap",
                      .description = "Choose how much sequential patterns overlap. Default: pattern size - 1."});
    parser.add_flag(arguments.compressed,
                    sharg::config{.short_id = '\0',
                    .long_id = "compressed",
                    .description = "Build a compressed IBF."});
    parser.add_flag(arguments.cache_thresholds,
                    sharg::config{.short_id = '\0',
                    .long_id = "cache-thresholds",
                    .description = "Stores the computed thresholds with an unique name next to the index. In the next search call "
                                   "using this option, the stored thresholds are re-used.\n"
                                   "Two files are stored:\n"
                                   "\\fBthreshold_*.bin\\fP: Depends on pattern, window, kmer/shape, errors, and tau.\n"
                                   "\\fBcorrection_*.bin\\fP: Depends on pattern, window, kmer/shape, p_max, and fpr."});
    parser.add_flag(arguments.write_time,
                    sharg::config{.short_id = '\0',
                    .long_id = "time",
                    .description = "Write timing file.",
                    .advanced = true});
    parser.add_option(arguments.cart_max_capacity,
                    sharg::config{.short_id = '\0',
                    .long_id = "cart_max_capacity",
                    .description = "Number of elements to be stored in a single cart before it is send for processing."});
    parser.add_option(arguments.max_queued_carts,
                    sharg::config{.short_id = '\0',
                    .long_id = "max_queued_carts",
                    .description = "Maximal number of carts that are full and are waiting to be processed."});
    parser.add_option(arguments.ref_meta_path,
                    sharg::config{.short_id = '\0',
                    .long_id = "ref-meta",
                    .description = "Path to reference metadata file created by split.",
                    .validator = sharg::input_file_validator{}});
    parser.add_option(arguments.seg_path,
                    sharg::config{.short_id = '\0',
                    .long_id = "seg-meta",
                    .description = "Path to segment metadata file created by split.",
                    .validator = sharg::input_file_validator{}});
    parser.add_flag(arguments.shared_memory,
                    sharg::config{.short_id = '\0',
                    .long_id = "shared-memory",
                    .description = "Launch Stellar instances on a single machine with shared memory."});
    parser.add_option(arguments.threads,
                    sharg::config{.short_id = '\0',
                    .long_id = "threads",
                    .description = "Choose the number of threads.",
                    .validator = positive_integer_validator{}});
}

void run_search(sharg::parser & parser)
{
    search_arguments arguments{};

    init_search_parser(parser, arguments);

    try_parsing(parser);

    // ==========================================
    // Various checks.
    // ==========================================

    sharg::input_file_validator{}(arguments.query_file);
    arguments.treshold_was_set = parser.is_option_set("threshold");

    // ==========================================
    // Read window and kmer size, and the bin paths.
    // ==========================================
    {
        std::ifstream is{arguments.index_file.string(),std::ios::binary};
        cereal::BinaryInputArchive iarchive{is};
        valik_index<> tmp{};
        tmp.load_parameters(iarchive);
        arguments.shape = tmp.shape();
        arguments.shape_size = arguments.shape.size();
        arguments.shape_weight = arguments.shape.count();
        arguments.window_size = tmp.window_size();
        arguments.compressed = tmp.compressed();
        arguments.bin_path = tmp.bin_path();
    }

    // ==========================================
    // Process --pattern.
    // ==========================================

    if (parser.is_option_set("pattern"))
    {
        if (arguments.pattern_size < arguments.window_size)
            throw sharg::validation_error{"The minimiser window cannot be bigger than the pattern."};
    }
    else

    // ==========================================
    // Set default pattern size.
    // ==========================================
    if (!arguments.pattern_size)
    {
        seqan3::sequence_file_input<dna4_traits, seqan3::fields<seqan3::field::seq>> query_in{arguments.query_file};
        for (auto & [seq] : query_in | std::views::take(1))
        {
            arguments.pattern_size = std::ranges::size(seq) / 2;
        }
    }

    // ==========================================
    // More checks.
    // ==========================================

    if (parser.is_option_set("overlap"))
    {
        if (arguments.overlap >= arguments.pattern_size)
                throw sharg::validation_error{"The overlap size has to be smaller than the pattern size."};
    }
    else
        arguments.overlap = arguments.pattern_size - 1;

    // ==========================================
    // Dispatch
    // ==========================================
    valik_search(arguments);
}

} // namespace valik::app
