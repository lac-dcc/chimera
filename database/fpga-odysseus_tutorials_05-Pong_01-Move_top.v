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
    wire locked;
    pll pll(
        .clki(clk_25mhz),
        .clko(clk),
        .locked(locked)
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

    localparam SCREEN_WIDTH = 96;
    localparam SCREEN_HEIGHT = 64;
    localparam PADDLE_SIZE = 16;
    localparam PADDLE_WIDTH = 4;
    localparam NET_WIDTH = 2;

    reg [5:0] paddle1_y;
    reg [5:0] paddle2_y;

    assign color = 
                (x > 0 && x < PADDLE_WIDTH && y > paddle1_y  && y < paddle1_y + PADDLE_SIZE) ? 8'hff :
                (x > (SCREEN_WIDTH-PADDLE_WIDTH) && x < SCREEN_WIDTH && y > paddle2_y  && y < paddle2_y + PADDLE_SIZE) ? 8'hff :
                (x > (SCREEN_WIDTH/2) - NET_WIDTH && x < (SCREEN_WIDTH/2) + NET_WIDTH && y[2]==0) ? 8'hff :
                8'h00;


    reg [31:0] cnt;
    always @(posedge clk)
    begin
        cnt <= cnt + 1;
    end

    always @(posedge cnt[16])
    begin
        if(!locked)
        begin
            paddle1_y <= (SCREEN_HEIGHT-PADDLE_SIZE)/2;
            paddle2_y <= (SCREEN_HEIGHT-PADDLE_SIZE)/2;        
        end
        else
        begin
            if (btn[1]==1'b1)
                paddle1_y <= (paddle1_y > 0) ? paddle1_y - 1 : paddle1_y;
            if (btn[2]==1'b1)
                paddle1_y <= (paddle1_y < (SCREEN_HEIGHT-PADDLE_SIZE)) ? paddle1_y +1 : paddle1_y;
            if (btn[3]==1'b1)
                paddle2_y <= (paddle2_y > 0) ? paddle2_y - 1 : paddle2_y;
            if (btn[4]==1'b1)
                paddle2_y <= (paddle2_y < (SCREEN_HEIGHT-PADDLE_SIZE)) ? paddle2_y +1 : paddle2_y;
        end
    end    
endmodule
