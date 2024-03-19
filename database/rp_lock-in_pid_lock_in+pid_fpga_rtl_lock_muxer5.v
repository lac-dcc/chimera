//////////////////////////////////////////////////////////////////////////////////
//(* dont_touch = "true" *)
//(* black_box *)


//(* keep_hierarchy = "true" *) 
module muxer5 #(
   parameter     RES = 14 
)
(
   // input
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
   output     [RES-1: 0] out                // output data
);


wire ensel0 ,ensel1 ,ensel2 ,ensel3 ,ensel4 ,ensel5 ,ensel6 ,ensel7 ,
     ensel8 ,ensel9 ,ensel10,ensel11,ensel12,ensel13,ensel14,ensel15,
     ensel16,ensel17,ensel18,ensel19,ensel20,ensel21,ensel22,ensel23,
     ensel24,ensel25,ensel26,ensel27,ensel28,ensel29,ensel30,ensel31;

     

assign ensel0  = (sel==5'd0 );
assign ensel1  = (sel==5'd1 );
assign ensel2  = (sel==5'd2 );
assign ensel3  = (sel==5'd3 );
assign ensel4  = (sel==5'd4 );
assign ensel5  = (sel==5'd5 );
assign ensel6  = (sel==5'd6 );
assign ensel7  = (sel==5'd7 );
assign ensel8  = (sel==5'd8 );
assign ensel9  = (sel==5'd9 );
assign ensel10 = (sel==5'd10);
assign ensel11 = (sel==5'd11);
assign ensel12 = (sel==5'd12);
assign ensel13 = (sel==5'd13);
assign ensel14 = (sel==5'd14);
assign ensel15 = (sel==5'd15);
assign ensel16 = (sel==5'd16);
assign ensel17 = (sel==5'd17);
assign ensel18 = (sel==5'd18);
assign ensel19 = (sel==5'd19);
assign ensel20 = (sel==5'd20);
assign ensel21 = (sel==5'd21);
assign ensel22 = (sel==5'd22);
assign ensel23 = (sel==5'd23);
assign ensel24 = (sel==5'd24);
assign ensel25 = (sel==5'd25);
assign ensel26 = (sel==5'd26);
assign ensel27 = (sel==5'd27);
assign ensel28 = (sel==5'd28);
assign ensel29 = (sel==5'd29);
assign ensel30 = (sel==5'd30);
assign ensel31 = (sel==5'd31);


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
wire [RES-1: 0] en16;
wire [RES-1: 0] en17;
wire [RES-1: 0] en18;
wire [RES-1: 0] en19;
wire [RES-1: 0] en20;
wire [RES-1: 0] en21;
wire [RES-1: 0] en22;
wire [RES-1: 0] en23;
wire [RES-1: 0] en24;
wire [RES-1: 0] en25;
wire [RES-1: 0] en26;
wire [RES-1: 0] en27;
wire [RES-1: 0] en28;
wire [RES-1: 0] en29;
wire [RES-1: 0] en30;
wire [RES-1: 0] en31;


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
assign en16 = {RES{ ensel16 }} & in16 ;
assign en17 = {RES{ ensel17 }} & in17 ;
assign en18 = {RES{ ensel18 }} & in18 ;
assign en19 = {RES{ ensel19 }} & in19 ;
assign en20 = {RES{ ensel20 }} & in20 ;
assign en21 = {RES{ ensel21 }} & in21 ;
assign en22 = {RES{ ensel22 }} & in22 ;
assign en23 = {RES{ ensel23 }} & in23 ;
assign en24 = {RES{ ensel24 }} & in24 ;
assign en25 = {RES{ ensel25 }} & in25 ;
assign en26 = {RES{ ensel26 }} & in26 ;
assign en27 = {RES{ ensel27 }} & in27 ;
assign en28 = {RES{ ensel28 }} & in28 ;
assign en29 = {RES{ ensel29 }} & in29 ;
assign en30 = {RES{ ensel30 }} & in30 ;
assign en31 = {RES{ ensel31 }} & in31 ;


assign  out = en0 |en1 |en2 |en3 |en4 |en5 |en6 |en7 |
              en8 |en9 |en10|en11|en12|en13|en14|en15|
              en16|en17|en18|en19|en20|en21|en22|en23|
              en24|en25|en26|en27|en28|en29|en30|en31;

              

endmodule

/*
muxer5  #( .RES ( 14 ) ) NOMBRE (
    // input
    .sel  (  sel  ), // select cable
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
