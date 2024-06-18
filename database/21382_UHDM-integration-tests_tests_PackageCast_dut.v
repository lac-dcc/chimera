// This program was cloned from: https://github.com/chipsalliance/UHDM-integration-tests
// License: Apache License 2.0

package pkg;
   typedef enum logic[7:0] { ONE, TWO, THREE, FOUR, FIVE } enum_t;
endpackage

module dut(input logic clk, input logic[7:0] a, output pkg::enum_t b);
   assign b = pkg::enum_t'(a);
endmodule
