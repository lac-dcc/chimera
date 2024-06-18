// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   tb_view.v
//
// Abstract:
//   testbench debug
//
//  Created:
//    6 October 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

wire w_valid = !top.pp_top.u_3d.pu.w_fifo_empty;
wire w_busy = !top.pp_top.u_3d.pu.w_fifo_ren;
wire [9:0] w_x = top.pp_top.u_3d.pu.w_x;
wire [8:0] w_y = top.pp_top.u_3d.pu.w_y;
wire [7:0] w_r = top.pp_top.u_3d.pu.w_cr;
wire [7:0] w_g = top.pp_top.u_3d.pu.w_cg;
wire [7:0] w_b = top.pp_top.u_3d.pu.w_cb;


initial $display("Rendering");
// i_top output analyze
always @(posedge clk) begin
  if (w_valid&!w_busy) begin
        disp_color(w_x,w_y,w_r,w_g,w_b);
  end
end

task disp_color;
  input [15:0] x;
  input [15:0] y;
  input [7:0] r;
  input [7:0] g;
  input [7:0] b;
  begin
    $display("rd: %d %d 0 %d %d %d %d", x, y, r, g, b, 8'hff,$time);
  end
endtask
