// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// removed package "toi2s_pkg"
// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:3:1
`default_nettype none
// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:5:1
// removed ["import toi2s_pkg::*;"]
module toi2s_tt_fpga (
	clk,
	resetb,
	ena,
	i2c_scl,
	i2c_sda,
	rx_in,
	amp_i2s_bck,
	amp_i2s_ws,
	amp_i2s_d0,
	amp_i2c_scl,
	amp_i2c_sda,
	amp_nenable,
	amp_nmute,
	pwm_out,
	debug_out,
	debug_in
);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:9:5
	input clk;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:10:5
	input resetb;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:11:5
	input ena;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:13:5
	input i2c_scl;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:14:5
	inout i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:16:5
	input rx_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:18:5
	output wire amp_i2s_bck;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:19:5
	output wire amp_i2s_ws;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:20:5
	output wire amp_i2s_d0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:21:5
	output wire amp_i2c_scl;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:22:5
	inout amp_i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:23:5
	output wire amp_nenable;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:24:5
	output wire amp_nmute;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:27:5
	output wire pwm_out;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:30:5
	output wire [5:0] debug_out;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:31:5
	input debug_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:34:5
	wire i2c_sdai;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:35:5
	wire i2c_sdao;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:36:5
	assign i2c_sdai = i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:37:5
	assign i2c_sda = (i2c_sdao == 1'b0 ? 1'b0 : 1'bz);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:39:5
	wire amp_i2c_sdai;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:40:5
	wire amp_i2c_sdao;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:41:5
	assign amp_i2c_sdai = amp_i2c_sda;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:42:5
	assign amp_i2c_sda = (amp_i2c_sdao == 1'b0 ? amp_i2c_sdao : 1'bz);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/toi2s_tt_fpga/toi2s_tt_fpga.sv:48:5
	toi2s_tt_top toi2s_tt_top_inst(
		.clk(clk),
		.resetb(resetb),
		.ena(ena),
		.i2c_scl(i2c_scl),
		.i2c_sdai(i2c_sdai),
		.i2c_sdao(i2c_sdao),
		.rx_in(rx_in),
		.amp_i2s_bck(amp_i2s_bck),
		.amp_i2s_ws(amp_i2s_ws),
		.amp_i2s_d0(amp_i2s_d0),
		.amp_i2c_scl(amp_i2c_scl),
		.amp_i2c_sdai(amp_i2c_sdai),
		.amp_i2c_sdao(amp_i2c_sdao),
		.amp_nenable(amp_nenable),
		.amp_nmute(amp_nmute),
		.pwm_out(pwm_out),
		.debug_out(debug_out),
		.debug_in(~debug_in)
	);
endmodule
