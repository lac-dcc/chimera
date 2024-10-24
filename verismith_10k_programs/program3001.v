module top
#(parameter param245 = (((((|(8'ha4)) ? ((8'h9e) == (8'hbd)) : (~(8'hb2))) ? (~^((8'hb5) <= (8'ha3))) : {((8'ha8) ? (8'hac) : (8'hb2)), (8'hb0)}) ? (~|((!(7'h44)) < ((7'h43) ? (8'hbc) : (8'hb9)))) : ((((7'h41) || (8'h9f)) ? ((8'hbd) ? (8'hae) : (8'ha4)) : (~(8'haf))) ? (|(~^(8'had))) : (-(+(8'hb6))))) ? (&{((8'hac) | ((8'h9c) ? (8'hbb) : (7'h44))), ({(8'hbc)} >= ((8'hbb) ~^ (8'hbb)))}) : ((((~^(8'h9f)) ? (~&(8'hbb)) : ((8'ha2) ^~ (7'h44))) >= {((8'h9d) < (8'ha0)), ((8'ha9) < (8'ha8))}) ? ({(7'h42), (~(8'ha3))} ? {(+(8'haf)), {(8'hb2), (7'h40)}} : (~&((8'haa) >>> (8'hba)))) : {(~^((8'hb5) * (8'ha9))), (8'ha2)})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire243;
  wire signed [(3'h7):(1'h0)] wire242;
  wire signed [(3'h5):(1'h0)] wire241;
  wire signed [(2'h2):(1'h0)] wire240;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire233;
  wire [(4'h9):(1'h0)] wire235;
  wire [(5'h14):(1'h0)] wire236;
  wire signed [(2'h3):(1'h0)] wire237;
  wire [(3'h7):(1'h0)] wire238;
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  assign y = {wire243,
                 wire242,
                 wire241,
                 wire240,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire20,
                 wire233,
                 wire235,
                 wire236,
                 wire237,
                 wire238,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire5 = {{wire1[(1'h1):(1'h1)], wire3[(5'h13):(4'h9)]}};
  assign wire6 = (wire2 || $unsigned($unsigned(((wire0 ?
                     wire3 : wire4) << (7'h43)))));
  assign wire7 = ((^~$unsigned(((wire1 > wire3) ?
                         ((8'h9d) << wire4) : wire3[(2'h3):(2'h3)]))) ?
                     wire6 : (({wire3[(3'h4):(1'h1)],
                                 (wire3 ? (8'ha9) : wire5)} ?
                             {(wire0 ? wire5 : wire0)} : wire3) ?
                         ($signed(wire1[(3'h4):(3'h4)]) ?
                             wire6 : wire3[(4'h9):(3'h4)]) : $unsigned(wire6[(1'h0):(1'h0)])));
  assign wire8 = wire0[(3'h5):(3'h5)];
  assign wire9 = wire8;
  assign wire10 = ((7'h44) ? $signed($signed(wire1[(1'h0):(1'h0)])) : (8'ha6));
  assign wire11 = wire8[(3'h4):(1'h0)];
  assign wire12 = (wire0 < {(-{(wire10 + wire6)})});
  assign wire13 = wire12[(3'h5):(3'h4)];
  assign wire14 = $signed(($unsigned({$unsigned(wire10)}) ?
                      wire8[(5'h13):(4'he)] : (({wire5} ^ (~wire0)) > ($unsigned(wire11) ~^ wire12[(1'h1):(1'h0)]))));
  assign wire15 = {(^$unsigned({((8'hb6) ? wire10 : wire1),
                          wire2[(1'h1):(1'h1)]}))};
  assign wire16 = $unsigned((!((~|wire13) ?
                      ($unsigned(wire7) < (8'hba)) : $unsigned({(8'ha5)}))));
  always
    @(posedge clk) begin
      reg17 <= ($unsigned(((!$signed(wire8)) ?
          (~$signed(wire11)) : (|(wire6 ?
              wire4 : wire13)))) << (wire4[(1'h0):(1'h0)] ?
          wire12 : wire15[(2'h3):(1'h1)]));
      reg18 <= $unsigned(wire15[(3'h5):(1'h0)]);
      reg19 <= $signed((^~$signed(((-(8'ha0)) ?
          wire1[(1'h0):(1'h0)] : wire2))));
    end
  assign wire20 = ((^~((-(8'hb8)) ?
                          (&((8'hae) > wire9)) : (-(wire10 ?
                              reg18 : (8'ha4))))) ?
                      (7'h44) : (!wire3[(5'h10):(2'h2)]));
  module21 #() modinst234 (wire233, clk, wire9, wire1, wire16, wire15);
  assign wire235 = $signed(((wire14[(1'h1):(1'h0)] ~^ $unsigned((reg19 ?
                       wire15 : reg18))) <= wire1[(3'h4):(2'h3)]));
  assign wire236 = wire2;
  assign wire237 = (reg18[(1'h1):(1'h0)] >= (~&((&(wire5 & wire2)) ?
                       ($unsigned(reg17) ^~ wire4[(4'hb):(3'h6)]) : (^~(~wire6)))));
  module174 #() modinst239 (wire238, clk, wire14, wire236, wire5, wire233, wire15);
  assign wire240 = {(($signed(wire9[(4'h9):(4'h8)]) ?
                               wire8[(4'hb):(2'h3)] : (wire0[(3'h4):(1'h1)] ~^ $signed(wire14))) ?
                           wire0[(2'h2):(1'h0)] : $signed((|wire16))),
                       $unsigned($unsigned((~^wire1[(4'he):(1'h1)])))};
  assign wire241 = wire235;
  assign wire242 = (^(wire20[(1'h0):(1'h0)] - $unsigned(wire13[(3'h4):(3'h4)])));
  module21 #() modinst244 (.wire24(wire0), .wire22(wire16), .clk(clk), .wire25(wire236), .y(wire243), .wire23(wire6));
endmodule

module module21
#(parameter param231 = ((((((8'h9f) ? (7'h44) : (8'ha1)) ~^ (+(8'hb6))) ? ((8'had) ? ((8'hbd) ? (8'h9c) : (8'hac)) : ((7'h42) ? (8'ha7) : (8'hb1))) : ({(8'hb2), (8'haa)} >> (~(8'hbe)))) ? (&(((8'ha7) ~^ (8'had)) || ((7'h41) ? (8'ha8) : (8'ha1)))) : (~|(((8'hab) <= (8'hae)) ? {(8'ha6), (8'ha5)} : ((8'hbc) != (8'hac))))) ? (8'hbb) : (((((8'ha7) > (8'ha2)) ? ((8'hbd) ? (8'hac) : (8'hb6)) : (!(8'h9d))) ^ {(8'h9c)}) + {{(+(8'h9d)), {(8'hba)}}, ((~^(8'hbf)) ~^ ((8'ha7) >> (7'h42)))})), 
parameter param232 = (param231 ? (~&(^~(+((8'hbf) >>> param231)))) : ({{((8'hbc) ^ param231)}, (((8'haa) * param231) > (+(8'hab)))} ? {(+param231), (+param231)} : {param231, param231})))
(y, clk, wire22, wire23, wire24, wire25);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire229;
  wire signed [(4'h8):(1'h0)] wire228;
  wire [(4'he):(1'h0)] wire224;
  wire signed [(3'h5):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire201;
  wire [(4'hd):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire203;
  wire [(2'h2):(1'h0)] wire221;
  reg signed [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg225 = (1'h0);
  reg [(5'h12):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg227 = (1'h0);
  assign y = {wire229,
                 wire228,
                 wire224,
                 wire223,
                 wire201,
                 wire173,
                 wire171,
                 wire119,
                 wire118,
                 wire117,
                 wire108,
                 wire107,
                 wire26,
                 wire63,
                 wire105,
                 wire203,
                 wire221,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg225,
                 reg226,
                 reg227,
                 (1'h0)};
  assign wire26 = ($signed($unsigned($unsigned(wire25[(1'h0):(1'h0)]))) >= ($signed(((wire25 >= wire23) ?
                          wire25 : (wire25 - wire24))) ?
                      (!{((8'ha8) >= wire24)}) : (((&(8'hb3)) ?
                              $signed(wire22) : $signed((8'ha8))) ?
                          $signed($unsigned(wire25)) : $signed((wire24 ?
                              wire22 : wire24)))));
  module27 #() modinst64 (wire63, clk, wire24, wire26, wire22, wire23);
  module65 #() modinst106 (wire105, clk, wire23, wire22, wire25, wire63, wire26);
  assign wire107 = ((|(8'ha0)) ?
                       (~&($unsigned(wire24[(3'h7):(1'h1)]) <= ($unsigned(wire23) ?
                           $signed(wire105) : (wire23 | wire23)))) : (!(~&(^wire25[(2'h2):(1'h1)]))));
  assign wire108 = wire25[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ({(wire107 + (+wire63[(3'h6):(2'h3)])),
          $signed($unsigned(((wire26 ?
              (8'ha7) : wire22) <<< $signed((8'hb3)))))})
        begin
          if ((((($unsigned(wire22) ?
                  $signed(wire22) : ((8'hb6) ?
                      wire107 : wire24)) >> (~|$unsigned(wire22))) && wire63[(5'h10):(4'hc)]) ?
              (($unsigned((wire23 | (8'hb6))) > $signed((|wire24))) ?
                  $signed((!wire108[(2'h2):(2'h2)])) : wire26) : ($unsigned(((-wire24) >> wire63[(4'hc):(1'h1)])) >> wire107[(1'h0):(1'h0)])))
            begin
              reg109 <= (+$unsigned((wire22[(3'h4):(2'h2)] ?
                  wire25[(3'h5):(1'h0)] : $signed(wire107[(5'h10):(1'h1)]))));
              reg110 <= (&($signed($signed((~|wire107))) ?
                  wire108 : ({{(8'ha8),
                          wire63}} >= $unsigned($signed(wire24)))));
              reg111 <= $signed($signed((~wire22)));
              reg112 <= (wire25 <= wire108);
            end
          else
            begin
              reg109 <= $unsigned((^~$signed($unsigned(wire105))));
              reg110 <= ({$unsigned(wire105[(1'h0):(1'h0)]),
                  $unsigned($unsigned((&reg111)))} && (~$unsigned(($unsigned(wire63) >> $unsigned(wire107)))));
              reg111 <= (reg112 ?
                  wire107 : ({$signed((wire23 ?
                          reg109 : wire25))} >> $signed(wire63[(4'hf):(4'h9)])));
            end
        end
      else
        begin
          reg109 <= (reg111[(3'h4):(3'h4)] ?
              ((~|(wire26 > (wire26 ?
                  wire63 : (8'ha1)))) ~^ (reg109[(1'h0):(1'h0)] ?
                  reg111 : {reg109,
                      (reg112 ?
                          (8'ha2) : wire25)})) : $signed(($signed((+wire108)) * {(reg110 > wire22),
                  {wire108}})));
          reg110 <= $unsigned((wire22[(3'h5):(2'h3)] * $signed($unsigned($unsigned(reg109)))));
        end
      if ((|{$unsigned($signed((wire22 >> wire63)))}))
        begin
          reg113 <= wire22[(3'h4):(3'h4)];
          reg114 <= ((~|(((~wire105) + (~&reg113)) ?
              ({reg110} ^ $unsigned(wire23)) : {(~&wire108),
                  (wire25 >= (8'hb7))})) - ($unsigned(reg113) ?
              wire22 : $signed((~&$unsigned(reg110)))));
        end
      else
        begin
          reg113 <= wire24;
          reg114 <= wire25;
          reg115 <= wire26;
        end
      reg116 <= $signed((^(&{(8'h9e), reg110[(2'h3):(1'h0)]})));
    end
  assign wire117 = ((reg111[(3'h7):(3'h4)] & wire107) != reg109);
  assign wire118 = reg109;
  assign wire119 = {$unsigned((!$unsigned((wire108 ? reg109 : reg110)))),
                       (($unsigned($unsigned(wire25)) || reg115[(4'he):(2'h3)]) ?
                           $signed($unsigned((-wire24))) : {((!reg114) <= $signed(wire25))})};
  always
    @(posedge clk) begin
      reg120 <= $unsigned(wire119[(4'hb):(4'h8)]);
      reg121 <= (reg111[(4'h9):(4'h9)] >>> reg113[(1'h1):(1'h0)]);
      reg122 <= $signed(reg112);
      reg123 <= $signed($unsigned($signed($signed((|reg109)))));
      reg124 <= ((^~reg111) ? {(-reg111)} : (^reg122[(4'h9):(2'h2)]));
    end
  module125 #() modinst172 (.wire127(wire26), .wire129(reg120), .wire128(reg114), .y(wire171), .clk(clk), .wire130(wire105), .wire126(reg109));
  assign wire173 = $signed((8'ha1));
  module174 #() modinst202 (.clk(clk), .wire175(wire26), .wire176(reg111), .y(wire201), .wire177(reg121), .wire178(wire105), .wire179(wire173));
  assign wire203 = wire173[(1'h0):(1'h0)];
  module204 #() modinst222 (wire221, clk, reg113, wire22, wire117, reg112, wire26);
  assign wire223 = {((wire221[(2'h2):(1'h0)] ?
                               ((~&wire201) >>> (wire118 ?
                                   reg124 : reg114)) : {$signed(wire171)}) ?
                           $signed(((-wire171) != wire171[(1'h0):(1'h0)])) : $unsigned(({reg122,
                               reg123} || {reg112, (7'h40)})))};
  assign wire224 = reg115;
  always
    @(posedge clk) begin
      reg225 <= reg113;
      reg226 <= wire173[(2'h3):(2'h2)];
      reg227 <= $unsigned(wire24[(5'h10):(4'hc)]);
    end
  assign wire228 = $signed((8'hac));
  module125 #() modinst230 (.wire129(wire25), .wire130(reg116), .wire127(reg111), .y(wire229), .clk(clk), .wire126(wire105), .wire128(reg115));
endmodule

module module204  (y, clk, wire209, wire208, wire207, wire206, wire205);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire209;
  input wire signed [(4'hb):(1'h0)] wire208;
  input wire signed [(5'h11):(1'h0)] wire207;
  input wire [(4'hb):(1'h0)] wire206;
  input wire [(3'h6):(1'h0)] wire205;
  wire signed [(3'h5):(1'h0)] wire220;
  wire [(4'h9):(1'h0)] wire216;
  wire [(4'h9):(1'h0)] wire215;
  wire [(2'h2):(1'h0)] wire214;
  wire signed [(4'he):(1'h0)] wire213;
  wire [(4'he):(1'h0)] wire212;
  wire [(4'hc):(1'h0)] wire211;
  wire [(5'h15):(1'h0)] wire210;
  reg [(2'h2):(1'h0)] reg219 = (1'h0);
  reg [(3'h4):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg217 = (1'h0);
  assign y = {wire220,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 reg219,
                 reg218,
                 reg217,
                 (1'h0)};
  assign wire210 = (8'ha3);
  assign wire211 = (|wire205);
  assign wire212 = wire207;
  assign wire213 = (wire205[(1'h1):(1'h1)] ?
                       $unsigned(wire209) : $signed((&wire208[(4'h8):(1'h1)])));
  assign wire214 = (wire213 ?
                       ($unsigned(wire206) ?
                           wire213 : wire210) : $signed(($signed(wire210) * (~|(&wire206)))));
  assign wire215 = {$unsigned(((&{(8'hbb)}) - $unsigned(wire214[(1'h0):(1'h0)]))),
                       {wire212,
                           ($unsigned((wire213 ^ (8'ha2))) ^~ (^~$signed((7'h40))))}};
  assign wire216 = wire215[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg217 <= (^{wire212[(3'h4):(3'h4)], $unsigned($unsigned(wire207))});
      reg218 <= (wire212[(4'hb):(3'h5)] ? wire208 : $unsigned(wire210));
      reg219 <= $signed(((|(wire206 + (7'h41))) ?
          ($unsigned(reg218) << $unsigned(wire207)) : wire208[(3'h5):(1'h0)]));
    end
  assign wire220 = wire216[(1'h0):(1'h0)];
endmodule

module module174  (y, clk, wire179, wire178, wire177, wire176, wire175);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire179;
  input wire [(4'hc):(1'h0)] wire178;
  input wire [(5'h11):(1'h0)] wire177;
  input wire [(5'h13):(1'h0)] wire176;
  input wire [(3'h5):(1'h0)] wire175;
  wire [(5'h15):(1'h0)] wire200;
  wire signed [(5'h14):(1'h0)] wire199;
  wire [(2'h2):(1'h0)] wire198;
  wire signed [(5'h12):(1'h0)] wire191;
  wire signed [(4'hc):(1'h0)] wire190;
  wire [(3'h4):(1'h0)] wire188;
  wire signed [(4'hd):(1'h0)] wire187;
  wire signed [(3'h7):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  reg [(3'h5):(1'h0)] reg197 = (1'h0);
  reg [(5'h15):(1'h0)] reg196 = (1'h0);
  reg [(3'h5):(1'h0)] reg195 = (1'h0);
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg189 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire191,
                 wire190,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg189,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg180 <= (~$unsigned(wire178[(3'h5):(2'h2)]));
      if (wire178)
        begin
          if (({$unsigned(wire178[(4'hc):(2'h2)]),
              wire179} || (wire177[(4'hd):(4'h8)] ?
              $signed((!reg180[(3'h5):(2'h2)])) : reg180[(2'h2):(2'h2)])))
            begin
              reg181 <= wire175[(3'h5):(2'h2)];
              reg182 <= ((^~$unsigned(wire175)) >>> reg180[(2'h3):(2'h2)]);
              reg183 <= ((!({wire175, (wire176 <= reg180)} ?
                  ({wire176, wire176} & (reg182 ?
                      wire176 : wire175)) : $unsigned($signed(reg182)))) * $signed((~^{$signed(wire175)})));
            end
          else
            begin
              reg181 <= (reg182 ? reg180 : wire178[(4'h9):(3'h4)]);
            end
        end
      else
        begin
          reg181 <= $unsigned($signed(($signed($unsigned(wire179)) <= $signed($unsigned(wire179)))));
        end
      reg184 <= (((wire175 || $unsigned((reg183 ?
          wire179 : wire177))) + ($signed(wire176[(4'hf):(4'ha)]) ?
          reg180 : (wire175[(3'h4):(2'h3)] ?
              wire178[(3'h4):(1'h0)] : reg183[(1'h1):(1'h1)]))) + (^({wire175,
              (~^(8'h9c))} ?
          $unsigned(reg181[(3'h5):(1'h1)]) : reg182)));
    end
  assign wire185 = $unsigned(wire178);
  assign wire186 = (7'h44);
  assign wire187 = reg184[(2'h3):(1'h1)];
  assign wire188 = ((~|{$signed((reg183 ? wire179 : wire187)),
                           ((reg182 ? reg183 : wire178) <<< (-wire187))}) ?
                       (^~(8'hb8)) : ({(^~$unsigned((8'hac)))} + (&($signed((8'ha7)) >> $unsigned(reg181)))));
  always
    @(posedge clk) begin
      reg189 <= $signed($unsigned($signed(wire185[(5'h14):(5'h10)])));
    end
  assign wire190 = ({wire177[(4'h9):(2'h3)],
                       $signed(((!reg183) <<< wire187))} >= wire186[(1'h0):(1'h0)]);
  assign wire191 = $signed((-($unsigned($signed(wire185)) >= ((~|(8'hb8)) + (reg182 == wire187)))));
  always
    @(posedge clk) begin
      reg192 <= $signed((reg189[(3'h6):(1'h1)] ?
          {$unsigned($unsigned((8'hb9))), (8'h9c)} : $signed(((wire178 ?
              reg189 : wire188) - (wire190 <<< wire177)))));
      if ({((((reg184 ? wire188 : wire179) ^~ $unsigned(wire190)) ?
                  wire191[(3'h5):(1'h0)] : wire190[(1'h1):(1'h1)]) ?
              $signed($signed(((8'h9c) ?
                  wire185 : reg181))) : (!$signed($unsigned(reg181))))})
        begin
          if (wire185[(4'h8):(1'h1)])
            begin
              reg193 <= $unsigned((wire187[(4'hb):(3'h4)] <= (8'hb5)));
              reg194 <= $signed($unsigned((|wire186)));
            end
          else
            begin
              reg193 <= wire190;
              reg194 <= reg181;
            end
        end
      else
        begin
          if ((^~$unsigned(wire188[(1'h1):(1'h0)])))
            begin
              reg193 <= ($signed(wire176[(5'h11):(3'h7)]) ? {reg182} : (8'ha2));
              reg194 <= reg193[(4'hb):(2'h3)];
              reg195 <= $unsigned($unsigned(($unsigned(wire186[(3'h6):(2'h2)]) ?
                  wire185[(4'ha):(2'h2)] : $signed(wire175[(2'h3):(2'h2)]))));
              reg196 <= ((!$signed($unsigned({(8'hbc)}))) ?
                  wire191 : $unsigned($signed(((&wire179) >= wire188[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg193 <= (|$unsigned(reg193[(4'h9):(4'h9)]));
              reg194 <= reg194;
              reg195 <= $signed($unsigned(reg193));
              reg196 <= (|$unsigned(({wire175,
                  ((8'hb8) ? reg180 : (7'h42))} + reg189)));
              reg197 <= wire190;
            end
        end
    end
  assign wire198 = ($signed((7'h44)) ?
                       (wire186[(3'h4):(1'h0)] != $unsigned((&(!(8'hac))))) : ((~&$unsigned($signed(wire186))) <<< (8'ha8)));
  assign wire199 = ((wire179 < reg194[(3'h5):(1'h0)]) >> $signed(((wire187[(4'hc):(1'h1)] ?
                       $unsigned(reg196) : reg183) || ($unsigned((8'ha3)) ?
                       (reg184 << wire185) : $signed(wire179)))));
  assign wire200 = (^$signed($unsigned(reg196[(5'h11):(5'h10)])));
endmodule

module module125
#(parameter param169 = {(8'hb1)}, 
parameter param170 = {(+(!param169))})
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire130;
  input wire signed [(3'h7):(1'h0)] wire129;
  input wire signed [(4'hd):(1'h0)] wire128;
  input wire [(4'h8):(1'h0)] wire127;
  input wire signed [(2'h2):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  wire signed [(4'h9):(1'h0)] wire158;
  wire [(4'ha):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(2'h3):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire [(3'h4):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire138;
  wire signed [(4'h8):(1'h0)] wire137;
  wire signed [(5'h11):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  assign y = {wire168,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
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
                 (1'h0)};
  assign wire131 = (((wire129 ?
                           wire130[(2'h3):(1'h0)] : ((^(8'h9e)) >>> (~^wire128))) ~^ (|((wire129 ?
                               wire127 : wire128) ?
                           $signed(wire129) : $signed((8'ha0))))) ?
                       ($unsigned(wire129) ?
                           (((wire126 ?
                                   wire127 : wire130) || (wire130 <= wire130)) ?
                               ($unsigned(wire126) * $unsigned(wire129)) : wire128[(4'hc):(3'h4)]) : $signed($signed((wire127 ?
                               wire128 : wire129)))) : ($unsigned($signed(((7'h40) ?
                               wire130 : wire127))) ?
                           (^(~&wire128)) : (((wire130 ? wire126 : wire129) ?
                                   (wire130 != wire126) : $unsigned((8'hab))) ?
                               wire126 : $unsigned((+(8'hb5))))));
  assign wire132 = (((^~wire130) ?
                       $signed($signed((wire126 <= wire131))) : wire129[(1'h0):(1'h0)]) << ($signed((^~$unsigned(wire128))) ?
                       wire126[(1'h0):(1'h0)] : $signed({$unsigned(wire130)})));
  assign wire133 = wire130[(4'h9):(3'h4)];
  assign wire134 = ($signed(wire131[(4'he):(3'h7)]) >>> wire127);
  assign wire135 = (8'hbb);
  assign wire136 = wire133[(4'hf):(2'h2)];
  assign wire137 = (wire128[(4'hb):(1'h1)] ? wire128 : $unsigned(wire135));
  assign wire138 = ($unsigned($unsigned((+wire131))) >>> $signed({wire132,
                       wire128}));
  always
    @(posedge clk) begin
      reg139 <= wire137;
      if (wire132[(4'h8):(2'h3)])
        begin
          if (wire138[(3'h6):(1'h1)])
            begin
              reg140 <= (~(wire131 ?
                  $unsigned(wire130[(1'h1):(1'h1)]) : ({(8'hbc)} ?
                      (8'hb3) : wire136)));
              reg141 <= ($unsigned(wire126[(1'h1):(1'h0)]) ^ wire132);
              reg142 <= wire137;
              reg143 <= $signed($unsigned($signed($unsigned(wire131[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg140 <= wire136[(4'hc):(3'h4)];
              reg141 <= {($unsigned(((!wire126) ?
                          $signed(wire130) : $unsigned(wire130))) ?
                      wire132[(2'h3):(1'h1)] : ($signed($unsigned(wire130)) - (((7'h44) ?
                          wire136 : reg142) ^ ((8'hb5) ? (8'ha9) : (8'hb2)))))};
              reg142 <= (((($signed(wire138) == reg141) ?
                      {wire126[(2'h2):(1'h1)], wire127} : {wire135, wire132}) ?
                  $unsigned(reg140) : ((((8'ha5) ?
                          wire126 : reg139) * $unsigned(reg141)) ?
                      (|reg139) : $unsigned($unsigned(reg143)))) ^~ (~|(wire132 || (((8'hb5) ^~ wire135) ?
                  $unsigned((8'hb6)) : reg141[(2'h2):(2'h2)]))));
              reg143 <= {wire130[(3'h5):(3'h5)], (&(~^wire134))};
              reg144 <= wire133;
            end
          if ($signed(($signed(((wire131 <<< (8'hb8)) < ((8'h9c) ?
                  reg139 : wire126))) ?
              $signed(($signed((8'hae)) ?
                  $signed(reg139) : (~|reg140))) : (8'ha5))))
            begin
              reg145 <= ($unsigned({(reg143[(1'h0):(1'h0)] ?
                          (reg140 ? wire127 : reg143) : $unsigned(wire128))}) ?
                  (~(reg141[(1'h0):(1'h0)] ?
                      ((wire137 ? reg144 : (8'hbc)) ?
                          ((8'hac) >>> wire127) : {wire129}) : ((8'h9d) ?
                          wire132 : $signed(reg140)))) : (~$unsigned($signed($unsigned(wire131)))));
              reg146 <= (~^{$signed(reg142)});
            end
          else
            begin
              reg145 <= (+(~({(reg139 ?
                      wire132 : (7'h41))} ~^ $signed((8'ha9)))));
              reg146 <= wire129;
              reg147 <= ($unsigned(reg146[(3'h5):(3'h4)]) <<< wire138[(3'h4):(1'h0)]);
            end
          reg148 <= (($signed((&wire127[(2'h2):(1'h0)])) ?
                  $signed(((^~wire136) ?
                      $signed(reg142) : $signed(wire132))) : (((reg147 + wire126) ?
                          reg140 : wire138[(4'hc):(3'h7)]) ?
                      $signed(reg144[(3'h5):(3'h4)]) : {(^reg143),
                          $signed(wire135)})) ?
              $unsigned(($unsigned(wire134[(3'h6):(2'h3)]) == $unsigned($unsigned((8'h9f))))) : ($signed(((8'ha2) - $unsigned((8'ha5)))) ?
                  $signed((~wire132)) : (reg145[(3'h7):(2'h3)] ^~ ($signed(reg139) ^~ wire129))));
          reg149 <= (~|((|wire134) ?
              reg148[(5'h11):(4'hc)] : $signed($signed((!reg144)))));
          reg150 <= wire127;
        end
      else
        begin
          reg140 <= wire126;
          reg141 <= $unsigned($signed((~|((!wire132) + $signed(reg150)))));
          reg142 <= (wire138[(1'h0):(1'h0)] != (~|((wire129[(3'h5):(1'h1)] ?
              (wire135 ? wire135 : wire133) : $signed(reg146)) >> reg148)));
          reg143 <= ($unsigned({({wire130} ?
                  (wire131 ? reg147 : wire135) : $signed(reg150)),
              ($unsigned((8'h9f)) ?
                  (-(8'had)) : {wire129,
                      wire136})}) ^ ((+($signed(wire130) << $unsigned(wire134))) >> (reg150 ?
              wire133[(4'hc):(4'h9)] : (!(wire130 ? wire132 : reg146)))));
        end
    end
  assign wire151 = (wire135 ? wire136 : wire134[(2'h3):(1'h1)]);
  assign wire152 = $unsigned($signed($signed((|(reg140 ? reg146 : wire126)))));
  assign wire153 = {{reg145[(1'h1):(1'h1)]}};
  assign wire154 = ((~|(8'hb8)) ?
                       wire135[(4'hc):(4'h9)] : (&(wire129 ?
                           reg146[(2'h3):(2'h3)] : reg140[(1'h1):(1'h1)])));
  assign wire155 = ((8'h9f) ?
                       {wire133,
                           ($unsigned(wire134) ?
                               wire152[(2'h2):(2'h2)] : $unsigned(reg148))} : $signed($signed(reg145)));
  assign wire156 = {wire151, wire154};
  assign wire157 = reg141[(3'h7):(1'h1)];
  assign wire158 = ($unsigned(wire137) ? reg144[(3'h6):(3'h6)] : wire136);
  assign wire159 = reg149[(1'h1):(1'h1)];
  assign wire160 = $signed(reg139);
  assign wire161 = $signed($unsigned(wire128[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      if ({wire156[(4'hd):(3'h6)],
          ((($signed((7'h40)) ? $unsigned(reg149) : wire153) ?
                  {$unsigned(reg148),
                      wire137[(3'h4):(1'h1)]} : reg141[(3'h6):(1'h0)]) ?
              (&wire126) : wire157)})
        begin
          if ($unsigned(($signed(((reg144 >= (8'hba)) ?
                  (wire136 ~^ (8'ha6)) : $unsigned(reg141))) ?
              (~^{$unsigned(wire135)}) : $signed($unsigned((wire160 ?
                  wire159 : reg141))))))
            begin
              reg162 <= (|$signed(reg142));
              reg163 <= (wire128[(2'h3):(2'h2)] ?
                  wire130[(4'h9):(3'h5)] : wire137[(3'h4):(1'h1)]);
              reg164 <= {($unsigned(reg150) >>> $unsigned({$unsigned(wire151)})),
                  $unsigned(reg162)};
              reg165 <= $signed(reg147[(4'h9):(1'h0)]);
            end
          else
            begin
              reg162 <= $unsigned(wire161);
              reg163 <= (7'h44);
              reg164 <= wire126;
              reg165 <= {$signed(((wire154 && (wire135 | wire137)) ?
                      (wire160 ?
                          {wire153} : (reg165 ~^ wire129)) : (~&(|wire133))))};
              reg166 <= reg148[(4'hb):(3'h5)];
            end
          reg167 <= $signed({($unsigned($unsigned(wire131)) ?
                  {wire131} : ((8'hb4) >> $unsigned(wire154)))});
        end
      else
        begin
          if (wire138[(5'h12):(3'h5)])
            begin
              reg162 <= (wire127[(1'h0):(1'h0)] ?
                  ($signed(((reg149 ? wire158 : reg139) ?
                      ((8'haf) + wire137) : wire160)) >>> ({wire153,
                      $unsigned(reg145)} ~^ {reg165[(5'h13):(4'hc)]})) : (8'ha4));
              reg163 <= (-reg167);
              reg164 <= (($signed(reg145[(4'h9):(3'h4)]) ?
                  (^((wire159 || wire126) ?
                      (wire161 ~^ (8'ha3)) : $signed(wire156))) : $unsigned(wire158[(3'h4):(1'h0)])) >>> $signed(reg147[(4'ha):(3'h7)]));
              reg165 <= $signed(wire131);
            end
          else
            begin
              reg162 <= wire155[(4'hb):(4'ha)];
              reg163 <= (~|reg166);
            end
          reg166 <= (8'ha3);
          reg167 <= $signed((^reg150[(3'h6):(3'h4)]));
        end
    end
  assign wire168 = (8'haf);
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire70;
  input wire signed [(4'hc):(1'h0)] wire69;
  input wire signed [(3'h6):(1'h0)] wire68;
  input wire [(5'h14):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire104;
  wire [(4'h9):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire71 = (^wire69[(4'hc):(4'hb)]);
  assign wire72 = wire66;
  assign wire73 = $signed((8'had));
  assign wire74 = $unsigned($signed($signed((8'had))));
  assign wire75 = (($unsigned((8'ha7)) > ((&$signed(wire71)) && ((wire67 | (7'h42)) || (wire72 ?
                      wire67 : (8'hb8))))) * wire73[(4'hd):(4'h8)]);
  assign wire76 = wire66[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg77 <= (-wire70);
      reg78 <= $unsigned((wire70[(3'h7):(3'h6)] - ((^~(!reg77)) ?
          $signed($signed(wire71)) : $unsigned({wire66}))));
    end
  assign wire79 = ((wire68[(2'h2):(2'h2)] & $signed({(+reg77),
                      (wire66 ? wire76 : wire75)})) - wire71[(3'h4):(3'h4)]);
  assign wire80 = (~^$signed(reg77[(5'h11):(1'h1)]));
  assign wire81 = (wire66 ?
                      (~$signed((!(8'ha7)))) : ($signed((!wire67[(4'ha):(4'h8)])) ?
                          ($signed((wire73 ?
                              wire68 : wire71)) || reg78) : (~&(reg78[(4'hc):(3'h5)] ?
                              wire69[(4'h9):(3'h4)] : {(8'ha2)}))));
  always
    @(posedge clk) begin
      reg82 <= ((wire74[(2'h3):(1'h0)] <= wire81[(1'h1):(1'h1)]) <<< $signed($unsigned(((wire72 > wire70) >= (~&wire76)))));
      if ($signed({$unsigned($unsigned({(8'hba)})), (!wire80)}))
        begin
          reg83 <= (~^(!$unsigned(((wire79 ?
              (7'h42) : reg77) ~^ (wire69 & wire74)))));
          if ({($unsigned($signed(wire69)) ?
                  (~&$unsigned((wire69 - wire75))) : (|reg83[(2'h3):(1'h0)])),
              reg83[(1'h0):(1'h0)]})
            begin
              reg84 <= (((^(wire73[(4'h8):(4'h8)] > wire74)) & $unsigned(((reg83 ?
                  wire67 : wire73) ~^ $signed((8'ha3))))) * (^~$unsigned(wire79)));
              reg85 <= wire75[(3'h5):(1'h0)];
              reg86 <= (^~$unsigned(wire81[(2'h2):(1'h1)]));
              reg87 <= (-wire67[(3'h6):(3'h5)]);
              reg88 <= $signed($unsigned(wire72[(3'h4):(1'h1)]));
            end
          else
            begin
              reg84 <= (reg77[(1'h1):(1'h0)] ?
                  ({{(~|reg87)},
                      ($unsigned(reg86) ?
                          ((8'hb6) - wire76) : {reg87})} + $unsigned(reg82)) : {(wire66[(2'h3):(1'h1)] ^ $signed({(8'hb9)})),
                      (~^$unsigned($signed(wire68)))});
              reg85 <= (^~wire68[(1'h1):(1'h0)]);
              reg86 <= (~^{wire69[(3'h5):(3'h5)]});
              reg87 <= wire70[(4'hc):(4'hc)];
            end
          reg89 <= ($signed(wire70) ?
              ((reg86[(2'h3):(1'h1)] * $unsigned((reg86 ^ wire71))) ?
                  ((wire74[(3'h5):(1'h0)] ?
                      wire66 : (~&wire76)) < {(^~wire73)}) : wire71[(3'h7):(1'h0)]) : ((wire70 ^ $signed({reg82})) ?
                  wire81[(2'h2):(1'h0)] : ((~|{wire70}) || reg88[(4'h8):(1'h1)])));
          if (wire74[(4'hf):(4'ha)])
            begin
              reg90 <= {$unsigned((~|$signed((wire70 ? wire76 : (8'hbc))))),
                  $unsigned(($signed(reg77[(5'h12):(4'ha)]) + reg88[(3'h4):(3'h4)]))};
              reg91 <= $unsigned(wire79);
              reg92 <= {(wire73[(2'h2):(1'h1)] ?
                      ($unsigned(reg86[(1'h1):(1'h0)]) | (wire75 ?
                          (|wire75) : $unsigned(reg91))) : $unsigned((!$unsigned(wire69))))};
              reg93 <= reg85[(1'h1):(1'h0)];
              reg94 <= (8'ha9);
            end
          else
            begin
              reg90 <= (reg93[(3'h4):(2'h3)] == (reg86 ?
                  ((wire72 != (-(8'hb1))) < wire71) : {wire70,
                      wire68[(3'h5):(2'h3)]}));
              reg91 <= $signed(((($signed(wire72) ?
                          $signed(reg90) : reg90[(2'h3):(2'h3)]) ?
                      ((&wire66) ?
                          (wire70 ?
                              (7'h44) : wire67) : $unsigned(reg82)) : wire73[(3'h5):(2'h2)]) ?
                  (&wire75) : $signed(($unsigned(reg94) ?
                      {wire70} : (reg93 > reg87)))));
              reg92 <= $unsigned((wire76 ?
                  {$unsigned(reg91[(4'ha):(3'h5)]),
                      $unsigned((~&(7'h44)))} : reg84));
            end
        end
      else
        begin
          if (reg87[(2'h2):(2'h2)])
            begin
              reg83 <= $unsigned($signed((reg77 ?
                  $signed($signed(reg93)) : $unsigned($signed(wire67)))));
              reg84 <= (+$signed(reg87));
              reg85 <= {reg94, $unsigned(wire66)};
              reg86 <= ((!(($unsigned(reg90) > $signed(reg91)) << $signed(((8'hac) - wire66)))) & $unsigned(reg87[(1'h1):(1'h0)]));
            end
          else
            begin
              reg83 <= $signed((&(8'hb9)));
              reg84 <= ((^(((~&wire71) ?
                      $signed(reg93) : reg78[(1'h1):(1'h1)]) ?
                  $signed((wire75 ?
                      wire80 : wire67)) : (wire67 ^ reg90[(3'h7):(3'h6)]))) ^ $unsigned(reg88[(3'h6):(1'h0)]));
              reg85 <= (|reg89[(1'h0):(1'h0)]);
              reg86 <= wire81[(3'h4):(3'h4)];
            end
          reg87 <= (wire67[(2'h3):(2'h3)] ?
              $unsigned((reg83[(4'hd):(4'h8)] != (wire79[(1'h1):(1'h1)] ^ $unsigned(reg92)))) : $signed($unsigned({{wire67},
                  $signed(reg82)})));
          reg88 <= wire71[(1'h0):(1'h0)];
          reg89 <= $unsigned((&((^(-reg93)) ? reg77 : (^~$signed(wire70)))));
          reg90 <= $signed((({reg85[(1'h1):(1'h1)]} <<< (8'hb3)) ^ {(&$signed(reg77)),
              $unsigned(reg84)}));
        end
      reg95 <= $signed(((^~(8'hba)) ?
          $signed({(+reg86)}) : (reg94 ?
              {(~^wire79)} : $signed(reg83[(3'h5):(3'h4)]))));
    end
  assign wire96 = {(^reg92[(1'h1):(1'h1)])};
  assign wire97 = wire76[(3'h4):(2'h3)];
  assign wire98 = $unsigned((reg85 ^ (|reg95[(4'h8):(3'h4)])));
  assign wire99 = (^~(((~|{reg92}) ?
                      $unsigned((reg94 & reg83)) : (+reg86[(1'h0):(1'h0)])) | $signed((8'hab))));
  assign wire100 = {wire70[(5'h14):(4'h9)]};
  assign wire101 = $signed((&{($unsigned(wire97) ?
                           $unsigned(wire74) : $unsigned(reg83)),
                       reg92[(2'h2):(1'h1)]}));
  assign wire102 = $unsigned(reg92[(1'h0):(1'h0)]);
  assign wire103 = (({($signed((8'hb5)) < {(7'h43), reg93}),
                           wire70} < $unsigned($signed(reg88[(4'hc):(4'h8)]))) ?
                       $signed((reg84 ?
                           (&wire74) : reg84)) : ($unsigned($signed(wire69)) ?
                           $signed((^((8'hbb) ~^ reg89))) : $signed(({reg90} != (reg90 ?
                               reg89 : reg84)))));
  assign wire104 = reg91;
endmodule

module module27
#(parameter param62 = {({(^(+(8'hb4)))} >>> ((8'hb4) || ((8'ha9) ? (^~(8'hb1)) : ((8'ha8) | (8'had)))))})
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire33,
                 wire32,
                 reg61,
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
                 (1'h0)};
  assign wire32 = wire29;
  assign wire33 = ($signed($unsigned($signed((wire31 ?
                      (8'hb5) : wire32)))) ^~ ({wire29[(3'h4):(3'h4)]} ?
                      wire32[(2'h3):(1'h0)] : (wire29 ?
                          wire30[(3'h7):(2'h3)] : $signed($signed(wire29)))));
  always
    @(posedge clk) begin
      reg34 <= (!$signed(wire33));
      reg35 <= $unsigned((((|reg34[(1'h1):(1'h1)]) ?
              ({(8'hbb), wire31} > wire30) : $signed((~wire29))) ?
          $signed((wire28[(3'h5):(2'h3)] && $unsigned(wire31))) : wire30[(3'h5):(1'h1)]));
      if ((~&$signed(($signed(reg34) - wire33[(1'h0):(1'h0)]))))
        begin
          reg36 <= (8'hbf);
          reg37 <= (($signed($unsigned((wire30 | wire30))) ?
              $unsigned(wire31) : (^~$unsigned((~|wire33)))) >= ($unsigned(wire30) ?
              $signed((wire30 ? wire31 : (&wire32))) : ({$unsigned(wire32)} ?
                  reg35[(1'h0):(1'h0)] : (((7'h42) ? reg36 : (8'ha3)) ?
                      (reg34 ? (8'hbb) : wire29) : wire33[(3'h5):(3'h4)]))));
          reg38 <= (wire32[(3'h5):(3'h4)] ? (^reg36[(2'h3):(1'h1)]) : wire31);
          reg39 <= ((-(~&wire29)) ? (&(&wire31)) : reg36[(1'h0):(1'h0)]);
        end
      else
        begin
          reg36 <= ((!wire28[(4'hd):(1'h1)]) ?
              {reg34} : ($unsigned($unsigned((reg38 ?
                  wire28 : reg36))) * reg36));
          if ((&((wire33[(2'h2):(1'h1)] ?
                  ($unsigned(reg36) || $unsigned((8'hac))) : (+wire29)) ?
              {$unsigned($signed(wire32)),
                  {$unsigned(wire30),
                      (^~wire33)}} : $unsigned($unsigned($signed(wire32))))))
            begin
              reg37 <= (($signed({wire33[(3'h6):(2'h2)], (wire30 - wire29)}) ?
                      $signed(({reg35, wire33} ?
                          (reg34 > reg38) : (8'hb6))) : (^reg38)) ?
                  reg36 : $signed(wire28));
            end
          else
            begin
              reg37 <= $signed(reg39[(4'h9):(3'h6)]);
              reg38 <= $unsigned($unsigned((8'h9f)));
              reg39 <= wire33;
              reg40 <= reg36[(2'h2):(1'h1)];
            end
          reg41 <= {$signed(reg40[(2'h2):(1'h0)]),
              $unsigned($unsigned(wire33))};
          reg42 <= (&$unsigned({((!wire28) <<< (reg41 || wire31)),
              {$unsigned(reg40), wire32}}));
          reg43 <= $unsigned((&(!(+(reg41 ? reg42 : (8'hac))))));
        end
    end
  always
    @(posedge clk) begin
      if (wire33)
        begin
          if ({wire32[(4'ha):(2'h3)],
              $signed((reg41[(2'h3):(1'h0)] || ($unsigned((8'hb0)) ?
                  {reg43} : ((8'hbf) < wire30))))})
            begin
              reg44 <= $unsigned($signed((8'hab)));
              reg45 <= $signed((reg43[(1'h0):(1'h0)] ?
                  $unsigned($signed((~|(8'hae)))) : wire28[(4'hb):(2'h2)]));
              reg46 <= (~reg38[(4'ha):(4'h9)]);
            end
          else
            begin
              reg44 <= (-wire29);
              reg45 <= reg41;
              reg46 <= reg41;
              reg47 <= ({reg41} ?
                  $signed({reg43[(3'h4):(1'h0)],
                      (8'hb1)}) : {((~&(reg40 ^ (8'h9d))) ?
                          $unsigned(reg45) : (!(+wire33)))});
              reg48 <= (~&$unsigned(((reg36[(2'h3):(1'h0)] <<< (~^wire32)) < ((reg47 ?
                      reg41 : reg43) ?
                  {reg34} : $unsigned(wire33)))));
            end
          reg49 <= wire33[(3'h4):(1'h0)];
          reg50 <= (+((~reg41) ?
              $unsigned((&{reg47,
                  wire32})) : $unsigned(($signed(reg47) ~^ reg42[(1'h0):(1'h0)]))));
          reg51 <= (|$signed($signed((^{reg34, (8'ha8)}))));
          reg52 <= (({(~&reg37),
              ((reg46 ?
                  wire28 : reg43) && $signed(wire32))} ^~ wire28[(4'h9):(3'h7)]) - (!(reg38 ?
              reg49 : $signed((~|reg51)))));
        end
      else
        begin
          if (($unsigned((({reg39, reg46} ? $signed(reg39) : $signed(wire30)) ?
              $unsigned(reg40) : ($unsigned(reg43) ?
                  reg47 : ((8'had) | (8'ha0))))) < ((reg35 <<< (~$unsigned(reg34))) ~^ $signed($unsigned((reg51 * wire33))))))
            begin
              reg44 <= {{(reg44[(2'h3):(2'h2)] ?
                          $unsigned({reg34}) : ((~^reg51) > ((7'h41) ?
                              reg47 : reg49))),
                      wire31}};
              reg45 <= ((((~(reg48 ?
                      reg40 : reg52)) <<< wire30) - $signed(wire31)) ?
                  (((8'hab) >> {(reg52 >= reg35)}) ?
                      wire30 : (~&reg52)) : reg38);
              reg46 <= (!$signed(((|wire32) ^ $unsigned($signed(wire29)))));
              reg47 <= (&$unsigned((~$unsigned((reg41 ? reg52 : (8'hab))))));
            end
          else
            begin
              reg44 <= (reg49 - {$signed($signed(reg41[(2'h3):(2'h2)]))});
              reg45 <= (+$signed($signed(wire29)));
              reg46 <= ($unsigned(($unsigned((7'h44)) * $signed($unsigned((7'h41))))) || wire33[(4'h8):(2'h2)]);
              reg47 <= $unsigned(((-((reg38 ? wire29 : reg52) ?
                  (~(8'hb5)) : (reg48 ? reg39 : reg40))) * ((reg44 ?
                      (reg41 ? (8'ha7) : wire31) : $unsigned(reg50)) ?
                  reg43 : (^~(reg39 & wire28)))));
            end
        end
    end
  assign wire53 = $unsigned(wire31[(4'he):(4'he)]);
  assign wire54 = (reg37[(2'h3):(1'h0)] - (!reg40));
  assign wire55 = $unsigned($unsigned($unsigned($unsigned($unsigned(reg47)))));
  assign wire56 = reg34[(4'h8):(1'h0)];
  assign wire57 = $signed(wire29);
  assign wire58 = (^reg36);
  assign wire59 = $signed($unsigned($unsigned((^(^reg35)))));
  assign wire60 = ((reg41 ?
                      $signed(($signed(wire59) >>> $unsigned(reg43))) : wire57[(2'h3):(2'h2)]) | (^(~|((reg39 ?
                      reg47 : (8'ha9)) - {reg47}))));
  always
    @(posedge clk) begin
      reg61 <= $unsigned((8'ha8));
    end
endmodule
