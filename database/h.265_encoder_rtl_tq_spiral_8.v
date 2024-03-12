module spiral_8(
          i_data,
          
        o_data_9,
        o_data_25,
        o_data_43,
        o_data_57,
        o_data_70,
        o_data_80,
        o_data_87,
        o_data_90
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************             
input  signed [17:0]   i_data;
output signed [17+7:0] o_data_9;
output signed [17+7:0] o_data_25;
output signed [17+7:0] o_data_43;
output signed [17+7:0] o_data_57;
output signed [17+7:0] o_data_70;
output signed [17+7:0] o_data_80;
output signed [17+7:0] o_data_87;
output signed [17+7:0] o_data_90;
// ********************************************
//                                             
//    WIRE DECLARATION                                               
//                                                                             
// ********************************************    
wire signed [24:0]  w1,
                    w4,
                    w5,
                    w8,
                    w9,
                    w16,
                    w25,
                    w36,
                    w35,
                    w40,
                    w45,
                    w3,
                    w43,
                    w48,
                    w57,
                    w96,
                    w87,
                    w70,
                    w80,
                    w90;

assign w1  = i_data;
assign w4  = w1 << 2;
assign w5  = w1 + w4;
assign w8  = w1 << 3;
assign w9  = w1 + w8;
assign w16 = w1 << 4;
assign w25 = w9 + w16;
assign w36 = w9 << 2;
assign w35 = w36 - w1;
assign w40 = w5 << 3;
assign w45 = w5 + w40;
assign w3  = w4 - w1;
assign w43 = w3 + w40;
assign w48 = w3 << 4;
assign w57 = w9 + w48;
assign w96 = w3 << 5;
assign w87 = w96 - w9;
assign w70 = w35 << 1;
assign w80 = w5 << 4;
assign w90 = w45 << 1;
// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign  o_data_9=w9;
assign  o_data_25=w25;
assign  o_data_43=w43;
assign  o_data_57=w57;
assign  o_data_70=w70;
assign  o_data_80=w80;
assign  o_data_87=w87;
assign  o_data_90=w90;

endmodule