// This program was cloned from: https://github.com/chipsalliance/UHDM-integration-tests
// License: Apache License 2.0

module dut(a, o);
input a;
output o;

wire [3:0] a;
reg [3:0] o;

assign o = a >>> 2;

endmodule
