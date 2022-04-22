cmake_minimum_required (VERSION 3.8)

include (cmake/app_datasources.cmake)

declare_datasource (FILE single_query.fq
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single_query.fq
                URL_HASH SHA256=9a8225cc7d4a125dcd6b6030cf19228f64452f6da2f1bd81a14178c21adb4e08)
declare_datasource (FILE single_reference.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single_reference.fasta
                URL_HASH SHA256=53d633474b01a68927d3ab1fd970b200e96403bb1fdcc53feb0367a2093be273)
declare_datasource (FILE various_chromosome_lengths.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/split/various_chromosome_lengths.fasta
                URL_HASH SHA256=7c7a8fcdd52a932cda76219f24024c1624292377103d9fd5a55abd288c6072be)


declare_datasource (FILE 150overlap16bins13window1errors.out
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap16bins13window1errors.out
                URL_HASH SHA256=ce63274a07dd2a24423e1eb60a24e1a8ab64862de893d86b0f8855939e75d115)
declare_datasource (FILE 150overlap16bins13window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap16bins13window.ibf
                URL_HASH SHA256=5dcb6acad48140a3905703535c8e4cce3d676e6974c55d71c972a46c5277953a)
declare_datasource (FILE 150overlap16bins15window1errors.out
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap16bins15window1errors.out
                URL_HASH SHA256=ce63274a07dd2a24423e1eb60a24e1a8ab64862de893d86b0f8855939e75d115)
declare_datasource (FILE 150overlap16bins15window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap16bins15window.ibf
                URL_HASH SHA256=01bde29eb22844bd0f29283248a90c4f1679357a5edf8d36ad51448a89fefe4b)
declare_datasource (FILE 150overlap16bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap16bins.txt
                URL_HASH SHA256=5531f85f1a12b0f7a6d82ce0f029147be1965ca7197ebf6a455a9e602842636f)
declare_datasource (FILE 150overlap4bins13window1errors.out
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap4bins13window1errors.out
                URL_HASH SHA256=ce63274a07dd2a24423e1eb60a24e1a8ab64862de893d86b0f8855939e75d115)
declare_datasource (FILE 150overlap4bins13window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap4bins13window.ibf
                URL_HASH SHA256=bfb1d4ff7878b9ec22d3764b08a46249282bbca1197b9d6a0d8b18492ab5a7ea)
declare_datasource (FILE 150overlap4bins15window1errors.out
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap4bins15window1errors.out
                URL_HASH SHA256=ce63274a07dd2a24423e1eb60a24e1a8ab64862de893d86b0f8855939e75d115)
declare_datasource (FILE 150overlap4bins15window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap4bins15window.ibf
                URL_HASH SHA256=44466ae9bdfb7f288b31c2a941daed34d1e2f5de8b71349578859912a145cb08)
declare_datasource (FILE 150overlap4bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/150overlap4bins.txt
                URL_HASH SHA256=bc5c75c23f0b48e2105be9c12c1a737efc1d202700c1349fd73e1e9e28f2d468)
declare_datasource (FILE reference_metadata.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/single/reference_metadata.txt
                URL_HASH SHA256=8f7ba54023d2c7393a3db07deeae8733f2acfd5caf395eb3cb8b6a03b6e0bada)


declare_datasource (FILE 0overlap16bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/multi/0overlap16bins.txt
                URL_HASH SHA256=3276af856698d382535c9a0e26327cd8a98eae7f5c755a7bc715d5268bdba7df)
declare_datasource (FILE 0overlap4bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/multi/0overlap4bins.txt
                URL_HASH SHA256=ea2bca47c7be05c1498fca725d58baf6b7220a2f7369cd5059f809283cf95c08)
declare_datasource (FILE 20overlap16bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/multi/20overlap16bins.txt
                URL_HASH SHA256=abb165981f471b6f86cd49003895c2eaf5438f1d9b7a5ba21b57547a778309fd)
declare_datasource (FILE 20overlap4bins.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/multi/20overlap4bins.txt
                URL_HASH SHA256=ea2bca47c7be05c1498fca725d58baf6b7220a2f7369cd5059f809283cf95c08)
declare_datasource (FILE chromosome_metadata.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/split/multi/chromosome_metadata.txt
                URL_HASH SHA256=435e36bbdb0d481070aca7a86d3b264359bc0c5029fbdaa48f17b9e0f8ad306b)


declare_datasource (FILE 8bins19window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/build/8bins19window.ibf
                URL_HASH SHA256=3a13c890650bf857770816244ed9420295ad8bbe681dac335f687863fc79a603)
declare_datasource (FILE 8bins23window.ibf
                URL ${CMAKE_SOURCE_DIR}/test/data/build/8bins23window.ibf
                URL_HASH SHA256=250578b9e0c47df929ed628931441ada4569ab7df193a5ecb5c069e6339bd56a)
