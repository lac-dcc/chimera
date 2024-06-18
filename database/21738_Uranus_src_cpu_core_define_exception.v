// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

// exception entrance
`define INIT_PC             32'hbfc00000
`define EXC_BASE            32'hbfc00200
`define EXC_OFFSET          32'h00000180

// exception type segment position
`define EXC_TYPE_POS_INT    7:0
`define EXC_TYPE_POS_IF     0
`define EXC_TYPE_POS_RI     1
`define EXC_TYPE_POS_OV     2
`define EXC_TYPE_POS_TP     3
`define EXC_TYPE_POS_BP     4
`define EXC_TYPE_POS_SYS    5
`define EXC_TYPE_POS_ADE    6   // NOTE: can be removed
`define EXC_TYPE_POS_ERET   7

// exception type definitions
`define EXC_TYPE_NULL       8'h0
`define EXC_TYPE_INT        8'h1
`define EXC_TYPE_IF         8'h2
`define EXC_TYPE_RI         8'h3
`define EXC_TYPE_OV         8'h4
`define EXC_TYPE_TP         8'h5
`define EXC_TYPE_BP         8'h6
`define EXC_TYPE_SYS        8'h7
`define EXC_TYPE_ADEL       8'h8
`define EXC_TYPE_ADES       8'h9
`define EXC_TYPE_ERET       8'ha
