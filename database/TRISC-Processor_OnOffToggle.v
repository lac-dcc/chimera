// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

module OnOffToggle 
(
	input OnOff,IN,
	output OUT
);
reg state,nextstate;
parameter ON=1'b1,OFF=1'b0;
	always @ (negedge OnOff)
			state <= nextstate;
	always @ (state)
			case(state)
				OFF: nextstate = ON;
				ON: nextstate = OFF;
			endcase
	assign OUT = state*IN;
endmodule