// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module VgaController (

		input clock25Mhz,
		input reset,

		output hSync,
		output vSync,

		output isActive,
		output [9:0] x,
		output [8:0] y
	);

	// SYNC, BPORCH, VIDEO, FPORCH.
	localparam H_SYNC = 10'd96;
	localparam H_BPORCH = 10'd144;
	localparam H_FPORCH = 10'd784;
	localparam H_TOTAL = 10'd800;
	localparam V_SYNC = 10'd2;
	localparam V_BPORCH = 10'd35;
	localparam V_FPORCH = 10'd511;
	localparam V_TOTAL = 10'd525;

	reg [9:0] hCounter = 0;
	reg [9:0] vCounter = 0;

	always @(posedge clock25Mhz) begin
		if (reset) begin
			hCounter <= 0;
		end else if (hCounter == H_TOTAL - 1'b1) begin
			hCounter <= 0;
		end else begin
			hCounter <= hCounter + 1'b1;
		end
	end

	always @(posedge clock25Mhz) begin
		if (reset) begin
			vCounter <= 0;
		end else if (hCounter == H_TOTAL - 1'b1) begin
			if (vCounter == V_TOTAL - 1) begin
				vCounter <= 0;
			end else begin
				vCounter <= vCounter + 1'b1;
			end
		end
	end

	assign hSync = hCounter < H_SYNC ? 1'b0 : 1'b1;
	assign vSync = vCounter < V_SYNC ? 1'b0 : 1'b1;

	assign isActive = (hCounter >= H_BPORCH) && (hCounter < H_FPORCH) && (vCounter >= V_BPORCH) && (vCounter < V_FPORCH) ? 1'b1 : 1'b0;
	assign x = hCounter - H_BPORCH;
	assign y = {vCounter - V_BPORCH}[8:0];
endmodule
