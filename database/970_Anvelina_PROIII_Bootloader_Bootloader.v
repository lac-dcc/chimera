// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII_Bootloader
// License: GNU General Public License v3.0

//
//  HPSDR - High Performance Software Defined Radio
//
//  Hermes BootLoader code. 
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


// Bootloader  V1.0 - copyright 2010, 2011 Phil Harman VK6APH 




/* 29 October  2011 - Boot Loader Programmer code for Hermes board - Phil Harman VK6APH 

 In Altera terms this code is the 'Factory' code and the Hermes code the 'Application'.

 fmax for RemoteUpdate using a Cyclone III is 40MHz

 When using Active Serial the Factory program is located in the EPCS16 starting at address 0x00000000
 If MODE1 is grounded then stay in Factory mode, if high then load Application code at address 0x00100000. 

 Need to select Settings > Device > Device & Pin Options > Configuration > Configuration Mode = Remote.

 The factory code can be tested by itself by just loading Factory.pof rather than output_file.pof which contains both 
 Factory and Application code. 

 If either the Factory or Application code changes then the output_file.pof must be regenerated. The settings for 
 output_file.pof can be saved in a *.cof file using the Convert Programming Files utility. The utility can then be used to read 
 the *.cof file and set up the files and parametes to create the output_file.pof.


 								***** IMPORTANT **** 
 								
 Once the EPCS has been write protected then it can't be programmed using the AS port.
 Use the JTAG port to remove the write protection. 
 If you write protect a sector then you must remove the write protection, using JTAG, before the bulk erase 
 can be used.
 
 Since the EPSC16 is a flash device it is only possible to convert a 1 to a 0. In which case it is necessary
 to erase a memory location before writing to it.
 
	EPCS16 
	
	Bytes 				= 2M
	Sectors				= 32
	Bytes per sector 	= 65k
	Pages per sector 	= 256
	Number of pages  	= 8192
	Bytes per page   	= 256
	
	Address Range (Byte Addresses in HEX)
	Sector	Start    End
	31 		H'1F0000 H'1FFFFF
	30 		H'1E0000 H'1EFFFF
	29 		H'1D0000 H'1DFFFF
	28 		H'1C0000 H'1CFFFF
	27 		H'1B0000 H'1BFFFF
	26 		H'1A0000 H'1AFFFF
	25 		H'190000 H'19FFFF
	24 		H'180000 H'18FFFF
	23 		H'170000 H'17FFFF
	22 		H'160000 H'16FFFF
	21 		H'150000 H'15FFFF
	20 		H'140000 H'14FFFF
	19 		H'130000 H'13FFFF
	18 		H'120000 H'12FFFF
	17 		H'110000 H'11FFFF
	16 		H'100000 H'10FFFF
	15 		H'0F0000 H'0FFFFF
	14 		H'0E0000 H'0EFFFF
	13 		H'0D0000 H'0DFFFF
	12 		H'0C0000 H'0CFFFF
	11 		H'0B0000 H'0BFFFF
	10 		H'0A0000 H'0AFFFF
	 9 		H'090000 H'09FFFF
	 8 		H'080000 H'08FFFF
	 7 		H'070000 H'07FFFF
	 6 		H'060000 H'06FFFF
	 5 		H'050000 H'05FFFF
	 4 		H'040000 H'04FFFF
	 3 		H'030000 H'03FFFF
	 2 		H'020000 H'02FFFF
	 1 		H'010000 H'01FFFF
	 0 		H'000000 H'00FFFF		
		
Each Sector holds 256 Pages each of 256 bytes
		

When writing to a memory location and then reading it via the USB Blaster the value is reversed
e.g. if we write 0xD1 (1101 0001) to memory address 0x1FFFFF then read it via the USB Blaster
it returns 0x8B (1000 1011) since it reads LSB first .

Writing a value to memory and reading it back gives the same value.

Altera recommends checking the busy signal before sending a new command. When
the busy signal is deasserted, allow two clock cycles before sending a new signal.
This delay allows the circuit to reset itself before executing the next command.

	In order to get this code to compile without timing errors under
	Quartus V11.0 sp1  I needed to use the following settings:
	
	- Analysis and Synthesis Settings\Power Up Dont Care [not checked]


Command Format:
	
	The PC sends a Raw Ethernet frame as follows
   
       For Program Flash on Hermes     <11:22:33:44:55:66 ><From PC MAC address> 0xEFFE, 0x03, 0x01, < 4 bytes of 0x00 ><256 bytes of data> 
       For Erase  Flash on Hermes      <11:22:33:44:55:66 ><From PC MAC address> 0xEFFE, 0x03, 0x02, <46 bytes of 0x00 > 
       For Read MAC of Hermes          <11:22:33:44:55:66 ><From PC MAC address> 0xEFFE, 0x03, 0x03, <46 bytes of 0x00 > 
       For Read IP of Hermes           <11:22:33:44:55:66 ><From PC MAC address> 0xEFFE, 0x03, 0x04, <46 bytes of 0x00 > 
       For Write IP to Hermes flash    <11:22:33:44:55:66 ><From PC MAC address> 0xEFFE, 0x03, 0x05, <IP Address><46 bytes of 0x00 > 
 
  For Boot Loader Mode the MAC address of a Hermes board is fixed at 11:22:33:44:55:66 
 
 
 
 NOTE: You must erase the EPCS16 before programming it - the code does this.
 
 Hermes will reply to the MAC address of this PC with Raw Ethernet frames as follows:
  
      <To MAC address><11:22:33:44:55:66 > 0xEFFE, 03, <Return code> <46 bytes of 0x00 >  or
      <To MAC address><11:22:33:44:55:66 > 0xEFFE, 03, <0x03> <Hermes MAC Address> <42 bytes of 0x00 > or
      <To MAC address><11:22:33:44:55:66 > 0xEFFE, 03, <0x04> <Hermes IP Address> <42 bytes of 0x00 >

  where Return code means:
      
 Return code       Meaning
  0x00              Invalid command
  0x01              Erase done
  0x02              Send more - ready for next 256 bytes
  0x03              Have MAC address
  0x04              Have IP address

   Speed is forced to 100T
   
   NOTE: Once in the Program state the code does not exit but relies on the PC to stop sending data.
		 In which case need to cycle power to the board in order to run more commands. 
   
   Change Log:  
			2011 Nov 14 - 	Initial release can erase EPSC16 but not read MAC nor read/write IP. Fixed error on CONFIG pin assignment.
               
		            
	********* For this code to run you need the boot jumper set !!!! *******
	    	      
       
       LEDs
       
       DEBUG_LED1		- 	PHY_RX
       DEBUG_LED2		-	MAC address match 	
       DEBUG_LED3		- 	Erase Command	
       DEBUG_LED4		- 	Program Command
       DEBUG_LED5 	-  Connect speed - slow flash for 100T, fast for no network found.	
       DEBUG_LED6		- 	PHY_TX
       DEBUG_LED7		-  PHY  Rx fifo empty
       DEBUG_LED8  	-  Send more data ACK
       DEBUG_LED9  	-  Send more data  
       DEBUG_LED10  	-  ASMI busy       
	    STATUS LED 	- 	HEART_BEAT 
	
		     
	**** do not forget to set the four ASMI pins (FLASH_nCE/nCSO, Data[1]/ASDO, DCLK and Data[0]) to "Reset" in the Dual-purpose pins tab. ****
    **** make sure AS is set so can connect USB Blaster without resetting the FPGA i.e. 'Use Configuration Device - EPCS16'****
    **** make sure Configuration Mode is set to "Remote" ****
	
	see http://www.grigaitis.eu/?p=514 to use NIOS and a serial port for programing EPCS16

*/

