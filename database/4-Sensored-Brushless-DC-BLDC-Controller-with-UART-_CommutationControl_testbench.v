// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

`timescale 1ns/1ps

module CommutationControl_testbench();
	reg clk;
	reg [2:0]UI;
	reg [2:0]HS;
	wire [5:0]MC;
	
	CommutationControl stbinst(.clk(clk), .UI(UI), .HS(HS), .MC(MC));
	
	  // Initialize the inputs and generate the clock signal
  initial begin
    clk = 0; // Set the clock input to 0
    forever #1 clk = ~clk; // Toggle the clock every T/2 units of time
  end
	
	initial begin
		UI[2:0] = 3'b000;
		HS[0] = 0;
		HS[1] = 0;
		HS[2] = 0;		
		
		
		 //all off except the HS sensors
		#5 UI[2:0]=3'b000;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		#5 UI[2:0]=3'b000;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b000;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b000;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b000;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b000;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		
		 // ccw on with HS sensors
		#5 UI[2:0]=3'b010;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		#5 UI[2:0]=3'b010;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		#5 UI[2:0]=3'b010;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b010;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b010;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b010;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b010;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		
		
		#5 UI[2:0]=3'b000;HS[0]=1;HS[1]=0;HS[2]=1; //state 6 with all off
		
		// cw on with HS sensors
		#5 UI[2:0]=3'b001;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		#5 UI[2:0]=3'b001;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b001;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b001;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b001;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b001;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		
		// Regen brake Two(cw and ccw) on with HS sensors
		#5 UI[2:0]=3'b011;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		#5 UI[2:0]=3'b011;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b011;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b011;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b011;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b011;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		

		#5 UI[2:0]=3'b001;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		
		//Regen brake One on with HS sensors
		#5 UI[2:0]=3'b100;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		#5 UI[2:0]=3'b100;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b100;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b100;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b100;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b100;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		
		//regen brake and cw and ccw on with HS sensors
		#5 UI[2:0]=3'b111;HS[0]=0;HS[1]=0;HS[2]=1; //state 1
		#5 UI[2:0]=3'b111;HS[0]=0;HS[1]=1;HS[2]=1; //state 2
		#5 UI[2:0]=3'b111;HS[0]=0;HS[1]=1;HS[2]=0; //state 3
		#5 UI[2:0]=3'b111;HS[0]=1;HS[1]=1;HS[2]=0; //state 4
		#5 UI[2:0]=3'b111;HS[0]=1;HS[1]=0;HS[2]=0; //state 5
		#5 UI[2:0]=3'b111;HS[0]=1;HS[1]=0;HS[2]=1; //state 6
		
		#0 $finish;
										
		
	end
	
	
	initial begin
		$monitor("simtime=%g, clk=%b, UI=%b, HS%b, MC=%b", $time, clk,UI,HS,MC);
	end
	
endmodule
