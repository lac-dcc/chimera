// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_test_dma_mem.v
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
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x800000000000C594

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: 19 UNICODE characters
  SDB_NAME:wb_test_dma_mem

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x06

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:2

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/04/20

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:1024
*/


module wb_test_dma_mem #(
  parameter ADDR_WIDTH          = 10,
  parameter READ_FIFO_SIZE      = 8,
  parameter WRITE_FIFO_SIZE     = 8,
  parameter ENABLE_ERROR_CHECK  = 1,
  parameter INITIALIZE_MEM      = 1
)(
  input                                 clk,
  input                                 rst,

  //wishbone slave signals
  input                                 i_wbs_we,
  input                                 i_wbs_stb,
  input                                 i_wbs_cyc,
  input       [3:0]                     i_wbs_sel,
  input       [31:0]                    i_wbs_adr,
  input       [31:0]                    i_wbs_dat,
  output reg  [31:0]                    o_wbs_dat,
  output reg                            o_wbs_ack,

  output reg                            o_wbs_int,

  //Write Side
  input                                 i_write_enable,
  input       [63:0]                    i_write_addr,
  input                                 i_write_addr_inc,
  input                                 i_write_addr_dec,
  output                                o_write_finished,
  input       [23:0]                    i_write_count,
  input                                 i_write_flush,

  output      [1:0]                     o_write_ready,
  input       [1:0]                     i_write_activate,
  output      [23:0]                    o_write_size,
  input                                 i_write_strobe,
  input       [31:0]                    i_write_data,

  //Read Side
  input                                 i_read_enable,
  input       [63:0]                    i_read_addr,
  input                                 i_read_addr_inc,
  input                                 i_read_addr_dec,
  output                                o_read_busy,
  output                                o_read_error,
  input       [23:0]                    i_read_count,
  input                                 i_read_flush,

  output                                o_read_ready,
  input                                 i_read_activate,
  output      [23:0]                    o_read_size,
  output      [31:0]                    o_read_data,
  input                                 i_read_strobe

);

localparam                SLEEP_COUNT = 4;

//Registers/Wires
reg   [3:0]               ram_sleep;

reg                       bram_en;
reg   [ADDR_WIDTH - 1:0]  bram_addr;
reg   [31:0]              bram_write_data;
wire  [31:0]              bram_read_data;

//Sub Modules
test_mem_dev #(
  .READ_FIFO_SIZE     (READ_FIFO_SIZE     ),
  .WRITE_FIFO_SIZE    (WRITE_FIFO_SIZE    ),
  .ADDRESS_WIDTH      (ADDR_WIDTH         ),
  .ENABLE_ERROR_CHECK (ENABLE_ERROR_CHECK ),
  .INITIALIZE_MEM     (INITIALIZE_MEM     )
)tmd(
  .clk                (clk                ),
  .rst                (rst                ),

  //BRAM
  .bram_en            (bram_en            ),
  .bram_we            (i_wbs_we           ),
  .bram_address       (bram_addr          ),
  .bram_data_in       (bram_write_data    ),
  .bram_data_out      (bram_read_data     ),

  .write_enable       (i_write_enable     ),
  .write_addr         (i_write_addr       ),
  .write_addr_inc     (i_write_addr_inc   ),
  .write_addr_dec     (i_write_addr_dec   ),
  .write_finished     (o_write_finished   ),
  .write_count        (i_write_count      ),
  .write_flush        (i_write_flush      ),

  .write_ready        (o_write_ready      ),
  .write_activate     (i_write_activate   ),
  .write_size         (o_write_size       ),
  .write_strobe       (i_write_strobe     ),
  .write_data         (i_write_data       ),


  .read_enable        (i_read_enable      ),
  .read_addr          (i_read_addr        ),
  .read_addr_inc      (i_read_addr_inc    ),
  .read_addr_dec      (i_read_addr_dec    ),
  .read_busy          (o_read_busy        ),
  .read_error         (o_read_error       ),
  .read_count         (i_read_count       ),
  .read_flush         (i_read_flush       ),

  .read_ready         (o_read_ready       ),
  .read_activate      (i_read_activate    ),
  .read_size          (o_read_size        ),
  .read_data          (o_read_data        ),
  .read_strobe        (i_read_strobe      )
);


//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat                   <= 32'h0;
    o_wbs_ack                   <= 0;
    o_wbs_int                   <= 0;

    ram_sleep                   <= SLEEP_COUNT;
    bram_en                     <= 0;
    bram_addr                   <= 0;
    bram_write_data             <= 0;
  end
  else begin

    bram_en                     <= 0;

    if (o_wbs_ack & ~i_wbs_stb)begin
      //when the master acks our ack, then put our ack down
      o_wbs_ack                 <= 0;
    end
    if (i_wbs_stb & i_wbs_cyc) begin
      //master is requesting somethign
      bram_en                   <= 1;
      bram_addr                 <= i_wbs_adr[ADDR_WIDTH - 1:0];
      if (i_wbs_we) begin
        //write request
        bram_write_data         <= i_wbs_dat;
      end
      else begin
        //read request
        o_wbs_dat               <= bram_read_data;
      end

      if (ram_sleep > 0) begin
        ram_sleep               <= ram_sleep - 1;
      end
      else begin
        o_wbs_ack               <= 1;
        ram_sleep               <= SLEEP_COUNT;
      end
    end
  end
end


endmodule
