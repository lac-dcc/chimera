// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

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


//  Sidetone - 2014  (C) Phil Harman VK6PH

/*************************************************************************

	The sidetone is generated using an 256 value sine wave ROM look-up table
	(sine_256.mif) and a Direct Digital Synthesiser. 

	DDS description
	
	The DDS works by adding a constant value to an accumulator and using the overlow 
	as the address of a sine table.  The constant is determined from the frequency 
	required to be generated as follows:
	
		constant = Fout * (sine table size) * (accumulator size) / Fpwm
		
		hence for 600Hz, a 256 entry sine table, 2^16 accumalator and 48ksps
		
		constant = 600 * 256 * 2^16 /48000 = 209,715
		
	In order to calculate the constant for the required frequency use
		
		constant = Fout * 256 * 2^16 /48000 = Fout * 350

		+--------------------------------------+
		|				24 bit constant				|
		+--------------------------------------+
		
		 Add constant to Accumulator at PWM rate
					
		+--------------------------------------+
		|16 bit Accumulator with 8 bit overflow|
		+--------------------------------------+					
		| [23:16] |
		|  8 bit  |
		|  ROM    |
		| Address |
		+---------------------------+
		|		16 bit sine value     |
		+---------------------------+
		
		
	The amplitude of the sine wave is set by multiplying the samples by the 
	sidetone_level.  Finaly a raised cosine profile is applied to the leading
	and trailing edges of the sine wave. The tone is produced whilst CW_PTT is
	active and enable is set.		

*/

module sidetone ( input clock,							// 48kHz
						input enable, 							// 0 = off, 1 = on
						input [11:0]tone_freq,
						input [7:0]sidetone_level,			// 0 to 0x7F since doing signed multiply
						input CW_PTT,
						input [15:0] profile,
						output signed [15:0]prof_sidetone						
					  );

// DDS test code

reg  [23:0]	 Accumulator;
reg   [7:0] sine_address;			// 256 entries in the sine table (sine_256.mif)
wire signed [15:0] sine_data;
wire signed [15:0] sidetone;
			  
always @ (posedge clock)		  // generate sidetone whilst key is pressed
begin
	if(CW_PTT & enable) 
		Accumulator <= Accumulator + (tone_freq * 24'd350);
end 
					  
sine_table_256 sine_table_inst (.address(Accumulator[23:16]), .clock(clock), .q(sine_data));	

// Since we are using signed values multiply the sidetone values by 2 to restore full range after multiplying by the profile
// The max value of the profile has been selected to give the maximum output of the RF DAC taking into account
// the CORDIC gain. If we multiply the profile by 1.75 we can achieve the same max sidetone volume as the PC generated version.

Multiply2	Multiply16x8  (.dataa (sine_data), .datab ({sidetone_level, 8'b0}), .result (sidetone));  // multiply sidetone by sidetone_level
Multiply2	Multiply16x16 (.dataa (sidetone << 1),  .datab (profile + (profile >> 1) + (profile >> 2)), .result (prof_sidetone));  // multiply sidetone by raised cosine profile


endmodule
