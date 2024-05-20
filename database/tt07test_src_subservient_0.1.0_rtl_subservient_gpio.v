// This program was cloned from: https://github.com/olofk/tt07test
// License: Apache License 2.0

/*
 * subservient_gpio.v : Single-bit GPIO for the subservient SoC
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

module subservient_gpio
  (input wire i_wb_clk,
   input wire i_wb_rst,
   input wire i_wb_dat,
   input wire i_wb_we,
   input wire i_wb_stb,
   output reg o_wb_rdt,
   output reg o_wb_ack,
   output reg o_gpio);

   always @(posedge i_wb_clk) begin
      o_wb_rdt <= o_gpio;
      if (i_wb_stb & i_wb_we)
	o_gpio <= i_wb_dat;
      o_wb_ack <= i_wb_stb & !o_wb_ack;

      if (i_wb_rst) begin
	 o_wb_ack <= 1'b0;
	 o_gpio   <= 1'b0;
      end
   end
endmodule
