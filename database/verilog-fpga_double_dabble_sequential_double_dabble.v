// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231128

`default_nettype none

module DoubleDabble #(
	parameter INPUT_BITS    = 16,
	parameter OUTPUT_DIGITS = 5,
	parameter OUTPUT_BITS   = OUTPUT_DIGITS * 4
)(
	input wire Clock,
	input wire Reset,
	input wire Start_i,
	output reg Busy_o,
	output reg Done_o,
	input wire [ INPUT_BITS-1:0] Binary_i,
	output reg [OUTPUT_BITS-1:0] BCD_o
);
	
	// Variables
	integer i;
	reg [ INPUT_BITS-1:0] Binary;
	reg [OUTPUT_BITS-1:0] BCD;
	
	// State machine
	reg State;
	localparam DOUBLE = 1'b0;
	localparam DABBLE = 1'b1;
	
	localparam MAX_VALUE = INPUT_BITS - 1;
	localparam WIDTH = $clog2(MAX_VALUE + 1);
	reg [WIDTH-1:0] Counter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Counter <= 0;
			Busy_o  <= 0;
			Done_o  <= 0;
			Binary  <= 0;
			BCD     <= 0;
			BCD_o	<= 0;
			State   <= DOUBLE;
		end 
		
		else if(Start_i) begin
			Busy_o  <= 1'b1;
			Done_o  <= 1'b0;
			Binary  <= Binary_i;
			Counter <= MAX_VALUE;
			BCD     <= 0;
			State   <= DOUBLE;
		end 
		
		else if(Busy_o) begin
			
			// Double
			if(State == DOUBLE) begin
				BCD    <= {BCD[OUTPUT_BITS-2:0], Binary[INPUT_BITS-1]};
				Binary <= {Binary[INPUT_BITS-2:0], 1'b0};
				State  <= DABBLE;
			end 
			
			// Dabble
			else begin
				
				// Check each digit
				// If the digit is >= 5 then add 3
				for(i=0; i<OUTPUT_BITS; i=i+4) begin
					if(BCD[i+:4] >= 4'd5)
						BCD[i+:4] <= BCD[i+:4] + 4'd3;
				end
				
				// If counting in progress
				if(Counter) begin
					Counter <= Counter - 1'b1;
				end
				
				// If counting done
				else begin
					Busy_o <= 0;
					Done_o <= 1'b1;
					BCD_o  <= BCD;
				end
				
				State <= DOUBLE;
			end
		end
		
		// Clear done flag
		else if(Done_o) begin
			Done_o <= 1'b0;
		end
	end

endmodule

`default_nettype wire
