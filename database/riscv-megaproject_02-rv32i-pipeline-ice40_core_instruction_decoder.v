// This program was cloned from: https://github.com/rongcuid/riscv-megaproject
// License: BSD 3-Clause "New" or "Revised" License

/*
 This module is the RV32I instruction decoder

 The Instruction Decoder takes the current instruction as input,
 outputs necessary control signals and data items. It may raise
 exceptions including Illegal Instruction, and Load/Store misaligned.
 */
module instruction_decoder
  (
   // Inputs
   FD_reset, inst, aluout_1_0,
   // Outputs
   immediate,
   alu_is_signed, aluop1_sel, aluop2_sel, alu_op,
   pc_update, pc_mepc,
   regwrite, jump, link, jr, br,
   dm_be, dm_we, mem_is_signed,
   csr_read, csr_write, csr_set, csr_clear, csr_imm,
   a_rs1, a_rs2, a_rd, funct3, funct7,
   // Exceptions
   // bug_invalid_instr_format_onehot,
   exception_illegal_instruction,
   exception_load_misaligned,
   exception_store_misaligned,
   exception_ecall,
   exception_ebreak
   );
`include "core/aluop.vh"
`include "core/opcode.vh"
   // The instruction to be decoded
   input wire FD_reset;
   input wire [31:0] inst;
   input wire [1:0] aluout_1_0;
   // Immediate value
   output [31:0]     immediate;
   // Signed/Unsigned operation for XB ALU
   output 	     alu_is_signed;
   // Select XB ALU: Operator 1, Operator 2, Operation
   output [31:0]     aluop1_sel, aluop2_sel, alu_op;
   // Whether special PC update is needed, whether update pc with MEPC
   output 	     pc_update, pc_mepc;
   // Whether a writeback is needed in XB
   output 	     regwrite;
   // The instruction needs to Jump, Link, or Jump Register
   output 	     jump, link, jr;
   // The instruction is Branch
   output 	     br;
   // Data Memory Byte Enable
   output [3:0]      dm_be;
   // Data Memory write enable
   output 	     dm_we;
   // Treat memory item as Signed/Unsigned
   output 	     mem_is_signed;
   // Control Status Register operations
   output 	     csr_read, csr_write, csr_set, csr_clear, csr_imm;
   // Register address: RS1, RS2, Rd writeback
   output [4:0]      a_rs1, a_rs2, a_rd;
   // The funct3 field
   output [2:0]      funct3;
   // The funct7 field
   output [6:0]      funct7;
   // This shall be refactored to assert()
   // output 	     bug_invalid_instr_format_onehot;
   // Exceptions to be raised
   output 	     exception_illegal_instruction;
   output 	     exception_load_misaligned;
   output 	     exception_store_misaligned;

   // Opcode field
   /* verilator lint_off UNUSED */
   wire [6:0] 	     opcode;
   /* verilator lint_on UNUSED */
   assign opcode = inst[6:0];

   // One-hot encoded instruction format
   reg [5:0] 	     instr_IURJBS;
   // Logic to identify immediate format using opcode
   always @ (*) begin : INSTRUCTION_FORMAT
      /* verilator lint_off CASEOVERLAP */
      case (opcode[6:2])
	// I-Types
	`OP_IMM: instr_IURJBS = 6'b100000;
	`JALR: instr_IURJBS = 6'b100000;
	`LOAD: instr_IURJBS = 6'b100000;
	`MISC_MEM: instr_IURJBS = 6'b100000;
	`OP_IMM: instr_IURJBS = 6'b100000;
	`SYSTEM: instr_IURJBS = 6'b100000;
	// U-Types
	`LUI: instr_IURJBS = 6'b010000;
	`AUIPC: instr_IURJBS = 6'b010000;
	// R-Types
	`OP: instr_IURJBS = 6'b001000;
	// J-Types
	`JAL: instr_IURJBS = 6'b000100;
	// B-Types
	`BRANCH: instr_IURJBS = 6'b000010;
	// S-Types
	`STORE: instr_IURJBS = 6'b000001;
	// Unsupported
	default: instr_IURJBS = 6'bX;
      endcase // case (opcode[6:2])
      /* verilator lint_on CASEOVERLAP */
   end // block: INSTRUCTION_FORMAT

   // The immediate value, extended to 32-bit
   reg [31:0] immediate;
   // Logic to decode immediate value. Read the RISC-V spec Vol. 1 for
   // details
   always @ (*) begin : IMMEDIATE_DECODE
      case (instr_IURJBS)
	6'b100000: begin : I_TYPE
	   // Certain instructions use a different I-immediate format
	   immediate
	     = (opcode[6:2] == `OP_IMM
		&& 
		(funct3 == 3'b101 || funct3 == 3'b001))
	       ? {27'b0, inst[24:20]}
	       : {{21{inst[31]}}, inst[30:20]};
	end
	6'b010000: immediate = {inst[31:12], 12'b0};
	6'b001000: immediate = 32'bX;
	6'b000100: immediate = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
	6'b000010: immediate = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
	6'b000001: immediate = {{21{inst[31]}}, inst[30:25], inst[11:8], inst[7]};
	default: begin
	   immediate = 32'bX;
	end
      endcase // case (instr_IURJBS)
   end // block: IMMEDIATE_DECODE

   wire [2:0] funct3;
   wire [6:0] funct7;
   assign funct3 = inst[14:12];
   assign funct7 = inst[31:25];
   reg 	      alu_is_signed, pc_update, pc_mepc, regwrite, jump, link, jr;
   reg 	      br;
   reg [3:0]  dm_be;
   reg 	      dm_we;
   reg 	      mem_is_signed;
   reg 	      csr_read, csr_write, csr_set, csr_clear, csr_imm;
   
   reg [4:0]  a_rs1, a_rs2, a_rd;
   reg 	      exception_illegal_instruction;
   reg 	      exception_load_misaligned;
   reg 	      exception_store_misaligned;
   output reg        exception_ecall, exception_ebreak;
   integer    aluop1_sel, aluop2_sel, alu_op;
   // Register fields
   assign a_rs1 = (opcode[6:2] == `LUI) ? 5'd0 : inst[19:15];
   assign a_rs2 = inst[24:20];
   assign a_rd  = inst[11:7];
   // Logic to generate control signals
   always @ (*) begin : CONTROL_SIG_GENERATOR
      // Default ALU selections
      alu_is_signed = 1'b1;
      aluop1_sel = `ALUOP1_RS1;
      aluop2_sel = `ALUOP2_UNKN;
      alu_op = `ALU_UNKN;
      // Default write actions
      regwrite = 1'b0;
      pc_update = 1'b0;
      pc_mepc = 1'b0;
      // Default memory actions
      dm_be = 4'b0;
      dm_we = 1'b0;
      mem_is_signed = 1'b0;
      // Default branch actions
      jump = 1'b0;
      jr = 1'b0;
      link = 1'b0;
      br = 1'b0;
      // Default CSR actions
      csr_read = 1'b0;
      csr_write = 1'b0;
      csr_set = 1'b0;
      csr_clear = 1'b0;
      csr_imm = 1'b0;
      // Default no exception
      exception_illegal_instruction = 1'b0;
      exception_load_misaligned = 1'b0;
      exception_store_misaligned = 1'b0;
      exception_ecall = 1'b0;
      exception_ebreak = 1'b0;
      // Decoding opcode. Read the RISC-V Spec Vol 1.
      if (!FD_reset) begin
        case (opcode[6:2])
          `OP_IMM: begin
            // Immediate operation
            regwrite = 1'b1;
            aluop2_sel = `ALUOP2_IMM;
            case (funct3)
              3'b000: begin : ADDI
                alu_op = `ALU_ADD;
              end
              3'b001: begin : SLLI
                alu_op = `ALU_SLL;
              end
              3'b010: begin : SLTI
                alu_op = `ALU_SLT;
              end
              3'b011: begin : SLTIU
                alu_op = `ALU_SLT;
                alu_is_signed = 1'b0;
              end
              3'b100: begin : XORI
                alu_op = `ALU_XOR;
              end
              3'b101: begin : SRLI_SRAI
                alu_op = inst[30] ? `ALU_SRA : `ALU_SRL;
              end
              3'b110: begin : ORI
                alu_op = `ALU_OR;
              end
              3'b111: begin : ANDI
                alu_op = `ALU_AND;
              end
            endcase // case (funct3)
          end // case: OP_IMM
          `LUI: begin
            // LUI loads immediate into high-20 bits of register 
            // Operation is: imm + 0
            aluop2_sel = `ALUOP2_IMM;
            alu_op = `ALU_ADD;
            regwrite = 1'b1;
            // 0 + imm
            //a_rs1 = 5'd0;
          end
          `AUIPC: begin
            // AUIPC loads upper-20 bits of PC, adds immediate, and
            // saves into register
            regwrite = 1'b1;
            aluop1_sel = `ALUOP1_PC;
            aluop2_sel = `ALUOP2_IMM;
            alu_op = `ALU_ADD;
          end
          `OP: begin
            // Register-Register integer operation
            regwrite = 1'b1;
            aluop2_sel = `ALUOP2_RS2;
            case (funct3)
              3'b000: begin : ADD_SUB
                if (funct7[5]) begin : SUB
                  alu_op = `ALU_SUB; 
                end
                else begin : ADD
                  alu_op = `ALU_ADD;
                end
              end
              3'b001: begin : SLL
                alu_op = `ALU_SLL;
              end
              3'b010: begin : SLT
                alu_op = `ALU_SLT;
              end
              3'b011: begin : SLTU
                alu_op = `ALU_SLT;
                alu_is_signed = 1'b0;
              end
              3'b100: begin : XOR
                alu_op = `ALU_XOR;
              end
              3'b101: begin : SRL_SRA
                alu_op = funct7[5] ? `ALU_SRA : `ALU_SRL;
                // if (funct7[5]) begin : SRA
                //    alu_op = `ALU_SRA;
                // end
                // else begin : SRL
                //    alu_op = `ALU_SRL;
                // end
              end
              3'b110: begin : OR
                alu_op = `ALU_OR;
              end
              3'b111: begin : AND
                alu_op = `ALU_AND;
              end
            endcase // case (funct3)
          end
          `JAL: begin
            // Jump and link.  Addition is performed in XB
            // stage. Operands are loaded in the Core module, so it
            // does not matter here
            jump = 1'b1;
            link = 1'b1;
            regwrite = 1'b1;
            alu_op = `ALU_ADD;
            aluop2_sel = `ALUOP2_RS2;
          end
          `JALR: begin
            // Jump and link register.  Addition is performed in XB
            // stage. Operands are loaded in the Core module, so it
            // does not matter here
            jr = 1'b1;
            link = 1'b1;
            regwrite = 1'b1;
            alu_op = `ALU_ADD;
            aluop2_sel = `ALUOP2_RS2;
          end
          `BRANCH: begin
            // Branch instructions
            br = 1'b1;
            case (funct3)
              3'b000,3'b001,3'b100,3'b101,3'b110,3'b111: begin
                // Do nothing here. Let comparator choose for itself
              end
              default: begin
                exception_illegal_instruction = 1'b1;
              end
            endcase // case (funct3)
          end
          `LOAD: begin
            // LW, LH, LB use different byte enables
            regwrite = 1'b1;
            case (funct3)
              3'b000, 3'b100: begin : LB
                mem_is_signed = (funct3 == 3'b000) ? 1'b1 : 1'b0;
                case (aluout_1_0[1:0])
                  2'b00: begin
                    dm_be = 4'b0001;
                  end
                  2'b01: begin
                    dm_be = 4'b0010;
                  end
                  2'b10: begin
                    dm_be = 4'b0100;
                  end
                  2'b11: begin
                    dm_be = 4'b1000;
                  end
                  default:
                    dm_be = 4'bX;
                endcase // case (aluout_1_0[1:0])
              end
              3'b001, 3'b101: begin : LH
                mem_is_signed = (funct3 == 3'b001) ? 1'b1 : 1'b0;
                exception_load_misaligned = aluout_1_0[0] ? 1'b1 : 1'b0;
                dm_be = aluout_1_0[0] ? 4'b0000
                : aluout_1_0[1] ? 4'b1100 : 4'b0011;
              end
              3'b010: begin : LW
                dm_be = 4'b1111;
                exception_load_misaligned 
                = (aluout_1_0[0] | aluout_1_0[1]) ? 1'b1 : 1'b0;
              end
              default: begin 
              exception_illegal_instruction = 1'b1;
            end
          endcase // case (funct3)
        end
        `STORE: begin
          // SW, SH, SB use different byte enables
          dm_we = 1'b1;
          case (funct3)
            3'b000: begin : SB
              case (aluout_1_0[1:0])
                2'b00: begin
                  dm_be = 4'b0001;
                end
                2'b01: begin
                  dm_be = 4'b0010;
                end
                2'b10: begin
                  dm_be = 4'b0100;
                end
                2'b11: begin
                  dm_be = 4'b1000;
                end
              endcase // case (aluout_1_0[1:0])
            end
            3'b001: begin : SH
              exception_store_misaligned = aluout_1_0[0] ? 1'b1 : 1'b0;
              dm_be = aluout_1_0[0] ? 4'b0
              : aluout_1_0[1] ? 4'b1100 : 4'b0011;
            end
            3'b010: begin : SW
              dm_be = 4'b1111;
              exception_store_misaligned
              = (aluout_1_0[0] | aluout_1_0[1]) ? 1'b1 : 1'b0;
            end
            default: begin 
            exception_illegal_instruction = 1'b1;
          end
        endcase // case (funct3)
      end
      `MISC_MEM: begin
        // NOP since this core is in order commit
      end
      `SYSTEM: begin
        // Environment instructions are implemented via software
        // trap
        case (funct3)
          3'b000: begin : ECALL_EBREAK_RET
            case (funct7)
              7'b0: begin : ECALL_EBREAK_URET
                // Software trap
                exception_ecall = ~immediate[0];
                exception_ebreak = immediate[0];
              end
              7'b0001000: begin : SRET_WFI
                // Software trap
                exception_illegal_instruction = 1'b1;
              end
              7'b0011000: begin : MRET
                // MRET jumps to MEPC
                pc_update = 1'b1;
                pc_mepc = 1'b1;
              end
              default: begin 
              exception_illegal_instruction = 1'b1;
            end
          endcase // case (funct7)
        end
        3'b001: begin : CSRRW
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_write = 1'b1;
        end
        3'b010: begin : CSRRS
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_set = 1'b1;
        end
        3'b011: begin : CSRRC
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_clear = 1'b1;
        end
        3'b101: begin : CSRRWI
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_write = 1'b1;
          csr_imm = 1'b1;
        end
        3'b110: begin : CSRRSI
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_set = 1'b1;
          csr_imm = 1'b1;
        end
        3'b111: begin : CSRRCI
          regwrite = 1'b1;
          csr_read = 1'b1;
          csr_clear = 1'b1;
          csr_imm = 1'b1;
        end
        default: begin
          exception_illegal_instruction = 1'b1;
        end
      endcase // case (funct3)
    end

    default: begin
      exception_illegal_instruction = 1'b1;
    end
  endcase // case (opcode[6:2])
end 
      /* verilator lint_on CASEOVERLAP */

      if (  exception_illegal_instruction
	  | exception_load_misaligned
	  | exception_store_misaligned) begin
	 regwrite = 1'b0;
      end
      
      // Lower two bits are always 11
      // exception_unsupported_category
      // 	= (opcode[1:0] != 2'b11) ? 1'b1 : 1'b0;
      // if (opcode[1:0] != 2'b11)
      // 	exception_unsupported_category = 1'b1;
   end

   // reg [255:0] disasm_opcode /*verilator public*/;

   // always @ (*) begin : DISASM
   //    case (opcode[6:2])
   // 	`LOAD: disasm_opcode = "LOAD    ";
   // 	`OP_IMM: begin
   // 	   case (funct3)
   // 	     3'b000: disasm_opcode = "ADDI    ";
   // 	     3'b001: disasm_opcode = "SLLI    ";
   // 	     3'b010: disasm_opcode = "SLTI    ";
   // 	     3'b011: disasm_opcode = "SLTIU   ";
   // 	     3'b100: disasm_opcode = "XORI    ";
   // 	     3'b101: disasm_opcode = funct7[5] 
   // 					? "SRAI    " : "SRLI    ";
   // 	     3'b110: disasm_opcode = "ORI     ";
   // 	     3'b111: disasm_opcode = "ANDI    ";
   // 	     default: disasm_opcode = "OP-IMM  ";
   // 	   endcase
   // 	end
   // 	`AUIPC: disasm_opcode = "AUIPC   ";
   // 	`STORE: disasm_opcode = "STORE   ";
   // 	`OP: begin
   // 	   case (funct3)
   // 	     3'b000: disasm_opcode = funct7[5] 
   // 					? "SUB     " : "ADD     ";
   // 	     3'b001: disasm_opcode = "SLL     ";
   // 	     3'b010: disasm_opcode = "SLT     ";
   // 	     3'b011: disasm_opcode = "SLTU    ";
   // 	     3'b100: disasm_opcode = "XOR     ";
   // 	     3'b101: disasm_opcode = funct7[5] 
   // 					? "SRA     " : "SRL     ";
   // 	     3'b110: disasm_opcode = "OR      ";
   // 	     3'b111: disasm_opcode = "AND     ";
   // 	     default: 	   disasm_opcode = "OP?     ";
   // 	   endcase
   // 	end
   // 	`LUI:  disasm_opcode = "LUI     ";
   // 	`BRANCH: begin
   // 	   case (funct3)
   // 	     3'b000: disasm_opcode = "BEQ     ";
   // 	     3'b001: disasm_opcode = "BNE     ";
   // 	     3'b100: disasm_opcode = "BLT     ";
   // 	     3'b101: disasm_opcode = "BGE     ";
   // 	     3'b110: disasm_opcode = "BLTU    ";
   // 	     3'b111: disasm_opcode = "BGEU    ";
   // 	     default: disasm_opcode = "BRANCH  ";
   // 	   endcase
   // 	end
   // 	`JALR: disasm_opcode = "JALR    ";
   // 	`JAL: disasm_opcode = "JAL     ";
   // 	`SYSTEM: begin 
   // 	   case (funct3)
   // 	     3'b000: begin
   // 		if (funct7==7'b0011000 &&
   // 		    a_rs2 == 5'b00010 &&
   // 		    a_rs1 == 5'b00000)
   // 		  disasm_opcode = "MRET    ";
   // 		else
   // 		  disasm_opcode = "SYSTEM  ";
   // 	     end
   // 	     3'b001: disasm_opcode = "CSRRW   ";
   // 	     3'b010: disasm_opcode = "CSRRS   ";
   // 	     3'b011: disasm_opcode = "CSRRC   ";
   // 	     3'b101: disasm_opcode = "CSRRWI  ";
   // 	     3'b110: disasm_opcode = "CSRRSI  ";
   // 	     3'b111: disasm_opcode = "CSRRCI  ";
   // 	     default: disasm_opcode = "SYSTEM  ";
   // 	   endcase
   // 	end
   // 	default: disasm_opcode = "ILLEGAL ";
   //    endcase
   // end
endmodule // instruction_decoder
