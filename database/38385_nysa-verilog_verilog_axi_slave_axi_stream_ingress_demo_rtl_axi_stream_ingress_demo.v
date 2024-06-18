// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2016 Dave McCoy (dave.mccoy@cospandesign.com)

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
 * Author: Dave McCoy
 * Description: AXI4 Stream Slave
 *
 * Changes:
 */

`timescale 1ps / 1ps

module axi_stream_ingress_demo #(
  parameter ADDR_WIDTH          = 32,
  parameter DATA_WIDTH          = 32,
  parameter STROBE_WIDTH        = (DATA_WIDTH / 8)
)(
  input                               clk,
  input                               rst,

  //Write Data Channel
  input                               i_tvalid,
  output  reg                         o_tready,
  input       [DATA_WIDTH - 1: 0]     i_tdata,

  input       [STROBE_WIDTH - 1:0]    i_tstrb,
  input       [STROBE_WIDTH - 1:0]    i_tkeep,
  input                               i_tlast,
  input       [3:0]                   i_tuser,
  input       [3:0]                   i_tid,
  input       [31:0]                  i_tdest

);
//local parameters

localparam      IDLE                = 4'h0;
localparam      RECEIVE_WRITE_DATA  = 4'h1;

//Address Map
localparam      ADDR_CONTROL        = 0;
localparam      ADDR_STATUS         = 1;

//registes/wires
reg           [3:0]                  state;
reg           [ADDR_WIDTH - 1: 0]    address;

reg           [DATA_WIDTH - 1: 0]    control;
reg           [DATA_WIDTH - 1: 0]    status;

//submodules
//asynchronous logic
//synchronous logic

always @ (posedge clk) begin
  //Deassert Strobes
  if (rst) begin
    o_tready            <=  0;

    //Demo values
    control             <=  0;
    status              <=  0;
    state               <= IDLE;
  end
  else begin
    case (state)
      IDLE: begin
        o_tready        <= 1;

        //Only handle read or write at one time, not both
        if (i_tvalid) begin
          state         <=  RECEIVE_WRITE_DATA;
          $display("Dest: %h", i_tdest);
          $display("User: %h", i_tuser);
          $display("ID:   %h", i_tid);
          $display("Data: 0x%08X", i_tdata);
        end
      end
      RECEIVE_WRITE_DATA: begin
        if (!i_tvalid) begin
          state         <=  IDLE;
          o_tready      <=  0;
        end
        else begin
          $display ("Data: 0x%08X", i_tdata);
        end
      end
      default: begin
        $display("Shouldn't have gotten here!");
      end
    endcase

    if (i_tlast) begin
      $display("Last Signal Strobed");
    end
  end
end

endmodule
