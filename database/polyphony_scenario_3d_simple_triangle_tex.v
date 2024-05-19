// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   simple_triangle_tex.v
//
// Abstract:
//   texture-mapped triangle rendering
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

`timescale 1ns/1ns
module top();

`define VERBOSE
//`define WAVE_OUT

`include "tb_instance.v"
`include "tb_init.v"
`include "tb_task.v"

`define PP_BASE_ADDR 'h0
`define TEX_ENABLE

`ifdef WAVE_OUT
initial begin
    $dumpvars(5,top);
end
`endif

//glbl glbl();  // for gate simulation

reg [31:0] rdata;

/***********************************************
  Main test routine
***********************************************/

integer i,a;
initial begin
  reset;
  memory_clear;
  load_texture;
  u_axi_behavior.axi_single_write(1,'hf,2);
  u_axi_behavior.axi_single_read(1,rdata);
  repeat (100) @(posedge clk);
  register_setup;
  //memory_fill;
  set_triangle1;
  reg_read;
  repeat (300) @(posedge clk);
  for(i=0;i<250;i=i+1)  begin
     $display("add 500 cycle %d",i);
     repeat (500) @(posedge clk);
  end
  set_triangle2;
  reg_read;
  repeat (300) @(posedge clk);
  for(i=0;i<250;i=i+1)  begin
     $display("add 500 cycle %d",i);
     repeat (500) @(posedge clk);
  end
  cache_flush;
  repeat (5000) @(posedge clk);
  save_frame_buffer(0,640,480,"frame_buffer.dat");
  $finish;
end



/***********************************************
  Tasks for this test
***********************************************/
task load_texture;
    integer i,j,k;
    reg [31:0] r_tex[0:65535];
    begin
//        $readmemh({`SRC_DIR,"texture.txt"},r_tex);
        $readmemh("texture.txt",r_tex);
        for (i = 0; i <65536; i = i + 1) begin
            top.u_axi_slave_mem.r_mem[('h0080_0000>>2)+i] = r_tex[i];
        end
    end
endtask

task memory_fill;
  integer i,j,k;
  reg [31:0] rd;
  begin
    // color buffer
    $display("Clearing color buffer");
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0020, 4'hf, 32'h00000000); // dma top address
//  sh_write('hA400_0024, 4'hf, 32'h0f025800); // dma be/length
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0024, 4'hf, 32'h0f000303); // dma be/length
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0028, 4'hf, 32'hffffffff); // dma write data
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h002c, 4'hf, 32'h00000001); // dma start
    while (!o_int)
      @(posedge clk);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0010, rd);
    $display("int status = %h",rd);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    $display("status = %h",rd);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h002c, 4'hf, 32'h00000000); // dma clear
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    $display("status = %h",rd);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0010, rd);
    $display("int status = %h",rd);
    $display("done");
    // depth buffer
    $display("Clearing depth buffer");
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0020, 4'hf, 32'h00400000); // dma top address
//  sh_write('hA400_0024, 4'hf, 32'h0f025800); // dma be/length
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0024, 4'hf, 32'h0f000800); // dma be/length
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0028, 4'hf, 32'hffffffff); // dma write data
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h002c, 4'hf, 32'h00000001); // dma start
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    while (rd[0])
      u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0010, rd);
    $display("int status = %h",rd);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    $display("status = %h",rd);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h002c, 4'hf, 32'h00000000); // dma clear
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h002c, rd);
    $display("status = %h",rd);
    u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0010, rd);
    $display("int status = %h",rd);
    $display("done");
  end
endtask

task memory_clear;
  begin
    u_axi_slave_mem.memory_clear();
  end
endtask

task register_setup;
    reg [31:0] r_f32;
    begin
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0004, 4'hf, 32'h00000000);      // frame0 offset
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0008, 4'hf, 32'h00010000);      // frame1 offset
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0014, 4'hf, 32'h00000000);      // color mode
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0028, 4'hf, 32'h00000001);      // int mask
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0200, 4'hf, 32'h00000000);      // 3d register
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0284, 4'hf, 32'h00000000);      // color offset
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h028c, 4'hf, 32'h00400000);      // depth offset
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h02ac, 4'hf, 32'h00000001);      // depth test en, LESS
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0204, 4'hf, 32'h00000001);      // cache clear
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0280, 4'hf, 32'h00000001);      // screen flip
`ifdef TEX_ENABLE
        // texture configuration
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0258, 4'hf, 32'h00000001);      // texture enable
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0234, 4'hf, 32'h00000300);      // texture format
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0220, 4'hf, 32'h00800000);      // texture offset
        $to_float32(r_f32,256.0-1.0);
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0224, 4'hf, r_f32);             // texture width-1
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0228, 4'hf, r_f32);             // texture height-1
        u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h022c, 4'hf, 256);               // texture width
`endif
    end
endtask

task cache_flush;
  begin
    $display("cache flush");
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0204, 4'hf, 32'h00000100);      // cache flush
  end
endtask

task set_triangle1;
  reg [31:0] r_f32;
  begin
