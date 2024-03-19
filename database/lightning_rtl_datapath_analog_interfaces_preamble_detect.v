/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: preamble_detect.v
File Explanation: this module describes the preamble detection logic to distinguish meaningful data from continuous coming out of ADC
File Start Time: December 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module preamble_detect # (
    parameter CYCLE_SAMPLE_NUM = 16,
    parameter DATA_WIDTH = 256
)(
    input wire clk,
    input wire rst,
    input wire state_changed,
    input wire [DATA_WIDTH-1:0] input_adc_tdata,
    input wire input_adc_tvalid,
    input wire [15:0] monitor_cycle_length,
    input wire [15:0] preamble_cycle_length,

    output reg [255:0] pattern_match_agg,
    output reg [15:0]  matched_pattern,
    output reg [DATA_WIDTH-1:0] output_detected_tdata,
    output reg output_detected_tvalid
);
    reg [15:0] pattern_match [15:0];
    reg [15:0] pattern_match_error;

    wire [CYCLE_SAMPLE_NUM-1:0] average_tdata;
    wire average_tvalid;

    wire [DATA_WIDTH-1:0] delay_tdata;
    wire delay_tvalid;
    reg [DATA_WIDTH-1:0] buffer_tdata;
    reg buffer_tvalid;

    reg [DATA_WIDTH-1:0] post_tail_tdata;
    reg post_tail_tvalid;

    reg [15:0] compare_with_average;

    integer x;
    always @ (posedge clk)
        if (rst) begin
            output_detected_tdata <= {DATA_WIDTH{1'b0}};
            output_detected_tvalid <= 1'b0;
            for (x=0; x<16; x=x+1) begin
                pattern_match[x] <= 0;
            end
            pattern_match_error <= 0;
            compare_with_average <= 16'd0;
            pattern_match_agg <= 0;
            
        end else if (state_changed) begin
            output_detected_tdata <= {DATA_WIDTH{1'b0}};
            output_detected_tvalid <= 1'b0;
            for (x=0; x<16; x=x+1) begin
                pattern_match[x] <= 0;
            end
            pattern_match_error <= 0;
            compare_with_average <= 16'd0;
            pattern_match_agg <= 0;

        end else begin
            for (x=0; x<16; x=x+1) begin
                pattern_match_agg[x*16 +: 16] <= pattern_match[x];
            end

            if (average_tvalid) begin
                for (x=0; x<16; x=x+1) begin
                    if (delay_tdata[x*16 +: 16] < average_tdata) begin
                        compare_with_average[x] <= 1'b0;
                    end else begin
                        compare_with_average[x] <= 1'b1;
                    end
                end

                if (compare_with_average == 16'b0000_0000_1111_1111) begin
                    pattern_match[0] <= pattern_match[0] + 1;
                end else if (compare_with_average == 16'b0000_0001_1111_1110) begin
                    pattern_match[1] <= pattern_match[1] + 1;
                end else if (compare_with_average == 16'b0000_0011_1111_1100) begin
                    pattern_match[2] <= pattern_match[2] + 1;
                end else if (compare_with_average == 16'b0000_0111_1111_1000) begin
                    pattern_match[3] <= pattern_match[3] + 1;
                end else if (compare_with_average == 16'b0000_1111_1111_0000) begin
                    pattern_match[4] <= pattern_match[4] + 1;
                end else if (compare_with_average == 16'b0001_1111_1110_0000) begin
                    pattern_match[5] <= pattern_match[5] + 1;
                end else if (compare_with_average == 16'b0011_1111_1100_0000) begin
                    pattern_match[6] <= pattern_match[6] + 1;
                end else if (compare_with_average == 16'b0111_1111_1000_0000) begin
                    pattern_match[7] <= pattern_match[7] + 1;
                end else if (compare_with_average == 16'b1111_1111_0000_0000) begin
                    pattern_match[8] <= pattern_match[8] + 1;
                end else if (compare_with_average == 16'b1111_1110_0000_0001) begin
                    pattern_match[9] <= pattern_match[9] + 1;
                end else if (compare_with_average == 16'b1111_1100_0000_0011) begin
                    pattern_match[10] <= pattern_match[10] + 1;
                end else if (compare_with_average == 16'b1111_1000_0000_0111) begin
                    pattern_match[11] <= pattern_match[11] + 1;
                end else if (compare_with_average == 16'b1111_0000_0000_1111) begin
                    pattern_match[12] <= pattern_match[12] + 1;
                end else if (compare_with_average == 16'b1110_0000_0001_1111) begin
                    pattern_match[13] <= pattern_match[13] + 1;
                end else if (compare_with_average == 16'b1100_0000_0011_1111) begin
                    pattern_match[14] <= pattern_match[14] + 1;
                end else if (compare_with_average == 16'b1000_0000_0111_1111) begin
                    pattern_match[15] <= pattern_match[15] + 1;
                end else begin
                    pattern_match_error <= pattern_match_error + 1;
                end
            end 

            // this is exact match
            if (pattern_match[0] >= preamble_cycle_length && preamble_cycle_length > 0) begin
                output_detected_tdata <= post_tail_tdata;
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0000_0000_1111_1111;
            // these are shifted match
            end else if (pattern_match[1] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[15:0], post_tail_tdata[255:16]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0000_0001_1111_1110;

            end else if (pattern_match[2] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[31:0], post_tail_tdata[255:32]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0000_0011_1111_1100;

            end else if (pattern_match[3] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[47:0], post_tail_tdata[255:48]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0000_0111_1111_1000;

            end else if (pattern_match[4] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[63:0], post_tail_tdata[255:64]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0000_1111_1111_0000;

            end else if (pattern_match[5] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[79:0], post_tail_tdata[255:80]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0001_1111_1110_0000;

            end else if (pattern_match[6] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[95:0], post_tail_tdata[255:96]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0011_1111_1100_0000;

            end else if (pattern_match[7] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[111:0], post_tail_tdata[255:112]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b0111_1111_1000_0000;

            end else if (pattern_match[8] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[127:0], post_tail_tdata[255:128]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1111_1111_0000_0000;

            end else if (pattern_match[9] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[143:0], post_tail_tdata[255:144]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1111_1110_0000_0001;

            end else if (pattern_match[10] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[159:0], post_tail_tdata[255:160]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1111_1100_0000_0011;

            end else if (pattern_match[11] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[175:0], post_tail_tdata[255:176]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1111_1000_0000_0111;

            end else if (pattern_match[12] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[191:0], post_tail_tdata[255:192]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1111_0000_0000_1111;

            end else if (pattern_match[13] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[207:0], post_tail_tdata[255:208]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1110_0000_0001_1111;

            end else if (pattern_match[14] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[223:0], post_tail_tdata[255:224]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1100_0000_0011_1111;

            end else if (pattern_match[15] >= preamble_cycle_length-1 && preamble_cycle_length > 0) begin
                output_detected_tdata <= {delay_tdata[239:0], post_tail_tdata[255:240]};
                output_detected_tvalid <= post_tail_tvalid;
                matched_pattern <= 16'b1000_0000_0111_1111;
                
            end else begin
                output_detected_tdata <= {DATA_WIDTH{1'b0}};
                output_detected_tvalid <= 1'b0;
                matched_pattern <= 16'd0;
            end

            post_tail_tdata <= delay_tdata;
            post_tail_tvalid <= delay_tvalid;
        end

    generate
        averager_tree # (
        ) averager_tree_preamble_detection_inst(
            .clk(clk),
            .rst(rst),
            .start_signal(state_changed),
            .persist_cycle_length(monitor_cycle_length),
            .s_tdata(input_adc_tdata),
            .s_tvalid(input_adc_tvalid),
            .m_tdata(average_tdata),
            .m_tvalid(average_tvalid)
        );
    endgenerate

    generate
        axis_delay # (
            .DATA_WIDTH(DATA_WIDTH),
            .LATENCY(4) // because adder tree gives 4 cycles of delay
        ) axis_delay_preamble_detection_inst (
            .clk(clk),
            .rst(rst),
            .s_axis_tdata(input_adc_tdata),
            .s_axis_tvalid(input_adc_tvalid),
            .s_axis_tlast(),
            .m_axis_tdata(delay_tdata),
            .m_axis_tvalid(delay_tvalid),
            .m_axis_tlast()
        );
    endgenerate


endmodule


`resetall
