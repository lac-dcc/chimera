module top
#(parameter param276 = ((!(((|(8'ha3)) ^ (8'hb1)) != (((8'hb6) ? (8'hba) : (8'hbe)) ? ((8'ha2) ? (8'ha0) : (8'hb4)) : {(8'haf), (8'hbb)}))) ? (^((((8'haf) ? (8'hac) : (8'hb3)) ? {(8'hb5)} : ((8'h9f) > (8'hae))) && (((7'h42) > (8'hbc)) <<< ((8'hb3) ? (8'hb6) : (8'ha9))))) : {(+(+((7'h40) > (8'hb2)))), {{((8'haa) && (8'hbe))}, {((8'ha7) ? (8'hac) : (8'hbe))}}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire270;
  wire [(4'he):(1'h0)] wire261;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg275 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg274 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg273 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg271 = (1'h0);
  reg [(5'h15):(1'h0)] reg269 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg268 = (1'h0);
  reg [(4'h9):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg266 = (1'h0);
  reg [(3'h5):(1'h0)] reg265 = (1'h0);
  reg [(5'h10):(1'h0)] reg264 = (1'h0);
  reg [(3'h6):(1'h0)] reg263 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire270,
                 wire261,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((~&$unsigned($signed(wire1))));
  assign wire6 = {wire2,
                     (~^($signed($unsigned(wire4)) >= $signed((wire4 ?
                         wire2 : wire1))))};
  assign wire7 = ({wire6} <= $signed(wire2));
  assign wire8 = $signed(($signed(wire0) ?
                     ((~|wire6) ?
                         $signed((wire2 & wire2)) : ((wire5 == wire6) >>> wire5[(4'h8):(1'h0)])) : (wire2 != (wire1[(1'h1):(1'h0)] ?
                         (-wire2) : wire1))));
  always
    @(posedge clk) begin
      reg9 <= (~|(($unsigned((wire1 ~^ (8'ha2))) >>> ({(8'haf)} <= (wire2 || wire6))) ?
          ((8'h9c) ^ wire4[(3'h4):(3'h4)]) : $unsigned(wire6)));
      reg10 <= (((8'ha9) || $signed((^(wire1 * reg9)))) ~^ (|(wire4 ?
          wire8[(3'h4):(3'h4)] : $signed($signed(wire1)))));
      reg11 <= reg10[(5'h12):(2'h2)];
    end
  assign wire12 = ((8'haf) ?
                      $signed($unsigned($unsigned(wire2[(2'h2):(1'h1)]))) : $unsigned(wire3[(4'hc):(4'hc)]));
  assign wire13 = ((|((+$signed(wire12)) | (~$signed(wire3)))) ?
                      $signed({(((8'hb5) <<< (8'hbf)) + wire4[(1'h0):(1'h0)])}) : $unsigned((~(((8'ha3) ?
                              (8'hbe) : wire12) ?
                          (wire0 ? (8'ha0) : wire4) : wire3[(4'h8):(2'h2)]))));
  assign wire14 = ($signed(($signed($signed(wire1)) > $unsigned((-reg9)))) ?
                      wire6 : (~&(wire6 >= wire7[(4'h9):(3'h6)])));
  assign wire15 = wire5;
  assign wire16 = wire14[(4'h8):(3'h7)];
  module17 #() modinst262 (.wire19(wire12), .y(wire261), .wire21(wire3), .wire18(wire13), .wire20(wire2), .clk(clk));
  always
    @(posedge clk) begin
      reg263 <= (($signed(wire12) ?
          $signed($unsigned({wire3})) : ($unsigned((reg9 ? (8'hba) : wire5)) ?
              wire261 : wire1)) >> {$unsigned(reg10[(5'h10):(2'h3)])});
      reg264 <= $signed(($signed({$unsigned(wire15), (reg10 || wire0)}) ?
          wire6[(2'h3):(2'h2)] : wire4));
      if ($unsigned(wire16[(3'h6):(3'h5)]))
        begin
          reg265 <= (8'ha6);
          reg266 <= (wire12[(1'h1):(1'h1)] ? {reg11} : wire0);
        end
      else
        begin
          reg265 <= wire13;
          reg266 <= $unsigned({({((8'hb4) ? wire13 : wire5)} ^ (8'hae)),
              {reg11, ($unsigned(reg9) * (wire5 <<< (8'haf)))}});
          reg267 <= ((wire2 ?
              (~$unsigned({reg265,
                  wire0})) : ((8'hb0) >>> (&(wire5 <<< wire2)))) < ((-reg265) ?
              wire6 : ($signed($signed(reg266)) >= $unsigned((wire6 != wire16)))));
          reg268 <= $signed($unsigned($unsigned((wire7 > (wire6 ?
              reg266 : wire13)))));
          reg269 <= wire13;
        end
    end
  assign wire270 = $signed($signed($signed({(^~reg265)})));
  always
    @(posedge clk) begin
      reg271 <= $signed($unsigned(({(wire5 & reg267), $unsigned(reg263)} ?
          $unsigned((-reg11)) : wire7)));
      reg272 <= ({($signed(((8'had) && (8'hb9))) ?
                  wire270[(3'h5):(1'h1)] : reg9),
              (~$unsigned($signed(reg267)))} ?
          reg266 : wire5[(2'h3):(1'h1)]);
      reg273 <= reg11;
      reg274 <= (((((~reg269) ? (wire0 ^~ reg269) : wire15) ?
              wire15[(4'h9):(1'h1)] : (~&(~|wire7))) >> reg264[(3'h6):(3'h6)]) ?
          reg263 : (^~$unsigned($signed($signed(wire2)))));
      reg275 <= $signed((($signed((8'hbe)) != reg273) < reg264[(3'h5):(3'h5)]));
    end
endmodule

module module17
#(parameter param259 = (((((8'hbe) < {(7'h43)}) * (((8'hb3) ? (7'h40) : (8'hbe)) ? ((8'ha6) ? (7'h41) : (8'hb6)) : ((8'hbc) || (8'ha0)))) ? (({(8'haa), (8'ha3)} ? (~|(8'ha2)) : ((8'ha8) ? (7'h40) : (8'hbd))) ? (^~((8'hba) ? (8'hb2) : (8'hab))) : {((8'ha6) ? (8'ha7) : (7'h40))}) : ((+{(8'hb0)}) && (!((8'ha3) >>> (8'haa))))) != (8'ha6)), 
parameter param260 = ((|(|param259)) * (param259 && (~^(((8'ha2) << param259) ? (param259 || param259) : (param259 ? param259 : param259))))))
(y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire258;
  wire [(5'h11):(1'h0)] wire257;
  wire [(4'hf):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire159;
  wire signed [(4'h8):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire161;
  wire [(4'he):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire255;
  assign y = {wire258,
                 wire257,
                 wire139,
                 wire95,
                 wire94,
                 wire22,
                 wire23,
                 wire49,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire92,
                 wire156,
                 wire158,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire255,
                 (1'h0)};
  assign wire22 = wire18[(4'he):(4'ha)];
  assign wire23 = (+$signed(wire18[(4'hc):(4'hc)]));
  module24 #() modinst50 (.wire25(wire23), .wire26(wire22), .wire27(wire19), .clk(clk), .y(wire49), .wire28(wire20));
  assign wire51 = $unsigned(wire20[(3'h4):(2'h2)]);
  assign wire52 = $unsigned((~^(~^wire20)));
  assign wire53 = $signed(wire22);
  assign wire54 = (((($unsigned(wire21) ~^ (-wire51)) ?
                              (8'hbc) : (~|wire22[(3'h4):(1'h1)])) ?
                          {({wire49} ? $signed(wire21) : (wire51 << (8'h9e))),
                              $unsigned((wire53 < wire49))} : $signed($unsigned(wire19[(5'h13):(4'hd)]))) ?
                      ((wire53 ?
                          wire18[(4'hb):(4'hb)] : $unsigned(wire52)) | wire52[(3'h6):(1'h0)]) : (~&(wire20[(4'h9):(4'h8)] ?
                          ($unsigned(wire52) & (wire23 ^ wire51)) : wire23[(3'h7):(1'h1)])));
  assign wire55 = {wire21[(4'hb):(3'h5)]};
  module56 #() modinst93 (.wire61(wire51), .clk(clk), .wire60(wire23), .wire58(wire21), .wire59(wire55), .y(wire92), .wire57(wire53));
  assign wire94 = $signed(wire19[(5'h10):(4'h8)]);
  assign wire95 = wire92;
  module96 #() modinst140 (.wire97(wire18), .wire100(wire95), .y(wire139), .wire99(wire51), .wire101(wire21), .clk(clk), .wire98(wire55));
  module141 #() modinst157 (.wire144(wire52), .wire142(wire23), .wire143(wire139), .clk(clk), .wire145(wire22), .y(wire156));
  assign wire158 = (&wire49);
  assign wire159 = ($signed((wire19 >>> $signed(wire92[(4'ha):(1'h1)]))) >>> wire139[(3'h7):(2'h3)]);
  assign wire160 = wire52;
  assign wire161 = wire94[(3'h5):(2'h3)];
  assign wire162 = ($unsigned($unsigned((|((8'hac) + (8'hbc))))) ?
                       {wire21} : (wire139[(4'hb):(4'h8)] ^ wire92));
  module163 #() modinst256 (wire255, clk, wire159, wire95, wire160, wire158, wire156);
  assign wire257 = {($unsigned((^~(!wire51))) && wire94[(5'h11):(3'h5)])};
  assign wire258 = ({wire92, (wire21[(3'h6):(3'h5)] ^ wire162)} ?
                       ((8'ha7) ~^ ((~|wire53[(4'h9):(3'h5)]) ?
                           (8'hbc) : ((~^wire52) << $signed((8'hbf))))) : ((wire52 == $unsigned((wire255 ?
                               wire257 : wire20))) ?
                           wire257[(4'ha):(2'h2)] : wire51[(4'h8):(1'h1)]));
endmodule

module module163
#(parameter param254 = ((((+((8'ha9) ^ (8'ha7))) * {(!(8'had)), ((8'hbc) == (8'hbc))}) >> ((((8'hb7) <<< (8'h9c)) ? (8'hbc) : ((8'h9d) == (7'h40))) ~^ ((~|(8'h9f)) ? ((8'hab) - (8'ha2)) : (+(8'hb2))))) << (&(&(~^((8'hb7) ? (7'h40) : (8'hb7)))))))
(y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h3b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire168;
  input wire signed [(4'hd):(1'h0)] wire167;
  input wire signed [(4'h8):(1'h0)] wire166;
  input wire [(3'h4):(1'h0)] wire165;
  input wire [(5'h12):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire253;
  wire signed [(4'hf):(1'h0)] wire252;
  wire signed [(4'he):(1'h0)] wire251;
  wire [(3'h5):(1'h0)] wire250;
  wire [(3'h4):(1'h0)] wire206;
  wire [(4'hc):(1'h0)] wire205;
  wire [(4'hf):(1'h0)] wire189;
  wire [(4'hd):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire176;
  wire signed [(4'hd):(1'h0)] wire172;
  wire [(2'h2):(1'h0)] wire171;
  wire [(2'h3):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  reg signed [(5'h10):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg248 = (1'h0);
  reg [(2'h3):(1'h0)] reg247 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg245 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg244 = (1'h0);
  reg [(4'h8):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg242 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg241 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg240 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg239 = (1'h0);
  reg [(4'h9):(1'h0)] reg238 = (1'h0);
  reg [(3'h6):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg236 = (1'h0);
  reg [(4'h8):(1'h0)] reg235 = (1'h0);
  reg [(4'hd):(1'h0)] reg234 = (1'h0);
  reg [(4'he):(1'h0)] reg233 = (1'h0);
  reg [(2'h3):(1'h0)] reg232 = (1'h0);
  reg [(4'hc):(1'h0)] reg231 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg230 = (1'h0);
  reg [(5'h15):(1'h0)] reg229 = (1'h0);
  reg [(5'h15):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg226 = (1'h0);
  reg [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg224 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg223 = (1'h0);
  reg [(3'h5):(1'h0)] reg222 = (1'h0);
  reg [(4'h9):(1'h0)] reg221 = (1'h0);
  reg [(5'h10):(1'h0)] reg220 = (1'h0);
  reg [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(3'h6):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(3'h5):(1'h0)] reg214 = (1'h0);
  reg [(3'h6):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg211 = (1'h0);
  reg [(5'h10):(1'h0)] reg210 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(4'he):(1'h0)] reg207 = (1'h0);
  reg [(4'he):(1'h0)] reg204 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg201 = (1'h0);
  reg [(5'h11):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  reg signed [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(2'h2):(1'h0)] reg196 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg192 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg signed [(4'he):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg179 = (1'h0);
  reg [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(4'he):(1'h0)] reg173 = (1'h0);
  assign y = {wire253,
                 wire252,
                 wire251,
                 wire250,
                 wire206,
                 wire205,
                 wire189,
                 wire188,
                 wire180,
                 wire176,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 reg249,
                 reg248,
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
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg179,
                 reg178,
                 reg177,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire169 = $signed((&$unsigned((8'ha8))));
  assign wire170 = wire169;
  assign wire171 = wire169[(1'h1):(1'h1)];
  assign wire172 = ($signed((wire168 <<< ($signed(wire166) < wire164))) != wire165[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg173 <= ((wire167[(3'h6):(3'h6)] ?
              $signed((((8'ha9) ? (8'haa) : wire165) ?
                  $signed(wire172) : $unsigned(wire172))) : (wire167[(4'h9):(2'h3)] * $signed(wire164[(5'h12):(4'h8)]))) ?
          $signed(wire171[(2'h2):(1'h1)]) : wire164);
      reg174 <= $signed($signed($unsigned(((-wire170) | $signed(wire167)))));
      reg175 <= (wire165 ?
          ((&(((8'had) ? wire170 : reg173) ?
              (+reg174) : wire169)) | $signed(wire165[(1'h1):(1'h0)])) : (wire171[(2'h2):(1'h0)] | $unsigned((reg174 ?
              $signed(wire172) : wire165[(2'h2):(1'h0)]))));
    end
  assign wire176 = (&((wire168[(1'h0):(1'h0)] ?
                           ({reg174} != $signed((8'hbc))) : ((-wire168) ?
                               $unsigned(wire170) : wire164)) ?
                       ($unsigned((&wire170)) == $signed({wire169,
                           wire167})) : ($signed(wire172[(3'h6):(2'h2)]) ?
                           $signed((wire165 ?
                               reg175 : wire166)) : (!$signed(wire170)))));
  always
    @(posedge clk) begin
      reg177 <= $signed($signed($signed({wire170[(1'h0):(1'h0)]})));
      reg178 <= reg175;
      reg179 <= ($signed(reg175[(2'h2):(1'h0)]) ?
          $signed(((|$signed(wire165)) ?
              $signed($unsigned(wire164)) : wire165)) : (~($signed((wire170 >>> wire165)) << ((reg177 < wire166) || (^wire166)))));
    end
  assign wire180 = {(~|{$unsigned($signed(wire170))}),
                       $signed((((reg177 ? reg179 : wire168) ?
                           (wire167 < reg175) : $signed(reg173)) > wire171[(1'h1):(1'h1)]))};
  always
    @(posedge clk) begin
      if (wire168[(3'h4):(1'h0)])
        begin
          reg181 <= (^wire180[(3'h7):(3'h7)]);
          reg182 <= (((+(!(wire172 <= wire167))) ~^ ((wire168 >> wire164) >>> wire180)) || (wire169[(3'h4):(2'h2)] ?
              (^reg179[(4'h9):(3'h5)]) : (~(~^$signed(reg179)))));
          if (($unsigned(reg177) ?
              $unsigned((~^reg179[(4'h8):(2'h3)])) : (~|(-((8'ha9) < {(8'hb5)})))))
            begin
              reg183 <= (reg174[(2'h2):(1'h1)] ?
                  (wire168 > (8'ha5)) : $signed(($signed(wire168) ~^ (7'h43))));
              reg184 <= $signed((wire168 ^ reg182));
              reg185 <= (+$signed((~((wire164 ? wire170 : reg175) | reg179))));
              reg186 <= (^wire172);
            end
          else
            begin
              reg183 <= $unsigned(reg182);
              reg184 <= ({((((8'hb2) ? wire176 : wire167) & $unsigned(reg184)) ?
                          $unsigned($unsigned(wire171)) : (reg183[(4'he):(1'h1)] - (reg174 ?
                              (8'ha1) : wire166))),
                      $unsigned((&(wire168 >= wire168)))} ?
                  {((reg175 ? wire171 : $signed((8'hb6))) | ((reg179 ?
                              reg185 : wire180) ?
                          $unsigned(reg173) : $signed(wire169))),
                      reg178} : reg173);
              reg185 <= (reg173 ? wire176[(2'h3):(1'h1)] : (7'h42));
              reg186 <= reg177[(2'h3):(2'h2)];
              reg187 <= (-(wire172[(4'hb):(3'h4)] ?
                  reg173[(2'h3):(2'h2)] : reg183[(3'h5):(3'h5)]));
            end
        end
      else
        begin
          reg181 <= ((reg175 ?
              $unsigned(reg179[(3'h5):(1'h1)]) : (^((^reg185) || (reg183 == reg187)))) <= $unsigned(reg182[(5'h14):(4'h9)]));
        end
    end
  assign wire188 = ((~&$unsigned(reg182[(3'h7):(1'h0)])) ?
                       ($signed((^$unsigned((8'hb7)))) <<< $signed(reg173)) : ((reg173[(4'hd):(4'hc)] ?
                           ((reg184 && (8'ha2)) > (7'h43)) : wire170) && (~|$signed({reg175,
                           wire165}))));
  assign wire189 = (~|reg174[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      if ({reg181[(5'h15):(5'h15)], wire189[(4'hf):(4'ha)]})
        begin
          reg190 <= wire176[(2'h3):(2'h3)];
          if ($signed(reg181))
            begin
              reg191 <= $unsigned((reg187 ?
                  $unsigned(($signed(reg185) + {reg185})) : reg182));
              reg192 <= wire189[(2'h2):(1'h1)];
              reg193 <= $unsigned($unsigned(reg186));
              reg194 <= (8'hba);
              reg195 <= {$signed(((reg179 ?
                          $signed(wire164) : (wire188 ? wire176 : wire169)) ?
                      ($signed(reg178) && reg192) : ($unsigned(wire176) == (+(7'h40))))),
                  reg194[(4'hd):(4'hc)]};
            end
          else
            begin
              reg191 <= $unsigned($unsigned((($unsigned(reg179) | reg179[(4'he):(3'h4)]) != (reg181 ?
                  $signed((8'hba)) : reg183[(4'he):(4'h8)]))));
              reg192 <= {(~^reg183[(4'hd):(3'h5)]),
                  ((~$unsigned((~reg186))) ?
                      reg186[(4'ha):(3'h6)] : ($unsigned($unsigned(reg181)) ?
                          reg178 : ((wire171 >>> wire172) && ((8'haa) ?
                              reg177 : wire176))))};
              reg193 <= $signed(wire171);
              reg194 <= reg191[(3'h5):(1'h1)];
              reg195 <= {wire189, reg179};
            end
          reg196 <= (($unsigned(($unsigned(reg181) && (wire167 < reg185))) <<< $signed(wire164)) <<< $unsigned($unsigned($signed((reg181 ?
              reg178 : reg182)))));
          reg197 <= reg175[(1'h0):(1'h0)];
        end
      else
        begin
          reg190 <= (^wire167);
          reg191 <= ($unsigned($signed({(-reg173)})) >> ((((^~reg175) ?
                  (reg182 ? reg179 : reg178) : reg186) >= reg186) ?
              (reg191 ~^ ((wire167 ? reg178 : reg191) ?
                  (reg197 >>> reg192) : (^reg178))) : $signed((8'hb9))));
        end
      reg198 <= $signed(($signed(((reg177 ? wire171 : reg190) ?
          (reg194 ? wire172 : reg184) : (-(8'hae)))) ^ (reg184 ?
          $unsigned({reg178, reg173}) : reg179[(1'h1):(1'h1)])));
      if (({wire166,
              (($unsigned(reg184) == ((8'had) <<< reg174)) ?
                  (reg173[(3'h7):(3'h6)] || wire189[(4'he):(4'hd)]) : (&(&reg181)))} ?
          $signed($unsigned({reg192,
              reg191[(1'h1):(1'h0)]})) : {$signed(($unsigned(wire176) || (reg183 <<< wire167))),
              ($unsigned(reg197[(4'hd):(2'h3)]) < reg190)}))
        begin
          if (((((&$unsigned(wire165)) ?
                  reg173 : ((reg198 + (8'hb2)) >> wire169[(3'h6):(3'h4)])) - wire166[(3'h7):(3'h7)]) ?
              reg175[(1'h1):(1'h0)] : ($unsigned((8'hac)) ?
                  (reg177[(2'h2):(1'h0)] && $signed(reg190[(2'h2):(1'h1)])) : $signed((~|wire165[(2'h3):(2'h2)])))))
            begin
              reg199 <= $unsigned({(&(~^(reg186 ? (8'ha6) : wire169))),
                  reg181[(5'h10):(4'hd)]});
              reg200 <= ($unsigned($unsigned((reg175 && {(8'h9c)}))) >>> {($signed($unsigned(wire166)) ~^ $unsigned($unsigned(reg174))),
                  $signed(((reg192 != reg193) > {reg174, (8'ha6)}))});
              reg201 <= ($signed(($signed($unsigned((8'hb2))) ?
                  {wire176, (reg177 <<< wire172)} : (wire171[(1'h1):(1'h1)] ?
                      (wire180 ? wire165 : reg186) : {reg196,
                          reg184}))) >= {reg181, $unsigned((~|reg194))});
              reg202 <= reg193[(2'h2):(2'h2)];
            end
          else
            begin
              reg199 <= reg192;
              reg200 <= (!(^~(&(^~$signed(wire172)))));
              reg201 <= $signed(($signed((reg202[(4'hb):(2'h3)] ?
                  $signed(reg185) : (wire180 | reg192))) <<< $unsigned(wire165[(1'h1):(1'h0)])));
              reg202 <= reg182[(4'hd):(3'h4)];
            end
        end
      else
        begin
          reg199 <= wire188[(1'h0):(1'h0)];
        end
      reg203 <= wire164[(4'hc):(2'h3)];
      reg204 <= $unsigned(((((reg196 & wire189) ?
              ((8'ha9) ? wire188 : reg196) : (reg193 ^~ reg184)) ?
          ({wire165, reg194} ?
              reg194 : (reg195 ? reg195 : reg181)) : (reg185[(1'h0):(1'h0)] ?
              wire171 : reg178[(3'h6):(3'h6)])) == $unsigned(($signed(reg182) ~^ $signed(reg202)))));
    end
  assign wire205 = (($unsigned($unsigned((reg182 == wire166))) <<< $signed((wire188[(4'hb):(4'hb)] >>> $unsigned((8'hbf))))) <<< (|(!(~|$signed(wire180)))));
  assign wire206 = (($signed($unsigned((8'ha8))) ?
                       reg190[(2'h2):(1'h1)] : (^$unsigned((reg185 <= wire164)))) || wire164[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg207 <= $signed((+$signed((wire167 ?
          reg191[(4'ha):(4'ha)] : $unsigned(reg183)))));
      if (((~$unsigned($signed(reg200[(4'hf):(3'h4)]))) && reg202))
        begin
          reg208 <= ((($unsigned({(8'hb1)}) ~^ ((reg174 ?
              reg201 : reg204) * (&reg177))) ^~ ((&$unsigned(wire167)) ^~ reg199)) < (reg191[(4'h9):(4'h9)] ?
              wire165[(1'h0):(1'h0)] : reg190[(3'h4):(3'h4)]));
          reg209 <= ($unsigned(((reg173[(3'h5):(3'h4)] || ((8'hb8) ?
              reg203 : wire171)) || reg181)) >= reg175);
          if ($signed($unsigned({({reg186} ~^ $unsigned(reg182))})))
            begin
              reg210 <= (&{(reg184[(2'h2):(1'h0)] ? $signed(reg192) : reg178)});
            end
          else
            begin
              reg210 <= (($unsigned({(reg195 ? reg185 : wire188),
                      (reg178 | reg200)}) == wire169) ?
                  $unsigned($signed($unsigned($signed(wire166)))) : $unsigned(reg193));
              reg211 <= (8'haa);
              reg212 <= wire176[(2'h2):(2'h2)];
            end
          if (reg208[(4'hb):(3'h7)])
            begin
              reg213 <= (8'haa);
            end
          else
            begin
              reg213 <= reg207[(2'h2):(1'h1)];
            end
          reg214 <= (^~$signed(((((8'hbb) == reg198) ~^ {reg204}) ?
              (^~(wire170 ? wire167 : (7'h41))) : reg197[(4'h8):(3'h7)])));
        end
      else
        begin
          reg208 <= $signed($unsigned({(~wire180), $unsigned((-reg207))}));
          reg209 <= ($unsigned(reg201[(3'h4):(2'h3)]) != $unsigned({$unsigned($signed(reg210))}));
        end
      reg215 <= (((&reg197[(4'hd):(4'ha)]) || $signed(($unsigned(wire206) ?
              (reg197 && wire165) : (&reg179)))) ?
          {(^~wire168[(2'h3):(2'h2)]),
              reg175[(1'h1):(1'h0)]} : {(&(reg182 || $signed(reg185))),
              wire189[(3'h6):(1'h1)]});
      if (($signed(({$unsigned(wire167)} ?
          $unsigned($signed(reg190)) : reg215[(4'hf):(4'h9)])) && reg174))
        begin
          reg216 <= wire205;
          if ($signed($signed((~reg184))))
            begin
              reg217 <= {{(((!reg196) != (reg177 == reg190)) <= $signed($unsigned((8'ha1)))),
                      $signed($signed($unsigned(reg212)))},
                  (wire206 != {(reg186 ?
                          $signed((7'h42)) : (wire189 <<< (8'hbe)))})};
              reg218 <= (8'hb0);
            end
          else
            begin
              reg217 <= reg190;
            end
        end
      else
        begin
          reg216 <= $signed((!({$signed((8'ha6))} <= $signed($signed(wire206)))));
        end
      if ((((reg208[(2'h3):(1'h0)] ?
              ((reg186 ^~ reg174) || {reg192}) : reg210) & ((8'hb5) ^ $signed(reg208))) ?
          $unsigned((wire206[(2'h2):(1'h1)] || reg213[(1'h1):(1'h0)])) : (reg179[(4'hb):(1'h1)] ?
              (((^~reg218) ?
                  reg197 : $unsigned(reg177)) & ($unsigned(wire166) ~^ (~^wire172))) : (8'hb8))))
        begin
          reg219 <= (((8'ha9) ?
              {wire169} : $unsigned($unsigned((&(8'h9d))))) | reg191);
          reg220 <= ($signed((~$unsigned(reg192))) ?
              (($signed($unsigned((8'hb7))) ?
                      (~$unsigned(reg173)) : $signed((8'hbe))) ?
                  reg182[(4'hd):(4'ha)] : ((~$signed(reg177)) + ((-(7'h40)) != reg214))) : $unsigned(reg177));
          if ((^~$signed($unsigned((reg200[(3'h4):(1'h1)] ?
              (reg187 ? wire171 : (8'h9d)) : reg212[(3'h6):(2'h3)])))))
            begin
              reg221 <= wire168[(3'h5):(1'h1)];
              reg222 <= ($signed($signed((~|reg216[(2'h2):(1'h0)]))) ?
                  ($signed(((reg203 ? wire164 : wire165) ?
                      (wire180 ?
                          wire167 : reg213) : $unsigned(wire170))) & $signed($unsigned(wire188[(4'hd):(1'h1)]))) : reg181[(3'h4):(3'h4)]);
              reg223 <= ($unsigned((^wire172[(1'h1):(1'h0)])) ?
                  wire176[(1'h1):(1'h1)] : ((&wire170) ^ (7'h43)));
              reg224 <= $signed((~&($unsigned($signed(reg192)) ?
                  $signed((reg187 ~^ (7'h44))) : $signed($unsigned(reg175)))));
              reg225 <= (reg174[(3'h4):(1'h0)] >> $unsigned($unsigned(((reg196 ?
                  reg191 : reg173) ~^ $signed(reg198)))));
            end
          else
            begin
              reg221 <= reg223[(4'h8):(4'h8)];
              reg222 <= (wire167[(2'h3):(2'h3)] << wire180[(3'h6):(3'h6)]);
            end
        end
      else
        begin
          reg219 <= $unsigned($unsigned(($signed(reg219[(3'h7):(3'h4)]) ?
              (~&wire165[(2'h2):(1'h1)]) : $signed($signed(reg175)))));
          reg220 <= reg196[(2'h2):(1'h0)];
          reg221 <= wire168;
        end
    end
  always
    @(posedge clk) begin
      reg226 <= {reg177,
          (+($signed((wire205 ? wire172 : reg225)) ? reg214 : reg215))};
      if (($signed(reg220) ?
          reg195[(1'h0):(1'h0)] : ({$unsigned((reg211 ? reg174 : reg224)),
                  reg199} ?
              $signed((~^(wire189 & wire166))) : $unsigned($signed({reg221,
                  reg197})))))
        begin
          reg227 <= (wire167 ?
              (~wire176[(1'h1):(1'h1)]) : $signed(($unsigned((reg199 ?
                      reg225 : wire206)) ?
                  (~^reg209) : {$unsigned(reg204)})));
          reg228 <= reg184;
          reg229 <= $unsigned(({reg191, wire176} & $signed({(wire188 ?
                  reg204 : reg191)})));
          reg230 <= (reg216 | reg197[(4'h9):(3'h7)]);
          if ((&(reg228 ? reg186 : reg200)))
            begin
              reg231 <= ({(reg219[(5'h10):(2'h2)] >> $unsigned(((8'h9e) ^ (7'h43))))} ?
                  {reg190} : $signed(($unsigned({reg223,
                      reg212}) << {$signed(wire165), {(7'h42)}})));
              reg232 <= ((~^reg230) ?
                  ((!$unsigned(reg185)) ^~ (8'had)) : (|reg230[(3'h7):(3'h4)]));
              reg233 <= (8'ha2);
              reg234 <= reg179;
              reg235 <= (reg192[(4'h8):(3'h7)] ?
                  (8'h9c) : reg233[(3'h6):(3'h4)]);
            end
          else
            begin
              reg231 <= ($unsigned(($signed((^~wire171)) ?
                  wire165 : reg199)) << $signed((|(~|$unsigned((8'ha9))))));
              reg232 <= $signed((|{{$signed(reg194), (8'haa)},
                  wire164[(1'h0):(1'h0)]}));
              reg233 <= $signed((+(7'h40)));
              reg234 <= reg234;
            end
        end
      else
        begin
          if (($signed(($unsigned(reg230) ^~ reg212)) >> $signed(($signed($signed(reg228)) * $signed(reg193[(4'ha):(3'h7)])))))
            begin
              reg227 <= reg204[(4'he):(1'h1)];
              reg228 <= ((8'had) ?
                  (+($unsigned((reg181 ^~ reg177)) ?
                      reg231 : (reg219 ?
                          reg201 : (reg215 ?
                              (8'hb9) : reg221)))) : $signed(((8'hb3) * (reg217 >= reg217[(4'h8):(4'h8)]))));
              reg229 <= ($signed((reg179[(4'hb):(3'h7)] << ($signed(reg196) * $signed(wire167)))) ?
                  ({$signed((reg174 ^~ wire166))} ?
                      ($unsigned({reg234}) ?
                          $unsigned((wire205 ?
                              reg224 : wire165)) : wire172) : ((~wire164[(2'h2):(2'h2)]) - ((wire205 ?
                              reg200 : (7'h40)) ?
                          (|reg174) : (reg195 == reg179)))) : (($signed(reg191[(2'h3):(2'h3)]) | $signed($unsigned(reg195))) ?
                      (reg233[(3'h4):(2'h2)] ?
                          (reg216[(1'h0):(1'h0)] ?
                              reg187[(5'h15):(4'he)] : reg228[(4'hc):(2'h2)]) : $signed((wire169 & reg208))) : ($signed($unsigned(reg229)) < $signed((&(8'ha1))))));
            end
          else
            begin
              reg227 <= (~&(-{$unsigned(reg187[(4'ha):(1'h1)])}));
              reg228 <= ((wire165[(2'h2):(1'h0)] ?
                      ((~&reg230) && wire169) : wire166) ?
                  {wire169[(3'h4):(2'h2)], (~^wire170)} : reg212);
              reg229 <= ($unsigned(((8'hbc) ?
                  $signed((~&(7'h42))) : $signed((!(8'hb0))))) && reg207);
              reg230 <= reg224[(4'h8):(4'h8)];
            end
          if ((reg181[(5'h11):(5'h11)] ?
              (8'hbf) : ((8'hb3) ?
                  (reg222 ?
                      (|(~&wire168)) : (!$unsigned(reg194))) : $unsigned({$unsigned(reg174),
                      $signed((8'hbc))}))))
            begin
              reg231 <= (reg195[(1'h0):(1'h0)] ?
                  ($signed({((8'h9f) ? reg190 : reg228),
                      $unsigned(reg174)}) ~^ reg183) : ($signed((reg219[(2'h2):(2'h2)] ?
                          $unsigned(wire166) : (wire176 ~^ reg190))) ?
                      (reg174 >>> $unsigned((reg227 ^~ (8'had)))) : $unsigned(reg175)));
              reg232 <= $signed(reg179);
              reg233 <= (((wire206[(1'h0):(1'h0)] << $unsigned((~&(8'hae)))) > wire164) < ((&reg218[(1'h0):(1'h0)]) ?
                  $signed((!(reg173 + reg219))) : (~^$signed($signed((7'h43))))));
              reg234 <= reg191;
            end
          else
            begin
              reg231 <= reg179;
              reg232 <= $unsigned((reg216[(3'h5):(2'h2)] ?
                  {reg216[(1'h0):(1'h0)]} : $unsigned((~^(reg212 ?
                      wire206 : (7'h41))))));
              reg233 <= $signed($unsigned($signed(reg217)));
              reg234 <= reg190;
            end
          reg235 <= ({(~$signed(reg228)),
              reg218} * $signed((^reg209[(1'h1):(1'h0)])));
          reg236 <= wire169;
          reg237 <= ((~reg235) ?
              $unsigned(reg192[(2'h2):(1'h0)]) : $unsigned(reg190));
        end
      if ({reg204})
        begin
          if (wire168)
            begin
              reg238 <= wire206[(1'h0):(1'h0)];
              reg239 <= wire164;
              reg240 <= reg224;
              reg241 <= {(reg178 != $signed(wire189))};
              reg242 <= (reg241 >> $signed((&$unsigned(reg226))));
            end
          else
            begin
              reg238 <= (~|{$unsigned(($unsigned(reg173) ?
                      reg231 : reg238[(3'h4):(2'h2)])),
                  {reg225}});
              reg239 <= (reg229 ?
                  (((~^reg195) ?
                          $unsigned({reg196,
                              reg234}) : wire180[(2'h2):(1'h0)]) ?
                      ($signed($signed(reg230)) ?
                          (reg226[(1'h1):(1'h1)] == wire180[(1'h1):(1'h1)]) : $unsigned(reg198[(1'h1):(1'h1)])) : reg182) : ({(^$signed(reg239))} & wire188));
            end
          if ({(^wire170)})
            begin
              reg243 <= wire171;
              reg244 <= ($signed((~&(wire206 ?
                  reg235 : (8'hb5)))) == (^reg228));
              reg245 <= reg212;
              reg246 <= (reg241 ?
                  $unsigned($signed(wire164)) : $signed((wire171[(1'h0):(1'h0)] ?
                      reg241[(3'h4):(1'h1)] : wire176[(1'h0):(1'h0)])));
              reg247 <= reg211[(1'h1):(1'h0)];
            end
          else
            begin
              reg243 <= {(wire206 >> $unsigned($unsigned(reg221[(4'h8):(3'h7)])))};
              reg244 <= ((7'h43) > $signed((reg186 ?
                  $signed($signed(wire172)) : (-(wire169 >>> reg235)))));
              reg245 <= (^$unsigned(reg225));
              reg246 <= (8'ha4);
            end
        end
      else
        begin
          reg238 <= reg215;
          reg239 <= $signed(reg185);
          reg240 <= (^(8'hba));
        end
      reg248 <= ((|(reg193 ?
              ((reg235 * reg231) ?
                  {wire171} : (wire164 != wire180)) : ((8'ha0) ?
                  (reg222 != reg219) : {reg234}))) ?
          (reg181[(4'hc):(2'h2)] ?
              (~^(reg247 ? {reg218} : (~&reg223))) : {reg185[(4'h9):(4'h8)],
                  (~^(reg179 ? wire170 : reg226))}) : (~^(((reg200 ?
              reg228 : reg212) == {reg231,
              reg177}) + $unsigned($signed(reg246)))));
      reg249 <= ($signed({((wire188 >>> wire170) ?
              reg225[(4'hb):(3'h6)] : $unsigned(wire166)),
          reg213[(2'h2):(1'h0)]}) < ((8'hbf) - $signed(($unsigned((8'ha5)) != reg236))));
    end
  assign wire250 = (reg210 <= $unsigned(wire169[(3'h7):(1'h0)]));
  assign wire251 = (~reg201);
  assign wire252 = ($unsigned(($signed({(8'ha1),
                           reg208}) ^ reg217[(4'hb):(4'h8)])) ?
                       {(8'ha9)} : (7'h41));
  assign wire253 = (~^$signed((reg228 ?
                       wire206 : {$unsigned(reg225), $signed(reg174)})));
endmodule

module module141
#(parameter param155 = {(((((8'hb0) ? (8'hae) : (8'hb1)) >= ((8'ha4) ? (8'hbe) : (8'ha1))) ? (((8'hac) ? (8'hba) : (8'ha0)) >>> (8'ha7)) : ({(8'ha2)} & {(8'ha8), (8'hba)})) ? ((((8'h9f) + (8'ha3)) ? ((8'ha4) >>> (8'hb9)) : ((8'hbb) || (8'ha0))) ? (((8'hbd) ? (8'haf) : (8'haf)) ? ((8'ha9) ^ (8'hb1)) : ((8'hb1) ? (8'hb8) : (8'hb0))) : (+{(8'hb3)})) : (({(8'hb8), (8'hbc)} < ((7'h41) | (8'h9d))) ? (~&((8'hae) ? (7'h42) : (7'h42))) : {((8'hb1) != (8'hbc)), (^(8'hac))})), ((~^(^~{(8'had), (8'h9c)})) < ((-((8'hb2) ~^ (8'hb9))) ? (^~{(8'ha6)}) : ((~(8'haf)) << ((8'hbf) ? (8'hb9) : (8'ha3)))))})
(y, clk, wire145, wire144, wire143, wire142);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire145;
  input wire [(4'hc):(1'h0)] wire144;
  input wire signed [(4'hf):(1'h0)] wire143;
  input wire signed [(4'hd):(1'h0)] wire142;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire146;
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(4'h9):(1'h0)] reg149 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire148,
                 wire147,
                 wire146,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire146 = $signed($unsigned((wire145 ?
                       ((8'ha0) ?
                           $unsigned(wire143) : $unsigned(wire142)) : ($unsigned(wire145) ?
                           (wire142 | wire145) : {(8'ha9), (8'hb7)}))));
  assign wire147 = (wire142 > (8'hb0));
  assign wire148 = {(wire145[(2'h2):(2'h2)] ?
                           $signed(((wire147 ?
                               wire147 : wire143) >>> $signed(wire144))) : ($unsigned((&wire143)) ?
                               wire147 : {(8'hb1), (~&wire144)}))};
  always
    @(posedge clk) begin
      reg149 <= wire147[(1'h0):(1'h0)];
      reg150 <= wire146;
      reg151 <= wire144;
      reg152 <= $signed({$unsigned(wire142[(1'h1):(1'h0)])});
    end
  assign wire153 = ((($unsigned((~&(7'h44))) <= wire145) - wire146) ?
                       (8'hb6) : (^~$signed(($unsigned(reg150) <= {reg152,
                           (8'hb1)}))));
  assign wire154 = reg152;
endmodule

module module96
#(parameter param138 = ((-{(!((8'hac) == (8'hb1)))}) ? (^((((8'ha9) | (8'hac)) ? (8'ha2) : {(8'hb0), (8'hbf)}) ? ((!(8'had)) <<< ((8'ha6) ? (8'hbc) : (8'ha4))) : (((8'hb7) ? (8'haa) : (8'hb2)) >>> ((8'hb9) && (8'hb2))))) : (((|((8'haa) ? (8'hbf) : (8'hb8))) && (((8'hb6) ? (8'ha9) : (8'hb7)) ^ (~^(8'hb5)))) ? (^~((~&(8'h9e)) | ((7'h43) == (8'ha2)))) : (~^(&(8'hab))))))
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire101;
  input wire signed [(4'hc):(1'h0)] wire100;
  input wire [(3'h6):(1'h0)] wire99;
  input wire [(4'hb):(1'h0)] wire98;
  input wire [(5'h11):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire137;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(2'h3):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(5'h11):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire110;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(5'h10):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire102;
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
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
                 reg105,
                 (1'h0)};
  assign wire102 = (!wire98[(4'ha):(1'h1)]);
  assign wire103 = $unsigned(($signed(($unsigned(wire97) | $signed(wire102))) << wire102[(5'h10):(4'he)]));
  assign wire104 = wire103;
  always
    @(posedge clk) begin
      reg105 <= (($signed(wire102) ?
          (({(8'ha5), wire104} ?
              $signed(wire98) : wire98[(3'h6):(1'h1)]) >> wire100[(3'h4):(2'h2)]) : (~^((wire101 <<< (8'hbc)) ?
              wire101 : (~&wire98)))) <= (wire101 == (($signed(wire102) << (~^wire98)) ?
          (wire103 ? {wire101} : wire103[(1'h1):(1'h0)]) : wire99)));
    end
  assign wire106 = $signed($signed($unsigned($unsigned((+wire98)))));
  assign wire107 = wire97;
  assign wire108 = (!wire107);
  assign wire109 = (((wire107[(1'h0):(1'h0)] ?
                           wire104 : $unsigned(wire101[(1'h0):(1'h0)])) ?
                       $signed(($unsigned(wire97) ?
                           $unsigned(wire104) : reg105[(2'h3):(1'h1)])) : $signed((~|{wire104}))) && (wire101 ?
                       $unsigned($signed($signed(wire97))) : {wire107[(4'hb):(3'h7)],
                           wire108}));
  assign wire110 = $signed($unsigned(wire100[(1'h1):(1'h1)]));
  assign wire111 = (((~&$signed((&wire107))) ?
                       wire106[(4'hc):(2'h2)] : (-((wire103 * (8'ha7)) || {wire102}))) + $signed($unsigned($signed($signed((8'hbe))))));
  assign wire112 = (|$signed((~|$signed($unsigned((8'h9d))))));
  always
    @(posedge clk) begin
      if ({wire107})
        begin
          reg113 <= {reg105};
          if (((8'hb2) ?
              $unsigned((~&(^~$unsigned(wire102)))) : ($signed($unsigned(reg113)) ?
                  wire109 : $signed($signed((reg105 - wire101))))))
            begin
              reg114 <= wire102;
              reg115 <= $unsigned($signed(wire104));
              reg116 <= reg113[(3'h5):(1'h1)];
              reg117 <= (~^(((&(-wire102)) ?
                      wire100 : (~|(wire99 ~^ wire109))) ?
                  (|(!(wire102 ~^ wire101))) : $signed((&(wire109 <= reg114)))));
            end
          else
            begin
              reg114 <= (8'hb9);
              reg115 <= reg115[(2'h2):(1'h1)];
              reg116 <= (+reg105[(2'h3):(2'h3)]);
              reg117 <= (7'h40);
              reg118 <= ((($signed((&reg113)) || (^(wire108 <= wire104))) >= reg116[(5'h10):(4'hf)]) ?
                  wire102 : (wire102 - wire99[(1'h1):(1'h0)]));
            end
          reg119 <= $unsigned(({$unsigned(wire101[(2'h2):(1'h0)]),
              $signed((reg105 && wire102))} == (&$signed((wire108 ?
              (8'ha4) : (8'hbf))))));
          reg120 <= (^{$unsigned($unsigned($signed(reg114)))});
        end
      else
        begin
          reg113 <= ($signed($unsigned($signed($unsigned(reg119)))) << $signed(wire98[(4'h8):(2'h2)]));
          reg114 <= (!$signed((wire106 ?
              reg113 : $unsigned((wire97 ? wire106 : wire103)))));
          reg115 <= wire102[(4'hd):(3'h4)];
          reg116 <= $signed(wire98[(1'h1):(1'h1)]);
        end
      reg121 <= $unsigned($signed($signed(((wire112 >= (8'ha8)) ?
          (wire109 ? wire107 : wire99) : (~^wire111)))));
      reg122 <= {$signed(($signed((8'haa)) * $unsigned((|reg114))))};
      if (($signed(((!(+wire103)) != wire103[(4'h9):(4'h8)])) ?
          ((wire100 && $unsigned((^~reg116))) ?
              (($signed(wire110) ? reg118 : wire102[(2'h3):(2'h2)]) ?
                  ((wire100 ? wire98 : wire98) == (wire101 ?
                      reg114 : wire98)) : {wire97[(4'hc):(1'h0)]}) : $signed($unsigned((wire108 > wire104)))) : reg119))
        begin
          reg123 <= $signed(reg105);
          reg124 <= ((+$unsigned((~&reg116[(4'h9):(2'h3)]))) >= wire111[(4'hb):(4'h8)]);
        end
      else
        begin
          if (reg114[(3'h4):(1'h1)])
            begin
              reg123 <= (^~wire109);
            end
          else
            begin
              reg123 <= {$signed($signed(reg105)), (-reg114[(1'h1):(1'h0)])};
            end
          reg124 <= ((-(~|wire108[(4'hc):(3'h7)])) >>> {($unsigned(wire108[(3'h6):(3'h5)]) ~^ $unsigned((wire110 ?
                  wire102 : reg113)))});
          if (reg119[(2'h2):(1'h0)])
            begin
              reg125 <= (!$signed($signed(wire97[(4'h8):(2'h3)])));
            end
          else
            begin
              reg125 <= (~|(wire98[(4'ha):(4'ha)] ~^ ($signed($signed(reg119)) ?
                  ($signed(reg117) ?
                      $signed(reg115) : reg123[(3'h5):(3'h4)]) : ((wire111 ?
                      reg118 : reg116) <<< ((7'h44) >>> reg117)))));
            end
          reg126 <= {{{{(reg121 * reg118)}, (|(wire100 ? reg118 : (8'hb1)))},
                  (8'haa)},
              reg120};
        end
      reg127 <= (^(reg125[(3'h4):(2'h2)] ~^ (-wire101[(1'h0):(1'h0)])));
    end
  assign wire128 = (~|$unsigned($unsigned(wire100)));
  assign wire129 = reg124[(5'h15):(2'h2)];
  assign wire130 = {($unsigned($unsigned(wire109)) ?
                           $unsigned(($unsigned(reg117) ?
                               $unsigned(wire98) : (wire108 != wire109))) : $unsigned(reg117))};
  assign wire131 = (+wire106[(4'he):(4'ha)]);
  assign wire132 = $unsigned($unsigned($unsigned(reg114[(2'h2):(2'h2)])));
  assign wire133 = $signed((~$signed(((&reg114) ?
                       (reg113 + reg118) : wire100[(4'hc):(3'h5)]))));
  assign wire134 = reg124;
  assign wire135 = ($unsigned(reg125) ?
                       (wire104 ?
                           $signed(wire100) : $signed((+(~(8'hb2))))) : $signed((wire106[(4'hb):(2'h3)] ?
                           (reg126 >> ((8'h9d) <<< wire130)) : wire112)));
  assign wire136 = (^~wire107);
  assign wire137 = (reg123[(3'h7):(3'h6)] != $unsigned($unsigned($unsigned($unsigned(reg126)))));
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire61;
  input wire [(4'hc):(1'h0)] wire60;
  input wire signed [(5'h15):(1'h0)] wire59;
  input wire signed [(2'h2):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire79;
  wire [(2'h2):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire63,
                 wire62,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire62 = $signed((wire61 ?
                      $signed(wire61[(4'h9):(3'h5)]) : ($unsigned(wire58) ?
                          (~|(wire60 > wire59)) : ((wire61 >> wire60) ?
                              $signed(wire60) : {wire57}))));
  assign wire63 = wire59[(4'hb):(4'h8)];
  always
    @(posedge clk) begin
      if ({wire58[(2'h2):(1'h0)],
          $signed($unsigned($signed(wire62[(4'hb):(1'h0)])))})
        begin
          reg64 <= ($signed(wire59[(3'h7):(2'h3)]) ?
              wire57 : $unsigned((((wire62 ? wire60 : (7'h40)) ~^ (wire61 ?
                  (8'hbb) : wire58)) != {wire62[(4'hb):(4'h8)]})));
          reg65 <= (((((wire62 - (8'hb9)) <<< $unsigned(reg64)) & $unsigned($signed(wire61))) <= $signed($signed(((8'hac) ?
              wire58 : reg64)))) && $signed($unsigned(($unsigned((8'h9e)) - {wire57,
              wire61}))));
          reg66 <= wire58;
          reg67 <= wire58;
          if (wire59[(4'hb):(4'h9)])
            begin
              reg68 <= (8'hbe);
              reg69 <= ((&(|$signed(((8'hae) > wire57)))) ?
                  (-wire61[(3'h7):(1'h0)]) : ($unsigned({(reg66 ?
                          wire60 : wire60),
                      $signed(wire61)}) && $unsigned({$signed(reg67),
                      $unsigned(wire57)})));
              reg70 <= reg65[(2'h3):(2'h2)];
              reg71 <= (~^reg70);
              reg72 <= $unsigned($signed(($signed($signed(reg68)) > $unsigned({reg66,
                  wire63}))));
            end
          else
            begin
              reg68 <= (~(+wire59[(5'h10):(4'hf)]));
              reg69 <= wire62;
              reg70 <= ({(reg66[(4'he):(4'he)] * wire57)} ?
                  (~|$signed(((~reg65) ?
                      (reg66 ?
                          wire57 : reg72) : reg65[(1'h0):(1'h0)]))) : $signed(($unsigned(reg64) == $unsigned((~wire61)))));
            end
        end
      else
        begin
          if (($unsigned(wire61[(2'h2):(2'h2)]) ?
              (-((reg64[(2'h3):(2'h3)] ?
                  (8'hba) : wire62) != (8'ha6))) : {reg66}))
            begin
              reg64 <= $unsigned((~^(!$signed((wire63 ? reg68 : reg67)))));
              reg65 <= $signed(wire59[(4'he):(4'hc)]);
              reg66 <= $signed($unsigned((!(~^(reg68 ? (8'haf) : reg64)))));
              reg67 <= ((reg71 < (wire58[(2'h2):(1'h1)] ?
                  ({reg72} ^ $signed(reg71)) : (&$signed(reg70)))) || (({reg72,
                      (reg71 << reg69)} <= $signed($unsigned(reg70))) ?
                  $unsigned($signed((reg65 ?
                      reg71 : wire57))) : ((~^(!reg69)) << {(reg72 ~^ reg65),
                      (~^reg66)})));
              reg68 <= (~|$signed($unsigned($unsigned((&(8'ha9))))));
            end
          else
            begin
              reg64 <= reg70;
              reg65 <= $unsigned($unsigned({$unsigned((reg66 ? reg71 : wire57)),
                  (-$unsigned(reg64))}));
              reg66 <= {wire57, wire61[(4'h9):(1'h0)]};
            end
          reg69 <= reg68;
          reg70 <= $signed(wire60[(3'h4):(3'h4)]);
          reg71 <= $signed(reg69);
          reg72 <= (wire58[(1'h1):(1'h1)] ?
              {(~|$signed($signed(wire57))),
                  $signed((8'h9c))} : ({reg72[(3'h7):(1'h0)]} <= wire63));
        end
      reg73 <= ((wire61 ? (^$signed((~&wire63))) : reg71) ?
          reg69 : $signed(reg67[(1'h1):(1'h0)]));
      reg74 <= wire63[(1'h0):(1'h0)];
    end
  assign wire75 = $signed((8'ha3));
  assign wire76 = $signed((&(|wire75)));
  assign wire77 = ({{(~&$unsigned(reg70)), $signed(reg69[(4'h9):(1'h1)])},
                          $unsigned(reg70[(1'h0):(1'h0)])} ?
                      ({reg74[(3'h7):(2'h3)]} ?
                          $unsigned(((wire63 ? reg64 : reg73) ?
                              $unsigned(wire75) : (reg70 ?
                                  wire60 : wire57))) : (($unsigned(reg65) ?
                              $signed(wire59) : (reg71 ?
                                  wire60 : reg68)) << (reg65 ?
                              ((8'hae) > wire62) : wire62[(2'h3):(1'h1)]))) : reg73);
  assign wire78 = wire58;
  assign wire79 = reg71;
  always
    @(posedge clk) begin
      if ($signed(reg67[(3'h4):(1'h0)]))
        begin
          reg80 <= $unsigned((((^~(reg74 ?
              (8'hb7) : wire75)) || $signed(reg74)) + $unsigned(((reg73 ?
              reg66 : wire57) <<< (^~reg69)))));
          reg81 <= ((!(((reg70 & wire75) == (wire61 ^~ (8'haa))) + {(wire77 > reg68),
                  reg73})) ?
              ((^$signed({reg73})) ?
                  $signed((~&wire61[(3'h7):(3'h5)])) : (((reg74 ?
                          reg65 : reg74) ?
                      (+reg66) : wire63) && (&{reg73,
                      (8'hb8)}))) : reg72[(1'h0):(1'h0)]);
          reg82 <= $unsigned($unsigned(reg69[(2'h3):(1'h0)]));
          reg83 <= {$signed($unsigned(($signed(wire60) ?
                  (reg69 ? reg69 : reg80) : (+wire75))))};
        end
      else
        begin
          reg80 <= (reg74 ?
              reg66[(3'h6):(1'h1)] : ({$signed(wire63)} ?
                  $signed((~^$signed(reg67))) : reg65[(2'h2):(1'h1)]));
          reg81 <= ($unsigned($signed($signed((reg80 ?
              reg74 : wire62)))) >> reg82);
          reg82 <= reg66[(3'h5):(2'h2)];
          reg83 <= (($unsigned(($signed(reg80) ?
                  $unsigned(reg71) : {(8'ha6)})) ?
              {($unsigned(wire77) ?
                      $unsigned(wire57) : $unsigned(reg73))} : (((-reg70) | {reg70}) & $unsigned($unsigned(wire76)))) + (wire63 + (reg67[(2'h3):(2'h3)] ?
              $signed(reg72) : (!(~wire79)))));
          if ($signed(((((wire58 ? (8'hae) : reg71) ?
              (wire76 ? reg64 : reg74) : (wire62 ?
                  reg71 : wire78)) ^ $signed($signed((8'ha5)))) <= (($unsigned(wire77) - (reg66 + reg64)) ?
              reg83 : (~|wire61[(1'h0):(1'h0)])))))
            begin
              reg84 <= (((wire61[(3'h5):(1'h1)] ?
                      ((reg67 ? reg82 : reg66) ^~ {reg81,
                          (8'hbd)}) : (reg71 <<< $signed(wire61))) ?
                  $unsigned($signed({wire60,
                      wire79})) : ($signed($unsigned(reg70)) - (&((8'hba) + wire63)))) & $unsigned((&(~|$unsigned((8'hac))))));
              reg85 <= reg74;
              reg86 <= wire59;
            end
          else
            begin
              reg84 <= wire57[(4'hb):(3'h6)];
              reg85 <= (~^wire63);
            end
        end
    end
  assign wire87 = ({(|$signed((wire59 >>> reg65))),
                      $signed((~^((8'hbc) >>> reg86)))} >>> $unsigned({({reg69,
                              reg65} ?
                          $unsigned(reg83) : $unsigned(reg64)),
                      (8'hb9)}));
  assign wire88 = (^($unsigned(((reg66 >> reg73) ?
                      (reg74 ? reg67 : wire87) : $unsigned(reg83))) | (reg83 ?
                      $unsigned((8'had)) : wire87)));
  assign wire89 = (($unsigned(((wire75 == (7'h40)) > $signed(reg84))) | $unsigned(wire63[(4'hb):(4'h8)])) & $unsigned($unsigned((reg82 ?
                      reg80[(2'h2):(2'h2)] : reg82[(4'h8):(4'h8)]))));
  assign wire90 = $signed($signed((wire62[(2'h3):(2'h2)] + wire79)));
  assign wire91 = reg80;
endmodule

module module24
#(parameter param47 = ((((((8'hac) <<< (8'hab)) ? (^~(8'ha9)) : (8'haa)) <<< (~^((8'h9e) > (8'hbe)))) ? ((((8'ha2) > (8'h9e)) || (~&(8'h9f))) < (((8'hbf) && (8'hbe)) ? {(8'hba), (8'ha0)} : ((8'hb7) ? (8'hbb) : (8'ha7)))) : ((~^((8'h9e) ? (8'hbd) : (7'h40))) ~^ (+((8'had) ? (8'haf) : (8'hb3))))) ? {((((7'h42) ? (8'ha6) : (8'haf)) == {(8'hb2)}) | ({(8'hb4)} ? (~&(8'hb2)) : (-(8'ha7))))} : (~&(&(((8'hba) ? (8'hba) : (8'hbc)) + ((7'h40) ^ (8'ha0)))))), 
parameter param48 = param47)
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire [(4'ha):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  assign y = {wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg45,
                 reg37,
                 (1'h0)};
  assign wire29 = $unsigned($unsigned(($unsigned($unsigned(wire28)) ?
                      wire27[(5'h14):(1'h0)] : (((8'hb1) < wire27) ?
                          (wire28 ? wire27 : wire25) : (-wire28)))));
  assign wire30 = wire28;
  assign wire31 = wire26;
  assign wire32 = {(~|wire31),
                      $signed((wire30[(5'h12):(3'h5)] ?
                          wire27[(4'hf):(4'hd)] : ((!wire30) ?
                              (-(8'ha0)) : {wire28, wire29})))};
  assign wire33 = (wire32[(2'h2):(1'h0)] != {{wire30[(4'hc):(3'h7)]}});
  assign wire34 = $signed(wire25);
  assign wire35 = $unsigned($signed(wire32[(4'he):(3'h6)]));
  assign wire36 = $signed((+(($unsigned(wire26) ? wire28 : $signed(wire35)) ?
                      ($signed(wire27) ?
                          (-wire34) : wire33[(3'h6):(2'h2)]) : wire28)));
  always
    @(posedge clk) begin
      reg37 <= $signed(($signed({$signed(wire31)}) ?
          ((wire30[(3'h7):(2'h2)] ? wire34 : (wire27 >= (8'hb9))) ?
              (~(^~wire30)) : wire36[(2'h2):(1'h1)]) : (~|((~^wire30) ?
              (wire35 | wire32) : wire28))));
    end
  assign wire38 = wire31;
  assign wire39 = ($signed($unsigned((wire34[(4'he):(4'hb)] * wire27[(1'h1):(1'h1)]))) < (^wire26));
  assign wire40 = (&({$unsigned((~(8'hab))),
                      ((~wire39) | $signed(wire28))} & (({(8'hb3), wire29} ?
                          wire28 : wire32[(4'ha):(1'h0)]) ?
                      $unsigned($unsigned(wire33)) : wire25)));
  assign wire41 = wire27;
  assign wire42 = wire26;
  assign wire43 = ({(~^wire26[(3'h7):(3'h4)])} << $signed($signed(wire40)));
  assign wire44 = (wire40[(1'h1):(1'h0)] ?
                      ((8'ha1) ? wire30 : wire30) : {reg37[(2'h3):(2'h2)]});
  always
    @(posedge clk) begin
      reg45 <= wire33;
    end
  assign wire46 = ((~|((wire35[(3'h4):(1'h0)] >> (~&wire39)) < wire38)) < wire40);
endmodule
