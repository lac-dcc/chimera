// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// pwm module
//
//
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
// SPI info here: https://en.wikipedia.org/wiki/Serial_Peripheral_Interface
//
// ---------------------------------------------------------------------------
`ifndef __PWM__
`define __PWM__
module pwm (
rst,					// reset
clkin,					// clock in
clkout,					// clock out
onperiod,				// #ticks period ontime
offperiod				// #ticks period offtime
);

localparam RESOLUTION = 16; //can we convert all the 16'b so this works automatically?
localparam  _RESOLUTION = RESOLUTION -1;

input rst;
input clkin;
output reg clkout;
input [_RESOLUTION:0] onperiod;
input [_RESOLUTION:0] offperiod;

reg [_RESOLUTION:0] count;
reg [_RESOLUTION:0] lastonperiod;
reg [_RESOLUTION:0] lastoffperiod;

always @ (posedge clkin or posedge rst)
if (rst)
begin
	count <= 16'b0000000000000000;
	clkout <= 1'b0;
end
else
begin
	if (onperiod != lastonperiod)		// reset count if onperiod has changed
		count <= 16'b0;
	if (offperiod != lastoffperiod)		// reset count if offperiod has changed
		count <= 16'b0;

	lastonperiod = onperiod;
	lastoffperiod = offperiod;

	if (clkout == 0)
	begin
		if (count == offperiod)				// flip clock after halfperiod clocks
		begin
			count <= 16'b0000000000000000;
			clkout <= 1;
		end
		else
		begin
			count <= count + 1'b1;
		end
	end
	else
	begin
		if (count == onperiod)				// flip clock after halfperiod clocks
		begin
			count <= 16'b0000000000000000;
			clkout <= 0;
		end
		else
		begin
			count <= count + 1'b1;
		end
	end

end

endmodule
`endif
