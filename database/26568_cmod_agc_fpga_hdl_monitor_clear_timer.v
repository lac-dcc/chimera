// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module clear_timer(
    input wire clk,
    input wire rst_n,
    input wire monwt,
    output wire ct
);

parameter CT_COUNT = 5'o30;

reg monwt_d;
reg [4:0] ct_count;

assign ct = (ct_count > 5'o0);

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        monwt_d <= 1'b0;
        ct_count <= 5'o0;
    end else begin
        monwt_d <= monwt;
        if (monwt & ~monwt_d) begin
            ct_count <= CT_COUNT;
        end else begin
            if (ct_count > 5'o0) begin
                ct_count <= ct_count - 5'o1;
            end else begin
                ct_count <= 5'o0;
            end
        end
    end
end

endmodule
`default_nettype wire
