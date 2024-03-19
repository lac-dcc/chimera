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

module dcpu16_alu (/*AUTOARG*/
   // Outputs
   f_dto, g_dto, rwd, regR, regO, CC,
   // Inputs
   regA, regB, opc, clk, rst, ena, pha
   );

   output [15:0] f_dto,
		 g_dto,
		 rwd;
   
   output [15:0] regR,
		 regO;
   output 	 CC;   
   
   input [15:0]  regA,
		 regB;   
   
   input [3:0] 	 opc;
   
   input 	 clk,
		 rst,
		 ena;

   input [1:0] 	 pha;   

   wire [15:0] 	 src, // a
		 tgt; // b
   
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg			CC;
   reg [15:0]		regO;
   reg [15:0]		regR;
   // End of automatics

   reg 		c;
   reg [15:0] 	add;
   reg [33:0] 	mul;	
   reg [31:0] 	shl,
		shr;   
   
   assign f_dto = regR;
   assign g_dto = regR;   
   assign rwd = regR;   
   
   assign src = regA;
   assign tgt = regB;   

   // adder
   always @(/*AUTOSENSE*/opc or src or tgt) begin
      {c,add} <= (~opc[0]) ? (src + tgt) : (src - tgt);
      mul <= {1'b0,src} * {1'b0,tgt};
      shl <= src << tgt;
      shr <= src >> tgt;      
   end

   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	CC <= 1'h0;
	regO <= 16'h0;
	regR <= 16'h0;
	// End of automatics
     end else if (ena) begin

	// 0x1: SET a, b - sets a to b
	// 0x2: ADD a, b - sets a to a+b, sets O to 0x0001 if there's an overflow, 0x0 otherwise
	// 0x3: SUB a, b - sets a to a-b, sets O to 0xffff if there's an underflow, 0x0 otherwise
	// 0x4: MUL a, b - sets a to a*b, sets O to ((a*b)>>16)&0xffff
	// 0x5: DIV a, b - sets a to a/b, sets O to ((a<<16)/b)&0xffff. if b==0, sets a and O to 0 instead.
	// 0x6: MOD a, b - sets a to a%b. if b==0, sets a to 0 instead.
	// 0x7: SHL a, b - sets a to a<<b, sets O to ((a<<b)>>16)&0xffff
	// 0x8: SHR a, b - sets a to a>>b, sets O to ((a<<16)>>b)&0xffff	 
	// 0x9: AND a, b - sets a to a&b
	// 0xa: BOR a, b - sets a to a|b
	// 0xb: XOR a, b - sets a to a^b

	if (pha == 2'o0)
	  case (opc)
	    4'h2: regO <= {15'd0,c};
	    4'h3: regO <= {(16){c}};
	    4'h4: regO <= mul[31:16];
	    4'h7: regO <= shl[31:16];
	    4'h8: regO <= shr[15:0];
	    default: regO <= regO;	    
	  endcase // case (opc)

	if (pha == 2'o0)
	  case (opc)
	    4'h0: regR <= src;
	    4'h1: regR <= tgt;
	    4'h2: regR <= add;
	    4'h3: regR <= add;
	    4'h4: regR <= mul[15:0];
	    4'h7: regR <= shl[15:0];
	    4'h8: regR <= shr[31:16];
	    4'h9: regR <= src & tgt;
	    4'hA: regR <= src | tgt;
	    4'hB: regR <= src ^ tgt;
	    default: regR <= 16'hX;	    
	  endcase // case (opc)	
	
	/*
	if (pha == 2'o0)
	case (opc)

	  4'h0: {regO, regR} <= {regO, src};	  

	  // 0x1: SET a, b - sets a to b
	  4'h1: {regO, regR} <= {regO, tgt};

	  // 0x2: ADD a, b - sets a to a+b, sets O to 0x0001 if there's an overflow, 0x0 otherwise
	  // 0x3: SUB a, b - sets a to a-b, sets O to 0xffff if there's an underflow, 0x0 otherwise
	  // 0x4: MUL a, b - sets a to a*b, sets O to ((a*b)>>16)&0xffff
	  // 0x5: DIV a, b - sets a to a/b, sets O to ((a<<16)/b)&0xffff. if b==0, sets a and O to 0 instead.
	  // 0x6: MOD a, b - sets a to a%b. if b==0, sets a to 0 instead.
	  4'h2, 4'h3: {regO, regR} <= (opc[0]) ? 
				      {{(16){c}},as} : 
				      {15'd0,c,as};	  
	  4'h4: {regO, regR} <= {1'b0,src} * {1'b0,tgt}; // force 17x17 unsigned

	  // 0x7: SHL a, b - sets a to a<<b, sets O to ((a<<b)>>16)&0xffff
	  // 0x8: SHR a, b - sets a to a>>b, sets O to ((a<<16)>>b)&0xffff	 
	  4'h7: {regO, regR} <= src << tgt;
	  4'h8: {regR, regO} <= {src,16'h0} >> tgt;
	  
	  // 0x9: AND a, b - sets a to a&b
	  // 0xa: BOR a, b - sets a to a|b
	  // 0xb: XOR a, b - sets a to a^b
	  4'h9: {regO, regR} <= {regO, src & tgt};
	  4'hA: {regO, regR} <= {regO, src | tgt};
	  4'hB: {regO, regR} <= {regO, src ^ tgt};	  

	  default: {regO, regR} <= {regO, 16'hX};	  
	endcase // case (opc)
	 */
	
	// 0xc: IFE a, b - performs next instruction only if a==b
	// 0xd: IFN a, b - performs next instruction only if a!=b
	// 0xe: IFG a, b - performs next instruction only if a>b
	// 0xf: IFB a, b - performs next instruction only if (a&b)!=0	  	  
	  
	if (pha == 2'o0)
	  case (opc)
	    4'hC: CC <= (src == tgt);
	    4'hD: CC <= (src != tgt);
	    4'hE: CC <= (src > tgt);
	    4'hF: CC <= |(src & tgt);
	    default: CC <= 1'b1;	  
	  endcase // case (opc)
	
     end
   
endmodule // dcpu16_alu
