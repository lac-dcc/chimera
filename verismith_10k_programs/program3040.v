module top
#(parameter param47 = (+{(^~((~^(8'h9f)) > ((8'haf) ? (8'hae) : (8'hb1))))}), 
parameter param48 = param47)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  assign y = {wire45, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ((wire1[(3'h4):(1'h0)] << wire0) ?
                     (($unsigned((wire2 ? wire2 : wire3)) <<< $signed((wire0 ?
                         wire3 : wire1))) > (-{wire0})) : wire2[(2'h3):(2'h3)]);
  assign wire5 = $unsigned(($signed(wire4[(4'hd):(4'ha)]) ?
                     $unsigned((~^wire0)) : (~^wire2)));
  assign wire6 = $unsigned({(wire4 <= $unsigned((~|(8'hb4))))});
  assign wire7 = (wire3 ?
                     $signed($unsigned((|(^wire4)))) : $unsigned(wire5[(2'h3):(1'h1)]));
  assign wire8 = wire3;
  module9 #() modinst46 (wire45, clk, wire2, wire8, wire0, wire7);
endmodule

module module9
#(parameter param44 = (8'ha4))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire34,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = ((wire12 ?
                          (|(wire11 <<< $signed(wire13))) : $signed((+(wire12 && (8'ha1))))) ?
                      ($unsigned((^~(~^wire10))) <<< (^($unsigned(wire12) || $unsigned(wire13)))) : $unsigned($unsigned($unsigned({(8'hb7)}))));
  assign wire15 = (!(^wire12[(3'h4):(2'h2)]));
  module16 #() modinst35 (wire34, clk, wire13, wire12, wire11, wire10);
  assign wire36 = (8'ha5);
  assign wire37 = $unsigned(wire15);
  assign wire38 = $signed(wire12);
  assign wire39 = {(wire11[(4'hb):(3'h6)] ?
                          (~|((~(8'hb8)) ?
                              ((8'ha1) || wire38) : wire10)) : (-($signed(wire11) + (~^wire11)))),
                      (wire36 | $unsigned(wire15))};
  assign wire40 = (~|{wire10, wire38[(3'h6):(2'h2)]});
  assign wire41 = ($signed(wire15[(1'h1):(1'h1)]) ?
                      $signed({wire38[(3'h5):(2'h2)],
                          (wire37 > (wire10 >= wire38))}) : wire10);
  assign wire42 = wire39[(3'h4):(2'h3)];
  assign wire43 = (~^$signed({wire36[(4'h9):(3'h6)]}));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  assign y = {wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire21 = wire18[(3'h4):(1'h0)];
  assign wire22 = wire20;
  assign wire23 = ($signed($signed(({wire22} ?
                      $unsigned((7'h42)) : wire19[(2'h2):(2'h2)]))) | ($signed((~&$unsigned(wire19))) ?
                      $unsigned({wire19[(2'h3):(1'h1)],
                          wire20[(4'ha):(3'h5)]}) : $signed($signed((wire22 < wire22)))));
  assign wire24 = (($signed(wire18[(2'h2):(1'h0)]) ^~ ($unsigned(wire19) >>> (wire22 < (~&wire19)))) ?
                      {$unsigned($signed($signed(wire18))),
                          wire19} : $signed({({wire20} ?
                              $unsigned(wire22) : (^~wire23)),
                          ($unsigned(wire23) >>> wire20[(2'h2):(2'h2)])}));
  assign wire25 = ($signed($unsigned(wire24[(3'h5):(1'h1)])) ?
                      $signed((((+wire19) ?
                          $signed((7'h44)) : (wire23 ?
                              wire17 : wire21)) >> $signed(wire24[(4'h9):(3'h6)]))) : $unsigned(wire17[(4'ha):(3'h4)]));
  assign wire26 = (wire25 << (~|{(!$unsigned(wire25)),
                      ((wire23 ? wire21 : wire24) ?
                          (wire23 ? wire25 : wire25) : $unsigned(wire22))}));
  assign wire27 = $unsigned((&$signed(wire18[(3'h4):(1'h1)])));
  assign wire28 = {wire22};
  always
    @(posedge clk) begin
      reg29 <= $unsigned($unsigned(wire27[(4'hc):(3'h5)]));
      reg30 <= wire26;
      reg31 <= (~^$unsigned(($signed(wire28) < (~|wire25[(1'h0):(1'h0)]))));
      reg32 <= $unsigned(((wire28[(3'h6):(2'h3)] ?
          (^~{(8'ha6)}) : wire27[(4'ha):(2'h2)]) << (~|(wire22[(1'h0):(1'h0)] ?
          wire23 : wire27[(4'h9):(3'h7)]))));
    end
  assign wire33 = $signed((wire17[(3'h6):(2'h3)] >> (~&wire26)));
endmodule
