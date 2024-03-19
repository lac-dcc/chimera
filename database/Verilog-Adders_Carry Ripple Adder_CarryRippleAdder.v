/* (c) Krishna Subramanian <https://github.com/mongrelgem>
 * For Issues & Bugs, report to <https://github.com/mongrelgem/Verilog-Adders/issues>
*/

// Full Adder
module FA(output sum, cout, input a, b, cin);
  wire w0, w1, w2;
  
  xor  (w0, a, b);
  xor  (sum, w0, cin);
  
  and  (w1, w0, cin);
  and  (w2, a, b);
  or  (cout, w1, w2);
endmodule

// Ripple Carry Adder - 8 bits
module RCA8(output [7:0] sum, output cout, input [7:0] a, b);
  
  wire [7:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], 0);
  FA fa[6:1](sum[6:1], c[7:2], a[6:1], b[6:1], c[6:1]);
  FA fa31(sum[7], cout, a[7], b[7], c[7]);
  
endmodule

// Ripple Carry Adder - 16 bits
module RCA16(output [15:0] sum, output cout, input [15:0] a, b);
  
  wire [15:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], 0);
  FA fa[14:1](sum[14:1], c[15:2], a[14:1], b[14:1], c[14:1]);
  FA fa31(sum[15], cout, a[15], b[15], c[15]);

endmodule

// Ripple Carry Adder - 32 bits
module RCA32(output [31:0] sum, output cout, input [31:0] a, b);

  wire [31:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], 0);
  FA fa[30:1](sum[30:1], c[31:2], a[30:1], b[30:1], c[30:1]);
  FA fa31(sum[31], cout, a[31], b[31], c[31]);
    
endmodule

// Ripple Carry Adder - 64 bits
module RCA64(output [63:0] sum, output cout, input [63:0] a, b);

  wire [63:1] c;
  
  FA fa0(sum[0], c[1], a[0], b[0], 0);
  FA fa[62:1](sum[62:1], c[63:2], a[62:1], b[62:1], c[62:1]);
  FA fa31(sum[63], cout, a[63], b[63], c[63]);

endmodule