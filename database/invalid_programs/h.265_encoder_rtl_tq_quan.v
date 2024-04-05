module quan(
        clk ,
        rst ,
       type ,
         qp ,
    i_valid ,
 i_2d_valid ,
 i_transize ,
       
        i_0 ,                     
        i_1 ,
        i_2 ,
        i_3 ,
        i_4 ,
        i_5 ,
        i_6 ,
        i_7 ,
        i_8 ,
        i_9 ,
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
 
// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
  
input                          clk;
input                          rst;
input                         type;
input                      i_valid;
input                   i_2d_valid;
input     [5:0]                 qp;
input     [1:0]         i_transize;

input  signed   [15:0]         i_0 ;
input  signed   [15:0]         i_1 ;
input  signed   [15:0]         i_2 ;
input  signed   [15:0]         i_3 ;
input  signed   [15:0]         i_4 ;
input  signed   [15:0]         i_5 ;
input  signed   [15:0]         i_6 ;
input  signed   [15:0]         i_7 ;
input  signed   [15:0]         i_8 ;
input  signed   [15:0]         i_9 ;
input  signed   [15:0]         i_10;
input  signed   [15:0]         i_11;
input  signed   [15:0]         i_12;
input  signed   [15:0]         i_13;
input  signed   [15:0]         i_14;
input  signed   [15:0]         i_15;
input  signed   [15:0]         i_16;
input  signed   [15:0]         i_17;
input  signed   [15:0]         i_18;
input  signed   [15:0]         i_19;
input  signed   [15:0]         i_20;
input  signed   [15:0]         i_21;
input  signed   [15:0]         i_22;
input  signed   [15:0]         i_23;
input  signed   [15:0]         i_24;
input  signed   [15:0]         i_25;
input  signed   [15:0]         i_26;
input  signed   [15:0]         i_27;
input  signed   [15:0]         i_28;
input  signed   [15:0]         i_29;
input  signed   [15:0]         i_30;
input  signed   [15:0]         i_31;

output   reg                      o_valid;
output   reg  signed   [15:0]        o_0 ;
output   reg  signed   [15:0]        o_1 ;
output   reg  signed   [15:0]        o_2 ;
output   reg  signed   [15:0]        o_3 ;
output   reg  signed   [15:0]        o_4 ;
output   reg  signed   [15:0]        o_5 ;
output   reg  signed   [15:0]        o_6 ;
output   reg  signed   [15:0]        o_7 ;
output   reg  signed   [15:0]        o_8 ;
output   reg  signed   [15:0]        o_9 ;
output   reg  signed   [15:0]        o_10;
output   reg  signed   [15:0]        o_11;
output   reg  signed   [15:0]        o_12;
output   reg  signed   [15:0]        o_13;
output   reg  signed   [15:0]        o_14;
output   reg  signed   [15:0]        o_15;
output   reg  signed   [15:0]        o_16;
output   reg  signed   [15:0]        o_17;
output   reg  signed   [15:0]        o_18;
output   reg  signed   [15:0]        o_19;
output   reg  signed   [15:0]        o_20;
output   reg  signed   [15:0]        o_21;
output   reg  signed   [15:0]        o_22;
output   reg  signed   [15:0]        o_23;
output   reg  signed   [15:0]        o_24;
output   reg  signed   [15:0]        o_25;
output   reg  signed   [15:0]        o_26;
output   reg  signed   [15:0]        o_27;
output   reg  signed   [15:0]        o_28;
output   reg  signed   [15:0]        o_29;
output   reg  signed   [15:0]        o_30;
output   reg  signed   [15:0]        o_31;

// ********************************************
//                                             
//    WIRE DECLARATION                                               
//                                                                             
// ********************************************

wire                      i_val;
wire                    inverse;

wire  signed [15:0]           Q;
wire  signed [27:0]      offset;
wire  [4:0]               shift;

wire  signed   [15:0]       min;
wire  signed   [15:0]       max;
wire  signed   [15:0]   iabs_0 ;
wire  signed   [15:0]   iabs_1 ;
wire  signed   [15:0]   iabs_2 ;
wire  signed   [15:0]   iabs_3 ;
wire  signed   [15:0]   iabs_4 ;
wire  signed   [15:0]   iabs_5 ;
wire  signed   [15:0]   iabs_6 ;
wire  signed   [15:0]   iabs_7 ;
wire  signed   [15:0]   iabs_8 ;
wire  signed   [15:0]   iabs_9 ;
wire  signed   [15:0]   iabs_10;
wire  signed   [15:0]   iabs_11;
wire  signed   [15:0]   iabs_12;
wire  signed   [15:0]   iabs_13;
wire  signed   [15:0]   iabs_14;
wire  signed   [15:0]   iabs_15;
wire  signed   [15:0]   iabs_16;
wire  signed   [15:0]   iabs_17;
wire  signed   [15:0]   iabs_18;
wire  signed   [15:0]   iabs_19;
wire  signed   [15:0]   iabs_20;
wire  signed   [15:0]   iabs_21;
wire  signed   [15:0]   iabs_22;
wire  signed   [15:0]   iabs_23;
wire  signed   [15:0]   iabs_24;
wire  signed   [15:0]   iabs_25;
wire  signed   [15:0]   iabs_26;
wire  signed   [15:0]   iabs_27;
wire  signed   [15:0]   iabs_28;
wire  signed   [15:0]   iabs_29;
wire  signed   [15:0]   iabs_30;
wire  signed   [15:0]   iabs_31;

wire  signed   [30:0]    w_m_0 ;
wire  signed   [30:0]    w_m_1 ;
wire  signed   [30:0]    w_m_2 ;
wire  signed   [30:0]    w_m_3 ;
wire  signed   [30:0]    w_m_4 ;
wire  signed   [30:0]    w_m_5 ;
wire  signed   [30:0]    w_m_6 ;
wire  signed   [30:0]    w_m_7 ;
wire  signed   [30:0]    w_m_8 ;
wire  signed   [30:0]    w_m_9 ;
wire  signed   [30:0]    w_m_10;
wire  signed   [30:0]    w_m_11;
wire  signed   [30:0]    w_m_12;
wire  signed   [30:0]    w_m_13;
wire  signed   [30:0]    w_m_14;
wire  signed   [30:0]    w_m_15;
wire  signed   [30:0]    w_m_16;
wire  signed   [30:0]    w_m_17;
wire  signed   [30:0]    w_m_18;
wire  signed   [30:0]    w_m_19;
wire  signed   [30:0]    w_m_20;
wire  signed   [30:0]    w_m_21;
wire  signed   [30:0]    w_m_22;
wire  signed   [30:0]    w_m_23;
wire  signed   [30:0]    w_m_24;
wire  signed   [30:0]    w_m_25;
wire  signed   [30:0]    w_m_26;
wire  signed   [30:0]    w_m_27;
wire  signed   [30:0]    w_m_28;
wire  signed   [30:0]    w_m_29;
wire  signed   [30:0]    w_m_30;
wire  signed   [30:0]    w_m_31;
               
wire  signed   [31:0]    w_a_0 ;
wire  signed   [31:0]    w_a_1 ;
wire  signed   [31:0]    w_a_2 ;
wire  signed   [31:0]    w_a_3 ;
wire  signed   [31:0]    w_a_4 ;
wire  signed   [31:0]    w_a_5 ;
wire  signed   [31:0]    w_a_6 ;
wire  signed   [31:0]    w_a_7 ;
wire  signed   [31:0]    w_a_8 ;
wire  signed   [31:0]    w_a_9 ;
wire  signed   [31:0]    w_a_10;
wire  signed   [31:0]    w_a_11;
wire  signed   [31:0]    w_a_12;
wire  signed   [31:0]    w_a_13;
wire  signed   [31:0]    w_a_14;
wire  signed   [31:0]    w_a_15;
wire  signed   [31:0]    w_a_16;
wire  signed   [31:0]    w_a_17;
wire  signed   [31:0]    w_a_18;
wire  signed   [31:0]    w_a_19;
wire  signed   [31:0]    w_a_20;
wire  signed   [31:0]    w_a_21;
wire  signed   [31:0]    w_a_22;
wire  signed   [31:0]    w_a_23;
wire  signed   [31:0]    w_a_24;
wire  signed   [31:0]    w_a_25;
wire  signed   [31:0]    w_a_26;
wire  signed   [31:0]    w_a_27;
wire  signed   [31:0]    w_a_28;
wire  signed   [31:0]    w_a_29;
wire  signed   [31:0]    w_a_30;
wire  signed   [31:0]    w_a_31;
               
wire  signed   [30:0]    w_s_0 ;
wire  signed   [30:0]    w_s_1 ;
wire  signed   [30:0]    w_s_2 ;
wire  signed   [30:0]    w_s_3 ;
wire  signed   [30:0]    w_s_4 ;
wire  signed   [30:0]    w_s_5 ;
wire  signed   [30:0]    w_s_6 ;
wire  signed   [30:0]    w_s_7 ;
wire  signed   [30:0]    w_s_8 ;
wire  signed   [30:0]    w_s_9 ;
wire  signed   [30:0]    w_s_10;
wire  signed   [30:0]    w_s_11;
wire  signed   [30:0]    w_s_12;
wire  signed   [30:0]    w_s_13;
wire  signed   [30:0]    w_s_14;
wire  signed   [30:0]    w_s_15;
wire  signed   [30:0]    w_s_16;
wire  signed   [30:0]    w_s_17;
wire  signed   [30:0]    w_s_18;
wire  signed   [30:0]    w_s_19;
wire  signed   [30:0]    w_s_20;
wire  signed   [30:0]    w_s_21;
wire  signed   [30:0]    w_s_22;
wire  signed   [30:0]    w_s_23;
wire  signed   [30:0]    w_s_24;
wire  signed   [30:0]    w_s_25;
wire  signed   [30:0]    w_s_26;
wire  signed   [30:0]    w_s_27;
wire  signed   [30:0]    w_s_28;
wire  signed   [30:0]    w_s_29;
wire  signed   [30:0]    w_s_30;
wire  signed   [30:0]    w_s_31;

wire  signed   [15:0]    w_s_s0 ;
wire  signed   [15:0]    w_s_s1 ;
wire  signed   [15:0]    w_s_s2 ;
wire  signed   [15:0]    w_s_s3 ;
wire  signed   [15:0]    w_s_s4 ;
wire  signed   [15:0]    w_s_s5 ;
wire  signed   [15:0]    w_s_s6 ;
wire  signed   [15:0]    w_s_s7 ;
wire  signed   [15:0]    w_s_s8 ;
wire  signed   [15:0]    w_s_s9 ;
wire  signed   [15:0]    w_s_s10;
wire  signed   [15:0]    w_s_s11;
wire  signed   [15:0]    w_s_s12;
wire  signed   [15:0]    w_s_s13;
wire  signed   [15:0]    w_s_s14;
wire  signed   [15:0]    w_s_s15;
wire  signed   [15:0]    w_s_s16;
wire  signed   [15:0]    w_s_s17;
wire  signed   [15:0]    w_s_s18;
wire  signed   [15:0]    w_s_s19;
wire  signed   [15:0]    w_s_s20;
wire  signed   [15:0]    w_s_s21;
wire  signed   [15:0]    w_s_s22;
wire  signed   [15:0]    w_s_s23;
wire  signed   [15:0]    w_s_s24;
wire  signed   [15:0]    w_s_s25;
wire  signed   [15:0]    w_s_s26;
wire  signed   [15:0]    w_s_s27;
wire  signed   [15:0]    w_s_s28;
wire  signed   [15:0]    w_s_s29;
wire  signed   [15:0]    w_s_s30;
wire  signed   [15:0]    w_s_s31;

wire  signed   [30:0]    w_cp1_0 ;
wire  signed   [30:0]    w_cp1_1 ;
wire  signed   [30:0]    w_cp1_2 ;
wire  signed   [30:0]    w_cp1_3 ;
wire  signed   [30:0]    w_cp1_4 ;
wire  signed   [30:0]    w_cp1_5 ;
wire  signed   [30:0]    w_cp1_6 ;
wire  signed   [30:0]    w_cp1_7 ;
wire  signed   [30:0]    w_cp1_8 ;
wire  signed   [30:0]    w_cp1_9 ;
wire  signed   [30:0]    w_cp1_10;
wire  signed   [30:0]    w_cp1_11;
wire  signed   [30:0]    w_cp1_12;
wire  signed   [30:0]    w_cp1_13;
wire  signed   [30:0]    w_cp1_14;
wire  signed   [30:0]    w_cp1_15;
wire  signed   [30:0]    w_cp1_16;
wire  signed   [30:0]    w_cp1_17;
wire  signed   [30:0]    w_cp1_18;
wire  signed   [30:0]    w_cp1_19;
wire  signed   [30:0]    w_cp1_20;
wire  signed   [30:0]    w_cp1_21;
wire  signed   [30:0]    w_cp1_22;
wire  signed   [30:0]    w_cp1_23;
wire  signed   [30:0]    w_cp1_24;
wire  signed   [30:0]    w_cp1_25;
wire  signed   [30:0]    w_cp1_26;
wire  signed   [30:0]    w_cp1_27;
wire  signed   [30:0]    w_cp1_28;
wire  signed   [30:0]    w_cp1_29;
wire  signed   [30:0]    w_cp1_30;
wire  signed   [30:0]    w_cp1_31;

wire  signed   [15:0]    w_cp2_0 ;
wire  signed   [15:0]    w_cp2_1 ;
wire  signed   [15:0]    w_cp2_2 ;
wire  signed   [15:0]    w_cp2_3 ;
wire  signed   [15:0]    w_cp2_4 ;
wire  signed   [15:0]    w_cp2_5 ;
wire  signed   [15:0]    w_cp2_6 ;
wire  signed   [15:0]    w_cp2_7 ;
wire  signed   [15:0]    w_cp2_8 ;
wire  signed   [15:0]    w_cp2_9 ;
wire  signed   [15:0]    w_cp2_10;
wire  signed   [15:0]    w_cp2_11;
wire  signed   [15:0]    w_cp2_12;
wire  signed   [15:0]    w_cp2_13;
wire  signed   [15:0]    w_cp2_14;
wire  signed   [15:0]    w_cp2_15;
wire  signed   [15:0]    w_cp2_16;
wire  signed   [15:0]    w_cp2_17;
wire  signed   [15:0]    w_cp2_18;
wire  signed   [15:0]    w_cp2_19;
wire  signed   [15:0]    w_cp2_20;
wire  signed   [15:0]    w_cp2_21;
wire  signed   [15:0]    w_cp2_22;
wire  signed   [15:0]    w_cp2_23;
wire  signed   [15:0]    w_cp2_24;
wire  signed   [15:0]    w_cp2_25;
wire  signed   [15:0]    w_cp2_26;
wire  signed   [15:0]    w_cp2_27;
wire  signed   [15:0]    w_cp2_28;
wire  signed   [15:0]    w_cp2_29;
wire  signed   [15:0]    w_cp2_30;
wire  signed   [15:0]    w_cp2_31;

wire  signed   [15:0]    w_out_0 ;
wire  signed   [15:0]    w_out_1 ;
wire  signed   [15:0]    w_out_2 ;
wire  signed   [15:0]    w_out_3 ;
wire  signed   [15:0]    w_out_4 ;
wire  signed   [15:0]    w_out_5 ;
wire  signed   [15:0]    w_out_6 ;
wire  signed   [15:0]    w_out_7 ;
wire  signed   [15:0]    w_out_8 ;
wire  signed   [15:0]    w_out_9 ;
wire  signed   [15:0]    w_out_10;
wire  signed   [15:0]    w_out_11;
wire  signed   [15:0]    w_out_12;
wire  signed   [15:0]    w_out_13;
wire  signed   [15:0]    w_out_14;
wire  signed   [15:0]    w_out_15;
wire  signed   [15:0]    w_out_16;
wire  signed   [15:0]    w_out_17;
wire  signed   [15:0]    w_out_18;
wire  signed   [15:0]    w_out_19;
wire  signed   [15:0]    w_out_20;
wire  signed   [15:0]    w_out_21;
wire  signed   [15:0]    w_out_22;
wire  signed   [15:0]    w_out_23;
wire  signed   [15:0]    w_out_24;
wire  signed   [15:0]    w_out_25;
wire  signed   [15:0]    w_out_26;
wire  signed   [15:0]    w_out_27;
wire  signed   [15:0]    w_out_28;
wire  signed   [15:0]    w_out_29;
wire  signed   [15:0]    w_out_30;
wire  signed   [15:0]    w_out_31;

// ********************************************
//                                             
//    REG DECLARATION                                               
//                                                                             
// ********************************************

reg  [4:0]         counter_val;
reg             counter_val_en;
reg  [5:0]             counter;
reg                 counter_en;


reg               i_2d_valid_1;
reg                i_signed_0 ;
reg                i_signed_1 ;
reg                i_signed_2 ;
reg                i_signed_3 ;
reg                i_signed_4 ;
reg                i_signed_5 ;
reg                i_signed_6 ;
reg                i_signed_7 ;
reg                i_signed_8 ;
reg                i_signed_9 ;
reg                i_signed_10;
reg                i_signed_11;
reg                i_signed_12;
reg                i_signed_13;
reg                i_signed_14;
reg                i_signed_15;
reg                i_signed_16;
reg                i_signed_17;
reg                i_signed_18;
reg                i_signed_19;
reg                i_signed_20;
reg                i_signed_21;
reg                i_signed_22;
reg                i_signed_23;
reg                i_signed_24;
reg                i_signed_25;
reg                i_signed_26;
reg                i_signed_27;
reg                i_signed_28;
reg                i_signed_29;
reg                i_signed_30;
reg                i_signed_31;

reg signed [30:0]         m_0 ;
reg signed [30:0]         m_1 ;
reg signed [30:0]         m_2 ;
reg signed [30:0]         m_3 ;
reg signed [30:0]         m_4 ;
reg signed [30:0]         m_5 ;
reg signed [30:0]         m_6 ;
reg signed [30:0]         m_7 ;
reg signed [30:0]         m_8 ;
reg signed [30:0]         m_9 ;
reg signed [30:0]         m_10;
reg signed [30:0]         m_11;
reg signed [30:0]         m_12;
reg signed [30:0]         m_13;
reg signed [30:0]         m_14;
reg signed [30:0]         m_15;
reg signed [30:0]         m_16;
reg signed [30:0]         m_17;
reg signed [30:0]         m_18;
reg signed [30:0]         m_19;
reg signed [30:0]         m_20;
reg signed [30:0]         m_21;
reg signed [30:0]         m_22;
reg signed [30:0]         m_23;
reg signed [30:0]         m_24;
reg signed [30:0]         m_25;
reg signed [30:0]         m_26;
reg signed [30:0]         m_27;
reg signed [30:0]         m_28;
reg signed [30:0]         m_29;
reg signed [30:0]         m_30;
reg signed [30:0]         m_31;

// ********************************************
//                                             
//    PARAMETER DECLARATION                                               
//                                                                             
// ********************************************

parameter           DCT_4=2'b00;
parameter           DCT_8=2'b01;
parameter           DCT_16=2'b10;
parameter           DCT_32=2'b11;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign  min= 16'b1000000000000000;
assign  max= 16'b0111111111111111;

assign      i_val=i_valid||counter_val_en;
assign      inverse=~(i_val||counter_en);

assign  iabs_0  =((~inverse)&i_0 [15]) ? (~i_0 +1) : i_0 ;//{1'b0,i_0 [14:0]};
assign  iabs_1  =((~inverse)&i_1 [15]) ? (~i_1 +1) : i_1 ;//{1'b0,i_1 [14:0]};
assign  iabs_2  =((~inverse)&i_2 [15]) ? (~i_2 +1) : i_2 ;//{1'b0,i_2 [14:0]};
assign  iabs_3  =((~inverse)&i_3 [15]) ? (~i_3 +1) : i_3 ;//{1'b0,i_3 [14:0]};
assign  iabs_4  =((~inverse)&i_4 [15]) ? (~i_4 +1) : i_4 ;//{1'b0,i_4 [14:0]};
assign  iabs_5  =((~inverse)&i_5 [15]) ? (~i_5 +1) : i_5 ;//{1'b0,i_5 [14:0]};
assign  iabs_6  =((~inverse)&i_6 [15]) ? (~i_6 +1) : i_6 ;//{1'b0,i_6 [14:0]};
assign  iabs_7  =((~inverse)&i_7 [15]) ? (~i_7 +1) : i_7 ;//{1'b0,i_7 [14:0]};
assign  iabs_8  =((~inverse)&i_8 [15]) ? (~i_8 +1) : i_8 ;//{1'b0,i_8 [14:0]};
assign  iabs_9  =((~inverse)&i_9 [15]) ? (~i_9 +1) : i_9 ;//{1'b0,i_9 [14:0]};
assign  iabs_10 =((~inverse)&i_10[15]) ? (~i_10+1) : i_10;//{1'b0,i_10[14:0]};
assign  iabs_11 =((~inverse)&i_11[15]) ? (~i_11+1) : i_11;//{1'b0,i_11[14:0]};
assign  iabs_12 =((~inverse)&i_12[15]) ? (~i_12+1) : i_12;//{1'b0,i_12[14:0]};
assign  iabs_13 =((~inverse)&i_13[15]) ? (~i_13+1) : i_13;//{1'b0,i_13[14:0]};
assign  iabs_14 =((~inverse)&i_14[15]) ? (~i_14+1) : i_14;//{1'b0,i_14[14:0]};
assign  iabs_15 =((~inverse)&i_15[15]) ? (~i_15+1) : i_15;//{1'b0,i_15[14:0]};
assign  iabs_16 =((~inverse)&i_16[15]) ? (~i_16+1) : i_16;//{1'b0,i_16[14:0]};
assign  iabs_17 =((~inverse)&i_17[15]) ? (~i_17+1) : i_17;//{1'b0,i_17[14:0]};
assign  iabs_18 =((~inverse)&i_18[15]) ? (~i_18+1) : i_18;//{1'b0,i_18[14:0]};
assign  iabs_19 =((~inverse)&i_19[15]) ? (~i_19+1) : i_19;//{1'b0,i_19[14:0]};
assign  iabs_20 =((~inverse)&i_20[15]) ? (~i_20+1) : i_20;//{1'b0,i_20[14:0]};
assign  iabs_21 =((~inverse)&i_21[15]) ? (~i_21+1) : i_21;//{1'b0,i_21[14:0]};
assign  iabs_22 =((~inverse)&i_22[15]) ? (~i_22+1) : i_22;//{1'b0,i_22[14:0]};
assign  iabs_23 =((~inverse)&i_23[15]) ? (~i_23+1) : i_23;//{1'b0,i_23[14:0]};
assign  iabs_24 =((~inverse)&i_24[15]) ? (~i_24+1) : i_24;//{1'b0,i_24[14:0]};
assign  iabs_25 =((~inverse)&i_25[15]) ? (~i_25+1) : i_25;//{1'b0,i_25[14:0]};
assign  iabs_26 =((~inverse)&i_26[15]) ? (~i_26+1) : i_26;//{1'b0,i_26[14:0]};
assign  iabs_27 =((~inverse)&i_27[15]) ? (~i_27+1) : i_27;//{1'b0,i_27[14:0]};
assign  iabs_28 =((~inverse)&i_28[15]) ? (~i_28+1) : i_28;//{1'b0,i_28[14:0]};
assign  iabs_29 =((~inverse)&i_29[15]) ? (~i_29+1) : i_29;//{1'b0,i_29[14:0]};
assign  iabs_30 =((~inverse)&i_30[15]) ? (~i_30+1) : i_30;//{1'b0,i_30[14:0]};
assign  iabs_31 =((~inverse)&i_31[15]) ? (~i_31+1) : i_31;//{1'b0,i_31[14:0]};

assign  w_m_0 =iabs_0 *Q;
assign  w_m_1 =iabs_1 *Q;
assign  w_m_2 =iabs_2 *Q;
assign  w_m_3 =iabs_3 *Q;
assign  w_m_4 =iabs_4 *Q;
assign  w_m_5 =iabs_5 *Q;
assign  w_m_6 =iabs_6 *Q;
assign  w_m_7 =iabs_7 *Q;
assign  w_m_8 =iabs_8 *Q;
assign  w_m_9 =iabs_9 *Q;
assign  w_m_10=iabs_10*Q;
assign  w_m_11=iabs_11*Q;
assign  w_m_12=iabs_12*Q;
assign  w_m_13=iabs_13*Q;
assign  w_m_14=iabs_14*Q;
assign  w_m_15=iabs_15*Q;
assign  w_m_16=iabs_16*Q;
assign  w_m_17=iabs_17*Q;
assign  w_m_18=iabs_18*Q;
assign  w_m_19=iabs_19*Q;
assign  w_m_20=iabs_20*Q;
assign  w_m_21=iabs_21*Q;
assign  w_m_22=iabs_22*Q;
assign  w_m_23=iabs_23*Q;
assign  w_m_24=iabs_24*Q;
assign  w_m_25=iabs_25*Q;
assign  w_m_26=iabs_26*Q;
assign  w_m_27=iabs_27*Q;
assign  w_m_28=iabs_28*Q;
assign  w_m_29=iabs_29*Q;
assign  w_m_30=iabs_30*Q;
assign  w_m_31=iabs_31*Q;

assign  w_a_0 =m_0 +offset;
assign  w_a_1 =m_1 +offset;
assign  w_a_2 =m_2 +offset;
assign  w_a_3 =m_3 +offset;
assign  w_a_4 =m_4 +offset;
assign  w_a_5 =m_5 +offset;
assign  w_a_6 =m_6 +offset;
assign  w_a_7 =m_7 +offset;
assign  w_a_8 =m_8 +offset;
assign  w_a_9 =m_9 +offset;
assign  w_a_10=m_10+offset;
assign  w_a_11=m_11+offset;
assign  w_a_12=m_12+offset;
assign  w_a_13=m_13+offset;
assign  w_a_14=m_14+offset;
assign  w_a_15=m_15+offset;
assign  w_a_16=m_16+offset;
assign  w_a_17=m_17+offset;
assign  w_a_18=m_18+offset;
assign  w_a_19=m_19+offset;
assign  w_a_20=m_20+offset;
assign  w_a_21=m_21+offset;
assign  w_a_22=m_22+offset;
assign  w_a_23=m_23+offset;
assign  w_a_24=m_24+offset;
assign  w_a_25=m_25+offset;
assign  w_a_26=m_26+offset;
assign  w_a_27=m_27+offset;
assign  w_a_28=m_28+offset;
assign  w_a_29=m_29+offset;
assign  w_a_30=m_30+offset;
assign  w_a_31=m_31+offset;

assign  w_s_0 =w_a_0 >>>shift;
assign  w_s_1 =w_a_1 >>>shift;
assign  w_s_2 =w_a_2 >>>shift;
assign  w_s_3 =w_a_3 >>>shift;
assign  w_s_4 =w_a_4 >>>shift;
assign  w_s_5 =w_a_5 >>>shift;
assign  w_s_6 =w_a_6 >>>shift;
assign  w_s_7 =w_a_7 >>>shift;
assign  w_s_8 =w_a_8 >>>shift;
assign  w_s_9 =w_a_9 >>>shift;
assign  w_s_10=w_a_10>>>shift;
assign  w_s_11=w_a_11>>>shift;
assign  w_s_12=w_a_12>>>shift;
assign  w_s_13=w_a_13>>>shift;
assign  w_s_14=w_a_14>>>shift;
assign  w_s_15=w_a_15>>>shift;
assign  w_s_16=w_a_16>>>shift;
assign  w_s_17=w_a_17>>>shift;
assign  w_s_18=w_a_18>>>shift;
assign  w_s_19=w_a_19>>>shift;
assign  w_s_20=w_a_20>>>shift;
assign  w_s_21=w_a_21>>>shift;
assign  w_s_22=w_a_22>>>shift;
assign  w_s_23=w_a_23>>>shift;
assign  w_s_24=w_a_24>>>shift;
assign  w_s_25=w_a_25>>>shift;
assign  w_s_26=w_a_26>>>shift;
assign  w_s_27=w_a_27>>>shift;
assign  w_s_28=w_a_28>>>shift;
assign  w_s_29=w_a_29>>>shift;
assign  w_s_30=w_a_30>>>shift;
assign  w_s_31=w_a_31>>>shift;

assign  w_s_s0 =((~inverse)&i_signed_0 ) ? (~w_s_0 +1) : w_s_0 ;//{i_0 [15],w_s_0 [14:0]};
assign  w_s_s1 =((~inverse)&i_signed_1 ) ? (~w_s_1 +1) : w_s_1 ;//{i_1 [15],w_s_1 [14:0]};
assign  w_s_s2 =((~inverse)&i_signed_2 ) ? (~w_s_2 +1) : w_s_2 ;//{i_2 [15],w_s_2 [14:0]};
assign  w_s_s3 =((~inverse)&i_signed_3 ) ? (~w_s_3 +1) : w_s_3 ;//{i_3 [15],w_s_3 [14:0]};
assign  w_s_s4 =((~inverse)&i_signed_4 ) ? (~w_s_4 +1) : w_s_4 ;//{i_4 [15],w_s_4 [14:0]};
assign  w_s_s5 =((~inverse)&i_signed_5 ) ? (~w_s_5 +1) : w_s_5 ;//{i_5 [15],w_s_5 [14:0]};
assign  w_s_s6 =((~inverse)&i_signed_6 ) ? (~w_s_6 +1) : w_s_6 ;//{i_6 [15],w_s_6 [14:0]};
assign  w_s_s7 =((~inverse)&i_signed_7 ) ? (~w_s_7 +1) : w_s_7 ;//{i_7 [15],w_s_7 [14:0]};
assign  w_s_s8 =((~inverse)&i_signed_8 ) ? (~w_s_8 +1) : w_s_8 ;//{i_8 [15],w_s_8 [14:0]};
assign  w_s_s9 =((~inverse)&i_signed_9 ) ? (~w_s_9 +1) : w_s_9 ;//{i_9 [15],w_s_9 [14:0]};
assign  w_s_s10=((~inverse)&i_signed_10) ? (~w_s_10+1) : w_s_10;//{i_10[15],w_s_10[14:0]};
assign  w_s_s11=((~inverse)&i_signed_11) ? (~w_s_11+1) : w_s_11;//{i_11[15],w_s_11[14:0]};
assign  w_s_s12=((~inverse)&i_signed_12) ? (~w_s_12+1) : w_s_12;//{i_12[15],w_s_12[14:0]};
assign  w_s_s13=((~inverse)&i_signed_13) ? (~w_s_13+1) : w_s_13;//{i_13[15],w_s_13[14:0]};
assign  w_s_s14=((~inverse)&i_signed_14) ? (~w_s_14+1) : w_s_14;//{i_14[15],w_s_14[14:0]};
assign  w_s_s15=((~inverse)&i_signed_15) ? (~w_s_15+1) : w_s_15;//{i_15[15],w_s_15[14:0]};
assign  w_s_s16=((~inverse)&i_signed_16) ? (~w_s_16+1) : w_s_16;//{i_16[15],w_s_16[14:0]};
assign  w_s_s17=((~inverse)&i_signed_17) ? (~w_s_17+1) : w_s_17;//{i_17[15],w_s_17[14:0]};
assign  w_s_s18=((~inverse)&i_signed_18) ? (~w_s_18+1) : w_s_18;//{i_18[15],w_s_18[14:0]};
assign  w_s_s19=((~inverse)&i_signed_19) ? (~w_s_19+1) : w_s_19;//{i_19[15],w_s_19[14:0]};
assign  w_s_s20=((~inverse)&i_signed_20) ? (~w_s_20+1) : w_s_20;//{i_20[15],w_s_20[14:0]};
assign  w_s_s21=((~inverse)&i_signed_21) ? (~w_s_21+1) : w_s_21;//{i_21[15],w_s_21[14:0]};
assign  w_s_s22=((~inverse)&i_signed_22) ? (~w_s_22+1) : w_s_22;//{i_22[15],w_s_22[14:0]};
assign  w_s_s23=((~inverse)&i_signed_23) ? (~w_s_23+1) : w_s_23;//{i_23[15],w_s_23[14:0]};
assign  w_s_s24=((~inverse)&i_signed_24) ? (~w_s_24+1) : w_s_24;//{i_24[15],w_s_24[14:0]};
assign  w_s_s25=((~inverse)&i_signed_25) ? (~w_s_25+1) : w_s_25;//{i_25[15],w_s_25[14:0]};
assign  w_s_s26=((~inverse)&i_signed_26) ? (~w_s_26+1) : w_s_26;//{i_26[15],w_s_26[14:0]};
assign  w_s_s27=((~inverse)&i_signed_27) ? (~w_s_27+1) : w_s_27;//{i_27[15],w_s_27[14:0]};
assign  w_s_s28=((~inverse)&i_signed_28) ? (~w_s_28+1) : w_s_28;//{i_28[15],w_s_28[14:0]};
assign  w_s_s29=((~inverse)&i_signed_29) ? (~w_s_29+1) : w_s_29;//{i_29[15],w_s_29[14:0]};
assign  w_s_s30=((~inverse)&i_signed_30) ? (~w_s_30+1) : w_s_30;//{i_30[15],w_s_30[14:0]};
assign  w_s_s31=((~inverse)&i_signed_31) ? (~w_s_31+1) : w_s_31;//{i_31[15],w_s_31[14:0]};

assign  w_cp1_0 =(w_s_0 >min)?w_s_0 :min;
assign  w_cp1_1 =(w_s_1 >min)?w_s_1 :min;
assign  w_cp1_2 =(w_s_2 >min)?w_s_2 :min;
assign  w_cp1_3 =(w_s_3 >min)?w_s_3 :min;
assign  w_cp1_4 =(w_s_4 >min)?w_s_4 :min;
assign  w_cp1_5 =(w_s_5 >min)?w_s_5 :min;
assign  w_cp1_6 =(w_s_6 >min)?w_s_6 :min;
assign  w_cp1_7 =(w_s_7 >min)?w_s_7 :min;
assign  w_cp1_8 =(w_s_8 >min)?w_s_8 :min;
assign  w_cp1_9 =(w_s_9 >min)?w_s_9 :min;
assign  w_cp1_10=(w_s_10>min)?w_s_10:min;
assign  w_cp1_11=(w_s_11>min)?w_s_11:min;
assign  w_cp1_12=(w_s_12>min)?w_s_12:min;
assign  w_cp1_13=(w_s_13>min)?w_s_13:min;
assign  w_cp1_14=(w_s_14>min)?w_s_14:min;
assign  w_cp1_15=(w_s_15>min)?w_s_15:min;
assign  w_cp1_16=(w_s_16>min)?w_s_16:min;
assign  w_cp1_17=(w_s_17>min)?w_s_17:min;
assign  w_cp1_18=(w_s_18>min)?w_s_18:min;
assign  w_cp1_19=(w_s_19>min)?w_s_19:min;
assign  w_cp1_20=(w_s_20>min)?w_s_20:min;
assign  w_cp1_21=(w_s_21>min)?w_s_21:min;
assign  w_cp1_22=(w_s_22>min)?w_s_22:min;
assign  w_cp1_23=(w_s_23>min)?w_s_23:min;
assign  w_cp1_24=(w_s_24>min)?w_s_24:min;
assign  w_cp1_25=(w_s_25>min)?w_s_25:min;
assign  w_cp1_26=(w_s_26>min)?w_s_26:min;
assign  w_cp1_27=(w_s_27>min)?w_s_27:min;
assign  w_cp1_28=(w_s_28>min)?w_s_28:min;
assign  w_cp1_29=(w_s_29>min)?w_s_29:min;
assign  w_cp1_30=(w_s_30>min)?w_s_30:min;
assign  w_cp1_31=(w_s_31>min)?w_s_31:min;

assign  w_cp2_0 =(w_cp1_0 <max)?w_cp1_0 :max;
assign  w_cp2_1 =(w_cp1_1 <max)?w_cp1_1 :max;
assign  w_cp2_2 =(w_cp1_2 <max)?w_cp1_2 :max;
assign  w_cp2_3 =(w_cp1_3 <max)?w_cp1_3 :max;
assign  w_cp2_4 =(w_cp1_4 <max)?w_cp1_4 :max;
assign  w_cp2_5 =(w_cp1_5 <max)?w_cp1_5 :max;
assign  w_cp2_6 =(w_cp1_6 <max)?w_cp1_6 :max;
assign  w_cp2_7 =(w_cp1_7 <max)?w_cp1_7 :max;
assign  w_cp2_8 =(w_cp1_8 <max)?w_cp1_8 :max;
assign  w_cp2_9 =(w_cp1_9 <max)?w_cp1_9 :max;
assign  w_cp2_10=(w_cp1_10<max)?w_cp1_10:max;
assign  w_cp2_11=(w_cp1_11<max)?w_cp1_11:max;
assign  w_cp2_12=(w_cp1_12<max)?w_cp1_12:max;
assign  w_cp2_13=(w_cp1_13<max)?w_cp1_13:max;
assign  w_cp2_14=(w_cp1_14<max)?w_cp1_14:max;
assign  w_cp2_15=(w_cp1_15<max)?w_cp1_15:max;
assign  w_cp2_16=(w_cp1_16<max)?w_cp1_16:max;
assign  w_cp2_17=(w_cp1_17<max)?w_cp1_17:max;
assign  w_cp2_18=(w_cp1_18<max)?w_cp1_18:max;
assign  w_cp2_19=(w_cp1_19<max)?w_cp1_19:max;
assign  w_cp2_20=(w_cp1_20<max)?w_cp1_20:max;
assign  w_cp2_21=(w_cp1_21<max)?w_cp1_21:max;
assign  w_cp2_22=(w_cp1_22<max)?w_cp1_22:max;
assign  w_cp2_23=(w_cp1_23<max)?w_cp1_23:max;
assign  w_cp2_24=(w_cp1_24<max)?w_cp1_24:max;
assign  w_cp2_25=(w_cp1_25<max)?w_cp1_25:max;
assign  w_cp2_26=(w_cp1_26<max)?w_cp1_26:max;
assign  w_cp2_27=(w_cp1_27<max)?w_cp1_27:max;
assign  w_cp2_28=(w_cp1_28<max)?w_cp1_28:max;
assign  w_cp2_29=(w_cp1_29<max)?w_cp1_29:max;
assign  w_cp2_30=(w_cp1_30<max)?w_cp1_30:max;
assign  w_cp2_31=(w_cp1_31<max)?w_cp1_31:max;

assign  w_out_0 =inverse?w_cp2_0 :w_s_s0 ;
assign  w_out_1 =inverse?w_cp2_1 :w_s_s1 ;
assign  w_out_2 =inverse?w_cp2_2 :w_s_s2 ;
assign  w_out_3 =inverse?w_cp2_3 :w_s_s3 ;
assign  w_out_4 =inverse?w_cp2_4 :w_s_s4 ;
assign  w_out_5 =inverse?w_cp2_5 :w_s_s5 ;
assign  w_out_6 =inverse?w_cp2_6 :w_s_s6 ;
assign  w_out_7 =inverse?w_cp2_7 :w_s_s7 ;
assign  w_out_8 =inverse?w_cp2_8 :w_s_s8 ;
assign  w_out_9 =inverse?w_cp2_9 :w_s_s9 ;
assign  w_out_10=inverse?w_cp2_10:w_s_s10;
assign  w_out_11=inverse?w_cp2_11:w_s_s11;
assign  w_out_12=inverse?w_cp2_12:w_s_s12;
assign  w_out_13=inverse?w_cp2_13:w_s_s13;
assign  w_out_14=inverse?w_cp2_14:w_s_s14;
assign  w_out_15=inverse?w_cp2_15:w_s_s15;
assign  w_out_16=inverse?w_cp2_16:w_s_s16;
assign  w_out_17=inverse?w_cp2_17:w_s_s17;
assign  w_out_18=inverse?w_cp2_18:w_s_s18;
assign  w_out_19=inverse?w_cp2_19:w_s_s19;
assign  w_out_20=inverse?w_cp2_20:w_s_s20;
assign  w_out_21=inverse?w_cp2_21:w_s_s21;
assign  w_out_22=inverse?w_cp2_22:w_s_s22;
assign  w_out_23=inverse?w_cp2_23:w_s_s23;
assign  w_out_24=inverse?w_cp2_24:w_s_s24;
assign  w_out_25=inverse?w_cp2_25:w_s_s25;
assign  w_out_26=inverse?w_cp2_26:w_s_s26;
assign  w_out_27=inverse?w_cp2_27:w_s_s27;
assign  w_out_28=inverse?w_cp2_28:w_s_s28;
assign  w_out_29=inverse?w_cp2_29:w_s_s29;
assign  w_out_30=inverse?w_cp2_30:w_s_s30;
assign  w_out_31=inverse?w_cp2_31:w_s_s31;

// ********************************************
//                                             
//   Sequential  Logic                        
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
      else if(counter==6'd11)
        begin
         counter_en<=1'b0;
       end
     end
   2'b01:begin
      if(i_valid&&(counter_val==5'd1))
        counter_en<=1'b1;
    else if(counter==6'd16)
      begin
       counter_en<=1'b0;

      end
     end
   2'b10:begin
      if(i_valid&&(counter_val==5'd7))
        counter_en<=1'b1;
      else if(counter==6'd22)
       begin
       counter_en<=1'b0;

      end
     end 
   2'b11:begin
      if(i_valid&&(counter_val==5'd31))
        counter_en<=1'b1;
      else if(counter==6'd46)
       begin
       counter_en<=1'b0;

      end
     end 
   endcase
   
   always@(posedge clk or negedge rst)
    if(!rst)
      counter<=6'd0;
    else if(((i_transize=='d0)&&(counter==6'd11))||
			((i_transize=='d1)&&(counter==6'd16))||
			((i_transize=='d2)&&(counter==6'd22))||
			((i_transize=='d3)&&(counter==6'd46)))
		counter <= 6'd0;
     else if(counter_en)
       counter<=counter+1'b1;
     else
       counter<=6'd0;

  always @(posedge clk or negedge rst) begin
  	if(!rst) begin
		  i_signed_0 <='d0;
			i_signed_1 <='d0;
			i_signed_2 <='d0;
			i_signed_3 <='d0;
			i_signed_4 <='d0;
			i_signed_5 <='d0;
			i_signed_6 <='d0;
			i_signed_7 <='d0;
			i_signed_8 <='d0;
			i_signed_9 <='d0;
			i_signed_10<='d0;
			i_signed_11<='d0;
			i_signed_12<='d0;
			i_signed_13<='d0;
			i_signed_14<='d0;
			i_signed_15<='d0;
			i_signed_16<='d0;
			i_signed_17<='d0;
			i_signed_18<='d0;
			i_signed_19<='d0;
			i_signed_20<='d0;
			i_signed_21<='d0;
			i_signed_22<='d0;
			i_signed_23<='d0;
			i_signed_24<='d0;
			i_signed_25<='d0;
			i_signed_26<='d0;
			i_signed_27<='d0;
			i_signed_28<='d0;
			i_signed_29<='d0;
			i_signed_30<='d0;
			i_signed_31<='d0;
  	end
  	else begin
		  i_signed_0 <=i_0 [15];
			i_signed_1 <=i_1 [15];
			i_signed_2 <=i_2 [15];
			i_signed_3 <=i_3 [15];
			i_signed_4 <=i_4 [15];
			i_signed_5 <=i_5 [15];
			i_signed_6 <=i_6 [15];
			i_signed_7 <=i_7 [15];
			i_signed_8 <=i_8 [15];
			i_signed_9 <=i_9 [15];
			i_signed_10<=i_10[15];
			i_signed_11<=i_11[15];
			i_signed_12<=i_12[15];
			i_signed_13<=i_13[15];
			i_signed_14<=i_14[15];
			i_signed_15<=i_15[15];
			i_signed_16<=i_16[15];
			i_signed_17<=i_17[15];
			i_signed_18<=i_18[15];
			i_signed_19<=i_19[15];
			i_signed_20<=i_20[15];
			i_signed_21<=i_21[15];
			i_signed_22<=i_22[15];
			i_signed_23<=i_23[15];
			i_signed_24<=i_24[15];
			i_signed_25<=i_25[15];
			i_signed_26<=i_26[15];
			i_signed_27<=i_27[15];
			i_signed_28<=i_28[15];
			i_signed_29<=i_29[15];
			i_signed_30<=i_30[15];
			i_signed_31<=i_31[15];
  	end
  end
   
 always@(posedge clk or negedge rst)
  if(!rst)
     begin
     i_2d_valid_1<=1'b0;
     m_0 <=31'b0;
     m_1 <=31'b0;
     m_2 <=31'b0;
     m_3 <=31'b0;
     m_4 <=31'b0;
     m_5 <=31'b0;
     m_6 <=31'b0;
     m_7 <=31'b0;
     m_8 <=31'b0;
     m_9 <=31'b0;
     m_10<=31'b0;
     m_11<=31'b0;
     m_12<=31'b0;
     m_13<=31'b0;
     m_14<=31'b0;
     m_15<=31'b0;
     m_16<=31'b0;
     m_17<=31'b0;
     m_18<=31'b0;
     m_19<=31'b0;
     m_20<=31'b0;
     m_21<=31'b0;
     m_22<=31'b0;
     m_23<=31'b0;
     m_24<=31'b0;
     m_25<=31'b0;
     m_26<=31'b0;
     m_27<=31'b0;
     m_28<=31'b0;
     m_29<=31'b0;
     m_30<=31'b0;
     m_31<=31'b0;
     end
  else
 if(i_2d_valid)
   begin
    i_2d_valid_1<=1'b1;
    m_0 <=w_m_0 ;
    m_1 <=w_m_1 ;
    m_2 <=w_m_2 ;
    m_3 <=w_m_3 ;
    m_4 <=w_m_4 ;
    m_5 <=w_m_5 ;
    m_6 <=w_m_6 ;
    m_7 <=w_m_7 ;
    m_8 <=w_m_8 ;
    m_9 <=w_m_9 ;
    m_10<=w_m_10;
    m_11<=w_m_11;
    m_12<=w_m_12;
    m_13<=w_m_13;
    m_14<=w_m_14;
    m_15<=w_m_15;
    m_16<=w_m_16;
    m_17<=w_m_17;
    m_18<=w_m_18;
    m_19<=w_m_19;
    m_20<=w_m_20;
    m_21<=w_m_21;
    m_22<=w_m_22;
    m_23<=w_m_23;
    m_24<=w_m_24;
    m_25<=w_m_25;
    m_26<=w_m_26;
    m_27<=w_m_27;
    m_28<=w_m_28;
    m_29<=w_m_29;
    m_30<=w_m_30;
    m_31<=w_m_31;
   end
else
   begin
     i_2d_valid_1<=1'b0;
     m_0 <=31'b0;
     m_1 <=31'b0;
     m_2 <=31'b0;
     m_3 <=31'b0;
     m_4 <=31'b0;
     m_5 <=31'b0;
     m_6 <=31'b0;
     m_7 <=31'b0;
     m_8 <=31'b0;
     m_9 <=31'b0;
     m_10<=31'b0;
     m_11<=31'b0;
     m_12<=31'b0;
     m_13<=31'b0;
     m_14<=31'b0;
     m_15<=31'b0;
     m_16<=31'b0;
     m_17<=31'b0;
     m_18<=31'b0;
     m_19<=31'b0;
     m_20<=31'b0;
     m_21<=31'b0;
     m_22<=31'b0;
     m_23<=31'b0;
     m_24<=31'b0;
     m_25<=31'b0;
     m_26<=31'b0;
     m_27<=31'b0;
     m_28<=31'b0;
     m_29<=31'b0;
     m_30<=31'b0;
     m_31<=31'b0;
     end
 
 
always@(posedge clk or negedge rst)
  if(!rst)
     begin
     o_valid<=1'b0;
     o_0 <=16'b0;
     o_1 <=16'b0;
     o_2 <=16'b0;
     o_3 <=16'b0;
     o_4 <=16'b0;
     o_5 <=16'b0;
     o_6 <=16'b0;
     o_7 <=16'b0;
     o_8 <=16'b0;
     o_9 <=16'b0;
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
 if(i_2d_valid_1)
   begin
    o_valid<=1'b1;
     o_0 <=w_out_0 ;
     o_1 <=w_out_1 ;
     o_2 <=w_out_2 ;
     o_3 <=w_out_3 ;
     o_4 <=w_out_4 ;
     o_5 <=w_out_5 ;
     o_6 <=w_out_6 ;
     o_7 <=w_out_7 ;
     o_8 <=w_out_8 ;
     o_9 <=w_out_9 ;
     o_10<=w_out_10;
     o_11<=w_out_11;
     o_12<=w_out_12;
     o_13<=w_out_13;
     o_14<=w_out_14;
     o_15<=w_out_15;
     o_16<=w_out_16;
     o_17<=w_out_17;
     o_18<=w_out_18;
     o_19<=w_out_19;
     o_20<=w_out_20;
     o_21<=w_out_21;
     o_22<=w_out_22;
     o_23<=w_out_23;
     o_24<=w_out_24;
     o_25<=w_out_25;
     o_26<=w_out_26;
     o_27<=w_out_27;
     o_28<=w_out_28;
     o_29<=w_out_29;
     o_30<=w_out_30;
     o_31<=w_out_31;
   end
else
   begin
     o_valid<=1'b0;
     o_0 <=16'b0;
     o_1 <=16'b0;
     o_2 <=16'b0;
     o_3 <=16'b0;
     o_4 <=16'b0;
     o_5 <=16'b0;
     o_6 <=16'b0;
     o_7 <=16'b0;
     o_8 <=16'b0;
     o_9 <=16'b0;
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
     
//*********************************************
//
//   SUB  MODULE
//
//**********************************************

mod   mod_0(
            .clk(clk),
            .rst(rst),
            .type(type),
            . qp(qp),
        .i_valid(i_valid),
        .inverse(inverse),
     .i_transize(i_transize),
                
              .Q(Q),
        . offset(offset),
	     . shift(shift)
  );
           
endmodule 
