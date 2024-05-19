// This program was cloned from: https://github.com/jzkmath/MIDI-Stepper-Synth-V2
// License: GNU General Public License v3.0

/*Imagine that the baud rate you want to work with is 9600. The clock of my
FPGA is 50MHz. If we want the "TICKS" to ahev 16 times the frequency of the UART signal
we need a frequency 16 times the 9600Hz. 
The width of the UART signal is 1/9600 equal to 104us. The width of the main clock is 1/50Mhz equal to 20ns
How many 20ns pulses we need to cont to get to 104us/16??? Well (104000ns/16)/ 20ns = 325 pulses (
That's why in the top we set baud rate to 325)
*/
module MIDI_BaudRate_generator(
    Clk                   ,
    Rst_n                 ,
    Tick                  ,
    BaudRate
    );

input           Clk                 ; // Clock input
input           Rst_n               ; // Reset input
input [15:0]    BaudRate            ; // Value to divide the generator by
output  reg        Tick                ; // Each "BaudRate" pulses we create a tick pulse
reg [15:0]      baudRateReg         ; // Register used to count


always @(posedge Clk or negedge Rst_n)
begin
    if (!Rst_n) baudRateReg <= 16'b0;
	 else begin
		 if (baudRateReg <= BaudRate) baudRateReg <= baudRateReg + 1'b1;
		 else
		 begin
			baudRateReg <= 16'b0;
			Tick <= ~Tick;
		 end
	 end
end
endmodule
/*
module StepperFM(Clk, Pitch, FM_out);
	input Clk; //50MHz Clock
	input [23:0] Pitch; //from MIDI_PitchConv.v
	output reg FM_out; //the square wave out
	reg [23:0] counter; //to count the number of clock cycles
	
	always @ (posedge Clk)
	begin
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
	
endmodule */