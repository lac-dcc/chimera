// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Version: 1.0
    Date: 13-1-2020 */
    

// 8x8 tiles

module jtframe_tilemap(
    input              rst,
    input              clk,

    input      [ 8:0]  vrender, // 1 line ahead of vdump
    input      [ 2:0]  size,    // hot one encoding. bit 0=8x8, bit 1=16x16, bit 2=32x32
    // control registers
    input      [15:0]  vpos,
    input              flip,

    input              start,
    input              stop,
    output reg         done,


    output reg [17:1]  vram_addr,
    input      [15:0]  vram_data,
    input              vram_ok,
    output reg         vram_cs,

    output reg [19:0]  rom_addr,    // up to 1 MB
    input      [31:0]  rom_data,
    output reg         rom_cs,
    input              rom_ok,

    output reg [ 8:0]  buf_addr,
    output reg [10:0]  buf_data,
    output reg         buf_wr
);

reg [10:0] vn;
reg [10:0] hn;
reg [31:0] pxl_data;

reg [ 4:0] st;

reg [15:0] code,attr;

wire [11:0] scan;

assign      scan = { vn[8],   hn[8:3], vn[7:3] };

wire [4:0] pal   = attr[4:0];

function [3:0] colour;
    input [31:0] c;
    input        flip;
    colour = flip ? { c[24], c[16], c[ 8], c[0] } : 
                    { c[31], c[23], c[15], c[7] };
endfunction

always @(posedge clk or posedge rst) begin
    if(rst) begin
        rom_cs          <= 1'b0;
        vram_cs         <= 1'b0;
        buf_wr          <= 1'b0;
        done            <= 1'b0;
        st              <= 5'd0;
        rom_addr        <= 23'd0;
        code            <= 16'd0;
    end else begin
        st <= st+6'd1;
        case( st ) 
            0: begin
                rom_cs   <= 1'b0;
                vram_cs  <= 1'b0;
                vn       <= {7'd0, vrender};
                hn       <= 11'd0;
                buf_addr <= 9'h1ff;
                buf_wr   <= 1'b0;
                done     <= 1'b0;
                if(!start) begin
                    st   <= 0;
                end
            end
            ///////////////////////
            1: begin
                vram_addr <= { 4'd0, scan, 1'b0 };
                vram_cs   <= 1'b1;
            end
            3: begin
                if( vram_ok ) begin
                    code <= vram_data;
                end else st<=st;
            end
            4: begin
                rom_addr <= { 1'b0, code, vn[2:0] ^ {3{flip}} };
                rom_cs   <= 1'b1;
                hn <= hn + 11'h8;
            end
            6: if(rom_ok) begin
                vram_addr <= { 4'd0, scan, 1'b0 };
                pxl_data  <= rom_data;   // 32 bits = 32/4 = 8 pixels
            end else st<=6;
            7,8,9,10,    11,12,13,14: begin
                buf_wr   <= 1'b1;
                buf_addr <= buf_addr+9'd1;
                buf_data <= { pal, colour(pxl_data, flip) };
                pxl_data <= flip ? pxl_data>>1 : pxl_data<<1;
            end
            15: begin
                buf_wr <= 1'b0;
                st <= 6'd2; // scan again. Jumps to 2 because vram_addr was already
                        // updated at 6
            end
        endcase
        if( stop || buf_addr == 9'h100 ) begin // 256 pixels
            // it is important to set vram_cs as soon as possible
            // in order to avoid the SDRAM controller to be processing
            // a request at the time the scroll controller moves to
            // the SCROLL 2 layer, as this could prevent the row scroll
            // values from reading correctly
            buf_addr<= 9'd0;
            buf_wr  <= 1'b0;
            done    <= 1'b1;
            st      <= 6'd0;
            vram_cs <= 1'b0;
        end
    end
end

endmodule