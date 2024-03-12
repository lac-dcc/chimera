module dct_top(
            clk,
            rst,
			row,
        i_valid,
		inverse,
     i_transize,
	   tq_sel_i,
           
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

input                          clk;
input                          rst;
input                          row;
input                      i_valid;
input                      inverse;
input          [1:0]    i_transize;
input          [1:0]      tq_sel_i;
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

output                      o_valid;
output signed  [15:0]           o_0;
output signed  [15:0]           o_1;
output signed  [15:0]           o_2;
output signed  [15:0]           o_3;
output signed  [15:0]           o_4;
output signed  [15:0]           o_5;
output signed  [15:0]           o_6;
output signed  [15:0]           o_7;
output signed  [15:0]           o_8;
output signed  [15:0]           o_9;
output signed  [15:0]           o_10;
output signed  [15:0]           o_11;
output signed  [15:0]           o_12;
output signed  [15:0]           o_13;
output signed  [15:0]           o_14;
output signed  [15:0]           o_15;
output signed  [15:0]           o_16;
output signed  [15:0]           o_17;
output signed  [15:0]           o_18;
output signed  [15:0]           o_19;
output signed  [15:0]           o_20;
output signed  [15:0]           o_21;
output signed  [15:0]           o_22;
output signed  [15:0]           o_23;
output signed  [15:0]           o_24;
output signed  [15:0]           o_25;
output signed  [15:0]           o_26;
output signed  [15:0]           o_27;
output signed  [15:0]           o_28;
output signed  [15:0]           o_29;
output signed  [15:0]           o_30;
output signed  [15:0]           o_31;

// ********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// ********************************************

wire                    os1_valid;
wire                    os2_valid;
wire                    os3_valid;

wire  signed   [18:0]      os1_0 ;
wire  signed   [18:0]      os1_1 ;
wire  signed   [18:0]      os1_2 ;
wire  signed   [18:0]      os1_3 ;
wire  signed   [18:0]      os1_4 ;
wire  signed   [18:0]      os1_5 ;
wire  signed   [18:0]      os1_6 ;
wire  signed   [18:0]      os1_7 ;
wire  signed   [18:0]      os1_8 ;
wire  signed   [18:0]      os1_9 ;
wire  signed   [18:0]      os1_10;
wire  signed   [18:0]      os1_11;
wire  signed   [18:0]      os1_12;
wire  signed   [18:0]      os1_13;
wire  signed   [18:0]      os1_14;
wire  signed   [18:0]      os1_15;
wire  signed   [18:0]      os1_16;
wire  signed   [18:0]      os1_17;
wire  signed   [18:0]      os1_18;
wire  signed   [18:0]      os1_19;
wire  signed   [18:0]      os1_20;
wire  signed   [18:0]      os1_21;
wire  signed   [18:0]      os1_22;
wire  signed   [18:0]      os1_23;
wire  signed   [18:0]      os1_24;
wire  signed   [18:0]      os1_25;
wire  signed   [18:0]      os1_26;
wire  signed   [18:0]      os1_27;
wire  signed   [18:0]      os1_28;
wire  signed   [18:0]      os1_29;
wire  signed   [18:0]      os1_30;
wire  signed   [18:0]      os1_31;

wire  signed   [27:0]       os2_0 ;
wire  signed   [27:0]       os2_1 ;
wire  signed   [27:0]       os2_2 ;
wire  signed   [27:0]       os2_3 ;
wire  signed   [27:0]       os2_4 ;
wire  signed   [27:0]       os2_5 ;
wire  signed   [27:0]       os2_6 ;
wire  signed   [27:0]       os2_7 ;
wire  signed   [27:0]       os2_8 ;
wire  signed   [27:0]       os2_9 ;
wire  signed   [27:0]       os2_10;
wire  signed   [27:0]       os2_11;
wire  signed   [27:0]       os2_12;
wire  signed   [27:0]       os2_13;
wire  signed   [27:0]       os2_14;
wire  signed   [27:0]       os2_15;
wire  signed   [27:0]       os2_16;
wire  signed   [27:0]       os2_17;
wire  signed   [27:0]       os2_18;
wire  signed   [27:0]       os2_19;
wire  signed   [27:0]       os2_20;
wire  signed   [27:0]       os2_21;
wire  signed   [27:0]       os2_22;
wire  signed   [27:0]       os2_23;
wire  signed   [27:0]       os2_24;
wire  signed   [27:0]       os2_25;
wire  signed   [27:0]       os2_26;
wire  signed   [27:0]       os2_27;
wire  signed   [27:0]       os2_28;
wire  signed   [27:0]       os2_29;
wire  signed   [27:0]       os2_30;
wire  signed   [27:0]       os2_31;

wire  signed   [27:0]       os3_0 ;
wire  signed   [27:0]       os3_1 ;
wire  signed   [27:0]       os3_2 ;
wire  signed   [27:0]       os3_3 ;
wire  signed   [27:0]       os3_4 ;
wire  signed   [27:0]       os3_5 ;
wire  signed   [27:0]       os3_6 ;
wire  signed   [27:0]       os3_7 ;
wire  signed   [27:0]       os3_8 ;
wire  signed   [27:0]       os3_9 ;
wire  signed   [27:0]       os3_10;
wire  signed   [27:0]       os3_11;
wire  signed   [27:0]       os3_12;
wire  signed   [27:0]       os3_13;
wire  signed   [27:0]       os3_14;
wire  signed   [27:0]       os3_15;
wire  signed   [27:0]       os3_16;
wire  signed   [27:0]       os3_17;
wire  signed   [27:0]       os3_18;
wire  signed   [27:0]       os3_19;
wire  signed   [27:0]       os3_20;
wire  signed   [27:0]       os3_21;
wire  signed   [27:0]       os3_22;
wire  signed   [27:0]       os3_23;
wire  signed   [27:0]       os3_24;
wire  signed   [27:0]       os3_25;
wire  signed   [27:0]       os3_26;
wire  signed   [27:0]       os3_27;
wire  signed   [27:0]       os3_28;
wire  signed   [27:0]       os3_29;
wire  signed   [27:0]       os3_30;
wire  signed   [27:0]       os3_31;

// ********************************************
//                                             
//   Reg DECLARATION                         
//                                             
// ********************************************

reg         [1:0]           i_transize_1;
reg         [1:0]           i_transize_2;
reg         [1:0]           i_transize_3;
reg         [1:0]           i_transize_4;

 
// ********************************************
//                                             
//    Sequence Logic                      
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
  i_transize_1<='b0;
else
  i_transize_1<=i_transize;
  
always@(posedge clk or negedge rst)
 if(!rst)
  i_transize_2<='b0;
 else
  i_transize_2<=i_transize_1;
 
always@(posedge clk or negedge rst)
 if(!rst)
  i_transize_3<='b0;
 else
  i_transize_3<=i_transize_2;
  
always@(posedge clk or negedge rst)
 if(!rst)
  i_transize_4<='b0;
 else
  i_transize_4<=i_transize_3;
 
 
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

stage1           stage1_0(
                   .clk(clk),.rst(rst),
   .i_valid(i_valid),.inverse(inverse),
               .i_transize(i_transize),
         
         .i_0 (i_0), .i_1 (i_1), .i_2 (i_2), .i_3 (i_3 ),
         .i_4 (i_4), .i_5 (i_5), .i_6 (i_6), .i_7 (i_7 ),
         .i_8 (i_8), .i_9 (i_9), .i_10(i_10),.i_11(i_11),      
         .i_12(i_12),.i_13(i_13),.i_14(i_14),.i_15(i_15),
		 .i_16(i_16),.i_17(i_17),.i_18(i_18),.i_19(i_19),
         .i_20(i_20),.i_21(i_21),.i_22(i_22),.i_23(i_23),
         .i_24(i_24),.i_25(i_25),.i_26(i_26),.i_27(i_27),      
         .i_28(i_28),.i_29(i_29),.i_30(i_30),.i_31(i_31),
		 
         .o_valid(os1_valid),
         .o_0 (os1_0) ,.o_1 (os1_1) ,.o_2 (os1_2) ,.o_3 (os1_3 ),
         .o_4 (os1_4) ,.o_5 (os1_5) ,.o_6 (os1_6) ,.o_7 (os1_7 ),
         .o_8 (os1_8) ,.o_9 (os1_9) ,.o_10(os1_10),.o_11(os1_11),      
         .o_12(os1_12),.o_13(os1_13),.o_14(os1_14),.o_15(os1_15),
		 .o_16(os1_16),.o_17(os1_17),.o_18(os1_18),.o_19(os1_19),
         .o_20(os1_20),.o_21(os1_21),.o_22(os1_22),.o_23(os1_23),
         .o_24(os1_24),.o_25(os1_25),.o_26(os1_26),.o_27(os1_27),      
         .o_28(os1_28),.o_29(os1_29),.o_30(os1_30),.o_31(os1_31)      
);

 mcm    mcm_0(
       .clk(clk),.rst(rst),
       .i_valid(os1_valid),
       .inverse(inverse),
       .i_transize(i_transize_1),
	   .tq_sel_i(tq_sel_i),
  
        .i_0 (os1_0), .i_1 (os1_1), .i_2 (os1_2), .i_3 (os1_3 ),
        .i_4 (os1_4), .i_5 (os1_5), .i_6 (os1_6), .i_7 (os1_7 ),
        .i_8 (os1_8), .i_9 (os1_9), .i_10(os1_10),.i_11(os1_11),      
        .i_12(os1_12),.i_13(os1_13),.i_14(os1_14),.i_15(os1_15),
		.i_16(os1_16),.i_17(os1_17),.i_18(os1_18),.i_19(os1_19),
        .i_20(os1_20),.i_21(os1_21),.i_22(os1_22),.i_23(os1_23),
        .i_24(os1_24),.i_25(os1_25),.i_26(os1_26),.i_27(os1_27),      
        .i_28(os1_28),.i_29(os1_29),.i_30(os1_30),.i_31(os1_31),
		 
         .o_valid(os2_valid),
         .o_0 (os2_0) ,.o_1 (os2_1) ,.o_2 (os2_2) ,.o_3 (os2_3),
         .o_4 (os2_4) ,.o_5 (os2_5) ,.o_6 (os2_6) ,.o_7 (os2_7),
         .o_8 (os2_8) ,.o_9 (os2_9) ,.o_10(os2_10),.o_11(os2_11),      
         .o_12(os2_12),.o_13(os2_13),.o_14(os2_14),.o_15(os2_15),
		 .o_16(os2_16),.o_17(os2_17),.o_18(os2_18),.o_19(os2_19),
         .o_20(os2_20),.o_21(os2_21),.o_22(os2_22),.o_23(os2_23),
         .o_24(os2_24),.o_25(os2_25),.o_26(os2_26),.o_27(os2_27),      
         .o_28(os2_28),.o_29(os2_29),.o_30(os2_30),.o_31(os2_31)      
);

stage3   stage3_0(
          .clk(clk),.rst(rst),
          .i_valid(os2_valid),.inverse(inverse),
          .i_transize(i_transize_3),
         
          .i_0 (os2_0), .i_1 (os2_1), .i_2 (os2_2), .i_3 (os2_3),
          .i_4 (os2_4), .i_5 (os2_5), .i_6 (os2_6), .i_7 (os2_7),
          .i_8 (os2_8), .i_9 (os2_9), .i_10(os2_10),.i_11(os2_11),      
          .i_12(os2_12),.i_13(os2_13),.i_14(os2_14),.i_15(os2_15),
		  .i_16(os2_16),.i_17(os2_17),.i_18(os2_18),.i_19(os2_19),
          .i_20(os2_20),.i_21(os2_21),.i_22(os2_22),.i_23(os2_23),
          .i_24(os2_24),.i_25(os2_25),.i_26(os2_26),.i_27(os2_27),      
          .i_28(os2_28),.i_29(os2_29),.i_30(os2_30),.i_31(os2_31),
		 
         .o_valid(os3_valid),
         .o_0 (os3_0) ,.o_1 (os3_1) ,.o_2 (os3_2) ,.o_3 (os3_3),
         .o_4 (os3_4) ,.o_5 (os3_5) ,.o_6 (os3_6) ,.o_7 (os3_7),
         .o_8 (os3_8) ,.o_9 (os3_9) ,.o_10(os3_10),.o_11(os3_11),      
         .o_12(os3_12),.o_13(os3_13),.o_14(os3_14),.o_15(os3_15),
		 .o_16(os3_16),.o_17(os3_17),.o_18(os3_18),.o_19(os3_19),
         .o_20(os3_20),.o_21(os3_21),.o_22(os3_22),.o_23(os3_23),
         .o_24(os3_24),.o_25(os3_25),.o_26(os3_26),.o_27(os3_27),      
         .o_28(os3_28),.o_29(os3_29),.o_30(os3_30),.o_31(os3_31)      
);
  
offset_shift     os(
          .clk(clk),.rst(rst), 
          .row(row),.i_valid(os3_valid),
          .inverse(inverse),.i_transize(i_transize_4),
          
          .i_0 (os3_0), .i_1 (os3_1), .i_2 (os3_2), .i_3 (os3_3),
          .i_4 (os3_4), .i_5 (os3_5), .i_6 (os3_6), .i_7 (os3_7),
          .i_8 (os3_8), .i_9 (os3_9), .i_10(os3_10),.i_11(os3_11),      
          .i_12(os3_12),.i_13(os3_13),.i_14(os3_14),.i_15(os3_15),
		      .i_16(os3_16),.i_17(os3_17),.i_18(os3_18),.i_19(os3_19),
          .i_20(os3_20),.i_21(os3_21),.i_22(os3_22),.i_23(os3_23),
          .i_24(os3_24),.i_25(os3_25),.i_26(os3_26),.i_27(os3_27),      
          .i_28(os3_28),.i_29(os3_29),.i_30(os3_30),.i_31(os3_31),
		 
          .o_valid(o_valid),
          .o_0 (o_0) ,.o_1 (o_1) ,.o_2 (o_2) ,.o_3 (o_3),
          .o_4 (o_4) ,.o_5 (o_5) ,.o_6 (o_6) ,.o_7 (o_7),
          .o_8 (o_8) ,.o_9 (o_9) ,.o_10(o_10),.o_11(o_11),      
          .o_12(o_12),.o_13(o_13),.o_14(o_14),.o_15(o_15),
		      .o_16(o_16),.o_17(o_17),.o_18(o_18),.o_19(o_19),
          .o_20(o_20),.o_21(o_21),.o_22(o_22),.o_23(o_23),
          .o_24(o_24),.o_25(o_25),.o_26(o_26),.o_27(o_27),      
          .o_28(o_28),.o_29(o_29),.o_30(o_30),.o_31(o_31)      
);

endmodule
                          
                          