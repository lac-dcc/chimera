// This program was cloned from: https://github.com/olofk/tt07test
// License: Apache License 2.0

/*
 * subservient_debug_switch.v : Wishbone debug switch for subservient SoC
 *
 * SPDX-FileCopyrightText: 2021 Olof Kindgren <olof.kindgren@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

module subservient_debug_switch
  (//Debug selector
   input wire 	      i_debug_mode,

   //Debug interface
   input wire [31:0]  i_wb_dbg_adr,
   input wire [31:0]  i_wb_dbg_dat,
   input wire [3:0]   i_wb_dbg_sel,
   input wire 	      i_wb_dbg_we,
   input wire 	      i_wb_dbg_stb,
   output wire [31:0] o_wb_dbg_rdt,
   output wire 	      o_wb_dbg_ack,

   //Data bus interface towards CPU
   input wire [31:0]  i_wb_dbus_adr,
   input wire [31:0]  i_wb_dbus_dat,
   input wire [3:0]   i_wb_dbus_sel,
   input wire 	      i_wb_dbus_we,
   input wire 	      i_wb_dbus_stb,
   output wire [31:0] o_wb_dbus_rdt,
   output wire 	      o_wb_dbus_ack,

   //Data bus interface towards memory/peripherals
   output wire [31:0] o_wb_mux_adr,
   output wire [31:0] o_wb_mux_dat,
   output wire [3:0]  o_wb_mux_sel,
   output wire 	      o_wb_mux_we,
   output wire 	      o_wb_mux_stb,
   input wire [31:0]  i_wb_mux_rdt,
   input wire 	      i_wb_mux_ack);

   assign o_wb_dbg_rdt  = i_wb_mux_rdt;
   assign o_wb_dbg_ack  = i_wb_mux_ack & i_debug_mode;

   assign o_wb_dbus_rdt = i_wb_mux_rdt;
   assign o_wb_dbus_ack = i_wb_mux_ack & !i_debug_mode;

   assign o_wb_mux_adr = i_debug_mode ? i_wb_dbg_adr : i_wb_dbus_adr;
   assign o_wb_mux_dat = i_debug_mode ? i_wb_dbg_dat : i_wb_dbus_dat;
   assign o_wb_mux_sel = i_debug_mode ? i_wb_dbg_sel : i_wb_dbus_sel;
   assign o_wb_mux_we  = i_debug_mode ? i_wb_dbg_we  : i_wb_dbus_we ;
   assign o_wb_mux_stb = i_debug_mode ? i_wb_dbg_stb : i_wb_dbus_stb;


endmodule
