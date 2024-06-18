// This program was cloned from: https://github.com/mattvenn/tt07-vga-clock
// License: Apache License 2.0

`default_nettype none
module vga_clock (
    input wire clk, 
    input wire reset_n,
    input wire adj_hrs,
    input wire adj_min,
    input wire adj_sec,
    output wire hsync,
    output wire vsync,
    output wire [5:0] rrggbb
    );

    wire reset = !reset_n;

    reg [3:0] sec_u;
    reg [2:0] sec_d;
    reg [3:0] min_u;
    reg [2:0] min_d;
    reg [3:0] hrs_u;
    reg [1:0] hrs_d;
    reg [25:0] sec_counter;

    always @(posedge px_clk) begin
        if(reset) begin
            sec_u <= 0;
            sec_d <= 0;
            min_u <= 0;
            min_d <= 0;
            hrs_u <= 0;
            hrs_d <= 0;
            sec_counter <= 0;
            color_offset <= 0;
        end else begin
            if(sec_u == 10) begin
                sec_u <= 0;
                sec_d <= sec_d + 1;
            end
            if(sec_d == 6) begin
                sec_d <= 0;
                min_u <= min_u + 1;
                color_offset <= color_offset + 1;
            end
            if(min_u == 10) begin
                min_u <= 0;
                min_d <= min_d + 1;
            end
            if(min_d == 6) begin
                min_d <= 0;
                hrs_u <= hrs_u + 1;
            end
            if(hrs_u == 10) begin
                hrs_u <= 0;
                hrs_d <= hrs_d + 1;
            end
            if(hrs_d == 2 && hrs_u == 4) begin
                hrs_u <= 0;
                hrs_d <= 0;
            end

            // second counter
            sec_counter <= sec_counter + 1;
            if(sec_counter + 1 == 31_500_000) begin
                sec_u <= sec_u + 1;
                sec_counter <= 0;
            end

            // adjustment buttons
            if(adj_sec_pulse)
                sec_u <= sec_u + 1;
            if(adj_min_pulse) begin
                min_u <= min_u + 1;
                color_offset <= color_offset + 1;
            end
            if(adj_hrs_pulse)
                hrs_u <= hrs_u + 1;
        end
    end

    wire adj_sec_pulse, adj_min_pulse, adj_hrs_pulse;

    // want button_clk_en to be about 10ms
    // frame rate is 70hz is 15ms
    wire but_clk_en = y_px == 0 && x_px == 0;

    localparam MAX_BUT_RATE = 16;
    localparam DEC_COUNT = 1;
    localparam MIN_COUNT = 2;
    button_pulse #(.MIN_COUNT(MIN_COUNT), .DEC_COUNT(DEC_COUNT), .MAX_COUNT(MAX_BUT_RATE)) 
        pulse_sec (.clk(px_clk), .clk_en(but_clk_en), .button(adj_sec), .pulse(adj_sec_pulse), .reset(reset));
    button_pulse #(.MIN_COUNT(MIN_COUNT), .DEC_COUNT(DEC_COUNT), .MAX_COUNT(MAX_BUT_RATE)) 
        pulse_min (.clk(px_clk), .clk_en(but_clk_en), .button(adj_min), .pulse(adj_min_pulse), .reset(reset));
    button_pulse #(.MIN_COUNT(MIN_COUNT), .DEC_COUNT(DEC_COUNT), .MAX_COUNT(MAX_BUT_RATE)) 
        pulse_hrs (.clk(px_clk), .clk_en(but_clk_en), .button(adj_hrs), .pulse(adj_hrs_pulse), .reset(reset));

    // these are in blocks
    localparam OFFSET_Y_BLK = 0;
    localparam OFFSET_X_BLK = 1;
    localparam NUM_CHARS = 8;
    localparam FONT_W = 4;
    localparam FONT_H = 5;
    localparam COLON = 10;
    localparam BLANK = 11;
    localparam COL_INDEX_W = $clog2(FONT_W);

    wire [9:0] x_px;          // X position for actual pixel.
    wire [9:0] y_px;          // Y position for actual pixel.

    // blocks are 16 x 16 px. total width = 8 * blocks of 4 =  512. 
    /* verilator lint_off WIDTH */
    wire [5:0] x_block = (x_px -64) >> 4;
    wire [5:0] y_block = (y_px -200) >> 4;
    /* verilator lint_on WIDTH */
    reg [5:0] x_block_q;
    reg [5:0] y_block_q;
   // reg [5:0] x_block = 0;
   // reg [5:0] y_block = 0; 

    wire activevideo;
    wire px_clk;
    assign px_clk = clk;
    VgaSyncGen vga_0 (.px_clk(px_clk), .hsync(hsync), .vsync(vsync), .x_px(x_px), .y_px(y_px), .activevideo(activevideo), .reset(reset));

    wire [FONT_W-1:0] font_out;
    wire [5:0] font_addr;
    fontROM #(.data_width(FONT_W)) font_0 (.clk(px_clk), .addr(font_addr), .dout(font_out));
    wire [5:0] digit_index;
    wire [5:0] color;
    reg [3:0] color_offset;
    wire [3:0] number;
    wire [COL_INDEX_W-1:0] col_index;
    reg [COL_INDEX_W-1:0] col_index_q;

    initial begin
        $display(FONT_W);
        $display(COL_INDEX_W);
    end

    digit #(.FONT_W(FONT_W), .FONT_H(FONT_H), .NUM_BLOCKS(NUM_CHARS*FONT_W)) digit_0 (.clk(px_clk), .x_block(x_block), .number(number), .digit_index(digit_index), .col_index(col_index), .color(color), .color_offset(color_offset));

    /* verilator lint_off WIDTH */
    assign number     = x_block < FONT_W * 1 ? hrs_d :
                        x_block < FONT_W * 2 ? hrs_u :
                        x_block < FONT_W * 3 ? COLON :
                        x_block < FONT_W * 4 ? min_d :
                        x_block < FONT_W * 5 ? min_u :
                        x_block < FONT_W * 6 ? COLON :
                        x_block < FONT_W * 7 ? sec_d :
                        x_block < FONT_W * 8 ? sec_u :
                        BLANK;
    /* verilator lint_on WIDTH */
   
    assign rrggbb = activevideo && draw ? color : 6'b0;
    assign font_addr = digit_index + y_block;
    reg draw;
    always @(posedge px_clk) begin
        if(reset) 
            draw <= 0;
        x_block_q <= x_block;
        y_block_q <= y_block;
        col_index_q <= col_index;
        if(x_block_q < FONT_W * NUM_CHARS && y_block_q < FONT_H)
            draw <= font_out[(FONT_W - 1) - col_index_q];
        else
            draw <= 0;
    
    end
endmodule
`default_nettype wire
