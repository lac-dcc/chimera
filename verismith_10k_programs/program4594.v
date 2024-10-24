module top
#(parameter param33 = ((~^({(8'h9e)} > (!(^~(8'ha5))))) ~^ (~((^~(|(8'hb9))) >>> {(8'hbf), (-(8'h9c))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned((~^wire3[(1'h1):(1'h0)]));
  assign wire5 = wire4;
  assign wire6 = (+wire5);
  assign wire7 = {$signed($signed(($unsigned(wire3) & (!wire3)))), wire0};
  assign wire8 = ($unsigned({$unsigned($signed(wire0))}) & {(+$unsigned({wire7,
                         wire1}))});
  module9 #() modinst26 (wire25, clk, wire0, wire2, wire1, wire4);
  assign wire27 = ((^~(7'h44)) | {$signed(wire0)});
  assign wire28 = $unsigned($unsigned(wire25[(5'h10):(3'h7)]));
  assign wire29 = ({{$signed($unsigned(wire3))}} - {$signed(wire2[(2'h2):(2'h2)])});
  assign wire30 = ((^~(-((^(8'hb4)) ? (8'hab) : {(8'h9f)}))) ?
                      $unsigned(wire1) : ({(-$signed(wire1))} >= wire27));
  assign wire31 = wire27[(2'h3):(1'h0)];
  assign wire32 = $signed(($signed(({wire30} < (~|wire25))) ?
                      (8'ha6) : {(wire3[(1'h1):(1'h1)] ~^ $signed(wire3))}));
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg19,
                 (1'h0)};
  assign wire14 = {(($signed((wire10 * wire12)) ? (8'ha5) : wire12) ?
                          (wire10 ?
                              ((wire11 ^ (8'hb3)) ?
                                  (wire13 ? wire11 : (8'h9d)) : (wire12 ?
                                      wire11 : (8'hab))) : wire10[(4'h9):(3'h4)]) : ($unsigned((wire11 ?
                                  wire13 : wire10)) ?
                              wire11 : $signed((wire12 ? wire11 : (8'haa)))))};
  assign wire15 = (wire14 < (wire14[(3'h4):(2'h2)] ^ wire12[(3'h7):(1'h0)]));
  assign wire16 = wire12[(4'hb):(4'ha)];
  assign wire17 = $signed($signed(wire10[(4'hb):(4'h9)]));
  assign wire18 = $signed((+$unsigned({wire10})));
  always
    @(posedge clk) begin
      reg19 <= $signed((~&$unsigned(((~wire18) | wire11))));
    end
  assign wire20 = wire10;
  assign wire21 = $unsigned((wire13 ?
                      (wire11[(3'h7):(2'h3)] ?
                          (&(~|wire18)) : $unsigned(wire17[(2'h2):(2'h2)])) : $signed(($signed(wire17) ?
                          {wire20, wire17} : (wire20 ? wire20 : reg19)))));
  assign wire22 = wire18[(4'ha):(3'h7)];
  assign wire23 = (|($unsigned(((~reg19) ? $unsigned(wire13) : wire10)) ?
                      reg19[(4'ha):(4'h8)] : wire11[(3'h4):(2'h2)]));
  assign wire24 = (($unsigned(wire16[(1'h1):(1'h1)]) ?
                          (^$signed((-wire22))) : (~&($unsigned(wire10) ?
                              reg19[(3'h6):(1'h1)] : {(8'hbb), wire22}))) ?
                      ((^(8'ha3)) ^ $unsigned($signed(wire23))) : (($unsigned(reg19[(1'h1):(1'h1)]) ?
                              wire16 : ({wire14} ?
                                  wire12 : {wire20, (8'hb5)})) ?
                          $signed($unsigned((&(8'hb2)))) : $unsigned(wire15)));
endmodule
