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

/*
 
DCPU16 PIPELINE
===============

Consists of the following stages:

- Fetch (FE): fetches instructions from the FBUS.
- Decode (DE): decodes instructions.
- EA A (EA) : calculates EA for A
- EA B (EB) : calculates EA for B
- Load A (LA): loads operand A from ABUS.
- Load B (LB): loads operand B from ABUS.
- Execute (EX): performs the ALU operation.
- Save A (SA): saves operand A to the FBUS.

 0| 1| 2| 3| 0| 1| 2| 3| 0| 1| 2| 3
      FE|DE|EA|EB|LA|LB|EX|SA
                  FE|DE|EA|EB|LA|LB|EX|SA
                               FE|DE|EA|EB|LA|LB|EX|SA
 */

// 775@155
// 692@159
// 685@160
// 603@138
// 573@138
// 508@141
// 502@149
// 712@153
// 679@162

module dcpu16_cpu (/*AUTOARG*/
   // Outputs
   g_wre, g_stb, g_dto, g_adr, f_wre, f_stb, f_dto, f_adr,
   // Inputs
   rst, g_dti, g_ack, f_dti, f_ack, clk
   );

   /*AUTOOUTPUT*/
   // Beginning of automatic outputs (from unused autoinst outputs)
   output [15:0]	f_adr;			// From m0 of dcpu16_mbus.v
   output [15:0]	f_dto;			// From x0 of dcpu16_alu.v
   output		f_stb;			// From m0 of dcpu16_mbus.v
   output		f_wre;			// From m0 of dcpu16_mbus.v
   output [15:0]	g_adr;			// From m0 of dcpu16_mbus.v
   output [15:0]	g_dto;			// From x0 of dcpu16_alu.v
   output		g_stb;			// From m0 of dcpu16_mbus.v
   output		g_wre;			// From m0 of dcpu16_mbus.v
   // End of automatics
   /*AUTOINPUT*/
   // Beginning of automatic inputs (from unused autoinst inputs)
   input		clk;			// To c0 of dcpu16_ctl.v, ...
   input		f_ack;			// To c0 of dcpu16_ctl.v, ...
   input [15:0]		f_dti;			// To c0 of dcpu16_ctl.v, ...
   input		g_ack;			// To m0 of dcpu16_mbus.v
   input [15:0]		g_dti;			// To m0 of dcpu16_mbus.v
   input		rst;			// To c0 of dcpu16_ctl.v, ...
   // End of automatics
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			CC;			// From x0 of dcpu16_alu.v
   wire			bra;			// From c0 of dcpu16_ctl.v
   wire			ena;			// From m0 of dcpu16_mbus.v
   wire [15:0]		ireg;			// From c0 of dcpu16_ctl.v
   wire [3:0]		opc;			// From c0 of dcpu16_ctl.v
   wire [1:0]		pha;			// From c0 of dcpu16_ctl.v
   wire [15:0]		regA;			// From m0 of dcpu16_mbus.v
   wire [15:0]		regB;			// From m0 of dcpu16_mbus.v
   wire [15:0]		regO;			// From x0 of dcpu16_alu.v
   wire [15:0]		regR;			// From x0 of dcpu16_alu.v
   wire [2:0]		rra;			// From c0 of dcpu16_ctl.v
   wire [15:0]		rrd;			// From r0 of dcpu16_regs.v
   wire [2:0]		rwa;			// From c0 of dcpu16_ctl.v
   wire [15:0]		rwd;			// From x0 of dcpu16_alu.v
   wire			rwe;			// From c0 of dcpu16_ctl.v
   wire			wpc;			// From m0 of dcpu16_mbus.v
   // End of automatics
   /*AUTOREG*/

   dcpu16_ctl
     c0 (/*AUTOINST*/
	 // Outputs
	 .ireg				(ireg[15:0]),
	 .pha				(pha[1:0]),
	 .opc				(opc[3:0]),
	 .rra				(rra[2:0]),
	 .rwa				(rwa[2:0]),
	 .rwe				(rwe),
	 .bra				(bra),
	 // Inputs
	 .CC				(CC),
	 .wpc				(wpc),
	 .f_dti				(f_dti[15:0]),
	 .f_ack				(f_ack),
	 .clk				(clk),
	 .ena				(ena),
	 .rst				(rst));   

   dcpu16_mbus
     m0 (/*AUTOINST*/
	 // Outputs
	 .g_adr				(g_adr[15:0]),
	 .g_stb				(g_stb),
	 .g_wre				(g_wre),
	 .f_adr				(f_adr[15:0]),
	 .f_stb				(f_stb),
	 .f_wre				(f_wre),
	 .ena				(ena),
	 .wpc				(wpc),
	 .regA				(regA[15:0]),
	 .regB				(regB[15:0]),
	 // Inputs
	 .g_dti				(g_dti[15:0]),
	 .g_ack				(g_ack),
	 .f_dti				(f_dti[15:0]),
	 .f_ack				(f_ack),
	 .bra				(bra),
	 .CC				(CC),
	 .regR				(regR[15:0]),
	 .rrd				(rrd[15:0]),
	 .ireg				(ireg[15:0]),
	 .regO				(regO[15:0]),
	 .pha				(pha[1:0]),
	 .clk				(clk),
	 .rst				(rst));
   
   dcpu16_alu
     x0 (/*AUTOINST*/
	 // Outputs
	 .f_dto				(f_dto[15:0]),
	 .g_dto				(g_dto[15:0]),
	 .rwd				(rwd[15:0]),
	 .regR				(regR[15:0]),
	 .regO				(regO[15:0]),
	 .CC				(CC),
	 // Inputs
	 .regA				(regA[15:0]),
	 .regB				(regB[15:0]),
	 .opc				(opc[3:0]),
	 .clk				(clk),
	 .rst				(rst),
	 .ena				(ena),
	 .pha				(pha[1:0]));
   
   
   dcpu16_regs
     r0 (/*AUTOINST*/
	 // Outputs
	 .rrd				(rrd[15:0]),
	 // Inputs
	 .rwd				(rwd[15:0]),
	 .rra				(rra[2:0]),
	 .rwa				(rwa[2:0]),
	 .rwe				(rwe),
	 .rst				(rst),
	 .ena				(ena),
	 .clk				(clk));
   
endmodule // dcpu16