module Bootloader (
			  STATUS_LED, PHY_TX,PHY_RX,PHY_DV,PHY_TX_CLOCK,PHY_TX_EN, NCONFIG, MODE1,
			  PHY_RX_CLOCK,PHY_CLK125,PHY_MDIO,PHY_MDC, PHY_RESET_N, SCK, SI,CONFIG, NODE_ADDR_CS,
			  DEBUG_LED1, DEBUG_LED2, DEBUG_LED3, DEBUG_LED4, DEBUG_LED5, DEBUG_LED6,
			  DEBUG_LED7, DEBUG_LED8, DEBUG_LED9, DEBUG_LED10
			  );

// PHY
output  	reg  [3:0]PHY_TX;
input   	wire [3:0]PHY_RX;		   
input		wire     PHY_DV;					// PHY has data flag
output	wire     PHY_TX_CLOCK;			// PHY Tx data clock
output	reg 	 	PHY_TX_EN;				// PHY Tx enable
input		wire	 	PHY_RX_CLOCK;      	// PHY Rx data clock
input		wire     PHY_CLK125;				// 125MHz clock from PHY PLL
inout		wire     PHY_MDIO;				// data line to PHY MDIO
output	wire 	 	PHY_MDC;					// 2.5MHz clock to PHY MDIO
output	wire     PHY_RESET_N;

// EEPROM
output 	wire		SCK; 						// clock on MAC EEPROM
output 	wire		SI;						// serial in on MAC EEPROM
input  	wire 		CONFIG; 					// SO on MAC EEPROM
output 	wire 		NODE_ADDR_CS;			// CS on MAC EEPROM
wire SO;	assign 	SO = CONFIG;			// serial out on MAC EEPROM
wire CS;	assign 	NODE_ADDR_CS = CS; 	// Chip select on MAC EEPROM

// Reload
output  	reg     	NCONFIG = 1'b0;

// image select 
input   	wire     MODE1;

// LEDs
output 	wire 	  	STATUS_LED;				// LED, flashes, runs off PHY 125MHz clock.

output 	wire		DEBUG_LED1;
output 	wire		DEBUG_LED2;
output 	wire		DEBUG_LED3;
output 	wire		DEBUG_LED4;
output 	wire		DEBUG_LED5;
output 	wire		DEBUG_LED6;
output 	wire		DEBUG_LED7;
output 	wire		DEBUG_LED8;
output 	wire		DEBUG_LED9;
output 	wire		DEBUG_LED10;


//--------------------------------------------------------
// 					Clocks
//--------------------------------------------------------

wire C125_clk; 	assign C125_clk = PHY_CLK125;	// use PHY 125MHz clock for system clock
wire Tx_clock;
wire Tx_clock_2;
wire C125_locked; 			// high when PLL locked
wire PHY_data_clock;
wire PHY_speed;				// 0 = 100T, 1 = 1000T	
wire PHY_MDIO_clk;  			// divide 25MHz clock by 10 for PHY MDIO clock 	

// use PLL to generate 25MHz, 12.5MHz and 2.5MHz from 125MHz.
// C0 = , C1 = 25MHz, C2 = 12.5MHz, C3 = 2.5MHz

