// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-signed_unsigned_4x4_bit_multiplier
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_signed_unsigned_4x4_bit_multiplier(
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
  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
  
  // Insert multiplier logic here 
  signed_unsigned_4x4_bit_multiplier mult( 
    .multiplicand(ui_in[7:4]),
    .multiplier(ui_in[3:0]),
    .signed_mode(uio_in[0]),
    .product(uo_out[7:0]));

    



endmodule
