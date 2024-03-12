module spiral_16(
          i_data,
          
        o_data_4,
        o_data_13,
        o_data_22,
        o_data_31,
        o_data_38,
        o_data_46,
        o_data_54,
        o_data_61,
        o_data_67,
        o_data_73,
        o_data_78,
        o_data_82,
        o_data_85,
        o_data_88,
        o_data_90
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************             
input  signed [16:0]   i_data;
output signed [16+7:0] o_data_4;
output signed [16+7:0] o_data_13;
output signed [16+7:0] o_data_22;
output signed [16+7:0] o_data_31;
output signed [16+7:0] o_data_38;
output signed [16+7:0] o_data_46;
output signed [16+7:0] o_data_54;
output signed [16+7:0] o_data_61;
output signed [16+7:0] o_data_67;
output signed [16+7:0] o_data_73;
output signed [16+7:0] o_data_78;
output signed [16+7:0] o_data_82;
output signed [16+7:0] o_data_85;
output signed [16+7:0] o_data_88;
output signed [16+7:0] o_data_90;
// ********************************************
//                                             
//    WIRE DECLARATION                                               
//                                                                             
// ********************************************
wire signed [23:0]	w1,
					w32,
					w31,
					w8,
					w23,
					w4,
					w27,
					w39,
					w62,
					w61,
					w9,
					w2,
					w11,
					w13,
					w18,
					w19,
					w41,
					w36,
					w45,
					w67,
					w64,
					w73,
					w16,
					w17,
					w68,
					w85,
					w22,
					w38,
					w46,
					w54,
					w78,
					w82,
					w88,
					w90;
// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************
assign w1 = i_data;
assign w32 = w1 << 5;
assign w31 = w32 - w1;
assign w8 = w1 << 3;
assign w23 = w31 - w8;
assign w4 = w1 << 2;
assign w27 = w31 - w4;
assign w39 = w31 + w8;
assign w62 = w31 << 1;
assign w61 = w62 - w1;
assign w9 = w1 + w8;
assign w2 = w1 << 1;
assign w11 = w9 + w2;
assign w13 = w9 + w4;
assign w18 = w9 << 1;
assign w19 = w1 + w18;
assign w41 = w9 + w32;
assign w36 = w9 << 2;
assign w45 = w9 + w36;
assign w67 = w31 + w36;
assign w64 = w1 << 6;
assign w73 = w9 + w64;
assign w16 = w1 << 4;
assign w17 = w1 + w16;
assign w68 = w17 << 2;
assign w85 = w17 + w68;
assign w22 = w11 << 1;
assign w38 = w19 << 1;
assign w46 = w23 << 1;
assign w54 = w27 << 1;
assign w78 = w39 << 1;
assign w82 = w41 << 1;
assign w88 = w11 << 3;
assign w90 = w45 << 1;    

assign  o_data_4= w4;
assign  o_data_13=w13;
assign  o_data_22=w22;
assign  o_data_31=w31;
assign  o_data_38=w38;
assign  o_data_46=w46;
assign  o_data_54=w54;
assign  o_data_61=w61;
assign  o_data_67=w67;
assign  o_data_73=w73;
assign  o_data_78=w78;
assign  o_data_82=w82;
assign  o_data_85=w85;
assign  o_data_88=w88;
assign  o_data_90=w90;

endmodule
