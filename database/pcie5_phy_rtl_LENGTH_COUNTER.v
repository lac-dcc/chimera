module LENGTH_COUNTER (pclk,data_in,DetectedLanes,wr,wr_valid,STP_IN,SDP_IN,END_IN,gen,length,data_out,wr_out,wr_valid_out,STP_out,SDP_out,END_out);
input[511:0]data_in;
input wr;
input pclk;
input[2:0]gen;
input[63:0]SDP_IN;
input[63:0] STP_IN;
input[63:0] END_IN;
input[63:0]wr_valid;
input[15:0]DetectedLanes;
output reg[511:0]data_out;
output reg wr_out;
output reg[63:0]SDP_out;
output reg[63:0] STP_out;
output reg[63:0] END_out;
output reg[63:0]wr_valid_out;
output reg [79:0] length;
reg start;
reg wr_length;
reg [4:0] finish;
reg [4:0] count;
reg [1:0] dword;
reg [4:0] length1;
reg [4:0] length2;
reg [4:0] length3;
reg [4:0] length4;
reg [4:0] length5;
reg [4:0] length6;
reg [4:0] length7;
reg [4:0] length8;
reg [4:0] length9;
reg [4:0] length10;
reg [4:0] length11;
reg [4:0] length12;
reg [4:0] length13;
reg [4:0] length14;
reg [4:0] length15;
reg [4:0] length16;
integer i;
always @(posedge pclk)begin
length<={length16,length15,length14,length13,length12,length11,length10,length9,length8,length7,length6,length5,length4,length3,length2,length1};
data_out<=data_in;
SDP_out<=SDP_IN;
STP_out<=STP_IN;
END_out<=END_IN;
wr_out<=wr;
wr_valid_out<=wr_valid;
end
always@(*)begin
 start=1'b0;
 count=5'b0;
 dword=2'b0;
 wr_length=1'b0;
 finish=5'b0;
 length1=5'b0;
 length2=5'b0;
 length3=5'b0;
 length4=5'b0;
 length5=5'b0;
 length6=5'b0;
 length7=5'b0;
 length8=5'b0;
 length9=5'b0;
 length10=5'b0;
 length11=5'b0;
 length12=5'b0;
 length13=5'b0;
 length14=5'b0;
 length15=5'b0;
 length16=5'b0;
 i=0; 
 //countcount_reg
 if (gen==3'b011 || gen==3'b100 || gen== 3'b101 )begin
 for(i=0;i<64;i=i+1)begin
    if (STP_IN[i])begin
	 start=1'b1;
	 count=5'b0;
	end
	
	if(start)begin
	 if (dword==2'b11)
	 count=count+1;
	dword=dword+1;
	end
	
	if(END_IN[i])begin
	 start=1'b0;
	 finish=finish+1;
	 wr_length=1'b1;
	end
	
	if (finish==5'b00001 && wr_length==1'b1) begin
	 length1=count;
	 wr_length=1'b0;
	 end
	 
	else if (finish==5'b00010 && wr_length==1'b1)begin
	 length2=count;
	 wr_length=1'b0;
	 end
	 
    else if (finish==5'b00011 && wr_length==1'b1)begin
	 length3=count;
	 wr_length=1'b0;
	 end
	 
    else if (finish==5'b00100 && wr_length==1'b1)begin
	 length4=count;	 
	 wr_length=1'b0;
	 end
	 
	else if (finish==5'b00101 && wr_length==1'b1)begin
	 length5=count;
	 wr_length=1'b0;
	 end
	 
	else if (finish==5'b00110 && wr_length==1'b1)begin
	 length6=count;
	 wr_length=1'b0;
	 end
	 
	else if (finish==5'b00111 && wr_length==1'b1)begin
	 length7=count;
	 wr_length=1'b0;
	 end
	 
	else if (finish==5'b01000 && wr_length==1'b1)begin
	 length8=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01001 && wr_length==1'b1)begin
	 length9=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01010 && wr_length==1'b1)begin
	 length10=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01011 && wr_length==1'b1)begin
	 length11=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01100 && wr_length==1'b1)begin
	 length12=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01101 && wr_length==1'b1)begin
	 length13=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01110 && wr_length==1'b1)begin
	 length14=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b01111 && wr_length==1'b1)begin
	 length15=count;
	 wr_length=1'b0;
	 end	 
	 
	 else if (finish==5'b10000 && wr_length==1'b1)begin
	 length16=count;
	 wr_length=1'b0;
	 end	 
 end
 end
end
endmodule

