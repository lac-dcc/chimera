// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none


module start_stop(
    input wire clk,
    input wire rst_n,
    input wire start_req,
    input wire proceed_req,
    input wire [10:0] stop_conds,
    input wire stop_s1_s2,
    output reg [10:0] stop_cause,
    input wire mt01,
    input wire mt12,
    input wire mgojam,
    input wire mnisq,
    input wire mpal_n,
    input wire mrchg,
    input wire mwchg,

    input wire s1_match,
    input wire s2_match,
    input wire w_match,
    input wire i_match,

    output reg mstrt,
    output wire mstp
);

`define STOP_T12       0
`define STOP_NISQ      1
`define STOP_S1        2
`define STOP_S2        3
`define STOP_W         4
`define STOP_S_W       5
`define STOP_S_I       6
`define STOP_CHAN      7
`define STOP_PAR       8
`define STOP_I         9
`define STOP_PROG_STEP 10

assign mstp = (stop_cause != 11'b0);

wire s_match;
assign s_match = stop_s1_s2 ? s2_match : s1_match;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        mstrt <= 1'b0;
    end else begin
        if (start_req) begin
            mstrt <= 1'b1;
        end else if (mstrt & mgojam) begin
            mstrt <= 1'b0;
        end
    end
end

reg proceeding;
reg prog_step_match;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        stop_cause <= 11'b0;
        proceeding <= 1'b0;
        prog_step_match <= 1'b0;
    end else begin
        if (proceed_req) begin
            stop_cause <= 11'b0;
            proceeding <= 1'b1;
        end else if (proceeding) begin
            if (mt01) begin
                proceeding <= 1'b0;
            end
        end else begin
            if (stop_conds[`STOP_T12] & mt12) begin
                stop_cause[`STOP_T12] <= 1'b1;
            end

            if (stop_conds[`STOP_NISQ] & mnisq) begin
                stop_cause[`STOP_NISQ] <= 1'b1;
            end

            if (stop_conds[`STOP_S1] & s1_match) begin
                stop_cause[`STOP_S1] <= 1'b1;
            end

            if (stop_conds[`STOP_S2] & s2_match) begin
                stop_cause[`STOP_S2] <= 1'b1;
            end

            if (stop_conds[`STOP_W] & w_match) begin
                stop_cause[`STOP_W] <= 1'b1;
            end

            if (stop_conds[`STOP_S_W] & s_match & w_match) begin
                stop_cause[`STOP_S_W] <= 1'b1;
            end

            if (stop_conds[`STOP_S_I] & s_match & i_match) begin
                stop_cause[`STOP_S_I] <= 1'b1;
            end

            if (stop_conds[`STOP_CHAN] & s_match & (mrchg | mwchg)) begin
                stop_cause[`STOP_CHAN] <= 1'b1;
            end

            if (stop_conds[`STOP_PAR] & ~mpal_n) begin
                stop_cause[`STOP_PAR] <= 1'b1;
            end

            if (stop_conds[`STOP_I] & i_match) begin
                stop_cause[`STOP_I] <= 1'b1;
            end

            if (stop_conds[`STOP_PROG_STEP] & s1_match) begin
                prog_step_match <= 1'b1;
            end

            if (prog_step_match & mnisq) begin
                stop_cause[`STOP_PROG_STEP] <= 1'b1;
                prog_step_match <= 1'b0;
            end
        end
    end
end

endmodule
`default_nettype wire
