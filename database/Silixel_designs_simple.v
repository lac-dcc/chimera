// This program was cloned from: https://github.com/sylefeb/Silixel
// License: BSD 3-Clause "New" or "Revised" License

module counter(clock, out);

input clock;
output reg [8:0] out = 0;

always @(posedge clock)
begin
	out <= out + 1;
end

endmodule
