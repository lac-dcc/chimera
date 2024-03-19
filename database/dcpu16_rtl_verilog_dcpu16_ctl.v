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

// TODO: JSR
// FIXME: Reg-Reg forwarding

module dcpu16_ctl (/*AUTOARG*/
   // Outputs
   ireg, pha, opc, rra, rwa, rwe, bra,
   // Inputs
   CC, wpc, f_dti, f_ack, clk, ena, rst
   );

   output [15:0] ireg;   
   output [1:0]  pha;

   // shared
   output [3:0]  opc;
   output [2:0]  rra,
		 rwa;
   output 	 rwe;
   output 	 bra;

   input 	 CC;   
   input 	 wpc;
   
   input [15:0]  f_dti;   
   input 	 f_ack;   
  
   // system
   input 	 clk,
		 ena,
		 rst;

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			bra;
   reg [15:0]		ireg;
   reg [3:0]		opc;
   reg [1:0]		pha;
   reg [2:0]		rra;
   reg [2:0]		rwa;
   reg			rwe;
   // End of automatics

   // repeated decoder
   wire [5:0] 		decA, decB;
   wire [3:0] 		decO;   
   assign {decB, decA, decO} = ireg;   

   wire 		nop = 16'd1; // NOP = SET A, A   
   wire 		_skp = (decO == 4'h0);

   wire 		Fbra = (ireg[4:0] == 5'h10);   
   
   // PHASE CALCULATOR
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	pha <= 2'h0;
	// End of automatics
     end else if (ena) begin
	pha <= pha + 1;		
     end

   // IREG LATCH
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	ireg <= 16'h0;
	opc <= 4'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o2: ireg <= (wpc | Fbra) ? nop : f_dti; // latch instruction only on PHA2
	  default: ireg <= ireg;	  
	endcase // case (pha)

	case (pha)
	  2'o2: opc <= ireg[3:0];	  
	  default: opc <= opc;
	endcase // case (pha)
	
     end

   // BRANCH CONTROL
   reg _bra;   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	_bra <= 1'h0;
	bra <= 1'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o0: {bra, _bra} <= {_bra & CC, (ireg[5:0] == 5'h10)};	  
	  default: {bra, _bra} <= {1'b0, _bra};	  
	endcase // case (pha)
     end
   
   // REGISTER FILE
   reg [2:0] _rwa;
   reg 	     _rwe;   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	_rwa <= 3'h0;
	_rwe <= 1'h0;
	rra <= 3'h0;
	rwa <= 3'h0;
	rwe <= 1'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o3: rra <= decA[2:0];
	  2'o1: rra <= decA[2:0];
	  2'o2: rra <= decB[2:0];
	  2'o0: rra <= decB[2:0];	  
	  //default: rra <= 3'oX;	  
	endcase // case (pha)

	case (pha)
	  2'o0: {rwe} <= _rwe & CC & (opc[3:2] != 2'o3);	  
	  default: {rwe} <= {1'b0};	  
	endcase // case (pha)
	
	case (pha)
	  2'o1: {rwa} <= {_rwa};	  
	  default: {rwa} <= {rwa};	  
	endcase // case (pha)
	
	case (pha)
	  2'o0: begin
	     _rwa <= decA[2:0];
	     _rwe <= (decA[5:3] == 3'o0) & !_skp;	     
	  end
	  default: {_rwa, _rwe} <= {_rwa, _rwe};	  
	endcase // case (pha)
	
     end
   
endmodule // dcpu16_ctl
