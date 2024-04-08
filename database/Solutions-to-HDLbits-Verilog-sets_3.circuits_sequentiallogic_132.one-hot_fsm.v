module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);

	localparam  S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4,
				S5 = 5, S6 = 6, S7 = 7, S8 = 8, S9 = 9;

	//states
	assign next_state[S0] = (state[S0] & !in) | (state[S1] & !in) | (state[S2] & !in) | (state[S3] & !in) | 
							(state[S4] & !in) | (state[S7] & !in) | (state[S8] & !in) | (state[S9] & !in);
	assign next_state[S1] = (state[S0] & in) | (state[S8] & in) | (state[S9] & in);
	assign next_state[S2] = state[S1] & in;
	assign next_state[S3] = state[S2] & in;
	assign next_state[S4] = state[S3] & in;
	assign next_state[S5] = state[S4] & in;
	assign next_state[S6] = state[S5] & in;
	assign next_state[S7] = (state[S6] & in) | (state[7] & in);
	assign next_state[S8] = state[S5] & !in;
	assign next_state[S9] = state[S6] & !in;

	//output
	assign out1 = state[8] | state[9];
	assign out2 = state[7] | state[9];

endmodule
