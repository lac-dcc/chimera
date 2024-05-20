// This program was cloned from: https://github.com/Shofuuu/tt06-timer_counter-UGM
// License: Apache License 2.0

`default_nettype none
// `timescale 1ns/1ns

module counter(
    input wire clk, rst,
    output reg [3:0] q
);

    always @ (posedge clk or negedge rst) begin
        if (!rst) begin
            q <= 4'b0;
        end
        else begin
            q <= q + 4'b1;
        end
    end

endmodule



