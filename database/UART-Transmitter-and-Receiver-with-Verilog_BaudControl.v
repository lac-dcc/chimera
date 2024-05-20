// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

module BaudControl(
	input clk, //50MHz clk//User Input Baud controls
	input [2:0]BC, //baud controller conditions
	output reg Rx_clk //Clk with modified BPS
);

	//top 5 most used baud rates
	//50Mhz/bps=clkfrequency/bps
	parameter Baud_9600 = 9'd434; //9600 bauds * 12 = 112500 bps;
	parameter Baud_19200 = 9'd217; //19200 bauds * 12 = 230400 bps;
	parameter Baud_38400 = 9'd109; //38400 bauds * 12 =  460800 bps; with 108=462963bps
	parameter Baud_57600 = 9'd72; //57600 bauds * 12 = 691200 bps; 694444
	parameter Baud_115200 = 9'd36; //115200 bauds * 12 = 1382400 bps;


	reg [8:0] Cntr = 9'd0; //counter register
	reg [8:0] Max_Cntr1; //max counter register
	wire [8:0] Max_Cntr; //net for the max counter
		
	//BC conditions that picks the baud rate 
	assign Max_Cntr=(~BC[2]&~BC[1]&BC[0])?Baud_19200:(~BC[2]&BC[1]&~BC[0])?Baud_38400:(~BC[2]&BC[1]&BC[0])?Baud_57600:(BC[2]&~BC[1]&~BC[0])?Baud_115200:Baud_9600;
	
	always@(posedge clk) begin //loads the value of the max counter
		Max_Cntr1 <= Max_Cntr;
	end
		
	
	always@(posedge clk) begin //updates and increments the counter
		if(Cntr==Max_Cntr1) 
			Cntr <= 9'd0;
		else
			Cntr <= Cntr + 1'b1;
	end
	
	always@(*) begin //toggles Txo_clk
		if(Cntr==Max_Cntr1)
			Rx_clk <= 1'b1;
		else
			Rx_clk <= 1'b0;
	end
	
	
endmodule


