module top
#(parameter param270 = ((({{(8'hb2)}} > (~{(7'h41), (8'haa)})) ? ((+(8'hb0)) ? (8'hb9) : {(8'hae), {(8'hac)}}) : {((^(8'ha4)) ~^ ((8'hb1) | (8'haf))), (^~((8'ha0) != (8'hb9)))}) ~^ (((8'hb2) ? (~&((8'had) ? (8'h9f) : (8'hb7))) : (((8'hb2) ? (8'hb8) : (8'hb6)) ? ((8'hb3) >> (8'hb1)) : ((8'hb9) != (7'h43)))) ? ((+(~&(8'h9d))) ? ((~^(8'hbe)) ? (!(8'ha3)) : ((8'hbd) >>> (8'haa))) : ({(8'hb9), (8'hb3)} & (~^(7'h42)))) : {((!(8'ha5)) ? (8'h9e) : ((8'ha3) >> (8'ha8)))})), 
parameter param271 = (((((&param270) ? (param270 ? param270 : (8'ha7)) : {param270, (8'ha2)}) ^~ (|(param270 ? param270 : param270))) ? ((param270 - (param270 <= param270)) | ((param270 ? param270 : param270) > param270)) : (!(((8'hb9) != param270) ? {param270} : param270))) ? (-(param270 ? param270 : ((param270 ? param270 : param270) | (~|param270)))) : ((-((param270 | param270) << ((8'hb6) ? param270 : (8'ha5)))) | ((~&(^~param270)) ? param270 : (param270 ? (param270 ? param270 : param270) : (7'h40))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire234;
  wire signed [(5'h10):(1'h0)] wire233;
  wire signed [(4'h9):(1'h0)] wire229;
  wire [(3'h5):(1'h0)] wire220;
  wire [(2'h3):(1'h0)] wire219;
  wire [(4'h8):(1'h0)] wire217;
  wire signed [(4'he):(1'h0)] wire216;
  wire signed [(5'h14):(1'h0)] wire215;
  wire signed [(5'h13):(1'h0)] wire214;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(5'h15):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire212;
  wire [(5'h11):(1'h0)] wire231;
  reg signed [(4'hb):(1'h0)] reg269 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg268 = (1'h0);
  reg [(5'h10):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg266 = (1'h0);
  reg [(5'h10):(1'h0)] reg265 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg264 = (1'h0);
  reg [(3'h4):(1'h0)] reg263 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg262 = (1'h0);
  reg [(5'h12):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg260 = (1'h0);
  reg [(4'h8):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg258 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg257 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg256 = (1'h0);
  reg [(3'h4):(1'h0)] reg255 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg254 = (1'h0);
  reg [(4'hb):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg252 = (1'h0);
  reg [(5'h15):(1'h0)] reg251 = (1'h0);
  reg [(4'h9):(1'h0)] reg250 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg249 = (1'h0);
  reg [(4'hc):(1'h0)] reg248 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg247 = (1'h0);
  reg [(4'hc):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg245 = (1'h0);
  reg [(4'h8):(1'h0)] reg244 = (1'h0);
  reg [(3'h7):(1'h0)] reg243 = (1'h0);
  reg [(2'h2):(1'h0)] reg242 = (1'h0);
  reg [(4'hf):(1'h0)] reg241 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg240 = (1'h0);
  reg [(5'h15):(1'h0)] reg239 = (1'h0);
  reg [(4'hf):(1'h0)] reg238 = (1'h0);
  reg [(5'h13):(1'h0)] reg237 = (1'h0);
  reg [(2'h2):(1'h0)] reg236 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg235 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg228 = (1'h0);
  reg [(4'hf):(1'h0)] reg227 = (1'h0);
  reg [(4'he):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg224 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg222 = (1'h0);
  reg [(4'hf):(1'h0)] reg221 = (1'h0);
  reg [(4'hc):(1'h0)] reg218 = (1'h0);
  assign y = {wire234,
                 wire233,
                 wire229,
                 wire220,
                 wire219,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire139,
                 wire141,
                 wire212,
                 wire231,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
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
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg218,
                 (1'h0)};
  module5 #() modinst140 (wire139, clk, wire1, wire4, wire0, wire3);
  assign wire141 = {wire139[(2'h2):(1'h1)], wire3[(1'h0):(1'h0)]};
  module142 #() modinst213 (.wire144(wire0), .clk(clk), .wire145(wire3), .wire146(wire2), .wire147(wire139), .y(wire212), .wire143(wire1));
  assign wire214 = (((((8'hb6) ?
                           $signed(wire1) : (wire212 >> wire141)) < wire4[(3'h6):(1'h1)]) == wire2[(1'h1):(1'h1)]) ?
                       (~$unsigned($unsigned($unsigned(wire2)))) : wire2);
  assign wire215 = {($signed(({(8'h9f)} >= (!(8'hb1)))) | $unsigned((~|wire141[(5'h12):(4'hb)]))),
                       $signed(($unsigned({wire4}) ?
                           {wire139} : ((wire214 ?
                               wire0 : wire212) ~^ wire0[(3'h7):(3'h4)])))};
  assign wire216 = wire215;
  assign wire217 = $unsigned($unsigned($unsigned(((wire139 ? wire4 : (7'h42)) ?
                       (wire141 ? (8'hb3) : wire139) : $unsigned(wire0)))));
  always
    @(posedge clk) begin
      reg218 <= wire1;
    end
  assign wire219 = {$unsigned($signed($signed((reg218 ^ wire215)))), (8'haa)};
  assign wire220 = wire4;
  always
    @(posedge clk) begin
      if ($unsigned(wire215))
        begin
          reg221 <= (~|((((+reg218) ?
                  wire141[(4'he):(3'h6)] : $unsigned((8'hb5))) - $signed((wire3 ?
                  wire217 : wire216))) ?
              (((wire1 << wire3) & $unsigned(wire139)) ?
                  wire2[(4'hd):(4'h9)] : ($signed((8'h9f)) | {wire216,
                      reg218})) : wire217));
          if ((reg221 ?
              {$signed((wire2[(5'h11):(5'h11)] ?
                      ((8'hb0) ?
                          (8'had) : (8'ha8)) : wire0[(4'ha):(4'h8)]))} : $signed((($signed(wire1) >= wire219[(2'h3):(1'h0)]) ?
                  (~&$unsigned(wire219)) : $signed(wire214)))))
            begin
              reg222 <= {wire4[(2'h2):(1'h0)], wire1};
              reg223 <= wire217[(3'h4):(1'h0)];
              reg224 <= wire216[(1'h0):(1'h0)];
              reg225 <= wire217[(3'h5):(1'h1)];
            end
          else
            begin
              reg222 <= wire214[(2'h2):(1'h0)];
              reg223 <= (((~|(8'ha7)) ?
                  $unsigned(wire141) : wire0[(4'h9):(3'h5)]) || (~&wire0));
              reg224 <= wire4[(3'h4):(2'h2)];
              reg225 <= ((+$signed(wire3)) ?
                  $unsigned($unsigned(wire4)) : (wire215[(1'h0):(1'h0)] | (reg224[(2'h3):(1'h0)] - wire2[(3'h7):(1'h1)])));
              reg226 <= wire217[(4'h8):(2'h3)];
            end
        end
      else
        begin
          reg221 <= (reg218[(1'h1):(1'h0)] ?
              $unsigned(((~^(wire214 >> reg224)) ?
                  $unsigned($signed(reg221)) : ((~reg224) < (reg222 < wire214)))) : wire3);
        end
      reg227 <= ($unsigned($signed(wire2[(3'h5):(2'h2)])) ?
          ((reg224[(5'h10):(2'h2)] != wire219[(1'h0):(1'h0)]) >> $unsigned($signed(wire216))) : $signed($unsigned(reg221[(2'h2):(2'h2)])));
      reg228 <= {(|{$unsigned((wire139 && reg226))})};
    end
  module148 #() modinst230 (.wire153(wire141), .wire152(wire139), .wire149(reg227), .wire150(reg218), .wire151(wire0), .clk(clk), .y(wire229));
  module81 #() modinst232 (wire231, clk, wire0, wire139, wire2, reg225, reg223);
  assign wire233 = $signed($signed((8'ha3)));
  assign wire234 = wire141;
  always
    @(posedge clk) begin
      reg235 <= $unsigned(({$signed(wire215),
              ((^~(8'hb2)) ?
                  $unsigned(wire139) : (wire0 ? wire139 : wire231))} ?
          $unsigned(wire229[(2'h3):(1'h0)]) : $signed($unsigned(wire1))));
      if ($signed($signed(reg218)))
        begin
          reg236 <= $signed((~^(reg228[(3'h6):(3'h4)] ?
              ((8'ha9) ?
                  $unsigned(wire220) : reg228) : (wire231[(1'h0):(1'h0)] | $unsigned(wire212)))));
          if ((({(((8'hbe) ? wire4 : reg227) ?
                          ((8'h9c) ?
                              (8'hac) : (8'h9c)) : (reg223 && (8'ha6)))} ?
                  $unsigned(($unsigned((8'hb4)) ?
                      (wire141 != (8'hbf)) : wire1[(3'h7):(1'h0)])) : $unsigned(((reg228 <= reg218) ~^ wire0[(1'h1):(1'h1)]))) ?
              reg218 : (!wire229)))
            begin
              reg237 <= (wire1 ?
                  ((-wire231) ?
                      wire141 : (~wire2)) : $signed((~^{wire214[(4'hb):(4'hb)]})));
              reg238 <= ($signed((reg235 <= wire2)) + $unsigned($unsigned($unsigned($unsigned(wire212)))));
              reg239 <= ($signed({reg236, $unsigned($signed(reg218))}) ?
                  {reg223[(2'h3):(1'h1)],
                      ((~{reg228, wire215}) ~^ reg236)} : (!$unsigned((reg223 ?
                      $unsigned((8'hbe)) : (wire1 | wire2)))));
              reg240 <= reg237[(2'h2):(2'h2)];
              reg241 <= reg225;
            end
          else
            begin
              reg237 <= ((reg223 || (~($signed(wire212) ?
                      (reg235 < (8'hac)) : (reg218 ? (7'h42) : reg241)))) ?
                  (-$unsigned((wire229[(3'h6):(3'h6)] | (^wire220)))) : $signed((&reg235[(1'h0):(1'h0)])));
              reg238 <= {wire219[(1'h0):(1'h0)]};
              reg239 <= reg240;
              reg240 <= ($unsigned($unsigned((((8'ha3) ?
                  wire220 : wire217) >= $unsigned(reg227)))) == (^{$unsigned(((8'had) ?
                      wire214 : (8'hb6))),
                  wire229}));
              reg241 <= reg222[(3'h4):(3'h4)];
            end
          reg242 <= wire219;
          reg243 <= $signed($unsigned((wire231 ?
              (((8'hba) | wire2) ?
                  $unsigned(reg236) : $signed(wire3)) : $signed(((8'haa) <= reg238)))));
          if ((+(reg243 * (~$signed((8'hbd))))))
            begin
              reg244 <= {($unsigned(reg228[(2'h2):(1'h1)]) ?
                      ((~^$signed(reg240)) && reg226) : ((~^reg242[(2'h2):(1'h0)]) << $unsigned({(8'haa)}))),
                  reg241};
              reg245 <= $unsigned({($signed((reg221 <<< wire231)) >= wire216)});
              reg246 <= ($unsigned(({(reg228 || reg224)} << (|$unsigned((8'hb6))))) ^~ ((reg242[(1'h0):(1'h0)] ^ reg237[(4'h8):(3'h5)]) == (({wire234} ?
                  $signed(reg239) : $unsigned(wire219)) <= $unsigned((reg237 ?
                  reg239 : wire141)))));
            end
          else
            begin
              reg244 <= (-(($unsigned((~|reg227)) || (reg244 + {wire2,
                      reg237})) ?
                  $unsigned(wire219[(2'h2):(1'h0)]) : reg222[(2'h3):(2'h2)]));
              reg245 <= ((~|$unsigned(($signed(reg237) ~^ (^wire0)))) ?
                  $unsigned((~&reg226[(4'h8):(4'h8)])) : (($unsigned(wire0[(4'hd):(4'hc)]) ?
                      (~|(~&reg226)) : reg241) >>> (reg242 > (!(^wire216)))));
              reg246 <= reg228[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg236 <= $signed($signed(reg244));
          reg237 <= ((~(|(^$unsigned(wire233)))) * (($unsigned($unsigned(reg235)) ?
              ($unsigned(wire233) ?
                  (reg242 | wire212) : (reg242 >>> reg228)) : wire234[(3'h5):(2'h2)]) <= $unsigned(wire217)));
        end
      reg247 <= (((!((reg237 + wire2) & reg242)) ?
              $signed($unsigned($unsigned(wire233))) : {(wire220[(3'h4):(3'h4)] ?
                      (+reg227) : reg226[(4'he):(4'hd)])}) ?
          wire233[(4'hf):(1'h0)] : reg218);
      reg248 <= ((+$unsigned((!wire4))) ?
          reg239[(2'h3):(2'h2)] : {reg228[(2'h2):(1'h0)]});
      reg249 <= $signed(wire216[(3'h7):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg250 <= ((~&wire4) ?
          (wire0 ? (8'h9e) : wire212) : (reg245 ?
              (&(~^$unsigned(wire1))) : $signed($signed((wire233 * reg239)))));
      if ((~&$signed(((^$unsigned(wire1)) ^~ (!(reg240 ? wire214 : wire219))))))
        begin
          reg251 <= ($unsigned((^$unsigned(((8'hbb) >>> reg222)))) ?
              ((~&(8'hb0)) <= reg235) : wire3[(3'h5):(2'h2)]);
          if ({reg236[(1'h0):(1'h0)]})
            begin
              reg252 <= wire212;
              reg253 <= $signed($signed(($unsigned($signed(reg224)) ?
                  $unsigned(reg226[(3'h7):(3'h5)]) : {(reg242 ^ (8'hb9))})));
              reg254 <= wire214[(3'h6):(2'h2)];
              reg255 <= (reg218[(4'hb):(3'h4)] & {reg253, (~|(8'ha9))});
            end
          else
            begin
              reg252 <= $unsigned(wire214);
              reg253 <= {{{$signed(reg247[(2'h2):(1'h0)]), wire212}, reg236}};
              reg254 <= $unsigned(reg224[(4'hc):(4'hb)]);
            end
          reg256 <= (&(reg252[(3'h4):(1'h0)] ?
              {($unsigned(reg243) <= reg221)} : (+reg236[(1'h1):(1'h0)])));
        end
      else
        begin
          reg251 <= reg253;
          reg252 <= ((~&((^reg256) ~^ {reg226,
              (^~wire234)})) ^~ ({reg226[(3'h7):(2'h2)]} > (^$unsigned(reg241))));
          if (((reg255[(2'h2):(1'h0)] ?
                  {($signed((8'hba)) ?
                          $unsigned((7'h41)) : (~wire4))} : {(+((8'h9e) <<< wire216)),
                      $unsigned((~|(8'ha7)))}) ?
              (reg250[(4'h8):(4'h8)] >>> $unsigned($signed($signed(reg250)))) : $signed($unsigned((reg245 ?
                  (reg226 ? wire1 : reg228) : (|(8'haf)))))))
            begin
              reg253 <= (^~($unsigned(((^reg224) ?
                      (~^reg239) : {reg255, reg256})) ?
                  (~|$unsigned($signed(wire229))) : (~{$unsigned(wire214)})));
              reg254 <= ($signed($unsigned($unsigned($unsigned(reg244)))) & wire220);
              reg255 <= ($signed(reg226) ?
                  (wire141 >>> (reg251[(4'hd):(1'h1)] ?
                      ((reg249 >= reg252) ^ (~&(8'hb5))) : (wire220[(2'h3):(1'h1)] | reg253[(4'ha):(2'h2)]))) : ($unsigned(($unsigned(wire217) ?
                      reg244[(1'h0):(1'h0)] : reg251[(4'hd):(1'h0)])) << {$unsigned($signed(wire141))}));
            end
          else
            begin
              reg253 <= reg243[(1'h0):(1'h0)];
              reg254 <= (wire216[(3'h7):(3'h6)] ?
                  wire141 : wire141[(4'ha):(1'h1)]);
              reg255 <= ((^reg249) ?
                  wire229 : ((({reg248} ?
                      $unsigned(reg254) : $signed(reg240)) + ($signed(reg218) ?
                      wire141[(3'h7):(3'h7)] : (^reg239))) == reg222[(3'h5):(2'h3)]));
              reg256 <= (8'haa);
              reg257 <= (($signed(reg242[(1'h0):(1'h0)]) ?
                      wire2 : (^(((8'hb1) - wire212) + (~reg251)))) ?
                  ($unsigned(reg242[(2'h2):(1'h1)]) ?
                      (reg255[(2'h3):(2'h2)] > {(^wire233),
                          (!wire139)}) : reg241) : reg253[(4'ha):(3'h5)]);
            end
          reg258 <= reg246;
        end
      if ($unsigned(($unsigned($signed((reg245 ~^ wire217))) ?
          $unsigned(reg252[(1'h1):(1'h1)]) : (^wire214))))
        begin
          reg259 <= reg223;
          if (((|((wire220[(3'h5):(1'h1)] ? $unsigned(wire212) : (|(7'h43))) ?
                  ((reg223 + reg227) <<< reg252[(3'h5):(2'h2)]) : {(wire0 ?
                          reg246 : reg253),
                      (reg242 && reg241)})) ?
              reg235[(1'h0):(1'h0)] : (wire229 << $signed((^~(reg249 || (8'ha3)))))))
            begin
              reg260 <= $unsigned(($signed($unsigned(((8'h9c) ?
                      (8'hb7) : wire217))) ?
                  $unsigned((&reg256[(2'h3):(1'h1)])) : reg226));
              reg261 <= (wire220 || {(^(reg252[(3'h5):(1'h0)] == (8'ha4))),
                  (+{(reg253 < reg247), reg255})});
            end
          else
            begin
              reg260 <= $signed(((+(wire215[(4'hc):(4'h9)] ?
                  $signed(wire215) : ((8'hbb) << reg260))) ^~ reg239));
              reg261 <= $signed($unsigned($signed(wire220[(3'h4):(1'h1)])));
            end
        end
      else
        begin
          reg259 <= reg228;
          reg260 <= $unsigned((~&$unsigned(reg251)));
          if ({(((8'hb0) + reg227[(4'hd):(3'h5)]) < {(((8'hb1) ?
                      (8'hb5) : wire219) | wire220[(3'h4):(1'h1)]),
                  (&$unsigned((8'ha1)))})})
            begin
              reg261 <= {$unsigned($signed(reg254[(4'hc):(2'h2)]))};
            end
          else
            begin
              reg261 <= (((&(^~{wire233})) * wire216[(2'h2):(2'h2)]) ?
                  (~(reg247 ?
                      $signed(reg228[(3'h5):(1'h1)]) : (~&$unsigned(wire2)))) : (^~{$signed((|(8'hbd)))}));
              reg262 <= (({$unsigned((reg238 - (8'ha2)))} <<< (((wire4 | reg261) ?
                  (~(8'hbb)) : $unsigned(reg257)) << ((reg221 >>> reg235) ?
                  $unsigned(reg244) : (wire219 ?
                      reg245 : wire231)))) & (($unsigned((wire231 ?
                  reg236 : wire217)) >= ((wire234 * reg218) ?
                  $unsigned(reg244) : (reg225 <<< reg235))) >> ({(&reg244),
                      (reg235 >>> wire216)} ?
                  ((reg247 || wire216) ?
                      wire0 : (-reg223)) : ({reg254} - (wire220 ?
                      reg254 : (8'hba))))));
              reg263 <= {((~&reg253[(4'h8):(2'h3)]) && (wire216[(2'h3):(1'h0)] | reg258[(4'hc):(3'h6)]))};
              reg264 <= (~reg244[(3'h7):(2'h2)]);
              reg265 <= {(reg249 ^~ ((~(wire2 ?
                      reg226 : wire3)) > (reg247[(1'h1):(1'h0)] < {reg237})))};
            end
          if ((&(wire1 != reg222[(1'h1):(1'h1)])))
            begin
              reg266 <= reg223;
              reg267 <= $unsigned($unsigned((-$signed(wire2))));
              reg268 <= $unsigned({reg247[(3'h4):(3'h4)]});
            end
          else
            begin
              reg266 <= reg224;
              reg267 <= ($signed($signed({reg236})) >> ($signed(($signed(reg259) ?
                  wire215 : reg247)) ^~ $unsigned($unsigned(reg222))));
              reg268 <= {$unsigned(reg222)};
              reg269 <= reg266[(1'h0):(1'h0)];
            end
        end
    end
endmodule

module module142
#(parameter param210 = (+(^(+((!(7'h42)) ~^ ((8'hb6) * (8'ha8)))))), 
parameter param211 = param210)
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire147;
  input wire [(5'h11):(1'h0)] wire146;
  input wire [(5'h11):(1'h0)] wire145;
  input wire [(5'h10):(1'h0)] wire144;
  input wire [(5'h13):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire209;
  wire signed [(4'h8):(1'h0)] wire208;
  wire signed [(4'ha):(1'h0)] wire207;
  wire [(3'h6):(1'h0)] wire206;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire162;
  wire [(3'h7):(1'h0)] wire204;
  assign y = {wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire160,
                 wire162,
                 wire204,
                 (1'h0)};
  module148 #() modinst161 (wire160, clk, wire145, wire147, wire146, wire144, wire143);
  assign wire162 = $unsigned(wire146[(4'h9):(1'h1)]);
  module163 #() modinst205 (wire204, clk, wire160, wire143, wire147, wire144, wire146);
  assign wire206 = wire145;
  assign wire207 = ($unsigned(wire204[(3'h6):(3'h4)]) ?
                       wire145[(4'hd):(2'h2)] : (~|(~$unsigned((wire204 ?
                           wire162 : wire145)))));
  assign wire208 = $unsigned((($signed(((8'hb8) <= wire145)) * wire147[(4'he):(4'h9)]) ?
                       $signed((~^$unsigned(wire204))) : wire162));
  assign wire209 = (~&(wire160 ?
                       ((~(-wire160)) != wire160[(3'h4):(3'h4)]) : wire146));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire [(5'h10):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire117;
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire71,
                 wire117,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire10 = wire9;
  assign wire11 = (-$signed($unsigned(wire6[(3'h4):(1'h1)])));
  assign wire12 = ((wire8 ?
                      wire11 : (|(+(wire10 || wire10)))) & (&($signed((~^wire9)) && ((!wire10) ?
                      (wire10 ? (7'h42) : wire10) : (wire7 - wire11)))));
  assign wire13 = $unsigned($signed(wire8[(3'h4):(2'h2)]));
  assign wire14 = $unsigned(((&wire10) ^ wire11));
  always
    @(posedge clk) begin
      reg15 <= {$unsigned(wire6[(5'h12):(2'h2)])};
      reg16 <= (|$signed((^{{wire14}, (wire12 ? wire11 : (8'hb4))})));
      if ({reg16[(2'h2):(1'h1)]})
        begin
          reg17 <= wire9[(3'h4):(2'h2)];
          reg18 <= $signed($unsigned((|(8'hb1))));
        end
      else
        begin
          reg17 <= $unsigned(({($unsigned(reg18) ?
                      reg16[(3'h6):(2'h3)] : $unsigned(wire8))} ?
              (reg15 & (|$unsigned(wire13))) : wire6));
          if ((~wire11))
            begin
              reg18 <= $signed((^(~&((wire8 >>> (8'hba)) >>> (8'ha7)))));
            end
          else
            begin
              reg18 <= ($signed($unsigned(((wire8 ?
                      wire9 : reg18) >>> (8'hbc)))) ?
                  ({wire13} > (^~$signed(((8'hbf) >> reg17)))) : $unsigned(({{reg17,
                          wire7}} ^~ reg16[(3'h6):(2'h3)])));
            end
          reg19 <= {($unsigned(((wire8 + wire6) + $signed((8'hb1)))) ?
                  $unsigned(wire12) : $unsigned(wire6[(3'h5):(1'h0)]))};
          reg20 <= (reg17 >> ($signed(wire12[(5'h14):(5'h12)]) ?
              (wire11[(3'h5):(1'h1)] ?
                  $signed((reg18 == wire13)) : $signed({wire14})) : $unsigned((&((8'hb6) ?
                  wire14 : wire7)))));
        end
      reg21 <= (~reg16[(2'h2):(1'h0)]);
      reg22 <= reg21[(4'h9):(2'h3)];
    end
  assign wire23 = (~|wire9);
  assign wire24 = (8'h9e);
  assign wire25 = (7'h44);
  assign wire26 = ($signed($signed($unsigned({(8'hbf),
                      wire6}))) >= $signed((&((wire25 ? reg17 : wire9) ?
                      ((8'ha6) ~^ wire25) : (wire10 ? (8'hb9) : wire14)))));
  module27 #() modinst72 (wire71, clk, wire13, wire10, reg15, wire14, wire11);
  always
    @(posedge clk) begin
      if ((((|$unsigned($unsigned(wire13))) + reg21) ~^ (reg15 ?
          (($signed(wire71) ?
              (8'h9f) : wire12) <= (~|wire9)) : ($signed(wire6) | $unsigned($unsigned((8'ha8)))))))
        begin
          if (reg22)
            begin
              reg73 <= {reg15[(3'h7):(3'h7)], (-(^~$signed($signed(wire8))))};
              reg74 <= (^~({wire71} > wire71[(3'h4):(3'h4)]));
            end
          else
            begin
              reg73 <= {$unsigned(((wire11 & (-wire24)) >= $unsigned((8'hbb))))};
              reg74 <= (-wire14[(4'hb):(3'h5)]);
            end
          reg75 <= (({(8'h9d), (~(-reg15))} > reg21) ?
              reg15[(3'h7):(2'h3)] : reg19[(4'h9):(2'h2)]);
          reg76 <= $signed(reg17[(2'h3):(2'h3)]);
        end
      else
        begin
          reg73 <= reg76;
          reg74 <= ((!$signed($signed((wire11 <<< wire71)))) >>> ({$unsigned((~^reg16))} <= {reg17,
              $signed((wire10 && wire24))}));
          if ((((&($signed(reg17) * $unsigned(wire7))) | reg75[(2'h2):(1'h0)]) ?
              $unsigned($signed($unsigned((8'hb6)))) : $signed((-$unsigned($unsigned(reg76))))))
            begin
              reg75 <= reg21[(4'hd):(4'hb)];
            end
          else
            begin
              reg75 <= reg17;
            end
          reg76 <= $signed((wire25[(3'h5):(1'h0)] ?
              (-(-(8'ha8))) : $signed(wire8[(5'h10):(1'h1)])));
          reg77 <= ((+$signed($signed(reg20))) ?
              ($signed(reg16[(1'h0):(1'h0)]) ?
                  (^~$unsigned(wire11[(5'h12):(4'hb)])) : $signed((wire13[(5'h12):(3'h4)] << wire11))) : ((&$signed($unsigned(wire12))) ?
                  $unsigned($signed((-reg16))) : (((8'hac) >> (wire9 ?
                      reg76 : reg16)) & wire26)));
        end
      reg78 <= (^$signed(((|$signed(wire6)) ?
          reg19[(4'h8):(3'h6)] : (reg18 ? {wire24} : reg73[(3'h6):(2'h3)]))));
      reg79 <= $unsigned((+(!$signed(reg17[(3'h6):(1'h0)]))));
      reg80 <= (~^(~&$signed(((-wire23) || (wire14 << wire8)))));
    end
  module81 #() modinst118 (wire117, clk, reg21, wire71, wire7, reg17, wire10);
  always
    @(posedge clk) begin
      if (wire13[(4'h9):(1'h0)])
        begin
          reg119 <= (~(+(($signed(reg15) ? {reg15} : {reg75}) ?
              {$signed(reg79), wire71} : $signed($unsigned(wire13)))));
          reg120 <= (^~(+((wire9 >> (wire11 ? reg74 : wire71)) ?
              {(reg22 ? (8'h9e) : reg19)} : ((^reg18) ^~ $unsigned(wire6)))));
          reg121 <= (&reg19);
          reg122 <= ((!wire11) ?
              (reg17[(3'h6):(2'h3)] ? {$unsigned(wire117)} : reg22) : {wire11,
                  {reg119}});
        end
      else
        begin
          if (({(8'h9c), reg77[(3'h7):(2'h3)]} ?
              wire8[(3'h5):(2'h3)] : (~&$unsigned((^$unsigned(reg76))))))
            begin
              reg119 <= reg121;
              reg120 <= $signed(((~&{wire24[(2'h2):(2'h2)],
                  $signed(reg21)}) | ($unsigned(wire26) ?
                  reg75[(3'h4):(3'h4)] : $signed((reg73 > reg18)))));
              reg121 <= $unsigned((reg78 ?
                  ($unsigned({reg21}) ^ reg16) : (~&(reg16[(1'h0):(1'h0)] ?
                      wire23[(1'h0):(1'h0)] : (reg20 - reg120)))));
            end
          else
            begin
              reg119 <= wire24;
              reg120 <= (wire7 ? $signed((8'ha0)) : {{wire26[(4'hc):(4'hb)]}});
              reg121 <= $unsigned((^~($signed($unsigned(wire24)) ?
                  (-reg77[(3'h5):(3'h5)]) : (reg76[(4'h9):(3'h5)] ?
                      reg73[(1'h1):(1'h0)] : $signed(reg19)))));
              reg122 <= reg16[(1'h1):(1'h0)];
            end
          reg123 <= (reg122[(1'h0):(1'h0)] ?
              $signed({reg77}) : (~&$signed({$unsigned(wire13), (^reg21)})));
        end
      reg124 <= $unsigned((reg80[(3'h4):(3'h4)] + (+(wire23[(2'h2):(1'h0)] ^~ (reg15 ?
          wire14 : reg75)))));
      if ({($unsigned(reg124[(3'h4):(1'h1)]) ?
              (($signed(reg120) ? $unsigned(reg121) : wire71[(4'h9):(1'h0)]) ?
                  (~^(~|wire25)) : (|$unsigned(reg18))) : $signed($signed((^~reg76))))})
        begin
          reg125 <= wire14;
          reg126 <= (((|($signed(reg21) ? {wire71} : reg123[(4'hc):(2'h3)])) ?
              $unsigned($unsigned(reg74[(1'h0):(1'h0)])) : reg16) || (($signed((|reg73)) ?
              reg18 : ((-wire26) | (reg75 ?
                  reg74 : wire9))) >= ($signed(reg123[(3'h4):(1'h0)]) != (!{(8'ha0),
              reg122}))));
        end
      else
        begin
          reg125 <= $unsigned((~&(wire9[(4'hf):(4'h8)] ?
              wire7 : ((~^reg121) - $signed(reg16)))));
          if ((~{wire14,
              ($signed(reg76) != ((reg122 ? reg77 : wire14) ?
                  reg75 : reg20[(2'h3):(1'h1)]))}))
            begin
              reg126 <= reg74;
              reg127 <= {reg125};
              reg128 <= {(~$signed({$signed(reg75)})), $signed(reg79)};
            end
          else
            begin
              reg126 <= reg79[(2'h2):(1'h0)];
            end
          reg129 <= (reg19[(3'h4):(1'h1)] ? {wire9} : reg119);
          reg130 <= ((~&$signed((-$unsigned((8'hbe))))) + wire10);
          reg131 <= reg123[(3'h4):(3'h4)];
        end
      reg132 <= reg130;
      reg133 <= ((wire8 ~^ (($signed(reg77) ?
          (wire11 <<< wire13) : wire9) >>> {reg19})) | reg123[(4'hd):(3'h5)]);
    end
  assign wire134 = $unsigned(reg80);
  assign wire135 = (^~(~|({(reg73 * wire134)} ?
                       ($unsigned(reg76) ?
                           $unsigned((8'hae)) : reg120) : $signed(((8'ha1) ~^ reg20)))));
  assign wire136 = reg125;
  assign wire137 = {$unsigned((~&((|(8'ha3)) + (reg16 >>> reg80))))};
  assign wire138 = (($signed(wire7) ?
                           wire25[(2'h3):(2'h3)] : ((reg123 ~^ (wire9 ?
                               wire71 : wire12)) & reg21)) ?
                       wire23[(3'h4):(1'h1)] : $unsigned(reg15));
endmodule

module module81
#(parameter param116 = (((8'hbc) >= (!((~(8'ha7)) > {(8'hb5)}))) ? {((((8'ha4) ? (8'hb7) : (8'hbf)) && ((8'hab) ? (7'h43) : (8'hbc))) ? (!{(7'h42)}) : (((8'ha6) ? (8'h9d) : (8'hab)) ? ((8'ha4) & (8'h9f)) : {(8'ha3), (8'h9d)}))} : ((({(8'haa), (8'ha0)} ? ((8'h9d) == (8'ha6)) : ((8'h9d) ? (8'hb8) : (8'ha1))) ? (((8'ha3) != (8'hbb)) || ((8'hb6) ~^ (8'hbe))) : ((8'hbd) != ((8'hab) + (8'ha8)))) ? (((^~(8'h9d)) >> ((8'hbe) & (8'hb9))) != (((8'haa) ? (8'hb3) : (8'hbd)) > ((8'ha2) <<< (8'ha1)))) : (-(8'hb8)))))
(y, clk, wire86, wire85, wire84, wire83, wire82);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire86;
  input wire signed [(3'h5):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  input wire [(5'h10):(1'h0)] wire83;
  input wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire113;
  wire signed [(4'ha):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire90,
                 wire88,
                 wire87,
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
                 reg89,
                 (1'h0)};
  assign wire87 = (wire85[(1'h0):(1'h0)] ?
                      $unsigned((|$unsigned($unsigned(wire86)))) : (-(~^$unsigned((wire84 == (8'hb4))))));
  assign wire88 = wire83;
  always
    @(posedge clk) begin
      reg89 <= $signed((wire83[(1'h0):(1'h0)] >= {(~|wire88)}));
    end
  assign wire90 = (8'ha9);
  always
    @(posedge clk) begin
      reg91 <= wire87[(4'hb):(1'h0)];
      reg92 <= {(wire83[(2'h2):(1'h0)] ?
              (8'haf) : $unsigned((~^$signed(wire90))))};
      reg93 <= wire82;
      if (wire86)
        begin
          if (((+(^(8'hba))) ?
              (|($unsigned((8'haf)) && (8'hbb))) : $signed({wire83})))
            begin
              reg94 <= (wire88[(2'h2):(2'h2)] ?
                  {wire88,
                      $signed(wire82[(3'h7):(2'h3)])} : $signed((reg92 < ($signed(reg92) ?
                      (wire87 ? wire86 : wire87) : $unsigned((8'hb0))))));
            end
          else
            begin
              reg94 <= $unsigned(((wire85 - $signed($signed(wire88))) ?
                  wire88[(2'h3):(2'h3)] : (~^({reg91, reg94} ?
                      (8'ha4) : reg92[(3'h7):(1'h0)]))));
              reg95 <= (8'hbe);
              reg96 <= (wire85 ? (~^$signed((~^(wire83 ~^ wire83)))) : wire83);
              reg97 <= (wire88[(2'h2):(2'h2)] ? reg94 : wire83);
            end
          reg98 <= (^~$unsigned(((~reg96[(4'hc):(3'h7)]) ?
              (&$signed(wire83)) : (wire90[(3'h5):(3'h4)] << $signed(wire84)))));
          reg99 <= $unsigned($unsigned({reg94[(4'hd):(3'h7)],
              (&$unsigned(wire83))}));
          reg100 <= reg94[(5'h11):(3'h4)];
        end
      else
        begin
          reg94 <= reg95;
          if ($signed($unsigned($unsigned((^reg97[(3'h7):(2'h2)])))))
            begin
              reg95 <= (reg95[(3'h4):(2'h3)] ?
                  (^~$unsigned({wire82})) : $signed(wire87[(2'h2):(1'h0)]));
            end
          else
            begin
              reg95 <= (~^$signed($signed((-{(8'hb7), wire90}))));
              reg96 <= wire87[(2'h2):(1'h1)];
              reg97 <= (-wire85[(3'h4):(1'h1)]);
            end
          reg98 <= ({{($unsigned(reg100) ?
                          $unsigned((8'ha8)) : (reg95 != reg89))}} ?
              ($unsigned(wire85) ?
                  $signed({(~^wire88),
                      (!wire88)}) : reg98) : reg91[(2'h3):(2'h3)]);
        end
      reg101 <= {((wire85[(3'h4):(3'h4)] ?
                  $unsigned((reg94 || (8'hb4))) : $signed(wire82)) ?
              (!((reg97 ^ wire84) == reg99[(5'h12):(4'he)])) : $signed({(!reg94)})),
          wire82};
    end
  assign wire102 = $unsigned(($signed(reg93[(3'h4):(3'h4)]) ?
                       ({(wire84 ? (8'hb0) : wire84), (^wire90)} ?
                           ((reg97 != reg93) ?
                               $signed(reg93) : $unsigned((8'hb1))) : reg97) : $signed({((8'had) ?
                               wire83 : wire88),
                           reg89[(3'h7):(2'h3)]})));
  assign wire103 = (reg100 >>> reg97[(2'h2):(2'h2)]);
  assign wire104 = wire88;
  assign wire105 = reg95;
  assign wire106 = reg100[(4'h8):(3'h4)];
  assign wire107 = {(wire87 != $unsigned((~&reg92[(1'h1):(1'h0)])))};
  assign wire108 = {$unsigned(({reg93[(1'h1):(1'h0)]} ?
                           ((~(7'h42)) ? wire83 : (8'hb3)) : $unsigned({reg96,
                               wire87})))};
  assign wire109 = (wire86 ?
                       {wire83[(1'h0):(1'h0)],
                           (-(wire103 ?
                               {wire103,
                                   reg100} : (!reg93)))} : $unsigned((!(((8'ha1) ?
                               wire86 : reg95) ?
                           (reg93 <<< reg91) : reg97))));
  assign wire110 = wire108[(3'h6):(1'h1)];
  assign wire111 = ($unsigned(((wire88[(2'h2):(2'h2)] ~^ (wire90 * wire109)) ~^ ({wire90,
                           wire84} ^ reg91))) ?
                       (+(reg93[(4'hc):(3'h4)] * ($unsigned(wire90) ?
                           $unsigned(reg94) : reg91))) : wire106);
  assign wire112 = $signed({wire110[(3'h7):(1'h0)], wire107});
  assign wire113 = wire112;
  assign wire114 = (reg93 ?
                       (wire88 ?
                           wire85 : $signed((~^(wire108 & wire83)))) : ($unsigned(reg97[(3'h6):(1'h1)]) ?
                           (reg97 << {$unsigned(wire107)}) : $unsigned($unsigned(wire107))));
  assign wire115 = ({((wire108[(3'h4):(2'h2)] ?
                               $unsigned(reg91) : (reg95 ? wire85 : reg97)) ?
                           $unsigned({wire88}) : $unsigned((-reg97))),
                       wire112} >= (wire108[(4'h9):(1'h1)] ^~ (~|(((8'hbb) || reg97) ?
                       (reg99 ? wire113 : wire105) : (wire86 - wire83)))));
endmodule

module module27
#(parameter param69 = ((((-(!(8'haa))) << (((7'h43) & (8'hae)) ? (8'hb3) : {(8'ha6)})) ^~ ({((8'hbd) ? (8'hbc) : (8'ha3))} ^~ (((8'had) ? (8'hbe) : (8'hba)) ? ((8'hb5) ? (8'hb4) : (8'h9c)) : {(8'ha9), (7'h41)}))) || ({((~&(8'had)) && (~&(7'h41))), {((8'ha8) ? (8'ha6) : (7'h41)), ((8'hbf) > (8'ha3))}} ? ((((8'ha4) | (8'h9f)) | ((8'hb8) >= (8'hb6))) <= (((8'hb0) ^ (7'h42)) <<< ((8'hb9) ? (7'h40) : (8'ha6)))) : ((((8'h9e) || (8'hb6)) ~^ (~|(8'ha9))) * ((^~(8'h9f)) ? (^(8'ha0)) : ((8'hbb) ? (7'h44) : (8'hb0)))))), 
parameter param70 = param69)
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  assign y = {wire68,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire33 = $unsigned(((8'hb7) || (~|(wire30[(1'h0):(1'h0)] ?
                      wire31 : $unsigned(wire31)))));
  assign wire34 = wire33[(1'h0):(1'h0)];
  assign wire35 = (!(wire31 & $signed(($unsigned(wire34) ~^ (~(8'hb0))))));
  assign wire36 = {((~|((wire33 ? (8'haf) : wire28) ?
                          $signed(wire30) : $unsigned(wire34))) >>> ($unsigned((^~wire28)) ^~ (wire34[(4'hd):(3'h4)] ?
                          $unsigned(wire30) : (wire30 <= wire32))))};
  assign wire37 = (+(($unsigned((+wire30)) ? (8'hb6) : (~&(wire29 >= wire33))) ?
                      (~|{$signed(wire31),
                          (wire29 + (8'haf))}) : (|$signed($unsigned(wire28)))));
  assign wire38 = (wire35[(4'hb):(4'hb)] ~^ ($signed((^(wire33 >= wire32))) | {(wire34 ?
                          (!wire30) : $signed((8'hb3))),
                      $signed($signed(wire28))}));
  always
    @(posedge clk) begin
      if ((((((wire34 && wire31) ?
                  $signed(wire34) : (wire32 ? (8'ha3) : (8'ha4))) ?
              (wire36[(2'h2):(1'h0)] ?
                  (~^wire30) : (wire37 ?
                      wire30 : (8'haf))) : wire32[(3'h6):(3'h5)]) ?
          wire32 : wire37[(4'hb):(1'h1)]) * ({$signed((wire34 ?
                  wire34 : wire32))} ?
          ($signed(wire29) ^~ $signed((wire35 <<< wire28))) : $signed(wire30))))
        begin
          reg39 <= (~^wire35[(3'h5):(1'h0)]);
          if ($signed($signed((8'hb0))))
            begin
              reg40 <= wire38[(2'h3):(1'h1)];
              reg41 <= (~&reg39[(3'h4):(1'h1)]);
            end
          else
            begin
              reg40 <= (~(((-reg39) != $signed(reg39[(3'h6):(1'h1)])) ?
                  wire28[(3'h7):(2'h3)] : ($unsigned(wire38) - $signed((+wire28)))));
              reg41 <= ($signed(wire38[(4'h8):(1'h1)]) ?
                  (8'ha4) : (~^$unsigned($signed(reg40[(4'ha):(2'h3)]))));
              reg42 <= $unsigned({($unsigned($unsigned(wire38)) ?
                      (^(wire35 ? wire32 : wire30)) : $signed(reg39))});
            end
          reg43 <= $unsigned(wire38);
        end
      else
        begin
          reg39 <= $unsigned(($signed($unsigned(wire36[(4'h9):(1'h1)])) & $signed($signed($unsigned((8'hb0))))));
        end
      reg44 <= (~wire28);
      reg45 <= wire33[(2'h2):(2'h2)];
    end
  assign wire46 = wire31[(3'h6):(3'h5)];
  assign wire47 = wire33[(1'h1):(1'h1)];
  assign wire48 = $signed($unsigned(reg45[(2'h3):(1'h1)]));
  assign wire49 = $unsigned((-$unsigned(reg42[(5'h13):(5'h13)])));
  assign wire50 = wire30[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed($unsigned(($signed(wire48) || $unsigned($unsigned((8'hbc)))))))
        begin
          reg51 <= wire50[(2'h2):(1'h0)];
        end
      else
        begin
          reg51 <= reg51;
          reg52 <= (($unsigned((^(reg51 ^~ wire48))) >> reg45[(1'h0):(1'h0)]) ?
              {$unsigned(((reg40 | wire33) <<< $unsigned(reg40))),
                  reg42} : {reg43});
          if ((~&reg52[(1'h0):(1'h0)]))
            begin
              reg53 <= (|$unsigned(wire35));
              reg54 <= $unsigned((|$signed($signed($signed(wire49)))));
              reg55 <= (^~$unsigned(wire36));
            end
          else
            begin
              reg53 <= {wire38};
            end
          reg56 <= $signed(({(wire48 - $unsigned(wire38))} ?
              reg53 : ((wire34 ? (^reg39) : $unsigned(reg52)) ?
                  wire34 : (|reg40[(3'h7):(2'h3)]))));
          reg57 <= {$signed((((8'ha2) ?
                  wire48 : wire47[(3'h6):(3'h6)]) | ($signed(wire36) != $unsigned(wire46)))),
              (((~|$unsigned(wire46)) ^ $unsigned((^wire34))) != ($unsigned(reg53) ?
                  $unsigned($unsigned(reg55)) : (^wire35)))};
        end
    end
  assign wire58 = (^~(reg43 ? $signed(reg53[(4'h8):(1'h0)]) : wire33));
  assign wire59 = $signed(($signed(wire29[(3'h6):(3'h6)]) ?
                      ($unsigned($unsigned(reg54)) ?
                          $signed(((7'h44) ^ reg43)) : $signed((wire46 ?
                              wire32 : wire48))) : (reg55[(3'h7):(3'h6)] ?
                          $signed($signed(reg53)) : $signed((~|reg56)))));
  assign wire60 = (wire59 << wire46[(4'hf):(2'h3)]);
  assign wire61 = ($unsigned($unsigned($signed((reg45 ?
                      (8'ha8) : reg40)))) > reg40[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (((wire59 ~^ reg57) > $unsigned(wire31[(3'h5):(1'h1)])))
        begin
          if ((|$unsigned(wire30[(4'h8):(3'h6)])))
            begin
              reg62 <= (-$signed((-((&reg42) ~^ $signed(reg44)))));
              reg63 <= (-$unsigned((&(~(~wire49)))));
            end
          else
            begin
              reg62 <= ((((reg53[(3'h4):(2'h3)] ? (8'had) : $signed((8'hb0))) ?
                          reg55 : wire60[(1'h0):(1'h0)]) ?
                      ((reg57[(3'h7):(2'h3)] * wire32[(4'he):(4'ha)]) && wire34) : wire35) ?
                  {reg41[(3'h4):(3'h4)], $unsigned(wire33)} : (8'ha7));
              reg63 <= wire34;
            end
          reg64 <= reg42;
          reg65 <= (~^wire37);
        end
      else
        begin
          reg62 <= $signed(((wire31[(4'hb):(4'h8)] ?
              wire38 : (~&{reg39, wire46})) * reg55[(3'h4):(3'h4)]));
          reg63 <= reg42;
          reg64 <= wire29;
          reg65 <= (~({wire33} - $signed(wire38[(1'h1):(1'h0)])));
          reg66 <= $signed((8'had));
        end
      reg67 <= $unsigned((!{{(reg54 | reg40)}, (^~(~^wire38))}));
    end
  assign wire68 = {$unsigned((wire35 && wire31[(3'h5):(2'h2)]))};
endmodule

module module163  (y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire168;
  input wire [(3'h6):(1'h0)] wire167;
  input wire signed [(4'he):(1'h0)] wire166;
  input wire [(4'hc):(1'h0)] wire165;
  input wire [(5'h11):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire203;
  wire signed [(4'hc):(1'h0)] wire202;
  wire [(2'h2):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire200;
  wire signed [(3'h7):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire189;
  wire [(4'h9):(1'h0)] wire171;
  wire signed [(5'h12):(1'h0)] wire170;
  wire [(4'hf):(1'h0)] wire169;
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg198 = (1'h0);
  reg [(4'h9):(1'h0)] reg197 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'hf):(1'h0)] reg194 = (1'h0);
  reg [(4'hc):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(2'h3):(1'h0)] reg188 = (1'h0);
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire190,
                 wire189,
                 wire171,
                 wire170,
                 wire169,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
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
                 reg174,
                 reg173,
                 reg172,
                 (1'h0)};
  assign wire169 = wire168;
  assign wire170 = ($unsigned((wire165[(1'h0):(1'h0)] ~^ $signed((-(8'h9c))))) ?
                       $signed({(~|wire169)}) : $unsigned((wire164[(4'hf):(4'ha)] ?
                           ((wire167 ?
                               wire168 : wire166) && wire168) : {{wire166,
                                   wire168},
                               ((8'hb2) * wire166)})));
  assign wire171 = $signed(wire170);
  always
    @(posedge clk) begin
      reg172 <= (~wire166[(4'he):(4'h9)]);
      reg173 <= $unsigned((~^$unsigned(((wire169 ^ wire170) <<< $unsigned(wire168)))));
      reg174 <= wire168;
      reg175 <= (((^((~^wire167) & $signed(wire167))) + (wire169 ?
              {(wire164 ? reg173 : reg174)} : wire164)) ?
          ((~&($signed(wire169) != (8'hb6))) <<< (($unsigned(wire171) ?
                  ((8'hb9) ? wire168 : wire171) : (~|wire165)) ?
              $unsigned((-(8'hae))) : {$unsigned(wire170),
                  wire164})) : $unsigned($signed(wire164[(5'h11):(5'h10)])));
    end
  always
    @(posedge clk) begin
      reg176 <= (+wire167);
      reg177 <= ((~$unsigned(((reg173 ^ wire171) > reg175[(4'he):(4'he)]))) > (-(reg172[(4'hc):(3'h7)] ?
          (reg176 ^~ wire166) : $signed($signed(wire171)))));
      if ((~|$unsigned(reg176[(4'hc):(1'h1)])))
        begin
          reg178 <= ((~&{wire166[(3'h4):(2'h2)]}) ?
              $unsigned((wire170[(5'h11):(4'ha)] ?
                  $unsigned(wire167) : wire169)) : wire165);
          reg179 <= ((reg176 + (-$signed((wire171 >>> wire167)))) ?
              (8'ha3) : ((~(~&wire168[(4'h8):(4'h8)])) >> (wire168 ?
                  $unsigned($signed((8'ha1))) : reg174[(2'h2):(2'h2)])));
          reg180 <= ($signed(((~&(reg175 ? reg172 : reg173)) ?
              (!(wire171 ? wire165 : wire168)) : {(^reg175),
                  {reg178, wire171}})) | $signed(((reg174 ?
              {reg175} : reg176[(3'h7):(2'h2)]) >>> $signed(wire167))));
          reg181 <= (-(~wire165));
          if (wire170[(3'h4):(3'h4)])
            begin
              reg182 <= reg174[(3'h5):(3'h4)];
              reg183 <= (~^{$signed(wire171)});
              reg184 <= $unsigned(((7'h41) ?
                  reg177[(2'h2):(2'h2)] : $signed((^~(reg177 ?
                      reg182 : (8'hb6))))));
              reg185 <= wire168[(3'h7):(3'h7)];
              reg186 <= (7'h44);
            end
          else
            begin
              reg182 <= ((^reg178) ?
                  ($unsigned(reg184) >>> $unsigned({{(8'ha9)},
                      (reg173 ? (8'h9c) : reg177)})) : wire170);
              reg183 <= ({reg172, reg173[(4'h8):(1'h1)]} ?
                  $signed($unsigned(((reg183 * wire171) ?
                      (reg186 ?
                          wire171 : wire167) : reg173[(3'h4):(1'h0)]))) : $unsigned(wire168[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          if (((^$signed($signed($signed(reg177)))) ? wire171 : reg172))
            begin
              reg178 <= (^~reg181);
              reg179 <= $unsigned($unsigned(((&(~|reg184)) + reg180[(2'h3):(2'h3)])));
              reg180 <= ($signed(reg172[(4'hf):(3'h5)]) | (reg172 ?
                  ($unsigned($unsigned(reg173)) ?
                      $signed($signed(reg173)) : $unsigned((wire169 ?
                          wire169 : (8'h9d)))) : reg180[(3'h4):(3'h4)]));
            end
          else
            begin
              reg178 <= (8'ha6);
              reg179 <= $signed((~|wire169[(4'h8):(3'h5)]));
              reg180 <= ($signed($signed($unsigned(wire164[(4'he):(3'h5)]))) ?
                  (|wire167) : wire166);
            end
          reg181 <= $signed($unsigned($unsigned((8'hb9))));
          if ((8'hbf))
            begin
              reg182 <= {({wire170} >> $unsigned((|reg186))),
                  $unsigned($signed((wire165 <= $signed(reg172))))};
            end
          else
            begin
              reg182 <= (+$unsigned((+(reg185[(5'h10):(4'h9)] ?
                  wire166[(1'h1):(1'h0)] : (8'hbc)))));
            end
          reg183 <= (-$signed($signed((reg174 ?
              $signed(wire165) : $signed(wire164)))));
          reg184 <= reg172[(4'hb):(4'ha)];
        end
      reg187 <= ({({reg179[(2'h2):(1'h1)], (wire171 ? wire166 : reg179)} ?
              $signed(((8'ha9) + reg176)) : {wire169,
                  (reg173 ? wire165 : reg174)}),
          reg186} == $signed(((^(-reg177)) ?
          $signed($unsigned(wire167)) : reg179)));
      reg188 <= {reg179[(5'h14):(4'hb)],
          ((^($signed(reg179) ?
              (reg173 ? reg173 : wire171) : (|(8'ha3)))) < reg174)};
    end
  assign wire189 = (7'h40);
  assign wire190 = $unsigned($unsigned({$unsigned({reg178}),
                       (wire164[(3'h4):(2'h2)] ?
                           $signed(wire168) : (reg172 ? reg188 : reg176))}));
  always
    @(posedge clk) begin
      reg191 <= ($unsigned((reg182[(5'h12):(2'h3)] ?
          $signed(reg185[(3'h6):(2'h2)]) : reg173)) >> $unsigned(wire170[(4'ha):(1'h0)]));
      reg192 <= $signed((8'ha7));
    end
  always
    @(posedge clk) begin
      reg193 <= ($unsigned($signed($signed((reg177 ?
          reg191 : reg175)))) << (+wire167));
      if (($signed($unsigned(reg187[(3'h7):(3'h6)])) ?
          wire190[(3'h5):(2'h2)] : reg178))
        begin
          reg194 <= (|(~|$signed($unsigned((reg173 ? (8'hb7) : wire167)))));
          reg195 <= $unsigned((!$unsigned(($signed(reg177) ?
              (reg191 * reg188) : ((8'ha1) ? (7'h41) : reg187)))));
          if ($unsigned(reg172[(1'h1):(1'h1)]))
            begin
              reg196 <= reg194;
              reg197 <= (reg194 | (reg174 ?
                  (|(|wire190[(3'h4):(3'h4)])) : reg192));
            end
          else
            begin
              reg196 <= wire189[(3'h7):(2'h3)];
            end
          reg198 <= (((&((wire168 ? reg184 : (8'hac)) || (reg183 ?
                  (8'ha7) : wire170))) ?
              (+reg183[(3'h4):(1'h0)]) : (reg176[(4'hf):(4'hd)] ?
                  $unsigned($unsigned((8'ha9))) : ((reg184 << reg176) << $signed(reg174)))) && {((wire170 ?
                      reg176[(1'h1):(1'h0)] : (wire167 >>> wire171)) ?
                  ((reg179 == wire167) ?
                      $signed(reg180) : reg192[(3'h5):(3'h4)]) : (~|(reg184 ?
                      reg196 : reg177))),
              wire164[(3'h7):(3'h7)]});
          reg199 <= $signed(({$signed((8'h9c))} ?
              (({wire189} ?
                  (reg177 >= wire170) : (~&reg197)) < wire190) : $unsigned((!$signed(reg197)))));
        end
      else
        begin
          reg194 <= (({reg177} > (^$signed(reg194))) ~^ $signed($signed((-wire189[(1'h1):(1'h1)]))));
          reg195 <= ((~|(reg177[(1'h0):(1'h0)] && $signed($unsigned(wire190)))) ?
              (!(~((~|reg195) ?
                  $unsigned(reg176) : $unsigned(wire164)))) : reg173[(4'h8):(2'h3)]);
        end
    end
  assign wire200 = (~|reg174);
  assign wire201 = $signed(({$unsigned((reg192 ? wire168 : reg180))} ?
                       (wire190 + $signed(reg182)) : wire170));
  assign wire202 = ($unsigned((!$unsigned($signed((8'hb6))))) ?
                       (reg191[(2'h2):(2'h2)] <= $unsigned((wire201 ?
                           reg182[(3'h7):(3'h4)] : $signed(wire190)))) : reg184[(4'h9):(2'h2)]);
  assign wire203 = ($unsigned(((+(wire200 || wire189)) != ($signed((8'h9f)) && (wire164 ?
                       reg180 : wire164)))) ^~ wire168);
endmodule

module module148
#(parameter param158 = ((^(~^{((8'hb3) ~^ (7'h41))})) ? (({((8'h9c) - (8'hb2)), ((8'ha1) | (7'h40))} ? (((8'hb9) ? (8'ha3) : (8'hb9)) & (+(8'hb6))) : (~|((8'h9f) ? (8'h9d) : (8'ha4)))) ~^ ((8'hb3) <= ((|(8'ha3)) << ((8'hb9) != (8'ha6))))) : (((((8'hbd) > (8'hbd)) ? (8'ha6) : ((7'h42) ? (8'hb0) : (8'haf))) ? (((8'hb1) ? (8'hb8) : (8'h9d)) ? ((8'haf) ? (8'ha9) : (8'haa)) : {(8'hb3)}) : (((8'hb5) < (8'hb7)) >= (-(8'ha3)))) & (((~&(8'hac)) * ((8'hbe) ? (8'h9e) : (8'hb1))) - (&((8'hb9) ? (7'h43) : (8'ha8)))))), 
parameter param159 = param158)
(y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire153;
  input wire [(5'h11):(1'h0)] wire152;
  input wire [(4'he):(1'h0)] wire151;
  input wire signed [(4'hc):(1'h0)] wire150;
  input wire signed [(4'h9):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  wire [(4'hb):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  assign y = {wire157, wire156, wire155, wire154, (1'h0)};
  assign wire154 = $signed($unsigned((wire152[(4'h8):(1'h1)] ?
                       $signed(wire153) : {wire149[(4'h9):(3'h7)],
                           wire151[(3'h4):(1'h1)]})));
  assign wire155 = ($signed({$unsigned((8'haa)),
                           ((wire149 >> wire151) ^~ (wire154 <<< (8'h9e)))}) ?
                       (~&$signed($signed((wire149 ?
                           wire150 : (8'hb2))))) : wire153[(1'h1):(1'h1)]);
  assign wire156 = (wire151 | wire150);
  assign wire157 = (!{{wire153[(1'h1):(1'h0)]}});
endmodule
