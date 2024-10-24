module top
#(parameter param17 = (+{{(~|((8'had) ~^ (8'hba))), (((8'ha2) ? (7'h42) : (8'hb4)) > ((8'hb1) == (8'h9e)))}}), 
parameter param18 = (param17 ? {((+(param17 ? param17 : param17)) ^ param17), (param17 | ((param17 ? param17 : param17) || (param17 ? param17 : param17)))} : (~|(8'hab))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
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
  assign wire5 = ((wire2 ?
                     wire0 : wire3[(3'h6):(3'h6)]) * wire1[(2'h2):(1'h0)]);
  assign wire6 = $unsigned((($signed(((8'ha4) != wire1)) > (^~wire0[(3'h5):(3'h5)])) <<< $unsigned({{(8'h9f),
                         wire5}})));
  assign wire7 = wire5;
  assign wire8 = ((wire7 >>> {$unsigned((wire1 ?
                         wire3 : wire7))}) - (-{(!$unsigned(wire2)),
                     ($signed(wire0) ^~ $signed(wire5))}));
  assign wire9 = ((^wire0[(4'h8):(3'h7)]) - wire0);
  assign wire10 = ($signed(wire1) | $signed({((wire2 ?
                          wire0 : wire0) ~^ wire4)}));
  assign wire11 = $signed({wire4[(3'h5):(3'h4)]});
  assign wire12 = $unsigned(wire10);
  assign wire13 = $signed($signed(wire0[(2'h2):(1'h1)]));
  assign wire14 = ((^~$unsigned(wire6)) ?
                      ($unsigned($unsigned($signed(wire12))) ?
                          wire7[(2'h2):(2'h2)] : (8'hb8)) : wire10[(3'h4):(1'h0)]);
  assign wire15 = $signed($unsigned(wire2));
  assign wire16 = $signed({$unsigned(($signed((8'hb8)) ?
                          (wire0 | wire3) : $unsigned(wire1)))});
endmodule
