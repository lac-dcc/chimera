/*

Project:  Lightning: A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference
Author: Zhizhen Zhong (zhizhenz@mit.edu)
Start Time: April 2022

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


module axis_adjustable_delay # (
    parameter DATA_WIDTH = 256,
    parameter MAX_LATENCY = 50  // buffer size in terms of cycle
)(
    input wire clk,
    input wire rst,
    input wire [15:0] delay_count,

    input wire [DATA_WIDTH-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,

    output wire [DATA_WIDTH-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    output wire m_axis_tlast
);
    integer i;

    reg [DATA_WIDTH-1:0] tdata[MAX_LATENCY-1:0]; 
    reg tvalid[MAX_LATENCY-1:0];
    reg tlast[MAX_LATENCY-1:0];

    reg [15:0] local_delay_count;
    
    assign m_axis_tdata = tdata[local_delay_count-1];
    assign m_axis_tvalid = tvalid[local_delay_count-1];
    assign m_axis_tlast = tlast[local_delay_count-1];

    always @ (posedge clk)
        if (rst) begin
            local_delay_count <= 16'd0;
            for (i = 0; i < MAX_LATENCY; i=i+1) begin
                tdata[i] <= {DATA_WIDTH{1'b0}};
                tvalid[i] <= 1'b0;
                tlast[i] <= 1'b0;
            end
        end else begin
            local_delay_count <= delay_count;
            if (s_axis_tvalid) begin
                tdata[0] <= s_axis_tdata;
                tvalid[0] <= 1'b1;
                tlast[0] <= s_axis_tlast;
            end else begin
                tvalid[0] <= 1'b0;
                tlast[0] <= 1'b0;
            end

            // delay tdata and tvalid
            for (i = 1; i < MAX_LATENCY; i=i+1) begin
                tdata[i] <= tdata[i-1];
                tvalid[i] <= tvalid[i-1];
                tlast[i] <= tlast[i-1];
            end
        end

endmodule


`resetall
