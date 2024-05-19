// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//axi_sdb.v
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
  SDB_NAME:axi_sdb

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x0F

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/12/23

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:3
*/

/*
Log
5/14/2013
  -Initial Commit
*/

`timescale 1 ns/1 ps
`include "axi_defines.v"

`include "project_defines.v"

`define SDB_ROM_SIZE_OF_HEADER  16
`define SDB_ROM_SIZE_OF_DEV     16

module axi_sdb #(
  input                             clk,
  input                             rst_n,

  //Write Address Channel
  input                             i_awvalid,
  output  reg                       o_awready,
  input       [31:0]                i_awaddr,
  input       [2:0]                 i_awprot, //Protection data not used

  //Write Data Channel
  input                             i_wvalid,
  output  reg                       o_wready,
  input       [31:0]                i_wdata,
  input       [3:0]                 i_wstrb,  //Strobe Data Ignored now

  //Write Response Channel
  output  reg                       o_bvalid,
  input                             i_bready,
  output  reg [1:0]                 o_bresp,

  //Read Address Channel
  input                             i_arvalid,
  output  reg                       o_arready,
  input       [31:0]                i_araddr,
  input       [2:0]                 i_arprot, //Protection data not used

  //Read Data Channel
  output  reg                       o_rvalid,
  input                             i_rready,
  output      [31:0]                o_rdata,
  output  reg [2:0]                 o_rresp
);

//Local Parameters
localparam  IDLE          = 0;
localparam  WRITE         = 1;
localparam  WRITE_RESP    = 2;

localparam  READ          = 1;
localparam  READ_RESP     = 2;


parameter SDB_ROM_SIZE        = `SDB_ROM_SIZE_OF_HEADER + (`SDB_NRECS * `SDB_ROM_SIZE_OF_DEV);
reg [31:0] sdb [(SDB_ROM_SIZE - 1):0];

