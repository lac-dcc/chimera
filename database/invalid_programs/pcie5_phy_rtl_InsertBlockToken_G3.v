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

`define stp_sdp(i) \
if (ValidIn_reg[i]==1)begin	\
 if (TLPStart_reg[i])begin	\
  if(TLP_count==5'b10000)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP16};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01111)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP15};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01110)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP14};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01101)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP13};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01100)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP12};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01011)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP11};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end \
  else if(TLP_count==5'b01010)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP10};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01001)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP9};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b01000)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP8};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00111)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP7};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00110)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP6};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00101)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP5};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00100)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP4};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00011)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP3};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00010)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP2};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  else if(TLP_count==5'b00001)begin	\
   out_comb=out_comb << 40;	\
   out_comb[39:0] = {DataIn_reg[((1+i)*8)-1:i*8],STP1};	\
   Valid_comb=Valid_comb<<5;	\
   Valid_comb[4:0]=5'b11111;	\
   TLP_count=TLP_count-1;	\
   end	\
  end	\
 else if(DLLPStart_reg[i])begin	\
  out_comb=out_comb << 24;	\
  out_comb[23:0]={DataIn_reg[((1+i)*8)-1:i*8],SDP};	\
   Valid_comb=Valid_comb<<3;	\
   Valid_comb[2:0]=3'b111;	\
  end	\
 else begin	\
  out_comb=out_comb << 8;	\
  out_comb[7:0] =DataIn_reg[((1+i)*8)-1:i*8];	\
  Valid_comb=Valid_comb<<1;	\
  Valid_comb[0]=1'b1;	\
  end	\
end	\
else begin	\
out_comb=out_comb << 8;	\
out_comb[7:0]=0;	\
Valid_comb=Valid_comb<<1;	\
Valid_comb[0]=1'b0;	\
end	\

`define FL(j) \
if (temp_valid[127-j])begin	\
Valid_comb=Valid_comb<<1;	\
Valid_comb[0]=1'b1;	\
out_comb=out_comb << 8;	\
out_comb[7:0]=temp_data[((1+127-j)*8)-1:(127-j)*8];	\
end	\



  module InsertBlockToken_G3 #
(
parameter MAXPIPEWIDTH =32,
parameter LANESNUMBER = 16,
parameter GEN1_PIPEWIDTH = 8 ,	
parameter GEN2_PIPEWIDTH = 32 ,	
parameter GEN3_PIPEWIDTH = 16 ,	
parameter GEN4_PIPEWIDTH = 8 ,	
parameter GEN5_PIPEWIDTH = 8 	
)
(clk,ResetN,DataIn,ValidIn,TLPStart,DLLPStart,PEnd,Gen,length,Hold,Empty,ReadEn,DataOut,ValidOut,DKOut);
input clk;
input ResetN;
input [511:0] DataIn;
input [63:0] ValidIn;
input [63:0] TLPStart;
input [63:0] DLLPStart;
input [63:0] PEnd;
input [2:0] Gen;
input[79:0] length;
input Hold;
input Empty;
//input stop_DS;
output reg ReadEn;
output reg[511:0]DataOut;
output reg [63:0]ValidOut;
output reg [63:0] DKOut;
////GEN3
reg[511:0]DataOut_reg;
reg [63:0]ValidOut_reg;
reg[63:0]TLPStart_reg;
reg[63:0]DLLPStart_reg;
reg [63:0]PEnd_reg;
reg [63:0]ValidIn_reg;
reg [95:0]Valid_reg;
reg [95:0]Valid_comb;
reg[511:0]DataIn_reg;
reg [15:0]SDP;
reg [31:0]STP1;
reg [31:0]STP2;
reg [31:0]STP3;
reg [31:0]STP4;
reg [31:0]STP5;
reg [31:0]STP6;
reg [31:0]STP7;
reg [31:0]STP8;
reg [31:0]STP9;
reg [31:0]STP10;
reg [31:0]STP11;
reg [31:0]STP12;
reg [31:0]STP13;
reg [31:0]STP14;
reg [31:0]STP15;
reg [31:0]STP16;
reg [5:0]pipe;
reg [4:0]lanes;
reg [2047:0] out_comb;
reg [2047:0] out_reg;
reg [4:0]TLP_count;
reg start;
reg write_data;
reg read_data_reg;
reg read_data_comb;
reg finish;
reg flag_reg;
reg flag_comb;
reg [1023:0] temp_data;
reg [127:0] temp_valid;
//////////////GEN1
reg [7:0] count;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0]DK;
wire[MAXPIPEWIDTH/8*LANESNUMBER-1:0]flag1;
reg [MAXPIPEWIDTH*LANESNUMBER-1:0] flag2; 
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
reg [MAXPIPEWIDTH*LANESNUMBER-1:0] data_temp;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] valid_temp;
reg [MAXPIPEWIDTH/8*LANESNUMBER-1:0] DK_temp;
reg [7:0] count_temp;
reg ConFlag ;
parameter STB=8'hFB,
			 SDB=8'h5C,
			 END=8'hFD;
