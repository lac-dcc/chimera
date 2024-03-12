/////////////////////////////////////////////////////////////////////////

// Design: reduction_mux.v
// Author: Eric Qin

// Description: Simple select mux before each adder

/////////////////////////////////////////////////////////////////////////


module reduction_mux # (
	parameter W = 32, 
	parameter NUM_IN = 4, // has to be >= 2 and divisible by 2
	parameter SEL_IN = 2, // has to be divisible by 2
	parameter NUM_OUT = 2) ( // NUM_OUT must be 2
	i_data,
	i_sel,
	o_data
);

	parameter SEL_IN_LEFT_END = SEL_IN/2 -1;
	parameter SEL_IN_RIGHT_START = SEL_IN/2;

	input [(NUM_IN * W)-1:0] i_data; // input data to select	
	input [SEL_IN-1:0] i_sel; // select bits
	
	output reg [(NUM_OUT * W)-1:0] o_data; // output data
	
	
	wire [(NUM_IN/2 * W )-1:0] w_data_left;
	wire [(NUM_IN/2 * W )-1:0] w_data_right;
	
	wire [SEL_IN/2 -1:0] w_sel_in_left;
	wire [SEL_IN/2 -1:0] w_sel_in_right;
	
	
	assign w_data_left = i_data[NUM_IN/2 * W -1:0];
	assign w_data_right = i_data[NUM_IN * W - 1: NUM_IN/2 * W];
	
	assign w_sel_in_left = i_sel[SEL_IN_LEFT_END:0];
	assign w_sel_in_right = i_sel[SEL_IN-1:SEL_IN_RIGHT_START];
	
	// left mux select
	always @ (*) begin
		if (w_sel_in_left <= NUM_IN/2) begin
			o_data[0*W+:W] <= w_data_left[w_sel_in_left*W +: W];
		end else begin
			o_data[0*W+:W] <= 'b0;
		end
	end
	
	
	// right mux select
	always @ (*) begin
		if (w_sel_in_right <= NUM_IN/2) begin
			o_data[1*W+:W] <= w_data_right[w_sel_in_right*W +: W];
		end else begin
			o_data[1*W+:W] <= 'b0;
		end
	end
	
	
endmodule
