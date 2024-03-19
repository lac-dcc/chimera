`define OP_NOP  8'b00_000_000
`define OP_CALL 8'b00_000_001
`define OP_RET  8'b00_000_010
`define OP_OUT  8'b00_000_011
`define OP_IN   8'b00_000_100
`define OP_HLT  8'b00_000_101
`define OP_CMP  8'b00_000_110
`define OP_LDI  8'b00_010_000
`define OP_JMP  8'b00_011_000
`define OP_PUSH 8'b00_100_000
`define OP_POP  8'b00_101_000
`define OP_ALU  8'b01_000_000
`define OP_MOV  8'b10_000_000

`define PATTERN_LDI  8'b00_010_???
`define PATTERN_JMP  8'b00_011_???
`define PATTERN_MOV  8'b10_???_???
`define PATTERN_ALU  8'b01_???_000
`define PATTERN_PUSH 8'b00_100_???
`define PATTERN_POP  8'b00_101_???


`define STATE_NEXT             8'h00
`define STATE_FETCH_PC         8'h01
`define STATE_FETCH_INST       8'h02
`define STATE_HALT             8'h03
`define STATE_JUMP             8'h04
`define STATE_OUT              8'h05
`define STATE_ALU_OUT          8'h06
`define STATE_ALU_EXEC         8'h07
`define STATE_MOV_STORE        8'h08
`define STATE_MOV_FETCH        8'h09
`define STATE_MOV_LOAD         8'h0a
`define STATE_FETCH_SP         8'h0c
`define STATE_PC_STORE         8'h0d
`define STATE_TMP_JUMP         8'h0e
`define STATE_RET              8'h0f
`define STATE_INC_SP           8'h10
`define STATE_SET_ADDR         8'h11
`define STATE_IN               8'h12
`define STATE_REG_STORE        8'h13
`define STATE_SET_REG          8'h14

`define ALU_ADD 3'b000
`define ALU_SUB 3'b001
`define ALU_INC 3'b010
`define ALU_DEC 3'b011
`define ALU_AND 3'b100
`define ALU_OR  3'b101
`define ALU_XOR 3'b110
`define ALU_ADC 3'b111

`define JMP_JMP 3'b000
`define JMP_JZ  3'b001
`define JMP_JNZ 3'b010
`define JMP_JC  3'b011
`define JMP_JNC 3'b100

`define REG_A 3'b000
`define REG_T 3'b111

`define T1 4'b0000
`define T2 4'b0001
`define T3 4'b0010
`define T4 4'b0011
`define T5 4'b0100
`define T6 4'b0101
`define T7 4'b0110
`define T8 4'b0111
