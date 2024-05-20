// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module controller(
    input       clk,
    input       rst,
    input[3:0]  opcode,
    output reg[13:0] out
    );

    localparam SIG_HLT       = 11;
    localparam SIG_PC_INC    = 10;
    localparam SIG_PC_EN     = 9;
    localparam SIG_MEM_LOAD  = 8;
    localparam SIG_MEM_EN    = 7;
    localparam SIG_IR_LOAD   = 6;
    localparam SIG_IR_EN     = 5;
    localparam SIG_A_LOAD    = 4;
    localparam SIG_A_EN      = 3;
    localparam SIG_B_LOAD    = 2;
    localparam SIG_ADDER_SUB = 1;
    localparam SIG_ADDER_EN  = 0;
    
    // New signals for MUL and DIV operations
    localparam SIG_MULTIPLIER_EN = 12; // New signal for multiplier enable
    localparam SIG_DIVIDER_EN    = 13; // New signal for divider enable
    
    localparam OP_LDA = 4'b0000;
    localparam OP_ADD = 4'b0001;
    localparam OP_SUB = 4'b0010;
    localparam OP_MUL = 4'b0011; // New operation code for MUL
    localparam OP_DIV = 4'b0100; // New operation code for DIV
    localparam OP_HLT = 4'b1111;
    
    reg [2:0]  stage;
    reg [13:0] control_word; // Adjusted size to accommodate new signals
    
    always @(posedge clk) begin
        // Reset condition
        if (rst) begin
            stage <= 0;
            control_word <= 14'b0; // Adjusted size
        end else begin
            // Stage transition logic
            if (stage == 5) begin
                stage <= 0;
                control_word <= 14'b0; // Reset control_word at the end of each cycle
            end else begin
                stage <= stage + 1;
            end
            
            // Default to no operation
            control_word <= 14'b0; // Ensure control_word is reset at each cycle start
            
            case (stage)
                0: begin
                    control_word[SIG_PC_EN] <= 1;
                    control_word[SIG_MEM_LOAD] <= 1;
                end
                1: begin
                    control_word[SIG_PC_INC] <= 1;
                end
                2: begin
                    control_word[SIG_MEM_EN] <= 1;
                    control_word[SIG_IR_LOAD] <= 1;
                end
                3: begin
                    case (opcode)
                        OP_LDA: begin
                            control_word[SIG_IR_EN] <= 1;
                            control_word[SIG_MEM_LOAD] <= 1;
                        end
                        OP_ADD, OP_SUB, OP_MUL, OP_DIV: begin // Combined for clarity
                            control_word[SIG_IR_EN] <= 1;
                            control_word[SIG_MEM_LOAD] <= 1;
                        end
                        OP_HLT: begin
                            control_word[SIG_HLT] <= 1;
                        end
                    endcase
                end
                4: begin
                    case (opcode)
                        OP_LDA: begin
                            control_word[SIG_MEM_EN] <= 1;
                            control_word[SIG_A_LOAD] <= 1;
                        end
                        OP_ADD, OP_SUB, OP_MUL, OP_DIV: begin // Load B for these operations
                            control_word[SIG_MEM_EN] <= 1;
                            control_word[SIG_B_LOAD] <= 1;
                        end
                    endcase
                end
                5: begin
                    case (opcode)
                        OP_ADD: begin
                            control_word[SIG_ADDER_EN] <= 1;
                            control_word[SIG_A_LOAD] <= 1;
                        end
                        OP_SUB: begin
                            control_word[SIG_ADDER_SUB] <= 1;
                            control_word[SIG_ADDER_EN] <= 1;
                            control_word[SIG_A_LOAD] <= 1;
                        end
                        OP_MUL: begin // Enable multiplier and load result to A
                            control_word[SIG_MULTIPLIER_EN] <= 1; // Highlighting new control
                            control_word[SIG_A_LOAD] <= 1;
                        end
                        OP_DIV: begin // Enable divider and load result to A
                            control_word[SIG_DIVIDER_EN] <= 1; // Highlighting new control
                            control_word[SIG_A_LOAD] <= 1;
                        end
                    endcase
                end
            endcase
        end
    end
    
    // Output only the relevant 12 bits for compatibility with existing infrastructure
    assign out[13:0] = control_word[13:0]; 
endmodule
