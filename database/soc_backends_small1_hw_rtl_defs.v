`define ENABLE_IMUL

// Memory mapping is managed by the bus configuration
// Address 0x20000 contains 16-entry IRQ handlers table
// Address 0x20100 contains an entry point to be executed on reset
// 0x0 - RAM_DEPTH is mapped to stack
// 0x10000 - 0x20000 is for devices
//
//   0x10000 - DEBUG PRINT (simulation only)
//
//   0x10001 - UART FIFO IN
//   0x10002 - UART FIFO NOT EMPTY
//   0x10003 - UART ACKNOWLEDGE
//   0x10004 - UART FIFO OUT
//   0x10005 - UART FIFO OUT FULL
//   0x10111 - HALT (simulation only)


//

`ifdef FPGA
 `define SYNCSTACK 1
`endif

`ifndef SYNCSTACK
 `define RAM_DEPTH 512*4
`endif

`ifdef SYNCSTACK
 `define RAM_DEPTH 512*4
`endif



`define DEBUG_REG_PC 0
`define DEBUG_REG_SP 1
`define DEBUG_REG_LAST_BRANCH 2
`define DEBUG_REG_LAST_PUSH 3
`define DEBUG_REG_LAST_POP1 4
`define DEBUG_REG_LAST_POP2 5
`define DEBUG_REG_LAST_INSTR 6


