// This program was cloned from: https://github.com/BatuCem/tt06-mnslab-bldc-0
// License: Apache License 2.0


/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_MNSLab_BLDC (
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
    assign uo_out[7:2] = 6'b000000;
    assign uio_out[7:1] = 7'b0000000;
    assign uio_oe[7:1] = 7'b0000000;

    esc_1 top_design (
        .clk(clk),
        .rst(~rst_n),
        .sda_in(uio_in[0]),
        .sda_out(uio_out[0]),
        .sda_oe(uio_oe[0]),
        .scl(ui_in[7]),
        .pwm_en(ena),
        .encoder_a(ui_in[0]),
        .encoder_b(ui_in[1]),
        .motor_positive(uo_out[0]),
        .motor_negative(uo_out[1])
    );
    

endmodule
