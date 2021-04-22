#include "prog2.hpp"

#include <iostream>

#include <assert.h>

int main()
{
    std::cout << std::boolalpha;
    // std::vector<int> vals1{5, 4, 12, -3, 10};
    // auto result = isSubsetSum(vals1, 6);
    // std::cout << std::get<bool>(result) << '\n';
    // auto& indices1 = std::get<std::vector<unsigned>>(result);
    // for (auto index : indices1) std::cout << index << ' ';
    // std::cout << '\n';
    // std::cout << "===\n";
    // result = isSubsetSum(vals1, -5);
    // std::cout << std::get<0>(result) << '\n';
    // std::cout << "===\n";
    // std::vector<int> vals2{20, 15, 10};
    // result = isSubsetSum(vals2, 45);
    // auto& indices2 = std::get<1>(result);
    // for (auto index : indices2) std::cout << index << ' ';
    // std::cout << std::endl;
    // std::cout << "===\n";
    // std::vector<int> vals3{8, 17, 2, 9, 3, 4, 5, 20, 15, -5, -8, 6,
    //                        101, 200, 300, 400};
    // result = isSubsetSum(vals3, 87);
    // std::cout << std::get<0>(result) << '\n';
    // auto& indices3 = std::get<1>(result);
    // for (auto index : indices3) std::cout << index << ' ';
    // std::cout << std::endl;

    // own test cases
    std::vector<int> vals4{}; // empty vector
    auto result = isSubsetSum(vals4, 87);
    assert(!std::get<bool>(result));
    std::cout << std::get<0>(result) << '\n'; // false
    auto& indices4 = std::get<1>(result); // empty
    for (auto index : indices4) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals5{1, 1, 1, 1, 1}; // all elements in solution
    result = isSubsetSum(vals5, 5);
    assert(std::get<bool>(result));
    std::cout << std::get<0>(result) << '\n'; // true
    auto& indices5 = std::get<1>(result); // [0, 1, 2, 3, 4]
    for (auto index : indices5) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals6{1, 2, 3, 4, 5}; // one element in solution
    result = isSubsetSum(vals6, 2);
    assert(std::get<bool>(result));
    std::cout << std::get<0>(result) << '\n'; // true
    auto& indices6 = std::get<1>(result); // [1]
    for (auto index : indices6) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals7{0}; // one element
    result = isSubsetSum(vals7, 2);
    assert(!std::get<bool>(result));
    std::cout << std::get<0>(result) << '\n'; // false
    auto& indices7 = std::get<1>(result); // empty
    for (auto index : indices7) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals8{0}; // one element
    result = isSubsetSum(vals8, 0);
    assert(std::get<bool>(result));
    std::cout << std::get<0>(result) << '\n'; // true
    auto& indices8 = std::get<1>(result); // [0]
    for (auto index : indices8) std::cout << index << ' ';
    std::cout << std::endl;
}
