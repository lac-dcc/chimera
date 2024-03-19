`timescale 1ns / 1ps

// ALU for processor
// 
//  +-----------+------------+------+
//  | Operation | ALUFN[5:0] | hex  |
//  +-----------+------------+------+
//  | ADD       |     000000 | 0x00 |
//  | SUB       |     000001 | 0x01 |
//  | MUL       |     000010 | 0x02 |
//  | AND       |     011000 | 0x18 |
//  | OR        |     011110 | 0x1E |
//  | XOR       |     010110 | 0x16 |
//  | “A”(LDR)  |     011010 | 0x1A |
//  | SHL       |     100000 | 0x20 |
//  | SHR       |     100001 | 0x21 |   *N/A*
//  | SRA       |     100011 | 0x23 |
//  | CMPEQ     |     110011 | 0x33 |
//  | CMPLT     |     110101 | 0x35 |
//  | CMPLE     |     110111 | 0x37 |
//  +-----------+------------+------+

module Alu
  (
   input wire [5:0]  alufn,
   input wire [31:0] a,
   input wire [31:0] b,

   output reg [31:0] alu,
   output wire 	     z,
   output wire 	     v,
   output wire 	     n
   );

   wire [31:0] 	     asRes, cmpRes, shftRes, boolRes, mulRes;

   AddSub as_inst_0(.alufn0(alufn[0]), .a(a), .b(b), .s(asRes), .z(z), .v(v), .n(n));
   CmpModule cmp_inst_0(.alufn(alufn[2:1]), .a(a), .b(b), .cmp(cmpRes));
   LogicModule log_inst_0(.alufn(alufn), .a(a), .b(b), .res(boolRes));
   ShifterModule shft_inst_0(.alufn(alufn[1:0]), .a(a), .b(b[4:0]), .res(shftRes));
   MultModule mult_inst_0(.a(a), .b(b), .res(mulRes));

   always @(*) begin
       #3
         casex (alufn)
           6'b00xx0x: 
             alu = asRes;
           6'b00xx1x: 
             alu = mulRes;
           6'b01xxxx: 
             alu = boolRes;
           6'b10xxxx: 
             alu = shftRes;
           6'b11xxxx: 
             alu = cmpRes;
           default:
             alu = 32'h00000000;
         endcase        
   end
endmodule

module AddSub
  (
   input wire 	      alufn0,
   input wire [31:0]  a,
   input wire [31:0]  b,

   output wire [31:0] s,
   output wire 	      z,
   output wire 	      v,
   output wire 	      n
   );

   wire [31:0] 	      xb;

   integer 	      i = 0;
   
   assign xb = b ^ {32{alufn0}};
   assign s = a + xb + alufn0;
   assign z = (s == 32'h00000000);
   assign v = (a[31] & xb[31] & (~s[31])) + ((~a[31]) & (~xb[31]) & s[31]);
   assign n = s[31]; 

endmodule

module CmpModule
  (
   input wire [2:1]  alufn,
   input wire [31:0] a,
   input wire [31:0] b,

   output reg [31:0] cmp
   );
   wire [31:0] 	     s;
   wire 	     z;
   wire 	     v;
   wire 	     n;

   AddSub add_sub_inst_0
     ( 
       .alufn0(1'b1), .a(a), .b(b), .s(s), .z(z), .v(v), .n(n)
       );

   // Calculate LSB using combination of z, v, n and alufn[2:1]
   always @(alufn, z, v, n) begin
       if (alufn[2:1] == 2'b01) begin  // A == B
           cmp = {{31{1'b0}}, {z}};
       end else if (alufn[2:1] == 2'b10) begin // A < B
          cmp = {{31{1'b0}}, {n^v}};
       end else if (alufn[2:1] == 2'b11) begin // A <= B
          cmp = {{31{1'b0}}, {z | (n ^ v)}};
       end else begin
      	  cmp = 32'h00000000;
       end
   end

endmodule

module LogicModule
  (
   input wire [5:0]  alufn,
   input wire [31:0] a,
   input wire [31:0] b,

   output reg [31:0] res
   );

   integer 	     i = 0;

   always @(alufn[3:0], a, b) begin
       for (i = 0; i < 32; i = i + 1) begin
           res[i] = alufn[{{a[i]}, {b[i]}}];
       end 
   end

endmodule

module ShifterModule
  (
   input [1:0] 	       alufn,
   input signed [31:0] a,
   input signed [4:0]  b,

   output reg [31:0]   res
   );

   always @(alufn[1:0], a, b[4:0]) begin
       case (alufn[1:0])
         2'b00: 
           res = a << b[4:0];
         2'b01: 
           res = a >> b[4:0];
         2'b10: 
           res = a;
         2'b11: 
           res = a >>> b[4:0];
       endcase // case (alufn[1:0])
   end // always @ (alufn[1:0], a, b[4:0])
   
endmodule

module MultModule 
  (
   input wire [31:0]  a,
   input wire [31:0]  b,

   output wire [31:0] res
   );

   assign res = a * b;

endmodule
