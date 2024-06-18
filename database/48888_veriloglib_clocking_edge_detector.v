// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module edge_detector
(
    input in_signal,
    input clk,
    input rst_n,
    output toggle,
    output falling,
    output rising
);

    reg q;

    always @(posedge clk)
        if(!rst_n)
            q <= 0;
        else
            q <= in_signal;

    assign toggle = in_signal ^ q;
    assign falling = ~in_signal & q;
    assign rising = in_signal & ~q;

endmodule
