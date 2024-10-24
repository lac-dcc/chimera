module top
#(parameter param215 = {(~{(((7'h43) & (8'ha0)) ? {(8'h9d)} : {(8'h9d), (8'hab)}), ((!(8'hae)) < ((8'hab) >> (8'hb4)))}), ((((~&(8'had)) ^~ ((8'hb8) ^ (8'hb8))) <= {(8'hbe)}) + {(((8'hae) ^~ (8'hbf)) ? (8'h9e) : ((8'hba) ? (8'hae) : (8'h9c))), ({(8'hb5), (8'hbd)} <<< {(7'h40)})})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(2'h3):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire205;
  wire signed [(5'h14):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire [(3'h5):(1'h0)] wire199;
  wire [(4'hc):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire197;
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(2'h2):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg208 = (1'h0);
  reg [(4'hd):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg206 = (1'h0);
  reg [(5'h14):(1'h0)] reg202 = (1'h0);
  reg [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire214,
                 wire205,
                 wire204,
                 wire203,
                 wire199,
                 wire11,
                 wire12,
                 wire13,
                 wire16,
                 wire17,
                 wire26,
                 wire27,
                 wire197,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg202,
                 reg201,
                 reg200,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(3'h5):(2'h3)];
      reg5 <= {((wire1 >>> wire2) > ($unsigned({reg4,
              reg4}) | ((wire0 | (8'hb3)) & (~&(8'hb8)))))};
      reg6 <= wire1;
      if (((-(-({wire1} * {wire3, (8'haa)}))) ?
          {($unsigned(wire2) > (-(reg5 ?
                  wire2 : reg6)))} : ($signed({$unsigned(wire0),
              {wire3, wire1}}) ~^ ($signed((!wire3)) && ({reg4,
              wire3} >= (wire1 == wire2))))))
        begin
          reg7 <= (({reg4[(4'ha):(1'h1)], (~(+wire3))} ?
                  ({$unsigned(wire1)} ~^ {{(8'h9f), (8'ha5)},
                      wire0}) : $unsigned($signed((reg6 ? wire2 : (8'hb4))))) ?
              $unsigned($signed($unsigned((-reg5)))) : (|(($unsigned(wire0) ?
                  $signed(wire1) : (wire2 ?
                      wire0 : reg5)) - reg5[(2'h2):(2'h2)])));
          reg8 <= reg4;
          reg9 <= $signed(reg7[(1'h1):(1'h0)]);
        end
      else
        begin
          reg7 <= ({$signed($unsigned((reg7 ? reg7 : reg5))),
              (~|{{wire0, wire1},
                  (wire3 ? wire2 : wire3)})} <= (~^($unsigned((wire1 ?
                  wire0 : (8'hb7))) ?
              $signed(((8'hb7) == wire0)) : (~^(^wire0)))));
        end
      reg10 <= ((^$signed($signed((reg9 | reg4)))) ?
          $unsigned(reg5[(2'h2):(2'h2)]) : (((|((8'had) ? (8'ha3) : wire3)) ?
              (reg4[(3'h5):(2'h2)] * reg7) : ($signed(wire0) ^ reg8[(3'h7):(2'h2)])) << $unsigned(wire1)));
    end
  assign wire11 = $signed(($unsigned((|wire1)) >= $signed((reg10[(3'h6):(1'h1)] ?
                      ((8'hb2) >= reg10) : wire3))));
  assign wire12 = reg10;
  assign wire13 = (((~&reg7[(4'h9):(4'h9)]) < {(((8'hb0) >> wire0) < {reg5})}) + $unsigned((~^wire1)));
  always
    @(posedge clk) begin
      reg14 <= (($unsigned($unsigned(wire11[(3'h4):(1'h0)])) ?
          $unsigned(((wire2 ? reg5 : wire3) ?
              wire2[(3'h5):(3'h5)] : (|wire12))) : ((8'hb1) ?
              reg5 : $signed({wire0}))) | ((wire12 <= ((wire1 * wire13) ?
              $signed(reg7) : (^~wire3))) ?
          (($signed(wire3) ? reg10[(1'h0):(1'h0)] : wire0) ?
              wire11 : wire2) : (~&(wire1 != reg5[(1'h0):(1'h0)]))));
      reg15 <= ($signed(((8'h9d) ?
          (-(wire3 != (8'ha2))) : $signed({wire2}))) - reg4[(4'h9):(1'h0)]);
    end
  assign wire16 = ($unsigned(($signed(reg8[(2'h3):(1'h0)]) ?
                      ($signed(reg15) ?
                          reg8[(3'h7):(1'h0)] : wire0[(1'h0):(1'h0)]) : {reg15[(2'h2):(1'h0)],
                          {wire2}})) <= ((wire11[(4'h9):(3'h4)] ^ $signed($signed((8'hbd)))) * reg10[(3'h7):(1'h1)]));
  assign wire17 = $signed(reg9[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg18 <= (8'hba);
      reg19 <= reg15;
      if ($signed(wire2))
        begin
          reg20 <= (|$signed((reg19[(4'hb):(2'h3)] ?
              (|{reg8, reg5}) : ($signed(reg8) <<< {reg8}))));
          reg21 <= (+$signed((~^((wire2 ? (8'ha4) : reg4) ^~ {wire2, reg6}))));
          reg22 <= $unsigned($signed((((reg20 << reg10) ?
              $unsigned(reg6) : $unsigned(reg21)) != wire16)));
          if ($signed({wire16[(4'hb):(3'h5)]}))
            begin
              reg23 <= $signed($unsigned((+((reg22 != wire17) == $signed(reg9)))));
            end
          else
            begin
              reg23 <= wire12[(1'h0):(1'h0)];
            end
          reg24 <= $signed((($unsigned((wire11 << reg4)) < ($unsigned(reg4) * (reg14 | reg22))) >> {reg21[(3'h4):(1'h0)],
              ((reg20 <<< reg20) ? $signed((8'hb7)) : $signed(reg7))}));
        end
      else
        begin
          reg20 <= reg21[(2'h2):(1'h0)];
        end
      if (reg10)
        begin
          reg25 <= (^(reg22 ? (!reg20) : $signed(wire16[(3'h6):(3'h5)])));
        end
      else
        begin
          reg25 <= ((|$unsigned($signed(((8'hbf) ?
              reg20 : reg14)))) >>> $signed((~(8'ha5))));
        end
    end
  assign wire26 = $unsigned($signed((|(~wire11))));
  assign wire27 = $signed(($signed(((reg23 ^ wire11) ?
                          $signed(wire12) : (~|reg7))) ?
                      $signed((&reg15)) : $signed(((~wire26) ?
                          (reg15 ? reg10 : (8'ha3)) : (wire26 * reg8)))));
  module28 #() modinst198 (wire197, clk, wire17, reg25, reg22, reg23, reg24);
  assign wire199 = (reg14 << reg21);
  always
    @(posedge clk) begin
      reg200 <= {wire16};
      reg201 <= (^~(wire199 & $unsigned((8'haa))));
      reg202 <= $unsigned((~$signed(((wire26 ? (8'h9c) : wire13) ?
          $signed(wire26) : wire197))));
    end
  assign wire203 = ($signed($signed((wire27[(4'hb):(3'h7)] ?
                       (reg4 >> reg20) : (7'h42)))) & (^$unsigned(($signed(reg200) ?
                       (8'hb0) : (-reg4)))));
  assign wire204 = (^$signed((|reg21[(3'h4):(2'h2)])));
  assign wire205 = ({$signed($unsigned(reg21))} ?
                       wire197[(1'h1):(1'h0)] : ((7'h40) ~^ $signed(reg4)));
  always
    @(posedge clk) begin
      reg206 <= (-$unsigned(reg201[(4'hb):(4'hb)]));
      reg207 <= wire3;
      reg208 <= {wire205};
      if (wire204)
        begin
          reg209 <= (reg23 <= reg21);
          if ((8'ha2))
            begin
              reg210 <= (reg201 << (+reg23[(4'hf):(1'h0)]));
            end
          else
            begin
              reg210 <= $unsigned(reg22[(2'h2):(1'h1)]);
            end
        end
      else
        begin
          reg209 <= (reg25[(3'h7):(2'h2)] ?
              reg5[(4'hb):(3'h7)] : reg4[(3'h7):(3'h6)]);
          reg210 <= {(~^((|((8'hbf) ?
                  (8'hb2) : (7'h42))) < reg5[(4'h9):(3'h4)]))};
          reg211 <= (-$signed((~|$signed((-reg20)))));
          reg212 <= (8'hbc);
          reg213 <= $signed(($unsigned($unsigned({reg6, wire2})) >> reg24));
        end
    end
  assign wire214 = (^(reg24 ?
                       (|reg202[(5'h14):(3'h6)]) : (^(wire205[(3'h7):(1'h0)] ?
                           reg202[(4'h8):(1'h1)] : $unsigned(wire203)))));
endmodule

module module28
#(parameter param195 = (({(+((8'hae) ^ (8'haa)))} | (((+(8'ha0)) + {(8'ha3), (8'ha9)}) ? {(&(8'h9f))} : (7'h43))) ? ((-(((8'ha9) > (8'hbb)) + {(8'hb7)})) ? (~&({(8'ha9)} + ((8'hb7) ? (8'hbe) : (8'hbe)))) : (&{((8'ha8) ? (8'hb5) : (8'ha5))})) : ((^~({(8'ha3)} - ((8'ha2) ? (7'h43) : (8'ha0)))) - ((!((8'hb0) ? (8'haf) : (8'hb7))) << ((&(8'hbe)) ^~ (8'hb6))))), 
parameter param196 = param195)
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire194;
  wire [(3'h7):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire signed [(3'h6):(1'h0)] wire163;
  wire signed [(5'h15):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(4'ha):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire128;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(5'h11):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire159;
  assign y = {wire194,
                 wire192,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire47,
                 wire49,
                 wire50,
                 wire92,
                 wire94,
                 wire95,
                 wire124,
                 wire126,
                 wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire159,
                 (1'h0)};
  module34 #() modinst48 (wire47, clk, wire31, wire29, wire33, wire32);
  assign wire49 = (8'ha6);
  assign wire50 = wire47;
  module51 #() modinst93 (wire92, clk, wire33, wire49, wire50, wire32);
  assign wire94 = wire50;
  assign wire95 = wire92[(4'hb):(4'h8)];
  module96 #() modinst125 (.clk(clk), .y(wire124), .wire99(wire95), .wire97(wire32), .wire98(wire50), .wire100(wire94));
  assign wire126 = (((($signed(wire33) >= (wire31 << wire50)) ?
                           $signed(wire29[(4'hc):(4'hc)]) : {wire33[(4'h9):(4'h9)]}) | $unsigned(wire33[(4'ha):(1'h0)])) ?
                       {wire29[(4'hb):(1'h1)]} : $signed({((wire92 ?
                               (7'h40) : wire32) && (+wire29)),
                           ((|wire94) && $unsigned(wire50))}));
  assign wire127 = (wire31 ?
                       (|$unsigned((wire30[(1'h1):(1'h1)] ?
                           (wire29 ?
                               wire124 : wire30) : $unsigned(wire29)))) : (-wire47));
  assign wire128 = (~^$signed($unsigned((wire94 ? wire47 : wire33))));
  assign wire129 = ((~&(wire94[(2'h3):(2'h3)] ~^ (+(wire95 > wire31)))) << {$unsigned((+wire124))});
  assign wire130 = {$signed((|(+$unsigned(wire126))))};
  assign wire131 = $signed((!wire92));
  assign wire132 = ($unsigned(wire129) != ({(^$signed(wire30)), wire129} ?
                       $unsigned($unsigned((8'hb6))) : $signed((&(wire129 != wire50)))));
  module133 #() modinst160 (.y(wire159), .wire136(wire49), .wire135(wire128), .wire137(wire92), .wire138(wire29), .wire134(wire33), .clk(clk));
  assign wire161 = $signed((8'hab));
  assign wire162 = (-$unsigned(($unsigned((wire33 ? wire47 : wire92)) ?
                       (wire161 >= {wire49, wire161}) : wire31)));
  assign wire163 = (wire127 < wire95);
  assign wire164 = wire163;
  assign wire165 = ($signed((-(wire126 > (wire33 ? wire159 : wire32)))) ?
                       ($unsigned((^wire92[(5'h12):(4'ha)])) ?
                           wire162[(1'h1):(1'h0)] : wire126) : wire49[(5'h13):(3'h4)]);
  module166 #() modinst193 (.wire167(wire132), .clk(clk), .wire169(wire129), .wire170(wire165), .y(wire192), .wire168(wire95));
  assign wire194 = $signed($signed($unsigned($unsigned(wire162))));
endmodule

module module166  (y, clk, wire170, wire169, wire168, wire167);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire170;
  input wire signed [(2'h2):(1'h0)] wire169;
  input wire signed [(4'h8):(1'h0)] wire168;
  input wire [(4'hd):(1'h0)] wire167;
  wire signed [(4'ha):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire189;
  wire signed [(4'ha):(1'h0)] wire188;
  wire signed [(4'hb):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire186;
  wire [(4'he):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire180;
  wire signed [(3'h4):(1'h0)] wire179;
  wire [(3'h4):(1'h0)] wire178;
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(3'h6):(1'h0)] reg182 = (1'h0);
  reg [(2'h2):(1'h0)] reg177 = (1'h0);
  reg [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg171 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 reg183,
                 reg182,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg171 <= wire168;
      reg172 <= (($unsigned($signed((7'h41))) ?
          {{(wire167 <= wire170)}} : (wire168 ?
              (~(wire169 << wire168)) : wire168[(3'h5):(2'h2)])) >= ($signed(($signed(wire167) ?
              $unsigned(wire168) : $unsigned(wire170))) ?
          $signed((~|(~&(8'ha5)))) : (wire168 ?
              (wire168 ?
                  wire170[(5'h10):(3'h7)] : reg171) : (^(wire167 >= wire167)))));
      if (((&($unsigned(reg171) ?
          $signed(reg172[(3'h4):(3'h4)]) : ((wire169 - reg171) ?
              {wire170,
                  wire170} : $unsigned(wire168)))) > $unsigned((reg172 <<< $unsigned($unsigned(wire167))))))
        begin
          reg173 <= {$signed((&wire169[(1'h1):(1'h0)])),
              ((+reg171) ?
                  ($unsigned(reg171) + {(wire169 ?
                          (8'hac) : reg171)}) : wire167[(4'hb):(4'h9)])};
          if ((+(wire168[(3'h4):(2'h2)] ?
              $signed((8'hb5)) : (&(|(wire168 ? reg171 : wire168))))))
            begin
              reg174 <= reg173[(4'he):(3'h7)];
              reg175 <= $unsigned((~|$unsigned(reg173[(4'he):(3'h6)])));
              reg176 <= reg171[(2'h3):(1'h0)];
              reg177 <= (!$signed(({(wire167 ? (8'ha0) : reg171),
                      $unsigned(reg175)} ?
                  (~&((8'ha7) ? reg175 : wire167)) : reg175[(3'h7):(3'h6)])));
            end
          else
            begin
              reg174 <= $unsigned(((^reg173[(2'h2):(2'h2)]) ^ reg171[(3'h5):(3'h4)]));
              reg175 <= $signed($signed(reg174[(5'h14):(4'hc)]));
              reg176 <= (!(wire170 ?
                  {$unsigned($unsigned(reg171)),
                      ((reg176 ? wire170 : wire167) ?
                          $unsigned(reg174) : (+(8'hbb)))} : $unsigned({(~&wire167)})));
              reg177 <= $unsigned(($unsigned(($signed((8'ha2)) ~^ {reg171,
                  reg173})) & (8'h9c)));
            end
        end
      else
        begin
          reg173 <= $unsigned(($unsigned((^~(!reg175))) <<< reg177[(1'h1):(1'h0)]));
          if (reg175[(2'h2):(2'h2)])
            begin
              reg174 <= $unsigned((~&(wire170[(4'hf):(2'h2)] * (&reg171[(1'h1):(1'h0)]))));
              reg175 <= $signed((reg173[(2'h3):(2'h3)] <<< ($unsigned($unsigned(wire170)) | (((7'h43) ?
                      reg173 : reg174) ?
                  reg177 : (reg172 > (8'hbc))))));
              reg176 <= ($unsigned((|(reg173 ?
                      ((8'ha4) ? reg173 : wire167) : reg176[(1'h1):(1'h0)]))) ?
                  reg171 : $unsigned(($signed((wire170 != wire170)) | $unsigned((reg173 >>> (8'hba))))));
              reg177 <= $unsigned((~reg177));
            end
          else
            begin
              reg174 <= $unsigned(reg177);
              reg175 <= (&$signed(($unsigned((!wire167)) && (((8'haf) ?
                  reg177 : wire170) ~^ $unsigned((8'hab))))));
              reg176 <= {{$unsigned((~|(~wire170))), reg172[(2'h3):(1'h0)]}};
              reg177 <= $signed({$signed(((reg173 ? reg171 : reg175) ?
                      $signed(reg173) : (reg171 ? reg176 : reg176)))});
            end
        end
    end
  assign wire178 = $signed($signed(reg172));
  assign wire179 = (reg177[(2'h2):(1'h0)] <= $signed(wire167));
  assign wire180 = wire168[(1'h0):(1'h0)];
  assign wire181 = $signed((~^{wire179}));
  always
    @(posedge clk) begin
      reg182 <= reg177[(2'h2):(1'h0)];
      reg183 <= $signed($signed(reg175));
    end
  assign wire184 = $signed(wire167[(4'hd):(4'hb)]);
  assign wire185 = (((reg173[(4'hb):(4'hb)] & reg177) ?
                           wire170[(1'h1):(1'h1)] : ((wire178[(2'h2):(1'h1)] ?
                                   (~&reg173) : (reg173 ? wire167 : reg176)) ?
                               ((+reg173) <<< {reg182}) : wire181[(4'h9):(3'h7)])) ?
                       (!$signed($unsigned((reg183 >> reg175)))) : (|$signed(((~reg175) >>> (wire169 ?
                           reg175 : reg175)))));
  assign wire186 = wire169;
  assign wire187 = (($signed(($unsigned(wire185) << $unsigned(wire170))) ?
                       wire178 : (reg175 | ($unsigned(reg177) ^~ (reg174 == wire179)))) != {$signed(((reg176 ?
                               wire184 : reg183) ?
                           (^~wire178) : ((8'hb5) ~^ wire181))),
                       (~(|reg182))});
  assign wire188 = ($unsigned(reg174[(3'h4):(1'h0)]) ~^ (8'haf));
  assign wire189 = (+(^~$unsigned($signed($unsigned(reg183)))));
  assign wire190 = $signed($signed($unsigned((7'h42))));
  assign wire191 = {((wire186[(5'h12):(4'hc)] <<< reg172[(4'h8):(3'h7)]) ?
                           $signed(((wire170 ?
                               wire179 : wire188) != (reg174 <= wire180))) : (wire167 ^ $signed(wire168[(3'h4):(3'h4)])))};
endmodule

module module133
#(parameter param157 = ({(~(~|(8'hbc))), (((&(8'hb8)) ^~ ((7'h42) ? (8'hae) : (8'hb8))) <<< ({(8'h9d), (8'ha3)} & ((7'h42) ? (8'ha4) : (8'hae))))} ? (~&(~&(((8'h9e) << (8'hab)) ? ((8'hb4) && (8'hba)) : (^~(8'hb9))))) : {({(^~(8'hba))} ? (((7'h43) <<< (7'h43)) ? {(8'ha5)} : (~&(8'ha8))) : (!(^~(8'hb2))))}), 
parameter param158 = ({((|param157) | param157)} <<< param157))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire138;
  input wire [(5'h13):(1'h0)] wire137;
  input wire [(4'h9):(1'h0)] wire136;
  input wire [(3'h6):(1'h0)] wire135;
  input wire signed [(4'hd):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire151;
  wire signed [(4'hf):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire139;
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire139,
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
                 (1'h0)};
  assign wire139 = (^~wire137[(4'hf):(4'hd)]);
  always
    @(posedge clk) begin
      if ($signed(wire138[(1'h1):(1'h0)]))
        begin
          reg140 <= $signed((wire134 != wire138));
          if ((~^($unsigned((8'ha0)) ?
              (8'hb2) : ({((8'hbc) > reg140),
                  reg140} >= wire135[(3'h5):(1'h0)]))))
            begin
              reg141 <= ((~|(&$unsigned((wire136 ? (8'ha7) : wire136)))) ?
                  $signed($unsigned($unsigned(((7'h44) ?
                      wire135 : reg140)))) : wire136);
              reg142 <= $signed($unsigned(reg141[(4'h9):(1'h1)]));
              reg143 <= wire137[(1'h1):(1'h1)];
            end
          else
            begin
              reg141 <= (+((8'hb8) ?
                  {{(~|wire136),
                          (wire137 ^ wire137)}} : $signed((-(^~wire135)))));
              reg142 <= wire134;
              reg143 <= $unsigned(wire139);
              reg144 <= $unsigned(($signed((8'hb9)) == ((~|wire135[(2'h2):(1'h0)]) ?
                  {(reg142 ? (8'ha0) : wire138),
                      $unsigned(wire135)} : $unsigned(((8'haa) ?
                      (8'ha9) : wire137)))));
            end
          reg145 <= ((wire135 ?
                  ({(wire134 + wire135)} ^~ $signed((|reg142))) : wire136) ?
              $signed((reg141[(5'h14):(4'hd)] && ((reg140 ?
                  reg141 : wire136) >>> $signed((8'ha6))))) : $unsigned(wire137));
          reg146 <= wire139;
          reg147 <= $unsigned((wire137 ?
              ((+(^reg142)) ?
                  wire136 : ((wire139 ? reg142 : reg140) ?
                      {reg144, reg143} : (-wire134))) : reg142[(3'h4):(2'h3)]));
        end
      else
        begin
          reg140 <= $unsigned($signed((($signed(reg143) ?
              wire135[(3'h4):(1'h0)] : (wire135 ?
                  (8'ha6) : reg142)) - ($unsigned(wire139) ?
              (reg146 ? reg144 : (8'ha8)) : (wire135 > (8'hbb))))));
          if ($unsigned((^~($signed((reg143 ? (8'hb7) : wire137)) ?
              wire138 : ($unsigned(wire134) ? (reg144 <<< reg142) : reg142)))))
            begin
              reg141 <= reg145[(4'hb):(3'h6)];
              reg142 <= reg144;
            end
          else
            begin
              reg141 <= (&$signed($signed(reg141)));
              reg142 <= (wire139[(3'h5):(2'h3)] <<< ({(8'hb4)} ?
                  {((reg146 ? wire136 : reg147) ?
                          reg144[(3'h4):(2'h3)] : (+wire138))} : reg147[(1'h1):(1'h1)]));
              reg143 <= $signed((^~(&wire134)));
              reg144 <= $unsigned($signed({reg141[(3'h6):(1'h0)]}));
            end
          if ($unsigned($unsigned((^~reg146[(5'h11):(2'h3)]))))
            begin
              reg145 <= (^~reg146);
              reg146 <= (reg146 <= $unsigned(wire134[(3'h4):(2'h3)]));
              reg147 <= (reg140 <<< (!wire139));
            end
          else
            begin
              reg145 <= $signed($unsigned(reg147[(3'h7):(3'h6)]));
              reg146 <= ($signed(reg140[(4'h8):(3'h7)]) - reg140);
              reg147 <= ((|(((!reg142) ?
                      ((8'hb9) ? reg145 : reg144) : {reg140}) ?
                  ($signed(wire134) ?
                      (wire134 ?
                          reg143 : (8'had)) : $signed(wire137)) : {wire138,
                      $unsigned(wire135)})) | $signed((($unsigned((7'h43)) != (reg147 * reg141)) << (+wire136))));
            end
          reg148 <= {(($signed(reg147[(1'h0):(1'h0)]) ?
                  ((^reg140) <= (^wire136)) : reg142) >>> {reg146,
                  ({reg140} ? (reg142 <= reg145) : (reg146 << wire135))}),
              reg141};
        end
      reg149 <= (~^$signed(((8'ha2) >>> $unsigned((reg148 == reg145)))));
    end
  assign wire150 = (~^$unsigned($signed(wire137[(1'h1):(1'h1)])));
  assign wire151 = $signed((~&reg147[(2'h2):(1'h1)]));
  assign wire152 = (^$unsigned((8'had)));
  assign wire153 = $signed(reg147);
  assign wire154 = $signed(($signed(({reg149} << $signed((8'ha5)))) ?
                       $signed(wire150) : (wire153 ?
                           (|(~&(7'h40))) : (~(wire137 ? reg148 : wire151)))));
  assign wire155 = ($unsigned((8'haf)) ^~ reg143);
  assign wire156 = {(|$unsigned($signed((reg144 ? wire152 : (8'hb2))))),
                       ({$signed($unsigned(reg146)), reg143[(4'ha):(4'ha)]} ?
                           (^~$signed($signed(wire135))) : {(((7'h42) || (8'had)) >> reg140)})};
endmodule

module module96
#(parameter param123 = ({{(|(!(7'h41)))}, (8'hb3)} && (((|(~&(8'ha8))) ~^ ((~^(8'hb1)) ? (+(8'hbc)) : (8'hbd))) ^ (8'ha5))))
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire100;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire [(3'h6):(1'h0)] wire98;
  input wire [(3'h5):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire101;
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
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
                 reg102,
                 (1'h0)};
  assign wire101 = $signed((((-wire97[(3'h4):(1'h1)]) ?
                       ((wire99 <<< wire99) >> $unsigned(wire100)) : (((8'ha9) ^~ wire97) || $unsigned(wire100))) < wire100));
  always
    @(posedge clk) begin
      reg102 <= (^~wire100);
    end
  assign wire103 = wire98;
  assign wire104 = $unsigned(wire103);
  assign wire105 = ($unsigned($signed($signed(reg102))) <<< wire99);
  assign wire106 = wire98;
  assign wire107 = wire97[(2'h2):(2'h2)];
  assign wire108 = $unsigned($unsigned((8'hbb)));
  always
    @(posedge clk) begin
      if ($unsigned(wire103))
        begin
          if ((~(+$unsigned(wire98))))
            begin
              reg109 <= ($unsigned(wire105) ?
                  (&wire97[(3'h4):(1'h1)]) : (8'hb9));
            end
          else
            begin
              reg109 <= wire97[(2'h3):(2'h3)];
            end
          if ({{{(+{wire108, reg102}), wire108[(5'h12):(4'hb)]},
                  $signed(wire108)},
              (!(^(~$unsigned(wire100))))})
            begin
              reg110 <= {(+$unsigned($unsigned((wire105 > wire108)))), wire103};
              reg111 <= (8'haf);
            end
          else
            begin
              reg110 <= $unsigned($unsigned($unsigned((wire100 >> $unsigned(reg111)))));
              reg111 <= {$unsigned((wire97[(3'h4):(3'h4)] ?
                      {wire98} : wire106)),
                  reg111};
              reg112 <= wire106;
            end
          reg113 <= $signed($signed(reg111));
          if ($unsigned($unsigned({$unsigned($signed(reg113))})))
            begin
              reg114 <= (wire103 << $signed($signed(($unsigned(reg102) == ((8'ha5) > wire108)))));
              reg115 <= $signed(reg102[(1'h0):(1'h0)]);
              reg116 <= reg114[(2'h3):(1'h0)];
              reg117 <= (wire103[(3'h6):(2'h2)] == ($unsigned((8'hb9)) ?
                  $unsigned((+reg112[(3'h7):(2'h2)])) : ($signed((reg109 - (8'hb0))) ?
                      wire105 : wire106[(1'h0):(1'h0)])));
            end
          else
            begin
              reg114 <= (reg115 <<< {(~&$signed(wire97))});
              reg115 <= $unsigned($unsigned(reg114[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg109 <= ((~&(~{(~|reg112)})) - {reg116});
        end
      reg118 <= {(8'h9d)};
      reg119 <= {((wire105 ?
              wire97[(3'h5):(3'h4)] : $signed((reg113 || wire97))) + $unsigned($signed({wire101,
              reg114}))),
          (((^reg110) ?
                  ((wire100 <= (8'ha6)) ?
                      reg112[(4'h8):(3'h7)] : reg113) : (((8'hab) ?
                          (8'hb6) : wire98) ?
                      $signed(reg115) : ((7'h43) < wire105))) ?
              ($signed((reg110 * wire99)) < {$unsigned(wire106)}) : $signed(wire100[(1'h0):(1'h0)]))};
    end
  assign wire120 = wire100[(4'h8):(2'h2)];
  assign wire121 = reg102;
  assign wire122 = wire120[(4'hb):(4'ha)];
endmodule

module module51
#(parameter param90 = ((((!((8'hbc) > (8'hac))) >= {((8'haa) ? (8'ha9) : (7'h42)), (+(7'h40))}) >= {(((8'ha8) < (8'hbb)) >>> ((7'h43) >>> (8'h9d))), (((8'ha7) ? (8'ha8) : (8'hae)) ? (8'hbc) : {(7'h42)})}) ^~ (~^({(+(8'hab))} - (((7'h44) || (8'hae)) != (^~(8'ha1)))))), 
parameter param91 = param90)
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire53;
  input wire [(2'h2):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire56;
  reg signed [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire68,
                 wire56,
                 reg86,
                 reg85,
                 reg83,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire56 = (&((wire54[(1'h0):(1'h0)] + $signed($signed(wire55))) | wire54[(4'he):(3'h4)]));
  always
    @(posedge clk) begin
      reg57 <= (~&(8'h9c));
      reg58 <= $unsigned(wire52);
    end
  always
    @(posedge clk) begin
      if ($unsigned({(^$unsigned((^reg58))), wire55}))
        begin
          reg59 <= wire52[(1'h0):(1'h0)];
          reg60 <= reg59;
          if (wire55)
            begin
              reg61 <= ((reg59 <= (wire55[(3'h4):(1'h1)] ?
                      $unsigned(reg57[(3'h4):(1'h1)]) : (~&$signed(wire52)))) ?
                  ((^reg59) ?
                      ((~&(wire55 <= wire54)) ?
                          wire54[(3'h4):(2'h2)] : wire52) : ({$unsigned(wire56)} <<< wire52)) : (+((wire56[(2'h3):(1'h1)] & {reg59,
                      wire56}) * (8'hab))));
              reg62 <= $signed(($unsigned((~^wire54[(5'h15):(4'hf)])) < $unsigned($unsigned(reg61[(3'h5):(2'h3)]))));
              reg63 <= $unsigned((~|wire54[(1'h0):(1'h0)]));
              reg64 <= ((reg57 | (~^wire52[(2'h2):(1'h0)])) ^~ (reg61 ?
                  ($signed($signed(reg62)) ?
                      (((8'h9f) || reg61) ?
                          wire53[(2'h3):(2'h2)] : (reg59 ?
                              wire53 : wire54)) : $unsigned({(8'hbb)})) : (reg61[(2'h2):(1'h1)] ^~ ({wire53} | reg62[(4'h8):(3'h5)]))));
            end
          else
            begin
              reg61 <= ({($signed(reg64[(3'h7):(2'h2)]) ?
                          ($signed((8'ha1)) && (wire52 == wire53)) : $signed(reg60)),
                      $signed(((!reg62) ?
                          (reg58 ? reg57 : reg64) : $unsigned((8'hb8))))} ?
                  $unsigned($signed(reg64[(4'he):(4'h8)])) : wire52);
              reg62 <= $unsigned(wire53[(2'h2):(2'h2)]);
              reg63 <= reg62[(3'h7):(2'h3)];
              reg64 <= $signed($unsigned((((8'hb0) ?
                  (reg61 ?
                      reg58 : wire52) : $signed(reg58)) >= ((8'hbe) - {wire53}))));
            end
          reg65 <= reg58[(2'h3):(2'h3)];
        end
      else
        begin
          reg59 <= (($signed(reg61[(1'h0):(1'h0)]) ?
              $unsigned($signed(reg57)) : ((+{reg65,
                  (8'ha9)}) >> reg60)) * reg60);
          reg60 <= $signed(((^((reg60 ^~ reg59) - {reg62, reg63})) ?
              (reg58 << {(^(8'hb5)), $signed((8'hb9))}) : (($signed(wire53) ?
                      reg58 : $signed(reg65)) ?
                  ({reg64} ?
                      wire54[(4'hb):(4'h9)] : (^~reg64)) : (+$unsigned(wire53)))));
          if ((8'h9e))
            begin
              reg61 <= $unsigned(((reg63[(3'h7):(3'h4)] || $signed((~|(8'hab)))) & (reg63 >= reg60[(2'h2):(1'h1)])));
            end
          else
            begin
              reg61 <= {$unsigned(wire52),
                  $signed((((wire52 & reg63) ?
                      $unsigned(wire54) : wire52[(1'h0):(1'h0)]) < reg61[(3'h7):(3'h7)]))};
              reg62 <= {$unsigned($unsigned($signed(((8'hb1) <= (8'ha8)))))};
            end
          if (reg65)
            begin
              reg63 <= $signed((~&(!reg65[(4'hc):(4'h8)])));
              reg64 <= $unsigned({(8'hb3)});
              reg65 <= {wire54[(5'h11):(1'h0)],
                  (((8'hb0) ?
                      reg61[(4'h9):(2'h3)] : wire55[(4'hb):(3'h6)]) << (|(~^$signed(reg64))))};
            end
          else
            begin
              reg63 <= ((~&(reg60[(1'h1):(1'h0)] >> reg58)) ?
                  $signed((~|(8'ha6))) : $unsigned(wire55));
              reg64 <= reg65[(5'h13):(4'hd)];
              reg65 <= reg60;
              reg66 <= (-reg57[(3'h4):(1'h1)]);
            end
          reg67 <= reg60[(1'h0):(1'h0)];
        end
    end
  assign wire68 = (8'hb2);
  always
    @(posedge clk) begin
      reg69 <= $unsigned($signed((reg63 ? {(!reg67)} : wire55)));
      reg70 <= (!$signed($signed($unsigned((reg69 ? reg59 : wire53)))));
      if ($signed(reg62[(3'h7):(3'h6)]))
        begin
          reg71 <= ($signed($signed(reg66[(2'h3):(1'h0)])) ?
              ((!(8'hae)) ?
                  {$unsigned($signed((8'hae)))} : (reg58[(2'h3):(1'h0)] | ($signed(reg63) + (reg69 ?
                      reg65 : reg61)))) : ($unsigned(reg59) ^~ (reg62[(4'h9):(4'h8)] ?
                  {reg57, (!wire56)} : (-(reg61 * (8'hb4))))));
          reg72 <= (+$unsigned(reg67));
          if (wire52[(1'h1):(1'h1)])
            begin
              reg73 <= (+$signed((7'h40)));
              reg74 <= wire68;
            end
          else
            begin
              reg73 <= $unsigned($unsigned(reg61));
            end
        end
      else
        begin
          reg71 <= $signed({(reg71[(2'h2):(2'h2)] && {(reg62 << reg74),
                  wire55[(3'h4):(3'h4)]})});
          reg72 <= $signed($signed(reg71));
          reg73 <= reg73[(4'hd):(4'ha)];
          reg74 <= $signed(reg72[(4'hb):(4'ha)]);
        end
      if ((reg70 ?
          (wire53[(3'h6):(3'h6)] ? reg70 : reg69) : $unsigned((8'ha5))))
        begin
          reg75 <= reg60[(1'h1):(1'h0)];
          reg76 <= (&(($signed(wire68[(3'h5):(3'h5)]) ?
                  $unsigned(((8'ha0) ? reg70 : reg66)) : {(wire68 >>> reg75)}) ?
              (|{wire54, (|(8'hb6))}) : $unsigned(reg74)));
        end
      else
        begin
          reg75 <= (reg75 ?
              (!reg74) : (~^($signed(reg64[(1'h1):(1'h1)]) ?
                  reg67[(1'h1):(1'h1)] : ((reg65 ? reg75 : reg67) ?
                      $signed(reg59) : (wire55 - wire55)))));
          reg76 <= reg63;
          reg77 <= $signed(reg57);
        end
      reg78 <= wire56[(3'h4):(1'h0)];
    end
  assign wire79 = reg58;
  assign wire80 = $signed((~&reg78));
  assign wire81 = (((((reg66 ^~ reg59) ?
                              (+reg76) : $signed(reg63)) < ((reg71 <<< wire68) ?
                              $unsigned(reg75) : {(8'hb6)})) ?
                          reg77[(1'h0):(1'h0)] : $signed($unsigned((reg63 ?
                              reg70 : reg75)))) ?
                      $unsigned($signed(($unsigned(wire79) ?
                          (reg59 ?
                              reg75 : reg75) : $unsigned(reg60)))) : ($unsigned($unsigned({wire56})) ?
                          (((-wire79) >= reg69[(1'h0):(1'h0)]) ?
                              reg70 : (reg78[(4'hb):(4'h9)] ?
                                  wire54 : {wire55,
                                      reg61})) : (reg67[(5'h13):(4'he)] ?
                              $unsigned($signed((8'hbb))) : ($unsigned(reg71) >= reg67))));
  assign wire82 = reg76[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg83 <= reg69;
    end
  assign wire84 = ((8'hb1) ^ $signed((($signed(reg66) <<< (&reg78)) - $signed(wire68))));
  always
    @(posedge clk) begin
      reg85 <= reg58;
      reg86 <= $signed(wire56);
    end
  assign wire87 = {wire68[(3'h4):(2'h2)],
                      ((8'hac) | ((8'hb4) ?
                          $signed((reg74 ?
                              reg74 : wire53)) : ((-wire54) - {reg66})))};
  assign wire88 = reg72[(4'ha):(3'h6)];
  assign wire89 = reg78[(4'hb):(1'h0)];
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire39 = $unsigned($unsigned(wire37[(4'hc):(3'h6)]));
  assign wire40 = ($signed((!(wire36[(1'h0):(1'h0)] ?
                      $unsigned(wire39) : $signed(wire36)))) != (($signed((|wire35)) ?
                          ((wire37 == wire37) ?
                              (wire38 <<< wire37) : ((8'hbe) || wire39)) : $unsigned((wire36 ?
                              wire36 : wire35))) ?
                      {($signed(wire39) ?
                              wire36[(2'h2):(1'h1)] : (wire38 != wire35))} : $unsigned((wire35 ?
                          $unsigned(wire37) : (-(8'hbb))))));
  assign wire41 = wire39[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ($unsigned(wire37))
        begin
          reg42 <= $signed(wire37);
        end
      else
        begin
          reg42 <= wire36;
          reg43 <= (8'had);
          reg44 <= (8'ha5);
          reg45 <= $signed({(wire39 ?
                  (^((8'hb3) ? wire36 : wire35)) : ((wire41 ?
                      (8'hb2) : reg44) >= wire35[(1'h0):(1'h0)])),
              wire35});
        end
      reg46 <= (-reg42);
    end
endmodule
