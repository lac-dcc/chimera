module OS_GENERATOR #
(parameter GEN1_PIPEWIDTH=16,parameter GEN2_PIPEWIDTH=16,parameter GEN3_PIPEWIDTH=16,parameter GEN4_PIPEWIDTH=8,parameter GEN5_PIPEWIDTH=32,
parameter no_of_lanes=16
)
(pclk, reset_n, os_type, lane_number, link_number, rate, loopback , detected_lanes, gen, start,EQ,EC,reset_EIEOS_count,tx_preset,rx_preset,use_preset_coeff,FS,LF,pre_cursor_coeff,cursor_coeff,post_cursor_coeff,rej_coeff,req_eq,speed_change, finish, Os_Out, DataK, busy, DataValid);
parameter LANESNUMBER=no_of_lanes;
input EQ;
input [2:0] os_type;
input [1:0]lane_number;
input [7:0]link_number;
input [2:0] rate;
input loopback;
input [no_of_lanes-1:0]detected_lanes;
input [2:0] gen;
input start;
input pclk;
input reset_n;
input [1:0]EC;
input reset_EIEOS_count;
input [4*no_of_lanes-1:0]tx_preset;
input [3*no_of_lanes-1:0]rx_preset;
input [no_of_lanes-1:0] use_preset_coeff;
input [6*no_of_lanes-1:0]FS;
input [6*no_of_lanes-1:0]LF;
input [6*no_of_lanes-1:0]pre_cursor_coeff;
input [6*no_of_lanes-1:0]cursor_coeff;
input [6*no_of_lanes-1:0]post_cursor_coeff;
input [no_of_lanes-1:0]rej_coeff;
input req_eq;
input speed_change;
output reg busy;
output reg finish;
output reg [511:0] Os_Out;
output reg [63:0]DataK;
output reg [63:0]DataValid;
reg send;
reg [2:0] os_type_reg;
reg [1:0] lane_number_reg;
reg [no_of_lanes-1:0]detected_lanes_reg;
reg [2:0] gen_reg;
reg [63:0]tx_preset_comb;
reg [47:0]rx_preset_comb;
reg [15:0] use_preset_coeff_comb;
reg [95:0]FS_comb;
reg [95:0]LF_comb;
reg [95:0]pre_cursor_coeff_comb;
reg [95:0]cursor_coeff_comb;
reg [95:0]post_cursor_coeff_comb;
reg [15:0]rej_coeff_comb;
reg [3:0] symbol;
reg [4:0] count;
reg D;
reg K;
reg valid;
reg not_valid;
reg [31:0] skp;
reg [31:0] EIOS;
reg [127:0] TS1;
reg [127:0] TS2;
reg [5:0]PIPE; 
reg [23:0] skp_G3;
reg [7:0] EIOS_G3;
reg [15:0] SDS;
reg [7:0] EIEOS;
reg [127:0] temp1;
reg [127:0] temp2;
reg [127:0] temp3;
reg [127:0] temp4;
reg [127:0] temp1_comb;
reg [127:0] temp2_comb;
reg [127:0] temp3_comb;
reg [127:0] temp4_comb;
always @(*)begin
 tx_preset_comb=0;
 rx_preset_comb=0;
 use_preset_coeff_comb=0;
 FS_comb=0;
 LF_comb=0;
 pre_cursor_coeff_comb=0;
 cursor_coeff_comb=0;
 post_cursor_coeff_comb=0;
 rej_coeff_comb=0;
 temp1_comb=0;
 temp2_comb=0;
 temp3_comb=0;
 temp4_comb=0;
  
 if(start)begin
	//$display("If start"); 
  if(gen==3'b001||gen==3'b010 ) begin
	//$display("If gen");   
    tx_preset_comb=tx_preset;
    rx_preset_comb=rx_preset;
	if(EQ)begin
	 //$display("If EQ");		 
     temp1_comb[7:0]={1'b1,tx_preset_comb[3:0],rx_preset_comb[2:0]};
     temp1_comb[15:8]={1'b1,tx_preset_comb[7:4],rx_preset_comb[5:3]};
     temp1_comb[23:16]={1'b1,tx_preset_comb[11:8],rx_preset_comb[8:6]};
     temp1_comb[31:24]={1'b1,tx_preset_comb[15:12],rx_preset_comb[11:9]};
     temp1_comb[39:32]={1'b1,tx_preset_comb[19:16],rx_preset_comb[14:12]};
     temp1_comb[47:40]={1'b1,tx_preset_comb[23:20],rx_preset_comb[17:15]};
     temp1_comb[55:48]={1'b1,tx_preset_comb[27:24],rx_preset_comb[20:18]};
     temp1_comb[63:56]={1'b1,tx_preset_comb[31:28],rx_preset_comb[23:21]};
     temp1_comb[71:64]={1'b1,tx_preset_comb[35:32],rx_preset_comb[26:24]};
     temp1_comb[79:72]={1'b1,tx_preset_comb[39:36],rx_preset_comb[29:27]};
     temp1_comb[87:80]={1'b1,tx_preset_comb[43:40],rx_preset_comb[32:30]};
     temp1_comb[95:88]={1'b1,tx_preset_comb[47:44],rx_preset_comb[35:33]};
     temp1_comb[103:96]={1'b1,tx_preset_comb[51:48],rx_preset_comb[38:36]};
     temp1_comb[111:104]={1'b1,tx_preset_comb[55:52],rx_preset_comb[41:39]};
     temp1_comb[119:112]={1'b1,tx_preset_comb[59:56],rx_preset_comb[44:42]};
     temp1_comb[127:120]={1'b1,tx_preset_comb[63:60],rx_preset_comb[47:45]};
    end
   else
   begin
	   //$display("If eq = 0"); 
	temp1_comb={no_of_lanes{8'h4A}};
   end
   
	
  if(EQ)begin	 
   temp2_comb[7:0]={EQ,tx_preset_comb[3:0],rx_preset_comb[2:0]};
   temp2_comb[15:8]={EQ,tx_preset_comb[7:4],rx_preset_comb[5:3]};
   temp2_comb[23:16]={EQ,tx_preset_comb[11:8],rx_preset_comb[8:6]};
   temp2_comb[31:24]={EQ,tx_preset_comb[15:12],rx_preset_comb[11:9]};
   temp2_comb[39:32]={EQ,tx_preset_comb[19:16],rx_preset_comb[14:12]};
   temp2_comb[47:40]={EQ,tx_preset_comb[23:20],rx_preset_comb[17:15]};
   temp2_comb[55:48]={EQ,tx_preset_comb[27:24],rx_preset_comb[20:18]};
   temp2_comb[63:56]={EQ,tx_preset_comb[31:28],rx_preset_comb[23:21]};
   temp2_comb[71:64]={EQ,tx_preset_comb[35:32],rx_preset_comb[26:24]};
   temp2_comb[79:72]={EQ,tx_preset_comb[39:36],rx_preset_comb[29:27]};
   temp2_comb[87:80]={EQ,tx_preset_comb[43:40],rx_preset_comb[32:30]};
   temp2_comb[95:88]={EQ,tx_preset_comb[47:44],rx_preset_comb[35:33]};
   temp2_comb[103:96]={EQ,tx_preset_comb[51:48],rx_preset_comb[38:36]};
   temp2_comb[111:104]={EQ,tx_preset_comb[55:52],rx_preset_comb[41:39]};
   temp2_comb[119:112]={EQ,tx_preset_comb[59:56],rx_preset_comb[44:42]};
   temp2_comb[127:120]={EQ,tx_preset_comb[63:60],rx_preset_comb[47:45]};
   end
   else 
	temp2_comb={no_of_lanes{8'h4A}};
  end
  else if (gen==3'b011 || gen== 3'b100 || gen==3'b101) begin
$display("second condition"); 	   
   tx_preset_comb=tx_preset;
   use_preset_coeff_comb=use_preset_coeff;
   FS_comb=FS;
   LF_comb=LF;
   pre_cursor_coeff_comb=pre_cursor_coeff;
   cursor_coeff_comb=cursor_coeff;
   post_cursor_coeff_comb=post_cursor_coeff;
   rej_coeff_comb=rej_coeff;
   temp2_comb=128'b0;
   temp3_comb=128'b0;
   temp4_comb=128'b0;
   temp1_comb[7:0]={use_preset_coeff_comb[0],tx_preset_comb[3:0],reset_EIEOS_count,EC};
   temp1_comb[15:8]={use_preset_coeff_comb[1],tx_preset_comb[7:4],reset_EIEOS_count,EC};
   temp1_comb[23:16]={use_preset_coeff_comb[2],tx_preset_comb[11:8],reset_EIEOS_count,EC};
   temp1_comb[31:24]={use_preset_coeff_comb[3],tx_preset_comb[15:12],reset_EIEOS_count,EC};
   temp1_comb[39:32]={use_preset_coeff_comb[4],tx_preset_comb[19:16],reset_EIEOS_count,EC};
   temp1_comb[47:40]={use_preset_coeff_comb[5],tx_preset_comb[23:20],reset_EIEOS_count,EC};
   temp1_comb[55:48]={use_preset_coeff_comb[6],tx_preset_comb[27:24],reset_EIEOS_count,EC};
   temp1_comb[63:56]={use_preset_coeff_comb[7],tx_preset_comb[31:28],reset_EIEOS_count,EC};
   temp1_comb[71:64]={use_preset_coeff_comb[8],tx_preset_comb[35:32],reset_EIEOS_count,EC};
   temp1_comb[79:72]={use_preset_coeff_comb[9],tx_preset_comb[39:36],reset_EIEOS_count,EC};
   temp1_comb[87:80]={use_preset_coeff_comb[10],tx_preset_comb[43:40],reset_EIEOS_count,EC};
   temp1_comb[95:88]={use_preset_coeff_comb[11],tx_preset_comb[47:44],reset_EIEOS_count,EC};
   temp1_comb[103:96]={use_preset_coeff_comb[12],tx_preset_comb[51:48],reset_EIEOS_count,EC};
   temp1_comb[111:104]={use_preset_coeff_comb[13],tx_preset_comb[55:52],reset_EIEOS_count,EC};
   temp1_comb[119:112]={use_preset_coeff_comb[14],tx_preset_comb[59:56],reset_EIEOS_count,EC};
   temp1_comb[127:120]={use_preset_coeff_comb[15],tx_preset_comb[63:60],reset_EIEOS_count,EC};
   if (EC==2'b01) begin
   temp2_comb[5:0]=FS_comb[5:0];
   temp2_comb[13:8]=FS_comb[11:6];
   temp2_comb[21:16]=FS_comb[17:12];
   temp2_comb[29:24]=FS_comb[23:18];
   temp2_comb[37:32]=FS_comb[29:24];
   temp2_comb[45:40]=FS_comb[35:30];
   temp2_comb[53:48]=FS_comb[41:36];
   temp2_comb[61:56]=FS_comb[47:42];
   temp2_comb[69:64]=FS_comb[53:48];
   temp2_comb[77:72]=FS_comb[59:54];
   temp2_comb[85:80]=FS_comb[65:60];
   temp2_comb[93:88]=FS_comb[71:66];
   temp2_comb[101:96]=FS_comb[77:72];
   temp2_comb[109:104]=FS_comb[83:78];
   temp2_comb[117:112]=FS_comb[89:84];
   temp2_comb[125:120]=FS_comb[95:90];
   temp3_comb[5:0]=LF_comb[5:0];
   temp3_comb[13:8]=LF_comb[11:6];
   temp3_comb[21:16]=LF_comb[17:12];
   temp3_comb[29:24]=LF_comb[23:18];
   temp3_comb[37:32]=LF_comb[29:24];
   temp3_comb[45:40]=LF_comb[35:30];
   temp3_comb[53:48]=LF_comb[41:36];
   temp3_comb[61:56]=LF_comb[47:42];
   temp3_comb[69:64]=LF_comb[53:48];
   temp3_comb[77:72]=LF_comb[59:54];
   temp3_comb[85:80]=LF_comb[65:60];
   temp3_comb[93:88]=LF_comb[71:66];
   temp3_comb[101:96]=LF_comb[77:72];
   temp3_comb[109:104]=LF_comb[83:78];
   temp3_comb[117:112]=LF_comb[89:84];
   temp3_comb[125:120]=LF_comb[95:90];
   end
   else begin 
   temp2_comb[5:0]=pre_cursor_coeff_comb[5:0];
   temp2_comb[13:8]=pre_cursor_coeff_comb[11:6];
   temp2_comb[21:16]=pre_cursor_coeff_comb[17:12];
   temp2_comb[29:24]=pre_cursor_coeff_comb[23:18];
   temp2_comb[37:32]=pre_cursor_coeff_comb[29:24];
   temp2_comb[45:40]=pre_cursor_coeff_comb[35:30];
   temp2_comb[53:48]=pre_cursor_coeff_comb[41:36];
   temp2_comb[61:56]=pre_cursor_coeff_comb[47:42];
   temp2_comb[69:64]=pre_cursor_coeff_comb[53:48];
   temp2_comb[77:72]=pre_cursor_coeff_comb[59:54];
   temp2_comb[85:80]=pre_cursor_coeff_comb[65:60];
   temp2_comb[93:88]=pre_cursor_coeff_comb[71:66];
   temp2_comb[101:96]=pre_cursor_coeff_comb[77:72];
   temp2_comb[109:104]=pre_cursor_coeff_comb[83:78];
   temp2_comb[117:112]=pre_cursor_coeff_comb[89:84];
   temp2_comb[125:120]=pre_cursor_coeff_comb[95:90];
   temp3_comb[5:0]=cursor_coeff_comb[5:0];
   temp3_comb[13:8]=cursor_coeff_comb[11:6];
   temp3_comb[21:16]=cursor_coeff_comb[17:12];
   temp3_comb[29:24]=cursor_coeff_comb[23:18];
   temp3_comb[37:32]=cursor_coeff_comb[29:24];
   temp3_comb[45:40]=cursor_coeff_comb[35:30];
   temp3_comb[53:48]=cursor_coeff_comb[41:36];
   temp3_comb[61:56]=cursor_coeff_comb[47:42];
   temp3_comb[69:64]=cursor_coeff_comb[53:48];
   temp3_comb[77:72]=cursor_coeff_comb[59:54];
   temp3_comb[85:80]=cursor_coeff_comb[65:60];
   temp3_comb[93:88]=cursor_coeff_comb[71:66];
   temp3_comb[101:96]=cursor_coeff_comb[77:72];
   temp3_comb[109:104]=cursor_coeff_comb[83:78];
   temp3_comb[117:112]=cursor_coeff_comb[89:84];
   temp3_comb[125:120]=cursor_coeff_comb[95:90];
   end
   temp4_comb[6:0]={rej_coeff_comb[0],post_cursor_coeff_comb[5:0]};
   temp4_comb[14:8]={rej_coeff_comb[1],post_cursor_coeff_comb[11:6]};
   temp4_comb[22:16]={rej_coeff_comb[2],post_cursor_coeff_comb[17:12]};
   temp4_comb[30:24]={rej_coeff_comb[3],post_cursor_coeff_comb[23:18]};
   temp4_comb[38:32]={rej_coeff_comb[4],post_cursor_coeff_comb[29:24]};
   temp4_comb[46:40]={rej_coeff_comb[5],post_cursor_coeff_comb[35:30]};
   temp4_comb[54:48]={rej_coeff_comb[6],post_cursor_coeff_comb[41:36]};
   temp4_comb[62:56]={rej_coeff_comb[7],post_cursor_coeff_comb[47:42]};
   temp4_comb[70:64]={rej_coeff_comb[8],post_cursor_coeff_comb[53:48]};
   temp4_comb[78:72]={rej_coeff_comb[9],post_cursor_coeff_comb[59:54]};
   temp4_comb[86:80]={rej_coeff_comb[10],post_cursor_coeff_comb[65:60]};
   temp4_comb[94:88]={rej_coeff_comb[11],post_cursor_coeff_comb[71:66]};
   temp4_comb[102:96]={rej_coeff_comb[12],post_cursor_coeff_comb[77:72]};
   temp4_comb[110:104]={rej_coeff_comb[13],post_cursor_coeff_comb[83:78]};
   temp4_comb[118:112]={rej_coeff_comb[14],post_cursor_coeff_comb[89:84]};
   temp4_comb[126:120]={rej_coeff_comb[15],post_cursor_coeff_comb[95:90]};
   end
  end
  end
  	
always@(posedge pclk,negedge reset_n) begin
 if ( reset_n == 1'b0) begin
   valid <= 1'b1;//represents that data is valid
   not_valid <= 1'b0;//represents that data isn't valid
   finish <=1'b0;
   busy<=1'b0;
   Os_Out<=512'b0;
   DataK<=64'b0;
   DataValid<=64'b0;
   end
 if (start) begin 
  if(gen==3'b001)  
    PIPE<=GEN1_PIPEWIDTH;
   else if(gen==3'b010)
    PIPE<=GEN2_PIPEWIDTH;
   else if(gen==3'b011)  
    PIPE<=GEN3_PIPEWIDTH;
   else if(gen==3'b100)
    PIPE<=GEN4_PIPEWIDTH;
   else if (gen==3'b101)
    PIPE<=GEN5_PIPEWIDTH;
   count<=no_of_lanes;
  if(gen==3'b001||gen==3'b010 ) begin // Generation 1&2
   temp1<=temp1_comb;
   temp2<=temp2_comb;
   temp3<=temp3_comb;
   temp4<=temp4_comb;
   os_type_reg <= os_type; // storing the type of the order set
   lane_number_reg <= lane_number; // storing the type of lanes 
   gen_reg <= gen; // storing the PCIe generation 
   symbol <= 4'b0000; // flag which detects which symbol to be sent 
   send <= 1'b1; // in order to know that there will be an order to send
   busy<=1'b1;
   //count <= 5'b00000; // counter which countes the number of lanes detected
   D <= 1'b0;//reperesents the order sets is D character
   K <= 1'b1;//represents that the order set is K character
   //temp1<=128'b0;
   // preparation of the order set based on the inputs coming from the Tx LTSSM
   skp <= 32'h1C1C1CBC;
   EIOS <= 32'h7C7C7CBC;
   TS1[7:0] <= 8'hBC;
   if (link_number==8'b00000000)
    TS1[15:8] <= 8'hF7;
	
   else 
    TS1[15:8] <= link_number;
   TS1[23:16]<=8'b0;
	
   TS1[31:24] <= 8'b0000000;
   if ( rate == 3'b001) 
     TS1[38:32] <= 7'b0000010;
	
   else if ( rate == 3'b010) 
     TS1[38:32] <= 7'b0000110;
	 
   else if ( rate == 3'b011) 
     TS1[38:32] <= 7'b0001110;
	 
   else if ( rate == 3'b100) 
     TS1[38:32] <= 7'b0011110;
	 
   else  
     TS1[38:32] <= 7'b0111110;
   TS1[39]<=speed_change;
	 
   if(loopback)
     TS1[47:40] <= 8'b00000100;
	 
   else
     TS1[47:40] <= 8'b00000000;
	
   TS1[127:56] <= 72'h4A4A4A4A4A4A4A4A4A;
   
   TS2[7:0] <= 8'hBC;
   if (link_number==8'b00000000)
    TS2[15:8] <= 8'hF7;
   else 
    TS2[15:8] <= link_number;
	
   TS2[31:24] <= 8'b0000000;
   if ( rate == 3'b001) 
     TS2[38:32] <= 7'b0000010;
	
   else if ( rate == 3'b010) 
     TS2[38:32] <= 7'b0000110;
	 
   else if ( rate == 3'b011) 
     TS2[38:32] <= 7'b0001110;
	 
	 
   else if ( rate == 3'b100) 
     TS2[38:32] <= 7'b0011110;
	 
   else  
     TS2[38:32] <= 7'b0111110;
   TS2[39]<=speed_change; 
   if(loopback)
     TS2[47:40] <= 8'b00000100;
	 
   else
     TS2[47:40] <= 8'b00000000;
	TS2[127:56] <= 72'h454545454545454545;
   end
   
  else if (gen==3'b011 || gen== 3'b100 || gen==3'b101) begin //Generation 3&4&5
   os_type_reg <= os_type; // storing the type of the order set
   lane_number_reg <= lane_number; // storing the type of lanes 
   gen_reg <= gen; // storing the PCIe generation 
   send <= 1'b1;
   busy<=1'b1;
   /*tx_preset_comb<=0;
   tx_preset_comb<=tx_preset;
   use_preset_coeff_comb<=0;
   use_preset_coeff_comb<=use_preset_coeff;
   FS_comb<=0;
   FS_comb<=FS;
   LF_comb<=0;
   LF_comb<=LF;
   pre_cursor_coeff_comb<=0;
   pre_cursor_coeff_comb<=pre_cursor_coeff;
   cursor_coeff_comb<=0;
   cursor_coeff_comb<=cursor_coeff;
   post_cursor_coeff_comb<=0;
   post_cursor_coeff_comb<=post_cursor_coeff;
   rej_coeff_comb<=0;
   rej_coeff_comb<=rej_coeff;*/
   symbol <= 4'b0000; // flag which detects which symbol to be sent 
   //send <= 1'b1; // in order to know that there will be an order to send
   //count<=no_of_lanes;
   skp_G3<=24'h00E1AA;
   EIOS_G3<=8'h66;
   EIEOS<=8'h00;
   SDS<=16'h55E1;
   temp1<=temp1_comb;
   temp2<=temp2_comb;
   temp3<=temp3_comb;
   temp4<=temp4_comb;
   TS1[7:0]<=8'h1E;
   if (link_number==8'b00000000)
    TS1[15:8] <= 8'hF7;
	
   else 
    TS1[15:8] <= link_number;
   TS1[23:16]<=8'b0;
   TS1[31:24]<=8'b0;
   if ( rate == 3'b001) 
     TS1[38:32] <= 7'b0000010;
	
   else if ( rate == 3'b010) 
     TS1[38:32] <= 7'b0000110;
	 
   else if ( rate == 3'b011) 
     TS1[38:32] <= 7'b0001110;
	 
   else if ( rate == 3'b100) 
     TS1[38:32] <= 7'b0011110;
	 
   else  
     TS1[38:32] <= 7'b0111110;
   TS1[39]<=speed_change;   
   if(loopback)
     TS1[47:40] <= 8'b00000100;
	 
   else
     TS1[47:40] <= 8'b00000000;
   TS1[55:48]<=8'h4A;
   
   TS2[7:0]<=8'h2D;
   if (link_number==8'b00000000)
    TS2[15:8] <= 8'hF7;
	
   else 
    TS2[15:8] <= link_number;
   TS2[23:16]<=8'b0;
   TS2[31:24]<=8'b0;
   if ( rate == 3'b001) 
     TS2[38:32] <= 7'b0000010;
	
   else if ( rate == 3'b010) 
     TS2[38:32] <= 7'b0000110;
	 
   else if ( rate == 3'b011) 
     TS2[38:32] <= 7'b0001110;
	 
   else if ( rate == 3'b100) 
     TS2[38:32] <= 7'b0011110;
	 
   else  
     TS2[38:32] <= 7'b0111110;
   TS2[39]<=speed_change;   
   if(loopback)
     TS2[47:40] <= 8'b00000100;
	 
   else
     TS2[47:40] <= 8'b00000000; 
   TS2[54:48]<=7'b0;
   TS2[55]<=req_eq;
   TS2[63:56]<=8'h45;
   end  
  end
  //************************************************GENERATION 1&2*********************************************************************************************
  // *******************************************pipewidth=8************************************************************************
   if (PIPE==6'b001000 && (gen_reg==3'b001||gen_reg==3'b010))begin
	if(send)begin//if there are order sets available to be sent
	  finish<=1'b0;
	  DataValid <= {no_of_lanes{valid}};
	  // ******************************************************checking if TS1 order sets to be sent********************************************
	  if (os_type_reg==3'b000)begin
	    
		  if(symbol==4'b0000)begin // checking if symbol 0 is to be sent
		    Os_Out <={no_of_lanes{TS1[7:0]}};
			DataK <={no_of_lanes{K}};
			end
			
		  else if(symbol==4'b0001) begin // checking if symbol 1 is to be sent
		    Os_Out <={no_of_lanes{TS1[15:8]}};
			
			if (TS1[15:8] == 8'hF7)
              DataK <={no_of_lanes{K}};
			  
	        else 
			   DataK <={no_of_lanes{D}};
		     
			end
				
		  else if(symbol==4'b0010)begin // checking if symbol 2 is to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)begin
			     Os_Out <= 8'hF7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'hF7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'hF7F7F7F7F7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			  else begin
			     Os_Out <= 128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
			 end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= 8'h00;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'h03020100;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'h0706050403020100;
				 DataK <={no_of_lanes{D}};
				 end
				 
			 else begin
			     Os_Out <= 128'h0F0E0D0C0B0A09080706050403020100;
				 DataK <= {no_of_lanes{D}};
				 end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= 8'h01;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'h01020304;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'h0102030405060708;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else begin
			     Os_Out <= 128'h0102030405060708090A0B0C0D0E0F10;
				 DataK <={no_of_lanes{D}};
				 end
			 end
			end
			
	       else if(symbol==4'b0011) begin // checking if symbol 3 is to be sent
		    Os_Out <={no_of_lanes{TS1[31:24]}};
			DataK <={no_of_lanes{D}};
			end
			
		else if(symbol==4'b0100) begin // checking if symbol 4 is to be sent
		    Os_Out <={no_of_lanes{TS1[39:32]}};
			DataK <={no_of_lanes{D}};
			end
		
	    else if(symbol==4'b0101) begin // checking if symbol 5 is to be sent
		    Os_Out <={no_of_lanes{TS1[47:40]}};
			DataK <={no_of_lanes{D}};
			end
			
		else if (symbol==4'b0110)begin	// checking if symbol 6 to be sent
		       if (count==5'b00001)
			     Os_Out <= temp1[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp1[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp1[63:0];
				 
			   else 
			     Os_Out<= temp1[127:0];
			  DataK <={no_of_lanes{D}};
			end
		     
			
		else if(symbol==4'b0111||symbol==4'b1000||symbol==4'b1001||symbol==4'b1010||symbol==4'b1011||symbol==4'b1100||symbol==4'b1101||symbol==4'b1110) begin // checking if symbol  7 or 8 or 9 or 10 or 11 or 12 or 13 or 14  is to be sent
		    Os_Out <={no_of_lanes{TS1[63:56]}};
			DataK <={no_of_lanes{D}};
			end
			
		else  begin
		    Os_Out <={no_of_lanes{TS1[127:120]}};// checking if symbol 15 is to be sent
			DataK <={no_of_lanes{D}};
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+1; 
		  end 
		 
		  // ******************************************************checking if TS2 order sets to be sent********************************************
      else if (os_type_reg==3'b001)begin
		
		  if(symbol==4'b0000)begin // checking if symbol 0 is to be sent
		    Os_Out <={no_of_lanes{TS2[7:0]}};
			DataK <={no_of_lanes{K}};
			end
			
		  else if(symbol==4'b0001) begin // checking if symbol 1 is to be sent
		    Os_Out <={no_of_lanes{TS2[15:8]}};
			
			if (TS2[15:8] == 8'hF7)
              DataK <={no_of_lanes{K}};
			  
	        else 
			   DataK <={no_of_lanes{D}};
			
			end
				
		  else if(symbol==4'b0010)begin // checking if symbol 2 is to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)begin
			     Os_Out <= 8'hF7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'hF7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'hF7F7F7F7F7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
				 
			  else begin
			     Os_Out <= 128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7;
				 DataK <={no_of_lanes{K}};
				 end
			 end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= 8'h00;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'h03020100;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'h0706050403020100;
				 DataK <={no_of_lanes{D}};
				 end
				 
			 else begin
			     Os_Out <= 128'h0F0E0D0C0B0A09080706050403020100;
				 DataK <={no_of_lanes{D}};
				 end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= 8'h01;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= 32'h01020304;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= 64'h0102030405060708;
				 DataK <={no_of_lanes{D}};
				 end
				 
			   else begin
			     Os_Out <= 128'h0102030405060708090A0B0C0D0E0F10;
				 DataK <={no_of_lanes{D}};
				 end
			 end
			end
			
	       else if(symbol==4'b0011) begin // checking if symbol 3 is to be sent
		    Os_Out <={no_of_lanes{TS2[31:24]}};
			DataK <={no_of_lanes{D}};
			end
			
		else if(symbol==4'b0100) begin // checking if symbol 4 is to be sent
		    Os_Out <={no_of_lanes{TS2[39:32]}};
			DataK <={no_of_lanes{D}};
			end
		
	    else if(symbol==4'b0101) begin // checking if symbol 5 is to be sent
		    Os_Out<={no_of_lanes{TS2[47:40]}};
			DataK <={no_of_lanes{D}};
			end
			
		else if(symbol==4'b0110) begin // checking if symbol 6 is to be sent
		       if (count==5'b00001)
			     Os_Out <= temp2[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp2[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp2[63:0];
				 
			   else 
			     Os_Out<= temp2[127:0];
			  DataK <={no_of_lanes{D}};
			end
			
		else if(symbol==4'b0111||symbol==4'b1000||symbol==4'b1001||symbol==4'b1010||symbol==4'b1011||symbol==4'b1100||symbol==4'b1101||symbol==4'b1110) begin // checking if symbol  7 or 8 or 9 or 10 or 11 or 12 or 13 or 14  is to be sent
		    Os_Out <={no_of_lanes{TS2[63:56]}};
			DataK <={no_of_lanes{D}};
			end
			
		else  begin // checking if symbol 15 is to be sent
		    Os_Out<={no_of_lanes{TS2[127:120]}};
			DataK<={no_of_lanes{D}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
		    end
			 symbol<=symbol+1; 
		  end 
		   // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin
		
		  if(symbol==4'b0000)begin // checking if symbol 0 is to be sent
		    Os_Out<={no_of_lanes{skp[7:0]}};
			DataK<={no_of_lanes{K}};
			end
			
		  else if(symbol==4'b0001) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{skp[15:8]}};
			DataK<={no_of_lanes{K}};
			end
			
			else if(symbol==4'b0010) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{skp[23:16]}};
			DataK<={no_of_lanes{K}};
			end
			
			else if(symbol==4'b0011) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{skp[31:24]}};
			DataK<={no_of_lanes{K}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+1; 
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		
		  if(symbol==4'b0000)begin // checking if symbol 0 is to be sent
		    Os_Out<={no_of_lanes{EIOS[7:0]}};
			DataK<={no_of_lanes{K}};
			end
			
		  else if(symbol==4'b0001) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{EIOS[15:8]}};
			DataK<={no_of_lanes{K}};
			end
			
			else if(symbol==4'b0010) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{EIOS[23:16]}};
			DataK<={no_of_lanes{K}};
			end
			
			else if(symbol==4'b0011) begin // checking if symbol 1 is to be sent
		    Os_Out<={no_of_lanes{EIOS[31:24]}};
			DataK<={no_of_lanes{K}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+1; 
		   end
		   // ******************************************************checking if IDLE to be sent********************************************
		 else begin
		   if (symbol!=4'b1111) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+1;
		  end
		 end
		else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{not_valid}};
		  DataK<= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
		end
	// *******************************************pipewidth=16************************************************************************
	else if(PIPE==6'b010000 && (gen_reg==3'b001||gen_reg==3'b010))begin
	  if(send)begin
	   finish<=1'b0;
	   DataValid <= {{no_of_lanes{valid}},{no_of_lanes{valid}}};
       //*****************************************checking if TS1 order sets to be sent*******************************************
	     if (os_type_reg==3'b000)begin
		
		  if(symbol==4'b0000)begin // checking if symbols 0,1 are to be sent
		    Os_Out <={{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
			if (TS1[15:8] == 8'hF7)
              DataK <={{no_of_lanes{K}},{no_of_lanes{K}}};  
	        else 
			  DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
			end
				
		  else if(symbol==4'b0010)begin // checking if symbols 2,3 are to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'hF7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'hF7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'hF7F7F7F7F7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			  else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
			 end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'h00}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'h03020100}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'h0706050403020100}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			 else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'h0F0E0D0C0B0A09080706050403020100}};
				 DataK <= {{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'h01}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'h01020304}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'h0102030405060708}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'h0102030405060708090A0B0C0D0E0F10}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
			 end
			end
			
			
		else if(symbol==4'b0100) begin // checking if symbols 4,5 are to be sent
		    Os_Out <={{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else if (symbol==4'b0110) begin //checking if symbols 6,7 are to be sent
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[7:0]}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[31:0]}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[63:0]}};
				 
			   else 
			     Os_Out<= {{no_of_lanes{TS1[63:56]}},{temp1[127:0]}};
			  DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			 end
			  
		else if(symbol==4'b1000||symbol==4'b1010||symbol==4'b1100) begin // checking if symbols 8,9 or 10,11 or 12,13 are to be sent
		    Os_Out <={{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else  begin
		    Os_Out <={{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}}};// checking if symbols 14,15 are to be sent
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+2; 
		  end 
		  //*****************************************checking if TS2 order sets to be sent*******************************************
	     else if (os_type_reg==3'b001)begin
		
		  if(symbol==4'b0000)begin // checking if symbols 0,1 are to be sent
		    Os_Out <={{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
			if (TS1[15:8] == 8'hF7)
              DataK <={{no_of_lanes{K}},{no_of_lanes{K}}};  
	        else 
			  DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
			end
				
		  else if(symbol==4'b0010)begin // checking if symbols 2,3 are to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'hF7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'hF7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'hF7F7F7F7F7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
				 
			  else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{K}}};
				 end
			 end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'h00}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'h03020100}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'h0706050403020100}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			 else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'h0F0E0D0C0B0A09080706050403020100}};
				 DataK <= {{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'h01}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'h01020304}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'h0102030405060708}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
				 
			   else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'h0102030405060708090A0B0C0D0E0F10}};
				 DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
				 end
			 end
			end
			
			
		else if(symbol==4'b0100) begin // checking if symbols 4,5 are to be sent
		    Os_Out <={{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else if(symbol==4'b0110) begin // checking if symbols 6,7 are to be sent
		       if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[7:0]}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[31:0]}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[63:0]}};
				 
			   else 
			     Os_Out<= {{no_of_lanes{TS2[63:56]}},{temp2[127:0]}};
			  DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else if(symbol==4'b1000||symbol==4'b1010||symbol==4'b1100) begin // checking if symbols  8,9 or 10,11 or 12,13 are to be sent
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else  begin
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};//checking if symbols 14,15 are to be sent
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}}};
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+2; 
		  end 
		  // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin
		
		  if(symbol==4'b0000)begin // checking if symbols 0,1 are to be sent
		    Os_Out<={{no_of_lanes{skp[15:8]}},{no_of_lanes{skp[7:0]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}}};
			end
			
		 else begin // checking if symbols 2,3 are to be sent
		    Os_Out<={{no_of_lanes{skp[31:24]}},{no_of_lanes{skp[23:16]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+2; 
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		
		  if(symbol==4'b0000)begin // checking if symbols 0,1 are to be sent
		    Os_Out<={{no_of_lanes{EIOS[15:8]}},{no_of_lanes{EIOS[7:0]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}}};
			end
			
		  else begin // checking if symbols 2,3 are to be sent
		    Os_Out<={{no_of_lanes{EIOS[31:24]}},{no_of_lanes{EIOS[23:16]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+2; 
		 end
		 // ******************************************************checking if IDLE to be sent********************************************
		 else begin
		  if (symbol!=4'b1110) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+2;
		  end
		end
		 else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{not_valid}};
		  DataK<= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
	  end
	    // *******************************************pipewidth=32************************************************************************
	else if(PIPE==6'b100000 && (gen_reg==3'b001||gen_reg==3'b010)) begin
	  if(send)begin
	   finish<=1'b0;
	   DataValid <= {{no_of_lanes{valid}},{no_of_lanes{valid}},{no_of_lanes{valid}},{no_of_lanes{valid}}};
       //*****************************************checking if TS1 order sets to be sent*******************************************
	   if (os_type_reg==3'b000)begin
		
		  if(symbol==4'b0000)begin // checking if symbols 1,2,3,4 are to be sent
		     if(lane_number_reg==2'b00 )begin
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'hF7},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'hF7F7F7F7},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'hF7F7F7F7F7F7F7F7},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 
				 
			  else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			  end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'h00},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'h03020100},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				  if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'h0706050403020100},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				  if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			     end
				 
			 else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'h0F0E0D0C0B0A09080706050403020100},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				  if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{8'h01},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{32'h01020304},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{64'h0102030405060708},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else begin
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},{128'h0102030405060708090A0B0C0D0E0F10},{no_of_lanes{TS1[15:8]}},{no_of_lanes{TS1[7:0]}}};
				 if (TS1[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 end
			end
			
			
		else if(symbol==4'b0100) begin // checking if symbols 4,5,6,7 are to be sent
		
		       if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[7:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[31:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS1[63:56]}},{temp1[63:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
			   else 
			     Os_Out<= {{no_of_lanes{TS1[63:56]}},{temp1[127:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
		    DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			end
		
			
		else if(symbol==4'b1000) begin // checking if symbols 8,9,10,11  are to be sent
		    Os_Out <={{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else  begin // checking if symbols 12,13,14,15 are sent
		    Os_Out <={{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}},{no_of_lanes{TS1[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+4; 
		  end 
			//*****************************************checking if TS2 order sets to be sent*******************************************
	    else if (os_type_reg==3'b001)begin
		
		  if(symbol==4'b0000)begin // checking if symbols 1,2,3,4 are to be sent
		     if(lane_number_reg==2'b00 )begin
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'hF7},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			
				 
			   else if (count==00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'hF7F7F7F7},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				
				 
			   else if (count==01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'hF7F7F7F7F7F7F7F7},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 
				 
			  else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			  end
			 
			 else if(lane_number_reg==2'b01)begin // checking if lanes number are sequential
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'h00},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'h03020100},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				  if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'h0706050403020100},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				  if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			     end
				 
			 else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'h0F0E0D0C0B0A09080706050403020100},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				  if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 end
			 
			 else begin // checking if lanes number are sequentially reversed
			   if (count==5'b00001)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{8'h01},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else if (count==5'b00100)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{32'h01020304},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else if (count==5'b01000)begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{64'h0102030405060708},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
				 
			   else begin
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},{128'h0102030405060708090A0B0C0D0E0F10},{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 if (TS2[15:8] == 8'hF7)
                   DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}},{no_of_lanes{K}}};  
	             else 
			       DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{K}}};
			    end
			 end
			end	
			
		else if(symbol==4'b0100) begin // checking if symbols 4,5,6,7 are to be sent
		      if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[7:0]},{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[31:0]},{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[63:56]}},{temp2[63:0]},{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
				 
			   else 
			     Os_Out<= {{no_of_lanes{TS2[63:56]}},{temp2[127:0]},{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			end
		
			
		else if(symbol==4'b1000) begin // checking if symbols 8,9,10,11 are to be sent
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			end
			
		else  begin //checking if symbols 12,13,14,15 are to be sent
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			DataK <={{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}},{no_of_lanes{D}}};
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+4; 
			 
		  end 
		  // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin  
		    Os_Out<={{no_of_lanes{skp[31:24]}},{no_of_lanes{skp[23:16]}},{no_of_lanes{skp[15:8]}},{no_of_lanes{skp[7:0]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0; 
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		    Os_Out<={{no_of_lanes{EIOS[31:24]}},{no_of_lanes{EIOS[23:16]}},{no_of_lanes{EIOS[15:8]}},{no_of_lanes{EIOS[7:0]}}};
			DataK<={{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}},{no_of_lanes{K}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
		 end
		 // ******************************************************checking if IDLE to be sent********************************************
		 else begin
		   if (symbol!=4'b1100) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    DataK<= {no_of_lanes{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+4;
		end
	  end
  else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={GEN1_PIPEWIDTH*no_of_lanes{not_valid}};
		  DataK<= {((GEN1_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
	  end
	 
//*************************************************************GENERATION 3&4&5*************************************************************		 
//*************************************************************pipewidth=8********************************************************** 
 else if (PIPE==6'b001000 && (gen_reg==3'b011 || gen_reg==3'b100 || gen_reg==3'b101))begin
	if(send)begin//if there are order sets available to be sent
	  finish<=1'b0;
	  DataValid <= {no_of_lanes{valid}};
	  // ******************************************************checking if TS1 order sets to be  sent********************************************
	  if (os_type_reg==3'b000)begin
	    
		  if(symbol==4'b0000) // checking if symbol 0 is to be sent
		    Os_Out <={no_of_lanes{TS1[7:0]}};
			
		  else if(symbol==4'b0001)  // checking if symbol 1 is to be sent
		    Os_Out <={no_of_lanes{TS1[15:8]}};
				
		  else if(symbol==4'b0010)begin // checking if symbol 2 is to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)
			     Os_Out <= 8'hF7;
				 
			   else if (count==5'b00100)
			     Os_Out <= 32'hF7F7F7F7;
				 
			   else if (count==5'b01000)
			     Os_Out <= 64'hF7F7F7F7F7F7F7F7;
				 
			   else 
			     Os_Out <= 128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7;
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= 8'h00;
				
			   else if (count==5'b00100)
			     Os_Out <= 32'h03020100;
				 
			   else if (count==5'b01000)
			     Os_Out <= 64'h0706050403020100;
				 
			   else 
			     Os_Out <= 128'h0F0E0D0C0B0A09080706050403020100;
			 end			 
			end
			
	       else if(symbol==4'b0011)  // checking if symbol 3 is to be sent
		    Os_Out <={no_of_lanes{TS1[31:24]}};
			
		  else if(symbol==4'b0100)  // checking if symbol 4 is to be sent
		    Os_Out <={no_of_lanes{TS1[39:32]}};
			
		  else if(symbol==4'b0101)  // checking if symbol 5 is to be sent
		    Os_Out <={no_of_lanes{TS1[47:40]}};
		
		  else if (symbol==4'b0110) begin //checking if symbol 6 is to be sent
		       if (count==5'b00001)
			     Os_Out <= temp1[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp1[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp1[63:0];
				 
			   else 
			     Os_Out <= temp1[127:0];
		  end
		  
		  else if (symbol==4'b0111) begin //checking if symbol 7 is to be sent
		       if (count==5'b00001)
			     Os_Out <= temp2[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp2[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp2[63:0];
				 
			   else 
			     Os_Out <= temp2[127:0];
		  end
		  
		  else if (symbol==4'b1000) begin //checking if symbol 8 is to be sent
		       if (count==5'b00001)
			     Os_Out <= temp3[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp3[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp3[63:0];
				 
			   else 
			     Os_Out <= temp3[127:0];
		  end
		  
		  else if (symbol==4'b1001) begin //checking if symbol 9 is to be sent
		       if (count==5'b00001)
			     Os_Out <= temp4[7:0];
				 
		       else if (count==5'b00100)
			     Os_Out <= temp4[31:0];
				 
			   else if (count==5'b01000)
			     Os_Out <= temp4[63:0];
				 
			   else 
			     Os_Out <= temp4[127:0];
		  end
		  
		  else if (symbol==4'b1010 || symbol==4'b1011 || symbol==4'b1100 || symbol==4'b1101 || symbol==4'b1110)// checking if symbols 10 or 11 or 12 or 13 or 14 is sent
		  Os_Out<={no_of_lanes{TS1[55:48]}};
			
		  else  begin
		    Os_Out <={no_of_lanes{TS1[55:48]}};// checking if symbol 15 is to be sent
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+1; 
		  end 
		 
		  // ******************************************************checking if TS2 order sets to be sent********************************************
      else if (os_type_reg==3'b001)begin
		
		  if(symbol==4'b0000) // checking if symbol 0 is to be sent
		    Os_Out <={no_of_lanes{TS2[7:0]}};
			
			
		  else if(symbol==4'b0001)  // checking if symbol 1 is to be sent
		    Os_Out <={no_of_lanes{TS2[15:8]}};
				
		  else if(symbol==4'b0010)begin // checking if symbol 2 is to be sent
		     if(lane_number_reg==2'b00) begin 
			   if (count==5'b00001)
			     Os_Out <= 8'hF7;
				 
			   else if (count==5'b00100)
			     Os_Out <= 32'hF7F7F7F7;
				 
			   else if (count==5'b01000)
			     Os_Out <= 64'hF7F7F7F7F7F7F7F7;
				 
			  else 
			     Os_Out <= 128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7;
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= 8'h00;
				 
			   else if (count==5'b00100)
			     Os_Out <= 32'h03020100;
				 
			   else if (count==5'b01000)
			     Os_Out <= 64'h0706050403020100;
				 
			   else
			     Os_Out <= 128'h0F0E0D0C0B0A09080706050403020100;
				 
			 end
			end
			
	    else if(symbol==4'b0011)  // checking if symbol 3 is to be sent
		    Os_Out <={no_of_lanes{TS2[31:24]}};
			
		else if(symbol==4'b0100) // checking if symbol 4 is to be sent
		    Os_Out <={no_of_lanes{TS2[39:32]}};
		
	    else if(symbol==4'b0101)  // checking if symbol 5 is to be sent
		    Os_Out <={no_of_lanes{TS2[47:40]}};
			
		else if(symbol==4'b0110) // checking if symbol 6 is to be sent
		    Os_Out <={no_of_lanes{TS2[55:48]}};
			
		else if(symbol==4'b0111||symbol==4'b1000||symbol==4'b1001||symbol==4'b1010||symbol==4'b1011||symbol==4'b1100||symbol==4'b1101||symbol==4'b1110) // checking if symbol  7 or 8 or 9 or 10 or 11 or 12 or 13 or 14  is to be sent
		    Os_Out <={no_of_lanes{TS2[63:56]}};
			
		else begin // checking if symbol 15 is to be sent
		    Os_Out<={no_of_lanes{TS2[63:56]}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
		    end
			 symbol<=symbol+1; 
		  end 
		   // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin
		 if(gen_reg==3'b011 || gen_reg== 3'b100)begin
		  if(symbol==4'b0000 || symbol==4'b0001 || symbol==4'b0010 || symbol==4'b0011 || symbol==4'b0100 || symbol==4'b0101 || symbol==4'b0110 || symbol==4'b0111 || symbol==4'b1000 || symbol==4'b1001|| symbol==4'b1010 || symbol==4'b1011)// checking if symbols 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9 or 10 or 11
		    Os_Out<={no_of_lanes{skp_G3[7:0]}};
			
		  else if(symbol==4'b1100)  // checking if symbol 12 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[15:8]}};
			
		  else if(symbol==4'b1101 || symbol==4'b1110)  // checking if symbols 13 or 14 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[23:16]}};
			
		  else  begin // checking if symbol 15 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[23:16]}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+1;
			end
		 else if(gen_reg==3'b101)begin
		  if(symbol==4'b0000 || symbol==4'b0001 || symbol==4'b0010 || symbol==4'b0011 || symbol==4'b0100 || symbol==4'b0101 || symbol==4'b0110 || symbol==4'b0111 || symbol==4'b1000 || symbol==4'b1001|| symbol==4'b1010 || symbol==4'b1011)// checking if symbols 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9 or 10 or 11
		    Os_Out<={no_of_lanes{8'h99}};
			
		  else if(symbol==4'b1100)  // checking if symbol 12 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[15:8]}};
			
		  else if(symbol==4'b1101 || symbol==4'b1110)  // checking if symbols 13 or 14 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[23:16]}};
			
		  else  begin // checking if symbol 15 is to be sent
		    Os_Out<={no_of_lanes{skp_G3[23:16]}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+1;
			end
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		  if(symbol!=4'b1111) // checking if symbol 0 or 1 or 2 or 3 or 4 or 5 or 6 or 7 or 8 or 9 or 10 or 11 or 12 or 13 or 14  is to be sent
		    Os_Out<={no_of_lanes{EIOS_G3[7:0]}};
			
		  else begin // checking if symbol 15 is to be sent
		    Os_Out<={no_of_lanes{EIOS_G3[7:0]}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+1; 
		  end
		   // ******************************************************checking if IDLE to be sent********************************************
		 else if (os_type_reg==3'b100) begin
		  if (symbol!=4'b1111) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+1;
		  end
		  //***************************************************checking if EIEOS is sent*********************************************
		else if (os_type_reg==3'b101) begin
		 if (gen_reg==3'b011)begin
		  if(symbol!=4'b1111)
		    Os_Out<={no_of_lanes{EIEOS[7:0]}};
		  else begin
		   Os_Out<={no_of_lanes{EIEOS[7:0]}};
		   send<=1'b0;
		   finish<=1'b1;
		   busy<= 1'b0;
		  end
		  EIEOS<=~EIEOS;
		  symbol<=symbol+1;
		  end
		 else if(gen_reg==3'b100)begin
		   if(symbol==4'b0000 || symbol== 4'b0001 || symbol == 4'b0100 || symbol == 4'b0101 || symbol == 4'b1000 || symbol ==4'b1001 || symbol == 4'b1100 || symbol == 4'b1101)
		    Os_Out<={no_of_lanes{8'b0}};
		   else if(symbol==4'b0010 || symbol== 4'b0011 || symbol == 4'b0110 || symbol == 4'b0111 || symbol == 4'b1010 || symbol ==4'b1011 || symbol == 4'b1110)
		    Os_Out<={no_of_lanes{8'b11111111}};
		   else begin
			 Os_Out<={no_of_lanes{8'b11111111}};
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
		   end
		   symbol<=symbol+1;
		  end
		  else if(gen_reg==3'b101)begin
		   if(symbol==4'b0000 || symbol== 4'b0001 || symbol == 4'b0010 || symbol == 4'b0011 || symbol == 4'b1000 || symbol ==4'b1001 || symbol == 4'b1010 || symbol == 4'b1011)
		    Os_Out<={no_of_lanes{8'b0}};
		   else if(symbol==4'b0100 || symbol== 4'b0101 || symbol == 4'b0110 || symbol == 4'b0111 || symbol == 4'b1100 || symbol ==4'b1101 || symbol == 4'b1110)
		    Os_Out<={no_of_lanes{8'b11111111}};
		   else begin
			 Os_Out<={no_of_lanes{8'b11111111}};
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
		   end
		   symbol<=symbol+1;
		  end
		 end
		  //***************************************************checking if SDS is sent*********************************************
		  else begin
		   if(symbol==4'b0000) 
		   Os_Out<={no_of_lanes{SDS[7:0]}};
		   
		   else 
		   Os_Out<={no_of_lanes{SDS[15:8]}};
		   
		   if (symbol==4'b1111)begin
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
			end
			symbol<=symbol+1;
		  end
		end
	else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN3_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={no_of_lanes*GEN3_PIPEWIDTH{not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
	   end 
	  //*************************************************pipewidth=16***************************************************************** 
    else if (PIPE==6'b010000 &&(gen_reg==3'b011 || gen_reg==3'b100 || gen_reg==3'b101))begin
	if(send)begin//if there are order sets available to be sent
	  finish<=1'b0;
	  DataValid <= {{no_of_lanes{valid}},{no_of_lanes{valid}}};
	  // ******************************************************checking if TS1 order sets to be sent********************************************
	  if (os_type_reg==3'b000)begin
	    
		  if(symbol==4'b0000) // checking if symbols 0,1 are to be sent
		    Os_Out <={{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
			
				
		  else if(symbol==4'b0010)begin // checking if symbols 2,3 are to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},8'hF7};
				 
			   else if (count==5'b00100)
			     Os_Out <={{no_of_lanes{TS1[31:24]}},32'hF7F7F7F7};
				 
			   else if (count==5'b01000)
			     Os_Out <={{no_of_lanes{TS1[31:24]}},64'hF7F7F7F7F7F7F7F7};
				 
			   else 
			     Os_Out <={{no_of_lanes{TS1[31:24]}},128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7};
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},8'h00};
				
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},32'h03020100};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},64'h0706050403020100};
				 
			   else 
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},128'h0F0E0D0C0B0A09080706050403020100};
			 end			 
			end
			
		  else if(symbol==4'b0100)  // checking if symbols 4,5 are to be sent
		    Os_Out <={{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
			
		
		  else if (symbol==4'b0110) begin //checking if symbols 6,7 are to be sent
		       if (count==5'b00001)
			     Os_Out <= {{temp2[7:0]},{temp1[7:0]}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{temp2[31:0]},{temp1[31:0]}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{temp2[63:0]},{temp1[63:0]}};
				 
			   else 
			     Os_Out <= {{temp2[127:0]},{temp1[127:0]}};
		  end
		  
		  
		  else if (symbol==4'b1000) begin //checking if symbols 8,9 are to be sent
		       if (count==5'b00001)
			     Os_Out <= {{temp4[7:0]},{temp3[7:0]}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{temp4[31:0]},{temp3[31:0]}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{temp4[63:0]},{temp3[63:0]}};
				 
			   else 
			     Os_Out <={{temp4[127:0]},{temp3[127:0]}};
		  end
		  
		  else if (symbol==4'b1010 ||symbol==4'b1100)// checking if symbols 10,11 or 12,13 are sent
		  Os_Out<={{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}}};
			
		  else  begin //checking if symbols 14,15 are sent
		    Os_Out <={{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}}};// checking if symbol 15 is to be sent
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+2; 
		  end 
		 
		  // ******************************************************checking if TS2 order sets to be sent********************************************
      else if (os_type_reg==3'b001)begin
		
		  if(symbol==4'b0000) // checking if symbols 0,1 are to be sent
		    Os_Out <={{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				
		  else if(symbol==4'b0010)begin // checking if symbols 2,3 are to be sent
		     if(lane_number_reg==2'b00) begin 
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},8'hF7};
				 
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},32'hF7F7F7F7};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},64'hF7F7F7F7F7F7F7F7};
				 
			  else 
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7};
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},8'h00};
				 
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},32'h03020100};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},64'h0706050403020100};
				 
			   else
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},128'h0F0E0D0C0B0A09080706050403020100};
				 
			 end
			end
			
		else if(symbol==4'b0100) // checking if symbols 4,5 are to be sent
		    Os_Out <={{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
			
		else if(symbol==4'b0110) // checking if symbols 6,7 are to be sent
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[55:48]}}};
			
		else if(symbol==4'b1000||symbol==4'b1010||symbol==4'b1100) // checking if symbols 8,9 or 10,11 or 12,13 
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			
		else  begin // checking if symbols 14,15 are to be sent
		    Os_Out<={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
		    end
			 symbol<=symbol+2; 
		  end 
		   // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin
		if(gen_reg==3'b011 || gen_reg== 3'b100)begin
		  if(symbol==4'b0000 || symbol==4'b0010 || symbol==4'b0100 || symbol==4'b0110 || symbol==4'b1000 || symbol==4'b1010)// checking if symbols 0,1 or 2,3 or 4,5 or 6,7 or 8,9 or 10,11 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[7:0]}},{no_of_lanes{skp_G3[7:0]}}};
			
		  else if(symbol==4'b1100)  // checking if symbol 12,13 is to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[15:8]}}};
			
		  else  begin // checking if symbol 14,15 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+2; 
		   end
		 else if(gen_reg==3'b101)begin
		  if(symbol==4'b0000 || symbol==4'b0010 || symbol==4'b0100 || symbol==4'b0110 || symbol==4'b1000 || symbol==4'b1010)// checking if symbols 0,1 or 2,3 or 4,5 or 6,7 or 8,9 or 10,11 are to be sent
		    Os_Out<={{no_of_lanes{8'h99}},{no_of_lanes{8'h99}}};
			
		  else if(symbol==4'b1100)  // checking if symbol 12,13 is to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[15:8]}}};
			
		  else  begin // checking if symbol 14,15 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+2; 
		   end
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		
		  if(symbol!=4'b1110) // checking if symbols 0,1 or 2,3 or 4,5 or 6,7 or 8,9 or 10,11 or 12,13 are to be sent
		    Os_Out<={{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}}};
			
		  else begin // checking if symbols 14,15 are to be sent
		    Os_Out<={{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+2; 
		   end
		   // ******************************************************checking if IDLE to be sent********************************************
		 else if (os_type_reg==3'b100) begin
		   if (symbol!=4'b1110) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+2;
		  end
		  //***************************************************checking if EIEOS is sent*********************************************
		else if (os_type_reg==3'b101) begin
		 if (gen_reg==3'b011)begin
		  if(symbol!=4'b1110)
		    Os_Out<={{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}}};
		  else begin
		   Os_Out<={{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}}};
		   send<=1'b0;
		   finish<=1'b1;
		   busy<= 1'b0;
		  end
		  symbol<=symbol+2;
		  end
		 else if (gen_reg==3'b100)begin
		  if(symbol==4'b0000 || symbol== 4'b0100 || symbol== 4'b1000 || symbol== 4'b1100)
		    Os_Out<={{no_of_lanes{8'b0}},{no_of_lanes{8'b0}}};
		  else if (symbol==4'b0010 || symbol==4'b0110 || symbol == 4'b1010)
		    Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		  else begin
		   Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		   send<=1'b0;
		   finish<=1'b1;
		   busy<= 1'b0;
		  end
		  symbol<=symbol+2;
		  end
		  else if (gen_reg==3'b101)begin
		  if(symbol==4'b0000 || symbol== 4'b0010 || symbol== 4'b1000 || symbol== 4'b1010)
		    Os_Out<={{no_of_lanes{8'b0}},{no_of_lanes{8'b0}}};
		  else if (symbol==4'b0100 || symbol==4'b0110 || symbol == 4'b1100)
		    Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		  else begin
		   Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		   send<=1'b0;
		   finish<=1'b1;
		   busy<= 1'b0;
		  end
		  symbol<=symbol+2;
		  end
		 end
		  //***************************************************checking if SDS is sent*********************************************
		  else begin
		   if(symbol==4'b0000) 
		   Os_Out<={{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[7:0]}}};
		   
		   else 
		   Os_Out<={{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}}};
		   
		   if (symbol==4'b1110)begin
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
			end
			symbol<=symbol+2;
		  end
		end
	else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN3_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={no_of_lanes*GEN3_PIPEWIDTH{not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
	   end 
	   //*************************************************pipewidth=32***************************************************************** 
    else if (PIPE==6'b100000 && (gen_reg==3'b011 || gen_reg==3'b100 || gen_reg==3'b101))begin
	if(send)begin//if there are order sets available to be sent
	  finish<=1'b0;
	  DataValid <= {{no_of_lanes{valid}},{no_of_lanes{valid}},{no_of_lanes{valid}},{no_of_lanes{valid}}};
	  // ******************************************************checking if TS1 order sets to be sent********************************************
	  if (os_type_reg==3'b000)begin
	    		
		   if(symbol==4'b0000)begin // checking if symbols 0,1,2,3 are to be sent
		     if(lane_number_reg==2'b00)begin 
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},8'hF7,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				 
			   else if (count==5'b00100)
			     Os_Out <={{no_of_lanes{TS1[31:24]}},32'hF7F7F7F7,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <={{no_of_lanes{TS1[31:24]}},64'hF7F7F7F7F7F7F7F7,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				 
			   else 
			     Os_Out <={{no_of_lanes{TS1[31:24]}},128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},8'h00,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},32'h03020100,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},64'h0706050403020100,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
				 
			   else 
			     Os_Out <= {{no_of_lanes{TS1[31:24]}},128'h0F0E0D0C0B0A09080706050403020100,{{no_of_lanes{TS1[15:8]}}},{no_of_lanes{TS1[7:0]}}};
			 end			 
			end
			
		  else if (symbol==4'b0100) begin //checking if symbols 4,5,6,7 are to be sent
		       if (count==5'b00001)
			     Os_Out <= {{temp2[7:0]},{temp1[7:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{temp2[31:0]},{temp1[31:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{temp2[63:0]},{temp1[63:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
				 
			   else 
			     Os_Out <= {{temp2[127:0]},{temp1[127:0]},{no_of_lanes{TS1[47:40]}},{no_of_lanes{TS1[39:32]}}};
		  end
		  
		  
		  else if (symbol==4'b1000) begin //checking if symbols 8,9,10,11 are to be sent
		       if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{temp4[7:0]},{temp3[7:0]}};
				 
		       else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{temp4[31:0]},{temp3[31:0]}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{temp4[63:0]},{temp3[63:0]}};
				 
			   else 
			     Os_Out <={{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{temp4[127:0]},{temp3[127:0]}};
		  end
		  
		  else  begin //checking if symbols 12,13,14,15 are sent
		    Os_Out <={{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}},{no_of_lanes{TS1[55:48]}}};// checking if symbol 15 is to be sent
			send <=1'b0;
			finish <=1'b1;
			busy <=1'b0;
		    end
			 symbol<=symbol+4; 
		  end 
		 
		  // ******************************************************checking if TS2 order sets to be sent********************************************
      else if (os_type_reg==3'b001)begin
				
		   if(symbol==4'b0000)begin // checking if symbols 0,1,2,3 are to be sent
		     if(lane_number_reg==2'b00) begin 
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},8'hF7,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},32'hF7F7F7F7,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},64'hF7F7F7F7F7F7F7F7,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			  else 
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},128'hF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
			 end
			 
			 else begin // checking if lanes number are sequential
			   if (count==5'b00001)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},8'h00,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			   else if (count==5'b00100)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},32'h03020100,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			   else if (count==5'b01000)
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},64'h0706050403020100,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			   else
			     Os_Out <= {{no_of_lanes{TS2[31:24]}},128'h0F0E0D0C0B0A09080706050403020100,{no_of_lanes{TS2[15:8]}},{no_of_lanes{TS2[7:0]}}};
				 
			 end
			end
			
		else if(symbol==4'b0100) // checking if symbols 4,5,6,7 are to be sent
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[55:48]}},{no_of_lanes{TS2[47:40]}},{no_of_lanes{TS2[39:32]}}};
			
		else if(symbol==4'b1000) // checking if symbols 8,9,10,11 
		    Os_Out <={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			
		else  begin // checking if symbols 12,13,14,15 are to be sent
		    Os_Out<={{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}},{no_of_lanes{TS2[63:56]}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
		    end
			 symbol<=symbol+4; 
		  end 
		   // ******************************************************checking if skip order sets to be sent********************************************
      else if (os_type_reg==3'b010)begin
		 if (gen_reg==3'b011 || gen_reg== 3'b100)begin
		  if(symbol==4'b0000 ||  symbol==4'b0100 || symbol==4'b1000 )// checking if symbols 0,1,2,3 or 4,5,6,7 or 8,9,10,11 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[7:0]}},{no_of_lanes{skp_G3[7:0]}},{no_of_lanes{skp_G3[7:0]}},{no_of_lanes{skp_G3[7:0]}}};
			
		  else  begin // checking if symbol 14,15 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[15:8]}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+4; 
		   end
		 else if (gen_reg==3'b101)begin
		  if(symbol==4'b0000 ||  symbol==4'b0100 || symbol==4'b1000 )// checking if symbols 0,1,2,3 or 4,5,6,7 or 8,9,10,11 are to be sent
		    Os_Out<={{no_of_lanes{8'h99}},{no_of_lanes{8'h99}},{no_of_lanes{8'h99}},{no_of_lanes{8'h99}}};
			
		  else  begin // checking if symbol 14,15 are to be sent
		    Os_Out<={{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[23:16]}},{no_of_lanes{skp_G3[15:8]}}};
			send <=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+4; 
		   end
		  end 
		  // ******************************************************checking if EIOS order sets to be sent********************************************
      else if (os_type_reg==3'b011) begin
		
		  if(symbol!=4'b1100) // checking if symbols 0,1,2,3 or 4,5,6,7 or 8,9,10,11 are to be sent
		    Os_Out<={{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}}};
			
		  else begin // checking if symbols 12,13,14,15 are to be sent
		    Os_Out<={{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}},{no_of_lanes{EIOS_G3[7:0]}}};
			send<=1'b0;
			finish<=1'b1;
			busy<=1'b0;
			end
			symbol<=symbol+4; 
		   end
		   // ******************************************************checking if IDLE to be sent********************************************
		 else if (os_type_reg==3'b100) begin
		   if (symbol!=4'b1100) begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    end
		  else begin
		    Os_Out<={no_of_lanes*GEN1_PIPEWIDTH{1'b0}};
		    send<=1'b0;
		    finish<=1'b1;
		    busy<= 1'b0;
		  end
		  symbol<=symbol+4;
		  end
		  //***************************************************checking if EIEOS is sent*********************************************
		else if (os_type_reg==3'b101) begin
		 if (gen_reg==3'b011)begin
		  if(symbol!=4'b1100)
		    Os_Out<={{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}},{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}}};
		  else begin
		   Os_Out<={{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}},{no_of_lanes{~EIEOS[7:0]}},{no_of_lanes{EIEOS[7:0]}}};
		   send<=1'b0;
		   finish<=1'b1;
		   busy<= 1'b0;
		  end
		  symbol<=symbol+4;
		  end
		 else if (gen_reg==3'b100)begin
		   if(symbol!=4'b1100)
		     Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b0}},{no_of_lanes{8'b0}}};
		   else begin
		     Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b0}},{no_of_lanes{8'b0}}};
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
		   end
		  symbol<=symbol+4;
		 end
		 else if (gen_reg==3'b101)begin
		   if(symbol==4'b0000 || symbol==4'b1000)
		     Os_Out<={{no_of_lanes{8'b0}},{no_of_lanes{8'b0}},{no_of_lanes{8'b0}},{no_of_lanes{8'b0}}};
		   else if(symbol==4'b0100)
		     Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		   else begin
		     Os_Out<={{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}},{no_of_lanes{8'b11111111}}};
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
		   end
		  symbol<=symbol+4;
		 end
		end
		  //***************************************************checking if SDS is sent*********************************************
		  else begin
		   if(symbol==4'b0000) 
		   Os_Out<={{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[7:0]}}};
		   
		   else 
		   Os_Out<={{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}},{no_of_lanes{SDS[15:8]}}};
		   
		   if (symbol==4'b1100)begin
		     send<=1'b0;
		     finish<=1'b1;
		     busy<= 1'b0;
			end
			symbol<=symbol+4;
		  end
		end
	else begin  //if there are no order sets available to be sent
		  DataValid <= {((GEN3_PIPEWIDTH/8)*no_of_lanes){not_valid}};
		  Os_Out<={no_of_lanes*GEN3_PIPEWIDTH{not_valid}};
		  finish<=1'b0;
		  //busy<= 1'b0;
		 end
	   end 
	  end
	endmodule	  
