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
module raizing_scroll (
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
    input FLIPX,

    //interface with scroll ram
     output [12:0] SCR0_GP9001RAM_GCU_ADDR,
    input  [15:0] SCR0_GP9001RAM_GCU_DOUT,
    output [12:0] SCR1_GP9001RAM_GCU_ADDR,
    input  [15:0] SCR1_GP9001RAM_GCU_DOUT,
    output [12:0] SCR2_GP9001RAM_GCU_ADDR,
    input  [15:0] SCR2_GP9001RAM_GCU_DOUT,

    //tile gfx
    output GFXSCR0_CS,
    input GFXSCR0_OK,
    output [14:0] SCR0_TILE_NUMBER,
    output [15:0] SCR0_TILE_NUMBER_OFFS,
    output [3:0] SCR0_TILE_BANK,
    input  [31:0] SCR0_GFX_DATA,

    output GFXSCR1_CS,
    input GFXSCR1_OK,
    output [14:0] SCR1_TILE_NUMBER,
    output [15:0] SCR1_TILE_NUMBER_OFFS,
    output [3:0] SCR1_TILE_BANK,
    input  [31:0] SCR1_GFX_DATA,

    output GFXSCR2_CS,
    input GFXSCR2_OK,
    output [14:0] SCR2_TILE_NUMBER,
    output [15:0] SCR2_TILE_NUMBER_OFFS,
    output [3:0] SCR2_TILE_BANK,
    input  [31:0] SCR2_GFX_DATA,

    //scroll registers
    input signed [12:0] BACKGROUND_SCROLL_X,
    input signed [12:0] BACKGROUND_SCROLL_Y,
    input signed [12:0] BACKGROUND_SCROLL_XOFFS,
    input signed [12:0] BACKGROUND_SCROLL_YOFFS,
    input signed [12:0] FOREGROUND_SCROLL_X,
    input signed [12:0] FOREGROUND_SCROLL_Y,
    input signed [12:0] FOREGROUND_SCROLL_XOFFS,
    input signed [12:0] FOREGROUND_SCROLL_YOFFS,
    input signed [12:0] TEXT_SCROLL_X,
    input signed [12:0] TEXT_SCROLL_Y,
    input signed [12:0] TEXT_SCROLL_XOFFS,
    input signed [12:0] TEXT_SCROLL_YOFFS,

    output reg [14:0] SCROLL0_PIXEL,
    output reg [14:0] SCROLL1_PIXEL,
    output reg [14:0] SCROLL2_PIXEL
);

wire [14:0] scr0_buf_data;
wire [8:0] scr0_buf_addr;
wire [14:0] scr1_buf_data;
wire [8:0] scr1_buf_addr;
wire [14:0] scr2_buf_data;
wire [8:0] scr2_buf_addr;

wire [14:0] prescr0_pxl, prescr1_pxl, prescr2_pxl;
wire [8:0] scr0_buf_addr_out = H;
wire [8:0] scr1_buf_addr_out = H;
wire [8:0] scr2_buf_addr_out = H;
reg last_HB = 0, start = 0;
wire pedg_HB = !HB && last_HB;
reg busy = 1'b0;

jtframe_linebuf #(.DW(15)) u_scr0_line (
    .clk(CLK96),
    .LHBL(~HB),
    .wr_addr(scr0_buf_addr),
    .pxl_cen(PIXEL_CEN),
    .wr_data(scr0_buf_data),
    .we(scr0_buf_we),
    .rd_addr(scr0_buf_addr_out),
    .rd_data(prescr0_pxl),
    .rd_gated()
);

jtframe_linebuf #(.DW(15)) u_scr1_line (
    .clk(CLK96),
    .LHBL(~HB),
    .wr_addr(scr1_buf_addr),
    .pxl_cen(PIXEL_CEN),
    .wr_data(scr1_buf_data),
    .we(scr1_buf_we),
    .rd_addr(scr1_buf_addr_out),
    .rd_data(prescr1_pxl),
    .rd_gated()
);

jtframe_linebuf #(.DW(15)) u_scr2_line (
    .clk(CLK96),
    .LHBL(~HB),
    .wr_addr(scr2_buf_addr),
    .pxl_cen(PIXEL_CEN),
    .wr_data(scr2_buf_data),
    .we(scr2_buf_we),
    .rd_addr(scr2_buf_addr_out),
    .rd_data(prescr2_pxl),
    .rd_gated()
);

