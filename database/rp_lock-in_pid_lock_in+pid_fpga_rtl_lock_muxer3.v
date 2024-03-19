//////////////////////////////////////////////////////////////////////////////////
//(* dont_touch = "true" *)
//(* black_box *)


//(* keep_hierarchy = "true" *) 
module muxer3 #(
   parameter     RES = 14 
)
(
   // input
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
   output     [RES-1: 0] out                // output data
);


wire ensel0 ,ensel1 ,ensel2 ,ensel3 ,ensel4 ,ensel5 ,ensel6 ,ensel7 ;

     

assign ensel0  = (sel==3'd0 );
assign ensel1  = (sel==3'd1 );
assign ensel2  = (sel==3'd2 );
assign ensel3  = (sel==3'd3 );
assign ensel4  = (sel==3'd4 );
assign ensel5  = (sel==3'd5 );
assign ensel6  = (sel==3'd6 );
assign ensel7  = (sel==3'd7 );


wire [RES-1: 0] en0 ;
wire [RES-1: 0] en1 ;
wire [RES-1: 0] en2 ;
wire [RES-1: 0] en3 ;
wire [RES-1: 0] en4 ;
wire [RES-1: 0] en5 ;
wire [RES-1: 0] en6 ;
wire [RES-1: 0] en7 ;


assign en0  = {RES{ ensel0  }} & in0  ;
assign en1  = {RES{ ensel1  }} & in1  ;
assign en2  = {RES{ ensel2  }} & in2  ;
assign en3  = {RES{ ensel3  }} & in3  ;
assign en4  = {RES{ ensel4  }} & in4  ;
assign en5  = {RES{ ensel5  }} & in5  ;
assign en6  = {RES{ ensel6  }} & in6  ;
assign en7  = {RES{ ensel7  }} & in7  ;


assign  out = en0 |en1 |en2 |en3 |en4 |en5 |en6 |en7 ;

              

endmodule

/*
muxer3  #( .RES ( 14 ) ) NOMBRE (
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
    // output
    .out ( out   )
);
*/
