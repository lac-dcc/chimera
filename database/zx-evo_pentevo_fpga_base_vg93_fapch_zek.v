// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// 'PFD' design based on ZEK code

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


module fapch_zek
(
	input  wire fclk,

	input  wire rdat_n,

	output reg  vg_rclk,
	output reg  vg_rawr
);

	reg [3:0] rdat_sr;
	reg       rawr_sync;

	reg rdat_n_r;

	always @ (posedge fclk)
	begin
		rdat_n_r <= rdat_n;


	    rdat_sr <= { rdat_sr[2:0], rdat_n_r };
	    if (rdat_sr == 4'hF || rdat_sr == 4'h0)
	        rawr_sync <= rdat_sr[3];
	end

	// rawr
	reg [4:0] rawr_sr;

	always @ (posedge fclk)
	begin
	    rawr_sr <= { rawr_sr[3:0], rawr_sync };
	    vg_rawr <= !(rawr_sr[4] && !rawr_sr[0] ); // rawr 140ns
	end

	// rclk
	reg [5:0] counter = 0;
	wire[5:0] delta = 27 - counter;
	wire[5:0] shift = { delta[5], delta[5], delta[4:1] }; // sign div
	wire[5:0] inc   = rawr_sr[1:0] == 2'b10 ? shift : 1;

	always @ (posedge fclk)
	begin
	    if (counter < 55)
	        counter <= counter + inc;
	    else
	    begin
	        counter <= 0;
	        vg_rclk = ~vg_rclk;
	    end

	end

	initial
	    vg_rclk = 0;







endmodule

