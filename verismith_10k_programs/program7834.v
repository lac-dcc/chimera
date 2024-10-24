module top
#(parameter param225 = (({(((8'haa) ? (8'hb3) : (8'hb6)) < ((8'h9f) ~^ (8'haa))), (((8'hb2) * (8'hb0)) ? ((8'hb8) << (8'ha9)) : ((8'hb5) & (8'hb8)))} == ((~^((8'ha0) | (8'ha5))) ? (((8'haf) ? (8'hbf) : (8'hb0)) ? ((8'hbb) >> (8'ha5)) : ((8'ha1) ? (8'hb0) : (8'hb2))) : (~|(8'h9f)))) >= (!((~&((8'h9d) << (8'hb8))) >= (~|((8'haa) << (8'ha1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire224;
  wire [(5'h11):(1'h0)] wire223;
  wire signed [(4'h8):(1'h0)] wire204;
  wire [(4'hd):(1'h0)] wire203;
  wire signed [(4'h8):(1'h0)] wire202;
  wire [(4'h8):(1'h0)] wire201;
  wire [(3'h4):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire194;
  wire signed [(2'h3):(1'h0)] wire193;
  wire [(3'h6):(1'h0)] wire188;
  wire signed [(4'h9):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire176;
  wire [(4'hf):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire173;
  wire signed [(5'h15):(1'h0)] wire172;
  wire signed [(4'hd):(1'h0)] wire170;
  wire [(4'hb):(1'h0)] wire168;
  wire [(3'h7):(1'h0)] wire190;
  wire signed [(4'hb):(1'h0)] wire191;
  reg signed [(2'h2):(1'h0)] reg222 = (1'h0);
  reg [(4'hc):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg218 = (1'h0);
  reg [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg216 = (1'h0);
  reg [(4'ha):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg212 = (1'h0);
  reg [(4'h9):(1'h0)] reg211 = (1'h0);
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg207 = (1'h0);
  reg [(5'h10):(1'h0)] reg206 = (1'h0);
  reg [(3'h4):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg199 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg197 = (1'h0);
  reg [(5'h14):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg195 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(5'h14):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  assign y = {wire224,
                 wire223,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire194,
                 wire193,
                 wire188,
                 wire178,
                 wire176,
                 wire175,
                 wire173,
                 wire172,
                 wire170,
                 wire168,
                 wire190,
                 wire191,
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
                 reg206,
                 reg205,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  module4 #() modinst169 (wire168, clk, wire2, wire0, wire1, wire3);
  module87 #() modinst171 (.clk(clk), .wire90(wire168), .y(wire170), .wire89(wire1), .wire88(wire0), .wire91(wire2));
  assign wire172 = ({wire170, wire2} ?
                       ((($signed(wire3) ?
                           $unsigned((8'haa)) : $unsigned(wire1)) & (wire1 * (~wire170))) < (wire2[(1'h0):(1'h0)] ?
                           (wire1 ?
                               (wire0 >= wire3) : {wire3, wire2}) : (wire170 ?
                               {wire168,
                                   wire168} : (!wire168)))) : ({(wire168 + wire170[(3'h5):(2'h3)])} <= $unsigned($unsigned((wire170 >> wire1)))));
  module27 #() modinst174 (wire173, clk, wire0, wire2, wire170, wire172);
  assign wire175 = $unsigned(((wire172 ?
                       wire170[(3'h5):(2'h2)] : $unsigned($unsigned(wire0))) > $signed(wire173)));
  module87 #() modinst177 (.clk(clk), .y(wire176), .wire90(wire170), .wire91(wire175), .wire89(wire168), .wire88(wire0));
  assign wire178 = $signed(((-$unsigned($unsigned((8'hbb)))) ?
                       wire2 : (|wire173)));
  always
    @(posedge clk) begin
      reg179 <= ((({(wire1 * wire0),
              wire172[(5'h10):(3'h7)]} > ((wire0 - (8'h9e)) + (wire0 ?
              wire0 : wire0))) >>> {$unsigned((wire2 ? (8'hb8) : wire1))}) ?
          wire176 : (^wire176[(3'h5):(3'h5)]));
      if (((~^(($unsigned(wire172) <<< wire3[(2'h3):(2'h2)]) >>> wire176[(3'h5):(2'h2)])) != {$signed((((8'hb7) - wire2) ?
              (wire176 ? (7'h42) : reg179) : wire178))}))
        begin
          reg180 <= reg179[(1'h1):(1'h0)];
          reg181 <= wire0[(4'h9):(3'h6)];
          reg182 <= wire176[(1'h0):(1'h0)];
          reg183 <= wire173;
          reg184 <= ((reg179[(1'h1):(1'h1)] && wire168[(1'h1):(1'h1)]) ?
              (wire170[(3'h4):(2'h2)] ?
                  {wire0} : (wire178 ^~ (^~reg180))) : {($signed(wire175[(3'h7):(2'h3)]) ?
                      $unsigned((reg180 ^~ wire176)) : {$signed(reg179)}),
                  $unsigned(reg180[(2'h3):(1'h0)])});
        end
      else
        begin
          reg180 <= wire2;
          reg181 <= (($unsigned(($signed(reg182) >>> {reg179})) ?
                  (wire168 ?
                      ((wire173 ? wire175 : wire168) ?
                          (wire3 ?
                              (8'hb4) : wire176) : $unsigned(reg182)) : {wire178[(2'h2):(2'h2)]}) : reg184[(5'h10):(1'h1)]) ?
              $unsigned((&((wire168 ?
                  reg184 : reg184) - (~(8'ha0))))) : $unsigned(wire1));
        end
      reg185 <= $signed(((((wire173 ?
              (8'h9c) : wire176) < wire176) * (~|(reg183 >>> reg181))) ?
          wire3[(2'h2):(1'h0)] : (^$unsigned(reg180[(4'ha):(1'h1)]))));
      reg186 <= (~|reg179);
      reg187 <= $signed((8'hb8));
    end
  module100 #() modinst189 (.clk(clk), .y(wire188), .wire101(reg184), .wire102(wire168), .wire103(wire170), .wire104(wire0));
  assign wire190 = reg180;
  module87 #() modinst192 (.wire90(wire176), .wire88(wire2), .y(wire191), .clk(clk), .wire91(reg184), .wire89(wire178));
  assign wire193 = $unsigned((reg180[(4'he):(4'hb)] ?
                       ($unsigned(wire175[(2'h2):(1'h1)]) | $signed({reg181,
                           wire170})) : (!reg179)));
  assign wire194 = (~^reg181[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg195 <= (+(({{(8'hbc)}} ~^ ($unsigned((8'hb6)) << $signed(wire188))) <<< $unsigned((~&$signed(reg186)))));
      reg196 <= (8'hbb);
      reg197 <= ($unsigned((+$signed((~|wire175)))) ?
          (reg196[(4'hd):(4'hc)] ?
              {$signed(wire2[(4'ha):(2'h2)]),
                  (((8'hbf) ? reg196 : wire191) ?
                      (wire172 ?
                          (8'hb3) : reg184) : reg183[(4'hf):(4'hc)])} : (reg186 <= (|wire170[(4'hd):(3'h4)]))) : {(^~{wire1,
                  reg182[(3'h5):(3'h5)]})});
      reg198 <= ($unsigned(reg185[(4'h9):(2'h2)]) == {{(!(wire173 == wire190)),
              {(wire173 ? (8'h9c) : wire190), ((8'hbc) ? reg182 : wire193)}},
          ((~wire173[(4'he):(2'h2)]) + wire193)});
      reg199 <= $signed($unsigned($signed($unsigned($signed(wire190)))));
    end
  assign wire200 = (~^{(~|$unsigned(wire1)),
                       ((~&$signed(wire188)) << ((wire170 ? wire191 : reg182) ?
                           reg187[(1'h0):(1'h0)] : wire178[(2'h2):(1'h1)]))});
  assign wire201 = ((wire1[(3'h6):(1'h1)] ?
                       wire194[(4'hb):(4'hb)] : reg179[(3'h7):(2'h2)]) ^~ {(~&$signed($signed(reg196))),
                       ((|(-reg179)) ?
                           reg186[(4'h8):(3'h6)] : (^$signed(reg183)))});
  assign wire202 = wire194[(1'h1):(1'h0)];
  assign wire203 = (((+$signed((wire200 ^ (8'hb1)))) ?
                           (8'hb6) : (!reg199[(3'h7):(1'h0)])) ?
                       (+($unsigned((+wire170)) ?
                           reg183[(5'h12):(3'h5)] : $unsigned(wire202))) : $unsigned(reg187));
  assign wire204 = $signed(((($unsigned(wire173) ?
                       $unsigned(wire178) : $unsigned(reg196)) == ((wire190 == (8'ha2)) ?
                       (wire191 <<< wire188) : (wire178 ?
                           wire172 : wire176))) <= $signed((~&((8'hbb) < (7'h40))))));
  always
    @(posedge clk) begin
      if (reg186[(4'ha):(2'h2)])
        begin
          reg205 <= $unsigned({((~&reg182) ?
                  $unsigned({wire175, wire172}) : wire173),
              wire202});
        end
      else
        begin
          reg205 <= wire191[(4'h9):(1'h1)];
          reg206 <= reg181;
          reg207 <= (wire176 & ($signed({$signed(reg182),
              (~^wire178)}) < $unsigned(reg182[(3'h5):(3'h4)])));
          reg208 <= $signed($signed((8'hae)));
          reg209 <= wire190[(3'h4):(3'h4)];
        end
      if ($signed({wire188,
          ($signed((reg183 * (8'ha8))) ?
              ((8'hbe) << (reg181 ? (8'ha7) : wire202)) : (7'h41))}))
        begin
          reg210 <= {$unsigned($unsigned((reg181[(3'h4):(2'h2)] ?
                  $signed(wire191) : (reg186 == wire2)))),
              wire200};
          reg211 <= ($unsigned(($signed((&(8'ha2))) ?
              reg187 : $unsigned((reg209 && wire176)))) < {((~{reg181}) ?
                  $unsigned({reg206, wire201}) : (reg181 ?
                      (8'hac) : wire193[(1'h1):(1'h1)]))});
        end
      else
        begin
          reg210 <= wire204;
          if ((~^$signed($signed(wire170[(4'hc):(1'h0)]))))
            begin
              reg211 <= ($signed(reg184) ^~ $signed($unsigned({reg208})));
              reg212 <= $signed($unsigned($unsigned({wire178[(4'h9):(1'h0)]})));
              reg213 <= {$unsigned($unsigned(reg197[(2'h3):(1'h0)])),
                  {($signed((reg185 ? wire188 : (8'ha7))) && (8'hb8)),
                      $unsigned($unsigned($signed(wire2)))}};
              reg214 <= $signed({(^{(reg197 ? (8'ha2) : reg208)}),
                  {reg208[(4'he):(3'h4)], (8'h9e)}});
              reg215 <= (reg211 ?
                  $signed(wire201[(3'h5):(2'h3)]) : wire173[(1'h0):(1'h0)]);
            end
          else
            begin
              reg211 <= (($signed($unsigned((wire188 ?
                  wire191 : reg206))) >> wire202) ^~ (&$unsigned({(reg210 | reg195),
                  reg182[(3'h4):(2'h2)]})));
              reg212 <= reg208[(2'h2):(1'h1)];
            end
          reg216 <= {(!wire0[(2'h3):(2'h3)])};
          reg217 <= wire2[(4'hf):(1'h0)];
          reg218 <= (|wire2);
        end
    end
  always
    @(posedge clk) begin
      reg219 <= $signed($unsigned($unsigned($unsigned({reg197, reg208}))));
      reg220 <= wire3[(2'h3):(1'h0)];
      reg221 <= reg207[(3'h6):(3'h5)];
      reg222 <= (&reg184[(2'h3):(1'h0)]);
    end
  assign wire223 = wire193;
  assign wire224 = ($signed($unsigned($unsigned(reg179[(1'h0):(1'h0)]))) ?
                       wire178[(1'h1):(1'h1)] : (|(+((|reg181) ?
                           $signed(reg206) : $unsigned(wire1)))));
endmodule

module module4
#(parameter param166 = ((!(~&(((8'hb5) >= (8'ha6)) ? (&(8'hbc)) : ((8'ha1) ? (8'hb8) : (8'ha4))))) ? (+((((8'hb2) + (8'ha1)) ? ((7'h42) ? (8'ha6) : (8'had)) : ((7'h40) + (8'hae))) ? ((&(8'hba)) & {(8'ha7)}) : {(-(7'h41))})) : {((((8'hb9) ? (8'h9d) : (8'h9e)) >= ((8'hac) ? (8'ha2) : (8'hb9))) <= (((8'ha8) ? (8'ha1) : (8'hb7)) ? (~^(8'hb4)) : ((8'ha9) >> (8'hb8))))}), 
parameter param167 = ((^param166) ? ({{{param166, param166}, (param166 & (8'hb6))}, ({param166} << (~|param166))} >> ((~|((8'h9c) & param166)) != ((param166 ? (7'h40) : param166) > (param166 ? param166 : (8'hb3))))) : (param166 & (~{((8'h9e) | param166)}))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire5;
  input wire [(4'hb):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire165;
  wire signed [(5'h12):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire146;
  wire signed [(4'hb):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire83;
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire149,
                 wire148,
                 wire146,
                 wire98,
                 wire86,
                 wire85,
                 wire9,
                 wire26,
                 wire59,
                 wire83,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
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
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire9 = ($signed(($unsigned(wire6[(4'ha):(1'h1)]) ?
                     $unsigned(wire5[(1'h1):(1'h1)]) : {$unsigned(wire7)})) || wire6);
  always
    @(posedge clk) begin
      reg10 <= ((wire9[(1'h1):(1'h1)] && (|$unsigned({wire9,
          wire6}))) != (|$unsigned($signed(((8'hb2) ^ wire8)))));
      reg11 <= {$signed(wire6[(3'h4):(2'h2)]),
          (((^$unsigned(wire7)) ?
              $signed(wire7) : $signed($signed(reg10))) <<< wire5[(2'h2):(2'h2)])};
      reg12 <= $unsigned((+(~^($signed(wire5) >> wire7[(4'he):(3'h4)]))));
      if ($unsigned($unsigned((&wire7[(4'he):(1'h0)]))))
        begin
          if ((~&$signed(($unsigned((reg10 ? wire8 : reg11)) > reg10))))
            begin
              reg13 <= (((^((~wire8) > reg11)) ?
                  (~|reg10[(5'h10):(4'hf)]) : {($unsigned(reg12) ?
                          $signed(wire9) : (8'hbe)),
                      ($unsigned((8'h9c)) << (!reg12))}) <<< (~|(8'hab)));
              reg14 <= (8'hbf);
              reg15 <= wire5;
            end
          else
            begin
              reg13 <= (8'hbd);
              reg14 <= reg14;
              reg15 <= ((|((|reg11) - {{(8'haf)}, (reg13 < wire5)})) ?
                  (^$signed(wire7)) : wire9);
              reg16 <= (~^reg11);
            end
          reg17 <= $unsigned($unsigned(reg15[(2'h2):(1'h1)]));
          reg18 <= wire7;
          reg19 <= ($unsigned((^reg13[(3'h7):(2'h2)])) > {{{wire7[(4'he):(4'h9)]}},
              {reg17}});
        end
      else
        begin
          reg13 <= (+$unsigned($unsigned(reg10)));
        end
      if ($signed(reg14))
        begin
          reg20 <= ((|wire5) ?
              ((&((|(7'h43)) || {(8'hab)})) && reg17[(1'h0):(1'h0)]) : ($signed($unsigned($unsigned((8'hab)))) ?
                  (wire9 >> ($signed(reg16) ?
                      (reg12 + (8'h9c)) : $signed((8'had)))) : ((&reg15) ?
                      (reg12 < (wire5 ? wire9 : reg19)) : (^{reg11, reg18}))));
          reg21 <= $signed(wire8[(2'h3):(2'h2)]);
          if (($unsigned((^~(+(reg16 ? wire8 : reg20)))) ~^ reg16))
            begin
              reg22 <= reg17;
              reg23 <= reg19;
              reg24 <= $unsigned($unsigned(wire6));
              reg25 <= (($signed($unsigned((reg20 ? reg14 : (8'hb9)))) ?
                      (8'h9c) : (reg11[(4'hd):(3'h6)] + (wire5[(2'h2):(1'h0)] <<< (wire5 ?
                          reg19 : wire9)))) ?
                  ((~|{{reg12,
                          reg23}}) < reg18[(1'h1):(1'h1)]) : $signed({(reg14 ?
                          reg10 : reg18)}));
            end
          else
            begin
              reg22 <= wire5;
              reg23 <= ($unsigned((^reg23)) >>> reg18[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg20 <= ((+wire5) ?
              (reg10 | (reg11[(3'h6):(1'h1)] ?
                  (8'hb7) : ((reg18 ?
                      reg10 : (8'h9d)) == (reg20 ^~ reg20)))) : ($unsigned(((|(8'hac)) <= (8'hb4))) ?
                  ($signed((reg14 ?
                      reg12 : (8'hb3))) + wire7[(4'hf):(4'hb)]) : (reg18 < wire7)));
          reg21 <= $signed((-(~&wire6[(4'h9):(1'h1)])));
          reg22 <= $signed(reg14[(2'h3):(2'h3)]);
        end
    end
  assign wire26 = $signed($unsigned((reg23 >= reg20[(4'hb):(4'h8)])));
  module27 #() modinst60 (wire59, clk, reg17, reg11, reg12, reg15);
  module61 #() modinst84 (.y(wire83), .clk(clk), .wire63(reg21), .wire65(wire9), .wire64(reg12), .wire62(reg16));
  assign wire85 = ((({$signed(wire7), reg21} ?
                          (-(8'hb6)) : $unsigned($unsigned(reg16))) ?
                      $signed(reg18) : $unsigned(reg19)) == (7'h42));
  assign wire86 = (-wire6);
  module87 #() modinst99 (.wire91(wire8), .y(wire98), .clk(clk), .wire88(reg12), .wire89(wire7), .wire90(reg25));
  module100 #() modinst147 (.wire101(wire5), .wire103(wire7), .y(wire146), .clk(clk), .wire104(reg24), .wire102(reg16));
  assign wire148 = $signed((+{$signed($signed(wire98))}));
  assign wire149 = reg11;
  always
    @(posedge clk) begin
      reg150 <= ((reg13[(2'h3):(1'h0)] + (($unsigned(reg16) <= ((8'ha6) ?
              (8'hb7) : wire86)) ?
          $signed((reg17 ? reg25 : (8'hb7))) : ($signed(reg15) ?
              $unsigned(wire59) : $signed(wire7)))) | $signed({{reg14,
              $signed((8'h9d))},
          ((reg23 << wire98) ? $signed(reg18) : (-reg12))}));
      if ({($unsigned(((&reg14) * (~^wire148))) ^ $signed(reg21[(1'h1):(1'h0)]))})
        begin
          reg151 <= (((~reg150) ?
                  reg14[(3'h6):(1'h0)] : $signed(($unsigned((8'had)) ~^ (wire5 & reg150)))) ?
              ((wire148[(1'h1):(1'h1)] ?
                  wire5[(3'h7):(2'h3)] : (^~(&reg18))) == $unsigned((~|(!reg22)))) : {reg19[(2'h2):(1'h1)]});
          reg152 <= {reg24[(4'hc):(4'hb)], reg13[(2'h2):(2'h2)]};
          if (reg151[(3'h7):(3'h5)])
            begin
              reg153 <= $signed(reg20[(3'h7):(1'h0)]);
              reg154 <= {($signed($unsigned(wire8)) * $unsigned($signed((wire26 & reg10))))};
              reg155 <= (+$unsigned(reg16[(5'h13):(2'h3)]));
              reg156 <= $unsigned(((($unsigned((8'ha1)) ?
                      {reg150} : reg22[(1'h0):(1'h0)]) >>> (((8'ha2) && reg24) && {reg154,
                      wire85})) ?
                  reg19 : (8'ha9)));
              reg157 <= ((~|reg10) ?
                  $signed((^~(|(reg22 != (8'hb1))))) : reg21);
            end
          else
            begin
              reg153 <= $unsigned(reg155[(2'h3):(1'h0)]);
            end
        end
      else
        begin
          if ((&(reg13 ? reg20 : $unsigned(wire86[(1'h1):(1'h0)]))))
            begin
              reg151 <= $signed((+$unsigned((reg152[(2'h3):(2'h2)] != $signed(reg151)))));
              reg152 <= (8'hb3);
              reg153 <= (wire83[(5'h10):(5'h10)] ?
                  $signed(wire26[(3'h4):(1'h0)]) : ($unsigned((^~wire26[(3'h5):(3'h4)])) - ({reg23,
                          (reg10 ? wire6 : reg12)} ?
                      ($signed(reg20) ?
                          (&reg14) : {wire86,
                              reg17}) : reg151[(4'h8):(2'h2)])));
              reg154 <= (($signed($signed((reg24 >> reg155))) ?
                  reg150 : $signed($unsigned((8'ha4)))) == (-((&{wire86}) != reg152)));
              reg155 <= $unsigned((reg12[(5'h10):(4'hd)] ?
                  reg17[(1'h1):(1'h0)] : reg157[(4'hc):(3'h5)]));
            end
          else
            begin
              reg151 <= (($signed(((^~reg13) != wire98[(1'h0):(1'h0)])) | ((wire98 ?
                          $signed((8'hb2)) : wire149[(2'h2):(1'h0)]) ?
                      wire26[(5'h10):(4'hf)] : (&(~|(8'had))))) ?
                  (~&wire83) : (reg18[(2'h2):(2'h2)] ?
                      reg153[(2'h3):(2'h3)] : ((^$unsigned((8'hae))) >> (^{reg20,
                          reg17}))));
              reg152 <= reg155[(2'h3):(1'h0)];
            end
          if (($unsigned((wire59 << $unsigned($signed(reg11)))) == $signed((wire59[(4'h8):(2'h3)] ?
              ($unsigned(reg23) ?
                  (~reg13) : (-reg14)) : ((^wire149) ^~ wire59)))))
            begin
              reg156 <= reg156;
              reg157 <= wire5[(3'h4):(3'h4)];
              reg158 <= ($unsigned((8'hba)) || (reg22[(1'h1):(1'h1)] ?
                  (~^$signed({reg155, wire85})) : (~^wire26)));
            end
          else
            begin
              reg156 <= reg152[(4'ha):(1'h1)];
              reg157 <= $unsigned(wire149[(2'h3):(2'h2)]);
              reg158 <= $signed(reg18[(1'h1):(1'h0)]);
              reg159 <= reg10[(4'hc):(4'h9)];
              reg160 <= ((|(^~wire5[(3'h4):(1'h1)])) & ($signed($signed(reg159)) * ((reg13[(3'h6):(2'h3)] ?
                      (reg157 ? reg22 : wire7) : wire5[(4'h8):(3'h4)]) ?
                  $signed((wire7 < wire59)) : ($signed(reg10) <= (8'hb6)))));
            end
          reg161 <= reg156[(4'hc):(4'hc)];
        end
      reg162 <= ($signed(reg14) ? reg13[(3'h5):(1'h1)] : reg11[(5'h11):(2'h3)]);
      reg163 <= (reg12[(4'h9):(3'h4)] || (wire98[(4'ha):(1'h1)] - wire86[(2'h3):(2'h2)]));
    end
  assign wire164 = (8'h9c);
  assign wire165 = (((!($unsigned(reg154) + $unsigned(reg152))) ?
                       (8'hb2) : (reg157[(4'hb):(2'h2)] ?
                           {$unsigned(reg161)} : reg23)) << (wire9[(3'h5):(1'h1)] != (|($unsigned(wire6) == (wire85 ?
                       (8'ha9) : reg156)))));
endmodule

module module100
#(parameter param145 = ((((((8'hb4) ? (8'ha2) : (7'h43)) ^~ ((7'h43) ? (8'haf) : (8'hba))) * (!((8'haa) - (8'ha0)))) ? ({((8'ha7) <<< (8'ha5))} ? (8'haf) : ({(8'hb6), (8'ha0)} == (-(8'hb9)))) : ((~&(-(8'ha1))) | (^{(8'hbd)}))) && {((8'hbb) ? (+((8'haf) <<< (8'hbb))) : (((7'h43) <<< (8'hb5)) ? (&(8'had)) : ((8'ha8) >>> (8'hba)))), (~^(^~{(7'h40)}))}))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire104;
  input wire [(4'hd):(1'h0)] wire103;
  input wire signed [(4'hb):(1'h0)] wire102;
  input wire signed [(4'hd):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg [(4'hc):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg131,
                 reg130,
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
                 (1'h0)};
  assign wire105 = (~&$signed((8'hab)));
  assign wire106 = {$signed({(-((8'had) << wire101))})};
  assign wire107 = $unsigned(((~|(^~$unsigned(wire104))) ?
                       $unsigned(wire104[(2'h3):(1'h1)]) : (($signed(wire101) >= $signed(wire103)) == wire102)));
  assign wire108 = (wire107 >= $signed($signed($unsigned((^~wire107)))));
  assign wire109 = wire104;
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($signed($unsigned(wire107)) != (&wire108[(4'h9):(4'h8)])))))
        begin
          reg110 <= (!(^~((~&wire106[(2'h2):(1'h1)]) ?
              (wire102[(4'h8):(1'h0)] ?
                  (wire102 * wire108) : (wire106 ?
                      (8'haa) : wire107)) : wire108[(4'hb):(4'h8)])));
          reg111 <= ((wire106 ?
              (^wire102) : $signed($unsigned((reg110 ?
                  wire102 : (8'hab))))) ^~ {(+wire101)});
          reg112 <= wire101[(3'h4):(3'h4)];
          if (wire107)
            begin
              reg113 <= reg112[(2'h2):(1'h1)];
              reg114 <= $unsigned(($unsigned(((reg111 & (8'ha3)) << $unsigned(wire101))) - $signed(($signed(wire108) ?
                  reg112[(2'h3):(1'h1)] : wire107))));
            end
          else
            begin
              reg113 <= ({wire105, wire108} ? $unsigned(reg111) : (~|reg113));
              reg114 <= wire101;
              reg115 <= wire106;
              reg116 <= ($unsigned(($signed(wire108[(2'h2):(1'h1)]) > (((8'ha9) ?
                      wire106 : wire102) ?
                  (8'h9e) : $unsigned(wire107)))) && wire106[(3'h5):(1'h1)]);
            end
          reg117 <= $unsigned($signed(reg111));
        end
      else
        begin
          if ((^~reg117))
            begin
              reg110 <= ($signed((!$signed($signed(wire104)))) || (reg113 ?
                  ($unsigned((wire102 ?
                      wire103 : reg111)) <= wire109) : wire103));
              reg111 <= (&$unsigned($unsigned(wire103[(4'h8):(1'h1)])));
              reg112 <= reg115[(4'h9):(4'h9)];
              reg113 <= $unsigned(((((+wire106) ?
                  (reg113 >>> reg111) : $signed(reg116)) != $unsigned((reg110 >> wire101))) >> $unsigned({(wire103 && reg115),
                  (!wire106)})));
            end
          else
            begin
              reg110 <= (8'ha9);
              reg111 <= ({$unsigned($unsigned((|reg110))),
                  $unsigned($signed(wire104[(4'hf):(4'hf)]))} ^ ($unsigned($signed(wire106)) ?
                  reg114 : $unsigned($signed((^reg113)))));
              reg112 <= wire107;
              reg113 <= reg111[(3'h6):(1'h0)];
            end
          reg114 <= (((((wire101 ?
                  (8'hb3) : reg110) << (wire101 >>> reg111)) ^ ($signed((7'h43)) == $unsigned(wire105))) ^ (~^$unsigned((reg110 ?
                  (8'hbf) : reg117)))) ?
              wire109 : {$unsigned(({wire109} <= $unsigned(wire107)))});
          reg115 <= $unsigned($signed($signed($signed((wire106 ?
              reg112 : wire102)))));
        end
      reg118 <= $signed($unsigned(reg111));
    end
  always
    @(posedge clk) begin
      if ($unsigned(((({(8'ha3), wire104} | wire109) ?
              ((reg110 ? reg112 : wire106) <<< (reg116 < reg110)) : (!(reg111 ?
                  (8'h9d) : wire103))) ?
          $signed(((~|reg114) ?
              $unsigned(wire102) : wire107)) : {$signed(wire102[(3'h7):(3'h4)])})))
        begin
          reg119 <= $signed($unsigned(((&(reg114 && wire103)) >> ($unsigned(reg112) || (8'ha8)))));
          reg120 <= wire107;
          reg121 <= (^reg120[(3'h4):(1'h0)]);
          reg122 <= (((8'hb8) ^ reg120) ? (8'ha0) : {(-reg119), (~reg115)});
          if (wire108[(4'h8):(2'h2)])
            begin
              reg123 <= $unsigned(((-reg122[(3'h4):(2'h2)]) ?
                  $signed((^(reg110 ? (8'hba) : reg111))) : {(^~(|wire107)),
                      wire108[(4'ha):(1'h0)]}));
              reg124 <= {wire101[(1'h1):(1'h1)]};
              reg125 <= (!(~&($signed($signed(reg123)) + reg115[(3'h6):(3'h6)])));
              reg126 <= $signed(($signed((|(|wire108))) ?
                  wire105 : (reg118[(2'h3):(1'h0)] ?
                      wire103 : $unsigned((reg111 ? reg125 : wire103)))));
              reg127 <= $signed(((^~$unsigned($signed(reg125))) >= $unsigned({reg116})));
            end
          else
            begin
              reg123 <= {(^~$unsigned($signed($signed(reg119))))};
            end
        end
      else
        begin
          reg119 <= ($unsigned({(-wire106[(4'h9):(2'h2)]),
              ((~^reg117) ?
                  (wire104 ? reg115 : reg120) : (wire106 ?
                      reg124 : reg127))}) == wire107);
          reg120 <= ((^~reg120) ?
              reg125[(5'h12):(4'he)] : (reg127[(3'h4):(2'h3)] ?
                  reg116[(2'h2):(1'h0)] : reg120));
          reg121 <= reg120[(3'h5):(1'h1)];
          reg122 <= $unsigned($signed($unsigned(wire101[(1'h0):(1'h0)])));
        end
      if ((reg113 ^~ ($unsigned(reg119) ?
          (reg115 == reg121[(2'h3):(2'h3)]) : {$unsigned($signed(reg116))})))
        begin
          if ((~|{((~|$unsigned(reg121)) == (~$signed(reg111))),
              $signed($unsigned($signed((8'hb6))))}))
            begin
              reg128 <= ((~&{(8'h9d)}) ?
                  (8'haa) : $unsigned(({reg126[(3'h5):(2'h2)],
                      (reg112 != wire109)} >>> $unsigned((-reg126)))));
              reg129 <= (+wire104[(3'h4):(3'h4)]);
            end
          else
            begin
              reg128 <= $signed((($signed($unsigned(reg128)) & reg117) ?
                  $unsigned(($unsigned(reg110) ^ reg111)) : (-$unsigned(reg127[(3'h6):(2'h2)]))));
              reg129 <= (-(reg117[(3'h4):(2'h2)] ?
                  ({$unsigned(reg126)} | ((reg114 + wire102) ?
                      $unsigned(reg117) : wire107[(5'h10):(3'h4)])) : {{{reg113,
                              reg126},
                          (wire109 > reg122)}}));
              reg130 <= reg117[(1'h0):(1'h0)];
              reg131 <= $unsigned({$unsigned((reg114[(3'h6):(3'h5)] >> wire105)),
                  (~(7'h44))});
            end
          if ($signed((wire107 ?
              (^(+$signed(wire106))) : ($unsigned((+reg122)) > reg111))))
            begin
              reg132 <= reg121[(2'h2):(2'h2)];
              reg133 <= {(^~(~((&(8'ha9)) > {reg111}))),
                  ((+($unsigned(reg119) ~^ reg115[(4'h9):(1'h0)])) ?
                      wire109 : (^~$signed((reg119 || reg116))))};
              reg134 <= reg112;
            end
          else
            begin
              reg132 <= $signed($unsigned(wire104[(4'h8):(1'h0)]));
              reg133 <= $unsigned(reg129);
              reg134 <= $unsigned($signed(reg113[(2'h2):(1'h0)]));
            end
          reg135 <= (^~{(reg133[(3'h7):(2'h3)] && wire105[(3'h4):(3'h4)])});
          if ($unsigned({($unsigned(((7'h43) ?
                  reg130 : reg117)) != $unsigned({reg124, (8'hbe)})),
              reg126}))
            begin
              reg136 <= {wire106[(4'ha):(4'h9)]};
              reg137 <= (-$signed($unsigned((~(reg115 - (8'ha5))))));
            end
          else
            begin
              reg136 <= (($unsigned(reg129[(2'h2):(1'h0)]) >= ($unsigned(reg123) ?
                      $signed((reg119 && reg113)) : (8'hb9))) ?
                  reg111[(4'h9):(1'h1)] : reg136[(2'h3):(2'h2)]);
              reg137 <= ((((reg121[(2'h3):(1'h0)] ?
                      $unsigned(reg118) : wire108[(2'h3):(1'h1)]) & $signed((reg119 ?
                      reg137 : reg112))) >>> $signed({reg132, reg115})) ?
                  ($unsigned((|reg112)) ^ (|({reg110, reg121} ?
                      (|wire108) : {reg119}))) : ({reg117} ?
                      $signed($signed((reg117 << wire105))) : reg120[(3'h5):(2'h2)]));
              reg138 <= $unsigned(($signed((reg114[(3'h5):(2'h2)] <= (wire104 ?
                  reg130 : reg121))) ~^ (($signed(reg129) | (8'hba)) ?
                  $signed(wire104) : ($unsigned(wire102) ?
                      $unsigned(reg125) : (~&(8'hb1))))));
              reg139 <= reg134[(4'h8):(3'h6)];
              reg140 <= $unsigned((reg135[(1'h0):(1'h0)] << $signed($unsigned(reg116))));
            end
          reg141 <= reg137;
        end
      else
        begin
          if (wire106)
            begin
              reg128 <= ($signed(($unsigned((reg136 >= reg127)) ?
                  $signed($unsigned(reg127)) : reg134[(5'h14):(3'h7)])) < $signed((^~((+wire105) >>> {(8'hba),
                  reg134}))));
              reg129 <= $unsigned(reg121[(5'h13):(3'h7)]);
              reg130 <= reg131;
              reg131 <= $signed((($unsigned((reg120 ? reg126 : reg132)) ?
                  (+((8'ha1) ?
                      reg127 : (7'h44))) : $signed($signed(reg122))) == reg115));
            end
          else
            begin
              reg128 <= reg141;
            end
          if ($signed($signed(((reg135 > reg115) - wire107))))
            begin
              reg132 <= $unsigned((+(((reg126 ?
                  reg120 : wire106) >>> reg122) >= $signed({reg112, reg136}))));
              reg133 <= (^~((((reg140 || reg123) | ((8'h9d) ?
                      wire105 : reg134)) > reg136) ?
                  ((~((8'ha4) ? (8'hac) : reg137)) ?
                      ($unsigned(wire103) ?
                          $signed(reg129) : reg111) : reg118) : (!((&reg139) > $signed(reg111)))));
            end
          else
            begin
              reg132 <= (((reg116 >>> {$unsigned(reg129),
                  $unsigned(reg118)}) || $unsigned((((8'haf) ?
                      reg112 : reg126) ?
                  (wire108 ~^ reg127) : (reg126 ?
                      (8'h9d) : reg117)))) + $unsigned($unsigned(($signed(reg123) ?
                  (~|wire107) : {reg131, (8'hbb)}))));
              reg133 <= ((~(!$signed((reg127 ?
                  reg120 : reg139)))) & ((~(+reg132)) & (!reg135)));
              reg134 <= $unsigned({reg123});
            end
          reg135 <= ({$unsigned(reg118),
                  (|$signed((reg125 ? reg121 : wire104)))} ?
              reg138[(5'h10):(4'hd)] : $signed(reg141[(1'h0):(1'h0)]));
          if ((($unsigned($unsigned(wire102)) >= (-((~wire108) ?
              (reg126 <<< reg139) : $signed(reg137)))) >>> ((reg133[(5'h12):(2'h3)] ?
              (8'ha5) : $signed($unsigned(wire109))) != (!$signed($signed(reg121))))))
            begin
              reg136 <= (|reg119[(4'h9):(1'h0)]);
              reg137 <= ((&$signed(reg113[(2'h2):(2'h2)])) >>> ($unsigned(reg139) >= reg114[(5'h15):(4'hf)]));
            end
          else
            begin
              reg136 <= {reg125[(4'hb):(2'h2)], (-(+(~|reg128)))};
              reg137 <= (~$unsigned(($signed(reg127) ?
                  (|reg134[(3'h5):(1'h1)]) : (reg114[(5'h15):(5'h13)] <= (reg136 ?
                      wire107 : (8'h9d))))));
              reg138 <= (|$signed((-(-{wire105, wire107}))));
              reg139 <= $signed($unsigned({((8'hb3) ?
                      (reg114 <<< wire103) : $unsigned(reg119))}));
            end
          if ((($unsigned(reg111[(5'h13):(3'h7)]) ?
                  $signed(((^~reg119) ?
                      reg115 : $signed(reg126))) : $signed(($signed(wire105) ?
                      $signed((8'haf)) : $signed(wire105)))) ?
              (+wire101[(4'hc):(3'h5)]) : (reg116[(1'h0):(1'h0)] ?
                  $signed($unsigned(reg132[(1'h1):(1'h0)])) : ($unsigned((reg121 ?
                          reg116 : reg140)) ?
                      (reg141[(1'h0):(1'h0)] || reg131) : {$signed(reg131)}))))
            begin
              reg140 <= reg140;
              reg141 <= (+reg135);
            end
          else
            begin
              reg140 <= ((-$signed(((reg117 ? reg127 : reg119) ?
                  ((7'h40) != reg118) : (reg115 ?
                      reg135 : (8'ha6))))) <<< (8'haa));
              reg141 <= $signed($unsigned(wire108));
              reg142 <= ((((reg131[(4'ha):(4'ha)] | wire106[(1'h1):(1'h1)]) & (7'h42)) ?
                  (^~$unsigned($signed((8'ha9)))) : (reg114[(4'hd):(4'hd)] ?
                      $unsigned($signed((8'hbe))) : reg140)) <<< (-reg114));
            end
        end
    end
  assign wire143 = (reg120 ~^ ($signed(reg130[(4'h8):(2'h3)]) ?
                       wire105[(1'h0):(1'h0)] : reg135));
  assign wire144 = (($unsigned($signed((wire105 ?
                           reg115 : reg130))) ^ ((~(8'hb5)) ~^ reg136)) ?
                       (&$unsigned((reg110 || $signed(reg138)))) : {reg114[(1'h0):(1'h0)]});
endmodule

module module87
#(parameter param96 = (8'hab), 
parameter param97 = (!((|param96) ? (|((~&param96) | (param96 ^~ param96))) : (&param96))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire [(4'h9):(1'h0)] wire90;
  input wire signed [(4'h9):(1'h0)] wire89;
  input wire signed [(2'h3):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  assign y = {wire95, wire94, wire93, wire92, (1'h0)};
  assign wire92 = $signed($unsigned((((~|wire89) ?
                      wire88 : (-wire89)) == (wire88[(1'h1):(1'h0)] ?
                      (~|wire89) : (!(8'ha1))))));
  assign wire93 = ($signed(((8'hbb) ?
                      ((^wire91) ?
                          (wire90 != wire91) : (wire92 ?
                              wire88 : wire91)) : (~^$unsigned((8'hbe))))) < ($signed($unsigned(wire90)) != (wire91[(2'h2):(2'h2)] ?
                      ($unsigned(wire88) ^~ wire92) : (8'hb9))));
  assign wire94 = (+wire91);
  assign wire95 = $unsigned((wire92[(1'h0):(1'h0)] ?
                      $signed($signed($signed(wire92))) : wire92));
endmodule

module module61
#(parameter param81 = (~&(~(({(8'ha3), (8'hb5)} | {(8'hbb)}) ? (((8'ha7) & (8'h9c)) ? ((7'h41) ? (8'hbb) : (8'hb6)) : ((8'had) >= (8'hae))) : (~((7'h44) ? (7'h41) : (8'hb8)))))), 
parameter param82 = param81)
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire65;
  input wire [(5'h14):(1'h0)] wire64;
  input wire signed [(3'h5):(1'h0)] wire63;
  input wire [(5'h13):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire67,
                 wire66,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire66 = (~^wire64[(4'h9):(1'h0)]);
  assign wire67 = ($signed($signed(($signed(wire62) ?
                      {wire65, wire65} : $unsigned(wire62)))) >> (8'hb5));
  always
    @(posedge clk) begin
      reg68 <= $unsigned((!((wire66 && (~&(8'hbc))) ?
          wire63 : ((~^wire62) || (wire67 >> (8'h9f))))));
      reg69 <= reg68[(2'h2):(1'h0)];
      reg70 <= ($unsigned((^~($unsigned((7'h40)) ?
              wire62 : {wire63, wire67}))) ?
          wire66[(1'h0):(1'h0)] : (-wire67[(4'hc):(4'hc)]));
    end
  always
    @(posedge clk) begin
      if (((wire63[(2'h3):(2'h2)] ? $unsigned(reg69[(4'hc):(3'h7)]) : wire65) ?
          $signed($unsigned(($unsigned(wire67) ?
              (~(8'h9c)) : $signed(wire64)))) : $signed(reg68)))
        begin
          reg71 <= $unsigned(reg69[(4'he):(3'h6)]);
          if ((^~$unsigned(({(wire66 ? reg69 : wire62)} ?
              $unsigned(reg69) : wire63[(3'h4):(3'h4)]))))
            begin
              reg72 <= $unsigned($signed(wire63));
              reg73 <= (wire64 != {$unsigned((&$unsigned((8'hb3))))});
              reg74 <= ({$signed(reg69[(1'h1):(1'h1)])} ?
                  ((reg71 >>> (~&(~|wire62))) >>> ((~&(~&(8'hba))) ?
                      $unsigned((wire62 ?
                          reg72 : wire64)) : reg70[(1'h1):(1'h0)])) : $signed($signed(wire67)));
              reg75 <= $unsigned(((^$unsigned(wire66)) ?
                  $signed($signed((~reg73))) : (+reg70[(3'h4):(1'h1)])));
            end
          else
            begin
              reg72 <= {wire62};
              reg73 <= (~&reg75);
              reg74 <= {{(($unsigned((7'h40)) ?
                          $unsigned(reg69) : $signed(reg74)) * $signed($signed(reg70))),
                      wire63[(1'h0):(1'h0)]},
                  (!$signed(wire64))};
              reg75 <= (~($unsigned(reg74[(3'h5):(1'h0)]) ?
                  (~^($unsigned(wire66) ?
                      (~^reg68) : $signed(wire67))) : (~&$signed((wire64 ?
                      (8'ha2) : reg74)))));
            end
          reg76 <= wire66[(2'h2):(1'h0)];
        end
      else
        begin
          reg71 <= ((-wire62[(2'h2):(1'h1)]) ?
              (wire67 > ($unsigned(reg75[(4'hb):(3'h7)]) ^~ $unsigned(reg72))) : {$unsigned($unsigned(reg72[(3'h7):(3'h5)]))});
          reg72 <= reg76[(4'he):(4'h8)];
          reg73 <= reg76;
          reg74 <= ($unsigned((8'hb4)) ^ reg72[(4'hd):(4'ha)]);
        end
      reg77 <= $unsigned((wire65 >= $signed($signed((reg74 * reg69)))));
    end
  assign wire78 = reg75[(4'h8):(1'h1)];
  assign wire79 = $unsigned((^~{reg73[(4'hb):(3'h5)],
                      ({reg72} ? wire62[(3'h4):(1'h0)] : (^~reg73))}));
  always
    @(posedge clk) begin
      reg80 <= (($unsigned($signed({wire79})) < reg70) ?
          ((+reg74[(2'h3):(2'h2)]) ?
              reg69 : ($unsigned($signed(reg69)) | ((|reg74) || reg74))) : (^((^(wire65 ^~ wire65)) <<< ((+reg74) <<< (reg73 == wire64)))));
    end
endmodule

module module27
#(parameter param58 = ((&((^~((8'hbd) >> (8'ha2))) + ((7'h43) >> (~^(8'hac))))) * (^(8'hb6))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire signed [(3'h4):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire47,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire32 = ({$unsigned(((wire28 ?
                              wire28 : wire29) ~^ $unsigned(wire29)))} ?
                      wire28[(1'h0):(1'h0)] : wire31);
  assign wire33 = {$signed(wire30[(1'h1):(1'h0)]),
                      (wire31[(4'h8):(2'h3)] ?
                          ((wire32[(4'hf):(4'he)] != (wire31 > wire28)) != (|$unsigned(wire28))) : {$unsigned($signed((8'ha7)))})};
  assign wire34 = $unsigned(wire32);
  assign wire35 = (!(~&({wire30[(3'h4):(2'h3)]} ?
                      (~^(wire28 && wire31)) : $unsigned($signed(wire29)))));
  assign wire36 = $unsigned($signed((wire30[(4'ha):(4'h8)] ?
                      (^~(wire32 <<< (8'h9e))) : $signed((wire34 | wire28)))));
  assign wire37 = (8'hb8);
  assign wire38 = (wire31[(4'ha):(3'h7)] <<< (^$signed(wire32)));
  assign wire39 = (wire32[(1'h1):(1'h1)] ?
                      ({wire36[(3'h4):(3'h4)],
                              {$signed(wire37), wire28[(4'hb):(4'hb)]}} ?
                          (^~wire34[(1'h1):(1'h1)]) : (wire35 ~^ $signed(wire32[(4'hd):(4'h8)]))) : wire31);
  assign wire40 = ((wire37 ^ (|((&(7'h40)) ?
                          (wire34 ? wire38 : wire32) : ((8'hb9) ?
                              wire33 : wire28)))) ?
                      $signed((~^wire30)) : wire39);
  assign wire41 = (~&(8'hac));
  assign wire42 = (^~wire31);
  assign wire43 = $signed((wire37 < $unsigned((+$unsigned(wire31)))));
  assign wire44 = $signed(((((wire42 ? wire34 : wire34) & ((7'h40) ?
                              wire33 : wire29)) ?
                          (^(^~wire40)) : ((wire40 ?
                              (8'haa) : wire32) + wire30[(1'h1):(1'h0)])) ?
                      $unsigned($signed(wire39)) : $unsigned((-(8'hac)))));
  always
    @(posedge clk) begin
      reg45 <= wire31;
    end
  always
    @(posedge clk) begin
      reg46 <= $signed(wire40);
    end
  assign wire47 = wire42[(4'hb):(3'h7)];
  always
    @(posedge clk) begin
      reg48 <= wire47;
      reg49 <= (~((({(8'ha0)} ? wire41 : (wire40 > reg46)) ?
          ($unsigned(wire44) & $unsigned(wire44)) : (wire29[(3'h4):(1'h1)] << {wire38})) > (~&$signed((8'hac)))));
      reg50 <= {$signed(wire37[(1'h1):(1'h0)]), wire34};
      reg51 <= reg49;
    end
  always
    @(posedge clk) begin
      reg52 <= (wire41 >>> ((8'hb6) == $unsigned(wire32[(5'h11):(4'hc)])));
      reg53 <= wire34;
      reg54 <= (({$signed((-wire38)), reg52} ?
              ($signed((wire39 ?
                  wire44 : reg45)) * (wire43[(3'h5):(1'h1)] <= (reg48 ?
                  wire43 : wire43))) : {$unsigned((wire47 && wire32))}) ?
          $signed(({wire33[(4'hb):(3'h7)]} <= (reg52 ?
              (wire47 ?
                  reg45 : (8'had)) : (wire41 || wire38)))) : ($unsigned(((^(8'ha5)) ?
                  (wire30 && reg48) : (reg53 ? reg52 : wire41))) ?
              $signed((wire39[(3'h7):(3'h7)] ?
                  wire44[(4'he):(1'h0)] : (reg49 ?
                      wire41 : wire44))) : ($signed({wire29,
                  reg48}) * {{wire41}, (wire34 <<< wire39)})));
      reg55 <= wire42;
    end
  assign wire56 = wire47[(3'h5):(2'h3)];
  assign wire57 = ($signed($signed($unsigned(((8'hb0) <<< wire32)))) ?
                      $signed($signed($unsigned(reg55[(5'h12):(4'hd)]))) : $unsigned((~^(wire40[(3'h4):(2'h3)] == (wire38 ?
                          wire56 : reg49)))));
endmodule
