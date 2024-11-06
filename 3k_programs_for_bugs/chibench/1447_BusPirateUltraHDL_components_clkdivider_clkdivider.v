// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// Clockdivider
//
//	
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
// SPI info here: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
//
// ---------------------------------------------------------------------------



module clockdiv (
rst,					// reset
clkin,					// clock in
clkout,					// clock out
halfperiod				// #ticks in half period
);

input rst;
input clkin;
output reg clkout;
input [16:0] halfperiod;

reg [16:0] count;
reg [16:0] lasthalfperiod;

always @ (posedge clkin or posedge rst)
if (rst)
begin
	count = 16'b0000000000000000;
	clkout = 1'b0;
end
else
begin
	if (halfperiod != lasthalfperiod)		// reset count if period has changed
		count = 16'b0;
		
	lasthalfperiod = halfperiod;

	if (count == halfperiod)				// flip clock after halfperiod clocks
	begin
		count = 16'b0000000000000000;
		clkout = ~clkout;
	end
	else
	begin
		count = count + 1'b1;
	end
end

endmodule