module hdmi_video(
  input clk_25mhz,
  output [9:0] x,
  output [9:0] y,
  input [23:0] color,
  output [3:0] gpdi_dp, gpdi_dn,
  output vga_vsync,
  output vga_hsync,
  output vga_blank,
  output clk_locked
);
    // clock generator
    wire clk_250MHz, clk_125MHz, clk_25MHz;
    clk_25_250_125_25
    clock_instance
    (
      .clki(clk_25mhz),
      .clko(clk_250MHz),
      .clks1(clk_125MHz),
      .clks2(clk_25MHz),
      .locked(clk_locked)
    );
   
    vga_video vga_instance
    (
      .clk(clk_25MHz),
      .resetn(clk_locked),
      .vga_hsync(vga_hsync),
      .vga_vsync(vga_vsync),
      .vga_blank(vga_blank),
      .h_pos(x),
      .v_pos(y)
    );

    // VGA to digital video converter
    wire [1:0] tmds[3:0];
    vga2dvid vga2dvid_instance
    (
      .clk_pixel(clk_25MHz),
      .clk_shift(clk_125MHz),
      .in_color(color),
      .in_hsync(vga_hsync),
      .in_vsync(vga_vsync),
      .in_blank(vga_blank),
      .out_clock(tmds[3]),
      .out_red(tmds[2]),
      .out_green(tmds[1]),
      .out_blue(tmds[0]),
      .resetn(clk_locked),
    );

    // output TMDS SDR/DDR data to fake differential lanes
    fake_differential fake_differential_instance
    (
      .clk_shift(clk_125MHz),
      .in_clock(tmds[3]),
      .in_red(tmds[2]),
      .in_green(tmds[1]),
      .in_blue(tmds[0]),
      .out_p(gpdi_dp),
      .out_n(gpdi_dn)
    );
endmodule
