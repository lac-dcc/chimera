// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module cursor
# (
	parameter SLOWNESS = 18,//number of position of counter clock divider
	//cursor moving speed is  CLK/2^SLOWNESS
//			    COLOR = 3, //color of cursor_rgb
				 HPOS_WIDTH=0, //coordinate wires width
				 VPOS_WIDTH=0,
				 CURSOR_SIZE=4,
	//cursor sprites rows		cursorsprite looks like:
				 PIX0='b111,//		
				 PIX1='b111,//		|PIX0	|PIX1	|PIX2	|PIX3	|
				 PIX2='b111,//			
				 PIX3='b111,//		
				 PIX4='b111,//		|PIX4	|PIX5	|PIX6	|PIX7	|
				 PIX5='b111,//		
				 PIX6='b111,//		
				 PIX7='b111,//		|PIX8	|PIX9	|PIX10|PIX11|
				 PIX8='b111,//		
				 PIX9='b111,//	
				 PIX10='b111,//	|PIX12|PIX13|PIX14|PIX15|
				 PIX11='b111,//
				 PIX12='b111,//
				 PIX13='b111,//
				 PIX14='b111,//
				 PIX15='b111//

)
(
	input clk,
	input reset,
	input [2:0] movedirection, // [2:0]movedirection=[2:0]key_sw
	input [HPOS_WIDTH - 1:0] init_xpos,
	input [VPOS_WIDTH - 1:0] init_ypos,
	input enable,cursorenable,
	output reg [HPOS_WIDTH - 1:0] cursor_xpos,
   output reg [VPOS_WIDTH - 1:0] cursor_ypos,
	output reg [2:0] cursor_rgb
);

reg [1:0] sw_cntclk=0;

localparam SPRITECNT_WIDTH = $clog2 (CURSOR_SIZE*CURSOR_SIZE);

reg [31:0] counterclk=0; //clkdiv counter

reg [2:0] cursorsprite [CURSOR_SIZE*CURSOR_SIZE-1:0];

reg [SPRITECNT_WIDTH-1:0] spritecounter=0;

//reg [2:0] resetstage;
//reg [RESETCNT_WIDTH-1:0] resetcnt = 0;

always@(posedge clk)
if(reset) begin
counterclk<=0;
end
else 
begin
counterclk<=counterclk+1;
sw_cntclk<={sw_cntclk[0],counterclk[SLOWNESS]};
//case (COLOR)	//color of cursor_rgb
// 1: cursor_rgb<=3'b001;
// 2: cursor_rgb<=3'b010;
// 3: cursor_rgb<=3'b100;
//endcase 
end

wire cntclkenable = (sw_cntclk[0]&&~sw_cntclk[1]) ? 1 : 0;
//cursor movement

always@(posedge clk or posedge reset)
if(reset) begin
	cursor_xpos<=init_xpos;
	cursor_ypos<=init_ypos;
end else if(enable && cntclkenable) begin
	if (movedirection[2]) begin //key_sw[2] is responsible for forward/backward mode of cursor movement
		if(movedirection[0]) cursor_xpos<=cursor_xpos+'b1; // key_sw[0] drives x-coordinate move
		if(movedirection[1]) cursor_ypos<=cursor_ypos+'b1; // key_sw[1] drives y-coordinate move
		end
	else if (~movedirection[2]) begin
		if(movedirection[0]) cursor_xpos<=cursor_xpos-'b1;
		if(movedirection[1]) cursor_ypos<=cursor_ypos-'b1;
	end
end

//cursorsprite

always@(posedge clk) begin
	if (reset) begin
	cursorsprite[0]<=PIX0;
	cursorsprite[1]<=PIX1;
	cursorsprite[2]<=PIX2;
	cursorsprite[3]<=PIX3;
	cursorsprite[4]<=PIX4;
	cursorsprite[5]<=PIX5;
	cursorsprite[6]<=PIX6;
	cursorsprite[7]<=PIX7;
	cursorsprite[8]<=PIX8;
	cursorsprite[9]<=PIX9;
	cursorsprite[10]<=PIX10;
	cursorsprite[11]<=PIX11;
	cursorsprite[12]<=PIX12;
	cursorsprite[13]<=PIX13;
	cursorsprite[14]<=PIX14;
	cursorsprite[15]<=PIX15;
	cursor_rgb<=0;
	end else if (cursorenable) begin
	cursor_rgb<=cursorsprite[spritecounter];
	spritecounter<=spritecounter+1;
	end
		
end

endmodule 