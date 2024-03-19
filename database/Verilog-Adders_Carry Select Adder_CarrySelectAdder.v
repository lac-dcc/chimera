/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/


// Full Adder
module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor #(2) (w0, a, b);
  xor #(2) (sum, w0, cin);
  
  and #(1) (w1, w0, cin);
  and #(1) (w2, a, b);
  or #(1) (cout, w1, w2);
endmodule


// Ripple Carry Adder with cin - 4 bits
module RCA4(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule

module MUX2to1_w1(output y, input i0, i1, s);

  wire e0, e1;
  not #(1) (sn, s);
  
  and #(1) (e0, i0, sn);
  and #(1) (e1, i1, s);
  
  or #(1) (y, e0, e1);
  
endmodule

module MUX2to1_w4(output [3:0] y, input [3:0] i0, i1, input s);

  wire [3:0] e0, e1;
  not #(1) (sn, s);
  
  and #(1) (e0[0], i0[0], sn);
  and #(1) (e0[1], i0[1], sn);
  and #(1) (e0[2], i0[2], sn);
  and #(1) (e0[3], i0[3], sn);
      
  and #(1) (e1[0], i1[0], s);
  and #(1) (e1[1], i1[1], s);
  and #(1) (e1[2], i1[2], s);
  and #(1) (e1[3], i1[3], s);
  
  or #(1) (y[0], e0[0], e1[0]);
  or #(1) (y[1], e0[1], e1[1]);
  or #(1) (y[2], e0[2], e1[2]);
  or #(1) (y[3], e0[3], e1[3]);
  
endmodule

// Carry Select Adder - 8 bits
module CSelA8(output [7:0] sum, output cout, input [7:0] a, b);

  wire [7:0] sum0, sum1;
  wire c1;

  RCA4 rca0_0(sum0[3:0], cout0_0, a[3:0], b[3:0], 0);
  RCA4 rca0_1(sum1[3:0], cout0_1, a[3:0], b[3:0], 1);
  MUX2to1_w4 mux0_sum(sum[3:0], sum0[3:0], sum1[3:0], 0);
  MUX2to1_w1 mux0_cout(c1, cout0_0, cout0_1, 0);

  RCA4 rca1_0(sum0[7:4], cout1_0, a[7:4], b[7:4], 0);
  RCA4 rca1_1(sum1[7:4], cout1_1, a[7:4], b[7:4], 1);
  MUX2to1_w4 mux1_sum(sum[7:4], sum0[7:4], sum1[7:4], c1);
  MUX2to1_w1 mux1_cout(cout, cout1_0, cout1_1, c1);
  
endmodule

// Carry Select Adder - 16 bits
module CSelA16(output [15:0] sum, output cout, input [15:0] a, b);

  wire [15:0] sum0, sum1;
  wire c1, c2, c3;

  RCA4 rca0_0(sum0[3:0], cout0_0, a[3:0], b[3:0], 0);
  RCA4 rca0_1(sum1[3:0], cout0_1, a[3:0], b[3:0], 1);
  MUX2to1_w4 mux0_sum(sum[3:0], sum0[3:0], sum1[3:0], 0);
  MUX2to1_w1 mux0_cout(c1, cout0_0, cout0_1, 0);

  RCA4 rca1_0(sum0[7:4], cout1_0, a[7:4], b[7:4], 0);
  RCA4 rca1_1(sum1[7:4], cout1_1, a[7:4], b[7:4], 1);
  MUX2to1_w4 mux1_sum(sum[7:4], sum0[7:4], sum1[7:4], c1);
  MUX2to1_w1 mux1_cout(c2, cout1_0, cout1_1, c1);
  
  RCA4 rca2_0(sum0[11:8], cout2_0, a[11:8], b[11:8], 0);
  RCA4 rca2_1(sum1[11:8], cout2_1, a[11:8], b[11:8], 1);
  MUX2to1_w4 mux2_sum(sum[11:8], sum0[11:8], sum1[11:8], c2);
  MUX2to1_w1 mux2_cout(c3, cout2_0, cout2_1, c1);

  RCA4 rca3_0(sum0[15:12], cout3_0, a[15:12], b[15:12], 0);
  RCA4 rca3_1(sum1[15:12], cout3_1, a[15:12], b[15:12], 1);
  MUX2to1_w4 mux3_sum(sum[15:12], sum0[15:12], sum1[15:12], c3);
  MUX2to1_w1 mux3_cout(cout, cout3_0, cout3_1, c1);

endmodule

// Carry Select Adder - 32 bits
module CSelA32(output [31:0] sum, output cout, input [31:0] a, b);

  wire [31:0] sum0, sum1;
  wire [7:1] c;
  wire [7:0] cout0, cout1;

  RCA4 rca0_0(sum0[3:0], cout0[0], a[3:0], b[3:0], 0);
  RCA4 rca0_1(sum1[3:0], cout1[0], a[3:0], b[3:0], 1);
  MUX2to1_w4 mux0_sum(sum[3:0], sum0[3:0], sum1[3:0], 0);
  MUX2to1_w1 mux0_cout(c[1], cout0[0], cout1[0], 0);

  RCA4 rca_other_0[6:1](sum0[27:4], cout0[6:1], a[27:4], b[27:4], 1'b0);
  RCA4 rca_other_1[6:1](sum1[27:4], cout1[6:1], a[27:4], b[27:4], 1'b1);
  MUX2to1_w4 mux_other_sum[6:1](sum[27:4], sum0[27:4], sum1[27:4], c[6:1]);
  MUX2to1_w1 mux_other_cout[6:1](c[7:2], cout0[6:1], cout1[6:1], c[6:1]);

  RCA4 rca_last_0(sum0[31:28], cout0[7], a[31:28], b[31:28], 0);
  RCA4 rca_last_1(sum1[31:28], cout1[7], a[31:28], b[31:28], 1);
  MUX2to1_w4 mux_last_sum(sum[31:28], sum0[31:28], sum1[31:28], c[7]);
  MUX2to1_w1 mux_last_cout(cout, cout0[7], cout1[7], c[7]);

endmodule

// Carry Select Adder - 64 bits
module CSelA64(output [63:0] sum, output cout, input [63:0] a, b);

  wire [63:0] sum0, sum1;
  wire [15:1] c;
  wire [15:0] cout0, cout1;

  RCA4 rca0_0(sum0[3:0], cout0[0], a[3:0], b[3:0], 0);
  RCA4 rca0_1(sum1[3:0], cout1[0], a[3:0], b[3:0], 1);
  MUX2to1_w4 mux0_sum(sum[3:0], sum0[3:0], sum1[3:0], 0);
  MUX2to1_w1 mux0_cout(c[1], cout0[0], cout1[0], 0);

  RCA4 rca_other_0[14:1](sum0[59:4], cout0[14:1], a[59:4], b[59:4], 1'b0);
  RCA4 rca_other_1[14:1](sum1[59:4], cout1[14:1], a[59:4], b[59:4], 1'b1);
  MUX2to1_w4 mux_other_sum[14:1](sum[59:4], sum0[59:4], sum1[59:4], c[14:1]);
  MUX2to1_w1 mux_other_cout[14:1](c[15:2], cout0[14:1], cout1[14:1], c[14:1]);

  RCA4 rca_last_0(sum0[63:60], cout0[15], a[63:60], b[63:60], 0);
  RCA4 rca_last_1(sum1[63:60], cout1[15], a[63:60], b[63:60], 1);
  MUX2to1_w4 mux_last_sum(sum[63:60], sum0[63:60], sum1[63:60], c[15]);
  MUX2to1_w1 mux_last_cout(cout, cout0[15], cout1[15], c[15]);

endmodule