// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0


module blocking (
    input a,
    input clk,
    output reg b,
    output reg c,
    output reg d
);

    // not recommended:
    always @ (posedge clk) begin
        d = c;
        c = b;
        b = a;
    end

    // recommended:
    // always @ (posedge clk) begin
    //     d <= c;
    //     c <= b;
    //     b <= a;
    // end

endmodule
