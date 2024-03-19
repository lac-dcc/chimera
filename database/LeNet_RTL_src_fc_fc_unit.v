//==================================================================================================
//  Filename      : fc_unit.v
//  Created On    : 2018-01-06 13:54:11
//  Last Modified : 2018-03-22 14:42:17
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Basic fc_unit, do bias add & ReLU, then write result to Register. 3 stage Pipeline. 
//
//
//==================================================================================================
module fc_unit(/*autoport*/
//output
			d_out,
//input
			clk,
			rst_n,
			d_in,
			b_in,
			wr_en);
	input clk;
	input rst_n;

	input [22:0] 	d_in;
	input [15:0]  	b_in;
	input			wr_en;
	output [15:0] 	d_out;



//--------------------------------
//---stage1: bias add-------------
//-------------------------------- 
wire[22:0] temp1;  
adder_23_16 adder (
  .A(d_in),      // input wire [18 : 0] A
  .B(b_in),      // input wire [15 : 0] B
  .CLK(clk),  // input wire CLK
  .S(temp1)      // output wire [18 : 0] S
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

//--------------------------------
//--stage3: Write reg-------------
//--------------------------------
reg [15:0] temp3_r;
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		temp3_r <= 0;
	end
	else if (wr_en) begin
		temp3_r <= temp2_r;
	end
end
assign d_out = temp3_r;

endmodule