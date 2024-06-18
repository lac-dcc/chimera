// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module brush
# (
	parameter SLOWNESS = 16,//number of position of counter clock divider
				 RESOLUTION_H = 640,
				 RESOLUTION_V = 480,
	//cursor moving speed is  CLK/2^SLOWNESS
//			    COLOR = 3, //color of cursor_rgb
				 HPOS_WIDTH=0, //coordinate wires width
				 VPOS_WIDTH=0,
				 BRUSH_COLOR=3'b101,
				 BRUSH_BASE_SIZE=10,
				 BRUSH_MAX_SIZE=30,
				 INIT_XPOS = RESOLUTION_H/2,
				 INIT_YPOS = RESOLUTION_V/2,
				 SIZE_WIDTH= $clog2(BRUSH_MAX_SIZE)

)
(
	input clk,
	input reset,
	input [3:0] BTN, // [2:0]movedirection=[2:0]key_sw
	input [3:0] BTN_POSEDGE,
	input display_on,fifofull,
	input [HPOS_WIDTH - 1:0]hpos,
	input [VPOS_WIDTH - 1:0]vpos,
	input [2:0]FB_RGB,
	input memenable,
	output reg[2:0] rgb,
	output [2:0] writergb,
	output reg fifopush,
	output reg [HPOS_WIDTH - 1:0]writecounter_x,
	output reg [VPOS_WIDTH - 1:0]writecounter_y
);

reg [2:0] writestate;
reg [SIZE_WIDTH - 1:0] brush_size;
reg [HPOS_WIDTH - 1:0] cursor_xpos, cursor_write_xpos;
reg [VPOS_WIDTH - 1:0] cursor_ypos, cursor_write_ypos;
//reg [2:0] cursorsprite [CURSOR_SIZE*CURSOR_SIZE-1:0];
reg [SLOWNESS:0] counterclk; //clkdiv counter

//brush counter
always@(posedge clk or posedge reset) begin //ALWAYS MAKE ASYNCRONIC RESET ,WHEN WORKING WITH SPRITES!!!
if(reset) counterclk<=0;
else if(display_on) counterclk<=counterclk+1;
end

//brush movement
always@(posedge clk or posedge reset) begin
if(reset) begin
cursor_xpos<=INIT_XPOS;
cursor_ypos<=INIT_YPOS;
end else if (memenable) begin
	if (BTN[2]) begin // move right or down
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos!=RESOLUTION_H-brush_size) cursor_xpos<=cursor_xpos+'b1; // move right
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos!=RESOLUTION_V-brush_size) cursor_ypos<=cursor_ypos+'b1; // move down
	end else if (~BTN[2]) begin //move left or up
		if(BTN[0]&&(counterclk==0)) if(cursor_xpos != brush_size) cursor_xpos<=cursor_xpos-'b1; // move left
		if(BTN[1]&&(counterclk==0)) if(cursor_ypos != brush_size) cursor_ypos<=cursor_ypos-'b1; // move up 
	end
end
end

//brush size
always@(posedge clk or posedge reset) begin
if(reset) begin
brush_size<=BRUSH_BASE_SIZE;
end else if(memenable) begin
if(BTN_POSEDGE[3]&&BTN[2]&&~BTN[1]&&~BTN[0]) if(brush_size == BRUSH_MAX_SIZE) brush_size<=BRUSH_BASE_SIZE;
else brush_size<=brush_size+'d10;
end
end

//brush_sprite
//#(
//	.HPOS_WIDTH	(	HPOS_WIDTH	),
//	.VPOS_WIDTH	(	VPOS_WIDTH	),
//	.SIZE_WIDTH	(	SIZE_WIDTH	)
//)
//(
//	.clk			(	clk			),
//	.reset	 	(	reset			),
//	.display_on	(	display_on	),
//	.cursor_xpos(	cursor_xpos	),
//	.hpos			(	hpos			),
//	.cursor_ypos(	cursor_ypos	),
//	.vpos			(	vpos			),
//	.brush_size	(	brush_size	),
//	.FB_RGB		(	FB_RGB		),
//	.rgb			(	rgb			)
//);

//brush sprite
always @ (posedge clk or posedge reset)
        if (reset)
            rgb <= 3'b000;
        else if (display_on)
         if ((vpos >= cursor_ypos - brush_size)&&(vpos <= cursor_ypos + brush_size)&&(hpos >= cursor_xpos - brush_size)&&(hpos <= cursor_xpos + brush_size)) 
				rgb <= BRUSH_COLOR;
         else rgb <= FB_RGB;
		  else  rgb <= 3'b000;
		  
//brush write
always @(posedge clk)
if(reset)begin
	writecounter_x<=0;
	writecounter_y<=0;
	cursor_write_xpos<=0;
	cursor_write_ypos<=0;
	fifopush<=0;
	writestate<=0;
end else begin
if(display_on&&~fifofull)
	case(writestate)
			0: begin 
				cursor_write_xpos<=cursor_xpos;
				cursor_write_ypos<=cursor_ypos;
				fifopush<=0;
				if(BTN[3]) writestate<=1;
			end
			1: begin
				fifopush<=1;
				writecounter_x<= cursor_write_xpos - brush_size;
				writecounter_y<= cursor_write_ypos - brush_size;
				writestate<='d2;
			end
			'd2: begin
				fifopush<=1;
				writecounter_x<=writecounter_x+1;
				if(writecounter_x == cursor_write_xpos + brush_size) writestate<='d3;
			end
			'd3: begin
			fifopush<=1;
			writecounter_y<=writecounter_y+1;
			if(writecounter_y == cursor_write_ypos + brush_size) writestate<='d0;
			else begin 
				writecounter_x <= cursor_write_xpos - brush_size;
				writestate<='d2;
				end
			end
	endcase
else fifopush<=0;
end
assign writergb = (memenable) ? BRUSH_COLOR : 0;

endmodule 