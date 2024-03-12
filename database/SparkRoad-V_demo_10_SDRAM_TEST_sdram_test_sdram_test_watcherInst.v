module CFG_INT_WRAPPER(jtdi, jtck, jrstn, jrti, jscan, jshift, jupdate, jtdo, status, control);
	localparam DEFAULT_CTRL_LEN = 25;
	localparam DEFAULT_STAT_LEN = 18;
	localparam DEFAULT_TRIG_NUM = 1;
	input jtdi;
	input jtck;
	input jrstn;
	input jshift;
	input jupdate;
	input [1:0] jrti;
	input [1:0] jscan;
	input [DEFAULT_STAT_LEN-1:0] status;
	output [1:0] jtdo;
	output [DEFAULT_CTRL_LEN-1:0] control;

	cfg_int #(.INT_CTRL_REG_LEN(DEFAULT_CTRL_LEN), .INT_STAT_REG_LEN(DEFAULT_STAT_LEN), .INT_TRIG_NUM(DEFAULT_TRIG_NUM))
	 wrapper_cfg_inst(
		.jtdi(jtdi),
		.jtck(jtck),
		.jrstn(jrstn),
		.jrti(jrti),
		.jscan(jscan),
		.jshift(jshift),
		.jupdate(jupdate),
		.status(status),
		.jtdo(jtdo),
		.control(control)
	);
endmodule


module TRIGGER_NODE_WRAPPER_1(trig_clk, trig_rstn, pause, trig_logic, trig_din, trig_edge_mode, trig_len, trig_stop_len, cfg_clk, cfg_rstn, overflow_flag, stop_flag, stop_addr,  wt_ce, wt_en, wt_addr);
	localparam DEFAULT_DET_NUM = 1;
	localparam DEFAULT_STOP_LEN = 341;
	input [DEFAULT_DET_NUM-1:0] trig_din;
	input trig_clk;
	input trig_rstn;
	input pause;
	input [1:0] trig_logic;
	input [DEFAULT_DET_NUM*3-1:0] trig_edge_mode;
	input [15:0] trig_len;
	input [1:0] trig_stop_len;
	input cfg_clk;
	input cfg_rstn;
	output overflow_flag;
	output stop_flag;
	output [15:0] stop_addr;
	output [15:0] wt_addr;
	output wt_en;
	output wt_ce;

	trigger_node #(.DET_NUM(DEFAULT_DET_NUM), .STOP_LEN(DEFAULT_STOP_LEN))
	 trigger_node_int_0(
		.trig_din(trig_din),
		.trig_clk(trig_clk),
		.trig_rstn(trig_rstn),
		.pause(pause),
		.trig_logic(trig_logic),
		.trig_edge_mode(trig_edge_mode),
		.trig_len(trig_len),
		.trig_stop_len(trig_stop_len),
		.cfg_clk(cfg_clk),
		.cfg_rstn(cfg_rstn),
		.overflow_flag(overflow_flag),
		.stop_flag(stop_flag),
		.stop_addr(stop_addr),
		.wt_addr(wt_addr),
		.wt_en(wt_en),
		.wt_ce(wt_ce)
	);
endmodule


