// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//                          CC_decoder.v
//-----------------------------------------------------------------------------

//
//  HPSDR - High Performance Software Defined Radio
//
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


//  Copyright 2010, 2011, 2012, 2013, 2014  Phil Harman VK6(A)PH

// ***** need to check sequence error 

/*
	The maximum payload length in a UDP frame is 1444 bytes (without fragmentation).
	We use 4 bytes to hold the sequency number so 1440 bytes are avaialble for data.
	In which case we count the frame from 0 to 1443.
	
	When the code detects that the frame is for the C&C port (1027) then the MSB
	of the sequence number is received.  We then read the next 3 bytes to complete the 
	sequence number.  Hence at the end of the sequence number the byte_number is 2.
	
	Note that udp_rx_active will drop once the UDP packet has been received. In which case there is 
	no need to detect the end of packet. 
	
			Byte  Data

				0	Seq #	[31:24]
				1	Seq #	[23:16]
				2	Seq #	[15:8]
				3	Seq #	[7:0]
				4	Number of DACs	Max of 4
				5	Bits - Mode, CW, Reverse, Key Mode	See Below
				6	Sidetone Level 	
				7	Sidetone Frequency (Hz)	[15:8]
				8	Sidetone Frequency (Hz)	[7:0]
				9	Keyer Speed	
				10	Keyer Weight	
				11	Hang delay 	[15:8]
				12	Hang delay 	[7:0]
				13	RF Delay	
				14	Tx0 Sampling Rate	[15:8]
				15	Tx0 Sampling Rate	[7:0]
	
				50	Bits - line in, mic boost,  Orion mic	See Below
				51	Line in gain 	
				52	Step Attenuator ADC7 on Tx (0 - 31dB)	
				53	Step Attenuator ADC6 on Tx (0 - 31dB)	
				54	Step Attenuator ADC5 on Tx (0 - 31dB)	
				55	Step Attenuator ADC4 on Tx (0 - 31dB)	
				56	Step Attenuator ADC3 on Tx (0 - 31dB)	
				57	Step Attenuator ADC2 on Tx (0 - 31dB)	
				58	Step Attenuator ADC1 on Tx (0 - 31dB)	
				59	Step Attenuator ADC0 on Tx (0 - 31dB)	
						
						
				Bits - Mode, CW, Reverse, Key Mode	
				[0] = EER	
				[1] = CW	
				[2] = Reverse CW Keys	
				[3] = Iambic	
				[4] = Sidetone	
				[5] = Mode B	
				[6] = Strict Character Spacing	
				[7] = Break_in	
					
					
				Bits - line in, mic boost,  Orion mic	
				[0] = Line in 	
				[1] = Mic Boost	
				[2] =  0 =  Orion mic PTT enabled, 1 = Orion mic PTT disabled	
				[3] = 0 = Orion mic ptt to ring and mic/mic bias to tip, 1 = Orion mic ptt to tip and mic/mic bias to ring	
				[4] = 0 = disables Orion mic bias, 1 = enables Orion microphone bias	
				
*/				

module Tx_specific_CC 
			( 	
				input clock,
				input [15:0] to_port,
				input udp_rx_active,
				input [7:0] udp_rx_data,
				output reg EER,
				output reg internal_CW,
				output reg key_reverse, 
				output reg iambic,
				output reg sidetone, 
				output reg keyer_mode, 
				output reg keyer_spacing,
				output reg break_in, 						
				output reg [7:0]sidetone_level, 
				output reg [11:0]tone_freq, 
				output reg [5:0]keyer_speed,	
				output reg [7:0]keyer_weight,
				output reg [9:0]hang, 
				output reg [7:0]RF_delay,
				output reg Line_In,
				output reg [4:0]Line_In_Gain,
				output reg Mic_boost,
				output reg Orion_micPTT_disable,
				output reg Orion_tip_ring_select,
				output reg MICBIAS_ENABLE,
				output reg [4:0]Orion_atten_Tx1,
				output reg [4:0]Orion_atten_Tx0,
				output reg data_ready,
				output  HW_reset

			);
			
parameter port = 16'd1026; 			

localparam 
				IDLE = 1'd0,
				PROCESS = 1'd1;
			
reg [31:0] CC_sequence_number;
reg [10:0] byte_number;
reg [31:0] temp_Rx1_frequency;
reg [31:0] temp_Rx2_frequency;
reg [31:0] temp_Tx1_frequency;

reg state;

			
always @(posedge clock)
begin
  if (udp_rx_active && to_port == port)				// look for to_port = 1026
    case (state)
      IDLE:	
				begin
				data_ready <= 0;
			//	HW_reset <= 1'b1;
				byte_number <= 11'd1;    // since byte 0 is received here 
				CC_sequence_number <= {CC_sequence_number[31-8:0], udp_rx_data};  //save MSB of sequence number
				state <= PROCESS;
				end 
			
		PROCESS:
			begin
				case (byte_number) 	//save balance of sequence number
				  1,2,3: begin
								CC_sequence_number <= {CC_sequence_number[31-8:0], udp_rx_data};
							//	HW_reset <= 1'b1;
							end 

					   5: begin
								EER 						<= udp_rx_data[0];
								internal_CW 			<= udp_rx_data[1];
								key_reverse 			<= udp_rx_data[2];
								iambic 					<= udp_rx_data[3];
							   sidetone 				<= udp_rx_data[4];
							   keyer_mode	 			<= udp_rx_data[5];
							   keyer_spacing 			<= udp_rx_data[6];
								break_in 				<= udp_rx_data[7];						
							 end
						6: sidetone_level 			<= udp_rx_data;
					   7: tone_freq[11:8]   		<= udp_rx_data[3:0];
					   8: tone_freq[7:0]	   		<= udp_rx_data;
						9: keyer_speed[5:0]			<= udp_rx_data[5:0];
					  10: keyer_weight				<= udp_rx_data;
					  11: hang[9:8]					<= udp_rx_data[1:0];
					  12: hang[7:0]					<= udp_rx_data;
					  13: RF_delay						<= udp_rx_data;

					 
					  50: begin 
								Line_In 					<= udp_rx_data[0];
								Mic_boost				<= udp_rx_data[1];
								Orion_micPTT_disable <= udp_rx_data[2];
								Orion_tip_ring_select <= udp_rx_data[3];
								MICBIAS_ENABLE			<= udp_rx_data[4];
							end
					  51: Line_In_Gain[4:0]			<= udp_rx_data[4:0];	
					  58: begin
								Orion_atten_Tx1[4:0]	<= udp_rx_data[4:0];
								data_ready <= 1'b1;
							end 
					  59: begin 
								Orion_atten_Tx0[4:0]	<= udp_rx_data[4:0];
								data_ready <= 1'b0;
							//	HW_reset <= 1'b0;
							end 
									  
			   default: if (byte_number > 11'd59) state <= IDLE;  // change this when increasing data size
			   endcase  
		  
				byte_number <= byte_number + 11'd1;
			end
		default: state <= IDLE;
		endcase 
	else state <= IDLE;	

end		
			
// inhibit HW_reset if Ethernet data stops 
assign HW_reset = (byte_number > 4  && udp_rx_active);			
			
endmodule			