module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire278;
  wire signed [(5'h12):(1'h0)] wire277;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire275;
  assign y = {wire278,
                 wire277,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire275,
                 (1'h0)};
  assign wire5 = ($signed($signed($unsigned($signed((8'hb6))))) || {(wire3 ?
                         wire0 : {$signed(wire1), $signed((8'hb3))}),
                     ((|$unsigned(wire2)) | ((+wire0) && $signed(wire2)))});
  assign wire6 = $unsigned((wire0 ?
                     ({wire5} ?
                         (+(~&(8'ha7))) : wire0[(2'h3):(1'h0)]) : (+(|$signed(wire3)))));
  assign wire7 = ((|wire1) ?
                     $unsigned($signed(((wire4 >>> wire5) ?
                         (wire3 ?
                             wire0 : wire3) : $signed(wire1)))) : ({$signed(wire3[(2'h3):(2'h2)]),
                             wire4} ?
                         (((-(8'hb6)) != (wire4 ? wire4 : wire2)) ?
                             (~|(~&wire6)) : ((wire1 ?
                                 (8'hb1) : wire6) <= (wire4 - wire0))) : wire1));
  assign wire8 = ($unsigned(wire4) ? (^~wire6) : wire7[(2'h3):(2'h3)]);
  assign wire9 = wire3;
  assign wire10 = (wire9[(2'h2):(2'h2)] >>> wire5[(2'h3):(2'h2)]);
  assign wire11 = (&wire0);
  assign wire12 = $signed($signed((wire6[(3'h7):(2'h2)] != wire5[(1'h0):(1'h0)])));
  assign wire13 = ((~^{((wire9 ? (8'hbe) : (8'hbe)) << {wire10, wire8}),
                      ($signed((7'h44)) ?
                          (wire10 ? wire10 : wire12) : (+wire1))}) - wire11);
  module14 #() modinst276 (.wire19(wire9), .clk(clk), .wire16(wire12), .wire17(wire3), .y(wire275), .wire15(wire10), .wire18(wire2));
  assign wire277 = ($signed(($unsigned(wire9) ?
                           ($unsigned(wire7) ?
                               (|wire275) : wire2[(3'h4):(1'h0)]) : (wire13[(3'h6):(3'h5)] ?
                               $unsigned((8'ha3)) : (wire10 ?
                                   wire9 : wire7)))) ?
                       (+$signed(($unsigned((8'ha3)) >>> (~^(8'ha8))))) : ((^wire12) ^ wire11));
  assign wire278 = wire8;
endmodule

module module14
#(parameter param273 = {(^{((~|(8'ha6)) ? ((8'hac) ? (8'hac) : (8'hbb)) : {(8'ha9), (8'hb2)}), ({(8'hae)} ? (-(8'hb5)) : ((8'hb8) ? (8'hb8) : (8'h9d)))})}, 
parameter param274 = (!(param273 | ((param273 ? (param273 ? param273 : param273) : ((8'hb8) - param273)) ^~ param273))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(4'hb):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire272;
  wire signed [(3'h4):(1'h0)] wire270;
  wire signed [(2'h3):(1'h0)] wire193;
  wire signed [(2'h2):(1'h0)] wire192;
  wire signed [(4'hf):(1'h0)] wire191;
  wire signed [(4'h8):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire146;
  wire [(2'h3):(1'h0)] wire186;
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  assign y = {wire272,
                 wire270,
                 wire193,
                 wire192,
                 wire191,
                 wire189,
                 wire188,
                 wire144,
                 wire91,
                 wire90,
                 wire89,
                 wire75,
                 wire73,
                 wire21,
                 wire20,
                 wire146,
                 wire186,
                 reg92,
                 reg88,
                 reg87,
                 reg86,
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
                 reg190,
                 (1'h0)};
  assign wire20 = (^~wire18);
  assign wire21 = wire18[(3'h7):(1'h1)];
  module22 #() modinst74 (wire73, clk, wire21, wire15, wire20, wire17);
  assign wire75 = (wire21 ?
                      $signed(wire17[(4'h9):(4'h8)]) : $signed((!(wire21 ?
                          wire21 : ((8'hb0) ? wire21 : wire16)))));
  always
    @(posedge clk) begin
      reg76 <= $unsigned((wire73 && (|{{wire20, wire16}})));
      if ({$unsigned(wire19[(1'h0):(1'h0)])})
        begin
          reg77 <= $unsigned(((wire15[(3'h6):(1'h1)] | ((wire17 ?
                  reg76 : wire19) ^~ (wire18 ? wire19 : wire17))) ?
              (!$signed(wire18)) : wire18[(3'h7):(3'h4)]));
          reg78 <= (-reg77);
          reg79 <= ($signed($unsigned((~(wire15 >>> (8'hb6))))) ?
              $signed((wire18 << {(!reg76)})) : wire75[(4'ha):(3'h4)]);
        end
      else
        begin
          reg77 <= wire15[(3'h6):(1'h1)];
          reg78 <= $unsigned((~|{{(reg79 ? wire73 : wire15),
                  (wire16 << wire16)},
              wire21}));
        end
      if ((~(|wire19[(2'h2):(2'h2)])))
        begin
          reg80 <= $unsigned(reg76);
          reg81 <= (8'hb6);
        end
      else
        begin
          if ($signed({({$signed(wire21)} ?
                  $unsigned({wire16}) : $unsigned((~(8'ha4))))}))
            begin
              reg80 <= wire15[(2'h3):(2'h3)];
              reg81 <= ((~&$signed($signed($signed(wire75)))) ^ (^$unsigned((~|(reg81 ?
                  reg78 : wire16)))));
              reg82 <= $unsigned(((8'hbe) ?
                  ($signed($signed((7'h43))) && $unsigned((wire17 ?
                      wire15 : wire19))) : $signed(reg81)));
              reg83 <= (~^((~&(8'hb5)) ?
                  $unsigned(({wire19} ?
                      wire18[(1'h0):(1'h0)] : (reg80 <= wire16))) : (8'hae)));
              reg84 <= wire15;
            end
          else
            begin
              reg80 <= (reg84[(4'hb):(3'h4)] && (($signed(wire18[(3'h5):(3'h4)]) ^~ ((^reg80) > (reg77 > wire20))) | {(reg81 == $signed(wire75))}));
              reg81 <= (reg80[(4'hc):(2'h3)] >>> {wire15[(4'ha):(1'h0)]});
              reg82 <= $unsigned((($unsigned($signed(reg80)) ?
                      (!{reg76,
                          reg78}) : ($signed(wire21) ^~ wire75[(1'h1):(1'h1)])) ?
                  reg84 : wire15));
              reg83 <= ($signed((reg80[(4'hc):(4'h9)] ?
                      (&(^wire15)) : reg76[(2'h3):(2'h3)])) ?
                  $signed(((+$signed(wire17)) >= reg79[(1'h0):(1'h0)])) : $unsigned((!(&(^~reg82)))));
            end
          reg85 <= (((^~reg82[(5'h12):(4'hb)]) ?
                  {({wire15, wire19} ? (-(7'h43)) : (reg77 << wire16)),
                      $signed($unsigned(reg76))} : $signed({(wire17 ?
                          wire73 : wire73)})) ?
              (~(reg77[(4'hc):(4'hb)] | (reg84 ^ wire17[(1'h0):(1'h0)]))) : (7'h42));
        end
      if ($unsigned($unsigned($signed(reg85))))
        begin
          reg86 <= wire21;
          reg87 <= ((((-$unsigned(reg82)) ?
                  (reg79 ? reg86 : $signed(wire18)) : (((8'ha9) ?
                      reg83 : reg84) < $signed(reg84))) ?
              ((+wire73[(3'h5):(2'h2)]) ?
                  $signed($signed(wire17)) : wire17) : $unsigned(wire20[(2'h2):(1'h0)])) | ({wire16,
              (reg84 ?
                  reg85[(3'h4):(2'h3)] : (wire73 << (8'ha5)))} != $signed(reg76)));
        end
      else
        begin
          reg86 <= reg76;
        end
      reg88 <= $signed(wire16);
    end
  assign wire89 = reg78;
  assign wire90 = reg80[(3'h6):(3'h6)];
  assign wire91 = {{reg80}};
  always
    @(posedge clk) begin
      reg92 <= ($unsigned((~&$signed(reg79))) ?
          (&(~$unsigned((^~reg76)))) : wire20);
    end
  module93 #() modinst145 (.wire95(wire15), .y(wire144), .wire96(reg79), .clk(clk), .wire94(wire21), .wire97(wire73));
  assign wire146 = (((&(+wire90[(2'h2):(2'h2)])) ?
                       $signed(({wire20, wire20} ?
                           $unsigned(wire90) : (wire144 ?
                               wire15 : wire20))) : {({wire90} ^~ reg78),
                           (8'haa)}) - reg78);
  module147 #() modinst187 (wire186, clk, wire89, wire15, wire144, reg76, reg86);
  assign wire188 = {(|(((reg77 >= wire19) ?
                           (wire73 >>> reg86) : reg82[(3'h7):(3'h7)]) | (((8'ha0) ?
                               wire21 : wire90) ?
                           reg92[(1'h0):(1'h0)] : (wire15 ? reg82 : wire75))))};
  assign wire189 = $signed(((~(!(~wire91))) ?
                       (wire17[(4'hc):(4'hb)] ?
                           ((^~wire20) ?
                               $signed(reg88) : (~^reg78)) : $unsigned(reg92)) : $unsigned($signed({reg92,
                           wire89}))));
  always
    @(posedge clk) begin
      reg190 <= $unsigned((~^($signed((&reg81)) <<< (~|{wire89, reg86}))));
    end
  assign wire191 = $signed($unsigned(($unsigned((reg77 ~^ wire16)) - $signed($signed(wire189)))));
  assign wire192 = {reg87[(4'hc):(4'hc)]};
  assign wire193 = ((^~wire191[(4'hd):(3'h5)]) && reg84);
  module194 #() modinst271 (.clk(clk), .wire195(wire75), .wire196(reg82), .y(wire270), .wire199(reg92), .wire197(wire19), .wire198(reg76));
  assign wire272 = reg83[(2'h3):(1'h1)];
endmodule

module module194
#(parameter param269 = (&(!((((8'hb5) <= (7'h42)) + (~(8'hb0))) ? (&((8'ha2) != (8'ha1))) : (~((8'hae) ? (8'hb8) : (8'ha3)))))))
(y, clk, wire199, wire198, wire197, wire196, wire195);
  output wire [(32'h345):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire199;
  input wire [(4'hd):(1'h0)] wire198;
  input wire signed [(4'hb):(1'h0)] wire197;
  input wire [(4'h9):(1'h0)] wire196;
  input wire signed [(5'h15):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire267;
  wire [(3'h6):(1'h0)] wire245;
  wire [(3'h7):(1'h0)] wire244;
  wire [(4'ha):(1'h0)] wire238;
  wire signed [(5'h10):(1'h0)] wire237;
  wire signed [(3'h4):(1'h0)] wire236;
  wire [(2'h2):(1'h0)] wire220;
  wire signed [(5'h12):(1'h0)] wire219;
  wire [(4'he):(1'h0)] wire218;
  wire [(3'h4):(1'h0)] wire217;
  wire [(5'h12):(1'h0)] wire206;
  wire [(3'h6):(1'h0)] wire205;
  reg [(5'h14):(1'h0)] reg268 = (1'h0);
  reg [(5'h15):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg265 = (1'h0);
  reg [(4'h9):(1'h0)] reg264 = (1'h0);
  reg [(5'h12):(1'h0)] reg263 = (1'h0);
  reg [(4'he):(1'h0)] reg262 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg261 = (1'h0);
  reg [(5'h14):(1'h0)] reg260 = (1'h0);
  reg [(5'h10):(1'h0)] reg259 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg258 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg257 = (1'h0);
  reg [(3'h4):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg255 = (1'h0);
  reg [(4'he):(1'h0)] reg254 = (1'h0);
  reg [(5'h10):(1'h0)] reg253 = (1'h0);
  reg [(3'h7):(1'h0)] reg252 = (1'h0);
  reg [(4'hb):(1'h0)] reg251 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg250 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg249 = (1'h0);
  reg [(2'h3):(1'h0)] reg248 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg247 = (1'h0);
  reg [(5'h13):(1'h0)] reg246 = (1'h0);
  reg [(4'hb):(1'h0)] reg243 = (1'h0);
  reg [(5'h12):(1'h0)] reg242 = (1'h0);
  reg [(4'ha):(1'h0)] reg241 = (1'h0);
  reg [(5'h14):(1'h0)] reg240 = (1'h0);
  reg [(5'h15):(1'h0)] reg239 = (1'h0);
  reg [(5'h11):(1'h0)] reg235 = (1'h0);
  reg [(5'h14):(1'h0)] reg234 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg233 = (1'h0);
  reg [(2'h3):(1'h0)] reg232 = (1'h0);
  reg [(4'hd):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg230 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg228 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg227 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg226 = (1'h0);
  reg [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg224 = (1'h0);
  reg [(3'h6):(1'h0)] reg223 = (1'h0);
  reg [(3'h4):(1'h0)] reg222 = (1'h0);
  reg signed [(4'he):(1'h0)] reg221 = (1'h0);
  reg [(5'h13):(1'h0)] reg216 = (1'h0);
  reg [(5'h11):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg213 = (1'h0);
  reg [(5'h12):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg211 = (1'h0);
  reg [(5'h13):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg207 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg204 = (1'h0);
  reg [(3'h6):(1'h0)] reg203 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg200 = (1'h0);
  assign y = {wire267,
                 wire245,
                 wire244,
                 wire238,
                 wire237,
                 wire236,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire206,
                 wire205,
                 reg268,
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
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg200 <= (!$unsigned($signed((wire196[(3'h5):(2'h3)] ?
          {wire195} : (wire195 ? wire195 : wire196)))));
      reg201 <= ((~^wire199[(3'h7):(2'h3)]) + wire199);
      reg202 <= $signed((&$signed(wire199)));
      reg203 <= ($signed(wire199[(1'h1):(1'h1)]) ^ wire197[(4'h8):(4'h8)]);
      reg204 <= wire199;
    end
  assign wire205 = (reg200[(1'h1):(1'h0)] ?
                       reg200 : $signed(($signed((reg204 ? reg203 : reg202)) ?
                           (&wire196[(1'h1):(1'h0)]) : $unsigned((reg200 && reg204)))));
  assign wire206 = $unsigned((!$signed(wire199)));
  always
    @(posedge clk) begin
      if (({wire205[(1'h1):(1'h1)], $unsigned(((^~reg204) - reg202))} ?
          (^~((~wire197[(3'h6):(3'h5)]) >= $unsigned((reg201 ?
              wire198 : reg201)))) : reg203))
        begin
          reg207 <= $signed($unsigned(reg202[(2'h2):(1'h1)]));
        end
      else
        begin
          if (($unsigned($signed(({reg207, reg201} ?
                  reg201[(3'h6):(3'h6)] : (~&reg202)))) ?
              $unsigned(wire199[(4'h8):(3'h6)]) : reg201))
            begin
              reg207 <= $signed(wire196);
              reg208 <= (({$signed((wire205 ? reg203 : reg203))} ?
                  $signed(reg201) : $signed(($unsigned(reg204) ?
                      $unsigned(wire196) : (~&reg201)))) >> wire197);
              reg209 <= (reg200[(3'h6):(2'h3)] ?
                  (&wire195[(4'hd):(4'hd)]) : reg207);
            end
          else
            begin
              reg207 <= {$unsigned((((wire196 * (8'ha0)) ?
                      (reg202 ?
                          wire205 : wire199) : (~^wire196)) || (|$signed(wire195))))};
              reg208 <= $signed(reg202);
            end
        end
      if (($unsigned($unsigned({$signed(wire205),
              ((7'h40) ? reg207 : wire206)})) ?
          ($unsigned(reg209[(2'h3):(1'h0)]) ?
              $unsigned((!reg203)) : $unsigned(reg204[(1'h1):(1'h0)])) : $signed((&wire205))))
        begin
          reg210 <= (~&wire205[(3'h5):(1'h1)]);
          reg211 <= {$signed((($signed(wire195) | (wire206 ?
                      (8'hb5) : wire197)) ?
                  $signed(wire196) : wire195))};
          reg212 <= (8'haf);
          reg213 <= {wire195};
        end
      else
        begin
          reg210 <= (^(-(^($unsigned(reg207) ?
              (reg212 >= wire197) : reg208[(4'hb):(4'h8)]))));
          if (reg200[(3'h4):(1'h1)])
            begin
              reg211 <= reg204;
              reg212 <= $unsigned(($signed(wire198[(1'h1):(1'h0)]) <= {reg203}));
              reg213 <= (7'h43);
            end
          else
            begin
              reg211 <= wire196[(3'h5):(2'h2)];
              reg212 <= $signed(($signed(reg201) ?
                  $unsigned($unsigned(wire198[(1'h1):(1'h1)])) : ((^$signed(wire205)) >> ($unsigned(wire197) ?
                      reg211 : reg202))));
            end
          reg214 <= $signed(wire198[(4'hd):(4'hd)]);
          reg215 <= $unsigned({reg201});
        end
      reg216 <= $signed((({$signed(wire198), $unsigned(wire196)} == ((reg214 ?
                  wire198 : reg204) ?
              (reg204 <= reg202) : (wire205 <= reg204))) ?
          (+({(8'hb2)} ?
              $unsigned(wire205) : {reg214,
                  wire198})) : $unsigned($signed((wire205 ~^ (8'hb9))))));
    end
  assign wire217 = $unsigned(reg201[(3'h6):(3'h5)]);
  assign wire218 = (reg200[(3'h4):(2'h2)] ?
                       {reg215} : ($unsigned(((^reg212) >= $signed(reg208))) == ((+$signed(reg209)) ?
                           wire199 : (8'hbb))));
  assign wire219 = ((!$signed($signed($signed(reg203)))) ?
                       (^~reg201) : ({reg208} ?
                           $unsigned($signed((+wire206))) : {((+reg203) ?
                                   {reg216, reg209} : (~^wire196))}));
  assign wire220 = $signed(((-((^~(7'h40)) ?
                           (reg207 >>> wire195) : ((8'hbd) | wire206))) ?
                       ((^~(wire198 ? reg202 : reg207)) ?
                           $signed(wire218[(4'h8):(3'h6)]) : $signed(wire195[(5'h10):(4'hd)])) : $signed(reg202[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg221 <= $signed((($signed((~reg211)) ? reg215 : (+(~&reg216))) ?
          ({((8'ha4) ? wire195 : wire197)} | (^(reg216 ?
              (8'ha1) : reg209))) : (8'ha8)));
      if (reg210[(5'h13):(5'h13)])
        begin
          reg222 <= ((^wire198[(4'hc):(3'h4)]) + (reg215[(4'ha):(1'h1)] ?
              reg207 : (((reg214 > wire217) | (wire206 | reg200)) - ((^~wire195) ?
                  wire217[(3'h4):(2'h2)] : (wire206 - wire218)))));
          if (($unsigned((((~|(8'ha8)) ? reg207[(3'h4):(1'h1)] : {wire220}) ?
                  $unsigned(wire217) : wire195[(4'h9):(3'h7)])) ?
              $signed($unsigned($unsigned((wire219 ?
                  reg200 : reg207)))) : (($signed($signed(reg208)) ?
                  ({reg207} ?
                      (8'h9d) : $unsigned(reg216)) : ($unsigned(wire205) & $signed(reg203))) ^~ $unsigned(((reg201 ?
                      wire199 : (8'hba)) ?
                  $unsigned(reg221) : (wire217 >>> (8'ha7)))))))
            begin
              reg223 <= $signed(reg201);
              reg224 <= (wire218[(4'hb):(4'hb)] ?
                  ((({wire219} ? $unsigned(reg201) : $unsigned(reg209)) ?
                      {reg221,
                          wire199} : (!$signed((8'hb3)))) >> reg207[(4'h8):(3'h6)]) : $unsigned((+(^~reg203[(3'h6):(2'h3)]))));
              reg225 <= ($signed(reg201[(1'h0):(1'h0)]) ?
                  ($signed($unsigned((reg207 > (8'ha3)))) ?
                      (^~wire220[(2'h2):(1'h1)]) : (reg207[(4'h9):(1'h1)] >= ((reg212 ?
                              reg201 : wire217) ?
                          $unsigned(reg223) : $signed(reg209)))) : $signed($unsigned($unsigned((reg211 ?
                      (8'h9e) : reg222)))));
            end
          else
            begin
              reg223 <= (($signed((|(wire220 ? reg223 : reg203))) ?
                  ($unsigned({wire206,
                      reg222}) ^~ reg203[(2'h2):(1'h1)]) : ($signed((~|(8'h9e))) ?
                      ((reg208 >>> wire196) ?
                          reg201[(1'h0):(1'h0)] : $signed(reg210)) : ((^~reg214) ?
                          (!reg207) : (~(8'hb3))))) && ({$signed(((8'hae) < reg225))} ~^ ($unsigned((reg211 ?
                  wire218 : reg211)) & $signed((reg203 ? reg214 : (8'ha6))))));
              reg224 <= $signed((((reg202 ?
                      wire198[(2'h3):(1'h1)] : $signed(reg214)) && (reg202[(3'h4):(1'h1)] * $unsigned(reg223))) ?
                  reg214 : (^~reg215[(3'h6):(1'h0)])));
              reg225 <= $signed((+$signed((~(~&reg200)))));
              reg226 <= (+reg216[(5'h13):(4'hb)]);
              reg227 <= $signed($unsigned($unsigned({$unsigned(reg209),
                  wire199[(3'h6):(3'h4)]})));
            end
          reg228 <= (wire198 != ($signed((8'ha2)) | (!(wire196[(3'h5):(2'h3)] | (8'h9d)))));
          reg229 <= $unsigned((8'ha2));
        end
      else
        begin
          if (($unsigned((reg226 > {reg203, (+reg210)})) ?
              $unsigned($unsigned((^~{reg227,
                  wire218}))) : ((($unsigned(wire195) ?
                  $signed((7'h44)) : (8'hbc)) - wire199[(3'h6):(2'h2)]) == ($signed($unsigned(wire195)) <<< (8'ha9)))))
            begin
              reg222 <= $signed({($unsigned(reg221) ^ $signed(reg229[(3'h5):(1'h1)])),
                  {$unsigned(reg222)}});
              reg223 <= wire199[(4'h9):(3'h6)];
              reg224 <= (reg211 ? (^~(^~(^~{(8'ha7)}))) : $unsigned(reg202));
              reg225 <= (~{(!({reg214} ? wire198 : $signed(wire196))),
                  $signed($signed($signed((8'hae))))});
            end
          else
            begin
              reg222 <= reg200;
              reg223 <= $signed($unsigned($unsigned(wire205)));
              reg224 <= $unsigned(reg213);
              reg225 <= (wire206 ? reg213 : reg222[(1'h0):(1'h0)]);
              reg226 <= reg203;
            end
          if (reg226[(4'h8):(3'h7)])
            begin
              reg227 <= (wire197 ~^ (~|$unsigned({$signed((8'ha8))})));
              reg228 <= (reg209 ?
                  reg212 : ((8'hbb) <= $unsigned($signed((~&reg204)))));
            end
          else
            begin
              reg227 <= $unsigned($unsigned(((8'haa) ?
                  reg213[(2'h3):(1'h0)] : (|$unsigned(reg202)))));
              reg228 <= $unsigned($signed($signed(($unsigned(wire199) ?
                  (reg225 ~^ wire220) : wire206[(3'h4):(2'h2)]))));
              reg229 <= $signed(reg202[(3'h6):(3'h6)]);
            end
          reg230 <= (~|(~|{{(-(8'ha4)), reg213}}));
          reg231 <= ((^($unsigned($unsigned(reg225)) ?
              (+$unsigned(wire217)) : $signed((reg222 < reg202)))) ^~ $signed(($unsigned($signed(wire205)) << reg221[(4'hb):(1'h0)])));
          reg232 <= wire217;
        end
      reg233 <= {$signed($unsigned($unsigned($signed((8'ha2))))), reg226};
      reg234 <= (reg222[(2'h2):(1'h1)] ?
          wire197 : ($signed($unsigned((+wire199))) ?
              wire218 : $signed(wire198[(4'hc):(4'h8)])));
      reg235 <= {(reg212 << ((reg227[(1'h1):(1'h1)] ~^ (reg231 ?
              (8'ha3) : wire220)) | (8'ha7))),
          reg224};
    end
  assign wire236 = ($unsigned(reg202[(1'h0):(1'h0)]) & reg201[(2'h3):(1'h0)]);
  assign wire237 = (reg229 ?
                       (-(reg231[(2'h2):(2'h2)] ?
                           $unsigned(wire218) : ((reg232 ? reg204 : reg234) ?
                               reg224 : wire206))) : {(^(&(wire198 ?
                               wire198 : wire206)))});
  assign wire238 = $unsigned(((!(~&$signed(reg201))) < ($signed($unsigned(reg213)) * (wire218[(4'h8):(4'h8)] ?
                       $unsigned(reg229) : wire205))));
  always
    @(posedge clk) begin
      reg239 <= ({reg222[(3'h4):(1'h1)]} ? {(8'haf)} : $unsigned(reg211));
      reg240 <= (!$unsigned($signed(reg209)));
      reg241 <= $signed($unsigned(reg229));
      reg242 <= ((^~(~$unsigned((+reg233)))) ~^ $unsigned($unsigned($unsigned(((8'hb5) ?
          wire236 : reg221)))));
      reg243 <= ((8'ha7) ^~ (^~($signed((reg211 ?
          reg234 : reg232)) <<< (~|reg231))));
    end
  assign wire244 = (wire218 ?
                       ($signed($unsigned(reg229)) ?
                           ($signed($unsigned(wire237)) ?
                               wire237[(1'h1):(1'h1)] : ($signed(wire220) ?
                                   reg216[(5'h10):(4'he)] : ((8'hbf) >>> reg223))) : ($signed((wire217 ?
                                   (8'hab) : (8'ha2))) ?
                               (reg207[(4'h8):(3'h5)] & $signed(reg229)) : (~{wire219,
                                   wire236}))) : ((~^$unsigned(wire196[(3'h7):(3'h4)])) | ({(^~wire197),
                           $unsigned((8'hae))} && ($unsigned((8'ha2)) ?
                           {wire206} : $signed(reg233)))));
  assign wire245 = wire198;
  always
    @(posedge clk) begin
      reg246 <= $unsigned(((reg204 != (~&$signed(reg229))) ?
          {($unsigned(reg214) | (~|reg224))} : ($unsigned(wire220) ?
              $unsigned(reg216[(3'h4):(1'h0)]) : reg235)));
      reg247 <= (~&reg233[(3'h5):(3'h4)]);
      reg248 <= reg243;
      if (({$unsigned(reg230[(3'h6):(3'h5)])} ? reg201[(3'h7):(3'h7)] : reg224))
        begin
          reg249 <= ((^~(~&{(^(8'h9d))})) << {wire206[(3'h7):(3'h4)],
              (reg243 ? reg212 : $unsigned((reg241 - wire217)))});
          reg250 <= $unsigned({reg226[(3'h7):(2'h2)],
              {(^(8'h9c)),
                  ($unsigned(reg211) ?
                      (reg214 ? wire218 : reg224) : $signed(reg203))}});
          reg251 <= ((~&($signed((reg239 ?
              reg235 : reg241)) ^ wire197[(3'h5):(2'h2)])) | (reg230 ?
              (reg227[(1'h1):(1'h1)] ?
                  ($signed((7'h41)) ?
                      (^reg248) : (reg249 != wire199)) : ((reg248 || wire219) ?
                      (8'hbf) : $unsigned(reg214))) : $signed(((reg201 ^~ reg207) >> {reg240,
                  reg208}))));
        end
      else
        begin
          if ({wire198})
            begin
              reg249 <= (~&$unsigned($unsigned(((^wire199) >> (wire245 & (8'ha4))))));
              reg250 <= reg232;
              reg251 <= $signed(reg242[(4'hb):(1'h1)]);
            end
          else
            begin
              reg249 <= ((^$signed($signed((wire198 | reg203)))) ?
                  $unsigned(wire197) : ($signed((reg207[(4'h8):(3'h6)] ?
                          (reg211 >> reg212) : (reg223 ? reg210 : reg222))) ?
                      (reg203[(3'h4):(2'h2)] ?
                          (((7'h40) ~^ (8'ha9)) > reg214) : $unsigned((^~reg200))) : $signed(reg204[(1'h0):(1'h0)])));
              reg250 <= wire219;
              reg251 <= $unsigned(((({reg204} ?
                  (8'ha6) : $unsigned(wire197)) <= ($unsigned(reg243) ?
                  $unsigned(reg250) : reg239)) << wire218[(3'h7):(3'h5)]));
              reg252 <= reg230[(2'h2):(2'h2)];
              reg253 <= {$signed(reg252),
                  {(reg207 ? wire217 : {{reg203}, reg215[(2'h3):(1'h1)]}),
                      reg233[(3'h5):(2'h3)]}};
            end
        end
      reg254 <= $unsigned((($unsigned($signed((8'had))) + wire218) << ((~(~&reg249)) ~^ ((reg253 < reg235) >> $unsigned(reg253)))));
    end
  always
    @(posedge clk) begin
      reg255 <= ({$unsigned($signed((reg210 - (8'hb8))))} ?
          ((-(((8'ha2) ?
              reg209 : wire205) <= (|reg213))) ~^ $signed($unsigned(((8'h9e) ?
              reg212 : reg252)))) : wire220);
    end
  always
    @(posedge clk) begin
      reg256 <= $signed(reg202[(1'h1):(1'h0)]);
      reg257 <= $signed((((~&(wire236 << reg202)) ?
          reg216[(4'hc):(4'hb)] : (-(reg222 || reg235))) >>> reg211[(4'hd):(1'h1)]));
      if (wire244[(3'h5):(2'h3)])
        begin
          if (((~&$signed(($unsigned(reg256) - wire236))) ?
              ($signed((reg246 ? (&reg249) : (-(7'h43)))) ?
                  (&wire217) : reg216) : $unsigned($signed($signed(wire219[(4'hc):(3'h6)])))))
            begin
              reg258 <= reg203[(1'h1):(1'h1)];
              reg259 <= wire220;
              reg260 <= (reg250 >> ((wire236 + ((reg216 != wire219) != (reg208 + reg213))) ?
                  reg213[(4'h8):(3'h6)] : $signed(reg200[(1'h0):(1'h0)])));
              reg261 <= reg225[(4'h8):(1'h1)];
            end
          else
            begin
              reg258 <= $unsigned((^wire219[(4'hf):(2'h3)]));
              reg259 <= reg222[(1'h1):(1'h0)];
              reg260 <= $signed($unsigned($signed(reg207[(3'h7):(3'h6)])));
              reg261 <= ({$signed((reg204 <<< reg254[(2'h2):(1'h0)]))} ?
                  $signed(reg229) : $unsigned((~|(^(^wire219)))));
              reg262 <= ((^~$unsigned(reg222)) ~^ (~^(($unsigned((7'h43)) || $unsigned(reg215)) ?
                  {reg216} : wire196[(4'h8):(1'h1)])));
            end
          if (wire196)
            begin
              reg263 <= reg207;
            end
          else
            begin
              reg263 <= $unsigned(wire236[(1'h0):(1'h0)]);
              reg264 <= (!($signed($signed({reg250,
                  reg262})) < reg253[(3'h4):(1'h0)]));
              reg265 <= reg234;
              reg266 <= (($unsigned($unsigned(reg252[(1'h0):(1'h0)])) ?
                  reg203 : (8'hac)) >= reg212);
            end
        end
      else
        begin
          if ($signed(wire237[(4'h9):(3'h4)]))
            begin
              reg258 <= {({reg239[(5'h14):(4'hb)]} ?
                      ((((8'ha8) ? wire245 : reg259) || (reg248 ?
                          reg214 : reg254)) + $signed(reg201)) : ((^~$signed((7'h44))) ?
                          (reg208 ?
                              (reg207 ?
                                  (8'hbe) : wire245) : $signed(reg209)) : (~^(wire205 ?
                              wire199 : reg216)))),
                  reg255};
              reg259 <= ($unsigned(reg201) || wire245[(3'h4):(1'h1)]);
              reg260 <= reg261[(1'h0):(1'h0)];
              reg261 <= $signed((^~$signed(((8'hba) ?
                  {reg233, reg226} : reg214[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg258 <= reg255[(5'h12):(1'h0)];
            end
          reg262 <= ($unsigned($signed(reg215)) ?
              $unsigned(reg230) : $unsigned(($signed((&reg248)) ^ $signed(reg202[(2'h2):(1'h0)]))));
          reg263 <= $unsigned(((~|$signed((reg247 ?
              wire244 : reg223))) != (((reg239 >>> reg241) ?
                  $signed(reg228) : reg247) ?
              $signed(reg252) : $unsigned((reg202 ? reg228 : wire236)))));
        end
    end
  assign wire267 = (reg234 > {({reg209} - {reg224}),
                       $unsigned($signed((reg210 ? reg212 : wire205)))});
  always
    @(posedge clk) begin
      reg268 <= ($unsigned(reg216) ?
          (~|(wire218[(4'hd):(3'h5)] <<< (~reg201[(1'h1):(1'h1)]))) : reg229[(1'h0):(1'h0)]);
    end
endmodule

module module147
#(parameter param185 = {(~|(!(((8'hbf) - (8'ha4)) ? ((7'h40) == (8'hbb)) : ((8'hb5) < (7'h44)))))})
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire152;
  input wire [(3'h4):(1'h0)] wire151;
  input wire [(5'h10):(1'h0)] wire150;
  input wire signed [(4'h9):(1'h0)] wire149;
  input wire [(3'h4):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire183;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire [(4'hc):(1'h0)] wire178;
  wire [(3'h7):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire176;
  wire signed [(4'hc):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire [(2'h2):(1'h0)] wire170;
  wire [(3'h7):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(3'h6):(1'h0)] wire167;
  wire signed [(4'hb):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire154;
  wire signed [(4'ha):(1'h0)] wire153;
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg [(2'h2):(1'h0)] reg181 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg155 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire154,
                 wire153,
                 reg182,
                 reg181,
                 reg173,
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
  assign wire153 = $signed(wire148[(2'h3):(2'h2)]);
  assign wire154 = wire152[(3'h7):(3'h7)];
  always
    @(posedge clk) begin
      reg155 <= $unsigned({wire148[(1'h1):(1'h0)],
          $signed({$unsigned(wire153)})});
      reg156 <= {(wire151 + wire151)};
      if (wire151[(1'h1):(1'h1)])
        begin
          reg157 <= ({$unsigned(wire152[(3'h6):(3'h6)]),
              wire154[(1'h1):(1'h1)]} ^~ wire153);
          reg158 <= {((~|$unsigned($unsigned(reg156))) ?
                  ({(wire154 >>> reg155)} ?
                      $signed(wire148) : (|(wire152 ?
                          reg155 : wire154))) : wire153)};
          reg159 <= $signed($unsigned(($signed($signed(wire154)) ?
              {(-reg158), ((8'h9e) - wire152)} : wire151[(2'h2):(2'h2)])));
          if (($signed(((~|$unsigned(reg159)) >= $unsigned(reg157[(3'h5):(3'h5)]))) ?
              reg155 : (({reg156[(1'h1):(1'h1)]} ?
                  ((-reg158) ? {reg157, wire152} : (&wire149)) : ({reg156} ?
                      (wire154 ^ (8'ha0)) : (8'ha3))) ~^ ($unsigned({wire153,
                      (7'h40)}) ?
                  {(wire152 | wire148)} : (^$unsigned((8'ha8)))))))
            begin
              reg160 <= $signed(wire152[(4'h9):(2'h3)]);
              reg161 <= ($unsigned(reg157[(3'h6):(3'h4)]) ?
                  (!$unsigned((~^$signed(wire153)))) : ($unsigned({wire151[(3'h4):(2'h3)]}) ?
                      $signed($unsigned($unsigned(wire148))) : wire148));
            end
          else
            begin
              reg160 <= $signed((^(~wire150)));
              reg161 <= {{(({reg155} < (wire154 != reg158)) * ((reg161 ?
                          reg158 : reg157) <<< {wire154, reg156})),
                      (((wire151 ? wire151 : (8'ha4)) || ((8'hb4) ?
                              reg155 : wire148)) ?
                          wire149 : reg159)}};
              reg162 <= $unsigned({$unsigned((~^(reg160 ? reg155 : wire153)))});
              reg163 <= reg159[(5'h12):(4'ha)];
            end
        end
      else
        begin
          if ({((7'h43) - $unsigned($signed((~wire154)))), $unsigned(reg155)})
            begin
              reg157 <= wire150[(2'h2):(2'h2)];
              reg158 <= $unsigned($unsigned(wire154));
              reg159 <= ($signed(wire152) ?
                  (wire149 ?
                      $signed((8'h9f)) : reg162[(2'h2):(2'h2)]) : wire151[(2'h2):(1'h0)]);
              reg160 <= $signed($signed($signed((~^(wire150 ?
                  wire152 : reg160)))));
            end
          else
            begin
              reg157 <= ((reg157[(3'h6):(2'h2)] ?
                      wire153[(3'h5):(1'h0)] : wire154[(3'h5):(1'h0)]) ?
                  (!((^~$signed((8'haf))) != (reg160 << $unsigned(reg159)))) : reg156[(1'h0):(1'h0)]);
              reg158 <= (~(^~{(|{wire150})}));
              reg159 <= (wire148 ?
                  (reg161 >= $signed(wire150[(4'he):(1'h1)])) : ($signed((|reg157)) ?
                      (8'hb5) : (^~(|(wire153 ? wire154 : wire150)))));
            end
        end
      reg164 <= $signed(($unsigned((reg156[(4'h8):(2'h3)] || (reg156 & reg155))) ?
          wire148 : (~|$unsigned($signed(wire154)))));
    end
  assign wire165 = reg157[(4'hc):(4'hc)];
  assign wire166 = ({reg157[(4'hc):(2'h2)]} ?
                       $unsigned(reg159[(1'h1):(1'h1)]) : (((&(^(8'ha4))) ?
                               wire151 : wire154[(2'h3):(1'h1)]) ?
                           (~&(wire152 >= (wire165 || wire150))) : $unsigned((^reg160))));
  assign wire167 = (wire166 * ({(wire154[(2'h2):(1'h1)] ?
                           (wire151 ^~ (8'hbf)) : (-wire151)),
                       ((^~wire150) >> reg163)} << wire149));
  assign wire168 = reg160[(5'h10):(5'h10)];
  assign wire169 = wire152[(3'h4):(1'h0)];
  assign wire170 = reg164[(3'h7):(2'h3)];
  assign wire171 = $unsigned(reg163[(5'h14):(1'h0)]);
  assign wire172 = $signed({$unsigned($signed((wire167 >= wire149))),
                       $unsigned((reg155 ~^ wire153[(4'ha):(4'h8)]))});
  always
    @(posedge clk) begin
      reg173 <= {({((wire167 ? (8'hb4) : (8'haa)) > $unsigned((8'h9f))),
              (wire169[(3'h5):(1'h0)] == $signed(wire169))} << {wire170[(2'h2):(1'h0)],
              $signed(wire165)})};
    end
  assign wire174 = $unsigned(reg157);
  assign wire175 = $signed($unsigned($signed(reg159)));
  assign wire176 = $signed({{$signed((8'haf))}});
  assign wire177 = reg161[(3'h4):(1'h1)];
  assign wire178 = (($unsigned(((wire153 ? (8'hb3) : wire176) ?
                           (8'ha5) : (!reg158))) ?
                       wire151 : ($signed(reg159[(5'h11):(4'ha)]) ?
                           (|$signed(wire149)) : $signed($signed(wire172)))) >> {(+{wire176[(4'ha):(3'h4)]})});
  assign wire179 = $signed($signed((($unsigned(reg159) ?
                       wire165 : wire177) >>> (reg158[(4'ha):(1'h1)] ?
                       (wire154 | (8'hb6)) : wire177))));
  assign wire180 = $unsigned((($unsigned((-wire154)) * $unsigned($signed(wire178))) >>> $unsigned({(-wire171),
                       wire178})));
  always
    @(posedge clk) begin
      reg181 <= wire172;
      reg182 <= $unsigned(reg161[(1'h0):(1'h0)]);
    end
  assign wire183 = (|wire154[(2'h2):(1'h0)]);
  assign wire184 = wire168[(3'h4):(3'h4)];
endmodule

module module93
#(parameter param143 = ((&((~|{(8'haf)}) ? ({(8'hba), (8'hb3)} ? (-(8'ha7)) : ((8'ha1) ? (7'h41) : (8'hb1))) : ((!(8'hb2)) ? ((8'hb8) < (7'h42)) : ((8'h9c) ? (8'h9c) : (8'hba))))) <<< (~(|((~|(7'h41)) & ((8'h9f) == (8'had)))))))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire97;
  input wire [(2'h2):(1'h0)] wire96;
  input wire [(4'hd):(1'h0)] wire95;
  input wire [(5'h12):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  wire signed [(2'h3):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire98;
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
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
                 reg99,
                 (1'h0)};
  assign wire98 = (~|($signed(wire96) ?
                      (~|((-wire94) & (wire94 ?
                          wire94 : wire97))) : ($unsigned(wire94[(5'h11):(5'h11)]) <<< wire97)));
  always
    @(posedge clk) begin
      reg99 <= (-(&$unsigned(wire94)));
    end
  assign wire100 = $unsigned($signed($signed(wire94)));
  assign wire101 = wire94[(4'hb):(3'h6)];
  assign wire102 = wire94[(2'h2):(1'h1)];
  assign wire103 = {$signed((8'hb3)),
                       (((|wire95) ?
                               $signed($unsigned(wire101)) : $unsigned({wire97})) ?
                           $signed(wire97[(3'h7):(2'h3)]) : $unsigned(wire94))};
  always
    @(posedge clk) begin
      if ({($unsigned($signed(((8'h9f) ?
              wire95 : wire94))) & $unsigned(wire96))})
        begin
          if (wire100)
            begin
              reg104 <= $signed($signed((~(wire98 ?
                  $signed(wire103) : $signed(wire95)))));
              reg105 <= reg104;
              reg106 <= $unsigned($signed((~&(wire98 ?
                  $unsigned(wire101) : wire101))));
            end
          else
            begin
              reg104 <= wire97;
              reg105 <= wire95;
              reg106 <= (|(((|wire101) && ({(8'hac), wire103} ?
                  $unsigned(reg99) : ((8'ha2) ~^ wire95))) || (8'hb7)));
            end
          reg107 <= {(8'ha5)};
          if ($unsigned(reg104))
            begin
              reg108 <= (|wire101[(2'h2):(1'h0)]);
              reg109 <= $unsigned(wire98);
              reg110 <= $unsigned({$signed((-$unsigned(wire94))), (^~reg105)});
            end
          else
            begin
              reg108 <= $unsigned($signed(wire97));
            end
          reg111 <= ((^~$unsigned((+(+reg106)))) >= wire94);
        end
      else
        begin
          if (reg109)
            begin
              reg104 <= (8'h9e);
            end
          else
            begin
              reg104 <= wire100;
              reg105 <= ((8'ha7) && $unsigned({(wire96 - $signed((8'hb6))),
                  (wire100 ? $unsigned(reg108) : wire95[(1'h0):(1'h0)])}));
              reg106 <= $unsigned(wire98);
              reg107 <= (8'hb6);
              reg108 <= reg105;
            end
          reg109 <= (~^(8'ha1));
          reg110 <= $signed(reg106);
          reg111 <= $unsigned($unsigned($signed((^reg108))));
          reg112 <= $signed(reg108);
        end
    end
  always
    @(posedge clk) begin
      reg113 <= {($signed(reg105) ?
              wire101 : (wire102[(2'h2):(1'h0)] >> (~(8'hb7)))),
          $signed(reg109[(5'h12):(2'h3)])};
      reg114 <= (-$signed($unsigned(wire95)));
      reg115 <= (reg114 - (-$signed(wire95[(2'h3):(2'h3)])));
    end
  assign wire116 = ($signed((~^((^~reg108) <= {reg111,
                       reg106}))) <= $signed((&$signed((wire101 & reg104)))));
  assign wire117 = {($signed(reg111[(2'h2):(2'h2)]) ?
                           ($unsigned((reg107 | wire116)) >> $signed((~^(8'ha3)))) : $signed(wire94[(3'h5):(3'h4)])),
                       ({(reg111 ? reg111 : reg107)} ?
                           ({$unsigned(wire94),
                               reg109[(4'h8):(4'h8)]} | $unsigned(wire98)) : $signed(($unsigned(wire97) < wire102)))};
  assign wire118 = ($signed(wire95) != $signed(($signed($unsigned(reg105)) ?
                       (^(+wire98)) : $unsigned({reg112, (8'hba)}))));
  assign wire119 = (reg108 ? wire96 : wire103[(4'ha):(4'h9)]);
  assign wire120 = {wire116};
  assign wire121 = ({(($unsigned(wire100) >>> (reg106 ? reg111 : wire116)) ?
                           $signed($unsigned(reg111)) : {$unsigned(reg108),
                               $signed((8'ha1))})} ~^ wire96);
  assign wire122 = $unsigned(reg108);
  assign wire123 = $unsigned((reg99[(4'h9):(3'h5)] ?
                       (^~((reg109 < wire116) ^ (^~wire97))) : (8'hb2)));
  always
    @(posedge clk) begin
      reg124 <= $signed((8'hbf));
      reg125 <= (((-$signed(reg115)) ?
          $signed(wire120[(4'hc):(3'h5)]) : $unsigned(wire101)) | {(wire95[(4'ha):(3'h4)] > $signed((8'hbf)))});
      reg126 <= $signed((-$signed($unsigned((wire117 ? wire101 : wire118)))));
      if ((reg107 > $unsigned(wire101[(2'h2):(2'h2)])))
        begin
          reg127 <= ((reg113 ^~ (($unsigned((8'h9e)) ?
              (~|reg110) : (&reg114)) - reg99)) ~^ (reg110[(3'h6):(2'h3)] >>> $unsigned($signed(reg113[(3'h6):(2'h3)]))));
          reg128 <= (&reg114[(3'h4):(2'h2)]);
          reg129 <= $unsigned((~&wire100));
          reg130 <= {$signed((+reg110)), wire95[(2'h2):(1'h1)]};
          if ($unsigned(($unsigned((wire121 ? (8'ha4) : reg99[(2'h3):(2'h2)])) ?
              $unsigned(reg108[(1'h0):(1'h0)]) : ($unsigned(reg111[(1'h1):(1'h1)]) << (8'ha5)))))
            begin
              reg131 <= ((^$signed(($signed(reg106) ^~ (wire103 ?
                      wire101 : reg128)))) ?
                  reg110[(3'h4):(1'h0)] : $unsigned((+((8'ha7) == (wire100 ?
                      (8'ha6) : reg112)))));
              reg132 <= $unsigned(wire97);
            end
          else
            begin
              reg131 <= $unsigned(((!$signed($signed((8'h9c)))) >= $signed(($signed((8'hbb)) << reg107[(4'h9):(3'h6)]))));
              reg132 <= $signed(((~&(reg131 == {wire119})) ~^ (((~&wire123) ~^ $unsigned(wire101)) - reg104[(3'h6):(3'h4)])));
              reg133 <= $signed({$signed($unsigned($unsigned(reg126)))});
            end
        end
      else
        begin
          reg127 <= reg126;
          if (wire103)
            begin
              reg128 <= reg108;
            end
          else
            begin
              reg128 <= $signed($unsigned(($signed((reg107 ^ wire123)) << ($signed(reg108) != $unsigned(reg115)))));
              reg129 <= $signed((~(reg127 ? (~(wire120 < (8'ha0))) : reg124)));
              reg130 <= $unsigned($unsigned($unsigned(wire103[(4'ha):(3'h5)])));
              reg131 <= $unsigned(((8'ha3) ?
                  $unsigned(reg129) : (((wire123 ? (8'ha5) : reg105) ?
                          (-reg111) : (-reg132)) ?
                      (reg112 * (^(8'hb6))) : $signed($unsigned(reg99)))));
            end
          reg132 <= $signed((-((+(reg114 ?
              (8'ha3) : reg113)) <<< $unsigned(reg111))));
          if ({{$signed($signed(reg99)), $unsigned($unsigned(wire122))}})
            begin
              reg133 <= reg133[(1'h0):(1'h0)];
            end
          else
            begin
              reg133 <= (reg114 ?
                  {(((wire97 | reg112) ?
                          reg104 : $unsigned(reg127)) == (&(reg109 ^~ reg111)))} : (+reg106));
              reg134 <= $unsigned($unsigned((((reg129 <= reg124) < (8'ha9)) ?
                  wire102[(1'h0):(1'h0)] : {reg128, (~|wire98)})));
              reg135 <= $signed((+reg113[(3'h7):(3'h5)]));
              reg136 <= (((7'h43) ^~ (+((wire117 ? wire103 : wire95) ?
                      wire119 : $signed((8'ha2))))) ?
                  ($unsigned(reg133[(4'h8):(3'h4)]) > $unsigned($signed($signed((7'h42))))) : reg133[(3'h5):(3'h4)]);
              reg137 <= wire116;
            end
          reg138 <= reg115;
        end
      if ((^($signed({(reg131 >> reg99), {reg112, reg133}}) ^ $signed(wire98))))
        begin
          if (reg136[(5'h12):(4'hd)])
            begin
              reg139 <= $signed(($signed((-wire96)) ?
                  (~^$signed(reg112)) : (($unsigned(reg114) ~^ $signed(reg126)) && (8'hb6))));
            end
          else
            begin
              reg139 <= $unsigned((reg99[(2'h3):(1'h1)] >>> $signed($unsigned((~&reg113)))));
            end
          reg140 <= wire96;
        end
      else
        begin
          reg139 <= (^reg99);
        end
    end
  assign wire141 = (($signed(reg128) ?
                           ($unsigned(reg135[(3'h5):(1'h0)]) ?
                               reg130[(4'hb):(4'ha)] : $signed(reg131[(4'h9):(3'h4)])) : (8'hb7)) ?
                       (wire121 ?
                           $unsigned($unsigned((reg127 - reg130))) : (^$signed($unsigned((7'h42))))) : ((~|(wire116 ?
                               (~&reg112) : reg125)) ?
                           wire119 : (wire119 ?
                               (((7'h42) ^ wire123) ~^ {(8'hbd)}) : (~&reg139))));
  assign wire142 = reg125;
endmodule

module module22
#(parameter param71 = (~^(~&(8'ha9))), 
parameter param72 = param71)
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire27;
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire27,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = {(($unsigned($signed(wire25)) * ((-wire24) ?
                          $signed(wire26) : wire23)) & (wire25 && $signed((~|wire23)))),
                      wire23};
  always
    @(posedge clk) begin
      reg28 <= wire24[(4'hb):(3'h7)];
      reg29 <= reg28[(4'ha):(3'h4)];
      reg30 <= (~^reg28);
      if ($unsigned($unsigned((~|reg28[(4'h8):(4'h8)]))))
        begin
          reg31 <= wire27;
          reg32 <= $unsigned((~|$unsigned(((!reg30) ?
              $unsigned(reg30) : (wire26 ? wire25 : wire23)))));
          reg33 <= reg30[(4'hb):(4'h9)];
          reg34 <= $unsigned(((^~$unsigned(wire23)) ?
              (!($signed(reg32) || (reg30 - (8'ha2)))) : wire23));
          reg35 <= $signed(wire26[(3'h5):(2'h2)]);
        end
      else
        begin
          reg31 <= ((~^(~$signed((~|reg33)))) ? (~|{wire24}) : reg32);
          reg32 <= $unsigned({reg33[(1'h1):(1'h0)],
              ($signed((-wire23)) ? reg34[(4'he):(4'hb)] : $signed({reg35}))});
        end
      reg36 <= wire27;
    end
  assign wire37 = reg33;
  assign wire38 = ((8'hb5) | wire26);
  assign wire39 = ($unsigned($signed((reg31[(3'h6):(2'h2)] >= (wire26 ?
                      reg34 : (8'hb2))))) < $unsigned((8'h9c)));
  assign wire40 = $signed((+(wire25[(3'h6):(3'h5)] + wire39[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if ({(~$unsigned(((reg31 ? reg32 : reg30) ?
              (wire25 ? wire25 : (8'hae)) : wire24))),
          reg33[(4'hb):(4'h9)]})
        begin
          if (reg30)
            begin
              reg41 <= $unsigned(reg28[(4'h9):(3'h5)]);
              reg42 <= reg33;
              reg43 <= (&((|($signed((8'hb6)) == wire26[(4'hb):(3'h7)])) <<< reg31));
            end
          else
            begin
              reg41 <= ($signed($unsigned(reg28[(1'h0):(1'h0)])) + reg42);
              reg42 <= reg33;
              reg43 <= $signed((8'hba));
              reg44 <= (^$signed((|$unsigned($unsigned((8'hb2))))));
              reg45 <= ({(reg44[(1'h1):(1'h0)] ?
                          (~&wire39[(2'h2):(2'h2)]) : $unsigned(reg34))} ?
                  (~^{reg29[(3'h5):(2'h2)]}) : ((((reg30 | reg29) || $signed((8'ha6))) ?
                      reg44[(3'h5):(3'h4)] : ((reg36 ? wire27 : reg34) ?
                          $signed(reg44) : reg28)) >>> {reg41[(4'ha):(4'h9)],
                      $unsigned((reg44 ? reg32 : reg29))}));
            end
          reg46 <= $signed({(((&reg44) ? wire27 : (reg32 * wire23)) < ((reg32 ?
                  wire40 : reg36) != reg36)),
              wire24[(3'h5):(2'h2)]});
          if ((^$signed(reg28)))
            begin
              reg47 <= reg28[(3'h4):(2'h2)];
              reg48 <= $unsigned(wire39);
              reg49 <= ($unsigned(reg31) ?
                  (wire23[(2'h2):(1'h0)] != (~^((reg35 >= (8'haf)) ?
                      reg48 : (reg34 ?
                          reg28 : wire38)))) : (~|($unsigned($signed(reg28)) ^~ ((reg36 ?
                          reg44 : (8'ha3)) ?
                      ((8'ha8) - wire26) : $unsigned(wire40)))));
              reg50 <= {(&($signed(((8'hbd) * wire27)) ?
                      wire23 : (~reg42[(3'h6):(2'h3)])))};
              reg51 <= ((reg32 ?
                      ({(&wire38),
                          (|reg49)} >> (!$unsigned(reg42))) : $unsigned(wire27[(1'h0):(1'h0)])) ?
                  ($signed(reg50) || {wire39,
                      (wire25[(2'h2):(1'h0)] ?
                          $unsigned((8'ha0)) : $unsigned(wire27))}) : $signed({($unsigned(reg31) + $unsigned((8'h9f))),
                      reg35[(4'ha):(2'h2)]}));
            end
          else
            begin
              reg47 <= $signed((((wire27 - {reg34, reg42}) ?
                  (!wire39[(1'h0):(1'h0)]) : ($signed((8'ha4)) ?
                      ((8'had) <= reg44) : {(7'h44),
                          reg51})) == (|$unsigned($signed(wire23)))));
              reg48 <= reg45;
              reg49 <= reg46[(1'h0):(1'h0)];
            end
          reg52 <= reg36[(2'h2):(2'h2)];
        end
      else
        begin
          if (($signed((-({reg30} ?
                  $unsigned(reg41) : (wire37 ? wire25 : (8'h9d))))) ?
              reg41 : (($signed((wire23 ~^ wire24)) ?
                      reg31[(3'h6):(2'h3)] : reg47) ?
                  $unsigned(reg51[(2'h2):(2'h2)]) : ($signed(wire26[(1'h1):(1'h0)]) < $signed(reg43[(1'h0):(1'h0)])))))
            begin
              reg41 <= (&$signed($unsigned((reg35[(1'h0):(1'h0)] ?
                  reg28[(4'ha):(2'h3)] : (reg46 >> (8'hbd))))));
            end
          else
            begin
              reg41 <= reg48[(1'h0):(1'h0)];
              reg42 <= $unsigned(($unsigned({wire25}) ?
                  ($unsigned((~&wire25)) ?
                      (((8'hae) ? wire27 : (7'h41)) ?
                          (reg43 <<< wire27) : $signed((7'h44))) : {$unsigned(reg35)}) : (~reg51)));
              reg43 <= ($unsigned(wire23) && $unsigned(reg52));
              reg44 <= (~|(reg52 * wire39));
              reg45 <= $unsigned($unsigned($signed({reg28[(2'h2):(2'h2)],
                  reg33})));
            end
          reg46 <= (reg49[(1'h0):(1'h0)] - ((reg30 & $signed(reg48[(1'h0):(1'h0)])) | {($signed(reg46) | (^(8'hb9))),
              wire37}));
          if (((8'hb8) ?
              $unsigned($unsigned(reg28)) : $unsigned((((reg46 ?
                  reg31 : wire40) * $unsigned(reg33)) < $signed(reg46)))))
            begin
              reg47 <= reg32[(4'hd):(4'hb)];
              reg48 <= (!$unsigned((!$unsigned($signed(reg34)))));
              reg49 <= (~^$signed($signed((~&{wire26, (8'ha8)}))));
              reg50 <= (+reg46);
            end
          else
            begin
              reg47 <= ($signed(reg46) ?
                  (reg33 != (reg31 ?
                      $unsigned(reg34[(4'hc):(2'h2)]) : ($signed(reg45) ?
                          $unsigned(wire40) : reg33[(5'h12):(3'h5)]))) : ((((reg42 ?
                              (8'h9c) : wire24) ?
                          reg47[(3'h5):(3'h5)] : $signed((8'hab))) ?
                      $unsigned($signed(reg52)) : reg49[(1'h1):(1'h0)]) * $unsigned($signed({wire25,
                      wire37}))));
              reg48 <= ((($unsigned((-reg35)) ?
                  ((wire23 ? wire26 : reg51) ?
                      (~&reg36) : {reg42}) : $unsigned(((7'h42) ?
                      reg42 : reg41))) + wire40[(2'h2):(1'h0)]) * wire26[(4'he):(3'h5)]);
            end
          reg51 <= $signed(reg36);
        end
      if (reg45)
        begin
          reg53 <= ($unsigned(($unsigned((reg44 * reg45)) ?
                  (^reg45) : ((-wire24) ?
                      (reg36 ? wire38 : (8'ha4)) : (^(8'hb1))))) ?
              reg47 : ($unsigned(((|reg47) ?
                  reg41[(5'h14):(3'h5)] : (8'h9e))) | $signed((&(wire39 ?
                  reg30 : reg47)))));
        end
      else
        begin
          reg53 <= ({reg30} ?
              $unsigned(({wire23[(2'h2):(2'h2)]} << $signed((reg33 ?
                  reg48 : reg43)))) : (reg42 >> reg43[(1'h0):(1'h0)]));
          reg54 <= reg52[(1'h1):(1'h1)];
        end
    end
  assign wire55 = $unsigned(reg34);
  assign wire56 = $unsigned((8'hb8));
  assign wire57 = $signed((reg45[(4'h9):(3'h4)] ?
                      ($signed(((8'hb5) ? reg47 : reg54)) ?
                          wire55 : (wire27 ?
                              (reg47 ? reg36 : reg34) : reg53)) : (reg30 ?
                          ((wire38 ?
                              reg32 : reg42) >> reg54) : (&$signed(wire23)))));
  assign wire58 = $signed($unsigned(($unsigned((wire40 ? (8'had) : reg41)) ?
                      $signed(reg30) : ({(8'hb0)} | (reg36 && wire23)))));
  assign wire59 = $signed(wire58);
  assign wire60 = $unsigned($signed(((reg43 ?
                      wire27 : (reg33 >= (8'hb6))) ~^ (~|$unsigned(reg31)))));
  assign wire61 = $unsigned($signed({$unsigned((wire56 ? (8'h9f) : (8'had))),
                      $signed(reg48)}));
  always
    @(posedge clk) begin
      reg62 <= reg47[(2'h2):(1'h0)];
      reg63 <= (wire27[(1'h1):(1'h1)] ~^ reg44[(2'h3):(2'h3)]);
      reg64 <= $signed((^~$unsigned(reg49)));
      reg65 <= ((-$unsigned((^{wire58, wire61}))) ?
          (wire55[(3'h6):(1'h1)] > reg35[(2'h2):(2'h2)]) : ({(~|reg48[(4'h9):(3'h4)])} >>> {(^wire38)}));
    end
  assign wire66 = (~(8'hbf));
  assign wire67 = ($signed((wire57 ?
                      wire61 : reg52)) - ($signed($unsigned((8'hac))) ?
                      wire56[(1'h0):(1'h0)] : reg32[(4'he):(4'he)]));
  assign wire68 = (^~($unsigned(((reg36 ? reg51 : (8'hb5)) ?
                      $signed(wire57) : $signed(reg43))) > $signed(({reg30,
                      reg52} <= {reg62, reg42}))));
  assign wire69 = reg29[(4'hd):(4'hd)];
  assign wire70 = $unsigned((!reg46[(4'hf):(2'h3)]));
endmodule
