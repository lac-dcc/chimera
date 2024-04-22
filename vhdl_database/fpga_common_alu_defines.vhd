library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.defines.all;

package alu_defines is
  -------------------------
  -- Instruction opcodes --
  -------------------------
  constant R_TYPE_OPCODE : opcode_t := "00000";
  constant ADD_IMMEDIATE_OPCODE : opcode_t := "00001";
  constant LOAD_CONSTANT_OPCODE : opcode_t := "00010";
  constant SW_OPCODE : opcode_t := "00100";
  constant LW_OPCODE : opcode_t := "01000";
  constant THREAD_FINISHED_OPCODE : opcode_t := "10000";

  -- Shift instructions
  constant ALU_FUNCTION_SLL : alu_funct_t := "00000";
  constant ALU_FUNCTION_SRL : alu_funct_t := "00001";
  constant ALU_FUNCTION_SRA : alu_funct_t := "00010";

  -- Comparison instructions
  constant ALU_FUNCTION_SLT : alu_funct_t := "00011";

  -- Arithmetics instructions
  constant ALU_FUNCTION_ADD : alu_funct_t := "00100";
  constant ALU_FUNCTION_SUBTRACT : alu_funct_t := "00101";

  -- Bitwise instructions
  constant ALU_FUNCTION_AND : alu_funct_t := "00110";
  constant ALU_FUNCTION_OR : alu_funct_t := "00111";
  constant ALU_FUNCTION_XOR : alu_funct_t := "01000";

  constant ALU_FUNCTION_MULTIPLY : alu_funct_t := "01001";
  constant ALU_FUNCTION_EQUAL : alu_funct_t := "01010";

end package alu_defines;