declare_datasource (FILE bin_0.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_0.fasta
                URL_HASH SHA256=f9836f233fe459f8e387f8723dc030a10e44f3490cc1c89bed36222742bd6c35)
declare_datasource (FILE bin_1.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_1.fasta
                URL_HASH SHA256=782cb2eb50722e4a4fb2b5ca82b39817bf78305146a0ae086bab3273997e9237)
declare_datasource (FILE bin_2.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_2.fasta
                URL_HASH SHA256=5ff43c19f3b2d0d7cd113efd5941ff204a5e31820c6edc49c7c47f2d16388e77)
declare_datasource (FILE bin_3.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_3.fasta
                URL_HASH SHA256=0fc4021828129d1752dc2d9a1c163cfb642547ca8e889e969b119e6a2942a39f)
declare_datasource (FILE bin_4.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_4.fasta
                URL_HASH SHA256=d62dbba326f03da7fd4f0d61b460efcc73aee52582fc0903f5358978f33d1a9f)
declare_datasource (FILE bin_5.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_5.fasta
                URL_HASH SHA256=6f16ee171f262e6d1c621b94563adad42a5aab27afee48340d9c2273e67e396f)
declare_datasource (FILE bin_6.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_6.fasta
                URL_HASH SHA256=c4efc778c575e103041b300e0f110677d740c169e55421b9d16650fe92a8c872)
declare_datasource (FILE bin_7.fasta
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_7.fasta
                URL_HASH SHA256=45063104427a48892ba4ccb45cc295dc94760f08c1db90e6f3a73744591ada68)
declare_datasource (FILE bin_paths.txt
                URL ${CMAKE_SOURCE_DIR}/test/data/build/bin_paths.txt
                URL_HASH SHA256=614e23263b689c7b4cc0ae41e99aeb5b43b351f865b4604f892320f2cc4377c7)


declare_datasource (FILE 8bins19window0error100pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window0error100pattern1overlap.out
                URL_HASH SHA256=8437bf1978e89eccfa70ce95197b393fb9c4c611a04fce7bdff369cd0ee98d98)
declare_datasource (FILE 8bins19window0error100pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window0error100pattern40overlap.out
                URL_HASH SHA256=5ccb1060a614600e941e9cf73776f4ff04795f6b07ef7e4436df87150b9175b6)
declare_datasource (FILE 8bins19window0error50pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window0error50pattern1overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins19window0error50pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window0error50pattern40overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins19window1error100pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window1error100pattern1overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins19window1error100pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window1error100pattern40overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins19window1error50pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window1error50pattern1overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins19window1error50pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins19window1error50pattern40overlap.out
                URL_HASH SHA256=be17da6d2128d7d0765e80cf1bd18cc3765d06f1137cf95d7c22fb8d6c45932d)
declare_datasource (FILE 8bins23window0error100pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window0error100pattern1overlap.out
                URL_HASH SHA256=8437bf1978e89eccfa70ce95197b393fb9c4c611a04fce7bdff369cd0ee98d98)
declare_datasource (FILE 8bins23window0error100pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window0error100pattern40overlap.out
                URL_HASH SHA256=5ccb1060a614600e941e9cf73776f4ff04795f6b07ef7e4436df87150b9175b6)
declare_datasource (FILE 8bins23window0error50pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window0error50pattern1overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins23window0error50pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window0error50pattern40overlap.out
                URL_HASH SHA256=bf5051a2e2408243e07efb15880e86c96d61d2778ae8ba33b0860f0e4edcea8e)
declare_datasource (FILE 8bins23window1error100pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window1error100pattern1overlap.out
                URL_HASH SHA256=4a1507e9e4664b8718d13924d6f0ab689bf8a92686c706a8b5c743c606f9748d)
declare_datasource (FILE 8bins23window1error100pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window1error100pattern40overlap.out
                URL_HASH SHA256=4a1507e9e4664b8718d13924d6f0ab689bf8a92686c706a8b5c743c606f9748d)
declare_datasource (FILE 8bins23window1error50pattern1overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window1error50pattern1overlap.out
                URL_HASH SHA256=a1321ea6b1bafd114a6292247958fe8802c695a2aa29669a4f295220ceb99c70)
declare_datasource (FILE 8bins23window1error50pattern40overlap.out
                URL ${CMAKE_SOURCE_DIR}/test/data/search/8bins23window1error50pattern40overlap.out
                URL_HASH SHA256=b063e2ab2c9c5466e5df20a3c246544a6b188dcb2f0737e242d5bc20e9e88bb6)
declare_datasource (FILE query.fq
                URL ${CMAKE_SOURCE_DIR}/test/data/search/query.fq
                URL_HASH SHA256=80981d8a58109fa980b730da2e1a2c328f1f8355949e3b492ef4d811ec8b29fc)
