// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

// Apollo  SPI interface - 
// (C) 2011 Phil Harman VK6APH, Dave McQuate WA8YWQ

//
//  HPSDR - High Performance Software Defined Radio
//
//  Hermes code. 
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

/*
	
	Apollo Reset
	
	SCLK       +------------------------------------------------------------------------------------------------+
		   +----+                                                                                                
	
	Reset  ------------+                                                            +---------------------------+
					       +------------------------------------------------------------+
					       < --------------------------5 mS ---------------------------->
	

	Protocol - set Frequency
	
	
	SCLK  	            +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+      +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+
			        -------+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +    --+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--
					 <15kHz>
	
	Enable    ----+																																										                                           +---
				     +--------------------------------------------------------------------------------------------------------   --------------------------------------------------------------+
				
    STATUS	 --+				    																																						                                          +---
			      +----------------------------------------------------------------------------------------------------------   -------------------------------------------------------------+
				
	
	MOSI     --------+----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+    +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+                
					     | 1  |  0  |  0  |  0  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  1  |  X  |    |  X  |  X  |  X  |  X  |  X  |  X  |  X  |  X  |  X  |  X  |       
	         --------+----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+    +-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
					     <--------------- Sync Byte 0x88 --------------> <---------------- Message ID (0x01) ----------> <--------------------------- frequency -------------------------------> 
	
	
*/
// This module provides the communication between Hermes and Apollo
// Dave McQuate  WA8YWQ
// January 4, 2011

// 4 July 2012 - sync byte changed from 0x80 to 0x88 by Espen to match previous USB version
// 6 Jan  2013 - modified PTT timer code. Removed ATU commands since not yet implemented in Apollo uP code. Phil Harman VK6APH
//             - removed read of Apollo status since not yet implemented in Apollo uP code. VK6APH 

// To do:
	// Additional capabilities to be added:
	// status query
	// version query
	// tuner settings query
	
module Apollo (reset, clock, frequency, timeout, PTT, Filter, Tuner, ANT_TUNE, 
	SPI_SDI, SPI_SDO, SPI_SCK, ApolloStatusLine, ApolloReset, ApolloEnable, statusAvailable, status, FilterSelect);
input reset;			  		// do nothing while reset is high; reset Apollo for 5ms when reset drops low
input clock;					// 30 kHz
input [31:0] frequency;
input [15:0] timeout;
input PTT;						// enable PA bias
input Filter;					// enable filter bank
input Tuner;					// enable antenna tuner
input ANT_TUNE;				// start tuning cycle

input SPI_SDI;					// receive serial data from Apollo
output SPI_SDO;				// send serial data, MOSI,  to Apollo
output SPI_SCK;				// serial data clock, SCLK, nominally 15 kHz
input  ApolloStatusLine;	// Apollo sets it low when it wants to send data to Hermes
output ApolloReset;			// reset Apollo uC (active low)
output ApolloEnable;
output statusAvailable;		// Flag set when status bytes have been received from Apollo
output [87:0] status;		// Status info returned by Apollo after it receives a message
input FilterSelect;			// high => use Alex,   low => use Apollo

reg SPI_SDO;
reg SPI_SCK;
reg ApolloReset = 1'b1;
reg ApolloEnable = 1'b1;
reg statusAvailable;
reg [87:0] status;

parameter ClockFrequency = 30000;

localparam resetCount = ClockFrequency * 5 / 1000;		// At 30kHz clock freq, 150 clocks = 5 ms
//localparam resetCount = 7'd10;		// #### smaller value for simulation

reg [7:0] resetCounter;
reg [31:0] lastFrequency;
reg lastPTT;
reg lastFilter;
reg lastTuner;
reg lastTuneStart;
reg [4:0] state;

reg [4:0] count;				// count both rising & falling edges of SPI_SCK for 16 data bits
reg [15:0] message;			// simple commands: left byte = 8'h88, right byte = message ID
reg [7:0] statusCount;		// count edges of SPI_SCK while reading status bytes from Apollo
reg [4:0] msCount;			// This counter and timeoutCount together
reg [15:0] timeoutCount;	// are used to extend PTT enable when input PTT remains high
reg renewPTT;

