// This program was cloned from: https://github.com/3442/conspiracion
// License: GNU General Public License v3.0

// verilator lint_off WIDTHEXPAND
// verilator lint_off WIDTHTRUNC
/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Author: Eyal Hochberg                                      ////
////          eyal@provartec.com                                 ////
////                                                             ////
////  Downloaded from: http://www.opencores.org                  ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2010 Provartec LTD                            ////
//// www.provartec.com                                           ////
//// info@provartec.com                                          ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
//// This source file is free software; you can redistribute it  ////
//// and/or modify it under the terms of the GNU Lesser General  ////
//// Public License as published by the Free Software Foundation.////
////                                                             ////
//// This source is distributed in the hope that it will be      ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied  ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR     ////
//// PURPOSE.  See the GNU Lesser General Public License for more////
//// details. http://www.gnu.org/licenses/lgpl.html              ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
//---------------------------------------------------------
//-- File generated by RobustVerilog parser
//-- Version: 1.0
//-- Invoked Fri Mar 25 23:34:54 2011
//--
//-- Source file: dma_ch_fifo.v
//---------------------------------------------------------


  
module dma_axi32_core0_ch_fifo (CLK,WR,RD,WR_ADDR,RD_ADDR,DIN,BSEL,DOUT);

   
   input                      CLK;
   
   input               WR;
   input               RD;
   input [5-2-1:0] WR_ADDR;
   input [5-2-1:0] RD_ADDR;
   input [32-1:0]      DIN;
   input [4-1:0]      BSEL;
   output [32-1:0]     DOUT;
   
   
   reg [32-1:0]           Mem [8-1:0];
   wire [32-1:0]       BitSEL;
   wire [32-1:0]       DIN_BitSEL;
   reg [32-1:0]           DOUT;
   
     assign               BitSEL = {{8{BSEL[3]}} , {8{BSEL[2]}} , {8{BSEL[1]}} , {8{BSEL[0]}}};

   
   assign               DIN_BitSEL = (Mem[WR_ADDR] & ~BitSEL) | (DIN & BitSEL);
   
   always @(posedge CLK)
     if (WR)
       Mem[WR_ADDR] <= DIN_BitSEL;

   
   always @(posedge CLK)
     if (RD)
       DOUT <= Mem[RD_ADDR];

   
endmodule


// verilator lint_on WIDTHEXPAND
// verilator lint_on WIDTHTRUNC
