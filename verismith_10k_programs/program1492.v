module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(3'h4):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire70;
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire75,
                 wire74,
                 wire72,
                 wire70,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg73,
                 (1'h0)};
  module4 #() modinst71 (wire70, clk, wire3, wire1, wire0, wire2);
  assign wire72 = wire70[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg73 <= wire3[(3'h6):(3'h4)];
    end
  assign wire74 = $unsigned((^{($unsigned((8'h9e)) > wire70[(2'h3):(2'h2)]),
                      wire3[(2'h3):(1'h0)]}));
  assign wire75 = $unsigned((($unsigned($unsigned(wire72)) ?
                      ((wire72 ? wire72 : wire3) ?
                          $signed(wire70) : wire1) : wire72[(5'h11):(2'h3)]) ^~ $signed($unsigned(wire70))));
  always
    @(posedge clk) begin
      if ((8'h9e))
        begin
          reg76 <= {wire0,
              (($unsigned((wire0 ? wire70 : wire72)) ?
                      $signed($unsigned(wire72)) : $unsigned({(8'hb5)})) ?
                  wire2 : wire2)};
          reg77 <= $signed($signed($unsigned($unsigned($signed(wire3)))));
          reg78 <= wire72;
          reg79 <= (wire1[(2'h2):(1'h0)] ^~ {((&(wire0 >>> wire74)) >> (-wire70))});
        end
      else
        begin
          reg76 <= (~|(((7'h42) - ($unsigned(wire72) ?
              $unsigned(reg79) : (8'hb0))) <= $signed((!(+reg73)))));
        end
      reg80 <= (~$signed(reg76));
      reg81 <= {wire0[(2'h2):(2'h2)]};
    end
  always
    @(posedge clk) begin
      reg82 <= reg80[(4'he):(3'h4)];
      reg83 <= (($signed(($unsigned(wire75) ?
              $unsigned(wire74) : reg79[(2'h2):(1'h0)])) ?
          $signed($signed($unsigned(reg76))) : $unsigned(wire3[(4'ha):(4'h8)])) ^ {(^~({wire1} ?
              (^~wire74) : $signed(reg76))),
          reg80[(4'h9):(3'h6)]});
      reg84 <= $signed(reg78);
      if ($signed(wire72))
        begin
          reg85 <= (((8'haf) < ((&$unsigned(reg83)) < (^reg78[(4'hd):(3'h7)]))) ?
              ($unsigned(((reg79 <<< wire75) != wire3[(2'h3):(1'h1)])) ?
                  {($unsigned((8'haf)) ?
                          $signed(reg76) : reg82[(3'h4):(2'h2)])} : (8'hac)) : $unsigned($signed((^~(&reg76)))));
          reg86 <= {(8'hae), $unsigned((8'hb5))};
          if ((((((8'hbd) == $signed(reg85)) > reg80) ?
                  (^((reg82 && wire72) < reg84)) : ($signed(reg83) ?
                      (reg78 ?
                          (wire3 != reg85) : (^reg86)) : (^~$unsigned(wire75)))) ?
              $unsigned($signed(((reg76 ?
                  reg78 : (8'hb0)) >> (8'ha4)))) : (~|(&$unsigned((reg82 ?
                  reg85 : reg73))))))
            begin
              reg87 <= (~&$signed($unsigned($unsigned(wire70))));
            end
          else
            begin
              reg87 <= ($unsigned((^$unsigned((-wire1)))) ?
                  (^{((^reg80) + (reg87 ? reg84 : reg87)),
                      (+(reg78 ? (8'hbf) : wire2))}) : (+wire2[(2'h3):(2'h2)]));
              reg88 <= (reg79 ?
                  wire3 : (&(~(reg81 ?
                      wire70[(4'h9):(3'h4)] : ((8'hac) ~^ reg83)))));
              reg89 <= ($unsigned($unsigned($signed((wire0 > wire3)))) >= (|reg73));
            end
          reg90 <= $signed($unsigned($signed(reg84)));
        end
      else
        begin
          reg85 <= reg78;
          if (reg88)
            begin
              reg86 <= $signed((~&reg87[(2'h3):(2'h2)]));
            end
          else
            begin
              reg86 <= reg84;
              reg87 <= reg83;
            end
          reg88 <= $unsigned(reg73);
          if (($unsigned({({reg78} - (|wire70))}) | (((~$signed(reg73)) | (^~reg78)) ^~ $unsigned((wire2 ?
              $signed(reg84) : reg73)))))
            begin
              reg89 <= (~|(|(^((reg87 ?
                  reg77 : reg86) + reg76[(1'h1):(1'h1)]))));
              reg90 <= reg88[(4'hb):(4'h9)];
              reg91 <= (~^(~&$signed(reg80)));
              reg92 <= reg87;
              reg93 <= (8'hbd);
            end
          else
            begin
              reg89 <= $signed($unsigned(reg85));
              reg90 <= $signed((8'h9e));
              reg91 <= ((+$unsigned({(&(8'hb0)), wire1})) ?
                  (({$unsigned(reg89)} ?
                      reg92 : reg91) >> ((+(8'ha5)) < ((wire2 ^ reg85) != (reg80 | wire72)))) : $signed(((~&(~&wire0)) ?
                      $signed((8'h9f)) : (-{reg88}))));
              reg92 <= ((~&(((reg91 ? reg89 : wire70) ?
                  (^reg73) : (reg92 | reg88)) <= reg85)) && reg88);
            end
          if ($signed((($unsigned((reg73 ? reg89 : reg80)) ?
              (^$signed(reg89)) : {reg77,
                  (reg85 ? reg80 : reg89)}) <<< $signed(((reg86 + reg83) ?
              {(8'ha2)} : reg80[(1'h1):(1'h1)])))))
            begin
              reg94 <= reg93;
              reg95 <= $signed(reg73[(2'h2):(2'h2)]);
              reg96 <= wire0;
              reg97 <= (~reg85);
              reg98 <= wire0[(5'h11):(4'hd)];
            end
          else
            begin
              reg94 <= $unsigned($signed($unsigned($signed($signed(wire72)))));
              reg95 <= reg78[(4'hd):(4'hb)];
            end
        end
    end
  assign wire99 = $unsigned(wire1[(1'h1):(1'h1)]);
  assign wire100 = (+$signed(((wire3 >>> {reg95, (8'hae)}) ?
                       reg73[(2'h2):(2'h2)] : wire2[(5'h12):(2'h2)])));
  assign wire101 = reg97;
  assign wire102 = (^~$unsigned(wire74[(4'h9):(2'h3)]));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire5;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire39;
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire69,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire9,
                 wire39,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg10,
                 reg11,
                 reg12,
                 reg13,
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
  assign wire9 = $unsigned(wire5);
  always
    @(posedge clk) begin
      if ({$unsigned((wire8[(2'h3):(2'h2)] ?
              ((8'haa) ?
                  wire6[(1'h0):(1'h0)] : $signed((8'had))) : wire5[(2'h3):(2'h3)])),
          ((wire9[(3'h7):(3'h4)] ?
                  ($signed((8'ha2)) || $unsigned(wire5)) : wire8) ?
              {$signed((|wire8)),
                  ($signed(wire7) ?
                      $unsigned(wire5) : wire7)} : $signed(($unsigned(wire9) >>> (wire5 <<< wire6))))})
        begin
          if (({(!$signed(wire9)), $signed($unsigned((+(8'ha3))))} ?
              (&$signed($signed($signed((8'hba))))) : $signed($signed(wire9[(3'h7):(2'h2)]))))
            begin
              reg10 <= wire8;
              reg11 <= $signed($unsigned(wire7));
              reg12 <= {$signed(($unsigned((wire8 >> wire8)) < $signed((!wire8)))),
                  wire6};
            end
          else
            begin
              reg10 <= wire8;
              reg11 <= (7'h44);
              reg12 <= (~$signed((8'h9d)));
            end
          reg13 <= wire6[(3'h5):(3'h4)];
          reg14 <= ($unsigned(reg13[(3'h4):(2'h2)]) != reg13[(1'h1):(1'h0)]);
          reg15 <= (8'h9c);
        end
      else
        begin
          if (wire6)
            begin
              reg10 <= ((!$unsigned($unsigned((wire7 ?
                  wire9 : (8'hbc))))) & reg11);
              reg11 <= ((+((~{(8'hb8),
                  reg14}) != ((reg15 << reg12) == (&(8'ha9))))) | $signed(reg13));
              reg12 <= (&(!$unsigned(reg13)));
              reg13 <= (&{reg12,
                  ($unsigned((~|wire7)) ?
                      $unsigned((wire7 ^~ wire6)) : reg10[(1'h0):(1'h0)])});
            end
          else
            begin
              reg10 <= $signed($signed(({(8'hb5)} > $unsigned(wire5[(3'h5):(2'h3)]))));
              reg11 <= (8'ha6);
              reg12 <= wire7[(3'h7):(3'h4)];
              reg13 <= {reg10[(3'h6):(3'h4)],
                  {reg10,
                      ($unsigned((wire6 >> wire8)) ?
                          ((+wire5) || (wire9 <= (8'hba))) : {$unsigned(reg13)})}};
            end
          if (($signed(reg14) > {$signed($unsigned((^~wire5))),
              (wire6[(1'h0):(1'h0)] ?
                  $unsigned(((8'ha9) <= reg11)) : $signed((!wire9)))}))
            begin
              reg14 <= (8'h9c);
              reg15 <= (~^$unsigned($unsigned((&$unsigned(reg13)))));
            end
          else
            begin
              reg14 <= wire6;
            end
          reg16 <= (((&(~|(wire5 ? reg12 : reg14))) ?
                  $unsigned((reg12[(5'h10):(1'h1)] ?
                      ((7'h42) & (8'ha1)) : (wire8 <<< wire6))) : (~reg12[(4'hd):(3'h7)])) ?
              ({$unsigned((wire9 ? reg11 : wire6))} ?
                  $signed(wire8) : (^{(wire6 ? reg11 : reg13)})) : reg14);
          reg17 <= $unsigned($signed(wire8));
          reg18 <= $signed(((8'haf) >> {{(8'hb7), (reg11 >= reg16)}}));
        end
      reg19 <= (+($unsigned((wire8 > (!reg11))) ?
          ($signed((reg10 ?
              reg15 : reg13)) ^~ reg13[(2'h3):(2'h3)]) : (~^wire7[(3'h6):(1'h0)])));
      if ((-((~$unsigned((reg13 ?
          reg14 : reg12))) & $signed($unsigned(reg14[(4'he):(1'h1)])))))
        begin
          reg20 <= (!wire9[(2'h2):(2'h2)]);
          if ($unsigned($unsigned({($unsigned(reg19) > (reg12 ? reg18 : reg18)),
              ((wire9 ^~ (8'haa)) ? reg16 : (reg13 << reg18))})))
            begin
              reg21 <= $unsigned($unsigned((~^reg12[(4'ha):(3'h5)])));
              reg22 <= reg13;
              reg23 <= (&({$signed({reg22})} ?
                  $signed(reg10[(3'h7):(3'h6)]) : reg18[(1'h1):(1'h0)]));
              reg24 <= (reg16[(2'h3):(2'h3)] * reg20[(3'h7):(2'h3)]);
            end
          else
            begin
              reg21 <= (wire9 ?
                  wire5[(4'ha):(3'h7)] : (|$unsigned((reg11[(2'h2):(2'h2)] ?
                      $signed(reg16) : $unsigned(reg14)))));
              reg22 <= wire9;
              reg23 <= (reg17[(2'h3):(2'h3)] ?
                  $signed($signed($unsigned(wire5))) : (^$signed($unsigned(((8'hae) ?
                      reg17 : reg21)))));
              reg24 <= reg18;
              reg25 <= $unsigned($unsigned($unsigned(($unsigned(reg13) && $signed(reg24)))));
            end
        end
      else
        begin
          reg20 <= reg21;
        end
    end
  module26 #() modinst40 (wire39, clk, wire8, reg23, reg19, reg11);
  assign wire41 = reg15;
  assign wire42 = $signed(((reg17[(3'h4):(1'h0)] == ((^reg21) ?
                          $unsigned(reg10) : (^~reg23))) ?
                      (~$signed((reg25 <<< wire5))) : $signed({(wire6 ?
                              reg24 : wire41)})));
  assign wire43 = $unsigned(wire42);
  assign wire44 = $signed(reg18[(4'hb):(4'ha)]);
  assign wire45 = reg21[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg46 <= (~|(reg25 ?
          (reg20 != reg12[(3'h4):(1'h0)]) : $unsigned(reg16[(4'ha):(3'h7)])));
      reg47 <= {{$signed(wire7[(2'h2):(2'h2)])}};
      reg48 <= reg17[(1'h0):(1'h0)];
      if ((+(wire8 ? ({reg15} < $signed((reg16 < reg24))) : (~|reg46))))
        begin
          reg49 <= wire45;
          reg50 <= reg17;
          if ($signed(reg50))
            begin
              reg51 <= reg46;
              reg52 <= $signed(reg12[(1'h0):(1'h0)]);
            end
          else
            begin
              reg51 <= ($signed(((^(reg46 < reg24)) ?
                      ((reg10 - reg50) == (wire45 ?
                          reg51 : (8'h9f))) : (^$signed(reg52)))) ?
                  (8'hbd) : $signed($signed(((8'hb8) <<< $signed((8'ha1))))));
              reg52 <= wire8[(5'h10):(4'hb)];
              reg53 <= (reg18 == reg18[(4'hb):(4'h9)]);
            end
          reg54 <= wire42[(1'h0):(1'h0)];
          reg55 <= (8'hba);
        end
      else
        begin
          reg49 <= $unsigned(reg53);
          reg50 <= $unsigned($signed($unsigned($signed($signed((8'ha9))))));
          reg51 <= wire5[(1'h0):(1'h0)];
        end
    end
  assign wire56 = reg54[(4'h8):(4'h8)];
  assign wire57 = ((reg13[(1'h0):(1'h0)] ?
                      (|reg12) : $signed((wire44 + (~^reg21)))) >= reg54);
  assign wire58 = wire8[(4'h8):(3'h4)];
  assign wire59 = $signed($signed($unsigned($unsigned((+reg22)))));
  assign wire60 = reg47[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ({{reg11[(4'hc):(4'hc)],
              ((^(reg16 >= wire41)) * reg21[(3'h4):(2'h3)])}})
        begin
          reg61 <= $signed($unsigned(reg23));
          if (wire59)
            begin
              reg62 <= {$signed((8'ha5)), wire57[(3'h4):(1'h0)]};
              reg63 <= $unsigned(($signed(wire45[(4'hb):(3'h7)]) <= ($unsigned(wire59[(4'he):(2'h3)]) > reg18[(3'h7):(3'h7)])));
              reg64 <= $signed(($unsigned({(~(8'hb5))}) >> ((-$unsigned(reg17)) ?
                  wire44[(3'h6):(1'h1)] : $unsigned(reg11[(1'h1):(1'h0)]))));
              reg65 <= {reg17[(3'h5):(1'h1)], reg15};
              reg66 <= $signed(wire8);
            end
          else
            begin
              reg62 <= reg25;
            end
          reg67 <= reg25[(4'hd):(3'h6)];
        end
      else
        begin
          if ((($unsigned((reg14[(1'h0):(1'h0)] ^ (~reg11))) - $unsigned(($signed(reg53) ?
                  (-wire60) : {reg64}))) ?
              (~^{$signed((8'ha6)),
                  (&wire58[(4'hc):(4'hb)])}) : $signed($unsigned((((7'h41) ?
                      wire8 : wire45) ?
                  (reg19 <<< reg12) : reg63)))))
            begin
              reg61 <= $unsigned($signed(wire56[(4'h8):(3'h7)]));
              reg62 <= ($signed($unsigned(reg55[(5'h11):(4'hd)])) > ($signed(({reg25,
                      reg18} ?
                  $unsigned(wire44) : $signed(reg10))) <= reg65));
              reg63 <= reg62[(4'hc):(3'h4)];
              reg64 <= $signed((^~($signed($unsigned(wire60)) ?
                  reg67[(2'h2):(2'h2)] : $unsigned((wire7 ? reg67 : wire39)))));
            end
          else
            begin
              reg61 <= $signed(reg46[(4'hb):(3'h5)]);
              reg62 <= $signed(wire58[(4'hd):(4'ha)]);
              reg63 <= ((|$unsigned(($signed((8'hb7)) ?
                      reg12 : (reg13 >>> reg47)))) ?
                  wire6 : {$unsigned(reg53), reg19[(5'h10):(4'hf)]});
              reg64 <= ($signed($signed(reg54[(4'hd):(4'hc)])) ?
                  $signed(((reg54[(3'h6):(3'h4)] > $signed(reg23)) ?
                      (8'ha2) : $signed(wire59[(5'h10):(3'h4)]))) : wire8);
            end
          reg65 <= $signed(reg62[(3'h6):(3'h5)]);
        end
      reg68 <= $signed($unsigned($unsigned(({wire43,
          (8'ha6)} == (~&(8'hb0))))));
    end
  assign wire69 = ({$unsigned((&wire8))} ^ $unsigned(reg54));
endmodule

module module26
#(parameter param37 = (~^((-({(8'hb6), (8'hb9)} ? (8'ha9) : ((8'hab) ? (8'h9e) : (8'ha5)))) <= ((!((8'had) ? (8'ha5) : (8'hb1))) ? (((8'hb6) >= (8'hbf)) ? {(8'ha8), (8'hb2)} : (^(7'h42))) : ({(8'h9f)} ? ((8'hae) ? (8'hac) : (8'hba)) : ((8'hae) && (8'ha1)))))), 
parameter param38 = (((((~&(8'ha7)) >> (~|param37)) >= param37) ? (8'ha3) : ((param37 ? (|param37) : ((8'hae) ? param37 : param37)) ? param37 : (7'h41))) ? (({param37, param37} >= (~^{param37, param37})) ? param37 : param37) : (^(~|((|param37) ? ((8'ha0) ? param37 : param37) : (~(8'hb7)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  assign y = {wire36, wire35, wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = $unsigned(((((wire29 >> wire29) <= (~(8'ha7))) ?
                      ($signed((8'ha3)) ?
                          ((8'ha9) ?
                              wire30 : wire29) : $unsigned(wire30)) : (wire28 ?
                          wire30 : wire29[(3'h6):(1'h1)])) + ((+$signed(wire28)) ?
                      (wire30 ^ {wire27}) : (wire27[(4'hd):(4'ha)] || (wire28 ?
                          (7'h40) : wire30)))));
  assign wire32 = wire28;
  assign wire33 = $unsigned(wire30);
  assign wire34 = wire33[(4'ha):(1'h1)];
  assign wire35 = $unsigned((wire30 - {((wire28 == wire34) ?
                          wire31[(5'h12):(4'h9)] : (~wire30)),
                      (^~wire29[(5'h15):(5'h14)])}));
  assign wire36 = $signed(wire35);
endmodule
