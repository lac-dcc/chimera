// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module vgasprites
#(parameter CURSOR_SIZE=4,
					H_DISPLAY=0,  // Horizontal display width
              V_DISPLAY=0,   // Vertical display height
				  HPOS_WIDTH=0,
				  VPOS_WIDTH=0
)
( 
	input clk, reset, enable, display_on,
	input [HPOS_WIDTH - 1:0] hpos,
   input [VPOS_WIDTH - 1:0] vpos,
	input [2:0] key_sw,
	input rfromFB,
	output reg [2:0] rgbout,
	output [HPOS_WIDTH-1:0]cursor_xpos,
	output [VPOS_WIDTH-1:0]cursor_ypos
);
reg cursorenable;
reg [1:0] gb_canvas=2'b11;
wire [HPOS_WIDTH-1:0]cursor_x; // current x coordinate of cursor
wire [VPOS_WIDTH-1:0]cursor_y; // current y coordinate of cursor
wire [2:0] cursor_rgb;
wire [2:0] cursordirection;		 


	cursor
	#(
	.HPOS_WIDTH(HPOS_WIDTH),
	.VPOS_WIDTH(VPOS_WIDTH)
	)	
	cursor
	(
	.clk(clk),
	.reset(reset),
	.movedirection(cursordirection),
	.init_xpos(H_DISPLAY/2), //cursor x position after startup or reset
	.init_ypos(V_DISPLAY/2), //cursor y position after startup or reset
	.cursor_xpos(cursor_x),
   .cursor_ypos(cursor_y),
	.cursor_rgb(cursor_rgb),
	.enable(enable),
	.cursorenable(cursorenable)
	);

always @ (posedge clk or posedge reset)
   if (reset) begin
            rgbout <= 3'b000;
//				paintpos_h<=0;
//				paintpos_v<=0;
//				rwrite<=INITIAL_VALUE;
	end else if (display_on) begin
//		if((hpos<H_DISPLAY)&&(vpos<V_DISPLAY))begin 
			if ((hpos >= cursor_x-CURSOR_SIZE/2)&&(hpos <= cursor_x+CURSOR_SIZE/2)&&(vpos >= cursor_y-CURSOR_SIZE/2)&&(vpos <= cursor_y+CURSOR_SIZE/2)) begin 
			cursorenable<=1;
			rgbout<=cursor_rgb;
			end
			else begin 
			cursorenable<=0;
			rgbout[2]<=rfromFB;
			rgbout[1:0]<=gb_canvas;
			end
					//When VGA scans the position of cursor, its color is completely constant,
					//without requesting memory
//			else begin
//			rgbout[2:2]<=rfrommem;
//			rgbout[1:0]<=gb_canvas;
//			end
//		end
	end else rgbout <= 3'b000;

assign cursor_xpos=cursor_x;
assign cursor_ypos=cursor_y;
assign cursordirection=key_sw[2:0]; // cursor movement control
			
endmodule