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

    reg [9:0] paddle1_y;
    reg [9:0] paddle2_y;

    assign color = 
                (x > 0 && x < PADDLE_WIDTH && y > paddle1_y  && y < paddle1_y + PADDLE_SIZE) ? 24'hffffff :
                (x > (SCREEN_WIDTH-PADDLE_WIDTH) && x < SCREEN_WIDTH && y > paddle2_y  && y < paddle2_y + PADDLE_SIZE) ? 24'hffffff :
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
