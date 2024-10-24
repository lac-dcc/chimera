module top
#(parameter param155 = {(({(-(8'ha7)), (~(8'ha3))} >> {((8'ha6) >>> (8'hbd))}) ? ((~((8'hab) ^~ (8'hac))) + (((8'hac) || (8'hbd)) ^ ((8'ha1) ? (7'h40) : (8'hbb)))) : ((8'ha8) && ((~^(7'h41)) < ((8'hb4) > (8'had))))), (^(~&(^((8'hbc) ? (8'hae) : (8'hb1)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire149;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire149,
                 wire65,
                 wire64,
                 wire43,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire13,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg154,
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
                 reg47,
                 reg46,
                 reg45,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire4 = {$signed((((wire0 <<< wire3) == $unsigned(wire2)) >= wire0)),
                     wire2[(2'h3):(2'h3)]};
  assign wire5 = $signed($signed((8'hb7)));
  assign wire6 = ({$unsigned(($signed(wire0) ?
                             $unsigned(wire3) : {wire5, wire1}))} ?
                     ((wire3 > ($signed(wire2) ?
                         $signed((8'ha4)) : {wire4,
                             wire5})) || (($unsigned(wire2) ?
                         (~^wire1) : $signed(wire1)) ^ {(wire4 ? wire0 : wire3),
                         $unsigned(wire4)})) : (|wire4));
  assign wire7 = wire6;
  always
    @(posedge clk) begin
      reg8 <= (!$signed(wire0[(3'h4):(2'h2)]));
      reg9 <= $unsigned($signed((~(8'hb9))));
      reg10 <= (~&((8'had) ?
          $signed(((reg8 ? wire7 : (8'ha5)) != wire4)) : (^~$signed(wire5))));
      reg11 <= reg8[(3'h4):(2'h2)];
      reg12 <= $signed((+{((reg11 ? wire7 : wire5) ?
              (reg11 ? reg8 : reg9) : (reg10 << wire7))}));
    end
  assign wire13 = $unsigned({wire3[(1'h1):(1'h1)],
                      ((reg11 ~^ (reg9 ? reg9 : reg11)) ?
                          wire4[(3'h4):(1'h0)] : {$unsigned(wire3)})});
  always
    @(posedge clk) begin
      reg14 <= ({(wire2[(2'h3):(1'h1)] > {(wire1 ? wire1 : (8'hac)),
              wire1[(5'h11):(4'he)]}),
          wire5[(4'he):(4'hd)]} ^ $signed({$unsigned($unsigned((8'haa))),
          ($signed((8'hb7)) ~^ $signed(reg10))}));
      if ((((wire1[(2'h2):(1'h0)] ?
                  $signed($unsigned(reg12)) : (wire13[(3'h6):(2'h3)] ?
                      reg8 : ((8'hac) ^~ (8'ha7)))) ?
              reg12 : ($signed((-(7'h42))) > reg12)) ?
          ($unsigned($signed($unsigned(wire6))) ?
              wire0 : wire7[(2'h2):(1'h1)]) : $unsigned((wire13[(1'h0):(1'h0)] ?
              reg8 : {$unsigned(reg10)}))))
        begin
          reg15 <= $unsigned(($unsigned(((wire5 == wire2) <<< $signed(wire4))) ?
              wire2 : $signed({((7'h42) & wire13), $unsigned(wire7)})));
          if (((wire6 | wire4[(4'hf):(4'h9)]) - $signed($signed($signed((-wire2))))))
            begin
              reg16 <= ((^~($signed((-reg9)) ?
                      (reg14 >>> (wire5 > wire2)) : ({reg8,
                          reg8} > reg9[(5'h10):(4'hd)]))) ?
                  reg10 : (({(reg8 > wire0), $unsigned(wire6)} ?
                          wire0[(4'h9):(1'h0)] : $unsigned((-reg14))) ?
                      $signed(reg11) : reg11[(3'h4):(1'h1)]));
              reg17 <= (wire3[(1'h1):(1'h1)] != reg16[(1'h0):(1'h0)]);
              reg18 <= reg12;
              reg19 <= wire0[(4'h9):(2'h2)];
              reg20 <= ({$signed($unsigned(reg14[(2'h3):(2'h3)]))} ?
                  wire7 : ((~|(8'hb9)) ?
                      wire6 : ($signed($unsigned(wire4)) - ((reg10 || wire13) ?
                          (reg18 << reg19) : wire1))));
            end
          else
            begin
              reg16 <= $unsigned($unsigned(((~&{wire5}) != $unsigned((reg17 ?
                  reg12 : wire5)))));
            end
          if ((~&{$signed(wire0)}))
            begin
              reg21 <= $signed($unsigned(reg16[(1'h0):(1'h0)]));
              reg22 <= $unsigned(((^(reg11 ?
                  reg10[(3'h4):(1'h1)] : (8'h9e))) ~^ (($unsigned(reg11) ?
                  (reg18 ?
                      (8'hb6) : (8'hae)) : ((8'h9e) + reg8)) > (wire0 && (reg18 || reg21)))));
              reg23 <= $unsigned(reg16[(1'h1):(1'h1)]);
              reg24 <= wire7[(1'h1):(1'h1)];
            end
          else
            begin
              reg21 <= reg12;
              reg22 <= {reg20[(4'hd):(4'ha)],
                  ($unsigned({(+reg24)}) != $unsigned(wire1[(4'hf):(1'h1)]))};
              reg23 <= reg19;
              reg24 <= (-((~|(|wire3[(2'h2):(2'h2)])) ?
                  (8'hbe) : $unsigned(wire1[(5'h14):(4'h8)])));
            end
          reg25 <= reg24[(3'h4):(2'h3)];
        end
      else
        begin
          if ({(&{$unsigned((^~reg16))})})
            begin
              reg15 <= wire3[(1'h0):(1'h0)];
              reg16 <= $signed(($signed({(wire2 && reg24), (~^reg24)}) ?
                  reg10 : (~&{reg9})));
            end
          else
            begin
              reg15 <= $signed({(^~$signed($unsigned(reg17)))});
            end
          reg17 <= $unsigned((8'h9f));
        end
    end
  assign wire26 = wire0[(3'h5):(3'h4)];
  assign wire27 = reg24[(3'h5):(2'h3)];
  assign wire28 = wire27[(4'h8):(3'h7)];
  assign wire29 = ({$unsigned($unsigned((8'ha3)))} >= (!$signed(({(7'h44),
                          wire26} ?
                      (reg15 ? (8'haa) : (8'hae)) : (wire27 < wire28)))));
  assign wire30 = reg9;
  module31 #() modinst44 (wire43, clk, reg16, wire2, reg9, reg17, wire0);
  always
    @(posedge clk) begin
      reg45 <= ((8'had) ? $unsigned((8'hbc)) : (~&wire7[(2'h2):(2'h2)]));
      reg46 <= wire5;
    end
  always
    @(posedge clk) begin
      if ((^wire3))
        begin
          reg47 <= reg25[(3'h5):(3'h5)];
          reg48 <= wire4;
          reg49 <= (wire6 ?
              (+$signed(((reg25 * reg25) ?
                  reg12[(1'h0):(1'h0)] : (reg45 && reg14)))) : $unsigned($unsigned(reg22)));
          reg50 <= (wire1 ?
              $unsigned(wire30) : ((&(!$signed(reg20))) ?
                  reg20[(4'h9):(4'h8)] : {($signed(wire27) * (reg19 ?
                          wire29 : reg23))}));
        end
      else
        begin
          reg47 <= (|wire2[(3'h5):(2'h2)]);
          if (((!wire43) > $signed((((reg15 != wire5) | (reg20 != reg25)) && (+(8'h9c))))))
            begin
              reg48 <= reg46;
              reg49 <= (^(wire4[(3'h4):(1'h0)] ? reg17 : (|(^~(~^reg20)))));
              reg50 <= ($signed(((^~(reg21 ?
                      reg45 : reg45)) < $unsigned($unsigned(reg12)))) ?
                  $signed($unsigned(reg21[(2'h2):(1'h0)])) : $unsigned(reg8[(3'h6):(2'h3)]));
              reg51 <= {$unsigned(($signed(wire4[(2'h2):(1'h0)]) || ($unsigned(reg49) ?
                      reg15[(3'h6):(2'h2)] : (wire0 ? reg16 : (8'hbe)))))};
              reg52 <= (&reg48);
            end
          else
            begin
              reg48 <= $signed(reg15);
              reg49 <= reg23[(4'ha):(4'h8)];
            end
          reg53 <= (((reg20 ?
                  ((reg52 ? reg17 : reg20) ?
                      $signed(reg24) : (reg17 ? wire5 : wire30)) : reg24) ?
              reg22 : {(~^(^~reg46))}) << ((~&(!reg25)) ?
              $unsigned($signed((wire4 ?
                  wire2 : reg12))) : $signed(reg24[(3'h4):(3'h4)])));
          reg54 <= (~wire7);
          reg55 <= {{(^~wire27),
                  {($signed((8'hbc)) ?
                          $unsigned(wire7) : ((8'hb4) ? wire28 : reg54))}},
              (~^reg49[(1'h0):(1'h0)])};
        end
      reg56 <= (!$signed((((~|(8'hb3)) * reg52[(5'h11):(3'h6)]) > ((reg52 ?
          reg17 : reg52) - reg53[(3'h4):(2'h3)]))));
      reg57 <= reg21;
      if ($signed(($unsigned(((reg49 < reg24) ?
          $unsigned(reg10) : (-reg25))) <<< {reg8, $signed({reg16, reg57})})))
        begin
          reg58 <= (wire7 - {reg18});
          reg59 <= (&(8'ha6));
        end
      else
        begin
          reg58 <= reg10;
          reg59 <= wire28;
          reg60 <= reg8;
          reg61 <= ($unsigned($unsigned(((!reg51) ?
                  $signed((7'h43)) : $unsigned(reg55)))) ?
              ((!({(8'ha7)} ? {wire29, wire6} : (wire29 ? wire7 : (8'h9e)))) ?
                  reg48 : {(~&$signed(reg46))}) : ($unsigned(($unsigned(reg56) > (reg16 ?
                  reg25 : reg21))) * $unsigned((reg15 <<< $unsigned(reg15)))));
          reg62 <= {(8'h9d),
              ($unsigned(reg61) <<< (wire1[(5'h15):(2'h3)] >>> {$signed(reg48),
                  $signed(reg19)}))};
        end
      reg63 <= ($unsigned(reg10[(4'h9):(4'h8)]) ?
          $unsigned({reg15,
              reg16[(4'hc):(1'h1)]}) : (^~(reg52[(1'h0):(1'h0)] == wire13)));
    end
  assign wire64 = {(+reg59[(2'h3):(1'h0)]), wire4};
  assign wire65 = (~|$unsigned(reg18[(4'he):(4'he)]));
  module66 #() modinst150 (wire149, clk, reg10, wire6, reg54, wire27);
  assign wire151 = {(~^(((wire149 ? wire149 : (8'hbe)) >= reg61) ?
                           (&{wire65}) : (-(reg48 ? reg11 : reg15)))),
                       ($unsigned((&(~reg23))) ~^ {(8'ha6)})};
  assign wire152 = reg14[(2'h3):(2'h3)];
  assign wire153 = ($signed($signed(reg12[(3'h7):(2'h2)])) ?
                       $unsigned(($signed(reg23[(5'h10):(4'hc)]) | ($unsigned((8'haa)) ~^ (|reg10)))) : ((-reg58[(3'h6):(3'h6)]) && wire13));
  always
    @(posedge clk) begin
      reg154 <= $unsigned(({{(reg47 & (8'hb5)), wire149}} ?
          (+$signed(wire27[(4'hb):(4'h9)])) : reg12[(3'h5):(2'h3)]));
    end
endmodule

module module66
#(parameter param147 = (^~(((^{(7'h42)}) == (((8'ha2) != (7'h42)) ? {(8'haf)} : ((8'h9e) ? (8'ha4) : (7'h43)))) ? (^~((~&(8'h9e)) < ((8'hb9) << (8'hba)))) : {{((8'hb2) & (7'h42)), (+(8'ha1))}, ({(8'hbd)} ? ((8'hb1) ^ (8'hb4)) : {(8'hb2), (8'ha1)})})), 
parameter param148 = (-((^(param147 ? param147 : {param147, param147})) == (~&(~^param147)))))
(y, clk, wire67, wire68, wire69, wire70);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire69;
  input wire signed [(5'h10):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire143;
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire71,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire83,
                 wire84,
                 wire85,
                 wire101,
                 wire143,
                 reg72,
                 reg73,
                 reg74,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire71 = (~|((wire68 >= wire67) ?
                      ((wire70[(2'h3):(2'h2)] ?
                          ((8'ha9) ?
                              wire68 : wire67) : wire70[(2'h3):(1'h1)]) == $signed((~|wire68))) : (^~wire70[(5'h10):(4'h8)])));
  always
    @(posedge clk) begin
      reg72 <= $signed(wire71);
      reg73 <= $unsigned((^~$unsigned(((^~(8'hab)) ^ ((8'ha1) >= wire67)))));
      reg74 <= $unsigned($unsigned($unsigned(wire69)));
    end
  assign wire75 = $signed(reg73[(4'he):(4'hb)]);
  assign wire76 = $signed((($unsigned({wire67, (8'hbe)}) + $signed((wire75 ?
                          wire68 : wire69))) ?
                      ((!reg72[(1'h0):(1'h0)]) ?
                          $unsigned($signed(wire70)) : $signed(wire69)) : $signed(wire69[(2'h2):(1'h1)])));
  assign wire77 = $signed($signed(reg72[(3'h5):(1'h1)]));
  assign wire78 = $unsigned((wire68 ?
                      (wire71 >>> wire71[(5'h11):(3'h4)]) : reg74[(3'h6):(3'h5)]));
  assign wire79 = $signed((((~|(8'haa)) & $signed((wire69 ?
                          (8'ha2) : wire68))) ?
                      $signed(wire68) : {(+$signed(reg72))}));
  assign wire80 = wire79[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg81 <= ((-(reg74[(3'h5):(1'h1)] ?
              $signed($signed((8'hbd))) : $unsigned(((8'ha3) < wire77)))) ?
          reg72 : $signed($unsigned($signed((~&wire67)))));
      reg82 <= $signed($unsigned($signed(wire79[(4'hd):(3'h7)])));
    end
  assign wire83 = wire78[(4'he):(4'h9)];
  assign wire84 = ((reg73 ?
                      $signed(reg82) : (^~(((8'ha5) <<< wire67) ?
                          $unsigned(wire75) : (wire80 ?
                              wire77 : (8'hbb))))) - $unsigned(((|wire75) >= $unsigned(wire69[(1'h0):(1'h0)]))));
  assign wire85 = wire77;
  module86 #() modinst102 (wire101, clk, reg82, reg81, wire79, wire76);
  module103 #() modinst144 (wire143, clk, wire78, wire69, wire77, reg72);
  assign wire145 = (+$signed({(~$signed(wire76)),
                       {(reg73 ? wire83 : wire69), (~&(8'hb5))}}));
  assign wire146 = (wire68[(4'hc):(1'h1)] == (+wire101));
endmodule

module module31
#(parameter param41 = ((!{(8'ha1), (!(7'h41))}) << (((((8'ha3) ? (8'hbf) : (8'hb3)) ? ((8'ha9) ? (8'hb1) : (8'hbb)) : (&(8'ha4))) > (((8'ha9) ? (8'hba) : (8'haf)) >> (~^(8'hb3)))) ^~ {(^(^~(8'hbb))), {{(8'hb4)}, (~|(8'haa))}})), 
parameter param42 = param41)
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire [(5'h10):(1'h0)] wire35;
  input wire signed [(3'h6):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = $signed(wire32[(1'h1):(1'h0)]);
  assign wire38 = $unsigned(({wire37[(3'h6):(3'h4)],
                      ($signed(wire36) * $signed(wire37))} * (((wire32 ?
                              wire32 : wire32) ?
                          $unsigned(wire34) : $signed(wire35)) ?
                      wire34[(3'h6):(3'h5)] : $signed((wire35 ?
                          wire33 : wire32)))));
  assign wire39 = {((~&wire35[(2'h3):(2'h3)]) ?
                          (((wire34 ?
                              wire33 : wire32) == {wire38}) ~^ $signed($signed(wire34))) : (8'hb1)),
                      $unsigned((~wire37))};
  assign wire40 = (wire32 ^~ wire38);
endmodule

module module103
#(parameter param142 = (((^((~&(8'hb1)) >>> ((8'ha9) + (8'hb4)))) >> (~^((!(8'hb1)) ~^ ((8'ha3) ~^ (7'h42))))) - ({(^~{(8'had)})} & (|{((8'hba) ? (8'hb6) : (7'h41)), ((8'haa) ? (8'hbd) : (8'hb3))}))))
(y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire107;
  input wire [(4'he):(1'h0)] wire106;
  input wire signed [(4'ha):(1'h0)] wire105;
  input wire signed [(4'hd):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire [(5'h10):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire115;
  wire signed [(3'h6):(1'h0)] wire114;
  wire signed [(3'h6):(1'h0)] wire113;
  wire [(2'h3):(1'h0)] wire112;
  wire [(3'h7):(1'h0)] wire111;
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(4'hb):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg110,
                 reg109,
                 reg108,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg108 <= $signed($unsigned((wire104[(2'h2):(1'h1)] != ($unsigned(wire104) && (8'h9d)))));
      reg109 <= $unsigned($unsigned($unsigned($unsigned({wire104, reg108}))));
      reg110 <= ($unsigned(reg108) ? reg108 : reg109);
    end
  assign wire111 = ($signed(({(~|reg109),
                       (wire105 || reg108)} >= ((wire105 - wire104) ?
                       $signed(reg109) : (~&reg110)))) >> ({(8'haf)} ~^ (^$unsigned((~wire104)))));
  assign wire112 = (({(~^(reg108 ? wire105 : wire107))} ?
                       (reg110[(1'h1):(1'h0)] >>> {wire105[(4'h9):(3'h7)],
                           (reg110 + reg108)}) : ((~|(wire106 << wire104)) <= $unsigned((~|wire107)))) + {($signed({wire107,
                               wire104}) ?
                           wire104[(1'h1):(1'h0)] : ((!wire106) != wire105[(4'h8):(1'h1)]))});
  assign wire113 = (reg109[(3'h5):(3'h5)] - reg110);
  assign wire114 = ({{((8'ha5) ? $unsigned(reg110) : $unsigned(reg109)),
                           reg108[(4'hd):(2'h3)]},
                       $signed(wire106[(3'h7):(2'h2)])} < reg109[(5'h12):(4'hf)]);
  assign wire115 = reg108[(4'ha):(2'h3)];
  always
    @(posedge clk) begin
      reg116 <= wire112[(1'h0):(1'h0)];
      reg117 <= $signed($signed(($unsigned((wire113 ? reg109 : wire107)) ?
          $signed((wire111 ? reg110 : (8'hbe))) : (|$unsigned((8'hb0))))));
      reg118 <= (!$unsigned((^~$signed((wire105 ? wire106 : reg110)))));
      reg119 <= wire107[(3'h4):(3'h4)];
    end
  assign wire120 = wire106;
  assign wire121 = $unsigned(reg108[(3'h4):(3'h4)]);
  assign wire122 = $unsigned($signed((8'h9e)));
  assign wire123 = $signed(wire112);
  assign wire124 = (~wire111);
  assign wire125 = wire112;
  assign wire126 = (($unsigned(reg118[(1'h0):(1'h0)]) ^ reg109) - reg118);
  assign wire127 = $unsigned($signed((wire113[(3'h5):(2'h2)] ^~ $unsigned((wire113 != wire121)))));
  assign wire128 = {$unsigned((~^$signed(wire114))),
                       $signed(wire126[(3'h5):(3'h4)])};
  assign wire129 = (|($unsigned(((+reg108) ? reg117 : wire127)) ?
                       ($unsigned(wire111) + ((+(8'hac)) & (~|wire121))) : wire126[(4'he):(1'h1)]));
  assign wire130 = $unsigned(wire111);
  assign wire131 = (+wire112[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire123)
        begin
          reg132 <= {{((-(wire126 > wire124)) << (wire111[(2'h3):(1'h0)] ^ wire129[(1'h0):(1'h0)])),
                  wire120[(2'h2):(2'h2)]},
              (((((8'hbe) > wire105) != $unsigned(reg109)) > (~&$signed(reg118))) ^~ $signed({$unsigned(wire129)}))};
          reg133 <= reg109[(1'h0):(1'h0)];
        end
      else
        begin
          reg132 <= ((reg116[(4'h8):(3'h4)] ?
                  $signed(($unsigned(wire128) >= $signed(wire123))) : $unsigned(((wire131 & wire115) ?
                      wire131[(4'hb):(2'h2)] : {(8'hbb)}))) ?
              $unsigned(wire121[(3'h5):(1'h1)]) : $signed($signed(wire105[(2'h2):(1'h0)])));
          if (((-(&(wire106 ~^ (+reg133)))) == (+(reg118 ?
              $signed(reg117) : ((|wire111) | (wire113 ~^ wire114))))))
            begin
              reg133 <= (wire111[(3'h7):(1'h0)] - $unsigned(({((8'had) ?
                      reg132 : wire121)} && {(8'hb3)})));
              reg134 <= $unsigned((reg118[(1'h0):(1'h0)] ?
                  $unsigned((-(wire121 ^~ wire122))) : $signed(reg119)));
            end
          else
            begin
              reg133 <= $unsigned((8'ha1));
              reg134 <= $unsigned(wire127);
              reg135 <= $unsigned($signed(((wire131[(1'h1):(1'h1)] ?
                      $unsigned(wire114) : ((7'h42) ? (8'hb7) : wire125)) ?
                  {$unsigned((7'h44))} : reg118)));
              reg136 <= wire106[(4'h8):(1'h1)];
            end
          reg137 <= (~|(-$signed(wire126[(4'he):(4'he)])));
          reg138 <= {$unsigned((^~((8'ha5) || wire124)))};
        end
      reg139 <= (+(^~$signed($signed((reg116 ? wire106 : reg136)))));
    end
  assign wire140 = {wire131, wire131[(3'h4):(2'h2)]};
  assign wire141 = ((^({reg137} ?
                           wire115 : $unsigned(wire131[(4'hc):(4'h8)]))) ?
                       reg139[(4'h8):(1'h1)] : wire123[(1'h1):(1'h0)]);
endmodule

module module86  (y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  input wire signed [(3'h7):(1'h0)] wire88;
  input wire signed [(3'h7):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h5):(1'h0)] wire91;
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 (1'h0)};
  assign wire91 = ($signed(($signed((8'ha3)) ?
                      wire87[(1'h0):(1'h0)] : (wire87[(3'h4):(1'h1)] <= $signed(wire87)))) | (~(^~({wire89,
                      wire89} <<< (wire89 >> (8'hb6))))));
  assign wire92 = ($unsigned(({$signed(wire89), $signed(wire89)} ?
                          wire89[(1'h0):(1'h0)] : ((wire89 ?
                              (8'ha9) : wire90) >= (!wire89)))) ?
                      ((^(&$unsigned(wire91))) ?
                          wire87 : wire90[(4'ha):(1'h0)]) : ((|((wire90 ?
                                  (8'ha5) : wire91) ?
                              (wire91 ? wire91 : wire91) : $unsigned(wire88))) ?
                          ($unsigned(wire87) >>> (+$signed(wire89))) : wire88[(1'h0):(1'h0)]));
  assign wire93 = ((wire91 ?
                          (-(^~$unsigned(wire91))) : (~&($signed((7'h44)) >>> {wire91}))) ?
                      $unsigned((wire87 <= (wire90[(2'h2):(2'h2)] ?
                          {(7'h41)} : wire91[(1'h0):(1'h0)]))) : $unsigned($signed({{(8'ha2),
                              wire89}})));
  assign wire94 = $unsigned((8'hbc));
  assign wire95 = $signed({($signed((^~wire88)) >>> $signed({wire92,
                          wire88}))});
  assign wire96 = $signed($signed((!((wire89 >= wire93) ~^ (~^wire89)))));
  assign wire97 = (($unsigned({(wire95 ? wire95 : wire91),
                      (wire92 ?
                          wire89 : wire93)}) ~^ (8'ha1)) >>> $unsigned(wire96));
  assign wire98 = $unsigned(wire87);
  assign wire99 = (((8'h9e) ?
                          {wire93[(4'hb):(3'h5)],
                              (wire95 ^~ (wire98 ?
                                  wire96 : wire95))} : (~|wire96)) ?
                      $unsigned($unsigned(wire88[(1'h1):(1'h0)])) : wire87[(1'h0):(1'h0)]);
  assign wire100 = wire95;
endmodule
