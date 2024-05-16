//`timescale 1ns / 1ps
`define en(i) \
else if(valid_reg[i]&&(STB_reg[i]||SDB_reg[i]||END_reg[i])) \
begin \
if(STB_reg[i]) \
begin \
data_reg<={data_reg[632-1:8*i],STB,data_reg[8*i-1:0]}; \
STB_reg <={STB_reg[80-1-1:i+1],2'b00,STB_reg[i-1:0]}; \
SDB_reg <={SDB_reg[80-1-1:i],1'b0,SDB_reg[i-1:0]}; \
END_reg <={END_reg[80-1-1:i],1'b0,END_reg[i-1:0]}; \
valid_reg<={valid_reg[80-1-1:i],1'b1,valid_reg[i-1:0]}; \
DK <= {DK[80-1-1:i],1'b1,DK[i-1:0]};\
end \
else if(SDB_reg[i]) \
begin \
data_reg<={data_reg[632-1:8*i],SDB,data_reg[8*i-1:0]}; \
SDB_reg <={SDB_reg[80-1-1:i+1],2'b00,SDB_reg[i-1:0]}; \
STB_reg <={STB_reg[80-1-1:i],1'b0,STB_reg[i-1:0]}; \
END_reg <={END_reg[80-1-1:i],1'b0,END_reg[i-1:0]}; \
valid_reg<={valid_reg[80-1-1:i],1'b1,valid_reg[i-1:0]}; \
DK <= {DK[80-1-1:i],1'b1,DK[i-1:0]};\
end \
else if(END_reg[i]) \
begin \
data_reg<={data_reg[632-1:8*(i+1)],END,data_reg[8*(i+1)-1:0]}; \
STB_reg <={STB_reg[80-1-1:(i+1)],1'b0,STB_reg[(i+1)-1:0]}; \
SDB_reg <={SDB_reg[80-1-1:(i+1)],1'b0,SDB_reg[(i+1)-1:0]}; \
END_reg <={END_reg[80-1-1:(i+1)],2'b00,END_reg[i-1:0]}; \
valid_reg<={valid_reg[80-1-1:(i+1)],1'b1,valid_reg[(i+1)-1:0]}; \
DK <= {DK[80-1-1:(i+1)],1'b1,DK[(i+1)-1:0]}; \
end \
end \

`define co(a)\
else if (valid_reg[80-a]) count<= 80-a+1;\


// Company: 
// Engineer: 
// 
// Create Date:    14:14:34 05/16/2021 
// Design Name: 
// Module Name:    InsertTokenBlock 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InsertTokenBlock #
(
parameter MAXPIPEWIDTH = 32,
parameter LANESNUMBER = 8,
parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 16 ,	
parameter GEN3_PIPEWIDTH = 32 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 	
)
(
    input clk,
	 input ResetN,
	 input [511:0] DataIn,
    input [63:0] ValidIn,
    input [63:0] TLPStart,
    input [63:0] DLLPStart,
    input [63:0] PEnd,
    input [2:0] Gen,
	 input [LANESNUMBER-1:0]DetectedLanes,
	 input Hold,
	 input Empty,
	 output reg ReadEn,
    output reg[MAXPIPEWIDTH*LANESNUMBER-1:0]DataOut,
    output reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0]ValidOut,
	 output reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0]DKOut
	 );
//internal reg
reg [7:0] count;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0]DK;

wire[MAXPIPEWIDTH/8*LANESNUMBER-1:0]flag1;
reg [3 :0] flag2; 
reg [MAXPIPEWIDTH*LANESNUMBER-1:0]   ShiftLeftVaLueData;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] ShiftLeftValueValid;
reg [2:0] width;
reg [MAXPIPEWIDTH*LANESNUMBER-1:0]   out_data_mask;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] out_valid_mask;
reg NoMoreData;
reg finishprocessing;
reg read_new;
reg [512+16*8-1:0] data_reg;
reg [64+16-1:0] STB_reg;
reg [64+16-1:0] SDB_reg;
reg [64+16-1:0] END_reg;
reg [64+16-1:0] valid_reg;
reg ConFlag ;
parameter STB=8'hFB,
			 SDB=8'h5C,
			 END=8'hFD;
