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
module raizing_obj (
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
    //optimizations
    input SHIFT_SPRITE_PRI,
    input FAST_OBJ_QUEUE,

    //interface with GP9001 RAM Mirror
    output reg [12:0] GP9001RAM_GCU_ADDR,
    input  [15:0] GP9001RAM_GCU_DOUT,
    output reg [12:0] GP9001RAM2_GCU_ADDR,
    input  [15:0] GP9001RAM2_GCU_DOUT,

    //tile gfx
    output reg GFX_CS,
    input GFX_OK,
    output reg [14:0] TILE_NUMBER,
    output reg [15:0] TILE_NUMBER_OFFS,
    output reg [3:0] TILE_BANK,
    input  [31:0] GFX_DATA,

    //sprite scroll regs
    input signed [12:0] SPRITE_SCROLL_X,
    input signed [12:0] SPRITE_SCROLL_Y,
    input signed [12:0] SPRITE_SCROLL_XOFFS,
    input signed [12:0] SPRITE_SCROLL_YOFFS,

    output reg [14:0] OBJ_PIXEL
);

reg [7:0] st = 0;

localparam max_sprite = 256, max_priority = 16, max_sprite_num = 'h7FFFF; 
localparam spriteram_offs = 'h0;

reg [8:0] spr = 0;
wire [12:0] sprite_addr_base = spriteram_offs+(spr[7:0]*4); //16 bit addressing
reg last_HB = 0, start = 0;
wire pedg_HB = !HB && last_HB;
reg last_VB = 0;
reg busy = 1'b0;
wire [7:0] nb_pixels = {|GFX_DATA[31:28], |GFX_DATA[27:24], |GFX_DATA[23:20], |GFX_DATA[19:16], 
                        |GFX_DATA[15:12], |GFX_DATA[11:8], |GFX_DATA[7:4], |GFX_DATA[3:0]};
