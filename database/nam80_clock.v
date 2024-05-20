// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module clock(
    input clk_in,
    input hlt,
    output clk_out
);

    assign clk_out = hlt ? 1'b0 : clk_in;

endmodule
