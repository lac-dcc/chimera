module top
#(parameter param228 = ((+(~^(((8'hbf) * (8'hb2)) ~^ {(8'hb4), (8'hbc)}))) ? (~^(-({(8'ha2), (8'ha6)} >> ((8'ha9) ? (8'hae) : (8'ha9))))) : (^{((~(8'hbe)) ? ((8'hb9) - (8'hab)) : (7'h43)), (~^(8'hbc))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire227;
  wire [(4'h8):(1'h0)] wire226;
  wire signed [(3'h7):(1'h0)] wire225;
  wire [(3'h7):(1'h0)] wire224;
  wire [(2'h2):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire222;
  wire signed [(4'hf):(1'h0)] wire221;
  wire [(5'h11):(1'h0)] wire220;
  wire signed [(5'h14):(1'h0)] wire219;
  wire [(4'ha):(1'h0)] wire218;
  wire signed [(2'h2):(1'h0)] wire217;
  wire [(4'h9):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire214;
  wire [(4'hc):(1'h0)] wire213;
  wire [(4'hd):(1'h0)] wire104;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire211;
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire215,
                 wire214,
                 wire213,
                 wire104,
                 wire5,
                 wire4,
                 wire211,
                 (1'h0)};
  assign wire4 = $unsigned((~|$signed(wire1)));
  assign wire5 = $unsigned((~&wire2));
  module6 #() modinst105 (wire104, clk, wire0, wire3, wire2, wire1, wire4);
  module106 #() modinst212 (.wire109(wire3), .y(wire211), .wire111(wire0), .wire107(wire104), .wire110(wire2), .wire108(wire4), .clk(clk));
  assign wire213 = $unsigned(wire0);
  assign wire214 = (!wire211);
  module24 #() modinst216 (.wire27(wire213), .wire25(wire1), .y(wire215), .clk(clk), .wire28(wire5), .wire26(wire2));
  assign wire217 = (((&{$signed((8'hb3))}) - wire104[(3'h5):(2'h3)]) >> wire1);
  assign wire218 = (($unsigned(wire1[(5'h10):(4'he)]) ?
                       wire217[(2'h2):(2'h2)] : wire0[(3'h4):(3'h4)]) & (wire217 <<< $unsigned((~|wire2))));
  assign wire219 = (wire218[(1'h0):(1'h0)] ?
                       {wire2[(4'hb):(4'hb)],
                           ((8'hbf) ?
                               $signed(wire211[(5'h12):(3'h7)]) : (wire104 | wire211))} : ((((wire218 && wire1) ?
                           (8'hba) : $signed(wire213)) + $signed($unsigned((8'hbc)))) << {(&(~(8'hbc))),
                           $unsigned(wire213[(4'hc):(2'h2)])}));
  assign wire220 = (~|($unsigned($unsigned((~&wire219))) ?
                       (wire214[(2'h2):(1'h1)] ^ $signed(wire4)) : $signed(({wire1,
                               wire215} ?
                           wire215[(1'h0):(1'h0)] : (wire215 << wire104)))));
  assign wire221 = wire215[(2'h2):(2'h2)];
  assign wire222 = wire221;
  assign wire223 = (wire211 != ((8'h9d) + wire221));
  assign wire224 = {(~&$unsigned($unsigned((|(8'ha2))))),
                       ($signed(wire219) ~^ ((^(&wire218)) | $unsigned(wire221)))};
  assign wire225 = wire4;
  assign wire226 = $unsigned((+({(wire211 ?
                           wire218 : wire218)} * $signed($signed(wire213)))));
  assign wire227 = {wire215};
endmodule

module module106
#(parameter param210 = (((((!(8'h9f)) ? ((8'h9d) ^~ (8'haf)) : ((8'haf) << (8'ha7))) ^~ (((8'ha9) && (8'hb8)) ? (^~(8'ha1)) : ((8'ha1) ? (8'hbd) : (8'haf)))) ? ((~^((8'h9c) ? (7'h44) : (8'ha5))) ? (~|(-(8'h9c))) : (((8'hb0) || (7'h44)) << ((7'h44) ? (8'ha0) : (8'hbc)))) : (+{(^(8'hb1)), ((8'haf) < (8'hb4))})) ? (({((8'hb6) && (8'ha7))} * ((-(8'h9f)) == ((8'hb6) & (8'hb7)))) ? (((^(8'haf)) ? ((8'hb8) ? (8'ha7) : (8'ha0)) : (8'hba)) < (+(8'hb3))) : (^~(~((8'hb5) << (7'h44))))) : (8'h9d)))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(3'h4):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire108;
  input wire signed [(4'ha):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(4'hb):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(3'h5):(1'h0)] wire208;
  reg signed [(4'h9):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  assign y = {wire144,
                 wire154,
                 wire155,
                 wire156,
                 wire208,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  module112 #() modinst145 (.wire113(wire108), .wire117(wire110), .clk(clk), .wire116(wire111), .wire114(wire109), .y(wire144), .wire115(wire107));
  always
    @(posedge clk) begin
      reg146 <= $unsigned($signed(wire108[(2'h2):(2'h2)]));
      reg147 <= ((-(($unsigned((8'ha8)) ? wire109 : $signed((7'h43))) ?
              ($unsigned(wire111) ^ (wire107 + wire109)) : $unsigned((wire109 ?
                  wire108 : wire111)))) ?
          {reg146[(4'hb):(3'h4)]} : ($signed($unsigned($unsigned(wire111))) ?
              (+(&$signed(wire108))) : wire110));
      reg148 <= (-(&$unsigned((wire144[(4'h8):(4'h8)] ?
          ((8'ha8) ? wire109 : reg147) : ((8'hbc) >= reg146)))));
      if ((-$signed((wire144 != ($unsigned(reg146) < reg148[(3'h4):(3'h4)])))))
        begin
          reg149 <= {$unsigned($signed((8'hbe)))};
          reg150 <= (8'hba);
          reg151 <= (reg146[(3'h6):(3'h5)] ?
              $signed((!(8'hb9))) : {($signed((wire110 ? wire111 : wire144)) ?
                      wire109 : reg146[(4'h8):(1'h0)]),
                  $unsigned((|wire144[(3'h6):(3'h6)]))});
          reg152 <= (+reg149);
        end
      else
        begin
          if (((($unsigned({wire109, reg147}) ~^ (wire144 ?
                  $signed(reg146) : (8'haa))) ?
              {$unsigned(reg147),
                  wire110} : reg152) <<< $signed($unsigned((reg149[(4'he):(3'h5)] ?
              (~&(8'h9c)) : (~&reg152))))))
            begin
              reg149 <= (~^(((reg147[(3'h4):(1'h0)] ?
                  wire107 : $unsigned(reg147)) <= ({wire110, reg146} ?
                  wire108 : (wire109 && reg152))) <<< (reg150[(4'hd):(3'h7)] >> (reg150 ?
                  {reg149} : (~wire109)))));
            end
          else
            begin
              reg149 <= $signed(wire107[(2'h2):(1'h0)]);
              reg150 <= $signed($unsigned($signed(reg152)));
            end
          reg151 <= wire144[(3'h4):(3'h4)];
          if ($signed($signed((~&(8'h9e)))))
            begin
              reg152 <= ((wire110[(5'h12):(4'hd)] ?
                  (~{wire144[(2'h2):(1'h1)],
                      reg148}) : reg150) >= {$signed((~(reg149 ?
                      reg147 : wire111))),
                  $signed(reg147[(3'h4):(2'h2)])});
            end
          else
            begin
              reg152 <= $signed(((8'h9f) ?
                  $signed(wire109) : {reg150[(1'h1):(1'h0)],
                      $signed((reg150 ? reg150 : wire144))}));
            end
        end
      reg153 <= ($unsigned($unsigned(reg148)) ?
          (|reg151[(4'h8):(3'h4)]) : $signed(reg147));
    end
  assign wire154 = wire111;
  assign wire155 = (~wire107[(3'h7):(2'h2)]);
  assign wire156 = (wire111[(4'h8):(3'h6)] & $signed(($unsigned($signed(reg151)) < reg149[(4'h8):(4'h8)])));
  module157 #() modinst209 (wire208, clk, reg149, reg148, reg152, reg147, wire144);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire62;
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire12,
                 wire22,
                 wire23,
                 wire62,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 reg75,
                 reg74,
                 reg73,
                 reg67,
                 reg66,
                 reg65,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire12 = (($signed(wire8) < ($signed($signed((8'ha5))) ?
                          $signed((-wire11)) : ((wire11 * wire9) >= (wire8 & wire11)))) ?
                      (+(~wire8)) : (wire7[(1'h1):(1'h1)] > (^~(^~wire9))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire7[(3'h4):(2'h3)])))
        begin
          reg13 <= ($signed($signed(($unsigned(wire11) ?
                  (wire9 < wire12) : (wire8 ? wire11 : (8'hae))))) ?
              ((wire9[(2'h2):(1'h0)] || $signed($signed(wire12))) ?
                  ((-{wire11}) * wire7[(4'hf):(4'hb)]) : ({(~|wire10),
                      wire11[(3'h7):(1'h1)]} * wire7)) : (((wire12 && ((8'had) >>> wire9)) ?
                  $unsigned($unsigned(wire10)) : $signed((&wire11))) ^~ wire9[(1'h1):(1'h0)]));
          reg14 <= reg13;
        end
      else
        begin
          reg13 <= $signed($signed($unsigned($signed((wire12 ?
              wire11 : (8'h9f))))));
        end
      reg15 <= $signed((wire7 <<< $signed($unsigned({reg14, wire11}))));
      reg16 <= wire12;
      if ($signed({$signed((~&(reg13 ? wire12 : wire8)))}))
        begin
          reg17 <= (reg13[(1'h0):(1'h0)] == reg14);
          reg18 <= ((!(reg16 ^~ $unsigned(wire9[(2'h2):(2'h2)]))) < ($unsigned(reg14[(3'h4):(1'h1)]) ~^ (^{((8'hae) >>> reg16),
              (reg16 ? reg17 : (8'ha9))})));
          reg19 <= {{wire11}};
          reg20 <= ($signed(($unsigned((wire10 ?
              wire10 : reg13)) >> reg16)) > (wire10[(3'h6):(1'h1)] >= reg18[(3'h6):(1'h0)]));
          reg21 <= $signed(($unsigned(($signed(wire10) * (reg13 ?
                  wire9 : wire12))) ?
              $unsigned(wire8) : {$signed(wire8[(4'h8):(2'h2)]),
                  ($unsigned(reg20) ?
                      (reg17 ? reg15 : wire12) : ((8'hb1) ? wire7 : reg15))}));
        end
      else
        begin
          reg17 <= $unsigned($signed(reg16[(3'h5):(2'h3)]));
        end
    end
  assign wire22 = reg17[(1'h1):(1'h0)];
  assign wire23 = ($unsigned($unsigned(reg17[(2'h2):(2'h2)])) ?
                      ((({reg16} <= $unsigned(reg16)) ?
                              $unsigned({reg15}) : {reg14}) ?
                          (((wire9 ? wire11 : (8'h9d)) - $signed(reg19)) ?
                              (&(~|reg15)) : ((~(8'hb1)) ?
                                  (-reg17) : (~reg19))) : $signed(((reg17 | reg17) ?
                              (wire22 <= reg14) : (wire7 >> reg18)))) : (8'hbf));
  module24 #() modinst63 (.wire25(wire23), .clk(clk), .wire28(wire12), .wire27(wire9), .y(wire62), .wire26(reg17));
  assign wire64 = reg19[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg65 <= $signed((((reg17 ? ((8'hba) >>> wire12) : (reg16 ^~ (8'ha5))) ?
              $unsigned((reg20 >= reg16)) : {(&reg21), (reg20 < reg15)}) ?
          (|reg16[(3'h5):(3'h4)]) : $unsigned({$unsigned(wire12), reg21})));
      reg66 <= ((|(wire64[(4'he):(3'h5)] == (reg15 & reg13[(3'h7):(3'h5)]))) ?
          ($signed((+reg20[(3'h4):(2'h2)])) * ((~^(reg18 ? wire64 : wire11)) ?
              ($unsigned(wire8) <= {wire64,
                  wire8}) : reg21)) : $signed((&wire64[(4'ha):(3'h7)])));
      reg67 <= (7'h40);
    end
  assign wire68 = (|$signed((wire23[(4'hc):(4'h9)] >> wire64)));
  assign wire69 = ($signed((({reg15} << $signed((8'ha2))) ?
                      {reg19} : (~&wire68[(5'h10):(2'h3)]))) > wire12);
  assign wire70 = ((wire10 << (8'ha6)) << $unsigned((~^(~^(wire68 ?
                      reg65 : wire9)))));
  assign wire71 = $unsigned(((7'h44) ?
                      ((^(-reg15)) * $unsigned($signed(wire22))) : $unsigned(((~|reg66) ~^ $unsigned(wire11)))));
  assign wire72 = ((wire9 - reg18) ? (&reg19) : (~^reg67));
  always
    @(posedge clk) begin
      reg73 <= reg18;
      if ($signed(reg14))
        begin
          reg74 <= {$unsigned((wire72[(4'he):(3'h5)] - $unsigned(wire62))),
              (reg20 ?
                  (((reg67 ? wire9 : reg20) ?
                          wire64 : (wire8 ? wire68 : (8'ha3))) ?
                      wire12[(3'h4):(1'h1)] : ($unsigned(wire70) ^~ $unsigned(reg20))) : reg19)};
          if ($unsigned(reg73))
            begin
              reg75 <= (~{$unsigned((reg15 || (~wire62)))});
              reg76 <= (reg17[(2'h3):(1'h1)] <<< ($signed(((~&(8'ha1)) < {reg67})) | {(((8'had) ?
                          wire10 : wire22) ?
                      {reg66} : (reg67 > wire72)),
                  ((reg14 ? (8'ha8) : (7'h41)) ?
                      $unsigned(wire23) : $unsigned(wire10))}));
            end
          else
            begin
              reg75 <= (^~(^(reg75[(2'h3):(1'h0)] ?
                  (wire64[(4'h9):(4'h9)] ^ wire9[(4'h8):(1'h0)]) : ((reg76 <<< reg15) - wire12))));
              reg76 <= (^~$unsigned(((reg16 > reg20) * (^~(wire68 ?
                  (7'h40) : reg75)))));
              reg77 <= $signed($signed(($unsigned((reg19 >> reg67)) ?
                  (+(wire22 * reg16)) : (reg74[(4'hd):(4'h8)] ^~ (|reg15)))));
              reg78 <= ((((~^((8'h9d) ? wire70 : (8'ha2))) >>> (reg13 ?
                  $signed(reg14) : wire69)) < $signed((wire23 ?
                  {wire69, wire62} : ((8'hb3) << reg74)))) ^~ (8'hac));
              reg79 <= (~^($signed(reg66[(4'h8):(3'h6)]) && reg16[(2'h2):(1'h0)]));
            end
          if ((&wire23[(4'h9):(3'h6)]))
            begin
              reg80 <= ((-wire9[(3'h5):(2'h2)]) ?
                  (8'hba) : (+$unsigned((^~reg74))));
            end
          else
            begin
              reg80 <= reg16[(1'h0):(1'h0)];
            end
          reg81 <= ({(^~(-wire23))} ?
              (|reg74[(3'h6):(1'h1)]) : $unsigned(reg15));
          reg82 <= reg20[(2'h3):(1'h0)];
        end
      else
        begin
          reg74 <= wire69[(1'h0):(1'h0)];
          if (reg76)
            begin
              reg75 <= $signed((+$signed((|(wire22 ? wire9 : (8'hb4))))));
              reg76 <= (8'hb5);
            end
          else
            begin
              reg75 <= reg78;
              reg76 <= $unsigned({wire68[(1'h1):(1'h0)], reg76[(4'h9):(4'h8)]});
              reg77 <= $signed((~|{((8'hbd) | (&wire12)),
                  $signed((reg76 ~^ reg19))}));
              reg78 <= reg66;
            end
        end
      if ($signed(($unsigned(reg76) ?
          ((wire64 ? (reg66 ? reg67 : wire64) : $unsigned(reg15)) ?
              reg17[(1'h0):(1'h0)] : (8'hb5)) : (|{(+reg76),
              reg20[(3'h4):(2'h3)]}))))
        begin
          if (wire64[(2'h3):(2'h3)])
            begin
              reg83 <= reg21;
              reg84 <= $unsigned({reg13[(3'h6):(3'h5)]});
              reg85 <= (^reg73[(2'h3):(1'h1)]);
              reg86 <= reg17;
              reg87 <= {$unsigned((($signed(reg82) ?
                          $unsigned(reg74) : (wire62 ~^ wire72)) ?
                      $unsigned({reg80}) : (-{(8'ha6)})))};
            end
          else
            begin
              reg83 <= {((wire23 == ((!(8'ha7)) <<< $unsigned(reg66))) ?
                      (8'hae) : {$signed((reg84 ^ (8'ha6))),
                          $unsigned((reg84 ? reg15 : (8'hac)))}),
                  reg79};
              reg84 <= reg82[(2'h2):(1'h1)];
              reg85 <= ((reg20 <<< (((wire12 ? wire70 : wire68) ?
                  (!(8'hb5)) : $signed(wire68)) <<< {(reg79 ~^ wire11),
                  (reg83 + wire7)})) & reg86);
              reg86 <= $signed({$signed($unsigned(reg15[(3'h4):(2'h3)]))});
            end
          if (reg73)
            begin
              reg88 <= $unsigned(reg78[(2'h3):(1'h0)]);
            end
          else
            begin
              reg88 <= (-{((~^wire7) ?
                      reg78[(3'h7):(2'h3)] : $unsigned((8'hb4))),
                  $unsigned($signed({wire22, wire64}))});
            end
          reg89 <= {((reg74 || $unsigned($signed(wire71))) ?
                  (({reg77, (8'h9d)} ? reg73 : $signed((8'ha9))) > ((wire70 ?
                      wire22 : (8'hb7)) & {reg75,
                      wire23})) : $signed($unsigned($signed(reg85))))};
        end
      else
        begin
          reg83 <= (8'ha4);
          reg84 <= reg79;
          reg85 <= (~^$signed((~$unsigned($unsigned(reg79)))));
          reg86 <= (^~($signed(reg21[(1'h0):(1'h0)]) > $signed({(reg65 * wire8),
              (reg86 && reg78)})));
          reg87 <= reg86;
        end
      reg90 <= ($signed(wire70) ?
          $unsigned(($signed($unsigned(reg80)) < (+(reg75 ?
              reg66 : wire7)))) : (reg87 ?
              (((8'h9c) ? ((8'hbb) ? reg13 : reg79) : reg86) ?
                  $unsigned(wire23[(4'hc):(2'h3)]) : $signed(reg66[(4'h9):(3'h4)])) : wire69));
      reg91 <= reg14;
    end
  assign wire92 = (reg16[(3'h5):(2'h3)] ?
                      reg17[(1'h1):(1'h1)] : ((8'hbf) ?
                          reg91 : (-(^$unsigned(reg14)))));
  assign wire93 = reg65;
  assign wire94 = (wire72[(5'h11):(5'h11)] << (&(~&reg80[(4'ha):(3'h5)])));
  always
    @(posedge clk) begin
      if (reg87)
        begin
          reg95 <= $signed(reg79);
          reg96 <= wire7;
          reg97 <= reg81[(5'h10):(3'h7)];
          reg98 <= reg19[(1'h0):(1'h0)];
        end
      else
        begin
          reg95 <= (~(reg85[(1'h0):(1'h0)] | reg86));
        end
      reg99 <= $signed({(8'hac)});
      reg100 <= reg85;
    end
  always
    @(posedge clk) begin
      reg101 <= (~|{wire9[(1'h1):(1'h1)]});
      reg102 <= $signed(wire23);
      reg103 <= reg75;
    end
endmodule

module module24
#(parameter param60 = (+(~^{(~^((8'hb4) >>> (8'hb1)))})), 
parameter param61 = (~^param60))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg57,
                 reg56,
                 reg55,
                 reg48,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire29 = ($unsigned($unsigned((8'hbd))) ?
                      {$signed((^~$unsigned(wire28))),
                          wire25} : $signed((wire27[(3'h7):(3'h7)] ?
                          $signed(((8'ha8) > (8'h9d))) : ((wire25 ?
                              wire27 : wire28) && (-(8'ha1))))));
  assign wire30 = $unsigned({$unsigned($signed((-wire25)))});
  assign wire31 = wire27;
  assign wire32 = (~^(8'hae));
  assign wire33 = $signed($signed(((wire26[(1'h0):(1'h0)] ?
                      $unsigned(wire32) : (~|wire30)) == $signed($signed(wire29)))));
  always
    @(posedge clk) begin
      reg34 <= (~&(+$signed((wire25 ? {wire27} : (~wire32)))));
      reg35 <= wire26;
    end
  assign wire36 = (~|wire33);
  assign wire37 = (wire31[(3'h4):(1'h1)] ?
                      ((((wire30 & reg35) ? {reg34, wire36} : $signed(wire30)) ?
                              {(reg34 + wire27),
                                  reg34[(2'h3):(2'h3)]} : wire25) ?
                          wire29 : wire30[(2'h3):(1'h0)]) : (~wire32));
  assign wire38 = wire30;
  assign wire39 = $signed(reg34[(1'h1):(1'h0)]);
  assign wire40 = $unsigned(wire39);
  always
    @(posedge clk) begin
      if ((~^$signed({$unsigned((wire27 ? (8'hbc) : (8'ha4))),
          wire39[(2'h3):(1'h1)]})))
        begin
          reg41 <= (((({wire36, wire28} ? (~wire39) : (!wire32)) ?
                  {(wire26 ? wire32 : wire37)} : (&wire36)) - wire26) ?
              $unsigned({$unsigned((wire25 ? wire36 : wire29))}) : wire30);
          if ((8'hb2))
            begin
              reg42 <= $unsigned(({(^(wire33 << reg35)), wire37} ?
                  {((-reg35) ^ (!(8'hb2)))} : (~$unsigned((~wire29)))));
              reg43 <= wire39;
              reg44 <= $signed(reg41[(1'h1):(1'h0)]);
            end
          else
            begin
              reg42 <= (+(-$unsigned(($signed(wire39) ?
                  {wire25, (8'hba)} : {reg42, wire36}))));
              reg43 <= $signed(reg41);
              reg44 <= (((reg34 ?
                          ($unsigned((8'hb3)) | ((8'ha0) || wire27)) : $unsigned((wire37 & wire30))) ?
                      {($unsigned(reg44) ? (|reg34) : (wire29 >>> reg34)),
                          wire33} : (+(~&$unsigned(reg44)))) ?
                  $signed((wire31[(2'h3):(2'h3)] < ((wire38 ? wire40 : wire31) ?
                      {(8'hab)} : (wire31 ? wire30 : reg41)))) : (|(((|wire27) ?
                          reg41 : (reg35 ? reg43 : wire37)) ?
                      reg34[(2'h2):(1'h1)] : wire39)));
              reg45 <= reg34;
              reg46 <= (wire33[(1'h1):(1'h0)] ?
                  (wire38 ?
                      $unsigned(wire38[(1'h1):(1'h1)]) : wire36[(1'h0):(1'h0)]) : wire31[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg41 <= wire33[(1'h1):(1'h0)];
        end
    end
  assign wire47 = (((wire39 << (wire31 ?
                      ((8'ha5) != wire38) : (~&(8'ha7)))) >> (^$unsigned($signed(wire29)))) ^ $unsigned($signed(((reg46 << reg45) ?
                      ((7'h44) + wire31) : {(8'ha1), wire40}))));
  always
    @(posedge clk) begin
      reg48 <= (((^~reg34) * wire31) != ($signed((~&wire38[(3'h5):(2'h2)])) ~^ $unsigned($signed(wire27[(4'h8):(1'h0)]))));
    end
  assign wire49 = ($signed($signed($signed($unsigned(reg46)))) ?
                      reg41[(4'ha):(4'h8)] : {(-({wire36, (8'haa)} ?
                              wire31 : (~reg46))),
                          wire39[(5'h12):(5'h10)]});
  assign wire50 = reg44[(4'hf):(3'h5)];
  assign wire51 = $signed(reg43);
  assign wire52 = ({((~$signed((8'hae))) != reg42[(2'h2):(2'h2)])} + reg34);
  assign wire53 = (|(($signed((reg44 ?
                          wire28 : wire52)) << wire32[(4'ha):(2'h3)]) ?
                      wire29[(4'h8):(4'h8)] : wire31));
  assign wire54 = $signed($unsigned($unsigned(((reg34 ? (8'ha8) : wire28) ?
                      (wire30 ~^ reg41) : (reg35 >>> wire40)))));
  always
    @(posedge clk) begin
      reg55 <= reg41;
      reg56 <= (+($signed($unsigned((wire31 << wire49))) < reg41));
      reg57 <= (wire53[(3'h4):(1'h1)] ?
          wire31 : $unsigned($signed(($signed(reg45) != $unsigned(reg46)))));
    end
  assign wire58 = $unsigned($signed({($unsigned(wire39) >> reg44[(4'h9):(1'h1)]),
                      (8'ha7)}));
  assign wire59 = wire32[(3'h6):(3'h4)];
endmodule

module module157
#(parameter param206 = (((|{((7'h40) >>> (8'haf))}) ? {(8'ha4)} : ((((8'hb9) ? (7'h41) : (8'hac)) * {(8'hab)}) ? (^~((8'hb3) >= (8'h9e))) : ((^(8'hba)) ? ((8'ha6) - (8'ha5)) : (!(8'ha3))))) + (~^(({(8'haa)} <= (+(8'hb7))) ? (((8'hbe) ? (8'hab) : (8'hb7)) ? (8'hbc) : ((8'hb8) ? (8'had) : (8'hab))) : (|(^~(8'h9f)))))), 
parameter param207 = ({((!{param206, param206}) ? ({param206} ? (~param206) : (param206 ? param206 : param206)) : ((&param206) && (param206 ? (8'h9d) : param206)))} ? {param206, param206} : param206))
(y, clk, wire162, wire161, wire160, wire159, wire158);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire162;
  input wire [(4'hd):(1'h0)] wire161;
  input wire [(5'h11):(1'h0)] wire160;
  input wire [(4'hd):(1'h0)] wire159;
  input wire [(5'h14):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire205;
  wire [(5'h11):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire203;
  wire [(4'hf):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire201;
  wire [(5'h10):(1'h0)] wire200;
  wire signed [(5'h10):(1'h0)] wire199;
  wire [(2'h2):(1'h0)] wire198;
  wire [(4'he):(1'h0)] wire195;
  wire [(3'h5):(1'h0)] wire194;
  wire signed [(5'h10):(1'h0)] wire193;
  wire [(5'h13):(1'h0)] wire169;
  wire signed [(5'h13):(1'h0)] wire168;
  wire [(5'h15):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire signed [(5'h10):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire signed [(4'hf):(1'h0)] wire163;
  reg [(5'h14):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg [(5'h11):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(4'hb):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg178 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg177 = (1'h0);
  reg [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg174 = (1'h0);
  reg [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg170 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire195,
                 wire194,
                 wire193,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 reg197,
                 reg196,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  assign wire163 = wire160[(4'h8):(3'h7)];
  assign wire164 = $signed($unsigned(wire161));
  assign wire165 = {(wire160[(2'h2):(1'h1)] > wire162),
                       $unsigned((wire158[(2'h3):(2'h3)] ?
                           {((7'h41) << wire160)} : $signed($unsigned(wire164))))};
  assign wire166 = $signed(wire164);
  assign wire167 = $unsigned((wire159 | wire161));
  assign wire168 = wire159;
  assign wire169 = (8'hae);
  always
    @(posedge clk) begin
      reg170 <= $signed(($signed(wire165) ?
          ((-(!(8'h9f))) || ((wire169 ?
              wire166 : wire169) ^ wire163[(4'h9):(2'h3)])) : {$unsigned((wire169 ?
                  wire163 : wire160))}));
      reg171 <= reg170;
    end
  always
    @(posedge clk) begin
      reg172 <= {{wire168[(3'h7):(2'h2)],
              (reg170[(3'h7):(3'h5)] ?
                  ($signed(wire167) ?
                      {wire159,
                          reg171} : $signed(wire166)) : $unsigned($unsigned((8'h9c))))},
          $signed((8'h9f))};
      reg173 <= ((((((8'hbd) ? wire168 : wire158) > wire164[(3'h4):(2'h3)]) ?
              (~{(8'ha8), (8'hac)}) : ($signed(wire166) ?
                  (~^wire159) : wire162)) >= {wire166[(3'h7):(2'h2)]}) ?
          wire159 : wire161[(3'h6):(2'h2)]);
      reg174 <= $unsigned(reg170);
      if ((|(&(wire165[(4'hd):(4'h8)] ?
          (wire158[(4'h8):(4'h8)] && $unsigned(wire166)) : reg171[(2'h2):(1'h0)]))))
        begin
          if (wire167[(5'h13):(4'h8)])
            begin
              reg175 <= wire168;
              reg176 <= reg172[(4'h8):(4'h8)];
              reg177 <= ((-wire161) ?
                  (-{((wire161 ? wire164 : wire169) + (wire168 ?
                          wire169 : wire160)),
                      reg171[(1'h0):(1'h0)]}) : reg172);
            end
          else
            begin
              reg175 <= (^reg171);
              reg176 <= $signed($unsigned($signed((~|wire162[(3'h4):(1'h1)]))));
              reg177 <= $unsigned($signed(($unsigned($signed(wire167)) ?
                  $unsigned((wire168 ? wire162 : reg177)) : ((+wire166) ?
                      (wire163 ? (7'h41) : reg177) : $signed(reg177)))));
              reg178 <= wire168;
            end
          reg179 <= reg172;
          reg180 <= $signed((!$signed(((wire168 ? reg178 : reg175) ?
              (&reg176) : wire168))));
        end
      else
        begin
          if ($signed(wire158[(1'h1):(1'h1)]))
            begin
              reg175 <= {$unsigned($signed($unsigned((~&reg174))))};
              reg176 <= ($signed($signed(wire168[(4'h8):(3'h6)])) ?
                  reg170[(3'h5):(2'h2)] : wire158);
              reg177 <= {$unsigned($signed(($signed(wire168) != (wire158 ?
                      reg179 : wire162))))};
              reg178 <= ((-wire168) < ((~|reg177[(1'h1):(1'h0)]) + reg175));
            end
          else
            begin
              reg175 <= {reg178};
              reg176 <= (&$signed(wire159));
            end
        end
      if ((-($unsigned(reg171[(1'h0):(1'h0)]) <= $unsigned(($signed(reg174) ?
          $unsigned((8'hb9)) : {(8'hb1)})))))
        begin
          reg181 <= ($unsigned(wire158[(4'he):(3'h5)]) > ($signed($unsigned(reg178[(1'h1):(1'h0)])) ?
              $unsigned((8'ha6)) : (~&reg172)));
          if (reg170)
            begin
              reg182 <= reg170[(1'h0):(1'h0)];
              reg183 <= reg173;
              reg184 <= $signed((8'hac));
            end
          else
            begin
              reg182 <= ($signed($unsigned(wire163[(4'hb):(2'h3)])) ?
                  reg172 : $unsigned($signed($signed((reg179 ?
                      wire167 : reg173)))));
              reg183 <= reg181[(4'hb):(4'h9)];
              reg184 <= (&reg183);
              reg185 <= reg180;
              reg186 <= ((^(wire165 ? $signed(reg175) : (+(~|reg176)))) ?
                  (((wire163 ? {wire169, wire161} : $signed((8'ha1))) ?
                          (!(8'ha0)) : {(&reg177), (^~reg172)}) ?
                      ((!$signed(wire165)) ?
                          $unsigned($signed(reg183)) : ($signed(reg185) ?
                              (reg181 ?
                                  wire169 : wire158) : $unsigned(reg185))) : (reg175[(1'h0):(1'h0)] >>> $signed($unsigned(wire162)))) : $unsigned({$unsigned($unsigned(reg175))}));
            end
        end
      else
        begin
          if ({$unsigned((~{reg171, $unsigned(reg177)}))})
            begin
              reg181 <= wire163[(1'h0):(1'h0)];
              reg182 <= reg176;
              reg183 <= (~|reg184);
              reg184 <= (($unsigned(wire168[(4'h8):(4'h8)]) >= (wire165[(3'h4):(3'h4)] ?
                      $unsigned(reg183) : reg181[(2'h2):(1'h1)])) ?
                  reg174 : (~&(((8'hae) ?
                          ((7'h43) && reg179) : $unsigned(wire165)) ?
                      (~|(~^(7'h43))) : wire163)));
              reg185 <= {{(^$signed($unsigned(reg173)))},
                  reg182[(4'h8):(4'h8)]};
            end
          else
            begin
              reg181 <= {reg186[(4'hc):(4'hb)],
                  (((~reg182[(3'h4):(1'h1)]) ?
                          (reg172 || $signed(wire159)) : reg174[(3'h4):(2'h2)]) ?
                      ((-$unsigned((8'hbc))) ?
                          {reg170,
                              $unsigned(reg185)} : (-reg171)) : {(reg183[(3'h7):(1'h0)] != {reg181,
                              wire166})})};
            end
          reg186 <= $signed((~|$unsigned(($signed(wire167) < (reg171 & reg170)))));
          if (wire161[(4'ha):(1'h0)])
            begin
              reg187 <= wire163[(4'hb):(3'h5)];
            end
          else
            begin
              reg187 <= ((^~wire169[(4'h8):(1'h0)]) ?
                  wire166[(3'h6):(1'h1)] : wire165[(4'h8):(1'h1)]);
              reg188 <= (^~$signed($signed(reg184[(4'ha):(3'h5)])));
              reg189 <= ((^~wire162) ?
                  wire165[(4'hb):(2'h2)] : $unsigned((&$unsigned(((7'h41) | reg182)))));
              reg190 <= ($signed((8'ha8)) >>> $signed(wire164[(3'h4):(3'h4)]));
              reg191 <= ($unsigned($signed(wire163[(3'h5):(3'h4)])) ?
                  reg175 : ({wire168} ?
                      wire165[(3'h5):(1'h1)] : $signed(((reg170 < wire167) ?
                          reg172 : (&wire168)))));
            end
          reg192 <= $signed($unsigned($unsigned($unsigned(reg181))));
        end
    end
  assign wire193 = {$signed(wire165[(3'h4):(2'h2)]),
                       (-(~|(reg182 >> $signed(wire167))))};
  assign wire194 = $signed(($signed(wire166) ?
                       ($signed((-(8'h9f))) | ((|wire161) <<< $signed(reg187))) : reg172[(2'h3):(1'h1)]));
  assign wire195 = ((~&wire159[(3'h4):(2'h2)]) != $signed($unsigned((wire193 ?
                       (&wire162) : (reg189 <<< reg175)))));
  always
    @(posedge clk) begin
      reg196 <= $signed($signed(($signed({reg173}) ?
          ($signed(reg184) ?
              (wire163 - wire165) : (wire168 <= reg192)) : $unsigned((wire162 ?
              reg170 : reg184)))));
      reg197 <= $signed({$unsigned((^~$signed(wire162)))});
    end
  assign wire198 = (($signed($signed({reg182,
                       reg176})) && wire194) == $signed(reg189[(1'h1):(1'h1)]));
  assign wire199 = wire165;
  assign wire200 = $signed($unsigned(($unsigned(wire163) ?
                       (!(^~wire193)) : $unsigned((~^reg187)))));
  assign wire201 = ($signed((~|$unsigned((reg172 ? wire161 : reg174)))) ?
                       ({reg172} ?
                           ($unsigned((wire198 ?
                               reg180 : reg184)) >= $signed((reg170 ?
                               wire162 : reg184))) : ((~&(~|reg174)) ?
                               $signed($signed(wire193)) : ((reg175 ?
                                   reg184 : reg180) + reg197[(4'hb):(3'h5)]))) : reg179[(2'h2):(1'h0)]);
  assign wire202 = (+(({$unsigned(wire162), wire169} ?
                       wire161[(3'h7):(1'h1)] : $unsigned($signed(reg184))) >>> (-({wire162,
                           reg175} ?
                       $unsigned(reg170) : reg190[(1'h0):(1'h0)]))));
  assign wire203 = reg174[(3'h7):(3'h7)];
  assign wire204 = $signed((!$unsigned($signed(reg185))));
  assign wire205 = ($unsigned($signed(wire200[(3'h6):(1'h0)])) <= $signed(((reg170[(2'h2):(1'h0)] ?
                       $unsigned(reg184) : $signed(wire165)) >>> wire198)));
endmodule

module module112
#(parameter param143 = ((|(+(!((8'hab) ? (7'h43) : (8'ha1))))) >>> (((&(^~(8'hb9))) < (~|(~^(8'hb0)))) >= {(-(^(8'ha8))), ((^(8'hbd)) ? ((8'h9e) >> (8'ha9)) : ((7'h41) ? (7'h44) : (8'hbb)))})))
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire117;
  input wire signed [(3'h6):(1'h0)] wire116;
  input wire signed [(3'h4):(1'h0)] wire115;
  input wire signed [(3'h4):(1'h0)] wire114;
  input wire [(5'h15):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire142;
  wire signed [(4'ha):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire [(4'hc):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire128;
  wire signed [(5'h10):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(4'he):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
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
                 reg133,
                 reg132,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg118 <= $signed((^(($unsigned((8'ha6)) >> {wire117}) + {$unsigned(wire115),
          wire115[(1'h1):(1'h0)]})));
      reg119 <= (wire115 && (+wire113[(5'h11):(4'he)]));
      reg120 <= (wire113[(4'ha):(4'h8)] ^~ wire114[(3'h4):(1'h1)]);
      reg121 <= (~^reg120[(5'h10):(4'ha)]);
    end
  assign wire122 = $unsigned(((~((reg120 << wire117) > reg120[(5'h11):(2'h2)])) ?
                       $unsigned(wire113[(4'hc):(2'h2)]) : (((reg120 ?
                               wire117 : wire115) << (wire114 ?
                               (8'ha0) : wire115)) ?
                           {(~|wire114),
                               reg120[(4'ha):(1'h1)]} : reg119[(4'h9):(3'h5)])));
  assign wire123 = ((($unsigned(((8'hac) ?
                       (7'h42) : wire115)) >= ($unsigned(wire122) ?
                       $signed(reg119) : ((8'hb7) * wire113))) - reg120[(4'h9):(4'h8)]) + $unsigned($unsigned($signed((^(8'haa))))));
  assign wire124 = (~^$unsigned($unsigned($signed($unsigned(wire113)))));
  assign wire125 = ($unsigned($signed((((8'ha1) || wire122) << wire116[(3'h4):(1'h0)]))) ~^ $signed((|wire116[(2'h2):(1'h1)])));
  assign wire126 = (($unsigned(((^~wire122) ?
                           (wire115 && wire113) : $signed(reg119))) != $unsigned(reg121[(1'h1):(1'h1)])) ?
                       $unsigned(reg118[(4'h8):(1'h1)]) : $unsigned(reg118));
  assign wire127 = (reg121[(1'h1):(1'h1)] ?
                       $unsigned((~&$unsigned((reg118 ?
                           wire114 : reg120)))) : ({($signed(wire116) << reg121),
                           ((!wire115) >> $signed(wire114))} * reg118));
  assign wire128 = ($unsigned(reg119[(3'h6):(2'h3)]) ?
                       $unsigned(((8'ha7) || wire122)) : $signed($signed(({wire116,
                               wire117} ?
                           wire114 : {wire116, wire126}))));
  assign wire129 = wire124;
  assign wire130 = ($signed((^~wire117[(2'h2):(1'h0)])) != wire122);
  assign wire131 = reg119[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg132 <= $unsigned(($unsigned($unsigned((wire125 ? wire116 : wire128))) ?
          $unsigned(wire128) : ($unsigned({(8'ha4)}) >> wire127)));
      reg133 <= (|(($signed((~&wire126)) <<< $unsigned(wire125)) ^~ (((wire127 <<< wire122) ?
              (wire126 ? reg119 : reg118) : wire126[(4'hd):(2'h2)]) ?
          {((8'ha6) ? wire131 : wire113)} : (&$unsigned(wire125)))));
    end
  assign wire134 = ((-$unsigned((~$signed(reg119)))) ?
                       $unsigned(wire125) : wire117[(4'ha):(3'h7)]);
  assign wire135 = (reg120 ^~ (^~$signed($unsigned(reg118))));
  assign wire136 = $signed(wire123);
  assign wire137 = $signed(wire128[(4'hb):(2'h2)]);
  assign wire138 = (&reg120);
  assign wire139 = reg120[(5'h12):(2'h2)];
  assign wire140 = wire135;
  assign wire141 = wire125;
  assign wire142 = {{$signed((8'ha8))}};
endmodule
