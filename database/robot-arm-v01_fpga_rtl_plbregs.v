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

module plbregs
(
    input   wire            	rst,            // sync active-high reset
    input   wire            	clk,            // 10MHz clock input

    input   wire            	plbEn,          // microblaze plb bus
    input   wire            	plbRd,
    input   wire            	plbWr,
    input   wire    	[3:0]   plbBE,
    input   wire    	[31:0]  plbAddr,
    input   wire    	[31:0]  plbWrData,
    output  reg	            	plbReady,
    output  reg	    	[31:0]  plbRdData,

	input	wire		[5:0]	mBusy,

	output	reg             	mX_prgmReq,
	input	wire            	mX_prgmAck,
	output	reg	 signed	[1:0]   mX_prgmDirection,
	output	reg  signed [31:0]  mX_prgmAcceleration,
	output	reg         [31:0]  mX_prgmAccelSamples,
	output	reg         [31:0]  mX_prgmCruiseSamples,

	output	reg                 mX_setEnable,
	output	reg	 signed [15:0]  mX_setPosition,
	output	reg	 signed [15:0]  mX_limitLo,
	output	reg	 signed [15:0]  mX_limitHi,
	output	reg					mX_alarmClear,
	input	wire                mX_alarm,
	input	wire signed [15:0]  mX_position,

	output	reg             	mY_prgmReq,
	input	wire            	mY_prgmAck,
	output	reg	 signed	[1:0]   mY_prgmDirection,
	output	reg  signed [31:0]  mY_prgmAcceleration,
	output	reg         [31:0]  mY_prgmAccelSamples,
	output	reg         [31:0]  mY_prgmCruiseSamples,

	output	reg                 mY_setEnable,
	output	reg	 signed [15:0]  mY_setPosition,
	output	reg	 signed [15:0]  mY_limitLo,
	output	reg	 signed [15:0]  mY_limitHi,
	output	reg					mY_alarmClear,
	input	wire                mY_alarm,
	input	wire signed [15:0]  mY_position,

	output	reg             	mZ_prgmReq,
	input	wire            	mZ_prgmAck,
	output	reg	 signed	[1:0]   mZ_prgmDirection,
	output	reg  signed [31:0]  mZ_prgmAcceleration,
	output	reg         [31:0]  mZ_prgmAccelSamples,
	output	reg         [31:0]  mZ_prgmCruiseSamples,

	output	reg                 mZ_setEnable,
	output	reg	 signed [15:0]  mZ_setPosition,
	output	reg	 signed [15:0]  mZ_limitLo,
	output	reg	 signed [15:0]  mZ_limitHi,
	output	reg					mZ_alarmClear,
	input	wire                mZ_alarm,
	input	wire signed [15:0]  mZ_position,

	output	reg             	mA_prgmReq,
	input	wire            	mA_prgmAck,
	output	reg	 signed	[1:0]   mA_prgmDirection,
	output	reg  signed [31:0]  mA_prgmAcceleration,
	output	reg         [31:0]  mA_prgmAccelSamples,
	output	reg         [31:0]  mA_prgmCruiseSamples,

	output	reg                 mA_setEnable,
	output	reg	 signed [15:0]  mA_setPosition,
	output	reg	 signed [15:0]  mA_limitLo,
	output	reg	 signed [15:0]  mA_limitHi,
	output	reg					mA_alarmClear,
	input	wire                mA_alarm,
	input	wire signed [15:0]  mA_position,

	output	reg             	mB_prgmReq,
	input	wire            	mB_prgmAck,
	output	reg	 signed	[1:0]   mB_prgmDirection,
	output	reg  signed [31:0]  mB_prgmAcceleration,
	output	reg         [31:0]  mB_prgmAccelSamples,
	output	reg         [31:0]  mB_prgmCruiseSamples,

	output	reg                 mB_setEnable,
	output	reg	 signed [15:0]  mB_setPosition,
	output	reg	 signed [15:0]  mB_limitLo,
	output	reg	 signed [15:0]  mB_limitHi,
	output	reg					mB_alarmClear,
	input	wire                mB_alarm,
	input	wire signed [15:0]  mB_position,

	output	reg             	mC_prgmReq,
	input	wire            	mC_prgmAck,
	output	reg	 signed	[1:0]   mC_prgmDirection,
	output	reg  signed [31:0]  mC_prgmAcceleration,
	output	reg         [31:0]  mC_prgmAccelSamples,
	output	reg         [31:0]  mC_prgmCruiseSamples,

	output	reg                 mC_setEnable,
	output	reg	 signed [15:0]  mC_setPosition,
	output	reg	 signed [15:0]  mC_limitLo,
	output	reg	 signed [15:0]  mC_limitHi,
	output	reg					mC_alarmClear,
	input	wire                mC_alarm,
	input	wire signed [15:0]  mC_position
);

