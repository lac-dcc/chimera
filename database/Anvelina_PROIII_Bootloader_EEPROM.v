// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII_Bootloader
// License: GNU General Public License v3.0

//
//  HPSDR - High Performance Software Defined Radio
//
//  BootLoader code. 
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


//  EEPROM - copyright 2010, 2011, 2012 Phil Harman VK6APH 

//  2102 Dec 27 - Fixed bug that caused incorrect MAC address to be read




// EEPROM read module. Clock is max of 10MHz to give 5MHz SCK

/*
	The data at address 0xFA to 0xFF of the 25AA02E48 contains
	the MAC address to be used by this board. Once the initial address is set it 
	auto-increments.
	
	
	Waveforms:
	
			   +-------+
	read   ----+       +-----------------------------------------------------------------------------------------------------------
	
			--------+																									   		  +------
	CS			    +--------------------------------------------------------------------------------------------  ||		 -----+
	
						0   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14   0   1   2   3   4   5   6   7      ----- 48   
					   +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   
	SCK     -----------+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+
	
	SI      --------+----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
					| 0	 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |A7 |A6 |A5 |A4 |A3 |A2 |A1 |A0 |   |   |   |   |   |   |   |   |   |
			--------+----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+  
					<--------read instruction-------><---------address--------------->
																			 		 +---+---+---+---+---+---+---+---+---+
	SO																				 |D7 |D6 |D5 |D4 |D3 |D2 |D1 |D0 | Next byte follows
			-------------------------------------------------------------------------+---+---+---+---+---+---+---+---+---+
																					 <-----------data out------------------------> 
																															     +-----------	
	ready   ---------------------------------------------------------------------------------------------------------------------+
 
 
	For write operations first use Write Enable Sequence (WREN)
 
 			   +-------+
	write  ----+       +----------------------------------------
	
			--------+									 +------
	CS			    +------------------------------------+
	
					    0   1   2   3   4   5   6   7     
					   +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 
	SCK     -----------+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+--------
	
	SI      --------+----+---+---+---+---+---+---+---+
					| 0	 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
			--------+----+---+---+---+---+---+---+---+ 
					<--------------WREN-------------->
 
 
	Then write the data 

	
			--------+																									   		  +------
	CS			    +--------------------------------------------------------------------------------------------  ||		 -----+
	
						0   0   1   2   3   4   5   6   7   8   9  10  11  12  13  14   0   1   2   3   4   5   6   7      ----- 32   
					   +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+   
	SCK     -----------+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+
	
	SI      --------+----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+
					| 0	 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |A7 |A6 |A5 |A4 |A3 |A2 |A1 |A0 |D7 |D6 |D5 |D4 |D3 |D2 |D1 |D0 | Next byte
			--------+----+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+  
					<--------write instruction-------><---------address--------------><---------data------------------------------>

 
 	Followed by Write Disable Sequence (WRDI) *** automatically set following a Write so not required 
 
	
			--------+									 +------
	CS			    +------------------------------------+
	
					    0   1   2   3   4   5   6   7     
					   +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 
	SCK     -----------+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+--------
	
	SI      --------+----+---+---+---+---+---+---+---+
					| 0	 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
			--------+----+---+---+---+---+---+---+---+ 
					<--------------WRDI-------------->
 
 														  +-----	
	ready   ----------------------------------------------+

 
*/

module EEPROM (clock, read_MAC, read_IP, write_IP, IP_to_write, CS, SCK, SI, SO, This_MAC, This_IP, MAC_ready, IP_ready, IP_write_done);

input clock;
input SO;
input read_MAC;
input read_IP;
input write_IP;
input [31:0] IP_to_write;	// IP address to save

output CS;
output SI;
output SCK;
output [47:0]This_MAC;
output [31:0]This_IP;
output MAC_ready;
output IP_ready;
output IP_write_done;


reg CS = 1'b1;
reg SCK;
reg SI;
wire SO;
reg [5:0]shift_count;
reg [15:0]EEPROM_read; 
reg [47:0]EEPROM_write;
reg [7:0]EEPROM_write_enable;
reg [3:0]EEPROM;
reg [47:0]This_MAC;
reg [31:0]This_IP;
reg MAC_ready;					// high when we have a MAC address available
reg IP_ready;					// high when we have an IP address available
reg IP_flag;					// set when we are processing an IP request
reg IP_write_done;				// set when IP address has been written to memory

localparam	WREN = 8'h06;

