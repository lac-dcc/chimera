// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module ( input clk, input d, output q );
    wire q1, q2;
    my_dff instance1(.clk(clk), .d(d), .q(q1));
    my_dff instance2(.clk(clk), .d(q1), .q(q2));
    my_dff instance3(.clk(clk), .d(q2), .q(q));
endmodule