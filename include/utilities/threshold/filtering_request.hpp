#pragma once

#include <utilities/threshold/shared.hpp>
#include <utilities/threshold/param_set.hpp>

namespace valik
{

/**
 * @brief The user requests filtering by setting the following parameters.
 * 
 * @param e Number of errors.
 * @param l Minimum length of local match.
 * @param s Reference size in bases.
 * @param b Number of reference segments.
*/
struct filtering_request
{
    uint8_t e;
    size_t l;
    uint64_t const s;
    size_t const b;

    filtering_request(uint8_t const errors, size_t const min_len,  
                      uint64_t const ref_size, 
                      size_t const bins) : e(errors), l(min_len), s(ref_size), b(bins)
    {
        auto space = param_space();
        //!TODO: error handling
        if (errors > space.max_errors)
            std::cout << "Error: error count out of range\n";
        
        if (min_len > space.max_len)
            std::cout << "Error: min len out of range\n";
    }

    /**
     * @brief Total number of error configurations.
    */
    uint64_t total_conf_count() const
    {
        return combinations<size_t, uint64_t>(e, l);
    }

    /**
     * @brief Expected number of spuriously matching k-mers in a bin.
    */
    double spurious_matches(uint8_t const kmer_size) const
    {
        return std::min(1.0f, expected_kmer_occurrences(std::round(s / (float) b), kmer_size));
    }

    /**
     * @brief The probability of at least threshold k-mers matching spuriously.
    */
    double fpr(param_set const & params) const
    {
        double fpr{1};
        double p = spurious_matches(params.k);
        //std::cout << "Calc fpr\n";
        for (uint8_t matching_kmer_count{1}; matching_kmer_count < params.t; matching_kmer_count++)
        {
          //  std::cout << fpr << '\n';
            fpr -= combinations<uint8_t, uint64_t>(matching_kmer_count, l) * pow(p, matching_kmer_count) * pow(1 - p, l - matching_kmer_count); 
        }

        return fpr;
    }
};

}   // namespace valik
