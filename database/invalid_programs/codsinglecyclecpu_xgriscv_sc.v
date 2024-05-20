// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

`include "xgriscv_defines.v"
module xgriscv_sc(clk, reset, pcW);
  input             clk, reset;
  output [31:0]     pcW;
  
  wire [31:0] instr;
  wire [31:0] pc;
  wire        memwrite;
  wire [31:0] addr,writedata,readdata;
  //实例化CPU
  CPU U_cpu (
    .clk(clk),
    .rstn(reset),
    .instr(instr),
    .read_data(readdata),
    .memwrite(memwrite),
    .pc(pc),
    .addr(addr),
    .write_data(writedata),
    .pcW(pcW)
  );

  imem U_imem(pc, instr);

  dmem U_dmem(clk, memwrite, addr, writedata, pc, readdata);
  
  
endmodule
