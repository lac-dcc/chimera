module top
#(parameter param267 = {(({((8'hac) ? (8'had) : (8'hbf))} ? ((~(8'hb2)) && (~&(8'hb3))) : (~((8'h9d) << (8'ha6)))) == (8'h9d))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire154;
  wire [(4'hb):(1'h0)] wire170;
  wire [(4'h9):(1'h0)] wire173;
  wire [(4'h8):(1'h0)] wire174;
  wire signed [(5'h15):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire176;
  wire [(5'h12):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire189;
  wire signed [(3'h7):(1'h0)] wire190;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(4'h9):(1'h0)] wire192;
  wire signed [(3'h5):(1'h0)] wire258;
  reg signed [(4'hc):(1'h0)] reg266 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg265 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg264 = (1'h0);
  reg [(4'ha):(1'h0)] reg263 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg262 = (1'h0);
  reg [(5'h12):(1'h0)] reg261 = (1'h0);
  reg [(2'h3):(1'h0)] reg260 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg187 = (1'h0);
  reg [(4'hd):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg164 = (1'h0);
  reg [(5'h12):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  assign y = {wire152,
                 wire4,
                 wire154,
                 wire170,
                 wire173,
                 wire174,
                 wire175,
                 wire176,
                 wire188,
                 wire189,
                 wire190,
                 wire191,
                 wire192,
                 wire258,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg172,
                 reg171,
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
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire4 = ($unsigned(($signed((wire0 ? (7'h42) : wire3)) ?
                     $signed({wire3}) : $signed((|wire3)))) | ((!wire1) > wire0[(1'h1):(1'h1)]));
  module5 #() modinst153 (wire152, clk, wire0, wire2, wire4, wire1, wire3);
  assign wire154 = wire1[(4'he):(3'h6)];
  always
    @(posedge clk) begin
      if (wire3[(4'h8):(3'h5)])
        begin
          if ($signed(wire0))
            begin
              reg155 <= $signed({$unsigned((wire1 ? {wire1, (8'ha1)} : wire4)),
                  (wire1[(5'h12):(5'h10)] ? wire1 : (wire4 != wire4))});
            end
          else
            begin
              reg155 <= ($unsigned($unsigned((-(wire4 >= wire1)))) & {$unsigned(((~wire0) >= {wire4})),
                  ((!{(8'ha3)}) ? $unsigned((^wire4)) : (~$unsigned(wire4)))});
              reg156 <= ($unsigned(($unsigned(wire2) ?
                  (~|$unsigned((8'hbc))) : $unsigned((~wire4)))) ^~ ($signed(wire0[(2'h2):(1'h0)]) ^~ wire4[(4'hc):(4'h9)]));
              reg157 <= (~|(-(&wire2[(3'h5):(1'h0)])));
            end
          reg158 <= (($signed(((wire152 ?
                      reg155 : wire154) * $signed(wire154))) ?
                  $signed(wire3[(2'h2):(1'h1)]) : ({wire3[(3'h7):(3'h6)],
                      (wire0 ? wire4 : wire154)} > (|wire154))) ?
              {$unsigned({$signed(reg155)}),
                  (($unsigned(wire4) || wire1) ?
                      (reg155 ^ (reg157 >= wire2)) : ($signed(wire154) < {reg155,
                          wire0}))} : (((reg157 ?
                      (reg157 == wire1) : wire0[(3'h5):(2'h3)]) ?
                  ($signed(reg157) == $signed(wire2)) : (^~$unsigned(wire4))) >= ($signed((-reg156)) ?
                  reg155[(2'h2):(2'h2)] : wire2)));
          reg159 <= (^~wire1[(4'hb):(1'h1)]);
        end
      else
        begin
          reg155 <= (-wire154);
        end
      if ((~wire4))
        begin
          reg160 <= (8'ha9);
          reg161 <= wire1;
        end
      else
        begin
          if ((($signed(reg155[(3'h4):(1'h1)]) ?
              ((~&$unsigned(reg157)) ?
                  wire154[(3'h4):(2'h2)] : (!(-(8'ha6)))) : wire4) & (|$signed($signed((&(8'hab)))))))
            begin
              reg160 <= ({(~^(reg159 ? {wire152} : $unsigned(wire154)))} ?
                  $unsigned(wire1) : (|wire4));
              reg161 <= ($signed((wire4[(3'h5):(3'h4)] ?
                      wire154[(1'h1):(1'h1)] : reg156[(3'h6):(3'h5)])) ?
                  ($signed(wire3) | {($unsigned(reg159) ~^ (reg157 <<< (8'hab)))}) : wire4);
            end
          else
            begin
              reg160 <= {wire4[(4'hb):(3'h4)], wire2};
            end
          reg162 <= wire3;
          reg163 <= reg160[(1'h1):(1'h1)];
        end
      if ($unsigned(wire154[(1'h0):(1'h0)]))
        begin
          reg164 <= (reg156[(4'h8):(3'h7)] ?
              (((-(reg163 ? reg155 : (8'ha5))) ?
                  ($unsigned(wire154) ?
                      $signed(reg157) : (wire2 & (8'hb8))) : {wire0,
                      reg155}) ^ (wire152 ?
                  wire154[(3'h4):(3'h4)] : $unsigned((wire1 ?
                      (8'ha4) : (8'ha9))))) : wire152);
          reg165 <= {$unsigned($signed({$unsigned(wire3), wire2}))};
          reg166 <= reg160;
          reg167 <= $unsigned(reg159);
        end
      else
        begin
          reg164 <= reg165[(1'h1):(1'h1)];
        end
      reg168 <= reg163;
      reg169 <= (reg160 && ((~reg164) << (-$signed($signed((7'h42))))));
    end
  assign wire170 = ((&(wire2[(4'h8):(4'h8)] <= reg157[(3'h5):(2'h2)])) ?
                       $unsigned($unsigned(((~&(8'ha8)) ?
                           (reg164 ? reg163 : reg156) : (reg165 ?
                               reg166 : reg162)))) : reg160);
  always
    @(posedge clk) begin
      reg171 <= $unsigned((~$unsigned($signed($signed(reg168)))));
      reg172 <= ((8'had) ? (&reg162) : $unsigned($signed({reg161})));
    end
  assign wire173 = ({$unsigned(wire170)} ?
                       (reg155[(3'h7):(3'h6)] ?
                           $unsigned(((!(8'hb8)) ?
                               {reg159,
                                   reg167} : $signed(reg158))) : reg169[(1'h0):(1'h0)]) : {wire0,
                           (reg157[(1'h1):(1'h1)] ?
                               wire154[(4'h9):(1'h0)] : $unsigned((~|reg158)))});
  assign wire174 = $signed((8'hbb));
  assign wire175 = wire170[(1'h0):(1'h0)];
  assign wire176 = (reg156[(4'h8):(3'h5)] >= (~^($signed((wire152 <= (8'h9d))) || (wire4 != reg169[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg177 <= $signed($unsigned((-{wire1[(4'h9):(3'h4)]})));
      if ($signed($unsigned(({reg161, (wire170 ? reg162 : reg169)} ?
          reg177[(1'h0):(1'h0)] : (~|(reg157 ? reg159 : reg167))))))
        begin
          reg178 <= ($unsigned((((wire170 != (8'ha8)) >> $unsigned(wire152)) ?
              ($signed(reg156) ^~ reg163[(3'h7):(2'h3)]) : $signed((reg171 ^~ (8'hb1))))) << reg156[(4'h8):(2'h2)]);
          reg179 <= $unsigned({reg169[(2'h2):(1'h0)]});
          reg180 <= (^~$signed((-$unsigned(((8'ha0) || wire176)))));
        end
      else
        begin
          if ((8'hb7))
            begin
              reg178 <= (wire4[(2'h2):(1'h0)] - ((~^reg172) | $unsigned(((-wire170) == wire175))));
              reg179 <= $signed((wire4[(4'h8):(1'h0)] ^~ (!(reg162 ?
                  reg171 : ((8'had) ~^ reg180)))));
              reg180 <= ($unsigned((reg169 ?
                  ((reg177 ^~ reg163) ^ reg161[(3'h6):(2'h2)]) : reg164)) != (reg159 << reg168));
              reg181 <= reg157[(3'h6):(3'h6)];
              reg182 <= ($signed(wire4[(4'h9):(3'h5)]) ?
                  reg177[(2'h3):(1'h1)] : (reg161[(4'h8):(1'h0)] ^ (~^(reg167 - {reg171}))));
            end
          else
            begin
              reg178 <= $signed((wire170[(4'ha):(3'h4)] < reg169));
              reg179 <= $unsigned((~$signed((reg168[(3'h5):(3'h4)] ?
                  (reg161 != (8'h9c)) : $signed((7'h43))))));
              reg180 <= wire3[(3'h6):(2'h3)];
              reg181 <= (reg159[(2'h3):(2'h3)] <= $unsigned($signed(wire0)));
              reg182 <= wire154;
            end
          reg183 <= $signed($unsigned(reg182[(4'h8):(1'h1)]));
          if (reg167)
            begin
              reg184 <= $signed((&reg156));
            end
          else
            begin
              reg184 <= wire170[(1'h1):(1'h0)];
            end
          reg185 <= $signed(($signed(wire154) ?
              $unsigned({(|reg156)}) : (&wire3[(4'hd):(4'ha)])));
          reg186 <= reg184[(2'h3):(2'h3)];
        end
      reg187 <= (^(8'ha4));
    end
  assign wire188 = $unsigned(wire175);
  assign wire189 = reg162[(1'h1):(1'h1)];
  assign wire190 = (~|{(~^{$unsigned(wire0), reg186[(3'h4):(2'h2)]})});
  assign wire191 = $unsigned((~&wire3));
  assign wire192 = (reg159 ~^ (reg159[(3'h4):(1'h1)] ?
                       wire175[(5'h14):(5'h11)] : reg186));
  module193 #() modinst259 (.y(wire258), .clk(clk), .wire198(wire2), .wire195(reg167), .wire194(wire3), .wire197(wire188), .wire196(reg163));
  always
    @(posedge clk) begin
      reg260 <= wire191[(1'h1):(1'h0)];
      reg261 <= $unsigned((($unsigned($unsigned(reg177)) | reg155[(3'h7):(1'h0)]) < wire191[(3'h5):(3'h5)]));
      reg262 <= ($unsigned({$signed($unsigned(wire188)),
              {wire188[(4'hf):(3'h6)], wire3}}) ?
          $signed($unsigned(((8'hb6) >= $unsigned(wire175)))) : {({$unsigned((8'h9d))} & ((~&wire175) ?
                  $unsigned(reg163) : (wire170 || reg168))),
              ((wire190[(1'h0):(1'h0)] == (8'hba)) ?
                  wire189[(3'h4):(2'h3)] : $unsigned({reg155, reg168}))});
      if (wire170)
        begin
          if ((((!reg179[(2'h3):(1'h1)]) ?
                  {((^wire189) > (reg156 ?
                          wire173 : reg261))} : $signed(reg157)) ?
              wire2[(4'ha):(3'h6)] : (|reg262[(1'h1):(1'h1)])))
            begin
              reg263 <= $signed(wire170[(3'h5):(1'h0)]);
            end
          else
            begin
              reg263 <= $unsigned((reg184[(1'h0):(1'h0)] && reg165[(4'hb):(4'h8)]));
              reg264 <= $unsigned(reg167[(2'h2):(1'h0)]);
              reg265 <= (~|{(8'hba),
                  (reg166 != $unsigned((wire189 ? reg157 : reg260)))});
              reg266 <= (~&$signed((wire188 ?
                  (&(wire3 ? wire2 : (8'hb3))) : (reg161 ?
                      (reg180 <= wire258) : (reg185 ? (8'h9c) : reg171)))));
            end
        end
      else
        begin
          reg263 <= $unsigned((&wire154[(3'h5):(3'h4)]));
          reg264 <= $signed($signed($unsigned($signed($signed(reg177)))));
        end
    end
endmodule

module module193
#(parameter param257 = (~|{(~&{((8'hbe) ? (8'hb0) : (8'haa))}), (({(8'hbe)} >= ((8'ha1) & (8'hb5))) ? ({(8'hb1)} ? ((8'hb5) & (8'ha3)) : ((8'ha8) << (8'ha9))) : {((8'haf) ? (8'hbd) : (7'h40))})}))
(y, clk, wire198, wire197, wire196, wire195, wire194);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire198;
  input wire [(5'h12):(1'h0)] wire197;
  input wire signed [(5'h12):(1'h0)] wire196;
  input wire [(4'hb):(1'h0)] wire195;
  input wire signed [(4'hb):(1'h0)] wire194;
  wire signed [(5'h10):(1'h0)] wire256;
  wire [(4'h9):(1'h0)] wire255;
  wire [(3'h7):(1'h0)] wire254;
  wire signed [(5'h15):(1'h0)] wire252;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(4'hf):(1'h0)] wire223;
  wire signed [(4'hb):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire202;
  reg [(4'hd):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg200 = (1'h0);
  reg [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg205 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(4'hb):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg209 = (1'h0);
  reg [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg214 = (1'h0);
  reg [(4'h8):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg218 = (1'h0);
  reg [(4'h9):(1'h0)] reg219 = (1'h0);
  reg [(5'h12):(1'h0)] reg221 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  assign y = {wire256,
                 wire255,
                 wire254,
                 wire252,
                 wire224,
                 wire223,
                 wire220,
                 wire202,
                 reg199,
                 reg200,
                 reg201,
                 reg203,
                 reg204,
                 reg205,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg221,
                 reg222,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg199 <= $unsigned(wire195);
      reg200 <= (((8'ha5) ?
          $unsigned(((7'h41) ?
              $unsigned(wire196) : wire198)) : $signed(wire195)) < $unsigned((7'h44)));
      reg201 <= ($signed(((wire196 ? $signed(wire196) : reg199[(1'h1):(1'h0)]) ?
          $signed((wire194 ? wire195 : reg199)) : (wire197 ?
              $unsigned(wire197) : (~&wire194)))) || (($unsigned($signed(reg200)) ?
          {(8'hac), (~reg200)} : {wire194[(4'ha):(2'h3)]}) + wire197));
    end
  assign wire202 = (reg201 ? (~|(+wire197)) : reg201[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg203 <= (wire202[(3'h4):(1'h1)] ?
          $signed((-$unsigned($unsigned((8'hbb))))) : $signed(((~$signed(wire195)) * (wire196[(5'h12):(4'ha)] & $unsigned((8'haa))))));
      if ((~^(!wire194)))
        begin
          reg204 <= reg199[(3'h5):(2'h2)];
          reg205 <= (reg201[(1'h1):(1'h0)] ?
              (+(8'hb3)) : (^~((&reg204) + ($unsigned(wire196) ?
                  $unsigned((8'ha1)) : (~&wire202)))));
        end
      else
        begin
          reg204 <= wire195[(4'h9):(3'h6)];
          reg205 <= wire195;
          if (wire196[(3'h6):(3'h4)])
            begin
              reg206 <= wire195;
              reg207 <= reg203;
              reg208 <= (+($signed($signed(wire195[(4'h9):(4'h8)])) ?
                  ($signed(reg203) >> ((-(8'hac)) | $unsigned(reg200))) : reg203[(4'ha):(1'h0)]));
              reg209 <= wire196[(3'h4):(2'h2)];
              reg210 <= $unsigned($signed($unsigned($signed($unsigned(reg203)))));
            end
          else
            begin
              reg206 <= $unsigned((reg201[(1'h0):(1'h0)] ?
                  $unsigned((reg206 ?
                      $signed((8'hb6)) : $unsigned(wire198))) : ({wire197} ?
                      wire198 : $signed(((8'hbc) ? wire198 : wire194)))));
              reg207 <= (($signed($unsigned(reg208[(4'hb):(3'h5)])) ?
                  (~$unsigned((7'h42))) : ($signed({wire197,
                      wire202}) <= (8'hba))) != (reg206[(2'h2):(1'h1)] << ({reg203[(4'hc):(3'h6)],
                      $unsigned(wire194)} ?
                  wire196[(4'ha):(3'h7)] : $signed($signed(reg205)))));
              reg208 <= ((reg203 ? reg209 : $signed(wire194)) ?
                  wire202 : wire198);
            end
          if (reg204[(4'hb):(4'h8)])
            begin
              reg211 <= $unsigned((!$signed(((reg206 < (8'hb5)) ?
                  (~|reg201) : reg199))));
            end
          else
            begin
              reg211 <= reg208;
              reg212 <= ((!$signed(($unsigned(reg201) ?
                      (8'ha7) : $unsigned(wire198)))) ?
                  (8'hb2) : reg205);
              reg213 <= reg200;
              reg214 <= (reg212 ?
                  $signed($unsigned(((!wire202) || $unsigned(reg203)))) : $signed($unsigned((+(reg212 & wire196)))));
            end
          if ((((!{$signed(wire195), reg200}) ^ reg207[(4'h8):(1'h1)]) ?
              wire195[(3'h6):(3'h4)] : $unsigned(reg207[(4'he):(3'h5)])))
            begin
              reg215 <= ({(!{reg212}),
                  (wire197[(5'h11):(4'hc)] ?
                      ($unsigned(wire194) ?
                          $signed(reg214) : {reg211,
                              reg206}) : reg207[(4'he):(4'ha)])} <<< (reg214[(3'h4):(2'h2)] >>> {($unsigned(wire194) ^~ reg204[(3'h7):(3'h5)])}));
            end
          else
            begin
              reg215 <= $signed(($unsigned(reg212[(4'hb):(4'hb)]) ?
                  {$unsigned((reg204 <<< reg214))} : $unsigned((reg207 ?
                      wire197 : wire194[(2'h2):(1'h1)]))));
              reg216 <= reg205;
              reg217 <= (~&reg216[(4'hc):(3'h7)]);
            end
        end
      reg218 <= reg214;
      reg219 <= $signed($unsigned(($signed($unsigned(wire198)) >> (wire197[(4'h8):(1'h0)] ?
          $signed(reg205) : $unsigned(wire195)))));
    end
  assign wire220 = reg212;
  always
    @(posedge clk) begin
      reg221 <= reg211;
      reg222 <= ($unsigned($unsigned($unsigned(reg200[(2'h3):(1'h0)]))) & (wire194 ?
          reg213[(1'h1):(1'h1)] : (8'ha5)));
    end
  assign wire223 = reg221;
  assign wire224 = ({($signed((reg201 ? reg208 : (8'ha0))) ?
                               wire198 : $unsigned((-reg208))),
                           reg199} ?
                       (+(+(^$unsigned(reg213)))) : $signed($signed((reg203 <= $signed(reg206)))));
  module225 #() modinst253 (wire252, clk, reg204, wire196, wire198, reg209, reg201);
  assign wire254 = {wire223, $signed($signed((~(wire252 ? wire195 : reg207))))};
  assign wire255 = $unsigned($signed({((wire202 ? wire220 : wire254) ?
                           $unsigned(wire195) : (reg217 ? reg222 : reg221)),
                       (reg205[(1'h1):(1'h1)] >>> wire224[(3'h4):(3'h4)])}));
  assign wire256 = (~&reg200);
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h38e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  assign y = {wire150,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire81,
                 wire79,
                 wire50,
                 wire23,
                 wire22,
                 wire13,
                 wire12,
                 wire11,
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
                 reg94,
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
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 (1'h0)};
  assign wire11 = wire10;
  assign wire12 = wire6[(4'hc):(2'h2)];
  assign wire13 = (8'ha6);
  always
    @(posedge clk) begin
      reg14 <= ((~&(^$unsigned(wire10[(4'h8):(3'h7)]))) << $signed(($signed($unsigned(wire8)) & (wire9 ?
          (wire10 ? (8'hab) : (8'had)) : (wire8 ? wire11 : wire9)))));
      reg15 <= (!(+$unsigned(wire10[(4'hb):(4'h8)])));
      reg16 <= (-$unsigned(reg14[(3'h4):(1'h1)]));
      reg17 <= (wire11 ^~ (8'hb1));
      if ((((+{$unsigned(wire8)}) || $unsigned(wire12[(5'h11):(3'h4)])) >> (!$signed(($signed(wire12) == $unsigned(reg14))))))
        begin
          reg18 <= reg17[(4'hd):(3'h5)];
          reg19 <= $unsigned($unsigned($unsigned((+$unsigned(reg14)))));
          reg20 <= wire12[(4'hd):(4'h8)];
          reg21 <= {(($unsigned(wire9) ?
                      ((&reg20) ?
                          {wire12} : ((8'hb9) * wire9)) : (wire12[(4'he):(1'h0)] ^~ (^reg16))) ?
                  ((8'ha8) ?
                      (8'h9f) : $signed(reg17[(1'h0):(1'h0)])) : reg16[(1'h1):(1'h1)])};
        end
      else
        begin
          reg18 <= ($signed(wire7[(4'h9):(4'h8)]) ?
              reg15 : (((~(|wire10)) != (8'hb4)) >> wire13));
          reg19 <= (^~($signed(wire9) ?
              $unsigned($unsigned(wire10)) : (8'hbb)));
          reg20 <= {(((~|((8'ha3) == wire7)) ?
                  ((wire6 ? reg19 : wire12) ?
                      ((8'h9c) ? wire8 : wire9) : (wire12 ?
                          (8'ha9) : reg16)) : wire8) - (((&wire8) <<< $unsigned(reg21)) ?
                  (+(-wire12)) : ((reg19 ? wire13 : reg16) || {wire9,
                      wire9})))};
        end
    end
  assign wire22 = (|(({(reg21 >= reg15), reg20[(4'hc):(2'h2)]} ?
                          ($signed(wire7) == (wire7 ?
                              wire7 : reg19)) : (~$unsigned(reg14))) ?
                      $unsigned(wire13) : $signed($unsigned((^~wire7)))));
  assign wire23 = (~|(~wire6));
  always
    @(posedge clk) begin
      if ({$signed(((-(wire8 ? wire23 : (8'h9c))) ?
              (|(7'h44)) : $unsigned({(8'hbf)})))})
        begin
          if ((|($unsigned(reg21[(2'h3):(2'h3)]) + ((+wire23) ?
              (wire8 >> (!wire7)) : $signed(wire10[(4'hc):(4'h8)])))))
            begin
              reg24 <= (~|((~|(^reg14[(3'h4):(1'h0)])) ?
                  {wire12} : {wire7[(3'h7):(2'h2)], wire10[(4'hd):(4'h8)]}));
              reg25 <= $unsigned($unsigned((~&wire12[(2'h3):(2'h3)])));
            end
          else
            begin
              reg24 <= $unsigned((wire10 ?
                  (~^($unsigned(wire11) ?
                      ((8'hbb) ~^ (8'hb4)) : (reg21 >= wire10))) : ({reg14[(3'h4):(1'h0)]} ?
                      ((wire9 ?
                          wire8 : wire23) ~^ wire8) : (~&(wire22 | reg19)))));
            end
          if ($unsigned((&wire9)))
            begin
              reg26 <= (^~wire22);
              reg27 <= reg24;
              reg28 <= ((&({reg15[(4'ha):(4'ha)],
                      wire7} || reg17[(1'h1):(1'h1)])) ?
                  $signed((^((&wire11) ?
                      $unsigned(reg21) : (reg14 ?
                          reg27 : reg20)))) : $signed(((~(^reg17)) ^~ ($unsigned(reg18) ?
                      reg16[(1'h0):(1'h0)] : (wire22 <<< wire8)))));
            end
          else
            begin
              reg26 <= (|$unsigned(((^((8'ha6) ~^ reg18)) != ((wire13 ?
                  reg18 : reg18) >> $signed(wire6)))));
              reg27 <= (reg26[(3'h4):(2'h2)] ?
                  {reg15} : $unsigned(((wire11 ?
                          (wire11 | reg21) : $unsigned(reg24)) ?
                      reg24[(4'h8):(3'h6)] : $unsigned($unsigned(reg24)))));
              reg28 <= ($unsigned((wire23 > (8'ha4))) < $unsigned(reg18[(3'h7):(2'h3)]));
              reg29 <= wire23[(1'h0):(1'h0)];
              reg30 <= ((wire7 ?
                  reg17 : $signed(wire8[(1'h0):(1'h0)])) != (~(~&(reg16[(1'h1):(1'h0)] ?
                  (reg20 > reg17) : (reg21 >>> wire10)))));
            end
          if ((^~$unsigned((^($signed(wire7) ^ $signed(reg15))))))
            begin
              reg31 <= (((8'had) & ({((8'h9c) > reg28)} >= $signed((wire8 != wire6)))) ?
                  $signed($signed({(reg30 ? wire12 : reg26),
                      (^~wire8)})) : $unsigned((~&(8'hb0))));
              reg32 <= $signed(reg17);
              reg33 <= reg30;
            end
          else
            begin
              reg31 <= $unsigned(reg16[(1'h1):(1'h0)]);
              reg32 <= wire8[(3'h4):(1'h0)];
              reg33 <= {$signed(((|$signed((8'haf))) <= reg14)),
                  $signed(({reg14[(3'h4):(1'h0)], (reg20 ^ wire10)} ?
                      reg32[(1'h1):(1'h0)] : (~|wire9[(3'h5):(2'h2)])))};
            end
          reg34 <= $unsigned({$signed((reg31 ?
                  ((7'h43) <<< wire10) : $unsigned(reg20)))});
        end
      else
        begin
          reg24 <= (~^$signed($unsigned(((reg25 ? (8'hb5) : reg27) ?
              $unsigned(wire23) : reg20[(3'h7):(1'h1)]))));
          reg25 <= ((8'hb0) ~^ (~$unsigned(({reg21, reg26} ~^ (wire11 ?
              wire10 : (8'ha1))))));
          reg26 <= $unsigned($signed({$unsigned(reg32),
              (|(reg32 >= (8'hb7)))}));
          reg27 <= wire23[(2'h2):(1'h0)];
          reg28 <= $signed($signed(wire12[(4'h9):(3'h4)]));
        end
      if ($signed((!wire9[(2'h3):(2'h2)])))
        begin
          reg35 <= {(~|wire6),
              ($signed($signed((8'ha7))) || {$signed(((7'h44) ^~ (8'had)))})};
          reg36 <= (reg28[(2'h3):(1'h0)] >= (8'hb3));
        end
      else
        begin
          if ($signed($unsigned($unsigned(wire11[(5'h14):(4'hc)]))))
            begin
              reg35 <= $signed((reg34 - $unsigned(($unsigned(reg27) ^ reg33[(1'h0):(1'h0)]))));
              reg36 <= (+$unsigned($unsigned((!$unsigned(wire7)))));
            end
          else
            begin
              reg35 <= $signed((+reg19));
              reg36 <= reg17;
            end
          if (((~|reg25) > ($unsigned($signed({reg25, (8'ha7)})) ?
              $signed(reg17) : $signed((~^$signed(wire6))))))
            begin
              reg37 <= ((~(reg30 << wire12)) ?
                  ($unsigned($unsigned(reg14)) ?
                      (~|(+(^~reg34))) : $unsigned(wire23)) : reg29);
              reg38 <= (reg16[(2'h3):(1'h0)] ^ $signed(((~^wire8) + (!reg31))));
            end
          else
            begin
              reg37 <= ((-(-wire12[(4'hc):(2'h3)])) ?
                  $unsigned(reg34) : $signed(wire7));
              reg38 <= (~|reg20[(4'hd):(2'h3)]);
            end
        end
      reg39 <= (((+{(reg36 ~^ reg27)}) ?
              ($signed(reg21) <<< ((reg29 || (8'hb0)) ?
                  $unsigned((8'hb7)) : $unsigned(reg15))) : wire6) ?
          ($unsigned(reg21) ?
              (reg30[(2'h2):(2'h2)] ?
                  reg34 : ((wire10 <<< reg32) ?
                      (~^reg38) : (reg25 == reg14))) : (8'hb4)) : (wire12[(5'h10):(3'h5)] ?
              (8'ha7) : reg28));
      if ((wire7[(3'h7):(1'h0)] ?
          ($unsigned(reg32) ~^ ({{wire7},
              reg19} & $unsigned((reg30 >= reg31)))) : (+($signed((^reg30)) <<< ((reg35 ?
                  wire10 : reg26) ?
              (reg28 - wire8) : {reg34, reg36})))))
        begin
          reg40 <= $unsigned(wire10[(3'h5):(2'h3)]);
          reg41 <= $unsigned(reg36);
          reg42 <= ($signed((^~$signed($unsigned(reg34)))) >= (8'hae));
          reg43 <= reg27;
        end
      else
        begin
          if ({reg18[(1'h0):(1'h0)]})
            begin
              reg40 <= (({reg25,
                      ($signed((8'hb5)) >>> $unsigned(reg29))} != $unsigned((~^(+wire6)))) ?
                  ((-wire23) ^~ $signed($unsigned(wire12))) : (((reg29 | (reg26 ?
                      reg34 : wire8)) | reg42) > $signed($unsigned(reg35))));
              reg41 <= reg40;
              reg42 <= ((reg35[(4'ha):(3'h7)] ^ {$unsigned((|reg20))}) ^ (+(reg30[(3'h4):(3'h4)] + (~^(wire13 ?
                  (7'h44) : (8'ha5))))));
              reg43 <= (!$unsigned(($signed((reg27 - reg14)) ?
                  wire8[(1'h1):(1'h0)] : {((7'h41) != reg34)})));
              reg44 <= $signed(reg32[(1'h0):(1'h0)]);
            end
          else
            begin
              reg40 <= reg40[(3'h5):(3'h4)];
              reg41 <= (wire11[(5'h13):(2'h2)] || (!$unsigned((~|$signed(wire23)))));
            end
          reg45 <= reg28[(1'h1):(1'h1)];
          reg46 <= reg25;
          reg47 <= ($signed(((~^$unsigned(reg36)) - wire12)) ?
              ($signed($signed((~|reg30))) ^~ $signed(reg17)) : (((~|reg45) <<< reg19[(3'h5):(2'h3)]) ^ (((!reg14) != (^(8'had))) ?
                  (wire13[(2'h2):(2'h2)] ?
                      (reg43 ? reg44 : reg30) : $unsigned(reg25)) : wire13)));
          reg48 <= $signed(reg43);
        end
      reg49 <= (8'hb2);
    end
  assign wire50 = $signed($unsigned((^~reg14[(1'h1):(1'h0)])));
  module51 #() modinst80 (.wire53(reg47), .y(wire79), .wire55(reg41), .wire54(reg17), .wire52(reg27), .clk(clk), .wire56(reg38));
  assign wire81 = (((((reg14 && (8'ha0)) ?
                                  (wire13 || (8'ha0)) : reg27[(4'hf):(2'h2)]) ?
                              reg31 : ((reg29 ~^ reg15) ?
                                  wire11 : reg45[(1'h0):(1'h0)])) ?
                          $unsigned(wire9[(4'h8):(3'h6)]) : wire7) ?
                      $signed(reg48[(3'h4):(3'h4)]) : ((reg38[(4'h9):(3'h7)] ?
                              (~|wire6[(4'hb):(4'ha)]) : wire13[(3'h4):(2'h2)]) ?
                          $unsigned((+(-reg17))) : $signed(reg46[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      if (($signed($unsigned(reg44)) | reg16[(2'h2):(2'h2)]))
        begin
          reg82 <= reg18[(4'ha):(2'h3)];
          reg83 <= (reg19 ?
              reg32 : ((~$signed($signed(reg40))) < ($signed($signed(wire10)) >> (^(reg41 ?
                  reg14 : reg30)))));
          if (wire6)
            begin
              reg84 <= $unsigned(reg32[(3'h5):(2'h2)]);
              reg85 <= $signed($unsigned({$signed((wire79 << reg44))}));
            end
          else
            begin
              reg84 <= reg39;
              reg85 <= reg18[(4'ha):(4'ha)];
              reg86 <= reg28[(3'h4):(1'h0)];
              reg87 <= $unsigned(reg14);
            end
          reg88 <= ((reg30 ?
              (~|reg19[(1'h0):(1'h0)]) : ({(reg32 ? (7'h43) : reg25),
                  reg19[(1'h0):(1'h0)]} & (~&((8'h9e) ?
                  reg29 : reg84)))) || ($unsigned((!(reg19 >> reg83))) > reg87[(1'h1):(1'h1)]));
          if (reg16)
            begin
              reg89 <= (+(^~$unsigned(reg36)));
            end
          else
            begin
              reg89 <= ({$unsigned(((reg31 ?
                      reg26 : reg48) * $signed(reg84)))} - $signed($unsigned(reg20)));
              reg90 <= wire22[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg82 <= ((8'hb2) & $signed((((&wire12) > reg18) ^~ (+$unsigned(reg14)))));
          reg83 <= ((^~reg15) ? reg34 : $signed((8'hbd)));
        end
      reg91 <= ($unsigned(wire79) + reg29[(3'h4):(2'h3)]);
      reg92 <= wire7;
    end
  assign wire93 = {(8'hb5),
                      ((reg84[(4'ha):(3'h4)] <<< (reg45[(1'h1):(1'h0)] ?
                          (reg49 << reg37) : reg31)) - reg15)};
  always
    @(posedge clk) begin
      reg94 <= ((((&(reg14 ? reg85 : wire23)) && (8'hb6)) ?
          $signed({{reg88}}) : (((~|reg43) ?
                  (wire13 ? reg49 : reg33) : (wire8 && reg26)) ?
              (8'hbe) : {reg84})) & $signed(reg31[(4'h9):(3'h6)]));
    end
  assign wire95 = ({((reg43[(2'h2):(1'h0)] + {reg31, (8'hbd)}) < {((7'h43) ?
                                  reg92 : wire11),
                              $unsigned(reg32)}),
                          (wire7[(3'h4):(1'h0)] ?
                              $signed({reg20, reg88}) : $unsigned(reg45))} ?
                      (~^$signed(wire6)) : reg27);
  assign wire96 = $unsigned((~|$signed(($unsigned(reg90) ^~ (-reg29)))));
  assign wire97 = $unsigned((reg88 ?
                      ((~|{reg33}) * (!(8'hbe))) : $unsigned(($signed(wire11) < reg26[(2'h3):(2'h2)]))));
  assign wire98 = reg41;
  always
    @(posedge clk) begin
      if (({($unsigned((reg17 ?
              reg17 : wire22)) - wire7[(4'hb):(4'ha)])} || ($unsigned(({reg38} ^~ (wire79 ?
              wire95 : (8'hb5)))) ?
          (+(~^(~^reg44))) : $unsigned($signed((wire7 >>> (8'hb9)))))))
        begin
          if ($signed({(~|$unsigned($unsigned(wire13)))}))
            begin
              reg99 <= {((reg37 < (8'hb2)) ? {reg47} : reg90)};
              reg100 <= (^~wire12[(5'h12):(4'h8)]);
              reg101 <= (&wire6);
              reg102 <= (|(^~$signed(reg85)));
              reg103 <= ($signed({reg39[(2'h3):(2'h3)]}) ^ {reg34});
            end
          else
            begin
              reg99 <= $signed($unsigned($signed($unsigned((^reg35)))));
              reg100 <= $unsigned(reg101);
            end
          reg104 <= ((~|$signed((|(reg90 ? wire11 : reg14)))) ?
              $signed((((8'hb3) ?
                  $unsigned(reg40) : (wire81 && reg46)) >= reg27)) : ((((~|reg103) || $signed(reg46)) ?
                  (wire79[(4'he):(4'h8)] ?
                      (reg40 ?
                          reg29 : reg40) : (+(8'ha5))) : ($unsigned(reg31) ?
                      $signed(wire50) : (reg102 ?
                          reg30 : wire22))) == ($signed(wire8[(1'h1):(1'h0)]) ?
                  (reg43[(3'h4):(2'h3)] ? (!wire81) : reg49) : reg91)));
          reg105 <= wire8[(3'h4):(1'h0)];
          reg106 <= (~|wire12[(4'h8):(1'h1)]);
          if ($signed({reg24}))
            begin
              reg107 <= ((~&$unsigned(reg37)) <= $signed($signed($signed($signed(wire22)))));
              reg108 <= reg86[(4'h8):(2'h3)];
              reg109 <= (~&reg45[(1'h1):(1'h0)]);
              reg110 <= (8'hb1);
            end
          else
            begin
              reg107 <= (~&wire97[(3'h6):(3'h6)]);
              reg108 <= {(^~(8'hb7)),
                  (((reg21 <<< (&wire8)) && $signed((reg27 ?
                      reg28 : wire95))) ~^ reg49)};
              reg109 <= reg101[(3'h5):(3'h5)];
              reg110 <= reg31;
              reg111 <= (reg105[(5'h10):(4'hd)] ?
                  $signed(reg14[(3'h4):(1'h1)]) : {reg20,
                      ({$unsigned(reg48)} ?
                          ((wire81 ~^ reg21) ?
                              (wire98 <= reg103) : ((8'ha5) ?
                                  wire12 : (7'h40))) : ($signed(reg45) ?
                              $signed(wire93) : (|wire50)))});
            end
        end
      else
        begin
          if ($unsigned(({$unsigned(wire13[(3'h7):(1'h0)])} ^~ ((~^$signed(wire95)) ?
              ((reg41 && reg44) ?
                  ((8'ha9) ?
                      wire11 : reg43) : $signed((8'hbf))) : ({reg42} ^ reg91)))))
            begin
              reg99 <= ({(8'ha4)} ~^ ((reg35 ?
                  wire96[(2'h2):(2'h2)] : $unsigned((^reg42))) ~^ (8'hae)));
              reg100 <= ((~|(~^reg86[(2'h2):(1'h0)])) ?
                  $unsigned($signed($signed($unsigned(reg29)))) : (8'hb0));
              reg101 <= $signed((+reg34));
              reg102 <= reg32;
              reg103 <= reg99;
            end
          else
            begin
              reg99 <= wire6[(4'hc):(2'h3)];
              reg100 <= (~&$signed($unsigned(reg47)));
              reg101 <= $signed({$signed($unsigned(wire98)), $unsigned(reg28)});
              reg102 <= $unsigned($unsigned(reg89[(3'h6):(2'h3)]));
            end
          reg104 <= {(^$signed(($unsigned(wire8) && reg108))), {(~&reg86)}};
          reg105 <= (reg18 ? reg46 : {(+(~$unsigned(reg108)))});
        end
      reg112 <= $unsigned((reg99[(1'h0):(1'h0)] ?
          (reg92 <<< $unsigned((wire22 ~^ (8'hab)))) : (reg40 || (8'hb0))));
      reg113 <= {(~^$signed((wire22 << (reg108 << (8'hbe)))))};
      reg114 <= reg106;
    end
  module115 #() modinst151 (.wire116(reg104), .wire118(reg92), .wire117(wire81), .y(wire150), .wire119(wire9), .clk(clk));
endmodule

module module115
#(parameter param148 = {((((^(8'haf)) ? ((8'hbe) <= (8'hbb)) : (~(8'hb4))) >> (~^{(8'hb5), (8'hbb)})) | ((~((8'ha2) <<< (8'ha2))) ? ({(8'ha3)} ? (^~(8'hbe)) : {(8'ha9), (8'hbe)}) : {{(8'ha7)}, (!(8'ha3))})), (~|((((8'h9f) ? (8'hbb) : (8'hb2)) ? ((7'h43) <<< (8'hbd)) : {(8'ha6)}) >>> (&((8'h9f) ? (7'h44) : (8'h9c)))))}, 
parameter param149 = {(^~(8'hb6)), (param148 + param148)})
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire119;
  input wire [(2'h3):(1'h0)] wire118;
  input wire [(4'he):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  wire signed [(5'h11):(1'h0)] wire147;
  wire [(5'h10):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire signed [(4'hb):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire128,
                 wire127,
                 wire121,
                 wire120,
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
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire120 = {(-($unsigned($unsigned(wire119)) != wire117[(3'h7):(1'h1)])),
                       {$signed($unsigned(wire116[(4'hd):(2'h3)])),
                           (($signed(wire117) <<< $signed(wire118)) > (^wire117))}};
  assign wire121 = $unsigned({$signed($signed(wire119[(3'h5):(3'h4)])),
                       wire119[(2'h2):(1'h1)]});
  always
    @(posedge clk) begin
      reg122 <= $signed(((wire121[(1'h0):(1'h0)] >>> ((|wire120) ?
              (wire118 << wire119) : $signed(wire119))) ?
          wire120 : (|{wire118})));
      reg123 <= (($unsigned($unsigned(wire116[(3'h4):(1'h1)])) | $unsigned(wire116[(2'h2):(2'h2)])) ?
          $unsigned((^(wire120[(2'h2):(1'h1)] << ((8'ha3) ?
              reg122 : wire116)))) : wire120[(4'hc):(4'h9)]);
      reg124 <= wire119;
      reg125 <= {((((~&(8'hb8)) ?
              $signed(reg123) : wire120[(1'h0):(1'h0)]) - reg124) << $signed($unsigned($unsigned(wire118))))};
      reg126 <= reg124;
    end
  assign wire127 = (wire121 ?
                       ({(wire116[(4'h9):(2'h3)] ?
                               ((8'h9d) >> (7'h42)) : $unsigned((7'h44))),
                           wire116} < (reg125 > $signed(wire117))) : {(wire120 ?
                               wire120[(1'h1):(1'h1)] : ((reg126 | reg122) ?
                                   reg124[(1'h0):(1'h0)] : (reg123 ?
                                       wire119 : (8'hae)))),
                           (^~({reg122} ? (&wire119) : reg124))});
  assign wire128 = {($signed(wire118[(2'h2):(1'h0)]) >>> (((reg126 * (8'ha1)) ?
                           $unsigned(reg125) : $unsigned(wire119)) ^ {(wire127 ?
                               wire119 : wire118),
                           $unsigned(reg125)})),
                       wire120};
  always
    @(posedge clk) begin
      reg129 <= (reg124 ?
          ($unsigned((wire116[(1'h1):(1'h0)] && $signed(wire117))) ?
              (7'h41) : ((|(wire119 < wire117)) ?
                  wire128[(1'h1):(1'h1)] : ((^(8'ha3)) - wire116))) : {wire128[(1'h0):(1'h0)],
              (~^(!$unsigned(reg124)))});
      if (((($unsigned($signed(wire128)) ?
              $unsigned((wire128 >>> reg122)) : (reg125[(2'h2):(1'h0)] && (8'hbd))) ?
          $signed($unsigned($signed(reg126))) : ((^reg125) != (~|reg125))) & wire127[(2'h2):(1'h1)]))
        begin
          reg130 <= (wire121 > wire121[(2'h3):(1'h0)]);
          if (($signed(wire119[(3'h5):(3'h4)]) ?
              (((^(8'hbd)) ?
                      reg129 : (reg129[(3'h4):(3'h4)] ? (+wire119) : (8'hae))) ?
                  reg124[(2'h2):(1'h0)] : (($signed(reg126) ?
                      $unsigned(reg124) : reg125) * reg123[(4'h8):(3'h4)])) : reg124))
            begin
              reg131 <= $unsigned(reg125[(1'h1):(1'h1)]);
              reg132 <= {$signed(((~^((8'haf) ?
                      reg129 : wire117)) <= $signed({(8'ha4), reg123}))),
                  {wire128[(2'h3):(1'h1)], $unsigned(reg131)}};
              reg133 <= $unsigned(({reg126[(4'h8):(3'h5)],
                  (8'hb8)} < (^wire121)));
            end
          else
            begin
              reg131 <= $signed((reg129 ?
                  $signed($unsigned(reg125[(3'h7):(1'h0)])) : $signed((8'ha5))));
              reg132 <= ({((~^$signed(wire118)) == $signed(wire120[(4'h8):(3'h4)]))} ?
                  reg125[(1'h1):(1'h0)] : (+(wire120 ?
                      wire127 : reg124[(3'h4):(1'h1)])));
              reg133 <= $unsigned({{reg126,
                      (((8'hab) ? reg123 : reg124) < (wire118 | wire119))}});
            end
          if (reg123)
            begin
              reg134 <= wire117;
              reg135 <= $unsigned((({{(8'ha1)}, ((8'hbe) == reg134)} ?
                      $signed(reg132) : {$signed(reg130),
                          ((8'ha4) ? reg131 : (8'hb3))}) ?
                  $signed($signed(((8'hb7) ?
                      reg130 : reg130))) : $unsigned((wire121[(2'h3):(1'h0)] ?
                      reg124 : wire127[(1'h0):(1'h0)]))));
              reg136 <= ($signed((&(+$signed(reg125)))) ?
                  ($signed((reg123 ? wire117 : wire116)) ?
                      {((wire127 < (8'hbb)) <<< reg122),
                          reg130} : reg133[(4'hd):(3'h4)]) : reg126);
              reg137 <= (wire119[(1'h0):(1'h0)] ?
                  $unsigned((wire117[(4'h9):(2'h2)] ?
                      $unsigned((~&wire121)) : wire120[(4'hb):(4'ha)])) : (7'h40));
              reg138 <= $signed(((reg123 ?
                  ((reg134 ?
                      wire119 : (8'ha8)) ^ wire121[(2'h2):(2'h2)]) : $unsigned((8'hbf))) >>> (reg137[(4'hb):(4'hb)] ^~ (reg135[(2'h2):(1'h0)] ?
                  $unsigned(reg126) : (^reg131)))));
            end
          else
            begin
              reg134 <= wire120;
              reg135 <= (~&(($unsigned((wire121 ? reg136 : wire119)) ?
                      reg132 : reg132[(3'h4):(2'h2)]) ?
                  (7'h42) : reg137));
            end
        end
      else
        begin
          reg130 <= ($unsigned(wire117) > (^~reg135[(4'he):(3'h7)]));
          if ($unsigned(wire119[(3'h5):(3'h5)]))
            begin
              reg131 <= ($signed(reg135) >= wire120[(4'h8):(3'h5)]);
            end
          else
            begin
              reg131 <= reg124[(1'h1):(1'h0)];
              reg132 <= (~&{wire118[(2'h3):(2'h3)],
                  (reg126[(2'h2):(1'h0)] ^~ {((8'h9d) ? reg132 : reg137)})});
            end
        end
    end
  assign wire139 = $unsigned(reg138[(3'h7):(3'h5)]);
  assign wire140 = ((reg137 ?
                           ((wire121[(1'h0):(1'h0)] ~^ {reg126}) ?
                               $signed($signed(reg125)) : (&(+(8'ha2)))) : $unsigned($signed($signed(wire128)))) ?
                       ({($signed(reg130) ?
                               (wire128 ?
                                   wire119 : reg135) : wire118[(2'h2):(1'h1)]),
                           (~^{reg129,
                               wire120})} ~^ reg130) : $unsigned({$unsigned($signed(reg126))}));
  assign wire141 = {wire128[(2'h2):(1'h0)]};
  assign wire142 = $signed(reg132[(3'h5):(1'h1)]);
  assign wire143 = $unsigned(((&((7'h41) != (wire139 * (8'hb5)))) <= {$unsigned($unsigned(reg133)),
                       reg133}));
  assign wire144 = wire140;
  assign wire145 = (wire117[(2'h2):(1'h0)] + $signed((-$signed((~^(8'ha5))))));
  assign wire146 = ($unsigned((reg136 ?
                           wire118[(2'h2):(2'h2)] : ((8'haf) ?
                               reg126[(4'ha):(1'h1)] : (&reg137)))) ?
                       (reg124 ? wire121 : wire121) : (8'ha4));
  assign wire147 = $unsigned((~^((^~$signed(reg124)) <<< (~^{wire141,
                       wire121}))));
endmodule

module module51
#(parameter param77 = (8'hae), 
parameter param78 = ({(((&(8'hae)) >>> {param77}) != ((param77 ? param77 : param77) <<< (param77 < param77)))} >= (+param77)))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire56;
  input wire signed [(4'h9):(1'h0)] wire55;
  input wire [(2'h2):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire57;
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire72,
                 wire57,
                 reg75,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
  assign wire57 = $signed(((~|wire52) ? wire55 : wire53[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if ({(-(-(8'ha4)))})
        begin
          reg58 <= (wire55[(3'h7):(3'h6)] >>> {wire52});
          reg59 <= {wire57[(4'h9):(1'h0)],
              $unsigned($signed(((reg58 <<< wire55) >= ((7'h41) ?
                  wire52 : wire53))))};
        end
      else
        begin
          if (wire53[(2'h3):(2'h3)])
            begin
              reg58 <= (~^wire53[(3'h4):(2'h2)]);
              reg59 <= $unsigned($unsigned((wire55 ?
                  wire52[(4'h9):(1'h0)] : wire54[(2'h2):(1'h1)])));
              reg60 <= (~$unsigned((~(|wire53[(3'h6):(2'h3)]))));
              reg61 <= (^wire55);
            end
          else
            begin
              reg58 <= (-(8'hb4));
              reg59 <= ($signed(reg59[(4'hb):(4'h9)]) ?
                  wire56[(4'ha):(3'h5)] : wire56);
              reg60 <= ($signed(((^wire54[(1'h0):(1'h0)]) ?
                  (8'hbe) : (^$unsigned(reg61)))) >> wire56[(4'hc):(4'hc)]);
              reg61 <= $signed({((((7'h41) != wire55) & $unsigned(wire54)) ?
                      {(|wire52), wire53} : {reg60, (8'hb7)}),
                  {$signed(wire55)}});
            end
        end
      reg62 <= $unsigned($signed(((&$unsigned(reg61)) ?
          (^(wire53 ? wire55 : wire57)) : {(wire57 - wire56)})));
    end
  always
    @(posedge clk) begin
      reg63 <= $signed(($unsigned(wire55[(3'h6):(2'h2)]) ^ (8'hbc)));
      reg64 <= (|wire56[(1'h0):(1'h0)]);
      reg65 <= (+{reg59});
      if ($signed($signed({wire56})))
        begin
          reg66 <= $unsigned(($unsigned(wire55) ?
              (~|$unsigned($unsigned(reg61))) : (wire55[(2'h2):(2'h2)] * $unsigned((reg65 + reg65)))));
          reg67 <= (reg66 ?
              $unsigned($unsigned((reg62[(4'hd):(2'h2)] >= wire52))) : (|(((reg62 > reg64) * ((8'hb5) <= wire52)) ?
                  (((8'hb8) & reg58) ?
                      wire56 : (reg59 * reg59)) : ($signed(wire54) ^ $signed(reg65)))));
          reg68 <= ($signed((8'hb2)) ?
              wire55 : {($unsigned((reg58 ? wire57 : reg63)) != (~|reg64))});
          reg69 <= (|reg64[(3'h4):(1'h1)]);
          reg70 <= reg67;
        end
      else
        begin
          reg66 <= reg59[(5'h13):(4'hf)];
          reg67 <= (reg66[(1'h0):(1'h0)] ?
              $signed(reg58[(1'h1):(1'h1)]) : (reg66 ?
                  wire57 : reg59[(5'h14):(2'h2)]));
        end
      reg71 <= $unsigned(reg65);
    end
  assign wire72 = reg60;
  always
    @(posedge clk) begin
      reg73 <= wire56;
    end
  assign wire74 = (reg64 ^~ reg63[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg75 <= wire52[(4'hc):(4'hb)];
    end
  assign wire76 = wire72;
endmodule

module module225
#(parameter param251 = (!{(8'hbd)}))
(y, clk, wire230, wire229, wire228, wire227, wire226);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire230;
  input wire [(3'h7):(1'h0)] wire229;
  input wire [(4'he):(1'h0)] wire228;
  input wire signed [(5'h10):(1'h0)] wire227;
  input wire signed [(4'hc):(1'h0)] wire226;
  wire signed [(3'h6):(1'h0)] wire250;
  wire [(4'ha):(1'h0)] wire249;
  wire [(4'hd):(1'h0)] wire248;
  wire [(4'h9):(1'h0)] wire247;
  wire signed [(5'h11):(1'h0)] wire245;
  wire [(5'h10):(1'h0)] wire244;
  wire [(4'hc):(1'h0)] wire243;
  wire signed [(5'h12):(1'h0)] wire242;
  wire [(4'hd):(1'h0)] wire241;
  wire signed [(2'h2):(1'h0)] wire240;
  wire [(5'h14):(1'h0)] wire239;
  wire [(4'h8):(1'h0)] wire238;
  wire signed [(3'h6):(1'h0)] wire236;
  wire signed [(3'h7):(1'h0)] wire235;
  wire [(2'h3):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire232;
  wire [(3'h5):(1'h0)] wire231;
  reg signed [(4'ha):(1'h0)] reg246 = (1'h0);
  reg [(2'h2):(1'h0)] reg237 = (1'h0);
  reg [(2'h3):(1'h0)] reg234 = (1'h0);
  assign y = {wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire245,
                 wire244,
                 wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire239,
                 wire238,
                 wire236,
                 wire235,
                 wire233,
                 wire232,
                 wire231,
                 reg246,
                 reg237,
                 reg234,
                 (1'h0)};
  assign wire231 = wire227[(3'h7):(3'h7)];
  assign wire232 = (8'ha1);
  assign wire233 = {(|$unsigned(((wire232 ?
                           wire232 : wire229) < $unsigned(wire229)))),
                       ((^(+wire228[(4'ha):(4'h8)])) ?
                           $unsigned(wire228[(4'hc):(2'h2)]) : $signed($unsigned({wire226})))};
  always
    @(posedge clk) begin
      reg234 <= ({wire232[(4'hc):(2'h2)]} ?
          ($signed(wire231) ?
              (!(~|wire231[(1'h0):(1'h0)])) : wire226) : $signed(wire232));
    end
  assign wire235 = (~&wire232[(2'h3):(1'h1)]);
  assign wire236 = wire227[(4'ha):(4'h8)];
  always
    @(posedge clk) begin
      reg237 <= wire229;
    end
  assign wire238 = $signed(wire227);
  assign wire239 = (8'ha4);
  assign wire240 = wire238;
  assign wire241 = $unsigned((wire228[(2'h2):(1'h1)] << $signed($unsigned($signed(wire226)))));
  assign wire242 = wire238[(1'h0):(1'h0)];
  assign wire243 = (({({reg237} ? $unsigned(wire230) : {(8'ha2)}),
                           wire229[(2'h3):(2'h2)]} ?
                       (^~((8'ha9) ?
                           (wire241 && wire228) : ((8'hbc) ~^ wire233))) : $unsigned({(wire233 ?
                               (8'h9f) : (8'hb0)),
                           $signed(wire242)})) > $unsigned((8'hbd)));
  assign wire244 = $unsigned($unsigned(((wire242[(4'hf):(4'hf)] != wire230) << wire238[(1'h0):(1'h0)])));
  assign wire245 = ((~wire238) ?
                       $signed($signed($signed((wire241 ?
                           wire231 : wire230)))) : wire232);
  always
    @(posedge clk) begin
      reg246 <= (($unsigned($signed({wire236,
          wire227})) << wire244) != wire238[(3'h7):(3'h7)]);
    end
  assign wire247 = $unsigned((^~$signed($unsigned(reg234[(1'h0):(1'h0)]))));
  assign wire248 = $signed(({$unsigned((wire227 ? wire247 : wire243)),
                       $unsigned((reg237 ?
                           wire245 : wire226))} - (wire233[(1'h1):(1'h0)] ?
                       wire241[(4'h9):(3'h4)] : $signed(wire229[(2'h3):(2'h2)]))));
  assign wire249 = (~|$signed((&wire242)));
  assign wire250 = $signed($unsigned($signed(((wire247 ~^ reg234) ?
                       $signed((8'hb8)) : $signed(wire248)))));
endmodule
