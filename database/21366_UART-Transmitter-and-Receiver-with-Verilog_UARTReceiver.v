// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

/*The top level entity for the UART receiver with baud control and parity Bit. This module includes the modules BaudControl, UARTReceiverStateMachine, and Eight_Bit_Parity_Checker
*/
module UARTReceiver(
	input Rx_in, //Receiver Input from Transmitter
	input clk, //external 50Mhz clk
	input reset, //User reset input
	input [2:0]BC, //user baud rate control selection (~B3&~B2&B1)?9'd217:(~B3&B2&~B1)?9'd109:(~B3&B2&B1)?9'd72:(B3&~B2&~B1)?9'd36:9'd434;
	output [7:0]DataOut, //8 output bits based on the transmitters input
	output Mreset, //sends a reset signal to the transmitter
	output Rx_clkw
);

	/*
	50Mhz/bps=clkfrequency/bps
	parameter Baud_9600 = 9'd434; //9600 bauds * 12 = 112500 bps;
	parameter Baud_19200 = 9'd217; //19200 bauds * 12 = 230400 bps;
	parameter Baud_38400 = 9'd109; //38400 bauds * 12 =  460800 bps; with 108=462963bps
	parameter Baud_57600 = 9'd72; //57600 bauds * 12 = 691200 bps; 694444
	parameter Baud_115200 = 9'd36; //115200 bauds * 12 = 1382400 bps;
	*/			
	
	
	//wire Rx_clkw;
	
	reg Rx_inr,Rx_inr1,Rx_inr2,Rx_inr3;
	
	wire [8:0]dataw;
	
	
	always@(posedge Rx_clkw) begin
		Rx_inr1 <= Rx_in;
		Rx_inr <= Rx_inr1;
	end
	
	BaudControl BaudControlIns(.clk(clk), .BC(BC), .Rx_clk(Rx_clkw)); //Rx_clk is a derived clk from the 50MHz clk
	
	UARTReceiverStateMachine UARTReceiverStateMachineInst(.Rx_in(Rx_inr), .clk(Rx_clkw), .reset(reset), .Dout(dataw), .Mreset(Mreset));//outputs a slow pulse of data(dataw) to a sync before going to a parity bit checker
	
	Eight_Bit_Parity_Checker Eight_Bit_Parity_Checker_Inst(.data(dataw), .DataOut(DataOut)); //parity checker that outputs the 8 bit data	
	

endmodule
