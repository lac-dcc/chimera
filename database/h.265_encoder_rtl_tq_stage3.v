module  stage3(
                     clk,rst,
             i_valid,inverse,
                  i_transize,
         
         i_0 ,i_1 ,i_2 ,i_3 ,
         i_4 ,i_5 ,i_6 ,i_7 ,
         i_8 ,i_9 ,i_10,i_11,      
         i_12,i_13,i_14,i_15,
		     i_16,i_17,i_18,i_19,
         i_20,i_21,i_22,i_23,
         i_24,i_25,i_26,i_27,      
         i_28,i_29,i_30,i_31,
		 
         o_valid,
         o_0 ,o_1 ,o_2 ,o_3 ,
         o_4 ,o_5 ,o_6 ,o_7 ,
         o_8 ,o_9 ,o_10,o_11,      
         o_12,o_13,o_14,o_15,
		     o_16,o_17,o_18,o_19,
         o_20,o_21,o_22,o_23,
         o_24,o_25,o_26,o_27,      
         o_28,o_29,o_30,o_31      
);

// *******************************************
//
//	INPUT / OUTPUT DECLARATION
//
// *******************************************

input                          clk;
input                          rst;
input                      i_valid;
input  [1:0]            i_transize;
input                      inverse;
input  signed  [27:0]          i_0;   
input  signed  [27:0]          i_1; 
input  signed  [27:0]          i_2; 
input  signed  [27:0]          i_3; 
input  signed  [27:0]          i_4; 
input  signed  [27:0]          i_5; 
input  signed  [27:0]          i_6; 
input  signed  [27:0]          i_7; 
input  signed  [27:0]          i_8; 
input  signed  [27:0]          i_9; 
input  signed  [27:0]          i_10; 
input  signed  [27:0]          i_11; 
input  signed  [27:0]          i_12; 
input  signed  [27:0]          i_13; 
input  signed  [27:0]          i_14; 
input  signed  [27:0]          i_15; 
input  signed  [27:0]          i_16; 
input  signed  [27:0]          i_17; 
input  signed  [27:0]          i_18; 
input  signed  [27:0]          i_19; 
input  signed  [27:0]          i_20; 
input  signed  [27:0]          i_21; 
input  signed  [27:0]          i_22; 
input  signed  [27:0]          i_23; 
input  signed  [27:0]          i_24; 
input  signed  [27:0]          i_25; 
input  signed  [27:0]          i_26; 
input  signed  [27:0]          i_27; 
input  signed  [27:0]          i_28;   
input  signed  [27:0]          i_29; 
input  signed  [27:0]          i_30; 
input  signed  [27:0]          i_31; 

output reg                     o_valid;
output reg signed  [27:0]         o_0 ; 
output reg signed  [27:0]         o_1 ; 
output reg signed  [27:0]         o_2 ; 
output reg signed  [27:0]         o_3 ; 
output reg signed  [27:0]         o_4 ; 
output reg signed  [27:0]         o_5 ; 
output reg signed  [27:0]         o_6 ; 
output reg signed  [27:0]         o_7 ; 
output reg signed  [27:0]         o_8 ;
output reg signed  [27:0]         o_9 ;
output reg signed  [27:0]         o_10;
output reg signed  [27:0]         o_11;
output reg signed  [27:0]         o_12;
output reg signed  [27:0]         o_13;
output reg signed  [27:0]         o_14;
output reg signed  [27:0]         o_15;
output reg signed  [27:0]         o_16;
output reg signed  [27:0]         o_17;
output reg signed  [27:0]         o_18;
output reg signed  [27:0]         o_19;
output reg signed  [27:0]         o_20;
output reg signed  [27:0]         o_21;
output reg signed  [27:0]         o_22;
output reg signed  [27:0]         o_23;
output reg signed  [27:0]         o_24;
output reg signed  [27:0]         o_25;
output reg signed  [27:0]         o_26;
output reg signed  [27:0]         o_27;
output reg signed  [27:0]         o_28;
output reg signed  [27:0]         o_29;
output reg signed  [27:0]         o_30;
output reg signed  [27:0]         o_31;

// ********************************************
//
//	WIRE DECLARATION
//
// ********************************************

