//////////////////////////////////////////////////////////////////////
////                                                              ////
////  Flatten Device Tree (FDT) ROM                               ////
////                                                              ////
////  Description                                                 ////
////                                                              ////
////                                                              ////
////  Author(s):                                                  ////
////    - Stefan Kristiansson, stefan.kristiansson@saunalahti.fi  ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2011 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module fdt(
    // WB
    input  wire        wb_rst_i,
    input  wire        wb_clk_i,
    input  wire [31:0] wb_dat_i,
    input  wire [13:2] wb_adr_i,
    input  wire [3:0]  wb_sel_i,
    input  wire        wb_we_i,
    input  wire        wb_cyc_i,
    input  wire        wb_stb_i,
    output reg  [31:0] wb_dat_o,
    output reg         wb_ack_o,
    output wire        wb_err_o,
    output wire        wb_rty_o
);
   // Read
   always @(posedge wb_clk_i)
     if (wb_rst_i)
       wb_dat_o <= 0;
     else
       case (wb_adr_i)
`include "device_tree_blob.v"
	 default:
	   wb_dat_o <= 0;
       endcase; // case (wb_adr_i)

   // Ack generation
   always @(posedge wb_clk_i)
     if (wb_rst_i)
       wb_ack_o <= 0;
     else if (wb_ack_o)
       wb_ack_o <= 0;
     else if (wb_cyc_i & wb_stb_i & !wb_ack_o)
       wb_ack_o <= 1;

   assign wb_err_o = 0;
   assign wb_rty_o = 0;
endmodule
