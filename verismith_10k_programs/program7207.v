module top
#(parameter param106 = (({({(8'ha9), (7'h43)} ~^ (~&(8'ha4))), (((8'hbb) ? (8'had) : (8'hac)) <= ((8'h9c) << (8'had)))} ? (8'hb1) : ((8'haf) ? (((8'hb7) ? (7'h42) : (8'haa)) & ((8'hb7) >= (8'hb1))) : (((8'hb1) ? (8'h9c) : (8'hb5)) ? {(7'h41)} : (~(8'ha9))))) ? (((+(~(8'hbd))) ? (8'ha0) : (^~((8'h9f) || (7'h41)))) ^~ {{((8'hab) ? (8'h9f) : (8'haa))}, (((8'ha4) > (7'h42)) ? {(8'haa), (8'hab)} : ((8'hb6) <= (7'h41)))}) : (((+((8'h9d) <<< (8'ha5))) ? (((8'had) ? (8'hbc) : (8'ha4)) <<< ((8'hba) < (8'hb5))) : (+((8'hb4) != (8'hb4)))) | (({(8'h9d), (8'hb8)} & {(8'hac)}) <= (-{(8'ha8), (8'ha5)})))), 
parameter param107 = (~((((+param106) <<< param106) ? ((param106 == param106) ? (param106 << param106) : (param106 > param106)) : {(7'h40), (8'hae)}) + param106)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire102;
  assign y = {wire105,
                 wire104,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire102,
                 (1'h0)};
  assign wire5 = ((^(^wire3)) >= wire1);
  assign wire6 = (!$unsigned((wire0[(3'h5):(1'h0)] ?
                     ($signed(wire0) + (-wire4)) : wire4)));
  assign wire7 = wire4[(2'h2):(1'h0)];
  assign wire8 = {$unsigned($signed((^~wire1)))};
  assign wire9 = wire1;
  assign wire10 = wire9[(1'h1):(1'h0)];
  assign wire11 = (wire0 ? wire9[(4'hb):(4'hb)] : (-(8'ha8)));
  assign wire12 = ((($signed(wire9[(4'h9):(1'h1)]) ^ wire9[(2'h3):(2'h2)]) < ({(wire6 << wire8),
                              (8'hba)} ?
                          wire0 : (~|((8'ha3) ? (7'h44) : wire10)))) ?
                      wire2[(3'h5):(1'h1)] : $unsigned((+wire2)));
  module13 #() modinst103 (wire102, clk, wire5, wire7, wire1, wire6, wire0);
  assign wire104 = wire9[(3'h6):(1'h0)];
  assign wire105 = {($unsigned((&wire2)) ~^ ((wire12[(3'h4):(1'h0)] ?
                           wire8 : wire11) << wire12)),
                       (^(!(+wire5)))};
endmodule

module module13
#(parameter param100 = (|(^~((((8'hb3) | (7'h40)) & ((8'hac) ^~ (8'h9c))) || (((8'h9f) ? (8'h9f) : (8'haf)) & ((8'haf) ? (8'hba) : (8'ha1)))))), 
parameter param101 = ((~((~&param100) + (param100 ? param100 : ((8'hb5) ^~ param100)))) || ((((param100 >>> param100) != {param100, param100}) & {(param100 <<< param100), (param100 ? param100 : param100)}) >> ({(&param100)} ? ((param100 + param100) ? {param100} : (param100 ? param100 : (8'ha0))) : (^param100)))))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire81;
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire42,
                 wire44,
                 wire45,
                 wire81,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire19 = (~$signed((!(~$unsigned(wire14)))));
  assign wire20 = {wire15[(3'h6):(1'h0)],
                      ((($unsigned(wire19) < (wire14 ?
                          wire15 : wire18)) == (~(wire17 ?
                          wire16 : wire16))) <<< {(+wire16),
                          ((wire15 ? wire16 : (8'ha6)) ?
                              (!wire18) : $signed(wire17))})};
  assign wire21 = {$signed(((&(8'ha8)) != ((wire19 ? (8'hb4) : wire20) ?
                          (wire19 >> wire18) : wire20))),
                      (($signed($signed(wire18)) ?
                          $unsigned({wire20}) : (wire14[(4'hf):(3'h7)] ^ ((8'had) >> wire14))) || $signed(wire17))};
  assign wire22 = ((wire16[(4'hd):(3'h5)] ^ (~^((wire14 - wire21) ?
                      $unsigned(wire19) : (|wire17)))) ~^ $unsigned((((wire20 ?
                              wire16 : wire15) ?
                          (wire20 >> wire21) : {wire21, wire14}) ?
                      $signed($signed((8'h9f))) : (~|(wire19 ?
                          wire21 : wire17)))));
  assign wire23 = wire22[(3'h4):(3'h4)];
  assign wire24 = wire16[(3'h6):(3'h5)];
  assign wire25 = (+$unsigned(wire14));
  assign wire26 = ($signed((($unsigned((8'hb4)) > (wire14 < wire24)) == $signed($signed(wire17)))) >= ($unsigned((~(wire16 << wire24))) >= wire14[(3'h6):(2'h2)]));
  module27 #() modinst43 (.y(wire42), .wire28(wire24), .wire30(wire26), .wire31(wire23), .wire29(wire25), .clk(clk));
  assign wire44 = wire16[(2'h2):(2'h2)];
  assign wire45 = (((|(^(~wire26))) | (&wire24[(3'h6):(2'h3)])) ?
                      $unsigned(wire23[(1'h0):(1'h0)]) : $signed((~^$signed((wire44 | wire26)))));
  module46 #() modinst82 (wire81, clk, wire19, wire18, wire23, wire44, wire15);
  always
    @(posedge clk) begin
      if (((wire23[(3'h7):(2'h2)] <= $signed((~^$signed(wire20)))) ?
          ($unsigned(wire19[(3'h4):(2'h3)]) != (~&((wire20 && wire81) && $signed((8'ha8))))) : $unsigned({{$unsigned((8'hbc))}})))
        begin
          if (wire20)
            begin
              reg83 <= (^~($signed($unsigned({wire17})) * ({$signed(wire21),
                      $signed(wire44)} ?
                  ($signed(wire15) ?
                      (wire42 >> wire15) : (wire81 <= wire17)) : (8'ha2))));
              reg84 <= (|wire81[(1'h1):(1'h1)]);
              reg85 <= $unsigned((-$unsigned(wire26[(4'h8):(3'h5)])));
            end
          else
            begin
              reg83 <= $unsigned($signed({(wire23 ? wire17 : (7'h44))}));
              reg84 <= (~^((wire16[(1'h0):(1'h0)] ^~ ($signed(wire21) - {wire21})) ?
                  ((^~(&wire26)) ~^ $unsigned($unsigned(wire45))) : wire26[(5'h10):(5'h10)]));
            end
          reg86 <= $unsigned(({(^~wire15)} ?
              wire23[(1'h0):(1'h0)] : ((&(wire45 ? (8'hba) : wire20)) ?
                  (|(8'ha4)) : (~(8'ha0)))));
          reg87 <= (wire23 > wire16);
          reg88 <= (&$unsigned((8'had)));
          reg89 <= {(8'ha7)};
        end
      else
        begin
          reg83 <= (!($signed($signed($unsigned(wire22))) ?
              {(wire23 << (|wire15))} : (((~|reg87) >= wire25[(3'h5):(2'h3)]) ?
                  (~|(-wire22)) : wire21)));
          reg84 <= (|$unsigned(($signed((wire26 ?
              wire23 : (8'hb6))) ~^ $signed(reg86))));
        end
      reg90 <= reg87;
      reg91 <= (wire14 ^~ wire21[(1'h0):(1'h0)]);
      reg92 <= wire26;
      reg93 <= (!reg86[(3'h7):(2'h3)]);
    end
  assign wire94 = $unsigned((8'hab));
  assign wire95 = wire22;
  assign wire96 = (~|wire22);
  assign wire97 = $unsigned($unsigned({(^~$signed(reg87))}));
  assign wire98 = $signed(wire24[(4'h8):(4'h8)]);
  assign wire99 = (($signed($unsigned(wire25)) == (wire97[(5'h13):(4'ha)] == {reg86,
                      wire20[(1'h0):(1'h0)]})) & $unsigned($signed(reg86[(4'hd):(3'h7)])));
endmodule

module module46
#(parameter param80 = ((^(7'h41)) != (&({((7'h40) ? (8'hb5) : (8'hb9))} ? (((8'hab) ? (8'hac) : (7'h43)) ? (+(8'hb6)) : ((8'hb3) ^~ (8'had))) : (((8'hb1) != (7'h44)) || ((8'hb7) ? (8'ha2) : (8'hac)))))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire51;
  input wire [(5'h11):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(5'h10):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(5'h13):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg58 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire71,
                 wire60,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire52 = wire49;
  assign wire53 = $unsigned($signed($signed($unsigned({wire49, (7'h41)}))));
  assign wire54 = (((($unsigned(wire53) > wire48) >> ($signed((8'ha8)) || $signed(wire51))) ?
                          $signed(((8'ha4) ?
                              wire50[(4'he):(2'h3)] : (!wire49))) : (|({wire51,
                                  wire47} ?
                              wire53 : (wire51 ? wire47 : wire47)))) ?
                      (wire49[(3'h7):(3'h4)] ?
                          wire50[(5'h11):(2'h2)] : wire51) : $signed(wire47));
  assign wire55 = $signed($signed(((~&(wire50 ? wire49 : wire54)) ?
                      $unsigned(((8'hbd) ~^ (8'h9c))) : $unsigned(wire52))));
  assign wire56 = ($signed({wire49}) * ($unsigned((!{wire52})) >> $signed({wire55,
                      {wire55}})));
  assign wire57 = (8'hb0);
  always
    @(posedge clk) begin
      reg58 <= ($unsigned($signed(($unsigned(wire54) | wire57[(4'hd):(3'h6)]))) ~^ $signed({((wire56 - wire52) ?
              wire48 : {wire56, wire56}),
          ((|wire48) ? wire49 : (wire51 + wire52))}));
      reg59 <= (^wire56[(1'h1):(1'h1)]);
    end
  assign wire60 = $signed(($signed(wire49) >>> {wire50,
                      $signed((wire57 > reg58))}));
  always
    @(posedge clk) begin
      if (reg59)
        begin
          reg61 <= wire56[(2'h2):(1'h1)];
          if ($signed((&{$unsigned({wire55, (8'ha5)}), (^~wire52)})))
            begin
              reg62 <= (8'ha0);
              reg63 <= $signed($signed(($unsigned(wire52) <= reg61[(2'h2):(1'h0)])));
            end
          else
            begin
              reg62 <= $signed(({((7'h42) ? (wire51 < reg58) : $signed(wire49)),
                      wire50} ?
                  ((+wire51) ?
                      $signed(reg61[(3'h5):(2'h3)]) : ($signed((7'h43)) ?
                          (wire51 + wire56) : (wire53 ?
                              wire55 : wire54))) : $signed({(~(8'hb0)),
                      (wire53 >>> reg62)})));
              reg63 <= (reg61[(3'h4):(1'h1)] ?
                  wire47[(4'hb):(3'h5)] : ((wire51 ? wire47 : wire51) ?
                      (^~((reg62 ^ reg63) ?
                          wire49 : (reg59 ?
                              wire57 : wire48))) : $unsigned(wire48[(3'h4):(3'h4)])));
              reg64 <= wire56;
            end
          if ((8'h9d))
            begin
              reg65 <= (~$signed((~|(!(&reg59)))));
              reg66 <= ((8'hb0) ?
                  wire48[(3'h7):(3'h7)] : reg65[(5'h13):(5'h12)]);
              reg67 <= ($unsigned((8'hb8)) & (^~((reg59 ?
                      (wire47 || wire55) : (^(8'had))) ?
                  wire56 : (8'hba))));
            end
          else
            begin
              reg65 <= $unsigned($signed((wire49 - {reg61})));
              reg66 <= (($signed(reg65[(5'h11):(3'h5)]) ?
                      $signed(reg61) : $signed(({(8'ha3), wire51} ?
                          (wire48 < wire50) : ((8'h9e) >> wire47)))) ?
                  (($signed((reg58 ? wire54 : reg62)) ?
                          (reg63[(1'h0):(1'h0)] + reg63) : $unsigned({wire52,
                              reg64})) ?
                      {$signed(((7'h44) ? reg65 : wire54)),
                          (((7'h40) <<< wire48) ?
                              (^~(8'h9f)) : reg63)} : ({(^~(8'hab))} <= reg64[(4'he):(2'h2)])) : $unsigned($unsigned($signed(((8'hbc) + wire50)))));
            end
        end
      else
        begin
          if ((($signed($signed($signed(wire47))) ?
                  ($signed($signed(reg63)) ?
                      $unsigned($signed(reg65)) : reg61) : ((~&(8'h9c)) ^ reg65)) ?
              $signed((((reg67 & reg65) && ((8'haf) - (8'haa))) ?
                  $signed((reg62 ?
                      reg58 : wire49)) : (^(^~reg65)))) : (~&reg66)))
            begin
              reg61 <= wire49[(2'h2):(1'h0)];
              reg62 <= wire53;
              reg63 <= reg62;
            end
          else
            begin
              reg61 <= reg61[(3'h5):(3'h4)];
            end
        end
      reg68 <= reg59[(3'h7):(2'h3)];
      reg69 <= $signed(wire49[(3'h6):(3'h6)]);
      reg70 <= {((reg61 >> ((wire51 ?
              wire53 : reg62) + $unsigned(wire53))) <<< {(|(^~reg59))})};
    end
  assign wire71 = $signed($signed((($unsigned(reg62) ?
                          (wire56 ? reg66 : wire54) : $unsigned(wire60)) ?
                      (8'hb9) : $signed($signed((8'hac))))));
  assign wire72 = ($signed($signed({(wire57 | wire52),
                      (wire60 ? reg66 : reg65)})) > reg69);
  always
    @(posedge clk) begin
      reg73 <= (^(~$unsigned(($signed(wire47) ? $unsigned(reg70) : (+reg65)))));
      reg74 <= (+{$unsigned(((^~(8'had)) ?
              ((8'hbd) ? (8'hb5) : (8'ha4)) : reg62[(3'h7):(2'h2)]))});
      reg75 <= (({reg69, $signed((~&reg65))} ?
              $unsigned(wire48[(3'h5):(3'h5)]) : (-$unsigned((wire51 ?
                  reg66 : reg74)))) ?
          $unsigned($unsigned($unsigned((reg63 ?
              wire71 : wire47)))) : {($signed((reg58 + (8'hb1))) ?
                  $unsigned($signed(reg74)) : ((wire51 ~^ reg69) <<< wire49[(3'h6):(1'h1)]))});
      reg76 <= wire48[(3'h6):(2'h2)];
    end
  assign wire77 = ((+$signed(wire53)) <= reg67[(4'hb):(4'h8)]);
  assign wire78 = wire49;
  assign wire79 = $signed(((reg65[(5'h15):(5'h11)] ?
                          $unsigned((wire51 ?
                              (8'hb3) : reg58)) : ($unsigned(reg66) >= (+wire49))) ?
                      wire47[(5'h10):(2'h2)] : wire57[(3'h7):(3'h7)]));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire31;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire signed [(3'h7):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = wire29[(3'h6):(1'h0)];
  assign wire33 = wire30[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg34 <= wire31;
      reg35 <= $signed(reg34[(1'h0):(1'h0)]);
    end
  assign wire36 = (!(~&$signed($unsigned($signed(wire33)))));
  assign wire37 = ((($unsigned((reg34 ? (8'hb8) : wire28)) ?
                      $unsigned({reg35}) : $unsigned($unsigned((8'ha9)))) >>> (~reg34[(1'h0):(1'h0)])) * reg35);
  assign wire38 = $unsigned(wire29[(4'hb):(3'h7)]);
  assign wire39 = (wire33 ?
                      (^~(($signed(wire29) ?
                              $unsigned(reg35) : (wire37 ^ (8'ha8))) ?
                          wire32 : $unsigned($unsigned(wire37)))) : {reg35});
  assign wire40 = (8'h9e);
  assign wire41 = wire30;
endmodule
