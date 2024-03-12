`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/12 16:38:30
// Design Name: 
// Module Name: InstructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module InstructionMemory(
    input [31:0] IAddr,
    //input [31:0] IDataIn,
    //input RW,    // Ö¸Áî´æ´¢Æ÷¶ÁÐ´¿ØÖÆÐÅºÅ£¬Îª0Ð´£¬Îª1¶Á
    output [31:0] IDataOut
    );
    
    reg [7:0] ROM [0:95];
    
    initial begin
        $readmemb("E:/_Vivado/MIPS_CPU_Design/SingleCycleCPU/test_instructions.txt", ROM);
    end
    
    assign IDataOut[31:24] = ROM[IAddr+0];
    assign IDataOut[23:16] = ROM[IAddr+1];
    assign IDataOut[15:8]  = ROM[IAddr+2];
    assign IDataOut[7:0]   = ROM[IAddr+3];
//    always @(RW or Iaddr) begin
//        if(RW == 1) begin
//            IDataOut[31:24] <= ROM[Iaddr+0];
//            IDataOut[23:16] <= ROM[Iaddr+1];
//            IDataOut[15:8]  <= ROM[Iaddr+2];
//            IDataOut[7:0]   <= ROM[Iaddr+3];
//        end
//        else begin
//            ROM[Iaddr+0] <= IDataIn[31:24];
//            ROM[Iaddr+1] <= IDataIn[23:16];
//            ROM[Iaddr+2] <= IDataIn[15:8];
//            ROM[Iaddr+3] <= IDataIn[7:0];
//        end
//    end
    
endmodule
