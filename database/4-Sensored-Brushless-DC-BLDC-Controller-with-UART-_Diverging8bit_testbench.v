// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

module EightBit_to_SBLDCCommutation_testbench();
	reg [7:0]In; // UART reg signal from the transmitter
	reg clk;
	reg [2:0]HS1;
	reg [2:0]HS2;
	reg [2:0]HS3;
	reg [2:0]HS4;	//3 HALL SENSOR SIGNALS FROM each MOTOR
	wire [23:0] PT; //mosfet controls, 6 for each bldc motor	

	EightBit_to_SBLDCCommutation EightBit_to_SBLDCCommutationInst(
			.In(In), // UART Input signal from the transmitter
			.clk(clk),
			.HS1(HS1), .HS2(HS2), .HS3(HS3), .HS4(HS4), //3 HALL SENSOR SIGNALS FROM each MOTOR
			.PT(PT) //mosfet controls 6 for each bldc motor	
	);	
	
	initial begin
		clk = 0; // Set the clock input to 0
		forever #1 clk = ~clk; // Toggle the clock every T/7400 units of time
	end
	
	initial begin
		In = 8'd0;
		HS1 = 3'd1; HS2 = 3'd1; HS3 = 3'd1; HS4 = 3'd1;
		
		#10 In = 8'd1;
		#10 HS1 = 3'd3;
		#10 HS1 = 3'd2;
		#10 HS1 = 3'd6;
		#10 HS1 = 3'd4;
		#10 HS1 = 3'd5;
		#10 HS1 = 3'd1;

		#10 In = 8'd2;
		#10 HS1 = 3'd3;
		#10 HS1 = 3'd2;
		#10 HS1 = 3'd6;
		#10 HS1 = 3'd4;
		#10 HS1 = 3'd5;
		#10 HS1 = 3'd1;

		#10 In = 8'd3;
		#10 HS1 = 3'd3;
		#10 HS1 = 3'd2;
		#10 HS1 = 3'd6;
		#10 HS1 = 3'd4;
		#10 HS1 = 3'd5;
		#10 HS1 = 3'd1;
		
		#10 In = 8'd4;
		#10 HS1 = 3'd3;
		#10 HS1 = 3'd2;
		#10 HS1 = 3'd6;
		#10 HS1 = 3'd4;
		#10 HS1 = 3'd5;
		#10 HS1 = 3'd1;
		
		#10 In=8'd128;
		#10 HS4 = 3'd3;
		#10 HS4 = 3'd2;
		#10 HS4 = 3'd6;
		#10 HS4 = 3'd4;
		#10 HS4 = 3'd5;
		#100 HS4 = 3'd1;
		
		#10 In = 8'd192;
		#10 HS4 = 3'd3;
		#10 HS4 = 3'd2;
		#10 HS4 = 3'd6;
		#10 HS4 = 3'd4;
		#10 HS4 = 3'd5;
		#10 HS4 = 3'd1;
		
		#10 In = 8'd160;
		#10 HS4 = 3'd3;
		#10 HS4 = 3'd2;
		#10 HS4 = 3'd6;
		#10 HS4 = 3'd4;
		#10 HS4 = 3'd5;
		#10 HS4 = 3'd1;
		
		#10 In = 8'd112;
		#10 HS4 = 3'd3;
		#10 HS4 = 3'd2;
		#10 HS4 = 3'd6;
		#10 HS4 = 3'd4;
		#10 HS4 = 3'd5;
		#10 HS4 = 3'd1;
		
		#0 $finish;			
	
	end
	
	initial begin
		$monitor("simtime=%g,In=%b,HS1=%b,HS2=%b,HS3=%b,HS4=%b,PT=%b", $time,In,HS1,HS2,HS3,HS4,PT);
	end
		


endmodule


