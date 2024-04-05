// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// VGA scandoubler

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

module video_vga_double(

`include "tune.v"

	input  wire        clk,

	input  wire        hsync_start,

	input  wire        scanin_start,
	input  wire [11:0] pix_in,

	input  wire        scanout_start,
	output reg  [11:0] pix_out
);
/*
addressing of non-overlapping pages:

pg0 pg1
0xx 1xx
2xx 3xx
4xx 5xx
*/

	reg [9:0] ptr_in;  // count up to 720
	reg [9:0] ptr_out; //

	reg pages; // swapping of pages

	reg wr_stb;

	wire [11:0] data_out;


	always @(posedge clk) if( hsync_start )
		pages <= ~pages;


	// write ptr and strobe
	always @(posedge clk)
	begin
		if( scanin_start )
		begin
			ptr_in[9:8] <= 2'b00;
			ptr_in[5:4] <= 2'b11;
		end
		else
		begin
			if( ptr_in[9:8]!=2'b11 ) //  768-720=48
			begin
				wr_stb <= ~wr_stb;
				if( wr_stb )
				begin
					ptr_in <= ptr_in + 10'd1;
				end
			end
		end
	end


	// read ptr
	always @(posedge clk)
	begin
		if( scanout_start )
		begin
			ptr_out[9:8] <= 2'b00;
			ptr_out[5:4] <= 2'b11;
		end
		else
		begin
			if( ptr_out[9:8]!=2'b11 )
			begin
				ptr_out <= ptr_out + 10'd1;
			end
		end
	end

	//read data
	always @(posedge clk)
	begin
		if( ptr_out[9:8]!=2'b11 )
			pix_out <= data_out[11:0];
		else
			pix_out <= 12'd0;
	end





	mem1536 line_buf( .clk(clk),

	                  .wraddr({ptr_in[9:8], pages, ptr_in[7:0]}),
	                  .wrdata(pix_in),
	                  .wr_stb(wr_stb),

	                  .rdaddr({ptr_out[9:8], (~pages), ptr_out[7:0]}),
	                  .rddata(data_out)
	                );


endmodule




// 3x512b memory
module mem1536(

	input  wire        clk,

	input  wire [10:0] wraddr,
	input  wire [11:0] wrdata,
	input  wire        wr_stb,

	input  wire [10:0] rdaddr,
	output reg  [11:0] rddata
);

	reg [11:0] mem [0:1535];

	always @(posedge clk)
	begin
		if( wr_stb )
		begin
			mem[wraddr] <= wrdata;
		end

		rddata <= mem[rdaddr];
	end

endmodule


