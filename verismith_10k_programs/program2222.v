module top
#(parameter param17 = {(8'hbb)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire4[(1'h1):(1'h1)];
  assign wire6 = wire3[(3'h4):(1'h1)];
  assign wire7 = $signed(($unsigned(($unsigned(wire4) ?
                     $signed(wire6) : {wire2, wire5})) <= (~|($unsigned(wire3) ?
                     {wire3} : wire2[(4'h8):(2'h3)]))));
  assign wire8 = $unsigned(wire5);
  assign wire9 = {{$signed(wire3)}, ((~|{(&(8'hb2)), $signed(wire1)}) < wire5)};
  assign wire10 = ($signed(((!(~wire8)) ?
                      ((wire8 ? wire9 : wire7) ?
                          (~wire2) : (~&wire5)) : wire7[(2'h3):(1'h0)])) >>> wire1);
  assign wire11 = (^~$unsigned(wire6[(3'h6):(2'h2)]));
  assign wire12 = (wire9 || $unsigned((7'h44)));
  assign wire13 = $unsigned(wire0[(2'h2):(2'h2)]);
  assign wire14 = (8'h9e);
  assign wire15 = (-(&$unsigned(((wire6 ? wire3 : wire7) * $unsigned(wire3)))));
  assign wire16 = wire15;
endmodule
