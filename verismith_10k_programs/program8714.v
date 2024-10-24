module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire308;
  wire [(4'he):(1'h0)] wire307;
  wire signed [(2'h3):(1'h0)] wire304;
  wire [(5'h12):(1'h0)] wire291;
  wire [(5'h14):(1'h0)] wire289;
  wire signed [(4'h8):(1'h0)] wire155;
  wire [(4'h8):(1'h0)] wire154;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire151;
  reg signed [(4'hc):(1'h0)] reg292 = (1'h0);
  reg [(4'ha):(1'h0)] reg293 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg294 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg295 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg296 = (1'h0);
  reg [(3'h7):(1'h0)] reg297 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg298 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg299 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg300 = (1'h0);
  reg [(3'h7):(1'h0)] reg301 = (1'h0);
  reg [(4'hf):(1'h0)] reg302 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg303 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg305 = (1'h0);
  reg [(3'h7):(1'h0)] reg306 = (1'h0);
  assign y = {wire308,
                 wire307,
                 wire304,
                 wire291,
                 wire289,
                 wire155,
                 wire154,
                 wire153,
                 wire151,
                 reg292,
                 reg293,
                 reg294,
                 reg295,
                 reg296,
                 reg297,
                 reg298,
                 reg299,
                 reg300,
                 reg301,
                 reg302,
                 reg303,
                 reg305,
                 reg306,
                 (1'h0)};
  module4 #() modinst152 (wire151, clk, wire0, wire2, wire3, wire1, (8'h9f));
  assign wire153 = $signed(((wire0[(3'h4):(2'h3)] ?
                       (wire0 * (^~wire151)) : (+(~|wire151))) != $signed(($signed(wire151) | (~^wire151)))));
  assign wire154 = $unsigned((~wire1));
  assign wire155 = wire153[(2'h2):(2'h2)];
  module156 #() modinst290 (wire289, clk, wire151, wire153, wire0, wire3);
  assign wire291 = (($signed((wire154 ?
                           wire155[(1'h1):(1'h0)] : wire151[(3'h5):(1'h1)])) + wire155[(2'h3):(1'h1)]) ?
                       $signed(wire3[(3'h6):(3'h5)]) : ((~wire1) && wire0));
  always
    @(posedge clk) begin
      reg292 <= wire155[(3'h4):(2'h3)];
      if (wire289)
        begin
          reg293 <= ((|(wire289[(2'h2):(2'h2)] >= {(wire289 ?
                  wire0 : wire2)})) ~^ $signed(($signed($signed(wire151)) | (wire289 ?
              reg292[(3'h7):(1'h0)] : $unsigned(wire0)))));
          if ((wire291 ?
              ((^~($unsigned((8'hb7)) <<< wire1[(3'h7):(3'h7)])) * (8'hb4)) : {{wire154}}))
            begin
              reg294 <= (8'h9d);
              reg295 <= ((wire154 <<< (($unsigned((8'h9e)) ^~ wire2) ?
                      ((&wire2) ?
                          (wire1 ? wire3 : reg294) : (wire3 ?
                              wire151 : reg294)) : wire3[(4'hc):(4'hb)])) ?
                  ($signed(((wire3 >> wire291) == ((8'ha6) >> wire151))) ?
                      (+$unsigned((|wire291))) : {$signed($unsigned((8'hb0)))}) : $unsigned((~$unsigned(((8'hb8) ?
                      reg293 : reg294)))));
            end
          else
            begin
              reg294 <= {($unsigned({(reg294 > wire291),
                      $signed(reg293)}) >= ((~&$unsigned(wire0)) ?
                      wire151 : (8'hb1)))};
              reg295 <= $unsigned((~&(-wire289[(2'h2):(2'h2)])));
              reg296 <= wire0[(4'hb):(4'hb)];
              reg297 <= $signed($unsigned((-(~&{wire3, wire154}))));
            end
          if ($unsigned(reg293[(3'h7):(3'h4)]))
            begin
              reg298 <= $signed(wire2);
              reg299 <= $unsigned((($signed(reg297[(3'h7):(3'h7)]) ?
                      reg294 : ((wire289 < wire151) ?
                          $unsigned(wire153) : reg295[(1'h1):(1'h1)])) ?
                  $signed($signed(((8'hb3) <<< wire2))) : {({wire1} < (wire2 & (8'hba))),
                      $unsigned(wire154)}));
              reg300 <= $unsigned(wire151);
              reg301 <= (-$signed({$unsigned({wire2})}));
            end
          else
            begin
              reg298 <= $signed($unsigned(reg301));
            end
        end
      else
        begin
          reg293 <= (wire291[(2'h3):(1'h1)] != (!(8'ha7)));
          if ((8'hb0))
            begin
              reg294 <= (~|$signed(({$signed(wire1),
                  $signed(wire3)} & reg299[(4'hd):(4'hd)])));
              reg295 <= (~^reg300);
              reg296 <= ((!(~{$signed(reg292), (reg292 ? reg293 : (7'h42))})) ?
                  ((((wire151 ? wire2 : reg292) ?
                      (wire0 ?
                          reg298 : (7'h44)) : (wire291 <<< wire289)) | $unsigned(wire289[(1'h1):(1'h0)])) & wire3[(4'he):(1'h0)]) : wire2[(3'h6):(2'h3)]);
              reg297 <= ($unsigned((^$signed($signed(reg295)))) >>> $signed($unsigned($signed($signed((8'ha2))))));
            end
          else
            begin
              reg294 <= (^(~|((^~{(8'hba), wire289}) ?
                  (&$unsigned(reg299)) : {(wire289 ? wire291 : wire291)})));
            end
        end
      reg302 <= (-wire291[(4'hd):(2'h2)]);
      reg303 <= $signed(($signed($unsigned(reg293)) != wire155));
    end
  assign wire304 = reg300[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg305 <= ((wire154 ?
          wire304 : (reg292 ?
              (7'h41) : (^~(wire289 > reg296)))) | ($signed($signed((wire155 - wire3))) ?
          (!(8'ha6)) : $unsigned(wire2[(1'h1):(1'h1)])));
      reg306 <= wire153[(4'h8):(2'h2)];
    end
  assign wire307 = ((reg301[(3'h6):(2'h3)] > wire153[(1'h1):(1'h0)]) ?
                       $signed($signed($unsigned($signed((8'hb0))))) : $unsigned($signed(($unsigned(reg303) ?
                           (wire0 ? reg298 : reg300) : wire2[(1'h1):(1'h1)]))));
  module218 #() modinst309 (.wire222(reg301), .wire223(wire289), .wire219(wire155), .clk(clk), .wire220(wire0), .y(wire308), .wire221(wire153));
endmodule

module module156
#(parameter param288 = ((|(({(8'hb8), (8'ha1)} ? ((8'h9f) ? (8'ha9) : (8'h9d)) : ((7'h40) ? (8'hb7) : (8'hab))) ? (((8'h9f) ? (8'haa) : (7'h41)) ? {(8'hab), (8'ha4)} : (8'h9d)) : (((8'hbb) <= (8'hb5)) + ((8'h9c) ? (8'ha5) : (7'h44))))) ? ({(|((7'h43) ? (8'hab) : (8'haa)))} << ((8'hba) - (((8'ha9) ? (8'ha8) : (7'h42)) * ((8'haf) ? (8'hb4) : (8'hb5))))) : ((^(~^((8'hbd) ? (7'h42) : (8'hb1)))) ? ((+{(8'hb0), (8'ha8)}) ^~ (&((8'ha2) != (8'ha4)))) : (({(8'hbe)} > {(8'hac), (8'ha3)}) ? (((8'hb2) ? (8'hb9) : (8'h9d)) ? ((8'hb6) << (8'haf)) : ((8'hbf) ? (7'h44) : (7'h41))) : (((8'hb9) >= (8'ha7)) ? ((8'haa) >= (8'hbe)) : ((8'ha4) ? (8'haf) : (8'ha3)))))))
(y, clk, wire157, wire158, wire159, wire160);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire157;
  input wire signed [(5'h13):(1'h0)] wire158;
  input wire [(5'h12):(1'h0)] wire159;
  input wire [(5'h13):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire287;
  wire signed [(4'hd):(1'h0)] wire277;
  wire [(3'h5):(1'h0)] wire276;
  wire signed [(3'h6):(1'h0)] wire273;
  wire signed [(5'h13):(1'h0)] wire241;
  wire [(4'he):(1'h0)] wire239;
  wire signed [(4'he):(1'h0)] wire217;
  wire [(4'hc):(1'h0)] wire216;
  wire [(5'h11):(1'h0)] wire215;
  wire signed [(3'h6):(1'h0)] wire214;
  wire signed [(4'h9):(1'h0)] wire209;
  wire [(2'h3):(1'h0)] wire208;
  wire [(5'h12):(1'h0)] wire207;
  wire [(3'h5):(1'h0)] wire176;
  wire signed [(4'h8):(1'h0)] wire178;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire205;
  reg [(4'hf):(1'h0)] reg286 = (1'h0);
  reg [(5'h10):(1'h0)] reg285 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg284 = (1'h0);
  reg [(5'h15):(1'h0)] reg283 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg282 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg281 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg280 = (1'h0);
  reg [(4'hf):(1'h0)] reg279 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg278 = (1'h0);
  reg [(5'h15):(1'h0)] reg275 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg [(3'h4):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(5'h11):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg166 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg211 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  assign y = {wire287,
                 wire277,
                 wire276,
                 wire273,
                 wire241,
                 wire239,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire209,
                 wire208,
                 wire207,
                 wire176,
                 wire178,
                 wire179,
                 wire205,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg279,
                 reg278,
                 reg275,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg177,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg161 <= wire160;
      reg162 <= ({wire160[(4'ha):(4'h9)]} ~^ $signed($unsigned((wire157 ?
          ((8'hb7) ? wire158 : wire160) : (8'ha8)))));
      if ($unsigned($unsigned($unsigned((-$unsigned(reg162))))))
        begin
          reg163 <= $unsigned($signed(wire160));
          reg164 <= (~&{reg161[(4'hc):(4'hb)]});
          reg165 <= (~&(8'hac));
        end
      else
        begin
          if ($unsigned(wire158))
            begin
              reg163 <= ({(reg162 | ((reg163 ? reg162 : reg164) ^ wire157)),
                  ($signed((|reg161)) ?
                      ($signed((8'hbe)) ?
                          $signed(reg162) : (reg161 ?
                              wire158 : wire159)) : $unsigned({reg165}))} ~^ wire158);
              reg164 <= $unsigned((8'ha1));
              reg165 <= (^~$unsigned(reg165[(4'h8):(2'h3)]));
              reg166 <= reg162;
              reg167 <= $unsigned((^reg163));
            end
          else
            begin
              reg163 <= wire160[(4'hd):(4'h8)];
            end
          if ((8'ha4))
            begin
              reg168 <= reg167[(3'h5):(1'h0)];
              reg169 <= reg161[(3'h7):(3'h5)];
              reg170 <= (~^(^$signed($signed(reg166[(3'h7):(1'h0)]))));
              reg171 <= wire157[(3'h4):(1'h0)];
              reg172 <= $signed(({wire160[(3'h5):(3'h5)],
                      {(wire157 ? reg168 : (7'h41)), $signed(wire158)}} ?
                  (|$signed(wire160[(3'h7):(3'h6)])) : {$signed((reg164 ?
                          reg170 : reg162))}));
            end
          else
            begin
              reg168 <= reg171;
              reg169 <= reg162;
              reg170 <= reg168;
              reg171 <= (reg161[(5'h14):(5'h12)] >>> reg163);
              reg172 <= (8'hb5);
            end
          if (($signed({($unsigned(reg171) ?
                      (wire157 ? reg163 : reg164) : wire160[(5'h11):(4'hd)])}) ?
              $signed(reg163) : {(~&(reg161[(5'h14):(3'h4)] ?
                      (wire159 != wire160) : (reg164 ? (8'ha8) : reg163)))}))
            begin
              reg173 <= {reg166, $signed($signed(reg162))};
            end
          else
            begin
              reg173 <= (^(^~$signed((wire159[(4'hd):(4'h9)] - {(8'hab)}))));
            end
          if ($signed($unsigned($unsigned($unsigned((reg171 ?
              reg168 : reg167))))))
            begin
              reg174 <= (reg168 ?
                  (|reg173[(3'h4):(2'h2)]) : ((reg172[(4'hd):(3'h7)] ?
                          wire159 : (reg171 ?
                              (reg165 ?
                                  reg165 : (8'h9d)) : reg164[(4'h9):(2'h3)])) ?
                      reg166 : reg170));
              reg175 <= wire160[(1'h1):(1'h1)];
            end
          else
            begin
              reg174 <= reg169;
            end
        end
    end
  assign wire176 = (reg166 ? $unsigned($signed({wire160})) : (8'hbb));
  always
    @(posedge clk) begin
      reg177 <= reg168;
    end
  assign wire178 = reg168;
  assign wire179 = $signed({reg164[(4'ha):(2'h3)],
                       (~^(reg163 ? reg167 : (^~reg169)))});
  always
    @(posedge clk) begin
      if (reg161)
        begin
          reg180 <= $signed(((((reg161 == reg164) ?
                  reg175 : (wire159 ? wire158 : reg174)) ~^ wire179) ?
              $unsigned((wire157[(2'h3):(1'h1)] ?
                  reg173[(2'h2):(1'h0)] : wire158)) : (reg166 ^ reg177[(4'hb):(2'h2)])));
          reg181 <= $unsigned(reg162[(3'h6):(3'h5)]);
          reg182 <= $signed(wire159);
          reg183 <= reg161[(5'h11):(3'h6)];
        end
      else
        begin
          reg180 <= {reg173,
              {(~((reg163 <<< reg183) >> (reg183 ? reg177 : (8'hb1)))),
                  $unsigned(wire158)}};
          reg181 <= (&(|$signed(reg161)));
          if ($signed(({{reg163,
                  $signed((8'hb4))}} << (~($signed(reg162) ^ reg172[(4'hf):(3'h5)])))))
            begin
              reg182 <= $unsigned((wire160[(3'h7):(3'h4)] ?
                  $signed({reg161}) : (^$signed(reg161))));
              reg183 <= (^~$signed(($signed($signed(reg175)) == ($unsigned((8'hbc)) ?
                  (reg181 ? reg180 : reg181) : reg174))));
              reg184 <= ((&{{wire157[(3'h4):(2'h2)], $signed(reg169)},
                  {wire157[(1'h1):(1'h0)]}}) ~^ ((8'haa) ?
                  {$signed((8'h9e))} : ({$unsigned(reg174)} >>> (~^(reg162 ?
                      reg169 : reg180)))));
              reg185 <= ($signed((((reg163 ?
                          reg182 : reg177) >>> $unsigned((8'hb1))) ?
                      ($signed(reg161) ?
                          $signed(reg162) : (-reg184)) : $unsigned((reg182 ?
                          reg177 : wire179)))) ?
                  $unsigned(wire176) : $unsigned(reg183));
              reg186 <= $unsigned($signed(($unsigned((reg167 >>> wire157)) ?
                  wire158[(1'h1):(1'h1)] : reg183)));
            end
          else
            begin
              reg182 <= ($signed(wire179[(2'h2):(1'h0)]) ?
                  $signed({(~(reg165 ~^ reg177))}) : $signed(wire157[(3'h5):(1'h0)]));
              reg183 <= wire179[(1'h0):(1'h0)];
              reg184 <= $signed(reg162[(2'h2):(1'h0)]);
              reg185 <= reg177;
            end
        end
      reg187 <= $signed({($signed(((8'hb8) ?
              reg162 : wire179)) < $signed((wire178 ? (8'hbb) : (7'h44)))),
          ((8'hae) ?
              ($signed(reg169) <= (wire157 * reg174)) : reg186[(3'h5):(1'h1)])});
      reg188 <= (8'hb5);
    end
  module189 #() modinst206 (wire205, clk, reg185, wire159, reg165, reg181);
  assign wire207 = (^~reg174);
  assign wire208 = (|((reg186[(4'hb):(4'hb)] >= $unsigned((reg170 ?
                       reg172 : (8'hb0)))) && $unsigned($signed((reg181 ?
                       wire176 : (8'ha9))))));
  assign wire209 = wire178[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg210 <= (|reg180[(3'h5):(2'h2)]);
      reg211 <= wire207[(3'h5):(3'h5)];
      reg212 <= $unsigned((reg165[(2'h2):(1'h0)] ?
          wire158 : {(8'hb6), $signed({reg170, reg210})}));
      reg213 <= wire205;
    end
  assign wire214 = wire208[(2'h3):(2'h2)];
  assign wire215 = reg177[(3'h6):(3'h5)];
  assign wire216 = {$signed({(wire159 - $signed(reg177))}),
                       $unsigned(reg169[(2'h2):(1'h1)])};
  assign wire217 = ($unsigned($signed(reg212)) ?
                       wire209 : (($unsigned($unsigned(reg213)) ?
                               wire215 : (^~(reg180 >= reg210))) ?
                           reg211 : (^reg168)));
  module218 #() modinst240 (.wire222(reg173), .y(wire239), .wire219(reg162), .clk(clk), .wire220(wire216), .wire221(reg185), .wire223(wire205));
  assign wire241 = (~^reg168[(3'h7):(2'h2)]);
  module242 #() modinst274 (wire273, clk, reg185, reg164, wire179, wire217);
  always
    @(posedge clk) begin
      reg275 <= {reg181};
    end
  assign wire276 = ($signed($unsigned(reg183[(1'h0):(1'h0)])) ?
                       (({wire214, wire208} ?
                           ((reg186 - reg165) ~^ (wire208 ?
                               reg162 : wire273)) : ($signed(reg188) ?
                               $signed(reg162) : reg211)) + (wire158[(4'hb):(3'h7)] || (8'ha1))) : ($signed((!{reg164,
                               wire208})) ?
                           $unsigned($unsigned($signed(reg173))) : reg166[(3'h4):(1'h0)]));
  assign wire277 = reg187;
  always
    @(posedge clk) begin
      reg278 <= reg212[(1'h1):(1'h0)];
      reg279 <= wire176;
      if (($signed(reg183) >= $unsigned((reg161 ?
          $unsigned((wire276 ?
              wire207 : (8'ha1))) : $unsigned($unsigned(reg161))))))
        begin
          reg280 <= $unsigned(((~^$unsigned((&reg164))) ?
              wire273[(3'h5):(1'h1)] : $unsigned((&(wire217 ?
                  reg188 : reg167)))));
          reg281 <= (^~$unsigned(((&((8'hab) ?
              reg183 : wire158)) * wire207[(2'h3):(1'h1)])));
          if ($unsigned(wire208[(2'h2):(1'h1)]))
            begin
              reg282 <= reg169;
              reg283 <= $unsigned({wire273[(3'h5):(2'h3)],
                  {(^~reg187), $unsigned(wire216[(3'h4):(3'h4)])}});
              reg284 <= $unsigned($signed((-reg281)));
              reg285 <= (!reg186[(4'h9):(1'h1)]);
              reg286 <= $signed($unsigned((((reg171 ? wire239 : reg171) ?
                  wire178[(4'h8):(1'h0)] : (^~wire273)) >= $unsigned(reg162))));
            end
          else
            begin
              reg282 <= wire214[(1'h1):(1'h0)];
              reg283 <= (^$unsigned(reg164));
            end
        end
      else
        begin
          if (wire239)
            begin
              reg280 <= {(7'h42),
                  (reg282[(4'hd):(4'hd)] != (-((reg210 ?
                      reg184 : wire239) ~^ {reg173})))};
              reg281 <= reg185[(3'h5):(2'h2)];
              reg282 <= {reg183[(2'h3):(1'h0)], $unsigned(reg162)};
            end
          else
            begin
              reg280 <= $signed($signed({(wire277 ^~ (|wire215)),
                  reg210[(2'h2):(1'h1)]}));
              reg281 <= $signed($signed($signed($unsigned((wire158 ~^ reg185)))));
              reg282 <= wire209;
              reg283 <= wire273[(1'h1):(1'h1)];
            end
          reg284 <= reg170;
          reg285 <= (~&wire178[(1'h1):(1'h1)]);
        end
    end
  assign wire287 = ({$unsigned((^$signed(wire207))),
                           (((reg177 ?
                                   wire214 : reg174) ^~ $unsigned(wire215)) ?
                               ((8'haa) > wire241) : ({wire209} ?
                                   (wire215 ?
                                       reg282 : wire158) : (reg180 >>> reg169)))} ?
                       (((~wire209[(3'h4):(2'h3)]) <<< $unsigned(wire214[(1'h0):(1'h0)])) << ((reg186 ?
                               (~&reg278) : (^(8'ha5))) ?
                           (8'ha5) : $unsigned(reg162))) : ({$unsigned($signed(reg167))} >= $signed(reg165)));
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h25b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire5;
  input wire [(4'he):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire150;
  wire [(4'h8):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire148;
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  assign y = {wire150,
                 wire133,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire77,
                 wire59,
                 wire58,
                 wire57,
                 wire10,
                 wire11,
                 wire55,
                 wire135,
                 wire148,
                 reg12,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 (1'h0)};
  assign wire10 = (wire9[(4'ha):(2'h2)] ? wire9 : wire6);
  assign wire11 = wire10;
  always
    @(posedge clk) begin
      reg12 <= $signed(wire11[(5'h11):(2'h2)]);
    end
  module13 #() modinst56 (.wire16(wire5), .wire18(wire10), .clk(clk), .wire15(wire11), .y(wire55), .wire14(wire9), .wire17(wire7));
  assign wire57 = $signed($signed((8'hb3)));
  assign wire58 = (($unsigned({{wire55}}) < wire55) ? (8'ha9) : wire7);
  assign wire59 = $signed(wire57[(5'h11):(4'hd)]);
  always
    @(posedge clk) begin
      if ((~wire6))
        begin
          if ($unsigned((~&{wire10[(1'h1):(1'h1)],
              (wire59[(3'h5):(3'h4)] ?
                  (wire11 + wire7) : (wire11 ? wire5 : wire7))})))
            begin
              reg60 <= $unsigned($unsigned((wire5[(2'h2):(1'h0)] != $unsigned((wire8 <= wire6)))));
              reg61 <= $unsigned(wire9[(3'h7):(3'h4)]);
            end
          else
            begin
              reg60 <= $unsigned(reg61);
              reg61 <= $signed((+($signed((wire55 ?
                  wire57 : (8'h9e))) != {wire55[(2'h3):(1'h0)]})));
              reg62 <= reg60;
              reg63 <= $unsigned((~^$unsigned((8'ha2))));
              reg64 <= (($unsigned($unsigned(wire6)) ? {wire59} : {wire7}) ?
                  {wire11, wire11[(3'h4):(2'h3)]} : $signed(($unsigned((wire58 ?
                      (8'h9d) : reg62)) ~^ ((~(8'hbc)) ?
                      reg12[(4'hc):(4'hc)] : wire8[(4'h8):(3'h4)]))));
            end
        end
      else
        begin
          if (wire59[(4'hd):(1'h0)])
            begin
              reg60 <= wire57[(3'h5):(3'h4)];
              reg61 <= $signed(reg12[(5'h10):(4'hd)]);
              reg62 <= wire8[(3'h6):(2'h2)];
            end
          else
            begin
              reg60 <= $unsigned($unsigned($unsigned({{(8'hac)}, reg12})));
              reg61 <= $unsigned((reg61 >>> $signed($signed($unsigned(wire57)))));
              reg62 <= $unsigned($signed($signed($signed((-wire5)))));
              reg63 <= (wire6[(4'ha):(2'h2)] ?
                  (reg62 ~^ (((&reg61) ?
                      (~reg61) : (wire57 | wire11)) & $signed((|wire5)))) : ((wire57[(4'ha):(2'h2)] >>> (8'hb2)) ~^ ((~$unsigned((8'ha6))) ?
                      {reg61[(3'h6):(3'h5)]} : reg61)));
              reg64 <= $unsigned(wire55[(3'h5):(1'h1)]);
            end
          if (wire8[(5'h12):(3'h6)])
            begin
              reg65 <= (^~reg61);
              reg66 <= $signed((reg64[(3'h4):(2'h3)] ?
                  ((&wire10[(4'h8):(1'h1)]) ^ $unsigned($signed((7'h40)))) : $signed(wire7[(3'h5):(1'h1)])));
              reg67 <= wire8;
            end
          else
            begin
              reg65 <= wire7[(4'hd):(4'hd)];
              reg66 <= {reg64, wire57[(4'hf):(4'hd)]};
              reg67 <= $unsigned(reg67);
              reg68 <= (reg60[(3'h6):(3'h6)] ?
                  {wire11[(5'h10):(4'h9)],
                      ($signed({wire11,
                          wire57}) < (8'hb2))} : $unsigned(($unsigned((reg62 ?
                      (8'hbd) : reg65)) ^~ (~&$unsigned(wire55)))));
              reg69 <= $unsigned((!(^($signed(wire7) ?
                  $unsigned((8'hb2)) : (wire58 ? wire57 : reg64)))));
            end
          reg70 <= reg64[(5'h11):(1'h1)];
          reg71 <= ($unsigned(($unsigned($unsigned(reg70)) ?
              wire59[(4'ha):(4'ha)] : reg61[(1'h0):(1'h0)])) & (($signed(reg66[(1'h1):(1'h1)]) >= ((~|wire11) & (+(8'ha5)))) ?
              ({(7'h44)} ?
                  (~^(^wire6)) : $signed((reg65 ?
                      wire11 : reg70))) : (wire59[(5'h11):(3'h5)] >>> {(~|(8'hb4)),
                  (wire8 - wire5)})));
        end
      if ($signed(reg69))
        begin
          reg72 <= wire10[(4'h9):(2'h2)];
          reg73 <= reg72[(3'h5):(1'h1)];
        end
      else
        begin
          if ((~wire57[(5'h13):(5'h10)]))
            begin
              reg72 <= ($unsigned($unsigned(reg67[(4'he):(4'h9)])) ?
                  reg73[(2'h3):(1'h0)] : $unsigned($signed($unsigned($unsigned(reg63)))));
              reg73 <= {(reg65[(2'h2):(1'h0)] ?
                      $unsigned(((8'hb9) ~^ reg68[(3'h6):(1'h0)])) : ({reg12[(4'hf):(4'hb)]} ?
                          ((wire6 >> (7'h43)) ~^ (reg12 ?
                              wire58 : (8'ha6))) : ($unsigned(wire55) || (reg63 ?
                              wire57 : wire9)))),
                  ({reg70[(3'h5):(3'h5)],
                          {(wire8 == (8'hbc)), ((8'haa) >= wire8)}} ?
                      $signed((^$unsigned(reg61))) : ((reg60[(1'h0):(1'h0)] > $signed((8'ha7))) ?
                          reg67 : (!(reg12 ? (8'hbf) : reg70))))};
              reg74 <= reg60[(2'h2):(2'h2)];
              reg75 <= $unsigned($signed($signed(reg72)));
              reg76 <= (^reg74);
            end
          else
            begin
              reg72 <= (((~^reg62[(2'h2):(1'h0)]) >= reg76) >= reg69[(1'h1):(1'h1)]);
              reg73 <= ((+$unsigned($unsigned($signed(wire57)))) - reg64);
              reg74 <= ((wire9 ?
                  reg73 : (wire10[(4'ha):(3'h5)] <<< (&(reg74 - wire57)))) <<< (~|wire10[(1'h1):(1'h1)]));
            end
        end
    end
  assign wire77 = wire5[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg78 <= ($unsigned(reg67[(4'hb):(1'h1)]) >> $signed({$signed(reg64[(5'h15):(5'h10)]),
          ((~wire7) >> (wire5 * wire59))}));
      reg79 <= $unsigned($unsigned(reg71[(2'h3):(2'h3)]));
      if (($unsigned(reg76[(4'hf):(3'h5)]) > ((|$unsigned(((8'haa) <= wire5))) <= (reg67 ~^ $unsigned((|reg68))))))
        begin
          reg80 <= $signed((((^~$signed(wire59)) ^~ $unsigned({wire57})) && $unsigned((&(~|(8'ha9))))));
          if ($unsigned({(((|wire57) <<< ((8'hbe) ?
                  wire77 : wire58)) * $signed(reg79))}))
            begin
              reg81 <= $unsigned(((~&(reg74 >= wire7[(4'hf):(1'h0)])) ?
                  {$unsigned((reg67 ? wire8 : reg78)),
                      {((8'hb3) * reg73)}} : {$signed(reg67), reg67}));
            end
          else
            begin
              reg81 <= {$unsigned((reg70 ?
                      (reg64[(5'h12):(4'h9)] ?
                          $unsigned(wire6) : $signed(reg70)) : ({reg81} ?
                          $signed((7'h42)) : (|wire77))))};
              reg82 <= (8'hae);
              reg83 <= reg67;
              reg84 <= wire58[(3'h6):(1'h1)];
            end
          if ($signed(wire77[(4'h9):(1'h1)]))
            begin
              reg85 <= (^reg65);
              reg86 <= reg12;
              reg87 <= ($signed(((^wire6) - reg71[(3'h4):(1'h1)])) ?
                  reg81 : ({(~(~&reg72))} ?
                      (!reg81[(2'h2):(1'h1)]) : ($unsigned((~|reg81)) <= (((8'hb7) + reg74) | $signed(wire8)))));
              reg88 <= wire10;
            end
          else
            begin
              reg85 <= wire10[(4'ha):(4'h9)];
              reg86 <= $signed(wire58[(4'hb):(3'h5)]);
              reg87 <= ($unsigned(reg61) ?
                  (reg62 ?
                      $unsigned($unsigned($unsigned(reg62))) : reg61) : $unsigned((((reg66 <= reg69) << (8'ha8)) ~^ $signed($signed(wire77)))));
              reg88 <= $signed(($unsigned(reg65) ?
                  $unsigned({$signed(reg82),
                      reg67}) : (($signed(reg80) - reg76[(4'hc):(4'ha)]) != ($unsigned((8'hba)) ^~ $unsigned(reg82)))));
            end
          if ((-{$unsigned(wire57),
              {((reg75 | reg60) ? $unsigned(reg76) : reg72[(1'h0):(1'h0)]),
                  (!wire5[(2'h3):(1'h0)])}}))
            begin
              reg89 <= $unsigned(reg71[(3'h5):(3'h5)]);
              reg90 <= $signed((!$signed({(8'had)})));
              reg91 <= wire58;
            end
          else
            begin
              reg89 <= (8'hb8);
            end
          reg92 <= (~$unsigned($unsigned((-reg68[(3'h7):(3'h5)]))));
        end
      else
        begin
          reg80 <= $signed(reg85);
        end
    end
  assign wire93 = ((reg86[(2'h3):(2'h2)] <= $unsigned($unsigned(wire58))) == $signed((~^(reg71 ~^ (+reg89)))));
  assign wire94 = reg85[(3'h5):(3'h5)];
  assign wire95 = reg91[(4'h9):(4'h9)];
  assign wire96 = wire77;
  assign wire97 = $unsigned($signed(($unsigned(wire11) ^ reg85)));
  assign wire98 = $unsigned(wire9[(3'h6):(3'h4)]);
  assign wire99 = (wire97 ?
                      $signed(({$unsigned(reg60),
                          (reg91 * (8'hbc))} ^ reg86[(4'hd):(4'h8)])) : $unsigned((~&((~|wire9) <= $unsigned(reg65)))));
  module100 #() modinst134 (.wire101(reg80), .wire104(wire96), .wire102(wire99), .clk(clk), .y(wire133), .wire103(wire97));
  assign wire135 = (~^((wire11[(5'h13):(3'h5)] || wire8[(4'hf):(3'h4)]) || $signed(({wire98} != (reg78 >= reg88)))));
  module136 #() modinst149 (.wire140(wire59), .y(wire148), .wire137(reg67), .wire138(reg60), .wire139(reg90), .clk(clk), .wire141(reg88));
  assign wire150 = (($signed(((8'hb1) <= $unsigned(wire5))) == (~^wire93[(4'hc):(4'hc)])) ?
                       reg73 : (-((!reg85) ?
                           reg91[(4'hc):(1'h0)] : wire59[(4'h8):(2'h3)])));
endmodule

module module136
#(parameter param147 = ({{((~^(8'hba)) >= ((7'h44) ? (8'ha5) : (8'hb6)))}} < ((8'hb6) ? {{(7'h44), ((8'ha8) || (8'hbd))}} : {{(!(8'hbd))}})))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire141;
  input wire [(5'h11):(1'h0)] wire140;
  input wire signed [(5'h15):(1'h0)] wire139;
  input wire signed [(5'h10):(1'h0)] wire138;
  input wire [(5'h15):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg145 = (1'h0);
  assign y = {wire144, wire143, wire142, reg146, reg145, (1'h0)};
  assign wire142 = $signed(wire137[(1'h0):(1'h0)]);
  assign wire143 = ((^(($signed(wire137) ~^ (wire140 <= wire138)) + (wire142[(2'h3):(2'h3)] & (wire137 ?
                       wire141 : wire142)))) <<< wire139[(5'h10):(4'ha)]);
  assign wire144 = ({({(wire143 < (8'hbc)), wire139[(4'he):(3'h7)]} ?
                           wire143 : ($signed(wire137) ?
                               wire141 : wire138))} & (7'h43));
  always
    @(posedge clk) begin
      reg145 <= ((~&(((wire137 ?
          wire137 : wire138) <= wire139[(5'h13):(5'h12)]) <<< ((wire144 == wire141) - wire144[(1'h1):(1'h0)]))) >= $signed(({$unsigned(wire140),
              wire141[(3'h7):(1'h1)]} ?
          wire142 : (&((8'h9e) * wire139)))));
      reg146 <= wire143[(4'h8):(3'h4)];
    end
endmodule

module module100
#(parameter param132 = (|({{((8'ha1) ? (8'hac) : (7'h42))}, (~&(^~(8'ha4)))} ? (^(((8'haf) ^~ (8'h9c)) ? {(7'h44), (8'ha1)} : ((8'haf) * (8'haa)))) : {(((8'hb8) >> (8'hb5)) > ((8'h9d) >= (8'ha1)))})))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire104;
  input wire [(4'ha):(1'h0)] wire103;
  input wire signed [(4'h8):(1'h0)] wire102;
  input wire signed [(3'h7):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(5'h12):(1'h0)] wire105;
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  assign y = {wire131,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire105 = wire103[(3'h4):(2'h2)];
  assign wire106 = {{$signed($signed((~|wire102))),
                           (^((~^wire104) << (wire101 ? wire104 : wire105)))},
                       $unsigned(($unsigned((|wire102)) ?
                           (+{wire103}) : $signed($unsigned(wire105))))};
  assign wire107 = wire105[(4'hb):(3'h4)];
  assign wire108 = $unsigned($unsigned({$unsigned(wire107[(3'h4):(1'h0)])}));
  assign wire109 = $signed(($unsigned(((wire108 >> wire108) ?
                       wire106[(4'hb):(3'h6)] : (wire106 == wire103))) <<< {wire108,
                       wire105[(3'h6):(3'h4)]}));
  assign wire110 = $unsigned(wire106);
  assign wire111 = {wire108[(4'h9):(3'h5)]};
  assign wire112 = wire109[(2'h2):(1'h0)];
  assign wire113 = wire109[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg114 <= (|(wire101 ?
          $signed((~&$signed((8'ha8)))) : ((!wire110) ?
              {(8'ha6)} : wire101[(1'h0):(1'h0)])));
      if (((~&(wire103[(3'h7):(2'h3)] ~^ (wire113[(4'hc):(4'h9)] ?
          wire104[(4'hf):(4'ha)] : (^~wire107)))) <<< wire106[(3'h5):(3'h5)]))
        begin
          reg115 <= ($signed((((wire105 && (8'hbd)) >> (wire113 - wire101)) ?
                  (~(reg114 <= wire109)) : wire104)) ?
              $signed(wire111[(4'h8):(4'h8)]) : $signed({(8'hae),
                  (+{wire107})}));
          reg116 <= $unsigned((8'ha3));
          if ($signed((~|wire105)))
            begin
              reg117 <= (+$signed($unsigned($signed((wire106 ?
                  wire107 : (8'hb7))))));
            end
          else
            begin
              reg117 <= ($unsigned((wire107[(3'h5):(1'h1)] ?
                  (+(+wire106)) : reg116)) ~^ (&$unsigned($signed(((8'hb3) ?
                  reg115 : wire103)))));
              reg118 <= (~^(-$signed(((&reg116) ?
                  (^~wire102) : (reg115 != (7'h41))))));
              reg119 <= $signed($signed($unsigned({wire109,
                  (wire113 << wire103)})));
            end
        end
      else
        begin
          reg115 <= wire108[(3'h6):(3'h6)];
          if (wire106)
            begin
              reg116 <= $unsigned({$signed(wire111[(4'h8):(4'h8)]),
                  (wire107[(3'h5):(3'h5)] ?
                      {(wire102 ? reg117 : (8'haf)),
                          (^wire113)} : {wire107[(2'h3):(1'h1)],
                          $signed(wire101)})});
            end
          else
            begin
              reg116 <= (((|$signed($signed(wire103))) ?
                      (((!reg117) ?
                          wire111[(2'h2):(1'h0)] : wire109[(1'h1):(1'h0)]) < (((8'h9d) | wire108) ?
                          (wire102 ?
                              (8'hab) : wire110) : (wire101 == (8'h9e)))) : ($unsigned(((8'hb9) ?
                          (8'hb4) : reg114)) > reg117)) ?
                  {($unsigned((wire103 != wire108)) ?
                          {wire104, $unsigned((8'ha5))} : wire113),
                      ((reg117 - wire106[(2'h2):(2'h2)]) ?
                          wire104 : $signed((~wire106)))} : {wire106[(3'h6):(1'h0)],
                      (^~($signed(wire113) & (reg116 << wire103)))});
            end
          reg117 <= $unsigned(({((wire107 ~^ wire113) ?
                      reg118[(3'h4):(3'h4)] : (reg115 >= wire102))} ?
              (($unsigned((8'hb6)) ?
                  $unsigned(wire101) : (8'hb7)) && ($signed(wire106) || $unsigned(reg119))) : $signed($unsigned(reg114))));
        end
    end
  always
    @(posedge clk) begin
      if ((wire104 ?
          (^wire102[(3'h7):(3'h7)]) : $signed((&(!(reg116 > reg119))))))
        begin
          reg120 <= $signed(wire107);
          reg121 <= reg116;
          if (((wire102[(3'h4):(2'h3)] ?
              reg118 : $signed($signed(((8'hae) ^~ wire105)))) <<< (|wire112)))
            begin
              reg122 <= $signed($unsigned(((+(wire105 ?
                  (8'hb4) : wire108)) - $signed(wire102))));
              reg123 <= (~&$signed({((wire103 > wire104) != $signed(wire103)),
                  (wire103 + (reg116 ? wire109 : wire106))}));
              reg124 <= wire106[(3'h4):(3'h4)];
              reg125 <= (($signed($signed((+reg117))) ?
                      $signed((reg121 ?
                          (wire103 ?
                              wire110 : wire107) : $unsigned((8'ha7)))) : wire107[(1'h0):(1'h0)]) ?
                  $signed({reg114,
                      (!$signed((8'had)))}) : (!(wire103 > (!reg115[(5'h11):(1'h0)]))));
            end
          else
            begin
              reg122 <= $signed(wire108);
              reg123 <= (&wire101[(2'h3):(1'h0)]);
            end
          reg126 <= $signed({wire108[(3'h4):(3'h4)]});
        end
      else
        begin
          reg120 <= {(($unsigned($signed(reg114)) >> $unsigned(wire112[(5'h14):(5'h13)])) || ($unsigned((~wire105)) | wire106))};
          reg121 <= wire112;
          reg122 <= wire101;
          reg123 <= $signed(reg116[(2'h3):(1'h0)]);
        end
      reg127 <= reg116[(3'h6):(3'h6)];
      reg128 <= {reg121[(2'h2):(1'h0)]};
      reg129 <= $unsigned(reg123[(3'h7):(2'h3)]);
      reg130 <= ((^$signed(((!reg118) << (wire105 >= (8'hb1))))) ?
          ((8'hbe) * (($signed(reg126) <= ((8'h9e) ?
              (7'h42) : (8'hbe))) * (&$signed(reg120)))) : ($signed(($unsigned((7'h44)) ?
                  (wire102 >>> reg114) : $unsigned(wire107))) ?
              reg124[(3'h5):(3'h4)] : ((8'h9f) ?
                  (~^(^~reg123)) : $unsigned($signed(reg128)))));
    end
  assign wire131 = reg120;
endmodule

module module13
#(parameter param54 = {(((+((8'hae) <<< (8'h9f))) >= ((&(8'hb4)) > ((8'hbd) ? (7'h42) : (8'hab)))) ^ {{(8'haf)}, (^~((7'h40) | (8'haa)))})})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire38,
                 wire31,
                 wire30,
                 wire29,
                 wire20,
                 wire19,
                 reg50,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire19 = wire16[(2'h3):(1'h1)];
  assign wire20 = wire17;
  always
    @(posedge clk) begin
      if ((+(-(((wire15 ^ wire17) * wire18) ~^ wire14[(1'h1):(1'h0)]))))
        begin
          if (wire20[(2'h3):(1'h0)])
            begin
              reg21 <= {$signed($unsigned($unsigned(wire16)))};
              reg22 <= $unsigned(wire18[(4'h9):(1'h0)]);
              reg23 <= $unsigned((^wire18));
              reg24 <= {{reg23}};
            end
          else
            begin
              reg21 <= ((-$signed(wire19[(4'h9):(1'h0)])) ^~ (+$signed($unsigned(((8'h9c) ?
                  wire15 : wire20)))));
              reg22 <= reg22[(2'h2):(1'h1)];
              reg23 <= (^wire19[(4'hb):(2'h2)]);
              reg24 <= ($signed((~^wire17[(3'h5):(3'h5)])) ?
                  $unsigned(({$unsigned(reg24)} >>> wire15)) : $unsigned($signed($signed($signed(wire19)))));
              reg25 <= wire20[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg21 <= (~^(reg25[(3'h6):(3'h5)] ? $signed((+wire18)) : wire14));
        end
      if ({reg22[(1'h1):(1'h0)]})
        begin
          reg26 <= $signed(reg23[(4'hc):(1'h1)]);
        end
      else
        begin
          reg26 <= wire19[(2'h3):(1'h0)];
          reg27 <= (~^$signed(wire18[(3'h7):(3'h4)]));
          reg28 <= $unsigned(wire18[(3'h5):(1'h0)]);
        end
    end
  assign wire29 = reg27;
  assign wire30 = $signed(($signed($signed($unsigned(wire20))) ?
                      reg22 : wire17[(4'ha):(3'h5)]));
  assign wire31 = (^$signed(wire29));
  always
    @(posedge clk) begin
      reg32 <= ($unsigned(wire19[(4'hb):(1'h1)]) ?
          $signed($signed(($unsigned(wire17) >>> wire30))) : wire15[(4'hd):(4'hd)]);
      reg33 <= (^~$unsigned($unsigned($unsigned(wire30))));
      if ($unsigned($unsigned((+(-{reg22})))))
        begin
          if (wire16)
            begin
              reg34 <= $unsigned($signed($unsigned((((8'hb3) ?
                  wire15 : reg26) <= (wire18 ? wire19 : reg28)))));
              reg35 <= wire20[(3'h4):(2'h3)];
              reg36 <= (^~$unsigned(reg33[(2'h2):(2'h2)]));
            end
          else
            begin
              reg34 <= reg23;
            end
          reg37 <= (-wire14[(1'h1):(1'h1)]);
        end
      else
        begin
          reg34 <= ({($signed(wire15[(4'h8):(3'h6)]) ~^ (8'hbb))} ?
              $unsigned((-(^(wire30 | reg22)))) : (!{($signed(reg28) ?
                      reg23 : reg23),
                  $unsigned($unsigned(wire14))}));
        end
    end
  assign wire38 = (((((reg33 >> wire17) << $unsigned(wire16)) <= reg25) ?
                          $signed((~|(reg24 ? reg36 : wire17))) : (8'hb8)) ?
                      $signed(wire15) : wire19);
  always
    @(posedge clk) begin
      reg39 <= ((reg24[(1'h0):(1'h0)] ?
              (~$unsigned((reg22 ? wire15 : (8'haf)))) : wire15) ?
          $signed(wire18[(4'h9):(3'h7)]) : {$signed(reg28[(1'h1):(1'h0)])});
      if (reg27[(5'h11):(5'h11)])
        begin
          reg40 <= (8'ha6);
          reg41 <= $signed($signed($signed((^{(8'ha4), (8'hb6)}))));
          reg42 <= $signed(wire38);
        end
      else
        begin
          reg40 <= ($signed(wire29) <<< $signed($unsigned(((8'ha7) >>> (!reg27)))));
          if ($signed((|$unsigned($unsigned(wire16[(2'h2):(2'h2)])))))
            begin
              reg41 <= wire17[(3'h4):(2'h3)];
              reg42 <= $unsigned($signed($signed((^~{(7'h43)}))));
              reg43 <= (~^(wire20[(1'h0):(1'h0)] ?
                  wire31 : $signed($signed({reg21, reg27}))));
              reg44 <= ((~^wire16) >= wire14);
            end
          else
            begin
              reg41 <= ($signed((~reg25)) ~^ ((+wire15[(3'h6):(3'h4)]) ?
                  wire30[(3'h4):(3'h4)] : reg39[(1'h0):(1'h0)]));
              reg42 <= (|$unsigned(reg37[(3'h6):(3'h4)]));
              reg43 <= (8'ha3);
              reg44 <= reg27[(3'h6):(3'h5)];
              reg45 <= wire17[(4'he):(1'h0)];
            end
          reg46 <= ($unsigned($unsigned(($signed(reg44) ?
              $signed(reg32) : $unsigned(wire18)))) <<< (8'ha9));
          reg47 <= ($unsigned((&(^~wire30))) > $signed(reg42[(1'h1):(1'h1)]));
        end
      reg48 <= reg36[(3'h7):(3'h5)];
    end
  assign wire49 = ($signed((wire29[(4'h9):(3'h4)] ?
                      $unsigned((^reg43)) : $signed(wire38))) > $signed($signed({wire17})));
  always
    @(posedge clk) begin
      reg50 <= reg33[(2'h2):(2'h2)];
    end
  assign wire51 = {$signed({({reg40} ? (8'hb0) : $signed((8'haf))),
                          $unsigned($signed(reg45))})};
  assign wire52 = $unsigned(reg35[(2'h2):(2'h2)]);
  assign wire53 = reg25;
endmodule

module module242  (y, clk, wire246, wire245, wire244, wire243);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire246;
  input wire signed [(4'he):(1'h0)] wire245;
  input wire [(2'h2):(1'h0)] wire244;
  input wire signed [(3'h6):(1'h0)] wire243;
  wire [(2'h3):(1'h0)] wire265;
  wire [(4'h8):(1'h0)] wire248;
  wire [(4'hf):(1'h0)] wire247;
  reg [(3'h5):(1'h0)] reg272 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg271 = (1'h0);
  reg [(5'h15):(1'h0)] reg270 = (1'h0);
  reg [(4'hc):(1'h0)] reg269 = (1'h0);
  reg [(5'h10):(1'h0)] reg268 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg267 = (1'h0);
  reg [(4'h8):(1'h0)] reg266 = (1'h0);
  reg [(3'h4):(1'h0)] reg264 = (1'h0);
  reg [(5'h13):(1'h0)] reg263 = (1'h0);
  reg [(3'h4):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg261 = (1'h0);
  reg signed [(4'he):(1'h0)] reg260 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg259 = (1'h0);
  reg [(2'h3):(1'h0)] reg258 = (1'h0);
  reg [(3'h5):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg256 = (1'h0);
  reg [(4'hf):(1'h0)] reg255 = (1'h0);
  reg [(2'h2):(1'h0)] reg254 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg253 = (1'h0);
  reg [(5'h12):(1'h0)] reg252 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg251 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg250 = (1'h0);
  reg [(4'hf):(1'h0)] reg249 = (1'h0);
  assign y = {wire265,
                 wire248,
                 wire247,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
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
                 (1'h0)};
  assign wire247 = $unsigned($signed(wire246[(1'h0):(1'h0)]));
  assign wire248 = ((~|$signed((wire244[(2'h2):(2'h2)] ?
                       $signed(wire245) : (^~wire246)))) <= (+wire244));
  always
    @(posedge clk) begin
      if ((|(wire243[(1'h1):(1'h1)] ?
          wire244 : {$signed($unsigned(wire248)),
              $signed((wire245 & wire244))})))
        begin
          reg249 <= (~^wire246[(2'h3):(1'h0)]);
          reg250 <= (^$unsigned(reg249[(1'h0):(1'h0)]));
        end
      else
        begin
          if ((+(^~(({wire246,
              (8'hac)} ^ (reg250 - (7'h44))) ^ $unsigned((wire246 <<< wire244))))))
            begin
              reg249 <= $signed(($unsigned(wire248[(3'h5):(3'h5)]) | reg249));
              reg250 <= $signed($unsigned(wire246));
              reg251 <= reg249;
              reg252 <= (((^~wire244) <= reg249) ?
                  ((~(^{reg251, reg249})) ?
                      ((wire248 << (wire248 > (8'h9c))) ?
                          $signed({reg251}) : $unsigned((reg249 ?
                              wire246 : wire243))) : ({wire248,
                          wire247} ^~ wire248[(2'h2):(2'h2)])) : ($unsigned(((&reg250) ?
                      reg250[(1'h0):(1'h0)] : (^reg251))) == reg250));
            end
          else
            begin
              reg249 <= wire244[(1'h1):(1'h0)];
              reg250 <= ($unsigned((~|$unsigned(wire245))) >>> ($signed($signed(wire248[(3'h7):(3'h5)])) & $signed((8'hbe))));
              reg251 <= wire245;
              reg252 <= $signed((~^(8'ha8)));
              reg253 <= (~&{(|(wire244[(2'h2):(2'h2)] ?
                      (7'h42) : reg252[(3'h5):(2'h3)])),
                  $signed(wire243[(2'h3):(2'h3)])});
            end
          if ($signed(((wire243[(2'h3):(1'h0)] ?
                  $unsigned((reg251 * wire246)) : wire245[(3'h6):(2'h3)]) ?
              wire243 : ({(~&reg250)} ? wire244[(1'h1):(1'h0)] : {reg253}))))
            begin
              reg254 <= $unsigned($unsigned(((~|(wire248 ? reg251 : reg251)) ?
                  (((8'ha4) ~^ wire247) == reg251[(3'h4):(3'h4)]) : $signed(wire245))));
              reg255 <= (!(wire248[(4'h8):(3'h4)] + ((&(~|(8'hbe))) <= wire244[(1'h0):(1'h0)])));
              reg256 <= {$unsigned(((8'hb2) ?
                      $signed($signed(wire244)) : (wire244[(1'h1):(1'h1)] ?
                          (wire243 ?
                              wire244 : (8'hb7)) : wire246[(3'h7):(3'h4)]))),
                  reg250};
              reg257 <= $unsigned(reg256);
            end
          else
            begin
              reg254 <= {(wire243[(2'h3):(1'h1)] == reg249[(3'h6):(2'h3)]),
                  ((7'h40) ? reg254 : reg250)};
            end
          reg258 <= (7'h41);
          if (wire243)
            begin
              reg259 <= $signed(((~|reg256[(2'h3):(2'h3)]) <<< ((((8'haa) >> reg253) ?
                  reg258[(1'h1):(1'h1)] : ((8'ha6) ?
                      reg250 : reg249)) || reg252)));
            end
          else
            begin
              reg259 <= wire243;
            end
          reg260 <= ((($signed($signed(reg255)) ?
                  ($unsigned(reg252) <= reg252) : reg253) ?
              {$unsigned($unsigned(wire248)),
                  (-reg258)} : wire243) - {(7'h41)});
        end
      reg261 <= wire243[(3'h6):(3'h5)];
      reg262 <= $unsigned(($signed(reg258) ?
          $unsigned(wire246[(4'ha):(4'ha)]) : $signed(wire248[(2'h2):(2'h2)])));
      reg263 <= ($signed($signed($signed((reg251 & reg259)))) ?
          reg257 : reg256);
      reg264 <= reg253;
    end
  assign wire265 = (wire247 == $unsigned(((^~reg260[(1'h1):(1'h1)]) && (^$signed(reg254)))));
  always
    @(posedge clk) begin
      reg266 <= {(wire265[(1'h0):(1'h0)] ?
              ($signed({(8'hbe), reg262}) ?
                  ($unsigned((8'ha9)) ?
                      (8'hae) : $signed(reg260)) : ($signed(reg249) ^ (reg261 ?
                      reg253 : reg263))) : (~&{(wire248 ? reg250 : reg250)})),
          {(~wire245[(1'h1):(1'h1)])}};
    end
  always
    @(posedge clk) begin
      reg267 <= (8'hb1);
      reg268 <= wire245[(2'h2):(1'h0)];
      reg269 <= ($signed(reg263) ?
          {reg251[(4'hd):(4'ha)]} : ((($unsigned((8'hb0)) < wire244) < $unsigned((reg267 ?
              reg266 : reg262))) >> reg257));
      reg270 <= (wire243[(2'h3):(1'h1)] ?
          $signed((reg268 >> (reg261 ?
              (reg263 ? reg269 : reg256) : $signed(reg266)))) : wire244);
      reg271 <= wire247;
    end
  always
    @(posedge clk) begin
      reg272 <= $signed(reg252);
    end
endmodule

module module218  (y, clk, wire223, wire222, wire221, wire220, wire219);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire223;
  input wire [(3'h4):(1'h0)] wire222;
  input wire signed [(5'h13):(1'h0)] wire221;
  input wire signed [(4'hc):(1'h0)] wire220;
  input wire signed [(4'h8):(1'h0)] wire219;
  wire signed [(2'h2):(1'h0)] wire238;
  wire [(5'h15):(1'h0)] wire237;
  wire [(3'h4):(1'h0)] wire236;
  wire [(5'h14):(1'h0)] wire235;
  wire signed [(4'hd):(1'h0)] wire234;
  wire [(4'h9):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire232;
  wire signed [(3'h4):(1'h0)] wire231;
  wire signed [(3'h7):(1'h0)] wire229;
  wire [(4'h9):(1'h0)] wire228;
  wire [(5'h14):(1'h0)] wire227;
  wire signed [(4'hd):(1'h0)] wire226;
  wire signed [(4'hd):(1'h0)] wire225;
  wire signed [(2'h2):(1'h0)] wire224;
  reg [(2'h3):(1'h0)] reg230 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 reg230,
                 (1'h0)};
  assign wire224 = $unsigned((((8'ha4) | wire221) ?
                       $unsigned({wire222, (^(8'hb8))}) : (($unsigned((8'hb8)) ?
                           wire222 : $unsigned(wire219)) != $unsigned((&wire221)))));
  assign wire225 = {($signed((8'hb9)) ?
                           $signed(wire220[(4'h8):(1'h0)]) : ((wire222[(2'h3):(2'h2)] ?
                                   wire223 : wire221[(3'h4):(3'h4)]) ?
                               $signed($signed(wire219)) : wire224))};
  assign wire226 = $signed($unsigned($signed($unsigned(wire219))));
  assign wire227 = (wire226[(3'h5):(3'h5)] ?
                       {((^(-wire226)) ?
                               (wire220[(3'h7):(3'h6)] & wire221) : (+(wire220 ?
                                   wire226 : wire225))),
                           $signed(((wire224 > wire226) ?
                               wire221 : {wire224,
                                   (8'ha7)}))} : (~|($signed((^wire222)) ?
                           (wire222 + $signed((8'h9f))) : {(~^(8'h9d)),
                               $signed(wire221)})));
  assign wire228 = wire223[(2'h3):(1'h0)];
  assign wire229 = (|(7'h44));
  always
    @(posedge clk) begin
      reg230 <= wire221[(3'h4):(3'h4)];
    end
  assign wire231 = {wire221};
  assign wire232 = {(wire220 ?
                           ((~|$unsigned(reg230)) ^ (~&$signed(wire224))) : $signed((&(wire225 | wire222)))),
                       (!$unsigned((8'ha4)))};
  assign wire233 = wire226;
  assign wire234 = wire219[(2'h3):(1'h1)];
  assign wire235 = $unsigned(wire234);
  assign wire236 = $signed($unsigned((wire235 ?
                       wire220 : (wire224 | {reg230, (7'h41)}))));
  assign wire237 = (^{$signed($unsigned(wire236[(2'h3):(2'h2)]))});
  assign wire238 = {$signed(($unsigned(wire220[(3'h6):(2'h3)]) <= wire227[(5'h10):(1'h0)])),
                       wire223[(4'hc):(4'hb)]};
endmodule

module module189
#(parameter param204 = ({(~(((7'h40) != (8'hac)) <= {(8'h9d), (8'hb0)})), ((((8'hb7) ? (8'ha2) : (8'hb3)) != ((8'ha7) ~^ (8'ha2))) || (((8'ha7) >> (7'h41)) != (&(8'h9d))))} ? (((!(&(8'ha1))) ? (8'hab) : (((8'hb0) | (8'hae)) ? (~|(8'had)) : ((8'ha3) ? (7'h42) : (8'ha4)))) >>> ((~&{(8'ha3), (8'hb5)}) < (-(~(8'ha7))))) : (~&((((8'ha2) ? (7'h40) : (8'hbd)) ? {(8'hbe)} : (~^(8'hab))) ^~ ((^(8'hb5)) >= ((8'ha1) ? (8'h9e) : (8'h9c)))))))
(y, clk, wire193, wire192, wire191, wire190);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire193;
  input wire signed [(3'h7):(1'h0)] wire192;
  input wire [(3'h6):(1'h0)] wire191;
  input wire [(5'h12):(1'h0)] wire190;
  wire signed [(4'hd):(1'h0)] wire203;
  wire signed [(3'h6):(1'h0)] wire202;
  wire [(2'h3):(1'h0)] wire201;
  wire [(4'h9):(1'h0)] wire200;
  wire [(4'he):(1'h0)] wire199;
  wire signed [(3'h4):(1'h0)] wire198;
  wire signed [(5'h15):(1'h0)] wire197;
  wire [(3'h4):(1'h0)] wire194;
  reg signed [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg195 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire194,
                 reg196,
                 reg195,
                 (1'h0)};
  assign wire194 = ({(~$unsigned(((8'ha0) ? wire190 : wire192))),
                       (~wire191[(1'h1):(1'h1)])} && $unsigned(wire190[(4'ha):(1'h1)]));
  always
    @(posedge clk) begin
      reg195 <= ((({$unsigned(wire192),
              (8'hbb)} * ((wire194 | wire193) > $signed(wire193))) + $signed(wire191)) ?
          wire192[(3'h4):(2'h2)] : wire194);
      reg196 <= wire191;
    end
  assign wire197 = $signed((($signed($unsigned(reg195)) ?
                           $signed(wire190[(3'h7):(2'h3)]) : ((wire192 ?
                                   wire194 : wire193) ?
                               (wire190 | wire191) : $signed(wire191))) ?
                       $signed((~$unsigned(reg196))) : {(~^{wire191}),
                           (-(+wire193))}));
  assign wire198 = ((~&(~|wire192)) ?
                       ($unsigned(((wire194 ^ reg195) | {wire194, wire190})) ?
                           ($signed((+wire194)) ?
                               ((reg196 == wire191) ?
                                   (wire197 + reg196) : {wire190,
                                       wire197}) : $unsigned({wire197,
                                   reg196})) : $signed(wire194[(3'h4):(3'h4)])) : {$signed($unsigned((reg195 ^ reg195)))});
  assign wire199 = ($signed((8'hb9)) ?
                       ((({wire197} + $unsigned(wire191)) ?
                               $signed((~wire197)) : ($signed(reg196) <<< (reg195 != wire198))) ?
                           ($unsigned((~|wire192)) ~^ ((wire198 ?
                               wire197 : (7'h43)) ~^ reg195[(5'h12):(5'h11)])) : ($unsigned((&wire197)) ?
                               wire190[(4'he):(3'h6)] : ((reg196 ?
                                       (8'hb0) : wire192) ?
                                   (wire197 ^ (8'hb8)) : $unsigned((8'h9e))))) : (wire193 ?
                           $unsigned({(wire191 ? reg196 : wire191),
                               (+wire191)}) : (wire193 ?
                               $signed($unsigned(reg196)) : wire198)));
  assign wire200 = wire193[(4'hb):(3'h5)];
  assign wire201 = wire190;
  assign wire202 = ({(wire190 ?
                               wire201 : ((wire194 || wire192) ?
                                   (8'ha1) : ((8'hbc) <= wire193))),
                           ((wire198 ?
                               {wire199,
                                   wire199} : reg195[(4'hb):(3'h6)]) == ($signed(wire194) ?
                               $unsigned(wire200) : wire198))} ?
                       $signed(wire200[(3'h4):(3'h4)]) : wire201[(1'h0):(1'h0)]);
  assign wire203 = ($unsigned(reg195) >>> (^(wire190 ?
                       wire197[(1'h0):(1'h0)] : wire193[(2'h2):(1'h0)])));
endmodule
