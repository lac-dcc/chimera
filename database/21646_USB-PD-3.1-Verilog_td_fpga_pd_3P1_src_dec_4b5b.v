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

module dec_4b5b(
	
	input	[4 : 0]		din,
	output				kcode,
	output	[3 : 0]		dout
);
	
	reg		[3 : 0]		dout_c;
	reg					kcode_c;
	
	always@(*)begin
		case(din)
			5'b11110: dout_c = 4'd0;
			5'b01001: dout_c = 4'd1;
			5'b10100: dout_c = 4'd2;
			5'b10101: dout_c = 4'd3;
			5'b01010: dout_c = 4'd4;
			5'b01011: dout_c = 4'd5;
			5'b01110: dout_c = 4'd6;
			5'b01111: dout_c = 4'd7;
			5'b10010: dout_c = 4'd8;
			5'b10011: dout_c = 4'd9;
			5'b10110: dout_c = 4'hA;
			5'b10111: dout_c = 4'hB;
			5'b11010: dout_c = 4'hC;
			5'b11011: dout_c = 4'hD;
			5'b11100: dout_c = 4'hE;
			5'b11101: dout_c = 4'hF;
			// 1 XXXX
			5'b11000: dout_c = 4'd0; // sync-1
			5'b10001: dout_c = 4'd1; // sync-2
			5'b00111: dout_c = 4'd2; // rst-1
			5'b11001: dout_c = 4'd3; // rst-2
			5'b01101: dout_c = 4'd4; // eop
			5'b00110: dout_c = 4'd5; // sync-3
			default: dout_c = 4'd0;
		endcase
		
		case(din)
			5'b11000: kcode_c = 1'b1; // sync-1
			5'b10001: kcode_c = 1'b1; // sync-2
			5'b00111: kcode_c = 1'b1; // rst-1
			5'b11001: kcode_c = 1'b1; // rst-2
			5'b01101: kcode_c = 1'b1; // eop
			5'b00110: kcode_c = 1'b1; // sync-3
			default: kcode_c = 1'b0;
		endcase
	end
	
	assign dout  = dout_c;
	assign kcode = kcode_c;
	
endmodule
