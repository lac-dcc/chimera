module mux_32(
           add,
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
          
           o_i
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  

input   [4:0]                      add;
input  signed    [15:0]           i_0 ;
input  signed    [15:0]           i_1 ;
input  signed    [15:0]           i_2 ;
input  signed    [15:0]           i_3 ;
input  signed    [15:0]           i_4 ;
input  signed    [15:0]           i_5 ;
input  signed    [15:0]           i_6 ;
input  signed    [15:0]           i_7 ;
input  signed    [15:0]           i_8 ;
input  signed    [15:0]           i_9 ;
input  signed    [15:0]           i_10;
input  signed    [15:0]           i_11;
input  signed    [15:0]           i_12;
input  signed    [15:0]           i_13;
input  signed    [15:0]           i_14;
input  signed    [15:0]           i_15;
input  signed    [15:0]           i_16;
input  signed    [15:0]           i_17;
input  signed    [15:0]           i_18;
input  signed    [15:0]           i_19;
input  signed    [15:0]           i_20;
input  signed    [15:0]           i_21;
input  signed    [15:0]           i_22;
input  signed    [15:0]           i_23;
input  signed    [15:0]           i_24;
input  signed    [15:0]           i_25;
input  signed    [15:0]           i_26;
input  signed    [15:0]           i_27;
input  signed    [15:0]           i_28;
input  signed    [15:0]           i_29;
input  signed    [15:0]           i_30;
input  signed    [15:0]           i_31;

output reg signed  [15:0]         o_i;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

always@(*)
  case(add)
    5'd0 :o_i=i_0 ;
    5'd1 :o_i=i_1 ;
    5'd2 :o_i=i_2 ;
    5'd3 :o_i=i_3 ;
    5'd4 :o_i=i_4 ;
    5'd5 :o_i=i_5 ;
    5'd6 :o_i=i_6 ;
    5'd7 :o_i=i_7 ;
    5'd8 :o_i=i_8 ;
    5'd9 :o_i=i_9 ;
    5'd10:o_i=i_10;
    5'd11:o_i=i_11;
    5'd12:o_i=i_12;
    5'd13:o_i=i_13;
    5'd14:o_i=i_14;
    5'd15:o_i=i_15;
    5'd16:o_i=i_16;
    5'd17:o_i=i_17;
    5'd18:o_i=i_18;
    5'd19:o_i=i_19;
    5'd20:o_i=i_20;
    5'd21:o_i=i_21;
    5'd22:o_i=i_22;
    5'd23:o_i=i_23;
    5'd24:o_i=i_24;
    5'd25:o_i=i_25;
    5'd26:o_i=i_26;
    5'd27:o_i=i_27;
    5'd28:o_i=i_28;
    5'd29:o_i=i_29;
    5'd30:o_i=i_30;
    5'd31:o_i=i_31;
  endcase

endmodule