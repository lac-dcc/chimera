///////////////////////////////////////////////////////////////////////////////
// DigitalDelay.v
//
// 5/28/15
// David Leibrandt
//
//	Digital delay module.
//
// Delay the rising and falling edges of a digital signal.
// This design has ? clock cycles of latency.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module DigitalDelay(
   input  wire												clk_in,
	input  wire												rst_in,
	input  wire				[31:0]						falling_delay_in,
	input  wire				[31:0]						rising_delay_in,
	input  wire												signal_in,
	output reg												signal_out
);

// State machine definitions
localparam LOW 			 = 2'b00;
localparam RISING_DELAY  = 2'b01;
localparam HIGH			 = 2'b10;
localparam FALLING_DELAY = 2'b11;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [1:0] state_f;
reg   			    		 signal_f;
reg  				   [31:0] counter_f;

// State machine - combinatorial part
function [1:0] next_state;
	input   				   [1:0] state;
	input   				   [1:0] signal;
	input   				  [31:0] counter;
	input   				  [31:0] rising_delay;
	input   				  [31:0] falling_delay;
	
	begin
		case (state)
			LOW: 
				if (signal)
					next_state = RISING_DELAY;
				else
					next_state = LOW;
			RISING_DELAY: 
				if (counter_f > rising_delay)
					next_state = HIGH;
				else
					next_state = RISING_DELAY;
			HIGH: 
				if (!signal)
					next_state = FALLING_DELAY;
				else
					next_state = HIGH;
			FALLING_DELAY: 
				if (counter_f > falling_delay)
					next_state = LOW;
				else
					next_state = FALLING_DELAY;
			
			default:
					next_state = LOW;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		state_f <= LOW;
		signal_f <= 1'b0;
		counter_f <= 31'b0;
	end
	else begin
		state_f <= next_state(state_f, signal_in, counter_f, rising_delay_in, falling_delay_in);
		case (state_f)
			LOW: begin
				signal_f <= 1'b0;
				counter_f <= 31'b0;
			end
			RISING_DELAY: begin
				signal_f <= 1'b0;
				counter_f <= counter_f + 31'b1;
			end
			HIGH: begin
				signal_f <= 1'b1;
				counter_f <= 31'b0;
			end
			FALLING_DELAY: begin
				signal_f <= 1'b1;
				counter_f <= counter_f + 31'b1;
			end
		endcase
	end
end

// Assign the output
always @(posedge clk_in) begin
	if ((rising_delay_in > 31'b0) || (falling_delay_in > 31'b0))
		signal_out <= signal_f;
	else
		signal_out <= signal_in;
end

endmodule
