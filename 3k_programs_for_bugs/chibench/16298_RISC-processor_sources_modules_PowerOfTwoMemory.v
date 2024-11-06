// This program was cloned from: https://github.com/suyashmahar/RISC-processor
// License: MIT License

`timescale 1ns/1ps
module PowerOfTwoMemory
  #(
    parameter DisplayBufferSize = 256
    )(
      input wire 			clk,
  
      input wire [31:0] 		InstAdd, // Address to fetch instruction from
      input wire [31:0] 		DataAdd, // Address to fetch data from
      input wire [31:0] 		MemDataContent,
  
      input wire 			DataReadEn, // Enables output from memory
      input wire 			DataWriteEn, // Enables writing to memory at end of cur. cycle

      input wire 			MEMTYPE, // Enables writing to memory at end of cur. cycle
  
      output reg [31:0] 		MemDataOut, // Data from memory
      output reg [31:0] 		MemInstOut, // Instruction from memory	
      output wire [DisplayBufferSize-1:0] DisplayBuffer
      );
   
   reg [31:0] 				mem [1023:0];
   reg [7:0] 				dispMem [DisplayBufferSize/8:0];

   genvar i;
   generate
       for (i = 0; i < DisplayBufferSize/8; i = i + 1) begin
	   assign DisplayBuffer[(i+1)*8 - 1 : i*8] = dispMem[DisplayBufferSize/8-i-1][7:0];
       end
   endgenerate

   initial begin
       mem[0] = 32'h77FF0008;
       mem[1] = 32'h77FF0001;
       mem[2] = 32'h77FF0001;
       mem[3] = 32'h77FF0005;
       mem[4] = 32'hD33A0001;
       mem[5] = 32'h7BF90001;
       mem[6] = 32'h77FF0002;
       mem[7] = 32'h031F0000;
       mem[8] = 32'h6FFE0000;
       mem[9] = 32'hc31f0001;
       mem[10] = 32'hC35F0001;
       mem[11] = 32'h8318C000;
       mem[12] = 32'h77DFFFF7;
       mem[13] = 32'h7BF8FFFD;
       mem[14] = 32'hC31F0001;
       mem[15] = 32'h00000000;
   end
   
   always @(posedge clk) begin
       //#1
       if (DataWriteEn) begin
            if (MEMTYPE) begin
                dispMem[DataAdd] = MemDataContent;

            end else begin
                mem[DataAdd/4] = MemDataContent;
            
            end
       end
   end
   
   always @(mem, DataAdd, InstAdd, MEMTYPE) begin
       //#2
       MemInstOut = mem[InstAdd/4];

       if (MEMTYPE) begin
        MemDataOut = dispMem[DataAdd];       
       end else begin
        MemDataOut = mem[DataAdd/4];
       end
   end
endmodule // BasicTestMemory

