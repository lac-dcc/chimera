module top
#(parameter param142 = (~^{(((8'hbe) >>> {(8'ha8)}) || ((~^(8'ha0)) ? ((8'haa) <= (8'ha3)) : ((8'ha1) << (8'hb6)))), ((((8'hbb) ? (7'h42) : (8'ha1)) * ((8'haa) ? (7'h42) : (8'ha4))) ? (((7'h40) - (8'ha1)) ? ((8'hb1) + (7'h44)) : (&(8'hb5))) : (~&(&(8'hbb))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire131;
  wire [(4'hf):(1'h0)] wire132;
  wire [(4'hf):(1'h0)] wire133;
  wire [(4'he):(1'h0)] wire134;
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  reg [(4'hb):(1'h0)] reg137 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire136,
                 wire127,
                 wire33,
                 wire32,
                 wire30,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 reg138,
                 reg137,
                 (1'h0)};
  module4 #() modinst31 (wire30, clk, wire0, wire2, wire1, wire3, (8'ha2));
  assign wire32 = ((wire30[(1'h1):(1'h1)] ?
                      wire3[(5'h11):(4'he)] : $unsigned(wire30)) ^ ($signed($signed({wire0,
                      wire0})) ^ ($unsigned((wire3 >> wire30)) >> (&wire1[(3'h5):(1'h1)]))));
  assign wire33 = $signed($unsigned($unsigned(wire32[(4'h8):(3'h7)])));
  module34 #() modinst128 (wire127, clk, wire2, wire30, wire33, wire0, wire32);
  assign wire129 = $signed(($unsigned($signed($signed((8'hac)))) ?
                       wire32 : (wire30 ? wire0 : (~^(8'hbd)))));
  assign wire130 = ($unsigned((~^{(wire33 ? wire30 : wire33), (~wire33)})) ?
                       (|wire0) : wire3[(4'h9):(1'h1)]);
  assign wire131 = $unsigned((7'h41));
  assign wire132 = $signed(((wire130 > $unsigned((8'hb1))) ?
                       $unsigned($signed({wire2,
                           wire32})) : (($unsigned(wire127) ?
                           {wire130} : wire33[(4'hc):(4'h8)]) < $signed($unsigned(wire2)))));
  assign wire133 = wire1;
  module64 #() modinst135 (.wire69(wire30), .wire66(wire132), .clk(clk), .wire68(wire2), .y(wire134), .wire65(wire3), .wire67(wire1));
  assign wire136 = wire3[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      reg137 <= $unsigned(wire130[(3'h7):(1'h0)]);
      reg138 <= $unsigned((wire131[(4'hf):(2'h2)] ?
          ((^wire136[(1'h1):(1'h1)]) ?
              wire32[(3'h4):(1'h1)] : $signed((wire0 ?
                  wire3 : wire129))) : (({(8'h9e), wire136} ?
                  (wire136 ^~ wire133) : wire1) ?
              wire131 : (~^$signed(wire32)))));
    end
  assign wire139 = (~(8'hb5));
  assign wire140 = {reg137, wire2[(4'he):(3'h6)]};
  assign wire141 = wire2;
endmodule

module module34
#(parameter param125 = (((~^(((7'h43) ? (8'ha0) : (8'ha9)) & (|(8'ha8)))) ? {((^~(8'ha8)) ? (^~(8'ha8)) : {(8'hb2), (8'hab)}), (((8'ha3) <= (8'had)) + ((8'h9c) - (8'ha7)))} : ((+((8'hb5) <<< (8'hb2))) ? (((8'ha4) == (8'ha8)) ? (8'ha3) : ((8'hb1) ? (8'hab) : (8'ha2))) : {((8'hac) == (8'ha3))})) ^ (^({{(8'hb0)}, ((8'ha2) ^~ (8'hbf))} ? ((+(8'hb2)) ? ((8'ha2) <= (7'h44)) : ((7'h40) >>> (8'hbd))) : ({(8'hb3)} ? ((8'hb8) ? (8'hb5) : (8'hb1)) : ((7'h43) ? (8'had) : (7'h42)))))), 
parameter param126 = param125)
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire signed [(4'hf):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire123;
  assign y = {wire81,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 wire42,
                 wire41,
                 wire40,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire123,
                 (1'h0)};
  assign wire40 = ($signed((8'hbc)) ?
                      (~|wire37) : $signed(wire39[(1'h0):(1'h0)]));
  assign wire41 = ({$signed(wire36),
                      {wire37}} >= $unsigned(wire39[(4'ha):(2'h3)]));
  assign wire42 = ($unsigned((($signed(wire41) >>> (wire37 ^~ wire37)) >= ($signed(wire39) ?
                          wire40 : $signed(wire35)))) ?
                      ((wire40[(3'h6):(2'h2)] < {wire40[(4'hc):(1'h1)]}) ?
                          wire36[(4'h9):(2'h2)] : (wire35[(1'h1):(1'h1)] <= wire39[(1'h1):(1'h0)])) : $signed((($unsigned(wire41) > (!(8'h9e))) ^ $unsigned(wire35[(3'h4):(3'h4)]))));
  module43 #() modinst57 (wire56, clk, wire39, wire41, wire35, wire36);
  assign wire58 = $signed(((8'hbe) * (wire37[(4'hc):(1'h1)] ?
                      (^$unsigned((8'ha0))) : $unsigned(wire35))));
  assign wire59 = $unsigned((~&$signed($unsigned($unsigned(wire35)))));
  assign wire60 = $signed($signed((|wire58)));
  assign wire61 = (&$unsigned(wire41[(3'h5):(1'h0)]));
  assign wire62 = ((wire36 ?
                          ((~^wire36) ?
                              $signed($signed(wire41)) : $unsigned((wire42 || wire38))) : $unsigned($unsigned((wire56 ^ wire59)))) ?
                      $signed((((-(8'hb5)) ?
                              $signed(wire35) : $signed(wire38)) ?
                          $signed(wire60) : $signed((wire59 ?
                              wire59 : wire56)))) : wire59[(1'h0):(1'h0)]);
  assign wire63 = {$signed((~&(^~(&wire62)))),
                      (((wire37 ^~ (~|wire58)) ?
                          (~&(wire39 ? wire35 : wire37)) : {{wire36,
                                  wire41}}) << {(&wire41)})};
  module64 #() modinst82 (wire81, clk, wire63, wire61, wire35, wire56, wire40);
  assign wire83 = ($signed($unsigned(($unsigned(wire42) ?
                          (wire81 ? wire42 : wire61) : ((8'hb8) - (8'ha3))))) ?
                      wire42 : $signed($signed(($unsigned(wire37) * {wire81}))));
  assign wire84 = $signed(((wire63 ?
                      $signed($signed(wire42)) : wire56) >>> wire59));
  assign wire85 = (~wire81);
  assign wire86 = (wire37 != $unsigned((!wire36[(3'h6):(3'h6)])));
  module87 #() modinst124 (.clk(clk), .y(wire123), .wire89(wire86), .wire90(wire83), .wire88(wire60), .wire91(wire40), .wire92(wire39));
endmodule

module module4
#(parameter param29 = (-(^((((8'ha3) ? (8'h9c) : (8'hbd)) ? ((8'hbe) - (8'hb7)) : (|(8'hb7))) ? (8'hb9) : (((7'h44) ? (8'hb5) : (8'hb3)) ^~ (~&(8'haa)))))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire26;
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire28, wire10, wire26, reg12, reg11, (1'h0)};
  assign wire10 = $signed(wire8);
  always
    @(posedge clk) begin
      reg11 <= $signed(wire6[(3'h7):(3'h5)]);
      reg12 <= $signed($unsigned(((wire6[(2'h3):(2'h3)] ?
              $unsigned((8'had)) : $signed((8'hbf))) ?
          $unsigned({wire10}) : $signed(((8'hb2) ? wire6 : wire5)))));
    end
  module13 #() modinst27 (.wire17(wire9), .wire18(wire6), .wire16(wire5), .y(wire26), .clk(clk), .wire14(wire10), .wire15(wire8));
  assign wire28 = wire10[(1'h1):(1'h1)];
endmodule

module module13
#(parameter param24 = (((~|(8'hb3)) | (((|(8'ha0)) ? ((8'hbc) ? (8'hba) : (8'haa)) : (+(8'hb0))) ? ({(8'hb0)} ? {(8'ha1), (8'hab)} : ((7'h43) ? (8'ha3) : (8'hab))) : ((7'h42) & (-(8'hbe))))) ^ (~&(^(((8'hb9) & (8'ha2)) ? (&(8'hbb)) : (8'hb3))))), 
parameter param25 = {{((8'hb0) && ((^~param24) ? (param24 ? param24 : param24) : (param24 ? param24 : param24))), param24}, (((^~{param24}) ? (-(param24 ^~ param24)) : ((~|(8'hb9)) ? (~^param24) : {(8'hb1), param24})) ? (&(((8'hbe) ? param24 : param24) ? (!param24) : param24)) : {{(param24 ? (8'hbc) : param24), (param24 ? param24 : param24)}})})
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire18;
  input wire signed [(3'h5):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  assign y = {wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = (wire18[(1'h1):(1'h0)] >= ((((wire18 ?
                      wire16 : wire16) && ((8'ha2) ?
                      (8'ha2) : wire14)) | $unsigned(wire16)) ^ wire14));
  assign wire20 = (({(wire15 <<< $signed(wire19)),
                              $unsigned($unsigned(wire14))} ?
                          ($unsigned(wire19) ?
                              ((wire14 == wire18) ?
                                  (wire18 ?
                                      (8'ha0) : wire15) : $signed(wire14)) : {(wire19 ^~ wire16)}) : ((8'haf) ?
                              ((^~(8'hb6)) * $signed(wire15)) : (^$unsigned(wire15)))) ?
                      wire15 : wire17);
  assign wire21 = $signed(((($unsigned(wire14) != wire19) ?
                          wire16 : {$unsigned(wire16), $signed(wire14)}) ?
                      (wire15 && wire20[(2'h2):(1'h0)]) : (wire19[(4'ha):(4'h9)] ?
                          ($signed((8'h9e)) <<< wire16) : $signed(wire15))));
  assign wire22 = (wire14[(4'h8):(2'h2)] && ((^(wire16[(2'h2):(1'h1)] ?
                          $unsigned(wire21) : (~&wire21))) ?
                      (-$unsigned(wire21)) : $signed((8'haa))));
  assign wire23 = wire14;
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire92;
  input wire [(3'h6):(1'h0)] wire91;
  input wire [(4'hd):(1'h0)] wire90;
  input wire signed [(4'h9):(1'h0)] wire89;
  input wire [(4'ha):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire108,
                 wire107,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
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
                 (1'h0)};
  assign wire93 = (wire92[(5'h12):(1'h0)] * ($unsigned(((8'hb4) ?
                          $unsigned(wire89) : (~wire91))) ?
                      $unsigned($signed(wire90[(4'hb):(4'ha)])) : (^((wire90 ?
                          (8'hac) : wire92) >> {wire90, wire92}))));
  assign wire94 = (wire91[(3'h4):(2'h2)] <= (~&$signed((+$unsigned(wire88)))));
  assign wire95 = $unsigned(($unsigned((^~$unsigned(wire91))) <= ({$signed(wire92)} ?
                      wire90 : (wire91[(3'h5):(2'h2)] ?
                          $signed(wire88) : (~^wire88)))));
  assign wire96 = {(+(^~(~&wire88[(3'h4):(2'h3)]))),
                      $signed((wire95 & $signed({wire91, wire92})))};
  always
    @(posedge clk) begin
      if (wire96[(4'h8):(3'h7)])
        begin
          if ($unsigned(wire95))
            begin
              reg97 <= $signed((^~{wire92[(4'h8):(2'h2)],
                  $signed({wire90, wire96})}));
              reg98 <= $signed($signed($unsigned((wire95[(3'h7):(1'h0)] >>> (-(8'ha6))))));
              reg99 <= (+$unsigned($unsigned({wire96,
                  ((8'ha4) ? wire92 : wire96)})));
              reg100 <= wire91[(3'h4):(1'h0)];
              reg101 <= wire96[(1'h0):(1'h0)];
            end
          else
            begin
              reg97 <= {$signed((~^$unsigned($signed(reg100))))};
              reg98 <= $unsigned((~^reg99[(2'h3):(2'h3)]));
              reg99 <= $signed($unsigned((((wire88 * wire90) ^ (reg101 - wire96)) != (wire88 != $unsigned(wire95)))));
              reg100 <= $unsigned((^~(~|$unsigned((wire95 ?
                  (8'ha5) : wire96)))));
            end
          if (reg101)
            begin
              reg102 <= wire95;
              reg103 <= wire91;
              reg104 <= ($unsigned($signed(($unsigned(reg99) ?
                  {reg98,
                      reg103} : reg100[(2'h3):(1'h1)]))) && (wire95[(2'h2):(1'h1)] > (-(wire89 ?
                  (wire94 != wire91) : wire91))));
              reg105 <= (!wire91[(3'h5):(3'h4)]);
              reg106 <= $signed(({(+$unsigned(wire90)),
                  (!(reg104 ? wire96 : wire95))} - $unsigned((8'hae))));
            end
          else
            begin
              reg102 <= wire88;
              reg103 <= $signed((!(($signed(wire88) ?
                  wire91 : $unsigned(reg106)) ~^ wire94[(3'h6):(3'h5)])));
              reg104 <= $signed((8'hb8));
              reg105 <= (~(8'ha3));
            end
        end
      else
        begin
          reg97 <= (((-(reg102 ? $signed(wire88) : (~reg103))) ?
              $signed($signed($unsigned(reg99))) : (wire94 ^~ wire94)) ~^ (~($unsigned($unsigned(reg99)) > (wire88 ?
              ((8'hba) & wire88) : {reg103}))));
          reg98 <= wire95;
          reg99 <= ({{reg102, {(-wire92), $signed(reg106)}},
                  reg98[(1'h0):(1'h0)]} ?
              $unsigned(($unsigned($unsigned((8'ha3))) ?
                  $signed({reg97, wire91}) : (((8'ha3) >= wire91) <<< (wire92 ?
                      wire93 : wire96)))) : wire94[(1'h1):(1'h1)]);
          reg100 <= $unsigned(($signed(((7'h41) ?
              wire94[(5'h10):(1'h1)] : wire89[(3'h7):(1'h0)])) & ({((8'ha6) + (8'ha8)),
              (~|wire88)} ^ (reg102 + (^reg101)))));
          reg101 <= (^($unsigned($signed(reg106)) < (wire95 ?
              wire95[(1'h1):(1'h1)] : $signed(reg104[(4'h9):(1'h1)]))));
        end
    end
  assign wire107 = $unsigned(wire94);
  assign wire108 = (|$signed((&((wire94 ? reg98 : reg105) ?
                       $unsigned(wire94) : $unsigned(wire91)))));
  always
    @(posedge clk) begin
      if (wire88)
        begin
          reg109 <= reg105;
          reg110 <= $signed($unsigned(((8'h9d) ?
              (wire89[(3'h7):(3'h7)] ?
                  reg97 : (-wire93)) : $signed($signed(reg98)))));
          reg111 <= $unsigned($unsigned((wire96 ?
              (8'h9d) : ((reg105 ^~ (8'ha8)) ? wire94 : {(7'h42)}))));
          reg112 <= $signed($unsigned(($signed(wire108) == $signed((|reg98)))));
        end
      else
        begin
          reg109 <= reg101;
          reg110 <= $signed((|($signed($signed(wire93)) ^~ wire91[(2'h3):(1'h0)])));
        end
      reg113 <= reg109[(1'h0):(1'h0)];
    end
  assign wire114 = reg98;
  assign wire115 = (reg101[(3'h4):(2'h3)] ?
                       (|(^~$signed(wire94))) : (wire108 || (($signed((8'hb9)) ?
                           reg105[(2'h2):(1'h0)] : reg111[(2'h3):(2'h3)]) + reg103[(4'hc):(4'hc)])));
  always
    @(posedge clk) begin
      reg116 <= (|(8'hbf));
      reg117 <= reg97;
      reg118 <= $signed($unsigned($unsigned((((8'hb8) ?
          wire107 : wire115) >> $unsigned(wire91)))));
      reg119 <= reg101[(3'h4):(1'h1)];
      if (($unsigned($unsigned((~&(reg111 == wire107)))) ?
          {reg101[(1'h1):(1'h1)],
              ((!{wire89, (8'hb1)}) ?
                  (+$unsigned(reg106)) : (wire93[(3'h5):(3'h4)] ?
                      (reg118 && (8'hb5)) : (reg112 ?
                          reg113 : reg100)))} : reg98[(4'ha):(2'h2)]))
        begin
          reg120 <= $unsigned((+reg101[(2'h2):(2'h2)]));
        end
      else
        begin
          reg120 <= ((reg100[(1'h1):(1'h1)] != ({reg113} == wire96[(3'h6):(3'h6)])) <<< $unsigned($signed($signed(wire91[(2'h2):(1'h1)]))));
          reg121 <= (8'hbb);
          reg122 <= $signed(((!$unsigned((^~(7'h42)))) ?
              ((((8'ha3) ? wire89 : reg102) >>> reg117) ?
                  ($unsigned(reg112) && (^~wire115)) : {(-wire115)}) : {reg117}));
        end
    end
endmodule

module module64
#(parameter param79 = (~(~&((~^((8'had) ? (8'hb4) : (8'had))) <= (|{(8'hb5), (8'ha6)})))), 
parameter param80 = param79)
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire69;
  input wire signed [(2'h2):(1'h0)] wire68;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire signed [(4'hf):(1'h0)] wire66;
  input wire signed [(4'ha):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  assign y = {wire78,
                 wire76,
                 wire75,
                 reg77,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg70 <= $signed($signed(wire65));
      reg71 <= $signed({($unsigned({wire67}) ? wire69[(5'h10):(2'h3)] : wire66),
          $unsigned({$unsigned(wire67), $signed(wire65)})});
      reg72 <= $signed({{(wire68[(2'h2):(1'h0)] >= reg71),
              wire68[(1'h1):(1'h0)]},
          (($signed(wire67) ^~ (8'hbe)) || reg70)});
      reg73 <= (8'ha0);
      reg74 <= $unsigned(((reg70 ?
              (wire67[(4'ha):(3'h6)] ?
                  wire66[(4'hb):(4'ha)] : (+wire69)) : $unsigned((-(8'hba)))) ?
          {$unsigned((~wire67))} : wire68));
    end
  assign wire75 = reg71;
  assign wire76 = ($unsigned(wire67) ?
                      ((($unsigned(reg73) ?
                              (&reg74) : reg70[(1'h1):(1'h1)]) << reg74) ?
                          reg73[(5'h11):(4'hc)] : wire66[(4'ha):(2'h3)]) : wire67);
  always
    @(posedge clk) begin
      reg77 <= wire69[(3'h6):(1'h1)];
    end
  assign wire78 = ($signed((7'h40)) ?
                      {((wire68 ? wire76 : (reg70 != (7'h41))) ?
                              ($signed((8'ha2)) | (+reg73)) : ((wire65 ?
                                  wire68 : wire75) >= wire66[(3'h4):(2'h2)]))} : reg77[(5'h12):(4'ha)]);
endmodule

module module43
#(parameter param55 = ((8'h9c) * (~&(!({(8'ha4), (8'hab)} ^~ (+(8'hb6)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire [(5'h15):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  assign y = {wire52, wire51, wire50, wire49, wire48, reg54, reg53, (1'h0)};
  assign wire48 = wire45;
  assign wire49 = (&(8'h9e));
  assign wire50 = ((wire47 <= wire49[(3'h7):(3'h5)]) << (7'h43));
  assign wire51 = $signed(($signed(wire46) ~^ $unsigned((((8'hbf) < wire48) * wire49[(4'hc):(4'hb)]))));
  assign wire52 = ({$unsigned($signed($unsigned(wire46)))} ?
                      (wire51[(5'h10):(2'h2)] ?
                          ((~^$signed(wire44)) == wire51[(4'hf):(2'h2)]) : $signed($unsigned({wire45,
                              wire50}))) : wire49);
  always
    @(posedge clk) begin
      reg53 <= wire50;
      reg54 <= wire49[(5'h10):(2'h3)];
    end
endmodule
