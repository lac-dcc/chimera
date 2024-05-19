// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License


`include "macros.vh"
////////////////////////////////////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
// ©2013 - Roman Ovseitsev <romovs@gmail.com>
////////////////////////////////////////////////////////////////////////////////////////////////////

//##################################################################################################
//
// Module for receiving RGB565 pixel data from OV camera.
//
//##################################################################################################
// TODO Note this module reads in raw (1 byte) data

`define NUM_LINES 480
`define PIX_PER_LINE 640
module CamReader (
    
    input       pclk,           // PCLK
    input       rst_n,            // 0 - Reset.
    input       [7:0] din,        // D0 - D7
    input       vsync,          // VSYNC
    input       href,           // HREF
    output      pixel_valid,     // Indicates that a pixel has been received.
    output reg  [7:0] pixel,   // Raw pixel

    input       start, // pulse
    input       stop,    // TODO does not do anythingh
    output reg [31:0] hlen,
    output reg [31:0] vlen
    );

    reg         odd;
    reg         frameValid;
    reg         href_p1;
    reg         href_p2;
    reg         href_p3;
    reg         vsync_p1;
    reg         vsync_p2;
    
    wire real_href;
    wire real_vsync;
    reg real_vsync_p1;
    wire vsync_posedge;




    reg running;
    `REG(pclk, running, 0, start ? 1'b1 : running)
    `REG(pclk, frameValid, 0, (running && !frameValid && real_vsync) ? 1'b1 : frameValid)

    reg [7:0] din_p1;
    reg [7:0] din_p2;
    `REG(pclk, din_p1[7:0], 8'hFF, din[7:0])
    `REG(pclk, din_p2[7:0], 8'hFF, din_p1[7:0])
    `REG(pclk, pixel[7:0], 8'hFF, din_p2[7:0])
    localparam IDLE=0, HBLANK=1, HACT=2;
    reg [10:0] pix_cnt_n;
    reg [10:0] pix_cnt;
    
    reg [1:0] pix_ns;
    reg [1:0] pix_cs;

    assign pixel_valid = (pix_cs == HACT);
    always @(*) begin
        case(pix_cs)
            IDLE : begin
                pix_ns = frameValid ? HBLANK : IDLE;
                pix_cnt_n = 0;
            end
            HBLANK : begin
                pix_ns = real_href ? HACT : HBLANK ;
                pix_cnt_n = real_href ? `PIX_PER_LINE : 0;
            end
            HACT : begin
                pix_ns = (pix_cnt == 1) ? HBLANK : HACT ;
                pix_cnt_n = pix_cnt - 1'b1;
            end
            default : begin
                pix_ns = IDLE ;
                pix_cnt_n = 0;
            end
        endcase

    end
    `REG(pclk, pix_cs, IDLE, pix_ns) 
    `REG(pclk, pix_cnt, 0, pix_cnt_n) 


    assign vsync_posedge = !real_vsync_p1 && real_vsync;
    assign real_href = href && href_p1 && href_p2 && !href_p3 && !real_vsync;
    assign real_vsync = vsync && vsync_p1 && vsync_p2;

    `REG(pclk, href_p1, 1'b0, href)
    `REG(pclk, href_p2, 1'b0, href_p1)
    `REG(pclk, href_p3, 1'b0, href_p2)
    `REG(pclk, vsync_p1, 1'b0, vsync)
    `REG(pclk, vsync_p2, 1'b0, vsync_p1)
    `REG(pclk, real_vsync_p1, 1'b0, real_vsync)


    reg pixel_valid_p1;
    `REG(pclk, pixel_valid_p1, 0, pixel_valid)

    reg [10:0] st_pix_cnt;
    `REG(pclk, st_pix_cnt, 32'h0,
        pixel_valid ? (st_pix_cnt+1'b1) : 0 )
    `REG(pclk, hlen, 0, (frameValid && pixel_valid_p1 && !pixel_valid && (st_pix_cnt!= 640)) ? st_pix_cnt : hlen)
    
    reg [10:0] ln_cnt;
    `REG(pclk, ln_cnt, 32'h0, 
        real_vsync ? 32'h0 : (pixel_valid && !pixel_valid_p1 ? ln_cnt+1'b1 : ln_cnt))
    `REG(pclk, vlen, 32'h0, (vsync_posedge && (ln_cnt !=480) ) ? ln_cnt : vlen)



endmodule
