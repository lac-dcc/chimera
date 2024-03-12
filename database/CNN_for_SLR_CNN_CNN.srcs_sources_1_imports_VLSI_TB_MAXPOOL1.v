`timescale 1ns / 1ps

module MAXPOOL1_TB;

	// Inputs
	reg [21:0] y;
	reg clk;
	reg start;
	reg reset;

	// Outputs
	wire [21:0] z;
	wire [3:0] mx_done;

	// Instantiate the Unit Under Test (UUT)
	MAXPOOL1 uut (
		.y(y), 
		.clk(clk), 
		.start(start), 
		.reset(reset),
		.mx_done(mx_done),
		.z(z)
	);

	initial begin
		// Initialize Inputs
		y = 0;
		clk = 0;
		start = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#50;
      reset = 1; 
		// Add stimulus here
		#100 reset = 0; start = 1; 
		    y = 15;  #50  y = 20;  #50  y = 25;  #50  y = 30; #50 y = 35; #50 y = 40; #50 y = 45; #50 y = 50; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50  y = 70; #50 y = 75; #50 y = 80; #50 y = 15; #50 y = 90; 
		#50 y = 100; #50  y = 120; #50  y = 125; #50 y = 30;  #50 y = 35; #50 y = 40; #50 y = 45; #50 y = 50; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50 y = 70;  #50 y = 75; #50 y = 80; #50 y = 85; #50 y = 90; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50  y = 70; #50 y = 75; #50 y = 80; #50 y = 15; #50 y = 90; 
		#50 y = 100; #50  y = 120; #50  y = 125; #50 y = 30;  #50 y = 35; #50 y = 40; #50 y = 45; #50 y = 50; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50 y = 70;  #50 y = 75; #50 y = 80; #50 y = 85; #50 y = 90;
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50  y = 70; #50 y = 75; #50 y = 80; #50 y = 15; #50 y = 90; 
		#50 y = 100; #50  y = 120; #50  y = 125; #50 y = 30;  #50 y = 35; #50 y = 40; #50 y = 45; #50 y = 1000; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50 y = 70;  #50 y = 75; #50 y = 80; #50 y = 85; #50 y = 90;
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50  y = 150; #50 y = 75; #50 y = 80; #50 y = 15; #50 y = 90; 
		#50 y = 100; #50  y = 120; #50  y = 125; #50 y = 30;  #50 y = 35; #50 y = 40; #50 y = 45; #50 y = 50; 
		#50 y = 55;  #50  y = 60;  #50  y = 65;  #50 y = 70;  #50 y = 75; #50 y = 80; #50 y = 85; #50 y = 90; //#10000 start = 0;
		
	end
	
	always #25 clk = ~clk;
      
endmodule