//////////////////////////////////////
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

always @(negedge clk)begin
 if(ResetN==0)begin
   TLPStart_reg<=0;
   out_reg<=0;
   DataIn_reg<=0;
   DLLPStart_reg <=0;
   ValidIn_reg<=0;
   Valid_reg<=0;
   STP1<=0;
   STP2<=0;
   STP3<=0;
   STP4<=0;
   STP5<=0;
   STP6<=0;
   STP7<=0;
   STP8<=0;
   STP9<=0;
   STP10<=0;
   STP11<=0;
   STP12<=0;
   STP13<=0;
   STP14<=0;
   STP15<=0;
   STP16<=0;
   SDP<=0;
   start<=0;
   read_data_reg<=0;
   finish <=1;	
   lanes<=LANESNUMBER;
   ReadEn<=0;
   DataOut_reg<=0;
   ValidOut_reg<=0;
   flag_reg<=0;
   temp_data<=0;
   temp_valid<=0;
   /////GEN1
   data_reg<=0;
   STB_reg<=0;
   SDB_reg<=0;
   END_reg<=0;
   DK<=0;
   valid_reg<=0;
  NoMoreData<=1;
  finishprocessing<=0;
   end  
  else begin
   if (Gen==3'b011)
    pipe<=GEN3_PIPEWIDTH;
   else if(Gen==3'b100)
    pipe<=GEN4_PIPEWIDTH;
   else if(Gen==3'b101)
    pipe<=GEN5_PIPEWIDTH;
  write_data<=0;
  ReadEn<=0;
  DataOut_reg<=0;
  ValidOut_reg<=0;
  read_data_reg<=read_data_comb;
  Valid_reg<=Valid_comb;
  out_reg<=out_comb;
  flag_reg<=flag_comb;
  if((~Hold && ~Empty && finish) || (~Hold && ~Empty && NoMoreData))begin
   ReadEn<=1;
   start<=1;
   finish<=0;
   finishprocessing <=0;
   NoMoreData<=0;
   end
   else if (Gen==3'b001)begin
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
	//end
	if( (~|SDB_reg && ~|SDB_reg && ~|END_reg)&& |valid_reg) begin finishprocessing <=1; end
   end
   
   if (start)begin
	 TLPStart_reg <= TLPStart;
	 DLLPStart_reg <= DLLPStart;
	 PEnd_reg<=PEnd;
	 DataIn_reg <= DataIn;
	 ValidIn_reg<=ValidIn;
	 STP1<={23'b0,length[4:0],4'b1111};
	 STP2<={23'b0,length[9:5],4'b1111};
	 STP3<={23'b0,length[14:10],4'b1111};
	 STP4<={23'b0,length[19:15],4'b1111};
	 STP5<={23'b0,length[24:20],4'b1111};
	 STP6<={23'b0,length[29:25],4'b1111};
	 STP7<={23'b0,length[34:30],4'b1111};
	 STP8<={23'b0,length[39:35],4'b1111};
	 STP9<={23'b0,length[44:40],4'b1111};
	 STP10<={23'b0,length[49:45],4'b1111};
	 STP11<={23'b0,length[54:50],4'b1111};
	 STP12<={23'b0,length[59:55],4'b1111};
	 STP13<={23'b0,length[64:60],4'b1111};
	 STP14<={23'b0,length[69:65],4'b1111};
	 STP15<={23'b0,length[74:70],4'b1111};
	 STP16<={23'b0,length[79:75],4'b1111};
	 SDP <= 16'b1010110011110000;
	 start<=0;
	 write_data<=1;
	 end
	 if (read_data_reg)begin
	 /////////////////////8 bit pipewidth 
	  if (pipe==6'b001000)begin
	   if(lanes==5'b00001)begin
	     if(Valid_reg[0]==1'b1 || Empty==1)begin
		  ValidOut_reg<=Valid_reg[0];
		  Valid_reg <= Valid_reg >> 1;
		  DataOut_reg<= out_reg[7:0];
		  out_reg<= out_reg >> 8;
	     end
		 else begin
		  if (Valid_reg[0]!=0 && Valid_reg[0]!=1'b1 && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[7:0];
		     temp_valid<=Valid_reg[0];
			 Valid_reg <= Valid_reg >> 1;
			 out_reg<= out_reg >> 8;
			 end
	      read_data_reg<=0;
	      finish<=1;
         end
		end
		  
		 else if(lanes==5'b00100)begin
	      if(Valid_reg[3:0]==4'hf || Empty==1)begin
		   ValidOut_reg<=Valid_reg[3:0];
		   Valid_reg <= Valid_reg >> 4;
		   DataOut_reg<= out_reg[31:0];
		   out_reg<= out_reg >> 32;
	      end
		  else begin
		    if (Valid_reg[3:0]!=0 && Valid_reg[3:0]!=4'hf && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[31:0];
		     temp_valid<=Valid_reg[3:0];
			 Valid_reg <= Valid_reg >> 4;
			 out_reg<= out_reg >> 32;
			 end
	       read_data_reg<=0;
	       finish<=1;
          end
		 end
		  
		  else if(lanes==5'b01000)begin
	       if(Valid_reg[7:0]==8'hff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[7:0];
		    Valid_reg <= Valid_reg >> 8;
		    DataOut_reg<= out_reg[63:0];
		    out_reg<= out_reg >> 64;
	       end
		   else begin
		    if (Valid_reg[7:0]!=0 && Valid_reg[7:0]!=8'hff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[63:0];
		     temp_valid<=Valid_reg[7:0];
			 Valid_reg <= Valid_reg >> 8;
			 out_reg<= out_reg >> 64;
			 end
	        read_data_reg<=0;
	        finish<=1;
           end
		  end
		  
		  else if(lanes==5'b10000)begin
	       if(Valid_reg[15:0]==16'hffff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[15:0];
		    Valid_reg <= Valid_reg >> 16;
		    DataOut_reg<= out_reg[127:0];
		    out_reg<= out_reg >> 128;
	       end
		   else begin
		    if (Valid_reg[15:0]!=0 && Valid_reg[15:0]!=16'hffff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[127:0];
		     temp_valid<=Valid_reg[15:0];
			 Valid_reg <= Valid_reg >> 16;
			 out_reg<= out_reg >> 128;
			 end
	        read_data_reg<=0;
	        finish<=1;
           end
		  end
		end
	///////////////////16 bit pipewidth  
      else if (pipe==6'b010000)begin
	   if(lanes==5'b00001)begin
	     if(Valid_reg[1:0]==2'b11 || Empty==1)begin
		  ValidOut_reg<=Valid_reg[1:0];
		  Valid_reg <= Valid_reg >> 2;
		  DataOut_reg<= out_reg[15:0];
		  out_reg<= out_reg >> 16;
	     end
		 else begin
		  if (Valid_reg[1:0]!=0 && Valid_reg[1:0]!=2'b11 && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[15:0];
		     temp_valid<=Valid_reg[1:0];
			 Valid_reg <= Valid_reg >> 2;
			 out_reg<= out_reg >> 16;
			 end
	      read_data_reg<=0;
	      finish<=1;
         end
		end
		  
		 else if(lanes==5'b00100)begin
	      if(Valid_reg[7:0]==8'hff || Empty==1)begin
		   ValidOut_reg<=Valid_reg[7:0];
		   Valid_reg <= Valid_reg >> 8;
		   DataOut_reg<= out_reg[63:0];
		   out_reg<= out_reg >> 64;
	      end
		  else begin
		   if (Valid_reg[7:0]!=0 && Valid_reg[7:0]!=8'hff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[63:0];
		     temp_valid<=Valid_reg[7:0];
			 Valid_reg <= Valid_reg >> 8;
			 out_reg<= out_reg >> 64;
			 end
	      read_data_reg<=0;
	      finish<=1;
         end
		 end
		  
		  else if(lanes==5'b01000)begin
	       if(Valid_reg[15:0]==16'hffff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[15:0];
		    Valid_reg <= Valid_reg >> 16;
		    DataOut_reg<= out_reg[127:0];
		    out_reg<= out_reg >> 128;
	       end
		   else begin
		     if (Valid_reg[15:0]!=0 && Valid_reg[15:0]!=16'hffff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[127:0];
		     temp_valid<=Valid_reg[15:0];
			 Valid_reg <= Valid_reg >> 16;
			 out_reg<= out_reg >> 128;
			 end
	        read_data_reg<=0;
	        finish<=1;
           end
		  end
		  
		  else if(lanes==5'b10000)begin
	       if(Valid_reg[31:0]==32'hffffffff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[31:0];
		    Valid_reg <= Valid_reg >> 32;
		    DataOut_reg<= out_reg[255:0];
		    out_reg<= out_reg >> 256;
	       end
		   
		   else begin
		    if (Valid_reg[31:0]!=32'b0 && Valid_reg[31:0]!=32'hffffffff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[255:0];
		     temp_valid<=Valid_reg[31:0];
			 Valid_reg <= Valid_reg >> 32;
			 out_reg<= out_reg >> 256;
			 end
			read_data_reg<=0;
	        finish<=1;
           end
		  end
		 end
	  ////////////// 32 bit pipewidth
	  
	 else if (pipe==6'b100000)begin
	   if(lanes==5'b00001)begin
	     if(Valid_reg[3:0]==4'hf || Empty==1)begin
		  ValidOut_reg<=Valid_reg[3:0];
		  Valid_reg <= Valid_reg >> 4;
		  DataOut_reg<= out_reg[31:0];
		  out_reg<= out_reg >> 32;
	     end
		 else begin
		  if (Valid_reg[3:0]!=0 && Valid_reg[3:0]!=4'hf && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[31:0];
		     temp_valid<=Valid_reg[3:0];
			 Valid_reg <= Valid_reg >> 4;
			 out_reg<= out_reg >> 32;
			 end
	      read_data_reg<=0;
	      finish<=1;
         end
		end
		  
		 else if(lanes==5'b00100)begin
	      if(Valid_reg[15:0]==16'hffff || Empty==1)begin
		   ValidOut_reg<=Valid_reg[15:0];
		   Valid_reg <= Valid_reg >> 16;
		   DataOut_reg<= out_reg[127:0];
		   out_reg<= out_reg >> 128;
	      end
		  else begin
		   if (Valid_reg[15:0]!=0 && Valid_reg[15:0]!=16'hffff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[127:0];
		     temp_valid<=Valid_reg[15:0];
			 Valid_reg <= Valid_reg >> 16;
			 out_reg<= out_reg >> 128;
			 end
	       read_data_reg<=0;
	       finish<=1;
          end
		 end
		  
		  else if(lanes==5'b01000)begin
	       if(Valid_reg[31:0]==32'hffffffff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[31:0];
		    Valid_reg <= Valid_reg >> 32;
		    DataOut_reg<= out_reg[255:0];
		    out_reg<= out_reg >> 256;
	       end
		   else begin
		    if (Valid_reg[31:0]!=0 && Valid_reg[31:0]!=32'hffffffff && Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[255:0];
		     temp_valid<=Valid_reg[31:0];
			 Valid_reg <= Valid_reg >> 32;
			 out_reg<= out_reg >> 256;
			 end
	        read_data_reg<=0;
	        finish<=1;
          end
		  end
		  
		  else if(lanes==5'b10000)begin
	       if(Valid_reg[63:0]==64'hffffffffffffffff || Empty==1)begin
		    ValidOut_reg<=Valid_reg[63:0];
		    Valid_reg <= Valid_reg >> 64;
		    DataOut_reg<= out_reg[511:0];
		    out_reg<= out_reg >> 512;
	       end
		   else begin
		    if (Valid_reg[63:0]!=0 && Valid_reg[63:0]!=64'hffffffffffffffff&& Empty==0) begin
		     flag_reg <= 1;
			 temp_data<=out_reg[511:0];
		     temp_valid<=Valid_reg[63:0];
			 Valid_reg <= Valid_reg >> 64;
			 out_reg<= out_reg >> 512;
			 end
	        read_data_reg<=0;
	        finish<=1;
           end
		  end
		 end
		end
     end
	 /*if (stop_DS)begin
		   DataOut_reg<=32'b00000000100100001000000000001111;
		   ValidOut_reg<=4'b1111;
    end*/
  end
  always@(posedge clk) begin
   if (Gen >= 3'b011) begin
    DataOut<=DataOut_reg;
	ValidOut<=ValidOut_reg;
	DKOut<=64'b0;
    end
  else if (Gen < 3'b011) begin
    DataOut<=0;
ValidOut<=0;
if(~Hold && finishprocessing && |valid_reg )
	begin
		flag2<=0;
		if (ConFlag)
	   begin
			if(((flag1 & (out_valid_mask >>count_temp))==(out_valid_mask >>count_temp) )|| Empty)
			begin 
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
			flag2<=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] & out_data_mask;
			DataOut <=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] & out_data_mask;
			ValidOut<=valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & out_valid_mask;
			DKOut<=DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0] & out_valid_mask;
			data_reg <=data_reg>>ShiftLeftVaLueData;
			valid_reg<=valid_reg>>ShiftLeftValueValid;
			DK<=DK>>ShiftLeftValueValid;
			
		end
		else if (|(flag1&out_valid_mask) & ~Empty)
		begin
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
		   DataOut <=data_reg[MAXPIPEWIDTH*LANESNUMBER-1:0] ;
			ValidOut<=valid_reg[MAXPIPEWIDTH/8*LANESNUMBER-1:0] ;
			DKOut<=DK[MAXPIPEWIDTH/8*LANESNUMBER-1:0];
			data_reg <=0;
			valid_reg<=0;
			DK<=0;
		end
	end
  end
end
 always@(*)begin
  TLP_count=0;
  if (length[4:0]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[9:5]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[14:10]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[19:15]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[24:20]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[29:25]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[34:30]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[39:35]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[44:40]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[49:45]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[54:50]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[59:55]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[64:60]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[69:65]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[74:70]!=5'b0)
   TLP_count=TLP_count+1;
  if (length[79:75]!=5'b0)
   TLP_count=TLP_count+1;
  out_comb=out_reg;
  read_data_comb=read_data_reg;
  Valid_comb=Valid_reg;
  flag_comb=flag_reg;
  if (write_data)begin
      data_reg[640-1:512] = {128{1'b0}};
     data_reg[512-1:0] = DataIn_reg;

    STB_reg[80-1:64] = {16{1'b0}};
    STB_reg[64-1:0] = TLPStart_reg;

  SDB_reg[80-1:64] = {16{1'b0}};
  SDB_reg[64-1:0] = DLLPStart_reg;

 END_reg[80-1:64] = {16{1'b0}};
 END_reg[64-1:0]= PEnd_reg;

  valid_reg[80-1:64]= {16{1'b0}};
  valid_reg[64-1:0]= ValidIn_reg;

 DK=0;
        `stp_sdp(63)
        `stp_sdp(62)
		`stp_sdp(61)
		`stp_sdp(60)
		`stp_sdp(59)
		`stp_sdp(58)
		`stp_sdp(57)
		`stp_sdp(56)
		`stp_sdp(55)
		`stp_sdp(54)
		`stp_sdp(53)
		`stp_sdp(52)
		`stp_sdp(51)
		`stp_sdp(50)
		`stp_sdp(49)
		`stp_sdp(48)
		`stp_sdp(47)
		`stp_sdp(46)
		`stp_sdp(45)
		`stp_sdp(44)
		`stp_sdp(43)
		`stp_sdp(42)
		`stp_sdp(41)
		`stp_sdp(40)
		`stp_sdp(39)
		`stp_sdp(38)
		`stp_sdp(37)
		`stp_sdp(36)
		`stp_sdp(35)
		`stp_sdp(34)
		`stp_sdp(33)
		`stp_sdp(32)
		`stp_sdp(31)
		`stp_sdp(30)
		`stp_sdp(29)
		`stp_sdp(28)
		`stp_sdp(27)
		`stp_sdp(26)
		`stp_sdp(25)
		`stp_sdp(24)
		`stp_sdp(23)
		`stp_sdp(22)
		`stp_sdp(21)
		`stp_sdp(20)
		`stp_sdp(19)
		`stp_sdp(18)
		`stp_sdp(17)
		`stp_sdp(16)
		`stp_sdp(15)
		`stp_sdp(14)
		`stp_sdp(13)
		`stp_sdp(12)
		`stp_sdp(11)
		`stp_sdp(10)
		`stp_sdp(9)
		`stp_sdp(8)
		`stp_sdp(7)
		`stp_sdp(6)
		`stp_sdp(5)
		`stp_sdp(4)
		`stp_sdp(3)
		`stp_sdp(2)
		`stp_sdp(1)
		`stp_sdp(0)
		read_data_comb=1;
		if (flag_comb)begin
		  `FL(0)
		  `FL(1)
		  `FL(2)
          `FL(3)
          `FL(4)
          `FL(5)
          `FL(6)
          `FL(7)
          `FL(8)
          `FL(9)
          `FL(10)
          `FL(11)
          `FL(12)
          `FL(13)
          `FL(14) 
          `FL(15)
          `FL(16)
          `FL(17)
          `FL(18)
          `FL(19)
          `FL(20)
          `FL(21)
          `FL(22)
          `FL(23)
          `FL(24)
          `FL(25)
          `FL(26)
          `FL(27)
          `FL(28)
          `FL(29)
          `FL(30)
          `FL(31)
          `FL(32)
          `FL(33)
          `FL(34)
          `FL(35)
          `FL(36)
          `FL(37)
          `FL(38)
          `FL(39)
          `FL(40)
          `FL(41)
          `FL(42)
          `FL(43)
          `FL(44)
          `FL(45)
          `FL(46)
          `FL(47)
          `FL(48)
          `FL(49)
          `FL(50)
          `FL(51)
          `FL(52)
          `FL(53)
          `FL(54)
          `FL(55)
          `FL(56)
          `FL(57)
          `FL(58)
          `FL(59)
          `FL(60)
          `FL(61)
          `FL(62)
          `FL(63)
          `FL(64)
          `FL(65)
          `FL(66)
          `FL(67)
          `FL(68)
          `FL(69)
          `FL(70)
          `FL(71)
          `FL(72)
          `FL(73)
          `FL(74)
          `FL(75)
          `FL(76)
          `FL(77)
          `FL(78)
          `FL(79)
          `FL(80)   
          `FL(81)
		  `FL(82)
		  `FL(83)
		  `FL(84)
		  `FL(85)
		  `FL(86)
		  `FL(87)
		  `FL(88)
		  `FL(89)
		  `FL(90)
		  `FL(91)
		  `FL(92)
		  `FL(93)
		  `FL(94)
		  `FL(95)
		  `FL(96)
		  `FL(97)
		  `FL(98)
		  `FL(99)
		  `FL(100)
		  `FL(101)
		  `FL(102)
		  `FL(103)
		  `FL(104)
		  `FL(105)
		  `FL(106)
		  `FL(107)
		  `FL(108)
		  `FL(109)
		  `FL(110)
		  `FL(111)
		  `FL(112)
		  `FL(113)
		  `FL(114)
		  `FL(115)
		  `FL(116)
		  `FL(117)
		  `FL(118)
		  `FL(119)
		  `FL(120)
		  `FL(121)
		  `FL(122)
		  `FL(123)
		  `FL(124)
		  `FL(125)
		  `FL(126)
		  `FL(127)	
          flag_comb=0;		  
	    end
	  end 
	end
  endmodule
   
   
 
 
 
 
 
 

