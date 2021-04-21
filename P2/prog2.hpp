#ifndef PROG2_HPP
#define PROG2_HPP

#include <tuple>
#include <vector>

std::tuple<bool, std::vector<unsigned>> isSubsetSum(
        const std::vector<int>& itemVals, int target);

std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>>
        isSetPartionable(const std::vector<int>& vals);

#endif  // PROG2_HPP
