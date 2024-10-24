module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
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
  assign wire5 = wire4[(3'h7):(2'h2)];
  assign wire6 = $signed(($signed($signed(wire0[(4'hb):(4'hb)])) ?
                     (((+(8'ha5)) ?
                         wire5 : $signed(wire1)) ^ ($unsigned((7'h41)) || wire4[(1'h0):(1'h0)])) : (8'h9f)));
  assign wire7 = (wire3 ^ ($unsigned((8'had)) ?
                     (8'hb8) : (wire0[(3'h7):(2'h3)] ?
                         ((~^wire1) ?
                             {wire5} : $signed(wire4)) : (!$unsigned(wire6)))));
  assign wire8 = ({(~|$unsigned((wire3 <<< wire0))), $signed(wire2)} ?
                     {wire0[(4'hb):(3'h6)],
                         (8'ha3)} : $unsigned(wire2[(1'h1):(1'h1)]));
  assign wire9 = wire2;
  assign wire10 = {$unsigned((&{(|wire2), wire1})),
                      ($unsigned({wire5[(4'hd):(4'hc)], (-wire5)}) ?
                          (wire2[(4'hd):(3'h6)] ?
                              wire0 : $unsigned(wire2)) : ($signed(((7'h41) - (8'hb4))) < wire7[(2'h3):(2'h2)]))};
  assign wire11 = wire3[(2'h2):(1'h0)];
  assign wire12 = $unsigned((($unsigned((&(8'ha0))) ?
                      (8'hbb) : (^~$unsigned((8'had)))) | (!wire4)));
  assign wire13 = wire8;
  assign wire14 = wire13[(2'h3):(1'h1)];
  assign wire15 = ((~&$unsigned($signed($unsigned(wire2)))) ?
                      {{{$signed((7'h42))},
                              $signed(wire3[(2'h2):(1'h0)])}} : ($unsigned((((8'hb9) >= wire8) >> {(8'hbe),
                          wire7})) > $signed({{wire2}})));
  assign wire16 = ($unsigned(wire12[(3'h7):(3'h6)]) | (8'hbc));
endmodule
