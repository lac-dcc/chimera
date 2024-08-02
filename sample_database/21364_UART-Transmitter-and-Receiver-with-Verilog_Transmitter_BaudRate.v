// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

//top module entity for the UART transmitter which includes the BaudControl and the UART_Transmitter modules. 
module Transmitter_BaudRate(
	input clk, //50Mhz
	input Rxi, //receiver that receives the reset signal from the UART receiver
	input [7:0]UI, //User data inputs
	input [2:0]BC, //baud control can include 3 more baud rate selections
	output Txo	 //Transmitted UART signal
	//output Tx_clk
);

	/* baud rate selections (~BC[2]&~BC[1]&BC[0])?Baud_19200:(~BC[2]&BC[1]&~BC[0])?Baud_38400:(~BC[2]&BC[1]&BC[0])?Baud_57600:(BC[2]&~BC[1]&~BC[0])?Baud_115200:Baud_9600;
	50Mhz/bps=clkfrequency/bps
	parameter Baud_9600 = 434; 9600 bauds * 12 = 112500 bps;
	parameter Baud_19200 = 217; 19200 bauds * 12 = 230400 bps;
	parameter Baud_38400 = 108 or 109; 38400 bauds * 12 =  460800 bps; with 108=462963bps
	parameter Baud_57600 = 72; 57600 bauds * 12 = 691200 bps; 694444
	parameter Baud_115200 = 36; 115200 bauds * 12 = 1382400 bps;
	*/
	
	wire Tx_clkw; //modified clk rate for the transmitter	
	
	//assign Tx_clk = Tx_clkw;

	
	BaudControl BaudControlInst(.clk(clk), .BC(BC), .Rx_clk(Tx_clkw));
	
	UART_Transmitter UART_TransmitterInst(.clk(Tx_clkw), .Rxi(Rxi), .UI(UI), .Txout(Txo));
		
endmodule