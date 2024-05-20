// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
//                          Mic_fifo_ctrl.v
//-----------------------------------------------------------------------------

//
//  HPSDR - High Performance Software Defined Radio
//
//  Metis code. 
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


//  Metis code copyright 2010, 2011, 2012, 2013 Phil Harman VK6PH


// Write mic data to Mic_FIFO
// NOTE:  At power on the FIFO will fill since no data is being requested by the PC.
// In which case need to check that the fifo is not full and if so clear it. 



module Mic_fifo_ctrl(
	input reset,
	input clock,
	input spd_rdy,
	input fifo_full,
	
	output reg spd_ack,
	output reg wrenable,
	output reg fifo_clear
	);
	

reg [2:0]state;
	
always @ (posedge clock)
begin 
	if (reset) 	spd_ack <= 1'b0;
	else spd_ack <= spd_rdy;  // ack nWire data received

case(state)
0:	begin
		fifo_clear <= 1'b0;
		if (fifo_full) state <= 2; 		// clear fifo, will need to do this if code has been idle
	   else if(spd_rdy) begin 
			wrenable <= 1'b1;
			state <= 1;
		end
	end 
1:	begin 		// wait for spd_rdy to go low
	wrenable <= 0;
	if (!spd_rdy) state <= 0;
	end
	
2: begin
	fifo_clear <= 1'b1;
	state <= 0;
	end

default: state <= 0;
endcase
end	

	
endmodule

