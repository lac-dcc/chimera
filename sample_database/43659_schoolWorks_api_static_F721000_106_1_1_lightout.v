// This program was cloned from: https://github.com/Darkborderman/schoolWorks
// License: BSD 2-Clause "Simplified" License

module vga (
	output [7:0] light,
    input clk, // 50 MHz
	input down,
	input right,
	input check,
    output [2:0] red,
    output [2:0] green,
    output [2:0] blue,
    output hsync,vsync,
	output [6:0] out10,
	output [6:0] out1
);

reg [11:0] hcount;  // VGA horizontal counter
reg [10:0] vcount;  // VGA vertical counter

integer i,j;
integer pixelSize=30;
integer size=50;

reg [7:0] tries;
reg [3:0] map [0:3];
reg [2:0] selectX=2'd0;
reg [2:0] selectY=2'd0;
wire hcount_ov, vcount_ov, video_active;

displayNumber DISNUM (.in(tries),.out10(out10),.out1(out1));

// VGA mode parameters
parameter
    hsync_end   = 12'd119,
    hdat_begin  = 12'd242,
    hdat_end    = 12'd1266,
    hpixel_end  = 12'd1345,
    vsync_end   = 11'd5,
    vdat_begin  = 11'd32,
    vdat_end    = 11'd632,
    vline_end   = 11'd665;

always @(posedge clk)
begin 
    if (hcount_ov) hcount <= 12'd0;
    else hcount <= hcount + 12'd1;
end
assign hcount_ov = hcount == hpixel_end;

always @(posedge clk)
begin
    if (hcount_ov)
	 begin
        if (vcount_ov) vcount <= 11'd0;
        else vcount <= vcount + 11'd1;
	end
end
assign  vcount_ov = vcount == vline_end;

assign video_active = hdat_begin <= hcount && hcount < hdat_end &&
                      vdat_begin <= vcount && vcount < vdat_end;

assign hsync = hcount > hsync_end;
assign vsync = vcount > vsync_end;

reg [3:0] VGAr=7,VGAg=7,VGAb=7;

assign red= video_active ? VGAr : 3'b0;
assign blue= video_active ? VGAb :3'b0;
assign green= video_active ? VGAg : 3'b0;
assign light= (map[0]==4'b1111&&map[1]==4'b1111&&map[2]==4'b1111&&map[3]==4'b1111) ? 8'b11111111 : 8'b00000000;

//fowarding down
always @(posedge down)
begin
	if(down==1)
	begin
		if(selectY>2) selectY<=0;
		else selectY<=selectY+1;
	end
end

//forward right
always @ (posedge right)
begin
	if(right==1)
	begin
		if(selectX>2) selectX<=0;
		else selectX<=selectX+1;
	end
end

//press the light
always @ (posedge check)
begin
	if(check==1)
	begin
		if(selectX>=1) map[selectX-1][selectY]=~map[selectX-1][selectY];
		if(selectX<=2) map[selectX+1][selectY]=~map[selectX+1][selectY];
		if(selectY>=1) map[selectX][selectY-1]=~map[selectX][selectY-1];
		if(selectY<=2) map[selectX][selectY+1]=~map[selectX][selectY+1];
		map[selectX][selectY]=~map[selectX][selectY];
		tries<=tries+1;
	end
end

//generate game screen
always @(posedge clk)
begin
	//setup background
	if(hcount>=hdat_begin&&hcount<=hdat_end&&vcount>=vdat_begin&&vcount<=vdat_end)
	begin
		VGAr<=0;
		VGAb<=0;
		VGAg<=0;
	end
	//setup map
	for(i=0;i<=3;i=i+1)	
	begin
		for(j=0;j<=3;j=j+1)
		begin
			if(hcount>i*size+hdat_begin && hcount<i*size+pixelSize+hdat_begin)
			begin
				if(vcount>j*size+vdat_begin && vcount<j*size+pixelSize+vdat_begin)
				begin
					if(map[i][j]==1'b1)
					begin
						VGAr<=7;
						VGAb<=7;
						VGAg<=7;
					end
					else
					begin
						VGAr<=3;
						VGAb<=3;
						VGAg<=3;
					end
				end
			end
		end
		//setup player position
		if(hcount>selectX*size+hdat_begin && hcount<selectX*size+pixelSize+hdat_begin)
		begin
			if(vcount>selectY*size+vdat_begin && vcount<selectY*size+pixelSize+vdat_begin)
			begin
				if(map[selectX][selectY]==1)
				begin
					VGAr<=3;
					VGAb<=5;
					VGAg<=7;
				end
				else
				begin
					VGAr<=7;
					VGAb<=5;
					VGAg<=3;
				end
			end
		end
	end
end
endmodule

//displayer number of tries
module displayNumber(in,out10,out1);
//input number
input [7:0]in;
//out10 mean 10's, out1 mean 1's
output [6:0]out10;
output [6:0]out1;
reg [6:0]out10;
reg [6:0]out1;

always@(in)
begin
    case((in%100-in%10)/10)
        8'd0: out10=7'b1000000;
        8'd1: out10=7'b1111001;
        8'd2: out10=7'b0100100;
        8'd3: out10=7'b0110000;
        8'd4: out10=7'b0011001;
        8'd5: out10=7'b0010010;
        8'd6: out10=7'b0000010;
        8'd7: out10=7'b1011000;
        8'd8: out10=7'b0000000;
        8'd9: out10=7'b0010000;
    endcase
    case(in%10)
        8'd0: out1=7'b1000000;
        8'd1: out1=7'b1111001;
        8'd2: out1=7'b0100100;
        8'd3: out1=7'b0110000;
        8'd4: out1=7'b0011001;
        8'd5: out1=7'b0010010;
        8'd6: out1=7'b0000010;
        8'd7: out1=7'b1011000;
        8'd8: out1=7'b0000000;
        8'd9: out1=7'b0010000;
    endcase
end
endmodule

