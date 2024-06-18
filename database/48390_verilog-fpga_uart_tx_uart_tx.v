// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230814

`default_nettype none
module UartTx #(
	parameter CLOCK_HZ = 10_000_000,
	parameter BAUD     = 115200
)(
	input wire Clock,
	input wire Reset,
	input wire Start_i,
	input wire [7:0] Data_i,
	output wire Busy_o,
	output wire Done_o,
	output wire Tx_o
);
	
	// Timing
	wire NextBit;
	localparam TICKS_PER_BIT = CLOCK_HZ / BAUD;
	
	StrobeGeneratorTicks #(
		.TICKS(TICKS_PER_BIT)
	) StrobeGeneratorTicks_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(Busy || Start_i),
		.Strobe_o(NextBit)
	);

	// Shift register
	reg Busy;
	reg [3:0] Pointer /* synthesis syn_encoding = "sequential" */;
	reg [7:0] ByteCopy;
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			ByteCopy <= 0;
			Busy     <= 0;
			Pointer  <= 0;
		end else if(Start_i) begin
			ByteCopy <= Data_i;
			Busy     <= 1'b1;
			Pointer  <= 0;
		end else if(NextBit) begin
			if(Pointer == 4'd9) begin
				Busy    <= 1'b0;
				Pointer <= 4'd0;
			end else begin
				Pointer <= Pointer + 1'b1;
			end 
		end
	end
	
	wire [9:0] DataToSend;
	assign DataToSend = {1'b1, ByteCopy, 1'b0};
	
	// Outputs
	assign Tx_o = Busy ? DataToSend[Pointer] : 1'b1;
	assign Busy_o = Busy;
	assign Done_o = NextBit && (Pointer == 4'd9);
	
endmodule
`default_nettype wire