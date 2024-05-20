// This program was cloned from: https://github.com/AuraGuardian23/riscv_pipelined_processor
// License: MIT License

`timescale 1ns / 1ps

module hazard_unit(
    input clk,
    input wire [4:0] IF_ID_RS1, IF_ID_RS2, ID_EX_RD,
    input wire ID_EX_MemRead,
    output wire PCWrite, IF_ID_Write,
    output wire MuxSignal
    );
    
//    initial
//    begin
//        MuxSignal <= 1;
//        PCWrite <= 1;
//        IF_ID_Write <= 1;
//    end
    
    assign MuxSignal = ~(ID_EX_MemRead & ((ID_EX_RD == IF_ID_RS1) || (ID_EX_RD == IF_ID_RS2)));
    assign PCWrite = ~(ID_EX_MemRead & ((ID_EX_RD == IF_ID_RS1) || (ID_EX_RD == IF_ID_RS2)));
    assign IF_ID_Write = ~(ID_EX_MemRead & ((ID_EX_RD == IF_ID_RS1) || (ID_EX_RD == IF_ID_RS2)));

//    always @ (posedge clk)
//    begin
//        if (ID_EX_MemRead & ((ID_EX_RD == IF_ID_RS1) || (ID_EX_RD == IF_ID_RS2)))
//            begin
//                MuxSignal <= 0;
//                PCWrite <= 0;
//                IF_ID_Write <= 0;
//            end
//        else
//            begin
//                MuxSignal <= 1;
//                PCWrite <= 1;
//                IF_ID_Write <= 1;
//            end
//    end
endmodule