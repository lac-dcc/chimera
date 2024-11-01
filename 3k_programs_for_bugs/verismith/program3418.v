module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h313):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire198;
  wire [(3'h7):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire196;
  wire signed [(5'h11):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire187;
  wire [(4'h9):(1'h0)] wire103;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire79;
  reg [(4'hd):(1'h0)] reg220 = (1'h0);
  reg [(4'hc):(1'h0)] reg219 = (1'h0);
  reg [(3'h5):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg214 = (1'h0);
  reg [(5'h15):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(4'hd):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg208 = (1'h0);
  reg [(5'h14):(1'h0)] reg207 = (1'h0);
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg [(4'h8):(1'h0)] reg205 = (1'h0);
  reg [(5'h14):(1'h0)] reg204 = (1'h0);
  reg [(2'h3):(1'h0)] reg203 = (1'h0);
  reg [(4'ha):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg201 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg190 = (1'h0);
  reg [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg192 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(4'ha):(1'h0)] reg194 = (1'h0);
  assign y = {wire221,
                 wire200,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire189,
                 wire187,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire97,
                 wire81,
                 wire79,
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
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
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
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg99,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 (1'h0)};
  module4 #() modinst80 (.wire9((8'ha8)), .wire7(wire1), .clk(clk), .wire6(wire0), .wire8(wire2), .wire5(wire3), .y(wire79));
  assign wire81 = (({($signed(wire79) ? (~&wire79) : (wire1 <<< (8'hac))),
                              $signed($signed(wire2))} ?
                          wire3[(4'h8):(1'h1)] : $signed(wire1[(4'he):(4'h8)])) ?
                      $unsigned(wire79) : wire2);
  always
    @(posedge clk) begin
      reg82 <= {(+(wire0[(3'h6):(1'h1)] ?
              wire1[(3'h4):(2'h2)] : ((!wire79) ?
                  wire0 : wire1[(3'h5):(1'h0)]))),
          ($unsigned(((^wire79) - (wire2 && wire2))) ?
              (^((wire81 ?
                  wire0 : wire2) || (~|wire0))) : ($unsigned($signed((8'ha7))) ?
                  ({wire79} ?
                      wire81[(3'h5):(2'h3)] : wire0[(4'ha):(4'h8)]) : ($signed(wire3) ?
                      (wire2 && wire81) : (8'hbf))))};
      reg83 <= (~&{(~{$unsigned(wire2), $signed(reg82)})});
      reg84 <= $signed((((wire81[(1'h1):(1'h1)] ? $signed(wire2) : wire2) ?
              wire1[(4'ha):(1'h0)] : {wire81}) ?
          $signed(((^~(8'hb2)) ? wire79 : wire81)) : ({(~&wire81),
                  reg82[(2'h2):(2'h2)]} ?
              ((^wire1) >= $unsigned(reg82)) : {((8'hae) >> wire0),
                  (wire79 + (8'hb3))})));
      reg85 <= {($unsigned((~&reg84[(2'h2):(1'h1)])) ?
              ((reg83[(1'h1):(1'h1)] & (reg82 ? reg82 : (8'ha4))) ?
                  (&reg82[(5'h12):(4'h9)]) : wire3) : $signed({(wire81 ?
                      (8'hb4) : wire79)})),
          ((+(~&wire1[(5'h10):(4'h8)])) <= wire3)};
      if (wire3)
        begin
          if ((8'h9d))
            begin
              reg86 <= ((&wire0[(4'hf):(2'h2)]) <<< ($unsigned((wire1[(3'h6):(3'h4)] == {wire2})) < reg85[(2'h3):(2'h2)]));
              reg87 <= $unsigned(reg83);
              reg88 <= (^(wire79 + reg86[(4'hb):(2'h2)]));
              reg89 <= (~|reg84[(3'h6):(3'h4)]);
              reg90 <= (|$signed(wire3[(5'h10):(4'hd)]));
            end
          else
            begin
              reg86 <= ((~|(~(reg85[(2'h3):(2'h2)] ?
                  wire3[(5'h12):(5'h10)] : $unsigned(reg90)))) - ($unsigned($signed($signed(wire79))) ?
                  (&$signed(((7'h41) ?
                      reg83 : reg90))) : $unsigned(reg85[(1'h1):(1'h1)])));
              reg87 <= $unsigned(($signed((~&wire0)) ?
                  $signed(($unsigned(wire0) >= (wire81 ?
                      (7'h42) : reg87))) : $unsigned((wire3[(1'h1):(1'h1)] + reg89))));
              reg88 <= (!$signed((-{{wire0}})));
              reg89 <= $unsigned(wire0[(4'hf):(3'h4)]);
            end
          reg91 <= (~^wire3);
          reg92 <= reg83;
          if ((8'haf))
            begin
              reg93 <= reg88[(4'ha):(4'h9)];
              reg94 <= (^~reg82[(5'h10):(2'h2)]);
              reg95 <= $signed($unsigned(((((8'hb9) ?
                      wire79 : wire1) <= {reg86}) ?
                  ((~^reg83) ?
                      (wire2 ? reg82 : reg87) : (reg84 ?
                          reg85 : (8'hb7))) : {(wire2 ? reg88 : reg85)})));
              reg96 <= $signed((-$unsigned((|reg93))));
            end
          else
            begin
              reg93 <= $unsigned(reg92);
              reg94 <= {((8'ha0) ?
                      {((wire0 ? wire81 : reg83) || (reg90 ? reg83 : reg94)),
                          $signed($signed(reg91))} : $unsigned((&{reg95,
                          wire2})))};
              reg95 <= reg86[(2'h2):(2'h2)];
            end
        end
      else
        begin
          if ((~(((!(^~(8'ha7))) ?
              (~&(8'hbd)) : $unsigned($unsigned((8'hae)))) | $signed((-wire79[(1'h1):(1'h1)])))))
            begin
              reg86 <= $signed(reg84[(1'h0):(1'h0)]);
            end
          else
            begin
              reg86 <= $unsigned((!$unsigned((~^$signed((8'hb7))))));
              reg87 <= ((&(8'ha5)) ?
                  ({{(-reg95), (reg93 ? reg95 : reg88)}, wire1} ?
                      $unsigned(wire79) : reg86[(3'h7):(2'h3)]) : $signed(reg88));
            end
          reg88 <= reg87;
          if ({$unsigned(reg93),
              ((^~$signed((&(8'hbc)))) ?
                  reg96[(2'h3):(1'h0)] : (wire81[(1'h0):(1'h0)] * (~reg91[(3'h6):(3'h5)])))})
            begin
              reg89 <= (~(~^($unsigned(wire0[(1'h0):(1'h0)]) << reg96)));
              reg90 <= ((reg87 > (reg94[(3'h6):(3'h6)] << $signed((^~reg86)))) + wire79);
            end
          else
            begin
              reg89 <= $signed(wire79);
              reg90 <= ((wire0 != (reg91 ?
                  $unsigned((7'h44)) : wire3)) ~^ ($unsigned($signed($signed(reg84))) & ($unsigned((+reg86)) + $signed((reg88 <<< reg92)))));
              reg91 <= wire0[(4'ha):(3'h5)];
              reg92 <= ({(reg88 >>> ((^~(8'ha1)) ?
                          $signed(reg92) : (~(7'h43))))} ?
                  {((wire3 ? $unsigned(reg90) : {reg92}) ?
                          $unsigned((reg88 <= (8'hb0))) : ((wire1 + (8'hb2)) ?
                              reg85[(1'h1):(1'h1)] : reg82[(2'h3):(2'h2)])),
                      $signed($signed(reg90[(1'h1):(1'h0)]))} : ((($signed(wire1) ^ $signed(wire0)) ?
                          {$unsigned(wire81)} : reg93[(1'h0):(1'h0)]) ?
                      ((!$unsigned(wire2)) > (8'hb4)) : $signed($signed(((8'hab) ?
                          reg90 : reg95)))));
              reg93 <= reg84;
            end
          reg94 <= ((8'ha2) ?
              wire3[(5'h14):(3'h7)] : {((!(wire79 ? reg89 : reg83)) ?
                      wire2 : reg85[(2'h2):(2'h2)]),
                  reg92});
        end
    end
  assign wire97 = $unsigned($signed($signed(((reg86 ? reg87 : reg82) ?
                      (wire81 ^~ wire0) : reg95[(3'h5):(1'h1)]))));
  assign wire98 = $unsigned({(((reg86 ~^ wire2) ? {wire79, reg85} : {reg93}) ?
                          ({reg91, (8'ha7)} <<< wire3) : $unsigned((reg95 ?
                              wire79 : (7'h40)))),
                      (~^{(reg94 ? wire79 : wire81), {reg91}})});
  always
    @(posedge clk) begin
      reg99 <= (~&reg83[(3'h5):(1'h0)]);
    end
  assign wire100 = (reg87 ?
                       (reg95[(4'h8):(1'h1)] > wire81[(1'h1):(1'h1)]) : {($unsigned(reg90) && (-{reg94})),
                           (~|(8'hba))});
  assign wire101 = $unsigned(reg89[(4'ha):(1'h1)]);
  assign wire102 = ($signed(reg88) ?
                       reg96 : (reg96 << ((reg93 << $signed(reg93)) && {(wire100 ^~ wire100),
                           ((8'haa) == reg88)})));
  assign wire103 = $unsigned((^~{(~&{reg83})}));
  module104 #() modinst188 (.wire106(wire2), .wire108(reg85), .y(wire187), .clk(clk), .wire105(reg91), .wire107(wire0));
  assign wire189 = {{(reg94[(3'h6):(2'h3)] ?
                               wire81[(3'h4):(2'h3)] : wire1[(4'hc):(4'h9)]),
                           reg85[(1'h1):(1'h0)]},
                       wire187};
  always
    @(posedge clk) begin
      reg190 <= $signed(reg85);
      reg191 <= (!((~^$signed(wire81[(1'h1):(1'h0)])) ?
          (+$signed((reg83 >= reg99))) : $unsigned({((7'h44) - wire103)})));
      reg192 <= wire1[(1'h0):(1'h0)];
      reg193 <= reg88;
      reg194 <= $unsigned($signed({{(reg191 << wire101), wire189},
          $signed((8'hb4))}));
    end
  assign wire195 = (reg190 ?
                       $unsigned((reg84[(3'h6):(2'h3)] >>> $unsigned((&(8'hbc))))) : reg85[(2'h3):(2'h3)]);
  assign wire196 = $signed($unsigned(($unsigned($unsigned(reg190)) - reg94[(4'hd):(3'h7)])));
  assign wire197 = $unsigned((&$unsigned(((wire103 & reg83) ^~ (wire102 < wire102)))));
  module4 #() modinst199 (.y(wire198), .wire6(wire3), .wire5(wire79), .wire8(reg99), .clk(clk), .wire9(reg88), .wire7(reg85));
  assign wire200 = wire97[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg201 <= $signed($signed(((reg87 <= (~&(8'hb4))) != wire3[(2'h2):(2'h2)])));
      reg202 <= wire0[(5'h12):(4'hd)];
      reg203 <= {(($signed(reg194) <<< reg193) || wire0[(5'h12):(4'ha)])};
      if ({$signed($unsigned((^{wire98, wire0}))),
          ((&((reg86 ? wire103 : wire200) ?
              ((8'hab) << reg92) : $signed(wire3))) == (($signed(reg99) ?
                  reg99 : $unsigned(reg96)) ?
              wire103 : reg88))})
        begin
          reg204 <= ((((!reg191) ?
              ((reg99 ? wire3 : (8'hb9)) ?
                  (wire102 ?
                      wire81 : reg191) : $signed(wire198)) : reg193) < ($signed($signed(wire101)) + ((8'haf) ?
              wire79 : $signed(reg192)))) || (((8'hb6) ?
              reg86[(4'h8):(3'h6)] : wire187[(3'h4):(1'h0)]) - (wire2 ?
              {(^~(8'h9d)),
                  (wire198 ? reg90 : wire1)} : ((^wire195) ^~ wire98))));
        end
      else
        begin
          reg204 <= ({(&((reg193 != wire196) ?
                  (reg85 ? reg203 : reg194) : wire189[(2'h2):(2'h2)])),
              $unsigned($unsigned((reg82 ?
                  wire0 : (8'ha3))))} << $unsigned((~|$unsigned((~^(8'ha7))))));
          if (($signed(reg92) <= ($unsigned(((^~reg190) >> $unsigned(reg84))) <= $unsigned(reg192))))
            begin
              reg205 <= $unsigned($unsigned((~{((8'ha0) ? wire200 : reg190),
                  (reg90 ? reg95 : wire196)})));
              reg206 <= ($signed(reg201[(2'h3):(2'h2)]) <<< (~|((reg205[(2'h3):(2'h3)] >> $unsigned(wire0)) ?
                  (((8'hb9) ? wire81 : wire195) ?
                      $signed(reg191) : ((8'had) ?
                          (8'haf) : wire196)) : $signed((wire0 ^ reg83)))));
              reg207 <= $unsigned(((+(reg206[(1'h0):(1'h0)] ~^ (wire0 ?
                      (8'ha7) : wire189))) ?
                  ((~&(reg94 != (8'hb6))) ?
                      $unsigned(reg88[(4'h8):(3'h5)]) : $signed((reg203 ?
                          (8'h9d) : wire0))) : (($signed(wire97) ?
                      $unsigned(wire102) : ((8'h9d) * reg90)) || wire195[(2'h3):(1'h0)])));
            end
          else
            begin
              reg205 <= $signed($signed(($signed({reg84,
                  reg85}) > $unsigned(reg99))));
              reg206 <= ($unsigned({$unsigned(reg191),
                  wire101}) << (reg93[(4'h8):(3'h5)] ?
                  $signed($signed((reg191 ? reg87 : wire197))) : reg205));
              reg207 <= $unsigned(wire1);
              reg208 <= $unsigned(wire3);
              reg209 <= $signed(reg92);
            end
          reg210 <= (8'hbb);
        end
    end
  always
    @(posedge clk) begin
      reg211 <= $signed(wire0);
      reg212 <= $unsigned((reg93[(4'hc):(1'h0)] | (8'h9e)));
      reg213 <= wire97[(2'h3):(1'h0)];
      if (wire103[(4'h8):(3'h4)])
        begin
          if (((7'h42) & (($unsigned($signed(reg213)) >= (~^(reg204 >= wire79))) >>> ($signed(reg212) ?
              (8'hab) : (&{reg84, wire0})))))
            begin
              reg214 <= reg90;
              reg215 <= ((-wire200) | $unsigned((7'h41)));
              reg216 <= (^~((($signed(reg214) >>> reg194[(4'h8):(2'h2)]) ?
                  $unsigned((reg88 != reg211)) : $unsigned((wire200 - wire98))) + ((+reg210[(3'h4):(1'h0)]) > $unsigned(reg209))));
              reg217 <= wire101[(4'h8):(3'h6)];
            end
          else
            begin
              reg214 <= wire197[(2'h2):(1'h0)];
              reg215 <= (~&$unsigned(wire103[(2'h2):(1'h0)]));
              reg216 <= wire198[(5'h12):(3'h5)];
            end
          reg218 <= (wire100 << (8'ha9));
          reg219 <= (!{($signed(reg82) ? $signed((!reg94)) : (8'ha1))});
        end
      else
        begin
          if ((($signed(wire98[(3'h7):(1'h0)]) >= $signed($unsigned(reg204))) <= $unsigned(((wire196 > $unsigned(reg193)) && ($signed(reg203) || {reg209,
              reg203})))))
            begin
              reg214 <= $signed(wire187);
              reg215 <= wire0[(5'h11):(4'he)];
              reg216 <= (wire102 ?
                  $signed(($signed((&reg204)) < $signed({reg91,
                      (7'h44)}))) : {reg194[(3'h5):(1'h1)],
                      (reg90 ? $unsigned(wire1[(5'h13):(5'h10)]) : reg194)});
              reg217 <= (($signed((~&((8'hba) ? (8'haf) : (8'hbe)))) ?
                      ((~reg87[(3'h5):(3'h4)]) != (^{reg96,
                          reg215})) : reg213) ?
                  $unsigned($signed((|{wire0,
                      wire1}))) : (!$unsigned({$signed(reg210)})));
              reg218 <= {(~^{reg215, reg88})};
            end
          else
            begin
              reg214 <= (($signed(((&reg210) > $signed(wire2))) ?
                      ((-$unsigned(reg217)) ?
                          $unsigned(wire0) : $unsigned(reg204[(5'h14):(3'h7)])) : ((7'h44) ?
                          $signed(wire189) : reg191[(4'h9):(3'h4)])) ?
                  reg83[(2'h3):(1'h0)] : (reg190[(3'h7):(2'h3)] <<< {$unsigned($signed(wire97)),
                      reg202}));
              reg215 <= ($signed($unsigned($signed((reg208 ?
                  wire81 : reg89)))) <= $signed($unsigned(($signed(reg83) >>> (wire200 <<< reg88)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg220 <= {(+(8'hbb)), $unsigned($signed(wire189[(5'h11):(2'h3)]))};
    end
  assign wire221 = wire3[(5'h14):(4'hf)];
endmodule

module module104  (y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire108;
  input wire signed [(4'he):(1'h0)] wire107;
  input wire [(5'h14):(1'h0)] wire106;
  input wire [(5'h13):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire186;
  wire [(4'hf):(1'h0)] wire185;
  wire signed [(5'h14):(1'h0)] wire184;
  wire [(3'h7):(1'h0)] wire157;
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg [(3'h6):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(5'h14):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(4'he):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire157,
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
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire107[(4'h8):(2'h3)])
        begin
          reg109 <= wire108;
          if (reg109[(4'hd):(1'h1)])
            begin
              reg110 <= (~^(-wire105[(3'h7):(3'h5)]));
              reg111 <= wire108[(2'h3):(1'h1)];
              reg112 <= (8'hb5);
            end
          else
            begin
              reg110 <= reg112;
              reg111 <= wire108;
            end
          if (reg112)
            begin
              reg113 <= reg110;
              reg114 <= ($signed(reg111[(4'hb):(3'h6)]) ?
                  (({wire107,
                      (+(8'ha2))} >> reg111[(1'h0):(1'h0)]) <= (8'ha8)) : reg111[(2'h3):(1'h1)]);
              reg115 <= {$unsigned($signed(reg109[(4'hb):(1'h0)]))};
            end
          else
            begin
              reg113 <= $signed($unsigned($unsigned((wire107 >>> reg111[(3'h6):(3'h4)]))));
              reg114 <= (wire107 ?
                  $signed($signed((-wire108[(2'h3):(2'h2)]))) : $unsigned($signed((&wire108[(2'h2):(2'h2)]))));
              reg115 <= $unsigned((reg115 + reg114[(3'h7):(3'h6)]));
              reg116 <= $signed((wire108[(1'h0):(1'h0)] ?
                  (+((~^reg110) ?
                      (reg109 && wire108) : $unsigned(wire105))) : ($unsigned($unsigned(reg114)) + ((reg109 ?
                      (8'hb5) : (8'ha7)) << $signed(reg114)))));
              reg117 <= $unsigned(wire107[(4'hd):(2'h2)]);
            end
          reg118 <= (~|reg114[(4'ha):(4'h9)]);
          if ({(reg113[(3'h6):(3'h5)] == reg112[(3'h4):(2'h2)])})
            begin
              reg119 <= {wire105,
                  $unsigned($unsigned(((-reg118) || reg114[(4'ha):(3'h4)])))};
            end
          else
            begin
              reg119 <= ($unsigned(wire108[(2'h2):(1'h0)]) == wire108[(1'h0):(1'h0)]);
              reg120 <= (wire106[(3'h6):(1'h1)] ^ reg116[(3'h6):(2'h2)]);
              reg121 <= (((($signed(reg115) ? $unsigned(wire108) : (~|reg114)) ?
                          (+(&wire107)) : (reg113[(2'h3):(2'h2)] ?
                              reg111[(2'h3):(1'h1)] : (wire106 ?
                                  reg113 : reg116))) ?
                      $unsigned(((wire107 | reg115) <<< {wire106,
                          reg109})) : (~|reg110)) ?
                  ($unsigned(($signed(reg111) + reg120)) ?
                      ((~wire108) <= reg111) : {reg115[(2'h3):(1'h0)]}) : {wire107[(2'h3):(2'h3)]});
              reg122 <= reg115[(1'h0):(1'h0)];
              reg123 <= $signed((~|(($unsigned(reg112) ?
                      {wire106, reg121} : $unsigned(reg119)) ?
                  ((|wire106) * (&reg112)) : (((8'hbb) < wire107) ?
                      (reg115 || reg119) : reg122[(3'h4):(3'h4)]))));
            end
        end
      else
        begin
          reg109 <= $unsigned($signed((+reg113[(1'h1):(1'h0)])));
          reg110 <= reg117[(3'h4):(3'h4)];
          reg111 <= (|((wire108 != reg111) <<< {$unsigned(reg111),
              ($signed(reg112) * {reg115})}));
          reg112 <= $unsigned($unsigned(wire108));
          reg113 <= $signed(wire106[(4'ha):(2'h3)]);
        end
      reg124 <= (~|((wire105[(3'h5):(2'h3)] ?
              $unsigned(wire106) : ((reg116 ?
                  reg121 : reg119) <= reg118[(5'h10):(4'h8)])) ?
          reg121 : wire106[(4'ha):(2'h3)]));
    end
  module125 #() modinst158 (wire157, clk, reg114, reg112, reg123, reg116);
  always
    @(posedge clk) begin
      if (reg115[(5'h11):(5'h10)])
        begin
          reg159 <= $signed($unsigned((!reg117[(3'h6):(3'h4)])));
          if (reg115[(5'h11):(4'h9)])
            begin
              reg160 <= $signed($signed({reg114}));
              reg161 <= reg120[(2'h2):(2'h2)];
              reg162 <= ({(~((reg123 > reg159) ? reg115 : (reg159 | reg119)))} ?
                  reg110[(1'h0):(1'h0)] : $unsigned(($signed(wire157[(3'h4):(2'h3)]) ?
                      ((-reg159) ?
                          (wire157 || wire106) : (-wire108)) : $signed($unsigned(wire106)))));
              reg163 <= reg123;
            end
          else
            begin
              reg160 <= $signed(reg120);
              reg161 <= (~&(reg120 ?
                  {$signed($signed((8'h9c)))} : reg111[(4'hb):(3'h4)]));
              reg162 <= $signed($signed($signed($unsigned(reg118))));
            end
          reg164 <= $unsigned($signed($signed(reg124[(4'h9):(3'h6)])));
          reg165 <= ($unsigned((&(~&reg109[(4'hc):(1'h0)]))) ?
              {reg122} : (+reg117));
          reg166 <= {(~^reg112), $signed((~|(~^reg161)))};
        end
      else
        begin
          if ((((((+reg124) ?
                  wire108[(1'h1):(1'h1)] : (wire107 ? reg120 : reg115)) ?
              (~&{reg117}) : {((8'hb8) * reg117)}) && {$signed((wire107 <<< reg115)),
              {$signed(wire107)}}) > wire108[(1'h1):(1'h1)]))
            begin
              reg159 <= (|$signed(({(reg166 ? (8'haa) : reg117), {reg117}} ?
                  $unsigned((~^reg165)) : {(reg113 ? wire105 : (8'hac))})));
              reg160 <= ((+(!$unsigned({(8'hba),
                  (8'hba)}))) <<< ($unsigned((!wire107[(4'h9):(4'h9)])) ?
                  ($signed((reg164 & reg120)) + (^$unsigned(wire106))) : (8'had)));
              reg161 <= ((8'hb6) ?
                  reg120[(3'h4):(2'h2)] : ($unsigned({(-(8'ha5)),
                          $signed(reg123)}) ?
                      wire106 : $unsigned(reg122[(1'h0):(1'h0)])));
              reg162 <= reg112;
            end
          else
            begin
              reg159 <= wire108;
              reg160 <= (reg112 <= {($unsigned((wire106 ?
                      reg109 : reg160)) <= ((reg165 ? reg109 : wire106) ?
                      $unsigned((8'h9c)) : (+reg114)))});
            end
        end
      reg167 <= {{reg111[(1'h1):(1'h0)]}};
      if ($signed(reg167[(1'h0):(1'h0)]))
        begin
          if ((wire106 ?
              $signed($unsigned(reg109[(4'h8):(2'h2)])) : ($unsigned((~(8'hbe))) && ((~$unsigned(reg166)) >= (+reg120[(3'h7):(3'h4)])))))
            begin
              reg168 <= $signed(wire106);
              reg169 <= {reg120[(1'h1):(1'h0)],
                  (reg167 ? reg168 : (~^$signed($signed(reg159))))};
              reg170 <= reg111;
              reg171 <= (($signed(reg169[(1'h1):(1'h0)]) >>> $signed($unsigned((reg124 ^~ wire107)))) ?
                  wire105 : (~|(reg113 ?
                      reg119[(3'h4):(2'h3)] : (~|{reg167, (8'hae)}))));
            end
          else
            begin
              reg168 <= ($signed($signed(($unsigned(reg159) >= $unsigned((8'hba))))) ?
                  ($unsigned({(8'ha5),
                      $unsigned(reg119)}) >>> (~^$signed(reg111[(1'h0):(1'h0)]))) : $unsigned(reg117));
              reg169 <= (reg112 ^ reg112);
              reg170 <= (^$signed($signed($signed((~|reg117)))));
            end
          reg172 <= (~|reg163);
        end
      else
        begin
          reg168 <= $unsigned($signed(wire107));
          reg169 <= ($signed(({(^reg163)} ?
              $unsigned($signed(reg115)) : ((~|reg122) && $signed(reg113)))) ^~ (^reg164));
          if (reg116[(3'h6):(2'h2)])
            begin
              reg170 <= $signed(reg115);
            end
          else
            begin
              reg170 <= reg169[(2'h3):(1'h0)];
              reg171 <= ($unsigned($unsigned({reg113[(3'h6):(3'h5)],
                  $signed(wire105)})) < reg114[(3'h5):(2'h3)]);
            end
          reg172 <= reg169;
        end
      reg173 <= $unsigned(($unsigned($signed(((8'hb4) && reg167))) ?
          ({(reg114 ? (8'hb8) : reg123), $signed(reg110)} ?
              (((8'hb9) && reg121) ?
                  reg166[(1'h1):(1'h1)] : reg124[(5'h13):(5'h13)]) : ((reg161 ?
                      reg112 : (8'haa)) ?
                  ((8'hb3) >= reg121) : (&reg123))) : (~^{{reg113, reg171}})));
    end
  always
    @(posedge clk) begin
      reg174 <= {((-(reg160[(1'h0):(1'h0)] <<< reg163[(2'h3):(1'h1)])) << (((wire105 <<< reg163) << reg167[(2'h3):(1'h1)]) < reg117[(2'h2):(2'h2)]))};
      reg175 <= $signed(reg160);
      reg176 <= reg170;
      if (((reg172 ~^ $unsigned(($unsigned((8'hb4)) == reg167[(2'h2):(1'h0)]))) ?
          ($signed((~|reg111[(4'ha):(3'h6)])) ~^ ((&(reg112 ?
                  reg123 : reg112)) ?
              ((&reg110) <= (~|reg117)) : reg161)) : $unsigned((+{reg162,
              {(8'h9d)}}))))
        begin
          reg177 <= $unsigned($signed((8'haf)));
          reg178 <= ((~|$signed(((-(8'ha6)) ? $signed(reg170) : (^reg123)))) ?
              $unsigned($signed((8'ha3))) : $signed(reg165));
          if (wire105[(4'hd):(4'ha)])
            begin
              reg179 <= (reg174[(4'h8):(1'h0)] ?
                  $signed(($unsigned((|reg172)) >> ($signed(reg161) ?
                      reg167[(2'h2):(2'h2)] : reg120[(4'hc):(4'hb)]))) : $unsigned(($signed((reg176 >= (8'ha8))) ?
                      (^$unsigned(reg176)) : reg171)));
              reg180 <= reg175;
              reg181 <= ({$signed(reg111),
                      ($signed($signed((8'ha1))) ^ reg175)} ?
                  ({$signed((reg169 * (8'hb2))),
                      $signed($unsigned(reg177))} < ({(-reg113),
                          $signed((8'hbd))} ?
                      (((8'hb5) ? (8'haf) : (7'h44)) + reg118) : (&(reg111 ?
                          (8'hb2) : reg176)))) : (({$signed(reg118)} ?
                      ($unsigned(reg123) ?
                          $signed(reg114) : $signed(reg179)) : reg111[(2'h3):(2'h3)]) << (~^$unsigned((wire157 ?
                      reg159 : reg168)))));
            end
          else
            begin
              reg179 <= (~&((({reg173} ^ ((8'hbd) ?
                  reg113 : reg172)) <= (reg111 ?
                  reg112 : (&reg174))) < (~|(reg111[(4'h9):(1'h1)] ?
                  reg123[(1'h0):(1'h0)] : (reg170 ? reg122 : reg120)))));
              reg180 <= {((($signed(reg178) ?
                          $unsigned((8'hb4)) : $signed(reg173)) ?
                      ($unsigned(reg165) ?
                          (~reg173) : $signed(wire107)) : (wire108[(2'h3):(2'h2)] && reg162[(3'h4):(2'h3)])) ~^ $signed(($signed((8'hb1)) ?
                      {reg176, (8'haa)} : $unsigned(reg111)))),
                  $unsigned(({wire107[(4'h9):(3'h4)],
                      reg124} | ($signed((8'hac)) ?
                      (reg124 - reg161) : wire107[(4'h8):(1'h1)])))};
            end
        end
      else
        begin
          if ((^~$unsigned(reg181[(2'h2):(1'h0)])))
            begin
              reg177 <= (+($unsigned(reg161) ?
                  {($signed(wire108) ?
                          reg181[(1'h1):(1'h0)] : $unsigned(reg181))} : $signed((!$unsigned(reg159)))));
              reg178 <= $unsigned(reg110[(1'h1):(1'h0)]);
              reg179 <= {$unsigned(reg170)};
              reg180 <= reg116;
              reg181 <= $unsigned(($signed(reg166) ?
                  {(-$unsigned(reg177))} : {reg159[(4'hf):(3'h5)]}));
            end
          else
            begin
              reg177 <= (((8'hb8) <<< ($signed($unsigned(reg124)) > reg165)) >= reg179);
              reg178 <= $unsigned((($unsigned(reg121[(1'h0):(1'h0)]) && reg159[(2'h3):(1'h1)]) ?
                  (reg123[(4'ha):(4'h8)] ?
                      ((^reg123) << reg118[(4'h9):(2'h3)]) : {(|reg123)}) : ((~&(^~(8'ha1))) >> (reg162 == reg178))));
            end
          reg182 <= reg161[(4'hc):(4'ha)];
          reg183 <= $unsigned((+(reg174 ?
              $signed((reg175 ? reg169 : reg113)) : $signed(reg182))));
        end
    end
  assign wire184 = reg183[(4'hb):(3'h4)];
  assign wire185 = (((((8'hb3) <<< $signed(reg161)) ?
                           $signed(reg118[(4'hc):(3'h6)]) : ($unsigned(reg123) <<< {wire184,
                               reg118})) ?
                       wire157[(2'h3):(2'h3)] : reg161[(2'h2):(1'h0)]) > $signed((reg120[(2'h3):(2'h2)] <<< reg112[(5'h10):(3'h4)])));
  assign wire186 = wire105[(4'ha):(1'h0)];
endmodule

module module4
#(parameter param78 = (&((~|{((8'ha1) - (8'haa)), (&(8'hba))}) != ((8'ha1) ? (^(!(8'hb2))) : (((7'h43) ? (8'h9d) : (8'hbd)) ? ((8'hbf) >> (8'hb3)) : ((8'hbe) ? (8'hb6) : (8'hbd)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire5;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire74;
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire45,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire59,
                 wire74,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  module10 #() modinst46 (wire45, clk, wire5, wire7, wire6, wire8);
  assign wire47 = wire5;
  assign wire48 = (wire7 ?
                      (wire5[(4'ha):(2'h3)] ?
                          (wire8 ?
                              $signed(wire45) : ($unsigned((8'hbf)) ?
                                  (wire7 <<< wire6) : wire45[(2'h3):(2'h3)])) : $unsigned($signed(wire47[(3'h6):(2'h3)]))) : (~((+wire9) ?
                          (8'hb4) : (8'ha0))));
  assign wire49 = ((~^wire5) ^~ wire9);
  assign wire50 = (({{(wire5 >> wire49)}, (^wire5)} ?
                      wire8[(1'h1):(1'h0)] : wire49[(3'h7):(3'h4)]) * (^(&((wire48 < wire7) >= (|wire45)))));
  assign wire51 = $unsigned(wire45[(3'h5):(1'h0)]);
  assign wire52 = $unsigned((+(8'hab)));
  assign wire53 = {(((&$unsigned(wire49)) == wire47) ?
                          wire50[(1'h0):(1'h0)] : $unsigned(wire6))};
  always
    @(posedge clk) begin
      reg54 <= $signed(wire52[(1'h0):(1'h0)]);
      reg55 <= wire7[(4'ha):(3'h7)];
      reg56 <= {(|$unsigned((~(~&wire47)))),
          $signed(((^(wire52 ? wire51 : (8'hb9))) < (!(wire52 ?
              wire6 : (8'ha0)))))};
      reg57 <= $unsigned($signed(wire47[(3'h4):(2'h3)]));
      reg58 <= reg57[(3'h4):(2'h3)];
    end
  assign wire59 = ($signed((+$signed($unsigned(wire7)))) ?
                      $unsigned($signed(reg58[(3'h6):(3'h4)])) : $signed(reg54[(4'ha):(1'h1)]));
  module60 #() modinst75 (.wire63(reg57), .wire61(wire5), .y(wire74), .wire64(wire51), .wire62(wire52), .wire65(reg58), .clk(clk));
  assign wire76 = wire6;
  assign wire77 = wire9[(4'h8):(3'h6)];
endmodule

module module60
#(parameter param73 = (((8'ha4) ? (~((7'h42) ? ((8'hae) | (8'hbd)) : (~|(8'ha3)))) : (((-(8'hb8)) ? (-(8'ha5)) : (^~(8'ha9))) << (~|((8'ha5) < (8'hac))))) ? {((^~{(8'hb6)}) + (((7'h43) ? (8'h9f) : (8'hbd)) ? ((7'h41) >> (7'h43)) : ((7'h41) >>> (8'hab))))} : (+(7'h42))))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire65;
  input wire signed [(2'h2):(1'h0)] wire64;
  input wire signed [(2'h2):(1'h0)] wire63;
  input wire signed [(4'h8):(1'h0)] wire62;
  input wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  assign y = {wire72, wire71, wire70, wire69, wire68, wire67, wire66, (1'h0)};
  assign wire66 = {wire63};
  assign wire67 = $signed({(!$unsigned($signed(wire66))),
                      ($unsigned($signed(wire63)) ? wire63 : wire66)});
  assign wire68 = (wire62 ?
                      $signed($unsigned($unsigned({wire66}))) : (wire64[(1'h0):(1'h0)] == $unsigned((&(wire63 >> wire63)))));
  assign wire69 = ($signed(wire67[(2'h3):(1'h1)]) ?
                      ($signed($unsigned(wire68[(4'hb):(4'hb)])) ?
                          (8'hb5) : $signed($unsigned((wire61 << wire64)))) : ($signed($unsigned(wire68[(4'hf):(4'hc)])) ?
                          $signed(wire61[(1'h1):(1'h0)]) : (((wire61 ?
                              wire61 : wire64) ~^ $unsigned(wire64)) <<< (~^wire63))));
  assign wire70 = ((wire67[(4'he):(2'h2)] ? wire68 : (+$signed((|wire64)))) ?
                      wire64[(1'h0):(1'h0)] : $unsigned(wire64));
  assign wire71 = (((!wire63) >= $signed(wire69)) ^~ wire69[(3'h5):(3'h5)]);
  assign wire72 = (8'h9f);
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire37;
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  assign y = {wire44,
                 wire37,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= $signed($unsigned($signed(wire14)));
      if (($signed((^$unsigned((!wire12)))) - $unsigned(wire11[(1'h0):(1'h0)])))
        begin
          reg16 <= ({$unsigned(($signed(wire13) ~^ reg15[(3'h7):(1'h1)]))} - $signed($signed(($signed(wire12) ?
              (wire14 - (8'hb6)) : reg15[(1'h0):(1'h0)]))));
          if (((~&$unsigned($signed((^~wire14)))) == {(8'ha7)}))
            begin
              reg17 <= reg16[(4'h9):(4'h9)];
              reg18 <= $signed($signed({($unsigned(reg15) ?
                      reg15[(3'h7):(1'h0)] : $unsigned(wire12))}));
              reg19 <= reg16;
              reg20 <= wire11;
              reg21 <= {(wire13[(4'hb):(1'h1)] ?
                      (^~{{wire14},
                          (wire11 ?
                              wire14 : wire13)}) : {($signed(wire14) < (~|reg18)),
                          (8'hae)}),
                  ($signed((^~(reg19 ? reg19 : reg15))) ?
                      wire14[(3'h6):(1'h0)] : wire13[(5'h11):(4'ha)])};
            end
          else
            begin
              reg17 <= ($signed((wire13[(2'h2):(2'h2)] ?
                      (wire11[(1'h1):(1'h1)] | ((7'h44) ^ reg21)) : wire14)) ?
                  {$signed($signed((-reg16)))} : $unsigned(((!(wire14 & wire12)) ~^ ((wire13 & reg20) ?
                      $unsigned(wire13) : (wire11 ? wire12 : reg16)))));
              reg18 <= {((((wire11 ?
                      wire14 : wire13) >= $unsigned((8'h9c))) > reg15) && $signed($unsigned(wire14[(3'h4):(2'h2)])))};
              reg19 <= {{(&($unsigned(reg15) ?
                          ((8'hba) ? wire11 : reg16) : reg18))}};
              reg20 <= $signed((7'h43));
            end
          reg22 <= reg20[(4'h9):(3'h6)];
          reg23 <= reg19;
          reg24 <= wire14[(3'h7):(3'h4)];
        end
      else
        begin
          if (reg15[(1'h0):(1'h0)])
            begin
              reg16 <= ((wire13[(5'h13):(1'h0)] < reg17) != reg23);
              reg17 <= $signed($signed({(|reg15)}));
              reg18 <= $signed($unsigned($unsigned($signed(reg19[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg16 <= reg23;
              reg17 <= reg18[(2'h3):(1'h1)];
              reg18 <= (8'h9f);
              reg19 <= $signed((wire14 >> wire13[(5'h14):(4'hd)]));
              reg20 <= reg17[(4'h8):(2'h3)];
            end
          reg21 <= (|reg21);
          if ((-$signed($unsigned(reg22))))
            begin
              reg22 <= {(!wire14)};
              reg23 <= wire14[(2'h3):(2'h2)];
              reg24 <= $signed((|(reg16 > (reg19[(1'h0):(1'h0)] ?
                  reg19[(3'h7):(1'h0)] : reg17[(4'hc):(1'h0)]))));
              reg25 <= $unsigned((^wire14));
            end
          else
            begin
              reg22 <= $unsigned($unsigned(wire13));
              reg23 <= reg25[(2'h3):(2'h2)];
              reg24 <= {$unsigned($signed($signed((|reg23))))};
              reg25 <= reg19[(1'h0):(1'h0)];
            end
          if (((+({reg22[(2'h3):(2'h3)], ((8'ha7) ? wire12 : reg25)} ?
                  reg16 : {(reg15 ? wire11 : reg19), {reg24}})) ?
              (^$signed(($signed((8'ha1)) ?
                  (wire13 <<< reg18) : {(8'hbb)}))) : ((wire14[(3'h4):(2'h3)] ?
                      $signed((8'ha9)) : $unsigned($signed(reg18))) ?
                  reg22[(2'h2):(1'h0)] : {(~(&wire13)), (^~$signed(wire11))})))
            begin
              reg26 <= (~|wire14);
              reg27 <= {reg20[(4'hb):(2'h3)]};
              reg28 <= (&$signed($signed(reg22[(2'h2):(1'h0)])));
            end
          else
            begin
              reg26 <= $signed(reg24[(5'h11):(3'h4)]);
              reg27 <= $signed(($signed((reg25[(1'h1):(1'h0)] ?
                      $unsigned(reg16) : reg25[(2'h3):(1'h1)])) ?
                  ((~^reg20) << ($signed(reg19) ^ reg18[(2'h2):(1'h0)])) : reg19[(2'h2):(1'h1)]));
              reg28 <= (reg19[(3'h5):(1'h1)] ? (8'hb8) : reg28[(2'h3):(1'h0)]);
              reg29 <= (((8'ha9) ?
                      {(-$signed(wire14)),
                          (reg19 ?
                              (reg25 >= reg26) : (|reg16))} : {(reg21[(4'ha):(1'h1)] <= (&(8'hb6)))}) ?
                  reg16 : wire12[(2'h2):(2'h2)]);
            end
          reg30 <= reg24;
        end
      reg31 <= (~$signed((~&$unsigned((reg23 ? (8'ha6) : wire13)))));
      reg32 <= (reg25 ?
          ({{(reg31 ? (8'hae) : wire12), $signed(reg26)},
              reg19[(3'h4):(3'h4)]} + (wire12[(3'h5):(3'h4)] ~^ $unsigned((^reg24)))) : $unsigned((~^$unsigned({(8'h9c),
              (8'ha7)}))));
      reg33 <= reg26[(4'ha):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg34 <= reg32[(3'h4):(1'h0)];
      reg35 <= reg31[(3'h4):(2'h2)];
      reg36 <= ($unsigned($unsigned((reg30[(4'hc):(3'h4)] || $unsigned(reg29)))) ?
          reg18[(2'h3):(1'h1)] : reg26[(1'h0):(1'h0)]);
    end
  assign wire37 = (wire12[(1'h1):(1'h1)] ? reg36[(4'hb):(3'h6)] : reg36);
  always
    @(posedge clk) begin
      reg38 <= (~$unsigned($unsigned($unsigned((~|reg36)))));
      if ((reg27[(4'h8):(3'h7)] >= reg15[(3'h5):(2'h2)]))
        begin
          reg39 <= (reg25 ?
              $signed(((8'ha3) ?
                  reg20 : (reg22 + ((8'hb8) << (8'hbe))))) : {$unsigned($unsigned({reg29}))});
        end
      else
        begin
          reg39 <= (reg22 ?
              reg21 : $signed($signed($signed(reg28[(2'h3):(1'h0)]))));
          reg40 <= (reg24[(1'h1):(1'h0)] >> {(^~reg28)});
        end
      reg41 <= reg26[(4'h8):(2'h3)];
      reg42 <= (~^wire37[(1'h1):(1'h0)]);
      reg43 <= $unsigned(reg28[(2'h3):(2'h2)]);
    end
  assign wire44 = reg31[(4'hb):(3'h5)];
endmodule

module module125
#(parameter param156 = {{(|(8'ha2)), {({(7'h44), (8'hac)} | {(8'ha4)}), ({(8'hb2), (8'h9f)} ? (~^(8'hab)) : ((8'haa) & (8'hb5)))}}})
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire129;
  input wire [(4'he):(1'h0)] wire128;
  input wire [(3'h6):(1'h0)] wire127;
  input wire [(2'h2):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(4'ha):(1'h0)] wire147;
  wire [(5'h12):(1'h0)] wire141;
  wire [(4'h8):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(5'h13):(1'h0)] wire137;
  wire [(4'he):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg [(4'he):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg142 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 reg153,
                 reg152,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  assign wire130 = wire126;
  assign wire131 = $signed(((+wire129) ? wire128 : wire130));
  assign wire132 = (^~(+($signed(wire128[(4'hc):(4'hc)]) < $signed((8'h9d)))));
  assign wire133 = {{$unsigned($unsigned($unsigned(wire129)))}};
  assign wire134 = wire128[(3'h4):(3'h4)];
  assign wire135 = $unsigned({wire127,
                       {((wire127 ^ wire134) ?
                               $signed(wire130) : wire126[(1'h1):(1'h1)]),
                           $signed((&wire132))}});
  assign wire136 = wire134;
  assign wire137 = $unsigned($signed($signed((^~((8'hba) ?
                       wire136 : wire126)))));
  assign wire138 = (+(~&{(~$signed(wire134)),
                       (^~(wire135 ? wire129 : wire127))}));
  assign wire139 = (wire137[(5'h13):(5'h12)] > $signed((~|(~&wire132[(3'h4):(2'h3)]))));
  assign wire140 = wire139[(4'he):(1'h1)];
  assign wire141 = $unsigned($unsigned(($unsigned((wire140 ^ wire126)) ?
                       wire137 : (^~(wire137 >= wire140)))));
  always
    @(posedge clk) begin
      reg142 <= $unsigned((-(8'ha6)));
      reg143 <= (^{(($signed(wire126) ?
              $signed((8'hb3)) : wire133[(3'h7):(2'h3)]) && ({wire133} >= ((8'hb5) * wire140))),
          wire127});
      reg144 <= ({($signed((wire132 | wire126)) ?
              ({wire135} <= (wire132 == reg142)) : $unsigned($unsigned(reg142)))} < $signed((&$unsigned($signed(wire128)))));
      reg145 <= $signed((+{wire135[(1'h0):(1'h0)],
          $unsigned($unsigned(wire128))}));
      reg146 <= wire127;
    end
  assign wire147 = (~$signed((($signed(wire128) ~^ {reg146,
                       wire133}) >>> (~&((8'ha2) ? wire135 : wire126)))));
  assign wire148 = ($unsigned(wire137[(3'h4):(2'h3)]) ?
                       (~$unsigned($signed(((7'h41) ^~ wire129)))) : (~|(~|({(8'hac),
                               (8'h9f)} ?
                           (reg145 == (8'hb2)) : wire128[(4'he):(4'h9)]))));
  assign wire149 = (&$signed(($signed(wire128[(4'ha):(2'h3)]) ?
                       $signed(wire147[(1'h1):(1'h0)]) : reg144[(2'h3):(2'h3)])));
  assign wire150 = wire139;
  assign wire151 = {$signed($unsigned($signed($signed(wire135)))),
                       (~^$signed((wire147 ? $signed(wire140) : (&wire150))))};
  always
    @(posedge clk) begin
      reg152 <= wire126;
      reg153 <= (!(~|wire137[(1'h1):(1'h1)]));
    end
  assign wire154 = wire133[(3'h7):(3'h5)];
  assign wire155 = (+wire128);
endmodule
