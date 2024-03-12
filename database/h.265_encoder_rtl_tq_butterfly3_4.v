module butterfly3_4(
                      
                i_0,
                i_1,
                i_2,
                i_3,
                
                o_0,
                o_1,
                o_2,
                o_3
);

// ****************************************************************
//
//	INPUT / OUTPUT DECLARATION
//
// ****************************************************************                

input     signed  [27:0] i_0;
input     signed  [27:0] i_1;
input     signed  [27:0] i_2;
input     signed  [27:0] i_3;

output    signed  [27:0] o_0;
output    signed  [27:0] o_1;
output    signed  [27:0] o_2;
output    signed  [27:0] o_3;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign  o_0=i_0+i_3;
assign  o_1=i_1+i_2;
assign  o_2=i_1-i_2;               
assign  o_3=i_0-i_3;

endmodule