// This program was cloned from: https://github.com/defparam/21FX
// License: GNU General Public License v3.0

// SNES-Hook - A tiny 5V CPLD device to hijack reset on the SNES console
//
// Copyright (C) 2015 Evan Custodio
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
////////////////////////////////////////////////////////////////////////////
//
// Project Name: SNES-Hook
// Author: Evan Custodio (@defparam)
//
// Module Name: snes_bus_sync (Verilog)
//
// Interfaces: (1) SNES raw address bus and read/write enable signals
//             (2) Synced address bus and databus outputs
//             (3) Synced latch event signal during an address bus change
//
// Clock Domains: (1) 40 MHz (clk) - sourced on board clock
//                (2) async RAW snes ports, (typically switches around 2MHz - 3MHz)
//
// Description: A bus access is defined as an SNES access to the address A bus.
// The difference here between this module and the port sync module is that the port
// sync module has read and write enable signals to help realize the bus access. This
// module just observe the address bus for "address switches". Once this module synchronizes
// an address bus "switch" then logic in the 40Mhz domain can safely analyse Address A bus
// accesses. We use this in SNES-Tap to help locate when the processor accesses the reset vector
// and the NMI vector.


module snes_bus_sync (
	input        clk,              // clock (40 MHz and reset)
	input        rst_n,
	input  [7:0] PA,               // RAW SNES addr bus
	output       event_latch       // Bus change event (detects changes in PA)
);

	parameter OUT_OF_SYNC = 1'b1;
	parameter IN_SYNC     = 1'b0;

	reg [7:0]  PA_store [0:1];
	reg        sync_state = IN_SYNC;

	reg bus_latch = 0;


	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin
			PA_store[0] <= 8'b0; // reset all regs
			PA_store[1] <= 8'b0;
			bus_latch   <= 1'b0;
			sync_state  <= IN_SYNC;
		end
		else begin
			PA_store[0] <= PA;          // These registers are used for both metastability protection
			PA_store[1] <= PA_store[0]; // and for address bus "change" detection (3 stages)
			if (sync_state == IN_SYNC) begin // IN_SYNC state means the bus has settled and events/outputs have been reported
				// The addr bus has been pipelined for 3 stages, move into the OUT_OF_SYNC state once a change in addr is detected
				// we also ignore this check if 5 cycles haven't gone by on the previous check
				if (((PA != PA_store[0]) || (PA_store[1] != PA_store[0]))) begin
					sync_state <= OUT_OF_SYNC; // go to OUT_OF_SYNC
					bus_latch <= 0;            // initialize
				end
			end else if (sync_state == OUT_OF_SYNC) begin
				bus_latch  <= 0;
				// The addr bus has under gone a change, detect when it has settled and move back into IN_SYNC
				if ((PA == PA_store[0]) && (PA_store[1] == PA_store[0])) begin
					bus_latch <= 1;
					sync_state <= IN_SYNC;
				end
			end
		end
	end
	
	// Report back safe synchronized bus events and data/addr
	assign event_latch    = bus_latch;

endmodule
// synopsys translate off
`timescale 1ns / 100ps

module snes_bus_sync_test ();

reg clk = 0;
reg cycle_clk = 0;
reg rst_n = 0;
reg [7:0] PA = 0;
reg [7:0] D = 0;
wire [7:0] PA_sync;
wire [7:0] D_sync;
wire event_latch;
reg PARD_n = 1;

snes_bus_sync bs (
	.clk(clk),                      // clock (40 MHz and reset)
	.rst_n(rst_n),
	.PA(PA),                        // RAW SNES addr bus
	.event_latch(event_latch)       // Bus change event (detects changes in PA)
);

always #14.3 clk = ~clk;
always #139.6 cycle_clk = ~cycle_clk;
initial #1000 rst_n = 1;

always @(posedge cycle_clk) begin
	if (PARD_n) PARD_n = $random % 2;
	else PARD_n = 1;
	D  = $random; #2;
	D  = $random; #2;
	D  = $random; #2;
	D  = $random; #2;
	D  = $random; #2;
end
always @(posedge cycle_clk) begin
	PA = $random; #2;
	PA = $random; #2;
	PA = $random; #2;
	PA = $random; #2;
	PA = $random; #2;
end



endmodule
// synopsys translate on
