// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

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



//sd_host_platform_cocotb.v
`timescale 1 ns/1 ps


module sd_host_platform_cocotb (

input                 clk,
input                 rst,

//SD Stack Interface
output  reg           o_locked,
output  reg           o_out_clk,
output                o_out_clk_x2,

input                 i_sd_cmd_dir,
output                o_sd_cmd_in,
input                 i_sd_cmd_out,

input                 i_read_wait,

input                 i_sd_data_dir,
output  reg   [7:0]   o_sd_data_in,
input         [7:0]   i_sd_data_out,

output  reg           o_phy_out_clk,
inout                 io_phy_sd_cmd,
inout         [3:0]   io_phy_sd_data

);

reg           [7:0]   lock_count;
reg                   pos_edge_clk;
wire          [3:0]   data_out;
reg           [3:0]   top_nibble;
wire          [3:0]   in_remap;


assign  o_out_clk_x2 = clk;

assign  io_phy_sd_cmd = i_sd_cmd_dir  ? i_sd_cmd_out : 1'hZ;
assign  o_sd_cmd_in   = io_phy_sd_cmd;

assign  io_phy_sd_data= i_read_wait ? {1'bZ, 1'b0, 1'bZ, 1'bZ } :
                                      i_sd_data_dir ? data_out: 4'hZ;

assign  data_out      = !pos_edge_clk ? { i_sd_data_out[7],
                                          i_sd_data_out[6],
                                          i_sd_data_out[5],
                                          i_sd_data_out[4]} :
                                        { i_sd_data_out[3],
                                          i_sd_data_out[2],
                                          i_sd_data_out[1],
                                          i_sd_data_out[0]};
/*
assign  o_sd_data_in  = pos_edge_clk ?  { io_phy_sd_data[7],
                                          io_phy_sd_data[6],
                                          io_phy_sd_data[5],
                                          io_phy_sd_data[4]} :
                                        { io_phy_sd_data[3],
                                          io_phy_sd_data[2],
                                          io_phy_sd_data[1],
                                          io_phy_sd_data[0]};
*/
assign  in_remap      =                 { io_phy_sd_data[0],
                                          io_phy_sd_data[1],
                                          io_phy_sd_data[2],
                                          io_phy_sd_data[3]};


always @ (posedge o_out_clk_x2) begin
  if (o_phy_out_clk) begin
    pos_edge_clk    <=  1;
  end
  else begin
    pos_edge_clk    <=  0;
  end
end

always @ (posedge o_out_clk_x2) begin
  if (rst) begin
    o_sd_data_in    <=  0;
    top_nibble      <=  0;
  end
  else begin
    if (o_out_clk) begin
      top_nibble    <=  in_remap;
    end
    else begin
      o_sd_data_in  <=  {top_nibble, in_remap};
    end
  end
end

always @ (posedge o_out_clk_x2) begin
  if (rst) begin
    o_out_clk     <=  0;
    o_phy_out_clk <=  0;
    lock_count    <=  0;
    o_locked      <=  0;
  end
  else begin
    o_out_clk     <= ~o_out_clk;
    o_phy_out_clk <= ~o_phy_out_clk;
    if (lock_count < 4'hF) begin
      lock_count  <=  lock_count + 1;
    end
    else begin
      o_locked    <=  1;
    end

  end
end
endmodule

