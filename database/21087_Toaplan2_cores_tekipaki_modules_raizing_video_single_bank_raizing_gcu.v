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
module raizing_gcu (
    input              CLK,
    input              CLK96,
    input              GFX_CLK,
    input              RESET,
    input              RESET96,
    input              CS,
    output reg         VINT,
    output reg         ACK,
    input      [15:0]  DIN,
    output reg [15:0]  DOUT,
    input       [8:0]  V,
    input       [8:0]  H,
    output     [10:0]  GP9001OUT,
    input              FLIPX,
    input              FLIPY,
    input              LVBL,

    //Register operations
    input         GP9001_OP_SELECT_REG,
    input         GP9001_OP_WRITE_REG,
    input         GP9001_OP_WRITE_RAM,
    input         GP9001_OP_READ_RAM_H,
    input         GP9001_OP_READ_RAM_L,
    input         GP9001_OP_SET_RAM_PTR,
    output        HSYNC,
    output        VSYNC,
    output        FBLANK,

    //registers
    output signed [12:0] SPRITE_SCROLL_X,
    output signed [12:0] SPRITE_SCROLL_Y,
    output signed [12:0] SPRITE_SCROLL_XOFFS,
    output signed [12:0] SPRITE_SCROLL_YOFFS,
    output signed [12:0] BACKGROUND_SCROLL_X,
    output signed [12:0] BACKGROUND_SCROLL_Y,
    output signed [12:0] BACKGROUND_SCROLL_XOFFS,
    output signed [12:0] BACKGROUND_SCROLL_YOFFS,
    output signed [12:0] FOREGROUND_SCROLL_X,
    output signed [12:0] FOREGROUND_SCROLL_Y,
    output signed [12:0] FOREGROUND_SCROLL_XOFFS,
    output signed [12:0] FOREGROUND_SCROLL_YOFFS,
    output signed [12:0] TEXT_SCROLL_X,
    output signed [12:0] TEXT_SCROLL_Y,
    output signed [12:0] TEXT_SCROLL_XOFFS,
    output signed [12:0] TEXT_SCROLL_YOFFS,


    input  [12:0] GP9001RAM_GCU_ADDR,
    output [15:0] GP9001RAM_GCU_DOUT,
    input  [12:0] GP9001RAM2_GCU_ADDR,
    output [15:0] GP9001RAM2_GCU_DOUT,
    input  [12:0] SCR0_GP9001RAM_GCU_ADDR,
    output [15:0] SCR0_GP9001RAM_GCU_DOUT,
    input  [12:0] SCR1_GP9001RAM_GCU_ADDR,
    output [15:0] SCR1_GP9001RAM_GCU_DOUT,
    input  [12:0] SCR2_GP9001RAM_GCU_ADDR,
    output [15:0] SCR2_GP9001RAM_GCU_DOUT,

    //banking
    input [16:0] TILE_NUMBER,
    input [7:0] TILE_BANK,
    output [31:0] GFX_DATA,
    input GFX_DATA_CS,
    output GFX_DATA_OK,
    input [15:0] TILE_NUMBER_OFFS,

    input [16:0] SCR0_TILE_NUMBER,
    input [7:0] SCR0_TILE_BANK,
    output [31:0] SCR0_GFX_DATA,
    input SCR0_GFX_DATA_CS,
    output SCR0_GFX_DATA_OK,
    input [15:0] SCR0_TILE_NUMBER_OFFS,

    input [16:0] SCR1_TILE_NUMBER,
    input [7:0] SCR1_TILE_BANK,
    output [31:0] SCR1_GFX_DATA,
    input SCR1_GFX_DATA_CS,
    output SCR1_GFX_DATA_OK,
    input [15:0] SCR1_TILE_NUMBER_OFFS,

    input [16:0] SCR2_TILE_NUMBER,
    input [7:0] SCR2_TILE_BANK,
    output [31:0] SCR2_GFX_DATA,
    input SCR2_GFX_DATA_CS,
    output SCR2_GFX_DATA_OK,
    input [15:0] SCR2_TILE_NUMBER_OFFS,

    //GFX Read
    output   GFX_CS,
    input    GFX_OK,
    output [21:0] GFX0_ADDR,
    input  [31:0] GFX0_DOUT,

    output   GFXSCR0_CS,
    input    GFXSCR0_OK,
    output [21:0] GFX0SCR0_ADDR,
    input  [31:0] GFX0SCR0_DOUT,

    output   GFXSCR1_CS,
    input    GFXSCR1_OK,
    output [21:0] GFX0SCR1_ADDR,
    input  [31:0] GFX0SCR1_DOUT,

    output   GFXSCR2_CS,
    input    GFXSCR2_OK,
    output [21:0] GFX0SCR2_ADDR,
    input  [31:0] GFX0SCR2_DOUT,

    input [7:0] GAME,

    input   [8:0] HS_START,
    input   [8:0] HS_END,
    input   [8:0] VS_START,
    input   [8:0] VS_END
);

