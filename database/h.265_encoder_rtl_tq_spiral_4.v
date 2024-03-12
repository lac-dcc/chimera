module spiral_4(
          i_data,
          
        o_data_18,
        o_data_50,
        o_data_75,
        o_data_89
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************             

input  signed [18:0]   i_data;
output signed [18+7:0] o_data_18;
output signed [18+7:0] o_data_50;
output signed [18+7:0] o_data_75;
output signed [18+7:0] o_data_89;
// ********************************************
//                                             
//    WIRE DECLARATION                                               
//                                                                             
// ******************************************** 
wire signed [25:0]
    w1,
    w8,
    w9,
    w16,
    w25,
    w4,
    w5,
    w80,
    w75,
    w89,
    w18,
    w50;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************
assign w1 = i_data;
assign w8 = w1 << 3;
assign w9 = w1 + w8;
assign w16 = w1 << 4;
assign w25 = w9 + w16;
assign w4 = w1 << 2;
assign w5 = w1 + w4;
assign w80 = w5 << 4;
assign w75 = w80 - w5;
assign w89 = w9 + w80;
assign w18 = w9 << 1;
assign w50 = w25 << 1;

assign  o_data_18=w18;
assign  o_data_50=w50;
assign  o_data_75=w75;
assign  o_data_89=w89;

endmodule