// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

// removed package "toi2s_pkg"
// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:6:1
// removed ["import toi2s_pkg::*;"]
module amp_if (
	clk,
	resetb,
	ena,
	rx_in,
	amp_i2s_bck,
	amp_i2s_ws,
	amp_i2s_d0,
	amp_i2c_sdai,
	amp_i2c_sdao,
	amp_i2c_scl,
	amp_nenable,
	amp_nmute,
	amp_cfg,
	debug_out,
	debug_in
);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:9:5
	input clk;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:10:5
	input resetb;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:11:5
	input ena;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:12:5
	input rx_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:13:5
	output wire amp_i2s_bck;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:14:5
	output wire amp_i2s_ws;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:15:5
	output wire amp_i2s_d0;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:16:5
	input amp_i2c_sdai;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:17:5
	output wire amp_i2c_sdao;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:18:5
	output wire amp_i2c_scl;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:19:5
	output wire amp_nenable;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:20:5
	output wire amp_nmute;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:21:5
	// removed localparam type toi2s_pkg_rb_amp_cfg_wire_t
	inout wire [72:0] amp_cfg;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:22:5
	output wire debug_out;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:23:5
	input debug_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:27:5
	wire audio_locked;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:28:5
	wire send_config;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:29:5
	wire rx_out_tmp;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:32:5
	assign amp_cfg[66:65] = {audio_locked, send_config};
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:34:5
	wire i2s_bck_tmp;
	wire i2s_ws_tmp;
	wire i2s_d0_tmp;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:36:5
	spdif_decoder spdif(
		.clk_in(clk),
		.resetb(resetb),
		.rx_in(rx_in),
		.i2s_bck(i2s_bck_tmp),
		.i2s_ws(i2s_ws_tmp),
		.i2s_d0(i2s_d0_tmp),
		.audio_locked(audio_locked),
		.edgedetect(debug_out)
	);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:47:5
	assign amp_i2s_d0 = i2s_d0_tmp & amp_nmute;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:48:5
	assign amp_i2s_ws = i2s_ws_tmp & amp_nmute;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:49:5
	assign amp_i2s_bck = i2s_bck_tmp & amp_nmute;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:51:5
	wire nerror_in;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:52:5
	assign nerror_in = 1'b1;
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:54:5
	amp_state_control ctrl(
		.clk_in(clk),
		.resetb(resetb),
		.audio_locked_in(audio_locked),
		.nerror_in(nerror_in),
		.nenable_out(amp_nenable),
		.nmute_out(amp_nmute),
		.send_config_out(send_config)
	);
	// Trace: /home/jakobsen/work/asic/workspace/tt06-toi2s/src/amp_if/amp_if.sv:63:5
	amp_i2c_master i2c(
		.clk_in(clk),
		.resetb(resetb),
		.amp_cfg(amp_cfg),
		.send_cfg(send_config),
		.sdai(amp_i2c_sdai),
		.sdao(amp_i2c_sdao),
		.scl(amp_i2c_scl)
	);
endmodule
