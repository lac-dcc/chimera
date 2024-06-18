// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

module writeback( ALUoutW, ReadDataW, MemtoRegW, resultW);

input MemtoRegW;
input [31:0] ALUoutW, ReadDataW;

output [31:0] resultW;

assign resultW = (MemtoRegW) ? ReadDataW : ALUoutW ;

endmodule