// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (input x, input y, output z);
    assign z = (x^y) & x;
endmodule
