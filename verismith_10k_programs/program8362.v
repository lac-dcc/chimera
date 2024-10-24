module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire233;
  wire [(5'h13):(1'h0)] wire232;
  wire signed [(3'h5):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire230;
  assign y = {wire233, wire232, wire4, wire5, wire6, wire230, (1'h0)};
  assign wire4 = ($unsigned((8'hb4)) != (^~(^~$signed(((8'hab) >> wire0)))));
  assign wire5 = (|{{$signed($unsigned(wire1))}, wire3[(5'h11):(3'h5)]});
  assign wire6 = wire4;
  module7 #() modinst231 (wire230, clk, wire6, wire0, wire3, wire1, wire5);
  assign wire232 = {wire6,
                       (((wire2 && {wire5, wire3}) ?
                           $signed(wire3) : wire3[(4'hf):(4'hf)]) > $signed({$signed(wire2)}))};
  assign wire233 = wire232;
endmodule

module module7
#(parameter param229 = (8'hbe))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire228;
  wire [(5'h12):(1'h0)] wire227;
  wire [(2'h2):(1'h0)] wire226;
  wire [(4'hf):(1'h0)] wire224;
  wire [(5'h12):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire186;
  wire signed [(4'h9):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire167;
  wire [(4'he):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire169;
  wire [(5'h14):(1'h0)] wire184;
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire226,
                 wire224,
                 wire188,
                 wire187,
                 wire186,
                 wire165,
                 wire15,
                 wire16,
                 wire17,
                 wire26,
                 wire94,
                 wire167,
                 wire168,
                 wire169,
                 wire184,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= $signed((!wire11[(3'h4):(1'h0)]));
      reg14 <= (8'hb1);
    end
  assign wire15 = wire11;
  assign wire16 = (8'ha0);
  assign wire17 = {((~|(wire9[(3'h4):(2'h2)] ~^ wire16)) ?
                          wire9 : (wire12 < ($unsigned(wire16) ?
                              (wire10 << wire15) : $signed(wire10)))),
                      $unsigned($unsigned($unsigned(wire15[(2'h3):(1'h1)])))};
  always
    @(posedge clk) begin
      if ($unsigned((~^(reg13[(1'h0):(1'h0)] ?
          wire11[(2'h2):(1'h1)] : wire12[(4'h9):(3'h5)]))))
        begin
          if ($signed((wire8 ? {(&reg14)} : $signed(wire15))))
            begin
              reg18 <= $unsigned($unsigned((+wire16[(4'h9):(2'h2)])));
              reg19 <= (wire17 - (wire15[(2'h3):(2'h3)] ?
                  (($unsigned(wire8) != $unsigned(reg14)) ?
                      (~^(wire15 > (8'hac))) : reg13) : $signed(($unsigned(wire9) ?
                      reg18[(4'hd):(4'h8)] : (wire12 ? wire16 : reg13)))));
              reg20 <= $signed(wire8[(2'h3):(2'h2)]);
            end
          else
            begin
              reg18 <= ($unsigned($unsigned(reg14)) ?
                  (~&wire16[(4'hc):(4'hb)]) : $signed($unsigned({$unsigned(wire8)})));
              reg19 <= wire8[(1'h1):(1'h0)];
              reg20 <= $unsigned((($unsigned(wire9[(2'h3):(1'h0)]) ?
                  ((~&wire11) ?
                      (~|wire10) : {wire9}) : {wire10}) | ((^$unsigned(reg13)) ~^ reg20)));
              reg21 <= {wire12[(3'h4):(3'h4)],
                  $signed((~({wire8} ? (wire16 ^ wire8) : $unsigned(wire9))))};
              reg22 <= $signed(wire17);
            end
          reg23 <= ({(((reg13 ? reg22 : (7'h40)) ?
                      ((7'h44) ? wire16 : (8'ha0)) : $signed(reg13)) ?
                  $signed((~(8'ha3))) : $signed($unsigned(reg20)))} - $unsigned((^$unsigned($signed((8'h9e))))));
        end
      else
        begin
          if ((reg14 == ((-$signed($signed(reg21))) - {$signed((~^reg18)),
              ({wire17, (7'h41)} ? (-wire12) : (7'h43))})))
            begin
              reg18 <= reg18;
              reg19 <= wire9;
              reg20 <= (!reg19);
              reg21 <= (wire10 ?
                  wire9[(2'h2):(2'h2)] : $signed($unsigned(reg18)));
            end
          else
            begin
              reg18 <= reg19;
              reg19 <= wire9[(1'h1):(1'h1)];
              reg20 <= (((|((wire9 & wire16) ? (~|reg14) : reg14)) ?
                  wire10 : ($signed((&reg13)) ?
                      ((wire9 ? reg13 : wire9) ?
                          reg23 : (+wire9)) : $signed((^reg22)))) > ($signed(($signed(wire15) ?
                      $signed(wire10) : (!(8'ha3)))) ?
                  wire17[(2'h3):(1'h1)] : (&((reg22 ^ wire11) ?
                      $unsigned(wire10) : (wire15 ? reg13 : wire16)))));
              reg21 <= ((~(8'hb8)) ?
                  reg20[(3'h4):(2'h3)] : (~^($unsigned(((8'hac) ?
                          (7'h41) : wire17)) ?
                      reg23[(5'h10):(1'h1)] : $unsigned((^~reg22)))));
            end
          if (((wire12[(1'h1):(1'h1)] ?
              wire10[(2'h2):(1'h1)] : (!(^~reg19))) && (wire12 >= ($signed($unsigned(wire17)) ?
              $signed($signed(wire10)) : wire10))))
            begin
              reg22 <= ({$unsigned(reg19)} * (8'hb1));
              reg23 <= $signed((~|(8'h9f)));
              reg24 <= $unsigned((({wire10} ?
                      (&(reg23 || reg18)) : (~(^~reg22))) ?
                  (($unsigned(reg14) | wire8) || $unsigned(wire8)) : $signed(reg14)));
            end
          else
            begin
              reg22 <= (({$unsigned({reg21, wire11}), $unsigned((8'hb6))} ?
                  ($unsigned($signed(wire8)) ?
                      (reg23 ?
                          (wire17 & wire16) : (wire12 ?
                              wire17 : (8'hbd))) : {{(8'ha0),
                              wire10}}) : wire16) >>> $signed(reg22));
              reg23 <= $unsigned(($unsigned(wire11) ?
                  {(|(wire17 < reg13))} : (^~(((8'ha6) >>> reg23) ?
                      {reg14} : $unsigned(wire10)))));
            end
          reg25 <= {$unsigned((~^($unsigned(reg21) ^ reg21))),
              $signed($signed(($unsigned(reg24) ~^ reg19)))};
        end
    end
  assign wire26 = (8'ha5);
  module27 #() modinst95 (.y(wire94), .wire30(wire16), .wire32(wire10), .wire31(reg13), .wire28(reg19), .wire29(wire11), .clk(clk));
  module96 #() modinst166 (wire165, clk, reg19, reg24, reg14, reg20, wire10);
  assign wire167 = ((wire11[(4'h9):(2'h2)] | $signed(wire10)) ?
                       $unsigned((($signed(reg23) ?
                               reg21[(4'hc):(3'h7)] : (+(8'h9e))) ?
                           wire12[(4'h9):(3'h4)] : ((^~wire26) ?
                               (reg25 >= wire9) : (-wire16)))) : $unsigned({(wire10 != (~&wire17)),
                           ((wire17 ? reg25 : wire17) || $unsigned(reg19))}));
  assign wire168 = ({(8'had),
                       (-{(reg25 ? wire26 : wire9),
                           {wire9,
                               wire17}})} ~^ ($unsigned($unsigned(wire165[(3'h6):(2'h2)])) ?
                       wire10[(4'hf):(2'h3)] : {((^wire9) ?
                               wire12[(1'h0):(1'h0)] : reg18[(4'h8):(3'h4)]),
                           $signed((8'ha5))}));
  assign wire169 = (~((~(+$signed(reg23))) & ($signed((~wire16)) ?
                       $signed(wire15) : {$unsigned(reg19),
                           wire8[(1'h1):(1'h1)]})));
  module170 #() modinst185 (.clk(clk), .wire174(wire9), .wire172(reg13), .wire171(reg18), .y(wire184), .wire173(reg21));
  assign wire186 = $unsigned(($unsigned((8'hac)) ? wire168 : $signed(wire169)));
  assign wire187 = $unsigned((((8'ha3) & wire165) ?
                       $signed((^~$signed(reg24))) : (~&wire8[(2'h3):(1'h0)])));
  assign wire188 = wire11;
  module189 #() modinst225 (.y(wire224), .wire191(reg18), .wire192(wire94), .wire193(wire184), .wire194(wire12), .clk(clk), .wire190(wire10));
  assign wire226 = $signed($unsigned($signed(((8'hb7) <= (~|reg13)))));
  assign wire227 = wire188[(4'hb):(3'h5)];
  assign wire228 = {$unsigned(wire94)};
endmodule

module module189
#(parameter param222 = {({(((8'hab) + (8'hb8)) && ((8'ha4) ? (8'haa) : (8'ha6))), {((8'haf) ? (8'hbb) : (8'had)), ((8'h9f) ? (8'had) : (8'h9f))}} || ({(~&(8'ha9)), {(8'hba)}} - {((8'ha9) ? (8'hae) : (8'hae))})), (((+((8'ha9) ? (8'hb4) : (8'hb7))) ~^ (((8'hac) ? (8'hac) : (8'hbd)) <= ((8'hb2) * (8'ha9)))) == ((((8'h9f) ? (8'hb4) : (8'hb0)) * ((8'had) >>> (8'hb2))) ? ({(8'had)} + ((8'hb9) | (8'hb1))) : ((~|(8'hb9)) == (8'ha9))))}, 
parameter param223 = ((param222 ? (&(^param222)) : (({param222} ? param222 : {param222}) | (~^(param222 <<< param222)))) ? (8'hac) : {param222}))
(y, clk, wire194, wire193, wire192, wire191, wire190);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire194;
  input wire signed [(4'hf):(1'h0)] wire193;
  input wire [(3'h5):(1'h0)] wire192;
  input wire signed [(5'h11):(1'h0)] wire191;
  input wire signed [(5'h14):(1'h0)] wire190;
  wire signed [(4'h9):(1'h0)] wire221;
  wire signed [(4'h8):(1'h0)] wire220;
  wire signed [(5'h14):(1'h0)] wire219;
  wire signed [(5'h13):(1'h0)] wire218;
  wire [(5'h11):(1'h0)] wire217;
  wire signed [(4'hd):(1'h0)] wire216;
  wire signed [(4'hc):(1'h0)] wire214;
  wire [(4'hd):(1'h0)] wire213;
  wire [(4'hd):(1'h0)] wire212;
  wire [(4'hc):(1'h0)] wire195;
  reg signed [(5'h14):(1'h0)] reg215 = (1'h0);
  reg [(4'hc):(1'h0)] reg211 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg209 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg206 = (1'h0);
  reg [(3'h6):(1'h0)] reg205 = (1'h0);
  reg [(4'hf):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(3'h4):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg198 = (1'h0);
  reg [(5'h11):(1'h0)] reg197 = (1'h0);
  reg [(5'h15):(1'h0)] reg196 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire214,
                 wire213,
                 wire212,
                 wire195,
                 reg215,
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
                 reg196,
                 (1'h0)};
  assign wire195 = ($signed((wire190[(4'hc):(4'h8)] ?
                       $unsigned((wire190 ~^ (8'hbd))) : (-$signed(wire191)))) | ($unsigned((~(!wire191))) ?
                       wire192 : ({$unsigned(wire193)} >> ($unsigned(wire194) ?
                           (wire193 < wire193) : (-wire192)))));
  always
    @(posedge clk) begin
      reg196 <= {$signed((($unsigned((8'hb6)) >>> (wire191 ?
              wire192 : wire190)) < {$unsigned(wire195), $unsigned(wire190)}))};
      reg197 <= {$signed($signed((wire194 ? wire190 : ((7'h43) == wire192))))};
      reg198 <= $signed((wire190 <= wire191[(4'hc):(4'h9)]));
      reg199 <= $signed((8'ha2));
      if ($signed(($signed(((reg197 ? wire195 : (8'hb3)) ?
              wire193[(4'hf):(4'hc)] : (wire195 <<< wire190))) ?
          wire190 : $signed(((^reg199) ?
              $signed(wire191) : $unsigned(reg198))))))
        begin
          reg200 <= wire191[(4'hf):(3'h6)];
          reg201 <= ((+(wire194[(2'h3):(2'h2)] ?
                  ((wire194 & wire194) ? (^wire191) : (~^reg196)) : ({wire193} ?
                      (~wire195) : reg196[(5'h15):(4'h8)]))) ?
              (&reg197) : (wire192[(1'h0):(1'h0)] - (wire190[(2'h2):(1'h0)] >>> $unsigned((8'hbb)))));
          reg202 <= reg198[(3'h6):(3'h5)];
          if (reg198)
            begin
              reg203 <= wire190;
              reg204 <= $unsigned({($unsigned($signed(reg202)) ?
                      reg202 : $signed($signed(wire195)))});
            end
          else
            begin
              reg203 <= $unsigned((reg201 ?
                  (wire190[(3'h6):(1'h0)] == reg198) : wire190[(4'ha):(3'h7)]));
              reg204 <= reg198;
              reg205 <= (~^reg201);
              reg206 <= $signed(wire190[(3'h6):(2'h3)]);
              reg207 <= (+$signed(($signed(reg205[(2'h2):(1'h1)]) ^~ $signed((^~(8'had))))));
            end
        end
      else
        begin
          reg200 <= $signed((!(^$unsigned(((8'ha7) ? reg200 : wire193)))));
          reg201 <= (($unsigned(reg202) && $signed((((8'ha3) && (8'ha8)) | {reg198}))) && (&((reg203 && $signed(reg205)) ?
              ((reg200 < wire195) ^ (reg205 & reg202)) : (-$unsigned(reg203)))));
          reg202 <= ((wire193 == ($unsigned(reg207) ?
              {$signed(reg203),
                  ((8'hae) ?
                      reg207 : wire192)} : reg202[(1'h0):(1'h0)])) << wire191[(4'hd):(4'h8)]);
          if (((((7'h41) >> wire190[(3'h7):(3'h5)]) ?
              (~wire194) : $unsigned((reg205 > (reg205 ?
                  (8'haf) : reg201)))) ^~ $unsigned(reg205)))
            begin
              reg203 <= ($unsigned($unsigned(wire192[(3'h5):(2'h3)])) + {$signed(reg205),
                  (!{$signed(wire194)})});
              reg204 <= ((&(^({reg196, reg205} ?
                  (reg202 || reg204) : reg198))) >= {wire193});
              reg205 <= $signed((!reg204));
              reg206 <= (|(~&$unsigned($unsigned((reg199 <<< reg207)))));
              reg207 <= (~($signed(wire191[(4'h9):(3'h7)]) ?
                  (wire194 ?
                      $unsigned($unsigned(wire191)) : $signed({reg198,
                          (8'ha7)})) : ($unsigned(reg198) ?
                      $signed((reg207 ?
                          reg196 : reg200)) : $unsigned($unsigned(reg205)))));
            end
          else
            begin
              reg203 <= (wire190 ?
                  {(&reg202)} : (^$unsigned({$signed(reg198)})));
            end
          if (wire195)
            begin
              reg208 <= reg197;
              reg209 <= reg207;
              reg210 <= ($signed($unsigned({(wire194 ^~ (8'hb9))})) ?
                  $unsigned((reg203 ?
                      $unsigned(wire194) : (~^$unsigned(reg209)))) : ($signed($signed(wire195)) >> (8'hbc)));
              reg211 <= (&$unsigned(reg210[(3'h4):(3'h4)]));
            end
          else
            begin
              reg208 <= $unsigned((($unsigned((8'hab)) || (-reg199[(2'h3):(1'h0)])) ?
                  ({wire194[(1'h1):(1'h0)]} ?
                      (wire194 >>> (~^reg211)) : wire194[(2'h2):(1'h0)]) : reg207[(5'h12):(3'h4)]));
            end
        end
    end
  assign wire212 = $signed((&reg201));
  assign wire213 = $signed(($signed(($unsigned(reg204) ?
                       wire212[(4'h9):(3'h4)] : (wire192 | wire195))) >>> ((+reg210[(4'h9):(4'h8)]) ~^ ((reg202 ?
                       reg205 : reg211) | (reg211 <<< (7'h41))))));
  assign wire214 = (reg199 != ((~({wire192} ?
                       (reg203 ?
                           (8'h9d) : (8'hb8)) : (wire195 << reg207))) && (((^wire191) * (~^reg210)) | $unsigned((wire195 ?
                       wire191 : reg201)))));
  always
    @(posedge clk) begin
      reg215 <= wire212;
    end
  assign wire216 = wire193[(1'h1):(1'h1)];
  assign wire217 = {($signed((reg201 != $unsigned(reg201))) ?
                           (wire213 ~^ (+$signed(reg202))) : wire195[(4'ha):(1'h1)]),
                       $signed((8'haf))};
  assign wire218 = (~({(reg198[(3'h4):(1'h0)] - {(7'h43)})} << reg206[(4'hb):(4'hb)]));
  assign wire219 = ((wire212[(4'ha):(4'h8)] + reg203) ?
                       (&(8'hbd)) : $signed(reg199[(1'h0):(1'h0)]));
  assign wire220 = {$signed($signed($signed($unsigned(wire190))))};
  assign wire221 = ((($signed((wire217 ? (8'hb8) : wire195)) - {(reg199 ?
                                   wire191 : wire218),
                               wire195}) ?
                           $signed((reg203 ?
                               (wire214 > reg210) : $unsigned(wire214))) : reg205[(1'h1):(1'h1)]) ?
                       wire214 : ((reg215 ~^ (!(^~reg197))) ?
                           ((|{reg197, wire220}) ?
                               (reg211 == (&reg205)) : $unsigned((reg215 ?
                                   reg200 : (8'haa)))) : reg215[(5'h11):(5'h11)]));
endmodule

module module170
#(parameter param183 = ((({(^~(8'had)), ((8'had) ? (7'h41) : (8'hb8))} ? ((&(8'had)) ? {(8'haa), (8'hbe)} : (!(8'hb4))) : ((!(8'hb1)) && ((8'hb1) << (8'ha8)))) && ((7'h42) >> (~^(8'hb1)))) ? (((((7'h42) - (8'ha8)) * ((8'hb1) - (8'h9f))) ? ((+(8'haf)) + {(8'hb1)}) : ((!(8'hb6)) < ((8'ha6) >> (8'hab)))) != (~|(((8'h9f) - (8'ha3)) ? {(8'ha4), (8'hbf)} : (^(8'hb8))))) : {({(~(8'hbd)), (&(8'hab))} ? ({(8'ha8), (8'h9e)} != ((8'h9f) ? (8'hb3) : (8'haa))) : (((8'had) >>> (8'h9e)) != ((8'ha1) - (8'hb9)))), (~&{{(8'h9e), (8'ha9)}})}))
(y, clk, wire174, wire173, wire172, wire171);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire174;
  input wire signed [(5'h13):(1'h0)] wire173;
  input wire [(3'h4):(1'h0)] wire172;
  input wire [(3'h4):(1'h0)] wire171;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(2'h2):(1'h0)] wire179;
  wire [(3'h6):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire176;
  wire signed [(4'ha):(1'h0)] wire175;
  reg signed [(3'h6):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire178,
                 wire176,
                 wire175,
                 reg182,
                 reg181,
                 reg177,
                 (1'h0)};
  assign wire175 = $unsigned((^~wire173));
  assign wire176 = {($signed($unsigned((^~wire172))) >>> wire174)};
  always
    @(posedge clk) begin
      reg177 <= $unsigned($signed(((wire175[(4'ha):(3'h7)] << (wire174 < wire175)) ?
          wire175[(2'h2):(2'h2)] : wire173[(4'h8):(2'h2)])));
    end
  assign wire178 = (~&wire173[(4'hf):(4'hb)]);
  assign wire179 = (($unsigned((~(wire172 ?
                       wire178 : wire173))) ^ $signed(wire178)) < {(($unsigned(wire178) ?
                               $signed(wire173) : (^(8'ha7))) ?
                           wire176[(4'hc):(4'h9)] : wire176[(2'h3):(2'h3)]),
                       $signed($unsigned($signed(wire171)))});
  assign wire180 = {$unsigned((wire179[(1'h0):(1'h0)] ?
                           (~&wire173[(4'hc):(4'h9)]) : $unsigned(wire175[(4'h8):(2'h3)]))),
                       {(($unsigned(wire173) != $unsigned(wire176)) ?
                               (8'ha2) : (wire178[(1'h0):(1'h0)] & $unsigned(wire173))),
                           $unsigned($signed(wire172[(1'h0):(1'h0)]))}};
  always
    @(posedge clk) begin
      reg181 <= wire175[(3'h6):(3'h5)];
      reg182 <= ($signed((((wire173 + wire175) ?
              wire180[(3'h7):(3'h4)] : (wire180 <<< wire176)) * ((wire171 ?
                  wire178 : wire172) ?
              $signed(wire173) : (wire172 < wire175)))) ?
          reg181[(2'h3):(2'h2)] : ($signed($unsigned(wire178[(1'h1):(1'h0)])) ?
              ($signed((&(8'ha1))) ?
                  (-wire179) : wire171[(2'h3):(1'h0)]) : $signed((8'hbb))));
    end
endmodule

module module96  (y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h2c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire101;
  input wire [(2'h3):(1'h0)] wire100;
  input wire [(3'h5):(1'h0)] wire99;
  input wire signed [(5'h12):(1'h0)] wire98;
  input wire [(4'hc):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire163;
  wire [(3'h7):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire [(4'ha):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(5'h11):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(3'h4):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire140,
                 wire139,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
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
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire102 = wire101[(4'hb):(1'h0)];
  assign wire103 = $unsigned((-wire101));
  assign wire104 = {wire99};
  assign wire105 = $signed(wire97);
  always
    @(posedge clk) begin
      if ($unsigned({(({(8'hbb)} - $signed(wire103)) ^~ {(wire101 ?
                  wire97 : wire103)}),
          $unsigned((~wire97))}))
        begin
          if (wire105)
            begin
              reg106 <= (7'h41);
              reg107 <= ($unsigned(wire100[(1'h1):(1'h1)]) ?
                  (($signed((~&wire102)) ?
                          (~^wire98[(4'h9):(3'h6)]) : reg106[(1'h0):(1'h0)]) ?
                      (8'ha4) : wire102[(3'h4):(1'h0)]) : wire104);
              reg108 <= ($signed($signed($signed((^~reg107)))) ?
                  ($unsigned(((7'h44) ^ ((8'h9c) ?
                      wire100 : wire103))) + wire101) : wire102[(3'h5):(3'h5)]);
              reg109 <= $unsigned($signed(wire102[(2'h3):(1'h1)]));
              reg110 <= (($signed($signed(wire98)) && $unsigned($unsigned((wire97 + wire102)))) ?
                  (((~^$unsigned(wire98)) ?
                          $signed($signed((8'hb1))) : ({reg107,
                              reg108} & (reg109 ? reg109 : wire101))) ?
                      wire105 : (8'ha7)) : ($signed($signed((wire103 >> wire97))) ?
                      wire104[(1'h1):(1'h0)] : ($unsigned($signed(wire103)) ?
                          $unsigned($signed(wire101)) : (wire101[(4'hb):(4'h9)] ?
                              (reg107 ? reg109 : reg107) : {(8'hb7)}))));
            end
          else
            begin
              reg106 <= $signed($unsigned($signed(wire98[(4'ha):(2'h3)])));
            end
          reg111 <= reg107[(4'ha):(3'h4)];
        end
      else
        begin
          reg106 <= reg106[(1'h1):(1'h1)];
        end
      reg112 <= {(wire100[(1'h0):(1'h0)] ?
              (-(reg107 ?
                  wire98 : $unsigned(wire102))) : $signed(reg106[(1'h0):(1'h0)])),
          (8'ha7)};
      if ((+{$unsigned({wire103[(2'h2):(1'h0)]})}))
        begin
          reg113 <= wire98;
          reg114 <= reg111[(2'h2):(1'h1)];
        end
      else
        begin
          reg113 <= ({(~&$signed(reg110[(1'h0):(1'h0)]))} != (~|(~wire102)));
        end
      reg115 <= {reg111};
      if ($unsigned((reg109[(4'h8):(2'h2)] ?
          reg113 : (wire102 ?
              ({(8'ha8)} <= (|wire98)) : wire102[(2'h2):(1'h1)]))))
        begin
          if ((wire99 | (!(8'ha1))))
            begin
              reg116 <= $signed($signed($unsigned((&{(8'h9e), reg111}))));
              reg117 <= (reg109 - (reg106[(2'h2):(2'h2)] == ({$unsigned(wire98)} ?
                  ((reg111 ? reg115 : reg115) ?
                      (wire98 ~^ wire102) : (^~wire101)) : wire100)));
            end
          else
            begin
              reg116 <= reg108[(3'h4):(1'h0)];
              reg117 <= wire105;
            end
          reg118 <= (reg108 ?
              {wire103[(4'hb):(3'h5)],
                  ((&$unsigned(reg110)) >> $signed(((8'ha7) ^~ reg114)))} : $signed($signed($unsigned((reg114 != reg117)))));
          reg119 <= (^(!(reg106 | ($signed((8'hbe)) == (~&wire103)))));
          reg120 <= reg118[(4'h8):(3'h6)];
          reg121 <= (^~$unsigned(reg115));
        end
      else
        begin
          reg116 <= reg106;
        end
    end
  always
    @(posedge clk) begin
      if (reg108)
        begin
          reg122 <= $signed($signed($signed($signed(reg106[(1'h0):(1'h0)]))));
          reg123 <= $signed(wire102);
          if (reg110[(2'h3):(1'h1)])
            begin
              reg124 <= (+{$unsigned(((reg110 ? wire102 : reg117) ?
                      $unsigned((8'hae)) : reg113))});
            end
          else
            begin
              reg124 <= (($unsigned($signed((reg121 ? reg109 : reg109))) ?
                  reg123 : $unsigned(($signed(reg106) ?
                      (^~reg106) : $unsigned(wire102)))) > (wire102[(4'h8):(2'h3)] || ((^~$signed(reg119)) >= wire98[(3'h7):(2'h3)])));
              reg125 <= reg109;
              reg126 <= reg110[(1'h1):(1'h1)];
              reg127 <= $unsigned($signed((((7'h43) ?
                      ((7'h42) ^~ reg113) : $signed(reg117)) ?
                  reg111 : (|{reg114}))));
              reg128 <= reg125[(1'h1):(1'h1)];
            end
          reg129 <= (8'hbf);
          reg130 <= reg110[(2'h2):(1'h0)];
        end
      else
        begin
          reg122 <= ($signed(reg122[(2'h2):(1'h1)]) <<< $signed((reg128 ?
              $signed(reg120) : $signed($signed((7'h40))))));
        end
      if (reg108)
        begin
          reg131 <= reg130;
          reg132 <= {{((8'hb1) ?
                      ((reg124 ?
                          reg117 : wire105) ~^ (reg128 <= reg119)) : (|(~|wire103))),
                  (wire105[(2'h2):(2'h2)] <= ($unsigned((8'ha1)) ?
                      $signed((8'hba)) : reg108))}};
          if (reg129)
            begin
              reg133 <= reg113[(1'h0):(1'h0)];
            end
          else
            begin
              reg133 <= $signed($signed(((~|wire101) ? {(-reg106)} : reg125)));
              reg134 <= {$unsigned((reg132[(2'h2):(2'h2)] && {wire100,
                      $signed(reg108)})),
                  ({reg123[(4'h8):(4'h8)]} ?
                      ((~(^~(8'ha3))) ?
                          {(reg109 ? reg131 : reg116),
                              $unsigned(wire105)} : wire101) : (reg122 | reg119[(3'h5):(1'h0)]))};
            end
        end
      else
        begin
          if (wire105[(1'h1):(1'h0)])
            begin
              reg131 <= $signed(((8'h9f) & {reg118, reg115}));
              reg132 <= wire100;
            end
          else
            begin
              reg131 <= wire101;
              reg132 <= (!$signed(reg114[(2'h3):(2'h3)]));
              reg133 <= reg108;
              reg134 <= (($signed((&(!reg128))) > wire99) ?
                  reg111[(1'h1):(1'h1)] : (^~(+$signed($unsigned(reg134)))));
              reg135 <= reg118;
            end
          reg136 <= reg121[(4'h8):(3'h5)];
          reg137 <= ($unsigned(reg119[(4'hc):(4'hb)]) * $unsigned(($unsigned((wire99 >> reg126)) ?
              ((wire98 >>> reg127) ^~ (&wire97)) : wire103)));
          reg138 <= reg131;
        end
    end
  assign wire139 = (reg127[(4'h8):(3'h4)] ?
                       (({(!reg128),
                           $unsigned(wire97)} & reg108) * $unsigned(((-(8'ha0)) == wire102))) : wire105);
  assign wire140 = ((|(~|((+reg119) <<< reg118[(3'h5):(3'h5)]))) ?
                       $signed($unsigned($unsigned((wire97 ?
                           wire97 : reg128)))) : (-(8'ha5)));
  always
    @(posedge clk) begin
      reg141 <= ((reg115[(4'hb):(1'h0)] >= $unsigned((reg109 >> (reg135 ?
          wire102 : wire100)))) > {((^reg116[(3'h6):(2'h2)]) ?
              $signed((reg128 <= reg108)) : (((8'had) ? reg123 : reg127) ?
                  $signed(reg138) : (|reg118)))});
      reg142 <= (7'h42);
      reg143 <= reg132;
      reg144 <= (8'hb9);
      reg145 <= reg107[(5'h11):(3'h7)];
    end
  assign wire146 = {reg119, (reg111 ? reg110 : wire104)};
  assign wire147 = (~^reg113[(4'he):(4'h8)]);
  assign wire148 = (reg134 >= (8'h9c));
  assign wire149 = reg141[(3'h5):(2'h2)];
  assign wire150 = (~|reg116);
  assign wire151 = $unsigned($signed($signed($unsigned((reg137 ?
                       reg122 : reg109)))));
  assign wire152 = reg111;
  assign wire153 = (reg106 * reg115);
  always
    @(posedge clk) begin
      if (($signed((&{$unsigned(reg112), (reg145 ? wire102 : wire149)})) ?
          wire147[(3'h4):(1'h0)] : reg113[(3'h6):(3'h4)]))
        begin
          reg154 <= reg123;
          reg155 <= {((8'h9c) ?
                  $unsigned(reg111) : $unsigned(($signed(wire140) ?
                      (reg134 - reg107) : $unsigned(reg143))))};
        end
      else
        begin
          reg154 <= (($signed($unsigned($signed(wire153))) >= ($signed((reg134 ?
                      wire146 : reg108)) ?
                  (^$signed(wire153)) : {((8'hb6) << reg129), reg138})) ?
              reg122[(4'hd):(2'h3)] : {reg106[(1'h1):(1'h0)]});
          if (reg121)
            begin
              reg155 <= reg112[(3'h6):(3'h6)];
            end
          else
            begin
              reg155 <= (reg124[(3'h4):(2'h3)] == $unsigned(wire101[(3'h7):(2'h3)]));
            end
          reg156 <= reg137[(2'h2):(1'h1)];
        end
      reg157 <= (reg117 ? (wire105 | reg120) : reg136[(2'h3):(1'h0)]);
      reg158 <= (($signed(((reg132 < wire140) - reg114)) ?
              ({reg106} << reg113) : $signed($unsigned(reg128))) ?
          (((~&wire139) ?
              ($signed((8'had)) && (~^reg115)) : wire139) || reg127) : (|((-(~reg131)) || (~^(!reg108)))));
      if (reg106[(1'h0):(1'h0)])
        begin
          reg159 <= $unsigned((&reg117));
          reg160 <= (&reg109[(1'h0):(1'h0)]);
          reg161 <= reg130;
        end
      else
        begin
          reg159 <= (~&{$unsigned(((wire147 != reg138) ^~ (+reg126))),
              (({reg128} ?
                  $signed(wire146) : (^~reg118)) ^~ (+$signed(wire153)))});
          reg160 <= ((^~$unsigned(((reg109 ?
              reg145 : (8'ha0)) || reg136[(4'hb):(4'h9)]))) >>> (reg159 ^~ $unsigned(((~&(8'hb8)) ?
              {wire103} : reg129))));
        end
      reg162 <= ($signed(reg108) ?
          wire149 : (^$signed($signed((reg110 >= reg107)))));
    end
  assign wire163 = reg119[(4'hf):(4'h8)];
  assign wire164 = $unsigned($signed($signed($signed(((8'ha6) >= (8'ha8))))));
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h328):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire82,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire49,
                 wire48,
                 wire47,
                 wire35,
                 wire34,
                 wire33,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg70,
                 reg63,
                 reg62,
                 reg61,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire33 = wire32;
  assign wire34 = wire32[(4'hf):(4'hb)];
  assign wire35 = wire31[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed({wire33[(3'h4):(1'h0)]}))
        begin
          reg36 <= {((((wire28 >= wire31) < $unsigned((8'hb2))) <<< ({wire35,
                      (7'h42)} ?
                  (~wire28) : $signed((8'hb6)))) & $signed($unsigned(((8'ha9) >> wire34))))};
        end
      else
        begin
          if ((wire33[(3'h5):(3'h4)] << $unsigned($signed((~&(reg36 == wire28))))))
            begin
              reg36 <= ((reg36 ?
                  {$signed((8'hb9))} : $unsigned($signed($unsigned(wire34)))) <<< (-{{$signed((8'ha6))},
                  (^(-wire28))}));
              reg37 <= {(8'ha1), $unsigned(wire35)};
              reg38 <= ($unsigned({wire32}) & $unsigned($signed(wire28[(4'h8):(4'h8)])));
            end
          else
            begin
              reg36 <= wire29[(3'h6):(3'h5)];
              reg37 <= reg36;
            end
          reg39 <= $unsigned(reg38);
          reg40 <= (8'ha1);
          reg41 <= {(((((8'h9c) >>> wire28) == $signed((8'hbd))) ?
                  (^~wire31[(1'h0):(1'h0)]) : (+(wire29 ?
                      wire33 : reg40))) & wire31[(1'h1):(1'h1)]),
              (~&(8'hbd))};
          reg42 <= $unsigned(reg40);
        end
      reg43 <= (!($unsigned({$unsigned(wire32),
          (8'had)}) < {$unsigned((wire35 < wire35))}));
      reg44 <= ((!(((wire30 ~^ reg36) ?
          $signed((8'hbe)) : reg37) * wire30)) + $signed(wire31[(1'h1):(1'h0)]));
    end
  always
    @(posedge clk) begin
      reg45 <= $signed(($unsigned(reg38) ?
          $signed($unsigned($unsigned(wire30))) : reg41[(1'h0):(1'h0)]));
      reg46 <= $signed(($unsigned($unsigned((reg41 <= wire32))) ?
          {$unsigned(reg38)} : (&$signed((reg39 ? reg39 : reg43)))));
    end
  assign wire47 = {$unsigned(((wire29[(4'he):(3'h4)] <<< (reg39 ?
                              wire35 : reg45)) ?
                          ($unsigned(wire29) ?
                              (wire32 ?
                                  wire35 : (8'hb2)) : {wire30}) : wire29)),
                      ($unsigned({(-(8'hb2))}) ?
                          ($signed(reg37) ?
                              $signed(reg46) : $signed(((8'ha3) >>> wire30))) : (~&$signed(wire30[(1'h1):(1'h1)])))};
  assign wire48 = (((reg46 < $signed($unsigned(wire30))) >> $signed($unsigned((-wire31)))) >>> reg40);
  assign wire49 = $unsigned((~|(((wire29 + wire30) ?
                          $unsigned(wire47) : $signed(wire48)) ?
                      ((reg41 >>> wire33) ?
                          reg38 : (^~reg43)) : ($unsigned(reg46) ?
                          ((8'haf) & wire31) : wire29[(4'hf):(3'h5)]))));
  always
    @(posedge clk) begin
      if ((reg43[(3'h6):(1'h1)] ?
          $unsigned({$signed($signed(reg41)),
              ($signed(reg41) ? $unsigned((8'hba)) : reg45)}) : reg40))
        begin
          if ($signed($signed($unsigned(reg40[(4'hb):(3'h6)]))))
            begin
              reg50 <= wire29[(4'hd):(4'h9)];
            end
          else
            begin
              reg50 <= (reg46[(4'h9):(3'h5)] | (!reg44));
              reg51 <= reg46;
              reg52 <= reg41;
            end
          reg53 <= $unsigned($unsigned($unsigned($unsigned((-(8'ha0))))));
          reg54 <= (&$signed(reg38));
          if ({wire28})
            begin
              reg55 <= $unsigned((-(&(8'hbc))));
              reg56 <= reg45;
              reg57 <= {wire48};
              reg58 <= $signed((~|({$signed(reg51), {reg50}} || (^~(wire35 ?
                  reg41 : reg39)))));
              reg59 <= ({(((wire33 << reg57) ? $unsigned(reg50) : (!wire48)) ?
                          reg58 : (reg43[(4'hd):(4'h8)] == wire49[(1'h1):(1'h1)])),
                      (($signed(reg46) ? $signed(wire29) : wire48) ?
                          reg58[(4'hb):(2'h2)] : ({reg44} ?
                              (reg54 < reg51) : (~^reg53)))} ?
                  {$unsigned($unsigned((reg45 > reg41))),
                      $unsigned(({reg41} > reg56[(3'h6):(2'h3)]))} : {((~|reg41) ?
                          {wire33[(2'h3):(2'h3)],
                              {reg43, reg52}} : reg36[(5'h13):(4'hd)])});
            end
          else
            begin
              reg55 <= $unsigned(reg51);
            end
          reg60 <= reg45;
        end
      else
        begin
          if (wire47)
            begin
              reg50 <= (wire35 * $unsigned($unsigned(wire34[(2'h3):(2'h3)])));
              reg51 <= ((~(reg44[(1'h1):(1'h1)] + reg40[(4'he):(4'h9)])) >> $signed(($unsigned($signed(wire35)) >> $unsigned((reg56 ?
                  reg50 : reg50)))));
            end
          else
            begin
              reg50 <= {(^~(($signed(wire28) ? (wire28 & reg51) : (&reg59)) ?
                      (((8'hab) >> reg58) ?
                          (+reg55) : {reg50}) : ($signed(wire48) ?
                          $signed(reg50) : (~|reg52)))),
                  wire29[(4'hc):(2'h2)]};
              reg51 <= wire49[(1'h1):(1'h1)];
              reg52 <= wire31;
            end
        end
      reg61 <= {wire31[(1'h0):(1'h0)], (~&reg53[(4'he):(2'h3)])};
      reg62 <= reg56;
      reg63 <= $unsigned((&wire49));
    end
  assign wire64 = $unsigned(reg43[(3'h7):(1'h1)]);
  assign wire65 = wire47[(2'h2):(2'h2)];
  assign wire66 = (wire64 ? reg59[(3'h4):(2'h3)] : reg43[(1'h1):(1'h0)]);
  assign wire67 = wire29[(4'hf):(4'hc)];
  assign wire68 = reg41[(5'h13):(5'h10)];
  assign wire69 = ((~wire33) ^ reg44[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned($signed(wire49))) ^~ $unsigned($unsigned((&wire29))))))
        begin
          if ((^~(~^($unsigned((reg51 >>> reg41)) <<< $signed($unsigned(reg46))))))
            begin
              reg70 <= $unsigned((~&(^~$signed((reg59 ? reg39 : reg57)))));
              reg71 <= $signed($unsigned((~&({reg38, wire69} ?
                  reg38[(2'h3):(1'h1)] : (|reg45)))));
              reg72 <= (($signed($unsigned(wire64[(2'h2):(2'h2)])) != (reg43[(1'h0):(1'h0)] ?
                      {(&wire32), ((8'ha4) ? reg63 : reg62)} : ((8'ha9) ?
                          (~&reg39) : {(8'hbb)}))) ?
                  {($unsigned((wire49 ? wire32 : reg57)) - {{(8'h9c), reg71},
                          $unsigned(reg36)})} : reg58);
              reg73 <= $signed(((!(-(~^reg50))) <<< $signed($unsigned(wire29[(3'h5):(1'h0)]))));
            end
          else
            begin
              reg70 <= wire35;
              reg71 <= ((~^reg56) ?
                  $unsigned(((reg39 ^ (wire48 ? wire28 : reg58)) ?
                      wire29 : ((wire68 << reg61) ?
                          (~&reg41) : (wire65 < reg56)))) : $signed(wire68));
              reg72 <= $signed(wire47[(2'h2):(2'h2)]);
            end
          reg74 <= (reg60 >>> ((reg55 == (|((8'hb2) ?
              (8'hac) : wire69))) ^~ ({$signed(wire69)} != {$unsigned(reg45),
              $unsigned(reg53)})));
          reg75 <= wire28[(2'h2):(2'h2)];
        end
      else
        begin
          reg70 <= {reg39[(4'hd):(3'h4)]};
          reg71 <= ($unsigned((|$signed((reg42 ? (8'hbc) : (8'hbf))))) | reg72);
          reg72 <= (($signed(((~|reg53) ?
              $signed(reg37) : wire66[(4'h9):(2'h2)])) < (((wire34 < reg54) ?
                  ((8'hbe) - wire48) : (reg75 * (8'hbf))) ?
              $unsigned(wire31) : (wire47 ?
                  (|reg62) : (reg75 ^ wire68)))) ^ reg57[(2'h2):(2'h2)]);
        end
      if ((~^(!(~$signed(reg58[(4'hc):(1'h1)])))))
        begin
          if ((((((8'haa) ? (8'hbc) : (wire30 ? reg73 : wire68)) ?
              reg43[(4'hf):(1'h1)] : $signed(reg61)) == ($signed((reg57 <= reg56)) ?
              $signed((~(8'hbf))) : (+{reg41,
                  reg56}))) >> $signed(wire48[(4'hf):(4'h9)])))
            begin
              reg76 <= (~^$unsigned($signed(reg57)));
            end
          else
            begin
              reg76 <= (((reg43 ~^ ((wire34 ? reg72 : reg46) && ((8'ha1) ?
                          reg59 : wire28))) ?
                      (~($unsigned(reg40) * (-wire32))) : $unsigned((^$unsigned(wire32)))) ?
                  reg73 : (8'hb0));
              reg77 <= wire33;
            end
          reg78 <= ($unsigned(wire48[(4'hc):(1'h1)]) ?
              $unsigned(({reg38, wire69} >> ({reg71, reg71} - (wire30 ?
                  reg37 : reg61)))) : ({reg60[(2'h2):(1'h0)],
                  ({reg53} != {reg50, reg71})} >> reg72));
          reg79 <= (~&($signed((~|((8'ha3) ^ reg39))) ?
              (8'ha4) : (&(((8'hbe) ?
                  wire69 : reg72) ~^ reg56[(2'h3):(2'h3)]))));
          reg80 <= reg78[(4'hb):(1'h1)];
          reg81 <= (8'hb4);
        end
      else
        begin
          reg76 <= (~{$signed((|reg80[(5'h11):(3'h5)]))});
          reg77 <= $unsigned($unsigned((reg42[(4'ha):(4'h8)] & (~(reg50 ?
              reg38 : reg38)))));
        end
    end
  assign wire82 = (&$signed($unsigned((8'hb5))));
  always
    @(posedge clk) begin
      reg83 <= $signed(($signed($signed((reg36 ?
          wire49 : reg46))) * (reg76[(2'h2):(2'h2)] > reg75)));
      reg84 <= wire48;
      reg85 <= (&$unsigned($unsigned($signed({wire65}))));
      if ({$unsigned({$signed((wire34 ^ reg43)),
              $unsigned(((8'haf) || wire29))})})
        begin
          reg86 <= $signed(($signed((-{reg38,
              reg53})) & $signed($signed($unsigned(reg42)))));
          reg87 <= {{(((wire32 ? (8'hae) : wire66) + (~^wire68)) >> (+(reg45 ?
                      wire32 : wire28)))}};
          reg88 <= (^(reg60[(2'h3):(2'h2)] ?
              reg57 : $unsigned({wire33[(1'h1):(1'h0)]})));
          reg89 <= (reg45 ~^ reg40);
        end
      else
        begin
          reg86 <= reg78[(4'hc):(1'h1)];
          reg87 <= $signed(({wire34} ~^ $signed(reg58[(1'h1):(1'h0)])));
          reg88 <= reg76;
          reg89 <= (+wire49[(2'h2):(2'h2)]);
          reg90 <= ((!reg85[(1'h1):(1'h1)]) ? (8'hbb) : wire64);
        end
    end
  assign wire91 = $unsigned($unsigned(reg80[(4'hf):(3'h6)]));
  assign wire92 = (!$unsigned(reg73[(2'h2):(2'h2)]));
  assign wire93 = reg36;
endmodule
