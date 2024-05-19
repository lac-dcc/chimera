// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: inter_layer_buffer.v
File Explanation: this module assumulates the output of a previous layer, until it reaches the criteria of triggering the next layer
Authors: Jay Lang (jaytlang@mit.edu), Zhizhen Zhong (zhizhenz@mit.edu)
File Start Time: March 2022
Language: Verilog 2001

*/


`define PARALLEL_BITWIDTH  	(2 ** LOG2_PARALLEL_BITWIDTH)
`define PARALLELISM     	(2 ** LOG2_PARALLELISM)

`define VALUE_WIDTH  		(`PARALLEL_BITWIDTH / `PARALLELISM)

`define MAX_LAYER_CYCLES		(MAX_LAYER_ENTRIES >> LOG2_PARALLELISM)
`define LAYER_ENTRIES_BITWIDTH	($clog2(MAX_LAYER_ENTRIES))
`define LAYER_CYCLES_BITWIDTH	($clog2(`MAX_LAYER_CYCLES))

`define INPUT_ADDRESS_BITWIDTH	`LAYER_ENTRIES_BITWIDTH
`define OUTPUT_ADDRESS_BITWIDTH	`LAYER_CYCLES_BITWIDTH

`define ST_PREAM_RECEPTIVE		2'b00		/* inputting data, outputting preamble, indicating the start of a layer */
`define ST_DATA_RECEPTIVE		2'b01		/* inputting data, outputting data, indicating the second and following layer */
`define ST_QUIET_RECEPTIVE		2'b10		/* only inputting data, indicating the first layer, or the end of layers where the buffer no longer output data but may or may not receive some previous sent data */
`define ST_FINAL				2'b11		/* final layer: output single value, skipping preamble */

`resetall
`default_nettype none
`timescale 1ns / 1ps

module inter_layer_buffer #(
	parameter LOG2_PARALLEL_BITWIDTH = 8,
	parameter LOG2_PARALLELISM = 4,

	parameter NUM_LAYERS = 3,
	parameter MAX_LAYER_ENTRIES = 300,
	parameter PREAMBLE_CYCLES_BITWIDTH = 16
)(
	input wire clk, rst,
	input wire [`VALUE_WIDTH - 1:0] input_integrated_tdata,
	input wire input_integrated_tvalid,

	input wire [NUM_LAYERS - 1:0] input_layer,
	input wire [`LAYER_ENTRIES_BITWIDTH - 1:0] input_layer_entries,

	input wire [PREAMBLE_CYCLES_BITWIDTH - 1:0] preamble_cycle_length,

	output reg [`PARALLEL_BITWIDTH - 1:0] output_mdata,
	output reg output_mvalid, output_mlast,

	output reg [NUM_LAYERS - 1:0] output_layer
);

	// simple dual port block RAMs from Xilinx
	reg [`INPUT_ADDRESS_BITWIDTH - 1:0] buffer_input_address;
	reg [`OUTPUT_ADDRESS_BITWIDTH - 1:0] buffer_output_address;

	wire [`PARALLEL_BITWIDTH - 1:0] buffer_output_value [1:0];
	reg which, final_wait;

	asym_ram_sdp_read_wider #(.WIDTHA(`VALUE_WIDTH),
							  .SIZEA(MAX_LAYER_ENTRIES),
							  .ADDRWIDTHA(`INPUT_ADDRESS_BITWIDTH),
							  .WIDTHB(`PARALLEL_BITWIDTH),
							  .SIZEB(`MAX_LAYER_CYCLES),
							  .ADDRWIDTHB(`OUTPUT_ADDRESS_BITWIDTH)
							 ) bram1 (.clkA(clk), .clkB(clk),
									  .enaA(!rst), .enaB(!rst),
									  .weA(input_integrated_tvalid & which),
									  .addrA(buffer_input_address),
									  .addrB(buffer_output_address),
									  .diA(input_integrated_tdata),
									  .doB(buffer_output_value[0]));

	asym_ram_sdp_read_wider #(.WIDTHA(`VALUE_WIDTH),
							  .SIZEA(MAX_LAYER_ENTRIES),
							  .ADDRWIDTHA(`INPUT_ADDRESS_BITWIDTH),
							  .WIDTHB(`PARALLEL_BITWIDTH),
							  .SIZEB(`MAX_LAYER_CYCLES),
							  .ADDRWIDTHB(`OUTPUT_ADDRESS_BITWIDTH)
							 ) bram2 (.clkA(clk), .clkB(clk),
									  .enaA(!rst), .enaB(!rst),
									  .weA(input_integrated_tvalid & !which),
									  .addrA(buffer_input_address),
									  .addrB(buffer_output_address),
									  .diA(input_integrated_tdata),
									  .doB(buffer_output_value[1]));

	// end simple dual port block RAM

	reg [PREAMBLE_CYCLES_BITWIDTH - 1:0] preamble_counter;
	reg [`LAYER_CYCLES_BITWIDTH - 1:0] output_layer_cycles;
	reg [`LAYER_ENTRIES_BITWIDTH - 1:0] buffer_output_runs;
	reg [1:0] state;

	wire [15:0] shift;
	wire shift_left;

	normalization normalization_inst (
		.clk(clk),
		.rst(rst),
		.state(state),
		.input_tdata(input_integrated_tdata),
		.input_tvalid(input_integrated_tvalid),
		.output_shift(shift),
        .output_shift_left(shift_left)
	);

	always @(posedge clk) begin
		if (rst) begin
			output_layer <= 1;
			output_mvalid <= 0;
			output_mlast <= 0;

			buffer_input_address <= 0;
			preamble_counter <= 0;
			buffer_output_address <= 0;
			buffer_output_runs <= 0;

			which <= 0;
			state <= `ST_QUIET_RECEPTIVE;

		end else if (output_layer == input_layer) begin
			// if new input data is available, handle it!
			if (input_integrated_tvalid)
				buffer_input_address <= buffer_input_address + 1;

			// if we're supposed to be outputting something, do it
			case (state)

			`ST_PREAM_RECEPTIVE: begin
				if (preamble_counter == preamble_cycle_length - 1) begin
					state <= `ST_DATA_RECEPTIVE;
					preamble_counter <= 0;

					if (output_layer_cycles > 1) buffer_output_address <= 1;

				end else preamble_counter <= preamble_counter + 1;

				output_mdata <= {256{1'b1}};
				output_mvalid <= 1;
				output_mlast <= 0;
			end

			`ST_DATA_RECEPTIVE: begin
				if (buffer_output_address == output_layer_cycles - 1) begin
					buffer_output_runs <= buffer_output_runs + 1;
					buffer_output_address <= 0;
				end else buffer_output_address <= buffer_output_address + 1;

				if (buffer_output_address == 0) begin
					if (buffer_output_runs == input_layer_entries) begin
						state <= `ST_QUIET_RECEPTIVE;
						output_mlast <= 1;
						buffer_output_address <= 0;
						buffer_output_runs <= 0;
					end
				end

				output_mvalid <= 1;
				output_mdata <= (shift_left) ? buffer_output_value[which] << shift :
                    buffer_output_value[which] >> shift;
			end

			`ST_FINAL: begin
			    if (final_wait) final_wait <= 0;
			    else begin
                    if (buffer_output_address > 0) begin
                        output_mvalid <= 0;
                        output_mlast <= 0;

                    end else begin
                        output_mdata <= buffer_output_value[which];
                        output_mvalid <= 1;
                        output_mlast <= 1;
                        buffer_output_address <= 1;
                    end
                end
			end

			`ST_QUIET_RECEPTIVE: begin
				if (buffer_input_address == input_layer_entries - 1 &&
					input_integrated_tvalid) begin

					if (output_layer == 1 << (NUM_LAYERS - 1)) begin
					    final_wait <= 1;
						output_layer <= {NUM_LAYERS{1'b1}};
						state <= `ST_FINAL;
					end else begin
						output_layer <= output_layer << 1;
						state <= `ST_PREAM_RECEPTIVE;
					end

					buffer_input_address <= 0;
					which <= ~which;

					if ((input_layer_entries & ((1 << LOG2_PARALLELISM) - 1)) != 0)
						/* verilator lint_off WIDTH */
						output_layer_cycles <= (input_layer_entries >> LOG2_PARALLELISM) + 1;

					else
						/* verilator lint_off WIDTH */
						output_layer_cycles <= (input_layer_entries >> LOG2_PARALLELISM);

				end

				output_mvalid <= 0;
				output_mlast <= 0;
			end

			endcase

		end else begin
			output_mvalid <= 0;
			output_mlast <= 0;
		end
	end

endmodule

`resetall
