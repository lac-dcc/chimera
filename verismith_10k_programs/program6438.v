module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  assign y = {wire17,
                 wire16,
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
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = wire2[(4'ha):(1'h0)];
  assign wire7 = (!(($signed($signed(wire6)) | $signed($unsigned(wire5))) >= $signed((((8'ha1) ?
                         wire2 : wire4) ?
                     (wire1 ? wire3 : wire1) : wire6[(4'ha):(2'h2)]))));
  assign wire8 = (wire6 ?
                     {(($unsigned(wire7) ? (^wire3) : $signed((8'hbd))) ?
                             $signed((~^wire7)) : $signed(((8'hb8) ?
                                 wire7 : wire6))),
                         $signed((wire4[(1'h0):(1'h0)] >> (-wire4)))} : wire0[(1'h1):(1'h0)]);
  assign wire9 = (&(~|($signed(((8'haa) >>> (8'hbd))) ?
                     (wire1[(3'h5):(2'h2)] ?
                         $unsigned(wire5) : $signed(wire2)) : (~^(!wire2)))));
  assign wire10 = ((8'hbe) ?
                      wire1[(2'h3):(1'h1)] : (wire9[(1'h1):(1'h1)] ?
                          (~^{((8'hbb) >= wire2)}) : wire9[(2'h3):(1'h1)]));
  assign wire11 = $unsigned(wire10);
  assign wire12 = wire10[(2'h2):(2'h2)];
  assign wire13 = $unsigned((~^(((wire7 && wire0) < (^wire5)) - (8'had))));
  assign wire14 = (wire0[(1'h1):(1'h0)] ?
                      wire3[(2'h2):(1'h0)] : $unsigned(($signed(wire8) + wire6[(2'h3):(1'h0)])));
  assign wire15 = wire7[(3'h6):(3'h4)];
  assign wire16 = wire8[(4'h8):(1'h0)];
  assign wire17 = $signed($unsigned({wire3}));
endmodule
