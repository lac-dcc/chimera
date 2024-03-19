`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/10 14:58:16
// Design Name: 
// Module Name: dds_test
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


module dds_test;

reg clk;
reg sys_rst;


initial begin
	sys_rst = 0;
	#32 sys_rst = 1;
	#17 sys_rst = 0;
end

initial begin
	clk = 0;
	while(1) begin
		clk = #5 ~clk;
	end
end



wire 			m_axis_data_tvalid;
wire [31 : 0] 	m_axis_data_tdata;
wire			m_axis_phase_tvalid;
wire[11:0] 		i_path , q_path;
wire[15 : 0] m_axis_phase_tdata;


dds_compiler_0 your_instance_name (
  .aclk(clk),                                	// input wire aclk
  .m_axis_data_tvalid(m_axis_data_tvalid),    	// output wire m_axis_data_tvalid
  .m_axis_data_tdata(m_axis_data_tdata),      	// output wire [31 : 0] m_axis_data_tdata
  .m_axis_phase_tvalid(m_axis_phase_tvalid),  	// output wire m_axis_phase_tvalid
  .m_axis_phase_tdata(m_axis_phase_tdata)    	// output wire [15 : 0] m_axis_phase_tdata
);

assign i_path = m_axis_data_tdata[11:0];
assign q_path = m_axis_data_tdata[27:16];


wire [11:0] bb_iq;
wire tx_frame;
ad9361_txdata uut(
	.sys_rst(sys_rst),		// system reset from FPGA
	.fb_clk(clk),			// feedback from DATA_CLK

	.bb_i_path(i_path),		// baseband i path
	.bb_q_path(q_path),		// baseband q path
	.bb_iq(bb_iq),			// merge baseband i and q into individual path
	.tx_frame(tx_frame)		// TX_FRAME
    );

endmodule
