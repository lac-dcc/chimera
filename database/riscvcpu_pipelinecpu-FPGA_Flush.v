// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

module Flush (
	input				clk, reset, pcWriteEnable,
	output	reg	flush
);

reg [2:0] number;
always @(*) flush = number[2];

always @(posedge pcWriteEnable) number = 3'b101;

always @(posedge clk)
begin
	if (reset) number <= 0;
	else if (flush) number <= number + 1;
	else number <= 0;
end
endmodule