localparam TEKIPAKI = 'h4, WHOOPEE = 'h5;

//debugging 
//  wire debug = 1'b1;
//  integer fd;
//  initial fd = $fopen("log_gp9001.txt", "w");

// layer offsets
wire signed [12:0] background_scroll_xoffs = GAME == TEKIPAKI ? -12'h1D6 :
                                             GAME == WHOOPEE  ? -12'h1D6 :
                                                                -12'h1D6;
wire signed [12:0] background_scroll_xoffs_f = -12'h229;
wire signed [12:0] foreground_scroll_xoffs = GAME == TEKIPAKI ? -12'h1D8 :
                                             GAME == WHOOPEE  ? -12'h1D8 :
                                                                -12'h1D8;
wire signed [12:0] foreground_scroll_xoffs_f = -12'h227;
wire signed [12:0] text_scroll_xoffs = GAME == TEKIPAKI ? -12'h1DA :
                                       GAME == WHOOPEE  ? -12'h1DA :
                                                          -12'h1DA;
wire signed [12:0] text_scroll_xoffs_f = -12'h225;
wire signed [12:0] sprite_scroll_xoffs = 12'h024; //12'h1CC;
wire signed [12:0] sprite_scroll_xoffs_f = -12'h17B;

wire signed [12:0] background_scroll_yoffs = -12'h1EF;
wire signed [12:0] background_scroll_yoffs_f = -12'h210;
wire signed [12:0] foreground_scroll_yoffs = -12'h1EF;
wire signed [12:0] foreground_scroll_yoffs_f = -12'h210;
wire signed [12:0] text_scroll_yoffs = -12'h1EF;
wire signed [12:0] text_scroll_yoffs_f = -12'h210;
wire signed [12:0] sprite_scroll_yoffs = GAME == TEKIPAKI ? 12'h011 :
                                         GAME == WHOOPEE  ? 12'h001 :
                                                            12'h001; //-12'h1EF;
wire signed [12:0] sprite_scroll_yoffs_f = -12'h108;

//blanking signal generation
assign HSYNC = H > HS_START && H < HS_END ? 0 : 1;
assign VSYNC = V >= VS_START && V <= VS_END ? 0 : 1;
assign FBLANK = !HSYNC || !VSYNC ? 0 : 1;

//ram pointer
reg [12:0] GP9001RAM_ADDR;
wire [15:0] GP9001RAM_DOUT;
reg [15:0] GP9001RAM_DIN;
reg GP9001RAM_WE;

reg [15:0] cur_ram_ptr = 16'h0000;

//scroll registers
reg [7:0] cur_scr_reg_num = 8'hFF;
reg [15:0] voffs = 16'h0000;

reg scr_reg_background_flip_x = 0;
reg scr_reg_foreground_flip_x = 0;
reg scr_reg_text_flip_x = 0;
reg scr_reg_sprite_flip_x = 0;

reg scr_reg_background_flip_y = 0;
reg scr_reg_foreground_flip_y = 0;
reg scr_reg_text_flip_y = 0;
reg scr_reg_sprite_flip_y = 0;

reg [15:0] scr_reg_background_scroll_x = 16'd0;
reg [15:0] scr_reg_background_scroll_y = 16'd0;
reg [15:0] scr_reg_foreground_scroll_x = 16'd0;
reg [15:0] scr_reg_foreground_scroll_y = 16'd0;
reg [15:0] scr_reg_text_scroll_x = 16'd0;
reg [15:0] scr_reg_text_scroll_y = 16'd0;
reg [15:0] scr_reg_sprite_scroll_x = 16'd0;
reg [15:0] scr_reg_sprite_scroll_y = 16'd0;
reg [15:0] reg_init_v_ctrl = 16'd0;

assign SPRITE_SCROLL_X = scr_reg_sprite_scroll_x;
assign SPRITE_SCROLL_Y = scr_reg_sprite_scroll_y;
assign SPRITE_SCROLL_XOFFS = sprite_scroll_xoffs;
assign SPRITE_SCROLL_YOFFS = sprite_scroll_yoffs;

