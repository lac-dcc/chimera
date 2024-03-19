module Blinky(
	input wire clk,
	output wire[7:0] bank0
);

reg [31:0] counter;
wire clk40;

PLL40 pll(
	.clkin(clk),
	.clkout0en(1'b1),
	.clkout0(clk40),
	.resetn(1'b1)
);

assign bank0 = counter[27:20];

always @(posedge clk40) begin
	counter <= counter + 1;
end

endmodule
