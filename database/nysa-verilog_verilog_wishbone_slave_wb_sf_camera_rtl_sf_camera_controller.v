// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//sf_camera_controller.v
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

`include "sf_camera_defines.v"

module sf_camera_controller (
input                 clk,
input                 rst,

//Physical Interface
output                o_cam_rst,
output                o_flash,
input                 i_flash_strobe,

output                o_cam_in_clk,

//Configuration Registers
input                 i_auto_flash,
input                 i_manual_flash_on,
input                 i_enable,
input                 i_camera_reset,

output                o_clk_locked,

//Core Controller
output                o_enable_dma,
output                o_enable_reader,
output                o_enable_interrupt

);

//Local Parameters
//Registers/Wires
//Submodules

//20MHz Clock Genertors
sf_camera_clk_gen clk_gen(
  .clk              (clk                ),
  .rst              (rst                ),
  .locked           (o_clk_locked       ),
  .phy_out_clk      (o_cam_in_clk       )
);

//Asynchronous Logic
assign  o_flash             = (i_auto_flash) ? i_flash_strobe:
                                               i_manual_flash_on;
assign  o_cam_rst           = i_camera_reset;

//Synchronous Logic
endmodule
