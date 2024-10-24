module top
#(parameter param308 = ((8'ha6) ? (({(!(8'haa)), (|(8'ha9))} ? {((8'hbe) ? (8'hb0) : (8'hbc))} : (~&{(8'hb0)})) ^ {(((8'hb2) * (8'hb3)) ? ((8'haa) ? (8'ha3) : (8'hb3)) : (^(8'h9d)))}) : (~^((((8'hb3) ? (8'hab) : (8'hba)) || ((7'h44) ? (8'hb2) : (8'haa))) ? (((8'ha0) == (8'h9d)) ? (~|(8'ha5)) : ((8'haa) > (8'h9f))) : {((8'h9e) << (8'ha5))}))), 
parameter param309 = param308)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire306;
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire5,
                 wire21,
                 wire28,
                 wire29,
                 wire306,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire5 = ($signed((~wire3[(4'hb):(1'h1)])) - wire3);
  module6 #() modinst22 (.y(wire21), .wire8(wire1), .clk(clk), .wire9(wire3), .wire7(wire4), .wire10(wire0));
  always
    @(posedge clk) begin
      reg23 <= (((~^((^~wire5) != (wire2 == wire5))) ?
          {((wire1 ? wire2 : wire2) ?
                  $unsigned(wire2) : wire21[(2'h2):(1'h0)])} : ({(~|wire5)} ?
              (&wire5) : wire0[(3'h5):(1'h1)])) - wire1);
      reg24 <= wire1[(2'h3):(1'h1)];
      reg25 <= ((^~{wire21[(2'h3):(2'h2)]}) ?
          wire21 : {(^~{wire21[(2'h2):(1'h1)]}), reg24});
      reg26 <= ($signed(reg25) <<< $signed({wire1[(1'h1):(1'h0)]}));
      reg27 <= $signed($signed($signed({((8'hbf) ? (8'hb3) : wire21),
          $unsigned(wire2)})));
    end
  assign wire28 = (+($unsigned({reg26[(4'h8):(3'h6)], reg23[(3'h6):(3'h6)]}) ?
                      (wire0 == reg25) : wire5[(4'hc):(1'h1)]));
  assign wire29 = ((~^$signed(wire3)) ?
                      {$signed($unsigned(reg27)),
                          wire2} : $unsigned($signed(reg26)));
  module30 #() modinst307 (wire306, clk, wire29, reg25, wire1, wire2, reg23);
endmodule

