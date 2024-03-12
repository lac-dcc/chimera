module   addr(
          clk,
          rst,
       enable,
          wen,
      counter, 
   i_transize,
  
       badd_0 ,
       badd_1 ,
       badd_2 ,
       badd_3 ,
       badd_4 ,
       badd_5 ,
       badd_6 ,
       badd_7 ,
       badd_8 ,
       badd_9 ,
       badd_10,
       badd_11,
       badd_12,
       badd_13,
       badd_14,
       badd_15,
       badd_16,
       badd_17,
       badd_18,
       badd_19,
       badd_20,
       badd_21,
       badd_22,
       badd_23,
       badd_24,
       badd_25,
       badd_26,
       badd_27,
       badd_28,
       badd_29,
       badd_30,
       badd_31,
	    add_0 ,
	    add_1 ,
	    add_2 ,
	    add_3 ,
	    add_4 ,
	    add_5 ,
	    add_6 ,
	    add_7 ,
	    add_8 ,
	    add_9 ,
	    add_10,
	    add_11,
	    add_12,
	    add_13,
	    add_14,
	    add_15,
	    add_16,
	    add_17,
	    add_18,
	    add_19,
	    add_20,
	    add_21,
	    add_22,
	    add_23,
	    add_24,
	    add_25,
	    add_26,
	    add_27,
	    add_28,
	    add_29,
	    add_30,
	    add_31
	   
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************       

input                            clk;         
input                            rst;
input                            wen;
input                         enable;
input        [4:0]           counter;
input        [1:0]        i_transize;   

output   reg    [4:0]          badd_0 ;
output   reg    [4:0]          badd_1 ;
output   reg    [4:0]          badd_2 ;
output   reg    [4:0]          badd_3 ;
output   reg    [4:0]          badd_4 ;
output   reg    [4:0]          badd_5 ;
output   reg    [4:0]          badd_6 ;
output   reg    [4:0]          badd_7 ;
output   reg    [4:0]          badd_8 ;
output   reg    [4:0]          badd_9 ;
output   reg    [4:0]          badd_10;
output   reg    [4:0]          badd_11;
output   reg    [4:0]          badd_12;
output   reg    [4:0]          badd_13;
output   reg    [4:0]          badd_14;
output   reg    [4:0]          badd_15;
output   reg    [4:0]          badd_16;
output   reg    [4:0]          badd_17;
output   reg    [4:0]          badd_18;
output   reg    [4:0]          badd_19;
output   reg    [4:0]          badd_20;
output   reg    [4:0]          badd_21;
output   reg    [4:0]          badd_22;
output   reg    [4:0]          badd_23;
output   reg    [4:0]          badd_24;
output   reg    [4:0]          badd_25;
output   reg    [4:0]          badd_26;
output   reg    [4:0]          badd_27;
output   reg    [4:0]          badd_28;
output   reg    [4:0]          badd_29;
output   reg    [4:0]          badd_30;
output   reg    [4:0]          badd_31;

output   reg    [4:0]           add_0 ;
output   reg    [4:0]           add_1 ;
output   reg    [4:0]           add_2 ;
output   reg    [4:0]           add_3 ;
output   reg    [4:0]           add_4 ;
output   reg    [4:0]           add_5 ;
output   reg    [4:0]           add_6 ;
output   reg    [4:0]           add_7 ;
output   reg    [4:0]           add_8 ;
output   reg    [4:0]           add_9 ;
output   reg    [4:0]           add_10;
output   reg    [4:0]           add_11;
output   reg    [4:0]           add_12;
output   reg    [4:0]           add_13;
output   reg    [4:0]           add_14;
output   reg    [4:0]           add_15;
output   reg    [4:0]           add_16;
output   reg    [4:0]           add_17;
output   reg    [4:0]           add_18;
output   reg    [4:0]           add_19;
output   reg    [4:0]           add_20;
output   reg    [4:0]           add_21;
output   reg    [4:0]           add_22;
output   reg    [4:0]           add_23;
output   reg    [4:0]           add_24;
output   reg    [4:0]           add_25;
output   reg    [4:0]           add_26;
output   reg    [4:0]           add_27;
output   reg    [4:0]           add_28;
output   reg    [4:0]           add_29;
output   reg    [4:0]           add_30;
output   reg    [4:0]           add_31;

// ********************************************
//                                             
//    Parameter DECLARATION                     
//                                             
// ********************************************

parameter 		          DCT_4=2'b00;
parameter             DCT_8=2'b01;
parameter             DCT_16=2'b10; 
parameter             DCT_32=2'b11;

// ********************************************
//                                             
//    WIRE   DECLARATION                     
//                                             
// ********************************************

wire    [2:0]                  q_160;
wire    [2:0]                  q_161;
wire    [2:0]                  q_162;
wire    [2:0]                  q_163;
wire    [2:0]                  q_164;
wire    [2:0]                  q_165;
wire    [2:0]                  q_166;
wire    [2:0]                  q_167;

wire    [3:0]                qs_160 ;
wire    [3:0]                qs_161 ;
wire    [3:0]                qs_162 ;
wire    [3:0]                qs_163 ;
wire    [3:0]                qs_164 ;
wire    [3:0]                qs_165 ;
wire    [3:0]                qs_166 ;
wire    [3:0]                qs_167 ;
wire    [3:0]                qs_168 ;
wire    [3:0]                qs_169 ;
wire    [3:0]                qs_1610;
wire    [3:0]                qs_1611;
wire    [3:0]                qs_1612;
wire    [3:0]                qs_1613;
wire    [3:0]                qs_1614;
wire    [3:0]                qs_1615;

wire    [4:0]                qa_160 ;
wire    [4:0]                qa_161 ;
wire    [4:0]                qa_162 ;
wire    [4:0]                qa_163 ;
wire    [4:0]                qa_164 ;
wire    [4:0]                qa_165 ;
wire    [4:0]                qa_166 ;
wire    [4:0]                qa_167 ;
wire    [4:0]                qa_168 ;
wire    [4:0]                qa_169 ;
wire    [4:0]                qa_1610;
wire    [4:0]                qa_1611;
wire    [4:0]                qa_1612;
wire    [4:0]                qa_1613;
wire    [4:0]                qa_1614;
wire    [4:0]                qa_1615;
wire    [4:0]                qa_1616;
wire    [4:0]                qa_1617;
wire    [4:0]                qa_1618;
wire    [4:0]                qa_1619;
wire    [4:0]                qa_1620;
wire    [4:0]                qa_1621;
wire    [4:0]                qa_1622;
wire    [4:0]                qa_1623;
wire    [4:0]                qa_1624;
wire    [4:0]                qa_1625;
wire    [4:0]                qa_1626;
wire    [4:0]                qa_1627;
wire    [4:0]                qa_1628;
wire    [4:0]                qa_1629;
wire    [4:0]                qa_1630;
wire    [4:0]                qa_1631;

// ********************************************
//                                             
//    REG   DECLARATION                     
//                                             
// ********************************************

reg                           wen_0;
reg                           wen_1;

// ********************************************
//                                             
//  combinational Logic                      
//                                             
// ********************************************

assign qa_160 =5'd0 +((counter[2:0]-3'd2)<<2);
assign qa_161 =5'd1 +((counter[2:0]-3'd2)<<2);
assign qa_162 =5'd4 +((counter[2:0]-3'd2)<<2);
assign qa_163 =5'd5 +((counter[2:0]-3'd2)<<2);
assign qa_164 =5'd8 +((counter[2:0]-3'd2)<<2);
assign qa_165 =5'd9 +((counter[2:0]-3'd2)<<2);
assign qa_166 =5'd12+((counter[2:0]-3'd2)<<2);
assign qa_167 =5'd13+((counter[2:0]-3'd2)<<2);
assign qa_168 =5'd16+((counter[2:0]-3'd2)<<2);
assign qa_169 =5'd17+((counter[2:0]-3'd2)<<2);
assign qa_1610=5'd20+((counter[2:0]-3'd2)<<2);
assign qa_1611=5'd21+((counter[2:0]-3'd2)<<2);
assign qa_1612=5'd24+((counter[2:0]-3'd2)<<2);
assign qa_1613=5'd25+((counter[2:0]-3'd2)<<2);
assign qa_1614=5'd28+((counter[2:0]-3'd2)<<2);
assign qa_1615=5'd29+((counter[2:0]-3'd2)<<2);
assign qa_1616=5'd2 +((counter[2:0]-3'd2)<<2);
assign qa_1617=5'd3 +((counter[2:0]-3'd2)<<2);
assign qa_1618=5'd6 +((counter[2:0]-3'd2)<<2);
assign qa_1619=5'd7 +((counter[2:0]-3'd2)<<2);
assign qa_1620=5'd10+((counter[2:0]-3'd2)<<2);
assign qa_1621=5'd11+((counter[2:0]-3'd2)<<2);
assign qa_1622=5'd14+((counter[2:0]-3'd2)<<2);
assign qa_1623=5'd15+((counter[2:0]-3'd2)<<2);
assign qa_1624=5'd18+((counter[2:0]-3'd2)<<2);
assign qa_1625=5'd19+((counter[2:0]-3'd2)<<2);
assign qa_1626=5'd22+((counter[2:0]-3'd2)<<2);
assign qa_1627=5'd23+((counter[2:0]-3'd2)<<2);
assign qa_1628=5'd26+((counter[2:0]-3'd2)<<2);
assign qa_1629=5'd27+((counter[2:0]-3'd2)<<2);
assign qa_1630=5'd30+((counter[2:0]-3'd2)<<2);
assign qa_1631=5'd31+((counter[2:0]-3'd2)<<2);
   
