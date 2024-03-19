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

module dcpu16sim (/*AUTOARG*/);

   /*AUTOOUTPUT*/
   /*AUTOINPUT*/
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire [15:0]		f_adr;			// From ut0 of dcpu16_cpu.v
   wire [15:0]		f_dti;			// From ur0 of fasm_dpsram_wbr.v
   wire [15:0]		f_dto;			// From ut0 of dcpu16_cpu.v
   wire			f_stb;			// From ut0 of dcpu16_cpu.v
   wire			f_wre;			// From ut0 of dcpu16_cpu.v
   wire [15:0]		g_adr;			// From ut0 of dcpu16_cpu.v
   wire [15:0]		g_dti;			// From ur0 of fasm_dpsram_wbr.v
   wire [15:0]		g_dto;			// From ut0 of dcpu16_cpu.v
   wire			g_stb;			// From ut0 of dcpu16_cpu.v
   wire			g_wre;			// From ut0 of dcpu16_cpu.v
   // End of automatics
   /*AUTOREG*/

   reg 			rst,
			clk;
   reg 			f_ack, g_ack;
   
   
   initial begin
      $dumpfile ("dump.vcd");
      $dumpvars (2,ut0);

      
      clk = $random;
      rst = 1;

      #50 rst = 0;
      $readmemh ("dump.vmem", ur0.bram);      

      #5000 $displayh("\n*** TIMEOUT ", $stime, " ***");
      $finish;
   end // initial begin

   always #5 clk <= !clk;

   always @(negedge clk) begin
      f_ack <= f_stb;
      //& !f_ack;
      g_ack <= g_stb;
      //& !g_ack;      
   end


   /* fasm_dpsram_wbr AUTO_TEMPLATE (
    .AW(16),
    .DW(16),
    
    .xclk_i(~clk), 
    .clk_i(~clk),
    
    .xwre_i(g_wre), 
    .xstb_i(g_stb), 
    .xadr_i(g_adr),
    .xdat_o(g_dti[15:0]),
    .xdat_i(g_dto[15:0]),
    
    .wre_i(f_wre),
    .stb_i(f_stb),
    .adr_i(f_adr),
    .dat_o(f_dti[15:0]),
    .dat_i(f_dto[15:0]),
    
    .rst_i(rst),
    .xrst_i(rst),
    ) */
   
   fasm_dpsram_wbr
     #(/*AUTOINSTPARAM*/
       // Parameters
       .AW				(16),			 // Templated
       .DW				(16))			 // Templated
     ur0 (/*AUTOINST*/
	  // Outputs
	  .dat_o			(f_dti[15:0]),		 // Templated
	  .xdat_o			(g_dti[15:0]),		 // Templated
	  // Inputs
	  .dat_i			(f_dto[15:0]),		 // Templated
	  .adr_i			(f_adr),		 // Templated
	  .wre_i			(f_wre),		 // Templated
	  .stb_i			(f_stb),		 // Templated
	  .rst_i			(rst),			 // Templated
	  .clk_i			(~clk),			 // Templated
	  .xdat_i			(g_dto[15:0]),		 // Templated
	  .xadr_i			(g_adr),		 // Templated
	  .xwre_i			(g_wre),		 // Templated
	  .xstb_i			(g_stb),		 // Templated
	  .xrst_i			(rst),			 // Templated
	  .xclk_i			(~clk));			 // Templated

   
   dcpu16_cpu
     ut0 (/*AUTOINST*/
	  // Outputs
	  .f_adr			(f_adr[15:0]),
	  .f_dto			(f_dto[15:0]),
	  .f_stb			(f_stb),
	  .f_wre			(f_wre),
	  .g_adr			(g_adr[15:0]),
	  .g_dto			(g_dto[15:0]),
	  .g_stb			(g_stb),
	  .g_wre			(g_wre),
	  // Inputs
	  .clk				(clk),
	  .f_ack			(f_ack),
	  .f_dti			(f_dti[15:0]),
	  .g_ack			(g_ack),
	  .g_dti			(g_dti[15:0]),
	  .rst				(rst));   

   integer i;
   initial begin
      for (i=0; i<8; i=i+1) begin
	 ut0.r0.file[i] <= $random;	 
      end
   end
   
endmodule // dcpu16sim

// Local Variables:
// verilog-library-directories:("." "../../rtl/verilog/")
// verilog-library-files:("")
// End:
