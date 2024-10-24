module top
#(parameter param21 = {(!{(+((8'ha3) ? (8'ha8) : (8'ha4))), (&((8'ha2) ? (7'h40) : (8'h9d)))}), ((~(!((8'hbe) + (8'hbe)))) ? ((((8'ha2) << (8'ha0)) ? ((8'h9e) >= (8'hac)) : ((8'hab) < (8'hbc))) & {((8'hbf) ? (8'h9e) : (8'hae)), ((8'h9f) && (7'h42))}) : ((((8'ha2) ? (8'ha4) : (8'ha5)) < ((8'ha2) ? (8'hb0) : (8'hbe))) ? ((^(8'hb5)) >> ((8'hb6) ? (8'ha5) : (8'ha5))) : (((8'hb3) ? (8'hbe) : (8'hac)) | ((7'h41) >>> (7'h41)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 wire4,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $signed($signed({(wire4[(1'h0):(1'h0)] ?
                         $signed(wire4) : {(8'had), wire1}),
                     ((wire1 > wire1) ?
                         wire4[(2'h3):(2'h2)] : (wire4 ? wire3 : wire2))}));
  assign wire6 = wire3[(4'ha):(1'h0)];
  assign wire7 = ((8'haf) ?
                     {wire3} : ($unsigned((~&$unsigned(wire3))) >>> ($unsigned((wire6 || wire0)) ?
                         {(wire5 ? wire1 : wire5),
                             (wire6 ?
                                 (8'h9e) : (8'hbd))} : $signed(wire1[(1'h0):(1'h0)]))));
  assign wire8 = (~^{(({(8'hb7), wire3} ?
                         {wire3} : wire4[(2'h3):(2'h2)]) & ($unsigned(wire6) ?
                         wire0 : $signed(wire5)))});
  assign wire9 = ({{(+(8'ha3))}, (8'hb7)} ?
                     (wire7[(4'hb):(4'h9)] ?
                         wire2[(3'h7):(2'h2)] : wire3) : (8'hbf));
  assign wire10 = (~(~^wire8[(4'ha):(2'h2)]));
  assign wire11 = ((!($unsigned((wire0 ? (8'haf) : wire4)) ?
                      (wire10[(2'h3):(2'h2)] ?
                          $unsigned(wire9) : (wire2 - wire4)) : (~&wire4))) ^~ $unsigned({wire4[(1'h1):(1'h0)],
                      (-wire2)}));
  assign wire12 = wire8;
  assign wire13 = ((~|$unsigned($signed($unsigned(wire2)))) ?
                      (8'ha5) : (8'ha8));
  assign wire14 = (&$signed(wire9));
  assign wire15 = wire6[(2'h3):(1'h0)];
  assign wire16 = (~&(&(wire0 ?
                      wire1[(3'h7):(1'h0)] : {(~^wire4), (^~(8'hb1))})));
  assign wire17 = $signed(($signed($unsigned($unsigned(wire12))) <= ((wire15 ?
                      $signed((8'hab)) : (~&(8'hb4))) <<< (^~{wire12}))));
  assign wire18 = ((wire0 > wire2[(1'h0):(1'h0)]) >= wire14[(1'h1):(1'h0)]);
  assign wire19 = $signed({{$signed(wire0[(2'h3):(2'h2)]),
                          $signed((wire6 ^ wire18))},
                      wire0[(1'h0):(1'h0)]});
  assign wire20 = $signed($unsigned(((~&wire17[(4'h8):(3'h5)]) + $unsigned((wire7 * wire6)))));
endmodule