assign qs_160 =4'd0 -(counter[2:0]<<1);
assign qs_161 =4'd1 -(counter[2:0]<<1);
assign qs_162 =4'd2 -(counter[2:0]<<1);
assign qs_163 =4'd3 -(counter[2:0]<<1);
assign qs_164 =4'd4 -(counter[2:0]<<1);
assign qs_165 =4'd5 -(counter[2:0]<<1);
assign qs_166 =4'd6 -(counter[2:0]<<1);
assign qs_167 =4'd7 -(counter[2:0]<<1);
assign qs_168 =4'd8 -(counter[2:0]<<1);
assign qs_169 =4'd9 -(counter[2:0]<<1);
assign qs_1610=4'd10-(counter[2:0]<<1);
assign qs_1611=4'd11-(counter[2:0]<<1);
assign qs_1612=4'd12-(counter[2:0]<<1);
assign qs_1613=4'd13-(counter[2:0]<<1);
assign qs_1614=4'd14-(counter[2:0]<<1);
assign qs_1615=4'd15-(counter[2:0]<<1);

assign q_160 =3'd0 - counter[2:0];
assign q_161 =3'd1 - counter[2:0];
assign q_162 =3'd2 - counter[2:0];
assign q_163 =3'd3 - counter[2:0];
assign q_164 =3'd4 - counter[2:0];
assign q_165 =3'd5 - counter[2:0];
assign q_166 =3'd6 - counter[2:0];
assign q_167 =3'd7 - counter[2:0];
   
      
// ********************************************
//                                             
//  Sequential Logic                      
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  wen_0<=1'b0;
else
  wen_0<=wen;

