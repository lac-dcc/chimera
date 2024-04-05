`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:37:25 11/18/2020 
// Design Name: 
// Module Name:    control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "macros.v"
module Control(
    input [31:0] instr,
	
	// the cmp in Decode-Stage will tell u
	input eq,
	input eqz,
	input ltz,
	
	// Decode-Stage
    output sign,
	
	output branch,
    output JType,
    output JReg,
	
	output WDSelD,	// jump and link will generate the WriteData
	output [4:0] A3DE,		// GRF WriteDst
	
	
	// Execute-Stage
    output [3:0] ALUOp,
	output ALUASel,
	output ALUBSel,
	output [1:0] WDSelE,	// res or WriteDate generate on D-Stage
	
	// Memory-Stage
	output WEMem,
	output [1:0] width,
	output LoadSign,
	output WDSelM,
	
	// stall signals
	output D1Use,
	output D2Use,
	output E1Use,
	output E2Use,
	output M2Use
	
	
    );
	
	wire [5:0] op, funct, rt;
	assign op = instr[`op];
	assign funct = instr[`funct];
	assign rt = instr[`rt];
	
	wire addu,subu,ori,lw,sw,beq,lui,jal,nop;
	wire addi;
	
/// P5 decode
	assign addu = (op == `R)&(funct == `ADDU);
	assign subu = (op == `R)&(funct == `SUBU);
	assign ori = (op == `ORI);
	assign lw = (op == `LW);
	assign sw = (op == `SW);
	assign beq = (op == `BEQ);
	assign lui = (op == `LUI);
	
	// Jump
	assign j = (op == `J);
	assign jal = (op == `JAL);
	
	assign jr = (op == `R)&(funct == `JR);
	assign jalr = (op == `R)&(funct == `JALR);
	
/// P6 decode
	assign	nop= (op == `R)&(funct == 0),
	
	/////// R type op and funct
			add = (op == `R) && (funct == `ADD),
			sub = (op == `R) && (funct == `SUB),
			
			// Bit operation
			andw = (op == `R) && (funct == `AND),	// "and" is key word
			orw = (op == `R) && (funct == `OR),		// "or" is key word
			xorw = (op == `R) && (funct == `XOR),
			norw = (op == `R) && (funct == `NOR),
			
			// mult and div
			mult = (op == `R) && (funct == `MULT),
			multu = (op == `R) && (funct == `MULTU),
			div = (op == `R) && (funct == `DIV),
			divu = (op == `R) && (funct == `DIVU),
			
			// shift operation
			sll = (op == `R) && (funct == `SLL),
			srl = (op == `R) && (funct == `SRL),
			sra = (op == `R) && (funct == `SRA),
			sllv = (op == `R) && (funct == `SLLV),
			srlv = (op == `R) && (funct == `SRLV),
			srav = (op == `R) && (funct == `SRAV),
			
			// set less than(signed or unsigned)
			slt = (op == `R) && (funct == `SLT),
			sltu = (op == `R) && (funct == `SLTU),
			
			// HI/LO
			mfhi = (op == `R) && (funct == `MFHI),
			mflo = (op == `R) && (funct == `MFLO),
			mthi = (op == `R) && (funct == `MTHI),
			mtlo = (op == `R) && (funct == `MTLO),
			
	/////// I type only the op
			
			addi = (op == `ADDI),
			addiu = (op == `ADDIU),
			
			andi = (op == `ANDI),
			xori = (op == `XORI),
			
			slti = (op == `SLTI),
			sltiu = (op == `SLTIU),


	////// MEM only op
			lb = (op == `LB),
			lbu = (op == `LBU),
			lh = (op == `LH),
			lhu = (op == `LHU),
			sb = (op == `SB),
			sh = (op == `SH),
			
			
			
	////// Branch only op	
			bne = (op == `BNE),
			blez = (op == `BLEZ),
			bgtz = (op == `BGTZ),
			bltz = (op == `BLTZ) && (rt == 0),
			bgez = (op == `BGEZ) && (rt == 5'b00001);
			
	

///////////// Decode /////////////////////////

	// sign
	assign sign = addi | lw | sw | beq;
	
	// branch
	assign branch =  (beq & eq);
	// JType
	assign JType = j || jal;
	// JReg
	assign JReg = jr || jalr;
	
	// WDSelD
	// if link, set 1
	// wrtie data would be generated right now
	assign WDSelD = jal | jalr;
	
	// A3DE where gonna write, rt/rd
	assign A3DE =	(jal)? 5'd31:
					(lui | ori| lw | addi)? instr[`rt]:		// I-Type
					(addu | subu | jalr)? instr[`rd]:	// write to rd
					0;	// if not gonna write, set to 0
////////// Decode End /////////////

//////////// Execute begin ///////////

	// ALUOp
	assign ALUOp =	(addu | addi | add)?  4'b0000 :
					(subu | sub)?	4'b0001 :
					(andi | andw)?	4'b0010 :
					(ori | orw)?	4'b0011 :
					(lui)?			4'b0100 :
					0;
	// ALUSel
	assign ALUASel = sll || srl || sra;
	assign ALUBSel = ori || lw || sw || lui || addi;	// I-Type, Store/Load
	assign WDSelE = mflo ? 2'b11 :
					mfhi ? 2'b10 :
					(addu || subu || ori || lui || add || sub || sll || srl || sra || sllv || srlv || srav || andw || orw || xorw || norw || addi || addiu || andi || xori || slt || slti || sltiu || sltu) ? 2'b01 :	// use alu data
					  2'b00;	// default use jump data that generate on D-Stage
////////////// Execute End ////////////


//////////// Memory Begin /////////////
	assign WEMem = sw || sh || sb;
	assign width =	(sb || lb || lbu) ? 2'b10 :
					(sh || lh || lhu) ? 2'b01 :
					2'b00;	// default 32-bits word
	assign LoadSign = lb || lh;		// lb and lh default LoadSign
	
	assign WDSelM = lw || lb || lbu || lh || lhu;	// once load, use the DM data
//////////// Memory End //////////////


////////////// Stall Begin ///////////////

	// D-Use: the RegRead Data is using in the Decode-Stage
	// D-Use will tell the Forwaed, I need the GRF Data right now!!
	assign D1Use = jr || jalr || beq || bne || blez || bgtz || bltz || bgez;
	assign D2Use = beq || bne;
	
	
	// E-Use: the RegRead Data is using in the Exe-Stage
	// E-Use will tell the Forwaed/Stall, I need the GRF Data right now!!
	assign E1Use = addu | subu | ori | addi | orw | lw | sw;
	assign E2Use = addu | subu | orw;
	
	
	// M-Use: the RegRead Data is useing in the Mem-Stage
	assign M2Use = sw || sh || sb;
endmodule
