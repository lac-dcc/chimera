// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

// ---------------------------------------------------------------------------
//
// frequency counter module
//
//	
//
// Written by Chris van Dongen/SMDprutser for the buspirate NextGen Ultra
//
// ---------------------------------------------------------------------------

module freqcount (
rst,
clkin,

signaledge,			// trigger on posedge (1) or neg edge (0)

signal,				// signal to count
count,				// we counted count cycles
);

input rst;
input clkin;
input signaledge;
input signal;
output reg [15:0] count;
reg [15:0] internalcount;
reg [15:0] clockcount;

reg signal_last;

always @(posedge clkin or posedge rst)
if (rst)
begin
	signal_last <= 1'b0;
	internalcount <= 16'b0;
	clockcount <= 16'b0;
	count <= 16'b0;
end
else
begin
	if (signaledge == 1'b0)						// count negative edge
	begin
		if((signal_last == 1'b1)&&(signal == 1'b0))
		begin
			internalcount <= internalcount + 1;
		end
	end
	else										// count positive edge
	begin
		if((signal_last == 1'b0)&&(signal == 1'b1))
		begin
			internalcount <= internalcount + 1;
		end
	end
	
	signal_last <= signal;						// synchronize

	clockcount <= clockcount + 1;				// update clockcounter

	if (clockcount == 16'b0)					// we counted 65536 for clockcycles
	begin
		count <= internalcount;
		internalcount <= 0;
	end
end

endmodule