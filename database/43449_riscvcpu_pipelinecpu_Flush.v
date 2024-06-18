// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

module Flush (
	input			clk, reset, pcWriteEnable,
	output		flush
);

integer i = 0;

assign flush = i > 0;

always @(posedge pcWriteEnable) if (pcWriteEnable) i = 3;

always @(posedge clk)
begin
	if (reset) i = 0;
	else if (flush) i = i - 1;
end

endmodule
