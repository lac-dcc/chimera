// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231110

`default_nettype none
module TerminalVIM828 #(
	parameter CLOCK_HZ  	= 10_000_000,
	parameter BAUD			= 115200
)(
	input wire Clock,
	input wire Reset,
	input wire Rx_i,
	output wire [36:1] Pin_o
);
	
	// Uart receiver
	wire RxDone;
	wire [7:0] RxByte;
	
	UartRx #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(BAUD)
	) UartRx_Inst(
		.Clock(Clock),
		.Reset(Reset),
		.Rx_i(Rx_i),
		.Done_o(RxDone),
		.Data_o(RxByte)
	);
	
	// Converter ASCII -> 14-segment code
	wire [13:0] DecodedByte;
	
	Decoder14seg Decoder14seg_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(1'b1),
		.Data_i(RxByte),
		.Segments_o(DecodedByte)
	);
	
	// Registers to store decoded segment bitmaps for each character
	reg [13:0] Segments7;
	reg [13:0] Segments6;
	reg [13:0] Segments5;
	reg [13:0] Segments4;
	reg [13:0] Segments3;
	reg [13:0] Segments2;
	reg [13:0] Segments1;
	reg [13:0] Segments0;
	
	reg OneBitDelay;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			OneBitDelay <= 1'b0;
		else
			OneBitDelay <= RxDone;
	end
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Segments7 <= 0;
			Segments6 <= 0;
			Segments5 <= 0;
			Segments4 <= 0;
			Segments3 <= 0;
			Segments2 <= 0;
			Segments1 <= 0;
			Segments0 <= 0;
		end else if(OneBitDelay) begin
			Segments0 <= DecodedByte;
			Segments1 <= Segments0;
			Segments2 <= Segments1;
			Segments3 <= Segments2;
			Segments4 <= Segments3;
			Segments5 <= Segments4;
			Segments6 <= Segments5;
			Segments7 <= Segments6;
		end
	end
	
	// Display instance
	VIM828 #(
		.CLOCK_HZ(CLOCK_HZ),
		.CHANGE_COM_US(1000)
	) VIM828_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Segments7_i(Segments7),
		.Segments6_i(Segments6),
		.Segments5_i(Segments5),
		.Segments4_i(Segments4),
		.Segments3_i(Segments3),
		.Segments2_i(Segments2),
		.Segments1_i(Segments1),
		.Segments0_i(Segments0),
		.DecimalPoints_i(8'b00000001),
		.Pin_o(Pin_o)
	);
	
endmodule
`default_nettype wire
