// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

// segment position

// opcode
`define SEG_OPCODE   31:26

// coprocessor
`define SEG_CP0      25:21
`define SEG_EMPTY    10:3
`define SEG_SEL      2:0

// register segment
`define SEG_RS       25:21
`define SEG_RT       20:16
`define SEG_RD       15:11

// reg-imm
`define SEG_REGIMM   20:16

// immediate or offset
`define SEG_IMM      15:0
`define SEG_OFFSET   15:0

// shamt
`define SEG_SHAMT    10:6

// funct
`define SEG_FUNCT    5:0
