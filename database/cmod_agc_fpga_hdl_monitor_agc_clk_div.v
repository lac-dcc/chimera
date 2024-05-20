// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module agc_clk_div(
    input wire prop_clk,
    input wire prop_locked,
    input wire rst_n,
    output wire agc_clk
);

reg [5:0] counter;

assign agc_clk = counter >= 6'd12;

always @(posedge prop_clk or negedge rst_n) begin
    if (~rst_n) begin
        counter <= 6'b0;
    end else begin
        if (~prop_locked | (counter >= 6'd24)) begin
            counter <= 6'b0;
        end else begin
            counter <= counter + 1;
        end
    end
end

endmodule
`default_nettype wire
