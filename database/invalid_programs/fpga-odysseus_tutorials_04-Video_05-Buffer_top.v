`default_nettype none

module top (
    input wire clk_25mhz,

    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn,
    output wifi_gpio0
);
    assign wifi_gpio0 = 1'b1;

    wire clk;
    pll pll(
        .clki(clk_25mhz),
        .clko(clk),
        .locked()
    );

    wire [7:0] x;
    wire [5:0] y;
    wire [7:0] color;

    spi_video video(
        .clk(clk),
        .oled_csn(oled_csn),
        .oled_clk(oled_clk),
        .oled_mosi(oled_mosi),
        .oled_dc(oled_dc),
        .oled_resn(oled_resn),
        .x(x),
        .y(y),
        .color(color)
    );

    reg [7:0] mem [0:47];

    integer k;

    initial
    begin
      for (k = 0; k < 48; k = k + 1)
        mem[k] <= 32;
      mem[0] <= 8'd65;
      mem[1] <= 8'd66;
      mem[2] <= 8'd67;
    end

    wire [7:0] data_out;

    font_rom vga_font(
        .clk(clk),
        .addr({ mem[(y >> 4) * 12 + (x>>3)], y[3:0] }),
        .data_out(data_out)
    );

    assign color = data_out[7-x[2:0]+1] ? 8'hff : 8'h00; // +1 for sync

endmodule
