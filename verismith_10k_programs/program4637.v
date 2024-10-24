module top
#(parameter param243 = ({((((8'ha4) ? (8'hba) : (8'ha0)) ? ((8'hb0) ? (8'ha1) : (8'hab)) : ((8'hb3) > (8'h9d))) ? ({(8'hb5), (7'h44)} ? ((8'h9f) <= (7'h44)) : ((8'h9e) || (8'ha8))) : (((8'ha8) == (8'ha4)) ? ((8'ha6) ? (8'h9d) : (8'haa)) : (~&(7'h42))))} ~^ (((&((7'h42) <= (8'hba))) ? (((7'h42) >= (8'hb6)) > (+(8'ha5))) : {{(8'ha8), (8'hb4)}, (-(8'h9f))}) ? (~(~^(!(8'ha1)))) : {{(~(8'ha9)), ((8'hbc) >= (8'ha4))}, (((7'h41) ? (8'h9d) : (8'ha2)) ? {(8'hb2)} : ((8'hb7) ? (8'hae) : (8'hb9)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire242;
  wire [(4'h8):(1'h0)] wire241;
  wire signed [(4'he):(1'h0)] wire240;
  wire signed [(4'h9):(1'h0)] wire239;
  wire [(4'hc):(1'h0)] wire238;
  wire signed [(4'h8):(1'h0)] wire237;
  wire [(3'h7):(1'h0)] wire230;
  wire [(2'h3):(1'h0)] wire229;
  wire signed [(4'he):(1'h0)] wire228;
  wire signed [(3'h6):(1'h0)] wire227;
  wire [(4'h9):(1'h0)] wire226;
  wire signed [(3'h4):(1'h0)] wire225;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire220;
  reg [(4'hc):(1'h0)] reg236 = (1'h0);
  reg [(5'h10):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg234 = (1'h0);
  reg [(5'h14):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(2'h3):(1'h0)] reg231 = (1'h0);
  reg [(4'hf):(1'h0)] reg224 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg223 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg222 = (1'h0);
  assign y = {wire242,
                 wire241,
                 wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire5,
                 wire220,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg224,
                 reg223,
                 reg222,
                 (1'h0)};
  assign wire5 = $signed(wire4);
  module6 #() modinst221 (.wire9(wire5), .wire8(wire1), .wire7(wire3), .y(wire220), .clk(clk), .wire11(wire4), .wire10(wire0));
  always
    @(posedge clk) begin
      reg222 <= wire1;
      reg223 <= wire0[(3'h7):(1'h1)];
      reg224 <= ((+((wire0 ?
              (wire4 ? wire1 : wire1) : $unsigned(wire5)) || wire0)) ?
          wire3[(2'h2):(2'h2)] : $signed(wire4[(1'h0):(1'h0)]));
    end
  assign wire225 = wire5[(4'ha):(3'h6)];
  assign wire226 = {(wire2[(4'hb):(1'h1)] - {(wire0[(5'h12):(5'h11)] ?
                               {(8'h9f)} : wire220[(3'h7):(2'h3)])}),
                       ($signed((wire1 ?
                           (wire3 ?
                               reg224 : reg224) : wire5[(1'h1):(1'h1)])) | reg224)};
  assign wire227 = ((+wire220[(2'h3):(2'h2)]) ?
                       ($unsigned((8'hb6)) ?
                           wire220[(2'h2):(1'h0)] : wire220) : (+$signed((~|(^(8'hb2))))));
  assign wire228 = wire4;
  assign wire229 = (((wire1 ?
                               (-$signed(wire4)) : {wire228[(1'h1):(1'h1)],
                                   {wire3}}) ?
                           ($unsigned(wire2) == wire0) : $unsigned(wire226[(2'h3):(1'h1)])) ?
                       {$signed($signed(wire228[(4'h8):(4'h8)])),
                           ((&((8'had) ?
                               (8'hb3) : wire0)) ^ wire228)} : ((($signed(wire3) ?
                               wire0 : (8'hbf)) <= $signed((wire3 ?
                               wire3 : (8'hb3)))) ?
                           $unsigned(wire1[(4'ha):(3'h7)]) : wire220));
  assign wire230 = (^wire220[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg231 <= $signed($unsigned($signed({$signed(reg224)})));
    end
  always
    @(posedge clk) begin
      if (reg222)
        begin
          reg232 <= $unsigned($unsigned((+($unsigned(wire220) ?
              (-wire5) : (wire227 ? wire1 : (8'ha3))))));
        end
      else
        begin
          reg232 <= reg223[(1'h0):(1'h0)];
        end
      if ((+wire230))
        begin
          reg233 <= {((~&$unsigned($unsigned(reg223))) >>> $signed((reg223 + $signed(reg232)))),
              ((reg232[(1'h1):(1'h0)] ? wire225[(2'h3):(2'h3)] : (8'h9d)) ?
                  ((wire230 + wire5[(4'he):(1'h0)]) + (^~(^~wire3))) : wire220[(4'hd):(4'hc)])};
          reg234 <= $signed({reg231[(2'h2):(1'h1)], (8'hb4)});
        end
      else
        begin
          reg233 <= (~|(8'hb8));
        end
      reg235 <= $signed(reg224[(4'hc):(4'hb)]);
      reg236 <= reg231[(1'h0):(1'h0)];
    end
  assign wire237 = $unsigned(((^~wire228) > (|wire1[(4'h8):(3'h5)])));
  assign wire238 = {$unsigned((~^(&(reg232 ? wire2 : (8'h9e))))),
                       reg234[(4'hd):(4'hd)]};
  assign wire239 = $signed($unsigned((+$signed((wire238 || wire237)))));
  assign wire240 = (&($unsigned($signed({wire3, wire220})) ?
                       {wire228} : ($signed((wire220 ?
                           (8'ha2) : (8'ha1))) == ($signed(wire225) ?
                           wire227 : (reg224 * wire225)))));
  assign wire241 = $signed($signed(reg232));
  assign wire242 = $signed(reg224);
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire219;
  wire [(5'h11):(1'h0)] wire205;
  wire [(5'h13):(1'h0)] wire165;
  wire [(3'h7):(1'h0)] wire142;
  wire [(5'h11):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire207;
  wire signed [(4'h9):(1'h0)] wire208;
  wire [(4'hd):(1'h0)] wire209;
  wire signed [(4'hc):(1'h0)] wire217;
  reg [(3'h4):(1'h0)] reg210 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg211 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg216 = (1'h0);
  assign y = {wire219,
                 wire205,
                 wire165,
                 wire142,
                 wire140,
                 wire104,
                 wire40,
                 wire12,
                 wire42,
                 wire43,
                 wire102,
                 wire207,
                 wire208,
                 wire209,
                 wire217,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 reg214,
                 reg215,
                 reg216,
                 (1'h0)};
  assign wire12 = (wire9[(2'h2):(1'h0)] ~^ (+wire8[(2'h2):(2'h2)]));
  module13 #() modinst41 (.wire18(wire12), .wire14(wire8), .wire15(wire9), .clk(clk), .wire16(wire10), .wire17(wire11), .y(wire40));
  assign wire42 = (~^(|(wire8 ?
                      (8'hbd) : ((|wire10) ? wire40 : (wire8 ^~ (8'hb2))))));
  assign wire43 = ((((7'h44) ?
                          ($unsigned(wire11) <= (wire9 ?
                              wire10 : (8'ha3))) : $unsigned(wire12[(4'hd):(4'hc)])) ?
                      wire12 : ((~&wire10) + (&wire42[(2'h2):(2'h2)]))) >> $signed(($signed($signed(wire40)) ~^ wire42[(4'hd):(3'h7)])));
  module44 #() modinst103 (.wire45(wire8), .wire48(wire11), .wire46(wire40), .clk(clk), .y(wire102), .wire49(wire9), .wire47(wire7));
  assign wire104 = wire40[(2'h3):(1'h1)];
  module105 #() modinst141 (.y(wire140), .wire108(wire10), .wire107(wire8), .clk(clk), .wire109(wire102), .wire106(wire40));
  assign wire142 = (|$unsigned($unsigned($unsigned($unsigned(wire40)))));
  module143 #() modinst166 (wire165, clk, wire7, wire12, wire40, wire42);
  module167 #() modinst206 (wire205, clk, wire12, wire42, wire9, wire142, wire10);
  assign wire207 = wire205[(4'hf):(4'he)];
  assign wire208 = $signed($unsigned($signed(wire42[(5'h10):(4'hb)])));
  assign wire209 = {wire12[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg210 <= (+(wire11[(4'hd):(1'h0)] < $signed(((wire104 > wire11) ?
          $unsigned(wire205) : wire205[(4'ha):(3'h4)]))));
      reg211 <= wire102;
      reg212 <= $signed(((wire43[(3'h5):(2'h2)] <= (~((8'ha2) * reg211))) ?
          {((wire42 ? wire104 : wire11) >> $signed(reg210)),
              (8'hb4)} : $signed((wire207[(5'h10):(4'hf)] ?
              (8'ha3) : $signed((8'hae))))));
      reg213 <= wire11;
      if ((~&wire42))
        begin
          reg214 <= (-wire104);
          reg215 <= ($signed(wire40) > $unsigned(wire43[(1'h1):(1'h1)]));
          reg216 <= $signed(((reg210[(3'h4):(1'h0)] || wire7) ?
              $unsigned(({reg214} ~^ wire42[(3'h5):(2'h3)])) : (~|wire102)));
        end
      else
        begin
          reg214 <= $signed(((^~($signed(wire10) ?
                  (wire209 ^ reg214) : (^~reg215))) ?
              wire165[(2'h2):(2'h2)] : (8'hbe)));
        end
    end
  module143 #() modinst218 (.wire145(reg215), .y(wire217), .wire144(wire7), .wire147(wire8), .wire146(wire104), .clk(clk));
  assign wire219 = ((wire104 <= (-($unsigned(reg214) ?
                           (wire12 ? wire209 : wire207) : (&wire205)))) ?
                       {wire8[(3'h5):(2'h2)]} : (|($unsigned($unsigned(reg213)) ^ (~{wire40}))));
endmodule

module module167
#(parameter param204 = (|(((((8'haf) ? (8'ha6) : (8'hac)) ? ((8'ha4) ? (7'h43) : (7'h42)) : {(8'ha4)}) ? (^((7'h41) ? (8'hb0) : (8'h9f))) : ({(8'hbd), (8'hb0)} ? ((8'ha0) ? (8'h9c) : (8'h9e)) : (~&(8'ha1)))) ? (({(8'hb3)} && (~|(8'ha1))) ^~ ((+(8'ha7)) * {(8'haa), (8'ha8)})) : (~&(((7'h43) & (8'hbb)) > (~&(8'haa)))))))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire172;
  input wire [(3'h7):(1'h0)] wire171;
  input wire signed [(4'h8):(1'h0)] wire170;
  input wire [(3'h7):(1'h0)] wire169;
  input wire signed [(5'h14):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire201;
  wire signed [(5'h13):(1'h0)] wire200;
  wire [(5'h10):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(3'h4):(1'h0)] wire189;
  wire [(5'h10):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire186;
  wire signed [(5'h11):(1'h0)] wire185;
  wire [(5'h12):(1'h0)] wire184;
  wire [(5'h12):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire177;
  wire [(5'h10):(1'h0)] wire176;
  wire [(5'h11):(1'h0)] wire175;
  wire [(4'he):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  reg signed [(4'he):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(3'h7):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg [(5'h14):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg179 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire173 = (8'ha6);
  assign wire174 = wire168;
  assign wire175 = (+((~^$unsigned(wire174[(2'h3):(1'h1)])) ?
                       (~|{(7'h43),
                           ((8'hba) ?
                               wire174 : wire172)}) : wire169[(2'h2):(1'h1)]));
  assign wire176 = $signed(wire171[(3'h4):(3'h4)]);
  assign wire177 = (~|($signed($unsigned((^~wire175))) ?
                       wire168 : {(+$signed(wire175)),
                           wire173[(1'h0):(1'h0)]}));
  assign wire178 = $unsigned((^~{wire172,
                       ((wire174 ~^ wire177) ?
                           $signed(wire175) : wire175[(2'h2):(1'h1)])}));
  always
    @(posedge clk) begin
      reg179 <= ($signed($signed(wire172)) < (~(wire169[(3'h5):(3'h4)] ?
          wire168[(5'h13):(2'h3)] : wire174[(4'h9):(4'h8)])));
      reg180 <= ({($unsigned(reg179) <= wire178),
          $unsigned(((wire170 ? wire174 : wire171) ?
              wire169 : wire176))} != (wire174[(4'h9):(3'h5)] ?
          reg179 : wire178[(1'h1):(1'h0)]));
      reg181 <= ($unsigned($unsigned($unsigned($unsigned(wire168)))) && wire175[(4'hd):(4'hd)]);
      reg182 <= wire178[(2'h2):(2'h2)];
    end
  assign wire183 = $signed(wire178);
  assign wire184 = {{wire183,
                           ({(8'hb2)} ? wire178 : (~^wire176[(1'h0):(1'h0)]))}};
  assign wire185 = $signed($unsigned((^~wire183[(4'ha):(1'h0)])));
  assign wire186 = {reg179};
  assign wire187 = (($signed(reg179) ?
                       {$unsigned((^~wire178)),
                           $unsigned($unsigned(wire178))} : (reg181[(2'h3):(2'h3)] ?
                           (~&{wire174, wire171}) : (^~(wire170 ?
                               wire176 : wire172)))) >= wire172[(3'h4):(2'h3)]);
  assign wire188 = ($unsigned($unsigned(wire185)) >> $signed((-$signed($signed(reg180)))));
  assign wire189 = (($signed((wire173 ?
                           (wire183 ? wire174 : wire174) : (wire169 ?
                               wire176 : wire188))) ?
                       (wire188 & $signed(wire169[(3'h4):(3'h4)])) : wire188) & (($unsigned((^reg180)) ?
                           ((wire184 ?
                               wire185 : wire186) ~^ (wire173 & wire188)) : (~&$signed(reg181))) ?
                       $unsigned((&$unsigned(wire183))) : $unsigned((~|(wire169 ?
                           wire187 : reg181)))));
  assign wire190 = wire170;
  assign wire191 = (^~wire169[(3'h6):(3'h4)]);
  always
    @(posedge clk) begin
      if ((^(!reg179[(2'h2):(2'h2)])))
        begin
          reg192 <= (^~reg179);
          reg193 <= wire178[(1'h1):(1'h1)];
          reg194 <= (&$signed($signed(wire175)));
        end
      else
        begin
          if ($signed(wire169))
            begin
              reg192 <= $signed((wire170 == ($unsigned($signed(wire177)) != (^~((8'hb1) ?
                  wire169 : wire188)))));
              reg193 <= (~|wire177[(2'h3):(1'h1)]);
              reg194 <= wire185[(4'hd):(3'h7)];
              reg195 <= wire178;
              reg196 <= (wire173[(3'h4):(1'h0)] <= (-(((wire175 << reg194) & $unsigned(wire187)) + (~^reg194))));
            end
          else
            begin
              reg192 <= wire173[(1'h0):(1'h0)];
            end
        end
      reg197 <= wire190[(4'hc):(3'h6)];
      reg198 <= (reg197 < $signed({$signed((wire170 ? wire184 : wire190))}));
    end
  assign wire199 = ({{$signed({wire174}),
                               (((8'hb1) + wire175) ?
                                   (wire184 <<< wire168) : (reg180 != wire168))},
                           ($unsigned((^wire176)) ?
                               $signed($unsigned(reg197)) : $signed((wire188 ?
                                   wire169 : reg181)))} ?
                       ($unsigned($signed(wire191)) << $unsigned($signed((reg194 >>> wire169)))) : {$unsigned(wire169[(2'h3):(2'h2)])});
  assign wire200 = (((((reg196 ? wire184 : (8'ha3)) ?
                               (wire172 ?
                                   wire172 : wire187) : (reg194 > wire187)) ?
                           reg196[(1'h1):(1'h1)] : (wire199 && wire184[(4'h9):(3'h4)])) && (((wire175 ?
                           wire175 : reg196) == (wire172 ^ wire172)) >= $unsigned((^wire185)))) ?
                       reg194[(3'h7):(3'h7)] : {($unsigned((^~reg195)) ?
                               {$signed((8'haf)),
                                   wire174[(2'h2):(1'h0)]} : wire189)});
  assign wire201 = reg197;
  assign wire202 = reg193;
  assign wire203 = (|{(~&(|$signed((8'hb5)))), (+wire172[(2'h2):(1'h0)])});
endmodule

module module143  (y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire147;
  input wire signed [(5'h11):(1'h0)] wire146;
  input wire [(5'h12):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  wire [(3'h4):(1'h0)] wire158;
  wire signed [(3'h5):(1'h0)] wire157;
  wire signed [(5'h15):(1'h0)] wire156;
  wire signed [(4'hc):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire153;
  wire [(3'h5):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire [(4'h9):(1'h0)] wire150;
  reg [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg [(2'h3):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= wire146;
      reg149 <= {wire146};
    end
  assign wire150 = wire146[(1'h1):(1'h0)];
  assign wire151 = (~&reg149);
  assign wire152 = wire150;
  assign wire153 = wire144;
  assign wire154 = wire145[(3'h5):(2'h2)];
  assign wire155 = ((~^wire151) ^ (~^(wire147 ?
                       wire154[(4'ha):(3'h6)] : wire154)));
  assign wire156 = (wire147[(5'h10):(3'h5)] ^ ($signed($signed((reg148 ~^ (8'ha3)))) ?
                       $unsigned(reg149) : $unsigned(($signed(wire145) ^ (wire145 & reg148)))));
  assign wire157 = wire152;
  assign wire158 = wire156[(4'h8):(1'h1)];
  assign wire159 = $unsigned(((|$signed((wire155 ?
                       wire147 : wire146))) ^~ (wire153[(1'h0):(1'h0)] >= $signed((wire151 < wire157)))));
  assign wire160 = ((((8'hb6) << ({wire145} ?
                               {(8'hbc), wire152} : (wire158 ?
                                   wire150 : wire153))) ?
                           $unsigned((^(|(8'ha6)))) : wire144) ?
                       $unsigned(wire151) : {(&($unsigned(wire156) <= (~wire153))),
                           (wire156[(5'h15):(4'hb)] ?
                               wire151[(4'hb):(1'h1)] : {wire144[(2'h2):(2'h2)],
                                   $signed((7'h43))})});
  always
    @(posedge clk) begin
      reg161 <= $signed(wire144[(2'h3):(2'h3)]);
      reg162 <= $signed((~(&((wire150 < wire146) ?
          (wire153 ^~ (8'hbc)) : (~&(8'hb9))))));
      reg163 <= $signed((wire153[(1'h0):(1'h0)] ?
          (reg149 ?
              $unsigned(wire144) : ((wire154 == wire156) ?
                  $signed(wire152) : $unsigned(reg148))) : (8'ha8)));
    end
  always
    @(posedge clk) begin
      reg164 <= $signed(($signed(wire153) <<< $signed((wire156 ?
          wire150[(3'h4):(2'h2)] : (wire150 ? wire157 : wire146)))));
    end
endmodule

module module105
#(parameter param139 = (((({(8'hb8), (8'hba)} ? (&(8'ha3)) : ((8'haa) ? (8'ha4) : (8'hb7))) ? (((8'ha9) || (8'ha3)) + (8'hb9)) : ((|(8'hb3)) ? (!(7'h42)) : ((7'h44) ? (8'had) : (8'hbb)))) | (^~(((8'ha7) ? (8'ha1) : (8'h9c)) & {(8'hbe)}))) ? (^~((~(8'ha7)) ^ (~|((8'hb6) ~^ (8'h9f))))) : (8'had)))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire signed [(5'h15):(1'h0)] wire108;
  input wire signed [(4'hf):(1'h0)] wire107;
  input wire signed [(2'h2):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(4'hd):(1'h0)] wire133;
  wire [(4'hc):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(5'h14):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  assign y = {wire138,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire110,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg112,
                 (1'h0)};
  assign wire110 = ($signed(((8'h9f) ^~ ((wire106 <= wire107) + (~|(8'ha3))))) ?
                       $signed((&wire107[(4'h8):(1'h0)])) : wire109);
  assign wire111 = (-($unsigned(($signed(wire108) == (wire108 ?
                           wire107 : wire106))) ?
                       $unsigned((~&(|wire109))) : (!(~&$signed(wire108)))));
  always
    @(posedge clk) begin
      reg112 <= $unsigned((~^$signed(wire110[(4'hc):(2'h3)])));
    end
  assign wire113 = wire110;
  assign wire114 = wire108[(5'h13):(1'h1)];
  assign wire115 = wire107[(4'he):(4'h8)];
  assign wire116 = wire106;
  assign wire117 = $signed(wire108[(4'hc):(1'h0)]);
  assign wire118 = {(&$signed((^wire113[(2'h3):(1'h0)])))};
  assign wire119 = ($signed($signed($signed({wire117,
                       wire113}))) != (~^wire115));
  assign wire120 = wire115;
  always
    @(posedge clk) begin
      if ((~wire111))
        begin
          reg121 <= $signed({wire118});
          if (reg112)
            begin
              reg122 <= $unsigned(((~|((!wire107) && (wire113 ?
                  wire113 : wire108))) <= {reg112,
                  (reg112 ? wire106[(1'h0):(1'h0)] : wire116)}));
              reg123 <= (+$signed(((+(wire119 < wire119)) && wire119)));
              reg124 <= (wire119[(5'h13):(1'h1)] ?
                  ($unsigned(reg122[(2'h2):(1'h0)]) * wire117) : ({($signed(wire118) >= {wire117,
                          reg112})} << {((reg123 ? wire107 : wire119) ?
                          reg112[(4'he):(3'h6)] : $unsigned(wire111)),
                      $signed(reg112[(3'h5):(1'h1)])}));
              reg125 <= reg112[(3'h4):(1'h0)];
            end
          else
            begin
              reg122 <= reg112;
              reg123 <= $unsigned((reg125[(4'ha):(4'h9)] >>> wire119));
              reg124 <= ({(&wire117[(2'h3):(2'h3)])} ~^ (~|(8'hb7)));
              reg125 <= wire108[(1'h1):(1'h1)];
              reg126 <= $unsigned((reg122[(1'h1):(1'h0)] ~^ (^~((^~wire114) > (reg125 ?
                  wire111 : wire109)))));
            end
        end
      else
        begin
          reg121 <= (~($signed(wire108[(1'h1):(1'h1)]) ?
              wire109 : $unsigned($signed(wire119[(4'h8):(2'h2)]))));
          reg122 <= (8'hb7);
          reg123 <= wire113[(1'h1):(1'h0)];
          reg124 <= {(+reg112)};
        end
      reg127 <= $signed((($unsigned((8'haf)) << {$unsigned(wire111)}) ?
          {$signed((wire116 ?
                  wire116 : (8'hbc)))} : (|$unsigned($unsigned(wire113)))));
      reg128 <= reg122[(1'h0):(1'h0)];
    end
  assign wire129 = ((wire113[(3'h7):(1'h0)] ?
                       (wire117[(1'h0):(1'h0)] == wire117[(5'h13):(4'he)]) : $unsigned(reg124)) & $signed(wire111[(2'h2):(1'h1)]));
  assign wire130 = {(-wire119[(3'h5):(3'h4)]),
                       ((!reg126[(2'h2):(1'h1)]) > (reg121[(1'h0):(1'h0)] ?
                           wire111 : (-$signed(wire118))))};
  assign wire131 = $signed(({(reg123[(2'h2):(2'h2)] && (wire114 || wire111)),
                           reg123[(2'h2):(1'h0)]} ?
                       ($signed((&(8'hb5))) > wire129) : ($signed(wire119[(3'h5):(1'h0)]) <= {(wire119 ~^ reg123),
                           (wire116 ? wire106 : wire115)})));
  assign wire132 = reg125[(2'h2):(1'h1)];
  assign wire133 = (reg127[(2'h2):(1'h1)] * reg126[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg134 <= $unsigned($unsigned($signed(($signed((8'hb7)) ?
          reg121[(4'hc):(2'h3)] : {wire109, wire120}))));
      reg135 <= ($signed({((wire106 ? wire133 : wire131) <<< (wire130 ?
                  (7'h40) : wire113)),
              (!$signed(wire120))}) ?
          wire131[(1'h0):(1'h0)] : reg128);
      reg136 <= $unsigned($signed(((~^reg128[(1'h1):(1'h0)]) != (reg134[(1'h0):(1'h0)] ?
          (8'hb8) : ((8'had) & wire109)))));
      reg137 <= $unsigned($unsigned((+reg135)));
    end
  assign wire138 = $signed(wire129[(3'h4):(1'h1)]);
endmodule

module module44
#(parameter param101 = (8'ha3))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h233):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire49;
  input wire signed [(5'h12):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(5'h15):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(3'h6):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire signed [(4'h8):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire50;
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire63,
                 wire62,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire50,
                 reg100,
                 reg99,
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
                 reg80,
                 reg79,
                 reg78,
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
                 reg61,
                 reg60,
                 reg59,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = (wire46[(4'hd):(2'h3)] ?
                      (wire49[(4'hb):(1'h0)] >= wire47[(4'hc):(3'h5)]) : wire49[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg51 <= (($signed(((wire50 >>> (7'h42)) ?
                  (~&wire48) : $signed(wire45))) ?
              (~&$signed((wire50 & wire50))) : (($signed(wire46) ?
                      wire48[(4'hd):(3'h5)] : (|wire45)) ?
                  wire50 : $unsigned((wire46 < (8'hbd))))) ?
          $signed(wire45[(2'h3):(1'h0)]) : {$unsigned({((8'hb3) ?
                      wire46 : (8'hba))}),
              (wire45 ^~ $unsigned((^wire49)))});
      reg52 <= $signed(((wire48[(5'h12):(2'h2)] ?
          (wire47 >>> $unsigned(reg51)) : wire50[(3'h6):(2'h2)]) && (+(~&$signed(wire48)))));
    end
  assign wire53 = {$unsigned(reg51[(3'h4):(2'h3)]), $unsigned((8'ha0))};
  assign wire54 = reg51[(3'h7):(1'h0)];
  assign wire55 = $signed((-$unsigned($signed((|(8'ha2))))));
  assign wire56 = (wire47 ?
                      ((reg51[(3'h6):(1'h1)] ?
                          $unsigned((wire46 ?
                              wire54 : wire48)) : reg51[(3'h5):(1'h0)]) > wire50) : {$unsigned({wire45}),
                          (~&$signed((!wire50)))});
  assign wire57 = $signed((~|wire56));
  assign wire58 = reg51[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg59 <= $signed(reg52[(1'h1):(1'h1)]);
      reg60 <= (reg51 >>> (^$unsigned($signed((wire50 ? wire53 : reg51)))));
      reg61 <= (&(7'h44));
    end
  assign wire62 = $signed($unsigned(($signed((wire55 ?
                      reg61 : wire54)) >= (8'ha7))));
  assign wire63 = ($signed(({$unsigned(wire45), ((8'ha6) ? wire48 : wire46)} ?
                      (!(~wire45)) : ((+wire62) <= wire47[(1'h0):(1'h0)]))) >>> wire56);
  always
    @(posedge clk) begin
      if (wire46[(5'h12):(2'h3)])
        begin
          reg64 <= wire55[(4'h8):(3'h7)];
          if ((~^((wire57 != wire46) < {{(+wire48)}})))
            begin
              reg65 <= wire53;
              reg66 <= reg61;
              reg67 <= (((!(wire48 ?
                  ((8'haf) > wire62) : (~^wire50))) + wire63) << (~^wire58[(1'h1):(1'h1)]));
            end
          else
            begin
              reg65 <= ($signed($unsigned({reg51[(3'h6):(3'h4)],
                      (^~(8'h9e))})) ?
                  $unsigned(reg59[(3'h6):(1'h1)]) : {$signed($signed($unsigned(reg60)))});
              reg66 <= {wire56[(2'h3):(1'h0)],
                  (&(^~((wire63 ? wire55 : reg65) && reg59)))};
              reg67 <= ((((!(~reg64)) ?
                  wire63 : wire46[(4'he):(3'h4)]) == wire56[(1'h1):(1'h1)]) >>> (!$signed($signed(wire57[(3'h6):(2'h2)]))));
              reg68 <= (|({(((8'hab) ? reg51 : wire62) ?
                      $signed((8'hbb)) : (~wire46))} << reg64));
            end
          reg69 <= (~|wire50);
          reg70 <= wire58[(1'h0):(1'h0)];
          reg71 <= (reg52[(3'h6):(1'h1)] ?
              (reg66 || wire56[(4'h8):(3'h6)]) : (~^reg61[(4'h8):(3'h5)]));
        end
      else
        begin
          reg64 <= ((wire53 + ((~|(|wire55)) > wire48)) ?
              wire46[(4'h8):(3'h7)] : $unsigned($signed(reg67[(4'hd):(3'h4)])));
          if ({(reg52[(2'h2):(1'h0)] ~^ {$unsigned($unsigned(reg68)),
                  $unsigned($unsigned(reg69))}),
              ((8'ha5) && (7'h42))})
            begin
              reg65 <= wire47;
              reg66 <= reg68[(1'h0):(1'h0)];
              reg67 <= (wire55[(4'he):(4'ha)] ?
                  {(-$unsigned((!reg69))),
                      wire62} : {$signed(($unsigned(reg64) ^ reg61[(1'h1):(1'h0)]))});
              reg68 <= (8'hb3);
            end
          else
            begin
              reg65 <= {(^~($signed(reg64) >> (&wire46))),
                  wire49[(4'hc):(3'h4)]};
            end
          reg69 <= (({((8'ha9) ?
                  $signed(reg61) : {wire45})} < $unsigned($unsigned({reg64}))) >>> wire45);
          reg70 <= (-(((~|{(8'ha5),
              (8'ha6)}) != $signed(wire56)) << $unsigned(wire45)));
        end
      if (((($unsigned((+wire63)) & ($signed(wire63) ?
              (8'hb8) : (wire48 ? wire55 : wire63))) ?
          (reg70 ?
              (~^(reg69 >> reg65)) : $signed((wire50 >> wire49))) : reg52[(1'h1):(1'h1)]) ^ (&reg52[(4'h8):(3'h5)])))
        begin
          reg72 <= {(reg51[(3'h7):(3'h4)] | {$unsigned(wire56[(2'h3):(2'h3)])})};
          reg73 <= (~$signed(wire45[(3'h5):(1'h0)]));
          reg74 <= {wire57[(2'h2):(1'h1)],
              ({{(wire45 ? reg51 : reg64)},
                  $unsigned(wire62)} && ({$signed(wire48)} + wire48[(2'h3):(1'h0)]))};
          reg75 <= (((wire56 ?
              (reg61 * $unsigned((8'hbe))) : reg64[(2'h2):(1'h0)]) == wire55) >= (!($unsigned((reg52 ?
                  wire49 : wire46)) ?
              (^~$signed((7'h40))) : $unsigned((reg71 ? reg70 : wire47)))));
        end
      else
        begin
          reg72 <= ({(8'hae),
              $signed($unsigned(reg74[(2'h3):(2'h2)]))} != (!$unsigned((reg61 ?
              wire49[(1'h1):(1'h1)] : wire50[(3'h6):(2'h3)]))));
          if (reg72)
            begin
              reg73 <= (reg59[(1'h0):(1'h0)] ?
                  (~|(-reg68)) : ($unsigned(($signed((8'ha8)) >>> reg69[(2'h2):(1'h1)])) >> (|{{reg61}})));
              reg74 <= $signed(reg70);
              reg75 <= $unsigned(wire48);
              reg76 <= $unsigned((~reg51[(3'h4):(2'h3)]));
              reg77 <= ($unsigned($signed((~^$unsigned((8'ha9))))) ~^ reg65[(3'h4):(2'h3)]);
            end
          else
            begin
              reg73 <= (reg74[(2'h3):(2'h3)] >>> $unsigned({wire62[(3'h5):(1'h0)],
                  reg74[(1'h0):(1'h0)]}));
              reg74 <= $signed(reg60);
              reg75 <= reg65[(1'h0):(1'h0)];
              reg76 <= $signed($unsigned(wire46[(4'h8):(1'h1)]));
            end
          reg78 <= (!(!reg61[(4'he):(4'he)]));
        end
    end
  always
    @(posedge clk) begin
      reg79 <= $unsigned((wire48 > reg69));
      reg80 <= (~reg69);
    end
  assign wire81 = $unsigned((wire57[(2'h3):(2'h3)] >>> (wire62 * $unsigned((~&(8'hba))))));
  assign wire82 = (8'hb6);
  assign wire83 = (^~wire45[(2'h2):(1'h1)]);
  assign wire84 = {(reg59[(3'h6):(3'h6)] ?
                          {$unsigned(((8'hb6) >= reg52))} : $signed($signed(reg60[(3'h4):(1'h1)])))};
  assign wire85 = (~^wire82);
  assign wire86 = (~^reg74);
  assign wire87 = (&(8'haa));
  assign wire88 = reg74;
  always
    @(posedge clk) begin
      reg89 <= $unsigned($signed(wire48[(4'h9):(3'h7)]));
      reg90 <= $signed(wire54);
    end
  always
    @(posedge clk) begin
      if (reg76)
        begin
          reg91 <= {wire55};
        end
      else
        begin
          reg91 <= ((-(~(&wire82[(1'h1):(1'h1)]))) ?
              $signed(($signed(reg75) ?
                  (~|(wire48 && reg60)) : {reg78[(3'h7):(3'h7)]})) : (reg52 ?
                  reg91[(3'h6):(2'h2)] : (^$unsigned((wire56 ^ wire83)))));
          reg92 <= $signed(reg76);
          reg93 <= (wire63[(4'hf):(4'ha)] ?
              (wire86[(3'h4):(2'h2)] ~^ {reg68[(3'h4):(1'h1)],
                  (^~(reg52 ?
                      reg65 : (8'hb5)))}) : ($unsigned(reg80) - ($unsigned(reg73[(3'h4):(1'h0)]) ?
                  ($signed(reg72) ?
                      (~|(7'h40)) : (^~wire62)) : {$unsigned((8'hae))})));
        end
      reg94 <= (reg66 ?
          wire50[(5'h14):(3'h4)] : $signed({$unsigned($unsigned(reg78)),
              wire83}));
      reg95 <= $unsigned(($signed(wire86) ^~ wire85));
      reg96 <= ((wire48[(4'hf):(2'h2)] ^ (~^$signed(wire63[(4'hf):(3'h7)]))) & {($unsigned((reg60 != reg78)) & ((-reg73) ?
              reg69[(3'h7):(1'h0)] : $unsigned(reg78))),
          reg90});
      if ((~|($signed($signed(((8'ha4) >> wire57))) ~^ ($unsigned((wire57 ?
              wire88 : reg80)) ?
          reg51 : ($signed(reg77) ? (wire47 >= wire57) : (-reg73))))))
        begin
          if (reg68)
            begin
              reg97 <= $signed($signed((~&(8'haf))));
              reg98 <= $signed((reg97[(3'h5):(1'h0)] ?
                  $unsigned($unsigned($signed(wire87))) : reg97[(3'h5):(2'h3)]));
            end
          else
            begin
              reg97 <= reg65[(3'h4):(2'h2)];
            end
        end
      else
        begin
          if (reg80)
            begin
              reg97 <= $unsigned(reg74[(2'h3):(2'h2)]);
            end
          else
            begin
              reg97 <= $unsigned(wire63[(3'h4):(2'h2)]);
              reg98 <= wire81;
            end
          reg99 <= reg75;
          reg100 <= wire86;
        end
    end
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(5'h10):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg22 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire21,
                 wire20,
                 wire19,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire19 = ((^~($signed((^wire17)) >>> wire18)) + (^$signed(wire17[(2'h2):(1'h1)])));
  assign wire20 = wire14;
  assign wire21 = $signed((wire20 ?
                      ($signed(wire19) ?
                          $signed((~&wire19)) : wire20[(2'h2):(1'h1)]) : (wire17[(4'h9):(3'h7)] >>> ((wire17 - wire18) ?
                          (wire18 ? wire20 : wire15) : $unsigned(wire19)))));
  always
    @(posedge clk) begin
      reg22 <= wire20[(2'h3):(1'h0)];
      reg23 <= $signed($unsigned((-reg22[(2'h2):(2'h2)])));
    end
  assign wire24 = {(wire17 ?
                          wire18 : ($unsigned(wire16) < (wire14[(4'hc):(4'hb)] ?
                              $unsigned((8'hb4)) : $unsigned(wire21))))};
  assign wire25 = (~|(((wire17 ? reg23 : reg22[(2'h2):(1'h0)]) ?
                      $unsigned((reg22 ?
                          wire21 : wire16)) : reg22) <= wire19[(1'h1):(1'h0)]));
  assign wire26 = $signed(wire17[(4'hd):(4'ha)]);
  assign wire27 = {$signed($signed($unsigned((8'hb1))))};
  assign wire28 = {(!wire25), ((+(|$unsigned(wire16))) ? (8'hac) : wire27)};
  always
    @(posedge clk) begin
      reg29 <= (+(^$unsigned(wire14)));
      reg30 <= wire25[(2'h2):(1'h0)];
      reg31 <= {$unsigned(wire16[(4'ha):(4'h9)]),
          $unsigned($signed($signed(wire16[(1'h0):(1'h0)])))};
      reg32 <= ($signed(((wire28[(3'h4):(2'h2)] ?
              $unsigned(wire24) : (wire25 ? reg31 : wire21)) & (~|reg22))) ?
          wire28 : wire15[(3'h4):(1'h0)]);
    end
  assign wire33 = wire28;
  assign wire34 = wire24;
  assign wire35 = (!{reg32[(3'h5):(1'h0)], $signed($unsigned((+wire21)))});
  assign wire36 = (+($unsigned(((reg29 - (8'hb6)) ?
                      (wire27 ?
                          reg30 : reg30) : wire17[(4'ha):(3'h6)])) >>> ($unsigned(reg22) <= $signed((wire18 <<< wire19)))));
  assign wire37 = $signed(wire27[(4'hd):(1'h1)]);
  assign wire38 = wire36;
  assign wire39 = {$signed($unsigned(wire35))};
endmodule
