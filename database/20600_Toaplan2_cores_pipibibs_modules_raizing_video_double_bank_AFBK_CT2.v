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
/*
This chip does address and bank translation to the graphics roms for the GP9001 chip.
It provides decoding functions for the graphics rom data.
*/
module AFBK_CT2 (
    input CLK,
    input CLK96,
    input GFX_CLK,
    input RESET,
    input RESET96,
    input [2:0] OBJECTBANK_SLOT,
    input [15:0] OBJECTBANK_DIN,
    input OBJECTBANK_WR,
    input [14:0] TILE_NUMBER,
    input [15:0] TILE_NUMBER_OFFS,
    input [3:0] TILE_BANK,

    input [14:0] SCR0_TILE_NUMBER,
    input [15:0] SCR0_TILE_NUMBER_OFFS,
    input [3:0] SCR0_TILE_BANK,

    input [14:0] SCR1_TILE_NUMBER,
    input [15:0] SCR1_TILE_NUMBER_OFFS,
    input [3:0] SCR1_TILE_BANK,

    input [14:0] SCR2_TILE_NUMBER,
    input [15:0] SCR2_TILE_NUMBER_OFFS,
    input [3:0] SCR2_TILE_BANK,

    input      GFX_DATA_CS,
    output reg [31:0] GFX_DATA,
    output reg GFX_DATA_OK,

    input      SCR0_GFX_DATA_CS,
    output reg [31:0] SCR0_GFX_DATA,
    output reg SCR0_GFX_DATA_OK,

    input      SCR1_GFX_DATA_CS,
    output reg [31:0] SCR1_GFX_DATA,
    output reg SCR1_GFX_DATA_OK,

    input      SCR2_GFX_DATA_CS,
    output reg [31:0] SCR2_GFX_DATA,
    output reg SCR2_GFX_DATA_OK,

    //GFX sdram interface
    output reg	    [1:0] GFX_CS,
    input 	 	    [1:0] GFX_OK,
	output reg     [21:0] GFX0_ADDR,
	input          [31:0] GFX0_DOUT,
    output reg     [21:0] GFX1_ADDR,
	input          [31:0] GFX1_DOUT,

    output reg	    [1:0] GFXSCR0_CS,
    input 	 	    [1:0] GFXSCR0_OK,
	output reg     [21:0] GFX0SCR0_ADDR,
	input          [31:0] GFX0SCR0_DOUT,
    output reg     [21:0] GFX1SCR0_ADDR,
	input          [31:0] GFX1SCR0_DOUT,

    output reg	    [1:0] GFXSCR1_CS,
    input 	 	    [1:0] GFXSCR1_OK,
	output reg     [21:0] GFX0SCR1_ADDR,
	input          [31:0] GFX0SCR1_DOUT,
    output reg     [21:0] GFX1SCR1_ADDR,
	input          [31:0] GFX1SCR1_DOUT,

    output reg	    [1:0] GFXSCR2_CS,
    input 	 	    [1:0] GFXSCR2_OK,
	output reg     [21:0] GFX0SCR2_ADDR,
	input          [31:0] GFX0SCR2_DOUT,
    output reg     [21:0] GFX1SCR2_ADDR,
	input          [31:0] GFX1SCR2_DOUT
);

integer i,m,npix;
function [31:0] decode_gfx;
	input [7:0] a,b,c,d;
	begin
        decode_gfx = 32'b0;
		for(i = 0; i < 4; i= i + 1) begin
			m = 7 - (i << 1);
			npix = ((a >> m) & 1) << 0;
			npix = npix | ((c >> m) & 1) << 1;
			npix = npix | ((b >> m) & 1) << 2;
			npix = npix | ((d >> m) & 1) << 3;
			npix = npix | ((a >> (m - 1)) & 1) << 4;
			npix = npix | ((c >> (m - 1)) & 1) << 5;
			npix = npix | ((b >> (m - 1)) & 1) << 6;
			npix = npix | ((d >> (m - 1)) & 1) << 7;
			decode_gfx = decode_gfx<<8 | npix;
		end
        //data is really little endian
        decode_gfx = {decode_gfx[7:0], decode_gfx[15:8], decode_gfx[23:16], decode_gfx[31:24]};
	end
