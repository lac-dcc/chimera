// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../half_adder/half_adder.v"
`include "../bitwise/bitwise.v"
`include "../csa/csa.v"
`include "../mul/mul.v"
`include "../rdcla/rdcla.v"

module WallaceTreeMul (A,B,C);

  input [31:0] A, B;
  output [63:0] C;
  wire cout;
  wire cout1;


    wire [63:0] AB [31:0], temp1 [31:0];
    wire [31:0] temp [31:0];
    wire [63:0] s [30:0];
    wire [63:0] c [30:0];
    wire K;
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1)
        begin : and_loop
            mul #(.BITS(32)) mul0(A, B[i], temp[i]);
            assign temp1[i] = {{32{1'b0}}, temp[i]};
            assign AB[i] = temp1[i] << i;
        end
    endgenerate

    csa ca01(AB[0], AB[1], AB[2], s[0], c[0]);
    csa ca02(AB[3], AB[4], AB[5], s[1], c[1]);
    csa ca03(AB[6], AB[7], AB[8], s[2], c[2]);
    csa ca04(AB[9], AB[10], AB[11], s[3], c[3]);
    csa ca05(AB[12], AB[13], AB[14], s[4], c[4]);
    csa ca06(AB[15], AB[16], AB[17], s[5], c[5]);
    csa ca07(AB[18], AB[19], AB[20], s[6], c[6]);
    csa ca08(AB[21], AB[22], AB[23], s[7], c[7]);
    csa ca09(AB[24], AB[25], AB[26], s[8], c[8]);
    csa ca10(AB[27], AB[28], AB[29], s[9], c[9]);
    csa ca11(s[0], c[0], s[1], s[10], c[10]);
    csa ca12(c[1], s[2], c[2], s[11], c[11]);
    csa ca13(c[3], s[3], s[4], s[12], c[12]);
    csa ca14(c[4], s[5], c[5], s[13], c[13]);
    csa ca15(s[6], c[6], s[7], s[14], c[14]);
    csa ca16(c[7], c[8], s[8], s[15], c[15]);
    csa ca17(s[9], c[9], AB[30], s[16], c[16]);
    csa ca18(s[10], c[10], s[11], s[17], c[17]);
    csa ca19(c[11], s[12], c[12], s[18], c[18]);
    csa ca20(c[13], s[13], s[14], s[19], c[19]);
    csa ca21(c[14], c[15], s[15], s[20], c[20]);
    csa ca22(s[16], c[16], AB[31], s[21], c[21]);
    csa ca23(s[17], c[17], s[18], s[22], c[22]);
    csa ca24(c[18], s[19], c[19], s[23], c[23]);
    csa ca25(c[20], s[20], s[21], s[24], c[24]);
    csa ca26(s[22], c[22], s[23], s[25], c[25]);
    csa ca27(c[23], s[24], c[24], s[26], c[26]);

    csa ca28(c[25], s[25], s[26], s[27], c[27]);
    csa ca29(c[26], c[21], {64{1'b0}}, s[28], c[28]);
    csa ca30(s[27], c[27], s[28], s[29], c[29]);
    csa ca31(c[28], s[29], c[29], s[30], c[30]);

    RecursiveDoubling cla1(s[30][31:0],c[30][31:0],1'b0,C[31:0],cout);
    RecursiveDoubling cla2(s[30][63:32],c[30][63:32],cout,C[63:32],cout1);

    endmodule
