// This program was cloned from: https://github.com/MiSTer-devel/SAM-Coupe_MiSTer
// License: GNU General Public License v2.0

////////////////////////////////////////////////////////////////////////////////
//
//  PS2-to-SAM Mouse
//  (C) 2016 Sorgelig
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
////////////////////////////////////////////////////////////////////////////////

module mouse
(
	input        clk_sys,
	input        ce_6mp,
	input        reset,

	input [24:0] ps2_mouse,
	
	input        rd,
	output [4:0] dout
);

assign dout = {1'b1, data};

reg   [3:0] button;
reg  [11:0] dx,ldx;
reg  [11:0] dy,ldy;

wire [11:0] mdx = {{4{ps2_mouse[4]}},ps2_mouse[15:8]};
wire [11:0] mdy = {{4{ps2_mouse[5]}},ps2_mouse[23:16]};

wire [11:0] newdx = dx + mdx;
wire [11:0] newdy = dy + mdy;

reg   [3:0] queue;
reg   [3:0] data;
always @* begin
	case({~rd, queue})
		2: data = ~button;
		3: data = ldy[11:8];
		4: data = ldy[7:4];
		5: data = ldy[3:0];
		6: data = ldx[11:8];
		7: data = ldx[7:4];
		8: data = ldx[3:0];
		default: data = 'hF;
	endcase
end

always @(posedge clk_sys) begin
	reg        old_rd;
	reg  [7:0] timout;
	reg        old_stb;
	
	if(reset) begin
		dx     <= 0;
		dy     <= 0;
		button <= 0;
		queue  <= 0;
		timout <= 0;
		old_rd <= 0;
	end else begin
		old_rd <= rd;
		if(old_rd & ~rd) queue <= (queue == 8) ? 4'd1 : queue + 1'd1;

		if(~old_rd & rd) begin
			timout <= 0;
			if(queue == 2) begin
				ldx <= dx;
				ldy <= dy;
			end
			if(queue == 8) begin
				dx <= dx - ldx;
				dy <= dy - ldy;
			end
		end else begin
			old_stb <= ps2_mouse[24];

			if(old_stb != ps2_mouse[24]) begin
				button <= ps2_mouse[2:0];
				dx <= mdx[11] ? ((dx[11] & ~newdx[11]) ? 12'h800 : newdx) : ((~dx[11] & newdx[11]) ? 12'h7FF : newdx);
				dy <= mdy[11] ? ((dy[11] & ~newdy[11]) ? 12'h800 : newdy) : ((~dy[11] & newdy[11]) ? 12'h7FF : newdy);
			end

			if(ce_6mp) begin
				if(timout  < 181) timout <= timout + 1'd1;
				if(timout == 180) queue  <= 0;
			end
		end
	end
end

endmodule
