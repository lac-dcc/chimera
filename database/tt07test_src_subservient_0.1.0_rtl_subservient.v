// This program was cloned from: https://github.com/olofk/tt07test
// License: Apache License 2.0

/*
 * subservient.v : Toplevel for the subservient SoC
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
module subservient
  #(//Memory parameters
    parameter memsize  = 512,
    parameter aw       = $clog2(memsize),
    //Enable CSR + interrupts
    parameter WITH_CSR = 0)
  (
   input wire 		i_clk,
   input wire 		i_rst,

   //SRAM interface
   output wire [aw-1:0] o_sram_waddr,
   output wire [7:0] 	o_sram_wdata,
   output wire 		o_sram_wen,
   output wire [aw-1:0] o_sram_raddr,
   input wire [7:0] 	i_sram_rdata,
   output wire 		o_sram_ren,

   //External I/O
   output wire 		o_gpio);

   wire [31:0] 	wb_core_adr;
   wire [31:0] 	wb_core_dat;
   wire [3:0] 	wb_core_sel;
   wire 	wb_core_we;
   wire 	wb_core_stb;
   wire [31:0] 	wb_core_rdt;
   wire 	wb_core_ack;

   wire 	wb_gpio_rdt;
   assign wb_core_rdt = {31'd0, wb_gpio_rdt};

   subservient_gpio gpio
     (.i_wb_clk (i_clk),
      .i_wb_rst (i_rst),
      .i_wb_dat (wb_core_dat[0]),
      .i_wb_we  (wb_core_we),
      .i_wb_stb (wb_core_stb),
      .o_wb_rdt (wb_gpio_rdt),
      .o_wb_ack (wb_core_ack),
      .o_gpio   (o_gpio));

   subservient_core
     #(.memsize (memsize),
       .WITH_CSR (WITH_CSR))
   core
     (.i_clk       (i_clk),
      .i_rst       (i_rst),
      .i_timer_irq (1'b0),

      //SRAM interface
      .o_sram_waddr (o_sram_waddr),
      .o_sram_wdata (o_sram_wdata),
      .o_sram_wen   (o_sram_wen),
      .o_sram_raddr (o_sram_raddr),
      .i_sram_rdata (i_sram_rdata),
      .o_sram_ren   (o_sram_ren),

      //Peripheral interface
      .o_wb_adr (wb_core_adr),
      .o_wb_dat (wb_core_dat),
      .o_wb_sel (wb_core_sel),
      .o_wb_we  (wb_core_we) ,
      .o_wb_stb (wb_core_stb),
      .i_wb_rdt (wb_core_rdt),
      .i_wb_ack (wb_core_ack));

endmodule
