module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire224;
  wire [(3'h6):(1'h0)] wire220;
  wire signed [(3'h6):(1'h0)] wire219;
  wire signed [(2'h2):(1'h0)] wire218;
  wire signed [(4'hb):(1'h0)] wire217;
  wire [(5'h13):(1'h0)] wire216;
  wire signed [(4'hd):(1'h0)] wire215;
  wire signed [(2'h3):(1'h0)] wire208;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire222;
  reg signed [(3'h5):(1'h0)] reg210 = (1'h0);
  reg [(3'h5):(1'h0)] reg211 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg [(3'h6):(1'h0)] reg214 = (1'h0);
  assign y = {wire224,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire208,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire222,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 (1'h0)};
  assign wire5 = (wire0[(5'h11):(4'hb)] && wire4[(1'h1):(1'h0)]);
  assign wire6 = $signed($unsigned($unsigned((8'h9c))));
  assign wire7 = {wire0[(2'h2):(1'h0)],
                     ($signed(wire1[(4'h8):(2'h3)]) ?
                         wire6 : ((~$unsigned(wire5)) | (wire1 <<< (^~wire3))))};
  assign wire8 = (8'hb5);
  module9 #() modinst209 (.clk(clk), .wire11(wire0), .wire10(wire1), .wire12(wire2), .wire13(wire6), .y(wire208));
  always
    @(posedge clk) begin
      if (($unsigned(wire5[(2'h3):(2'h3)]) != wire5))
        begin
          reg210 <= (wire6[(4'h9):(3'h5)] ?
              ((~&((wire3 >> (8'hb0)) | wire1[(2'h2):(1'h0)])) || $unsigned(wire4[(2'h2):(1'h0)])) : wire8);
          reg211 <= ($unsigned({{$signed(wire2), (wire1 ? wire208 : wire208)},
              $unsigned(wire2)}) >>> ((wire7[(5'h11):(4'hc)] ^ ((wire0 ?
                  wire5 : (8'ha3)) | $unsigned(wire6))) ?
              ({$signed(reg210), $unsigned(wire3)} ?
                  $signed((+wire0)) : {wire8[(3'h4):(2'h2)],
                      wire1[(2'h2):(1'h0)]}) : ($signed(((8'hb3) ~^ wire4)) + (8'hb2))));
          reg212 <= wire6;
          reg213 <= $signed((8'h9c));
        end
      else
        begin
          reg210 <= (wire6 ?
              (&(((reg210 << reg212) ?
                  (^~reg212) : wire4) >>> (~&$unsigned(reg213)))) : $unsigned($signed(reg210[(1'h1):(1'h1)])));
          reg211 <= $signed((~{(+{wire6})}));
          reg212 <= (&(~^wire6));
        end
      reg214 <= $signed((8'hb7));
    end
  assign wire215 = wire1[(4'h8):(1'h1)];
  assign wire216 = ({($unsigned((reg211 < (8'ha5))) ?
                               wire5 : ((reg213 > reg212) ?
                                   wire208 : $unsigned(wire3))),
                           (wire215 != {(reg211 ^~ wire208)})} ?
                       (&$unsigned(wire215)) : $signed(wire3[(1'h0):(1'h0)]));
  assign wire217 = $signed(reg210);
  assign wire218 = ($signed($unsigned((&wire2[(3'h5):(3'h4)]))) ?
                       ((wire6[(5'h12):(1'h0)] ?
                               wire1[(4'h9):(3'h6)] : {$unsigned(wire1),
                                   {(8'ha6), wire8}}) ?
                           ($unsigned((^wire215)) | $signed((wire208 < wire217))) : $signed({wire4[(1'h1):(1'h0)]})) : reg213);
  assign wire219 = wire1[(2'h3):(1'h0)];
  module176 #() modinst221 (wire220, clk, wire8, wire4, wire3, wire215, wire7);
  module17 #() modinst223 (.wire19(wire2), .wire18(wire217), .wire21(reg214), .y(wire222), .clk(clk), .wire20(wire219));
  assign wire224 = $signed((+reg214));
endmodule

module module9
#(parameter param207 = (^~{(!(((8'hba) ? (8'hb7) : (8'hbc)) + ((8'hbf) ? (8'ha9) : (8'haf)))), ({((8'h9f) ? (8'hb6) : (8'ha1))} + (((8'ha5) ^~ (7'h44)) <<< (-(8'hb5))))}))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(2'h3):(1'h0)] wire204;
  wire signed [(3'h4):(1'h0)] wire193;
  wire [(2'h3):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire114;
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg199 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire193,
                 wire191,
                 wire175,
                 wire173,
                 wire14,
                 wire15,
                 wire16,
                 wire56,
                 wire63,
                 wire64,
                 wire65,
                 wire114,
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
                 reg67,
                 reg66,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire14 = (|wire11[(2'h2):(2'h2)]);
  assign wire15 = $signed({{$signed(wire14)}, $signed(wire12[(1'h1):(1'h0)])});
  assign wire16 = $signed($unsigned((wire12 ?
                      wire10[(2'h3):(2'h2)] : {$unsigned(wire10),
                          $unsigned(wire12)})));
  module17 #() modinst57 (wire56, clk, wire16, wire13, wire11, wire14);
  always
    @(posedge clk) begin
      reg58 <= ((~|($signed(wire10) ?
              wire16[(1'h0):(1'h0)] : $unsigned($signed(wire12)))) ?
          wire15 : $unsigned(($signed(wire56) < wire10)));
      reg59 <= {({wire16} ?
              (|$unsigned((-(8'hbf)))) : $signed(wire10[(4'h9):(4'h8)])),
          ((&(^(~|wire56))) ?
              ($unsigned((wire15 ? wire11 : wire15)) || ((+wire12) ?
                  wire10[(4'ha):(2'h3)] : $signed(wire15))) : wire10[(3'h7):(3'h6)])};
      reg60 <= ($signed(wire15) ?
          (wire56 ?
              $unsigned((((8'ha8) * reg58) ~^ wire16)) : $unsigned(wire56[(3'h6):(2'h3)])) : wire14[(1'h0):(1'h0)]);
      reg61 <= (!$signed(($signed(wire56) ?
          (~^((8'h9d) ? wire10 : wire14)) : ((reg59 * wire12) ?
              $signed(wire14) : wire10))));
      reg62 <= wire14;
    end
  assign wire63 = (wire13 << reg61);
  assign wire64 = wire14;
  assign wire65 = $signed(((|$unsigned((!wire13))) ?
                      $unsigned(((^~wire15) ?
                          $unsigned((8'hb9)) : wire56)) : wire14));
  always
    @(posedge clk) begin
      reg66 <= $unsigned(((((-wire63) ?
              $signed(wire15) : (!(8'hb4))) ^ wire15[(4'hb):(3'h7)]) ?
          ((^~$signed(wire16)) & wire14[(3'h4):(1'h0)]) : wire56[(4'h9):(1'h0)]));
      reg67 <= (^~($signed((&(wire11 | reg58))) + (8'ha1)));
    end
  module68 #() modinst115 (.wire71(reg62), .clk(clk), .wire72(wire63), .wire69(wire13), .y(wire114), .wire70(wire56));
  module116 #() modinst174 (wire173, clk, wire10, wire13, reg67, reg62);
  assign wire175 = {(($unsigned(wire63) >>> wire114[(3'h7):(3'h6)]) || wire63[(3'h6):(3'h5)])};
  module176 #() modinst192 (.wire179(wire175), .wire180(wire10), .wire178(wire12), .clk(clk), .wire181(reg58), .wire177(wire63), .y(wire191));
  assign wire193 = $signed($signed($signed(((reg58 + (8'hb2)) > {wire64,
                       wire175}))));
  always
    @(posedge clk) begin
      reg194 <= (((+$signed(wire14)) ?
              wire193[(3'h4):(1'h1)] : $unsigned(($unsigned(reg60) - {wire14,
                  (8'haf)}))) ?
          ({(&(wire11 ? reg60 : wire175)),
              wire11[(1'h1):(1'h0)]} >> wire173[(3'h4):(1'h0)]) : reg60[(1'h1):(1'h1)]);
      reg195 <= (reg61[(2'h2):(1'h1)] >> reg62[(4'hc):(4'ha)]);
      if (($unsigned(((8'hbc) + (((8'hbe) >= wire193) ?
          (wire16 ~^ wire63) : (wire64 ?
              reg67 : reg66)))) >> wire64[(4'ha):(4'h8)]))
        begin
          reg196 <= {$signed($unsigned($unsigned(wire173)))};
          reg197 <= {{$signed({((8'hb2) ? reg62 : wire175), (~^reg61)})},
              (8'hbe)};
          reg198 <= (+$signed((((+reg60) && $unsigned(reg197)) < $unsigned(wire12))));
          reg199 <= $signed((~|$unsigned($unsigned((~^wire114)))));
        end
      else
        begin
          if (((((wire14 << (wire191 - wire175)) ?
                      {$signed(reg58)} : (wire175 | $signed(reg66))) ?
                  $signed($signed((~^reg195))) : (($signed(reg67) & ((8'ha8) ?
                          wire13 : (8'hb0))) ?
                      (((8'ha5) ? wire10 : reg194) ?
                          (~&reg194) : (~wire12)) : ((wire56 ^ reg67) << (~^wire191)))) ?
              $unsigned((-(~|(^~wire114)))) : wire16))
            begin
              reg196 <= wire191[(1'h1):(1'h1)];
              reg197 <= $signed(wire64);
              reg198 <= reg60[(1'h0):(1'h0)];
              reg199 <= $signed(wire12);
              reg200 <= $unsigned(wire175[(4'hc):(4'h8)]);
            end
          else
            begin
              reg196 <= (~|(~(!(reg199 ? wire56 : wire56[(5'h11):(4'hc)]))));
              reg197 <= (~(($signed($signed(wire173)) + ((8'hbc) <<< (reg197 >= wire10))) ?
                  $unsigned(reg197) : reg61[(1'h1):(1'h0)]));
              reg198 <= reg200;
              reg199 <= {wire10, wire10[(4'hb):(3'h7)]};
            end
          reg201 <= wire114;
          reg202 <= (wire14 ?
              reg194 : ((~^(8'hae)) ?
                  (wire10[(4'hd):(4'h9)] ?
                      (|$signed(reg59)) : $unsigned((+wire65))) : (~|($signed(wire16) ?
                      reg59[(3'h6):(3'h5)] : reg196[(4'he):(4'ha)]))));
        end
      reg203 <= (reg201 && ((wire191 ?
              $unsigned((wire191 ?
                  reg196 : wire15)) : (reg196 | $signed(reg196))) ?
          {(^~(|reg58))} : wire10[(4'hb):(1'h1)]));
    end
  assign wire204 = ($unsigned($signed(((reg195 ? wire13 : reg203) ?
                       $unsigned(wire10) : (^~wire65)))) == ((reg67[(2'h2):(1'h1)] ?
                       $unsigned(((8'h9e) - wire16)) : reg197[(1'h1):(1'h1)]) ~^ reg200[(4'h9):(2'h2)]));
  assign wire205 = (({$unsigned(wire56),
                           ($signed(reg59) == (wire64 + (7'h44)))} ~^ wire63[(3'h5):(2'h3)]) ?
                       (!{{(|(8'ha4))},
                           ((reg201 ?
                               wire63 : (8'ha5)) <<< $signed(reg198))}) : reg62[(3'h6):(2'h3)]);
  assign wire206 = ((!(reg201 <= (^~(&reg59)))) ?
                       wire12[(3'h4):(1'h0)] : {(^~($signed(reg196) + reg203))});
endmodule

module module176
#(parameter param190 = (((((8'hbb) ? (!(8'ha9)) : ((8'h9e) ? (8'hb7) : (7'h44))) == ((~|(8'hb0)) < (&(8'hbd)))) ? (~(|(8'ha0))) : ({{(8'hb4), (7'h44)}} > ({(8'hb1)} != ((8'had) <<< (8'hae))))) ? ((&(((8'hb4) >>> (8'hbe)) ? ((7'h44) ? (8'ha0) : (7'h40)) : ((8'hb4) ^~ (8'h9f)))) <<< ((((8'hb0) < (8'h9c)) ? ((8'had) >= (8'hab)) : ((8'hbe) ? (8'hba) : (8'hb9))) - (((8'hb3) ~^ (8'hb4)) ? ((8'ha4) ? (8'hbf) : (8'hb0)) : {(8'hb5), (8'hb0)}))) : (~&(({(8'hb7)} * (+(8'ha2))) > {((8'h9e) != (8'h9d))}))))
(y, clk, wire181, wire180, wire179, wire178, wire177);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire181;
  input wire signed [(3'h5):(1'h0)] wire180;
  input wire signed [(4'h9):(1'h0)] wire179;
  input wire signed [(3'h6):(1'h0)] wire178;
  input wire signed [(4'h8):(1'h0)] wire177;
  wire [(5'h13):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(4'h9):(1'h0)] wire185;
  wire [(4'hb):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  reg [(4'h9):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg187 = (1'h0);
  assign y = {wire189,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 reg188,
                 reg187,
                 (1'h0)};
  assign wire182 = ((wire181[(3'h7):(3'h7)] ?
                       (^~wire181[(1'h0):(1'h0)]) : (~|((-wire180) ?
                           (wire180 ?
                               wire180 : (8'hbf)) : wire177[(3'h6):(3'h6)]))) >> $signed(($signed((wire180 ?
                       (8'hab) : wire181)) != ((&wire177) ?
                       (wire180 >>> wire180) : (wire179 ?
                           wire178 : wire179)))));
  assign wire183 = $unsigned((wire178 << $signed(wire179[(1'h1):(1'h0)])));
  assign wire184 = (wire183 ?
                       wire178[(1'h0):(1'h0)] : (wire183 && wire177[(3'h4):(1'h1)]));
  assign wire185 = wire184;
  assign wire186 = wire177[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg187 <= $unsigned((-($signed((wire178 != wire180)) ?
          wire184 : (((8'ha8) ? wire186 : (8'hb0)) ?
              (wire182 ~^ wire182) : $unsigned(wire179)))));
    end
  always
    @(posedge clk) begin
      reg188 <= {wire178[(1'h0):(1'h0)],
          (((^(wire177 >> wire180)) & $signed($unsigned(wire177))) ?
              $signed($unsigned((wire186 ?
                  (8'h9d) : wire184))) : $signed(((wire179 ?
                  wire185 : wire181) >= $unsigned(wire184))))};
    end
  assign wire189 = ((wire184[(1'h0):(1'h0)] ^ $signed({(wire177 ?
                               wire179 : wire181)})) ?
                       (reg188 ?
                           ($signed(wire186) < $unsigned($signed(reg188))) : wire184) : (~^$signed({wire180,
                           wire178})));
endmodule

module module116
#(parameter param172 = (~^{({{(8'h9f)}, (!(8'h9d))} ? {((8'ha4) ~^ (8'h9d)), ((8'hbb) ? (7'h43) : (8'haa))} : (^((8'hbb) ? (8'ha2) : (8'ha0))))}))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h270):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire120;
  input wire signed [(3'h7):(1'h0)] wire119;
  input wire [(3'h7):(1'h0)] wire118;
  input wire [(3'h5):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire171;
  wire [(4'hf):(1'h0)] wire170;
  wire [(4'h8):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire163;
  wire [(4'h9):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(4'hd):(1'h0)] wire154;
  wire [(4'hc):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire signed [(5'h15):(1'h0)] wire149;
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg145 = (1'h0);
  reg [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(5'h15):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire165,
                 wire163,
                 wire162,
                 wire160,
                 wire159,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg164,
                 reg161,
                 reg158,
                 reg157,
                 reg156,
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
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= $signed($signed({(&(wire120 >> wire117))}));
    end
  always
    @(posedge clk) begin
      reg122 <= ($unsigned(($unsigned(((7'h42) ?
              wire117 : wire117)) || wire119)) ?
          wire118[(1'h0):(1'h0)] : (^((8'h9d) ?
              $unsigned($signed(wire118)) : $signed(wire120))));
      if (wire117[(1'h1):(1'h1)])
        begin
          if ((~wire120[(1'h1):(1'h1)]))
            begin
              reg123 <= $signed(reg122);
              reg124 <= (8'hb8);
              reg125 <= ($unsigned(((~^$signed(wire118)) * (-(8'had)))) ?
                  wire117 : (&$signed(((wire120 ? (7'h43) : reg122) ?
                      reg124 : wire120))));
              reg126 <= $signed((+$unsigned($unsigned($signed(reg122)))));
            end
          else
            begin
              reg123 <= wire120;
              reg124 <= wire118;
              reg125 <= $signed((reg125 >>> ($unsigned((reg123 ?
                  reg121 : wire117)) + $unsigned($unsigned(reg126)))));
              reg126 <= $unsigned($unsigned((8'ha1)));
              reg127 <= ((8'ha9) >> reg126[(1'h1):(1'h0)]);
            end
          if (($unsigned($signed(($signed(wire119) ?
                  $unsigned(wire118) : reg126[(4'hc):(4'h8)]))) ?
              (~|reg127[(4'hc):(4'hc)]) : wire117))
            begin
              reg128 <= (^$unsigned(wire120[(2'h2):(2'h2)]));
              reg129 <= $signed($signed({{(+reg126)}, wire117[(3'h5):(3'h5)]}));
              reg130 <= $unsigned($unsigned((wire120[(4'h9):(3'h7)] >>> wire119[(2'h3):(1'h0)])));
              reg131 <= reg121;
              reg132 <= {$unsigned(reg126), {(^$unsigned({reg121}))}};
            end
          else
            begin
              reg128 <= $signed($unsigned((~&(~&(reg130 != (8'hbe))))));
            end
          if ($signed((wire118[(3'h7):(1'h0)] ?
              reg124[(2'h3):(2'h3)] : reg132[(4'ha):(3'h4)])))
            begin
              reg133 <= (~|$signed((reg132 ?
                  $signed(reg123[(1'h0):(1'h0)]) : {(wire117 <<< (8'hb0))})));
              reg134 <= $signed({(reg131[(3'h6):(1'h0)] ?
                      $signed({reg126}) : ((^~reg125) - ((8'ha2) || reg123))),
                  reg128[(1'h1):(1'h1)]});
              reg135 <= {($signed($signed(wire117)) ?
                      $unsigned($signed((reg129 ?
                          reg131 : reg121))) : (wire120[(4'hd):(3'h4)] + $signed($signed((7'h42))))),
                  $signed(reg122[(2'h2):(1'h1)])};
            end
          else
            begin
              reg133 <= ($signed(reg121[(2'h3):(2'h2)]) <= {reg123[(1'h1):(1'h0)],
                  reg135[(3'h4):(2'h3)]});
              reg134 <= ({$signed($signed({reg135, reg134})),
                      {(~&(reg128 ? (8'ha7) : reg121)), (8'hb5)}} ?
                  reg124[(2'h3):(1'h0)] : reg124[(4'hb):(4'h8)]);
              reg135 <= $unsigned(wire119[(2'h2):(1'h1)]);
              reg136 <= ((~(((~&reg128) ?
                  (wire119 == reg134) : reg123[(2'h2):(2'h2)]) && reg135)) <<< (-reg133[(1'h1):(1'h1)]));
            end
          if ($unsigned($signed(((^~$unsigned(reg134)) >> (^reg126[(4'ha):(2'h2)])))))
            begin
              reg137 <= reg128[(1'h0):(1'h0)];
              reg138 <= wire118;
              reg139 <= $unsigned(reg133);
            end
          else
            begin
              reg137 <= $signed((^(reg136 ?
                  reg135[(2'h3):(2'h2)] : $signed((wire118 * reg125)))));
              reg138 <= wire117[(2'h3):(1'h1)];
            end
          reg140 <= wire119;
        end
      else
        begin
          reg123 <= $unsigned(($unsigned((!reg140)) ^ $signed($unsigned((wire118 ?
              reg138 : reg138)))));
          if ($signed(((reg128[(2'h2):(2'h2)] ?
                  {{reg131, reg132}} : (~&$unsigned(reg131))) ?
              {reg121, reg135[(3'h4):(2'h3)]} : reg140)))
            begin
              reg124 <= reg137;
            end
          else
            begin
              reg124 <= ({(~&(~(7'h41))),
                      ((&(wire119 != reg127)) ?
                          ($unsigned(wire119) ?
                              reg136 : (reg136 <= (8'h9c))) : (8'hb3))} ?
                  ($unsigned(((reg135 ^~ reg130) ?
                      reg137 : (~&(8'h9e)))) >> reg122) : reg132);
              reg125 <= (wire119 ?
                  $unsigned({$unsigned($unsigned(reg122)),
                      ($signed((8'hbf)) ?
                          ((8'ha3) ?
                              reg137 : reg140) : reg136[(1'h1):(1'h0)])}) : (~reg140));
              reg126 <= ((~&((~|((8'h9f) ? (8'had) : reg126)) ?
                      $signed($signed(reg138)) : reg124[(3'h6):(2'h2)])) ?
                  ($signed({(+reg138)}) - $unsigned(reg129[(5'h13):(5'h12)])) : wire120);
              reg127 <= {(wire118[(2'h2):(1'h1)] && (!(reg124[(4'h8):(3'h7)] ?
                      reg129 : $unsigned(reg124)))),
                  $signed((!(~^wire119[(3'h6):(3'h4)])))};
              reg128 <= {{(8'haf)},
                  (((((7'h42) + reg126) ?
                              wire120[(3'h7):(1'h0)] : reg129[(5'h11):(5'h11)]) ?
                          reg135 : {reg137[(3'h7):(3'h5)], (~&wire118)}) ?
                      wire117 : ((~|$signed(reg125)) * reg125[(3'h6):(2'h2)]))};
            end
          if (($signed(reg134) ?
              {(reg133 ?
                      $signed((^~reg124)) : ((reg132 ? (8'hb3) : (8'ha4)) ?
                          (reg121 ? reg140 : reg131) : $unsigned(reg121))),
                  ($signed((wire120 ?
                      reg131 : reg125)) ^ $signed($unsigned(reg124)))} : reg139[(1'h1):(1'h0)]))
            begin
              reg129 <= $unsigned(reg134);
              reg130 <= (8'hba);
            end
          else
            begin
              reg129 <= {reg132[(5'h12):(2'h2)], reg140[(1'h1):(1'h0)]};
              reg130 <= reg131[(3'h6):(3'h6)];
              reg131 <= $signed({reg136, $signed(reg137)});
              reg132 <= (&$signed(((~(reg121 > (8'hbc))) ?
                  reg139 : ($signed(reg129) | (wire117 ? wire117 : reg128)))));
            end
          reg133 <= $signed($signed((reg126[(5'h12):(1'h0)] ?
              $signed($unsigned(wire120)) : (|(&wire118)))));
        end
    end
  always
    @(posedge clk) begin
      reg141 <= {reg121, (^~reg136)};
      reg142 <= ((~^reg125[(4'hc):(3'h5)]) ?
          (&(($unsigned(reg134) >= (reg132 & reg129)) > $signed(((8'ha3) || reg132)))) : (((~|(reg128 == (8'hb9))) <= ($unsigned(reg140) - {reg131,
              reg127})) >> (^reg141[(1'h0):(1'h0)])));
      reg143 <= ((reg136[(2'h3):(2'h3)] | (~(reg141[(4'ha):(4'h9)] > reg123))) << (((reg125 >= (~(8'hbe))) ?
          (^((8'h9d) ^ reg130)) : reg133) >>> $signed((reg121 ?
          reg130 : (reg123 ^ reg121)))));
      if ((~|{$unsigned(({reg126} ? (-reg121) : (+reg123))), reg128}))
        begin
          reg144 <= (((~^($unsigned(wire120) ^~ reg129[(4'he):(4'ha)])) << $unsigned($unsigned((reg143 ?
                  wire120 : reg124)))) ?
              ((reg134[(4'h9):(3'h7)] ? reg129 : {reg134, $unsigned((8'hae))}) ?
                  $unsigned(reg132) : {(-(!reg137))}) : $unsigned(reg132));
          reg145 <= reg138[(1'h0):(1'h0)];
          if ($signed($unsigned(({(^reg124)} ?
              $unsigned($unsigned(reg124)) : ((reg135 ? reg132 : reg140) ?
                  reg145 : {wire120})))))
            begin
              reg146 <= {(~^(&$signed(((8'ha7) & reg130))))};
              reg147 <= ((($signed($unsigned(reg126)) - ((reg135 >= reg125) ?
                      (~|reg123) : wire119)) * ({{wire120,
                          wire120}} != $unsigned(wire117[(2'h2):(2'h2)]))) ?
                  reg135[(3'h4):(1'h0)] : (8'hab));
              reg148 <= $unsigned((reg141 ?
                  (~|$signed($signed((8'ha9)))) : (~&(reg121[(1'h0):(1'h0)] ?
                      $signed(reg145) : (reg140 != reg121)))));
            end
          else
            begin
              reg146 <= (8'hb4);
            end
        end
      else
        begin
          reg144 <= {($signed(((reg148 - wire119) ?
                      $signed((8'hb4)) : (^wire120))) ?
                  reg137[(3'h6):(2'h3)] : (((reg125 < wire117) <<< reg141) | (+reg135[(1'h0):(1'h0)])))};
          reg145 <= $unsigned(reg126[(4'hf):(4'hc)]);
        end
    end
  assign wire149 = $signed((reg127 ? (~&(^~(8'ha6))) : reg146));
  assign wire150 = (reg144[(3'h4):(2'h2)] < wire119);
  assign wire151 = reg137[(1'h1):(1'h0)];
  assign wire152 = ((($unsigned(reg144[(3'h6):(3'h4)]) || ((wire120 ?
                               reg140 : reg127) ^~ reg147)) ?
                           (reg125 ^ {(reg148 < reg126),
                               (8'ha1)}) : (reg128[(1'h1):(1'h0)] ?
                               reg140 : reg133)) ?
                       $unsigned((((reg138 ?
                           reg139 : reg129) ~^ $signed(wire118)) | $signed(reg148[(3'h4):(2'h2)]))) : ($signed($unsigned((reg131 ^~ reg130))) ?
                           (7'h42) : (~|((reg129 | reg133) ?
                               (^reg137) : (reg147 || (8'hb2))))));
  assign wire153 = ($signed((reg137[(3'h7):(3'h6)] ?
                       ((~(7'h43)) ?
                           $unsigned(reg148) : reg143[(1'h1):(1'h0)]) : reg145)) > $unsigned($signed($signed($signed(reg136)))));
  assign wire154 = ((-$unsigned(((wire152 || reg147) ?
                           $signed(reg145) : reg142))) ?
                       reg129 : reg125[(3'h5):(1'h1)]);
  assign wire155 = (($signed({(^(8'hbc))}) < $signed({$unsigned(reg124),
                           $unsigned(wire118)})) ?
                       ($unsigned(reg136[(3'h7):(2'h2)]) + {(reg132[(3'h4):(1'h0)] ?
                               (reg123 ? reg123 : (8'hb2)) : ((8'ha6) ?
                                   reg137 : (8'ha5))),
                           $signed((wire118 ?
                               wire120 : reg143))}) : ((wire149[(1'h1):(1'h0)] ?
                               reg123 : ($unsigned(wire154) ?
                                   $unsigned((8'ha0)) : {reg134})) ?
                           reg123[(1'h0):(1'h0)] : $unsigned($unsigned(reg137))));
  always
    @(posedge clk) begin
      reg156 <= reg133[(4'hb):(2'h3)];
      reg157 <= ($unsigned((-{reg130[(4'hb):(2'h2)]})) ?
          (8'hb7) : reg128[(1'h0):(1'h0)]);
      reg158 <= (~$signed(reg122[(2'h2):(1'h0)]));
    end
  assign wire159 = $signed((~$signed((^wire119))));
  assign wire160 = $unsigned((~&$signed((reg158[(1'h1):(1'h1)] | (reg143 ?
                       reg128 : reg126)))));
  always
    @(posedge clk) begin
      reg161 <= $signed((7'h42));
    end
  assign wire162 = reg139;
  assign wire163 = $unsigned(($unsigned(reg147[(1'h0):(1'h0)]) ^~ ((8'ha1) != wire117[(3'h5):(1'h1)])));
  always
    @(posedge clk) begin
      reg164 <= (^reg126[(4'hc):(2'h3)]);
    end
  assign wire165 = reg121[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg166 <= ((!$signed((~&(-reg164)))) | $unsigned((^~({(8'hb0)} ^ (reg146 || reg133)))));
      reg167 <= (8'hb8);
      reg168 <= wire151[(3'h7):(2'h2)];
      reg169 <= reg167[(2'h3):(2'h3)];
    end
  assign wire170 = ($unsigned((~^(8'hbb))) ?
                       $signed((~|{(reg135 ? (8'haf) : reg123),
                           (^~reg135)})) : reg125[(1'h1):(1'h0)]);
  assign wire171 = {$unsigned(reg166[(3'h4):(1'h0)]),
                       (&(~&((reg137 ? wire151 : reg145) ?
                           (reg140 <= wire159) : (wire118 <<< (8'h9c)))))};
endmodule

module module68
#(parameter param112 = ((({((8'ha1) > (8'hb1))} > ({(8'ha9), (8'h9c)} ? (~(8'hbb)) : ((7'h40) ^~ (8'hb4)))) ? ((((7'h44) ? (8'ha8) : (8'haf)) >> ((8'hb5) && (8'h9c))) ? ((-(8'hba)) ? ((8'hb4) >= (8'hb7)) : {(8'h9f), (8'ha4)}) : (((7'h44) ? (8'ha3) : (7'h42)) ? (!(8'h9f)) : ((8'ha3) - (8'ha3)))) : ({((8'hae) <= (8'hbf))} == ((^~(8'hb9)) < ((8'hb6) ? (8'hbe) : (8'haf))))) ? (~((^(|(8'h9f))) ? (^~(8'ha3)) : {((8'ha7) ~^ (7'h40))})) : ((({(8'hb3)} > (~|(8'ha9))) ? {(8'haa), {(8'hbc)}} : (~&((8'ha2) ? (8'hb9) : (8'h9c)))) >= ((^~((8'h9c) | (8'h9f))) ? (((8'hbd) ? (7'h41) : (8'haf)) ? ((8'hb0) <<< (8'hba)) : {(8'hab), (8'haf)}) : (((8'h9e) >> (8'haf)) ^~ ((8'h9f) >>> (8'h9f)))))), 
parameter param113 = (((((param112 ? param112 : param112) >>> ((8'haf) < (8'ha9))) ? param112 : ((param112 ? param112 : param112) ? (param112 ? param112 : (8'ha5)) : param112)) ? param112 : {(^~{param112}), (&param112)}) > ((!(((8'h9f) && param112) != param112)) ^ {param112, param112})))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire72;
  input wire [(4'hb):(1'h0)] wire71;
  input wire [(5'h10):(1'h0)] wire70;
  input wire [(4'hd):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  reg [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire73 = ($signed($unsigned(wire70)) ? wire72 : wire69);
  assign wire74 = (~&($unsigned((8'ha3)) > (-$unsigned((|wire72)))));
  assign wire75 = (({$unsigned((wire74 ? wire69 : wire70)),
                          (^wire71[(2'h3):(2'h2)])} <<< $unsigned(($signed(wire73) ?
                          (wire72 < wire74) : $signed((8'h9c))))) ?
                      (((8'hb9) ?
                          (~^(wire74 ? (8'h9d) : wire73)) : ((|wire69) ?
                              (8'hab) : $signed(wire70))) ^ ((wire74 ?
                          (^wire72) : (wire74 && wire72)) - {(wire71 ?
                              wire69 : wire73)})) : (^wire72));
  assign wire76 = (wire71 < (~^wire70[(4'hc):(3'h5)]));
  assign wire77 = $signed({{(wire75[(3'h5):(2'h3)] && wire69),
                          (wire75 && (|(8'ha8)))}});
  assign wire78 = wire69;
  assign wire79 = (~&wire74);
  always
    @(posedge clk) begin
      if (wire69)
        begin
          reg80 <= $signed(wire75[(2'h3):(2'h3)]);
          if (wire70)
            begin
              reg81 <= wire71[(4'h8):(2'h3)];
              reg82 <= $signed((((wire69 ?
                  $signed(wire69) : (wire76 ~^ wire75)) <= (+(8'h9e))) != wire69[(1'h1):(1'h1)]));
            end
          else
            begin
              reg81 <= wire74;
              reg82 <= $unsigned((wire70 ?
                  ((~|wire70[(4'hc):(2'h3)]) ?
                      ((wire73 ^ wire78) ?
                          wire69 : (reg81 ^ wire76)) : (~&$signed(wire75))) : {wire77[(3'h7):(3'h5)]}));
              reg83 <= $unsigned((~|(((wire72 && reg80) ?
                      $signed(reg82) : $unsigned(wire71)) ?
                  (|(^~wire71)) : $unsigned((wire74 ? wire73 : (8'hab))))));
              reg84 <= wire73;
            end
          reg85 <= $signed($unsigned((wire76[(1'h0):(1'h0)] ?
              (~^(wire72 ?
                  wire79 : (8'ha4))) : $signed(reg82[(1'h0):(1'h0)]))));
          if (((~|wire70) ?
              $unsigned($signed(((wire74 >> wire78) ?
                  wire75[(4'h9):(3'h7)] : (+wire70)))) : (wire77[(2'h2):(2'h2)] * $signed($signed(wire70[(4'hc):(3'h7)])))))
            begin
              reg86 <= wire73;
              reg87 <= (reg83 ?
                  wire70[(1'h1):(1'h1)] : (wire79 ?
                      (wire79 ?
                          ($signed(reg80) ?
                              wire75[(1'h0):(1'h0)] : (+reg86)) : (~&reg86[(2'h2):(1'h1)])) : $unsigned($unsigned(((8'had) ?
                          reg82 : wire73)))));
            end
          else
            begin
              reg86 <= ($unsigned((&(reg80[(3'h5):(3'h5)] && (reg83 >>> wire77)))) * reg86);
              reg87 <= reg83;
            end
          reg88 <= ((reg80 ?
                  (wire75[(4'hd):(1'h0)] ?
                      reg83[(3'h5):(2'h2)] : $unsigned((7'h40))) : wire71[(1'h0):(1'h0)]) ?
              {$unsigned(wire77)} : $signed((((-reg87) ?
                      wire76 : (wire69 ? (8'ha9) : wire74)) ?
                  (wire74 <<< wire70[(4'hd):(4'hd)]) : wire73[(4'h8):(3'h5)])));
        end
      else
        begin
          reg80 <= (&reg80);
          if (((((((8'hb4) == reg86) ?
                  (wire79 < wire70) : (wire79 ? (8'hb6) : wire79)) < {wire78,
                  (wire74 ? reg82 : reg80)}) * wire70[(3'h6):(3'h5)]) ?
              (^~$unsigned(reg83)) : (((reg80[(4'h8):(3'h6)] & $unsigned(reg80)) * (&(wire73 ^~ (8'ha5)))) ?
                  $unsigned((wire79 ?
                      (reg85 && wire76) : (wire71 ?
                          reg80 : reg83))) : $signed($unsigned(reg80[(3'h4):(2'h2)])))))
            begin
              reg81 <= (&reg87);
              reg82 <= wire69[(4'h9):(2'h3)];
              reg83 <= $unsigned($signed(wire77[(4'hd):(4'hc)]));
            end
          else
            begin
              reg81 <= $unsigned(((8'h9c) ?
                  reg80 : (reg80 ?
                      ({wire77, (8'h9f)} ?
                          reg88 : (reg80 && wire73)) : {(-reg80)})));
              reg82 <= (&(8'hb8));
              reg83 <= {(wire75[(3'h5):(1'h0)] && reg81[(4'he):(4'hb)]),
                  ((wire77 - (&wire69[(1'h1):(1'h0)])) ^ $unsigned(wire78[(4'hd):(2'h3)]))};
            end
          if (wire77)
            begin
              reg84 <= ($unsigned(((~^(wire71 != (8'hb5))) ?
                      $unsigned($signed(wire73)) : reg81)) ?
                  (wire73 ?
                      {(reg81 < (reg80 | wire79))} : reg83) : {((wire74[(1'h1):(1'h1)] <<< (wire70 > wire76)) ^~ $unsigned((reg88 != (8'h9f))))});
            end
          else
            begin
              reg84 <= {($unsigned(wire74) ?
                      (!wire78) : {(wire78[(4'hf):(4'he)] ?
                              $signed(reg88) : {wire77, reg88})}),
                  reg83};
              reg85 <= (~|(&{wire76[(1'h0):(1'h0)], $unsigned({wire78})}));
            end
        end
      if ((((^{$unsigned(wire76)}) ?
          $unsigned($unsigned($signed((8'hb6)))) : (reg84 ?
              ($signed(wire73) >> $signed(wire69)) : reg85)) ^ (($unsigned({wire77}) > {$unsigned(reg86)}) ?
          $unsigned($signed({wire76,
              (8'hb0)})) : $unsigned(reg80[(3'h6):(1'h0)]))))
        begin
          reg89 <= $signed((~|(^~reg82)));
          reg90 <= wire74;
          reg91 <= $signed(({wire70[(5'h10):(2'h3)]} ?
              $unsigned(((reg90 - wire72) >>> $signed(reg86))) : (($unsigned(reg88) ?
                      reg89[(3'h4):(3'h4)] : $signed(reg82)) ?
                  $signed(reg86[(1'h0):(1'h0)]) : (reg82[(1'h0):(1'h0)] >> (wire77 >> (7'h43))))));
        end
      else
        begin
          reg89 <= ($unsigned(((reg85[(3'h7):(3'h6)] ?
                  reg85[(2'h2):(1'h1)] : (reg82 ? wire69 : (8'haf))) ?
              (((8'hab) <<< wire70) - reg90[(2'h2):(1'h1)]) : $unsigned((^wire77)))) ^~ (((|(reg84 >>> wire74)) ?
              (!(~&reg81)) : ({reg85} ?
                  (^~reg80) : {(8'ha6), wire71})) != $unsigned($signed((reg85 ?
              reg80 : wire73)))));
          reg90 <= (|((8'hae) ?
              $unsigned({(!(8'ha6))}) : $unsigned($unsigned($signed(wire78)))));
        end
      reg92 <= (reg80[(4'hb):(4'h8)] ^ $unsigned($unsigned($unsigned((wire75 ?
          reg86 : wire74)))));
    end
  assign wire93 = reg80;
  assign wire94 = $unsigned(wire93);
  assign wire95 = ($signed(reg89[(2'h3):(2'h3)]) < (&((~&$signed((8'hab))) != (^~{(7'h43),
                      (8'hb0)}))));
  assign wire96 = wire69[(3'h5):(3'h4)];
  assign wire97 = $signed((($unsigned($signed(reg88)) >>> $unsigned(((8'ha3) + wire76))) ?
                      $unsigned(({wire93, reg83} ?
                          wire73[(4'h8):(1'h1)] : (&wire93))) : $signed(((reg92 ?
                          reg90 : reg83) & $signed(reg86)))));
  assign wire98 = $unsigned(wire76);
  always
    @(posedge clk) begin
      reg99 <= reg81;
      reg100 <= $unsigned((^reg81));
      if (((((^$unsigned(wire75)) > (8'hb0)) && (reg89[(3'h6):(2'h2)] << $unsigned($unsigned(wire93)))) <= wire77))
        begin
          reg101 <= wire73;
          reg102 <= wire69;
          reg103 <= reg87;
        end
      else
        begin
          reg101 <= $unsigned(((~(~|wire76[(2'h2):(1'h1)])) == {{wire93}}));
          reg102 <= $unsigned(wire96[(3'h4):(1'h1)]);
          reg103 <= (({(reg88[(3'h4):(2'h3)] ?
                      reg92[(3'h4):(2'h3)] : $signed(wire70)),
                  $unsigned((8'hbf))} ?
              ({wire77[(3'h4):(2'h2)]} ?
                  ((reg83 | reg103) ?
                      reg102 : wire74[(3'h7):(2'h2)]) : wire70) : reg80) <<< $unsigned($unsigned($signed(wire93[(1'h1):(1'h0)]))));
          reg104 <= $unsigned(wire74[(3'h5):(1'h1)]);
          if (($signed($signed((&$signed((8'hb7))))) << reg91))
            begin
              reg105 <= (((~|$unsigned(((7'h42) ^~ reg99))) > ((~&$signed(wire69)) | reg103[(3'h7):(3'h7)])) ?
                  reg104 : (~&{wire93, {wire72}}));
              reg106 <= (wire75 ?
                  $unsigned(wire75[(1'h0):(1'h0)]) : ($unsigned(reg103[(4'he):(4'h9)]) >>> wire78[(4'hc):(4'hc)]));
              reg107 <= $unsigned($unsigned(((reg91 ?
                      $signed(wire93) : reg106[(3'h5):(2'h3)]) ?
                  $unsigned((wire78 ?
                      (8'hb1) : reg87)) : ($unsigned(wire73) && $unsigned(reg84)))));
              reg108 <= ((~&{{$signed(reg90)}}) ?
                  $unsigned((reg101[(3'h4):(3'h4)] ~^ $unsigned((wire73 ?
                      (7'h44) : (8'h9f))))) : ((~^$signed((reg99 ?
                          reg81 : reg84))) ?
                      {($signed(wire97) && wire79)} : $signed(($unsigned(reg101) ?
                          reg84 : (|(8'ha2))))));
              reg109 <= $signed(wire95[(3'h5):(2'h2)]);
            end
          else
            begin
              reg105 <= (8'hbd);
              reg106 <= (!{reg84});
              reg107 <= (wire71 || $unsigned($unsigned($unsigned(reg89[(1'h0):(1'h0)]))));
              reg108 <= (reg102 - $signed((~&(&(reg103 ? wire77 : reg102)))));
            end
        end
      reg110 <= $signed((+wire98));
      reg111 <= reg84;
    end
endmodule

module module17
#(parameter param55 = ((-(((!(8'hbb)) && ((8'hbf) ? (8'hb8) : (8'h9e))) ? (|{(8'ha3), (8'hb4)}) : (8'h9f))) <<< (!{(((8'ha8) ~^ (8'hb5)) ? ((8'hb7) != (8'h9e)) : ((7'h41) ? (8'ha3) : (8'hb4))), {{(8'hb0)}}})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  input wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire22;
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = ({(8'ha4)} ~^ $signed(wire20[(2'h3):(2'h3)]));
  assign wire23 = $signed(wire20[(2'h2):(2'h2)]);
  assign wire24 = {((^~$signed(wire22[(3'h4):(1'h1)])) ?
                          $signed($signed((^(8'hb0)))) : ((^(|wire21)) ?
                              (-$unsigned(wire19)) : $unsigned((wire21 >= wire23)))),
                      wire23};
  assign wire25 = $signed(($signed($unsigned((8'hb0))) | {(!(~&wire20)),
                      wire23[(4'h8):(2'h2)]}));
  assign wire26 = ({(((wire25 ? wire22 : wire19) ?
                              (&wire22) : (wire18 != wire22)) ?
                          $unsigned(wire18) : {wire19[(3'h4):(2'h3)],
                              {(8'hb9)}}),
                      wire19[(1'h0):(1'h0)]} | ({(wire25 ?
                              $signed(wire20) : {wire22}),
                          ((wire23 ? wire25 : wire24) - {(8'haf), wire20})} ?
                      (wire19 ?
                          wire19[(4'h9):(3'h5)] : $unsigned(wire22)) : wire20));
  always
    @(posedge clk) begin
      reg27 <= wire26[(1'h1):(1'h1)];
      reg28 <= wire25;
      if (wire19[(2'h3):(1'h0)])
        begin
          reg29 <= ($signed(wire23[(4'ha):(1'h1)]) <<< (-$signed({{wire26,
                  wire26},
              (wire21 == wire18)})));
          if ((8'h9f))
            begin
              reg30 <= wire23;
              reg31 <= (({(^~{(7'h42)}), {reg27}} ?
                      wire21[(2'h2):(1'h0)] : $unsigned(({wire23} ?
                          $signed(wire26) : (-reg28)))) ?
                  ((~$unsigned({reg29, reg30})) ? wire20 : wire22) : reg28);
            end
          else
            begin
              reg30 <= $signed({(!((~&wire21) ?
                      (wire25 ? wire23 : (8'haa)) : $unsigned(wire26)))});
              reg31 <= (~^(wire22 ?
                  $signed((~|$signed(reg28))) : (reg31 ?
                      $unsigned({(8'hb3)}) : {reg28[(5'h14):(5'h14)]})));
              reg32 <= $signed($signed(reg31[(1'h1):(1'h0)]));
              reg33 <= (~&(wire24 ?
                  ((^~(^reg29)) >>> $unsigned((~^wire24))) : {(^~(wire24 ?
                          wire26 : reg27))}));
            end
        end
      else
        begin
          reg29 <= (8'hb1);
          if ($signed(($signed($unsigned(wire18[(3'h5):(3'h4)])) ?
              $signed($unsigned({wire22, reg27})) : (wire26 ?
                  (reg32 * $signed(reg33)) : {reg33, wire26}))))
            begin
              reg30 <= wire18[(2'h3):(2'h3)];
            end
          else
            begin
              reg30 <= $signed((wire23[(2'h3):(1'h0)] || wire20[(1'h0):(1'h0)]));
              reg31 <= (wire21[(3'h5):(2'h2)] >> ((reg31 < ((^~wire21) >>> (reg29 ?
                  wire19 : wire18))) >= $signed($unsigned((^wire21)))));
              reg32 <= $unsigned($unsigned($unsigned((reg27[(5'h10):(1'h1)] ?
                  ((8'h9e) ? (8'hb8) : (8'hbf)) : $signed(wire19)))));
            end
          reg33 <= $unsigned(($signed(({(8'hb7),
              (7'h44)} <<< (~|wire23))) < wire26[(4'hc):(2'h2)]));
          if (wire21)
            begin
              reg34 <= $signed(((reg33 <<< (^(&wire22))) ?
                  ($unsigned($signed(reg32)) - {$signed((8'ha2)),
                      (reg31 ?
                          wire24 : wire22)}) : ({$signed(wire26)} * reg29)));
              reg35 <= $unsigned($signed((8'hac)));
              reg36 <= (($signed(((reg34 <= reg31) ?
                  (8'ha8) : {wire19})) <<< (~^$unsigned($signed((8'hae))))) * wire22);
            end
          else
            begin
              reg34 <= ($signed(($unsigned((+wire22)) <= $unsigned(wire19))) << $signed((~&(^~wire23))));
              reg35 <= {(~(~$signed($signed((7'h42)))))};
              reg36 <= wire24;
            end
        end
      if ((((wire26 == wire20[(1'h1):(1'h0)]) >> ($unsigned(wire24) * $signed(reg35))) ^ ((~|reg29[(2'h2):(1'h1)]) * (8'hb0))))
        begin
          reg37 <= $signed((+wire19));
          reg38 <= {(wire26 < reg31), (wire26 || $signed(wire18))};
          reg39 <= (((|$unsigned((reg28 + wire25))) ?
                  ({$signed(wire24), (reg35 ? reg29 : reg31)} ?
                      $signed($signed(wire25)) : ((!(8'ha8)) ?
                          $signed(wire18) : (+reg31))) : $unsigned(((reg27 ^~ reg27) ?
                      reg34 : (^~(8'h9e))))) ?
              $unsigned($signed(wire18)) : $unsigned($signed((wire24[(4'ha):(4'h9)] & (wire22 ?
                  reg32 : wire18)))));
        end
      else
        begin
          if ((~|reg36[(1'h0):(1'h0)]))
            begin
              reg37 <= $signed((reg33 ?
                  $signed($signed(wire24)) : ($unsigned(wire24) ?
                      (+((8'ha3) || (8'hb4))) : reg37)));
              reg38 <= ($unsigned(wire18) >>> ((~|$unsigned($signed(wire22))) >= ((^(wire23 ?
                  reg39 : (8'hb1))) ^ $unsigned(wire21[(2'h2):(2'h2)]))));
              reg39 <= $signed(reg37[(4'hb):(4'hb)]);
              reg40 <= (~&reg33);
            end
          else
            begin
              reg37 <= $signed({{{(^~wire23), $signed(wire26)}},
                  wire20[(1'h1):(1'h1)]});
              reg38 <= $signed(($signed(((wire19 ? reg33 : reg33) ?
                  wire19[(3'h7):(2'h2)] : wire24)) - $unsigned(({reg35} * {reg34,
                  wire19}))));
            end
          reg41 <= reg30;
          reg42 <= reg37[(2'h2):(1'h1)];
          if (wire23[(4'hb):(1'h0)])
            begin
              reg43 <= {((^{(+reg36),
                      (reg30 - reg33)}) == reg42[(2'h2):(1'h1)]),
                  reg33};
              reg44 <= (($signed($unsigned(wire24[(1'h0):(1'h0)])) * (8'h9f)) != {($signed(((7'h43) & reg39)) ?
                      ($unsigned(reg43) | $signed(reg31)) : ($unsigned(reg36) | (reg36 < reg43))),
                  reg40[(4'hc):(1'h0)]});
              reg45 <= ($signed($signed(reg36)) | reg40);
              reg46 <= (((reg36 & (reg40 ?
                  $unsigned(reg27) : (reg35 ? wire24 : wire20))) - (reg38 ?
                  (wire20 ?
                      reg44[(2'h3):(1'h0)] : (reg28 < (8'hb4))) : reg32[(3'h6):(3'h6)])) ^ (~^wire26[(4'hc):(4'ha)]));
            end
          else
            begin
              reg43 <= reg46;
              reg44 <= reg31[(2'h2):(2'h2)];
              reg45 <= {$unsigned({$unsigned($unsigned(reg36))})};
              reg46 <= $signed(((($unsigned((8'h9c)) <<< (reg34 >>> reg45)) ?
                      ($unsigned((8'h9c)) != (wire19 ~^ reg29)) : (+(wire18 ?
                          wire24 : reg35))) ?
                  ($signed({reg42}) ?
                      wire26 : ((reg42 && reg45) > $signed(wire22))) : $signed($unsigned($unsigned(wire19)))));
            end
          reg47 <= wire21;
        end
    end
  assign wire48 = $unsigned(((|$signed((|(8'hb8)))) * {(~^(reg44 || reg46))}));
  assign wire49 = reg47[(3'h5):(3'h5)];
  assign wire50 = reg44;
  assign wire51 = {$unsigned(((reg28[(3'h4):(2'h3)] || $signed(reg41)) ?
                          ((reg27 < wire21) <= $signed(reg28)) : $unsigned($unsigned(wire24)))),
                      $unsigned({(^$unsigned(reg44)), (|(|reg43))})};
  assign wire52 = wire21;
  assign wire53 = $signed(reg45);
  assign wire54 = (({reg44[(3'h5):(3'h5)], $signed((+reg42))} ?
                          (~(+{(8'h9f)})) : reg41) ?
                      ((~(^$signed(reg45))) ?
                          $signed($signed((reg45 <= (7'h41)))) : wire50) : (+{wire25,
                          (wire26 ? wire23 : (reg39 >> reg37))}));
endmodule
