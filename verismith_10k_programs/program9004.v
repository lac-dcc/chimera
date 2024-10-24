module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire295;
  wire [(4'hf):(1'h0)] wire293;
  wire signed [(3'h5):(1'h0)] wire292;
  wire [(3'h5):(1'h0)] wire291;
  wire signed [(2'h3):(1'h0)] wire289;
  wire signed [(4'hb):(1'h0)] wire268;
  wire [(3'h5):(1'h0)] wire267;
  wire signed [(3'h4):(1'h0)] wire266;
  wire [(3'h5):(1'h0)] wire265;
  wire signed [(4'he):(1'h0)] wire264;
  wire signed [(4'ha):(1'h0)] wire263;
  wire signed [(4'ha):(1'h0)] wire262;
  wire [(5'h11):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire258;
  reg [(4'he):(1'h0)] reg288 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg287 = (1'h0);
  reg [(5'h11):(1'h0)] reg286 = (1'h0);
  reg [(5'h14):(1'h0)] reg285 = (1'h0);
  reg [(5'h11):(1'h0)] reg284 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg283 = (1'h0);
  reg [(4'hf):(1'h0)] reg282 = (1'h0);
  reg [(4'hc):(1'h0)] reg281 = (1'h0);
  reg [(5'h15):(1'h0)] reg280 = (1'h0);
  reg [(3'h7):(1'h0)] reg279 = (1'h0);
  reg [(4'hf):(1'h0)] reg278 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg277 = (1'h0);
  reg [(4'he):(1'h0)] reg276 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg275 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg274 = (1'h0);
  reg [(3'h4):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg272 = (1'h0);
  reg [(3'h5):(1'h0)] reg271 = (1'h0);
  reg [(3'h4):(1'h0)] reg270 = (1'h0);
  reg [(2'h3):(1'h0)] reg269 = (1'h0);
  reg [(5'h10):(1'h0)] reg261 = (1'h0);
  reg [(2'h3):(1'h0)] reg260 = (1'h0);
  assign y = {wire295,
                 wire293,
                 wire292,
                 wire291,
                 wire289,
                 wire268,
                 wire267,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire4,
                 wire5,
                 wire63,
                 wire65,
                 wire258,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg261,
                 reg260,
                 (1'h0)};
  assign wire4 = $unsigned($signed(wire3[(4'h8):(2'h3)]));
  assign wire5 = $unsigned(wire4[(1'h1):(1'h1)]);
  module6 #() modinst64 (wire63, clk, wire2, wire0, wire3, wire1);
  assign wire65 = wire0[(3'h6):(1'h0)];
  module66 #() modinst259 (.wire69(wire1), .clk(clk), .wire71(wire5), .wire70(wire3), .wire67(wire0), .y(wire258), .wire68(wire4));
  always
    @(posedge clk) begin
      reg260 <= $signed((wire63[(3'h6):(1'h0)] ? $signed(wire4) : wire5));
      reg261 <= (wire4 & ($unsigned((8'h9f)) ?
          $signed((((8'h9e) || wire258) >> (wire1 != wire4))) : (|$unsigned((wire5 ?
              wire5 : (8'h9f))))));
    end
  assign wire262 = (((~|wire65[(2'h3):(2'h3)]) ?
                       ($unsigned((~|reg260)) + reg261[(4'hb):(4'hb)]) : (8'hb0)) || wire258[(3'h7):(2'h3)]);
  assign wire263 = (wire0[(3'h4):(2'h2)] ?
                       ($unsigned({wire262, {wire4, wire65}}) << {(~^(reg260 ?
                               wire1 : wire258)),
                           ($signed((8'h9f)) - (~wire65))}) : $signed(reg260[(2'h3):(1'h0)]));
  assign wire264 = (!wire3);
  assign wire265 = wire1;
  assign wire266 = (((^~(|wire1)) & $unsigned(((wire265 <<< wire262) <= (!wire0)))) <= wire3);
  assign wire267 = $unsigned((wire4 || ((8'hb4) ?
                       (^{wire4, wire5}) : wire0[(3'h6):(2'h2)])));
  assign wire268 = wire258[(4'hf):(4'hf)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire2[(4'h8):(2'h3)])))
        begin
          reg269 <= (|$unsigned({(!wire265[(3'h5):(3'h5)]),
              wire264[(4'ha):(3'h7)]}));
        end
      else
        begin
          if (((~|((^$signed(wire263)) & $signed(wire65))) >>> (($unsigned({wire262,
                  wire2}) ?
              ({wire4, reg269} ? reg261[(2'h2):(1'h0)] : (~wire267)) : (reg260 ?
                  wire258[(1'h0):(1'h0)] : (8'ha5))) ~^ (~&{{wire0},
              (wire1 && wire264)}))))
            begin
              reg269 <= (^$signed($unsigned((wire264 <<< (~^wire0)))));
              reg270 <= (wire5 ? wire264 : {$unsigned(reg269[(2'h3):(2'h2)])});
              reg271 <= $unsigned(wire266);
              reg272 <= {(~&(wire1[(4'ha):(3'h4)] ?
                      (reg260[(1'h1):(1'h0)] ~^ ((8'hab) ?
                          wire262 : wire1)) : (8'haf))),
                  ($unsigned(wire267) ?
                      (($unsigned(reg271) * (wire262 ?
                          wire262 : reg269)) <= $unsigned(wire5[(1'h1):(1'h1)])) : $signed({{wire65,
                              wire65},
                          (^reg269)}))};
              reg273 <= wire263[(3'h6):(1'h1)];
            end
          else
            begin
              reg269 <= ((8'hb7) ^ $unsigned((wire267 ~^ ((reg270 || (8'hb5)) < $signed(wire65)))));
              reg270 <= reg269;
              reg271 <= (wire2 * wire0[(2'h2):(1'h1)]);
              reg272 <= $signed(wire3);
              reg273 <= (8'had);
            end
        end
      if ((8'hba))
        begin
          reg274 <= $unsigned(wire5[(1'h1):(1'h0)]);
          reg275 <= {reg274};
          reg276 <= wire268[(1'h0):(1'h0)];
        end
      else
        begin
          if ((|((&$signed($signed((8'hb7)))) + wire262[(3'h7):(3'h7)])))
            begin
              reg274 <= reg269;
            end
          else
            begin
              reg274 <= ((!{wire0[(3'h6):(2'h3)],
                  wire265[(3'h4):(2'h2)]}) * wire265);
              reg275 <= (reg273 & {(reg276[(3'h7):(2'h3)] >= reg260),
                  wire5[(3'h4):(2'h2)]});
            end
          reg276 <= reg272;
          reg277 <= reg270;
        end
      if ({reg269, (+reg277)})
        begin
          reg278 <= $unsigned($unsigned(reg273));
          reg279 <= $unsigned(wire63[(1'h0):(1'h0)]);
        end
      else
        begin
          reg278 <= $signed($signed($unsigned((8'hb6))));
          reg279 <= $unsigned((7'h44));
          reg280 <= reg269;
          reg281 <= $signed(reg261[(3'h4):(3'h4)]);
        end
      reg282 <= ((reg280 < (($signed(wire258) >>> $unsigned(reg278)) ?
          wire5[(3'h5):(3'h4)] : ((wire3 <= reg260) ?
              $signed((8'h9c)) : (-reg274)))) || $signed(wire266));
      if ($signed((~|($signed((wire3 != wire263)) - wire63))))
        begin
          reg283 <= (~^{{$signed((&reg276)),
                  (reg275[(3'h5):(2'h3)] ? wire267 : {(8'hb7)})},
              reg281});
          if ((((~&$signed((wire263 >= reg279))) ~^ $signed($signed((wire3 * wire267)))) ?
              (($signed(wire63[(3'h5):(1'h1)]) ?
                  reg276[(3'h5):(3'h5)] : {reg277}) - $unsigned($unsigned(wire265[(3'h4):(1'h1)]))) : wire268[(3'h4):(1'h0)]))
            begin
              reg284 <= (({(^$unsigned((8'hb5))),
                      $signed((~reg273))} ~^ (&((~&reg261) >= $signed((8'hbc))))) ?
                  wire263 : $signed(((~^(reg283 != reg261)) * reg270)));
            end
          else
            begin
              reg284 <= $unsigned({(^(+$signed(reg275)))});
              reg285 <= (wire268 ?
                  (&$unsigned(reg271[(1'h1):(1'h0)])) : (!(!$signed(wire0[(5'h11):(4'hc)]))));
              reg286 <= $signed({wire2, wire4});
            end
          reg287 <= $unsigned($signed(({$signed((7'h43)),
                  (reg260 ? wire258 : wire263)} ?
              wire1[(4'h8):(2'h3)] : (~&((8'hb5) ? reg283 : wire1)))));
          reg288 <= reg272[(3'h4):(1'h0)];
        end
      else
        begin
          reg283 <= (wire264 >>> $unsigned($signed((|(^~(7'h43))))));
        end
    end
  module194 #() modinst290 (.wire195(wire65), .clk(clk), .wire197(reg282), .wire196(reg281), .y(wire289), .wire198(wire1));
  assign wire291 = (wire63[(3'h5):(2'h2)] - reg284);
  assign wire292 = (wire289[(1'h0):(1'h0)] == $signed($unsigned(((wire266 ~^ reg272) ?
                       wire264[(2'h2):(2'h2)] : wire258))));
  module194 #() modinst294 (wire293, clk, wire2, wire258, reg272, reg276);
  assign wire295 = $unsigned(($signed(reg276[(3'h5):(1'h1)]) ~^ wire268));
endmodule

module module66
#(parameter param256 = (8'hbf), 
parameter param257 = (8'hae))
(y, clk, wire67, wire68, wire69, wire70, wire71);
  output wire [(32'h356):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire67;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire signed [(4'hf):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire70;
  input wire signed [(4'hb):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire254;
  wire signed [(5'h12):(1'h0)] wire193;
  wire [(4'ha):(1'h0)] wire192;
  wire signed [(3'h7):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire177;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire137;
  reg signed [(4'h9):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  assign y = {wire254,
                 wire193,
                 wire192,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire141,
                 wire140,
                 wire139,
                 wire72,
                 wire73,
                 wire106,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire137,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
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
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
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
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 (1'h0)};
  assign wire72 = ({({(wire69 ? wire69 : wire70), $unsigned(wire69)} ?
                          ($unsigned(wire67) <= wire71) : $unsigned((wire70 ?
                              wire71 : wire69))),
                      wire70[(3'h7):(2'h2)]} << (^$signed($signed(wire69[(3'h4):(1'h0)]))));
  assign wire73 = {wire69};
  always
    @(posedge clk) begin
      reg74 <= $signed($signed(((+$signed(wire73)) <<< wire70)));
      if ((+(wire69 > {(+wire70[(4'he):(4'hd)]), (-$unsigned(wire70))})))
        begin
          reg75 <= ($signed(reg74) ?
              $signed(($signed((^wire73)) < {wire67[(1'h0):(1'h0)]})) : {(~^(((8'h9d) ?
                      wire72 : wire70) ^~ (~wire73))),
                  $unsigned((+(~^wire67)))});
        end
      else
        begin
          reg75 <= wire71;
          if (wire71[(3'h5):(3'h4)])
            begin
              reg76 <= ($signed(((wire68[(2'h3):(2'h2)] + {wire70}) ?
                      wire72[(1'h1):(1'h1)] : (wire69 ?
                          ((8'hbb) ? (8'hbc) : (8'haf)) : (reg74 ?
                              wire70 : (8'ha7))))) ?
                  $signed(((8'hba) ?
                      (^{wire71}) : $unsigned($unsigned(wire69)))) : (($unsigned($signed(wire72)) ?
                          {(wire71 ^ wire69)} : wire70[(1'h0):(1'h0)]) ?
                      wire70 : ($unsigned(reg74) ?
                          $signed((wire69 ?
                              wire71 : wire67)) : ($unsigned((8'ha0)) && (wire68 && wire73)))));
              reg77 <= $signed(($signed(({reg75} <= ((8'hac) * reg76))) ?
                  (reg75 ?
                      (((8'ha3) ?
                          wire68 : wire68) ^~ (^reg75)) : {wire73[(3'h4):(1'h1)]}) : wire73[(4'hb):(4'h9)]));
            end
          else
            begin
              reg76 <= ($signed((wire68 && $unsigned($signed(wire73)))) != {((~^wire71) ?
                      {reg75} : {$unsigned(wire73)})});
            end
          reg78 <= $unsigned(wire71);
          reg79 <= (((&(!(reg78 ? wire67 : wire71))) < ({((8'hba) && wire72),
              reg74[(4'hc):(2'h2)]} <= $signed((wire68 ?
              wire68 : reg77)))) ~^ $unsigned(($signed((reg78 < reg77)) < (wire71[(4'ha):(3'h4)] | (wire67 & (8'ha7))))));
        end
      if (wire73[(3'h4):(1'h1)])
        begin
          reg80 <= (reg76[(4'hc):(2'h3)] ? reg74[(4'h9):(2'h2)] : (~(^wire73)));
          reg81 <= (~&$unsigned((-reg77)));
          reg82 <= {((~^$unsigned(wire69)) ?
                  $unsigned((^~(wire69 > wire72))) : {reg79[(1'h1):(1'h0)],
                      (!$signed(reg74))})};
          reg83 <= $unsigned(($signed(reg74) ?
              reg78 : ({reg75} ? ((8'hb6) >= $unsigned(reg82)) : reg79)));
        end
      else
        begin
          reg80 <= reg80[(3'h4):(2'h3)];
          reg81 <= ((-{$signed({(8'hb4)}),
                  {wire69, (wire70 ? (8'hab) : reg74)}}) ?
              ({wire71} ?
                  (((|reg82) <= ((8'hbe) ~^ (8'hac))) || wire67) : $signed($signed($unsigned(reg79)))) : {$unsigned($unsigned({(8'hb6),
                      (8'ha6)}))});
        end
      reg84 <= $signed($signed(reg76));
    end
  module85 #() modinst107 (.wire88(wire68), .wire90(reg77), .wire87(reg80), .clk(clk), .wire86(wire73), .wire89(reg78), .y(wire106));
  assign wire108 = {reg81};
  assign wire109 = {$unsigned((~|((reg81 ? wire67 : wire108) == wire69)))};
  assign wire110 = $signed((((&(reg75 != wire72)) < (wire73 ?
                           $unsigned(wire109) : wire73[(4'h8):(4'h8)])) ?
                       reg77 : $signed(({wire69} >>> $unsigned(wire73)))));
  assign wire111 = {$unsigned(wire69), reg79};
  module112 #() modinst138 (.wire116(wire71), .wire113(reg75), .y(wire137), .wire117(wire73), .clk(clk), .wire114(wire111), .wire115(reg83));
  assign wire139 = (-reg78[(2'h3):(1'h0)]);
  assign wire140 = $signed({(7'h43)});
  assign wire141 = reg74;
  always
    @(posedge clk) begin
      if ((~^reg84[(2'h3):(1'h1)]))
        begin
          reg142 <= (wire108 - (reg82 == (!$unsigned($signed(reg75)))));
        end
      else
        begin
          reg142 <= (wire71[(2'h3):(2'h2)] == (|(~&$signed(wire73))));
          reg143 <= $unsigned($unsigned(wire110[(4'hd):(3'h6)]));
          if ((^((+{(wire110 ? reg80 : (8'hbe))}) & {wire139[(4'ha):(4'h9)],
              (+(|wire67))})))
            begin
              reg144 <= ({{wire108, $signed($signed(wire139))},
                      reg142[(2'h2):(1'h1)]} ?
                  $unsigned((wire110[(4'hb):(4'hb)] < (reg143 & (wire139 > reg78)))) : wire67);
              reg145 <= (~(8'h9f));
              reg146 <= wire110;
              reg147 <= (!(reg145 ?
                  $signed((-(wire69 ?
                      reg84 : wire139))) : ((reg146 ^~ {(8'hb9)}) ?
                      $signed((wire140 ?
                          wire72 : wire109)) : reg75[(4'hb):(3'h7)])));
            end
          else
            begin
              reg144 <= ({reg79[(1'h1):(1'h0)],
                  $unsigned((~^{(8'hbf), wire71}))} == wire111[(4'h8):(3'h6)]);
              reg145 <= $signed(wire137);
              reg146 <= reg81;
              reg147 <= {{$unsigned((wire72 <<< (reg77 ? reg77 : (8'ha3)))),
                      $unsigned(((^~wire111) ?
                          reg76[(4'hb):(3'h5)] : wire108[(4'hc):(3'h4)]))}};
              reg148 <= (($unsigned({wire70[(5'h11):(1'h0)]}) == reg78[(4'hc):(2'h2)]) ?
                  (~$unsigned($unsigned(wire73[(4'hd):(4'ha)]))) : (wire70[(1'h1):(1'h0)] ?
                      {wire111} : $unsigned((((8'haa) ^ wire73) ?
                          reg79 : {reg146, wire67}))));
            end
          if ({(($unsigned(wire67) ?
                  (^reg146) : {$signed((8'haf))}) != $signed((^~$signed(reg83))))})
            begin
              reg149 <= wire106[(1'h1):(1'h1)];
              reg150 <= reg148[(3'h5):(2'h2)];
            end
          else
            begin
              reg149 <= wire140[(3'h4):(1'h0)];
              reg150 <= ($unsigned($signed(($unsigned(wire137) ?
                  (reg147 ?
                      wire110 : wire69) : reg78[(4'h8):(3'h7)]))) >= reg80[(4'h9):(3'h4)]);
            end
          reg151 <= $unsigned(wire111);
        end
      if ({($signed(($signed((8'ha8)) ? wire139 : $unsigned(wire141))) ?
              reg81[(5'h11):(5'h11)] : reg84[(2'h3):(1'h1)])})
        begin
          reg152 <= (8'hae);
          reg153 <= (8'ha2);
          reg154 <= $signed(wire69[(3'h4):(1'h1)]);
          reg155 <= reg84[(2'h3):(2'h3)];
        end
      else
        begin
          reg152 <= (|wire106[(3'h7):(3'h7)]);
        end
      reg156 <= (~wire108);
      if (((~(~|(~|$unsigned(wire70)))) ? wire109[(4'h8):(1'h1)] : reg143))
        begin
          if ({reg144})
            begin
              reg157 <= wire140;
              reg158 <= $signed($unsigned($unsigned($signed(reg156))));
              reg159 <= reg81[(3'h4):(2'h3)];
              reg160 <= (^$signed($unsigned(reg78[(4'hc):(4'hc)])));
              reg161 <= reg152;
            end
          else
            begin
              reg157 <= {$unsigned((~$signed($signed(reg155)))), reg160};
            end
          if ($signed({$signed(reg146[(3'h6):(3'h5)])}))
            begin
              reg162 <= $signed(reg155[(3'h5):(1'h1)]);
              reg163 <= (wire109[(2'h3):(1'h0)] <= $unsigned($unsigned(wire108[(2'h2):(2'h2)])));
              reg164 <= (wire67 ?
                  $unsigned($signed($signed($signed(reg156)))) : wire141);
            end
          else
            begin
              reg162 <= wire69[(1'h0):(1'h0)];
              reg163 <= {reg74[(2'h2):(2'h2)]};
              reg164 <= (|reg143[(4'hb):(2'h3)]);
              reg165 <= $unsigned(($signed((&wire68[(3'h7):(2'h2)])) ?
                  reg81 : wire108));
              reg166 <= {wire110,
                  ($signed((-{wire70, wire109})) ?
                      ($unsigned(reg74) ?
                          (8'hba) : $signed((reg151 ?
                              wire109 : reg156))) : reg74[(5'h12):(4'h8)])};
            end
          reg167 <= $signed($signed($signed(((~&reg147) + ((8'h9f) | (8'ha6))))));
          reg168 <= reg167[(2'h3):(2'h2)];
        end
      else
        begin
          reg157 <= $signed((8'ha1));
          if ($signed((($signed((!wire106)) ?
                  $signed((^~(8'hb7))) : reg159[(1'h0):(1'h0)]) ?
              (~^{(^wire71), $signed(wire110)}) : (+reg147))))
            begin
              reg158 <= wire73;
            end
          else
            begin
              reg158 <= reg166[(3'h7):(2'h3)];
              reg159 <= $unsigned((^$signed(reg161)));
            end
          if ($unsigned($signed($signed(((reg160 || reg165) ?
              $signed(reg164) : wire110[(4'hb):(1'h1)])))))
            begin
              reg160 <= $unsigned($unsigned((reg168 ?
                  (8'hae) : $signed(wire67[(2'h2):(1'h1)]))));
              reg161 <= (&((reg74[(4'he):(4'he)] == $unsigned(wire140[(3'h4):(2'h3)])) + (-(^~(reg142 ?
                  reg75 : (7'h41))))));
            end
          else
            begin
              reg160 <= ((((reg166 >> $unsigned(wire108)) ?
                          wire73[(5'h12):(5'h10)] : $signed({wire68, reg74})) ?
                      $unsigned(wire69) : ($signed(reg158[(2'h2):(1'h0)]) ?
                          (!(reg75 ? reg81 : reg151)) : (~^(reg166 ?
                              (8'ha5) : (8'hae))))) ?
                  reg163[(3'h5):(3'h5)] : (-(wire73 * $unsigned((reg157 ?
                      wire68 : wire110)))));
              reg161 <= (($unsigned((!reg148)) * (reg77 >>> {$signed(reg142),
                  ((7'h42) ? wire111 : reg80)})) << reg79);
              reg162 <= $signed($signed($unsigned($signed($signed(wire141)))));
              reg163 <= $signed((!wire137[(3'h5):(2'h2)]));
            end
          if ($signed(($signed(reg79) >>> $unsigned((^~{reg84})))))
            begin
              reg164 <= ($signed($signed(((reg148 && reg155) ?
                  (~wire111) : (~&wire137)))) == $unsigned(({(&(8'hac))} ?
                  (8'ha0) : {$unsigned(reg77)})));
            end
          else
            begin
              reg164 <= (!{(reg161 + $signed($signed(reg157))),
                  wire141[(1'h1):(1'h0)]});
              reg165 <= wire137;
              reg166 <= {{{(reg168[(2'h2):(2'h2)] - {wire109})}, reg143},
                  reg74[(4'hf):(1'h0)]};
              reg167 <= (reg160 ? (8'hb0) : $signed(reg77[(2'h3):(2'h2)]));
              reg168 <= (wire69 ? reg156 : (|$unsigned({$unsigned(reg84)})));
            end
          reg169 <= $unsigned($signed({reg153[(2'h2):(2'h2)]}));
        end
    end
  always
    @(posedge clk) begin
      if ((wire72 >> (wire139[(4'he):(4'hc)] >>> (reg148[(4'h8):(2'h3)] ?
          wire111[(3'h5):(3'h5)] : reg145))))
        begin
          if (reg167)
            begin
              reg170 <= {reg83};
            end
          else
            begin
              reg170 <= $unsigned(((($unsigned((8'hbf)) >= $unsigned(reg144)) ?
                  (wire109 + wire70) : (wire72[(3'h6):(2'h2)] && ((8'hb4) ?
                      reg159 : reg153))) ^~ $signed(($signed(reg157) ?
                  $unsigned(wire71) : reg160[(1'h0):(1'h0)]))));
              reg171 <= (~|wire70);
              reg172 <= {$unsigned(reg149), $signed($unsigned(reg158))};
              reg173 <= (8'ha9);
            end
        end
      else
        begin
          reg170 <= (reg142 < $signed(wire106));
          reg171 <= reg78;
          reg172 <= $signed((({(-wire68),
              {reg157}} >>> ((-(8'ha8)) > (reg155 < reg146))) >> ({(~&(8'h9f))} ?
              (^~$unsigned(wire141)) : $signed(reg147))));
          if ((-$signed((reg156 ?
              wire72 : (wire71[(3'h7):(2'h2)] ?
                  wire71 : reg76[(2'h3):(1'h0)])))))
            begin
              reg173 <= ((((~|(~|reg81)) - ((-reg144) ?
                      reg149[(1'h1):(1'h0)] : (~|(8'ha1)))) <= ((!$signed(reg83)) ?
                      $signed((wire69 ?
                          reg159 : wire109)) : (reg160 && $signed(wire108)))) ?
                  (&$unsigned((!reg166[(2'h2):(2'h2)]))) : $unsigned(((^$unsigned(reg171)) || reg150[(3'h5):(2'h2)])));
              reg174 <= {$unsigned(($signed((reg76 ?
                      reg153 : (8'hb4))) >= reg77[(4'h9):(2'h3)]))};
              reg175 <= $signed((+reg147));
            end
          else
            begin
              reg173 <= reg154;
              reg174 <= reg145[(2'h2):(2'h2)];
              reg175 <= (reg76[(3'h6):(3'h4)] ? {wire71} : $unsigned(reg147));
              reg176 <= wire139;
            end
        end
    end
  assign wire177 = (&($signed((reg154[(3'h5):(2'h2)] - $signed(reg151))) | reg158));
  assign wire178 = (|reg81[(3'h6):(3'h5)]);
  assign wire179 = ((reg176[(2'h2):(1'h0)] ? (8'h9e) : reg150) ?
                       $unsigned(({(&reg163)} ?
                           (reg79 - (reg170 ?
                               (8'hae) : reg162)) : $unsigned($unsigned(reg79)))) : (~((~(reg161 ?
                               reg148 : reg169)) ?
                           reg172[(4'he):(2'h3)] : $signed(wire137))));
  assign wire180 = (~^reg78[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg181 <= reg82[(4'ha):(4'h8)];
      if ($signed({(((8'ha7) ? reg144 : wire108) ?
              {$unsigned((7'h44))} : wire106),
          wire69}))
        begin
          reg182 <= $unsigned((({(-reg74), (reg83 >= reg154)} > wire111) ?
              ((wire139 & $unsigned(reg153)) ?
                  reg147[(1'h1):(1'h0)] : $unsigned(reg160[(1'h0):(1'h0)])) : (reg159 ?
                  {wire141[(2'h2):(1'h0)],
                      $unsigned(reg176)} : {(reg153 - wire111)})));
        end
      else
        begin
          if ($unsigned((~&(-wire109))))
            begin
              reg182 <= {($unsigned(((+(8'h9c)) <= reg172)) - $unsigned({reg83}))};
              reg183 <= (wire70[(5'h11):(4'ha)] ?
                  ((^({reg147} | (8'ha0))) ?
                      $signed($signed((wire108 ?
                          reg162 : (8'ha5)))) : $signed((&(reg149 ?
                          wire106 : wire177)))) : (wire140[(1'h0):(1'h0)] == reg181[(1'h1):(1'h0)]));
              reg184 <= (-$unsigned($unsigned(reg152[(3'h6):(1'h1)])));
            end
          else
            begin
              reg182 <= (((~&$unsigned(reg80[(4'h9):(2'h2)])) ?
                      reg78[(3'h4):(1'h0)] : ($signed((reg142 && reg78)) && reg172[(4'hc):(3'h6)])) ?
                  ((8'ha0) & reg82) : $unsigned({((reg156 ~^ reg174) <= (reg158 ?
                          wire71 : reg77))}));
            end
          reg185 <= (wire179 <= ((+(reg157[(1'h1):(1'h0)] >>> (8'hb7))) ?
              (~&($signed(reg184) ?
                  $unsigned(wire180) : $unsigned((8'ha2)))) : wire111));
          if ((((reg169[(4'h9):(4'h9)] != {$unsigned(reg83)}) | reg147[(1'h0):(1'h0)]) ?
              (^(^~{wire69, $signed(reg154)})) : wire70))
            begin
              reg186 <= ({(-reg74[(1'h1):(1'h0)]), {wire68[(1'h1):(1'h0)]}} ?
                  (7'h42) : wire180[(1'h0):(1'h0)]);
              reg187 <= (&$unsigned((wire70 ?
                  $signed(wire137) : ($unsigned(reg172) ~^ reg171[(3'h5):(2'h2)]))));
              reg188 <= reg183[(3'h5):(3'h4)];
            end
          else
            begin
              reg186 <= ((8'ha8) || {$signed({(|reg146)})});
              reg187 <= (reg75 >= (~^wire111));
              reg188 <= $unsigned(reg171);
            end
          reg189 <= reg166[(4'hc):(4'hc)];
        end
      reg190 <= (reg156[(1'h0):(1'h0)] ?
          $signed($signed(reg149[(3'h6):(1'h0)])) : $unsigned((8'hae)));
      reg191 <= (wire139[(2'h2):(1'h0)] & $signed(reg75));
    end
  assign wire192 = $signed($unsigned(reg174[(1'h1):(1'h1)]));
  assign wire193 = {(-($unsigned(reg149) - (reg164[(2'h3):(2'h2)] <= (~^reg189))))};
  module194 #() modinst255 (.y(wire254), .clk(clk), .wire198(reg167), .wire197(reg162), .wire195(reg165), .wire196(reg147));
endmodule

module module6
#(parameter param61 = {{({(|(8'hbd)), (+(8'had))} ? (((8'hb8) << (8'hb7)) ? {(8'h9d)} : ((8'hb6) ^ (8'hb4))) : (~&((8'hb7) ^~ (8'hb4))))}, (((((7'h42) | (8'hb2)) ? (~(8'hba)) : ((8'hb4) & (8'hb4))) * (((8'hb0) != (8'hbe)) ^ (^(7'h43)))) & ((&((7'h40) == (8'ha6))) ^~ (((8'ha9) ? (8'hb6) : (8'hb0)) ? ((8'hb3) ^~ (8'ha4)) : ((8'hb1) >> (8'haa)))))}, 
parameter param62 = (~|(-({(param61 ? param61 : param61), param61} ? (8'hb8) : ((~(8'haf)) ? (param61 ? param61 : param61) : (8'h9f))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire60,
                 wire58,
                 wire27,
                 wire26,
                 wire25,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = (~|((|((^wire9) | $unsigned(wire7))) ?
                      $signed({(wire7 < wire9), $unsigned(wire7)}) : {{(-wire8),
                              (^~wire10)}}));
  assign wire12 = wire9[(3'h6):(3'h5)];
  assign wire13 = $unsigned(wire8[(4'hc):(2'h3)]);
  assign wire14 = $unsigned(wire13[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((&{$signed((wire10 >> (~wire7))),
          (wire10[(4'h8):(2'h3)] ?
              $signed($signed(wire12)) : $signed(wire11[(2'h3):(1'h0)]))}))
        begin
          reg15 <= $signed(wire11[(4'hb):(3'h5)]);
          reg16 <= (~^wire11[(3'h4):(1'h1)]);
          reg17 <= $unsigned(((reg16[(4'he):(2'h3)] ?
              $signed(wire9[(1'h0):(1'h0)]) : ((~wire10) << wire7[(3'h7):(3'h4)])) & ((&wire13[(2'h2):(2'h2)]) || ($signed(wire11) - {(8'hb8)}))));
          if ((((^(&wire10)) ? wire11 : wire9[(2'h3):(2'h3)]) ?
              $unsigned(({$signed(reg16)} ^ ($signed(wire13) ?
                  wire8 : (wire12 ?
                      reg17 : wire7)))) : {(~&$signed($signed(wire8))),
                  (wire12 ? wire8 : (8'hb3))}))
            begin
              reg18 <= ($unsigned(wire8) ?
                  $unsigned((wire9 >>> wire13[(3'h5):(3'h4)])) : $signed((wire11 || ($signed(reg17) ?
                      $signed((8'hab)) : (!reg16)))));
              reg19 <= (~^$unsigned($signed(wire12[(1'h0):(1'h0)])));
              reg20 <= reg15;
            end
          else
            begin
              reg18 <= $unsigned((^~wire14[(1'h0):(1'h0)]));
              reg19 <= ($unsigned(wire13) ?
                  (((wire14[(1'h0):(1'h0)] ?
                      $unsigned(reg20) : {wire7}) > $signed((+reg16))) < $signed(reg15[(3'h7):(2'h2)])) : ((reg18[(4'h8):(4'h8)] && $unsigned(wire9[(4'hd):(3'h5)])) ^ $signed($unsigned((reg20 || reg17)))));
              reg20 <= (({wire12} ?
                      (7'h40) : ($signed(reg17) - $signed({(8'h9d)}))) ?
                  (wire12 ?
                      reg15 : (^~wire13[(3'h6):(2'h2)])) : (reg19[(3'h4):(2'h2)] | $signed(reg20[(3'h5):(1'h1)])));
              reg21 <= (((({wire11} ?
                  (~reg19) : (wire12 ?
                      wire8 : reg17)) ^~ wire12) >> reg16[(2'h2):(1'h1)]) & (7'h43));
              reg22 <= ((-($signed(wire9[(4'h9):(1'h1)]) ?
                  $signed(wire13) : (wire8 ?
                      wire12[(4'he):(1'h0)] : $unsigned((7'h41))))) * $signed({$signed((wire14 <<< reg15))}));
            end
          reg23 <= (((~|(~^$signed(wire9))) - reg18[(3'h7):(2'h2)]) || wire11);
        end
      else
        begin
          reg15 <= $unsigned((^reg23[(3'h5):(1'h1)]));
        end
      reg24 <= ($signed((8'hb9)) ?
          ($unsigned({(8'hbd)}) <<< $unsigned(((wire10 ^~ wire14) ^ $signed(reg15)))) : (~&(~(wire7 ?
              reg17[(2'h2):(1'h0)] : $signed(reg23)))));
    end
  assign wire25 = wire10;
  assign wire26 = $unsigned(($unsigned((reg22[(3'h4):(1'h0)] >> wire8[(1'h1):(1'h0)])) > {{(^reg24)},
                      wire14}));
  assign wire27 = (&reg22);
  module28 #() modinst59 (wire58, clk, reg22, wire12, wire25, reg17, reg16);
  assign wire60 = $unsigned($unsigned({$unsigned(reg15)}));
endmodule

module module28
#(parameter param56 = (((~(((8'h9d) << (8'ha0)) ? ((8'hb1) ? (8'hb8) : (8'ha5)) : {(8'hbb)})) ? ((-((7'h43) ? (8'haf) : (7'h44))) ? (8'hae) : (((8'hb2) > (7'h40)) == (~^(8'hb8)))) : ((((8'hb8) ? (8'h9c) : (8'h9f)) << ((8'ha6) >> (8'ha2))) ? (^{(8'hac)}) : ((8'ha8) ? ((8'ha6) ~^ (8'h9f)) : ((8'ha3) * (8'had))))) * (~|((((8'hac) ? (8'hbb) : (8'ha1)) ? ((8'hbf) * (8'hb5)) : (~&(8'h9c))) ? {((8'h9d) ? (8'h9e) : (8'hbe))} : (((8'hb5) ? (8'ha5) : (8'haa)) > ((8'ha6) ? (8'ha2) : (8'hb0)))))), 
parameter param57 = {(^~param56)})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire55,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
                 reg54,
                 reg52,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire34 = $unsigned($unsigned(wire33));
  assign wire35 = wire32;
  assign wire36 = {wire32[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg37 <= wire31[(4'h8):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg38 <= wire33;
    end
  assign wire39 = $signed($signed((&wire29)));
  always
    @(posedge clk) begin
      reg40 <= (&wire33[(2'h3):(1'h0)]);
      reg41 <= $unsigned(({$unsigned(((8'hb0) ? wire30 : (8'h9e))),
              wire29[(4'he):(2'h2)]} ?
          $signed(wire29[(4'ha):(4'h9)]) : $unsigned(((wire34 << wire32) ^~ (~|wire39)))));
      if (wire32)
        begin
          reg42 <= $signed((((|(wire32 ? wire33 : reg40)) == {wire33}) ?
              $signed(((wire30 ?
                  reg41 : reg41) != (&wire32))) : (~(~^(reg38 ~^ reg37)))));
          reg43 <= $signed(wire32);
          reg44 <= ((wire29 >> $signed($signed($signed(reg43)))) ~^ $signed($signed(wire33[(4'hc):(3'h7)])));
          reg45 <= (8'ha9);
        end
      else
        begin
          if (wire36[(2'h3):(1'h0)])
            begin
              reg42 <= (wire30[(4'hb):(4'ha)] ? wire31 : wire33);
              reg43 <= wire35;
              reg44 <= $signed(wire35);
            end
          else
            begin
              reg42 <= $signed(wire32[(3'h6):(2'h3)]);
            end
          reg45 <= (wire35[(3'h6):(1'h0)] ?
              {(+reg37[(2'h2):(2'h2)])} : wire32[(2'h3):(2'h3)]);
          reg46 <= (({{(wire39 ? wire35 : wire31), (8'hab)}} ?
                  ($signed(wire30[(3'h6):(1'h1)]) ?
                      (reg37[(1'h0):(1'h0)] ~^ reg44[(1'h1):(1'h0)]) : $signed({(8'ha6)})) : ((7'h40) != ($signed(reg37) ?
                      $signed(wire34) : (8'hb5)))) ?
              ($signed(((&(8'hb3)) ?
                  (^(8'hb9)) : wire30[(4'hb):(3'h7)])) <= reg38) : $unsigned(wire32));
          reg47 <= wire35;
        end
    end
  assign wire48 = (reg37 * (reg44 ?
                      ((&wire35) >= reg37) : ($signed((&reg46)) != $unsigned((wire31 ?
                          (8'haa) : reg43)))));
  assign wire49 = (^~{wire33[(4'hb):(2'h3)]});
  assign wire50 = (+({wire33[(4'h8):(3'h6)]} ?
                      $signed($unsigned((+wire36))) : reg46));
  assign wire51 = ($signed((({(8'hbe), wire49} ?
                          reg41[(5'h11):(4'hb)] : wire29) ?
                      $unsigned(reg45) : $unsigned($signed(wire49)))) || $signed($signed({((8'hb8) <= reg37)})));
  always
    @(posedge clk) begin
      reg52 <= (reg42 + wire34[(2'h3):(1'h0)]);
    end
  assign wire53 = wire50;
  always
    @(posedge clk) begin
      reg54 <= reg45;
    end
  assign wire55 = (reg43[(3'h6):(2'h3)] >>> $signed(wire35));
endmodule

module module194
#(parameter param252 = (((+({(8'had)} ? {(7'h44), (8'ha2)} : (-(8'hb7)))) ? (-(((8'ha9) ? (8'ha2) : (8'h9f)) << (8'ha8))) : (+{(|(8'hbc))})) ~^ {((^~((8'haa) ? (8'hb7) : (8'h9c))) ? (!(|(7'h44))) : ((8'hb6) < {(8'haf)})), ((((8'hb0) != (8'ha3)) ? ((8'ha9) << (8'hac)) : ((8'hbd) ? (8'ha9) : (8'ha2))) != (((8'hbd) >> (8'hb2)) ? ((8'hbe) <= (7'h43)) : {(7'h41)}))}), 
parameter param253 = {param252, param252})
(y, clk, wire198, wire197, wire196, wire195);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire198;
  input wire [(3'h6):(1'h0)] wire197;
  input wire signed [(4'hc):(1'h0)] wire196;
  input wire signed [(4'h9):(1'h0)] wire195;
  wire [(4'h8):(1'h0)] wire251;
  wire signed [(2'h2):(1'h0)] wire250;
  wire [(3'h6):(1'h0)] wire249;
  wire signed [(5'h10):(1'h0)] wire248;
  wire signed [(5'h15):(1'h0)] wire233;
  wire signed [(4'hc):(1'h0)] wire232;
  wire [(5'h10):(1'h0)] wire231;
  wire [(2'h2):(1'h0)] wire228;
  wire signed [(3'h7):(1'h0)] wire222;
  wire signed [(4'hb):(1'h0)] wire221;
  wire signed [(2'h3):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire205;
  wire [(5'h11):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire signed [(4'hb):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire199;
  reg [(5'h10):(1'h0)] reg247 = (1'h0);
  reg [(4'hb):(1'h0)] reg246 = (1'h0);
  reg [(5'h11):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg244 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg243 = (1'h0);
  reg [(3'h5):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg241 = (1'h0);
  reg [(4'hd):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg239 = (1'h0);
  reg signed [(4'he):(1'h0)] reg238 = (1'h0);
  reg [(2'h3):(1'h0)] reg237 = (1'h0);
  reg [(3'h6):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg234 = (1'h0);
  reg [(2'h3):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg229 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg227 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg226 = (1'h0);
  reg [(5'h15):(1'h0)] reg225 = (1'h0);
  reg [(4'hf):(1'h0)] reg224 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg220 = (1'h0);
  reg [(2'h3):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg218 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg217 = (1'h0);
  reg [(4'hc):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg215 = (1'h0);
  reg [(4'h8):(1'h0)] reg214 = (1'h0);
  reg [(3'h5):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg211 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg210 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg208 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg207 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg202 = (1'h0);
  assign y = {wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire233,
                 wire232,
                 wire231,
                 wire228,
                 wire222,
                 wire221,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire200,
                 wire199,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg230,
                 reg229,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
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
                 reg202,
                 (1'h0)};
  assign wire199 = $signed(wire198[(4'h8):(1'h0)]);
  assign wire200 = wire196[(2'h3):(1'h0)];
  assign wire201 = {wire197, wire200};
  always
    @(posedge clk) begin
      reg202 <= (~wire198[(2'h2):(1'h0)]);
    end
  assign wire203 = wire196[(4'h9):(1'h0)];
  assign wire204 = wire200;
  assign wire205 = $unsigned((+(~wire197[(2'h3):(1'h1)])));
  assign wire206 = wire201;
  always
    @(posedge clk) begin
      reg207 <= (~({$signed((wire203 || wire206)),
          wire201[(1'h1):(1'h1)]} <<< {(8'had), (~&{wire196, wire197})}));
      if ($signed(((8'ha1) - (wire197[(3'h6):(1'h0)] <<< wire198[(1'h0):(1'h0)]))))
        begin
          reg208 <= (^~(({wire199} > $unsigned($unsigned(wire198))) ?
              wire199[(3'h4):(2'h3)] : ((8'hb2) <= (^(~|wire206)))));
          if ($unsigned(wire200[(1'h1):(1'h1)]))
            begin
              reg209 <= $signed(($unsigned($unsigned(wire200)) ?
                  wire198[(2'h3):(1'h1)] : wire198[(3'h4):(2'h3)]));
              reg210 <= wire197;
              reg211 <= reg202[(2'h3):(1'h1)];
            end
          else
            begin
              reg209 <= (((((reg210 == reg207) ^ $unsigned((8'h9d))) ?
                      reg208[(3'h4):(2'h2)] : $unsigned((wire201 ?
                          reg202 : wire203))) ?
                  ($signed(wire201[(1'h1):(1'h1)]) <<< (~|(wire198 <<< wire201))) : ((8'ha3) && reg207[(1'h0):(1'h0)])) <= reg209[(2'h2):(1'h1)]);
              reg210 <= (|({($signed(reg209) > {wire204}),
                      wire200[(2'h2):(2'h2)]} ?
                  $signed($unsigned(((8'ha0) > wire205))) : ($signed($unsigned(wire198)) ?
                      reg208[(5'h10):(4'hb)] : (~&(reg211 * wire204)))));
              reg211 <= (-$signed((~|(reg207[(1'h0):(1'h0)] ?
                  (+wire199) : (reg211 ? (8'ha0) : (7'h40))))));
              reg212 <= (((wire206 ?
                  (&(reg210 ? wire206 : reg210)) : ((wire199 ^~ wire200) ?
                      wire198[(4'h8):(3'h4)] : $signed(wire204))) + {$unsigned((reg208 ?
                      wire201 : (8'hae)))}) <= (wire200 - (&$unsigned((reg208 ?
                  wire198 : reg211)))));
            end
          reg213 <= {$signed(((^~(&reg210)) ?
                  (reg210 << wire195[(2'h3):(2'h2)]) : reg207[(2'h2):(1'h0)])),
              ($signed((+(wire204 ? wire199 : wire206))) ?
                  reg210 : $unsigned((~|wire204[(3'h7):(1'h1)])))};
          if (reg212)
            begin
              reg214 <= ({(($unsigned(wire201) ?
                      reg210 : (~&reg213)) * ((wire204 ? (8'h9e) : wire197) ?
                      $unsigned(wire196) : reg213[(1'h0):(1'h0)])),
                  reg213[(3'h4):(3'h4)]} << wire201);
              reg215 <= reg208[(5'h11):(3'h7)];
              reg216 <= wire203;
            end
          else
            begin
              reg214 <= (&$unsigned(reg202[(4'ha):(3'h5)]));
              reg215 <= ((((~$unsigned(wire199)) ?
                          wire198[(4'h8):(3'h4)] : reg209[(4'h8):(3'h4)]) ?
                      $unsigned(($signed(wire198) ?
                          wire198[(2'h3):(2'h3)] : wire203[(1'h0):(1'h0)])) : $unsigned(wire199[(3'h4):(3'h4)])) ?
                  wire203[(1'h1):(1'h0)] : (reg209 ?
                      {{$signed(wire197), wire197},
                          $signed($signed(wire201))} : {(!$unsigned(wire197))}));
              reg216 <= ($unsigned($signed($signed(reg208))) || (reg211[(2'h2):(1'h0)] ?
                  (({wire199} ?
                      (reg213 ?
                          wire205 : reg215) : reg210) ^ (wire197[(3'h6):(2'h3)] ?
                      (wire198 ? reg207 : (8'ha9)) : (~&wire204))) : (7'h42)));
              reg217 <= reg210;
            end
          reg218 <= wire200[(2'h3):(1'h0)];
        end
      else
        begin
          reg208 <= ((((~^(reg211 | wire206)) ?
              (wire195 ?
                  (reg214 - reg217) : reg211) : $unsigned((+reg215))) >>> (&(&(7'h43)))) <= reg218[(2'h3):(1'h0)]);
          reg209 <= $signed(((((wire195 ^~ (8'hb9)) ?
                  wire205[(2'h3):(2'h3)] : $signed(reg214)) - (|$unsigned(reg215))) ?
              (wire204 + ($unsigned(wire195) ^ wire195[(4'h9):(3'h6)])) : reg214[(3'h7):(1'h1)]));
          if ((~(((wire204 & (wire205 ?
              wire205 : wire201)) + wire196[(2'h3):(2'h3)]) == wire196)))
            begin
              reg210 <= (($unsigned(($signed((8'hba)) == (^~wire205))) ?
                  $signed({$unsigned(reg211),
                      (wire206 ?
                          wire204 : reg215)}) : wire199[(3'h4):(1'h1)]) > $unsigned($signed(reg216)));
              reg211 <= ($signed((~&(7'h42))) - ($signed(wire195) >= $unsigned(wire204[(5'h10):(4'he)])));
            end
          else
            begin
              reg210 <= (($unsigned(($unsigned(wire199) ?
                  (&(8'hb9)) : (&wire200))) << $signed(wire195)) == $signed($signed(({reg213,
                  wire197} != (wire206 ? wire206 : (8'hb9))))));
            end
        end
      reg219 <= (($unsigned((8'haf)) + $unsigned((|(&reg215)))) && $unsigned($unsigned((wire201 * $signed(wire205)))));
      reg220 <= $unsigned($signed((7'h42)));
    end
  assign wire221 = wire205[(3'h5):(2'h2)];
  assign wire222 = (wire196 ?
                       $unsigned($signed(((-(8'ha7)) + wire196))) : ($signed(($signed(reg207) ?
                           (reg218 ?
                               reg211 : wire221) : (+reg219))) | $unsigned(((wire196 ?
                               wire203 : wire199) ?
                           (wire195 != wire195) : (+wire200)))));
  always
    @(posedge clk) begin
      reg223 <= reg219;
      reg224 <= (~$signed(($unsigned(((8'hb3) ? reg220 : reg220)) > reg215)));
      reg225 <= (({((reg217 <<< reg223) ?
              wire201 : $signed(wire198))} > wire203) >> (($unsigned({reg218,
                  reg217}) ?
              reg209 : (~|(wire200 ? wire195 : wire199))) ?
          (|({wire222, wire199} <<< (~&reg214))) : reg219));
      reg226 <= $signed($unsigned($signed($signed($unsigned(wire222)))));
      reg227 <= (-$signed(wire201));
    end
  assign wire228 = $unsigned(wire198);
  always
    @(posedge clk) begin
      reg229 <= ($unsigned((~^reg210)) ?
          ($signed({(wire221 ? reg212 : wire201),
              (reg227 ? reg218 : reg225)}) * reg210) : wire206);
      reg230 <= ({reg209, reg223} == $unsigned({$signed((wire196 != wire197)),
          (reg210 ? (~&wire198) : wire196[(4'hc):(4'h8)])}));
    end
  assign wire231 = (!(-(reg213[(3'h4):(3'h4)] >> (wire228[(1'h0):(1'h0)] * reg213))));
  assign wire232 = $signed($unsigned($signed(((reg209 & reg213) << $signed(reg207)))));
  assign wire233 = wire201[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg234 <= (wire221[(3'h4):(2'h3)] < reg202[(2'h2):(1'h1)]);
      if (wire201)
        begin
          reg235 <= reg220[(2'h2):(2'h2)];
          reg236 <= reg210;
        end
      else
        begin
          reg235 <= reg225[(4'hd):(4'h8)];
          if (((~(^$signed((~reg234)))) < (wire201[(3'h6):(2'h2)] <= $unsigned((reg211 ?
              $signed(reg211) : wire232[(1'h1):(1'h1)])))))
            begin
              reg236 <= $signed($unsigned(($signed(wire205) ?
                  $unsigned($signed(wire197)) : ($unsigned(wire231) || (reg212 && reg208)))));
            end
          else
            begin
              reg236 <= $signed(reg230[(1'h1):(1'h1)]);
              reg237 <= (&wire206);
            end
          reg238 <= reg237[(1'h1):(1'h0)];
          reg239 <= $unsigned({$signed($unsigned($signed(reg236)))});
          reg240 <= reg226[(2'h3):(2'h2)];
        end
      if (((~|$unsigned($signed($signed((8'ha7))))) * $signed(wire222)))
        begin
          if (((~^$unsigned(($unsigned(reg239) ?
                  $signed(reg226) : (reg234 >> reg207)))) ?
              $signed((&reg219)) : ((~^((reg216 | (8'hbc)) ?
                      wire198 : (reg225 > reg216))) ?
                  ((wire205[(1'h0):(1'h0)] > wire200[(2'h3):(2'h2)]) || (~^reg209)) : ((reg234 > reg226) ?
                      (reg209 ?
                          wire201 : $unsigned(reg227)) : $unsigned(reg238)))))
            begin
              reg241 <= reg235[(1'h1):(1'h0)];
              reg242 <= reg239[(3'h7):(2'h2)];
            end
          else
            begin
              reg241 <= (^~(reg212[(4'he):(3'h4)] ?
                  (($signed(wire231) + (^reg229)) * $signed((reg215 | reg220))) : $unsigned((^(reg212 ?
                      reg235 : reg237)))));
            end
          reg243 <= $unsigned(reg230);
        end
      else
        begin
          if ((reg220[(4'hb):(1'h0)] >= $unsigned($unsigned($unsigned($signed(reg224))))))
            begin
              reg241 <= $unsigned(reg220);
              reg242 <= $signed($signed($signed((&$signed(reg235)))));
              reg243 <= $signed($signed(($unsigned((8'hac)) ?
                  (reg218 ?
                      {(8'hbe)} : reg236[(3'h5):(2'h3)]) : $unsigned({reg235}))));
              reg244 <= ($signed({(&(reg215 ? reg236 : wire201)),
                  (&{reg208})}) ~^ (reg225 + (+$unsigned({wire203, reg209}))));
              reg245 <= (~$signed($unsigned($unsigned(reg220[(4'he):(3'h7)]))));
            end
          else
            begin
              reg241 <= (reg235 ?
                  wire198[(1'h0):(1'h0)] : (reg245[(3'h6):(3'h5)] ?
                      reg213[(3'h5):(1'h1)] : $signed((^~$signed(reg216)))));
            end
          reg246 <= $unsigned(reg215);
        end
      reg247 <= reg209;
    end
  assign wire248 = (reg224 == (^~reg226));
  assign wire249 = reg241[(1'h0):(1'h0)];
  assign wire250 = $unsigned((wire248[(3'h4):(1'h0)] == (reg219 ?
                       wire221[(3'h7):(2'h2)] : wire198)));
  assign wire251 = wire203;
endmodule

module module112
#(parameter param136 = {(~&((((8'ha2) ? (8'ha3) : (8'had)) < ((8'ha0) >> (8'hb6))) ? (!{(8'ha3), (8'hb1)}) : (^~((8'ha7) ~^ (7'h43))))), (^~(~|((8'hb0) ? {(8'hb2), (8'ha2)} : ((8'hb7) >>> (8'h9e)))))})
(y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire117;
  input wire [(4'hb):(1'h0)] wire116;
  input wire [(4'hc):(1'h0)] wire115;
  input wire [(4'hb):(1'h0)] wire114;
  input wire [(4'hb):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire118;
  reg signed [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire118,
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
                 (1'h0)};
  assign wire118 = $signed((~(wire117 * {wire113})));
  always
    @(posedge clk) begin
      if ((wire117[(4'ha):(1'h1)] ?
          {$unsigned((wire115 ?
                  ((7'h40) ?
                      (8'h9c) : wire116) : (wire113 == wire113)))} : $unsigned(wire115[(2'h3):(2'h3)])))
        begin
          reg119 <= (wire114 ? wire115[(4'h8):(3'h7)] : wire115);
          reg120 <= ($signed($unsigned(wire114[(3'h4):(1'h0)])) != $signed(wire116[(3'h4):(3'h4)]));
          reg121 <= reg119;
          reg122 <= $unsigned(wire113);
        end
      else
        begin
          reg119 <= (~^{reg122[(3'h4):(3'h4)],
              ((wire118 ? wire115 : reg120[(3'h6):(2'h2)]) ?
                  ($signed((8'hb1)) ?
                      reg121 : wire116[(3'h4):(2'h3)]) : {$signed(wire118)})});
          if ({{$signed($signed(reg119[(1'h1):(1'h1)])),
                  {(^~(reg120 || (8'ha2)))}}})
            begin
              reg120 <= $unsigned((!$signed(((reg122 ? reg122 : wire116) ?
                  $unsigned(reg119) : wire117))));
              reg121 <= (((~^reg122[(3'h4):(1'h1)]) * (($signed(wire113) ?
                      (~&reg122) : (!wire115)) ?
                  $unsigned($signed(reg119)) : ((wire114 ? wire118 : wire118) ?
                      $unsigned(reg122) : $signed((8'hb5))))) * $signed((^(~^wire114[(4'h9):(2'h2)]))));
              reg122 <= (((($unsigned(wire113) ?
                  ((8'ha3) | (8'hb5)) : (wire113 >> wire113)) >>> wire116) << (+wire114)) - reg121[(2'h2):(2'h2)]);
            end
          else
            begin
              reg120 <= (reg120[(3'h4):(2'h2)] && reg119[(1'h0):(1'h0)]);
              reg121 <= wire115[(4'h8):(2'h2)];
            end
          reg123 <= {((8'hb5) == $unsigned($signed($unsigned(reg119)))),
              (^(+(+$unsigned(wire117))))};
          reg124 <= ((reg121[(2'h2):(1'h1)] ^ $unsigned(((-reg120) * (wire117 ?
              reg121 : reg122)))) < reg120);
          if ({({reg119[(3'h4):(1'h0)], (~&((8'hb3) ? reg121 : wire114))} ?
                  wire114 : $signed((&reg123[(3'h6):(2'h2)]))),
              wire113})
            begin
              reg125 <= (wire115 + wire118[(3'h4):(3'h4)]);
              reg126 <= (($unsigned((!(~&reg119))) ?
                      wire117[(3'h6):(3'h4)] : $unsigned((~wire114[(2'h2):(2'h2)]))) ?
                  ($signed(reg123) > reg120) : $unsigned((|reg120)));
              reg127 <= (|$signed(($unsigned((~&(7'h44))) >= (~^(^(8'hbd))))));
            end
          else
            begin
              reg125 <= ((~^({(reg127 ? reg127 : (8'h9f)),
                      (~&(8'hb8))} ~^ (~^((8'hb9) ^~ wire115)))) ?
                  $unsigned((((reg123 >>> (8'ha8)) ?
                      reg123 : (wire115 ?
                          reg120 : reg121)) <<< wire116)) : $unsigned($signed(reg127)));
              reg126 <= $signed($unsigned((reg125 ?
                  (~wire114[(4'ha):(3'h6)]) : ((wire117 ?
                      wire113 : wire116) == (7'h42)))));
            end
        end
      reg128 <= reg119;
      reg129 <= (~|reg120);
    end
  assign wire130 = (+({($signed(wire115) ? $unsigned(reg123) : reg129)} ?
                       (+((reg119 ? reg126 : (8'hae)) ?
                           $signed(reg119) : $unsigned(reg122))) : reg127[(3'h7):(3'h6)]));
  assign wire131 = reg127;
  assign wire132 = wire131[(4'hb):(3'h5)];
  assign wire133 = {$unsigned((-((8'hbd) + (reg121 ? (8'h9f) : reg125))))};
  assign wire134 = $unsigned($signed($signed($signed($unsigned(wire118)))));
  assign wire135 = wire131;
endmodule

module module85
#(parameter param105 = (8'ha3))
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  input wire signed [(4'h9):(1'h0)] wire88;
  input wire signed [(4'hd):(1'h0)] wire87;
  input wire [(3'h6):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(3'h7):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire91;
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire93,
                 wire92,
                 wire91,
                 reg104,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire91 = wire90;
  assign wire92 = ($unsigned((^$signed($unsigned(wire88)))) || wire87[(3'h5):(1'h0)]);
  assign wire93 = (+wire91);
  always
    @(posedge clk) begin
      reg94 <= $unsigned({wire87});
      reg95 <= wire86[(3'h5):(3'h5)];
    end
  assign wire96 = wire88;
  assign wire97 = reg95;
  assign wire98 = $unsigned(wire91[(5'h12):(3'h7)]);
  assign wire99 = ((($unsigned({(8'hb4), (8'hbb)}) ^~ {(wire96 ?
                              wire89 : reg95),
                          wire86[(1'h0):(1'h0)]}) ^ (^reg95[(4'hb):(3'h5)])) ?
                      $signed($signed(wire90[(3'h7):(2'h2)])) : $signed($unsigned($unsigned((~reg95)))));
  assign wire100 = $signed((wire93[(4'he):(3'h7)] == (8'hb4)));
  assign wire101 = (8'h9d);
  assign wire102 = wire88[(3'h4):(1'h1)];
  assign wire103 = $unsigned(($signed(wire102) ?
                       reg94[(4'hc):(4'hb)] : wire100));
  always
    @(posedge clk) begin
      reg104 <= (~^$signed($unsigned((reg94 ? wire92 : $signed(wire99)))));
    end
endmodule
