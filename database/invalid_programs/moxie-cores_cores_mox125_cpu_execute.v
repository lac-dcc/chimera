// cpu_execute.v - The moxie execute stage
//
// Copyright (c) 2010, 2011, 2012, 2105, 2017, 2020, 2023 Anthony Green.
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

module cpu_execute (/*AUTOARG*/
                    // Outputs
                    dmem_address_o, dmem_data_o, dmem_stb_o, dmem_sel_o, dmem_cyc_o,
                    dmem_we_o, register_wea_o, register_web_o, register1_write_index_o,
                    register2_write_index_o, pipeline_control_bits_o, memory_address_o,
                    reg1_result_o, reg2_result_o, mem_result_o, PC_o, flush_o,
                    branch_flag_o, branch_target_o,
                    // Inputs
                    rst_i, clk_i, dmem_data_i, dmem_ack_i, stall_i, flush_i, regA_i,
                    regB_i, pipeline_control_bits_i, register1_write_index_i,
                    register2_write_index_i, operand_i, op_i, sp_i, fp_i, PC_i,
                    pcrel_offset_i
                    );

  parameter [2:0] STATE_READY = 3'b000,
                  STATE_JSR1 = 3'b001,
                  STATE_RET1 = 3'b010,
                  STATE_STA_L1 = 3'b011,
                  STATE_JSR2 = 3'b100,
                  STATE_JSR3 = 3'b101,
                  STATE_WAIT = 3'b110;

  // --- Clock and Reset ------------------------------------------
  input           rst_i, clk_i;

  // --- Data memory ----------------------------------------------
  output reg [31:0] dmem_address_o;
  input [15:0]      dmem_data_i;
  output reg [15:0] dmem_data_o;
  output reg        dmem_stb_o;
  output reg [1:0]  dmem_sel_o;
  output reg        dmem_cyc_o;
  output reg        dmem_we_o;
  input             dmem_ack_i;

  // --- Pipeline interlocking ------------------------------------
  input             stall_i;
  input             flush_i;

  // --- Inputs ---------------------------------------------------
  input [31:0]      regA_i;
  input [31:0]      regB_i;
  input [`PCB_WIDTH-1:0] pipeline_control_bits_i;
  input [3:0]            register1_write_index_i;
  input [3:0]            register2_write_index_i;
  input [31:0]           operand_i;
  input [6:0]            op_i;
  input [31:0]           sp_i;
  input [31:0]           fp_i;
  input [31:0]           PC_i /*verilator public*/;
  input [9:0]            pcrel_offset_i;

  // --- Outputs --------------------------------------------------
  output                 register_wea_o;
  output                 register_web_o;
  output [3:0]           register1_write_index_o;
  output [3:0]           register2_write_index_o;
  output [`PCB_WIDTH-1:0] pipeline_control_bits_o;
  output [31:0]           memory_address_o;
  output [31:0]           reg1_result_o;
  output [31:0]           reg2_result_o;
  output [31:0]           mem_result_o;
  output [31:0]           PC_o;


  output [0:0]            flush_o;
  reg [0:0]               flush_o;

  reg [0:4]               CC_result;

  output                  branch_flag_o;
  output [31:0]           branch_target_o;

  reg                     branch_flag_o;
  reg [31:0]              branch_target_o;

  reg [3:0]               register1_write_index_o;
  reg [3:0]               register2_write_index_o;
  reg [`PCB_WIDTH-1:0]    pipeline_control_bits_o;
  reg [31:0]              memory_address_o;
  reg [31:0]              reg1_result_o;
  reg [31:0]              reg2_result_o;
  reg [31:0]              mem_result_o;

  reg [31:0]              PC_o;
  wire [31:0]             PC_plus_6;
  assign PC_plus_6 = PC_i+6;

  reg                     dmem_wait;
  reg [2:0]               current_state;
  wire [2:0]              next_state;
  reg [2:0]               saved_next_state;

  reg [31:0]              next_address;
  reg [15:0]              next_data;

  reg                     register_wea_o;
  reg                     register_web_o;

  wire                    cc_eq, cc_gt, cc_lt, cc_gtu, cc_ltu;
  wire [31:0]             cc_AsubB;
  wire [31:0]             cc_BsubA;

  assign cc_AsubB = regA_i - regB_i;
  assign cc_BsubA = regB_i - regA_i;

  assign cc_eq = regA_i == regB_i;
  assign cc_lt = regA_i[31] ^ regB_i[31] ? regA_i[31] : cc_AsubB[31];
  assign cc_gt = regA_i[31] ^ regB_i[31] ? regB_i[31] : cc_BsubA[31];
  assign cc_gtu = regA_i > regB_i;
  assign cc_ltu = regA_i < regB_i;

  wire                    branch_condition;
  assign branch_condition =
                           ((op_i == `OP_BEQ) & CC_result[0])
    | ((op_i == `OP_BNE) & !CC_result[0])
      | ((op_i == `OP_BLT) & CC_result[1])
        | ((op_i == `OP_BLTU) & CC_result[3])
          | ((op_i == `OP_BGT) & CC_result[2])
            | ((op_i == `OP_BGTU) & CC_result[4])
              | ((op_i == `OP_BLE) & (CC_result[0] | CC_result[1]))
                | ((op_i == `OP_BGE) & (CC_result[0] | CC_result[2]))
                  | ((op_i == `OP_BLEU) & (CC_result[0] | CC_result[3]))
                    | ((op_i == `OP_BGEU) & (CC_result[0] | CC_result[4]));

  wire [31:0]             pcrel_branch_target;
  assign pcrel_branch_target = {{21{pcrel_offset_i[9]}}, pcrel_offset_i, 1'b0 } + PC_i + 32'd2;

  wire [7:0]              incdec_value = pcrel_offset_i[7:0];

  always @(posedge clk_i)
    begin
      if (! (stall_i | rst_i)) begin
	      register_wea_o = pipeline_control_bits_i[`PCB_WA] ;
	      register_web_o = pipeline_control_bits_i[`PCB_WB];
      end
    end

  always @(posedge clk_i)
    begin
      if (! stall_i)
	      flush_o <= rst_i ? 1'b0
		               : flush_i
		               | branch_condition
		               | (op_i == `OP_JMPA)
		                 | (current_state == STATE_JSR3);
    end

  assign next_state = (rst_i | flush_i ) ? STATE_READY :
		                  ((saved_next_state != STATE_WAIT) ? saved_next_state :
		                   ((current_state == STATE_JSR1) ? STATE_JSR2 :
			                  ((current_state == STATE_JSR2) ? STATE_JSR3 :
			                   ((branch_flag_o | branch_condition) ? STATE_READY :
			                    ((op_i == `OP_JSR) ? STATE_JSR1 :
			                     ((op_i == `OP_JSRA) ? STATE_JSR1 :
			                      ((op_i == `OP_RET) ? STATE_RET1 :
			                       ((op_i == `OP_STA_L) ? STATE_STA_L1 :
			                        ((op_i == `OP_ST_L) ? STATE_STA_L1 :
			                         ((op_i == `OP_PUSH) ? STATE_STA_L1 :
				                        ((op_i == `OP_STO_L) ? STATE_STA_L1 :
				                         STATE_READY)))))))))));

  always @(posedge rst_i or posedge clk_i)
    if (rst_i)
      saved_next_state <= STATE_WAIT;
    else
      if (! dmem_wait)
	      current_state <= next_state;
      else
	      begin
	        if (dmem_ack_i)
	          begin
	            current_state <= next_state;
	            saved_next_state <= STATE_WAIT;
	          end
	        else
	          begin
	            current_state <= STATE_WAIT;
	            if (saved_next_state != STATE_WAIT)
		            saved_next_state <= next_state;
	          end
	      end

  always @(posedge rst_i or posedge clk_i)
    if (rst_i) begin
      pipeline_control_bits_o <= 6'b0;
      branch_flag_o <= 0;
      dmem_we_o <= 0;
      dmem_sel_o <= 2'b0;
      dmem_stb_o <= 0;
      dmem_cyc_o <= 0;
    end else begin
      if (! stall_i)
	      begin
	        branch_flag_o <= branch_condition | (op_i == `OP_JMPA) | (op_i == `OP_JSRA);
	        if (flush_i)
	          /* We've just branched, so ignore any incoming instruction.  */
	          pipeline_control_bits_o <= 6'b00000;
	      end
      case (current_state)
	      STATE_WAIT:
	        begin
	          dmem_stb_o <= 0;
	        end
	      STATE_READY:
	        begin
	          if (stall_i)
	            begin
		            if (dmem_ack_i)
		              dmem_we_o <= 0;
	            end
	          else
	            if (! branch_flag_o)
		            begin
		              PC_o <= PC_i;
		              dmem_we_o <= pipeline_control_bits_i[`PCB_WM];
		              dmem_stb_o <= pipeline_control_bits_i[`PCB_WM] | pipeline_control_bits_i[`PCB_RM];
		              pipeline_control_bits_o <= pipeline_control_bits_i;
		              case (op_i)
		                `OP_ADD_L:
		                  begin
			                  reg1_result_o <= regA_i + regB_i;
			                  register1_write_index_o <= register1_write_index_i;
			                  dmem_cyc_o <= 0;
		                  end
		                `OP_AND:
		                  begin
			                  reg1_result_o <= regA_i & regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_ASHL:
		                  begin
			                  reg1_result_o <= regA_i <<< regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_ASHR:
		                  begin
			                  reg1_result_o <= regA_i >>> regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_BAD:
		                  begin
		                  end
		                `OP_BEQ:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BGE:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BGEU:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BGT:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BGTU:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BLE:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BLEU:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BLT:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BLTU:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BNE:
		                  begin
			                  branch_target_o <= pcrel_branch_target;
		                  end
		                `OP_BRK:
		                  begin
		                  end
		                `OP_CMP:
		                  begin
			                  CC_result <= {cc_eq, cc_lt, cc_gt, cc_ltu, cc_gtu};
		                  end
		                `OP_DEC:
		                  begin
			                  reg1_result_o <= regA_i - { 24'b0, incdec_value };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_DIV_L:
		                  begin
		                  end
		                `OP_GSR:
		                  begin
		                  end
		                `OP_INC:
		                  begin
			                  reg1_result_o <= regA_i + { 24'b0, incdec_value };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_JMP:
		                  begin
			                  branch_target_o <= regA_i;
		                  end
		                `OP_JMPA:
		                  begin
			                  branch_target_o <= operand_i;
			                  dmem_cyc_o <= 0;
		                  end
		                `OP_JSR:
		                  begin
			                  // Decrement $sp by 8 bytes and store the return address.
			                  reg1_result_o <= sp_i - 8;
			                  memory_address_o <= sp_i - 8;
			                  mem_result_o <= PC_i+2;
			                  register1_write_index_o <= 1; // $sp
			                  branch_target_o <= regA_i;
		                  end
		                `OP_JSRA:
		                  begin
			                  // Decrement $sp by 8 bytes and store the return address.
			                  reg1_result_o <= sp_i - 12;
			                  register1_write_index_o <= 1; // $sp
			                  // Write to memory
			                  dmem_data_o <= PC_plus_6[31:16];
			                  dmem_address_o <= sp_i - 8;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
                        dmem_stb_o <= 1;
			                  next_data <= PC_plus_6[15:0];
			                  next_address <= sp_i - 4;
			                  branch_target_o <= operand_i;
		                  end
		                `OP_LDA_B:
		                  begin
			                  memory_address_o <= operand_i;
		                  end
		                `OP_LDA_L:
		                  begin
			                  memory_address_o <= operand_i;
		                  end
		                `OP_LDA_S:
		                  begin
			                  memory_address_o <= operand_i;
		                  end
		                `OP_LD_B:
		                  begin
			                  memory_address_o <= regB_i;
		                  end
		                `OP_LDI_B:
		                  begin
			                  reg1_result_o <= operand_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_LDI_L:
		                  begin
			                  reg1_result_o <= operand_i;
			                  register1_write_index_o <= register1_write_index_i;
			                  dmem_cyc_o <= 0;
		                  end
		                `OP_LDI_S:
		                  begin
			                  reg1_result_o <= operand_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_LD_L:
		                  begin
			                  memory_address_o <= regB_i;
		                  end
		                `OP_LDO_B:
		                  begin
			                  memory_address_o <= operand_i + regB_i;
		                  end
		                `OP_LDO_L:
		                  begin
			                  memory_address_o <= operand_i + regB_i;
		                  end
		                `OP_LDO_S:
		                  begin
			                  memory_address_o <= operand_i + regB_i;
		                  end
		                `OP_LD_S:
		                  begin
			                  memory_address_o <= regB_i;
		                  end
		                `OP_LSHR:
		                  begin
			                  reg1_result_o <= regA_i >> regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_MOD_L:
		                  begin
			                  // FIXME reg1_result_o <= regA_i % regB_i;
		                  end
		                `OP_MOV:
		                  begin
			                  reg1_result_o <= regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_MUL_L:
		                  begin
			                  reg1_result_o <= regA_i * regB_i;
		                  end
		                `OP_NEG:
		                  begin
			                  reg1_result_o <= -regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_NOP:
		                  begin
			                  dmem_cyc_o <= 0;
		                  end
		                `OP_NOT:
		                  begin
			                  reg1_result_o <= ~regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_OR:
		                  begin
			                  reg1_result_o <= regA_i | regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_POP:
		                  begin
			                  // Decrement pointer register by 4 bytes.
			                  memory_address_o <= regA_i;
			                  reg2_result_o <= regA_i - 4;
			                  register1_write_index_o <= register2_write_index_i;
			                  register2_write_index_o <= register1_write_index_i;
		                  end
		                `OP_PUSH:
		                  begin
			                  // Decrement pointer register by 4 bytes.
			                  reg1_result_o <= regA_i - 4;
			                  register1_write_index_o <= register1_write_index_i;
			                  // Write to memory
			                  dmem_data_o <= regB_i[31:16];
			                  dmem_address_o <= regA_i - 4;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
			                  next_data <= regB_i[15:0];
			                  next_address <= regA_i - 2;
		                  end
		                `OP_RET:
		                  begin
                        // Pop $fp. Pop return address. Skip static chain.
			                  reg1_result_o <= sp_i + 12;
			                  register1_write_index_o <= 1; // $sp
			                  // Increment $sp by 8
			                  dmem_address_o <= sp_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
			                  next_address <= sp_i + 2;
		                  end
		                `OP_SEX_B:
		                  begin
			                  reg1_result_o <= { {24{regB_i[7]}}, regB_i[7:0] };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_SEX_S:
		                  begin
			                  reg1_result_o <= { {16{regB_i[15]}}, regB_i[15:0] };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_ZEX_B:
		                  begin
			                  reg1_result_o <= { 24'b0, regB_i[7:0] };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_ZEX_S:
		                  begin
			                  reg1_result_o <= { 16'b0, regB_i[15:0] };
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_SSR:
		                  begin
		                  end
		                `OP_STA_B:
		                  begin
			                  dmem_data_o <= {8'b0, regA_i[7:0]};
			                  dmem_address_o <= operand_i;
			                  dmem_sel_o <= 2'b01;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_STA_L:
		                  begin
			                  dmem_data_o <= regA_i[31:16];
			                  dmem_address_o <= operand_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
			                  next_data <= regA_i[15:0];
			                  next_address <= operand_i+2;
		                  end
		                `OP_STA_S:
		                  begin
			                  dmem_data_o <= regA_i[15:0];
			                  dmem_address_o <= operand_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_ST_B:
		                  begin
			                  dmem_data_o <= {8'b0, regB_i[7:0]};
			                  dmem_address_o <= regA_i;
			                  dmem_sel_o <= 2'b01;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_ST_L:
		                  begin
			                  dmem_data_o <= regB_i[31:16];
			                  dmem_address_o <= regA_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
			                  next_data <= regB_i[15:0];
			                  next_address <= regA_i+2;
		                  end
		                `OP_STO_B:
		                  begin
			                  dmem_data_o <= {8'b0, regB_i[7:0]};
			                  dmem_address_o <= operand_i + regA_i;
			                  dmem_sel_o <= 2'b01;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_STO_L:
		                  begin
			                  dmem_data_o <= regB_i[31:16];
			                  dmem_address_o <= operand_i + regA_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
			                  next_data <= regB_i[15:0];
			                  next_address <= operand_i + regA_i + 2;
		                  end
		                `OP_STO_S:
		                  begin
			                  dmem_data_o <= regB_i[15:0];
			                  dmem_address_o <= operand_i + regA_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_ST_S:
		                  begin
			                  dmem_data_o <= regB_i[15:0];
			                  dmem_address_o <= regA_i;
			                  dmem_sel_o <= 2'b11;
			                  dmem_cyc_o <= 1;
		                  end
		                `OP_SUB_L:
		                  begin
			                  reg1_result_o <= regA_i - regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		                `OP_SWI:
		                  begin
		                  end
		                `OP_UDIV_L:
		                  begin
		                  end
		                `OP_UMOD_L:
		                  begin
		                  end
		                `OP_XOR:
		                  begin
			                  reg1_result_o <= regA_i ^ regB_i;
			                  register1_write_index_o <= register1_write_index_i;
		                  end
		              endcase // case (op_i)
		            end // if (! branch_flag_o)
	        end // case: STATE_READY
	      STATE_JSR1:
	        begin
	          if (dmem_ack_i)
	            begin
		            dmem_data_o <= next_data;
		            dmem_address_o <= next_address;
		            dmem_sel_o <= 2'b11;
		            dmem_cyc_o <= 1;
		            dmem_stb_o <= 1;
		            pipeline_control_bits_o <= 6'b000001;
	            end
	        end
	      STATE_JSR2:
	        begin
	          if (dmem_ack_i)
	            begin
		            dmem_address_o <= sp_i;
		            dmem_data_o <= fp_i[31:16];
		            dmem_sel_o <= 2'b11;
		            dmem_cyc_o <= 1;
		            dmem_stb_o <= 1;
		            pipeline_control_bits_o <= 6'b000001;
	            end
	        end
	      STATE_JSR3:
	        begin
	          if (dmem_ack_i)
	            begin
		            dmem_address_o <= sp_i + 2;
		            dmem_data_o <= fp_i[15:0];
		            dmem_sel_o <= 2'b11;
		            dmem_cyc_o <= 1;
		            dmem_stb_o <= 1;
		            pipeline_control_bits_o <= 6'b000001;
	            end
	        end
	      STATE_RET1:
	        begin
	          // Increment $sp by 4 bytes.
	          reg1_result_o <= sp_i + 4;
	          memory_address_o <= sp_i + 4;
	          pipeline_control_bits_o <= 6'b010000;
	          // This is all wrong
	          register1_write_index_o <= 1; // $sp
	          branch_target_o <= operand_i;
	        end
	      STATE_STA_L1:
	        if (dmem_ack_i)
	          begin
	            dmem_data_o <= next_data;
	            dmem_address_o <= next_address;
	            dmem_sel_o <= 2'b11;
	            dmem_cyc_o <= 1;
	            dmem_stb_o <= 1;
	          end
      endcase // case (current_state)
    end // else: !if(rst_i)
endmodule // cpu_execute;
