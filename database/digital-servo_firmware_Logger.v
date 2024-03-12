///////////////////////////////////////////////////////////////////////////////
// Logger.v
//
// 4/26/11
// David Leibrandt
//
//	Logging module.  Uses a pipe to stream data to the PC.
//
///////////////////////////////////////////////////////////////////////////////

`include "timescale.v"

module Logger(
   input wire							clk_in,
   input wire							rst_in,
	input wire							PipeFull_in,
	input wire							PipeEmpty_in,
   input wire			  [239:0] 	data_in,
	output reg							PipeWrite_out,
   output reg	signed 	[15:0] 	PipeData_out
);

// Latch the input data to prevent glitches
reg [239:0] data_in1;
always @(posedge clk_in) data_in1 <= data_in;

// Clock divider
parameter DATA_CLK_DIV    =  16'hC350; // divide clk by 5e4

reg				data_clk;
reg	[15:0]	data_clk_counter;

always @(posedge clk_in or posedge rst_in) begin
	if (rst_in) begin
		data_clk_counter <= 16'b0;
		data_clk <= 1'b0;
	end
	else begin
		if (data_clk_counter == (DATA_CLK_DIV - 16'b1)) begin
			data_clk_counter <= 16'b0;
			data_clk <= 1'b1;
		end
		else begin
			data_clk_counter <= data_clk_counter + 16'b1;
			data_clk <= 1'b0;
		end
	end
end

// State machine definitions
localparam IDLE 		= 4'h0;
localparam STREAM 	= 4'h1;
localparam TRIGGER 	= 4'h2;
localparam WAIT	 	= 4'h3;
localparam CALC	 	= 4'h4;

// State
// This line makes synthesis happy
// synthesis attribute INIT of state_f is "R"		
reg 	[3:0] 	state_f;
reg [255:0] 	data_f;
reg  [15:0]		counter_f;

// State machine - combinatorial part
function [3:0] next_state;
	input [3:0] state;		 	
	input 		pipefull;
	input 		pipeempty;
	input			sampledone;
	input 		newdata;

	begin
		case (state)
			IDLE: 
				if (pipeempty & newdata) next_state = TRIGGER;
				else next_state = IDLE;
			TRIGGER:
				next_state = STREAM;
			STREAM:
				if (pipefull) next_state = CALC;
				else if (sampledone) next_state = WAIT;
				else next_state = STREAM;
			WAIT:
				if (newdata) next_state = TRIGGER;
				else next_state = WAIT;
			CALC:
				next_state = IDLE;
			default:
					next_state = IDLE;
		endcase
	end
endfunction

// State machine - sequential part
always @(posedge clk_in) begin
	if (rst_in) begin
		state_f <= 4'h0;
		counter_f <= 16'b0;
		data_f <= {16'h2323, 240'h0};
		PipeWrite_out <= 1'b0;
		PipeData_out <= 16'h0;
		MMM_samplein <= 1'b1;
	end 
	else begin 
		state_f <= next_state(state_f, PipeFull_in, PipeEmpty_in, ~|data_f[255:16], data_clk);
		case (state_f)
			IDLE: begin
				counter_f <= 16'b0;
				PipeWrite_out <= 1'b0;
				PipeData_out <= 16'h0;
				MMM_samplein <= 1'b1;
			end
			TRIGGER: begin
				counter_f <= counter_f + 16'b1;
				if 	  (counter_f == 16'h0) // first the mean
					data_f <= {16'h2323, data_in1[239:176], MMM_meanout[95:48], data_in1[127:96], MMM_meanout[47:0], data_in1[47:0]};
				else if (counter_f == 16'h1) // then the min
					data_f <= {16'h2323, data_in1[239:176], MMM_minout[95:48], data_in1[127:96], MMM_minout[47:0], data_in1[47:0]};
				else if (counter_f == 16'h2) // then the max
					data_f <= {16'h2323, data_in1[239:176], MMM_maxout[95:48], data_in1[127:96], MMM_maxout[47:0], data_in1[47:0]};
				else								  // finally the instantaneous values
					data_f <= {16'h2323, data_in1};
			end
			STREAM: begin
				data_f <= data_f >> 16;
				PipeWrite_out <= 1'b1;
				PipeData_out <= {data_f[7:0], data_f[15:8]};
			end
			WAIT: begin
				PipeWrite_out <= 1'b0;
			end
			CALC: begin
				MMM_samplein <= 1'b0;
			end
		endcase
	end
end

// Module to comput the min, max, and mean
reg  		    MMM_samplein;
reg   [95:0] MMM_datain;
wire  [95:0] MMM_minout;
wire  [95:0] MMM_maxout;
wire  [95:0] MMM_meanout;

always @(posedge clk_in) begin
	MMM_datain <= {data_in1[175:128], data_in1[95:48]};
end

MinMaxMean #(
	.N_INPUTS(6)
)
MinMaxMean_inst(
	.clk_in(clk_in),
	.rst_in(rst_in),
	.sample_in(MMM_samplein),
	.data_in(MMM_datain),
	.min_out(MMM_minout),
	.max_out(MMM_maxout),
	.mean_out(MMM_meanout)
);

endmodule
