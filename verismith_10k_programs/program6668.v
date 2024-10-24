module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire238;
  wire signed [(2'h2):(1'h0)] wire237;
  wire [(5'h10):(1'h0)] wire236;
  wire [(4'h8):(1'h0)] wire233;
  wire signed [(4'hf):(1'h0)] wire232;
  wire [(4'h8):(1'h0)] wire231;
  wire signed [(5'h11):(1'h0)] wire221;
  wire [(4'hc):(1'h0)] wire212;
  wire signed [(4'ha):(1'h0)] wire147;
  wire signed [(4'hf):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire214;
  wire signed [(4'h8):(1'h0)] wire215;
  wire signed [(4'hc):(1'h0)] wire216;
  wire signed [(2'h3):(1'h0)] wire219;
  reg [(5'h10):(1'h0)] reg235 = (1'h0);
  reg [(4'hd):(1'h0)] reg234 = (1'h0);
  reg [(5'h10):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg229 = (1'h0);
  reg [(3'h6):(1'h0)] reg228 = (1'h0);
  reg [(2'h3):(1'h0)] reg227 = (1'h0);
  reg [(4'hc):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg225 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg224 = (1'h0);
  reg [(4'he):(1'h0)] reg223 = (1'h0);
  reg [(4'hd):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg218 = (1'h0);
  reg [(5'h11):(1'h0)] reg217 = (1'h0);
  reg [(3'h4):(1'h0)] reg148 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire233,
                 wire232,
                 wire231,
                 wire221,
                 wire212,
                 wire147,
                 wire146,
                 wire5,
                 wire144,
                 wire214,
                 wire215,
                 wire216,
                 wire219,
                 reg235,
                 reg234,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg218,
                 reg217,
                 reg148,
                 (1'h0)};
  assign wire5 = ({$signed((wire2 ? wire0 : (~|wire0))),
                     $unsigned(($unsigned(wire4) ^~ wire3[(3'h7):(3'h7)]))} <<< ((wire3 <= {(wire2 != wire3)}) ~^ (~|wire3)));
  module6 #() modinst145 (wire144, clk, wire1, wire5, wire0, wire4, wire2);
  assign wire146 = (!{((wire3 ? wire1 : (!wire1)) ?
                           (-wire5) : $unsigned((wire4 ? wire3 : wire144)))});
  assign wire147 = (|$unsigned({$signed(((8'hb5) + wire144)),
                       ({(8'hb5)} ? ((8'haa) | wire3) : (|wire144))}));
  always
    @(posedge clk) begin
      reg148 <= {$unsigned($signed($unsigned($signed(wire2))))};
    end
  module149 #() modinst213 (.wire151(reg148), .y(wire212), .wire150(wire4), .wire153(wire0), .clk(clk), .wire152(wire146));
  assign wire214 = (((~((wire146 ? wire146 : wire144) ?
                       $unsigned(wire2) : (wire5 == wire144))) * $signed($unsigned(wire147))) >> $signed(wire147[(1'h0):(1'h0)]));
  assign wire215 = {(!wire146)};
  assign wire216 = ((((wire1[(3'h6):(1'h1)] ?
                               (-wire212) : ((8'hb7) ? reg148 : wire5)) ?
                           $unsigned((wire3 - (8'hbe))) : wire147[(2'h3):(2'h3)]) <= (~&((wire2 ?
                           reg148 : wire3) ^~ ((8'had) ? wire3 : (8'hb2))))) ?
                       ($signed($unsigned(wire144[(3'h4):(2'h2)])) && {$signed((wire147 ?
                               wire212 : wire147))}) : $signed(wire144));
  always
    @(posedge clk) begin
      reg217 <= wire216[(4'ha):(4'h9)];
      reg218 <= (~(~|{$signed((wire4 ^ wire146)), wire0[(3'h4):(2'h3)]}));
    end
  module186 #() modinst220 (wire219, clk, wire147, wire0, wire2, wire144, wire214);
  assign wire221 = $signed($unsigned($signed((wire1[(2'h2):(2'h2)] ?
                       $signed(wire3) : (|wire0)))));
  always
    @(posedge clk) begin
      reg222 <= wire212[(4'hb):(4'hb)];
      if ((~|$unsigned($signed($unsigned($unsigned(wire219))))))
        begin
          reg223 <= reg218;
          reg224 <= (~(^~wire5[(4'ha):(4'h9)]));
        end
      else
        begin
          reg223 <= ($unsigned($unsigned($signed(((7'h42) ?
              (8'ha0) : wire147)))) && wire219);
          reg224 <= (!(wire214[(4'he):(4'he)] == (reg218[(2'h2):(1'h0)] * {{reg222}})));
          if ($unsigned((reg223[(1'h0):(1'h0)] ?
              wire1[(4'he):(3'h5)] : (((wire3 ?
                      wire216 : wire216) ^~ (wire0 > wire212)) ?
                  $unsigned((+(7'h41))) : wire146))))
            begin
              reg225 <= (wire2 | (($signed(((8'h9c) && wire1)) ?
                  (~|(wire0 ?
                      wire5 : reg223)) : (|$signed(wire4))) + ($unsigned($signed(wire2)) ?
                  $signed(wire215) : $unsigned($unsigned(reg222)))));
              reg226 <= reg224[(1'h0):(1'h0)];
              reg227 <= reg224[(3'h4):(3'h4)];
              reg228 <= ((^wire212) | ((!((reg222 ? (8'hb9) : reg226) ?
                      (reg224 ? wire3 : reg148) : (~^(8'h9f)))) ?
                  reg148 : $unsigned(wire1)));
            end
          else
            begin
              reg225 <= (~&reg223);
              reg226 <= ($signed((~($unsigned(wire144) <= wire2))) ?
                  reg228[(2'h2):(2'h2)] : ({(+wire146),
                          $signed(((8'hbb) != (8'hb0)))} ?
                      (wire2 ?
                          {wire221[(4'ha):(4'h8)]} : (~(^~wire2))) : $unsigned((wire219[(2'h3):(2'h3)] ?
                          $unsigned(reg227) : $signed(reg222)))));
              reg227 <= reg226[(3'h4):(2'h2)];
            end
          reg229 <= {$unsigned($signed(wire212)),
              ($signed(($unsigned(wire3) ?
                      $signed(wire221) : ((8'haa) < reg228))) ?
                  wire144[(3'h7):(2'h3)] : wire144[(4'hd):(3'h5)])};
        end
      reg230 <= ((!(-wire215[(3'h4):(1'h1)])) ^ {{(~&(^reg224))}});
    end
  assign wire231 = $unsigned($unsigned(reg230));
  assign wire232 = (((~wire221[(3'h4):(1'h1)]) ?
                           wire212[(3'h6):(2'h2)] : reg225) ?
                       (^~$signed({$signed(wire144),
                           reg228[(2'h2):(1'h0)]})) : wire212[(4'h8):(3'h7)]);
  assign wire233 = wire144[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      reg234 <= (($signed(({(8'hb8)} ?
          $unsigned(reg228) : (wire0 ?
              wire146 : wire2))) ~^ (8'hb7)) != (reg217[(4'ha):(2'h3)] && reg222));
      reg235 <= (|($unsigned({(~^(8'haa)), (&reg234)}) | (^{(^~(8'hbb))})));
    end
  assign wire236 = (!reg227[(1'h0):(1'h0)]);
  assign wire237 = ((~(({wire4, reg218} ? {wire147} : wire216) ?
                       (^(reg228 ?
                           wire236 : (8'ha0))) : reg222[(2'h2):(2'h2)])) >> ($unsigned(((~|wire233) <= reg228)) ?
                       $signed(reg226) : (wire236 * ((reg223 ^ wire233) ?
                           reg229 : (!reg226)))));
  assign wire238 = reg229;
endmodule

module module149
#(parameter param211 = (((|((^~(7'h44)) & (~^(8'ha4)))) | {(((8'hb3) >= (8'ha3)) ? ((8'hae) + (7'h43)) : (+(8'had))), {((8'haf) <= (8'hba)), ((8'hb8) ? (8'hbb) : (8'h9f))}}) ? {({{(8'ha8)}} >> (&{(8'hb7), (8'hab)})), (^~(^(8'hb1)))} : (|((((7'h44) > (8'hb3)) ? ((8'ha4) ? (8'hb8) : (7'h42)) : {(8'ha0)}) < ({(8'h9c)} >= ((8'hb1) ? (8'hb5) : (8'hb9)))))))
(y, clk, wire150, wire151, wire152, wire153);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire150;
  input wire signed [(3'h4):(1'h0)] wire151;
  input wire signed [(4'h8):(1'h0)] wire152;
  input wire signed [(4'he):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire210;
  wire [(4'hb):(1'h0)] wire209;
  wire [(4'ha):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire176;
  wire signed [(5'h11):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire206;
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg180 = (1'h0);
  reg [(4'h9):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg [(3'h5):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(5'h12):(1'h0)] reg161 = (1'h0);
  reg [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg155 = (1'h0);
  assign y = {wire210,
                 wire209,
                 wire208,
                 wire154,
                 wire176,
                 wire177,
                 wire178,
                 wire206,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
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
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 (1'h0)};
  assign wire154 = $signed((wire150 ? wire152 : wire153[(4'hc):(2'h3)]));
  always
    @(posedge clk) begin
      reg155 <= $signed(wire153);
      if ($signed(((((reg155 ? wire151 : (7'h44)) ?
              (-wire150) : wire150) - (~|(&wire154))) ?
          wire154 : wire152)))
        begin
          reg156 <= $unsigned((+wire153));
          reg157 <= (reg156 ?
              wire151[(3'h4):(2'h3)] : (($signed((wire154 <<< reg155)) >= $unsigned($signed(reg155))) ^ $unsigned($signed((wire153 << wire150)))));
        end
      else
        begin
          reg156 <= (~&reg157);
          reg157 <= $unsigned(reg157);
        end
      reg158 <= wire150;
      if (reg157[(3'h5):(3'h5)])
        begin
          reg159 <= $unsigned(($signed(wire154[(2'h2):(2'h2)]) != reg158));
          if ($unsigned(($signed((-wire152[(3'h7):(3'h6)])) * {wire154,
              wire153[(4'he):(4'he)]})))
            begin
              reg160 <= (+(+($unsigned($unsigned(reg159)) ?
                  $signed((wire152 ?
                      wire151 : (8'h9c))) : ((reg159 >>> reg157) >>> wire154[(3'h4):(2'h2)]))));
              reg161 <= wire151;
              reg162 <= (8'h9e);
              reg163 <= reg161[(4'ha):(4'h8)];
            end
          else
            begin
              reg160 <= $signed(($unsigned((+wire151[(1'h1):(1'h1)])) <<< reg161[(5'h10):(4'h9)]));
              reg161 <= ($unsigned((reg163[(2'h3):(2'h2)] ?
                      $signed((wire152 ?
                          (8'hac) : reg162)) : $signed($unsigned(wire153)))) ?
                  $unsigned($unsigned($signed($signed(reg162)))) : ($signed($signed(reg159[(3'h6):(3'h4)])) ?
                      reg155[(3'h4):(2'h2)] : wire152[(1'h1):(1'h1)]));
              reg162 <= ($signed(($signed($signed(reg163)) > ({reg155} && (reg155 ?
                      (8'hb2) : reg156)))) ?
                  $unsigned($unsigned(reg155)) : ((((reg161 ?
                                  wire151 : (8'h9e)) ?
                              $signed(reg163) : {reg156}) ?
                          (((8'ha9) ?
                              reg162 : reg162) && $unsigned(wire154)) : (+{wire150})) ?
                      (-reg163) : wire154));
              reg163 <= {({wire152} ?
                      reg161[(1'h0):(1'h0)] : $unsigned($unsigned($signed(reg160))))};
              reg164 <= {((~reg162) && ($signed((reg161 ?
                      reg160 : reg163)) & ((wire153 < reg159) ?
                      (^wire153) : $unsigned(wire150)))),
                  (^$unsigned(reg157))};
            end
        end
      else
        begin
          reg159 <= (-{$signed($unsigned(reg159)), reg161[(5'h10):(2'h2)]});
          if (reg160)
            begin
              reg160 <= {((~&($unsigned(reg160) ?
                          (^~(8'ha0)) : $unsigned(reg155))) ?
                      $unsigned(({reg163, wire154} ?
                          (reg163 + reg158) : $signed((8'hbe)))) : $unsigned(($signed(reg155) ?
                          (reg164 >= wire153) : $unsigned(reg155))))};
              reg161 <= ($unsigned(({reg156,
                      {wire153, wire153}} ^ $signed(reg164))) ?
                  (($unsigned($signed((8'h9d))) >>> ($signed(wire150) && (wire152 == reg159))) ?
                      reg161 : ($signed(reg163) ?
                          (((8'ha3) ?
                              (7'h42) : wire150) == ((8'hbb) <<< wire152)) : $unsigned(((8'ha9) >> reg155)))) : {($signed((reg164 << wire151)) || ($signed(reg158) ?
                          reg157[(2'h3):(2'h2)] : (wire150 <= reg158))),
                      wire152});
              reg162 <= $signed(wire152[(3'h4):(2'h3)]);
            end
          else
            begin
              reg160 <= {(~|(&($signed(reg162) ?
                      $unsigned((8'h9f)) : (reg159 >> wire153)))),
                  reg164};
              reg161 <= (($unsigned((wire152 ? reg159 : (~^wire154))) ?
                  reg156[(2'h2):(1'h1)] : (~{wire153[(4'hd):(3'h5)],
                      reg161})) == reg164[(5'h11):(3'h4)]);
              reg162 <= ((((!wire150[(1'h0):(1'h0)]) ~^ $unsigned({(8'ha0)})) ?
                  (~$signed((reg160 ?
                      reg159 : reg162))) : (-(~^(+(8'haa))))) > {$unsigned({wire152}),
                  $signed($unsigned((reg158 == reg164)))});
              reg163 <= $unsigned({(-{(~&reg164)})});
            end
          reg164 <= $signed($signed({reg161[(3'h7):(3'h6)],
              (^$unsigned(reg162))}));
          if (reg164[(2'h2):(1'h0)])
            begin
              reg165 <= (^$signed({((~|reg158) ?
                      (~&wire151) : (reg157 <= reg163)),
                  $signed((~&reg158))}));
              reg166 <= reg155;
            end
          else
            begin
              reg165 <= ((8'h9c) ?
                  ($signed($unsigned({reg159})) ?
                      (reg165 + $unsigned({wire151})) : $signed($unsigned(reg159[(1'h0):(1'h0)]))) : {wire152[(1'h0):(1'h0)],
                      (reg155[(3'h5):(3'h5)] ^ ((8'ha1) && $unsigned(reg164)))});
              reg166 <= reg158;
              reg167 <= (reg157[(4'ha):(3'h5)] | wire153);
              reg168 <= reg158;
            end
          reg169 <= (^$unsigned((($signed(reg163) ?
                  (~(8'hb3)) : wire153[(3'h6):(2'h3)]) ?
              $unsigned(reg158) : $signed(((8'had) << reg166)))));
        end
      reg170 <= reg162[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg171 <= $unsigned($unsigned($signed({$unsigned(reg157),
          (reg158 ? (8'ha8) : (7'h43))})));
      reg172 <= (reg168 ~^ ($unsigned({$unsigned(wire153)}) < ((reg165 ?
          {reg163, wire150} : (reg170 != reg166)) >= reg171[(2'h2):(1'h0)])));
      reg173 <= reg165[(1'h0):(1'h0)];
      reg174 <= wire152;
      reg175 <= (!(((~^$unsigned((8'had))) ?
              (^~((8'hb6) > wire153)) : ((+reg169) ?
                  (reg167 ? wire153 : reg159) : (^~reg166))) ?
          reg163[(2'h2):(2'h2)] : (|reg157)));
    end
  assign wire176 = $unsigned($unsigned(reg155[(3'h5):(1'h1)]));
  assign wire177 = wire151;
  assign wire178 = $signed($unsigned($signed({(reg155 <= reg158),
                       reg161[(4'he):(4'hd)]})));
  always
    @(posedge clk) begin
      reg179 <= wire153[(3'h5):(3'h5)];
      reg180 <= $signed($signed(wire154[(1'h1):(1'h1)]));
      if ($unsigned($unsigned(($unsigned(reg172) >>> ({(8'hb5),
          reg166} >>> (-(8'hb1)))))))
        begin
          reg181 <= (|reg163);
          if ((-(wire177 || $unsigned(reg174))))
            begin
              reg182 <= (^reg181[(4'h9):(1'h1)]);
              reg183 <= (8'ha9);
              reg184 <= (reg175[(1'h0):(1'h0)] > $signed(reg180));
              reg185 <= reg167;
            end
          else
            begin
              reg182 <= reg179;
              reg183 <= wire177[(4'he):(4'hc)];
            end
        end
      else
        begin
          reg181 <= $signed(((($signed(reg173) <= reg184) ~^ {wire176,
              (~|reg172)}) > ({$signed(reg163),
              wire154} >>> {$unsigned(reg156)})));
          reg182 <= $signed((wire178[(4'hd):(4'hd)] ?
              $signed(((reg184 ? reg156 : reg158) ?
                  (reg171 ?
                      reg173 : (8'ha5)) : $signed(reg163))) : $unsigned($unsigned($unsigned(reg182)))));
          reg183 <= reg179;
        end
    end
  module186 #() modinst207 (.wire191(reg184), .wire190(reg157), .wire187(reg171), .wire188(wire177), .y(wire206), .wire189(reg159), .clk(clk));
  assign wire208 = (8'hbd);
  assign wire209 = (~&(reg160 ?
                       (~^((~(7'h44)) ?
                           $signed(reg163) : wire208[(4'h9):(2'h3)])) : $signed($signed((&(8'ha5))))));
  assign wire210 = (8'hb5);
endmodule

module module6
#(parameter param143 = (((~|(^((8'hab) ? (8'hbe) : (8'ha8)))) ? (|(((7'h42) ? (8'hb6) : (7'h43)) ? ((8'had) ? (8'hb1) : (8'hbd)) : (&(8'hae)))) : (+(~&((8'hb6) <= (7'h44))))) + ({(+{(8'ha3)}), ((^~(8'hba)) ? ((8'hb4) + (8'haa)) : {(8'hbb)})} ? ((&(|(8'hb6))) ? {((8'hae) && (8'ha3))} : {(-(8'hb8))}) : (8'ha7))))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire139;
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire12,
                 wire62,
                 wire64,
                 wire65,
                 wire66,
                 wire69,
                 wire70,
                 wire71,
                 wire75,
                 wire76,
                 wire77,
                 wire139,
                 reg74,
                 reg73,
                 reg72,
                 reg68,
                 reg67,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = wire11;
  always
    @(posedge clk) begin
      reg13 <= ((wire8 - {$signed({wire7, wire8}),
          ($unsigned(wire8) ?
              {wire12} : $signed((8'hb7)))}) ~^ $signed({{(wire12 || wire10)},
          $unsigned($unsigned(wire8))}));
      reg14 <= ({(~^{wire9[(5'h10):(4'hb)], wire10}),
          (~&(~wire10))} << (($signed(wire8) ?
          $unsigned(wire7) : {wire10, (wire9 ~^ reg13)}) >>> ((-(wire7 ?
              wire7 : (8'hbb))) ?
          ($signed(wire7) ?
              (wire8 ? (8'hba) : wire7) : $signed(wire7)) : (^~{wire7,
              wire12}))));
      if (reg13)
        begin
          reg15 <= reg13[(2'h3):(2'h3)];
        end
      else
        begin
          if ((~^$signed((wire9[(1'h1):(1'h0)] ?
              wire11 : (^~$unsigned(reg15))))))
            begin
              reg15 <= $unsigned(reg14[(5'h11):(3'h5)]);
              reg16 <= $signed((($signed(reg13) ?
                  reg14 : (wire8 || ((8'hbc) ? reg14 : wire10))) ^~ wire10));
              reg17 <= {((~(&wire9[(1'h1):(1'h0)])) ?
                      $unsigned((8'ha4)) : ($signed((wire9 ?
                          wire8 : wire10)) != {(reg14 < reg14)}))};
              reg18 <= ((&wire10[(4'hd):(2'h2)]) ?
                  (~|wire10[(4'ha):(1'h0)]) : (8'hab));
            end
          else
            begin
              reg15 <= ($signed((|$signed((wire8 > reg14)))) ^~ (+$unsigned(((reg13 ?
                  (8'hb7) : wire12) >= (wire9 ? (7'h44) : (8'ha1))))));
              reg16 <= (&$signed($unsigned((wire7 <<< wire7[(3'h6):(1'h1)]))));
              reg17 <= ((~&wire11) ?
                  (((~(+(8'hb8))) ? (~reg17[(4'hf):(1'h1)]) : (+wire7)) ?
                      $unsigned(($signed(wire11) ?
                          $signed(reg13) : (^(8'haf)))) : $unsigned(wire9[(4'hc):(4'h9)])) : (+(reg18[(5'h11):(4'ha)] ?
                      $signed($unsigned(wire10)) : ((wire12 ? wire11 : reg16) ?
                          wire7 : $unsigned(wire12)))));
              reg18 <= (7'h42);
              reg19 <= (&({(&$unsigned(wire10)), (~^(!(8'had)))} ?
                  ((!wire7[(3'h7):(3'h5)]) >>> {{wire12, wire8}}) : (7'h42)));
            end
          reg20 <= $signed($signed($unsigned(((~^reg19) < $signed((7'h42))))));
          reg21 <= ((|(^reg19[(3'h5):(3'h4)])) ?
              reg14 : (wire10[(1'h1):(1'h1)] ?
                  reg17[(3'h6):(1'h1)] : ((8'hb2) ?
                      $signed($unsigned(reg18)) : ((reg19 ?
                          (8'had) : wire10) || wire9))));
          reg22 <= reg17[(4'ha):(3'h5)];
          reg23 <= (^$signed(($unsigned($signed((8'ha9))) >>> reg17[(3'h5):(3'h4)])));
        end
      if ((~&((((~&reg19) ?
          {(8'hbe),
              reg21} : (wire11 << reg17)) || {reg21[(3'h6):(3'h6)]}) & $unsigned((^wire10[(3'h6):(1'h0)])))))
        begin
          reg24 <= reg22[(4'he):(4'hd)];
        end
      else
        begin
          reg24 <= $unsigned(($signed((reg14[(4'hf):(4'h9)] < ((8'had) ?
              reg24 : reg23))) || wire11[(4'ha):(3'h7)]));
          reg25 <= $unsigned(reg17[(5'h10):(4'hb)]);
          reg26 <= (($signed(reg21) ? wire7 : (8'ha4)) ?
              (reg24[(3'h6):(2'h3)] ?
                  ((|$signed(wire11)) ?
                      $signed($unsigned(wire10)) : (7'h43)) : (~&reg14)) : (~^$unsigned($signed(reg25))));
          reg27 <= reg26[(3'h6):(3'h4)];
          if ((+(($unsigned(wire8) >= {$unsigned((8'hb6))}) < reg13)))
            begin
              reg28 <= (-$signed(reg16[(5'h13):(4'hd)]));
              reg29 <= reg24;
            end
          else
            begin
              reg28 <= reg24;
              reg29 <= $signed(($unsigned(({wire12,
                  reg16} != reg27[(3'h7):(1'h1)])) ^~ ((~^(reg19 ?
                      reg23 : wire8)) ?
                  $unsigned(wire8[(4'h9):(2'h3)]) : (reg15[(4'hd):(4'h8)] - (8'hbc)))));
              reg30 <= (+reg15);
            end
        end
    end
  module31 #() modinst63 (.clk(clk), .wire35(reg19), .wire32(reg23), .y(wire62), .wire34(reg24), .wire33(reg27));
  assign wire64 = $signed(((^{$signed(reg23), (wire8 && wire9)}) ?
                      (7'h42) : (((^wire7) ?
                              (reg13 ? wire62 : (8'ha0)) : {reg29}) ?
                          (reg23[(1'h1):(1'h0)] ?
                              {reg26,
                                  (8'h9f)} : (reg14 << reg25)) : (reg19[(3'h4):(2'h2)] | reg20))));
  assign wire65 = (reg13 ?
                      reg22[(4'h8):(3'h7)] : ($signed($signed((reg16 | (8'haa)))) ?
                          $unsigned((^reg28[(4'h8):(4'h8)])) : (((~&reg23) ?
                              (-reg25) : wire7) > (reg23 ?
                              (wire62 ? (8'hae) : reg16) : (reg27 & reg14)))));
  assign wire66 = $signed(reg15[(5'h14):(4'ha)]);
  always
    @(posedge clk) begin
      reg67 <= wire62;
      reg68 <= $signed((^~$unsigned(reg30)));
    end
  assign wire69 = ({((wire8 ?
                              $unsigned((8'had)) : ((8'hbc) ?
                                  reg18 : reg20)) ^ ((reg68 >= reg27) ?
                              wire12[(2'h2):(1'h0)] : (reg21 ? reg15 : reg30))),
                          $unsigned((wire64 ?
                              ((8'hbc) & wire66) : (wire65 ?
                                  (8'hb6) : reg22)))} ?
                      wire9 : wire65);
  assign wire70 = {((|$unsigned($unsigned(reg16))) ?
                          $unsigned($signed(reg21)) : $unsigned($unsigned((reg30 ?
                              reg16 : reg26)))),
                      wire7[(3'h4):(2'h3)]};
  assign wire71 = ((8'ha1) ?
                      {$unsigned((reg15[(1'h1):(1'h1)] + (wire8 ?
                              (8'haf) : reg16))),
                          (+($unsigned(reg14) >= (wire66 ?
                              wire11 : wire66)))} : reg68[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg72 <= (~^reg17);
      reg73 <= (wire8 ^~ reg72);
      reg74 <= $unsigned($signed(reg26));
    end
  assign wire75 = (-({{$signed(reg18)}, $unsigned((wire66 >= reg24))} ?
                      wire62 : (^wire10)));
  assign wire76 = ((wire11[(3'h7):(2'h2)] ?
                      reg21 : $signed(wire71[(3'h6):(3'h6)])) < wire7[(1'h1):(1'h1)]);
  assign wire77 = $signed($signed((wire75[(4'h8):(2'h3)] ?
                      (reg26[(1'h0):(1'h0)] ^~ (-wire66)) : reg23)));
  module78 #() modinst140 (wire139, clk, wire9, wire12, reg28, reg16, wire75);
  assign wire141 = {$unsigned(reg16)};
  assign wire142 = (((($unsigned(reg20) ?
                               $unsigned(reg15) : $unsigned(reg23)) == reg68) ?
                           reg30[(2'h2):(1'h1)] : reg18[(4'hd):(3'h5)]) ?
                       reg27 : (($unsigned(reg73[(5'h10):(1'h0)]) < ($unsigned(reg30) ?
                               reg67 : (wire11 ? reg29 : wire8))) ?
                           $unsigned($unsigned(reg24[(2'h2):(1'h0)])) : (8'had)));
endmodule

module module78
#(parameter param137 = (((&(((8'hbb) ? (8'hb3) : (8'ha0)) * ((8'hb3) ? (8'h9c) : (8'hb3)))) - (8'hbe)) && (8'h9f)), 
parameter param138 = (^(-(param137 ? ((|(8'ha5)) >> (param137 != param137)) : ((!param137) >>> (param137 ? param137 : param137))))))
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h240):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire83;
  input wire [(4'he):(1'h0)] wire82;
  input wire signed [(5'h15):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(4'hc):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  assign y = {wire136,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
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
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire84 = ((({$unsigned(wire79)} >>> wire83) ?
                          $signed({{wire79, wire81},
                              wire83[(3'h4):(1'h0)]}) : $signed(wire82[(4'ha):(4'h9)])) ?
                      wire79 : (wire81 >= ((~^wire81[(1'h1):(1'h1)]) | $unsigned($unsigned(wire82)))));
  assign wire85 = {wire84[(1'h1):(1'h1)],
                      (^({wire84[(2'h2):(2'h2)]} ?
                          wire84 : (wire83[(2'h2):(2'h2)] ?
                              {wire79} : (wire81 <<< wire80))))};
  assign wire86 = $unsigned($signed(((^~(wire81 & wire82)) != ($signed(wire84) << (wire84 < wire80)))));
  assign wire87 = (~&(((8'ha7) >>> wire85[(4'hc):(1'h0)]) ?
                      wire86[(4'h9):(4'h9)] : $signed($unsigned({wire80,
                          (7'h43)}))));
  assign wire88 = {wire81};
  always
    @(posedge clk) begin
      if (wire80[(3'h7):(1'h0)])
        begin
          reg89 <= ({$signed($signed(wire82)), wire82[(3'h4):(2'h2)]} ?
              (($signed(wire81) ? wire85[(4'h8):(2'h2)] : (8'haa)) ?
                  ($signed(wire82) ^~ $signed((wire81 | wire79))) : (^{wire88})) : wire87[(2'h2):(1'h0)]);
          reg90 <= (8'ha3);
          if ((-wire81[(3'h5):(1'h0)]))
            begin
              reg91 <= {$unsigned(($unsigned($unsigned(wire83)) * ($unsigned(wire85) < (wire81 ?
                      wire86 : wire85)))),
                  wire80};
            end
          else
            begin
              reg91 <= $signed((-($unsigned((reg89 <= wire84)) ?
                  $signed({reg91, (8'ha3)}) : reg89)));
              reg92 <= (7'h41);
              reg93 <= wire85[(2'h2):(1'h0)];
            end
          if ({wire83, reg89})
            begin
              reg94 <= {((~(!wire81[(3'h6):(1'h0)])) || $signed(wire79)),
                  ((^(^$signed((8'ha2)))) ?
                      (8'ha6) : (~^((&reg90) >= ((7'h40) | reg90))))};
            end
          else
            begin
              reg94 <= ((wire87 ?
                      wire79[(2'h3):(2'h3)] : $signed($signed($unsigned(wire82)))) ?
                  {(+$signed((wire86 ?
                          wire85 : wire79)))} : $unsigned($unsigned(((wire83 + wire84) ?
                      $signed(wire83) : {reg93, wire87}))));
              reg95 <= wire83[(2'h2):(1'h1)];
              reg96 <= $unsigned({($unsigned(wire86[(3'h4):(1'h0)]) ?
                      $unsigned(reg93[(5'h12):(4'he)]) : (+$unsigned(reg89)))});
              reg97 <= reg93[(4'h9):(4'h9)];
            end
        end
      else
        begin
          reg89 <= wire85;
        end
      reg98 <= {((wire81 >> (reg92[(2'h2):(1'h1)] + {wire79, reg93})) ?
              (8'hb6) : $unsigned($unsigned((8'hb0)))),
          (((-((8'hba) > reg97)) ?
                  ({wire79,
                      wire88} << ((8'haf) <= wire80)) : reg92[(1'h1):(1'h0)]) ?
              (({wire79, wire81} ?
                      $unsigned(wire87) : ((7'h41) ? (7'h43) : (8'hb9))) ?
                  $unsigned($unsigned(wire79)) : reg96) : $signed(($unsigned(reg96) >>> (!wire79))))};
      reg99 <= reg91;
      reg100 <= (8'ha3);
      reg101 <= $signed(wire86);
    end
  always
    @(posedge clk) begin
      reg102 <= reg99;
      if (wire80)
        begin
          if ((((($signed((8'hbb)) ? (-reg98) : wire83) ?
              $unsigned(wire88) : {(~&(8'ha4)),
                  reg89}) ^~ $signed($unsigned((reg91 ?
              reg97 : (8'hb6))))) ~^ $signed({$unsigned(wire79),
              $signed($signed(reg94))})))
            begin
              reg103 <= ({wire81} ? reg97 : (|reg99));
              reg104 <= reg97;
              reg105 <= ((!reg95) ?
                  (^reg94[(2'h2):(1'h1)]) : ($unsigned(wire84) || (reg97[(1'h0):(1'h0)] >> reg101[(4'hd):(1'h1)])));
              reg106 <= (reg97[(2'h2):(2'h2)] ^~ (~|reg103));
            end
          else
            begin
              reg103 <= $signed($signed($signed(reg93)));
            end
          reg107 <= ((((reg103[(3'h7):(3'h6)] ? {reg92} : (^wire86)) ?
                  reg105 : reg106[(4'he):(3'h5)]) ^~ (+((^wire87) | (wire81 | (8'hae))))) ?
              (wire82 ?
                  (wire79 - $unsigned($unsigned(wire87))) : ($signed({(8'h9e)}) ?
                      wire82[(2'h2):(1'h0)] : (reg97 >= reg100))) : $unsigned({$unsigned($signed(wire87))}));
          reg108 <= $unsigned((~^(|{(~reg105)})));
        end
      else
        begin
          reg103 <= reg103;
        end
      if (($signed(($unsigned((reg92 != reg105)) ?
          ((wire87 * (8'hbe)) == (wire81 > wire83)) : ((reg96 ?
              reg90 : wire80) < reg103[(3'h5):(1'h1)]))) & (+$signed($unsigned(wire85[(3'h4):(1'h0)])))))
        begin
          if (reg89)
            begin
              reg109 <= (~|(8'haa));
            end
          else
            begin
              reg109 <= ((^($unsigned(reg103[(4'hd):(2'h2)]) || $signed(reg103))) ?
                  wire81 : (reg94[(3'h4):(1'h1)] ?
                      reg108[(4'he):(4'hc)] : reg105));
              reg110 <= wire87[(1'h0):(1'h0)];
            end
          reg111 <= reg98[(1'h0):(1'h0)];
        end
      else
        begin
          if ({reg91, $unsigned($signed(reg93[(4'ha):(3'h5)]))})
            begin
              reg109 <= (|{{(~$unsigned(reg93))}});
              reg110 <= ({$unsigned(((reg105 <= reg106) || $unsigned(reg95)))} ?
                  $signed($signed(reg107[(4'hd):(2'h3)])) : (reg97[(4'h8):(2'h3)] ?
                      (~|(reg90[(3'h7):(2'h2)] ?
                          $unsigned(reg89) : $signed(reg95))) : ($unsigned(reg99) <= reg106[(5'h11):(4'hf)])));
              reg111 <= wire80;
            end
          else
            begin
              reg109 <= {wire80[(2'h3):(2'h2)]};
              reg110 <= ($signed((^reg103)) ? wire88 : (|reg99[(3'h5):(1'h0)]));
            end
          reg112 <= $signed($unsigned($signed(($signed(wire84) ?
              $signed(reg89) : wire88[(2'h3):(2'h2)]))));
          reg113 <= $signed($signed((!reg93[(4'h9):(2'h3)])));
        end
      reg114 <= reg106;
      if ($signed((~^{$signed(reg100[(1'h0):(1'h0)]), (~&$signed((8'h9f)))})))
        begin
          reg115 <= (~(~&reg92[(3'h4):(2'h3)]));
        end
      else
        begin
          reg115 <= {{wire83}};
          if (wire88)
            begin
              reg116 <= (8'ha1);
            end
          else
            begin
              reg116 <= (reg95[(3'h4):(2'h2)] <= $signed($unsigned(($signed(reg108) | $signed((8'ha4))))));
            end
        end
    end
  assign wire117 = $unsigned((wire85[(3'h7):(3'h5)] ?
                       ((&{reg115,
                           reg105}) != (^$signed((8'ha4)))) : {(((7'h43) ?
                               wire81 : wire85) <<< wire81),
                           wire83[(1'h1):(1'h0)]}));
  assign wire118 = reg95;
  assign wire119 = (8'hba);
  assign wire120 = {(7'h44), wire88[(2'h2):(1'h0)]};
  assign wire121 = (~|$unsigned((|(wire120[(1'h0):(1'h0)] >= $signed(reg98)))));
  assign wire122 = ($unsigned($signed(reg108[(4'h9):(3'h5)])) ?
                       (((~|$unsigned(wire88)) ?
                           ((reg92 < wire80) || (^reg111)) : $signed($signed(reg112))) * reg108[(3'h6):(1'h1)]) : $unsigned({$signed((&reg106)),
                           reg102[(3'h6):(3'h6)]}));
  always
    @(posedge clk) begin
      if ({$signed((&(reg110[(3'h4):(2'h3)] ?
              (reg97 != (8'ha2)) : $signed(wire118)))),
          $signed((&reg98[(2'h2):(1'h0)]))})
        begin
          reg123 <= wire121[(4'h9):(2'h2)];
          reg124 <= (((8'hbc) ^~ $unsigned(($unsigned(wire85) <= reg114))) ?
              $unsigned(reg95[(4'he):(3'h6)]) : $unsigned((&reg112)));
          reg125 <= (!$unsigned(((!$signed(reg89)) << (&(|reg93)))));
          reg126 <= (((reg114 ?
                  $signed(((8'hb4) >> reg91)) : ((reg125 ~^ wire84) ?
                      (reg100 ? reg98 : reg94) : (reg108 ? wire84 : reg92))) ?
              $signed(reg104[(2'h2):(1'h0)]) : reg109[(3'h5):(1'h1)]) == (reg112 - (~^$signed((~|reg123)))));
          reg127 <= (^~reg106);
        end
      else
        begin
          if ((((($signed(reg108) ~^ reg115) ?
                  (~|(8'ha0)) : $signed((reg108 ?
                      reg97 : reg97))) && ($signed(((8'hb3) ~^ reg127)) > (!$signed(reg125)))) ?
              {$signed(($unsigned(reg112) ?
                      $unsigned(reg96) : reg101[(4'hc):(3'h5)])),
                  reg95[(5'h11):(3'h7)]} : ((($unsigned(reg97) | {(8'hb0),
                          reg114}) ?
                      wire80[(1'h1):(1'h0)] : ($signed(reg99) ?
                          {reg93, (8'hb6)} : $unsigned(reg105))) ?
                  wire118[(3'h5):(2'h2)] : $signed(wire87[(1'h1):(1'h1)]))))
            begin
              reg123 <= ((&$unsigned((~^((7'h41) ?
                  reg101 : (8'hbe))))) >>> reg102);
              reg124 <= $unsigned(reg110[(3'h5):(3'h4)]);
              reg125 <= reg112[(4'hf):(4'h9)];
              reg126 <= (reg89 ?
                  ((($unsigned(reg112) > $signed(reg109)) || (!((7'h41) ?
                          reg106 : reg115))) ?
                      (($unsigned(wire82) < (~wire118)) ?
                          $signed($signed(reg94)) : $signed($signed(reg100))) : reg91) : ($signed($signed((+reg108))) && {((wire79 ?
                              reg109 : wire82) ?
                          (reg114 ? wire81 : wire119) : $signed(wire80)),
                      ((wire119 <= reg125) ?
                          (reg105 | reg89) : {wire84, reg124})}));
              reg127 <= $unsigned((!{(~^reg100[(2'h2):(1'h1)]),
                  $unsigned((reg113 ? reg98 : reg104))}));
            end
          else
            begin
              reg123 <= $unsigned((|reg123));
              reg124 <= reg125[(4'h9):(3'h5)];
              reg125 <= reg126[(3'h5):(1'h0)];
              reg126 <= (($unsigned((~^(reg93 ~^ reg95))) ?
                      wire83[(1'h1):(1'h1)] : reg97) ?
                  reg115[(4'h9):(4'h9)] : ((^~$unsigned($signed((8'hb1)))) ?
                      (~^((&wire117) ? {reg102} : (!wire85))) : {reg125,
                          $signed(reg92[(1'h0):(1'h0)])}));
            end
          if (reg105[(3'h6):(2'h3)])
            begin
              reg128 <= (&$unsigned($signed($signed((wire82 ?
                  wire80 : reg90)))));
            end
          else
            begin
              reg128 <= (reg127[(4'ha):(1'h1)] ^ ($unsigned({wire118}) != (reg101 ?
                  wire118 : ($unsigned((8'ha8)) || $unsigned(reg101)))));
              reg129 <= ((wire118 ?
                  wire119 : wire80[(3'h6):(2'h2)]) * (^~(wire118[(4'ha):(3'h5)] ?
                  $signed((reg108 >= reg91)) : $unsigned((wire120 + wire117)))));
              reg130 <= reg95;
            end
          reg131 <= $unsigned((~|$signed($unsigned($unsigned((8'ha6))))));
        end
      reg132 <= (({wire119[(5'h10):(4'h9)]} ~^ (reg94 ?
          ((8'ha8) >= (^(8'hb1))) : ((~&reg101) || (!wire122)))) - $signed($signed($signed($unsigned((8'ha1))))));
      reg133 <= $signed((~|($unsigned((wire82 ? reg89 : reg106)) != reg103)));
      reg134 <= {(reg125 > wire88[(3'h4):(3'h4)])};
      reg135 <= wire122;
    end
  assign wire136 = reg103;
endmodule

module module31
#(parameter param60 = (^~({(((7'h42) ? (8'hb6) : (8'hac)) ? ((8'hae) ~^ (8'h9d)) : ((8'hb6) >>> (8'ha3)))} - ((&((8'hbe) ? (8'ha4) : (8'hb1))) ^ ((^~(8'hb1)) <= ((7'h40) ? (8'hb8) : (8'hb5)))))), 
parameter param61 = ((+((~^param60) ? ((8'hb4) || ((8'hb8) ? param60 : (7'h44))) : param60)) ? (~((param60 ? (+param60) : (param60 ? param60 : param60)) ? ((param60 > param60) ? param60 : {param60, (8'hba)}) : (!(param60 != param60)))) : {param60}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
  assign wire36 = $signed(wire35[(3'h4):(1'h0)]);
  assign wire37 = (wire36 ?
                      ((8'ha5) ?
                          wire36 : ($signed($unsigned((8'hb1))) ?
                              $unsigned(wire32) : ($signed(wire35) ?
                                  $signed(wire34) : wire32[(4'h8):(3'h5)]))) : {(wire32 ~^ wire36)});
  assign wire38 = $unsigned((((!wire35) ?
                          $unsigned((wire37 | wire37)) : $unsigned(wire32[(3'h7):(2'h2)])) ?
                      (-((8'hb7) ?
                          $unsigned((8'hab)) : ((8'hbc) || wire37))) : $signed($signed(wire35[(3'h6):(1'h0)]))));
  assign wire39 = wire35[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg40 <= (&($signed((!$signed(wire39))) ?
          wire33[(4'h9):(3'h4)] : wire34[(2'h2):(1'h1)]));
      reg41 <= (wire32[(4'hb):(1'h1)] ?
          $signed((((wire32 ~^ wire33) ? wire36 : (wire33 <= wire36)) ?
              $signed((wire36 ?
                  wire32 : wire38)) : {wire32})) : $signed(($signed($signed(wire36)) != {(+wire35)})));
      if ({$unsigned((+((reg41 >>> wire32) ~^ (reg40 ? wire33 : (8'hac))))),
          $unsigned($unsigned(reg40[(3'h4):(1'h1)]))})
        begin
          reg42 <= (^~$signed((|$signed($unsigned(reg40)))));
        end
      else
        begin
          reg42 <= (wire35 ? $signed((&wire37)) : wire32[(3'h6):(3'h5)]);
          if ({reg42, wire35[(3'h5):(2'h2)]})
            begin
              reg43 <= ((8'hbb) * $signed(wire35[(3'h4):(3'h4)]));
            end
          else
            begin
              reg43 <= $signed($unsigned((reg40[(3'h6):(3'h5)] | (((8'h9f) + wire33) ?
                  reg40 : $signed(reg43)))));
              reg44 <= (wire38[(3'h7):(3'h7)] >>> $signed((((wire39 << reg41) ?
                      (reg42 ? wire34 : wire35) : $unsigned(wire32)) ?
                  $unsigned((reg41 ? wire38 : wire39)) : reg40)));
              reg45 <= reg41;
              reg46 <= $signed((reg45[(5'h14):(2'h2)] & $signed($unsigned({wire39}))));
            end
          reg47 <= (8'hb5);
        end
      if (reg42)
        begin
          if (reg47[(4'ha):(4'h8)])
            begin
              reg48 <= (&$signed((^$unsigned((wire34 < wire35)))));
            end
          else
            begin
              reg48 <= reg41;
              reg49 <= $signed($signed((reg48 >= {(reg46 ? reg42 : wire37)})));
              reg50 <= {reg47[(3'h7):(3'h5)]};
              reg51 <= $signed(reg41);
            end
          if ($unsigned((-(wire35 || wire33))))
            begin
              reg52 <= (~(~|{$unsigned((^~(7'h44))), {reg48}}));
              reg53 <= $unsigned((((~reg48) ?
                  (~|{reg51}) : $unsigned({reg41, reg50})) || (^~reg42)));
            end
          else
            begin
              reg52 <= $unsigned($unsigned($signed(reg50[(1'h1):(1'h1)])));
              reg53 <= {wire33[(2'h3):(1'h1)]};
              reg54 <= {{(((reg50 ? wire34 : (8'hba)) != $signed(reg49)) ?
                          reg48[(4'hd):(3'h6)] : ((-(8'ha8)) ?
                              $unsigned(reg44) : (8'hab))),
                      $unsigned($signed($unsigned((8'ha8))))}};
              reg55 <= $signed(wire32);
              reg56 <= reg43;
            end
        end
      else
        begin
          reg48 <= (wire33[(2'h2):(2'h2)] ^ (~&$unsigned((|(wire32 ?
              reg40 : reg54)))));
        end
    end
  assign wire57 = $signed({(~$unsigned(wire37)),
                      $signed(({reg45, wire36} >> (+wire36)))});
  assign wire58 = $unsigned(reg42);
  assign wire59 = $signed(reg56[(2'h3):(1'h0)]);
endmodule

module module186
#(parameter param204 = ((((((8'hac) ? (8'haf) : (8'hbc)) == ((8'hb4) + (8'hb4))) ? {(~(8'ha3)), (~&(8'ha0))} : (((8'hb2) > (8'h9c)) ? (~^(8'haf)) : ((8'hbb) ^~ (8'hbf)))) != (((~(8'hac)) ? {(8'hb9), (8'ha5)} : (~&(8'hb8))) ? ({(8'hac)} ? ((8'hbb) ? (8'ha2) : (8'hac)) : (8'hb1)) : {((8'h9e) ? (8'ha6) : (8'haa))})) * {(+(!(^(8'hb9))))}), 
parameter param205 = param204)
(y, clk, wire191, wire190, wire189, wire188, wire187);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire191;
  input wire [(5'h11):(1'h0)] wire190;
  input wire signed [(4'h9):(1'h0)] wire189;
  input wire [(4'hc):(1'h0)] wire188;
  input wire signed [(5'h10):(1'h0)] wire187;
  wire signed [(4'he):(1'h0)] wire203;
  wire [(4'hf):(1'h0)] wire202;
  wire [(5'h15):(1'h0)] wire201;
  wire signed [(4'h8):(1'h0)] wire200;
  wire [(3'h4):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire198;
  wire [(4'hc):(1'h0)] wire197;
  wire signed [(4'he):(1'h0)] wire196;
  wire [(3'h7):(1'h0)] wire193;
  wire [(3'h4):(1'h0)] wire192;
  reg [(2'h3):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg194 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire193,
                 wire192,
                 reg195,
                 reg194,
                 (1'h0)};
  assign wire192 = $signed(wire189);
  assign wire193 = $signed({wire192[(3'h4):(2'h3)]});
  always
    @(posedge clk) begin
      reg194 <= (($unsigned($unsigned($unsigned(wire192))) ^~ ((+$unsigned(wire189)) << {(wire189 ?
              wire193 : wire190),
          $unsigned(wire193)})) || $unsigned($signed($unsigned(wire189))));
      reg195 <= (($unsigned((((8'hba) ? wire191 : (8'ha4)) != wire193)) ?
          $unsigned($signed(wire193[(3'h4):(2'h3)])) : $unsigned($unsigned((wire189 < wire188)))) >= wire188);
    end
  assign wire196 = (wire191[(3'h7):(1'h0)] >= reg194[(3'h7):(3'h7)]);
  assign wire197 = wire188[(4'hc):(3'h7)];
  assign wire198 = (^(7'h40));
  assign wire199 = $unsigned(wire188[(3'h5):(3'h4)]);
  assign wire200 = (((($signed(wire188) < $unsigned(wire192)) ?
                           wire199 : $unsigned({wire187})) ?
                       $unsigned(wire198) : (($signed(wire197) & (7'h41)) ?
                           ((reg195 ? reg194 : reg194) ?
                               reg195 : $unsigned(reg194)) : wire191[(3'h4):(2'h3)])) == (^~wire190[(4'h9):(4'h8)]));
  assign wire201 = (^$signed((+(wire190[(4'hf):(4'ha)] >>> (wire200 ?
                       wire187 : wire193)))));
  assign wire202 = ($signed($signed({$signed(wire196),
                       wire196})) || (~^(+wire200)));
  assign wire203 = $unsigned((~|{wire197}));
endmodule
