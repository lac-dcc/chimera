module top
#(parameter param193 = (8'h9f))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire189;
  wire [(3'h7):(1'h0)] wire188;
  wire signed [(4'ha):(1'h0)] wire187;
  wire signed [(4'h9):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire181;
  reg signed [(4'hf):(1'h0)] reg192 = (1'h0);
  reg [(4'hc):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(3'h6):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire183,
                 wire67,
                 wire69,
                 wire181,
                 reg192,
                 reg191,
                 reg190,
                 reg186,
                 reg185,
                 reg184,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hb4))
        begin
          if ({$signed({({wire3} ? $unsigned((8'ha5)) : $unsigned(wire2)),
                  ((wire0 ? wire2 : wire1) == (wire4 << (8'hb2)))}),
              $unsigned({(wire4 ? $signed(wire2) : {wire1, wire0})})})
            begin
              reg5 <= wire3;
              reg6 <= {(&($signed((^wire3)) || (8'hb2))), wire3};
            end
          else
            begin
              reg5 <= $signed($unsigned(wire0));
              reg6 <= $signed({{($signed(wire2) ?
                          {wire3} : (reg5 ? wire1 : wire4)),
                      ((|wire2) >>> reg6[(4'h9):(4'h9)])}});
            end
          reg7 <= wire3;
          reg8 <= (reg5 && $signed($signed((wire3 ?
              (^~wire0) : $unsigned(reg5)))));
        end
      else
        begin
          reg5 <= $signed(($unsigned((&(~&reg8))) ?
              (~^$unsigned(((7'h43) ? wire1 : wire3))) : wire2[(4'he):(4'hd)]));
        end
      reg9 <= (~&(-reg7));
      reg10 <= ((|($unsigned(((8'hb4) + reg8)) ?
              $unsigned((wire1 ? (8'h9d) : wire3)) : (~$unsigned(wire2)))) ?
          $signed((|wire3[(4'hc):(3'h6)])) : ((reg7 >= reg8) <<< (|((~|reg7) <<< reg5))));
    end
  module11 #() modinst68 (.clk(clk), .wire12(reg5), .wire13(reg7), .wire16(wire1), .wire14(wire2), .y(wire67), .wire15(wire0));
  assign wire69 = {$signed(($unsigned(wire2[(3'h5):(1'h0)]) ?
                          ((wire3 ? reg7 : (8'hb3)) ?
                              $signed(wire4) : (|reg7)) : $unsigned($unsigned(wire0)))),
                      reg5};
  always
    @(posedge clk) begin
      if ($unsigned(((^$signed((wire1 ^ (8'hb2)))) ?
          $signed(reg10) : reg9[(4'h8):(2'h2)])))
        begin
          reg70 <= wire0[(4'hf):(4'hf)];
          reg71 <= wire67[(4'hc):(1'h0)];
          if (({$signed(((reg71 - reg10) || $signed(reg8))),
              wire4[(2'h3):(1'h0)]} >= (7'h42)))
            begin
              reg72 <= $signed(($signed($unsigned({(8'hb5)})) != ({(-wire2)} ?
                  reg5 : $unsigned((!wire4)))));
              reg73 <= {reg8, reg8[(1'h1):(1'h1)]};
              reg74 <= reg5;
            end
          else
            begin
              reg72 <= ({((~&(reg72 || (8'hba))) || $signed((~|reg73))),
                  ((((8'h9c) ? reg8 : reg7) >= $signed((8'h9f))) ?
                      ((^(8'hac)) >>> reg9) : {(7'h41),
                          $signed(wire2)})} ~^ ((($unsigned(wire69) <<< {wire2,
                  reg7}) <<< $unsigned((reg8 ?
                  wire2 : reg5))) >= ($unsigned(reg10) ?
                  wire69[(1'h0):(1'h0)] : reg9)));
            end
          reg75 <= reg10;
          reg76 <= {{wire2[(4'hb):(1'h0)], wire2},
              ($unsigned($unsigned({wire3,
                  (8'hb7)})) & $unsigned((&(reg72 >>> wire3))))};
        end
      else
        begin
          reg70 <= (7'h43);
          if (reg6[(3'h6):(2'h3)])
            begin
              reg71 <= (8'hbc);
              reg72 <= reg72;
              reg73 <= $signed(reg7);
              reg74 <= wire1;
              reg75 <= reg72;
            end
          else
            begin
              reg71 <= wire4[(4'h8):(4'h8)];
            end
          reg76 <= (!($unsigned($unsigned($unsigned(reg75))) ?
              (-($unsigned(reg71) - (~^reg9))) : ((8'had) >> (((8'ha1) < (7'h44)) ~^ reg8[(3'h5):(3'h5)]))));
          reg77 <= ((wire0[(2'h3):(1'h1)] ?
                  (wire3 ~^ $unsigned(reg6)) : $unsigned((reg5 ?
                      reg76[(3'h5):(1'h1)] : $signed(wire69)))) ?
              $signed($signed(((reg5 ? wire67 : reg5) ?
                  $unsigned(reg73) : {reg73}))) : {$unsigned(({reg5} + wire1)),
                  (~&({wire69} ? {reg71} : reg72))});
        end
      reg78 <= {reg77, $unsigned($signed(reg7))};
      reg79 <= {wire4[(1'h1):(1'h0)],
          $signed($unsigned((reg76[(2'h2):(2'h2)] ?
              (wire0 * reg75) : wire69[(2'h2):(1'h0)])))};
    end
  module80 #() modinst182 (wire181, clk, reg6, reg74, reg78, wire0);
  assign wire183 = $unsigned({reg78[(3'h4):(2'h2)],
                       ($unsigned($unsigned(reg5)) && (8'ha2))});
  always
    @(posedge clk) begin
      reg184 <= $unsigned(wire181);
      reg185 <= (~^((wire0 ~^ $signed($unsigned(wire4))) && {reg77[(4'ha):(1'h0)],
          reg76}));
      reg186 <= $signed((^$unsigned((((7'h41) || (8'ha1)) ~^ $unsigned(reg8)))));
    end
  assign wire187 = (wire69[(1'h1):(1'h1)] && (wire3 ?
                       $signed((&(!wire181))) : $unsigned(reg184)));
  assign wire188 = reg72[(4'h9):(4'h8)];
  assign wire189 = ((wire187 ?
                       reg6[(4'hb):(3'h7)] : $signed(wire3)) > (&$signed(({(8'hb9),
                       wire3} | $unsigned(reg74)))));
  always
    @(posedge clk) begin
      reg190 <= {(|({$unsigned((8'h9f)), (reg8 ? reg71 : wire183)} ~^ (8'ha0))),
          reg10[(4'hc):(3'h7)]};
      reg191 <= reg75;
      reg192 <= $signed(wire3[(4'h8):(3'h5)]);
    end
endmodule

module module80  (y, clk, wire81, wire82, wire83, wire84);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire81;
  input wire signed [(5'h15):(1'h0)] wire82;
  input wire [(5'h14):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire177;
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire85,
                 wire86,
                 wire87,
                 wire91,
                 wire177,
                 reg88,
                 reg89,
                 reg90,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 (1'h0)};
  assign wire85 = ($signed(wire82[(3'h7):(3'h4)]) ?
                      (-$unsigned((^~wire82))) : $signed((+wire83)));
  assign wire86 = (wire81 <= ((^~wire84[(3'h4):(2'h2)]) - ($unsigned((wire83 && (8'hbe))) << wire83[(5'h11):(2'h3)])));
  assign wire87 = (($unsigned((^$signed(wire84))) > {wire83}) ?
                      {wire81} : ($unsigned((8'hb5)) ?
                          wire84 : (wire85 ?
                              wire82[(4'hd):(4'ha)] : wire81[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg88 <= wire86;
      reg89 <= (reg88 * {(~(^{wire87}))});
      reg90 <= (wire81 ? reg89 : (~|reg88[(2'h3):(2'h2)]));
    end
  assign wire91 = $signed(((reg89 <<< $signed($signed(wire87))) ?
                      $signed(($signed(wire81) || (^~reg88))) : $signed($unsigned((reg89 * wire83)))));
  always
    @(posedge clk) begin
      reg92 <= $signed(($signed($unsigned({wire85, reg90})) ?
          (+{wire87, ((8'hba) == wire85)}) : wire86[(2'h2):(1'h1)]));
      if ((^~$unsigned($unsigned($signed((wire84 * (8'ha9)))))))
        begin
          reg93 <= (reg88 <= ({($signed(wire85) & wire85),
                  (wire81[(3'h5):(1'h1)] + (wire84 ? reg92 : reg89))} ?
              $unsigned($unsigned(wire83[(3'h5):(2'h3)])) : (~|reg90[(4'ha):(1'h0)])));
          reg94 <= wire81;
        end
      else
        begin
          if (wire84[(2'h2):(1'h0)])
            begin
              reg93 <= reg89;
              reg94 <= (wire82[(5'h12):(3'h4)] ?
                  (((reg88 ? wire91 : (reg93 >>> wire91)) ?
                          ($unsigned((8'hbe)) ?
                              {(7'h40), wire87} : (wire86 - (8'ha0))) : reg88) ?
                      ($unsigned(reg94[(4'h9):(2'h2)]) * (~wire85)) : ((((8'ha9) ?
                              (8'hb4) : wire83) ?
                          ((8'hb6) + wire85) : (reg89 ?
                              reg89 : reg88)) ^ wire84[(1'h1):(1'h1)])) : (({wire81[(5'h11):(3'h5)]} ?
                          ((reg94 ? reg90 : (8'hb6)) ?
                              reg90[(3'h6):(3'h6)] : $signed(wire81)) : ($signed(wire83) ?
                              {wire84} : reg89[(1'h1):(1'h0)])) ?
                      $unsigned(wire85[(2'h3):(2'h2)]) : $unsigned((((8'ha4) <<< reg89) || (reg94 & reg94)))));
            end
          else
            begin
              reg93 <= ((~{{reg92}, $signed((+wire83))}) ?
                  (~$signed(wire85)) : $signed($unsigned(wire85[(3'h4):(2'h2)])));
              reg94 <= wire87[(4'hb):(2'h2)];
            end
          reg95 <= wire82[(4'hb):(1'h0)];
          reg96 <= (wire82[(3'h4):(1'h0)] ? reg88 : $unsigned(wire81));
          reg97 <= ((~|$unsigned(wire87[(4'hc):(4'hc)])) ?
              (|reg92[(1'h1):(1'h1)]) : (~|wire84[(2'h2):(1'h0)]));
        end
      reg98 <= $unsigned((wire86[(2'h3):(2'h2)] || (wire84[(3'h4):(2'h2)] ?
          $signed((wire91 ? reg92 : reg97)) : {(~^reg92)})));
      reg99 <= ({wire87} ? reg93 : ({$signed(reg96)} ~^ $signed(reg94)));
    end
  module100 #() modinst178 (wire177, clk, wire83, reg96, reg95, reg94);
  assign wire179 = ($signed((~$unsigned(reg89[(3'h5):(3'h5)]))) ?
                       (((|(wire84 ? reg92 : reg89)) >>> $unsigned((^wire85))) ?
                           {reg90[(3'h5):(2'h2)]} : (reg90[(3'h7):(3'h5)] | ((8'hb3) * (reg99 != wire82)))) : $signed((($signed(reg98) <<< (reg90 ?
                           wire86 : reg95)) <<< wire91[(1'h1):(1'h1)])));
  assign wire180 = $unsigned(reg99[(1'h1):(1'h0)]);
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire17;
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  assign y = {wire60,
                 wire58,
                 wire17,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire17 = ($unsigned(((|(wire15 >> wire13)) ?
                      $signed({(8'hbb), wire12}) : ({wire12, wire16} ?
                          (!wire14) : wire14))) << wire13);
  module18 #() modinst59 (wire58, clk, wire15, wire17, wire13, wire12);
  assign wire60 = ((&(({(8'hb1), wire17} >= $unsigned(wire12)) ?
                          {(~&wire13)} : (~^(wire15 == wire16)))) ?
                      $signed(wire58[(4'ha):(4'ha)]) : (({(wire58 && wire14),
                                  wire16[(3'h7):(3'h7)]} ?
                              (|(8'ha4)) : ((~&wire15) || wire15)) ?
                          {(wire15 << {wire14, (8'h9d)}),
                              (8'hb0)} : (wire13 + wire15[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg61 <= (~^{$signed((8'ha4))});
      if (wire58)
        begin
          reg62 <= (wire60 ^~ ({(((8'ha0) * wire14) >= (wire17 ~^ (8'hbe))),
              ({wire17, wire58} - (wire58 ?
                  wire15 : wire58))} <= $unsigned(($unsigned(wire12) ^~ (wire13 ?
              wire14 : wire58)))));
        end
      else
        begin
          reg62 <= (&$unsigned(($unsigned((wire60 + wire17)) ~^ (~^$signed((8'hbb))))));
          reg63 <= wire15[(1'h1):(1'h0)];
          reg64 <= wire58[(1'h0):(1'h0)];
          reg65 <= wire60[(3'h7):(1'h1)];
        end
      reg66 <= (~&{$signed((wire60 ? wire14[(1'h0):(1'h0)] : (^reg62))),
          (reg61 == (wire58 ? wire17 : (reg64 || reg65)))});
    end
endmodule

module module18
#(parameter param56 = (({{(^~(8'hbd)), ((7'h43) == (8'hb0))}} ? (8'hb1) : {(-(-(8'hbe))), ((8'h9e) >= ((8'hb3) <<< (8'hb1)))}) ? (!(({(8'hb9), (8'ha0)} >>> ((8'hbd) || (8'ha9))) ^ (+((7'h41) ? (8'hbe) : (7'h41))))) : (~|(~(((8'ha6) * (8'h9d)) ? {(8'ha8), (8'ha7)} : ((8'hba) ? (8'hb0) : (7'h41)))))), 
parameter param57 = (8'hba))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire23;
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  assign y = {wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire23,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = $signed((wire22 ?
                      $unsigned(($unsigned(wire21) ?
                          wire20 : (wire20 ?
                              wire20 : wire21))) : (^wire19[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg24 <= wire20;
      if (($signed((!wire19[(3'h5):(3'h5)])) | $unsigned((((reg24 ^ wire20) ?
          (wire22 | wire22) : (!wire22)) > wire20[(2'h3):(2'h2)]))))
        begin
          reg25 <= $signed(({reg24[(3'h6):(3'h6)]} ?
              wire19 : wire21[(4'h9):(2'h2)]));
          reg26 <= $unsigned($unsigned((wire22 > reg24)));
          reg27 <= $signed($signed((8'h9f)));
          reg28 <= $signed((~&wire20[(3'h5):(1'h1)]));
        end
      else
        begin
          reg25 <= ($signed((~^wire22)) ?
              ((^($unsigned((8'hbd)) && (&reg24))) <<< $signed((reg25[(1'h0):(1'h0)] ?
                  wire23 : (wire19 >> wire23)))) : (^(&wire19)));
          reg26 <= $signed(($signed($unsigned((wire20 ? reg28 : wire21))) ?
              $signed((8'ha0)) : $signed(($unsigned(wire19) ?
                  (&(8'hb5)) : (8'ha8)))));
          reg27 <= $signed(wire23);
          reg28 <= wire23;
        end
      if ($unsigned(reg26))
        begin
          reg29 <= ((8'hab) ?
              $unsigned($unsigned((((7'h44) == reg24) ?
                  $unsigned(wire23) : (&reg28)))) : (+(!wire19[(3'h6):(3'h5)])));
          reg30 <= $unsigned((&{reg24[(1'h1):(1'h0)]}));
          reg31 <= $signed({(^$unsigned($unsigned((8'hae))))});
          if (reg27[(4'hf):(3'h4)])
            begin
              reg32 <= (~wire20[(3'h4):(1'h0)]);
            end
          else
            begin
              reg32 <= reg25[(1'h0):(1'h0)];
              reg33 <= (&$unsigned($signed(reg29[(4'h8):(2'h3)])));
              reg34 <= (8'hb0);
              reg35 <= ((^(^$unsigned(reg33[(1'h0):(1'h0)]))) ?
                  wire20 : $signed($unsigned(((&reg31) ?
                      $signed(wire19) : $signed(reg25)))));
              reg36 <= wire19;
            end
          reg37 <= $signed(((~^reg31) >> (8'ha3)));
        end
      else
        begin
          reg29 <= (reg31 <<< (({(reg35 ? wire22 : (8'hb1))} ?
              (7'h43) : $signed((-(8'hb9)))) >= (^((reg28 ?
              reg27 : reg27) * ((7'h40) ? wire21 : reg29)))));
          reg30 <= ((reg28[(3'h4):(3'h4)] ?
                  wire20 : (((reg29 ^~ wire19) & reg27) != reg27[(3'h6):(2'h2)])) ?
              reg31[(3'h7):(2'h3)] : (((reg24[(2'h3):(2'h3)] ?
                          $unsigned(reg34) : $unsigned(reg25)) ?
                      ((8'hab) ?
                          reg34[(5'h11):(4'hf)] : {(7'h40)}) : ((|reg31) == reg34)) ?
                  (8'hb8) : reg33[(1'h0):(1'h0)]));
          reg31 <= (^(((reg34 ? wire20[(3'h7):(3'h7)] : wire21[(4'he):(3'h6)]) ?
              $signed((~^reg27)) : $unsigned((reg32 ?
                  wire23 : wire22))) & wire19[(1'h0):(1'h0)]));
          reg32 <= $signed((~|reg31));
          reg33 <= $unsigned(wire22);
        end
      reg38 <= (!(reg31[(3'h5):(3'h5)] ?
          ($unsigned((~&reg25)) ?
              reg29[(4'he):(3'h4)] : {wire19[(3'h5):(2'h2)],
                  reg29}) : {(8'ha0)}));
    end
  assign wire39 = {$signed((~^({(8'hbe)} < (~&wire22)))),
                      (+reg34[(4'hd):(4'h8)])};
  assign wire40 = wire23;
  assign wire41 = wire23[(4'ha):(4'h9)];
  assign wire42 = ((reg33[(2'h2):(2'h2)] ?
                          reg34 : {($signed(wire22) == (reg27 != reg25)),
                              reg27[(2'h3):(2'h3)]}) ?
                      $signed($signed((reg35[(1'h0):(1'h0)] ^~ reg26[(1'h1):(1'h0)]))) : reg27[(1'h1):(1'h0)]);
  assign wire43 = $unsigned($signed((wire40 > $unsigned((!(8'ha7))))));
  assign wire44 = ((wire39 ? reg29[(4'h9):(1'h0)] : reg35[(3'h6):(2'h2)]) ?
                      (($unsigned({wire23,
                          reg25}) ^ (8'hac)) & {((^~reg31) >> (!wire43)),
                          reg33}) : reg30[(3'h4):(1'h1)]);
  assign wire45 = ((^$signed($signed($signed(wire42)))) ?
                      (reg31[(4'hb):(1'h1)] + $signed(reg24[(1'h0):(1'h0)])) : {$signed($unsigned({reg32})),
                          reg34});
  assign wire46 = ($unsigned($signed(reg27[(5'h12):(4'hc)])) >>> ($unsigned($unsigned(reg29)) ?
                      reg29 : reg26[(1'h0):(1'h0)]));
  assign wire47 = (~|(8'hbe));
  assign wire48 = wire43;
  assign wire49 = (~&($signed($signed(((8'hac) ^ reg38))) ^ (~|(^(~^(8'hb9))))));
  always
    @(posedge clk) begin
      reg50 <= wire45[(3'h6):(3'h5)];
      reg51 <= wire49;
      if ($signed($signed($unsigned(reg34[(1'h1):(1'h0)]))))
        begin
          reg52 <= {reg50[(1'h0):(1'h0)], (~^(|reg25))};
        end
      else
        begin
          reg52 <= $unsigned((~&(((+reg50) <= $unsigned(wire42)) | reg34)));
          reg53 <= $unsigned($unsigned(reg24[(1'h1):(1'h1)]));
        end
      reg54 <= wire47;
    end
  assign wire55 = ((8'ha4) ?
                      (($unsigned({reg51}) && {$signed(reg37)}) ?
                          $signed(($signed((8'h9d)) ^ wire21)) : $unsigned(((reg50 ?
                                  reg53 : reg37) ?
                              $unsigned(reg32) : ((8'ha5) ?
                                  reg53 : reg37)))) : $signed(({(wire41 ?
                              reg38 : wire23),
                          $signed(wire20)} << reg26[(1'h0):(1'h0)])));
endmodule

module module100  (y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h37e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire104;
  input wire signed [(2'h3):(1'h0)] wire103;
  input wire signed [(2'h3):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire176;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire164;
  wire signed [(4'h8):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(5'h15):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(4'h9):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire [(5'h14):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire105;
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg167 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg154 = (1'h0);
  reg [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(5'h14):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  assign y = {wire176,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire151,
                 wire150,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire105,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire105 = ($unsigned($unsigned((~^(~&(8'hb0))))) >= $signed((&$unsigned((wire104 ?
                       wire101 : wire101)))));
  always
    @(posedge clk) begin
      reg106 <= $unsigned(($signed(($unsigned(wire104) ?
              (wire102 >= wire102) : wire103)) ?
          (+(!(wire101 || wire102))) : wire101[(3'h5):(1'h1)]));
      if ((~((wire101 ? wire104 : (-$signed(wire105))) ?
          wire104[(3'h7):(1'h0)] : wire102[(2'h2):(1'h1)])))
        begin
          reg107 <= $signed((^~((!$signed(wire103)) ?
              (wire104 | reg106) : ($unsigned(wire101) << (wire105 >>> wire105)))));
        end
      else
        begin
          reg107 <= ((^~$unsigned($signed((reg107 ?
              wire105 : wire104)))) & wire104);
          reg108 <= ($unsigned((8'hb6)) + (wire103[(1'h1):(1'h1)] * $unsigned((^{wire101,
              (8'ha9)}))));
          if (($unsigned(wire103[(1'h1):(1'h1)]) ?
              (|reg108) : $unsigned(($unsigned(wire101[(2'h3):(2'h2)]) ?
                  ({wire102, wire104} >>> {wire104, reg108}) : reg106))))
            begin
              reg109 <= {$unsigned(wire103),
                  $unsigned($unsigned((^$signed(wire102))))};
              reg110 <= (^reg107[(3'h4):(3'h4)]);
              reg111 <= reg110[(5'h14):(3'h4)];
              reg112 <= wire104;
              reg113 <= ($signed(reg112) ^ ($signed(($signed(reg108) ?
                      wire103 : $unsigned((8'haf)))) ?
                  (&$unsigned($signed(reg112))) : ($unsigned($unsigned(wire105)) ?
                      (~&$unsigned(wire104)) : {reg111, (&reg110)})));
            end
          else
            begin
              reg109 <= $unsigned(((~&reg110) + wire105));
              reg110 <= (!$signed((&$unsigned((&reg111)))));
            end
        end
      reg114 <= reg113;
    end
  assign wire115 = {(($signed((reg106 ? (8'hb9) : (8'hb2))) ?
                               $unsigned((&reg113)) : reg112) ?
                           {{reg106, $signed(reg107)},
                               reg111} : reg109[(1'h0):(1'h0)])};
  assign wire116 = {$signed(((((8'hb5) ? wire105 : (8'h9e)) ?
                               (~reg113) : wire105) ?
                           ($signed((8'hac)) || wire101) : (~|reg107))),
                       (+wire115[(1'h0):(1'h0)])};
  assign wire117 = reg110;
  assign wire118 = $unsigned($signed({$unsigned((reg106 ? reg107 : (8'hbd))),
                       (^$signed(reg114))}));
  assign wire119 = ((|wire118) <= $unsigned(reg106));
  assign wire120 = ($signed(reg106) <<< reg114[(4'h8):(3'h5)]);
  assign wire121 = {reg107};
  always
    @(posedge clk) begin
      if (($unsigned(($unsigned($unsigned(reg110)) ~^ ($signed(reg109) ?
          (!wire115) : wire121[(2'h2):(1'h1)]))) >> wire103))
        begin
          reg122 <= {$signed((8'hb2))};
        end
      else
        begin
          if (({reg113[(1'h1):(1'h1)]} ?
              (8'hbb) : (reg107 ?
                  $unsigned($unsigned(reg112[(2'h2):(2'h2)])) : ($unsigned((~|(8'had))) ?
                      (~^wire104[(4'hb):(4'h8)]) : $signed((-(8'ha3)))))))
            begin
              reg122 <= ($unsigned((!$signed(reg114))) ?
                  (+(reg112 ?
                      $signed($signed(reg111)) : ((reg112 ^~ reg112) * wire118))) : (8'ha1));
              reg123 <= (wire105 ?
                  {(8'hab), reg111} : (^(reg110[(4'h8):(2'h3)] ?
                      $signed(wire104) : $unsigned($signed(reg107)))));
            end
          else
            begin
              reg122 <= (~^$unsigned((~^((reg107 ?
                  (8'ha5) : wire104) >>> wire105))));
              reg123 <= ((!reg123[(2'h3):(1'h1)]) == wire103[(2'h3):(1'h1)]);
            end
          reg124 <= (8'hb9);
          if ((reg114[(3'h5):(3'h4)] ^ $unsigned({$unsigned((wire121 ?
                  wire102 : wire118)),
              $unsigned($signed(reg122))})))
            begin
              reg125 <= reg124[(2'h2):(1'h1)];
              reg126 <= wire102[(1'h0):(1'h0)];
              reg127 <= wire116;
              reg128 <= (|wire119[(4'h9):(1'h0)]);
              reg129 <= $unsigned(wire121[(2'h2):(1'h1)]);
            end
          else
            begin
              reg125 <= (wire121 | $unsigned(wire120[(4'h8):(3'h5)]));
              reg126 <= ({{{(8'hbe), (reg125 ? wire117 : wire103)}},
                  (|(~|reg129[(1'h0):(1'h0)]))} <<< ($signed(reg108[(1'h1):(1'h1)]) ^~ (+(reg113[(2'h3):(2'h3)] ?
                  wire120 : (wire104 <<< wire119)))));
              reg127 <= wire104[(5'h11):(4'h8)];
            end
          if (((wire103[(2'h2):(2'h2)] ?
                  {($signed(reg122) | $signed(reg122)),
                      $unsigned((8'hae))} : $unsigned(((reg113 ?
                      (8'hb1) : reg112) * (reg111 != wire117)))) ?
              $signed((-(reg114 ^~ $unsigned(wire115)))) : reg109))
            begin
              reg130 <= ({{(reg112[(1'h0):(1'h0)] ?
                          {(8'had),
                              reg106} : (+reg128))}} << wire120[(1'h0):(1'h0)]);
              reg131 <= (($signed(reg112[(2'h3):(1'h0)]) ?
                      (8'h9d) : (((~reg128) ? (~&wire101) : (8'hb3)) ?
                          ({wire117} ?
                              (wire115 | wire101) : $signed(wire105)) : (~|(reg111 ?
                              (8'hb5) : wire121)))) ?
                  {($unsigned(((8'h9e) >= reg125)) ?
                          reg123[(2'h2):(1'h1)] : $signed($signed(reg125))),
                      ({(wire103 ? reg125 : wire115)} ?
                          (~|{reg114,
                              wire102}) : reg114[(2'h3):(2'h2)])} : $signed((7'h42)));
              reg132 <= reg106;
              reg133 <= {wire102};
              reg134 <= ({wire105,
                  $signed(($signed((8'h9d)) ?
                      reg112 : (reg123 ?
                          wire115 : wire118)))} - wire102[(2'h2):(2'h2)]);
            end
          else
            begin
              reg130 <= {$signed(($signed($unsigned(reg111)) ?
                      ($unsigned(wire102) & (reg132 << wire102)) : reg133[(2'h3):(1'h0)])),
                  (|reg127[(4'hc):(4'h8)])};
              reg131 <= (($signed(reg124[(1'h1):(1'h0)]) ?
                  ({$signed(wire119), (8'ha9)} ?
                      $signed($unsigned(reg131)) : ((reg124 >= (8'hbc)) ?
                          (reg126 || (8'hb1)) : (reg111 << (7'h42)))) : wire105[(1'h1):(1'h1)]) >> ({wire117,
                      {(~^reg132), wire103}} ?
                  (!(8'ha9)) : $unsigned($signed(reg113[(1'h0):(1'h0)]))));
              reg132 <= wire117;
            end
          reg135 <= (({(|reg132[(4'hb):(3'h6)]), $unsigned($unsigned(reg130))} ?
              $unsigned(wire120[(4'h8):(3'h6)]) : reg108[(4'hd):(3'h6)]) >= ({$unsigned((^~reg111)),
              (8'ha7)} ^~ (~&{(reg132 ? (8'hbb) : reg128),
              (reg122 ? reg108 : (7'h41))})));
        end
      if ($signed((~&reg106[(4'hd):(3'h6)])))
        begin
          if (reg131)
            begin
              reg136 <= {wire116[(2'h3):(2'h2)]};
              reg137 <= ($unsigned($signed($signed((wire101 ?
                      reg111 : reg106)))) ?
                  reg111[(4'h9):(3'h7)] : $unsigned(wire103));
              reg138 <= (wire117 ?
                  reg129[(1'h1):(1'h1)] : $unsigned($unsigned(reg113)));
            end
          else
            begin
              reg136 <= $unsigned((reg133 ^ {{$unsigned((8'hb3)), wire119},
                  wire120}));
              reg137 <= ((!reg109[(1'h1):(1'h1)]) <= $unsigned($signed(($signed(reg107) ?
                  wire104[(5'h10):(4'hc)] : reg124))));
              reg138 <= reg131[(3'h5):(1'h0)];
              reg139 <= $unsigned((($unsigned(wire116) ?
                  wire117[(5'h14):(4'hf)] : (~|reg124[(4'ha):(1'h0)])) <= $unsigned($signed((+reg130)))));
            end
          reg140 <= reg128;
        end
      else
        begin
          reg136 <= wire103[(1'h1):(1'h0)];
          reg137 <= $signed($unsigned(reg114));
          reg138 <= ((^reg137[(1'h0):(1'h0)]) ?
              {($signed((wire117 ? (8'hac) : wire105)) ?
                      ((reg106 ? (8'hb6) : reg137) ?
                          reg134[(3'h6):(1'h1)] : reg109) : wire119[(3'h5):(3'h5)]),
                  (-$signed(reg112[(3'h4):(3'h4)]))} : $signed(reg128));
          reg139 <= $unsigned($unsigned((reg114 ?
              $unsigned(wire120) : (~^(!reg140)))));
          reg140 <= (^~(reg113 >= (reg114[(3'h6):(1'h1)] ?
              $unsigned(wire118) : $unsigned((reg122 || reg107)))));
        end
      if (reg106)
        begin
          reg141 <= $unsigned($unsigned($unsigned($signed((~wire118)))));
          if ((+(&(-reg110))))
            begin
              reg142 <= reg130;
            end
          else
            begin
              reg142 <= (($unsigned(reg124[(4'hb):(4'h8)]) >> {$signed(reg127),
                      {$signed(reg132), (reg140 * reg137)}}) ?
                  reg133[(2'h3):(2'h3)] : $signed($signed((^$unsigned(reg128)))));
              reg143 <= ($unsigned($unsigned($signed({reg128}))) * {reg107[(3'h4):(2'h2)]});
              reg144 <= {wire101, ($signed(wire116) < {$signed(wire103)})};
              reg145 <= reg122[(1'h1):(1'h1)];
              reg146 <= reg141[(3'h5):(1'h1)];
            end
          reg147 <= (($signed($unsigned({wire102, reg137})) ?
                  (reg143 ~^ reg140) : $unsigned($unsigned(wire102))) ?
              $signed($unsigned(((reg143 ?
                  reg138 : reg141) - reg112))) : $unsigned(wire121));
          reg148 <= reg145;
        end
      else
        begin
          reg141 <= (reg145 ?
              ($unsigned((((8'hbc) ?
                  wire104 : (8'h9f)) != wire116[(2'h3):(1'h1)])) - reg130[(3'h7):(1'h1)]) : (^~$signed($signed($unsigned(reg133)))));
          if (reg130)
            begin
              reg142 <= ($signed((~^$unsigned(reg112))) ?
                  (reg133 - reg107) : $unsigned(reg108));
            end
          else
            begin
              reg142 <= reg137;
              reg143 <= (({$unsigned(reg129)} != (wire121 || ($signed(reg123) >>> reg114[(3'h6):(3'h6)]))) >>> $unsigned((8'hb2)));
              reg144 <= ((~&(|reg126[(2'h2):(2'h2)])) < reg127[(3'h5):(2'h3)]);
              reg145 <= ((reg144 >> $signed($signed(wire121[(1'h0):(1'h0)]))) ?
                  {reg124[(3'h7):(3'h4)], (-$signed((!reg145)))} : {wire115});
              reg146 <= reg110[(2'h3):(2'h2)];
            end
          reg147 <= (~|$unsigned($signed(reg144[(3'h6):(3'h6)])));
          reg148 <= {($signed(wire101[(2'h2):(1'h0)]) ?
                  (8'hbf) : $signed((~^(~&reg114)))),
              (|($signed(((8'ha5) >>> reg136)) ?
                  ({reg114} ? reg135 : wire101) : reg129))};
        end
      reg149 <= (reg127 <<< ($unsigned($unsigned({reg132})) ?
          ((reg146 ?
              $unsigned(reg123) : (8'hb8)) ^~ (~|$signed(reg148))) : $signed(reg111)));
    end
  assign wire150 = {reg124, reg144};
  assign wire151 = wire116;
  always
    @(posedge clk) begin
      reg152 <= {($unsigned(($unsigned(wire105) == $signed(reg111))) || (({(8'hab),
                  wire103} >>> (reg123 ? reg131 : reg108)) ?
              (reg140[(1'h0):(1'h0)] < (reg144 ?
                  reg125 : reg124)) : $unsigned(reg125)))};
      if ($unsigned((wire101[(1'h1):(1'h0)] ? reg129 : wire115[(1'h1):(1'h1)])))
        begin
          reg153 <= $signed(((($unsigned(wire117) ?
                      reg132[(4'h8):(3'h7)] : $signed(wire150)) ?
                  reg152 : reg129) ?
              ((~&(reg109 ^~ wire115)) ?
                  $unsigned(reg139) : $signed(reg106[(3'h6):(2'h3)])) : {(8'hb1),
                  {$unsigned(reg136), (reg146 ? (8'hb5) : wire102)}}));
          reg154 <= $unsigned(reg109);
        end
      else
        begin
          reg153 <= $unsigned(($unsigned((~|(&reg144))) ?
              reg146 : (({reg131} != {reg129, reg110}) ?
                  ($unsigned(reg132) ?
                      ((8'ha7) ?
                          (8'hb9) : reg133) : reg110) : ($signed(reg123) ?
                      reg124[(3'h5):(2'h2)] : $unsigned(reg136)))));
          reg154 <= {reg126};
          reg155 <= {reg128, reg109[(1'h0):(1'h0)]};
          reg156 <= $unsigned(wire118[(4'hd):(3'h5)]);
        end
      reg157 <= ($unsigned(($unsigned({reg137, (8'hac)}) ?
          ((reg130 ?
              wire104 : wire117) & reg130) : (reg140 ^~ $signed(reg106)))) <<< $unsigned(({(reg141 || wire105),
              (reg155 | wire120)} ?
          reg114 : (|(-(8'ha5))))));
      reg158 <= $unsigned((((~(reg138 ? reg133 : reg114)) ?
          ((wire121 - reg107) << $signed(reg135)) : (reg123[(2'h2):(2'h2)] ?
              wire104 : reg128[(5'h10):(3'h7)])) + $unsigned($unsigned((+(8'hbe))))));
    end
  assign wire159 = $signed((reg149[(4'h8):(3'h7)] ~^ $signed((7'h43))));
  assign wire160 = ({((&(reg146 ? reg136 : reg130)) ?
                           ((!reg135) ?
                               (wire150 ? wire119 : reg133) : (reg114 ?
                                   reg147 : (8'hb0))) : reg149[(4'ha):(3'h7)])} - reg109);
  assign wire161 = reg125[(3'h7):(2'h2)];
  assign wire162 = $unsigned(((-(&reg142)) ?
                       reg141[(2'h2):(1'h0)] : $unsigned(reg110)));
  assign wire163 = $unsigned($signed((^~((&wire118) << (reg152 ?
                       wire160 : reg158)))));
  assign wire164 = $signed(reg111);
  assign wire165 = wire116[(1'h0):(1'h0)];
  assign wire166 = (+wire165);
  always
    @(posedge clk) begin
      if ($unsigned({$signed($signed((reg140 ? reg124 : wire165)))}))
        begin
          reg167 <= reg134[(3'h4):(3'h4)];
        end
      else
        begin
          reg167 <= (~&(-$unsigned(reg140[(3'h6):(2'h2)])));
          if (reg109)
            begin
              reg168 <= reg154[(3'h4):(2'h2)];
            end
          else
            begin
              reg168 <= wire159[(3'h6):(3'h6)];
            end
          reg169 <= {$unsigned($signed(wire163[(1'h0):(1'h0)]))};
          reg170 <= reg146[(1'h0):(1'h0)];
        end
      if ($signed($unsigned((reg167 <<< {wire104,
          (reg124 ? reg112 : reg146)}))))
        begin
          if ((~|(wire161[(4'hb):(3'h6)] ?
              $unsigned(reg141[(3'h6):(1'h0)]) : {(~|wire166[(4'hc):(1'h0)])})))
            begin
              reg171 <= $signed((~&reg122));
              reg172 <= (-$unsigned(reg107[(1'h0):(1'h0)]));
              reg173 <= ((reg130[(3'h5):(2'h3)] ?
                  ((wire165[(3'h6):(3'h6)] ? (reg137 << (7'h41)) : reg148) ?
                      (~|reg133) : reg129) : reg134) >= $unsigned((reg112[(1'h1):(1'h0)] ?
                  $signed($signed(reg141)) : reg157)));
              reg174 <= reg149;
            end
          else
            begin
              reg171 <= (($signed((((8'ha3) ^~ wire162) != $unsigned(wire102))) ?
                  $unsigned(wire150[(1'h1):(1'h0)]) : $signed($unsigned((~&reg172)))) || $unsigned(((~(&wire164)) <= (~&$unsigned(reg133)))));
              reg172 <= wire101;
              reg173 <= ((8'haa) ?
                  $signed($signed(reg138[(3'h4):(3'h4)])) : $signed($unsigned($unsigned(reg126[(1'h1):(1'h1)]))));
              reg174 <= $unsigned((((~|reg139[(1'h0):(1'h0)]) != (reg171[(3'h6):(1'h1)] != wire104)) >> reg130));
            end
        end
      else
        begin
          if ((&reg114))
            begin
              reg171 <= reg132;
              reg172 <= wire121;
              reg173 <= $signed(({$signed(wire160)} ?
                  (wire105[(2'h3):(2'h3)] + reg111[(3'h4):(1'h0)]) : (-wire103[(1'h1):(1'h0)])));
              reg174 <= {reg109};
              reg175 <= reg131;
            end
          else
            begin
              reg171 <= ($signed(reg157) ?
                  reg157 : (-{(~&{reg110, wire164}),
                      ((^wire121) & {wire159, reg155})}));
              reg172 <= $unsigned(($unsigned({(reg157 >= wire162),
                  (~reg136)}) << $signed((((7'h42) ? reg147 : wire115) ?
                  $unsigned(wire101) : (reg122 - reg167)))));
              reg173 <= reg128;
            end
        end
    end
  assign wire176 = (+(+$signed($unsigned({wire118}))));
endmodule
