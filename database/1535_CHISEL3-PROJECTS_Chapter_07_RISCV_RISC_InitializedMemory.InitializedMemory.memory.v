// This program was cloned from: https://github.com/wilfredkisku/CHISEL3-PROJECTS
// License: The Unlicense

module BindsTo_0_InitializedMemory(
  input        clock,
  input        reset,
  input        io_writeEnable,
  input  [7:0] io_writeAddr,
  input  [7:0] io_writeData,
  input  [7:0] io_readAddr,
  input        io_readEnable,
  output [7:0] io_readData
);

  
initial begin
  $readmemh("/home/wilfred/IdeaProjects/RISC/loadHEX.txt", InitializedMemory.memory);
end
                      endmodule

bind InitializedMemory BindsTo_0_InitializedMemory BindsTo_0_InitializedMemory_Inst(.*);