module offset_shift(
                 clk,
                 rst, 
                 row,
             i_valid,
			       inverse,
          i_transize,
          
                 i_0,
                 i_1,
                 i_2,
                 i_3,
                 i_4,
                 i_5,
                 i_6,
                 i_7,
                 i_8,
                 i_9,
                i_10,
                i_11,
                i_12,
                i_13,
                i_14,
                i_15,
                i_16,
                i_17,
                i_18,
                i_19,
                i_20,
                i_21,
                i_22,
                i_23,
                i_24,
                i_25,
                i_26,
                i_27,
                i_28,
                i_29,
                i_30,
                i_31,
               
             o_valid,
                 o_0,
                 o_1,
                 o_2,
                 o_3,
                 o_4,
                 o_5,
                 o_6,
                 o_7,
                 o_8,
                 o_9,
                o_10,
                o_11,
                o_12,
                o_13,
                o_14,
                o_15,
                o_16,
                o_17,
                o_18,
                o_19,
                o_20,
                o_21,
                o_22,
                o_23,
                o_24,
                o_25,
                o_26,
                o_27,
                o_28,
                o_29,
                o_30,
                o_31
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************

input                   clk;
input                   rst;
input                   row;
input               inverse;
input               i_valid;
input   [1:0]    i_transize;
input  signed  [27:0]   i_0;
input  signed  [27:0]   i_1;
input  signed  [27:0]   i_2;
input  signed  [27:0]   i_3;
input  signed  [27:0]   i_4;
input  signed  [27:0]   i_5;
input  signed  [27:0]   i_6;
input  signed  [27:0]   i_7;
input  signed  [27:0]   i_8;
input  signed  [27:0]   i_9;
input  signed  [27:0]   i_10;
input  signed  [27:0]   i_11;
input  signed  [27:0]   i_12;
input  signed  [27:0]   i_13;
input  signed  [27:0]   i_14;
input  signed  [27:0]   i_15;
input  signed  [27:0]   i_16;
input  signed  [27:0]   i_17;
input  signed  [27:0]   i_18;
input  signed  [27:0]   i_19;
input  signed  [27:0]   i_20;
input  signed  [27:0]   i_21;
input  signed  [27:0]   i_22;
input  signed  [27:0]   i_23;
input  signed  [27:0]   i_24;
input  signed  [27:0]   i_25;
input  signed  [27:0]   i_26;
input  signed  [27:0]   i_27;
input  signed  [27:0]   i_28;
input  signed  [27:0]   i_29;
input  signed  [27:0]   i_30;
input  signed  [27:0]   i_31;

output reg             o_valid;
output reg signed [15:0]   o_0;
output reg signed [15:0]   o_1;
output reg signed [15:0]   o_2;
output reg signed [15:0]   o_3;
output reg signed [15:0]   o_4;
output reg signed [15:0]   o_5;
output reg signed [15:0]   o_6;
output reg signed [15:0]   o_7;
output reg signed [15:0]   o_8;
output reg signed [15:0]   o_9;
output reg signed [15:0]   o_10;
output reg signed [15:0]   o_11;
output reg signed [15:0]   o_12;
output reg signed [15:0]   o_13;
output reg signed [15:0]   o_14;
output reg signed [15:0]   o_15;
output reg signed [15:0]   o_16;
output reg signed [15:0]   o_17;
output reg signed [15:0]   o_18;
output reg signed [15:0]   o_19;
output reg signed [15:0]   o_20;
output reg signed [15:0]   o_21;
output reg signed [15:0]   o_22;
output reg signed [15:0]   o_23;
output reg signed [15:0]   o_24;
output reg signed [15:0]   o_25;
output reg signed [15:0]   o_26;
output reg signed [15:0]   o_27;
output reg signed [15:0]   o_28;
output reg signed [15:0]   o_29;
output reg signed [15:0]   o_30;
output reg signed [15:0]   o_31;

// ********************************************
//                                             
//    REG DECLARATION                                               
//                                                                             
// ******************************************** 
reg signed  [12:0] offset_4;
reg signed  [12:0] offset_8;
reg signed  [12:0] offset_16;
reg signed  [12:0] offset_32;

reg signed  [4:0]  shift_4;
reg signed  [4:0]  shift_8;
reg signed  [4:0]  shift_16;
reg signed  [4:0]  shift_32;

// ********************************************
//                                             
//    PARAMETER  DECLARATION                                               
//                                                                             
// ********************************************  

parameter  DCT_4=2'b00;
parameter  DCT_8=2'b01;
parameter  DCT_16=2'b10;
parameter  DCT_32=2'b11;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

always@(*)
 if(inverse)
   if(row)
      begin
      shift_4=5'd12;
      shift_8=5'd12;
      shift_16=5'd12;
      shift_32=5'd12;
      offset_4=(1<<<11);
      offset_8=(1<<<11);
      offset_16=(1<<<11);
      offset_32=(1<<<11);
      end
    else
      begin
      shift_4=5'd7;
      shift_8=5'd7;
      shift_16=5'd7;
      shift_32=5'd7;
      offset_4=(1<<<6);
      offset_8=(1<<<6);
      offset_16=(1<<<6);
      offset_32=(1<<<6);
      end
  else
    if(row)
       begin
       shift_4=5'd8;
       shift_8=5'd9;
       shift_16=5'd10;
       shift_32=5'd11;
       offset_4=(1<<<7);
       offset_8=(1<<<8);
       offset_16=(1<<<9);
       offset_32=(1<<<10);
    end
	else
	  begin
	   shift_4=5'd1;
       shift_8=5'd2;
       shift_16=5'd3;
       shift_32=5'd4;
       offset_4=1;
       offset_8=(1<<<1);
       offset_16=(1<<<2);
       offset_32=(1<<<3);
	  end

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************
        
always@(posedge clk or negedge rst)
   if(!rst)
    o_valid<=1'b0;
  else 
    o_valid<=i_valid;
    
always @(posedge clk or negedge rst) 
 if(!rst)
   begin
    o_0<=16'b0;
    o_1<=16'b0;
    o_2<=16'b0;
    o_3<=16'b0;
    o_4<=16'b0;
    o_5<=16'b0;
    o_6<=16'b0;
    o_7<=16'b0;
    o_8<=16'b0;
    o_9<=16'b0;
    o_10<=16'b0;
    o_11<=16'b0;
    o_12<=16'b0; 
    o_13<=16'b0;
    o_14<=16'b0;
    o_15<=16'b0;
    o_16<=16'b0;
    o_17<=16'b0;
    o_18<=16'b0;
    o_19<=16'b0;
    o_20<=16'b0;
    o_21<=16'b0;
    o_22<=16'b0;
    o_23<=16'b0;
    o_24<=16'b0;
    o_25<=16'b0;
    o_26<=16'b0;
    o_27<=16'b0;
    o_28<=16'b0;
    o_29<=16'b0;
    o_30<=16'b0; 
    o_31<=16'b0;
  end
else 
  case(i_transize)
    DCT_4:
     begin
        o_0 <=(i_0 +offset_4)>>>shift_4;
        o_1 <=(i_1 +offset_4)>>>shift_4;
        o_2 <=(i_2 +offset_4)>>>shift_4;
        o_3 <=(i_3 +offset_4)>>>shift_4;
	     	o_4<=16'b0;
        o_5<=16'b0;
        o_6<=16'b0;
        o_7<=16'b0;
        o_8  <=(i_8  +offset_4)>>>shift_4;
        o_9  <=(i_9  +offset_4)>>>shift_4;
        o_10 <=(i_10 +offset_4)>>>shift_4;
        o_11 <=(i_11 +offset_4)>>>shift_4;
		    o_12<=16'b0;
        o_13<=16'b0;
        o_14<=16'b0;
        o_15<=16'b0;
        o_16<=(i_16+offset_4)>>>shift_4;
        o_17<=(i_17+offset_4)>>>shift_4;
        o_18<=(i_18+offset_4)>>>shift_4;
        o_19<=(i_19+offset_4)>>>shift_4;
		    o_20<=16'b0;
        o_21<=16'b0;
        o_22<=16'b0;
        o_23<=16'b0;
        o_24<=(i_24+offset_4)>>>shift_4;
        o_25<=(i_25+offset_4)>>>shift_4;
        o_26<=(i_26+offset_4)>>>shift_4;
        o_27<=(i_27+offset_4)>>>shift_4;
        o_28<=16'b0;
        o_29<=16'b0;
        o_30<=16'b0; 
        o_31<=16'b0; 
      end
     DCT_8:
     begin
        o_0 <=(i_0 +offset_8)>>>shift_8;
        o_1 <=(i_1 +offset_8)>>>shift_8;
        o_2 <=(i_2 +offset_8)>>>shift_8;
        o_3 <=(i_3 +offset_8)>>>shift_8;
        o_4 <=(i_4 +offset_8)>>>shift_8;
        o_5 <=(i_5 +offset_8)>>>shift_8;
        o_6 <=(i_6 +offset_8)>>>shift_8;
        o_7 <=(i_7 +offset_8)>>>shift_8;
        o_8 <=(i_8 +offset_8)>>>shift_8;
        o_9 <=(i_9 +offset_8)>>>shift_8;
        o_10<=(i_10+offset_8)>>>shift_8;
        o_11<=(i_11+offset_8)>>>shift_8;
        o_12<=(i_12+offset_8)>>>shift_8;
        o_13<=(i_13+offset_8)>>>shift_8;
        o_14<=(i_14+offset_8)>>>shift_8;
        o_15<=(i_15+offset_8)>>>shift_8;
        o_16<=(i_16+offset_8)>>>shift_8;
        o_17<=(i_17+offset_8)>>>shift_8;
        o_18<=(i_18+offset_8)>>>shift_8;
        o_19<=(i_19+offset_8)>>>shift_8;
        o_20<=(i_20+offset_8)>>>shift_8;
        o_21<=(i_21+offset_8)>>>shift_8;
        o_22<=(i_22+offset_8)>>>shift_8;
        o_23<=(i_23+offset_8)>>>shift_8;
        o_24<=(i_24+offset_8)>>>shift_8;
        o_25<=(i_25+offset_8)>>>shift_8;
        o_26<=(i_26+offset_8)>>>shift_8;
        o_27<=(i_27+offset_8)>>>shift_8;
        o_28<=(i_28+offset_8)>>>shift_8;
        o_29<=(i_29+offset_8)>>>shift_8;
        o_30<=(i_30+offset_8)>>>shift_8;
        o_31<=(i_31+offset_8)>>>shift_8;
      end
    
    DCT_16:
     begin
        o_0<=(i_0+offset_16)>>>shift_16;
        o_1<=(i_1+offset_16)>>>shift_16;
        o_2<=(i_2+offset_16)>>>shift_16;
        o_3<=(i_3+offset_16)>>>shift_16;
        o_4<=(i_4+offset_16)>>>shift_16;
        o_5<=(i_5+offset_16)>>>shift_16;
        o_6<=(i_6+offset_16)>>>shift_16;
        o_7<=(i_7+offset_16)>>>shift_16;
        o_8<=(i_8+offset_16)>>>shift_16;
        o_9<=(i_9+offset_16)>>>shift_16;
        o_10<=(i_10+offset_16)>>>shift_16;
        o_11<=(i_11+offset_16)>>>shift_16;
        o_12<=(i_12+offset_16)>>>shift_16;
        o_13<=(i_13+offset_16)>>>shift_16;
        o_14<=(i_14+offset_16)>>>shift_16;
        o_15<=(i_15+offset_16)>>>shift_16;
        o_16<=(i_16+offset_16)>>>shift_16;
        o_17<=(i_17+offset_16)>>>shift_16;
        o_18<=(i_18+offset_16)>>>shift_16;
        o_19<=(i_19+offset_16)>>>shift_16;
        o_20<=(i_20+offset_16)>>>shift_16;
        o_21<=(i_21+offset_16)>>>shift_16;
        o_22<=(i_22+offset_16)>>>shift_16;
        o_23<=(i_23+offset_16)>>>shift_16;
        o_24<=(i_24+offset_16)>>>shift_16;
        o_25<=(i_25+offset_16)>>>shift_16;
        o_26<=(i_26+offset_16)>>>shift_16;
        o_27<=(i_27+offset_16)>>>shift_16;
        o_28<=(i_28+offset_16)>>>shift_16;
        o_29<=(i_29+offset_16)>>>shift_16;
        o_30<=(i_30+offset_16)>>>shift_16;
        o_31<=(i_31+offset_16)>>>shift_16;
      end  
      
    DCT_32:
      begin
        o_0<=(i_0+offset_32)>>>shift_32;
        o_1<=(i_1+offset_32)>>>shift_32;
        o_2<=(i_2+offset_32)>>>shift_32;
        o_3<=(i_3+offset_32)>>>shift_32;
        o_4<=(i_4+offset_32)>>>shift_32;
        o_5<=(i_5+offset_32)>>>shift_32;
        o_6<=(i_6+offset_32)>>>shift_32;
        o_7<=(i_7+offset_32)>>>shift_32;
        o_8<=(i_8+offset_32)>>>shift_32;
        o_9<=(i_9+offset_32)>>>shift_32;
        o_10<=(i_10+offset_32)>>>shift_32;
        o_11<=(i_11+offset_32)>>>shift_32;
        o_12<=(i_12+offset_32)>>>shift_32;
        o_13<=(i_13+offset_32)>>>shift_32;
        o_14<=(i_14+offset_32)>>>shift_32;
        o_15<=(i_15+offset_32)>>>shift_32;
        o_16<=(i_16+offset_32)>>>shift_32;
        o_17<=(i_17+offset_32)>>>shift_32;
        o_18<=(i_18+offset_32)>>>shift_32;
        o_19<=(i_19+offset_32)>>>shift_32;
        o_20<=(i_20+offset_32)>>>shift_32;
        o_21<=(i_21+offset_32)>>>shift_32;
        o_22<=(i_22+offset_32)>>>shift_32;
        o_23<=(i_23+offset_32)>>>shift_32;
        o_24<=(i_24+offset_32)>>>shift_32;
        o_25<=(i_25+offset_32)>>>shift_32;
        o_26<=(i_26+offset_32)>>>shift_32;
        o_27<=(i_27+offset_32)>>>shift_32;
        o_28<=(i_28+offset_32)>>>shift_32;
        o_29<=(i_29+offset_32)>>>shift_32;
        o_30<=(i_30+offset_32)>>>shift_32;
        o_31<=(i_31+offset_32)>>>shift_32;
      end  
  endcase

  endmodule