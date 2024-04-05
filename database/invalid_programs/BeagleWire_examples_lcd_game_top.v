module top(input         clk,
           output [3:0]  led,
           output [15:0] rgb565,
           output        pclk,
           output        de,
           output        disp_on,
           input [1:0]   btn);

//counter in divider 50Mhz/6-> 8,333Mhz
reg [6:0] c = 0;

parameter TDEH = 480;  
parameter TDEL = 256;
parameter TDEB = 45;  
parameter TDE = 272;  

reg [4:0] r;
reg [5:0] g;
reg [4:0] b;

// Horizontal and vertical counter
reg [9:0] Hcount;
reg [8:0] Vcount;




reg clk10_out;
reg [16:0] pixaddr;

wire clk_50m;
wire lock;

SB_PLL40_CORE #(
    .FEEDBACK_PATH("SIMPLE"),
    .PLLOUT_SELECT("GENCLK"),
    .DIVR(4'b0000),
    .DIVF(7'b0000111),
    .DIVQ(3'b100),
    .FILTER_RANGE(3'b101)
) uut (
    .LOCK(lock),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .REFERENCECLK(clk),
    .PLLOUTCORE(clk_50m)
);

always @(posedge clk_50m)
begin
    if (c < 3) begin
        c = c + 1;
        clk10_out = 1'b1;
    end else if (c <= 3 && c<= 4) begin
        clk10_out = 1'b0;	
        c = c + 1;
    end else begin
        c = 0;
    end
end

always @(posedge clk10_out)
begin
    if (Hcount < TDEH && Vcount < TDE) begin
        pixaddr = (Vcount * 480) + Hcount;
    end
	
    if  (Hcount < (TDEH+TDEL)) begin
        Hcount = Hcount + 1;
    end	else begin
        if (Vcount < (TDE+TDEB)) begin
	    Vcount = Vcount + 1;
	end else begin
	    Vcount = 0;				
        end
        Hcount = 0;
    end
end

initial begin
  PaddlePosition = 100;
end

assign de = ((Hcount < TDEH) && (Vcount < TDE)) ? 1'b1 : 1'b0; 
assign pclk = clk10_out;

assign rgb565 = {r, g, b};
assign disp_on = 1'b1;
assign led = {btn, 2'b01};

reg [8:0] PaddlePosition;
reg  quadAr, quadBr;

reg [9:0] CounterX;
reg [8:0] CounterY;
assign CounterX = Hcount;
assign CounterY = Vcount;

always @(posedge clk) quadAr <= btn[1];
always @(posedge clk) quadBr <= btn[0];

always @(posedge clk)
begin
    if((quadAr[0] == 0) && btn[1])
begin
    PaddlePosition <= PaddlePosition + 42;

end

if((quadBr[0] == 0) && btn[0])

	begin
	
			PaddlePosition <= PaddlePosition - 42;
	end
end

reg [9:0] ballX;
reg [8:0] ballY;
reg ball_inX, ball_inY;

always @(posedge clk)
if(ball_inX==0) ball_inX <= (CounterX==ballX) & ball_inY; else ball_inX <= !(CounterX==ballX+16);

always @(posedge clk)
if(ball_inY==0) ball_inY <= (CounterY==ballY); else ball_inY <= !(CounterY==ballY+16);

wire ball = ball_inX & ball_inY;

/////////////////////////////////////////////////////////////////
wire border = (CounterX > 475  || (CounterX < 5) || CounterY < 5) || (CounterY > 268);
wire paddle = (CounterX>PaddlePosition-60) && (CounterX<PaddlePosition+60) && (CounterY > 30) &&  (CounterY < 45);
wire BouncingObject = border | paddle; // active if the border or paddle is redrawing itself

reg ResetCollision;
always @(posedge clk) ResetCollision <= (CounterY==272) & (CounterX==0);  // active only once for every video frame

reg CollisionX1, CollisionX2, CollisionY1, CollisionY2;
always @(posedge clk) if(ResetCollision) CollisionX1<=0; else if(BouncingObject & (CounterX==ballX   ) & (CounterY==ballY+ 8)) CollisionX1<=1;
always @(posedge clk) if(ResetCollision) CollisionX2<=0; else if(BouncingObject & (CounterX==ballX+16) & (CounterY==ballY+ 8)) CollisionX2<=1;
always @(posedge clk) if(ResetCollision) CollisionY1<=0; else if(BouncingObject & (CounterX==ballX+ 8) & (CounterY==ballY   )) CollisionY1<=1;
always @(posedge clk) if(ResetCollision) CollisionY2<=0; else if(BouncingObject & (CounterX==ballX+ 8) & (CounterY==ballY+16)) CollisionY2<=1;

/////////////////////////////////////////////////////////////////
wire UpdateBallPosition = ResetCollision;  // update the ball position at the same time that we reset the collision detectors

reg ball_dirX, ball_dirY;
always @(posedge clk)
if(UpdateBallPosition)
begin
	if(~(CollisionX1 & CollisionX2))        // if collision on both X-sides, don't move in the X direction
	begin
		ballX <= ballX + (ball_dirX ? -1 : 1);
		if(CollisionX2) ball_dirX <= 1; else if(CollisionX1) ball_dirX <= 0;
	end

	if(~(CollisionY1 & CollisionY2))        // if collision on both Y-sides, don't move in the Y direction
	begin
		ballY <= ballY + (ball_dirY ? -1 : 1);
		if(CollisionY2) ball_dirY <= 1; else if(CollisionY1) ball_dirY <= 0;
	end
end 

wire R = border;
wire G = ball;// | (CounterX[3] ^ CounterY[3]);
wire B = paddle;

assign r = ((Hcount > 0) && (Hcount <= 480) && R) ? 5'b11111 : 5'b00000;
assign g = ((Hcount > 0) && (Hcount <= 480) && G) ? 6'b111111 : 6'b00000;
assign b = ((Hcount > 0) && (Hcount <= 480) && B) ? 5'b11111 : 5'b00000;

endmodule
