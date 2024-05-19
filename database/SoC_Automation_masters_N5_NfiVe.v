// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/*
 	 _   _  __ ___     __   _________  
	| \ | |/ _(_) \   / /__|___ /___ \ 
	|  \| | |_| |\ \ / / _ \ |_ \ __) |
	| |\  |  _| | \ V /  __/___) / __/ 
	|_| \_|_| |_|  \_/ \___|____/_____|
	Copyright 2020 Mohamed Shalan
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/
/*
	Started as a One day project on May 2, 2020 by Mohamed Shalan 
	NfiVe32 is area optimized RV32IC core with the following features:
	* Target clock frequency > 100MHz in 130nm technologies
	* CPI ~ 3
	* ASIC cell count: < 10K including the RF (< 4KB w/o the RF)
	    + XU : ~1800 ASIC Cells
	    + FU : ~350 ASIC Cells 
	* Instruction Cycles (3/4)
	    + C0 : Fetch and Decompress, 
	    + C1 : Fetch cyle 2; optional, only used for unaligned 32-bit instructions
	    + C2 : RF read, ALU & Branch, 
	    + C3 : Memory & RF write-back
	* A single AHB-Lite Master interface for both instructions and data
	    + Instr: A(C3), I(C0)
	    + Data: A(C2), D(C3)

	To do:
	* [X] Exception Handeling + PIC
	* [X] Bus wait states
	* [X] Some Performance counters (CYCLE and INSTRET)
	* [X] Systick timer
	* [] Extensions (SPM and Division) - will add around 3.5K ASIC cells 
	* [] Wait for Interrupt Instruction (wfi)
	* [] Comprehensive testing
*/


`timescale 1ns/1ps

`default_nettype none

// Macros used by all modules
`define     SYNC_BEGIN(r, v)  always @ (posedge HCLK or negedge HRESETn) if(!HRESETn) r <= v; else begin
`define     SYNC_END          end

`define     IR_rs1          19:15
`define     IR_rs2          24:20
`define     IR_rd           11:7
`define     IR_opcode       6:2
`define     IR_funct3       14:12
`define     IR_cond       	14:12
`define     IR_funct7       31:25
`define     IR_shamt        24:20
`define     IR_csr          31:20

`define     OPCODE_Branch   5'b11_000
`define     OPCODE_Load     5'b00_000
`define     OPCODE_Store    5'b01_000
`define     OPCODE_JALR     5'b11_001
`define     OPCODE_JAL      5'b11_011
`define     OPCODE_Arith_I  5'b00_100
`define     OPCODE_Arith_R  5'b01_100
`define     OPCODE_AUIPC    5'b00_101
`define     OPCODE_LUI      5'b01_101
`define     OPCODE_SYSTEM   5'b11_100
`define     OPCODE_Custom   5'b10_001

`define     F3_ADD          3'b000
`define     F3_SLL          3'b001
`define     F3_SLT          3'b010
`define     F3_SLTU         3'b011
`define     F3_XOR          3'b100
`define     F3_SRL          3'b101
`define     F3_OR           3'b110
`define     F3_AND          3'b111

`define     BR_BEQ          3'b000
`define     BR_BNE          3'b001
`define     BR_BLT          3'b100
`define     BR_BGE          3'b101
`define     BR_BLTU         3'b110
`define     BR_BGEU         3'b111

//`define     OPCODE          IR[`IR_opcode]

`define     ALU_ADD         4'b00_00
`define     ALU_SUB         4'b00_01
`define     ALU_PASS        4'b00_11
`define     ALU_OR          4'b01_00
`define     ALU_AND         4'b01_01
`define     ALU_XOR         4'b01_11
`define     ALU_SRL         4'b10_00
`define     ALU_SRA         4'b10_10
`define     ALU_SLL         4'b10_01
`define     ALU_SLT         4'b11_01
`define     ALU_SLTU        4'b11_11

`define     SYS_EC_EB       3'b000
`define     SYS_CSRRW       3'b001
`define     SYS_CSRRS       3'b010
`define     SYS_CSRRC       3'b011
`define     SYS_CSRRWI      3'b101
`define     SYS_CSRRSI      3'b110
`define     SYS_CSRRCI      3'b111



