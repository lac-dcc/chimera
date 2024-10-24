module top
#(parameter param17 = {(8'hab), {((((8'hb7) ? (8'hb3) : (8'hb5)) > ((8'ha0) || (8'hb7))) <= {{(8'hbe), (8'hb0)}})}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
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
  assign wire5 = wire1;
  assign wire6 = $unsigned((($unsigned($signed(wire0)) ?
                         (+((8'ha5) ? wire3 : wire3)) : (&(wire2 ?
                             (8'hb7) : wire3))) ?
                     $signed({$signed((7'h44)),
                         wire3[(2'h2):(1'h1)]}) : wire2[(3'h7):(1'h0)]));
  assign wire7 = {(!wire1)};
  assign wire8 = $unsigned((wire4[(3'h4):(1'h0)] | $signed(($signed(wire3) ?
                     $signed(wire1) : (~&(8'hb6))))));
  assign wire9 = wire4;
  assign wire10 = $signed((($signed($signed((8'hbb))) ?
                      ({wire7, wire5} ?
                          (+wire4) : $signed((7'h44))) : $unsigned((|wire1))) || wire2));
  assign wire11 = $signed(wire7);
  assign wire12 = ($signed((8'hbc)) ?
                      $unsigned((~{$unsigned(wire6)})) : (($signed((^~wire10)) <= ((wire1 ?
                                  wire5 : wire1) ?
                              ((8'hbb) == wire4) : (~^wire2))) ?
                          (($signed(wire10) + (+wire9)) + $unsigned($signed(wire7))) : ($unsigned($signed(wire3)) ?
                              {(!wire4),
                                  (-wire4)} : $unsigned((wire3 == wire1)))));
  assign wire13 = $unsigned({wire10[(2'h2):(1'h0)], wire2[(2'h3):(1'h1)]});
  assign wire14 = $unsigned((8'ha3));
  assign wire15 = ($signed($unsigned($unsigned($unsigned(wire5)))) ?
                      $unsigned((8'hba)) : ((wire0 << ({wire13,
                          wire0} * (wire7 || wire10))) == $unsigned((((8'h9d) ^~ wire0) ?
                          wire12 : wire1))));
  assign wire16 = ((+{{$unsigned(wire7), wire3[(3'h5):(1'h0)]},
                      ((wire5 - wire4) ?
                          {wire8, wire1} : (wire15 ?
                              wire13 : wire0))}) >> $signed(wire14));
endmodule