PLL_clocks PLL_inst(.areset(), .inclk0(C125_clk), .c0(), .c1(Tx_clock), .c2(Tx_clock_2), .c3(PHY_MDIO_clk), .locked(C125_locked));

// generate PHY_RX_CLOCK/2 for 100T 
reg PHY_RX_CLOCK_2;
always @ (posedge PHY_RX_CLOCK) PHY_RX_CLOCK_2 <= ~PHY_RX_CLOCK_2; 

assign PHY_TX_CLOCK = ~Tx_clock;

assign PHY_speed = 1'b0;  // Force 100T

// select data clock speed 
assign PHY_data_clock = PHY_RX_CLOCK_2;

// assign clock for Remote Config code
wire clock;
assign clock = Tx_clock;

//------------------------------------------------------------------------------
//  Remote Update
//------------------------------------------------------------------------------

// BootAddress is the address in the EPCS16 to load the Application image from. 
// If control = 0 then load the Factory image, if = 1 load the Application.

localparam CLOCK_FREQ = 25;  // clock speed we are using for Reconfigure module

Reconfigure Recon_inst(.reset(reset), .clock(clock), .clk_freq(CLOCK_FREQ),.BootAddress(24'h100000),
					   .control(MODE1), .CRC_error(), .done()); 


//------------------------------------------------------------
//  Reset and initialisation
//------------------------------------------------------------

/* 
	Hold the code in reset whilst we do the following:
	
	Setup the PHY registers and read from the PHY until it indicates it has 
	negotiated a speed.  Read connection speed and that we are running full duplex.
	
	****  LEDX indicates PHY status - on = connected at 1000T, slow flash is 100T and fast flash = not connected
	
	Then enable rest of code.
	
*/

reg reset;
reg [4:0]start_up;
wire [47:0]This_MAC; 	// holds the MAC address of this PC
reg read_EEPROM; 
reg DHCP_start;
wire MAC_ready;
wire IP_ready;
reg [24:0]delay;
reg duplex;					// set when we are connected full duplex
reg speed_100T;			// set when we are connected at 100MHz
reg speed_1000T;			// set when we are connected at 1GHz
reg [9:0]reset_count;	// hold reset to ensure Rx fifo is empty

assign PHY_RESET_N = 1'b1;  					// Allow PYH to run for now
assign This_MAC = 48'h11_22_33_44_55_66;  // fixed MAC address when in boot mode

always @ (posedge Tx_clock_2)
begin
	case (start_up)

0:	begin
	reset_count <= 0;
		if(C125_locked) begin 			// wait until PLL is locked
			reset <= 1'b1;
			start_up <= start_up + 1'b1;
		end 
	end
	// set up the PHY
1:  begin
		write_PHY <= 1'b1;				// set write to PHY flag
		start_up <= start_up + 1'b1;
	end
		
	// set up the PHY MDIO registers
2: begin
	   if (write_done) begin
			write_PHY <= 0;						// clear write PHY flag so it does not run again
			duplex <= 0;							// clear duplex and speed flags
			speed_100T <= 0;
			speed_1000T <= 0; 
			read_PHY <= 1'b1;						// set read from PHY flag
			start_up <= start_up + 1'b1;
		end 
		else start_up <= 2;						// loop here till write is done
	end 
	
	// loop reading PHY Register 31 bits [3],[5] & [6] to determine if final connection is full duplex at 100T or 1000T.
	// Set speed and duplex bits.	

3: begin
		if (read_done  && (register_data[5] || register_data[6])) begin
			duplex <= register_data[3];			// get connection status and speed
			speed_100T  <= register_data[5];
			speed_1000T <= register_data[6];
			read_PHY <= 0;								// clear read PHY flag so it does not run again
			start_up <= start_up + 1'b1;
			end 
		else start_up <= 3;							// keep reading Register 1 until we have a valid speed		
   end 

	// start up is over so release reset and run 
4:  begin
		if (speed_1000T) start_up <= 1;			// make sure we not at 1000T,if so reset
		else begin
			if (reset_count == 1000)				// make sure that Rx_fifo is empty
				reset <= 0;
			else reset_count <= reset_count + 1'b1;  // release reset so rest of code can run
		start_up <= 4;
		end 
	end
	default: start_up <= 0;
    endcase
end 

//----------------------------------------------------------------------------------
// Read/Write the  PHY MDIO registers (NOTE: Max clock frequency is 2.5MHz)
//----------------------------------------------------------------------------------
wire write_done; 
reg write_PHY;
reg read_PHY;
wire PHY_clock;
wire read_done;
wire [15:0]register_data; 

localparam read_reg_address = 5'd31; 	// PHY register to read from - gives connect speed and duplex status

MDIO MDIO_inst(.clk(PHY_MDIO_clk), .write_PHY(write_PHY), .write_done(write_done), .read_PHY(read_PHY),
	  .clock(PHY_MDC), .MDIO_inout(PHY_MDIO), .read_done(read_done),
	  .read_reg_address(read_reg_address), .register_data(register_data),.speed(PHY_speed));

//---------------------------------------------------
//   PHY Receive Interface  
//---------------------------------------------------

reg [111:0] PHY_output;			// register to hold output from Micrel PHY chip 
wire [7:0] PHY_byte;
reg [4:0] PHY_Rx_state;
reg [9:0] left_shift;
reg [7:0] command;
reg erase;							// set when erase command received
reg READ_ID;						// set when read ID command received
reg READ_ID_ACK;
reg [47:0] PC_MAC;
reg PROGRAM;						// set when program command received   
reg PROGRAM2;						// set when we want to program Mercury 
reg prog;							// set when program command received
reg data_match;
reg Rx_enable;						// set when we need to write to Rx_fifo
reg [8:0]PHY_data_count;		// holds number of bytes we have sent to Rx_fifo
reg send_more; 					// set when the Rx fifo is empty and we need some more data from the PC
reg send_more_ACK;				// set when the request for more has been sent
reg ERASE_CHIP;
reg [31:0]num_blocks; 			// holds number of blocks that the PC will be sending
reg [31:0]block_counter;		// holds number of clocks received so far
reg [31:0]num_bytes;				// holds number of bytes that the PC will be sending
reg [11:0]shift_count;			// holds number of time to shift with TDI set to 1
reg read_MAC;						// set when we want to read the MAC address from the EEPROM
reg send_MAC;						// set when we want to sent the MAC address from the EEPROM to the PC
reg send_MAC_ACK;					// set when the MAC address has been sent to the PC
reg read_IP;						// set when we want to read the IP address from the EEPROM
reg send_IP;						// set when we want to sent the IP address to the PC
reg send_IP_ACK;					// set when the IP address has beed sent to the PC
reg [31:0]IP_to_write;			// holds IP address sent by PC
reg write_IP;						// set to write IP address to EEPROM


localparam	START 			= 0,
			GET_TYPE				= 1,
			SEND_TO_FIFO		= 2,
			ERASE 				= 3,
			READMAC				= 4,
			READIP				= 5,
			WRITEIP				= 6;
			


// fifo based nibble to byte converter. PHY data goes to input and wrreq takes PHY_DV.
// Write clock is ~PHY_RX_CLOCK and read clock PHY_RX_CLOCK_2.
// rdempty is linked to rdreq so it always reading.

//-------------------------------------------
//   			PHY fifo
//-------------------------------------------

/*
					    PHY_fifo (32 bytes) 
					
					---------------------
        PHY_RX |data[3:0]	         | 
					|				         |
		  PHY_DV	|wrreq		         | 
					|					      |									    
~PHY_RX_CLOCK	|>wrclk	 			   |
					---------------------								
    !rdempty   |rdreq		  q[7:0] | PHY_byte
	        		|					      |					  			
			     	|   		     rdempty| rdempty 
		         |                    | 							
PHY_data_clock	|>rdclk  			   | 	    
					---------------------								
					|                    |
         reset | aclr				   |
					---------------------

 
*/

wire rdempty;

PHY_fifo PHY_fifo_inst (.data(PHY_RX), .q(PHY_byte), .wrreq(PHY_DV), .wrclk(~PHY_RX_CLOCK), .rdreq(!rdempty),
						.rdclk(PHY_data_clock), .rdempty(rdempty), .aclr(reset));

// apply output of fifo to 112 bit shift register
always @ (posedge PHY_data_clock)
	 PHY_output <= {PHY_output[103:0], PHY_byte}; 	   
	 	
	
// process bytes from PHY	
always @ (negedge PHY_data_clock)  
begin								

case (PHY_Rx_state)

START:
	begin
	left_shift <= 0; 			// reset the shift counter
	erase  <= 0; 				// reset erase command
	PHY_data_count <= 0;		// reset data count

	 // check for frame to Hermes MAC address  - ignore first 6 x h55 since Rx PLL may not be locked 
		if (PHY_output[63:0] == {16'h55_D5, This_MAC}) begin  
			PHY_Rx_state <= GET_TYPE;  	// have preamble and this MAC so next state 
		end
		else begin
			data_match <= 1'b0;
			PHY_Rx_state <= START;		// no preamble and MAC so loop and look again
		end  				    
	end
	
// now shift left 14 times to get From_MAC, check HPSDR type and command plus Assign IP / number of bytes/frames  
// we get one left shift automatically when we go to this state
GET_TYPE:
	begin
	case (left_shift)	
	13: begin
			if (PHY_output[63:40] == 24'hEF_FE_03) begin // check this is a program request
				PC_MAC   <= PHY_output[111:64];				// MAC address of the sending PC
				data_match <= 1'b1;	
				case(PHY_output[39:32])							// determine what command has been sent
				1: 	begin																
					left_shift <= 0;
					PHY_Rx_state <= SEND_TO_FIFO;
					end 
				2:	begin 
					erase <= 1'b1;
					PHY_Rx_state <= ERASE;
					end
				3:	begin
					read_MAC <= 1'b1;
					PHY_Rx_state <= READMAC;
					end
				4:	begin
					read_IP <= 1'b1;
					PHY_Rx_state <= READIP;
					end
				5:	begin										// Write static IP address to EEPROM
					IP_to_write <= PHY_output[31:0];
					write_IP <= 1'b1;
					PHY_Rx_state <= WRITEIP;
					end
				default:  PHY_Rx_state <= START;  	// not a valid command so just exit
				endcase 
			end
		else PHY_Rx_state <= START;  					// not a valid command so just exit 
	end
		
	default: left_shift <= left_shift + 1'b1;
	endcase
	end 

	
//  Loop here until we have sent 256 bytes to the Rx FIFO. Then drop Rx_enable 
//  so that the CRC is not sent to FIFO. 
SEND_TO_FIFO:
	begin
	prog <= 1'b1;
	data_match <= 0;
		if (PHY_data_count == 9'd256) begin    	// have we sent 256 bytes ?
			PHY_data_count <= 0;							// reset data count 
			prog <= 1'b0;									// set prog flag
			Rx_enable <= 0;								// disable further writes to Rx_fifo
			PHY_Rx_state <= START;						// loop back for some more data.			
		end
		else begin
			Rx_enable <= 1'b1;				
			PHY_data_count <= PHY_data_count + 9'd1;
		end
	end	
	
// wait until ASMI has seen the command 
ERASE:		
	begin
	data_match <= 0;
		if (erase_ACK) begin
			erase <= 1'b0;	
			PHY_Rx_state <= START;
		end 
	end
// Wait until MAC read from EEPROM is complete then send to PC	
READMAC:
	begin
		if (MAC_ready) begin
			read_MAC <= 0;				// reset read MAC flag
			send_MAC <= 1'b1; 		// set send MAC address to PC flag
		end
		if (send_MAC_ACK) begin		// loop here until the MAC address had been sent
			send_MAC <= 0; 
			PHY_Rx_state <= START;			
		end
	end
// Wait until IP read from EEPROM is complete then send to PC	
READIP:
	begin
		if (IP_ready) begin
			read_IP <= 0;				// reset read MAC flag
			send_IP <= 1'b1; 			// set send MAC address to PC flag
		end
		if (send_IP_ACK) begin		// loop here until the MAC address had been sent
			send_IP <= 0; 
			PHY_Rx_state <= START;			
		end
	end		
// wait until IP write is done then return
WRITEIP:	
	begin
		if (IP_write_done) begin
			write_IP <= 0;
			PHY_Rx_state <= START;	
		end
	end 

default: PHY_Rx_state <= START;	
endcase
end 

//------------------------------------------------------------------
// 			EEPROM read/write contol
//------------------------------------------------------------------
wire [47:0]EEPROM_MAC;
wire [31:0]EEPROM_IP;
wire IP_write_done;

EEPROM EEPROM_inst(.clock(PHY_MDIO_clk), .read_MAC(read_MAC), .read_IP(read_IP), .write_IP(write_IP), .IP_to_write(IP_to_write),
					.CS(CS), .SCK(SCK), .SI(SI), .SO(SO), .This_MAC(EEPROM_MAC), .This_IP(EEPROM_IP),
					.MAC_ready(MAC_ready), .IP_ready(IP_ready), .IP_write_done(IP_write_done));


//------------------------------------------
// state machine to manage ASMI inface
//------------------------------------------

wire [7:0]ID;
wire [7:0]datain;
wire error;
wire busy;
wire data_valid;
wire [7:0]dataout;
reg [23:0]address; 		// address to read and write 
reg [3:0]state;
reg write_enable;
reg write; 
reg read_enable;
reg read;
reg [8:0]count2;
reg shift_bytes;
reg [8:0]page; 			// counts number of pages we are writing 
reg read_sid;
reg erase_done;
reg sector_erase;
reg [8:0]byte_count;		// holds number of bytes we have send to ASMI



// read 255 bytes from Rx fifo and then request more
always @ (negedge Tx_clock) // was negedge PHY_RX_CLOCK
begin 
case (state)

// see if we have 255 bytes, loop if not 
0:	begin 
		read_enable <= 0;
		read <= 0;
		read_sid <= 0;
		write_enable <= 0;
		write <= 0;
		erase_ACK <= 0;
		erase_done <= 0;
		sector_erase <= 0;
		address <= 24'h100000;		// set starting erase/program address to sector 4 (start of top 1MB) 
		byte_count <= 0;
		if (erase) 
			 state <= 1'd1;
		else if(IF_Rx_used > 254) 		
			state <= 5;		 
	end

// erase top 1MB of EPCS16	
1:	begin
		erase_ACK <= 1'b1; 	   	// let the Rx know we have seen the command
		write_enable <= 1'b1;
		sector_erase <= 1'b1;
		state <= 2;
	end 
// wait until erase has completed
2:	begin
		write_enable <= 0;
		sector_erase <= 0;
		if (busy) state <= 2;
		else if (address != 24'h300000) begin //h1F0000) begin	// reached end of memory yet?
			address <= address + 24'h040000; //h010000;	// increment address to next sector
			state <= 1;
		end 		
		else state <= 3;						// erase done, let user know
	end
// let user know that erase has completed
3:	begin
		erase_done <= 1'b1;
		state <= 4;
	end 
// wait for the Tx to ack then return, loop here otherwise
4:	begin
		if (erase_done_ACK) state <= 0;
	end
	
// program EPCS16 with data from PC
5: 	begin 
	rdreq <= 1'b1;					
	byte_count <= 0; 				// reset byte counter
	state <= state + 1'b1;
	end 
// loop until we have sent 256 bytes
6:	begin
		if (byte_count == 9'd256) begin
			byte_count <= 0;				// reset byte counter
			shift_bytes <= 0;
			rdreq <= 0; 					// stop reading from fifo
			state <= state + 1'b1;
		end 
		else begin
			write_enable <= 1'b1;			// enable write to the ASMI 
			shift_bytes <= 1'b1;			// enable loading data into the ASMI memory
			byte_count <= byte_count + 1'b1;
		end
	end 
// write the 256 bytes into the ASMI fifo and request more data
7:	begin
	write <= 1;
	state <= state + 1'b1;
	send_more <= 1'b1;		
	end 
// wait for request to be acknowledged and when we have 255 more bytes ready then increment address by 256
// and get some more data 
// Note: there is no exit from this loop - it relies on the PC not sending any more data.
8:	begin 
	write <= 0;
	write_enable <= 0;
		if (send_more_ACK) send_more <= 0;				// clear send flag once Tx has seen it
		if (!busy && IF_Rx_used > 254  && send_more == 0) begin
			address <= address + 24'd256;	// increment write address to point to next page boundry
			state <= 5;
		end
	end  
		
endcase
end 

//----------------------------
// 			ASMI  
//----------------------------

//  If you enable wren in the MegaFunction then it must be set to 1 in order to write, protect or erase.

//ASMI  ASMI_inst(.addr(address),.bulk_erase(0), .busy(busy), .clkin(Tx_clock), .data_valid(data_valid),
								// .dataout(dataout), .illegal_erase(error), .rden(read_enable), .read(read), .read_sid(read_sid),
								// .epcs_id(ID), .wren(write_enable), .sector_protect(0),
								// .datain(datain), .sector_erase(sector_erase), .write(write), .shift_bytes(shift_bytes)); 
ASMI  ASMI_inst(.addr(address),.bulk_erase(0), .busy(busy), .clkin(Tx_clock), .data_valid(data_valid),
								 .dataout(dataout), .illegal_erase(error), .rden(read_enable), .read(read),
								 .wren(write_enable), .sector_protect(0),
								 .datain(datain), .sector_erase(sector_erase), .write(write), .shift_bytes(shift_bytes)); 

// reverse bit order into ASMI
assign datain = {IF_PHY_data[0],IF_PHY_data[1],IF_PHY_data[2],IF_PHY_data[3],IF_PHY_data[4],IF_PHY_data[5],IF_PHY_data[6],IF_PHY_data[7]};
		
//-------------------------------------------
//   Rx fifo (for Hermes Programming)
//-------------------------------------------

/*
					    Rx_fifo (1k bytes) 
					
						--------------------
  PHY_output[7:0] |data[7:0]	  wrfull |
						|				     |
		Rx_enable	|wrreq		 wrempty | Rx_fifo_empty
						|							|									    
	PHY_data_clock	|>wrclk	wrusedw[9:0]| Rx_fifo_used
						---------------------								
	       rdreq   |rdreq		  q[7:0] | IF_PHY_data ----> ASMI data input
						|					 		|					  			
						|   		  	  rdempty| IF_PHY_rdempty 
						|                    | 							
			Tx_clock	|>rdclk  rdusedw[9:0]| IF_Rx_used	   
						---------------------								
						|                    |
		   	IF_rst|aclr                |				  			
						---------------------								

 
*/

wire IF_PHY_rdempty;
wire IF_PHY_drdy;
wire [7:0]IF_PHY_data;
wire [9:0]IF_Rx_used;
reg  rdreq;
wire Rx_fifo_empty;
wire [9:0]Rx_fifo_used;

Rx_fifo Rx_fifo_inst(.wrclk (PHY_data_clock),.rdreq (rdreq),.rdclk (Tx_clock),.wrreq(Rx_enable), 
                .data (PHY_output[7:0]),.q (IF_PHY_data), .wrusedw(), .rdempty(IF_PHY_rdempty), .rdusedw(IF_Rx_used),
                .wrfull(),.aclr(reset), .wrempty(Rx_fifo_empty));

//------------------------------------------
//   State Machine to send Tx data to PHY
//-------------------------------------------

/*
       In response to an erase_done or send_more command it sends the Raw Ethernet header followed by the response then 46
       bytes of 0x00. It enables the CRC32 generator when sending the header and adds to the end of the data.
       Code then loops to the start.
*/

// HPSDR specific			
parameter HPSDR_frame = 8'h03;  	// HPSDR Frame type 
parameter Type_1 = 8'hEF;	    	// Ethernet Frame type
parameter Type_2 = 8'hFE;

localparam	RESET 	= 0,
				SEND  	= 1,
				SENDMAC 	= 2,
				SENDIP	= 3,
				CRC 		= 4;
			
wire [31:0] CRC32;				   	// holds 802.3 CRC result 
reg  [31:0] temp_CRC32 = 0; 

reg [6:0] state_Tx;             	
reg [10:0] data_count;
reg reset_CRC;
reg [7:0] Tx_data;
reg [4:0] gap_count;
reg [6:0] rdaddress;
reg [7:0] pkt_data;
reg erase_ACK;
reg erase_done_ACK;
reg [7:0] reply;  		// 0x01 if completed OK, 02 for send 256 more bytes
reg [5:0]interframe; 	// hold Ethernet interframe delay value
reg [4:0]MAC_count;		// holds shift count when sending MAC to PHY Tx fifo
reg [47:0]temp_MAC;		// holds MAC address whilst we are shifting
reg [4:0]IP_count;		// holds shift count when sending IP to PHY TX fifo
reg [31:0]temp_IP;		// holds IP address whilst we are shifting


always @ * 
case(rdaddress)
// Ethernet preamble
  0 : pkt_data <= 8'h55;
  1 : pkt_data <= 8'h55;
  2 : pkt_data <= 8'h55;
  3 : pkt_data <= 8'h55;
  4 : pkt_data <= 8'h55;
  5 : pkt_data <= 8'h55;
  6 : pkt_data <= 8'h55;
  7 : pkt_data <= 8'hD5;
// Ethernet header
  8 : pkt_data <= PC_MAC[47:40];		// MAC address of PC we are sending to 
  9 : pkt_data <= PC_MAC[39:32];
  10: pkt_data <= PC_MAC[31:24];
  11: pkt_data <= PC_MAC[23:16];
  12: pkt_data <= PC_MAC[15:8];
  13: pkt_data <= PC_MAC[7:0];
  14: pkt_data <= This_MAC[47:40]; 	// MAC address of this OzyII Board
  15: pkt_data <= This_MAC[39:32]; 
  16: pkt_data <= This_MAC[31:24];
  17: pkt_data <= This_MAC[23:16]; 
  18: pkt_data <= This_MAC[15:8];  
  19: pkt_data <= This_MAC[7:0];   
// Start of Payload
  20: pkt_data <= Type_1;	    		// Ethernet Frame type 0xEFFE (HPSDR)
  21: pkt_data <= Type_2;
  22: pkt_data <= HPSDR_frame;		// HPSDR Frame type 
  23: pkt_data <= reply;				// command result
  // send data here then	
  // followed by 42 bytes of 0x00
  // then CRC32
  24: pkt_data <= CRC32[7:0];
  25: pkt_data <= temp_CRC32[15:8];
  26: pkt_data <= temp_CRC32[23:16];
  27: pkt_data <= temp_CRC32[31:24];

  default: pkt_data <= 0;
endcase


always @ (negedge Tx_clock_2)				// clock at half speed since we read bytes but write nibbles
begin
case(state_Tx)

RESET:
   begin
        sync_Tx_CTL <= 1'b0;
        data_count <= 0;
        reset_CRC <= 0;
        rdaddress <= 0;
        send_more_ACK <= 1'b0;
        erase_done_ACK <= 1'b0;
        reply <= 0; 
        send_more_ACK <= 0;
        send_MAC_ACK <= 0;
        MAC_count <= 0;
        send_IP_ACK <= 0;
        IP_count <= 0;
	
        
        if (reset)
			state_Tx <= RESET;
		else if (erase_done) begin					
				erase_done_ACK <= 1'b1; 								
				reply <= 8'h01;					   	// confirm erase was OK to PC
				state_Tx <= SEND;
		end
		else if (send_more) begin							
				reply <= 8'h02;						// tell the PC to send more data
				state_Tx <= SEND;
			end
		else if (send_MAC) begin					// send the MAC address held in the EEPROM
				reply <= 8'h3;
				send_MAC_ACK <= 1'b1;
				temp_MAC <= EEPROM_MAC;
				state_Tx = SENDMAC;
		end 
		else if (send_IP) begin						// send the MAC address held in the EEPROM
				reply <= 8'h4;
				send_IP_ACK <= 1'b1;
				temp_IP <= EEPROM_IP;
				state_Tx = SENDIP;
		end 
		else state_Tx <= RESET;			
   end

// start sending Ethernet data 
SEND:	
    begin
		if (rdaddress != 24)						// keep sending until we reach the end of the fixed data 
		begin
			Tx_data <= pkt_data;
			sync_Tx_CTL <= 1'b1;					// enable write to Tx FIFO
			rdaddress <= rdaddress + 1'b1;
			state_Tx <= SEND;
		end 
		else 
		// send 46 bytes of 0x00   
		begin
			if (data_count != 46) begin
				Tx_data <= 0;  				
				data_count <= data_count + 1'b1;		// increment loop counter
				state_Tx <= SEND;
			end
			else begin
    			temp_CRC32 <= CRC32;					// grab the CRC data since it will change next clock pulse
				Tx_data <= pkt_data;					// send CRC32 to PHY
				rdaddress <= rdaddress + 1'b1; 
				state_Tx <= CRC;
			end 
		end  											// done, so now add the remainder of the CRC32 
		
		if (rdaddress == 7)
			reset_CRC <= 1'b1; 					// start CRC32 generation
		else 
			reset_CRC <= 1'b0;
    end   
    
SENDMAC:
    begin
		if (rdaddress != 24) begin				// keep sending until we reach the end of the fixed data 
			Tx_data <= pkt_data;
			sync_Tx_CTL <= 1'b1;					// enable write to Tx FIFO
			rdaddress <= rdaddress + 1'b1;
			state_Tx <= SENDMAC;
		end 
		// else send the MAC address
		else if (MAC_count != 7) begin
			Tx_data = temp_MAC[47:40];
			temp_MAC <= {temp_MAC[39:0],8'h00};
			MAC_count <= MAC_count + 1'b1;
			state_Tx <= SENDMAC;
		end 		
		// now send 40 bytes of 0x00 
		else if (data_count != 40) begin
			Tx_data <= 0;  				
			data_count <= data_count + 1'b1;	// increment loop counter
			state_Tx <= SENDMAC;
		end
		else begin
			temp_CRC32 <= CRC32;					// grab the CRC data since it will change next clock pulse
			Tx_data <= pkt_data;					// send CRC32 to PHY
			rdaddress <= rdaddress + 1'b1; 
			state_Tx <= CRC;						// done, so now add the remainder of the CRC32
		end 
 											 
		
		if (rdaddress == 7)
			reset_CRC <= 1'b1; 					// start CRC32 generation
		else 
			reset_CRC <= 1'b0;
    end 

SENDIP:
    begin
		if (rdaddress != 24) begin				// keep sending until we reach the end of the fixed data 
			Tx_data <= pkt_data;
			sync_Tx_CTL <= 1'b1;					// enable write to Tx FIFO
			rdaddress <= rdaddress + 1'b1;
			state_Tx <= SENDIP;
		end 
		// else send the IP address
		else if (IP_count != 5) begin
			Tx_data = temp_IP[31:24];
			temp_IP <= {temp_IP[23:0],8'h00};
			IP_count <= IP_count + 1'b1;
			state_Tx <= SENDIP;
		end 		
		// now send 42 bytes of 0x00 
		else if (data_count != 42) begin
			Tx_data <= 0;  				
			data_count <= data_count + 1'b1;	// increment loop counter
			state_Tx <= SENDIP;
		end
		else begin
			temp_CRC32 <= CRC32;					// grab the CRC data since it will change next clock pulse
			Tx_data <= pkt_data;					// send CRC32 to PHY
			rdaddress <= rdaddress + 1'b1; 
			state_Tx <= CRC;						// done, so now add the remainder of the CRC32
		end 
 											 
		
		if (rdaddress == 7)
			reset_CRC <= 1'b1; 					// start CRC32 generation
		else 
			reset_CRC <= 1'b0;
    end 
    
// add remainder of CRC32
CRC:
	begin
	send_more_ACK <= 1'b1;						
		if (rdaddress != 28) begin				
			Tx_data <= pkt_data;
			rdaddress <= rdaddress + 1'b1;
			state_Tx <= CRC;     
		end
		else begin
			sync_Tx_CTL <= 1'b0;						// disable PHY write
			if (interframe == 10) begin			// interframe delay as required by Ethernet specification
				interframe <= 0;
				state_Tx <= RESET; 					// send complete, loop back to start
			end
			else interframe <= interframe + 1'b1;							
		end
	end
default: state_Tx <= RESET;
endcase
end     



//----------------------------
//   802.3 CRC32 Calculation
//----------------------------

CRC32 CRC32_inst(.rst(reset_CRC),.clk(Tx_clock_2), .data(Tx_data), .crc(CRC32)); 


//---------------------------
//   Send data to PHY
//---------------------------

// Data to send is in Tx_data in bytes. 
// When sync_Tx_CTL is true we alternate sending low and high nibbles 


reg [4:0]PHY_state;
reg sync_Tx_CTL;
reg [3:0]sync_TD;


always @ (negedge Tx_clock)  
begin
case (PHY_state)
// send low nibble
0:	begin 
		if (sync_Tx_CTL) begin
			sync_TD <= Tx_data[3:0];
			PHY_state <= 1'b1;
		end	
	else PHY_state <= 0;
	end
// now send high nibble
1:	begin
	sync_TD <= Tx_data[7:4];
	PHY_state <= 0;
	end

endcase
end

// sync data to PHY on Tx clock, clock PHY on ~Tx_clock so we clock in middle of data

always @ (posedge Tx_clock)
begin
	 PHY_TX <= sync_TD;
	 PHY_TX_EN <= sync_Tx_CTL; 
end 

//-----------------------------------------------------------
//  		LED Control  
//-----------------------------------------------------------

// LEDS are connected to the RAM address lines e.g. LED0 = RAM_A0

parameter half_second = 5000000; // at 25MHz clock rate

// flash DEBUG_LED1 for ~ 0.2 second whenever the PHY gets data
Led_flash Flash_LED1(.clock(Tx_clock), .signal(PHY_DV), .LED(DEBUG_LED1), .period(half_second)); 		

// flash DEBUG_LED2 for ~0.2 seconds whenever we get data to this MAC address
Led_flash Flash_LED2(.clock(Tx_clock), .signal(data_match), .LED(DEBUG_LED2), .period(half_second));

// flash DEBUG_LED3 for ~0.2 seconds whenever we get an erase command
Led_flash Flash_LED3(.clock(Tx_clock), .signal(prog), .LED(DEBUG_LED3), .period(half_second)); 

// flash DEBUG_LED4 for ~0.2 seconds when we get a program command 
Led_flash Flash_LED4(.clock(Tx_clock), .signal(IP_write_done), .LED(DEBUG_LED4), .period(half_second)); // *** READ_ID_ACK

// flash DEBUG_LED6 for ~0.2 seconds when we send data to PHY  
Led_flash Flash_LED6(.clock(Tx_clock), .signal(sync_Tx_CTL), .LED(DEBUG_LED6), .period(half_second));

//Flash STATUS_LED
reg [26:0]HB_counter;
always @(posedge PHY_CLK125) HB_counter = HB_counter + 1'b1;
assign STATUS_LED = HB_counter[25];  // Blink

//------------------------------------------------------------
//   Multi-state LED Control    
//------------------------------------------------------------

parameter clock_speed = 25000000; 	// 25MHz clock 

// display state of PHY negotiations  - fast flash if no Ethernet connection, slow flash if 100T and on if 1000T
Led_control #(clock_speed) Control_LED0(.clock(Tx_clock), .on(speed_1000T), .fast_flash(~speed_100T || ~speed_1000T),
										.slow_flash(speed_100T), .LED(DEBUG_LED5));

assign DEBUG_LED7 = ~IF_PHY_rdempty;		
assign DEBUG_LED8 = ~send_more_ACK;		
assign DEBUG_LED9 = ~send_more;				

assign DEBUG_LED10 = ~busy; 					// turn on bottom LED when busy  

endmodule

