//==================================================================================================
//  Filename      : channel_adder.v
//  Created On    : 2018-01-02 15:21:12
//  Last Modified : 2018-03-22 14:31:24
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Input Feature Channel Adder. Three stage Pipelined.
//
//
//==================================================================================================
module channel_adder(/*autoport*/
//output
			result,
//input
			clk,
			rst_n,
			d1,
			d2,
			d3,
			d4,
			d5,
			d6);
	input clk;
	input rst_n;
	input [22:0] d1;
	input [22:0] d2;
	input [22:0] d3;
	input [22:0] d4;
	input [22:0] d5;
	input [22:0] d6;
	
	output [22:0] result;

//stage1: add
wire [22:0] s1,s2,s3;
adder_23_23 adder1 (
  .A(d1),      // input wire [18 : 0] A
  .B(d2),      // input wire [18 : 0] B
  .CLK(clk),  // input wire CLK
  .S(s1)      // output wire [18 : 0] S
);
adder_23_23 adder2 (
  .A(d3),      // input wire [18 : 0] A
  .B(d4),      // input wire [18 : 0] B
  .CLK(clk),  // input wire CLK
  .S(s2)      // output wire [18 : 0] S
);
adder_23_23 adder3 (
  .A(d5),      // input wire [18 : 0] A
  .B(d6),      // input wire [18 : 0] B
  .CLK(clk),  // input wire CLK
  .S(s3)      // output wire [18 : 0] S
);

//stage2: add
wire [22:0] s2_1;
reg  [22:0] s2_2;
adder_23_23 adder4 (
  .A(s1),      // input wire [18 : 0] A
  .B(s2),      // input wire [18 : 0] B
  .CLK(clk),  // input wire CLK
  .S(s2_1)      // output wire [18 : 0] S
);
always@(posedge clk)begin
  s2_2 <= s3;
end
//stage3: add
adder_23_23 adder5 (
  .A(s2_1),      // input wire [18 : 0] A
  .B(s2_2),      // input wire [18 : 0] B
  .CLK(clk),  // input wire CLK
  .S(result)      // output wire [18 : 0] S
);

endmodule  