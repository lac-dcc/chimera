module top
#(parameter param242 = (((~^{{(8'h9d), (8'h9c)}, ((7'h42) ^ (8'hb8))}) <<< ((((8'hbf) ? (8'ha2) : (8'hbb)) ? ((8'hb2) != (8'hb3)) : ((8'haa) ? (8'hac) : (8'h9e))) ? ((^~(8'hb6)) >>> (~|(8'hae))) : (~{(8'ha2)}))) <<< ({{((8'hb9) ? (8'hb9) : (8'hb1))}} != ((((7'h43) && (8'hbc)) ? ((8'hbd) ? (8'haa) : (8'ha2)) : (^~(8'hb4))) > (&(|(8'ha5)))))), 
parameter param243 = (-param242))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire241;
  wire [(3'h5):(1'h0)] wire218;
  wire signed [(4'ha):(1'h0)] wire217;
  wire signed [(5'h12):(1'h0)] wire216;
  wire signed [(2'h3):(1'h0)] wire215;
  wire signed [(3'h7):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire213;
  wire [(4'he):(1'h0)] wire228;
  wire signed [(2'h3):(1'h0)] wire229;
  wire signed [(5'h12):(1'h0)] wire230;
  wire signed [(4'hf):(1'h0)] wire232;
  wire [(5'h14):(1'h0)] wire233;
  wire [(2'h3):(1'h0)] wire234;
  wire [(4'hc):(1'h0)] wire239;
  reg signed [(2'h2):(1'h0)] reg238 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg237 = (1'h0);
  reg [(5'h13):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg235 = (1'h0);
  reg [(4'hb):(1'h0)] reg220 = (1'h0);
  reg [(5'h15):(1'h0)] reg221 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg223 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg224 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg226 = (1'h0);
  reg [(4'hc):(1'h0)] reg227 = (1'h0);
  assign y = {wire241,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire213,
                 wire228,
                 wire229,
                 wire230,
                 wire232,
                 wire233,
                 wire234,
                 wire239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg220,
                 reg221,
                 reg222,
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 (1'h0)};
  assign wire4 = ((($signed(wire3) > $unsigned({wire3})) || $signed((-$signed(wire0)))) > wire0[(1'h1):(1'h1)]);
  assign wire5 = wire0[(3'h4):(1'h0)];
  assign wire6 = {(-wire3[(2'h3):(1'h1)])};
  assign wire7 = (&{(^~wire2[(2'h3):(2'h2)])});
  assign wire8 = (wire6[(1'h1):(1'h1)] >= $unsigned($unsigned($unsigned((wire0 ?
                     wire2 : wire1)))));
  assign wire9 = $unsigned($unsigned($signed((wire3 != (wire3 ?
                     wire4 : wire3)))));
  assign wire10 = ($unsigned((~|wire7)) ? wire5 : wire7[(4'hd):(2'h3)]);
  module11 #() modinst214 (.wire12(wire7), .clk(clk), .wire13(wire3), .wire15(wire10), .wire16(wire5), .wire14(wire8), .y(wire213));
  assign wire215 = $signed(wire7[(4'h9):(1'h0)]);
  assign wire216 = {((($unsigned(wire213) ?
                           (!wire9) : {wire10}) ~^ $signed($signed(wire1))) * ({$signed(wire9),
                           wire9} >>> $unsigned({wire1, wire7}))),
                       wire215};
  assign wire217 = $unsigned(wire9[(4'ha):(4'h9)]);
  module173 #() modinst219 (wire218, clk, wire6, wire2, wire9, wire216, wire213);
  always
    @(posedge clk) begin
      if ((wire215[(2'h3):(2'h2)] ?
          {wire8[(4'hc):(2'h3)],
              $signed((|(wire9 <= wire6)))} : $signed(wire0[(2'h3):(1'h0)])))
        begin
          reg220 <= wire217;
          reg221 <= (8'hb8);
          if ((!(7'h43)))
            begin
              reg222 <= $signed(wire2);
            end
          else
            begin
              reg222 <= (8'hb8);
              reg223 <= $unsigned(wire4);
              reg224 <= $signed((~|$signed(((|wire2) ?
                  (reg220 && (7'h42)) : wire8))));
              reg225 <= wire218;
            end
          reg226 <= ((reg220 ?
              {(~(&wire7)), $unsigned((^reg225))} : (^((wire2 ? wire9 : wire3) ?
                  (wire3 ~^ wire216) : (^wire9)))) ^~ reg225);
          reg227 <= $signed((~^(+reg222)));
        end
      else
        begin
          reg220 <= (($unsigned((7'h41)) ?
                  {wire215} : ({(reg227 ^ wire6),
                      wire4} - $signed((wire217 < wire216)))) ?
              (8'hb5) : $signed({$unsigned($unsigned(reg220))}));
          reg221 <= (({reg224[(1'h0):(1'h0)],
                  $unsigned((reg223 >>> wire10))} || ((&(wire8 ?
                  reg227 : reg221)) <= wire2)) ?
              $signed(wire6) : wire6[(1'h1):(1'h1)]);
          if (((8'hb7) ?
              (^$unsigned((wire218[(2'h2):(1'h1)] ?
                  {wire8} : wire1))) : (($unsigned((wire2 ?
                          wire215 : (7'h40))) ?
                      (~{wire2}) : $unsigned((wire3 ? wire8 : wire7))) ?
                  $signed((&(wire5 ?
                      wire9 : (8'ha1)))) : $signed((wire8 + reg224[(2'h3):(2'h3)])))))
            begin
              reg222 <= (~|wire9);
              reg223 <= wire3[(4'h9):(4'h8)];
              reg224 <= {reg221[(4'he):(1'h0)]};
            end
          else
            begin
              reg222 <= wire6;
              reg223 <= {{$unsigned(wire6)}};
              reg224 <= $signed(reg227[(4'h8):(1'h1)]);
              reg225 <= (|{(^~reg227[(4'ha):(2'h2)]), (~^wire6)});
              reg226 <= $unsigned((^~(8'hbc)));
            end
        end
    end
  assign wire228 = ((~&(reg221 ?
                       {(wire7 ? wire215 : reg227), {reg226}} : (-(wire6 ?
                           reg222 : (8'hac))))) ^ (^(wire8[(5'h10):(4'hb)] >>> $unsigned(wire213[(4'hc):(4'hc)]))));
  assign wire229 = reg227[(1'h1):(1'h0)];
  module11 #() modinst231 (wire230, clk, reg221, reg226, reg223, wire1, wire6);
  assign wire232 = (&wire228[(4'h8):(4'h8)]);
  assign wire233 = reg220[(3'h5):(1'h1)];
  assign wire234 = reg222[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg235 <= wire229[(1'h0):(1'h0)];
      reg236 <= $signed((8'hb7));
      reg237 <= (8'ha1);
      reg238 <= ($signed(wire3) ^~ wire217[(4'ha):(3'h7)]);
    end
  module19 #() modinst240 (wire239, clk, wire216, reg227, reg223, wire4, wire10);
  assign wire241 = $signed(($unsigned((8'hb7)) ?
                       (+reg225) : (~^(reg220 ? wire5 : {wire239}))));
endmodule

module module11
#(parameter param212 = (-((8'ha7) ? {({(8'hb6)} ? (!(8'ha8)) : (+(8'had)))} : (-((8'hb0) ? ((8'h9c) == (8'ha9)) : (^(8'hbd)))))))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire211;
  wire [(4'he):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire [(5'h15):(1'h0)] wire167;
  wire [(4'h9):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire170;
  wire [(3'h6):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire193;
  reg signed [(3'h5):(1'h0)] reg208 = (1'h0);
  reg [(4'he):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg203 = (1'h0);
  reg [(5'h10):(1'h0)] reg202 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg201 = (1'h0);
  reg [(4'hf):(1'h0)] reg200 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg195 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire167,
                 wire109,
                 wire108,
                 wire106,
                 wire17,
                 wire18,
                 wire66,
                 wire169,
                 wire170,
                 wire171,
                 wire172,
                 wire193,
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
                 (1'h0)};
  assign wire17 = wire15[(5'h13):(3'h6)];
  assign wire18 = {($unsigned($signed(((8'hb8) && wire14))) ?
                          (wire15 ?
                              wire17[(4'h9):(1'h1)] : ($signed((8'ha8)) ?
                                  {wire12, wire13} : (wire12 ?
                                      wire13 : wire16))) : $unsigned($unsigned({wire16,
                              wire12}))),
                      wire13[(3'h6):(2'h3)]};
  module19 #() modinst67 (.clk(clk), .wire23(wire13), .wire24(wire14), .wire21(wire17), .wire20(wire16), .y(wire66), .wire22(wire18));
  module68 #() modinst107 (wire106, clk, wire13, wire12, wire15, wire66);
  assign wire108 = (|$signed(wire17[(2'h2):(2'h2)]));
  assign wire109 = ((($unsigned($signed(wire13)) == ($unsigned(wire106) ?
                               wire66[(1'h0):(1'h0)] : wire106[(4'hf):(3'h7)])) ?
                           {(~&(~wire108)),
                               (^$unsigned(wire12))} : $signed(wire66[(4'h9):(3'h4)])) ?
                       (^~(^wire16)) : $signed(wire13));
  module110 #() modinst168 (.wire115(wire14), .wire111(wire15), .wire114(wire13), .wire112(wire106), .clk(clk), .wire113(wire66), .y(wire167));
  assign wire169 = wire12;
  assign wire170 = $signed(wire66[(1'h1):(1'h0)]);
  assign wire171 = (-wire167);
  assign wire172 = $signed(($unsigned({(~^wire167)}) | $signed((-$unsigned(wire109)))));
  module173 #() modinst194 (.wire175(wire66), .y(wire193), .wire174(wire108), .wire176(wire18), .wire177(wire106), .wire178(wire12), .clk(clk));
  always
    @(posedge clk) begin
      reg195 <= (((((wire14 ? wire172 : wire14) ? wire13 : $signed(wire106)) ?
              (&(wire172 == wire17)) : wire108[(4'hc):(1'h0)]) ?
          wire14 : ($signed($unsigned(wire109)) ?
              $signed($unsigned(wire171)) : {$signed(wire106),
                  (~|wire170)})) - wire108[(1'h1):(1'h1)]);
      if (wire12)
        begin
          reg196 <= ($unsigned((&wire14)) ?
              wire167[(5'h11):(2'h3)] : (wire170[(3'h5):(3'h5)] ?
                  $signed(((wire109 ? wire13 : wire12) ?
                      (^~wire16) : wire169)) : ($signed(reg195) ?
                      $unsigned(wire14[(3'h6):(1'h0)]) : (!wire18))));
          if ((+$unsigned(($unsigned($unsigned(wire13)) <<< wire13[(4'ha):(2'h3)]))))
            begin
              reg197 <= $unsigned(($unsigned(wire13) && reg195));
              reg198 <= reg197[(2'h2):(1'h1)];
              reg199 <= $unsigned((reg195 ?
                  $unsigned($unsigned($unsigned(wire108))) : wire193[(5'h10):(3'h4)]));
              reg200 <= (($signed(((-wire12) ?
                          (^~(7'h40)) : reg198[(2'h2):(1'h1)])) ?
                      wire167 : $unsigned($signed(wire12))) ?
                  (~(~|wire108)) : $signed(wire109));
              reg201 <= (wire109 == {$unsigned((wire66[(5'h10):(4'hb)] >> $signed(wire17))),
                  $signed(reg200[(4'hb):(4'ha)])});
            end
          else
            begin
              reg197 <= wire169[(3'h7):(1'h0)];
            end
          reg202 <= (^$signed({(&$signed((8'had)))}));
        end
      else
        begin
          reg196 <= $signed(wire66);
          reg197 <= wire66[(4'ha):(1'h1)];
          if ($unsigned(((((wire13 << wire18) << $signed(reg202)) ?
              $unsigned($signed(reg195)) : $unsigned((wire14 <= (8'hbd)))) ^ ((wire109 >> $unsigned(reg199)) ?
              $unsigned((wire18 ? wire172 : reg196)) : (&{reg195, wire172})))))
            begin
              reg198 <= $signed((wire14 && $unsigned(reg196[(4'h8):(2'h3)])));
              reg199 <= ((reg195 ?
                      $unsigned($unsigned((wire169 ?
                          wire169 : (8'h9d)))) : $unsigned(reg198[(3'h6):(3'h4)])) ?
                  (wire106 ?
                      wire169 : ((+(wire14 >> (8'hb1))) ?
                          (-$unsigned((8'hb0))) : wire167[(5'h13):(3'h4)])) : wire109);
            end
          else
            begin
              reg198 <= {reg201,
                  ($signed(($unsigned(wire167) ?
                      $signed(reg198) : $signed(reg195))) + $unsigned($signed($unsigned(wire13))))};
              reg199 <= reg196;
            end
        end
      reg203 <= reg197;
      if (reg196)
        begin
          reg204 <= reg203;
          reg205 <= (((wire170[(1'h0):(1'h0)] ?
                  $unsigned($signed(wire15)) : reg199) << wire193) ?
              $unsigned({(reg198 - (wire170 ? reg198 : wire109)),
                  (8'ha1)}) : $signed(wire17));
          reg206 <= wire172[(4'h8):(3'h5)];
          reg207 <= ((~&{wire106}) ?
              {wire18, (~$unsigned($signed((8'hab))))} : $unsigned(reg202));
          reg208 <= $signed($signed((wire108[(4'h8):(2'h3)] >> wire106)));
        end
      else
        begin
          reg204 <= $signed((wire16 ?
              $unsigned($signed((reg208 <<< wire14))) : $unsigned(wire12)));
        end
    end
  assign wire209 = wire66;
  assign wire210 = wire169;
  assign wire211 = (wire167 * $unsigned({reg205}));
endmodule

module module173  (y, clk, wire178, wire177, wire176, wire175, wire174);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire178;
  input wire signed [(4'hc):(1'h0)] wire177;
  input wire [(4'ha):(1'h0)] wire176;
  input wire [(4'h8):(1'h0)] wire175;
  input wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(5'h15):(1'h0)] wire192;
  wire [(4'he):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire188;
  wire signed [(2'h2):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire179;
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(4'h9):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg [(5'h13):(1'h0)] reg181 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire179,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire179 = (+wire175);
  always
    @(posedge clk) begin
      reg180 <= (((($signed(wire176) > $signed(wire176)) ?
              (wire175 * (wire179 >> wire177)) : wire178[(1'h1):(1'h1)]) ?
          (({wire179, (7'h43)} ~^ $unsigned(wire176)) ?
              ($unsigned(wire179) <<< $signed(wire176)) : ($signed(wire176) <= (wire174 ^~ (8'had)))) : $unsigned($unsigned((wire176 ?
              wire174 : (7'h41))))) <<< $signed((wire179[(1'h0):(1'h0)] ?
          wire177[(4'hc):(3'h5)] : ((wire174 ^ wire175) ? wire177 : wire177))));
      reg181 <= wire178[(4'ha):(2'h3)];
      reg182 <= $signed(wire178);
      if ((wire174[(4'ha):(3'h7)] << ((($unsigned((8'hb6)) + $signed(wire176)) ?
              ((+wire176) + (wire174 >>> wire175)) : $signed($unsigned(reg180))) ?
          $signed(((~wire175) ?
              (wire176 ^~ wire179) : wire175[(3'h5):(3'h4)])) : ({wire177[(4'h8):(1'h1)]} != {wire179,
              $unsigned(wire175)}))))
        begin
          reg183 <= (~^$unsigned(wire178));
          reg184 <= (reg180[(4'he):(4'ha)] ?
              (+$unsigned((~{wire177, reg180}))) : $unsigned((wire175 ?
                  wire178 : reg183)));
          reg185 <= wire174[(4'h9):(3'h6)];
          reg186 <= ($unsigned(reg182[(3'h4):(2'h3)]) + {$signed((-(reg185 ^~ reg183))),
              {(reg185 >> (~reg184)), (~reg184)}});
        end
      else
        begin
          reg183 <= $unsigned((((((8'ha4) ^~ reg185) ^ (~^wire175)) ?
                  (wire175[(3'h7):(3'h4)] ?
                      $unsigned(wire174) : wire178[(4'h9):(2'h2)]) : $unsigned((reg182 & reg184))) ?
              (reg183[(4'hb):(3'h6)] & $signed((wire177 == reg183))) : (!$unsigned((wire174 ?
                  wire176 : reg182)))));
          reg184 <= (($unsigned((~|reg186[(1'h0):(1'h0)])) + ($signed({(8'hba),
              reg185}) & ((reg182 ^ reg181) ?
              (^~reg183) : $signed(wire178)))) << $signed((+$unsigned({wire177}))));
          reg185 <= $signed(($signed(reg180) && $signed($signed(reg186))));
          reg186 <= wire179;
        end
    end
  assign wire187 = reg185[(3'h4):(2'h3)];
  assign wire188 = ({(^~(&reg182))} ?
                       (reg184 ?
                           $signed($signed(reg182[(1'h1):(1'h1)])) : wire175[(2'h2):(2'h2)]) : (|(^wire179[(2'h3):(1'h1)])));
  assign wire189 = $signed((($unsigned(wire175) ^ $signed(((7'h40) ?
                           reg185 : reg184))) ?
                       (8'hb0) : $signed(reg183)));
  assign wire190 = ((reg181[(5'h10):(2'h3)] ?
                       ({reg185[(2'h2):(1'h0)]} ?
                           $unsigned({reg182}) : ({reg180} ?
                               $unsigned(reg180) : (wire175 ?
                                   wire188 : wire178))) : wire187[(2'h2):(2'h2)]) & {(reg180[(3'h6):(3'h5)] <<< {$unsigned((7'h42))})});
  assign wire191 = (wire176 ?
                       $unsigned($unsigned($signed($unsigned(reg184)))) : {($signed(reg183) ?
                               ((wire187 || wire176) ?
                                   ((8'ha7) & wire174) : $unsigned((8'ha0))) : $unsigned($signed(wire176))),
                           $unsigned($unsigned(((8'ha8) ?
                               wire177 : (8'hb2))))});
  assign wire192 = ($signed(wire188[(1'h1):(1'h0)]) ?
                       {wire178,
                           {{wire178[(4'h8):(2'h2)],
                                   ((8'hb4) ^~ wire178)}}} : (~|$unsigned($signed(reg185[(2'h2):(1'h0)]))));
endmodule

module module110
#(parameter param166 = {(({(~^(8'hbe)), ((8'ha8) != (8'hba))} ? (8'ha9) : (~(~^(8'hb4)))) == {((~(8'ha7)) ? {(8'ha9), (7'h43)} : ((8'ha0) && (8'hb9)))}), ((((~&(8'h9e)) ^ {(8'had), (8'hab)}) > {{(8'hb4), (8'haa)}, ((8'hbe) ? (8'hb1) : (8'ha7))}) ? ((((7'h42) < (7'h41)) || ((8'hb2) >>> (8'had))) ? (((8'h9f) <= (8'ha4)) ? ((8'hbc) ? (8'ha9) : (8'hbd)) : ((8'hb4) ? (8'hac) : (8'hb6))) : (((8'h9d) - (8'h9f)) >= ((8'h9f) ? (8'hb8) : (8'hac)))) : (~|(~|((8'hba) != (8'hab)))))})
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h241):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire115;
  input wire [(4'ha):(1'h0)] wire114;
  input wire [(5'h15):(1'h0)] wire113;
  input wire signed [(2'h3):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire165;
  wire [(2'h3):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire137;
  wire [(5'h13):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  reg signed [(4'hd):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg161 = (1'h0);
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg [(4'he):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(4'he):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(5'h14):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(4'hb):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg144 = (1'h0);
  reg [(5'h15):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(2'h3):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  assign y = {wire165,
                 wire138,
                 wire137,
                 wire135,
                 wire133,
                 wire120,
                 wire119,
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
                 reg141,
                 reg140,
                 reg139,
                 reg136,
                 reg134,
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
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg116 <= wire114[(3'h6):(1'h1)];
      reg117 <= $signed(wire111);
      reg118 <= (^~({(&reg117), (^~reg117)} >= reg117[(1'h1):(1'h1)]));
    end
  assign wire119 = $signed((wire112[(1'h1):(1'h0)] >> ((+wire112[(2'h2):(1'h1)]) > (-(wire115 ?
                       (8'hb7) : reg116)))));
  assign wire120 = wire111[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg121 <= $signed($unsigned($signed(($signed(reg116) >>> (-reg118)))));
      reg122 <= ($signed((($unsigned(wire114) ?
                  wire114[(2'h2):(2'h2)] : (reg121 ? wire113 : (8'ha0))) ?
              $signed($signed(wire113)) : (~wire120[(1'h1):(1'h1)]))) ?
          (~($signed(wire114) || $signed($unsigned((8'had))))) : $signed($unsigned(({(8'h9f),
              wire111} >>> wire111))));
      if (wire114[(1'h0):(1'h0)])
        begin
          reg123 <= reg121;
          if ({reg117[(2'h2):(1'h1)]})
            begin
              reg124 <= (+(8'hbb));
              reg125 <= $signed(($unsigned({(+wire114), (wire120 | reg123)}) ?
                  reg122 : $signed((~^(~&reg122)))));
            end
          else
            begin
              reg124 <= (reg122 ^ {$unsigned(wire112[(1'h1):(1'h0)])});
              reg125 <= wire112[(2'h2):(2'h2)];
              reg126 <= wire120;
              reg127 <= $unsigned(({((reg122 <= wire114) ?
                          wire119 : {wire113, reg126}),
                      $signed((~&(8'h9e)))} ?
                  $signed(wire120) : (~&reg126[(3'h4):(2'h2)])));
            end
          if ((~(-(^~(reg124 ? wire112 : (~|reg116))))))
            begin
              reg128 <= $unsigned({$unsigned(wire115[(3'h6):(1'h0)]),
                  wire113[(3'h4):(2'h2)]});
              reg129 <= ({$signed(wire115)} != wire112);
            end
          else
            begin
              reg128 <= wire111;
              reg129 <= reg118;
              reg130 <= (^({(reg117[(1'h1):(1'h1)] == $signed(wire111))} | (!reg116)));
              reg131 <= (8'hb5);
              reg132 <= wire114[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg123 <= ({((8'hb9) ?
                      (~|reg123[(4'h8):(2'h2)]) : ($signed(reg118) ?
                          wire115 : (~(8'hb5)))),
                  wire111[(3'h7):(3'h4)]} ?
              (~(reg122 ?
                  $unsigned((^~reg118)) : $signed($unsigned(reg125)))) : $signed($signed($unsigned(wire115))));
          reg124 <= reg118;
          if (reg132[(4'hd):(3'h4)])
            begin
              reg125 <= reg117;
              reg126 <= (&$unsigned((!((~reg116) + reg126))));
              reg127 <= $signed((((~reg118) ?
                  (((8'h9f) ? reg121 : reg124) ?
                      (~|wire113) : reg118) : ((~&reg125) ?
                      (wire112 <<< reg116) : wire111[(5'h11):(3'h7)])) - (reg124 != {reg132[(4'hd):(4'h9)]})));
            end
          else
            begin
              reg125 <= $signed({$unsigned(((8'hac) ?
                      $signed(reg128) : reg118[(4'hd):(4'hb)])),
                  ($unsigned(reg130[(3'h4):(2'h3)]) ?
                      reg118 : ((reg128 ^~ (7'h41)) ?
                          wire113[(4'hf):(4'he)] : {wire115, (8'hbf)}))});
            end
          reg128 <= $signed({$signed(reg121)});
          reg129 <= {($unsigned({{reg128}}) & reg118[(4'ha):(3'h7)])};
        end
    end
  assign wire133 = (wire111 ?
                       $unsigned(reg124[(3'h4):(2'h3)]) : (-((wire120[(4'he):(4'h8)] ?
                               wire113[(4'ha):(1'h0)] : {reg118, wire111}) ?
                           (^$signed(wire119)) : $signed((wire111 ?
                               (8'hb9) : reg126)))));
  always
    @(posedge clk) begin
      reg134 <= ($unsigned(wire111[(4'hd):(1'h0)]) ?
          (+$signed((~^{(8'hbf),
              reg116}))) : (wire115[(3'h6):(1'h0)] != ($signed($unsigned(wire133)) >> ($signed(reg122) ?
              $unsigned(reg129) : (wire111 - reg128)))));
    end
  assign wire135 = (reg118[(3'h6):(1'h0)] ?
                       (wire114 ?
                           ((reg126[(2'h2):(2'h2)] << reg131) + reg129[(1'h0):(1'h0)]) : $signed((8'ha2))) : reg126[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg136 <= (~&(~($signed($signed(wire114)) ?
          (wire113 * ((8'haf) ^~ reg123)) : $signed((8'hb2)))));
    end
  assign wire137 = ($signed((wire119 > $signed((^~reg117)))) ?
                       $unsigned((8'ha1)) : reg136[(3'h4):(2'h2)]);
  assign wire138 = $unsigned(reg117);
  always
    @(posedge clk) begin
      reg139 <= (^($unsigned((7'h40)) ?
          $signed((reg121[(4'h9):(1'h1)] ?
              $unsigned(reg127) : (reg136 ?
                  reg121 : reg122))) : $unsigned($unsigned((wire137 * reg129)))));
      if ($signed({reg116,
          (({(8'hbe)} <<< (reg128 << wire120)) ?
              (+(-(8'hb2))) : ($unsigned((8'ha3)) * reg122))}))
        begin
          reg140 <= ($unsigned(wire135[(4'ha):(1'h1)]) ?
              reg130 : (wire113[(3'h5):(2'h3)] ?
                  (^~$unsigned($signed(reg123))) : $unsigned(reg126)));
          reg141 <= $unsigned(($signed((reg132 ?
                  (reg117 | reg117) : (^~reg121))) ?
              ((-((8'ha4) ? (8'had) : wire115)) ?
                  $signed(reg131[(3'h7):(3'h6)]) : ($unsigned(wire115) ?
                      reg126 : (reg126 ?
                          reg132 : wire135))) : ((reg117[(1'h0):(1'h0)] ?
                  reg128[(2'h3):(1'h0)] : (8'hbf)) < (8'ha2))));
          reg142 <= reg136;
          reg143 <= $unsigned(wire111[(4'hd):(3'h4)]);
        end
      else
        begin
          reg140 <= (wire135[(4'h8):(2'h2)] != ((($signed(reg139) ~^ {reg142}) ^~ $unsigned(((8'hb9) * reg116))) <<< {(~|$unsigned(wire120)),
              ({wire138} != (wire111 ? reg134 : reg143))}));
          reg141 <= ($signed($signed(($signed(wire113) ?
                  (reg129 ? wire133 : reg130) : reg140))) ?
              reg143[(2'h2):(1'h1)] : reg132);
          reg142 <= {(wire111 ?
                  $signed($signed((wire114 ?
                      reg134 : wire135))) : ((~^wire114[(3'h6):(1'h1)]) ?
                      $signed((reg134 ? reg125 : (8'hb3))) : reg127)),
              $signed((wire112 && wire119))};
          reg143 <= reg121;
        end
      reg144 <= $unsigned($signed((~$unsigned((reg125 ? (8'hb8) : (7'h40))))));
      reg145 <= (((reg136 <<< $signed($signed((8'hb6)))) & reg132[(1'h0):(1'h0)]) > $signed($unsigned($signed(reg121[(1'h0):(1'h0)]))));
      reg146 <= (($unsigned(reg127) ?
          {($unsigned(reg134) || reg136[(3'h4):(3'h4)]),
              $unsigned((wire113 <= wire115))} : (~(&$signed(wire137)))) + $signed((8'h9c)));
    end
  always
    @(posedge clk) begin
      reg147 <= $signed((reg128[(3'h6):(1'h0)] ?
          $unsigned($signed(wire111[(1'h1):(1'h1)])) : (reg134[(4'hd):(1'h1)] ?
              ((8'hb2) ? (reg118 < reg139) : {wire112, reg146}) : wire113)));
      reg148 <= reg125;
      reg149 <= reg139[(1'h1):(1'h1)];
      if (($signed(wire120[(4'hd):(1'h0)]) >= $signed($unsigned((+$unsigned(reg131))))))
        begin
          reg150 <= $unsigned((~|reg121));
          if (reg148)
            begin
              reg151 <= reg145[(2'h2):(2'h2)];
              reg152 <= $unsigned((7'h41));
            end
          else
            begin
              reg151 <= reg128;
              reg152 <= $unsigned(({$unsigned({reg134}),
                  (&(reg146 - reg128))} >> $signed((reg148 << $signed(reg152)))));
              reg153 <= $unsigned(($signed((reg134 ?
                  $unsigned(reg116) : $signed(wire114))) ~^ $unsigned(((-(8'hbd)) | reg130))));
              reg154 <= $unsigned($signed($signed(reg116[(3'h7):(2'h3)])));
            end
          reg155 <= (reg145 ?
              $signed(($unsigned($signed(reg121)) & $signed((~&(8'had))))) : (!{$unsigned((reg118 | (7'h42))),
                  reg148}));
          reg156 <= wire120;
          reg157 <= (reg127[(1'h0):(1'h0)] <<< $signed(reg151[(4'hf):(4'ha)]));
        end
      else
        begin
          reg150 <= $signed((8'h9f));
        end
      if ((reg150[(1'h1):(1'h0)] != {$signed(((~|reg126) ?
              (reg134 ? reg131 : (8'hac)) : {reg152, reg132})),
          $signed(((!reg155) != (-reg122)))}))
        begin
          reg158 <= wire138;
          reg159 <= ({(|{(reg152 || reg130), (|(8'hbf))})} + reg148);
          if (reg147[(4'ha):(2'h2)])
            begin
              reg160 <= reg136[(2'h3):(2'h2)];
              reg161 <= $signed($unsigned(($unsigned((reg134 >> reg154)) ^ reg128)));
              reg162 <= {reg117};
              reg163 <= (~(wire135[(4'hb):(2'h3)] ?
                  {(^$signed(reg126)),
                      ((reg160 | reg128) ?
                          ((7'h40) >= reg117) : $unsigned(wire113))} : wire114));
              reg164 <= ((~^($signed(((8'h9c) > reg145)) ?
                  $signed((wire113 ? reg117 : wire119)) : (!((7'h40) ?
                      reg140 : reg123)))) <<< wire115);
            end
          else
            begin
              reg160 <= $signed(reg145);
              reg161 <= (~((~{wire113, (|reg131)}) < $unsigned(reg144)));
              reg162 <= wire111;
            end
        end
      else
        begin
          reg158 <= $unsigned((reg146 || reg163));
          if ($signed((+wire115[(4'he):(3'h4)])))
            begin
              reg159 <= $signed((&$unsigned($unsigned((~^wire111)))));
              reg160 <= (!($unsigned(((reg156 || wire114) > wire137[(3'h4):(2'h2)])) ?
                  $unsigned((8'hb5)) : $unsigned(reg116[(3'h5):(2'h2)])));
              reg161 <= ((($signed((7'h42)) ?
                  $signed((|reg134)) : ((~&(8'hac)) ^~ reg116[(3'h4):(1'h1)])) ^ (^{reg141[(3'h6):(1'h0)]})) != $unsigned((((wire137 ?
                          wire112 : reg118) ?
                      (wire115 >>> (7'h42)) : $unsigned(reg140)) ?
                  $signed($unsigned(reg134)) : $unsigned(reg145))));
              reg162 <= $unsigned((8'ha1));
            end
          else
            begin
              reg159 <= (reg162 & $signed((((!reg126) | (reg156 ?
                  wire111 : reg160)) + ($unsigned(reg149) <= (reg121 ?
                  (8'hb9) : (8'hbe))))));
              reg160 <= reg160[(3'h5):(1'h1)];
              reg161 <= reg162[(3'h7):(3'h6)];
              reg162 <= (^($unsigned(wire111[(3'h5):(2'h3)]) + reg128));
            end
        end
    end
  assign wire165 = $signed($signed({$signed(((8'hbf) ? wire133 : reg156)),
                       $signed($signed(reg160))}));
endmodule

module module68
#(parameter param104 = ((|(7'h43)) + (8'ha5)), 
parameter param105 = (&{((param104 ^ param104) ? ((^param104) & (param104 ? param104 : param104)) : param104)}))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire72;
  input wire [(4'ha):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(4'hb):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg79 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg103,
                 reg98,
                 reg97,
                 reg96,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire73 = (^wire72);
  assign wire74 = (!wire73[(4'hf):(1'h0)]);
  assign wire75 = ($unsigned({$signed($signed((8'hb4))),
                          ((~^(8'hb3)) ?
                              (wire70 ^~ wire69) : $signed(wire69))}) ?
                      wire71[(3'h7):(3'h6)] : $signed($unsigned(wire69)));
  assign wire76 = (-wire71);
  assign wire77 = $unsigned((((wire74[(2'h3):(2'h2)] <= {(8'ha5)}) ?
                          (~|(wire70 == wire69)) : $unsigned((wire72 ?
                              wire71 : wire76))) ?
                      wire69 : ({(~&wire72), (wire70 ~^ wire73)} ?
                          {((8'hbb) - wire72)} : $signed(wire71))));
  assign wire78 = wire75[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg79 <= wire72;
      reg80 <= wire70;
      if ((wire77[(1'h0):(1'h0)] ?
          (wire70[(1'h0):(1'h0)] + $signed(wire78)) : reg80))
        begin
          reg81 <= $unsigned(((wire71 >= wire73[(4'hf):(3'h5)]) ?
              wire77[(4'ha):(1'h0)] : (+(-$unsigned((8'had))))));
          reg82 <= $signed((&$unsigned(($unsigned(wire78) << wire70))));
          reg83 <= $unsigned($signed((~&$signed((wire76 ^~ wire77)))));
          reg84 <= ($signed($unsigned($unsigned({(8'hb8),
              wire78}))) && (wire72[(5'h10):(3'h5)] ?
              reg79[(4'hc):(4'hb)] : (reg83 ?
                  (~(~wire71)) : reg83[(3'h7):(3'h6)])));
          reg85 <= $signed((8'hb5));
        end
      else
        begin
          reg81 <= $signed(($signed(reg81[(3'h6):(3'h6)]) ~^ (^({(8'hb1),
                  reg82} ?
              (wire73 ? (8'ha5) : wire76) : (~^(8'hbd))))));
        end
      reg86 <= wire72;
      reg87 <= $unsigned(($signed((((8'hb6) ^~ reg83) ?
          (^reg86) : (wire73 ? reg79 : wire71))) || reg80[(5'h11):(1'h0)]));
    end
  assign wire88 = (~^$unsigned(reg84));
  assign wire89 = (reg87[(3'h7):(2'h2)] & ($unsigned(reg80[(1'h1):(1'h1)]) ?
                      wire71 : (~(|(-reg80)))));
  assign wire90 = (~|wire89[(3'h7):(3'h6)]);
  assign wire91 = ((~(-((wire78 > reg80) ?
                      reg84[(1'h1):(1'h0)] : $unsigned(reg87)))) < (~|(wire72[(4'he):(1'h0)] == $unsigned({wire88}))));
  assign wire92 = $unsigned((wire76 || $signed(((wire78 ?
                      wire76 : reg83) && reg80[(5'h12):(4'h8)]))));
  assign wire93 = {(reg82 ?
                          ((^wire78) ?
                              {(wire76 << reg86), reg80} : $signed({wire73,
                                  (8'h9e)})) : wire71[(2'h3):(2'h3)])};
  assign wire94 = ((8'hb2) > (~|$signed($unsigned(reg85))));
  assign wire95 = wire89[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= $signed(wire73);
      reg97 <= (~|(wire70 & reg84[(3'h4):(3'h4)]));
      reg98 <= (((~(wire92 ?
              reg81[(5'h14):(3'h5)] : $unsigned(wire89))) | ($unsigned($unsigned(reg96)) >> wire69)) ?
          reg87 : ((!(+wire91[(4'h8):(3'h4)])) ?
              (($signed(wire93) ?
                      (wire95 ? wire91 : (8'hb2)) : wire88[(2'h2):(2'h2)]) ?
                  $signed(reg84[(3'h6):(1'h0)]) : ((wire76 ?
                      wire72 : (8'hb7)) < ((8'hac) <= wire95))) : ($signed($signed(reg85)) ?
                  (wire88 ? $signed(wire74) : (7'h44)) : wire77)));
    end
  assign wire99 = reg87[(4'h9):(2'h3)];
  assign wire100 = wire92[(2'h3):(1'h0)];
  assign wire101 = (wire69 <<< $unsigned(($unsigned((wire93 ^~ reg85)) ^ ($unsigned((8'hb6)) > reg98[(2'h2):(2'h2)]))));
  assign wire102 = wire101;
  always
    @(posedge clk) begin
      reg103 <= (!(&(reg87 ?
          $signed((wire88 != reg97)) : wire72[(1'h1):(1'h0)])));
    end
endmodule

module module19
#(parameter param65 = ((((((8'h9d) ? (8'ha3) : (8'ha3)) ? ((8'hba) ? (8'hba) : (8'hb1)) : (~(8'hbf))) << (((8'hb6) >> (8'h9e)) ? ((8'ha5) ? (8'hb6) : (8'h9f)) : ((8'haa) >>> (8'hb5)))) - ((((8'hb6) ? (8'hb9) : (8'ha0)) ? ((8'hb7) ? (8'ha7) : (8'ha7)) : ((8'hb8) ? (8'hac) : (8'ha1))) ^ (~&((8'hb3) ^ (8'hbc))))) ? ((7'h42) * (8'ha4)) : ((8'hbb) ? (-(&(^(8'ha2)))) : {(((8'hb5) ? (8'hb6) : (8'ha0)) || ((8'ha7) ? (8'hb6) : (7'h43))), {((8'hbf) & (8'h9e)), {(8'hb0), (8'ha6)}}})))
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(5'h12):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire39,
                 wire38,
                 wire27,
                 wire26,
                 wire25,
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
                 (1'h0)};
  assign wire25 = (^(|wire22));
  assign wire26 = ((wire20 < $signed(({wire25, wire20} ?
                          (wire23 != (8'hb8)) : (^wire23)))) ?
                      ($signed(wire24) <= ({(-wire23),
                          $signed(wire21)} | (|$signed((8'h9e))))) : $signed(wire24[(4'h8):(4'h8)]));
  assign wire27 = $signed($signed($unsigned(wire22[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg28 <= ($unsigned((~wire20)) ? wire24 : $signed(wire25[(4'ha):(3'h6)]));
      if ({($signed(((|wire25) ?
              (+(8'hae)) : (wire22 >> wire21))) || $signed((wire25[(4'hd):(4'hc)] ?
              (wire26 ? wire24 : wire20) : (^~wire23)))),
          $signed(wire25[(3'h4):(2'h3)])})
        begin
          reg29 <= $unsigned($unsigned({$signed(wire20), (8'hba)}));
          if ((~|wire21))
            begin
              reg30 <= (({wire24[(4'hd):(4'h9)]} ?
                      $signed(((wire27 && wire24) ?
                          wire23[(4'h8):(3'h6)] : {wire23,
                              wire26})) : (-((~^wire25) != ((8'hbc) ?
                          wire23 : wire26)))) ?
                  (!wire20) : {reg28[(3'h4):(1'h0)],
                      ($unsigned({wire21,
                          wire20}) + ($signed(wire25) <<< (^reg29)))});
              reg31 <= (($signed(((reg30 >> wire27) ?
                  $unsigned(wire22) : $unsigned(wire21))) - (($unsigned(reg29) - {wire24,
                      wire25}) ?
                  ((wire21 <<< reg29) ^~ $unsigned(wire22)) : $signed((reg30 <= (8'hb5))))) ^~ ($unsigned(wire23[(3'h4):(1'h0)]) || (+$unsigned($unsigned(wire26)))));
            end
          else
            begin
              reg30 <= wire20;
              reg31 <= $signed((!$unsigned(((wire26 >= wire27) ~^ (reg28 ?
                  wire27 : wire27)))));
            end
          reg32 <= reg30[(3'h5):(2'h3)];
        end
      else
        begin
          if ($signed((((-(~^(8'ha4))) << (wire21[(1'h0):(1'h0)] ?
              reg32 : $signed(wire27))) == $signed(wire20))))
            begin
              reg29 <= (|wire20);
              reg30 <= {$signed($unsigned(wire22[(4'h8):(3'h5)]))};
              reg31 <= reg28[(3'h6):(1'h0)];
              reg32 <= $unsigned($signed(((wire22[(3'h6):(3'h6)] < reg28) ?
                  wire25 : {(wire23 ^~ wire26), reg30})));
            end
          else
            begin
              reg29 <= $unsigned($signed(($unsigned((~^reg32)) ^ $signed({wire21}))));
              reg30 <= (!(($signed($signed(wire25)) | reg29[(3'h5):(3'h4)]) ?
                  $signed(wire21) : wire21[(1'h0):(1'h0)]));
              reg31 <= $unsigned(wire25[(4'h9):(1'h0)]);
            end
          reg33 <= wire27[(4'h8):(3'h4)];
          reg34 <= wire23;
        end
      reg35 <= reg29[(3'h4):(1'h1)];
      reg36 <= {{$signed(({(8'ha4)} <= $unsigned(reg32))),
              wire26[(3'h4):(3'h4)]}};
      reg37 <= $unsigned($signed(wire22));
    end
  assign wire38 = $signed(wire21);
  assign wire39 = (|(reg28 ? $unsigned((&(^~wire21))) : (~reg31)));
  always
    @(posedge clk) begin
      reg40 <= $signed(($signed({(reg35 & wire23), {wire38, reg31}}) ?
          reg30[(3'h7):(3'h5)] : reg30[(4'h8):(1'h0)]));
      if (wire22[(3'h6):(2'h2)])
        begin
          reg41 <= (wire20[(1'h1):(1'h0)] ?
              (((^((8'ha6) ?
                  wire25 : reg30)) + (~&(|wire22))) << ({(wire21 ^~ wire38)} ?
                  wire39 : wire26)) : (reg37[(4'h8):(1'h1)] ?
                  (~reg37) : $unsigned($unsigned(reg40[(3'h5):(1'h1)]))));
          if ((&wire20[(1'h0):(1'h0)]))
            begin
              reg42 <= (^~wire24[(4'ha):(3'h4)]);
              reg43 <= (reg30[(3'h6):(2'h2)] < (~|$signed(reg42)));
              reg44 <= (reg32[(4'he):(2'h2)] ? wire38[(4'h9):(3'h5)] : reg31);
            end
          else
            begin
              reg42 <= $unsigned($unsigned(wire20));
              reg43 <= wire21;
              reg44 <= (reg40 != ((wire22[(3'h5):(2'h2)] < (wire21 ?
                      (!reg29) : (reg36 <= reg44))) ?
                  wire24[(5'h11):(4'hd)] : {$signed($unsigned(reg36))}));
              reg45 <= $unsigned($signed((((8'ha3) ?
                      $signed(reg37) : $signed(reg35)) ?
                  $unsigned((wire25 & reg35)) : reg35)));
            end
          reg46 <= $signed(reg40[(3'h5):(3'h4)]);
          if ((8'ha2))
            begin
              reg47 <= ($unsigned(($unsigned((8'hac)) ?
                  ($unsigned(wire22) ^ (wire23 ?
                      wire25 : reg41)) : ($unsigned(wire23) >> reg40))) > (+(wire25[(4'ha):(2'h3)] ?
                  ($unsigned(wire24) < wire24) : reg45)));
              reg48 <= wire38;
              reg49 <= $signed(reg34);
            end
          else
            begin
              reg47 <= (^{(reg30 ? reg34[(3'h7):(3'h5)] : wire38),
                  $signed($unsigned((8'hb4)))});
              reg48 <= (reg49[(2'h2):(2'h2)] - wire27[(4'he):(1'h0)]);
              reg49 <= reg32;
            end
        end
      else
        begin
          reg41 <= (reg41 ?
              reg41[(1'h0):(1'h0)] : $signed(reg40[(3'h7):(3'h7)]));
          if ((~&(((reg37 & (reg40 < reg29)) ?
              ($unsigned(wire26) << {wire25}) : ($unsigned((8'ha0)) - (&reg33))) || $signed($unsigned(reg35[(1'h1):(1'h1)])))))
            begin
              reg42 <= $unsigned((~^(8'hbc)));
              reg43 <= ($signed(reg29) ?
                  $unsigned((reg44 ?
                      (8'hbb) : {$unsigned(wire27)})) : (+(~&(wire24[(1'h1):(1'h0)] ?
                      reg37 : {reg30, reg46}))));
            end
          else
            begin
              reg42 <= $signed(((^((~&(8'hab)) << (wire25 + reg49))) >> (({reg43,
                          reg44} ?
                      (wire24 ? reg36 : wire27) : ((8'hbc) ? reg43 : reg47)) ?
                  {$unsigned(reg45)} : (~^$signed(wire20)))));
              reg43 <= $unsigned((reg37 ?
                  {{{reg44}, ((8'ha0) * (8'h9c))}} : wire26[(3'h4):(1'h1)]));
              reg44 <= $unsigned($signed((reg31[(1'h0):(1'h0)] ?
                  {$signed((8'haa))} : {(~&(8'h9c))})));
            end
          reg45 <= {(8'hb4)};
          reg46 <= $signed($signed(reg40[(3'h5):(1'h1)]));
        end
      reg50 <= $signed($signed($signed($signed(reg48[(1'h0):(1'h0)]))));
      if ((^(!(((reg41 >= reg33) ? wire38[(2'h2):(1'h1)] : $signed(wire21)) ?
          $unsigned(reg43) : $signed({reg32})))))
        begin
          reg51 <= (-reg28[(3'h4):(2'h2)]);
          reg52 <= (((~&((|reg35) ? $signed(reg41) : (reg46 && reg44))) ?
                  wire24[(5'h10):(4'hd)] : (($unsigned(wire22) ?
                      reg30 : reg49) << wire25)) ?
              $signed({reg40}) : $unsigned((8'ha3)));
          reg53 <= (((~^$signed($unsigned(wire39))) ?
              (($signed(reg42) ? ((7'h43) ? wire23 : (7'h42)) : (^reg49)) ?
                  reg50 : (!reg36)) : (((~reg44) ?
                      (wire23 ? reg52 : reg37) : {wire26, reg35}) ?
                  ($signed(reg51) ?
                      (^~reg51) : $signed(reg44)) : (!(-reg52)))) && {reg42,
              ((8'had) << reg28)});
          reg54 <= reg37;
        end
      else
        begin
          reg51 <= ((~|{$signed((8'ha2))}) ?
              reg33[(3'h7):(1'h0)] : (^~((^$signed(reg32)) ?
                  ($unsigned(reg28) ?
                      reg40 : $signed(reg43)) : reg33[(3'h7):(2'h2)])));
          reg52 <= {reg43};
          reg53 <= reg53[(2'h3):(1'h0)];
        end
    end
  assign wire55 = reg34[(4'h9):(2'h3)];
  assign wire56 = ((&$signed(reg54[(3'h6):(3'h6)])) ?
                      (-$signed((wire55 <= (reg50 || wire22)))) : reg49[(1'h0):(1'h0)]);
  assign wire57 = (|(8'hb2));
  assign wire58 = (|(~wire21));
  assign wire59 = (&(($unsigned((8'h9c)) ^ (~wire26)) ?
                      $unsigned($signed((reg37 - reg31))) : (wire27[(3'h6):(1'h0)] ?
                          reg49 : (wire20[(1'h1):(1'h0)] ?
                              (wire22 ? wire58 : (8'hb7)) : $signed(wire56)))));
  assign wire60 = $unsigned((wire38 || $signed($signed((reg41 ?
                      wire23 : reg33)))));
  assign wire61 = (+{reg40, {$signed($unsigned(reg30))}});
  assign wire62 = reg44[(2'h3):(2'h3)];
  assign wire63 = $unsigned({(wire62[(2'h3):(1'h0)] ?
                          reg45[(3'h6):(2'h3)] : reg44),
                      $signed(wire59[(4'hb):(2'h2)])});
  assign wire64 = (&$signed($signed(reg44)));
endmodule
