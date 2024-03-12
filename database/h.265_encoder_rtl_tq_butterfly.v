module butterfly(
                clk,
                rst,
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
                o_0 ,
                o_1 ,
                o_2 ,
                o_3 ,
                o_4 ,
                o_5 ,
                o_6 ,
                o_7 ,
                o_8 ,
                o_9 ,
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

// ****************************************************************
//
//	INPUT / OUTPUT DECLARATION
//
// ****************************************************************

input                          clk;
input                          rst;
input                      i_valid;
input  [1:0]            i_transize;
input                      inverse;
input  signed  [26:0]          i_0;   
input  signed  [26:0]          i_1; 
input  signed  [26:0]          i_2; 
input  signed  [26:0]          i_3; 
input  signed  [26:0]          i_4; 
input  signed  [26:0]          i_5; 
input  signed  [26:0]          i_6; 
input  signed  [26:0]          i_7; 
input  signed  [26:0]          i_8; 
input  signed  [26:0]          i_9; 
input  signed  [26:0]          i_10; 
input  signed  [26:0]          i_11; 
input  signed  [26:0]          i_12; 
input  signed  [26:0]          i_13; 
input  signed  [26:0]          i_14; 
input  signed  [26:0]          i_15; 
input  signed  [26:0]          i_16; 
input  signed  [26:0]          i_17; 
input  signed  [26:0]          i_18; 
input  signed  [26:0]          i_19; 
input  signed  [26:0]          i_20; 
input  signed  [26:0]          i_21; 
input  signed  [26:0]          i_22; 
input  signed  [26:0]          i_23; 
input  signed  [26:0]          i_24; 
input  signed  [26:0]          i_25; 
input  signed  [26:0]          i_26; 
input  signed  [26:0]          i_27; 
input  signed  [26:0]          i_28;   
input  signed  [26:0]          i_29; 
input  signed  [26:0]          i_30; 
input  signed  [26:0]          i_31; 

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

// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************

wire                     enable8_0;
wire                     enable8_1;
wire                     enable8_2;
wire                    enable16_0;
wire                    enable16_1;
wire                     enable_32;

wire  signed  [26:0]        in_0;  
wire  signed  [26:0]        in_1; 
wire  signed  [26:0]        in_2; 
wire  signed  [26:0]        in_3; 
wire  signed  [26:0]        in_4; 
wire  signed  [26:0]        in_5; 
wire  signed  [26:0]        in_6; 
wire  signed  [26:0]        in_7; 
wire  signed  [26:0]        in_8; 
wire  signed  [26:0]        in_9; 
wire  signed  [26:0]        in_10; 
wire  signed  [26:0]        in_11; 
wire  signed  [26:0]        in_12; 
wire  signed  [26:0]        in_13; 
wire  signed  [26:0]        in_14; 
wire  signed  [26:0]        in_15; 
wire  signed  [26:0]        in_16; 
wire  signed  [26:0]        in_17; 
wire  signed  [26:0]        in_18; 
wire  signed  [26:0]        in_19; 
wire  signed  [26:0]        in_20; 
wire  signed  [26:0]        in_21; 
wire  signed  [26:0]        in_22; 
wire  signed  [26:0]        in_23; 
wire  signed  [26:0]        in_24; 
wire  signed  [26:0]        in_25; 
wire  signed  [26:0]        in_26; 
wire  signed  [26:0]        in_27; 
wire  signed  [26:0]        in_28; 
wire  signed  [26:0]        in_29; 
wire  signed  [26:0]        in_30; 
wire  signed  [26:0]        in_31; 

wire signed    [24:0]        i8_0;
wire signed    [24:0]        i8_1;
wire signed    [24:0]        i8_2;
wire signed    [24:0]        i8_3;
wire signed    [24:0]        i8_4;
wire signed    [24:0]        i8_5;
wire signed    [24:0]        i8_6;
wire signed    [24:0]        i8_7;
wire signed    [24:0]        i8_8;
wire signed    [24:0]        i8_9;
wire signed    [24:0]        i8_10;
wire signed    [24:0]        i8_11;
wire signed    [24:0]        i8_12;
wire signed    [24:0]        i8_13;
wire signed    [24:0]        i8_14;
wire signed    [24:0]        i8_15;
wire signed    [24:0]        i8_16;
wire signed    [24:0]        i8_17;
wire signed    [24:0]        i8_18;
wire signed    [24:0]        i8_19;
wire signed    [24:0]        i8_20;
wire signed    [24:0]        i8_21;
wire signed    [24:0]        i8_22;
wire signed    [24:0]        i8_23;
wire signed    [24:0]        i8_24;
wire signed    [24:0]        i8_25;
wire signed    [24:0]        i8_26;
wire signed    [24:0]        i8_27;
wire signed    [24:0]        i8_28;
wire signed    [24:0]        i8_29;
wire signed    [24:0]        i8_30;
wire signed    [24:0]        i8_31;

wire signed    [25:0]        o8_0;
wire signed    [25:0]        o8_1;
wire signed    [25:0]        o8_2;
wire signed    [25:0]        o8_3;
wire signed    [25:0]        o8_4;
wire signed    [25:0]        o8_5;
wire signed    [25:0]        o8_6;
wire signed    [25:0]        o8_7;
wire signed    [25:0]        o8_8;
wire signed    [25:0]        o8_9;
wire signed    [25:0]        o8_10;
wire signed    [25:0]        o8_11;
wire signed    [25:0]        o8_12;
wire signed    [25:0]        o8_13;
wire signed    [25:0]        o8_14;
wire signed    [25:0]        o8_15;
wire signed    [25:0]        o8_16;
wire signed    [25:0]        o8_17;
wire signed    [25:0]        o8_18;
wire signed    [25:0]        o8_19;
wire signed    [25:0]        o8_20;
wire signed    [25:0]        o8_21;
wire signed    [25:0]        o8_22;
wire signed    [25:0]        o8_23;
wire signed    [25:0]        o8_24;
wire signed    [25:0]        o8_25;
wire signed    [25:0]        o8_26;
wire signed    [25:0]        o8_27;
wire signed    [25:0]        o8_28;
wire signed    [25:0]        o8_29;
wire signed    [25:0]        o8_30;
wire signed    [25:0]        o8_31;

wire signed    [25:0]        i16_0;
wire signed    [25:0]        i16_1;
wire signed    [25:0]        i16_2;
wire signed    [25:0]        i16_3;
wire signed    [25:0]        i16_4;
wire signed    [25:0]        i16_5;
wire signed    [25:0]        i16_6;
wire signed    [25:0]        i16_7;
wire signed    [25:0]        i16_8;
wire signed    [25:0]        i16_9;
wire signed    [25:0]        i16_10;
wire signed    [25:0]        i16_11;
wire signed    [25:0]        i16_12;
wire signed    [25:0]        i16_13;
wire signed    [25:0]        i16_14;
wire signed    [25:0]        i16_15;
wire signed    [25:0]        i16_16;
wire signed    [25:0]        i16_17;
wire signed    [25:0]        i16_18;
wire signed    [25:0]        i16_19;
wire signed    [25:0]        i16_20;
wire signed    [25:0]        i16_21;
wire signed    [25:0]        i16_22;
wire signed    [25:0]        i16_23;
wire signed    [25:0]        i16_24;
wire signed    [25:0]        i16_25;
wire signed    [25:0]        i16_26;
wire signed    [25:0]        i16_27;
wire signed    [25:0]        i16_28;
wire signed    [25:0]        i16_29;
wire signed    [25:0]        i16_30;
wire signed    [25:0]        i16_31;

wire signed    [26:0]        o16_0;
wire signed    [26:0]        o16_1;
wire signed    [26:0]        o16_2;
wire signed    [26:0]        o16_3;
wire signed    [26:0]        o16_4;
wire signed    [26:0]        o16_5;
wire signed    [26:0]        o16_6;
wire signed    [26:0]        o16_7;
wire signed    [26:0]        o16_8;
wire signed    [26:0]        o16_9;
wire signed    [26:0]        o16_10;
wire signed    [26:0]        o16_11;
wire signed    [26:0]        o16_12;
wire signed    [26:0]        o16_13;
wire signed    [26:0]        o16_14;
wire signed    [26:0]        o16_15;
wire signed    [26:0]        o16_16;
wire signed    [26:0]        o16_17;
wire signed    [26:0]        o16_18;
wire signed    [26:0]        o16_19;
wire signed    [26:0]        o16_20;
wire signed    [26:0]        o16_21;
wire signed    [26:0]        o16_22;
wire signed    [26:0]        o16_23;
wire signed    [26:0]        o16_24;
wire signed    [26:0]        o16_25;
wire signed    [26:0]        o16_26;
wire signed    [26:0]        o16_27;
wire signed    [26:0]        o16_28;
wire signed    [26:0]        o16_29;
wire signed    [26:0]        o16_30;
wire signed    [26:0]        o16_31;

wire signed    [26:0]        i32_0;
wire signed    [26:0]        i32_1;
wire signed    [26:0]        i32_2;
wire signed    [26:0]        i32_3;
wire signed    [26:0]        i32_4;
wire signed    [26:0]        i32_5;
wire signed    [26:0]        i32_6;
wire signed    [26:0]        i32_7;
wire signed    [26:0]        i32_8;
wire signed    [26:0]        i32_9;
wire signed    [26:0]        i32_10;
wire signed    [26:0]        i32_11;
wire signed    [26:0]        i32_12;
wire signed    [26:0]        i32_13;
wire signed    [26:0]        i32_14;
wire signed    [26:0]        i32_15;
wire signed    [26:0]        i32_16;
wire signed    [26:0]        i32_17;
wire signed    [26:0]        i32_18;
wire signed    [26:0]        i32_19;
wire signed    [26:0]        i32_20;
wire signed    [26:0]        i32_21;
wire signed    [26:0]        i32_22;
wire signed    [26:0]        i32_23;
wire signed    [26:0]        i32_24;
wire signed    [26:0]        i32_25;
wire signed    [26:0]        i32_26;
wire signed    [26:0]        i32_27;
wire signed    [26:0]        i32_28;
wire signed    [26:0]        i32_29;
wire signed    [26:0]        i32_30;
wire signed    [26:0]        i32_31;

wire signed    [27:0]        o32_0;
wire signed    [27:0]        o32_1;
wire signed    [27:0]        o32_2;
wire signed    [27:0]        o32_3;
wire signed    [27:0]        o32_4;
wire signed    [27:0]        o32_5;
wire signed    [27:0]        o32_6;
wire signed    [27:0]        o32_7;
wire signed    [27:0]        o32_8;
wire signed    [27:0]        o32_9;
wire signed    [27:0]        o32_10;
wire signed    [27:0]        o32_11;
wire signed    [27:0]        o32_12;
wire signed    [27:0]        o32_13;
wire signed    [27:0]        o32_14;
wire signed    [27:0]        o32_15;
wire signed    [27:0]        o32_16;
wire signed    [27:0]        o32_17;
wire signed    [27:0]        o32_18;
wire signed    [27:0]        o32_19;
wire signed    [27:0]        o32_20;
wire signed    [27:0]        o32_21;
wire signed    [27:0]        o32_22;
wire signed    [27:0]        o32_23;
wire signed    [27:0]        o32_24;
wire signed    [27:0]        o32_25;
wire signed    [27:0]        o32_26;
wire signed    [27:0]        o32_27;
wire signed    [27:0]        o32_28;
wire signed    [27:0]        o32_29;
wire signed    [27:0]        o32_30;
wire signed    [27:0]        o32_31;

wire signed    [27:0]        out_0 ; 
wire signed    [27:0]        out_1 ; 
wire signed    [27:0]        out_2 ; 
wire signed    [27:0]        out_3 ; 
wire signed    [27:0]        out_4 ; 
wire signed    [27:0]        out_5 ; 
wire signed    [27:0]        out_6 ; 
wire signed    [27:0]        out_7 ; 
wire signed    [27:0]        out_8 ;
wire signed    [27:0]        out_9 ;
wire signed    [27:0]        out_10;
wire signed    [27:0]        out_11;
wire signed    [27:0]        out_12;
wire signed    [27:0]        out_13;
wire signed    [27:0]        out_14;
wire signed    [27:0]        out_15;
wire signed    [27:0]        out_16;
wire signed    [27:0]        out_17;
wire signed    [27:0]        out_18;
wire signed    [27:0]        out_19;
wire signed    [27:0]        out_20;
wire signed    [27:0]        out_21;
wire signed    [27:0]        out_22;
wire signed    [27:0]        out_23;
wire signed    [27:0]        out_24;
wire signed    [27:0]        out_25;
wire signed    [27:0]        out_26;
wire signed    [27:0]        out_27;
wire signed    [27:0]        out_28;
wire signed    [27:0]        out_29;
wire signed    [27:0]        out_30;
wire signed    [27:0]        out_31;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign enable8_0=(i_transize[1]||i_transize[0]);
assign enable8_1=((~i_transize[1])&i_transize[0]);
assign enable8_2=(enable8_1||enable16_1);

assign enable16_0=i_transize[1];
assign enable16_1=((~i_transize[0])&i_transize[1]);

assign enable_32=(i_transize[1]&i_transize[0]);
    
assign in_0=i_valid?i_0:in_0;
assign in_1=i_valid?i_1:in_1;
assign in_2=i_valid?i_2:in_2;
assign in_3=i_valid?i_3:in_3;
assign in_4=i_valid?i_4:in_4;
assign in_5=i_valid?i_5:in_5;
assign in_6=i_valid?i_6:in_6;
assign in_7=i_valid?i_7:in_7;
assign in_8=i_valid?i_8:in_8;
assign in_9=i_valid?i_9:in_9;
assign in_10=i_valid?i_10:in_10;
assign in_11=i_valid?i_11:in_11;
assign in_12=i_valid?i_12:in_12;
assign in_13=i_valid?i_13:in_13;
assign in_14=i_valid?i_14:in_14;
assign in_15=i_valid?i_15:in_15;
assign in_16=i_valid?i_16:in_16;
assign in_17=i_valid?i_17:in_17;
assign in_18=i_valid?i_18:in_18;
assign in_19=i_valid?i_19:in_19;
assign in_20=i_valid?i_20:in_20;
assign in_21=i_valid?i_21:in_21;
assign in_22=i_valid?i_22:in_22;
assign in_23=i_valid?i_23:in_23;
assign in_24=i_valid?i_24:in_24;
assign in_25=i_valid?i_25:in_25;
assign in_26=i_valid?i_26:in_26;
assign in_27=i_valid?i_27:in_27;
assign in_28=i_valid?i_28:in_28;
assign in_29=i_valid?i_29:in_29;
assign in_30=i_valid?i_30:in_30;
assign in_31=i_valid?i_31:in_31;

assign  i8_0 =inverse?in_0 :o16_0 ;
assign  i8_1 =inverse?in_1 :o16_1 ;
assign  i8_2 =inverse?in_2 :o16_2 ;
assign  i8_3 =inverse?in_3 :o16_3 ;
assign  i8_4 =inverse?in_4 :o16_4 ;
assign  i8_5 =inverse?in_5 :o16_5 ;
assign  i8_6 =inverse?in_6 :o16_6 ;
assign  i8_7 =inverse?in_7 :o16_7 ;
assign  i8_8 =inverse?in_8 :o16_8 ;
assign  i8_9 =inverse?in_9 :o16_9 ;
assign  i8_10=inverse?in_10:o16_10;
assign  i8_11=inverse?in_11:o16_11;
assign  i8_12=inverse?in_12:o16_12;
assign  i8_13=inverse?in_13:o16_13;
assign  i8_14=inverse?in_14:o16_14;
assign  i8_15=inverse?in_15:o16_15;
assign  i8_16=inverse?in_16:o16_16;
assign  i8_17=inverse?in_17:o16_17;
assign  i8_18=inverse?in_18:o16_18;
assign  i8_19=inverse?in_19:o16_19;
assign  i8_20=inverse?in_20:o16_20;
assign  i8_21=inverse?in_21:o16_21;
assign  i8_22=inverse?in_22:o16_22;
assign  i8_23=inverse?in_23:o16_23;
assign  i8_24=inverse?in_24:o16_24;
assign  i8_25=inverse?in_25:o16_25;
assign  i8_26=inverse?in_26:o16_26;
assign  i8_27=inverse?in_27:o16_27;
assign  i8_28=inverse?in_28:o16_28;
assign  i8_29=inverse?in_29:o16_29;
assign  i8_30=inverse?in_30:o16_30;
assign  i8_31=inverse?in_31:o16_31;

assign  i16_0 =inverse?o8_0 :o32_0 ;
assign  i16_1 =inverse?o8_1 :o32_1 ;
assign  i16_2 =inverse?o8_2 :o32_2 ;
assign  i16_3 =inverse?o8_3 :o32_3 ;
assign  i16_4 =inverse?o8_4 :o32_4 ;
assign  i16_5 =inverse?o8_5 :o32_5 ;
assign  i16_6 =inverse?o8_6 :o32_6 ;
assign  i16_7 =inverse?o8_7 :o32_7 ;
assign  i16_8 =inverse?o8_8 :o32_8 ;
assign  i16_9 =inverse?o8_9 :o32_9 ;
assign  i16_10=inverse?o8_10:o32_10;
assign  i16_11=inverse?o8_11:o32_11;
assign  i16_12=inverse?o8_12:o32_12;
assign  i16_13=inverse?o8_13:o32_13;
assign  i16_14=inverse?o8_14:o32_14;
assign  i16_15=inverse?o8_15:o32_15;
assign  i16_16=inverse?o8_16:o32_16;
assign  i16_17=inverse?o8_17:o32_17;
assign  i16_18=inverse?o8_18:o32_18;
assign  i16_19=inverse?o8_19:o32_19;
assign  i16_20=inverse?o8_20:o32_20;
assign  i16_21=inverse?o8_21:o32_21;
assign  i16_22=inverse?o8_22:o32_22;
assign  i16_23=inverse?o8_23:o32_23;
assign  i16_24=inverse?o8_24:o32_24;
assign  i16_25=inverse?o8_25:o32_25;
assign  i16_26=inverse?o8_26:o32_26;
assign  i16_27=inverse?o8_27:o32_27;
assign  i16_28=inverse?o8_28:o32_28;
assign  i16_29=inverse?o8_29:o32_29;
assign  i16_30=inverse?o8_30:o32_30;
assign  i16_31=inverse?o8_31:o32_31;

assign  i32_0 =inverse?o16_0 :in_0 ;
assign  i32_1 =inverse?o16_1 :in_1 ;
assign  i32_2 =inverse?o16_2 :in_2 ;
assign  i32_3 =inverse?o16_3 :in_3 ;
assign  i32_4 =inverse?o16_4 :in_4 ;
assign  i32_5 =inverse?o16_5 :in_5 ;
assign  i32_6 =inverse?o16_6 :in_6 ;
assign  i32_7 =inverse?o16_7 :in_7 ;
assign  i32_8 =inverse?o16_8 :in_8 ;
assign  i32_9 =inverse?o16_9 :in_9 ;
assign  i32_10=inverse?o16_10:in_10;
assign  i32_11=inverse?o16_11:in_11;
assign  i32_12=inverse?o16_12:in_12;
assign  i32_13=inverse?o16_13:in_13;
assign  i32_14=inverse?o16_14:in_14;
assign  i32_15=inverse?o16_15:in_15;
assign  i32_16=inverse?o16_16:in_16;
assign  i32_17=inverse?o16_17:in_17;
assign  i32_18=inverse?o16_18:in_18;
assign  i32_19=inverse?o16_19:in_19;
assign  i32_20=inverse?o16_20:in_20;
assign  i32_21=inverse?o16_21:in_21;
assign  i32_22=inverse?o16_22:in_22;
assign  i32_23=inverse?o16_23:in_23;
assign  i32_24=inverse?o16_24:in_24;
assign  i32_25=inverse?o16_25:in_25;
assign  i32_26=inverse?o16_26:in_26;
assign  i32_27=inverse?o16_27:in_27;
assign  i32_28=inverse?o16_28:in_28;
assign  i32_29=inverse?o16_29:in_29;
assign  i32_30=inverse?o16_30:in_30;
assign  i32_31=inverse?o16_31:in_31;

assign  out_0 =inverse?o32_0 :o8_0 ;
assign  out_1 =inverse?o32_1 :o8_1 ;
assign  out_2 =inverse?o32_2 :o8_2 ;
assign  out_3 =inverse?o32_3 :o8_3 ;
assign  out_4 =inverse?o32_4 :o8_4 ;
assign  out_5 =inverse?o32_5 :o8_5 ;
assign  out_6 =inverse?o32_6 :o8_6 ;
assign  out_7 =inverse?o32_7 :o8_7 ;
assign  out_8 =inverse?o32_8 :o8_8 ;
assign  out_9 =inverse?o32_9 :o8_9 ;
assign  out_10=inverse?o32_10:o8_10;
assign  out_11=inverse?o32_11:o8_11;
assign  out_12=inverse?o32_12:o8_12;
assign  out_13=inverse?o32_13:o8_13;
assign  out_14=inverse?o32_14:o8_14;
assign  out_15=inverse?o32_15:o8_15;
assign  out_16=inverse?o32_16:o8_16;
assign  out_17=inverse?o32_17:o8_17;
assign  out_18=inverse?o32_18:o8_18;
assign  out_19=inverse?o32_19:o8_19;
assign  out_20=inverse?o32_20:o8_20;
assign  out_21=inverse?o32_21:o8_21;
assign  out_22=inverse?o32_22:o8_22;
assign  out_23=inverse?o32_23:o8_23;
assign  out_24=inverse?o32_24:o8_24;
assign  out_25=inverse?o32_25:o8_25;
assign  out_26=inverse?o32_26:o8_26;
assign  out_27=inverse?o32_27:o8_27;
assign  out_28=inverse?o32_28:o8_28;
assign  out_29=inverse?o32_29:o8_29;
assign  out_30=inverse?o32_30:o8_30;
assign  out_31=inverse?o32_31:o8_31;

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
if(!rst)
begin
    o_0 <=28'b0;
    o_1 <=28'b0;
    o_2 <=28'b0;
    o_3 <=28'b0;
    o_4 <=28'b0;
    o_5 <=28'b0;
    o_6 <=28'b0;
    o_7 <=28'b0;
    o_8 <=28'b0;
    o_9 <=28'b0;
    o_10<=28'b0;
    o_11<=28'b0;
    o_12<=28'b0;
    o_13<=28'b0;
    o_14<=28'b0;
    o_15<=28'b0;
    o_16<=28'b0;
    o_17<=28'b0;
    o_18<=28'b0;
    o_19<=28'b0;
    o_20<=28'b0;
    o_21<=28'b0;
    o_22<=28'b0;
    o_23<=28'b0;
    o_24<=28'b0;
    o_25<=28'b0;
    o_26<=28'b0;
    o_27<=28'b0;
    o_28<=28'b0;
    o_29<=28'b0;
    o_30<=28'b0;
    o_31<=28'b0;
end
else
    begin
    o_0 <=out_0 ;
    o_1 <=out_1 ;
    o_2 <=out_2 ;
    o_3 <=out_3 ;
    o_4 <=out_4 ;
    o_5 <=out_5 ;
    o_6 <=out_6 ;
    o_7 <=out_7 ;
    o_8 <=out_8 ;
    o_9 <=out_9 ;
    o_10<=out_10;
    o_11<=out_11;
    o_12<=out_12;
    o_13<=out_13;
    o_14<=out_14;
    o_15<=out_15;
    o_16<=out_16;
    o_17<=out_17;
    o_18<=out_18;
    o_19<=out_19;
    o_20<=out_20;
    o_21<=out_21;
    o_22<=out_22;
    o_23<=out_23;
    o_24<=out_24;
    o_25<=out_25;
    o_26<=out_26;
    o_27<=out_27;
    o_28<=out_28;
    o_29<=out_29;
    o_30<=out_30;
    o_31<=out_31;
end
	
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

butterfly_8   b80(
            enable8_0,
                i8_0,
                i8_1,
                i8_2,
                i8_3,
                i8_4,
                i8_5,
                i8_6,
                i8_7,
                
                o8_0,
                o8_1,
                o8_2,
                o8_3,
                o8_4,
                o8_5,
                o8_6,
                o8_7              
);

butterfly_8   b81(
            enable8_1,
               i8_8 ,
               i8_9 ,
               i8_10,
               i8_11,
               i8_12,
               i8_13,
               i8_14,
               i8_15,
                
               o8_8 ,
               o8_9 ,
               o8_10,
               o8_11,
               o8_12,
               o8_13,
               o8_14,
               o8_15              
);

butterfly_8   b82(
            enable8_2,
               i8_16,
               i8_17,
               i8_18,
               i8_19,
               i8_20,
               i8_21,
               i8_22,
               i8_23,
                
               o8_16,
               o8_17,
               o8_18,
               o8_19,
               o8_20,
               o8_21,
               o8_22,
               o8_23              
);

butterfly_8   b83(
            enable8_1,
               i8_24,
               i8_25,
               i8_26,
               i8_27,
               i8_28,
               i8_29,
               i8_30,
               i8_31,
                
               o8_24,
               o8_25,
               o8_26,
               o8_27,
               o8_28,
               o8_29,
               o8_30,
               o8_31              
);

butterfly_16  b160(
            enable16_0,
                i16_0,
                i16_1,
                i16_2,
                i16_3,
                i16_4,
                i16_5,
                i16_6,
                i16_7,
                i16_8,
                i16_9,
                i16_10,
                i16_11,
                i16_12,
                i16_13,
                i16_14,
                i16_15,
              
                 o16_0,
                 o16_1,
                 o16_2,
                 o16_3,
                 o16_4,
                 o16_5,
                 o16_6,
                 o16_7,
                 o16_8,
                 o16_9,
                 o16_10,
                 o16_11,
                 o16_12,
                 o16_13,
                 o16_14,
                 o16_15              
);

butterfly_16  b161(
           enable16_1,
               i16_16,
               i16_17,
               i16_18,
               i16_19,
               i16_20,
               i16_21,
               i16_22,
               i16_23,
               i16_24,
               i16_25,
               i16_26,
               i16_27,
               i16_28,
               i16_29,
               i16_30,
               i16_31,
              
               o16_16,
               o16_17,
               o16_18,
               o16_19,
               o16_20,
               o16_21,
               o16_22,
               o16_23,
               o16_24,
               o16_25,
               o16_26,
               o16_27,
               o16_28,
               o16_29,
               o16_30,
               o16_31              
);

butterfly_32  b32(
          enable_32,
              i32_0,
              i32_1,
              i32_2,
              i32_3,
              i32_4,
              i32_5,
              i32_6,
              i32_7,
              i32_8,
              i32_9,
              i32_10,
              i32_11,
              i32_12,
              i32_13,
              i32_14,
              i32_15,
              i32_16,
              i32_17,
              i32_18,
              i32_19,
              i32_20,
              i32_21,
              i32_22,
              i32_23,
              i32_24,
              i32_25,
              i32_26,
              i32_27,
              i32_28,
              i32_29,
              i32_30,
              i32_31,
                
               o32_0,
               o32_1,
               o32_2,
               o32_3,
               o32_4,
               o32_5,
               o32_6,
               o32_7,
               o32_8,
               o32_9,
               o32_10,
               o32_11,
               o32_12,
               o32_13,
               o32_14,
               o32_15,
               o32_16,
               o32_17,
               o32_18,
               o32_19,
               o32_20,
               o32_21,
               o32_22,
               o32_23,
               o32_24,
               o32_25,
               o32_26,
               o32_27,
               o32_28,
               o32_29,
               o32_30,
               o32_31
);

endmodule