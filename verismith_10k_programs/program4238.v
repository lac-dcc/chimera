module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire103,
                 wire95,
                 wire93,
                 wire80,
                 wire24,
                 wire18,
                 wire5,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  assign wire5 = wire4[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= wire3;
      reg7 <= $unsigned((-(^~(+(wire5 ? (8'ha9) : wire3)))));
      reg8 <= wire1[(2'h3):(2'h3)];
      reg9 <= (wire0 ?
          (wire5 ?
              reg8 : (+(wire0[(1'h0):(1'h0)] >> (reg6 ?
                  wire1 : wire0)))) : (wire0[(4'h8):(3'h5)] ?
              wire1 : ($unsigned($unsigned(wire0)) ?
                  $signed((reg8 ?
                      wire0 : wire0)) : $unsigned($unsigned(wire0)))));
      if ($signed(reg9))
        begin
          reg10 <= ((8'ha2) & reg8[(1'h0):(1'h0)]);
          if ({(((^~$signed(wire1)) ?
                  $unsigned($signed(wire0)) : ((reg6 ? wire4 : reg8) ?
                      (~^(8'ha7)) : (|(8'hb5)))) >>> {$unsigned((reg9 >> reg10)),
                  (&$unsigned(reg10))}),
              $unsigned(wire4)})
            begin
              reg11 <= $signed((wire4[(1'h0):(1'h0)] ?
                  (~^(~|(~reg8))) : reg10[(1'h1):(1'h0)]));
            end
          else
            begin
              reg11 <= reg6;
              reg12 <= reg8;
              reg13 <= ((^((+(8'hbc)) ?
                      (~|reg10[(2'h2):(1'h0)]) : {$unsigned(reg11),
                          $signed(wire5)})) ?
                  ((|$unsigned((reg6 == reg6))) ?
                      $unsigned(($unsigned(reg11) ?
                          (reg12 ?
                              wire2 : wire3) : (wire0 >>> reg12))) : {reg12[(4'h8):(3'h6)]}) : $signed(wire1[(3'h5):(2'h3)]));
              reg14 <= (~^reg6);
              reg15 <= reg12[(1'h0):(1'h0)];
            end
          if ((($signed(((reg9 ? wire3 : (8'hb6)) & (reg7 ? reg7 : reg11))) ?
              $unsigned(reg7) : $signed($unsigned((wire5 ?
                  wire0 : reg9)))) << (reg14 ? reg11[(2'h3):(1'h1)] : wire1)))
            begin
              reg16 <= reg10[(3'h6):(3'h6)];
            end
          else
            begin
              reg16 <= (wire1[(5'h11):(5'h11)] ?
                  (~|((~^(wire4 < reg12)) ?
                      (reg8 ?
                          $unsigned(wire5) : (reg16 + reg12)) : reg12[(3'h4):(1'h1)])) : ($signed((reg8[(2'h3):(1'h1)] ?
                          (-reg16) : (reg12 ? (8'hb2) : reg8))) ?
                      ($signed($signed(reg9)) ?
                          reg10 : ((reg13 ?
                              wire3 : reg12) != $unsigned(reg9))) : {$unsigned({reg16,
                              reg8})}));
              reg17 <= (wire4 ?
                  $signed(reg10[(1'h1):(1'h1)]) : (reg6 ?
                      $signed($unsigned((~wire3))) : (wire4[(2'h2):(1'h0)] & reg12[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg10 <= reg7[(2'h2):(1'h1)];
          reg11 <= wire2;
          if ({wire1[(4'hc):(4'ha)]})
            begin
              reg12 <= reg9;
              reg13 <= $unsigned(((((~wire4) ?
                      wire1 : (8'h9c)) - (^reg9[(2'h3):(2'h3)])) ?
                  $signed(((reg12 << (8'ha6)) ?
                      (7'h44) : reg12)) : reg6[(4'hb):(4'ha)]));
              reg14 <= wire2;
              reg15 <= $unsigned((~reg15));
              reg16 <= (($signed(($unsigned(wire4) != ((8'h9e) < reg8))) ?
                  (8'ha7) : wire1[(5'h10):(2'h2)]) * reg7[(4'hc):(2'h2)]);
            end
          else
            begin
              reg12 <= (~&reg8);
              reg13 <= (~|$signed($unsigned((reg17 + reg10[(3'h4):(1'h1)]))));
              reg14 <= (reg9[(2'h3):(1'h1)] | wire0[(4'h8):(2'h3)]);
            end
        end
    end
  assign wire18 = wire1;
  always
    @(posedge clk) begin
      reg19 <= {{(^$unsigned((~^reg6))), {$signed($unsigned(wire3))}}};
      reg20 <= $unsigned(wire1[(4'hb):(3'h4)]);
      reg21 <= $unsigned({$unsigned((-(reg16 ? wire3 : wire4))),
          {{$signed(reg7)}, reg16[(2'h3):(2'h3)]}});
      reg22 <= wire4[(2'h2):(2'h2)];
      reg23 <= $unsigned(wire0[(3'h7):(1'h0)]);
    end
  assign wire24 = wire18;
  module25 #() modinst81 (.wire27(reg20), .y(wire80), .wire29(reg13), .wire26(reg22), .wire28(reg16), .clk(clk));
  module82 #() modinst94 (.wire83(wire0), .wire87(wire3), .wire84(reg20), .wire85(reg9), .clk(clk), .wire86(reg6), .y(wire93));
  assign wire95 = reg9;
  always
    @(posedge clk) begin
      if ((($unsigned(($signed(reg16) << (reg16 | reg9))) ?
              $signed((~$unsigned(reg10))) : (-reg23)) ?
          (+{reg13}) : ($unsigned($signed((wire1 ? (8'hb0) : reg23))) ?
              reg15 : $signed(((^(8'haf)) * (reg14 ? reg20 : wire24))))))
        begin
          reg96 <= (wire95[(3'h5):(2'h2)] >>> (($signed((reg11 ?
                  wire80 : wire2)) ?
              reg9 : $signed(reg10[(3'h4):(1'h0)])) <<< (^(wire2 * (wire95 ?
              wire18 : wire80)))));
        end
      else
        begin
          if ((((($signed((8'hb7)) ? $unsigned(reg15) : reg14[(4'ha):(2'h2)]) ?
                      $unsigned($signed(wire4)) : $unsigned({wire4, reg8})) ?
                  ((wire5[(4'he):(3'h6)] ? $unsigned((8'ha8)) : (~|reg8)) ?
                      ((reg7 ? (8'hba) : reg21) ?
                          reg12[(3'h4):(1'h1)] : (reg23 ^~ reg8)) : (^~$signed(reg15))) : (((wire4 ?
                              reg8 : reg15) ?
                          (wire0 ? wire18 : reg21) : wire0) ?
                      ($unsigned(reg6) ?
                          $signed(reg6) : $unsigned(reg17)) : $unsigned(reg7[(4'h8):(4'h8)]))) ?
              $unsigned(reg23) : wire95))
            begin
              reg96 <= ((+({{reg19, reg22},
                  (reg10 + wire5)} != $unsigned($unsigned(reg14)))) ^~ (~|{(reg96[(3'h7):(2'h2)] ?
                      (reg19 >> reg22) : reg22[(5'h12):(4'hb)]),
                  (&{wire0})}));
              reg97 <= $unsigned(wire80[(5'h10):(1'h0)]);
            end
          else
            begin
              reg96 <= reg22[(4'hc):(4'h8)];
              reg97 <= $unsigned($signed(wire24[(2'h3):(1'h1)]));
              reg98 <= reg21[(4'hb):(1'h0)];
              reg99 <= (^(reg16 == (reg10[(1'h0):(1'h0)] ?
                  $signed(((8'ha3) ? reg15 : reg17)) : $signed({reg11}))));
            end
          reg100 <= $signed(reg19);
          reg101 <= {wire95[(1'h0):(1'h0)]};
          reg102 <= (($unsigned(wire0[(4'ha):(1'h1)]) ?
              $signed(($unsigned(reg101) >>> $unsigned(wire95))) : ((reg96[(5'h11):(5'h11)] ?
                  wire18 : ((8'hb4) ~^ wire0)) && wire2[(3'h4):(1'h1)])) * (-$unsigned(wire24[(2'h3):(1'h0)])));
        end
    end
  assign wire103 = ($unsigned((8'hb1)) | $unsigned(wire2));
endmodule

module module82
#(parameter param92 = (8'h9e))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h21):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire87;
  input wire signed [(4'ha):(1'h0)] wire86;
  input wire [(4'he):(1'h0)] wire85;
  input wire [(3'h7):(1'h0)] wire84;
  input wire [(2'h3):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  assign y = {wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = wire86[(4'ha):(3'h5)];
  assign wire89 = wire85[(3'h6):(1'h1)];
  assign wire90 = wire86[(3'h4):(2'h3)];
  assign wire91 = (-(wire87[(4'ha):(4'ha)] ?
                      wire90 : (~&($signed((8'ha1)) ?
                          {wire89, wire88} : $signed(wire88)))));
endmodule

module module25
#(parameter param79 = (^((({(8'haf), (8'hac)} * (^(8'hb3))) ? {{(8'ha5), (8'hbf)}} : (8'ha0)) ? ((&{(8'hb6), (8'ha4)}) ? (|(^(8'h9f))) : {((8'haa) ? (8'hb0) : (8'hbd)), ((7'h43) ^~ (8'hb4))}) : (~(((8'h9c) < (8'hbb)) - ((7'h44) ? (8'hae) : (8'had)))))))
(y, clk, wire26, wire27, wire28, wire29);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire27;
  input wire [(5'h11):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire65;
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire65,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg67,
                 (1'h0)};
  assign wire30 = (~&(wire28 <= ((+(wire28 ? (8'hbe) : wire28)) ^ wire29)));
  assign wire31 = (wire30 != {wire27});
  assign wire32 = {($unsigned(wire30) ?
                          wire26[(2'h2):(2'h2)] : $signed(wire27))};
  assign wire33 = (wire28 >= (wire27 ?
                      ($signed({wire32,
                          wire31}) << ((wire32 + wire28) < (^wire32))) : wire26[(1'h1):(1'h1)]));
  assign wire34 = wire32[(3'h5):(2'h2)];
  assign wire35 = $unsigned({(wire31[(1'h1):(1'h0)] ?
                          (8'hb5) : $signed((~^wire34)))});
  assign wire36 = {$unsigned($unsigned($signed($unsigned(wire29))))};
  module37 #() modinst66 (wire65, clk, wire30, wire34, wire36, wire28, wire31);
  always
    @(posedge clk) begin
      reg67 <= {wire28[(5'h11):(4'he)]};
    end
  assign wire68 = $signed(wire36);
  assign wire69 = (~$unsigned(wire34[(3'h5):(1'h1)]));
  assign wire70 = $unsigned((wire29[(1'h0):(1'h0)] <<< $unsigned({{wire34,
                          wire69}})));
  assign wire71 = $signed(($signed({$unsigned(wire26)}) ?
                      $signed(wire33[(2'h3):(1'h0)]) : ((-(wire68 && wire68)) ?
                          {(wire28 >> wire35)} : wire30[(4'hf):(4'h8)])));
  always
    @(posedge clk) begin
      reg72 <= $unsigned({$unsigned($signed({wire34, wire65})),
          $unsigned(wire68[(4'hd):(2'h3)])});
      reg73 <= (+$unsigned($unsigned(reg72[(5'h13):(4'hf)])));
      reg74 <= (^~(^~$signed(wire68[(1'h1):(1'h0)])));
      reg75 <= $unsigned((^~(wire32 ?
          {(!wire27), (wire71 <<< wire33)} : $signed($signed(wire28)))));
      reg76 <= wire31;
    end
  assign wire77 = $unsigned((+$unsigned((-wire70))));
  assign wire78 = reg76[(4'h8):(3'h4)];
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire41;
  input wire [(5'h12):(1'h0)] wire40;
  input wire signed [(5'h11):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire43;
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
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
                 reg44,
                 (1'h0)};
  assign wire43 = ($unsigned(wire38) ? wire39[(4'hb):(3'h5)] : wire38);
  always
    @(posedge clk) begin
      reg44 <= wire38;
    end
  assign wire45 = (^$unsigned(((+$signed(wire39)) ?
                      $unsigned(wire41[(2'h2):(2'h2)]) : {(wire40 ?
                              wire42 : wire42),
                          (wire42 ? wire39 : wire41)})));
  assign wire46 = (^~$signed(wire42[(1'h1):(1'h0)]));
  assign wire47 = ($unsigned($signed($signed((wire43 ? (8'hbc) : wire46)))) ?
                      (wire45 ? wire45[(1'h1):(1'h0)] : wire41) : wire42);
  assign wire48 = {reg44[(2'h2):(2'h2)],
                      ($signed((-(reg44 ?
                          (8'hbf) : wire47))) != $signed($unsigned((wire43 < wire46))))};
  assign wire49 = ({wire48, wire41[(4'hc):(3'h6)]} ?
                      wire38 : {$unsigned(wire45),
                          {wire40[(3'h5):(2'h3)],
                              $signed(wire41[(4'hc):(1'h1)])}});
  always
    @(posedge clk) begin
      reg50 <= (wire42 ? $unsigned(wire43[(2'h3):(1'h0)]) : wire41);
      if (reg50)
        begin
          reg51 <= (~^(|$signed({(^wire48), (wire43 ? (7'h42) : (8'hbd))})));
          reg52 <= {($unsigned(($signed(wire47) ? reg50 : (|wire38))) ?
                  ({$unsigned(reg51)} ?
                      ($signed(wire46) >>> (wire39 ~^ wire38)) : $signed((wire47 ^~ wire46))) : ((~&$signed(wire39)) ?
                      $signed(((8'hbb) ? wire38 : wire48)) : {(wire42 ?
                              wire39 : wire48)})),
              wire40[(4'h9):(4'h9)]};
          reg53 <= ((7'h43) ?
              ((wire48[(3'h7):(3'h4)] <= reg50) || wire48) : wire42);
          reg54 <= $signed(reg44);
        end
      else
        begin
          reg51 <= ((wire41 + $unsigned((^~$unsigned(reg51)))) * $unsigned((8'hac)));
          if (wire47[(1'h1):(1'h1)])
            begin
              reg52 <= $unsigned({(~|$signed((reg51 | reg53)))});
              reg53 <= ({($unsigned({wire39,
                      wire42}) < $signed($unsigned(wire46))),
                  reg51[(2'h3):(2'h2)]} + $unsigned(((wire49 ?
                      $signed(wire46) : {wire39, wire46}) ?
                  $unsigned($signed(wire46)) : (wire49 & wire46))));
              reg54 <= (wire38[(2'h2):(2'h2)] ?
                  ($unsigned($signed((wire39 ? wire47 : wire39))) ?
                      (7'h41) : (!wire45)) : (wire39[(3'h7):(3'h5)] ?
                      $unsigned(wire46[(1'h1):(1'h1)]) : $signed((~^wire42))));
              reg55 <= $signed(reg52[(4'hd):(1'h0)]);
            end
          else
            begin
              reg52 <= ((wire41 > $signed($signed((8'hbd)))) ?
                  $signed($signed(((+(8'hbe)) * $signed(reg52)))) : $unsigned($unsigned(($signed(wire41) ~^ reg44[(3'h4):(2'h2)]))));
            end
          reg56 <= wire39[(4'hc):(2'h3)];
        end
    end
  always
    @(posedge clk) begin
      reg57 <= wire43[(2'h3):(1'h1)];
      reg58 <= ((((&wire48[(3'h5):(3'h5)]) & (wire46[(1'h0):(1'h0)] != wire45)) ?
              (({reg57, wire49} & (wire39 >= (8'hbe))) ?
                  reg56 : (|$signed(reg51))) : ($signed($signed(reg53)) ?
                  {(~(8'hbe)),
                      (wire40 ?
                          (8'ha4) : wire49)} : ($unsigned(reg50) > ((8'hb0) ?
                      (8'hb8) : wire46)))) ?
          $unsigned((wire46 && reg55[(5'h10):(4'hb)])) : (~&((^~reg56) ~^ $signed({(8'ha6),
              reg44}))));
      reg59 <= (reg52[(4'hf):(2'h2)] + ($signed((8'hb4)) ?
          {reg54[(4'h9):(3'h7)]} : $unsigned(({reg53} ?
              {wire48, (8'hae)} : $signed(reg53)))));
      reg60 <= (!($unsigned($signed(reg52)) ?
          (~($signed(reg54) ? wire39 : wire38)) : (&{((8'hae) ?
                  (8'h9f) : wire49),
              (|wire42)})));
    end
  assign wire61 = ({(^wire45[(1'h0):(1'h0)])} * $signed(({wire42[(1'h0):(1'h0)]} < (((8'h9f) == wire38) << wire39[(2'h2):(1'h0)]))));
  assign wire62 = $unsigned(({wire39, (^~{reg55, (8'hae)})} > reg44));
  assign wire63 = ($unsigned(reg51) ? wire39[(4'he):(3'h7)] : $signed(wire61));
  assign wire64 = $signed(reg59[(4'h8):(3'h7)]);
endmodule
