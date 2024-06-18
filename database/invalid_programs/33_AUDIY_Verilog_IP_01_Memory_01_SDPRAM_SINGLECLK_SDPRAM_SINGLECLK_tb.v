// This program was cloned from: https://github.com/AUDIY/AUDIY_Verilog_IP
// License: CERN Open Hardware Licence Version 2 - Permissive

/*----------------------------------------------------------------------------
* SDPRAM_SINGLECLK_tb.v
*
* Test bench for Simple Dual-Port RAM (Single Clock)
*
* Version: 0.10
* Author : AUDIY
* Date   : 2023/12/10
*
* License under CERN-OHL-P v2
--------------------------------------------------------------------------------
| Copyright AUDIY 2023.                                                        |
|                                                                              |
| This source describes Open Hardware and is licensed under the CERN-OHL-P v2. |
|                                                                              |
| You may redistribute and modify this source and make products using it under |
| the terms of the CERN-OHL-P v2 (https:/cern.ch/cern-ohl).                    |
|                                                                              |
| This source is distributed WITHOUT ANY EXPRESS OR IMPLIED WARRANTY,          |
| INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A         |
| PARTICULAR PURPOSE. Please see the CERN-OHL-P v2 for applicable conditions.  |
--------------------------------------------------------------------------------
*
-----------------------------------------------------------------------------*/

`resetall
`timescale 1ns/10ps

module sim
#(
	parameter DATA_WIDTH=8,
	parameter ADDR_WIDTH=9,
	parameter OUTPUT_REG="FALSE",
	parameter RAM_INIT_FILE="ram_init_file.mem"
)
();

reg [DATA_WIDTH-1:0] wdata, expected;
reg [ADDR_WIDTH-1:0] waddr, raddr;
reg wclk, we, re, clock;
wire [DATA_WIDTH-1:0] rdata;
integer cycle_count;

// Instantiate the DUT (design under test)
SDPRAM_SINGLECLK
#(
	.DATA_WIDTH(DATA_WIDTH),
	.ADDR_WIDTH(ADDR_WIDTH),
	.OUTPUT_REG(OUTPUT_REG),
	.RAM_INIT_FILE(RAM_INIT_FILE)
) 
dut2
(
	.CLK_I(wclk),
	.WADDR_I(waddr),
	.WENABLE_I(we),
	.WDATA_I(wdata),
	.RADDR_I(raddr),
	.RENABLE_I(re),
	.RDATA_O(rdata)
);

initial begin
	$dumpfile("outflow/SDPRAM_SINGLECLK.vcd");
	$dumpvars(0, sim);
	
	// Initialize the DUT inputs
	wdata = 70;
	waddr = 0;
	wclk = 0;
	we = 0;
	raddr = 0;
	re = 0;
	rclk = 0;
	
	// Initialize the system clock
	clock = 0;
	   
	// Give 2 cycles for initial state to settle
	cycle_count = -4;
end // initial begin

// Generate the clocks
// drive read & write clock from same system clock
always #75 begin
	clock = ~clock;
	#25 rclk = ~rclk;
	#25 wclk = ~wclk;
end

// Increment the cycle counter on the postive clock
always @(negedge clock) begin

cycle_count = cycle_count + 1;

// Allow 3 complete traversals of the memory address space
if (cycle_count == 77)
	begin
		$display("TEST : PASS");
		$finish;
	end
end

// Simulate the write port
always @(negedge wclk) begin
	// let some cycles go before starting the writing and reading
	if (cycle_count == -1) begin
	   // Enable writing just before cycle 0
	   we = 1;
	end
	
	else if (cycle_count >= 0) begin
		$display("%t === === === Write Cycle:%d === === ===", $time, cycle_count);
		$display("WDATA : %d\tWADDR : %d\tWE : %d", wdata, waddr, we);
	
		//Increment data and address
		wdata = wdata + 2;
		waddr = waddr + 1;
	end
end

// Simulate the read port
always @(negedge rclk) begin
	// let some cycles go before starting the writing and reading
	if (cycle_count == -1) begin
		// Enable reading just before cycle 0
		re = 1;
	end
   
	else if (cycle_count >= 0) begin
	    $display("%t === === === Read Cycle: %d === === ===", $time, cycle_count);
		$display("RADDR : %d\tRE : %d", raddr, re);
		$display("\tRDATA : %d", rdata);

		// First read 256 uninitialized memory locations
		if (cycle_count < 512) begin
			expected = 255 - cycle_count;
		end

		// For the next 256 reads the data should be the value 00-FF
		if (cycle_count >= 512) begin
			expected = 70 + ((cycle_count - 512) * 2);
		end
 	 		 		 
		if (expected !== rdata) begin
			$display("\tMISMATCH: Expected %d got RDATA : %d", expected, rdata);
			$display("TEST : FAIL");
			$finish();
		end

		// Increment address
		raddr = raddr + 1;

	end
end

endmodule
