// This program was cloned from: https://github.com/sylefeb/Silixel
// License: BSD 3-Clause "New" or "Revised" License

module multest(clock, out);

input clock;
output reg [7:0] out = 0;
reg [7:0] a = 0;
// reg [7:0] b = 0;

always @(posedge clock)
begin
	out <= a * a;
  a   <= a + 1;
//  b   <= b + 1;
end

endmodule
