#include "prog2.hpp"
#include <cmath>

std::tuple<bool, std::vector<unsigned>> isSubsetSum(const std::vector<int>& itemVals, int target) {
    std::vector<unsigned> indices; // indices of values that make up the optimal solution
    
    // iterate over all possible subsets of the (max) 16 items -> 2^n possibilities
    for (int count = 0; count < pow(2, itemVals.size()); count++) {
        int sum = 0;
        indices.clear();
        
        // find sum of subset
        // to add indices in ascending order, start with MSB
        for (int mask = pow(2, itemVals.size()-1); mask > 0; mask >>= 1) {
            int temp = count & mask; // determine which bit to add
            if (temp != 0) {
                int bitNum = log2(temp); // determine which bit number it is (diff from index)
                int i = itemVals.size() - bitNum - 1; // compute index 
                indices.push_back(i);
                sum += itemVals[i];
            }
        }
        
        // if solution set is not empty and sum == target, create true tuple and return (at most 1 optimal solution)
        if (!indices.empty() && sum == target) {
            return std::tuple<bool, std::vector<unsigned>>(true, indices);
        }
    }

    // no optimal solution found
    return std::tuple<bool, std::vector<unsigned>>(false, std::vector<unsigned>());
}

std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> isSetPartionable(const std::vector<int>& vals) {
    std::vector<unsigned> par1, par2; // indices of values that make up the optimal solution

    // iterate over all possibilities
    for (int count = 0; count < pow(2, vals.size()); count++) {
        int sum1 = 0, sum2 = 0;
        par1.clear();
        par2.clear();

        // find sums of partitions
        // to add indices in ascending order, start with MSB
        int j = 0; // keep track of index position for adding to par1
        for (int mask = pow(2, vals.size()-1); mask > 0; mask >>= 1) {
            int temp = count & mask; // determine which bit to add to which partition
            if (temp != 0) { // add to par2 (par2 first to match output -- no other reason)
                int bitNum = log2(temp); // determine which bit number it is (diff from index)
                int i = vals.size() - bitNum - 1; // compute index 
                par2.push_back(i);
                sum2 += vals[i];
            } else { // add to par1
                par1.push_back(j);
                sum1 += vals[j];
            }
            j++;
        }

        // if partitions are not empty and sum1 == sum2, create true tuple and return (at most 1 optimal solution)
        if (!par1.empty() && !par2.empty() && sum1 == sum2) {
            return std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>>(true, par1, par2);
        }
    }

    // no optimal solution found
    return std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>>(false, std::vector<unsigned>(), std::vector<unsigned>());
}