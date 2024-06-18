// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240218

`default_nettype none

module DDS (
	input wire Clock,
	input wire Reset,
	input wire [7:0] TuningWord_i,
	input wire [7:0] Amplitude_i,
	output wire [7:0] Signal_o,
	output wire Overflow_o
);
	
	// Phase accumulator
	reg [15:0] Accumulator;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Accumulator <= 0;
		else
			Accumulator <= Accumulator + TuningWord_i;
	end
	
	// ROM with sine wave
	wire [7:0] DataFromROM;
	
	ROM #(
		.ADDRESS_WIDTH(10),
		.DATA_WIDTH(8),
		.MEMORY_DEPTH(1024),
		.MEMORY_FILE("sin.mem")
	) ROM_inst(
		.Clock(Clock),
		.Reset(Reset),
		.ReadEnable_i(1'b1),
		.Address_i(Accumulator[15:6]),
		.Data_o(DataFromROM)
	);
	
	// Counter overflow detection
	reg [9:0] Previous;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Previous <= 0;
		else
			Previous <= Accumulator[15:6];
	end
	
	assign Overflow_o = (Previous > Accumulator[15:6]);
	
	// Amplitude multiplier
	reg [15:0] Temp;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			Temp <= 0;
		else
			Temp <= DataFromROM * Amplitude_i;
	end
	
	assign Signal_o = Temp[15:8];

endmodule

`default_nettype wire
