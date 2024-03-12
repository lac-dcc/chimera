
module char_gen(
    input wire          vo_clk,
    input wire          vo_reset_,

    input wire          in_vsync,
    input wire          in_req,
    input wire          in_eol,
    input wire          in_eof,
    input wire [23:0]   in_pixel,

    output reg          out_vsync,
    output reg          out_req,
    output reg          out_eol,
    output reg          out_eof,
    output reg [23:0]   out_pixel,

    input wire          cpu_clk,
    input wire          cpu_reset_,

    input wire          sbuf_wr,
    input wire          sbuf_rd,
    input wire [11:0]   sbuf_addr,
    input wire [7:0]    sbuf_wdata,
    output reg [7:0]    sbuf_rdata
    );

    localparam screen_buf_width  = 128;
    localparam screen_buf_height = 25;

    wire [11:0] h_cntr;
    wire [10:0] v_cntr;

    vid_cntr u_vid_cntr(
        .clk(vo_clk),
        .reset_(vo_reset_),
        .in_vsync(in_vsync),
        .in_req(in_req),
        .in_eol(in_eol),
        .in_eof(in_eof),
        .h_cntr(h_cntr),
        .v_cntr(v_cntr)
    );

    reg [7:0] screen_buffer[0:screen_buf_width*screen_buf_height-1];

    initial begin
        $readmemh("screen_buffer.hex", screen_buffer);
    end

    always @(posedge cpu_clk) begin
        if (sbuf_wr)  screen_buffer[sbuf_addr] <= sbuf_wdata;
        sbuf_rdata <= screen_buffer[sbuf_addr];
    end

    // For now, treat the 8x12 font as 8x16 to avoid a divide by 24
`ifdef FONT8x12
    wire [6:0] screen_buf_x = h_cntr >> 4;
    wire [6:0] screen_buf_y = v_cntr >> 5;
`else
    wire [6:0] screen_buf_x = h_cntr >> 4;
    wire [6:0] screen_buf_y = v_cntr >> 4;
`endif

    wire screen_buf_req_p0;
    assign screen_buf_req_p0 = (screen_buf_x < 80) && (screen_buf_y < 25);

    wire [11:0] current_char_addr;
    assign current_char_addr = screen_buf_x + screen_buf_y * screen_buf_width;

    reg in_vsync_p1, in_req_p1, in_eol_p1, in_eof_p1;
    reg [23:0] in_pixel_p1;
    reg [2:0] h_cntr_3_1_p1;

    reg [7:0] current_char;
    reg screen_buf_req_p1;
    always @(posedge vo_clk) begin
        screen_buf_req_p1 <= screen_buf_req_p0;

        if (screen_buf_req_p0) begin
            current_char <= screen_buffer[current_char_addr];
            //current_char <= screen_buf_x + screen_buf_y * 16;
            //current_char <= 129;
        end

        in_vsync_p1     <= in_vsync;
        in_req_p1       <= in_req;
        in_eof_p1       <= in_eof;
        in_eol_p1       <= in_eol;
        in_pixel_p1     <= in_pixel;

        h_cntr_3_1_p1   <= h_cntr[3:1];
    end

    // Mapping:
    // Char row 0
    //  00  01  02  03  04  05  06  07  08  09  0a  0b  0c  0d  0e  0f
    //  10  11  12  13  14  15  16  17  18  19  1a  1b  1c  1d  1e  1f
    //   ...
    //  70  71  72  73  74  75  76  77  78  79  7a  7b  7c  7d  7e  7f
    // Char row 1
    //  80  81  82  83  84  85  86  87  88  89  8a  8b  8c  8d  8e  8f
    //  

    wire [11:0] bitmap_lsb_addr;
    wire [11:0] bitmap_msb_addr;
    wire [11:0] bitmap_addr;
`ifdef FONT8x12
    assign bitmap_lsb_addr = (current_char & 12'hf) + (v_cntr[4:1] << 4);
    assign bitmap_msb_addr = (current_char >> 4) * 12'h100;

    reg [7:0] font_bitmap[0:256*16-1];

    initial begin
        $readmemh("vga8x12_font.hex", font_bitmap);
    end
`else
    assign bitmap_lsb_addr = (current_char & 11'hf) + (v_cntr[3:1] << 4);
    assign bitmap_msb_addr = (current_char >> 4) * 11'h80;

    reg [7:0] font_bitmap[0:256*8-1];

    initial begin
        $readmemh("c64_font.hex", font_bitmap);
    end
`endif
    assign bitmap_addr = bitmap_msb_addr + bitmap_lsb_addr;

    reg in_vsync_p2, in_req_p2, in_eol_p2, in_eof_p2;
    reg [23:0] in_pixel_p2;
    reg [2:0] h_cntr_3_1_p2;

    reg [7:0] bitmap_byte;
    reg screen_buf_req_p2;
    always @(posedge vo_clk) begin
        screen_buf_req_p2 <= screen_buf_req_p1;

        if (screen_buf_req_p1) begin
            bitmap_byte <= font_bitmap[bitmap_addr];
        end

        in_vsync_p2     <= in_vsync_p1;
        in_req_p2       <= in_req_p1;
        in_eof_p2       <= in_eof_p1;
        in_eol_p2       <= in_eol_p1;
        in_pixel_p2     <= in_pixel_p1;

        h_cntr_3_1_p2   <= h_cntr_3_1_p1;
    end

    wire bitmap_pixel;
    assign bitmap_pixel = (bitmap_byte >> (7 ^ h_cntr_3_1_p2));

    always @(posedge vo_clk) begin
        if (screen_buf_req_p2) begin
            out_pixel[ 7: 0] <= bitmap_pixel ? 8'h7b : 8'h41;
            out_pixel[15: 8] <= bitmap_pixel ? 8'h71 : 8'h30;
            out_pixel[23:16] <= bitmap_pixel ? 8'hd5 : 8'ha4;
        end
        else begin
            out_pixel <= in_pixel_p2;
        end

        out_vsync        <= in_vsync_p2;
        out_req          <= in_req_p2;
        out_eof          <= in_eof_p2;
        out_eol          <= in_eol_p2;
    end

endmodule