wire scr0_busy, scr0_done;
reg scr0_start;
wire scr1_busy, scr1_done;
reg scr1_start;
wire scr2_busy, scr2_done;
reg scr2_start;

raizing_scroll_qr u_scroll0 (
    .CLK(CLK),
    .CLK96(CLK96),
    .PIXEL_CEN(PIXEL_CEN),
    .RESET(RESET),
    .RESET96(RESET96),
    .VRENDER(VRENDER),
    .H(H),
    .ACTIVE(ACTIVE),
    .HB(HB),
    .VB(VB),
    .FLIPX(FLIPX),
    .SCR_GP9001RAM_GCU_ADDR(SCR0_GP9001RAM_GCU_ADDR),
    .SCR_GP9001RAM_GCU_DOUT(SCR0_GP9001RAM_GCU_DOUT),
    .SCROLL_X_POS(BACKGROUND_SCROLL_X+BACKGROUND_SCROLL_XOFFS),
    .SCROLL_Y_POS(BACKGROUND_SCROLL_Y+BACKGROUND_SCROLL_YOFFS),
    .GFXSCR_CS(GFXSCR0_CS),
    .GFXSCR_OK(GFXSCR0_OK),
    .SCR_TILE_NUMBER(SCR0_TILE_NUMBER),
    .SCR_TILE_NUMBER_OFFS(SCR0_TILE_NUMBER_OFFS),
    .SCR_TILE_BANK(SCR0_TILE_BANK),
    .SCR_GFX_DATA(SCR0_GFX_DATA),
    .BUSY(scr0_busy),
    .DONE(scr0_done),
    .START(scr0_start),
    .BUF_ADDR(scr0_buf_addr),
    .BUF_DATA(scr0_buf_data),
    .BUF_WE(scr0_buf_we),
    .DEBUG_SCRN(0)
);

raizing_scroll_qr u_scroll1 (
    .CLK(CLK),
    .CLK96(CLK96),
    .PIXEL_CEN(PIXEL_CEN),
    .RESET(RESET),
    .RESET96(RESET96),
    .VRENDER(VRENDER),
    .H(H),
    .ACTIVE(ACTIVE),
    .HB(HB),
    .VB(VB),
    .FLIPX(FLIPX),
    .SCR_GP9001RAM_GCU_ADDR(SCR1_GP9001RAM_GCU_ADDR),
    .SCR_GP9001RAM_GCU_DOUT(SCR1_GP9001RAM_GCU_DOUT),
    .SCROLL_X_POS(FOREGROUND_SCROLL_X+FOREGROUND_SCROLL_XOFFS),
    .SCROLL_Y_POS(FOREGROUND_SCROLL_Y+FOREGROUND_SCROLL_YOFFS),
    .GFXSCR_CS(GFXSCR1_CS),
    .GFXSCR_OK(GFXSCR1_OK),
    .SCR_TILE_NUMBER(SCR1_TILE_NUMBER),
    .SCR_TILE_NUMBER_OFFS(SCR1_TILE_NUMBER_OFFS),
    .SCR_TILE_BANK(SCR1_TILE_BANK),
    .SCR_GFX_DATA(SCR1_GFX_DATA),
    .BUSY(scr1_busy),
    .DONE(scr1_done),
    .START(scr1_start),
    .BUF_ADDR(scr1_buf_addr),
    .BUF_DATA(scr1_buf_data),
    .BUF_WE(scr1_buf_we),
    .DEBUG_SCRN(1)
);

raizing_scroll_qr u_scroll2 (
    .CLK(CLK),
    .CLK96(CLK96),
    .PIXEL_CEN(PIXEL_CEN),
    .RESET(RESET),
    .RESET96(RESET96),
    .VRENDER(VRENDER),
    .H(H),
    .ACTIVE(ACTIVE),
    .HB(HB),
    .VB(VB),
    .FLIPX(FLIPX),
    .SCR_GP9001RAM_GCU_ADDR(SCR2_GP9001RAM_GCU_ADDR),
    .SCR_GP9001RAM_GCU_DOUT(SCR2_GP9001RAM_GCU_DOUT),
    .SCROLL_X_POS(TEXT_SCROLL_X+TEXT_SCROLL_XOFFS),
    .SCROLL_Y_POS(TEXT_SCROLL_Y+TEXT_SCROLL_YOFFS),
    .GFXSCR_CS(GFXSCR2_CS),
    .GFXSCR_OK(GFXSCR2_OK),
    .SCR_TILE_NUMBER(SCR2_TILE_NUMBER),
    .SCR_TILE_NUMBER_OFFS(SCR2_TILE_NUMBER_OFFS),
    .SCR_TILE_BANK(SCR2_TILE_BANK),
    .SCR_GFX_DATA(SCR2_GFX_DATA),
    .BUSY(scr2_busy),
    .DONE(scr2_done),
    .START(scr2_start),
    .BUF_ADDR(scr2_buf_addr),
    .BUF_DATA(scr2_buf_data),
    .BUF_WE(scr2_buf_we),
    .DEBUG_SCRN(2)
);
reg done0=0, done1=0, done2=0;

