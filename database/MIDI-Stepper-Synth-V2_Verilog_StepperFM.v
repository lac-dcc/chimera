/*
StepperFM by Jonathan Kayne, December 2018
This module takes the Pitch value from MIDI_PitchConv and uses it to modulate a pin. 
It counts a number of clock cycles before changing the state of the pin.
This is basically how you blink an LED in Verilog.
*/
module StepperFM(Clk, Pitch, FM_out, VelIn, VelOut);
	input Clk; //50MHz Clock
	input [23:0] Pitch; //from MIDI_PitchConv.v
	input [7:0] VelIn;
	output reg [7:0] VelOut;
	output reg FM_out; //the square wave out
	reg [23:0] counter; //to count the number of clock cycles
	
	always @ (posedge Clk)
	begin
		VelOut = VelIn;
		if (Pitch != 0) //only perform for nonzero pitch values
		begin
			if (counter <= Pitch) 
			begin
				counter <= counter+1; //increment counter 
			end
			else //when reaches the desired number of clock cycles...
			begin
				counter <= 0; //reset counter
				FM_out <= ~FM_out; //toggle state
			end
		end
	end
	
endmodule 