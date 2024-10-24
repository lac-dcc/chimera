module top
#(parameter param192 = ((((-((8'ha2) + (8'hbf))) ~^ (-((7'h42) != (8'ha3)))) < {(((8'hb0) >> (8'hb1)) ? ((8'hb7) > (8'haf)) : {(8'h9e), (8'hb4)}), ((-(8'hb0)) ? (~|(8'hb0)) : ((8'hbc) << (7'h42)))}) | (~|{{((8'hb6) | (8'haa))}})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire191;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire189;
  assign y = {wire191, wire4, wire5, wire6, wire189, (1'h0)};
  assign wire4 = $signed(wire1[(3'h4):(2'h3)]);
  assign wire5 = (wire4[(4'hb):(3'h6)] << $unsigned(((!$signed(wire2)) ?
                     wire2[(3'h6):(1'h1)] : (wire2[(4'h9):(3'h4)] <<< $unsigned(wire3)))));
  assign wire6 = (wire0 && $unsigned((wire3[(2'h3):(2'h3)] ?
                     wire1[(3'h6):(2'h2)] : (wire4[(3'h7):(3'h6)] - wire5[(3'h4):(2'h2)]))));
  module7 #() modinst190 (.wire10(wire5), .wire8(wire6), .wire12(wire0), .clk(clk), .y(wire189), .wire9(wire2), .wire11(wire4));
  assign wire191 = $signed($unsigned($unsigned(wire2)));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h35a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire188;
  wire signed [(5'h11):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire185;
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire148,
                 wire112,
                 wire111,
                 wire89,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire13,
                 wire91,
                 wire96,
                 wire109,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire185,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg26,
                 reg27,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  assign wire13 = $unsigned((8'ha5));
  always
    @(posedge clk) begin
      if ($unsigned(wire13[(1'h1):(1'h0)]))
        begin
          reg14 <= ($signed(((8'ha9) >>> ((wire8 - wire9) ?
              (wire9 >> wire11) : $unsigned(wire8)))) << wire8);
          if ((((wire10[(2'h2):(1'h1)] > ((wire11 ?
                      wire12 : reg14) >> (wire12 < wire9))) ?
                  (wire13 > ($signed(wire13) >> wire13)) : (((wire13 ?
                              wire9 : wire13) ?
                          (wire12 == (8'haf)) : $unsigned(reg14)) ?
                      wire11 : ((wire13 ? (8'hbe) : wire12) ?
                          {reg14} : $unsigned(wire13)))) ?
              $unsigned(((wire8 ?
                  wire9 : $unsigned(wire12)) ^~ wire11[(1'h0):(1'h0)])) : $signed($signed(((&wire10) ?
                  wire9[(4'hb):(1'h0)] : $signed(wire9))))))
            begin
              reg15 <= ($unsigned($unsigned(wire8[(1'h1):(1'h0)])) >> wire9);
            end
          else
            begin
              reg15 <= reg15[(3'h7):(1'h0)];
              reg16 <= ((8'hba) ?
                  (wire11[(3'h6):(2'h2)] == ($signed(wire12) ?
                      (~|reg14) : $signed($signed(wire13)))) : wire13);
              reg17 <= ($unsigned($unsigned((-(~&wire13)))) ?
                  (^((&wire10[(2'h2):(1'h1)]) ?
                      reg15 : wire9)) : $unsigned(wire13[(4'h9):(3'h7)]));
              reg18 <= $unsigned({(8'ha6), (+(^~wire12[(4'h9):(3'h7)]))});
            end
          if ({(8'hb5), ($signed({$unsigned(wire10), wire9}) < wire13)})
            begin
              reg19 <= reg18[(3'h6):(3'h6)];
              reg20 <= (((8'ha2) >> (&reg16)) >> {((~{(8'ha6)}) ?
                      (reg19 ?
                          $unsigned((8'ha3)) : reg16) : reg17[(4'h9):(1'h0)])});
            end
          else
            begin
              reg19 <= $unsigned(reg18);
              reg20 <= $unsigned($unsigned(reg18));
              reg21 <= $unsigned((wire13[(1'h1):(1'h1)] ?
                  $unsigned(wire8[(2'h3):(1'h0)]) : (reg17 ?
                      (reg15[(4'h8):(3'h7)] >> ((8'hac) ?
                          wire11 : reg16)) : reg18[(3'h6):(3'h5)])));
              reg22 <= reg19[(3'h5):(1'h1)];
              reg23 <= $unsigned(({({wire12,
                      wire11} >> (reg17 | reg22))} || wire10));
            end
          reg24 <= reg22;
        end
      else
        begin
          reg14 <= (-wire9[(4'ha):(1'h0)]);
          reg15 <= reg15[(2'h2):(2'h2)];
          reg16 <= $signed($signed(wire13[(4'h9):(2'h3)]));
        end
      reg25 <= (~|$unsigned(((7'h41) ?
          $signed($unsigned(reg23)) : wire13[(1'h1):(1'h0)])));
      reg26 <= (wire10 & $unsigned($unsigned(($unsigned((8'hae)) >= $signed(reg20)))));
      reg27 <= (reg19 > (~&reg24));
    end
  assign wire28 = ((^reg24) << $unsigned($unsigned($unsigned((~|reg19)))));
  assign wire29 = (|$unsigned($unsigned($signed(((7'h40) ? reg22 : wire10)))));
  assign wire30 = ($signed($unsigned($signed(reg16))) == $unsigned(((+$unsigned(reg26)) && ($signed(reg17) <<< $signed(reg17)))));
  assign wire31 = wire29[(4'hd):(3'h4)];
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          reg32 <= $signed($unsigned((reg26[(3'h4):(3'h4)] >= reg21)));
          reg33 <= ((8'hbe) ?
              wire30 : (~($unsigned((^reg24)) ?
                  {$unsigned(reg32)} : $signed(reg15[(3'h7):(2'h2)]))));
          reg34 <= ($unsigned($signed((~{(7'h40)}))) ?
              {$unsigned({(reg19 ? (8'hbd) : reg14),
                      (wire31 == reg14)})} : {($signed($unsigned(wire28)) ?
                      (reg24 - (-reg25)) : reg23)});
          reg35 <= {($signed((-{reg15})) ?
                  {$unsigned($signed((8'hbf)))} : (~^((reg33 == wire10) ?
                      $unsigned((8'hba)) : reg18))),
              $unsigned((({wire29,
                  reg14} == (wire31 >> reg25)) < $signed($unsigned(reg23))))};
        end
      else
        begin
          reg32 <= $signed((~&(~(|reg34))));
          if (reg15)
            begin
              reg33 <= ((wire28 ?
                      reg19 : (reg23 ?
                          (~|{wire10, wire11}) : (!$unsigned(reg17)))) ?
                  ({reg16[(2'h3):(1'h1)],
                      $unsigned((^wire31))} || {(wire13[(3'h6):(1'h1)] ?
                          (reg20 != wire29) : ((8'ha9) & reg15))}) : ($signed(wire12[(4'ha):(2'h2)]) ?
                      $unsigned(($signed(reg14) || reg32)) : wire9[(2'h2):(1'h1)]));
              reg34 <= ($unsigned(reg15[(4'hc):(2'h2)]) ?
                  ((({reg22} <<< {reg21}) ?
                          ($unsigned(reg15) ?
                              $signed(reg32) : {wire30,
                                  (8'h9c)}) : reg19[(5'h14):(4'hf)]) ?
                      ((reg16[(4'h8):(2'h3)] >= (reg27 ? wire8 : reg18)) ?
                          reg17 : ($signed(wire9) & (reg14 << wire10))) : $unsigned(reg24)) : $unsigned(($unsigned({reg34}) ?
                      ((&reg15) ?
                          reg18[(5'h14):(3'h7)] : (wire31 ?
                              reg17 : reg33)) : (&(reg14 ? reg20 : reg23)))));
              reg35 <= reg27[(2'h3):(1'h0)];
              reg36 <= $unsigned((~^$unsigned($unsigned($unsigned(wire30)))));
            end
          else
            begin
              reg33 <= $unsigned((~$signed(((reg17 ? reg21 : reg32) ?
                  $unsigned((8'hbd)) : $signed(wire29)))));
              reg34 <= {$unsigned(($unsigned({(8'had), reg22}) ?
                      ((+(8'ha8)) && ((8'haa) + wire11)) : $unsigned({reg21,
                          wire13}))),
                  $signed(reg26)};
              reg35 <= (^~(reg26[(4'hb):(3'h6)] >> (wire30[(4'hf):(4'hc)] * ($signed(reg23) * reg32[(3'h6):(1'h0)]))));
              reg36 <= ($unsigned(wire9[(4'hc):(2'h2)]) ?
                  (~&$signed({wire9})) : ((reg15[(4'ha):(2'h2)] ?
                          $unsigned($signed(reg26)) : $signed($unsigned(reg26))) ?
                      (^({wire11} ?
                          ((8'ha4) ?
                              reg16 : reg19) : reg24)) : (~&($unsigned((8'ha2)) <= (reg15 >= wire29)))));
              reg37 <= $unsigned($unsigned($signed((7'h42))));
            end
          if ($unsigned(reg24[(1'h0):(1'h0)]))
            begin
              reg38 <= ((reg36[(3'h4):(1'h1)] * $signed($unsigned($signed(wire10)))) ?
                  ($unsigned(reg21) ?
                      (8'hb2) : $unsigned((8'hbd))) : {$signed({wire11[(3'h6):(3'h4)]})});
              reg39 <= (&{{reg16[(5'h13):(3'h5)],
                      $unsigned($unsigned(reg25))}});
            end
          else
            begin
              reg38 <= (~&$signed(((reg23 && (-(8'hb3))) ~^ $signed($signed(wire8)))));
              reg39 <= (~(reg25 ? reg27 : (~^$signed((|reg24)))));
              reg40 <= (|reg16[(5'h14):(4'he)]);
              reg41 <= $unsigned((~&$unsigned(((reg36 == reg18) * ((8'hbd) <<< reg18)))));
            end
          if ($signed((wire10 ^ (8'had))))
            begin
              reg42 <= (!(!($unsigned(wire31) ?
                  $signed((&reg17)) : reg17[(3'h5):(3'h5)])));
            end
          else
            begin
              reg42 <= reg33[(3'h4):(1'h0)];
              reg43 <= wire12[(1'h1):(1'h1)];
              reg44 <= reg36[(1'h1):(1'h1)];
              reg45 <= $signed($signed($unsigned(reg44[(2'h2):(1'h1)])));
            end
          reg46 <= reg40[(3'h4):(1'h0)];
        end
      if ((((&(reg33 - $unsigned(reg22))) ?
              (((reg34 ^~ (8'hbf)) ? {reg38, (8'ha0)} : (|wire8)) ?
                  (|(wire30 ?
                      reg44 : reg39)) : $signed((reg24 >= wire11))) : (&reg22)) ?
          $unsigned($signed($signed($signed(reg35)))) : {$unsigned({(reg25 < reg23),
                  {wire12}})}))
        begin
          reg47 <= (reg16[(4'hb):(1'h1)] >> (($signed(((8'ha4) == reg21)) ?
                  $signed({(7'h42)}) : $signed(((8'h9d) | wire10))) ?
              wire28[(3'h7):(3'h7)] : {reg35[(3'h6):(1'h1)], reg26}));
          reg48 <= $unsigned((({(+reg47)} ?
                  $signed((~^reg43)) : ((8'hae) ?
                      (reg18 ? reg14 : reg36) : (reg19 >= wire28))) ?
              ({$unsigned(wire29),
                  (^reg18)} < $unsigned((+reg36))) : ((^~(reg32 ?
                      wire29 : reg40)) ?
                  reg14 : reg25[(2'h3):(1'h0)])));
          reg49 <= (^~(^~reg38));
          reg50 <= ({(reg14 ^~ ((reg32 <= reg26) * (reg36 ?
                      reg21 : (7'h43))))} ?
              wire13 : (reg40 + reg20));
          reg51 <= reg21;
        end
      else
        begin
          reg47 <= ($signed(($unsigned(reg15[(4'hf):(4'h9)]) ^ {$signed(wire31),
                  (^~wire28)})) ?
              (($signed(wire31[(4'he):(4'he)]) ^ $signed({(8'hb7),
                  reg15})) < $signed($signed(((8'h9f) == reg35)))) : reg18[(1'h1):(1'h1)]);
          reg48 <= $signed((-(((reg46 ? reg46 : (8'hb6)) ?
                  (^~reg46) : (wire8 <<< reg20)) ?
              reg43[(3'h4):(1'h1)] : $signed(reg27[(2'h2):(1'h0)]))));
          if ((^$unsigned($unsigned((wire28[(4'hb):(3'h7)] - (wire13 ?
              (8'hb9) : (7'h41)))))))
            begin
              reg49 <= ($signed((8'hb8)) ?
                  $signed({((~&reg24) ? $signed((8'hba)) : (!(8'hab))),
                      ((~|reg14) < reg49)}) : $unsigned($unsigned({(reg21 ?
                          reg24 : reg25),
                      wire11[(1'h1):(1'h0)]})));
              reg50 <= $signed({reg47[(1'h0):(1'h0)]});
              reg51 <= ($unsigned(wire9[(2'h2):(2'h2)]) ?
                  (reg22[(3'h5):(3'h5)] ?
                      (7'h41) : $unsigned($unsigned(wire28))) : (^$unsigned($unsigned((8'hac)))));
              reg52 <= $signed(($unsigned((reg49[(4'ha):(3'h6)] ?
                      reg19[(1'h1):(1'h0)] : (^~reg26))) ?
                  reg16 : (reg14[(4'ha):(1'h1)] ?
                      (~(&reg39)) : $signed((reg16 ^ reg51)))));
            end
          else
            begin
              reg49 <= $unsigned($unsigned($unsigned(($signed(reg40) ?
                  (reg21 - reg40) : $signed(wire31)))));
              reg50 <= wire28;
              reg51 <= wire11[(1'h1):(1'h1)];
              reg52 <= ($unsigned(($signed({reg46,
                  reg17}) == (8'hbc))) ~^ (^wire28[(4'hb):(2'h2)]));
              reg53 <= (reg42[(3'h6):(2'h2)] ?
                  ({$signed((reg41 ? reg22 : wire13)),
                          (reg25[(2'h2):(1'h1)] ^~ $unsigned((8'h9d)))} ?
                      ((wire28[(3'h7):(2'h3)] > (reg42 <= (8'hb8))) ?
                          $unsigned((|reg41)) : $unsigned(reg19)) : wire11) : wire8);
            end
          if (reg48[(1'h1):(1'h1)])
            begin
              reg54 <= reg40[(3'h6):(3'h5)];
            end
          else
            begin
              reg54 <= $unsigned(reg27[(2'h3):(1'h1)]);
              reg55 <= ((wire12 || $unsigned($unsigned(reg14))) ?
                  wire10[(1'h1):(1'h0)] : wire31[(4'hb):(3'h6)]);
              reg56 <= ({$unsigned(reg19)} ^~ $signed($signed({(8'hba)})));
              reg57 <= $signed(reg16);
            end
        end
      reg58 <= {{(((reg48 >> reg48) ?
                      reg48[(2'h2):(2'h2)] : (reg51 ~^ (8'hbc))) ?
                  ({reg44, reg18} <<< ((8'ha3) ? reg48 : reg34)) : ({wire8,
                          reg37} ?
                      (!reg16) : reg26[(3'h7):(3'h7)]))},
          $unsigned($signed(reg50[(3'h7):(2'h2)]))};
      reg59 <= reg51[(4'h8):(3'h6)];
      reg60 <= $signed(({($unsigned(reg44) ?
              {reg53, reg34} : (reg48 ? reg49 : wire10)),
          $unsigned({(8'hb7), reg48})} < (((~|reg24) == ((8'hba) ?
          wire10 : reg21)) >= $signed(((8'hb6) ? (8'hb3) : (8'hbc))))));
    end
  module61 #() modinst90 (wire89, clk, reg58, reg34, reg32, wire31);
  assign wire91 = $unsigned($unsigned($unsigned(((|wire30) ? wire8 : reg39))));
  always
    @(posedge clk) begin
      reg92 <= ((($signed((^~reg49)) ?
          ((+reg45) == (~&reg52)) : ((reg49 ?
              reg20 : reg32) ~^ $signed(reg37))) && wire11[(3'h6):(3'h6)]) != $unsigned($signed({(reg48 >>> reg24),
          reg48})));
      reg93 <= ((~wire13) ? $signed((+reg55)) : (^(^~wire29)));
      reg94 <= (~reg60);
      reg95 <= (+$unsigned({reg33[(3'h6):(1'h0)]}));
    end
  assign wire96 = $unsigned($signed($signed($signed(reg36))));
  module97 #() modinst110 (wire109, clk, reg51, reg55, reg48, wire31);
  assign wire111 = $unsigned(reg58[(1'h1):(1'h0)]);
  assign wire112 = (~^reg14[(5'h14):(4'hc)]);
  module113 #() modinst149 (.wire114(wire9), .y(wire148), .wire116(reg47), .clk(clk), .wire115(reg22), .wire118(reg33), .wire117(reg21));
  assign wire150 = {((^$unsigned((~^(8'hbe)))) ?
                           $unsigned({(~reg45), (!reg41)}) : $signed(reg33))};
  assign wire151 = $signed($unsigned(((|reg34) ?
                       $unsigned($unsigned(reg92)) : (~reg50[(2'h2):(1'h0)]))));
  assign wire152 = $unsigned($unsigned($signed($signed($unsigned(wire109)))));
  assign wire153 = $signed($signed((reg52[(1'h1):(1'h0)] - {(|reg56)})));
  module154 #() modinst186 (wire185, clk, reg18, reg15, reg93, wire31);
  assign wire187 = $signed($signed($signed($unsigned((^~reg53)))));
  assign wire188 = ((|{(+$signed((8'ha1)))}) ?
                       (reg56[(2'h2):(2'h2)] ?
                           wire10[(1'h1):(1'h1)] : $unsigned(($signed(wire13) ?
                               $unsigned((7'h41)) : reg38[(2'h3):(1'h0)]))) : ({$signed((^(8'h9f)))} * (~^(wire148[(1'h1):(1'h0)] ^~ reg55[(4'h9):(3'h4)]))));
endmodule

module module154
#(parameter param183 = ((!(((+(8'ha0)) ? ((8'hb1) ? (8'h9c) : (8'hb8)) : ((8'hb2) ? (7'h43) : (8'hb6))) ? (~((7'h44) ? (8'ha0) : (8'hab))) : (~|((7'h41) ? (8'hbb) : (8'ha8))))) ? (8'hba) : (({((7'h41) ? (8'hb1) : (8'ha4))} ? {{(8'hbe), (8'hb6)}} : (^~((8'hac) ? (8'hb2) : (8'hae)))) ? {(((8'ha7) * (8'ha0)) ? ((8'ha0) <= (8'ha5)) : ((8'hac) ? (8'ha0) : (8'ha7)))} : (((~&(8'hbf)) ? ((8'h9c) ? (8'hbb) : (7'h43)) : ((8'hae) ? (8'hbe) : (8'haf))) + (((7'h40) ? (8'ha9) : (8'ha8)) ? ((8'haa) ^ (8'h9f)) : ((8'hb1) <<< (8'hb8)))))), 
parameter param184 = {((((~&param183) ? (param183 ? param183 : param183) : (!param183)) ? (param183 >>> ((7'h43) ? param183 : param183)) : ((param183 != param183) ? ((8'h9c) ? param183 : param183) : param183)) || {param183, ((&param183) + (param183 ? param183 : param183))}), ((param183 <= param183) ? {(^~(param183 << param183)), (~^(~param183))} : param183)})
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire158;
  input wire signed [(4'hb):(1'h0)] wire157;
  input wire [(4'he):(1'h0)] wire156;
  input wire signed [(3'h7):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire182;
  wire signed [(4'hb):(1'h0)] wire181;
  wire signed [(4'h8):(1'h0)] wire179;
  wire signed [(4'h9):(1'h0)] wire176;
  wire signed [(4'ha):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire signed [(2'h3):(1'h0)] wire162;
  wire [(4'h9):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire159;
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg171 = (1'h0);
  reg [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire179,
                 wire176,
                 wire175,
                 wire174,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 reg180,
                 reg178,
                 reg177,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire159 = ($unsigned({$unsigned($signed(wire158))}) == (~|wire158[(2'h3):(2'h3)]));
  assign wire160 = wire159;
  assign wire161 = ((wire155[(2'h3):(2'h3)] && (wire157 & ((|wire159) ?
                           (!(8'hb7)) : $unsigned(wire158)))) ?
                       $unsigned((8'h9d)) : $signed(({((8'hbd) ?
                               wire159 : wire155),
                           $signed(wire159)} && wire156)));
  assign wire162 = $signed($unsigned({$signed({wire156, wire158}),
                       ((wire157 ? wire156 : wire160) * $unsigned((8'h9d)))}));
  always
    @(posedge clk) begin
      reg163 <= wire155;
      reg164 <= {wire159, (|$unsigned($signed(wire157[(4'ha):(3'h5)])))};
      reg165 <= $unsigned(({(+wire161)} ? reg164 : $unsigned(wire158)));
      if ({reg163})
        begin
          if ($signed((&$signed($signed((|wire161))))))
            begin
              reg166 <= wire156;
              reg167 <= {({$signed(((8'hb7) ? wire161 : wire162)),
                      $unsigned({(8'hb8)})} >= (~&($signed(reg165) ?
                      $signed(wire159) : $signed(reg163))))};
              reg168 <= reg164;
              reg169 <= $unsigned((^$signed(wire162)));
              reg170 <= (+reg166[(2'h3):(1'h0)]);
            end
          else
            begin
              reg166 <= $unsigned(reg167);
            end
          reg171 <= wire160[(4'ha):(1'h0)];
          reg172 <= ($signed(wire156[(4'h9):(3'h7)]) ?
              (&{wire156}) : reg167[(1'h1):(1'h0)]);
          reg173 <= ((-($unsigned($unsigned(wire162)) < $signed(reg170))) ?
              reg165 : wire159);
        end
      else
        begin
          if ((+wire161))
            begin
              reg166 <= ((wire155[(1'h0):(1'h0)] ?
                      $unsigned((reg167[(2'h2):(1'h0)] ?
                          wire160[(2'h3):(1'h1)] : $signed(wire161))) : (wire157 ?
                          reg172 : wire156)) ?
                  $unsigned($signed(((wire161 ?
                      reg169 : wire160) * (~^wire158)))) : reg167[(3'h7):(1'h1)]);
            end
          else
            begin
              reg166 <= {wire159[(3'h7):(3'h5)]};
              reg167 <= (~^{wire157});
              reg168 <= reg173;
            end
        end
    end
  assign wire174 = reg164[(4'h8):(3'h6)];
  assign wire175 = reg169;
  assign wire176 = (~reg164[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg177 <= (^(8'ha1));
      reg178 <= wire161[(2'h3):(1'h0)];
    end
  assign wire179 = $signed(wire159[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg180 <= reg173[(1'h0):(1'h0)];
    end
  assign wire181 = reg163;
  assign wire182 = $signed(reg177[(4'h8):(1'h1)]);
endmodule

module module113
#(parameter param146 = ((((+(^(8'hae))) ~^ (&(~^(8'hbd)))) ? ({{(8'hab), (8'ha5)}} ^~ ((^(8'ha6)) >> ((7'h41) ? (8'hb4) : (8'hbe)))) : ({(~^(8'ha2))} >> {((8'h9f) | (8'hbd)), (^(8'hbc))})) - ((((+(8'haa)) ? {(7'h43)} : (&(8'hb2))) ? ({(7'h43), (8'hb3)} != (|(8'hba))) : (((8'hab) ? (8'hbb) : (8'hbc)) ? (&(8'ha6)) : ((8'hb2) ? (8'haa) : (8'hae)))) & {((-(8'ha2)) ? (-(8'ha8)) : {(8'ha3)}), (+{(7'h44), (8'hb9)})})), 
parameter param147 = ({param146} ? ((~(8'hbc)) ? {(param146 ? (|param146) : (~^param146))} : (((~|param146) ? {param146} : (param146 ? param146 : param146)) ? (~|param146) : (~&(param146 ? param146 : param146)))) : {((((8'hb4) ? param146 : param146) << (param146 ? param146 : param146)) >> ((~&param146) ? (param146 * param146) : {param146}))}))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire118;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire [(4'h9):(1'h0)] wire115;
  input wire signed [(4'ha):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire145;
  wire [(4'hb):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire [(4'he):(1'h0)] wire140;
  wire [(5'h13):(1'h0)] wire139;
  wire [(5'h14):(1'h0)] wire138;
  wire signed [(3'h4):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire121,
                 wire120,
                 wire119,
                 reg142,
                 reg141,
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
                 (1'h0)};
  assign wire119 = wire114;
  assign wire120 = ({($unsigned((8'ha2)) ?
                               {(&wire119),
                                   (~wire114)} : $unsigned((wire114 || wire119)))} ?
                       $signed($unsigned((wire117 && wire115[(3'h5):(2'h2)]))) : (({(~^wire116),
                               (~&wire116)} ?
                           $unsigned($signed(wire115)) : (^~wire116)) || wire119[(1'h0):(1'h0)]));
  assign wire121 = $signed((~|($signed(wire118[(3'h4):(1'h0)]) ?
                       $signed(wire119[(3'h6):(3'h6)]) : wire114)));
  always
    @(posedge clk) begin
      if (wire120[(2'h2):(1'h0)])
        begin
          reg122 <= $signed((wire116[(3'h4):(1'h0)] ?
              (wire116[(2'h3):(2'h2)] != (~&(8'had))) : wire115[(3'h7):(2'h2)]));
          if ($signed(({$unsigned((wire119 > wire115))} ? reg122 : wire114)))
            begin
              reg123 <= (wire114 & (($unsigned((wire116 <<< wire119)) - reg122[(3'h4):(3'h4)]) ?
                  wire114[(4'ha):(4'h9)] : wire119[(3'h6):(2'h2)]));
              reg124 <= (wire117 + ($signed(wire118[(2'h3):(1'h0)]) ?
                  (reg122[(3'h4):(3'h4)] ?
                      $signed(wire120[(1'h0):(1'h0)]) : $signed($signed(wire121))) : $unsigned($unsigned((wire115 >> wire115)))));
              reg125 <= wire119[(2'h2):(1'h1)];
              reg126 <= (^~(wire120 | (!wire121[(3'h4):(1'h0)])));
              reg127 <= reg125;
            end
          else
            begin
              reg123 <= (~reg122[(4'h9):(2'h2)]);
              reg124 <= {(reg123 >>> wire114[(3'h5):(2'h2)]), (8'hac)};
              reg125 <= ($signed($unsigned(wire120[(1'h0):(1'h0)])) > {{$signed($signed((8'hb6)))}});
              reg126 <= $unsigned($unsigned($signed({((8'hb6) >= wire119),
                  $signed(reg124)})));
              reg127 <= (wire115[(2'h2):(1'h0)] ^~ (((reg127[(4'he):(2'h3)] ?
                  (~&reg125) : wire121[(4'hb):(3'h7)]) >= wire114) || wire117));
            end
          reg128 <= ((~^{(+(~|wire120))}) == {$unsigned(wire118[(2'h3):(2'h3)]),
              $signed(reg123[(2'h3):(1'h1)])});
          reg129 <= (8'haa);
          reg130 <= (+wire118[(3'h5):(3'h5)]);
        end
      else
        begin
          reg122 <= reg122;
          reg123 <= (~&((($unsigned(wire117) ? (~|wire114) : {wire117}) ?
              wire121[(3'h7):(3'h5)] : (~&wire116)) != ($signed((wire114 != reg126)) + ($unsigned(wire114) < reg126))));
        end
      reg131 <= (|reg124);
      reg132 <= ((wire120 <= wire120) ?
          reg130[(5'h10):(4'h8)] : reg130[(3'h5):(2'h2)]);
      reg133 <= $signed((wire121[(4'h9):(3'h7)] ?
          wire118 : ((8'ha0) > reg131)));
    end
  assign wire134 = ((7'h42) ?
                       $signed((&wire120[(1'h1):(1'h0)])) : reg131[(4'he):(2'h3)]);
  assign wire135 = $signed($unsigned($unsigned({{wire120, reg128}})));
  assign wire136 = reg123;
  assign wire137 = (|$signed(wire120[(3'h6):(3'h6)]));
  assign wire138 = ($signed((8'ha8)) ?
                       {reg126,
                           $signed($unsigned((~|reg128)))} : reg131[(3'h6):(3'h4)]);
  assign wire139 = $signed(wire119);
  assign wire140 = wire116[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg141 <= $unsigned($signed((^~(~&{reg132}))));
      reg142 <= ($signed((wire120 >= ($unsigned(wire116) ?
          $unsigned(reg123) : (wire139 - reg125)))) & {((8'hb3) << reg127[(3'h6):(1'h0)])});
    end
  assign wire143 = (+wire135[(3'h6):(3'h5)]);
  assign wire144 = reg124[(3'h7):(3'h7)];
  assign wire145 = (^~wire139);
endmodule

module module97
#(parameter param108 = (^~(&(!((^(8'hbd)) <<< (-(8'hb1)))))))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire101;
  input wire [(3'h4):(1'h0)] wire100;
  input wire signed [(4'ha):(1'h0)] wire99;
  input wire signed [(5'h14):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  assign y = {wire107, wire106, wire105, wire104, wire103, wire102, (1'h0)};
  assign wire102 = wire100[(1'h0):(1'h0)];
  assign wire103 = wire99;
  assign wire104 = wire101;
  assign wire105 = wire101[(5'h12):(1'h1)];
  assign wire106 = (|wire105);
  assign wire107 = $unsigned((($signed(wire106[(4'h8):(2'h3)]) ?
                           wire105[(3'h7):(3'h7)] : (+(wire100 >= wire106))) ?
                       (8'ha7) : (+$unsigned(wire105))));
endmodule

module module61
#(parameter param87 = (((~^(+(~&(8'ha2)))) ? (|(((8'haf) > (8'hb8)) ? {(8'hb8)} : ((7'h41) * (8'hb1)))) : ((((8'h9c) ? (7'h42) : (8'hbd)) >= (~&(8'hb6))) ? (((8'h9f) ? (8'ha9) : (8'ha0)) <<< (|(8'had))) : ({(8'hb1), (7'h44)} >> ((7'h40) ? (8'hbd) : (8'ha1))))) <<< (8'ha7)), 
parameter param88 = ((~^({(param87 - param87), param87} | (param87 ? (8'hac) : param87))) ^ (~&((param87 ? param87 : ((8'hbe) ? param87 : param87)) <<< ({param87} & (param87 ? param87 : param87))))))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire65;
  input wire signed [(4'ha):(1'h0)] wire64;
  input wire signed [(3'h4):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire66;
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire66,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = ($unsigned(wire62) ^ wire62);
  always
    @(posedge clk) begin
      if ((8'hbe))
        begin
          reg67 <= $unsigned($unsigned(((wire66[(1'h1):(1'h0)] + (^~wire64)) < wire62)));
          if ((($unsigned($signed(wire62)) ?
              (-$signed(wire62)) : ((wire62 ? (reg67 <= reg67) : (+(8'hb7))) ?
                  wire66 : $signed((wire62 ?
                      wire66 : wire66)))) >> $signed((wire64 == wire63[(1'h1):(1'h1)]))))
            begin
              reg68 <= (wire63[(2'h3):(2'h3)] ?
                  wire62[(3'h7):(3'h6)] : (!reg67[(3'h5):(3'h5)]));
              reg69 <= (+$signed(($unsigned($unsigned(wire65)) >> ((wire65 ?
                      wire64 : reg68) ?
                  $signed(wire63) : wire66[(2'h3):(2'h2)]))));
              reg70 <= $unsigned(reg68);
              reg71 <= wire62[(2'h2):(1'h1)];
            end
          else
            begin
              reg68 <= ({$unsigned((!wire62)), reg67[(4'hc):(4'h8)]} ?
                  ($unsigned($signed(wire66)) ?
                      ((&reg68) ?
                          reg67 : reg67) : {$unsigned((wire65 && reg69))}) : $signed((reg71[(4'hd):(4'h8)] - wire62[(4'hb):(4'h8)])));
              reg69 <= (((({(8'ha7), reg67} ? (!reg71) : $unsigned(wire65)) ?
                      reg67[(3'h5):(3'h5)] : reg68) ?
                  wire65 : wire65) * wire62);
              reg70 <= reg68;
              reg71 <= $signed({wire63[(2'h3):(2'h2)]});
              reg72 <= ((reg71[(4'h8):(2'h2)] >>> (-wire62)) > (!($unsigned(reg70[(1'h1):(1'h1)]) ?
                  (^{wire63, reg67}) : reg67)));
            end
        end
      else
        begin
          if ({reg67})
            begin
              reg67 <= reg69;
              reg68 <= $unsigned((($signed(reg68) >>> wire66) ?
                  $signed(((reg69 ? wire65 : reg70) ?
                      $signed(reg67) : reg67)) : (-($unsigned(wire62) ~^ {wire63,
                      reg69}))));
              reg69 <= ($signed(($unsigned((8'hb2)) ?
                      reg68[(1'h1):(1'h1)] : ((|wire64) < wire66[(2'h2):(1'h0)]))) ?
                  {$signed(wire66[(1'h0):(1'h0)])} : ($unsigned((reg69 >= (^(8'hb7)))) ?
                      $signed($signed($unsigned(reg68))) : {((wire64 ^~ wire65) ?
                              wire65 : ((7'h43) & (8'ha8)))}));
            end
          else
            begin
              reg67 <= (~&$signed(reg67[(4'ha):(3'h7)]));
              reg68 <= reg70;
              reg69 <= $signed(wire65);
            end
          if (((($unsigned((|wire62)) ~^ wire65[(2'h2):(1'h0)]) & (^(wire63 + wire63[(3'h4):(2'h3)]))) ?
              reg71[(5'h11):(3'h4)] : (wire63 ?
                  wire64[(4'h8):(2'h3)] : (8'hbe))))
            begin
              reg70 <= (7'h41);
              reg71 <= ($signed(($unsigned(reg68) ?
                  ({reg70, reg72} ?
                      $signed(wire62) : (~^reg70)) : $unsigned(reg72[(4'h8):(3'h7)]))) << $signed({((reg71 >> reg67) ?
                      ((8'hb1) ? wire63 : (8'hab)) : {wire65}),
                  (wire64[(2'h2):(1'h1)] ?
                      wire62[(3'h6):(2'h2)] : (reg68 ? reg69 : wire65))}));
              reg72 <= reg68[(1'h0):(1'h0)];
              reg73 <= $signed($unsigned((+$signed($unsigned(reg71)))));
              reg74 <= $signed((|$unsigned((^(&reg69)))));
            end
          else
            begin
              reg70 <= wire63;
              reg71 <= (reg70 << reg68);
              reg72 <= reg71[(3'h4):(2'h2)];
            end
          reg75 <= (8'hb4);
          if ({((8'ha8) ?
                  ((reg74 >= wire65) ^~ {(wire62 ?
                          reg74 : wire63)}) : $unsigned(wire62)),
              reg68[(2'h3):(1'h0)]})
            begin
              reg76 <= wire64;
              reg77 <= reg76;
              reg78 <= {$signed((~$signed($unsigned((8'h9f))))),
                  $signed(((~^(reg72 ? wire66 : reg70)) ?
                      (^(~|(8'ha7))) : ($signed((8'ha6)) == reg67[(4'hb):(4'hb)])))};
              reg79 <= $signed(wire66[(2'h3):(2'h2)]);
              reg80 <= $unsigned(wire65[(1'h0):(1'h0)]);
            end
          else
            begin
              reg76 <= reg72[(5'h12):(5'h10)];
            end
        end
      reg81 <= {(((wire62 | reg69[(3'h4):(1'h0)]) ?
                  (wire63 >>> wire62[(4'h9):(3'h6)]) : $signed(wire62)) ?
              (|(-{reg70, (8'hbc)})) : wire62[(4'ha):(4'h9)])};
      if ($signed($signed($signed($signed(reg73)))))
        begin
          reg82 <= {$unsigned($unsigned((wire63 ?
                  (reg71 ? reg70 : wire66) : (reg75 ? wire63 : reg76))))};
          reg83 <= (reg72 ~^ (~({(reg81 ? reg77 : (8'h9d))} ?
              wire66[(1'h1):(1'h1)] : reg75[(3'h4):(2'h2)])));
        end
      else
        begin
          reg82 <= ((~(8'hb2)) < $signed($signed(((7'h42) >> reg72))));
        end
    end
  assign wire84 = (~&(wire66 ?
                      (wire66 ?
                          $signed(reg76[(4'hb):(3'h4)]) : (-$unsigned(wire64))) : reg73));
  assign wire85 = $unsigned(reg82[(5'h11):(4'hd)]);
  assign wire86 = (&$signed($signed($signed($unsigned(reg70)))));
endmodule
