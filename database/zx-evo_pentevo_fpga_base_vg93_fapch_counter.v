// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// counter-based 'PFD', based on pentagon design, with filter and adopted to
// 28mhz

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/


module fapch_counter
(
	input  wire fclk,

	input  wire rdat_n,

	output reg  vg_rclk,
	output reg  vg_rawr
);


	reg [4:0] rdat_sync;
	reg rdat_edge1, rdat_edge2;
	wire rdat;
	wire rwidth_ena;
	reg [3:0] rwidth_cnt;
	wire rclk_strobe;
	reg [5:0] rclk_cnt;

	// RCLK/RAWR restore
	// currently simplest counter method, no PLL whatsoever now
	//
	// RCLK period must be 112 clocks (@28 MHz), or 56 clocks for each state
	// RAWR on time is 4 clocks

	// digital filter - removing glitches
	always @(posedge fclk)
		rdat_sync[4:0] <= { rdat_sync[3:0], (~rdat_n) };



	always @(posedge fclk)
	begin
		if( rdat_sync[4:1]==4'b1111 ) // filter beginning of strobe
			rdat_edge1 <= 1'b1;
		else if( rclk_strobe ) // filter any more strobes during same strobe half-perion
			rdat_edge1 <= 1'b0;

		rdat_edge2 <= rdat_edge1;
	end



	assign rdat = rdat_edge1 & (~rdat_edge2);



	always @(posedge fclk)
		if( rwidth_ena )
		begin
			if( rdat )
				rwidth_cnt <= 4'd0;
			else
				rwidth_cnt <= rwidth_cnt + 4'd1;
		end

	assign rwidth_ena = rdat | (~rwidth_cnt[2]); // [2] - 140ns, [3] - 280ns

	always @(posedge fclk)
		vg_rawr <= rwidth_cnt[2]; // RAWR has 2 clocks latency from rdat strobe




	assign rclk_strobe = (rclk_cnt==6'd0);

	always @(posedge fclk)
	begin
		if( rdat )
			rclk_cnt <= 6'd29; // (56/2)-1 plus halfwidth of RAWR
		else if( rclk_strobe )
			rclk_cnt <= 6'd55; // period is 56 clocks
		else
			rclk_cnt <= rclk_cnt - 6'd1;
	end

	always @(posedge fclk)
		if( rclk_strobe )
			vg_rclk <= ~vg_rclk; // vg_rclk latency is 2 clocks plus a number loaded into rclk_cnt at rdat strobe

endmodule

