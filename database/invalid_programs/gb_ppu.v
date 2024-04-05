module ppu(
    clock25mhz, clockgb, hard_resetn, resetn, vblank_int, lcdc_int,
    address, indata, outdata, load, store,
    
	//////////// HDMI-TX //////////
	HDMI_TX_CLK,
	HDMI_TX_D,
	HDMI_TX_DE,
	HDMI_TX_HS,
	HDMI_TX_INT,
	HDMI_TX_VS,
    dmode
);

parameter WIDTH = 160;
parameter HEIGHT = 144;
parameter LINES = 154;

parameter MODE2_COUNT = 80;
parameter MODE3_COUNT = 171;
parameter MODE0_COUNT = 205;
parameter MODE1_COUNT = 4560;

parameter SPRITE_COUNT = 40;


input clock25mhz;
input clockgb;
input hard_resetn;
input resetn;
output reg vblank_int;
output reg lcdc_int;

input [15:0] address;
input [7:0] indata;
output [7:0] outdata;
input load;
input store;

output HDMI_TX_CLK;
output [23:0] HDMI_TX_D;
output HDMI_TX_DE;
output HDMI_TX_HS;
output HDMI_TX_VS;
input HDMI_TX_INT;

output [7:0] dmode = ppu_mode;


wire [7:0] x;
wire [7:0] y;
wire [7:0] r;
wire [7:0] g;
wire [7:0] b;
  
hdmi #(4) display(
    clock25mhz, hard_resetn,
    x, y,
    r, g, b,
    
	//////////// HDMI-TX //////////
	HDMI_TX_CLK,
	HDMI_TX_D,
	HDMI_TX_DE,
	HDMI_TX_HS,
	HDMI_TX_INT,
	HDMI_TX_VS
);


wire [5:0] p_id;
wire [15:0] p_color = gbm_color[1];

vram vram(
	ppu_id,
	{y, x},
	clock25mhz,
	{ppu_y[3], ppu_x[3]},
	clockgb,
	ppu_y[3] < HEIGHT && lcdc[7],
	p_id
);


reg [7:0] gbm_palette [3];
reg [15:0] gbm_color [2];
wire [1:0] gbm_shade = gbm_palette[p_id[5:2]][2*p_id[1:0] +: 2];

always @(posedge clock25mhz) begin
    case (gbm_shade)
    0: gbm_color[0] <= 16'h67fd;
    1: gbm_color[0] <= 16'h4b55;
    2: gbm_color[0] <= 16'h3a2a;
    3: gbm_color[0] <= 16'h1ca2;
    endcase
    
    gbm_color[1] <= gbm_color[0];
end


