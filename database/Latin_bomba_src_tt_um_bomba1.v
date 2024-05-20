// This program was cloned from: https://github.com/arizaga1/Latin_bomba
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_bomba1 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    
  // All output pins must be assigned. If not used, assign to 0.
    bomba1  c1 (.ck(uio_in[7]), .rst_i(uio_in[6]), .sensores_i(uio_in[5:3]), .alarma_o(uio_out[1]), .bomba_o(uio_out[0])); 
    assign uio_oe = 8'b00000011;
    assign uio_out[7:2] = 6'b000000;
    assign uo_out[7:0] = 8'b00000000;
    
endmodule
