// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

// NOTE: only for the UART.
`timescale 1ns / 1ps
module pmi_fifo #(
	parameter pmi_data_width = 8,
	parameter pmi_data_depth = 16,
	parameter pmi_full_flag = 16,
	parameter pmi_empty_flag = 0,
	parameter pmi_almost_full_flag = 1,
	parameter pmi_almost_empty_flag = 0,
	parameter pmi_regmode = "noreg",
	parameter pmi_family = 0,
	parameter module_type = "pmi_fifo",
	parameter pmi_implementation = "LUT"
)(
	input wire [pmi_data_width - 1 : 0] Data,
	input wire Clock,
	input wire WrEn,
	input wire RdEn,
	input wire Reset,
	output wire [pmi_data_width - 1 : 0] Q,
	output wire Empty,
	output wire Full,
	output wire AlmostEmpty,
	output wire AlmostFull
);   

fifo_uart fifo_uart_inst(
	.clk(Clock),
	.srst(Reset),
	.din(Data),
	.wr_en(WrEn),
	.rd_en(RdEn),
	.dout(Q),
	.full(Full),
	.almost_full(AlmostFull),
	.empty(Empty),
	.almost_empty(AlmostEmpty)
);

endmodule
