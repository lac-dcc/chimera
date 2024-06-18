// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

`timescale 1ns/1ps

module UARTReceiverStateMachine_testbench();
	reg clk;
	reg Rx_in;
	reg reset;
	wire Mreset;
	wire [8:0] Dout;
	
	
	UARTReceiverStateMachine UARTReceiverStateMachineInstance(.clk(clk), .Rx_in(Rx_in), .reset(reset), .Mreset(Mreset), .Dout(Dout));
	
	initial begin
		clk = 0; // Set the clock input to 0
		forever #5 clk = ~clk; // Toggle the clock every T/2 units of time
	end

	initial begin
		Rx_in = 1;     
		reset = 1;
		
		
		#3 reset=0;
		//correct even parity 
		#10 Rx_in=1; //I
		#10 Rx_in=0; //S
		#10 Rx_in=1; //D0 
		#10 Rx_in=1; //D1 
		#10 Rx_in=1; //D2
		#10 Rx_in=1; //D3 
		#10 Rx_in=0; //D4 
		#10 Rx_in=0; //D5 
		#10 Rx_in=0; //D6 
		#10 Rx_in=0; //D7 
		#10 Rx_in=0; //P8 
		#10 Rx_in=1; //Sb 
		
		
		//wrong even parity
		#10 Rx_in=1; //I 
		#10 Rx_in=0; //S 
		#10 Rx_in=1; //D0 
		#10 Rx_in=1; //D1 
		#10 Rx_in=1; //D2 
		#10 Rx_in=1; //D3 
		#10 Rx_in=0; //D4 
		#10 Rx_in=0; //D5 
		#10 Rx_in=0; //D6
		#10 Rx_in=0; //D7 
		#10 Rx_in=1; //P8 
		#10 Rx_in=1; //Sb 
		#10 Rx_in=1; //I 
		
		//wrong stop parity
		#10 Rx_in=1; //I 
		#10 Rx_in=0; //S 
		#10 Rx_in=1; //D0 
		#10 Rx_in=1; //D1 
		#10 Rx_in=1; //D2 
		#10 Rx_in=0; //D3 
		#10 Rx_in=0; //D4 
		#10 Rx_in=0; //D5 
		#10 Rx_in=0; //D6
		#10 Rx_in=0; //D7 
		#10 Rx_in=0; //P8 
		#10 Rx_in=0; //Sb 
		#10 Rx_in=1; //I 
		

		//wrong odd parity
		#10 Rx_in=1; //I 
		#10 Rx_in=0; //S 
		#10 Rx_in=1; //D0 
		#10 Rx_in=1; //D1 
		#10 Rx_in=1; //D2 
		#10 Rx_in=0; //D3 
		#10 Rx_in=0; //D4 
		#10 Rx_in=0; //D5 
		#10 Rx_in=0; //D6
		#10 Rx_in=0; //D7 
		#10 Rx_in=0; //P8 
		#10 Rx_in=1; //Sb 
		#10 Rx_in=1; //I 
		
		//right odd parity
		#10 Rx_in=1; //I 
		#10 Rx_in=0; //S 
		#10 Rx_in=1; //D 
		#10 Rx_in=1; //D 
		#10 Rx_in=1; //D 
		#10 Rx_in=1; //D
		#10 Rx_in=1; //D
		#10 Rx_in=0; //D 
		#10 Rx_in=0; //D 
		#10 Rx_in=0; //D
		#10 Rx_in=1; //P 
		#10 Rx_in=1; //Sb 
		#10 Rx_in=1; //I
		
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		#10 Rx_in=0; //S
		
		
		#0 $finish;
		
		
		
	end
	
	
	initial begin
		$monitor("simtime=%g, clk=%b, Rx_in=%b, reset=%b,Dout=%b, Mreset=%b", $time,clk, Rx_in,reset,Dout,Mreset);
	end
	

	
endmodule	
