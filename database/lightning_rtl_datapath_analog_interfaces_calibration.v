// This program was cloned from: https://github.com/hipersys-team/lightning
// License: MIT License

/*

Project: [Lightning] A Reconfigurable Photonic-Electronic SmartNIC for Fast and Energy-Efficient Inference 
File: calibration.v
File Explanation: this module describes the calibration process for optical loss in the system
File Start Time: December 2022
Authors: Zhizhen Zhong (zhizhenz@mit.edu)
Language: Verilog 2001

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none


module calibration # (
    parameter CALIBRATION_DATA_WIDTH = 256
)(
    input  wire  clk,
    input  wire  rst,
    input  wire  [15:0]  estimate_photonic_slack_cycle_length,
    input  wire  calibration_start,
    input  wire  [15:0]  calibration_length,
    input  wire  [15:0]  calibration_wave_type,  // select different types of calibration waveform

    input  wire [CALIBRATION_DATA_WIDTH-1:0] input_tdata,
    input  wire input_tvalid,

    output reg [CALIBRATION_DATA_WIDTH-1:0] output_tdata,
    output reg output_tvalid,

    output reg [15:0] loss,
    output reg loss_valid
);
    wire [CALIBRATION_DATA_WIDTH-1:0] sine_wave_dc = 256'hCF07_A57F_89C3_8003_89C3_A57F_CF07_FFFF_30F8_5A80_763C_7FFC_763C_5A80_30F8_0000;
    wire [CALIBRATION_DATA_WIDTH-1:0] sine_wave_positive = 256'hCF07_A57F_89C3_8003_89C3_A57F_CF07_FFFF_30F8_5A80_763C_7FFC_763C_5A80_30F8_0000;
    wire [CALIBRATION_DATA_WIDTH-1:0] square_wave_positive = 256'h0000_0000_0000_0000_0000_0000_0000_0000_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC_7FFC;

    integer i;

    reg [CALIBRATION_DATA_WIDTH-1:0] output_tdata_buffer;
    reg output_tvalid_buffer;

    reg [15:0] photonic_slack_cycle_count;
    reg [15:0] counter;

    wire [CALIBRATION_DATA_WIDTH-1:0] post_preamble_tdata;
    wire post_preamble_tvalid;

    reg calibration_start_reg;
    reg calibration_started_reg;

    wire [15:0] matched_pattern;

    always @ (posedge clk)
        if (rst) begin
            calibration_start_reg <= 1'b0;
            calibration_started_reg <= 1'b0;
        end else begin
            if (!calibration_started_reg && calibration_start_reg) begin
                calibration_start_reg <= calibration_start;
                calibration_started_reg <= 1'b1;
            end else begin
                calibration_start_reg <= 1'b0;
            end
        end

    always @ (posedge clk)
        if (rst) begin
            photonic_slack_cycle_count <= 0;
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end

    // send out a full sine wave
    always @ (posedge clk)
        if (rst) begin
            output_tdata <= {CALIBRATION_DATA_WIDTH{1'b0}};
            output_tvalid <= 1'b0;

        end else begin
            output_tdata <= output_tdata_buffer;
            output_tvalid <= output_tvalid_buffer;
        end

    always @ (posedge clk)
        if (rst) begin
            output_tdata_buffer <= {CALIBRATION_DATA_WIDTH{1'b0}};
            output_tvalid_buffer <= 1'b0;

        end else if (calibration_start && calibration_wave_type[0]) begin
            output_tdata_buffer <= sine_wave_dc;
            output_tvalid_buffer <= 1'b1;

        end else if (calibration_start && calibration_wave_type[1]) begin
            output_tdata_buffer <= sine_wave_positive;  // the length of the signal is until calibration_start lasts
            output_tvalid_buffer <= 1'b1;

        end else if (calibration_start && calibration_wave_type[2]) begin
            output_tdata_buffer <= square_wave_positive;  // the length of the signal is until calibration_start lasts
            output_tvalid_buffer <= 1'b1;
        end

    reg [CALIBRATION_DATA_WIDTH-1:0] accumulated_tdata;
    reg accumulated_tvalid;
    reg [15:0] accumulated_times;

    reg [CALIBRATION_DATA_WIDTH-1:0] ratio;
    reg ratio_valid;
    reg [CALIBRATION_DATA_WIDTH-1:0] ratio_relay;
    reg ratio_valid_relay;

    always @ (posedge clk) begin
        ratio_relay <= ratio;
        ratio_valid_relay <= ratio_valid;
    end

    // analyze the received waveform
    always @ (posedge clk)
        if (rst) begin
            accumulated_tdata <= {CALIBRATION_DATA_WIDTH{1'b0}};
            accumulated_tvalid <= 1'b0;
            accumulated_times <= 16'd0;
            ratio_valid <= 1'b0;

        end else if (input_tvalid) begin
            accumulated_times <= accumulated_times + 16'd1;
            if (!accumulated_tvalid) begin
                accumulated_tdata <= post_preamble_tdata;
                accumulated_tvalid <= post_preamble_tvalid;

            end else begin
                for (i=0; i<CALIBRATION_DATA_WIDTH/16; i=i+1) begin
                    accumulated_tdata[i*16 +: 16] <= accumulated_tdata[i*16 +: 16]/2 + post_preamble_tdata[i*16 +: 16]/2;
                end
                accumulated_tvalid <= post_preamble_tvalid;
                if (accumulated_times > 16'd0) begin
                    for (i=0; i<CALIBRATION_DATA_WIDTH/16; i=i+1) begin
                        if (output_tdata_buffer[i*16+7 +: 8] == 8'd0) begin
                            ratio[i*16 +: 16] <= 16'd0;
                        end else begin
                            ratio[i*16 +: 16] <= accumulated_tdata[i*16 +: 16] << 8;
                        end
                    end
                    ratio_valid <= 1'b1;
                end
            end
        end

    wire [15:0] loss_wire;
    wire loss_valid_wire;
    
    always @ (posedge clk)
        if (rst) begin
            loss <= 16'd0;
            loss_valid <= 1'b0;
        end else begin
            loss <= loss_wire;
            loss_valid <= loss_valid_wire;
        end

    generate
        averager_tree # (
        ) averager_tree_calibration_inst(
            .clk(clk),
            .rst(rst),
            .start_signal(accumulated_tvalid ^ ratio_valid_relay),
            .persist_cycle_length(calibration_length + estimate_photonic_slack_cycle_length),
            .s_tdata(ratio_relay),
            .s_tvalid(ratio_valid_relay),
            .m_tdata(loss_wire),
            .m_tvalid(loss_valid_wire)
        );
    endgenerate

    generate 
        preamble_detect # (
        ) preamble_detect_inst (
            .clk(clk),
            .rst(rst),
            .state_changed(calibration_start_reg),
            .input_adc_tdata(input_tdata),
            .input_adc_tvalid(input_tvalid),
            .monitor_cycle_length(calibration_length + estimate_photonic_slack_cycle_length + 100),
            .preamble_cycle_length(calibration_length),  // let us say we use first half calibration cycles for detection
            .pattern_match_agg(),
            .matched_pattern(matched_pattern),
            .output_detected_tdata(post_preamble_tdata),
            .output_detected_tvalid(post_preamble_tvalid)
        );
    endgenerate

endmodule

`resetall