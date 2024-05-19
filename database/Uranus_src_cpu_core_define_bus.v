// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

// address bus
`define ADDR_BUS                31:0
`define ADDR_BUS_WIDTH          32

// instruction bus
`define INST_BUS                31:0
`define INST_BUS_WIDTH          32

// data bus
`define DATA_BUS                31:0
`define DATA_BUS_WIDTH          32

// double size data bus
`define DOUBLE_DATA_BUS         63:0
`define DOUBLE_DATA_BUS_WIDTH   64

// half size data bus
`define HALF_DATA_BUS           15:0
`define HALF_DATA_BUS_WIDTH     16

// coprocessor address bus
`define CP0_ADDR_BUS            7:0
`define CP0_ADDR_BUS_WIDTH      8

// register bus
`define REG_ADDR_BUS            4:0
`define REG_ADDR_BUS_WIDTH      5

// instruction information bus
`define INST_OP_BUS             5:0
`define INST_OP_BUS_WIDTH       6
`define FUNCT_BUS               5:0
`define FUNCT_BUS_WIDTH         6
`define SHAMT_BUS               4:0
`define SHAMT_BUS_WIDTH         5

// stall signal bus
`define STALL_BUS               5:0
`define STALL_BUS_WIDTH         6

// exception type bus
`define EXC_TYPE_BUS            7:0
`define EXC_TYPE_BUS_WIDTH      8
