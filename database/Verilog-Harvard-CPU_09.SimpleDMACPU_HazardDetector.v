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
    output reg DataHazard
    );
    /*
    [Hazard Detector module]
    Purpose:
        Detect data hazards in the CPU, and send out the 'Stall' signal indicating whether to stall the pipeline.
        
    Inputs:
        The instruction currently in the ID stage
        Register write enable and write address of EX, MEM, and WB stage.
    
    Output: 
        DataHazard: asserted when data hazard is detected in ID stage
    */
    
    always @(*) begin
    
        // for instructions that require both rs and rt
        // first if statement checks instruction type
        // second if statement checks data dependency
        if ((inst[15:12]==`OPCODE_R && (inst[5:0]==`FUNC_ADD || inst[5:0]==`FUNC_SUB || inst[5:0]==`FUNC_AND || inst[5:0]==`FUNC_ORR)) || inst[15:12]==`OPCODE_SWD || inst[15:12]==`OPCODE_BNE || inst[15:12]==`OPCODE_BEQ) begin 
          
            if (((ID_EX_RFWriteAddress ==inst[11:10]) && ID_EX_RegWrite) || ((EX_MEM_RFWriteAddress==inst[11:10]) && EX_MEM_RegWrite) || ((MEM_WB_RFWriteAddress==inst[11:10]) && MEM_WB_RegWrite) 
             || ((ID_EX_RFWriteAddress ==inst[9:8])   && ID_EX_RegWrite) || ((EX_MEM_RFWriteAddress==inst[9:8])   && EX_MEM_RegWrite) || ((MEM_WB_RFWriteAddress==inst[9:8])   && MEM_WB_RegWrite)) begin
                DataHazard = 1;
            end // of if statement that checks data dependency of rs and rt
            else begin
                DataHazard = 0;
            end
        end // of if statement that checks if both rs and rt are required
        
        // for instructions that require only rs
        // first if statement checks instruction type
        // second if statement checks data dependency
        else if ((inst[15:12]==`OPCODE_R && (inst[5:0]==`FUNC_NOT || inst[5:0]==`FUNC_TCP || inst[5:0]==`FUNC_SHL || inst[5:0]==`FUNC_SHR || inst[5:0]==`FUNC_WWD || inst[5:0]==`FUNC_JPR || inst[5:0]==`FUNC_JRL))
          || inst[15:12]==`OPCODE_ADI || inst[15:12]==`OPCODE_ORI || inst[15:12]==`OPCODE_LWD || inst[15:12]==`OPCODE_BGZ || inst[15:12]==`OPCODE_BLZ) begin
          
            if  (((ID_EX_RFWriteAddress==inst[11:10]) && ID_EX_RegWrite) || ((EX_MEM_RFWriteAddress==inst[11:10]) && EX_MEM_RegWrite) || ((MEM_WB_RFWriteAddress==inst[11:10]) && MEM_WB_RegWrite)) begin
                DataHazard = 1;
            end // of if statement that checks data dependency of rs
            else begin
                DataHazard = 0;
            end
        end // of if statement that checks if rs is required
        
        else begin
            DataHazard = 0;
        end
        
    end // of always @(*)
    
endmodule
