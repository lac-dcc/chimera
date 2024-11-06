// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module raizing_extratext (
    input CLK,
    input CLK96,
    input PIXEL_CEN,
    input RESET,
    input RESET96,
    input [8:0] VRENDER,
    input [8:0] H,
    input ACTIVE,
    input HB,
    input VB,
    output reg [10:0] EXTRATEXT_PIXEL,
    input FLIPX,

    //text rom
    output reg [13:0] TEXTROM_ADDR,
    input  [15:0] TEXTROM_DATA,

    //text vram
    output reg [11:0] TEXTVRAM_ADDR,
    input  [15:0] TEXTVRAM_DATA,

    //text select ram
    output reg [7:0] TEXTSELECT_ADDR,
    input [15:0] TEXTSELECT_DATA,

    //text scroll ram
    output reg [7:0] TEXTSCROLL_ADDR,
    input [15:0] TEXTSCROLL_DATA,

    input [7:0] GAME
);

localparam TEKIPAKI = 'h4;
localparam WHOOPEE  = 'h5;

reg [10:0] buf_data = 0;
reg [8:0] buf_addr = 0;
reg buf_we = 1'b0;
wire [10:0] pretext_pxl;

reg [15:0] line, offset, startx, tilerow_start, ptile, tile_data_pointer, tile_palette_pointer;
reg [31:0] tile_data;
reg [8:0] xpos;
reg [7:0] st = 0;

wire [5:0] extratoffs = GAME == TEKIPAKI ? 6'h2B :
                        GAME == WHOOPEE  ? 6'h2B :
                                           6'h2C; // Used in SSTRIKER and TRUXTON2
wire [11:0] textpal_offs = 12'h800;

wire [5:0] tile_max=6'd41;

reg [8:0] x=0;

wire [8:0] buf_addr_out = H;

wire [10:0] rd_gated;
//2 lines ahead?
jtframe_linebuf #(.DW(11)) u_extratext_line (
    .clk(CLK96),
    .LHBL(~HB),
    .wr_addr(buf_addr),
    .pxl_cen(PIXEL_CEN),
    .wr_data(buf_data),
    .we(buf_we),
    .rd_addr(buf_addr_out),
    .rd_data(pretext_pxl),
    .rd_gated()
);

reg last_HB, start, last_start;
wire pedg_HB = !HB && last_HB;
reg busy = 1'b0;
wire [8:0] y = VRENDER;

reg [8:0] tx = 0;

wire signed [9:0] buf_code = (x<<3) - offset + tx;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        st<=0;
        x<=0;

        start<=1'b0;
        busy<=1'b0;
        tx<=0;
        line<=0;
        offset<=0;
        startx<=0;
        tilerow_start<=0;
        ptile<=0;
        tile_data_pointer<=0;
        tile_palette_pointer<=0;
        tile_data<=0;
        xpos<=0;
        st <= 0;
        TEXTROM_ADDR<=0;
        TEXTVRAM_ADDR<=0;
        TEXTSELECT_ADDR<=0;
        TEXTSCROLL_ADDR<=0;
    end
    else begin
        //output to renderer
        if(PIXEL_CEN && ACTIVE) begin
            EXTRATEXT_PIXEL<=pretext_pxl;
        end

        last_HB    <= HB;

        if( (pedg_HB && !VB)  || (((!FLIPX && VRENDER == 0) || (FLIPX && VRENDER == 239)) && pedg_HB)) begin
            start <= 1'b1;
        end

        if(start && !busy) begin
            start<=1'b0;
            busy<=1'b1;
            tx<=0;
            line<=0;
            offset<=0;
            startx<=0;
            tilerow_start<=0;
            ptile<=0;
            tile_data_pointer<=0;
            tile_palette_pointer<=0;
            tile_data<=0;
            xpos<=0;
            st <= 0;
            TEXTROM_ADDR<=0;
            TEXTVRAM_ADDR<=0;
            TEXTSELECT_ADDR<=0;
            TEXTSCROLL_ADDR<=0;
            x<=0;
        end else if(busy) begin
            st<=st+1'b1;
            case(st)
                0: begin
                    TEXTSELECT_ADDR<=y[7:0]; //line
                    TEXTSCROLL_ADDR<=y[7:0]; //offset
                end
                2: begin
                    line<=TEXTSELECT_DATA;
                    offset<=(TEXTSCROLL_DATA+extratoffs);
                    startx<=((TEXTSCROLL_DATA+extratoffs)>>3) & 8'h3F;
                    
                end
                3: begin
                    tilerow_start<=(line & (8'h1F<<3))<<3;
                    offset<=offset&7;
                end
            endcase
            if(x<tile_max) begin
                case(st)
                    4: begin
                        TEXTVRAM_ADDR<=(tilerow_start) + ((x+startx) & 8'h3F);
                    end
                    6: begin
                        tile_data_pointer<=(((TEXTVRAM_DATA & 12'h3FF) << 5) + ((line & 7) << 2))>>1;
                        tile_palette_pointer<=(textpal_offs+(((TEXTVRAM_DATA >> 6) & 16'h03F0)<<1))>>1;
                        TEXTROM_ADDR<=(((TEXTVRAM_DATA & 12'h3FF) << 5) + ((line & 7) << 2))>>1;
                    end
                    7: TEXTROM_ADDR<=tile_data_pointer+1;
                    8: begin
                        tile_data[31:16]<=TEXTROM_DATA;
                    end
                    9: begin
                        tile_data[15:0]<=TEXTROM_DATA;
                        buf_we<=1'b1;
                        tx<=0;
                    end
                    10: begin
                        if(tx==7) st<=st+1;
                        else st<=st;

                        tx<=tx+1;
                        if(buf_code >= 0 && buf_code < 320) begin
                            if((((tile_data >> ((7-tx)*4)) & 8'h0F)) > 0) begin
                                    buf_addr<=FLIPX ? 319-buf_code : buf_code; //start 1st pixel in this tile.
                                    buf_data<=tile_palette_pointer+(((tile_data >> ((7-tx)*4)) & 8'h0F));
                            end else begin
                                buf_addr<=FLIPX ? 319-buf_code : buf_code;
                                buf_data<=0;
                            end
                        end
                    end
                    11: begin
                        x<=x+1; //go to the next tile of the line
                        st<=4; //go back to the beginning of the tile-line rendering cycle
                    end
                endcase
            end else begin
                busy<=1'b0;
                start<=1'b0;
                st<=0;
                x<=0;
                tx<=0;
            end
        end else busy<=1'b0;
    end
end

endmodule