always@(posedge clk or negedge rst)
if(!rst)
  wen_1<=1'b0;
else
  wen_1<=wen_0;

always@(posedge clk or negedge rst)
if(!rst)
begin
     badd_0 <=5'd0 ;
	   badd_1 <=5'd1 ;
	   badd_2 <=5'd2 ;
	   badd_3 <=5'd3 ;
	   badd_4 <=5'd4 ;
	   badd_5 <=5'd5 ;
	   badd_6 <=5'd6 ;
	   badd_7 <=5'd7 ;
	   badd_8 <=5'd8 ;
	   badd_9 <=5'd9 ;
	   badd_10<=5'd10;
	   badd_11<=5'd11;
	   badd_12<=5'd12;
	   badd_13<=5'd13;
	   badd_14<=5'd14;
	   badd_15<=5'd15;
	   badd_16<=5'd16;
	   badd_17<=5'd17;
	   badd_18<=5'd18;
	   badd_19<=5'd19;
	   badd_20<=5'd20;
	   badd_21<=5'd21;
	   badd_22<=5'd22;
	   badd_23<=5'd23;
	   badd_24<=5'd24;
	   badd_25<=5'd25;
	   badd_26<=5'd26;
	   badd_27<=5'd27;
	   badd_28<=5'd28;
	   badd_29<=5'd29;
	   badd_30<=5'd30;
	   badd_31<=5'd31;
