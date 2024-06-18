// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

/*
* Copyright 2016-2020 MATRIX Labs
* MATRIX Labs  [http://creator.matrix.one]
* Authors: Andres Calderon <andres.calderon@admobilize.com>
*          Kevin Patiño    <kevin.patino@admobilize.com>        
*
* This file is part of MATRIX Creator HDL for Spartan 6
*
* MATRIX Creator HDL is like free software: you can redistribute
* it and/or modify it under the terms of the GNU General Public License
* as published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.

* This program is distributed in the hope that it will be useful, but
* WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.

* You should have received a copy of the GNU General Public License along
* with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


module everloop_ram #(
	parameter MEM_FILE_NAME = "none",
	parameter ADDR_WIDTH = "mandatory",
	parameter DATA_WIDTH = "mandatory"
)(
	input                       clk,
	input                       we_a,
  output reg                  ack_a,
	input      [ADDR_WIDTH-1:0] adr_a,
	input      [DATA_WIDTH-1:0] dat_a,
	// read port b
	input      [ADDR_WIDTH-1:0] adr_b,
	output reg [DATA_WIDTH-1:0] dat_b
);

	localparam DEPTH = (1 << ADDR_WIDTH);

	reg [DATA_WIDTH-1:0] ram[0:DEPTH-1];
//------------------------------------------------------------------
// read port B
//------------------------------------------------------------------
	always @(posedge clk)	begin
		dat_b <= ram[adr_b];
	end

//------------------------------------------------------------------
// write port A
//------------------------------------------------------------------
	always @(posedge clk)	begin
		ack_a <= 0;
		if (we_a) begin
			ack_a      <= 1;
			if(~adr_a[0])
				ram[adr_a] <= {dat_a[7:0],dat_a[DATA_WIDTH-1-:8]};
			else
				ram[adr_a] <= dat_a;	
		end
	end

	integer i;
  initial
    begin
      for (i = 0; i < DEPTH ; i=i+1) begin
        ram[i] = 0;
      end
    end


endmodule
