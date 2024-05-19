// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License


`define VGA_NUM_ROWS        10'd480
`define VGA_NUM_COLS        10'd640

// following in terms of 25 MHz clock
`define VGA_HS_TDISP        `VGA_NUM_COLS
`define VGA_HS_TPW          10'd96
`define VGA_HS_TFP          10'd16
`define VGA_HS_TBP          10'd48
`define VGA_HS_OFFSET      (`VGA_HS_TPW + `VGA_HS_TBP)
`define VGA_HS_TS           (`VGA_HS_OFFSET+`VGA_HS_TDISP+`VGA_HS_TFP)

// following in terms of lines
`define VGA_VS_TDISP        `VGA_NUM_ROWS
`define VGA_VS_TPW          10'd2
`define VGA_VS_TFP          10'd10
`define VGA_VS_TBP          10'd33
`define VGA_VS_OFFSET      (`VGA_VS_TPW + `VGA_VS_TBP)
`define VGA_VS_TS           (`VGA_VS_OFFSET+`VGA_VS_TDISP+`VGA_VS_TFP)
`define RANGE_CHECK(val, low, high) \
    ((val >= low) && (val <= high))


module VGATiming(
    output  HS_n, VS_n,
    output  pixel_valid,
    output  [9:0] vga_row,
    output  [9:0] vga_col,
    input   clk_25M,
    input   rst_n);

    wire clr_clk, clr_line, inc_line;
    wire [9:0] pix_cnt;
    wire [9:0] line_cnt;
    wire max_line;

    assign clr_clk = inc_line;
    assign clr_line = clr_clk && max_line;

    wire valid_col, valid_row;
    assign valid_row = `RANGE_CHECK(line_cnt, `VGA_VS_OFFSET, `VGA_VS_OFFSET+`VGA_NUM_ROWS-1'b1);
    assign valid_col = `RANGE_CHECK(pix_cnt, `VGA_HS_OFFSET, `VGA_HS_OFFSET+`VGA_NUM_COLS-1'b1);

    assign pixel_valid = valid_col && valid_row;

    counter #(10) clk_counter(.cnt(pix_cnt), .clk(clk_25M), .rst_n(rst_n), .inc(1'b1), .clr(clr_clk));
    counter #(10) line_counter(.cnt(line_cnt), .clk(clk_25M), .rst_n(rst_n), .inc(inc_line), .clr(clr_line));

    assign inc_line = (pix_cnt==`VGA_HS_TS-1'b1);
    assign max_line = (line_cnt==`VGA_VS_TS-1'b1);

    assign HS_n = `RANGE_CHECK(pix_cnt, 10'h0, (`VGA_HS_TPW-1'b1));
    assign vga_col = pix_cnt - `VGA_HS_OFFSET;
    assign VS_n = `RANGE_CHECK(line_cnt, 10'h0, `VGA_VS_TPW-1'b1);
    assign vga_row = (line_cnt - `VGA_VS_OFFSET);

endmodule: VGATiming


module counter #(parameter W=8, RV={W{1'b0}}) (
    output reg [W-1:0] cnt,
    input  clr,
    input inc,
    input  clk,
    input rst_n
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt <= 0;
        else if (clr) cnt <= 0;
        else if (inc) cnt <= cnt+1'b1;
    end

endmodule: counter
