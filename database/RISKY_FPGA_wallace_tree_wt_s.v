// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module wt_s (A,B,C,alufn);

  input [15:0] A, B;
  input alufn;
  output [31:0] C;
  wire cout;
  wire cout1;
  wire cin;
  wire [31:0] partial;
  wire change;

  wire [31:0] AB [15:0], temp1 [15:0];
  wire [15:0] temp [15:0];
  wire [31:0] s [14:0];
  wire [31:0] c [14:0];
  wire K;
  genvar i;
  generate
      for(i = 0; i < 16; i = i + 1)
      begin : and_loop
          mul #(.BITS(16)) mul0(A, B[i], temp[i]);
          assign temp1[i] = {{16{1'b0}}, temp[i]};
          assign AB[i] = {temp1[i][(31-i):0], {i{1'b0}}};
      end
  endgenerate
  assign change = alufn & B[15];
  assign cin = change ? 1'b1 : 1'b0;
  assign partial = change ? c[14]^{32{alufn}} : c[14];

  csa #(.BITS(32)) ca01(AB[0], AB[1], AB[2], s[0], c[0]);
  csa #(.BITS(32)) ca02(AB[3], AB[4], AB[5], s[1], c[1]);
  csa #(.BITS(32)) ca03(AB[6], AB[7], AB[8], s[2], c[2]);
  csa #(.BITS(32)) ca04(AB[9], AB[10], AB[11], s[3], c[3]);
  csa #(.BITS(32)) ca05(AB[12], AB[13], AB[14], s[4], c[4]);

  csa #(.BITS(32)) ca11(s[0], c[0], s[1], s[5], c[5]);
  csa #(.BITS(32)) ca12(c[1], s[2], c[2], s[6], c[6]);
  csa #(.BITS(32)) ca13(c[3], s[3], s[4], s[7], c[7]);
  csa #(.BITS(32)) ca14(c[4], s[5], AB[15], s[8], c[8]);
  csa #(.BITS(32)) ca15(s[6], c[6], s[7], s[9], c[9]);
  csa #(.BITS(32)) ca16(c[7], c[8], s[8], s[10], c[10]);

  csa #(.BITS(32)) ca17(s[9], c[9], s[10], s[11], c[11]);
  csa #(.BITS(32)) ca18(c[5], c[10], {32{1'b0}}, s[12], c[12]);
  csa #(.BITS(32)) ca19(c[11], s[11], s[12], s[13], c[13]);
  csa #(.BITS(32)) ca20(c[12], s[13], c[13], s[14], c[14]);

  carry_lookahead_adder #(.WIDTH(32)) cla1(cin,s[14],partial,C,cout1); 
  endmodule
