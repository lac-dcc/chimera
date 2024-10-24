module top
#(parameter param105 = ({((((8'hab) & (8'ha1)) ? (^~(8'hb4)) : (!(7'h40))) - ({(8'ha5)} - ((7'h40) >= (8'ha3))))} || {(~((!(8'hae)) || (!(8'hab))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire103;
  reg signed [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire12,
                 wire13,
                 wire14,
                 wire19,
                 wire20,
                 wire21,
                 wire33,
                 wire34,
                 wire103,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1[(3'h4):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = $signed((((~|(~&(8'ha4))) ?
                     wire2 : wire2) != wire2[(4'hb):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= ({$signed(((-wire3) ?
              $unsigned(wire0) : $signed(wire6)))} < wire1[(3'h7):(2'h2)]);
      reg8 <= ((~^{$signed($signed(wire5))}) ?
          (~^wire3[(2'h3):(2'h2)]) : $signed((((wire6 ?
                  wire0 : (8'ha0)) & $unsigned(wire1)) ?
              (wire6 < (wire0 && reg7)) : (wire4[(3'h4):(1'h1)] ?
                  $signed((8'hb3)) : wire2))));
      reg9 <= $signed(wire6);
      reg10 <= {reg7[(2'h3):(2'h3)],
          ((8'hae) ^~ {(wire4 ? $unsigned(reg9) : (&reg9))})};
      reg11 <= wire1[(2'h3):(2'h3)];
    end
  assign wire12 = (wire1[(4'h9):(3'h4)] ?
                      ((7'h40) ?
                          (&($unsigned(wire6) >= (wire4 & wire0))) : (wire6 ?
                              $signed((wire0 ?
                                  wire5 : wire5)) : $unsigned(reg7[(3'h4):(2'h3)]))) : reg11);
  assign wire13 = reg10;
  assign wire14 = $unsigned((7'h42));
  always
    @(posedge clk) begin
      reg15 <= reg9[(1'h1):(1'h0)];
      reg16 <= ((+wire2[(4'hc):(2'h2)]) <= (+((8'h9d) ?
          ((+wire2) & reg8[(3'h5):(3'h5)]) : ((wire13 ? wire13 : wire1) ?
              ((8'haf) > (8'hba)) : (wire1 ? reg11 : (8'hac))))));
      reg17 <= (^~{reg7, $signed(($unsigned(wire1) <= $unsigned(wire13)))});
      reg18 <= wire12[(3'h4):(3'h4)];
    end
  assign wire19 = $signed((-($unsigned((wire5 ? reg17 : wire12)) ?
                      (8'h9d) : reg11[(3'h4):(3'h4)])));
  assign wire20 = ((7'h43) ?
                      (7'h43) : (wire6[(3'h6):(3'h6)] * ((wire12 ?
                              wire13[(3'h5):(2'h2)] : (8'hb1)) ?
                          reg18 : $signed((~wire2)))));
  assign wire21 = (~|wire2[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg22 <= ($unsigned($unsigned($signed({wire13, reg11}))) >> wire1);
      reg23 <= (wire21[(5'h10):(4'hc)] ?
          reg18 : (reg16[(4'he):(3'h7)] && ((^reg22[(5'h12):(4'h8)]) && $unsigned((wire0 ?
              wire13 : wire3)))));
      if ((^$unsigned((({reg17, reg23} ?
          ((8'ha1) ^~ wire4) : (wire12 ?
              reg9 : (8'hb7))) & reg10[(3'h5):(2'h2)]))))
        begin
          reg24 <= ($signed({((wire19 ? wire21 : wire6) > $unsigned(reg18)),
                  wire6[(3'h6):(1'h0)]}) ?
              {((wire13[(4'hb):(3'h4)] + (&(8'hab))) ?
                      $unsigned($signed(reg17)) : $unsigned((reg15 ?
                          wire4 : wire20))),
                  $signed({$signed(reg16)})} : $unsigned((|reg10)));
          reg25 <= wire3[(4'hc):(3'h5)];
          if ((~(reg7 && $signed(reg25[(3'h4):(3'h4)]))))
            begin
              reg26 <= $signed((^($unsigned((reg11 == reg25)) <= $signed((reg25 == reg23)))));
              reg27 <= wire4;
              reg28 <= wire13;
              reg29 <= wire14;
            end
          else
            begin
              reg26 <= (~&{((^(wire14 && reg17)) <<< reg18[(3'h5):(3'h5)]),
                  {$signed({reg25}), reg16}});
              reg27 <= (8'h9d);
            end
          reg30 <= (-{$signed(reg25[(2'h3):(1'h0)]),
              $signed($signed($unsigned(reg23)))});
          reg31 <= (^~wire14[(3'h7):(2'h3)]);
        end
      else
        begin
          if ($signed($signed($signed((^(reg25 ? reg16 : wire1))))))
            begin
              reg24 <= wire2;
              reg25 <= ((-reg25) ?
                  $unsigned((~(wire13[(1'h0):(1'h0)] & $unsigned(reg23)))) : $unsigned({reg30,
                      reg15}));
              reg26 <= ((~$unsigned((reg25[(4'hb):(3'h6)] < ((8'hac) ?
                      reg26 : reg24)))) ?
                  $unsigned(reg31) : (reg29 ? wire0[(4'hc):(3'h5)] : reg31));
            end
          else
            begin
              reg24 <= $unsigned($unsigned({reg15[(3'h6):(3'h5)]}));
              reg25 <= (~&(8'h9c));
              reg26 <= {($signed((8'hb9)) & $signed($unsigned(wire1[(4'hf):(4'hc)])))};
            end
          reg27 <= (wire6 != reg10[(4'hb):(1'h0)]);
          reg28 <= $unsigned((({wire1[(4'hc):(4'ha)]} ?
                  (^~$unsigned(wire4)) : ($unsigned(wire3) ?
                      wire4[(3'h4):(3'h4)] : (wire14 + reg29))) ?
              $unsigned(reg18[(4'h8):(3'h7)]) : (wire6[(1'h0):(1'h0)] ?
                  (((8'hb4) ? reg30 : (8'ha6)) ?
                      wire13 : (reg11 << reg28)) : reg26[(1'h0):(1'h0)])));
          reg29 <= (($signed(($unsigned(reg29) ? $signed(wire6) : (&reg31))) ?
              ((reg28[(1'h1):(1'h1)] ?
                  (&reg31) : (8'ha1)) && {$signed(wire5)}) : ((~wire4) >= $unsigned($signed(reg7)))) >> wire4);
        end
      reg32 <= ((&wire13[(2'h2):(1'h0)]) ?
          $signed($unsigned({$signed(wire2),
              (7'h41)})) : (($unsigned((reg16 && wire5)) ?
              wire0[(3'h4):(1'h0)] : reg15[(5'h13):(5'h12)]) >> ($unsigned($unsigned(wire21)) ?
              wire4 : reg30[(2'h2):(1'h0)])));
    end
  assign wire33 = $unsigned($signed(reg32));
  assign wire34 = (wire6[(2'h2):(2'h2)] >= ($signed(($signed((8'hba)) ?
                      (wire6 ?
                          wire20 : reg15) : reg30[(1'h1):(1'h0)])) - wire19));
  module35 #() modinst104 (wire103, clk, wire6, reg23, reg11, wire14, wire34);
endmodule

module module35
#(parameter param102 = ((^((((8'hb4) | (8'hb0)) ? ((8'hbc) ~^ (8'h9c)) : (7'h42)) && ((^~(8'h9d)) + (~|(8'hb8))))) ? ((((~|(8'hb4)) * (8'ha2)) ? (+(&(8'hb9))) : (((8'hb6) ? (8'hae) : (8'haa)) ^~ ((8'ha4) ? (8'h9c) : (8'hbb)))) ? (~&((~(8'ha8)) ? {(8'hb8)} : (^~(7'h40)))) : (((~|(8'hbf)) <<< {(8'h9d), (8'ha5)}) ? (&(7'h43)) : (~|((8'ha2) ? (8'ha3) : (8'hbf))))) : (8'hb1)))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire signed [(3'h5):(1'h0)] wire38;
  input wire [(4'hc):(1'h0)] wire37;
  input wire signed [(5'h10):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire41;
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  assign y = {wire100,
                 wire51,
                 wire50,
                 wire41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 (1'h0)};
  assign wire41 = ({(($signed(wire38) ?
                              (|wire37) : (wire40 ?
                                  wire38 : wire39)) ~^ {(~&wire38),
                              $signed(wire38)}),
                          $unsigned(wire40)} ?
                      wire37 : $unsigned({{(^~wire39)}, $unsigned(wire39)}));
  always
    @(posedge clk) begin
      reg42 <= $signed({$unsigned($signed($unsigned((8'h9f))))});
      reg43 <= wire36;
      if ({{(((&wire39) ? $unsigned(wire37) : $unsigned(reg42)) ?
                  wire37 : $signed($unsigned((8'ha0))))}})
        begin
          if (wire41[(5'h12):(4'hb)])
            begin
              reg44 <= $unsigned(($signed($unsigned(((8'ha6) <<< (8'hab)))) | wire37[(3'h6):(2'h3)]));
              reg45 <= $unsigned($signed((+$unsigned((wire40 << wire41)))));
              reg46 <= wire38;
            end
          else
            begin
              reg44 <= wire36[(3'h4):(1'h1)];
              reg45 <= (-$unsigned(($signed($unsigned(wire41)) ?
                  (-{reg46}) : $signed(wire40[(3'h4):(3'h4)]))));
              reg46 <= (+reg42);
              reg47 <= ({($unsigned($unsigned((8'h9c))) ?
                          wire39 : {wire37[(4'hc):(1'h1)]}),
                      ($unsigned(reg46) & $signed($unsigned(reg42)))} ?
                  (7'h41) : $unsigned(((wire41[(3'h7):(3'h5)] ?
                          (8'ha7) : reg46[(1'h1):(1'h0)]) ?
                      $signed(reg46[(1'h1):(1'h1)]) : $unsigned($signed((8'hbc))))));
              reg48 <= $unsigned((^$unsigned(wire37[(1'h0):(1'h0)])));
            end
          reg49 <= {$unsigned(wire37),
              (wire40[(1'h0):(1'h0)] ?
                  (((^reg43) ? $signed(wire39) : wire37[(2'h2):(1'h0)]) ?
                      wire39 : $signed(reg42)) : $unsigned({((8'hbc) ^~ reg48)}))};
        end
      else
        begin
          reg44 <= $signed((wire40 ?
              (!({reg48, reg49} ?
                  (reg46 >= reg49) : (wire40 ?
                      reg48 : wire40))) : ((reg42[(3'h4):(1'h1)] ?
                      (reg44 ? (8'hb9) : wire40) : {reg42}) ?
                  $signed(reg44) : {(7'h40)})));
          reg45 <= $unsigned((8'had));
          reg46 <= (|(^$unsigned(wire36)));
        end
    end
  assign wire50 = ($unsigned($unsigned(((|wire37) < (reg43 ?
                      wire38 : wire37)))) <<< $signed(reg47[(1'h1):(1'h1)]));
  assign wire51 = (reg48[(4'h8):(3'h4)] && $unsigned($signed(($unsigned(reg49) >>> wire36))));
  always
    @(posedge clk) begin
      reg52 <= wire39[(3'h5):(3'h5)];
      reg53 <= $signed(wire39[(3'h4):(1'h0)]);
      if (((reg45 >= ((8'hbf) << {wire38[(2'h3):(1'h1)]})) & (|$signed($signed(reg44[(3'h4):(1'h0)])))))
        begin
          if ($signed((($unsigned((reg46 + (8'hb0))) + ($signed(reg44) ?
              (reg46 ? wire41 : (8'hba)) : (~^(8'hb7)))) >= (8'hbc))))
            begin
              reg54 <= $signed($unsigned(reg46[(2'h3):(1'h0)]));
              reg55 <= $signed(reg48[(4'hf):(2'h2)]);
              reg56 <= {wire50, $unsigned($unsigned((~&reg54)))};
            end
          else
            begin
              reg54 <= (reg48 ?
                  {$signed(reg46),
                      wire50} : (|$signed($signed($unsigned(reg53)))));
            end
          reg57 <= $unsigned((((reg42[(2'h3):(1'h1)] ?
                      (~wire36) : $signed(reg52)) ?
                  (|$signed(wire36)) : reg43[(2'h3):(1'h1)]) ?
              reg52 : $unsigned(reg42[(4'ha):(4'h8)])));
          reg58 <= $unsigned($signed(reg55[(2'h2):(2'h2)]));
          reg59 <= $unsigned($signed($unsigned($unsigned((wire36 <= reg57)))));
        end
      else
        begin
          if (wire40[(1'h0):(1'h0)])
            begin
              reg54 <= $unsigned($signed(wire50));
              reg55 <= $unsigned({(^$unsigned($signed(reg52)))});
              reg56 <= $signed(wire36[(5'h10):(4'hb)]);
              reg57 <= $signed((reg54 > reg43));
            end
          else
            begin
              reg54 <= (|reg42[(3'h7):(3'h7)]);
              reg55 <= {wire38,
                  $signed((reg46 ^ (reg45 ? reg48[(2'h3):(1'h0)] : reg43)))};
              reg56 <= reg46;
              reg57 <= wire39;
            end
          if ({($unsigned(($signed((7'h40)) ? reg43 : (wire36 <= reg58))) ?
                  (-($unsigned((8'haa)) ?
                      wire39 : $signed(reg55))) : {$unsigned(wire40)})})
            begin
              reg58 <= $signed($unsigned((&(|$unsigned(reg48)))));
              reg59 <= $unsigned(reg42);
              reg60 <= (|$signed(($unsigned((reg53 || wire41)) ?
                  $unsigned((reg43 ~^ reg57)) : (&(reg52 <<< (8'hb9))))));
              reg61 <= reg48;
              reg62 <= ($unsigned(wire39) ?
                  ({(reg48 + reg57),
                          (wire51[(2'h2):(2'h2)] ?
                              $unsigned(reg44) : (~&reg58))} ?
                      $unsigned(reg43[(4'h9):(3'h5)]) : ($signed((wire51 - reg55)) ?
                          $signed($signed(reg53)) : (wire38 > (reg56 || reg57)))) : ($unsigned(((|reg44) ?
                      reg61 : reg43)) >> (^~{$unsigned(wire40)})));
            end
          else
            begin
              reg58 <= $signed(reg56[(3'h6):(2'h2)]);
              reg59 <= $signed($unsigned(((!{reg58}) > $unsigned($signed(wire41)))));
            end
          reg63 <= (reg60 >= ((reg55[(2'h3):(2'h2)] | reg59) <= reg58[(5'h10):(2'h3)]));
          reg64 <= wire41[(3'h5):(1'h0)];
          reg65 <= (+$unsigned(($unsigned((reg58 * (8'hb7))) ?
              $signed($signed((8'ha3))) : (~^(^reg47)))));
        end
    end
  module66 #() modinst101 (.wire69(reg48), .wire67(reg47), .y(wire100), .wire71(wire39), .wire70(reg56), .wire68(wire40), .clk(clk));
endmodule

module module66
#(parameter param98 = (8'hb2), 
parameter param99 = (param98 <<< (param98 <<< ((param98 ? {param98, param98} : (!param98)) ? param98 : ((&param98) << (param98 ? param98 : param98))))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire72;
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire72,
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
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire72 = (|wire68);
  always
    @(posedge clk) begin
      reg73 <= (((wire69[(4'hd):(2'h3)] ?
          $unsigned(wire68) : wire69) >>> $unsigned({(~^(7'h42)),
          $unsigned(wire72)})) >= $signed($unsigned((+(wire70 ?
          wire68 : wire67)))));
      if ({(wire69[(4'h8):(1'h1)] >>> ((reg73 << $signed(wire68)) ?
              {(wire72 - (8'hab)),
                  ((7'h41) ? wire69 : wire71)} : $signed((wire68 >> wire70)))),
          $unsigned((~|wire69))})
        begin
          reg74 <= $unsigned({((8'ha2) | $unsigned((wire72 != wire70)))});
          reg75 <= ((wire70 << wire70) ?
              {$unsigned(wire70[(1'h1):(1'h1)])} : ($unsigned((wire72 < $unsigned((8'hbb)))) << {$unsigned($signed(wire72)),
                  {wire71[(4'h9):(2'h2)]}}));
          reg76 <= $unsigned(reg75);
          reg77 <= (-$signed(wire72[(2'h3):(1'h0)]));
        end
      else
        begin
          if (reg74[(2'h3):(1'h0)])
            begin
              reg74 <= {(~|$unsigned((((8'hb6) ^~ reg73) >>> (~|reg75))))};
              reg75 <= ((-(((reg73 ?
                      (8'hb1) : reg73) - (reg77 < wire69)) + reg77)) ?
                  wire69[(1'h1):(1'h0)] : wire70);
              reg76 <= (wire72[(2'h2):(1'h0)] != (reg73 ?
                  $unsigned((~wire71[(5'h13):(3'h4)])) : (+(+{wire68}))));
              reg77 <= (($unsigned(((^~wire71) >= $unsigned(wire71))) ?
                  ($signed({wire72, wire69}) ?
                      (-{wire68,
                          (8'hac)}) : $unsigned(wire67[(3'h7):(3'h5)])) : ($signed((wire70 ?
                          reg73 : (8'hb7))) ?
                      {$unsigned(wire71),
                          reg76[(3'h5):(3'h4)]} : reg73[(4'hc):(2'h2)])) >>> $signed(((~^(wire70 == reg74)) <<< (~&wire72[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg74 <= $signed((reg76[(3'h6):(1'h0)] ?
                  ((8'ha9) ~^ ((8'hbc) ?
                      reg73[(3'h5):(3'h4)] : wire67[(2'h3):(2'h2)])) : reg73[(4'h9):(1'h0)]));
              reg75 <= $unsigned(($signed(wire69) >> $signed((7'h42))));
              reg76 <= {(wire72 ?
                      (wire70[(1'h0):(1'h0)] ?
                          (~|$unsigned(wire67)) : ((reg74 ?
                              wire67 : wire70) <= $unsigned(reg73))) : (&{(~&wire72)})),
                  $signed(wire68[(1'h1):(1'h0)])};
              reg77 <= $unsigned(($unsigned(($unsigned((8'had)) ?
                  (~reg73) : wire71[(3'h5):(3'h5)])) ^~ ((reg75 >= ((8'hb3) ?
                  (8'hb8) : wire69)) >> wire67)));
            end
          reg78 <= $signed(reg74);
          reg79 <= $signed($unsigned($unsigned(({(8'hab)} ?
              ((8'ha3) ? reg78 : reg75) : $signed(reg75)))));
          reg80 <= wire68[(1'h1):(1'h1)];
          if (reg73[(4'hb):(3'h6)])
            begin
              reg81 <= {reg73[(4'h9):(3'h4)],
                  {({$signed(reg73), reg76} == reg74[(1'h0):(1'h0)]),
                      $unsigned((&$signed(reg75)))}};
              reg82 <= wire71[(1'h1):(1'h0)];
              reg83 <= $unsigned((+($signed($unsigned(reg81)) == ({wire71} >= wire69[(1'h1):(1'h1)]))));
              reg84 <= $signed(reg75[(3'h5):(2'h2)]);
              reg85 <= reg81;
            end
          else
            begin
              reg81 <= {(8'ha6), reg84};
              reg82 <= $unsigned((^(+($signed(reg76) ?
                  (!reg77) : $signed(wire69)))));
              reg83 <= (reg74 <<< ({reg84,
                      ((-reg83) << (reg85 ? reg78 : reg75))} ?
                  ((reg82[(2'h3):(1'h0)] || (wire72 ? wire68 : wire71)) ?
                      reg78[(3'h4):(2'h2)] : reg81) : wire67));
              reg84 <= (8'h9f);
            end
        end
      reg86 <= (&(reg83[(2'h3):(1'h1)] == (reg80[(1'h0):(1'h0)] == $unsigned((reg79 < wire69)))));
    end
  assign wire87 = reg82;
  assign wire88 = (($unsigned({(~|reg85)}) ?
                      reg83 : (&$signed(reg86))) != (~|wire67));
  assign wire89 = (&reg79);
  assign wire90 = wire72;
  assign wire91 = ($signed($unsigned(wire87[(2'h2):(1'h1)])) == reg76[(2'h2):(1'h1)]);
  assign wire92 = $unsigned(($signed(reg79[(5'h13):(1'h1)]) == (({wire88,
                      reg76} * (wire89 ^~ (8'hbc))) != $signed(reg75))));
  assign wire93 = (reg76[(1'h0):(1'h0)] * (reg81 ~^ ($signed((wire87 ?
                          wire92 : reg77)) ?
                      {(wire87 ? reg77 : reg82),
                          ((8'ha2) ? reg78 : wire89)} : (wire71 ?
                          (reg86 ? reg73 : reg78) : (reg86 ?
                              reg77 : wire87)))));
  assign wire94 = (((wire70[(1'h0):(1'h0)] <= (&(reg75 + reg83))) > {reg85[(4'hd):(1'h0)]}) && (~((-(|reg84)) ?
                      wire87[(2'h2):(2'h2)] : $unsigned(wire90))));
  assign wire95 = (~^(wire68[(1'h0):(1'h0)] ?
                      wire71[(3'h5):(2'h2)] : (wire69[(4'hb):(3'h5)] ?
                          ((wire93 ^~ reg85) ?
                              $unsigned((8'ha3)) : (7'h40)) : (^~(reg73 ?
                              wire94 : reg75)))));
  assign wire96 = (!(wire88 ?
                      ((!wire69[(4'ha):(4'h9)]) ?
                          reg78[(3'h5):(1'h1)] : $signed((reg75 ?
                              reg77 : (8'hb0)))) : wire67));
  assign wire97 = $unsigned($signed(reg75));
endmodule
