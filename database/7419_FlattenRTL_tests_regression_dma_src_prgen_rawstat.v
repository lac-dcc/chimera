// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

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
//-- Invoked Fri Mar 25 23:36:56 2011
//--
//-- Source file: prgen_rawstat.v
//---------------------------------------------------------


  
module  prgen_rawstat (clk,reset,clear,write,pwdata,int_bus,rawstat);

   parameter           SIZE = 32;
   
   input            clk;
   input            reset;
   
   input            clear;
   input            write;
   input [SIZE-1:0]    pwdata;
   input [SIZE-1:0]    int_bus;
   
   output [SIZE-1:0]   rawstat;
   
   
   
   reg [SIZE-1:0]      rawstat;
   wire [SIZE-1:0]     write_bus;
   wire [SIZE-1:0]     clear_bus;
   
   
   assign            write_bus = {SIZE{write}} & pwdata;
   assign            clear_bus = {SIZE{clear}} & pwdata;
   
   
   always @(posedge clk or posedge reset)
     if (reset) 
       rawstat <= #1 {SIZE{1'b0}};
     else 
       rawstat <= #1 (rawstat | int_bus | write_bus) & (~clear_bus);
   
endmodule
   


