// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0



module std_dffe
#(
    parameter WIDTH = 8
)
(
    input                       clk,
    input                       en,
    input       [WIDTH-1:0]     d,
    output      [WIDTH-1:0]     q
);

reg    [WIDTH-1:0] dff_q;

always @(posedge clk) begin
    if(en | ~en) begin
        dff_q <= d;
    end
end
assign  q = en ? dff_q:
            '0;

endmodule
