//////////////////////////////////////////////////////////////////////////////////
//(* dont_touch = "true" *)
//(* black_box *)


//(* keep_hierarchy = "true" *) 
module muxer4 #(
   parameter     RES = 14 
)
(
   // input
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
   output     [RES-1: 0] out                // output data
);


wire ensel0 ,ensel1 ,ensel2 ,ensel3 ,ensel4 ,ensel5 ,ensel6 ,ensel7 ,
     ensel8 ,ensel9 ,ensel10,ensel11,ensel12,ensel13,ensel14,ensel15;

     

assign ensel0  = (sel==4'd0 );
assign ensel1  = (sel==4'd1 );
assign ensel2  = (sel==4'd2 );
assign ensel3  = (sel==4'd3 );
assign ensel4  = (sel==4'd4 );
assign ensel5  = (sel==4'd5 );
assign ensel6  = (sel==4'd6 );
assign ensel7  = (sel==4'd7 );
assign ensel8  = (sel==4'd8 );
assign ensel9  = (sel==4'd9 );
assign ensel10 = (sel==4'd10);
assign ensel11 = (sel==4'd11);
assign ensel12 = (sel==4'd12);
assign ensel13 = (sel==4'd13);
assign ensel14 = (sel==4'd14);
assign ensel15 = (sel==4'd15);


wire [RES-1: 0] en0 ;
wire [RES-1: 0] en1 ;
wire [RES-1: 0] en2 ;
wire [RES-1: 0] en3 ;
wire [RES-1: 0] en4 ;
wire [RES-1: 0] en5 ;
wire [RES-1: 0] en6 ;
wire [RES-1: 0] en7 ;
wire [RES-1: 0] en8 ;
wire [RES-1: 0] en9 ;
wire [RES-1: 0] en10;
wire [RES-1: 0] en11;
wire [RES-1: 0] en12;
wire [RES-1: 0] en13;
wire [RES-1: 0] en14;
wire [RES-1: 0] en15;


assign en0  = {RES{ ensel0  }} & in0  ;
assign en1  = {RES{ ensel1  }} & in1  ;
assign en2  = {RES{ ensel2  }} & in2  ;
assign en3  = {RES{ ensel3  }} & in3  ;
assign en4  = {RES{ ensel4  }} & in4  ;
assign en5  = {RES{ ensel5  }} & in5  ;
assign en6  = {RES{ ensel6  }} & in6  ;
assign en7  = {RES{ ensel7  }} & in7  ;
assign en8  = {RES{ ensel8  }} & in8  ;
assign en9  = {RES{ ensel9  }} & in9  ;
assign en10 = {RES{ ensel10 }} & in10 ;
assign en11 = {RES{ ensel11 }} & in11 ;
assign en12 = {RES{ ensel12 }} & in12 ;
assign en13 = {RES{ ensel13 }} & in13 ;
assign en14 = {RES{ ensel14 }} & in14 ;
assign en15 = {RES{ ensel15 }} & in15 ;


assign  out = en0 |en1 |en2 |en3 |en4 |en5 |en6 |en7 |
              en8 |en9 |en10|en11|en12|en13|en14|en15;

              

endmodule

/*
muxer4  #( .RES ( 14 ) ) NOMBRE (
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
    // output
    .out ( out   )
);
*/
