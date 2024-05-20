// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

module FullAdder (
    input A, B, Ci,
    output Sum, Co
);

assign Sum = A ^ B ^ Ci; // Sum bit
assign Co = (A & B) | (A & Ci) | (B & Ci); // Carry out

endmodule

