// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_340067262721426004(
  input [7:0] io_in, 
  output [7:0] io_out
);

  wire out;

  assign io_out[0] = out;

  div3_340067262721426004 div3_core(
    .rst(io_in[1]),
    .in(io_in[0]),    // this is clk
    .out(out)
  );

endmodule

// This is my answer to the classic interview question which asks to 
// divide a clock by 3 but with a 50% duty cycle, which adds a fun element.

// It's basically exercise 26.7 in Digital Design, A System's Approach by Dally
// but I used a slightly different state assignment for some reason.

module div3_340067262721426004 (input in, rst, output out);

wire in, rst, nrst, out, s0, s1, s2;

assign #1 out = ~s0;
assign #1 nrst = ~rst;

wire a,b,c;

// each one of these represents a buble in the kmap which I made from the
// state transistion table.  It made it a bit easier to find typos. 

assign a = s0&s1;
assign b = ~s2&in&s0;
assign c = s2&in&s1;

assign #1 s0 = nrst & ( a|b|c ); 

wire d,e,f,g;

assign d=~s0&s1;
assign e=~s2&~in&s1;
assign f=s2&~in&~s0;
assign g=s1&s2;

assign #1 s1 = nrst & ( d|e|f|g );

wire h,i,j;

assign h = ~s0&s2;
assign i = ~s0&~s1&in;
assign j = s2&in;

assign #1 s2 = nrst & ( h|i|j );

endmodule