module RV32_DECOMP	(	
				    	input   [15:0]  IRi,
				    	output  [31:0]  IRo
					);


	reg     [31:0]  Instout;
	wire    [15:0]  InstIn;

	assign  InstIn = IRi; 

	assign IRo  =  Instout;

	//signals used for decoding the 16bit instruction: case and if statements
	wire [1:0] op   =   InstIn[1:0];
	wire [2:0] fun3 =   InstIn[15:13];
	wire [1:0] fun2 =   InstIn[11:10];
	wire [1:0] fun  =   InstIn[6:5];
	wire [4:0] Brs1 =   InstIn[11:7];
	wire [4:0] Brs2 =   InstIn[6:2];

	//Decoding and encoding process
	always @(*) begin
		Instout = 32'd0;
	    case(op)
	        2'b00:begin 					//C0
	            case(fun3)
	                3'b000:begin            //C.ADDI4SPN
	                    //addi rd0, x2, nzuimm[9:2].
						Instout = {	2'b00,
									InstIn[10:7],
									InstIn[12:11],
									InstIn[5],
									InstIn[6],
									2'b00,
									5'b00010,
									3'b000,
									2'b01,
									InstIn[4:2],
									7'b0010011
								};
	                end
	                3'b010:begin            //C.LW
	                   //lw rd',offset[6:2](rs1').
	                    Instout = {
	                    			5'd0,InstIn[5],
	                    			InstIn[12:10],
	                    			InstIn[6],
	                    			2'b00,2'b01,
	                    			InstIn[9:7],
	                    			3'b010,2'b01,
	                    			InstIn[4:2],
	                    			7'b0000011
	                    		};
	                end
	                3'b110:begin 			//C.SW
	                    //sw rs2',offset[6:2](rs1').
	                    Instout = {
	                    			5'd0,InstIn[5],
	                    			InstIn[12],
	                    			2'b01,
	                    			InstIn[4:2],
	                    			2'b01,
	                    			InstIn[9:7],
	                    			3'b010,
	                    			InstIn[11:10],
	                    			InstIn[6],
	                    			2'b00,
	                    			7'b0100011
	                    		};
	                end
	            endcase
	        end

	        2'b01:begin                 //C1
	            case(fun3)
	                3'b000:begin            //C.ADDI
	                	//addi rd, rd, nzimm[5:0].
	                    Instout = {{6{InstIn[12]}},InstIn[12],InstIn[6:2],InstIn[11:7],3'b000,InstIn[11:7],7'b0010011};
	                end
	                3'b001:begin         //C.JAL
	                	//jal x1, offset[11:1].
	                    Instout = {
	                    			InstIn[12],
	                    			InstIn[8],
	                    			InstIn[10:9],
	                    			InstIn[6],
	                    			InstIn[7],
	                    			InstIn[2],
	                    			InstIn[11],
	                    			InstIn[5:3],
	                    			InstIn[12],
	                    			{8{InstIn[12]}},
	                    			5'b00001,
	                    			7'b1101111
	                    		};
	                end
	                3'b010:begin            //C.LI
	                	//addi rd, x0, imm[5:0].
	                    Instout = {{6{InstIn[12]}},InstIn[12],InstIn[6:2],5'b00000,3'b000,InstIn[11:7],7'b0010011};
	                end
	                3'b011:begin            //C.LUI,C.ADDI16SP
	                    case(Brs1)
							5'b00010: begin     //C.ADDI16SP
								//addi x2, x2, nzimm[9:4].
								Instout = {
											{3{InstIn[12]}},
											InstIn[12],
											InstIn[4:3],
											InstIn[5],
											InstIn[2],
											InstIn[6],
											4'd0,
											Brs1,
											3'b000,
											Brs1,
											7'b0010011
										};
							end
	                    default: begin      //C.LUI
	                    //lui rd, nzuimm[17:12].
	                        Instout = {{14{InstIn[12]}},InstIn[12],InstIn[6:2],Brs1,7'b0110111};
	                    end
	                    endcase
	                end
	                3'b100:begin         //C.SRLI, C.SRAI, C.ANDI
	                    case(fun2)
	                    2'b00:begin     //C.SRLI
	                    //srli rd', rd', shamt[5:0]
	                        Instout = {7'b0000000,InstIn[6:2],2'b01,InstIn[9:7],3'b101,2'b01,InstIn[9:7],7'b0010011};
	                    end
	                    2'b01:begin     //C.SRAI
	                    //srai rd', rd', shamt[5:0],
	                        Instout = {7'b0100000,InstIn[6:2],2'b01,InstIn[9:7],3'b101,2'b01,InstIn[9:7],7'b0010011};
	                    end
	                    2'b10:begin     //C.ANDI
	                    //andi rd', rd', imm[5:0].
	                        Instout = {
	                        			{6{InstIn[12]}},
	                        			InstIn[12],
	                        			InstIn[6:2],
	                        			2'b01,
	                        			InstIn[9:7],
	                        			3'b111,2'b01,
	                        			InstIn[9:7],
	                        			7'b0010011
	                        		};
	                    end
	                    2'b11:
	                        if(!InstIn[12])begin
	                            case(fun)
	                                2'b11: begin    //C.AND
	                                //and rd', rd', rs2'.
	                                    Instout = {
	                                    			7'b0000000,2'b01, 
	                                    			InstIn[4:2],
	                                    			2'b01,
	                                    			InstIn[9:7],
	                                    			3'b111,2'b01,
	                                    			InstIn[9:7],
	                                    			7'b0110011
	                                    			};
	                                end
	                                2'b10: begin    //C.OR
	                                //or rd', rd', rs2'.
	                                    Instout = {
	                                    			7'b0000000,2'b01, 
	                                    			InstIn[4:2],
	                                    			2'b01,
	                                    			InstIn[9:7],
	                                    			3'b110,2'b01,
	                                    			InstIn[9:7],
	                                    			7'b0110011
	                                    			};
	                                end
	                                2'b01: begin    //C.XOR
	                                //xor rd', rd', rs2'.
	                                    Instout = {
	                                    			7'b0000000,2'b01, 
	                                    			InstIn[4:2],
	                                    			2'b01,
	                                    			InstIn[9:7],
	                                    			3'b100,2'b01,
	                                    			InstIn[9:7],
	                                    			7'b0110011
	                                    			};
	                                end
	                                2'b00: begin    //C.SUB
	                                //sub rd', rd', rs2'.
	                                    Instout = {7'b0100000,2'b01, InstIn[4:2],2'b01,InstIn[9:7],3'b000,2'b01,InstIn[9:7],7'b0110011};
	                                end

	                            endcase
	                        end
	                    endcase
	                end
	                3'b101:begin         //C.J
	                //jal x0,offset[11:1].
	                    Instout = {
	                    			InstIn[12],
	                    			InstIn[8],
	                    			InstIn[10:9],
	                    			InstIn[6],
	                    			InstIn[7],
	                    			InstIn[2],
	                    			InstIn[11],
	                    			InstIn[5:3],
	                    			InstIn[12],
	                    			{8{InstIn[12]}},
	                    			5'b00000,
	                    			7'b1101111
	                    		};
	                end
	                3'b110:begin         //C.BEQZ
	                //beq rs1', x0, offset[8:1].
	                    Instout = {
	                    			InstIn[12],
	                    			{2{InstIn[12]}},
	                    			InstIn[12],
	                    			InstIn[6:5],
	                    			InstIn[2],
	                    			5'b00000,
	                    			2'b01,
	                    			InstIn[9:7],
	                    			3'b000,
	                    			InstIn[11:10],
	                    			InstIn[4:3],
	                    			InstIn[12],
	                    			7'b1100011
	                    		};
	                end

	                3'b111:begin         //C.BNEZ
	                //bne rs1', x0, offset[8:1].
	                    Instout = {
	                    			InstIn[12],
	                    			{2{InstIn[12]}},
	                    			InstIn[12],
	                    			InstIn[6:5],
	                    			InstIn[2],
	                    			5'b00000,
	                    			2'b01,
	                    			InstIn[9:7],
	                    			3'b001,
	                    			InstIn[11:10],
	                    			InstIn[4:3],
	                    			InstIn[12],
	                    			7'b1100011
	                    		};
	                end
	            endcase
	        end

	        2'b10:begin                 //C2
	            case(fun3)
	                3'b000:begin            //C.SLLI
	                	//slli rd, rd, shamt[5:0],.
	                    Instout = {
	                    			7'b0000000,
	                    			InstIn[6:2],
	                    			InstIn[11:7],
	                    			3'b001,
	                    			InstIn[11:7],
	                    			7'b0010011
	                    		};
	                end
	                3'b010:begin            //C.LWSP
	                	//lw rd,offset[7:2](x2).
	                    Instout = 	{
		                    			4'd0,InstIn[3:2],
		                    			InstIn[12],
		                    			InstIn[6:4],
		                    			2'b00,5'b00010,3'b010,
		                    			InstIn[11:7],
		                    			7'b000011
	                    			};
	                end
	                3'b100:begin            //C.JR, C.JALR, C.MV, C.ADD, C.EBREAK
	                    case(InstIn[12])
	                        1'b0: begin
	                            if(!Brs2) begin             //C.JR
	                            	//jalr x0, rs1, 0.
	                                Instout = {12'd0,Brs1,3'b000,5'b00000,7'b1100111};
	                            end
	                            else begin                  //C.MV
	                            //add rd, x0, rs2.
	                                Instout = {7'b0000000,Brs2,5'b00000,3'b000,Brs1,7'b0110011};
	                            end
	                        end
	                        1'b1: begin
	                            if(!Brs2&&!Brs1) begin      //C.EBREAK
	                                //EBREAK
	                                Instout = {12'd1,5'd0,3'b000,5'd0,7'b1110011};
	                            end
	                            else if(!Brs2) begin        //C.JALR
	                            //jalr x1, rs1, 0.
	                                Instout = {12'd0,Brs1,3'b000,5'b00001,7'b1100111};
	                            end
	                            else begin                  //C.ADD
	                            //add rd, rd, rs2.
	                                Instout = {7'b0000000,Brs2,Brs1,3'b000,Brs1,7'b0110011};
	                            end
	                        end
	                    endcase
	                end
	                3'b110:begin         //C.SWSP
	                	//sw rs2,offset[7:2](x2).
	                    Instout = {
	                    			4'd0,InstIn[8:7],
	                    			InstIn[12],
	                    			InstIn[6:2],
	                    			5'b00010,3'b010,
	                    			InstIn[11:9],
	                    			2'b00,7'b0100011
	                    		};
	                end
	            endcase
	        end
	    endcase
	end
endmodule

// The ALU and its modules
// Mirioring Unit for the Shifter
module mirror (input [31:0] in, output reg [31:0] out);
    integer i;
    always @ *
        for(i=0; i<32; i=i+1)
            out[i] = in[31-i];
endmodule

// Shift Right Unit
module shr(input [31:0] a, output [31:0] r, input [4:0] shamt, input ar);

    wire [31:0] r1, r2, r3, r4;

    wire fill = ar ? a[31] : 1'b0;
    assign r1 = shamt[0] ? {fill, a[31:1]} : a;
    assign r2 = shamt[1] ? {fill, fill, r1[31:2]} : r1;
    assign r3 = shamt[2] ? {{4{fill}}, r2[31:4]} : r2;
    assign r4 = shamt[3] ? {{8{fill}}, r3[31:8]} : r3;
    assign r = shamt[4] ? {{16{fill}}, r4[31:16]} : r4;

endmodule

// The Shifter
module shift(
	input wire [31:0] a,
	input wire [4:0] shamt,
	input wire [1:0] typ,	// type[0] sll or srl - type[1] sra
							// 00 : srl, 10 : sra, 01 : sll
	output wire [31:0] r
	);
    wire [31 : 0] ma, my, y, x, sy;

    mirror m1(.in(a), .out(ma));
    mirror m2(.in(y), .out(my));

    assign x = typ[0] ? ma : a;
    shr sh0(.a(x), .r(y), .shamt(shamt), .ar(typ[1]));

    assign r = typ[0] ? my : y;

endmodule

// The ALU
module ALU(
	input   wire [31:0] a, b,
	input   wire [4:0]  shamt,
	output  reg  [31:0] r,
	output  wire        cf, zf, vf, sf,
	input   wire [3:0]  alufn
);

    wire [31:0] add, sub, op_b;
    wire cfa, cfs;

    assign op_b = (~b);

    assign {cf, add} = alufn[0] ? (a + op_b + 1'b1) : (a + b);

    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);

    wire[31:0] sh;
    shift shift0 (
        .a(a),
        .shamt(shamt),
        .typ(alufn[1:0]),
        .r(sh)
	);

    always @ * begin
        r = 0;
				(* full_case *)
				(* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 : r = add;
            4'b00_01 : r = add;
            4'b00_11 : r = b;
            // logic
            4'b01_00:  r = a | b;
            4'b01_01:  r = a & b;
            4'b01_11:  r = a ^ b;
            // shift
            4'b10_00:  r=sh;
            4'b10_01:  r=sh;
            4'b10_10:  r=sh;
            // slt & sltu
            4'b11_01:  r = {31'b0,(sf != vf)};
            4'b11_11:  r = {31'b0,(~cf)};

			default:	r = add;
        endcase
    end
endmodule

// Immediate Generator
module IMMGEN (
    input  wire [31:0]  INSTR,
    output reg  [31:0]  IMM
);

always @(*) begin
	case (INSTR[`IR_opcode])
		`OPCODE_Arith_I   : 	IMM = { {21{INSTR[31]}}, INSTR[30:25], INSTR[24:21], INSTR[20] };
		`OPCODE_Store     :   	IMM = { {21{INSTR[31]}}, INSTR[30:25], INSTR[11:8], INSTR[7] };
		`OPCODE_LUI       :   	IMM = { INSTR[31], INSTR[30:20], INSTR[19:12], 12'b0 };
		`OPCODE_AUIPC     :   	IMM = { INSTR[31], INSTR[30:20], INSTR[19:12], 12'b0 };
		`OPCODE_JAL       : 	IMM = { {12{INSTR[31]}}, INSTR[19:12], INSTR[20], INSTR[30:25], INSTR[24:21], 1'b0 };
		`OPCODE_JALR      : 	IMM = { {21{INSTR[31]}}, INSTR[30:25], INSTR[24:21], INSTR[20] };
		`OPCODE_Branch    : 	IMM = { {20{INSTR[31]}}, INSTR[7], INSTR[30:25], INSTR[11:8], 1'b0};
		default           : 	IMM = { {21{INSTR[31]}}, INSTR[30:25], INSTR[24:21], INSTR[20] }; 
	endcase
end

endmodule

// Instruction decoder that generates the ALU operation
module RV32_DEC(
    input [31:0] INSTR,
    output	reg  [3:0]	  alu_fn,
    output alu_op2_src
    
);
    wire [2:0]  func3       =   INSTR[`IR_funct3];
    wire [6:0]  func7       =   INSTR[`IR_funct7];
    wire [11:0] csr         =   INSTR[`IR_csr];
    wire [4:0]  opcode      =   INSTR[`IR_opcode];
    wire        W32         =   1;//sz[0] & sz[1];
    wire        I           =   W32 & (opcode == `OPCODE_Arith_I);
	wire        R           =   W32 & (opcode == `OPCODE_Arith_R);
	wire        IorR        =   I | R;
	wire        instr_logic = 	((IorR==1'b1) && ((func3==`F3_XOR) || (func3==`F3_AND) || (func3==`F3_OR)));
	wire        instr_shift = 	((IorR==1'b1) && ((func3==`F3_SLL) || (func3==`F3_SRL) ));

    wire        instr_slt   = 	((IorR==1'b1) && (func3==`F3_SLT));
	wire        instr_sltu  = 	((IorR==1'b1) && (func3==`F3_SLTU));
	wire        instr_store = 	W32 & (opcode == `OPCODE_Store);
	wire        instr_load  = 	W32 & (opcode == `OPCODE_Load);
	wire        instr_add   = 	R & (func3 == `F3_ADD) & (~func7[5]);
	wire        instr_sub   = 	R & (func3 == `F3_ADD) & (func7[5]);
	wire        instr_addi  = 	I & (func3 == `F3_ADD);
	wire        instr_lui   = 	W32 & (opcode == `OPCODE_LUI);
	wire        instr_auipc = 	W32 & (opcode == `OPCODE_AUIPC);
	wire        instr_branch= 	W32 & (opcode == `OPCODE_Branch);
	wire        instr_jalr  = 	W32 & (INSTR[`IR_opcode] == `OPCODE_JALR);
	wire        instr_jal   = 	W32 & (INSTR[`IR_opcode] == `OPCODE_JAL);
	wire        instr_sll   = 	((IorR==1'b1) && (func3 == `F3_SLL) && (func7 == 7'b0));
	wire        instr_srl   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 == 7'b0));
	wire        instr_sra   = 	((IorR==1'b1) && (func3 == `F3_SRL) && (func7 != 7'b0));
	wire        instr_and   = 	((IorR==1'b1) && (func3 == `F3_AND));
	wire        instr_or    = 	((IorR==1'b1) && (func3 == `F3_OR));
	wire        instr_xor   = 	((IorR==1'b1) && (func3 == `F3_XOR));

    assign      alu_op2_src =   R;

    always @ * begin
            case (1'b1)
                instr_load  :   alu_fn = `ALU_ADD;
                instr_addi  :   alu_fn = `ALU_ADD;
                instr_store :   alu_fn = `ALU_ADD;
                instr_add   :   alu_fn = `ALU_ADD;
                instr_jalr  :   alu_fn = `ALU_ADD;

                instr_lui   :   alu_fn = `ALU_PASS;

                instr_sll   :   alu_fn = `ALU_SLL;
                instr_srl   :   alu_fn = `ALU_SRL;
                instr_sra   :   alu_fn = `ALU_SRA;

                instr_slt   :   alu_fn = `ALU_SLT;
                instr_sltu  :   alu_fn = `ALU_SLTU;

                instr_and   :   alu_fn = `ALU_AND;
                instr_or    :   alu_fn = `ALU_OR;
                instr_xor   :   alu_fn = `ALU_XOR;

                default     :   alu_fn = `ALU_SUB;
            endcase
        end

endmodule


// Conditional Branchig Unit. It checks whether the branch is taken or not
module BRANCH (
		input [2:0] 	cond,
		input [31:0] 	R1, R2,
		output 			taken
);
	wire 		zf, cf, vf, sf;
	wire [31:0] add, op_b;
	reg 		taken;

	assign op_b         = (~R2);
    assign {cf, add}    = (R1 + op_b + 1'b1);
    assign zf           = (add == 0);
    assign sf           = add[31];
    assign vf           = (R1[31] ^ (op_b[31]) ^ add[31] ^ cf);

	always @ * begin
      (* full_case *)
      case(cond)
          `BR_BEQ: 	taken = zf;          	// BEQ
          `BR_BNE: 	taken = ~zf;         	// BNE
          `BR_BLT: 	taken = (sf != vf);  	// BLT
          `BR_BGE: 	taken = (sf == vf);  	// BGE
          `BR_BLTU: taken = (~cf);      	// BLTU
          `BR_BGEU: taken = (cf);       	// BGEU
          default: 	taken = 1'b0;
      endcase
	end
endmodule

// Memory data (R) aligner
module mrdata_align(
    input wire [31:0] d,
    output wire [31:0] ed,
    input wire [1:0] size,
    input wire [1:0] A,
    input wire sign
);

    wire [31:0] s_ext, u_ext;
    wire [7:0] byte;
    wire [15:0] hword;

    assign byte = (A==2'd0) ? d[7:0] :
                (A==2'd1) ? d[15:8] :
                (A==2'd2) ? d[23:16] : d[31:24];

    assign hword = (A[1]==0) ? d[15:0] : d[31:16];

    assign u_ext =  (size==2'd0)  ? {24'd0,byte}  :
                    (size==2'd1)  ? {16'd0,hword} : d;

    assign s_ext =  (size==2'd0)  ? {{24{byte[7]}},byte}   :
                    (size==2'd1)  ? {{24{hword[15]}},hword} : d;

    assign ed = sign ? u_ext : s_ext;

endmodule

// Memory data (W) aligner
module mwdata_align(
    input wire [31:0] d,
    output wire [31:0] fd,
    input wire [1:0] size,
    input wire [1:0] A
  );

    wire [7:0] byte = d[7:0];
    wire [15:0] hword = d[15:0];

    wire [31:0] byte_word, hw_word;

    assign  byte_word = (A==2'd0) ? d :
                        (A==2'd1) ? {16'd0, byte, 8'd0} :
                        (A==2'd2) ? {8'd0, byte, 16'd0} : {byte, 24'd0} ;
    assign  hw_word   = (~A[1])  ? d : {hword, 16'd0};

    assign fd = (size==2'd0) ? byte_word :
                (size==2'd1) ? hw_word : d;

endmodule


// The Instruction Fetch Unit
module NfiVe32_FU(
    input wire [31:0]   IDATA0,
    input wire [31:0]   IDATA1,
    input wire [31:0]   PC,
    input wire          C1,
    output wire [31:0]  INSTR,
    output wire         IS32
);

    wire [31:0] instr32;
    wire [31:0] instr   =   (~C1 & ~PC[1]) ? IDATA0 :                   // Aligned 32 or Lower 16
                            (~C1 & PC[1]) ? {16'h0, IDATA0[31:16]} :    // Upper 16
                            {IDATA0[15:0], IDATA1[31:16]} ;             // Unaligned 32

    wire        is32    =   instr[0] & instr[1];
      
    RV32_DECOMP nfive_decomp (.IRi(instr[15:0]), .IRo(instr32));

    assign INSTR    =   is32 ? instr : instr32;
    assign IS32     =   is32;

endmodule


// Instruction Execution Unit (ALU + next PC generation)
module NfiVe32_XU(
    output wire [31:0]  ALUR,
    output wire [31:0]  NPC,
    output wire [31:0]  PC24,
    output wire [31:0]  PCI,
    input wire [31:0]   PC,
    input wire [31:0]   INSTR,
    input wire [31:0]   R1,
    input wire [31:0]   R2, 
    input wire          IS32
);
    wire        instr_branch    = 	(INSTR[`IR_opcode] == `OPCODE_Branch);
	wire        instr_jalr      = 	(INSTR[`IR_opcode] == `OPCODE_JALR);
	wire        instr_jal       = 	(INSTR[`IR_opcode] == `OPCODE_JAL);

    wire        alu_op2_src;

    wire [31:0] imm;
    wire [31:0] pc4         = PC + 32'h4;
    wire [31:0] pc2         = PC + 32'h2;
    wire [31:0] pci         = PC + imm;
    wire [31:0] alu_op2     = alu_op2_src ? R2 : imm;
    wire [4:0]  alu_shamt 	= INSTR[`IR_shamt];
    wire [3:0]  alu_fn;
    wire        branch_taken;

    IMMGEN      immgen      (.INSTR(INSTR), .IMM(imm));
    ALU         alu         (.a(R1), .b(alu_op2),.shamt(alu_shamt),.r(ALUR),.alufn(alu_fn));
	BRANCH      brunint     (.cond(INSTR[`IR_cond]),.R1(R1),.R2(R2),.taken(branch_taken));
	RV32_DEC    decoder     (.INSTR(INSTR),.alu_fn(alu_fn),.alu_op2_src(alu_op2_src));

    assign NPC = ((branch_taken & instr_branch) | (instr_jal)) ? pci :  (instr_jalr) ? ALUR : IS32 ? pc4 : pc2;

    assign PC24 = IS32 ? pc4 : pc2;

    assign PCI = pci;

endmodule


// The CPU Core
`define 	CYC_C0		2'h0
`define 	CYC_C1		2'h1
`define 	CYC_C2		2'h2
`define 	CYC_C3		2'h3


module NfiVe32 (
	input	HCLK,							// System clock
	input	HRESETn,						// System Reset, active low

	// AHB-LITE MASTER PORT for Instructions
	output wire [31:0]  HADDR,				// AHB transaction address
	output wire [ 2:0]  HSIZE,				// AHB size: byte, half-word or word
	output wire [ 1:0]  HTRANS,				// AHB transfer: non-sequential only
	output wire [31:0]  HWDATA,				// AHB write-data
	output wire         HWRITE,				// AHB write control
	input  wire [31:0]  HRDATA,				// AHB read-data
	input  wire         HREADY,				// AHB stall signal
	
	// MISCELLANEOUS 
  	input  wire         NMI,				// Non-maskable interrupt input
  	input  wire         IRQ,				// Interrupt request line
    input  wire [4:0]   IRQ_NUM,			// Interrupt number from the PIC			
  	input  wire 	    SYSTICKCLK,			// SYSTICK clock; ON pulse width is HCLK half period
  	output wire [31:0]	IRQ_MASK
);

    reg [1:0]   CYC, NCYC;
    reg         RUN;
    reg         IS32;
    reg         INEXCEPTION;

    reg [31:0]  PC;
    reg [31:0]  IDATA;
    reg [31:0]  PC24;
    reg [31:0]  INSTR;

    reg [31:0]  CSR_CYCLE; 
    reg [31:0]  CSR_INSTRET;
    reg [31:0]  CSR_TIME;
    reg [31:0]  CSR_TIMELOAD;
    reg [31:0]  CSR_MIE;
    reg [31:0]  CSR_IRQMASK;
 //   reg [31:0]  CSR_MIP;
    reg [31:0]  CSR_EPC;
    

    wire [31:0] instr;
    wire [31:0] hrdata;
    wire [31:0] hwdata;

    wire [31:0] alur;
    wire [31:0] npc;
    wire [31:0] pc24, pci;
    wire        is32;

    wire        tmr_int;

    wire        unaligned = PC[1] & HRDATA[16] & HRDATA[17];

    wire        C0 = (CYC==2'h0), C1 = (CYC==2'h1), C2 = (CYC==2'h2), C3 = (CYC==2'h3);

    wire        shamt 	    =   INSTR[`IR_shamt];

    wire        instr_i     =   (INSTR[`IR_opcode] == `OPCODE_Arith_I);
	wire        instr_r     =   (INSTR[`IR_opcode] == `OPCODE_Arith_R);
    wire        instr_lui   = 	(INSTR[`IR_opcode] == `OPCODE_LUI);
	wire        instr_auipc = 	(INSTR[`IR_opcode] == `OPCODE_AUIPC);
	wire        instr_branch = 	(INSTR[`IR_opcode] == `OPCODE_Branch);
	wire        instr_jalr  = 	(INSTR[`IR_opcode] == `OPCODE_JALR);
	wire        instr_jal   = 	(INSTR[`IR_opcode] == `OPCODE_JAL);
    wire        instr_store = 	(INSTR[`IR_opcode] == `OPCODE_Store);
	wire        instr_load  = 	(INSTR[`IR_opcode] == `OPCODE_Load);

    wire [11:0] csr_num     =   INSTR[`IR_csr]; 
    wire        instr_priv  =   (INSTR[`IR_opcode] ==  5'h1C);
    wire	    instr_rdcsr	=	instr_priv & (INSTR[`IR_funct3] == 3'd2);
    wire        instr_wrcsr =   instr_priv & (INSTR[`IR_funct3] == 3'd1);
    wire        instr_ecall =   instr_priv & (INSTR[`IR_funct3] == 3'b0) & (csr_num == 12'h0);
    wire        instr_ebreak=   instr_priv & (INSTR[`IR_funct3] == 3'b0) & (csr_num == 12'h1);
	wire        instr_mret  =   instr_priv & (INSTR[`IR_funct3] == 3'b0) & (csr_num == 12'h302);
	wire        instr_wfi   =   instr_priv & (INSTR[`IR_funct3] == 3'b0) & (csr_num == 12'h105);
           
    wire        rf_wr       =   instr_load | instr_r | instr_i | instr_jal | instr_jalr | instr_lui | instr_auipc;

    wire        exception   =   (CSR_MIE[0] & ((tmr_int & CSR_MIE[1]) | (IRQ & CSR_MIE[2]))) | NMI | instr_ecall;
    wire [31:0] pc_ex       =   instr_ecall ?   32'd12              :
                                NMI         ?   32'd4               :
                                tmr_int     ?   32'd8               :
                                IRQ         ?   (32'd64+IRQ_NUM<<2) :   32'd60;


    assign IRQ_MASK = CSR_IRQMASK;

    // The Register File
    reg [31:0] RF[31:0];
    wire [4:0] rs1 	    = INSTR[`IR_rs1];
	wire [4:0] rs2 	    = INSTR[`IR_rs2];
	wire [4:0] rd 	    = INSTR[`IR_rd];

    wire [31:0] r1 = RF[rs1] & {32{~(rs1==5'd0)}};
	wire [31:0] r2 = RF[rs2] & {32{~(rs2==5'd0)}};

    wire [31:0] csr =   (csr_num==12'hC00) ? CSR_CYCLE      :
                        (csr_num==12'hC01) ? CSR_TIME       :
                        (csr_num==12'hC02) ? CSR_INSTRET    :
                        (csr_num==12'hC03) ? CSR_TIMELOAD   :   
                        (csr_num==12'h304) ? CSR_MIE        :   
                        (csr_num==12'h310) ? CSR_IRQMASK    :   
                        32'hBAAAAAAD;

	always @(posedge HCLK)
		if(rd != 5'd0)
			if(rf_wr & C3) begin
                RF[rd] <=   (instr_jal | instr_jalr)    ?   PC24    : 
                            (instr_auipc)               ?   pci     : 
                            (instr_load)                ?   hrdata  : 
                            (instr_rdcsr)               ?   csr     :   alur;
                #1 $display("Write: RF[%d]=0x%X [PC=0x%X, INSTR=0x%X]", rd, RF[rd], PC, INSTR);
            end


    assign HADDR        = ~RUN ? 32'h0 : C3 ? {PC[31:2],2'b0} : C0 ? ({PC[31:2],2'b0}+32'h4) : C2 ? alur : 32'bz;
    assign HTRANS[0]    = 1'h0;
    assign HTRANS[1]    = C3 | (C0 & unaligned) | (C2 & (instr_load | instr_store));
    assign HWRITE       = C2 & instr_store;
    assign HSIZE        = {1'b0,INSTR[13:12]};
    assign HWDATA       = (C3 & instr_store) ? hwdata : 32'bz;

    mrdata_align mralign(
        .d(HRDATA),
        .ed(hrdata),
        .size(HSIZE[1:0]),
        .A(alur[1:0]),
        .sign(INSTR[14])
    );

    mwdata_align mwalign(
        .d(r2),
        .fd(hwdata),
        .size(HSIZE[1:0]),
        .A(alur[1:0])
    );
    
	NfiVe32_FU fetch_unit(
        .IDATA0(HRDATA),
        .IDATA1(IDATA),
        .PC(PC),
        .C1(C1),
        .INSTR(instr),
        .IS32(is32)
    );

    NfiVe32_XU exec_unit(
        .ALUR(alur),
        .NPC(npc),
        .PC24(pc24),
        .PCI(pci),
        .PC(PC),
        .INSTR(INSTR),
        .R1(r1),
        .R2(r2), 
        .IS32(IS32)
    );

    // CPU Cycle
    always @*
        case (CYC)
            `CYC_C0:   	if(HREADY) begin
	            			if(~PC[1]) NCYC = `CYC_C2;                         // Alighed
	                    	else if(HRDATA[16]&HRDATA[17]) NCYC = `CYC_C1;     // Not aligned and 32-bit instruction
	                    	else NCYC = `CYC_C2;                               // Not aligned but 16-bit instruction
                    	end 
                    	else 
                    		NCYC = `CYC_C0;
            
            `CYC_C1:   	if(HREADY) 
            				NCYC = `CYC_C2; 
            			else 
            				NCYC = `CYC_C1;
            
            `CYC_C2:   	NCYC = `CYC_C3;
            
            `CYC_C3:   	
				if (HREADY)
					NCYC = `CYC_C0; 
				else 
					NCYC = `CYC_C3;
            
            default: 	NCYC = `CYC_C0;
        
        endcase

    // The resgisters: 4 x 32 + 2 x 1 + 1 x 2 = 132 Bits
    // Synthesized into 118 bits only:
    //  + CYC is expanded from 2 to 4 (OHE FSM)
    //  + IDATA lower 16 bits are not used -> removed during optimization
    `SYNC_BEGIN(RUN, 1'h0)
        if(~RUN) RUN <= 1'b1;
    `SYNC_END

    `SYNC_BEGIN(CYC, 2'h0)
        if(RUN) CYC <= NCYC;
    `SYNC_END
    
    `SYNC_BEGIN(INEXCEPTION, 1'h0)
        if(exception & C3) INEXCEPTION <= 1'h1;
        else if(instr_mret & C3) INEXCEPTION <= 1'h0;
    `SYNC_END
    
    `SYNC_BEGIN(IDATA, 32'h0)
        if(C0)    
            IDATA <= HRDATA; 
    `SYNC_END
    
    `SYNC_BEGIN(INSTR, 32'h0)
        if(C0 | C1)    
            INSTR <= instr; 
    `SYNC_END
    
    `SYNC_BEGIN(IS32, 1'h0)
        if(C0 | C1) IS32 <= is32;
    `SYNC_END

    `SYNC_BEGIN(PC24, 32'h0)
        if(C2)    
            PC24 <= pc24; 
    `SYNC_END
    
    `SYNC_BEGIN(PC, 32'h0)
        if(C2 & instr_mret)
            PC <= CSR_EPC;
        else if(C2 & exception)
            PC <= pc_ex;
        else if(C2)    
            PC <= npc; 
    `SYNC_END

    // Counters and Special function Registers (CSRs)
    // Retired Instruction
    `SYNC_BEGIN(CSR_INSTRET, 32'h0)
        if(C3)    
            CSR_INSTRET <= CSR_INSTRET + 32'h1;
    `SYNC_END

    // Number of CPU cycles
    `SYNC_BEGIN(CSR_CYCLE, 32'h0)   
            if(RUN) CSR_CYCLE <= CSR_CYCLE + 32'h1;
    `SYNC_END

    // SYSTICK Timer
    wire    csr_time_zero   =   (CSR_TIME == 32'h0);
    assign  tmr_int         =   csr_time_zero;

    `SYNC_BEGIN(CSR_TIME, 32'hFFFF_FFFF)   
        if(SYSTICKCLK)
            if(csr_time_zero)
                CSR_TIME <= CSR_TIMELOAD;
            else 
                CSR_TIME <= CSR_TIME - 32'h1;
    `SYNC_END

    // SYSTICK TimeLoad register
    `SYNC_BEGIN(CSR_TIMELOAD, 32'hFFFF_FFFF)   
        if(instr_wrcsr & (csr_num == 12'hC03))
            CSR_TIMELOAD <= r1;
    `SYNC_END

    // Non Standard Machine Interrupt Enable CSR
    // Bit 0: Global Int En
    // Bit 1: Timer Int En
    // Bit 2: External Int En
    `SYNC_BEGIN(CSR_MIE, 32'h0)   
        if(instr_wrcsr & (csr_num == 12'h304))
            CSR_MIE <= r1;
    `SYNC_END

	// Non standard IRQ MASK CSR    
    `SYNC_BEGIN(CSR_IRQMASK, 32'h0)   
        if(instr_wrcsr & (csr_num == 12'h310))
            CSR_IRQMASK <= r1;
    `SYNC_END

    // Exception PC CSR
    `SYNC_BEGIN(CSR_EPC, 32'h0)   
        if(exception & C2 & !INEXCEPTION)
            CSR_EPC <= npc;
    `SYNC_END

endmodule

// A very simple Programmable Interrupts Controller
module NfiVe32_PIC(
  input  wire [31:0]	IRQ,
  output reg 			irq,
  output wire [4:0]		IRQ_NUM,
  input  wire [31:0]	IRQ_MASK
);

	reg  [4:0]		irq_num;

	assign IRQ_NUM = irq_num;

	integer i;
	always @ * begin
	irq = 0;
	irq_num = 0;
	for(i=0; i<32; i=i+1)
	    if(IRQ_MASK[i] & IRQ[i]) begin
	        irq = 1'b1;
	        irq_num = i;
	    end
	end

endmodule

// NfiVe Top Level
module NfiVe32_SYS (
	input	HCLK,							// System clock
	input	HRESETn,						// System Reset, active low

	// AHB-LITE MASTER PORT for Instructions
	output wire [31:0]  HADDR,				// AHB transaction address
	output wire [ 2:0]  HSIZE,				// AHB size: byte, half-word or word
	output wire [ 1:0]  HTRANS,				// AHB transfer: non-sequential only
	output wire [31:0]  HWDATA,				// AHB write-data
	output wire         HWRITE,				// AHB write control
	input  wire [31:0]  HRDATA,				// AHB read-data
	input  wire         HREADY,				// AHB stall signal
	
	// MISCELLANEOUS 
  	input  wire         NMI,				// Non-maskable interrupt input
  	input  wire [7:0]	SYSTICKCLKDIV		
);

	wire irq;
	wire [4:0] 	irq_num;
	wire [31:0] irq_mask;
	wire [31:0] IRQ;
	wire div;
	reg  [7:0]  clkdiv;
	reg 		systickclk;

	NfiVe32 N5(
		.HCLK(HCLK),
		.HRESETn(HRESETn),

		// AHB-LITE MASTER PORT for Instructions
		.HADDR(HADDR),             
		.HSIZE(HSIZE),             
		.HTRANS(HTRANS),           
		.HWDATA(HWDATA),           
		.HWRITE(HWRITE),           
		.HRDATA(HRDATA),           
		.HREADY(HREADY),           
		
		// MISCELLANEOUS 
	  	.NMI(NMI),               
	  	.IRQ(irq),
	  	.IRQ_NUM(irq_num),               
	  	.SYSTICKCLK(systickclk),
	  	.IRQ_MASK(irq_mask)
	);

	NfiVe32_PIC PIC(
  		.IRQ(IRQ),
  		.irq(irq),
  		.IRQ_NUM(irq_num),
  		.IRQ_MASK(irq_mask)
	);

	assign div = (clkdiv == SYSTICKCLKDIV);

	always @(posedge HCLK, negedge HRESETn)
		if(HRESETn)
			clkdiv <= 8'h0;
		else 
			if(div) 
				clkdiv <= 8'h0;
			else
				clkdiv <= clkdiv + 8'h1; 

	always @(posedge HCLK, negedge HRESETn)
		if(HRESETn)
			systickclk <= 1'b0;	
		else 
			if(div) 
				systickclk <= 1'b1;
			else
				systickclk <= 1'b0;	 	

endmodule
