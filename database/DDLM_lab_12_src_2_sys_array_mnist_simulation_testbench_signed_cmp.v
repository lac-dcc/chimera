`timescale 1 ns / 100 ps
module testbench_signed_cmp;

reg clk;
reg [15:0] a,b;
wire [15:0] less;

signed_cmp comparator
(
.clk(clk),
.a(a),
.b(b),
.less(less)
);

initial $dumpvars;

initial begin
clk = 0;
forever #10 clk=!clk;
end

initial
begin
a <= 16'h0012; b <= 16'h0014; #40;
a <= 16'hffd2; b <= 16'h0352; #20;
end

endmodule