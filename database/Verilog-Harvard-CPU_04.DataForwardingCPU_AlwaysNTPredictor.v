// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: Always not-taken predictor
// Project Name: Computer organization Project 6
//////////////////////////////////////////////////////////////////////////////////

`define WORD_SIZE 16    // data and address word size


module AlwaysNTPredictor (
    input [`WORD_SIZE-1:0] PC,
    input Correct,
    input [`WORD_SIZE-1:0] ActualBranchTarget,
    output [`WORD_SIZE-1:0] Prediction
    );
    /*
    [Always not-taken branch predictor module]
    Purpose:
        A placeholder(or framework) for future possibility of implementing a better branch predictor.
        Always predicts PC+1 for any jump or branch instruction.
    */
    
    assign Prediction = PC + 1;
    
endmodule