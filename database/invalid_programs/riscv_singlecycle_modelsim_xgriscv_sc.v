// This program was cloned from: https://github.com/Crzax/riscv_singlecycle
// License: MIT License

`include "xgriscv_defines.v"
module xgriscv_sc(clk, reset, pcW);
  input             clk, reset;
  output [31:0]     pcW;
   
  wire [31:0] instr;
  wire [31:0] pc;
  wire        memwrite;
  wire [31:0] addr,writedata,readdata;

  xgriscv_cpu_480 U_cpu_480 (
    .clk(clk),
    .reset(reset),
    .instr(instr),
    .readdata(readdata),
    .memwrite(memwrite),
    .pc(pc),
    .addr(addr),
    .writedata(writedata),
    .pcW(pcW)
  );

  imem U_imem(pc, instr);
  
  dmem U_dmem(clk, memwrite, addr, writedata, pc, readdata);

endmodule
