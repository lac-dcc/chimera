// This program was cloned from: https://github.com/maxluppe/tt07_maxluppe_nist0102
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Maximiliam Luppe
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_maxluppe_nist0102 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
assign uo_out[7:4]  = 0;
assign uio_out = 0;
assign uio_oe  = 0;

NIST0102 u0 (
    .clk(clk),
    .rst_n(rst_n),
    .RND_in(ui_in[0]),
    .nPass1(uo_out[0]),
    .nPass2(uo_out[1]),
    .nBlkOK1(uo_out[2]),
    .nBlkOK2(uo_out[3])
);

endmodule
