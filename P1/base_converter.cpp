#include <iostream>
#include <cmath>

int main() {
    int base, newBase;
    std::string val;
    std::cout << "Enter initial base: ";
    std::cin >> base;
    std::cout << "Enter base-" << base << " representation: ";
    std::cin >> val;
    std::cout << "Enter desired base: ";
    std::cin >> newBase;

    // convert to decimal form
    int decimal = 0;
    for (size_t i = 0; i < val.length(); i++) {
        if ('0' <= val[i] && val[i] <= '9') {
            decimal += (val[i] - '0') * std::pow(base, val.length() - 1 - i);
        } else { // handle A-F
            decimal += (val[i] - 'A' + 10) * std::pow(base, val.length() - 1 - i);
        }
    }

    // convert decimal form to newBase form
    std::string newVal = "";
    while (decimal != 0) {
        int temp = decimal % newBase;
        if (0 <= temp && temp <= 9) {
            newVal.insert(0, std::to_string(temp));
        } else { // if temp >= 10, use A-F as needed
            newVal.insert(0, 1, char(temp - 10 + 'A'));
        }
        decimal /= newBase;
    }

    std::cout << "Base-" << newBase << " representation: " << newVal << std::endl;
    return 0;
}
