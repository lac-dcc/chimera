// This program was cloned from: https://github.com/FangameEmpire/tt06-twi-monitor
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Nicklaus Thompson
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_nicklausthompson_twi_monitor (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Active inputs
    wire SDA_in, SCL_in, SDA, SCL;
    assign SDA_in = ui_in[0];
    assign SCL_in = ui_in[1];

    // I designed this to use a positive reset when I developed it on an FPGA
    // Need to invert into a negative reset
    wire rst_p;
    assign rst_p = ~rst_n;

    // Buffer input
    Metastability_Buffer SDA_buffer (clk, rst_p, SDA_in, SDA);
    Metastability_Buffer SCL_buffer (clk, rst_p, SCL_in, SCL);

    // Platform-independent top module
    wire TX_out;    
    TWI_Monitor main_monitor (clk, rst_p, ena, SDA, SCL, TX_out);

    // Active outputs
    assign uo_out[0] = TX_out;

    // All output pins must be assigned. If not used, assign to 0.
    assign uo_out[7:1]  = 7'b0;
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
