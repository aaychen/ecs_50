#include "prog2.hpp"
#include <cmath>

#include <iostream> // delete later

std::tuple<bool, std::vector<unsigned>> isSubsetSum(const std::vector<int>& itemVals, int target) {
    std::vector<unsigned> indices; // indices of values that make up the optimal solution
    std::tuple<bool, std::vector<unsigned>> res(false, indices);

    // iterate over all possible subsets of the (max) 16 items -> 2^n possibilities
    for (int count = 0; count < pow(2, itemVals.size()); count++) {
        int sum = 0;
        indices.clear();

        // find sum of subset
        // to add indices in ascending order, start with MSB
        for (int mask = pow(2, 15); mask > 0; mask >>= 1) {
            int temp = count & mask; // determine which bit to add
            if (temp != 0) {
                int bitNum = log2(temp); // determine which bit number it is (diff from index)
                int i = itemVals.size() - bitNum - 1; // compute index 
                indices.push_back(i);
                sum += itemVals[i];
            }
        }

        // if sum == target, update tuple and break (at most 1 optimal solution)
        if (sum == target) {
            std::get<bool>(res) = true;
            std::get<std::vector<unsigned>>(res) = indices;
            break;
        }
    }
    return res;
}

std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> isSetPartionable(const std::vector<int>& vals) {
    // TODO
    std::vector<unsigned> par1, par2;
    std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> res(false, par1, par2);


    return res;
}