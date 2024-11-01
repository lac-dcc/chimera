module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire240;
  wire signed [(2'h2):(1'h0)] wire239;
  wire signed [(2'h2):(1'h0)] wire238;
  wire [(4'hf):(1'h0)] wire237;
  wire signed [(4'hb):(1'h0)] wire236;
  wire [(4'h8):(1'h0)] wire235;
  wire signed [(4'hf):(1'h0)] wire234;
  wire signed [(5'h15):(1'h0)] wire233;
  wire signed [(5'h15):(1'h0)] wire227;
  wire [(4'hb):(1'h0)] wire226;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire116;
  wire [(5'h15):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(4'hb):(1'h0)] wire224;
  wire signed [(4'hc):(1'h0)] wire229;
  wire signed [(5'h14):(1'h0)] wire230;
  wire [(4'hc):(1'h0)] wire231;
  assign y = {wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire227,
                 wire226,
                 wire5,
                 wire6,
                 wire116,
                 wire118,
                 wire119,
                 wire120,
                 wire224,
                 wire229,
                 wire230,
                 wire231,
                 (1'h0)};
  assign wire5 = $signed(($unsigned((8'h9e)) >>> (wire0 | wire1[(2'h2):(1'h1)])));
  assign wire6 = (~|($unsigned((8'hbf)) >> $signed($signed({wire2, (7'h43)}))));
  module7 #() modinst117 (wire116, clk, wire5, wire3, wire0, wire1);
  assign wire118 = wire3[(2'h2):(1'h1)];
  assign wire119 = wire118[(1'h1):(1'h0)];
  assign wire120 = (wire119[(2'h3):(1'h0)] ~^ $signed(wire5[(3'h4):(2'h2)]));
  module121 #() modinst225 (.wire124(wire6), .wire122(wire116), .wire123(wire2), .y(wire224), .wire126(wire3), .wire125(wire119), .clk(clk));
  assign wire226 = wire0;
  module93 #() modinst228 (.wire94(wire4), .clk(clk), .wire98(wire2), .wire96(wire3), .wire95(wire1), .y(wire227), .wire97(wire224));
  assign wire229 = wire1[(4'hb):(2'h2)];
  assign wire230 = (^(~|(~&wire2[(3'h4):(1'h1)])));
  module121 #() modinst232 (wire231, clk, wire229, wire227, wire118, wire116, wire6);
  assign wire233 = $signed($signed((((~^wire224) ?
                           (8'haa) : (wire0 ? wire118 : (8'hb0))) ?
                       {(wire224 ? wire2 : wire4)} : wire227[(2'h2):(1'h1)])));
  assign wire234 = wire6;
  assign wire235 = (^~$signed((+(-wire226))));
  assign wire236 = ((wire1[(3'h6):(3'h4)] ?
                       wire229 : (~|$unsigned((wire1 - wire231)))) && $signed($signed($signed(wire224[(3'h4):(1'h0)]))));
  assign wire237 = (^~(((^$signed(wire226)) ~^ $unsigned(wire234)) ^ {wire230,
                       (wire2 - wire5)}));
  assign wire238 = $signed(wire6[(4'hb):(4'ha)]);
  assign wire239 = ((!$unsigned($unsigned((wire237 ?
                       wire231 : wire231)))) - (!wire120[(2'h2):(2'h2)]));
  assign wire240 = ({wire0, ((~$signed(wire119)) || wire229)} ?
                       wire237[(2'h2):(1'h1)] : ((wire119 >= (^{wire2})) ?
                           $signed(wire236[(3'h5):(3'h4)]) : wire236));
endmodule

module module121
#(parameter param222 = ((!(((^~(8'haa)) ? ((8'hbf) ? (8'hbe) : (8'hab)) : (~&(8'ha2))) <<< {((8'ha4) & (8'hac))})) ? ((~((&(8'hb9)) <= (~&(8'hbf)))) ^~ (8'hac)) : ((((!(8'ha3)) < ((7'h42) <<< (8'hb3))) ? (((8'hb1) ? (8'h9c) : (8'hac)) ? (^(8'hb2)) : ((7'h42) >> (8'hb0))) : (((7'h41) > (8'hac)) >> ((8'ha2) ? (8'hb8) : (8'had)))) ? (8'hac) : ((!((8'had) ? (8'ha1) : (8'hbf))) >= (|(~(8'ha1)))))), 
parameter param223 = param222)
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h289):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire126;
  input wire signed [(4'he):(1'h0)] wire125;
  input wire signed [(5'h15):(1'h0)] wire124;
  input wire signed [(5'h15):(1'h0)] wire123;
  input wire signed [(5'h14):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire221;
  wire [(4'he):(1'h0)] wire220;
  wire signed [(3'h4):(1'h0)] wire216;
  wire [(3'h6):(1'h0)] wire215;
  wire [(3'h7):(1'h0)] wire214;
  wire [(2'h2):(1'h0)] wire213;
  wire signed [(5'h10):(1'h0)] wire174;
  wire [(5'h14):(1'h0)] wire150;
  wire signed [(5'h15):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire129;
  wire [(3'h6):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(5'h12):(1'h0)] wire152;
  wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire155;
  wire [(4'hd):(1'h0)] wire172;
  reg signed [(5'h12):(1'h0)] reg219 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg218 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg217 = (1'h0);
  reg signed [(4'he):(1'h0)] reg212 = (1'h0);
  reg [(4'hb):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'h8):(1'h0)] reg209 = (1'h0);
  reg [(2'h2):(1'h0)] reg208 = (1'h0);
  reg [(5'h11):(1'h0)] reg207 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg206 = (1'h0);
  reg [(2'h3):(1'h0)] reg205 = (1'h0);
  reg [(4'ha):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg203 = (1'h0);
  reg [(5'h10):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg201 = (1'h0);
  reg [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg197 = (1'h0);
  reg [(2'h2):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg191 = (1'h0);
  reg [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(2'h3):(1'h0)] reg188 = (1'h0);
  reg signed [(4'he):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg186 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg [(2'h2):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  reg [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire174,
                 wire150,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire152,
                 wire153,
                 wire154,
                 wire155,
                 wire172,
                 reg219,
                 reg218,
                 reg217,
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
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg130,
                 (1'h0)};
  assign wire127 = $unsigned($signed($signed($signed(wire123))));
  assign wire128 = ({(wire123 != (wire123[(4'h9):(1'h0)] + $unsigned(wire123))),
                       $unsigned(wire126)} < $unsigned({(&wire124[(2'h3):(2'h2)]),
                       (^~(-wire123))}));
  assign wire129 = (($unsigned(({wire123} != (~&wire122))) ^ ((8'hae) | wire127)) ?
                       (8'ha4) : ($unsigned(((8'hbf) ?
                           $unsigned((7'h44)) : (8'ha2))) >> wire127));
  always
    @(posedge clk) begin
      reg130 <= $unsigned($unsigned($signed((~|(wire122 - wire124)))));
    end
  assign wire131 = $signed(wire124);
  assign wire132 = $unsigned($signed(wire123));
  assign wire133 = $signed($unsigned(($signed($unsigned(wire131)) ?
                       $unsigned(wire128[(2'h3):(1'h0)]) : ((wire125 ^~ wire122) ?
                           wire122 : $signed(reg130)))));
  module134 #() modinst151 (wire150, clk, wire124, wire125, wire126, wire122, wire131);
  assign wire152 = ($unsigned($signed(((wire126 || reg130) ?
                           (&reg130) : $signed(wire128)))) ?
                       $unsigned($signed($unsigned((wire128 ?
                           wire129 : wire125)))) : (~&wire132));
  assign wire153 = $signed((($unsigned(wire132) ?
                           $unsigned(wire133) : ((^wire125) ~^ $unsigned(wire122))) ?
                       $unsigned(($signed((8'had)) ?
                           (wire133 * (8'hb2)) : wire133[(5'h11):(2'h2)])) : (7'h43)));
  assign wire154 = {wire152};
  assign wire155 = wire125[(4'ha):(2'h3)];
  module156 #() modinst173 (wire172, clk, wire123, wire153, wire122, wire154, wire133);
  assign wire174 = {(wire132 ?
                           {wire127} : $signed((~^wire154[(4'he):(4'hc)])))};
  always
    @(posedge clk) begin
      reg175 <= wire122;
      if (wire150)
        begin
          reg176 <= (wire129[(3'h5):(1'h1)] ?
              $unsigned(((!reg130[(3'h6):(1'h0)]) << $unsigned(wire154[(5'h10):(1'h1)]))) : ({reg130[(1'h1):(1'h1)]} + $unsigned(((wire152 < wire126) ?
                  wire126[(1'h1):(1'h0)] : (~&wire133)))));
        end
      else
        begin
          reg176 <= (($signed(wire129) ^~ wire127) ?
              ((wire127[(4'hc):(2'h3)] ?
                  (wire125 != reg175[(1'h0):(1'h0)]) : (8'ha1)) < wire155) : wire152);
          if ($signed($signed((|$signed($signed(reg176))))))
            begin
              reg177 <= wire150[(4'hb):(3'h7)];
              reg178 <= reg130;
              reg179 <= ((~((((8'ha5) >> wire123) ?
                          reg177[(3'h6):(3'h6)] : $unsigned(reg177)) ?
                      reg176 : (wire122[(1'h1):(1'h0)] - $unsigned(wire172)))) ?
                  ({($signed(wire126) ?
                          ((8'hb2) ?
                              wire123 : reg178) : wire123[(4'hb):(3'h6)])} ^ ({$signed(wire127)} | ($signed(reg176) - reg177[(1'h0):(1'h0)]))) : wire132);
              reg180 <= wire129;
              reg181 <= wire132[(5'h15):(4'h9)];
            end
          else
            begin
              reg177 <= ((+($unsigned($unsigned(wire127)) <<< ((wire122 ?
                  (8'hb3) : wire122) - wire153))) * $unsigned(($unsigned($unsigned(reg130)) < (&(wire126 ?
                  reg179 : wire123)))));
              reg178 <= $unsigned(reg178[(2'h3):(2'h3)]);
              reg179 <= wire125;
            end
          if (reg181)
            begin
              reg182 <= ((~|$signed((~&reg180))) ?
                  wire150[(5'h10):(4'he)] : $unsigned((($signed(reg178) ?
                      (reg178 ?
                          wire152 : wire126) : $signed(wire132)) ^ wire129[(1'h0):(1'h0)])));
              reg183 <= {({((wire153 * reg180) ?
                              {wire150} : $signed((8'hbe)))} ?
                      reg179 : (^~(~^{reg130}))),
                  (((+$signed(reg175)) < wire132) ?
                      wire154 : $unsigned({reg130[(4'h9):(1'h0)]}))};
              reg184 <= (^$unsigned({$signed($unsigned(reg182))}));
              reg185 <= $signed($signed(wire152[(2'h3):(1'h0)]));
              reg186 <= $signed($signed(((^~wire172[(4'ha):(4'ha)]) ?
                  {$unsigned(reg179), (reg178 ? wire127 : reg185)} : {{reg179,
                          wire152}})));
            end
          else
            begin
              reg182 <= wire126;
              reg183 <= reg183;
            end
          reg187 <= (~$unsigned((wire123[(4'h8):(4'h8)] <= $unsigned($unsigned(reg181)))));
          if ($signed(reg184[(2'h3):(1'h1)]))
            begin
              reg188 <= wire125[(3'h4):(2'h3)];
              reg189 <= (~|(&(8'hb8)));
              reg190 <= reg184;
            end
          else
            begin
              reg188 <= (reg176[(3'h7):(2'h3)] > wire153);
              reg189 <= $unsigned((^~((|$unsigned(reg183)) ?
                  ((wire154 ~^ wire174) ~^ wire152[(5'h10):(3'h5)]) : (wire126[(1'h0):(1'h0)] ?
                      $unsigned(wire152) : (wire152 <<< reg175)))));
              reg190 <= (^$signed(reg184));
              reg191 <= ((~&$unsigned({reg188[(1'h1):(1'h1)]})) == $signed($signed(($unsigned(wire174) > (wire153 ?
                  wire174 : reg181)))));
              reg192 <= wire172[(3'h6):(1'h0)];
            end
        end
      if ({{(~^$unsigned((!wire122)))}})
        begin
          if ($unsigned($unsigned(reg190[(2'h3):(2'h2)])))
            begin
              reg193 <= (((((reg186 - wire123) ^~ $unsigned(reg176)) ?
                      ((|reg185) ?
                          (reg191 ?
                              (8'hba) : wire127) : $signed(wire124)) : (wire172[(2'h2):(1'h1)] ~^ wire128[(1'h0):(1'h0)])) ?
                  $unsigned(wire152[(4'h8):(3'h5)]) : {(reg178[(1'h1):(1'h1)] ?
                          (|(8'hb4)) : (wire132 ?
                              reg179 : wire124))}) <= ($unsigned($unsigned(reg180)) == wire122[(4'hb):(3'h6)]));
              reg194 <= (((({wire174, reg177} ?
                          reg177 : $signed(wire122)) ^~ reg185[(1'h1):(1'h0)]) ?
                      wire124 : $signed((-(wire153 ? wire123 : (8'haf))))) ?
                  ($unsigned(wire154) * $signed(((wire155 ?
                      reg130 : reg193) ^~ (reg130 ?
                      wire122 : (8'hbc))))) : reg193);
              reg195 <= reg183;
              reg196 <= {$unsigned($signed($unsigned((wire172 ?
                      reg182 : reg186))))};
              reg197 <= wire174[(5'h10):(1'h1)];
            end
          else
            begin
              reg193 <= reg183;
            end
          reg198 <= $signed((+wire126));
          reg199 <= $signed(reg192[(3'h4):(1'h1)]);
          if (reg196)
            begin
              reg200 <= reg177;
            end
          else
            begin
              reg200 <= wire152[(3'h5):(1'h0)];
              reg201 <= ($unsigned((reg188[(2'h2):(1'h0)] ?
                  $unsigned((!wire153)) : $signed(wire125))) > reg179[(1'h0):(1'h0)]);
              reg202 <= $unsigned(($unsigned(($unsigned(wire150) | ((8'haa) ?
                  reg192 : reg200))) * reg197[(4'h8):(3'h4)]));
              reg203 <= ($unsigned($signed({wire152[(3'h7):(3'h7)]})) ?
                  ((reg187[(4'he):(1'h1)] != $signed((reg195 ?
                          wire154 : reg179))) ?
                      (8'ha9) : wire124[(4'he):(4'hb)]) : $signed((($unsigned(reg200) - (wire129 ?
                          (8'ha4) : wire174)) ?
                      (7'h40) : wire172)));
              reg204 <= $unsigned((((!(reg185 >>> reg189)) << ((wire125 ?
                  wire124 : reg197) + wire124[(4'ha):(4'h8)])) - $signed($unsigned((|reg187)))));
            end
          reg205 <= reg193[(1'h1):(1'h0)];
        end
      else
        begin
          reg193 <= (!$signed((((wire125 ? reg184 : reg202) ?
              $signed(reg198) : wire124) ^~ $signed($signed((8'hbf))))));
          reg194 <= (((|($unsigned(reg180) ?
              reg178[(3'h7):(3'h7)] : reg197)) ~^ {((~^reg180) ?
                  wire155 : (reg181 ? (8'ha8) : reg195))}) ~^ reg196);
          reg195 <= $signed($signed(({$unsigned((8'hb6)),
              (wire150 ? reg130 : (8'h9c))} || (8'ha7))));
          if (reg185[(2'h2):(1'h1)])
            begin
              reg196 <= ($unsigned(reg175) >= $unsigned(($unsigned(reg197) ?
                  $unsigned((reg187 ?
                      (8'hb6) : (8'ha2))) : (~$signed(wire126)))));
              reg197 <= $signed(wire127[(3'h6):(2'h2)]);
              reg198 <= {(8'hb9)};
            end
          else
            begin
              reg196 <= ((|($signed((wire124 ?
                      reg187 : (8'haf))) >>> ($signed(reg182) ?
                      $unsigned(reg193) : (reg201 & wire132)))) ?
                  ((($unsigned(reg130) == {reg197, wire172}) ?
                      ($signed(reg177) && $unsigned(reg201)) : (wire127 < {reg130})) != (+$signed(((8'ha1) ?
                      reg176 : (8'ha5))))) : {(reg179[(1'h0):(1'h0)] == reg191),
                      reg201});
            end
          reg199 <= {(($unsigned((~&wire125)) > ($unsigned(wire123) > (~|wire128))) ?
                  (($signed(reg189) ? reg203[(4'hc):(4'hc)] : (^~reg192)) ?
                      (reg191 ?
                          (wire155 ?
                              wire150 : reg177) : reg196) : wire150) : ({(wire124 ^ reg190),
                      (reg191 | reg176)} * (reg176[(3'h6):(3'h4)] ?
                      (wire122 | reg182) : (reg192 || reg201))))};
        end
      if ({(reg205 ?
              $unsigned((~&(reg202 ? reg195 : reg184))) : (($signed(reg197) ?
                      $signed(reg203) : (reg205 >>> (8'haa))) ?
                  $unsigned((&reg178)) : (reg204 == reg203[(4'hb):(3'h5)]))),
          ((!($unsigned(reg201) ?
              $signed((8'hb2)) : reg193[(3'h4):(1'h1)])) + reg184[(2'h2):(2'h2)])})
        begin
          reg206 <= reg200[(4'hb):(1'h1)];
          reg207 <= (|reg192);
          reg208 <= {($unsigned((reg177[(1'h1):(1'h1)] ?
                      (^reg201) : $signed(wire154))) ?
                  reg202 : {wire133[(2'h2):(2'h2)]}),
              $signed(({{wire150, wire123}} ?
                  ($unsigned(reg181) ?
                      (|wire155) : (wire174 ?
                          (8'hb5) : reg204)) : reg188[(1'h1):(1'h0)]))};
        end
      else
        begin
          if ((8'ha5))
            begin
              reg206 <= $signed((((-$signed(reg177)) > reg193) << reg177));
              reg207 <= reg175[(1'h1):(1'h1)];
              reg208 <= $unsigned($signed((|(&wire150))));
              reg209 <= ($unsigned((&$signed($unsigned(reg194)))) <<< (!reg130[(2'h2):(2'h2)]));
            end
          else
            begin
              reg206 <= wire150;
              reg207 <= (reg207[(3'h7):(3'h7)] + (~^((!(wire133 ?
                  reg209 : reg195)) | wire129[(4'h8):(3'h4)])));
              reg208 <= {wire129,
                  ((-($unsigned((8'hbf)) <<< reg184[(2'h2):(1'h1)])) > reg185)};
            end
          reg210 <= ($unsigned(reg193[(3'h4):(2'h3)]) ?
              reg198[(2'h3):(2'h2)] : ($unsigned($signed($unsigned(reg190))) ^~ {((reg191 ^~ reg184) ?
                      (~&reg181) : (reg206 ? reg188 : reg185)),
                  $signed($signed(wire172))}));
          reg211 <= (^~$unsigned(reg202));
        end
      reg212 <= $unsigned(reg175);
    end
  assign wire213 = $signed({reg200});
  assign wire214 = reg208;
  assign wire215 = wire132;
  assign wire216 = ((+$unsigned(reg208[(1'h0):(1'h0)])) >= ($unsigned((8'haa)) ~^ ($signed((wire152 ?
                       reg187 : (8'ha8))) == $signed($unsigned(wire129)))));
  always
    @(posedge clk) begin
      reg217 <= (~|reg190);
      reg218 <= wire155;
      reg219 <= ($signed(reg180[(4'hb):(4'ha)]) != ($signed((+reg217)) ?
          $unsigned($signed($unsigned((8'hbc)))) : (((wire132 >> wire128) + (|reg217)) ?
              reg184 : wire152)));
    end
  assign wire220 = (|(reg207 & $unsigned((^~reg196))));
  assign wire221 = $signed($unsigned((wire214 >= ((|wire154) * $signed(reg191)))));
endmodule

module module7
#(parameter param115 = (((((8'had) >= ((8'haf) ? (8'hba) : (8'hbd))) ? (((8'ha8) == (8'hb5)) ^~ ((8'hae) ? (8'hbc) : (8'h9e))) : ((&(8'hb9)) ? (^(8'hae)) : ((7'h40) ? (8'hae) : (8'hbc)))) ? ({((8'hbd) == (8'had)), {(8'hb8), (8'ha0)}} ? (((8'hbb) ? (8'hbe) : (8'hbf)) ? (!(8'hb7)) : (!(8'ha9))) : (((7'h40) > (8'hb6)) >> {(8'h9e), (8'h9e)})) : ((((8'hb9) ? (8'hb2) : (8'hb2)) ? ((8'had) * (8'hb6)) : ((8'ha4) <= (8'hb2))) > (!((8'hb9) ? (8'haa) : (8'ha8))))) ^~ (~^{({(8'hb0), (8'h9f)} & (^(7'h41))), (((8'hb0) ? (7'h43) : (8'haf)) <= ((8'ha6) - (8'ha1)))})))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire88;
  wire [(3'h7):(1'h0)] wire89;
  wire [(4'hc):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire113;
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  assign y = {wire69,
                 wire13,
                 wire12,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire113,
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
                 (1'h0)};
  assign wire12 = {($unsigned($unsigned((wire9 >= wire9))) ?
                          $unsigned(wire10) : $unsigned($signed((wire8 ?
                              wire11 : (7'h40))))),
                      wire10};
  assign wire13 = (~|$unsigned(wire12));
  module14 #() modinst70 (.wire16(wire11), .wire18(wire12), .clk(clk), .wire15(wire8), .wire17(wire10), .y(wire69), .wire19(wire9));
  assign wire71 = (({wire69[(4'he):(4'he)], wire9} ?
                      $signed({$unsigned(wire13),
                          (wire69 ?
                              wire8 : wire9)}) : (8'h9c)) - (&$signed((&$signed(wire12)))));
  assign wire72 = (+wire71[(2'h2):(1'h0)]);
  assign wire73 = (wire10 ? wire13 : (&(!wire8[(5'h15):(5'h15)])));
  assign wire74 = ({(+(~(wire69 ? wire9 : wire73))),
                      wire12} >>> $signed(wire11[(2'h2):(1'h1)]));
  assign wire75 = $unsigned((&$signed((&(wire72 ? wire73 : wire74)))));
  always
    @(posedge clk) begin
      reg76 <= wire75[(4'hd):(3'h6)];
      if ($signed((($unsigned(wire73) ?
              wire8[(5'h13):(1'h1)] : $signed((^~wire12))) ?
          $unsigned($signed($signed(wire12))) : {($signed(reg76) | $unsigned(wire74))})))
        begin
          reg77 <= (-(~^(wire71 ?
              (-(^~wire72)) : ((wire9 != wire13) >> (+wire69)))));
          reg78 <= (wire8[(5'h10):(5'h10)] ? wire12 : $unsigned(wire11));
          reg79 <= $unsigned(wire13[(2'h2):(2'h2)]);
          reg80 <= ((({wire75, wire10} ?
                  wire75[(4'hb):(1'h0)] : reg77[(5'h11):(4'hf)]) ?
              wire12 : ((^{wire9}) && $unsigned(wire69[(2'h3):(1'h1)]))) - {wire13[(1'h1):(1'h0)],
              (wire69[(3'h5):(2'h2)] ? (~$signed(wire11)) : wire72)});
        end
      else
        begin
          if (wire13)
            begin
              reg77 <= wire11[(4'h9):(3'h4)];
              reg78 <= ((~(($signed(reg80) ^ reg76) ?
                      {wire75[(4'h8):(2'h2)],
                          (!wire11)} : wire74[(1'h1):(1'h0)])) ?
                  $unsigned((~&$unsigned((reg79 ?
                      (8'ha6) : wire73)))) : (+{(&$unsigned(wire73)),
                      ((!wire8) ? reg79[(4'h8):(3'h5)] : (-reg78))}));
            end
          else
            begin
              reg77 <= ({wire71[(3'h4):(2'h3)], wire8} ?
                  (wire74 ?
                      $unsigned(((wire9 ? (7'h44) : wire13) ?
                          (reg77 ? (8'hb9) : reg80) : (!reg78))) : (((reg80 ?
                          reg77 : (8'hbb)) <= (~^reg80)) > reg78[(4'hf):(1'h0)])) : (8'hb5));
              reg78 <= {(($unsigned($unsigned(wire71)) - wire69) > {((wire73 ?
                          reg76 : wire10) == (~wire11)),
                      (~(wire72 <<< (8'h9c)))}),
                  $unsigned(((+wire72) ^ $signed(wire72[(4'ha):(1'h1)])))};
              reg79 <= $signed((reg79 >= ({(+reg77)} ?
                  $signed($unsigned(reg78)) : wire69)));
            end
        end
      reg81 <= (wire75 ?
          ($unsigned($signed({wire13})) ^ wire75) : ((8'hbc) << {wire13[(2'h2):(1'h0)],
              wire9[(3'h4):(2'h2)]}));
      if ({wire69[(5'h13):(4'hb)], {$unsigned(wire73)}})
        begin
          if ((~&wire9[(1'h1):(1'h0)]))
            begin
              reg82 <= {$unsigned(({$signed(wire75), $unsigned(reg81)} ?
                      $unsigned(reg79) : wire8[(5'h10):(3'h5)])),
                  wire12[(1'h0):(1'h0)]};
            end
          else
            begin
              reg82 <= $signed((({wire69[(4'h9):(2'h2)],
                  ((8'hb9) >> wire71)} >= {reg78}) <= $signed($signed(reg80))));
              reg83 <= ((&((wire74[(3'h6):(2'h2)] ?
                          ((8'ha1) < (8'hbd)) : (reg81 ? wire12 : (8'hbf))) ?
                      ($unsigned(wire8) << $unsigned(wire75)) : ($unsigned(wire71) && (reg80 == reg80)))) ?
                  $signed((^(!$unsigned((7'h41))))) : {($unsigned($unsigned(wire74)) ?
                          $signed((+reg78)) : $signed((~&reg80))),
                      $unsigned(reg82[(4'hb):(4'h9)])});
              reg84 <= reg77[(3'h4):(2'h3)];
              reg85 <= (8'hb7);
              reg86 <= ($signed($unsigned((^~(~^(8'hb3))))) <= reg82);
            end
          reg87 <= reg78[(4'h8):(1'h1)];
        end
      else
        begin
          reg82 <= (8'hb9);
        end
    end
  assign wire88 = (reg85[(3'h6):(1'h0)] <= $unsigned((^(reg78[(4'ha):(3'h5)] && $signed(reg78)))));
  assign wire89 = {$unsigned($unsigned({{reg84, reg80}}))};
  assign wire90 = $unsigned((8'hb7));
  assign wire91 = $signed($unsigned(($unsigned(((8'ha0) ?
                      wire13 : (8'ha2))) - (^~(~^reg87)))));
  assign wire92 = (8'hb8);
  module93 #() modinst114 (.wire95(wire92), .wire96(wire11), .wire94(reg82), .wire98(wire10), .y(wire113), .wire97(reg85), .clk(clk));
endmodule

module module93
#(parameter param111 = (!(((+((8'haa) ^ (8'h9d))) >>> (&((8'h9d) ? (8'ha2) : (8'hb2)))) <= (~|{(|(8'h9c)), ((7'h43) ~^ (8'ha7))}))), 
parameter param112 = param111)
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire98;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire signed [(5'h11):(1'h0)] wire96;
  input wire signed [(2'h2):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(4'he):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire99 = $unsigned((|$signed((^$signed(wire98)))));
  assign wire100 = ((|{$signed($unsigned(wire98))}) ?
                       {$unsigned(wire94)} : wire96);
  assign wire101 = ((~&{(wire95 ?
                           $unsigned((8'ha9)) : {wire100})}) <= $unsigned(($unsigned($signed((8'h9c))) ?
                       ({wire98,
                           wire100} ^~ wire100[(4'hd):(4'hb)]) : (~^(wire99 ?
                           wire97 : wire97)))));
  assign wire102 = $signed((($unsigned($unsigned(wire100)) ?
                           $unsigned(wire95[(2'h2):(2'h2)]) : ($signed(wire100) && (^(8'h9f)))) ?
                       (&($unsigned((7'h44)) ?
                           (wire98 ?
                               wire101 : wire97) : wire100[(1'h0):(1'h0)])) : $signed($signed(wire97[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg103 <= (wire100 ?
          (-(({(8'hac), wire100} ^~ {wire94, wire95}) ?
              (wire102[(1'h0):(1'h0)] ?
                  $signed(wire99) : ((8'hb2) ?
                      wire98 : wire96)) : $unsigned((wire98 ?
                  wire96 : wire98)))) : wire99);
      reg104 <= (~|(&$signed(reg103)));
      reg105 <= $signed((wire102 << (~|(wire98[(4'hb):(2'h3)] != $unsigned(wire97)))));
    end
  always
    @(posedge clk) begin
      reg106 <= (({$unsigned(wire101)} ?
              (~^wire99) : ($signed($unsigned(reg103)) << wire100[(4'h9):(3'h4)])) ?
          wire97 : (wire95 ?
              ($signed($signed(wire102)) >> ($signed(wire102) * reg103[(1'h1):(1'h0)])) : (reg105[(3'h5):(1'h1)] ?
                  $signed((~(8'hba))) : wire96)));
      reg107 <= $signed({wire94[(3'h6):(3'h5)], wire99});
      reg108 <= $unsigned($unsigned((wire98[(4'h8):(1'h0)] ?
          wire99 : {reg106[(3'h7):(3'h4)], ((8'hb7) ? reg106 : wire98)})));
    end
  assign wire109 = (((((!(7'h44)) ? $signed(wire97) : wire96) ?
                       (wire98 ?
                           $unsigned((8'hbd)) : (~wire97)) : ((^wire99) >= $unsigned(reg108))) >= wire100) + (~(((reg108 ?
                               reg103 : wire94) ?
                           {wire100} : reg107) ?
                       $signed((reg104 ? wire94 : wire99)) : {(wire96 ?
                               reg103 : wire100),
                           (-wire97)})));
  assign wire110 = (!(|(~wire109)));
endmodule

module module14
#(parameter param67 = (^~(((~|((8'hbb) ? (8'ha3) : (8'ha2))) ~^ ({(7'h40), (8'ha3)} <<< ((8'hbc) ? (7'h42) : (8'hb4)))) | {({(8'ha5), (8'hae)} ? (+(8'hba)) : {(7'h40), (8'ha9)})})), 
parameter param68 = ((&(((~|param67) & (param67 ? param67 : param67)) ? ((param67 ? param67 : (8'hab)) >= param67) : ((param67 ? param67 : param67) ? (^~param67) : (~^param67)))) >>> (8'hbe)))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h23e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire21,
                 wire20,
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
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire20 = (-($signed($unsigned($unsigned((8'hba)))) ?
                      wire17 : ($signed(((8'hbd) ? wire19 : wire16)) ?
                          (~&(wire17 ? wire15 : (8'hbc))) : $signed(wire19))));
  assign wire21 = wire20;
  always
    @(posedge clk) begin
      reg22 <= (((wire19[(2'h2):(1'h0)] < ((wire19 > (8'h9e)) || (!(8'hae)))) && wire18[(3'h4):(1'h0)]) ?
          $unsigned(wire15[(4'h8):(2'h2)]) : wire17[(1'h0):(1'h0)]);
      if (wire15)
        begin
          reg23 <= $unsigned(wire19[(1'h1):(1'h0)]);
          if ((wire20[(5'h11):(4'ha)] ?
              (+$signed(({wire18} ?
                  $signed(reg23) : (reg22 < (8'hb5))))) : (8'haf)))
            begin
              reg24 <= $unsigned(wire17);
            end
          else
            begin
              reg24 <= (|wire19);
            end
          reg25 <= $signed(((wire20 ?
                  (~&(wire18 - (8'hbd))) : ($unsigned(wire20) <= $unsigned((8'hac)))) ?
              wire20 : (reg23 ? $signed((wire18 ^ wire19)) : wire16)));
          reg26 <= (|$unsigned(wire15));
          if (($unsigned((^~wire17[(1'h1):(1'h1)])) ?
              reg25[(3'h5):(2'h2)] : (~|{$signed({reg23, (8'hb5)})})))
            begin
              reg27 <= $unsigned(wire21);
              reg28 <= $signed(reg26);
              reg29 <= $unsigned(wire18[(2'h3):(2'h2)]);
              reg30 <= (7'h43);
              reg31 <= (~^$signed((reg29[(4'ha):(4'h8)] ?
                  ((+(8'had)) ?
                      $unsigned(wire17) : {(8'hb1)}) : $signed((wire15 >> reg25)))));
            end
          else
            begin
              reg27 <= ($unsigned($signed((^~wire19[(1'h0):(1'h0)]))) ?
                  (-$unsigned($unsigned((reg27 << reg28)))) : {(reg23[(5'h15):(1'h1)] ?
                          {(reg29 >> reg26),
                              {(7'h40), (8'hbc)}} : (!(reg30 < reg23)))});
            end
        end
      else
        begin
          if ((&reg29))
            begin
              reg23 <= ({$unsigned(wire20[(5'h14):(5'h14)]),
                  wire15} & reg24[(4'hc):(3'h7)]);
              reg24 <= reg25[(3'h6):(3'h4)];
              reg25 <= wire21[(5'h10):(3'h5)];
            end
          else
            begin
              reg23 <= (((((wire18 ?
                  reg29 : reg29) || reg27) && $unsigned((wire15 ?
                  wire21 : wire21))) - (8'hb8)) <<< $signed(reg23));
            end
          if (((reg23[(5'h11):(3'h6)] ?
                  reg30[(1'h0):(1'h0)] : ($unsigned($unsigned(wire15)) ?
                      ((reg23 ? (8'ha2) : reg22) ?
                          wire18 : $signed(wire17)) : ((~&reg27) - (!wire21)))) ?
              ({{{reg30},
                      wire15[(3'h4):(2'h2)]}} <<< reg22) : $signed(wire15[(4'he):(2'h3)])))
            begin
              reg26 <= reg28;
              reg27 <= {$signed($unsigned((~&$unsigned(wire20)))),
                  ($unsigned($signed(wire16[(3'h6):(2'h2)])) ?
                      ($unsigned((reg22 ?
                          wire18 : wire19)) + $signed(reg27)) : $signed(reg23[(4'h9):(4'h9)]))};
            end
          else
            begin
              reg26 <= $unsigned($signed($signed((!(~^reg26)))));
              reg27 <= wire15[(4'he):(4'h9)];
              reg28 <= $unsigned($signed($unsigned((reg29[(3'h6):(2'h3)] ?
                  $unsigned(wire17) : ((8'ha9) | wire16)))));
              reg29 <= ($signed((reg28 ?
                      (~|$unsigned(reg30)) : ($unsigned(wire18) || $signed(wire16)))) ?
                  reg24 : reg25);
              reg30 <= reg22[(1'h0):(1'h0)];
            end
          if ((&(wire20[(1'h0):(1'h0)] ?
              (wire15[(4'hc):(2'h2)] & wire17[(2'h3):(2'h3)]) : (reg22[(2'h3):(2'h2)] >= wire15[(4'h9):(3'h6)]))))
            begin
              reg31 <= {reg29, ((7'h42) != reg25)};
              reg32 <= {(^$signed((+(reg28 ? (8'ha4) : (8'h9f))))),
                  (wire16 ?
                      (~|reg31[(4'h9):(4'h8)]) : $signed(((&reg23) + {(8'hb4),
                          wire21})))};
              reg33 <= ($signed(reg25[(1'h1):(1'h1)]) ?
                  $unsigned((^~reg30[(1'h1):(1'h1)])) : $signed(wire19[(1'h0):(1'h0)]));
            end
          else
            begin
              reg31 <= (^$signed($signed($signed($unsigned(wire17)))));
              reg32 <= $unsigned((!$signed(({reg28,
                  reg23} <<< $signed((8'ha9))))));
              reg33 <= $unsigned(reg33);
              reg34 <= $signed($unsigned($unsigned(wire15)));
              reg35 <= ((-reg32[(3'h7):(2'h2)]) ?
                  {($signed(reg28[(2'h3):(1'h0)]) > {(reg33 & reg31)})} : $unsigned((wire17[(3'h5):(1'h1)] != (((8'hb5) ?
                      wire15 : reg31) >>> reg32[(4'hc):(3'h6)]))));
            end
        end
      if ($signed(reg28[(2'h2):(2'h2)]))
        begin
          reg36 <= $signed($signed($unsigned(((reg22 ?
              wire20 : wire19) >>> wire18[(1'h0):(1'h0)]))));
          reg37 <= $signed(((((reg23 ? wire20 : (8'hb0)) == wire21) ?
              ($unsigned(wire17) ^~ reg22[(3'h7):(1'h0)]) : {{(8'hba)}}) >= reg25[(4'hd):(3'h6)]));
          reg38 <= $signed((reg24 ?
              ($unsigned((reg29 ? wire15 : reg30)) ?
                  $signed((wire19 ? (8'hb5) : wire16)) : ($signed(wire16) ?
                      (~|wire20) : {wire15})) : $signed($unsigned($signed(wire15)))));
        end
      else
        begin
          reg36 <= wire19[(1'h1):(1'h0)];
          reg37 <= {$signed((&$unsigned(reg30)))};
          reg38 <= $unsigned((+(7'h41)));
          reg39 <= ($signed(wire15) > {(wire18 ? wire15 : wire16)});
          reg40 <= wire16;
        end
      reg41 <= reg40;
    end
  always
    @(posedge clk) begin
      if (reg38[(2'h3):(1'h0)])
        begin
          reg42 <= ((^~reg30) ?
              ((($signed(wire20) ?
                  $unsigned(reg28) : (reg26 ?
                      wire16 : reg34)) & reg40) ^~ reg22) : (~^((~&(reg41 ?
                      reg41 : reg26)) ?
                  reg28 : $unsigned(reg36[(4'h9):(3'h7)]))));
          if ($signed($signed(reg29[(3'h4):(3'h4)])))
            begin
              reg43 <= $signed((~^reg32[(4'hd):(1'h0)]));
              reg44 <= reg22;
            end
          else
            begin
              reg43 <= (~^(wire21 ?
                  {((8'hb0) ~^ (wire16 ^~ wire20))} : (+$unsigned(reg40[(2'h3):(2'h2)]))));
              reg44 <= $signed($signed(((|{(8'ha4)}) == reg24[(3'h5):(1'h1)])));
              reg45 <= (&reg39);
            end
          reg46 <= ((((^reg25[(4'hd):(2'h3)]) ? (+(~&reg39)) : (+{reg41})) ?
                  ($signed($signed(reg44)) ?
                      (7'h40) : wire20) : {$signed($unsigned(wire15))}) ?
              $unsigned($signed(reg37[(3'h4):(1'h1)])) : {((!$signed(reg25)) ?
                      ($unsigned(reg35) ^ (~^reg40)) : (reg41 < reg38[(2'h2):(1'h1)])),
                  (^((~^wire16) ? {reg36} : $unsigned(reg39)))});
          if (reg34)
            begin
              reg47 <= (reg24 >>> reg22);
              reg48 <= {(+(reg37 - wire21))};
              reg49 <= ((($unsigned((reg33 ?
                          wire20 : reg32)) != $unsigned(reg35)) ?
                      $signed($signed(wire15[(5'h14):(3'h7)])) : wire18) ?
                  ($signed(reg42) ?
                      reg31[(4'ha):(3'h6)] : $unsigned(wire15[(5'h10):(4'ha)])) : $signed((8'h9d)));
              reg50 <= (~|wire18);
            end
          else
            begin
              reg47 <= ((8'hac) < (reg25[(4'hd):(3'h7)] ?
                  wire20[(4'hf):(4'ha)] : $unsigned(reg41[(1'h1):(1'h1)])));
              reg48 <= $signed(($signed(((reg46 ? reg42 : reg37) ?
                      reg24[(3'h5):(2'h3)] : {reg47, reg30})) ?
                  wire20 : $unsigned((reg42[(4'hd):(4'h8)] ?
                      (&reg24) : $unsigned(reg38)))));
            end
          reg51 <= {($signed((~^(^~reg38))) ? reg22 : (~^reg42)),
              reg37[(3'h6):(2'h2)]};
        end
      else
        begin
          reg42 <= ((reg28[(1'h0):(1'h0)] ~^ reg32) ?
              {{((reg25 << (8'ha3)) < (reg39 || reg35)), reg50}} : reg40);
          reg43 <= $unsigned({reg45[(3'h6):(3'h6)],
              {reg39[(2'h2):(1'h1)], $signed((~^reg34))}});
          if ((+{reg41, wire17}))
            begin
              reg44 <= reg38;
            end
          else
            begin
              reg44 <= ((8'ha5) * ($unsigned($signed((reg48 <= reg50))) ~^ (reg25[(4'h9):(3'h6)] ?
                  reg23[(4'hb):(4'ha)] : $unsigned((reg37 < reg38)))));
              reg45 <= {$signed((8'ha1))};
            end
          reg46 <= $signed(((8'h9c) & reg26[(4'h8):(1'h1)]));
        end
      reg52 <= reg51;
      reg53 <= (reg47 ?
          (+$signed(($unsigned(reg24) <= (reg49 * reg51)))) : (((wire18[(1'h0):(1'h0)] ?
                  (reg52 ~^ reg52) : reg35[(1'h1):(1'h1)]) ~^ $signed(((8'hae) <= reg31))) ?
              (~&{$signed((8'hb7)),
                  reg40[(1'h1):(1'h0)]}) : ((|$unsigned(reg49)) ?
                  wire20[(1'h0):(1'h0)] : ((reg33 != (8'hb2)) ?
                      $unsigned(reg37) : $unsigned(wire16)))));
      reg54 <= ({(|((^wire15) + $signed((8'haa)))),
              (&($unsigned(reg46) ? $unsigned(reg40) : (-(8'hbe))))} ?
          reg41 : (~^$unsigned($unsigned((reg25 ^~ reg45)))));
      reg55 <= $unsigned($signed($unsigned((+(reg28 ? reg38 : reg52)))));
    end
  always
    @(posedge clk) begin
      reg56 <= reg47[(1'h0):(1'h0)];
      reg57 <= reg38[(4'hc):(1'h1)];
      reg58 <= (($signed(($unsigned((8'hbc)) ?
          reg47[(2'h3):(1'h1)] : $unsigned((8'hb3)))) == reg47) << $unsigned(reg33[(5'h11):(5'h10)]));
      if (reg40)
        begin
          reg59 <= (~^(reg52 <<< (&((reg55 ? reg56 : (7'h42)) ?
              reg51[(4'h9):(3'h6)] : $signed((8'hbe))))));
        end
      else
        begin
          if ({((((reg55 ?
                  reg24 : reg25) <<< $signed(reg26)) & (reg57[(1'h1):(1'h0)] ?
                  (wire15 != reg59) : {reg51})) >>> $signed($unsigned(reg49)))})
            begin
              reg59 <= (~({(reg44[(2'h3):(1'h0)] ?
                      (reg54 && (8'ha8)) : $signed(reg23)),
                  reg33[(5'h14):(3'h5)]} & $signed((~^reg34))));
              reg60 <= (&$signed(reg37[(3'h7):(1'h0)]));
            end
          else
            begin
              reg59 <= $signed({reg60,
                  ($signed($unsigned(reg38)) + {(wire15 || (8'ha3))})});
              reg60 <= $signed(reg41[(1'h1):(1'h1)]);
              reg61 <= ($unsigned({($signed(reg25) ? reg45 : (&reg23)),
                      {reg41, (~wire18)}}) ?
                  $unsigned(reg25) : ((^~($unsigned(reg37) ?
                          reg43 : $signed(reg25))) ?
                      wire17 : reg28[(1'h0):(1'h0)]));
              reg62 <= reg45;
              reg63 <= $signed($unsigned(wire18));
            end
        end
      reg64 <= (~^$signed($signed(reg51)));
    end
  assign wire65 = reg24;
  assign wire66 = reg23;
endmodule

module module156  (y, clk, wire161, wire160, wire159, wire158, wire157);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire161;
  input wire [(2'h2):(1'h0)] wire160;
  input wire signed [(3'h4):(1'h0)] wire159;
  input wire signed [(5'h13):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  wire [(3'h6):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire163;
  wire signed [(4'h9):(1'h0)] wire162;
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'he):(1'h0)] reg169 = (1'h0);
  reg [(5'h13):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(5'h12):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  assign y = {wire171,
                 wire163,
                 wire162,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 (1'h0)};
  assign wire162 = ($signed($signed((wire158[(4'ha):(4'h8)] ?
                           {wire160} : (^wire161)))) ?
                       wire158 : (-wire158[(5'h10):(4'hd)]));
  assign wire163 = $signed((~wire159));
  always
    @(posedge clk) begin
      reg164 <= $signed($signed((-wire162[(3'h4):(2'h2)])));
      reg165 <= $unsigned(wire161);
      reg166 <= {(((wire160 >= (~(8'hb0))) + reg165) < $unsigned(wire158[(4'ha):(3'h4)])),
          $signed($signed($unsigned($unsigned(wire159))))};
      if (reg164[(2'h3):(2'h2)])
        begin
          reg167 <= {(&($signed((wire159 ? (8'hb8) : reg165)) ?
                  $signed($signed(reg166)) : $signed((!wire163)))),
              ($unsigned(({reg164,
                  (8'ha2)} != wire159[(1'h1):(1'h0)])) * wire160[(2'h2):(1'h1)])};
        end
      else
        begin
          reg167 <= $unsigned(($unsigned(wire161) ?
              reg164 : {{(reg164 - reg166), $signed(reg167)},
                  ((wire158 ~^ reg164) ^ $signed(reg165))}));
          reg168 <= (reg165[(3'h5):(2'h2)] ?
              wire161[(4'h9):(4'h8)] : ($signed((!wire161)) << $signed(wire162)));
          reg169 <= (|$signed($unsigned((^$unsigned(wire160)))));
          reg170 <= (reg166 * (wire157[(5'h12):(4'hf)] >>> $signed(($signed((8'ha5)) + (~^reg165)))));
        end
    end
  assign wire171 = {wire163[(2'h2):(1'h1)]};
endmodule

module module134
#(parameter param148 = (((^~(!((8'h9e) ^~ (8'hab)))) ? ((((8'hab) >= (8'hba)) >= ((8'hb5) >= (8'ha7))) ? (8'hbd) : ({(8'hae), (7'h40)} == (+(8'hb0)))) : (|(((8'hba) ? (8'hac) : (8'hb7)) ? ((8'h9c) != (8'hb5)) : {(8'ha8)}))) ? (!{(((8'hab) ? (8'hb0) : (8'hb9)) ? {(8'ha4), (8'had)} : (^(8'ha6)))}) : (-{(((7'h42) ? (8'ha6) : (8'hab)) ? ((8'hb6) << (8'hae)) : (^~(8'ha3)))})), 
parameter param149 = (param148 ^ (param148 ? (-param148) : (param148 >>> param148))))
(y, clk, wire139, wire138, wire137, wire136, wire135);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire139;
  input wire signed [(4'he):(1'h0)] wire138;
  input wire signed [(4'h8):(1'h0)] wire137;
  input wire [(5'h14):(1'h0)] wire136;
  input wire [(2'h2):(1'h0)] wire135;
  wire [(4'h9):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire [(2'h3):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 (1'h0)};
  assign wire140 = $unsigned((wire139[(4'h9):(1'h1)] ?
                       wire137 : (($signed(wire136) >= $unsigned((8'hb7))) && (&wire135))));
  assign wire141 = wire136;
  assign wire142 = wire141[(2'h2):(2'h2)];
  assign wire143 = ({wire140[(2'h2):(1'h0)]} ^~ $unsigned(($signed($signed(wire136)) ^ (wire137[(3'h4):(2'h2)] - $unsigned((7'h41))))));
  assign wire144 = $signed($unsigned(wire138));
  assign wire145 = wire138;
  assign wire146 = $signed(wire143[(3'h5):(3'h5)]);
  assign wire147 = (!{{$unsigned($unsigned((8'hbe)))}});
endmodule
