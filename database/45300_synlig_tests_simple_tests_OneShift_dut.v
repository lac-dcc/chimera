// This program was cloned from: https://github.com/chipsalliance/synlig
// License: Apache License 2.0

module dut(a, o);
input a;
output o;

wire [2:0] a;
reg [2:0] o;

assign o = a << 1;

endmodule
