// This program was cloned from: https://github.com/sep-81/Computer-Architecture-Course-Projects
// License: MIT License

`include "MUX.v"
`timescale 1ns/1ns

module MUX_TB ();
  reg  [7:0] mux_in  [0:3];
  reg  [1:0] sel;
  wire [7:0] mux_out;
  MUX to_be_tested (
      .mux_in({mux_in[0], mux_in[1], mux_in[2], mux_in[3]}),
      .sel(sel),
      .mux_out(mux_out)
  );
  initial begin
    mux_in[0] = 8'd1;
    mux_in[1] = 8'd11;
    mux_in[2] = 8'd3;
    mux_in[3] = 8'd5;

    sel = 2'd2;

    #10 $stop;
  end
endmodule
