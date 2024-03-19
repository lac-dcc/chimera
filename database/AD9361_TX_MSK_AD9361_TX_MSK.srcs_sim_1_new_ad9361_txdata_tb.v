`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/20 09:50:56
// Design Name: 
// Module Name: ad9361_txdata_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ad9361_txdata_tb;

reg 					sys_rst;
reg 					fb_clk;
// reg		signed [11:0] 	bb_i_path;	
// reg 	signed [11:0] 	bb_q_path;
wire 	signed [11:0] 	bb_iq;
wire 					tx_frame;

wire 	signed [11:0]	i_path;
wire 	signed [11:0]	q_path;

bb_iq_generator #(.DATA_SIZE(3600),.ADDR_WIDTH(12))
bb_iq_generator_inst 
(
	.rst(sys_rst),
	.clk(fb_clk),
	.i_path(i_path),
	.q_path(q_path)
);

ad9361_txdata ad9361_txdata_inst(
	.sys_rst(sys_rst),		// system reset from FPGA
	.fb_clk(fb_clk),			// feedback from DATA_CLK

	.bb_i_path(i_path),		// baseband i path
	.bb_q_path(q_path),		// baseband q path
	.bb_iq(bb_iq),			// merge baseband i and q into individual path
	.tx_frame(tx_frame)		// TX_FRAME
    );

initial begin
	sys_rst = 0;
	#52  sys_rst = 1;
	#113 sys_rst = 0;
end

initial begin
	fb_clk = 0;
	while(1) #2 fb_clk = ~fb_clk;
end

endmodule
