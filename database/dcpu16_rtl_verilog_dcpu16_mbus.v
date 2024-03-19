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
 MEMORY BUS

 Handles *all* the memory control signals for both F-BUS and A-BUS. 
 */

module dcpu16_mbus (/*AUTOARG*/
   // Outputs
   g_adr, g_stb, g_wre, f_adr, f_stb, f_wre, ena, wpc, regA, regB,
   // Inputs
   g_dti, g_ack, f_dti, f_ack, bra, CC, regR, rrd, ireg, regO, pha,
   clk, rst
   );

   // Simplified Wishbone
   output [15:0] g_adr;
   output 	 g_stb,
		 g_wre;
   input [15:0]  g_dti;
   input 	 g_ack;   

   // Simplified Wishbone
   output [15:0] f_adr;
   output 	 f_stb,
		 f_wre;
   input [15:0]  f_dti;
   input 	 f_ack;   
   
   // internal
   output 	 ena;
   output 	 wpc;   
   output [15:0] regA,
		 regB;

   input 	 bra;
   input 	 CC;   
   input [15:0]  regR;   
   input [15:0]  rrd;
   input [15:0]  ireg;   
   input [15:0]  regO;   

   input [1:0] 	 pha;   
   input 	 clk,
		 rst;

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg [15:0]		f_adr;
   reg			f_stb;
   reg			f_wre;
   reg [15:0]		g_adr;
   reg			g_stb;
   reg [15:0]		regA;
   reg [15:0]		regB;
   reg			wpc;
   // End of automatics

   reg 			wsp;   
   reg [15:0] 		regSP,
			regPC;
   
   assign ena = (f_stb ~^ f_ack) & (g_stb ~^ g_ack); // pipe stall
   
   // repeated decoder
   wire [5:0] 		decA, decB;
   wire [3:0] 		decO;   
   assign {decB, decA, decO} = ireg;   
  
   /*
    0x00-0x07: register (A, B, C, X, Y, Z, I or J, in that order)
    0x08-0x0f: [register]
`    0x10-0x17: [next word + register]
         0x18: POP / [SP++]
         0x19: PEEK / [SP]
         0x1a: PUSH / [--SP]
         0x1b: SP
         0x1c: PC
         0x1d: O
         0x1e: [next word]
         0x1f: next word (literal)
    0x20-0x3f: literal value 0x00-0x1f (literal)
    */

   // decode EA     
   wire 		Fjsr = (ireg [4:0] == 5'h10);   

   wire [5:0] 		ed = (pha[0]) ? decB : decA;   

   wire 		Eind = (ed[5:3] == 3'o1); // [R]
   wire 		Enwr = (ed[5:3] == 3'o2); // [[PC++] + R]
   wire 		Epop = (ed[5:0] == 6'h18); // [SP++]
   wire 		Epek = (ed[5:0] == 6'h19); // [SP]
   wire 		Epsh = (ed[5:0] == 6'h1A); // [--SP]
   wire 		Ersp = (ed[5:0] == 6'h1B); // SP
   wire 		Erpc = (ed[5:0] == 6'h1C); // PC
   wire 		Erro = (ed[5:0] == 6'h1D); // O
   wire 		Enwi = (ed[5:0] == 6'h1E); // [PC++]
   wire 		Esht = ed[5]; // xXX

   wire [5:0] 		fg = (pha[0]) ? decA : decB;   

   wire 		Fdir = (fg[5:3] == 3'o0); // R
   wire 		Find = (fg[5:3] == 3'o1); // [R]
   wire 		Fnwr = (fg[5:3] == 3'o2); // [[PC++] + R]
   wire 		Fspi = (fg[5:0] == 6'h18); // [SP++]
   wire 		Fspr = (fg[5:0] == 6'h19); // [SP]
   wire 		Fspd = (fg[5:0] == 6'h1A); // [--SP]  
   wire 		Frsp = (fg[5:0] == 6'h1B); // SP
   wire 		Frpc = (fg[5:0] == 6'h1C); // PC
   wire 		Fnwi = (fg[5:0] == 6'h1E); // [PC++]
   wire 		Fnwl = (fg[5:0] == 6'h1F); // PC++   
   
   // PROGRAMME COUNTER - loadable binary up counter
   reg [15:0] 		rpc;
   reg 			lpc;  
   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	regPC <= 16'h0;
	wpc <= 1'h0;
	// End of automatics
     end else if (ena) begin
	if (lpc)
	  regPC <= rpc;
	else
	  regPC <= regPC + 1;

       	case (pha)
	  2'o1: wpc <= Frpc & CC;
	  default: wpc <= wpc;	  
	endcase // case (pha)
     end // if (ena)

   always @(/*AUTOSENSE*/Fnwi or Fnwl or Fnwr or bra or pha or regB
	    or regPC or regR or wpc) begin      
      case (pha)
	2'o1: rpc <= (wpc) ? regR :
		     (bra) ? regB :
		     regPC;
	default: rpc <= regPC;	
      endcase // case (pha)
      case (pha)
	2'o3: lpc <= ~(Fnwr | Fnwi | Fnwl);
	2'o0: lpc <= ~(Fnwr | Fnwi | Fnwl);
	2'o1: lpc <= 1'b1;	
	default: lpc <= 1'b0;	
      endcase // case (pha)
   end // always @ (...
   
   // STACK POINTER - loadable binary up/down counter   
   reg [15:0] _rSP;
   reg 	      lsp;
   reg [15:0] rsp;
   
   always @(posedge clk)
     if (rst) begin
	regSP <= 16'hFFFF;
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	_rSP <= 16'h0;
	wsp <= 1'h0;
	// End of automatics
     end else if (ena) begin
	_rSP <= regSP; // backup SP

	if (lsp) // manipulate SP
	  regSP <= rsp;
	else if (fg[1] | Fjsr)
	  regSP <= regSP - 1;
	else
	  regSP <= regSP + 1;

	case (pha) // write to SP
	  2'o1: wsp <= Frsp & CC;	  
	  default: wsp <= wsp;	  
	endcase // case (pha)
     end // if (ena)

   always @(/*AUTOSENSE*/Fjsr or Fspd or Fspi or pha or regR or regSP
	    or wsp) begin
      case (pha)
	2'o3: lsp <= ~(Fspi | Fspd | Fjsr);	
	2'o0: lsp <= ~(Fspi | Fspd);
	default: lsp <= 1'b1;	
      endcase // case (pha)
      
      case (pha)
	2'o1: rsp <= (wsp) ? regR :
		     regSP;	
	default: rsp <= regSP;	
      endcase // case (pha)
   end // always @ (...

   // EA CALCULATOR
   wire [15:0] 		nwr = rrd + g_dti;   // FIXME: Reduce this and combine with other ALU
   reg [15:0] 		ea, 
			eb;
   reg [15:0] 		ec; // Calculated EA
 
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	ea <= 16'h0;
	eb <= 16'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o0: ea <= (Fjsr) ? regSP : ec;	  
	  default: ea <= ea;	  
	endcase // case (pha)

	case (pha)
	  2'o1: eb <= ec;	  
	  default: eb <= eb;	  
	endcase // case (pha)
     end // if (ena)
  
   always @(/*AUTOSENSE*/Eind or Enwi or Enwr or Epek or Epop or Epsh
	    or _rSP or g_dti or nwr or regSP or rrd) begin
      ec <= (Eind) ? rrd :
	    (Enwr) ? nwr :
	    //(Fjsr) ? decSP :
	    (Epsh) ? regSP :
	    (Epop | Epek) ? _rSP :
	    (Enwi) ? g_dti :
	    16'hX;      
   end
   
   // G-BUS
   assign g_wre = 1'b0;
   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	g_adr <= 16'h0;
	g_stb <= 1'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o1: g_adr <= ea;
	  2'o2: g_adr <= eb;	  
	  default: g_adr <= regPC;	  
	endcase // case (pha)

	case (pha)
	  2'o3: g_stb <= Fnwr | Fnwi | Fnwl;
	  2'o0: g_stb <= Fnwr | Fnwi | Fnwl;
	  2'o1: g_stb <= Find | Fnwr | Fspr | Fspi | Fspd | Fnwi;
	  2'o2: g_stb <= Find | Fnwr | Fspr | Fspi | Fspd | Fnwi;	  
	endcase // case (pha)
     end // if (ena)
   

   // F-BUS
   reg [15:0] _adr;
   reg 	      _stb, _wre;   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	_adr <= 16'h0;
	_stb <= 1'h0;
	_wre <= 1'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o2: begin
	     _adr <= g_adr;
	     _stb <= g_stb | Fjsr;
	  end
	  default:begin
	     _adr <= _adr;
	     _stb <= _stb;	     
	  end
	endcase // case (pha)

	case (pha)
	  2'o1: _wre <= Find | Fnwr | Fspr | Fspi | Fspd | Fnwi | Fjsr;	     
	  default: _wre <= _wre;	  
	endcase // case (pha)
	
     end // if (ena)

   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	f_adr <= 16'h0;
	f_stb <= 1'h0;
	f_wre <= 1'h0;
	// End of automatics
     end else if (ena) begin

	case (pha)
	  2'o1: f_adr <= (wpc) ? regR :
			 (bra) ? regB :
			 regPC;
	  2'o0: f_adr <= _adr;	  
	  default: f_adr <= 16'hX;	  
	endcase // case (pha)

	case (pha)
	  2'o1: {f_stb,f_wre} <= (Fjsr) ? 2'o0 : 2'o2;
	  2'o0: {f_stb,f_wre} <= {_stb, _wre & CC};	  
	  default: {f_stb,f_wre} <= 2'o0;	  
	endcase // case (pha)

     end // if (ena)
   
   // REG-A/REG-B
   reg 			_rd;
   reg [15:0] 		opr;
   
   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	_rd <= 1'h0;
	// End of automatics
     end else if (ena)
       	case (pha)
	  2'o1: _rd <= Fdir;
	  2'o2: _rd <= Fdir;	  
	  default: _rd <= 1'b0;	  
	endcase // case (pha)

   always @(posedge clk)
     if (rst) begin
	/*AUTORESET*/
	// Beginning of autoreset for uninitialized flops
	regA <= 16'h0;
	regB <= 16'h0;
	// End of automatics
     end else if (ena) begin
	case (pha)
	  2'o0: regA <= opr;	  
	  2'o2: regA <= (g_stb) ? g_dti :
			(Fjsr) ? regPC :
			(_rd) ? rrd :
			regA;	     
	  default: regA <= regA;
	endcase // case (pha)
	
	case (pha)
	  2'o1: regB <= opr;	  
	  2'o3: regB <= (g_stb) ? g_dti :
			(_rd) ? rrd :
			regB;
	  default: regB <= regB;	  
	endcase // case (pha)
     end // if (ena)

   always @(/*AUTOSENSE*/Erpc or Erro or Ersp or Esht or ed or g_dti
	    or g_stb or regO or regPC or regSP) begin
      opr <= (g_stb) ? g_dti :
	     (Ersp) ? regSP :
	     (Erpc) ? regPC :
	     (Erro) ? regO :
	     (Esht) ? {11'd0,ed[4:0]} :
	     16'hX;
   end
   
endmodule // dcpu16_mbus
