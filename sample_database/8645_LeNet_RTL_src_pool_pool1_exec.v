// This program was cloned from: https://github.com/yztong/LeNet_RTL
// License: MIT License

//==================================================================================================
//  Filename      : pool1_exec.v
//  Created On    : 2018-01-02 17:16:08
//  Last Modified : 2018-03-22 14:35:40
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Pooling 1st Layer Execute Module.
//
//
//==================================================================================================

module pool1_exec(/*autoport*/
//output
			f2_rdata,
//input
			clk,
			rst_n,
			f3_wdata,
			pool1_clr);
	input  	clk;
	input  	rst_n;

	output	[95:0]	f3_wdata;	//output f3_1 ~ f3_6
	input	[95:0] 	f2_rdata;	//input  f2_1 ~ f2_6
	input 	pool1_clr;			

	wire [15:0] d_in[5:0];
	wire [15:0]	d_out[5:0];
	generate
		genvar i;
		for (i = 0; i < 6; i = i + 1)
		begin:pool_unit_gen
			pool_unit  pool_unit(/*autoinst*/
			.d_out(d_out[i]),
			.clk(clk),
			.rst_n(rst_n),
			.d_in(d_in[i]),
			.pool_clr(pool1_clr));
		
		assign d_in[i] = f2_rdata[16*i+15:16*i];
		end
	endgenerate
	assign f3_wdata = {d_out[5],d_out[4],d_out[3],d_out[2],d_out[1],d_out[0]};

endmodule 