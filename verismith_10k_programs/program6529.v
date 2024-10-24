module top
#(parameter param177 = ((7'h42) - (~&(8'hb9))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1bf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire [(5'h10):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire166;
  wire [(3'h7):(1'h0)] wire165;
  wire signed [(3'h7):(1'h0)] wire164;
  wire signed [(5'h10):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire102,
                 wire97,
                 wire23,
                 wire22,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg99,
                 reg100,
                 reg101,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 (1'h0)};
  assign wire5 = {{wire4[(4'hb):(2'h3)]}};
  assign wire6 = {(wire1 == (^$unsigned($signed(wire4)))),
                     ($unsigned($unsigned((~|wire4))) && (8'h9c))};
  assign wire7 = $unsigned((|($unsigned({wire1}) ^~ $signed((~wire0)))));
  always
    @(posedge clk) begin
      reg8 <= $unsigned((~^(({(8'h9d),
          wire4} * $unsigned(wire0)) >= $unsigned($signed(wire2)))));
      if (wire3)
        begin
          reg9 <= (($signed(((wire2 ? (8'hab) : wire3) > $unsigned(reg8))) ?
              (((~|wire2) ?
                  wire5[(4'h8):(2'h3)] : (wire0 >>> wire6)) | $unsigned($unsigned(wire3))) : $signed((&(^wire4)))) != (({wire7,
                  wire1[(3'h4):(1'h0)]} ?
              (-(~(8'ha8))) : {reg8[(2'h3):(1'h0)]}) & wire2));
          if ($unsigned(($signed({(reg9 ? wire3 : reg9)}) ?
              $signed((|wire2[(4'ha):(2'h2)])) : (reg9 ?
                  wire3 : $unsigned({reg8, wire7})))))
            begin
              reg10 <= (8'hbb);
              reg11 <= (wire5 ?
                  $signed((({(8'hbc),
                      (8'ha9)} | reg10[(1'h1):(1'h0)]) | (!wire6))) : wire3);
              reg12 <= $signed(reg8[(1'h0):(1'h0)]);
              reg13 <= wire3;
              reg14 <= reg10;
            end
          else
            begin
              reg10 <= $unsigned(wire2[(2'h3):(1'h0)]);
              reg11 <= $unsigned($unsigned({((wire4 + (8'hb9)) <<< wire3[(5'h12):(3'h7)])}));
              reg12 <= (^(~|(wire0 ?
                  $unsigned((+(8'ha1))) : (~(wire2 ? reg13 : wire0)))));
              reg13 <= ((~^(~&{reg8, (&wire1)})) ?
                  $signed({wire4,
                      {(wire6 ? reg13 : wire6),
                          ((8'ha8) << wire6)}}) : (($unsigned((reg13 && wire6)) > wire4) ^~ (((reg8 ?
                          wire0 : (8'hb9)) ^ reg8) ?
                      ((&reg8) * (wire6 ? wire6 : (8'hbb))) : (~|(8'ha0)))));
              reg14 <= wire2[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg9 <= ((((wire0[(4'hc):(4'hb)] ? {wire0} : reg11) ?
                  (wire7[(2'h2):(1'h0)] >> (+wire5)) : wire4) ?
              (wire0[(3'h5):(2'h2)] ?
                  wire3 : reg11[(2'h3):(1'h1)]) : reg13) * $unsigned($unsigned(((^~wire6) <<< $signed((7'h44))))));
        end
      if ({(~|$signed((8'hb7)))})
        begin
          if ((^$unsigned((&(reg8[(1'h1):(1'h0)] ?
              $unsigned(wire6) : reg14[(2'h2):(1'h0)])))))
            begin
              reg15 <= (8'haa);
              reg16 <= reg8;
              reg17 <= reg11[(3'h4):(2'h2)];
              reg18 <= {{(^~wire0[(3'h4):(1'h0)])}};
              reg19 <= $unsigned(((8'haa) ? wire0 : wire6));
            end
          else
            begin
              reg15 <= (8'ha9);
              reg16 <= (-$unsigned($signed(((wire6 >> reg12) ?
                  $unsigned(wire6) : (8'hbb)))));
              reg17 <= wire4[(3'h5):(3'h4)];
              reg18 <= $signed({(-((reg9 <= reg9) ?
                      (reg19 != wire1) : (~&wire4)))});
            end
        end
      else
        begin
          reg15 <= {reg15};
          reg16 <= reg14;
          reg17 <= reg19;
        end
      reg20 <= (((((wire1 ? (7'h40) : reg16) ?
                  (wire6 >>> (8'hb8)) : ((8'hb5) ? wire1 : (8'ha8))) ?
              ((^~reg9) ^~ (^~(8'hbe))) : ((wire3 ? reg16 : reg18) ?
                  $unsigned(reg17) : $signed(reg8))) & (!{(~reg15)})) ?
          reg16 : $unsigned((8'haf)));
    end
  assign wire21 = {(^$signed(((wire1 <= reg18) ?
                          (wire7 ? (8'hac) : reg12) : reg15[(2'h3):(1'h1)]))),
                      $unsigned((($unsigned(reg12) ?
                              (reg11 ? reg13 : reg8) : wire6) ?
                          wire6 : $unsigned((^reg12))))};
  assign wire22 = ((reg10[(3'h5):(3'h4)] - (wire21 ?
                      {wire3[(3'h5):(1'h0)],
                          ((8'ha0) * wire4)} : reg17)) <<< ($unsigned({(reg19 ?
                          reg14 : (7'h43))}) >= $signed((~reg15[(3'h6):(3'h4)]))));
  assign wire23 = $signed((reg20 ^~ $signed($signed($unsigned(wire22)))));
  module24 #() modinst98 (wire97, clk, reg14, wire6, reg15, reg10, wire4);
  always
    @(posedge clk) begin
      if (reg15)
        begin
          reg99 <= wire22[(3'h7):(3'h5)];
        end
      else
        begin
          if ($signed($signed((^~(+$signed(wire3))))))
            begin
              reg99 <= (~|{reg18[(2'h2):(1'h1)], wire3[(2'h2):(1'h1)]});
              reg100 <= {(~&reg10[(2'h3):(1'h0)]), wire6[(3'h5):(1'h0)]};
              reg101 <= (8'ha9);
            end
          else
            begin
              reg99 <= wire22;
              reg100 <= (^~($signed(wire22) << (reg13 ?
                  ((wire21 ? reg11 : wire23) >= (~^reg11)) : reg10)));
              reg101 <= ($signed((~^wire2[(4'hb):(4'hb)])) >= reg12[(4'hc):(4'hc)]);
            end
        end
    end
  assign wire102 = (~|$signed($signed($unsigned(reg9))));
  module103 #() modinst163 (.clk(clk), .wire107(wire0), .wire104(reg12), .wire105(reg8), .y(wire162), .wire106(wire2));
  assign wire164 = ($unsigned((~|$unsigned($signed(wire3)))) ?
                       wire22[(5'h13):(2'h3)] : (($signed($signed((8'had))) ?
                           (reg13 + (!wire4)) : reg15[(4'h9):(2'h2)]) + reg14[(3'h7):(2'h3)]));
  assign wire165 = (8'hac);
  assign wire166 = $signed(wire164);
  assign wire167 = ($signed($signed({((8'hab) + wire1),
                       (reg13 ?
                           wire7 : wire22)})) <<< (^~$unsigned(reg99[(3'h7):(3'h5)])));
  always
    @(posedge clk) begin
      reg168 <= ((8'ha7) ^~ $signed((reg16[(1'h0):(1'h0)] + reg101)));
      reg169 <= (($signed(reg12[(4'hb):(1'h1)]) ?
              (reg17 ^ ($unsigned(reg8) - (wire21 ?
                  wire22 : reg16))) : $unsigned({$unsigned(reg101)})) ?
          wire1[(4'hc):(4'hb)] : reg15);
      reg170 <= (((^~(~&(+wire165))) >> reg11[(3'h5):(1'h0)]) ?
          (8'hac) : (-($unsigned(wire3) ? wire7[(3'h5):(3'h5)] : wire3)));
      reg171 <= wire6;
      if ({$signed(reg169)})
        begin
          reg172 <= $unsigned((reg8[(4'ha):(4'h9)] ?
              $signed(((+(8'h9f)) ?
                  reg8[(5'h11):(4'h8)] : $signed((8'h9d)))) : {$unsigned((+reg14)),
                  reg99}));
        end
      else
        begin
          reg172 <= $signed($unsigned(wire102));
        end
    end
  assign wire173 = reg17[(3'h6):(2'h2)];
  assign wire174 = wire3[(4'h9):(4'h9)];
  module109 #() modinst176 (wire175, clk, wire22, wire162, reg11, wire7, wire97);
endmodule

module module103
#(parameter param160 = {(((((8'ha0) ~^ (7'h42)) != {(8'ha8), (8'hbe)}) ? (|((8'hbe) ? (8'hbc) : (8'hae))) : (+{(8'ha2), (8'hb4)})) & (8'haf)), (({{(7'h43)}, (8'hb5)} ? ((8'hb2) ? {(8'hae), (8'ha8)} : ((8'hac) ^ (7'h44))) : (8'ha6)) <= (8'hab))}, 
parameter param161 = {param160})
(y, clk, wire104, wire105, wire106, wire107);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire104;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(5'h11):(1'h0)] wire106;
  input wire signed [(4'hb):(1'h0)] wire107;
  wire signed [(4'h8):(1'h0)] wire149;
  wire signed [(5'h13):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire138;
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(2'h2):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(3'h7):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  assign y = {wire149,
                 wire140,
                 wire108,
                 wire138,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire108 = (8'hbe);
  module109 #() modinst139 (wire138, clk, wire104, wire108, wire105, wire107, wire106);
  assign wire140 = $unsigned($signed(wire106));
  always
    @(posedge clk) begin
      reg141 <= $unsigned(wire106[(3'h6):(2'h2)]);
      if ($signed({(~|$signed($unsigned(wire138)))}))
        begin
          reg142 <= wire106[(2'h3):(1'h0)];
          reg143 <= $unsigned(wire107);
          reg144 <= $unsigned((($unsigned((wire108 == reg143)) ?
              (^~{reg141, reg141}) : reg143) <<< wire138[(3'h5):(3'h4)]));
          reg145 <= wire108[(4'h9):(1'h1)];
        end
      else
        begin
          if ((^~$signed(wire106)))
            begin
              reg142 <= $signed(($unsigned(wire107[(4'hb):(3'h4)]) >> (wire107[(3'h7):(3'h7)] >= (7'h41))));
              reg143 <= ($unsigned({(((8'hb4) ? reg145 : wire138) ?
                      (reg143 ? wire104 : reg142) : (reg145 ?
                          wire104 : reg143)),
                  (~$signed(wire138))}) >>> (+wire108[(4'h9):(4'h8)]));
              reg144 <= $signed({wire107[(2'h3):(2'h3)],
                  (((wire104 == wire140) - {wire138}) ?
                      wire138[(4'hb):(1'h1)] : (((8'ha7) ? (8'h9c) : reg141) ?
                          (wire138 & (8'ha4)) : $unsigned(wire138)))});
              reg145 <= (reg141[(3'h4):(1'h0)] < $unsigned($unsigned(((&(7'h43)) & (wire140 < reg142)))));
              reg146 <= wire105;
            end
          else
            begin
              reg142 <= (~&((8'ha8) ?
                  (&$unsigned($unsigned((8'hbb)))) : (+$signed((wire140 ?
                      reg142 : wire108)))));
              reg143 <= (+$unsigned($signed($signed((reg141 ?
                  reg143 : reg146)))));
              reg144 <= ((|(((&wire104) | $signed(wire105)) ?
                  reg144[(1'h0):(1'h0)] : ($signed(wire138) ^ (reg141 << reg143)))) - ($signed({(+reg145)}) ?
                  (reg146[(1'h0):(1'h0)] && (wire105[(3'h7):(2'h2)] ?
                      (^~wire140) : reg146)) : (wire104[(4'h9):(1'h0)] ?
                      $unsigned($signed(reg142)) : $unsigned(reg144))));
            end
          reg147 <= ((8'ha6) >>> (+(^((reg144 ?
              reg144 : reg143) * $signed((8'hb4))))));
        end
      reg148 <= wire106[(2'h3):(2'h2)];
    end
  assign wire149 = $signed(wire106);
  always
    @(posedge clk) begin
      if (reg148)
        begin
          if ($unsigned((&(wire138 >> ((wire138 & (8'ha3)) || $unsigned(reg143))))))
            begin
              reg150 <= $unsigned($unsigned($signed(($unsigned(wire138) ?
                  $signed(reg145) : reg148))));
            end
          else
            begin
              reg150 <= {{$unsigned($signed($signed(reg142))),
                      {((!wire138) ? wire108[(4'ha):(4'h8)] : wire140),
                          reg148[(5'h11):(5'h10)]}},
                  ((!(~wire140)) ?
                      (((~^reg150) ?
                          (~^wire140) : (wire108 ?
                              wire149 : wire106)) > wire138[(4'h9):(3'h4)]) : reg145)};
            end
          reg151 <= $unsigned((~&(($signed(wire105) ?
              $signed(wire140) : (^wire108)) | (~&{reg145}))));
        end
      else
        begin
          reg150 <= $unsigned(($unsigned(reg143[(1'h0):(1'h0)]) ?
              wire138[(3'h7):(1'h0)] : ($signed((+reg145)) & {(reg147 < wire138)})));
          reg151 <= (|(($unsigned((&reg148)) == (^~(wire107 + reg147))) <<< reg142[(1'h1):(1'h1)]));
          reg152 <= {$unsigned((~&$unsigned(wire104))),
              (($signed($signed(reg146)) <<< reg147) ?
                  (reg141[(2'h2):(1'h0)] >> (-(8'hb9))) : (wire104 ?
                      reg144 : reg151))};
          reg153 <= $unsigned($signed((~&{((8'ha2) ? wire104 : (8'hbd)),
              (reg150 <<< (8'hbb))})));
          if ((^({($unsigned(reg148) * (-reg153)),
                  {(reg153 ? wire140 : wire106)}} ?
              reg146[(3'h6):(1'h1)] : (~|{$signed(wire149)}))))
            begin
              reg154 <= reg143;
              reg155 <= $unsigned((^(~&(&(wire107 >= reg143)))));
            end
          else
            begin
              reg154 <= (~^reg143[(2'h2):(1'h1)]);
              reg155 <= ({$signed((8'hb0))} ?
                  (-{(^~$unsigned(reg145))}) : wire108);
              reg156 <= ($signed($signed($unsigned((wire140 ?
                  wire107 : wire106)))) + ($signed((&(8'ha8))) ?
                  reg153[(2'h2):(1'h0)] : (wire140 || (wire104 & $signed(reg146)))));
              reg157 <= (-wire138);
            end
        end
      reg158 <= (8'haf);
      reg159 <= (^~wire138[(4'h8):(2'h2)]);
    end
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire [(4'h9):(1'h0)] wire26;
  input wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire95;
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  assign y = {wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire57,
                 wire58,
                 wire95,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= wire27[(3'h4):(2'h3)];
      if ((($signed(wire26[(4'h8):(2'h3)]) <<< {((wire27 ?
              wire25 : wire28) ^ (reg30 <<< wire25))}) >= $unsigned((~$signed(wire29)))))
        begin
          reg31 <= {($unsigned($unsigned(wire29[(4'hc):(4'hb)])) ?
                  wire28 : $unsigned(wire27[(1'h1):(1'h1)])),
              $unsigned(((wire28[(3'h4):(2'h3)] != {wire27}) ?
                  wire29 : ((wire28 == reg30) ?
                      wire25 : (wire27 ? wire27 : wire27))))};
        end
      else
        begin
          reg31 <= $signed(($signed($unsigned({wire26})) ?
              wire29[(5'h10):(4'hd)] : wire29[(3'h5):(1'h0)]));
          reg32 <= wire28[(3'h4):(1'h1)];
          reg33 <= (((~|$unsigned(wire26[(2'h2):(1'h1)])) != wire28[(1'h0):(1'h0)]) ?
              $signed((({reg30} - wire25[(2'h3):(1'h1)]) ?
                  ($unsigned((8'hbc)) ?
                      (wire28 || (8'hbf)) : reg32[(1'h0):(1'h0)]) : $unsigned((wire25 && wire26)))) : $unsigned($signed(wire29)));
          reg34 <= ($signed(wire28) ?
              ((wire29 ?
                  {{wire28,
                          reg30}} : wire25[(1'h1):(1'h0)]) == wire26) : $signed((!$unsigned(wire27))));
          reg35 <= {reg31[(3'h6):(2'h2)]};
        end
      reg36 <= ((~|(reg30[(1'h0):(1'h0)] >= reg31)) ?
          (|(~&$signed((reg30 ?
              reg33 : wire25)))) : $unsigned((reg30 << wire28)));
    end
  assign wire37 = wire25[(2'h2):(2'h2)];
  assign wire38 = ({{(reg30 ~^ $signed((8'hb2)))}} ?
                      {($unsigned(reg31[(4'hc):(4'h9)]) * $signed(wire27[(4'ha):(3'h4)])),
                          wire26[(2'h3):(1'h1)]} : reg34);
  assign wire39 = reg35[(1'h1):(1'h1)];
  assign wire40 = reg32[(2'h2):(2'h2)];
  assign wire41 = wire26;
  module42 #() modinst56 (wire55, clk, reg33, wire40, reg32, reg34);
  assign wire57 = ({wire28[(4'h8):(3'h6)], $unsigned($unsigned({wire55}))} ?
                      (reg30[(3'h7):(3'h6)] >> wire29[(3'h6):(3'h4)]) : (wire55 << {$unsigned({reg36,
                              wire29})}));
  assign wire58 = $unsigned(((-$unsigned((|(7'h41)))) + (8'hbc)));
  module59 #() modinst96 (.wire60(wire29), .wire62(reg35), .y(wire95), .clk(clk), .wire61(wire25), .wire63(wire27));
endmodule

module module59
#(parameter param94 = (&((8'hbe) ? (((|(8'hb6)) & {(8'hb6), (8'h9d)}) << (((8'hb7) ? (8'hae) : (8'ha3)) ? ((8'hbb) ? (8'ha8) : (8'hb7)) : ((8'hbd) == (8'hbe)))) : (+((&(8'haa)) ? (|(8'hb3)) : (^~(8'hbf)))))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire63;
  input wire signed [(5'h10):(1'h0)] wire62;
  input wire [(5'h12):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire64;
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire70,
                 wire69,
                 wire64,
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
                 reg72,
                 reg71,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire64 = $unsigned((wire62[(4'hb):(1'h0)] ?
                      (+($signed((8'hb2)) << (&wire63))) : (8'ha1)));
  always
    @(posedge clk) begin
      reg65 <= {(wire60 * (~|$unsigned($signed((8'haf)))))};
      reg66 <= (wire61 | (((!(wire64 ? (8'h9c) : wire63)) ?
          $signed({wire64,
              wire62}) : $signed($signed(wire61))) << (wire60[(1'h0):(1'h0)] ?
          ({wire62} ? wire63[(3'h5):(3'h5)] : (reg65 && wire60)) : wire63)));
      reg67 <= ($unsigned({$signed($unsigned(wire61))}) ?
          ($unsigned((~wire60[(2'h2):(2'h2)])) == (!((^~wire60) ^~ wire60[(1'h1):(1'h0)]))) : (^((reg66[(3'h5):(2'h2)] ?
              wire62[(3'h5):(1'h1)] : (~^wire62)) ~^ ((^wire63) ?
              (wire62 ? (8'hba) : reg66) : (wire61 ? reg66 : wire64)))));
      reg68 <= (((wire62[(2'h3):(1'h1)] + reg65) ?
              (~&(((8'hba) ? reg66 : wire64) ?
                  wire61 : ((8'ha5) ?
                      reg65 : reg67))) : {(reg66[(4'hf):(1'h1)] + (^~reg67)),
                  ({wire64, wire64} != {reg67, wire60})}) ?
          $unsigned((~(~{reg66}))) : reg66);
    end
  assign wire69 = (|reg65);
  assign wire70 = ({$unsigned(wire61), (8'ha7)} ?
                      (^wire63[(4'ha):(3'h6)]) : ((8'ha2) - (reg65[(1'h0):(1'h0)] - (8'hb2))));
  always
    @(posedge clk) begin
      if (($signed((((wire60 ? reg67 : (8'ha1)) ?
              $signed((8'h9c)) : (reg66 + (8'had))) - $signed(wire60))) ?
          $signed($unsigned((^~wire70[(1'h1):(1'h1)]))) : wire61[(5'h11):(4'hc)]))
        begin
          if ((wire70 < $signed(({(reg66 ? wire63 : wire70)} - wire70))))
            begin
              reg71 <= wire70;
              reg72 <= wire70;
              reg73 <= reg72;
            end
          else
            begin
              reg71 <= (8'had);
              reg72 <= reg66[(4'hd):(1'h0)];
              reg73 <= $signed(wire60[(1'h1):(1'h0)]);
              reg74 <= ({(8'ha5),
                  (wire61[(4'h9):(4'h8)] ?
                      $unsigned($signed(reg67)) : ((~|(8'ha3)) ?
                          (reg67 ? reg73 : reg68) : (wire60 ?
                              reg66 : wire61)))} >> ($signed($signed(wire69[(2'h3):(2'h2)])) <= reg72));
              reg75 <= (^~$unsigned((+($signed((8'ha6)) >> $signed(reg72)))));
            end
          if (wire60[(1'h0):(1'h0)])
            begin
              reg76 <= {($signed($signed($unsigned((8'hbd)))) ?
                      $unsigned($unsigned((~&reg72))) : $signed($signed(wire70[(3'h6):(2'h2)])))};
              reg77 <= wire64;
              reg78 <= $signed(reg75);
            end
          else
            begin
              reg76 <= $unsigned(($unsigned({$signed((8'hab)),
                      (reg66 ? wire61 : (8'h9e))}) ?
                  (((^wire63) ? (8'hb8) : $unsigned(reg77)) ?
                      reg76[(1'h1):(1'h0)] : {((8'h9e) <<< reg67)}) : wire64[(3'h6):(3'h6)]));
            end
          reg79 <= (((reg72[(3'h5):(1'h1)] ^ $signed((reg74 ?
              reg68 : wire69))) * ($unsigned($unsigned(reg68)) < reg76)) <= (8'ha9));
          reg80 <= (({(!((8'h9f) >> reg79)),
                  ((reg75 + reg71) <= {reg72})} || reg75) ?
              reg73[(2'h3):(1'h1)] : $signed($signed((^$unsigned(wire62)))));
          reg81 <= $signed($signed(wire63));
        end
      else
        begin
          reg71 <= ((~^($unsigned($unsigned(reg68)) ^ $signed({reg74}))) - wire63);
          reg72 <= (wire69 >= $signed(reg77[(4'h9):(1'h1)]));
          reg73 <= ((reg74[(3'h7):(3'h7)] ?
              (((reg75 ? reg65 : wire62) >= reg67) ?
                  reg68[(2'h3):(1'h1)] : (^$signed(wire60))) : (reg71[(2'h3):(1'h1)] ?
                  ((&reg77) ^~ $unsigned(reg76)) : (wire70 ?
                      $unsigned(reg72) : $signed(reg66)))) >>> (((^reg80[(2'h2):(1'h1)]) < (~|$signed(reg80))) >= reg76[(2'h3):(1'h1)]));
        end
      reg82 <= reg81[(1'h1):(1'h1)];
      if ($signed({$unsigned(((|wire64) ? (reg80 + wire63) : $signed(reg78)))}))
        begin
          if (($unsigned(wire60) ? $unsigned(wire63) : reg73))
            begin
              reg83 <= $signed({{wire60, $unsigned((8'hb7))}});
              reg84 <= reg72[(1'h0):(1'h0)];
            end
          else
            begin
              reg83 <= ((~^$signed((8'hb0))) ?
                  reg73[(3'h6):(2'h2)] : reg75[(3'h6):(2'h3)]);
              reg84 <= $signed($signed((^($signed(reg71) >>> reg80[(1'h1):(1'h0)]))));
            end
        end
      else
        begin
          reg83 <= (~&(($signed((!reg82)) ?
              ((reg68 ? reg71 : wire63) & reg83) : ((wire69 ? reg80 : reg73) ?
                  (^reg79) : ((8'hb2) ? (8'had) : reg65))) & (((~^reg71) ?
              (-(8'h9e)) : {reg73}) >> $unsigned((reg72 <= reg79)))));
          reg84 <= reg73[(1'h0):(1'h0)];
        end
      reg85 <= (($unsigned(reg76) ?
          {reg81,
              $unsigned((reg67 ?
                  reg72 : reg66))} : wire61[(4'he):(2'h2)]) || (wire62[(4'ha):(4'h8)] ?
          reg75 : (wire60 ?
              {reg77[(3'h7):(1'h0)], (^reg82)} : wire70[(1'h1):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg86 <= reg84;
    end
  assign wire87 = reg71[(1'h0):(1'h0)];
  assign wire88 = reg68[(3'h6):(1'h0)];
  assign wire89 = reg77;
  assign wire90 = ($unsigned((((reg65 != reg77) ?
                          reg74[(4'ha):(2'h2)] : reg80[(2'h3):(1'h0)]) ?
                      (8'hb6) : wire63[(2'h2):(1'h1)])) >> ($unsigned((reg68 ?
                          reg75[(3'h6):(3'h5)] : (^~wire64))) ?
                      $unsigned((^~(wire61 != reg82))) : ($signed(wire64[(1'h1):(1'h0)]) ?
                          ((reg85 ? reg66 : reg67) ?
                              (reg84 & (8'hb7)) : wire88[(5'h10):(3'h4)]) : {$unsigned(reg77)})));
  assign wire91 = $unsigned(reg66[(3'h6):(1'h0)]);
  assign wire92 = {(^(wire69 <<< {(reg65 >>> reg72), reg66}))};
  assign wire93 = {($unsigned(($unsigned(reg81) <= $unsigned(wire89))) ?
                          {(wire89 ?
                                  (reg77 ?
                                      reg71 : reg83) : $unsigned(reg80))} : (8'hbf))};
endmodule

module module42
#(parameter param53 = (((~(8'hbd)) >>> (^{((8'hab) << (8'hac)), (+(8'hb2))})) > (!(&((~&(8'hb5)) >>> ((8'hac) ? (8'hb0) : (8'had)))))), 
parameter param54 = (^~{({(~|param53)} ? (param53 ^ (-(8'ha9))) : param53)}))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire signed [(4'hb):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  assign y = {wire52, wire51, wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = (&(wire44 <<< wire45[(1'h1):(1'h1)]));
  assign wire48 = wire46[(2'h3):(1'h0)];
  assign wire49 = (((wire45 ^~ (~|$signed((8'hb5)))) ?
                          wire46 : $unsigned(wire46[(3'h7):(1'h0)])) ?
                      wire48 : wire47);
  assign wire50 = wire49;
  assign wire51 = (($signed((wire48 + wire50[(2'h2):(2'h2)])) & $unsigned({$signed(wire44),
                      {wire46}})) ^~ wire43);
  assign wire52 = $unsigned(wire50[(1'h0):(1'h0)]);
endmodule

module module109  (y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire114;
  input wire [(4'ha):(1'h0)] wire113;
  input wire [(4'h8):(1'h0)] wire112;
  input wire [(4'hb):(1'h0)] wire111;
  input wire [(5'h11):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire136;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire128,
                 wire117,
                 wire116,
                 wire115,
                 reg134,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
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
                 (1'h0)};
  assign wire115 = (((wire112[(2'h2):(1'h1)] || wire113) ?
                           (($unsigned(wire110) ?
                               $unsigned(wire110) : (8'hb0)) <<< wire112) : $signed($signed(wire111))) ?
                       wire112 : {$signed(($signed(wire114) ?
                               $unsigned(wire114) : wire114[(3'h5):(3'h4)]))});
  assign wire116 = $signed(((($signed(wire113) ?
                               {wire114} : (wire115 ~^ wire113)) ?
                           ($signed(wire112) ?
                               (wire112 ?
                                   wire112 : wire115) : wire113[(4'h8):(1'h0)]) : (~&(wire110 ?
                               (8'hb3) : wire110))) ?
                       wire113 : $signed(((^wire115) >>> (wire115 || wire110)))));
  assign wire117 = wire111[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned((~&(~((wire114 ? wire117 : wire116) ?
          {wire115, wire110} : $signed(wire111))))))
        begin
          reg118 <= $unsigned(((+($unsigned(wire116) ^ {wire116})) ?
              wire116[(4'h8):(1'h1)] : wire115));
        end
      else
        begin
          reg118 <= wire113;
          if (wire111[(2'h3):(1'h0)])
            begin
              reg119 <= (-wire114);
            end
          else
            begin
              reg119 <= $unsigned((~(((+reg118) + wire116[(2'h3):(2'h3)]) << $unsigned({wire116,
                  wire112}))));
              reg120 <= (wire113 ? reg119[(1'h0):(1'h0)] : (8'ha1));
              reg121 <= {$signed((wire117[(3'h6):(2'h3)] ?
                      (wire113 * wire114) : (wire117 ?
                          $signed((8'hbd)) : $unsigned(wire110))))};
              reg122 <= wire117[(2'h3):(1'h1)];
              reg123 <= ((^($unsigned(wire117[(4'h8):(1'h1)]) + (((8'hba) <= (8'ha7)) | $unsigned(wire110)))) && wire116[(4'hd):(3'h6)]);
            end
          reg124 <= reg120[(2'h3):(1'h1)];
          reg125 <= ((~|wire113[(1'h0):(1'h0)]) ^ ($unsigned((^~$unsigned(reg119))) != (wire110[(4'h8):(3'h6)] ?
              (-wire113[(2'h3):(1'h1)]) : (~(~&wire110)))));
          reg126 <= $signed((wire114[(4'h8):(2'h2)] ?
              {wire110} : (~&{(wire117 <= wire115), wire111[(4'h8):(3'h7)]})));
        end
      reg127 <= {(7'h43)};
    end
  assign wire128 = wire113;
  always
    @(posedge clk) begin
      if (wire113[(4'h9):(4'h8)])
        begin
          reg129 <= $signed(((~&{$signed(reg125)}) ?
              $signed(((wire112 ~^ reg127) ?
                  (wire117 >= wire117) : wire116[(4'hd):(1'h0)])) : (wire117 != $signed($unsigned(wire115)))));
          reg130 <= {$signed(((+wire110[(2'h2):(1'h1)]) <= $unsigned((reg124 <<< reg126))))};
        end
      else
        begin
          reg129 <= (8'hb0);
          reg130 <= $signed(($unsigned($unsigned(((8'ha4) ?
                  reg127 : wire114))) ?
              reg127[(1'h0):(1'h0)] : $unsigned(((|reg120) == (~^wire116)))));
        end
      reg131 <= wire110;
      reg132 <= wire114;
    end
  assign wire133 = ({((+(!reg118)) == (^~$unsigned(reg131))),
                           wire117[(2'h2):(1'h1)]} ?
                       (|reg130) : reg122[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg134 <= (&reg124[(4'ha):(3'h5)]);
    end
  assign wire135 = (~^reg123[(1'h1):(1'h1)]);
  assign wire136 = reg120[(4'hf):(4'hc)];
  assign wire137 = (!$unsigned((+$unsigned((!wire111)))));
endmodule
