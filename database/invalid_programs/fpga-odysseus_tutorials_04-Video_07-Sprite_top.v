`default_nettype none

module top (
    input wire clk_25mhz,

    output wire oled_csn,
    output wire oled_clk,
    output wire oled_mosi,
    output wire oled_dc,
    output wire oled_resn,
    input [6:0] btn,
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

    reg [7:0] pos_x;
    reg [5:0] pos_y;

    initial
    begin
      pos_x <= 0;
      pos_y <= 0;
    end

    wire [7:0] sprite_rgb;

    wire [7:0] sprite_x;
    wire [5:0] sprite_y;

    assign sprite_x = x - pos_x;
    assign sprite_y = y - pos_y;

    sprite_rom sprite(
        .clk(clk),
        .addr({ sprite_y[5:0], sprite_x[5:0] }),
        .data_out(sprite_rgb));

    assign color = (x > pos_x && x < pos_x + 64 && y > pos_y && y < pos_y + 64) ? sprite_rgb : 8'hff;

    reg [15:0] counter;

    always @(posedge clk) begin
        counter <= counter + 1;
    end

    always @(posedge counter[15])
    begin
        if (btn[5]==1'b1)
            pos_x <= (pos_x > 0) ? pos_x - 1 : pos_x;
        if (btn[6]==1'b1)
            pos_x <= (pos_x < 32) ? pos_x +1 : pos_x;
    end 

endmodule