wire  signed       [27:0]        in_0;  
wire  signed       [27:0]        in_1; 
wire  signed       [27:0]        in_2; 
wire  signed       [27:0]        in_3; 
wire  signed       [27:0]        in_4; 
wire  signed       [27:0]        in_5; 
wire  signed       [27:0]        in_6; 
wire  signed       [27:0]        in_7; 
wire  signed       [27:0]        in_8; 
wire  signed       [27:0]        in_9; 
wire  signed       [27:0]        in_10; 
wire  signed       [27:0]        in_11; 
wire  signed       [27:0]        in_12; 
wire  signed       [27:0]        in_13; 
wire  signed       [27:0]        in_14; 
wire  signed       [27:0]        in_15; 
wire  signed       [27:0]        in_16; 
wire  signed       [27:0]        in_17; 
wire  signed       [27:0]        in_18; 
wire  signed       [27:0]        in_19; 
wire  signed       [27:0]        in_20; 
wire  signed       [27:0]        in_21; 
wire  signed       [27:0]        in_22; 
wire  signed       [27:0]        in_23; 
wire  signed       [27:0]        in_24; 
wire  signed       [27:0]        in_25; 
wire  signed       [27:0]        in_26; 
wire  signed       [27:0]        in_27; 
wire  signed       [27:0]        in_28; 
wire  signed       [27:0]        in_29; 
wire  signed       [27:0]        in_30; 
wire  signed       [27:0]        in_31; 

wire  signed       [27:0]        ob_0;  
wire  signed       [27:0]        ob_1; 
wire  signed       [27:0]        ob_2; 
wire  signed       [27:0]        ob_3; 
wire  signed       [27:0]        ob_4; 
wire  signed       [27:0]        ob_5; 
wire  signed       [27:0]        ob_6; 
wire  signed       [27:0]        ob_7; 
wire  signed       [27:0]        ob_8; 
wire  signed       [27:0]        ob_9; 
wire  signed       [27:0]        ob_10; 
wire  signed       [27:0]        ob_11; 
wire  signed       [27:0]        ob_12; 
wire  signed       [27:0]        ob_13; 
wire  signed       [27:0]        ob_14; 
wire  signed       [27:0]        ob_15; 
wire  signed       [27:0]        ob_16; 
wire  signed       [27:0]        ob_17; 
wire  signed       [27:0]        ob_18; 
wire  signed       [27:0]        ob_19; 
wire  signed       [27:0]        ob_20; 
wire  signed       [27:0]        ob_21; 
wire  signed       [27:0]        ob_22; 
wire  signed       [27:0]        ob_23; 
wire  signed       [27:0]        ob_24; 
wire  signed       [27:0]        ob_25; 
wire  signed       [27:0]        ob_26; 
wire  signed       [27:0]        ob_27; 
wire  signed       [27:0]        ob_28; 
wire  signed       [27:0]        ob_29; 
wire  signed       [27:0]        ob_30; 
wire  signed       [27:0]        ob_31; 

wire  signed       [27:0]        op_0;  
wire  signed       [27:0]        op_1; 
wire  signed       [27:0]        op_2; 
wire  signed       [27:0]        op_3; 
wire  signed       [27:0]        op_4; 
wire  signed       [27:0]        op_5; 
wire  signed       [27:0]        op_6; 
wire  signed       [27:0]        op_7; 
wire  signed       [27:0]        op_8; 
wire  signed       [27:0]        op_9; 
wire  signed       [27:0]        op_10; 
wire  signed       [27:0]        op_11; 
wire  signed       [27:0]        op_12; 
wire  signed       [27:0]        op_13; 
wire  signed       [27:0]        op_14; 
wire  signed       [27:0]        op_15; 
wire  signed       [27:0]        op_16; 
wire  signed       [27:0]        op_17; 
wire  signed       [27:0]        op_18; 
wire  signed       [27:0]        op_19; 
wire  signed       [27:0]        op_20; 
wire  signed       [27:0]        op_21; 
wire  signed       [27:0]        op_22; 
wire  signed       [27:0]        op_23; 
wire  signed       [27:0]        op_24; 
wire  signed       [27:0]        op_25; 
wire  signed       [27:0]        op_26; 
wire  signed       [27:0]        op_27; 
wire  signed       [27:0]        op_28; 
wire  signed       [27:0]        op_29; 
wire  signed       [27:0]        op_30; 
wire  signed       [27:0]        op_31; 

