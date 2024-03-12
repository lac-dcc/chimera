module butterfly_4(
                clk,
				        rst,
				        
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

input                    clk;
input                    rst;

input     signed  [23:0] i_0;
input     signed  [23:0] i_1;
input     signed  [23:0] i_2;
input     signed  [23:0] i_3;

output reg signed [24:0] o_0;
output reg signed [24:0] o_1;
output reg signed [24:0] o_2;
output reg signed [24:0] o_3;

// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************

wire  signed [24:0]   b_0;
wire  signed [24:0]   b_1;
wire  signed [24:0]   b_2;
wire  signed [24:0]   b_3;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign b_0=i_0+i_3;
assign b_1=i_1+i_2;
assign b_2=i_1-i_2;               
assign b_3=i_0-i_3;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always@(posedge clk or negedge rst)
if(!rst)
     begin
     o_0<=25'b0;
     o_1<=25'b0;
     o_2<=25'b0;
     o_3<=25'b0;
     end
else
     begin
     o_0<=b_0;
     o_1<=b_1;
     o_2<=b_2;
     o_3<=b_3;
     end

endmodule