end
else
if(enable) 
begin
if(wen_1)
 case(i_transize)
 DCT_8:
    if(!counter[0])
     begin
     badd_0 <=5'd0 ;
	   badd_1 <=5'd1 ;
	   badd_2 <=5'd2 ;
	   badd_3 <=5'd3 ;
	   badd_4 <=5'd16;
	   badd_5 <=5'd17;
	   badd_6 <=5'd18;
	   badd_7 <=5'd19;
	   badd_8 <=5'd4 ;
	   badd_9 <=5'd5 ;
	   badd_10<=5'd6 ;
	   badd_11<=5'd7 ;
	   badd_12<=5'd20;
	   badd_13<=5'd21;
	   badd_14<=5'd22;
	   badd_15<=5'd23;
	   badd_16<=5'd8 ;
	   badd_17<=5'd9 ;
	   badd_18<=5'd10;
	   badd_19<=5'd11;
	   badd_20<=5'd24;
	   badd_21<=5'd25;
	   badd_22<=5'd26;
	   badd_23<=5'd27;
	   badd_24<=5'd12;
	   badd_25<=5'd13;
	   badd_26<=5'd14;
	   badd_27<=5'd15;
	   badd_28<=5'd28;
	   badd_29<=5'd29;
	   badd_30<=5'd30;
	   badd_31<=5'd31;
	   end
	  else
	   begin
     badd_0 <=5'd16;
	   badd_1 <=5'd17;
	   badd_2 <=5'd18;
	   badd_3 <=5'd19;
	   badd_4 <=5'd0;
	   badd_5 <=5'd1;
	   badd_6 <=5'd2;
	   badd_7 <=5'd3;
	   badd_8 <=5'd20;
	   badd_9 <=5'd21;
	   badd_10<=5'd22;
	   badd_11<=5'd23;
	   badd_12<=5'd4;
	   badd_13<=5'd5;
	   badd_14<=5'd6;
	   badd_15<=5'd7;
	   badd_16<=5'd24;
	   badd_17<=5'd25;
	   badd_18<=5'd26;
	   badd_19<=5'd27;
	   badd_20<=5'd8 ;
	   badd_21<=5'd9 ;
	   badd_22<=5'd10;
	   badd_23<=5'd11;
	   badd_24<=5'd28;
	   badd_25<=5'd29;
	   badd_26<=5'd30;
	   badd_27<=5'd31;
	   badd_28<=5'd12;
	   badd_29<=5'd13;
	   badd_30<=5'd14;
	   badd_31<=5'd15;
	   end
 DCT_16:begin
     badd_0 <=qa_160 ;
	   badd_1 <=qa_161 ;
	   badd_2 <=qa_162 ;
	   badd_3 <=qa_163 ;
	   badd_4 <=qa_164 ;
	   badd_5 <=qa_165 ;
	   badd_6 <=qa_166 ;
	   badd_7 <=qa_167 ;
	   badd_8 <=qa_168 ;
	   badd_9 <=qa_169 ;
	   badd_10<=qa_1610;
	   badd_11<=qa_1611;
	   badd_12<=qa_1612;
	   badd_13<=qa_1613;
	   badd_14<=qa_1614;
	   badd_15<=qa_1615;
	   badd_16<=qa_1616;
	   badd_17<=qa_1617;
	   badd_18<=qa_1618;
	   badd_19<=qa_1619;
	   badd_20<=qa_1620;
	   badd_21<=qa_1621;
	   badd_22<=qa_1622;
	   badd_23<=qa_1623;
	   badd_24<=qa_1624;
	   badd_25<=qa_1625;
	   badd_26<=qa_1626;
	   badd_27<=qa_1627;
	   badd_28<=qa_1628;
	   badd_29<=qa_1629;
	   badd_30<=qa_1630;
	   badd_31<=qa_1631;
	  end
  DCT_32:begin
     badd_0 <=5'd30 +counter[4:0];
	   badd_1 <=5'd31 +counter[4:0];
	   badd_2 <=5'd0 +counter[4:0];
	   badd_3 <=5'd1 +counter[4:0];
	   badd_4 <=5'd2 +counter[4:0];
	   badd_5 <=5'd3 +counter[4:0];
	   badd_6 <=5'd4 +counter[4:0];
	   badd_7 <=5'd5 +counter[4:0];
	   badd_8 <=5'd6 +counter[4:0];
	   badd_9 <=5'd7 +counter[4:0];
	   badd_10<=5'd8 +counter[4:0];
	   badd_11<=5'd9 +counter[4:0];
	   badd_12<=5'd10+counter[4:0];
	   badd_13<=5'd11+counter[4:0];
	   badd_14<=5'd12+counter[4:0];
	   badd_15<=5'd13+counter[4:0];
	   badd_16<=5'd14+counter[4:0];
	   badd_17<=5'd15+counter[4:0];
	   badd_18<=5'd16+counter[4:0];
	   badd_19<=5'd17+counter[4:0];
	   badd_20<=5'd18+counter[4:0];
	   badd_21<=5'd19+counter[4:0];
	   badd_22<=5'd20+counter[4:0];
	   badd_23<=5'd21+counter[4:0];
	   badd_24<=5'd22+counter[4:0];
	   badd_25<=5'd23+counter[4:0];
	   badd_26<=5'd24+counter[4:0];
	   badd_27<=5'd25+counter[4:0];
	   badd_28<=5'd26+counter[4:0];
	   badd_29<=5'd27+counter[4:0];
	   badd_30<=5'd28+counter[4:0];
	   badd_31<=5'd29+counter[4:0];
	   end
 endcase
 else 
  if(!wen)
