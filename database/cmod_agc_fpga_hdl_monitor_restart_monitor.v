// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module restart_monitor(
    input wire clk,
    input wire rst_n,

    input wire mt05,

    input wire mrchg,
    input wire mwchg,
    input wire [9:1] ch,

    input wire mpal_n,
    input wire mtcal_n,
    input wire mrptal_n,
    input wire mwatch_n,
    input wire mvfail_n,
    input wire mctral_n,
    input wire mscafl_n,
    input wire mscdbl_n,

    output reg [9:1] chan77,
    output wire [16:1] mdt
);

assign mdt = (mrchg & (ch == 9'o77)) ? {7'b0, chan77} : 16'b0;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        chan77 <= 9'b0;
    end else begin
        if (mwchg & (ch == 9'o77)) begin
            chan77 <= 9'b0;
        end else begin
            if (~mpal_n) begin 
                chan77[1] <= 1'b1;
                if (mt05) begin
                    chan77[2] <= 1'b1;
                end
            end

            if (~mtcal_n) begin
                chan77[3] <= 1'b1;
            end

            if (~mtcal_n) begin
                chan77[3] <= 1'b1;
            end

            if (~mrptal_n) begin
                chan77[4] <= 1'b1;
            end

            if (~mwatch_n) begin
                chan77[5] <= 1'b1;
            end

            if (~mvfail_n) begin
                chan77[6] <= 1'b1;
            end

            if (~mctral_n) begin
                chan77[7] <= 1'b1;
            end

            if (~mscafl_n) begin
                chan77[8] <= 1'b1;
            end

            if (~mscdbl_n) begin
                chan77[9] <= 1'b1;
            end
        end
    end
end

endmodule
`default_nettype wire
