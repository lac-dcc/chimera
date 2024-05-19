// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: sparsity_detect.v
File Explanation: this module describes the logic for detecting sparsity considering both weight matrix and layer activation
File Start Time: March 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module sparsity_detect # (
    parameter CYCLE_SAMPLE_NUM = 16,
    parameter DATA_WIDTH = 256,
    parameter RAM_DEPTH = 50  // buffer the sparsity data for 20 cycles
)(
    input wire                          clk,
    input wire                          rst,
    input wire                          state_changed,
    input wire                          integration_start,
    input wire [15:0]                   preamble_cycle_length,

    input wire [DATA_WIDTH-1:0]         layer_activation_tdata,
    input wire                          layer_activation_tvalid,

    input wire [DATA_WIDTH-1:0]         weight_tdata,
    input wire                          weight_tvalid,

    output reg [CYCLE_SAMPLE_NUM-1:0]   sparsity_tdata,
    output reg                          sparsity_tvalid

);
    integer i, j;

    wire [DATA_WIDTH-1:0] add_tdata = layer_activation_tdata & weight_tdata;
    wire                  add_tvalid = layer_activation_tvalid && weight_tvalid;

    reg [CYCLE_SAMPLE_NUM-1:0]   sparsity_tdata_ram [RAM_DEPTH-1:0];
    reg                          sparsity_tvalid_ram [RAM_DEPTH-1:0];
    reg                          sparsity_tvalid_ram_relay;  

    reg [$clog2(RAM_DEPTH)-1:0] buffer_counter;
    reg [$clog2(RAM_DEPTH)-1:0] buffer_counter_tag;
    reg [15:0] preamble_count;

    always @ (posedge clk)
        if (rst) begin
            preamble_count <= 0;
            sparsity_tdata_ram[0] <= {CYCLE_SAMPLE_NUM{1'b1}};
            sparsity_tvalid_ram[0] <= 1'b0;
            
        end else if (add_tvalid) begin
            if (preamble_count < preamble_cycle_length) begin
                preamble_count <= preamble_count + 1;
            end else if (preamble_count == preamble_cycle_length) begin
                for (i=0; i<CYCLE_SAMPLE_NUM; i=i+1) begin
                    if (layer_activation_tdata[i*16 +: 16] == 16'h0000 || weight_tdata[i*16 +: 16] == 16'h0000) begin
                        sparsity_tdata_ram[0][i] <= 1'b0;
                    end else begin
                        sparsity_tdata_ram[0][i] <= 1'b1;
                    end
                end
                // sparsity_tvalid_ram_relay <= 1'b1;
                sparsity_tvalid_ram[0] <= 1'b1;
            end

        end else begin
            preamble_count <= 0;
            sparsity_tdata_ram[0] <= {CYCLE_SAMPLE_NUM{1'b1}};
            sparsity_tvalid_ram[0] <= 1'b0;
        end

    // buffer
    always @ (posedge clk)
        if (rst) begin
            buffer_counter <= 0;
            buffer_counter_tag <= 0;
            for (i=1; i<CYCLE_SAMPLE_NUM; i=i+1) begin
                sparsity_tdata_ram[i] <= {CYCLE_SAMPLE_NUM{1'b1}};
                sparsity_tvalid_ram[i] <= 1'b0;
            end

        end else if (sparsity_tvalid_ram[0] && preamble_count == preamble_cycle_length) begin
            for (j=1; j<RAM_DEPTH; j=j+1) begin
                sparsity_tdata_ram[j] <= sparsity_tdata_ram[j-1];
                sparsity_tvalid_ram[j] <= sparsity_tvalid_ram[j-1];
                if (buffer_counter_tag == 0) begin
                    buffer_counter <= buffer_counter + 1;
                end
            end
            if (integration_start) begin
                buffer_counter_tag <= buffer_counter;
            end
        end else if (state_changed) begin
            buffer_counter <= 0;
            buffer_counter_tag <= 0;
            for (i=1; i<CYCLE_SAMPLE_NUM; i=i+1) begin
                sparsity_tdata_ram[i] <= {CYCLE_SAMPLE_NUM{1'b1}};
                sparsity_tvalid_ram[i] <= 1'b0;
            end
        end

    // read the RAM from the point
    reg integration_start_status;
    always @ (posedge clk)
        if (rst) begin
            sparsity_tdata <= {CYCLE_SAMPLE_NUM{1'b1}};  // 1 means this sample not sparse
            sparsity_tvalid <= 1'b0;
            integration_start_status <= 1'b0;
        end else if (integration_start) begin
            integration_start_status <= 1'b1;
        end else if (integration_start_status) begin
            sparsity_tdata <= sparsity_tdata_ram[buffer_counter_tag+1];
            sparsity_tvalid <= sparsity_tvalid_ram[buffer_counter_tag+1];
        end


endmodule

`resetall