case(i_transize)
 DCT_4:begin
     badd_0 <=5'd0 ;
	   badd_1 <=5'd8 ;
	   badd_2 <=5'd16 ;
	   badd_3 <=5'd24;
	   badd_4 <=5'd4 ;
	   badd_5 <=5'd5 ;
	   badd_6 <=5'd6 ;
	   badd_7 <=5'd7;
	   badd_8 <=5'd1 ;
	   badd_9 <=5'd9 ;
	   badd_10 <=5'd17 ;
	   badd_11 <=5'd25;
	   badd_12 <=5'd12;
	   badd_13 <=5'd13 ;
	   badd_14 <=5'd14 ;
	   badd_15 <=5'd15;
	   badd_16 <=5'd2 ;
	   badd_17 <=5'd10 ;
	   badd_18<=5'd18;
	   badd_19<=5'd26;
	   badd_20 <=5'd20 ;
	   badd_21 <=5'd21 ;
	   badd_22<=5'd22;
	   badd_23<=5'd23;
	   badd_24<=5'd3 ;
	   badd_25<=5'd11 ;
	   badd_26<=5'd19;
	   badd_27<=5'd27;
	   badd_28<=5'd28 ;
	   badd_29<=5'd29 ;
	   badd_30<=5'd30;
	   badd_31<=5'd31;
	   end
 DCT_8:
  if(!counter[0])
    begin
     badd_0 <=5'd0 ;
	   badd_1 <=5'd8 ;
	   badd_2 <=5'd16;
	   badd_3 <=5'd24;
	   badd_4 <=5'd1 ;
	   badd_5 <=5'd9 ;
	   badd_6 <=5'd17;
	   badd_7 <=5'd25;
	   badd_8 <=5'd2 ;
	   badd_9 <=5'd10;
	   badd_10<=5'd18;
	   badd_11<=5'd26;
	   badd_12<=5'd3 ;
	   badd_13<=5'd11;
	   badd_14<=5'd19;
	   badd_15<=5'd27;
	   badd_16<=5'd4 ;
	   badd_17<=5'd12;
	   badd_18<=5'd20;
	   badd_19<=5'd28;
	   badd_20<=5'd5 ;
	   badd_21<=5'd13;
	   badd_22<=5'd21;
	   badd_23<=5'd29;
	   badd_24<=5'd6 ;
	   badd_25<=5'd14;
	   badd_26<=5'd22;
	   badd_27<=5'd30;
	   badd_28<=5'd7 ;
	   badd_29<=5'd15;
	   badd_30<=5'd23;
	   badd_31<=5'd31;
	   end
  else
    begin
     badd_0 <=5'd4 ;
	   badd_1 <=5'd12;
	   badd_2 <=5'd20;
	   badd_3 <=5'd28;
	   badd_4 <=5'd5 ;
	   badd_5 <=5'd13;
	   badd_6 <=5'd21;
	   badd_7 <=5'd29;
	   badd_8 <=5'd6 ;
	   badd_9 <=5'd14;
	   badd_10<=5'd22;
	   badd_11<=5'd30;
	   badd_12<=5'd7 ;
	   badd_13<=5'd15;
	   badd_14<=5'd23;
	   badd_15<=5'd31;
	   badd_16<=5'd0 ;
	   badd_17<=5'd8 ;
	   badd_18<=5'd16;
	   badd_19<=5'd24;
	   badd_20<=5'd1 ;
	   badd_21<=5'd9 ;
	   badd_22<=5'd17;
	   badd_23<=5'd25;
	   badd_24<=5'd2 ;
	   badd_25<=5'd10;
	   badd_26<=5'd18;
	   badd_27<=5'd26;
	   badd_28<=5'd3 ;
	   badd_29<=5'd11;
	   badd_30<=5'd19;
	   badd_31<=5'd27;
    end	
 DCT_16:begin
     badd_0 <=qs_160;
	   badd_1 <=qs_160+5'd16;
	   badd_2 <=qs_161;
	   badd_3 <=qs_161+5'd16;
	   badd_4 <=qs_162;
	   badd_5 <=qs_162+5'd16;
	   badd_6 <=qs_163;
	   badd_7 <=qs_163+5'd16;
	   badd_8 <=qs_164;
	   badd_9 <=qs_164+5'd16;
	   badd_10<=qs_165;
	   badd_11<=qs_165+5'd16;
	   badd_12<=qs_166;
	   badd_13<=qs_166+5'd16;
	   badd_14<=qs_167;
	   badd_15<=qs_167+5'd16;
	   badd_16<=qs_168;
	   badd_17<=qs_168+5'd16;
	   badd_18<=qs_169;
	   badd_19<=qs_169+5'd16;
	   badd_20<=qs_1610;
	   badd_21<=qs_1610+5'd16;
	   badd_22<=qs_1611;
	   badd_23<=qs_1611+5'd16;
	   badd_24<=qs_1612;
	   badd_25<=qs_1612+5'd16;
	   badd_26<=qs_1613;
	   badd_27<=qs_1613+5'd16;
	   badd_28<=qs_1614;
	   badd_29<=qs_1614+5'd16;
	   badd_30<=qs_1615;
	   badd_31<=qs_1615+5'd16;
	   end
  DCT_32:begin
     badd_0 <=5'd0 -counter[4:0];
	   badd_1 <=5'd1 -counter[4:0];
	   badd_2 <=5'd2 -counter[4:0];
	   badd_3 <=5'd3 -counter[4:0];
	   badd_4 <=5'd4 -counter[4:0];
	   badd_5 <=5'd5 -counter[4:0];
	   badd_6 <=5'd6 -counter[4:0];
	   badd_7 <=5'd7 -counter[4:0];
	   badd_8 <=5'd8 -counter[4:0];
	   badd_9 <=5'd9 -counter[4:0];
	   badd_10<=5'd10-counter[4:0];
	   badd_11<=5'd11-counter[4:0];
	   badd_12<=5'd12-counter[4:0];
	   badd_13<=5'd13-counter[4:0];
	   badd_14<=5'd14-counter[4:0];
	   badd_15<=5'd15-counter[4:0];
	   badd_16<=5'd16-counter[4:0];
	   badd_17<=5'd17-counter[4:0];
	   badd_18<=5'd18-counter[4:0];
	   badd_19<=5'd19-counter[4:0];
	   badd_20<=5'd20-counter[4:0];
	   badd_21<=5'd21-counter[4:0];
	   badd_22<=5'd22-counter[4:0];
	   badd_23<=5'd23-counter[4:0];
	   badd_24<=5'd24-counter[4:0];
	   badd_25<=5'd25-counter[4:0];
	   badd_26<=5'd26-counter[4:0];
	   badd_27<=5'd27-counter[4:0];
	   badd_28<=5'd28-counter[4:0];
	   badd_29<=5'd29-counter[4:0];
	   badd_30<=5'd30-counter[4:0];
	   badd_31<=5'd31-counter[4:0];
	   end
 endcase
 end
