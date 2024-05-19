// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : pool_unit.v
//  Created On    : 2018-01-02 18:58:30
//  Last Modified : 2018-03-22 14:42:27
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Basic max-pooling unit.
//
//
//==================================================================================================
module pool_unit(/*autoport*/
//output
			d_out,
//input
			clk,
			rst_n,
			d_in,
			pool_clr);
	input  	clk;
	input  	rst_n;

	input 	pool_clr;
	input 	[15:0]	d_in;
	output 	[15:0]	d_out;

//------------------------------
//------stage1: compare---------
//------------------------------
wire [15:0] temp;
assign temp = (temp_r >d_in )? temp_r:d_in;


reg [15:0] temp_r;
always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		// reset
		temp_r <= 0;
	end
	else if (pool_clr) begin
		temp_r <= d_in;
	end
	else begin
		temp_r <= temp;
	end	
end


//------------------------------
//------output to external------
//------------------------------

assign d_out = temp_r;


endmodule 