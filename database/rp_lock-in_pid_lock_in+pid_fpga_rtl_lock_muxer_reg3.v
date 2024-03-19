module muxer_reg3 #(
   parameter     RES = 14 
)
(
   // input
   input                 clk,rst,
   input      [  3-1: 0] sel,             // Select wire 0-7
   input      [RES-1: 0] in0,
   input      [RES-1: 0] in1,
   input      [RES-1: 0] in2,
   input      [RES-1: 0] in3,
   input      [RES-1: 0] in4,
   input      [RES-1: 0] in5,
   input      [RES-1: 0] in6,
   input      [RES-1: 0] in7,

   // output
   output reg [RES-1: 0] out                // output data
);


// switch
always @(posedge clk)
   if (rst)
      out      <=  3'b0; 
   else
      case (sel)
         3'd00   :  out  <= in0  ;
         3'd01   :  out  <= in1  ;
         3'd02   :  out  <= in2  ;
         3'd03   :  out  <= in3  ;
         3'd04   :  out  <= in4  ;
         3'd05   :  out  <= in5  ;
         3'd06   :  out  <= in6  ;
         3'd07   :  out  <= in7  ;
         default :  out  <= 3'b0 ; 
      endcase ;
   
 


endmodule

/*
muxer_reg3  #( .RES ( 14 ) ) i_muxer_reg3_NOMBRE (
    // input
   .clk(clk),.rst(rst),    .sel (  sel  ), // select cable
    .in0  ( 14'b0 ), // in0 
    .in1  ( 14'b0 ), // in1 
    .in2  ( 14'b0 ), // in2 
    .in3  ( 14'b0 ), // in3 
    .in4  ( 14'b0 ), // in4 
    .in5  ( 14'b0 ), // in5 
    .in6  ( 14'b0 ), // in6 
    .in7  ( 14'b0 ), // in7 
    // output
    .out ( out   )
);
*/