else
begin
     badd_0 <=5'd0 ;
	   badd_1 <=5'd1 ;
	   badd_2 <=5'd2 ;
	   badd_3 <=5'd3 ;
	   badd_4 <=5'd4 ;
	   badd_5 <=5'd5 ;
	   badd_6 <=5'd6 ;
	   badd_7 <=5'd7 ;
	   badd_8 <=5'd8 ;
	   badd_9 <=5'd9 ;
	   badd_10<=5'd10;
	   badd_11<=5'd11;
	   badd_12<=5'd12;
	   badd_13<=5'd13;
	   badd_14<=5'd14;
	   badd_15<=5'd15;
	   badd_16<=5'd16;
	   badd_17<=5'd17;
	   badd_18<=5'd18;
	   badd_19<=5'd19;
	   badd_20<=5'd20;
	   badd_21<=5'd21;
	   badd_22<=5'd22;
	   badd_23<=5'd23;
	   badd_24<=5'd24;
	   badd_25<=5'd25;
	   badd_26<=5'd26;
	   badd_27<=5'd27;
	   badd_28<=5'd28;
	   badd_29<=5'd29;
	   badd_30<=5'd30;
	   badd_31<=5'd31;
end


always@(posedge clk or negedge rst)
if(!rst)
begin
     add_0 <=5'd0;
	   add_1 <=5'd0;
	   add_2 <=5'd0;
	   add_3 <=5'd0;
	   add_4 <=5'd0;
	   add_5 <=5'd0;
	   add_6 <=5'd0;
	   add_7 <=5'd0;
	   add_8 <=5'd0;
	   add_9 <=5'd0;
	   add_10<=5'd0;
	   add_11<=5'd0;
	   add_12<=5'd0;
	   add_13<=5'd0;
	   add_14<=5'd0;
	   add_15<=5'd0;
	   add_16<=5'd0;
	   add_17<=5'd0;
	   add_18<=5'd0;
	   add_19<=5'd0;
	   add_20<=5'd0;
	   add_21<=5'd0;
	   add_22<=5'd0;
	   add_23<=5'd0;
	   add_24<=5'd0;
	   add_25<=5'd0;
	   add_26<=5'd0;
	   add_27<=5'd0;
	   add_28<=5'd0;
	   add_29<=5'd0;
	   add_30<=5'd0;
	   add_31<=5'd0;
end
else
  if(enable) 
