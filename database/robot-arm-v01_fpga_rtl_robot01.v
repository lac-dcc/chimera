//=============================================================================================
// 6-Axis Robot Arm Motion Engine
// Copyright 2015 by Glen Akins.
// All rights reserved.
// 
// Set editor width to 96 and tab stop to 4.
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
//=============================================================================================

//=============================================================================================
// robot01
//

module robot01
(
	input	wire			arst_n,
	input	wire			clk50_in,

	output	wire			ledHeartbeat,

	input	wire			uartRxd,
	output	wire			uartTxd,
	input	wire			uartCts_n,
	output	wire			uartRts_n,

	output	wire	[5:0]	mDir,
	output	wire	[5:0]	mStep,

	output	wire	[7:0]	LED
);


//---------------------------------------------------------------------------------------------
// clock generator
//

wire clk50, clk10, locked, clk50_rst, clk10_rst;

// generate clocks
clk_wiz_0 clk_wiz_0
(
	.clk50_in			(clk50_in),
	.clk50				(clk50),
	.clk10				(clk10),
	.locked				(locked)
);

// generate clk50 sync reset
sync_reset sync_reset_50
(
	.clk				(clk50),
	.arst_n				(arst_n),
	.locked				(locked),
	.rst				(clk50_rst)
);

// generate clk10 sync reset
sync_reset sync_reset_10
(
	.clk				(clk10),
	.arst_n				(arst_n),
	.locked				(locked),
	.rst				(clk10_rst)
);


//---------------------------------------------------------------------------------------------
// 10MHz heartbeat led
//

heartbeat heartbeat 
(
	.rst				(clk10_rst),
	.clk				(clk10),
	.led				(ledHeartbeat)
);


//---------------------------------------------------------------------------------------------
// microblaze mcs
//

wire plbEn, plbRd, plbWr, plbReady;
wire [3:0] plbBE;
wire [31:0] plbAddr, plbRdData, plbWrData;

microblaze_mcs_0 microblaze_mcs_0
(
  .Clk					(clk10),
  .Reset				(clk10_rst),
  .IO_Addr_Strobe		(plbEn),
  .IO_Read_Strobe		(plbRd),
  .IO_Write_Strobe		(plbWr),
  .IO_Address			(plbAddr),
  .IO_Byte_Enable		(plbBE),
  .IO_Write_Data		(plbWrData),
  .IO_Read_Data			(plbRdData),
  .IO_Ready				(plbReady),
  .UART_Rx				(uartRxd),
  .UART_Tx				(uartTxd)
);


//---------------------------------------------------------------------------------------------
// six axis controller
//

wire [5:0] mAlarm;

sixaxis sixaxis
(
	.rst				(clk10_rst),
	.clk				(clk10),
	
	.plbEn				(plbEn),
	.plbRd				(plbRd),
	.plbWr				(plbWr),
	.plbBE				(plbBE),
	.plbAddr			(plbAddr),
	.plbWrData			(plbWrData),
	.plbReady			(plbReady),
	.plbRdData			(plbRdData),

	.mAlarm				(mAlarm),
	.mDir				(mDir),
	.mStep				(mStep)
);


//---------------------------------------------------------------------------------------------
// misc
//

assign LED[7:2] = mAlarm[5:0];
assign LED[1] = !uartRxd;
assign LED[0] = !uartTxd;

assign uartRts_n = uartCts_n;

endmodule
