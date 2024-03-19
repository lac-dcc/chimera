module top
(
	input clk_25mhz,
	output [3:0] gpdi_dp, gpdi_dn,
    input [6:0] btn,
	output wifi_gpio0
);
	assign wifi_gpio0 = 1'b1;

    wire locked;
	wire [23:0] color;
	wire [9:0] x;
	wire [9:0] y;

    localparam SCREEN_WIDTH = 640;
    localparam SCREEN_HEIGHT = 480;
    localparam PADDLE_SIZE = 64;
    localparam PADDLE_WIDTH = 16;
    localparam NET_WIDTH = 8;
    localparam BALL_SIZE = 8;

    reg [9:0] paddle1_y;
    reg [9:0] paddle2_y;
    reg [9:0] ball_x;
    reg [9:0] ball_y;
    assign color = 
                (x > 0 && x < PADDLE_WIDTH && y > paddle1_y  && y < paddle1_y + PADDLE_SIZE) ? 24'hffffff :
                (x > (SCREEN_WIDTH-PADDLE_WIDTH) && x < SCREEN_WIDTH && y > paddle2_y  && y < paddle2_y + PADDLE_SIZE) ? 24'hffffff :
                (x > ball_x - BALL_SIZE && x < ball_x + BALL_SIZE && y > ball_y - BALL_SIZE && y < ball_y + BALL_SIZE) ? 24'hffffff :
                (x > (SCREEN_WIDTH/2) - NET_WIDTH && x < (SCREEN_WIDTH/2) + NET_WIDTH && y[4]==0) ? 24'hffffff :
                24'h000000;


    reg [31:0] cnt;
    always @(posedge clk_25mhz)
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

    // Velocity
    reg [9:0] ball_vel_x;
    reg [9:0] ball_vel_y;

    // Edge detection
    // Moving ball
    wire move;
    reg prev_move;

    assign move = cnt[17];

    always @(posedge clk_25mhz)
    begin  
        if(!locked)
        begin
            ball_x = SCREEN_WIDTH/2;
            ball_y = SCREEN_HEIGHT/2;
            ball_vel_x = 1;
            ball_vel_y = -1;
        end
        else 
        begin      
            if (ball_x - BALL_SIZE < PADDLE_WIDTH)
            begin
                if ((ball_y + BALL_SIZE) < paddle1_y || (ball_y - BALL_SIZE) > (paddle1_y+PADDLE_SIZE) )
                begin
                    if ((ball_x - BALL_SIZE) == 0)
                    begin
                        ball_vel_x <= 1;
                    end
                end
                else
                begin
                    ball_vel_x <= 1;
                end
            end
            if (ball_x + BALL_SIZE > (SCREEN_WIDTH-PADDLE_WIDTH))
            begin
                if ((ball_y + BALL_SIZE) < paddle2_y || (ball_y - BALL_SIZE) > (paddle2_y+PADDLE_SIZE) )
                begin
                    if ((ball_x + BALL_SIZE) == SCREEN_WIDTH)
                    begin
                        ball_vel_x <= -1;
                    end
                end
                else
                begin
                    ball_vel_x <= -1;
                end
            end
            if (ball_y - BALL_SIZE == 0)
            begin
                ball_vel_y <= 1;
            end
            if (ball_y + BALL_SIZE == SCREEN_HEIGHT)
            begin
                ball_vel_y <= -1;
            end

            prev_move <= move;
            if (move==1 && prev_move==0)
            begin
                ball_x <= ball_x + ball_vel_x;
                ball_y <= ball_y + ball_vel_y;
            end
        end
    end
	hdmi_video hdmi_video
	(
		.clk_25mhz(clk_25mhz),
		.x(x),
		.y(y),
		.color(color),
		.gpdi_dp(gpdi_dp),
		.gpdi_dn(gpdi_dn),
        .clk_locked(locked)
	);
endmodule
