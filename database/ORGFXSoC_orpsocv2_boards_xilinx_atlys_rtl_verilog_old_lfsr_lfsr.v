//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Linear feedback shift register with Wishbone interface       ////
////                                                              ////
//// Description                                                  ////
//// Simple LFSR module (feedback hardcoded)                      ////
//// Two accessible registers:                                    ////
//// Address 0: LFSR Register (R/W)                               ////
//// Address 4: Control register, active high, self resetting (WO)////
////            Bit[0]: lfsr shift enable                         ////
////            Bit[1]: lfsr reset                                ////
////                                                              ////
////  To Do:                                                      ////
////        Perhaps make feedback parameterisable                 ////
////                                                              ////
////  Author(s):                                                  ////
////      - Julius Baxter, julius.baxter@orsoc.se                 ////
////                                                              ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2010 Authors and OPENCORES.ORG                 ////
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
module wb_lfsr( wb_clk, wb_rst, wb_adr_i, wb_dat_i, wb_cyc_i, wb_stb_i, wb_we_i,
		wb_dat_o, wb_ack_o);
   
   parameter width = 32;
   parameter lfsr_rst_value = 32'b0011_0001_0000_1010;
   
   input wb_clk;
   input wb_rst;
   input [2:0] wb_adr_i;
   input [width-1:0] wb_dat_i;
   input 	     wb_cyc_i, wb_stb_i, wb_we_i;
   
   output [width-1:0] wb_dat_o;
   output reg 	      wb_ack_o;
   
   wire 	      wb_req;
   assign wb_req = wb_stb_i & wb_cyc_i;
   
   reg [width-1:0]    lfsr;
   wire 		  lfsr_feedback;

   assign wb_dat_o = lfsr;

   // Only 2 registers here, the lfsr itself and 
   wire 		  lfsr_sel;
   assign lfsr_sel = !wb_adr_i[2];
   wire 		  lfsr_control_reg_sel;
   assign lfsr_control_reg_sel = wb_adr_i[2];

   // [0]: shift enable, [1]: reset
   reg [1:0] 		  lfsr_control_reg;
   wire 		  lfsr_control_enable;
   wire 		  lfsr_control_rst;

   // Load the control reg when required, 
   always @(posedge wb_clk)
     begin
	if (wb_rst)
	  lfsr_control_reg <= 0;
	else if (wb_req & wb_we_i & lfsr_control_reg_sel & wb_ack_o)
	  lfsr_control_reg <= wb_dat_i;
	
	if (lfsr_control_reg[0])
	  lfsr_control_reg[0] <= 0;
	if (lfsr_control_reg[1])
	  lfsr_control_reg[1] <= 0;
     end // always @ (posedge wb_clk)

   assign lfsr_control_enable = lfsr_control_reg[0];
   assign lfsr_control_rst = lfsr_control_reg[1];
   
   assign lfsr_feedback = !(((lfsr[27] ^ lfsr[13]) ^ lfsr[8]) ^ lfsr[5]);
   
   always @(posedge wb_clk)
     if (wb_rst)
       lfsr <= lfsr_rst_value;
     else if (lfsr_control_rst)
       lfsr <= lfsr_rst_value;
     else if (wb_req & wb_we_i & lfsr_sel & wb_ack_o) // Set lfsr
       lfsr <= wb_dat_i;   
     else if (lfsr_control_enable)
       lfsr <= {lfsr[width-2:0], lfsr_feedback};
   
   always @(posedge wb_clk)
     if (wb_rst)
       wb_ack_o <= 0;
     else if (wb_req & !wb_ack_o)
       wb_ack_o <= 1;
     else if (wb_ack_o)
       wb_ack_o <= 0;
   

endmodule // lfsr