endfunction

//object bankswitch
reg [3:0] object_bank [0:7];

//object bank write
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        `ifdef SIMULATION
        //select screen
        // object_bank[0] <= 'h9;
        // object_bank[1] <= 'hF; 
        // object_bank[2] <= 2;
        // object_bank[3] <= 3;
        // object_bank[4] <= 4;
        // object_bank[5] <= 5;
        // object_bank[6] <= 6;
        // object_bank[7] <= 7;
        //intro1
        // object_bank[0] <= 'h8;
        // object_bank[1] <= 'h9; 
        // object_bank[2] <= 'hA;
        // object_bank[3] <= 'hB;
        // object_bank[4] <= 'hC;
        // object_bank[5] <= 5;
        // object_bank[6] <= 6;
        // object_bank[7] <= 7;
        object_bank[0] <= 'he;
        object_bank[1] <= 'h1; 
        object_bank[2] <= 'h2;
        object_bank[3] <= 'h3;
        object_bank[4] <= 'h4;
        object_bank[5] <= 5;
        object_bank[6] <= 6;
        object_bank[7] <= 7;
        //bazzcok intro
        // object_bank[0] <= 'h9;
        // object_bank[1] <= 'h0; 
        // object_bank[2] <= 'h2;
        // object_bank[3] <= 'h3;
        // object_bank[4] <= 'h4;
        // object_bank[5] <= 5;
        // object_bank[6] <= 6;
        // object_bank[7] <= 7;
        //gameplay1
        // object_bank[0] <= 'h8;
        // object_bank[1] <= 'h1; 
        // object_bank[2] <= 'h2;
        // object_bank[3] <= 'h3;
        // object_bank[4] <= 'h4;
        // object_bank[5] <= 5;
        // object_bank[6] <= 6;
        // object_bank[7] <= 7;
        `else
        object_bank[0] <= 4'h0;
        object_bank[1] <= 4'h0;
        object_bank[2] <= 4'h0;
        object_bank[3] <= 4'h0;
        object_bank[4] <= 4'h0;
        object_bank[5] <= 4'h0;
        object_bank[6] <= 4'h0;
        object_bank[7] <= 4'h0;
        `endif
    end else begin
        if(OBJECTBANK_WR) object_bank[OBJECTBANK_SLOT] <= OBJECTBANK_DIN & 4'hF;
    end
end

wire [23:0] gfx_addr = {object_bank[TILE_BANK], {TILE_NUMBER,5'b0}+TILE_NUMBER_OFFS};
wire gfx_half = gfx_addr[23];

//gfx read/decode cycle
reg [2:0] st = 0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        GFX_CS<=1'b0;
        GFX_DATA_OK<=1'b0;
        st<=0;
    end 
    else if(GFX_DATA_CS) begin
        st<=st+1;
        case(st)
            0: begin
                if(gfx_half) begin
                    GFX_CS[0]<=1'b0;
                    GFX_CS[1]<=1'b1;
                    GFX1_ADDR<=(gfx_addr&'h7FFFFF)>>1;
                end else begin
                    GFX_CS[1]<=1'b0;
                    GFX_CS[0]<=1'b1;
                    GFX0_ADDR<=(gfx_addr&'h7FFFFF)>>1;
                end
                GFX_DATA_OK<=1'b0;
            end
            2: begin
                if(GFX_OK[gfx_half]) begin
                    // $display("%h %h", gfx_half ? GFX1_ADDR : GFX0_ADDR, gfx_half ? GFX1_DOUT : GFX0_DOUT);
                    GFX_DATA<= gfx_half ? decode_gfx(GFX1_DOUT[15:8], GFX1_DOUT[7:0], GFX1_DOUT[31:24], GFX1_DOUT[23:16]) :
                                          decode_gfx(GFX0_DOUT[15:8], GFX0_DOUT[7:0], GFX0_DOUT[31:24], GFX0_DOUT[23:16]);
                    GFX_CS<=2'b00;
                    GFX_DATA_OK<=1'b1;
                    st<=st+1;
                end else begin
                    GFX_DATA_OK<=1'b0;
                    st<=st;
                end
            end
            3: begin
                st<=0;
                GFX_DATA_OK<=1'b0;
            end
        endcase
    end
end

wire [23:0] scr0_gfx_addr = (((object_bank[SCR0_TILE_BANK]<<15) + SCR0_TILE_NUMBER)<<5) + SCR0_TILE_NUMBER_OFFS;
wire scr0_gfx_half = scr0_gfx_addr[23];

wire [23:0] scr1_gfx_addr = (((object_bank[SCR1_TILE_BANK]<<15) + SCR1_TILE_NUMBER)<<5) + SCR1_TILE_NUMBER_OFFS;
wire scr1_gfx_half = scr1_gfx_addr[23];

wire [23:0] scr2_gfx_addr = (((object_bank[SCR2_TILE_BANK]<<15) + SCR2_TILE_NUMBER)<<5) + SCR2_TILE_NUMBER_OFFS;
wire scr2_gfx_half = scr2_gfx_addr[23];

//gfx read/decode cycle (scroll0)
reg [2:0] scr0_st = 0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        GFXSCR0_CS<=1'b0;
        SCR0_GFX_DATA_OK<=1'b0;
        scr0_st<=0;
    end 
    else if(SCR0_GFX_DATA_CS) begin
        scr0_st<=scr0_st+1;
        case(scr0_st)
            0: begin
                if(scr0_gfx_half) begin
                    GFXSCR0_CS[0]<=1'b0;
                    GFXSCR0_CS[1]<=1'b1;
                    GFX1SCR0_ADDR<=(scr0_gfx_addr&'h7FFFFF)>>1;
                end else begin
                    GFXSCR0_CS[1]<=1'b0;
                    GFXSCR0_CS[0]<=1'b1;
                    GFX0SCR0_ADDR<=(scr0_gfx_addr&'h7FFFFF)>>1;
                end
                SCR0_GFX_DATA_OK<=1'b0;
            end
            2: begin
                if(GFXSCR0_OK[scr0_gfx_half]) begin
                    // $display("%h %h", scr_gfx_half ? GFX1SCR_ADDR : GFX0SCR_ADDR, scr_gfx_half ? GFX1SCR_DOUT : GFX0SCR_DOUT);
                    SCR0_GFX_DATA<= scr0_gfx_half ? decode_gfx(GFX1SCR0_DOUT[15:8], GFX1SCR0_DOUT[7:0], GFX1SCR0_DOUT[31:24], GFX1SCR0_DOUT[23:16]) :
                                                    decode_gfx(GFX0SCR0_DOUT[15:8], GFX0SCR0_DOUT[7:0], GFX0SCR0_DOUT[31:24], GFX0SCR0_DOUT[23:16]);
                    GFXSCR0_CS<=2'b00;
                    SCR0_GFX_DATA_OK<=1'b1;
                    scr0_st<=scr0_st+1;
                end else begin
                    SCR0_GFX_DATA_OK<=1'b0;
                    scr0_st<=scr0_st;
                end
            end
            3: begin
                scr0_st<=0;
                SCR0_GFX_DATA_OK<=1'b0;
            end
        endcase
    end
end

//gfx read/decode cycle (scroll1)
reg [2:0] scr1_st = 0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        GFXSCR1_CS<=1'b0;
        SCR1_GFX_DATA_OK<=1'b0;
        scr1_st<=0;
    end 
    else if(SCR1_GFX_DATA_CS) begin
        scr1_st<=scr1_st+1;
        case(scr1_st)
            0: begin
                if(scr1_gfx_half) begin
                    GFXSCR1_CS[0]<=1'b0;
                    GFXSCR1_CS[1]<=1'b1;
                    GFX1SCR1_ADDR<=(scr1_gfx_addr&'h7FFFFF)>>1;
                end else begin
                    GFXSCR1_CS[1]<=1'b0;
                    GFXSCR1_CS[0]<=1'b1;
                    GFX0SCR1_ADDR<=(scr1_gfx_addr&'h7FFFFF)>>1;
                end
                SCR1_GFX_DATA_OK<=1'b0;
            end
            2: begin
                if(GFXSCR1_OK[scr1_gfx_half]) begin
                    // $display("%h %h", scr_gfx_half ? GFX1SCR_ADDR : GFX0SCR_ADDR, scr_gfx_half ? GFX1SCR_DOUT : GFX0SCR_DOUT);
                    SCR1_GFX_DATA<= scr1_gfx_half ? decode_gfx(GFX1SCR1_DOUT[15:8], GFX1SCR1_DOUT[7:0], GFX1SCR1_DOUT[31:24], GFX1SCR1_DOUT[23:16]) :
                                                    decode_gfx(GFX0SCR1_DOUT[15:8], GFX0SCR1_DOUT[7:0], GFX0SCR1_DOUT[31:24], GFX0SCR1_DOUT[23:16]);
                    GFXSCR1_CS<=2'b00;
                    SCR1_GFX_DATA_OK<=1'b1;
                    scr1_st<=scr1_st+1;
                end else begin
                    SCR1_GFX_DATA_OK<=1'b0;
                    scr1_st<=scr1_st;
                end
            end
            3: begin
                scr1_st<=0;
                SCR1_GFX_DATA_OK<=1'b0;
            end
        endcase
    end
end

//gfx read/decode cycle (scroll2)
reg [2:0] scr2_st = 0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        GFXSCR2_CS<=1'b0;
        SCR2_GFX_DATA_OK<=1'b0;
        scr2_st<=0;
    end 
    else if(SCR2_GFX_DATA_CS) begin
        scr2_st<=scr2_st+1;
        case(scr2_st)
            0: begin
                if(scr2_gfx_half) begin
                    GFXSCR2_CS[0]<=1'b0;
                    GFXSCR2_CS[1]<=1'b1;
                    GFX1SCR2_ADDR<=(scr2_gfx_addr&'h7FFFFF)>>1;
                end else begin
                    GFXSCR2_CS[1]<=1'b0;
                    GFXSCR2_CS[0]<=1'b1;
                    GFX0SCR2_ADDR<=(scr2_gfx_addr&'h7FFFFF)>>1;
                end
                SCR2_GFX_DATA_OK<=1'b0;
            end
            2: begin
                if(GFXSCR2_OK[scr2_gfx_half]) begin
                    // $display("%h %h", scr_gfx_half ? GFX1SCR_ADDR : GFX0SCR_ADDR, scr_gfx_half ? GFX1SCR_DOUT : GFX0SCR_DOUT);
                    SCR2_GFX_DATA<= scr2_gfx_half ? decode_gfx(GFX1SCR2_DOUT[15:8], GFX1SCR2_DOUT[7:0], GFX1SCR2_DOUT[31:24], GFX1SCR2_DOUT[23:16]) :
                                                    decode_gfx(GFX0SCR2_DOUT[15:8], GFX0SCR2_DOUT[7:0], GFX0SCR2_DOUT[31:24], GFX0SCR2_DOUT[23:16]);
                    GFXSCR2_CS<=2'b00;
                    SCR2_GFX_DATA_OK<=1'b1;
                    scr2_st<=scr2_st+1;
                end else begin
                    SCR2_GFX_DATA_OK<=1'b0;
                    scr2_st<=scr2_st;
                end
            end
            3: begin
                scr2_st<=0;
                SCR2_GFX_DATA_OK<=1'b0;
            end
        endcase
    end
end
endmodule