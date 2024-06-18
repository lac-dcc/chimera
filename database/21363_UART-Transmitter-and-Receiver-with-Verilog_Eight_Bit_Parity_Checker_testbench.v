// This program was cloned from: https://github.com/SimNabong/UART-Transmitter-and-Receiver-with-Verilog
// License: MIT License

//Parity Bit checker that checks if the data with a given parity bit matches its parity bit
module Eight_Bit_Parity_Checker(
	input [8:0]data, //9 bits with the data[8](the MSB) being the parity bit
	output [7:0]DataOut //outputs the 8-bits if parity matches
);
	assign DataOut = (^data[7:0] == data[8])?data:8'd0;
	
endmodule
