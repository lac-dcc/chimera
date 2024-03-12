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

module limiter
(
	input	wire				rst,
	input	wire				clk,

	input	wire				setEnable,
	input	wire signed	[15:0]	setPosition,

	input	wire signed	[15:0]	limitLo,
	input	wire signed	[15:0]	limitHi,

	input	wire				mDirIn,
	input	wire				mStepIn,

	output	reg  signed [15:0]	mPosition,
	output	reg					mDirOut,
	output	reg					mStepOut,
	
	input	wire				alarmClear,
	output	reg					alarm
);

reg mDirIn_z, mDirIn_zz, mDirIn_zzz;
reg mStepIn_z, mStepIn_zz, mStepIn_zzz;
reg [7:0] counter;

wire signed [15:0] nextPosition;

assign nextPosition = mPosition + (mDirIn_zz ? 1 : -1);

always @ (posedge clk)
begin
	if (rst)
	begin
		mPosition <= 0;
		mDirOut <= 0;
		mStepOut <= 0;
		alarm <= 0;

		mDirIn_z <= 0;
		mDirIn_zz <= 0;
		mDirIn_zzz <= 0;

		mStepIn_z <= 0;
		mStepIn_zz <= 0;
		mStepIn_zzz <= 0;

		counter <= 199;
	end
	else
	begin
		if (alarmClear)
		begin
			alarm <= 0;
		end

		mDirIn_z <= mDirIn;
		mDirIn_zz <= mDirIn_z;
		mDirIn_zzz <= mDirIn_zz;

		mStepIn_z <= mStepIn;
		mStepIn_zz <= mStepIn_z;
		mStepIn_zzz <= mStepIn_zz;

		if (setEnable) 
		begin
			mPosition <= setPosition;
		end
		else if (!mStepIn_zzz && mStepIn_zz)
		begin
			if (mDirIn_zz)
			begin
				if (nextPosition <= limitHi)
				begin
					mPosition <= nextPosition;
					mDirOut <= 1'b1;
					counter <= 0;
				end
				else
				begin
					alarm <= 1;
				end
			end
			else if (!mDirIn_zz)
			begin
				if (nextPosition >= limitLo)
				begin
					mPosition <= nextPosition;
					mDirOut <= 1'b0;
					counter <= 0;
				end
				else
				begin
					alarm <= 1;
				end
			end
		end
		else if (counter != 199)
		begin
			counter <= counter + 1;
			if (counter == 19)			// assert 1us after direction output
			begin
				mStepOut <= 1;
			end
			else if (counter == 119)	// deassert 10us after assertion
			begin
				mStepOut <= 0;
			end
		end
	end
end

endmodule
