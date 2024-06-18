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


//  MDIO - copyright 2010, 2011 Phil Harman VK6APH 




//
// NOTE: clk is a max of 2.5MHz

/*

Write Operation

			  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  
clock		--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  + /+  +--+  +----------


			-----------+	 +-----+     +-----------------------------------------------------------------+-----+     +------------------  ---------+
MDIO_inout      1      |  0  |  1  |  0  |  1  |  A4 |  A3 |  A2 |  A1 |  A0 |  R4 |  R3 |  R2 |  R1 |  R0 |  1  |  0  | D15 | D14 | D13 | /D1 |  D0 |Z---------
			           +-----+     +-----+     ------------------------------------------------------------+     +-----+------------------  ---------+
			 32 bit		
			preamble   |   start   |   write   |        PHY address          |      Register address       |     TA    |       Register Data         | Idle
			

Read Operation																										


			  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+----------  
clock		--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  +--+  + /+  +--+  


			-----------+	 +-----+-----+     +-----------------------------------------------------------+
MDIO_inout      1      |  0  |  1     1  |  0  |  A4 |  A3 |  A2 |  A1 |  A0 |  R4 |  R3 |  R2 |  R1 |  R0 |Z---------------------------------------------------  
			           +-----+           +-----------------------------------------------------------------+   
																													NOTE: data read on NEGATIVE clock edge
																													+---------------------  -----+
PHY            Z-----------------------------------------------------------------------------------------------	 0	| D15 | D14 | D13 |	  / | D0 |       
																											   -----+---------------------  -----+
			             
			 32 bit		
			preamble   |   start   |   read    |        PHY address          |      Register address       |  TA    |        Register Data       | Idle


To write to the PHY's extended registers  - Write to register 11 with 0x8xxx where xxx is hex address of extended register
									      - Write data to send to register xxx to register 12.
									   
To read from the PHY's extended registers - Write to register 11 with 0x0xxx where xxx is hex address of extended register
										  - Read from register 13



To write to the PHY registers, set write_PHY high and then wait for write done to go high then set write_PHY low.
To read from the PHYregister, set read_PHY high then wait for read_done to go high, then set read_PHY low. 
Register data is in register_data. 

Register 1 bit [5] is set when the Auto-negotiation process is complete. 
Final connection status is give in Register 31 as follows;

Register 31 bit [6] = 1000T, [5] = 100T, [4] = 10T, [3] = Full duplex 

The register data is latched once read_done goes high. 


*/





module MDIO (clk, write_PHY, write_done, read_PHY, clock, MDIO_inout, read_done, read_reg_address, register_data, speed);

input write_PHY;
input read_PHY;						// set high to read from Register @ register_address
input clk;							// Max of 2.5MHz 
input [4:0]read_reg_address;		// register address to read from
input speed;						// 0 = 100T, 1 = 1000T;

output clock;						// clock to PHY
output read_done;					// high when Register 1 data available
output [15:0]register_data;
output write_done;					// high when write done 

inout MDIO_inout;					// tristate pin to PHY

localparam data_size = 5; 			// Last RAM address ***** NOTE: vary RAM size if more/less data to be sent ******

reg MDIO;
reg [5:0] write;
reg [6:0] preamble;
reg [2:0] address;
reg [6:0] mask;
reg [4:0] REG_address[0:data_size];			
reg [15:0]REG_data[0:data_size];
reg [4:0] loop_count;
reg read_done;
reg write_done;
reg [15:0] temp_reg_data;			// holds the PHY register data whilst it is being shifted
reg previous_speed;


// Write Operation 
always @ (negedge clk)
begin
// set up address and data to send to the PHY
REG_address[0] <= 5'd9;  REG_data[0] <= {6'b0,speed,9'b0};	// Register 9 = 0x0000 for 100T and  0x0200 for 1000T
REG_address[1] <= 5'd11; REG_data[1] <= 16'h8104;		  	// Extended Register 260 (0x104) = 0x0000 - disable skew
REG_address[2] <= 5'd12; REG_data[2] <= 16'h0000;
REG_address[3] <= 5'd11; REG_data[3] <= 16'h8105;		  	// Extended Register 261 (0x105) = 0x0000 - disable skew
REG_address[4] <= 5'd12; REG_data[4] <= 16'h0000;
REG_address[5] <= 5'd0;  REG_data[5] <= 16'h1300;			// Register 0 = 0x1300 - Restart auto negotiation *** for testing  **** 1100 for normal 

case (write)

0:	begin
		if (write_PHY | (speed != previous_speed)) begin 	// run on a write command or speed change
			write_done <= 0;
			write <= 1;
		end 
		else begin
			MDIO <= 1'b0;
			address <= 0;
			write <= 0;
			loop_count <= 0;
			preamble <= 0;
		end 
	end
