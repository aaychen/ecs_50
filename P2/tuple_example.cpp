#include <iostream>
#include <tuple>

int main()
{
    std::tuple<int, bool, int, float> t1{5, true, 18, -89.34};
    std::cout << std::get<0>(t1) << '\n';
    std::cout << std::get<3>(t1) << '\n';

    // Can use parentheses instead of braced initialization when invoking the
    // constructor, if that's what you prefer.
    std::tuple<int, std::string> t2(5, "abc");
    std::cout << std::get<1>(t2) << '\n';
    // If the tuple only contains unique types, then you can access by type
    // instead of by element.
    std::cout << std::get<int>(t2) << '\n';
    std::cout << std::get<std::string>(t2) << '\n';

    // Can assign or manipulate referencnes to specific elements.
    std::get<int>(t2) = 18;
    std::string& str = std::get<std::string>(t2);
    str[2] = 'X';
    std::cout << std::get<int>(t2) << '\n';
    std::cout << std::get<std::string>(t2) << '\n';
}
