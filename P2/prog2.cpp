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

        // change 15 to itemVals.size() ???
        for (int mask = pow(2, 15); mask > 0; mask >>= 1) {
            int temp = count & mask; // determine which bit to add
            if (temp != 0) {
                int bitNum = log2(temp); // determine which bit number it is (diff from index)
                int i = itemVals.size() - bitNum - 1; // compute index 
                indices.push_back(i);
                sum += itemVals[i];
            }
        }

        // if solution set is not empty and sum == target, update tuple and break (at most 1 optimal solution)
        if (indices.size() != 0 && sum == target) {
            std::get<bool>(res) = true;
            std::get<std::vector<unsigned>>(res) = indices;
            break;
        }
    }
    return res;
}

std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> isSetPartionable(const std::vector<int>& vals) {
    // TODO
    std::vector<unsigned> par1, par2; // indices of values that make up the optimal solution
    std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> res(false, par1, par2);

    for (int count = 0; count < pow(2, vals.size()); count++) {
        int sum1 = 0, sum2 = 0;
        par1.clear();
        par2.clear();

        // find sums of partitions
        // to add indices in ascending order, start with MSB
        int j = 0; // keep track of index position for adding to par2
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
        
        // debugging
        // for (auto num : par1) {
        //     std::cout << num << ' ';
        // }
        // std::cout << std::endl;
        // for (auto num : par2) {
        //     std::cout << num << ' ';
        // }
        // std::cout << std::endl;
        // std::cout << std::endl;

        // if partitions are not empty and sum1 == sum2, update tuple and break (at most 1 optimal solution)
        if (par1.size() != 0 && par2.size() != 0 && sum1 == sum2) {
            std::get<bool>(res) = true;
            std::get<1>(res) = par1;
            std::get<2>(res) = par2;
            break;
        }
    }
    return res;
}