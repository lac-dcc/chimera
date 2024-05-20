// This program was cloned from: https://github.com/olofk/tt07test
// License: Apache License 2.0

/*
 * subservient_core.v : Toplevel for the subservient SoC without peripherals
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
module subservient_core
  #(//Memory parameters
    parameter memsize = 512,
    parameter [0:0] sim = 1'b0,
    parameter RESET_STRATEGY = "MINI",
    parameter WITH_CSR = 1,
    parameter aw = $clog2(memsize))
  (
   input wire 		i_clk,
   input wire 		i_rst,
   input wire 		i_timer_irq,

   //SRAM interface
   output wire [aw-1:0] o_sram_waddr,
   output wire [7:0] 	o_sram_wdata,
   output wire 		o_sram_wen,
   output wire [aw-1:0] o_sram_raddr,
   input wire [7:0] 	i_sram_rdata,
   output wire 		o_sram_ren,

   //Periperal interface
   output wire [31:0] 	o_wb_adr,
   output wire [31:0] 	o_wb_dat,
   output wire [3:0] 	o_wb_sel,
   output wire 		o_wb_we ,
   output wire 		o_wb_stb,
   input wire [31:0] 	i_wb_rdt,
   input wire 		i_wb_ack);

   localparam regs = 32+WITH_CSR*4;

   localparam rf_width = 8;

   wire [31:0] 	wb_ibus_adr;
   wire 	wb_ibus_stb;
   wire [31:0] 	wb_ibus_rdt;
   wire 	wb_ibus_ack;

   wire [31:0] 	wb_dbus_adr;
   wire [31:0] 	wb_dbus_dat;
   wire [3:0] 	wb_dbus_sel;
   wire 	wb_dbus_we;
   wire 	wb_dbus_stb;
   wire [31:0] 	wb_dbus_rdt;
   wire 	wb_dbus_ack;

   wire [31:0] 	wb_mux_adr;
   wire [31:0] 	wb_mux_dat;
   wire [3:0] 	wb_mux_sel;
   wire 	wb_mux_we;
   wire 	wb_mux_stb;
   wire [31:0] 	wb_mux_rdt;
   wire 	wb_mux_ack;

   wire [31:0] 	wb_dmem_adr;
   wire [31:0] 	wb_dmem_dat;
   wire [3:0] 	wb_dmem_sel;
   wire 	wb_dmem_we;
   wire 	wb_dmem_stb;
   wire [31:0] 	wb_dmem_rdt;
   wire 	wb_dmem_ack;

   wire [31:0] 	wb_mem_adr;
   wire [31:0] 	wb_mem_dat;
   wire [3:0] 	wb_mem_sel;
   wire 	wb_mem_we;
   wire 	wb_mem_stb;
   wire [31:0] 	wb_mem_rdt;
   wire 	wb_mem_ack;

   wire [6+WITH_CSR:0] rf_waddr;
   wire [rf_width-1:0] rf_wdata;
   wire 	       rf_wen;
   wire [6+WITH_CSR:0] rf_raddr;
   wire [rf_width-1:0] rf_rdata;
   wire 	       rf_ren;

   servile_rf_mem_if
     #(.depth   (memsize),
       .rf_regs (regs))
   rf_mem_if
     (// Wishbone interface
      .i_clk (i_clk),
      .i_rst (i_rst),

      .i_waddr  (rf_waddr),
      .i_wdata  (rf_wdata),
      .i_wen    (rf_wen),
      .i_raddr  (rf_raddr),
      .o_rdata  (rf_rdata),
      .i_ren    (rf_ren),

      .o_sram_waddr (o_sram_waddr),
      .o_sram_wdata (o_sram_wdata),
      .o_sram_wen   (o_sram_wen),
      .o_sram_raddr (o_sram_raddr),
      .i_sram_rdata (i_sram_rdata),
      .o_sram_ren   (o_sram_ren),

      .i_wb_adr (wb_mem_adr[$clog2(memsize)-1:2]),
      .i_wb_stb (wb_mem_stb),
      .i_wb_we  (wb_mem_we) ,
      .i_wb_sel (wb_mem_sel),
      .i_wb_dat (wb_mem_dat),
      .o_wb_rdt (wb_mem_rdt),
      .o_wb_ack (wb_mem_ack));

   servile
     #(.reset_pc (32'h0000_0000),
       .reset_strategy (RESET_STRATEGY),
       .sim (sim),
       .with_csr (WITH_CSR))
   servile
     (
      .i_clk       (i_clk),
      .i_rst       (i_rst),
      .i_timer_irq (i_timer_irq),
      //Memory interface
      .o_wb_mem_adr   (wb_mem_adr),
      .o_wb_mem_dat   (wb_mem_dat),
      .o_wb_mem_sel   (wb_mem_sel),
      .o_wb_mem_we    (wb_mem_we),
      .o_wb_mem_stb   (wb_mem_stb),
      .i_wb_mem_rdt   (wb_mem_rdt),
      .i_wb_mem_ack   (wb_mem_ack),

      //Extension interface
      .o_wb_ext_adr   (o_wb_adr),
      .o_wb_ext_dat   (o_wb_dat),
      .o_wb_ext_sel   (o_wb_sel),
      .o_wb_ext_we    (o_wb_we),
      .o_wb_ext_stb   (o_wb_stb),
      .i_wb_ext_rdt   (i_wb_rdt),
      .i_wb_ext_ack   (i_wb_ack),

      //RF IF
      .o_rf_waddr  (rf_waddr),
      .o_rf_wdata  (rf_wdata),
      .o_rf_wen    (rf_wen),
      .o_rf_raddr  (rf_raddr),
      .o_rf_ren    (rf_ren),
      .i_rf_rdata  (rf_rdata));

endmodule
