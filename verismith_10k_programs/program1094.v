module top
#(parameter param108 = ((^~(({(8'ha4)} ? {(8'hae), (7'h42)} : ((7'h41) ? (8'haa) : (8'hbb))) ? {{(8'ha2), (7'h40)}} : {((8'hb6) - (8'hbd)), ((7'h42) ~^ (8'hb1))})) ^~ (~(~|(~(&(8'hb1)))))), 
parameter param109 = (((param108 ? ((param108 && param108) ^~ (param108 ? (8'ha5) : param108)) : (!((8'ha0) > param108))) - ((param108 ? (param108 ^~ param108) : (param108 ? param108 : param108)) ? {(param108 >= (8'hb6))} : (~(param108 <<< param108)))) ? (+(param108 & ((param108 >> (8'ha1)) == (~^(7'h42))))) : (param108 >>> (((^~param108) < (!param108)) ? (~|(|(8'hb7))) : (^~{param108, param108})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire36;
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  assign y = {wire101,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  module4 #() modinst37 (.wire8(wire3), .wire7(wire1), .wire6(wire0), .wire5(wire2), .clk(clk), .y(wire36));
  assign wire38 = $signed(wire3);
  assign wire39 = $signed($signed($unsigned($unsigned(wire3))));
  assign wire40 = (^~wire2);
  assign wire41 = $unsigned((wire1[(4'h9):(4'h9)] | ({$signed(wire38)} ?
                      (wire1 >> wire39) : (-$signed(wire0)))));
  assign wire42 = ((~|({(wire3 > (8'ha6))} ?
                          wire1[(2'h3):(1'h0)] : (wire3 && wire1[(3'h6):(3'h5)]))) ?
                      wire40 : $signed($unsigned(((-wire36) ?
                          wire36[(3'h5):(1'h0)] : (wire38 ?
                              (8'ha6) : wire39)))));
  assign wire43 = wire39[(2'h3):(2'h3)];
  assign wire44 = wire40;
  assign wire45 = (|($signed(wire42) <= (wire38[(5'h14):(5'h13)] || ($unsigned(wire41) + wire2))));
  assign wire46 = (((~&wire0) << wire3) ?
                      ($signed((~&wire38)) ?
                          (((-wire44) * wire41) || $signed((wire3 >= wire1))) : wire36) : {(8'ha8)});
  assign wire47 = $unsigned($unsigned(wire46));
  assign wire48 = (wire41[(4'h8):(4'h8)] != (wire40[(3'h5):(3'h5)] | (+{wire39[(2'h3):(2'h3)],
                      $unsigned(wire40)})));
  module49 #() modinst102 (wire101, clk, wire44, wire45, wire40, wire1);
  always
    @(posedge clk) begin
      reg103 <= (-$signed($unsigned((wire42[(4'h8):(2'h3)] + ((8'hb7) > (8'hab))))));
      reg104 <= wire45;
      reg105 <= (wire39[(3'h6):(3'h4)] ?
          wire41[(4'hc):(2'h3)] : {($signed(((8'hbf) ?
                  wire36 : wire0)) << ($signed(reg104) >>> wire43))});
      reg106 <= (~(8'hb6));
      reg107 <= $unsigned(((|($signed(wire46) > {reg103,
          wire48})) ~^ wire36[(2'h3):(2'h3)]));
    end
endmodule

module module49
#(parameter param100 = {(((^(&(8'haf))) * (((8'ha3) << (8'hbd)) ? ((8'ha3) * (8'hbe)) : (!(8'ha1)))) ~^ ((~^(8'hbd)) & ((~(8'hb6)) && ((8'had) ? (7'h42) : (8'h9c)))))})
(y, clk, wire50, wire51, wire52, wire53);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire52;
  input wire signed [(4'ha):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire56;
  wire [(2'h3):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire98;
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire65,
                 wire98,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 (1'h0)};
  assign wire54 = wire52;
  assign wire55 = $signed((({wire51, wire50} >> wire51) ?
                      wire51[(3'h7):(2'h2)] : (8'ha9)));
  assign wire56 = ($signed($signed((^~(wire52 ? wire53 : wire51)))) ?
                      wire53[(3'h4):(1'h1)] : wire51);
  assign wire57 = $signed((wire55[(2'h3):(1'h0)] ?
                      $signed(($unsigned((8'hb8)) << $unsigned(wire53))) : wire56[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed(wire50[(1'h1):(1'h1)]))
        begin
          reg58 <= (^~$signed((wire51[(2'h2):(1'h0)] ?
              wire54[(1'h0):(1'h0)] : wire53)));
          reg59 <= wire53;
          reg60 <= (~^(-wire52[(4'ha):(3'h5)]));
          reg61 <= reg59;
          reg62 <= (~&wire56);
        end
      else
        begin
          reg58 <= reg58;
        end
      reg63 <= ($unsigned((reg58 ? (~^(^wire52)) : (~|reg60))) - (!(({wire52,
              (8'hae)} || $unsigned(reg58)) ?
          ($signed(reg62) + reg62[(4'ha):(4'ha)]) : {(wire50 && reg60)})));
      reg64 <= (^$signed(wire56));
    end
  assign wire65 = (~|reg63[(1'h1):(1'h1)]);
  module66 #() modinst99 (wire98, clk, wire55, wire53, wire56, reg59);
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(2'h3):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = ((&wire5[(2'h2):(2'h2)]) ?
                     wire7[(1'h1):(1'h1)] : wire8[(2'h2):(1'h1)]);
  assign wire10 = (|$unsigned(wire5[(2'h3):(1'h1)]));
  assign wire11 = (!(&($unsigned($signed(wire7)) <<< ($signed(wire10) ?
                      wire5[(2'h3):(2'h3)] : ((8'ha0) || wire8)))));
  assign wire12 = ((~&$signed(({wire10, wire11} ? wire8 : (^~wire5)))) ?
                      (~^wire5[(1'h0):(1'h0)]) : wire8[(1'h1):(1'h0)]);
  assign wire13 = wire8[(2'h2):(1'h0)];
  assign wire14 = (~^wire6);
  assign wire15 = wire7[(3'h4):(2'h2)];
  module16 #() modinst30 (.y(wire29), .wire20(wire9), .wire19(wire10), .clk(clk), .wire17(wire14), .wire18(wire15));
  assign wire31 = $unsigned($signed((($signed(wire11) ?
                      $signed((8'haa)) : wire12[(4'h8):(3'h5)]) >>> wire6)));
  assign wire32 = ((~$unsigned((|{(8'haf), wire10}))) | (wire13 ?
                      ((&(wire31 | wire6)) * $signed((~&(8'hac)))) : $signed(wire9[(4'h9):(4'h9)])));
  assign wire33 = wire9[(5'h10):(4'h8)];
  assign wire34 = ({wire9[(2'h3):(2'h3)]} << (((wire10[(2'h3):(2'h3)] ^~ wire32) * ($unsigned(wire10) ?
                          (!(8'hac)) : (~|wire11))) ?
                      wire15[(3'h7):(1'h1)] : wire11[(3'h5):(2'h3)]));
  assign wire35 = wire5;
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire28,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg27,
                 (1'h0)};
  assign wire21 = wire18;
  assign wire22 = ($unsigned(wire19) ?
                      wire20[(4'hd):(4'hd)] : wire18[(2'h2):(2'h2)]);
  assign wire23 = (wire18[(3'h5):(1'h0)] ?
                      $signed($unsigned(wire20)) : wire17[(3'h4):(2'h2)]);
  assign wire24 = wire17;
  assign wire25 = (~&(~^$signed(wire21)));
  assign wire26 = (8'hb3);
  always
    @(posedge clk) begin
      reg27 <= wire26[(3'h5):(1'h1)];
    end
  assign wire28 = wire23;
endmodule

module module66
#(parameter param97 = (~&(~&{((-(7'h44)) ^ (8'hae)), (((8'h9d) ? (8'hb5) : (8'hb1)) * (!(8'had)))})))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire70;
  input wire signed [(3'h7):(1'h0)] wire69;
  input wire [(4'hf):(1'h0)] wire68;
  input wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire71;
  reg [(2'h2):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  assign y = {wire96,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire71 = wire69;
  always
    @(posedge clk) begin
      if (wire68[(4'h9):(3'h4)])
        begin
          reg72 <= $signed($unsigned((|$unsigned(wire71))));
          reg73 <= ($unsigned($unsigned((!(wire68 != (8'hbc))))) ?
              wire68 : ({((reg72 ? reg72 : wire70) <= wire68[(4'h8):(1'h0)]),
                  ((wire71 | wire67) ?
                      wire71 : $signed(wire70))} > (wire70[(1'h0):(1'h0)] != (~^$signed((8'had))))));
          if ((|((~(wire69[(2'h3):(2'h3)] ?
              ((8'ha8) ? wire70 : reg73) : {wire71, wire70})) != {wire69})))
            begin
              reg74 <= wire71[(1'h0):(1'h0)];
              reg75 <= $unsigned(wire71);
            end
          else
            begin
              reg74 <= $unsigned((wire71 ?
                  {((^wire68) ~^ (wire67 * wire68)),
                      wire69[(3'h6):(1'h1)]} : ($signed($unsigned(reg75)) ?
                      wire68[(4'hc):(3'h5)] : $signed((reg75 ?
                          reg73 : wire68)))));
              reg75 <= ($unsigned(wire68[(4'hb):(2'h3)]) ?
                  reg72 : reg72[(3'h5):(1'h0)]);
            end
          if (($signed({reg75[(4'ha):(1'h0)], $signed($unsigned(reg72))}) ?
              ({((8'hb4) >= $signed(wire68)),
                      $unsigned((reg74 ? reg74 : wire71))} ?
                  $signed({(|wire70)}) : $signed({(^wire69)})) : $signed((+(~wire70[(4'he):(4'hb)])))))
            begin
              reg76 <= wire71;
              reg77 <= $unsigned($signed(wire69[(3'h4):(1'h1)]));
            end
          else
            begin
              reg76 <= {{({(~&reg75), reg72} & reg77)},
                  {$unsigned((|(reg75 ? (8'hb5) : wire67))),
                      (^$unsigned($unsigned((8'hbc))))}};
              reg77 <= $signed((|(~^$signed((8'ha4)))));
            end
          reg78 <= wire68;
        end
      else
        begin
          reg72 <= (^(+(((^reg73) <<< $signed(reg74)) ?
              (wire68 ?
                  wire70 : $unsigned((7'h41))) : ($signed(wire68) ^~ reg75[(3'h4):(1'h0)]))));
        end
    end
  assign wire79 = (wire69[(1'h0):(1'h0)] ?
                      ((wire70 ? reg75 : reg75[(3'h4):(2'h3)]) ?
                          {reg77[(2'h3):(2'h3)]} : $unsigned((8'hb2))) : reg74);
  assign wire80 = reg74[(1'h1):(1'h1)];
  assign wire81 = ({reg72[(1'h0):(1'h0)]} > (~|reg78[(2'h2):(2'h2)]));
  assign wire82 = wire80;
  assign wire83 = (wire68[(3'h6):(2'h3)] - (!wire79));
  assign wire84 = (((+reg73) <= $signed(wire81)) >= (7'h41));
  assign wire85 = (~&wire68);
  assign wire86 = ({(($signed(reg76) ?
                          (wire81 ? (8'hb1) : wire70) : (reg76 ?
                              reg77 : reg75)) || $unsigned((+reg72)))} & $signed($signed((reg74 != reg75[(4'h8):(1'h1)]))));
  always
    @(posedge clk) begin
      if ($unsigned({({$signed(reg77), (wire84 <= wire69)} ?
              $unsigned((wire71 ? wire69 : reg73)) : (reg77 ?
                  (8'hbe) : $signed(reg76)))}))
        begin
          reg87 <= ($unsigned(reg72) << ((|(~^(wire69 & wire80))) | reg77[(3'h5):(2'h3)]));
          reg88 <= wire85[(3'h6):(3'h5)];
          if ((~|(!wire85)))
            begin
              reg89 <= $signed({(((wire71 - wire79) ?
                      wire70[(5'h10):(4'hc)] : {wire71}) == (reg73 ?
                      $unsigned(reg76) : reg87[(2'h3):(1'h0)])),
                  reg88[(4'ha):(3'h6)]});
              reg90 <= (((reg74 ? $unsigned({reg74}) : (7'h41)) ?
                      reg87 : {reg73, $unsigned((reg74 >>> wire86))}) ?
                  wire84 : (wire86[(5'h10):(4'hb)] ^ (reg76 > $signed(wire85))));
              reg91 <= (wire81[(3'h6):(1'h1)] != {wire82,
                  $unsigned((wire84[(2'h2):(2'h2)] ?
                      (reg73 ? wire86 : reg73) : (reg73 >>> reg78)))});
              reg92 <= (-{wire79});
              reg93 <= wire69;
            end
          else
            begin
              reg89 <= ((wire84[(2'h2):(2'h2)] ?
                      wire71[(4'h9):(3'h5)] : $unsigned((~&reg73))) ?
                  ({((wire85 ? reg93 : reg78) ?
                              $unsigned(reg72) : $unsigned(wire85)),
                          wire79} ?
                      (+reg93[(2'h2):(2'h2)]) : ({$signed(reg87),
                              $unsigned(reg93)} ?
                          ({reg87} ?
                              wire70 : (~wire80)) : (+wire83[(1'h1):(1'h1)]))) : (~^(&$unsigned((wire70 & reg77)))));
              reg90 <= (+(^($signed((reg73 ^~ wire84)) >>> wire68[(3'h5):(2'h2)])));
            end
          reg94 <= ((8'hbc) - $unsigned(reg75[(1'h0):(1'h0)]));
          if ($signed(reg78[(3'h7):(2'h2)]))
            begin
              reg95 <= ((reg75 - ((8'h9e) < $unsigned((!wire71)))) | wire79[(3'h4):(2'h3)]);
            end
          else
            begin
              reg95 <= (&$signed($unsigned(reg88[(2'h2):(1'h0)])));
            end
        end
      else
        begin
          reg87 <= {reg77[(3'h6):(3'h6)],
              (((reg76 <= wire67[(2'h3):(1'h0)]) ?
                  $signed((&reg93)) : $signed($signed(reg74))) <<< $signed($unsigned(reg89)))};
          reg88 <= $signed($signed(reg94[(4'ha):(3'h6)]));
          reg89 <= reg73;
          if ((+(~^(~&(8'hb0)))))
            begin
              reg90 <= (wire68 ?
                  $signed({($unsigned(wire85) && $unsigned(wire79)),
                      ((-reg77) ?
                          {reg89, wire80} : ((8'hb7) ?
                              (8'h9d) : wire68))}) : (reg92[(3'h4):(1'h1)] ?
                      wire68 : (reg91[(3'h5):(1'h1)] >> wire81)));
              reg91 <= (reg91[(4'h8):(3'h7)] & wire83);
              reg92 <= reg87[(3'h7):(2'h3)];
            end
          else
            begin
              reg90 <= (~^wire81[(3'h5):(1'h0)]);
              reg91 <= ($unsigned((~|reg75)) ^ reg90[(4'hc):(4'h9)]);
              reg92 <= reg88;
            end
        end
    end
  assign wire96 = $signed((((((8'hb1) < reg90) ?
                          (-reg93) : {reg94}) <<< $signed($unsigned(reg95))) ?
                      ((~^(reg92 ? reg87 : wire84)) ?
                          reg76 : $signed($signed(reg72))) : (wire70 ?
                          $signed({reg93}) : $signed((wire79 ?
                              reg93 : wire80)))));
endmodule
