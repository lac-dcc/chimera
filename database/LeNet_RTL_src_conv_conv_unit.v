//==================================================================================================
//  Filename      : conv_unit.v
//  Created On    : 2018-01-05 14:28:03
//  Last Modified : 2018-03-22 14:43:02
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Basic conv_unit to realize bias add and ReLU. The actual Mult&Add is done by DSP.
//					2 stages pipeline.
//
//==================================================================================================
module conv_unit(/*autoport*/
//output
			d_out,
//input
			clk,
			rst_n,
			d_in,
			b_in);
	input clk;
	input rst_n;
	input [22:0]  d_in;	 //conv result
	input [15:0]  b_in;  //bias
	output[15:0]  d_out; //final output


//--------------------------------
//---stage1: bias add-------------
//--------------------------------
wire [22:0] temp1;
adder_23_16 adder (
  .A(d_in),      // input wire [22 : 0] A
  .B(b_in),      // input wire [15 : 0] B
  .CLK(clk),     // input wire CLK
  .S(temp1)      // output wire [22 : 0] S
);

//--------------------------------
//---stage2: ReLU-----------------
//--------------------------------
wire[15:0] temp2;
assign temp2 = temp1[22]? 0:temp1[22:7];


reg [15:0] temp2_r;
always @(posedge clk or negedge  rst_n) begin
	if (!rst_n) begin
		// reset
		temp2_r <= 0;
	end
	else  begin
		temp2_r <= temp2;
	end
end

assign d_out = temp2_r;

endmodule 