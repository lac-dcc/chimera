// This program was cloned from: https://github.com/trabucayre/GateMate_demos
// License: MIT License

// Use A and D to move paddle

`default_nettype none

module colorBarVGAPS2PONG
#(
  parameter ps2core = 2 // 0-minimig 1-oberon 2-keyboard
)
(
	input clk_i, 
	input rstn_i,
	output [3:0] o_r,
	output [3:0] o_g,
	output [3:0] o_b,
	output o_vsync,
	output o_hsync,
	output o_clk,
	output o_rst,
	inout ps2clk,
	inout ps2data,
	output o_led
);

wire clk_pix, lock;


/* PLL for 125MHz (1/2 hdmi clk rate) */
pll pll_inst (
    .clock_in(clk_i), // 10 MHz
	.rst_in(~rstn_i),
    .clock_out(clk_pix), // 40 MHz, 0 deg
    .locked(lock)
);

reg [7:0] ps2_keyboard_code;

generate
  if(ps2core == 2) // using oberon core
  begin
	ps2kbd kbd(clk_pix, ps2clk, ps2data, ps2_keyboard_code, , );
  end
endgenerate

  wire [23:0] color;
  wire [9:0] x;
  wire [9:0] y;

    localparam SCREEN_WIDTH = 640;
    localparam SCREEN_HEIGHT = 480;
    localparam PADDLE_SIZE = 64;
    localparam PADDLE_HEIGHT = 16;
    localparam BALL_SIZE = 8;

    reg [9:0] paddle_x;
    reg [9:0] ball_x;
    reg [9:0] ball_y;
    assign color = (x > paddle_x  && x < (paddle_x + PADDLE_SIZE) && y > (SCREEN_HEIGHT-PADDLE_HEIGHT) && y < SCREEN_HEIGHT) ? 24'hffffff :
                   (x > (ball_x - BALL_SIZE) && x < (ball_x + BALL_SIZE) && y > (ball_y - BALL_SIZE) && y < (ball_y + BALL_SIZE)) ? 24'hffffff :
                    24'h000000;


    reg [31:0] cnt;
    always @(posedge clk_pix)
    begin
        cnt <= cnt + 1;
    end

    always @(posedge cnt[16])
    begin
        if(!lock)
        begin
            paddle_x <= (SCREEN_WIDTH-PADDLE_SIZE)/2;
        end
        else
        begin
            if (ps2_keyboard_code == 8'h1C)
                paddle_x <= (paddle_x > 0) ? paddle_x - 1 : paddle_x;
            if (ps2_keyboard_code == 8'h23)
                paddle_x <= (paddle_x < (SCREEN_WIDTH-PADDLE_SIZE)) ? paddle_x +1 : paddle_x;
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

    // Velocity
    reg [9:0] ball_vel_x;
    reg [9:0] ball_vel_y;

    // Edge detection
    // Moving ball
    wire move;
    reg prev_move;

    assign move = cnt[17];

    reg reset;

    always @(posedge clk_pix)
    begin  
        if (!lock)
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

	assign o_r = color[15:12];
	assign o_g = color[10:7];
	assign o_b = color[4:1];

	wire vga_hsync, vga_vsync, vga_blank;

	vga
	vga_instance
	(
	  .clk_pixel(clk_pix),
	  .clk_pixel_ena(1'b1),
	  .test_picture(1'b0), // enable test picture generation
	  .beam_x(x),
	  .beam_y(y),
	  //.vga_r(vga_r),
	  //.vga_g(vga_g),
	  //.vga_b(vga_b),
	  .vga_hsync(o_hsync),
	  .vga_vsync(o_vsync),
	  .vga_blank(vga_blank)
	);

endmodule