`ifdef TEX_ENABLE
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h02b4, 4'hf, 32'h1201_0000);      // attribute
`else
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h02b4, 4'hf, 32'h0000_3001);      // attribute
`endif
    // vertex0 (top)
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0340, 4'hf, r_f32);  // x
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0344, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0348, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h034c, 4'hf, r_f32);  // iw
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0350, 4'hf, r_f32);  // cr
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0354, 4'hf, r_f32);  // cg
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0358, 4'hf, r_f32);  // cb
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h035c, 4'hf, r_f32);  // ca
    $to_float32(r_f32,0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0360, 4'hf, r_f32);  // tu
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0364, 4'hf, r_f32);  // tv
     //     // vertex1 (middle)
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0380, 4'hf, r_f32);  // x
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0384, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0388, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h038c, 4'hf, r_f32);  // iw
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0390, 4'hf, r_f32);  // cr
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0394, 4'hf, r_f32);  // cg
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0398, 4'hf, r_f32);  // cb
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h039c, 4'hf, r_f32);  // ca
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03a0, 4'hf, r_f32);  // tu
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03a4, 4'hf, r_f32);  // tv
     //     // vertex2 (bottom)
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c0, 4'hf, r_f32);  // x
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c4, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c8, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03cc, 4'hf, r_f32);  // iw
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d0, 4'hf, r_f32);  // cr
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d4, 4'hf, r_f32);  // cb
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d8, 4'hf, r_f32);  // cg
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03dc, 4'hf, r_f32);  // ca
    $to_float32(r_f32,0.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03e0, 4'hf, r_f32);  // tu
    $to_float32(r_f32,0.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03e4, 4'hf, r_f32);  // tv
    // render start
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0200, 4'hf, 1);
  end
endtask

task set_triangle2;
  reg [31:0] r_f32;
  begin
`ifdef TEX_ENABLE
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h02b4, 4'hf, 32'h1201_0000);      // attribute
`else
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h02b4, 4'hf, 32'h0000_3001);      // attribute
`endif
    // vertex0 (top)
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0340, 4'hf, r_f32);  // x
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0344, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0348, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h034c, 4'hf, r_f32);  // iw
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0350, 4'hf, r_f32);  // cr
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0354, 4'hf, r_f32);  // cg
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0358, 4'hf, r_f32);  // cb
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h035c, 4'hf, r_f32);  // ca
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0360, 4'hf, r_f32);  // tu
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0364, 4'hf, r_f32);  // tv
     //     // vertex1 (middle)
    $to_float32(r_f32,200);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0380, 4'hf, r_f32);  // x
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0384, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0388, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h038c, 4'hf, r_f32);  // iw
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0390, 4'hf, r_f32);  // cr
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0394, 4'hf, r_f32);  // cg
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0398, 4'hf, r_f32);  // cb
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h039c, 4'hf, r_f32);  // ca
    $to_float32(r_f32,1.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03a0, 4'hf, r_f32);  // tu
    $to_float32(r_f32,0.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03a4, 4'hf, r_f32);  // tv
     //     // vertex2 (bottom)
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c0, 4'hf, r_f32);  // x
    $to_float32(r_f32,100);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c4, 4'hf, r_f32);  // y
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03c8, 4'hf, r_f32);  // z
    $to_float32(r_f32,1.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03cc, 4'hf, r_f32);  // iw
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d0, 4'hf, r_f32);  // cr
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d4, 4'hf, r_f32);  // cb
    $to_float32(r_f32,0.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03d8, 4'hf, r_f32);  // cg
    $to_float32(r_f32,1.0*255.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03dc, 4'hf, r_f32);  // ca
    $to_float32(r_f32,0.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03e0, 4'hf, r_f32);  // tu
    $to_float32(r_f32,0.0*16.0);
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h03e4, 4'hf, r_f32);  // tv
    // render start
    u_axi_behavior.axi_single_write(`PP_BASE_ADDR+'h0200, 4'hf, 1);
  end
endtask

task reg_read;
    reg [31:0] rd;
    begin
        // vertex0 (top)
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0340, rd);  // x
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0344, rd);  // y
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0348, rd);  // z
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h034c, rd);  // iw
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0350, rd);  // cr
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0354, rd);  // cg
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0358, rd);  // cb
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h035c, rd);  // ca
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0360, rd);  // tu
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0364, rd);  // tv
        $display("rd = %x",rd);
        // vertex1 (middle)
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0380, rd);  // x
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0384, rd);  // y
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0388, rd);  // z
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h038c, rd);  // iw
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0390, rd);  // cr
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0394, rd);  // cg
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h0398, rd);  // cb
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h039c, rd);  // ca
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03a0, rd);  // tu
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03a4, rd);  // tv
        $display("rd = %x",rd);
        // vertex2 (bottom)
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03c0, rd);  // x
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03c4, rd);  // y
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03c8, rd);  // z
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03cc, rd);  // iw
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03d0, rd);  // cr
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03d4, rd);  // cb
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03d8, rd);  // cg
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03dc, rd);  // ca
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03e0, rd);  // tu
        $display("rd = %x",rd);
        u_axi_behavior.axi_single_read(`PP_BASE_ADDR+'h03e4, rd);  // tv
        $display("rd = %x",rd);
    end
endtask


`include "tb_view.v"
endmodule
