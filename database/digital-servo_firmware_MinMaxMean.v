///////////////////////////////////////////////////////////////////////////////
// MinMaxMean.v
//
// 4/10/13
// David Leibrandt
//
//	Module that keeps track of the min, max, and mean of signals.
// 
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module MinMaxMean(
	input	 wire												clk_in,
	input	 wire						   					rst_in,

	input  wire												sample_in,
	input  wire	[N_INPUTS*SIGNAL_SIZE-1:0] 		data_in,
	output wire	[N_INPUTS*SIGNAL_SIZE-1:0]			min_out,
	output wire	[N_INPUTS*SIGNAL_SIZE-1:0]			max_out,
	output wire	[N_INPUTS*SIGNAL_SIZE-1:0]			mean_out
);

// Parameters
parameter N_INPUTS		= 15;		// number of input data words

localparam SIGNAL_SIZE	= 16;		// size of input and output data words in bits
localparam SUM_SIZE		= 42;		// size of sum registers

// Signals
wire signed [SIGNAL_SIZE-1:0]			data[0:N_INPUTS-1];		// input data, split into arrays

reg  signed [SIGNAL_SIZE-1:0] 		data_min[0:N_INPUTS-1];
reg  signed [SIGNAL_SIZE-1:0] 		data_max[0:N_INPUTS-1];

reg  			[25:0]						Nsamples;					// number of samples
reg  signed [SUM_SIZE-1:0]				data_sum[0:N_INPUTS-1];	// summed
reg  signed [SIGNAL_SIZE-1:0] 		data_div[0:N_INPUTS-1];	// divided

reg  signed [SIGNAL_SIZE-1:0] 		min_reg[0:N_INPUTS-1];
reg  signed [SIGNAL_SIZE-1:0] 		max_reg[0:N_INPUTS-1];
reg  signed [SIGNAL_SIZE-1:0] 		mean_reg[0:N_INPUTS-1];

// Map input and output data into arrays
genvar kk;
for (kk = 0; kk <= N_INPUTS - 1; kk = kk + 1) begin: loop1
	assign data[kk] = data_in[SIGNAL_SIZE*kk+:SIGNAL_SIZE];
	assign min_out[SIGNAL_SIZE*kk+:SIGNAL_SIZE] = min_reg[kk];
	assign max_out[SIGNAL_SIZE*kk+:SIGNAL_SIZE] = max_reg[kk];
	assign mean_out[SIGNAL_SIZE*kk+:SIGNAL_SIZE] = mean_reg[kk];
end

// Instantiate a single divider
reg  signed [31:0]	DIVnum;
reg  signed [15:0]	DIVden;
wire signed [31:0]	DIVout;
wire						DIVrfd;

div_32_16 div_inst(
	.rfd(DIVrfd),
	.clk(clk_in),
	.dividend(DIVnum),
	.divisor(DIVden),
	.quotient(DIVout),
	.fractional()
);

// State machine definitions
localparam IDLE 	= 4'h0;
localparam SAMP	= 4'h1;
localparam DIV0	= 4'h2;
localparam DIV1	= 4'h3;
localparam DIV2	= 4'h4;
localparam DONE	= 4'h5;

// State
// The next line makes synthesis happy
// synthesis attribute INIT of state_f is "R"
reg   			    [3:0] state_f;
reg  				    [7:0] index_f;
reg  				    [7:0] counter_f;

// State machine - combinatorial part
function [3:0] next_state;
	input   				   [3:0] state;
	input								sample;
	input					   [7:0] index;
	input						[7:0] counter;
	
	begin
		case (state)
			IDLE: 
				if (sample)
					next_state = SAMP;
				else
					next_state = IDLE;
			SAMP:
				if (sample)
					next_state = SAMP;
				else
					next_state = DIV0;
			DIV0:
					next_state = DIV1;
			DIV1:
				// wait 50 clock cycles for the divider to finish
				if (counter > 8'h32)
					next_state = DIV2;
				else
					next_state = DIV1;
			DIV2:
				if (index >= (N_INPUTS - 1))
					next_state = DONE;
				else
					next_state = DIV0;
			DONE:
					next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
integer k;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		state_f <= IDLE;
		index_f <= 8'b0;
		counter_f <= 8'b0;
		Nsamples <= 26'b0;
		for (k = 0; k <= N_INPUTS - 1; k = k + 1) begin
			data_min[k] <= {SIGNAL_SIZE{1'b0}};
			data_max[k] <= {SIGNAL_SIZE{1'b0}};
			data_sum[k] <= {SUM_SIZE{1'b0}};
			data_div[k] <= {SIGNAL_SIZE{1'b0}};
			min_reg[k] <= 16'h0;
			max_reg[k] <= 16'h0;
			mean_reg[k] <= 16'h0;
		end
	end
	else begin
		state_f <= next_state(state_f, sample_in, index_f, counter_f);
		case (state_f)
			IDLE: begin // reset the variables
				index_f <= 8'b0;
				Nsamples <= 26'b0;
				for (k = 0; k <= N_INPUTS - 1; k = k + 1) begin
					data_min[k] <= {1'b0, {(SIGNAL_SIZE - 1){1'b1}}};
					data_max[k] <= {1'b1, {(SIGNAL_SIZE - 1){1'b0}}};
					data_sum[k] <= {SUM_SIZE{1'b0}};
				end
				counter_f <= 8'b0;
			end
			SAMP: begin // sum
				Nsamples <= Nsamples + 26'b1;
				for (k = 0; k <= N_INPUTS - 1; k = k + 1) begin
					data_min[k] <= (data[k] < data_min[k]) ? data[k] : data_min[k];
					data_max[k] <= (data[k] > data_max[k]) ? data[k] : data_max[k];
					data_sum[k] <= data_sum[k] + data[k];
				end
				counter_f <= 8'b0;
			end
			DIV0: begin // stuff the divider, throw away the least significant 10 bits
				DIVnum <= data_sum[index_f][(SUM_SIZE-1):(SUM_SIZE-32)];
				DIVden <= Nsamples[25:10];
				counter_f <= 8'b0;
			end
			DIV1: begin // wait for the divider to finish
				data_div[index_f] <= DIVout[SIGNAL_SIZE-1:0];
				counter_f <= counter_f + 8'b1;
			end
			DIV2: begin // increment the index
				index_f <= index_f + 8'b1;
				counter_f <= 8'b0;
			end
			DONE: begin // update data_out
				for (k = 0; k <= N_INPUTS - 1; k = k + 1) begin
					min_reg[k] <= data_min[k];
					max_reg[k] <= data_max[k];
					mean_reg[k] <= data_div[k];
				end
			end
		endcase
	end
end

endmodule