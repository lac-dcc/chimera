module top
#(parameter param267 = (&(({((8'ha1) ? (8'hbe) : (8'ha5))} ? {((7'h44) <= (8'haf))} : (((8'ha5) - (8'h9f)) ? ((7'h41) <<< (8'h9c)) : (~&(8'ha4)))) ~^ (~&{((8'ha4) ? (7'h40) : (8'hb4))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire266;
  wire [(5'h15):(1'h0)] wire265;
  wire signed [(4'hb):(1'h0)] wire264;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire262;
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  assign y = {wire266,
                 wire265,
                 wire264,
                 wire42,
                 wire5,
                 wire44,
                 wire262,
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
                 reg18,
                 (1'h0)};
  assign wire5 = wire0[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      if (((wire5[(2'h2):(2'h2)] ?
              (($signed(wire1) ?
                  wire0[(2'h2):(1'h0)] : wire0[(1'h0):(1'h0)]) >> $signed(wire5[(4'ha):(3'h7)])) : (wire1[(4'h9):(3'h7)] * (|(wire2 ?
                  wire5 : (8'h9d))))) ?
          {$unsigned($signed((~^wire4))),
              $signed(wire3[(1'h1):(1'h1)])} : $signed((-wire0))))
        begin
          reg6 <= wire0;
          if (wire3[(5'h12):(4'he)])
            begin
              reg7 <= (!($signed(wire5[(3'h4):(1'h0)]) ?
                  (~^(((8'ha6) ~^ (7'h40)) != ((8'hb8) != wire5))) : ({(reg6 * (8'hbd))} ?
                      $unsigned((wire0 ? (8'ha2) : wire5)) : ((wire5 ^~ wire3) ?
                          reg6[(1'h1):(1'h0)] : $unsigned((8'ha6))))));
              reg8 <= wire0[(3'h4):(3'h4)];
              reg9 <= wire0[(2'h3):(1'h0)];
            end
          else
            begin
              reg7 <= $unsigned(((~^reg7[(3'h6):(1'h0)]) ?
                  (reg6[(4'h8):(3'h5)] ?
                      (&wire5[(3'h5):(3'h4)]) : $unsigned($unsigned(wire2))) : $unsigned((~$signed(wire5)))));
              reg8 <= $unsigned((-(reg6[(1'h0):(1'h0)] ?
                  ((~&(8'h9e)) - {wire3}) : (&reg6[(3'h7):(1'h0)]))));
              reg9 <= wire4[(4'h9):(3'h7)];
              reg10 <= ($signed((($unsigned(reg8) ?
                      (reg7 ? (8'hbc) : wire5) : (|wire2)) ?
                  ({wire0} ?
                      (wire1 ? wire2 : (8'ha9)) : {reg7,
                          reg7}) : $signed({reg9}))) | (wire2[(1'h0):(1'h0)] ?
                  (reg7[(2'h2):(2'h2)] ^ $signed(reg9)) : (({wire2, wire1} ?
                          (^~wire0) : wire1) ?
                      $signed((reg8 ? reg7 : wire4)) : ($unsigned((8'ha6)) ?
                          $unsigned(wire2) : (!reg9)))));
            end
          if (wire2[(2'h3):(2'h2)])
            begin
              reg11 <= (reg9 ?
                  (8'h9d) : ($signed(wire0) ?
                      $signed(((&reg8) | wire0[(2'h3):(2'h3)])) : $unsigned($signed($signed(wire0)))));
              reg12 <= wire2;
              reg13 <= $signed($unsigned($unsigned(reg11)));
            end
          else
            begin
              reg11 <= $signed($signed(wire0));
              reg12 <= $signed(reg9);
              reg13 <= $unsigned((($unsigned((reg13 ? wire2 : wire2)) ?
                      ($signed(wire0) >= wire1[(3'h4):(1'h0)]) : $unsigned(wire2)) ?
                  {wire4, reg9[(4'hd):(2'h2)]} : {{{wire2}},
                      (reg13[(3'h4):(2'h3)] ? wire2 : $unsigned(wire4))}));
            end
        end
      else
        begin
          reg6 <= (-(~|reg9[(4'h9):(3'h7)]));
          reg7 <= reg7;
          reg8 <= {$unsigned(reg12), (reg12 & (8'h9e))};
          reg9 <= (+(8'h9f));
        end
      if ({((wire3 ?
              wire1[(4'h8):(3'h4)] : ($signed((8'hbe)) <<< wire0)) == $unsigned((&reg6)))})
        begin
          reg14 <= reg9[(3'h7):(3'h7)];
          reg15 <= (8'hb4);
          reg16 <= reg6[(3'h6):(3'h5)];
        end
      else
        begin
          reg14 <= ((+$unsigned($signed($signed((8'ha9))))) - reg11[(3'h4):(1'h1)]);
          reg15 <= reg7[(3'h4):(2'h2)];
          reg16 <= wire4[(4'ha):(4'ha)];
          reg17 <= $signed((^~(^wire5)));
          reg18 <= reg6;
        end
    end
  module19 #() modinst43 (.wire22(wire0), .wire20(reg15), .clk(clk), .wire21(reg9), .y(wire42), .wire23(reg8));
  assign wire44 = (+$signed(($unsigned($unsigned(wire3)) >> wire3[(3'h7):(3'h4)])));
  module45 #() modinst263 (wire262, clk, wire42, wire1, reg13, reg18, wire5);
  assign wire264 = $unsigned((reg11[(2'h3):(1'h0)] == $signed((~^$unsigned(reg16)))));
  assign wire265 = $signed($signed(wire4));
  assign wire266 = {(^~$signed($signed({reg10}))), reg16[(4'h9):(4'h8)]};
endmodule

module module45  (y, clk, wire46, wire47, wire48, wire49, wire50);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire48;
  input wire signed [(4'hc):(1'h0)] wire49;
  input wire [(5'h11):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire245;
  wire [(3'h4):(1'h0)] wire244;
  wire signed [(3'h6):(1'h0)] wire243;
  wire [(3'h7):(1'h0)] wire242;
  wire signed [(5'h13):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire107;
  wire [(5'h13):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire240;
  reg [(5'h12):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg260 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg259 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg258 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg256 = (1'h0);
  reg [(5'h10):(1'h0)] reg255 = (1'h0);
  reg [(4'hd):(1'h0)] reg254 = (1'h0);
  reg [(4'hf):(1'h0)] reg253 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg251 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg250 = (1'h0);
  reg [(5'h14):(1'h0)] reg249 = (1'h0);
  reg [(5'h12):(1'h0)] reg248 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg246 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(3'h5):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg172 = (1'h0);
  assign y = {wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire188,
                 wire162,
                 wire160,
                 wire51,
                 wire107,
                 wire156,
                 wire240,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg158,
                 reg159,
                 reg161,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 (1'h0)};
  assign wire51 = (~wire48);
  module52 #() modinst108 (.wire53(wire51), .clk(clk), .y(wire107), .wire55(wire49), .wire56(wire46), .wire54(wire50));
  module109 #() modinst157 (.wire112(wire47), .wire114(wire49), .wire113(wire48), .wire110(wire51), .clk(clk), .wire111(wire50), .y(wire156));
  always
    @(posedge clk) begin
      reg158 <= {(($signed((^~wire107)) ?
              ({wire107} ?
                  wire49[(3'h6):(3'h6)] : wire156[(2'h2):(1'h1)]) : $unsigned($signed(wire51))) <= (^~{wire156[(5'h11):(3'h6)]}))};
      reg159 <= $signed($unsigned(wire47[(1'h1):(1'h0)]));
    end
  assign wire160 = $unsigned((wire48 ?
                       {wire48[(2'h2):(1'h1)],
                           wire48[(3'h4):(3'h4)]} : (7'h42)));
  always
    @(posedge clk) begin
      reg161 <= ((8'hac) || (($unsigned(((8'hb5) ?
              (8'h9c) : wire51)) >>> $unsigned((reg159 ? (8'ha1) : (8'hae)))) ?
          (wire51 * $signed((wire46 ?
              wire160 : wire46))) : $unsigned(($unsigned(reg158) >= $signed(reg159)))));
    end
  assign wire162 = (&((wire46[(3'h4):(2'h3)] - wire49[(3'h5):(1'h0)]) ?
                       (wire49[(3'h5):(2'h2)] ^~ (!$signed((8'hb2)))) : $unsigned(wire156)));
  always
    @(posedge clk) begin
      reg163 <= ((8'hae) <= ($signed((wire49[(2'h2):(1'h0)] ^~ wire156)) ?
          (({wire46} + (^wire48)) ?
              (~^wire107[(4'h8):(3'h7)]) : (^$unsigned(wire49))) : ($signed($signed((8'hb2))) ?
              (!$unsigned(wire49)) : wire47)));
      reg164 <= $unsigned(wire49);
    end
  always
    @(posedge clk) begin
      reg165 <= reg159;
      reg166 <= $unsigned(wire48[(1'h1):(1'h0)]);
      if ($signed(({$unsigned((-(8'h9c)))} ~^ ($unsigned((wire51 ?
          wire156 : wire48)) ^~ $signed(wire49[(4'hc):(3'h4)])))))
        begin
          reg167 <= reg159;
          reg168 <= ((~wire160[(1'h0):(1'h0)]) && (8'hb4));
          reg169 <= (reg166 ?
              reg165 : (wire50[(1'h0):(1'h0)] ?
                  (~&$unsigned($unsigned(reg165))) : reg166[(1'h1):(1'h0)]));
          reg170 <= (($unsigned((~&$signed(wire46))) ^~ $signed(($unsigned(reg168) ?
                  reg161 : $unsigned(reg161)))) ?
              (+wire162[(3'h6):(1'h1)]) : (~&$unsigned(((reg159 ?
                      reg163 : (8'hb6)) ?
                  (wire107 ? wire47 : wire48) : {reg159}))));
          reg171 <= (+$signed($signed($unsigned(((8'ha6) <= wire49)))));
        end
      else
        begin
          reg167 <= ($unsigned(reg165) ?
              {reg158} : $signed($signed($signed({(8'hb1), reg169}))));
          reg168 <= reg158[(2'h2):(2'h2)];
          reg169 <= ((wire162[(2'h3):(2'h3)] < ($unsigned($unsigned(wire49)) != reg163[(3'h5):(1'h0)])) ?
              (&(-(wire156[(3'h6):(1'h1)] ?
                  (reg168 <= (8'h9d)) : $signed(wire160)))) : wire156);
        end
      reg172 <= $unsigned(wire48);
    end
  module173 #() modinst189 (wire188, clk, wire162, reg159, reg170, reg167, reg163);
  module190 #() modinst241 (.wire192(reg159), .wire191(wire47), .y(wire240), .clk(clk), .wire193(wire162), .wire194(wire188));
  assign wire242 = (+(({reg163, reg161[(4'hb):(2'h2)]} ?
                           reg169[(4'hd):(4'h9)] : $unsigned($unsigned(reg172))) ?
                       $signed(reg159[(5'h11):(4'h8)]) : $signed(($unsigned(wire107) ^ (wire50 < wire46)))));
  assign wire243 = ($unsigned(reg161) ?
                       wire160[(1'h1):(1'h1)] : ((wire240[(3'h4):(2'h2)] ?
                           ((reg172 << wire160) ^ (^~reg169)) : {(|wire188),
                               reg172[(1'h1):(1'h1)]}) ~^ wire162[(2'h3):(2'h3)]));
  assign wire244 = ((~^wire243) ?
                       ((!reg163[(4'he):(4'h9)]) * $unsigned(wire51[(3'h5):(3'h4)])) : wire46);
  assign wire245 = wire46[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      if (wire107)
        begin
          reg246 <= reg163[(4'hc):(2'h3)];
          reg247 <= {reg169[(1'h0):(1'h0)],
              {(-$unsigned(wire156[(4'hb):(4'ha)]))}};
          reg248 <= (($signed(wire50) ?
                  ((~^(^wire51)) ?
                      $unsigned(wire162[(5'h11):(1'h1)]) : wire46) : $unsigned((reg172 != reg246[(2'h2):(2'h2)]))) ?
              reg171[(1'h0):(1'h0)] : $unsigned($unsigned(((|reg172) <<< (~|(8'hab))))));
          if (wire50[(3'h5):(2'h2)])
            begin
              reg249 <= (($signed($signed(wire48)) ?
                      reg171[(3'h6):(1'h0)] : (~|{wire188[(5'h13):(5'h13)],
                          $unsigned(wire160)})) ?
                  ($signed(reg172[(4'h8):(3'h6)]) ?
                      $signed((~(reg247 > reg161))) : (|(~^(wire50 != reg163)))) : (|(&(&reg164[(1'h1):(1'h0)]))));
              reg250 <= reg168[(2'h2):(1'h1)];
              reg251 <= ((~$unsigned(wire162[(5'h11):(2'h2)])) ^ (8'h9f));
            end
          else
            begin
              reg249 <= (reg161[(1'h0):(1'h0)] - ($signed($unsigned(wire48)) ?
                  wire242[(3'h4):(1'h0)] : (~^$unsigned($signed((8'hb1))))));
              reg250 <= {(&({(wire107 << reg172),
                          (reg247 ? wire156 : wire244)} ?
                      (wire51[(4'ha):(2'h2)] | wire243) : ($signed(wire243) >>> (!reg163)))),
                  ((8'had) ^ (-$signed((+wire188))))};
              reg251 <= ($unsigned($signed({(reg165 ? reg161 : (8'hab)),
                      reg168})) ?
                  $unsigned(reg163) : (-reg165[(2'h3):(1'h0)]));
              reg252 <= {$signed((|reg248[(5'h10):(4'h9)]))};
              reg253 <= (8'hbc);
            end
          reg254 <= $unsigned((wire50[(2'h3):(2'h2)] <= $signed(((+wire50) >= $unsigned(wire162)))));
        end
      else
        begin
          reg246 <= $unsigned($unsigned($unsigned(wire46[(2'h3):(1'h1)])));
          reg247 <= $signed($signed($signed(reg248)));
          reg248 <= $signed($unsigned((reg165[(1'h0):(1'h0)] ?
              $signed(wire188) : (~(reg165 ? reg166 : reg253)))));
        end
      reg255 <= $signed(($signed((8'ha8)) >= (wire245[(4'hb):(1'h1)] ?
          reg172[(4'h8):(1'h0)] : $unsigned(reg251[(3'h4):(2'h2)]))));
      reg256 <= ($signed((8'hbb)) ? wire243 : wire240[(4'hb):(4'ha)]);
      if (wire47[(1'h1):(1'h1)])
        begin
          reg257 <= (~^wire242[(2'h2):(1'h1)]);
          reg258 <= reg249[(3'h4):(1'h0)];
          reg259 <= ($signed(reg252[(4'h8):(3'h4)]) ^ (reg164 ?
              (|wire243[(3'h5):(2'h3)]) : (&$signed((wire46 ?
                  (8'ha2) : wire162)))));
          if ({reg164[(3'h5):(1'h0)],
              {wire156,
                  (((^~wire51) <= (reg169 ?
                      reg251 : reg169)) ^ ((^~reg172) <= $signed(reg255)))}})
            begin
              reg260 <= wire188;
              reg261 <= reg164;
            end
          else
            begin
              reg260 <= ($unsigned(reg258[(4'h9):(3'h7)]) < (~&$signed({reg251[(2'h3):(2'h3)],
                  ((8'hbe) + reg249)})));
              reg261 <= reg250[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg257 <= (({$unsigned(reg159[(4'he):(2'h3)])} ~^ $unsigned(((~|reg253) ?
              (reg255 ? reg259 : wire156) : (~&reg168)))) ^~ $signed(wire46));
        end
    end
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire24;
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire24,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = wire22[(4'h9):(1'h0)];
  always
    @(posedge clk) begin
      reg25 <= wire21;
      reg26 <= {(^~$unsigned(wire24[(3'h5):(3'h4)]))};
      if (((wire23[(4'h9):(4'h8)] ?
              wire20[(3'h5):(3'h5)] : $signed((~&wire23[(5'h13):(5'h11)]))) ?
          wire22 : ((8'hbe) + wire24)))
        begin
          reg27 <= $unsigned(($signed($signed((reg25 >= (8'had)))) ?
              wire22[(3'h5):(1'h0)] : ($unsigned((wire22 >= wire20)) ~^ {((7'h41) ?
                      (8'hbe) : wire21)})));
        end
      else
        begin
          reg27 <= ((($unsigned((~|wire23)) ?
                      wire23 : $unsigned(((8'hae) < reg26))) ?
                  wire22[(2'h3):(2'h2)] : (reg25[(3'h4):(2'h3)] ?
                      ({wire21, reg27} ?
                          (wire23 ?
                              (8'hb9) : (8'ha7)) : $signed(wire20)) : $unsigned(reg25))) ?
              wire20 : wire20[(3'h4):(2'h3)]);
          reg28 <= wire24;
          reg29 <= (wire20[(3'h6):(3'h4)] ?
              (&(&$unsigned($signed(reg25)))) : ({(!wire20[(4'hb):(3'h4)])} ?
                  (~&($unsigned(reg28) ?
                      {wire21} : reg26[(3'h4):(2'h2)])) : (~&$signed(reg25))));
          reg30 <= ($unsigned($unsigned(reg28)) >= $signed(wire20));
        end
      reg31 <= ((((~^$signed(wire23)) ? reg25 : wire24) + reg28) ?
          $unsigned(wire21[(2'h3):(2'h2)]) : reg30[(3'h7):(2'h2)]);
      reg32 <= ((|(!wire24[(1'h0):(1'h0)])) != {{reg27,
              $signed($signed(wire20))},
          ((~reg28) >= ((reg26 ? wire21 : wire22) ?
              (wire20 ? reg30 : wire22) : (wire22 | (8'ha8))))});
    end
  assign wire33 = (8'hb8);
  assign wire34 = ((wire21[(3'h7):(2'h2)] << $signed((8'ha3))) ?
                      wire21 : ((^~({wire22, reg29} ?
                          (|(8'hb9)) : reg29[(3'h5):(1'h1)])) || wire22[(4'ha):(4'h9)]));
  assign wire35 = (-{(((&reg32) << $unsigned(wire34)) == (((8'hbf) ?
                              (8'hb1) : (8'ha9)) ?
                          reg26 : (wire34 ~^ reg27))),
                      $unsigned((wire33[(3'h6):(3'h4)] != wire34))});
  assign wire36 = $unsigned($unsigned($signed($signed((&reg29)))));
  assign wire37 = $signed(((wire24 ?
                      (&(reg30 <= reg32)) : wire20[(3'h4):(2'h2)]) <= $signed(({reg29,
                      reg31} | {reg30, reg28}))));
  assign wire38 = {$unsigned($unsigned((8'haa))),
                      $unsigned(($unsigned(wire34) ?
                          (7'h40) : ((wire37 | (8'hac)) ?
                              (~^reg27) : ((8'haa) ? reg27 : reg31))))};
  assign wire39 = (($unsigned({$unsigned(reg28)}) ?
                      (|((reg32 >>> wire38) ?
                          {(8'hab),
                              wire34} : (+reg30))) : ((|reg31[(3'h7):(1'h0)]) ?
                          reg28[(2'h3):(1'h0)] : wire22)) > wire34);
  assign wire40 = {reg26[(2'h3):(2'h3)],
                      ($unsigned((+{reg30, wire22})) ?
                          $unsigned((~&$signed((8'hb3)))) : ($signed((|reg32)) ?
                              ($signed(wire20) ?
                                  (|reg28) : $unsigned(wire21)) : wire34[(2'h2):(1'h0)]))};
  assign wire41 = reg27;
endmodule

module module190
#(parameter param239 = ((~^(~&((8'ha4) <= ((7'h43) ? (8'ha8) : (8'h9e))))) ? ((8'hb1) ? (~&(((8'hae) < (8'h9e)) ~^ (~(8'hb0)))) : {({(8'ha5), (8'hbb)} ? (&(7'h40)) : (8'had))}) : (7'h41)))
(y, clk, wire194, wire193, wire192, wire191);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire194;
  input wire [(5'h10):(1'h0)] wire193;
  input wire signed [(2'h3):(1'h0)] wire192;
  input wire [(4'hc):(1'h0)] wire191;
  wire [(4'he):(1'h0)] wire238;
  wire signed [(5'h11):(1'h0)] wire237;
  wire [(5'h11):(1'h0)] wire236;
  wire [(3'h5):(1'h0)] wire227;
  wire [(5'h15):(1'h0)] wire226;
  wire [(5'h15):(1'h0)] wire206;
  wire [(4'hd):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire204;
  wire [(4'hb):(1'h0)] wire203;
  wire signed [(5'h11):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire201;
  wire signed [(2'h2):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire199;
  wire [(5'h10):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire197;
  wire signed [(3'h6):(1'h0)] wire196;
  wire signed [(5'h13):(1'h0)] wire195;
  reg [(5'h10):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg234 = (1'h0);
  reg [(4'hc):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg232 = (1'h0);
  reg [(4'he):(1'h0)] reg231 = (1'h0);
  reg [(3'h6):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg221 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg220 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg217 = (1'h0);
  reg [(5'h10):(1'h0)] reg216 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg215 = (1'h0);
  reg [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg213 = (1'h0);
  reg [(3'h5):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg207 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire227,
                 wire226,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 (1'h0)};
  assign wire195 = wire192[(1'h1):(1'h0)];
  assign wire196 = (wire191[(4'h9):(3'h7)] ?
                       {$unsigned((+(wire191 || wire193))),
                           (wire192 | $unsigned($signed(wire193)))} : (~&{$signed(wire195),
                           {$signed((8'hba))}}));
  assign wire197 = wire192[(1'h0):(1'h0)];
  assign wire198 = ($unsigned($unsigned($signed((8'had)))) ^~ {wire192[(1'h0):(1'h0)],
                       (((wire195 ? wire192 : wire192) ?
                               $unsigned(wire193) : $unsigned(wire193)) ?
                           (!(8'hb7)) : {(wire197 ? wire196 : wire195),
                               wire191})});
  assign wire199 = (8'h9e);
  assign wire200 = (|(8'hb7));
  assign wire201 = $signed((&wire191[(4'h9):(1'h0)]));
  assign wire202 = $signed((~|$signed($unsigned(wire200[(2'h2):(1'h1)]))));
  assign wire203 = $unsigned((+(&wire200)));
  assign wire204 = wire200;
  assign wire205 = $unsigned({((8'hb7) <= $unsigned((~wire198)))});
  assign wire206 = ((~&wire202) ?
                       (+$signed({(wire193 ? wire195 : (8'ha5)),
                           {wire193}})) : wire198[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg207 <= ($unsigned(wire196) & ($signed(wire200) >> $unsigned(wire192[(1'h1):(1'h0)])));
      reg208 <= ((wire199[(3'h5):(3'h4)] << $unsigned($unsigned($signed(wire201)))) ^~ (^~$signed(((wire201 || wire205) ?
          ((8'h9d) << wire204) : (~wire197)))));
      if (wire193)
        begin
          reg209 <= (~(^$unsigned(((reg208 ? wire195 : wire197) ?
              $unsigned(wire196) : ((8'hbb) ? (7'h40) : wire192)))));
          reg210 <= ($signed($signed({wire200})) ?
              $unsigned($signed($signed((8'hac)))) : wire196);
          reg211 <= (&reg208);
          if ((^((wire205 ?
              (&{wire192}) : ({reg208} ?
                  (!wire202) : $signed(wire199))) && (reg210 ?
              {$unsigned(wire192), (-wire200)} : $unsigned((-wire202))))))
            begin
              reg212 <= wire196[(2'h3):(2'h3)];
              reg213 <= (wire192[(2'h3):(2'h3)] ?
                  (~&$unsigned(reg212[(2'h2):(1'h0)])) : ({$signed((wire199 || wire204))} | (|$unsigned($unsigned(wire198)))));
              reg214 <= $signed($signed($unsigned($signed(((8'hb7) ?
                  reg207 : wire192)))));
              reg215 <= ({(((reg208 ? wire198 : reg214) ~^ (wire204 ?
                          wire196 : wire191)) << ($signed(wire202) - $signed(wire206)))} ?
                  $unsigned((8'haf)) : $signed(((|$unsigned(wire200)) ?
                      wire199 : reg209[(2'h2):(2'h2)])));
            end
          else
            begin
              reg212 <= reg211[(4'h8):(2'h3)];
              reg213 <= {reg215[(1'h1):(1'h1)],
                  ((-$unsigned(wire199[(5'h11):(2'h2)])) & wire206[(4'ha):(3'h7)])};
              reg214 <= (-(reg215 <<< (((wire193 ?
                  wire205 : wire203) ~^ {wire197}) != {$signed(wire204),
                  reg212[(2'h3):(1'h1)]})));
              reg215 <= ({{{$signed((8'h9e))}, reg209}} ?
                  $signed((~^($signed(reg215) && $unsigned(wire192)))) : (~{(wire200 ?
                          ((8'h9d) < reg215) : $unsigned(reg215))}));
            end
          reg216 <= ((~|wire194) + ($signed($unsigned({wire205})) ?
              ((~&reg208[(5'h10):(4'hf)]) | $signed($unsigned(reg212))) : $signed($unsigned(wire205))));
        end
      else
        begin
          reg209 <= reg215[(2'h3):(2'h3)];
        end
      reg217 <= wire199;
      if ($signed({wire196[(3'h5):(1'h1)], wire204}))
        begin
          reg218 <= wire201;
          if ((reg218 ^ ($signed((wire201[(4'hd):(1'h1)] <= (~&wire195))) <<< (~|{$unsigned(wire194)}))))
            begin
              reg219 <= $unsigned((wire205 ?
                  $signed(((8'h9d) == ((8'hb5) ?
                      (8'h9d) : (8'ha1)))) : (wire204[(2'h2):(1'h0)] ?
                      $signed(reg210[(1'h1):(1'h1)]) : (reg209[(1'h1):(1'h0)] + $unsigned(wire206)))));
              reg220 <= (-(^~(8'h9f)));
              reg221 <= (8'hb4);
            end
          else
            begin
              reg219 <= ($unsigned(wire206) - wire199[(2'h2):(1'h0)]);
              reg220 <= ($unsigned(({reg212[(3'h4):(1'h1)]} && (~|(8'hb0)))) ?
                  ((($signed((8'hb9)) < (reg208 < (8'ha1))) >= ($signed(wire200) ^ (reg221 == (8'ha3)))) + ((+(wire196 ?
                      reg211 : reg214)) ^~ reg211[(4'h9):(3'h5)])) : ({wire191[(1'h1):(1'h1)]} ?
                      (((wire206 && (8'haa)) || $unsigned(wire201)) * ((&wire194) ?
                          (wire195 <<< reg221) : {reg210, wire199})) : reg211));
              reg221 <= $unsigned(wire205[(3'h5):(2'h3)]);
              reg222 <= $unsigned($signed(wire199[(1'h0):(1'h0)]));
            end
          reg223 <= (|wire197[(3'h5):(1'h1)]);
          reg224 <= ($unsigned((|reg207)) | wire198);
          reg225 <= (wire196 ?
              {$unsigned(($unsigned((8'ha0)) ?
                      wire198[(1'h0):(1'h0)] : wire195))} : (~{((wire205 && wire200) & {reg224,
                      (8'hae)}),
                  reg212}));
        end
      else
        begin
          reg218 <= $signed($unsigned(($unsigned($unsigned(reg224)) ?
              ($unsigned(wire193) ?
                  (wire191 * (8'hb7)) : reg222[(1'h0):(1'h0)]) : $unsigned(((8'hbb) ?
                  wire196 : wire192)))));
        end
    end
  assign wire226 = (wire191[(3'h6):(1'h0)] ?
                       reg223 : $signed(reg207[(2'h3):(1'h0)]));
  assign wire227 = reg220[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg228 <= wire227;
      reg229 <= (~|$signed({$unsigned(((8'hb5) ? reg221 : (8'ha6))),
          ((~reg214) ? (wire193 ? reg223 : (7'h41)) : wire191)}));
      reg230 <= $unsigned((-$signed(((wire196 ~^ reg220) ^ (8'hba)))));
      if (((($unsigned($unsigned(reg221)) << ({reg213} >> $unsigned((8'hb4)))) ?
              wire203[(3'h5):(1'h1)] : (|$signed($unsigned(wire195)))) ?
          ((8'hb3) || $signed((+(reg218 & wire226)))) : wire196))
        begin
          reg231 <= ($signed((8'h9f)) || ($signed(reg220[(2'h2):(2'h2)]) ^ {$unsigned((reg218 ?
                  reg219 : wire206)),
              $signed($signed(reg207))}));
        end
      else
        begin
          reg231 <= (^$unsigned(wire199[(1'h1):(1'h1)]));
          reg232 <= wire198[(1'h1):(1'h1)];
          reg233 <= (wire192 ^~ reg231[(1'h1):(1'h0)]);
          reg234 <= (reg215 > (~$signed(reg221[(3'h4):(2'h2)])));
          reg235 <= ($signed(wire205[(2'h2):(1'h1)]) ?
              ($unsigned((-$unsigned(reg228))) > (reg215[(1'h1):(1'h0)] >= ($unsigned(reg220) <<< ((8'h9d) ?
                  (8'hb8) : reg222)))) : (wire192[(1'h0):(1'h0)] <= $signed($unsigned((!reg217)))));
        end
    end
  assign wire236 = {reg233[(4'hc):(2'h3)],
                       $signed(((-{reg210}) ?
                           (~$signed(wire203)) : (((8'ha5) ?
                               reg231 : reg229) <= (reg230 ?
                               reg212 : reg219))))};
  assign wire237 = wire199[(2'h2):(2'h2)];
  assign wire238 = (((wire200[(1'h1):(1'h1)] ?
                       $signed({reg207}) : ({reg212, reg221} ?
                           (wire204 ?
                               wire201 : wire202) : reg232[(3'h6):(2'h2)])) && wire198) < (wire195[(4'hf):(3'h5)] ?
                       $unsigned((reg210[(2'h2):(1'h0)] ?
                           (~^wire194) : $unsigned(reg223))) : $unsigned((!$signed((8'hb0))))));
endmodule

module module173
#(parameter param187 = ({{(((8'hbb) ? (8'hb7) : (8'hb8)) ~^ (^(8'hb7)))}, ((~|((8'haf) << (8'ha2))) ? (&(&(8'hb9))) : {((8'h9d) ? (7'h42) : (8'h9d))})} >>> ((~^(+((8'hbb) ? (8'hbb) : (8'ha6)))) <= (^~((8'haf) + (|(7'h41)))))))
(y, clk, wire178, wire177, wire176, wire175, wire174);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire178;
  input wire [(5'h13):(1'h0)] wire177;
  input wire signed [(4'hd):(1'h0)] wire176;
  input wire [(3'h4):(1'h0)] wire175;
  input wire signed [(5'h12):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire185;
  wire signed [(4'h9):(1'h0)] wire184;
  wire [(3'h7):(1'h0)] wire183;
  wire signed [(4'ha):(1'h0)] wire182;
  wire [(4'h9):(1'h0)] wire181;
  wire [(4'hf):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 (1'h0)};
  assign wire179 = ({$unsigned($signed({wire177})),
                       {(wire174[(4'hc):(4'h8)] >> (wire174 != (8'h9e))),
                           ((&wire175) - ((7'h44) ?
                               wire176 : wire177))}} | $unsigned((^~(~^wire174))));
  assign wire180 = (wire178 ?
                       $unsigned({($unsigned(wire178) && wire176)}) : {wire176,
                           wire177});
  assign wire181 = wire180[(4'h9):(3'h7)];
  assign wire182 = wire175[(2'h3):(2'h3)];
  assign wire183 = $signed((($unsigned({wire174, wire178}) ?
                           (wire175 ~^ (wire174 >= wire177)) : $unsigned(wire174[(3'h6):(2'h2)])) ?
                       (+wire182[(1'h0):(1'h0)]) : (8'haa)));
  assign wire184 = wire179[(4'hc):(1'h0)];
  assign wire185 = ({(^~$signed($signed(wire175)))} ?
                       $unsigned(((8'hae) ?
                           wire179 : (!{wire181,
                               wire178}))) : wire174[(4'h8):(3'h7)]);
  assign wire186 = $signed((8'ha2));
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire114;
  input wire signed [(4'ha):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  input wire [(5'h11):(1'h0)] wire111;
  input wire [(4'ha):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire153;
  wire [(5'h15):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(5'h10):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(5'h13):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire [(3'h5):(1'h0)] wire124;
  wire [(4'ha):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(5'h12):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg137 = (1'h0);
  reg [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
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
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire115 = $signed({$signed($signed(wire113[(1'h1):(1'h0)])),
                       {($unsigned(wire113) ?
                               {wire111, wire114} : ((8'haf) <= wire111))}});
  assign wire116 = ({($unsigned(wire113) >= (((8'ha1) + wire113) >> $unsigned(wire112))),
                           ($unsigned(wire112[(2'h2):(1'h1)]) ?
                               (~|wire112) : $unsigned($signed(wire113)))} ?
                       (($signed($unsigned((8'ha1))) ?
                           (-(~&(8'h9e))) : (wire114 ?
                               $signed(wire110) : $unsigned(wire113))) >= (~^(wire113[(3'h4):(1'h0)] != (wire114 ?
                           wire115 : wire112)))) : wire111[(4'h8):(2'h2)]);
  assign wire117 = ((^($unsigned($unsigned(wire112)) ?
                           $signed(wire110[(4'h8):(2'h3)]) : $signed((wire113 & wire110)))) ?
                       $unsigned((~&((~&wire115) || (wire113 ?
                           (8'hb8) : wire116)))) : $unsigned($unsigned($unsigned(wire111[(4'h8):(3'h7)]))));
  assign wire118 = wire112[(2'h2):(2'h2)];
  assign wire119 = $unsigned(($signed(wire117) == $signed(wire115)));
  assign wire120 = ((~|(((~|wire113) != wire114) + (~^{(8'ha1)}))) ?
                       $signed({wire117[(1'h1):(1'h1)]}) : ((&{(wire119 >>> wire119)}) << ({(8'hb9),
                               (-wire118)} ?
                           ($signed(wire114) ?
                               wire112 : wire111[(2'h2):(1'h0)]) : (~|$unsigned((8'ha1))))));
  assign wire121 = (~{(8'hb8)});
  assign wire122 = wire113;
  assign wire123 = (~^wire115);
  assign wire124 = (wire115[(2'h2):(2'h2)] ?
                       wire112[(2'h2):(1'h1)] : wire118[(3'h6):(2'h2)]);
  assign wire125 = {wire110[(2'h2):(1'h0)]};
  assign wire126 = wire114[(2'h3):(2'h3)];
  assign wire127 = $signed(($signed((8'hba)) | $signed(wire120)));
  assign wire128 = $unsigned($unsigned(wire117[(1'h0):(1'h0)]));
  assign wire129 = wire118[(3'h5):(3'h4)];
  assign wire130 = wire114[(3'h4):(2'h3)];
  assign wire131 = (~&((~|wire116[(2'h3):(1'h0)]) ?
                       $signed(($signed(wire125) > $signed((8'hb9)))) : (wire113 >= $signed((7'h41)))));
  always
    @(posedge clk) begin
      reg132 <= wire123;
      if ((((|reg132) >= (^wire113[(4'h8):(1'h0)])) ?
          wire118 : ((wire126[(4'hb):(1'h1)] ?
                  wire118 : ({wire110} && wire129[(2'h2):(2'h2)])) ?
              $signed({(^~wire127), $unsigned(wire125)}) : {$signed({wire115,
                      reg132}),
                  ((-wire120) || ((8'hb4) ? wire124 : wire114))})))
        begin
          reg133 <= (+wire117[(2'h3):(2'h3)]);
          reg134 <= $unsigned({wire122[(3'h7):(3'h6)],
              (wire125[(1'h0):(1'h0)] ?
                  (&$signed(wire123)) : (^wire130[(3'h4):(2'h2)]))});
          reg135 <= (-$signed((^~(-((8'ha8) ? wire127 : wire114)))));
          reg136 <= (~((+reg135) - {(|$signed(wire115)),
              $signed((wire115 ^ wire111))}));
        end
      else
        begin
          reg133 <= (((^$unsigned(wire127[(4'hf):(1'h0)])) ?
              (~$unsigned((wire121 - (8'ha0)))) : ($signed($signed(wire126)) ?
                  ($signed(wire129) + wire115[(3'h6):(1'h1)]) : wire127)) || $unsigned((+$unsigned(wire120[(4'he):(3'h6)]))));
          reg134 <= ({wire128} >> ({$signed((wire127 == wire131)),
              wire130} != $unsigned($signed($signed(wire117)))));
          reg135 <= (((^~wire120) ?
                  wire121[(2'h2):(1'h1)] : $unsigned(($unsigned((8'ha5)) ?
                      (wire115 ? wire122 : wire127) : $unsigned((8'ha3))))) ?
              $unsigned($unsigned(reg134)) : reg135);
        end
      reg137 <= (+((({wire114,
              reg133} + wire115[(3'h4):(1'h0)]) > {(wire122 << wire121),
              wire123}) ?
          (wire117[(1'h0):(1'h0)] ^ (!(+wire121))) : (8'hac)));
      reg138 <= {($signed(wire114[(4'h8):(4'h8)]) || (^~$signed(wire115)))};
    end
  always
    @(posedge clk) begin
      reg139 <= (^reg132[(3'h6):(3'h5)]);
      reg140 <= (~^$unsigned((~|$unsigned($signed(wire122)))));
      reg141 <= $unsigned($unsigned({(-(-reg136)), (-wire121)}));
      if ((8'hbe))
        begin
          reg142 <= reg138;
          if (wire110[(3'h7):(2'h2)])
            begin
              reg143 <= wire122;
              reg144 <= (wire110 <<< $unsigned((^~$unsigned(wire117[(4'ha):(3'h5)]))));
              reg145 <= (reg140[(3'h7):(3'h5)] ?
                  ((~^wire116[(1'h1):(1'h0)]) << (!(~^(!(8'ha0))))) : ($signed(wire115) & wire126));
              reg146 <= {(-(-(!(wire112 ~^ wire121)))), reg137};
            end
          else
            begin
              reg143 <= $signed($signed($unsigned(($signed((8'ha9)) ?
                  (reg134 <<< wire124) : $signed(reg146)))));
              reg144 <= (($signed((wire121 ?
                      $unsigned(reg138) : wire117)) + reg145[(1'h0):(1'h0)]) ?
                  $unsigned({((wire113 >> reg141) ?
                          {reg146, reg136} : wire115[(3'h4):(2'h3)]),
                      (reg134 ?
                          reg144 : wire113)}) : (((^wire115) << reg136) == ($unsigned((reg133 & wire112)) - $unsigned((!reg139)))));
              reg145 <= (((~|(!(reg141 < reg138))) < reg137) ?
                  (($unsigned($unsigned(wire114)) <<< (wire112[(3'h4):(1'h1)] ?
                          (reg139 >> wire110) : (~&(8'h9c)))) ?
                      wire114 : wire110) : ((reg139[(4'hd):(4'hd)] >= reg145[(1'h1):(1'h1)]) ^ ($unsigned(((8'hb2) ?
                          reg142 : reg139)) ?
                      $signed((8'ha4)) : $unsigned((reg136 ?
                          reg134 : (8'hbb))))));
              reg146 <= {(8'hb4), reg132};
              reg147 <= ($unsigned(wire131[(3'h4):(2'h3)]) ?
                  $signed({(&((8'hbe) + wire116)),
                      $unsigned($unsigned(reg137))}) : reg136);
            end
          if ($unsigned((~|wire119)))
            begin
              reg148 <= wire111[(3'h7):(1'h1)];
              reg149 <= ({(reg142 || $unsigned($signed(wire125)))} ?
                  ({{(wire112 ? reg141 : wire110), $unsigned(wire127)},
                          (~&(~wire111))} ?
                      ($signed((+reg145)) ?
                          ((^~reg144) >= (~|wire128)) : reg147[(5'h11):(3'h7)]) : (wire122[(4'hb):(1'h1)] ?
                          $signed((~|reg148)) : $unsigned((wire114 ?
                              wire114 : (7'h40))))) : (((^wire118[(3'h5):(3'h5)]) ?
                          (^reg142[(4'hc):(4'hc)]) : (!wire121)) ?
                      reg138[(3'h7):(3'h5)] : ($unsigned($unsigned(reg139)) ?
                          $signed((~|(8'hb8))) : (reg137 ^~ (~wire117)))));
              reg150 <= $unsigned($signed((reg143[(4'ha):(3'h7)] << reg147[(5'h12):(3'h6)])));
              reg151 <= wire116[(1'h0):(1'h0)];
            end
          else
            begin
              reg148 <= wire125;
              reg149 <= (|{wire129});
              reg150 <= $unsigned(reg136[(3'h5):(2'h3)]);
              reg151 <= $unsigned((wire117 || (^((reg134 + reg135) ?
                  (reg144 << reg146) : $signed(wire130)))));
            end
        end
      else
        begin
          reg142 <= $unsigned(reg147);
          if (((wire111[(5'h11):(2'h2)] ?
              (8'ha5) : {$unsigned(wire115),
                  {(reg135 != wire122),
                      wire116[(3'h4):(1'h0)]}}) != $unsigned({($signed(wire124) >>> $unsigned(wire121))})))
            begin
              reg143 <= wire130;
              reg144 <= ($signed($signed(($unsigned(wire114) ?
                      (8'hbf) : reg149))) ?
                  $signed(reg151[(4'hb):(3'h4)]) : $unsigned((^wire125)));
              reg145 <= ($signed($signed($signed(reg138))) ?
                  $signed($signed((8'hbd))) : reg143);
            end
          else
            begin
              reg143 <= ({$signed((^((8'hb5) ? wire119 : reg145))),
                      (((reg148 ? (8'h9d) : reg142) ? {wire111} : wire113) ?
                          (~|(reg147 ? reg150 : reg149)) : reg145)} ?
                  (~^$unsigned((&((8'hae) < (8'ha7))))) : {(-$signed(((8'ha2) ?
                          reg151 : wire128)))});
              reg144 <= (!wire110[(1'h0):(1'h0)]);
              reg145 <= $unsigned(($signed((^~(reg134 ? wire119 : (8'hb8)))) ?
                  $signed(((reg149 ?
                      reg135 : wire125) <= $signed(reg142))) : reg133[(3'h4):(3'h4)]));
              reg146 <= ((wire115 & $signed(reg144[(3'h5):(1'h1)])) & wire125);
              reg147 <= (~^{{$signed((reg146 != reg147))}});
            end
        end
    end
  assign wire152 = wire126;
  assign wire153 = ({$unsigned((-$signed(reg148)))} && (reg137[(3'h7):(1'h1)] <= ($signed((reg146 ?
                           wire126 : wire111)) ?
                       (&((8'hbe) || (8'hb2))) : (~^(wire120 ?
                           (8'h9e) : wire115)))));
  assign wire154 = (^~reg139[(4'h9):(1'h0)]);
  assign wire155 = $unsigned((((~^(~wire116)) ?
                       wire116[(1'h1):(1'h0)] : ((wire128 == (8'haf)) << $unsigned(reg146))) * ((~|wire153[(3'h6):(1'h1)]) ?
                       {(reg133 * reg138)} : ((+wire121) ?
                           reg141[(3'h6):(3'h5)] : (|wire119)))));
endmodule

module module52
#(parameter param105 = ((((^(&(8'ha1))) ? (((8'h9f) ? (8'h9d) : (8'ha2)) ? ((7'h40) >= (8'hac)) : {(8'ha6)}) : (((8'hb3) < (8'hb9)) <= {(8'hac), (8'hab)})) & ((((8'ha2) > (8'hab)) ? (8'hbb) : (^~(8'h9d))) && ((8'hb3) ? ((8'hb9) - (8'ha6)) : ((7'h41) ? (8'had) : (8'haa))))) >>> {{(((8'ha6) ~^ (8'hab)) ? ((8'hbb) - (8'had)) : (~|(8'hb3)))}}), 
parameter param106 = (~|(~param105)))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire56;
  input wire signed [(2'h2):(1'h0)] wire55;
  input wire [(2'h2):(1'h0)] wire54;
  input wire [(3'h5):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire57;
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire60,
                 wire59,
                 wire57,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
                 reg75,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg58,
                 (1'h0)};
  assign wire57 = wire56[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg58 <= ($unsigned({$signed(((7'h42) ? (8'ha5) : wire57)),
              (^~{wire55})}) ?
          wire57[(4'ha):(1'h0)] : wire55);
    end
  assign wire59 = (((reg58[(2'h2):(2'h2)] ?
                              $signed({(8'hb3),
                                  reg58}) : wire54[(2'h2):(1'h1)]) ?
                          (wire56 ?
                              ((wire54 >>> wire53) ?
                                  (wire56 ? wire55 : wire54) : ((8'h9c) ?
                                      wire57 : wire55)) : (wire54 & $signed(wire56))) : wire54[(1'h0):(1'h0)]) ?
                      wire54[(1'h0):(1'h0)] : wire56);
  assign wire60 = reg58;
  always
    @(posedge clk) begin
      reg61 <= $unsigned(wire55);
    end
  always
    @(posedge clk) begin
      reg62 <= {((reg61[(4'hb):(3'h7)] ?
                  wire60[(1'h1):(1'h0)] : ((&wire60) ?
                      $unsigned(wire54) : (reg61 > wire56))) ?
              $unsigned($unsigned((&wire60))) : ((8'ha6) ?
                  $signed($signed(wire54)) : (reg58 < {wire60}))),
          ($unsigned(wire55) ?
              $signed($signed({wire56,
                  wire53})) : $unsigned(({(8'ha9)} * $signed(wire57))))};
      reg63 <= (^(reg62 != ($unsigned(wire55) ?
          $signed($unsigned((8'hb3))) : $signed($signed(wire53)))));
      reg64 <= (wire59 ?
          (({$unsigned(reg58)} ?
                  wire57[(2'h3):(1'h1)] : reg58[(5'h10):(5'h10)]) ?
              $signed($unsigned((reg63 != wire54))) : {wire59,
                  reg62}) : wire54);
      reg65 <= $unsigned($unsigned($signed($unsigned(reg63))));
    end
  assign wire66 = reg58[(4'hd):(2'h2)];
  assign wire67 = (-(!$signed((-reg61))));
  assign wire68 = reg61[(3'h6):(3'h6)];
  assign wire69 = wire55;
  assign wire70 = ((wire57[(3'h4):(1'h0)] ?
                      reg65[(2'h3):(1'h1)] : $signed($signed(reg58))) - $unsigned(({{wire53},
                      reg65[(1'h0):(1'h0)]} && (~reg65[(2'h3):(1'h0)]))));
  assign wire71 = (((~&$unsigned($signed(reg63))) * reg64) >> $signed(($unsigned((~wire56)) >>> reg63[(4'h8):(3'h7)])));
  assign wire72 = (~&wire55[(2'h2):(2'h2)]);
  assign wire73 = (wire69 ?
                      (+($unsigned($unsigned(wire56)) | (~^(reg58 ~^ wire66)))) : $signed((($signed(wire55) >>> (&wire60)) || ((8'hb3) ?
                          wire68 : (wire55 ? reg61 : wire67)))));
  assign wire74 = ((~^$signed({reg58[(5'h10):(3'h5)]})) ?
                      $signed((~|(7'h44))) : (|{$signed((wire59 ?
                              reg62 : (8'hbf)))}));
  always
    @(posedge clk) begin
      reg75 <= (reg63 ?
          $signed(($unsigned(wire55) + $signed((wire68 ?
              (8'hae) : reg64)))) : $signed((wire73[(4'he):(3'h7)] | ((|wire73) | $unsigned((8'ha7))))));
    end
  assign wire76 = (($signed(wire66[(2'h2):(2'h2)]) & $unsigned($signed($unsigned(reg75)))) ?
                      (-($unsigned((-reg63)) - (~|(wire57 ?
                          wire68 : wire70)))) : reg64[(5'h13):(5'h13)]);
  assign wire77 = $signed($signed((|$unsigned(reg65))));
  always
    @(posedge clk) begin
      if (wire76)
        begin
          reg78 <= wire74[(3'h6):(3'h4)];
          reg79 <= $unsigned((wire59[(2'h3):(1'h1)] ?
              $unsigned(($signed(wire71) > (wire56 ?
                  (8'hb9) : reg62))) : (wire54[(2'h2):(1'h1)] ?
                  $unsigned(reg78[(1'h1):(1'h1)]) : (&{wire69}))));
          reg80 <= (wire72[(5'h14):(5'h13)] ?
              ($signed(wire66) ?
                  wire57 : $signed(($signed((8'hb8)) ?
                      $signed(reg63) : $signed(reg78)))) : (($unsigned((wire71 && wire67)) ?
                      ((~wire68) != reg65[(2'h2):(2'h2)]) : $unsigned(wire60[(2'h3):(2'h3)])) ?
                  wire59[(1'h0):(1'h0)] : (8'hb2)));
          if ((~((reg78 >> (^(reg58 ? reg62 : (8'ha5)))) ?
              ($unsigned(((8'hb7) && reg64)) ?
                  ($signed(reg58) <= (reg63 ?
                      reg80 : reg79)) : $unsigned($unsigned((8'hba)))) : (&({(8'ha2),
                      wire66} ?
                  {wire71, wire54} : $unsigned(wire67))))))
            begin
              reg81 <= (wire66[(3'h7):(3'h4)] ?
                  $signed((~&wire69[(3'h4):(2'h2)])) : $unsigned($signed($unsigned(wire77))));
            end
          else
            begin
              reg81 <= $signed((reg65 ?
                  (reg75 >= reg61[(4'hb):(3'h6)]) : $signed({reg81[(3'h5):(3'h4)]})));
              reg82 <= $signed((!$signed((!(wire77 & wire71)))));
              reg83 <= reg80;
            end
        end
      else
        begin
          if (($signed(($signed($signed(wire60)) ?
              (~&(reg62 ?
                  reg63 : wire57)) : $signed(reg82[(3'h6):(3'h6)]))) | $unsigned(($signed(reg65) ?
              (reg82[(3'h4):(1'h1)] - {wire71, reg61}) : wire56))))
            begin
              reg78 <= wire76;
              reg79 <= (7'h41);
              reg80 <= (wire60[(3'h6):(2'h3)] ?
                  {reg79} : $signed(($signed(wire76[(1'h0):(1'h0)]) ?
                      reg79[(3'h6):(2'h2)] : ((wire66 <<< (8'hba)) ?
                          $unsigned(reg62) : ((8'ha1) * reg75)))));
              reg81 <= reg83;
              reg82 <= (~|(~|(wire66 && (^~{wire68}))));
            end
          else
            begin
              reg78 <= {(reg75 ?
                      $unsigned($unsigned((~wire71))) : reg78[(3'h5):(1'h1)]),
                  (($unsigned((!wire67)) <<< (~^(reg78 ? wire70 : wire67))) ?
                      {reg64} : {$signed($unsigned((8'ha1))),
                          reg65[(3'h4):(2'h3)]})};
              reg79 <= (wire56[(2'h3):(1'h1)] ?
                  (&({$signed(reg62),
                      wire53[(1'h0):(1'h0)]} < (+wire66[(1'h0):(1'h0)]))) : wire72);
            end
          reg83 <= (~^(^((&wire56[(3'h7):(3'h6)]) ?
              $unsigned($signed(wire72)) : ((~^(8'hbd)) << reg61))));
          reg84 <= (8'hb4);
          reg85 <= $signed(reg64);
        end
      reg86 <= $signed($unsigned(wire57[(4'hf):(4'hd)]));
      if ($unsigned(reg83))
        begin
          reg87 <= (+(reg79[(2'h2):(2'h2)] ? wire59 : reg63[(4'h9):(2'h2)]));
          reg88 <= ((8'hbe) && reg87[(5'h10):(4'h9)]);
          if ($unsigned(wire68[(3'h4):(2'h2)]))
            begin
              reg89 <= ((8'ha5) ?
                  ((wire72 * $signed(reg88[(3'h5):(3'h5)])) ?
                      $unsigned($unsigned($unsigned(reg80))) : reg65[(2'h2):(1'h1)]) : {($unsigned(reg79) ?
                          ({reg64, reg58} >>> (^~reg82)) : $unsigned(wire69))});
              reg90 <= wire55;
              reg91 <= (+$signed($unsigned((wire72 ?
                  $signed(reg80) : reg83[(3'h5):(1'h1)]))));
            end
          else
            begin
              reg89 <= reg87[(4'ha):(3'h5)];
            end
        end
      else
        begin
          if ($signed({(($unsigned(reg88) == (wire57 & reg62)) ?
                  wire74 : $unsigned($signed(reg81)))}))
            begin
              reg87 <= ($signed((+({wire74, reg80} ?
                  wire55[(1'h1):(1'h1)] : (~wire73)))) ^~ $signed(((~(wire60 >>> reg75)) ?
                  $unsigned($unsigned(reg88)) : wire66[(3'h6):(1'h1)])));
              reg88 <= (reg88[(4'h8):(4'h8)] | ($unsigned((~^$signed(reg65))) & (-$unsigned(wire60))));
              reg89 <= $unsigned(reg84);
              reg90 <= wire59;
            end
          else
            begin
              reg87 <= wire56[(3'h5):(3'h4)];
              reg88 <= $signed((((^~$unsigned(wire72)) ?
                  (~&(!wire73)) : (&wire55[(2'h2):(1'h0)])) ^ $unsigned(reg85[(4'ha):(3'h6)])));
              reg89 <= (!$unsigned($unsigned(($unsigned(wire59) ?
                  (wire54 ? (8'hb1) : wire54) : reg58))));
            end
          reg91 <= $signed($signed(({(reg80 == reg90)} ?
              ((wire77 == wire59) ~^ ((8'ha3) & (8'haa))) : (&(reg61 ^~ wire60)))));
          if (reg86[(1'h0):(1'h0)])
            begin
              reg92 <= reg87[(5'h12):(5'h10)];
            end
          else
            begin
              reg92 <= $signed((^{$unsigned((~|(8'ha4)))}));
            end
          reg93 <= reg91;
        end
    end
  always
    @(posedge clk) begin
      reg94 <= wire77;
      reg95 <= {($unsigned((^~$unsigned(wire71))) ^ $unsigned(((7'h41) ?
              $signed(reg91) : wire55))),
          $unsigned(wire74[(4'h8):(1'h0)])};
      if ({$unsigned({($signed(wire55) ? (~|wire74) : reg75),
              reg83[(4'hd):(1'h0)]})})
        begin
          reg96 <= $signed($signed(reg62));
          if ({reg61[(2'h2):(1'h1)], reg92})
            begin
              reg97 <= (+$unsigned(({{reg83}} ~^ reg84)));
              reg98 <= $unsigned($signed({{$signed((8'hb7)), (&wire55)},
                  (reg82[(2'h3):(2'h3)] ? wire74[(2'h2):(1'h0)] : reg88)}));
            end
          else
            begin
              reg97 <= $unsigned((wire68[(5'h12):(4'h9)] && reg64));
              reg98 <= {(~|$unsigned((wire69 + (reg79 ? (8'hba) : reg63))))};
              reg99 <= $unsigned(($unsigned($signed((reg75 ?
                  reg98 : wire77))) || (~(reg64 | wire68))));
              reg100 <= $unsigned((reg63[(4'hb):(1'h1)] ?
                  $unsigned(($unsigned(wire54) ^ (~^(8'hbe)))) : $unsigned((&((8'ha6) ?
                      reg91 : wire77)))));
              reg101 <= (|reg80[(5'h13):(3'h4)]);
            end
        end
      else
        begin
          reg96 <= (8'ha9);
          if ($unsigned(($unsigned(wire74[(1'h0):(1'h0)]) ?
              reg79[(2'h2):(1'h1)] : {reg94[(4'h8):(2'h3)]})))
            begin
              reg97 <= (reg94 ? (8'had) : reg62[(4'hb):(1'h0)]);
              reg98 <= (~$signed($unsigned({wire72[(5'h14):(4'hb)],
                  (reg94 ~^ wire72)})));
            end
          else
            begin
              reg97 <= reg100[(2'h2):(1'h1)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg102 <= wire69;
      reg103 <= $signed(wire76[(1'h1):(1'h0)]);
      reg104 <= $signed(({((wire68 ? wire56 : wire66) >> (wire71 ^ wire68)),
              ((-(8'hb9)) * wire71)} ?
          ((reg92[(3'h6):(2'h2)] == (&reg88)) ^ (-((8'hbc) ?
              reg92 : reg99))) : reg82[(3'h5):(3'h4)]));
    end
endmodule
