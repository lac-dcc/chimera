// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module other_computer
#(
	parameter HPOS_WIDTH=0,
				 VPOS_WIDTH=0,
				 CURSOR_SIZE=4
	
)
(
	input clk,reset,enable,we,
	input [HPOS_WIDTH - 1:0] cursor_xpos,
   input [VPOS_WIDTH - 1:0] cursor_ypos,
	output reg [HPOS_WIDTH - 1:0] pixel_xpos,
	output reg [VPOS_WIDTH - 1:0] pixel_ypos
);
	localparam CNT_SIZE=$clog2 (CURSOR_SIZE);

	reg [HPOS_WIDTH - 1:0] paint_x [CURSOR_SIZE:0] ; // all points, including central one
	reg [VPOS_WIDTH - 1:0] paint_y [CURSOR_SIZE:0] ;
	reg [CNT_SIZE:0] counterout=0;
	
	//x computing
	always@(posedge clk) begin
	if (reset) begin 
	paint_x[0]<=0;
	paint_x[1]<=0;
	paint_x[2]<=0;
	paint_x[3]<=0;
	paint_x[4]<=0;
	end else if(enable) begin
	paint_x[0]<=cursor_xpos-CURSOR_SIZE/2;
	paint_x[1]<=cursor_xpos-CURSOR_SIZE/2+1;
	paint_x[2]<=cursor_xpos-CURSOR_SIZE/2+2;
	paint_x[3]<=cursor_xpos-CURSOR_SIZE/2+3;
	paint_x[4]<=cursor_xpos-CURSOR_SIZE/2+4;
	end
	end
	
	//y computing
	always@(posedge clk) begin
	if (reset) begin 
	paint_y[0]<=0;
	paint_y[1]<=0;
	paint_y[2]<=0;
	paint_y[3]<=0;
	paint_y[4]<=0;
	end else if(enable) begin
	paint_y[0]<=cursor_ypos-CURSOR_SIZE/2;
	paint_y[1]<=cursor_ypos-CURSOR_SIZE/2+1;
	paint_y[2]<=cursor_ypos-CURSOR_SIZE/2+2;
	paint_y[3]<=cursor_ypos-CURSOR_SIZE/2+3;
	paint_y[4]<=cursor_ypos-CURSOR_SIZE/2+4;
	end
	end
	
	//serial output
	always@(posedge clk) begin
	if (reset) begin 
	pixel_xpos<=0;
	pixel_ypos<=0;
	counterout<=0;
	end else if(enable&&we) begin
	counterout<=counterout+1;
	pixel_xpos<=paint_x[counterout];
	pixel_ypos<=paint_y[counterout];
	end
	end
	
endmodule 