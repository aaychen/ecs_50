#include "prog2.hpp"
#include <cmath>

std::tuple<bool, std::vector<unsigned>> isSubsetSum(const std::vector<int>& itemVals, int target) {
    std::vector<unsigned> sol; // push_back same as append
    std::tuple<bool, std::vector<unsigned>> res(false, sol);
    // MUST INVOLVED BITS
    // no more than 16 items -> hexadecimal!

    for (int i = 0; i < pow(2, itemVals.size()) - 1; i++) { // iterate over all possible subsets of the (max) 16 items
        // turn each i into a different bitstring
        int temp = 1;
        int tempSum = 0;
        std::vector<unsigned> tempInd;
        for (int j = 0; j < 16; j++) {
            int temp2 = i & temp;
            if (temp2 != 0) {
                int bitNum = log2(temp2);
                int index = itemVals.size() - bitNum - 1;
                tempInd.push_back(index);
                tempSum += itemVals[index];
            }
            temp = temp << 1;
        }
        if (tempSum == target) {
            std::get<bool>(res) = true;
            std::get<std::vector<unsigned>>(res) = tempInd;
            break;
        }
        // position of 1's in bitstring correspond to adding respective element in itemVals for temporary sum
        // if that sum is equal to target, optimal solution is found
            // change tuple and break loop
    }
    return res; // return false, empty vector (no optimal solution)
}

std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> isSetPartionable(const std::vector<int>& vals) {
    // TODO
    std::tuple<bool, std::vector<unsigned>, std::vector<unsigned>> res;
    return res;
}