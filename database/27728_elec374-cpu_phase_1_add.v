// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License


module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout 
);

assign sum = (a ^ b) ^ cin;

assign cout = ((a ^ b) & cin) | (a & b);

endmodule


// 32 bit ripple carry adder
module add(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

// Internal carry wires to connect the full adders
wire [30:0] carry;

// Instantiate the full adders
full_adder fa0(a[0], b[0], cin, sum[0], carry[0]);
full_adder fa1(a[1], b[1], carry[0], sum[1], carry[1]);
full_adder fa2(a[2], b[2], carry[1], sum[2], carry[2]);
full_adder fa3(a[3], b[3], carry[2], sum[3], carry[3]);
full_adder fa4(a[4], b[4], carry[3], sum[4], carry[4]);
full_adder fa5(a[5], b[5], carry[4], sum[5], carry[5]);
full_adder fa6(a[6], b[6], carry[5], sum[6], carry[6]);
full_adder fa7(a[7], b[7], carry[6], sum[7], carry[7]);
full_adder fa8(a[8], b[8], carry[7], sum[8], carry[8]);
full_adder fa9(a[9], b[9], carry[8], sum[9], carry[9]);
full_adder fa10(a[10], b[10], carry[9], sum[10], carry[10]);
full_adder fa11(a[11], b[11], carry[10], sum[11], carry[11]);
full_adder fa12(a[12], b[12], carry[11], sum[12], carry[12]);
full_adder fa13(a[13], b[13], carry[12], sum[13], carry[13]);
full_adder fa14(a[14], b[14], carry[13], sum[14], carry[14]);
full_adder fa15(a[15], b[15], carry[14], sum[15], carry[15]);
full_adder fa16(a[16], b[16], carry[15], sum[16], carry[16]);
full_adder fa17(a[17], b[17], carry[16], sum[17], carry[17]);
full_adder fa18(a[18], b[18], carry[17], sum[18], carry[18]);
full_adder fa19(a[19], b[19], carry[18], sum[19], carry[19]);
full_adder fa20(a[20], b[20], carry[19], sum[20], carry[20]);
full_adder fa21(a[21], b[21], carry[20], sum[21], carry[21]);
full_adder fa22(a[22], b[22], carry[21], sum[22], carry[22]);
full_adder fa23(a[23], b[23], carry[22], sum[23], carry[23]);
full_adder fa24(a[24], b[24], carry[23], sum[24], carry[24]);
full_adder fa25(a[25], b[25], carry[24], sum[25], carry[25]);
full_adder fa26(a[26], b[26], carry[25], sum[26], carry[26]);
full_adder fa27(a[27], b[27], carry[26], sum[27], carry[27]);
full_adder fa28(a[28], b[28], carry[27], sum[28], carry[28]);
full_adder fa29(a[29], b[29], carry[28], sum[29], carry[29]);
full_adder fa30(a[30], b[30], carry[29], sum[30], carry[30]);
full_adder fa31(a[31], b[31], carry[30], sum[31], cout);


endmodule