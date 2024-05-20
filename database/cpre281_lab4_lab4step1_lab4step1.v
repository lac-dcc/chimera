// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module lab4step1 (Alarm, Farmer, Cabbage, Goat, Wolf);
	input Farmer, Cabbage, Goat, Wolf;
	output Alarm; 
	reg Alarm;
	
	always @(Farmer, Cabbage, Goat, Wolf)
	begin
		case ({Farmer, Cabbage, Goat, Wolf})
			
			4'b0000: Alarm= 'b0;
			4'b0001: Alarm= 'b0;
			4'b0010: Alarm= 'b0;
			4'b0011: Alarm= 'b1;
			4'b0100: Alarm= 'b0;
			4'b0101: Alarm= 'b0;
			4'b0110: Alarm= 'b1;
			4'b0111: Alarm= 'b1;
			4'b1000: Alarm= 'b1;
			4'b1001: Alarm= 'b1;
			4'b1010: Alarm= 'b0;
			4'b1011: Alarm= 'b0;
			4'b1100: Alarm= 'b1;
			4'b1101: Alarm= 'b0;
			4'b1110: Alarm= 'b0;
			4'b1111: Alarm= 'b0;
		
		endcase
	end
	
	
endmodule

			
			