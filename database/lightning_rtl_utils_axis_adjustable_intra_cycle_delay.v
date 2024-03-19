/*

Project: Lightning: A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference
Author: Zhizhen Zhong (zhizhenz@mit.edu)
Start Time: April 2022

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


// addfind-grained delays to data
module axis_adjustable_intra_cycle_delay # (
    parameter DATA_WIDTH = 256,
    parameter SAMPLE_PER_CYCLE = 16
)(
    input wire clk,
    input wire rst,
    input wire [15:0] intra_cycle_delay_count,

    input wire [DATA_WIDTH-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,

    output wire [DATA_WIDTH-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    output wire m_axis_tlast
);

    reg [DATA_WIDTH-1:0] tdata[1:0];
    reg tvalid [1:0];
    reg tlast [1:0];

    reg [DATA_WIDTH-1:0] shifted_tdata;
    reg shifted_tvalid;
    reg shifted_tlast;

    reg [DATA_WIDTH-1:0] mask_left;
    reg [DATA_WIDTH-1:0] mask_right;

    assign m_axis_tdata = shifted_tdata;
    assign m_axis_tvalid = shifted_tvalid;
    assign m_axis_tlast = shifted_tlast;

    wire [15:0] left_shift_intra_bit_delay_count = (SAMPLE_PER_CYCLE - intra_cycle_delay_count) * 16;
    wire [15:0] right_shift_intra_bit_delay_count = intra_cycle_delay_count*16;
    wire [15:0] left_shift_intra_sample_delay_count = (SAMPLE_PER_CYCLE - intra_cycle_delay_count);

    integer i;

    always @ (posedge clk)
        if (rst) begin
            mask_left <= 0;
            mask_right <= 0;
        end else begin
            for (i=0; i<DATA_WIDTH; i=i+1) begin
                mask_left[i] <= i < intra_cycle_delay_count*16;
                mask_right[i] <= i > intra_cycle_delay_count*16-1;
            end
        end

    always @ (posedge clk)
        if (rst) begin
            tdata[0] <= {DATA_WIDTH{1'b0}};
            tvalid[0] <= 1'b0;
            tlast[0] <= 1'b0;
            tdata[1] <= {DATA_WIDTH{1'b0}};
            tvalid[1] <= 1'b0;
            tlast[1] <= 1'b0;
        end else begin
            if (s_axis_tvalid) begin
                tdata[0] <= s_axis_tdata;
                tvalid[0] <= 1'b1;
                tlast[0] <= s_axis_tlast;
            end else begin
                tdata[0] <= {DATA_WIDTH{1'b0}};
                tvalid[0] <= 1'b0;
                tlast[0] <= 1'b0;
            end

            tdata[1] <= tdata[0];
            tvalid[1] <= tvalid[0];
            tlast[1] <= tlast[0];

            shifted_tdata <= ((tdata[0] & mask_left) << left_shift_intra_bit_delay_count) + ((tdata[1] & mask_right) >> right_shift_intra_bit_delay_count);
            shifted_tvalid <= tvalid[0] || tvalid[1];
            shifted_tlast <= tlast[1];
        end


endmodule


`resetall
