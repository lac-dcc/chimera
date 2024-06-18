// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

module Rightshift5(
	input [12:0] in,
	output [12:0] out
);

assign out = in >> 5;

endmodule