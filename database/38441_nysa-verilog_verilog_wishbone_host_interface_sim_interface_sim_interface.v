// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this start_of_frametware and associated documentation files (the "Software"), to deal in
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

//ft_master_interface.v

`timescale 1ns/1ps

module sim_interface (
  //boilerplate
  input               rst,
  input               clk,

  //Sim Interface

  output              o_sim_master_ready,
  input               i_sim_in_reset,
  input               i_sim_in_ready,

  input   [31:0]      i_sim_in_command,
  input   [31:0]      i_sim_in_address,
  input   [31:0]      i_sim_in_data,
  input   [31:0]      i_sim_in_data_count,

  input               i_sim_out_ready,
  output              o_sim_out_en,

  output  [31:0]      o_sim_out_status,
  output  [31:0]      o_sim_out_address,
  output  [31:0]      o_sim_out_data,
  output  [27:0]      o_sim_out_data_count,


  //master interface
  input               i_master_ready,
  output  reg         o_ih_reset,
  output  reg         o_ih_ready,

  output  reg [31:0]  o_in_command,
  output  reg [31:0]  o_in_address,
  output  reg [31:0]  o_in_data,
  output  reg [27:0]  o_in_data_count,

  output  reg         o_oh_ready,
  input               i_oh_en,

  input   [31:0]      i_out_status,
  input   [31:0]      i_out_address,
  input   [31:0]      i_out_data,
  input   [27:0]      i_out_data_count
);

//Local Parameters
//Registers/Wires
//Submodules
//Asynchronous Logic
assign  o_sim_master_ready    = i_master_ready;
assign  o_sim_out_en          = i_oh_en;
assign  o_sim_out_status      = i_out_status;
assign  o_sim_out_address     = i_out_address;
assign  o_sim_out_data        = i_out_data;
assign  o_sim_out_data_count  = i_out_data_count;



//Synchronous Logic
always @ (i_sim_in_reset) begin
    o_ih_reset            = i_sim_in_reset;
end
always @ (i_sim_in_ready) begin
    o_ih_ready            =  i_sim_in_ready;
end
always @ (i_sim_in_command) begin
    o_in_command          = i_sim_in_command;
end
always @ (i_sim_in_address) begin
    o_in_address          = i_sim_in_address;
end
always @ (i_sim_in_data) begin
    o_in_data             = i_sim_in_data;
end
always @ (i_sim_in_data_count) begin
    o_in_data_count       = i_sim_in_data_count;
end
always @ (i_sim_out_ready) begin
    o_oh_ready            = i_sim_out_ready;
end

endmodule
