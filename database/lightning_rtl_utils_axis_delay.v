// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: Lightning: A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference
Author: Zhizhen Zhong (zhizhenz@mit.edu)
Start Time: April 2022

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none


module axis_delay # (
    parameter DATA_WIDTH = 8,
    parameter LATENCY = 10
)(
    input wire clk,
    input wire rst,

    input wire [DATA_WIDTH-1:0] s_axis_tdata,
    input wire s_axis_tvalid,
    input wire s_axis_tlast,

    output wire [DATA_WIDTH-1:0] m_axis_tdata,
    output wire m_axis_tvalid,
    output wire m_axis_tlast
);
    integer i;

    reg [DATA_WIDTH-1:0] tdata[LATENCY-1:0];
    reg tvalid[LATENCY-1:0];
    reg tlast[LATENCY-1:0];
    
    assign m_axis_tdata = tdata[LATENCY-1];
    assign m_axis_tvalid = tvalid[LATENCY-1];
    assign m_axis_tlast = tlast[LATENCY-1];

    always @ (posedge clk)
        if (rst) begin
            for (i = 0; i < LATENCY; i=i+1) begin
                tdata[i] <= {DATA_WIDTH{1'b0}};
                tvalid[i] <= 1'b0;
                tlast[i] <= 1'b0;
            end
        end else begin
            if (s_axis_tvalid) begin
                tdata[0] <= s_axis_tdata;
                tvalid[0] <= 1'b1;
                tlast[0] <= s_axis_tlast;
            end else begin
                tvalid[0] <= 1'b0;
                tlast[0] <= 1'b0;
            end

            // delay tdata and tvalid
            for (i = 1; i < LATENCY; i=i+1) begin
                tdata[i] <= tdata[i-1];
                tvalid[i] <= tvalid[i-1];
                tlast[i] <= tlast[i-1];
            end
        end

endmodule


`resetall
