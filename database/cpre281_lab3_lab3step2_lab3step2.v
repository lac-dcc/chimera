// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module lab3step2 (Alarm, Cabbage, Goat, Wolf);
	input Cabbage, Goat, Wolf;
	output Alarm;
	
	assign Alarm = ((Cabbage|~Goat|Wolf)&(~Cabbage|Goat|~Wolf));
	
endmodule