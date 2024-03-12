     module dct_top_2d(
                    clk,
                    rst,
		            inverse,
                i_valid,
             i_transize,
			         tq_sel_i,
               
               i_data_0,
               i_data_1,
               i_data_2,
               i_data_3,
               i_data_4,
               i_data_5,
               i_data_6,
               i_data_7,
               i_data_8,
               i_data_9,
               i_data_10,
               i_data_11,
               i_data_12,
               i_data_13,
               i_data_14,
               i_data_15,
               i_data_16,
               i_data_17,
               i_data_18,
               i_data_19,
               i_data_20,
               i_data_21,
               i_data_22,
               i_data_23,
               i_data_24,
               i_data_25,
               i_data_26,
               i_data_27,
               i_data_28,
               i_data_29,
               i_data_30,
               i_data_31,
               
                 o_valid,
                o_data_0,
                o_data_1,
                o_data_2,
                o_data_3,
                o_data_4,
                o_data_5,
                o_data_6,
                o_data_7,
                o_data_8,
                o_data_9,
                o_data_10,
                o_data_11,
                o_data_12,
                o_data_13,
                o_data_14,
                o_data_15,
                o_data_16,
                o_data_17,
                o_data_18,
                o_data_19,
                o_data_20,
                o_data_21,
                o_data_22,
                o_data_23,
                o_data_24,
                o_data_25,
                o_data_26,
                o_data_27,
                o_data_28,
                o_data_29,
                o_data_30,
                o_data_31
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
                                
input                                    clk;
input                                    rst;
input                                inverse;
input                                i_valid;
input           [1:0]             i_transize;
input           [1:0]               tq_sel_i;
input  signed   [15:0]              i_data_0;   
input  signed   [15:0]              i_data_1; 
input  signed   [15:0]              i_data_2; 
input  signed   [15:0]              i_data_3; 
input  signed   [15:0]              i_data_4; 
input  signed   [15:0]              i_data_5; 
input  signed   [15:0]              i_data_6; 
input  signed   [15:0]              i_data_7; 
input  signed   [15:0]              i_data_8; 
input  signed   [15:0]              i_data_9; 
input  signed   [15:0]              i_data_10; 
input  signed   [15:0]              i_data_11;
input  signed   [15:0]              i_data_12; 
input  signed   [15:0]              i_data_13; 
input  signed   [15:0]              i_data_14; 
input  signed   [15:0]              i_data_15; 
input  signed   [15:0]              i_data_16; 
input  signed   [15:0]              i_data_17; 
input  signed   [15:0]              i_data_18; 
input  signed   [15:0]              i_data_19; 
input  signed   [15:0]              i_data_20; 
input  signed   [15:0]              i_data_21; 
input  signed   [15:0]              i_data_22; 
input  signed   [15:0]              i_data_23; 
input  signed   [15:0]              i_data_24; 
input  signed   [15:0]              i_data_25; 
input  signed   [15:0]              i_data_26; 
input  signed   [15:0]              i_data_27; 
input  signed   [15:0]              i_data_28;   
input  signed   [15:0]              i_data_29; 
input  signed   [15:0]              i_data_30; 
input  signed   [15:0]              i_data_31; 
                                 
output                               o_valid;
output signed   [15:0]              o_data_0;
output signed   [15:0]              o_data_1;
output signed   [15:0]              o_data_2;
output signed   [15:0]              o_data_3;
output signed   [15:0]              o_data_4;
output signed   [15:0]              o_data_5;
output signed   [15:0]              o_data_6;
output signed   [15:0]              o_data_7;
output signed   [15:0]              o_data_8;
output signed   [15:0]              o_data_9;
output signed   [15:0]              o_data_10;
output signed   [15:0]              o_data_11;
output signed   [15:0]              o_data_12;
output signed   [15:0]              o_data_13;
output signed   [15:0]              o_data_14;
output signed   [15:0]              o_data_15;
output signed   [15:0]              o_data_16;
output signed   [15:0]              o_data_17;
output signed   [15:0]              o_data_18;
output signed   [15:0]              o_data_19;
output signed   [15:0]              o_data_20;
output signed   [15:0]              o_data_21;
output signed   [15:0]              o_data_22;
output signed   [15:0]              o_data_23;
output signed   [15:0]              o_data_24;
output signed   [15:0]              o_data_25;
output signed   [15:0]              o_data_26;
output signed   [15:0]              o_data_27;
output signed   [15:0]              o_data_28;
output signed   [15:0]              o_data_29;
output signed   [15:0]              o_data_30;
output signed   [15:0]              o_data_31;

// ********************************************
//                                             
//    WIRE DECLARATION                                               
//                                                                             
// ******************************************** 

wire                                    i_val;
wire                                      row;
wire                                i_d_valid;
wire  signed    [15:0]                 i_d_0 ;
wire  signed    [15:0]                 i_d_1 ;
wire  signed    [15:0]                 i_d_2 ;
wire  signed    [15:0]                 i_d_3 ;
wire  signed    [15:0]                 i_d_4 ;
wire  signed    [15:0]                 i_d_5 ;
wire  signed    [15:0]                 i_d_6 ;
wire  signed    [15:0]                 i_d_7 ;
wire  signed    [15:0]                 i_d_8 ;
wire  signed    [15:0]                 i_d_9 ;
wire  signed    [15:0]                 i_d_10;
wire  signed    [15:0]                 i_d_11;
wire  signed    [15:0]                 i_d_12;
wire  signed    [15:0]                 i_d_13;
wire  signed    [15:0]                 i_d_14;
wire  signed    [15:0]                 i_d_15;
wire  signed    [15:0]                 i_d_16;
wire  signed    [15:0]                 i_d_17;
wire  signed    [15:0]                 i_d_18;
wire  signed    [15:0]                 i_d_19;
wire  signed    [15:0]                 i_d_20;
wire  signed    [15:0]                 i_d_21;
wire  signed    [15:0]                 i_d_22;
wire  signed    [15:0]                 i_d_23;
wire  signed    [15:0]                 i_d_24;
wire  signed    [15:0]                 i_d_25;
wire  signed    [15:0]                 i_d_26;
wire  signed    [15:0]                 i_d_27;
wire  signed    [15:0]                 i_d_28;
wire  signed    [15:0]                 i_d_29;
wire  signed    [15:0]                 i_d_30;
wire  signed    [15:0]                 i_d_31;

wire                                o_d_valid;
wire  signed    [15:0]                 o_d_0 ;
wire  signed    [15:0]                 o_d_1 ;
wire  signed    [15:0]                 o_d_2 ;
wire  signed    [15:0]                 o_d_3 ;
wire  signed    [15:0]                 o_d_4 ;
wire  signed    [15:0]                 o_d_5 ;
wire  signed    [15:0]                 o_d_6 ;
wire  signed    [15:0]                 o_d_7 ;
wire  signed    [15:0]                 o_d_8 ;
wire  signed    [15:0]                 o_d_9 ;
wire  signed    [15:0]                 o_d_10;
wire  signed    [15:0]                 o_d_11;
wire  signed    [15:0]                 o_d_12;
wire  signed    [15:0]                 o_d_13;
wire  signed    [15:0]                 o_d_14;
wire  signed    [15:0]                 o_d_15;
wire  signed    [15:0]                 o_d_16;
wire  signed    [15:0]                 o_d_17;
wire  signed    [15:0]                 o_d_18;
wire  signed    [15:0]                 o_d_19;
wire  signed    [15:0]                 o_d_20;
wire  signed    [15:0]                 o_d_21;
wire  signed    [15:0]                 o_d_22;
wire  signed    [15:0]                 o_d_23;
wire  signed    [15:0]                 o_d_24;
wire  signed    [15:0]                 o_d_25;
wire  signed    [15:0]                 o_d_26;
wire  signed    [15:0]                 o_d_27;
wire  signed    [15:0]                 o_d_28;
wire  signed    [15:0]                 o_d_29;
wire  signed    [15:0]                 o_d_30;
wire  signed    [15:0]                 o_d_31;

wire                                i_s_valid;
wire  signed    [15:0]                 i_s_0 ;
wire  signed    [15:0]                 i_s_1 ;
wire  signed    [15:0]                 i_s_2 ;
wire  signed    [15:0]                 i_s_3 ;
wire  signed    [15:0]                 i_s_4 ;
wire  signed    [15:0]                 i_s_5 ;
wire  signed    [15:0]                 i_s_6 ;
wire  signed    [15:0]                 i_s_7 ;
wire  signed    [15:0]                 i_s_8 ;
wire  signed    [15:0]                 i_s_9 ;
wire  signed    [15:0]                 i_s_10;
wire  signed    [15:0]                 i_s_11;
wire  signed    [15:0]                 i_s_12;
wire  signed    [15:0]                 i_s_13;
wire  signed    [15:0]                 i_s_14;
wire  signed    [15:0]                 i_s_15;
wire  signed    [15:0]                 i_s_16;
wire  signed    [15:0]                 i_s_17;
wire  signed    [15:0]                 i_s_18;
wire  signed    [15:0]                 i_s_19;
wire  signed    [15:0]                 i_s_20;
wire  signed    [15:0]                 i_s_21;
wire  signed    [15:0]                 i_s_22;
wire  signed    [15:0]                 i_s_23;
wire  signed    [15:0]                 i_s_24;
wire  signed    [15:0]                 i_s_25;
wire  signed    [15:0]                 i_s_26;
wire  signed    [15:0]                 i_s_27;
wire  signed    [15:0]                 i_s_28;
wire  signed    [15:0]                 i_s_29;
wire  signed    [15:0]                 i_s_30;
wire  signed    [15:0]                 i_s_31;

wire                                o_s_valid;
wire  signed    [15:0]                 o_s_0 ;
wire  signed    [15:0]                 o_s_1 ;
wire  signed    [15:0]                 o_s_2 ;
wire  signed    [15:0]                 o_s_3 ;
wire  signed    [15:0]                 o_s_4 ;
wire  signed    [15:0]                 o_s_5 ;
wire  signed    [15:0]                 o_s_6 ;
wire  signed    [15:0]                 o_s_7 ;
wire  signed    [15:0]                 o_s_8 ;
wire  signed    [15:0]                 o_s_9 ;
wire  signed    [15:0]                 o_s_10;
wire  signed    [15:0]                 o_s_11;
wire  signed    [15:0]                 o_s_12;
wire  signed    [15:0]                 o_s_13;
wire  signed    [15:0]                 o_s_14;
wire  signed    [15:0]                 o_s_15;
wire  signed    [15:0]                 o_s_16;
wire  signed    [15:0]                 o_s_17;
wire  signed    [15:0]                 o_s_18;
wire  signed    [15:0]                 o_s_19;
wire  signed    [15:0]                 o_s_20;
wire  signed    [15:0]                 o_s_21;
wire  signed    [15:0]                 o_s_22;
wire  signed    [15:0]                 o_s_23;
wire  signed    [15:0]                 o_s_24;
wire  signed    [15:0]                 o_s_25;
wire  signed    [15:0]                 o_s_26;
wire  signed    [15:0]                 o_s_27;
wire  signed    [15:0]                 o_s_28;
wire  signed    [15:0]                 o_s_29;
wire  signed    [15:0]                 o_s_30;
wire  signed    [15:0]                 o_s_31;

// ********************************************
//                                             
//    REG  DECLARATION                                               
//                                                                             
// ******************************************** 

reg                                counter_en;
reg                            counter_val_en;
reg             [2:0]                 counter;
reg             [4:0]             counter_val;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign  i_val=i_valid||counter_val_en;
assign  row=~(i_val||counter_en);

assign  i_d_valid=row?o_s_valid:i_valid;
assign  i_d_0 =row?o_s_0 :i_data_0 ;
assign  i_d_1 =row?o_s_1 :i_data_1 ;
assign  i_d_2 =row?o_s_2 :i_data_2 ;
assign  i_d_3 =row?o_s_3 :i_data_3 ;
assign  i_d_4 =row?o_s_4 :i_data_4 ;
assign  i_d_5 =row?o_s_5 :i_data_5 ;
assign  i_d_6 =row?o_s_6 :i_data_6 ;
assign  i_d_7 =row?o_s_7 :i_data_7 ;
assign  i_d_8 =row?o_s_8 :i_data_8 ;
assign  i_d_9 =row?o_s_9 :i_data_9 ;
assign  i_d_10=row?o_s_10:i_data_10;
assign  i_d_11=row?o_s_11:i_data_11;
assign  i_d_12=row?o_s_12:i_data_12;
assign  i_d_13=row?o_s_13:i_data_13;
assign  i_d_14=row?o_s_14:i_data_14;
assign  i_d_15=row?o_s_15:i_data_15;
assign  i_d_16=row?o_s_16:i_data_16;
assign  i_d_17=row?o_s_17:i_data_17;
assign  i_d_18=row?o_s_18:i_data_18;
assign  i_d_19=row?o_s_19:i_data_19;
assign  i_d_20=row?o_s_20:i_data_20;
assign  i_d_21=row?o_s_21:i_data_21;
assign  i_d_22=row?o_s_22:i_data_22;
assign  i_d_23=row?o_s_23:i_data_23;
assign  i_d_24=row?o_s_24:i_data_24;
assign  i_d_25=row?o_s_25:i_data_25;
assign  i_d_26=row?o_s_26:i_data_26;
assign  i_d_27=row?o_s_27:i_data_27;
assign  i_d_28=row?o_s_28:i_data_28;
assign  i_d_29=row?o_s_29:i_data_29;
assign  i_d_30=row?o_s_30:i_data_30;
assign  i_d_31=row?o_s_31:i_data_31;

assign  i_s_valid=row?1'b0:o_d_valid;
assign  i_s_0  =row?16'b0:o_d_0 ;
assign  i_s_1  =row?16'b0:o_d_1 ;
assign  i_s_2  =row?16'b0:o_d_2 ;
assign  i_s_3  =row?16'b0:o_d_3 ;
assign  i_s_4  =row?16'b0:o_d_4 ;
assign  i_s_5  =row?16'b0:o_d_5 ;
assign  i_s_6  =row?16'b0:o_d_6 ;
assign  i_s_7  =row?16'b0:o_d_7 ;
assign  i_s_8  =row?16'b0:o_d_8 ;
assign  i_s_9  =row?16'b0:o_d_9 ;
assign  i_s_10 =row?16'b0:o_d_10;
assign  i_s_11 =row?16'b0:o_d_11;
assign  i_s_12 =row?16'b0:o_d_12;
assign  i_s_13 =row?16'b0:o_d_13;
assign  i_s_14 =row?16'b0:o_d_14;
assign  i_s_15 =row?16'b0:o_d_15;
assign  i_s_16 =row?16'b0:o_d_16;
assign  i_s_17 =row?16'b0:o_d_17;
assign  i_s_18 =row?16'b0:o_d_18;
assign  i_s_19 =row?16'b0:o_d_19;
assign  i_s_20 =row?16'b0:o_d_20;
assign  i_s_21 =row?16'b0:o_d_21;
assign  i_s_22 =row?16'b0:o_d_22;
assign  i_s_23 =row?16'b0:o_d_23;
assign  i_s_24 =row?16'b0:o_d_24;
assign  i_s_25 =row?16'b0:o_d_25;
assign  i_s_26 =row?16'b0:o_d_26;
assign  i_s_27 =row?16'b0:o_d_27;
assign  i_s_28 =row?16'b0:o_d_28;
assign  i_s_29 =row?16'b0:o_d_29;
assign  i_s_30 =row?16'b0:o_d_30;
assign  i_s_31 =row?16'b0:o_d_31;

assign  o_valid=row?o_d_valid:1'b0;
assign  o_data_0 =row?o_d_0 :16'b0;
assign  o_data_1 =row?o_d_1 :16'b0;
assign  o_data_2 =row?o_d_2 :16'b0;
assign  o_data_3 =row?o_d_3 :16'b0;
assign  o_data_4 =row?o_d_4 :16'b0;
assign  o_data_5 =row?o_d_5 :16'b0;
assign  o_data_6 =row?o_d_6 :16'b0;
assign  o_data_7 =row?o_d_7 :16'b0;
assign  o_data_8 =row?o_d_8 :16'b0;
assign  o_data_9 =row?o_d_9 :16'b0;
assign  o_data_10=row?o_d_10:16'b0;
assign  o_data_11=row?o_d_11:16'b0;
assign  o_data_12=row?o_d_12:16'b0;
assign  o_data_13=row?o_d_13:16'b0;
assign  o_data_14=row?o_d_14:16'b0;
assign  o_data_15=row?o_d_15:16'b0;
assign  o_data_16=row?o_d_16:16'b0;
assign  o_data_17=row?o_d_17:16'b0;
assign  o_data_18=row?o_d_18:16'b0;
assign  o_data_19=row?o_d_19:16'b0;
assign  o_data_20=row?o_d_20:16'b0;
assign  o_data_21=row?o_d_21:16'b0;
assign  o_data_22=row?o_d_22:16'b0;
assign  o_data_23=row?o_d_23:16'b0;
assign  o_data_24=row?o_d_24:16'b0;
assign  o_data_25=row?o_d_25:16'b0;
assign  o_data_26=row?o_d_26:16'b0;
assign  o_data_27=row?o_d_27:16'b0;
assign  o_data_28=row?o_d_28:16'b0;
assign  o_data_29=row?o_d_29:16'b0;
assign  o_data_30=row?o_d_30:16'b0;
assign  o_data_31=row?o_d_31:16'b0;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  counter_val<=5'd0;
else
  if(i_valid)
    case(i_transize)
     2'b00:
        counter_val<=5'd0;
     2'b01:
        if(counter_val==5'd1)
           counter_val<=5'd0;
         else
           counter_val<=counter_val+1'b1;
     2'b10:
        if(counter_val==5'd7)
           counter_val<=5'd0;
         else
           counter_val<=counter_val+1'b1;
     2'b11:
        if(counter_val==5'd31)
           counter_val<=5'd0;
         else
           counter_val<=counter_val+1'b1;      
    endcase

always@(posedge clk or negedge rst)
if(!rst)
  counter_val_en<=1'b0;
else
  case(i_transize)
   2'b00:counter_val_en<=1'b0;
   2'b01:begin
         if((counter_val==5'd0)&&(i_valid))
            counter_val_en<=1'b1;
        else if((counter_val==5'd1)&&(i_valid))
            counter_val_en<=1'b0;
          end
   2'b10:begin
         if((counter_val==5'd0)&&(i_valid))
            counter_val_en<=1'b1;
        else if((counter_val==5'd7)&&(i_valid))
            counter_val_en<=1'b0;
          end
   2'b11:begin
         if((counter_val==5'd0)&&(i_valid))
            counter_val_en<=1'b1;
        else if((counter_val==5'd31)&&(i_valid))
            counter_val_en<=1'b0;
          end
  endcase
            
always@(posedge clk or negedge rst)
 if(!rst)
   counter_en<=1'b0;
 else
    case(i_transize)
   2'b00:begin
      if(i_valid)
         counter_en<=1'b1;
      else if(counter==3'd4)
        begin
         counter_en<=1'b0;
       end
     end
   2'b01:begin
      if(i_valid&&(counter_val==5'd1))
        counter_en<=1'b1;
    else if(counter==3'd5)
      begin
       counter_en<=1'b0;      
      end
     end
   2'b10:begin
      if(i_valid&&(counter_val==5'd7))
        counter_en<=1'b1;
      else if(counter==3'd5)
       begin
       counter_en<=1'b0;    
      end
     end 
   2'b11:begin
      if(i_valid&&(counter_val==5'd31))
        counter_en<=1'b1;
      else if(counter==3'd5)
       begin
       counter_en<=1'b0;     
      end
     end 
   endcase
   
   always@(posedge clk or negedge rst)
    if(!rst)
      counter<=3'd0;
    else if(((i_transize=='d0)&&(counter==3'd4))||
			((i_transize=='d1)&&(counter==3'd5))||
			((i_transize=='d2)&&(counter==3'd5))||
			((i_transize=='d3)&&(counter==3'd5)))
		       counter <= 3'd0;
    else if(counter_en)
           counter<=counter+1'b1;
     else
           counter<=3'd0;
       
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

dct_top dct_top_0(
              clk,
              rst,
			        row,
        i_d_valid,
		      inverse,
       i_transize,
	       tq_sel_i,
       
            i_d_0,
            i_d_1,
            i_d_2,
            i_d_3,
            i_d_4,
            i_d_5,
            i_d_6,
            i_d_7,
            i_d_8,
            i_d_9,
           i_d_10,
           i_d_11,
           i_d_12,
           i_d_13,
           i_d_14,
           i_d_15,
           i_d_16,
           i_d_17,
           i_d_18,
           i_d_19,
           i_d_20,
           i_d_21,
           i_d_22,
           i_d_23,
           i_d_24,
           i_d_25,
           i_d_26,
           i_d_27,
           i_d_28,
           i_d_29,
           i_d_30,
           i_d_31,
       
        o_d_valid,
            o_d_0,
            o_d_1,
            o_d_2,
            o_d_3,
            o_d_4,
            o_d_5,
            o_d_6,
            o_d_7,
            o_d_8,
            o_d_9,
           o_d_10,
           o_d_11,
           o_d_12,
           o_d_13,
           o_d_14,
           o_d_15,
           o_d_16,
           o_d_17,
           o_d_18,
           o_d_19,
           o_d_20,
           o_d_21,
           o_d_22,
           o_d_23,
           o_d_24,
           o_d_25,
           o_d_26,
           o_d_27,
           o_d_28,
           o_d_29,
           o_d_30,
           o_d_31
       
);

transform_memory  transform_memory_top0(
                      clk,
                      rst,
                i_s_valid,
               i_transize,
                     
                     i_s_0,
                     i_s_1,
                     i_s_2,
                     i_s_3,
                     i_s_4,
                     i_s_5,
                     i_s_6,
                     i_s_7,
                     i_s_8,
                     i_s_9,
                     i_s_10,
                     i_s_11,
                     i_s_12,
                     i_s_13,
                     i_s_14,
                     i_s_15,
                     i_s_16,
                     i_s_17,
                     i_s_18,
                     i_s_19,
                     i_s_20,
                     i_s_21,
                     i_s_22,
                     i_s_23,
                     i_s_24,
                     i_s_25,
                     i_s_26,
                     i_s_27,
                     i_s_28,
                     i_s_29,
                     i_s_30,
                     i_s_31,
                     
                 o_s_valid,
				     o_s_0,
                     o_s_1,
                     o_s_2,
                     o_s_3,
                     o_s_4,
                     o_s_5,
                     o_s_6,
                     o_s_7,
                     o_s_8,
                     o_s_9,
                     o_s_10,
                     o_s_11,
                     o_s_12,
                     o_s_13,
                     o_s_14,
                     o_s_15,
                     o_s_16,
                     o_s_17,
                     o_s_18,
                     o_s_19,
                     o_s_20,
                     o_s_21,
                     o_s_22,
                     o_s_23,
                     o_s_24,
                     o_s_25,
                     o_s_26,
                     o_s_27,
                     o_s_28,
                     o_s_29,
                     o_s_30,
                     o_s_31
       
);

endmodule
