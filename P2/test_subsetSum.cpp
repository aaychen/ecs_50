#include "prog2.hpp"

#include <iostream>

int main()
{
    std::cout << std::boolalpha;
    std::vector<int> vals1{5, 4, 12, -3, 10};
    auto result = isSubsetSum(vals1, 6);
    std::cout << std::get<bool>(result) << '\n';
    auto& indices1 = std::get<std::vector<unsigned>>(result);
    for (auto index : indices1) std::cout << index << ' ';
    std::cout << '\n';
    std::cout << "===\n";
    result = isSubsetSum(vals1, -5);
    std::cout << std::get<0>(result) << '\n';
    std::cout << "===\n";
    std::vector<int> vals2{20, 15, 10};
    result = isSubsetSum(vals2, 45);
    auto& indices2 = std::get<1>(result);
    for (auto index : indices2) std::cout << index << ' ';
    std::cout << std::endl;
    std::cout << "===\n";
    std::vector<int> vals3{8, 17, 2, 9, 3, 4, 5, 20, 15, -5, -8, 6,
                           101, 200, 300, 400};
    result = isSubsetSum(vals3, 87);
    std::cout << std::get<0>(result) << '\n';
    auto& indices3 = std::get<1>(result);
    for (auto index : indices3) std::cout << index << ' ';
    std::cout << std::endl;
}
