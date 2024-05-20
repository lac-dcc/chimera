// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231004

`default_nettype none
module Encoder(
	input  wire Clock,
	input  wire Reset,
	input  wire AsyncA_i,
	input  wire AsyncB_i,
	input  wire AsyncS_i,
	output reg  Increment_o,
	output reg  Decrement_o,
	output wire ButtonPress_o,
	output wire ButtonRelease_o,
	output wire ButtonState_o
);

	// Synchronize asynchronous inputs with clock domain
	wire A;
	wire B;
	wire S;
	Synchronizer #(
		.WIDTH(3)
	) SynchronizerA(
		.Clock(Clock),
		.Reset(Reset),
		.Async_i({AsyncA_i, AsyncB_i, !AsyncS_i}),
		.Sync_o({A, B, S})
	);
	
	// State machine defines
	localparam IDLE           = 0;
	localparam WAIT_FOR_LOW_A = 1;
	localparam WAIT_FOR_LOW_B = 2;
	localparam WAIT_FOR_IDLE  = 3;
	reg [1:0] State;
	
	// Analyze the rotation
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Increment_o <= 0;
			Decrement_o <= 0;
			State <= IDLE;
		end else begin
			case(State)
				
				IDLE: begin
					if(A & !B) begin
						State <= WAIT_FOR_LOW_A;
					end else if(!A & B) begin
						State <= WAIT_FOR_LOW_B;
					end else if(!A & !B) begin
						State <= WAIT_FOR_IDLE;
					end
				end
				
				WAIT_FOR_LOW_A: begin
					if(!A & !B) begin
						Decrement_o <= 1'b1;
						State <= WAIT_FOR_IDLE;
					end else if(A & B) begin
						State <= IDLE;
					end
				end
				
				WAIT_FOR_LOW_B: begin
					if(!A & !B) begin
						Increment_o <= 1'b1;
						State <= WAIT_FOR_IDLE;
					end else if(A & B) begin
						State <= IDLE;
					end
				end
				
				WAIT_FOR_IDLE: begin
					Increment_o <= 1'b0;
					Decrement_o <= 1'b0;
					if(A & B) begin
						State <= IDLE;
					end
				end
				
			endcase
		end
	end
	
	// Analyze button press
	EdgeDetector EdgeDetector_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(S),
		.RisingEdge_o(ButtonPress_o),
		.FallingEdge_o(ButtonRelease_o)
	);
	
	assign ButtonState_o = S;
	
endmodule
`default_nettype wire
