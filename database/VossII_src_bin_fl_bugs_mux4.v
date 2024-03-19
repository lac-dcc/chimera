module mux2(
  din_0,
  din_1,
  sel,
  mux_out
);
input din_0, din_1, sel;
output mux_out;
reg mux_out;

assign mux_out = (sel) ? din_1 : din_0;

endmodule

module mux4(
  din_0,
  din_1,
  din_2,
  din_3,
  sel,
  mux_out
);
input din_0, din_1, din_2, din_3;
input [1:0] sel;
output mux_out;
reg mux_out;
reg mid01, mid23;

mux2 mux1 (.din_0(din_0), .din_1(din_1), .sel(sel[0]), .mux_out(mid01));
mux2 mux2 (.din_0(din_3), .din_1(din_2), .sel(sel[0]), .mux_out(mid23));
mux2 mux12 (.din_0(mid01), .din_1(mid23), .sel(sel[1]), .mux_out(mux_out));

endmodule
