#include <iostream>
#include <cmath>

int main(int argc, char* argv[]) {
    // command-line arguments error handling
    if (argc != 3) { // argv[0] is executable name
        std::cerr << "Wrong number of command-line arguments." << std::endl;
        return 1;
    } 
    std::string bitString = argv[2];
    if (bitString.length() != (size_t)atoi(argv[1])) { // if bit string length != integer provided
        std::cerr << "Bit string's length doesn't match provided length." << std::endl;
        return 1;
    }

    // bit string treated as 2's complement representation and print corresponding base-10 integer
    if (bitString[0] == '1') { // convert to absolute value binary representation if MSB is 1
        // swap 1s and 0s
        for (size_t i = 0; i < bitString.length(); i++) {
            char temp = bitString[i];
            // check to see if bit string is all 1s and 0s
            if (temp != '1' && temp != '0') {
                std::cerr << "Bit string does not consist solely of 1s and 0s." << std::endl;
                return 1;
            }
            bitString[i] = temp == '1' ? '0' : '1';
        }

        // add 1 to 1's complement and ignore carry out
        if (bitString[bitString.length() - 1] == '0') { // if LSB is 0, add 1 to LSB and done
            bitString[bitString.length() - 1] = '1';
        } else { // deal with carrying
            for (int i = bitString.length() - 1; i >= 0; i--) {
                if (bitString[i] == '0') { // done with carrying if bit is 0
                    bitString[i] = '1';
                    break;
                } else { // temp == '1'
                    bitString[i] = '0';
                }
            }
        }
    }

    // convert bit string to decimal form
    int decimal = 0;
    for (size_t i = 0; i < bitString.length(); i++) {
        decimal += (bitString[i] - '0') * std::pow(2, bitString.length() - 1 - i);
    }
    if (argv[2][0] == '1') decimal *= -1;
    std::cout << "The corresponding value is: " << decimal << std::endl;

    return 0;
}