/*
 DCPU16 Verilog Implementation
 Copyright (C) 2012 Shawn Tan <shawn.tan@sybreon.com>
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as
 published by the Free Software Foundation, either version 3 of the
 License, or (at your option) any later version.  This program is
 distributed in the hope that it will be useful, but WITHOUT ANY
 WARRANTY; without even the implied warranty of MERCHANTABILITY or
 FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 for more details.
 
 You should have received a copy of the GNU Lesser General Public
 License along with this program.  If not, see
 <http://www.gnu.org/licenses/>.  */

module dcpu16_regs (/*AUTOARG*/
   // Outputs
   rrd,
   // Inputs
   rwd, rra, rwa, rwe, rst, ena, clk
   );

   output [15:0] rrd; // read data
   input [15:0]  rwd; // write data
   input [2:0] 	 rra, // read address
		 rwa; // write address   
   input 	 rwe; // write-enable
   
   input 	 rst,
		 ena,
		 clk;      
   
   reg [15:0] 	 file [0:7]; // A, B, C, X, Y, Z, I, J

   reg [2:0] 	 r;

   assign rrd = file[rra];   
   
   always @(posedge clk)
     if (ena) begin
	r <= rra;	
	
	if (rwe) begin
	   file[rwa] <= rwd;	
	end
     end
        
endmodule // dcpu16_regs