always @ (posedge clock)
begin 
	case (EEPROM)
	0:	begin
		shift_count <= 0; 							// reset shift counter
		IP_flag <= 0;								// reset IP flag
		MAC_ready <= 0;								// reset ready flags
		IP_write_done <= 0;
		IP_ready  <= 0;
			if (read_MAC) begin 					// loop until we get a command
				EEPROM_read <= 16'h03FA; 			// set read address where MAC is located
				CS <= 0;
				SI <= EEPROM_read[15];
				EEPROM <= 1;
			end
			else if (read_IP) begin
				This_IP <= 0;
				EEPROM_read <= 16'h0300;			// set read address where IP is located
				CS <= 0;
				SI <= EEPROM_read[15];
				IP_flag <= 1'b1;					// indicate we are processing an IP request
				EEPROM <= 1;
			end
			else if (write_IP) begin				// write enable memeory
				EEPROM_write_enable <= WREN;		// only need 8 bits for WREN
				CS <= 0;
				SI <= EEPROM_write_enable[7];
				EEPROM <= 6;
			end 
			else EEPROM <= 0;
		end 
	// send the address out
	1:  begin
		SCK <= 1;
		EEPROM_read <= {EEPROM_read[14:0],1'b0};    // shift left for next bit
		EEPROM <= EEPROM + 1'b1;
		end 
	2:	begin
		SCK <= 0;									// toggle clock 		
			if (shift_count != 15) begin			// Count to 15 since bit 0 was available at state 0
				SI <= EEPROM_read[15];				// SI data needs to be available on negative edge of SCK
				shift_count <= shift_count + 1'b1;	
				EEPROM <= 1;
				end
			else begin
				shift_count <= 0;
				EEPROM <= EEPROM + 1'b1;   
			end 
		end 
	// now read the MAC or IP data from the EEPROM
	3:	begin 
			if (IP_flag) begin 
				if (shift_count != 32) begin 			// ++++ why does this work - should be 33? 
					This_IP <= {This_IP[30:0],SO};
					shift_count <= shift_count + 1'b1;
					EEPROM <= EEPROM + 1'b1;
					SCK <= 1'b1;
				end
				else begin
					IP_ready <= 1'b1;				// set read flag
					CS <= 1'b1;
					EEPROM <= 5;					// done so delay then back to start
				end
			end

			else if (shift_count != 48) begin 
				This_MAC <= {This_MAC[46:0],SO};
				shift_count <= shift_count + 1'b1;
				EEPROM <= EEPROM + 1'b1;
				SCK <= 1'b1;
			end
			else begin
				MAC_ready <= 1'b1;					// set ready flag
				CS <= 1'b1;							// set CS high to indicate end of command
				EEPROM <= 5;						// done so delay then back to start
			end 
		end
	// toggle clock	
	4:  begin
		SCK <= 0;
		EEPROM <= 3; 
		end 
		
	// delay so calling program has time to see ready flags, then back to start
	5:	EEPROM <= 0;
	
	
	// send WREN out
	6:  begin
		SCK <= 1;
		EEPROM_write_enable <= {EEPROM_write_enable[6:0],1'b0};    // shift left for next bit
		EEPROM <= EEPROM + 1'b1;
		end 
	7:	begin
		SCK <= 0;									// toggle clock 		
			if (shift_count != 7) begin				// Count to 7 since bit 0 was available at state 0
				SI <= EEPROM_write_enable[7];		// SI data needs to be available on negative edge of SCK
				shift_count <= shift_count + 1'b1;	
				EEPROM <= 6;
				end
			else begin
				shift_count <= 0;					// reset shift count for next state
				CS <= 1'b1;							// set CS high to indicate end of command
				EEPROM <= EEPROM + 1'b1;   
			end 
		end 
	// leave CS high for a bit longer	
	8:	EEPROM <= EEPROM + 1'b1;
	
	// write IP address to memory
	9: 	begin
		EEPROM_write <= {16'h0200,IP_to_write};		// set write command, address where IP is located and IP address to write
		CS <= 0;
		SI <= EEPROM_write[47];
		EEPROM <= EEPROM + 1'b1;
		end
		
	10:  begin
		SCK <= 1;
		EEPROM_write <= {EEPROM_write[46:0],1'b0};    // shift left for next bit
		EEPROM <= EEPROM + 1'b1;
		end
		 
	11:	begin 
		SCK <= 0;									// toggle clock		
			if (shift_count != 47) begin			// Count to 47 since bit 0 was available at state 8
				SI <= EEPROM_write[47];				// SI data needs to be available on negative edge of SCK
				shift_count <= shift_count + 1'b1;	
				EEPROM <= 10;
				end
			else begin
				shift_count <= 0;
				CS <= 1'b1;							// set CS high to indicate end of command
				IP_write_done <= 1'b1;				// set write done flag
				EEPROM <= 5; // EEPROM + 1'b1;   
			end 
		end 	

	
	
	default: EEPROM <= 0; 
 endcase
 end 

 
 endmodule
 
 