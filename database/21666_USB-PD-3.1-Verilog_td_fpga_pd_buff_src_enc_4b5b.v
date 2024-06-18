// This program was cloned from: https://github.com/briansune/USB-PD-3.1-Verilog
// License: MIT License

//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 


`timescale 1ns/1ps

module enc_4b5b(
	
	input	[3 : 0]		din,
	input				ext_sel,
	output	[4 : 0]		dout
);
	
	reg		[4 : 0]		lut_4b5b	[0 : 21];
	
	initial begin
		lut_4b5b[0]  <= 5'b11110;
		lut_4b5b[1]  <= 5'b01001;
		lut_4b5b[2]  <= 5'b10100;
		lut_4b5b[3]  <= 5'b10101;
		lut_4b5b[4]  <= 5'b01010;
		lut_4b5b[5]  <= 5'b01011;
		lut_4b5b[6]  <= 5'b01110;
		lut_4b5b[7]  <= 5'b01111;
		lut_4b5b[8]  <= 5'b10010;
		lut_4b5b[9]  <= 5'b10011;
		lut_4b5b[10] <= 5'b10110;
		lut_4b5b[11] <= 5'b10111;
		lut_4b5b[12] <= 5'b11010;
		lut_4b5b[13] <= 5'b11011;
		lut_4b5b[14] <= 5'b11100;
		lut_4b5b[15] <= 5'b11101;
		// 1 XXXX
		lut_4b5b[16] <= 5'b11000; // sync-1
		lut_4b5b[17] <= 5'b10001; // sync-2
		lut_4b5b[18] <= 5'b00111; // rst-1
		lut_4b5b[19] <= 5'b11001; // rst-2
		lut_4b5b[20] <= 5'b01101; // eop
		lut_4b5b[21] <= 5'b00110; // sync-3
	end
	
	assign dout = lut_4b5b[{ext_sel, din}];
	
endmodule
