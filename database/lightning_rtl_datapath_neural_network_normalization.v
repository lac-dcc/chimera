/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: normalization.v
File Explanation: this module normalize the input data to align them into 8 bit integer range
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

`define ST_PREAM_RECEPTIVE		2'b00		/* inputting data, outputting preamble, indicating the start of a layer */
`define ST_DATA_RECEPTIVE		2'b01		/* inputting data, outputting data, indicating the second and following layer */
`define ST_QUIET_RECEPTIVE		2'b10		/* only inputting data, indicating the first layer, or the end of layers where the buffer no longer output data but may or may not receive some previous sent data */
`define ST_FINAL				2'b11		/* final layer: output single value, skipping preamble */

module normalization # (
    parameter DATA_BITWIDTH = 16
) (
    input wire clk,
    input wire rst,
    input wire [1:0] state,

    input wire [DATA_BITWIDTH-1:0] input_tdata,
    input wire input_tvalid,

    output reg [DATA_BITWIDTH-1:0] output_shift,
    output reg output_shift_left
);

    reg [DATA_BITWIDTH - 1:0]   max_value, new_shift;
    reg                         new_shift_left;
    integer i;

    always @(posedge clk) begin
        if (rst) begin
            max_value <= 0;
            new_shift <= 0;
            new_shift_left <= 0;

        end else if (state == `ST_PREAM_RECEPTIVE) begin
            max_value <= 0;
            output_shift <= new_shift;
            output_shift_left <= new_shift_left;

        end else if (input_tvalid && input_tdata > max_value) begin
                for (i = 0; i < DATA_BITWIDTH; i = i + 1)
                    if (input_tdata[i]) begin
                        new_shift_left <= i < 8;
                        /* verilator lint_off WIDTH */
                        new_shift <= (i < 8) ? 7 - i : i - 7;
                    end

                max_value <= input_tdata;
        end
    end


endmodule

`resetall