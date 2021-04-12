#include <iostream>
#include <fstream>
#include <cmath>

int main(int argc, char* argv[]) {
    std::ifstream file(argv[1]);
    std::string buf = "";
    int numIntBits = 0, numFracBits = 0, totalBits = 0;
    int startIntBit = -1, startFracBit = -1, signBit = -1; // in terms of index in bit string (not bit number)
    while (file >> buf) {
        if (buf.compare("sign") == 0) {
            signBit = totalBits;
            totalBits += 1;
        } else if (buf.compare("int") == 0) {
            file >> buf;
            startIntBit = totalBits;
            numIntBits = std::stoi(buf);
            totalBits += numIntBits;
        } else if (buf.compare("frac") == 0) {
            file >> buf;
            startFracBit = totalBits;
            numFracBits = std::stoi(buf);
            totalBits += numFracBits;
        }
    }
    
    // prompt user to enter bit string
    std::string bitString;
    while (true) {
        std::cout << "Enter bit string: ";
        std::cin >> bitString;
        if (bitString.length() != (size_t)totalBits) {
            std::cout << "Wrong number of bits." << std::endl;
        } else break;
    }

    // print corresponding real number
    int intComponent = 0;
    // startIntBit is bit number (numIntBits - 1) for integer component
    for (int i = startIntBit; i < startIntBit + numIntBits; i++) {
        if (bitString[i] == '1') {
            intComponent += std::pow(2, numIntBits - 1 - (i - startIntBit));
        }
    }

    float fracComponent = 0;
    // startFracBit is "bit number" -1 for fractional component
    for (int i = startFracBit; i < startFracBit + numFracBits; i++) {
        if (bitString[i] == '1') {
            fracComponent += std::pow(2, -1 - (i - startFracBit));
        }
    }

    float realNum = intComponent + fracComponent;
    if (bitString[signBit] == '1') realNum *= -1;
    std::cout << "Value: " << realNum << std::endl;
    
    return 0;
}