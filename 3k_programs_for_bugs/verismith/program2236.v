module top
#(parameter param185 = (+(({((7'h44) + (8'ha3)), (~&(8'hba))} >>> (&(-(8'hbe)))) ? ((((8'hac) ? (8'hbf) : (8'hb2)) != ((8'ha3) * (8'ha4))) ? ((8'hb6) ? {(7'h40)} : ((8'h9d) || (8'hb2))) : (+((7'h44) ~^ (8'ha4)))) : ((((8'hbb) ? (7'h44) : (8'ha1)) ? (!(8'ha8)) : ((8'ha5) ^~ (8'ha3))) ? {((8'haa) ^~ (8'hb0))} : {(~(8'hb9))}))), 
parameter param186 = param185)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire178;
  wire [(4'hf):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire181;
  wire signed [(4'h9):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire183;
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  assign y = {wire175,
                 wire66,
                 wire57,
                 wire56,
                 wire49,
                 wire47,
                 wire177,
                 wire178,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  module5 #() modinst48 (.wire9(wire3), .clk(clk), .wire8(wire2), .wire7(wire1), .wire6(wire0), .y(wire47));
  assign wire49 = ((((wire0[(3'h6):(3'h5)] ?
                      wire3 : $unsigned(wire47)) ^ wire3) < (($unsigned((8'hb9)) >> {(8'hb6)}) > $unsigned(wire2))) || wire3);
  always
    @(posedge clk) begin
      reg50 <= (wire49 ?
          {(wire4 ?
                  ((wire3 ? (8'h9c) : wire2) ?
                      $signed(wire1) : (wire2 < wire3)) : (^~$unsigned(wire1))),
              $unsigned(wire4)} : $signed((wire2 & $unsigned((~^wire2)))));
      if (($signed((|wire2[(4'hd):(3'h7)])) ?
          wire47[(3'h5):(1'h1)] : (wire3[(5'h13):(5'h13)] | (^~(!wire4)))))
        begin
          reg51 <= (wire49 ?
              $unsigned($unsigned(($signed(wire3) ?
                  wire49[(3'h7):(1'h1)] : wire49[(4'h8):(3'h5)]))) : (~|$signed(wire49[(3'h4):(2'h2)])));
          reg52 <= $signed(wire47);
          reg53 <= ((((~&(wire4 ? (8'hb3) : wire0)) ?
                  $signed($unsigned(wire4)) : $signed((wire47 ?
                      reg52 : reg51))) & $unsigned($unsigned(reg51))) ?
              reg51[(1'h1):(1'h1)] : ((wire3[(4'he):(4'h9)] ?
                      (!(!wire4)) : $unsigned((~&wire49))) ?
                  (($unsigned(wire47) ? (wire47 - wire47) : (wire2 << reg50)) ?
                      $unsigned((wire0 && reg52)) : $signed((wire1 || wire47))) : $unsigned(wire2)));
          reg54 <= ({wire49,
                  ((~|reg52[(3'h7):(2'h3)]) ^~ ($unsigned(reg50) > (wire2 * wire47)))} ?
              reg53 : (reg51[(2'h2):(2'h2)] >>> (&{$unsigned(reg52),
                  (wire49 ? wire47 : reg52)})));
        end
      else
        begin
          reg51 <= $unsigned($signed((reg53 ?
              $signed((reg50 || reg53)) : ((!reg54) ? (~wire49) : wire49))));
          reg52 <= $unsigned(((($unsigned(reg51) ?
                      reg51 : (reg53 ? wire49 : wire4)) ?
                  ((wire0 + wire3) ?
                      wire0[(4'h8):(3'h6)] : wire47[(3'h4):(1'h1)]) : wire1[(4'ha):(4'ha)]) ?
              ($unsigned($signed(wire47)) ?
                  reg53[(1'h0):(1'h0)] : $signed((|(8'hb8)))) : (~(|$unsigned(wire0)))));
          reg53 <= (!(8'hb3));
          reg54 <= {(|(^$signed((+reg54))))};
        end
      reg55 <= ({(~((~reg52) ~^ (reg52 << (8'ha6)))),
          wire1[(3'h6):(1'h1)]} >>> reg53[(3'h5):(2'h3)]);
    end
  assign wire56 = reg50[(2'h2):(2'h2)];
  assign wire57 = (wire4[(2'h3):(2'h2)] ?
                      (-{wire3}) : ((~&wire0) ?
                          (|$signed((reg51 ?
                              reg51 : reg50))) : $signed(($signed(wire4) ^~ reg53[(3'h6):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed((reg53 & reg54)) ? (8'hb1) : (8'h9c)))))
        begin
          reg58 <= wire57;
          reg59 <= $signed({($unsigned((wire1 > wire1)) ?
                  reg58[(4'h8):(4'h8)] : $unsigned(reg51[(2'h2):(1'h0)]))});
        end
      else
        begin
          if (($signed(($unsigned({reg59, wire1}) ?
                  $unsigned($unsigned(reg54)) : $unsigned(reg51[(2'h2):(2'h2)]))) ?
              (-(((wire47 ? (8'ha6) : reg53) * (wire49 ? reg51 : reg55)) ?
                  (7'h44) : $unsigned(reg52))) : (&($signed(wire3) ?
                  ($signed(wire4) & {reg58}) : (^reg54)))))
            begin
              reg58 <= (&$signed($signed($unsigned({reg58, (8'hbc)}))));
              reg59 <= {{(wire0 ?
                          (&(^(8'ha5))) : ((wire49 & reg51) >= $unsigned(reg52)))}};
              reg60 <= wire2;
              reg61 <= ((wire1[(4'h8):(3'h7)] ?
                  wire2[(3'h5):(1'h1)] : (~(wire56 ?
                      reg51[(2'h2):(1'h0)] : reg53[(3'h7):(1'h1)]))) && $unsigned(wire47));
              reg62 <= (~^$unsigned((^$signed((reg59 ? (7'h43) : wire0)))));
            end
          else
            begin
              reg58 <= $unsigned($unsigned($unsigned((((8'haa) >= reg55) | (wire57 ?
                  wire57 : reg52)))));
            end
        end
      reg63 <= reg60;
      reg64 <= $unsigned(wire57);
      reg65 <= ($unsigned(($signed((reg54 && wire3)) != wire0[(3'h4):(1'h0)])) >> ($signed((~&(~&wire56))) ?
          ($unsigned((reg52 ? wire57 : wire56)) ?
              (~|{reg54}) : $unsigned({reg55})) : wire4[(2'h3):(1'h1)]));
    end
  assign wire66 = $signed($unsigned(($signed($unsigned(reg59)) != ((+reg52) <<< $unsigned((8'ha2))))));
  module67 #() modinst176 (wire175, clk, reg60, reg65, wire1, wire56, wire0);
  assign wire177 = $unsigned((reg58[(4'hf):(4'hb)] ?
                       ((~^(~wire0)) == $signed((8'hbf))) : reg52[(4'h8):(3'h5)]));
  module127 #() modinst179 (.wire130(reg55), .y(wire178), .wire129(reg53), .clk(clk), .wire131(reg58), .wire128(reg62));
  assign wire180 = {(~&wire47[(3'h7):(1'h0)]),
                       $signed((((&(7'h43)) ?
                           wire4[(4'h8):(1'h1)] : (wire178 ?
                               wire177 : reg53)) << ((reg50 ?
                           wire49 : wire0) && {reg65, wire2})))};
  assign wire181 = reg58;
  assign wire182 = {(-(^$signed(wire0[(1'h0):(1'h0)]))),
                       $unsigned($unsigned(((reg50 >>> wire181) ?
                           (wire4 <<< wire0) : (wire2 || reg54))))};
  module74 #() modinst184 (wire183, clk, reg55, reg53, reg60, wire175, reg54);
endmodule

module module67
#(parameter param173 = {(((((8'ha9) * (8'h9d)) != ((8'ha0) >>> (8'ha1))) >= {((8'ha5) - (8'hb7))}) != ((-((8'hac) ? (7'h44) : (8'had))) && ((|(8'h9f)) << {(7'h42)})))}, 
parameter param174 = (~^{({(param173 ? (8'h9e) : param173), {param173, param173}} << (~|((8'hbe) >> param173)))}))
(y, clk, wire68, wire69, wire70, wire71, wire72);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire69;
  input wire [(4'hd):(1'h0)] wire70;
  input wire [(4'he):(1'h0)] wire71;
  input wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire164;
  wire [(2'h2):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire102;
  reg [(3'h6):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h14):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  assign y = {wire164,
                 wire126,
                 wire124,
                 wire104,
                 wire73,
                 wire102,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 (1'h0)};
  assign wire73 = wire72;
  module74 #() modinst103 (.wire78(wire69), .wire79(wire71), .wire75(wire70), .y(wire102), .wire77(wire72), .clk(clk), .wire76(wire73));
  assign wire104 = {wire102[(1'h0):(1'h0)],
                       $unsigned(({(wire70 ? wire68 : wire70),
                               wire68[(3'h5):(3'h4)]} ?
                           ((wire73 <= wire70) ?
                               ((8'hbc) ?
                                   wire70 : (8'hbe)) : $unsigned(wire72)) : $unsigned((wire69 <<< wire71))))};
  module105 #() modinst125 (wire124, clk, wire73, wire68, wire104, wire102);
  assign wire126 = wire70[(3'h5):(1'h0)];
  module127 #() modinst165 (.clk(clk), .wire130(wire68), .y(wire164), .wire128(wire73), .wire129(wire124), .wire131(wire71));
  always
    @(posedge clk) begin
      reg166 <= wire71[(4'h9):(1'h1)];
      if (wire68[(3'h5):(2'h2)])
        begin
          if (reg166)
            begin
              reg167 <= wire71;
            end
          else
            begin
              reg167 <= ({(reg166 ?
                      ({wire72} ? $unsigned(wire124) : {(8'h9c)}) : reg167),
                  ((~^(~|wire102)) ?
                      $signed($unsigned(wire72)) : ({reg167} & ((7'h41) ?
                          (8'haf) : reg167)))} >> $unsigned($unsigned($signed(wire126))));
              reg168 <= $unsigned($unsigned(wire70));
              reg169 <= reg166;
              reg170 <= (+((wire102[(4'h9):(1'h1)] ^ ($unsigned(wire104) ?
                  $unsigned(wire104) : $unsigned(reg167))) ^~ $unsigned(wire104[(3'h4):(1'h0)])));
            end
        end
      else
        begin
          reg167 <= reg170;
        end
      reg171 <= (^(8'hb5));
      reg172 <= ((8'hb7) != wire71);
    end
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  assign y = {wire46, wire44, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $signed((&(8'hbe)));
  assign wire11 = (8'h9d);
  assign wire12 = $unsigned($unsigned(((-(-wire9)) || wire11[(5'h12):(4'hc)])));
  assign wire13 = wire7;
  assign wire14 = wire9;
  module15 #() modinst45 (wire44, clk, wire12, wire14, wire10, wire9);
  assign wire46 = $signed(wire11[(4'ha):(3'h6)]);
endmodule

module module15
#(parameter param43 = ((-({{(8'h9c)}, (8'hb4)} ? (((8'ha3) ? (8'ha6) : (8'hba)) > {(8'hab)}) : (|((8'ha2) ? (8'ha3) : (8'hb3))))) * (^(+((~|(8'hbf)) ? ((8'haf) ? (8'hb3) : (8'hb8)) : ((8'ha1) == (8'ha2)))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire20 = (-(wire18 ? wire19 : wire17[(2'h3):(1'h1)]));
  assign wire21 = ($unsigned(wire20) ?
                      wire19[(3'h6):(3'h4)] : ((wire18[(4'hc):(4'h8)] + ($signed((8'hab)) > wire20)) ?
                          ($signed(wire16[(4'hb):(4'h9)]) ?
                              $signed({wire16}) : $unsigned((wire20 == wire17))) : $signed($unsigned((+wire20)))));
  assign wire22 = $signed((8'ha9));
  assign wire23 = (~&{wire21[(3'h5):(1'h0)]});
  assign wire24 = {$unsigned($unsigned(($signed(wire18) ?
                          (wire22 + wire19) : $signed(wire23))))};
  assign wire25 = $signed($unsigned($signed(wire24[(2'h2):(2'h2)])));
  assign wire26 = {wire23,
                      {({$signed(wire22), wire25} ?
                              wire19 : ((wire18 ? wire21 : wire18) ?
                                  $signed(wire16) : (wire23 ?
                                      (8'ha6) : wire22)))}};
  assign wire27 = wire26;
  assign wire28 = (((|(~(~&(7'h43)))) > (wire26[(1'h1):(1'h0)] ?
                      $unsigned((wire25 == wire27)) : $unsigned(((8'ha0) ?
                          wire26 : wire16)))) || wire20[(1'h0):(1'h0)]);
  assign wire29 = ($unsigned($unsigned(wire21)) ?
                      (&(^(~|$signed((8'hb7))))) : wire19[(4'hc):(3'h5)]);
  always
    @(posedge clk) begin
      reg30 <= (~|(~(!($signed(wire17) ?
          (wire21 ? wire21 : wire28) : (|wire26)))));
      reg31 <= $signed((wire27 ? wire26 : (~&wire22)));
      reg32 <= (({((~wire22) || wire26),
          $unsigned(wire20[(2'h2):(2'h2)])} < ($unsigned(wire24) == ($signed(wire28) ?
          wire16[(2'h2):(1'h1)] : $unsigned(reg31)))) - wire24[(1'h1):(1'h0)]);
      reg33 <= $signed((($unsigned($unsigned(reg30)) ?
              wire20 : $unsigned(((8'hb7) ? wire19 : wire25))) ?
          {$signed(wire28[(4'h8):(3'h5)]), {(~^wire17), (~wire23)}} : (8'hbe)));
    end
  assign wire34 = ($unsigned($unsigned(wire21[(1'h1):(1'h1)])) ?
                      ($unsigned(wire16) ?
                          $signed(wire18[(2'h2):(1'h1)]) : ((^(wire28 << wire24)) ?
                              reg30 : reg33[(2'h2):(2'h2)])) : $signed(wire24[(2'h2):(2'h2)]));
  assign wire35 = (wire23 <<< $signed(($unsigned($signed(wire24)) || $unsigned($signed((8'haf))))));
  assign wire36 = (7'h40);
  assign wire37 = (((wire25[(4'h8):(2'h3)] | wire35) ?
                          wire17[(1'h1):(1'h1)] : ($signed((!wire29)) + wire25)) ?
                      $signed(wire34) : $unsigned(wire19));
  assign wire38 = $signed((((^{wire24, wire17}) + (8'hb2)) < (reg32 ?
                      (reg30[(1'h1):(1'h0)] ?
                          {(8'ha1)} : {wire37, reg30}) : (~&{wire20}))));
  assign wire39 = wire28;
  assign wire40 = wire39;
  assign wire41 = wire29[(4'he):(4'h9)];
  assign wire42 = $signed((($unsigned($signed(wire23)) << $signed((~&wire41))) ?
                      (8'haf) : ($unsigned(reg33) ?
                          ($signed(wire23) & $unsigned(wire26)) : $signed((wire24 >= wire34)))));
endmodule

module module127
#(parameter param162 = ((|(((8'hb7) << {(8'ha6)}) ^~ (((8'hb4) >= (8'hbc)) ? {(7'h43)} : (!(8'haa))))) ? ((^~({(8'hb2), (7'h43)} + ((7'h43) ? (7'h41) : (8'ha4)))) ? (+(((8'hb2) ? (8'hbd) : (8'h9c)) > ((8'hbd) * (8'hbd)))) : {(|(+(8'hb6)))}) : ({(((8'h9d) ? (8'hb8) : (8'hbd)) ? ((8'ha3) + (8'hbc)) : {(8'hb1)})} > ((~^((8'ha6) != (8'hb6))) ? (((8'hb6) ? (8'hbd) : (8'hb3)) >> (8'hb1)) : ((~^(8'ha9)) ? (+(8'ha8)) : ((8'hb9) ^~ (8'h9e)))))), 
parameter param163 = (~(&(((&param162) ? (&param162) : param162) <<< param162))))
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire131;
  input wire signed [(2'h3):(1'h0)] wire130;
  input wire signed [(5'h13):(1'h0)] wire129;
  input wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire160;
  wire signed [(4'ha):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(5'h13):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  wire [(2'h3):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(2'h3):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(2'h2):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire142,
                 wire141,
                 wire140,
                 wire133,
                 wire132,
                 reg151,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  assign wire132 = (&$signed(($unsigned(wire130[(1'h1):(1'h1)]) ?
                       $signed({wire131}) : {$signed((8'hbb))})));
  assign wire133 = wire128[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg134 <= (wire132[(3'h4):(1'h1)] || ($unsigned((~|(wire128 != wire129))) ?
          ($signed((^wire131)) * $unsigned($signed(wire130))) : $unsigned(((8'hac) && $signed(wire128)))));
      reg135 <= wire131[(4'h9):(1'h0)];
      reg136 <= wire128[(5'h11):(4'hc)];
      if ($signed($unsigned(({(&reg136)} == $signed($signed(wire131))))))
        begin
          reg137 <= wire130;
        end
      else
        begin
          reg137 <= ($signed($signed(($unsigned((8'hb7)) * (wire132 ?
                  wire130 : reg136)))) ?
              $signed((~|reg136[(1'h1):(1'h1)])) : $signed(wire128));
          reg138 <= reg137[(2'h2):(1'h1)];
        end
      reg139 <= wire129;
    end
  assign wire140 = ($unsigned(($signed((wire129 ^ wire130)) ?
                           (~&$unsigned(wire131)) : (+reg137[(3'h5):(3'h5)]))) ?
                       (~|reg136) : $signed((($signed(wire129) ?
                               {wire133} : (&wire128)) ?
                           ((reg136 & (8'h9f)) ?
                               $signed(wire133) : (wire129 ?
                                   reg138 : wire132)) : ((wire131 ?
                                   reg136 : reg138) ?
                               (~^(8'hbe)) : (8'hb8)))));
  assign wire141 = (wire133[(3'h4):(2'h3)] ^ ((!((reg139 ?
                           reg135 : (7'h43)) != reg137[(2'h3):(2'h2)])) ?
                       wire133 : (&wire130)));
  assign wire142 = ((~&(~^((-reg137) - wire129))) ?
                       ((wire132[(3'h4):(2'h3)] ?
                           reg134 : (|reg139[(1'h0):(1'h0)])) || {reg139,
                           $unsigned($signed(wire141))}) : {wire141[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg143 <= ({($signed((~(8'haf))) << (^(|reg138)))} ?
          $signed(reg135) : $unsigned(wire133[(1'h1):(1'h0)]));
      reg144 <= $unsigned((wire141 ?
          (wire128 | wire129[(3'h6):(3'h6)]) : $unsigned(wire142)));
      reg145 <= wire132[(2'h2):(1'h0)];
      reg146 <= ($unsigned(reg135) > $signed(wire131[(4'hd):(3'h5)]));
    end
  assign wire147 = wire130;
  assign wire148 = reg136;
  assign wire149 = wire128[(5'h11):(1'h1)];
  assign wire150 = wire131[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg151 <= $unsigned((wire131[(3'h4):(2'h3)] && reg135));
    end
  assign wire152 = $unsigned(wire133);
  assign wire153 = (~^{$signed(wire152[(5'h12):(4'h8)])});
  assign wire154 = (-({reg143[(5'h10):(5'h10)]} ?
                       {($signed((8'haa)) * wire150[(1'h1):(1'h1)]),
                           $signed((wire149 < wire129))} : {$unsigned($signed(wire129))}));
  assign wire155 = (~$unsigned(wire140[(1'h0):(1'h0)]));
  assign wire156 = reg139[(1'h1):(1'h1)];
  assign wire157 = ((reg144[(4'h8):(1'h0)] ?
                           ((reg136[(1'h1):(1'h1)] ^ reg138[(2'h2):(1'h0)]) ?
                               wire133 : wire140[(2'h3):(1'h0)]) : reg136[(1'h0):(1'h0)]) ?
                       $unsigned((+reg137)) : reg151);
  assign wire158 = reg146[(3'h7):(1'h1)];
  assign wire159 = ((~^$unsigned(wire153)) ? wire140[(1'h0):(1'h0)] : reg139);
  assign wire160 = ($unsigned($signed((wire148[(1'h1):(1'h1)] ?
                           wire154[(1'h0):(1'h0)] : {wire142, reg138}))) ?
                       ($unsigned(((8'hac) <<< wire133[(1'h0):(1'h0)])) ?
                           $signed((reg139 ?
                               reg144[(5'h10):(4'hd)] : (~(8'hab)))) : $unsigned($signed((wire152 ?
                               reg139 : wire159)))) : $signed(($signed((~&reg151)) ~^ ((~&wire141) ?
                           wire159 : (wire141 ? wire133 : reg136)))));
  assign wire161 = (!{$signed(reg138), {$unsigned(reg145)}});
endmodule

module module105
#(parameter param122 = {{({{(8'hb1)}, (^~(8'hb7))} ? (8'h9e) : ((~(8'hab)) ? (|(8'h9e)) : (+(7'h44))))}, (({{(8'ha3)}, ((8'hbb) ? (8'haa) : (8'hbe))} || {(~^(8'haa)), ((8'hb3) ? (8'h9c) : (8'hbb))}) + (^((!(8'haf)) << ((8'h9d) ^ (8'hb4)))))}, 
parameter param123 = (~&{((((7'h42) ? (8'hb0) : param122) ? (param122 * param122) : param122) ? ((param122 ? param122 : param122) ? {param122} : ((8'ha5) ~^ param122)) : ((8'ha9) ~^ (param122 >= param122))), (-(~^(param122 == param122)))}))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire109;
  input wire [(3'h5):(1'h0)] wire108;
  input wire signed [(2'h3):(1'h0)] wire107;
  input wire [(5'h15):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire110;
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  assign y = {wire121,
                 wire117,
                 wire116,
                 wire110,
                 reg120,
                 reg119,
                 reg118,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire110 = $unsigned(((wire109[(4'he):(4'h8)] || wire108[(2'h2):(1'h0)]) ?
                       $signed(((&wire108) ?
                           wire107[(1'h0):(1'h0)] : (wire108 >> wire107))) : wire107));
  always
    @(posedge clk) begin
      reg111 <= $unsigned((($signed(wire107) ?
              $signed((8'hbd)) : {(wire107 + (8'ha4)),
                  wire108[(1'h0):(1'h0)]}) ?
          $unsigned(({wire108,
              wire108} >>> $signed(wire107))) : (&wire107[(1'h1):(1'h0)])));
      reg112 <= ($signed($signed(wire110[(3'h5):(2'h2)])) + (wire107[(1'h1):(1'h1)] ^ (^wire109)));
      reg113 <= (~|(wire107 + $unsigned({wire108})));
      reg114 <= wire109;
      reg115 <= ($signed($unsigned(wire108)) * ($unsigned($signed($signed((8'hb4)))) ?
          reg114[(2'h2):(1'h1)] : $signed($signed($signed(wire107)))));
    end
  assign wire116 = ((8'had) ? $signed(reg112[(4'he):(2'h3)]) : (~&reg115));
  assign wire117 = $unsigned(wire107);
  always
    @(posedge clk) begin
      reg118 <= ({((-(~^wire116)) == $unsigned((wire107 << (8'h9c)))),
              reg111[(2'h3):(1'h1)]} ?
          wire110[(3'h6):(3'h6)] : (^wire107[(2'h3):(2'h2)]));
      reg119 <= ($signed(($signed((reg115 | (8'hbd))) >>> $unsigned(((8'hb6) ?
          wire117 : reg111)))) ^~ $signed(($signed((&(8'ha7))) < {(8'hb5),
          {wire108, reg115}})));
      reg120 <= ((reg113[(4'hc):(1'h1)] << $unsigned({(wire110 ?
                  wire106 : reg113),
              reg111})) ?
          ({$signed(wire117[(3'h4):(3'h4)])} * reg118) : $unsigned(($signed($unsigned(wire106)) ?
              reg111 : $unsigned(((8'hb0) > wire106)))));
    end
  assign wire121 = $signed({$signed($signed((^~reg112))),
                       $signed({(^reg118), (wire109 ? (8'hb9) : wire117)})});
endmodule

module module74
#(parameter param100 = {{{(((8'ha3) * (8'ha9)) + ((8'h9e) >>> (8'hb0)))}}}, 
parameter param101 = (((({param100, param100} ? {param100} : {param100, param100}) <= ((8'h9e) ? (param100 ? param100 : param100) : (!param100))) ~^ (param100 && (~&(^~param100)))) ? param100 : (~|(param100 ? ((param100 + param100) ? (param100 <= (8'haf)) : param100) : ({param100, (8'hb4)} ? (param100 ? param100 : param100) : (param100 * param100))))))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire79;
  input wire signed [(4'hd):(1'h0)] wire78;
  input wire signed [(3'h5):(1'h0)] wire77;
  input wire signed [(2'h3):(1'h0)] wire76;
  input wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire80 = {$signed((&wire77)), $signed({wire75[(2'h3):(1'h0)]})};
  assign wire81 = (-$signed($signed(((-wire80) ^~ wire79[(3'h5):(2'h2)]))));
  assign wire82 = (^~wire76);
  assign wire83 = wire80;
  assign wire84 = wire79[(3'h6):(2'h3)];
  assign wire85 = (~$signed($unsigned($signed(wire82))));
  assign wire86 = (|(wire75[(1'h0):(1'h0)] < (wire75 ?
                      (~wire79[(3'h7):(2'h3)]) : wire77[(1'h1):(1'h1)])));
  assign wire87 = wire83[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg88 <= $signed((8'had));
      reg89 <= reg88;
      reg90 <= (~^(wire79[(3'h7):(2'h2)] ? wire83 : (reg89 ^ wire83)));
    end
  assign wire91 = $signed((+$signed($unsigned(wire77))));
  assign wire92 = $signed(wire86);
  assign wire93 = (8'h9e);
  assign wire94 = $signed({$signed((^~wire86[(1'h0):(1'h0)])),
                      (wire91[(2'h2):(2'h2)] == $signed((~&(8'hbb))))});
  assign wire95 = $unsigned(wire92);
  assign wire96 = wire95[(3'h5):(3'h5)];
  assign wire97 = $signed($signed(wire86[(1'h0):(1'h0)]));
  assign wire98 = ((!$unsigned((~$signed((8'hba))))) ?
                      $signed(reg89[(1'h1):(1'h1)]) : (wire84 + wire87[(3'h5):(1'h1)]));
  assign wire99 = wire91;
endmodule
