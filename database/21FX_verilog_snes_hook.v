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
// Module Name: snes_hook (Verilog)
//
// Interfaces: (1) 40 MHz clock in
//             (2) address bus B and databus inputs
//             (3) SNES Reset and Address bus B Read and Write (all active low)
//
// Clock Domains: (1) 40 MHz (clk) - sourced on board clock
//                (2) async RAW snes addr/data bus, (typically switches around 2MHz - 3MHz)
//
// Description: This is the top level module for the SNES-Hook CPLD. It's only job ia to come
// out of reset search for the SNES CPU access to vector $00FFFC and override the reset vector
// to point to $2184. Futhermore the CPLD sits on address range $2184-$21FF and feeds its ROM
// contents to the SNES CPU during access. A primary bootloader is intended to be stored in this
// ROM and is defined in bootcode.hex


module snes_hook (
	input                clk,
	input                rst_n,
	input [7:0]          addr,
	inout [7:0]          data,
	input                PARD_n,
	input                PAWR_n,
	input                USB_RXFn,
	input                USB_TXEn,
	output reg           USB_RDn,
	output reg           USB_WRn,
	input                USB_BIT0,
	input                USB_BIT1,
	output reg           ROM_oe_n,
	output               ROM_wr_n,	
	output reg [3:0]     glitch_force
);

   
	
	// General Variables
	reg       data_enable;
	wire      bus_latch;
	reg       bus_latch_r1;
	reg [7:0] data_out;
	reg [7:0] hist;
	reg punch;
	reg [3:0] delay_write;
	wire usb_active;
	
	// State Machine Variables and Parameters
	reg [2:0] HOOK_STATE;
	parameter ST_INIT                 = 3'h0;
	parameter ST_RST_FOUND            = 3'h1;
	parameter ST_SCAN_1               = 3'h2;
	parameter ST_SCAN_2               = 3'h3;
	parameter ST_SCAN_3               = 3'h4;
	parameter ST_IRQ_1                = 3'h5;
	parameter ST_IRQ_2                = 3'h6;

	// Forced Assignments
   assign ROM_wr_n = 1;
	assign data = (punch) ? data_out : 8'hZZ; // Bi-directional databus assignments
	assign usb_active = (~USB_BIT0 & USB_BIT1) ? 1'b1 : 1'b0;
	
	snes_bus_sync bus_sync (
		.clk(clk),                    // clock (40 MHz and reset)
		.rst_n(rst_n),
		.PA(addr),                    // RAW SNES addr bus
		.event_latch(bus_latch)       // Bus change event (detects changes in PA)
	);

	// Emulation RST vector hooking logic
	//
	// In this statemachine we assume the processor just came out of reset.
	// With that assumption we know that the first two address that will be
	// accessed is $00:FFFC and $00:FFFD. If we want to change the reset
	// vector address we need to identify the CPU cycle when the address is
	// on the data bus.

	always @(posedge clk or negedge rst_n) begin
		if (~rst_n) begin // reset regs
			HOOK_STATE   <= ST_INIT;
			bus_latch_r1 <= 1'b0;
			delay_write  <= 3'b111;
		end else begin
		   bus_latch_r1 <= bus_latch;
			
			delay_write[3]   <= (PARD_n && (HOOK_STATE != ST_INIT) && (HOOK_STATE != ST_RST_FOUND)) ? PAWR_n : 1'b1;
			delay_write[2:0] <= delay_write[3:1];
		
			if (bus_latch_r1 == 0 && bus_latch == 1) begin
				hist <= addr;
				case (HOOK_STATE)
					// This is the first state, SNES has been reset and we are waiting for the
					// processor to go to the reset vector low address
					ST_INIT: begin
						if (addr == 8'hFC) begin // address found! next wait for the high word address
							if (usb_active) HOOK_STATE <= ST_RST_FOUND; // go to the high word search state
							else HOOK_STATE <= ST_SCAN_1;
						end
					end				
					ST_RST_FOUND: begin
						if (~punch) begin
							HOOK_STATE <= ST_SCAN_1;
						end
					end				
					ST_SCAN_1: begin
						//if (addr == (hist-1) && ~USB_RXFn && usb_active) HOOK_STATE <= ST_SCAN_2;
						HOOK_STATE <= ST_SCAN_1; // Optimize out NMI search code
					end
					
					ST_SCAN_2: begin
						if (addr == (hist-1)) HOOK_STATE <= ST_SCAN_3;
						else HOOK_STATE <= ST_SCAN_1;
					end
					
					ST_SCAN_3: begin
						if (addr == (hist-1)) HOOK_STATE <= ST_IRQ_1;
						else HOOK_STATE <= ST_SCAN_1;
					end
					
					ST_IRQ_1: begin
						HOOK_STATE <= ST_IRQ_2;
						if (~punch) HOOK_STATE <= ST_SCAN_1;
					end
					
					ST_IRQ_2: begin
						if (~punch) HOOK_STATE <= ST_SCAN_1;
					end
				endcase
			end

			
		end 
	end
	
	
	
	always @(*) begin
		USB_RDn = 1;
		USB_WRn = 1;
		ROM_oe_n = 1;
		data_out = 0;
		punch = 0;
		glitch_force = 4'bZZZZ;
		if ((HOOK_STATE == ST_INIT || HOOK_STATE == ST_RST_FOUND) && (addr == 8'hFC)) begin
			punch = 1;
			data_out = 8'h84; // These lines override the vector when reset vector is detected
			glitch_force[2] = 1'b1;
			glitch_force[0] = 1'b1;
		end
		if ((HOOK_STATE == ST_RST_FOUND) && (addr == 8'hFD)) begin
		   punch = 1;
			data_out = 8'h21;
			glitch_force[3] = 1'b1;
			glitch_force[1] = 1'b1;
		end
		if ((HOOK_STATE == ST_IRQ_2 || HOOK_STATE == ST_IRQ_1) && (addr == 8'hEA)) begin
			punch = 1;
			data_out = 8'h84; // These lines override the vector when reset vector is detected
			glitch_force[2] = 1'b1;
			glitch_force[0] = 1'b1;
		end
		if ((HOOK_STATE == ST_IRQ_2) && (addr == 8'hEB)) begin
			punch = 1;
			data_out = 8'h21;
			glitch_force[3] = 1'b1;
			glitch_force[1] = 1'b1;
		end
		
		if (addr == 8'hFE && ~PARD_n) begin
			punch = 1;
			if (usb_active) data_out = {~USB_RXFn,~USB_TXEn,1'b1,5'b00000};
			else data_out = 8'b00000000;
		end
		else if (addr == 8'hFF && ~PARD_n) begin
			USB_RDn = 0;
		end
		else if (addr == 8'hFF && ~PAWR_n) begin
			USB_WRn = |delay_write[1:0];
		end
		else if (addr[7] && |addr[6:2] && ~PARD_n) begin // If there is a read to addr $2184-$21FF, return contents addressed in ROM 
			ROM_oe_n = 0;
		end
	end

	

endmodule
