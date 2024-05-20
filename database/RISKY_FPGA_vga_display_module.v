// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module display_module (
  input clk,
  input rst,
  input [31:0] data,
  input [31:0] waddr,
  input w_en,
  output [7:0] rgb,
  output hsync,
  output vsync
);

wire [9:0] x;
wire [9:0] y;
wire vga_clk;
wire r_en;
wire fbw_en;

assign fbw_en = w_en && (waddr[31:28] == 4'b0001);

vga_sync vg0 (
  .clk(clk),
  .reset(rst),
  .hsync(hsync),
  .vsync(vsync),
  .video_on(r_en),
  .p_tick(vga_clk),
  .x(x),
  .y(y)
);

framebuffer fb0 (
  .clk(clk),
  .vga_clk(vga_clk),
  .rst(rst),
  .game_data(data[7:0]),
  .address(waddr[18:0]),
  .x(x),
  .y(y),
  .r_en(r_en),
  .w_en(fbw_en),
  .display_data(rgb)
);

endmodule