module module30
#(parameter param305 = (^(({((8'ha4) + (8'ha9))} && {((8'hb8) ? (8'hb1) : (8'had))}) + ((~(~|(8'had))) || ({(8'ha0)} ? ((8'hb5) ? (8'hbe) : (8'ha4)) : (8'h9e))))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h1e7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(2'h3):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire304;
  wire [(4'h8):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire151;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire155;
  wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire229;
  wire [(5'h12):(1'h0)] wire244;
  wire [(2'h3):(1'h0)] wire299;
  wire [(4'ha):(1'h0)] wire301;
  wire [(4'ha):(1'h0)] wire302;
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg232 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg233 = (1'h0);
  reg [(4'hf):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg235 = (1'h0);
  reg [(3'h6):(1'h0)] reg236 = (1'h0);
  reg [(4'h9):(1'h0)] reg237 = (1'h0);
  reg [(5'h13):(1'h0)] reg238 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg239 = (1'h0);
  reg [(2'h2):(1'h0)] reg240 = (1'h0);
  reg [(5'h12):(1'h0)] reg241 = (1'h0);
  reg [(4'hf):(1'h0)] reg242 = (1'h0);
  reg signed [(4'he):(1'h0)] reg243 = (1'h0);
  assign y = {wire304,
                 wire72,
                 wire74,
                 wire140,
                 wire142,
                 wire143,
                 wire144,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire155,
                 wire156,
                 wire190,
                 wire229,
                 wire244,
                 wire299,
                 wire301,
                 wire302,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 reg239,
                 reg240,
                 reg241,
                 reg242,
                 reg243,
                 (1'h0)};
  module36 #() modinst73 (.y(wire72), .wire37(wire35), .wire38(wire32), .wire40(wire31), .clk(clk), .wire39(wire34), .wire41(wire33));
  assign wire74 = $signed(wire35);
  module75 #() modinst141 (.wire78(wire34), .wire79(wire35), .y(wire140), .wire76(wire33), .clk(clk), .wire77(wire32));
  assign wire142 = wire140;
  assign wire143 = $unsigned($signed(wire33));
  assign wire144 = $unsigned((((wire142[(2'h3):(2'h2)] >= (wire74 << (8'hba))) ?
                           ((wire143 ?
                               wire33 : wire140) > wire74[(3'h7):(3'h6)]) : (((8'hb4) >= wire34) > $unsigned(wire72))) ?
                       $unsigned($unsigned((wire35 && wire72))) : (wire35 ?
                           $signed((8'ha4)) : wire34)));
  always
    @(posedge clk) begin
      reg145 <= (wire32 ?
          (!{(wire142[(3'h7):(3'h5)] | $unsigned((8'hbc)))}) : $signed(wire142[(3'h5):(2'h2)]));
      if ((((wire72 ~^ (|(wire35 ? (8'ha3) : wire34))) ?
          ($signed((~wire142)) ?
              $unsigned(wire143) : wire72) : $signed($unsigned((wire143 ~^ (7'h44))))) <= wire143[(4'hb):(2'h2)]))
        begin
          reg146 <= $unsigned($unsigned($signed($signed({(8'hb7)}))));
          reg147 <= ((8'h9f) > $signed({wire74[(3'h5):(1'h0)]}));
        end
      else
        begin
          reg146 <= $signed((wire72 & $signed((wire34[(1'h1):(1'h0)] || $unsigned(wire72)))));
        end
      reg148 <= (7'h43);
      reg149 <= $unsigned(wire32);
      reg150 <= $unsigned(($unsigned($signed((~|wire72))) ?
          $unsigned((reg149[(2'h2):(1'h1)] != wire35[(2'h2):(2'h2)])) : $unsigned((~&(wire32 < wire34)))));
    end
  assign wire151 = wire35[(4'hc):(4'hb)];
  assign wire152 = (&wire143);
  assign wire153 = ({{$signed($signed(wire32)), (7'h40)}} & wire151);
  assign wire154 = wire35[(3'h6):(2'h3)];
  assign wire155 = $signed((-((wire72[(3'h5):(3'h5)] ? (~|(8'hb0)) : wire35) ?
                       (8'h9d) : (8'hbb))));
  assign wire156 = wire34;
  module157 #() modinst191 (.clk(clk), .wire158(reg146), .wire159(wire156), .wire161(wire144), .wire160(reg147), .y(wire190));
  module192 #() modinst230 (wire229, clk, reg145, reg147, wire151, wire153);
  always
    @(posedge clk) begin
      reg231 <= wire140[(2'h3):(1'h1)];
      if (wire152[(4'h9):(3'h7)])
        begin
          if ($unsigned({({(~reg149),
                  wire154[(5'h13):(4'h9)]} ~^ ((reg149 >>> wire140) < wire156[(2'h2):(1'h0)])),
              {reg150[(1'h0):(1'h0)], {$signed(wire31), wire153}}}))
            begin
              reg232 <= $unsigned((^{reg231[(1'h1):(1'h0)]}));
              reg233 <= (((reg147[(1'h0):(1'h0)] ?
                      $unsigned((reg147 ?
                          (8'ha3) : wire33)) : $signed((~&wire31))) ?
                  (~^(!(wire143 ?
                      reg145 : wire34))) : ($unsigned((^~wire72)) || $unsigned({(8'hbb),
                      (8'hb8)}))) >= $unsigned(reg232[(5'h13):(1'h1)]));
              reg234 <= {(^~((|$unsigned(reg232)) ?
                      wire229[(4'h9):(2'h2)] : ((!wire152) ?
                          (wire144 ?
                              wire142 : wire144) : wire156[(2'h2):(1'h0)])))};
              reg235 <= wire32;
            end
          else
            begin
              reg232 <= $unsigned((^~$unsigned(wire31)));
              reg233 <= (~|$signed({($signed(wire72) >= wire35[(1'h0):(1'h0)])}));
              reg234 <= $signed($signed($unsigned($unsigned($signed(reg149)))));
              reg235 <= wire155;
              reg236 <= $unsigned(($unsigned(((^~reg150) ?
                  reg150[(2'h2):(2'h2)] : $unsigned(reg145))) < reg234));
            end
          reg237 <= $unsigned((wire35 ?
              wire229[(4'h9):(4'h8)] : ({reg232[(4'he):(1'h0)],
                  (8'hb4)} ~^ ((wire142 ? reg145 : (8'h9e)) ?
                  (reg146 || reg149) : (reg149 < reg235)))));
          reg238 <= $unsigned(wire33[(5'h11):(3'h5)]);
        end
      else
        begin
          if (($unsigned(wire34[(2'h2):(1'h0)]) ?
              $unsigned($signed(reg148)) : wire34[(1'h0):(1'h0)]))
            begin
              reg232 <= $unsigned(wire72);
              reg233 <= reg237[(3'h4):(1'h0)];
              reg234 <= ($unsigned($signed((wire72[(3'h5):(3'h4)] ?
                      reg235 : (^wire142)))) ?
                  ((^reg231[(2'h2):(1'h0)]) ^ (reg148[(2'h2):(1'h1)] || ((+reg149) ?
                      (wire34 >>> reg150) : (wire142 ^~ reg148)))) : (({wire190,
                          (^wire229)} != ((8'haf) ?
                          (reg237 & reg150) : $unsigned(wire229))) ?
                      {$signed($unsigned((8'ha6)))} : (8'h9e)));
              reg235 <= $unsigned(reg235);
            end
          else
            begin
              reg232 <= wire140[(3'h5):(1'h0)];
              reg233 <= (8'ha1);
              reg234 <= {wire152[(4'ha):(4'h9)]};
              reg235 <= wire229;
              reg236 <= ((reg237 ?
                      reg231 : {wire156, $unsigned((wire74 | (8'hbe)))}) ?
                  ({reg235[(3'h4):(1'h1)],
                      (wire72 ?
                          $signed(reg238) : reg234)} << ((~$signed(reg150)) >> wire35[(3'h6):(3'h4)])) : (-$unsigned(reg150)));
            end
          if ($signed($signed((~&(^~(^wire31))))))
            begin
              reg237 <= $signed((8'hbc));
            end
          else
            begin
              reg237 <= (|($signed($unsigned((wire31 ? reg231 : wire155))) ?
                  wire142 : $signed({{wire142, wire33}, $signed((8'hb7))})));
            end
          reg238 <= $signed($unsigned((^~(~^$unsigned(wire140)))));
        end
      reg239 <= $signed((8'hb7));
      reg240 <= ({$unsigned($unsigned($signed(wire33)))} != ((reg236 ^~ reg232[(2'h3):(1'h1)]) ?
          (&$unsigned(((8'hbf) ^ wire143))) : reg145));
      if (((wire34 ?
          wire152[(1'h0):(1'h0)] : wire31[(4'hc):(2'h2)]) ~^ ($signed(wire32) <<< (~((wire32 + (7'h41)) ^ (wire190 * wire156))))))
        begin
          reg241 <= $signed(($signed(((reg232 && (8'hb6)) | {reg145})) ?
              reg235 : ({$signed(reg238), reg238[(4'hc):(3'h4)]} ?
                  wire154[(4'he):(1'h1)] : $unsigned({wire153}))));
          reg242 <= $signed($unsigned(wire152));
          reg243 <= ((({$unsigned(wire34)} * wire35[(4'hc):(4'hb)]) ?
              (8'hbb) : ((wire33[(4'hc):(1'h1)] >>> {wire156}) <= ((8'hab) ?
                  $unsigned(reg233) : (wire229 != wire72)))) && reg236);
        end
      else
        begin
          reg241 <= $signed((reg241 ~^ $signed($signed((wire151 ?
              wire33 : wire34)))));
          reg242 <= wire143;
        end
    end
  assign wire244 = {{{(~wire32[(4'h9):(3'h4)])}},
                       ($unsigned(wire142) ?
                           ((8'haf) ?
                               wire153 : (wire190[(1'h1):(1'h1)] && (wire34 ?
                                   wire156 : reg242))) : ($signed((wire74 ?
                                   (8'ha9) : reg150)) ?
                               wire154 : (wire32[(4'he):(3'h5)] < (~reg231))))};
  module245 #() modinst300 (.clk(clk), .wire248(reg238), .wire249(reg232), .wire247(wire32), .wire246(wire190), .y(wire299));
  assign wire301 = $unsigned((wire143[(3'h5):(3'h5)] != (8'ha8)));
  module75 #() modinst303 (wire302, clk, reg231, wire74, reg146, reg149);
  assign wire304 = wire190;
endmodule

module module6
#(parameter param20 = (|{((((8'h9e) ? (8'haf) : (8'hbe)) <= ((8'hb7) ? (8'ha1) : (8'ha7))) & (-((8'hb4) != (7'h41))))}))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire14,
                 wire13,
                 reg15,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed((wire8 >= wire7));
      reg12 <= wire7;
    end
  assign wire13 = $signed(({($signed(wire7) < {wire7,
                          (8'hae)})} + wire9[(3'h4):(1'h0)]));
  assign wire14 = $signed(($unsigned($signed((!reg12))) ?
                      ($unsigned($signed(wire7)) & (~&$unsigned((8'ha3)))) : $unsigned((~^{reg11}))));
  always
    @(posedge clk) begin
      reg15 <= wire10[(4'ha):(2'h3)];
    end
  assign wire16 = (8'hb5);
  assign wire17 = $unsigned((8'h9d));
  assign wire18 = (~({{(reg11 ? wire14 : (8'hb9)), ((8'h9f) ^~ wire8)},
                          wire14} ?
                      (^~((wire8 << wire10) >>> reg15[(4'ha):(3'h4)])) : {$unsigned((wire7 ?
                              reg15 : (8'hab))),
                          ({wire14} ~^ {wire14, wire10})}));
  assign wire19 = ($unsigned($unsigned($signed((!reg12)))) && $signed((wire17 ?
                      (8'haa) : wire17)));
endmodule

module module245
#(parameter param298 = (8'ha4))
(y, clk, wire249, wire248, wire247, wire246);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire249;
  input wire [(5'h12):(1'h0)] wire248;
  input wire [(3'h5):(1'h0)] wire247;
  input wire signed [(5'h15):(1'h0)] wire246;
  wire [(4'hb):(1'h0)] wire295;
  wire signed [(3'h4):(1'h0)] wire294;
  wire [(4'hb):(1'h0)] wire293;
  wire [(3'h4):(1'h0)] wire292;
  wire [(4'h8):(1'h0)] wire291;
  wire [(5'h14):(1'h0)] wire290;
  wire [(2'h2):(1'h0)] wire289;
  wire [(5'h13):(1'h0)] wire288;
  wire signed [(3'h4):(1'h0)] wire272;
  wire signed [(4'hc):(1'h0)] wire271;
  wire [(2'h3):(1'h0)] wire270;
  wire signed [(5'h15):(1'h0)] wire269;
  wire signed [(4'h9):(1'h0)] wire268;
  wire [(3'h5):(1'h0)] wire267;
  wire [(5'h11):(1'h0)] wire266;
  wire signed [(4'hd):(1'h0)] wire265;
  reg [(2'h3):(1'h0)] reg297 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg296 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg287 = (1'h0);
  reg signed [(4'he):(1'h0)] reg286 = (1'h0);
  reg [(2'h2):(1'h0)] reg285 = (1'h0);
  reg [(2'h3):(1'h0)] reg284 = (1'h0);
  reg [(5'h15):(1'h0)] reg283 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(4'hc):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg280 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg279 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg278 = (1'h0);
  reg [(4'hf):(1'h0)] reg277 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg276 = (1'h0);
  reg [(3'h6):(1'h0)] reg275 = (1'h0);
  reg signed [(4'he):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg264 = (1'h0);
  reg [(5'h10):(1'h0)] reg263 = (1'h0);
  reg [(3'h5):(1'h0)] reg262 = (1'h0);
  reg [(3'h6):(1'h0)] reg261 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg260 = (1'h0);
  reg [(2'h2):(1'h0)] reg259 = (1'h0);
  reg [(3'h5):(1'h0)] reg258 = (1'h0);
  reg [(5'h14):(1'h0)] reg257 = (1'h0);
  reg [(4'hd):(1'h0)] reg256 = (1'h0);
  reg [(4'hf):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg254 = (1'h0);
  reg [(4'ha):(1'h0)] reg253 = (1'h0);
  reg [(5'h11):(1'h0)] reg252 = (1'h0);
  reg [(4'hb):(1'h0)] reg251 = (1'h0);
  reg [(4'hc):(1'h0)] reg250 = (1'h0);
  assign y = {wire295,
                 wire294,
                 wire293,
                 wire292,
                 wire291,
                 wire290,
                 wire289,
                 wire288,
                 wire272,
                 wire271,
                 wire270,
                 wire269,
                 wire268,
                 wire267,
                 wire266,
                 wire265,
                 reg297,
                 reg296,
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
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((|(~&$signed(($unsigned((7'h40)) ?
          (8'ha6) : (wire247 ? wire249 : wire246))))))
        begin
          reg250 <= {wire248[(5'h10):(1'h0)], wire248};
          if ({reg250[(4'h9):(1'h1)], wire246})
            begin
              reg251 <= ({wire249,
                  wire246[(5'h13):(5'h11)]} <= wire248[(4'ha):(1'h1)]);
              reg252 <= wire247[(1'h1):(1'h1)];
            end
          else
            begin
              reg251 <= $signed(reg252[(4'h8):(3'h7)]);
              reg252 <= $signed(($signed({wire249, reg251}) ?
                  reg252[(4'hd):(4'hd)] : ($signed({reg250,
                      wire249}) < $signed(wire246))));
            end
          reg253 <= wire249[(4'hc):(3'h6)];
        end
      else
        begin
          if ($unsigned(reg250[(4'hb):(3'h4)]))
            begin
              reg250 <= wire246[(4'h9):(2'h3)];
              reg251 <= wire248[(3'h7):(2'h3)];
              reg252 <= (~^reg250[(4'h8):(1'h1)]);
              reg253 <= ({(^~(&(wire249 ? wire247 : wire246)))} ~^ (8'ha3));
              reg254 <= ((reg251[(1'h1):(1'h1)] ?
                  reg251 : reg251) <= reg250[(4'ha):(3'h6)]);
            end
          else
            begin
              reg250 <= wire247[(1'h0):(1'h0)];
              reg251 <= (~^reg252);
              reg252 <= wire247;
              reg253 <= wire249[(3'h6):(3'h4)];
              reg254 <= $signed((reg251[(1'h1):(1'h1)] != ($signed(reg250) - $signed({reg251}))));
            end
          reg255 <= (~(~&(wire249 ?
              {(8'h9d)} : ($signed(wire247) > $unsigned(reg251)))));
          reg256 <= $unsigned($signed(wire247[(3'h4):(3'h4)]));
          reg257 <= (^(reg250 || (((reg253 * reg250) == $signed(wire249)) ?
              (reg252[(3'h6):(1'h0)] >> reg252) : {(!reg255)})));
        end
      if ((&$signed({$signed($unsigned(reg250))})))
        begin
          reg258 <= ((reg250 ?
                  $signed($signed($unsigned(wire248))) : $unsigned(reg250)) ?
              (~&$unsigned(wire248[(3'h4):(1'h0)])) : $signed((($signed((8'ha1)) && reg257[(1'h1):(1'h1)]) * $unsigned(reg251[(1'h0):(1'h0)]))));
          reg259 <= (|(8'hbe));
        end
      else
        begin
          reg258 <= $unsigned(((~(((8'ha3) ? wire246 : reg254) ?
                  (8'hb2) : reg258)) ?
              reg255 : reg257[(5'h14):(4'hd)]));
        end
      if ({{(~^$unsigned((reg254 ^ reg250))), (8'hbf)},
          $unsigned(reg254[(2'h2):(1'h1)])})
        begin
          if ((reg254 ?
              (({(wire249 < reg258)} ?
                      (-(wire249 && (8'hb3))) : $unsigned((wire246 ?
                          reg252 : (8'hbb)))) ?
                  ({reg254} != wire246[(1'h0):(1'h0)]) : $unsigned($unsigned((8'ha5)))) : $signed((wire248[(1'h0):(1'h0)] ~^ (((8'ha7) & reg257) >> (wire246 ?
                  wire248 : reg255))))))
            begin
              reg260 <= reg255;
              reg261 <= (8'hb0);
            end
          else
            begin
              reg260 <= (~&$signed((wire247 ?
                  reg251[(4'hb):(4'hb)] : {$signed(reg261)})));
              reg261 <= $unsigned(reg260[(4'ha):(3'h5)]);
            end
        end
      else
        begin
          if ((8'h9d))
            begin
              reg260 <= reg257[(3'h5):(1'h1)];
              reg261 <= reg258;
              reg262 <= (~^(((|reg254) ?
                  (-(wire246 || reg252)) : reg256) & (reg258[(1'h1):(1'h0)] != wire247)));
              reg263 <= reg262[(1'h0):(1'h0)];
              reg264 <= ($unsigned($unsigned(((~^reg257) ?
                  $signed(reg255) : $signed(wire248)))) + reg254[(3'h5):(3'h5)]);
            end
          else
            begin
              reg260 <= ((reg264[(5'h10):(2'h2)] ?
                  (reg251 ?
                      (&(reg262 ?
                          reg259 : reg257)) : wire246[(5'h15):(5'h14)]) : reg260[(1'h0):(1'h0)]) == $unsigned((+$signed((reg261 ~^ reg263)))));
            end
        end
    end
  assign wire265 = (reg251 ?
                       {reg253[(3'h4):(3'h4)],
                           $signed((wire246[(4'hc):(2'h2)] & wire246))} : $unsigned(wire247));
  assign wire266 = (8'hbe);
  assign wire267 = reg259;
  assign wire268 = wire246[(5'h12):(4'hc)];
  assign wire269 = (~$unsigned($unsigned(reg258)));
  assign wire270 = ($signed(($unsigned({reg253, wire265}) ?
                       ($signed(reg256) <= $unsigned(reg253)) : $unsigned($unsigned(reg258)))) ^ (^$signed($unsigned((reg264 ?
                       reg253 : wire246)))));
  assign wire271 = wire269;
  assign wire272 = (&(-wire270[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg273 <= reg252[(1'h1):(1'h1)];
      reg274 <= $unsigned(($signed($signed({wire265})) ?
          (((reg261 ? wire249 : reg256) ? (~&reg253) : reg257[(3'h4):(1'h0)]) ?
              (8'hb0) : (^~$unsigned(reg261))) : (7'h41)));
      if ($signed(($unsigned(wire248[(4'h9):(1'h0)]) ?
          reg257[(4'hb):(2'h3)] : $unsigned(reg256))))
        begin
          reg275 <= (wire265[(3'h5):(2'h3)] ?
              ((-reg264[(5'h12):(4'hb)]) << ((((8'ha7) ~^ wire268) ?
                  (-reg260) : (wire270 >= wire248)) || (|wire267[(3'h4):(3'h4)]))) : (8'ha4));
        end
      else
        begin
          reg275 <= reg253[(2'h3):(1'h1)];
          if ((|$unsigned(wire266)))
            begin
              reg276 <= reg261;
              reg277 <= reg255[(4'hc):(3'h5)];
              reg278 <= $unsigned($signed($unsigned(({reg260,
                  wire270} ^ (reg263 >> reg252)))));
            end
          else
            begin
              reg276 <= $unsigned(wire247[(1'h0):(1'h0)]);
              reg277 <= $unsigned(wire249);
              reg278 <= wire249;
              reg279 <= reg273;
              reg280 <= (($unsigned(($signed(reg275) | reg262)) ?
                      reg275[(1'h0):(1'h0)] : $unsigned($signed((~^reg256)))) ?
                  reg251 : reg260);
            end
          reg281 <= ($unsigned((({(7'h41), wire249} ?
                  (reg277 >= reg259) : $unsigned(wire266)) ?
              (~|reg259) : reg273)) << ({(~&reg276), wire267[(2'h3):(1'h1)]} ?
              (wire271[(4'hb):(2'h3)] > reg278) : reg260[(4'ha):(3'h5)]));
          if (reg256)
            begin
              reg282 <= $signed(reg276);
              reg283 <= reg258[(1'h1):(1'h1)];
              reg284 <= $unsigned((^$unsigned($signed(reg250[(4'hc):(3'h5)]))));
              reg285 <= (&(!reg281[(2'h3):(1'h1)]));
            end
          else
            begin
              reg282 <= $signed((^{{{reg264}}}));
            end
          reg286 <= $signed(((~|((reg262 || wire269) ?
                  {reg257} : $unsigned(reg258))) ?
              wire272 : ((-wire265[(4'hd):(2'h2)]) < $signed($signed(wire247)))));
        end
      reg287 <= ((($unsigned({wire266}) & $unsigned({(8'hba)})) ?
          wire270 : ($unsigned($unsigned(wire270)) ?
              (~reg278) : $signed($signed(wire247)))) - $signed({(~&$signed(reg258))}));
    end
  assign wire288 = (reg281[(4'hb):(4'ha)] ?
                       reg278[(1'h0):(1'h0)] : ((~&(7'h40)) ?
                           $signed((&(^(8'hbc)))) : {(reg263[(4'he):(4'hd)] >= (reg276 | reg264))}));
  assign wire289 = (($signed(reg286) ?
                       wire271 : (^reg252[(3'h6):(1'h1)])) ^~ (!$unsigned(reg258[(2'h3):(1'h0)])));
  assign wire290 = reg279[(4'hf):(3'h4)];
  assign wire291 = $unsigned((8'hb4));
  assign wire292 = $unsigned($signed(((+(wire288 <<< wire288)) ?
                       $unsigned((reg259 ~^ (8'hbf))) : (((8'h9e) <= (8'hb3)) >> (reg259 >> reg261)))));
  assign wire293 = $signed($unsigned(((~^reg282) & {(^reg286), (^~reg263)})));
  assign wire294 = $signed((reg281[(2'h2):(2'h2)] >>> wire246));
  assign wire295 = {(reg258 > (wire246[(2'h3):(1'h0)] ?
                           {$signed(reg260),
                               (reg250 <= reg285)} : $unsigned($unsigned(wire271))))};
  always
    @(posedge clk) begin
      reg296 <= (~$unsigned((|wire293)));
      reg297 <= wire268;
    end
endmodule

module module192  (y, clk, wire196, wire195, wire194, wire193);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire196;
  input wire signed [(2'h3):(1'h0)] wire195;
  input wire [(4'hf):(1'h0)] wire194;
  input wire signed [(2'h3):(1'h0)] wire193;
  wire signed [(3'h4):(1'h0)] wire228;
  wire signed [(5'h13):(1'h0)] wire226;
  wire signed [(4'hd):(1'h0)] wire225;
  wire [(5'h10):(1'h0)] wire224;
  wire [(4'ha):(1'h0)] wire209;
  wire signed [(4'hc):(1'h0)] wire208;
  wire signed [(3'h6):(1'h0)] wire207;
  wire [(4'h9):(1'h0)] wire206;
  wire signed [(3'h7):(1'h0)] wire204;
  wire [(3'h5):(1'h0)] wire203;
  wire [(3'h7):(1'h0)] wire202;
  wire signed [(4'hd):(1'h0)] wire201;
  wire [(5'h13):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire signed [(3'h7):(1'h0)] wire198;
  wire signed [(4'hd):(1'h0)] wire197;
  reg [(4'hc):(1'h0)] reg227 = (1'h0);
  reg [(4'he):(1'h0)] reg223 = (1'h0);
  reg [(3'h4):(1'h0)] reg222 = (1'h0);
  reg [(3'h4):(1'h0)] reg221 = (1'h0);
  reg [(5'h10):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg216 = (1'h0);
  reg [(4'hb):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg [(4'hc):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg212 = (1'h0);
  reg [(5'h10):(1'h0)] reg211 = (1'h0);
  reg [(5'h15):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg205 = (1'h0);
  assign y = {wire228,
                 wire226,
                 wire225,
                 wire224,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 reg227,
                 reg223,
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
                 reg205,
                 (1'h0)};
  assign wire197 = wire193;
  assign wire198 = ({($signed({wire195}) ?
                               ((wire193 ? wire195 : wire195) ?
                                   $signed(wire197) : (8'hb8)) : $unsigned(wire193))} ?
                       $unsigned((wire197[(4'hb):(2'h2)] == $unsigned($signed(wire197)))) : wire195[(1'h0):(1'h0)]);
  assign wire199 = ((~|$unsigned($unsigned(wire194[(4'hb):(4'ha)]))) != wire198);
  assign wire200 = wire194[(4'h8):(4'h8)];
  assign wire201 = wire193[(1'h0):(1'h0)];
  assign wire202 = (+(~^wire201[(4'h9):(3'h6)]));
  assign wire203 = $unsigned(wire194[(3'h4):(2'h2)]);
  assign wire204 = (((^~{(8'hb3)}) ?
                       (8'hb4) : (wire203 ?
                           $unsigned((wire201 << wire200)) : $signed($signed(wire198)))) >= $signed(wire194));
  always
    @(posedge clk) begin
      reg205 <= ((({(wire200 ? wire203 : wire199), wire194} ?
              (((8'hbb) ? wire193 : (8'ha6)) ?
                  wire196 : (wire193 == wire204)) : $signed((wire200 ^ wire201))) >> wire198[(3'h5):(2'h2)]) ?
          (~|((wire200 ?
              {(8'hba), (8'hb7)} : (wire203 ?
                  (8'ha2) : wire194)) ~^ wire197[(3'h5):(3'h5)])) : ($signed($unsigned((~&wire201))) ?
              $unsigned($unsigned((wire201 ?
                  wire196 : wire194))) : (~wire197[(4'hc):(4'hb)])));
    end
  assign wire206 = $unsigned((~^(~wire196[(1'h1):(1'h1)])));
  assign wire207 = wire202[(3'h6):(3'h4)];
  assign wire208 = ($unsigned(wire194) ?
                       $unsigned($signed($unsigned((wire198 ~^ wire204)))) : $signed(((~^wire195) <<< ($signed(wire204) ?
                           $unsigned(wire201) : {wire206, wire207}))));
  assign wire209 = (8'hb1);
  always
    @(posedge clk) begin
      if ({$signed($signed($unsigned((8'ha2))))})
        begin
          if ($signed((~&{$signed((wire207 ^~ wire201))})))
            begin
              reg210 <= wire196;
            end
          else
            begin
              reg210 <= $signed((!wire195));
            end
          if ((8'hb9))
            begin
              reg211 <= (~$signed((^~({wire196,
                  wire200} <= $signed(wire193)))));
              reg212 <= (((+wire203[(2'h2):(1'h1)]) ?
                      (8'ha7) : $signed($signed(wire194))) ?
                  (wire196 && $unsigned((((8'hb3) <= (8'hb0)) ?
                      (wire196 << wire197) : $signed(reg211)))) : ((wire199[(4'hc):(4'h9)] ?
                      wire198 : $unsigned($signed(wire200))) && $signed(((-wire193) ?
                      (wire200 ? wire195 : (8'hb2)) : ((8'ha5) ?
                          wire201 : wire207)))));
              reg213 <= $unsigned($unsigned({$unsigned($signed(wire199))}));
              reg214 <= (~|($signed(((wire208 ~^ wire203) != wire198)) ?
                  $unsigned((wire200[(4'hc):(3'h4)] ?
                      (wire201 >>> reg212) : (-(8'hb0)))) : ($signed(wire202) <<< $unsigned((wire197 ?
                      wire203 : (8'ha0))))));
            end
          else
            begin
              reg211 <= $unsigned((($unsigned((reg214 >= reg210)) >= $signed(wire209)) ?
                  (reg214 ^ (wire194 ^~ wire198)) : (($signed(wire206) ?
                      $unsigned(wire206) : (reg205 ?
                          wire208 : wire204)) - ((wire204 ?
                      (8'ha0) : (8'ha7)) != reg210))));
            end
        end
      else
        begin
          if (reg214[(2'h2):(1'h1)])
            begin
              reg210 <= (|((+(~&$unsigned(wire207))) & (~^($signed(wire197) ?
                  $signed(wire193) : {wire203, reg210}))));
            end
          else
            begin
              reg210 <= $signed((((reg210 ?
                      $signed(reg205) : $signed(wire197)) ?
                  ({(8'hba)} ?
                      (wire196 > wire209) : wire202) : {reg214}) < {{reg211[(2'h3):(1'h0)],
                      wire209},
                  ((wire194 ? reg211 : wire200) >> (wire193 ?
                      wire197 : wire201))}));
              reg211 <= $signed({wire200[(5'h12):(1'h0)]});
              reg212 <= $unsigned((((^~((8'hbf) ? reg210 : wire209)) ?
                      $unsigned($signed(wire194)) : (~&(|(8'hbd)))) ?
                  {$unsigned(wire201[(3'h5):(1'h1)]),
                      $unsigned((~&wire196))} : (wire209[(2'h2):(1'h1)] <= $unsigned(wire203[(1'h1):(1'h0)]))));
              reg213 <= wire202[(3'h5):(1'h1)];
              reg214 <= ($unsigned((8'hbc)) ?
                  (({((8'hb9) || wire204)} && wire207) <<< {(wire201[(4'h8):(3'h4)] ?
                          (|wire202) : (8'hac))}) : (&(~&($unsigned(reg213) ?
                      reg211[(5'h10):(1'h0)] : $signed(wire195)))));
            end
          reg215 <= $unsigned(wire199[(3'h5):(1'h1)]);
          if ($signed((((~wire203) ?
                  $unsigned($signed(reg205)) : $unsigned((wire197 ~^ reg205))) ?
              wire199 : (~|(8'h9e)))))
            begin
              reg216 <= $unsigned({wire204,
                  ((wire202 >= $unsigned(wire197)) >>> ({(8'hb0)} ?
                      wire202 : (-wire203)))});
            end
          else
            begin
              reg216 <= $signed((8'hbd));
              reg217 <= $unsigned(reg214);
              reg218 <= (^~reg215);
            end
          if (wire202[(3'h5):(1'h0)])
            begin
              reg219 <= wire193;
            end
          else
            begin
              reg219 <= (wire196 < ((~|$signed({reg215})) ?
                  {(wire196[(2'h2):(1'h0)] ^~ (reg217 == wire195)),
                      $signed(wire194)} : wire196));
              reg220 <= wire199;
              reg221 <= $unsigned(({wire204,
                  $signed((8'ha4))} || $signed((wire194[(4'hd):(2'h3)] | $signed(reg211)))));
            end
          reg222 <= reg212;
        end
      reg223 <= $unsigned({(wire202 - wire209[(1'h1):(1'h0)]), (8'ha1)});
    end
  assign wire224 = $signed(($signed($unsigned(reg211)) ?
                       $signed($unsigned((reg218 * wire195))) : $signed((8'ha9))));
  assign wire225 = (~&((-wire206[(3'h5):(1'h1)]) ?
                       $unsigned((wire194 ^~ $signed(wire208))) : (((~&wire206) ?
                           wire202 : ((8'h9e) ~^ reg222)) + wire197[(1'h1):(1'h0)])));
  assign wire226 = reg213;
  always
    @(posedge clk) begin
      reg227 <= (^((8'hba) ?
          (wire195 - ($unsigned(reg210) * $signed(wire209))) : (!$unsigned($unsigned(reg222)))));
    end
  assign wire228 = $unsigned((-$signed(reg215)));
endmodule

module module157
#(parameter param189 = ((((~&((8'h9e) | (7'h40))) >= (7'h42)) > (&((!(8'hb2)) ? (!(8'ha8)) : (!(8'hab))))) != {(((&(7'h44)) ^~ ((8'hb1) ^~ (8'hb4))) ? (((8'hbb) ? (8'ha2) : (8'ha3)) <= ((8'ha3) ? (8'hbd) : (8'h9c))) : {{(8'hb1), (7'h43)}}), {((8'hae) <<< (|(8'ha8)))}}))
(y, clk, wire161, wire160, wire159, wire158);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire161;
  input wire signed [(5'h14):(1'h0)] wire160;
  input wire [(4'hf):(1'h0)] wire159;
  input wire [(3'h4):(1'h0)] wire158;
  wire signed [(5'h14):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire183;
  wire signed [(4'h9):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire [(4'h9):(1'h0)] wire180;
  wire signed [(4'ha):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire163;
  wire [(4'hb):(1'h0)] wire162;
  reg signed [(4'hd):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg168 = (1'h0);
  reg [(3'h4):(1'h0)] reg167 = (1'h0);
  assign y = {wire188,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
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
                 (1'h0)};
  assign wire162 = $signed((&$signed(($signed(wire158) ?
                       (|wire159) : (8'ha3)))));
  assign wire163 = ((&wire162[(4'ha):(4'ha)]) << ((~^{wire158[(1'h1):(1'h1)]}) == $unsigned(({wire162,
                       wire159} <= (wire160 ? wire160 : wire160)))));
  assign wire164 = wire162;
  assign wire165 = $signed(wire163[(2'h2):(1'h0)]);
  assign wire166 = ((!$unsigned(wire164)) <= ($unsigned((~&(+wire162))) <<< {($signed((8'haf)) <= $signed((8'hb3)))}));
  always
    @(posedge clk) begin
      reg167 <= ($signed(((~&(wire160 > wire160)) + ($unsigned((8'hb2)) + wire166[(3'h4):(2'h2)]))) && wire164[(3'h7):(3'h7)]);
      if ($unsigned(((^($signed(wire159) ?
          (~&wire165) : {wire164, wire165})) < {$signed($unsigned(wire166))})))
        begin
          reg168 <= (~wire161[(3'h5):(3'h4)]);
          reg169 <= ((8'ha1) ? (~^(8'ha8)) : {reg167[(1'h1):(1'h0)], wire163});
          reg170 <= {(reg167 ?
                  $unsigned(((wire164 >= reg169) - wire161)) : wire161[(4'h8):(3'h5)]),
              reg167[(2'h2):(1'h0)]};
          if (wire163[(2'h2):(1'h1)])
            begin
              reg171 <= reg169;
              reg172 <= wire166[(1'h0):(1'h0)];
            end
          else
            begin
              reg171 <= (($signed(((~|reg168) >>> (wire164 || (8'hbc)))) & ($unsigned((wire161 ?
                          (7'h41) : wire159)) ?
                      wire164 : (8'ha5))) ?
                  wire165 : (8'hab));
              reg172 <= reg167[(1'h0):(1'h0)];
              reg173 <= ({(!wire159), {$unsigned((reg170 ? reg169 : reg169))}} ?
                  ($unsigned((!$unsigned(wire159))) - wire160) : wire164);
              reg174 <= ($signed(wire159[(4'ha):(4'h9)]) ?
                  (8'hb6) : (($signed((8'hae)) >= ($signed(wire158) ^~ reg167)) ?
                      $unsigned($unsigned($signed(wire160))) : {$signed((wire161 ?
                              wire161 : wire163)),
                          reg171[(3'h5):(2'h3)]}));
              reg175 <= $signed((wire159 ? $unsigned((8'hbd)) : reg167));
            end
        end
      else
        begin
          reg168 <= (wire161[(4'h8):(2'h2)] != (^$unsigned(reg170[(3'h6):(3'h4)])));
          reg169 <= (8'h9f);
          reg170 <= wire162;
        end
      reg176 <= $unsigned(($signed((~&(^~wire162))) ?
          (((wire166 >= wire163) + wire163) >> {$unsigned(wire162)}) : reg167));
      reg177 <= reg176;
    end
  assign wire178 = ((~&$signed({$unsigned(reg173), (wire164 ^~ (7'h43))})) ?
                       ((^reg167) && ($signed((reg177 ? reg173 : reg174)) ?
                           ((reg169 != wire158) ?
                               (^~(8'hb7)) : (wire166 ?
                                   reg169 : reg169)) : $signed((^wire164)))) : $unsigned(wire158));
  assign wire179 = (|wire162[(4'h9):(3'h6)]);
  assign wire180 = (8'h9d);
  assign wire181 = reg174;
  assign wire182 = {((!$signed($unsigned((8'hb7)))) == {(^(wire164 ?
                               reg167 : (8'ha3))),
                           wire161}),
                       (8'hb2)};
  assign wire183 = {({((reg177 < (8'ha7)) | {wire164, reg170}),
                           reg175[(4'he):(4'ha)]} <<< (8'hbf))};
  always
    @(posedge clk) begin
      reg184 <= $signed(wire162[(4'ha):(2'h3)]);
      reg185 <= {$unsigned(reg177), reg176};
      reg186 <= (reg172[(4'hd):(3'h4)] ?
          ((reg169 > ((wire183 << reg176) >= (~&reg170))) ?
              {$signed(reg177)} : reg185[(2'h2):(2'h2)]) : $unsigned(($unsigned($unsigned((8'ha2))) ?
              ((reg170 << wire178) ?
                  $unsigned(reg169) : wire163[(1'h0):(1'h0)]) : ($unsigned(wire165) >>> reg168[(3'h4):(3'h4)]))));
      reg187 <= wire164;
    end
  assign wire188 = reg176;
endmodule

module module75
#(parameter param139 = (+(8'hb7)))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h2db):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire79;
  input wire [(2'h3):(1'h0)] wire78;
  input wire [(4'hc):(1'h0)] wire77;
  input wire [(5'h15):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(5'h10):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire84;
  wire signed [(4'h8):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  assign y = {wire138,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire95,
                 wire94,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
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
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire80 = wire77;
  assign wire81 = (-(!wire80[(4'h8):(1'h0)]));
  assign wire82 = $unsigned({wire78});
  assign wire83 = wire78[(2'h3):(2'h3)];
  assign wire84 = wire78;
  assign wire85 = ($unsigned(wire78) ?
                      ($signed(wire81[(1'h0):(1'h0)]) * $unsigned((wire77 ?
                          {wire78,
                              wire79} : wire77[(2'h3):(1'h0)]))) : (({wire84,
                              (wire76 ?
                                  wire79 : wire79)} <= ($unsigned(wire77) || (wire77 ?
                              wire84 : wire84))) ?
                          $signed((~^((8'hb8) ? wire77 : wire76))) : wire80));
  always
    @(posedge clk) begin
      if ((($unsigned((8'h9e)) ?
              ({(8'ha9)} ?
                  (&(wire85 ?
                      wire81 : wire78)) : {wire81}) : $signed((7'h44))) ?
          (-wire79[(4'hb):(2'h2)]) : wire77[(3'h4):(2'h3)]))
        begin
          if ((-($unsigned((8'hae)) ? (8'hb2) : $signed($unsigned(wire82)))))
            begin
              reg86 <= $signed($unsigned(wire85[(1'h1):(1'h0)]));
              reg87 <= (!((~|$signed((wire84 ? wire80 : wire79))) ?
                  wire82 : (8'hbe)));
              reg88 <= (wire77 ?
                  wire84 : ({(wire80[(2'h2):(1'h1)] * (wire85 ^~ wire81)),
                      $unsigned((wire79 >> (8'hb4)))} ~^ {wire82[(3'h4):(2'h3)]}));
              reg89 <= (wire81 ?
                  ($signed(($unsigned(wire77) ?
                      $unsigned(wire78) : wire78[(2'h3):(1'h0)])) << $signed(reg87)) : (wire79 ?
                      $unsigned(reg87) : wire85[(4'hc):(3'h4)]));
            end
          else
            begin
              reg86 <= ((&$signed(($unsigned(wire79) ?
                      (reg86 ? wire83 : wire82) : wire76[(4'he):(2'h3)]))) ?
                  $signed($unsigned($signed(((8'had) ?
                      wire80 : reg87)))) : (!$unsigned(wire84[(4'h9):(1'h0)])));
              reg87 <= wire85;
              reg88 <= wire84[(2'h3):(2'h2)];
              reg89 <= $unsigned((^~$signed($unsigned($signed(reg88)))));
              reg90 <= reg88[(2'h2):(1'h0)];
            end
        end
      else
        begin
          if (wire80)
            begin
              reg86 <= $unsigned({reg90, reg90[(1'h0):(1'h0)]});
              reg87 <= reg90;
              reg88 <= $unsigned(($unsigned($signed(reg89)) <<< $unsigned((wire84[(3'h4):(1'h0)] >>> (&wire76)))));
              reg89 <= (7'h44);
            end
          else
            begin
              reg86 <= $signed($unsigned($signed(wire76[(4'hc):(1'h1)])));
              reg87 <= $signed(reg87[(1'h0):(1'h0)]);
              reg88 <= wire85[(4'he):(2'h2)];
            end
          reg90 <= {$unsigned(wire77),
              ($signed(wire77) == ((~^wire83[(4'h8):(3'h4)]) ?
                  ((reg87 <<< wire81) || reg88[(4'h9):(4'h8)]) : (((7'h44) ?
                          wire79 : wire80) ?
                      {wire77} : $unsigned(wire84))))};
          reg91 <= $unsigned(wire85[(1'h1):(1'h1)]);
          reg92 <= {$signed(reg87)};
        end
      reg93 <= reg90[(2'h2):(2'h2)];
    end
  assign wire94 = $signed((^~((~&(~reg93)) ?
                      $unsigned(wire77) : $unsigned((reg93 << reg91)))));
  assign wire95 = $unsigned((((~^wire85[(4'hc):(3'h4)]) ?
                          wire79 : $unsigned((wire85 & wire82))) ?
                      ({{wire81,
                              reg87}} ~^ $signed($unsigned((8'hb1)))) : wire85[(4'he):(4'ha)]));
  always
    @(posedge clk) begin
      if ($signed($signed(((~^(reg90 ?
          reg86 : wire78)) >>> $unsigned(((8'hbd) > (8'hb4)))))))
        begin
          reg96 <= reg88[(4'h8):(2'h3)];
          if (reg93)
            begin
              reg97 <= (wire77[(4'h9):(4'h9)] ?
                  (8'hbe) : ((wire77 == (~|$signed(wire76))) ?
                      wire84[(4'hb):(4'hb)] : {$signed($signed(wire76))}));
            end
          else
            begin
              reg97 <= ($unsigned(reg87[(4'h9):(1'h0)]) >= wire80[(5'h12):(3'h4)]);
              reg98 <= (^(|$unsigned({(reg96 ? wire80 : reg96), reg92})));
            end
          reg99 <= (~&(({$unsigned(reg86),
                  reg89[(2'h2):(2'h2)]} & ($unsigned(reg92) ?
                  $signed(reg93) : wire82)) ?
              {{((8'hb2) | reg87)}} : ((~wire83) ?
                  $signed(reg87[(3'h6):(3'h4)]) : $unsigned(wire83[(2'h3):(1'h0)]))));
          reg100 <= ($unsigned(((8'ha0) ?
              {(|wire83),
                  wire94[(3'h7):(3'h4)]} : reg96[(4'h8):(2'h2)])) * (-(((~reg97) <= (reg90 ?
              (8'hb6) : wire95)) <<< (reg87[(1'h1):(1'h1)] ?
              (reg97 * reg86) : reg91[(5'h14):(4'hf)]))));
          if (wire95)
            begin
              reg101 <= $unsigned(((~^$signed((^~(8'ha6)))) ?
                  {(~|(&(8'ha8)))} : $unsigned({reg92, $unsigned(wire81)})));
              reg102 <= (~&$unsigned(($unsigned((wire78 >>> wire77)) ?
                  ($signed((8'hac)) ^ (wire78 << (8'ha6))) : wire81[(1'h1):(1'h0)])));
              reg103 <= $signed($signed({{(^reg99)}, (~wire83)}));
              reg104 <= (^~(!(reg101[(4'ha):(2'h3)] ~^ (+(reg97 >> reg97)))));
              reg105 <= reg93;
            end
          else
            begin
              reg101 <= $signed($signed((8'ha6)));
              reg102 <= (wire94[(3'h7):(1'h1)] >> (reg98 ?
                  wire79[(1'h1):(1'h0)] : $signed($unsigned((^reg87)))));
              reg103 <= (8'ha1);
              reg104 <= (((wire81[(3'h7):(3'h6)] > $signed((~^wire78))) == $unsigned(wire82[(3'h6):(1'h1)])) <<< $unsigned($signed(wire80)));
              reg105 <= wire76[(5'h12):(4'he)];
            end
        end
      else
        begin
          if ({$unsigned((8'ha8)),
              ($signed((~|(wire81 ? reg99 : (8'ha4)))) + (8'haf))})
            begin
              reg96 <= (((($unsigned((8'hb1)) >= (reg92 >>> wire79)) || ($signed(wire84) ?
                      $signed(wire76) : (^~(8'hb7)))) ?
                  (8'had) : reg92) <= (wire95 ?
                  wire82 : $unsigned(($unsigned(reg102) ?
                      $signed(reg96) : wire78[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg96 <= (!$unsigned(($signed($signed((8'hb4))) | (wire76 || (reg104 < wire77)))));
              reg97 <= (~|$unsigned((~^$unsigned((^reg88)))));
              reg98 <= $signed(reg101);
              reg99 <= (8'hbd);
            end
          reg100 <= $unsigned(($signed({(reg99 ? (8'ha2) : wire85),
                  (wire95 ? reg93 : reg91)}) ?
              {$unsigned(reg90[(1'h1):(1'h1)]),
                  $unsigned(reg104[(5'h11):(3'h7)])} : $signed(reg101[(2'h2):(1'h1)])));
          if ($unsigned((-($unsigned($signed(reg104)) & (~|((8'haa) ~^ (7'h43)))))))
            begin
              reg101 <= (((8'ha1) ?
                  reg90 : $unsigned((^~reg98[(4'h9):(3'h5)]))) << $unsigned(wire85));
            end
          else
            begin
              reg101 <= $unsigned(reg92[(4'hb):(4'h8)]);
              reg102 <= wire81[(2'h3):(2'h3)];
            end
          reg103 <= $unsigned({{reg89}});
          reg104 <= ((|reg88[(3'h6):(2'h3)]) * {($signed(reg99) || $signed((8'hae)))});
        end
    end
  assign wire106 = $unsigned((wire78[(1'h1):(1'h1)] >>> $signed($signed(reg99[(3'h7):(2'h2)]))));
  assign wire107 = $unsigned(wire106[(3'h7):(3'h7)]);
  assign wire108 = (reg103[(1'h0):(1'h0)] ?
                       (((reg96[(2'h2):(1'h1)] ?
                           {reg96,
                               (8'hbf)} : $unsigned(reg87)) ^~ ({(8'hae)} != (~^wire79))) ^ $signed(reg104[(4'hb):(3'h7)])) : (&reg90));
  assign wire109 = reg86;
  always
    @(posedge clk) begin
      if (reg102)
        begin
          if ({$signed({wire81[(3'h4):(1'h0)]}), wire84[(4'h9):(3'h4)]})
            begin
              reg110 <= ((~$signed($unsigned($signed((7'h44))))) - (~^wire106));
              reg111 <= wire94;
            end
          else
            begin
              reg110 <= ((wire83 >= ($unsigned($signed(reg88)) != (~$signed(reg87)))) * ((~&wire95[(1'h0):(1'h0)]) + {{$unsigned(reg105)},
                  $unsigned($unsigned(reg90))}));
              reg111 <= $unsigned(wire79);
              reg112 <= $unsigned((($unsigned((reg104 << (8'ha0))) ?
                  $unsigned(wire79[(4'hc):(3'h7)]) : ($unsigned(wire108) < reg91)) == $unsigned((~reg111[(2'h3):(2'h2)]))));
            end
        end
      else
        begin
          reg110 <= reg97[(1'h1):(1'h1)];
          if ((!wire95))
            begin
              reg111 <= wire79[(1'h1):(1'h1)];
              reg112 <= (~^(~^((wire107[(4'he):(1'h0)] ?
                      reg99 : $unsigned((8'h9f))) ?
                  {(reg91 ? reg86 : (8'hb8))} : $unsigned(wire108))));
              reg113 <= {wire109[(1'h0):(1'h0)],
                  ($signed($unsigned($unsigned(reg86))) ?
                      $signed((8'hb6)) : ($signed({reg105}) ?
                          reg87[(4'h8):(1'h1)] : reg90[(2'h2):(1'h1)]))};
              reg114 <= $signed(((8'ha8) ?
                  $unsigned(reg87[(4'h9):(4'h8)]) : $signed((+((8'hb7) ?
                      wire95 : wire81)))));
              reg115 <= $unsigned(({((wire80 ? reg96 : wire84) ?
                      reg89[(3'h4):(2'h2)] : (wire76 ?
                          (8'ha3) : wire107))} <= $signed($signed(wire109[(3'h7):(1'h0)]))));
            end
          else
            begin
              reg111 <= $unsigned(wire94[(4'h8):(3'h7)]);
            end
        end
      if ((wire85 ? wire78 : reg92))
        begin
          if (($unsigned((~&$unsigned(wire78[(1'h0):(1'h0)]))) <= (8'h9e)))
            begin
              reg116 <= $signed((reg99[(3'h5):(2'h2)] + (((reg96 ^ reg104) ?
                  wire108 : reg92[(3'h6):(1'h1)]) && $signed((~wire82)))));
              reg117 <= {(8'haf)};
            end
          else
            begin
              reg116 <= (^$signed($unsigned(wire83[(2'h2):(1'h1)])));
              reg117 <= (wire107 ?
                  reg113 : $unsigned({{reg91[(3'h4):(1'h0)], wire80},
                      ($unsigned((8'ha9)) <<< $unsigned(reg91))}));
            end
          reg118 <= (reg99[(2'h3):(2'h3)] ?
              (^wire109) : (reg103 ^ ((reg115[(4'hc):(4'h9)] + ((8'h9d) << wire106)) ?
                  $signed(reg98[(1'h1):(1'h1)]) : $signed($signed(reg89)))));
          reg119 <= reg97[(3'h4):(1'h0)];
        end
      else
        begin
          reg116 <= reg115[(3'h7):(2'h3)];
          if (wire106)
            begin
              reg117 <= $signed((~$unsigned((reg116[(3'h6):(1'h0)] << ((8'hb4) ?
                  reg93 : wire82)))));
              reg118 <= (8'h9e);
              reg119 <= wire108;
              reg120 <= reg103;
            end
          else
            begin
              reg117 <= $signed({($signed($signed(reg89)) >= (-((8'h9e) == reg111))),
                  {reg97[(1'h0):(1'h0)], $signed(reg89[(3'h4):(1'h1)])}});
            end
          reg121 <= wire85[(2'h3):(1'h0)];
        end
      if ((reg116 && ((reg98 ? $unsigned((8'ha9)) : (|((8'hae) <<< reg103))) ?
          $signed((!(reg102 ? (8'hae) : reg87))) : (((8'hb8) ?
                  (+reg120) : {(8'h9c)}) ?
              wire107 : reg114[(3'h7):(1'h1)]))))
        begin
          reg122 <= ((((reg111[(2'h3):(2'h2)] ?
                  (~&wire85) : (&reg104)) | ($unsigned((8'ha8)) > $unsigned(reg118))) ?
              {(reg118 << (reg104 ? wire76 : (8'hb4))),
                  $unsigned($signed((8'hb5)))} : $unsigned(reg91)) <= wire83[(3'h6):(1'h0)]);
          reg123 <= $unsigned({((reg103 ?
                      (-reg104) : (reg102 ? reg93 : reg104)) ?
                  (^~$unsigned(reg102)) : reg119[(4'hf):(1'h0)])});
          reg124 <= reg96[(1'h1):(1'h0)];
          reg125 <= {(8'h9c),
              {(((reg103 ?
                      wire82 : wire94) >> (wire79 || reg118)) - $signed(reg87))}};
          reg126 <= ((8'ha2) > ({$unsigned($signed(reg118))} ?
              ((!((8'hae) | reg93)) != (((8'h9d) ? wire77 : reg91) ?
                  (~&reg93) : reg119)) : (!reg122[(4'h9):(4'h8)])));
        end
      else
        begin
          reg122 <= {(~&reg93[(2'h3):(1'h1)])};
        end
      if ($unsigned($signed({(^(reg111 <= (8'haa)))})))
        begin
          if ($unsigned(reg104))
            begin
              reg127 <= $unsigned($unsigned(wire106[(4'ha):(2'h2)]));
              reg128 <= (+reg93);
            end
          else
            begin
              reg127 <= (~&$unsigned($signed($signed(reg127))));
              reg128 <= $unsigned((!reg105));
              reg129 <= reg91[(4'ha):(3'h5)];
              reg130 <= (8'h9f);
              reg131 <= $unsigned(((((-reg86) > {wire95,
                  reg88}) || (~$signed(wire76))) | (((8'h9d) >>> (reg89 ?
                  wire106 : reg88)) ~^ {$unsigned(wire83)})));
            end
          if (reg103)
            begin
              reg132 <= $unsigned($unsigned((^~((reg111 ~^ reg126) ?
                  reg104 : reg112[(3'h5):(3'h5)]))));
              reg133 <= reg115;
              reg134 <= $signed({(($unsigned((8'hbd)) ?
                      ((8'hb2) ?
                          reg104 : reg103) : reg129[(4'he):(4'ha)]) >= reg117)});
              reg135 <= wire78[(2'h3):(1'h0)];
              reg136 <= ($signed($signed(($unsigned(reg101) << (reg90 ?
                      wire94 : reg86)))) ?
                  $signed($signed(reg86[(4'h9):(3'h4)])) : {((!reg100) >= reg127[(3'h4):(3'h4)]),
                      $signed({reg87, (reg112 ? wire109 : reg110)})});
            end
          else
            begin
              reg132 <= reg136;
              reg133 <= $signed(($unsigned(reg102[(3'h4):(3'h4)]) ?
                  (|$unsigned((+reg111))) : ((reg113 ?
                          (reg99 ? reg103 : wire83) : (reg123 <= reg130)) ?
                      $signed(wire76[(4'ha):(1'h0)]) : ({reg87,
                          reg126} << {reg121, reg101}))));
              reg134 <= (&wire85[(3'h5):(2'h3)]);
            end
          reg137 <= reg112;
        end
      else
        begin
          reg127 <= (wire85 ?
              $signed((~^($unsigned(reg96) ?
                  ((8'h9e) ?
                      reg131 : reg126) : reg129[(3'h7):(2'h3)]))) : reg137);
          reg128 <= (^(|$signed(reg125[(3'h4):(2'h2)])));
          reg129 <= $unsigned(($signed($unsigned($unsigned(reg123))) > reg130));
        end
    end
  assign wire138 = ((($signed(wire85[(3'h5):(3'h5)]) ?
                           ((^reg92) ^~ (+wire82)) : (+$unsigned(reg111))) <= (wire109 ?
                           (8'hbe) : $unsigned($signed(reg127)))) ?
                       reg112 : $unsigned((7'h40)));
endmodule

module module36
#(parameter param71 = ((|((~((7'h40) ? (8'ha3) : (8'hb3))) ? (!((8'haa) ? (8'ha1) : (8'hac))) : (+((8'hac) - (8'ha5))))) ? ((8'hae) ? (~((8'had) ? (-(8'hb7)) : (^~(8'ha2)))) : ({((8'hbb) ? (8'hab) : (8'hb2))} - (((8'ha5) || (8'ha8)) ? ((8'h9f) ? (7'h42) : (8'hbd)) : {(8'h9f)}))) : ((((&(8'hb6)) == ((8'ha2) >>> (8'h9d))) <= {((8'hbb) > (8'hab)), {(8'ha1), (8'hb0)}}) ? (-(((8'ha1) <= (8'ha3)) ? ((8'ha2) ? (8'had) : (8'hb9)) : ((8'h9c) ? (8'hb9) : (8'ha0)))) : ((+((8'h9c) ^~ (8'ha1))) ? (8'hb2) : (-((8'hbb) ? (8'hb5) : (8'h9f)))))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire41;
  input wire [(4'hf):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  input wire signed [(4'hb):(1'h0)] wire38;
  input wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(4'hb):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  reg signed [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire46,
                 wire45,
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
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= (($unsigned(wire39) ?
              ((~$signed((8'haa))) <<< (wire41[(3'h6):(3'h6)] ?
                  (wire40 ?
                      wire38 : wire38) : (wire40 - wire41))) : {$unsigned($unsigned(wire39))}) ?
          $signed({(~^(wire40 ? wire40 : wire38))}) : (~^$signed((wire40 ?
              (|wire40) : $unsigned(wire37)))));
      reg43 <= ((((reg42 || wire37[(4'h8):(3'h7)]) ?
              $signed((wire38 ?
                  reg42 : wire41)) : ((8'ha6) && wire41[(3'h4):(1'h1)])) ?
          ((~&(-wire39)) ?
              $signed((+wire38)) : {$signed(wire41),
                  wire39}) : ($unsigned((wire37 + wire38)) & $unsigned(wire38))) ^ {wire39[(2'h3):(1'h0)],
          wire41});
      reg44 <= $signed(wire39[(1'h0):(1'h0)]);
    end
  assign wire45 = (wire38[(3'h5):(3'h5)] ~^ $unsigned(reg44));
  assign wire46 = (reg44 ?
                      $signed((+$signed({wire39,
                          (8'hb1)}))) : wire41[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg47 <= ((~^((^~wire39[(2'h3):(2'h3)]) ^~ wire39[(2'h2):(2'h2)])) > wire45);
      if (wire37[(3'h4):(2'h2)])
        begin
          reg48 <= $unsigned((+({reg44[(4'hd):(3'h7)],
              $unsigned(wire40)} >>> (!(wire46 && wire39)))));
          reg49 <= (reg44[(4'h9):(3'h6)] ?
              (!$unsigned(($unsigned(reg43) ~^ {reg43, wire38}))) : wire45);
          if ({(7'h44), $signed(reg49)})
            begin
              reg50 <= reg43;
            end
          else
            begin
              reg50 <= $unsigned($unsigned({(~(wire37 ^ reg48)),
                  wire41[(2'h3):(2'h2)]}));
              reg51 <= $signed(($signed($unsigned($unsigned(reg44))) ^~ (-((reg44 <= reg48) ?
                  reg43 : $signed(wire37)))));
              reg52 <= (~&(wire45 < (reg42 >> (~wire41))));
              reg53 <= $unsigned((&reg48[(2'h2):(1'h0)]));
              reg54 <= $signed((reg42 - (((reg44 ?
                      reg44 : reg44) || $unsigned((7'h41))) ?
                  ($signed(reg43) >> (^(8'hb4))) : (^reg43[(4'ha):(3'h7)]))));
            end
          reg55 <= (((reg47 & $unsigned((^wire37))) ?
              $unsigned($signed($unsigned(reg43))) : wire45[(2'h2):(2'h2)]) > {(~&(7'h44)),
              $signed((!(|reg54)))});
        end
      else
        begin
          reg48 <= wire40[(3'h5):(3'h5)];
          reg49 <= $signed(reg47[(2'h2):(1'h0)]);
          reg50 <= $signed(wire46[(1'h0):(1'h0)]);
          reg51 <= (wire46[(1'h1):(1'h1)] ?
              wire41[(2'h3):(1'h1)] : wire40[(4'he):(4'hb)]);
          reg52 <= (({{(reg52 ? reg51 : (8'hbb)),
                      $signed(reg54)}} <= $unsigned((-wire37[(3'h4):(3'h4)]))) ?
              ($unsigned(reg49[(5'h13):(5'h11)]) | ($signed(reg53) ?
                  (&$unsigned((7'h44))) : $unsigned((!reg55)))) : wire40[(3'h6):(3'h4)]);
        end
      reg56 <= $signed((wire41 ?
          (^~wire40) : ({(wire46 ? (8'hb0) : wire37), reg52[(3'h4):(1'h0)]} ?
              $signed(reg43) : (~&{reg47}))));
      reg57 <= $signed(((~^(wire46 >>> (7'h41))) & ($unsigned((reg52 ?
              reg47 : (8'h9c))) ?
          (|wire40) : $signed((reg51 + reg54)))));
    end
  assign wire58 = (^((((reg42 ? (8'ha4) : reg55) > wire38) ?
                      ({reg50, reg53} ?
                          (wire37 ?
                              reg51 : reg43) : reg52) : reg52) < {reg43[(2'h3):(2'h2)],
                      {wire37[(3'h7):(1'h0)]}}));
  assign wire59 = wire58[(2'h2):(1'h0)];
  assign wire60 = reg54;
  assign wire61 = $unsigned(wire37);
  assign wire62 = ($signed({{$unsigned(reg43)},
                      wire60}) && (($unsigned($unsigned(reg43)) ?
                          reg47[(4'h8):(3'h5)] : $signed(wire60)) ?
                      reg47 : ({(reg43 ? reg51 : (8'had)),
                          reg52[(1'h1):(1'h1)]} || $unsigned((8'hb2)))));
  assign wire63 = $unsigned(reg53[(3'h5):(2'h2)]);
  assign wire64 = ((~^((((8'hbe) == reg56) ?
                          $signed(wire45) : $unsigned(reg43)) ?
                      (wire60[(1'h1):(1'h0)] != (8'haa)) : reg57[(1'h1):(1'h0)])) ^~ reg48);
  assign wire65 = reg43;
  assign wire66 = (!$signed(wire45[(3'h7):(1'h0)]));
  assign wire67 = $signed($unsigned($unsigned(wire58[(3'h5):(3'h5)])));
  assign wire68 = wire59[(3'h6):(2'h3)];
  assign wire69 = $signed($signed($unsigned($unsigned(((8'haf) == reg49)))));
  assign wire70 = wire68[(2'h3):(1'h1)];
endmodule
