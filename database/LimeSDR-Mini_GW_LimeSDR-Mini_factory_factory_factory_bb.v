// This program was cloned from: https://github.com/myriadrf/LimeSDR-Mini_GW
// License: Apache License 2.0


module factory (
	bridge_0_address,
	bridge_0_byte_enable,
	bridge_0_read,
	bridge_0_write,
	bridge_0_write_data,
	bridge_0_acknowledge,
	bridge_0_read_data,
	clk_clk,
	extfifo_of_d,
	extfifo_of_wr,
	extfifo_of_wrfull,
	extfifo_if_d,
	extfifo_if_rd,
	extfifo_if_rdempty,
	extfifo_fifo_rst,
	pio_0_export,
	reset_reset_n,
	scl_export,
	sda_export);	

	input	[20:0]	bridge_0_address;
	input	[3:0]	bridge_0_byte_enable;
	input		bridge_0_read;
	input		bridge_0_write;
	input	[31:0]	bridge_0_write_data;
	output		bridge_0_acknowledge;
	output	[31:0]	bridge_0_read_data;
	input		clk_clk;
	output	[31:0]	extfifo_of_d;
	output		extfifo_of_wr;
	input		extfifo_of_wrfull;
	input	[31:0]	extfifo_if_d;
	output		extfifo_if_rd;
	input		extfifo_if_rdempty;
	output		extfifo_fifo_rst;
	output	[7:0]	pio_0_export;
	input		reset_reset_n;
	inout		scl_export;
	inout		sda_export;
endmodule
