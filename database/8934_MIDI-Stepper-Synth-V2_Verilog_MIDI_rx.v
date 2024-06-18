// This program was cloned from: https://github.com/jzkmath/MIDI-Stepper-Synth-V2
// License: GNU General Public License v3.0

/*
MIDI_rx By Jonathan Kayne / Electronoobs, December 2018
This module actually reads the MIDI serial data. It uses a FSM to shift in the MIDI message.
It only does one byte of data.
*/
module MIDI_rx (Clk, Rst_n, RxData, read_enable, Rx, State);	

	input Clk, Rst_n, Rx;
	
	output read_enable, State;
	output reg [7:0] RxData;

	parameter IDLE = 1'b0; 
	parameter READ = 1'b1;
	reg State;
	reg read_enable = 1'b0;
	reg start_bit = 1'b1;
	reg RxDone = 1'b1;
	reg [4:0] Bit = 5'b0;
	reg [11:0] counter = 12'b0;
	reg [7:0] Read_data = 8'b0; //holds the bits during read

	assign Tstate = State; //for debug, shows if the state is IDLE or READ


	always @ (posedge Clk)
	begin
		if (Rst_n == 1'b0)
		begin
			State <= IDLE;
		end
		else begin
			case(State)	
				IDLE:	if(Rx == 1'b0)		
				begin
					State <= READ;	 //If Rx is low (Start bit detected) we start the read process
				end
				else begin
					State <= IDLE;
				end
				READ:	if(RxDone == 1'b1)
				begin
					State <= IDLE; 	 //If RxDone is high, than we get back to IDLE and wait for Rx input to go low (start bit detect)
				end
				else begin
					State <= READ;
				end
				default begin
					State <= IDLE;
				end
			endcase
		end
	end

	always @ (State)
	begin
		case (State)
			READ: 
			begin
				read_enable = 1'b1;			//If we are in the Read state, we enable the read process so in the "Tick always" we start getting the bits
	      end
	
			IDLE: 
			begin
				read_enable = 1'b0;			//If we get back to IDLE, we desable the read process so the "Tick always" could continue without geting Rx bits
	      end
		endcase
	end 


	always @ (posedge Clk)
	begin
		if (read_enable)
		begin
			RxDone <= 1'b0;							//Set the RxDone register to low since the process is still going
			counter <= counter + 1'b1;						//Increase the counter by 1 with each Tick detected
	

			if ((counter == 12'd800) & (start_bit))				//Counter is 8? Then we set the start bit to 1. 
			begin
				start_bit <= 1'b0;
				counter <= 12'b0;
			end

			if ((counter == 12'd1600) & (!start_bit) & (Bit < 4'b1000))	//We make a loop (8 loops in this case) and we read all 8 bits
			begin
				Bit <= Bit + 1'b1;
				Read_data <= {Rx,Read_data[7:1]};
				counter <= 12'b0;
			end
	
			if ((counter == 12'd1600) & (Bit == 4'b1000) & (Rx == 1'b1))		//Then we count to 16 once again and detect the stop bit (Rx input must be high)
			begin
				Bit <= 12'b0;
				RxDone <= 1'b1;
				counter <= 4'b0000;
				start_bit <= 1'b1;						//We reset all values for next data input and set RxDone to high
				RxData[7:0] <= Read_data[7:0];	
			end
		end
	end

endmodule