//check on gneration and adjust width reg 0 for 8bit 1 for 16bit 2 for 32bit
always @ (posedge clk)
begin 
	if(~ResetN) begin width <= 0; end
	else begin
		if (Gen == 1)begin  
			case(GEN1_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (Gen == 2)begin  
			case(GEN2_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (Gen == 3)begin  
			case(GEN3_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (Gen == 4)begin  
			case(GEN4_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		else if (Gen == 5)begin  
			case(GEN5_PIPEWIDTH)
			8:width<=0;
			16:width<=1;
			32:width<=2;
			endcase
		end
		
	end
end 
always @ *
begin
out_data_mask<=0;
		out_valid_mask<=0;
		case(width)
			0: //8 bit
			begin 
				out_data_mask[LANESNUMBER*8-1:0]<={LANESNUMBER{8'hFF}};
				out_valid_mask [LANESNUMBER-1:0]<={LANESNUMBER{1'b1}};
				ShiftLeftVaLueData<=LANESNUMBER << 3; //multiply by 8 is the same as shift left by 3
				ShiftLeftValueValid<=LANESNUMBER<<0;
			end
			1:
			begin
				out_data_mask[LANESNUMBER*16-1:0]<={LANESNUMBER{16'hFFFF}};
				out_valid_mask [LANESNUMBER*2-1:0]<={LANESNUMBER{2'b11}};
				ShiftLeftVaLueData<=LANESNUMBER << 4; //multiply by 16 is the same as shift left by 4
				ShiftLeftValueValid<=LANESNUMBER<<1;
			end
			2:
			begin
				out_data_mask[LANESNUMBER*32-1:0]<={LANESNUMBER{32'hFFFF_FFFF}};
				out_valid_mask [LANESNUMBER*4-1:0]<={LANESNUMBER{4'b1111}};
				ShiftLeftVaLueData<=LANESNUMBER << 5; //multiply by 32 is the same as shift left by 4
				ShiftLeftValueValid<=LANESNUMBER<<2;
			end
		endcase
end 
always @(posedge clk)
begin 
if (~ResetN)begin
data_reg<=0;
STB_reg<=0;
SDB_reg<=0;
END_reg<=0;
DK<=0;
valid_reg<=0;
NoMoreData<=1;
finishprocessing<=0;
ConFlag<=0;
end 
else if(|ValidIn) begin
data_reg[640-1:512] <= {128{1'b0}};
data_reg[512-1:0] <= DataIn;

STB_reg[80-1:64] <= {16{1'b0}};
STB_reg[64-1:0] <= TLPStart;

SDB_reg[80-1:64] <= {16{1'b0}};
SDB_reg[64-1:0] <= DLLPStart;

END_reg[80-1:64] <= {16{1'b0}};
END_reg[64-1:0] <= PEnd;

valid_reg[80-1:64]<= {16{1'b0}};
valid_reg[64-1:0]<= ValidIn;

DK<=0;
end 
end 

always @(posedge clk)begin
	ReadEn<=0;
	
	if(~Hold && ~Empty && NoMoreData )begin
		ReadEn<=1;
		finishprocessing <=0;
		NoMoreData<=0;
	end
	else begin
		if(valid_reg[0]&&(STB_reg[0]||SDB_reg[0]||END_reg[0]))
		begin
			if(STB_reg[0])
			begin
				data_reg<={data_reg[632-1:0],STB};
				STB_reg <={STB_reg[80-1-1:1],2'b00};
				SDB_reg <={SDB_reg[80-1-1:0],1'b0};
				END_reg <={END_reg[80-1-1:0],1'b0};
				valid_reg<={valid_reg[80-1-1:0],1'b1};
				DK<={DK[80-1-1:0],1'b1};
			end
			else if(SDB_reg[0])
			begin
				data_reg<={data_reg[632-1:0],SDB};
				SDB_reg <={SDB_reg[80-1-1:1],2'b00};
				STB_reg <={STB_reg[80-1-1:0],1'b0};
				END_reg <={END_reg[80-1-1:0],1'b0};
				valid_reg<={valid_reg[80-1-1:0],1'b1};
				DK<={DK[80-1-1:0],1'b1};
			end
			else if(END_reg[0])
			begin 
				data_reg<={data_reg[632-1:8],END,data_reg[7:0]};
				STB_reg <={STB_reg[80-1-1:1],1'b0,STB_reg[0:0]};
				SDB_reg <={SDB_reg[80-1-1:1],1'b0,SDB_reg[0:0]};
				END_reg <={END_reg[80-1-1:1],2'b00};
				valid_reg<={valid_reg[80-1-1:1],1'b1,valid_reg[0:0]};
				DK={DK[80-1-1:1],1'b1,DK[0:0]};
			end
		end
		`en(1)
		`en(2)
		`en(3)
		`en(4)
		`en(5)
		`en(6)
		`en(7)
		`en(8)
		`en(9)
		`en(10)
		`en(11)
		`en(12)
		`en(13)
		`en(14)
		`en(15)
		`en(16)
		`en(17)
		`en(18)
		`en(19)
		`en(20)
		`en(21)
		`en(22)
		`en(23)
		`en(24)
		`en(25)
		`en(26)
		`en(27)
		`en(28)
		`en(29)
		`en(30)
		`en(31)
		`en(32)
		`en(33)
		`en(34)
		`en(35)
		`en(36)
		`en(37)
		`en(38)
		`en(39)
		`en(40)
		`en(41)
		`en(42)
		`en(43)
		`en(44)
		`en(45)
		`en(46)
		`en(47)
		`en(48)
		`en(49)
		`en(50)
		`en(51)
		`en(52)
		`en(53)
		`en(54)
		`en(55)
		`en(56)
		`en(57)
		`en(58)
		`en(59)
		`en(60)
		`en(61)
		`en(62)
		`en(63)
		`en(64)
		`en(65)
		`en(66)
		`en(67)
		`en(68)
		`en(69)
		`en(70)
		`en(71)
		`en(72)
		`en(73)
		`en(74)
		`en(75)
		`en(76)
		`en(77)
//		`en(78)
		else if(valid_reg[78]&&(STB_reg[78]||SDB_reg[78]||END_reg[78])) 
		begin 
			if(STB_reg[78]) 
			begin 
				data_reg<={data_reg[632-1:624],STB,data_reg[623:0]}; 
				STB_reg <={2'b00,STB_reg[77:0]}; 
				SDB_reg <={SDB_reg[78:78],1'b0,SDB_reg[77:0]}; 
				END_reg <={END_reg[78:78],1'b0,END_reg[77:0]}; 
				valid_reg<={valid_reg[78:78],1'b1,valid_reg[77:0]};
				DK<={DK[78:78],1'b1,DK[77:0]};	
			end 
			else if(SDB_reg[78]) 
			begin 
				data_reg<={data_reg[632-1:624],SDB,data_reg[623:0]}; 
				SDB_reg <={2'b00,SDB_reg[77:0]}; 
				STB_reg <={STB_reg[78:78],1'b0,STB_reg[77:0]}; 
				END_reg <={END_reg[78:78],1'b0,END_reg[77:0]}; 
				valid_reg<={valid_reg[78:78],1'b1,valid_reg[77:0]}; 
				valid_reg<={valid_reg[78:78],1'b1,valid_reg[77:0]};
				DK={DK[78:78],1'b1,DK[77:0]};
			end 
			else if(END_reg[78]) 
			begin 
				data_reg<={END,data_reg[632-1:0]}; 
				STB_reg <={1'b0,STB_reg[78:0]}; 
				SDB_reg <={1'b0,SDB_reg[78:0]}; 
				END_reg <={2'b00,END_reg[77:0]}; 
				valid_reg<={1'b1,SDB_reg[78:0]}; 
				DK<={1'b1,DK[78:0]};
			end 
		end
	end
	if( (~|SDB_reg && ~|SDB_reg && ~|END_reg)&& |valid_reg) begin finishprocessing <=1; end
	
	
end
reg [MAXPIPEWIDTH*LANESNUMBER-1:0] data_temp;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] valid_temp;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] DK_temp;
reg [7:0] count_temp;
always @ (posedge clk)
begin
DataOut<=0;
ValidOut<=0;
if(~Hold && finishprocessing && |valid_reg )
	begin
		if (ConFlag)
	   begin
			
			if(((flag1 & (out_valid_mask >>count_temp))==(out_valid_mask >>count_temp) )|| Empty)
			begin 
				flag2=1;
				ValidOut<=valid_temp|((valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & (out_valid_mask >>count_temp)) << count_temp );
				DataOut <= data_temp |((data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] & (out_data_mask >>(count_temp<<3))) << (count_temp<<3) ); 
				DKOut<=DK_temp|((DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & (out_valid_mask >>count_temp)) << count_temp );
				data_reg <=data_reg>>(ShiftLeftVaLueData-(count_temp<<3));
				valid_reg<=valid_reg>>(ShiftLeftValueValid-count_temp);
				DK<=DK>>(ShiftLeftValueValid-count_temp);
				ConFlag<=0; 
			end
			else 
			begin
				flag2=2;
				valid_temp<=valid_temp|((valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & (out_valid_mask >>count_temp)) << count_temp );
				data_temp <= data_temp |((data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] & (out_data_mask >>(count_temp<<3))) <<(count_temp<<3) ); 
				DK_temp<=DK_temp|((DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & (out_valid_mask >>count_temp)) << count_temp );
				count_temp<=count_temp + count;
				ConFlag<=1;
				data_reg <=0;
				valid_reg<=0;
				DK<=0;
				NoMoreData<=1;
			end
	   end
		else if( (flag1&out_valid_mask) == out_valid_mask)//there is enough data to send now
		begin
			flag2=3;
			DataOut <=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] & out_data_mask;
			ValidOut<=valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & out_valid_mask;
			DKOut<=DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & out_valid_mask;
			data_reg <=data_reg>>ShiftLeftVaLueData;
			valid_reg<=valid_reg>>ShiftLeftValueValid;
			DK<=DK>>ShiftLeftValueValid;
			
		end
		else if (|(flag1&out_valid_mask) & ~Empty)
		begin
			flag2=4;
			data_temp <=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0];
			valid_temp<=valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0];
			DK_temp<=DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0]; 
			count_temp<=count;
			ConFlag<=1;
			data_reg <=0;
			valid_reg<=0;
			DK<=0;
			NoMoreData<=1;
		end
		else
		begin
			flag2<=5;
		   DataOut <=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] ;
			ValidOut<=valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] ;
			DKOut<=DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0];
			data_reg <=0;
			valid_reg<=0;
			DK<=0;
		end
	end
end

assign flag1 = valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0];

integer i;
integer j;
always @ *
begin
if(finishprocessing && |valid_reg)
begin
for(i=0 ; i<80 ; i=i+1)
begin
   j=i*8;
	if(!valid_reg[i]) data_reg[j+:8]<=8'h00;
end
end
if(valid_reg[79]) count<=80;
`co(2)
`co(3)
`co(4)
`co(5)
`co(6)
`co(7)
`co(8)
`co(9)
`co(10)
`co(11)
`co(12)
`co(13)
`co(14)
`co(15)
`co(16)
`co(17)
`co(18)
`co(19)
`co(20)
`co(21)
`co(22)
`co(23)
`co(24)
`co(25)
`co(26)
`co(27)
`co(28)
`co(29)
`co(30)
`co(31)
`co(32)
`co(33)
`co(34)
`co(35)
`co(36)
`co(37)
`co(38)
`co(39)
`co(40)
`co(41)
`co(42)
`co(43)
`co(44)
`co(45)
`co(46)
`co(47)
`co(48)
`co(49)
`co(50)
`co(51)
`co(52)
`co(53)
`co(54)
`co(55)
`co(56)
`co(57)
`co(58)
`co(59)
`co(60)
`co(61)
`co(62)
`co(63)
`co(64)
`co(65)
`co(66)
`co(67)
`co(68)
`co(69)
`co(70)
`co(71)
`co(72)
`co(73)
`co(74)
`co(75)
`co(76)
`co(77)
`co(78)
`co(79)
`co(80)
end
endmodule