wire  signed       [27:0]           o0;  
wire  signed       [27:0]           o1; 
wire  signed       [27:0]           o2; 
wire  signed       [27:0]           o3; 
wire  signed       [27:0]           o4; 
wire  signed       [27:0]           o5; 
wire  signed       [27:0]           o6; 
wire  signed       [27:0]           o7; 
wire  signed       [27:0]           o8; 
wire  signed       [27:0]           o9; 
wire  signed       [27:0]           o10; 
wire  signed       [27:0]           o11; 
wire  signed       [27:0]           o12; 
wire  signed       [27:0]           o13; 
wire  signed       [27:0]           o14; 
wire  signed       [27:0]           o15; 
wire  signed       [27:0]           o16; 
wire  signed       [27:0]           o17; 
wire  signed       [27:0]           o18; 
wire  signed       [27:0]           o19; 
wire  signed       [27:0]           o20; 
wire  signed       [27:0]           o21; 
wire  signed       [27:0]           o22; 
wire  signed       [27:0]           o23; 
wire  signed       [27:0]           o24; 
wire  signed       [27:0]           o25; 
wire  signed       [27:0]           o26; 
wire  signed       [27:0]           o27; 
wire  signed       [27:0]           o28; 
wire  signed       [27:0]           o29; 
wire  signed       [27:0]           o30; 
wire  signed       [27:0]           o31; 


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign in_0=i_valid?i_0:'b0;
assign in_1=i_valid?i_1:'b0;
assign in_2=i_valid?i_2:'b0;
assign in_3=i_valid?i_3:'b0;
assign in_4=i_valid?i_4:'b0;
assign in_5=i_valid?i_5:'b0;
assign in_6=i_valid?i_6:'b0;
assign in_7=i_valid?i_7:'b0;
assign in_8=i_valid?i_8:'b0;
assign in_9=i_valid?i_9:'b0;
assign in_10=i_valid?i_10:'b0;
assign in_11=i_valid?i_11:'b0;
assign in_12=i_valid?i_12:'b0;
assign in_13=i_valid?i_13:'b0;
assign in_14=i_valid?i_14:'b0;
assign in_15=i_valid?i_15:'b0;
assign in_16=i_valid?i_16:'b0;
assign in_17=i_valid?i_17:'b0;
assign in_18=i_valid?i_18:'b0;
assign in_19=i_valid?i_19:'b0;
assign in_20=i_valid?i_20:'b0;
assign in_21=i_valid?i_21:'b0;
assign in_22=i_valid?i_22:'b0;
assign in_23=i_valid?i_23:'b0;
assign in_24=i_valid?i_24:'b0;
assign in_25=i_valid?i_25:'b0;
assign in_26=i_valid?i_26:'b0;
assign in_27=i_valid?i_27:'b0;
assign in_28=i_valid?i_28:'b0;
assign in_29=i_valid?i_29:'b0;
assign in_30=i_valid?i_30:'b0;
assign in_31=i_valid?i_31:'b0;

assign o0  = inverse?ob_0 :op_0 ;
assign o1  = inverse?ob_1 :op_1 ;
assign o2  = inverse?ob_2 :op_2 ;
assign o3  = inverse?ob_3 :op_3 ;
assign o4  = inverse?ob_4 :op_4 ;
assign o5  = inverse?ob_5 :op_5 ;
assign o6  = inverse?ob_6 :op_6 ;
assign o7  = inverse?ob_7 :op_7 ;
assign o8  = inverse?ob_8 :op_8 ;
assign o9  = inverse?ob_9 :op_9 ;
assign o10 = inverse?ob_10:op_10;
assign o11 = inverse?ob_11:op_11;
assign o12 = inverse?ob_12:op_12;
assign o13 = inverse?ob_13:op_13;
assign o14 = inverse?ob_14:op_14;
assign o15 = inverse?ob_15:op_15;
assign o16 = inverse?ob_16:op_16;
assign o17 = inverse?ob_17:op_17;
assign o18 = inverse?ob_18:op_18;
assign o19 = inverse?ob_19:op_19;
assign o20 = inverse?ob_20:op_20;
assign o21 = inverse?ob_21:op_21;
assign o22 = inverse?ob_22:op_22;
assign o23 = inverse?ob_23:op_23;
assign o24 = inverse?ob_24:op_24;
assign o25 = inverse?ob_25:op_25;
assign o26 = inverse?ob_26:op_26;
assign o27 = inverse?ob_27:op_27;
assign o28 = inverse?ob_28:op_28;
assign o29 = inverse?ob_29:op_29;
assign o30 = inverse?ob_30:op_30;
assign o31 = inverse?ob_31:op_31;

