// This program was cloned from: https://github.com/jzkmath/MIDI-Stepper-Synth-V2
// License: GNU General Public License v3.0

/*
MIDI_dataRouter by Jonathan Kayne, February 2019
NNNNCCCC PPPPPPPP VVVVVVVV
*/

module MIDI_dataRouter(MIDI_data, Clk, Rst_n, dataOut, clrOut, enOut);
	input [23:0] MIDI_data;
	input Clk, Rst_n;
	output reg [15:0] dataOut;
	output reg [7:0] clrOut, enOut;
	reg Invalid;
	
	always @ (negedge Clk)
	begin
		if (Rst_n == 0) //clear registers if reset is pressed
		begin
			dataOut <= 16'b0;
			clrOut <= 8'hFF;
			enOut <= 8'b0;
		end
		else
		begin
		
		dataOut <= MIDI_data[15:0]; //transfer note and velocity to output bus
		
		enOut <= 8'b0;
		clrOut <= 8'b0;
		
		//depending on the channel, either enable or clear the register depending on the note on or off command
		case (MIDI_data[19:16])
			4'b0000: 
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[0] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[0] <= 1'b1;
			end
			4'b0001: 
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[1] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[1] <= 1'b1;
			end
			4'b0010:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[2] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[2] <= 1'b1;
			end
			4'b0011:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[3] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[3] <= 1'b1;
			end
			4'b0100:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[4] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[4] <= 1'b1;
			end
			4'b0101:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[5] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[5] <= 1'b1;
			end
			4'b0110:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[6] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[6] <= 1'b1;
			end
			4'b0111:
			if (MIDI_data[23:20] == 4'b1000)
			begin
				clrOut[7] <= 1'b1;
			end
			else if (MIDI_data[23:20] == 4'b1001)
			begin
				enOut[7] <= 1'b1;
			end
			default Invalid <= 1'bx;
		endcase
		end
	end
	
endmodule 