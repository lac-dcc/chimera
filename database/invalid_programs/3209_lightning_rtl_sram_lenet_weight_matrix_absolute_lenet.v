// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: weight_matrix_absolute.v
File Explanation: this module describes the logic for reading the SRAM that stores the absolute values of weight matrices
File Start Time: March 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: SystemVerilog

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


// here we double each value to match the speed of ADC (half of DAC), we put all absolute values
module weight_matrix_absolute_lenet # (
    parameter WEIGHT_DATA_BITWIDTH = 256,
    parameter WEIGHT_CYCLE_NUM_1 = 14700,  // positive numbers mem blocks for layer 1, [784(length)*2(downsample)*16bit/256bit] * 300 = 98*300 = 29400
    parameter WEIGHT_CYCLE_NUM_2 = 1900,  // positive numbers mem blocks for layer 2, [300(length)*2*16bit/256bit] * 100 = 38*100 = 3800
    parameter WEIGHT_CYCLE_NUM_3 = 70,  // positive numbers mem blocks for layer 3, [100(length)*2*16bit/256bit] * 10 = 13*10 = 130
    parameter LAYER_1_REPEAT_LENGTH = 49, // 784/16
    parameter LAYER_2_REPEAT_LENGTH = 19,  // 300/16
    parameter LAYER_3_REPEAT_LENGTH = 7,  // 100/16
    parameter PARALLEL_CORES = 1,
    parameter READOUT_SHIFT = 0,
    parameter PREAMBLE_CYCLE_LENGTH = 10
)(
    input wire clk,
    input wire rst,

    input wire [2:0] layer,  // one hot encoding for layer
    input wire state_changed,

    output reg  [WEIGHT_DATA_BITWIDTH-1:0]  data_out,
    output reg  data_valid
);
    localparam MEM_LEN = WEIGHT_CYCLE_NUM_1 + WEIGHT_CYCLE_NUM_2 + WEIGHT_CYCLE_NUM_3;

    reg [$clog2(MEM_LEN)-1:0] counter;
    reg [$clog2(MEM_LEN)-1:0] shift_counter;
    reg [1:0] init_valid = 2'b10;
    reg valid_sign;
    reg preamble_triggered;
    reg [3:0] preamble_counter;

    always @ (posedge clk)
        if (rst) begin
            counter <= 0;
            shift_counter <= 0;
            valid_sign <= 1'b0;
            preamble_triggered <= 1'b0;
            preamble_counter <= 0;
        end else if (state_changed) begin
            counter <= MEM_LEN;
            preamble_counter <= 1;
            valid_sign <= 1'b1;
        end else if (preamble_triggered) begin
            case (layer)
                3'b001: begin
                    counter <= 0 + LAYER_1_REPEAT_LENGTH*READOUT_SHIFT;  // layer 1
                    shift_counter <= 0;
                    valid_sign <= 1'b1;
                    preamble_triggered <= 1'b0;
                end
                3'b010: begin
                    counter <= WEIGHT_CYCLE_NUM_1 + LAYER_2_REPEAT_LENGTH*READOUT_SHIFT;  // layer 2
                    shift_counter <= 0;
                    valid_sign <= 1'b1;
                    preamble_triggered <= 1'b0;
                end
                3'b100: begin
                    counter <= WEIGHT_CYCLE_NUM_1 + WEIGHT_CYCLE_NUM_2 + LAYER_3_REPEAT_LENGTH*READOUT_SHIFT;  // layer 3
                    shift_counter <= 0;
                    valid_sign <= 1'b1;
                    preamble_triggered <= 1'b0;
                end
                default: begin
                    counter <= 0;
                    shift_counter <= 0;
                    valid_sign <= 1'b0;
                    preamble_triggered <= 1'b0;
                end
            endcase
        end else begin
            case (layer)
                3'b001: begin
                    if (counter < WEIGHT_CYCLE_NUM_1 - LAYER_1_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1)) begin
                        if (counter == WEIGHT_CYCLE_NUM_1 - LAYER_1_REPEAT_LENGTH*(PARALLEL_CORES-READOUT_SHIFT-1) - 1) begin  // for example, a stream of 10 numbers, index is from 0 to 9, the valid sign should flip at 8 to indicate index 9 is the last, because validsign is one cycle later than counter
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
                    if (counter == MEM_LEN) begin
                        preamble_counter <= preamble_counter + 1;
                        if (preamble_counter == PREAMBLE_CYCLE_LENGTH-1) begin
                            preamble_triggered <= 1'b1;
                        end else begin
                            preamble_triggered <= 1'b0;
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
                    if (counter == MEM_LEN) begin
                        preamble_counter <= preamble_counter + 1;
                        if (preamble_counter == PREAMBLE_CYCLE_LENGTH-1) begin
                            preamble_triggered <= 1'b1;
                        end else begin
                            preamble_triggered <= 1'b0;
                        end
                    end
                end
                3'b100: begin
                    if (counter < WEIGHT_CYCLE_NUM_1+WEIGHT_CYCLE_NUM_2+WEIGHT_CYCLE_NUM_3 - LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1)) begin
                        if (counter == WEIGHT_CYCLE_NUM_1+WEIGHT_CYCLE_NUM_2+WEIGHT_CYCLE_NUM_3 - LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1) - 1) begin
                            valid_sign <= 1'b0;
                        end else begin
                            if (shift_counter == LAYER_3_REPEAT_LENGTH - 1) begin
                                shift_counter <= 0;
                                // counter <= 0;  // here just put the sram address to be zero, the correct correct thing to do is output=0
                                counter <= counter + LAYER_3_REPEAT_LENGTH*(PARALLEL_CORES-1) + 1;
                            end else begin
                                shift_counter <= shift_counter + 1;
                                counter <= counter + 1;
                            end
                        end
                    end
                    if (counter == MEM_LEN) begin
                        preamble_counter <= preamble_counter + 1;
                        if (preamble_counter == PREAMBLE_CYCLE_LENGTH-1) begin
                            preamble_triggered <= 1'b1;
                        end else begin
                            preamble_triggered <= 1'b0;
                        end
                    end
                end
                default: begin
                    valid_sign <= 1'b0;
                end
            endcase
        end

    reg [WEIGHT_DATA_BITWIDTH-1:0] init_data [MEM_LEN:0];  // RAM, memory size + 1 preamble

    always @ (posedge clk)
        if (rst) begin
            data_out <= {WEIGHT_DATA_BITWIDTH{1'b0}};
            data_valid <= 1'b0;
        end else begin
            data_out <= init_data[counter];
            data_valid <= init_valid[valid_sign];
        end

    initial begin
        `include "lut/lenet_absolute_256.v"
    end

endmodule


`resetall
