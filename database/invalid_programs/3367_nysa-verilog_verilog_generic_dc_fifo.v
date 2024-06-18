// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//This was taken from Rudolf Usselmann's generic_fifo_dc_gray.v

/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Universal FIFO Dual Clock, gray encoded                    ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  D/L from: http://www.opencores.org/cores/generic_fifos/    ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000-2002 Rudolf Usselmann                    ////
////                         www.asics.ws                        ////
////                         rudi@asics.ws                       ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


`timescale 1ns/1ps

module dc_fifo #(
  parameter                   DATA_WIDTH    = 32,
  parameter                   ADDRESS_WIDTH = 8
)(
  input                       read_clk,
  input                       write_clk,

  input                       rst,
  input                       clear,

  input [DATA_WIDTH - 1:0]    data_in,
  input                       write,
  output                      full,

  output  [DATA_WIDTH - 1: 0] data_out,
  input                       read,
  output                      empty,

  output                      ready
);


//Reset Logic
reg                         read_rst;
reg                         read_rst_r;

reg                         write_rst;
reg                         write_rst_r;

//only release the reset when two full cycles have passed
always @ (posedge read_clk or posedge rst)
  if (rst) read_rst <=  1;
  else if (!read_rst_r) read_rst <=  0;

always @ (posedge read_clk or posedge rst)
  if (rst) read_rst_r <=  1;
  else read_rst <=  0;

always @ (posedge write_clk or posedge rst)
  if (rst) write_rst  <=  1;
  else if (!write_rst_r) write_rst <=  0;

always @ (posedge write_clk or posedge rst)
  if (rst) write_rst_r  <=  1;
  else write_rst_r <=  0;

//Clear Logic
reg                         read_clear;
reg                         read_clear_r;

reg                         write_clear;
reg                         write_clear_r;

//only release the clear when two full cycles have passed
always @ (posedge read_clk or posedge clear)
  if (clear) read_clear <=  1;
  else if (!read_clear_r) read_clear <= 0;

always @ (posedge read_clk or posedge clear)
  if (clear) read_clear_r <=  1;
  else read_clear_r <=  0;

always @ (posedge write_clk or posedge clear)
  if (clear) write_clear <=  1;
  else if (!write_clear_r) write_clear  <=  0;

always @ (posedge write_clk or posedge clear)
  if (clear) write_clear_r  <=  1;
  else write_clear_r  <=  0;

//Memory
reg [ADDRESS_WIDTH:0]       wp_bin;
reg [ADDRESS_WIDTH:0]       wp_gray;

reg [ADDRESS_WIDTH:0]       rp_bin;
reg [ADDRESS_WIDTH:0]       rp_gray;


//Shared Memory
reg     [DATA_WIDTH - 1: 0]       mem [(1 << ADDRESS_WIDTH) - 1: 0];

//Port A
always @ (posedge write_clk) begin
  if (write) begin
    mem[addra]   <=  data_in;
  end
end

//Port B
always @ (posedge read_clk) begin
  doutb          <=  mem[rp_bin[ADDRESS_WIDTH - 1: 0]];
end


//Read/Write Pointer Logic
reg                         full;
reg                         empty;
reg                         ready;

wire  [ADDRESS_WIDTH:0]     wp_bin_next;
wire  [ADDRESS_WIDTH:0]     wp_gray_next;

wire  [ADDRESS_WIDTH:0]     rp_bin_next;
wire  [ADDRESS_WIDTH:0]     rp_gray_next;

always @ (posedge write_clk) begin
  if      (write_rst)   wp_bin  <=  {ADDRESS_WIDTH + 1{1'b0}};
  else if (write_clear) wp_bin  <=  {ADDRESS_WIDTH + 1{1'b0}};
//XXX: I can add a check to see if the full flag is set here (what about timing)
  else if (write)       wp_bin  <=  wp_bin_next;
end
always @ (posedge write_clk) begin
  if      (write_rst)   wp_gray <=  {ADDRESS_WIDTH + 1{1'b0}};
  else if (write_clear) wp_gray <=  {ADDRESS_WIDTH + 1{1'b0}};
//XXX: I can add a check to see if the full flag is set here (what about timing)
  else if (write)       wp_gray <=  wp_gray_next;
end

assign  wp_bin_next     = wp_bin +  {{ADDRESS_WIDTH{1'b0}}, 1'b1};
assign  wp_gray_next    = wp_bin_next ^ {1'b0, wp_bin_next[ADDRESS_WIDTH: 1]};

always @ (posedge read_clk) begin
  ready <=  0;
  if      (read_rst)    rp_bin  <=  {ADDRESS_WIDTH + 1{1'b0}};
  else if (read_clear)  rp_bin  <=  {ADDRESS_WIDTH + 1{1'b0}};
//XXX: I can add a check to see if the empty flag is set here (what about timing)
  else if (read && !empty) begin
    rp_bin  <=  rp_bin_next;
    ready <=  1;
  end
end
always @ (posedge read_clk) begin
  if      (read_rst)    rp_gray <=  {ADDRESS_WIDTH + 1{1'b0}};
  else if (read_clear)  rp_gray <=  {ADDRESS_WIDTH + 1{1'b0}};
//XXX: I can add a check to see if the empty flag is set here (what about timing)
  else if (read && !empty) rp_gray <=  rp_gray_next;
end

assign  rp_bin_next     = rp_bin  + {{ADDRESS_WIDTH{1'b0}}, 1'b1};
assign  rp_gray_next    = rp_bin_next ^ {1'b0, rp_bin_next[ADDRESS_WIDTH: 1]};



//Synchronization Logic
reg                         wp_sync;
reg                         rp_sync;

//XXX: is this correct? wp_syncs up to the read clock???
always @ (posedge write_clk)   wp_sync <=  wp_gray;
always  @ (posedge read_clk) rp_sync <=  rp_gray;

//Full and Empty
wire  [ADDRESS_WIDTH:0]     wp_bin_x;
wire  [ADDRESS_WIDTH:0]     rp_bin_x;

assign  wp_bin_x  = wp_sync ^ {1'b0, wp_bin_x[ADDRESS_WIDTH:1]}; //convert gray to binary
assign  rp_bin_x  = rp_sync ^ {1'b0, rp_bin_x[ADDRESS_WIDTH:1]}; //convert gray to binary

always @ (posedge read_clk) begin
  if (wp_gray == rp_gray || (read & (wp_gray == rp_gray_next))) begin
    //this goes high immediately
    empty <=  1;
  end
  else if ((empty == 1) && (wp_sync != rp_gray))begin
    //this goes low only on a clock edge
    empty <=  0;
  end
end

always @ (posedge write_clk)
  full  <=  ((wp_bin[ADDRESS_WIDTH - 1:0]  == rp_bin_x[ADDRESS_WIDTH - 1:0]) &
             (wp_bin[ADDRESS_WIDTH - 1: 0] != rp_bin_x[ADDRESS_WIDTH])) |
            (write & (wp_bin_next[ADDRESS_WIDTH - 1:0] == rp_bin_x[ADDRESS_WIDTH - 1:0]) &
             (wp_bin_next[ADDRESS_WIDTH] != rp_bin_x[ADDRESS_WIDTH]));

always @ (posedge write_clk) begin
  if (write && full) begin
    $display ("%m WARNING: Writing while FIFO is full (%t)", $time);
  end
end

always @ (posedge read_clk) begin
  if (read && (wp_gray == rp_gray)) begin
    $display ("%m WARNING: Reading while FIFO is empty (%t)", $time);
  end
end

endmodule
