module top
#(parameter param138 = ((~|(~|(^~{(8'hb4)}))) || (8'ha8)), 
parameter param139 = param138)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire29;
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire130,
                 wire87,
                 wire85,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 (1'h0)};
  module4 #() modinst30 (wire29, clk, wire2, wire1, wire3, wire0, (8'hae));
  assign wire31 = wire3[(2'h2):(1'h0)];
  assign wire32 = (|wire29);
  assign wire33 = ($unsigned(((wire32 | ((8'hb5) ? wire3 : wire2)) ?
                      $unsigned($unsigned(wire3)) : $unsigned((wire32 <= wire1)))) * ((wire29 + ((|wire1) == wire31[(2'h2):(2'h2)])) ?
                      (+wire29) : (wire31[(4'h8):(1'h0)] ?
                          wire31 : (((8'hbe) ? wire31 : wire31) ?
                              {wire3, wire1} : wire31[(3'h4):(1'h0)]))));
  assign wire34 = ($unsigned($signed(wire0[(2'h3):(2'h3)])) << wire32);
  assign wire35 = (+$unsigned(wire3));
  assign wire36 = wire0;
  assign wire37 = ($unsigned($signed(($signed(wire34) <<< wire34))) & (((~|wire33) ^ $signed($unsigned(wire32))) ?
                      {wire29[(1'h1):(1'h0)],
                          $unsigned((wire32 <= wire36))} : wire2));
  assign wire38 = $signed((($unsigned(wire29) + ((wire32 ^~ wire37) >>> (wire1 * wire33))) ?
                      $signed(wire31[(2'h2):(1'h1)]) : ({(~|(8'ha3))} ?
                          {$signed(wire0),
                              $unsigned(wire0)} : (~&$signed(wire2)))));
  assign wire39 = wire1;
  module40 #() modinst86 (wire85, clk, wire34, wire39, wire36, wire29);
  assign wire87 = (~$unsigned({(~^{wire34})}));
  module88 #() modinst131 (wire130, clk, wire32, wire37, wire1, wire38);
  assign wire132 = wire87[(3'h4):(3'h4)];
  assign wire133 = {($unsigned(((wire0 ? wire29 : wire0) ^ (wire33 & wire2))) ?
                           wire87[(3'h6):(3'h4)] : $signed($unsigned($unsigned(wire35))))};
  assign wire134 = wire31;
  assign wire135 = $signed(wire132);
  assign wire136 = wire35[(2'h3):(1'h0)];
  assign wire137 = $unsigned(wire35[(3'h4):(1'h0)]);
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire91;
  input wire signed [(5'h14):(1'h0)] wire90;
  input wire signed [(4'he):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire101,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
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
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire93 = (7'h42);
  assign wire94 = wire89[(4'h8):(3'h7)];
  assign wire95 = $signed($unsigned((8'h9f)));
  assign wire96 = wire92;
  always
    @(posedge clk) begin
      reg97 <= {(+$signed(wire92)),
          $unsigned(({wire92[(3'h4):(1'h0)]} ?
              {wire91, ((8'ha9) ? wire96 : wire90)} : $unsigned((^wire95))))};
      reg98 <= (~^{($signed(wire96) ?
              $unsigned((+wire89)) : wire92[(4'h9):(1'h1)]),
          $signed(wire96)});
      reg99 <= $unsigned((reg97 ?
          wire90[(5'h14):(1'h0)] : (wire95 ? wire91 : wire89[(3'h4):(1'h1)])));
      reg100 <= reg98;
    end
  assign wire101 = ($signed({((reg100 ?
                           (8'hb2) : wire90) ~^ reg100)}) ^~ (~(7'h44)));
  always
    @(posedge clk) begin
      reg102 <= $unsigned((wire91[(3'h5):(1'h1)] > ($signed((wire94 + (8'h9e))) ?
          (((8'ha5) ? wire94 : reg97) + (~^wire91)) : $signed(wire92))));
      reg103 <= {$unsigned({$unsigned({reg98, wire92}),
              $unsigned((~^wire94))})};
      reg104 <= wire95;
      reg105 <= (~&wire95[(2'h2):(1'h0)]);
    end
  assign wire106 = (($signed(wire91[(5'h11):(1'h0)]) ?
                           (($unsigned(wire96) ?
                                   {reg99, wire96} : $unsigned((8'hb1))) ?
                               wire95[(1'h0):(1'h0)] : $signed(((8'hbf) & wire94))) : reg98[(2'h2):(2'h2)]) ?
                       $unsigned($signed(wire95[(3'h6):(1'h1)])) : $unsigned(($signed((wire89 ?
                           wire101 : (7'h41))) && (~&(wire95 >>> wire91)))));
  assign wire107 = $signed({($signed((reg104 ? (7'h40) : wire95)) ?
                           $unsigned($signed(reg98)) : $unsigned((-wire96))),
                       (&$signed(wire101))});
  assign wire108 = {({$unsigned(reg102[(2'h2):(1'h0)])} ^ (reg105 ?
                           (reg105[(3'h7):(3'h6)] > wire91) : ((wire106 ?
                                   wire93 : wire96) ?
                               $signed(wire89) : $signed(reg105))))};
  assign wire109 = ((~|((reg100 ~^ (wire108 ?
                       (8'hb7) : reg104)) ~^ (reg99[(3'h5):(1'h0)] >= ((7'h41) ~^ reg99)))) * wire96[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg110 <= $unsigned((reg100 | (^~$unsigned((reg105 ?
          reg100 : (8'hbb))))));
      reg111 <= (^~{({(reg105 ? wire92 : wire92), (reg102 * wire106)} ?
              wire101[(4'hb):(2'h2)] : (wire109 | $signed(reg100))),
          $signed($unsigned((|wire92)))});
      reg112 <= $signed(reg110);
      if ($unsigned((~&$signed(reg111[(2'h3):(2'h2)]))))
        begin
          reg113 <= (($signed(($unsigned(wire91) == wire90[(5'h10):(3'h5)])) ?
              $unsigned((|((8'ha7) ?
                  reg105 : reg104))) : reg110[(2'h2):(2'h2)]) && (($unsigned(wire101) >>> wire95[(3'h6):(3'h6)]) ?
              (reg104 ~^ {$unsigned((8'hac)), wire96}) : reg112));
          reg114 <= (~&reg112);
          reg115 <= (reg110[(2'h2):(1'h0)] ?
              $signed(wire106[(3'h6):(2'h3)]) : reg110[(3'h5):(3'h4)]);
          if (reg112[(3'h6):(1'h1)])
            begin
              reg116 <= $signed({($signed((reg113 ? wire107 : wire101)) ?
                      (8'ha6) : (wire90[(5'h11):(1'h0)] && $signed(reg110)))});
              reg117 <= $unsigned((reg100 ^ ((wire96[(3'h5):(1'h0)] ?
                      $signed(reg100) : reg97) ?
                  $unsigned(wire109) : (7'h42))));
              reg118 <= ((8'hb8) ?
                  $unsigned($unsigned($signed(reg98))) : (~^$signed($unsigned((reg116 ?
                      reg112 : reg111)))));
              reg119 <= (($signed(($signed(wire89) ?
                      (+reg114) : (8'h9c))) ^~ wire92[(3'h6):(3'h4)]) ?
                  $signed((~&reg118[(3'h6):(3'h4)])) : reg98);
            end
          else
            begin
              reg116 <= $signed(((((wire92 ^~ reg112) + ((8'hb1) ^~ (8'ha0))) + ((reg111 ?
                  reg118 : wire95) <<< wire107)) != $signed((&$signed(reg100)))));
              reg117 <= reg114;
              reg118 <= ((~|(reg115[(1'h1):(1'h1)] != {(reg119 <= (8'ha2))})) != (wire95 ?
                  wire95[(3'h4):(1'h1)] : ((+{reg115}) ?
                      $unsigned({(8'hb6),
                          (8'hab)}) : ($unsigned((8'hb0)) ^ (wire93 ^~ reg102)))));
              reg119 <= reg105[(3'h4):(1'h0)];
              reg120 <= $unsigned($signed(wire96[(3'h5):(3'h5)]));
            end
          if (reg105[(2'h2):(1'h1)])
            begin
              reg121 <= $signed((reg117 ? wire109 : $unsigned(wire109)));
              reg122 <= ({{$unsigned(reg105),
                      wire92}} <= (wire107[(1'h0):(1'h0)] <<< $unsigned(((reg121 ^ reg99) < reg116[(2'h2):(2'h2)]))));
              reg123 <= $unsigned((wire94 + wire108[(4'h8):(2'h3)]));
              reg124 <= $signed((($signed($signed(wire108)) ~^ (!wire96[(2'h2):(1'h1)])) ?
                  ($unsigned({(8'h9f)}) >>> (~^reg118[(2'h2):(2'h2)])) : wire95));
            end
          else
            begin
              reg121 <= $signed(wire108[(3'h7):(1'h1)]);
              reg122 <= {(wire92[(4'h8):(2'h2)] ?
                      (^wire90[(4'hf):(4'hf)]) : {wire91[(3'h5):(2'h3)]}),
                  ($signed(((8'ha1) ?
                      wire96 : {(8'hb0)})) ~^ reg100[(4'hd):(2'h3)])};
              reg123 <= (((((reg124 ? (8'hb1) : reg98) ?
                          (+reg112) : $signed(wire107)) ?
                      ($unsigned(reg104) + reg97) : (-$signed(wire109))) != reg115[(1'h0):(1'h0)]) ?
                  ({$unsigned((-reg105)),
                      (wire95[(3'h4):(1'h0)] ?
                          {wire90} : $signed((8'hbe)))} < $unsigned((reg120 + (reg99 > reg99)))) : (&reg102[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          reg113 <= ($signed(wire96) ? reg104[(2'h2):(1'h1)] : reg123);
          reg114 <= $unsigned(reg113);
          if ((~reg99[(3'h7):(3'h5)]))
            begin
              reg115 <= (reg121 ?
                  (reg123 <<< {reg119,
                      reg114}) : ((wire93[(4'hc):(4'hc)] ^ wire90[(4'he):(3'h7)]) ?
                      wire89[(1'h1):(1'h1)] : ((-reg124[(2'h3):(1'h0)]) ?
                          wire95[(3'h7):(2'h2)] : reg98)));
            end
          else
            begin
              reg115 <= $signed($unsigned(($unsigned((^wire93)) ?
                  {reg111} : ((wire108 ^ reg115) * wire94[(1'h1):(1'h1)]))));
              reg116 <= {(+(~^$signed(reg114)))};
              reg117 <= wire108[(4'h8):(3'h4)];
              reg118 <= {(~reg115)};
              reg119 <= $unsigned($unsigned((~|$signed($signed(reg114)))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg125 <= {reg111[(2'h3):(1'h0)],
          ($signed(reg118) <= $unsigned((~&(reg119 ? reg104 : reg105))))};
      reg126 <= $signed(wire89);
      reg127 <= (reg124[(2'h2):(2'h2)] < ($unsigned($signed(wire94[(3'h7):(3'h6)])) == $unsigned(reg126[(2'h2):(1'h0)])));
    end
  assign wire128 = ((reg117 <<< wire95) ? wire109 : reg126);
  assign wire129 = wire96;
endmodule

module module40
#(parameter param83 = {((^(((8'ha6) > (8'hbc)) >= ((8'hb5) >>> (8'hbe)))) && (8'hb8)), ((((~|(7'h40)) ? ((8'ha1) << (8'hb6)) : (&(7'h41))) && {{(8'h9f)}}) ? (~^(~|(!(8'ha2)))) : (^(((7'h40) ? (7'h40) : (8'hb1)) < (-(7'h43)))))}, 
parameter param84 = (param83 ? ((((^param83) - param83) ? param83 : param83) > (param83 ^~ (&(7'h40)))) : (({(^~param83), (param83 ? param83 : param83)} ? ({param83, param83} ? (8'hba) : (param83 ? param83 : param83)) : ((~param83) ? {param83, param83} : param83)) ? (((param83 < param83) + (param83 > (8'ha1))) ? (((8'h9f) ? param83 : (7'h43)) < (param83 - param83)) : ((param83 ? param83 : param83) - {(8'hbd), param83})) : (((param83 ? param83 : (8'hb4)) ^ param83) ? param83 : param83))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  input wire [(4'hd):(1'h0)] wire42;
  input wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire47,
                 wire46,
                 wire45,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire45 = $signed(wire41[(4'h8):(3'h6)]);
  assign wire46 = wire44[(3'h5):(3'h5)];
  assign wire47 = (8'hb1);
  always
    @(posedge clk) begin
      reg48 <= {$unsigned($unsigned($unsigned((wire41 ? wire46 : wire42)))),
          (wire41[(3'h6):(1'h0)] ?
              wire47[(1'h0):(1'h0)] : (~((wire46 ^ wire41) ?
                  ((8'hb6) << wire41) : wire43)))};
      reg49 <= $signed($signed($signed($unsigned($unsigned(wire45)))));
      reg50 <= ($signed(reg49) >>> reg49[(2'h2):(1'h1)]);
      reg51 <= wire47;
    end
  module52 #() modinst81 (.wire56(reg49), .y(wire80), .wire53(wire47), .wire55(reg50), .wire54(wire43), .clk(clk));
  assign wire82 = wire45;
endmodule

module module4
#(parameter param28 = ((({(-(8'haa)), ((7'h41) ? (8'hb9) : (8'hae))} > (-(~^(8'hb4)))) ? ((((8'ha8) ? (7'h44) : (8'haa)) * {(8'hbe)}) ? ((+(8'ha7)) ? ((8'hac) <= (8'ha6)) : ((8'had) + (8'haa))) : (^(7'h44))) : ((((7'h42) ? (8'ha4) : (8'ha4)) >>> (-(8'hbe))) <= {(-(8'hae))})) + (+(^~(~&((8'ha2) | (7'h44)))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire10 = (^$signed(wire6));
  assign wire11 = $unsigned($unsigned($signed($signed(wire10))));
  assign wire12 = {($signed(((^wire6) & wire7)) ?
                          (~$unsigned(wire8[(2'h2):(1'h0)])) : $signed((&wire6[(4'hb):(3'h7)]))),
                      $signed(wire5[(4'hd):(3'h7)])};
  assign wire13 = {{{wire12, wire7[(5'h10):(2'h3)]}, $signed({(&wire8)})},
                      wire6[(5'h12):(4'ha)]};
  assign wire14 = $unsigned(wire6);
  assign wire15 = (wire11 > (wire11[(2'h3):(2'h3)] ?
                      (wire13 && wire7[(4'h8):(1'h1)]) : $unsigned(wire9)));
  assign wire16 = wire11[(1'h0):(1'h0)];
  assign wire17 = (~^(((&{wire15}) ^~ wire5) ^ (((wire16 >> wire12) > wire11[(4'h9):(3'h4)]) ?
                      wire11[(4'hd):(3'h5)] : ($unsigned(wire14) >> (wire11 && (8'ha2))))));
  assign wire18 = $unsigned(wire11);
  assign wire19 = (8'hb1);
  always
    @(posedge clk) begin
      reg20 <= ($signed($signed(wire11[(2'h2):(2'h2)])) ?
          wire8 : {$signed($unsigned({wire18})), wire16});
      reg21 <= $signed($signed((~&wire16[(4'ha):(3'h6)])));
      reg22 <= (($signed(wire12[(2'h3):(1'h1)]) != reg20) <<< ((wire13 ^ (reg20 ?
          (wire9 - wire12) : (wire7 != wire6))) ~^ wire5));
      reg23 <= (~(-{wire6}));
    end
  assign wire24 = $unsigned(wire7[(4'he):(3'h7)]);
  assign wire25 = wire16;
  assign wire26 = wire9[(4'h9):(1'h1)];
  assign wire27 = (($signed((wire18[(4'ha):(2'h3)] ?
                              $unsigned(wire18) : (7'h43))) ?
                          $unsigned((~|(reg22 == wire7))) : (^~{(wire10 ?
                                  (8'had) : wire15)})) ?
                      (~$unsigned({$unsigned(wire24),
                          $signed(wire16)})) : ((&$signed(reg22[(3'h5):(1'h1)])) ~^ wire6));
endmodule

module module52  (y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire56;
  input wire signed [(5'h15):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire54;
  input wire [(4'ha):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire58,
                 wire57,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire57 = wire54;
  assign wire58 = $signed((($unsigned((wire54 ?
                          wire53 : wire57)) & ((wire57 > wire54) ?
                          wire56[(3'h5):(3'h5)] : $unsigned(wire53))) ?
                      (&(wire57[(3'h7):(2'h2)] ?
                          (~|wire57) : $unsigned(wire54))) : ((~&(+wire54)) ^~ {wire55[(3'h6):(3'h5)]})));
  always
    @(posedge clk) begin
      reg59 <= ({(((wire56 != (8'haf)) == wire56[(1'h0):(1'h0)]) ?
                  {wire55[(3'h6):(3'h5)]} : (wire58[(2'h2):(1'h1)] <= wire55[(5'h15):(5'h15)]))} ?
          $signed(wire54) : (^~wire57));
      if ((!wire54[(2'h3):(2'h3)]))
        begin
          if ($unsigned(($signed((((8'hbb) + wire53) != (~|reg59))) >= $signed($unsigned((wire54 || wire57))))))
            begin
              reg60 <= (wire54[(4'ha):(1'h0)] ?
                  (~^(((wire57 ?
                      wire55 : wire56) ^ $unsigned(wire54)) <= reg59[(5'h14):(1'h1)])) : $unsigned(({reg59,
                      wire53[(2'h2):(1'h0)]} - ((wire57 ^ reg59) > wire56[(4'hb):(4'h9)]))));
              reg61 <= wire57[(1'h1):(1'h1)];
            end
          else
            begin
              reg60 <= reg60[(3'h6):(3'h6)];
              reg61 <= ((-(reg59 ^~ (wire54[(2'h2):(1'h1)] ^~ {(8'hab)}))) ?
                  $unsigned((|{reg61[(1'h1):(1'h0)],
                      wire56[(3'h4):(3'h4)]})) : ($signed((wire58 << (wire58 && wire53))) ?
                      reg60 : $signed(wire53)));
              reg62 <= $unsigned((~^$unsigned($signed(wire56))));
            end
          if ($unsigned($unsigned($unsigned(($signed(reg62) ?
              (8'ha5) : $unsigned(reg60))))))
            begin
              reg63 <= (-(~{reg59}));
              reg64 <= (wire53 ?
                  reg59 : ({wire57} >> $unsigned($unsigned($signed(reg60)))));
              reg65 <= ($unsigned(reg61[(1'h0):(1'h0)]) ?
                  (reg62 ?
                      wire55 : reg61[(4'h8):(3'h4)]) : (($signed((8'hb4)) + wire54) ~^ reg64));
              reg66 <= reg63;
            end
          else
            begin
              reg63 <= (8'hb9);
              reg64 <= reg59;
              reg65 <= wire54[(3'h4):(2'h3)];
              reg66 <= {(reg65 != wire54[(4'h9):(3'h5)])};
            end
          reg67 <= $signed((~|wire58[(4'hc):(2'h3)]));
        end
      else
        begin
          reg60 <= ($signed(({(reg60 ? wire56 : reg60),
              (~^wire55)} <<< $unsigned($unsigned(wire55)))) >= (+$unsigned($signed((reg59 | wire53)))));
          reg61 <= (!(+(reg66[(2'h3):(1'h1)] ?
              $unsigned((^~(8'hb0))) : $signed($signed(reg59)))));
          reg62 <= $unsigned($signed($signed((wire57 ?
              reg65[(4'hd):(1'h1)] : reg59[(5'h10):(2'h2)]))));
          reg63 <= reg60;
          reg64 <= reg65;
        end
      reg68 <= reg64[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg69 <= reg59[(4'hf):(4'ha)];
      if ($signed(wire56))
        begin
          reg70 <= $unsigned($unsigned({{wire56, $signed((8'ha7))}}));
          reg71 <= wire53;
          reg72 <= reg71;
          reg73 <= reg59[(4'hf):(3'h5)];
        end
      else
        begin
          if (wire53)
            begin
              reg70 <= ($unsigned($unsigned($signed($signed(wire58)))) ?
                  (~&$signed({(reg59 <<< (8'ha4))})) : ({(&$unsigned(reg69)),
                      reg72} <= reg64[(4'h8):(1'h0)]));
              reg71 <= reg73[(2'h3):(2'h2)];
            end
          else
            begin
              reg70 <= (|reg68);
              reg71 <= reg72;
              reg72 <= {($signed((reg70 ^ $signed(wire55))) && wire56[(3'h4):(2'h3)])};
            end
          reg73 <= (~^($unsigned({reg66[(2'h3):(2'h3)]}) | (^~$signed((&reg59)))));
        end
      reg74 <= (^~$unsigned(reg73[(3'h5):(3'h5)]));
      reg75 <= reg69;
      reg76 <= $unsigned(reg63[(4'hc):(4'hc)]);
    end
  assign wire77 = $unsigned((reg61[(4'hb):(1'h0)] - $unsigned(reg68)));
  assign wire78 = $signed((-reg70));
  assign wire79 = reg75[(3'h5):(1'h1)];
endmodule
