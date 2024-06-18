// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_sdram.v
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
  SDB_DEVICE_ID:0x00000000

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_sdram

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x06

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x02

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
  SDB_SIZE:0x800000
*/

`timescale 1 ns/1 ps

module wb_sdram (
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

  output  reg         o_wbs_int,

  //SDRAM signals
  output              o_sdram_clk,
  output              o_sdram_cke,
  output              o_sdram_cs_n,
  output              o_sdram_ras,
  output              o_sdram_cas,
  output              o_sdram_we,

  output    [11:0]    o_sdram_addr,
  output    [1:0]     o_sdram_bank,
  inout     [15:0]    io_sdram_data,
  output    [1:0]     o_sdram_data_mask,
  output              o_sdram_ready,

  output              o_ext_sdram_clk,
  output    [31:0]    debug


);

//Local Parameters

//Registers/Wires
reg               if_write_strobe;
wire      [1:0]   if_write_ready;
reg       [1:0]   if_write_activate;
wire      [23:0]  if_write_fifo_size;
reg       [23:0]  if_count;
wire              if_starved;

reg               of_read_strobe;
wire              of_read_ready;
reg               of_read_activate;
wire      [23:0]  of_read_count;
wire      [31:0]  of_read_data;
reg       [23:0]  of_count;

//wire              wr_fifo_full;
//wire              rd_fifo_empty;

reg       [3:0]   delay;
reg               wb_reading;

reg               writing;
reg               reading;
reg       [21:0]  app_address;
reg               first_exchange;

wire              of_wb_reset;


//Submoduels

sdram ram (
  .clk                (clk                ),
  .rst                (rst                ),
  //.debug              (debug              ),

  //write path
  .if_write_strobe    (if_write_strobe    ),
  .if_write_data      (i_wbs_dat          ),
  .if_write_mask      (4'b0000            ),
  .if_write_ready     (if_write_ready     ),
  .if_write_activate  (if_write_activate  ),
  .if_write_fifo_size (if_write_fifo_size ),
  .if_starved         (if_starved         ),

  //read path
  .of_read_strobe     (of_read_strobe     ),
  .of_read_data       (of_read_data       ),
  .of_read_ready      (of_read_ready      ),
  .of_read_activate   (of_read_activate   ),
  .of_read_count      (of_read_count      ),

  .sdram_write_enable (writing            ),
  .sdram_read_enable  (reading            ),
  .sdram_ready        (o_sdram_ready      ),
  .app_address        (app_address        ),

  .sd_clk             (o_sdram_clk        ),
  .cke                (o_sdram_cke        ),
  .cs_n               (o_sdram_cs_n       ),
  .ras                (o_sdram_ras        ),
  .cas                (o_sdram_cas        ),
  .we                 (o_sdram_we         ),

  .address            (o_sdram_addr       ),
  .bank               (o_sdram_bank       ),
  .data               (io_sdram_data      ),
  .data_mask          (o_sdram_data_mask  ),

  .i_wb_of_reset      (of_wb_reset        ),

  .ext_sdram_clk      (o_ext_sdram_clk    )

);

//assign  debug[0]    = of_wb_reset;
//assign  debug[1]    = of_read_ready;
//assign  debug[2]    = of_read_activate;
//assign  debug[3]    = of_read_strobe;
//assign  debug[4]    = of_read_data[31];
//assign  debug[20:5] = of_read_data[23:8];
assign  debug[0]    = i_wbs_cyc;
assign  debug[1]    = i_wbs_stb;
assign  debug[2]    = i_wbs_we;
assign  debug[3]    = o_wbs_ack;
assign  debug[19:4] = i_wbs_dat;
assign  debug[24:20]= app_address[5:1];
assign  debug[25]   = first_exchange;
assign  debug[26]   = if_write_activate;
assign  debug[27]   = if_starved;
//assign  debug[31:25]= of_read_count[7:0];


assign  of_wb_reset = (~i_wbs_cyc || i_wbs_we);

//blocks
always @ (posedge clk) begin
  if (rst) begin
    o_wbs_ack                         <= 0;
    o_wbs_int                         <= 0;
    if_write_strobe                   <= 0;
    of_read_strobe                    <= 0;
    delay                             <= 0;
    wb_reading                        <= 0;
    writing                           <= 0;
    reading                           <= 0;
    if_count                          <= 0;
    of_count                          <= 0;
    if_write_activate                 <= 0;
    app_address                       <= 0;
    first_exchange                    <= 0;
    o_wbs_dat                         <= 0;
  end
  else begin
    //Strobe
    if_write_strobe                   <= 0;
    of_read_strobe                    <= 0;

    //when the master acks our ack, then put our ack down
    if (~i_wbs_cyc) begin
      writing                         <= 0;
      reading                         <= 0;
      of_read_activate                <= 0;
      first_exchange                  <= 1;
    end

    if (o_wbs_ack & ~i_wbs_stb)begin
      o_wbs_ack                       <= 0;
      if ((if_write_activate > 0) && if_starved) begin
        //release any previously held FIFOs
        if_count                      <= 0;
        if_write_activate             <= 0;
      end
    end

    else if (!o_wbs_ack && i_wbs_stb && i_wbs_cyc) begin
      if (first_exchange) begin
        //app_address                   <=  {9'b0, i_wbs_adr[22:1], 1'b0};
        app_address                   <=  {8'b0, i_wbs_adr[22:0], 1'b0};
        //app_address                   <=  {10'b0, i_wbs_adr[22:1]};
        first_exchange                <=  0;
      end
      //master is requesting something
      if (i_wbs_we) begin
        writing <=  1;
        if (if_write_activate == 0) begin
          //try and get a FIFO
          if (if_write_ready > 0) begin
            if_count                  <= 0;
            if (if_write_ready[0]) begin
              //$display ("Getting FIFO 0");
              if_write_activate[0]    <=  1;
            end
            else begin
              //$display ("Getting FIFO 1");
              if_write_activate[1]    <=  1;
            end
          end
        end
        else begin
          //$display ("Writing");
          //write request
          if (~o_wbs_ack) begin
            if (if_count < (if_write_fifo_size - 1)) begin
              $display("WB_SDRAM: user wrote %h to address %h", i_wbs_dat, i_wbs_adr);
              o_wbs_ack               <= 1;
              if_write_strobe         <= 1;
              if_count                <= if_count + 1;

            end
            else begin
              if_write_activate       <=  0;
            end
          end
        end
      end

      //Reading
      else if (~writing) begin
        if_write_activate             <=  0;
        reading                       <=  1;
        if (of_read_ready && !of_read_activate) begin
          of_count                    <=  of_read_count;
          of_read_activate            <=  1;
        end
        else if (of_read_activate) begin
          if (of_count > 0) begin
            if (~o_wbs_ack) begin
              o_wbs_dat               <=  of_read_data;
              of_count                <=  of_count - 1;
              of_read_strobe          <=  1;
              o_wbs_ack               <=  1;
              $display("WB_SDRAM: user wb_reading %h", o_wbs_dat);
            end
          end
          else begin
            //release the FIFO
            of_read_activate          <=  0;
          end
        end
      end
    end
  end
end


endmodule
