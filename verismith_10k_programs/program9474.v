module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  assign y = {wire108, wire106, wire5, reg110, reg109, (1'h0)};
  assign wire5 = wire3;
  module6 #() modinst107 (.clk(clk), .wire7(wire4), .y(wire106), .wire9(wire5), .wire10(wire2), .wire8(wire1));
  assign wire108 = $signed($unsigned($unsigned(({wire3, wire106} ?
                       (wire2 << (8'h9e)) : (~^wire2)))));
  always
    @(posedge clk) begin
      reg109 <= $signed($signed((~|((8'hb2) << wire5))));
      reg110 <= wire0;
    end
endmodule

module module6
#(parameter param105 = {{({((8'hba) ? (8'ha9) : (8'hb8)), (&(8'hb6))} + (~&(^(8'ha1)))), ((((8'ha5) ? (8'hb0) : (8'hb7)) != ((8'h9e) ? (7'h44) : (8'ha3))) ? (~(^~(8'h9f))) : ((-(8'ha3)) || {(8'ha9)}))}})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire64;
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire66,
                 wire11,
                 wire12,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire64,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire11 = ($signed({((wire8 ~^ wire8) - (wire7 ? wire9 : wire8)),
                          ((~&wire7) * wire8)}) ?
                      (wire10[(4'h9):(3'h5)] | wire8[(2'h3):(2'h3)]) : wire8[(3'h5):(1'h0)]);
  assign wire12 = $signed(($signed($unsigned((7'h42))) ?
                      (~$signed((wire10 >= wire7))) : $unsigned(({(8'hbf),
                          wire9} * wire7))));
  always
    @(posedge clk) begin
      if ((~|($unsigned($signed($signed(wire11))) << (~^(|(~wire12))))))
        begin
          reg13 <= (|$unsigned($unsigned($signed(wire12[(4'h8):(2'h2)]))));
          if ($signed(({{(wire8 >= wire12), (wire12 << wire8)},
                  $signed((!wire9))} ?
              $unsigned(($signed(wire10) * $unsigned(wire11))) : (7'h40))))
            begin
              reg14 <= wire9;
              reg15 <= (^~$signed(((-reg14) ?
                  $unsigned(wire7) : ((-wire8) ?
                      (wire11 ~^ wire11) : wire11[(4'h8):(1'h1)]))));
              reg16 <= ($signed((({wire10, (7'h41)} ?
                  {reg14,
                      wire8} : (wire7 > (8'hb0))) >> wire7[(3'h5):(3'h5)])) == wire7);
              reg17 <= (|$unsigned((8'ha3)));
            end
          else
            begin
              reg14 <= (($unsigned(reg13) ?
                      ((reg14 < wire8[(3'h4):(3'h4)]) == (&$unsigned(reg17))) : $unsigned($unsigned((wire10 ?
                          wire11 : wire9)))) ?
                  $signed((^($signed(wire9) ?
                      $unsigned(wire11) : reg13))) : wire11);
              reg15 <= $signed($signed($unsigned((^~wire8))));
              reg16 <= reg13;
              reg17 <= (wire12[(4'hd):(4'h8)] ? reg16 : reg16[(4'hd):(4'h9)]);
            end
        end
      else
        begin
          reg13 <= (~|$unsigned(wire9[(3'h6):(3'h4)]));
        end
      if ($signed((wire11 ?
          {(reg15[(3'h5):(2'h3)] >= reg14)} : $signed(reg15[(1'h0):(1'h0)]))))
        begin
          reg18 <= (~^$signed((($signed((8'hbc)) ?
                  (reg16 ? reg14 : wire9) : (reg15 >> wire9)) ?
              $signed($unsigned(wire12)) : (8'ha2))));
          if ($unsigned(wire10))
            begin
              reg19 <= wire11[(1'h1):(1'h0)];
              reg20 <= (-reg15);
              reg21 <= $signed(wire11[(1'h1):(1'h1)]);
            end
          else
            begin
              reg19 <= (~reg14[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg18 <= $signed((+(~&wire10)));
          if ($unsigned($signed($signed(wire8[(2'h2):(2'h2)]))))
            begin
              reg19 <= {(~($unsigned((~^(7'h44))) ?
                      $unsigned({(8'hbe)}) : $signed((reg19 ?
                          reg15 : (8'hba))))),
                  (reg13 > wire12[(1'h1):(1'h0)])};
              reg20 <= (($unsigned((^~$signed(wire11))) ?
                  (&$unsigned(reg15[(2'h2):(1'h1)])) : wire9[(4'h9):(2'h3)]) >= {(8'ha4),
                  wire9[(1'h1):(1'h1)]});
              reg21 <= reg19[(4'h9):(3'h4)];
            end
          else
            begin
              reg19 <= (reg15 ? $unsigned(reg15) : reg18);
            end
          reg22 <= reg19;
        end
      reg23 <= ($signed((reg15 ^~ (^~reg18))) ?
          reg22[(3'h4):(1'h1)] : (((!$signed(wire11)) && $signed((wire8 >= wire12))) ?
              (~(reg17[(3'h7):(2'h2)] > $signed(wire8))) : {($unsigned(reg15) << {wire12}),
                  reg22[(3'h7):(1'h0)]}));
      reg24 <= $unsigned(wire12);
      if ((wire11[(2'h2):(1'h1)] & $unsigned($signed(($signed(wire8) ^ (reg18 ?
          reg14 : reg18))))))
        begin
          reg25 <= ((~|($unsigned((!wire7)) + ($signed(reg23) ~^ (reg13 && (8'ha7))))) | reg22);
          if ($signed($signed($unsigned($unsigned({wire11})))))
            begin
              reg26 <= ((&({{reg22}} ?
                  ({reg13} <<< (reg15 ?
                      reg17 : reg21)) : $unsigned({reg17}))) < ($signed(reg13) <<< (8'h9c)));
            end
          else
            begin
              reg26 <= $signed(wire10[(3'h7):(3'h4)]);
            end
          reg27 <= (((-(reg16[(3'h6):(3'h4)] ? (+reg15) : $signed(reg15))) ?
              ($signed(wire10) << reg24) : $unsigned($signed((reg26 < (8'haa))))) >= (wire9 >= wire12));
          reg28 <= ($signed(wire9[(4'hd):(4'h9)]) ?
              (^~(+$signed($unsigned(wire9)))) : {wire8[(1'h1):(1'h1)]});
          reg29 <= $signed({(8'hb5),
              (((^wire7) ? {(8'ha5), (8'h9d)} : $signed(reg17)) & wire10)});
        end
      else
        begin
          reg25 <= (|((~reg20) ?
              reg20 : (reg20 ?
                  ((reg23 ? reg28 : reg16) ? $signed(wire8) : reg23) : reg17)));
          if (wire11[(3'h4):(3'h4)])
            begin
              reg26 <= $unsigned((~&reg27[(5'h13):(1'h1)]));
              reg27 <= (reg25[(2'h2):(1'h0)] ^~ reg27[(5'h11):(4'h9)]);
              reg28 <= (8'hb6);
              reg29 <= $unsigned($signed(wire11[(4'hb):(3'h7)]));
            end
          else
            begin
              reg26 <= (~reg24);
              reg27 <= wire12[(2'h2):(1'h0)];
            end
          reg30 <= $unsigned(wire11);
          reg31 <= {$signed($unsigned(reg27)),
              ((8'hb5) ?
                  reg22 : (&((reg21 ? (8'h9d) : reg17) ?
                      (8'hb9) : (wire9 ? reg24 : reg25))))};
          reg32 <= ((8'h9f) ^ ($signed($signed(reg18)) ?
              (^$unsigned((reg30 ? reg29 : wire12))) : ($unsigned((reg14 ?
                  wire10 : reg23)) <<< (~^$unsigned(wire8)))));
        end
    end
  assign wire33 = (($unsigned($signed($signed(wire11))) ~^ reg32[(4'hc):(1'h0)]) ?
                      {(reg21 ?
                              $unsigned(reg21[(2'h3):(2'h3)]) : (~|$signed(reg27)))} : ((((^reg21) ^ (8'hac)) ?
                          (~reg18[(3'h7):(3'h4)]) : ({reg31} >>> reg22[(1'h1):(1'h0)])) << $signed((reg24[(4'he):(4'hd)] ?
                          $signed((8'hb6)) : (reg18 < reg31)))));
  assign wire34 = {((reg31 ?
                          ({reg28, wire11} ?
                              (!reg32) : reg25[(2'h3):(1'h1)]) : ($signed(reg21) ?
                              wire10 : (8'ha6))) != ($signed({wire12,
                          reg13}) - reg27[(4'h9):(4'h9)])),
                      wire8[(3'h4):(1'h0)]};
  assign wire35 = reg23;
  assign wire36 = reg17[(1'h0):(1'h0)];
  assign wire37 = reg30[(3'h4):(2'h2)];
  module38 #() modinst65 (.y(wire64), .wire40(wire35), .wire41(wire8), .wire39(reg26), .wire42(wire7), .clk(clk));
  assign wire66 = reg32;
  always
    @(posedge clk) begin
      reg67 <= {reg27,
          $signed(((reg24[(4'he):(2'h3)] && wire34[(2'h2):(2'h2)]) ?
              $unsigned((~&wire11)) : reg32))};
      reg68 <= ((reg28 <= $signed(reg30)) ~^ (^~{reg67[(3'h6):(3'h6)], reg28}));
    end
  module69 #() modinst96 (wire95, clk, wire35, reg24, wire34, reg31, reg30);
  assign wire97 = reg27[(3'h5):(1'h0)];
  assign wire98 = $signed(wire97[(2'h3):(1'h0)]);
  assign wire99 = $signed(wire97);
  assign wire100 = (-reg24);
  assign wire101 = ($unsigned({reg25[(2'h3):(2'h3)], reg24[(2'h3):(1'h1)]}) ?
                       ((((wire36 != reg31) ?
                               $unsigned(wire97) : (wire34 * wire66)) ?
                           reg14 : (wire37 ?
                               $signed(wire98) : (wire33 >= wire8))) ~^ $unsigned($signed(reg25[(1'h1):(1'h0)]))) : $unsigned($unsigned((~(wire8 ?
                           reg25 : reg20)))));
  assign wire102 = $signed((wire34 ?
                       reg32 : {reg20[(3'h7):(3'h6)],
                           {(^~wire33), $signed(reg32)}}));
  assign wire103 = ((^~$unsigned(($unsigned(wire12) ?
                           (&reg13) : $signed(wire36)))) ?
                       (!(~&(wire12[(2'h2):(2'h2)] > (reg30 ?
                           (8'hb9) : wire33)))) : ($signed(((^(8'hac)) ?
                           (-wire97) : (wire7 ?
                               wire7 : reg16))) <<< $signed($unsigned((wire101 ?
                           (8'hbf) : wire100)))));
  assign wire104 = (~^$signed({(~^reg68), $signed({reg16})}));
endmodule

module module69  (y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire74;
  input wire [(3'h6):(1'h0)] wire73;
  input wire [(4'h8):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(5'h12):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(4'h9):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire75 = (!wire73);
  assign wire76 = $signed($unsigned(((wire75[(5'h10):(2'h3)] ?
                          $unsigned(wire74) : $unsigned(wire74)) ?
                      wire73 : $signed($signed(wire75)))));
  assign wire77 = wire72[(1'h1):(1'h0)];
  assign wire78 = $signed((wire71 ~^ ({(wire76 <= wire76)} ?
                      $unsigned((+wire71)) : (~&wire76))));
  always
    @(posedge clk) begin
      if (((+{(|(wire72 ? wire74 : wire74))}) <<< ($unsigned(($signed((8'hba)) ?
              (wire76 > wire72) : wire71)) ?
          wire77[(4'h8):(3'h4)] : (-(^~(wire71 ? wire70 : (8'ha4)))))))
        begin
          reg79 <= ($signed(({wire75} < $signed((wire72 ? wire77 : wire71)))) ?
              $signed($unsigned($signed($signed(wire78)))) : wire77);
          if (wire70[(2'h3):(2'h2)])
            begin
              reg80 <= (($signed((+wire74[(1'h1):(1'h0)])) ?
                      (-wire75[(4'h8):(3'h4)]) : (+((wire70 ? wire76 : wire74) ?
                          $signed(wire76) : (wire77 ? wire73 : wire75)))) ?
                  wire75 : ($unsigned($signed($signed(wire70))) * {((wire76 ?
                              wire77 : wire77) ?
                          wire70 : $unsigned(wire77)),
                      (|(~|wire72))}));
              reg81 <= (&({(8'hb8)} ?
                  (wire76 ?
                      wire77[(4'ha):(4'h9)] : {(^wire71)}) : (($signed(wire71) == (wire77 ?
                          wire70 : wire71)) ?
                      ((wire73 || wire75) >> (^reg79)) : {wire70[(2'h3):(1'h0)]})));
              reg82 <= {(|$unsigned((~^(^reg80))))};
              reg83 <= $signed(wire74);
            end
          else
            begin
              reg80 <= reg83;
              reg81 <= ((reg82[(2'h2):(1'h0)] ^~ $signed($signed((wire72 > reg82)))) ?
                  wire71 : ($signed($signed(reg80)) ?
                      reg82[(4'h9):(4'h8)] : (~&$signed($unsigned(wire78)))));
              reg82 <= wire71;
            end
          reg84 <= (reg81[(4'h8):(1'h1)] * $signed((({(7'h42), reg81} ?
                  wire74[(1'h0):(1'h0)] : (reg79 != wire72)) ?
              ({wire78, reg79} - (wire73 ^ wire76)) : (~|(wire73 < reg79)))));
        end
      else
        begin
          reg79 <= reg79;
          if (wire73)
            begin
              reg80 <= reg84[(4'h8):(2'h2)];
              reg81 <= $signed(wire71[(3'h5):(1'h0)]);
            end
          else
            begin
              reg80 <= $signed($signed({$unsigned(reg79[(3'h5):(1'h1)]),
                  (|(~wire76))}));
            end
          reg82 <= $unsigned(($signed($signed($unsigned((8'ha3)))) ?
              wire75[(1'h1):(1'h1)] : (wire71[(2'h3):(1'h0)] * $unsigned($signed(reg79)))));
          if (({({$unsigned(wire74), (~wire73)} ^ wire71[(3'h5):(2'h3)]),
                  ((~$signed(reg80)) ? (8'ha3) : $signed($unsigned(wire73)))} ?
              (8'hbb) : $signed(((wire76[(3'h7):(2'h3)] <= (~&wire77)) ?
                  wire75[(4'h8):(4'h8)] : (reg79[(3'h4):(1'h0)] ?
                      reg84[(3'h4):(1'h0)] : (8'h9e))))))
            begin
              reg83 <= $unsigned(reg83);
              reg84 <= $signed((wire73 ?
                  ((^((8'hbc) ?
                      wire77 : wire78)) ^~ reg84[(1'h0):(1'h0)]) : (8'hbf)));
              reg85 <= {($signed(($signed(wire78) >>> wire71)) != $signed(((wire74 ?
                          (8'ha6) : wire74) ?
                      $signed(reg79) : $unsigned(wire76)))),
                  $signed(wire72[(3'h4):(1'h1)])};
            end
          else
            begin
              reg83 <= (+(((!wire73[(3'h4):(1'h0)]) >> ({wire75, reg84} ?
                      $unsigned(wire73) : $unsigned(reg81))) ?
                  $unsigned($unsigned((wire72 & reg82))) : (~|$signed(wire76))));
            end
        end
      reg86 <= wire75;
      reg87 <= $signed({wire70, $unsigned((~^wire71))});
    end
  assign wire88 = reg79[(1'h0):(1'h0)];
  assign wire89 = (!$signed(wire72[(2'h2):(1'h1)]));
  assign wire90 = (~^{(~|((wire71 ~^ reg87) != $signed((8'hbd))))});
  assign wire91 = wire72;
  assign wire92 = reg85[(4'h8):(1'h1)];
  assign wire93 = reg85[(4'hb):(3'h4)];
  assign wire94 = wire77[(2'h2):(1'h1)];
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire43 = $signed($unsigned((($unsigned((8'hab)) ?
                          (wire39 & wire42) : (~|wire39)) ?
                      (wire39[(4'hc):(3'h7)] && (wire42 ?
                          wire40 : wire42)) : (7'h42))));
  assign wire44 = $unsigned((((~&(~|wire40)) ?
                          ($unsigned(wire42) ?
                              (wire39 ?
                                  wire41 : wire42) : wire39[(4'ha):(3'h4)]) : (7'h41)) ?
                      $unsigned($signed((wire39 ?
                          wire40 : (8'hac)))) : (($signed(wire40) >> (wire41 ?
                          wire39 : wire41)) <= ($unsigned(wire43) ~^ $signed(wire41)))));
  assign wire45 = wire40;
  assign wire46 = ($signed((!((wire39 + wire45) ?
                          (wire42 ? wire41 : wire43) : $unsigned(wire41)))) ?
                      (((^~$signed(wire44)) ?
                              (wire42 ?
                                  (&wire45) : (wire43 ?
                                      wire44 : (8'haf))) : ((|(8'hb3)) ^~ $unsigned(wire41))) ?
                          ((((8'h9e) && wire45) ?
                              wire42[(3'h6):(2'h3)] : $unsigned(wire42)) != wire44[(1'h1):(1'h1)]) : (wire39 >= ((wire42 ?
                                  wire44 : wire43) ?
                              wire43 : (wire43 ?
                                  wire44 : wire39)))) : (|$unsigned(wire41)));
  assign wire47 = $signed(wire43);
  always
    @(posedge clk) begin
      reg48 <= wire41[(4'he):(2'h3)];
      reg49 <= (wire46[(4'h8):(3'h4)] ^ $signed($unsigned($unsigned($signed(wire44)))));
      if (reg48[(3'h4):(2'h2)])
        begin
          if ({(wire42 ?
                  reg49 : ($unsigned(reg49[(3'h5):(2'h3)]) ?
                      (wire46 ^~ $signed(wire46)) : ($signed(wire40) >>> ((8'hbd) >> (8'hb8))))),
              (~|reg48)})
            begin
              reg50 <= wire40[(3'h7):(2'h2)];
              reg51 <= $unsigned($signed(wire46[(4'hc):(1'h1)]));
              reg52 <= $unsigned($signed((($signed(reg51) ?
                  $signed((8'ha9)) : ((8'hb2) ?
                      reg50 : wire44)) == $unsigned((reg51 ^ (8'h9f))))));
              reg53 <= (&(reg48[(3'h5):(1'h1)] == $unsigned(reg52[(4'hd):(1'h0)])));
            end
          else
            begin
              reg50 <= $unsigned({{$signed((reg49 ? reg49 : reg50)),
                      ($signed((8'hbb)) <<< (reg49 ? (8'hb1) : reg50))}});
              reg51 <= wire45[(2'h3):(1'h0)];
              reg52 <= {$signed(($signed((~^wire42)) && (~$signed(reg50))))};
            end
          reg54 <= $signed((^~$signed((~&(wire44 ? reg49 : reg51)))));
        end
      else
        begin
          if (wire45[(2'h2):(2'h2)])
            begin
              reg50 <= (~reg48[(4'ha):(2'h3)]);
              reg51 <= (~^$signed((wire41 ?
                  $unsigned((~&wire41)) : reg54[(3'h4):(3'h4)])));
              reg52 <= $unsigned(wire45);
              reg53 <= wire39;
              reg54 <= ((^$unsigned($signed(reg51[(3'h4):(1'h1)]))) ?
                  $signed(reg49) : {($signed(wire45[(3'h5):(3'h5)]) ?
                          (-wire47[(4'hc):(1'h1)]) : wire44)});
            end
          else
            begin
              reg50 <= {{(8'ha6)}, $unsigned((|(8'hab)))};
            end
          reg55 <= (+$unsigned($signed(((!reg51) ?
              (wire44 ? reg48 : wire41) : $signed(reg52)))));
        end
    end
  always
    @(posedge clk) begin
      reg56 <= ((($unsigned(reg54[(2'h3):(2'h2)]) ?
          (|$unsigned(reg54)) : $signed(reg52)) * (!$signed(((7'h43) ?
          reg50 : (8'haa))))) >= ((({wire44} ?
                  $unsigned(wire47) : $unsigned(wire42)) ?
              $unsigned($signed(reg48)) : (~(wire46 ? reg54 : (8'ha3)))) ?
          reg55[(4'h8):(3'h7)] : $signed((~&wire40[(1'h0):(1'h0)]))));
      reg57 <= (~(wire39[(4'hf):(3'h4)] ?
          {(|$signed(reg51)), $unsigned((reg53 ? reg48 : wire47))} : {wire46}));
      if ((((reg57 ? (7'h44) : $signed((reg53 ^ reg54))) ?
          (~(&{(8'hb7),
              reg54})) : wire39[(4'hc):(4'h8)]) ^ wire46[(1'h1):(1'h0)]))
        begin
          reg58 <= wire45[(1'h1):(1'h0)];
          reg59 <= $signed(wire47);
          reg60 <= $unsigned(wire46);
          reg61 <= $unsigned((reg60 ? (~wire42) : (8'hab)));
          reg62 <= $signed($signed($signed((^$unsigned(reg51)))));
        end
      else
        begin
          if ((reg61[(4'hf):(2'h2)] && $unsigned($unsigned(($signed(reg52) ?
              reg57[(3'h7):(2'h3)] : reg58[(3'h4):(1'h1)])))))
            begin
              reg58 <= $unsigned(wire45);
            end
          else
            begin
              reg58 <= $signed((reg58[(3'h6):(3'h4)] + reg59));
            end
          reg59 <= ($unsigned($unsigned($unsigned((8'hbc)))) && (+(^$signed($unsigned(reg58)))));
          reg60 <= $unsigned(reg49[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg63 <= {reg50[(3'h7):(1'h1)]};
    end
endmodule
