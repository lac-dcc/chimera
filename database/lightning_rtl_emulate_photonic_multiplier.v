/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: lenet_single_core.v
File Explanation: this module describes the top-level logic for executing fully-connected LeNet-300-100 neural networks
File Start Time: Februry 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/


`resetall
`timescale 1ns / 1ps
`default_nettype none

module photonic_multiplier # (
    parameter LATENCY = 10,
    parameter INTRACYCLE_DELAY = 3,
    parameter INTERCYCLE_DELAY = 2
)(
    input wire clk,
    input wire rst,

    input wire [255:0] pre_mul_1_tdata,
    input wire pre_mul_1_tvalid,
    output wire pre_mul_1_tready,

    input wire [255:0] pre_mul_2_tdata,
    input wire pre_mul_2_tvalid,
    output wire pre_mul_2_tready,

    output wire [255:0] post_mul_tdata,
    output wire post_mul_tvalid,
    input wire post_mul_tready // ignored, to match RFSOC ADC behavior
);

    /* total latency of this module if LATENCY were zero
     * is CORE_DELAY_CYCLE + 2 + 2 + 2
     * so total latency = core delay cycle + 6 + delay parameter
     */
    initial begin
        if (INTERCYCLE_DELAY + 6 > LATENCY) begin
            $error("with INTERCYCLE_DELAY = %d, total LATENCY must be >= %d",
              INTERCYCLE_DELAY, INTERCYCLE_DELAY + 6);
            $finish;
        end
    end

    assign post_mul_tvalid = 1'b1;
    assign pre_mul_1_tready = 1'b1;
    assign pre_mul_2_tready = 1'b1;

    /* bring signals into sync */
    reg [255:0] intercycle_delayed_tdata;
    reg         intercycle_delayed_tvalid;

    wire [255:0]    mul_1_tdata, mul_2_tdata;
    wire            mul_1_tvalid, mul_2_tvalid;

    reg [255:0] postmul_unshifted_tdata;
    reg         postmul_unshifted_tvalid;

    assign mul_2_tdata = pre_mul_2_tdata;
    assign mul_2_tvalid = pre_mul_2_tvalid;

    axis_delay # (
        .DATA_WIDTH(256),
        .LATENCY(INTERCYCLE_DELAY)
    ) axis_delay_photonic_multiply_inst (
        .clk(clk),
        .rst(rst),
        .s_axis_tdata(pre_mul_1_tdata),
        .s_axis_tvalid(pre_mul_1_tvalid),
        .s_axis_tlast(),
        .m_axis_tdata(intercycle_delayed_tdata),
        .m_axis_tvalid(intercycle_delayed_tvalid),
        .m_axis_tlast()
    );

    axis_intra_cycle_delay # (
        .LATENCY_SAMPLE(INTRACYCLE_DELAY)
    ) axis_intra_cycle_delay_photonic_multiply_inst (
        .clk(clk),
        .rst(rst),
        .s_axis_tdata(intercycle_delayed_tdata),
        .s_axis_tvalid(intercycle_delayed_tvalid),
        .s_axis_tlast(),
        .m_axis_tdata(mul_1_tdata),
        .m_axis_tvalid(mul_1_tvalid),
        .m_axis_tlast()
    );

    /* do multiplication */
    wire [7:0]      mul_1_input [15:0];
    wire [7:0]      mul_2_input [15:0];
    reg [31:0]      mul_full_output [15:0];
    reg [7:0]       mul_real_output [15:0];
    wire [255:0]    mul_aggregate_output;

    genvar g;
    generate
        for (g = 0; g < 16; g = g + 1) begin
            assign mul_1_input[g] = mul_1_tdata[g * 16 + 7 +: 8];
            assign mul_2_input[g] = mul_2_tdata[g * 16 + 7 +: 8];
            assign mul_aggregate_output[g * 16 +: 16] = {1'b0, mul_real_output[g], 7'b0};
        end
    endgenerate

    integer i;
    always @(posedge clk) begin
       for (i = 0; i < 16; i = i + 1) begin
            mul_full_output[i] <= mul_1_input[i] * mul_2_input[i];
            /* basically, mul_real_output[i] = mul_full_output[i] >> 8 */
            mul_real_output[i] <= mul_full_output[i][15:8];
       end
    end

    /* add additional latency if needed */
    generate
        if (INTERCYCLE_DELAY + 6 < LATENCY)
            axis_delay #(
                .DATA_WIDTH(256),
                .LATENCY(LATENCY - INTERCYCLE_DELAY - 6)
            ) axis_delay_parameter_inst (
                .clk(clk),
                .rst(rst),
                .s_axis_tdata(mul_aggregate_output),
                .s_axis_tvalid(!rst),
                .s_axis_tlast(),
                .m_axis_tdata(postmul_unshifted_tdata),
                .m_axis_tvalid(postmul_unshifted_tvalid),
                .m_axis_tlast()
            );
        else begin
            assign postmul_unshifted_tdata = mul_aggregate_output;
            assign postmul_unshifted_tvalid = !rst;
        end
    endgenerate

    /* shift back to baseline */
    axis_intra_cycle_delay # (
        .LATENCY_SAMPLE(INTRACYCLE_DELAY)
    ) axis_intra_cycle_delay_inst (
        .clk(clk),
        .rst(rst),
        .s_axis_tdata(postmul_unshifted_tdata),
        .s_axis_tvalid(postmul_unshifted_tvalid),
        .s_axis_tlast(),
        .m_axis_tdata(post_mul_tdata),
        .m_axis_tvalid(),
        .m_axis_tlast()
    );

endmodule


`resetall