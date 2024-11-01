module top
#(parameter param356 = (^((({(8'h9d), (8'hb4)} ? ((8'had) ? (7'h40) : (8'ha3)) : ((8'hb2) ? (8'hb7) : (8'haa))) ? {((7'h44) ? (8'hbc) : (8'hb8)), (~|(8'hbe))} : (((8'hb0) <<< (8'ha5)) >= {(8'hbc), (8'ha7)})) || (~&({(8'h9f), (8'ha7)} ? {(8'hbb), (8'hbb)} : ((8'hab) ^~ (8'ha4)))))), 
parameter param357 = {((param356 ? {{param356}, (~^param356)} : (param356 ? (^param356) : (param356 ? param356 : param356))) ? (^~({param356, param356} ? (param356 ? (8'ha0) : param356) : {param356, (8'hb3)})) : (~{(param356 ? param356 : param356), (param356 ? param356 : (8'hb9))})), (~&(param356 << ((8'ha4) ? ((8'ha7) ? param356 : param356) : param356)))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire355;
  wire signed [(5'h12):(1'h0)] wire354;
  wire [(4'hd):(1'h0)] wire350;
  wire [(2'h3):(1'h0)] wire334;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire332;
  wire signed [(4'hb):(1'h0)] wire352;
  reg [(5'h15):(1'h0)] reg349 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg348 = (1'h0);
  reg [(4'h8):(1'h0)] reg347 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg346 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg345 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg344 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg343 = (1'h0);
  reg [(2'h2):(1'h0)] reg342 = (1'h0);
  reg [(3'h5):(1'h0)] reg341 = (1'h0);
  reg [(4'he):(1'h0)] reg340 = (1'h0);
  reg [(5'h12):(1'h0)] reg339 = (1'h0);
  reg [(2'h3):(1'h0)] reg338 = (1'h0);
  reg [(3'h6):(1'h0)] reg337 = (1'h0);
  reg [(4'he):(1'h0)] reg336 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg335 = (1'h0);
  assign y = {wire355,
                 wire354,
                 wire350,
                 wire334,
                 wire52,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire332,
                 wire352,
                 reg349,
                 reg348,
                 reg347,
                 reg346,
                 reg345,
                 reg344,
                 reg343,
                 reg342,
                 reg341,
                 reg340,
                 reg339,
                 reg338,
                 reg337,
                 reg336,
                 reg335,
                 (1'h0)};
  module4 #() modinst53 (.y(wire52), .wire8(wire0), .wire6(wire2), .clk(clk), .wire7(wire3), .wire5(wire1));
  assign wire54 = wire2[(4'ha):(4'ha)];
  assign wire55 = $signed($unsigned(($unsigned($unsigned(wire1)) >= (^~wire3[(4'hc):(1'h1)]))));
  assign wire56 = (wire52 ?
                      wire55 : (($signed((wire54 & wire55)) ?
                              {{wire2, wire1}} : (~|{wire1, wire54})) ?
                          wire54[(5'h10):(2'h2)] : wire1));
  assign wire57 = (|wire3);
  assign wire58 = wire54;
  assign wire59 = $unsigned(wire0);
  assign wire60 = wire52[(3'h7):(3'h4)];
  module61 #() modinst333 (wire332, clk, wire1, wire2, wire56, wire58, wire60);
  assign wire334 = $unsigned({wire57});
  always
    @(posedge clk) begin
      reg335 <= $unsigned($signed(((wire56 ?
          wire58 : wire334) != $signed($unsigned((8'hbe))))));
      if (wire60)
        begin
          reg336 <= $signed(wire52[(3'h6):(3'h6)]);
          reg337 <= wire332;
          if ((~&(8'hb1)))
            begin
              reg338 <= $unsigned($unsigned((wire334 ?
                  {(wire332 + (8'hbf)),
                      (8'hbe)} : (wire56[(4'hc):(3'h7)] >>> wire58[(4'hc):(3'h6)]))));
              reg339 <= wire332;
              reg340 <= wire334;
              reg341 <= ((8'h9f) ?
                  $signed(wire334[(1'h1):(1'h0)]) : (^(8'ha2)));
              reg342 <= (^((($unsigned(wire1) ?
                      $signed((8'h9d)) : $signed(wire59)) ?
                  reg338 : wire1[(1'h1):(1'h1)]) > (~|wire58[(4'hb):(4'ha)])));
            end
          else
            begin
              reg338 <= (($unsigned($signed($unsigned(wire0))) ?
                      (((wire60 >> reg338) ^~ (wire332 != reg336)) <= wire2) : wire58[(4'h8):(2'h2)]) ?
                  (+reg336[(1'h1):(1'h1)]) : {wire52});
            end
          if (((!({(wire59 | (8'ha4))} ? (8'hb3) : $unsigned({wire3, wire0}))) ?
              $unsigned(reg335) : reg336[(4'ha):(4'h8)]))
            begin
              reg343 <= $signed((wire55 < wire54[(4'hc):(1'h1)]));
              reg344 <= ((8'hbb) - {{wire60[(2'h2):(1'h0)],
                      $signed((reg339 != (7'h44)))},
                  $unsigned((8'ha7))});
              reg345 <= $signed(($unsigned($unsigned((-reg337))) ?
                  reg340[(4'hc):(4'ha)] : $unsigned({(~&wire55),
                      $unsigned(reg338)})));
              reg346 <= wire2;
            end
          else
            begin
              reg343 <= (+(-((~&reg335[(1'h1):(1'h1)]) != reg337)));
            end
          reg347 <= (wire52 * wire52);
        end
      else
        begin
          reg336 <= reg335[(3'h7):(1'h0)];
          reg337 <= (|wire0);
          reg338 <= $signed(reg342[(2'h2):(2'h2)]);
          if ($signed(($unsigned(reg336) ~^ ($signed((8'h9c)) && $unsigned($signed(reg339))))))
            begin
              reg339 <= reg340;
              reg340 <= wire56;
              reg341 <= reg338;
              reg342 <= ((~|$signed(reg343)) & (~^(&wire54[(4'h9):(3'h6)])));
            end
          else
            begin
              reg339 <= ({$unsigned($signed((wire332 ? reg342 : wire57)))} ?
                  $signed((reg336 & wire56[(2'h3):(1'h0)])) : (($signed((!(8'hbe))) < $unsigned(wire54[(5'h13):(4'h8)])) && {(wire54[(5'h10):(5'h10)] ?
                          (~|reg346) : reg340[(4'hb):(4'h8)])}));
              reg340 <= (^~(~&(($unsigned(wire332) ? {wire54} : (~reg343)) ?
                  (reg342 >= $signed(reg342)) : {(8'hb1), {wire56}})));
            end
        end
      reg348 <= $unsigned((((wire334 - $signed((8'ha4))) ?
              $unsigned(wire54[(4'h9):(3'h4)]) : (|(!reg344))) ?
          ((wire58[(4'hc):(3'h6)] - (^~wire58)) != $signed((reg347 | reg338))) : wire58));
      reg349 <= wire60[(2'h2):(2'h2)];
    end
  module4 #() modinst351 (.wire7(wire56), .wire8(reg348), .y(wire350), .clk(clk), .wire5(reg341), .wire6(reg346));
  module4 #() modinst353 (.wire5(wire0), .clk(clk), .wire6(reg346), .wire7(wire3), .wire8(wire54), .y(wire352));
  assign wire354 = (wire1[(1'h0):(1'h0)] ?
                       (reg345 >> ($signed($unsigned(reg348)) + wire2)) : $signed($signed(((!(8'hb4)) == wire1))));
  assign wire355 = (wire59 <<< $signed(($signed(reg339[(4'h9):(4'h9)]) + wire57[(1'h1):(1'h1)])));
endmodule

module module61
#(parameter param330 = (!(((~^((8'ha5) < (8'haa))) ? (~^(&(8'hb3))) : {((8'hb1) + (8'ha1)), ((7'h40) ^ (8'hab))}) ? ({((8'h9f) ? (8'ha0) : (7'h41)), ((8'hac) ~^ (8'ha2))} ? (((8'hbe) ? (8'haa) : (8'hab)) ? ((8'h9f) ? (8'haa) : (8'haa)) : (8'hb3)) : (^((8'h9f) ? (8'haf) : (8'h9c)))) : (^~(!(!(8'hbd)))))), 
parameter param331 = {(+param330)})
(y, clk, wire62, wire63, wire64, wire65, wire66);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire62;
  input wire signed [(5'h13):(1'h0)] wire63;
  input wire [(5'h10):(1'h0)] wire64;
  input wire signed [(5'h11):(1'h0)] wire65;
  input wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire329;
  wire signed [(5'h14):(1'h0)] wire328;
  wire [(4'he):(1'h0)] wire241;
  wire [(4'he):(1'h0)] wire224;
  wire signed [(5'h15):(1'h0)] wire220;
  wire [(5'h10):(1'h0)] wire219;
  wire [(5'h11):(1'h0)] wire218;
  wire signed [(5'h15):(1'h0)] wire217;
  wire signed [(5'h12):(1'h0)] wire216;
  wire [(5'h10):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire127;
  wire [(5'h11):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire198;
  wire [(5'h14):(1'h0)] wire200;
  wire [(3'h6):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire324;
  wire signed [(5'h10):(1'h0)] wire326;
  reg [(4'h9):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg222 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg223 = (1'h0);
  assign y = {wire329,
                 wire328,
                 wire241,
                 wire224,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire67,
                 wire124,
                 wire126,
                 wire127,
                 wire134,
                 wire198,
                 wire200,
                 wire214,
                 wire324,
                 wire326,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg221,
                 reg222,
                 reg223,
                 (1'h0)};
  assign wire67 = ((wire66[(3'h4):(2'h2)] != wire64[(4'h9):(3'h5)]) || wire65);
  module68 #() modinst125 (wire124, clk, wire63, wire67, wire64, wire65);
  assign wire126 = ((!wire64[(3'h4):(2'h3)]) ?
                       $unsigned(wire66[(3'h4):(2'h2)]) : wire66);
  assign wire127 = ((&$signed((8'hba))) + (+wire126[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire63[(4'ha):(4'h9)])
        begin
          if ($signed(($unsigned(wire127) && ($unsigned($unsigned(wire63)) >= (~^wire127)))))
            begin
              reg128 <= wire63;
            end
          else
            begin
              reg128 <= ((wire67[(5'h10):(1'h1)] * {wire65[(4'ha):(2'h2)]}) ?
                  ($unsigned(wire66[(1'h1):(1'h1)]) ?
                      $signed({((8'hae) ?
                              wire127 : wire63)}) : wire66[(1'h0):(1'h0)]) : wire67);
              reg129 <= $unsigned(((~&$signed($signed(reg128))) >>> wire127[(2'h2):(2'h2)]));
            end
          reg130 <= ($unsigned((-((~&wire127) >>> (wire62 ?
                  wire64 : wire67)))) ?
              ($unsigned($signed(wire64[(4'hb):(3'h5)])) ?
                  wire63 : $unsigned(((wire67 - wire124) ?
                      (wire63 ?
                          wire66 : wire127) : $signed(wire65)))) : $signed((-($unsigned(wire127) ^~ wire124[(2'h3):(2'h3)]))));
        end
      else
        begin
          reg128 <= wire127[(1'h0):(1'h0)];
          reg129 <= wire66;
          if ({(wire66[(2'h2):(1'h1)] ?
                  {wire67,
                      $signed(((8'ha7) ? (7'h41) : wire65))} : ({(+(8'haf))} ?
                      (((8'ha8) ? wire126 : wire127) ?
                          (wire63 ?
                              wire127 : reg129) : $signed(wire127)) : (^~$unsigned(wire126))))})
            begin
              reg130 <= (($signed($signed($unsigned(wire65))) ?
                  $unsigned(($unsigned(reg129) ?
                      $signed(reg130) : $signed(wire63))) : (+wire66)) ^ wire67);
              reg131 <= (({wire66, $unsigned(reg129[(2'h3):(2'h3)])} ?
                  wire65[(3'h5):(3'h5)] : (8'hb8)) | wire66);
            end
          else
            begin
              reg130 <= wire124[(3'h5):(2'h3)];
              reg131 <= ((+(reg130[(4'hf):(1'h0)] ^~ ($signed(wire67) != $signed(wire62)))) ?
                  wire126[(2'h2):(1'h1)] : $unsigned({(^(+wire65)),
                      (wire64 ?
                          ((8'hbc) ? (8'ha4) : wire126) : (reg129 ?
                              wire62 : reg131))}));
            end
          reg132 <= (^(^~wire63));
          reg133 <= wire127;
        end
    end
  assign wire134 = reg129;
  module135 #() modinst199 (.wire137(reg131), .clk(clk), .wire138(reg128), .y(wire198), .wire140(wire63), .wire136(wire65), .wire139(reg129));
  assign wire200 = {(reg131 ?
                           $signed((-(wire64 ?
                               (8'hb5) : reg130))) : $unsigned({reg131}))};
  module201 #() modinst215 (wire214, clk, reg128, wire200, wire65, reg131, wire67);
  assign wire216 = (reg133 ?
                       wire62[(2'h2):(2'h2)] : (~^$signed((wire127[(1'h1):(1'h0)] ^ (|(8'hbb))))));
  assign wire217 = $unsigned($unsigned((^~wire214[(2'h3):(1'h1)])));
  assign wire218 = $signed($unsigned((^~(^reg128))));
  assign wire219 = {wire126, wire216};
  assign wire220 = wire200;
  always
    @(posedge clk) begin
      reg221 <= wire124;
      reg222 <= reg221;
      reg223 <= (^~((^~reg222) >>> ($signed(wire214[(2'h3):(2'h3)]) ?
          ((wire127 ^~ wire218) ?
              $unsigned(reg130) : wire63[(1'h0):(1'h0)]) : (+$signed(reg221)))));
    end
  assign wire224 = (reg221[(2'h2):(2'h2)] - ((+$unsigned($signed(wire214))) >= ($signed($unsigned(wire67)) ?
                       ({wire66} < (!reg221)) : ((-wire127) ?
                           (reg129 ? reg130 : wire124) : wire65))));
  module225 #() modinst242 (wire241, clk, wire63, wire214, reg222, reg130, wire64);
  module243 #() modinst325 (wire324, clk, wire241, reg129, wire63, wire134, wire218);
  module201 #() modinst327 (.y(wire326), .wire205(wire66), .wire203(wire216), .wire202(wire217), .wire204(wire127), .clk(clk), .wire206(wire124));
  assign wire328 = $signed(wire124);
  assign wire329 = (($unsigned($unsigned(reg222[(1'h1):(1'h1)])) ?
                       (wire328 == reg132[(4'h9):(4'h9)]) : wire218[(4'hc):(4'hc)]) - {(((wire127 ?
                           (8'hbb) : wire200) - {wire62}) < ($unsigned(reg221) != (reg130 == (8'haf)))),
                       $unsigned(((wire217 >>> (8'hb1)) ^~ (wire66 ?
                           reg221 : reg128)))});
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire5;
  input wire [(2'h2):(1'h0)] wire6;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(3'h6):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire32;
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire51,
                 wire47,
                 wire46,
                 wire45,
                 wire37,
                 wire36,
                 wire34,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire32,
                 reg50,
                 reg49,
                 reg48,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 (1'h0)};
  assign wire9 = wire7[(3'h4):(1'h0)];
  assign wire10 = ((wire6[(1'h1):(1'h0)] < wire7) ?
                      ($signed({(-wire5)}) ?
                          $signed(((wire6 ? wire6 : wire8) ?
                              (wire7 > (8'hb5)) : wire6[(1'h1):(1'h0)])) : wire8) : wire5);
  assign wire11 = $signed((wire7[(1'h0):(1'h0)] ?
                      {wire6} : $signed(((wire10 ?
                          wire9 : wire7) - (wire8 + wire8)))));
  assign wire12 = (({$signed(wire10[(1'h0):(1'h0)]),
                          wire9[(3'h4):(2'h3)]} <<< (wire8[(4'hf):(1'h0)] <= ($unsigned((8'ha4)) | (wire8 && wire10)))) ?
                      wire7[(2'h3):(1'h0)] : wire7[(2'h2):(2'h2)]);
  assign wire13 = wire5[(3'h5):(3'h4)];
  assign wire14 = $unsigned($unsigned(wire10));
  assign wire15 = ((wire14 & ($unsigned(wire6) ~^ ((wire6 && wire7) ?
                          wire14[(3'h4):(2'h3)] : $unsigned(wire8)))) ?
                      (($unsigned((wire14 != wire12)) + ((wire9 ^ (8'h9c)) ~^ $unsigned(wire14))) ^~ ((wire12 ?
                              $unsigned(wire7) : ((7'h43) ? wire5 : wire9)) ?
                          (wire9[(2'h3):(2'h3)] ?
                              (wire6 <= wire12) : $unsigned(wire10)) : $unsigned(wire11[(3'h6):(3'h4)]))) : wire13[(4'hd):(1'h1)]);
  module16 #() modinst33 (.y(wire32), .wire21(wire10), .wire19(wire9), .wire20(wire12), .wire17(wire8), .wire18(wire7), .clk(clk));
  assign wire34 = $unsigned(wire5[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg35 <= wire6;
    end
  assign wire36 = (^~($signed(wire7) ?
                      (~{((8'hbd) * (8'h9d))}) : (!$unsigned((wire5 >= wire14)))));
  assign wire37 = ($unsigned(wire6) >> wire12[(3'h6):(2'h3)]);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          if (($signed($unsigned((wire6[(1'h1):(1'h1)] ?
                  $unsigned(wire15) : $unsigned(wire36)))) ?
              (~^(wire6[(2'h2):(1'h0)] ?
                  (+(wire32 < (8'hbd))) : (8'hbe))) : wire36[(5'h12):(4'hd)]))
            begin
              reg38 <= wire36;
              reg39 <= (reg38 ?
                  (($signed(wire37[(4'ha):(3'h5)]) ?
                      wire34[(1'h0):(1'h0)] : {wire37[(2'h3):(2'h3)]}) << reg35[(3'h4):(2'h2)]) : (wire34 ?
                      $signed(((wire32 << wire9) <<< wire36[(3'h6):(1'h1)])) : (7'h44)));
              reg40 <= reg35[(1'h0):(1'h0)];
            end
          else
            begin
              reg38 <= ($unsigned(wire34[(3'h4):(2'h3)]) ^ (~&$signed(wire10[(1'h1):(1'h1)])));
              reg39 <= wire11;
              reg40 <= (^~((wire6 | (reg40[(4'hd):(3'h7)] ^ (wire13 >>> wire11))) ?
                  wire37 : reg40[(5'h10):(2'h2)]));
            end
          if ($unsigned((wire14 << $signed($unsigned((wire32 ?
              wire32 : wire11))))))
            begin
              reg41 <= $unsigned($signed((~|{(!wire37),
                  (wire8 ? wire32 : reg39)})));
              reg42 <= (|(7'h43));
            end
          else
            begin
              reg41 <= ($signed((|{$signed(wire37)})) ^ reg40[(4'h9):(3'h4)]);
            end
          reg43 <= (wire15 != $signed((+(~^$unsigned(wire32)))));
          reg44 <= $signed($signed(wire9[(2'h3):(2'h3)]));
        end
      else
        begin
          reg38 <= $unsigned({($unsigned(wire9) ?
                  ($signed(reg44) ? reg43 : $signed((8'hb7))) : wire8),
              $unsigned((~{wire9, wire11}))});
          if ((-reg43[(2'h3):(2'h3)]))
            begin
              reg39 <= (~^reg43[(1'h0):(1'h0)]);
              reg40 <= (wire34 ?
                  (+(&{{wire10, reg43},
                      (wire10 ? wire9 : reg43)})) : $unsigned($signed(wire9)));
              reg41 <= $unsigned($signed($unsigned(((8'hb8) ?
                  (!reg41) : (^~(7'h42))))));
              reg42 <= reg42;
            end
          else
            begin
              reg39 <= ((($signed($unsigned(wire7)) ?
                      ((reg35 || wire32) >>> $signed(wire37)) : $signed($unsigned(reg42))) == (wire7 ?
                      $signed(wire11[(4'hc):(2'h2)]) : $signed((reg40 + wire6)))) ?
                  ($unsigned((wire6[(1'h1):(1'h1)] >> $signed(wire13))) > $unsigned($signed($signed(reg41)))) : wire32);
            end
          reg43 <= (~|(^$unsigned($unsigned(reg35))));
        end
    end
  assign wire45 = (8'h9c);
  assign wire46 = $unsigned($unsigned((+{(8'hb7)})));
  assign wire47 = reg44;
  always
    @(posedge clk) begin
      reg48 <= reg41;
      reg49 <= (&$signed(wire36[(4'hc):(1'h1)]));
      reg50 <= ((|$signed($signed($unsigned(wire32)))) << reg39);
    end
  assign wire51 = wire45;
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h11):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 reg24,
                 (1'h0)};
  assign wire22 = wire19[(3'h6):(3'h6)];
  assign wire23 = wire19[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg24 <= wire17[(3'h5):(2'h3)];
    end
  assign wire25 = $signed((wire20[(3'h5):(2'h3)] ?
                      $signed(wire23[(1'h1):(1'h1)]) : (~&$signed({reg24}))));
  assign wire26 = (wire23 ? wire21[(3'h4):(1'h1)] : reg24[(1'h1):(1'h1)]);
  assign wire27 = ($signed((wire25[(1'h0):(1'h0)] && $unsigned(wire23[(2'h2):(1'h0)]))) || $signed((((wire18 ^ wire21) != {wire22}) ?
                      $signed($unsigned(wire17)) : wire18[(5'h14):(4'hc)])));
  assign wire28 = (!{wire19, $signed($signed({reg24}))});
  assign wire29 = $signed((wire20[(3'h4):(1'h0)] && $signed((^{wire25,
                      reg24}))));
  assign wire30 = wire19;
  assign wire31 = (&(!(wire22[(3'h7):(3'h7)] ?
                      (|(reg24 >> wire28)) : {(|wire19), $signed(wire23)})));
endmodule

module module243
#(parameter param322 = ((~^((!((8'had) ^~ (8'hab))) ? (((8'hb7) ^~ (8'hb6)) == ((8'ha2) >>> (8'hbb))) : (~^(-(8'hbc))))) < (({(~^(8'hab))} ^ (((8'ha1) ? (8'h9f) : (7'h43)) ? ((8'hb1) <= (8'ha3)) : ((8'hac) ? (8'hb2) : (8'hb5)))) ? (~(~^(|(8'h9e)))) : ((((8'hb1) - (8'hae)) == ((8'ha2) - (8'haa))) <= {((8'ha0) ~^ (8'hb2))}))), 
parameter param323 = {param322})
(y, clk, wire248, wire247, wire246, wire245, wire244);
  output wire [(32'h342):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire248;
  input wire [(5'h15):(1'h0)] wire247;
  input wire signed [(4'hb):(1'h0)] wire246;
  input wire [(3'h6):(1'h0)] wire245;
  input wire signed [(5'h11):(1'h0)] wire244;
  wire signed [(4'hd):(1'h0)] wire321;
  wire signed [(4'he):(1'h0)] wire320;
  wire [(5'h12):(1'h0)] wire319;
  wire [(4'he):(1'h0)] wire318;
  wire [(3'h7):(1'h0)] wire317;
  wire [(5'h11):(1'h0)] wire316;
  wire signed [(3'h6):(1'h0)] wire292;
  wire signed [(3'h6):(1'h0)] wire280;
  wire signed [(3'h6):(1'h0)] wire279;
  wire [(5'h12):(1'h0)] wire257;
  wire signed [(5'h13):(1'h0)] wire256;
  wire signed [(5'h12):(1'h0)] wire255;
  wire [(2'h2):(1'h0)] wire254;
  wire signed [(4'hc):(1'h0)] wire250;
  reg signed [(3'h6):(1'h0)] reg315 = (1'h0);
  reg [(3'h4):(1'h0)] reg314 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg313 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg312 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg311 = (1'h0);
  reg [(3'h5):(1'h0)] reg310 = (1'h0);
  reg [(4'h8):(1'h0)] reg309 = (1'h0);
  reg [(5'h14):(1'h0)] reg308 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg307 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg306 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg305 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg304 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg303 = (1'h0);
  reg [(3'h5):(1'h0)] reg302 = (1'h0);
  reg [(4'hd):(1'h0)] reg301 = (1'h0);
  reg [(4'he):(1'h0)] reg300 = (1'h0);
  reg [(5'h12):(1'h0)] reg299 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg298 = (1'h0);
  reg [(3'h4):(1'h0)] reg297 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg296 = (1'h0);
  reg [(4'hd):(1'h0)] reg295 = (1'h0);
  reg [(4'ha):(1'h0)] reg294 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg293 = (1'h0);
  reg [(3'h7):(1'h0)] reg291 = (1'h0);
  reg [(4'hc):(1'h0)] reg290 = (1'h0);
  reg [(4'hb):(1'h0)] reg289 = (1'h0);
  reg [(2'h3):(1'h0)] reg288 = (1'h0);
  reg [(4'h8):(1'h0)] reg287 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg286 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg285 = (1'h0);
  reg [(2'h2):(1'h0)] reg284 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg283 = (1'h0);
  reg [(3'h5):(1'h0)] reg282 = (1'h0);
  reg [(5'h13):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg278 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg277 = (1'h0);
  reg [(2'h2):(1'h0)] reg276 = (1'h0);
  reg [(5'h14):(1'h0)] reg275 = (1'h0);
  reg [(4'hb):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg273 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg272 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg271 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg269 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg268 = (1'h0);
  reg [(5'h14):(1'h0)] reg267 = (1'h0);
  reg [(4'h9):(1'h0)] reg266 = (1'h0);
  reg [(4'he):(1'h0)] reg265 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg264 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg263 = (1'h0);
  reg [(5'h14):(1'h0)] reg262 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg261 = (1'h0);
  reg signed [(4'he):(1'h0)] reg260 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg259 = (1'h0);
  reg [(4'hb):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg253 = (1'h0);
  reg [(2'h2):(1'h0)] reg252 = (1'h0);
  reg [(5'h15):(1'h0)] reg251 = (1'h0);
  reg [(4'he):(1'h0)] reg249 = (1'h0);
  assign y = {wire321,
                 wire320,
                 wire319,
                 wire318,
                 wire317,
                 wire316,
                 wire292,
                 wire280,
                 wire279,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire250,
                 reg315,
                 reg314,
                 reg313,
                 reg312,
                 reg311,
                 reg310,
                 reg309,
                 reg308,
                 reg307,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
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
                 reg253,
                 reg252,
                 reg251,
                 reg249,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg249 <= wire247;
    end
  assign wire250 = wire244;
  always
    @(posedge clk) begin
      if (wire250)
        begin
          reg251 <= ($unsigned(wire248[(4'h8):(1'h0)]) == ((wire245 != $signed(wire244[(4'hd):(1'h0)])) > $signed($unsigned((reg249 ?
              wire246 : wire248)))));
          reg252 <= $unsigned((($signed((reg251 * reg251)) << (~|(wire244 * wire250))) + $unsigned(((wire246 ?
                  wire250 : wire250) ?
              wire245 : (wire248 ? wire250 : reg251)))));
          reg253 <= (&(|$unsigned(wire244)));
        end
      else
        begin
          reg251 <= (|reg253[(1'h1):(1'h0)]);
        end
    end
  assign wire254 = (8'hab);
  assign wire255 = reg251;
  assign wire256 = wire248[(1'h0):(1'h0)];
  assign wire257 = $signed($signed(reg251));
  always
    @(posedge clk) begin
      reg258 <= (($unsigned(wire247[(4'hd):(4'hd)]) < (wire245[(1'h1):(1'h1)] ?
              wire250[(4'ha):(2'h3)] : wire244)) ?
          (wire246 >> $signed($unsigned(wire245))) : ($signed(reg252) ^~ $unsigned($unsigned((wire255 ?
              wire255 : (8'hbb))))));
      reg259 <= wire256;
      reg260 <= (($signed(((reg251 * reg258) ?
              $signed(wire246) : (wire256 ?
                  wire255 : reg251))) < $unsigned(({wire257} != (~reg249)))) ?
          (8'hbc) : ($signed($signed((|(7'h42)))) ^ reg252));
    end
  always
    @(posedge clk) begin
      reg261 <= wire250;
      reg262 <= reg252[(2'h2):(1'h1)];
      reg263 <= {$unsigned((wire257[(5'h10):(4'h8)] << {$signed(reg262)})),
          wire250};
      if ((8'ha6))
        begin
          reg264 <= reg249[(1'h1):(1'h0)];
          if ($unsigned($unsigned((((reg251 <= reg263) <= (&reg264)) + wire244[(4'hb):(3'h6)]))))
            begin
              reg265 <= wire255;
              reg266 <= ($unsigned(reg252) ?
                  (8'ha6) : ($signed((^wire255)) + reg259));
              reg267 <= reg264[(3'h5):(3'h5)];
              reg268 <= (&$unsigned($unsigned((^(wire254 <= (8'ha7))))));
              reg269 <= wire254;
            end
          else
            begin
              reg265 <= $signed(($unsigned(reg261) | ({(~^(8'hb4)),
                  ((8'hb1) >> wire257)} | (wire256[(2'h2):(1'h1)] >= (reg251 ?
                  reg264 : (8'hb8))))));
              reg266 <= (wire256 + wire257);
              reg267 <= (wire255 == (wire244[(4'h8):(1'h0)] || $unsigned((^reg258[(3'h5):(1'h0)]))));
              reg268 <= wire257;
              reg269 <= $unsigned((~&($unsigned($unsigned(reg249)) ?
                  $signed($signed(reg268)) : $signed(reg252[(1'h1):(1'h0)]))));
            end
          reg270 <= reg252[(2'h2):(1'h1)];
          reg271 <= (({({(8'hba)} ?
                      (!(7'h42)) : wire246[(2'h3):(2'h3)])} > reg259) ?
              wire247[(2'h2):(1'h0)] : $signed($unsigned((reg268[(1'h1):(1'h1)] <= $unsigned(wire246)))));
          if ((wire250[(2'h2):(1'h1)] ?
              ((!($signed(reg251) & wire255)) <= (|($signed(reg261) ?
                  wire248[(4'ha):(2'h2)] : (^wire246)))) : wire248[(4'h8):(3'h7)]))
            begin
              reg272 <= (!reg270);
              reg273 <= $signed((~|$signed(wire257[(3'h7):(2'h3)])));
              reg274 <= ((|$signed($signed((-reg273)))) ?
                  wire256 : $signed((^$signed({wire250, reg253}))));
              reg275 <= (7'h41);
            end
          else
            begin
              reg272 <= $unsigned(reg249[(4'hb):(1'h1)]);
            end
        end
      else
        begin
          reg264 <= ((|{($unsigned(reg252) ?
                  $signed(reg258) : ((8'hbe) ^ wire245))}) + reg260[(4'hd):(4'hd)]);
          if ((~&((|(8'hbc)) & $signed(reg270[(3'h7):(3'h5)]))))
            begin
              reg265 <= ($signed($signed(($signed(reg259) ?
                  $unsigned(reg259) : (+reg269)))) < reg267[(4'ha):(2'h2)]);
              reg266 <= $signed((((wire254[(2'h2):(1'h0)] ?
                      $signed(reg258) : $signed(reg266)) == (^~$signed(wire250))) ?
                  $unsigned(($unsigned(reg266) ?
                      $signed(reg264) : ((8'ha1) ?
                          wire247 : wire257))) : reg264));
              reg267 <= $signed(wire246);
              reg268 <= $unsigned((reg252 ?
                  (($signed(reg274) ? {reg262} : (reg259 ? reg274 : reg272)) ?
                      (~reg251[(4'he):(3'h5)]) : $signed(((8'h9e) ?
                          reg267 : reg268))) : wire247));
            end
          else
            begin
              reg265 <= wire254[(2'h2):(1'h1)];
              reg266 <= $unsigned((({(reg258 <= reg272)} ^~ $unsigned({reg253})) - (^(&((8'h9e) < reg258)))));
              reg267 <= (^~{$signed((8'ha7)),
                  (wire245 <<< (!wire248[(3'h5):(1'h0)]))});
              reg268 <= (reg266 ?
                  (reg258 ?
                      wire248 : ((&wire254) ?
                          ($unsigned((7'h42)) >> (reg274 <= (8'hb1))) : reg268[(4'he):(2'h2)])) : (~$unsigned({(reg262 & reg271),
                      (reg249 == reg272)})));
            end
          if ($signed(((reg267[(4'hd):(4'h8)] ?
              $unsigned($signed(reg268)) : $signed($signed(wire257))) || $unsigned(reg271))))
            begin
              reg269 <= (!(&reg258[(3'h7):(3'h5)]));
              reg270 <= (^(((reg275[(4'hb):(2'h2)] ^ $signed(reg262)) ?
                      $signed(reg258) : $unsigned(((8'hb0) ?
                          reg252 : reg274))) ?
                  {$unsigned(reg273), (~wire255)} : (reg262 < ((~&reg262) ?
                      wire257 : wire254[(1'h0):(1'h0)]))));
              reg271 <= {$unsigned($signed((-$signed((8'ha0))))),
                  $unsigned({$signed(wire244[(4'hd):(4'hb)])})};
              reg272 <= (&$signed(((~&(wire246 ?
                  wire255 : (8'h9c))) >>> $unsigned(((7'h42) & reg274)))));
            end
          else
            begin
              reg269 <= reg274[(3'h7):(3'h6)];
            end
          if ({{$unsigned($signed((~&reg271)))}})
            begin
              reg273 <= (&$signed((!$unsigned($signed((8'hb7))))));
            end
          else
            begin
              reg273 <= ($signed($signed(reg253)) != reg265[(4'h9):(3'h6)]);
              reg274 <= (|((^$unsigned((reg258 >> (7'h44)))) ?
                  (!$unsigned({wire250})) : (reg259 ? reg249 : reg264)));
              reg275 <= (((reg272 ?
                      reg251[(3'h7):(3'h5)] : wire246[(3'h4):(2'h2)]) ^ wire256[(4'hc):(4'hc)]) ?
                  {$signed((^~(~reg268)))} : reg249[(3'h5):(1'h1)]);
              reg276 <= ($signed(reg267[(1'h1):(1'h0)]) ~^ (wire250 + $unsigned((wire244 ?
                  (|wire244) : (~&wire250)))));
              reg277 <= $unsigned((8'h9f));
            end
          reg278 <= $signed(reg272[(2'h3):(1'h1)]);
        end
    end
  assign wire279 = (((reg271 ?
                           ($unsigned(wire244) ?
                               reg266[(3'h6):(1'h0)] : $unsigned(wire255)) : reg253) >= {$unsigned($unsigned((8'haf)))}) ?
                       (($unsigned((wire245 | wire256)) ?
                           ((8'ha7) ?
                               (reg278 ? reg278 : wire245) : (reg271 ?
                                   reg269 : reg278)) : reg251) == (({reg273,
                                   reg253} ?
                               $signed(reg249) : $signed(reg263)) ?
                           $signed(wire250[(3'h4):(2'h2)]) : wire244)) : $signed(reg275[(4'ha):(4'h8)]));
  assign wire280 = (&(8'hb9));
  always
    @(posedge clk) begin
      reg281 <= ({$unsigned($unsigned({wire279})),
          $signed(($signed(reg260) ?
              reg261 : (reg264 ? (8'h9e) : reg275)))} <<< (8'ha2));
      reg282 <= {(^reg272), $signed($signed($unsigned(reg268)))};
      if ($unsigned(reg269[(3'h5):(3'h5)]))
        begin
          reg283 <= (^~((~|((reg259 >> wire254) ?
                  {wire280, wire254} : reg249)) ?
              ($unsigned(reg264) & $signed($signed(wire255))) : $signed((reg274 ~^ $unsigned(reg282)))));
          reg284 <= $signed(wire255[(5'h12):(4'hb)]);
          reg285 <= ($unsigned((((wire256 * reg263) | $signed(wire255)) ?
                  ((8'hb9) ?
                      ((8'hb1) + (8'hb2)) : ((8'ha7) ?
                          (8'hbf) : reg251)) : reg267)) ?
              ((((wire255 > wire245) <= (reg282 ? reg277 : wire246)) ?
                  $signed((wire245 != wire248)) : $signed($signed(reg263))) | (~|($unsigned(reg271) < $unsigned(wire279)))) : (($unsigned((reg283 & wire255)) <= (8'ha6)) << reg275[(4'hf):(3'h5)]));
          reg286 <= {$unsigned($signed((~reg285))), $signed((~(8'hab)))};
        end
      else
        begin
          reg283 <= reg253[(2'h2):(1'h0)];
          if (wire245)
            begin
              reg284 <= (&(reg266[(3'h7):(1'h1)] ?
                  reg284[(1'h1):(1'h1)] : ($signed(reg267[(4'ha):(4'h9)]) == reg276)));
              reg285 <= $unsigned(reg282[(1'h1):(1'h0)]);
            end
          else
            begin
              reg284 <= reg270[(1'h1):(1'h0)];
              reg285 <= $signed($unsigned((~^(|(reg275 ? reg278 : reg278)))));
              reg286 <= reg283[(2'h3):(2'h3)];
              reg287 <= $unsigned($unsigned(reg263));
            end
          reg288 <= reg286[(2'h2):(2'h2)];
          reg289 <= wire257;
        end
      reg290 <= reg268;
      reg291 <= wire257;
    end
  assign wire292 = {(((|(8'hb8)) ? reg262 : $signed($unsigned(reg270))) ?
                           (~$unsigned($unsigned(reg269))) : $signed($unsigned(reg268)))};
  always
    @(posedge clk) begin
      reg293 <= (|$signed({$signed(reg275)}));
      if (reg290)
        begin
          reg294 <= (-($unsigned($signed(reg262)) * wire254));
          reg295 <= ({($signed($unsigned(reg278)) & reg262[(4'hc):(3'h5)])} - reg262);
        end
      else
        begin
          reg294 <= (|($unsigned($signed(reg259[(2'h2):(2'h2)])) ?
              reg259 : $signed(reg265)));
          if (((8'hab) ? reg273 : wire247[(4'hc):(1'h0)]))
            begin
              reg295 <= ((!(reg281[(4'h9):(1'h1)] ?
                      ((reg259 ?
                          reg286 : (8'ha7)) != reg275[(4'he):(2'h2)]) : reg259[(2'h3):(2'h3)])) ?
                  (+$signed(($signed(reg265) ?
                      reg289 : (wire248 | reg271)))) : (~^(|wire248[(3'h4):(2'h2)])));
              reg296 <= wire254;
              reg297 <= (^wire256[(4'h8):(2'h2)]);
              reg298 <= reg285;
              reg299 <= (-reg293[(4'hf):(4'ha)]);
            end
          else
            begin
              reg295 <= wire244[(3'h4):(1'h0)];
              reg296 <= {(($signed((8'hb4)) ?
                          (reg271[(5'h11):(1'h0)] && ((8'ha7) ~^ reg263)) : (^~{wire292})) ?
                      (8'h9c) : (~&(reg289[(4'h8):(3'h5)] ^~ $unsigned(reg258)))),
                  reg285[(1'h1):(1'h0)]};
              reg297 <= reg276;
              reg298 <= ($signed($unsigned($signed(reg278[(5'h13):(4'hb)]))) ?
                  {{reg261}} : ((^~$unsigned($unsigned(reg275))) ?
                      (~|($unsigned((8'ha8)) ? {reg277} : reg284)) : wire246));
              reg299 <= $signed($unsigned(wire254));
            end
          reg300 <= $signed(((({wire247, reg283} ^~ (!wire246)) ?
              $signed($unsigned((8'hb6))) : $unsigned($unsigned(reg295))) * $unsigned(($unsigned((8'hb2)) * reg266))));
          reg301 <= (reg265[(2'h2):(1'h1)] >> $signed({({reg274,
                  reg285} * $unsigned(reg298)),
              ((reg300 ? (8'ha5) : (8'ha8)) >= reg288)}));
        end
      reg302 <= ($unsigned({reg273}) ? reg268 : wire255);
      if (($unsigned(reg289[(1'h1):(1'h1)]) ?
          (^wire248) : reg294[(4'h8):(1'h0)]))
        begin
          reg303 <= {$signed(reg277),
              ((&(wire246[(4'h9):(2'h2)] ? reg276 : $unsigned(reg299))) ?
                  {(~&(8'hb0)),
                      ($signed(reg295) ?
                          wire246 : $unsigned(reg287))} : (~|($unsigned(wire280) ?
                      (wire244 ? reg296 : reg272) : (~^wire248))))};
          if ((!(~^wire246[(4'h8):(3'h5)])))
            begin
              reg304 <= (-reg263);
              reg305 <= ($unsigned((($signed(reg271) ?
                  $signed(reg290) : (reg303 ?
                      (8'hb9) : (8'h9c))) < ($signed(reg267) ?
                  (wire292 | wire246) : $unsigned(reg278)))) >> reg275);
              reg306 <= (reg271[(4'hc):(4'h8)] ? $unsigned(reg273) : reg278);
              reg307 <= (reg278[(1'h1):(1'h1)] ?
                  $unsigned(($signed(wire248[(1'h0):(1'h0)]) ?
                      $unsigned(reg270) : {$unsigned(reg277),
                          $unsigned((8'hb0))})) : $signed((($unsigned(reg259) >= (reg269 * reg274)) ?
                      wire279[(1'h1):(1'h0)] : $unsigned(reg297))));
            end
          else
            begin
              reg304 <= ((~$signed(((wire256 < reg249) ?
                      (!wire254) : reg271[(4'hb):(3'h4)]))) ?
                  ((~{(reg284 ? reg259 : reg271)}) ?
                      reg294 : (8'hb4)) : wire245);
              reg305 <= $signed($signed($unsigned((wire254 ^ reg258[(2'h2):(1'h1)]))));
              reg306 <= ((!reg307[(2'h3):(2'h3)]) < $signed((~&(^~(!reg304)))));
            end
          reg308 <= (reg258[(2'h2):(1'h0)] > ((((wire248 ? reg298 : reg284) ?
              $signed(reg261) : $signed((8'hbf))) != (wire292 || (-reg295))) || (($unsigned(wire292) ?
              (~&reg282) : (&reg290)) >>> reg262[(2'h2):(1'h0)])));
          if (reg294)
            begin
              reg309 <= ($signed(reg282) ?
                  wire292 : ({reg288[(2'h3):(2'h2)],
                      (|(reg253 << reg300))} * {$signed($unsigned(reg272))}));
              reg310 <= $signed($unsigned((reg293 ~^ $signed(reg284))));
              reg311 <= (reg278 * {(^~reg294[(3'h7):(3'h5)])});
              reg312 <= $unsigned($signed(($unsigned((reg259 <= reg269)) ^~ $unsigned((~(8'hac))))));
              reg313 <= wire256[(3'h4):(2'h3)];
            end
          else
            begin
              reg309 <= (($signed($signed(reg270[(4'h9):(4'h8)])) ?
                      ($unsigned((~^reg308)) || ((^~reg305) ?
                          {(8'hb3)} : (wire279 ?
                              wire292 : wire254))) : ((~^reg305) ?
                          wire245 : (+(reg252 == reg295)))) ?
                  ({$signed($unsigned(reg273)),
                          ($unsigned((8'hae)) ?
                              ((8'hae) ? reg313 : reg275) : $signed(wire254))} ?
                      {wire248[(1'h1):(1'h0)]} : reg295[(3'h5):(1'h0)]) : ($signed(((reg306 - reg267) < (reg263 ?
                      reg308 : reg298))) > reg251));
              reg310 <= $unsigned((|$unsigned(reg285[(1'h1):(1'h0)])));
              reg311 <= reg268[(4'ha):(4'h9)];
              reg312 <= $signed((($signed(reg271[(5'h14):(4'hb)]) ?
                  ((-(8'hb8)) + {reg301,
                      (8'hb6)}) : $unsigned((~&reg263))) >>> (8'ha6)));
            end
          reg314 <= ((reg267[(3'h4):(1'h0)] ?
                  ($signed((reg289 ?
                      reg285 : reg249)) << (~{reg270})) : (+{reg287[(4'h8):(1'h1)],
                      $signed((7'h42))})) ?
              ((reg276 ?
                      $signed($unsigned(reg283)) : {((8'h9d) ^~ reg313),
                          (reg285 | reg259)}) ?
                  reg260 : $unsigned({reg294[(4'h8):(3'h5)],
                      $unsigned(reg281)})) : reg297);
        end
      else
        begin
          if ((((-{reg300[(2'h2):(1'h0)]}) ?
                  $signed(wire255[(5'h10):(4'ha)]) : $signed((^(reg253 ~^ reg258)))) ?
              reg282[(2'h3):(1'h0)] : (&(((!reg284) ?
                      (reg260 ? wire254 : wire245) : ((8'ha7) ?
                          reg290 : reg312)) ?
                  {$signed((8'hae))} : (&reg265[(3'h6):(3'h4)])))))
            begin
              reg303 <= (|reg277[(4'ha):(3'h6)]);
            end
          else
            begin
              reg303 <= reg295[(1'h0):(1'h0)];
              reg304 <= ((($signed(reg274) + $unsigned((reg309 <= reg308))) ?
                  (reg268[(4'hc):(4'hb)] - $signed(wire254[(2'h2):(1'h0)])) : reg311[(2'h2):(1'h0)]) <<< $unsigned(((+reg307) ~^ $signed($signed(reg281)))));
              reg305 <= (~$unsigned((8'ha4)));
              reg306 <= {reg314[(3'h4):(1'h0)]};
            end
        end
      reg315 <= reg275[(3'h4):(1'h0)];
    end
  assign wire316 = ({(($unsigned(wire248) ?
                               (^(8'ha4)) : (~|reg284)) ~^ ($unsigned((8'h9e)) <<< $signed((7'h42)))),
                           (8'ha7)} ?
                       ((~&(+(reg267 > reg266))) >> reg301[(4'hd):(3'h5)]) : (~($unsigned(wire245[(3'h4):(1'h0)]) != (&reg271[(1'h1):(1'h0)]))));
  assign wire317 = ((reg294[(3'h6):(1'h1)] ^~ $unsigned($signed($unsigned(reg290)))) == $unsigned(((-$signed(reg301)) == (reg297 ?
                       (reg253 ? reg272 : wire254) : $signed(reg252)))));
  assign wire318 = reg270;
  assign wire319 = {$signed($signed(reg311))};
  assign wire320 = $signed((^~{wire255, (^~{reg308})}));
  assign wire321 = (reg264[(4'h8):(2'h2)] >> (~$signed($unsigned((reg263 ?
                       reg281 : reg260)))));
endmodule

module module225
#(parameter param239 = (~^(8'hae)), 
parameter param240 = {({((param239 <= param239) << param239)} ? ((~|((7'h42) <= param239)) ? (~(param239 ? param239 : param239)) : (param239 ? {param239} : param239)) : {param239, ({param239, (8'hb7)} != (8'hae))}), ((~param239) & (param239 ? (^(param239 ? param239 : param239)) : param239))})
(y, clk, wire230, wire229, wire228, wire227, wire226);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire230;
  input wire [(3'h6):(1'h0)] wire229;
  input wire [(4'hb):(1'h0)] wire228;
  input wire [(5'h14):(1'h0)] wire227;
  input wire [(3'h7):(1'h0)] wire226;
  wire signed [(3'h7):(1'h0)] wire238;
  wire signed [(4'hd):(1'h0)] wire232;
  wire signed [(4'hc):(1'h0)] wire231;
  reg [(3'h4):(1'h0)] reg237 = (1'h0);
  reg [(4'h8):(1'h0)] reg236 = (1'h0);
  reg [(4'hf):(1'h0)] reg235 = (1'h0);
  reg [(2'h2):(1'h0)] reg234 = (1'h0);
  reg [(5'h12):(1'h0)] reg233 = (1'h0);
  assign y = {wire238,
                 wire232,
                 wire231,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 (1'h0)};
  assign wire231 = (({(-(~^wire230)),
                           ({wire230,
                               wire230} <<< {wire229})} >>> (((^~wire229) ?
                           (|wire228) : (8'h9e)) | $unsigned(wire226))) ?
                       $signed((8'hb4)) : (^~{($unsigned(wire229) ?
                               $signed(wire228) : wire229),
                           (~&(wire227 ? wire228 : wire226))}));
  assign wire232 = wire228;
  always
    @(posedge clk) begin
      reg233 <= (~wire226[(1'h1):(1'h1)]);
      reg234 <= wire226[(2'h3):(1'h0)];
      reg235 <= (~|wire232);
      reg236 <= $signed($signed(wire228[(3'h6):(1'h1)]));
      reg237 <= (!(~&reg233[(5'h12):(4'h9)]));
    end
  assign wire238 = $signed((!wire228[(3'h4):(1'h0)]));
endmodule

module module201
#(parameter param212 = (({(~|((8'hac) >>> (8'hb3)))} ? ((+(|(8'hb9))) ~^ ((-(7'h44)) >> {(8'ha5)})) : (((~^(8'hba)) ? (8'hb3) : {(8'ha7)}) ? ((+(8'h9e)) && ((8'hbd) != (8'hb0))) : (~&((8'hab) * (8'hb7))))) ? {(^(8'ha1)), (({(8'hb1), (8'hb0)} ? ((8'hb5) ? (8'hb8) : (7'h41)) : {(8'hb0), (7'h40)}) >> (^(^(8'ha6))))} : (((~^(-(8'hbf))) ? (~&((8'h9d) ? (8'hb2) : (8'had))) : {((8'ha2) ? (8'ha3) : (8'ha4))}) ? (((&(7'h42)) == ((8'ha3) <<< (8'ha0))) ? ((!(8'hbd)) > ((8'ha5) ? (7'h42) : (8'hb7))) : {{(8'h9f), (8'hb5)}, {(8'had), (7'h43)}}) : (~(~((8'hbb) ~^ (8'hbd)))))), 
parameter param213 = ((((^~(-param212)) ? (!(param212 ? (8'ha3) : (8'hab))) : (8'ha1)) ? (((param212 ? param212 : param212) ? param212 : (param212 ? param212 : param212)) != ({param212, param212} ^ {param212})) : (8'ha9)) ? (+(^{(-(8'haf)), (+param212)})) : (|{((8'haa) & ((8'hb1) ? param212 : (8'hab))), {param212}})))
(y, clk, wire206, wire205, wire204, wire203, wire202);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire206;
  input wire [(5'h13):(1'h0)] wire205;
  input wire signed [(2'h3):(1'h0)] wire204;
  input wire [(5'h12):(1'h0)] wire203;
  input wire [(5'h10):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire211;
  wire signed [(5'h15):(1'h0)] wire210;
  wire [(4'hd):(1'h0)] wire207;
  reg [(3'h5):(1'h0)] reg209 = (1'h0);
  reg [(5'h12):(1'h0)] reg208 = (1'h0);
  assign y = {wire211, wire210, wire207, reg209, reg208, (1'h0)};
  assign wire207 = wire203[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg208 <= $unsigned((wire204[(1'h1):(1'h1)] ?
          ($signed(wire205) ?
              (wire203[(4'hc):(4'ha)] <<< (wire206 ?
                  wire207 : wire205)) : $signed({wire204,
                  wire205})) : wire205));
      reg209 <= {{(wire205 ? (-(wire202 ^ wire205)) : (8'ha3)),
              wire206[(3'h5):(2'h3)]}};
    end
  assign wire210 = $signed($unsigned((8'hb9)));
  assign wire211 = (({(|reg208[(2'h2):(1'h1)])} ~^ wire205[(4'hf):(4'ha)]) - {(8'ha1)});
endmodule

module module135
#(parameter param196 = {(((((8'hb9) >>> (8'hbe)) ? (~^(8'hbc)) : ((8'hb4) != (8'hb9))) ? ((~&(8'ha0)) >= ((8'hb7) ? (8'hbe) : (8'hb1))) : ((^(8'ha5)) == {(8'ha0), (8'hb4)})) ? ((&((8'h9c) == (8'hb7))) ? (&{(8'ha4), (8'ha3)}) : (((7'h40) | (8'ha8)) ? ((8'had) && (8'hb6)) : ((8'hb8) ^~ (8'ha4)))) : {(~(|(8'h9e)))}), (((^~(-(8'haf))) ? (~|(^~(8'h9d))) : {((7'h40) || (8'hb3)), (|(8'hb8))}) ? ({((8'had) ? (8'hbd) : (8'hab))} ? (^~((8'hbe) <= (8'ha7))) : ((^(8'ha0)) ? ((8'hb6) > (8'ha6)) : ((8'h9d) ^ (8'h9e)))) : ((!{(8'h9f)}) ? ((~^(8'haa)) + ((8'ha6) ? (8'hae) : (8'h9d))) : (((8'ha3) | (7'h41)) ? {(8'ha5), (7'h42)} : {(8'hbe)})))}, 
parameter param197 = (((param196 * ((8'ha3) ? (param196 ? param196 : param196) : param196)) ? (param196 ? ({param196, param196} > (!param196)) : {(param196 ? param196 : param196), (~&param196)}) : (({param196} ? (param196 ? param196 : param196) : (param196 > param196)) * ((param196 ? param196 : param196) ~^ (param196 <<< param196)))) <= (^~(^(^~(param196 ? param196 : param196))))))
(y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h25e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire140;
  input wire signed [(4'he):(1'h0)] wire139;
  input wire signed [(4'hb):(1'h0)] wire138;
  input wire signed [(4'hb):(1'h0)] wire137;
  input wire signed [(4'hb):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire179;
  wire [(4'h8):(1'h0)] wire178;
  wire signed [(4'hc):(1'h0)] wire177;
  wire signed [(4'hf):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire171;
  wire [(5'h11):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire [(4'he):(1'h0)] wire152;
  wire signed [(4'ha):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire149;
  wire signed [(4'hc):(1'h0)] wire145;
  reg signed [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(4'hb):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'hb):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  assign y = {wire195,
                 wire179,
                 wire178,
                 wire177,
                 wire174,
                 wire173,
                 wire171,
                 wire170,
                 wire169,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire145,
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
                 reg176,
                 reg175,
                 reg172,
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
                 reg154,
                 reg153,
                 reg148,
                 reg147,
                 reg146,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg141 <= (wire138[(2'h2):(1'h1)] ?
          ($unsigned((wire140 ? $unsigned(wire138) : $unsigned(wire138))) ?
              wire140[(2'h3):(1'h0)] : $unsigned($signed((wire139 ?
                  wire136 : wire136)))) : wire138);
      reg142 <= $signed(((^wire140) ?
          ((|{wire136}) ?
              wire140 : {(wire136 + reg141),
                  $unsigned(wire137)}) : $unsigned(wire138[(2'h2):(1'h0)])));
      reg143 <= ($unsigned($signed($unsigned(reg141[(2'h3):(2'h2)]))) != (wire137[(3'h5):(2'h2)] ^~ $signed((reg141 & (~wire138)))));
      reg144 <= ((~|(~({(7'h40), (8'hbd)} ? (|wire140) : $signed(wire138)))) ?
          {reg142, reg141[(1'h1):(1'h0)]} : ((wire140[(5'h11):(4'hb)] ?
                  reg143 : (|$unsigned(wire136))) ?
              reg143[(1'h0):(1'h0)] : wire137[(2'h2):(1'h1)]));
    end
  assign wire145 = (8'hae);
  always
    @(posedge clk) begin
      reg146 <= reg141[(1'h0):(1'h0)];
      reg147 <= $unsigned((($unsigned(wire139) ?
              (7'h43) : reg142[(1'h1):(1'h1)]) ?
          (~|$signed((^~reg144))) : ($signed((wire136 ?
              reg143 : wire138)) < $unsigned(((8'ha4) ? reg146 : (8'hbd))))));
      reg148 <= $unsigned($signed(((reg144[(2'h2):(1'h0)] ?
          $signed(reg141) : $signed(reg144)) ^ $unsigned((wire137 ?
          reg146 : reg144)))));
    end
  assign wire149 = (reg143[(3'h4):(1'h1)] ? reg143[(2'h2):(2'h2)] : reg146);
  assign wire150 = $unsigned(({reg146} ? wire139[(3'h7):(1'h1)] : wire140));
  assign wire151 = wire136;
  assign wire152 = ($signed(({(&(8'hbf))} ?
                       (wire149 < wire149) : ((wire137 ?
                           (8'ha4) : wire139) >= wire137))) - $signed((($unsigned((8'ha2)) || {wire136}) & ((reg144 ?
                       wire137 : wire145) ~^ $unsigned(reg142)))));
  always
    @(posedge clk) begin
      if ($unsigned(((({wire139} + (8'hb4)) - {reg148[(1'h1):(1'h0)]}) ?
          (wire136[(3'h6):(1'h0)] || (((8'hb8) & reg141) ?
              reg143 : (wire145 >= (7'h44)))) : $signed(reg146))))
        begin
          if (($unsigned($unsigned(wire145[(3'h5):(2'h2)])) << reg147[(3'h7):(3'h7)]))
            begin
              reg153 <= $unsigned($unsigned(((wire151 ?
                      {(7'h43)} : (reg147 ? wire137 : (8'hbb))) ?
                  {(wire137 ?
                          reg146 : reg146)} : $unsigned($signed(wire140)))));
              reg154 <= (-wire138);
              reg155 <= ($signed((^(!wire137))) - reg144[(2'h3):(1'h0)]);
            end
          else
            begin
              reg153 <= wire140;
              reg154 <= reg143[(1'h0):(1'h0)];
              reg155 <= reg153;
              reg156 <= {$signed($unsigned({$signed(reg153),
                      (wire137 <= wire137)})),
                  (+(+($unsigned(wire145) ?
                      (~^reg148) : ((8'ha1) ? wire137 : (8'h9d)))))};
            end
          reg157 <= wire138[(2'h3):(2'h3)];
          reg158 <= (8'hbc);
          reg159 <= ((8'h9c) != $unsigned((-{wire139})));
        end
      else
        begin
          if ($unsigned((8'hbb)))
            begin
              reg153 <= $signed($unsigned((~^((+reg147) ?
                  (reg154 ? reg159 : (8'ha1)) : wire151))));
              reg154 <= {((reg148[(3'h6):(3'h5)] && $unsigned($unsigned(reg144))) > reg158[(4'hc):(4'h8)])};
              reg155 <= $signed({(8'h9f),
                  $unsigned($unsigned($signed(reg156)))});
            end
          else
            begin
              reg153 <= wire136;
              reg154 <= reg158;
            end
        end
      reg160 <= (&(+$signed($signed($unsigned(reg141)))));
      reg161 <= ($unsigned({({reg144} ? wire149[(2'h3):(1'h0)] : (-wire137))}) ?
          $unsigned(reg153) : $signed((!$unsigned(wire139))));
      if ({$signed({$signed({wire136, reg161}),
              ((reg155 && wire152) ? $unsigned(reg157) : (^reg157))}),
          $signed((&($signed(wire137) ? {reg158} : $signed(wire136))))})
        begin
          reg162 <= (-$signed(reg157));
          reg163 <= (&reg146);
        end
      else
        begin
          reg162 <= wire138;
          reg163 <= (reg156[(4'h9):(1'h1)] > {($unsigned((reg156 ?
                  reg162 : wire137)) ^ ($signed((8'h9c)) > (wire140 != reg144)))});
          if ((wire151 * wire140))
            begin
              reg164 <= reg160[(4'h8):(1'h0)];
              reg165 <= (reg162 >> reg155[(3'h6):(1'h1)]);
            end
          else
            begin
              reg164 <= (($unsigned(((7'h44) ?
                      wire149[(1'h1):(1'h1)] : ((8'hae) ? wire150 : wire150))) ?
                  ($signed(reg158[(4'hd):(3'h6)]) ?
                      $unsigned((reg154 ?
                          wire145 : (8'ha4))) : (((8'hb0) + wire145) ?
                          reg148 : (-reg161))) : $unsigned((reg153[(1'h0):(1'h0)] > reg164[(4'h9):(1'h1)]))) << wire136);
              reg165 <= (reg162[(4'h8):(1'h1)] == $unsigned(({{(8'hb1)}} ?
                  reg159 : $unsigned((!reg158)))));
            end
          reg166 <= $unsigned(reg154);
          reg167 <= $unsigned(reg154[(2'h3):(1'h1)]);
        end
      reg168 <= ({reg148[(3'h6):(2'h3)]} ? wire139 : wire145[(4'h9):(4'h9)]);
    end
  assign wire169 = reg141[(2'h2):(2'h2)];
  assign wire170 = {(reg147 ?
                           $unsigned(((wire152 >>> reg154) ?
                               $signed((8'ha2)) : $signed((8'hb6)))) : wire138[(4'h9):(2'h2)])};
  assign wire171 = $signed($signed(($signed(reg156) == (reg141 ?
                       $unsigned((8'hb9)) : (~^(8'had))))));
  always
    @(posedge clk) begin
      reg172 <= reg161[(1'h0):(1'h0)];
    end
  assign wire173 = (!(^reg146[(1'h0):(1'h0)]));
  assign wire174 = reg148[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      reg175 <= $unsigned(($unsigned((reg144[(2'h3):(2'h3)] - $signed(wire171))) + (~^$signed($signed(reg146)))));
      reg176 <= {{wire136[(4'hb):(1'h0)], (&$unsigned(reg166[(4'ha):(1'h0)]))}};
    end
  assign wire177 = reg161[(3'h4):(2'h2)];
  assign wire178 = {($unsigned((~&wire152[(3'h4):(3'h4)])) + (((reg164 >> reg143) ?
                           $unsigned((8'hbb)) : (reg161 ^~ reg147)) - {$unsigned(reg175),
                           wire171[(3'h6):(2'h2)]}))};
  assign wire179 = wire139[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg180 <= (^$signed({reg143[(1'h0):(1'h0)]}));
      reg181 <= reg164[(1'h0):(1'h0)];
      reg182 <= $signed(reg153);
      if (($unsigned((8'ha0)) - ($signed((~|$unsigned(wire170))) ?
          wire151[(2'h3):(2'h2)] : $unsigned((reg148 == $unsigned((8'hbd)))))))
        begin
          if (reg167[(3'h7):(3'h5)])
            begin
              reg183 <= reg167[(3'h4):(3'h4)];
            end
          else
            begin
              reg183 <= reg158;
              reg184 <= reg154[(2'h2):(1'h1)];
              reg185 <= $unsigned($unsigned(wire136));
              reg186 <= wire169[(1'h1):(1'h1)];
            end
          reg187 <= ($signed((($unsigned(wire137) ?
              wire138[(3'h6):(2'h3)] : (wire169 >>> wire145)) >> (8'h9e))) ^ (~^($signed(((8'hb6) > wire173)) ?
              reg167 : $signed((wire178 ? wire174 : reg144)))));
        end
      else
        begin
          reg183 <= reg172[(4'ha):(4'h8)];
          if ((($signed($unsigned((8'had))) ?
              $unsigned(reg142) : $unsigned($unsigned((|reg162)))) <<< $signed($signed((^(reg181 ?
              reg142 : wire179))))))
            begin
              reg184 <= {{wire152}};
              reg185 <= $unsigned((wire139[(2'h2):(2'h2)] << reg167));
              reg186 <= wire138[(3'h4):(1'h1)];
              reg187 <= (~&($signed((~(~reg158))) >= (8'hb9)));
            end
          else
            begin
              reg184 <= reg142[(1'h0):(1'h0)];
              reg185 <= $signed(($unsigned(reg144[(2'h2):(2'h2)]) ?
                  ($unsigned((+reg158)) ^~ reg164) : (wire152 ~^ $unsigned((wire140 ?
                      wire150 : (7'h41))))));
              reg186 <= wire170[(4'hb):(3'h4)];
              reg187 <= reg159[(3'h6):(2'h3)];
              reg188 <= ({$unsigned({{wire136},
                      wire169})} != reg147[(1'h0):(1'h0)]);
            end
          reg189 <= $signed({$unsigned(reg163)});
          reg190 <= reg157;
          if (reg153[(1'h0):(1'h0)])
            begin
              reg191 <= ($unsigned($signed(reg167)) >> $signed((8'hb6)));
              reg192 <= reg146[(3'h5):(2'h2)];
              reg193 <= ($unsigned($unsigned((~&$unsigned(reg157)))) ?
                  {$signed(((!wire170) > reg175[(3'h4):(3'h4)])),
                      $signed(($unsigned(wire137) + $signed(reg168)))} : wire137[(3'h6):(3'h4)]);
            end
          else
            begin
              reg191 <= ((({{reg164}} ?
                      ((^reg153) << (wire179 * reg189)) : {wire136}) ?
                  wire173 : ((~&reg166) ?
                      $signed(((8'hbd) || wire152)) : reg159)) ~^ (~|wire152));
              reg192 <= ((((8'h9f) & (reg180[(4'ha):(4'h9)] << wire171)) ?
                      (wire178[(3'h7):(1'h0)] ?
                          reg176 : ($signed(reg163) << (reg161 ?
                              reg191 : wire177))) : $signed($unsigned((~|wire178)))) ?
                  $unsigned((reg184[(1'h1):(1'h0)] >> reg185)) : {(~({wire150,
                          wire152} ^~ (-(8'hb5)))),
                      wire171[(2'h3):(2'h2)]});
              reg193 <= (reg192 ?
                  {wire140} : $unsigned($unsigned(($unsigned(reg159) ?
                      reg159[(5'h10):(4'h9)] : ((8'ha8) ? (8'hbc) : reg190)))));
              reg194 <= (~^({$unsigned((wire152 ? reg163 : wire149))} ?
                  $signed($unsigned(reg147[(4'hb):(3'h7)])) : ($unsigned(wire151) ^ ((reg191 ?
                          reg161 : (7'h41)) ?
                      reg184 : ((8'hb6) ? reg192 : reg181)))));
            end
        end
    end
  assign wire195 = $signed((^(~(!reg154))));
endmodule

module module68
#(parameter param123 = ({({((8'hbb) ? (8'haa) : (8'hb4))} * (|((7'h42) ? (8'hb0) : (8'hac)))), (((^(8'ha7)) ? {(8'ha8), (8'hb1)} : ((7'h40) ? (8'ha0) : (8'hb2))) ? ((~(8'ha3)) >>> ((8'hb4) ? (8'haa) : (8'ha9))) : (~^((8'hb1) ? (8'ha3) : (8'hb2))))} - (|(!(((7'h40) ? (8'hbf) : (8'haa)) ? ((7'h40) != (8'hb3)) : ((8'hb0) > (8'hac)))))))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h215):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire72;
  input wire signed [(5'h10):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  input wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire113;
  wire [(2'h2):(1'h0)] wire112;
  wire [(5'h10):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire109;
  wire [(3'h4):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
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
                 reg88,
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
                 (1'h0)};
  assign wire73 = $signed(wire72);
  assign wire74 = $signed(wire72[(2'h3):(1'h1)]);
  assign wire75 = {$unsigned($signed(wire74)),
                      ((wire70[(1'h1):(1'h0)] ?
                          (~&(~wire70)) : ((|wire74) ?
                              ((8'hb5) | wire73) : wire74[(3'h4):(3'h4)])) <<< {$unsigned((|wire72)),
                          {(^wire73)}})};
  assign wire76 = wire72;
  assign wire77 = $unsigned($signed((^$unsigned($unsigned(wire75)))));
  always
    @(posedge clk) begin
      if (((($signed(wire77) ?
          (-$signed(wire73)) : $unsigned($signed(wire75))) != ((~(~|wire75)) ?
          (wire72[(4'h8):(3'h4)] ~^ $unsigned(wire76)) : wire74)) <<< wire72))
        begin
          reg78 <= wire76;
          reg79 <= (($unsigned((-wire71)) ?
              ((&wire76[(2'h3):(2'h2)]) ?
                  (~&$unsigned((8'hb4))) : $unsigned((-wire70))) : (({wire71} ~^ $unsigned(wire75)) ?
                  wire70 : ($signed(wire72) == $signed(wire70)))) >= (~^wire71[(2'h3):(1'h1)]));
          reg80 <= (((((wire69 ? wire77 : wire74) ?
                      wire72[(2'h3):(2'h2)] : wire70) + {{wire70},
                      (wire76 ? wire72 : wire71)}) ?
                  $unsigned(wire74) : (~&wire74)) ?
              $unsigned(wire70[(3'h5):(1'h1)]) : wire75);
          reg81 <= $signed({(({wire73, wire71} ?
                  (reg80 & wire72) : (wire74 >>> wire70)) << wire75),
              (8'hbd)});
          reg82 <= wire70;
        end
      else
        begin
          if (wire70[(1'h0):(1'h0)])
            begin
              reg78 <= $signed({wire74});
              reg79 <= $signed(reg80[(2'h2):(2'h2)]);
              reg80 <= reg80;
              reg81 <= (8'hb3);
            end
          else
            begin
              reg78 <= {(^$signed($unsigned($unsigned(wire72))))};
            end
          reg82 <= wire71;
          reg83 <= (~^$signed({(((8'hb4) ? wire76 : wire70) ?
                  $unsigned((8'ha8)) : wire74)}));
        end
      if ($unsigned((wire74[(2'h2):(1'h1)] - $unsigned(wire70[(1'h0):(1'h0)]))))
        begin
          reg84 <= ($unsigned((&(8'ha1))) <= wire69[(3'h6):(3'h4)]);
          reg85 <= {{$signed($signed(reg79)),
                  ($signed($unsigned((8'ha7))) & ($unsigned(reg79) <= (wire73 && reg82)))}};
          reg86 <= ($signed(($signed((wire71 ^ wire72)) ?
              (8'hb2) : (7'h41))) && wire72[(3'h7):(3'h5)]);
        end
      else
        begin
          if ((wire72[(2'h3):(2'h2)] & $unsigned(((+wire71[(4'hf):(3'h4)]) >> wire77[(1'h0):(1'h0)]))))
            begin
              reg84 <= ((reg78[(3'h7):(2'h2)] >= reg81) ?
                  $signed(($signed((reg85 & wire72)) ~^ $unsigned((reg84 || reg84)))) : $unsigned((~&$signed(((8'ha4) ?
                      reg85 : (8'ha5))))));
              reg85 <= (8'h9f);
              reg86 <= $signed(wire69[(4'hd):(2'h2)]);
              reg87 <= $signed((($signed(wire76) ?
                      (8'had) : $unsigned((wire70 ^ wire77))) ?
                  $signed(($unsigned(reg82) * wire71)) : {{$unsigned(wire76)}}));
            end
          else
            begin
              reg84 <= wire77[(2'h3):(1'h1)];
            end
          if (((|((~(7'h44)) * wire76[(3'h4):(1'h1)])) && ($unsigned(($signed(reg83) - (wire71 == wire74))) ?
              ({$unsigned(wire74), (reg87 ^ wire74)} >>> ((reg83 ?
                  reg87 : (8'ha4)) < $unsigned(wire69))) : {((7'h44) ?
                      (reg84 <= wire76) : (wire69 ? wire74 : wire71)),
                  ($signed(wire73) ? (~&(8'ha2)) : $signed(wire77))})))
            begin
              reg88 <= {({$unsigned((reg80 << wire70))} + ($signed($unsigned(wire73)) <<< ($unsigned((8'hb5)) < (wire69 ?
                      (8'hb9) : wire72))))};
              reg89 <= wire70[(2'h3):(1'h0)];
              reg90 <= $unsigned((8'ha7));
              reg91 <= $signed(reg79[(2'h2):(1'h1)]);
              reg92 <= wire77;
            end
          else
            begin
              reg88 <= ({(|(!(reg90 ^ wire70))),
                  {((reg88 ? wire77 : reg78) <= reg81),
                      ((7'h44) < $unsigned((8'ha7)))}} >>> (8'hb8));
              reg89 <= $unsigned((reg89[(4'hc):(2'h2)] ?
                  (&((|wire69) + reg80[(1'h1):(1'h0)])) : $signed((reg90[(3'h7):(1'h1)] ?
                      reg88[(2'h2):(1'h0)] : reg85[(2'h2):(2'h2)]))));
              reg90 <= (8'ha6);
            end
        end
      if (wire71[(4'hd):(4'h9)])
        begin
          if (wire75)
            begin
              reg93 <= wire75[(3'h5):(1'h0)];
              reg94 <= {((reg86 ?
                      reg89 : ($signed(reg91) ?
                          {reg93, reg83} : (-reg90))) == (~((reg83 ?
                          reg88 : reg82) ?
                      (reg85 ^~ wire73) : (wire73 ? (8'hb5) : reg86))))};
            end
          else
            begin
              reg93 <= reg89;
              reg94 <= reg93[(5'h11):(4'hf)];
            end
        end
      else
        begin
          reg93 <= reg80[(2'h2):(1'h1)];
          reg94 <= (wire69 ?
              wire73 : $signed((~^(reg83 ?
                  ((8'h9f) >>> (8'h9f)) : wire70[(1'h1):(1'h0)]))));
          reg95 <= (!reg80[(3'h4):(3'h4)]);
          reg96 <= (+(~(~&$unsigned(reg89[(3'h4):(1'h1)]))));
        end
      if ((+$unsigned($unsigned(wire69[(4'h9):(3'h6)]))))
        begin
          reg97 <= ($signed(($unsigned(((8'ha4) ?
                  reg78 : reg79)) >= ($unsigned(reg94) ?
                  (wire69 <<< reg90) : (wire76 * reg90)))) ?
              (!$signed($signed(wire70))) : (+reg84));
          reg98 <= {(8'hbd)};
          reg99 <= {(^~(reg84[(2'h3):(1'h0)] ?
                  $signed(reg95[(4'hf):(4'he)]) : {reg89, reg85}))};
          reg100 <= $unsigned($unsigned({(~^(!wire73)),
              {((8'ha0) ? (7'h42) : reg78), (8'ha3)}}));
        end
      else
        begin
          if ({(((reg88 ?
                  reg94[(2'h3):(1'h1)] : (~&reg88)) <<< $signed(reg99)) ^ (8'ha9)),
              (~$unsigned($signed($signed((8'h9c)))))})
            begin
              reg97 <= ((reg82[(1'h0):(1'h0)] ?
                      (((reg79 ? (8'hba) : reg95) ?
                              $unsigned(reg84) : (reg91 | reg80)) ?
                          (^~reg87) : reg92) : (|{(reg97 ? reg92 : wire71),
                          (wire73 ? reg93 : reg84)})) ?
                  $signed((^~$unsigned($signed(wire75)))) : {(!$signed((!reg99))),
                      $unsigned(reg85)});
              reg98 <= $unsigned($unsigned($unsigned($signed((~|reg97)))));
              reg99 <= wire71[(4'he):(4'he)];
              reg100 <= reg100[(1'h1):(1'h0)];
            end
          else
            begin
              reg97 <= wire71[(2'h3):(2'h3)];
              reg98 <= (~&($signed(((reg97 ? reg90 : wire73) << (reg81 ?
                      reg82 : wire74))) ?
                  ($signed(wire69[(2'h2):(1'h1)]) + $signed((^~wire76))) : reg84[(5'h12):(4'h9)]));
              reg99 <= (~&wire72);
            end
          reg101 <= $unsigned({$signed((|((7'h43) ? reg86 : reg82))),
              $signed((~|$signed(reg98)))});
        end
    end
  always
    @(posedge clk) begin
      reg102 <= ((((+(reg98 - reg82)) * ((~(8'ha3)) ^~ reg89[(2'h3):(1'h1)])) && (((wire71 ?
                  reg93 : reg92) ?
              (reg98 == reg90) : (&(8'hac))) ?
          {$unsigned(reg87), reg78} : reg81[(1'h0):(1'h0)])) << reg99);
      if ({$unsigned($unsigned({(~^reg86), reg96[(3'h5):(1'h1)]})),
          reg101[(1'h1):(1'h0)]})
        begin
          reg103 <= {wire75,
              {reg86, (reg90 | $unsigned(reg84[(4'h9):(2'h2)]))}};
          reg104 <= (&wire69[(1'h0):(1'h0)]);
          if (((wire71[(3'h7):(3'h7)] + ((^~(reg91 ^ wire69)) == reg97)) > ((~(wire76[(1'h1):(1'h0)] ?
                  reg97 : (+(8'hb2)))) ?
              ((|$unsigned(reg87)) ^ reg97[(2'h3):(1'h1)]) : wire73)))
            begin
              reg105 <= $unsigned((((~|(^reg97)) ? reg89 : reg93) ?
                  $unsigned({(8'hae)}) : $signed((!(reg82 < reg99)))));
            end
          else
            begin
              reg105 <= $signed(wire76);
              reg106 <= $unsigned(wire71);
            end
          reg107 <= {(wire77[(1'h0):(1'h0)] ?
                  (~^($signed(wire75) ?
                      reg94 : (wire73 ? reg103 : (8'h9f)))) : wire70)};
          reg108 <= $signed((8'hbc));
        end
      else
        begin
          reg103 <= {($unsigned(wire71[(4'h8):(2'h3)]) ?
                  $unsigned(reg90) : reg94[(2'h2):(1'h0)])};
          if ((^~$signed({$signed($signed(wire75))})))
            begin
              reg104 <= ($unsigned($unsigned((8'hb3))) ?
                  {(((reg92 | wire76) ?
                          $signed(reg102) : (reg91 ?
                              reg81 : (7'h41))) + (((8'hb2) != (7'h40)) ?
                          {reg81} : (reg83 ?
                              reg78 : wire76)))} : $unsigned(((|(|reg96)) ?
                      ((|reg90) >> reg107[(1'h1):(1'h1)]) : $signed(((7'h42) >>> reg106)))));
              reg105 <= $unsigned({(((wire77 ? reg88 : reg81) ?
                      (8'hb0) : $signed(reg98)) * (~&reg82)),
                  $unsigned((&(reg93 ? reg86 : reg100)))});
              reg106 <= ($unsigned((-reg92)) == reg79);
              reg107 <= ({reg107} ^~ reg79);
            end
          else
            begin
              reg104 <= wire72[(1'h1):(1'h1)];
              reg105 <= {($signed(((reg88 * reg94) + $unsigned(wire69))) > $unsigned(($unsigned(reg96) ?
                      reg87[(4'ha):(4'h9)] : wire77)))};
            end
          reg108 <= (reg95 ?
              (reg96[(1'h1):(1'h0)] ?
                  ((reg98[(3'h7):(2'h3)] * (~|reg89)) + {(reg87 || reg85),
                      {reg105,
                          wire76}}) : reg83) : $unsigned((~&($signed(wire72) ?
                  reg78 : (~^reg91)))));
        end
    end
  assign wire109 = wire74;
  assign wire110 = $signed($signed(reg100[(1'h1):(1'h0)]));
  assign wire111 = ($unsigned(reg80[(3'h4):(1'h1)]) ~^ reg89[(1'h1):(1'h0)]);
  assign wire112 = $unsigned((~&(($signed(reg101) ^ (reg97 && wire73)) >>> {(-reg95)})));
  assign wire113 = ((^(8'hbc)) == ($signed($signed({wire109,
                       wire72})) && (&((wire77 ?
                       reg102 : reg101) && $signed((8'hb6))))));
  always
    @(posedge clk) begin
      reg114 <= ({(reg100[(1'h1):(1'h0)] >>> ($unsigned(wire69) ?
              $signed(wire73) : {reg101})),
          (reg90[(2'h3):(2'h3)] ? wire77 : reg98)} ^ $unsigned($signed(((reg98 ?
              reg97 : reg102) ?
          $signed(reg105) : reg97[(1'h1):(1'h0)]))));
      reg115 <= (wire112 ?
          reg94[(2'h2):(1'h1)] : $signed((+$signed((|reg108)))));
      reg116 <= $unsigned(reg96[(2'h3):(1'h1)]);
      reg117 <= wire77[(2'h2):(1'h0)];
      reg118 <= ({(reg108 << reg102)} <<< wire71);
    end
  assign wire119 = ((reg98[(3'h4):(2'h3)] ?
                       (reg80[(3'h5):(1'h1)] ?
                           $signed($unsigned((8'hb4))) : (8'hbf)) : {($signed(reg89) ?
                               (reg91 ?
                                   reg117 : (8'hb9)) : {wire109})}) || $unsigned(wire110[(1'h1):(1'h1)]));
  assign wire120 = $signed(wire71[(1'h1):(1'h1)]);
  assign wire121 = (((((8'had) ? $unsigned(wire73) : (|reg103)) ?
                           $signed((reg88 >> wire77)) : $signed(wire73[(3'h4):(1'h1)])) * wire113) ?
                       $unsigned(reg108[(1'h1):(1'h0)]) : reg106);
  assign wire122 = ($signed(reg94[(1'h0):(1'h0)]) >>> $signed(wire119));
endmodule
