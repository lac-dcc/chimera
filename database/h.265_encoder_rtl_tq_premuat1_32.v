module premuat1_32(
             enable,
		    inverse,
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
input                enable;
input               inverse;
input  signed  [15:0]   i_0;
input  signed  [15:0]   i_1;
input  signed  [15:0]   i_2;
input  signed  [15:0]   i_3;
input  signed  [15:0]   i_4;
input  signed  [15:0]   i_5;
input  signed  [15:0]   i_6;
input  signed  [15:0]   i_7;
input  signed  [15:0]   i_8;
input  signed  [15:0]   i_9;
input  signed  [15:0]   i_10;
input  signed  [15:0]   i_11;
input  signed  [15:0]   i_12;
input  signed  [15:0]   i_13;
input  signed  [15:0]   i_14;
input  signed  [15:0]   i_15;
input  signed  [15:0]   i_16;
input  signed  [15:0]   i_17;
input  signed  [15:0]   i_18;
input  signed  [15:0]   i_19;
input  signed  [15:0]   i_20;
input  signed  [15:0]   i_21;
input  signed  [15:0]   i_22;
input  signed  [15:0]   i_23;
input  signed  [15:0]   i_24;
input  signed  [15:0]   i_25;
input  signed  [15:0]   i_26;
input  signed  [15:0]   i_27;
input  signed  [15:0]   i_28;
input  signed  [15:0]   i_29;
input  signed  [15:0]   i_30;
input  signed  [15:0]   i_31;


output  signed [15:0]   o_0;
output  signed [15:0]   o_1;
output  signed [15:0]   o_2;
output  signed [15:0]   o_3;
output  signed [15:0]   o_4;
output  signed [15:0]   o_5;
output  signed [15:0]   o_6;
output  signed [15:0]   o_7;
output  signed [15:0]   o_8;
output  signed [15:0]   o_9;
output  signed [15:0]   o_10;
output  signed [15:0]   o_11;
output  signed [15:0]   o_12;
output  signed [15:0]   o_13;
output  signed [15:0]   o_14;
output  signed [15:0]   o_15;
output  signed [15:0]   o_16;
output  signed [15:0]   o_17;
output  signed [15:0]   o_18;
output  signed [15:0]   o_19;
output  signed [15:0]   o_20;
output  signed [15:0]   o_21;
output  signed [15:0]   o_22;
output  signed [15:0]   o_23;
output  signed [15:0]   o_24;
output  signed [15:0]   o_25;
output  signed [15:0]   o_26;
output  signed [15:0]   o_27;
output  signed [15:0]   o_28;
output  signed [15:0]   o_29;
output  signed [15:0]   o_30;
output  signed [15:0]   o_31;

// ********************************************
//                                             
//    REG DECLARATION                                               
//                                                                             
// ********************************************

reg signed [15:0]       o1;
reg signed [15:0]       o2;
reg signed [15:0]       o3;
reg signed [15:0]       o4;
reg signed [15:0]       o5;
reg signed [15:0]       o6;
reg signed [15:0]       o7;
reg signed [15:0]       o8;
reg signed [15:0]       o9;
reg signed [15:0]       o10;
reg signed [15:0]       o11;
reg signed [15:0]       o12;
reg signed [15:0]       o13;
reg signed [15:0]       o14;
reg signed [15:0]       o15;
reg signed [15:0]       o16;
reg signed [15:0]       o17;
reg signed [15:0]       o18;
reg signed [15:0]       o19;
reg signed [15:0]       o20;
reg signed [15:0]       o21;
reg signed [15:0]       o22;
reg signed [15:0]       o23;
reg signed [15:0]       o24;
reg signed [15:0]       o25;
reg signed [15:0]       o26;
reg signed [15:0]       o27;
reg signed [15:0]       o28;
reg signed [15:0]       o29;
reg signed [15:0]       o30;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

always@(*)
if(inverse)
    begin
    o1 =i_2 ;
    o2 =i_4 ;
    o3 =i_6 ;
    o4 =i_8 ;
    o5 =i_10;
    o6 =i_12;
    o7 =i_14;
    o8 =i_16;
    o9 =i_18;
    o10=i_20;
    o11=i_22;
    o12=i_24;
    o13=i_26;
    o14=i_28;
    o15=i_30;
    o16=i_1 ;
    o17=i_3 ;
    o18=i_5 ;
    o19=i_7 ;
    o20=i_9 ;
    o21=i_11;
    o22=i_13;
    o23=i_15;
    o24=i_17;
    o25=i_19;
    o26=i_21;
    o27=i_23;
    o28=i_25;
    o29=i_27;
    o30=i_29;
    end
   else
    begin
    o1 =i_16;
    o2 =i_1;
    o3 =i_17;
    o4 =i_2;
    o5 =i_18;
    o6 =i_3;
    o7 =i_19;
    o8 =i_4;
    o9 =i_20;
    o10=i_5;
    o11=i_21;
    o12=i_6;
    o13=i_22;
    o14=i_7;
    o15=i_23;
    o16=i_8;
    o17=i_24;
    o18=i_9;
    o19=i_25;
    o20=i_10;
    o21=i_26;
    o22=i_11;
    o23=i_27;
    o24=i_12;
    o25=i_28;
    o26=i_13;
    o27=i_29;
    o28=i_14;
    o29=i_30;
    o30=i_15;
    end

assign  o_0=i_0;
assign  o_1=enable?o1:i_1;
assign  o_2=enable?o2:i_2;
assign  o_3=enable?o3:i_3;
assign  o_4=enable?o4:i_4;
assign  o_5=enable?o5:i_5;
assign  o_6=enable?o6:i_6;
assign  o_7=enable?o7:i_7;
assign  o_8=enable?o8:i_8;
assign  o_9=enable?o9:i_9;
assign  o_10=enable?o10:i_10;
assign  o_11=enable?o11:i_11;
assign  o_12=enable?o12:i_12;
assign  o_13=enable?o13:i_13;
assign  o_14=enable?o14:i_14;
assign  o_15=enable?o15:i_15;
assign  o_16=enable?o16:i_16;
assign  o_17=enable?o17:i_17;
assign  o_18=enable?o18:i_18;
assign  o_19=enable?o19:i_19;
assign  o_20=enable?o20:i_20;
assign  o_21=enable?o21:i_21;
assign  o_22=enable?o22:i_22;
assign  o_23=enable?o23:i_23;
assign  o_24=enable?o24:i_24;
assign  o_25=enable?o25:i_25;
assign  o_26=enable?o26:i_26;
assign  o_27=enable?o27:i_27;
assign  o_28=enable?o28:i_28;
assign  o_29=enable?o29:i_29;
assign  o_30=enable?o30:i_30;
assign  o_31=i_31;

endmodule 