always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
    end else begin
        if(PIXEL_CEN && ACTIVE) begin
            //original order
            SCROLL0_PIXEL<=prescr0_pxl;
            SCROLL1_PIXEL<=prescr1_pxl;
            SCROLL2_PIXEL<=prescr2_pxl;
        end
    end
end
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        busy<=1'b0;
        start<=1'b0;
        scr0_start<=1'b0;
        scr1_start<=1'b0;
        scr2_start<=1'b0;
        done0<=1'b0;
        done1<=1'b0;
        done2<=1'b0;
    end else begin
        last_HB    <= HB;

        if( (pedg_HB && !VB)  || (((!FLIPX && VRENDER == 0) || (FLIPX && VRENDER == 239)) && pedg_HB)) begin
            start <= 1'b1;
            busy <= 1'b0;
        end

        if(start && !busy) begin
            //init
            // $display("start: %d", VRENDER);
            start<=1'b0;
            busy<=1'b1;
            scr0_start<=1'b1;
            scr1_start<=1'b1;
            scr2_start<=1'b1;
            done0<=1'b0;
            done1<=1'b0;
            done2<=1'b0;
        end else if (busy) begin
            if(done0 && done1 && done2) begin
                // $display("end: %d", VRENDER);
                busy<=1'b0;
                start<=1'b0;
                scr0_start<=1'b0;
                scr1_start<=1'b0;
                scr2_start<=1'b0;
                done0<=1'b0;
                done1<=1'b0;
                done2<=1'b0;
            end else begin
                if(scr0_done) begin 
                    done0<=1'b1;
                    scr0_start<=1'b0;
                end
                if(scr1_done) begin 
                    done1<=1'b1;
                    scr1_start<=1'b0;
                end
                if(scr2_done) begin
                    done2<=1'b1;
                    scr2_start<=1'b0;
                end
            end
        end
    end
end

endmodule

// for queueing/ rendering the layers
module raizing_scroll_qr (
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
    input FLIPX,
    output reg [12:0] SCR_GP9001RAM_GCU_ADDR,
    input  [15:0] SCR_GP9001RAM_GCU_DOUT,

    output reg GFXSCR_CS,
    input GFXSCR_OK,
    output reg [14:0] SCR_TILE_NUMBER,
    output reg [15:0] SCR_TILE_NUMBER_OFFS,
    output reg [3:0] SCR_TILE_BANK,
    input  [31:0] SCR_GFX_DATA,

    input signed [12:0] SCROLL_X_POS,
    input signed [12:0] SCROLL_Y_POS,

    output reg BUSY,
    output reg DONE,
    input START,

    output reg [8:0] BUF_ADDR,
    output reg [14:0] BUF_DATA,
    output reg BUF_WE,

    input [1:0] DEBUG_SCRN
);

