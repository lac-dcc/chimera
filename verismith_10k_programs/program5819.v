module top
#(parameter param283 = ((((((8'hb2) != (8'hbf)) >>> (!(8'ha2))) ? ((|(8'hbd)) ? ((7'h41) ? (8'hb0) : (8'h9e)) : (&(8'hbd))) : ((+(8'ha6)) <= (^(7'h41)))) ? (&((~|(8'hae)) ? (&(8'hbe)) : ((8'hbd) ? (8'hb0) : (8'hbb)))) : ({((8'hbb) & (8'h9f))} & ({(7'h42)} <<< ((8'ha1) ? (7'h42) : (8'hb8))))) >= (((((7'h43) ? (8'hb3) : (8'ha0)) >= ((7'h43) - (8'hbb))) << (~&((8'hbd) ? (7'h42) : (8'had)))) ~^ (+(&((8'h9e) ? (8'ha7) : (8'hb3)))))), 
parameter param284 = param283)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h220):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire282;
  wire signed [(4'h8):(1'h0)] wire255;
  wire signed [(4'hc):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire136;
  wire [(2'h2):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire115;
  reg signed [(3'h6):(1'h0)] reg281 = (1'h0);
  reg [(3'h6):(1'h0)] reg280 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg279 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg278 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg277 = (1'h0);
  reg [(3'h4):(1'h0)] reg276 = (1'h0);
  reg [(3'h7):(1'h0)] reg275 = (1'h0);
  reg [(2'h2):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg273 = (1'h0);
  reg [(4'ha):(1'h0)] reg272 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg271 = (1'h0);
  reg [(5'h13):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg269 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg268 = (1'h0);
  reg [(4'h8):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg266 = (1'h0);
  reg [(3'h6):(1'h0)] reg265 = (1'h0);
  reg [(2'h3):(1'h0)] reg264 = (1'h0);
  reg signed [(4'he):(1'h0)] reg263 = (1'h0);
  reg signed [(4'he):(1'h0)] reg262 = (1'h0);
  reg [(4'ha):(1'h0)] reg261 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg260 = (1'h0);
  reg [(5'h15):(1'h0)] reg259 = (1'h0);
  reg [(4'hc):(1'h0)] reg258 = (1'h0);
  reg [(4'h9):(1'h0)] reg257 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  assign y = {wire282,
                 wire255,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire117,
                 wire4,
                 wire5,
                 wire6,
                 wire115,
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
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
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
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (((|(^~$unsigned(wire1))) ?
                     (+(~^$signed(wire2))) : $signed((8'hb5))) || (~$signed({(~&wire0)})));
  assign wire6 = {$signed(wire5),
                     ($signed($signed((~&wire5))) ?
                         wire2[(5'h14):(4'ha)] : $signed(wire4))};
  module7 #() modinst116 (.wire8(wire3), .y(wire115), .wire10(wire1), .wire12(wire0), .wire11(wire5), .clk(clk), .wire9(wire4));
  assign wire117 = $unsigned(wire115);
  always
    @(posedge clk) begin
      reg118 <= (($signed($signed(wire1[(2'h3):(1'h1)])) ?
              $unsigned($unsigned((&(7'h42)))) : wire2) ?
          {(wire0 >= wire5)} : $signed(wire3));
      reg119 <= ({wire115[(1'h0):(1'h0)],
          (+reg118[(4'h8):(1'h1)])} < {(($unsigned(wire0) == wire1[(4'h9):(1'h0)]) || $signed((~wire1)))});
      if (({reg118} ?
          $unsigned(((~|wire4[(1'h1):(1'h1)]) ?
              {$signed(reg118)} : ($signed(reg118) <<< wire6))) : (&(~&wire115))))
        begin
          reg120 <= wire0;
        end
      else
        begin
          reg120 <= (wire3[(4'he):(3'h7)] ?
              {(7'h44)} : {reg119[(4'he):(4'h9)]});
          reg121 <= wire117;
          if (((wire1[(3'h5):(1'h1)] ?
              $unsigned(reg121[(2'h3):(1'h1)]) : (reg120 != (wire6[(4'hc):(1'h1)] ?
                  reg119[(5'h13):(3'h4)] : $signed(wire117)))) <= $unsigned(wire6)))
            begin
              reg122 <= (wire2[(5'h11):(4'hd)] ?
                  (!(reg119[(2'h3):(2'h2)] | (!(~reg121)))) : $unsigned(((&(reg121 ?
                      reg120 : reg118)) ^~ $unsigned((wire3 ?
                      wire1 : wire1)))));
              reg123 <= (&$signed(reg119));
              reg124 <= (((reg123[(3'h4):(1'h0)] ?
                  $unsigned($signed((8'ha4))) : (8'hba)) >>> $signed((reg120 ?
                  wire115 : (reg121 ?
                      reg123 : reg120)))) ~^ reg123[(3'h4):(1'h1)]);
            end
          else
            begin
              reg122 <= ((((-(~&wire0)) * $signed((^~reg124))) ?
                      (($unsigned(wire115) < (~^reg124)) + $unsigned(wire4)) : reg119[(4'ha):(3'h6)]) ?
                  reg124 : ((^{(wire115 ? reg119 : reg122)}) ?
                      ({$unsigned(reg119),
                          $signed(wire1)} <= $signed((-wire117))) : {reg121,
                          $signed({wire115, reg124})}));
              reg123 <= (&{$signed((8'haa))});
              reg124 <= $signed({(7'h41), wire1[(5'h10):(2'h3)]});
            end
          if ({$unsigned($signed($signed(wire0))),
              $signed(reg119[(3'h7):(2'h3)])})
            begin
              reg125 <= (&reg123[(2'h3):(1'h0)]);
              reg126 <= $signed(wire2[(4'h9):(2'h3)]);
              reg127 <= (!(!{wire5, wire4}));
              reg128 <= wire115;
            end
          else
            begin
              reg125 <= $signed((8'hb5));
              reg126 <= $signed(reg124);
              reg127 <= wire2;
            end
        end
    end
  assign wire129 = reg124[(1'h0):(1'h0)];
  assign wire130 = wire5[(3'h6):(2'h3)];
  assign wire131 = $signed(wire115[(3'h5):(3'h4)]);
  assign wire132 = wire1;
  assign wire133 = $unsigned($signed($unsigned($unsigned((reg127 ?
                       reg123 : (8'hb4))))));
  assign wire134 = reg121;
  assign wire135 = {$unsigned((reg120 ?
                           ($unsigned(reg123) ^ reg121[(1'h1):(1'h0)]) : (7'h44)))};
  assign wire136 = $signed((reg122[(3'h5):(1'h0)] >> $unsigned(reg120)));
  assign wire137 = reg124[(2'h2):(1'h0)];
  assign wire138 = reg125;
  assign wire139 = $signed(reg119[(5'h12):(5'h12)]);
  module140 #() modinst256 (wire255, clk, wire4, wire0, wire117, wire1);
  always
    @(posedge clk) begin
      if (reg123)
        begin
          reg257 <= ($unsigned($signed(($unsigned(wire115) > {wire5,
                  reg126}))) ?
              reg118[(4'h8):(3'h5)] : ((wire129[(4'ha):(4'ha)] & wire138[(4'hc):(2'h3)]) | reg124[(1'h1):(1'h0)]));
          reg258 <= ($unsigned((wire136 ?
                  (((8'hbf) && wire4) + $unsigned(wire255)) : ($unsigned((8'ha1)) <= (wire5 >>> (8'hbd))))) ?
              wire6 : {reg126[(1'h0):(1'h0)]});
          reg259 <= $unsigned(wire138[(3'h7):(1'h1)]);
          reg260 <= $unsigned((~wire3));
        end
      else
        begin
          reg257 <= (wire2 ?
              (($unsigned($signed(wire4)) + (~^((7'h41) ? wire139 : wire130))) ?
                  wire0[(3'h6):(3'h4)] : wire4[(5'h13):(4'hb)]) : wire137[(2'h2):(1'h0)]);
          if ($unsigned(reg259))
            begin
              reg258 <= wire4;
              reg259 <= (+({wire134[(4'h9):(3'h5)]} ?
                  wire135 : (^$unsigned($unsigned(wire131)))));
              reg260 <= ($unsigned($signed(wire0[(3'h7):(1'h0)])) & ($unsigned($unsigned((8'haf))) ?
                  (((wire0 ? wire139 : reg257) ?
                      wire4[(4'h8):(1'h1)] : reg123[(1'h1):(1'h1)]) * wire115) : $unsigned((8'ha2))));
              reg261 <= reg119[(3'h6):(3'h6)];
            end
          else
            begin
              reg258 <= $signed(wire2[(4'hf):(4'hb)]);
              reg259 <= wire133;
            end
          reg262 <= $unsigned((~^$unsigned($unsigned((reg122 >= wire6)))));
          reg263 <= $signed((8'hbf));
          reg264 <= $signed({reg257[(1'h1):(1'h0)],
              (reg259[(1'h0):(1'h0)] ?
                  (~^$unsigned(wire137)) : (~^$unsigned((8'hb2))))});
        end
      if ($unsigned(wire2))
        begin
          reg265 <= ({(~|$unsigned((wire136 > (8'hb6)))),
              reg120} ^~ wire2[(4'hf):(2'h2)]);
        end
      else
        begin
          if ({reg120})
            begin
              reg265 <= ($signed((wire0 ?
                  $unsigned(wire137[(3'h6):(2'h2)]) : ($unsigned((8'had)) ?
                      (wire6 ^~ reg259) : $unsigned(reg120)))) & (+$unsigned(((+(8'had)) ?
                  $unsigned(wire130) : wire131[(1'h1):(1'h0)]))));
              reg266 <= (~((!(reg261 ^ reg263[(4'he):(3'h5)])) >>> wire131));
              reg267 <= (|{{wire1, wire139}, {(~wire129[(4'hd):(1'h0)])}});
              reg268 <= (($signed(reg124) * ($signed((reg265 > reg267)) != (!$signed(wire138)))) < $unsigned(reg118[(4'h9):(1'h1)]));
            end
          else
            begin
              reg265 <= {(&$unsigned($unsigned((~&reg267)))),
                  (~|((wire139[(3'h5):(1'h0)] ? (!reg122) : $signed((8'h9f))) ?
                      reg124[(1'h1):(1'h0)] : reg124[(1'h1):(1'h0)]))};
              reg266 <= (~wire133);
              reg267 <= (reg120[(2'h3):(1'h0)] ^~ (wire134 & $signed({$signed((8'hbc)),
                  (wire3 & wire3)})));
              reg268 <= ((+wire115[(3'h4):(1'h0)]) | {($unsigned(reg262[(3'h6):(2'h3)]) ?
                      ((wire135 >= (8'hab)) <<< (reg118 ^~ wire2)) : ($signed(wire2) * reg259[(3'h7):(3'h5)])),
                  $unsigned((&$signed(wire6)))});
              reg269 <= reg124;
            end
        end
      reg270 <= reg121;
      if ({({$unsigned(wire130),
              (wire129 ?
                  wire117[(3'h7):(1'h1)] : (reg123 ?
                      wire4 : reg118))} && (((reg125 ? reg126 : wire115) ?
                  (8'hb2) : (^wire6)) ?
              wire133[(3'h4):(2'h2)] : (wire6 | (8'haf)))),
          $unsigned(reg257[(1'h1):(1'h0)])})
        begin
          reg271 <= $signed(({reg270} >> $unsigned($signed($signed(wire0)))));
          reg272 <= wire4[(1'h1):(1'h0)];
          reg273 <= $unsigned(($unsigned($unsigned($signed(reg271))) ?
              {$unsigned($signed(reg271)),
                  $unsigned($unsigned(reg128))} : reg260[(1'h1):(1'h1)]));
          reg274 <= $unsigned(wire138);
        end
      else
        begin
          if ((~wire1[(2'h2):(1'h0)]))
            begin
              reg271 <= $unsigned($unsigned((wire2 ?
                  wire131 : $unsigned({reg121, reg126}))));
              reg272 <= wire2;
              reg273 <= $unsigned((($unsigned((wire129 ? reg127 : wire133)) ?
                      reg124[(1'h1):(1'h1)] : (~|$signed(reg257))) ?
                  $unsigned(((-wire117) ?
                      (-reg260) : (!reg122))) : ({$signed(reg274),
                      $signed(reg124)} >>> reg264[(1'h1):(1'h0)])));
              reg274 <= {$unsigned((wire117 ?
                      {wire130[(3'h6):(3'h4)]} : ({reg123} > reg265))),
                  wire4};
              reg275 <= $unsigned(wire4);
            end
          else
            begin
              reg271 <= $unsigned((^wire131[(1'h1):(1'h0)]));
              reg272 <= wire136;
              reg273 <= $unsigned((reg275 ?
                  wire5[(4'ha):(1'h1)] : (reg259 - $signed((reg125 ?
                      wire3 : reg275)))));
              reg274 <= $signed($signed(wire135));
            end
          reg276 <= ((7'h44) - {(((^wire129) > $unsigned(reg128)) ?
                  (~^(wire132 * reg262)) : {(wire0 >= (8'hb6))})});
          if (wire255[(1'h1):(1'h0)])
            begin
              reg277 <= (8'ha5);
              reg278 <= (~wire1);
              reg279 <= $signed((~wire2));
              reg280 <= reg123[(3'h4):(3'h4)];
              reg281 <= wire139[(4'hb):(3'h7)];
            end
          else
            begin
              reg277 <= reg266;
              reg278 <= {wire117};
              reg279 <= reg263[(4'hc):(3'h5)];
              reg280 <= (((((reg274 ? reg123 : (7'h42)) >>> {wire4, wire133}) ?
                      {$unsigned((8'haf))} : reg123) ?
                  ((reg262[(4'he):(3'h5)] ?
                          wire132 : (reg271 ? wire138 : reg271)) ?
                      $unsigned($signed(reg281)) : ($signed(reg269) < (~|reg276))) : ((|reg281) ?
                      {$signed(reg272)} : ($unsigned((8'hbe)) ?
                          (wire4 ?
                              reg257 : reg128) : $signed(reg277)))) > (~^reg259[(3'h5):(1'h0)]));
            end
        end
    end
  assign wire282 = ((8'haa) ? reg261[(2'h3):(1'h1)] : reg258[(3'h7):(3'h7)]);
endmodule

module module140
#(parameter param254 = (((^{((8'ha8) && (8'hae))}) ? (&(|{(8'hb6)})) : (~|{(8'h9f)})) ? (!(!({(8'ha7)} * {(8'hae)}))) : ((!((^~(8'hab)) >> (8'h9e))) << (~^(~&((8'hbf) != (8'hab)))))))
(y, clk, wire141, wire142, wire143, wire144);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire141;
  input wire [(4'he):(1'h0)] wire142;
  input wire signed [(4'ha):(1'h0)] wire143;
  input wire signed [(5'h14):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire208;
  wire signed [(5'h13):(1'h0)] wire210;
  wire [(5'h15):(1'h0)] wire211;
  wire signed [(2'h3):(1'h0)] wire212;
  wire [(4'hc):(1'h0)] wire213;
  wire signed [(5'h12):(1'h0)] wire214;
  wire signed [(2'h3):(1'h0)] wire222;
  wire [(5'h15):(1'h0)] wire223;
  wire [(3'h5):(1'h0)] wire224;
  wire [(2'h3):(1'h0)] wire249;
  reg signed [(5'h14):(1'h0)] reg253 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg252 = (1'h0);
  reg [(4'hb):(1'h0)] reg251 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(4'hf):(1'h0)] reg216 = (1'h0);
  reg [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg218 = (1'h0);
  reg [(3'h4):(1'h0)] reg219 = (1'h0);
  reg [(5'h10):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg221 = (1'h0);
  assign y = {wire146,
                 wire208,
                 wire210,
                 wire211,
                 wire212,
                 wire213,
                 wire214,
                 wire222,
                 wire223,
                 wire224,
                 wire249,
                 reg253,
                 reg252,
                 reg251,
                 reg145,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg220,
                 reg221,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg145 <= wire144[(4'h8):(4'h8)];
    end
  assign wire146 = wire144[(4'h9):(4'h8)];
  module147 #() modinst209 (wire208, clk, wire144, wire143, wire142, reg145, wire141);
  assign wire210 = $unsigned((($unsigned(wire144) ?
                       ($unsigned(wire141) ?
                           (wire142 ?
                               wire143 : (8'ha6)) : reg145) : (|((8'haa) ?
                           wire144 : wire144))) <<< $signed($signed((~&wire142)))));
  assign wire211 = $signed(wire144);
  assign wire212 = (((|$unsigned((^reg145))) + {((^~wire143) ?
                           (wire211 ? wire210 : wire143) : $signed((8'h9d))),
                       wire211}) ~^ $unsigned((~|{(wire211 ? (8'ha4) : wire141),
                       {wire144}})));
  assign wire213 = {$unsigned((~wire142[(1'h0):(1'h0)])),
                       (~|(wire212[(1'h0):(1'h0)] | (8'hba)))};
  assign wire214 = $signed(wire143[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      if ((-wire211))
        begin
          reg215 <= (wire213[(3'h4):(2'h3)] * (wire214[(4'he):(4'h8)] <<< $signed($signed($unsigned(wire213)))));
          reg216 <= reg215;
        end
      else
        begin
          if ($unsigned((!wire212[(1'h0):(1'h0)])))
            begin
              reg215 <= wire210[(2'h2):(1'h1)];
              reg216 <= ((wire141[(1'h0):(1'h0)] ?
                      reg216 : (^~(~&wire143[(4'h8):(3'h4)]))) ?
                  wire211 : (^(-wire143[(3'h7):(3'h7)])));
            end
          else
            begin
              reg215 <= (~^$signed(($signed($signed(wire142)) << $unsigned((reg145 >= wire142)))));
            end
          reg217 <= wire143;
          reg218 <= wire143[(3'h5):(3'h4)];
          reg219 <= ($unsigned(($unsigned({reg217, wire214}) ?
                  ($unsigned(reg215) ?
                      wire210[(1'h1):(1'h1)] : (~wire208)) : reg145[(4'h8):(3'h5)])) ?
              $signed($signed(wire212)) : wire214);
        end
      reg220 <= (($signed($unsigned(((8'hbc) || wire142))) ?
              reg217 : $unsigned(((wire142 ? reg145 : wire212) ?
                  (+reg217) : (wire144 ? wire208 : wire210)))) ?
          $unsigned((8'ha8)) : ($signed((^~wire141)) ?
              ({(!wire208)} <<< (((8'hb7) ?
                  reg218 : reg218) < $signed(wire142))) : (wire211[(2'h3):(2'h3)] > ($signed(wire142) ?
                  (reg217 <= wire146) : $unsigned(reg219)))));
      reg221 <= $signed({$signed((~{wire144}))});
    end
  assign wire222 = (reg220[(4'h9):(3'h6)] >> (^{(^(reg220 ? reg218 : wire213)),
                       $unsigned($signed((8'hbe)))}));
  assign wire223 = $unsigned(wire143[(2'h3):(1'h0)]);
  assign wire224 = (wire141 <<< (($unsigned($unsigned(wire142)) ?
                           reg215[(3'h7):(3'h7)] : (8'hbd)) ?
                       ({wire141} | wire142[(3'h4):(2'h2)]) : (wire211[(5'h10):(5'h10)] ?
                           wire214 : (~|$unsigned(wire142)))));
  module225 #() modinst250 (.wire226(wire210), .clk(clk), .wire229(wire208), .wire227(reg216), .y(wire249), .wire228(wire143));
  always
    @(posedge clk) begin
      reg251 <= (wire144[(5'h13):(5'h12)] ?
          $signed($unsigned(($unsigned((8'ha3)) ?
              $unsigned(wire208) : (~&reg219)))) : (($unsigned($unsigned(wire222)) > {wire249[(2'h3):(2'h3)]}) ?
              {$unsigned((~&reg215)),
                  ($signed((8'haf)) < wire210[(3'h7):(3'h7)])} : ((^~$signed(reg145)) >> $signed($signed(wire142)))));
      reg252 <= $unsigned($signed(wire144[(3'h6):(3'h6)]));
      reg253 <= $signed($unsigned(wire141[(4'hc):(3'h5)]));
    end
endmodule

module module7
#(parameter param113 = (&({(((8'h9e) ? (8'had) : (7'h41)) ? ((8'h9e) ? (8'haf) : (8'ha4)) : (~|(8'hb6)))} >= ((((7'h42) ? (8'ha0) : (8'hba)) > (!(8'hb2))) ? ((~(8'hb7)) ? {(8'hbb)} : {(8'hb1)}) : ((!(8'ha3)) ? ((8'hb7) << (8'ha1)) : {(8'hbe)})))), 
parameter param114 = (((8'ha2) ? ((param113 < (param113 ? param113 : (8'ha1))) << (8'ha6)) : (param113 ? (&(param113 ? (7'h44) : (7'h42))) : (-(-param113)))) ^ (~^param113)))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire47;
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire109,
                 wire67,
                 wire24,
                 wire25,
                 wire26,
                 wire47,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed({wire8[(4'h8):(3'h5)], wire11}))
        begin
          reg13 <= $signed((wire8[(3'h7):(3'h5)] ?
              (^wire9[(5'h10):(4'h9)]) : $signed({((8'hb9) != (8'ha9)),
                  $unsigned(wire11)})));
          reg14 <= wire8;
          reg15 <= (-$unsigned(($unsigned($signed(wire12)) * $signed(reg14[(1'h0):(1'h0)]))));
          reg16 <= (wire11[(4'ha):(4'h8)] ?
              wire11 : $unsigned((&(wire9[(3'h6):(2'h3)] ?
                  wire10 : (reg15 <<< reg13)))));
        end
      else
        begin
          reg13 <= $unsigned((-wire8));
          if ((+(reg15 <<< $signed($signed((wire10 ? wire11 : wire10))))))
            begin
              reg14 <= (~|wire10);
              reg15 <= wire11[(3'h5):(2'h2)];
            end
          else
            begin
              reg14 <= (~|$signed($unsigned({$unsigned(reg13)})));
              reg15 <= {reg13};
              reg16 <= reg14[(3'h4):(1'h0)];
              reg17 <= {(!reg14[(2'h2):(1'h1)])};
            end
          reg18 <= $signed((reg14 == $unsigned((~^(wire9 ? reg13 : wire9)))));
          reg19 <= (|(!(7'h40)));
          reg20 <= {((^~(+reg18)) ?
                  $signed(wire11[(2'h2):(2'h2)]) : reg19[(2'h3):(2'h2)]),
              ((($unsigned(reg18) + reg15[(2'h2):(1'h1)]) != (&$unsigned(reg18))) ?
                  wire10[(2'h2):(1'h0)] : ((reg16 ?
                      (wire12 <<< wire12) : reg14) << ((^reg19) ?
                      {reg18, reg14} : (~reg18))))};
        end
      reg21 <= $signed(((|{reg15[(4'ha):(3'h5)],
          (reg17 ? reg13 : reg18)}) != (|reg19)));
      reg22 <= ($signed($unsigned((((8'hb3) & wire9) << (-reg15)))) >>> (wire12[(4'h8):(3'h6)] ?
          $signed($unsigned(reg17[(4'hd):(3'h7)])) : (reg20[(2'h3):(1'h1)] ?
              (^$signed(reg19)) : wire12[(3'h7):(2'h2)])));
      reg23 <= (wire12[(4'h8):(3'h4)] ^~ reg14);
    end
  assign wire24 = reg18[(4'hb):(4'h8)];
  assign wire25 = $unsigned($signed(((7'h40) << $unsigned($signed(reg14)))));
  assign wire26 = reg18;
  module27 #() modinst48 (wire47, clk, wire12, wire24, reg19, wire25);
  always
    @(posedge clk) begin
      reg49 <= ($signed(wire26) << ((((wire47 ?
                  wire12 : (8'h9d)) < $signed((8'ha3))) ?
              ($unsigned(wire25) ?
                  $signed((8'h9d)) : reg22[(2'h3):(1'h0)]) : {(~|wire9),
                  {wire10, wire8}}) ?
          $unsigned(({(8'hbb), wire26} ?
              (wire24 != wire12) : {reg21,
                  (8'hba)})) : {$unsigned($unsigned(wire25)),
              $unsigned(reg22)}));
    end
  always
    @(posedge clk) begin
      if (reg13[(3'h5):(3'h5)])
        begin
          reg50 <= $unsigned((reg22 ?
              (!$signed($unsigned(wire11))) : $signed($signed((~&wire10)))));
          reg51 <= $unsigned(wire47[(3'h4):(2'h2)]);
          reg52 <= (($unsigned(({reg23, (8'h9f)} - (~^reg21))) ?
              $signed(reg22) : ($unsigned(((8'haf) - wire26)) ?
                  (~|(reg20 ?
                      reg13 : (8'hae))) : reg13[(4'h8):(1'h1)])) >> wire24);
          reg53 <= (~^$signed(reg15[(4'hd):(3'h7)]));
        end
      else
        begin
          reg50 <= (reg19 ?
              ($unsigned((!reg51[(2'h2):(2'h2)])) ?
                  reg51[(1'h1):(1'h0)] : ($signed(reg22[(2'h2):(1'h0)]) >>> $unsigned($signed(reg49)))) : $signed(reg13));
          reg51 <= {(8'ha8)};
          if ($signed($signed($signed({(wire9 >> wire8),
              (reg15 ? reg21 : reg13)}))))
            begin
              reg52 <= $unsigned((((((8'ha2) ? wire47 : wire10) ?
                      (wire26 ?
                          wire25 : reg52) : $unsigned(reg21)) <<< (8'hbb)) ?
                  (($unsigned(reg52) + (~|wire11)) || ((reg16 < wire8) ^~ (~reg18))) : ($signed($signed(reg14)) << $signed(wire9[(3'h6):(3'h4)]))));
              reg53 <= $unsigned((($unsigned($signed(wire26)) == wire9[(3'h5):(3'h5)]) <= wire25));
              reg54 <= (+{reg23,
                  {reg18[(4'hd):(3'h5)], $signed((wire24 ? reg14 : reg51))}});
            end
          else
            begin
              reg52 <= (wire9 + reg53[(2'h3):(1'h1)]);
              reg53 <= (|($signed(reg52[(4'h9):(2'h2)]) ?
                  (~wire8) : (reg18[(5'h12):(4'h9)] ?
                      (&(wire9 ^~ reg49)) : (reg20 ?
                          (reg23 ?
                              wire12 : (8'hb9)) : wire24[(4'he):(4'he)]))));
              reg54 <= wire8[(1'h0):(1'h0)];
              reg55 <= (({(~&wire26[(4'ha):(4'h9)]), reg18[(5'h13):(2'h3)]} ?
                      ((!$unsigned((8'hb5))) ?
                          (~^{reg50}) : (&$signed(reg19))) : ({(reg50 ?
                              (8'hac) : (8'hae))} << reg13)) ?
                  reg52[(4'h8):(4'h8)] : $signed({wire26}));
            end
        end
      reg56 <= reg21[(1'h0):(1'h0)];
      if (reg21)
        begin
          reg57 <= reg19[(5'h10):(4'hf)];
        end
      else
        begin
          if ($signed((!$unsigned(({reg55} <<< $signed(wire12))))))
            begin
              reg57 <= reg55[(4'h9):(1'h0)];
            end
          else
            begin
              reg57 <= ($unsigned($unsigned(wire26)) ~^ $unsigned((reg19[(5'h10):(4'h8)] * (^(~&(8'had))))));
              reg58 <= $signed(wire9[(4'he):(4'h8)]);
            end
          reg59 <= {$signed((((!reg17) ? reg57 : (wire26 ? reg50 : reg22)) ?
                  ($unsigned(wire26) >> $signed(wire47)) : ((~&(8'ha6)) && (~|wire26)))),
              (|{$unsigned((^reg19)), $signed(reg21)})};
          if (reg17[(3'h4):(2'h2)])
            begin
              reg60 <= wire24[(4'h8):(1'h1)];
            end
          else
            begin
              reg60 <= (~$unsigned((~((wire9 ? reg50 : (8'hb6)) ?
                  $signed(reg18) : (reg53 >> reg14)))));
              reg61 <= $signed((~^({reg60, $unsigned(reg59)} ?
                  ($signed(reg13) > (+wire10)) : $signed($signed(wire12)))));
              reg62 <= (reg15[(2'h2):(1'h0)] ?
                  (wire26[(3'h5):(3'h4)] != $signed(wire47[(2'h3):(2'h2)])) : ((reg57 >>> (8'ha0)) << reg21[(1'h1):(1'h1)]));
              reg63 <= reg17[(4'h8):(2'h2)];
            end
          if (reg58[(2'h2):(1'h0)])
            begin
              reg64 <= $signed(reg63);
            end
          else
            begin
              reg64 <= reg21;
              reg65 <= (reg54 ?
                  {$unsigned(wire10[(1'h0):(1'h0)]),
                      $unsigned(reg23)} : $signed($signed($unsigned((~&reg19)))));
              reg66 <= $signed(reg60);
            end
        end
    end
  assign wire67 = ((^~reg55[(2'h3):(2'h3)]) ?
                      $unsigned($signed(wire10[(1'h1):(1'h1)])) : reg22[(1'h1):(1'h1)]);
  module68 #() modinst110 (wire109, clk, wire9, wire67, reg51, reg65);
  assign wire111 = reg16;
  assign wire112 = (7'h41);
endmodule

module module68
#(parameter param107 = (!(((((8'ha9) ? (8'hb4) : (7'h43)) ? (8'hb6) : ((8'ha5) ? (8'hbb) : (8'ha4))) ? {((8'ha8) ? (8'ha2) : (8'hb2)), {(7'h41), (7'h40)}} : (((7'h42) ? (8'ha7) : (8'h9d)) ? ((8'hba) ? (8'ha1) : (8'hb3)) : ((8'had) ^ (8'hbf)))) >> ((&{(8'hbc), (8'hbb)}) ? {((8'h9c) ? (8'hb4) : (8'h9e)), ((8'hb7) & (8'had))} : ({(8'hb8)} && {(8'hb6), (8'h9e)})))), 
parameter param108 = {(~&(~&(&(param107 ? (8'h9f) : (7'h42)))))})
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire72;
  input wire [(3'h7):(1'h0)] wire71;
  input wire [(4'h9):(1'h0)] wire70;
  input wire [(5'h11):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg82,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire73 = $signed(((8'hab) ?
                      $unsigned($signed((~|wire71))) : $unsigned({$unsigned(wire69),
                          $unsigned((8'hb7))})));
  assign wire74 = ($signed({($unsigned(wire71) != wire69[(4'hb):(2'h3)])}) * (+(~^$signed((wire70 || wire69)))));
  always
    @(posedge clk) begin
      reg75 <= ((wire73[(4'h8):(3'h4)] & wire73[(1'h1):(1'h0)]) ?
          {{(!(wire70 ? wire72 : wire74))},
              ($unsigned($signed(wire70)) ?
                  wire72 : wire73[(3'h7):(2'h2)])} : wire73[(1'h1):(1'h1)]);
      reg76 <= {(8'hbb), $signed($unsigned($signed((wire69 <<< (8'hae)))))};
      reg77 <= wire70[(1'h0):(1'h0)];
    end
  assign wire78 = (wire74[(3'h4):(2'h3)] - $signed(reg76));
  assign wire79 = {reg77[(4'ha):(3'h7)]};
  assign wire80 = wire72[(4'h9):(3'h5)];
  assign wire81 = ($unsigned(reg76) ?
                      ((&($signed((8'hbc)) > (wire71 ? wire74 : wire78))) ?
                          {(^wire78[(3'h5):(2'h2)]),
                              ((wire69 == (8'hb6)) > $signed(wire72))} : (|((8'ha5) ^ wire71[(3'h6):(2'h3)]))) : $unsigned((wire73[(3'h4):(2'h3)] ?
                          wire74[(1'h1):(1'h1)] : $unsigned((8'hb1)))));
  always
    @(posedge clk) begin
      reg82 <= wire80[(2'h3):(2'h2)];
    end
  assign wire83 = (~|(-((~|wire74) + $unsigned(reg82[(3'h6):(1'h1)]))));
  assign wire84 = $signed((+($signed($unsigned(wire69)) ?
                      (&reg82[(1'h1):(1'h1)]) : wire74)));
  assign wire85 = reg77[(1'h1):(1'h1)];
  assign wire86 = wire78;
  always
    @(posedge clk) begin
      if ((~^wire71))
        begin
          reg87 <= (reg82[(3'h6):(3'h4)] ~^ $signed(($signed($signed(wire81)) ?
              (~&wire72[(3'h5):(3'h4)]) : $unsigned($signed(wire69)))));
        end
      else
        begin
          reg87 <= $signed($unsigned(({(!(8'hac))} ^ {(8'hb4)})));
          reg88 <= reg75;
          if ($signed(($unsigned($signed((-(7'h42)))) ?
              $signed(wire83[(4'h8):(4'h8)]) : ({((8'hae) && wire73),
                      ((8'ha2) ? reg82 : wire80)} ?
                  wire73 : ((wire72 ? reg82 : reg88) ?
                      (~(8'hab)) : wire81[(1'h0):(1'h0)])))))
            begin
              reg89 <= reg77[(2'h2):(1'h1)];
              reg90 <= {$unsigned($signed((+(reg88 && (8'hbb)))))};
              reg91 <= wire70;
              reg92 <= ((!(({wire73, reg88} << wire74[(4'ha):(3'h7)]) ?
                  ((wire72 > wire73) ?
                      wire79 : wire80) : wire80[(3'h6):(3'h4)])) && wire74);
              reg93 <= (!(^(~|{reg82})));
            end
          else
            begin
              reg89 <= ($signed($unsigned(($unsigned((8'ha9)) ?
                  {(8'hab)} : wire69))) ^~ (!reg77));
              reg90 <= reg76;
              reg91 <= wire69;
              reg92 <= $signed(reg75);
              reg93 <= $signed((~|wire86[(4'hc):(2'h2)]));
            end
          if ($signed((reg88[(1'h1):(1'h1)] & (($signed(wire84) ?
                  reg91[(3'h6):(3'h6)] : (~|(7'h41))) ?
              $signed((^~reg87)) : ((wire83 == reg77) || (~wire72))))))
            begin
              reg94 <= wire71;
              reg95 <= reg87;
            end
          else
            begin
              reg94 <= $unsigned((wire85 > $signed((8'hb4))));
              reg95 <= reg75[(4'h8):(2'h2)];
              reg96 <= (~({wire85, $signed((wire72 ? wire74 : wire83))} ?
                  ($unsigned(reg77[(4'h9):(3'h4)]) >>> $signed(reg95)) : (-reg90[(2'h2):(2'h2)])));
              reg97 <= reg95[(4'h8):(2'h2)];
            end
        end
      reg98 <= reg82[(4'ha):(2'h2)];
    end
  assign wire99 = $unsigned((((!(wire80 ? reg95 : reg88)) ?
                      wire69 : (reg82[(3'h5):(1'h0)] ?
                          reg91[(1'h1):(1'h0)] : (|wire83))) <<< reg91[(2'h2):(1'h0)]));
  assign wire100 = wire73[(4'h8):(3'h7)];
  assign wire101 = $signed(wire71);
  assign wire102 = ((~|(8'ha2)) ?
                       ($unsigned((~&$signed(reg95))) & (^~$signed((reg98 ?
                           reg76 : reg91)))) : reg98);
  assign wire103 = (wire85[(2'h3):(2'h3)] & (~^$unsigned($signed(wire102[(4'hd):(2'h2)]))));
  assign wire104 = ({reg98} && ($unsigned(reg93[(1'h0):(1'h0)]) >>> $signed(wire86[(3'h5):(3'h5)])));
  assign wire105 = (~&wire85);
  assign wire106 = wire85[(3'h5):(3'h4)];
endmodule

module module27
#(parameter param45 = (((8'hb8) ? {{((8'hab) ? (8'h9e) : (8'hb3))}} : ((^(&(8'hba))) + (8'hb1))) ? {((((8'hbf) ? (8'ha9) : (8'ha4)) ? (!(7'h44)) : ((8'ha0) ? (8'hac) : (8'hbd))) ? (((8'hb8) - (8'hbf)) >= ((8'hb9) < (8'ha5))) : (((8'hb2) ? (7'h41) : (8'ha2)) ? ((8'ha2) << (7'h43)) : ((8'h9e) ? (8'ha8) : (8'haa))))} : (((!((8'hb7) ? (8'ha6) : (8'hba))) ? {((8'hb4) ? (8'h9e) : (7'h40))} : ((^~(7'h40)) == {(8'hb1), (8'ha1)})) ? ((((8'hb5) - (8'ha7)) ? (7'h44) : {(8'ha8)}) != (&((8'ha3) * (8'h9f)))) : (8'hae))), 
parameter param46 = ((((&(~&param45)) >>> (&(&param45))) | {((param45 ^ param45) | (~|param45)), param45}) >> (((-(param45 ^~ param45)) ? param45 : (8'hac)) ? (((8'h9e) ? (param45 ? param45 : param45) : (~param45)) ? param45 : param45) : ((+(param45 ? param45 : (8'hab))) <= (((8'hbb) ? param45 : param45) <= (param45 ? (8'ha3) : (8'hbd)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  assign y = {wire44,
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
                 (1'h0)};
  assign wire32 = (8'had);
  assign wire33 = {$unsigned((&{$signed(wire32), $unsigned(wire30)}))};
  assign wire34 = $unsigned(wire31);
  assign wire35 = ($signed(wire30) >> (7'h44));
  assign wire36 = ((&wire29) ?
                      wire31 : {wire30,
                          $unsigned($unsigned($unsigned(wire32)))});
  assign wire37 = ((wire29 ? wire31 : wire31) ?
                      ((^~({wire29, wire33} ?
                          (wire35 ^~ (8'ha4)) : (wire33 ?
                              wire34 : wire36))) >>> ($unsigned($unsigned(wire31)) ?
                          wire34 : $signed($unsigned(wire34)))) : (&wire30[(4'hb):(4'h8)]));
  assign wire38 = $signed({({wire34} >>> wire36)});
  assign wire39 = $signed((+(wire35 > {((8'hab) ? wire32 : wire35)})));
  assign wire40 = wire28[(3'h5):(2'h3)];
  assign wire41 = $unsigned(wire28);
  assign wire42 = (~^(|$signed(({(8'h9c), wire31} > $unsigned((8'hb7))))));
  assign wire43 = $signed({wire37[(4'he):(4'hc)]});
  assign wire44 = (~$unsigned(wire28[(4'hc):(4'h8)]));
endmodule

module module225
#(parameter param248 = (~&{(((~(8'ha8)) ? ((8'hba) ? (8'hbe) : (8'hb2)) : ((7'h43) ? (8'ha3) : (8'hbf))) ? (((8'ha0) ^ (8'ha0)) || ((8'hb6) ? (8'hbd) : (8'hbd))) : (((8'h9f) ? (8'hbe) : (8'ha6)) + (~(8'hba)))), (&(((8'hac) ? (8'ha4) : (8'haf)) >> ((8'haf) == (8'hb2))))}))
(y, clk, wire229, wire228, wire227, wire226);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire229;
  input wire signed [(3'h5):(1'h0)] wire228;
  input wire [(4'hf):(1'h0)] wire227;
  input wire [(5'h13):(1'h0)] wire226;
  wire [(2'h3):(1'h0)] wire247;
  wire signed [(3'h7):(1'h0)] wire246;
  wire [(5'h13):(1'h0)] wire244;
  wire signed [(4'hc):(1'h0)] wire235;
  wire signed [(3'h5):(1'h0)] wire234;
  wire signed [(3'h5):(1'h0)] wire233;
  wire signed [(5'h14):(1'h0)] wire232;
  wire signed [(5'h13):(1'h0)] wire231;
  wire signed [(3'h6):(1'h0)] wire230;
  reg signed [(4'hf):(1'h0)] reg245 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg242 = (1'h0);
  reg [(5'h14):(1'h0)] reg241 = (1'h0);
  reg [(2'h2):(1'h0)] reg240 = (1'h0);
  reg [(3'h6):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg238 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg237 = (1'h0);
  reg [(4'hc):(1'h0)] reg236 = (1'h0);
  assign y = {wire247,
                 wire246,
                 wire244,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 reg245,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 (1'h0)};
  assign wire230 = ((~^(((+wire227) <<< ((7'h43) ? wire227 : (8'ha3))) ?
                           wire229 : ((~wire228) ?
                               $unsigned(wire228) : $signed(wire227)))) ?
                       wire227[(1'h1):(1'h0)] : (~&($unsigned((wire229 ?
                               wire228 : wire227)) ?
                           (wire229 ?
                               $signed((8'hba)) : (wire226 + wire228)) : $signed(((8'hbe) ?
                               (8'hb7) : wire229)))));
  assign wire231 = ($signed((wire230[(3'h4):(2'h2)] && ($signed(wire228) >>> wire228[(1'h1):(1'h1)]))) < (^wire230[(1'h0):(1'h0)]));
  assign wire232 = (!(wire229 + (wire230[(1'h0):(1'h0)] >> $signed({wire227,
                       wire230}))));
  assign wire233 = ((wire231[(4'h9):(3'h5)] ?
                       wire228[(1'h0):(1'h0)] : {(~|(&wire232))}) + (($unsigned({wire228,
                           wire232}) - $signed((wire229 >>> (8'hba)))) ?
                       ((wire232 ? $unsigned(wire231) : $unsigned(wire229)) ?
                           ($signed(wire226) ?
                               wire232 : $unsigned(wire230)) : (-wire232)) : {wire232[(3'h5):(2'h2)]}));
  assign wire234 = (wire227 ?
                       wire226 : $unsigned($signed(wire228[(2'h3):(1'h0)])));
  assign wire235 = $unsigned(wire229);
  always
    @(posedge clk) begin
      if ({wire232[(4'hd):(4'hd)]})
        begin
          reg236 <= (^(((wire228[(3'h5):(1'h1)] && (wire228 ?
              wire235 : (8'ha0))) ~^ $unsigned(wire226[(3'h4):(1'h1)])) != (~^$signed((^wire230)))));
          if (reg236)
            begin
              reg237 <= ((($signed(wire227) & $unsigned($unsigned(wire226))) ?
                  ((~&wire226[(5'h12):(5'h11)]) ?
                      wire229 : {wire227[(2'h2):(1'h1)]}) : $unsigned($signed($unsigned((8'hbd))))) * wire231[(3'h5):(1'h1)]);
              reg238 <= wire233;
              reg239 <= wire230[(3'h4):(2'h3)];
            end
          else
            begin
              reg237 <= (^wire230);
              reg238 <= $unsigned({$signed(wire230[(1'h1):(1'h0)])});
            end
          reg240 <= wire231[(5'h10):(4'h8)];
        end
      else
        begin
          reg236 <= reg237[(1'h1):(1'h0)];
          reg237 <= ((~^((((8'ha7) && reg240) > $unsigned(wire232)) ?
                  $signed($signed(reg240)) : $unsigned(wire235[(1'h0):(1'h0)]))) ?
              (wire226 ?
                  $signed($unsigned((~&wire234))) : wire226[(5'h11):(3'h4)]) : ($unsigned(wire229) ?
                  ($signed(wire232) >= wire229) : {($unsigned(wire231) ?
                          $unsigned((8'ha1)) : (|wire227)),
                      ((wire227 ? reg236 : wire233) ?
                          wire233[(1'h0):(1'h0)] : (~&wire230))}));
          reg238 <= reg236[(2'h2):(1'h1)];
        end
      reg241 <= $unsigned(reg238[(3'h6):(3'h6)]);
      reg242 <= wire227[(4'hb):(2'h2)];
      reg243 <= (-wire234);
    end
  assign wire244 = wire231[(4'hd):(1'h1)];
  always
    @(posedge clk) begin
      reg245 <= $signed(wire231);
    end
  assign wire246 = $unsigned(wire235);
  assign wire247 = $unsigned(reg238);
endmodule

module module147  (y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'h271):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire152;
  input wire signed [(3'h4):(1'h0)] wire151;
  input wire [(4'he):(1'h0)] wire150;
  input wire signed [(4'hc):(1'h0)] wire149;
  input wire [(5'h13):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire207;
  wire [(5'h13):(1'h0)] wire206;
  wire signed [(5'h10):(1'h0)] wire205;
  wire signed [(4'h9):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire203;
  wire signed [(5'h14):(1'h0)] wire202;
  wire signed [(4'hf):(1'h0)] wire191;
  wire [(5'h13):(1'h0)] wire190;
  wire signed [(3'h7):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire175;
  wire signed [(3'h6):(1'h0)] wire174;
  wire signed [(4'h9):(1'h0)] wire173;
  wire signed [(5'h11):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire161;
  wire signed [(2'h3):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire159;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(2'h2):(1'h0)] wire157;
  reg signed [(3'h6):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(3'h6):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg signed [(4'he):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(3'h4):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(2'h3):(1'h0)] reg153 = (1'h0);
  assign y = {wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire191,
                 wire190,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
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
                 reg179,
                 reg178,
                 reg177,
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
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg153 <= (|($signed(($signed((8'hbd)) - $signed(wire152))) ?
          $signed($signed($unsigned(wire151))) : wire152[(4'he):(4'hc)]));
      reg154 <= (wire151[(3'h4):(3'h4)] ?
          ($signed((-$signed(wire150))) <<< ($signed($signed(wire152)) & $unsigned($unsigned(wire149)))) : wire152);
      reg155 <= (wire148 << $signed($signed((^~(wire150 - reg153)))));
      reg156 <= wire151[(2'h3):(1'h1)];
    end
  assign wire157 = ($signed($unsigned(reg153[(2'h2):(1'h0)])) > (^~$unsigned(reg156)));
  assign wire158 = $signed(wire148[(4'hc):(4'hb)]);
  assign wire159 = wire151;
  assign wire160 = (+(((^(wire148 ?
                       wire157 : wire149)) ^~ reg154) <= {$unsigned(wire148[(3'h7):(2'h2)]),
                       ((wire151 >= reg155) || wire149[(4'h9):(4'h8)])}));
  assign wire161 = reg156[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ($unsigned(reg154))
        begin
          reg162 <= reg154[(1'h0):(1'h0)];
          reg163 <= (wire157 ?
              ($signed(($unsigned(wire148) ^ $signed(reg156))) >> ({{wire157}} ?
                  ((wire149 ? wire148 : wire160) ?
                      wire149 : $unsigned(wire150)) : (~$signed(reg156)))) : ({(^$signed(reg153))} ?
                  $signed(wire159) : (!wire149[(4'hc):(4'h9)])));
          reg164 <= {(+($signed(wire151) | {$signed(wire161)})), wire158};
          reg165 <= $signed($unsigned((wire150[(1'h0):(1'h0)] ?
              wire160 : reg162)));
          reg166 <= {wire160[(2'h2):(1'h0)]};
        end
      else
        begin
          if ((wire159 | wire159))
            begin
              reg162 <= $unsigned(wire159[(4'he):(3'h5)]);
              reg163 <= ({wire161, (8'ha4)} ?
                  wire158[(3'h5):(2'h2)] : $signed((&((wire152 ?
                          reg163 : reg162) ?
                      {reg154, wire159} : reg153))));
              reg164 <= (((8'h9f) ?
                  $signed(($unsigned(reg154) ?
                      (wire152 ?
                          reg154 : reg155) : (reg156 + reg166))) : $signed(($signed(wire161) ?
                      wire149 : $unsigned(wire150)))) <= $signed(reg155[(3'h7):(1'h1)]));
              reg165 <= reg163;
            end
          else
            begin
              reg162 <= ($signed(reg165[(1'h1):(1'h0)]) ?
                  reg155 : ((8'hb0) ?
                      $signed((wire158 + (+wire158))) : $signed(wire159)));
              reg163 <= $signed(reg155[(2'h3):(1'h0)]);
              reg164 <= wire152;
              reg165 <= wire150;
              reg166 <= wire158;
            end
        end
      reg167 <= reg163;
      if ({((({(8'hbb), wire152} ? {wire151, wire158} : (-(8'h9e))) ?
                  $signed($unsigned(reg163)) : $signed((reg154 ?
                      (8'hbb) : (8'had)))) ?
              (~(-wire161[(3'h6):(2'h2)])) : (~^({(8'hb3),
                  reg167} | (^~reg162))))})
        begin
          reg168 <= reg163;
        end
      else
        begin
          reg168 <= (~&(~^reg166));
          reg169 <= ((reg153[(1'h0):(1'h0)] ?
              $unsigned(($unsigned(reg162) ?
                  (~^reg168) : reg164)) : reg153) || $unsigned(wire148[(4'hc):(3'h6)]));
          reg170 <= (8'haf);
          reg171 <= wire150;
        end
    end
  assign wire172 = {wire152};
  assign wire173 = $signed($signed($signed((((8'haa) > wire157) ?
                       $signed(reg167) : wire157[(1'h0):(1'h0)]))));
  assign wire174 = ((reg169[(3'h4):(1'h0)] > ($unsigned(reg168) ?
                           {reg163[(4'hb):(4'ha)]} : $signed($signed(reg167)))) ?
                       reg154[(4'hc):(4'hb)] : reg166);
  assign wire175 = $unsigned((7'h44));
  assign wire176 = (8'hb0);
  always
    @(posedge clk) begin
      if ({({((!reg163) && $signed(wire161))} ?
              $unsigned((!(reg153 <<< (8'ha8)))) : wire174[(3'h4):(1'h1)]),
          reg164[(1'h0):(1'h0)]})
        begin
          if ($signed((((-wire175[(4'hd):(4'h9)]) * (wire150[(1'h0):(1'h0)] != wire151)) >>> (($signed(reg153) ?
                  $unsigned(reg156) : {reg171, wire172}) ?
              $unsigned(wire159) : {$unsigned(wire158)}))))
            begin
              reg177 <= (!$unsigned($signed((^reg167))));
              reg178 <= {{$unsigned(((8'hb9) << $unsigned(wire176))),
                      $unsigned(($unsigned(wire175) ?
                          (reg164 > reg169) : reg163))}};
              reg179 <= (((((~wire150) * $signed(wire158)) ?
                      reg169 : reg156[(3'h6):(3'h5)]) ?
                  (|reg155) : wire150) && (-({reg162[(2'h2):(2'h2)],
                  {reg171}} >> ((reg169 <= wire150) < (reg162 && wire172)))));
              reg180 <= (-reg169[(2'h2):(1'h0)]);
              reg181 <= $unsigned((wire174 <<< (($unsigned((7'h42)) ^ ((8'hbd) ?
                  (8'h9d) : reg153)) - ($signed(wire176) ?
                  (wire152 + wire151) : $signed(wire150)))));
            end
          else
            begin
              reg177 <= $signed(($unsigned(wire151) + $signed(((reg156 == reg181) ?
                  (wire173 ? reg170 : reg178) : (reg154 ^~ wire150)))));
              reg178 <= reg153[(2'h2):(1'h1)];
            end
          reg182 <= (-((8'ha5) ?
              wire157[(1'h0):(1'h0)] : (&$unsigned($unsigned(wire149)))));
          reg183 <= reg163[(4'hc):(2'h3)];
          if (((!{wire157,
              (reg179[(2'h3):(1'h1)] ?
                  {reg183} : ((8'ha3) ?
                      wire157 : reg179))}) << $signed(reg181[(4'he):(3'h5)])))
            begin
              reg184 <= ($signed($signed($signed($signed(reg171)))) && (-$unsigned($signed((8'ha9)))));
              reg185 <= wire148;
              reg186 <= $unsigned(wire175[(5'h13):(2'h2)]);
            end
          else
            begin
              reg184 <= {{$unsigned({$unsigned(wire174), (~^(8'hb9))})},
                  $unsigned(((8'hb6) ? $signed(wire149) : reg167))};
            end
          reg187 <= wire151[(2'h2):(1'h1)];
        end
      else
        begin
          reg177 <= ($signed(reg171[(2'h3):(1'h1)]) ?
              $unsigned((~^reg155[(1'h0):(1'h0)])) : {(((|reg165) | {(8'hb6),
                      (8'ha6)}) ^ wire152)});
          if ($signed(wire159))
            begin
              reg178 <= (reg183[(4'hd):(2'h2)] ?
                  (~&reg168) : {($unsigned((reg170 ?
                          reg179 : wire159)) + reg156),
                      (reg156[(4'hb):(3'h7)] ?
                          reg163[(4'h8):(1'h0)] : (&(^~wire176)))});
              reg179 <= {(((reg169[(1'h1):(1'h1)] ?
                              $unsigned(reg168) : wire152) ?
                          wire148 : ((8'h9f) >= ((8'h9d) ? reg179 : reg162))) ?
                      (-(reg156[(4'h9):(4'h9)] ?
                          (!(8'hab)) : ((7'h40) ?
                              (8'ha4) : reg180))) : ((^{wire176}) & $unsigned($signed(wire175)))),
                  $signed((((-wire176) ?
                          ((8'h9c) ? wire151 : reg171) : $unsigned((8'had))) ?
                      $signed((~reg169)) : reg184[(1'h0):(1'h0)]))};
              reg180 <= reg178;
              reg181 <= $signed(((^~$signed(reg180)) ^ ($signed(wire158) ?
                  ((+(8'ha1)) & (reg177 ?
                      wire160 : wire158)) : (wire175 ^~ $signed(reg180)))));
            end
          else
            begin
              reg178 <= {$signed(reg162[(1'h1):(1'h0)]),
                  ((8'h9d) ^~ $signed(reg184[(2'h2):(2'h2)]))};
              reg179 <= (($unsigned(($unsigned(wire151) >> ((8'hbd) ?
                      (8'hbe) : wire152))) >> (+$signed({wire172}))) ?
                  $signed(wire174) : (!reg177));
              reg180 <= wire148[(4'ha):(2'h3)];
              reg181 <= wire150[(3'h6):(1'h0)];
            end
        end
      reg188 <= {wire148};
      reg189 <= wire161;
    end
  assign wire190 = $unsigned((!(~({reg181} & $signed(wire148)))));
  assign wire191 = $signed(reg180);
  always
    @(posedge clk) begin
      if ($signed(($signed(wire151[(2'h3):(1'h1)]) << (7'h42))))
        begin
          if ({({(!$signed(reg183)),
                  (|reg165[(1'h1):(1'h0)])} ~^ $unsigned(wire175)),
              wire158})
            begin
              reg192 <= reg153[(1'h1):(1'h0)];
              reg193 <= (+(|$unsigned(reg164[(1'h1):(1'h1)])));
            end
          else
            begin
              reg192 <= (~(7'h41));
            end
        end
      else
        begin
          reg192 <= (((((wire172 >> reg165) ? reg162 : (-reg182)) ?
                  $unsigned((reg153 ? wire175 : reg193)) : (~^reg166)) ?
              ((|$signed(reg156)) ?
                  (&(reg180 || reg164)) : (~|$unsigned(wire172))) : $signed(((|reg186) ^~ reg168[(3'h7):(3'h5)]))) ^~ $unsigned(($unsigned($signed(wire174)) ?
              $unsigned((8'ha4)) : {(wire173 != reg156)})));
          if (reg184)
            begin
              reg193 <= (reg179 < reg155);
              reg194 <= ({$signed($unsigned((wire174 ? reg187 : reg162))),
                      $signed(reg167[(1'h0):(1'h0)])} ?
                  $unsigned($signed(wire191)) : reg155);
              reg195 <= reg168;
            end
          else
            begin
              reg193 <= reg170[(3'h4):(3'h4)];
              reg194 <= (|(~$signed((^~(reg177 ^~ wire173)))));
              reg195 <= reg184;
            end
          reg196 <= (|(&({(reg185 ?
                  reg165 : reg180)} || wire160[(1'h0):(1'h0)])));
          reg197 <= (~^$unsigned(wire149));
          reg198 <= (($unsigned(wire157[(2'h2):(2'h2)]) ?
                  ((reg192 ?
                      $signed(reg170) : $unsigned((8'hb4))) <= reg162) : $signed(reg181)) ?
              ($unsigned($unsigned(reg170[(4'hd):(3'h5)])) ?
                  ((~|(reg154 ? reg164 : reg153)) ?
                      $signed({wire174}) : $unsigned((~reg193))) : $signed((reg183[(4'ha):(4'h8)] | reg197))) : ($unsigned(reg162) ?
                  $unsigned($unsigned(reg187[(2'h2):(1'h1)])) : (reg166 != reg180[(3'h5):(2'h2)])));
        end
      reg199 <= $signed((((~{reg168}) == $signed((reg195 ?
          wire161 : reg188))) + $signed(reg185[(2'h2):(1'h1)])));
      reg200 <= (reg195 ?
          reg153[(2'h3):(2'h2)] : $unsigned($signed($signed($signed(wire172)))));
      reg201 <= (~reg187[(3'h7):(3'h6)]);
    end
  assign wire202 = $unsigned(($signed((^~wire157[(2'h2):(1'h0)])) || ((+$signed(wire151)) - $signed(wire161[(4'he):(1'h1)]))));
  assign wire203 = $unsigned((8'h9d));
  assign wire204 = {wire149[(3'h5):(1'h0)]};
  assign wire205 = ((reg156[(2'h3):(2'h2)] ?
                           (((~|wire157) << $signed(reg198)) ^~ (^~(reg156 ?
                               (8'ha2) : reg180))) : {reg186, (8'hac)}) ?
                       $signed($unsigned({$unsigned(reg169),
                           reg155[(3'h5):(2'h3)]})) : $unsigned($signed($unsigned((^reg154)))));
  assign wire206 = $signed($signed(reg171));
  assign wire207 = {wire204[(3'h6):(2'h2)],
                       $unsigned(((^~wire158[(3'h7):(3'h5)]) + reg193[(2'h3):(2'h3)]))};
endmodule
