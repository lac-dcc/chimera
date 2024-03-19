//////////////////////////////////////////////////////////////////////////////////
//(* dont_touch = "true" *)
//(* black_box *)


//(* keep_hierarchy = "true" *) 
module muxer_reg4 #(
   parameter     RES = 14 
)
(
   // input
   input                 clk,rst,
   input      [  4-1: 0] sel,             // Select wire 0-15
   input      [RES-1: 0] in0,
   input      [RES-1: 0] in1,
   input      [RES-1: 0] in2,
   input      [RES-1: 0] in3,
   input      [RES-1: 0] in4,
   input      [RES-1: 0] in5,
   input      [RES-1: 0] in6,
   input      [RES-1: 0] in7,
   input      [RES-1: 0] in8,
   input      [RES-1: 0] in9,
   input      [RES-1: 0] in10,
   input      [RES-1: 0] in11,
   input      [RES-1: 0] in12,
   input      [RES-1: 0] in13,
   input      [RES-1: 0] in14,
   input      [RES-1: 0] in15,

   // output
   output reg [RES-1: 0] out                // output data
);


// switch
always @(posedge clk)
   if (rst)
      out      <=  4'b0; 
   else
      case (sel)
         4'd00   :  out  <= in0  ;
         4'd01   :  out  <= in1  ;
         4'd02   :  out  <= in2  ;
         4'd03   :  out  <= in3  ;
         4'd04   :  out  <= in4  ;
         4'd05   :  out  <= in5  ;
         4'd06   :  out  <= in6  ;
         4'd07   :  out  <= in7  ;
         4'd08   :  out  <= in8  ;
         4'd09   :  out  <= in9  ;
         4'd10   :  out  <= in10 ;
         4'd11   :  out  <= in11 ;
         4'd12   :  out  <= in12 ;
         4'd13   :  out  <= in13 ;
         4'd14   :  out  <= in14 ;
         4'd15   :  out  <= in15 ;
         default :  out  <= 4'b0 ; 
      endcase ;
   
 


endmodule

/*
muxer_reg4  #( .RES ( 14 ) ) i_muxer_reg4_NOMBRE (
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
    .in8  ( 14'b0 ), // in8 
    .in9  ( 14'b0 ), // in9 
    .in10 ( 14'b0 ), // in10
    .in11 ( 14'b0 ), // in11
    .in12 ( 14'b0 ), // in12
    .in13 ( 14'b0 ), // in13
    .in14 ( 14'b0 ), // in14
    .in15 ( 14'b0 ), // in15
    // output
    .out ( out   )
);
*/