// ********************************************
//                                             
//    sequence  Logic                      
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  o_valid<=1'b0;
else
  o_valid<=i_valid;
  
always@(posedge clk or negedge rst)
if(!rst)  begin
  o_0 <='b0;o_1 <='b0;o_2 <='b0;o_3 <='b0;
  o_4 <='b0;o_5 <='b0;o_6 <='b0;o_7 <='b0;
  o_8 <='b0;o_9 <='b0;o_10<='b0;o_11<='b0;
  o_12<='b0;o_13<='b0;o_14<='b0;o_15<='b0;
  o_16<='b0;o_17<='b0;o_18<='b0;o_19<='b0;
  o_20<='b0;o_21<='b0;o_22<='b0;o_23<='b0;
  o_24<='b0;o_25<='b0;o_26<='b0;o_27<='b0;
  o_28<='b0;o_29<='b0;o_30<='b0;o_31<='b0;
  end
  else     begin
  o_0 <=o0 ;o_1 <=o1 ;o_2 <=o2 ;o_3 <=o3 ;
  o_4 <=o4 ;o_5 <=o5 ;o_6 <=o6 ;o_7 <=o7 ;
  o_8 <=o8 ;o_9 <=o9 ;o_10<=o10;o_11<=o11;
  o_12<=o12;o_13<=o13;o_14<=o14;o_15<=o15;
  o_16<=o16;o_17<=o17;o_18<=o18;o_19<=o19;
  o_20<=o20;o_21<=o21;o_22<=o22;o_23<=o23;
  o_24<=o24;o_25<=o25;o_26<=o26;o_27<=o27;
  o_28<=o28;o_29<=o29;o_30<=o30;o_31<=o31;
  end
  
// *********************************************
//                                             
//    Sub Modules                              
//                                             
// *********************************************

butterfly3   butterfly3_0(
            inverse,i_transize,
            in_0 ,in_1 ,in_2 ,in_3 ,
			in_4 ,in_5 ,in_6 ,in_7 ,
			in_8 ,in_9 ,in_10,in_11,
			in_12,in_13,in_14,in_15,
			in_16,in_17,in_18,in_19,
			in_20,in_21,in_22,in_23,
			in_24,in_25,in_26,in_27,
			in_28,in_29,in_30,in_31,
                   
			ob_0 ,ob_1 ,ob_2 ,ob_3 ,
			ob_4 ,ob_5 ,ob_6 ,ob_7 ,
			ob_8 ,ob_9 ,ob_10,ob_11,
			ob_12,ob_13,ob_14,ob_15,
			ob_16,ob_17,ob_18,ob_19,
			ob_20,ob_21,ob_22,ob_23,
			ob_24,ob_25,ob_26,ob_27,
			ob_28,ob_29,ob_30,ob_31               
);

premuat3  premuat3_0(
      inverse,i_transize,
      in_0 ,in_1 ,in_2 ,in_3 ,
			in_4 ,in_5 ,in_6 ,in_7 ,
			in_8 ,in_9 ,in_10,in_11,
			in_12,in_13,in_14,in_15,
			in_16,in_17,in_18,in_19,
			in_20,in_21,in_22,in_23,
			in_24,in_25,in_26,in_27,
			in_28,in_29,in_30,in_31,
                   
			op_0 ,op_1 ,op_2 ,op_3 ,
			op_4 ,op_5 ,op_6 ,op_7 ,
			op_8 ,op_9 ,op_10,op_11,
			op_12,op_13,op_14,op_15,
			op_16,op_17,op_18,op_19,
			op_20,op_21,op_22,op_23,
			op_24,op_25,op_26,op_27,
			op_28,op_29,op_30,op_31               
);

endmodule