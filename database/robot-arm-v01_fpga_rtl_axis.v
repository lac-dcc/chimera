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

module axis
(
	input	wire				rst,
	input	wire				clk,

	input	wire				ph1,
	input	wire				ph2,
	input	wire				ph3,
	input	wire				ph4,

	input	wire				prgmReq,
	output	reg					prgmAck,
	input	wire signed	[1:0]	prgmDirection,
	input	wire signed	[31:0]	prgmAcceleration,
	input	wire 		[31:0]	prgmAccelSamples,
	input	wire		[31:0]	prgmCruiseSamples,

	output	reg					busy,
	output	reg					mDir,
	output	reg					mStep
);

reg signed [1:0] direction;
reg signed [31:0] acceleration;
reg [31:0] accelSamples;
reg [31:0] cruiseSamples;

reg [31:0] decelSamples;
reg signed [31:0] currentAcceleration;
reg signed [31:0] currentVelocity;
reg signed [63:0] currentPosition;
reg signed [63:0] lastPosition;

always @ (posedge clk)
begin
	if (rst)
	begin
		prgmAck <= 0;

		busy <= 0;
		mDir <= 0;
		mStep <= 0;

		direction <= 0;
		acceleration <= 0;
		accelSamples <= 0;
		cruiseSamples <= 0;

		decelSamples <= 0;
		currentAcceleration <= 0;
		currentVelocity <= 0;
		currentPosition <= 0;

		lastPosition <= 0;
	end
	else
	begin
		// defaults
		prgmAck <= 0;
		mStep <= 0;

		if (ph1)
		begin
			if (accelSamples > 0)
			begin
				accelSamples <= accelSamples - 1;
				decelSamples <= decelSamples + 1;
				currentAcceleration <= acceleration;
			end
			else if (cruiseSamples > 0)
			begin
				cruiseSamples <= cruiseSamples - 1;
				currentAcceleration = 0;
			end
			else if (decelSamples > 0)
			begin
				decelSamples <= decelSamples - 1;
				currentAcceleration <= -acceleration;
			end
			else
			begin
				busy <= 0;
				direction <= 0;
				currentAcceleration <= 0;
				currentVelocity <= 0;
				currentPosition <= 0;
				lastPosition <= 0;
			end
		end

		else if (ph2)
		begin
			currentPosition <= currentPosition + 2 * currentVelocity + currentAcceleration;
			currentVelocity <= currentVelocity + currentAcceleration;
		end

		else if (ph3)
		begin
			if (currentPosition[63:32] != lastPosition[63:32])
			begin
				mDir <= (direction >= 0) ? 1 : 0;
				mStep <= 1;
			end
			lastPosition <= currentPosition;
		end

		else if (ph4)
		begin
			if (!busy && prgmReq)
			begin
				busy <= 1;
				prgmAck <= 1;
				direction <= prgmDirection;
				acceleration <= prgmAcceleration;
				accelSamples <= prgmAccelSamples;
				cruiseSamples <= prgmCruiseSamples;
			end
		end
	end
end

endmodule
