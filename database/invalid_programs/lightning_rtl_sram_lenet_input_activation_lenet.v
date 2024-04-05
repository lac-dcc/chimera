/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: input_activation.v
File Explanation: this module describes the logic for reading the SRAM that stores images as first layer activations
File Start Time: March 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: SystemVerilog

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module input_activation_lenet # (
    parameter ACTIVATION_DATA_WIDTH = 256,  // DAC data width, however we replicate each number to 128 to match ADC
    parameter REPETITION_TIMES = 300,  // first layer repeat 300 times because we only have one core here
    parameter TOTAL_IMAGE_NUM = 1000,
    parameter PREAMBLE_CYCLE_LENGTH = 10
)(
    input  wire  clk,
    input  wire  rst,
    input  wire  [15:0] index,  // binary representation of the input index
    input  wire  [2:0] layer,  // one hot encoding for layer
    input  wire  state_changed,

    output reg  [ACTIVATION_DATA_WIDTH-1:0]  data_out,
    output reg  data_valid,
    output reg  data_last
);
    localparam SAMPLE_PER_CYCLE = ACTIVATION_DATA_WIDTH/16; 
    localparam PER_IMAGE_CYCLE = 49;
    localparam MEM_LEN = TOTAL_IMAGE_NUM*PER_IMAGE_CYCLE;  // positive numbers bits for all MNIST images (50 images * 49 mem blocks)
    localparam COUNTER_BITWIDTH = $clog2(MEM_LEN);

    reg [1:0] init_valid = 2'b10;
    reg last;
    reg [COUNTER_BITWIDTH-1:0] counter;  // revise to 10 bit to match the MEM_LEN=588
    reg [COUNTER_BITWIDTH-1:0] repeat_counter;
    reg valid_sign;
    reg [COUNTER_BITWIDTH-1:0] index_times_memlen;
    reg preamble_triggered;
    reg [3:0] preamble_counter;

    always @ (posedge clk)
        if (rst) begin
            counter <= {COUNTER_BITWIDTH{1'b0}};
            repeat_counter <= {COUNTER_BITWIDTH{1'b0}};
            valid_sign <= 1'b0;
            index_times_memlen <= {COUNTER_BITWIDTH{1'b0}};
            last <= 1'b0;
            preamble_counter <= 0;
        end else if (state_changed && layer == 3'b001) begin
            counter <= MEM_LEN;
            preamble_counter <= preamble_counter + 1;
            valid_sign <= 1'b1;
        end else if (preamble_triggered) begin
            counter <= PER_IMAGE_CYCLE * index[COUNTER_BITWIDTH-1:0];  
            repeat_counter <= {COUNTER_BITWIDTH{1'b0}};
            valid_sign <= 1'b1;
            index_times_memlen <= PER_IMAGE_CYCLE * index[COUNTER_BITWIDTH-1:0];
            preamble_triggered <= 1'b0;
        end else if (layer == 3'b001) begin
            if (counter == MEM_LEN) begin
                preamble_counter <= preamble_counter + 1;
                if (preamble_counter == PREAMBLE_CYCLE_LENGTH-1) begin
                    preamble_triggered <= 1'b1;
                end else begin
                    preamble_triggered <= 1'b0;
                end
            end else begin
                if (counter < {COUNTER_BITWIDTH{1'b1}}) begin  // avoid free counter
                    counter <= counter + 1;
                end
                if (repeat_counter < REPETITION_TIMES) begin
                    if (repeat_counter == REPETITION_TIMES-1) begin
                        if (counter == index_times_memlen + PER_IMAGE_CYCLE - 2) begin
                            last <= 1'b1;
                        end
                        if (counter == index_times_memlen + PER_IMAGE_CYCLE - 1) begin
                            counter <= {COUNTER_BITWIDTH{1'b1}};  // stop the counter 
                            valid_sign <= 1'b0;
                            last <= 1'b0;
                        end
                    end else begin
                        if (counter == index_times_memlen + PER_IMAGE_CYCLE - 1) begin
                            counter <= PER_IMAGE_CYCLE * index[COUNTER_BITWIDTH-1:0];  
                            repeat_counter <= repeat_counter + 1;
                        end
                    end
                end else begin
                    valid_sign <= 1'b0;
                    last <= 1'b0;
                end
            end
        end

        reg [ACTIVATION_DATA_WIDTH-1:0] init_data [MEM_LEN:0];  // RAM, memory size + 1 preamble

        always @ (posedge clk)
            if (rst) begin
                data_out <= {ACTIVATION_DATA_WIDTH{1'b0}};
                data_valid <= 1'b0;
                data_last <= 1'b0;
            end else if (layer == 3'b001) begin  // only read SRAM for the first layer
                data_out <= init_data[counter];
                data_valid <= init_valid[valid_sign];
                data_last <= last;
            end else begin
                data_out <= {ACTIVATION_DATA_WIDTH{1'b0}};
                data_valid <= init_valid[valid_sign];
                data_last <= last;
            end
            
        initial begin
            `include "lut/mnist_256.v"
        end
        

endmodule

`resetall
