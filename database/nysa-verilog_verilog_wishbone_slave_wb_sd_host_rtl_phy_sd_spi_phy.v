// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

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
 * Author:
 * Description:
 *
 * Changes:
 */

module sd_host_phy (
  input                     clk,
  input                     rst,

  //Coniguration
  input                     i_phy_crc_enable,
  input                     i_phy_ddr_en,
  input                     i_sd1_phy_flag,
  input                     i_sd4_phy_flag,

  //Command/Response Interface
  input                     i_cmd_stb,
  input       [39:0]        i_cmd,

  input                     i_rsp_long_flag,
  output  reg               o_rsp_stb,
  output      [135:0]       o_rsp,

  //Data
  input                     i_data_en_stb,
  output  reg               o_data_finish_ack_stb,

  //Data From Host to SD Interface
  input                     i_h2s_fifo_ready,
  output                    o_h2s_fifo_activate,
  input       [23:0]        i_h2s_fifo_size,
  output                    o_h2s_fifo_stb,
  input       [31:0]        i_h2s_fifo_data,

  //Data From SD to Host Interface
  input       [1:0]         i_s2h_fifo_ready,
  output      [1:0]         o_s2h_fifo_activate,
  input       [23:0]        i_s2h_fifo_size,
  input                     i_s2h_fifo_stb,
  output      [31:0]        o_s2h_fifo_data,

  output                    o_interrupt

);
//local parameters
localparam    IDLE              = 4'h0;
localparam    SEND_COMMAND      = 4'h1;
localparam    CMD_RESPONSE      = 4'h2;

localparam    SEND_DATA         = 4'h1;
localparam    READ_DATA         = 4'h2;

//registes/wires
reg           [3:0]         cmd_state;
reg           [3:0]         data_state;
//submodules
//asynchronous logic
//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes
  o_rsp_stb                 <=  1'b0;
  if (rst) begin
    cmd_state               <=  IDLE;
  end
  else begin
    case (cmd_state)
      IDLE: begin
        if (i_cmd_stb) begin
        end
      end
      SEND_COMMAND: begin
      end
      CMD_RESPONSE: begin
      end
      default: begin
      end
    endcase
  end
end

always @ (posedge clk) begin
  o_data_finish_ack_stb     <=  1'b0;
  if (rst) begin
    data_state              <=  IDLE;
  end
  else begin
    case (data_state)
      IDLE: begin
        if (i_data_stb) begin
          //
        end
      end
      SEND_DATA: begin
      end
      READ_DATA: begin
      end
      default: begin
      end
    endcase
  end
end

endmodule