initial begin
  $readmemh(`SDB_INPUT_FILE, sdb, 0, SDB_ROM_SIZE - 1);
end



//Registers/Wires
reg   [3:0]           r_wr_state;
reg   [3:0]           r_rd_state;

reg                   r_wr_ready;
wire                  w_wr_request;
reg                   r_wr_data_ready;
reg                   r_wr_ack;
reg                   r_wr_illegal;

reg                   r_rd_ready;
wire                  w_rd_request;
reg                   r_rd_illegal;

//Submodules

//Asynchronous Logic
  //request for when the master would like to write
assign  w_wr_request      = (((r_wr_state == WRITE) && (i_wvalid || r_wr_data_ready)) ||
                              (i_wvalid && i_awvalid));
  //request for when the master would like a read
assign  w_rd_request      = ((r_rd_state == READ) || (i_arvalid && o_arready));

//Synchronous Logic

//Write Path
always @ (posedge clk) begin
  if (!rst_n) begin
    o_awready             <=  0;
    r_wr_ready            <=  0;
    r_wr_data_ready       <=  0;

    o_wready              <=  0;

    o_bvalid              <=  0;
    o_bresp               <=  0;

    r_wr_state            <=  IDLE;
  end
  else begin
    //Strobes
    o_awready             <=  0;
    o_wready              <=  0;
    o_bvalid              <=  0;

    if (r_wr_ack) begin
      o_wr_data_ready     <=  0;
      o_wr_ready          <=  0;
    end

    case (r_wr_state)
      IDLE: begin
        //both of the ready's are high
        o_bresp           <= AXI_RESP_OKAY;
        o_awready         <=  1;
        o_wready          <=  1;

        o_wr_data_ready   <=  0;
        o_wr_ready        <=  0;

        //Three conditions
        //1: both i_awready and i_wready goes high       -> WRITE, (kicks off a write)
        if (i_awvalid && i_wvalid) begin
          o_wr_data_ready <=  1;
          o_wr_ready      <=  1;
          r_wr_state      <=  WRITE;
        end
        //2: i_awready goes high with a new address      -> WRITE
        else if (i_awvalid) begin
          r_wr_state      <=  WRITE;
        end
        //3: i_wready goe high with a new peice of data  -> WAIT_FOR_ADDRESS
        else if (i_wvalid) begin
          o_wr_data_ready <=  1;
          r_wr_state      <=  WAIT_FOR_ADDRESS;
        end
      end
      WAIT_FOR_ADDRESS: begin
        o_awready         <=  1;
        if (i_awvalid) begin
          o_wr_ready      <=  1;
          r_wr_state      <=  WRITE;
        end
      end
      WRITE: begin
        o_bresp           <= AXI_RESP_OKAY;
        if (r_wr_ack) begin
          if (r_wr_illegal) begin
            o_bresp       <= AXI_RESP_SLVERR;
          end
          r_wr_state      <=  WRITE_RESP;
        end
      end
      WRITE_RESP: begin
        o_bvalid          <=  1;
        if (i_bready) begin
          r_wr_state      <=  IDLE;
        end
      end
      default: begin
        r_wr_state        <=  IDLE;
      end
    endcase
  end
end


//Read Path
always @ (posedge clk) begin
  if (!rst_n) begin
    o_arready             <=  0;

    o_rvalid              <=  0;
    o_rdata               <=  0;
    o_rresp               <=  0;
  end
  else begin
    //Strobes
    o_arready             <=  0;
    o_rvalid              <=  0;
    case (r_rd_state)
      IDLE: begin
        //This is already high so it responds to request faster
        o_arready         <=  1;
        if (i_arvalid) begin
          //Host has requested a read
          r_rd_state      <=  READ;
        end
      end
      READ: begin
        if (r_rd_ready) begin
          r_rd_state      <=  READ_RESP;
          o_rresp         <=  AXI_RESP_OKAY;
          if (r_rd_illegal) begin
            //There was an error (most likey address out of range)
            o_rresp       <=  AXI_RESP_SLVERR;
          end
        end
      end
      READ_RESP: begin
        o_rvalid          <=  1;
        if (i_rready) begin
          r_rd_state      <=  IDLE;
        end
      end
      default: begin
        r_rd_state        <=  IDLE;
      end
    endcase
  end
end


//----------------------------------------------------------------------------
//User Spcific Code Here
//----------------------------------------------------------------------------

//Local Parameters
localparam  ADDR0       = 0;
localparam  ADDR1       = 1;
localparam  ADDR2       = 2;

//Registers/Wires
reg   [31:0]            r_data0;
reg   [31:0]            r_data1;
reg   [31:0]            r_data2;

//Submodules
//Asynchronous Logic
//Synchronous Logic

//Custom Code here
always @ (posedge clk) begin
  if (!rst_n) begin
    //Axi Write Bus Interface
    r_wr_ready            <=  0;
    r_wr_illegal          <=  0;
    r_wr_ack              <=  0;

    //Axi Read Bus Interface
    r_rd_ready            <=  0;
    r_rd_illegal          <=  0;
    o_rdata               <=  0;

    //Initialize Data
    r_data0               <=  32'h00000000;
    r_data1               <=  32'h00000000;
    r_data2               <=  32'h00000000;

  end
  else begin
    //Strobes
    r_wr_illegal          <=  0;
    r_wr_ack              <=  0;

    r_rd_ready            <=  0;
    r_rd_illegal          <=  0;


    /*Note: Write ready can be held low indefinetly when the user SM is
            not ready to read new data
    */
    r_wr_ready            <=  1;
    //Write Data
    if (w_wr_request) begin
      $display ("ALS: User Writing to addr: %h data: %h",
                    i_awaddr,
                    i_wdata);

      case (i_awaddr) begin
        ADDR0: begin
          r_data0         <=  i_wdata;
        end
        ADDR1: begin
          r_data1         <=  i_wdata;
        end
        ADDR2: begin
          r_data2         <=  i_wdata;
        end
        default: begin
          $display ("\tALS: Illegal Address!");
          r_wr_illegal    <=  1;
        end
      endcase
      r_wr_ack            <=  1;
    end

    //Read Data
    if (w_rd_request) begin
      $display ("ALS: Read from addres: %h", i_awaddr);
      case (i_araddr)
        ADDR0: begin
          o_rdata         <=  r_data0;
        end
        ADDR1: begin
          o_rdata         <=  r_data1;
        end
        ADDR2: begin
          o_rdata         <=  r_data2;
        end
        default: begin
          $display ("\tALS: Illegal Address!");
          o_rdata         <=  32'h00000000;
          r_rd_illegal    <=  1;
        end
      endcase
      /*Note: r_rd_ready can be held low indefinetly when the data is not
              ready to send to the host*/
      r_rd_ready          <=  1;
    end
  end
end

endmodule
