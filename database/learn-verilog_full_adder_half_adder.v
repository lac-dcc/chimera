// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

/*
Half Adder:

a  b  cout sum
--------------
0 + 0 = 0  0
0 + 1 = 0  1
1 + 0 = 0  1
1 + 1 = 1  0

*/

module half_adder(
    input a,
    input b,
    output cout,
    output sum
);
    assign cout = a & b;
    assign sum = a ^ b;
endmodule
