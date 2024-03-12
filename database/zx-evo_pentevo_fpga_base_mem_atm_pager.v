// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// ATM-like memory pager (it pages specific 16kb region)
//  with additions to support 4m addressable memory
//  and pent1m mode.
//
// contain ports xFF7, x7F7, xBF7

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

module atm_pager(

	input  wire rst_n,

	input  wire fclk,
	input  wire zpos,
	input  wire zneg,


	input  wire [15:0] za, // Z80 address bus

	input  wire [ 7:0] zd, // Z80 data bus - for latching port data

	input  wire        mreq_n,rd_n,m1_n, // to track DOS turn on/turn off


	input  wire        pager_off, // PEN as in ATM2: turns off memory paging, service ROM is everywhere


	input  wire        pent1m_ROM,    // for memory maps switching: d4 of 7ffd
	input  wire [ 5:0] pent1m_page,   // 1 megabyte from pentagon1024 addressing, from 7FFD port
	input  wire        pent1m_ram0_0, // RAM0 to the window 0 from pentagon1024 mode
	input  wire        pent1m_1m_on,  // 1 meg addressing of pent1m mode on

	input  wire        in_nmi, // when we are in nmi, in 0000-3FFF must be last (FFth)
	                           // RAM page. analoguous to pent1m_ram0_0
				   // but has higher priority

	input  wire        in_trdemu, // like 'in_nmi', page 0xFE
	input  wire        trdemu_wr_disable, // disable writes to page FE when trdemu is active

	input  wire        atmF7_wr, // write strobe for the xxF7 ATM port


	input  wire        dos, // indicates state of computer: also determines ROM mapping


	output wire        dos_turn_on,  // turns on or off DOS signal
	output wire        dos_turn_off, //

	output wire        zclk_stall, // stall Z80 clock during DOS turning on

	output reg  [ 7:0] page,
	output reg         romnram,
	output reg         wrdisable,

	// output for xxBE port read
	output wire	[ 7:0] rd_page0,
	output wire	[ 7:0] rd_page1,
	output wire [ 1:0] rd_dos7ffd,
	output wire [ 1:0] rd_ramnrom,
	output wire [ 1:0] rd_wrdisables
);
	parameter ADDR = 2'b00;


	reg [ 7:0] pages [0:1]; // 2 pages for each map - switched by pent1m_ROM

	reg [ 1:0] ramnrom; // ram(=1) or rom(=0)
	reg [ 1:0] dos_7ffd; // =1 7ffd bits (ram) or DOS enter mode (rom) for given page

	reg [ 1:0] wrdisables; // for each map

 	reg mreq_n_reg, rd_n_reg, m1_n_reg;

	wire dos_exec_stb, ram_exec_stb;


	reg [2:0] stall_count;



	// output data for port xxBE
	assign rd_page0 = pages[0];
	assign rd_page1 = pages[1];
	//
	assign rd_dos7ffd = dos_7ffd;
	assign rd_ramnrom = ramnrom;
	assign rd_wrdisables = wrdisables;



	// paging function, does not set pages, ramnrom, dos_7ffd
	//
	always @(posedge fclk)
	begin
		if( pager_off )
		begin // atm no pager mode - each window has same ROM
			romnram   <= 1'b1;
			page      <= 8'hFF;
			wrdisable <= 1'b0;
		end
		else // pager on
		begin
			if( (ADDR==2'b00) && (pent1m_ram0_0 || in_nmi || in_trdemu) )
			begin
				wrdisable <= trdemu_wr_disable;

				if( in_nmi || in_trdemu )
				begin
					romnram <= 1'b0;
					page    <= { 7'h7F, in_nmi };
				end
				else // if( pent1m_ram0_0 )
				begin
					romnram <= 1'b0;
					page    <= 8'd0;
				end
			end
			else
			begin
				wrdisable <= wrdisables[ pent1m_ROM ];

				romnram <= ~ramnrom[ pent1m_ROM ];

				if( dos_7ffd[ pent1m_ROM ] ) // 7ffd memmap switching
				begin
					if( ramnrom[ pent1m_ROM ] )
					begin // ram map
						if( pent1m_1m_on )
						begin // map whole Mb from 7ffd to atm pages
							page <= { pages[ pent1m_ROM ][7:6], pent1m_page[5:0] };
						end
						else //128k like in atm2
						begin
							page <= { pages[ pent1m_ROM ][7:3], pent1m_page[2:0] };
						end
					end
					else // rom map with dos
					begin
						page <= { pages[ pent1m_ROM ][7:1], dos };
					end
				end
				else // no 7ffd impact
				begin
					page <= pages[ pent1m_ROM ];
				end
			end
		end
	end




	// port reading: sets pages, ramnrom, dos_7ffd
	//
	always @(posedge fclk, negedge rst_n)
	if( !rst_n )
	begin
		wrdisables <= 2'b00;
	end
	else if( atmF7_wr )
	begin
 		if( za[15:14]==ADDR )
		case( {za[11],za[10]} )
			2'b10: begin // xxBF7 port -- ROM/RAM readonly bit
				wrdisables[ pent1m_ROM ] <= zd[0];
			end

			default: begin
				// nothing
			end
		endcase
	end
	//	
	always @(posedge fclk)
	if( atmF7_wr )
	begin
		if( za[15:14]==ADDR )
		case( {za[11],za[10]} )
			2'b11: begin // xFF7 port
				pages   [ pent1m_ROM ] <= ~{ 2'b11, zd[5:0] };
				ramnrom [ pent1m_ROM ] <= zd[6];
				dos_7ffd[ pent1m_ROM ] <= zd[7];
			end

			2'b01: begin // x7F7 port
				pages   [ pent1m_ROM ] <= ~zd;
				ramnrom [ pent1m_ROM ] <= 1'b1; // RAM on
				// dos_7ffd - UNCHANGED!!! (possibility to use 7ffd 1m and 128k addressing in the whole 4m!)
			end

			default: begin
				// nothing
			end

		endcase
	end


	// DOS turn on/turn off
	//

`ifdef SIMULATE
	initial
	begin
		m1_n_reg   = 1'b1;
		mreq_n_reg = 1'b1;
		rd_n_reg   = 1'b1;

		stall_count = 3'b000;
	end
`endif

	always @(posedge fclk) if( zpos )
	begin
		m1_n_reg <= m1_n;
	end

	always @(posedge fclk) if( zneg )
	begin
		mreq_n_reg <= mreq_n;
	end



	assign dos_exec_stb = zneg && (za[15:14]==ADDR) &&
	                      (!m1_n_reg) && (!mreq_n) && mreq_n_reg &&
	                      (za[13:8]==6'h3D) &&
	                      dos_7ffd[1'b1] && (!ramnrom[1'b1]) && pent1m_ROM;

	assign ram_exec_stb = zneg && (za[15:14]==ADDR) &&
	                      (!m1_n_reg) && (!mreq_n) && mreq_n_reg &&
	                      ramnrom[pent1m_ROM];

	assign dos_turn_on  = dos_exec_stb;
	assign dos_turn_off = ram_exec_stb;


	// stall Z80 for some time when dos turning on to allow ROM chip to supply new data
	// this can be important at 7 or even 14 mhz. minimum stall time is
	// 3 clocks @ 28 MHz
	always @(posedge fclk)
	begin
		// переключение в ДОС пзу происходит за полтакта z80 до того, как
		// z80 считает данные. т.е. у пзу полтакта для выдачи новых данных.
		// 3.5мгц - 140 нан, 7мгц - 70 нан, 14мгц - 35 нан.
		// для пзухи 120нс на 14мгц надо еще 3 полтакта добавить, или другими
		// словами, добавить к любой задержке на любой частоте минимум 3 такта
		// 28 мгц.
		if( dos_turn_on )
		begin
			stall_count[2] <= 1'b1; // count: 000(stop) -> 101 -> 110 -> 111 -> 000(stop)
			stall_count[0] <= 1'b1;
		end
		else if( stall_count[2] )
		begin
			stall_count[2:0] <= stall_count[2:0] + 3'd1;
		end

	end

	assign zclk_stall = dos_turn_on | stall_count[2];



endmodule

