// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

module SBLDCMC_w_UART_testbench();
	reg Rx_in; //Receiver reg from Transmitter
	reg clk; //external 50Mhz clk
	reg reset; //User reset reg
	reg [2:0]BC; //user baud rate control selection (~B3&~B2&B1)?9'd217:(~B3&B2&~B1)?9'd109:(~B3&B2&B1)?9'd72:(B3&~B2&~B1)?9'd36:9'd434;
	reg [2:0]HS1; //3 HALL SENSOR SIGNALS FROM each MOTOR
	reg [2:0]HS2; //3 HALL SENSOR SIGNALS FROM each MOTOR
	reg [2:0]HS3; //3 HALL SENSOR SIGNALS FROM each MOTOR
	reg [2:0]HS4; //3 HALL SENSOR SIGNALS FROM each MOTOR
	wire Mreset; //sends a reset signal to the transmitter
	wire [7:0]DataOut;
	wire [23:0] PT;

	SBLDCMC_w_UART SBLDCMC_w_UARTInst(
		.Rx_in(Rx_in), .clk(clk), .reset(reset), .BC(BC),
		.HS1(HS1), .HS2(HS2), . HS3(HS3), .HS4(HS4), .Mreset(Mreset), .DataOut(DataOut),
		.PT(PT)
	);

	initial begin
		clk = 0; // Set the clock input to 0
		forever #1 clk = ~clk; // Toggle the clock every T/7400 units of time
	end
	
	
	initial begin
		Rx_in = 1; 
		reset = 0;
		BC = 3'b100;
		HS1 = 3'd1;
		HS2 = 3'd1;
		HS3 = 3'd1;
		HS4 = 3'd1;
		
		
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 

		#72 HS1 = 3'b011;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS1 = 3'b010;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS1 = 3'b110;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS1 = 3'b100;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS1 = 3'b101;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=1; //D0 
		#72 Rx_in=1; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=1; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=0; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		
		#72 HS4 = 3'b011;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS4 = 3'b010;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		
		#72 HS4 = 3'b110;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		
		#72 HS4 = 3'b100;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 		

		#72 HS4 = 3'b101;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 		
		
		#72 HS4 = 3'b101;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=1;
		#72 Rx_in=0; //S
		#72 Rx_in=0; //D0 
		#72 Rx_in=0; //D1 
		#72 Rx_in=0; //D2
		#72 Rx_in=0; //D3 
		#72 Rx_in=0; //D4 
		#72 Rx_in=0; //D5 
		#72 Rx_in=0; //D6 
		#72 Rx_in=1; //D7 
		#72 Rx_in=1; //P8 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb
		#72 Rx_in=1; //Sb 
		#72 Rx_in=1; //Sb 				
		#0 $finish;		

	end
		
	initial begin
		$monitor("simtime=%g, clk=%b, Rx_in=%b, reset=%b, BC=%b, HS1=%b, HS2=%b, HS3=%b,HS4=%b,Mreset=%b,DataOut=%b,PT=%b", 
					 $time, clk, Rx_in, reset,BC, HS1, HS2, HS3, HS4, Mreset,DataOut,PT);
	end
	
endmodule