assign BACKGROUND_SCROLL_X = scr_reg_background_scroll_x;
assign BACKGROUND_SCROLL_Y = scr_reg_background_scroll_y;
assign BACKGROUND_SCROLL_XOFFS = background_scroll_xoffs;
assign BACKGROUND_SCROLL_YOFFS = background_scroll_yoffs;

assign FOREGROUND_SCROLL_X = scr_reg_foreground_scroll_x;
assign FOREGROUND_SCROLL_Y = scr_reg_foreground_scroll_y;
assign FOREGROUND_SCROLL_XOFFS = foreground_scroll_xoffs;
assign FOREGROUND_SCROLL_YOFFS =foreground_scroll_yoffs;

assign TEXT_SCROLL_X = scr_reg_text_scroll_x;
assign TEXT_SCROLL_Y = scr_reg_text_scroll_y;
assign TEXT_SCROLL_XOFFS = text_scroll_xoffs;
assign TEXT_SCROLL_YOFFS = text_scroll_yoffs;

//vint irq
always @(cur_scr_reg_num, V, RESET96) begin
    if(RESET96) begin
        VINT<=1'b1;
    end else begin
        if(cur_scr_reg_num == 8'h0F || cur_scr_reg_num == 8'h8F || cur_scr_reg_num == 8'h0e) VINT<=1'b1;
        else if(V == 8'hE6) VINT<=1'b0;
    end
end

reg INC_LAST_CYCLE = 1'b0;
reg READ_LAST_CYCLE = 1'b0;
reg [7:0] LAST_OP = 8'h00;

//do cpu bus tasks
reg [2:0] st=0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        //reset the scroll registers

        //flip x
        scr_reg_background_flip_x <= ~FLIPX;
        scr_reg_foreground_flip_x <= ~FLIPX;
        scr_reg_text_flip_x <= ~FLIPX;
        scr_reg_sprite_flip_x <= ~FLIPX;

        //flip y
        scr_reg_background_flip_y <= ~FLIPY;
        scr_reg_foreground_flip_y <= ~FLIPY;
        scr_reg_text_flip_y <= ~FLIPY;
        scr_reg_sprite_flip_y <= ~FLIPY;

        //scroll regs
        scr_reg_background_scroll_x <= 0;
        scr_reg_background_scroll_y <= 0;
        scr_reg_foreground_scroll_x <= 0;
        scr_reg_foreground_scroll_y <= 0;
        scr_reg_text_scroll_x <= 0;
        scr_reg_text_scroll_y <= 0;
        
        scr_reg_sprite_scroll_x <= 0;
        scr_reg_sprite_scroll_y <= 0;
    end else begin
        // if(debug && (GP9001_OP_SET_RAM_PTR || GP9001_OP_WRITE_RAM || GP9001_OP_READ_RAM_H || GP9001_OP_READ_RAM_L)) 
        //     $fwrite(fd, "time: %t, din: %h, dout: %h, cur_ram_ptr: %h, op: %h\n", $time/1000, DIN, DOUT, cur_ram_ptr, {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L, GP9001_OP_OBJECTBANK_WR});

        //reset vars in transition
        if(LAST_OP != {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L}) begin
            st<=0;
            INC_LAST_CYCLE <= 1'b0;
            GP9001RAM_WE<=1'b0;
            ACK<=1'b1;
        end

        if(GP9001_OP_SELECT_REG) begin
            cur_scr_reg_num <= DIN & 8'h8F;
            ACK <= 1'b1;
            LAST_OP <= {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L};
        end else if(GP9001_OP_WRITE_REG) begin
            case(cur_scr_reg_num)
                8'h00, 8'h80: begin
                    scr_reg_background_scroll_x <= DIN;
                    scr_reg_background_flip_x <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_background_flip_x | FLIPX :
                                                    scr_reg_background_flip_x & ~FLIPX;
                end
                8'h01, 8'h81: begin
                    scr_reg_background_scroll_y <= DIN;
                    scr_reg_background_flip_y <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_background_flip_y | FLIPY :
                                                    scr_reg_background_flip_y & ~FLIPY;
                end
                8'h02, 8'h82: begin
                    scr_reg_foreground_scroll_x <= DIN;
                    scr_reg_foreground_flip_x <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_foreground_flip_x | FLIPX :
                                                    scr_reg_foreground_flip_x & ~FLIPX;
                end
                8'h03, 8'h83: begin
                    scr_reg_foreground_scroll_y <= DIN;
                    scr_reg_foreground_flip_y <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_foreground_flip_y | FLIPY :
                                                    scr_reg_foreground_flip_y & ~FLIPY;
                end
                8'h04, 8'h84: begin
                    scr_reg_text_scroll_x <= DIN;
                    scr_reg_text_flip_x <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_text_flip_x | FLIPX :
                                                    scr_reg_text_flip_x & ~FLIPX;
                end
                8'h05, 8'h85: begin
                    scr_reg_text_scroll_y <= DIN;
                    scr_reg_text_flip_y <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_text_flip_y | FLIPY :
                                                    scr_reg_text_flip_y & ~FLIPY;
                end
                8'h06, 8'h86: begin
                    scr_reg_sprite_scroll_x <= DIN;
                    scr_reg_sprite_flip_x <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_text_flip_x | FLIPX :
                                                    scr_reg_text_flip_x & ~FLIPX;
                end
                8'h07, 8'h87: begin
                    scr_reg_sprite_scroll_y <= DIN;
                    scr_reg_sprite_flip_y <= cur_scr_reg_num & 8'h80 ? 
                                                    scr_reg_sprite_flip_y | FLIPY :
                                                    scr_reg_sprite_flip_y & ~FLIPY;
                end
                8'h0e : begin
                    reg_init_v_ctrl <= DIN;
                end
            endcase
            ACK <= 1'b1;
            LAST_OP <= {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L};
        end else if (GP9001_OP_SET_RAM_PTR) begin
            cur_ram_ptr <= DIN;
            ACK <= 1'b1;
            LAST_OP <= {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L};
        end else if (GP9001_OP_WRITE_RAM) begin
            if(!INC_LAST_CYCLE) begin
                GP9001RAM_ADDR <= (cur_ram_ptr & 16'h1FFF);
                GP9001RAM_DIN <= DIN;
                GP9001RAM_WE <= 1'b1;
                INC_LAST_CYCLE <= 1'b1;
                ACK<=1'b0;
            end else if(!ACK) begin
                GP9001RAM_WE<=1'b0;
                cur_ram_ptr <=  cur_ram_ptr + 1;
                ACK <= 1'b1;
            end else begin
                ACK<=1'b1;
            end
            
            LAST_OP <= {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L};
        end else if(GP9001_OP_READ_RAM_H || GP9001_OP_READ_RAM_L) begin
            case(st)
                0: begin
                    GP9001RAM_ADDR <= (cur_ram_ptr & 16'h1FFF) + (GP9001_OP_READ_RAM_L ? 1'b1 : 1'b0);
                    GP9001RAM_WE <=1'b0;
                    ACK<=1'b0;
                    st<=1;
                end
                1: st<=2;
                2: begin
                    DOUT <= GP9001RAM_DOUT;
                    ACK<=1'b1;
                    st<=3;
                end
            endcase
            
            LAST_OP <= {GP9001_OP_SELECT_REG, GP9001_OP_WRITE_REG, GP9001_OP_SET_RAM_PTR, GP9001_OP_WRITE_RAM, GP9001_OP_READ_RAM_H, GP9001_OP_READ_RAM_L};
        end else begin
            ACK <= 1'b1;
            GP9001RAM_WE <= 1'b0;
            INC_LAST_CYCLE <= 1'b0;
            st<=0;
        end
    end
end

//GP9001 RAM

jtframe_dual_ram #(.dw(16), .aw(13)) u_gp9001ram_044_045(
    .clk0(CLK96),
    .clk1(CLK96),
    // Port 0
    .data0(GP9001RAM_DIN),
    .addr0(GP9001RAM_ADDR),
    .we0(GP9001RAM_WE),
    .q0(),
    // Port 1
    .data1(8'h0),
    .addr1(GP9001RAM_ADDR),
    .we1(1'b0),
    .q1(GP9001RAM_DOUT)
);

//GP9001 RAM (split out, to make rendering easier. only used internally by the GCU)
wire scroll0ram_we = GP9001RAM_WE && (GP9001RAM_ADDR>=14'h0 && GP9001RAM_ADDR<14'h800);
wire scroll1ram_we = GP9001RAM_WE && (GP9001RAM_ADDR>=14'h800 && GP9001RAM_ADDR<14'h1000);
wire scroll2ram_we = GP9001RAM_WE && (GP9001RAM_ADDR>=14'h1000 && GP9001RAM_ADDR<14'h1800);
wire spriteram_we = GP9001RAM_WE && (GP9001RAM_ADDR>=14'h1800 && GP9001RAM_ADDR<14'h1C00);

//sprite lag fix
wire spritelag_en = (GAME == WHOOPEE);

wire [1:0] spritelag_amt = GAME == WHOOPEE ? 0 :
                                             0; // Indicates frames behind live 0 = 1 | 1 = 2

reg [1:0] cur_buf = 0;
wire [1:0] cur_buf_rd = cur_buf + (spritelag_en ? (~spritelag_amt[1:0] + 1) : 0);
wire [12:0] spriteram_buff_offs = cur_buf==0 ? 0 :
                                  cur_buf==1 ? 14'h400 :
                                  cur_buf==2 ? 14'h800 :
                                  cur_buf==3 ? 14'h1000 :
                                  0;
wire [12:0] spriteram_buff_rd_offs = cur_buf_rd==0 ? 0 :
                                     cur_buf_rd==1 ? 13'h400 :
                                     cur_buf_rd==2 ? 13'h800 :
                                     cur_buf_rd==3 ? 13'h1000 :
                                     0;

reg last_vb = 0;
wire is_vb = LVBL; // start of vblank

reg clear_buff;
reg clear_buff_done;
reg [12:0] clear_buff_addr;
reg [9:0] clear_buff_counter;
wire [15:0] clear_buff_data;

always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        last_vb<=0;
        cur_buf<=0;
        clear_buff<=0;
    end else begin
        last_vb<=is_vb;
        if(is_vb && !last_vb && spritelag_en) begin //start of vblank, cut spriteram disable for sorcer and kingdom for now
            cur_buf<=((cur_buf+1)%4);
            clear_buff<=1;
        end

        if(clear_buff_counter=='h3FF) clear_buff<=0;
    end
end

//clear buffer ahead
reg c;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        clear_buff_addr<=0;
        clear_buff_counter<=0;
        clear_buff_done<=0;
        c<=0;
    end else begin
        if(clear_buff) begin
            c<=c+1;
            case(c)
                0: begin
                    clear_buff_addr<=clear_buff_counter;
                    clear_buff_counter<=clear_buff_counter+1;

                    if(clear_buff_addr=='h3FF) clear_buff_done<=1;
                    else clear_buff_done<=0;
                end
                1: ; //wait state
            endcase
        end else begin
            clear_buff_counter<=0;
            clear_buff_done<=1;
            c<=0;
        end
    end
end

jtframe_dual_ram #(.dw(16), .aw(10)) u_spriteram_o(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(GP9001RAM_DIN),
        .addr0(GP9001RAM_ADDR[9:0]),
        .we0(spriteram_we),
        .q0(),
        // Port 1
        .data1(16'h0),
        .addr1(clear_buff_addr),
        .we1(1'b0),
        .q1(clear_buff_data)
);

jtframe_dual_ram #(.dw(16), .aw(13)) u_spriteram(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(spritelag_en ? clear_buff_data : GP9001RAM_DIN),
        .addr0(spritelag_en ? clear_buff_addr + spriteram_buff_offs : GP9001RAM_ADDR[9:0] + spriteram_buff_offs),
        .we0(spritelag_en ? clear_buff && !clear_buff_done : spriteram_we),
        .q0(),
        // Port 1
        .data1(16'h0),
        .addr1(GP9001RAM_GCU_ADDR[9:0] + spriteram_buff_rd_offs),
        .we1(1'b0),
        .q1(GP9001RAM_GCU_DOUT)
);

jtframe_dual_ram #(.dw(16), .aw(13)) u_spriteram2(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(spritelag_en ? clear_buff_data : GP9001RAM_DIN),
        .addr0(spritelag_en ? clear_buff_addr + spriteram_buff_offs : GP9001RAM_ADDR[9:0] + spriteram_buff_offs),
        .we0(spritelag_en ? clear_buff && !clear_buff_done : spriteram_we),
        .q0(),
        // Port 1
        .data1(16'h0),
        .addr1(GP9001RAM2_GCU_ADDR[9:0] + spriteram_buff_rd_offs),
        .we1(1'b0),
        .q1(GP9001RAM2_GCU_DOUT)
);

jtframe_dual_ram #(.dw(16), .aw(11)) u_scroll0ram(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(GP9001RAM_DIN),
        .addr0(GP9001RAM_ADDR[10:0]),
        .we0(scroll0ram_we),
        .q0(),
        // Port 1
        .data1(8'h0),
        .addr1(SCR0_GP9001RAM_GCU_ADDR),
        .we1(1'b0),
        .q1(SCR0_GP9001RAM_GCU_DOUT)
);

jtframe_dual_ram #(.dw(16), .aw(11)) u_scroll1ram(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(GP9001RAM_DIN),
        .addr0(GP9001RAM_ADDR[10:0]),
        .we0(scroll1ram_we),
        .q0(),
        // Port 1
        .data1(8'h0),
        .addr1(SCR1_GP9001RAM_GCU_ADDR),
        .we1(1'b0),
        .q1(SCR1_GP9001RAM_GCU_DOUT)
);

jtframe_dual_ram #(.dw(16), .aw(11)) u_scroll2ram(
        .clk0(CLK96),
        .clk1(CLK96),
        // Port 0
        .data0(GP9001RAM_DIN),
        .addr0(GP9001RAM_ADDR[10:0]),
        .we0(scroll2ram_we),
        .q0(),
        // Port 1
        .data1(8'h0),
        .addr1(SCR2_GP9001RAM_GCU_ADDR),
        .we1(1'b0),
        .q1(SCR2_GP9001RAM_GCU_DOUT)
);

//GFX interface/ banking
AFBK_CT2 u_afbk_ct2(
    .CLK(CLK),
    .CLK96(CLK96),
    .GFX_CLK(GFX_CLK),
    .RESET(RESET),
    .RESET96(RESET96),

    //tile requests
    .TILE_NUMBER(TILE_NUMBER),
    .TILE_BANK(TILE_BANK),
    .TILE_NUMBER_OFFS(TILE_NUMBER_OFFS),
    .GFX_DATA_CS(GFX_DATA_CS),
    .GFX_DATA(GFX_DATA),
    .GFX_DATA_OK(GFX_DATA_OK),

    //tile requests
    .SCR0_TILE_NUMBER(SCR0_TILE_NUMBER),
    .SCR0_TILE_BANK(SCR0_TILE_BANK),
    .SCR0_TILE_NUMBER_OFFS(SCR0_TILE_NUMBER_OFFS),
    .SCR0_GFX_DATA_CS(SCR0_GFX_DATA_CS),
    .SCR0_GFX_DATA(SCR0_GFX_DATA),
    .SCR0_GFX_DATA_OK(SCR0_GFX_DATA_OK),

    .SCR1_TILE_NUMBER(SCR1_TILE_NUMBER),
    .SCR1_TILE_BANK(SCR1_TILE_BANK),
    .SCR1_TILE_NUMBER_OFFS(SCR1_TILE_NUMBER_OFFS),
    .SCR1_GFX_DATA_CS(SCR1_GFX_DATA_CS),
    .SCR1_GFX_DATA(SCR1_GFX_DATA),
    .SCR1_GFX_DATA_OK(SCR1_GFX_DATA_OK),

    .SCR2_TILE_NUMBER(SCR2_TILE_NUMBER),
    .SCR2_TILE_BANK(SCR2_TILE_BANK),
    .SCR2_TILE_NUMBER_OFFS(SCR2_TILE_NUMBER_OFFS),
    .SCR2_GFX_DATA_CS(SCR2_GFX_DATA_CS),
    .SCR2_GFX_DATA(SCR2_GFX_DATA),
    .SCR2_GFX_DATA_OK(SCR2_GFX_DATA_OK),

    //GFX sdram interface
    .GFX_CS(GFX_CS),
    .GFX_OK(GFX_OK),
    .GFX0_ADDR(GFX0_ADDR),
    .GFX0_DOUT(GFX0_DOUT),

    .GFXSCR0_CS(GFXSCR0_CS),
    .GFXSCR0_OK(GFXSCR0_OK),
    .GFX0SCR0_ADDR(GFX0SCR0_ADDR),
    .GFX0SCR0_DOUT(GFX0SCR0_DOUT),

    .GFXSCR1_CS(GFXSCR1_CS),
    .GFXSCR1_OK(GFXSCR1_OK),
    .GFX0SCR1_ADDR(GFX0SCR1_ADDR),
    .GFX0SCR1_DOUT(GFX0SCR1_DOUT),

    .GFXSCR2_CS(GFXSCR2_CS),
    .GFXSCR2_OK(GFXSCR2_OK),
    .GFX0SCR2_ADDR(GFX0SCR2_ADDR),
    .GFX0SCR2_DOUT(GFX0SCR2_DOUT)
);

endmodule