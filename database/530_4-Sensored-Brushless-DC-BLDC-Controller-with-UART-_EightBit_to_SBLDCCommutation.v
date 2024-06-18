// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

//This is a top entity module contains Diverging8bit and CommutationControl module 
module EightBit_to_SBLDCCommutation(
	input [7:0]In, // UART Input signal from the transmitter
	input clk,
	input [2:0]HS1,HS2,HS3,HS4, //3 HALL SENSOR SIGNALS FROM each MOTOR
	output [23:0]PT //power transistor control signals 6 for each bldc motor
);



	wire [11:0] CCinw;
	

	Diverging8bit Diverging8bitInst(.In(In), .clk(clk), .CCin(CCinw));
	
	CommutationControl CommutationControlInst1(.clk(clk), .UI(CCinw[2:0]), .HS(HS1[2:0]), .PT(PT[5:0]));
	
	CommutationControl CommutationControlInst2(.clk(clk), .UI(CCinw[5:3]), .HS(HS2[2:0]), .PT(PT[11:6]));
	
	CommutationControl CommutationControlInst3(.clk(clk), .UI(CCinw[8:6]), .HS(HS3[2:0]), .PT(PT[17:12]));
	
	CommutationControl CommutationControlInst4(.clk(clk), .UI(CCinw[11:9]), .HS(HS4[2:0]), .PT(PT[23:18]));

	
endmodule


