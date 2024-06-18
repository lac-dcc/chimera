// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_bram.v
/*
Distributed under the MIT license.
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
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x0000000E

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: 19 UNICODE characters
  SDB_NAME:wb_bram

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x06

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x00

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/01/07

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:4096
*/


module wb_bram #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 12,
  parameter MEM_FILE  = "NOTHING",
  parameter MEM_FILE_LENGTH = 0

)(
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

localparam            RAM_SIZE = ADDR_WIDTH - 1;
localparam            SLEEP_COUNT = 4;

wire  [31:0]        read_data;
reg   [31:0]        write_data;
reg   [RAM_SIZE:0]  ram_adr;
reg                 en_ram;

reg   [3:0]         ram_sleep;

bram#(
  .DATA_WIDTH      (DATA_WIDTH      ),
  .ADDR_WIDTH      (ADDR_WIDTH      ),
  .MEM_FILE        (MEM_FILE        ),
  .MEM_FILE_LENGTH (MEM_FILE_LENGTH )
)br(
  .clk             (clk             ),
  .rst             (rst             ),
  .en              (en_ram          ),
  .we              (i_wbs_we        ),
  .write_address   (ram_adr         ),
  .read_address    (ram_adr         ),
  .data_in         (write_data      ),
  .data_out        (read_data       )
);

//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat       <= 32'h0;
    o_wbs_ack       <= 0;
    o_wbs_int       <= 0;
    ram_sleep       <= SLEEP_COUNT;
    ram_adr         <= 0;
    en_ram          <= 0;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack & !i_wbs_stb)begin
      o_wbs_ack     <= 0;
      en_ram        <= 0;
    end

    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      en_ram <= 1;
      //ram_adr <= i_wbs_adr[RAM_SIZE + 2:2];
      ram_adr <= i_wbs_adr[RAM_SIZE:0];
      if (i_wbs_we) begin
        //write request
        //the bram module will handle all the writes
        write_data <= i_wbs_dat;
//        $display ("write a:%h, d:%h", i_wbs_adr[RAM_SIZE:0], i_wbs_dat);
      end

      else begin
        //read request
        o_wbs_dat <= read_data;
        //i_wbs_dat <= i_wbs_adr;
//        $display ("read a:%h, d:%h", i_wbs_adr[RAM_SIZE:0], read_data);
      end
      if (ram_sleep > 0) begin
        ram_sleep <= ram_sleep - 1;
      end
      else begin
        o_wbs_ack <= 1;
        ram_sleep <= SLEEP_COUNT;
      end
    end
  end
end


endmodule
