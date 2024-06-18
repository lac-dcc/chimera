// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module RGBmemcoderdecoderv2 
#(
	parameter 
				 RESOLUTION_H=0, //assuming resolution ratio is 4:3
				 MEMORY_H=80,
				 DATA_WIDTH = 0,
				 //every register in RAM carries DATA_WIDTH RAM-bits in it
				 X_WIDTH=0,
				 Y_WIDTH=0,
				 ADDR_WIDTH=0
)
(input clk,
 input reset,
 input [X_WIDTH-1:0] hpos ,
 input [Y_WIDTH-1:0] vpos ,
 input [DATA_WIDTH-1:0] datafromR,
 input [DATA_WIDTH-1:0] datafromG,
 input [DATA_WIDTH-1:0] datafromB,
 input [2:0]RGBin,
 input display_on,
 input memenable,
 input fifoempty,

 output reg we,//depends on display on/off
 output [2:0]RGB,
 output reg [DATA_WIDTH-1:0] Rdatatomem,
 output reg [DATA_WIDTH-1:0] Gdatatomem,
 output reg [DATA_WIDTH-1:0] Bdatatomem,
 output [ADDR_WIDTH-1:0] addr // addr width is ln(RAMLENGTH)/ln(2)
);

localparam RES_MULT=RESOLUTION_H/MEMORY_H,
			  REGS_IN_ROW=RES_MULT*DATA_WIDTH,
				  DATASELECT_WIDTH= $clog2 (DATA_WIDTH);
reg [ADDR_WIDTH-1:0] addr_r, addr_w;
reg [DATA_WIDTH-1:0] Rdatabuf;
reg [DATA_WIDTH-1:0] Gdatabuf;
reg [DATA_WIDTH-1:0] Bdatabuf;
reg [DATASELECT_WIDTH-1:0] dataselect,dataselect_r,dataselect_w;
reg [2:0] w_state;

//wire [ADDR_WIDTH-1:0] addr_r = ((hpos/RES_MULT)+MEMORY_H*(vpos/REGS_IN_ROW));
//wire [ADDR_WIDTH-1:0] addr_w = (hpos+MEMORY_H*(vpos/DATA_WIDTH));

always@(posedge clk) begin
if(reset) begin
dataselect<=0;
dataselect_r<=0;
Rdatabuf<=0;
Gdatabuf<=0;
Bdatabuf<=0;
w_state<=0;
dataselect_w<=0;
Rdatatomem<=0;
Gdatatomem<=0;
Bdatatomem<=0;
addr_r<=0;
addr_w<=0;
end else if (memenable&&display_on) begin
we<=0;
w_state<=0;
//NEVER CHANGE THIS. NEVER!
addr_r <= ((hpos/RES_MULT)+MEMORY_H*(vpos/REGS_IN_ROW));
//NEVER CHANGE THIS. NEVER!
dataselect <= (vpos/RES_MULT)%DATA_WIDTH;
dataselect_r <= dataselect;
end else if (memenable&&~display_on&&~fifoempty) begin
//NEVER CHANGE THIS. NEVER!
//addr_w <=(hpos+MEMORY_H*(vpos/DATA_WIDTH));
addr_w <=((hpos/RES_MULT)+MEMORY_H*(vpos/REGS_IN_ROW));
case (w_state)
		0: begin
		we<=0;
		w_state<=1;
		Rdatabuf<=0;
		Gdatabuf<=0;
		Bdatabuf<=0;
		end
		1:w_state<=3'd2;
		2:begin
		Rdatabuf<=datafromR;
		Gdatabuf<=datafromG;
		Bdatabuf<=datafromB;
		//dataselect_w<=vpos%DATA_WIDTH; //NEVER CHANGE THIS. NEVER!
		dataselect_w <= (vpos/RES_MULT)%DATA_WIDTH;
		w_state<=3'd3;
		end
		3'd3: case (dataselect_w) //...then write in the same databuf(if the databuf value is in range)...
					0: begin
						Rdatabuf[0]<= RGBin[2];
						Gdatabuf[0]<= RGBin[1];
						Bdatabuf[0]<= RGBin[0];
						w_state<=3'd4;
						end
					3'd1:begin
						Rdatabuf[1]<= RGBin[2];
						Gdatabuf[1]<= RGBin[1];
						Bdatabuf[1]<= RGBin[0];
						w_state<=3'd4;
						end
					3'd2:begin
						Rdatabuf[2]<= RGBin[2];
						Gdatabuf[2]<= RGBin[1];
						Bdatabuf[2]<= RGBin[0];
						w_state<=3'd4;
						end
					3'd3:begin
						Rdatabuf[3]<= RGBin[2];
						Gdatabuf[3]<= RGBin[1];
						Bdatabuf[3]<= RGBin[0];
						w_state<=3'd4;
						end
					3'd4:begin
						Rdatabuf[4]<= RGBin[2];
						Gdatabuf[4]<= RGBin[1];
						Bdatabuf[4]<= RGBin[0];
						w_state<=3'd4;
						end
					3'd5:begin
						Rdatabuf[5]<= RGBin[2];
						Gdatabuf[5]<= RGBin[1];
						Bdatabuf[5]<= RGBin[0];
						w_state<=3'd4;
						end
					endcase
		3'd4: begin
		we<=1;
		Rdatatomem<=Rdatabuf;
		Gdatatomem<=Gdatabuf;
		Bdatatomem<=Bdatabuf;
		w_state<=0;
		end
		//3'd5: begin 
		//w_state<=0;
		//we<=0;
		//end
endcase
end else begin 
we<=0;
Rdatatomem<=0;
Gdatatomem<=0;
Bdatatomem<=0;
end
end
assign addr = (display_on) ? addr_r : addr_w;
assign RGB[2] = (~display_on) ? 0 : datafromR[dataselect_r];
assign RGB[1] = (~display_on) ? 0 : datafromG[dataselect_r];
assign RGB[0] = (~display_on) ? 0 : datafromB[dataselect_r];

endmodule