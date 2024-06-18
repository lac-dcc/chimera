// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module brush
# (
    parameter HPOS_WIDTH=0,
              VPOS_WIDTH=0,
				  INITIAL_VALUE=0,
				  SQUARE_CURSOR=0,
				  CIRCLE_CURSOR=1,
				  CURSOR_SIZE=4,
              // Display constants
              H_DISPLAY=0,  // Horizontal display width
              V_DISPLAY=0,   // Vertical display height
				  //cursor sprites rows		cursorsprite looks like:
				 PIX0='b1,//		
				 PIX1='b1,//		|PIX0	|PIX1	|PIX2	|PIX3	|
				 PIX2='b1,//			
				 PIX3='b1,//		
				 PIX4='b1,//		|PIX4	|PIX5	|PIX6	|PIX7	|
				 PIX5='b1,//		
				 PIX6='b1,//		
				 PIX7='b1,//		|PIX8	|PIX9	|PIX10|PIX11|
				 PIX8='b1,//		
				 PIX9='b1,//	
				 PIX10='b1,//	|PIX12|PIX13|PIX14|PIX15|
				 PIX11='b1,//
				 PIX12='b1,//
				 PIX13='b1,//
				 PIX14='b1,//
				 PIX15='b1//
)

(	
	input clk,reset,enable,key_sw,display_on, empty, full,
	input [HPOS_WIDTH - 1:0] cursor_xpos,
   input [VPOS_WIDTH - 1:0] cursor_ypos,
	
	output webuf,
	output reg push,pop,
	output [HPOS_WIDTH+VPOS_WIDTH+2:0] tofifo // fifo data structure:{[XPOS][YPOS][RGB]}
);

localparam PAINTCNT_WIDTH = $clog2 (CURSOR_SIZE*CURSOR_SIZE);

wire [HPOS_WIDTH - 1:0] pixel_xpos;
wire [VPOS_WIDTH - 1:0] pixel_ypos;
reg [2:0]rgbdata;

reg cursorpaint [CURSOR_SIZE*CURSOR_SIZE-1:0];
reg [PAINTCNT_WIDTH-1:0] paintcnt=0;

	other_computer
	#(
	  .CURSOR_SIZE(CURSOR_SIZE),
	  .HPOS_WIDTH(HPOS_WIDTH),
     .VPOS_WIDTH(VPOS_WIDTH)
	  )
	computer
	(
	  .clk(clk),
	  .reset(reset),
	   .we(key_sw), //write enable is driven by key_sw[3]
		.enable(enable),
	  .cursor_xpos(cursor_xpos),
	  .cursor_ypos(cursor_ypos),
	  .pixel_xpos(pixel_xpos),
	  .pixel_ypos(pixel_ypos)
	);
	
	always@(posedge clk) begin
	if (reset) begin
	cursorpaint[0]<=PIX0;
	cursorpaint[1]<=PIX1;
	cursorpaint[2]<=PIX2;
	cursorpaint[3]<=PIX3;
	cursorpaint[4]<=PIX4;
	cursorpaint[5]<=PIX5;
	cursorpaint[6]<=PIX6;
	cursorpaint[7]<=PIX7;
	cursorpaint[8]<=PIX8;
	cursorpaint[9]<=PIX9;
	cursorpaint[10]<=PIX10;
	cursorpaint[11]<=PIX11;
	cursorpaint[12]<=PIX12;
	cursorpaint[13]<=PIX13;
	cursorpaint[14]<=PIX14;
	cursorpaint[15]<=PIX15;
	end else if (enable&&key_sw) begin
	rgbdata<=cursorpaint[paintcnt];
	paintcnt<=paintcnt+1;
	end
		
	end
	
	assign tofifo={pixel_xpos,pixel_ypos,rgbdata};
	
	
	
	always@(posedge clk) begin
	
	push <= (display_on&&key_sw&&~full);
	pop <= (~display_on&&~empty);
	
//	push<= (display_on && ~full) ? 1 : 0;
//	pop<= (~display_on && ~empty) ? 1 : 0;
	
	end

	assign webuf = push;
	
endmodule
