// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: loss_compensator.v
File Explanation: this module describes the optical loss compensator logic after receiving the data from ADC
File Start Time: December 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module loss_compensator # (
    parameter DATA_WIDTH = 256,
    parameter WORD_WIDTH = 16
)(
    input wire clk,
    input wire rst,

    input wire [DATA_WIDTH-1:0] pre_mul_tdata,
    input wire pre_mul_tvalid,
    output reg pre_mul_tready,

    input wire [WORD_WIDTH-1:0] multiply,

    output reg [DATA_WIDTH-1:0] post_mul_tdata,
    output reg post_mul_tvalid,
    input wire post_mul_tready // ignored, to match RFSOC ADC behavior
);

    integer i;

    // note that this causes a combinational path from post_mul_tready to pre_mul_1_tready and pre_mul_2_tready
    reg [DATA_WIDTH-1:0] tdata;
    reg tvalid;

    wire [DATA_WIDTH-1:0] shifted_tdata;
    wire shifted_tvalid;
   
   always @ (posedge clk)
        if (rst) begin
            post_mul_tdata <= 0;
            post_mul_tvalid <= 1'b0;
            pre_mul_tready <= 1'b1; // always ready
        end else begin
            post_mul_tdata <= tdata;
            post_mul_tvalid <= tvalid;
            pre_mul_tready <= 1'b1; // always ready
        end
    
    always @ (posedge clk)
        if (rst) begin
            tdata <= 0;
            tvalid <= 0;
        end else begin
            if (pre_mul_tvalid) begin
                for (i=0; i<DATA_WIDTH/WORD_WIDTH; i=i+1) begin
                    tdata[i*WORD_WIDTH +: WORD_WIDTH] <= pre_mul_tdata[i*WORD_WIDTH+7 +: 8] * multiply;
                end
                tvalid <= 1'b1;
            end else begin
                tdata <= {DATA_WIDTH{1'b0}};
                tvalid <= 1'b0;
            end

        end

endmodule


`resetall