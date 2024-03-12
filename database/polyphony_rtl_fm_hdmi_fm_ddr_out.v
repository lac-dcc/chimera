module fm_ddr_out (
  clk_v,
  rst_x,
  // video in
  i_y,
  i_c,
  // video out
  o_d
);
  input  clk_v;
  input  rst_x;

  input  [7:0] i_y;
  input  [7:0] i_c;
  output [15:0] o_d;

//////////////////////////////////
// module instantiation
//////////////////////////////////
assign o_d[7:0] = 8'h00;
genvar gi;

generate for (gi=0;gi<8;gi=gi+1) begin
  ODDR  #("SAME_EDGE", 0, "SYNC") ODDR_hdmi (
                .C(clk_v),
                .Q(o_d[gi+8]),
                .D1(i_y[gi]),
                .D2(i_c[gi]),
                .CE(1'b1),
                .R(1'b0),
                .S (1'b0)
              ); 

end
endgenerate

endmodule
