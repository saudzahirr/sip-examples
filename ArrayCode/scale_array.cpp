#include "scale_array.h"

std::vector<double> scale_array(const std::vector<double>& input)
{
    std::vector<double> result;
    result.reserve(input.size());

    for (double val : input)
    {
        result.push_back(val * 2.0);
    }

    return result;
}