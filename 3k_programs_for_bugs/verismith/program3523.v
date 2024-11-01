module top
#(parameter param46 = (8'hb7), 
parameter param47 = param46)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire40;
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire40,
                 (1'h0)};
  assign wire4 = {wire1};
  assign wire5 = ($unsigned($signed($unsigned((wire2 != wire1)))) == wire4);
  assign wire6 = (~$signed($unsigned(($signed(wire4) ?
                     (-(8'hb4)) : $unsigned(wire2)))));
  assign wire7 = wire4;
  module8 #() modinst41 (.wire12(wire2), .y(wire40), .wire13(wire7), .clk(clk), .wire10(wire0), .wire9(wire1), .wire11(wire3));
  assign wire42 = $signed(wire7[(4'hf):(3'h4)]);
  assign wire43 = wire42[(1'h0):(1'h0)];
  assign wire44 = (wire40[(3'h5):(2'h2)] <<< ({wire42[(4'hb):(2'h3)]} || $signed((+{(8'ha7),
                      wire4}))));
  assign wire45 = $unsigned((($signed($unsigned(wire3)) >>> wire4) ?
                      $signed(wire4[(1'h0):(1'h0)]) : {{(wire4 ?
                                  (8'hbc) : (8'hab))},
                          (-{wire40})}));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire37;
  assign y = {wire39, wire14, wire15, wire37, (1'h0)};
  assign wire14 = {wire9[(1'h1):(1'h0)],
                      (((7'h41) << $signed({wire11})) ^~ (8'h9c))};
  assign wire15 = (-(8'hb7));
  module16 #() modinst38 (wire37, clk, wire14, wire11, wire13, wire9, wire10);
  assign wire39 = (~($unsigned($signed((wire10 & wire15))) ?
                      $unsigned(wire9) : {{wire13[(5'h13):(2'h2)],
                              (wire37 ? wire10 : wire9)},
                          ((wire37 >= wire11) ?
                              (|wire14) : $unsigned(wire12))}));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = (((~(+$unsigned(wire19))) != ({$unsigned(wire19),
                          $unsigned(wire17)} ?
                      {wire21[(4'hf):(4'hf)]} : wire17[(3'h4):(2'h2)])) < {wire20});
  assign wire23 = $signed($unsigned($unsigned($signed(((8'h9e) ?
                      (8'hb7) : wire17)))));
  assign wire24 = {$signed(($signed(wire20) & wire19[(1'h1):(1'h0)])),
                      $unsigned((!((~&wire19) <<< wire23[(3'h5):(3'h4)])))};
  assign wire25 = wire18;
  assign wire26 = ((+((wire23 && $signed(wire25)) <= wire23)) == ({$unsigned($signed(wire20)),
                          $signed($unsigned(wire21))} ?
                      (^~wire17[(3'h7):(3'h6)]) : $unsigned((+$signed((8'hb6))))));
  assign wire27 = $unsigned({($signed((wire25 ? wire19 : wire25)) ?
                          $unsigned((wire25 ?
                              wire18 : wire26)) : (^$unsigned((8'ha1)))),
                      $signed((|wire19))});
  assign wire28 = wire26;
  assign wire29 = wire18;
  assign wire30 = wire29;
  assign wire31 = wire21[(5'h10):(4'h9)];
  assign wire32 = {wire21[(2'h3):(2'h3)]};
  assign wire33 = (($signed($signed((wire30 ?
                      wire26 : wire31))) >>> wire25[(4'hb):(2'h2)]) * $unsigned($signed((8'hbd))));
  assign wire34 = $unsigned({$signed(wire21[(1'h0):(1'h0)])});
  assign wire35 = ($unsigned((((~^(7'h40)) || $signed(wire31)) ?
                          ((~^(8'ha6)) * (~^wire17)) : $unsigned((wire28 ?
                              wire26 : wire33)))) ?
                      ({(wire34[(3'h6):(2'h3)] == wire24[(4'h8):(2'h3)]),
                              $signed($signed(wire34))} ?
                          $signed({{wire30, wire23},
                              ((7'h44) >= wire21)}) : wire17[(3'h5):(3'h4)]) : wire31);
  assign wire36 = ({(!(^~$unsigned((8'hbf)))),
                      $unsigned((wire26 >> wire34))} != $signed(((wire28[(4'h9):(1'h0)] + wire17[(3'h6):(2'h2)]) ?
                      (7'h43) : wire29[(1'h0):(1'h0)])));
endmodule
