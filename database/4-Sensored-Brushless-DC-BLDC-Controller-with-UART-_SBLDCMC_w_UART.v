// This program was cloned from: https://github.com/SimNabong/4-Sensored-Brushless-DC-BLDC-Controller-with-UART-
// License: MIT License

/*This is the Top Entity Module which contains 7 modules: the UARTReceiver, EightBit_to_SBLDCCommutation, BaudControl, UARTReceiverStateMachine, Eight_Bit_Parity_Checker, Diverging8bit and CommutationControl module 
	The purpose of this module is to connect the top entity modules EightBit_to_SBLDCCommutation and UARTReceiver
*/
module SBLDCMC_w_UART(
	input Rx_in, //Receiver Input from Transmitter
	input clk, //external 50Mhz clk
	input reset, //User reset input
	input [2:0]BC, //user baud rate control selection (~B3&~B2&B1)?9'd217:(~B3&B2&~B1)?9'd109:(~B3&B2&B1)?9'd72:(B3&~B2&~B1)?9'd36:9'd434;
	input [2:0]HS1,HS2,HS3,HS4, //3 HALL SENSOR SIGNALS FROM each MOTOR
	output Mreset, //sends a reset signal to the transmitter
	output [23:0]PT
	
);
	
	
	wire [7:0]DataOutw;
	wire Rx_clkw;

	
	UARTReceiver UARTReceiverInst(.Rx_in(Rx_in), .clk(clk), .reset(reset), .BC(BC), .DataOut(DataOutw), .Mreset(Mreset), .Rx_clkw(Rx_clkw));	

	EightBit_to_SBLDCCommutation EightBit_to_SBLDCCommutationInst(.In(DataOutw), .clk(Rx_clkw), .HS1(HS1), .HS2(HS2), . HS3(HS3), .HS4(HS4), .PT(PT));



endmodule
