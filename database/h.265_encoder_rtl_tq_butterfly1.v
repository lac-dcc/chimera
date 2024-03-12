module butterfly1(
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
input  signed  [15:0]          i_0;   
input  signed  [15:0]          i_1; 
input  signed  [15:0]          i_2; 
input  signed  [15:0]          i_3; 
input  signed  [15:0]          i_4; 
input  signed  [15:0]          i_5; 
input  signed  [15:0]          i_6; 
input  signed  [15:0]          i_7; 
input  signed  [15:0]          i_8; 
input  signed  [15:0]          i_9; 
input  signed  [15:0]          i_10; 
input  signed  [15:0]          i_11; 
input  signed  [15:0]          i_12; 
input  signed  [15:0]          i_13; 
input  signed  [15:0]          i_14; 
input  signed  [15:0]          i_15; 
input  signed  [15:0]          i_16; 
input  signed  [15:0]          i_17; 
input  signed  [15:0]          i_18; 
input  signed  [15:0]          i_19; 
input  signed  [15:0]          i_20; 
input  signed  [15:0]          i_21; 
input  signed  [15:0]          i_22; 
input  signed  [15:0]          i_23; 
input  signed  [15:0]          i_24; 
input  signed  [15:0]          i_25; 
input  signed  [15:0]          i_26; 
input  signed  [15:0]          i_27; 
input  signed  [15:0]          i_28;   
input  signed  [15:0]          i_29; 
input  signed  [15:0]          i_30; 
input  signed  [15:0]          i_31; 

output  signed  [18:0]         o_0 ; 
output  signed  [18:0]         o_1 ; 
output  signed  [18:0]         o_2 ; 
output  signed  [18:0]         o_3 ; 
output  signed  [18:0]         o_4 ; 
output  signed  [18:0]         o_5 ; 
output  signed  [18:0]         o_6 ; 
output  signed  [18:0]         o_7 ; 
output  signed  [18:0]         o_8 ;
output  signed  [18:0]         o_9 ;
output  signed  [18:0]         o_10;
output  signed  [18:0]         o_11;
output  signed  [18:0]         o_12;
output  signed  [18:0]         o_13;
output  signed  [18:0]         o_14;
output  signed  [18:0]         o_15;
output  signed  [18:0]         o_16;
output  signed  [18:0]         o_17;
output  signed  [18:0]         o_18;
output  signed  [18:0]         o_19;
output  signed  [18:0]         o_20;
output  signed  [18:0]         o_21;
output  signed  [18:0]         o_22;
output  signed  [18:0]         o_23;
output  signed  [18:0]         o_24;
output  signed  [18:0]         o_25;
output  signed  [18:0]         o_26;
output  signed  [18:0]         o_27;
output  signed  [18:0]         o_28;
output  signed  [18:0]         o_29;
output  signed  [18:0]         o_30;
output  signed  [18:0]         o_31;

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

wire  signed  [15:0]        in_0;  
wire  signed  [15:0]        in_1; 
wire  signed  [15:0]        in_2; 
wire  signed  [15:0]        in_3; 
wire  signed  [15:0]        in_4; 
wire  signed  [15:0]        in_5; 
wire  signed  [15:0]        in_6; 
wire  signed  [15:0]        in_7; 
wire  signed  [15:0]        in_8; 
wire  signed  [15:0]        in_9; 
wire  signed  [15:0]        in_10; 
wire  signed  [15:0]        in_11; 
wire  signed  [15:0]        in_12; 
wire  signed  [15:0]        in_13; 
wire  signed  [15:0]        in_14; 
wire  signed  [15:0]        in_15; 
wire  signed  [15:0]        in_16; 
wire  signed  [15:0]        in_17; 
wire  signed  [15:0]        in_18; 
wire  signed  [15:0]        in_19; 
wire  signed  [15:0]        in_20; 
wire  signed  [15:0]        in_21; 
wire  signed  [15:0]        in_22; 
wire  signed  [15:0]        in_23; 
wire  signed  [15:0]        in_24; 
wire  signed  [15:0]        in_25; 
wire  signed  [15:0]        in_26; 
wire  signed  [15:0]        in_27; 
wire  signed  [15:0]        in_28; 
wire  signed  [15:0]        in_29; 
wire  signed  [15:0]        in_30; 
wire  signed  [15:0]        in_31; 

wire signed   [16:0]        o32_0;
wire signed   [16:0]        o32_1;
wire signed   [16:0]        o32_2;
wire signed   [16:0]        o32_3;
wire signed   [16:0]        o32_4;
wire signed   [16:0]        o32_5;
wire signed   [16:0]        o32_6;
wire signed   [16:0]        o32_7;
wire signed   [16:0]        o32_8;
wire signed   [16:0]        o32_9;
wire signed   [16:0]        o32_10;
wire signed   [16:0]        o32_11;
wire signed   [16:0]        o32_12;
wire signed   [16:0]        o32_13;
wire signed   [16:0]        o32_14;
wire signed   [16:0]        o32_15;
wire signed   [16:0]        o32_16;
wire signed   [16:0]        o32_17;
wire signed   [16:0]        o32_18;
wire signed   [16:0]        o32_19;
wire signed   [16:0]        o32_20;
wire signed   [16:0]        o32_21;
wire signed   [16:0]        o32_22;
wire signed   [16:0]        o32_23;
wire signed   [16:0]        o32_24;
wire signed   [16:0]        o32_25;
wire signed   [16:0]        o32_26;
wire signed   [16:0]        o32_27;
wire signed   [16:0]        o32_28;
wire signed   [16:0]        o32_29;
wire signed   [16:0]        o32_30;
wire signed   [16:0]        o32_31;

wire signed    [17:0]        o16_0;
wire signed    [17:0]        o16_1;
wire signed    [17:0]        o16_2;
wire signed    [17:0]        o16_3;
wire signed    [17:0]        o16_4;
wire signed    [17:0]        o16_5;
wire signed    [17:0]        o16_6;
wire signed    [17:0]        o16_7;
wire signed    [17:0]        o16_8;
wire signed    [17:0]        o16_9;
wire signed    [17:0]        o16_10;
wire signed    [17:0]        o16_11;
wire signed    [17:0]        o16_12;
wire signed    [17:0]        o16_13;
wire signed    [17:0]        o16_14;
wire signed    [17:0]        o16_15;
wire signed    [17:0]        o16_16;
wire signed    [17:0]        o16_17;
wire signed    [17:0]        o16_18;
wire signed    [17:0]        o16_19;
wire signed    [17:0]        o16_20;
wire signed    [17:0]        o16_21;
wire signed    [17:0]        o16_22;
wire signed    [17:0]        o16_23;
wire signed    [17:0]        o16_24;
wire signed    [17:0]        o16_25;
wire signed    [17:0]        o16_26;
wire signed    [17:0]        o16_27;
wire signed    [17:0]        o16_28;
wire signed    [17:0]        o16_29;
wire signed    [17:0]        o16_30;
wire signed    [17:0]        o16_31;

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
    
assign in_0=inverse?'b0:i_0;
assign in_1=inverse?'b0:i_1;
assign in_2=inverse?'b0:i_2;
assign in_3=inverse?'b0:i_3;
assign in_4=inverse?'b0:i_4;
assign in_5=inverse?'b0:i_5;
assign in_6=inverse?'b0:i_6;
assign in_7=inverse?'b0:i_7;
assign in_8=inverse?'b0:i_8;
assign in_9=inverse?'b0:i_9;
assign in_10=inverse?'b0:i_10;
assign in_11=inverse?'b0:i_11;
assign in_12=inverse?'b0:i_12;
assign in_13=inverse?'b0:i_13;
assign in_14=inverse?'b0:i_14;
assign in_15=inverse?'b0:i_15;
assign in_16=inverse?'b0:i_16;
assign in_17=inverse?'b0:i_17;
assign in_18=inverse?'b0:i_18;
assign in_19=inverse?'b0:i_19;
assign in_20=inverse?'b0:i_20;
assign in_21=inverse?'b0:i_21;
assign in_22=inverse?'b0:i_22;
assign in_23=inverse?'b0:i_23;
assign in_24=inverse?'b0:i_24;
assign in_25=inverse?'b0:i_25;
assign in_26=inverse?'b0:i_26;
assign in_27=inverse?'b0:i_27;
assign in_28=inverse?'b0:i_28;
assign in_29=inverse?'b0:i_29;
assign in_30=inverse?'b0:i_30;
assign in_31=inverse?'b0:i_31;
	
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

butterfly1_32  b1_32(
           .enable(enable_32),
              .i_0(in_0),
              .i_1(in_1),
              .i_2(in_2),
              .i_3(in_3),
              .i_4(in_4),
              .i_5(in_5),
              .i_6(in_6),
              .i_7(in_7),
              .i_8(in_8),
              .i_9(in_9),
              .i_10(in_10),
              .i_11(in_11),
              .i_12(in_12),
              .i_13(in_13),
              .i_14(in_14),
              .i_15(in_15),
              .i_16(in_16),
              .i_17(in_17),
              .i_18(in_18),
              .i_19(in_19),
              .i_20(in_20),
              .i_21(in_21),
              .i_22(in_22),
              .i_23(in_23),
              .i_24(in_24),
              .i_25(in_25),
              .i_26(in_26),
              .i_27(in_27),
              .i_28(in_28),
              .i_29(in_29),
              .i_30(in_30),
              .i_31(in_31),
                
               .o_0(o32_0),
               .o_1(o32_1),
               .o_2(o32_2),
               .o_3(o32_3),
               .o_4(o32_4),
               .o_5(o32_5),
               .o_6(o32_6),
               .o_7(o32_7),
               .o_8(o32_8),
               .o_9(o32_9),
              .o_10(o32_10),
              .o_11(o32_11),
              .o_12(o32_12),
              .o_13(o32_13),
              .o_14(o32_14),
              .o_15(o32_15),
              .o_16(o32_16),
              .o_17(o32_17),
              .o_18(o32_18),
              .o_19(o32_19),
              .o_20(o32_20),
              .o_21(o32_21),
              .o_22(o32_22),
              .o_23(o32_23),
              .o_24(o32_24),
              .o_25(o32_25),
              .o_26(o32_26),
              .o_27(o32_27),
              .o_28(o32_28),
              .o_29(o32_29),
              .o_30(o32_30),
              .o_31(o32_31)
);

butterfly1_16  b1_160(
             .enable (enable16_0),
                .i_0 (o32_0),
                .i_1 (o32_1),
                .i_2 (o32_2),
                .i_3 (o32_3),
                .i_4 (o32_4),
                .i_5 (o32_5),
                .i_6 (o32_6),
                .i_7 (o32_7),
                .i_8 (o32_8),
                .i_9 (o32_9),
                .i_10(o32_10),
                .i_11(o32_11),
                .i_12(o32_12),
                .i_13(o32_13),
                .i_14(o32_14),
                .i_15(o32_15),
                            
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

butterfly1_16  b1_161(
            .enable (enable16_1),
               .i_0 (o32_16),
               .i_1 (o32_17),
               .i_2 (o32_18),
               .i_3 (o32_19),
               .i_4 (o32_20),
               .i_5 (o32_21),
               .i_6 (o32_22),
               .i_7 (o32_23),
               .i_8 (o32_24),
               .i_9 (o32_25),
               .i_10(o32_26),
               .i_11(o32_27),
               .i_12(o32_28),
               .i_13(o32_29),
               .i_14(o32_30),
               .i_15(o32_31),
                           
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

butterfly1_8   b1_80(
             .enable(enable8_0),
                .i_0(o16_0),
                .i_1(o16_1),
                .i_2(o16_2),
                .i_3(o16_3),
                .i_4(o16_4),
                .i_5(o16_5),
                .i_6(o16_6),
                .i_7(o16_7),
                   
                .o_0(o_0),
                .o_1(o_1),
                .o_2(o_2),
                .o_3(o_3),
                .o_4(o_4),
                .o_5(o_5),
                .o_6(o_6),
                .o_7(o_7)              
);

butterfly1_8   b1_81(
            .enable(enable8_1),
               .i_0(o16_8 ),
               .i_1(o16_9 ),
               .i_2(o16_10),
               .i_3(o16_11),
               .i_4(o16_12),
               .i_5(o16_13),
               .i_6(o16_14),
               .i_7(o16_15),
                         
               .o_0(o_8 ),
               .o_1(o_9 ),
               .o_2(o_10),
               .o_3(o_11),
               .o_4(o_12),
               .o_5(o_13),
               .o_6(o_14),
               .o_7(o_15)              
);

butterfly1_8   b1_82(
           .enable(enable8_2),
              .i_0(o16_16),
              .i_1(o16_17),
              .i_2(o16_18),
              .i_3(o16_19),
              .i_4(o16_20),
              .i_5(o16_21),
              .i_6(o16_22),
              .i_7(o16_23),
                        
              .o_0(o_16),
              .o_1(o_17),
              .o_2(o_18),
              .o_3(o_19),
              .o_4(o_20),
              .o_5(o_21),
              .o_6(o_22),
              .o_7(o_23)              
);

butterfly1_8   b1_83(
           .enable(enable8_1),
              .i_0(o16_24),
              .i_1(o16_25),
              .i_2(o16_26),
              .i_3(o16_27),
              .i_4(o16_28),
              .i_5(o16_29),
              .i_6(o16_30),
              .i_7(o16_31),
                        
              .o_0(o_24),
              .o_1(o_25),
              .o_2(o_26),
              .o_3(o_27),
              .o_4(o_28),
              .o_5(o_29),
              .o_6(o_30),
              .o_7(o_31)              
);

endmodule