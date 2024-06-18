// This program was cloned from: https://github.com/olofk/subservient
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
    parameter RESET_STRATEGY = "MINI",
    parameter WITH_CSR = 1,
    parameter aw    = $clog2(memsize))
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

   //Debug interface
   input wire 		i_debug_mode,
   input wire [31:0] 	i_wb_dbg_adr,
   input wire [31:0] 	i_wb_dbg_dat,
   input wire [3:0] 	i_wb_dbg_sel,
   input wire 		i_wb_dbg_we ,
   input wire 		i_wb_dbg_stb,
   output wire [31:0] 	o_wb_dbg_rdt,
   output wire 		o_wb_dbg_ack,

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

   wire [6+WITH_CSR:0] waddr;
   wire [rf_width-1:0] wdata;
   wire 	       wen;
   wire [6+WITH_CSR:0] raddr;
   wire [rf_width-1:0] rdata;
   wire 	       ren;


   wire [aw-1:0] rf_waddr = ~{{aw-2-5-WITH_CSR{1'b0}},waddr};
   wire [aw-1:0] rf_raddr = ~{{aw-2-5-WITH_CSR{1'b0}},raddr};

   subservient_debug_switch debug_switch
     (.i_debug_mode (i_debug_mode),

      .i_wb_dbg_adr (i_wb_dbg_adr),
      .i_wb_dbg_dat (i_wb_dbg_dat),
      .i_wb_dbg_sel (i_wb_dbg_sel),
      .i_wb_dbg_we  (i_wb_dbg_we ),
      .i_wb_dbg_stb (i_wb_dbg_stb),
      .o_wb_dbg_rdt (o_wb_dbg_rdt),
      .o_wb_dbg_ack (o_wb_dbg_ack),

      .i_wb_dbus_adr (wb_dbus_adr),
      .i_wb_dbus_dat (wb_dbus_dat),
      .i_wb_dbus_sel (wb_dbus_sel),
      .i_wb_dbus_we  (wb_dbus_we ),
      .i_wb_dbus_stb (wb_dbus_stb),
      .o_wb_dbus_rdt (wb_dbus_rdt),
      .o_wb_dbus_ack (wb_dbus_ack),

      .o_wb_mux_adr (wb_mux_adr),
      .o_wb_mux_dat (wb_mux_dat),
      .o_wb_mux_sel (wb_mux_sel),
      .o_wb_mux_we  (wb_mux_we ),
      .o_wb_mux_stb (wb_mux_stb),
      .i_wb_mux_rdt (wb_mux_rdt),
      .i_wb_mux_ack (wb_mux_ack));

   serving_arbiter arbiter
     (.i_wb_cpu_dbus_adr (wb_dmem_adr),
      .i_wb_cpu_dbus_dat (wb_dmem_dat),
      .i_wb_cpu_dbus_sel (wb_dmem_sel),
      .i_wb_cpu_dbus_we  (wb_dmem_we ),
      .i_wb_cpu_dbus_stb (wb_dmem_stb),
      .o_wb_cpu_dbus_rdt (wb_dmem_rdt),
      .o_wb_cpu_dbus_ack (wb_dmem_ack),

      .i_wb_cpu_ibus_adr (wb_ibus_adr),
      .i_wb_cpu_ibus_stb (wb_ibus_stb & !i_debug_mode),
      .o_wb_cpu_ibus_rdt (wb_ibus_rdt),
      .o_wb_cpu_ibus_ack (wb_ibus_ack),

      .o_wb_mem_adr (wb_mem_adr),
      .o_wb_mem_dat (wb_mem_dat),
      .o_wb_mem_sel (wb_mem_sel),
      .o_wb_mem_we  (wb_mem_we ),
      .o_wb_mem_stb (wb_mem_stb),
      .i_wb_mem_rdt (wb_mem_rdt),
      .i_wb_mem_ack (wb_mem_ack));

   serving_mux mux
     (.i_clk        (i_clk),
      .i_rst        (i_rst & (RESET_STRATEGY != "NONE")),

      .i_wb_cpu_adr (wb_mux_adr),
      .i_wb_cpu_dat (wb_mux_dat),
      .i_wb_cpu_sel (wb_mux_sel),
      .i_wb_cpu_we  (wb_mux_we),
      .i_wb_cpu_stb (wb_mux_stb),
      .o_wb_cpu_rdt (wb_mux_rdt),
      .o_wb_cpu_ack (wb_mux_ack),

      .o_wb_mem_adr (wb_dmem_adr),
      .o_wb_mem_dat (wb_dmem_dat),
      .o_wb_mem_sel (wb_dmem_sel),
      .o_wb_mem_we  (wb_dmem_we),
      .o_wb_mem_stb (wb_dmem_stb),
      .i_wb_mem_rdt (wb_dmem_rdt),
      .i_wb_mem_ack (wb_dmem_ack),

      .o_wb_ext_adr (o_wb_adr),
      .o_wb_ext_dat (o_wb_dat),
      .o_wb_ext_sel (o_wb_sel),
      .o_wb_ext_we  (o_wb_we),
      .o_wb_ext_stb (o_wb_stb),
      .i_wb_ext_rdt (i_wb_rdt),
      .i_wb_ext_ack (i_wb_ack));

   subservient_ram
     #(.depth   (memsize))
   ram
     (// Wishbone interface
      .i_clk (i_clk),
      .i_rst (i_rst),
      .i_waddr  (rf_waddr),
      .i_wdata  (wdata),
      .i_wen    (wen),
      .i_raddr  (rf_raddr),
      .o_rdata  (rdata),
      .i_ren    (ren),

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

   localparam RF_L2W = $clog2(rf_width);

   wire 		   rf_wreq;
   wire 		   rf_rreq;
   wire [$clog2(regs)-1:0] wreg0;
   wire [$clog2(regs)-1:0] wreg1;
   wire 		   wen0;
   wire 		   wen1;
   wire 		   wdata0;
   wire 		   wdata1;
   wire [$clog2(regs)-1:0] rreg0;
   wire [$clog2(regs)-1:0] rreg1;
   wire 		   rf_ready;
   wire 		   rdata0;
   wire 		   rdata1;


   subservient_rf_ram_if
     #(.width    (rf_width),
       .reset_strategy (RESET_STRATEGY),
       .csr_regs (WITH_CSR*4))
   rf_ram_if
     (.i_clk    (i_clk),
      .i_rst    (i_rst),
      .i_wreq   (rf_wreq),
      .i_rreq   (rf_rreq),
      .o_ready  (rf_ready),
      .i_wreg0  (wreg0),
      .i_wreg1  (wreg1),
      .i_wen0   (wen0),
      .i_wen1   (wen1),
      .i_wdata0 (wdata0),
      .i_wdata1 (wdata1),
      .i_rreg0  (rreg0),
      .i_rreg1  (rreg1),
      .o_rdata0 (rdata0),
      .o_rdata1 (rdata1),
      .o_waddr  (waddr),
      .o_wdata  (wdata),
      .o_wen    (wen),
      .o_raddr  (raddr),
      .i_rdata  (rdata),
      .o_ren    (ren));

   serv_top
     #(.RESET_PC (32'h0000_0000),
       .RESET_STRATEGY (RESET_STRATEGY),
       .WITH_CSR (WITH_CSR))
   cpu
     (
      .clk         (i_clk),
      .i_rst       (i_rst),
      .i_timer_irq (i_timer_irq),
      //RF IF
      .o_rf_rreq   (rf_rreq),
      .o_rf_wreq   (rf_wreq),
      .i_rf_ready  (rf_ready),
      .o_wreg0     (wreg0),
      .o_wreg1     (wreg1),
      .o_wen0      (wen0),
      .o_wen1      (wen1),
      .o_wdata0    (wdata0),
      .o_wdata1    (wdata1),
      .o_rreg0     (rreg0),
      .o_rreg1     (rreg1),
      .i_rdata0    (rdata0),
      .i_rdata1    (rdata1),

      //Instruction bus
      .o_ibus_adr  (wb_ibus_adr),
      .o_ibus_cyc  (wb_ibus_stb),
      .i_ibus_rdt  (wb_ibus_rdt),
      .i_ibus_ack  (wb_ibus_ack),

      //Data bus
      .o_dbus_adr  (wb_dbus_adr),
      .o_dbus_dat  (wb_dbus_dat),
      .o_dbus_sel  (wb_dbus_sel),
      .o_dbus_we   (wb_dbus_we),
      .o_dbus_cyc  (wb_dbus_stb),
      .i_dbus_rdt  (wb_dbus_rdt),
      .i_dbus_ack  (wb_dbus_ack),

      //Extension interface
      .o_ext_funct3 (),
      .i_ext_ready  (1'b0),
      .i_ext_rd     (32'd0),
      .o_ext_rs1    (),
      .o_ext_rs2    (),
      .o_mdu_valid  ());

endmodule