begin
if(!wen)
case(i_transize)
 DCT_8:
  if(!counter[0])
    begin
	        add_0<=5'd0;
          add_1<=5'd0;
          add_2<=5'd0;
          add_3<=5'd0;
          add_4<=5'd0;
          add_5<=5'd0;
          add_6<=5'd0;
          add_7<=5'd0;
          add_8<=5'd0;
          add_9<=5'd0;
          add_10<=5'd0;
          add_11<=5'd0;
          add_12<=5'd0;
          add_13<=5'd0;
          add_14<=5'd0;
          add_15<=5'd0;
          add_16<=5'd1;
          add_17<=5'd1;
          add_18<=5'd1;
          add_19<=5'd1;
          add_20<=5'd1;
          add_21<=5'd1;
          add_22<=5'd1;
          add_23<=5'd1;
          add_24<=5'd1;
          add_25<=5'd1;
          add_26<=5'd1;
          add_27<=5'd1;
          add_28<=5'd1;
          add_29<=5'd1;
          add_30<=5'd1;
          add_31<=5'd1;
	   end
  else
    begin
	        add_0<=5'd1;
          add_1<=5'd1;
          add_2<=5'd1;
          add_3<=5'd1;
          add_4<=5'd1;
          add_5<=5'd1;
          add_6<=5'd1;
          add_7<=5'd1;
          add_8<=5'd1;
          add_9<=5'd1;
         add_10<=5'd1;
         add_11<=5'd1;
         add_12<=5'd1;
         add_13<=5'd1;
         add_14<=5'd1;
         add_15<=5'd1;
         add_16<=5'd0;
         add_17<=5'd0;
         add_18<=5'd0;
         add_19<=5'd0;
         add_20<=5'd0;
         add_21<=5'd0;
         add_22<=5'd0;
         add_23<=5'd0;
         add_24<=5'd0;
         add_25<=5'd0;
         add_26<=5'd0;
         add_27<=5'd0;
         add_28<=5'd0;
         add_29<=5'd0;
         add_30<=5'd0;
         add_31<=5'd0;
    end	
 DCT_16:begin
	   add_0 <=q_160;
	   add_1 <=q_160;
	   add_2 <=q_160;
	   add_3 <=q_160;
	   add_4 <=q_161;
	   add_5 <=q_161;
	   add_6 <=q_161;
	   add_7 <=q_161;
	   add_8 <=q_162;
	   add_9 <=q_162;
	   add_10<=q_162;
	   add_11<=q_162;
	   add_12<=q_163;
	   add_13<=q_163;
	   add_14<=q_163;
	   add_15<=q_163;
	   add_16<=q_164;
	   add_17<=q_164;
	   add_18<=q_164;
	   add_19<=q_164;
	   add_20<=q_165;
	   add_21<=q_165;
	   add_22<=q_165;
	   add_23<=q_165;
	   add_24<=q_166;
	   add_25<=q_166;
	   add_26<=q_166;
	   add_27<=q_166;
	   add_28<=q_167;
	   add_29<=q_167;
	   add_30<=q_167;
	   add_31<=q_167;
	   end
  DCT_32:begin
     add_0 <=5'd0 -counter[4:0];
	   add_1 <=5'd1 -counter[4:0];
	   add_2 <=5'd2 -counter[4:0];
	   add_3 <=5'd3 -counter[4:0];
	   add_4 <=5'd4 -counter[4:0];
	   add_5 <=5'd5 -counter[4:0];
	   add_6 <=5'd6 -counter[4:0];
	   add_7 <=5'd7 -counter[4:0];
	   add_8 <=5'd8 -counter[4:0];
	   add_9 <=5'd9 -counter[4:0];
	   add_10<=5'd10-counter[4:0];
	   add_11<=5'd11-counter[4:0];
	   add_12<=5'd12-counter[4:0];
	   add_13<=5'd13-counter[4:0];
	   add_14<=5'd14-counter[4:0];
	   add_15<=5'd15-counter[4:0];
	   add_16<=5'd16-counter[4:0];
	   add_17<=5'd17-counter[4:0];
	   add_18<=5'd18-counter[4:0];
	   add_19<=5'd19-counter[4:0];
	   add_20<=5'd20-counter[4:0];
	   add_21<=5'd21-counter[4:0];
	   add_22<=5'd22-counter[4:0];
	   add_23<=5'd23-counter[4:0];
	   add_24<=5'd24-counter[4:0];
	   add_25<=5'd25-counter[4:0];
	   add_26<=5'd26-counter[4:0];
	   add_27<=5'd27-counter[4:0];
	   add_28<=5'd28-counter[4:0];
	   add_29<=5'd29-counter[4:0];
	   add_30<=5'd30-counter[4:0];
	   add_31<=5'd31-counter[4:0];
	   end
 endcase
