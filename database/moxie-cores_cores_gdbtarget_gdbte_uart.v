// gdbte_uart.v - UART wrapper for GDB Target Engine
//
// Copyright (c) 2012  Anthony Green
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

module gdbte_uart (/*AUTOARG*/
  // Outputs
  debug_o, gdb_ctrl_o, wb_dat_o, wb_adr_o, wb_we_o, wb_cyc_o,
  wb_stb_o, tx_o,
  // Inputs
  rst_i, clk_i, wb_dat_i, wb_sel_o, wb_ack_i, rx_i
  );

  // --- DEBUG ----------------------------------------------------
  output [7:0] debug_o;
  
  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;
  
  // --- CPU Interface --------------------------------------------
  output [1:0] gdb_ctrl_o;
    
  // --- Wishbone Bus Interconnect ------------------------------------
  input [15:0]  wb_dat_i;
  output [15:0] wb_dat_o;
  output [31:0] wb_adr_o;
  input [1:0]   wb_sel_o;
  output        wb_we_o;
  output        wb_cyc_o;
  output        wb_stb_o;
  input         wb_ack_i;

  // --- UART and FIFO ------------------------------------------------
  output 	tx_o;
  input 	rx_i;
  
  wire 		te2ua_transmit;
  wire [7:0] 	ua2ff_byte;
  wire [7:0] 	ff2te_byte;
  wire [7:0] 	te2ua_byte;
  wire          ua_is_transmitting;
  wire 		ff_is_empty;
  wire 		te2ff_read;
  wire 		ua2ff_received;
 		
  uart com (.clk (clk_i),
	    .rst (rst_i),
	    .rx (rx_i),
	    .tx (tx_o),
	    .transmit (te2ua_transmit),
	    .tx_byte (te2ua_byte),
	    .received (ua2ff_received),
	    .rx_byte (ua2ff_byte),
	    .is_receiving (),
	    .is_transmitting (ua_is_transmitting));

  fifo_generator_v9_3 rx_fifo(.clk (clk_i),
			      .rst (rst_i),
			      .din (ua2ff_byte),
			      .wr_en (ua2ff_received),
			      .rd_en (te2ff_read),
			      .dout (ff2te_byte),
			      .full (),
			      .empty (ff_is_empty));

  // --- GDB Target Engine and connection -----------------------------

  gdb_target_engine te (.debug_o (debug_o),
			.clk_i (clk_i),
			.rst_i (rst_i),
			.tx_byte_o (te2ua_byte),
			.rx_byte_i (ff2te_byte),
			.tx_ready_i (! ua_is_transmitting),
			.tx_send_o (te2ua_transmit),
			.rx_available_i (! ff_is_empty),
			.rx_read_o (te2ff_read),
			.gdb_ctrl_o (gdb_ctrl_o),
			.wb_dat_i (wb_dat_i),
			.wb_dat_o (wb_dat_o),
			.wb_adr_o (wb_adr_o),
			.wb_sel_o (wb_sel_o),
			.wb_we_o (wb_we_o),
			.wb_cyc_o (wb_cyc_o),
			.wb_stb_o (wb_stb_o),
			.wb_ack_i (wb_ack_i));
  
endmodule // gdbte_uart

  