always @ (posedge clk)
begin
	if (rst)
	begin
		plbReady <= 0;
		plbRdData <= 0;

		mX_prgmReq <= 0;
		mX_prgmDirection <= 0;
		mX_prgmAcceleration <= 0;
		mX_prgmAccelSamples <= 0;
		mX_prgmCruiseSamples <= 0;

		mX_setEnable <= 0;
		mX_setPosition <= 0;
		mX_limitLo <= 0;
		mX_limitHi <= 0;
		mX_alarmClear <= 0;

		mY_prgmReq <= 0;
		mY_prgmDirection <= 0;
		mY_prgmAcceleration <= 0;
		mY_prgmAccelSamples <= 0;
		mY_prgmCruiseSamples <= 0;

		mY_setEnable <= 0;
		mY_setPosition <= 0;
		mY_limitLo <= 0;
		mY_limitHi <= 0;
		mY_alarmClear <= 0;

		mZ_prgmReq <= 0;
		mZ_prgmDirection <= 0;
		mZ_prgmAcceleration <= 0;
		mZ_prgmAccelSamples <= 0;
		mZ_prgmCruiseSamples <= 0;

		mZ_setEnable <= 0;
		mZ_setPosition <= 0;
		mZ_limitLo <= 0;
		mZ_limitHi <= 0;
		mZ_alarmClear <= 0;

		mA_prgmReq <= 0;
		mA_prgmDirection <= 0;
		mA_prgmAcceleration <= 0;
		mA_prgmAccelSamples <= 0;
		mA_prgmCruiseSamples <= 0;

		mA_setEnable <= 0;
		mA_setPosition <= 0;
		mA_limitLo <= 0;
		mA_limitHi <= 0;
		mA_alarmClear <= 0;

		mB_prgmReq <= 0;
		mB_prgmDirection <= 0;
		mB_prgmAcceleration <= 0;
		mB_prgmAccelSamples <= 0;
		mB_prgmCruiseSamples <= 0;

		mB_setEnable <= 0;
		mB_setPosition <= 0;
		mB_limitLo <= 0;
		mB_limitHi <= 0;
		mB_alarmClear <= 0;

		mC_prgmReq <= 0;
		mC_prgmDirection <= 0;
		mC_prgmAcceleration <= 0;
		mC_prgmAccelSamples <= 0;
		mC_prgmCruiseSamples <= 0;

		mC_setEnable <= 0;
		mC_setPosition <= 0;
		mC_limitLo <= 0;
		mC_limitHi <= 0;
		mC_alarmClear <= 0;
	end
	else
	begin

		//
		// defaults
		//

		plbReady <= 0;
		mX_alarmClear <= 0;
		mX_setEnable <= 0;
		mY_alarmClear <= 0;
		mY_setEnable <= 0;
		mZ_alarmClear <= 0;
		mZ_setEnable <= 0;
		mA_alarmClear <= 0;
		mA_setEnable <= 0;
		mB_alarmClear <= 0;
		mB_setEnable <= 0;
		mC_alarmClear <= 0;
		mC_setEnable <= 0;
		
		//
		// programming requests / acknowledges
		//

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[5])
			mX_prgmReq <= 1;
		else if (mX_prgmAck)
			mX_prgmReq <= 0;

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[4])
			mY_prgmReq <= 1;
		else if (mX_prgmAck)
			mY_prgmReq <= 0;

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[3])
			mZ_prgmReq <= 1;
		else if (mX_prgmAck)
			mZ_prgmReq <= 0;

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[2])
			mA_prgmReq <= 1;
		else if (mX_prgmAck)
			mA_prgmReq <= 0;

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[1])
			mB_prgmReq <= 1;
		else if (mX_prgmAck)
			mB_prgmReq <= 0;

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h001) && plbWrData[0])
			mC_prgmReq <= 1;
		else if (mX_prgmAck)
			mC_prgmReq <= 0;

		//
		// alarm clears
		//

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[5])
		begin
			mX_alarmClear <= 1;
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[4])
		begin
			mY_alarmClear <= 1;
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[3])
		begin
			mZ_alarmClear <= 1;
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[2])
		begin
			mA_alarmClear <= 1;
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[1])
		begin
			mB_alarmClear <= 1;
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h002) && plbWrData[0])
		begin
			mC_alarmClear <= 1;
		end

		//
		// limiter set positions
		//

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h00e))
		begin
			mX_setEnable <= 1;
			mX_setPosition <= plbWrData[15:0];
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h016))
		begin
			mY_setEnable <= 1;
			mY_setPosition <= plbWrData[15:0];
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h01e))
		begin
			mZ_setEnable <= 1;
			mZ_setPosition <= plbWrData[15:0];
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h026))
		begin
			mA_setEnable <= 1;
			mA_setPosition <= plbWrData[15:0];
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h02e))
		begin
			mB_setEnable <= 1;
			mB_setPosition <= plbWrData[15:0];
		end

		if (plbEn && plbWr && (plbAddr[11:2] == 10'h036))
		begin
			mC_setEnable <= 1;
			mC_setPosition <= plbWrData[15:0];
		end

		//
		// writes
		//
		
		if (plbEn && plbWr)
		begin
			plbReady <= 1;

			case (plbAddr[11:2])

				10'h008: mX_prgmDirection <= plbWrData[1:0];
				10'h009: mX_prgmAcceleration <= plbWrData;
				10'h00a: mX_prgmAccelSamples <= plbWrData;
				10'h00b: mX_prgmCruiseSamples <= plbWrData;
				10'h00c: mX_limitLo <= plbWrData[15:0];
				10'h00d: mX_limitHi <= plbWrData[15:0];

				10'h010: mY_prgmDirection <= plbWrData[1:0];
				10'h011: mY_prgmAcceleration <= plbWrData;
				10'h012: mY_prgmAccelSamples <= plbWrData;
				10'h013: mY_prgmCruiseSamples <= plbWrData;
				10'h014: mY_limitLo <= plbWrData[15:0];
				10'h015: mY_limitHi <= plbWrData[15:0];

				10'h018: mZ_prgmDirection <= plbWrData[1:0];
				10'h019: mZ_prgmAcceleration <= plbWrData;
				10'h01a: mZ_prgmAccelSamples <= plbWrData;
				10'h01b: mZ_prgmCruiseSamples <= plbWrData;
				10'h01c: mZ_limitLo <= plbWrData[15:0];
				10'h01d: mZ_limitHi <= plbWrData[15:0];

				10'h020: mA_prgmDirection <= plbWrData[1:0];
				10'h021: mA_prgmAcceleration <= plbWrData;
				10'h022: mA_prgmAccelSamples <= plbWrData;
				10'h023: mA_prgmCruiseSamples <= plbWrData;
				10'h024: mA_limitLo <= plbWrData[15:0];
				10'h025: mA_limitHi <= plbWrData[15:0];

				10'h028: mB_prgmDirection <= plbWrData[1:0];
				10'h029: mB_prgmAcceleration <= plbWrData;
				10'h02a: mB_prgmAccelSamples <= plbWrData;
				10'h02b: mB_prgmCruiseSamples <= plbWrData;
				10'h02c: mB_limitLo <= plbWrData[15:0];
				10'h02d: mB_limitHi <= plbWrData[15:0];

				10'h030: mC_prgmDirection <= plbWrData[1:0];
				10'h031: mC_prgmAcceleration <= plbWrData;
				10'h032: mC_prgmAccelSamples <= plbWrData;
				10'h033: mC_prgmCruiseSamples <= plbWrData;
				10'h034: mC_limitLo <= plbWrData[15:0];
				10'h035: mC_limitHi <= plbWrData[15:0];

			endcase
		end

		//
		// reads
		//
		
		if (plbEn && plbRd)
		begin
			plbReady <= 1;

			case (plbAddr[11:2])

				// multiple axis
				10'h000: plbRdData <= { 26'h0, mBusy[5:0] };
				10'h001: plbRdData <= { 26'h0, 
					mX_prgmReq, mY_prgmReq, mZ_prgmReq, mA_prgmReq, mB_prgmReq, mC_prgmReq };
				10'h002: plbRdData <= { 26'h0, 
					mX_alarm, mY_alarm, mZ_alarm, mA_alarm, mB_alarm, mC_alarm };

				// X axis
				10'h008: plbRdData <= { {30{mX_prgmDirection[1]}}, mX_prgmDirection[1:0] };
				10'h009: plbRdData <= mX_prgmAcceleration;
				10'h00a: plbRdData <= mX_prgmAccelSamples;
				10'h00b: plbRdData <= mX_prgmCruiseSamples;
				10'h00c: plbRdData <= mX_limitLo;
				10'h00d: plbRdData <= mX_limitHi;
				10'h00e: plbRdData <= mX_position;

				// Y axis
				10'h010: plbRdData <= { {30{mY_prgmDirection[1]}}, mY_prgmDirection[1:0] };
				10'h011: plbRdData <= mY_prgmAcceleration;
				10'h012: plbRdData <= mY_prgmAccelSamples;
				10'h013: plbRdData <= mY_prgmCruiseSamples;
				10'h014: plbRdData <= mY_limitLo;
				10'h015: plbRdData <= mY_limitHi;
				10'h016: plbRdData <= mY_position;

				// Z axis
				10'h018: plbRdData <= { {30{mZ_prgmDirection[1]}}, mZ_prgmDirection[1:0] };
				10'h019: plbRdData <= mZ_prgmAcceleration;
				10'h01a: plbRdData <= mZ_prgmAccelSamples;
				10'h01b: plbRdData <= mZ_prgmCruiseSamples;
				10'h01c: plbRdData <= mZ_limitLo;
				10'h01d: plbRdData <= mZ_limitHi;
				10'h01e: plbRdData <= mZ_position;

				// A axis
				10'h020: plbRdData <= { {30{mA_prgmDirection[1]}}, mA_prgmDirection[1:0] };
				10'h021: plbRdData <= mA_prgmAcceleration;
				10'h022: plbRdData <= mA_prgmAccelSamples;
				10'h023: plbRdData <= mA_prgmCruiseSamples;
				10'h024: plbRdData <= mA_limitLo;
				10'h025: plbRdData <= mA_limitHi;
				10'h026: plbRdData <= mA_position;

				// B axis
				10'h028: plbRdData <= { {30{mB_prgmDirection[1]}}, mB_prgmDirection[1:0] };
				10'h029: plbRdData <= mB_prgmAcceleration;
				10'h02a: plbRdData <= mB_prgmAccelSamples;
				10'h02b: plbRdData <= mB_prgmCruiseSamples;
				10'h02c: plbRdData <= mB_limitLo;
				10'h02d: plbRdData <= mB_limitHi;
				10'h02e: plbRdData <= mB_position;

				// C axis
				10'h030: plbRdData <= { {30{mC_prgmDirection[1]}}, mC_prgmDirection[1:0] };
				10'h031: plbRdData <= mC_prgmAcceleration;
				10'h032: plbRdData <= mC_prgmAccelSamples;
				10'h033: plbRdData <= mC_prgmCruiseSamples;
				10'h034: plbRdData <= mC_limitLo;
				10'h035: plbRdData <= mC_limitHi;
				10'h036: plbRdData <= mC_position;

			endcase
		end
		

	end
end

endmodule
