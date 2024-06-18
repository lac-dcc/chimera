// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module alu_cntrl1(
input rst,
input [31:0] instr_reg_fetch,
output reg [3:0] alu_control_decode,
input [31:0] imm);

// R-type funcn 3 concat func7 
parameter ADD = 10'b0000000000;  //Concat funct7 and funct3
parameter SUB = 10'b0100000000;
parameter SLL = 10'b0000000001;  //Shift left logical 
parameter SLT = 10'b0000000010;  //Set less than 
parameter XOR = 10'b0000000100;
parameter SRL = 10'b0000000101;  //Shift right logical 
parameter SRA = 10'b0100000101;  //Shift right arithmetic 
parameter OR =  10'b0000000110;
parameter AND = 10'b0000000111;
  
//I-type 
  parameter ADDI = {imm[11:0], 3'b000};  //Concat funct7 and funct3
  parameter SLTI = {imm[11:0], 3'b010};
  parameter SLTIU = {imm[11:0], 3'b011};
  parameter XORI = {imm[11:0], 3'b100};
  parameter ORI =  {imm[11:0], 3'b110};
  parameter ANDI = {imm[11:0], 3'b111};
parameter SLLI = 10'b0000000001;
parameter SRLI = 10'b0000000101;
parameter SRAI = 10'b0100000101;
  
// S-Type
  parameter SB =  {imm[11:5], 3'b000};
  parameter SH = {imm[11:5], 3'b001};
  parameter SW = {imm[11:5], 3'b010};
  
  
  
// B-Type
  
  parameter BEQ = {imm[12], imm[10:5], 3'b000};
  parameter BNE = {imm[12], imm[10:5], 3'b001};
  parameter BLT = {imm[12], imm[10:5], 3'b100};
  parameter BGE = {imm[12], imm[10:5], 3'b101};
  parameter BLTU = {imm[12], imm[10:5], 3'b110};
  parameter BGEU = {imm[12], imm[10:5], 3'b111};
  	
 //L-Type 
  
  parameter LB = {imm[11:0], 3'b000};
  parameter LH = {imm[11:0], 3'b001};
  parameter LW = {imm[11:0], 3'b010};
  parameter LBU = {imm[11:0], 3'b100};
  parameter LHU = {imm[11:0], 3'b101};
  


// ALU Signal
parameter dum_sig = 4'b0000;
parameter add_sig = 4'b0001;
parameter sub_sig = 4'b0010;
parameter sll_sig = 4'b0011;
parameter slt_sig = 4'b0100;
parameter xor_sig = 4'b0101;
parameter srl_sig = 4'b0011;
parameter sra_sig = 4'b0111;
parameter or_sig  = 4'b1000;
parameter and_sig = 4'b1001;
  
//I-Type signals

parameter addi_sig = 4'b0001;
parameter slti_sig = 4'b0010;
parameter sltiu_sig = 4'b0011;
parameter xori_sig = 4'b0100;
parameter ori_sig = 4'b0101;
parameter andi_sig = 4'b0011;
parameter slli_sig = 4'b0111;
parameter srli_sig  = 4'b1000;
parameter srai_sig = 4'b1001;
  
//B-Type signals 
parameter beq_sig = 3'b000;
  parameter bne_sig = 3'b001;
  parameter blt_sig = 3'b010;
  parameter bge_sig = 3'b011;
  parameter bltu_sig = 3'b100;
  parameter bgeu_sig = 3'b101;
 
  //S-Type 
  parameter sb_sig = 2'b00;
  parameter sh_sig = 2'b01;
  parameter sw_sig = 2'b10;
 
//L-Type signals 
parameter lb_sig = 3'b000;
  parameter lh_sig = 3'b001;
  parameter lw_sig = 3'b010;
  parameter lbu_sig = 3'b011;
  parameter lhu_sig = 3'b100;


always@(*)
begin
	if(!rst)
		begin
			alu_control_decode = 32'h0;
		end
	else
		begin
			case(instr_reg_fetch[6:0])
				r_type: begin
                  case({instr_reg_fetch[31:25],instr_reg_fetch[14:12]}) //funct7 and funct3
								ADD: alu_control_decode = add_sig;
								SUB: alu_control_decode = sub_sig;
								SLL: alu_control_decode = sll_sig;
                    			SLT: alu_control_decode = slt_sig;
                    			XOR: alu_control_decode = xor_sig;
                    			SRL: alu_control_decode = srl_sig;
                    			SRA: alu_control_decode = sra_sig;
                    			OR: alu_control_decode = or_sig;
                    			AND: alu_control_decode = and_sig;
								default: alu_control_decode = dum_sig;
							endcase
						end
				i_type: begin 
                  //cntrl_sig_decode = 32'h7;//funct7 and funct 3
                  case({instr_reg_fetch[31:25],instr_reg_fetch[14:12]})
                    			ADDI: alu_control_decode = addi_sig;
               					SLTI: alu_control_decode = slti_sig;
								SLTIU: alu_control_decode = sltiu_sig;
                    			XORI: alu_control_decode = xori_sig;
                    			ORI: alu_control_decode = ori_sig;
                    			ANDI: alu_control_decode = andi_sig;
                    			SLLI: alu_control_decode = slli_sig;
                    			SRLI: alu_control_decode = srli_sig;
                    			SRAI: alu_control_decode = srai_sig;
								default: alu_control_decode = dum_sig;

                  endcase
                end
              
				b_type: begin //funct3
                  case ({instr_reg_fetch[31:25],instr_reg_fetch[14:12]})
                     BEQ: alu_control_decode = beq_sig;
                     BNE: alu_control_decode = bne_sig;
                     BLT: alu_control_decode = blt_sig;
                     BGE: alu_control_decode = bge_sig;
                     BLTU: alu_control_decode = bltu_sig;
                     BGEU: alu_control_decode = bgeu_sig;
                    default: alu_control_decode = dum_sig;
                  endcase
                end
				s_type: begin //funct3
                  case ({instr_reg_fetch[31:25],instr_reg_fetch[14:12]})
                    SB: alu_control_decode = sb_sig;
                    SH: alu_control_decode = sh_sig;
                    SW: alu_control_decode = sw_sig;
                    default: alu_control_decode = dum_sig;
                  endcase
                end
                    
				l_type: begin
                  case ({instr_reg_fetch[31:25],instr_reg_fetch[14:12]})
                    LB: alu_control_decode = lb_sig;
					LH: alu_control_decode = lh_sig;
                    LW: alu_control_decode = lw_sig;
					LBU: alu_control_decode = lbu_sig;
                    LHU: alu_control_decode = lhu_sig;
                    default: alu_control_decode = dum_sig;
                  endcase
                end

				default:  alu_control_decode = dum_sig;
			endcase
		end
end
endmodule 
