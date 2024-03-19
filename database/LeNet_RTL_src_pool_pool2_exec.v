//==================================================================================================
//  Filename      : pool2_exec.v
//  Created On    : 2018-01-02 17:16:08
//  Last Modified : 2018-03-22 14:36:14
//  Revision      : 
//  Author        : YzTong
//  Company       : UESTC
//  Email         : yztong1994@gmail.com
//
//  Description   : Pooling 2nd Layer Execute Module.
//
//
//==================================================================================================

module pool2_exec(/*autoport*/
//output
			f5_wdata,
//input
			clk,
			rst_n,
			f4_rdata,
			pool2_clr);
	input  	clk;
	input  	rst_n;

	input	[255:0]	f4_rdata;	//input f4_1 ~ f4_16
	output	[255:0]	f5_wdata;	//output f5_1 ~ f5_16
	input 	pool2_clr;

	wire [15:0] d_in[15:0];
	wire [15:0]	d_out[15:0];
	generate
		genvar i;
		for (i = 0; i < 16; i = i + 1)
		begin:pool_unit_gen
			pool_unit  pool_unit(/*autoinst*/
			.d_out(d_out[i]),
			.clk(clk),
			.rst_n(rst_n),
			.d_in(d_in[i]),
			.pool_clr(pool2_clr));
			assign d_in[i] = f4_rdata[16*i+15:16*i];
		end
	endgenerate
	assign f5_wdata = {d_out[15],d_out[14],d_out[13],d_out[12],d_out[11],d_out[10],
		d_out[9],d_out[8],d_out[7],d_out[6],d_out[5],d_out[4],d_out[3],
		d_out[2],d_out[1],d_out[0]};
endmodule 