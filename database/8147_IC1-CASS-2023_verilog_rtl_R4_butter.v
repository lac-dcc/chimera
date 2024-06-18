// This program was cloned from: https://github.com/unic-cass/IC1-CASS-2023
// License: Apache License 2.0

// R4_BUTTERFLY [VER 1.6]

module R4_butter ( 

`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif 

input [3:0] xr0,xi0, xr1,xi1, xr2,xi2, xr3,xi3,
output [3:0] Xro,Xio,
input c1,c2,c3,
input CLK, RST,
 output [7:0] la_oenb);

wire [3:0] m0,m1,m2,m3,s0,s1,s2,s3;
wire m4;
wire [3:0] Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14;

assign la_oenb = 8'b00000000;

addsub a0(.A(m0), .B(Q5), .ADD_SUB(c2), .SUM(s0)); 
addsub a1(.A(m2), .B(Q11), .ADD_SUB(c2), .SUM(s1)); 
addsub a2(.A(m1), .B(Q6), .ADD_SUB(c3), .SUM(s2)); 
addsub a3(.A(m3), .B(Q12), .ADD_SUB(c3), .SUM(s3)); 
addsub b0(.A(s0), .B(s1), .ADD_SUB(m4), .SUM(Q13)); 
addsub b1(.A(s3), .B(s2), .ADD_SUB(m4), .SUM(Q14)); 

mux2 mux0(.out(m0),.in0(Q1),.in1(Q2),.cont(c1)); 
mux2 mux1(.out(m1),.in0(Q3),.in1(Q4),.cont(c1)); 
mux2 mux2(.out(m2),.in0(Q7),.in1(Q8),.cont(c1)); 
mux2 mux3(.out(m3),.in0(Q9),.in1(Q10),.cont(c1)); 
XOR xor1(.Y(m4),.A(c2),.B(c3)); 

//FF at the inputs
DFF DFF1  (.Q(Q1), .D(xr0), .CLOCK(CLK), .RESET(RST)); //mux0(in0)
DFF DFF2  (.Q(Q2), .D(xi0), .CLOCK(CLK), .RESET(RST)); //mux0(in1)
DFF DFF3  (.Q(Q3), .D(xi0), .CLOCK(CLK), .RESET(RST)); //mux1(in0)
DFF DFF4  (.Q(Q4), .D(xr0), .CLOCK(CLK), .RESET(RST)); //mux1(in1)
DFF DFF5  (.Q(Q5), .D(xr1), .CLOCK(CLK), .RESET(RST)); //a0(B)
DFF DFF6  (.Q(Q6), .D(xi1), .CLOCK(CLK), .RESET(RST)); //a2(B)
DFF DFF7  (.Q(Q7), .D(xr2), .CLOCK(CLK), .RESET(RST)); //mux2(in0)
DFF DFF8  (.Q(Q8), .D(xi2), .CLOCK(CLK), .RESET(RST)); //mux2(in1)
DFF DFF9  (.Q(Q9), .D(xi2), .CLOCK(CLK), .RESET(RST)); //mux3(in0)
DFF DFF10 (.Q(Q10), .D(xr2), .CLOCK(CLK), .RESET(RST)); //mux3(in1)
DFF DFF11 (.Q(Q11), .D(xr2), .CLOCK(CLK), .RESET(RST)); //a1(B)
DFF DFF12 (.Q(Q12), .D(xi2), .CLOCK(CLK), .RESET(RST)); //a3(B)

//FF at the outputs
DFF DFF13  (.Q(Xro), .D(Q13), .CLOCK(CLK), .RESET(RST)); //b0(SUM)
DFF DFF14  (.Q(Xio), .D(Q14), .CLOCK(CLK), .RESET(RST)); //b1(SUM)

endmodule


module addsub(A, B, ADD_SUB, SUM);

   input [3:0] A;
   input [3:0] B;
   input ADD_SUB;
   output [3:0] SUM;
   wire c,d;
 
   assign c = A + B;
   assign d = A - B;
   assign SUM = ADD_SUB ? c : d;
   
   
endmodule
module XOR(Y, A, B);
  input A;
  input B;
  output Y;

  assign Y= A^B;
  
  endmodule
  
  
module mux2(out, in0, in1, cont);

  input [3:0] in0;
  input [3:0] in1;
  input cont;
  output [3:0] out;

  assign out = cont ? in1:in0;

endmodule

module DFF (
D   , // Data Input
CLOCK    , // Clock Input
RESET  , // Reset input
Q        // Q output
);

  input [3:0] D;
  input CLOCK, RESET;
  output [3:0] Q;
  reg [3:0] Q;

  always @(posedge CLOCK)
    if (~RESET) begin
  Q <= 4'b0000;
end  else begin
  Q <= D;
end

endmodule