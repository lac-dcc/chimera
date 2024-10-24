module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = ($unsigned($unsigned(wire0)) ?
                     wire0 : (wire0[(4'h8):(4'h8)] | wire2));
  assign wire6 = wire0[(1'h1):(1'h1)];
  assign wire7 = (($signed(wire0[(3'h5):(3'h5)]) > ($signed($signed((8'hb0))) ^ ({(7'h40),
                         (8'h9f)} ?
                     wire4 : $unsigned(wire1)))) & {(((wire5 ? wire0 : wire6) ?
                         (wire3 ?
                             (8'hb6) : wire3) : $signed(wire5)) ~^ ($signed(wire4) >>> $unsigned((7'h43))))});
  assign wire8 = (~$signed(wire6));
  assign wire9 = ($signed((8'hae)) ?
                     {wire1[(1'h0):(1'h0)],
                         {wire7, wire5[(2'h3):(1'h1)]}} : wire2);
  assign wire10 = wire8;
  assign wire11 = (((~&wire3[(1'h0):(1'h0)]) - ((+(-wire6)) ?
                          {wire7[(3'h4):(1'h1)]} : {(wire1 ? wire3 : wire8),
                              $signed(wire7)})) ?
                      (wire8 << ({(8'hb1)} & ($signed(wire4) ?
                          {(8'hb4)} : $unsigned(wire8)))) : $signed($unsigned($unsigned(wire3[(1'h0):(1'h0)]))));
  assign wire12 = (wire2 ? wire5 : wire11);
endmodule
