// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: 2-bit saturation branch predictor
// Project Name: Computer organization Project 6
//////////////////////////////////////////////////////////////////////////////////

`define WORD_SIZE 16    // data and address word size
`define IDX_SIZE 8
`define BTB_SIZE 256

module TwoBitSaturationPredictor (
    input clk,
    input reset_n,
    input [`WORD_SIZE-1:0] PC,
    input JumpResolved, BranchResolved, BranchTaken,
    input [`WORD_SIZE-1:0] ResolvedJumpPC, ResolvedBranchPC,
    input [`WORD_SIZE-1:0] ActualJumpTarget, ActualBranchTarget,
    output [`WORD_SIZE-1:0] Prediction
    );
    /*
    [Two Bit Saturation branch predictor module]
    Functionality:
        8 bit tag
        8 bit BTB index
        2 bit BHT saturation counter
        Only branch and jump instructions are stored in the BTB.
    
    Inputs:
        PC                : Address of the current instruction. We should predict its outcome.
        BranchTaken       : Whether the resolved branch was taken
        ResolvedJumpPC    : address of the jump instruction resolved this cycle (ID stage)
        ResolvedBranchPC  : address of the branch instruction resolved this cycle (EX stage)
        ActualJumpTarget  : The actual destination of the jump instruction resolved this cycle.
        ActualBranchTarget: The actual destination of the branch instruction resolved this cycle.
        
    Outputs:
        Prediction  : Predicted nextPC of the current instruction.
    */
    
    integer i;
    reg [`WORD_SIZE-1:0] BTB [`BTB_SIZE-1:0];
    reg [7:0] TagTable [`BTB_SIZE-1:0];
    reg [1:0] Counter [`BTB_SIZE-1:0];
    wire PredictTaken;
    
    // Store the last two prediction history
    reg [1:0] PredictionHistory;
    
    always @(posedge clk) begin
        if (!reset_n) begin     // Synchronous active-low reset
            for (i=0; i<`BTB_SIZE; i=i+1) begin
                BTB[i] <= 0;
                TagTable[i] <= 8'hff;
                Counter[i] <= 1;
            end
            PredictionHistory <= 2'b00;
        end else begin  // Prediction history shift register
            PredictionHistory <= { PredictionHistory[1], PredictTaken };
        end
    end
    
    // Branch prediction logic
    assign PredictTaken = (TagTable[PC[`IDX_SIZE-1:0]] == PC[`WORD_SIZE-1:`IDX_SIZE]) && (Counter[PC[`IDX_SIZE-1:0]] >= 2);
    assign Prediction = PredictTaken ? BTB[PC[`IDX_SIZE-1:0]] : PC+1;
    
    // Updating predictor based on the actual outcome of control instructions
    always @(negedge clk) begin
        if (BranchResolved) begin   // In EX stage
            if (BranchTaken) begin  // Branch taken
                if (Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] != 3) begin
                    Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] <= Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] + 1;
                end
            end else begin          // Branch not taken
                if (Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] != 0) begin
                    Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] <= Counter[ResolvedBranchPC[`IDX_SIZE-1:0]] - 1;
                end
            end
            
            TagTable[ResolvedBranchPC[`IDX_SIZE-1:0]] <= ResolvedBranchPC[`WORD_SIZE-1:`IDX_SIZE];
            BTB[ResolvedBranchPC[`IDX_SIZE-1:0]] <= ActualBranchTarget;
        end
        if (JumpResolved) begin
        // If there was a branch resolution in the EX stage, its prediction should have been correct to ensure the execution of the jump in the ID stage.
        // Or else, no branch resolution in the EX stage.
            if ((BranchResolved && (BranchTaken == PredictionHistory[1])) || !BranchResolved) begin    
                if (Counter[ResolvedJumpPC[`IDX_SIZE-1:0]] != 3) begin
                    Counter[ResolvedJumpPC[`IDX_SIZE-1:0]] <= Counter[ResolvedJumpPC[`IDX_SIZE-1:0]] + 1;
                end
                
                TagTable[ResolvedJumpPC[`IDX_SIZE-1:0]] <= ResolvedJumpPC[`WORD_SIZE-1:`IDX_SIZE];
                BTB[ResolvedJumpPC[`IDX_SIZE-1:0]] <= ActualJumpTarget;
            end
        end
    end
    
endmodule