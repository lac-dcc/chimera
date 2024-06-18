// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

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


//  Led_control - Copyright 2009, 2010, 2011  Phil Harman VK6APH


// Led control module

// setting on  		 = high turns the LED on
// setting slow_flash = high flashes the LED once per second 
// setting fast_flash = high flashes the LED 5 times per second
// setting vary       = high flashes the LED fast then slow

// clock is at 25MHz 


module Led_control (clock, on, slow_flash, fast_flash, vary, LED);

input clock;
input on;
input slow_flash;
input fast_flash;
input vary;

output reg LED;

parameter clock_speed = 1;

// calculate timer variables based on clock_speed passed

localparam slow_period = clock_speed/2;		// one flash per second
localparam fast_period = clock_speed/10;		// 5 flashes per second


reg [23:0]counter;
reg [24:0]period;
reg [1:0]swap;

always @ (posedge clock)
begin
		if (on)
			LED <= 0;
		else if (vary) begin
			if (swap == 0 || swap == 1)
			 period <= slow_period;
			else
			 period <= fast_period;
			if (counter == period) begin
				LED <= ~LED;
				counter <= 0;
				swap <= swap + 1'b1;
			end
			else counter <= counter + 1'b1;
		end
		else if (slow_flash) begin
			if (counter == slow_period) begin
				LED <= ~LED;
				counter <= 0;
			end 
			else counter <= counter + 1'b1;
		end 
		else if (fast_flash) begin
			if (counter == fast_period) begin
				LED <= ~LED;
				counter <= 0;
			end 
			else counter <= counter + 1'b1;
		end
  
		else LED <= 1'b1;    // LED off 		
end
endmodule
