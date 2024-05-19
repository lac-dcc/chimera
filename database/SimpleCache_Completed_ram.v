// This program was cloned from: https://github.com/psnjk/SimpleCache
// License: MIT License

module ram();

parameter size = 4096; //size of a ram in bits

reg [31:0] ram [0:size-1]; //data matrix for ram

endmodule
