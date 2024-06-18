// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2023 11:49:13 PM
// Design Name: 
// Module Name: ctrl_480
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ctrl_480(
    input [6:0] Op,  //opcode
    input [6:0] Funct7,  //funct7 
    input [2:0] Funct3,    // funct3 
    input Zero,
    output RegWrite, // control signal for register write
    output MemWrite, // control signal for memory write
    output	[5:0]EXTOp,    // control signal to signed extension
    output [4:0] ALUOp,    // ALU opertion
    output [2:0] NPCOp,    // next pc operation
    output ALUSrc,   // ALU source for b
    output [2:0] DMType, //dm r/w type
    output [1:0] WDSel    // (register) write data selection  (MemtoReg)
    );
    
//R_type类型:
wire rtype  = ~Op[6]&Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; //opcode:0110011
wire i_add =rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0]; // add funct7:0000000 funct3:000
wire i_sub=rtype&~Funct7[6]&Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&~Funct3[0]; // sub funct7:0100000 funct3:000
//sll funct7:0000000 funct3:001
wire i_sll = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&~Funct3[1]&Funct3[0]; 
//slt funct7:0000000 funct3:010
wire i_slt = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&Funct3[1]&~Funct3[0]; 
//sltu funct7:0000000 funct3:011
wire i_sltu = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&~Funct3[2]&Funct3[1]&Funct3[0]; 
//xor funct7:0000000 funct3:100
wire i_xor = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&Funct3[2]&~Funct3[1]&~Funct3[0]; 
//srl funct7:0000000 funct3:101
wire i_srl = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&Funct3[2]&~Funct3[1]&Funct3[0]; 
//sra funct7:0100000 funct3:101
wire i_sra = rtype&~Funct7[6]&Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&Funct3[2]&~Funct3[1]&Funct3[0]; 
//or funct7:0000000 funct3:110
wire i_or = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&Funct3[2]&Funct3[1]&~Funct3[0]; 
//and funct7:0000000 funct3:111
wire i_and = rtype&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]&Funct3[2]&Funct3[1]&Funct3[0]; 

//i_l type类型(load)  
wire itype_l  = ~Op[6]&~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; //opcode:0000011
wire i_lb=itype_l&~Funct3[2]& ~Funct3[1]& ~Funct3[0]; //lb funct3:000
wire i_lh=itype_l&~Funct3[2]& ~Funct3[1]& Funct3[0];  //lh funct3:001
wire i_lw=itype_l&~Funct3[2]& Funct3[1]& ~Funct3[0];  //lw funct3:010
wire i_lbu = itype_l&Funct3[2]& ~Funct3[1]& ~Funct3[0];//lbu funct3:100
wire i_lhu = itype_l&Funct3[2]& ~Funct3[1]& Funct3[0];//lhu funct3:101

// i_i type
wire itype_r  = ~Op[6]&~Op[5]&Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; //opcode: 0010011
wire i_addi  =  itype_r& ~Funct3[2]& ~Funct3[1]& ~Funct3[0]; //addi的funct3: 000 
wire i_slti = itype_r&~Funct3[2]&Funct3[1]&~Funct3[0]; //slti funct3:010
wire i_sltiu = itype_r&~Funct3[2]&Funct3[1]&Funct3[0]; //sltiu funct3:011
wire i_xori = itype_r&Funct3[2]&~Funct3[1]&~Funct3[0]; //xori funct3:100
wire i_ori =  itype_r&Funct3[2]&Funct3[1]&~Funct3[0]; //ori funct3:110
wire i_andi = itype_r&Funct3[2]&Funct3[1]&Funct3[0]; //ori funct3:111
//slli的funct3: 001,funct7: 0000000
wire i_slli = itype_r&~Funct3[2]&~Funct3[1]&Funct3[0]&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]; 
//srli的funct3: 101,funct7: 0000000
wire i_srli = itype_r&Funct3[2]&~Funct3[1]&Funct3[0]&~Funct7[6]&~Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]; 
//srai的funct3: 101,funct7: 0100000
wire i_srai = itype_r&Funct3[2]&~Funct3[1]&Funct3[0]&~Funct7[6]&Funct7[5]&~Funct7[4]&~Funct7[3]&~Funct7[2]&~Funct7[1]&~Funct7[0]; 

// i_j type类型指令(jalr)
wire itype_j = Op[6]&Op[5]&~Op[4]&~Op[3]&Op[2]&Op[1]&Op[0];//opcpde: 1100111
wire i_jalr = itype_j& ~Funct3[2]& ~Funct3[1]& ~Funct3[0];//jalr的funct3: 000

// s format
wire stype=~Op[6]&Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];//opcode: 0100011
wire i_sw=stype& ~Funct3[2]& Funct3[1]&~Funct3[0]; // sw的funct3: 010
wire i_sb=stype& ~Funct3[2]& ~Funct3[1]&~Funct3[0];// sb的funct3: 010
wire i_sh=stype& ~Funct3[2]&~Funct3[1]&Funct3[0];// sh的funct3: 010

