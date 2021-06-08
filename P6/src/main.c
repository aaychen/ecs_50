#include <stdint.h>

volatile int global = 42;
volatile uint32_t controller_status = 0;

volatile char *VIDEO_MEMORY = (volatile char *)(0x50000000 + 0xFE800);
int main() {
    int a = 4;
    int b = 12;
    int last_global = 42;
    int x_pos;

    // screen = 64 columns, 36 rows
    int numCols = 64, numRows = 36;
    for (int col = 0; col < numCols; col++) {
        for (int row = 0; row < numRows; row++) {
            if (row == 1 && col == 1) { // top-left starting point
                VIDEO_MEMORY[col + row * numCols] = 'X';
                x_pos = col + row * numCols;
            } else if (row == 0 || row == numRows-1) {  // top or bottom row
                VIDEO_MEMORY[col + row * numCols] = '=';
            } else if (col == 0 || col == numCols-1) { // left or right column
                VIDEO_MEMORY[col + row * numCols] = '|';
            } else {
                VIDEO_MEMORY[col + row * numCols] = '.';
            }
        }
    }

    while (1) {
        int c = a + b + global;
        if(global != last_global){
            if(controller_status){
                VIDEO_MEMORY[x_pos] = ' ';
                if(controller_status & 0x10){ // check bit 4 of controller status (B1D, default: u)
                    if((x_pos & 0x3F) != 0x1) { // check left border; if 0x1, then user in second column
                        x_pos--; // move left
                    }
                }
                if(controller_status & 0x20){ // check bit 5 of controller status (B2D, default: i)
                    if(x_pos >= 0x40 + 0x40){ // check top border; 0x40 + 0x40 starts third row
                        x_pos -= 0x40; // move up
                    }
                }
                if(controller_status & 0x40){ // check bit 6 of controller status (B3D, default: j)
                    if(x_pos < 0x8C0 - 0x40){ // check bottom border; 0x8C0 - 0x40 starts second-last row
                        x_pos += 0x40; // move down
                    }
                }
                if(controller_status & 0x80){ // check bit 7 of controller status (B4D, default: k)
                    if((x_pos & 0x3F) != (0x3F - 0x1)){ // check right border; if 0x3F - 0x1, then user in second-last column
                        x_pos++; // move right
                    }
                }
                VIDEO_MEMORY[x_pos] = 'X';
            }
            last_global = global;
        }
    }
    return 0;
}