else
 case(i_transize)
 DCT_8:
    if(!counter[0])
     begin
	     add_0 <=5'd0;
	     add_1 <=5'd0;
	     add_2 <=5'd0;
	     add_3 <=5'd0;
	     add_4 <=5'd0;
	     add_5 <=5'd0;
	     add_6 <=5'd0;
	     add_7 <=5'd0;
	     add_8 <=5'd0;
	     add_9 <=5'd0;
	     add_10<=5'd0;
	     add_11<=5'd0;
	     add_12<=5'd0;
	     add_13<=5'd0;
	     add_14<=5'd0;
	     add_15<=5'd0;
	     add_16<=5'd0;
	     add_17<=5'd0;
	     add_18<=5'd0;
	     add_19<=5'd0;
	     add_20<=5'd0;
	     add_21<=5'd0;
	     add_22<=5'd0;
	     add_23<=5'd0;
	     add_24<=5'd0;
	     add_25<=5'd0;
	     add_26<=5'd0;
	     add_27<=5'd0;
	     add_28<=5'd0;
	     add_29<=5'd0;
	     add_30<=5'd0;
	     add_31<=5'd0;
	   end
	  else
	   begin
	   	 add_0 <=5'd1;
	     add_1 <=5'd1;
	     add_2 <=5'd1;
	     add_3 <=5'd1;
	     add_4 <=5'd1;
	     add_5 <=5'd1;
	     add_6 <=5'd1;
	     add_7 <=5'd1;
	     add_8 <=5'd1;
	     add_9 <=5'd1;
	     add_10<=5'd1;
	     add_11<=5'd1;
	     add_12<=5'd1;
	     add_13<=5'd1;
	     add_14<=5'd1;
	     add_15<=5'd1;
	     add_16<=5'd1;
	     add_17<=5'd1;
	     add_18<=5'd1;
	     add_19<=5'd1;
	     add_20<=5'd1;
	     add_21<=5'd1;
	     add_22<=5'd1;
	     add_23<=5'd1;
	     add_24<=5'd1;
	     add_25<=5'd1;
	     add_26<=5'd1;
	     add_27<=5'd1;
	     add_28<=5'd1;
	     add_29<=5'd1;
	     add_30<=5'd1;
	     add_31<=5'd1;
	   end
 DCT_16:begin
   add_0 <=counter[2:0];
   add_1 <=counter[2:0];
   add_2 <=counter[2:0];
   add_3 <=counter[2:0];
   add_4 <=counter[2:0];
   add_5 <=counter[2:0];
   add_6 <=counter[2:0];
   add_7 <=counter[2:0];
   add_8 <=counter[2:0];
   add_9 <=counter[2:0];
   add_10<=counter[2:0];
   add_11<=counter[2:0];
   add_12<=counter[2:0];
   add_13<=counter[2:0];
   add_14<=counter[2:0];
   add_15<=counter[2:0];
   add_16<=counter[2:0];
   add_17<=counter[2:0];
   add_18<=counter[2:0];
   add_19<=counter[2:0];
   add_20<=counter[2:0];
   add_21<=counter[2:0];
   add_22<=counter[2:0];
   add_23<=counter[2:0];
   add_24<=counter[2:0];
   add_25<=counter[2:0];
   add_26<=counter[2:0];
   add_27<=counter[2:0];
   add_28<=counter[2:0];
   add_29<=counter[2:0];
   add_30<=counter[2:0];
   add_31<=counter[2:0];
	end
  DCT_32:begin
     add_0 <=counter[4:0];
	   add_1 <=counter[4:0];
	   add_2 <=counter[4:0];
	   add_3 <=counter[4:0];
	   add_4 <=counter[4:0];
	   add_5 <=counter[4:0];
	   add_6 <=counter[4:0];
	   add_7 <=counter[4:0];
	   add_8 <=counter[4:0];
	   add_9 <=counter[4:0];
	   add_10<=counter[4:0];
	   add_11<=counter[4:0];
	   add_12<=counter[4:0];
	   add_13<=counter[4:0];
	   add_14<=counter[4:0];
	   add_15<=counter[4:0];
	   add_16<=counter[4:0];
	   add_17<=counter[4:0];
	   add_18<=counter[4:0];
	   add_19<=counter[4:0];
	   add_20<=counter[4:0];
	   add_21<=counter[4:0];
	   add_22<=counter[4:0];
	   add_23<=counter[4:0];
	   add_24<=counter[4:0];
	   add_25<=counter[4:0];
	   add_26<=counter[4:0];
	   add_27<=counter[4:0];
	   add_28<=counter[4:0];
	   add_29<=counter[4:0];
	   add_30<=counter[4:0];
	   add_31<=counter[4:0];
	   end
 endcase
 end
 else
 begin
     add_0 <=5'd0;
	   add_1 <=5'd0;
	   add_2 <=5'd0;
	   add_3 <=5'd0;
	   add_4 <=5'd0;
	   add_5 <=5'd0;
	   add_6 <=5'd0;
	   add_7 <=5'd0;
	   add_8 <=5'd0;
	   add_9 <=5'd0;
	   add_10<=5'd0;
	   add_11<=5'd0;
	   add_12<=5'd0;
	   add_13<=5'd0;
	   add_14<=5'd0;
	   add_15<=5'd0;
	   add_16<=5'd0;
	   add_17<=5'd0;
	   add_18<=5'd0;
	   add_19<=5'd0;
	   add_20<=5'd0;
	   add_21<=5'd0;
	   add_22<=5'd0;
	   add_23<=5'd0;
	   add_24<=5'd0;
	   add_25<=5'd0;
	   add_26<=5'd0;
	   add_27<=5'd0;
	   add_28<=5'd0;
	   add_29<=5'd0;
	   add_30<=5'd0;
	   add_31<=5'd0;
end

endmodule
