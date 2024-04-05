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
	
/// Decode-Stage
    output sign,	// Extend signed?
	
	output branch,
    output JType,
    output JReg,
	
	output WDSelD,	// jump and link will generate the WriteData
	output [4:0] A3DE,		// GRF WriteDst
	output MD,	// gonna use MDU, detect and try to stall at D-Stage
	
	// Exc and Int
	output BD,	// Branch Delay
	output RI,	// Reserved Instruction
	
	
/// Execute-Stage
    output [3:0] ALUOp,
	output ALUASel,
	output ALUBSel,
	output [1:0] WDSelE,	// res or WriteDate generate on D-Stage
	output start,	// MDU need to work @posedge clk
	output [2:0] MDUOp,
	output HIWrite,	// write into HI 
	output LOWrite,
	
	// Exc
	output Ov,	// self-trapping arithmetic instruction, like add etc.
	output Ld,	// fetch data from DM, the addr may be wrong
	output St,	// store data to DM, the addr may be wrong
	
/// Memory-Stage
	output WEMem,
	output [1:0] width,
	output LoadSign,
	output [1:0] WDSelM,
	
	// stall signals
	output D1Use,
	output D2Use,
	output E1Use,
	output E2Use,
	output M2Use,
	
/// Exc
	output eret,
	output CP0WE	// write CP0
	
    );
	
	wire [5:0] op, funct, rs, rt, rd;
	assign op = instr[`op];
	assign funct = instr[`funct];
	assign 	rs = instr[`rs],
			rt = instr[`rt],
			rd = instr[`rd];
	
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
			
			// Bitwise
			andw = (op == `R) && (funct == `AND),	// "and" is key word
			orw = (op == `R) && (funct == `OR),		// "or" is key word
			xorw = (op == `R) && (funct == `XOR),
			norw = (op == `R) && (funct == `NOR),
			
			// shift operation
			sll = (op == `R) && (funct == `SLL),
			srl = (op == `R) && (funct == `SRL),
			sra = (op == `R) && (funct == `SRA),
			sllv = (op == `R) && (funct == `SLLV),
			srlv = (op == `R) && (funct == `SRLV),
			srav = (op == `R) && (funct == `SRAV),
			
			// set less than
			slt = (op == `R) && (funct == `SLT),
			sltu = (op == `R) && (funct == `SLTU),
			
			// mult and div
			mult = (op == `R) && (funct == `MULT),
			multu = (op == `R) && (funct == `MULTU),
			div = (op == `R) && (funct == `DIV),
			divu = (op == `R) && (funct == `DIVU),
			
			
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

////// Exc and Int
		assign	eret = (op == `COP0) & (funct == `ERET),
				mfc0 = (op == `COP0) & (rs == 5'b0),
				mtc0 = (op == `COP0) & (rs == 5'b00100);
			
	

///////////// Decode /////////////////////////

	// sign
	assign sign =	lw | lb | lbu| lh | lhu | sb | sh | sw | 
					addi | addiu | 
					slti | sltiu | 
					beq | bne | blez | bgtz | bgez;
	
	// branch
	assign branch = (beq & eq) | (bne & (!eq)) | (blez & (ltz | eqz)) |
					(bgtz & (!ltz & !eqz)) | (bltz & (ltz)) | (bgez & (!ltz));
	// JType
	assign JType = j || jal;
	// JReg
	assign JReg = jr || jalr;
	
	// WDSelD
	// if link, set 1
	// wrtie data would be generated right now
	assign WDSelD = jal | jalr;	// PC + 8 would be write into GRF
	
	// A3DE where gonna write, rt/rd
	// can be 5'bz sometimes, instructions like "lrm"/ "lwpl" ..., 
	// which u need to add in E-Stage and M-Stage, alse u need to add in the hzd
	assign A3DE =	(jal)? 5'd31:	// write to 31
	
					(lui | andi | ori| xori | 
					addi | addiu |
					slti | sltiu |  
					lw | lb | lbu | lh | lhu |
					mfc0)? instr[`rt]:		// I-Type, write to rt
					
					(addu | subu | add | sub | jalr |
					andw | orw | xorw | norw |
					sll | srl | sra | sllv | srlv | srav |
					slt | sltu |
					mfhi | mflo)? instr[`rd]:
					0;
					
		
	assign MD = mult || multu || div || divu || mfhi || mflo || mthi || mtlo;
	
	
	// exc and int
	// Branch Delay		Reserved Instruction
	assign BD = beq || bne || blez || bgtz || bltz || bgez || j || jal || jr || jalr;
	assign RI =!(lb | lbu | lh | lhu | lw |
				sb | sh | sw |
				add | addu | sub | subu | 
				sll | srl | sra | sllv | srlv | srav |
				andw | orw | xorw | norw |
				addi | addiu | andi | ori | xori | lui |
				slt | slti | sltiu | sltu | 
				beq | bne | blez | bgtz | bltz | bgez |
				j | jal | jalr | jr |
				mult | multu | div | divu | 
				mfhi | mflo | mthi | mtlo |
				eret | mfc0 | mtc0);	// nop is a reserved instr

////////// Decode End /////////////

//////////// Execute begin ///////////

	// ALUOp
	assign ALUOp =	(addu | addi | add | addiu)?  4'b0000 :
					(subu | sub)?	4'b0001 :
					(andi | andw)?	4'b0010 :
					(ori | orw)?	4'b0011 :
					(lui)?			4'b0100 :
					(norw)?			4'b0101 :
					(xorw | xori)?	4'b0110 :
					(sll | sllv)?	4'b0111 :
					(srl | srlv)?	4'b1000 :
					(sra | srav)?	4'b1001 :
					(slt | slti)?	4'b1010 :
					(sltu | sltiu)?	4'b1011 :
					0;	// lw, lb, lbu, lh, lhu, sw, sb, sh
	// ALUSel
	assign ALUASel = sll || srl || sra;	// use s in instr
	
	assign ALUBSel =	andi | ori | xori | lui | 
						lw | lb | lbu | lh | lhu | sw | sb | sh | 
						addi | addiu |
						slti | sltiu;	// I-Type, Store/Load
						
	// MDU signals
	assign start = mult | multu | div | divu;
	assign MDUOp =	multu ? 3'b000 :
					mult ?	3'b001 :
					divu ?	3'b010 :
					div ?	3'b011 :
					0;
	assign HIWrite = mthi;
	assign LOWrite = mtlo;
	
	assign WDSelE = mflo ? 2'b11 :
					mfhi ? 2'b10 :
					
					(addu | subu | add | sub | 
					andi | ori | xori | lui |	// bitwise
					andw | orw | xorw | norw |
					sll | srl | sra | sllv | srlv | srav | 
					addi | addiu | 
					slt | slti | sltiu | sltu) ? 2'b01 :	// use alu data
					
					  2'b00;	// default use jump data that generate on D-Stage
	// Exc
	assign Ov = add | addi | sub;	// this is an instr that may cause ovf
	assign Ld = lb | lbu | lh | lhu | lw;
	assign St = sb | sh | sw;
////////////// Execute End ////////////


//////////// Memory Begin /////////////
	assign WEMem = sw || sh || sb;
	assign width =	(sb || lb || lbu) ? 2'b10 :
					(sh || lh || lhu) ? 2'b01 :
					2'b00;	// default 32-bits word
	assign LoadSign = lb || lh;		// lb and lh default LoadSign
	
	assign WDSelM =	(lw || lb || lbu || lh || lhu)? 2'b01 :
					mfc0? 2'b10:
					0; // once load, use the DM data
//////////// Memory End //////////////


////////////// Stall Begin ///////////////

	// D-Use: the RegRead Data is using in the Decode-Stage
	// D-Use will tell the Forwaed, I need the GRF Data right now!!
	assign D1Use = jr || jalr || beq || bne || blez || bgtz || bltz || bgez;
	assign D2Use = beq || bne;
	
	
	// E-Use: the RegRead Data is using in the Exe-Stage
	// E-Use will tell the Forwaed/Stall, I need the GRF Data right now!!
	
		// use rs data
	assign E1Use =	add | addu | sub | subu | 
					ori | andi | xori |
					andw | orw | xorw | norw | 
					addi | addiu |
					lw | lb | lbu | lh | lhu | sw | sb | sh |
					sllv | srlv | srav |
					slt | slti | sltu | sltiu |
					mult | multu | div | divu |
					mthi | mtlo;
					
	assign E2Use =	add | sub | addu | subu | 
					orw | andw | xorw | norw |
					sll | srl | sra | sllv | srlv | srav |
					slt | sltu |
					mult | multu | div | divu;
	
	
	// M-Use: the RegRead Data is useing in the Mem-Stage
	assign M2Use = sw || sh || sb || mtc0;	// CP0[rd] <= GRF[rt]
	
	/// Exc and Int
	assign CP0WE = mtc0;
endmodule
