// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_hs_demo.v
/*
Distributed under the MIT license.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

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
  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x800000000000C594

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: 19 UNICODE characters
  SDB_NAME:wb_hs_demo

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x0F

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/11/13

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:3
*/


module wb_hs_demo #(
  parameter   BUFFER_WIDTH = 10

)(
  input               clk,
  input               rst,

  //Add signals to control your device here

  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,

  //This interrupt can be controlled from this module or a submodule
  output  reg         o_wbs_int,
  //output              o_wbs_int

  //Write Side
  input               i_write_enable,
  input       [63:0]  i_write_addr,
  input               i_write_addr_inc,
  input               i_write_addr_dec,
  output              o_write_finished,
  input       [23:0]  i_write_count,
  input               i_write_flush,

  output      [1:0]   o_write_ready,
  input       [1:0]   i_write_activate,
  output      [23:0]  o_write_size,
  input               i_write_strobe,
  input       [31:0]  i_write_data,

  //Read Side
  input               i_read_enable,
  input       [63:0]  i_read_addr,
  input               i_read_addr_inc,
  input               i_read_addr_dec,
  output              o_read_busy,
  output              o_read_error,
  input       [23:0]  i_read_count,
  input               i_read_flush,

  output              o_read_ready,
  input               i_read_activate,
  output      [23:0]  o_read_size,
  output      [31:0]  o_read_data,
  input               i_read_strobe


);

//Local Parameters
localparam            SLEEP_COUNT = 4;



//Local Registers/Wires
wire                        w_bram_wea;
reg   [BUFFER_WIDTH - 1:0]  r_bram_addr;
reg   [31:0]                r_bram_din;
wire  [31:0]                w_bram_dout;

reg   [3:0]                 ram_sleep;

//Submodules
hs_demo #(
  .BUFFER_WIDTH       (BUFFER_WIDTH     ),
  .FIFO_WIDTH         (7                )
) demo (
  .clk                (clk              ),
  .rst                (rst              ),

  .o_idle             (hs_demo_idle     ),

  //DEMO CODE START
  .i_bram_wea         (w_bram_wea       ),
  .i_bram_addr        (r_bram_addr      ),
  .i_bram_din         (r_bram_din       ),
  .o_bram_dout        (w_bram_dout      ),
  //DEMO CODE END

  //Write Side
  .i_write_enable     (i_write_enable   ),
  .i_write_addr       (i_write_addr     ),
  .i_write_addr_inc   (i_write_addr_inc ),
  .i_write_addr_dec   (i_write_addr_dec ),
  .o_write_finished   (o_write_finished ),
  .i_write_count      (i_write_count    ),
  .i_write_flush      (i_write_flush    ),

  .o_write_ready      (o_write_ready    ),
  .i_write_activate   (i_write_activate ),
  .o_write_size       (o_write_size     ),
  .i_write_strobe     (i_write_strobe   ),
  .i_write_data       (i_write_data     ),

  //Read Side
  .i_read_enable      (i_read_enable    ),
  .i_read_addr        (i_read_addr      ),
  .i_read_addr_inc    (i_read_addr_inc  ),
  .i_read_addr_dec    (i_read_addr_dec  ),
  .o_read_busy        (o_read_busy      ),
  .o_read_error       (o_read_error     ),
  .i_read_count       (i_read_count     ),
  .i_read_flush       (i_read_flush     ),

  .o_read_ready       (o_read_ready     ),
  .i_read_activate    (i_read_activate  ),
  .o_read_size        (o_read_size      ),
  .o_read_data        (o_read_data      ),
  .i_read_strobe      (i_read_strobe    )


);

//Asynchronous Logic

assign  w_bram_wea      = i_wbs_we;
//Synchronous Logic

always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat       <= 32'h0;
    o_wbs_ack       <= 0;
    o_wbs_int       <= 0;

    //Ram Specific
    ram_sleep       <= 0;
    r_bram_addr     <= 0;
    r_bram_din      <= 0;
  end
  else begin
    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack     <= 0;
      ram_sleep     <= 0;
    end

    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      r_bram_addr <= i_wbs_adr[BUFFER_WIDTH - 1:0];
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          r_bram_din <= i_wbs_dat;
        end
        else begin
          //read request
          o_wbs_dat <= w_bram_dout;
        end
        if (ram_sleep < SLEEP_COUNT) begin
          ram_sleep   <=  ram_sleep + 1;
        end
        else begin
          o_wbs_ack <= 1;
        end
      end
    end
  end
end

endmodule
