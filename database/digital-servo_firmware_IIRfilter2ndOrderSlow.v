///////////////////////////////////////////////////////////////////////////////
// IIRfilter2ndOrderSlow.v
//
// 3/15/12
// David Leibrandt
//
//	Second order IIR filter module.
//
// Implements a discrete second order IIR filter.  The goal is minimum resources.
// This design has N_WAIT + 4 clock cycles of latency and can run at up to 100 MHz clock speed.
// The output updates every 5*(N_WAIT + 1) + 1 clock cycles.
// It costs 4 DSP slices.
//
// a0 = 2^A0_SHIFT, a1_in, a2_in, b0_in, b1_in, and b2_in are the IIR filter taps
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module IIRfilter2ndOrderSlow(
   input  wire											clk_in,
	input  wire											rst_in,
	input  wire											on_in,
	input  wire signed	[34:0]					a1_in,
	input  wire signed	[34:0]					a2_in,
	input  wire signed	[34:0]					b0_in,
	input  wire signed	[34:0]					b1_in,
	input  wire signed	[34:0]					b2_in,
	input  wire signed [SIGNAL_IN_SIZE-1:0]	signal_in,
   output reg  signed [SIGNAL_OUT_SIZE-1:0]	signal_out
);

// Parameters
parameter SIGNAL_IN_SIZE = 16;	// size of signal_in in bits (<= 32)
parameter SIGNAL_OUT_SIZE = 16;	// size of signal_out in bits (<= 32)
parameter A0_SHIFT = 32; // a0 = 2^A0_SHIFT
parameter N_WAIT = 4'h4; // number of clock cycles to wait for multipliers to finish

// Explicitly instantiate a single multiply adder
reg  signed [34:0] MultAdd_a, MultAdd_b;
reg  signed [69:0] MultAdd_c;
wire signed [69:0] MultAdd_p;

wire signed [69:0] MultAdd_i;
multiplier35x35 multiplier35x35_inst(
	.a(MultAdd_a),
	.b(MultAdd_b),
	.p(MultAdd_i)
);
assign MultAdd_p = MultAdd_i + MultAdd_c;

reg  signed [31:0] x0, x1, x2;
reg  signed [34:0] y0, y1, y2;
reg  signed [69:0] accum;

// State machine definitions
localparam IDLE 			= 4'h0;
localparam LATCH_INPUT	= 4'h1;
localparam MADD1A			= 4'h2;
localparam MADD1B			= 4'h3;
localparam MADD2A			= 4'h4;
localparam MADD2B			= 4'h5;
localparam MADD3A			= 4'h6;
localparam MADD3B			= 4'h7;
localparam MADD4A			= 4'h8;
localparam MADD4B			= 4'h9;
localparam MADD5A			= 4'hA;
localparam MADD5B			= 4'hB;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [3:0] state_f;
reg  				    [3:0] counter_f;

// State machine - combinatorial part
function [3:0] next_state;
	input   				   [3:0] state;
	input   				   [3:0] counter;
	input								on_in;
	
	begin
		case (state)
			IDLE: 
				if (on_in)
					next_state = LATCH_INPUT;
				else
					next_state = IDLE;
			LATCH_INPUT:
					next_state = MADD1A;
			MADD1A:
					next_state = MADD1B;
			MADD1B:
				if (counter == N_WAIT - 1)
					next_state = MADD2A;
				else
					next_state = MADD1B;
			MADD2A:
					next_state = MADD2B;
			MADD2B:
				if (counter == N_WAIT - 1)
					next_state = MADD3A;
				else
					next_state = MADD2B;
			MADD3A:
					next_state = MADD3B;
			MADD3B:
				if (counter == N_WAIT - 1)
					next_state = MADD4A;
				else
					next_state = MADD3B;
			MADD4A:
					next_state = MADD4B;
			MADD4B:
				if (counter == N_WAIT - 1)
					next_state = MADD5A;
				else
					next_state = MADD4B;
			MADD5A:
					next_state = MADD5B;
			MADD5B:
				if (on_in) begin
					if (counter == N_WAIT - 1)
						next_state = LATCH_INPUT;
					else
						next_state = MADD5B;
				end else
					next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		state_f <= IDLE;
		counter_f <= 4'b0;
		MultAdd_a <= 35'b0;
		MultAdd_b <= 35'b0;
		MultAdd_c <= 70'b0;
		accum <= 70'b0;
		x0 <= 32'b0;
		x1 <= 32'b0;
		x2 <= 32'b0;
		y0 <= 35'b0;
		y1 <= 35'b0;
		y2 <= 35'b0;
	end
	else begin
		state_f <= next_state(state_f, counter_f, on_in);
		case (state_f)
			IDLE: begin
				MultAdd_a <= 35'b0;
				MultAdd_b <= 35'b0;
				MultAdd_c <= 70'b0;
				accum <= 70'b0;
				x0 <= 32'b0;
				x1 <= 32'b0;
				x2 <= 32'b0;
				y0 <= 35'b0;
				y1 <= 35'b0;
				y2 <= 35'b0;
			end
			LATCH_INPUT: begin
				x0 <= x1;
				x1 <= x2;
				y0 <= y1;
				y1 <= accum >>> A0_SHIFT;
				y2 <= accum >>> A0_SHIFT;
			end
			MADD1A: begin
				MultAdd_a <= a2_in;
				MultAdd_b <= y0;
				MultAdd_c <= 70'b0;
				counter_f <= 4'b0;
			end
			MADD1B: begin
				accum <= MultAdd_p;
				counter_f <= counter_f + 4'b1;
			end
			MADD2A: begin
				MultAdd_a <= a1_in;
				MultAdd_b <= y1;
				MultAdd_c <= accum;
				counter_f <= 4'b0;
			end
			MADD2B: begin
				accum <= MultAdd_p;
				counter_f <= counter_f + 4'b1;
			end
			MADD3A: begin
				MultAdd_a <= b2_in;
				MultAdd_b <= x0;
				MultAdd_c <= accum;
				counter_f <= 4'b0;
			end
			MADD3B: begin
				accum <= MultAdd_p;
				counter_f <= counter_f + 4'b1;
			end
			MADD4A: begin
				MultAdd_a <= b1_in;
				MultAdd_b <= x1;
				MultAdd_c <= accum;
				counter_f <= 4'b0;
			end
			MADD4B: begin
				x2 <= (signal_in <<< (32 - SIGNAL_IN_SIZE)); // wait to latch the input until now to minimize the latency
				accum <= MultAdd_p;
				counter_f <= counter_f + 4'b1;
			end
			MADD5A: begin
				MultAdd_a <= b0_in;
				MultAdd_b <= x2;
				MultAdd_c <= accum;
				counter_f <= 4'b0;
			end
			MADD5B: begin
				accum <= MultAdd_p;
				counter_f <= counter_f + 4'b1;
			end
		endcase
	end
end

// Assign the output
reg signed [SIGNAL_OUT_SIZE-1:0] signal_in_shifted;
always @(posedge clk_in) begin
	signal_in_shifted <= (SIGNAL_IN_SIZE < SIGNAL_OUT_SIZE) ? (signal_in <<< (SIGNAL_OUT_SIZE - SIGNAL_IN_SIZE)) : (signal_in >>> (SIGNAL_IN_SIZE - SIGNAL_OUT_SIZE));
end

always @(posedge clk_in) begin
	signal_out <= on_in ? y2[31:32-SIGNAL_OUT_SIZE] : signal_in_shifted;
end

endmodule
