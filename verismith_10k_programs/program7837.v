module top
#(parameter param238 = ({(-{((8'ha1) > (8'hb9)), ((8'had) ^~ (8'hb2))})} ? ((+(((8'hb0) * (8'hb8)) ? ((8'ha0) ^~ (8'hb9)) : ((8'hac) ? (8'hb1) : (8'hbc)))) ? (&(((8'ha9) >> (8'haa)) > ((8'haa) < (7'h42)))) : (-(|((8'h9f) & (8'hbd))))) : (^(((-(8'hbe)) >> ((8'hba) ? (8'hb4) : (8'hbd))) ~^ {((8'hbe) >> (8'ha7))}))), 
parameter param239 = (^~((^~(8'ha0)) || (7'h44))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire237;
  wire [(2'h3):(1'h0)] wire236;
  wire signed [(3'h6):(1'h0)] wire235;
  wire signed [(2'h3):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  wire [(2'h2):(1'h0)] wire229;
  wire signed [(4'h9):(1'h0)] wire228;
  wire signed [(5'h10):(1'h0)] wire227;
  wire [(5'h13):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire192;
  wire signed [(2'h2):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire225;
  reg [(4'he):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg232 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg224 = (1'h0);
  reg [(2'h2):(1'h0)] reg223 = (1'h0);
  reg [(5'h12):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg221 = (1'h0);
  reg [(3'h5):(1'h0)] reg220 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg217 = (1'h0);
  reg [(4'hf):(1'h0)] reg216 = (1'h0);
  reg [(4'hb):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(4'he):(1'h0)] reg207 = (1'h0);
  reg [(3'h6):(1'h0)] reg206 = (1'h0);
  reg [(5'h14):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg [(5'h15):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg [(3'h4):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire237,
                 wire236,
                 wire235,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire153,
                 wire155,
                 wire192,
                 wire214,
                 wire225,
                 reg234,
                 reg233,
                 reg232,
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
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((((~|$signed((8'hae))) ?
              (+(wire2 > wire3)) : wire1) > ({(-wire1), (wire3 || wire2)} ?
              (-(wire4 << wire3)) : ((wire3 ^ wire2) ?
                  wire0[(3'h7):(2'h3)] : $signed(wire4)))) ?
          wire0 : wire0);
    end
  module6 #() modinst154 (wire153, clk, reg5, wire4, wire3, wire1, wire2);
  assign wire155 = reg5;
  module156 #() modinst193 (.wire158(wire0), .clk(clk), .y(wire192), .wire157(wire3), .wire160(wire2), .wire159(wire1));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg194 <= $unsigned((~&{$unsigned((wire2 ? wire3 : reg5))}));
          reg195 <= $signed((reg194[(3'h6):(3'h4)] >>> ((^~(&wire153)) > (8'hae))));
          reg196 <= wire1;
        end
      else
        begin
          reg194 <= reg194[(3'h6):(2'h3)];
          if (((~&{$unsigned((wire3 ? reg195 : wire0)),
                  reg195[(3'h4):(2'h2)]}) ?
              ($signed((wire192 && wire192)) << $signed($signed(((7'h41) ?
                  wire192 : wire192)))) : ((reg196[(4'h9):(1'h0)] >> (~wire2)) | $unsigned($signed({(8'ha3),
                  wire2})))))
            begin
              reg195 <= (^$unsigned(reg196[(3'h5):(1'h0)]));
              reg196 <= reg5[(3'h4):(2'h3)];
            end
          else
            begin
              reg195 <= (wire3[(2'h2):(1'h1)] ? reg194 : wire3[(2'h2):(2'h2)]);
            end
          reg197 <= $signed((reg196 ? wire0 : $unsigned($unsigned((8'ha0)))));
        end
      if ($unsigned((reg197[(4'hc):(4'hb)] <<< wire3[(2'h3):(2'h2)])))
        begin
          reg198 <= $signed(wire3[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg195)
            begin
              reg198 <= ($signed(($signed($signed(reg198)) - $unsigned({wire1}))) > {$signed((((8'hbc) > (7'h43)) != $signed((8'ha7)))),
                  ($signed(wire153[(4'hd):(4'hd)]) ?
                      reg194 : $unsigned((reg195 ^ (7'h44))))});
              reg199 <= {$signed(reg5[(3'h6):(3'h6)]), (!wire3[(1'h0):(1'h0)])};
              reg200 <= reg197[(3'h7):(3'h6)];
              reg201 <= wire2[(4'h8):(1'h0)];
              reg202 <= wire4;
            end
          else
            begin
              reg198 <= $signed((&$unsigned($signed(((8'hbc) << reg195)))));
              reg199 <= ({($signed($signed(wire1)) ?
                          (~((8'ha6) - reg197)) : $signed((^reg201))),
                      ($signed((-reg201)) | $unsigned(reg196[(1'h0):(1'h0)]))} ?
                  $unsigned(reg199[(4'h9):(1'h0)]) : (((~^(reg200 >> (8'hb7))) <<< ($unsigned(wire3) == wire4)) ?
                      {wire2[(5'h10):(3'h6)],
                          $signed($signed(wire1))} : (wire192[(2'h3):(2'h3)] ?
                          $signed(reg200) : reg196)));
              reg200 <= (wire3[(1'h0):(1'h0)] >>> $signed($signed($unsigned($unsigned(wire3)))));
              reg201 <= $signed(wire2[(4'hd):(4'hc)]);
              reg202 <= (((+wire2[(4'h9):(3'h7)]) ?
                      reg199 : wire192[(3'h4):(2'h3)]) ?
                  ($unsigned(((wire192 < reg195) <= reg198[(3'h5):(3'h4)])) <= (reg195[(1'h0):(1'h0)] ?
                      ((reg201 < (8'h9e)) ?
                          wire0 : $signed(reg199)) : {(!wire3)})) : $signed($unsigned((|reg5))));
            end
          reg203 <= wire2[(4'hb):(1'h1)];
          reg204 <= wire2[(5'h12):(4'hb)];
          reg205 <= {{(((&wire0) << {reg5}) ?
                      ((8'hb3) != $unsigned((8'hac))) : ((&reg197) ^ reg201[(3'h5):(3'h5)])),
                  wire3[(1'h1):(1'h1)]},
              ((^($signed(reg196) | (reg202 ? reg203 : wire153))) ?
                  (^~reg199) : (|((wire3 << reg203) ? reg203 : (|wire153))))};
        end
      if (($signed($signed((&$unsigned(reg194)))) >= $signed((^(^~(reg5 ?
          wire192 : (8'ha7)))))))
        begin
          if (wire0)
            begin
              reg206 <= wire1[(3'h5):(3'h5)];
            end
          else
            begin
              reg206 <= ((!$signed($signed($unsigned(wire155)))) + reg194);
              reg207 <= (~^(wire1 == reg202));
              reg208 <= ({(~|reg199)} < reg205);
              reg209 <= $signed(reg195[(1'h0):(1'h0)]);
            end
          reg210 <= ($unsigned((8'hbc)) << reg199);
        end
      else
        begin
          reg206 <= reg208;
          reg207 <= $signed(wire0);
          reg208 <= (reg208 ? reg210 : reg210[(1'h1):(1'h0)]);
          reg209 <= {(((wire192[(4'ha):(2'h2)] ?
                  (reg194 ?
                      reg207 : reg197) : (~wire3)) >>> $unsigned($unsigned((8'hb4)))) >= (~&reg200[(2'h2):(1'h1)])),
              $unsigned(({$unsigned(reg5), reg195} + {(-(8'hb2)),
                  (reg207 == reg5)}))};
          reg210 <= reg207[(3'h7):(2'h2)];
        end
      if (($signed(reg5[(4'hc):(3'h5)]) ?
          {$unsigned({$unsigned(reg207)}),
              $unsigned((reg199 ~^ reg202))} : $unsigned({$unsigned(((8'ha0) ?
                  reg210 : reg203))})))
        begin
          reg211 <= reg207;
        end
      else
        begin
          reg211 <= reg206[(3'h4):(2'h3)];
          reg212 <= (!$unsigned((&$signed(reg199))));
        end
      reg213 <= $unsigned((reg208[(4'hb):(1'h0)] >> (reg211 * (reg212 >>> $signed(wire2)))));
    end
  assign wire214 = $unsigned($unsigned((~(-(~|(8'hbf))))));
  always
    @(posedge clk) begin
      if ($signed(((8'h9e) >>> ((^(+wire214)) <<< (reg202[(1'h1):(1'h0)] > $signed(reg210))))))
        begin
          reg215 <= $unsigned(reg210[(4'hc):(3'h4)]);
          reg216 <= $signed(($signed(({reg207} ?
              (reg203 >= reg215) : wire0)) < (wire3 ?
              $unsigned({wire0}) : $unsigned(reg201[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg215 <= $unsigned(($signed(reg208) ?
              ({$unsigned(wire153), reg202[(2'h2):(1'h0)]} ?
                  $unsigned(reg215) : (~(~|reg216))) : wire0));
        end
      if ($unsigned((8'ha9)))
        begin
          reg217 <= ($signed(($unsigned((reg208 ? (7'h43) : (8'ha3))) ?
                  $signed((reg199 <= reg199)) : (^~{reg195, (8'ha4)}))) ?
              $signed(($signed(wire3[(1'h0):(1'h0)]) ?
                  ((8'hb2) ?
                      (reg213 ~^ (8'hb3)) : $unsigned((7'h44))) : (reg203 ?
                      (wire0 <= wire192) : reg197))) : $signed(((&reg5[(4'ha):(3'h4)]) ~^ ($unsigned(reg207) > $unsigned((8'hb6))))));
          reg218 <= ((($unsigned(((8'hb8) ^~ (7'h43))) << $signed(reg206)) ?
              reg201[(1'h0):(1'h0)] : ((&((8'hb1) - reg195)) ?
                  $unsigned((reg198 ?
                      reg199 : wire192)) : wire3)) < ($signed(($unsigned(reg211) ?
              wire0 : {(8'hbf)})) <<< (&(((8'h9d) * wire2) == $signed(reg5)))));
          reg219 <= wire153[(3'h5):(3'h5)];
          reg220 <= reg209;
          reg221 <= $signed($signed(reg220[(2'h2):(1'h0)]));
        end
      else
        begin
          reg217 <= (-((~|wire192) ? reg202 : (~|reg219)));
          reg218 <= (-{wire1});
          if (reg210)
            begin
              reg219 <= $signed(reg215);
              reg220 <= (8'hbd);
            end
          else
            begin
              reg219 <= ((|(wire0 <= $unsigned(wire4))) ?
                  $unsigned((((!reg198) ? reg206[(3'h5):(1'h1)] : wire2) ?
                      reg212[(2'h2):(2'h2)] : reg195)) : $unsigned((+$unsigned(reg198[(2'h2):(1'h1)]))));
              reg220 <= (reg204 < (-(!reg206[(1'h0):(1'h0)])));
              reg221 <= (|(~^reg220));
            end
          reg222 <= $signed(($signed({(~^reg205),
              {reg195}}) + reg220[(2'h2):(1'h0)]));
          reg223 <= ((^~reg212[(2'h2):(2'h2)]) ?
              wire155[(2'h2):(1'h0)] : reg206);
        end
      reg224 <= (reg211 ?
          wire192 : (&(reg196[(4'he):(4'ha)] ?
              reg221[(5'h12):(4'h9)] : reg202[(2'h2):(1'h1)])));
    end
  module67 #() modinst226 (.wire69(reg216), .wire72(wire153), .clk(clk), .wire71(reg197), .y(wire225), .wire68(reg213), .wire70(reg203));
  assign wire227 = ((((&((8'hb3) <= wire192)) || ($unsigned(wire1) ?
                           reg202 : {reg208, reg224})) ?
                       $signed(reg219[(1'h1):(1'h0)]) : $unsigned(wire155[(2'h3):(2'h3)])) >> reg196[(3'h7):(1'h1)]);
  assign wire228 = reg213;
  assign wire229 = (|reg213[(4'he):(4'h9)]);
  assign wire230 = $unsigned((!(&(~^$signed(reg221)))));
  assign wire231 = wire4[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg232 <= wire1;
      reg233 <= (reg194 >> (8'hb5));
      reg234 <= reg196[(4'he):(3'h4)];
    end
  assign wire235 = (((!(+reg211[(4'ha):(2'h2)])) ?
                           $unsigned($unsigned({(8'hb7)})) : $signed((!(8'hac)))) ?
                       (^~reg232[(4'hb):(4'ha)]) : reg199);
  assign wire236 = (8'ha2);
  assign wire237 = reg219;
endmodule

module module156  (y, clk, wire160, wire159, wire158, wire157);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire160;
  input wire [(5'h15):(1'h0)] wire159;
  input wire signed [(5'h12):(1'h0)] wire158;
  input wire signed [(2'h3):(1'h0)] wire157;
  wire [(5'h11):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire188;
  wire signed [(5'h14):(1'h0)] wire187;
  wire signed [(5'h10):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire174;
  wire signed [(4'hd):(1'h0)] wire170;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  reg signed [(3'h7):(1'h0)] reg190 = (1'h0);
  reg signed [(4'he):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg [(3'h7):(1'h0)] reg179 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg178 = (1'h0);
  reg [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg166 = (1'h0);
  reg [(5'h10):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  assign y = {wire191,
                 wire188,
                 wire187,
                 wire186,
                 wire175,
                 wire174,
                 wire170,
                 wire169,
                 wire168,
                 reg190,
                 reg189,
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
                 reg173,
                 reg172,
                 reg171,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg161 <= (wire159 >= wire157[(2'h3):(1'h1)]);
      if (wire158)
        begin
          reg162 <= ((+$signed((~&(8'h9e)))) ? $signed((~^reg161)) : (8'ha7));
          reg163 <= ((wire158 >> wire158[(4'h8):(3'h4)]) ?
              reg162[(1'h1):(1'h0)] : (wire159 ?
                  reg162[(2'h3):(2'h3)] : $unsigned(($unsigned(reg162) << $signed((8'ha8))))));
          reg164 <= ((wire157 ?
                  ($unsigned(wire160[(1'h0):(1'h0)]) ?
                      ((+(8'hb4)) ?
                          (reg163 | wire158) : (&reg161)) : $unsigned(wire159[(4'h8):(3'h5)])) : (!wire157)) ?
              reg163 : {reg162[(1'h0):(1'h0)], reg162[(1'h1):(1'h0)]});
          reg165 <= $unsigned((wire157 != $unsigned($unsigned($signed(reg164)))));
          reg166 <= wire158;
        end
      else
        begin
          reg162 <= wire158;
          reg163 <= reg161;
          reg164 <= (^((($unsigned((8'hac)) | (reg163 << reg161)) ~^ ((reg162 < reg164) ?
                  reg162 : (wire158 << reg165))) ?
              {($signed(wire160) ? (&wire160) : {reg161, reg165})} : wire159));
          reg165 <= reg162;
          reg166 <= reg163[(1'h1):(1'h1)];
        end
      reg167 <= (^(((reg162 ^ wire159[(5'h13):(3'h5)]) ^~ $signed((~^wire159))) ^~ (((-reg161) && (!wire160)) <= $signed(wire158))));
    end
  assign wire168 = $signed((-reg165));
  assign wire169 = $signed((-reg163));
  assign wire170 = (~&(!(-$unsigned((&wire157)))));
  always
    @(posedge clk) begin
      reg171 <= (($unsigned(((^wire159) ~^ wire160)) <<< reg163) || reg161[(3'h6):(2'h2)]);
      reg172 <= (!{reg166[(1'h0):(1'h0)]});
      reg173 <= ($signed((!(+$signed(wire158)))) << (((-reg166) ?
              ($signed(wire157) || $unsigned(reg172)) : (reg164[(3'h5):(3'h5)] ?
                  wire170 : $unsigned(reg167))) ?
          (~^reg164) : $signed($signed($unsigned((8'hb5))))));
    end
  assign wire174 = $unsigned($signed((((wire158 && (8'ha4)) ?
                       wire160 : (wire168 ? reg173 : (8'hba))) <<< wire158)));
  assign wire175 = (~|{$signed((^(~(8'h9d)))), (~&reg164)});
  always
    @(posedge clk) begin
      reg176 <= $signed(wire160[(1'h1):(1'h1)]);
      if (reg176)
        begin
          reg177 <= $signed(wire159[(3'h4):(3'h4)]);
          reg178 <= (^~(~^$signed(($unsigned(wire159) * wire159[(4'hd):(3'h7)]))));
        end
      else
        begin
          reg177 <= $signed(reg176);
          reg178 <= {$unsigned((((reg166 ?
                  (8'hab) : reg167) & reg178) ^ $unsigned(wire158)))};
          reg179 <= ({($unsigned({wire174}) ?
                      (reg164 ?
                          (~|wire170) : (wire170 ?
                              wire159 : reg161)) : (8'ha7))} ?
              {reg165[(4'hb):(2'h3)],
                  (~&reg171)} : (($unsigned((reg163 ^~ wire175)) ?
                  {(~^reg178),
                      {wire174,
                          reg165}} : wire170[(1'h0):(1'h0)]) < reg161[(4'h9):(3'h4)]));
          reg180 <= reg166[(2'h3):(1'h1)];
        end
      reg181 <= $signed($unsigned($signed($unsigned(reg161[(2'h2):(1'h0)]))));
      if ((~$signed((~|$unsigned((reg173 ? (8'hb8) : wire157))))))
        begin
          reg182 <= reg162;
        end
      else
        begin
          reg182 <= $signed((~^$signed(reg165)));
          reg183 <= reg163;
          reg184 <= ($signed(wire170[(3'h6):(3'h5)]) ?
              ($signed($unsigned((|(8'hb7)))) <<< $unsigned($unsigned($unsigned(reg176)))) : $signed(wire170[(4'h9):(4'h9)]));
          reg185 <= ((8'hae) == {{($signed(wire157) | (!reg164)),
                  ((wire170 >= wire159) < {(8'ha5), reg172})}});
        end
    end
  assign wire186 = (^~(($unsigned((~^reg166)) ?
                       (~reg184) : (reg162 - (reg177 != reg165))) >> wire158));
  assign wire187 = {(~(wire159 ~^ $signed((-reg182)))),
                       $unsigned({wire157[(1'h1):(1'h1)]})};
  assign wire188 = $signed(wire170[(4'hd):(1'h1)]);
  always
    @(posedge clk) begin
      reg189 <= ((~$signed($signed((~^reg177)))) < reg179[(3'h6):(3'h6)]);
      reg190 <= $signed({reg173, $unsigned($signed($unsigned(reg162)))});
    end
  assign wire191 = (reg178[(3'h6):(2'h2)] ?
                       $unsigned((~reg179[(3'h4):(2'h2)])) : $unsigned($unsigned(((reg189 ^ wire159) ?
                           (-reg162) : (+wire170)))));
endmodule

module module6
#(parameter param151 = ((~^((&{(8'haa)}) ? {{(8'hb6), (8'haf)}} : (((8'ha2) ^ (8'haf)) ? {(8'hac)} : (~|(7'h44))))) ? (!({((8'ha8) ? (8'hb3) : (7'h42)), (8'hb5)} <= (((8'ha5) ? (8'hbd) : (7'h40)) ? ((8'hab) << (8'ha2)) : (!(8'hbd))))) : (((((8'hae) & (8'hb8)) >> ((8'hb7) ? (8'hba) : (8'hbc))) ? (~^{(8'h9c), (8'hb6)}) : (((8'hb5) >= (8'hb1)) ? (-(8'haf)) : ((7'h41) ? (8'hb0) : (8'hae)))) ? (&(((8'ha5) ^ (8'hb4)) ? {(8'ha1), (7'h40)} : (~^(7'h41)))) : (~^(~^{(8'hbe), (8'hb1)})))), 
parameter param152 = param151)
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h300):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire149;
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire82,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire12,
                 wire84,
                 wire85,
                 wire105,
                 wire107,
                 wire108,
                 wire109,
                 wire149,
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
                 reg49,
                 reg48,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = wire8[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg13 <= $signed(wire8);
      reg14 <= (~|$signed($signed(wire12)));
      if ($signed((wire9[(2'h3):(1'h1)] << wire7[(1'h0):(1'h0)])))
        begin
          reg15 <= wire8[(2'h2):(2'h2)];
          reg16 <= reg15;
          reg17 <= (wire11[(1'h1):(1'h1)] ?
              $signed($signed($signed($signed(reg15)))) : wire8);
          reg18 <= {{wire8, reg15[(2'h2):(1'h0)]}};
          if ($unsigned(($signed($unsigned($unsigned(reg17))) | wire11[(3'h6):(2'h2)])))
            begin
              reg19 <= {$unsigned((~|$unsigned((~(8'haf))))),
                  ((((reg18 ? reg16 : reg13) ? (+wire7) : (~^wire12)) ?
                          (!(wire9 ? reg18 : reg16)) : wire12) ?
                      ($signed($signed(reg16)) ?
                          ((~^wire10) || reg13) : {(~&reg15),
                              reg13}) : reg14[(1'h1):(1'h0)])};
              reg20 <= (reg18 < (({$unsigned((7'h42)),
                      (^~wire11)} && $signed((reg18 <<< wire7))) ?
                  reg19[(2'h2):(1'h0)] : (^~$unsigned((^~reg13)))));
              reg21 <= ($signed(({(wire7 > wire11),
                      reg13[(4'he):(1'h1)]} ^~ (-(wire11 ? (7'h42) : reg17)))) ?
                  reg20 : wire10[(2'h3):(2'h2)]);
              reg22 <= (reg16[(2'h2):(1'h1)] ?
                  ((wire9 ?
                      $signed(wire10) : reg21) ^ $signed(((reg17 >> reg17) && reg21[(3'h7):(3'h5)]))) : (8'had));
            end
          else
            begin
              reg19 <= wire10;
              reg20 <= $unsigned({reg14,
                  $signed(($unsigned((8'hac)) ?
                      (wire7 & reg18) : $signed(reg15)))});
              reg21 <= $unsigned((!(~^wire7)));
              reg22 <= ({wire12} - {{$signed($unsigned(reg14)),
                      reg14[(1'h1):(1'h0)]},
                  $signed({{wire12}})});
            end
        end
      else
        begin
          if (({{$unsigned($unsigned((8'hb5)))},
              $unsigned($signed((reg19 * reg22)))} & ((-reg18[(2'h2):(1'h0)]) <<< wire10)))
            begin
              reg15 <= ($signed(({$signed(reg15)} ?
                      {(^~(8'ha0)), (reg19 ? (7'h42) : reg21)} : reg18)) ?
                  $signed(wire8[(2'h2):(1'h1)]) : {reg21});
            end
          else
            begin
              reg15 <= $unsigned(reg15[(3'h4):(2'h3)]);
              reg16 <= $signed((~|(reg22 && (reg14 ?
                  $signed(wire11) : ((8'hb9) | reg15)))));
              reg17 <= $signed($unsigned(((!reg13) ?
                  $signed((reg18 ? wire7 : wire8)) : ((wire7 > wire10) ?
                      $signed(reg21) : reg17))));
              reg18 <= ($unsigned((wire7[(4'ha):(4'ha)] ?
                      ($signed(wire8) ?
                          $signed(wire12) : (~&reg20)) : ((^reg19) & $unsigned(wire9)))) ?
                  ({(reg13 ? (reg13 & reg17) : reg14)} ?
                      (reg21 >>> wire10[(4'hb):(4'h9)]) : (+$unsigned($unsigned((8'hb4))))) : $unsigned(((+$signed(wire8)) ?
                      reg18[(2'h2):(2'h2)] : (|$signed(reg16)))));
              reg19 <= $unsigned(reg17[(3'h5):(3'h4)]);
            end
        end
      reg23 <= $unsigned($signed(($signed({reg14, wire12}) ?
          $signed(reg19[(3'h7):(3'h5)]) : $unsigned((|wire7)))));
      reg24 <= (reg14 ? {reg21} : reg20);
    end
  assign wire25 = reg20[(1'h0):(1'h0)];
  assign wire26 = (+$unsigned((-$unsigned($signed(reg22)))));
  assign wire27 = $signed(wire7[(4'hc):(1'h1)]);
  assign wire28 = ($signed(($signed(reg23) ^ ((reg15 ?
                      reg19 : reg16) <<< $unsigned(reg18)))) && ($signed(((reg13 ?
                      (8'hb3) : reg13) - wire10)) - (reg23 ?
                      $signed(reg15) : wire7)));
  always
    @(posedge clk) begin
      if ($signed(($signed((((8'ha2) ? reg20 : reg13) | (reg15 ?
          wire7 : reg24))) ^~ wire8[(1'h0):(1'h0)])))
        begin
          reg29 <= ((^($signed($unsigned(wire11)) ?
              (~|(~wire10)) : wire25)) ~^ $unsigned($unsigned(($unsigned(reg23) ?
              {reg21} : (wire9 ? wire27 : reg16)))));
        end
      else
        begin
          reg29 <= (~^((wire27 >> ($signed(reg17) - (wire27 || reg13))) ?
              wire11 : {((wire28 < reg15) ^ (~^wire9)), $signed((~^(8'hba)))}));
          if (wire26[(4'hd):(1'h1)])
            begin
              reg30 <= $signed(reg23);
            end
          else
            begin
              reg30 <= $signed({$signed(wire26[(1'h0):(1'h0)])});
              reg31 <= reg30[(4'h8):(3'h5)];
            end
          reg32 <= ((((!(-(8'hb0))) <<< (reg19 == (7'h44))) ?
                  {(+$unsigned((8'hba))),
                      wire28[(1'h1):(1'h1)]} : (~|$signed($signed(wire10)))) ?
              reg22 : (!wire8[(2'h2):(1'h0)]));
          if ((reg13[(2'h3):(1'h1)] ?
              reg14[(1'h0):(1'h0)] : ($unsigned(reg23[(4'hb):(3'h6)]) >= (-reg31))))
            begin
              reg33 <= (wire10 ? wire10[(3'h6):(2'h2)] : reg20);
            end
          else
            begin
              reg33 <= (~^(!wire28[(2'h2):(1'h1)]));
              reg34 <= ({wire25} == (~|(($unsigned(reg22) ?
                      {(8'hb9)} : $unsigned(reg21)) ?
                  reg29 : {reg19})));
            end
          reg35 <= ({$unsigned($signed(reg29[(2'h3):(2'h2)])),
              (^~$signed(((8'haa) ? reg21 : reg24)))} <<< (8'ha8));
        end
    end
  always
    @(posedge clk) begin
      if (reg17)
        begin
          if ((reg29[(1'h0):(1'h0)] || $signed(wire26)))
            begin
              reg36 <= (+((wire27 || {wire25[(2'h3):(2'h2)]}) || $unsigned({reg33[(2'h3):(2'h3)],
                  $signed(reg24)})));
              reg37 <= reg30;
            end
          else
            begin
              reg36 <= wire12;
              reg37 <= (((reg31[(2'h3):(2'h3)] << reg16) + {$unsigned(reg18[(2'h2):(1'h0)])}) < ((reg17[(4'h9):(3'h7)] ?
                      $unsigned((~(8'hbf))) : (wire11 ?
                          (~wire8) : $signed((8'hb5)))) ?
                  ((+(wire25 > wire12)) ^~ (reg37 ?
                      $unsigned(reg29) : (~^reg17))) : reg18));
              reg38 <= wire11[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg36 <= {wire11};
          reg37 <= $signed(reg29[(2'h2):(1'h1)]);
          reg38 <= $unsigned((+(^~reg33)));
          if ($unsigned(((!$signed((wire25 >= reg30))) ?
              {$signed(wire26[(4'ha):(4'h8)]),
                  reg20[(2'h2):(1'h0)]} : reg13[(5'h11):(5'h10)])))
            begin
              reg39 <= wire26[(4'h8):(1'h1)];
              reg40 <= reg38[(4'hd):(1'h0)];
            end
          else
            begin
              reg39 <= {(!($signed(reg22[(1'h1):(1'h1)]) < $signed((reg39 && reg32)))),
                  reg16};
              reg40 <= $signed((^(|$signed($signed(reg36)))));
              reg41 <= reg23;
              reg42 <= $unsigned(($unsigned(((reg19 + reg38) ?
                      $unsigned(reg37) : ((8'ha1) ^~ reg36))) ?
                  $unsigned($unsigned((reg31 ? wire9 : wire12))) : reg34));
              reg43 <= ((~^($unsigned((reg40 ? reg15 : reg16)) ?
                      reg19[(1'h1):(1'h0)] : $unsigned(reg20[(1'h0):(1'h0)]))) ?
                  $unsigned($unsigned(($unsigned(reg19) == (wire11 ?
                      wire8 : (8'hab))))) : $unsigned(reg40));
            end
          if ({(reg33 ?
                  reg18 : ({reg13, $unsigned(wire27)} ?
                      reg18[(2'h3):(2'h3)] : ($signed(wire27) <= ((8'hb4) >= reg31))))})
            begin
              reg44 <= ((reg33[(1'h1):(1'h0)] ?
                      $signed($unsigned(reg37[(1'h0):(1'h0)])) : reg29[(1'h1):(1'h0)]) ?
                  ((~reg17[(4'hb):(3'h5)]) != (reg21 ?
                      ((reg36 ? reg42 : reg30) ?
                          (reg18 * (8'ha2)) : $signed(reg35)) : (reg39 ?
                          (reg36 + (8'ha1)) : (reg41 != wire27)))) : (reg33 ?
                      $unsigned($unsigned((wire28 & reg14))) : (^~$unsigned(reg41))));
              reg45 <= $unsigned(reg13[(4'he):(3'h7)]);
              reg46 <= reg31[(1'h0):(1'h0)];
              reg47 <= wire27;
            end
          else
            begin
              reg44 <= {{$unsigned(reg17),
                      (reg43 != $unsigned((reg19 >>> reg21)))},
                  wire7[(3'h6):(2'h2)]};
              reg45 <= wire27[(5'h11):(1'h1)];
            end
        end
      reg48 <= $unsigned((~|($unsigned(reg35) ?
          (8'ha9) : ((wire8 | (7'h43)) >= $unsigned(wire12)))));
      if (((8'ha9) >= $signed(($unsigned((reg48 <<< wire9)) ?
          $unsigned(reg16) : wire7))))
        begin
          reg49 <= reg34;
          if ((reg42 <= (-{((~&(7'h43)) <<< reg48[(3'h6):(3'h5)]), (8'ha3)})))
            begin
              reg50 <= reg45[(3'h5):(3'h5)];
              reg51 <= $signed(wire28);
              reg52 <= (!(!(($unsigned(reg13) * (wire10 ?
                  reg18 : reg41)) >>> (&reg44))));
              reg53 <= ((($signed(wire7[(3'h6):(1'h0)]) || (reg37[(1'h1):(1'h0)] ?
                      {(8'ha2), reg40} : reg32[(2'h2):(1'h1)])) & (8'hb8)) ?
                  {((7'h40) ?
                          (+(reg29 | wire12)) : ((!wire9) ?
                              (reg20 > wire26) : reg22[(4'hd):(2'h3)])),
                      $signed((reg43[(1'h1):(1'h0)] ?
                          $signed((8'hb9)) : {reg52,
                              reg33}))} : $signed($unsigned(((+reg37) >> reg50[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg50 <= reg29;
              reg51 <= {$signed(($unsigned((!reg35)) ?
                      reg49[(5'h10):(1'h0)] : $unsigned((!wire26)))),
                  ({{{reg31}, $signed(wire12)}} ?
                      reg30[(1'h1):(1'h1)] : (reg29 | reg46))};
              reg52 <= reg22;
              reg53 <= ($signed(($unsigned(reg34[(5'h13):(4'hc)]) + (((8'hbc) * reg50) ?
                  reg49[(1'h0):(1'h0)] : (wire27 ?
                      reg47 : wire8)))) << (($signed($unsigned((8'h9c))) && ((reg22 <<< (8'hb7)) ?
                      $signed(wire7) : reg14[(2'h2):(1'h1)])) ?
                  (+({reg50} ? (^reg38) : $unsigned(reg42))) : reg38));
            end
          reg54 <= (7'h44);
          reg55 <= $unsigned({reg16[(4'hf):(3'h7)]});
          reg56 <= $unsigned(reg23[(4'h8):(3'h7)]);
        end
      else
        begin
          reg49 <= reg35[(3'h5):(3'h4)];
          if (wire25[(2'h3):(2'h3)])
            begin
              reg50 <= (&(reg13 ?
                  (&reg44) : $unsigned(((reg31 ? reg18 : reg34) ?
                      (reg19 ? reg48 : reg46) : $signed((8'ha6))))));
              reg51 <= ($unsigned((8'h9e)) + ($signed($unsigned(reg55)) ?
                  reg16[(3'h4):(1'h0)] : reg40));
              reg52 <= reg48;
              reg53 <= (8'hbe);
              reg54 <= ($unsigned($signed({wire11[(3'h7):(2'h2)],
                  {(8'hb8), reg46}})) & {reg48[(4'hc):(4'h9)]});
            end
          else
            begin
              reg50 <= reg54[(3'h4):(1'h1)];
              reg51 <= (reg21[(4'h8):(4'h8)] || ({{(~reg36),
                          (reg43 ? reg50 : reg18)}} ?
                  reg22 : ({(~&(8'hbe))} && $unsigned((!(8'hb9))))));
              reg52 <= $unsigned($unsigned({reg38, reg19[(2'h3):(2'h2)]}));
              reg53 <= {$signed($unsigned({(reg34 ? reg13 : reg56),
                      ((8'hbf) ? reg23 : reg17)})),
                  (&(&reg29))};
            end
          reg55 <= $unsigned($signed(reg16[(4'hf):(3'h7)]));
          reg56 <= {$signed((((reg24 ? (8'h9c) : reg13) ?
                  (!(8'ha0)) : reg40[(3'h5):(1'h1)]) < wire27))};
        end
      reg57 <= $signed($unsigned((reg30[(4'h9):(3'h4)] ?
          (~^(^~reg32)) : {(~^reg47)})));
      if ($signed((reg53 <<< $unsigned(($signed(reg42) ?
          (reg38 ? reg49 : reg14) : (~|wire11))))))
        begin
          reg58 <= reg42;
          reg59 <= (reg33 ?
              (reg17 + (~^$signed({reg41}))) : (|((|reg51) && wire25[(2'h3):(1'h0)])));
          reg60 <= reg53;
          reg61 <= wire9;
          reg62 <= $unsigned((reg23[(2'h3):(2'h2)] ?
              ((reg14 >> (8'ha6)) & (~^$unsigned(reg30))) : ((^~(!(8'hab))) * reg55)));
        end
      else
        begin
          reg58 <= {(8'haa)};
          if ($signed(reg61))
            begin
              reg59 <= (~{$signed($signed(reg48[(3'h6):(2'h3)]))});
            end
          else
            begin
              reg59 <= ((8'hb3) <= (($signed($unsigned(reg35)) ?
                      ((reg53 ?
                          reg34 : reg51) && $signed(reg40)) : $unsigned((^reg34))) ?
                  $unsigned(wire26) : reg21[(4'hc):(4'h9)]));
              reg60 <= ((wire9 ?
                  reg52 : $unsigned(({wire28, wire9} ?
                      $signed(wire9) : (wire28 <= reg53)))) ^~ (-reg34));
            end
        end
    end
  assign wire63 = reg56[(2'h2):(1'h1)];
  assign wire64 = (reg17 ?
                      $signed(($signed($signed(reg55)) <<< (7'h41))) : (($signed((wire12 | reg14)) > ($signed(reg54) ?
                          (reg46 <<< reg57) : $unsigned(reg32))) < $unsigned({reg14})));
  assign wire65 = reg38;
  assign wire66 = (wire27 >>> $signed({wire12, (~&(reg46 ? reg33 : reg32))}));
  module67 #() modinst83 (.wire69(reg40), .clk(clk), .y(wire82), .wire70(wire27), .wire68(reg36), .wire71(reg23), .wire72(reg24));
  assign wire84 = (~|{reg20});
  assign wire85 = reg43;
  module86 #() modinst106 (wire105, clk, wire12, wire7, reg17, reg43);
  assign wire107 = (8'hb8);
  assign wire108 = (reg32 <= reg23);
  assign wire109 = reg20[(1'h0):(1'h0)];
  module110 #() modinst150 (wire149, clk, reg42, reg36, reg15, wire65, reg41);
endmodule

module module110  (y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire115;
  input wire [(2'h3):(1'h0)] wire114;
  input wire signed [(3'h7):(1'h0)] wire113;
  input wire signed [(4'h9):(1'h0)] wire112;
  input wire [(5'h13):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire148;
  wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire signed [(2'h2):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire signed [(3'h5):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire123,
                 wire122,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 reg144,
                 reg143,
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
                 reg121,
                 (1'h0)};
  assign wire116 = ((~|($signed((wire114 ? wire113 : (8'h9e))) ?
                       $signed((wire112 ~^ wire115)) : $signed(wire115[(1'h0):(1'h0)]))) * (8'hbf));
  assign wire117 = (-$unsigned(((~&$unsigned(wire113)) ^ $signed($signed(wire111)))));
  assign wire118 = $unsigned((|$signed(wire117)));
  assign wire119 = wire118[(3'h4):(2'h3)];
  assign wire120 = wire116[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg121 <= (~|(~^($signed(wire116) ?
          (~&(wire111 != wire117)) : ($signed((7'h44)) || (wire120 ?
              (8'hb3) : (8'hbc))))));
    end
  assign wire122 = $signed(wire115[(3'h6):(1'h1)]);
  assign wire123 = (&reg121);
  always
    @(posedge clk) begin
      reg124 <= wire114;
      if (wire118)
        begin
          reg125 <= wire123;
          reg126 <= (~^wire114);
          reg127 <= reg126;
          reg128 <= $unsigned((~$signed(wire113)));
          if ((wire122 | (wire119 < wire120)))
            begin
              reg129 <= {$signed(($signed((^reg128)) || $signed((wire112 ?
                      reg126 : reg126)))),
                  $unsigned(reg127[(1'h1):(1'h1)])};
              reg130 <= {wire113,
                  {(wire117[(3'h4):(1'h0)] <= $signed((wire117 - wire118))),
                      (reg121[(4'h8):(2'h2)] >> (-{reg126, reg128}))}};
              reg131 <= ((|{(&(~wire113))}) ?
                  $signed(($unsigned(reg126) | (reg125[(4'hf):(4'ha)] ?
                      (wire116 ?
                          reg129 : wire116) : reg127[(4'hc):(4'hc)]))) : (~(~&(!wire116))));
              reg132 <= $unsigned((~&reg124));
              reg133 <= {$unsigned(reg127)};
            end
          else
            begin
              reg129 <= ($signed(wire118) ?
                  $unsigned((|(~&reg127))) : {(&wire114[(1'h1):(1'h0)])});
            end
        end
      else
        begin
          reg125 <= $signed((($unsigned({reg131, reg127}) ?
                  (wire111[(5'h12):(4'he)] ?
                      (reg131 >> wire112) : $unsigned(reg124)) : $signed($signed(wire122))) ?
              ({(~|(8'ha7))} ?
                  (((8'hb9) != wire118) & (reg131 ?
                      wire122 : wire116)) : reg124) : $unsigned($signed(wire113))));
          reg126 <= reg121;
          reg127 <= $unsigned($signed((!(^~wire113))));
        end
    end
  assign wire134 = $unsigned(reg125);
  assign wire135 = (reg124[(2'h2):(1'h1)] <<< $signed((|($signed(wire115) * $unsigned(reg132)))));
  assign wire136 = $signed(((^(^(reg132 << reg125))) ?
                       (reg132 ?
                           ($unsigned(wire119) - $unsigned(wire114)) : $unsigned($unsigned(wire134))) : (reg132[(2'h3):(1'h0)] ?
                           $signed($unsigned((8'h9c))) : (^$signed(wire118)))));
  assign wire137 = {$unsigned((wire116[(1'h0):(1'h0)] ?
                           wire115 : {$unsigned(wire119),
                               $unsigned(wire116)}))};
  assign wire138 = (^~((~|(((8'hbb) <= reg130) ?
                           (reg128 ?
                               wire114 : (8'hbf)) : wire120[(2'h2):(1'h1)])) ?
                       wire123[(1'h0):(1'h0)] : $unsigned($signed(wire118))));
  assign wire139 = $unsigned((-(wire123 == (8'ha0))));
  assign wire140 = $unsigned((~^(-$unsigned((7'h41)))));
  assign wire141 = wire123;
  assign wire142 = reg127[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      reg143 <= $signed($signed((^$unsigned({wire119}))));
      reg144 <= wire113;
    end
  assign wire145 = {(reg132 ?
                           (^$signed(reg143[(2'h2):(2'h2)])) : $signed($signed((reg130 ?
                               wire123 : wire113))))};
  assign wire146 = ((8'had) & $unsigned(($unsigned((|wire115)) ?
                       {(~^wire135),
                           $signed(wire120)} : $signed($unsigned(wire139)))));
  assign wire147 = wire115;
  assign wire148 = ($signed(wire118[(3'h5):(3'h5)]) || reg133);
endmodule

module module86
#(parameter param103 = (^(^{(~|((8'hb0) >>> (8'hbd)))})), 
parameter param104 = param103)
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire90;
  input wire signed [(5'h13):(1'h0)] wire89;
  input wire signed [(5'h13):(1'h0)] wire88;
  input wire signed [(3'h4):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire91;
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire91 = wire87[(3'h4):(2'h2)];
  assign wire92 = wire89[(4'hb):(2'h2)];
  assign wire93 = $unsigned($signed(wire87[(3'h4):(3'h4)]));
  assign wire94 = wire92;
  assign wire95 = ((+($signed($unsigned(wire94)) ?
                      wire94 : ($signed(wire91) ?
                          (wire93 ~^ wire90) : wire92[(5'h10):(2'h3)]))) | wire92[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg96 <= wire90[(4'h8):(1'h0)];
      reg97 <= $unsigned(reg96[(3'h6):(3'h5)]);
      reg98 <= wire90[(3'h4):(2'h2)];
      reg99 <= (&(($unsigned((reg98 ? wire88 : wire91)) ?
          ($signed(reg96) << reg97[(2'h2):(1'h0)]) : $signed((wire91 ~^ wire94))) >>> {reg96[(3'h7):(1'h0)],
          {$signed(wire95), $signed(wire87)}}));
    end
  assign wire100 = $signed(wire89[(5'h10):(4'hb)]);
  assign wire101 = (($unsigned({(~^reg99)}) ?
                       (!((~|wire89) ?
                           $signed(reg99) : (wire100 <<< wire92))) : (!wire88[(5'h13):(5'h10)])) < $unsigned(((reg96 > (+(8'hab))) ?
                       $signed((wire91 ? reg98 : reg99)) : ({wire92,
                           (8'hb7)} <<< (wire92 != wire100)))));
  assign wire102 = $signed(((+(&reg96[(4'h9):(4'h9)])) < $signed($signed((-wire87)))));
endmodule

module module67
#(parameter param80 = ({{(((8'ha0) * (8'haf)) > {(8'hbb)})}, {{((8'had) & (8'had)), (^(7'h44))}, ({(8'haa), (8'hac)} ? {(7'h40)} : ((7'h43) << (8'hac)))}} ? ((((&(8'hac)) ? ((8'ha5) + (8'h9c)) : ((8'hba) ? (8'ha0) : (8'hab))) ? {((8'hb8) | (8'hb8))} : ({(8'ha8), (8'h9f)} >= ((7'h41) ? (8'h9e) : (8'hb7)))) ~^ ((^((8'ha7) << (7'h43))) ^~ ({(7'h40), (8'hb6)} < ((8'hb4) ? (8'ha8) : (8'hb8))))) : (-(+{((8'h9c) ~^ (8'ha7))}))), 
parameter param81 = {(|(~|(^~((8'ha7) >= (8'hb2))))), param80})
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire signed [(3'h6):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  assign y = {wire79, wire78, wire77, wire76, wire75, wire74, wire73, (1'h0)};
  assign wire73 = $signed((wire69[(4'hb):(4'ha)] ^ {wire71,
                      ((wire70 < wire68) >> wire71)}));
  assign wire74 = ((~^$signed(($unsigned(wire68) ?
                          $signed(wire73) : $unsigned(wire73)))) ?
                      $signed(((wire71[(5'h10):(4'ha)] ?
                              {wire69, wire68} : (|wire68)) ?
                          ((wire72 ^~ (8'ha0)) ^~ (~|wire70)) : $unsigned(wire68))) : (+(-(wire68[(1'h1):(1'h1)] ?
                          (~^wire73) : (wire71 ? wire71 : wire68)))));
  assign wire75 = ((!wire74) ?
                      wire73 : (wire73[(1'h1):(1'h0)] <<< (&((wire70 <= (8'hb1)) < (wire69 ?
                          wire68 : wire73)))));
  assign wire76 = wire73;
  assign wire77 = (~|($signed(wire69[(3'h5):(3'h4)]) ?
                      (~&$unsigned((|wire76))) : wire70[(3'h5):(2'h3)]));
  assign wire78 = ($signed((~|((^~(8'hb2)) == wire73[(3'h4):(3'h4)]))) ?
                      $signed({wire68[(3'h4):(2'h3)]}) : wire75);
  assign wire79 = $signed(wire76);
endmodule
