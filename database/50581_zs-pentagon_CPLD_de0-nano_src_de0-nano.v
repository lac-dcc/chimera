// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

module de0nano (

	input clk_50m,
	
	output [7:0]led
	
);

wire clk_28m;

pll pll28 (.areset(1'b0),	.inclk0(clk_50m),	.c0(clk_28m),	.locked(led[2]));


reg [31:0] clk_cnt = 0;

always @(negedge clk_28m) begin
	clk_cnt = clk_cnt + 1;
end



assign led[1] = clk_28m;
assign led[0] = clk_cnt[0];


endmodule