// values for state:
localparam	RESET = 			5'd0,
			RESET_APOLLO =		5'd1,
			INIT =				5'd2,
			WAIT =				5'd3,				
			SIMPLE_MESSAGE =	5'd4,
			RECEIVE_STATUS =	5'd5,
			
			SET_FREQUENCY =	5'd6,			// send sync & message_id
			LOAD_FREQ1 =		5'd7,			//	load freq word 1
			SEND_FREQ1 =		5'd8,			//	send freq word 1
			LOAD_FREQ2 =		5'd9,			//	load freq word 2
			SEND_FREQ2 =		5'd10,		//	send freq word 2
			GET_FREQ_STATUS =	5'd11,		//	get status after frequency setting
			
			ENABLE_PTT =		5'd12,		//	send sync & message_id
			LOAD_TIMEOUT =		5'd13,		//	load timeout value
			SEND_TIMEOUT =		5'd14,		//	send timeout value
			PTT_STATUS =		5'd15,		//	get status after enabling PTT

			READ_STATUS =		5'd16,
			Alex = 				5'd31;		// Apollo not present:  don't touch SPI lines
			
// Nominal clock frequency is 30 kHz.  PTT timeout is is milliseconds.
// As long as PTT continues to be high, we need to send additional 
// enable PTT message before Apollo's PTT timeout expires.
// These enable PTT message should be sent before the timeout expires,
// but not too frequently.  			
			
			
always @ (posedge clock)
begin
	if (reset) begin
		state <= RESET;
		renewPTT <= 0;
		timeoutCount <= 0;
	end
	// else if (FilterSelect) state <= Alex;  	//	if FilterSelect is high, Apollo is not present
	else if (PTT) begin
		if (timeoutCount >= 16'd6000) begin    // 6000 renews PTT approx every 250mS with 30kHz clock.
				renewPTT <= 1;	// set flag indicating we need to renew enable PTT
		end
		else 	timeoutCount <= timeoutCount + 1'b1;
	end
	
case(state)
Alex:	begin
		end
		
RESET:	begin
	    ApolloReset <= 1'b1;
	    ApolloEnable <= 1'b1;
		SPI_SCK     <= 1;		// Hold SPI clock high
		resetCounter <= 0;
		if (!reset) state <= RESET_APOLLO;
		end

RESET_APOLLO: begin
		ApolloReset <= 0;					// reset Apollo uP
		SPI_SCK     <= 1;					// keeping SPI clock high #### do I need this???
		if (resetCounter == resetCount) state <= INIT;
		resetCounter <= resetCounter + 1'b1;
		end
		
INIT:	begin
			ApolloReset <= 1'b1;					// end of Apollo uP reset
			ApolloEnable <= 1'b1;				// active low
			lastFrequency <= frequency;		// set initial state...
			lastPTT <= 0;
            lastFilter <= 0;
			lastTuner  <= 0;
			lastTuneStart <= 0;
			state <= WAIT;
		end
	
WAIT:	begin
		SPI_SCK <= 0;									// SPI clock to idle state
		ApolloEnable <= 1'b1;						// set to inactive
		count <= 0;
		if (frequency != lastFrequency) begin	// might want to exclude a few low bits in the comparison???
			message <= 16'h8801;						// If frequency changed, send new value
			state <= SET_FREQUENCY; 
			ApolloEnable <= 1'b0;
			lastFrequency <= frequency;
		end
		else if ( (PTT != lastPTT)  || renewPTT ) begin  // send enable PTT message
			   if (renewPTT) begin
					timeoutCount <= 0;
					renewPTT <= 0;
				end				
				if (PTT) begin
					message <= 16'h8802;				//  enable PTT has timeout parameter
					state <= ENABLE_PTT;
				end
				else begin
					message <= 16'h8803;				// disable PTT has NO parameter
					state <= SIMPLE_MESSAGE;
				end
				ApolloEnable <= 1'b0;
				lastPTT <= PTT;
		end
//		else if (Filter != lastFilter) begin		// If there's a change, send filter enable or disable message
//				lastFilter <= Filter;
//				if (Filter) 	message <= 16'h8804;
//				else 			message <= 16'h8805;
//				state <= SIMPLE_MESSAGE;
//				ApolloEnable <= 1'b0;
//				lastFilter <= Filter;
//		end
//		else if (Tuner != lastTuner) begin			// If there's a change, send tuner enable or disable message
//				lastTuner <= Tuner;
//				if (Tuner) 		message <= 16'h8806;
//				else			message <= 16'h8807;
//				state <= SIMPLE_MESSAGE;
//				ApolloEnable <= 1'b0;
//				lastTuner <= Tuner;
//		end
//		else if (ANT_TUNE != lastTuneStart) begin	// when requested, begin auto-tuning
//				lastTuneStart <= ANT_TUNE;
//				if (ANT_TUNE)	message <= 16'h8808;	// start tuning cycle
//				else			message <= 16'h8809;		// abort tuning cycle
//				state <= SIMPLE_MESSAGE;
//				ApolloEnable <= 1'b0;
//				lastTuneStart <= ANT_TUNE;
//		end
		else	state <= WAIT;
end

// all commands to Apollo begin with h88 sync byte + message ID byte
// This section sends the 16 bit value in message out on SPI_SDO, high bit first.
// First, the 16 bit value is a sync byte and a message ID.
// Thereafter it might be the high or low word of the frequency, or the value of timeout.
// When done, this section increments state.
// Before entering, set count to zero.  SPI_SCK is low (idle).
// After exiting, SPI_SCK should be set low.

SIMPLE_MESSAGE, SET_FREQUENCY, ENABLE_PTT, SEND_FREQ1, SEND_FREQ2, SEND_TIMEOUT: begin
	if (!count[0]) begin			// on even counts, but new bit onto SPI_SDO
		SPI_SDO <= message[15];
		SPI_SCK <= 0;				// and set clock low
		state <= state;
	end
	else begin
		SPI_SCK <= 1;
		message <= {message[14:0], 1'b0};
		if (count == 5'd31) begin
			state <= state + 1'b1;			// still need to set SPI_SCK low
			count <= 0;
		end
		else state <= state;
	end
	count <= count + 1'b1;
end

// send current frequency, low byte first
LOAD_FREQ1: begin
	SPI_SCK <= 0;
	message <= { frequency[7:0], frequency[15:8] };
	state <= SEND_FREQ1;
end

LOAD_FREQ2: begin
	SPI_SCK <= 0;
	message <= { frequency[23:16], frequency[31:24] };
	state <= SEND_FREQ2;
end

// send timeout value (in ms), low byte first
LOAD_TIMEOUT: begin
	SPI_SCK <= 0;
	message <= { timeout[7:0], timeout[15:8] };
	state <= SEND_TIMEOUT;
end
	

// "Normal" status returned from Apollo is --
// frequency	uint32
// PTT status	byte
// PTT timeout	uint16
// LPF status	byte
// ATO status	byte

// "Version" data returned --
// protocol		byte
// firmware rev	byte, byte, byte
// hardware rev	byte


RECEIVE_STATUS, GET_FREQ_STATUS, PTT_STATUS:		// now don't need to retain separate sequences of states
begin
	SPI_SCK <= 0;				// return SPI clock to idle state
	state <= WAIT;
	
//	if (ApolloStatusLine == 1'b0) begin	// wait for ApolloStatus line to go low
//		statusCount <= 0;			// final count 8'd144;
//		state <= WAIT;
///* -----\/----- EXCLUDED -----\/-----
//		state <= READ_STATUS;
//	-----/\----- EXCLUDED -----/\----- */
//	end
//	else state <= state;
end

// For each bit to be read from Apollo, set SPI_SCK high.
// Read the value sent while setting SPI_SCK low.
//READ_STATUS:
//begin	
//	if (statusCount[0] == 1'b0) begin
//		SPI_SCK <= 1'b1;
//	end
//	else begin
//		SPI_SCK <= 1'b0;
//		status <= { status[86:0], SPI_SDI }; 	// read SPI_SDI when setting SPI_SCK low; repeat for 88 bits; store all in single buffer
//		if (statusCount == 8'd177) begin			// test value = number of bits * 2 + 1 (value must be odd)
//			statusAvailable <= 1'b1;
//			state <= WAIT;								// all done; wait for next change
//		end
//	end
//	statusCount <= statusCount + 1'b1;
//end
default: state <= RESET;

endcase
	

end


/* SIMPLE_MESSAGE SEND TIMING DIAGRAM

		clock rising edges
	   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |   |
count 0   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  ...
SDO   x   m15     m14     m13     m12     m11     m10     m9      m8      ...
SCK   0   0   1   0   1   0   1   0   1   0   1   0   1   0   1   0   1   0   1   0   1

*/


/*
Note:
Default (i.e. at power up) filter bank and antenna tuner are both disabled
*/
endmodule