localparam max_tile = ('h1000000-1)>>7, max_priority = 16;

reg [7:0] st = 0;
reg [8:0] x = 0; // the tile across
reg [8:0] y = 0; // the tile down
wire [15:0] row = (((SCROLL_Y_POS >> 4) + y) << 6) & 'h7C0;
wire [15:0] column = ((((SCROLL_X_POS >> 4) + x) << 1) & 'h3E);
reg [16:0] tile_num = 0;
reg [15:0] tile_attrib = 0;
reg [4:0] priority_l = 0; 
reg [15:0] scr_queue_i = 0;
reg [4:0] priority_i = 0;
reg [(8*max_priority)-1:0] scroll_queue_priority_n = {max_priority{8'h00}};
reg [4:0] scroll_queue_priority_n_scan_buf_i = 0;
reg [15:0] pri_has_tile = 16'd0;

reg [63:0] wr_scr_q;
reg [8:0] wr_scr_q_addr;
wire [13:0] rd_scr_q_addr = (priority_i*21) + scr_queue_i;
reg scr_q_we;
wire [63:0] scr_q_out;
reg [2:0] tx = 0;

reg [1:0] scr_x_render = 0;

wire pri_q_erase = scr_x_render == 'd2;

jtframe_dual_ram #(.dw(64), .aw(9)) u_scr_pri_q(
    .clk0(CLK96),
    .clk1(CLK96),
    .data0  (wr_scr_q),
    .addr0  (wr_scr_q_addr),
    .we0    (scr_q_we),
    .q0     (),
    // Port 1: read
    .data1  (64'h0),
    .addr1  (rd_scr_q_addr),
    .we1    (pri_q_erase),
    .q1     (scr_q_out)
);

//unpack attributes
wire signed [15:0] tile_x_pos = scr_q_out[31:16];
wire signed [15:0] tile_y_pos = scr_q_out[15:0];
wire [15:0] tile_num_attr = scr_q_out[63:32];
wire [11:0] tile_palette = ((scr_q_out[63:32] >> 12 ) & 'h07F0);

reg signed [15:0] xpos_t = 0, ypos_t = 0;


reg [31:0] tile_line;
wire [3:0] tile_code = (((tile_line >> (tx*4)) & 'h0F));
wire [9:0] buf_code = (tile_x_pos + (8 * scr_x_render) + tx);

wire [15:0] lines_down = VRENDER + (SCROLL_Y_POS & 15);
wire [15:0] excess_line = ((lines_down & 7) << 2);
wire tile_down = (lines_down >> 3);

// wire [15:0] yclip = VRENDER - tile_y_pos;
// wire [15:0] lines_down = yclip % 16;
// wire [15:0] tiles_across = (scr_x_render<<5);
// wire [15:0] tiles_down = lines_down[15:3] << 6;

// wire [15:0] cur_row_lines_down = (lines_down & 7) << 2;
// wire [15:0] tile_offs = tiles_down+cur_row_lines_down+tiles_across;

wire [7:0] nb_pixels = {|SCR_GFX_DATA[31:28], |SCR_GFX_DATA[27:24], |SCR_GFX_DATA[23:20], |SCR_GFX_DATA[19:16], 
                        |SCR_GFX_DATA[15:12], |SCR_GFX_DATA[11:8], |SCR_GFX_DATA[7:4], |SCR_GFX_DATA[3:0]};
reg [7:0] drawn_pixels = 8'h0;



always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        st<=0;
        SCR_GP9001RAM_GCU_ADDR<=0;
        BUSY<=1'b0;
        DONE<=1'b0;
        BUF_WE<=1'b0;
        x<=0;
        y <= 0;
        tile_num<=0;
        tile_attrib=0;
        priority_l = 0;
        scroll_queue_priority_n_scan_buf_i = 0;
        scroll_queue_priority_n<={max_priority{8'h00}};
        pri_has_tile <= 16'd0;
        SCR_TILE_NUMBER<=0;
        SCR_TILE_NUMBER_OFFS<= 0;
        SCR_TILE_BANK<=0;
        GFXSCR_CS<=1'b0;
        scr_x_render<=0;
        wr_scr_q<=0;
        wr_scr_q_addr<=0;
        priority_i=0;
        scr_queue_i<=0;
        scr_q_we<=1'b0;
    end else begin
        if(START && !BUSY) begin
            //init
            BUSY<=1'b1;
            DONE<=1'b0;
            st<=0;
            SCR_GP9001RAM_GCU_ADDR<=0;
            x<=0;
            y <= (VRENDER + (SCROLL_Y_POS & 15)) >> 4;
            tile_num<=0;
            tile_attrib=0;
            priority_l = 0;
            scr_q_we<=1'b0;
            scroll_queue_priority_n_scan_buf_i = 0;
            BUF_WE<=1'b0;
            scr_queue_i<=0;
            scroll_queue_priority_n<={max_priority{8'h00}};
            pri_has_tile <= 16'd0;
            wr_scr_q<=0;
            wr_scr_q_addr<=0;
            priority_i=0;
            scr_x_render<=0;
            SCR_TILE_NUMBER<=0;
            SCR_TILE_NUMBER_OFFS<= 0;
            SCR_TILE_BANK<=0;
            GFXSCR_CS<=1'b0;
        end else if(BUSY) begin
            st<=st+1;
            case(st)
                0: begin //get the column/row   
                    // $display("(%d) row: %d, %d, %d %d %d", DEBUG_SCRN, row, VRENDER, column, x, y);                 
                    if(x<21) begin
                        SCR_GP9001RAM_GCU_ADDR <= row+column+1; // tile number
                        scr_q_we<=1'b0;
                    end else begin
                        //conditions for rendering
                        priority_i = pri_has_tile[0] ? 0 :
                                    pri_has_tile[1] ? 1 :
                                    pri_has_tile[2] ? 2 :
                                    pri_has_tile[3] ? 3 :
                                    pri_has_tile[4] ? 4 :
                                    pri_has_tile[5] ? 5 :
                                    pri_has_tile[6] ? 6 :
                                    pri_has_tile[7] ? 7 :
                                    pri_has_tile[8] ? 8 :
                                    pri_has_tile[9] ? 9 :
                                    pri_has_tile[10] ? 10 :
                                    pri_has_tile[11] ? 11 :
                                    pri_has_tile[12] ? 12 :
                                    pri_has_tile[13] ? 13 :
                                    pri_has_tile[14] ? 14 :
                                    pri_has_tile[15] ? 15 :
                                    16;
                        scroll_queue_priority_n_scan_buf_i <= scroll_queue_priority_n[((priority_i+1)<<3)-1 -: 8];
                        scr_queue_i <= 0;
                        scr_x_render <= 0;
                        if(scroll_queue_priority_n[((priority_i+1)<<3)-1 -: 8] > 0) begin
                            x<=0;
                            st<=5;
                        end else begin
                            BUSY<=1'b0;
                            DONE<=1'b1;
                            BUF_WE<=1'b0;
                            scr_x_render<=0;
                            scr_queue_i<=0;
                            st<=0;
                            x<=0;
                        end
                    end
                end
                1: begin
                    SCR_GP9001RAM_GCU_ADDR <= row+column; // attributes pre-emptive
                end
                2: begin //get the tile number
                    if(SCR_GP9001RAM_GCU_DOUT > 0 && SCR_GP9001RAM_GCU_DOUT <= max_tile) begin
                        tile_num<=SCR_GP9001RAM_GCU_DOUT;
                        scr_q_we<=1'b1;
                    end else begin //the tile is blank, next entry
                        st<=0;
                        x<=x+1;
                    end
                end
                3: begin //get the attributes/ write the attributes
                    tile_attrib = SCR_GP9001RAM_GCU_DOUT;
                    priority_l = (tile_attrib>>8) & 'h0F;
                    pri_has_tile[priority_l & 'h0F] <= 1'b1;
                    scroll_queue_priority_n[((priority_l+1)<<3)-1 -: 8] <= scroll_queue_priority_n[((priority_l+1)<<3)-1 -: 8] + 1;
                    xpos_t = (((x<<4) - (SCROLL_X_POS & 15)));
                    ypos_t = (((y<<4) - (SCROLL_Y_POS & 15)));
                    wr_scr_q<={tile_attrib[15:0], tile_num[15:0], xpos_t, ypos_t};
                    wr_scr_q_addr<=((priority_l*21) + scroll_queue_priority_n[((priority_l+1)<<3)-1 -: 8]);
                    // $display("(%d) %d: queue: %h, x:%d", DEBUG_SCRN, VRENDER, {tile_attrib[15:0], tile_num[15:0], xpos_t, ypos_t}, xpos_t);
                    x<=x+1;
                    st<=0;
                end
                5: begin
                    pri_has_tile[priority_i]<=0;
                    st<=6; //wait state
                end
                6: begin //rendering (2 lines for every tile)
                    if(scr_queue_i < scroll_queue_priority_n_scan_buf_i) begin
                        if(tile_num_attr > 0 ) begin
                            GFXSCR_CS<=1'b1;
                            SCR_TILE_NUMBER<=(tile_num_attr & 'h1FFF) << 2;
                            SCR_TILE_NUMBER_OFFS<= ((tile_down << 6) + (scr_x_render << 5)) + excess_line;
                            SCR_TILE_BANK<=(tile_num_attr >> 13) & 7;
                            st<=7;
                        end else begin //next tile
                            GFXSCR_CS<=1'b0;
                            scr_x_render<=0;
                            scr_queue_i<=scr_queue_i + 1;
                            st<=5;
                        end
                    end else begin //all tiles drawn for this priority level, next pri level
                        if(pri_has_tile > 0) begin // and there are still more priority levels to go
                            st<=5; //go back to scanning
                            //setup conditions for scanning
                            scr_queue_i<=0;
                            scr_x_render<=0;

                            priority_i = pri_has_tile[0] ? 0 :
                                         pri_has_tile[1] ? 1 :
                                         pri_has_tile[2] ? 2 :
                                         pri_has_tile[3] ? 3 :
                                         pri_has_tile[4] ? 4 :
                                         pri_has_tile[5] ? 5 :
                                         pri_has_tile[6] ? 6 :
                                         pri_has_tile[7] ? 7 :
                                         pri_has_tile[8] ? 8 :
                                         pri_has_tile[9] ? 9 :
                                         pri_has_tile[10] ? 10 :
                                         pri_has_tile[11] ? 11 :
                                         pri_has_tile[12] ? 12 :
                                         pri_has_tile[13] ? 13 :
                                         pri_has_tile[14] ? 14 :
                                         pri_has_tile[15] ? 15 :
                                         16;
                            scroll_queue_priority_n_scan_buf_i<=scroll_queue_priority_n[((priority_i+1)<<3)-1 -: 8];
                        end else begin
                            BUSY<=1'b0;
                            DONE<=1'b1;
                            BUF_WE<=1'b0;
                            scr_x_render<=0;
                            scr_queue_i<=0;
                            st<=0;
                            x<=0;
                        end
                    end
                end
                7: st<=8;
                8: begin
                    if(GFXSCR_OK) begin
                        SCR_TILE_NUMBER<=0;
                        SCR_TILE_NUMBER_OFFS<= 0;
                        SCR_TILE_BANK<=0;
                        GFXSCR_CS<=1'b0;
                        // $display("(%d) slice data: %h", DEBUG_SCRN, SCR_GFX_DATA);
                        // $display("(%d) slice active, rendering: %h %h %h, %d x:%d", DEBUG_SCRN, SCR_TILE_NUMBER, SCR_TILE_BANK, SCR_TILE_NUMBER_OFFS, scr_x_render, tile_x_pos);
                            tile_line<=SCR_GFX_DATA;
                            tx<= 0;
                            drawn_pixels = 8'h0;
                            BUF_WE<=1'b1;
                            st<=9;
                    end else begin
                        st<=st;
                    end
                end
                9: begin
                    tx <= (tx + 1);
                    if( tile_code > 0 ) begin //if the tile is not blank
                        // $display("(%d) pixel: %d, %d, %h", DEBUG_SCRN, VRENDER, buf_code, (priority_i[3:0] << 12) + tile_palette + tile_code);
                        drawn_pixels[tx] = 1'b1;
                        if(tile_x_pos <= -16 || tile_x_pos >=320) begin
                            if(tile_x_pos > -tx && tile_x_pos < (320-tx)) begin
                                // $display("line: %d, priority: %d, x:%d", VRENDER, priority_i, (sprite_x_pos+tx)&'h1FF);
                                BUF_ADDR<=(FLIPX ? 319-(tile_x_pos+tx) : (tile_x_pos+tx))&'h1FF;
                                BUF_DATA<=(priority_i[3:0] << 11) + tile_palette + tile_code;
                            end
                        end else if((tile_x_pos > -16 && tile_x_pos <320)) begin
                            // $display("%h, %d, %d, %h, %h, %h", sprite_num, VRENDER, buf_code, palette, sprite_code, palette+sprite_code);
                            // $display("line: %d, priority: %d, x:%d", VRENDER, priority_i, buf_code&'h1FF);
                            BUF_ADDR<=(FLIPX ? 319-buf_code : buf_code)&'h1FF;
                            BUF_DATA<=(priority_i[3:0] << 11) + tile_palette + tile_code;
                        end else begin //sprite is out of bounds
                            BUF_ADDR<=(FLIPX ? 319-buf_code : buf_code)&'h1ff;
                            BUF_DATA<=0;                      
                        end
                    end else begin
                        BUF_ADDR<=(FLIPX ? 319-buf_code : buf_code)&'h1ff;
                        BUF_DATA<=0;
                    end

                    // if(drawn_pixels == nb_pixels) begin
                        if(tx==7) begin
                        st<=10;
                        scr_x_render<=scr_x_render+1;
                    end
                    else st<=st;
                end
                10: begin
                    if(scr_x_render == 2) begin
                        scr_queue_i<=scr_queue_i+1;
                        scr_x_render<=0;
                    end
                    drawn_pixels = 8'h0;
                    tx<=0;
                    st<=5;
                    BUF_WE<=1'b0;
                end
            endcase 
        end else begin
        end
    end
end

endmodule