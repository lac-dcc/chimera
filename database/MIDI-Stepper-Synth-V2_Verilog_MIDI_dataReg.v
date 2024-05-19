// This program was cloned from: https://github.com/jzkmath/MIDI-Stepper-Synth-V2
// License: GNU General Public License v3.0

/*
MIDI_dataReg by Jonathan Kayne, February 2019
This module holds the information bytes of the MIDI message (note and velocity)
It is simply a register with an enable and clear.
*/
module MIDI_dataReg(Clk, in, en, clr, out);
	input [15:0] in;
	input clr, en, Clk;
	output reg [15:0] out;
	
	always @ (posedge Clk)
	begin
		if (clr == 1)
		begin
			out <= 16'b0;
		end
		else if (en == 1)
		begin
			out <= in;
		end
	end 

endmodule 