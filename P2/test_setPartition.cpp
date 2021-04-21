#include "prog2.hpp"

#include <iostream>

#include <assert.h>

int main()
{
    std::cout << std::boolalpha;
    // std::vector<int> vals{-8, 1000, -988, -6, 2, -24};
    // auto result = isSetPartionable(vals);
    // std::cout << std::get<bool>(result) << '\n';
    // auto& indices1 = std::get<1>(result);
    // for (auto index : indices1) std::cout << index << ' ';
    // std::cout << std::endl;
    // auto& indices2 = std::get<2>(result);
    // for (auto index : indices2) std::cout << index << ' ';
    // std::cout << std::endl;

    // own test cases
    std::cout << std::boolalpha;
    std::vector<int> vals{1000, -988, -6, 2, -24}; // no solution
    auto result = isSetPartionable(vals);
    assert(!std::get<bool>(result));
    std::cout << std::get<bool>(result) << '\n'; // false
    auto& indices1 = std::get<1>(result);
    for (auto index : indices1) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2 = std::get<2>(result);
    for (auto index : indices2) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals2{}; // empty vector
    result = isSetPartionable(vals2);
    assert(!std::get<bool>(result));
    std::cout << std::get<bool>(result) << '\n'; // false
    auto& indices1_2 = std::get<1>(result);
    for (auto index : indices1_2) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2_2 = std::get<2>(result);
    for (auto index : indices2_2) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals3{1, -8, 6, 12, 3}; // sol: [0, 2], [1, 3, 4]
    result = isSetPartionable(vals3);
    assert(std::get<bool>(result));
    std::cout << std::get<bool>(result) << '\n'; // true
    auto& indices1_3 = std::get<1>(result);
    for (auto index : indices1_3) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2_3 = std::get<2>(result);
    for (auto index : indices2_3) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals4{1, -1}; // no solution
    result = isSetPartionable(vals4);
    assert(!std::get<bool>(result));
    std::cout << std::get<bool>(result) << '\n'; // false
    auto& indices1_4 = std::get<1>(result);
    for (auto index : indices1_4) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2_4 = std::get<2>(result);
    for (auto index : indices2_4) std::cout << index << ' ';
    std::cout << std::endl;

    std::vector<int> vals5{0}; // 1 element
    result = isSetPartionable(vals5);
    assert(!std::get<bool>(result));
    std::cout << std::get<bool>(result) << '\n'; // false
    auto& indices1_5 = std::get<1>(result);
    for (auto index : indices1_5) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2_5 = std::get<2>(result);
    for (auto index : indices2_5) std::cout << index << ' ';
    std::cout << std::endl;
}
