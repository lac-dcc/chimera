////////////////////////////////////////////////////////////////////////////////
//
// Filename:	./iscachable.v
//
// Project:	OpenArty, an entirely open SoC based upon the Arty platform
//
// DO NOT EDIT THIS FILE!
// Computer Generated: This file is computer generated by AUTOFPGA. DO NOT EDIT.
// DO NOT EDIT THIS FILE!
//
// CmdLine:	autofpga autofpga -d -o . allclocks.txt global.txt icape.txt version.txt buserr.txt pic.txt pwrcount.txt spio.txt clrspio.txt rtcgps.txt rtcdate.txt wbuconsole.txt bkram.txt spansion.txt sdram.txt zipmaster.txt mdio.txt enet.txt gps.txt wboledrgb.txt mem_flash_bkram.txt mem_bkram_only.txt mem_sdram_bkram.txt
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2017-2020, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of  the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype none
//
module iscachable(i_addr, o_cachable);
	localparam		AW = 27;
	input	wire	[AW-1:0]	i_addr;
	output	reg			o_cachable;

	always @(*)
	begin
		o_cachable = 1'b0;
		// Bus master: wb
		// Bus master: wb_dio
		// Bus master: wb_sio
		// bkram
		if ((i_addr[26:0] & 27'h7c00000) == 27'h2000000)
			o_cachable = 1'b1;
		// flash
		if ((i_addr[26:0] & 27'h7c00000) == 27'h2400000)
			o_cachable = 1'b1;
		// sdram
		if ((i_addr[26:0] & 27'h4000000) == 27'h4000000)
			o_cachable = 1'b1;
	end

endmodule