// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`default_nettype none
module StreamTx #(
	parameter CLOCK_HZ = 10_000_000,
	parameter BAUD     = 115_200
)(
	input wire Clock,
	input wire Reset,
	input wire Button_i,
	output wire Busy_o,
	output wire Tx_o
);
	
	reg [7:0] Memory [0:7];
	
	initial begin
		Memory[0] = "H";
		Memory[1] = "e";
		Memory[2] = "l";
		Memory[3] = "l";
		Memory[4] = "o";
		Memory[5] = 8'd0;
		Memory[6] = 8'd0;
		Memory[7] = 8'd0;
	end
	
	wire Done;
	reg [2:0] Pointer;	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			Pointer <= 0;
		end else if(Button_i || Done) begin
			Pointer <= Pointer + 1'b1;
		end else if(!Busy_o) begin
			Pointer <= 0;
		end
	end
	
	wire Request = Button_i || (Done && (Memory[Pointer] != 8'd0));
	
	UART_TX #(
		.CLOCK_HZ(CLOCK_HZ),
		.BAUD(BAUD)
	) UartTx(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(Request),
		.Data_i(Memory[Pointer]),
		.Busy_o(Busy_o),
		.Done_o(Done),
		.Tx_o(Tx_o)
	);
	
endmodule
`default_nettype wire
