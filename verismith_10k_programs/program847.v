module top
#(parameter param267 = (&{(8'hbe)}), 
parameter param268 = ({{(~|{param267})}} < (~&({param267} ? (|{param267, param267}) : ((param267 ? (8'hae) : param267) > (param267 >> param267))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire265;
  wire [(4'h8):(1'h0)] wire264;
  wire signed [(4'hc):(1'h0)] wire259;
  wire [(5'h14):(1'h0)] wire246;
  wire [(4'hf):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg263 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg262 = (1'h0);
  reg [(5'h14):(1'h0)] reg261 = (1'h0);
  reg [(5'h14):(1'h0)] reg260 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg258 = (1'h0);
  reg [(2'h2):(1'h0)] reg257 = (1'h0);
  reg [(5'h10):(1'h0)] reg256 = (1'h0);
  reg [(2'h3):(1'h0)] reg255 = (1'h0);
  reg [(3'h7):(1'h0)] reg254 = (1'h0);
  reg [(5'h15):(1'h0)] reg253 = (1'h0);
  reg [(4'ha):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg250 = (1'h0);
  reg [(4'h9):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire265,
                 wire264,
                 wire259,
                 wire246,
                 wire100,
                 wire23,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
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
                 reg7,
                 reg8,
                 reg9,
                 reg10,
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
                 (1'h0)};
  assign wire5 = ($unsigned($unsigned((^~$unsigned(wire3)))) <= $unsigned($signed($signed((wire1 <= wire0)))));
  assign wire6 = $signed($signed($signed(($signed(wire2) || (wire5 ?
                     wire3 : wire5)))));
  always
    @(posedge clk) begin
      reg7 <= (^$signed($unsigned($signed($unsigned(wire5)))));
      reg8 <= ((^~(wire3[(2'h3):(1'h0)] + (+$signed(wire4)))) ?
          ({$signed((wire3 ?
                  wire0 : (8'hab)))} != wire5[(4'hc):(3'h6)]) : (&{$unsigned(reg7),
              ((8'ha8) ? (~|wire3) : wire1[(1'h1):(1'h0)])}));
      reg9 <= $signed(wire3);
      reg10 <= $unsigned((7'h43));
    end
  assign wire11 = (7'h44);
  assign wire12 = (!({$signed((~|(8'hab))),
                      $signed(((7'h41) & wire3))} ^~ ((~$unsigned(wire1)) ^~ reg9[(4'hd):(4'ha)])));
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg13 <= $unsigned((wire4[(4'ha):(3'h7)] ?
              $unsigned((wire11[(3'h4):(2'h3)] && $signed(reg10))) : ({((8'ha2) || (8'hb2))} != $signed((^~wire5)))));
          if ({(wire6 ?
                  (wire3 & (7'h40)) : ((wire6 >> ((8'hab) > wire4)) ~^ $signed((reg8 <<< wire1)))),
              (($signed(wire12[(1'h1):(1'h1)]) ?
                      wire11 : ((-reg8) ? {wire4, wire12} : (8'hbf))) ?
                  wire5[(4'he):(3'h6)] : reg9)})
            begin
              reg14 <= $signed(wire6[(2'h2):(2'h2)]);
              reg15 <= ($unsigned(reg7) << $unsigned(({wire5} * $unsigned((wire12 && (8'ha2))))));
              reg16 <= $unsigned({(($signed(wire12) >= (~&reg7)) ?
                      $signed($unsigned(wire3)) : (^$unsigned(wire2)))});
              reg17 <= $signed(($unsigned($signed(wire4[(4'hc):(4'hc)])) && (((wire1 > reg7) ?
                  (|reg13) : wire12[(1'h1):(1'h1)]) ~^ $unsigned((|reg14)))));
            end
          else
            begin
              reg14 <= (reg8 < (wire1[(2'h3):(2'h3)] ?
                  reg16 : (wire4[(3'h5):(1'h1)] <<< ($unsigned(wire3) ?
                      reg16 : reg7[(4'h8):(3'h4)]))));
              reg15 <= (^~(((!{wire1}) ~^ (~&$signed(wire2))) ?
                  $signed(wire2[(1'h0):(1'h0)]) : (wire5 & $unsigned(((8'hbd) ^ wire6)))));
            end
        end
      else
        begin
          reg13 <= $unsigned({$unsigned(wire1[(3'h4):(3'h4)]),
              (~wire6[(1'h1):(1'h0)])});
          reg14 <= $signed($signed($unsigned((wire3[(2'h3):(1'h0)] > $signed(reg10)))));
          reg15 <= $unsigned(((reg9[(4'hd):(4'h9)] ?
                  $signed((!(8'ha1))) : $signed($unsigned(wire1))) ?
              $signed($signed((~&wire6))) : wire11));
          if ((($unsigned(wire3[(3'h5):(1'h1)]) ^~ reg8) ?
              ((~$signed(wire2[(4'ha):(2'h2)])) ?
                  reg7[(3'h6):(2'h2)] : (((wire3 ? reg15 : reg14) ?
                          $signed(wire12) : wire11) ?
                      (+wire0) : ((&(8'hb4)) > wire2))) : (-($unsigned((~|(8'h9d))) ?
                  $signed((reg15 ? reg14 : wire3)) : ((wire2 ?
                      wire0 : wire0) >> (reg9 > wire11))))))
            begin
              reg16 <= $signed(wire11);
              reg17 <= wire5[(1'h0):(1'h0)];
              reg18 <= reg9[(3'h6):(2'h3)];
              reg19 <= (^((~((wire0 ? (8'ha3) : wire2) ?
                      wire4[(1'h0):(1'h0)] : $unsigned(wire5))) ?
                  wire12 : $unsigned($signed((!reg10)))));
            end
          else
            begin
              reg16 <= (reg16[(3'h4):(2'h3)] ?
                  $signed(wire11[(1'h0):(1'h0)]) : $signed(reg7));
              reg17 <= {(~&(-({wire6} >= (wire12 ? wire11 : reg14)))), (8'h9c)};
              reg18 <= (~(8'hb4));
            end
        end
      reg20 <= $unsigned(wire6[(3'h7):(1'h1)]);
      reg21 <= wire2;
      reg22 <= $unsigned($signed(((-reg17[(3'h5):(3'h4)]) <<< (wire5 ?
          $unsigned(wire1) : wire5[(3'h5):(1'h0)]))));
    end
  assign wire23 = $unsigned((reg13 | {{(wire1 ? wire6 : (8'hb8)),
                          $unsigned(reg16)}}));
  module24 #() modinst101 (wire100, clk, wire2, reg10, reg15, reg18, wire6);
  module102 #() modinst247 (wire246, clk, reg14, wire3, reg10, wire23);
  always
    @(posedge clk) begin
      if ((($unsigned(wire6[(4'h9):(3'h4)]) ?
          (reg16[(2'h3):(2'h3)] ?
              {{(8'ha3)}} : $unsigned(reg9[(4'hb):(2'h2)])) : (~^$unsigned($unsigned(wire12)))) + $signed($signed($unsigned((wire4 || wire0))))))
        begin
          reg248 <= wire1;
          reg249 <= reg13[(1'h0):(1'h0)];
          reg250 <= {reg7[(4'h9):(2'h3)],
              ({reg248[(1'h0):(1'h0)]} ?
                  {wire6,
                      (reg9[(4'hc):(4'h9)] ?
                          wire11[(1'h0):(1'h0)] : (reg19 | wire2))} : ($unsigned($signed(reg13)) ?
                      (^(wire23 && reg21)) : reg10))};
        end
      else
        begin
          reg248 <= {$signed($unsigned($signed($signed((8'hae)))))};
          if (reg18[(4'hf):(3'h4)])
            begin
              reg249 <= reg16[(1'h0):(1'h0)];
              reg250 <= $signed(({((wire2 << wire100) * wire2)} | $signed(((-wire12) - $signed((8'ha2))))));
            end
          else
            begin
              reg249 <= $signed(wire246[(1'h1):(1'h1)]);
              reg250 <= ({($signed((~&reg19)) ?
                          $signed($signed((8'ha4))) : $unsigned($signed(reg20)))} ?
                  (~&(~|$unsigned($unsigned(wire11)))) : reg13[(2'h2):(1'h1)]);
              reg251 <= reg17[(3'h6):(2'h2)];
              reg252 <= $unsigned((~^$signed($signed(reg9[(4'hb):(2'h2)]))));
            end
          reg253 <= $signed($signed((!{$signed(wire11)})));
          reg254 <= (~|reg249[(1'h0):(1'h0)]);
        end
      reg255 <= ((8'hb3) ?
          (wire12 ^~ (((reg22 * reg22) ?
              wire246 : (8'h9c)) << wire246[(3'h4):(1'h1)])) : $signed(reg248));
      reg256 <= (8'hab);
      reg257 <= (wire23 && ({{$unsigned(reg13)}, (8'hac)} >> $signed((((8'h9f) ?
          reg10 : (8'ha8)) >= (reg17 <= reg8)))));
    end
  always
    @(posedge clk) begin
      reg258 <= wire246[(1'h0):(1'h0)];
    end
  assign wire259 = (&reg8);
  always
    @(posedge clk) begin
      reg260 <= (~^$signed((reg20[(3'h4):(1'h1)] ?
          reg17[(3'h4):(1'h0)] : ((reg251 ?
              (8'hbe) : wire12) * reg9[(1'h0):(1'h0)]))));
      reg261 <= $signed((^~($unsigned({wire1, reg251}) * {(wire23 ?
              wire0 : reg22)})));
      reg262 <= reg260[(2'h2):(1'h0)];
      reg263 <= wire12[(2'h3):(2'h3)];
    end
  assign wire264 = (8'hbf);
  module102 #() modinst266 (.wire105(reg14), .clk(clk), .wire104(reg251), .y(wire265), .wire106(reg258), .wire103(reg7));
endmodule

module module102
#(parameter param244 = (({(((8'hb7) ? (8'hbe) : (8'h9e)) <<< ((8'h9e) ? (8'h9f) : (8'ha3))), (-((8'hb1) ~^ (8'hbe)))} >> ({((8'h9d) ? (8'haa) : (8'hbd)), (~^(8'ha2))} < (((8'ha9) <<< (8'ha5)) ? ((8'ha4) ? (8'hb4) : (8'hb9)) : ((8'hbc) != (8'ha7))))) * ((+(8'hb2)) ? {((8'hb4) ? (-(8'hae)) : (^(8'hb5)))} : (~|(+(~&(8'haf)))))), 
parameter param245 = ((-((8'hb6) * ({param244} ? (!param244) : (~&param244)))) <= ((~^param244) == {(~^(param244 >>> (8'ha1))), {param244, (param244 ? param244 : (8'ha0))}})))
(y, clk, wire103, wire104, wire105, wire106);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire103;
  input wire signed [(5'h15):(1'h0)] wire104;
  input wire [(4'hb):(1'h0)] wire105;
  input wire [(3'h6):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire243;
  wire signed [(2'h3):(1'h0)] wire242;
  wire signed [(5'h10):(1'h0)] wire238;
  wire [(2'h2):(1'h0)] wire237;
  wire [(5'h10):(1'h0)] wire221;
  wire signed [(2'h3):(1'h0)] wire220;
  wire signed [(3'h6):(1'h0)] wire203;
  wire [(4'h9):(1'h0)] wire202;
  wire [(3'h5):(1'h0)] wire201;
  wire signed [(5'h13):(1'h0)] wire200;
  wire [(5'h13):(1'h0)] wire199;
  wire [(4'hf):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire197;
  reg signed [(2'h2):(1'h0)] reg241 = (1'h0);
  reg [(4'ha):(1'h0)] reg240 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg236 = (1'h0);
  reg [(4'he):(1'h0)] reg235 = (1'h0);
  reg [(2'h3):(1'h0)] reg234 = (1'h0);
  reg [(4'h9):(1'h0)] reg233 = (1'h0);
  reg [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(4'h9):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg230 = (1'h0);
  reg [(5'h10):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg228 = (1'h0);
  reg [(4'h9):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg223 = (1'h0);
  reg [(4'ha):(1'h0)] reg222 = (1'h0);
  reg [(5'h12):(1'h0)] reg219 = (1'h0);
  reg [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(2'h3):(1'h0)] reg217 = (1'h0);
  reg [(5'h13):(1'h0)] reg216 = (1'h0);
  reg [(3'h5):(1'h0)] reg215 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg [(5'h12):(1'h0)] reg212 = (1'h0);
  reg [(2'h3):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg209 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg208 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg207 = (1'h0);
  reg [(4'hf):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  assign y = {wire243,
                 wire242,
                 wire238,
                 wire237,
                 wire221,
                 wire220,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire121,
                 wire197,
                 reg241,
                 reg240,
                 reg239,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
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
                 (1'h0)};
  module107 #() modinst122 (.wire112(wire103), .wire110(wire106), .wire111(wire105), .wire109(wire104), .clk(clk), .y(wire121), .wire108((8'ha2)));
  module123 #() modinst198 (wire197, clk, wire103, wire104, wire105, wire121, wire106);
  assign wire199 = $unsigned($signed({wire106}));
  assign wire200 = wire197[(2'h2):(2'h2)];
  assign wire201 = wire105[(2'h2):(1'h0)];
  assign wire202 = $unsigned({$unsigned(wire201[(2'h2):(2'h2)]),
                       ($unsigned((wire200 >> (8'hb5))) ?
                           $signed($unsigned(wire201)) : ({wire197,
                               wire199} > ((8'hb7) < wire106)))});
  assign wire203 = wire104;
  always
    @(posedge clk) begin
      reg204 <= (-$signed((~^(~&(!wire105)))));
      if (wire106[(1'h1):(1'h1)])
        begin
          reg205 <= {wire197[(3'h4):(1'h1)]};
          if ({{wire104, $signed(wire104[(4'he):(4'h8)])},
              ($unsigned((wire200[(2'h2):(1'h1)] != (^wire200))) ?
                  $unsigned((reg204 ?
                      wire106 : wire197[(1'h1):(1'h0)])) : $signed(wire103[(4'h9):(2'h3)]))})
            begin
              reg206 <= (($unsigned(wire199) * (8'ha0)) ?
                  wire202 : $unsigned({wire104, $signed((+wire121))}));
            end
          else
            begin
              reg206 <= $unsigned(((wire104 ?
                      (^(wire103 >>> reg206)) : wire104[(5'h11):(1'h1)]) ?
                  wire105[(2'h2):(2'h2)] : reg206[(2'h3):(1'h1)]));
              reg207 <= ((-wire201) ?
                  $signed((~|(~&wire199))) : {(-(!(~|wire106)))});
            end
          reg208 <= $signed(wire201[(1'h0):(1'h0)]);
          reg209 <= wire121[(4'hf):(3'h5)];
        end
      else
        begin
          if (((wire105 ^ reg208[(3'h4):(2'h2)]) != $unsigned(($unsigned((wire202 || reg207)) ?
              {wire202, wire106[(3'h6):(2'h2)]} : (&{wire202})))))
            begin
              reg205 <= (wire200[(4'h8):(2'h3)] >= ((((wire103 <<< reg209) ?
                      (wire200 ? wire202 : reg205) : (-reg205)) ?
                  ((~&wire199) >> (~|(8'hbd))) : wire200[(3'h6):(2'h3)]) ~^ wire203[(3'h5):(2'h3)]));
              reg206 <= $signed(wire203[(1'h0):(1'h0)]);
            end
          else
            begin
              reg205 <= {((((wire202 ? wire199 : (8'ha2)) ?
                              (reg209 <= wire104) : (wire105 ?
                                  wire105 : reg209)) ?
                          (~^$signed(wire197)) : wire104[(4'h8):(2'h2)]) ?
                      {($signed(reg205) ?
                              (wire105 << (8'hbd)) : (-wire202))} : $unsigned(((!reg207) << $unsigned(wire104))))};
              reg206 <= ((reg209[(4'hb):(3'h7)] | (reg207 ?
                  reg209 : {(^~reg204),
                      $signed(wire121)})) * $unsigned($signed(((wire203 ?
                  wire103 : reg206) >> wire197[(1'h1):(1'h1)]))));
              reg207 <= ($unsigned(wire197) && $signed(wire202[(2'h3):(2'h3)]));
              reg208 <= $unsigned(wire200[(5'h13):(2'h3)]);
            end
          if ($unsigned(($unsigned(((&wire203) >>> $signed(wire200))) << (&((!(8'hb9)) && (|wire197))))))
            begin
              reg209 <= ((!((&$signed(wire121)) ?
                      ((wire104 ? (8'hb7) : reg205) > (reg204 ?
                          wire121 : reg209)) : $signed((wire105 ?
                          reg205 : wire105)))) ?
                  (wire105 ^~ {($signed(wire106) ?
                          $unsigned(wire202) : (reg206 < reg207)),
                      (wire201[(1'h1):(1'h0)] - $unsigned(reg207))}) : wire104);
              reg210 <= (~^((~^({(8'hb4)} - $unsigned(reg204))) << (+$signed($unsigned(wire106)))));
              reg211 <= (~^{wire105[(4'hb):(4'h8)], reg208});
              reg212 <= wire104[(3'h5):(2'h3)];
              reg213 <= $signed((($signed(reg211) || wire199) ?
                  reg205[(3'h5):(1'h0)] : $unsigned(($unsigned(reg210) ^ {reg207}))));
            end
          else
            begin
              reg209 <= $unsigned((((wire200 ?
                          (wire203 ? reg213 : reg213) : {wire202}) ?
                      wire200 : ({reg204, reg205} < $unsigned(wire197))) ?
                  (reg209[(2'h2):(1'h1)] != (^~{wire104,
                      reg206})) : wire103[(4'ha):(2'h2)]));
            end
        end
      reg214 <= $unsigned(reg211[(1'h0):(1'h0)]);
      reg215 <= (^~{($unsigned(reg208) ? reg213[(4'he):(3'h7)] : reg209),
          $unsigned(($unsigned((7'h44)) < $unsigned(wire203)))});
      reg216 <= wire121;
    end
  always
    @(posedge clk) begin
      reg217 <= (((|reg205) ?
              {({wire106, wire202} ? (wire201 ^~ wire200) : $unsigned(reg216)),
                  $unsigned((wire104 >= reg215))} : (($unsigned(reg213) ?
                      {wire201, (8'hbf)} : (wire121 ? reg204 : (8'ha8))) ?
                  $unsigned($signed(wire201)) : ({(8'hb1), reg207} ?
                      (reg213 ? wire103 : reg214) : reg207))) ?
          $signed((wire103 ^~ reg213[(3'h5):(3'h5)])) : ((wire106[(3'h5):(3'h5)] ?
              (8'h9d) : wire200) ~^ (wire103 ? reg211 : reg210)));
      reg218 <= $signed(wire103[(4'hf):(4'ha)]);
      reg219 <= ((($signed((&reg207)) ?
              reg216[(4'h8):(3'h5)] : (reg204[(1'h1):(1'h1)] ?
                  $signed(reg213) : $signed(reg214))) >>> wire197[(3'h4):(1'h1)]) ?
          ((8'hbf) ?
              reg204[(1'h1):(1'h0)] : (!$unsigned($unsigned((7'h40))))) : (reg208 ?
              (~^(+wire200[(5'h12):(2'h3)])) : (^~(8'h9c))));
    end
  assign wire220 = reg210[(2'h2):(2'h2)];
  assign wire221 = ($unsigned((^$signed(wire121[(2'h3):(2'h2)]))) ?
                       wire201[(3'h5):(1'h1)] : reg215[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg222 <= wire200[(4'ha):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg223 <= (~^$signed($signed($signed((-wire121)))));
      reg224 <= wire221[(4'h8):(3'h5)];
      reg225 <= $signed($signed(reg213[(1'h0):(1'h0)]));
      if ($signed(reg209))
        begin
          reg226 <= wire105[(1'h0):(1'h0)];
          reg227 <= $signed((^~{reg215[(2'h2):(1'h0)]}));
          if ((~reg206))
            begin
              reg228 <= wire106;
              reg229 <= reg227[(3'h5):(2'h3)];
            end
          else
            begin
              reg228 <= $signed((~|$unsigned((((8'hbb) + reg224) ?
                  (reg211 ? wire103 : reg205) : {reg216}))));
              reg229 <= $unsigned(reg218);
              reg230 <= (reg217[(2'h3):(2'h2)] == reg207[(3'h6):(1'h1)]);
              reg231 <= $unsigned($signed(reg224));
            end
          if ($unsigned(reg229[(4'hf):(4'hf)]))
            begin
              reg232 <= $unsigned(((reg226 ^ $signed({reg219})) < $unsigned(wire199[(5'h12):(4'hc)])));
              reg233 <= $signed(reg211[(1'h0):(1'h0)]);
            end
          else
            begin
              reg232 <= reg214;
              reg233 <= $signed(reg204[(4'ha):(4'h8)]);
              reg234 <= ($unsigned($signed((reg230 > $unsigned(reg231)))) ?
                  ($signed((&(wire203 < reg205))) ^ $signed(reg214[(3'h5):(2'h2)])) : $unsigned($unsigned($unsigned((reg209 - reg213)))));
              reg235 <= (((wire220 != (~(+reg210))) ?
                  {$unsigned($signed(reg226))} : $unsigned($unsigned($unsigned(reg207)))) ^~ ((((&reg217) ?
                      {reg212, reg222} : reg217) ?
                  $signed((!(8'hbe))) : $unsigned(reg204[(4'h9):(4'h8)])) >>> reg227));
            end
        end
      else
        begin
          reg226 <= {{$unsigned(((reg208 ?
                      reg209 : (8'ha0)) | $signed((8'ha4)))),
                  reg217[(2'h2):(1'h1)]},
              $signed($signed($signed((wire121 ? wire199 : (8'hbf)))))};
        end
      reg236 <= $unsigned($unsigned(reg210));
    end
  assign wire237 = $unsigned($unsigned(reg233[(4'h8):(4'h8)]));
  assign wire238 = reg206[(4'he):(4'ha)];
  always
    @(posedge clk) begin
      reg239 <= ($unsigned(reg227) ?
          $signed(({(^reg234),
              wire220[(1'h1):(1'h1)]} & $unsigned((~^(8'ha4))))) : ({(^~(8'hb2)),
                  (~|{reg212})} ?
              wire220 : reg236));
      reg240 <= (!($signed($signed($unsigned(reg207))) <<< (~&(reg212 ?
          $signed(reg236) : {reg233, reg207}))));
      reg241 <= reg236;
    end
  assign wire242 = (+($unsigned((~$signed(reg208))) ?
                       (((reg212 - reg208) ?
                               (reg216 * reg236) : (wire199 == reg231)) ?
                           ($signed(reg232) ?
                               reg218[(3'h7):(3'h5)] : reg214[(3'h4):(1'h0)]) : {(~|reg226),
                               reg224[(2'h2):(1'h0)]}) : reg204));
  assign wire243 = (reg218 - reg241);
endmodule

module module24
#(parameter param98 = (({(^((8'hbd) ? (8'hbc) : (8'ha7))), (^(8'ha3))} != (({(8'hb5), (8'ha0)} >= ((8'hba) ? (7'h43) : (8'hab))) ^ (~&(8'hb1)))) ? (((((8'hac) ? (8'hac) : (8'hb7)) ? (~^(7'h43)) : ((8'ha2) ? (8'hb2) : (8'ha4))) ? ((-(8'hb2)) & (~&(8'ha8))) : (~|(&(8'h9c)))) & ((((8'hbd) ? (8'hb1) : (7'h43)) != (^~(8'h9e))) >>> ((~|(8'h9f)) ? ((7'h43) ? (8'hb2) : (8'hb6)) : ((8'ha6) >= (8'h9d))))) : ((-{((8'h9f) || (8'hbd)), (8'hb1)}) ? (((~|(8'ha8)) ? ((8'hb1) >> (8'hb1)) : ((8'hb6) ? (8'ha1) : (8'hb0))) ? {((8'hb3) ? (8'hb6) : (8'hab)), ((8'ha1) ? (8'haf) : (7'h41))} : (8'hbb)) : {({(8'hbd)} <= (|(8'haa)))})), 
parameter param99 = (param98 ? {param98, {(&((8'hbf) ~^ param98))}} : param98))
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h1ad):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire26;
  input wire [(4'he):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire94;
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire30,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire94,
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
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  assign wire30 = (~^(8'hb7));
  always
    @(posedge clk) begin
      if ($signed((((|wire27) ?
          ($signed(wire28) | $unsigned(wire29)) : ((wire26 * wire25) ?
              (wire29 ? wire26 : (8'ha2)) : (&wire29))) ^~ (wire30 ?
          wire27 : (8'ha3)))))
        begin
          reg31 <= (wire28 ? (^~(&$unsigned(wire28[(4'h9):(1'h1)]))) : wire28);
          reg32 <= ((^~{wire26, $unsigned((+wire26))}) ?
              $unsigned((^~(~$signed(wire27)))) : reg31);
          reg33 <= $signed(wire30[(3'h7):(3'h4)]);
          if ($signed(wire27[(4'hd):(3'h4)]))
            begin
              reg34 <= ($unsigned(wire28) ? wire25 : reg32);
              reg35 <= ($signed(wire28) ^~ $unsigned((reg33 ?
                  ($signed(reg31) ?
                      (wire29 >> (7'h44)) : reg32) : ((reg33 > reg32) ?
                      $unsigned(reg33) : reg34[(3'h4):(1'h1)]))));
              reg36 <= (~^(wire28 & (^~((^~(8'hb0)) || reg31[(1'h0):(1'h0)]))));
              reg37 <= reg34[(4'he):(3'h4)];
              reg38 <= (reg37 * (&reg34[(1'h0):(1'h0)]));
            end
          else
            begin
              reg34 <= reg37;
              reg35 <= ((((wire25[(2'h3):(2'h3)] >>> (reg31 * reg35)) == $unsigned($unsigned(reg38))) ?
                  ((&{reg35}) ?
                      {(reg35 ?
                              wire26 : reg34)} : $unsigned((wire27 >>> wire25))) : (~&reg36)) <<< reg36);
              reg36 <= ($unsigned($signed((~^wire26))) == ({(^{(8'hb4)})} << reg34[(4'hc):(4'ha)]));
              reg37 <= $signed(reg33);
            end
          reg39 <= {((^wire27[(4'h9):(2'h3)]) > reg34),
              (((!(reg37 ^ wire30)) ?
                  $signed(((8'ha6) || reg33)) : ($signed(reg33) ~^ reg31)) * ({wire25,
                      $unsigned((8'ha5))} ?
                  $signed((wire28 <<< (8'ha9))) : $signed(reg36[(1'h0):(1'h0)])))};
        end
      else
        begin
          reg31 <= (|$unsigned(wire29[(2'h3):(1'h1)]));
          reg32 <= reg34;
          reg33 <= {((&(^(reg34 < reg37))) < (^~$signed($signed(reg37))))};
        end
      reg40 <= {reg31};
      if ($unsigned((reg39 != (-($signed(reg34) >> {reg31})))))
        begin
          if ((~|reg32))
            begin
              reg41 <= (reg34 ?
                  ((|(!((8'ha8) ? reg33 : (8'hb9)))) ?
                      (wire26[(2'h3):(1'h0)] ?
                          wire29[(2'h3):(2'h3)] : wire25[(3'h6):(2'h3)]) : ($unsigned(reg40) == ((^wire25) < $signed((8'hbf))))) : {(~^reg31[(1'h0):(1'h0)])});
              reg42 <= $unsigned($unsigned((wire26[(4'hd):(2'h2)] + wire28)));
              reg43 <= $signed($unsigned($signed({wire28[(4'hc):(1'h1)],
                  reg41[(1'h1):(1'h1)]})));
              reg44 <= (wire25[(3'h7):(1'h0)] ?
                  (!reg42) : (wire30[(3'h7):(1'h0)] | (^~$unsigned((reg35 <= wire30)))));
              reg45 <= (($signed(wire27) ~^ {{{(8'hb2)}}}) * (($unsigned($unsigned(reg39)) ?
                      (!((8'ha3) ? wire25 : wire25)) : wire30) ?
                  (wire25[(1'h0):(1'h0)] ?
                      {((8'hbc) == reg41)} : wire27) : $unsigned({$signed(reg33)})));
            end
          else
            begin
              reg41 <= {reg41[(2'h2):(1'h1)], reg44};
              reg42 <= ((!(~((-wire27) ?
                  $signed((8'ha6)) : (wire28 - reg31)))) * reg39[(4'he):(4'hc)]);
              reg43 <= (($signed({(reg35 ? (8'hbc) : reg36),
                          reg32[(4'he):(3'h5)]}) ?
                      reg40[(3'h6):(3'h6)] : (~(7'h42))) ?
                  $signed(reg33) : {(reg38[(3'h7):(3'h4)] ?
                          reg43[(3'h4):(3'h4)] : wire25[(1'h0):(1'h0)])});
            end
          reg46 <= $signed($signed($signed(((reg38 ? wire26 : reg34) ?
              ((7'h43) ^~ (7'h40)) : wire26))));
          reg47 <= ($signed((reg34 ?
                  $signed($signed((8'had))) : $unsigned($unsigned(reg43)))) ?
              {(|reg34),
                  $unsigned({reg41, reg39})} : (({$signed(reg34)} <= ((reg42 ?
                      reg45 : wire28) & (reg36 >>> wire29))) ?
                  reg38[(1'h1):(1'h1)] : {({(8'ha4), wire29} ?
                          $signed((8'hb3)) : {wire29})}));
          reg48 <= $unsigned((~|(!$signed((8'haa)))));
        end
      else
        begin
          reg41 <= (^wire27);
          reg42 <= $signed($signed({$unsigned((&wire28))}));
        end
    end
  assign wire49 = $signed((-reg42[(3'h7):(1'h0)]));
  assign wire50 = $signed($signed((-(~^{reg40, reg39}))));
  assign wire51 = ((wire30[(1'h1):(1'h0)] ?
                      ((wire50[(4'hf):(3'h5)] == (reg39 >>> reg44)) ?
                          $signed((reg45 ^ wire27)) : ($signed(wire28) ^ reg47[(5'h10):(2'h3)])) : ($signed((7'h42)) > {(reg42 ?
                              wire30 : reg47),
                          reg38})) || reg48);
  assign wire52 = reg44[(4'hd):(3'h4)];
  assign wire53 = ($signed(reg42[(1'h0):(1'h0)]) ?
                      reg41[(3'h6):(2'h3)] : (($unsigned((reg33 ?
                                  reg45 : wire27)) ?
                              {(8'ha8), (|(7'h41))} : reg34) ?
                          wire27[(4'hb):(1'h1)] : reg41));
  assign wire54 = wire30;
  assign wire55 = ((reg45[(4'hc):(4'h8)] ?
                          reg36 : $unsigned($signed($unsigned((8'hb8))))) ?
                      $signed((wire30[(3'h6):(2'h3)] & $signed($unsigned(reg35)))) : (reg40[(4'h9):(4'h9)] | (wire52[(2'h3):(1'h0)] == (^~$signed(reg31)))));
  assign wire56 = reg43[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg57 <= $signed($signed(reg48[(4'h9):(2'h2)]));
      reg58 <= ((wire52 > ((wire29 ^~ reg45) ?
          ((wire55 != wire27) > wire28) : {{wire26},
              wire28})) >= (reg41[(1'h1):(1'h0)] ~^ reg39));
      reg59 <= ($signed(({(~^(8'hb4)),
          (reg48 != reg45)} || reg44[(2'h2):(1'h0)])) << wire49[(3'h5):(2'h2)]);
      reg60 <= $signed(((reg58[(5'h10):(4'hd)] ?
          reg43[(2'h2):(1'h1)] : $unsigned(reg45[(4'hc):(3'h7)])) << $unsigned((reg36[(2'h2):(1'h1)] ?
          reg31[(2'h2):(2'h2)] : wire49[(2'h3):(2'h3)]))));
      reg61 <= $signed(reg33[(2'h3):(2'h3)]);
    end
  assign wire62 = ($signed(wire53) > (8'ha1));
  assign wire63 = (|$signed(reg32[(5'h13):(5'h11)]));
  assign wire64 = $unsigned($signed(wire30));
  assign wire65 = ($signed(wire54) * ((($signed((7'h41)) ^~ (+reg39)) ~^ reg48) ?
                      (8'ha8) : $signed((reg47[(4'ha):(3'h4)] != {wire51}))));
  assign wire66 = $signed((reg32 ? $unsigned({$signed(reg48)}) : reg48));
  module67 #() modinst95 (wire94, clk, wire62, reg42, reg59, reg32);
  assign wire96 = $unsigned((!reg33[(2'h2):(2'h2)]));
  assign wire97 = ((reg59[(4'h9):(4'h9)] + (reg39[(3'h5):(1'h0)] - (~|(reg40 ?
                          reg39 : reg41)))) ?
                      $signed((reg45 <= wire25)) : wire54);
endmodule

module module67
#(parameter param92 = ((((!((8'hbb) == (8'hab))) ? ((8'h9f) ? {(8'ha9), (8'hb3)} : ((8'hbc) ? (8'hb8) : (7'h43))) : {((8'ha7) ? (8'haf) : (8'hb9))}) ? (((8'hb7) <<< (|(7'h41))) ^~ (~|(~^(8'hb7)))) : {(~^((8'hb8) ? (8'ha5) : (8'hb1))), (((8'hbc) < (8'ha9)) ? (!(8'hbb)) : {(8'hbf)})}) ~^ ((|(((8'ha6) ? (7'h40) : (8'ha7)) + ((8'ha9) ? (7'h43) : (8'ha7)))) ? ({{(8'ha1), (8'hbd)}, ((8'hab) ? (7'h41) : (8'hbb))} != (&((8'haa) ? (8'hba) : (8'hb6)))) : {(((7'h44) <= (8'hb4)) ? ((8'had) ? (8'hbc) : (8'hbe)) : (-(8'hb4))), (((8'ha7) - (8'hb3)) | ((8'ha2) != (8'ha3)))})), 
parameter param93 = (~(^((+{(8'ha0), (8'hb3)}) ? (!((7'h43) * param92)) : param92))))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire71;
  input wire [(5'h15):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(4'ha):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(5'h10):(1'h0)] reg79 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire72 = $unsigned(((^~((&wire68) ^ $unsigned(wire71))) >>> wire71[(1'h1):(1'h0)]));
  assign wire73 = wire68;
  assign wire74 = (+{$signed(((|wire68) || $unsigned(wire70)))});
  assign wire75 = ($signed((+{(^wire71), {(8'hbc)}})) & ((wire68 ?
                      wire68 : wire72) || {(+(~^wire74))}));
  assign wire76 = wire69[(4'h8):(3'h5)];
  assign wire77 = (wire70 ? wire70[(1'h0):(1'h0)] : $signed(wire68));
  assign wire78 = wire69;
  always
    @(posedge clk) begin
      if ((|{$signed(($unsigned(wire77) | (~|wire69))), (7'h42)}))
        begin
          if ($signed({$unsigned((&{wire77})),
              ((-wire74) ?
                  wire68[(1'h0):(1'h0)] : ({wire77, wire77} << (~|wire71)))}))
            begin
              reg79 <= (~&(8'hb9));
              reg80 <= wire72;
              reg81 <= ((^({((8'hb2) ? wire76 : (7'h41))} ?
                      $unsigned((!reg79)) : $unsigned(wire78[(5'h12):(4'h8)]))) ?
                  wire68[(3'h7):(1'h1)] : ((((~|reg79) ?
                      (wire78 | wire77) : {wire72}) || $signed((wire73 ?
                      wire69 : wire76))) <<< (($signed((8'hb8)) >>> reg79[(4'he):(3'h6)]) * wire77)));
            end
          else
            begin
              reg79 <= {$signed((~&$unsigned((8'h9d)))),
                  (~&$unsigned(wire73[(2'h3):(2'h3)]))};
              reg80 <= (~&wire74);
              reg81 <= (~^$unsigned(wire76[(3'h7):(2'h3)]));
            end
          reg82 <= wire75[(3'h5):(2'h2)];
          reg83 <= (reg79 ?
              wire76 : {(wire71[(1'h1):(1'h1)] ?
                      ({(8'h9e)} <= (+wire70)) : $signed(wire70[(5'h11):(3'h4)])),
                  wire78});
          reg84 <= reg82;
        end
      else
        begin
          if ({$unsigned(((((8'hb0) ? wire69 : (8'ha3)) <<< (reg84 ?
                  (8'h9c) : (8'ha9))) | $signed({reg83}))),
              ($signed(({reg79} ?
                  $signed(wire72) : (wire75 ?
                      wire69 : wire71))) >>> reg83[(1'h0):(1'h0)])})
            begin
              reg79 <= reg83[(1'h0):(1'h0)];
              reg80 <= (reg79[(4'he):(4'hd)] < (+wire68));
              reg81 <= wire71[(3'h4):(2'h3)];
              reg82 <= wire75[(1'h0):(1'h0)];
              reg83 <= (7'h40);
            end
          else
            begin
              reg79 <= (((wire68 < ((reg79 ? reg83 : wire74) + (wire68 ?
                  wire78 : wire73))) | wire78[(2'h2):(2'h2)]) << $unsigned({(^~(&reg82)),
                  $signed($unsigned(wire76))}));
              reg80 <= (wire78 ^~ reg80);
              reg81 <= ($signed($signed(((~&reg81) ?
                  (wire68 - (8'haa)) : $unsigned(wire75)))) < reg83);
              reg82 <= $signed(((^((&wire69) ?
                      wire77[(3'h6):(1'h1)] : (wire74 & wire71))) ?
                  (wire74[(1'h1):(1'h1)] << wire76) : wire68));
            end
          reg84 <= {(~&(reg83 <= $unsigned($signed(wire73)))),
              $unsigned($unsigned($unsigned((reg79 || (8'hbd)))))};
        end
    end
  assign wire85 = (~|(&$unsigned($signed({(8'hbe)}))));
  assign wire86 = wire71[(1'h1):(1'h0)];
  assign wire87 = $unsigned($unsigned($unsigned($signed(((8'hb1) ?
                      wire71 : wire78)))));
  assign wire88 = $unsigned((($unsigned(reg83) >= $signed(((8'hb4) ?
                      (8'hbe) : wire85))) >> ($signed((8'hb1)) ?
                      wire77 : $signed((wire75 ? (8'hb7) : wire69)))));
  assign wire89 = ($unsigned($signed(wire87[(3'h4):(1'h0)])) ?
                      reg84[(4'h9):(1'h1)] : (^(wire88 & $unsigned((|wire68)))));
  assign wire90 = ($signed($signed($signed((wire89 >>> wire76)))) ?
                      reg82[(4'h8):(3'h5)] : {reg79});
  assign wire91 = ((($unsigned(reg82) ?
                          {(wire74 > wire90),
                              (~&wire76)} : {wire70[(4'hf):(4'hc)],
                              (^~wire75)}) ?
                      (|$unsigned(wire89[(4'hd):(4'ha)])) : wire85) ^ $unsigned(reg84[(2'h2):(1'h0)]));
endmodule

module module123
#(parameter param196 = (~^(8'haa)))
(y, clk, wire128, wire127, wire126, wire125, wire124);
  output wire [(32'h305):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire127;
  input wire signed [(3'h6):(1'h0)] wire126;
  input wire signed [(4'hd):(1'h0)] wire125;
  input wire [(2'h2):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire195;
  wire [(3'h6):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire179;
  wire signed [(2'h3):(1'h0)] wire178;
  wire [(4'hb):(1'h0)] wire177;
  wire [(5'h10):(1'h0)] wire176;
  wire [(4'ha):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(2'h2):(1'h0)] wire171;
  wire [(5'h10):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(4'he):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire signed [(4'h9):(1'h0)] wire129;
  reg [(4'hd):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(4'hc):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(4'he):(1'h0)] reg187 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(4'h8):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire156,
                 wire155,
                 wire154,
                 wire129,
                 reg193,
                 reg192,
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
                 reg180,
                 reg175,
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
                 (1'h0)};
  assign wire129 = $unsigned($unsigned($unsigned(((&wire127) ^ $unsigned(wire124)))));
  always
    @(posedge clk) begin
      if (($unsigned((-$signed($signed((8'ha1))))) ?
          wire124 : (^~{($unsigned((8'hbb)) && $signed(wire128)),
              $unsigned($unsigned(wire128))})))
        begin
          reg130 <= (wire126 ?
              (($unsigned(wire125) ?
                  ({wire129} ?
                      $signed(wire125) : $signed(wire128)) : ((wire126 ?
                          (8'hb5) : wire124) ?
                      (wire128 ? wire125 : wire124) : {wire125,
                          wire127})) <<< {wire127}) : ($signed(wire125) ?
                  wire128[(4'hc):(1'h1)] : wire127));
          reg131 <= $unsigned({(&(wire128[(3'h7):(1'h0)] ?
                  $unsigned(wire129) : $unsigned(wire128)))});
          reg132 <= $unsigned((wire124 | $unsigned(((|wire127) ?
              (wire126 ? wire128 : (8'hb2)) : $signed(wire127)))));
          reg133 <= $unsigned((-(((~&(8'hbb)) ?
              {wire129,
                  wire128} : reg131[(2'h3):(1'h1)]) <<< {(reg131 != wire126),
              (wire128 ? reg130 : wire127)})));
        end
      else
        begin
          reg130 <= (-((~^{$signed(wire128),
              ((8'ha1) ? reg130 : reg132)}) | ($signed($signed((8'hae))) ?
              ($signed(wire124) ?
                  (reg132 ~^ wire124) : wire129[(3'h5):(2'h2)]) : {(wire125 <= wire126)})));
        end
      reg134 <= reg133[(1'h1):(1'h1)];
      if ((8'ha7))
        begin
          reg135 <= wire126[(1'h1):(1'h0)];
          reg136 <= (reg135[(1'h1):(1'h0)] ^~ wire125);
          reg137 <= ($signed($signed(((wire128 ?
              reg136 : wire129) <= $unsigned(wire124)))) <<< $signed(wire127));
          reg138 <= ((8'ha9) ?
              $unsigned($unsigned(wire126)) : reg130[(4'hc):(3'h6)]);
        end
      else
        begin
          reg135 <= ($unsigned((reg135 - {(wire129 <= (7'h40)),
              (reg132 ?
                  wire126 : wire124)})) == (~|$unsigned(reg136[(3'h5):(3'h4)])));
          if (wire125[(3'h7):(2'h3)])
            begin
              reg136 <= $signed((!($signed(reg136[(4'hb):(1'h0)]) > reg130)));
              reg137 <= (reg133[(3'h6):(2'h3)] ?
                  (~|(((wire127 ?
                      reg131 : wire129) | $unsigned(reg132)) << ((wire124 ?
                      reg136 : reg135) ^ (wire125 > reg136)))) : $signed($signed((8'h9c))));
              reg138 <= reg134[(1'h1):(1'h0)];
            end
          else
            begin
              reg136 <= $unsigned({wire125[(3'h4):(3'h4)],
                  (!($signed(wire127) >= $unsigned((8'ha6))))});
            end
          reg139 <= ((&reg137) ?
              reg130[(3'h6):(1'h0)] : {reg137, $unsigned($signed(wire124))});
          reg140 <= ({$unsigned(($signed(wire127) ? (^reg134) : wire128))} ?
              reg131 : (((~^$unsigned(reg132)) != wire124[(1'h0):(1'h0)]) ~^ (reg131 << $unsigned((reg136 < (8'h9f))))));
          reg141 <= wire125;
        end
      reg142 <= (~^(wire126[(3'h4):(3'h4)] ?
          ((!((8'h9d) ? reg130 : wire125)) ?
              (~$unsigned(reg140)) : (7'h43)) : $signed((^$signed(reg137)))));
      reg143 <= (^((reg141 ? reg137[(2'h3):(2'h3)] : (~reg138)) ?
          $unsigned(((wire128 ? reg136 : reg131) ?
              reg130 : wire129)) : reg134));
    end
  always
    @(posedge clk) begin
      if (reg136[(3'h6):(2'h2)])
        begin
          reg144 <= wire125[(4'h9):(4'h8)];
          reg145 <= ((((+$unsigned((8'ha9))) >= reg143[(2'h2):(1'h0)]) || reg138[(2'h2):(1'h1)]) <<< $signed((reg136 ?
              $unsigned((reg136 + reg138)) : (wire128 ^~ reg138))));
          reg146 <= ((-((~^reg139[(4'hd):(4'hc)]) ?
              ($unsigned(wire129) ?
                  reg143 : {(8'hb4)}) : $signed($unsigned((8'hb4))))) <= (!wire125));
          reg147 <= $unsigned($signed($signed((reg136 ?
              $unsigned((7'h41)) : (reg133 ? reg135 : wire126)))));
          if (reg142[(2'h2):(1'h1)])
            begin
              reg148 <= $unsigned(($signed({(reg134 ? wire125 : wire126)}) ?
                  ($signed({(8'hab)}) ~^ (-$signed(reg138))) : ((reg141[(4'ha):(3'h7)] ?
                          (wire129 ? reg132 : reg147) : {(8'ha8)}) ?
                      reg132 : ({reg144} ^~ (reg131 ? reg138 : reg134)))));
            end
          else
            begin
              reg148 <= reg132;
              reg149 <= $unsigned((^($unsigned({reg137}) ?
                  ($signed((8'h9c)) ?
                      reg147 : reg139) : $unsigned($signed(reg142)))));
              reg150 <= reg132[(3'h4):(3'h4)];
              reg151 <= $signed((8'ha1));
              reg152 <= $unsigned($unsigned(reg148));
            end
        end
      else
        begin
          if ($signed($unsigned((reg140[(3'h4):(2'h2)] ?
              ($signed(reg136) ?
                  (&(8'hbb)) : (8'had)) : $signed($unsigned((8'ha1)))))))
            begin
              reg144 <= ($signed((^~(reg151 ? {reg144} : reg133))) ?
                  reg144[(5'h10):(4'hb)] : ((reg141[(5'h13):(4'he)] ?
                      (8'had) : reg137) >= $unsigned($unsigned((!reg145)))));
              reg145 <= $signed(((($signed(reg131) ?
                  (reg132 || (8'ha8)) : reg144) && reg141) != $unsigned(($unsigned(reg136) ?
                  (!reg137) : {(7'h43)}))));
            end
          else
            begin
              reg144 <= (~|(~|reg132[(1'h1):(1'h0)]));
              reg145 <= $unsigned(reg143[(2'h3):(2'h2)]);
              reg146 <= (!($signed({(^reg136)}) || (reg134 | $unsigned(reg150))));
              reg147 <= {(reg138[(1'h1):(1'h0)] <= reg145[(4'ha):(1'h0)]),
                  (($unsigned(reg132[(3'h5):(2'h2)]) + (8'hac)) ?
                      (-$unsigned((reg151 ?
                          reg136 : reg140))) : reg141[(4'h8):(2'h3)])};
              reg148 <= (8'hb5);
            end
          reg149 <= (8'ha1);
          if ($signed((&(({reg152} ? $signed(reg139) : $signed(reg149)) ?
              $unsigned((reg145 ^ reg134)) : reg146))))
            begin
              reg150 <= $signed((^~{((wire129 ? reg134 : reg144) ?
                      (|wire125) : (wire124 != (8'h9c)))}));
              reg151 <= (($signed((8'ha3)) - $signed(($signed(reg150) <= $unsigned((8'haa))))) || {(wire127[(4'h9):(2'h3)] + {$unsigned(reg150),
                      $unsigned((8'hbb))})});
              reg152 <= reg130[(4'h9):(4'h9)];
            end
          else
            begin
              reg150 <= $unsigned(($signed(((reg150 ?
                      (8'ha7) : reg143) < reg150)) ?
                  $unsigned(($signed(reg146) ^ reg133)) : $unsigned($signed({reg144}))));
              reg151 <= reg142[(3'h6):(3'h6)];
            end
          reg153 <= $unsigned(reg140[(3'h7):(1'h0)]);
        end
    end
  assign wire154 = (+{$signed($signed({reg146})), reg153[(1'h0):(1'h0)]});
  assign wire155 = {((~|(+{reg148, reg152})) ?
                           $signed(reg150) : (!{(reg151 * (8'hbe)),
                               reg137[(2'h3):(2'h2)]}))};
  assign wire156 = $signed((^~wire126[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if ((reg135 || reg152[(3'h5):(3'h4)]))
        begin
          if ({((|(~^(~^(8'hac)))) << {$signed((reg134 ? reg137 : reg144)),
                  reg135[(4'he):(4'hd)]})})
            begin
              reg157 <= (~$unsigned((^~$unsigned(((8'ha6) & reg135)))));
              reg158 <= reg145;
            end
          else
            begin
              reg157 <= $unsigned($signed((reg131[(4'h8):(3'h5)] > (!reg130[(4'ha):(3'h6)]))));
              reg158 <= reg140[(3'h5):(3'h5)];
            end
          if (((reg157[(1'h1):(1'h0)] >>> $signed(reg145[(1'h0):(1'h0)])) ?
              $signed({($signed(reg142) == (wire154 ?
                      reg137 : reg148))}) : (($unsigned((+reg140)) ?
                  $unsigned({(8'hbf)}) : wire124) << (8'hbb))))
            begin
              reg159 <= ((8'ha2) ?
                  (8'haa) : ({($unsigned(reg145) && (reg137 ?
                          reg135 : (8'ha0)))} || {reg157[(1'h0):(1'h0)]}));
              reg160 <= reg131;
              reg161 <= $signed($signed(($unsigned($signed(reg157)) ?
                  reg133 : wire126)));
            end
          else
            begin
              reg159 <= {($unsigned($signed($unsigned(reg134))) || (!($signed(wire126) <<< wire156))),
                  $unsigned(wire155[(3'h6):(3'h4)])};
              reg160 <= ($signed($signed($signed((reg147 ?
                  wire129 : wire125)))) | reg153[(3'h5):(3'h5)]);
            end
          if ((((-reg134[(2'h3):(1'h0)]) ?
                  $signed($signed($signed(reg140))) : (reg135 ?
                      ($signed(reg144) ?
                          (reg137 ? (8'ha9) : wire127) : {reg153,
                              reg139}) : reg139[(3'h7):(3'h5)])) ?
              (($unsigned((reg141 ? (8'ha1) : wire125)) <= ((8'ha9) ?
                      (^(8'ha4)) : (reg161 ? wire125 : reg131))) ?
                  ($unsigned($signed(wire156)) | reg161) : $unsigned(reg134[(1'h1):(1'h0)])) : $unsigned((&((wire124 ?
                  reg161 : reg157) >= reg132[(1'h0):(1'h0)])))))
            begin
              reg162 <= ({reg131,
                  (reg134 != $signed((reg131 ? reg136 : reg133)))} << wire126);
            end
          else
            begin
              reg162 <= (reg153[(4'h9):(3'h5)] > $signed((reg140 - (wire154[(2'h2):(2'h2)] >> (reg136 ?
                  wire155 : reg145)))));
              reg163 <= (($signed(reg158) <= wire129[(2'h3):(1'h1)]) <= (|reg157[(2'h3):(1'h0)]));
              reg164 <= reg146[(1'h0):(1'h0)];
              reg165 <= ($signed(($unsigned((8'h9e)) && (~&reg164))) + $signed((~^reg134)));
            end
          reg166 <= wire156[(5'h10):(5'h10)];
        end
      else
        begin
          reg157 <= ((($unsigned((wire129 < (8'hae))) ?
                      $signed((reg160 ?
                          reg166 : reg150)) : $unsigned(reg162[(4'h9):(3'h4)])) ?
                  (&(|(reg134 == reg143))) : $unsigned((7'h41))) ?
              (wire129[(2'h3):(2'h2)] <<< ((((8'hb1) ? (8'hb6) : wire129) ?
                      reg161[(2'h3):(1'h1)] : (~reg139)) ?
                  reg132[(2'h2):(1'h0)] : $unsigned(((8'hbc) >>> reg136)))) : reg165);
          reg158 <= reg153[(3'h5):(2'h2)];
        end
      reg167 <= ((($unsigned(reg159[(4'h9):(2'h2)]) ?
          (|(reg136 >= reg130)) : (reg139 ?
              reg130 : (-wire126))) * (7'h42)) ^~ wire127[(4'hb):(1'h1)]);
      reg168 <= {$unsigned($unsigned(((~&wire156) ?
              $signed(reg136) : reg149[(3'h5):(3'h5)]))),
          wire156};
      reg169 <= $signed(($signed(((reg144 ? reg142 : reg131) >> reg162)) ?
          $signed((wire127 <<< reg168)) : (|{(-wire128)})));
    end
  assign wire170 = wire129[(3'h6):(2'h2)];
  assign wire171 = (($unsigned((^(reg140 ?
                       (8'hbe) : reg143))) == {$signed(reg166)}) || (&$unsigned($unsigned((reg141 <<< reg130)))));
  assign wire172 = reg161[(1'h1):(1'h1)];
  assign wire173 = ($signed($unsigned($unsigned(reg149[(1'h0):(1'h0)]))) >>> reg153[(3'h6):(3'h5)]);
  assign wire174 = $unsigned(reg141);
  always
    @(posedge clk) begin
      reg175 <= reg142;
    end
  assign wire176 = (~^reg143[(1'h0):(1'h0)]);
  assign wire177 = $signed(wire125);
  assign wire178 = $signed(wire129);
  assign wire179 = wire154;
  always
    @(posedge clk) begin
      if ((reg142 ? wire127[(2'h2):(1'h1)] : $signed(reg153)))
        begin
          reg180 <= wire126[(2'h2):(1'h0)];
          reg181 <= reg168[(3'h5):(1'h0)];
          reg182 <= $signed(reg164[(2'h2):(1'h0)]);
          reg183 <= (&(($unsigned({reg164,
              reg161}) * reg162[(4'hd):(3'h6)]) + reg180));
          reg184 <= reg180;
        end
      else
        begin
          reg180 <= $signed($unsigned(reg161[(4'h9):(3'h5)]));
          if ($unsigned({reg140[(3'h5):(2'h2)]}))
            begin
              reg181 <= (~^({(7'h40),
                  (^~(reg140 < reg153))} <= (^$unsigned(reg169[(1'h1):(1'h0)]))));
              reg182 <= $signed(($unsigned({(reg148 * reg181),
                  $signed(wire174)}) <= (^~(((8'hb6) | (8'hb7)) <= $unsigned(reg165)))));
              reg183 <= (^((wire154[(1'h1):(1'h0)] >= wire125) - $unsigned(((reg141 < reg149) ^ (8'haf)))));
              reg184 <= $signed((reg140[(2'h3):(1'h0)] ?
                  {(((8'ha6) << (7'h44)) ?
                          $unsigned(reg145) : {reg148, reg144}),
                      reg130} : $unsigned(wire154[(3'h6):(1'h1)])));
              reg185 <= $signed(((8'hbc) << reg181[(3'h6):(2'h2)]));
            end
          else
            begin
              reg181 <= (reg152[(4'ha):(4'ha)] + (8'hb1));
              reg182 <= reg142[(1'h1):(1'h1)];
            end
          reg186 <= ($signed($signed({$signed((8'hb3)),
              wire176[(4'hf):(4'h9)]})) <= reg135[(1'h1):(1'h0)]);
          reg187 <= (~|reg130[(2'h2):(2'h2)]);
        end
      if ({reg148})
        begin
          reg188 <= $unsigned((-(~wire124[(2'h2):(2'h2)])));
          reg189 <= $unsigned(reg161[(5'h10):(4'he)]);
          reg190 <= (reg141 ?
              (^~reg140) : (~^(reg159 ?
                  $signed((!reg167)) : (!(reg148 != reg188)))));
          reg191 <= wire128;
        end
      else
        begin
          reg188 <= reg135[(4'h8):(1'h0)];
        end
      reg192 <= ((wire127[(2'h2):(2'h2)] ?
              (~^$signed(((8'hb6) ?
                  reg143 : reg180))) : $unsigned(((wire126 >> reg141) ?
                  reg158[(4'hd):(1'h1)] : wire156[(4'he):(2'h2)]))) ?
          wire176 : (~^$unsigned($signed({reg158, reg165}))));
      reg193 <= wire127[(4'hb):(2'h2)];
    end
  assign wire194 = ($unsigned(reg139) + {(wire128[(4'he):(1'h1)] ?
                           $unsigned((reg191 ?
                               reg161 : reg152)) : ($unsigned((8'hb3)) > wire179[(3'h4):(1'h1)]))});
  assign wire195 = reg153[(1'h0):(1'h0)];
endmodule

module module107
#(parameter param120 = (&(+(&((~&(8'hb6)) ? ((7'h44) ? (8'hac) : (7'h40)) : ((8'ha5) + (8'had)))))))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire112;
  input wire [(2'h2):(1'h0)] wire111;
  input wire [(3'h5):(1'h0)] wire110;
  input wire signed [(5'h14):(1'h0)] wire109;
  input wire signed [(5'h14):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  assign y = {wire119,
                 wire115,
                 wire114,
                 wire113,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire113 = (wire109 ?
                       (wire111[(2'h2):(1'h0)] && ({(|wire111)} << {$signed(wire109)})) : $unsigned(wire108));
  assign wire114 = ($signed(wire112[(3'h4):(3'h4)]) || wire109);
  assign wire115 = wire113[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg116 <= ((wire108 ^~ wire111) >>> {$signed({wire110, wire109}),
          ((wire109[(4'hc):(4'hc)] <= wire114) ^ ((wire112 < wire111) << (wire113 != (8'ha8))))});
      reg117 <= wire113;
      reg118 <= wire108[(4'hf):(4'hc)];
    end
  assign wire119 = reg117[(3'h7):(3'h4)];
endmodule
