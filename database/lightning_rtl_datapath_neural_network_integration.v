// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: integration.v
File Explanation: this module performs the integration after photonic MACs
Authors: Jay Lang (jaytlang@mit.edu), Zhizhen Zhong (zhizhenz@mit.edu)
File Start Time: March 2022
Language: Verilog 2001

*/


`resetall
`timescale 1ns / 1ps
`default_nettype none

`define INPUT_BITWIDTH  (2 ** LOG2_INPUT_BITWIDTH)
`define PARALLELISM     (2 ** LOG2_PARALLELISM)
`define VALUE_BITWIDTH  (`INPUT_BITWIDTH / `PARALLELISM)

`define BUFFER_SLOTS    ((2 ** LOG2_PARALLELISM) - 2)

`define STAGES          (LOG2_PARALLELISM)
`define STAGE_NUMVALUES (`PARALLELISM >> i)
`define STAGE_INPOFFSET (2 ** (`STAGES - i) - 2)
`define STAGE_OUTOFFSET (2 ** (`STAGES - i - 1) - 2)

module integration #(
    parameter LOG2_INPUT_BITWIDTH = 8,
    parameter LOG2_PARALLELISM = 4,
    parameter CYCLE_COUNTER_BITWIDTH = 10,
    parameter INTEGRATION_DATA_DELAY = 4
) (
    input wire clk, rst,

    input wire [`INPUT_BITWIDTH - 1:0] s_integration_tdata,
    input wire [`PARALLELISM - 1:0] s_sparsity_tdata,
    input wire [`PARALLELISM - 1:0] s_sign_tdata,

    input wire s_integration_tvalid,
    input wire s_metadata_tvalid,

    // debug only!
    input wire [2:0] layer,

    input wire [CYCLE_COUNTER_BITWIDTH - 1:0] num_input_cycles,
    input wire [CYCLE_COUNTER_BITWIDTH - 1:0] num_outputs,

    // assume input data will always be continuous this allows us to make aggressive assumptions and simplify our module logic pretty dramatically
    output reg [`VALUE_BITWIDTH - 1:0] m_integration_tdata,
    output reg m_integration_tvalid
);

    reg [`VALUE_BITWIDTH-1:0] buffer [`BUFFER_SLOTS - 1:0];
    reg [`STAGES - 1:0] valid;

    reg [CYCLE_COUNTER_BITWIDTH - 1:0] cycle_counter, output_counter;

    wire [`VALUE_BITWIDTH-1:0] incoming_ops [`PARALLELISM -1:0];
    wire [`VALUE_BITWIDTH-1:0] signed_incoming_ops [`PARALLELISM -1:0];

    reg [`INPUT_BITWIDTH-1:0] delay_s_integration_tdata;
    reg delay_s_integration_tvalid;

    localparam PARAM_INPUT_BITWIDTH = 2 ** LOG2_INPUT_BITWIDTH;

    axis_delay # (
        .DATA_WIDTH(PARAM_INPUT_BITWIDTH),
        .LATENCY(INTEGRATION_DATA_DELAY)
    ) integration_input_delay_inst (
        .clk(clk),
        .rst(rst),
        .s_axis_tdata(s_integration_tdata),
        .s_axis_tvalid(s_integration_tvalid),
        .s_axis_tlast(1'b0),
        .m_axis_tdata(delay_s_integration_tdata),
        .m_axis_tvalid(delay_s_integration_tvalid),
        .m_axis_tlast()
    );

    genvar g;
    integer i, j;
    generate

        for (g = 0; g < `PARALLELISM; g = g + 1) begin
            // apply sparsity
            assign incoming_ops[g] = delay_s_integration_tdata[g * `VALUE_BITWIDTH +: `VALUE_BITWIDTH];

            // apply signing...
            assign signed_incoming_ops[g] = (s_sign_tdata[g]) ? incoming_ops[g] :
                0 - incoming_ops[g];
        end
    endgenerate

    always @(posedge clk) begin
        if (rst) begin
            valid <= 0;
            cycle_counter <= 0;
            output_counter <= 0;

        end else begin
            for (i = 0; i < `STAGES; i = i + 1) begin

                if (i == 0) begin
                    if (delay_s_integration_tvalid && s_metadata_tvalid) begin
                        for (j = 0; j < `STAGE_NUMVALUES; j = j + 2)
                            buffer[`STAGE_OUTOFFSET + j / 2] <=
                                signed_incoming_ops[j] + signed_incoming_ops[j + 1];
                    end

                    valid[i] <= delay_s_integration_tvalid;

                end else if (i == `STAGES - 1) begin
                    if (valid[i - 1]) begin
                        m_integration_tdata <= buffer[0] + buffer[1] +
                            ((cycle_counter == 0) ? 0 : m_integration_tdata);

                        if (cycle_counter == num_input_cycles - 1) begin
                            cycle_counter <= 0;

                            if (output_counter < num_outputs) begin
                                output_counter <= output_counter + 1;
                                m_integration_tvalid <= 1;
                            end

                        end else begin
                            cycle_counter <= cycle_counter + 1;
                            m_integration_tvalid <= 0;
                        end

                    // if invalid, blow out our state
                    end else begin
                        m_integration_tvalid <= 0;
                        cycle_counter <= 0;
                        output_counter <= 0;
                    end

                end else begin
                    if (valid[i - 1]) begin
                        for (j = 0; j < `STAGE_NUMVALUES; j = j + 2) begin
                            buffer[`STAGE_OUTOFFSET + j / 2] <=
                                buffer[`STAGE_INPOFFSET + j] +
                                buffer[`STAGE_INPOFFSET + j + 1];
                        end
                    end

                    valid[i] <= valid[i - 1];
                end
            end
        end
    end

endmodule

`resetall