/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: weight_matrix_absolute.v
File Explanation: this module describes the logic for reading the SRAM that stores the sign values of weight matrices
File Start Time: March 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: SystemVerilog

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module weight_matrix_sign_lenet # (
    parameter WEIGHT_SIGN_BITWIDTH = 16,
    parameter WEIGHT_CYCLE_NUM_1 = 14700,  // positive numbers mem blocks for layer 1, [784(length)*2(downsample)*16bit/256bit] * 300 = 98*300 = 29400
    parameter WEIGHT_CYCLE_NUM_2 = 1900,  // positive numbers mem blocks for layer 2, [300(length)*2*16bit/256bit] * 100 = 38*100 = 3800
    parameter WEIGHT_CYCLE_NUM_3 = 70,  // positive numbers mem blocks for layer 3, [100(length)*2*16bit/256bit] * 10 = 13*10 = 130
    parameter LAYER_1_REPEAT_LENGTH = 49, // 784/16
    parameter LAYER_2_REPEAT_LENGTH = 19,  // 300/16
    parameter LAYER_3_REPEAT_LENGTH = 7,  // 100/16
    parameter PARALLEL_CORES = 1,
    parameter READOUT_SHIFT = 0
)(
    input wire clk,
    input wire rst,

    input wire [2:0] layer,  // one hot encoding for layer
    input wire integration_start,

    output reg  [WEIGHT_SIGN_BITWIDTH-1:0]  sign_out,
    output reg  sign_valid
);
    localparam MEM_LEN = WEIGHT_CYCLE_NUM_1 + WEIGHT_CYCLE_NUM_2 + WEIGHT_CYCLE_NUM_3;

    reg [$clog2(MEM_LEN)-1:0] counter;
    reg [$clog2(MEM_LEN)-1:0] shift_counter;
    reg [1:0] init_valid = 2'b10;
    reg valid_sign;

    // Optional Output Registers
    wire [WEIGHT_SIGN_BITWIDTH-1:0] init_sign_opt_wire;
    reg valid_sign_opt_reg;

    always @ (posedge clk)
        if (rst) begin
            valid_sign_opt_reg <= 1'b0;
        end else begin
            valid_sign_opt_reg <= init_valid[valid_sign];
        end

    always @ (posedge clk)
        if (rst) begin
            sign_out <= {WEIGHT_SIGN_BITWIDTH{1'b0}};
            sign_valid <= 1'b0;
        end else begin
            sign_out <= init_sign_opt_wire;
            sign_valid <= valid_sign_opt_reg;
        end

    always @ (posedge clk)
        if (rst) begin
            counter <= 0;
            shift_counter <= 0;
            valid_sign <= 1'b0;
        end else if (integration_start) begin
            case (layer)
                3'b001: begin
                    counter <= 0 + LAYER_1_REPEAT_LENGTH*READOUT_SHIFT;  // layer 1
                    valid_sign <= 1'b1;
                end
                3'b010: begin
                    counter <= WEIGHT_CYCLE_NUM_1 + LAYER_2_REPEAT_LENGTH*READOUT_SHIFT;  // layer 2
                    valid_sign <= 1'b1;
                end
                3'b100: begin
                    counter <= WEIGHT_CYCLE_NUM_1+WEIGHT_CYCLE_NUM_2 + LAYER_3_REPEAT_LENGTH*READOUT_SHIFT;  // layer 3
                    valid_sign <= 1'b1;
                end
                default: begin
                    counter <= 0;
                    valid_sign <= 1'b0;
                end
            endcase
        end else begin
            case (layer)
                3'b001: begin
                    if (counter < WEIGHT_CYCLE_NUM_1 - LAYER_1_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1)) begin
                        if (counter == WEIGHT_CYCLE_NUM_1 - LAYER_1_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1) - 1) begin
                            valid_sign <= 1'b0;
                        end else begin
                            if (shift_counter == LAYER_1_REPEAT_LENGTH - 1) begin
                                shift_counter <= 0;
                                counter <= counter + LAYER_1_REPEAT_LENGTH*(PARALLEL_CORES-1) + 1;
                            end else begin
                                shift_counter <= shift_counter + 1;
                                counter <= counter + 1;
                            end
                        end
                    end
                end
                3'b010: begin
                    if (counter < WEIGHT_CYCLE_NUM_1 + WEIGHT_CYCLE_NUM_2 - LAYER_2_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1)) begin
                        if (counter == WEIGHT_CYCLE_NUM_1 + WEIGHT_CYCLE_NUM_2 - LAYER_2_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1) - 1) begin
                            valid_sign <= 1'b0;
                        end else begin
                            if (shift_counter == LAYER_2_REPEAT_LENGTH - 1) begin
                                shift_counter <= 0;
                                counter <= counter + LAYER_2_REPEAT_LENGTH*(PARALLEL_CORES-1) + 1;
                            end else begin
                                shift_counter <= shift_counter + 1;
                                counter <= counter + 1;
                            end
                        end
                    end
                end
                3'b100: begin
                    if (counter < WEIGHT_CYCLE_NUM_1+WEIGHT_CYCLE_NUM_2+WEIGHT_CYCLE_NUM_3 - LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1)) begin
                        if (counter == WEIGHT_CYCLE_NUM_1+WEIGHT_CYCLE_NUM_2+WEIGHT_CYCLE_NUM_3 - LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1) - 1) begin
                            valid_sign <= 1'b0;
                        end else begin
                            if (shift_counter == LAYER_3_REPEAT_LENGTH -1) begin
                                shift_counter <= 0;
                                // counter <= 0;  // here just put the sram address to be zero, the correct correct thing to do is output=0
                                counter <= counter + LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1) + 1;
                            end else begin
                                shift_counter <= shift_counter + 1;
                                counter <= counter + 1;
                            end
                        end
                    end
                end
                default: begin
                    valid_sign <= 1'b0;
                end
            endcase
        end

        reg [WEIGHT_SIGN_BITWIDTH-1:0] init_sign [MEM_LEN-1:0];  // RAM  
        reg [WEIGHT_SIGN_BITWIDTH-1:0] init_sign_opt_reg;

        assign init_sign_opt_wire = init_sign_opt_reg;
        
        always @ (posedge clk)
            if (rst) begin
               init_sign_opt_reg <= {WEIGHT_SIGN_BITWIDTH{1'b0}};
            end else begin
               init_sign_opt_reg <= init_sign[counter];
            end 

        initial begin
            `include "lut/lenet_absolute_sign_256.v"
        end

endmodule


`resetall
