module top
#(parameter param362 = ((+(^{((8'hb1) ^~ (8'haf))})) ? (((+(~(8'hb0))) ? ((7'h40) ? (8'h9f) : ((8'h9c) ~^ (8'hbf))) : (8'hb0)) & ((~&((8'hab) ? (8'hb9) : (8'ha6))) && {(&(8'hac))})) : ((((^(8'hbe)) - ((7'h41) * (8'hb2))) ? (^(|(8'hb1))) : (^{(8'hb0)})) ? ((((8'hba) + (8'ha4)) ? ((8'hb1) ? (8'hb9) : (8'haf)) : (^(8'hb5))) ? (((7'h44) ? (8'hb5) : (8'hb2)) ? (~(8'hb7)) : (8'hb7)) : ((^~(7'h41)) & ((8'hb0) ? (8'hbe) : (7'h44)))) : ((^~((8'hb6) ? (8'hb5) : (8'h9c))) ? ((~^(8'ha9)) ? (-(8'ha4)) : ((7'h40) << (8'hb2))) : ((^~(8'ha0)) == (~|(8'hbc)))))), 
parameter param363 = (-param362))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire348;
  wire [(5'h12):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire358;
  wire [(5'h12):(1'h0)] wire359;
  wire signed [(3'h6):(1'h0)] wire360;
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg350 = (1'h0);
  reg [(5'h10):(1'h0)] reg351 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg352 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg353 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg354 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg355 = (1'h0);
  reg [(4'he):(1'h0)] reg356 = (1'h0);
  reg [(3'h6):(1'h0)] reg357 = (1'h0);
  assign y = {wire348,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire4,
                 wire358,
                 wire359,
                 wire360,
                 reg137,
                 reg138,
                 reg139,
                 reg350,
                 reg351,
                 reg352,
                 reg353,
                 reg354,
                 reg355,
                 reg356,
                 reg357,
                 (1'h0)};
  assign wire4 = $unsigned($signed((~(-(-wire1)))));
  module5 #() modinst133 (wire132, clk, wire4, wire2, wire0, wire1);
  assign wire134 = (wire3 ?
                       wire3 : $unsigned(((!$unsigned(wire1)) ?
                           $signed($unsigned(wire4)) : wire1)));
  assign wire135 = {wire134[(4'hc):(2'h2)]};
  assign wire136 = (&wire1[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      reg137 <= (~^wire134);
      reg138 <= wire132[(4'h9):(3'h6)];
      reg139 <= $unsigned(((reg137[(4'hc):(1'h0)] > (^~$unsigned(wire1))) == $signed((^~(wire0 ?
          wire3 : wire0)))));
    end
  module140 #() modinst349 (.wire144(wire1), .wire141(wire136), .wire142(reg137), .wire145(reg138), .wire143(wire4), .y(wire348), .clk(clk));
  always
    @(posedge clk) begin
      if ((~&$signed($signed((wire136[(4'ha):(3'h4)] ^ (wire3 >> wire3))))))
        begin
          reg350 <= (($unsigned($unsigned($unsigned(wire136))) ?
              $unsigned(wire2[(4'hb):(1'h1)]) : $signed(($unsigned(wire2) ?
                  wire135[(2'h2):(1'h1)] : $unsigned(wire0)))) * ($signed((+$unsigned(wire135))) >>> (^$unsigned(reg137))));
          reg351 <= $signed(wire348);
          reg352 <= $signed(((({reg350, wire134} ?
              (wire2 ?
                  reg139 : wire135) : (wire3 == wire3)) ~^ (wire136[(1'h1):(1'h0)] & $signed(wire134))) << (7'h42)));
          if (reg352)
            begin
              reg353 <= wire135;
              reg354 <= ($signed($unsigned(reg352[(4'ha):(2'h3)])) ?
                  wire2[(5'h10):(3'h5)] : {(8'had)});
              reg355 <= $unsigned((8'hb8));
              reg356 <= $unsigned(wire134[(3'h5):(2'h2)]);
            end
          else
            begin
              reg353 <= reg351[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if (({{((-wire0) * wire135[(3'h5):(3'h4)])}} - reg351[(4'h8):(1'h1)]))
            begin
              reg350 <= $signed(reg355[(5'h11):(3'h7)]);
              reg351 <= wire0;
              reg352 <= (reg355[(4'h8):(1'h1)] ?
                  $signed(reg355[(3'h6):(1'h1)]) : {(((wire134 ~^ wire136) & (reg138 ?
                          reg137 : reg352)) <= {(reg353 ? wire135 : reg350)})});
            end
          else
            begin
              reg350 <= reg352[(2'h2):(1'h0)];
              reg351 <= $unsigned(wire3[(3'h5):(2'h3)]);
              reg352 <= wire3;
              reg353 <= $signed((~&$unsigned(reg355)));
            end
          reg354 <= ($signed($unsigned($signed($signed(reg354)))) & $signed(wire1[(4'hd):(3'h7)]));
        end
      reg357 <= $unsigned((+wire134[(3'h4):(2'h2)]));
    end
  assign wire358 = (8'ha2);
  assign wire359 = $signed($signed(reg352));
  module40 #() modinst361 (wire360, clk, wire2, wire134, wire1, reg357);
endmodule

module module140  (y, clk, wire141, wire142, wire143, wire144, wire145);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire141;
  input wire [(2'h3):(1'h0)] wire142;
  input wire [(3'h4):(1'h0)] wire143;
  input wire [(5'h12):(1'h0)] wire144;
  input wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire346;
  wire [(4'h9):(1'h0)] wire304;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(4'h8):(1'h0)] wire176;
  wire [(4'he):(1'h0)] wire146;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire226;
  wire [(5'h13):(1'h0)] wire227;
  wire [(4'hb):(1'h0)] wire228;
  wire signed [(4'h9):(1'h0)] wire239;
  wire [(5'h15):(1'h0)] wire302;
  reg [(4'ha):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg231 = (1'h0);
  reg [(4'hc):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg233 = (1'h0);
  reg [(5'h14):(1'h0)] reg234 = (1'h0);
  reg [(5'h10):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg236 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg237 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg238 = (1'h0);
  assign y = {wire346,
                 wire304,
                 wire224,
                 wire176,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire174,
                 wire226,
                 wire227,
                 wire228,
                 wire239,
                 wire302,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 reg236,
                 reg237,
                 reg238,
                 (1'h0)};
  assign wire146 = $unsigned((wire144 ~^ (~|wire144[(4'hc):(4'h8)])));
  assign wire147 = $unsigned($unsigned($signed(wire146[(4'he):(3'h6)])));
  assign wire148 = (|$unsigned((+wire147)));
  assign wire149 = (wire147 ?
                       ((~&$unsigned(wire147[(3'h4):(1'h1)])) ?
                           ($unsigned((wire141 ? wire141 : wire147)) ?
                               (^$unsigned(wire144)) : $signed(wire142)) : ((~(8'hb6)) ?
                               $signed(wire141) : $unsigned($unsigned(wire144)))) : ((8'ha4) && ($unsigned($signed(wire143)) && $signed($signed(wire144)))));
  assign wire150 = $unsigned((~&$unsigned((wire141 ?
                       (8'hbf) : (wire146 >= (8'h9c))))));
  assign wire151 = (~&$unsigned((|wire141[(3'h7):(1'h0)])));
  assign wire152 = ($unsigned(wire146) ?
                       ((^$signed(wire151[(1'h1):(1'h1)])) ?
                           (wire147[(4'hb):(3'h4)] || ($signed(wire141) ?
                               $unsigned(wire141) : (wire147 ~^ (8'h9e)))) : {((wire146 ?
                                       (7'h44) : wire143) ?
                                   $signed((8'hb3)) : (wire141 ?
                                       wire146 : (7'h44)))}) : {(+wire143[(3'h4):(3'h4)]),
                           {(~&wire143[(2'h2):(2'h2)]), wire150}});
  assign wire153 = (&wire144);
  assign wire154 = ((8'had) ^ wire146[(1'h0):(1'h0)]);
  module155 #() modinst175 (.y(wire174), .clk(clk), .wire158(wire141), .wire160(wire150), .wire157(wire146), .wire159(wire152), .wire156(wire151));
  assign wire176 = (wire147[(3'h4):(2'h2)] & {(&wire145[(1'h1):(1'h0)]),
                       (wire143[(1'h1):(1'h1)] ?
                           $signed((~wire147)) : $signed((|wire141)))});
  module177 #() modinst225 (.wire181(wire174), .wire180(wire144), .wire178(wire176), .clk(clk), .wire182(wire145), .wire179(wire151), .y(wire224));
  assign wire226 = (wire147[(4'h8):(4'h8)] ?
                       $signed(((~$signed(wire149)) ?
                           (-wire150) : wire148)) : (((~|(wire174 ?
                               wire150 : (8'hae))) ?
                           ((8'h9f) ?
                               $unsigned(wire154) : $unsigned(wire176)) : ($signed(wire152) ?
                               (-wire176) : (wire144 ?
                                   wire142 : (8'h9e)))) << $signed($signed(((8'hb8) ?
                           wire142 : wire176)))));
  assign wire227 = $signed($unsigned((~^wire151)));
  assign wire228 = {(wire174 * $signed(wire148)),
                       (^(~|((|wire153) < (wire153 ? (8'hb3) : wire145))))};
  always
    @(posedge clk) begin
      reg229 <= $unsigned(($unsigned($unsigned($unsigned(wire142))) ?
          (wire224[(3'h7):(3'h5)] ?
              wire145[(4'h9):(4'h8)] : wire144[(5'h10):(5'h10)]) : {(~|$signed(wire151))}));
      reg230 <= ({(wire146 ? wire154 : $signed({wire226, wire145}))} ^ (8'ha1));
      if ($unsigned(wire176))
        begin
          if ((~&({(~&wire149), wire149} ?
              wire149[(3'h4):(3'h4)] : (^~(^(wire148 && wire224))))))
            begin
              reg231 <= $signed(wire151[(4'hf):(3'h4)]);
              reg232 <= $unsigned((~^$signed($signed($unsigned(wire224)))));
              reg233 <= ($unsigned(wire143[(2'h2):(2'h2)]) > wire224[(4'h8):(4'h8)]);
              reg234 <= ($unsigned(({(8'h9d),
                  (wire147 ? wire153 : wire224)} >= (^{wire153,
                  wire147}))) >>> $signed($unsigned($signed($unsigned(wire152)))));
              reg235 <= ((wire151[(3'h7):(2'h2)] ?
                      (&({reg229} > $unsigned(wire154))) : (wire153[(2'h2):(1'h1)] >>> wire148)) ?
                  $signed((+{(wire227 ? wire142 : wire224),
                      (~&wire151)})) : (!(wire224[(3'h5):(3'h4)] != wire153)));
            end
          else
            begin
              reg231 <= (reg229[(3'h4):(2'h3)] << ({$signed(reg235[(2'h2):(2'h2)]),
                      $signed((wire144 ? reg234 : reg234))} ?
                  (^~(wire226 ~^ $unsigned(wire142))) : $unsigned($unsigned(reg231[(1'h1):(1'h0)]))));
              reg232 <= wire145;
              reg233 <= (~|$signed((reg232[(3'h5):(3'h5)] ?
                  (~|reg229) : $signed($unsigned(reg234)))));
              reg234 <= (wire149[(3'h6):(3'h5)] ?
                  ($signed(wire228[(1'h1):(1'h0)]) >>> wire141) : wire224);
              reg235 <= $unsigned((wire174 << $unsigned(wire148)));
            end
          reg236 <= reg235;
        end
      else
        begin
          reg231 <= (wire152[(2'h3):(1'h1)] && $signed((($signed(wire151) ?
                  (reg230 ? reg235 : reg231) : (wire149 + reg236)) ?
              $signed(((8'ha9) ? reg230 : reg231)) : reg236)));
          reg232 <= reg232;
        end
      reg237 <= (wire147[(3'h4):(2'h2)] - reg235);
      reg238 <= {{wire224, (~&(~&(wire152 ? wire142 : wire228)))}};
    end
  assign wire239 = (($unsigned({wire142[(1'h1):(1'h0)]}) ? reg230 : (8'hb7)) ?
                       (($unsigned({wire145}) ?
                               ($signed(reg238) ?
                                   (!wire148) : (reg229 ?
                                       reg235 : wire148)) : {$unsigned(wire224)}) ?
                           (|reg232[(1'h0):(1'h0)]) : {((^(8'had)) ?
                                   $unsigned(wire153) : wire228),
                               $signed((wire176 ?
                                   wire150 : reg235))}) : ($unsigned(wire148[(3'h4):(2'h3)]) ?
                           (wire149 ?
                               (&$signed(wire151)) : ($unsigned(wire228) <<< $unsigned(reg230))) : (!$signed((wire224 ?
                               wire151 : wire152)))));
  module240 #() modinst303 (.wire241(wire227), .wire242(wire228), .wire244(wire144), .clk(clk), .y(wire302), .wire245(reg238), .wire243(reg234));
  assign wire304 = (($unsigned($unsigned((wire302 ? (8'hb1) : (8'hb0)))) ?
                           $unsigned(reg237[(3'h6):(1'h0)]) : $signed((7'h40))) ?
                       {$unsigned(reg232)} : (~&$unsigned(wire150[(2'h3):(2'h3)])));
  module305 #() modinst347 (.wire307(reg233), .clk(clk), .wire308(wire147), .wire309(wire141), .wire310(wire143), .wire306(wire149), .y(wire346));
endmodule

module module5
#(parameter param131 = (~((({(8'hac)} * ((8'hbf) ? (8'ha9) : (8'ha8))) > ((~|(7'h44)) & ((8'haa) ? (8'ha9) : (8'ha2)))) ^ ((((8'hb9) ? (8'ha6) : (8'hb2)) == (+(8'hb6))) ? ((!(8'ha3)) ? ((8'hac) ? (8'hba) : (8'hb1)) : (8'ha3)) : (((8'hbd) <= (8'hb1)) ? ((8'hab) & (8'ha8)) : (^~(8'ha6)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire85;
  wire [(3'h4):(1'h0)] wire129;
  assign y = {wire36,
                 wire12,
                 wire11,
                 wire10,
                 wire38,
                 wire39,
                 wire85,
                 wire129,
                 (1'h0)};
  assign wire10 = ((((~^wire7) ?
                      wire8[(3'h6):(2'h2)] : $unsigned(((8'hb6) | wire9))) | (~(wire8 > wire9))) >> ($unsigned(((wire6 ?
                          wire9 : wire9) < (wire9 ? wire8 : wire9))) ?
                      wire9 : wire8));
  assign wire11 = $unsigned((|(8'hae)));
  assign wire12 = $signed((wire8[(4'h8):(1'h0)] >> wire9[(2'h2):(1'h0)]));
  module13 #() modinst37 (.wire17(wire6), .clk(clk), .wire14(wire8), .wire18(wire12), .wire15(wire10), .wire16(wire9), .y(wire36));
  assign wire38 = $unsigned(wire8);
  assign wire39 = $signed(($signed((wire36 >>> (8'haf))) ^ (8'hb2)));
  module40 #() modinst86 (wire85, clk, wire7, wire38, wire11, wire12);
  module87 #() modinst130 (.y(wire129), .wire91(wire85), .wire90(wire10), .wire92(wire8), .wire89(wire6), .wire88(wire11), .clk(clk));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire92;
  input wire signed [(4'ha):(1'h0)] wire91;
  input wire [(4'hf):(1'h0)] wire90;
  input wire [(4'hb):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(5'h10):(1'h0)] wire124;
  wire [(4'hf):(1'h0)] wire123;
  wire [(2'h3):(1'h0)] wire122;
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
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
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= (~^(|($signed((wire89 | wire90)) ^ (~wire89[(3'h7):(2'h3)]))));
      reg94 <= (^(~^($unsigned(wire88) <= wire90)));
      if ($unsigned($unsigned((($unsigned((8'hb7)) > (wire90 ?
          wire88 : reg94)) >= ((8'ha5) >> (|wire88))))))
        begin
          reg95 <= $signed(wire89[(1'h0):(1'h0)]);
          reg96 <= {reg93[(5'h13):(4'h9)]};
          reg97 <= $unsigned((!$unsigned($unsigned((reg95 || reg95)))));
          reg98 <= (~&wire92[(2'h2):(1'h0)]);
          reg99 <= reg96;
        end
      else
        begin
          reg95 <= (~&(reg94 ?
              (-((wire91 ? wire88 : reg95) ?
                  $unsigned(wire91) : (reg95 || reg95))) : reg97));
          reg96 <= $unsigned((wire88[(4'h8):(4'h8)] ?
              wire88[(1'h0):(1'h0)] : {reg99[(3'h7):(3'h6)]}));
        end
    end
  always
    @(posedge clk) begin
      reg100 <= ($signed(reg96) == wire88);
      if ($unsigned({{{reg98, reg97[(2'h2):(1'h0)]},
              {wire92[(2'h2):(2'h2)], $signed(reg97)}},
          (wire92[(2'h3):(1'h0)] <<< ($unsigned(reg97) ?
              $unsigned(reg98) : (+(8'ha7))))}))
        begin
          if (reg96[(2'h3):(1'h0)])
            begin
              reg101 <= reg97[(2'h2):(1'h0)];
              reg102 <= $unsigned($signed(({$signed(reg94)} ?
                  $unsigned(reg99) : $signed({wire88}))));
            end
          else
            begin
              reg101 <= (reg94[(1'h1):(1'h0)] ?
                  $signed({$signed(reg96),
                      ($signed(wire89) ?
                          reg94 : (wire88 ? wire92 : wire90))}) : reg93);
              reg102 <= ((!$unsigned(reg98[(4'hc):(3'h7)])) ~^ wire92);
              reg103 <= wire89;
              reg104 <= reg93;
            end
          reg105 <= $signed(((((reg96 ^ reg97) ?
                  wire90[(4'h8):(2'h3)] : (8'had)) ?
              wire91 : $unsigned((reg104 ? reg104 : reg102))) != reg97));
        end
      else
        begin
          if ({reg95[(1'h1):(1'h1)]})
            begin
              reg101 <= ((!$signed($signed($signed(reg93)))) ?
                  {($signed((reg103 ?
                          reg102 : (8'hbf))) || $unsigned(((8'ha0) <<< wire91))),
                      $signed((^(^~wire91)))} : (~(wire90[(2'h2):(1'h0)] ?
                      ($signed(reg103) ?
                          (reg94 ?
                              reg100 : reg100) : $unsigned((8'ha1))) : reg99[(3'h5):(2'h2)])));
              reg102 <= (reg97[(1'h0):(1'h0)] - ($signed(wire88) && reg103[(4'hc):(3'h4)]));
              reg103 <= (({reg94[(1'h0):(1'h0)]} * wire92[(3'h4):(1'h0)]) ~^ $unsigned((8'hac)));
              reg104 <= $signed({(~(reg105 >> $signed((8'hb1))))});
              reg105 <= ({(-(|$signed(wire92)))} >> (wire89[(4'hb):(2'h3)] ?
                  wire90 : (~|(wire92[(2'h2):(1'h0)] ?
                      (reg100 ? reg105 : (8'hac)) : reg100))));
            end
          else
            begin
              reg101 <= ((8'hac) ?
                  {($signed({wire88}) != ((reg103 >>> reg98) ?
                          $signed(reg97) : wire92[(1'h0):(1'h0)])),
                      (&$signed((reg96 ?
                          reg94 : reg102)))} : (wire89[(4'hb):(3'h4)] ?
                      $signed($unsigned((~&reg96))) : {({reg101} ?
                              (~&reg102) : (reg104 <= wire91)),
                          (wire91[(3'h4):(2'h3)] ?
                              (wire92 < wire90) : reg103)}));
              reg102 <= (({reg104[(2'h3):(2'h3)], $unsigned($signed(wire88))} ?
                      $unsigned($signed($signed(reg104))) : $signed({(reg99 <<< reg100)})) ?
                  $signed(((~$signed(wire88)) >>> (reg100[(3'h6):(2'h3)] ^~ wire89[(4'hb):(1'h0)]))) : $unsigned((^(!reg94[(2'h2):(2'h2)]))));
              reg103 <= (8'hbf);
            end
          if (reg105)
            begin
              reg106 <= (((((|(8'ha1)) < (8'hb6)) * (~^reg102)) ?
                  $signed(reg101[(2'h2):(1'h0)]) : $unsigned((reg102 ?
                      (wire89 ?
                          (7'h43) : wire90) : $unsigned(reg94)))) == {reg104,
                  (~|reg97)});
              reg107 <= $unsigned(((((~^reg93) ?
                      (reg101 ? reg95 : wire89) : (wire90 ?
                          (8'ha6) : reg101)) < reg99) ?
                  $signed({(~&wire89)}) : reg99[(1'h0):(1'h0)]));
            end
          else
            begin
              reg106 <= (reg96 ?
                  $signed((reg94 << reg100)) : (|(^~reg106[(1'h0):(1'h0)])));
              reg107 <= (((+(reg105[(2'h3):(2'h2)] ? reg95 : $signed(wire92))) ?
                      {(8'h9c)} : {(+$unsigned(wire92)),
                          $signed($unsigned((8'ha4)))}) ?
                  $signed((&$unsigned($unsigned(reg105)))) : $unsigned(reg106));
              reg108 <= (!(~|$signed({(reg100 >>> wire90), (~&reg98)})));
              reg109 <= ($signed(((^~(wire92 ?
                      reg107 : reg99)) + wire91[(4'ha):(3'h5)])) ?
                  (|$unsigned((&reg101))) : (((~{wire91}) ?
                          (+$signed((8'hac))) : $unsigned(reg95[(1'h1):(1'h1)])) ?
                      wire91 : reg107[(4'h8):(1'h1)]));
              reg110 <= (8'ha8);
            end
          reg111 <= $unsigned(({(~&(wire90 >>> wire88)),
                  reg107[(1'h0):(1'h0)]} ?
              (~&(-(reg110 ?
                  reg107 : reg101))) : (~($signed(reg99) != reg96[(3'h4):(1'h0)]))));
          reg112 <= (($unsigned($signed((!reg107))) ?
                  $signed($signed((reg110 ?
                      reg97 : reg95))) : $unsigned({(reg96 < (7'h43)),
                      $signed(reg111)})) ?
              reg95 : wire92[(1'h0):(1'h0)]);
          reg113 <= (^$unsigned($unsigned($signed((^~reg110)))));
        end
      reg114 <= {(^~{((wire92 <= (8'hb3)) ? (&reg102) : $signed(reg110)),
              $signed((7'h40))}),
          ((^~{(&reg104)}) ?
              (~&((reg101 ?
                  wire88 : wire91) >> (&(7'h42)))) : $signed((^~(reg111 ?
                  wire92 : reg108))))};
    end
  always
    @(posedge clk) begin
      reg115 <= reg109;
      if (((~^reg108) == $unsigned(reg101[(1'h1):(1'h1)])))
        begin
          if ({((wire90[(1'h1):(1'h0)] && $unsigned(reg102)) ?
                  $unsigned(wire90) : $unsigned(((reg101 ? reg106 : reg97) ?
                      {reg100, reg110} : {(8'ha7)}))),
              ((reg99 - reg98[(1'h1):(1'h1)]) ?
                  wire89 : $unsigned((-(~&reg99))))})
            begin
              reg116 <= reg108[(4'hc):(4'h8)];
              reg117 <= $signed(((+reg101[(2'h2):(1'h0)]) * $signed(reg113[(1'h1):(1'h0)])));
              reg118 <= reg108[(5'h10):(1'h1)];
              reg119 <= reg117[(4'he):(4'h9)];
              reg120 <= $signed((^~reg111));
            end
          else
            begin
              reg116 <= wire91;
              reg117 <= $unsigned((8'hb0));
              reg118 <= ((($signed((reg109 ? reg98 : reg93)) ?
                          $unsigned({(8'ha5),
                              (8'hb0)}) : $signed(reg120[(1'h0):(1'h0)])) ?
                      (&$unsigned((8'hb5))) : $signed(({reg106} ?
                          wire91[(4'ha):(1'h0)] : {reg98}))) ?
                  reg94 : $unsigned($unsigned($signed((8'haa)))));
              reg119 <= ((~|(~|reg109)) > ($unsigned((reg108[(4'h9):(2'h3)] - (|(8'ha1)))) ~^ $unsigned(((reg114 ?
                      reg94 : reg120) ?
                  reg102[(3'h6):(3'h6)] : (reg108 == reg115)))));
            end
          reg121 <= (reg93 >> reg101);
        end
      else
        begin
          if ((reg118 ? (~&reg111) : reg100[(4'h8):(3'h5)]))
            begin
              reg116 <= reg103;
            end
          else
            begin
              reg116 <= (|({reg121, (8'ha1)} ? reg117[(1'h1):(1'h1)] : reg100));
            end
          reg117 <= reg120[(1'h1):(1'h0)];
        end
    end
  assign wire122 = (reg117[(4'hf):(4'hc)] * {$unsigned((!(reg112 ?
                           reg107 : (8'ha3))))});
  assign wire123 = reg109;
  assign wire124 = (((reg101 ? reg100 : $unsigned($unsigned(reg113))) ?
                       ((&$signed(reg118)) <= reg97[(2'h2):(2'h2)]) : $signed($signed((^reg108)))) | $signed(($signed((wire90 ?
                       (8'hb6) : wire92)) >> $signed($signed(wire91)))));
  assign wire125 = reg107[(3'h7):(3'h4)];
  assign wire126 = $signed($unsigned(wire91));
  assign wire127 = ($signed((wire125[(4'hb):(2'h3)] <= $signed($signed((8'hbb))))) ?
                       ((^~($signed(reg96) ?
                               (reg103 ? reg116 : reg116) : (8'had))) ?
                           reg109[(4'hf):(2'h3)] : (((wire88 * reg116) | ((8'ha0) ?
                                   reg118 : reg114)) ?
                               (((8'hac) ? reg97 : reg98) ?
                                   (reg101 == wire125) : (8'hba)) : $unsigned($signed((8'ha4))))) : (~^reg120[(1'h1):(1'h0)]));
  assign wire128 = ((|((|reg93[(3'h4):(2'h3)]) <<< $signed($unsigned(reg111)))) >> reg117[(4'hf):(4'hc)]);
endmodule

module module40
#(parameter param84 = ((!{{((8'haf) ? (8'ha1) : (8'ha4)), (+(7'h40))}}) <<< ({(~|((8'hb4) ? (8'hbf) : (8'ha5))), {(^(8'h9c)), (+(8'ha8))}} ? ((^~(~&(8'ha1))) < ((+(8'had)) ? (8'ha4) : {(8'ha7)})) : {(((8'hba) >= (8'h9d)) ^ (^~(8'hbf)))})))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire44;
  input wire [(5'h12):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire [(3'h6):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire45;
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg56,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg46,
                 (1'h0)};
  assign wire45 = wire42[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg46 <= (~^(wire45[(3'h7):(3'h5)] ~^ wire42));
    end
  assign wire47 = wire43;
  assign wire48 = $signed(({{wire45[(3'h6):(3'h6)]}, $signed(wire45)} ?
                      (({wire47} ? $unsigned(wire44) : (reg46 != wire41)) ?
                          $unsigned(wire42[(4'h9):(4'h9)]) : (+(~^reg46))) : ($signed($signed((8'h9d))) > ($unsigned(wire44) ?
                          (wire45 ? wire44 : wire43) : {reg46, wire42}))));
  assign wire49 = (8'h9d);
  always
    @(posedge clk) begin
      reg50 <= wire47[(1'h1):(1'h0)];
      reg51 <= $signed(reg46);
      reg52 <= (wire44[(5'h10):(4'hf)] ?
          {(wire42 >>> {(wire44 ? reg50 : wire41),
                  $signed(wire49)})} : {$signed((!wire45)),
              ($signed($unsigned(wire48)) ^ wire44)});
      reg53 <= reg51;
      reg54 <= ($unsigned(wire47[(2'h2):(2'h2)]) < (wire48[(1'h1):(1'h1)] ?
          ($signed($unsigned((8'hbc))) ?
              {wire49} : wire42[(4'hb):(1'h1)]) : (wire44[(4'hb):(1'h0)] >= ($signed(wire44) ?
              $unsigned(wire48) : reg50))));
    end
  assign wire55 = (reg51 ^~ $unsigned(reg46[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg56 <= wire43;
    end
  assign wire57 = {(($signed($unsigned((8'hbc))) <<< ({wire44} >= reg46)) != wire44[(4'hf):(3'h6)])};
  assign wire58 = wire57[(3'h4):(2'h3)];
  assign wire59 = $signed((8'hb3));
  always
    @(posedge clk) begin
      if (wire45[(1'h1):(1'h1)])
        begin
          if ({wire43, (^~(!wire59[(2'h3):(1'h0)]))})
            begin
              reg60 <= wire58;
              reg61 <= reg50[(4'hc):(3'h6)];
              reg62 <= reg46;
              reg63 <= wire41[(1'h0):(1'h0)];
            end
          else
            begin
              reg60 <= $unsigned($unsigned({({reg51} ?
                      $unsigned(wire43) : $signed((8'hb0))),
                  (~&$signed(wire55))}));
              reg61 <= reg60[(1'h0):(1'h0)];
              reg62 <= $signed({(8'hb3),
                  ($signed((^wire44)) ?
                      ((reg46 ? (8'h9c) : reg60) ?
                          $unsigned(reg62) : wire59[(2'h3):(1'h1)]) : ($unsigned((7'h41)) ?
                          (+reg51) : (reg56 ? reg61 : (8'ha1))))});
            end
          reg64 <= ($unsigned($signed(wire45[(3'h5):(1'h1)])) ?
              ($unsigned(((wire42 >= wire59) ? $unsigned(wire48) : wire43)) ?
                  (7'h42) : (reg51[(4'h9):(1'h0)] <<< ($signed(reg62) ^~ {wire45,
                      reg46}))) : $unsigned(wire55[(5'h10):(4'he)]));
          if (wire41)
            begin
              reg65 <= reg56;
              reg66 <= (wire42 ?
                  $signed((&(+(^(8'ha2))))) : ($unsigned(((wire59 ?
                      (8'ha5) : reg62) == $unsigned(reg54))) == $unsigned((~&wire58))));
              reg67 <= ((wire41[(2'h2):(2'h2)] ?
                  reg52[(4'h9):(1'h1)] : {wire47,
                      $signed(reg52)}) ^~ wire59[(3'h4):(1'h0)]);
              reg68 <= reg66;
              reg69 <= $signed(($unsigned(((&reg56) >> {wire59,
                  reg61})) | reg50[(3'h6):(3'h4)]));
            end
          else
            begin
              reg65 <= {((^$signed((reg68 ?
                      (8'ha8) : (7'h43)))) << ($unsigned($signed(wire57)) ?
                      reg69[(1'h1):(1'h1)] : (wire43 ?
                          reg62[(4'hb):(3'h5)] : $unsigned(reg69)))),
                  {(+($signed(reg67) ? ((8'h9f) <= (8'hb9)) : (^wire57))),
                      ((7'h43) || reg68[(4'ha):(2'h3)])}};
              reg66 <= (+(~$unsigned(((!(8'hb8)) ?
                  wire47 : $unsigned((8'hb7))))));
              reg67 <= ($signed(reg50) == $unsigned($signed({$unsigned(reg62),
                  $unsigned(reg46)})));
            end
          reg70 <= (+((^~$signed((reg51 ^ wire59))) ?
              (reg69 ?
                  $signed(wire59[(1'h0):(1'h0)]) : wire48[(3'h6):(3'h5)]) : $signed(($unsigned(wire49) & (8'ha5)))));
          reg71 <= $signed($unsigned(reg67[(1'h1):(1'h1)]));
        end
      else
        begin
          reg60 <= (~$unsigned($signed({reg46})));
          reg61 <= (reg50[(4'hd):(1'h0)] >>> reg68[(1'h1):(1'h1)]);
        end
      reg72 <= $unsigned($signed(((|$signed((7'h42))) ?
          (~|$signed(reg67)) : wire57[(2'h3):(2'h2)])));
      reg73 <= $unsigned({(~&(~&reg72))});
      reg74 <= $unsigned({$signed((~&$unsigned(reg51))), $signed(reg66)});
    end
  always
    @(posedge clk) begin
      reg75 <= ((^reg73[(4'ha):(1'h0)]) << $unsigned((reg74[(1'h0):(1'h0)] ?
          $signed($unsigned(reg61)) : wire41[(3'h6):(3'h6)])));
      reg76 <= (8'h9f);
      reg77 <= ($signed((reg54[(2'h3):(1'h1)] ~^ $signed(reg68[(4'ha):(2'h3)]))) * $unsigned(($signed($unsigned(reg68)) != reg56)));
    end
  assign wire78 = (~&reg76[(3'h4):(1'h1)]);
  assign wire79 = $signed((reg60[(3'h5):(1'h0)] ?
                      (!((8'ha9) == (-(8'ha3)))) : (({reg54, wire49} ?
                              (reg46 << reg75) : (reg76 ? (8'hbb) : (7'h44))) ?
                          reg75[(4'h9):(3'h7)] : {{wire49}})));
  assign wire80 = reg71[(3'h4):(1'h0)];
  assign wire81 = {reg71[(4'ha):(3'h7)], reg60};
  assign wire82 = $unsigned($unsigned((($signed(reg76) ?
                          (wire47 ? (8'hb7) : reg68) : (reg69 != reg54)) ?
                      reg76[(3'h5):(1'h0)] : (-reg72[(3'h7):(1'h1)]))));
  assign wire83 = (reg64 * ({{(^(8'hbb))}, {(+reg67)}} >> (^~wire49)));
endmodule

module module13
#(parameter param35 = {{(((~&(8'hac)) ? ((8'hb7) ^ (8'hb5)) : ((8'hb7) ? (8'haf) : (8'hae))) ? (~{(8'ha6)}) : ((+(8'h9d)) ? ((8'hae) ? (8'ha2) : (8'ha2)) : (~(8'hba))))}})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire19;
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire27,
                 wire19,
                 reg34,
                 reg33,
                 reg32,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire19 = wire18;
  always
    @(posedge clk) begin
      reg20 <= (^~({$signed((wire16 ?
              wire17 : wire16))} * $unsigned($unsigned(wire15))));
      if ($signed(wire19[(4'hc):(4'hc)]))
        begin
          reg21 <= ($signed((wire19[(1'h1):(1'h1)] << (wire15 - $signed(wire19)))) < wire15);
          reg22 <= $signed($unsigned({reg20, $signed((~|wire18))}));
          reg23 <= reg21;
        end
      else
        begin
          reg21 <= $unsigned((~&wire18));
          reg22 <= wire19[(4'hb):(2'h2)];
          if ((~^(~(~^$unsigned($unsigned((8'h9c)))))))
            begin
              reg23 <= ($unsigned($unsigned(($signed(wire15) || (~^wire19)))) ?
                  ((wire18 < reg21) ?
                      wire15[(3'h5):(2'h3)] : {($unsigned(wire15) ?
                              reg22 : (wire16 <<< wire15)),
                          wire19[(3'h5):(3'h5)]}) : ((8'hbe) > $unsigned(($unsigned(reg21) ?
                      (wire17 ? wire16 : wire16) : (~^wire15)))));
              reg24 <= wire14;
            end
          else
            begin
              reg23 <= reg24[(2'h3):(1'h1)];
              reg24 <= $signed(reg23);
              reg25 <= {wire19[(1'h1):(1'h0)],
                  (($unsigned((~|reg24)) ?
                          $signed($unsigned(reg22)) : reg21[(2'h3):(2'h2)]) ?
                      reg20 : reg22[(1'h1):(1'h0)])};
              reg26 <= (reg23 ?
                  (8'hae) : ($unsigned($unsigned((~|wire15))) ?
                      $signed($signed((~|wire19))) : {wire17[(4'h9):(3'h4)],
                          $signed((|wire18))}));
            end
        end
    end
  assign wire27 = {(wire18[(1'h0):(1'h0)] ? (8'hb2) : reg20[(5'h14):(4'ha)])};
  always
    @(posedge clk) begin
      reg28 <= wire16[(3'h4):(2'h3)];
      reg29 <= ($signed((-{(wire18 ? wire19 : reg21), wire16})) ?
          reg22[(2'h2):(1'h1)] : (8'ha9));
    end
  assign wire30 = ($unsigned($unsigned(reg20[(4'ha):(2'h2)])) <= wire19[(2'h2):(2'h2)]);
  assign wire31 = $signed(reg21);
  always
    @(posedge clk) begin
      reg32 <= (-wire14[(3'h6):(3'h6)]);
      reg33 <= wire16;
      reg34 <= $unsigned((^~$signed($signed($unsigned(reg29)))));
    end
endmodule

module module305
#(parameter param345 = (|(|((+((8'haa) <= (8'ha8))) >= (((8'hbd) ? (8'hac) : (8'hb0)) >>> (+(8'had)))))))
(y, clk, wire310, wire309, wire308, wire307, wire306);
  output wire [(32'h189):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire310;
  input wire [(5'h12):(1'h0)] wire309;
  input wire [(5'h10):(1'h0)] wire308;
  input wire [(4'h9):(1'h0)] wire307;
  input wire [(5'h10):(1'h0)] wire306;
  wire signed [(4'h9):(1'h0)] wire334;
  wire [(2'h3):(1'h0)] wire320;
  wire signed [(2'h2):(1'h0)] wire313;
  wire signed [(3'h6):(1'h0)] wire312;
  wire [(5'h13):(1'h0)] wire311;
  reg [(4'hd):(1'h0)] reg344 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg343 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg342 = (1'h0);
  reg [(5'h11):(1'h0)] reg341 = (1'h0);
  reg [(4'ha):(1'h0)] reg340 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg339 = (1'h0);
  reg [(4'hb):(1'h0)] reg338 = (1'h0);
  reg [(3'h5):(1'h0)] reg337 = (1'h0);
  reg [(3'h7):(1'h0)] reg336 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg335 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg333 = (1'h0);
  reg [(5'h15):(1'h0)] reg332 = (1'h0);
  reg [(5'h14):(1'h0)] reg331 = (1'h0);
  reg [(4'hd):(1'h0)] reg330 = (1'h0);
  reg [(3'h4):(1'h0)] reg329 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg328 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg327 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg326 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg325 = (1'h0);
  reg [(4'hc):(1'h0)] reg324 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg323 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg322 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg321 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg319 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg318 = (1'h0);
  reg [(5'h14):(1'h0)] reg317 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg316 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg315 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg314 = (1'h0);
  assign y = {wire334,
                 wire320,
                 wire313,
                 wire312,
                 wire311,
                 reg344,
                 reg343,
                 reg342,
                 reg341,
                 reg340,
                 reg339,
                 reg338,
                 reg337,
                 reg336,
                 reg335,
                 reg333,
                 reg332,
                 reg331,
                 reg330,
                 reg329,
                 reg328,
                 reg327,
                 reg326,
                 reg325,
                 reg324,
                 reg323,
                 reg322,
                 reg321,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 (1'h0)};
  assign wire311 = wire308[(2'h2):(1'h0)];
  assign wire312 = $signed(wire307[(1'h0):(1'h0)]);
  assign wire313 = $unsigned(wire311);
  always
    @(posedge clk) begin
      if (((^~wire307) ?
          ({wire308[(4'hb):(4'h9)]} > (8'hba)) : (+$signed($signed((wire313 ?
              (8'ha9) : wire311))))))
        begin
          reg314 <= (wire307 | wire312[(1'h1):(1'h1)]);
        end
      else
        begin
          reg314 <= $signed($signed((!$signed((~wire306)))));
        end
      if (($unsigned($signed({(~reg314)})) & ($unsigned((8'hb2)) ^~ $signed(wire306))))
        begin
          reg315 <= ($unsigned(wire307) ?
              $unsigned(reg314) : $unsigned(({wire310[(1'h1):(1'h0)],
                  wire311} && $signed((~^wire311)))));
          reg316 <= {{(~&((wire307 >= wire307) || wire309[(3'h6):(3'h6)])),
                  $unsigned((~$unsigned(wire309)))}};
          reg317 <= wire307;
          reg318 <= (8'hb0);
        end
      else
        begin
          reg315 <= (|((wire313[(2'h2):(2'h2)] ?
              wire307 : wire306[(4'he):(1'h0)]) != ((~^$unsigned(reg315)) ?
              (|(^~wire312)) : wire306)));
          reg316 <= (((&$unsigned((wire311 << wire306))) ?
              $signed(((wire308 == reg315) && $unsigned(wire306))) : (|((wire309 ^~ wire310) ?
                  (reg314 ?
                      wire307 : wire309) : (8'h9c)))) && (reg315[(3'h4):(3'h4)] ?
              (-wire309[(4'hf):(4'he)]) : reg315));
        end
      reg319 <= $unsigned({wire310, reg318[(4'h8):(4'h8)]});
    end
  assign wire320 = (^~($signed($signed($signed((8'ha7)))) <= $unsigned($signed((~wire313)))));
  always
    @(posedge clk) begin
      reg321 <= (((8'haa) ~^ reg316) ~^ reg318[(3'h6):(2'h2)]);
      if ($signed(($unsigned(wire310) ? $signed(wire313) : $unsigned(reg314))))
        begin
          reg322 <= ((reg318[(3'h7):(2'h3)] < (8'hb7)) != (+($unsigned((~|wire307)) < wire313[(1'h0):(1'h0)])));
          reg323 <= {reg315};
          reg324 <= $signed($signed(wire313));
          reg325 <= (^~reg315);
          if ($unsigned($unsigned($unsigned($signed($signed(reg319))))))
            begin
              reg326 <= (&{wire311, $unsigned($unsigned(wire320))});
              reg327 <= $signed(reg325);
              reg328 <= $signed({(~|$signed({wire307, (8'hae)})),
                  (wire311[(5'h13):(1'h0)] ?
                      reg322 : $signed({wire307, (8'had)}))});
            end
          else
            begin
              reg326 <= (~|(($signed((reg322 < reg315)) ^~ {{wire312, (8'ha7)},
                      (reg328 ? wire313 : wire311)}) ?
                  reg314[(1'h0):(1'h0)] : reg321));
              reg327 <= {$signed((reg318 ?
                      (~|(^~reg326)) : ((wire311 ?
                          wire312 : reg327) * $unsigned(reg319))))};
              reg328 <= {((-((8'hbf) ? reg324 : reg324)) ?
                      $unsigned($signed($unsigned(reg317))) : reg317[(5'h11):(4'h9)])};
            end
        end
      else
        begin
          if (reg318)
            begin
              reg322 <= $signed((^{$signed(reg319)}));
              reg323 <= (wire310 ?
                  ((wire308[(1'h0):(1'h0)] ?
                          $unsigned((-reg322)) : {(reg328 && wire306),
                              (reg325 > reg318)}) ?
                      $signed(wire312) : $unsigned((reg314 <= $unsigned((8'ha9))))) : (8'haf));
              reg324 <= ((~|wire307[(3'h5):(2'h3)]) ?
                  $signed($signed($signed($unsigned(wire313)))) : reg314);
              reg325 <= (wire311 >>> ($signed(reg328[(2'h2):(2'h2)]) ?
                  reg328[(3'h6):(1'h0)] : $unsigned($signed((reg321 & reg324)))));
              reg326 <= (~|wire320);
            end
          else
            begin
              reg322 <= (~&reg315[(1'h1):(1'h0)]);
              reg323 <= ({{wire320[(1'h1):(1'h0)]}} - ((^~reg319) ?
                  reg328[(3'h4):(2'h3)] : ($unsigned((~^(8'ha4))) ?
                      ((^~reg326) ?
                          (^reg326) : (wire309 || reg319)) : (((8'ha9) ?
                          reg321 : reg317) >> (wire309 == wire310)))));
            end
        end
      reg329 <= $signed(wire308[(4'h9):(4'h9)]);
      reg330 <= (+wire320[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg331 <= reg324[(4'hb):(2'h3)];
      reg332 <= ((reg314[(3'h4):(3'h4)] ?
              ($unsigned(reg325) ?
                  reg314 : ($unsigned(reg325) > (|reg330))) : (&(+reg321[(2'h3):(2'h3)]))) ?
          $unsigned(($signed(reg327) <= wire307[(3'h7):(1'h0)])) : wire311);
      reg333 <= $unsigned((~&(reg324 >> {reg316, wire306[(5'h10):(3'h6)]})));
    end
  assign wire334 = (&reg315);
  always
    @(posedge clk) begin
      reg335 <= ($unsigned((~{(wire309 ? wire309 : wire310)})) ?
          ((~$signed($unsigned(reg326))) | (($unsigned(reg316) ?
                  (8'hb5) : (reg333 ? reg318 : reg319)) ?
              $unsigned((|reg332)) : {(^~reg327), {wire307}})) : (8'ha1));
      reg336 <= (+reg321);
      reg337 <= (&$signed(reg331));
      reg338 <= ($signed(reg332[(5'h15):(4'hc)]) && $unsigned(reg332));
    end
  always
    @(posedge clk) begin
      if (reg333[(4'ha):(3'h6)])
        begin
          reg339 <= ((reg318[(2'h2):(1'h1)] ?
                  (&reg331) : {((+reg336) ? wire309 : $unsigned(reg337))}) ?
              reg325 : reg318[(1'h0):(1'h0)]);
          reg340 <= ($unsigned((8'had)) ?
              (reg329[(1'h0):(1'h0)] < ((8'hac) - ((wire320 ?
                  reg337 : (8'ha9)) < $signed(wire309)))) : $unsigned(reg330[(3'h6):(3'h5)]));
        end
      else
        begin
          reg339 <= $signed(({(wire310 > reg336)} != (reg314 ^ ((8'ha2) | $signed((7'h41))))));
          reg340 <= (&(8'hb0));
        end
      reg341 <= $signed(((wire312 >> reg336[(1'h0):(1'h0)]) - $unsigned(reg315)));
      reg342 <= $signed(((reg319[(2'h2):(2'h2)] || reg337[(2'h2):(1'h1)]) >> ((~&(reg336 ^~ reg338)) + {wire306[(3'h6):(1'h1)],
          wire320})));
      reg343 <= (|(reg336 << (|wire310)));
      reg344 <= reg322[(2'h3):(1'h0)];
    end
endmodule

module module240  (y, clk, wire245, wire244, wire243, wire242, wire241);
  output wire [(32'h2cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire245;
  input wire [(3'h6):(1'h0)] wire244;
  input wire signed [(5'h14):(1'h0)] wire243;
  input wire signed [(4'hb):(1'h0)] wire242;
  input wire signed [(5'h13):(1'h0)] wire241;
  wire signed [(5'h11):(1'h0)] wire301;
  wire [(5'h12):(1'h0)] wire300;
  wire signed [(5'h10):(1'h0)] wire276;
  wire [(4'hf):(1'h0)] wire275;
  wire signed [(5'h11):(1'h0)] wire274;
  wire [(4'ha):(1'h0)] wire273;
  wire signed [(4'hd):(1'h0)] wire272;
  wire signed [(3'h6):(1'h0)] wire271;
  wire signed [(3'h7):(1'h0)] wire270;
  wire [(3'h4):(1'h0)] wire260;
  wire signed [(4'hb):(1'h0)] wire259;
  wire [(5'h15):(1'h0)] wire250;
  wire [(4'h8):(1'h0)] wire249;
  wire signed [(5'h15):(1'h0)] wire248;
  wire signed [(5'h15):(1'h0)] wire247;
  wire signed [(4'hf):(1'h0)] wire246;
  reg [(2'h3):(1'h0)] reg299 = (1'h0);
  reg [(4'hc):(1'h0)] reg298 = (1'h0);
  reg [(5'h14):(1'h0)] reg297 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg296 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg295 = (1'h0);
  reg [(3'h7):(1'h0)] reg294 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg293 = (1'h0);
  reg [(4'h9):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg291 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg290 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg289 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg288 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg287 = (1'h0);
  reg [(2'h2):(1'h0)] reg286 = (1'h0);
  reg [(4'he):(1'h0)] reg285 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg284 = (1'h0);
  reg [(4'hc):(1'h0)] reg283 = (1'h0);
  reg [(5'h12):(1'h0)] reg282 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg281 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg280 = (1'h0);
  reg [(4'h9):(1'h0)] reg279 = (1'h0);
  reg [(4'hc):(1'h0)] reg278 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg277 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg269 = (1'h0);
  reg [(3'h5):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg267 = (1'h0);
  reg [(5'h13):(1'h0)] reg266 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg265 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg264 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg263 = (1'h0);
  reg [(5'h12):(1'h0)] reg262 = (1'h0);
  reg [(2'h3):(1'h0)] reg261 = (1'h0);
  reg [(3'h7):(1'h0)] reg258 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg255 = (1'h0);
  reg [(5'h10):(1'h0)] reg254 = (1'h0);
  reg [(4'hc):(1'h0)] reg253 = (1'h0);
  reg [(5'h12):(1'h0)] reg252 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg251 = (1'h0);
  assign y = {wire301,
                 wire300,
                 wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire270,
                 wire260,
                 wire259,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
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
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 (1'h0)};
  assign wire246 = $unsigned((($unsigned((+wire242)) ?
                           wire243 : (~^wire242[(3'h6):(3'h4)])) ?
                       (wire242 + ($signed(wire245) ?
                           wire242[(1'h0):(1'h0)] : wire243[(3'h6):(3'h5)])) : (^wire241[(5'h11):(1'h0)])));
  assign wire247 = wire246;
  assign wire248 = wire241[(5'h11):(4'ha)];
  assign wire249 = (^{(wire245[(4'hc):(1'h0)] <<< (wire242[(3'h6):(3'h4)] ?
                           (wire242 ~^ wire248) : wire242[(1'h1):(1'h0)])),
                       wire241[(3'h4):(1'h0)]});
  assign wire250 = (((~|$unsigned((wire241 ? wire242 : wire246))) ?
                       wire244 : (-((+wire249) >= $signed(wire241)))) * wire244[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg251 <= (8'hb2);
      if (wire241)
        begin
          reg252 <= ((wire243[(5'h14):(1'h1)] == (wire243 ^~ $signed(((7'h42) | wire250)))) <<< $signed(wire242[(3'h5):(1'h1)]));
          reg253 <= wire247[(5'h13):(1'h0)];
        end
      else
        begin
          reg252 <= ((+$unsigned(wire241)) | wire247);
          reg253 <= ($unsigned((^~(8'ha9))) ?
              $unsigned($unsigned((+(wire243 ?
                  wire244 : wire243)))) : ($unsigned($unsigned((wire243 ?
                  (8'ha5) : reg251))) ^~ (({reg253, (8'had)} ?
                  (wire247 <= (8'hba)) : {(8'hb4),
                      (8'hb6)}) > $unsigned((reg252 ? wire247 : wire248)))));
          if (((&wire249[(2'h3):(2'h3)]) * $unsigned((8'h9d))))
            begin
              reg254 <= (((wire245 >= $unsigned((~|reg253))) ~^ (wire248[(3'h4):(1'h1)] || (wire246[(4'he):(3'h5)] ?
                  $signed(wire248) : $unsigned(reg251)))) > {(~^($signed(wire243) * (reg251 ?
                      wire246 : (8'hb5)))),
                  {($signed(wire247) >>> $unsigned((8'ha1)))}});
            end
          else
            begin
              reg254 <= wire244;
              reg255 <= (8'had);
            end
          reg256 <= {(-$signed(($unsigned(wire249) ?
                  $unsigned(wire244) : $signed(reg255)))),
              ((((~&reg251) ^~ (reg254 || wire250)) != wire244[(3'h6):(3'h4)]) >>> {(^~(8'hb2)),
                  (!(!wire242))})};
        end
      reg257 <= ((^~wire250) ?
          (~reg254) : (wire247[(3'h7):(1'h0)] ?
              wire250 : {wire246[(1'h1):(1'h1)]}));
      reg258 <= (~wire242);
    end
  assign wire259 = ({((reg258[(3'h4):(2'h3)] << (wire245 + wire244)) ?
                               $signed({wire249, wire247}) : ((wire244 ?
                                       wire250 : wire244) ?
                                   reg251 : (^reg254)))} ?
                       wire244[(2'h3):(1'h0)] : (((wire243 << (+reg254)) ?
                               ((7'h44) ?
                                   {wire243} : ((8'ha4) >>> wire249)) : wire241) ?
                           $unsigned(wire246[(4'he):(4'ha)]) : (($unsigned(wire249) || wire248) ?
                               ($signed(reg256) ?
                                   reg254 : $signed(reg251)) : ((wire241 || reg258) < {wire250}))));
  assign wire260 = reg254;
  always
    @(posedge clk) begin
      reg261 <= ((~|(~&($signed(wire250) ?
          (wire244 ? wire241 : wire260) : reg258[(3'h7):(3'h6)]))) * reg256);
      reg262 <= (($unsigned((~reg257)) ?
          (&wire246) : ({wire248,
              wire247[(3'h5):(1'h0)]} * wire248[(4'hc):(1'h1)])) || (^~(($unsigned(reg256) ?
              $signed(wire248) : (~&wire248)) ?
          (~(wire245 || reg255)) : $unsigned(wire249))));
      reg263 <= (reg262 ?
          reg257 : ((~&$signed((|(8'haf)))) ~^ {($signed(wire250) - (wire245 ?
                  (8'h9d) : (8'ha3)))}));
      if ((~&{((8'hbb) ? reg251[(5'h10):(4'hc)] : wire260[(2'h3):(2'h3)]),
          $unsigned(wire249)}))
        begin
          reg264 <= $signed(wire250);
          reg265 <= $unsigned((((wire260[(2'h2):(2'h2)] * (-wire241)) ?
              (wire242[(3'h5):(3'h5)] ?
                  wire245 : (reg256 ?
                      reg258 : reg255)) : $signed(reg264[(1'h0):(1'h0)])) != $unsigned(((wire260 ?
              wire246 : reg252) > $unsigned(wire249)))));
          if (wire245[(3'h6):(3'h5)])
            begin
              reg266 <= $unsigned(wire243[(3'h7):(2'h3)]);
              reg267 <= wire241;
              reg268 <= ((^~{wire259}) ? reg255[(4'hd):(3'h5)] : (-wire250));
              reg269 <= $unsigned({$unsigned((reg267 && $signed(reg262)))});
            end
          else
            begin
              reg266 <= {wire247[(4'h8):(4'h8)]};
              reg267 <= $unsigned($signed(reg262));
            end
        end
      else
        begin
          reg264 <= (reg264 ^ ($unsigned((~^(-(8'h9f)))) + $signed(reg267[(3'h4):(1'h1)])));
          reg265 <= ({$unsigned($unsigned((wire241 >= reg251))),
              ((^~reg257[(5'h10):(4'hd)]) ^~ reg258[(3'h7):(3'h6)])} ^~ {(-wire249),
              (wire244 | ($signed(wire259) ? wire249 : $unsigned(reg261)))});
          reg266 <= (~reg257);
        end
    end
  assign wire270 = (reg268 + (-(wire242 ? reg258 : reg261)));
  assign wire271 = reg257[(5'h12):(4'hb)];
  assign wire272 = ((7'h43) ?
                       {reg254, wire247} : (-($signed({wire249, reg257}) ?
                           $unsigned((!wire244)) : reg267[(3'h4):(1'h0)])));
  assign wire273 = $signed((($signed($signed(wire242)) - (~&wire271[(2'h3):(2'h3)])) << (~|$unsigned((reg265 ^~ (8'ha9))))));
  assign wire274 = {$signed(reg262[(5'h11):(1'h0)]),
                       (((^wire270) <<< reg252[(4'hd):(3'h6)]) ?
                           ($unsigned((reg251 ? reg266 : reg262)) ?
                               $unsigned($unsigned((7'h40))) : ($unsigned((7'h43)) ~^ reg261[(1'h1):(1'h0)])) : $signed(wire271))};
  assign wire275 = $unsigned($signed(($signed((reg258 <<< reg251)) ?
                       ((~|(8'hab)) ?
                           (|wire271) : (reg256 & wire273)) : (wire259[(4'h9):(2'h2)] ?
                           $signed(wire270) : (reg252 * wire270)))));
  assign wire276 = (!wire271);
  always
    @(posedge clk) begin
      if (wire249[(4'h8):(3'h6)])
        begin
          reg277 <= (8'hb6);
          reg278 <= wire250[(3'h5):(1'h1)];
          reg279 <= ($signed(reg263) || {$signed(wire259)});
          reg280 <= {(+(!($signed(reg267) ^ ((8'had) > reg279))))};
          reg281 <= $unsigned({({(reg255 == wire276)} ?
                  $signed($unsigned(reg253)) : $unsigned(wire248)),
              reg262[(4'h9):(1'h0)]});
        end
      else
        begin
          if (reg268)
            begin
              reg277 <= $unsigned((~|reg269));
              reg278 <= $signed({reg269[(2'h2):(1'h0)]});
              reg279 <= (($unsigned(reg269[(1'h0):(1'h0)]) ?
                      $unsigned({(reg255 ? (7'h44) : wire272),
                          (~&reg279)}) : wire272) ?
                  $signed($unsigned({(^~wire243),
                      $unsigned(reg280)})) : $signed({$unsigned({wire244,
                          wire276})}));
              reg280 <= ({wire275[(4'h9):(1'h0)]} > $unsigned(((((8'h9d) <= wire271) ?
                      {wire271} : $signed(reg256)) ?
                  reg268[(3'h4):(1'h0)] : $signed(reg279[(3'h6):(3'h5)]))));
            end
          else
            begin
              reg277 <= ((((&{reg269}) ?
                      ($signed(reg268) + (reg254 << reg265)) : wire241) ?
                  wire248 : {$signed(wire276)}) <<< ($signed($unsigned({reg268})) ?
                  ($signed({wire274}) & $signed($signed((8'hb4)))) : (|$signed((^reg269)))));
              reg278 <= $signed($unsigned(wire249));
              reg279 <= reg268[(1'h0):(1'h0)];
            end
        end
      if (($unsigned(reg265[(5'h10):(5'h10)]) ~^ (($unsigned((^wire246)) ?
              wire248 : reg257) ?
          (reg262 ^~ ({wire243, reg279} ?
              (wire260 ?
                  reg280 : (8'ha2)) : reg254)) : ($signed({reg262}) & ((8'hb9) ?
              (reg255 ? wire245 : reg263) : $unsigned(reg268))))))
        begin
          if ((^~(reg264 ? wire246[(4'ha):(3'h4)] : (|(~|$unsigned(wire241))))))
            begin
              reg282 <= (((~$unsigned((^~wire272))) ?
                  $signed((reg280 ?
                      (reg280 ? reg267 : (8'ha6)) : (wire243 ?
                          reg256 : reg264))) : wire272[(1'h0):(1'h0)]) - $signed(((reg263[(2'h2):(2'h2)] - wire273[(3'h5):(1'h1)]) ?
                  ($signed(reg278) ^~ $signed(reg258)) : reg254)));
              reg283 <= wire274[(4'hb):(4'h9)];
              reg284 <= (($signed((reg266[(4'hb):(3'h7)] * (reg253 >= reg283))) * $signed((reg282[(4'hc):(3'h6)] ?
                  $unsigned(reg256) : $signed((8'ha2))))) && (reg256[(5'h13):(5'h11)] - (~^$signed((8'hb4)))));
              reg285 <= (|wire242[(4'hb):(4'hb)]);
            end
          else
            begin
              reg282 <= (($unsigned($unsigned((&wire271))) ?
                      $unsigned({{reg280, reg265},
                          (wire259 ?
                              wire245 : wire272)}) : (^(wire259[(1'h1):(1'h1)] ?
                          (reg265 + (8'hb9)) : wire273[(3'h7):(1'h0)]))) ?
                  reg251[(3'h7):(3'h6)] : ($signed((reg283 ?
                      (reg256 <<< reg255) : (!reg282))) | (^~wire249)));
              reg283 <= (&($unsigned(reg277) ?
                  (reg256[(4'hb):(4'h9)] <<< $signed($signed(reg253))) : $unsigned((((8'h9e) * wire249) >= (reg251 ?
                      wire247 : wire260)))));
            end
        end
      else
        begin
          if (reg258)
            begin
              reg282 <= wire243;
            end
          else
            begin
              reg282 <= reg254[(4'ha):(4'h9)];
              reg283 <= wire271;
              reg284 <= (~^(8'hab));
            end
          if ($unsigned(((8'hbd) ~^ ($unsigned((reg257 << reg256)) ?
              $unsigned($unsigned(reg268)) : $signed((reg253 ?
                  reg285 : reg263))))))
            begin
              reg285 <= reg278;
            end
          else
            begin
              reg285 <= {wire248[(3'h5):(3'h5)]};
              reg286 <= (~&((wire274 ? $signed({(8'hb7), reg257}) : (8'ha2)) ?
                  wire274 : {(^$signed(reg284)),
                      $unsigned($unsigned(reg284))}));
              reg287 <= (-reg255[(5'h14):(4'h8)]);
              reg288 <= $unsigned($unsigned(reg251));
            end
        end
    end
  always
    @(posedge clk) begin
      if ((~|(wire248 * reg266)))
        begin
          reg289 <= $signed($signed($signed((~|(~&wire273)))));
          if (((^reg284[(4'ha):(4'h8)]) ?
              $signed((reg283 != ($signed(reg266) >= (^wire275)))) : $signed($signed($unsigned($signed(reg287))))))
            begin
              reg290 <= $signed((((^~(wire272 == reg278)) - reg289[(3'h5):(2'h2)]) >= $signed({{reg257},
                  wire259})));
              reg291 <= (+(reg281 <<< wire271));
            end
          else
            begin
              reg290 <= $unsigned($signed(wire241));
              reg291 <= (reg286 ? wire244[(3'h6):(1'h0)] : {wire272});
              reg292 <= reg269[(1'h1):(1'h0)];
            end
          if ($unsigned(($signed(reg291[(4'hf):(4'hf)]) ?
              $signed(($signed(reg252) - (reg265 | reg285))) : reg255[(4'he):(4'h8)])))
            begin
              reg293 <= reg279[(1'h1):(1'h1)];
              reg294 <= $signed($signed(($unsigned((reg279 ?
                  reg253 : reg264)) >= reg283[(3'h6):(1'h0)])));
              reg295 <= $unsigned(reg253[(3'h6):(3'h5)]);
              reg296 <= (+$signed($unsigned($signed((|wire274)))));
            end
          else
            begin
              reg293 <= (8'h9e);
              reg294 <= {{wire275}};
              reg295 <= ($signed(((~^(~&(8'h9d))) ?
                  reg281[(1'h1):(1'h0)] : ({reg285,
                      reg265} < wire243))) & (8'haf));
            end
        end
      else
        begin
          reg289 <= $unsigned((((~^(reg254 <<< reg267)) ^ ((wire242 ?
                  reg254 : wire250) ?
              reg283[(3'h6):(3'h5)] : $unsigned(reg265))) >>> ({wire248[(5'h10):(3'h7)],
              $unsigned(reg262)} ^~ (wire272[(3'h5):(3'h4)] ?
              (wire246 ~^ reg287) : (!wire273)))));
          reg290 <= ($unsigned(((8'hbd) ?
                  (|$signed(reg296)) : $unsigned((reg285 < wire271)))) ?
              (-$signed((reg269[(2'h2):(1'h0)] < (~|reg264)))) : (~((((8'ha2) ?
                  reg279 : (8'hb7)) || (reg257 - reg264)) & (reg251 * wire242[(4'hb):(3'h4)]))));
          reg291 <= ($signed(($signed((~|reg253)) ?
              $signed(reg279[(1'h0):(1'h0)]) : (^~$unsigned(reg264)))) > reg287);
        end
      reg297 <= reg277[(3'h6):(3'h4)];
      reg298 <= (^~(!reg252));
      reg299 <= {({($unsigned(reg287) ?
                      $unsigned(reg293) : wire250[(3'h6):(2'h3)]),
                  ((~^reg297) ? {reg267, reg269} : wire260[(3'h4):(3'h4)])} ?
              (!reg269) : (reg267[(5'h12):(1'h0)] - $signed((wire248 ?
                  wire273 : reg283))))};
    end
  assign wire300 = wire276[(1'h0):(1'h0)];
  assign wire301 = $unsigned(wire243[(3'h5):(1'h1)]);
endmodule

module module177  (y, clk, wire182, wire181, wire180, wire179, wire178);
  output wire [(32'h1ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire182;
  input wire signed [(4'h8):(1'h0)] wire181;
  input wire [(4'hb):(1'h0)] wire180;
  input wire signed [(5'h11):(1'h0)] wire179;
  input wire signed [(4'h8):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire223;
  wire [(4'he):(1'h0)] wire222;
  wire signed [(5'h14):(1'h0)] wire209;
  wire signed [(5'h15):(1'h0)] wire208;
  wire [(3'h6):(1'h0)] wire207;
  wire [(2'h2):(1'h0)] wire194;
  wire [(4'h8):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire191;
  wire [(4'hd):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire188;
  wire signed [(3'h6):(1'h0)] wire187;
  wire [(3'h7):(1'h0)] wire186;
  wire signed [(3'h7):(1'h0)] wire185;
  wire signed [(3'h5):(1'h0)] wire184;
  wire signed [(2'h2):(1'h0)] wire183;
  reg [(5'h14):(1'h0)] reg221 = (1'h0);
  reg [(3'h6):(1'h0)] reg220 = (1'h0);
  reg [(4'h9):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg216 = (1'h0);
  reg [(4'hd):(1'h0)] reg215 = (1'h0);
  reg [(5'h11):(1'h0)] reg214 = (1'h0);
  reg [(4'hf):(1'h0)] reg213 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(5'h14):(1'h0)] reg211 = (1'h0);
  reg [(5'h11):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg206 = (1'h0);
  reg [(2'h2):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(5'h15):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg202 = (1'h0);
  reg [(4'hd):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg [(4'hf):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg198 = (1'h0);
  reg [(2'h3):(1'h0)] reg197 = (1'h0);
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  assign y = {wire223,
                 wire222,
                 wire209,
                 wire208,
                 wire207,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
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
                 (1'h0)};
  assign wire183 = ($unsigned(wire182[(3'h4):(1'h0)]) * (((~$unsigned(wire182)) <<< $unsigned(((8'hbf) ^ wire182))) ?
                       (wire178[(2'h3):(1'h0)] ?
                           (8'haf) : $unsigned(((8'hb3) <<< wire181))) : (~|$signed((wire182 ?
                           wire178 : wire178)))));
  assign wire184 = $signed((|wire178[(2'h2):(1'h0)]));
  assign wire185 = $signed(((({wire178,
                       wire178} | (wire179 + (7'h43))) ^ (!(wire184 > wire179))) * $unsigned((wire183 || (!wire184)))));
  assign wire186 = {($signed(($unsigned(wire183) ~^ (wire181 ?
                           wire178 : (8'ha7)))) != {wire182}),
                       ({wire184[(2'h3):(1'h1)],
                           ((|wire182) ?
                               {wire184} : wire182)} ^~ $signed({(wire185 | (8'ha8)),
                           (wire179 * wire182)}))};
  assign wire187 = (~&$unsigned($unsigned(((!wire185) <<< (wire184 & wire184)))));
  assign wire188 = {wire186[(2'h2):(2'h2)]};
  assign wire189 = $unsigned(wire185);
  assign wire190 = (~|((wire182[(2'h3):(2'h3)] & wire179) ?
                       $signed($signed(wire181[(1'h0):(1'h0)])) : (((wire180 ~^ wire185) ?
                               {wire178} : (wire179 ? wire183 : wire185)) ?
                           wire184[(3'h4):(1'h0)] : (-wire186[(3'h5):(1'h1)]))));
  assign wire191 = $unsigned(wire181);
  assign wire192 = $unsigned($unsigned((8'ha5)));
  assign wire193 = (^(!$unsigned(wire185)));
  assign wire194 = $unsigned({wire186, (7'h44)});
  always
    @(posedge clk) begin
      if (({wire178, (wire182 ~^ $signed(wire193))} ?
          wire178[(3'h6):(3'h4)] : wire186[(2'h3):(1'h0)]))
        begin
          reg195 <= ((wire194[(1'h1):(1'h1)] ?
                  $signed({$unsigned(wire190)}) : $signed($unsigned((wire187 ?
                      (7'h44) : wire188)))) ?
              (|$unsigned((-{(8'ha1)}))) : (!((((8'ha5) ~^ wire192) ?
                  (^wire179) : $unsigned(wire184)) != $unsigned((+wire185)))));
          reg196 <= ((+wire182[(3'h4):(1'h1)]) ?
              $unsigned(wire190) : $signed(((^~$unsigned(wire184)) ?
                  $unsigned($unsigned(wire189)) : {(wire192 ?
                          (8'haf) : wire184)})));
          reg197 <= $unsigned($unsigned({(~^wire190), wire190[(4'h8):(2'h3)]}));
          reg198 <= {(wire193[(1'h1):(1'h1)] ? reg196 : $unsigned(reg196)),
              $signed(wire188[(5'h11):(3'h5)])};
        end
      else
        begin
          reg195 <= $unsigned(wire186);
        end
      reg199 <= ({$unsigned($signed((^~wire184)))} ?
          $signed({$signed((wire183 ? reg196 : (8'hbc)))}) : wire193);
      if (wire192[(4'hf):(4'he)])
        begin
          if ($signed(reg197))
            begin
              reg200 <= ((wire183 << (!wire179[(4'he):(3'h4)])) ?
                  $unsigned(((wire183[(2'h2):(2'h2)] ^ (-wire190)) > {$unsigned((8'haa)),
                      wire181[(1'h0):(1'h0)]})) : $signed($signed($unsigned(wire194[(2'h2):(1'h0)]))));
              reg201 <= wire184[(3'h5):(2'h2)];
            end
          else
            begin
              reg200 <= $signed(wire188[(5'h12):(4'hc)]);
              reg201 <= (~&{$signed((wire184 <<< wire189))});
            end
          if ((($unsigned(($unsigned(wire180) <<< wire187[(1'h1):(1'h0)])) ?
                  wire184[(2'h3):(1'h0)] : reg197[(1'h0):(1'h0)]) ?
              ($signed((~^$unsigned(reg195))) ^ $signed(wire185[(3'h7):(3'h6)])) : wire194[(2'h2):(2'h2)]))
            begin
              reg202 <= (8'hbf);
              reg203 <= {wire181};
              reg204 <= ($unsigned($signed((wire193[(3'h6):(1'h0)] ?
                      $unsigned(reg201) : $unsigned(wire181)))) ?
                  wire187[(1'h0):(1'h0)] : (reg196 < (((~|(8'ha2)) | $unsigned(wire191)) | $signed($unsigned(reg197)))));
              reg205 <= wire194;
              reg206 <= (wire181 - (wire194 | reg204[(4'h8):(3'h4)]));
            end
          else
            begin
              reg202 <= {$signed((reg198 << ((wire190 ?
                      reg195 : wire191) ^~ $unsigned(wire192))))};
            end
        end
      else
        begin
          if (wire192[(3'h5):(2'h3)])
            begin
              reg200 <= (wire179 <= (8'ha8));
              reg201 <= $unsigned($signed(wire187));
            end
          else
            begin
              reg200 <= $unsigned((({$unsigned(wire182), (|(8'hae))} ?
                      (reg206[(1'h0):(1'h0)] - $signed(wire189)) : $unsigned(reg195[(2'h2):(1'h0)])) ?
                  wire186 : (+(~{wire194, wire189}))));
            end
          reg202 <= $signed((^reg205[(2'h2):(2'h2)]));
          reg203 <= {$unsigned((~|(~$unsigned(wire186))))};
          reg204 <= $signed($unsigned($signed($signed((reg195 || reg200)))));
          reg205 <= $signed({reg203});
        end
    end
  assign wire207 = (reg198[(3'h4):(2'h3)] << (+((|{reg198, wire178}) ?
                       wire184 : (8'hbf))));
  assign wire208 = wire188;
  assign wire209 = wire184[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg210 <= (7'h42);
      if (wire186)
        begin
          reg211 <= wire181;
          reg212 <= $unsigned((^~$signed(reg202)));
          reg213 <= wire208[(3'h4):(1'h0)];
          if ({wire186[(1'h0):(1'h0)], (7'h43)})
            begin
              reg214 <= $unsigned(((((-reg202) ?
                          wire190 : ((8'hb1) ^ (8'ha2))) ?
                      {$unsigned(wire188), (&wire208)} : wire185) ?
                  wire187 : (((reg213 <= reg201) - (^reg210)) >> $unsigned((reg211 && wire208)))));
              reg215 <= (($signed(({wire209, wire208} || {reg210,
                  wire209})) & ($signed(wire207[(3'h5):(1'h0)]) > {(wire178 == reg205)})) >>> $unsigned(wire186[(1'h1):(1'h0)]));
              reg216 <= ((($signed((wire183 >= reg195)) ?
                  $unsigned($unsigned(wire191)) : (wire187[(2'h2):(2'h2)] > wire208)) >= wire182[(2'h3):(1'h0)]) ^~ {{$signed((reg196 <<< reg215)),
                      {$unsigned(reg195), reg206[(1'h1):(1'h0)]}}});
            end
          else
            begin
              reg214 <= reg206[(3'h4):(3'h4)];
              reg215 <= (~&(wire207 ?
                  $signed(wire194[(2'h2):(1'h0)]) : ((wire182 >= wire187[(3'h4):(2'h3)]) && $signed((~reg211)))));
            end
          reg217 <= reg203[(3'h4):(1'h1)];
        end
      else
        begin
          if (reg217)
            begin
              reg211 <= ({$signed($signed($unsigned((8'hb6))))} ?
                  reg199 : reg202[(2'h3):(1'h1)]);
              reg212 <= wire194[(2'h2):(1'h1)];
              reg213 <= ($unsigned({((~(7'h42)) - wire182)}) ~^ ($signed($signed(reg216)) ?
                  reg200 : (8'hb3)));
            end
          else
            begin
              reg211 <= (^~wire188[(3'h7):(3'h6)]);
              reg212 <= (((((^~wire209) >> $unsigned(reg200)) ?
                          reg203[(4'he):(2'h3)] : (reg201[(1'h1):(1'h1)] ?
                              (reg205 ?
                                  wire183 : (8'hb1)) : (wire185 & reg216))) ?
                      {{reg213}} : {($unsigned(reg214) ?
                              reg203 : (reg215 ^~ (7'h43)))}) ?
                  $signed(((~&{reg204}) - $signed(wire182[(4'h8):(3'h5)]))) : (wire193[(3'h5):(2'h3)] ?
                      ((8'hb2) ?
                          (^~wire194) : ($signed((8'hae)) ?
                              wire190 : reg213)) : (~((8'ha7) & (reg206 ?
                          reg200 : reg205)))));
              reg213 <= (reg195[(3'h6):(3'h5)] ?
                  (wire184 ?
                      (wire207 != reg195[(1'h0):(1'h0)]) : ((wire192 ?
                          (reg198 ^~ reg212) : $unsigned(wire193)) ^ $unsigned(((8'h9e) >= wire209)))) : reg215);
            end
          reg214 <= $unsigned($signed(reg201));
          reg215 <= $signed($signed($unsigned($unsigned({(8'hbd), wire207}))));
          if ($unsigned(($unsigned((+{reg216,
              reg203})) * $unsigned(wire184[(2'h2):(1'h0)]))))
            begin
              reg216 <= $signed((~^($signed((wire181 ?
                  reg204 : wire182)) <<< ($signed(reg203) ?
                  (reg202 ? wire184 : reg195) : {reg206, wire190}))));
              reg217 <= (wire194[(2'h2):(2'h2)] - (wire193 || reg196));
              reg218 <= (~^($signed((((8'hb7) ? wire207 : reg195) ?
                      reg199[(3'h4):(3'h4)] : wire186[(3'h7):(1'h1)])) ?
                  ((!(reg202 ? wire178 : reg210)) ?
                      (reg206 ?
                          (reg205 << reg211) : {wire180,
                              wire178}) : (&wire187)) : ({$unsigned(reg213),
                          $signed(wire179)} ?
                      ((!wire181) & $signed(wire189)) : wire192)));
              reg219 <= (((-((wire178 ^~ wire178) ? $signed(reg197) : reg216)) ?
                      wire183 : {(reg214 ? (-(8'hbf)) : wire207),
                          (wire194[(2'h2):(2'h2)] ?
                              (wire192 ? wire185 : (8'hac)) : ((8'hb0) ?
                                  wire183 : reg213))}) ?
                  (~|reg213[(3'h4):(1'h1)]) : {wire191});
            end
          else
            begin
              reg216 <= (~&reg211);
              reg217 <= $signed($signed(wire186));
              reg218 <= $signed(reg216);
              reg219 <= (8'hb1);
            end
        end
      reg220 <= (wire178 == (-(~((~^wire187) ? reg206 : (wire187 ^~ reg215)))));
      reg221 <= ((~&$signed((((7'h42) ? wire179 : wire209) ?
          $unsigned(wire188) : reg219))) > ($unsigned((8'h9f)) ?
          reg200[(4'hb):(4'hb)] : (&$signed((~|wire183)))));
    end
  assign wire222 = reg218[(4'hc):(3'h6)];
  assign wire223 = (+reg198[(3'h4):(2'h3)]);
endmodule

module module155
#(parameter param172 = ((-(&({(8'ha5)} ? ((7'h40) == (8'hb8)) : ((8'hbc) ~^ (8'hac))))) ? (((((8'ha8) ? (8'haa) : (8'hb2)) ? (~|(8'h9e)) : ((7'h44) * (7'h40))) ? (((8'hbb) || (8'hba)) || {(8'ha7)}) : (|((8'hbf) * (8'hbe)))) ? {{(^(8'haa)), ((8'hbd) ? (8'haa) : (8'hb0))}, (((8'ha0) ? (8'had) : (8'hb5)) ~^ ((8'hb8) ? (8'ha0) : (8'hac)))} : (~|(+(|(8'ha3))))) : ((~({(8'hb1), (8'ha0)} ? ((8'h9d) ? (8'ha1) : (8'hb2)) : ((8'hbc) && (8'ha7)))) == (8'ha2))), 
parameter param173 = ((~|{param172, (!{param172})}) ? {{(((7'h41) ? param172 : param172) + param172)}, (^~(~&{param172}))} : ((param172 <<< {(param172 ? param172 : param172), (param172 > param172)}) | (((param172 ? param172 : param172) ? ((8'haf) && param172) : (param172 ? param172 : param172)) << {param172}))))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire160;
  input wire [(3'h5):(1'h0)] wire159;
  input wire [(3'h4):(1'h0)] wire158;
  input wire [(4'hd):(1'h0)] wire157;
  input wire signed [(2'h3):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire [(5'h13):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire165;
  wire signed [(5'h15):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire161;
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  assign y = {wire171,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire161,
                 reg170,
                 reg169,
                 reg162,
                 (1'h0)};
  assign wire161 = wire159;
  always
    @(posedge clk) begin
      reg162 <= $unsigned($unsigned((+wire159[(2'h3):(1'h0)])));
    end
  assign wire163 = wire156[(1'h1):(1'h1)];
  assign wire164 = ($unsigned(wire157[(1'h0):(1'h0)]) < {(($signed(wire160) ~^ wire158) <= wire157)});
  assign wire165 = (8'ha9);
  assign wire166 = (~^wire159[(3'h5):(1'h0)]);
  assign wire167 = ({(($unsigned(wire158) < wire165) ?
                               (-$signed((8'hb1))) : (~|$unsigned(wire161))),
                           $unsigned(wire157)} ?
                       wire156 : (((8'haf) << wire164) && (~^($unsigned(wire156) <= (|(8'ha3))))));
  assign wire168 = wire161[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg169 <= (-(((reg162[(5'h10):(4'hb)] ?
              wire164[(4'he):(4'hc)] : wire157) >>> (~$signed(reg162))) ?
          (8'hb1) : {((8'ha3) > wire157)}));
      reg170 <= {wire159[(3'h4):(1'h1)], $signed(wire168)};
    end
  assign wire171 = (^~$unsigned((wire165[(1'h0):(1'h0)] & $unsigned((~wire167)))));
endmodule
