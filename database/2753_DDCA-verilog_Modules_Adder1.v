// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// https://hdlbits.01xz.net/wiki/Module_add

module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire coutp;
    wire [15:0]sumtp1;
    wire [15:0]sumtp2;
// add16 a,b,cin.sum,cout
    add16 num1(a[15:0],b[15:0],0,sumtp1,coutp);
    add16 num2(a[31:16],b[31:16],coutp,sumtp2);
    assign sum = {sumtp2,sumtp1};

endmodule