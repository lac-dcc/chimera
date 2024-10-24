module top
#(parameter param222 = {((~(((8'ha5) ^~ (8'hb7)) - (~(8'hab)))) ? (^{((8'hba) > (8'hb6))}) : {((-(8'hbc)) * ((8'hb3) ? (8'hb1) : (8'hb8))), (-(^(8'ha1)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire165;
  wire signed [(2'h2):(1'h0)] wire166;
  wire signed [(3'h5):(1'h0)] wire167;
  wire [(5'h15):(1'h0)] wire177;
  wire [(3'h6):(1'h0)] wire202;
  wire signed [(4'hd):(1'h0)] wire203;
  wire [(2'h3):(1'h0)] wire204;
  wire signed [(3'h7):(1'h0)] wire220;
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg176 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg182 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg189 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  reg signed [(4'he):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(4'ha):(1'h0)] reg195 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg198 = (1'h0);
  reg [(5'h15):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg201 = (1'h0);
  assign y = {wire129,
                 wire5,
                 wire163,
                 wire165,
                 wire166,
                 wire167,
                 wire177,
                 wire202,
                 wire203,
                 wire204,
                 wire220,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 (1'h0)};
  assign wire5 = $signed($signed($signed({$signed((8'hb8))})));
  module6 #() modinst130 (wire129, clk, wire4, wire3, wire0, wire5, wire1);
  module131 #() modinst164 (wire163, clk, wire4, wire0, wire5, wire129);
  assign wire165 = ((wire163 ? (~|((8'hb6) > wire4)) : $signed(wire4)) ?
                       wire4 : $unsigned(wire4));
  assign wire166 = wire5;
  assign wire167 = {($signed((wire166 - $signed(wire163))) <= (|$signed($unsigned(wire3))))};
  always
    @(posedge clk) begin
      reg168 <= ((8'hba) ?
          $unsigned($unsigned($unsigned(wire129[(4'hd):(3'h7)]))) : ((((~wire163) <<< (7'h43)) ~^ (~|(wire129 ?
              wire1 : wire4))) << (((wire167 ?
                  wire5 : wire0) || $signed(wire129)) ?
              wire166 : (&$signed((8'hb6))))));
      reg169 <= ((^$signed({(!wire0)})) ? wire167 : wire5);
      reg170 <= $unsigned(wire3[(4'h8):(3'h6)]);
      if ((wire163 * ($unsigned($unsigned(reg169[(1'h1):(1'h0)])) ?
          wire166 : (~&reg170))))
        begin
          reg171 <= ((wire3[(1'h0):(1'h0)] ?
                  $signed(wire129[(1'h0):(1'h0)]) : (~|(!$signed(wire165)))) ?
              (wire1[(4'hd):(3'h7)] ?
                  wire0 : ($signed(wire167[(3'h4):(1'h1)]) <<< $signed($signed(reg168)))) : $signed(($unsigned(wire0) ?
                  (+(wire167 ? wire3 : wire3)) : wire5)));
        end
      else
        begin
          reg171 <= wire163;
          if (($unsigned($unsigned(((wire167 ? reg169 : wire167) ?
              (wire2 ? (8'ha9) : reg170) : (reg171 ?
                  (8'hbf) : wire165)))) >>> ({(!(^~(8'ha6)))} ?
              $unsigned(((~|(7'h40)) ?
                  $unsigned(wire165) : wire163)) : (~(wire163[(4'h8):(3'h5)] ?
                  {wire2, wire166} : $unsigned((8'hb1)))))))
            begin
              reg172 <= {$unsigned((&((wire166 >>> wire129) ^ reg169[(1'h0):(1'h0)]))),
                  wire5[(4'hd):(4'hc)]};
              reg173 <= {($unsigned($signed(reg171[(2'h3):(1'h0)])) << {(!reg170[(2'h2):(1'h0)]),
                      $unsigned(wire0[(4'hd):(4'hb)])}),
                  wire129[(3'h7):(1'h1)]};
              reg174 <= (~^(wire163[(4'h9):(3'h6)] ^~ (~&wire163)));
            end
          else
            begin
              reg172 <= (wire3 ?
                  $unsigned($signed(($signed(wire1) ~^ ((8'hb8) & reg168)))) : (~|$signed((^(+wire2)))));
              reg173 <= (&((+(8'hae)) != (8'ha7)));
              reg174 <= (~|{((reg169[(3'h4):(2'h2)] ?
                          (wire129 ? reg173 : reg174) : wire129) ?
                      ((!reg174) ?
                          ((7'h42) ^ wire167) : (wire166 - wire4)) : $unsigned((wire166 ?
                          reg172 : wire1)))});
              reg175 <= $unsigned($unsigned((reg170 ^ wire163[(1'h0):(1'h0)])));
              reg176 <= $unsigned({(wire163[(3'h4):(1'h1)] || ((reg170 ?
                          wire129 : reg169) ?
                      (reg174 << wire166) : ((8'ha6) >> wire5)))});
            end
        end
    end
  assign wire177 = $unsigned((|$unsigned(($unsigned(wire5) ~^ (wire2 != wire3)))));
  always
    @(posedge clk) begin
      reg178 <= ((~(~^$signed(reg173))) & (reg171[(4'ha):(3'h6)] ?
          (8'ha1) : wire5));
      reg179 <= wire165[(3'h4):(1'h1)];
      if (wire177[(5'h13):(4'ha)])
        begin
          reg180 <= (+((reg174 ?
                  ((~^reg168) ?
                      (^wire177) : reg168[(1'h0):(1'h0)]) : $unsigned((wire4 && wire167))) ?
              wire129 : wire165));
          reg181 <= reg174[(1'h1):(1'h1)];
          reg182 <= $unsigned(((reg180[(3'h5):(2'h2)] ?
              $signed(((8'hba) ? reg175 : reg173)) : {wire0[(3'h7):(2'h3)],
                  $unsigned(reg175)}) > ($unsigned((reg169 >>> (8'ha1))) ?
              $signed($signed(wire177)) : $unsigned((wire163 >= (8'hae))))));
          if (reg174)
            begin
              reg183 <= reg179[(1'h1):(1'h1)];
            end
          else
            begin
              reg183 <= reg175[(2'h2):(2'h2)];
              reg184 <= $unsigned((reg170[(1'h0):(1'h0)] <<< ({(wire165 ?
                          wire0 : reg169)} ?
                  reg173 : $signed((reg179 | (8'hbf))))));
              reg185 <= wire4[(3'h5):(2'h2)];
              reg186 <= reg175;
              reg187 <= ($signed((&$signed((!reg179)))) + {(^(reg179[(1'h1):(1'h0)] ^~ $signed(reg179)))});
            end
          reg188 <= (reg179[(2'h3):(1'h0)] == reg186[(2'h3):(1'h1)]);
        end
      else
        begin
          if ((~|{$unsigned($unsigned(reg174[(2'h3):(1'h0)])),
              $signed($signed((reg174 >= wire5)))}))
            begin
              reg180 <= reg176[(4'hb):(1'h0)];
              reg181 <= {$unsigned(reg180[(3'h5):(1'h1)])};
              reg182 <= $signed((((reg172[(4'he):(2'h3)] | (~|reg168)) && wire1) - ($signed($unsigned(wire0)) ?
                  ((reg168 || reg176) ?
                      $signed(wire1) : wire2[(4'h9):(2'h3)]) : $signed((reg170 ^~ wire165)))));
            end
          else
            begin
              reg180 <= (~&$unsigned(wire167));
              reg181 <= (!wire2[(4'hb):(2'h3)]);
            end
          reg183 <= {reg179};
          reg184 <= ((((^~(wire2 <<< wire5)) ?
                  (-{wire1}) : (reg178[(3'h4):(1'h0)] < $signed(wire0))) ?
              reg182 : reg184[(4'ha):(2'h2)]) >= wire166);
        end
      reg189 <= reg188[(4'hf):(3'h5)];
      if ($signed((~|reg185[(4'h9):(4'h9)])))
        begin
          if (($unsigned($signed((^(reg178 | (7'h44))))) ?
              (^reg172[(1'h0):(1'h0)]) : ($signed(reg179[(2'h2):(1'h1)]) <<< $unsigned((~(reg169 ?
                  (8'hb7) : (8'had)))))))
            begin
              reg190 <= (((+(~&(reg180 ? reg175 : reg181))) ?
                  reg169 : (^({wire1} ?
                      (~^reg181) : $unsigned(wire163)))) >= $signed((-wire0)));
            end
          else
            begin
              reg190 <= (8'hba);
              reg191 <= (!($unsigned(($unsigned(reg174) ~^ ((8'h9f) & wire5))) < (^(7'h43))));
              reg192 <= $signed(wire4[(5'h13):(3'h7)]);
              reg193 <= $signed(({(+{reg174})} ?
                  $signed(reg179) : $unsigned($unsigned(reg192))));
              reg194 <= {(|wire4)};
            end
          if (reg194[(2'h2):(2'h2)])
            begin
              reg195 <= {wire5, (8'hab)};
            end
          else
            begin
              reg195 <= ($signed($signed((~^$unsigned(wire167)))) | $unsigned($signed(wire2[(4'he):(4'h8)])));
              reg196 <= ($unsigned(((~|(+reg172)) || ({wire177,
                  reg182} != $signed(reg169)))) ^~ (($unsigned($signed(wire4)) >= wire2[(3'h5):(3'h4)]) ?
                  reg181 : reg181));
              reg197 <= reg185;
              reg198 <= reg173;
            end
          reg199 <= reg182;
          if ($unsigned((~|(({reg169, reg189} ?
              $signed((8'hb0)) : {reg180}) >>> reg187))))
            begin
              reg200 <= (8'h9d);
              reg201 <= reg172;
            end
          else
            begin
              reg200 <= $signed({{(reg192 <<< reg179[(2'h3):(1'h1)])}});
            end
        end
      else
        begin
          reg190 <= {{$signed(reg189),
                  {$unsigned((^wire0)), (|((8'hb3) ? wire5 : (8'hb7)))}},
              (-reg182[(5'h12):(5'h11)])};
          if (reg170)
            begin
              reg191 <= ($signed(($unsigned((wire5 ? reg181 : wire1)) ?
                      ($unsigned(reg171) <<< (reg182 ?
                          (8'hae) : wire5)) : $signed((reg186 ?
                          reg188 : reg173)))) ?
                  $unsigned(wire2[(5'h10):(1'h1)]) : reg168[(3'h4):(2'h2)]);
              reg192 <= reg200;
              reg193 <= ($signed(reg193) <= (reg172 ?
                  {$signed((|reg194)),
                      $unsigned(reg178)} : reg183[(3'h5):(2'h3)]));
            end
          else
            begin
              reg191 <= $unsigned((|wire4));
              reg192 <= (((((reg183 ? wire166 : wire5) < ((8'ha4) * reg194)) ?
                      $unsigned((^~wire166)) : $signed($unsigned(reg198))) ?
                  $signed(reg173[(4'hf):(4'h8)]) : ($unsigned($signed(reg178)) ?
                      (~^$signed(reg190)) : (^(^reg171)))) ^~ {($unsigned($signed(reg174)) ?
                      ({(8'hba), wire3} ?
                          ((8'h9c) ?
                              (8'ha1) : reg191) : (~|wire0)) : ($signed(reg191) || (~^reg172))),
                  ($signed({reg181, wire167}) == reg181)});
              reg193 <= (!(-(reg174 ?
                  (reg186[(1'h1):(1'h0)] ?
                      reg182[(5'h13):(1'h1)] : $signed(reg183)) : ((8'hb7) ?
                      $unsigned(reg192) : $signed(reg195)))));
              reg194 <= $signed(reg197[(3'h4):(1'h0)]);
              reg195 <= (~|reg189);
            end
          reg196 <= reg201[(3'h6):(2'h3)];
          reg197 <= ($signed((!(reg185[(4'ha):(4'h8)] == reg197[(3'h5):(2'h3)]))) ?
              (wire2 ?
                  reg170[(3'h6):(2'h2)] : (((reg195 | reg191) ?
                          (wire5 >>> wire165) : (~^wire2)) ?
                      ($unsigned(reg201) ?
                          (reg185 < wire5) : (~&reg193)) : reg188)) : wire129);
          reg198 <= ((-($unsigned((8'hb2)) ~^ (^~reg176[(4'hd):(4'hc)]))) || $unsigned(((reg194 + reg198) ?
              (reg197[(3'h4):(2'h3)] ?
                  wire2[(4'hf):(1'h1)] : $unsigned((8'ha4))) : $signed((|reg199)))));
        end
    end
  assign wire202 = (~|reg192);
  assign wire203 = {(((wire1[(5'h10):(1'h1)] ^~ (wire4 || (7'h40))) + ($unsigned((8'hbc)) * $signed(reg201))) ?
                           (!((~&reg198) ?
                               $unsigned((8'hbb)) : $signed(reg186))) : $signed(reg200[(3'h7):(3'h7)])),
                       reg174};
  assign wire204 = (8'hbe);
  module205 #() modinst221 (wire220, clk, reg191, reg174, reg199, wire129);
endmodule

module module205
#(parameter param219 = (|((~|((~&(8'hb7)) ? (~&(8'hbf)) : (|(7'h42)))) * (^~(((8'hbd) ? (8'hbd) : (8'hb9)) ? ((8'ha9) >> (8'h9e)) : (~|(8'hb9)))))))
(y, clk, wire209, wire208, wire207, wire206);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire209;
  input wire [(2'h2):(1'h0)] wire208;
  input wire [(5'h15):(1'h0)] wire207;
  input wire [(5'h13):(1'h0)] wire206;
  wire signed [(4'hd):(1'h0)] wire218;
  wire [(4'ha):(1'h0)] wire217;
  wire signed [(2'h3):(1'h0)] wire216;
  wire [(2'h3):(1'h0)] wire215;
  wire [(3'h4):(1'h0)] wire214;
  wire [(4'ha):(1'h0)] wire213;
  wire signed [(2'h2):(1'h0)] wire212;
  wire signed [(2'h2):(1'h0)] wire211;
  wire [(3'h4):(1'h0)] wire210;
  assign y = {wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 (1'h0)};
  assign wire210 = ((~^(((wire209 ? wire206 : wire206) << wire208) ?
                       wire209 : wire209)) | (~^(wire209[(1'h0):(1'h0)] ^ wire206)));
  assign wire211 = (8'hba);
  assign wire212 = $signed((|wire208[(1'h0):(1'h0)]));
  assign wire213 = wire206;
  assign wire214 = (~((wire210 != {(^wire213)}) && wire211));
  assign wire215 = $signed($signed((8'hb8)));
  assign wire216 = ($signed(wire210[(2'h2):(1'h0)]) ^ ($unsigned({(wire211 ?
                           wire212 : wire207)}) <<< $signed((wire215 ?
                       $unsigned(wire208) : (!wire209)))));
  assign wire217 = $unsigned(wire214);
  assign wire218 = ($signed(((!(~&(8'h9c))) ?
                           ($unsigned(wire210) ^ (^~wire211)) : (~^wire217[(4'h8):(3'h6)]))) ?
                       $signed($unsigned((+$unsigned(wire216)))) : (wire212[(1'h0):(1'h0)] ?
                           (+((-wire208) + (wire217 ^ wire206))) : wire210[(2'h2):(2'h2)]));
endmodule

module module131
#(parameter param161 = {(^~{({(8'ha9), (7'h44)} & (^(8'hb1)))}), (((~&((8'hb0) ? (7'h41) : (8'h9d))) ? (~|((8'ha2) ? (8'hb6) : (7'h40))) : (~&((8'hb3) ? (7'h40) : (8'hb8)))) >>> (~(|((8'hb6) ? (8'had) : (7'h40)))))}, 
parameter param162 = ({{param161, ((param161 ? param161 : param161) ? (param161 ? param161 : param161) : ((8'ha1) ? param161 : param161))}} ? ({({param161, (8'hb6)} <<< (param161 ? param161 : param161))} ? (^((param161 ? param161 : (7'h43)) - param161)) : (8'ha6)) : {{(param161 ? param161 : (param161 ? (8'ha8) : param161))}, (!(8'hb0))}))
(y, clk, wire135, wire134, wire133, wire132);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire135;
  input wire signed [(5'h10):(1'h0)] wire134;
  input wire signed [(5'h12):(1'h0)] wire133;
  input wire signed [(5'h11):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire160;
  wire signed [(3'h5):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire136;
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'hc):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire147,
                 wire146,
                 wire145,
                 wire137,
                 wire136,
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
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire136 = (&$unsigned({((wire132 <= wire135) < (wire132 ?
                           wire133 : wire134))}));
  assign wire137 = ((wire133 ?
                           ($unsigned(wire134) ?
                               (wire133 <= $unsigned(wire135)) : $unsigned(wire132[(2'h3):(1'h0)])) : wire136[(3'h5):(2'h2)]) ?
                       (^(($signed(wire132) > (wire134 ? wire134 : wire133)) ?
                           $signed((wire133 ?
                               wire136 : (8'ha1))) : $unsigned((8'h9d)))) : (+(^wire133[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      if (wire136[(1'h0):(1'h0)])
        begin
          reg138 <= ($unsigned((~{(wire133 ?
                  wire137 : wire132)})) >= wire137[(2'h3):(1'h1)]);
          if (wire132)
            begin
              reg139 <= $unsigned($signed(($unsigned({wire132, (8'ha5)}) ?
                  (&wire134[(4'ha):(3'h7)]) : (~^reg138[(3'h7):(1'h1)]))));
            end
          else
            begin
              reg139 <= wire134;
              reg140 <= (!$unsigned(wire134));
              reg141 <= $signed(($unsigned(wire132[(3'h4):(2'h3)]) ?
                  wire137[(3'h7):(3'h7)] : reg140));
              reg142 <= $unsigned({$signed((wire136 ?
                      $unsigned(wire136) : $signed(reg139))),
                  reg140});
            end
        end
      else
        begin
          reg138 <= $signed(($unsigned({(reg138 ?
                  wire134 : wire137)}) ~^ wire133));
          if ($signed(wire132))
            begin
              reg139 <= reg142;
              reg140 <= ($unsigned(reg142[(3'h4):(2'h3)]) ?
                  $unsigned($signed(wire132)) : reg141);
              reg141 <= (!(^(wire134[(4'hd):(4'hd)] ?
                  wire134[(1'h0):(1'h0)] : (reg142[(3'h6):(3'h6)] == (~&wire134)))));
              reg142 <= $unsigned({(-(7'h43))});
            end
          else
            begin
              reg139 <= $signed((~|reg140[(4'hc):(4'h8)]));
              reg140 <= ($unsigned({((7'h40) ? wire134 : (8'ha0)),
                      ((&wire135) ?
                          (reg142 ? (8'hbc) : wire137) : (!reg142))}) ?
                  (7'h40) : ((((reg138 - wire137) + (8'ha7)) ?
                      $unsigned($signed(wire137)) : wire136[(4'h8):(3'h4)]) || {($signed(wire136) ?
                          wire137 : {wire135}),
                      {$signed(wire135), (wire132 ? wire136 : (8'hb3))}}));
              reg141 <= (&((^wire137) ?
                  (($signed(reg141) ?
                      (reg142 ?
                          reg141 : wire132) : (|wire134)) ^ (wire132[(4'h9):(3'h4)] < (wire133 ~^ wire135))) : {wire133}));
            end
          reg143 <= (^{reg139,
              (wire135[(2'h2):(1'h1)] ?
                  wire132[(4'he):(4'h9)] : ((reg142 ?
                      (8'ha1) : reg142) - (wire137 ? (8'hac) : reg140)))});
          reg144 <= (7'h41);
        end
    end
  assign wire145 = ((wire135 ?
                       wire135 : $signed(reg140[(4'hf):(2'h2)])) >= $unsigned({wire133}));
  assign wire146 = $unsigned((reg142 < (&wire136[(3'h6):(2'h3)])));
  assign wire147 = wire137[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      if (reg138)
        begin
          reg148 <= $unsigned($unsigned(reg144));
          reg149 <= wire135;
          if (reg143[(1'h0):(1'h0)])
            begin
              reg150 <= ($signed($unsigned(reg149[(3'h4):(1'h1)])) + wire136[(3'h7):(3'h4)]);
            end
          else
            begin
              reg150 <= wire134;
            end
          if (wire135)
            begin
              reg151 <= reg138;
              reg152 <= $unsigned(reg138[(3'h7):(3'h7)]);
              reg153 <= $unsigned((&wire137));
              reg154 <= (8'ha1);
              reg155 <= wire134;
            end
          else
            begin
              reg151 <= $unsigned(reg153);
              reg152 <= reg149[(3'h4):(3'h4)];
              reg153 <= (wire134[(4'hf):(1'h1)] ?
                  $signed($unsigned($unsigned((^~reg143)))) : wire137[(4'ha):(3'h6)]);
            end
        end
      else
        begin
          if ($signed(reg155))
            begin
              reg148 <= reg143[(2'h3):(2'h3)];
              reg149 <= $unsigned(({(~|wire147)} ?
                  wire146 : $signed(($signed((7'h43)) ?
                      reg148[(4'h8):(2'h2)] : wire137))));
              reg150 <= {(~^(((&reg149) ?
                      {reg151,
                          (8'hb4)} : $unsigned(wire133)) ^~ $signed($unsigned(wire136))))};
            end
          else
            begin
              reg148 <= ({{(~((8'hbc) ? reg144 : reg138))},
                  wire147} || $unsigned((wire147[(4'hb):(4'hb)] != $signed((^reg143)))));
            end
        end
      reg156 <= (+(&$unsigned((|$signed(reg151)))));
      reg157 <= $signed(($unsigned(((!reg138) & $signed(reg155))) ?
          (((reg140 ? reg139 : (8'hbd)) ?
              wire147 : reg142[(3'h6):(1'h1)]) ^ (reg153 ?
              (~|reg143) : (reg148 >= reg138))) : reg153[(4'h9):(1'h1)]));
      reg158 <= (+reg143);
    end
  assign wire159 = (&(-$signed(((!reg156) ? reg141 : (^wire137)))));
  assign wire160 = (reg157 ?
                       (&$signed($signed((reg148 + reg140)))) : reg140[(3'h6):(2'h2)]);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(4'h9):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(2'h3):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire123;
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire83,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire123,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
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
                 (1'h0)};
  assign wire12 = (wire8 ^ $unsigned(wire8[(3'h5):(1'h0)]));
  assign wire13 = $signed((($unsigned((wire11 || wire9)) ~^ wire12) ?
                      (~&$signed($signed(wire9))) : ($unsigned(wire10[(1'h0):(1'h0)]) ?
                          $signed($signed((8'ha7))) : (&(wire7 ?
                              wire12 : (8'hb3))))));
  assign wire14 = $unsigned((!wire9[(2'h2):(1'h0)]));
  assign wire15 = {(^~((^wire14[(1'h0):(1'h0)]) ?
                          ((wire13 ? wire14 : wire8) || {wire10}) : wire13))};
  assign wire16 = (wire9[(2'h3):(1'h1)] <= ($signed($signed($signed(wire8))) ?
                      (wire11[(2'h2):(1'h0)] > {wire15}) : $signed($unsigned($signed(wire10)))));
  assign wire17 = wire9;
  always
    @(posedge clk) begin
      if ((~$unsigned($signed((~^$unsigned(wire13))))))
        begin
          reg18 <= $signed($signed(($unsigned((wire13 ^~ wire10)) < $signed((|(8'hb5))))));
          if ($signed({$signed((wire17[(4'hc):(4'h8)] ~^ wire13[(2'h2):(1'h1)])),
              (&wire17[(4'ha):(2'h3)])}))
            begin
              reg19 <= wire15[(2'h2):(1'h0)];
              reg20 <= ((($signed($signed(wire11)) ?
                          $signed(wire8) : wire16[(4'hb):(4'ha)]) ?
                      $unsigned(((+wire10) > (&wire10))) : (+wire16)) ?
                  $signed($signed($unsigned($unsigned((8'hb3))))) : ((wire13 >>> $unsigned((~^wire8))) ?
                      $unsigned($unsigned((reg18 ?
                          wire10 : wire12))) : $signed($unsigned(wire13))));
              reg21 <= (wire8 == (^~wire17));
              reg22 <= $signed(($signed(wire9[(1'h0):(1'h0)]) ?
                  (+$signed({reg19,
                      wire7})) : $unsigned((~&(wire12 == (8'hb8))))));
            end
          else
            begin
              reg19 <= (((($signed((8'hb5)) ?
                      (reg20 - reg20) : wire11[(1'h0):(1'h0)]) - $signed(wire16)) >= $unsigned($unsigned($signed(wire14)))) ?
                  (wire16[(3'h7):(2'h2)] ?
                      $unsigned((+{wire17})) : (wire11[(1'h0):(1'h0)] ?
                          reg19 : (~$unsigned(wire12)))) : $signed(wire16));
              reg20 <= $unsigned(({(!(reg21 ?
                      wire10 : wire7))} + {{$signed(reg19)},
                  $signed(((8'hbf) || wire7))}));
            end
          reg23 <= ($unsigned(((~^wire10) ?
              $unsigned(wire12[(2'h3):(2'h3)]) : (~^{wire7,
                  (8'hba)}))) == (~&wire11[(2'h2):(1'h0)]));
          reg24 <= $signed($signed(wire12[(4'hb):(3'h4)]));
          reg25 <= (~|((reg19 ?
                  ($unsigned((8'haf)) <<< wire15[(3'h6):(3'h5)]) : reg24) ?
              $signed((wire8 && (reg18 ?
                  wire16 : wire7))) : $unsigned($unsigned((+reg22)))));
        end
      else
        begin
          if ($signed((&{(((7'h44) <<< reg20) ?
                  (wire15 - reg21) : $unsigned(wire14)),
              wire11[(1'h0):(1'h0)]})))
            begin
              reg18 <= reg25[(3'h6):(3'h5)];
              reg19 <= $unsigned(reg24);
              reg20 <= wire13[(2'h3):(2'h3)];
            end
          else
            begin
              reg18 <= {$signed((~$unsigned(reg18[(3'h7):(2'h3)])))};
              reg19 <= (((~&$unsigned($signed((8'ha0)))) ~^ wire15[(1'h1):(1'h0)]) ?
                  $unsigned((~|(8'had))) : ($unsigned((^(wire8 - reg18))) ^ reg19));
              reg20 <= $unsigned($unsigned((~&$signed((wire9 < wire17)))));
              reg21 <= (((reg23[(2'h3):(2'h3)] ^ ($signed(wire15) ?
                  ((8'hb2) == reg23) : (reg18 ?
                      wire9 : wire7))) >>> $unsigned($signed(wire15))) | $signed((($unsigned((8'hbc)) ~^ wire15[(3'h7):(3'h5)]) >>> $unsigned($signed((8'hbc))))));
            end
          reg22 <= wire7[(4'ha):(1'h1)];
          reg23 <= $unsigned(wire13[(3'h6):(2'h3)]);
          reg24 <= $signed($signed($signed($unsigned(reg25[(3'h5):(3'h4)]))));
        end
      reg26 <= $signed(wire17);
      if ((reg22[(1'h0):(1'h0)] ?
          reg22[(2'h3):(1'h0)] : ($signed($unsigned(reg23[(3'h6):(3'h4)])) ?
              (($unsigned(wire17) ?
                  (+wire17) : wire9) + $unsigned(reg23[(4'h8):(3'h4)])) : $signed($signed((8'ha0))))))
        begin
          reg27 <= $signed((-(((reg26 > wire12) || reg22) + $signed((wire8 ?
              wire15 : wire16)))));
          if (((~^wire11) ?
              (($signed((wire9 <<< reg23)) != $unsigned((^~wire17))) - reg21) : $signed($signed($unsigned($unsigned(reg20))))))
            begin
              reg28 <= ($signed({(~|reg25), (8'hbf)}) ?
                  wire11 : $unsigned(((+(&wire15)) ~^ ((reg23 != wire15) ?
                      $signed((8'ha6)) : (reg24 ~^ reg21)))));
            end
          else
            begin
              reg28 <= wire7;
              reg29 <= (((8'ha4) && $unsigned(wire9)) ?
                  {(({reg23} < wire17[(4'ha):(4'h9)]) ^~ ($signed(wire14) ^ reg28[(5'h12):(5'h10)]))} : (~&$unsigned(($signed((8'hbc)) ^ {(8'hbb)}))));
              reg30 <= wire8[(1'h0):(1'h0)];
              reg31 <= $signed((~^$signed(((reg21 ?
                  reg19 : wire11) || wire16[(1'h1):(1'h1)]))));
              reg32 <= (8'ha7);
            end
          if (((~|(($signed(reg20) ? (!wire17) : (~^reg20)) ?
                  ((wire9 > (7'h42)) >>> {wire10,
                      wire17}) : $unsigned({wire12}))) ?
              $signed((reg21[(3'h4):(3'h4)] ^ $signed(wire10[(2'h2):(1'h1)]))) : reg31))
            begin
              reg33 <= (~|{$unsigned((^~(reg21 == wire14))),
                  $signed($unsigned($unsigned((8'had))))});
              reg34 <= $unsigned($unsigned($unsigned($signed((reg18 ?
                  reg28 : reg20)))));
              reg35 <= $signed((!((reg34[(4'hf):(2'h3)] * reg20[(1'h0):(1'h0)]) <<< {$unsigned(wire13),
                  (reg21 > reg28)})));
            end
          else
            begin
              reg33 <= reg27;
            end
          if ({reg34[(4'h9):(1'h1)], reg18[(4'hb):(3'h4)]})
            begin
              reg36 <= ($signed($unsigned((reg27 ?
                  reg22 : (reg30 << reg31)))) ^ reg32[(3'h5):(2'h3)]);
              reg37 <= ($signed(wire16[(4'h8):(3'h6)]) ?
                  $unsigned(($unsigned({reg20,
                      wire7}) ^ {(wire13 <= (8'h9d))})) : {(-$signed({reg26})),
                      $unsigned((8'hac))});
              reg38 <= (($signed(((wire17 ?
                      wire14 : (8'h9f)) - $unsigned(reg18))) ?
                  reg35 : {((reg23 ?
                          (7'h43) : reg18) >>> (~&reg33))}) ~^ $signed($signed((|reg29[(2'h3):(1'h0)]))));
              reg39 <= reg24[(2'h3):(2'h3)];
            end
          else
            begin
              reg36 <= ({$unsigned({(~reg38), wire13})} ?
                  (reg22[(3'h5):(3'h5)] ~^ reg25) : reg35[(5'h11):(4'hc)]);
              reg37 <= ($unsigned((reg38 != reg35[(4'h8):(2'h2)])) ?
                  (7'h42) : ($unsigned(reg30) ?
                      $unsigned($signed((~^(8'h9d)))) : ($unsigned($unsigned(wire17)) == $signed(reg21))));
            end
        end
      else
        begin
          if ($signed($signed($unsigned({(wire15 ? reg26 : reg21)}))))
            begin
              reg27 <= (reg25[(2'h3):(2'h2)] ?
                  {$unsigned(({reg20, reg20} & (wire14 ?
                          reg39 : reg23)))} : $unsigned(($signed($signed(reg38)) != reg38)));
              reg28 <= $unsigned(wire7[(3'h6):(1'h0)]);
              reg29 <= reg37[(3'h5):(1'h1)];
            end
          else
            begin
              reg27 <= (~&$signed((&(reg19 < $unsigned(reg36)))));
              reg28 <= wire8;
              reg29 <= reg27;
              reg30 <= reg36;
              reg31 <= ((!({(~&reg25), wire8} ?
                      ((reg39 ? reg35 : (8'ha6)) <= $signed(reg21)) : (^(reg37 ?
                          reg33 : (8'ha7))))) ?
                  ((8'hbc) ?
                      wire7[(4'hc):(4'ha)] : $signed($signed((8'had)))) : reg39[(2'h2):(1'h1)]);
            end
          reg32 <= $signed({wire7, $signed($signed(wire17[(3'h7):(3'h4)]))});
          reg33 <= reg30;
          reg34 <= $unsigned(($unsigned({reg36[(3'h5):(2'h2)]}) ?
              reg34 : wire8[(4'h9):(3'h6)]));
        end
    end
  assign wire40 = wire13;
  assign wire41 = (reg26[(3'h5):(3'h4)] ?
                      (($unsigned($unsigned(reg27)) > $unsigned({reg24,
                              (8'haf)})) ?
                          (+{{(8'hb3), wire10}}) : {wire17[(2'h3):(1'h0)],
                              $unsigned((^wire12))}) : (wire7[(4'hc):(3'h7)] ?
                          $signed(reg38) : $signed((~(wire8 + (8'haf))))));
  assign wire42 = reg27[(3'h6):(3'h4)];
  assign wire43 = (~&(&(~^($signed(reg26) ?
                      wire16[(3'h5):(3'h4)] : {(8'had), reg29}))));
  assign wire44 = wire8;
  module45 #() modinst84 (wire83, clk, wire44, reg18, reg26, reg21, reg24);
  module85 #() modinst124 (wire123, clk, wire10, reg32, reg19, reg25);
  assign wire125 = (({$signed($unsigned(wire41)), wire43[(1'h1):(1'h1)]} ?
                       ((-(wire10 ? wire9 : reg33)) ?
                           (8'hb2) : reg33) : ((8'ha8) > (&$signed(wire40)))) && $signed((reg35[(5'h14):(2'h3)] ^ ($signed(wire7) ?
                       reg19[(5'h12):(4'h9)] : (wire40 == (8'h9f))))));
  assign wire126 = (wire44 & reg18);
  assign wire127 = reg35;
  assign wire128 = (reg22 ?
                       reg18 : $signed(((&(wire123 ?
                           reg29 : wire41)) <<< ((^~wire126) ?
                           {reg38} : reg25))));
endmodule

module module85
#(parameter param122 = (+(&{(+((8'h9d) >> (8'ha8))), (^((7'h44) ? (8'hb4) : (8'hba)))})))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire89;
  input wire [(4'he):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire87;
  input wire [(4'h8):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire92,
                 wire91,
                 wire90,
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
  assign wire90 = wire87;
  assign wire91 = wire89[(1'h0):(1'h0)];
  assign wire92 = $unsigned($unsigned(wire87[(4'hd):(4'h9)]));
  always
    @(posedge clk) begin
      reg93 <= wire92;
      reg94 <= wire86;
      reg95 <= (({$signed($unsigned(wire88))} ?
              $unsigned($unsigned((reg93 ^~ wire87))) : (~|($signed(wire89) ?
                  $signed(wire87) : $unsigned((8'hba))))) ?
          (8'hae) : $signed({reg94}));
      reg96 <= wire86;
      if ({(wire92[(4'hc):(1'h1)] + reg95[(2'h2):(1'h0)]), wire89})
        begin
          if ($unsigned(($unsigned({$unsigned(reg93),
              $unsigned((8'h9f))}) <<< (~wire89[(5'h10):(4'hf)]))))
            begin
              reg97 <= $unsigned($unsigned((reg96 ?
                  wire90 : reg93[(3'h4):(1'h0)])));
              reg98 <= {wire86[(3'h5):(1'h1)],
                  (wire86[(3'h7):(3'h5)] - ($signed((wire90 ?
                      reg97 : wire91)) < $unsigned(((8'hb2) ^ reg94))))};
              reg99 <= $signed(wire86);
              reg100 <= reg94[(4'hd):(3'h4)];
            end
          else
            begin
              reg97 <= wire86;
              reg98 <= wire88;
              reg99 <= $signed(((((8'hac) ?
                      (!(8'hbb)) : wire88[(2'h3):(1'h1)]) <<< (((7'h44) ^~ wire89) ?
                      (wire90 == wire90) : (8'ha8))) ?
                  wire91 : (reg97[(2'h2):(1'h0)] ?
                      {$unsigned(reg99),
                          wire91} : ($signed((8'h9d)) > (-wire90)))));
              reg100 <= (($signed(reg93) ~^ ((reg99 >>> reg97) && (wire86 > {wire92,
                      reg100}))) ?
                  reg94[(1'h1):(1'h0)] : wire89[(4'he):(2'h2)]);
            end
          reg101 <= $signed(((wire89 * $signed((reg93 ? (8'hbc) : wire90))) ?
              reg94[(4'he):(4'hc)] : $signed($unsigned({reg98}))));
          reg102 <= {wire90,
              (($signed($signed((8'hb4))) & {(wire92 ? wire90 : reg96),
                  reg93[(1'h1):(1'h1)]}) & ($unsigned({(8'ha1), reg95}) ?
                  (|(8'ha8)) : {$unsigned((8'ha4))}))};
          if (wire91)
            begin
              reg103 <= ($signed(({(reg100 ? wire86 : wire92),
                  reg97} >>> reg95)) <= (8'hba));
            end
          else
            begin
              reg103 <= wire92;
              reg104 <= wire90;
              reg105 <= {($unsigned(({reg95} ?
                      wire89[(3'h7):(3'h5)] : $signed((8'hbe)))) >> (!{reg103,
                      (wire87 <= (8'hb7))})),
                  ((~&((^~reg103) ?
                      {reg96} : (+reg98))) <= ({{reg97}} || ($unsigned(wire86) + (wire88 | reg98))))};
              reg106 <= $signed((((~(reg96 ? reg94 : reg98)) ^ (reg95 ?
                  (~|wire86) : (wire92 ?
                      wire89 : wire92))) <<< reg95[(4'h8):(1'h1)]));
            end
          reg107 <= ($unsigned(reg102) ?
              (($signed($signed(reg102)) != (8'ha1)) ^ reg100[(2'h3):(2'h2)]) : wire89);
        end
      else
        begin
          reg97 <= (!reg105);
        end
    end
  assign wire108 = {(~|reg94)};
  assign wire109 = $unsigned($signed($unsigned((reg103[(3'h7):(3'h7)] ^ wire90))));
  assign wire110 = reg99[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg111 <= reg100;
      if ((reg105[(4'hd):(4'h9)] ?
          wire87[(3'h6):(1'h0)] : {reg104,
              ($signed((reg100 >> wire86)) != $unsigned(reg107))}))
        begin
          reg112 <= $unsigned(($unsigned(wire92) ? $signed((7'h42)) : (7'h41)));
          if ((^(!(reg101 ?
              $unsigned($signed(reg97)) : ((reg96 * wire88) * reg95[(3'h4):(1'h1)])))))
            begin
              reg113 <= reg111;
              reg114 <= (wire109[(3'h4):(3'h4)] ?
                  reg105[(3'h5):(1'h0)] : reg111);
              reg115 <= (($unsigned($unsigned((wire90 ?
                  reg102 : reg103))) >> $signed((!((8'had) ~^ reg101)))) < ((~^({reg95} - $unsigned(wire109))) ?
                  ($signed(reg94) | $unsigned(wire90[(4'hb):(2'h2)])) : {((reg96 ?
                          reg98 : reg99) << $signed(wire91)),
                      wire86}));
            end
          else
            begin
              reg113 <= reg98;
              reg114 <= reg105[(1'h1):(1'h1)];
            end
          reg116 <= $unsigned($unsigned($unsigned((^(reg114 ?
              reg93 : wire109)))));
          if (wire108)
            begin
              reg117 <= $unsigned(reg115[(2'h2):(2'h2)]);
              reg118 <= {(^~(reg111 ^ reg101[(3'h7):(3'h4)]))};
              reg119 <= $unsigned(reg93);
            end
          else
            begin
              reg117 <= $signed((!reg116));
            end
          reg120 <= ((&wire92) ?
              (+(reg118[(2'h3):(1'h0)] ?
                  ((reg99 ? reg113 : reg104) ?
                      (wire88 + reg98) : $signed(reg96)) : $unsigned($unsigned((8'hbf))))) : ((+$signed(wire91[(3'h4):(1'h1)])) == reg103));
        end
      else
        begin
          reg112 <= wire108;
          if ((($signed({(reg106 ? reg115 : reg107), {reg104}}) << ({((8'ha5) ?
                  wire91 : wire110),
              reg97} ^ (^$unsigned(reg98)))) >>> reg112[(3'h7):(1'h0)]))
            begin
              reg113 <= ({$signed((wire89[(3'h5):(1'h1)] ?
                      $unsigned(reg99) : $signed(reg105)))} && reg107);
            end
          else
            begin
              reg113 <= reg99;
              reg114 <= $unsigned(reg103[(3'h5):(3'h5)]);
              reg115 <= $signed(((8'ha3) ?
                  wire86 : $unsigned(wire89[(4'hc):(2'h2)])));
              reg116 <= wire109[(3'h4):(2'h2)];
              reg117 <= reg97[(4'hb):(3'h6)];
            end
          reg118 <= reg117;
          reg119 <= reg114[(3'h6):(2'h2)];
        end
      reg121 <= wire108;
    end
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire50;
  input wire [(3'h4):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire51;
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire51,
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
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = $unsigned(((!$unsigned($unsigned(wire47))) ?
                      $unsigned(wire47[(3'h7):(3'h7)]) : $signed(wire46[(4'hb):(4'h9)])));
  always
    @(posedge clk) begin
      reg52 <= {wire47, $unsigned((!($signed((8'hb3)) <<< (~wire49))))};
      reg53 <= (8'haf);
    end
  assign wire54 = $signed($unsigned($signed((8'hb9))));
  assign wire55 = $unsigned(wire51[(4'h8):(3'h6)]);
  assign wire56 = ($signed($signed($unsigned($unsigned(wire46)))) | wire48[(4'he):(4'h9)]);
  assign wire57 = {((((wire55 ?
                              wire47 : wire55) && (wire55 ~^ wire54)) != (8'ha0)) ?
                          wire55[(1'h0):(1'h0)] : wire49)};
  assign wire58 = {$unsigned(wire54[(2'h3):(1'h1)]),
                      (reg52[(1'h0):(1'h0)] > (~^$signed((wire51 != wire49))))};
  assign wire59 = (~&{(|wire58), reg53[(1'h0):(1'h0)]});
  assign wire60 = (!(~^wire54));
  assign wire61 = ($signed(((((7'h41) ? reg53 : wire55) ?
                              wire58[(4'h9):(4'h8)] : reg52) ?
                          (^(wire59 ? (8'hae) : wire56)) : ((wire54 ?
                                  wire51 : wire46) ?
                              ((7'h42) ? wire47 : wire58) : $signed(reg52)))) ?
                      wire56[(4'hd):(4'hc)] : (((^~(wire55 ?
                              wire56 : wire49)) || $signed($signed((8'ha5)))) ?
                          wire50 : wire59[(2'h3):(2'h3)]));
  assign wire62 = $unsigned({$signed((8'hb4)),
                      $signed((wire59[(2'h2):(1'h0)] ?
                          (^~(8'ha8)) : (wire54 ? wire61 : (8'hb0))))});
  assign wire63 = wire54;
  always
    @(posedge clk) begin
      reg64 <= $signed((wire54 && (8'ha3)));
      if ({{($unsigned($signed(wire58)) ?
                  ($signed(wire58) <= ((8'ha2) ?
                      wire57 : wire50)) : ($unsigned((8'ha1)) ?
                      (~^wire59) : (~&wire58)))},
          wire50[(3'h4):(2'h2)]})
        begin
          reg65 <= (^$signed((wire56[(3'h4):(2'h2)] ~^ ($signed((7'h41)) >= (wire63 ?
              wire54 : wire57)))));
          reg66 <= wire63;
          reg67 <= $signed(((8'hb5) ^ wire63[(2'h3):(1'h0)]));
          reg68 <= $unsigned($signed((&(~^(wire46 <<< reg65)))));
          reg69 <= (^reg68);
        end
      else
        begin
          if ($unsigned(((~&(~^$unsigned((8'h9e)))) <= (~&((~&reg69) ?
              (wire49 ? wire50 : reg66) : {wire49, wire49})))))
            begin
              reg65 <= wire60;
              reg66 <= ($unsigned($signed((^~(|wire48)))) == $signed((reg69 * {(~(8'hbb)),
                  $unsigned(wire59)})));
              reg67 <= reg67;
            end
          else
            begin
              reg65 <= $unsigned(wire62);
            end
        end
      if (({$signed($unsigned((~^wire49)))} - {$unsigned($unsigned(reg66)),
          $unsigned((+$signed(wire56)))}))
        begin
          reg70 <= wire62;
          reg71 <= ($unsigned($signed($signed($signed(wire48)))) ?
              (|reg66) : (wire60[(1'h0):(1'h0)] ?
                  (wire58[(3'h4):(1'h0)] ?
                      wire63[(2'h3):(2'h3)] : {$unsigned(wire57),
                          wire51[(4'h9):(3'h7)]}) : reg52));
          reg72 <= {wire49[(3'h4):(2'h2)], $signed($unsigned(reg69))};
        end
      else
        begin
          reg70 <= $unsigned($signed((~&(^$signed(wire51)))));
          reg71 <= wire51[(2'h3):(2'h2)];
          reg72 <= reg71;
          reg73 <= reg64[(4'hb):(4'ha)];
          reg74 <= $unsigned((&(-wire58)));
        end
    end
  assign wire75 = $signed((reg73 | (reg70[(3'h6):(1'h0)] ~^ ((reg73 & wire55) <<< wire54))));
  assign wire76 = reg52;
  assign wire77 = ($unsigned((|$unsigned((reg68 ?
                      reg71 : reg67)))) - wire55[(2'h2):(1'h1)]);
  assign wire78 = ((8'ha4) ?
                      $signed(wire54) : (wire77 & (wire49 >> $unsigned(wire56))));
  assign wire79 = {wire62};
  assign wire80 = (~reg73[(4'hf):(4'hc)]);
  assign wire81 = ($unsigned(wire63[(1'h1):(1'h0)]) ?
                      wire80[(2'h3):(2'h3)] : ((7'h44) > ((wire59[(3'h5):(2'h2)] <= $unsigned(wire59)) ?
                          $signed(wire59[(4'h9):(3'h7)]) : wire77)));
  assign wire82 = $signed({$unsigned((-{wire56})), wire48});
endmodule
