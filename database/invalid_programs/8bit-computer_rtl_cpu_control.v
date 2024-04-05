module cpu_control(
  input wire [7:0] instruction,
  input wire clk,
  input wire reset_cycle,
  output reg [7:0] state,
  output reg [3:0] cycle,
  output reg [7:0] opcode
);

  `include "rtl/parameters.v"

  initial
    cycle = 0;

  always @ (posedge clk) begin
    casez (instruction)
      `PATTERN_LDI:  opcode = `OP_LDI;
      `PATTERN_MOV:  opcode = `OP_MOV;
      `PATTERN_ALU:  opcode = `OP_ALU;
      `PATTERN_JMP:  opcode = `OP_JMP;
      `PATTERN_PUSH: opcode = `OP_PUSH;
      `PATTERN_POP:  opcode = `OP_POP;
      default: opcode = instruction;
    endcase

    case (cycle)
      `T1: state = `STATE_FETCH_PC;
      `T2: state = `STATE_FETCH_INST;
      `T3: state = (opcode == `OP_HLT) ? `STATE_HALT :
                   (opcode == `OP_MOV) ? `STATE_MOV_FETCH :
                   (opcode == `OP_ALU || opcode == `OP_CMP) ? `STATE_ALU_EXEC :
                   (opcode == `OP_RET || opcode == `OP_POP) ? `STATE_INC_SP :
                   (opcode == `OP_PUSH) ? `STATE_FETCH_SP :
                   (opcode == `OP_IN || opcode == `OP_OUT || opcode == `OP_CALL || opcode == `OP_LDI || opcode == `OP_JMP) ? `STATE_FETCH_PC :
                   `STATE_NEXT;
      `T4: state = (opcode == `OP_JMP) ? `STATE_JUMP :
                   (opcode == `OP_LDI) ? `STATE_SET_REG :
                   (opcode == `OP_MOV) ? `STATE_MOV_LOAD :
                   (opcode == `OP_ALU) ? `STATE_ALU_OUT :
                   (opcode == `OP_OUT || opcode == `OP_IN) ? `STATE_SET_ADDR :
                   (opcode == `OP_PUSH) ? `STATE_REG_STORE :
                   (opcode == `OP_CALL) ? `STATE_SET_REG :
                   (opcode == `OP_RET || opcode == `OP_POP) ? `STATE_FETCH_SP :
                   `STATE_NEXT;
      `T5: state = (opcode == `OP_MOV) ? `STATE_MOV_STORE :
                   (opcode == `OP_CALL) ? `STATE_FETCH_SP :
                   (opcode == `OP_RET) ? `STATE_RET :
                   (opcode == `OP_OUT) ? `STATE_OUT :
                   (opcode == `OP_POP) ? `STATE_SET_REG :
                   (opcode == `OP_IN) ? `STATE_IN :
                   `STATE_NEXT;
      `T6: state = (opcode == `OP_CALL) ? `STATE_PC_STORE :
                   `STATE_NEXT;
      `T7: state = (opcode == `OP_CALL) ? `STATE_TMP_JUMP :
                   `STATE_NEXT;
      `T8: state = `STATE_NEXT;
      default: $display("Cannot decode : cycle = %d, instruction = %h", cycle, instruction);
    endcase

    cycle = (cycle > 6) ? 0 : cycle + 1;
  end

  always @ (posedge reset_cycle) begin
    cycle = 0;
  end

endmodule
