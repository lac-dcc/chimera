module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire226;
  wire [(2'h2):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire217;
  wire [(4'hd):(1'h0)] wire216;
  wire [(5'h10):(1'h0)] wire215;
  wire signed [(4'h9):(1'h0)] wire214;
  wire [(5'h15):(1'h0)] wire207;
  wire signed [(5'h13):(1'h0)] wire206;
  wire signed [(4'hc):(1'h0)] wire205;
  wire signed [(2'h3):(1'h0)] wire204;
  wire [(5'h11):(1'h0)] wire203;
  wire [(4'hc):(1'h0)] wire202;
  wire signed [(4'ha):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire200;
  wire [(5'h10):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire197;
  reg signed [(5'h10):(1'h0)] reg236 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg235 = (1'h0);
  reg [(3'h6):(1'h0)] reg234 = (1'h0);
  reg [(4'he):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg232 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg231 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg230 = (1'h0);
  reg [(4'hb):(1'h0)] reg229 = (1'h0);
  reg [(5'h15):(1'h0)] reg228 = (1'h0);
  reg [(5'h10):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg224 = (1'h0);
  reg [(5'h11):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg221 = (1'h0);
  reg [(4'h8):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg212 = (1'h0);
  reg [(3'h4):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg signed [(4'he):(1'h0)] reg208 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire197,
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
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 (1'h0)};
  module5 #() modinst198 (.y(wire197), .wire6(wire2), .wire9(wire0), .wire8(wire4), .clk(clk), .wire10(wire1), .wire7(wire3));
  assign wire199 = (-({(&wire0[(3'h5):(3'h5)]),
                           (wire3[(4'h9):(2'h2)] ?
                               (wire4 ?
                                   wire197 : wire197) : (wire197 << wire0))} ?
                       ((|(^wire3)) ?
                           $unsigned((wire1 ^ wire197)) : $signed(wire197[(1'h1):(1'h1)])) : $signed((wire197 ?
                           wire3 : $signed(wire3)))));
  assign wire200 = $unsigned(((((wire2 == wire199) - (wire3 ?
                       wire3 : (8'h9d))) < (-(~&wire1))) == ($signed(wire199) <= ((wire197 ^~ wire197) ?
                       $unsigned(wire199) : wire3))));
  assign wire201 = ((wire199[(4'he):(3'h4)] <= {$unsigned($unsigned(wire1))}) || $unsigned(($signed(wire4) & $unsigned(wire0))));
  assign wire202 = $unsigned(wire200);
  assign wire203 = wire4[(4'hd):(4'hd)];
  assign wire204 = (^$signed(wire197));
  assign wire205 = $unsigned($signed(((wire199[(2'h2):(2'h2)] ?
                           (|wire200) : $signed(wire203)) ?
                       $unsigned($unsigned(wire204)) : wire204)));
  assign wire206 = $unsigned($unsigned($signed($unsigned($signed(wire2)))));
  assign wire207 = wire202;
  always
    @(posedge clk) begin
      if ($unsigned(((wire205 ?
          {(wire4 ?
                  wire3 : wire201)} : ((~|wire200) ^ $unsigned(wire4))) != (~&((-wire4) >> (wire207 << wire1))))))
        begin
          if (wire203)
            begin
              reg208 <= wire207[(1'h0):(1'h0)];
              reg209 <= $signed($signed((((wire202 | wire201) ?
                      wire207 : (~&wire3)) ?
                  $unsigned(wire202) : (((8'ha6) ?
                      wire202 : wire207) || (wire204 << wire0)))));
            end
          else
            begin
              reg208 <= (+{{wire207[(3'h7):(3'h5)], $unsigned(wire202)},
                  $signed(({wire197, wire203} >= ((8'h9c) >= wire204)))});
              reg209 <= wire203[(4'hd):(3'h6)];
              reg210 <= (wire1[(4'h8):(2'h2)] ?
                  {$signed(wire205[(2'h3):(1'h0)])} : $signed(wire197[(3'h5):(2'h3)]));
              reg211 <= {($signed(((wire2 >> wire200) ?
                      (wire199 ?
                          wire207 : wire204) : $unsigned(wire204))) * ($unsigned(reg209) != (7'h42))),
                  ($unsigned(wire0[(1'h0):(1'h0)]) ? wire203 : (^wire201))};
            end
          reg212 <= (wire206 ?
              (~^($unsigned((wire3 & wire204)) ?
                  ((+wire2) ? (-wire1) : $signed(wire199)) : (wire199 ?
                      (-reg210) : wire201[(4'h8):(4'h8)]))) : (-wire206));
        end
      else
        begin
          if ((wire2 ?
              ((wire200[(3'h7):(2'h3)] + {(wire201 ?
                      wire4 : wire0)}) > (8'hb2)) : (-(~&$unsigned((!(8'h9d)))))))
            begin
              reg208 <= $signed((wire207 & (((wire3 + wire4) == (wire203 << wire4)) > reg210)));
              reg209 <= {reg210,
                  (wire206 ?
                      {{(wire205 ? wire1 : (8'hbb)), $signed((8'ha7))},
                          $signed({reg210})} : {$signed(((8'ha8) ?
                              reg210 : reg209))})};
            end
          else
            begin
              reg208 <= $unsigned({{$unsigned(reg208), wire204}});
              reg209 <= (wire205[(4'h8):(1'h1)] ?
                  (&$signed(($unsigned(wire0) ?
                      ((8'h9e) < reg209) : wire1[(2'h3):(2'h2)]))) : (+({{wire204,
                              wire203}} ?
                      {wire200[(1'h1):(1'h0)]} : (wire207[(2'h2):(2'h2)] + wire203[(5'h10):(4'ha)]))));
              reg210 <= (($signed(reg208) << wire1[(1'h0):(1'h0)]) ?
                  (&(-($unsigned(wire4) ?
                      wire200 : wire205[(4'hb):(2'h2)]))) : ($unsigned(reg209) >>> ((|(wire1 ?
                          wire202 : reg209)) ?
                      (wire200 || (7'h42)) : ($unsigned(wire200) & wire2[(5'h14):(5'h13)]))));
              reg211 <= $unsigned(wire3[(5'h12):(1'h0)]);
            end
          reg212 <= $unsigned(((~|wire202) ? wire200[(4'h9):(4'h9)] : wire0));
        end
      reg213 <= {$unsigned(((+((7'h40) ^~ wire202)) <<< $unsigned({wire4})))};
    end
  assign wire214 = $unsigned(wire199);
  assign wire215 = (~|$signed((-reg208[(4'hb):(3'h4)])));
  assign wire216 = (-$signed(wire197));
  assign wire217 = (+((((wire2 ^~ reg212) ? $signed((8'ha3)) : (|wire0)) ?
                       ((wire200 ?
                           wire207 : wire216) && reg209[(1'h1):(1'h0)]) : {$signed(wire200),
                           wire3[(1'h0):(1'h0)]}) - $signed(((reg210 ?
                           wire205 : reg212) ?
                       wire200[(3'h4):(2'h3)] : reg212))));
  always
    @(posedge clk) begin
      reg218 <= wire216;
      reg219 <= (+$unsigned(((~reg210) << $signed($signed((8'hac))))));
      if ($unsigned($signed(reg218[(3'h5):(1'h0)])))
        begin
          reg220 <= $signed((~&$signed((^~reg213))));
          reg221 <= (8'ha9);
          reg222 <= $signed(($signed($unsigned(wire197)) ^ wire200[(2'h3):(1'h0)]));
          reg223 <= {$unsigned(reg213)};
          reg224 <= ((wire206[(2'h2):(1'h0)] ?
                  wire200 : $unsigned((~|reg223[(3'h6):(2'h3)]))) ?
              (-$signed(reg218[(4'hd):(3'h5)])) : ((-(-reg222[(2'h3):(1'h0)])) ?
                  $signed($unsigned((reg208 ?
                      reg219 : (8'h9c)))) : $signed($unsigned({reg209,
                      wire1}))));
        end
      else
        begin
          reg220 <= (~(reg220 + (!reg212[(2'h2):(1'h1)])));
          reg221 <= (wire206 == $unsigned((^~(|(reg208 ? reg223 : wire197)))));
        end
    end
  assign wire225 = wire214[(4'h9):(3'h4)];
  assign wire226 = {reg210};
  always
    @(posedge clk) begin
      if (wire200[(3'h7):(3'h6)])
        begin
          if ({$unsigned($unsigned(((reg210 != wire3) ?
                  $unsigned(reg208) : (&wire204))))})
            begin
              reg227 <= (^((7'h44) + $unsigned($unsigned($signed(reg212)))));
              reg228 <= ({(~^wire217)} << ($signed(wire204[(2'h3):(2'h2)]) ^ reg213[(2'h3):(1'h1)]));
            end
          else
            begin
              reg227 <= (reg228 <<< (reg222[(1'h0):(1'h0)] != $unsigned($unsigned((wire1 ?
                  (8'hbe) : wire226)))));
              reg228 <= (~&(|((wire217[(1'h1):(1'h0)] <= {(8'hbf)}) >>> reg213)));
              reg229 <= reg213[(5'h13):(3'h4)];
            end
        end
      else
        begin
          reg227 <= (~^$unsigned(reg227[(3'h5):(2'h2)]));
          reg228 <= wire207;
          reg229 <= reg219[(4'h9):(3'h6)];
          reg230 <= reg223;
          reg231 <= (wire2 ?
              ($unsigned((wire4[(3'h6):(1'h1)] >> wire197)) ?
                  ($unsigned((reg210 <= wire217)) ?
                      wire216 : wire226) : reg219[(3'h7):(2'h3)]) : reg222);
        end
      if ($unsigned((&(^(reg218[(1'h1):(1'h1)] ?
          $unsigned(wire0) : (wire197 ? wire217 : wire1))))))
        begin
          reg232 <= $unsigned(($signed(((~&(8'hb4)) <<< (reg218 ^~ reg229))) * $signed($signed(wire200[(3'h4):(1'h1)]))));
          if (reg210)
            begin
              reg233 <= (|$unsigned((~|(-reg211[(2'h2):(1'h1)]))));
              reg234 <= wire199[(4'hd):(4'hb)];
              reg235 <= ($unsigned((|reg210[(3'h5):(2'h3)])) <= wire0);
              reg236 <= reg218[(3'h5):(1'h1)];
            end
          else
            begin
              reg233 <= ({wire217[(3'h5):(2'h3)], $unsigned((^reg218))} ?
                  (~&reg236) : $unsigned(wire202[(3'h7):(2'h2)]));
              reg234 <= wire202[(4'ha):(2'h3)];
            end
        end
      else
        begin
          reg232 <= (($signed(((reg209 ?
                  (8'ha3) : reg223) < ((7'h44) & wire2))) ?
              ((reg230 <= wire215[(4'he):(4'h8)]) ?
                  (reg234[(1'h0):(1'h0)] ?
                      wire0 : wire205) : $signed((^~wire226))) : (~$unsigned(reg232[(3'h5):(2'h2)]))) - (8'ha8));
        end
    end
endmodule

module module5
#(parameter param195 = (((^(((7'h41) ? (8'hb8) : (8'hbe)) ? ((8'ha7) ^~ (8'ha0)) : (8'hb5))) ? ({((8'ha2) ? (8'hbc) : (8'hba)), (8'ha1)} ? ((~&(8'ha7)) ~^ ((8'hab) ? (8'hb3) : (8'h9c))) : (~&{(8'ha7)})) : (((8'hb7) ? ((8'hba) ? (8'ha5) : (8'ha7)) : (!(8'haa))) ~^ (((8'ha5) ? (8'ha3) : (8'hb6)) == (~^(8'ha5))))) - ((~(&((8'hb3) || (7'h43)))) != (8'ha8))), 
parameter param196 = ({{param195, {(param195 ? (7'h43) : (8'hb9)), (param195 ? param195 : param195)}}, {(^(8'ha1)), (~|param195)}} & (~|({{(8'h9f)}} >>> ((param195 > param195) ? param195 : param195)))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire194;
  wire signed [(4'hb):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire188;
  wire signed [(5'h15):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire149;
  wire signed [(4'h8):(1'h0)] wire150;
  wire [(3'h5):(1'h0)] wire186;
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(3'h6):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  assign y = {wire194,
                 wire189,
                 wire188,
                 wire147,
                 wire103,
                 wire102,
                 wire41,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire71,
                 wire73,
                 wire100,
                 wire149,
                 wire150,
                 wire186,
                 reg193,
                 reg192,
                 reg191,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 (1'h0)};
  assign wire11 = wire10[(2'h3):(2'h3)];
  assign wire12 = (wire8[(3'h4):(2'h2)] ?
                      wire10[(2'h2):(1'h0)] : (+wire8[(3'h4):(1'h1)]));
  assign wire13 = ($unsigned(wire12[(3'h4):(2'h2)]) == wire8);
  assign wire14 = (({(((8'hb4) ? wire10 : wire11) ?
                                  (!(8'hab)) : $signed((8'ha7)))} ?
                          $signed(((~|wire12) >>> (wire13 ^~ wire8))) : $unsigned((wire11 ?
                              $unsigned(wire7) : {wire10, wire13}))) ?
                      ((~^wire11) * wire12[(3'h4):(3'h4)]) : $unsigned($signed(wire6[(2'h2):(1'h1)])));
  module15 #() modinst42 (.wire17(wire6), .wire19(wire13), .y(wire41), .wire16(wire10), .wire20(wire12), .wire18(wire14), .clk(clk));
  module43 #() modinst72 (wire71, clk, wire11, wire13, wire10, wire12);
  assign wire73 = (wire6[(4'hf):(4'h9)] & wire10);
  module74 #() modinst101 (.wire77(wire9), .wire75(wire14), .wire79(wire8), .clk(clk), .wire78(wire6), .y(wire100), .wire76(wire71));
  assign wire102 = ({wire41} * (~wire14[(4'h8):(3'h5)]));
  assign wire103 = wire13;
  module104 #() modinst148 (wire147, clk, wire103, wire100, wire102, wire11, wire9);
  assign wire149 = {$unsigned($signed(wire102))};
  assign wire150 = ($unsigned($unsigned(({wire6, wire73} ?
                           {wire71} : (wire103 < wire41)))) ?
                       $signed({$unsigned((~^wire12))}) : (wire149 != $signed(($signed(wire7) ?
                           (wire41 ^ wire41) : wire10))));
  always
    @(posedge clk) begin
      reg151 <= $unsigned((wire100[(4'hc):(3'h4)] >>> $signed({wire8})));
      reg152 <= {{$unsigned(($unsigned(wire8) ^ (wire147 ?
                  wire103 : wire14)))}};
      reg153 <= (-$signed(((wire149[(1'h1):(1'h0)] ^ {wire41,
          wire41}) * $signed((wire10 != wire71)))));
      reg154 <= $unsigned(reg153);
    end
  module155 #() modinst187 (.wire156(wire8), .y(wire186), .wire159(wire14), .wire157(wire150), .clk(clk), .wire160(wire6), .wire158(wire147));
  assign wire188 = $signed({(8'hae)});
  module74 #() modinst190 (.clk(clk), .wire76(wire149), .wire79(reg154), .wire75(wire9), .y(wire189), .wire78(wire41), .wire77(wire102));
  always
    @(posedge clk) begin
      reg191 <= wire102[(3'h6):(1'h0)];
      reg192 <= {((&(^wire73[(4'h8):(2'h3)])) ?
              {$unsigned($signed((8'ha0)))} : {reg152,
                  $signed((wire14 == (7'h42)))}),
          (&wire71)};
      reg193 <= ((($signed((wire100 ? reg153 : wire7)) ?
              $signed($signed(wire7)) : wire7[(5'h11):(3'h4)]) >= wire73[(5'h13):(5'h12)]) ?
          wire41[(1'h0):(1'h0)] : reg153[(5'h13):(4'hb)]);
    end
  assign wire194 = $signed($unsigned(wire186[(1'h1):(1'h1)]));
endmodule

module module155  (y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire160;
  input wire signed [(4'hf):(1'h0)] wire159;
  input wire signed [(5'h15):(1'h0)] wire158;
  input wire signed [(3'h6):(1'h0)] wire157;
  input wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire183;
  wire [(5'h15):(1'h0)] wire182;
  wire [(5'h12):(1'h0)] wire181;
  wire signed [(2'h2):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire175;
  wire signed [(4'he):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire171;
  wire signed [(2'h2):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  wire [(3'h6):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire166;
  wire [(3'h4):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  wire signed [(3'h7):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(2'h2):(1'h0)] reg177 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 reg185,
                 reg184,
                 reg179,
                 reg178,
                 reg177,
                 (1'h0)};
  assign wire161 = ($unsigned(wire159) != $unsigned(($unsigned({wire160}) ?
                       $unsigned($unsigned(wire158)) : ((wire159 >>> wire158) ?
                           $signed(wire158) : wire159[(3'h6):(2'h3)]))));
  assign wire162 = (((wire160 > (~&wire161[(5'h10):(4'hf)])) ?
                           (8'ha4) : (8'hb9)) ?
                       $signed((~|wire158)) : wire160[(4'ha):(4'h8)]);
  assign wire163 = (wire156[(3'h7):(3'h5)] ?
                       wire161[(2'h2):(1'h1)] : $signed(wire157));
  assign wire164 = wire159;
  assign wire165 = ($signed((((-(8'h9f)) ? wire158[(1'h0):(1'h0)] : {wire163}) ?
                           wire157 : wire164[(3'h6):(1'h1)])) ?
                       (($signed($signed(wire157)) ?
                               wire162[(2'h3):(1'h1)] : $signed(wire160[(4'h8):(1'h1)])) ?
                           $signed(((~|wire161) ?
                               ((7'h44) || wire161) : ((8'ha8) == wire162))) : wire158[(4'hd):(4'hc)]) : wire158[(3'h6):(1'h1)]);
  assign wire166 = wire157[(2'h2):(1'h0)];
  assign wire167 = wire158[(4'hb):(3'h7)];
  assign wire168 = wire159;
  assign wire169 = (~|wire163);
  assign wire170 = (8'hb1);
  assign wire171 = wire169;
  assign wire172 = (~&($signed((+(wire160 ?
                       wire163 : wire168))) <= $unsigned(wire163)));
  assign wire173 = wire165[(1'h0):(1'h0)];
  assign wire174 = (8'hab);
  assign wire175 = $unsigned($signed(((+(wire166 >= wire156)) ~^ wire160[(4'h8):(3'h7)])));
  assign wire176 = {((+{wire156[(4'ha):(3'h6)], {wire163, wire161}}) ?
                           (~&$signed($unsigned(wire162))) : $signed(wire170)),
                       $signed(wire174)};
  always
    @(posedge clk) begin
      reg177 <= $unsigned($signed($unsigned({$unsigned((8'ha7)),
          (wire170 >>> wire172)})));
      reg178 <= $signed((wire173 ~^ (($signed(wire175) ?
              $unsigned(wire159) : (wire159 ? wire163 : reg177)) ?
          (wire171 ? (8'hbc) : $unsigned((7'h44))) : wire176)));
      reg179 <= $signed(wire169[(4'hd):(3'h6)]);
    end
  assign wire180 = (wire176 - ((|wire174) ?
                       (-((reg179 ? reg179 : wire156) ?
                           ((8'hb9) ?
                               wire163 : wire162) : ((8'hab) ^~ reg177))) : {wire169[(4'h9):(3'h5)]}));
  assign wire181 = (~|$signed(reg178[(1'h1):(1'h1)]));
  assign wire182 = ((!(~^{(!(8'ha5)),
                       wire180[(1'h0):(1'h0)]})) ^ (~&$unsigned(((wire161 ?
                       wire167 : wire160) ^ (wire163 ? wire163 : wire162)))));
  assign wire183 = (|(~&{$unsigned((^~wire182))}));
  always
    @(posedge clk) begin
      reg184 <= (~&wire172[(3'h4):(2'h2)]);
      reg185 <= $signed(wire166);
    end
endmodule

module module104
#(parameter param146 = ((^~(&((8'had) ~^ (!(8'ha4))))) << ((~&(^((8'h9d) ? (8'hbc) : (8'hb8)))) ? ((((8'ha9) ? (8'hb0) : (8'ha6)) ? ((8'hbb) ? (8'h9d) : (8'ha2)) : ((8'hb5) <= (8'hab))) ~^ (~{(8'hab)})) : (!(((8'hb0) & (8'hb1)) >= {(8'h9e)})))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire109;
  input wire [(4'he):(1'h0)] wire108;
  input wire [(5'h15):(1'h0)] wire107;
  input wire [(3'h6):(1'h0)] wire106;
  input wire [(4'ha):(1'h0)] wire105;
  wire [(4'he):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire [(5'h15):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(2'h3):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire [(3'h5):(1'h0)] wire131;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(3'h4):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire [(5'h14):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(5'h13):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 (1'h0)};
  assign wire110 = $signed(wire108);
  assign wire111 = $signed(wire107[(3'h6):(3'h6)]);
  assign wire112 = $unsigned($signed((+$signed($signed(wire111)))));
  assign wire113 = $signed((((~|wire112[(4'hc):(4'h8)]) ?
                       $unsigned((&wire111)) : ({wire112} + wire111[(2'h3):(2'h2)])) >= ($signed($signed((7'h43))) ?
                       wire109[(2'h3):(2'h2)] : $unsigned(wire110[(1'h0):(1'h0)]))));
  assign wire114 = {{wire108[(3'h6):(2'h3)],
                           $unsigned(wire107[(1'h1):(1'h1)])}};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((wire112 ?
          (-(wire113 * wire113)) : ((~wire106) ?
              wire111[(2'h3):(2'h2)] : wire109)))))
        begin
          reg115 <= ((~^((~$unsigned(wire110)) & $unsigned(wire105[(4'h8):(1'h0)]))) ?
              (+$signed(((wire111 ? wire109 : wire111) ?
                  $signed(wire106) : (!wire107)))) : (~&(((wire107 ?
                          (8'hb7) : wire108) ?
                      $signed(wire106) : wire114[(4'h8):(1'h1)]) ?
                  $unsigned(wire105) : ($signed(wire107) - $signed(wire114)))));
          reg116 <= ($signed(wire110) <<< ({wire105,
              (|(~wire110))} == (|wire108)));
          if (((8'hb7) & {($unsigned((!wire112)) ?
                  $unsigned((~^reg116)) : {wire106[(3'h5):(3'h5)]}),
              {((7'h42) ~^ {wire108})}}))
            begin
              reg117 <= wire105[(4'h8):(3'h4)];
              reg118 <= wire114;
              reg119 <= ($signed(reg118[(1'h0):(1'h0)]) * (wire106 + wire105));
            end
          else
            begin
              reg117 <= $unsigned((-(+wire108)));
            end
        end
      else
        begin
          reg115 <= ($signed(wire111) >>> ((8'ha5) ?
              wire113 : $unsigned($signed((wire106 ? wire110 : (8'ha1))))));
        end
      reg120 <= ($unsigned(reg118[(3'h5):(2'h3)]) ?
          wire107 : {$signed(reg118[(4'hb):(4'hb)])});
      if ((~|$signed((^~$unsigned(wire108)))))
        begin
          reg121 <= wire108;
          reg122 <= ($unsigned(((wire109[(4'hd):(4'h8)] ?
              (wire113 ?
                  reg118 : wire112) : wire105[(3'h5):(2'h3)]) | ((8'ha3) ?
              (~reg121) : (reg117 < wire111)))) > $signed($unsigned(reg118)));
          if ($unsigned($signed($unsigned(wire112[(4'hb):(2'h2)]))))
            begin
              reg123 <= {$unsigned(reg117[(2'h3):(2'h3)]),
                  ({wire106} * wire106[(3'h4):(2'h2)])};
              reg124 <= $unsigned($signed(((+(wire108 | reg118)) ~^ (+wire113))));
              reg125 <= ((wire111 && $signed($unsigned((wire108 <= (8'hb6))))) == $signed((~|{wire114[(4'h8):(3'h5)]})));
              reg126 <= wire110;
              reg127 <= {$signed(($signed(reg118) ?
                      $signed($unsigned(wire107)) : $signed($unsigned(reg117))))};
            end
          else
            begin
              reg123 <= (^~wire114[(1'h0):(1'h0)]);
              reg124 <= ($signed(($unsigned($signed(reg124)) ?
                      ((-reg119) << ((8'ha6) ~^ reg122)) : $unsigned($signed(reg117)))) ?
                  (reg119 ?
                      $signed((~|reg117)) : ($unsigned($unsigned(wire105)) & (reg115 >>> (wire110 >>> wire111)))) : reg116[(4'he):(4'hb)]);
              reg125 <= reg117[(3'h6):(3'h4)];
            end
        end
      else
        begin
          reg121 <= reg117;
          reg122 <= {reg120,
              ((wire114 ? reg127 : (+(~^wire107))) && ($signed((&reg119)) ?
                  (~(reg121 * wire106)) : ((-wire110) ^~ (reg127 ?
                      wire110 : (8'h9f)))))};
          reg123 <= reg116;
        end
    end
  assign wire128 = (|($signed(reg119[(3'h6):(3'h6)]) ?
                       reg125[(3'h7):(2'h3)] : reg118));
  assign wire129 = reg126;
  assign wire130 = (|$signed($signed($signed((8'hb1)))));
  assign wire131 = $signed((reg117 ^ wire111));
  assign wire132 = (reg125[(3'h5):(2'h3)] ?
                       ({(&(-wire105)), (~(+reg124))} ?
                           {(reg118 ?
                                   $unsigned(reg116) : reg117[(3'h4):(3'h4)])} : reg116[(4'hb):(4'h9)]) : (|wire105[(4'ha):(1'h1)]));
  assign wire133 = (8'haa);
  assign wire134 = (wire128[(5'h15):(3'h4)] ?
                       ($unsigned(reg121[(2'h2):(1'h1)]) | wire107) : $signed((reg117 > ((reg123 ?
                           wire111 : wire130) - {wire109, (8'ha7)}))));
  always
    @(posedge clk) begin
      reg135 <= ((~^((~|((8'h9e) ?
          wire132 : wire105)) != (-$unsigned(reg126)))) && (($unsigned(wire130) ?
              $unsigned((reg120 ? wire114 : (8'hab))) : (^(7'h42))) ?
          ($signed((~|wire128)) ?
              (^wire113[(1'h0):(1'h0)]) : $unsigned($signed(wire106))) : $signed((wire130 ?
              (&reg117) : wire133))));
      if ({($unsigned({$unsigned(wire105)}) || $unsigned($unsigned(wire107[(3'h7):(3'h5)])))})
        begin
          if (($signed(($signed($unsigned((8'ha9))) && ({wire134, wire112} ?
                  (wire128 ? wire132 : reg117) : reg126[(3'h6):(2'h2)]))) ?
              (^~$unsigned(($signed(wire108) ?
                  $signed(reg126) : (|reg120)))) : {(~&(8'hb0))}))
            begin
              reg136 <= ($unsigned(wire114) >>> {(+(reg116[(3'h5):(1'h0)] > (wire110 ?
                      wire113 : wire108)))});
            end
          else
            begin
              reg136 <= (^wire111);
              reg137 <= reg127;
            end
          reg138 <= reg127[(4'hc):(1'h0)];
          reg139 <= (7'h43);
          if ((^~reg125))
            begin
              reg140 <= (8'ha5);
              reg141 <= {(wire106[(3'h5):(1'h0)] <= $unsigned(((reg117 ?
                      reg122 : reg127) >= $signed(wire107))))};
            end
          else
            begin
              reg140 <= $signed(wire134);
              reg141 <= wire113;
            end
          reg142 <= (~^$unsigned((^(&(reg124 ? (8'ha1) : wire132)))));
        end
      else
        begin
          reg136 <= (~$signed(wire134[(1'h0):(1'h0)]));
          reg137 <= ($unsigned(reg139[(1'h0):(1'h0)]) ?
              (({wire105, (reg135 ? wire134 : reg140)} ?
                  reg137 : ((reg125 ^~ (8'haa)) < (+reg119))) == wire109[(3'h6):(1'h0)]) : (|$unsigned({(^wire134),
                  $unsigned(reg137)})));
          reg138 <= (((~^$signed((reg116 ?
              wire107 : wire110))) < $signed(reg120[(2'h3):(2'h2)])) || (|(^{$signed(wire107),
              (wire132 ~^ reg118)})));
          reg139 <= $signed((($signed(wire130[(2'h2):(1'h1)]) ~^ $signed(wire105)) ?
              wire133 : $unsigned((|wire114[(4'ha):(1'h1)]))));
        end
    end
  assign wire143 = ($unsigned(reg115[(3'h7):(1'h0)]) ?
                       $unsigned((($signed(reg138) && {wire107}) ^~ ((reg138 + (8'hac)) == reg123[(3'h4):(2'h3)]))) : $unsigned((((reg138 ?
                               wire105 : (8'had)) ?
                           (reg142 ?
                               wire129 : (8'hbf)) : (reg123 ^~ reg139)) >>> $unsigned($signed(reg126)))));
  assign wire144 = {($unsigned($signed(wire108[(2'h2):(2'h2)])) ?
                           (((wire105 >>> wire132) || $unsigned(reg118)) << ((reg122 ?
                                   wire114 : (8'h9e)) ?
                               (reg115 <<< reg127) : reg116[(3'h4):(2'h3)])) : ((-{wire134,
                                   reg118}) ?
                               (~^{reg120, wire114}) : ((wire130 ?
                                       (8'haa) : wire131) ?
                                   ((7'h40) + reg137) : $unsigned(reg119)))),
                       (^(~^((reg135 >>> wire130) >>> $unsigned(wire128))))};
  assign wire145 = {reg125[(3'h5):(2'h2)],
                       $signed({((wire131 <= (8'hbb)) | (wire114 ?
                               wire111 : wire106))})};
endmodule

module module74
#(parameter param98 = (((^~(((8'hb6) ? (8'had) : (8'h9e)) ? ((8'hba) - (8'hb4)) : ((8'hab) >> (8'hbf)))) ^~ ({{(8'ha8)}, ((8'ha1) ? (8'hbb) : (8'hb9))} ? ((~^(8'hab)) >= (8'ha7)) : {((8'ha0) ^ (8'ha5)), {(8'h9c), (8'ha6)}})) ^ {((-((8'hb6) ? (8'ha6) : (8'hbe))) ? (~|((8'ha2) <= (8'haa))) : ((-(8'hbc)) ? ((8'ha3) <<< (7'h42)) : (!(7'h44)))), ((8'ha1) | {(~&(8'hb2))})}), 
parameter param99 = ((8'ha7) ? (param98 ? ((^~param98) ^~ ((~|param98) ? param98 : (param98 && param98))) : {param98}) : (~param98)))
(y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire79;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  input wire signed [(5'h11):(1'h0)] wire76;
  input wire signed [(4'he):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'hf):(1'h0)] wire90;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire80 = {$unsigned(({(wire79 ? wire76 : wire77)} ~^ wire79)),
                      $signed($signed(wire75))};
  assign wire81 = (!(($unsigned(wire78[(2'h2):(2'h2)]) ?
                      (+$unsigned(wire76)) : (~|wire77)) <= $unsigned($unsigned((wire80 ^~ wire76)))));
  assign wire82 = (&((($unsigned(wire78) == {wire79}) < $unsigned((!wire75))) ?
                      $unsigned(((&wire81) * (&wire80))) : $signed($signed($signed(wire80)))));
  assign wire83 = ((^~$unsigned(($unsigned(wire81) != $signed(wire79)))) | (~^$unsigned($unsigned($unsigned(wire79)))));
  always
    @(posedge clk) begin
      reg84 <= (&$signed({(~|wire80)}));
      reg85 <= (~&(({(~|wire76)} + ((reg84 ^ wire75) ?
          (wire78 >= wire80) : (wire76 ?
              wire80 : wire78))) && $signed($unsigned(wire78[(2'h3):(2'h2)]))));
      reg86 <= ($signed((!((^~wire75) * (wire80 ? wire75 : wire83)))) ?
          $signed((+$unsigned((wire75 ?
              (8'ha6) : reg85)))) : (~&(~^($unsigned(wire81) ?
              {wire83, wire76} : reg84[(1'h0):(1'h0)]))));
      reg87 <= (wire82 <= reg86);
      reg88 <= reg87;
    end
  assign wire89 = (((-(^(reg88 >>> (8'hb9)))) ^~ $unsigned(((reg85 ?
                          wire79 : reg84) ?
                      (|reg84) : reg84[(3'h6):(1'h0)]))) << $signed((~^$unsigned(wire82[(4'h8):(1'h0)]))));
  assign wire90 = wire83[(2'h2):(2'h2)];
  assign wire91 = (8'had);
  assign wire92 = reg87;
  assign wire93 = (~|({wire82} ? {(+(wire77 ? (8'ha6) : wire82))} : wire79));
  assign wire94 = {wire83};
  assign wire95 = $signed($signed(((wire80[(4'h9):(2'h2)] || (wire76 + wire93)) ?
                      reg88[(1'h0):(1'h0)] : ({wire81, wire93} >>> (wire92 ?
                          wire78 : wire92)))));
  assign wire96 = $signed($unsigned(((~$signed((8'hb9))) ? wire95 : wire92)));
  assign wire97 = {((8'hbc) << (+wire76[(4'h9):(1'h1)])),
                      $unsigned($unsigned(wire94))};
endmodule

module module43
#(parameter param69 = (&(~&((|((7'h43) ? (8'hb0) : (8'ha6))) ? {(8'ha2), ((8'ha5) + (8'ha6))} : (((8'hb9) ? (8'h9f) : (8'hbf)) ? ((8'hb3) ? (8'h9f) : (8'hb6)) : ((8'hb1) > (8'ha6)))))), 
parameter param70 = ((+(^~param69)) == (|param69)))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire signed [(4'he):(1'h0)] wire45;
  input wire [(3'h6):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(4'hb):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  assign y = {wire68,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire48 = $unsigned(wire44[(1'h1):(1'h0)]);
  assign wire49 = $signed(wire46[(4'h9):(1'h0)]);
  assign wire50 = $unsigned({{wire47},
                      ((^~$unsigned(wire44)) ?
                          $signed((wire44 > wire47)) : {wire49[(3'h4):(3'h4)],
                              $unsigned(wire44)})});
  assign wire51 = (8'hb6);
  assign wire52 = ($unsigned(((wire51 <<< $signed(wire45)) ~^ wire45[(4'h8):(3'h7)])) ?
                      (~^($signed((wire50 ?
                          wire45 : wire44)) + wire48[(4'hf):(2'h3)])) : wire47);
  assign wire53 = wire44;
  assign wire54 = $unsigned({(wire47[(2'h3):(1'h0)] ?
                          (wire50[(1'h0):(1'h0)] & wire53) : $signed((wire45 != wire51)))});
  assign wire55 = (^~$unsigned((&(wire44[(2'h3):(1'h0)] | (wire54 ?
                      wire48 : wire47)))));
  assign wire56 = (~$signed($signed($signed((~wire52)))));
  assign wire57 = $unsigned(wire54);
  assign wire58 = (wire44[(1'h0):(1'h0)] >> ($unsigned(wire52) | ($unsigned({wire50,
                          wire44}) ?
                      $signed($signed(wire54)) : $signed(wire48[(4'h9):(3'h4)]))));
  assign wire59 = wire48;
  assign wire60 = $unsigned((^~wire56[(4'he):(4'he)]));
  assign wire61 = {{($unsigned(wire56[(3'h6):(3'h4)]) - (~$unsigned(wire50))),
                          (!((wire52 >>> (8'ha6)) >> wire56))}};
  assign wire62 = (7'h40);
  always
    @(posedge clk) begin
      reg63 <= (+(wire45 <= ($unsigned($unsigned((8'ha0))) & (wire60 ?
          $signed(wire46) : (wire62 == wire47)))));
      reg64 <= ({$unsigned(wire62), $signed(wire53[(3'h6):(2'h3)])} > wire53);
      reg65 <= (^$signed(wire55));
      reg66 <= (($signed((wire49[(3'h5):(1'h1)] || (wire52 ?
              (8'ha4) : (8'had)))) ?
          ({{reg65}} ?
              (wire49 ?
                  (^~wire48) : (wire48 ?
                      wire61 : (8'hbc))) : wire62[(1'h1):(1'h1)]) : {$unsigned($unsigned(wire47)),
              $signed(wire56)}) < $unsigned($unsigned($unsigned((wire50 >>> wire47)))));
      reg67 <= (~^$unsigned(wire51[(1'h0):(1'h0)]));
    end
  assign wire68 = ((^(+wire56[(4'ha):(4'h9)])) >> $signed($signed($signed(wire59))));
endmodule

module module15
#(parameter param40 = (((({(8'ha4)} >= ((7'h41) ^~ (8'ha3))) >= (((8'hb9) ^ (8'haf)) ? ((7'h41) != (8'hbe)) : ((8'ha8) ? (8'hac) : (8'hae)))) ~^ {({(8'ha8)} ? {(7'h41)} : ((8'hbf) ? (8'ha7) : (7'h40))), ({(8'ha0)} & (~|(8'hbd)))}) <= (~|((((7'h43) ? (8'ha6) : (8'hbe)) && {(8'hae)}) ? {((8'ha2) ~^ (7'h42))} : {((8'haa) ? (8'ha1) : (8'h9d)), (~^(8'hb0))}))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= (wire17 ?
          $unsigned(((!wire19) ?
              {((8'hb1) ? wire19 : wire16),
                  (~&wire20)} : wire18[(1'h0):(1'h0)])) : wire17);
      reg22 <= reg21;
      reg23 <= wire17;
      if (wire16[(4'h9):(3'h7)])
        begin
          reg24 <= wire18[(1'h0):(1'h0)];
          reg25 <= ((!((8'hb2) ~^ {wire16})) ?
              ($unsigned((7'h42)) ?
                  (reg21 >>> ((wire17 > reg21) <<< reg23)) : reg22) : wire17[(3'h6):(1'h1)]);
          if ((8'h9d))
            begin
              reg26 <= $unsigned($unsigned(((~&reg24) && wire19[(4'hb):(4'ha)])));
              reg27 <= $unsigned(((($unsigned(reg24) ?
                          reg23 : $unsigned(reg23)) ?
                      reg24[(2'h3):(1'h0)] : (|(reg24 ? wire19 : reg24))) ?
                  ((!wire20[(1'h1):(1'h0)]) || {reg23}) : $signed((~&{(8'hae)}))));
            end
          else
            begin
              reg26 <= {$unsigned($signed(($signed(wire19) | reg23[(2'h2):(1'h0)]))),
                  ((~{wire20[(5'h11):(4'hc)]}) ?
                      $signed((^~reg24[(4'h9):(3'h6)])) : (wire20 ?
                          ((|(8'hbc)) * $unsigned(reg22)) : (~reg25)))};
              reg27 <= ($signed($signed({reg21[(1'h1):(1'h0)]})) ?
                  reg26[(1'h1):(1'h1)] : reg26[(2'h3):(1'h0)]);
              reg28 <= ($unsigned($unsigned((wire16[(4'hd):(4'hb)] ^ (reg24 && reg22)))) ?
                  $unsigned((^~$signed((wire17 && reg27)))) : ($unsigned(($unsigned(wire16) ?
                      ((8'hbe) ?
                          reg27 : wire17) : {reg22})) <<< ($unsigned({reg26}) ?
                      ((~&reg25) >> $unsigned((8'hb4))) : ($unsigned(wire17) << reg22))));
            end
        end
      else
        begin
          reg24 <= reg27;
          reg25 <= (|$signed((^~$signed({wire20, reg24}))));
          reg26 <= $unsigned((+$signed((8'hab))));
          reg27 <= (wire18 >> (^~($unsigned($signed(wire18)) ^ $signed((wire16 ?
              reg26 : reg26)))));
        end
    end
  assign wire29 = reg22[(4'h9):(2'h2)];
  assign wire30 = reg22;
  assign wire31 = (~((^~($unsigned(reg21) || (reg25 ?
                      wire19 : wire19))) - (~|wire30[(4'h8):(1'h1)])));
  assign wire32 = $signed((~&(wire16[(1'h0):(1'h0)] + {(~|reg24),
                      (wire17 == reg25)})));
  assign wire33 = $signed(wire19[(3'h4):(3'h4)]);
  assign wire34 = {wire33, wire16[(4'ha):(3'h4)]};
  assign wire35 = ({((~^(reg24 + (8'hbe))) ? wire18 : (~|{wire18, reg21})),
                      ((reg21 & $signed(reg23)) < (wire31 ?
                          $signed(wire19) : $unsigned(wire19)))} ~^ (~|wire19[(4'hd):(1'h0)]));
  assign wire36 = reg21;
  assign wire37 = (&(^$unsigned($unsigned($unsigned(wire18)))));
  assign wire38 = $signed($unsigned(((&wire35[(1'h1):(1'h1)]) ?
                      (wire33[(1'h1):(1'h1)] > (reg23 ^~ wire29)) : wire19[(4'hf):(2'h3)])));
  assign wire39 = wire16;
endmodule
