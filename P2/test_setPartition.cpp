#include "prog2.hpp"

#include <iostream>

int main()
{
    std::cout << std::boolalpha;
    std::vector<int> vals{-8, 1000, -988, -6, 2, -24};
    auto result = isSetPartionable(vals);
    auto& indices1 = std::get<1>(result);
    for (auto index : indices1) std::cout << index << ' ';
    std::cout << std::endl;
    auto& indices2 = std::get<2>(result);
    for (auto index : indices2) std::cout << index << ' ';
    std::cout << std::endl;
}
