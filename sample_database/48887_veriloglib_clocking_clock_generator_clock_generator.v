// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module clock_generator
#(parameter integer CLK_PERIOD = 20)
(output reg clk);

initial clk = 1'b0;

always #(CLK_PERIOD/2) clk = ~clk;

endmodule