// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0


module std_dffr
#(
    parameter WIDTH = 8
)
(
    input                       clk,
    input                       rstn,
    input       [WIDTH-1:0]     d,
    output      [WIDTH-1:0]     q
);

reg    [WIDTH-1:0] dff_q;

always @(posedge clk) begin
    if(rstn)begin
        dff_q <= {WIDTH{1'b0}};
    end
    else begin
        dff_q <= d;
    end
end

assign  q = dff_q;
endmodule
