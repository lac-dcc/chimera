// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module Decoder2to4 (En, W2, W1, W0, Y0, Y1, Y2, Y3);
	input En, W2, W1, W0;
	output Y0, Y1, Y2, Y3;
	assign Y0 = (En &(~W2) & (~W1) & (~W0)),
	       Y1 = (En & (~W2) & (~W1) & W0),
			 Y2 = (En & (~W2) & W1 & (~W0)),
			 Y3 = (En & (~W2) & W1 & W0);
endmodule