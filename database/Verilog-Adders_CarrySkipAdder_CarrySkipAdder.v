/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/


// Full Adder
module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor (w0, a, b);
  xor (sum, w0, cin);
  
  and (w1, w0, cin);
  and (w2, a, b);
  or (cout, w1, w2);
endmodule

// Ripple Carry Adder - 4 bits
module RCA4(output [3:0] sum, output cout, input [3:0] a, b, input cin);
  
  wire [3:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], cin);
  FA fa[2:1](sum[2:1], c[3:2], a[2:1], b[2:1], c[2:1]);
  FA fa31(sum[3], cout, a[3], b[3], c[3]);
  
endmodule

module SkipLogic(output cin_next,
  input [3:0] a, b, input cin, cout);
  
  wire p0, p1, p2, p3, P, e;
  
  or (p0, a[0], b[0]);
  or (p1, a[1], b[1]);
  or (p2, a[2], b[2]);
  or (p3, a[3], b[3]);
  
  and (P, p0, p1, p2, p3);
  and (e, P, cin);
  
  or (cin_next, e, cout);

endmodule

// Carry Skip Adder - 8 bits
module CSkipA8(output [7:0] sum, output cout, input [7:0] a, b);
  
  wire cout0, cout1, e;
  
  RCA4 rca0(sum[3:0], cout0, a[3:0], b[3:0], 0);
  RCA4 rca1(sum[7:4], cout1, a[7:4], b[7:4], e);
  
  SkipLogic skip0(e, a[3:0], b[3:0], 0, cout0);
  SkipLogic skip1(cout, a[7:4], b[7:4], e, cout1);
  
endmodule

// Carry Skip Adder - 16 bits
module CSkipA16(output [15:0] sum, output cout, input [15:0] a, b);
  
  wire [3:0] couts;
  wire [2:0] e; 
  
  RCA4 rca0(sum[3:0], couts[0], a[3:0], b[3:0], 0);
  RCA4 rca[3:1](sum[15:4], couts[3:1], a[15:4], b[15:4], e[2:0]);
  
  SkipLogic skip0(e[0], a[3:0], b[3:0], 0, couts[0]);
  SkipLogic skip[2:1](e[2:1], a[11:4], b[11:4], e[1:0], couts[2:1]);
  SkipLogic skip3(cout, a[15:12], b[15:12], e[2], couts[3]);

endmodule

// Carry Skip Adder - 32 bits
module CSkipA32(output [31:0] sum, output cout, input [31:0] a, b);
  
  wire [7:0] couts;
  wire [6:0] e;
  
  RCA4 rca0(sum[3:0], couts[0], a[3:0], b[3:0], 0);
  RCA4 rca[7:1](sum[31:4], couts[7:1], a[31:4], b[31:4], e[6:0]);
  
  SkipLogic skip0(e[0], a[3:0], b[3:0], 0, couts[0]);
  SkipLogic skip[6:1](e[6:1], a[27:4], b[27:4], e[5:0], couts[6:1]);
  SkipLogic skip7(cout, a[31:28], b[31:24], e[6], couts[7]);

endmodule

// Carry Skip Adder - 64 bits
module CSkipA64(output [63:0] sum, output cout, input [63:0] a, b);
  
  wire [15:0] couts;
  wire [14:0] e;
  
  RCA4 rca0(sum[3:0], couts[0], a[3:0], b[3:0], 0);
  RCA4 rca[15:1](sum[63:4], couts[15:1], a[63:4], b[63:4], e[14:0]);
  
  SkipLogic skip0(e[0], a[3:0], b[3:0], 0, couts[0]);
  SkipLogic skip[14:1](e[14:1], a[59:4], b[59:4], e[13:0], couts[14:1]);
  SkipLogic skip15(cout, a[63:60], b[63:60], e[14], couts[15]);
  
endmodule