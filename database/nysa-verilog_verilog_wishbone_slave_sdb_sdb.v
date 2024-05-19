// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//device_rom_table.v

/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
/*
 *use defparam in the instantiating module in order to set the
 * number of items in the ROM
 * defparam SDB_NRECS = 2;
 */

`timescale 1 ns/1 ps

`include "project_defines.v"
//`define SDB_NRECS 1
`define SDB_ROM_SIZE_OF_HEADER  16
`define SDB_ROM_SIZE_OF_DEV     16


module device_rom_table (
input               clk,
input               rst,

//wishbone slave signals
input               i_wbs_we,
input               i_wbs_stb,
input               i_wbs_cyc,
input       [3:0]   i_wbs_sel,
input       [31:0]  i_wbs_adr,
input       [31:0]  i_wbs_dat,
output reg  [31:0]  o_wbs_dat,
output reg          o_wbs_ack,
output reg          o_wbs_int
);

//registers
parameter SDB_ROM_SIZE        = `SDB_ROM_SIZE_OF_HEADER + (`SDB_NRECS * `SDB_ROM_SIZE_OF_DEV);
reg [31:0] sdb [(SDB_ROM_SIZE - 1):0];

initial begin
  $readmemh(`SDB_INPUT_FILE, sdb, 0, SDB_ROM_SIZE - 1);
end

always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat <= 32'h0;
    o_wbs_ack <= 0;
    o_wbs_int <= 0;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & ~ i_wbs_stb)begin
      o_wbs_ack <= 0;
    end

    if (!o_wbs_ack && i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      if (i_wbs_we) begin
        //ROMS can't be written to
      end
      else begin
        //read request
        o_wbs_dat <= sdb[i_wbs_adr];
      end
      o_wbs_ack <= 1;
    end
  end
end
endmodule
