// This program was cloned from: https://github.com/leeja-j/router_tinytapeout
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_router (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
assign uio_oe=8'b11111111;

assign uio_out[7:6]=2'b00;

router_top router_top (
		.clock(clk),
		.resetn(rst_n),
		.data_in(ui_in[2:0]),
		.pkt_valid(ui_in[3]),
		.read_enb_0(ui_in[4]),
		.read_enb_1(ui_in[5]),
		.read_enb_2(ui_in[6]),
		.data_out_0(uo_out[2:0]),
		.data_out_1(uo_out[5:3]),
		.data_out_2(uio_out[2:0]),
		.vld_out_0(uio_out[3]),
		.vld_out_1(uio_out[4]),
		.vld_out_2(uio_out[5]),
		.err(uo_out[6]),
		.busy(uo_out[7])
		);


endmodule
