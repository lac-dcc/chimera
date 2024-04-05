///////////////////////////////////////////////////////////////////////////////
// AD8251x2.v
//
// 7/19/11
// David Leibrandt
//
//	AD8251 controller.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module AD8251x2(
   input  wire				clk_in,
	input  wire				rst_in,
	input  wire [1:0]		gain0_in,
	input  wire [1:0]		gain1_in,
	output reg				A0_out,
	output reg				A1_out,
	output reg				WR0_out,
	output reg				WR1_out
);

// Parameters
parameter CLK_DIV    = 8'h19; // run the clock at 2 MHz

// FSM clock divider
reg       fsm_clk;
reg [7:0] clk_counter;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		clk_counter <= 8'b0;
		fsm_clk <= 1'b0;
	end
	else if (clk_counter == (CLK_DIV - 8'b1)) begin
		clk_counter <= 8'b0;
		fsm_clk <= 1'b1;
	end
	else begin
		clk_counter <= clk_counter + 8'b1;
		fsm_clk <= 1'b0;
	end
end

// State machine definitions
localparam IDLE 	= 3'h0;
localparam RST 	= 3'h1;
localparam SET0A	= 3'h2;
localparam SET0B	= 3'h3;
localparam SET1A	= 3'h4;
localparam SET1B	= 3'h5;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [2:0] state_f;
reg  				    [7:0] counter_f;
reg					 [2:0] gain0_f;
reg					 [2:0] gain1_f;

// State machine - combinatorial part
function [2:0] next_state;
	input   				   [2:0] state;
	input   				   [7:0] counter;
	input						[1:0] gain0_in;
	input						[1:0] gain1_in;
	input						[2:0] gain0;
	input						[2:0] gain1;
	
	begin
		case (state)
			IDLE: 
				if ({1'b0, gain0_in} != gain0)
					next_state = SET0A;
				else if ({1'b0, gain1_in} != gain1)
					next_state = SET1A;
				else
					next_state = IDLE;
			RST: 
				if (counter == 8'b1)
					next_state = IDLE;
				else
					next_state = RST;
			SET0A:
					next_state = SET0B;
			SET0B:
					next_state = IDLE;
			SET1A:
					next_state = SET1B;
			SET1B:
					next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge fsm_clk or posedge rst_in) begin
	if (rst_in) begin
		state_f <= RST;
		counter_f <= 8'hFF;
		gain0_f <= 3'b100;
		gain1_f <= 3'b100;
		A0_out <= 1'b0;
		A1_out <= 1'b0;
		WR0_out <= 1'b0;
		WR1_out <= 1'b0;
	end
	else begin
		state_f <= next_state(state_f, counter_f, gain0_in, gain1_in, gain0_f, gain1_f);
		case (state_f)
			IDLE: begin
				A0_out <= 1'b0;
				A1_out <= 1'b0;
				WR0_out <= 1'b0;
				WR1_out <= 1'b0;
			end
			RST: begin
				counter_f <= counter_f - 8'b1;
			end
			SET0A: begin
				gain0_f <= gain0_in;
				A0_out <= gain0_in[0];
				A1_out <= gain0_in[1];
				WR0_out <= 1'b1;
			end
			SET0B: begin
				WR0_out <= 1'b0;
			end
			SET1A: begin
				gain1_f <= gain1_in;
				A0_out <= gain1_in[0];
				A1_out <= gain1_in[1];
				WR1_out <= 1'b1;
			end
			SET1B: begin
				WR1_out <= 1'b0;
			end
			default: begin
				A0_out <= 1'b0;
				A1_out <= 1'b0;
				WR0_out <= 1'b0;
				WR1_out <= 1'b0;
			end
			endcase
	end
end

endmodule
