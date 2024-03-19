`timescale 1ns/1ps
module PowerOfTwoMemory(
    input wire 	      clk,
		       
    input wire [31:0] InstAdd, // Address to fetch instruction from
    input wire [31:0] DataAdd, // Address to fetch data from
    input wire [31:0] MemDataContent,
		       
    input wire 	      DataReadEn, // Enables output from memory
    input wire 	      DataWriteEn, // Enables writing to memory at end of cur. cycle

    output reg [31:0] MemDataOut, // Data from memory
    output reg [31:0] MemInstOut); // Instruction from memory	
   
   reg [31:0] 	      mem [1023:0];
 	      
   initial begin
       mem[0] = 32'h77FF0008;
       mem[1] = 32'h77FF0001;
       mem[2] = 32'h77FF0001;
       mem[3] = 32'h77FF0005;
       mem[4] = 32'hD33A0001;
       mem[5] = 32'h7BF90001;
       mem[6] = 32'h77FF0002;
       mem[7] = 32'h671F03F7;
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
	   mem[DataAdd] = MemDataContent;
	end
   end
   
   always @(DataAdd, InstAdd) begin
       //#2
       MemInstOut = mem[InstAdd];
       MemDataOut = mem[DataAdd];
   end
endmodule // BasicTestMemory

