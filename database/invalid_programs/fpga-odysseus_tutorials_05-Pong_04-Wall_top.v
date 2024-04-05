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
    localparam PADDLE_HEIGHT = 4;
    localparam BALL_SIZE = 2;

    reg [7:0] paddle_x;
    reg [7:0] ball_x;
    reg [5:0] ball_y;

    assign color = (x > paddle_x  && x < (paddle_x + PADDLE_SIZE) && y > (SCREEN_HEIGHT-PADDLE_HEIGHT) && y < SCREEN_HEIGHT) ? 8'hff :
                   (x > (ball_x - BALL_SIZE) && x < (ball_x + BALL_SIZE) && y > (ball_y - BALL_SIZE) && y < (ball_y + BALL_SIZE)) ? 8'hff :
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
            paddle_x <= (SCREEN_WIDTH-PADDLE_SIZE)/2;
        end
        else
        begin
            if (btn[5]==1'b1)
                paddle_x <= (paddle_x > 0) ? paddle_x - 1 : paddle_x;
            if (btn[6]==1'b1)
                paddle_x <= (paddle_x < (SCREEN_WIDTH-PADDLE_SIZE)) ? paddle_x +1 : paddle_x;
        end
    end    

    // Velocity
    reg [7:0] ball_vel_x;
    reg [5:0] ball_vel_y;

    // Edge detection
    // Moving ball
    wire move;
    reg prev_move;

    assign move = cnt[17];

    reg reset;

    always @(posedge clk)
    begin  
        if (!locked)
        begin
            ball_x <= 20;
            ball_y <= 20;
            reset  <= 0; 
            ball_vel_x <= 1;
            ball_vel_y <= -1;
        end
        else 
        begin            
            if (ball_x - BALL_SIZE == 0)
            begin
                ball_vel_x <= 1;
            end
            if (ball_x + BALL_SIZE == SCREEN_WIDTH)
            begin
                ball_vel_x <= -1;
            end
            if (ball_y - BALL_SIZE == 0)
            begin
                ball_vel_y <= 1;
            end
            if ((ball_y + BALL_SIZE) > (SCREEN_HEIGHT - PADDLE_HEIGHT) )
            begin
                if ((ball_x + BALL_SIZE) < paddle_x || (ball_x - BALL_SIZE) > (paddle_x+PADDLE_SIZE) )
                begin
                    if ((ball_y + BALL_SIZE) == SCREEN_HEIGHT)
                        reset <= 1;  
                end
                else 
                    ball_vel_y <= -1;
            end
        
            prev_move <= move;
            if (move==1 && prev_move==0)
                begin
                if (reset == 1)
                begin
                    ball_x <= 20;
                    ball_y <= 20;
                    reset  <= 0;
                end
                else 
                begin
                    ball_x <= ball_x + ball_vel_x;
                    ball_y <= ball_y + ball_vel_y;
                end
            end
        end
    end
endmodule
