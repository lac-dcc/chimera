module butterfly3(
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

output signed  [27:0]          o_0 ; 
output signed  [27:0]          o_1 ; 
output signed  [27:0]          o_2 ; 
output signed  [27:0]          o_3 ; 
output signed  [27:0]          o_4 ; 
output signed  [27:0]          o_5 ; 
output signed  [27:0]          o_6 ; 
output signed  [27:0]          o_7 ; 
output signed  [27:0]          o_8 ;
output signed  [27:0]          o_9 ;
output signed  [27:0]          o_10;
output signed  [27:0]          o_11;
output signed  [27:0]          o_12;
output signed  [27:0]          o_13;
output signed  [27:0]          o_14;
output signed  [27:0]          o_15;
output signed  [27:0]          o_16;
output signed  [27:0]          o_17;
output signed  [27:0]          o_18;
output signed  [27:0]          o_19;
output signed  [27:0]          o_20;
output signed  [27:0]          o_21;
output signed  [27:0]          o_22;
output signed  [27:0]          o_23;
output signed  [27:0]          o_24;
output signed  [27:0]          o_25;
output signed  [27:0]          o_26;
output signed  [27:0]          o_27;
output signed  [27:0]          o_28;
output signed  [27:0]          o_29;
output signed  [27:0]          o_30;
output signed  [27:0]          o_31;

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

wire  signed  [27:0]        in_0;  
wire  signed  [27:0]        in_1; 
wire  signed  [27:0]        in_2; 
wire  signed  [27:0]        in_3; 
wire  signed  [27:0]        in_4; 
wire  signed  [27:0]        in_5; 
wire  signed  [27:0]        in_6; 
wire  signed  [27:0]        in_7; 
wire  signed  [27:0]        in_8; 
wire  signed  [27:0]        in_9; 
wire  signed  [27:0]        in_10; 
wire  signed  [27:0]        in_11; 
wire  signed  [27:0]        in_12; 
wire  signed  [27:0]        in_13; 
wire  signed  [27:0]        in_14; 
wire  signed  [27:0]        in_15; 
wire  signed  [27:0]        in_16; 
wire  signed  [27:0]        in_17; 
wire  signed  [27:0]        in_18; 
wire  signed  [27:0]        in_19; 
wire  signed  [27:0]        in_20; 
wire  signed  [27:0]        in_21; 
wire  signed  [27:0]        in_22; 
wire  signed  [27:0]        in_23; 
wire  signed  [27:0]        in_24; 
wire  signed  [27:0]        in_25; 
wire  signed  [27:0]        in_26; 
wire  signed  [27:0]        in_27; 
wire  signed  [27:0]        in_28; 
wire  signed  [27:0]        in_29; 
wire  signed  [27:0]        in_30; 
wire  signed  [27:0]        in_31; 

wire signed   [27:0]        o8_0 ; 
wire signed   [27:0]        o8_1 ; 
wire signed   [27:0]        o8_2 ; 
wire signed   [27:0]        o8_3 ; 
wire signed   [27:0]        o8_4 ; 
wire signed   [27:0]        o8_5 ; 
wire signed   [27:0]        o8_6 ; 
wire signed   [27:0]        o8_7 ; 
wire signed   [27:0]        o8_8 ;
wire signed   [27:0]        o8_9 ;
wire signed   [27:0]        o8_10;
wire signed   [27:0]        o8_11;
wire signed   [27:0]        o8_12;
wire signed   [27:0]        o8_13;
wire signed   [27:0]        o8_14;
wire signed   [27:0]        o8_15;
wire signed   [27:0]        o8_16;
wire signed   [27:0]        o8_17;
wire signed   [27:0]        o8_18;
wire signed   [27:0]        o8_19;
wire signed   [27:0]        o8_20;
wire signed   [27:0]        o8_21;
wire signed   [27:0]        o8_22;
wire signed   [27:0]        o8_23;
wire signed   [27:0]        o8_24;
wire signed   [27:0]        o8_25;
wire signed   [27:0]        o8_26;
wire signed   [27:0]        o8_27;
wire signed   [27:0]        o8_28;
wire signed   [27:0]        o8_29;
wire signed   [27:0]        o8_30;
wire signed   [27:0]        o8_31;

wire signed   [27:0]        o16_0;
wire signed   [27:0]        o16_1;
wire signed   [27:0]        o16_2;
wire signed   [27:0]        o16_3;
wire signed   [27:0]        o16_4;
wire signed   [27:0]        o16_5;
wire signed   [27:0]        o16_6;
wire signed   [27:0]        o16_7;
wire signed   [27:0]        o16_8;
wire signed   [27:0]        o16_9;
wire signed   [27:0]        o16_10;
wire signed   [27:0]        o16_11;
wire signed   [27:0]        o16_12;
wire signed   [27:0]        o16_13;
wire signed   [27:0]        o16_14;
wire signed   [27:0]        o16_15;
wire signed   [27:0]        o16_16;
wire signed   [27:0]        o16_17;
wire signed   [27:0]        o16_18;
wire signed   [27:0]        o16_19;
wire signed   [27:0]        o16_20;
wire signed   [27:0]        o16_21;
wire signed   [27:0]        o16_22;
wire signed   [27:0]        o16_23;
wire signed   [27:0]        o16_24;
wire signed   [27:0]        o16_25;
wire signed   [27:0]        o16_26;
wire signed   [27:0]        o16_27;
wire signed   [27:0]        o16_28;
wire signed   [27:0]        o16_29;
wire signed   [27:0]        o16_30;
wire signed   [27:0]        o16_31;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign enable8_0=(i_transize[1]||i_transize[0]);
assign enable8_1=((~i_transize[1])&i_transize[0]);
assign enable8_2=(i_transize[1]!=i_transize[0]);

assign enable16_0=i_transize[1];
assign enable16_1=((~i_transize[0])&i_transize[1]);

assign enable_32=(i_transize[1]&i_transize[0]);
    
assign in_0=inverse? i_0 :'b0;
assign in_1=inverse? i_1 :'b0;
assign in_2=inverse? i_2 :'b0;
assign in_3=inverse? i_3 :'b0;
assign in_4=inverse? i_4 :'b0;
assign in_5=inverse? i_5 :'b0;
assign in_6=inverse? i_6 :'b0;
assign in_7=inverse? i_7 :'b0;
assign in_8=inverse? i_8 :'b0;
assign in_9=inverse? i_9 :'b0;
assign in_10=inverse?i_10:'b0;
assign in_11=inverse?i_11:'b0;
assign in_12=inverse?i_12:'b0;
assign in_13=inverse?i_13:'b0;
assign in_14=inverse?i_14:'b0;
assign in_15=inverse?i_15:'b0;
assign in_16=inverse?i_16:'b0;
assign in_17=inverse?i_17:'b0;
assign in_18=inverse?i_18:'b0;
assign in_19=inverse?i_19:'b0;
assign in_20=inverse?i_20:'b0;
assign in_21=inverse?i_21:'b0;
assign in_22=inverse?i_22:'b0;
assign in_23=inverse?i_23:'b0;
assign in_24=inverse?i_24:'b0;
assign in_25=inverse?i_25:'b0;
assign in_26=inverse?i_26:'b0;
assign in_27=inverse?i_27:'b0;
assign in_28=inverse?i_28:'b0;
assign in_29=inverse?i_29:'b0;
assign in_30=inverse?i_30:'b0;
assign in_31=inverse?i_31:'b0;

// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

butterfly3_8   b3_80(
             .enable(enable8_0),
                .i_0(in_0),
                .i_1(in_1),
                .i_2(in_2),
                .i_3(in_3),
                .i_4(in_4),
                .i_5(in_5),
                .i_6(in_6),
                .i_7(in_7),
                   
                .o_0(o8_0),
                .o_1(o8_1),
                .o_2(o8_2),
                .o_3(o8_3),
                .o_4(o8_4),
                .o_5(o8_5),
                .o_6(o8_6),
                .o_7(o8_7)              
);

butterfly3_8   b3_81(
            .enable(enable8_1),
               .i_0(in_8 ),
               .i_1(in_9 ),
               .i_2(in_10),
               .i_3(in_11),
               .i_4(in_12),
               .i_5(in_13),
               .i_6(in_14),
               .i_7(in_15),
                         
               .o_0(o8_8 ),
               .o_1(o8_9 ),
               .o_2(o8_10),
               .o_3(o8_11),
               .o_4(o8_12),
               .o_5(o8_13),
               .o_6(o8_14),
               .o_7(o8_15)              
);

butterfly3_8   b3_82(
           .enable(enable8_2),
              .i_0(in_16),
              .i_1(in_17),
              .i_2(in_18),
              .i_3(in_19),
              .i_4(in_20),
              .i_5(in_21),
              .i_6(in_22),
              .i_7(in_23),
                        
              .o_0(o8_16),
              .o_1(o8_17),
              .o_2(o8_18),
              .o_3(o8_19),
              .o_4(o8_20),
              .o_5(o8_21),
              .o_6(o8_22),
              .o_7(o8_23)              
);

butterfly3_8   b3_83(
           .enable(enable8_1),
              .i_0(in_24),
              .i_1(in_25),
              .i_2(in_26),
              .i_3(in_27),
              .i_4(in_28),
              .i_5(in_29),
              .i_6(in_30),
              .i_7(in_31),
                        
              .o_0(o8_24),
              .o_1(o8_25),
              .o_2(o8_26),
              .o_3(o8_27),
              .o_4(o8_28),
              .o_5(o8_29),
              .o_6(o8_30),
              .o_7(o8_31)              
);

butterfly3_16  b3_160(
             .enable (enable16_0),
                .i_0 (o8_0),
                .i_1 (o8_1),
                .i_2 (o8_2),
                .i_3 (o8_3),
                .i_4 (o8_4),
                .i_5 (o8_5),
                .i_6 (o8_6),
                .i_7 (o8_7),
                .i_8 (o8_8),
                .i_9 (o8_9),
                .i_10(o8_10),
                .i_11(o8_11),
                .i_12(o8_12),
                .i_13(o8_13),
                .i_14(o8_14),
                .i_15(o8_15),
                            
                .o_0 (o16_0),
                .o_1 (o16_1),
                .o_2 (o16_2),
                .o_3 (o16_3),
                .o_4 (o16_4),
                .o_5 (o16_5),
                .o_6 (o16_6),
                .o_7 (o16_7),
                .o_8 (o16_8),
                .o_9 (o16_9),
                .o_10(o16_10),
                .o_11(o16_11),
                .o_12(o16_12),
                .o_13(o16_13),
                .o_14(o16_14),
                .o_15(o16_15)              
);

butterfly3_16  b3_161(
            .enable (enable16_1),
               .i_0 (o8_16),
               .i_1 (o8_17),
               .i_2 (o8_18),
               .i_3 (o8_19),
               .i_4 (o8_20),
               .i_5 (o8_21),
               .i_6 (o8_22),
               .i_7 (o8_23),
               .i_8 (o8_24),
               .i_9 (o8_25),
               .i_10(o8_26),
               .i_11(o8_27),
               .i_12(o8_28),
               .i_13(o8_29),
               .i_14(o8_30),
               .i_15(o8_31),
                           
               .o_0 (o16_16),
               .o_1 (o16_17),
               .o_2 (o16_18),
               .o_3 (o16_19),
               .o_4 (o16_20),
               .o_5 (o16_21),
               .o_6 (o16_22),
               .o_7 (o16_23),
               .o_8 (o16_24),
               .o_9 (o16_25),
               .o_10(o16_26),
               .o_11(o16_27),
               .o_12(o16_28),
               .o_13(o16_29),
               .o_14(o16_30),
               .o_15(o16_31)              
);

butterfly3_32  b3_32(
           .enable(enable_32),
              .i_0(o16_0),
              .i_1(o16_1),
              .i_2(o16_2),
              .i_3(o16_3),
              .i_4(o16_4),
              .i_5(o16_5),
              .i_6(o16_6),
              .i_7(o16_7),
              .i_8(o16_8),
              .i_9(o16_9),
              .i_10(o16_10),
              .i_11(o16_11),
              .i_12(o16_12),
              .i_13(o16_13),
              .i_14(o16_14),
              .i_15(o16_15),
              .i_16(o16_16),
              .i_17(o16_17),
              .i_18(o16_18),
              .i_19(o16_19),
              .i_20(o16_20),
              .i_21(o16_21),
              .i_22(o16_22),
              .i_23(o16_23),
              .i_24(o16_24),
              .i_25(o16_25),
              .i_26(o16_26),
              .i_27(o16_27),
              .i_28(o16_28),
              .i_29(o16_29),
              .i_30(o16_30),
              .i_31(o16_31),
                
               .o_0(o_0),
               .o_1(o_1),
               .o_2(o_2),
               .o_3(o_3),
               .o_4(o_4),
               .o_5(o_5),
               .o_6(o_6),
               .o_7(o_7),
               .o_8(o_8),
               .o_9(o_9),
              .o_10(o_10),
              .o_11(o_11),
              .o_12(o_12),
              .o_13(o_13),
              .o_14(o_14),
              .o_15(o_15),
              .o_16(o_16),
              .o_17(o_17),
              .o_18(o_18),
              .o_19(o_19),
              .o_20(o_20),
              .o_21(o_21),
              .o_22(o_22),
              .o_23(o_23),
              .o_24(o_24),
              .o_25(o_25),
              .o_26(o_26),
              .o_27(o_27),
              .o_28(o_28),
              .o_29(o_29),
              .o_30(o_30),
              .o_31(o_31)
);

endmodule