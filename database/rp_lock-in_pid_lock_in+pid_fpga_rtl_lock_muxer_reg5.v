//////////////////////////////////////////////////////////////////////////////////
//(* dont_touch = "true" *)
//(* black_box *)


//(* keep_hierarchy = "true" *) 
module muxer_reg5 #(
   parameter     RES = 14 
)
(
   // input
   input                 clk,rst,
   input      [  5-1: 0] sel,             // Select wire 0-31
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
   input      [RES-1: 0] in16,
   input      [RES-1: 0] in17,
   input      [RES-1: 0] in18,
   input      [RES-1: 0] in19,
   input      [RES-1: 0] in20,
   input      [RES-1: 0] in21,
   input      [RES-1: 0] in22,
   input      [RES-1: 0] in23,
   input      [RES-1: 0] in24,
   input      [RES-1: 0] in25,
   input      [RES-1: 0] in26,
   input      [RES-1: 0] in27,
   input      [RES-1: 0] in28,
   input      [RES-1: 0] in29,
   input      [RES-1: 0] in30,
   input      [RES-1: 0] in31,

   // output
   output reg [RES-1: 0] out                // output data
);


// switch
always @(posedge clk)
   if (rst)
      out      <=  5'b0; 
   else
      case (sel)
         5'd00   :  out  <= in0  ;
         5'd01   :  out  <= in1  ;
         5'd02   :  out  <= in2  ;
         5'd03   :  out  <= in3  ;
         5'd04   :  out  <= in4  ;
         5'd05   :  out  <= in5  ;
         5'd06   :  out  <= in6  ;
         5'd07   :  out  <= in7  ;
         5'd08   :  out  <= in8  ;
         5'd09   :  out  <= in9  ;
         5'd10   :  out  <= in10 ;
         5'd11   :  out  <= in11 ;
         5'd12   :  out  <= in12 ;
         5'd13   :  out  <= in13 ;
         5'd14   :  out  <= in14 ;
         5'd15   :  out  <= in15 ;
         5'd16   :  out  <= in16 ;
         5'd17   :  out  <= in17 ;
         5'd18   :  out  <= in18 ;
         5'd19   :  out  <= in19 ;
         5'd20   :  out  <= in20 ;
         5'd21   :  out  <= in21 ;
         5'd22   :  out  <= in22 ;
         5'd23   :  out  <= in23 ;
         5'd24   :  out  <= in24 ;
         5'd25   :  out  <= in25 ;
         5'd26   :  out  <= in26 ;
         5'd27   :  out  <= in27 ;
         5'd28   :  out  <= in28 ;
         5'd29   :  out  <= in29 ;
         5'd30   :  out  <= in30 ;
         5'd31   :  out  <= in31 ;
         default :  out  <= 5'b0 ; 
      endcase ;
   
 


endmodule

/*
muxer_reg5  #( .RES ( 14 ) ) i_muxer_reg5_NOMBRE (
    // input
    .sel (  sel  ), // select cable
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
    .in16 ( 14'b0 ), // in16
    .in17 ( 14'b0 ), // in17
    .in18 ( 14'b0 ), // in18
    .in19 ( 14'b0 ), // in19
    .in20 ( 14'b0 ), // in20
    .in21 ( 14'b0 ), // in21
    .in22 ( 14'b0 ), // in22
    .in23 ( 14'b0 ), // in23
    .in24 ( 14'b0 ), // in24
    .in25 ( 14'b0 ), // in25
    .in26 ( 14'b0 ), // in26
    .in27 ( 14'b0 ), // in27
    .in28 ( 14'b0 ), // in28
    .in29 ( 14'b0 ), // in29
    .in30 ( 14'b0 ), // in30
    .in31 ( 14'b0 ), // in31
    // output
    .out ( out   )
);
*/
