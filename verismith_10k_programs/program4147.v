module top
#(parameter param217 = {(~(((|(8'hb4)) << ((8'ha1) < (8'hac))) ? ((^~(8'hae)) ? (8'hb5) : ((8'haf) <<< (8'hb6))) : ((&(8'ha9)) ? (!(8'hbb)) : {(8'ha4), (8'ha3)})))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(5'h10):(1'h0)] wire215;
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire215,
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
                 (1'h0)};
  assign wire4 = $signed(({wire3} ~^ (wire1[(4'he):(4'ha)] ?
                     ((~^wire1) <= (wire2 <= wire3)) : (8'hb4))));
  assign wire5 = wire4;
  assign wire6 = ((wire1[(3'h4):(1'h1)] == ((wire1 || wire4) >> (wire0[(2'h2):(1'h1)] ~^ (~^wire1)))) ?
                     $unsigned(wire1[(4'he):(3'h4)]) : $signed($unsigned(($signed(wire4) && {wire5}))));
  assign wire7 = ({$signed({(wire0 - wire4)})} ?
                     (^$unsigned($unsigned($signed(wire6)))) : {(8'hab)});
  always
    @(posedge clk) begin
      reg8 <= (wire4 ?
          $signed((-wire7)) : (($signed((wire5 ? (8'hb0) : wire7)) ?
              wire2[(1'h0):(1'h0)] : (|wire0)) ~^ wire5));
      reg9 <= ($signed($signed({((8'h9f) ? wire3 : wire5)})) ?
          (~^wire0[(3'h7):(3'h4)]) : $unsigned((8'hbb)));
      reg10 <= ((~&(~($signed(reg8) ?
          (wire4 < wire6) : (~^wire2)))) - $unsigned($unsigned($unsigned($unsigned(wire3)))));
      if ($unsigned($unsigned($signed(((reg8 < wire7) ?
          ((8'hb6) ^ reg9) : (^wire2))))))
        begin
          reg11 <= (7'h44);
          if (((|$signed($unsigned($signed((8'hbf))))) ?
              $signed(((|$unsigned(wire0)) == $signed($signed((8'haa))))) : (~&$unsigned(((8'hac) < $unsigned(wire6))))))
            begin
              reg12 <= (~|($unsigned($unsigned((reg8 <<< wire5))) + {(&wire3[(3'h4):(1'h0)]),
                  {$signed(wire1)}}));
              reg13 <= (~|reg8);
            end
          else
            begin
              reg12 <= (8'h9d);
              reg13 <= $signed(reg12[(4'hc):(3'h6)]);
              reg14 <= reg11[(4'hf):(4'hf)];
            end
          reg15 <= reg8[(2'h2):(1'h0)];
          if ($signed($signed(wire5)))
            begin
              reg16 <= (^(reg15[(2'h3):(2'h3)] <= ({$unsigned(reg12)} - reg11)));
              reg17 <= $unsigned({wire5});
              reg18 <= ((+reg10) & (((&{reg16,
                      (8'ha5)}) * wire4[(3'h7):(1'h0)]) ?
                  (((reg11 ? wire1 : reg10) & (wire6 ?
                      (7'h44) : (7'h43))) ^~ {reg9}) : (8'ha9)));
            end
          else
            begin
              reg16 <= (8'ha7);
              reg17 <= (~({(-$signed(wire7)),
                  ({reg8} != $signed(reg11))} ~^ (8'hb0)));
            end
        end
      else
        begin
          reg11 <= reg13[(4'h8):(1'h1)];
          if (wire4)
            begin
              reg12 <= ((~&$unsigned(reg15)) ?
                  ($signed($signed((reg11 ?
                      reg9 : reg14))) && $unsigned(wire7)) : {(reg18 ?
                          wire2 : {{(8'ha8)}})});
              reg13 <= $unsigned(wire1);
            end
          else
            begin
              reg12 <= reg8[(3'h5):(3'h5)];
              reg13 <= $signed(reg9[(1'h0):(1'h0)]);
              reg14 <= (({wire3[(3'h7):(3'h6)]} > (!$signed((wire3 >= reg8)))) * (reg17[(1'h0):(1'h0)] ?
                  {(8'hb7)} : $signed(reg16[(2'h3):(1'h0)])));
            end
        end
      reg19 <= ($unsigned($unsigned(reg10)) + reg18);
    end
  assign wire20 = reg18[(3'h6):(2'h3)];
  assign wire21 = ((|$unsigned(($unsigned((8'ha9)) ?
                      wire1[(3'h5):(1'h0)] : $signed(wire20)))) ^ ((reg14 << $signed(((8'ha5) ?
                      (8'hae) : reg13))) | (((reg11 - wire1) ?
                      (reg10 ?
                          reg15 : reg13) : ((8'hae) << reg11)) ^~ $unsigned($unsigned(reg9)))));
  assign wire22 = ($signed((~|(^wire1[(5'h12):(3'h6)]))) ?
                      reg10[(2'h2):(2'h2)] : $signed($unsigned({(~|(7'h40))})));
  assign wire23 = (8'hb3);
  assign wire24 = $signed(($unsigned($signed($unsigned(reg17))) ?
                      ({(wire5 == (7'h41))} >= reg17) : ($unsigned((~reg17)) >> reg16[(1'h0):(1'h0)])));
  assign wire25 = reg18;
  assign wire26 = $signed($unsigned(wire25));
  assign wire27 = reg15[(1'h0):(1'h0)];
  module28 #() modinst216 (wire215, clk, wire3, wire26, reg10, reg8, wire5);
endmodule

module module28
#(parameter param213 = {(!{(+(~^(8'had)))}), {((((8'ha3) ^ (8'h9c)) ? {(8'hba), (8'hae)} : ((8'hb0) ~^ (8'hbc))) >= (|{(8'had)}))}}, 
parameter param214 = ((param213 ? ((8'hb7) ? param213 : param213) : ((|(param213 ? param213 : param213)) ? ({param213, param213} > param213) : (param213 < ((8'ha5) ? param213 : (8'h9e))))) ^~ (((^~(param213 ? param213 : param213)) && ((param213 | param213) ? (^param213) : (param213 ? param213 : param213))) ? param213 : param213)))
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire196;
  wire signed [(4'he):(1'h0)] wire195;
  wire signed [(4'h9):(1'h0)] wire194;
  wire [(5'h11):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire192;
  wire [(3'h4):(1'h0)] wire191;
  wire [(5'h15):(1'h0)] wire190;
  wire [(5'h12):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire161;
  wire [(2'h3):(1'h0)] wire188;
  reg signed [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(4'hb):(1'h0)] reg207 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(4'hf):(1'h0)] reg205 = (1'h0);
  reg [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg [(4'hc):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(4'ha):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire88,
                 wire48,
                 wire90,
                 wire137,
                 wire139,
                 wire159,
                 wire161,
                 wire188,
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
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  module34 #() modinst49 (.wire37(wire32), .wire39(wire30), .y(wire48), .wire36(wire29), .wire38(wire33), .clk(clk), .wire35(wire31));
  module50 #() modinst89 (wire88, clk, wire31, wire48, wire29, wire32, wire30);
  assign wire90 = $unsigned((&wire29[(3'h5):(3'h4)]));
  module91 #() modinst138 (.wire95(wire31), .wire93(wire33), .clk(clk), .y(wire137), .wire92(wire30), .wire94(wire90));
  assign wire139 = ($unsigned($signed($signed($unsigned(wire88)))) ?
                       $signed($unsigned($signed(wire32[(2'h2):(2'h2)]))) : ($signed($unsigned(wire137[(2'h3):(2'h3)])) >= (^((wire32 >= wire33) ?
                           $unsigned(wire48) : (~^wire32)))));
  module140 #() modinst160 (wire159, clk, wire33, wire139, wire88, wire29);
  assign wire161 = (wire90[(3'h5):(1'h0)] ?
                       wire29[(3'h4):(1'h0)] : $unsigned($unsigned(((7'h40) & $signed(wire31)))));
  module162 #() modinst189 (wire188, clk, wire90, wire137, wire32, wire159, wire88);
  assign wire190 = $unsigned($unsigned(wire188));
  assign wire191 = ($unsigned((^(-(wire29 ?
                       wire137 : wire32)))) == wire29[(4'h8):(2'h2)]);
  assign wire192 = wire191;
  assign wire193 = $signed(wire88);
  assign wire194 = (!wire31);
  assign wire195 = $unsigned((~|$unsigned($unsigned((~|wire48)))));
  assign wire196 = wire161;
  always
    @(posedge clk) begin
      reg197 <= $unsigned({((wire196[(3'h6):(3'h4)] >>> wire195[(4'h9):(3'h7)]) & ((wire31 ?
                  wire191 : wire196) ?
              (wire194 < wire192) : $signed(wire190)))});
      if ((($signed(wire48) - (^((^wire33) ?
          {(8'ha7), wire192} : (wire90 ?
              (8'hb4) : wire190)))) < (wire31[(4'hb):(4'h8)] > $signed(wire139))))
        begin
          reg198 <= wire29;
          reg199 <= $signed(wire195[(1'h0):(1'h0)]);
          reg200 <= ($signed($signed(wire196)) ? wire191 : wire137);
          reg201 <= ((&$signed(wire191[(2'h2):(1'h1)])) || (-(8'hba)));
        end
      else
        begin
          reg198 <= $signed((~(^~wire29[(3'h4):(1'h0)])));
        end
      if ($unsigned($signed((8'ha1))))
        begin
          reg202 <= $unsigned($unsigned((({wire139} ?
              (^~(8'ha0)) : (~wire193)) * reg200[(4'h8):(2'h2)])));
          reg203 <= (+$signed(reg202));
        end
      else
        begin
          reg202 <= ($unsigned(wire33[(5'h10):(4'hf)]) * (8'ha8));
          if ($signed({$signed(((+wire190) ? $signed(wire159) : reg200)),
              wire32}))
            begin
              reg203 <= (!(~^wire137[(4'h8):(1'h0)]));
            end
          else
            begin
              reg203 <= $unsigned((wire30 ?
                  ((^wire29) ~^ $signed((wire191 ?
                      wire48 : wire159))) : {reg202[(1'h1):(1'h0)],
                      $signed((wire31 ? (8'hbd) : wire139))}));
              reg204 <= $unsigned((wire192[(2'h2):(1'h1)] != wire33));
              reg205 <= wire30[(3'h7):(3'h5)];
              reg206 <= $unsigned($signed(reg202));
            end
          reg207 <= wire48;
          reg208 <= wire33;
          if (wire196)
            begin
              reg209 <= (&wire159);
              reg210 <= $unsigned(wire190[(4'hf):(4'hd)]);
              reg211 <= (((wire31 ?
                  wire90 : ((reg199 ?
                      reg208 : reg202) ~^ {wire191})) ~^ ((8'hb5) ?
                  {$unsigned(wire194),
                      wire191} : $unsigned(wire137))) >= (wire33[(4'h8):(1'h1)] || (reg203 * reg202[(1'h0):(1'h0)])));
            end
          else
            begin
              reg209 <= $signed(wire190);
              reg210 <= (~&(($unsigned($signed((8'haf))) >> (~(&reg205))) ?
                  wire190[(3'h6):(2'h2)] : $signed(reg207[(1'h1):(1'h1)])));
              reg211 <= reg203[(3'h5):(2'h2)];
              reg212 <= (+wire29);
            end
        end
    end
endmodule

module module162  (y, clk, wire167, wire166, wire165, wire164, wire163);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire167;
  input wire signed [(5'h15):(1'h0)] wire166;
  input wire [(3'h6):(1'h0)] wire165;
  input wire [(5'h14):(1'h0)] wire164;
  input wire [(4'hf):(1'h0)] wire163;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(4'ha):(1'h0)] wire186;
  wire signed [(3'h4):(1'h0)] wire185;
  wire signed [(2'h2):(1'h0)] wire184;
  wire [(2'h3):(1'h0)] wire183;
  wire signed [(4'hd):(1'h0)] wire182;
  wire [(4'ha):(1'h0)] wire179;
  wire [(4'h8):(1'h0)] wire178;
  wire signed [(5'h15):(1'h0)] wire177;
  wire signed [(4'h8):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire [(4'h9):(1'h0)] wire172;
  wire signed [(4'hb):(1'h0)] wire171;
  wire signed [(4'hc):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire168;
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire168 = wire165[(3'h4):(2'h3)];
  assign wire169 = $unsigned(wire166);
  assign wire170 = (wire164 ?
                       ((((wire163 ? wire167 : wire165) ?
                               (~&wire165) : wire169) > (!wire163)) ?
                           wire168[(1'h1):(1'h1)] : wire163) : (|$unsigned(((wire167 ?
                               wire165 : wire164) ?
                           (wire167 <<< wire169) : wire169))));
  assign wire171 = {($signed(wire167) ?
                           wire169 : (~&(~&wire169[(4'h8):(1'h0)])))};
  assign wire172 = (({(^~(~^wire165)),
                       wire170[(1'h1):(1'h1)]} - ($signed(((8'hab) ?
                           wire170 : (8'hab))) ?
                       wire166[(2'h2):(2'h2)] : {wire165})) != (wire169[(1'h1):(1'h1)] ?
                       wire163 : ((8'hb8) >> wire168)));
  assign wire173 = (+$unsigned($signed((wire163 != wire164))));
  assign wire174 = ((-$signed(wire164)) ?
                       ((((wire165 ?
                           (8'hb0) : wire164) << wire168[(1'h1):(1'h0)]) ^ (!(wire165 * wire169))) - wire172[(3'h7):(3'h5)]) : (((^~(^~wire163)) <<< (8'hae)) ?
                           wire168 : ((wire170 | $unsigned(wire163)) * (~&((8'hb1) ?
                               wire165 : wire172)))));
  assign wire175 = $signed(wire171[(3'h6):(1'h0)]);
  assign wire176 = $signed({$signed({wire168, $unsigned((8'hbd))})});
  assign wire177 = $signed(((~|{(wire173 < wire176)}) << $signed(((wire168 >>> wire174) ?
                       $unsigned(wire165) : $signed((8'hab))))));
  assign wire178 = $signed(wire164);
  assign wire179 = wire165[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg180 <= (wire164 ?
          $unsigned((wire165[(2'h3):(1'h0)] ?
              $signed((~&wire168)) : (wire177 <= (wire176 - wire168)))) : $unsigned($signed($unsigned(wire164[(3'h7):(3'h6)]))));
      reg181 <= $unsigned(wire171);
    end
  assign wire182 = reg180;
  assign wire183 = $signed(((~|($unsigned(wire164) + wire174[(4'hb):(3'h5)])) ?
                       $signed(wire173[(4'hc):(3'h4)]) : wire164[(5'h13):(2'h2)]));
  assign wire184 = wire173;
  assign wire185 = {(wire179 >> wire165)};
  assign wire186 = $unsigned((~^{wire164, wire177[(5'h15):(3'h7)]}));
  assign wire187 = $unsigned($signed($unsigned($signed($unsigned(wire177)))));
endmodule

module module140
#(parameter param157 = {(8'ha7), (&({((8'hab) ? (8'h9f) : (8'h9d)), ((7'h44) ? (8'hb9) : (8'ha6))} ^~ ((!(8'ha0)) ? ((8'h9c) ^~ (8'hb7)) : (!(8'had)))))}, 
parameter param158 = (~(param157 ? (param157 ? {(param157 | param157), (&param157)} : (+{param157, (8'h9f)})) : (((~&(8'hae)) ? (param157 - param157) : (param157 | param157)) ? (~&(param157 << param157)) : ((^param157) ? (param157 ? param157 : param157) : (~&param157))))))
(y, clk, wire144, wire143, wire142, wire141);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire144;
  input wire signed [(2'h3):(1'h0)] wire143;
  input wire [(5'h12):(1'h0)] wire142;
  input wire [(2'h2):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire148;
  wire signed [(4'h8):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire145;
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(4'h8):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire145 = wire141[(1'h0):(1'h0)];
  assign wire146 = wire144;
  assign wire147 = wire141[(2'h2):(1'h0)];
  assign wire148 = $unsigned(((|$unsigned((wire141 ? wire146 : wire142))) ?
                       wire144[(1'h1):(1'h0)] : (wire143[(2'h2):(2'h2)] >> (wire144[(3'h4):(2'h2)] ?
                           {(8'haf)} : $unsigned(wire144)))));
  assign wire149 = wire142;
  always
    @(posedge clk) begin
      reg150 <= $unsigned($unsigned($unsigned(wire149[(4'ha):(3'h5)])));
      if (wire148[(3'h5):(1'h0)])
        begin
          reg151 <= {(+wire148), wire148[(1'h1):(1'h1)]};
          reg152 <= {((((8'hb0) << $signed(wire149)) <= $unsigned((wire142 + wire145))) - wire147),
              ($signed((&(~|wire147))) ?
                  (wire143 ?
                      (!wire142) : wire146) : $signed(($unsigned(wire149) > reg151[(3'h6):(3'h5)])))};
          reg153 <= (^~wire149);
          reg154 <= wire144;
          reg155 <= ($unsigned(wire141[(1'h0):(1'h0)]) < $unsigned((reg151[(4'hb):(4'ha)] || wire144)));
        end
      else
        begin
          reg151 <= {($unsigned({(reg151 >>> (8'hae))}) ?
                  (($unsigned((8'hbf)) ?
                          wire146[(4'hf):(4'hb)] : $unsigned(wire146)) ?
                      wire147 : $signed((wire143 ^~ wire147))) : wire148)};
        end
      reg156 <= ({wire142[(4'hb):(4'hb)], {$signed(wire145)}} ?
          wire141[(1'h1):(1'h0)] : wire146);
    end
endmodule

module module91
#(parameter param135 = (((((8'hbd) ? ((8'ha3) | (7'h42)) : ((8'ha3) ? (7'h41) : (7'h44))) >> {{(8'hab)}}) ? ((((8'hb6) ? (8'hb0) : (7'h42)) < ((8'hb7) | (8'hb5))) << (((8'ha6) ^~ (8'hab)) ? ((8'hb7) ? (7'h42) : (8'h9c)) : (|(8'h9e)))) : (8'hac)) >> {((~((8'hbb) + (8'ha8))) ? (^~(^~(8'had))) : (+((8'ha2) != (8'ha7)))), ((((8'hb7) + (8'hb5)) << {(8'hb5)}) || ({(8'hbb)} ? ((7'h40) ? (8'ha7) : (8'hb1)) : ((8'haa) < (8'hbb))))}), 
parameter param136 = (((({param135, param135} + (param135 != param135)) <<< {(8'h9e), (+(8'ha8))}) >> param135) == {((-(param135 ^~ param135)) ? (param135 > (param135 & param135)) : ((param135 ^ param135) || ((8'ha6) ? param135 : param135))), (((+param135) > (param135 ? (8'hb0) : param135)) ~^ ((param135 ? param135 : param135) >> (+param135)))}))
(y, clk, wire95, wire94, wire93, wire92);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire95;
  input wire [(4'h9):(1'h0)] wire94;
  input wire [(3'h6):(1'h0)] wire93;
  input wire [(5'h10):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  wire [(4'h9):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire119;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire124,
                 wire123,
                 wire122,
                 wire119,
                 wire117,
                 wire97,
                 wire96,
                 reg126,
                 reg125,
                 reg121,
                 reg120,
                 reg118,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire96 = ({$signed(wire94[(1'h1):(1'h1)]), wire92} ?
                      $signed(((wire92[(4'hc):(1'h0)] >>> $unsigned(wire92)) ?
                          wire94 : $signed($signed(wire95)))) : (((^~$signed(wire95)) ?
                          wire92 : ($signed(wire92) ?
                              (8'had) : wire93)) <<< wire95));
  assign wire97 = $signed($unsigned((&((!(8'hb5)) ? wire95 : (8'ha5)))));
  always
    @(posedge clk) begin
      reg98 <= ((8'ha8) & (^~($signed($unsigned(wire96)) ?
          (^~wire92) : wire97[(1'h1):(1'h1)])));
      if (wire97)
        begin
          if ((8'hac))
            begin
              reg99 <= ((($unsigned((wire96 ? wire94 : reg98)) ?
                          (wire93[(2'h3):(1'h0)] ?
                              $unsigned(reg98) : wire96) : ($signed(reg98) + (^~wire95))) ?
                      ($unsigned($unsigned((8'hb2))) ~^ wire95[(3'h7):(3'h5)]) : (wire95[(3'h4):(1'h0)] ?
                          {wire94, $unsigned(wire97)} : ($signed(reg98) ?
                              wire95[(3'h4):(2'h3)] : (reg98 ?
                                  reg98 : wire95)))) ?
                  wire97 : wire97[(5'h10):(4'h9)]);
              reg100 <= wire97[(4'hf):(4'ha)];
              reg101 <= ((($unsigned((^reg98)) - $unsigned(reg100)) ?
                      $signed(wire95[(3'h5):(3'h5)]) : $signed(($signed(wire95) ?
                          $unsigned(wire93) : $signed(wire97)))) ?
                  (reg100 ?
                      (~$unsigned((&wire92))) : wire97) : (($unsigned(wire95[(3'h7):(3'h5)]) ?
                      (wire93 ?
                          wire92 : wire96) : $unsigned($unsigned((8'hb8)))) & (({reg99,
                              (8'hb7)} ?
                          (wire95 != (7'h41)) : $unsigned((8'hba))) ?
                      (^(~|wire95)) : (-((8'ha1) ~^ reg99)))));
            end
          else
            begin
              reg99 <= reg98;
              reg100 <= wire97[(4'he):(3'h5)];
              reg101 <= wire97[(4'hb):(3'h6)];
            end
        end
      else
        begin
          reg99 <= $unsigned(reg99[(1'h1):(1'h1)]);
          reg100 <= $unsigned((8'ha5));
          reg101 <= (7'h41);
          reg102 <= (|(wire95[(2'h3):(1'h0)] ?
              {(7'h43)} : (((reg100 >= wire93) ^ $signed(reg100)) ?
                  reg99 : {reg99[(1'h0):(1'h0)], $signed(wire92)})));
          reg103 <= ((!(~(+(reg101 ? (8'hbc) : wire95)))) ?
              (^~wire92) : ((^{(wire97 ? wire97 : (8'hbc))}) ?
                  reg98[(3'h5):(1'h1)] : $unsigned($signed($signed((8'hba))))));
        end
      if (reg99[(3'h7):(3'h4)])
        begin
          reg104 <= $signed($signed($signed((|wire97[(4'he):(1'h0)]))));
          reg105 <= wire96[(3'h5):(3'h4)];
          reg106 <= $signed((({reg105[(3'h7):(3'h5)]} ?
              {wire96[(4'hb):(4'h8)],
                  ((8'hae) ?
                      reg98 : wire95)} : $unsigned((reg98 | wire95))) > (reg101 == reg99[(2'h3):(1'h1)])));
        end
      else
        begin
          reg104 <= (~&(+({((8'had) ? reg104 : wire93),
              (reg106 == (8'hb9))} ^~ ($unsigned(reg98) ?
              (reg105 ? reg106 : reg106) : reg102))));
          reg105 <= (($signed(((reg102 | reg101) == (reg98 - reg103))) >>> $unsigned(wire92[(3'h5):(1'h1)])) >= $unsigned($signed((~reg102))));
          reg106 <= $unsigned(reg100[(2'h3):(1'h1)]);
          if ((reg99[(4'h8):(3'h7)] ?
              reg100[(4'hc):(2'h2)] : (~^$signed($signed($unsigned(wire94))))))
            begin
              reg107 <= $signed((~|$unsigned(({reg103} ? (8'ha4) : reg105))));
              reg108 <= wire93;
            end
          else
            begin
              reg107 <= (~&$unsigned(((8'hb2) ?
                  reg105[(4'h8):(2'h3)] : $unsigned($unsigned(reg108)))));
              reg108 <= ($signed(reg107) ? reg105 : $signed((~^reg103)));
              reg109 <= reg104;
              reg110 <= (reg103[(1'h1):(1'h0)] ^ (reg108 > (reg104[(4'h8):(3'h6)] <= (8'hb4))));
              reg111 <= {($unsigned(reg109) + $unsigned(wire97[(5'h10):(4'ha)])),
                  (+$unsigned(((^reg102) ? $unsigned(reg108) : reg110)))};
            end
        end
      reg112 <= (~&$signed($signed($signed({reg105}))));
    end
  always
    @(posedge clk) begin
      if (reg108)
        begin
          reg113 <= wire94;
          reg114 <= (reg111[(4'hb):(4'hb)] - $unsigned((8'ha3)));
          reg115 <= (&(8'hb9));
        end
      else
        begin
          reg113 <= {reg106[(2'h3):(1'h0)], $signed({reg112[(4'hc):(4'hc)]})};
          reg114 <= $unsigned((~|$signed($signed((reg100 ? reg101 : reg115)))));
        end
      reg116 <= (reg115[(5'h12):(4'he)] & (^~{(reg109[(4'hf):(3'h6)] >>> $unsigned(reg104))}));
    end
  assign wire117 = {(^~(~$unsigned((wire96 << reg107)))), reg113};
  always
    @(posedge clk) begin
      reg118 <= {(((reg100[(1'h1):(1'h0)] ^~ $unsigned(reg109)) ?
              $unsigned(reg104[(4'hd):(4'hb)]) : ((reg109 ?
                  wire96 : wire94) + {(8'hbc),
                  reg106})) * (reg109 <= {(~&reg112), reg111}))};
    end
  assign wire119 = wire92;
  always
    @(posedge clk) begin
      reg120 <= reg107;
      reg121 <= $unsigned(reg108[(4'h9):(3'h4)]);
    end
  assign wire122 = (reg107[(1'h1):(1'h0)] == $unsigned(({((7'h44) | (8'hae)),
                           (wire92 ? reg121 : reg120)} ?
                       reg106 : wire93)));
  assign wire123 = reg104;
  assign wire124 = $signed(reg107);
  always
    @(posedge clk) begin
      reg125 <= {$signed((+{(reg110 + reg102)})),
          $signed(($signed({(8'ha2)}) > $signed(reg100[(5'h11):(3'h4)])))};
      reg126 <= (({(~&(wire92 * reg113)),
          reg125[(4'he):(4'hd)]} ^ (&$unsigned($unsigned(reg115)))) ^~ (reg108[(2'h3):(1'h0)] + ({(~|wire119)} ?
          (reg113 ~^ reg108) : ((~^(8'haa)) > reg121[(2'h3):(1'h1)]))));
    end
  assign wire127 = reg101[(2'h2):(1'h0)];
  assign wire128 = wire127;
  assign wire129 = reg111[(5'h10):(4'hd)];
  assign wire130 = (~&{({reg102, (+reg112)} ?
                           reg126 : ($signed(reg111) <= (&(8'ha3))))});
  assign wire131 = (^~reg118);
  assign wire132 = $signed($unsigned($signed(wire128[(5'h11):(4'he)])));
  assign wire133 = $unsigned((reg109 << (^~reg104)));
  assign wire134 = {($unsigned(reg118[(4'hd):(4'ha)]) ?
                           {((~|reg120) ?
                                   (&reg118) : reg101)} : {reg126[(3'h6):(3'h5)]}),
                       $unsigned((-{reg113[(4'hc):(3'h4)], {reg118}}))};
endmodule

module module50
#(parameter param87 = (~^((+{((8'ha4) ? (8'hb6) : (8'hae)), ((8'hb7) & (8'ha2))}) ? (((|(7'h41)) <= (&(8'hb6))) ? (!((8'ha1) ? (8'hbd) : (7'h41))) : ((-(8'hb3)) >> ((8'ha9) ? (8'hab) : (8'ha4)))) : (~(~&((8'hbf) != (8'hbd)))))))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(3'h4):(1'h0)] wire52;
  input wire [(4'hc):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  assign y = {wire86,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire57,
                 wire56,
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
                 (1'h0)};
  assign wire56 = $unsigned($signed($unsigned((+wire55[(4'hf):(3'h7)]))));
  assign wire57 = wire56[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg58 <= $signed((~&($unsigned((!wire55)) >>> $signed((~(8'h9e))))));
      if ($unsigned($unsigned($unsigned((((8'h9c) ? (8'h9d) : wire52) ?
          (wire56 ? (7'h43) : (8'ha9)) : {wire53})))))
        begin
          reg59 <= ($signed($signed(((~|(8'hab)) != $unsigned(wire54)))) | ((8'ha0) ?
              $signed(reg58) : (wire54 ?
                  (~^{wire51,
                      reg58}) : (wire55[(4'hf):(1'h1)] <= $unsigned(wire55)))));
          reg60 <= (wire53 ?
              wire51[(4'hc):(4'hb)] : ($unsigned((wire53 ?
                  {reg58, reg59} : (wire54 ? (8'hb8) : reg58))) > wire57));
          reg61 <= (~|reg60);
          reg62 <= (^reg61[(3'h4):(1'h0)]);
        end
      else
        begin
          reg59 <= reg60;
          reg60 <= {({reg62[(2'h2):(1'h0)], $unsigned((reg58 + wire53))} ?
                  (wire52[(3'h4):(1'h0)] || $signed($signed(wire53))) : wire54)};
          if ($signed($unsigned(wire52)))
            begin
              reg61 <= (reg60 ?
                  ((~^($unsigned(wire51) ?
                          (reg62 == wire51) : (wire52 >> wire52))) ?
                      reg60[(4'ha):(1'h0)] : $signed(((&wire51) ?
                          {reg59, wire52} : (reg58 ?
                              reg61 : (8'hb8))))) : ($signed((8'haf)) == (($unsigned((8'hb7)) & $unsigned(wire51)) ?
                      (reg60 ?
                          (reg61 & reg60) : (7'h41)) : (|$signed((8'hbc))))));
              reg62 <= $unsigned(({$signed($signed((8'hb9))),
                  wire52} + {(|$signed(reg59)), reg58}));
              reg63 <= wire53[(3'h5):(3'h5)];
              reg64 <= $unsigned((~wire53));
              reg65 <= {(($unsigned(wire51[(2'h3):(1'h1)]) ?
                          wire52 : ($signed(wire54) ?
                              (wire51 + (7'h41)) : (wire52 + wire54))) ?
                      {$signed(wire56)} : ({(&reg64), ((8'hba) >>> wire53)} ?
                          wire53[(3'h5):(1'h0)] : (+reg58)))};
            end
          else
            begin
              reg61 <= $unsigned($unsigned(wire55));
              reg62 <= {$unsigned(wire51[(3'h5):(1'h0)]), (~^$unsigned(reg64))};
              reg63 <= reg63;
              reg64 <= ((~&reg65[(4'hc):(4'hc)]) >> {$unsigned($unsigned(reg61[(2'h3):(1'h1)]))});
            end
        end
      reg66 <= (~&((^~reg62) && (~|((reg62 <= (7'h42)) ?
          (~|wire57) : wire57[(4'h9):(2'h3)]))));
      reg67 <= reg65;
    end
  assign wire68 = $unsigned(reg64);
  assign wire69 = (({reg62} ?
                      ((reg67 && wire68[(2'h2):(1'h0)]) << {$signed(reg63)}) : $unsigned((^(reg58 ?
                          reg59 : reg58)))) <<< $unsigned(wire57[(3'h6):(3'h5)]));
  assign wire70 = ((^(&wire56[(2'h2):(2'h2)])) > (~reg60));
  assign wire71 = (|reg58);
  always
    @(posedge clk) begin
      reg72 <= wire53[(3'h5):(2'h3)];
      reg73 <= (reg60 & (&$signed((^~$unsigned(reg65)))));
      reg74 <= $unsigned({reg63});
      if ({(((reg67[(4'hd):(3'h7)] ? (reg65 ? wire51 : reg65) : (^wire69)) ?
              $unsigned(wire70[(4'hd):(3'h6)]) : (!(wire57 ?
                  wire54 : reg63))) - {(7'h42)}),
          {{wire68[(2'h2):(1'h1)]}}})
        begin
          reg75 <= (wire69 ? $unsigned((7'h43)) : reg64);
          reg76 <= reg66[(1'h0):(1'h0)];
        end
      else
        begin
          reg75 <= (reg58[(1'h0):(1'h0)] <= ((reg65[(4'hd):(2'h2)] >> (reg75 && (reg73 || reg64))) ?
              ($signed(reg64[(1'h0):(1'h0)]) * (^reg58[(2'h2):(2'h2)])) : $unsigned(reg73[(2'h2):(2'h2)])));
          reg76 <= reg74;
          reg77 <= (~^wire70);
        end
      reg78 <= {reg67};
    end
  always
    @(posedge clk) begin
      reg79 <= reg64;
      if ((8'hae))
        begin
          reg80 <= (reg79[(3'h4):(1'h1)] + wire54[(5'h11):(1'h1)]);
          reg81 <= (8'ha3);
          reg82 <= wire57;
        end
      else
        begin
          reg80 <= reg64[(1'h0):(1'h0)];
          reg81 <= ((^~(~$signed($signed(reg79)))) || {$unsigned(({reg64} ?
                  wire69[(1'h0):(1'h0)] : wire55[(4'hb):(2'h3)])),
              ((8'hb5) ?
                  $unsigned(reg58[(2'h3):(2'h2)]) : reg74[(3'h5):(3'h5)])});
          reg82 <= (wire53 == $signed(($unsigned((~&(8'hb3))) + ($signed(reg60) ?
              (reg79 ? (8'haf) : reg59) : $unsigned(reg78)))));
          reg83 <= wire69;
        end
      reg84 <= ($unsigned((~|$signed((8'hbe)))) == (reg76 ?
          ($signed({(8'hbc)}) ?
              (-wire56) : $unsigned((wire54 == reg79))) : wire68));
      reg85 <= wire51;
    end
  assign wire86 = (!{reg60, reg81[(2'h3):(2'h3)]});
endmodule

module module34
#(parameter param47 = {(({((8'ha1) ? (8'hbb) : (8'hac)), ((8'ha0) != (8'h9c))} ? (!((8'hbf) ? (8'hb4) : (7'h40))) : ({(8'ha5)} ^ ((8'ha7) ? (7'h40) : (8'hae)))) ? ((((8'hae) ? (8'ha4) : (7'h42)) ? (|(8'hac)) : (+(8'hae))) ? (((8'had) ^~ (8'hbe)) ? ((8'ha1) || (8'hbe)) : ((8'hb8) ? (8'haa) : (8'hb4))) : (~((8'ha9) ^ (7'h44)))) : {{((8'hb7) ^~ (8'ha6))}, (((8'hb4) ? (8'h9f) : (8'hab)) == (^~(8'ha1)))}), {((+{(8'hb6)}) ? ({(7'h43), (8'hb2)} ? ((8'hab) >>> (8'haf)) : (7'h44)) : ((8'hbb) ^ ((8'hb1) ? (8'h9d) : (8'ha4))))}})
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire signed [(3'h7):(1'h0)] wire36;
  input wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  assign y = {wire46, wire45, wire44, wire43, wire42, reg41, reg40, (1'h0)};
  always
    @(posedge clk) begin
      reg40 <= (!(-($signed(wire35[(1'h1):(1'h1)]) >> (&((8'hb5) >>> wire36)))));
      reg41 <= (reg40[(2'h2):(1'h1)] ?
          $unsigned(((8'hb1) || $unsigned($signed(wire35)))) : (^~reg40[(4'ha):(2'h2)]));
    end
  assign wire42 = (wire36[(1'h1):(1'h0)] ?
                      ($unsigned({$unsigned(wire38)}) > $unsigned($signed((|wire37)))) : (wire38[(3'h6):(2'h3)] ?
                          ((wire38 == (~wire38)) ?
                              wire37 : (~^(~^reg40))) : $signed(wire39[(1'h1):(1'h0)])));
  assign wire43 = (wire38[(4'ha):(3'h7)] ?
                      $unsigned((wire38[(4'h8):(1'h0)] ?
                          ((reg40 ?
                              (8'ha6) : wire35) ~^ (wire39 && wire36)) : ($unsigned(wire42) - (wire42 ?
                              reg41 : wire42)))) : $signed($signed(wire38)));
  assign wire44 = ((!($unsigned(wire39[(2'h2):(1'h1)]) * $unsigned(wire36[(1'h1):(1'h1)]))) || (~wire37[(1'h1):(1'h0)]));
  assign wire45 = wire38;
  assign wire46 = $signed(wire43);
endmodule
