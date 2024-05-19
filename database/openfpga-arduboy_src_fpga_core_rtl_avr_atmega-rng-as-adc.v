// This program was cloned from: https://github.com/agg23/openfpga-arduboy
// License: GNU General Public License v3.0

/*
 * This IP is the ATMEGA random generator implementation.
 * 
 * Copyright (C) 2020  Iulian Gheorghiu (morgoth@devboard.tech)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */


module atmega_rng_as_adc # (
	parameter PLATFORM = "XILINX",
	parameter BUS_ADDR_DATA_LEN = 8,
	parameter RNG_BIT_NR = 10,
	parameter ADCL_ADDR = 'h78,
	parameter ADCH_ADDR = 'h79,
	parameter ADCSRA_ADDR = 'h7A,
	parameter ADCSRB_ADDR = 'h7B,
	parameter ADMUX_ADDR = 'h7C
)(
	input rst_i,
	input clk_i,

	input [BUS_ADDR_DATA_LEN-1:0]addr_i,
	input wr_i,
	input rd_i,
	input [7:0]bus_i,
	output reg [7:0]bus_o
    );

reg [7:0]ADCL;
reg [7:0]ADCH;
reg [7:0]ADCSRA;
reg [7:0]ADCSRB;
wire [RNG_BIT_NR - 1:0]b = {ADCH, ADCL};

reg feedback;
generate
always @ *
begin
if(RNG_BIT_NR == 8)
	feedback = b[7] ^ b[5] ^ b[4] ^ b[3];
else if(RNG_BIT_NR == 9)
	feedback = b[8] ^ b[4];
else if(RNG_BIT_NR == 10)
	feedback = b[9] ^ b[6];
else if(RNG_BIT_NR == 11)
	feedback = b[10] ^ b[8];
else if(RNG_BIT_NR == 12)
	feedback = b[11] ^ b[5] ^ b[3] ^ b[0];
else if(RNG_BIT_NR == 13)
	feedback = b[12] ^ b[3] ^ b[2] ^ b[0];
else if(RNG_BIT_NR == 14)
	feedback = b[13] ^ b[4] ^ b[2] ^ b[0];
else if(RNG_BIT_NR == 15)
	feedback = b[14] ^ b[13];
else if(RNG_BIT_NR == 16)
	feedback = b[15] ^ b[14] ^ b[12] ^ b[3];
end
endgenerate

always @ *
begin
	bus_o = 8'h0;
	if(rd_i & ~rst_i)
	begin
		case(addr_i)
			ADCL_ADDR: bus_o = ADCL;
			ADCH_ADDR: bus_o = ADCH;
			//ADCSRA_ADDR: bus_o = ADCSRA;
			//ADCSRB_ADDR: bus_o = ADCSRB;
		endcase
	end
end

always @ (posedge clk_i)
begin
	if(rst_i)
	begin
		ADCL <= 8'hFF;
		ADCH <= 08'hFF;
		//ADCSRA <= 0;
		//ADCSRB <= 0;
	end
	else
	begin
		//if(wr)
		//begin
		//	case(addr)
		//		ADCSRA_ADDR: ADCSRA <= bus_out;
		//		ADCSRB_ADDR: ADCSRB <= bus_out;
		//	endcase
		//end
		{ADCH, ADCL} <= {b[RNG_BIT_NR - 2 : 0], feedback};
	end
end

endmodule
