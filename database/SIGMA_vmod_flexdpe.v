`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////

// Design: flexdpe.v
// Author: Eric Qin

// Description: SIGMA Macro PE (FLEX-DPE) top level design

/////////////////////////////////////////////////////////////////////////

module flexdpe(
	clk,
	rst,
	i_data_valid, // input data bus valid
	i_data_bus, // input data bus
	i_stationary, // control bit signaling input data is stored in stationary buffer
	i_dest_bus, // dest bus for xbar network
	i_vn_seperator, // alternate virtual neuron seperator

	o_data_valid, // valid data signals
	o_data_bus // output data bus
);

	parameter IN_DATA_TYPE = 16; // input data type width (BFP16)
	parameter OUT_DATA_TYPE = 32; // output data type width (FP32)
	parameter NUM_PES = 32; // number of PES
	parameter LOG2_PES = 5;

	input clk;
	input rst;
	input i_data_valid;
	input [NUM_PES * IN_DATA_TYPE -1 : 0] i_data_bus;
	input i_stationary;
	input [NUM_PES * LOG2_PES -1:0] i_dest_bus;
	input [NUM_PES * LOG2_PES -1:0] i_vn_seperator;

	output [NUM_PES-1:0] o_data_valid;
	output [NUM_PES * OUT_DATA_TYPE -1:0] o_data_bus;

	wire [(NUM_PES-1)-1:0] w_reduction_add;
	wire [3*(NUM_PES-1)-1:0] w_reduction_cmd;
	wire [19 : 0] w_reduction_sel;
	wire w_reduction_valid;

	reg [NUM_PES * OUT_DATA_TYPE -1: 0] r_mult;

	wire [NUM_PES * IN_DATA_TYPE -1 : 0]  w_dist_bus; // output of xbar network
	wire w_mult_valid;

	reg [NUM_PES * IN_DATA_TYPE -1 : 0] r_data_bus_ff, r_data_bus_ff2;
	reg r_data_valid_ff, r_data_valid_ff2;
	reg r_stationary_ff, r_stationary_ff2;
	reg [NUM_PES * LOG2_PES -1:0] r_dest_bus_ff, r_dest_bus_ff2;

	// adjust some input signal delays from xbar and controller
	always @ (posedge clk) begin
		r_data_bus_ff <= i_data_bus;
		r_data_bus_ff2 <= r_data_bus_ff;
		r_data_valid_ff <= i_data_valid; 
		r_data_valid_ff2 <= r_data_valid_ff;
		r_stationary_ff <= i_stationary;
		r_stationary_ff2 <= r_stationary_ff;
		r_dest_bus_ff <= i_dest_bus;
		r_dest_bus_ff2 <= r_dest_bus_ff;
	end

	// instantize controller
	fan_ctrl #(
		.DATA_TYPE(IN_DATA_TYPE),
		.NUM_PES(NUM_PES),
		.LOG2_PES(LOG2_PES))
		my_controller(
		.clk(clk),
		.rst(rst),
		.i_vn(i_vn_seperator),
		.i_stationary(i_stationary),
		.i_data_valid(i_data_valid),
		.o_reduction_add(w_reduction_add),
		.o_reduction_cmd(w_reduction_cmd),
		.o_reduction_sel(w_reduction_sel),
		.o_reduction_valid(w_reduction_valid)
	);

	// instantize distribution network  (can be xbar or benes)
	xbar #(
		.DATA_TYPE(IN_DATA_TYPE),
		.NUM_PES(NUM_PES),
		.INPUT_BW(NUM_PES),
		.LOG2_PES(LOG2_PES))
		my_xbar (
		.clk(clk),
		.rst(rst),
		.i_data_bus(r_data_bus_ff2),
		.i_mux_bus(r_dest_bus_ff2),
		.o_dist_bus(w_dist_bus)
	);

	// generate multiplier chain (output of xbar to input of multiplier chain)
	mult_gen #(
		.IN_DATA_TYPE(IN_DATA_TYPE),
		.OUT_DATA_TYPE(OUT_DATA_TYPE),
		.NUM_PES(NUM_PES))
		my_mult_gen (
		.clk(clk),
		.rst(rst),
		.i_valid(r_data_valid_ff2),
		.i_data_bus(w_dist_bus),
		.i_stationary(r_stationary_ff2),
		.o_valid(w_mult_valid),
		.o_data_bus(r_mult)
	);

	// instantiate fan reduction topology
	fan_network #(
		.DATA_TYPE(OUT_DATA_TYPE),
		.NUM_PES(NUM_PES),
		.LOG2_PES(LOG2_PES))
		my_fan_network(
		.clk(clk),
		.rst(rst),
		.i_valid(w_reduction_valid),
		.i_data_bus(r_mult),
		.i_add_en_bus(w_reduction_add),
		.i_cmd_bus(w_reduction_cmd),
		.i_sel_bus(w_reduction_sel),
		.o_valid(o_data_valid),
		.o_data_bus(o_data_bus)
	);

endmodule
