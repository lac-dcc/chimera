// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// MUXes mouse and kbd data in two single databusses for zports

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

`include "tune.v"

module zkbdmus(

	input  wire        fclk,
	input  wire        rst_n,


	input  wire [39:0] kbd_in,  // key bits
	input  wire        kbd_stb, // and strobe

	input  wire [ 7:0] mus_in,
	input  wire        mus_xstb,
	input  wire        mus_ystb,
	input  wire        mus_btnstb,
	input  wire        kj_stb,


	input  wire [7:0] zah,

	output wire [ 4:0] kbd_data,
	output wire [ 7:0] mus_data,
`ifdef KEMPSTON_8BIT
	output reg  [ 7:0] kj_data
`else
    output reg  [ 4:0] kj_data
`endif
);

	reg [39:0] kbd;
	reg [ 7:0] musx,musy,musbtn;

	wire [4:0] keys [0:7]; // key matrix

	reg [4:0] kout; // wire AND


`ifdef SIMULATE
	initial
	begin
//		force kbd_data = 5'b11111;
		force mus_data = 8'hFF;
		force kj_data  = 8'd0;

		kbd = 40'd0;
	end
`endif


	// store data from slavespi
	//
    always @(posedge fclk)
    begin
		if( kbd_stb )
			kbd <= kbd_in;

		if( mus_xstb )
			musx <= mus_in;

		if( mus_ystb )
			musy <= mus_in;

		if( mus_btnstb )
			musbtn <= mus_in;

		if( kj_stb )
`ifdef KEMPSTON_8BIT
			kj_data <= mus_in;
`else
			kj_data <= mus_in[4:0];
`endif
    end


	// make keys
	//
	assign keys[0]={kbd[00],kbd[08],kbd[16],kbd[24],kbd[32]};// v  c  x  z  CS
	assign keys[1]={kbd[01],kbd[09],kbd[17],kbd[25],kbd[33]};// g  f  d  s  a
	assign keys[2]={kbd[02],kbd[10],kbd[18],kbd[26],kbd[34]};// t  r  e  w  q
	assign keys[3]={kbd[03],kbd[11],kbd[19],kbd[27],kbd[35]};// 5  4  3  2  1
	assign keys[4]={kbd[04],kbd[12],kbd[20],kbd[28],kbd[36]};// 6  7  8  9  0
	assign keys[5]={kbd[05],kbd[13],kbd[21],kbd[29],kbd[37]};// y  u  i  o  p 
	assign keys[6]={kbd[06],kbd[14],kbd[22],kbd[30],kbd[38]};// h  j  k  l  EN
	assign keys[7]={kbd[07],kbd[15],kbd[23],kbd[31],kbd[39]};// b  n  m  SS SP
	//
	always @*
	begin
		kout = 5'b11111;

		kout = kout & ({5{zah[0]}} | (~keys[0]));
		kout = kout & ({5{zah[1]}} | (~keys[1]));
		kout = kout & ({5{zah[2]}} | (~keys[2]));
		kout = kout & ({5{zah[3]}} | (~keys[3]));
		kout = kout & ({5{zah[4]}} | (~keys[4]));
		kout = kout & ({5{zah[5]}} | (~keys[5]));
		kout = kout & ({5{zah[6]}} | (~keys[6]));
		kout = kout & ({5{zah[7]}} | (~keys[7]));
	end
	//
	assign kbd_data = kout;

	// make mouse
	// FADF - buttons, FBDF - x, FFDF - y
	//
	assign mus_data = zah[0] ? ( zah[2] ? musy : musx ) : musbtn;



endmodule

