// This program was cloned from: https://github.com/splinedrive/RISCV-KianV-BareMetalStyle
// License: Apache License 2.0

/*
 *  kianv harris multicycle RISC-V rv32ima
 *
 *  copyright (c) 2024 hirosh dabui <hirosh@dabui.de>
 *
 *  permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  the software is provided "as is" and the author disclaims all warranties
 *  with regard to this software including all implied warranties of
 *  merchantability and fitness. in no event shall the author be liable for
 *  any special, direct, indirect, or consequential damages or any damages
 *  whatsoever resulting from loss of use, data or profits, whether in an
 *  action of contract, negligence or other tortious action, arising out of
 *  or in connection with the use or performance of this software.
 *
 */
`default_nettype none
`include "defines_soc.vh"
module pwm 
 (
    input wire clk,
    input wire resetn,
    input wire we,
    input wire [7:0] pcm_i,
    output wire pwm_o
);

  // https://www.fpga4fun.com/PWM_DAC_3.html
  reg [8:0] pwm_accumulator;
  reg [7:0] pcm;

  always @(posedge clk) begin 
    if (!resetn) begin
      pcm <= 0;

    end else begin
      if (we) pcm <= pcm_i;
    end

  end

  always @(posedge clk) begin 
    pwm_accumulator <= !resetn ? 0 : pwm_accumulator[7:0] + pcm;
  end

  assign pwm_o = pwm_accumulator[8];

endmodule

