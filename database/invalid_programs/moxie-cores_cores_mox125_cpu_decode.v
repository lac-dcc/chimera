// cpu_decode.v - The instruction decode unit
//
// Copyright (c) 2010, 2011, 2012, 2017, 2023 Anthony Green.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
//
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
//
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

`include "defines.h"

module cpu_decode (/*AUTOARG*/
  // Outputs
  pipeline_control_bits_o, register1_write_index_o,
  register2_write_index_o, operand_o, pcrel_offset_o, riA_o, riB_o,
  op_o, PC_o, forward_1_to_1_o, forward_1_to_2_o, forward_2_to_1_o,
  forward_2_to_2_o,
  // Inputs
  rst_i, clk_i, stall_i, flush_i, branch_flag_i, opcode_i, operand_i,
  valid_i, PC_i
  );

   // --- Clock and Reset ------------------------------------------
   input  rst_i, clk_i;

   // --- Pipeline interlock and flush -----------------------------
   input  stall_i;
   input  flush_i;
  input   branch_flag_i;

   // --- Instructions ---------------------------------------------
   input [15:0] opcode_i;
   input [31:0] operand_i;
   input 	valid_i;
   input [31:0] PC_i;

   // --- Outputs --------------------------------------------------
   output [`PCB_WIDTH-1:0] pipeline_control_bits_o;
   output [3:0] 	   register1_write_index_o;
   output [3:0] 	   register2_write_index_o;
   output [31:0] 	   operand_o;
   output [9:0] 	   pcrel_offset_o;
   output [3:0] 	   riA_o;
   output [3:0] 	   riB_o;
   output [6:0] 	   op_o;
   output [31:0] 	   PC_o;

   reg [6:0] 		   op_o;
   reg [9:0] 		   pcrel_offset_o;
   wire [3:0] 		   riA_o;
   wire [3:0] 		   riB_o;
   reg [31:0] 		   operand_o;
   reg [31:0] 		   PC_o;
   reg [`PCB_WIDTH-1:0]    pipeline_control_bits_o;
   reg [3:0] 		   register1_write_index_o;
   reg [3:0] 		   register2_write_index_o;

   wire 		   foo = !opcode_i[15:15];
   wire [3:0] 		   b1 = opcode_i[3:0];
   wire [3:0] 		   b2 = opcode_i[7:4];
   wire [3:0] 		   b3 = opcode_i[11:8];
   wire [3:0] 		   b4 = opcode_i[15:12];

  output reg  			   forward_1_to_1_o;
  output reg 			   forward_1_to_2_o;
  output reg 			   forward_2_to_1_o;
  output reg 			   forward_2_to_2_o;

 always @(posedge clk_i)
     begin
       forward_1_to_1_o <= pipeline_control_bits_o[`PCB_WA] & register1_write_index_o == riA_o & !branch_flag_i;
       forward_1_to_2_o <= pipeline_control_bits_o[`PCB_WA] & register1_write_index_o == riB_o & !branch_flag_i;
       forward_2_to_1_o <= pipeline_control_bits_o[`PCB_WB] & register2_write_index_o == riA_o & !branch_flag_i;
       forward_2_to_2_o <= pipeline_control_bits_o[`PCB_WB] & register2_write_index_o == riB_o & !branch_flag_i;
     end

   wire [`PCB_WIDTH-1:0]   control;

   microcode mcode (.opcode(opcode_i[15:8]),
		    .q(control));

   assign riA_o = foo ? opcode_i[7:4] : opcode_i[11:8];
   assign riB_o = opcode_i[3:0];

   always @(posedge clk_i)
     begin
	if (! stall_i) begin
	   PC_o <= PC_i;
	end
     end

  always @(posedge clk_i)
    if (! stall_i) begin
      if (! valid_i)
	      pipeline_control_bits_o <= 6'b000000;
      else
	      begin
	        pcrel_offset_o <= opcode_i[9:0];
	        if (opcode_i[15] == 0)
	          pipeline_control_bits_o <= control;
	        else
	          casex (opcode_i[15:12])
	            4'b1000: // INC
		            begin
		              pipeline_control_bits_o <= 6'b101000;
		            end
	            4'b1001: // DEC
		            begin
		              pipeline_control_bits_o <= 6'b101000;
		            end
	          endcase // casex (opcode_i[14:11])
	      end
    end

  always @(posedge clk_i)
    begin
      if (! stall_i)
	begin
	  if (! valid_i)
	    op_o <= `OP_NOP;
	  else begin
	    register1_write_index_o <= riA_o;
	    register2_write_index_o <= riB_o;
	    casex (opcode_i[15:8])
	      8'b00000000:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00000001:
		begin
		  op_o <= `OP_LDI_L;
		  operand_o <= operand_i;
		end
	      8'b00000010:
		begin
		  op_o <= `OP_MOV;
		end
	      8'b00000011:
		begin
		  op_o <= `OP_JSRA;
		  operand_o <= operand_i;
		end
	      8'b00000100:
		begin
		  op_o <= `OP_RET;
		end
	      8'b00000101:
		begin
		  op_o <= `OP_ADD_L;
		end
	      8'b00000110:
		begin
		  op_o <= `OP_PUSH;
		end
	      8'b00000111:
		begin
		  op_o <= `OP_POP;
		end
	      8'b00001000:
		begin
		  op_o <= `OP_LDA_L;
		  operand_o <= operand_i;
		end
	      8'b00001001:
		begin
		  op_o <= `OP_STA_L;
		  operand_o <= operand_i;
		end
	      8'b00001010:
		begin
		  op_o <= `OP_LD_L;
		end
	      8'b00001011:
		begin
		  op_o <= `OP_ST_L;
		end
	      8'b00001100:
		begin
		  op_o <= `OP_LDO_L;
		end
	      8'b00001101:
		begin
		  op_o <= `OP_STO_L;
		  operand_o <= {16'b0,operand_i[31:16]};
		end
	      8'b00001110:
		begin
		  op_o <= `OP_CMP;
		end
	      8'b00001111:
		begin
		  op_o <= `OP_NOP;
		end
	      8'b00010000:
		begin
		  op_o <= `OP_SEX_B;
		end
	      8'b00010001:
		begin
		  op_o <= `OP_SEX_S;
		end
	      8'b00010010:
		begin
		  op_o <= `OP_ZEX_B;
		end
	      8'b00010011:
		begin
		  op_o <= `OP_ZEX_S;
		end
	      8'b00010100:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00010101:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00010110:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00010111:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00011000:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00011001:
		begin
		  op_o <= `OP_JSR;
		end
	      8'b00011010:
		begin
		  op_o <= `OP_JMPA;
		  operand_o <= operand_i;
		end
	      8'b00011011:
		begin
		  op_o <= `OP_LDI_B;
		  operand_o <= operand_i;
		end
	      8'b00011100:
		begin
		  op_o <= `OP_LD_B;
		end
	      8'b00011101:
		begin
		  op_o <= `OP_LDA_B;
		end
	      8'b00011110:
		begin
		  op_o <= `OP_ST_B;
		end
	      8'b00011111:
		begin
		  op_o <= `OP_STA_B;
		  operand_o <= operand_i;
		end
	      8'b00100000:
		begin
		  op_o <= `OP_LDI_S;
		  operand_o <= operand_i;
		end
	      8'b00100001:
		begin
		  op_o <= `OP_LD_S;
		end
	      8'b00100010:
		begin
		  op_o <= `OP_LDA_S;
		end
	      8'b00100011:
		begin
		  op_o <= `OP_ST_S;
		end
	      8'b00100100:
		begin
		  op_o <= `OP_STA_S;
		  operand_o <= operand_i;
		end
	      8'b00100101:
		begin
		  op_o <= `OP_JMP;
		end
	      8'b00100110:
		begin
		  op_o <= `OP_AND;
		end
	      8'b00100111:
		begin
		  op_o <= `OP_LSHR;
		end
	      8'b00101000:
		begin
		  op_o <= `OP_ASHL;
		end
	      8'b00101001:
		begin
		  op_o <= `OP_SUB_L;
		end
	      8'b00101010:
		begin
		  op_o <= `OP_NEG;
		end
	      8'b00101011:
		begin
		  op_o <= `OP_OR;
		end
	      8'b00101100:
		begin
		  op_o <= `OP_NOT;
		end
	      8'b00101101:
		begin
		  op_o <= `OP_ASHR;
		end
	      8'b00101110:
		begin
		  op_o <= `OP_XOR;
		end
	      8'b00101111:
		begin
		  op_o <= `OP_MUL_L;
		end
	      8'b00110000:
		begin
		  op_o <= `OP_SWI;
		end
	      8'b00110001:
		begin
		  op_o <= `OP_DIV_L;
		end
	      8'b00110010:
		begin
		  op_o <= `OP_UDIV_L;
		end
	      8'b00110011:
		begin
		  op_o <= `OP_MOD_L;
		end
	      8'b00110100:
		begin
		  op_o <= `OP_UMOD_L;
		end
	      8'b00110101:
		begin
		  op_o <= `OP_BRK;
		end
	      8'b00110110:
		begin
		  op_o <= `OP_LDO_B;
		end
	      8'b00110111:
		begin
		  op_o <= `OP_STO_B;
		  operand_o <= {16'b0,operand_i[31:16]};
		end
	      8'b00111000:
		begin
		  op_o <= `OP_LDO_S;
		end
	      8'b00111001:
		begin
		  op_o <= `OP_STO_S;
		  operand_o <= {16'b0,operand_i[31:16]};
		end
	      8'b00111010:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00111011:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00111100:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00111101:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00111110:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b00111111:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b1000????:
		begin
		  op_o <= `OP_INC;
		  operand_o <= {24'b0,opcode_i[7:0]};
		end
	      8'b1001????:
		begin
		  op_o <= `OP_DEC;
		  operand_o <= {24'b0,opcode_i[7:0]};
		end
	      8'b1010????:
		begin
		  op_o <= `OP_GSR;
		end
	      8'b1011????:
		begin
		  op_o <= `OP_SSR;
		end
	      8'b110000??:
		begin
		  op_o <= `OP_BEQ;
		end
	      8'b110001??:
		begin
		  op_o <= `OP_BNE;
		end
	      8'b110010??:
		begin
		  op_o <= `OP_BLT;
		end
	      8'b110011??:
		begin
		  op_o <= `OP_BGT;
		end
	      8'b110100??:
		begin
		  op_o <= `OP_BLTU;
		end
	      8'b110101??:
		begin
		  op_o <= `OP_BGTU;
		end
	      8'b110110??:
		begin
		  op_o <= `OP_BGE;
		end
	      8'b110111??:
		begin
		  op_o <= `OP_BLE;
		end
	      8'b111000??:
		begin
		  op_o <= `OP_BGEU;
		end
	      8'b111001??:
		begin
		  op_o <= `OP_BLEU;
		end
	      8'b111010??:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b111011??:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b111100??:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b111101??:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b111110??:
		begin
		  op_o <= `OP_BAD;
		end
	      8'b111111??:
		begin
		  op_o <= `OP_BAD;
		end
	    endcase // casex (opcode_i)
	    //	register_write_enable_o <= (!op_nop) & (op_ldi|op_dec|op_xor|op_sub);
	  end // else: !if(!valid_i)
	end // if (! stall_i)
    end // always @ (posedge clk_i)
endmodule // cpu_decode;