reg [7:0] drawn_pixels = 8'h0;
//processing vars
reg [3:0] priority_l;
reg signed [4:0] sprite_y_size_t;
reg signed [8:0] sprite_y_pos_t;
reg [8:0] sprite_queue_n = 0;
reg [8:0] sprite_queue_i = 0;
reg [(8*max_priority)-1:0] sprite_queue_priority_n = {max_priority{8'h00}}; //store the number of sprites in each priority layer for optimization
reg [8:0] sprite_queue_priority_n_scan_buf_i = 0;
reg [4:0] priority_i = 0;
reg [8:0] spr_scan_i = 0;

reg [4:0] spr_x_render = 0;

//attribute vars
reg [63:0] sprite_attributes = 64'h0 /* synthesis keep preserve noprune*/;
reg [10:0] palette = 0;
reg [14:0] sprite_num = 0;
reg [2:0] sprite_bank = 0;
reg [4:0] sprite_x_size = 0, sprite_y_size = 0;
reg signed [9:0] sprite_x_pos = 0, sprite_y_pos = 0, multiconnector_x = 0, multiconnector_y = 0;
reg xflip = 0, yflip = 0;
reg [31:0] sprite_line = 0;
reg [2:0] tx = 0;

//2 lines ahead?
reg [14:0] buf_data = 0;
reg [8:0] buf_addr = 0;
reg buf_we = 1'b0;
wire [14:0] preobj_pxl;
wire [8:0] buf_addr_out = H;
jtframe_linebuf #(.DW(15)) u_obj_line (
    .clk(CLK96),
    .LHBL(~HB),
    .wr_addr(buf_addr),
    .pxl_cen(PIXEL_CEN),
    .wr_data(buf_data),
    .we(buf_we),
    .rd_addr(buf_addr_out),
    .rd_data(),
    .rd_gated(preobj_pxl)
);

wire [3:0] sprite_code = (((sprite_line >> (tx*4)) & 'h0F));
wire [9:0] buf_code = xflip ? (sprite_x_pos + (-8 * spr_x_render) - tx) + 7 :
                                (sprite_x_pos + (8 * spr_x_render) + tx);

wire [15:0] yclip = $signed(VRENDER) - sprite_y_pos;
wire [15:0] lines_down = yflip ? ((sprite_y_size+1)<<3) - yclip - 1 : yclip;
wire [15:0] tiles_across = spr_x_render<<5;
wire [15:0] tiles_down = lines_down[15:3] * ((sprite_x_size + 1) << 5);

wire [15:0] cur_row_lines_down = (lines_down & 7) << 2;
wire [15:0] tile_offs = tiles_down+cur_row_lines_down+tiles_across;

reg mc=0, yfl=0, xfl=0;
reg clr=0;
reg [8:0] clr_addr = 0;

reg [7:0] wr_spr_q;
reg [11:0] wr_spr_q_addr;
wire [11:0] rd_spr_q_addr = (priority_i*256) + sprite_queue_i;
reg spr_q_we;
wire [7:0] spr_q_out;


jtframe_dual_ram #(.dw(8), .aw(12)) u_sprite_pri_q(
    .clk0(CLK96),
    .clk1(CLK96),
    .data0  (wr_spr_q),
    .addr0  (wr_spr_q_addr),
    .we0    (spr_q_we),
    .q0     (),
    // Port 1: read
    .data1  (~8'h0),
    .addr1  (rd_spr_q_addr),
    .we1    (1'b0),
    .q1     (spr_q_out)
);

reg [15:0] pri_has_sprite = 16'd0;

integer i, c = 0;

always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        OBJ_PIXEL<=0;
    end else begin
        if(PIXEL_CEN && ACTIVE) begin
            OBJ_PIXEL<=preobj_pxl;
        end
    end
    
end
reg [255:0] spr_idx_queue = 256'd0;
reg spr_idx_queue_reset = 1;

reg [319:0] intra_obj_x = 320'd0;
always @(posedge CLK96, posedge RESET96) begin
    if(RESET96) begin
        st<=0;
        start<=1'b0;
        busy<=1'b0;
        priority_l=0;
        sprite_y_size_t<=0;
        sprite_y_pos_t<=0;
        spr<=0;
        sprite_queue_n<=0;
        sprite_queue_i<=0;
        sprite_queue_priority_n<={max_priority{8'h00}};
        priority_i<=0;
        spr_scan_i<=0;
        sprite_queue_priority_n_scan_buf_i<=0;
        mc=0; 
        yfl=0;
        xfl=0;
        clr<=1'b1;
        clr_addr<=0;
        spr_x_render <= 0;
        sprite_attributes <= 64'h0;
        palette <= 0;
        sprite_num <= 0;
        sprite_bank <= 0;
        sprite_x_size <= 0; 
        sprite_y_size <= 0;
        sprite_x_pos <= 0; 
        sprite_y_pos <= 0; 
        multiconnector_x <= 0; 
        multiconnector_y <= 0;
        xflip <= 0;
        yflip <= 0;
        sprite_line <= 0;
        tx <= 0;
        buf_data <= 0;
        buf_addr <= 0;
        buf_we <= 1'b0;
        start<=0; 
        busy<=1'b0;
        TILE_NUMBER<=0;
        TILE_NUMBER_OFFS<=0;
        TILE_BANK<=0;
        GFX_CS<=0;
        GP9001RAM_GCU_ADDR<=0;
        GP9001RAM2_GCU_ADDR<=0;
        pri_has_sprite <= 16'd0;
        spr_q_we<=1'b0;
        spr_idx_queue <= 256'd0;
        spr_idx_queue_reset <= 1'b1;
        intra_obj_x <= 320'd0;
    end else begin
        // $display("H:%d", H);
        last_HB    <= HB;
        last_VB    <= VB;
        c<=c+1;

        if( (pedg_HB && !VB)  || (((!FLIPX && VRENDER == 0) || (FLIPX && VRENDER == 239)) && pedg_HB)) begin
            start <= 1'b1;
            busy <= 1'b0;
        end

        if(VB && !last_VB) begin //reset the sprite idx queue in vb period once.
            spr_idx_queue<=256'd0;
            spr_idx_queue_reset<=1'b1;
        end

        if(start && !busy) begin
            // $display("%d", c);
            start<=1'b0;
            busy<=1'b1;
            spr<=0;
            st<=0;
            priority_l=0;
            sprite_y_size_t=0;
            sprite_y_pos_t=0;
            sprite_queue_n<=0;
            sprite_queue_i<=0;
            sprite_queue_priority_n<={max_priority{8'h00}};
            priority_i<=0;
            spr_scan_i<=0;
            multiconnector_x<=SPRITE_SCROLL_X&'h1FF;
            multiconnector_y<=SPRITE_SCROLL_Y&'h1FF;
            sprite_queue_priority_n_scan_buf_i<=0;
            clr<=1'b1;
            clr_addr<=0;
            mc=0; 
            yfl=0;
            xfl=0;
            spr_x_render <= 0;
            sprite_attributes <= 64'h0;
            palette <= 0;
            sprite_num <= 0;
            sprite_bank <= 0;
            sprite_x_size <= 0; 
            sprite_y_size <= 0;
            sprite_x_pos <= 0; 
            sprite_y_pos <= 0; 
            xflip <= 0;
            yflip <= 0;
            sprite_line <= 0;
            tx <= 0;
            buf_data <= 0;
            buf_addr <= 0;            
            buf_we <= 1'b0;
            TILE_NUMBER<=0;
            TILE_NUMBER_OFFS<=0;
            TILE_BANK<=0;
            GFX_CS<=0;
            GP9001RAM_GCU_ADDR<=0;
            GP9001RAM2_GCU_ADDR<=0;
            pri_has_sprite <= 16'd0;
            spr_q_we<=1'b0;
            intra_obj_x <= 320'd0;
        end else if(busy) begin
            st<=st+1;
            clr<=1'b1;

            //queueing phase
            case(st)
                0: begin //begin scanning the sprite position
                    if(spr<max_sprite) begin
                        if(!spr_idx_queue_reset && !spr_idx_queue[spr] && FAST_OBJ_QUEUE) begin //if the idx queue is initialized, and there's no sprite in this slot, skip over.
                            spr<=spr+1;
                            st<=st;
                        end else begin
                            GP9001RAM_GCU_ADDR<= sprite_addr_base;
                            GP9001RAM2_GCU_ADDR<= sprite_addr_base+3;
                        end
                    end else begin
                        if(spr_idx_queue_reset) spr_idx_queue_reset<=0; //queue is initialized completely on first line.

                        if(sprite_queue_n == 0) begin
                            busy<=0;
                            start<=1'b0;
                            spr_q_we<=1'b0;
                            // $display("%d", c);
                        end else begin
                            st<=4; //it found something, go to scanning
                            //setup the conditions for scanning
                            spr_q_we<=1'b0;
                            sprite_queue_priority_n_scan_buf_i<=0;
                            spr_scan_i<=0;
                            
                            priority_i<= pri_has_sprite[0] ? 0 :
                                         pri_has_sprite[1] ? 1 :
                                         pri_has_sprite[2] ? 2 :
                                         pri_has_sprite[3] ? 3 :
                                         pri_has_sprite[4] ? 4 :
                                         pri_has_sprite[5] ? 5 :
                                         pri_has_sprite[6] ? 6 :
                                         pri_has_sprite[7] ? 7 :
                                         pri_has_sprite[8] ? 8 :
                                         pri_has_sprite[9] ? 9 :
                                         pri_has_sprite[10] ? 10 :
                                         pri_has_sprite[11] ? 11 :
                                         pri_has_sprite[12] ? 12 :
                                         pri_has_sprite[13] ? 13 :
                                         pri_has_sprite[14] ? 14 :
                                         pri_has_sprite[15] ? 15 :
                                         16;
                        end
                    end
                end
                1: begin
                    spr_q_we<=1'b1;
                end
                2: begin //check if the sprite is active
                    if(GP9001RAM_GCU_DOUT[15]) begin //sprite is active
                        if(spr_idx_queue_reset) begin //fill spr idx queue on first line.
                            spr_idx_queue[spr]<=1;
                        end
                        mc=GP9001RAM_GCU_DOUT[14]; //is a multiconnected sprite
                        yfl= GP9001RAM_GCU_DOUT[13]; //is y-flipped
                        xfl= GP9001RAM_GCU_DOUT[12]; //is x-flipped
                        priority_l= GP9001RAM_GCU_DOUT[11:8]; //get the sprite priority

                        sprite_y_size_t = GP9001RAM2_GCU_DOUT[3:0];
                        sprite_y_pos_t = !mc ? 
                                            (GP9001RAM2_GCU_DOUT[15:7] + SPRITE_SCROLL_Y + SPRITE_SCROLL_YOFFS) & 'h1FF :
                                            (multiconnector_y + GP9001RAM2_GCU_DOUT[15:7]) & 'h1FF;
                        
                        if(yfl) sprite_y_pos_t=sprite_y_pos_t-((sprite_y_size_t+1) << 3) + 1;
                        
                        if(sprite_y_pos_t > 384 || (sprite_y_pos_t > 448 && yfl)) sprite_y_pos_t = sprite_y_pos_t - 'h200;
                        
                        if(sprite_y_pos_t < 0 && $signed(VRENDER) < $signed(sprite_y_pos_t + ((sprite_y_size_t+1) << 3))) begin 
                            sprite_y_size_t = (sprite_y_size_t+1) - (-sprite_y_pos_t>>3);
                            sprite_y_pos_t = 0;
                        end

                        if(VRENDER >= sprite_y_pos_t && VRENDER < (sprite_y_pos_t + ((sprite_y_size_t+1) << 3))) begin
                            $display("queue: %d, %d, %d, %h, %h, %h", VRENDER, sprite_y_size_t, sprite_y_pos_t, sprite_queue_priority_n[((priority_l+1)<<3)-1 -:8]+1, priority_l, spr[7:0]);
                            wr_spr_q <= spr[7:0];
                            wr_spr_q_addr<=((priority_l*256) + sprite_queue_priority_n[((priority_l+1)<<3)-1 -: 8]);
                            pri_has_sprite[priority_l]<=1'b1;

                            sprite_queue_priority_n[((priority_l+1)<<3)-1 -:8] <= sprite_queue_priority_n[((priority_l+1)<<3)-1 -: 8]+1;
                            sprite_queue_n<=sprite_queue_n+1;
                        end

                        st<=0;//go to next sprite
                        spr<=spr+1;
                    end else begin //the sprite is not active, go to next sprite
                        st<=0;
                        spr<=spr+1;
                    end
                end
            endcase

            //scanning phase
            case(st)
                4: begin
                    pri_has_sprite[priority_i]<=0;
                    if(sprite_queue_priority_n[((priority_i+1)<<3)-1 -: 8] > 0 && priority_i<max_priority) begin //if there are sprites in this priority level
                        intra_obj_x<={320{1'b0}};
                        // $display("scan: %d", priority_i);
                        sprite_queue_priority_n_scan_buf_i <= sprite_queue_priority_n[((priority_i+1)<<3)-1 -: 8];
                        st<=5;
                        //setup the conditions for rendering
                        sprite_queue_i<=sprite_queue_priority_n[((priority_i+1)<<3)-1 -: 8]-1;
                        tx<=0;
                        spr_x_render<=0;
                    end else begin //there are no sprites in this priority level
                        //there are no more priority levels to go, exit
                        busy<=0;
                        start<=1'b0;
                        st<=0;
                        // $display("%d", c);
                    end
                end
            endcase

            //rendering phase
            case(st)
                6: begin
                    if(sprite_queue_i < sprite_queue_priority_n_scan_buf_i) begin //if not all the sprites have been rendered from the queue
                        // $display("render: %d, %d, %d", VRENDER, priority_i, sprite_queue_priority_n_scan_buf_i);
                        spr<=spr_q_out;
                        spr_x_render<=0;
                        //it takes 2 clock cycles to get the first data
                    end else begin //if all the sprites have been rendered from this priority level
                        if(pri_has_sprite> 0) begin // and there are still more priority levels to go
                            st<=4; //go back to scanning
                            //setup conditions for scanning
                            sprite_queue_priority_n_scan_buf_i<=0;
                            spr_scan_i<=0;

                            priority_i<= pri_has_sprite[0] ? 0 :
                                         pri_has_sprite[1] ? 1 :
                                         pri_has_sprite[2] ? 2 :
                                         pri_has_sprite[3] ? 3 :
                                         pri_has_sprite[4] ? 4 :
                                         pri_has_sprite[5] ? 5 :
                                         pri_has_sprite[6] ? 6 :
                                         pri_has_sprite[7] ? 7 :
                                         pri_has_sprite[8] ? 8 :
                                         pri_has_sprite[9] ? 9 :
                                         pri_has_sprite[10] ? 10 :
                                         pri_has_sprite[11] ? 11 :
                                         pri_has_sprite[12] ? 12 :
                                         pri_has_sprite[13] ? 13 :
                                         pri_has_sprite[14] ? 14 :
                                         pri_has_sprite[15] ? 15 :
                                         16;
                        end else begin //if all is done, end
                            busy<=0;
                            start<=1'b0;
                            st<=0;
                            // $display("%d", c);
                        end
                    end
                end
                7: begin
                    GP9001RAM_GCU_ADDR<=sprite_addr_base;
                    GP9001RAM2_GCU_ADDR <= sprite_addr_base + 1;
                end
                8:  begin
                    GP9001RAM_GCU_ADDR<=sprite_addr_base + 2;
                    GP9001RAM2_GCU_ADDR <= sprite_addr_base + 3;
                end
                9: begin
                    sprite_attributes[63:48] <= GP9001RAM_GCU_DOUT; 
                    sprite_attributes[47:32] <= GP9001RAM2_GCU_DOUT;
                end
                10: begin 
                    sprite_attributes[31:16] <= GP9001RAM_GCU_DOUT;
                    sprite_attributes[15:0] <= GP9001RAM2_GCU_DOUT;
                end
                11: begin
                    // $display("attrib: %d:%h, cur_pri: %d", sprite_attributes[59:56],sprite_attributes, priority_i);
                    xflip<=sprite_attributes[60];
                    yflip<=sprite_attributes[61];
                    palette<=(sprite_attributes[55:50]<<4);
                    sprite_num<=(sprite_attributes[47:32] & 'h7FFF);
                    sprite_bank<=sprite_attributes[49:47];
                    sprite_x_size<=sprite_attributes[19:16];
                    sprite_y_size<=sprite_attributes[3:0];
                    
                    if(sprite_attributes[62]) begin //is a multiconnected sprite
                        sprite_x_pos <= (multiconnector_x + sprite_attributes[31:23]) & 'h1ff;
                        sprite_y_pos <= (multiconnector_y + GP9001RAM2_GCU_DOUT[15:7]) & 'h1ff;
                    end else begin
                        sprite_x_pos<=(sprite_attributes[31:23]+SPRITE_SCROLL_X+SPRITE_SCROLL_XOFFS) & 'h01FF;
                        sprite_y_pos<=(GP9001RAM2_GCU_DOUT[15:7]+SPRITE_SCROLL_Y+SPRITE_SCROLL_YOFFS) & 'h01FF;
                    end   
                end
                12: begin
                    $display("xpos: %d %d %d %d %d", sprite_x_pos, SPRITE_SCROLL_X, SPRITE_SCROLL_XOFFS, (sprite_attributes[31:23]+SPRITE_SCROLL_X+SPRITE_SCROLL_XOFFS) & 'h01FF, sprite_x_size);
                    // $display("ypos: %d %d %d %d %d", sprite_attributes[15:7], SPRITE_SCROLL_Y, SPRITE_SCROLL_YOFFS, (sprite_attributes[15:7]+SPRITE_SCROLL_Y+SPRITE_SCROLL_YOFFS) & 'h01FF, sprite_y_size);
                    
                    //process flips on x and y axis for sprite
                    multiconnector_x<=sprite_x_pos;
                    multiconnector_y<=sprite_y_pos;

                    sprite_y_pos_t=sprite_y_pos;
                    sprite_y_size_t=sprite_y_size;

                    if(xflip) begin
                        if($signed(sprite_x_pos-7) > 448) begin
                            sprite_x_pos <= $signed(sprite_x_pos - 'h200 - 'd7);
                        end
                        else begin
                            sprite_x_pos<=$signed(sprite_x_pos-7);
                        end
                    end else begin

                        if($signed(sprite_x_pos) > 384) begin
                            sprite_x_pos <= $signed(sprite_x_pos - 'h200);
                        end
                    end

                    if(yflip) begin
                        if($signed(sprite_y_pos-((sprite_y_size + 1) << 3) + 1) > 384) begin
                             sprite_y_pos_t = $signed(sprite_y_pos - 'h200);
                        end
                        else begin
                            sprite_y_pos_t=$signed(sprite_y_pos - ((sprite_y_size + 1) << 3));
                        end
                        sprite_y_pos_t = sprite_y_pos_t+1;
                    end else begin
                        if(sprite_y_pos > 384) sprite_y_pos_t = $signed(sprite_y_pos - 'h200);
                    end

                    sprite_y_pos<=sprite_y_pos_t;
                    sprite_y_size<=sprite_y_size_t;

                    //setup conditions for drawing
                    spr_x_render<=0;
                    if(xflip) tx<=7;
                    else tx<=0;

                    st<=15;
                end

                15: begin //finally draw the sprite
                    if(spr_x_render < (sprite_x_size + 1)) begin //if not all the tiles in the sprite have been drawn
                        if(sprite_num <= max_sprite_num) begin //and the sprite is within the active area
                            GFX_CS<=1'b1;
                            TILE_NUMBER<=sprite_num;
                            TILE_NUMBER_OFFS<=tile_offs;
                            TILE_BANK<=sprite_bank;
                        end else begin //the sprite is out of bounds, don't render it and skip to the next sprite.
                            // $display("sprite out of bounds: %d", sprite_x_pos);
                            st<=5;
                            tx<=0;
                            GFX_CS<=1'b0;
                            spr_x_render<=0;
                            buf_we<=1'b0;
                            sprite_queue_i<=sprite_queue_i-1;
                        end
                    end else begin //all the tiles in the sprite have been drawn, go to the next sprite in the queue
                        // $display("all tiles drawn, next sprite");
                        st<=5;
                        tx<=0;
                        GFX_CS<=1'b0;
                        spr_x_render<=0;
                        buf_we<=1'b0;
                        sprite_queue_i<=sprite_queue_i-1;
                    end
                end
                16: st<=17; //wait state
                17: begin //pull the tile slice for a tile in the sprite
                    if(spr_x_render == (sprite_x_size + 1)) begin
                        st<=5;
                        tx<=0;
                        GFX_CS<=1'b0;
                        spr_x_render<=0;
                        buf_we<=1'b0;
                        sprite_queue_i<=sprite_queue_i-1;
                    end else begin
                        if(GFX_OK) begin
                            GFX_CS<=1'b0;
                            TILE_NUMBER<=0;
                            TILE_NUMBER_OFFS<=0;
                            TILE_BANK<=0;
                            sprite_line<=GFX_DATA;
                            $display("%d, %d, %d, %h, %h %h", VRENDER, sprite_x_pos, sprite_x_size, TILE_NUMBER, TILE_NUMBER_OFFS, GFX_DATA);
                            // $display("%d %d %d", tiles_across, tiles_down, cur_row_lines_down);
                            st<=18;
                            buf_we<=1'b1;
                            if(xflip) tx<=7;
                            else tx<= 0;
                            drawn_pixels = 8'h0;
                        end else begin //the sprite was not ready yet from sdram.
                            st<=st;
                        end
                    end
                end
                18: begin
                    if(spr_x_render + 1 < (sprite_x_size + 1)) begin //pre-emptive
                        GFX_CS<=1'b1;
                        TILE_NUMBER<=sprite_num;
                        TILE_NUMBER_OFFS<=tile_offs+32;
                        TILE_BANK<=sprite_bank;
                    end
                    st<=22;
                end
                22: begin //draw the slice, every slice is 8 pixels
                    if(xflip) tx<=tx-1;
                    else tx<= tx+1;

                    // tx <= (xflip ? tx - 1 : tx + 1);
                    
                    if( sprite_code > 0 && buf_code>=0 && buf_code<320) begin //if the sprite is not blank
                        if(intra_obj_x[(FLIPX ? 319-buf_code : buf_code)&'h1FF] == 0) begin
                            drawn_pixels[tx] = 1'b1;
                            intra_obj_x[(FLIPX ? 319-buf_code : buf_code)&'h1FF] <= 1;
                            buf_addr<=(FLIPX ? 319-buf_code : buf_code)&'h1FF;
                            buf_data<=((SHIFT_SPRITE_PRI ? sprite_attributes[59:56] + 1 : sprite_attributes[59:56]) << 11) + (palette&'h7F0)+sprite_code;
                        end
                    end else begin //it is a blank sprite
                        //do nothing, because other layers of sprites might be on top.
                    end
                    
                    if(xflip ? tx == 0 : tx == 7) st<=30;
                    else st<=st;
                end
                30: begin //go to next slice
                    drawn_pixels = 8'h0;
                    buf_we<=1'b0;
                    if(xflip) tx<=7;
                    else tx<=0;
                    spr_x_render<=spr_x_render+1;
                    st<=17;
                end
            endcase
        end else begin
            // busy<=1'b0;
        end
    end
end

endmodule