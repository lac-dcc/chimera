// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`timescale 1ns/1ns;
module TestBench_brush();
parameter SLOWNESS = 8,//number of position of counter clock divider
		  RESOLUTION_H =640,
	 	  RESOLUTION_V =480,
		HPOS_WIDTH=0, //coordinate wires width
		VPOS_WIDTH=0,
		V_TOP =   10,
	 	V_SYNC =   2,
	 	V_BOTTOM =33,
	 	H_FRONT = 16,
	 	H_SYNC =  96,
	 	H_BACK =  48,
		BRUSH_SIZE=10,
		BRUSH_COLOR=3'b101;

localparam X_WIRE_WIDTH = $clog2 (RESOLUTION_H+H_FRONT+H_SYNC+H_BACK),
		   Y_WIRE_WIDTH = $clog2 (RESOLUTION_V+V_BOTTOM+V_SYNC+V_TOP),
		   TESTSQUARE_LEFTSIDE=0,
		   TESTSQUARE_RIGHTSIDE=20,
		   TESTSQUARE_TOPSIDE=0,
		   TESTSQUARE_DOWNSIDE=30;

reg clk,reset_n,enable;
reg [3:0] BTN; // [2:0]key_sw;
reg [X_WIRE_WIDTH - 1:0]hpos;
reg [Y_WIRE_WIDTH - 1:0]vpos;
reg [2:0]FB_RGB;

brush
	 #(
	 .SLOWNESS		( SLOWNESS	   ),
	 .RESOLUTION_H  ( RESOLUTION_H ),
	 .RESOLUTION_V  ( RESOLUTION_V ),
	 .HPOS_WIDTH	( X_WIRE_WIDTH ),
	 .VPOS_WIDTH 	( Y_WIRE_WIDTH ),
	 .BRUSH_SIZE	( BRUSH_SIZE   ),
	 .BRUSH_COLOR	( BRUSH_COLOR  ),
	 .INIT_XPOS		( 'd10   	   ),
	 .INIT_YPOS		( 'd12	       )
	 )
	 Painting_Brush
	 (
			.clk	  ( clk			),
			.reset	  ( ~reset_n 	),
			.BTN	  ( BTN			), // [2:0]movedirection=[2:0]key_sw
			.enable	  ( enable		),
			.hpos	  ( hpos	    ),
			.vpos	  ( vpos		),
			.FB_RGB	  ( FB_RGB		)
	 );
always #5 clk=~clk;

initial begin
clk=0;
reset_n=0;
BTN=0;
enable=0;
hpos=TESTSQUARE_LEFTSIDE;
vpos=TESTSQUARE_TOPSIDE;
FB_RGB=0;
#10
reset_n=1;
#10
enable=1;
FB_RGB='b111;
end

always@ (posedge clk) begin
if(enable) begin 
if(hpos!=TESTSQUARE_RIGHTSIDE) hpos=hpos+1;
else hpos=TESTSQUARE_LEFTSIDE;
end
end

always@ (posedge clk) begin
if(hpos == TESTSQUARE_RIGHTSIDE) begin
if(vpos!=TESTSQUARE_DOWNSIDE) vpos=vpos+1;
else vpos=TESTSQUARE_TOPSIDE;
end
end

endmodule 