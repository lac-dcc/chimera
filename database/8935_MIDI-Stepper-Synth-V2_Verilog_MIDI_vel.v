// This program was cloned from: https://github.com/jzkmath/MIDI-Stepper-Synth-V2
// License: GNU General Public License v3.0

/*
MIDI_vel by Jonathan Kayne, December 2018
This module controls how many stepper motors recieve the clock signal.
Depending on the Velocity value (volume), the module will pass the signal to 0-4 Stepper Motors
Velocity can be between 0 and 127, where 0 is OFF, and 1-127 are the volume ranges for a different amount.
*/
module MIDI_vel(velocity, FM_in, ChA, ChB, ChC, ChD, Clk);
	input [7:0] velocity; //the MIDI data
	input Clk, FM_in; //the FM signal from StepperFM.v
	output ChA, ChB, ChC, ChD; //the 4 outputs
	reg EnA, EnB, EnC, EnD; //Enable states
	//reg Invalid = 1'b0;
	
	assign ChA = FM_in & EnA;
	assign ChB = FM_in & EnB;
	assign ChC = FM_in & EnC;
	assign ChD = FM_in & EnD;
	
	always @ (posedge Clk)
	begin
		if (velocity == 0) //Note OFF
		begin
			EnA <= 1'b0;
			EnB <= 1'b0;
			EnC <= 1'b0;
			EnD <= 1'b0;
		end
		else if ((velocity >= 1) & (velocity <= 31)) //1 Stepper
		begin
			EnA <= FM_in;
			EnB <= 1'b0;
			EnC <= 1'b0;
			EnD <= 1'b0;
		end
		else if ((velocity >= 32) & (velocity <= 63)) //2 Steppers
		begin
			EnA <= FM_in;
			EnB <= FM_in;
			EnC <= 1'b0;
			EnD <= 1'b0;
		end
		else if ((velocity >= 64) & (velocity <= 95)) //3 Steppers
		begin
			EnA <= FM_in;
			EnB <= FM_in;
			EnC <= FM_in;
			EnD <= 1'b0;
		end
		else if ((velocity >= 96) & (velocity <= 127)) //4 Steppers
		begin
			EnA <= FM_in;
			EnB <= FM_in;
			EnC <= FM_in;
			EnD <= FM_in;
		end
		//else Invalid = 1'bx; //this shouldn't ever happen!
	end
	
endmodule
