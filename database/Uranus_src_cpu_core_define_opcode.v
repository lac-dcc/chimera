// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

// r-type (SPECIAL)
`define OP_SPECIAL    6'b000000

// reg-imm
`define OP_REGIMM     6'b000001

// j-type
`define OP_J          6'b000010
`define OP_JAL        6'b000011

// branch
`define OP_BEQ        6'b000100
`define OP_BNE        6'b000101
`define OP_BLEZ       6'b000110
`define OP_BGTZ       6'b000111

// arithmetic
`define OP_ADDI       6'b001000
`define OP_ADDIU      6'b001001

// comparison
`define OP_SLTI       6'b001010
`define OP_SLTIU      6'b001011

// logic
`define OP_ANDI       6'b001100
`define OP_ORI        6'b001101
`define OP_XORI       6'b001110

// immediate
`define OP_LUI        6'b001111

// coprocessor
`define OP_CP0        6'b010000

// r-type (SPECIAL2, unused)
`define OP_SPECIAL2   6'b011100

// memory accessing
`define OP_LB         6'b100000
`define OP_LH         6'b100001
`define OP_LW         6'b100011
`define OP_LBU        6'b100100
`define OP_LHU        6'b100101
`define OP_SB         6'b101000
`define OP_SH         6'b101001
`define OP_SW         6'b101011
