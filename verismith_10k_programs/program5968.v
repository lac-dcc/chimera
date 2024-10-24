module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire188;
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  assign y = {wire135,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire56,
                 wire188,
                 reg60,
                 reg61,
                 (1'h0)};
  module5 #() modinst57 (.wire8(wire1), .wire7(wire3), .y(wire56), .wire6(wire2), .clk(clk), .wire9(wire0));
  assign wire58 = (8'hb2);
  assign wire59 = wire0[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg60 <= (~&$unsigned({wire58[(4'hf):(2'h3)]}));
      reg61 <= wire1;
    end
  assign wire62 = reg61[(5'h10):(3'h7)];
  assign wire63 = (wire3 <= (~^wire58[(1'h1):(1'h1)]));
  assign wire64 = (^(~&wire59));
  assign wire65 = $signed($unsigned((7'h43)));
  module66 #() modinst136 (wire135, clk, reg60, wire58, wire64, wire63);
  module137 #() modinst189 (wire188, clk, wire3, wire64, wire58, wire59, wire4);
endmodule

module module137
#(parameter param186 = (^~((~(((8'h9e) ? (8'hbe) : (8'hbb)) - (~&(8'hb6)))) <= {{((7'h44) <= (8'hbf))}, (((8'haa) <= (8'hb2)) ? ((8'ha5) ? (8'ha4) : (8'hbf)) : ((8'hb4) <= (8'ha3)))})), 
parameter param187 = ((((8'ha2) ? ((&param186) ^~ (|param186)) : ({param186} || param186)) ? (~^(~&(~^param186))) : ((~(-param186)) ? (~|(param186 ? param186 : (8'h9d))) : (((7'h40) ? param186 : param186) ? (~(7'h43)) : param186))) << (~&(8'hba))))
(y, clk, wire142, wire141, wire140, wire139, wire138);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire142;
  input wire signed [(4'ha):(1'h0)] wire141;
  input wire [(5'h14):(1'h0)] wire140;
  input wire [(5'h11):(1'h0)] wire139;
  input wire [(4'hc):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire185;
  wire signed [(4'he):(1'h0)] wire180;
  wire signed [(4'hb):(1'h0)] wire179;
  wire [(4'h9):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire177;
  wire [(4'hf):(1'h0)] wire176;
  wire signed [(4'h8):(1'h0)] wire175;
  wire [(2'h2):(1'h0)] wire174;
  wire signed [(4'hf):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire166;
  reg signed [(3'h6):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'hd):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  assign y = {wire185,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire166,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  module143 #() modinst167 (.wire146(wire138), .clk(clk), .wire147(wire139), .y(wire166), .wire145(wire141), .wire144(wire140));
  always
    @(posedge clk) begin
      reg168 <= (wire142 & (({{wire140, wire141},
          $signed(wire166)} & {wire138[(4'h9):(4'h9)]}) == ($signed((wire141 ?
          wire142 : wire140)) << (^~wire139[(3'h6):(2'h3)]))));
      reg169 <= (wire139 << wire142);
      reg170 <= $unsigned({(8'hb2),
          (^($unsigned(reg169) != $signed(wire166)))});
      reg171 <= (($signed((wire141[(3'h7):(3'h7)] ?
              (wire141 ? wire139 : wire166) : reg168)) ?
          (wire140 ?
              ($signed(wire166) >= $unsigned((8'hbb))) : wire139) : wire139[(4'h9):(3'h5)]) & wire140);
      reg172 <= (reg171[(4'he):(3'h6)] ?
          (reg169 ^ $unsigned(wire166[(2'h3):(2'h2)])) : (wire142[(3'h4):(1'h1)] && wire138[(3'h5):(2'h3)]));
    end
  assign wire173 = ($signed(reg168[(4'hb):(1'h0)]) ?
                       $signed(wire142) : (&(&wire140[(5'h12):(4'h8)])));
  assign wire174 = {(wire140[(5'h11):(1'h0)] ?
                           $unsigned((|(wire142 < wire173))) : reg169)};
  assign wire175 = $unsigned((~wire142[(2'h3):(1'h1)]));
  assign wire176 = $unsigned({$unsigned($unsigned($signed(reg169))),
                       wire139[(2'h3):(1'h0)]});
  assign wire177 = (8'ha5);
  assign wire178 = wire175[(3'h5):(2'h2)];
  assign wire179 = $unsigned(($signed({$signed(wire178)}) ?
                       $signed(wire138) : (wire139[(4'ha):(4'h9)] ?
                           $signed($unsigned((8'hac))) : wire178)));
  assign wire180 = (~((($unsigned(wire174) >= $unsigned(wire174)) >> $signed(wire139[(4'hf):(4'ha)])) == {(^$signed(wire177)),
                       (^wire140[(2'h2):(1'h1)])}));
  always
    @(posedge clk) begin
      reg181 <= (^~$signed(({(|wire178), ((8'hbb) ? wire176 : wire174)} ?
          $signed((wire142 >> wire180)) : wire173)));
    end
  always
    @(posedge clk) begin
      reg182 <= (({{(reg170 ^ wire139), ((8'hb0) ? (8'hbc) : wire179)},
              wire141} ?
          wire180[(4'ha):(3'h7)] : (~wire140)) ~^ (~|wire179[(4'h9):(3'h5)]));
      reg183 <= (!((((reg182 ?
              wire138 : wire141) >>> (7'h43)) ^ ($signed((8'hb5)) >= (wire142 >>> wire142))) ?
          $unsigned($unsigned((^(8'hbe)))) : wire140[(5'h13):(5'h12)]));
      reg184 <= ((^(~^(^$unsigned(wire138)))) ?
          {(-$unsigned($unsigned((7'h43)))),
              (reg170 ? wire139 : $signed({reg168, reg171}))} : (8'hbd));
    end
  assign wire185 = (~$signed(wire140[(1'h0):(1'h0)]));
endmodule

module module66
#(parameter param134 = ((|{((|(8'hbe)) ^ (^~(8'hb5))), {((8'ha4) ? (8'hb4) : (8'hb7)), ((8'ha9) < (8'haa))}}) != (((((8'haa) <<< (8'had)) >> ((8'ha6) ^ (8'ha4))) ^~ (~&{(8'h9d), (8'hb1)})) ? (^(((8'hb5) <= (8'hb5)) ? ((8'hbb) << (7'h41)) : ((7'h41) ? (8'hb2) : (8'hac)))) : ({((8'ha9) ? (8'hbf) : (8'hae))} >= (((8'ha1) ? (8'hae) : (8'ha5)) <= ((8'hbb) ? (8'hb3) : (8'hb6)))))))
(y, clk, wire67, wire68, wire69, wire70);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire67;
  input wire [(5'h15):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire132;
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire71,
                 wire93,
                 wire94,
                 wire132,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 (1'h0)};
  assign wire71 = ((&(8'hab)) ?
                      (((wire67[(2'h2):(1'h0)] && (&wire67)) << (wire67[(1'h0):(1'h0)] ~^ (7'h41))) ?
                          (wire68[(5'h12):(3'h6)] ?
                              wire69[(3'h6):(3'h6)] : $signed($signed(wire67))) : wire67) : (~(^$unsigned(wire69))));
  always
    @(posedge clk) begin
      if (wire67[(1'h0):(1'h0)])
        begin
          if ($unsigned((($unsigned((!wire68)) >> wire71) ^~ (+($signed(wire67) & (wire67 ?
              wire71 : wire70))))))
            begin
              reg72 <= (8'ha4);
            end
          else
            begin
              reg72 <= wire71[(2'h2):(1'h1)];
              reg73 <= {(wire70[(4'h8):(1'h0)] ?
                      (((wire67 < wire69) ?
                              $unsigned(wire70) : (wire69 ? wire70 : wire69)) ?
                          {(wire71 ?
                                  (8'ha5) : wire69)} : (reg72[(4'hf):(3'h4)] ?
                              wire68[(5'h14):(2'h2)] : (wire69 < wire71))) : {wire71[(3'h5):(2'h2)]})};
              reg74 <= ((~(wire68[(4'he):(3'h5)] ^~ (wire71[(3'h5):(1'h1)] ?
                  $unsigned(wire70) : wire69[(2'h2):(2'h2)]))) | ($unsigned(($signed(wire71) < $unsigned(wire71))) ^~ ((reg73 == (wire71 ?
                      wire70 : wire69)) ?
                  (reg73[(2'h2):(1'h1)] ^ (wire69 >> reg72)) : (-{reg73,
                      wire70}))));
              reg75 <= reg73[(3'h4):(2'h3)];
              reg76 <= wire71[(3'h4):(1'h0)];
            end
          reg77 <= $unsigned(wire69[(3'h7):(2'h2)]);
          if (($signed((reg72 ?
              (~|(reg72 && wire70)) : (~reg76[(2'h2):(1'h0)]))) * wire70[(4'h9):(1'h0)]))
            begin
              reg78 <= ($signed(reg74[(1'h1):(1'h0)]) >>> reg76[(5'h11):(3'h4)]);
            end
          else
            begin
              reg78 <= ((^~$signed({wire68})) >> (reg78[(3'h6):(2'h2)] ?
                  ($signed((wire68 > (8'hb7))) || ($signed(wire71) <= (~&reg74))) : (8'hb5)));
              reg79 <= (^~$signed((+({wire68} ?
                  (wire69 ? wire71 : wire71) : reg73[(1'h1):(1'h1)]))));
              reg80 <= (7'h40);
              reg81 <= reg73[(1'h0):(1'h0)];
            end
          if ($signed($signed({(^~reg79[(3'h4):(1'h0)]), reg77})))
            begin
              reg82 <= ($signed($signed(reg81[(3'h5):(2'h2)])) ^~ (7'h42));
              reg83 <= $unsigned($signed((reg77 * $unsigned({reg77}))));
              reg84 <= (reg83[(2'h3):(2'h2)] ?
                  (8'hbc) : ($signed(reg76[(5'h10):(3'h4)]) | $unsigned($signed(reg76))));
            end
          else
            begin
              reg82 <= $signed((~^$unsigned($signed($unsigned(reg74)))));
            end
          reg85 <= $unsigned($unsigned({$signed({wire71, reg78}), reg82}));
        end
      else
        begin
          reg72 <= (8'hbb);
          reg73 <= reg84;
        end
      if ((((reg72 || {$signed(reg82),
          (wire68 ?
              reg85 : reg74)}) | (-reg74)) ~^ (^~((~&reg81[(5'h11):(2'h2)]) * reg72[(4'hb):(1'h0)]))))
        begin
          reg86 <= reg72[(4'h8):(4'h8)];
          if (reg83)
            begin
              reg87 <= wire70;
              reg88 <= reg74[(4'hc):(1'h0)];
              reg89 <= reg87;
              reg90 <= reg89[(2'h2):(1'h1)];
              reg91 <= $unsigned($signed(wire71[(2'h3):(2'h3)]));
            end
          else
            begin
              reg87 <= (|(reg77 ^~ $unsigned(reg79[(3'h5):(3'h5)])));
              reg88 <= $signed($signed((~&reg85[(4'hb):(4'h8)])));
            end
        end
      else
        begin
          reg86 <= reg78;
        end
      reg92 <= reg85;
    end
  assign wire93 = reg79;
  assign wire94 = (wire67[(1'h0):(1'h0)] ?
                      $signed($signed((|$unsigned(reg89)))) : (-($unsigned((~(8'hb7))) <= {$signed(reg87)})));
  module95 #() modinst133 (.clk(clk), .wire99(reg83), .wire98(reg88), .wire97(wire69), .wire96(reg89), .y(wire132));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire54;
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire10, wire11, wire15, wire54, reg12, reg13, reg14, (1'h0)};
  assign wire10 = $unsigned(wire7);
  assign wire11 = ($signed(({$unsigned(wire9)} >= $unsigned($signed(wire10)))) - wire6[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg12 <= $signed($signed($unsigned(wire10)));
    end
  always
    @(posedge clk) begin
      reg13 <= reg12[(4'h9):(1'h0)];
      reg14 <= ((wire9[(3'h6):(3'h5)] >>> ($unsigned($signed(wire6)) * $unsigned({(8'ha9)}))) <= wire10);
    end
  assign wire15 = (^wire8);
  module16 #() modinst55 (.wire19(wire11), .clk(clk), .wire17(reg12), .y(wire54), .wire20(wire7), .wire18(wire15));
endmodule

module module16
#(parameter param52 = (((({(8'hae), (8'ha1)} ? ((8'hb9) - (8'hbc)) : {(8'ha6), (8'hb2)}) ? ({(8'hb1), (7'h40)} ? ((8'ha9) >= (8'haf)) : (8'hb5)) : ({(8'hb6)} ? {(7'h42)} : ((8'hbe) > (8'haa)))) ? (8'hb1) : (-(((8'had) ? (8'hb8) : (8'hba)) ? ((8'hb1) ? (8'hbb) : (8'ha4)) : {(8'ha6), (8'haf)}))) & (^((!((8'had) ? (8'ha6) : (8'hac))) ^~ (((8'ha5) ? (7'h41) : (8'ha5)) ? {(8'ha1)} : ((8'hb7) - (8'hb4)))))), 
parameter param53 = ((-param52) ? param52 : param52))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire37,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= ((^wire17[(4'hc):(1'h0)]) > $unsigned({wire18[(1'h1):(1'h1)]}));
      reg22 <= $signed($unsigned(((&(wire20 ?
          wire19 : wire19)) - $signed($unsigned(wire18)))));
    end
  assign wire23 = (reg22 ? reg22 : {$signed((~|$signed(wire18)))});
  assign wire24 = (!reg21[(3'h6):(2'h3)]);
  assign wire25 = wire23[(1'h1):(1'h1)];
  assign wire26 = {wire18[(3'h5):(1'h1)], wire20};
  assign wire27 = (!$signed(({(~wire23)} ?
                      ((8'hb6) ? wire25[(2'h2):(1'h0)] : wire20) : (&wire20))));
  assign wire28 = (($unsigned((&(wire26 ?
                          wire19 : wire23))) || {(wire19[(3'h6):(1'h1)] ?
                              wire20 : $unsigned((8'h9d))),
                          {$signed(wire20), $signed(wire25)}}) ?
                      ($unsigned(({wire18, reg22} ?
                              wire20[(2'h3):(1'h1)] : (wire27 || reg21))) ?
                          {wire25[(5'h10):(1'h1)]} : $unsigned($signed($unsigned(wire20)))) : wire17);
  assign wire29 = wire24[(3'h6):(3'h4)];
  assign wire30 = wire17;
  assign wire31 = (~^wire18);
  assign wire32 = wire18;
  always
    @(posedge clk) begin
      reg33 <= (!$unsigned($unsigned((8'ha1))));
      reg34 <= wire29[(2'h2):(1'h1)];
      reg35 <= (~(wire26[(4'h9):(3'h4)] >> $unsigned(((~^wire24) | wire30))));
      reg36 <= {(^(~$signed((!wire17)))), $unsigned(wire20)};
    end
  assign wire37 = (~|$unsigned((^(|(wire28 || wire31)))));
  always
    @(posedge clk) begin
      reg38 <= wire30;
      reg39 <= $unsigned((^(|$unsigned((wire32 ? wire18 : (8'hb1))))));
      if ((wire37 >= (~((8'ha1) ? $unsigned(wire31) : wire30[(2'h2):(1'h0)]))))
        begin
          reg40 <= $unsigned(((wire18[(2'h3):(2'h3)] ?
              wire17[(5'h11):(2'h2)] : {reg35[(4'h9):(2'h2)]}) | (^wire19)));
          if ($unsigned($unsigned((wire17[(2'h3):(2'h2)] & ((8'hb2) <= (reg40 | reg40))))))
            begin
              reg41 <= ((~^$unsigned((~^wire20))) ?
                  ((|(((8'hba) ~^ wire20) ?
                      wire25[(1'h0):(1'h0)] : $unsigned(reg36))) != {{(8'hb9)}}) : (+$unsigned((wire27[(1'h1):(1'h0)] ?
                      {(7'h44), (8'ha7)} : reg40))));
              reg42 <= {wire23[(1'h1):(1'h1)], $signed(wire27[(2'h2):(1'h1)])};
              reg43 <= reg36[(5'h10):(4'he)];
              reg44 <= (reg34[(3'h5):(3'h4)] < ((8'ha7) ?
                  wire25 : $signed($unsigned((wire17 > wire30)))));
              reg45 <= wire30[(2'h3):(2'h3)];
            end
          else
            begin
              reg41 <= reg40[(4'ha):(1'h0)];
            end
        end
      else
        begin
          reg40 <= wire28;
          if (reg33)
            begin
              reg41 <= $signed(((^$signed((wire17 ?
                  wire37 : wire30))) || wire25[(5'h12):(5'h10)]));
              reg42 <= $signed((~&reg33[(1'h0):(1'h0)]));
            end
          else
            begin
              reg41 <= (wire28 || $signed((~^(wire32 ?
                  (reg42 ? reg40 : wire18) : $signed(wire28)))));
              reg42 <= $signed($signed((((&reg43) ?
                  {wire17} : reg33) >> $unsigned((8'hb2)))));
            end
          reg43 <= wire37[(3'h4):(2'h2)];
        end
      reg46 <= $unsigned(reg42);
      reg47 <= ($unsigned(wire37) ?
          $unsigned((-wire19[(3'h7):(2'h3)])) : reg21);
    end
  assign wire48 = wire37;
  assign wire49 = ($unsigned({$signed(reg43),
                      reg40[(4'hc):(2'h2)]}) + (|{$unsigned($signed(wire32)),
                      ((wire37 <<< (8'hb6)) ?
                          $unsigned((7'h43)) : {wire20, wire28})}));
  assign wire50 = reg33[(2'h2):(2'h2)];
  assign wire51 = {(-wire24[(4'hc):(3'h7)]), $unsigned((^(-wire17)))};
endmodule

module module95
#(parameter param131 = (~{(^{(7'h44)})}))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire99;
  input wire [(4'hd):(1'h0)] wire98;
  input wire signed [(2'h2):(1'h0)] wire97;
  input wire signed [(5'h10):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire100;
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  assign y = {wire130,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire100 = wire98;
  assign wire101 = wire98[(1'h1):(1'h0)];
  assign wire102 = {wire96[(4'ha):(1'h1)],
                       $signed({(&$signed((8'had))), wire96})};
  assign wire103 = (&({{wire102}} | wire100));
  always
    @(posedge clk) begin
      reg104 <= wire98[(3'h4):(2'h3)];
      if ($unsigned((8'haf)))
        begin
          if (wire103)
            begin
              reg105 <= $unsigned($unsigned($unsigned(wire103[(4'hb):(3'h7)])));
              reg106 <= (^~wire99[(3'h5):(2'h2)]);
              reg107 <= $unsigned(({(~^(wire96 << wire99)),
                  {$signed(wire97),
                      reg106[(4'h9):(1'h0)]}} ~^ $unsigned(wire100)));
              reg108 <= wire96[(3'h4):(3'h4)];
            end
          else
            begin
              reg105 <= $unsigned((((reg108[(3'h6):(1'h1)] ?
                      $signed((8'hbe)) : reg106[(1'h0):(1'h0)]) ?
                  $unsigned(reg107[(3'h5):(3'h4)]) : $unsigned((!wire102))) >= wire99[(3'h4):(2'h3)]));
              reg106 <= ($signed(wire98) ? wire99 : reg106[(4'he):(1'h1)]);
              reg107 <= (^wire99);
              reg108 <= wire96[(4'ha):(4'ha)];
              reg109 <= reg106;
            end
          reg110 <= $unsigned(((~^(~^{(7'h42), wire100})) ?
              wire98 : ((^~$unsigned(reg108)) ?
                  $unsigned(wire100[(4'he):(4'he)]) : wire101)));
        end
      else
        begin
          if (reg110[(2'h3):(1'h0)])
            begin
              reg105 <= $signed(reg108[(4'h9):(3'h6)]);
              reg106 <= wire98[(4'ha):(3'h5)];
              reg107 <= {$signed((~&($signed(reg108) ?
                      (!wire99) : $signed(reg104))))};
              reg108 <= ((wire99 ?
                  $signed((reg109 >> {reg104,
                      reg110})) : $unsigned(reg107)) | (~^$unsigned($signed((reg105 ?
                  reg108 : (8'h9e))))));
              reg109 <= reg105;
            end
          else
            begin
              reg105 <= $signed({$signed((~&(wire98 + (8'hac)))),
                  (reg105 <<< ($signed(wire98) ?
                      (wire98 <<< (8'hb2)) : $unsigned((8'ha7))))});
              reg106 <= $signed(wire97);
              reg107 <= reg104[(2'h2):(1'h0)];
              reg108 <= reg107;
              reg109 <= $unsigned(wire97[(1'h1):(1'h0)]);
            end
          reg110 <= $unsigned($signed($signed(((-wire98) ?
              $signed(reg104) : reg110[(1'h1):(1'h0)]))));
          if (({$signed(reg107[(4'hd):(2'h3)]), reg106} << ($signed(((wire99 ?
                      wire96 : wire99) ?
                  $signed((7'h40)) : reg104[(2'h2):(1'h0)])) ?
              (~|reg104[(1'h0):(1'h0)]) : wire99)))
            begin
              reg111 <= ((($signed(reg106[(5'h11):(2'h3)]) ^ $unsigned((wire98 ?
                          wire96 : reg106))) ?
                      wire96 : (reg110 ?
                          wire98[(2'h2):(1'h0)] : ({wire102,
                              wire100} & $signed(reg106)))) ?
                  {(-(|$signed(wire97)))} : ((wire97[(1'h1):(1'h1)] ~^ $unsigned((|reg106))) & ($signed({reg108,
                          reg106}) ?
                      wire103[(2'h2):(2'h2)] : $unsigned((^~wire100)))));
              reg112 <= wire98;
              reg113 <= (((~|({reg104, wire100} ?
                          $unsigned((8'hb6)) : {wire101, wire97})) ?
                      (!$signed({reg112,
                          (8'hb2)})) : $signed(($unsigned(reg107) >> (~&(8'haa))))) ?
                  reg106[(4'hb):(4'h8)] : ($signed(reg107[(4'he):(3'h5)]) >= reg111[(2'h3):(1'h0)]));
              reg114 <= ((-(+$unsigned(reg111[(2'h2):(1'h1)]))) ?
                  (($unsigned((reg108 ? wire103 : reg110)) - reg113) ?
                      ($unsigned({wire100,
                          wire102}) && reg111) : $unsigned(wire97)) : (|{$signed((8'ha3)),
                      (^~$signed(reg113))}));
            end
          else
            begin
              reg111 <= $signed(((-(wire103 + (wire103 <<< wire103))) * reg104[(2'h2):(1'h0)]));
              reg112 <= wire101[(3'h7):(2'h3)];
              reg113 <= (reg105 == {(reg112 ?
                      reg105 : (reg112[(5'h11):(4'h8)] ?
                          wire97[(1'h0):(1'h0)] : wire102[(3'h6):(1'h1)])),
                  wire98});
              reg114 <= wire98[(4'h8):(3'h4)];
            end
          reg115 <= (&((^~wire100[(4'h9):(3'h7)]) << (reg107 < ({wire102,
              (7'h40)} * $unsigned((8'hae))))));
          reg116 <= reg111;
        end
      reg117 <= (wire99 ? reg110 : (8'hae));
      if (reg108)
        begin
          if (reg104)
            begin
              reg118 <= {(($signed((reg110 ?
                      wire103 : reg116)) | $signed(reg114[(1'h1):(1'h1)])) >> ($signed((wire101 <= wire101)) ^ wire97)),
                  (8'ha7)};
            end
          else
            begin
              reg118 <= $signed(($signed(reg115) ?
                  (((wire101 ^~ reg118) >= (8'hb1)) + $signed((&reg117))) : reg108[(4'hd):(3'h5)]));
              reg119 <= wire100;
              reg120 <= $signed((($signed((reg113 ^ reg107)) ?
                  reg115[(1'h0):(1'h0)] : ($signed((8'hb1)) ?
                      $signed(wire101) : (^reg109))) < reg108));
            end
          if ((~|{reg107[(1'h1):(1'h0)],
              {((wire102 <<< (7'h44)) || (reg108 ? reg105 : reg108))}}))
            begin
              reg121 <= reg104;
              reg122 <= (wire98[(1'h1):(1'h0)] << wire98);
              reg123 <= $unsigned($unsigned({(wire102 ?
                      (~|wire100) : {reg104, (7'h44)}),
                  ({(8'ha2), reg111} <<< (reg108 ? reg122 : reg116))}));
              reg124 <= reg108;
              reg125 <= $signed({(reg117 ?
                      reg115[(1'h0):(1'h0)] : {$unsigned(reg123),
                          reg124[(5'h10):(5'h10)]})});
            end
          else
            begin
              reg121 <= ({((reg120[(2'h2):(2'h2)] * ((8'hbb) | (8'ha9))) ?
                      reg120 : (~&(reg114 << (8'hb4))))} & $signed((+$signed((!reg120)))));
              reg122 <= reg110;
              reg123 <= reg122;
              reg124 <= $signed(reg125[(4'ha):(3'h6)]);
            end
          if ((|reg120[(4'hf):(4'ha)]))
            begin
              reg126 <= $signed(($unsigned((wire102[(3'h5):(3'h4)] ?
                  (wire100 ?
                      reg112 : (8'hae)) : $signed(reg120))) >>> {$unsigned($signed((8'hbf)))}));
              reg127 <= (($signed((!reg117[(2'h2):(2'h2)])) < $signed((~&(reg109 >= wire100)))) ~^ $signed((~|reg125[(5'h11):(3'h4)])));
              reg128 <= (reg126 ~^ reg109[(4'hc):(4'h9)]);
            end
          else
            begin
              reg126 <= $signed(((8'h9d) ?
                  {(reg108[(3'h7):(3'h7)] ?
                          $signed(reg107) : {reg123,
                              reg118})} : $signed(reg111)));
              reg127 <= reg114[(1'h0):(1'h0)];
            end
          reg129 <= reg109;
        end
      else
        begin
          reg118 <= (reg119 ?
              ($unsigned($unsigned($signed(reg128))) & {$unsigned((reg111 <<< reg105)),
                  reg118[(2'h2):(1'h0)]}) : $signed(((reg119[(3'h4):(2'h3)] ?
                  (|reg127) : (~wire98)) >> (reg126[(1'h1):(1'h0)] ?
                  $unsigned(reg111) : (reg113 <<< wire96)))));
        end
    end
  assign wire130 = (~reg122);
endmodule

module module143
#(parameter param164 = ({{(+(8'ha0))}} > (-((((7'h41) + (8'ha9)) || {(8'hb1), (8'hbb)}) - (|(-(8'hb6)))))), 
parameter param165 = (param164 ? (({(param164 >= (8'hb4)), (param164 ? (8'ha8) : param164)} ^ ({param164} * ((8'h9e) ? (8'ha6) : (8'hbe)))) <<< ((^~(param164 && param164)) | (~^(~param164)))) : param164))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire147;
  input wire signed [(4'hc):(1'h0)] wire146;
  input wire [(3'h4):(1'h0)] wire145;
  input wire [(3'h6):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire161;
  wire [(4'h8):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire159;
  wire signed [(3'h5):(1'h0)] wire148;
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire148,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire148 = ((+wire147) || ($signed({(~wire144)}) ?
                       {wire144[(1'h0):(1'h0)], wire147} : ((|wire144) ?
                           $signed((-wire144)) : wire144[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire145)
        begin
          if (wire144[(3'h4):(2'h2)])
            begin
              reg149 <= $unsigned((7'h43));
              reg150 <= wire146[(4'h9):(3'h7)];
              reg151 <= {wire144[(1'h1):(1'h1)]};
            end
          else
            begin
              reg149 <= {(^~((~$signed((8'hac))) ?
                      wire145 : ((wire144 ^ reg151) ?
                          (8'ha2) : $signed(wire144)))),
                  ($signed(reg151) ?
                      $unsigned(($unsigned(reg149) | reg151[(1'h1):(1'h1)])) : $unsigned($unsigned((~^wire147))))};
            end
          if ((8'hb5))
            begin
              reg152 <= (!{(((wire147 <= wire145) * $signed(wire144)) ?
                      (+{wire146, reg149}) : {(&wire148),
                          wire146[(2'h2):(1'h0)]}),
                  (~^wire148)});
              reg153 <= (reg151[(1'h0):(1'h0)] ^~ reg152);
              reg154 <= wire148;
            end
          else
            begin
              reg152 <= ((+$unsigned(((reg151 - wire144) | {wire145}))) ?
                  ($signed((^~reg150[(4'h8):(3'h6)])) ^ $signed(((wire145 >= reg153) * reg150[(4'ha):(3'h5)]))) : wire148[(2'h3):(2'h2)]);
            end
          reg155 <= ($unsigned((+{$signed((8'ha7)), wire148})) ?
              ({reg149, ((!wire145) > (reg152 ? reg149 : reg154))} ?
                  $signed(($unsigned(wire148) ?
                      wire144 : reg152[(3'h6):(2'h3)])) : $unsigned(wire147)) : reg149);
          reg156 <= $unsigned((-reg150[(4'hb):(4'h9)]));
        end
      else
        begin
          reg149 <= $unsigned(wire146[(2'h2):(1'h1)]);
        end
      reg157 <= (^~(((!$unsigned(wire145)) ^ $unsigned($unsigned(reg149))) != {(reg149[(3'h4):(2'h3)] | (~|wire148))}));
      reg158 <= (wire146 && {wire145, reg154});
    end
  assign wire159 = ((wire144 ? reg155[(1'h1):(1'h0)] : reg155) ?
                       ($unsigned(($signed(reg154) >>> (~|reg149))) ?
                           $signed((wire145[(1'h0):(1'h0)] ?
                               (wire144 >> (8'hab)) : $signed(wire148))) : (((reg151 ^ reg151) ?
                                   $unsigned(reg151) : $unsigned(reg156)) ?
                               (|(reg150 ?
                                   wire146 : wire148)) : $signed($signed(wire146)))) : $unsigned((($unsigned(wire148) & ((7'h42) == reg155)) ?
                           (&(wire144 ? reg151 : wire145)) : ($signed((8'ha0)) ?
                               $unsigned(reg151) : reg158[(4'he):(4'hb)]))));
  assign wire160 = ({((&$unsigned(reg155)) ?
                               $signed((wire147 ? (8'hb9) : reg155)) : reg157),
                           $signed($signed((~&reg154)))} ?
                       reg152[(2'h3):(2'h2)] : reg152[(3'h6):(3'h5)]);
  assign wire161 = $signed($signed((reg157 ?
                       {$unsigned(reg150),
                           (^wire159)} : $signed(wire145[(1'h1):(1'h1)]))));
  assign wire162 = reg154[(2'h3):(2'h2)];
  assign wire163 = {reg153,
                       {((~^(^~wire144)) - wire161[(2'h3):(1'h0)]),
                           (($unsigned(wire148) >= ((7'h40) ?
                                   (8'ha1) : (8'hb4))) ?
                               (!(wire148 ?
                                   wire159 : (8'hba))) : {(reg150 * (8'hb6))})}};
endmodule