//SB format
wire sbtype = Op[6]&Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0]; //opcode: 1100011
wire sb_beq = sbtype&~Funct3[2]& ~Funct3[1]& ~Funct3[0]; //sb_beq的funct3: 000
wire sb_bne = sbtype&~Funct3[2]& ~Funct3[1]& Funct3[0]; //sb_bne的funct3: 001
wire sb_blt = sbtype&Funct3[2]& ~Funct3[1]& ~Funct3[0]; //sb_blt的funct3: 100
wire sb_bge = sbtype&Funct3[2]& ~Funct3[1]& Funct3[0]; //sb_bge的funct3: 101
wire sb_bltu = sbtype&Funct3[2]& Funct3[1]& ~Funct3[0]; //sb_bltu的funct3: 110
wire sb_bgeu = sbtype&Funct3[2]& Funct3[1]& Funct3[0]; //sb_bgeu的funct3: 111

// UJ format（jal）
wire ujtype = Op[6]&Op[5]&~Op[4]&Op[3]&Op[2]&Op[1]&Op[0];//opcode: 1101111

//U format
//lui
wire utype_lui = ~Op[6]&Op[5]&Op[4]&~Op[3]&Op[2]&Op[1]&Op[0];//opcode: 0110111 
//auipc
wire utype_auipc = ~Op[6]&~Op[5]&Op[4]&~Op[3]&Op[2]&Op[1]&Op[0];//opcode: 0010111

//操作指令生成控制信号（写、MUX选择）
assign RegWrite = rtype | itype_r|itype_l|ujtype|itype_j|utype_auipc|utype_lui; // register writ e
assign MemWrite = stype;              // memory write
assign ALUSrc  = itype_r | stype | itype_l | i_jalr |utype_auipc|utype_lui; // ALU B is from instruction immediate

//mem2reg=wdsel ,WDSel_FromALU 2'b00  WDSel_FromMEM 2'b01  WDSel_FromPC 2'b10 
assign WDSel[0] = itype_l;   
assign WDSel[1] = ujtype|i_jalr;

//根据对应的类型生成ALUOP
//`define ALUOp_nop 5'b00000
//`define ALUOp_lui 5'b00001
//`define ALUOp_auipc 5'b00010
//`define ALUOp_add 5'b00011
//`define ALUOp_sub 5'b00100
//`define ALUOp_bne 5'b00101
//`define ALUOp_blt 5'b00110
//`define ALUOp_bge 5'b00111
//`define ALUOp_bltu 5'b01000
//`define ALUOp_bgeu 5'b01001
//`define ALUOp_slt 5'b01010
//`define ALUOp_sltu 5'b01011
//`define ALUOp_xor 5'b01100
//`define ALUOp_or 5'b01101
//`define ALUOp_and 5'b01110
//`define ALUOp_sll 5'b01111
//`define ALUOp_srl 5'b10000
//`define ALUOp_sra 5'b10001
assign ALUOp[0] = utype_lui|i_addi|i_add|i_sltu|i_or|i_ori|i_sll|i_slli|i_sra|i_srai|stype|itype_l|sb_bne|sb_bge|sb_bgeu;
assign ALUOp[1] = utype_auipc|i_addi|i_add|i_slt|i_sltu|i_and|i_andi|i_sll|i_slli|stype|itype_l|sb_blt|sb_bge;
assign ALUOp[2] = i_sub|i_xor|i_xori|i_or|i_ori|i_and|i_andi|i_sll|i_slli|sb_beq|sb_bne|sb_blt|sb_bge;
assign ALUOp[3] = i_slt|i_sltu|i_xor|i_xori|i_or|i_ori|i_and|i_andi|i_sll|i_slli|sb_bltu|sb_bgeu;
assign ALUOp[4] = i_srl|i_srli|i_sra|i_srai;


//操作指令生成常数扩展操作
//`define EXT_CTRL_ITYPE_SHAMT 	6'b100000
//`define EXT_CTRL_ITYPE  6'b010000
//`define EXT_CTRL_STYPE  6'b001000
//`define EXT_CTRL_BTYPE  6'b000100
//`define EXT_CTRL_UTYPE  6'b000010
//`define EXT_CTRL_JTYPE  6'b000001
assign EXTOp[5] =  i_slli|i_sll|i_sra|i_srai|i_srl|i_srli;
assign EXTOp[4] =  (itype_l|itype_r|i_jalr)& ~EXTOp[5];
assign EXTOp[3] =  stype;
assign EXTOp[2] =  sbtype;
assign EXTOp[1] =  utype_lui|utype_auipc;
assign EXTOp[0] =  ujtype;

//根据具体S和i_L指令生成DataMem数据操作类型编码   
// dm_word 3'b000
//dm_halfword 3'b001
//dm_halfword_unsigned 3'b010
//dm_byte 3'b011
//dm_byte_unsigned 3'b100
//assign DMType[2]=i_lbu;
//assign DMType[1]=i_lb | i_sb | i_lhu;
//assign DMType[0]=i_lh | i_sh | i_lb | i_sb;
assign DMType[2]=i_lbu;
assign DMType[1]=i_lb | i_sb | i_lhu;
assign DMType[0]=i_lh | i_sh | i_lb | i_sb;

//NPCOP的选择
//正常：000
//SB形指令:001
//jal:010
//jalr:100
assign NPCOp[2] = i_jalr;
assign NPCOp[1] = ujtype;
assign NPCOp[0] = sbtype;

endmodule
