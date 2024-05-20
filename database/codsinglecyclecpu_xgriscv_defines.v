// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

// Width
`define RFIDX_WIDTH 5  // 寄存器索引宽度
`define XLEN 32        // 数据总线宽度
`define RFREG_NUM 32   // 寄存器数量
`define ADDR_SIZE 32   // 地址总线宽度
`define INSTR_SIZE 32  // 指令总线宽度
`define IMEM_SIZE 1024 // 指令内存大小
`define DATA_SIZE 1024 // 数据内存大小