// send 32 bits of preamble	
1:  begin 
		if (preamble != 32) begin
			preamble <= preamble + 1'b1;
			MDIO <= 1'b1;
			write <= 1; 
		end
		else
		begin
			MDIO <= 1'b0;  // start sequence 0,1,0,1 
			write <= 2;
		end 
	end 
	
2:	begin
	MDIO <= 1'b1;
	write <= write + 1'b1;
	end
	
3:	begin 
	MDIO <= 1'b0;			// write  sequence
	write <= write + 1'b1;
	end

4:	begin
	MDIO <= 1'b1;
	write <= write + 1'b1;
	end
		
// now send PHY address 00001
5:	begin
	 if (address != 4) begin
		MDIO <= 0;
		address <= address + 1'b1;
		write <= 5;
	 end 
	 else begin
		MDIO <= 1'b1;
		mask <= 5;
		write <= write + 1'b1;
	 end
	 end 

// now send register address
6:	begin
		if (mask != 0) begin
			MDIO <= REG_address[loop_count][mask - 1'b1];
			mask <= mask - 1'b1;
			write <= 6;
		end 
		else begin
			MDIO <= 1'b1; // now send TA sequence 1,0
			write <= write + 1'b1;
		end 
	end
	
7:	begin
	MDIO <= 1'b0;
	mask <= 16;
	write <= write + 1'b1;
	end 
	
// now send Register Data
8:	begin
		if (mask != 0) begin
			MDIO <= REG_data[loop_count][mask - 1'b1];
			mask <= mask - 1'b1;
			write <= 8;
		end 
		else begin
			if (loop_count == data_size) begin						
				write_done <= 1'b1;
				previous_speed <= speed;				// save the current speed so if it changes we can reset PHY
				write <= 0;								// done so loop back to start 
			end
			else begin
				loop_count <= loop_count + 1'b1;
				address <= 0;						// reset PHY address counter
				preamble <= 0;  					// reset preamble counter
				write <= 1;							// send next addr & data
			end
		end 
	end
endcase
end 	
	
	
// Read Operation - read Register 1
reg [4:0]read;
reg [5:0]preamble2;
reg [4:0]read_count;
reg [2:0]address2;
reg [15:0]register_data;
reg [4:0]temp_address;
reg MDIO2;
always @(negedge clk)
begin 
case (read)	

0: begin 
	if (read_PHY)begin		// loop here until we get a read request
		address2 <= 0;
		read_done <= 0;		// clear read done flag
		read_count <= 0;
		preamble2 <= 0;
		read <= 1'b1;
		temp_address <= read_reg_address;
	end 
	else read <= 0;
   end 
//  first send the preamble
1:  begin 
		if (preamble2 != 32) begin
			preamble2 <= preamble2 + 1'b1;
			MDIO2 <= 1'b1;
			read <= 1; 
		end
		else
		begin
			MDIO2 <= 1'b0;  // start sequence
			read <= read + 1'b1;
		end 
	end 
	
2:	begin
	MDIO2 <= 1'b1;
	read <= read + 1'b1;
	end
	
3:	begin 
	MDIO2 <= 1'b1;			// read sequence
	read <= read + 1'b1;
	end

4:	begin
	MDIO2 <= 1'b0;
	read <= read + 1'b1;
	end 
	
// now send PHY address 00001
5:	begin
	 if (address2 != 4) begin
		MDIO2 <= 0;
		address2 <= address2 + 1'b1;
		read <= 5;
	 end 
	 else begin
		MDIO2 <= 1'b1;
		address2 <= 0;
		read <= read + 1'b1;
	 end
	 end 

// now send register address
6:	begin
	 if (address2 != 5) begin
		MDIO2 <= temp_address[4];
		temp_address <= {temp_address[3:0],1'b0};
		address2 <= address2 + 1'b1;
		read <= 6;
	 end 
	 else read <= read + 1'b1;
	end

//7: read <= read + 1'b1;							// delay to allow tristate to not clip this last 
													// address bit
	
7: begin	
	if (read_count != 17) begin 					// read 16 bits since the first is a 0 and ignored
		temp_reg_data <= {temp_reg_data[14:0],MDIO_inout};  // shift incoming data left
		read_count <= read_count + 1'b1;
	end 
    else begin 
		register_data <= temp_reg_data; 			// save the register data now it is stable.
		read_done <= 1'b1;
		read <= 0;
	end
   end
endcase
end 


assign clock = (write > 0   || read > 0) ? clk : 1'b0;
assign MDIO_inout  = (write > 0 ) ? MDIO : (read > 0 && read < 7 ? MDIO2 : 1'bZ); 

endmodule

