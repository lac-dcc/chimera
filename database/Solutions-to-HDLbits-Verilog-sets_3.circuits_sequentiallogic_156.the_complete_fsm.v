module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

	localparam [3:0] IDLE	= 0,
					 S1		= 1,
					 S11	= 2,
					 S110	= 3,
					 S1101	= 4,	//'S1101' and 'SHIFT0' can be regarded as one state.
					 SHIFT1 = 5,
					 SHIFT2 = 6,
					 SHIFT3 = 7,
					 COUNT  = 8,
					 DONE   = 9; 
	reg [3:0] state, next;

	always @(*) begin
		case (state) 
			IDLE  : next = (data) ? S1    : IDLE;
			S1    : next = (data) ? S11   : IDLE;
			S11   : next = (data) ? S11   : S110;
			S110  : next = (data) ? S1101 : IDLE;
			S1101 : next = SHIFT1;
			SHIFT1: next = SHIFT2;
			SHIFT2: next = SHIFT3;
			SHIFT3: next = COUNT;
			COUNT : next = (done_counting) ? DONE : COUNT;
			DONE  : next = (ack) ? IDLE : DONE;			
		endcase
	end

	always @(posedge clk) begin
		if (reset) state <= IDLE;
		else state <= next;
	end

	assign shift_ena = ((state == S1101) | (state == SHIFT1) | (state == SHIFT2) | (state == SHIFT3));
	assign counting = (state == COUNT);
	assign done = (state == DONE);
endmodule
