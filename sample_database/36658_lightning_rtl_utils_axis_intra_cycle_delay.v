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


// add grained delays to data to emulate propagation delays in photonic computing
module axis_intra_cycle_delay # (
    parameter DATA_WIDTH = 256,
    parameter SAMPLE_PER_CYCLE = 16,
    parameter LATENCY_SAMPLE = 10
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

    reg [DATA_WIDTH-1:0] tdata[1:0];
    reg tvalid [1:0];
    reg tlast [1:0];

    reg [DATA_WIDTH-1:0] shifted_tdata;
    reg shifted_tvalid;
    reg shifted_tlast;

    assign m_axis_tdata = shifted_tdata;
    assign m_axis_tvalid = shifted_tvalid;
    assign m_axis_tlast = shifted_tlast;

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

            shifted_tdata <= {tdata[0][16*LATENCY_SAMPLE-1:0], tdata[1][DATA_WIDTH-1: 16*LATENCY_SAMPLE]};
            shifted_tvalid <= tvalid[0] || tvalid[1];
            shifted_tlast <= tlast[1];
        end


endmodule


`resetall
