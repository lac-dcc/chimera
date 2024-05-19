// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Organization: SNUECE
// Student: Jaewon Chung
// 
// Module Name: Tournament branch predictor
// Project Name: Computer organization Project 6
//////////////////////////////////////////////////////////////////////////////////

`define WORD_SIZE 16    // data and address word size

module TournamentPredictor (
    input clk,
    input reset_n,
    input IsControl,
    input [`WORD_SIZE-1:0] PC,
    input JumpResolved, BranchResolved, BranchTaken,
    input [`WORD_SIZE-1:0] ResolvedJumpPC, ResolvedBranchPC,
    input [`WORD_SIZE-1:0] ActualJumpTarget, ActualBranchTarget,
    output [`WORD_SIZE-1:0] Prediction
    );
    /*
    [Tournament branch predictor module]
    Functionality:
        8 bit tag
        8 bit BTB index
        
        PC[7:0] -> 256 x 8 Local History Table -> 256 x 2 Local Predictor (saturation counter)
        
        12 bit Global History Shift Register: Caches the prediction/outcome results of ten most recent branch/jump instructions
        GHSR[9:0] -> 1024 x 2 Global Predictor (saturation counter)
        GHSR[9:0] -> 1024 x 2 Choice Predictor (saturation counter) 
    
    Inputs:
        IsControl         : Whether the currnet instruction is a jump or branch instruction. (Predecode)
        PC                : Address of the current instruction. We should predict its outcome.
        BranchTaken       : Whether the resolved branch was taken
        ResolvedJumpPC    : address of the jump instruction resolved this cycle (ID stage)
        ResolvedBranchPC  : address of the branch instruction resolved this cycle (EX stage)
        ActualJumpTarget  : The actual destination of the jump instruction resolved this cycle.
        ActualBranchTarget: The actual destination of the branch instruction resolved this cycle.
        
    Outputs:
        Prediction  : Predicted nextPC of the current instruction.
    */
    
    // For initialization for loop
    integer i, j;
    
    // BTB and Tag Table
    reg [`WORD_SIZE-1:0] BTB [255:0];
    reg [7:0] TagTable [255:0];
    
    // SAg Local Predictor
    reg [7:0] LHT [255:0];
    reg [1:0] LP [255:0];
    
    // Global History Shift Register
    reg [11:0] GHSR;
    
    // GAg Global Predictor
    reg [1:0] GP [1023:0];
    
    // GAg Choice Predictor
    reg [1:0] CP [1023:0];
    
    // Asserted when predict taken
    wire GlobalPredictTaken, LocalPredictTaken, ChosenPredictTaken, PredictTaken;
    
    // Internal book keeping. Used to update the predictor when the actual outcome of control instructions are determined.
    reg [1:0] LocalPredictionHistory, ChoicePredictionHistory;
    
    always @(posedge clk) begin
        if (!reset_n) begin     // Synchronous active-low reset
            for (i=0; i<256; i=i+1) begin
                BTB[i] <= 0;
                TagTable[i] <= 8'hff;
                LHT[i] <= 0;
                LP[i] <= 1; // 2 bit saturations counters are initialized to 1, i.e. not taken.
            end
            for (j=0; j<1024; j=j+1) begin
                GP[j] <= 1;
                CP[j] <= 1;
            end
            GHSR <= 0;
            LocalPredictionHistory <= 0;
            ChoicePredictionHistory <= 0;
        end else begin
            if (IsControl) GHSR <= {GHSR[10:0], PredictTaken};
            LocalPredictionHistory <= {LocalPredictionHistory[0], LocalPredictTaken};
            ChoicePredictionHistory <= {ChoicePredictionHistory[0], ChosenPredictTaken};
        end
    end
    
    // Branch prediction logic
    assign GlobalPredictTaken = (GP[GHSR[9:0]] >= 2);
    assign LocalPredictTaken = (LP[LHT[PC[7:0]]] >= 2);
    assign ChosenPredictTaken = (CP[GHSR[9:0]] >= 2 ? GlobalPredictTaken : LocalPredictTaken);
    assign PredictTaken = (TagTable[PC[7:0]] == PC[15:8]) && ChosenPredictTaken;
    assign Prediction = PredictTaken ? BTB[PC[7:0]] : PC+1;
    
    // Updating predictor based on the actual outcome of control instructions
    always @(negedge clk) begin
        if (BranchResolved && JumpResolved) begin   // GHSR[1] = Branch Prediction, GHSR[0] = Jump Prediction
            if (BranchTaken) begin  // Branch taken
                // Update local predictor counter
                if (LP[LHT[ResolvedBranchPC[7:0]]] != 3) begin
                    LP[LHT[ResolvedBranchPC[7:0]]] <= LP[LHT[ResolvedBranchPC[7:0]]] + 1;
                end
                // Update global predictor counter
                if (GP[GHSR[11:2]] != 3) begin
                    GP[GHSR[11:2]] <= GP[GHSR[11:2]] + 1;
                end
            end else begin  // Branch not taken
                // Update local predictor counter
                if (LP[LHT[ResolvedBranchPC[7:0]]] != 0) begin
                    LP[LHT[ResolvedBranchPC[7:0]]] <= LP[LHT[ResolvedBranchPC[7:0]]] - 1;
                end
                // Update global predictor counter
                if (GP[GHSR[11:2]] != 0) begin
                    GP[GHSR[11:2]] <= GP[GHSR[11:2]] - 1;
                end
            end
            
            // Update choice predictor counter
            if (ChoicePredictionHistory[1] == GHSR[1]) begin                                    // Global predictor was chosen
                if (GHSR[1] != BranchTaken && LocalPredictionHistory[1] == BranchTaken) begin   // Global was wrong, local was right
                    if (CP[GHSR[11:2]] != 0) CP[GHSR[11:2]] <= CP[GHSR[11:2]] - 1;              // Decrement choice predictor counter
                end
            end else if (ChoicePredictionHistory[1] == LocalPredictionHistory[1]) begin         // Local predictor was chosen
                if (LocalPredictionHistory[1] != BranchTaken && GHSR[1] == BranchTaken) begin   // Local was wrong, global was right
                    if (CP[GHSR[11:2]] != 3) CP[GHSR[11:2]] <= CP[GHSR[11:2]] + 1;              // Increment choice predictor counter
                end
            end
            
            // Update local history table
            LHT[ResolvedBranchPC[7:0]] <= { LHT[ResolvedBranchPC[7:0]][6:0], BranchTaken};
            
            // Update Tag Table and BTB
            TagTable[ResolvedBranchPC[7:0]] <= ResolvedBranchPC[15:8];
            BTB[ResolvedBranchPC[7:0]] <= ActualBranchTarget;
            
            // Update Global History Shift Register
            GHSR[1] <= BranchTaken;
            
            if (BranchTaken == GHSR[1]) begin   // Update predictors with jump resolution information only if branch prediction was right, 
                // Update local predictor counter
                if (LP[LHT[ResolvedJumpPC[7:0]]] != 3) begin
                    LP[LHT[ResolvedJumpPC[7:0]]] <= LP[LHT[ResolvedJumpPC[7:0]]] + 1;
                end
                // Update global predictor counter
                if (GP[GHSR[10:1]] != 3) begin
                    GP[GHSR[10:1]] <= GP[GHSR[10:1]] + 1;
                end
                // Update choice predictor counter
                if (CP[GHSR[10:1]] != 3) begin
                    CP[GHSR[10:1]] <= CP[GHSR[10:1]] + 1;
                end
                
                // Update choice predictor counter
                if (ChoicePredictionHistory[0] == GHSR[0]) begin                                    // Global predictor was chosen
                    if (GHSR[0] != BranchTaken && LocalPredictionHistory[0] == BranchTaken) begin   // Global was wrong, local was right
                        if (CP[GHSR[10:1]] != 0) CP[GHSR[10:1]] <= CP[GHSR[10:1]] - 1;              // Decrement choice predictor counter
                    end
                end else if (ChoicePredictionHistory[0] == LocalPredictionHistory[0]) begin         // Local predictor was chosen
                    if (LocalPredictionHistory[0] != BranchTaken && GHSR[0] == BranchTaken) begin   // Local was wrong, global was right
                        if (CP[GHSR[10:1]] != 3) CP[GHSR[10:1]] <= CP[GHSR[10:1]] + 1;              // Increment choice predictor counter
                    end
                end
                
                // Update local history table
                LHT[ResolvedJumpPC[7:0]] <= { LHT[ResolvedJumpPC[7:0]][6:0], 1'b1};
                
                // Update Tag Table and BTB
                TagTable[ResolvedJumpPC[7:0]] <= ResolvedJumpPC[15:8];
                BTB[ResolvedJumpPC[7:0]] <= ActualJumpTarget;
                
                // Update Global History Shift Register
                GHSR[0] <= 1'b1;
            end // of if (Branch prediction was right)
            
        end // of if (BranchResolved && JumpResolved)
        
        else if (BranchResolved && !JumpResolved) begin  // This branch was the most recently predicted control instruction. Thus GHSR[0] = Branch Prediction.
            if (BranchTaken) begin  // Branch taken
                // Update local predictor counter
                if (LP[LHT[ResolvedBranchPC[7:0]]] != 3) begin
                    LP[LHT[ResolvedBranchPC[7:0]]] <= LP[LHT[ResolvedBranchPC[7:0]]] + 1;
                end
                // Update global predictor counter
                if (GP[GHSR[10:1]] != 3) begin
                    GP[GHSR[10:1]] <= GP[GHSR[10:1]] + 1;
                end
            end else begin          // Branch not taken
                // Update local predictor counter
                if (LP[LHT[ResolvedBranchPC[7:0]]] != 0) begin
                    LP[LHT[ResolvedBranchPC[7:0]]] <= LP[LHT[ResolvedBranchPC[7:0]]] - 1;
                end
                // Update global predictor counter
                if (GP[GHSR[10:1]] != 0) begin
                    GP[GHSR[10:1]] <= GP[GHSR[10:1]] - 1;
                end
            end
            
            // Update choice predictor counter
            if (ChoicePredictionHistory[1] == GHSR[1]) begin                                    // Global predictor was chosen
                if (GHSR[1] != BranchTaken && LocalPredictionHistory[1] == BranchTaken) begin   // Global was wrong, local was right
                    if (CP[GHSR[11:2]] != 0) CP[GHSR[11:2]] <= CP[GHSR[11:2]] - 1;              // Decrement choice predictor counter
                end
            end else if (ChoicePredictionHistory[1] == LocalPredictionHistory[1]) begin         // Local predictor was chosen
                if (LocalPredictionHistory[1] != BranchTaken && GHSR[1] == BranchTaken) begin   // Local was wrong, global was right
                    if (CP[GHSR[11:2]] != 3) CP[GHSR[11:2]] <= CP[GHSR[11:2]] + 1;              // Increment choice predictor counter
                end
            end
            
            // Update local history table
            LHT[ResolvedBranchPC[7:0]] <= { LHT[ResolvedBranchPC[7:0]][6:0], BranchTaken};
            
            // Update Tag Table and BTB
            TagTable[ResolvedBranchPC[7:0]] <= ResolvedBranchPC[15:8];
            BTB[ResolvedBranchPC[7:0]] <= ActualBranchTarget;
            
            // Update Global History Shift Register
            GHSR[1] <= BranchTaken;
        end // of if (BranchResolved)
        
        else if (JumpResolved && !BranchResolved) begin // This jump was the most recently predicted control instruction. Thus GHSR[0] = Jump Prediction.
            // Update local predictor counter
            if (LP[LHT[ResolvedJumpPC[7:0]]] != 3) begin
                LP[LHT[ResolvedJumpPC[7:0]]] <= LP[LHT[ResolvedJumpPC[7:0]]] + 1;
            end
            // Update global predictor counter
            if (GP[GHSR[10:1]] != 3) begin
                GP[GHSR[10:1]] <= GP[GHSR[10:1]] + 1;
            end
            // Update choice predictor counter
            if (CP[GHSR[10:1]] != 3) begin
                CP[GHSR[10:1]] <= CP[GHSR[10:1]] + 1;
            end
            
            // Update choice predictor counter
            if (ChoicePredictionHistory[0] == GHSR[0]) begin                                    // Global predictor was chosen
                if (GHSR[0] != BranchTaken && LocalPredictionHistory[0] == BranchTaken) begin   // Global was wrong, local was right
                    if (CP[GHSR[10:1]] != 0) CP[GHSR[10:1]] <= CP[GHSR[10:1]] - 1;              // Decrement choice predictor counter
                end
            end else if (ChoicePredictionHistory[0] == LocalPredictionHistory[0]) begin         // Local predictor was chosen
                if (LocalPredictionHistory[0] != BranchTaken && GHSR[0] == BranchTaken) begin   // Local was wrong, global was right
                    if (CP[GHSR[10:1]] != 3) CP[GHSR[10:1]] <= CP[GHSR[10:1]] + 1;              // Increment choice predictor counter
                end
            end
            
            // Update local history table
            LHT[ResolvedJumpPC[7:0]] <= { LHT[ResolvedJumpPC[7:0]][6:0], 1'b1};
            
            // Update Tag Table and BTB
            TagTable[ResolvedJumpPC[7:0]] <= ResolvedJumpPC[15:8];
            BTB[ResolvedJumpPC[7:0]] <= ActualJumpTarget;
            
            // Update Global History Shift Register
            GHSR[0] <= 1'b1;
        end // of if (JumpResolved)
    end
    
endmodule