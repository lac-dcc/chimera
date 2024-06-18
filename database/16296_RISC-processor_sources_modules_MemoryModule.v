// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns / 1ps

module MemoryModule (
    input wire 	      clk,
    
    input wire [31:0] InstAdd, // Address to fetch instruction from
    input wire [31:0] DataAdd, // Address to fetch data from
    input wire [31:0] MemDataContent,
  
    input wire 	      DataReadEn, // Enables output from memory
    input wire 	      DataWriteEn, // Enables writing to memory at end of cur. cycle

    output wire [31:0] MemDataOut, // Data from memory
    output wire [31:0] MemInstOut // Instruction from memory		   
);

   reg [31:0] 	       mem [8192:0]; // 32 KiB memory

   initial begin
      
   end

   always @(posedge clk) begin
      if (DataWriteEn & !DataReadEn) begin
	 mem[DataAdd] = MemDataContent;
      end
   end
   
   assign MemInstOut = mem[InstAdd];
   assign MemDataOut = mem[DataAdd];
      
endmodule // MemoryModule
