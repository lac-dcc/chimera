// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module decoder2_4 (in, out);//declaring module
	input [1:0] in; //2 bit input signal in
	output reg [3:0] out; //4 bit output signal out

	always @ (in) //start of always block
	begin
		case (in) //if input is whatever is written on the left side of the statement, then the output is what is written on the right side
			2'b00: out = 4'b0001;
			2'b01: out = 4'b0010;
			2'b10: out = 4'b0100;
			2'b11: out = 4'b1000;
			default: out = 4'b0000; //if input is invalid, 0000is assigned to the output	
		endcase //endcase of statement		
	end //end of always block
endmodule //end of module definition