assign r = {p_color[4:0], 2'h0};
assign g = {p_color[9:5], 2'h0};
assign b = {p_color[14:10], 2'h0};




reg [7:0] sprites [SPRITE_COUNT] [4];

reg [7:0] sprite_tile [SPRITE_COUNT];
reg [2:0] sprite_x [SPRITE_COUNT] [3];
reg [3:0] sprite_y [SPRITE_COUNT] [3];
reg [3:0] sprite_pal [SPRITE_COUNT] [3];
reg sprite_pri [SPRITE_COUNT] [3];
reg sprite_val [SPRITE_COUNT] [3];

reg [5:0] sprite_id [SPRITE_COUNT];

always @(*) begin
    integer i;
    for (i=0; i < SPRITE_COUNT; i=i+1) begin
        sprite_id[i] = {sprite_pal[i][2], sprite_pid[i]};
    end
end

always @(posedge clockgb) begin
    integer i;
    for (i=0; i < SPRITE_COUNT; i=i+1) begin
        sprite_x[i][1] <= sprite_x[i][0];
        sprite_y[i][1] <= sprite_y[i][0];
        sprite_pal[i][1] <= sprite_pal[i][0];
        sprite_pri[i][1] <= sprite_pri[i][0];
        sprite_val[i][1] <= sprite_val[i][0];
        sprite_x[i][2] <= sprite_x[i][1];
        sprite_y[i][2] <= sprite_y[i][1];
        sprite_pal[i][2] <= sprite_pal[i][1];
        sprite_pri[i][2] <= sprite_pri[i][1];
        sprite_val[i][2] <= sprite_val[i][1];
    
        sprite_val[i][0] <= 0;
        
        if (ppu_x[0]+8'd8 >= sprites[i][1] && ppu_x[0]+8'd8 < sprites[i][1]+8'h8 &&
            ppu_y[0]+8'd16 >= sprites[i][0] && (ppu_y[0]+8'd16 < sprites[i][0]+8'h8 || 
                                                lcdc[2] && ppu_y[0]+8'd16 < sprites[i][0]+8'd16)) begin
            
            sprite_tile[i] <= sprites[i][2];
            
            if (!sprites[i][3][5]) begin
                sprite_x[i][0] <= ppu_x[0][2:0] - sprites[i][1][2:0];
            end else begin
                sprite_x[i][0] <= 3'd7-(ppu_x[0][2:0] - sprites[i][1][2:0]);
            end
            
            if (!sprites[i][3][6]) begin
                sprite_y[i][0] <= ppu_y[0][3:0] - sprites[i][0][3:0];
            end else if (lcdc[2]) begin
                sprite_y[i][0] <= 4'd15-(ppu_y[0][3:0] - sprites[i][0][3:0]);
            end else begin
                sprite_y[i][0] <= 4'd7-(ppu_y[0][3:0] - sprites[i][0][3:0]);
            end
            
            sprite_pal[i][0] <= sprites[i][3][4] ? 2'b10 : 2'b01;
            sprite_pri[i][0] <= sprites[i][3][7];
            sprite_val[i][0] <= 1'b1;
        end else begin
            sprite_val[i][0] <= 1'b0;
        end
    end
end


wire [7:0] bg_xpre = ppu_x[0] + scrollx;
wire [7:0] bg_ypre = ppu_y[0] + scrolly;
reg [2:0] bg_x [3];
reg [2:0] bg_y [3];
reg [3:0] bg_pal [3];
wire [7:0] bg_tile;
wire [5:0] bg_id = {bg_pal[2], bg_pid};

always @(posedge clockgb) begin
    bg_x[0] <= bg_xpre[2:0];
    bg_y[0] <= bg_ypre[2:0];
    bg_pal[0] <= 0;
    bg_x[1] <= bg_x[0];
    bg_y[1] <= bg_y[0];
    bg_pal[1] <= bg_pal[0];
    bg_x[2] <= bg_x[1];
    bg_y[2] <= bg_y[1];
    bg_pal[2] <= bg_pal[1];
end


wire [7:0] w_xpre = ppu_x[0] - (wx-8'd7);
wire [7:0] w_ypre = ppu_y[0] - wy;
reg [2:0] w_x [3];
reg [2:0] w_y [3];
reg [3:0] w_pal [3];
reg w_val [3];
wire [7:0] w_tile;
wire [5:0] w_id = {w_pal[2], w_pid};

always @(posedge clockgb) begin
    w_x[0] <= w_xpre[2:0];
    w_y[0] <= w_ypre[2:0];
    w_pal[0] <= 0;
    w_val[0] <= (ppu_x[0]+8'd7 >= wx && ppu_y[0] >= wy);
    w_x[1] <= w_x[0];
    w_y[1] <= w_y[0];
    w_pal[1] <= w_pal[0];
    w_val[1] <= w_val[0];
    w_x[2] <= w_x[1];
    w_y[2] <= w_y[1];
    w_pal[2] <= w_pal[1];
    w_val[2] <= w_val[1];
end


reg [10:0] bg_address;
reg [10:0] w_address;

always @(*) begin
    if (bgram_store || bgram_load) begin
        bg_address = bgram_address[10:0];
        w_address = bgram_address[10:0];
    end else begin
        bg_address = {bg_ypre[7:3], bg_xpre[7:3]};
        w_address = {w_ypre[7:3], w_xpre[7:3]};
    
        if (lcdc[3]) begin
            bg_address = bg_address + 11'h400;
        end
        
        if (lcdc[6]) begin
            w_address = w_address + 11'h400;
        end
    end
end

always @(posedge clockgb) begin
    bgram_outdata <= bg_tile;
end

bgram bgram(
	bg_address,	w_address,
	clockgb,
	bgram_indata,,
	bgram_store, 1'b0,
	bg_tile, w_tile
);

wire [15:0] bgram_address;
wire [7:0] bgram_indata;
reg  [7:0] bgram_outdata;
wire [7:0] bgram_data;
wire bgram_load;
wire bgram_store;

mmap #(16'h9800, 16'hbfff) bg_mmap(
    clockgb, resetn,
    address, indata, bgram_data, load, store,
    bgram_address, bgram_indata, bgram_outdata, bgram_load, bgram_store
);


reg [11:0] sprite_tile_offset [SPRITE_COUNT];
reg [11:0] bg_tile_offset;
reg [11:0] w_tile_offset;

always @(*) begin
    integer i;
    
    if (tile_store || tile_load) begin
        for (i=0; i < SPRITE_COUNT; i=i+1) begin
            sprite_tile_offset[i] = tile_address[12:1];
        end
        
        bg_tile_offset = tile_address[12:1];
        w_tile_offset = tile_address[12:1];
    end else begin
        for (i=0; i < SPRITE_COUNT; i=i+1) begin
            if (lcdc[2]) begin
                sprite_tile_offset[i] = {1'b0, sprite_tile[i][7:1], sprite_y[i][0][3:0]};
            end else begin
                sprite_tile_offset[i] = {1'b0, sprite_tile[i][7:0], sprite_y[i][0][2:0]};
            end
        end
        
        bg_tile_offset = {1'b0, bg_tile, bg_y[0]};
        w_tile_offset = {1'b0, w_tile, w_y[0]};
        
        if (!lcdc[4]) begin
            if (bg_tile_offset < 12'h400) begin
                bg_tile_offset = bg_tile_offset + 12'h800;
            end
            if (w_tile_offset < 12'h400) begin
                w_tile_offset = w_tile_offset + 12'h800;
            end
        end
    end
end

wire [7:0] sprite_hi [SPRITE_COUNT];
wire [7:0] sprite_lo [SPRITE_COUNT];
reg [1:0] sprite_pid [SPRITE_COUNT];
wire [7:0] bg_hi;
wire [7:0] bg_lo;
reg [1:0] bg_pid;
wire [7:0] w_hi;
wire [7:0] w_lo;
reg [1:0] w_pid;

always @(*) begin  
    integer i;
    for (i=0; i < SPRITE_COUNT; i=i+1) begin
        sprite_pid[i] = {sprite_hi[i][3'd7-sprite_x[i][2]], sprite_lo[i][3'd7-sprite_x[i][2]]};
    end
    bg_pid = {bg_hi[3'd7-bg_x[2]], bg_lo[3'd7-bg_x[2]]};
    w_pid = {w_hi[3'd7-w_x[2]], w_lo[3'd7-w_x[2]]};
end

generate
genvar i;
    for (i=0; i < SPRITE_COUNT; i=i+1) begin : SPRITE_TILE_LOOP
        tram sprite_tram(
            sprite_tile_offset[i],
            tile_bytes,
            clockgb,
            {tile_indata, tile_indata},
            tile_store,
            {sprite_hi[i], sprite_lo[i]}
        );
    end
endgenerate
    
tram bg_tram(
    bg_tile_offset,
    tile_bytes,
    clockgb,
    {tile_indata, tile_indata},
    tile_store,
    {bg_hi, bg_lo}
);
    
tram w_tram(
    w_tile_offset,
    tile_bytes,
    clockgb,
    {tile_indata, tile_indata},
    tile_store,
    {w_hi, w_lo}
);

wire [15:0] tile_address;
reg [15:0] tile_postaddress [2];
wire [1:0] tile_bytes = tile_address[0] ? 2'b10 : 2'b01;
wire [7:0] tile_indata;
wire [7:0] tile_outdata = tile_postaddress[1][0] ? bg_hi : bg_lo;
wire [7:0] tile_data;
wire tile_load;
wire tile_store;
reg tile_part;

always @(posedge clockgb) begin
    tile_postaddress[0] <= tile_address;
    tile_postaddress[1] <= tile_postaddress[0];
end

mmap #(16'h8000, 16'h97ff) tile_mmap(
    clockgb, resetn,
    address, indata, tile_data, load, store,
    tile_address, tile_indata, tile_outdata, tile_load, tile_store
);


reg [5:0] ppu_id;
reg [5:0] topsprite_id;
reg topsprite_val;
reg topsprite_pri;

always @(*) begin
    integer i;

    topsprite_id = 0;
    topsprite_val = 0;
    topsprite_pri = 0;
    
    for (i=SPRITE_COUNT-1; i >= 0; i=i-1) begin
        if (sprite_val[i][2] && sprite_id[i][1:0] != 0) begin
            topsprite_id = sprite_id[i];
            topsprite_pri = sprite_pri[i][2];
            topsprite_val = 1'b1;
        end
    end
    
    if (topsprite_pri && lcdc[0] && lcdc[5] && w_val[2] && w_id[1:0] != 0) begin
        ppu_id = w_id;
    end else if (topsprite_pri && lcdc[0] && bg_id[1:0] != 0) begin
        ppu_id = bg_id;
    end else if (lcdc[1] && topsprite_val && topsprite_id[1:0] != 0) begin
        ppu_id = topsprite_id;
    end else if (lcdc[0] && lcdc[5] && w_val[2]) begin
        ppu_id = w_id;
    end else if (lcdc[0]) begin
        ppu_id = bg_id;
    end else begin
        ppu_id = 0;
    end
end
    


reg [7:0] ppu_x [4];
reg [7:0] ppu_y [4];

reg [1:0] ppu_state;
reg [15:0] ppu_count;
wire [1:0] ppu_mode = (ppu_y[0] < HEIGHT) ? ppu_state : 2'h1;

wire vblank = ppu_y[0] == HEIGHT;
wire coin = ppu_y[0] == lyc;

reg [7:0] lcdc;
reg [7:0] stat;
reg [7:0] scrolly;
reg [7:0] scrollx;
reg [7:0] lyc;
reg [7:0] wy;
reg [7:0] wx;

always @(posedge clockgb or negedge resetn) begin
    integer i;

    if (!resetn) begin
        ppu_state <= 2'h2;
        ppu_count <= 0;
        
        for (i=0; i < 4; i=i+1) begin
            ppu_x[i] <= 0;
            ppu_y[i] <= 0;
        end
        
        gbm_palette[0] <= 8'hfc;
        gbm_palette[1] <= 8'hff;
        gbm_palette[2] <= 8'hff;
        lcdc <= 8'h91;
        stat <= 0;
        scrolly <= 0;
        scrollx <= 0;
        wy <= 0;
        wx <= 0;
        lyc <= 0;
        vblank_int <= 0;
        lcdc_int <= 0;
    end else begin
        ppu_x[1] <= ppu_x[0];
        ppu_y[1] <= ppu_y[0];
        ppu_x[2] <= ppu_x[1];
        ppu_y[2] <= ppu_y[1];
        ppu_x[3] <= ppu_x[2];
        ppu_y[3] <= ppu_y[2];
        vblank_int <= 0;
        lcdc_int <= 0;
    
        if (!lcdc[7]) begin
            ppu_state <= 2'h2;
            ppu_count <= 0;
            ppu_y[0] <= 0;
            ppu_x[0] <= 0;
        end else case (ppu_state)
            2'h2: begin            
                if (ppu_count+1'b1 == MODE2_COUNT) begin
                    ppu_state <= 2'h3;
                    ppu_count <= 0;
                    ppu_x[0] <= 0;
                end else begin
                    ppu_count <= ppu_count + 1'b1;
                end 
            end
            2'h3: begin
                if (ppu_x[0]+1'b1 != WIDTH) begin
                    ppu_x[0] <= ppu_x[0] + 1'b1;
                end
            
                if (ppu_count+1'b1 == MODE3_COUNT) begin
                    if (stat[3]) lcdc_int <= 1'b1;
                    ppu_state <= 2'h0;
                    ppu_count <= 0;
                end else begin
                    ppu_count <= ppu_count + 1'b1;
                end 
            end
            2'h0: begin
                if (ppu_count+1'b1 == MODE0_COUNT) begin
                    if (ppu_y[0]+1'b1 != LINES) begin
                        ppu_y[0] <= ppu_y[0] + 1'b1;
                    end else begin
                        ppu_y[0] <= 0;
                    end
                    
                    if (stat[5]) lcdc_int <= 1'b1;
                    ppu_state <= 2'h2;
                    ppu_count <= 0;
                end else begin
                    if (ppu_count == 0) begin
                        if (vblank) vblank_int <= 1'b1;
                        if (stat[6] && coin) lcdc_int <= 1'b1;
                        if (stat[4] && vblank) lcdc_int <= 1'b1;
                    end
                
                    ppu_count <= ppu_count + 1'b1;
                end
            end
        endcase
        
        if (sprite_store) begin
            sprites[sprite_address[15:2]][sprite_address[1:0]] <= sprite_indata;
        end
        if (gbm_store) begin
            gbm_palette[gbm_address] <= gbm_indata;
        end
        if (lcdc_store) begin
            lcdc <= lcdc_indata;
        end
        if (stat_store) begin
            stat <= stat_indata;
        end
        if (scrolly_store) begin
            scrolly <= scrolly_indata;
        end
        if (scrollx_store) begin
            scrollx <= scrollx_indata;
        end
        if (ly_store) begin
            ppu_y[0] <= ly_indata;
        end
        if (lyc_store) begin
            lyc <= lyc_indata;
        end
        if (wy_store) begin
            wy <= wy_indata;
        end
        if (wx_store) begin
            wx <= wx_indata;
        end
    end
end


wire [15:0] sprite_address;
wire [7:0] sprite_indata;
wire [7:0] sprite_outdata = sprites[sprite_address[15:2]][sprite_address[1:0]];
wire [7:0] sprite_data;
wire sprite_store;

rrmmap #(16'hfe00, 16'hfe9f) sprite_mmap(
    clockgb, resetn,
    address, indata, sprite_data, load, store,
    sprite_address, sprite_indata, sprite_outdata,, sprite_store
);

wire [15:0] gbm_address;
wire [7:0] gbm_indata;
wire [7:0] gbm_outdata = gbm_palette[gbm_address];
wire [7:0] gbm_data;
wire gbm_store;

rrmmap #(16'hff47, 16'hff49) gbm_mmap(
    clockgb, resetn,
    address, indata, gbm_data, load, store,
    gbm_address, gbm_indata, gbm_outdata,, gbm_store
);


wire [7:0] lcdc_indata;
wire [7:0] lcdc_data;
wire lcdc_store;

rrmmap #(16'hff40) lcdc_mmap(
    clockgb, resetn,
    address, indata, lcdc_data, load, store,,
    lcdc_indata, lcdc,, lcdc_store
);

wire [7:0] stat_indata;
wire [7:0] stat_data;
wire stat_store;

rrmmap #(16'hff41) stat_mmap(
    clockgb, resetn,
    address, indata, stat_data, load, store,,
    stat_indata, {stat[7:3], coin, ppu_mode},, stat_store
);

wire [7:0] scrolly_indata;
wire [7:0] scrolly_data;
wire scrolly_store;

rrmmap #(16'hff42) scrolly_mmap(
    clockgb, resetn,
    address, indata, scrolly_data, load, store,, 
    scrolly_indata, scrolly,, scrolly_store
);

wire [7:0] scrollx_indata;
wire [7:0] scrollx_data;
wire scrollx_store;

rrmmap #(16'hff43) scrollx_mmap(
    clockgb, resetn,
    address, indata, scrollx_data, load, store,,
    scrollx_indata, scrollx,, scrollx_store
);

wire [7:0] ly_indata;
wire [7:0] ly_data;
wire ly_store;

rrmmap #(16'hff44) ly_mmap(
    clockgb, resetn,
    address, indata, ly_data, load, store,,
    ly_indata, ppu_y[0],, ly_store
);

wire [7:0] lyc_indata;
wire [7:0] lyc_data;
wire lyc_store;

rrmmap #(16'hff45) lyc_mmap(
    clockgb, resetn,
    address, indata, lyc_data, load, store,,
    lyc_indata, lyc,, lyc_store
);

wire [7:0] wy_indata;
wire [7:0] wy_data;
wire wy_store;

rrmmap #(16'hff4a) wy_mmap(
    clockgb, resetn,
    address, indata, wy_data, load, store,, 
    wy_indata, wy,, wy_store
);

wire [7:0] wx_indata;
wire [7:0] wx_data;
wire wx_store;

rrmmap #(16'hff4b) wx_mmap(
    clockgb, resetn,
    address, indata, wx_data, load, store,,
    wx_indata, wx,, wx_store
);


assign outdata = bgram_data | tile_data | sprite_data | gbm_data |
                 lcdc_data | stat_data | scrolly_data | scrollx_data |
                 ly_data | lyc_data | wy_data | wx_data;

endmodule
