module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire261;
  wire signed [(2'h2):(1'h0)] wire260;
  wire [(4'hd):(1'h0)] wire259;
  wire signed [(2'h3):(1'h0)] wire257;
  wire signed [(3'h6):(1'h0)] wire256;
  wire [(4'hc):(1'h0)] wire248;
  wire signed [(5'h12):(1'h0)] wire250;
  wire signed [(3'h7):(1'h0)] wire252;
  wire [(5'h11):(1'h0)] wire253;
  wire [(4'h9):(1'h0)] wire254;
  reg [(5'h10):(1'h0)] reg251 = (1'h0);
  assign y = {wire261,
                 wire260,
                 wire259,
                 wire257,
                 wire256,
                 wire248,
                 wire250,
                 wire252,
                 wire253,
                 wire254,
                 reg251,
                 (1'h0)};
  module4 #() modinst249 (.wire6(wire1), .y(wire248), .wire7(wire0), .wire5(wire2), .wire9((8'had)), .wire8(wire3), .clk(clk));
  assign wire250 = wire248[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg251 <= wire3[(4'hf):(3'h6)];
    end
  assign wire252 = (~|(&((~$signed(wire250)) ?
                       $unsigned(wire248[(3'h7):(1'h1)]) : wire3)));
  assign wire253 = (8'hb2);
  module101 #() modinst255 (wire254, clk, reg251, wire2, wire0, wire248);
  assign wire256 = (wire1 && ($unsigned(wire2[(4'hf):(3'h7)]) ?
                       $signed(($signed(wire252) ?
                           wire254 : wire3)) : ((~^(wire250 == reg251)) == ({wire3} >> (wire248 ?
                           wire3 : wire253)))));
  module101 #() modinst258 (wire257, clk, wire253, wire1, wire256, wire248);
  assign wire259 = (&(~^wire2));
  assign wire260 = {(~($unsigned((8'hb9)) ?
                           wire257[(1'h1):(1'h0)] : $signed((8'hb4))))};
  assign wire261 = wire248;
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h10):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire247;
  wire [(3'h7):(1'h0)] wire246;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire177;
  wire signed [(5'h10):(1'h0)] wire179;
  wire signed [(4'h8):(1'h0)] wire180;
  wire [(3'h4):(1'h0)] wire184;
  wire signed [(5'h14):(1'h0)] wire185;
  wire signed [(4'hf):(1'h0)] wire186;
  wire signed [(4'h8):(1'h0)] wire198;
  wire signed [(2'h3):(1'h0)] wire200;
  wire [(5'h12):(1'h0)] wire244;
  reg signed [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(5'h10):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg181 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  assign y = {wire247,
                 wire246,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire25,
                 wire26,
                 wire99,
                 wire177,
                 wire179,
                 wire180,
                 wire184,
                 wire185,
                 wire186,
                 wire198,
                 wire200,
                 wire244,
                 reg183,
                 reg182,
                 reg181,
                 reg10,
                 reg11,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= wire8[(1'h1):(1'h1)];
      reg11 <= (~^(-$signed((reg10 ? $unsigned(wire6) : (^(8'ha5))))));
    end
  assign wire12 = (^~$unsigned((~(7'h43))));
  assign wire13 = ((+{(^wire7[(2'h3):(1'h0)])}) >= wire12);
  assign wire14 = ($signed((~|$signed((&reg11)))) ?
                      (^{wire9[(4'h9):(3'h6)]}) : ({reg11[(2'h2):(1'h1)]} ?
                          {wire7,
                              (~^$signed((8'h9c)))} : $signed(wire7[(3'h4):(2'h2)])));
  assign wire15 = (&{wire9, wire7[(4'ha):(4'h8)]});
  assign wire16 = $unsigned(reg11);
  assign wire17 = $signed(((reg10 ? $signed(wire13) : wire7[(4'ha):(4'h8)]) ?
                      ($signed($signed(wire5)) & ($unsigned(reg11) ?
                          $unsigned(wire14) : wire13[(3'h7):(1'h0)])) : $unsigned(wire15[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg18 <= (({($unsigned(reg11) >>> wire17[(2'h2):(2'h2)])} ?
              (|wire16) : $signed($signed((~^wire9)))) ?
          wire6[(2'h2):(1'h1)] : wire14);
      if ((-$unsigned(wire13)))
        begin
          reg19 <= (-$unsigned($signed({wire5[(4'h8):(1'h0)],
              (wire15 && reg11)})));
        end
      else
        begin
          reg19 <= $unsigned(wire17[(5'h12):(2'h3)]);
          reg20 <= $unsigned($unsigned($unsigned($unsigned(wire13))));
          if ($unsigned($signed({{(~^(8'hab)), wire12},
              $unsigned($unsigned(wire9))})))
            begin
              reg21 <= $signed(reg19[(3'h4):(1'h0)]);
              reg22 <= reg10[(3'h5):(3'h4)];
              reg23 <= ((^wire9[(1'h0):(1'h0)]) ?
                  (8'hbb) : (wire12[(4'hb):(4'ha)] >> $unsigned($signed(wire14[(4'h8):(3'h4)]))));
            end
          else
            begin
              reg21 <= $unsigned((~&reg18));
              reg22 <= $unsigned($signed(((-(^~wire9)) ?
                  wire6 : (wire13[(4'hc):(4'h8)] + reg21))));
            end
          reg24 <= (wire9[(3'h4):(1'h1)] ?
              (-$unsigned($signed($signed(reg10)))) : wire17);
        end
    end
  assign wire25 = $unsigned(($signed(wire14[(2'h3):(1'h0)]) ?
                      reg20[(3'h7):(3'h6)] : ($unsigned(wire5) ?
                          ((-reg20) || $unsigned((8'hb9))) : $unsigned($unsigned(wire14)))));
  assign wire26 = (8'ha2);
  module27 #() modinst100 (.wire28(reg24), .wire32(reg10), .y(wire99), .wire29(wire13), .wire30(wire9), .wire31(reg20), .clk(clk));
  module101 #() modinst178 (.y(wire177), .wire104(wire14), .wire102(wire26), .clk(clk), .wire105(wire15), .wire103(wire17));
  assign wire179 = $signed($signed(wire15));
  assign wire180 = reg21[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg181 <= (((((wire177 ^ wire16) ? (~^reg24) : (^wire14)) ?
          wire7[(2'h2):(1'h0)] : wire5[(3'h5):(1'h0)]) <= (^$unsigned($unsigned(wire15)))) - wire179);
      reg182 <= wire8;
      reg183 <= (+(|($signed(wire25) & $signed(wire26))));
    end
  assign wire184 = $signed(((+$signed(reg22[(2'h2):(1'h1)])) ~^ $signed(((|reg11) - wire5))));
  assign wire185 = ($signed($unsigned(wire13)) >>> reg23[(1'h0):(1'h0)]);
  assign wire186 = {$unsigned((~|((wire15 ? wire177 : wire179) ~^ wire5)))};
  module187 #() modinst199 (.y(wire198), .wire191(wire7), .wire189(wire26), .wire190(wire179), .wire188(wire13), .clk(clk));
  assign wire200 = ((wire99[(4'ha):(2'h2)] << {wire6}) ?
                       reg182 : $signed((($signed(wire9) ?
                               $signed(reg24) : (+reg11)) ?
                           wire17 : $unsigned($unsigned((8'ha8))))));
  module201 #() modinst245 (wire244, clk, wire180, wire12, reg11, wire8, reg183);
  assign wire246 = ($signed(((wire16[(4'h9):(4'h8)] ?
                       wire15[(4'hf):(3'h5)] : (wire17 >= reg181)) > ($signed(wire17) ?
                       (~(8'haf)) : ((8'ha9) > reg10)))) <= (wire8 ?
                       $signed(wire9) : wire26[(4'hc):(4'hc)]));
  assign wire247 = $signed(reg20);
endmodule

module module201  (y, clk, wire206, wire205, wire204, wire203, wire202);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire206;
  input wire signed [(5'h14):(1'h0)] wire205;
  input wire [(4'hb):(1'h0)] wire204;
  input wire signed [(4'hf):(1'h0)] wire203;
  input wire signed [(5'h13):(1'h0)] wire202;
  wire [(4'hc):(1'h0)] wire243;
  wire signed [(2'h2):(1'h0)] wire235;
  wire [(4'hc):(1'h0)] wire224;
  wire [(5'h15):(1'h0)] wire223;
  wire signed [(4'ha):(1'h0)] wire222;
  wire signed [(4'hb):(1'h0)] wire215;
  wire [(4'he):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire213;
  wire signed [(4'hf):(1'h0)] wire212;
  wire signed [(3'h7):(1'h0)] wire211;
  wire signed [(3'h4):(1'h0)] wire210;
  wire signed [(2'h3):(1'h0)] wire209;
  wire [(5'h13):(1'h0)] wire208;
  wire [(3'h7):(1'h0)] wire207;
  reg [(4'h9):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg241 = (1'h0);
  reg signed [(4'he):(1'h0)] reg240 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg239 = (1'h0);
  reg [(2'h3):(1'h0)] reg238 = (1'h0);
  reg [(5'h10):(1'h0)] reg237 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg236 = (1'h0);
  reg [(2'h3):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg233 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg232 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg231 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg229 = (1'h0);
  reg [(3'h5):(1'h0)] reg228 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg226 = (1'h0);
  reg [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg221 = (1'h0);
  reg signed [(4'he):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(2'h3):(1'h0)] reg217 = (1'h0);
  reg [(3'h4):(1'h0)] reg216 = (1'h0);
  assign y = {wire243,
                 wire235,
                 wire224,
                 wire223,
                 wire222,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
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
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 (1'h0)};
  assign wire207 = (8'ha6);
  assign wire208 = wire202;
  assign wire209 = $signed(wire208[(3'h5):(1'h1)]);
  assign wire210 = (((~^wire206) >>> $signed({wire208})) ? (7'h40) : (8'ha5));
  assign wire211 = (((($unsigned(wire210) ?
                           wire205[(4'h8):(3'h4)] : (wire209 & wire208)) || wire202) * (wire203[(1'h0):(1'h0)] && (wire208 ?
                           (wire208 < (8'hbc)) : (wire209 ?
                               wire206 : wire205)))) ?
                       ($unsigned(((-wire202) <= (wire210 ?
                               wire202 : wire203))) ?
                           wire207 : (wire205 | (~^(wire204 ~^ wire209)))) : $unsigned(wire207));
  assign wire212 = ((|wire204) + $signed(wire207));
  assign wire213 = {wire211, wire211};
  assign wire214 = (7'h44);
  assign wire215 = wire209[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if (wire215[(1'h0):(1'h0)])
        begin
          reg216 <= ($unsigned((($signed(wire211) & {(8'hbb)}) ?
              wire211[(3'h4):(3'h4)] : ($unsigned((8'hab)) > wire207))) != $unsigned(wire205));
        end
      else
        begin
          if (((~(!((wire210 - wire213) * (wire214 * wire211)))) > wire206[(2'h3):(1'h1)]))
            begin
              reg216 <= ({(~^wire210)} ?
                  ((|($signed((7'h43)) | (^wire208))) ?
                      $signed(wire212) : reg216) : ((|(wire203 ?
                          {(8'h9d)} : (wire204 ? wire208 : wire212))) ?
                      wire211 : wire208));
              reg217 <= wire214;
            end
          else
            begin
              reg216 <= wire211;
              reg217 <= ((wire207[(3'h4):(2'h2)] ?
                      (^((wire210 ? wire215 : wire213) ?
                          {(7'h40)} : $unsigned(wire207))) : ({(wire209 >>> reg216)} ?
                          (wire214 || $signed((8'h9f))) : $unsigned((wire204 ?
                              (8'hbf) : wire215)))) ?
                  (~reg217) : wire213);
              reg218 <= (|$unsigned($signed(wire214)));
            end
          reg219 <= $unsigned($unsigned(((^~wire211) <= (^~$signed(wire204)))));
          reg220 <= (~|((~^($signed((8'hb9)) | (wire202 > reg218))) ?
              reg218 : {$unsigned($unsigned(wire202))}));
        end
      reg221 <= $signed(wire215);
    end
  assign wire222 = wire204[(2'h3):(2'h2)];
  assign wire223 = (&wire211[(1'h1):(1'h0)]);
  assign wire224 = (^~$signed((wire202[(4'hd):(2'h3)] ?
                       reg216[(2'h2):(2'h2)] : ((~&(7'h42)) * $unsigned(wire204)))));
  always
    @(posedge clk) begin
      if (wire215[(3'h7):(3'h4)])
        begin
          reg225 <= ($signed(((8'hba) ?
              ($signed(reg218) ?
                  $unsigned((8'ha8)) : (wire210 != reg221)) : reg218)) < {wire212,
              wire211[(2'h2):(1'h0)]});
          reg226 <= wire208;
        end
      else
        begin
          reg225 <= ((^~$unsigned((~^$unsigned((8'ha4))))) ?
              wire208[(3'h6):(3'h4)] : wire210);
          reg226 <= reg218;
          reg227 <= $unsigned(wire204[(3'h5):(2'h2)]);
          reg228 <= reg218[(4'h8):(4'h8)];
          reg229 <= $unsigned($unsigned((^~(~^$signed(wire206)))));
        end
      reg230 <= $signed(wire222[(3'h7):(3'h7)]);
      reg231 <= $unsigned((~&({$signed(reg216)} ?
          wire205[(4'hd):(1'h1)] : $unsigned($unsigned((8'h9c))))));
    end
  always
    @(posedge clk) begin
      reg232 <= wire211;
      reg233 <= $unsigned(((8'h9d) ?
          $unsigned((wire223[(4'ha):(3'h6)] || (wire208 ?
              reg217 : reg231))) : $unsigned(wire215)));
      reg234 <= (wire212 || (8'haf));
    end
  assign wire235 = (8'hae);
  always
    @(posedge clk) begin
      reg236 <= $signed(reg234);
      reg237 <= (!{reg217[(2'h3):(2'h2)]});
      reg238 <= ($signed((~wire235[(1'h1):(1'h1)])) >> reg233);
      reg239 <= wire211;
      if ({$unsigned((({wire205} ^~ (wire214 >= (8'hb8))) * $signed((wire215 - reg238))))})
        begin
          reg240 <= $signed((~&($signed({(8'hb5),
              wire202}) < $signed(reg233))));
          reg241 <= (8'had);
          reg242 <= $unsigned(((+((^~reg225) <<< (8'hbc))) <<< {{reg218,
                  $unsigned(reg230)},
              {reg226}}));
        end
      else
        begin
          reg240 <= reg221[(3'h4):(2'h2)];
        end
    end
  assign wire243 = $signed((-($unsigned(reg242) ?
                       wire203 : (-$signed(wire209)))));
endmodule

module module187
#(parameter param197 = (|{(({(8'ha2), (8'hae)} ? (+(8'hb0)) : ((7'h42) ? (8'hb3) : (8'hb2))) - (|{(8'hb1)})), ({(8'hb9)} ? (!{(8'hb1)}) : (~((8'ha4) ^ (8'had))))}))
(y, clk, wire191, wire190, wire189, wire188);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire191;
  input wire [(3'h4):(1'h0)] wire190;
  input wire [(3'h4):(1'h0)] wire189;
  input wire signed [(4'hd):(1'h0)] wire188;
  wire [(4'h8):(1'h0)] wire196;
  wire signed [(3'h7):(1'h0)] wire195;
  wire signed [(5'h11):(1'h0)] wire194;
  wire signed [(5'h10):(1'h0)] wire193;
  wire signed [(4'he):(1'h0)] wire192;
  assign y = {wire196, wire195, wire194, wire193, wire192, (1'h0)};
  assign wire192 = (($signed(wire189[(2'h2):(2'h2)]) - (((wire188 ?
                           (8'hb7) : wire190) >= (wire190 <<< wire190)) ?
                       wire189 : {$signed(wire189),
                           (~&wire190)})) >= wire190[(1'h1):(1'h1)]);
  assign wire193 = (+($signed(wire190) ?
                       (wire191 | $unsigned((wire188 ?
                           (8'had) : wire188))) : (((^~wire190) & $signed(wire190)) >> $unsigned(wire190))));
  assign wire194 = $unsigned(((~^(wire192[(2'h2):(1'h1)] <<< wire191)) * ($signed(wire192) ?
                       (wire190[(3'h4):(1'h1)] || $signed(wire189)) : $signed($unsigned(wire193)))));
  assign wire195 = wire189[(3'h4):(2'h2)];
  assign wire196 = ($signed(wire194[(2'h2):(1'h1)]) ?
                       (((8'hb9) ? $signed($unsigned(wire189)) : wire191) ?
                           (wire191 ?
                               {wire195[(3'h6):(3'h6)],
                                   wire189[(3'h4):(3'h4)]} : $unsigned(((7'h40) ?
                                   (8'hb0) : wire192))) : wire189) : (7'h44));
endmodule

module module101
#(parameter param176 = (^~(+((-((8'hbf) ~^ (8'hb6))) ? (((8'ha3) & (8'haa)) >> (~&(8'ha5))) : ((|(7'h44)) ? ((8'h9f) < (8'ha0)) : ((8'hb4) ? (8'hba) : (8'h9f)))))))
(y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h328):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire105;
  input wire [(4'hd):(1'h0)] wire104;
  input wire [(3'h6):(1'h0)] wire103;
  input wire signed [(4'hc):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire [(5'h12):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire161;
  wire signed [(5'h14):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire106;
  reg signed [(4'hd):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(5'h10):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'hb):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire169,
                 wire161,
                 wire160,
                 wire106,
                 reg172,
                 reg171,
                 reg170,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
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
                 (1'h0)};
  assign wire106 = {($signed($signed((wire104 ^ wire102))) ?
                           (~$signed($unsigned(wire104))) : wire103),
                       $signed((wire104 & wire104[(1'h0):(1'h0)]))};
  always
    @(posedge clk) begin
      if (wire104)
        begin
          reg107 <= $signed(wire106);
        end
      else
        begin
          reg107 <= ((&(((wire103 << wire102) & wire105) ?
              wire104[(4'hb):(1'h0)] : ((wire105 != wire106) ?
                  $signed(wire104) : reg107))) ~^ (!($signed(wire106[(2'h3):(2'h3)]) ?
              ({wire104, wire105} ?
                  wire105[(5'h10):(4'h8)] : ((8'hbb) * reg107)) : $signed((8'hb6)))));
          if (($signed(wire105) & wire104))
            begin
              reg108 <= ($unsigned(reg107[(3'h5):(1'h1)]) != (reg107[(2'h3):(1'h1)] >= ((|$signed(wire104)) ~^ ((wire104 ?
                  wire103 : wire105) ^~ (wire102 * wire105)))));
            end
          else
            begin
              reg108 <= (wire104 <= $signed((&$signed($signed(reg107)))));
              reg109 <= $unsigned((!($signed($unsigned(wire105)) ?
                  (wire104 ?
                      $unsigned(wire104) : reg107) : $unsigned(wire104))));
            end
          reg110 <= $signed(wire104);
          if (wire102[(3'h6):(2'h3)])
            begin
              reg111 <= wire105[(5'h10):(1'h0)];
              reg112 <= (reg110 > ((8'hb7) ?
                  $unsigned(wire106) : ((+wire106[(1'h0):(1'h0)]) && ((wire106 <= wire105) > ((8'ha0) ?
                      wire102 : reg107)))));
              reg113 <= (($unsigned(reg112) ^ $signed((wire103[(1'h0):(1'h0)] == (wire105 ?
                      wire105 : wire102)))) ?
                  wire102 : $signed($unsigned($unsigned((-wire102)))));
              reg114 <= $signed(reg107[(1'h1):(1'h0)]);
            end
          else
            begin
              reg111 <= $unsigned(wire106[(3'h6):(3'h6)]);
              reg112 <= (~(&reg112[(1'h0):(1'h0)]));
            end
          reg115 <= ((^(wire102[(3'h6):(3'h4)] >>> wire103)) ?
              {($signed(reg113) ?
                      {$unsigned(wire102),
                          (~wire102)} : (reg111[(1'h0):(1'h0)] ?
                          (wire103 ?
                              wire103 : wire106) : $signed(reg112)))} : ($signed((~|{wire106,
                      wire106})) ?
                  wire104 : (&(wire106 ?
                      {reg109, reg114} : (reg110 ~^ reg107)))));
        end
      reg116 <= ((~&$signed({(^reg115)})) <<< ((($signed((8'hbf)) ^~ reg107) ?
              ((reg114 - reg113) ?
                  ((8'h9f) ?
                      (8'haf) : reg115) : (8'hb3)) : $unsigned(wire104)) ?
          $signed((8'ha0)) : ((&$unsigned(reg111)) < ((~^reg108) >> (8'ha3)))));
      if ((^~(({wire103,
          (|reg108)} <<< (~reg109)) ~^ $signed($unsigned((&(8'ha2)))))))
        begin
          reg117 <= $unsigned((~$unsigned($signed((reg114 > wire106)))));
          if ((($signed(($unsigned(reg111) | $unsigned(reg114))) >= (^~(8'hae))) ?
              (^reg116[(4'ha):(2'h3)]) : $signed($signed({(reg114 ?
                      reg111 : reg108)}))))
            begin
              reg118 <= reg110;
            end
          else
            begin
              reg118 <= ($signed((reg111[(3'h7):(3'h6)] ?
                      (^~(reg117 <= reg113)) : {$signed(wire104),
                          (&wire106)})) ?
                  (^~$unsigned(((reg114 <= reg109) >>> (8'haf)))) : $signed($unsigned((reg118[(1'h0):(1'h0)] >>> (reg115 ?
                      reg107 : wire105)))));
            end
          reg119 <= wire102[(4'ha):(1'h0)];
        end
      else
        begin
          if ((-reg112[(1'h1):(1'h1)]))
            begin
              reg117 <= $signed(((reg111[(2'h2):(1'h0)] ?
                  wire103 : ((~reg115) & $unsigned(reg118))) < (+$signed((8'ha0)))));
              reg118 <= ($unsigned($signed(((wire102 && reg118) >> ((8'hab) ?
                  wire103 : (8'hb4))))) >> reg119[(1'h1):(1'h0)]);
              reg119 <= (~$signed($unsigned(($signed(reg113) && {(8'hb4),
                  (8'hb7)}))));
            end
          else
            begin
              reg117 <= ($unsigned(((wire102 - {wire103, (8'h9c)}) ?
                  reg119[(1'h0):(1'h0)] : wire102[(4'ha):(4'ha)])) == reg108);
              reg118 <= ((-((8'ha6) ?
                      (+$signed(reg110)) : reg112[(3'h7):(2'h3)])) ?
                  reg115[(4'he):(1'h1)] : wire103[(3'h6):(3'h6)]);
            end
          reg120 <= ((+wire105[(4'hc):(3'h5)]) ^ (-reg112[(1'h0):(1'h0)]));
          reg121 <= wire105;
        end
      reg122 <= wire103;
    end
  always
    @(posedge clk) begin
      reg123 <= (reg116 ?
          (($unsigned((8'hb2)) ?
              {(reg113 || reg115)} : (-$unsigned((8'haf)))) + (($unsigned((8'ha5)) < $signed((8'hbc))) ?
              (8'ha6) : {(8'hbc), reg115})) : $signed($signed((!(wire104 ?
              reg114 : reg114)))));
      if ($signed($signed((+((reg109 ? reg112 : reg108) != $signed(reg115))))))
        begin
          if ((reg121 ?
              $unsigned(($signed((reg108 ^~ reg119)) ?
                  reg112 : $unsigned($signed(reg110)))) : ((reg119[(5'h14):(3'h4)] ?
                      (wire103 ? reg114 : (~|wire102)) : wire105) ?
                  ((^(|(8'h9d))) <<< reg121[(2'h3):(1'h0)]) : (8'haf))))
            begin
              reg124 <= ({($signed((reg111 ?
                          reg116 : reg118)) ~^ $unsigned((8'ha2))),
                      ((~^wire102) ?
                          ((reg123 ? reg122 : (7'h43)) <= reg107) : reg115)} ?
                  wire104[(4'h9):(2'h2)] : $signed((~|{reg123[(3'h5):(3'h4)],
                      (^~reg119)})));
              reg125 <= reg113[(1'h1):(1'h0)];
              reg126 <= $unsigned({$unsigned(reg107),
                  (^~({reg125} ?
                      (reg120 ? reg118 : reg109) : (reg125 << (8'hb5))))});
              reg127 <= $signed((^reg124));
            end
          else
            begin
              reg124 <= wire103[(2'h3):(2'h2)];
            end
          if ($unsigned(wire103))
            begin
              reg128 <= ((reg113 > $unsigned($signed((reg122 ?
                  reg124 : (8'hb1))))) || ((~^reg125[(1'h1):(1'h1)]) && {(reg118[(5'h12):(4'hd)] ?
                      (8'h9c) : reg108),
                  {$signed(reg109), (wire106 || wire104)}}));
              reg129 <= ({(reg111 ?
                          $unsigned($unsigned(reg116)) : ((8'ha4) ?
                              (reg124 ? reg115 : reg119) : $unsigned(reg109))),
                      {(reg118 <<< $unsigned(reg116))}} ?
                  (~reg123[(2'h3):(1'h1)]) : (wire103[(1'h0):(1'h0)] ?
                      reg121[(2'h2):(1'h1)] : ((reg107 ?
                          reg118[(4'hc):(4'hc)] : (reg120 ?
                              reg124 : (7'h44))) ^~ ((8'h9c) == $unsigned(reg118)))));
              reg130 <= {{{$signed((reg111 == wire105))}, reg124}};
              reg131 <= $unsigned(reg121[(1'h0):(1'h0)]);
              reg132 <= (($signed(reg108[(1'h1):(1'h1)]) > $signed($unsigned(reg114[(1'h0):(1'h0)]))) >>> {reg118});
            end
          else
            begin
              reg128 <= {wire105[(3'h5):(3'h5)]};
              reg129 <= wire102[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg124 <= reg121;
          reg125 <= ((~&(((|reg114) && $signed(reg113)) ?
              $signed($signed(wire103)) : reg112[(3'h5):(3'h4)])) >= (7'h40));
          reg126 <= ({$unsigned(reg127)} >>> $signed(reg113[(3'h7):(1'h1)]));
          reg127 <= $signed(reg126);
        end
      if ($unsigned($unsigned((~&reg129))))
        begin
          reg133 <= $unsigned($unsigned(reg123[(2'h3):(2'h2)]));
        end
      else
        begin
          reg133 <= (reg107[(4'hb):(3'h5)] >> ($unsigned((((8'hbd) << reg125) && ((8'hb2) ~^ reg126))) - wire102));
          reg134 <= reg116;
        end
      if (reg131)
        begin
          reg135 <= $unsigned(wire104);
          if (wire103[(1'h1):(1'h0)])
            begin
              reg136 <= $signed($signed(reg116[(1'h0):(1'h0)]));
              reg137 <= (&$unsigned({$unsigned($signed(reg135)),
                  (~$unsigned(reg120))}));
              reg138 <= ($unsigned((^$signed({reg118,
                  reg128}))) <= $unsigned((reg120 ?
                  $signed((reg118 ? wire104 : wire103)) : ((wire103 + reg127) ?
                      wire105 : (^~reg109)))));
              reg139 <= {wire102[(3'h7):(1'h0)], {reg136}};
            end
          else
            begin
              reg136 <= (reg110 <= reg126);
              reg137 <= ({reg121[(1'h1):(1'h1)],
                  reg110[(1'h0):(1'h0)]} - reg119);
              reg138 <= $signed({(reg119[(3'h5):(3'h5)] == (+(reg109 >= reg128))),
                  reg125});
            end
          reg140 <= (($signed((^reg119[(5'h10):(3'h6)])) ?
              ($unsigned($signed(wire105)) <= $unsigned((&reg132))) : (^reg121[(1'h0):(1'h0)])) + ({$unsigned((&reg137))} || ($signed({wire105}) ~^ $unsigned((|(8'ha2))))));
        end
      else
        begin
          reg135 <= ({{{$unsigned(reg126)}}} ?
              (|$unsigned((~&$unsigned(reg111)))) : $unsigned((reg138[(1'h1):(1'h0)] ?
                  $unsigned($signed(wire104)) : $signed($unsigned(reg112)))));
          reg136 <= reg139[(3'h6):(2'h3)];
          reg137 <= (~$unsigned((reg135[(2'h3):(2'h2)] ?
              ((!wire105) ?
                  wire105 : reg113) : $unsigned((reg137 && reg140)))));
        end
      reg141 <= (reg137[(4'h9):(1'h1)] ?
          (~|$unsigned($unsigned(reg124[(4'he):(1'h1)]))) : ({wire106[(2'h2):(1'h0)]} ?
              $unsigned($signed(((8'h9c) ? reg107 : (7'h43)))) : (~(8'ha8))));
    end
  always
    @(posedge clk) begin
      reg142 <= reg138;
      if ((8'ha1))
        begin
          reg143 <= (($unsigned((^~$signed(reg133))) << $unsigned($signed($unsigned(reg119)))) & (reg126[(2'h2):(1'h0)] + ((!$signed(reg124)) ?
              {(reg133 == reg119), reg112} : reg142)));
          if ((($signed({$signed((8'ha1))}) * {(~$unsigned(reg114))}) <<< (^~((~(reg116 ^ reg127)) ?
              ($unsigned(reg116) && (reg112 | reg122)) : reg114[(1'h1):(1'h0)]))))
            begin
              reg144 <= $unsigned($unsigned(($unsigned(reg123[(1'h1):(1'h1)]) ^~ reg121[(2'h3):(1'h1)])));
              reg145 <= $signed(($unsigned($unsigned(reg130[(2'h2):(1'h0)])) ?
                  reg127[(3'h7):(3'h6)] : (reg107 >>> ({reg110} ?
                      (8'hab) : $unsigned((8'ha5))))));
              reg146 <= {$signed(($unsigned($signed(reg136)) && {{reg137,
                          reg111},
                      (+reg142)}))};
            end
          else
            begin
              reg144 <= (8'hbc);
              reg145 <= $unsigned(reg120[(3'h4):(2'h2)]);
              reg146 <= $signed(reg112[(3'h4):(2'h3)]);
            end
          if ((~&$signed($signed({(reg116 && reg129),
              (reg112 ? reg133 : reg138)}))))
            begin
              reg147 <= reg124;
              reg148 <= (!($signed((wire105[(1'h0):(1'h0)] + (reg145 ?
                      reg126 : reg116))) ?
                  (!$signed($unsigned((8'ha9)))) : reg111));
              reg149 <= $signed(((-{(reg124 ? reg119 : reg112), (~^reg129)}) ?
                  (&(+(&(8'had)))) : (+$signed(reg117))));
            end
          else
            begin
              reg147 <= reg139;
              reg148 <= {((~((7'h44) << $unsigned(reg122))) == $unsigned(reg128[(1'h1):(1'h1)])),
                  reg110};
            end
          reg150 <= reg109[(2'h3):(2'h2)];
        end
      else
        begin
          reg143 <= (|{reg127, $unsigned((+(reg134 ? reg123 : reg124)))});
        end
      reg151 <= {$unsigned({(~|$unsigned(reg111)),
              $signed(((8'hb5) & reg149))})};
      if (reg135)
        begin
          reg152 <= ($signed((8'had)) ? reg115 : reg109);
          reg153 <= (((~^(8'hb2)) <<< reg115) >= ($signed((^~(reg128 > reg146))) ?
              reg131 : reg123));
        end
      else
        begin
          reg152 <= {(reg132 ?
                  (reg137 || $unsigned((reg120 > reg139))) : {(~^(&(7'h40))),
                      $signed($signed(reg114))})};
          reg153 <= (reg128 == $signed($signed(((~reg141) ?
              $unsigned(reg137) : reg113))));
          reg154 <= ((wire106 & $unsigned((|(8'hbc)))) ?
              reg122 : {((8'ha5) | {reg148[(1'h1):(1'h0)], $signed((7'h44))}),
                  $unsigned(({wire102} ? {reg135, wire105} : (^~reg119)))});
          if (reg139)
            begin
              reg155 <= $signed((8'hb9));
            end
          else
            begin
              reg155 <= ($unsigned(reg125[(1'h1):(1'h1)]) - ($unsigned((reg126[(2'h2):(1'h0)] ?
                  $signed((8'ha6)) : $signed(reg140))) ^~ {{(!reg116)}}));
              reg156 <= reg112;
              reg157 <= (reg137[(4'ha):(4'h8)] ?
                  (|$unsigned(($unsigned(reg135) && ((7'h40) ?
                      reg115 : reg118)))) : $signed(reg132));
              reg158 <= $unsigned((reg148 ?
                  reg114 : ((~$signed(reg134)) ?
                      ((reg122 | (8'ha7)) ?
                          reg135 : $signed(wire102)) : (((8'ha6) != reg121) ?
                          reg150[(3'h4):(1'h0)] : ((8'h9d) ?
                              reg137 : wire106)))));
              reg159 <= (|$signed((reg132[(3'h5):(3'h5)] ?
                  reg132[(2'h2):(1'h0)] : $unsigned($unsigned(reg119)))));
            end
        end
    end
  assign wire160 = reg156[(4'hd):(1'h1)];
  assign wire161 = ((($signed({reg112, reg138}) ?
                           reg120 : $unsigned(reg157[(3'h4):(2'h3)])) ?
                       ((8'hb9) ?
                           reg155[(2'h2):(1'h1)] : reg149) : {(8'hb0)}) > ((reg113[(4'h8):(4'h8)] < {(reg108 ?
                               reg154 : reg154),
                           {reg131}}) ?
                       (8'ha6) : $unsigned(reg150)));
  always
    @(posedge clk) begin
      reg162 <= reg152;
      if ((8'hb8))
        begin
          reg163 <= reg114[(2'h3):(2'h2)];
          if ((reg151 * (reg145[(2'h3):(1'h1)] - (((reg138 ?
                      (8'ha3) : (8'hb0)) ?
                  (reg110 << (7'h42)) : {reg154, reg121}) ?
              (((8'ha1) ?
                  reg115 : (8'hb5)) > reg163[(4'ha):(3'h7)]) : $unsigned($unsigned(reg156))))))
            begin
              reg164 <= (reg128 ?
                  $signed((reg113 ?
                      $unsigned((8'haa)) : (~|$unsigned(reg150)))) : reg153);
              reg165 <= {$signed(($unsigned(reg154[(3'h6):(3'h4)]) <<< (reg140 ?
                      $unsigned(reg121) : {reg159, reg122})))};
              reg166 <= $signed($signed($signed(reg162)));
            end
          else
            begin
              reg164 <= {reg139};
              reg165 <= ($signed(wire161) ?
                  {{(8'h9d),
                          (((8'hba) == reg116) ?
                              reg120[(2'h3):(1'h1)] : (~|(8'hac)))},
                      reg145} : reg111);
              reg166 <= ((^reg151[(3'h5):(2'h3)]) ^~ $signed((({reg117,
                      reg131} ?
                  (reg143 ~^ reg138) : reg152) != {((8'h9c) ? (7'h44) : reg144),
                  {reg120, reg166}})));
              reg167 <= reg128;
            end
          reg168 <= ((8'hab) ? reg129 : $signed(reg146[(1'h0):(1'h0)]));
        end
      else
        begin
          reg163 <= $signed(reg123[(3'h6):(3'h6)]);
          reg164 <= (^~(reg163 ?
              $unsigned({(reg157 < reg138),
                  $signed(reg127)}) : $unsigned($unsigned(reg149))));
          reg165 <= $unsigned($signed((^~reg129[(3'h7):(1'h1)])));
        end
    end
  assign wire169 = $signed(reg151[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg170 <= reg154;
      reg171 <= (~($signed(((reg147 | (8'hbb)) & $signed(reg128))) - $signed({(reg120 ?
              reg124 : reg126),
          reg114})));
      reg172 <= reg154[(2'h3):(1'h1)];
    end
  assign wire173 = ((reg121[(1'h1):(1'h0)] ~^ $signed($signed(((8'hb4) ?
                           reg147 : (8'h9f))))) ?
                       reg154[(1'h1):(1'h0)] : reg111[(4'hc):(3'h6)]);
  assign wire174 = (^$signed({reg137, (8'hbb)}));
  assign wire175 = $unsigned($unsigned({(~(-reg144)), reg148}));
endmodule

module module27
#(parameter param98 = (((~&{((8'hb9) ? (8'h9e) : (8'hbd)), (~(8'hb1))}) ? ((!((8'hb9) ^ (7'h42))) ? (((8'hab) ~^ (8'hbf)) ? (8'ha7) : (&(8'h9f))) : (((8'ha6) ? (7'h43) : (8'ha3)) ^ ((8'ha8) ^ (8'ha5)))) : (!(8'haf))) ? {(~^((~|(8'hbb)) && ((8'ha3) || (8'haa)))), (({(8'hbd), (7'h41)} ? ((8'ha7) ? (7'h41) : (8'hb9)) : (8'hbe)) ? (~&(8'ha9)) : (-(8'ha3)))} : (((((8'hbf) ? (8'hb9) : (8'ha6)) ? ((7'h41) >>> (8'hbd)) : ((8'hb1) ? (8'haa) : (8'ha7))) >= {((8'hb7) < (8'hb3))}) ? ((((8'hb4) ? (8'hb5) : (8'hb9)) ? ((8'hbd) ? (8'had) : (8'hbf)) : (^(7'h44))) ? (((8'h9e) ^~ (8'hbf)) ? (-(8'h9e)) : ((8'hb1) <= (7'h41))) : (&((8'ha8) == (7'h41)))) : (~&(~&((8'h9f) ? (8'had) : (8'ha1)))))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h2fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire [(4'hb):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  assign y = {wire97,
                 wire81,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire66,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg96,
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
                 reg80,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
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
                 (1'h0)};
  assign wire33 = $signed((^(8'ha9)));
  assign wire34 = $signed(($unsigned($unsigned((~^wire33))) <<< $signed(wire31)));
  assign wire35 = (8'ha2);
  assign wire36 = wire30;
  assign wire37 = $unsigned($signed(wire32));
  assign wire38 = (wire31[(1'h1):(1'h1)] ?
                      wire35 : $unsigned({((&wire37) && $signed(wire34))}));
  assign wire39 = $unsigned($signed((~(~^(wire28 ? wire34 : wire29)))));
  always
    @(posedge clk) begin
      if ((!wire34))
        begin
          reg40 <= $unsigned((^~(wire32[(3'h4):(1'h0)] == wire29)));
          reg41 <= (~&$signed($signed((^(wire33 != wire28)))));
        end
      else
        begin
          reg40 <= $signed(wire38[(4'ha):(4'h8)]);
        end
      reg42 <= $unsigned(wire36[(4'hb):(4'h8)]);
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned((|(~(wire38 ? wire38 : wire38))))))
        begin
          if ($unsigned($unsigned((!wire39[(4'ha):(4'h8)]))))
            begin
              reg43 <= reg41;
            end
          else
            begin
              reg43 <= $signed(wire33[(1'h0):(1'h0)]);
              reg44 <= $unsigned((&wire28[(1'h0):(1'h0)]));
            end
          if ((|{(($signed(wire35) ? (^~(8'ha4)) : wire37) ?
                  ((reg40 + reg44) ?
                      wire31[(1'h0):(1'h0)] : $unsigned(wire28)) : (8'ha5))}))
            begin
              reg45 <= (-(~|reg43));
              reg46 <= (((8'h9e) ?
                      $unsigned((~^reg40[(3'h6):(1'h1)])) : $signed(((~|reg44) ?
                          reg45 : $unsigned((8'hbc))))) ?
                  $signed(((((7'h41) == wire35) || (+reg42)) ?
                      wire28 : $signed((~&reg41)))) : wire37[(2'h2):(2'h2)]);
              reg47 <= (^$signed((^(reg42[(4'hc):(1'h1)] - reg45))));
            end
          else
            begin
              reg45 <= $signed((|$unsigned(reg40)));
              reg46 <= reg41;
              reg47 <= $signed((($unsigned(wire37) ?
                      {(reg47 >>> reg45), (8'ha5)} : wire33[(4'ha):(1'h1)]) ?
                  (&$unsigned((&(7'h43)))) : wire28[(4'h8):(3'h5)]));
              reg48 <= $unsigned($unsigned((((~|reg44) == reg47) | (~$unsigned(wire36)))));
              reg49 <= wire33;
            end
          reg50 <= (((~&$signed((^~(8'hbf)))) ^~ $unsigned(reg43[(3'h4):(2'h2)])) ?
              $unsigned($unsigned((^~(reg47 > reg46)))) : (wire31[(1'h0):(1'h0)] ?
                  $unsigned($signed((wire37 == wire29))) : (-(~^reg43[(1'h0):(1'h0)]))));
          if ((((($signed((8'had)) ?
              (wire30 ?
                  wire30 : (8'hb9)) : reg43) >>> {{(7'h42)}}) <<< $signed($signed((~&reg41)))) ^~ ($signed(((&reg47) || ((8'hb5) ?
              wire28 : wire30))) ^ (~&(wire28 ^~ wire33)))))
            begin
              reg51 <= (({$unsigned((reg49 << (8'ha2)))} << (wire34[(3'h5):(2'h3)] || reg46[(3'h6):(2'h3)])) <= $unsigned($unsigned(wire32)));
              reg52 <= ($unsigned(wire38[(4'hb):(1'h0)]) ?
                  $signed($signed(reg49)) : $unsigned((reg41 ?
                      (8'hba) : ((wire34 != reg50) + (&wire35)))));
              reg53 <= (^~$signed({$unsigned($unsigned(wire35)),
                  $unsigned(reg50[(2'h2):(1'h0)])}));
              reg54 <= ($signed(wire30) ?
                  reg40[(4'hd):(4'ha)] : $unsigned(((wire32 ~^ $signed(wire38)) ?
                      $unsigned((wire30 | reg53)) : $signed(reg49))));
              reg55 <= (wire31[(2'h2):(1'h1)] != {$signed($unsigned(wire36[(4'hb):(3'h7)])),
                  ({reg54} ?
                      {$unsigned(reg41),
                          (7'h41)} : ($signed(wire34) >> $unsigned(wire39)))});
            end
          else
            begin
              reg51 <= reg51;
            end
        end
      else
        begin
          reg43 <= (reg52[(3'h6):(1'h0)] != ($signed($signed((reg47 ?
                  reg43 : reg40))) ?
              wire38[(4'h9):(3'h5)] : reg54[(4'he):(1'h0)]));
        end
      if (wire29)
        begin
          if ($signed((((reg45[(1'h1):(1'h1)] >> $signed(wire32)) <= (reg55 ~^ wire39[(3'h7):(3'h5)])) >= (7'h42))))
            begin
              reg56 <= $unsigned(($unsigned((reg52[(4'hb):(2'h3)] ?
                  reg55[(2'h3):(1'h0)] : reg43)) > reg55));
            end
          else
            begin
              reg56 <= $signed({(reg54[(2'h2):(1'h1)] ?
                      wire37[(1'h1):(1'h0)] : ((wire28 & wire36) ?
                          (|reg47) : (reg45 == reg53))),
                  $unsigned((reg42 | wire35[(2'h3):(2'h3)]))});
            end
          reg57 <= ((|$signed(({wire31, wire35} ?
              reg49[(3'h7):(2'h3)] : (reg56 <<< wire33)))) ^ (|wire29[(1'h1):(1'h0)]));
          if (reg45[(2'h2):(2'h2)])
            begin
              reg58 <= ((~($signed($unsigned(wire39)) == (~|(wire39 ?
                      reg54 : reg47)))) ?
                  reg53 : reg43);
              reg59 <= (~{$signed((~|(reg42 + reg44))), wire30});
              reg60 <= reg41;
              reg61 <= reg51;
              reg62 <= $unsigned({$signed($unsigned(reg51))});
            end
          else
            begin
              reg58 <= {(~^{((-reg60) > $signed(reg52)),
                      $signed({reg49, (8'hb6)})})};
              reg59 <= wire28[(3'h5):(3'h4)];
            end
          reg63 <= (~|(^reg49));
        end
      else
        begin
          reg56 <= reg58;
        end
      reg64 <= {reg56, reg56};
      reg65 <= (({$unsigned($unsigned(reg60))} >>> $unsigned($unsigned(reg43))) != ((~|reg59[(1'h1):(1'h1)]) ?
          ((^~$unsigned(reg54)) == (wire28[(1'h1):(1'h0)] <<< (8'hae))) : (!((wire35 ?
                  reg58 : reg59) ?
              wire39 : (reg41 == reg61)))));
    end
  assign wire66 = $unsigned((reg64[(3'h6):(2'h2)] << ((!$unsigned((8'h9d))) ?
                      reg59[(3'h4):(2'h2)] : {wire32[(4'hc):(4'hb)]})));
  always
    @(posedge clk) begin
      if ({wire30[(2'h3):(1'h1)], reg45})
        begin
          reg67 <= reg45;
        end
      else
        begin
          if (reg42[(4'hf):(3'h6)])
            begin
              reg67 <= $signed($unsigned((reg61[(2'h2):(1'h0)] ?
                  {{(8'hbc)}} : $signed(reg42[(4'hb):(2'h2)]))));
              reg68 <= (reg54[(5'h11):(3'h4)] < (8'hba));
            end
          else
            begin
              reg67 <= $signed((reg40 - reg48[(3'h7):(2'h2)]));
              reg68 <= $unsigned((8'ha6));
            end
          reg69 <= ((wire31 * $unsigned((reg45 | {wire32, reg53}))) ?
              reg68[(3'h5):(3'h4)] : ($signed(reg40[(4'ha):(3'h4)]) ?
                  reg63[(3'h4):(1'h0)] : (7'h40)));
          reg70 <= ((($unsigned((~&reg54)) ?
                      wire66[(1'h0):(1'h0)] : {$signed(wire30),
                          $signed(wire30)}) ?
                  ({reg55[(2'h2):(1'h0)]} >> reg65[(4'h8):(1'h1)]) : (($signed((8'had)) | $signed((8'ha7))) ?
                      (^~(reg56 ? reg56 : reg63)) : (8'ha9))) ?
              ((~&(~^{reg58})) + $unsigned(wire31)) : (-$unsigned(((~reg41) ?
                  (reg49 ? reg68 : reg50) : wire34))));
          reg71 <= {wire28};
        end
      reg72 <= wire32[(3'h6):(3'h6)];
      reg73 <= {(reg48[(1'h0):(1'h0)] ? wire31 : wire36[(4'hb):(4'h9)]),
          (-$unsigned(reg65[(4'hc):(4'h9)]))};
    end
  assign wire74 = $unsigned(($signed($signed($unsigned((8'hae)))) << (($signed(reg52) == ((8'h9c) >= reg42)) ?
                      $signed($signed((8'hba))) : reg70)));
  assign wire75 = (reg55[(3'h6):(3'h6)] << reg59);
  assign wire76 = (|(wire32[(2'h2):(1'h1)] ^ {($unsigned(wire29) ^~ reg48[(1'h1):(1'h0)]),
                      {(reg67 | wire32), (~|reg73)}}));
  assign wire77 = (reg42 ?
                      (reg71[(1'h1):(1'h0)] ?
                          (reg56 >= $unsigned((reg51 ?
                              reg68 : reg61))) : (~&((reg55 ? reg58 : wire32) ?
                              ((8'had) <= wire74) : (~&(7'h40))))) : (8'h9e));
  assign wire78 = reg73;
  assign wire79 = reg58[(4'hf):(3'h6)];
  always
    @(posedge clk) begin
      reg80 <= reg52;
    end
  assign wire81 = (!({reg41,
                      $signed(reg70)} ^~ ((reg51 == reg80) + $signed(reg72))));
  always
    @(posedge clk) begin
      if ((reg80 ?
          reg55[(1'h1):(1'h0)] : (({reg40, (|reg56)} ^ wire35[(3'h6):(3'h5)]) ?
              reg60[(4'h9):(3'h4)] : $unsigned($unsigned($signed(reg48))))))
        begin
          if ((-(reg41 ?
              (wire75[(1'h1):(1'h0)] ?
                  wire35 : ($signed(reg48) << wire34)) : reg40[(4'ha):(4'h8)])))
            begin
              reg82 <= wire78[(1'h1):(1'h0)];
              reg83 <= $unsigned($unsigned((($unsigned((8'hbf)) ?
                      reg67 : $unsigned(reg82)) ?
                  reg72 : (-(reg44 & (8'hb9))))));
              reg84 <= $unsigned((-reg60[(4'ha):(1'h0)]));
              reg85 <= (8'hb5);
              reg86 <= ({(reg60 ? reg63[(2'h2):(1'h0)] : (^$unsigned(wire81))),
                  (-(&$signed(wire32)))} * reg60[(3'h5):(3'h4)]);
            end
          else
            begin
              reg82 <= $signed(wire66[(1'h0):(1'h0)]);
            end
          if (((reg60 < (wire32[(3'h6):(2'h2)] << (reg64 ?
              reg86[(3'h5):(1'h1)] : (^wire37)))) >= $signed(reg63[(1'h0):(1'h0)])))
            begin
              reg87 <= wire66[(1'h1):(1'h0)];
              reg88 <= $signed(reg59[(3'h6):(1'h0)]);
            end
          else
            begin
              reg87 <= {(($signed(reg54) & (&$signed(wire66))) <= (8'hbd))};
              reg88 <= (^$unsigned(reg55));
              reg89 <= reg88[(4'hb):(1'h1)];
              reg90 <= (reg56[(2'h2):(1'h1)] || ($signed(reg54) ?
                  (~((&reg48) >= $signed(reg63))) : ((7'h42) ?
                      (-$unsigned(reg86)) : {wire31, $unsigned(reg45)})));
            end
          reg91 <= ($signed($signed(($unsigned((8'hb5)) != (wire32 - (8'hbe))))) ?
              (reg46 ?
                  (&(((8'ha6) | reg65) ~^ $signed(reg69))) : (|{$signed(wire75),
                      (reg87 && (8'hac))})) : (~|($unsigned(reg60) ?
                  reg58 : (!(~|reg85)))));
          reg92 <= ((~reg46[(2'h2):(2'h2)]) <<< (|$signed((~|reg88))));
        end
      else
        begin
          if ($unsigned(($unsigned(wire77) == wire32)))
            begin
              reg82 <= $signed({(~&(reg59[(3'h6):(1'h0)] && (reg70 == reg40)))});
              reg83 <= $unsigned((reg45 ?
                  ((+(wire37 ? (8'ha5) : reg52)) ?
                      (((8'haf) ? wire81 : reg70) ?
                          (~wire74) : reg50) : reg55[(3'h6):(1'h0)]) : ($signed($signed(wire75)) ?
                      (-(reg73 ? reg52 : reg56)) : {((8'ha2) ?
                              reg80 : (8'ha0))})));
              reg84 <= reg55;
            end
          else
            begin
              reg82 <= (wire36[(4'hb):(4'h9)] ?
                  {(8'ha8)} : reg44[(3'h5):(1'h0)]);
              reg83 <= ($signed((-(~|reg80))) ?
                  (reg48 >> $unsigned(reg42)) : reg84);
              reg84 <= reg41;
              reg85 <= $unsigned(($signed(($signed(reg83) ?
                      ((8'had) ? wire28 : (8'ha8)) : (reg53 == (8'hb2)))) ?
                  wire32[(2'h2):(1'h0)] : $unsigned(((reg86 ? (8'hae) : reg55) ?
                      wire31[(2'h2):(2'h2)] : (reg49 ? wire76 : wire78)))));
              reg86 <= $unsigned($signed($unsigned({reg45[(2'h3):(2'h3)],
                  ((8'ha5) ? wire39 : (8'ha4))})));
            end
          reg87 <= wire79;
          reg88 <= ({(wire38 + reg42), reg42} ?
              (^~$signed($unsigned((wire30 < wire81)))) : (8'ha2));
          reg89 <= reg45[(1'h1):(1'h0)];
          reg90 <= (reg61 ? reg60 : reg73[(4'hc):(4'ha)]);
        end
      reg93 <= {($signed(((!wire39) << {reg86, (8'h9f)})) ?
              reg67 : reg80[(1'h1):(1'h1)])};
      reg94 <= reg90[(3'h5):(2'h2)];
      reg95 <= {reg55[(3'h5):(1'h1)]};
      reg96 <= $signed((^wire34[(2'h2):(1'h1)]));
    end
  assign wire97 = {$signed((|{{wire81, reg56}})),
                      $unsigned(reg84[(5'h12):(1'h0)])};
endmodule
