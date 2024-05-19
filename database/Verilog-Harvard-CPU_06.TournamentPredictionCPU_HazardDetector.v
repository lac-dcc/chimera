// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: Data Hazard Detector
// Project Name: Computer organization Project 6
//////////////////////////////////////////////////////////////////////////////////

`include "opcodes.v"

module HazardDetector(
    input [15:0] inst,
    input [1:0] ID_EX_RFWriteAddress, EX_MEM_RFWriteAddress, MEM_WB_RFWriteAddress,
    input ID_EX_RegWrite, EX_MEM_RegWrite, MEM_WB_RegWrite,
    input ID_EX_IsLWD,
    output reg Stall,
    output reg [1:0] Forward_Rs, Forward_Rt
    );
    /*
    [Hazard Detector module]
    Purpose:
        Detects data hazards in the CPU, and indicates whether the CPU should stall the pipeline or forward data.
        
    Inputs:
        The instruction currently in the ID stage
        Register write enable and write address of EX, MEM, and WB stage.
        Whether the instruction in the EX stage is LWD
    
    Output: 
        Stall: stall pipeline(1) or proceed without stalling(0)
        Forward_Rx: no forwarding(00), from EX(01), from MEM(10), from WB(11)
    */
    
    always @(*) begin
    
        // for instructions that require both rs and rt
        if ((inst[15:12]==`OPCODE_R && (inst[5:0]==`FUNC_ADD || inst[5:0]==`FUNC_SUB || inst[5:0]==`FUNC_AND || inst[5:0]==`FUNC_ORR)) || inst[15:12]==`OPCODE_SWD || inst[15:12]==`OPCODE_BNE || inst[15:12]==`OPCODE_BEQ) begin 
            
            // Check if Rs can be forwarded
            if ((ID_EX_RFWriteAddress ==inst[11:10]) && ID_EX_RegWrite) begin   // instruction in EX writes to Rs
                if (ID_EX_IsLWD) begin  // LWD produces data in MEM stage. Data in EX stage shouldn't be forwarded.
                    Stall = 1;
                    Forward_Rs = 0;
                end else begin
                    Stall = 0;
                    Forward_Rs = 1;
                end
            end else if ((EX_MEM_RFWriteAddress==inst[11:10]) && EX_MEM_RegWrite) begin // instruction in MEM writes to Rs
                Stall = 0;
                Forward_Rs = 2;
            end else if ((MEM_WB_RFWriteAddress==inst[11:10]) && MEM_WB_RegWrite) begin // instruction in WB writes to Rs
                Stall = 0;
                Forward_Rs = 3;
            end else begin
                Stall = 0;
                Forward_Rs = 0;
            end // of Rs forward check
            
            // Check if Rt can be forwarded
            if ((ID_EX_RFWriteAddress ==inst[9:8]) && ID_EX_RegWrite) begin   // instruction in EX writes to Rt
                if (ID_EX_IsLWD) begin  // LWD produces data in MEM stage. Data in EX stage shouldn't be forwarded.
                    Stall = 1;
                    Forward_Rt = 0;
                end else begin
                    Stall = 0;
                    Forward_Rt = 1;
                end
            end else if ((EX_MEM_RFWriteAddress==inst[9:8]) && EX_MEM_RegWrite) begin // instruction in MEM writes to Rt
                Stall = 0;
                Forward_Rt = 2;
            end else if ((MEM_WB_RFWriteAddress==inst[9:8]) && MEM_WB_RegWrite) begin // instruction in WB writes to Rt
                Stall = 0;
                Forward_Rt = 3;
            end else begin
                Stall = 0;
                Forward_Rt = 0;
            end // of Rt forward check
            
        end // of if statement for instructions that require both rs and rt
        
        // for instructions that require only rs\
        else if ((inst[15:12]==`OPCODE_R && (inst[5:0]==`FUNC_NOT || inst[5:0]==`FUNC_TCP || inst[5:0]==`FUNC_SHL || inst[5:0]==`FUNC_SHR || inst[5:0]==`FUNC_WWD || inst[5:0]==`FUNC_JPR || inst[5:0]==`FUNC_JRL))
          || inst[15:12]==`OPCODE_ADI || inst[15:12]==`OPCODE_ORI || inst[15:12]==`OPCODE_LWD || inst[15:12]==`OPCODE_BGZ || inst[15:12]==`OPCODE_BLZ) begin
          
            // Check if Rs can be forwarded
            if ((ID_EX_RFWriteAddress ==inst[11:10]) && ID_EX_RegWrite) begin   // instruction in EX writes to Rs
                if (ID_EX_IsLWD) begin  // LWD produces data in MEM stage. Data in EX stage shouldn't be forwarded.
                    Stall = 1;
                    Forward_Rs = 0;
                end else begin
                    Stall = 0;
                    Forward_Rs = 1;
                end
            end else if ((EX_MEM_RFWriteAddress==inst[11:10]) && EX_MEM_RegWrite) begin // instruction in MEM writes to Rs
                Stall = 0;
                Forward_Rs = 2;
            end else if ((MEM_WB_RFWriteAddress==inst[11:10]) && MEM_WB_RegWrite) begin // instruction in WB writes to Rs
                Stall = 0;
                Forward_Rs = 3;
            end else begin
                Stall = 0;
                Forward_Rs = 0;
            end // of Rs forward check
            
        end // of if statement for instructions that require only rs
        
        // No dependency, no stall, and no forwarding
        else begin
            Stall = 0;
            Forward_Rs = 0;
            Forward_Rt = 0;
        end
        
     end // of always @(*)
    
endmodule
