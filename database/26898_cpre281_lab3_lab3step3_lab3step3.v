// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module lab3step3 (Alarm, Farmer, Cabbage, Goat, Wolf);
	input Farmer, Cabbage, Goat, Wolf;
	output Alarm;
	
	assign Alarm=(((~Farmer)&Goat&Wolf)|(Farmer&(~Cabbage)&(~Goat))|((~Farmer)&Cabbage&Goat)|(Farmer&(~Goat)&(~Wolf)));
	
endmodule