module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire140,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = (wire0 >= (~{{(~|wire3)}, {$signed(wire2), wire2}}));
  assign wire5 = (wire0[(4'h9):(2'h3)] ?
                     (((~^(~^wire2)) - (+(wire4 || wire0))) <<< $unsigned($signed((8'hb8)))) : ((((wire1 <<< wire3) ?
                         ((7'h40) ? wire3 : wire4) : wire2) >> $signed((wire4 ?
                         wire1 : wire0))) < ((wire2[(3'h4):(3'h4)] ?
                             (8'haa) : (wire3 ? (8'h9c) : wire4)) ?
                         $unsigned((wire3 || wire4)) : ($signed(wire4) ?
                             {wire4, wire2} : wire2))));
  assign wire6 = (^$signed($signed(((8'hbb) ? (wire4 - wire5) : wire5))));
  assign wire7 = (({((~&wire4) >> wire6[(2'h2):(1'h1)])} ?
                     (+wire0) : $unsigned((wire0[(3'h7):(3'h4)] ?
                         $unsigned(wire2) : (wire3 < wire3)))) == {$signed(wire6[(1'h0):(1'h0)])});
  assign wire8 = wire1[(2'h2):(1'h1)];
  assign wire9 = wire7[(4'hd):(3'h6)];
  assign wire10 = (8'ha1);
  assign wire11 = wire2[(1'h1):(1'h0)];
  module12 #() modinst141 (wire140, clk, wire1, wire11, wire9, wire5);
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire111;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire70;
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  assign y = {wire136,
                 wire134,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire70,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire17 = $signed($unsigned(wire15[(4'h9):(3'h4)]));
  assign wire18 = wire13;
  assign wire19 = $unsigned(wire18);
  assign wire20 = ($unsigned($signed(((~wire19) ?
                          wire16 : {wire16, (8'hb7)}))) ?
                      wire15[(2'h2):(2'h2)] : wire17[(4'h8):(1'h1)]);
  assign wire21 = ($unsigned($unsigned($signed(wire20))) ~^ wire17);
  module22 #() modinst71 (.wire26(wire21), .clk(clk), .wire27(wire15), .wire24(wire14), .wire25(wire18), .wire23(wire17), .y(wire70));
  module72 #() modinst112 (wire111, clk, wire18, wire20, wire21, wire13);
  assign wire113 = wire19;
  assign wire114 = {wire113[(1'h1):(1'h1)],
                       $unsigned($unsigned($signed($unsigned(wire70))))};
  assign wire115 = (((($unsigned((8'hab)) ?
                       $signed(wire113) : wire17[(3'h7):(2'h2)]) != $unsigned(wire70)) < wire21[(3'h6):(3'h5)]) >> wire13[(1'h0):(1'h0)]);
  assign wire116 = ({($unsigned((wire20 ? wire14 : wire114)) ?
                               wire19[(5'h10):(4'hf)] : (&$signed(wire18)))} ?
                       $unsigned(wire13[(3'h4):(2'h2)]) : (~|wire16));
  module117 #() modinst135 (.wire119(wire116), .wire120(wire111), .clk(clk), .wire118(wire114), .wire121(wire18), .y(wire134));
  assign wire136 = ($signed($signed($unsigned({wire20, wire15}))) ?
                       ((~(8'hb8)) - $signed(wire114[(4'h8):(1'h0)])) : {wire16[(1'h1):(1'h0)]});
  always
    @(posedge clk) begin
      reg137 <= wire116;
      reg138 <= ($unsigned($unsigned(($unsigned(wire19) ?
          $signed((8'hb4)) : (wire18 ?
              reg137 : wire115)))) >>> (~&wire13[(2'h3):(1'h1)]));
      reg139 <= {(-$unsigned((&wire134))), {$signed(wire16)}};
    end
endmodule

module module117  (y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire121;
  input wire signed [(3'h7):(1'h0)] wire120;
  input wire [(5'h11):(1'h0)] wire119;
  input wire [(4'hd):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire [(5'h11):(1'h0)] wire122;
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 (1'h0)};
  assign wire122 = $unsigned($signed($signed((wire120[(1'h1):(1'h0)] ?
                       wire120[(2'h3):(1'h1)] : (~&wire120)))));
  assign wire123 = $unsigned(wire121[(4'hb):(2'h3)]);
  assign wire124 = {(+(^~(wire118 ?
                           ((8'hab) ? wire119 : (8'hb8)) : (wire120 ?
                               wire122 : wire122)))),
                       {(((wire120 ? wire123 : wire122) ?
                               (wire121 >>> wire119) : $unsigned(wire123)) < $signed(wire120))}};
  assign wire125 = ((wire123 - wire122[(4'h9):(3'h6)]) ?
                       $unsigned(wire118[(4'hd):(4'hd)]) : wire118);
  always
    @(posedge clk) begin
      reg126 <= ((($unsigned((wire121 ? wire125 : (7'h44))) * wire125) ?
          (wire124 != wire119) : {$unsigned((wire119 < wire122))}) * $signed(((wire119[(4'hd):(4'hb)] ?
              $unsigned(wire120) : wire124) ?
          wire119 : wire124[(1'h0):(1'h0)])));
      reg127 <= $signed({(~&$signed((wire125 >> (8'hbe)))),
          (+{wire122[(2'h2):(1'h0)], wire121[(1'h0):(1'h0)]})});
      reg128 <= wire122;
      reg129 <= $unsigned(wire120[(3'h5):(3'h4)]);
    end
  assign wire130 = (^wire124[(1'h0):(1'h0)]);
  assign wire131 = reg128[(1'h1):(1'h1)];
  assign wire132 = (&$signed((&(^~(wire120 >>> wire119)))));
  assign wire133 = ((wire131[(1'h0):(1'h0)] + wire119) ~^ (wire124 ?
                       wire118[(3'h6):(2'h2)] : reg129));
endmodule

module module72
#(parameter param110 = (+({(~(~&(8'hae))), (+(~|(8'hb5)))} ? (8'hb5) : ({((8'h9e) < (7'h43))} != (7'h40)))))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire76;
  input wire signed [(4'hd):(1'h0)] wire75;
  input wire signed [(3'h7):(1'h0)] wire74;
  input wire [(3'h4):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(5'h15):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(5'h13):(1'h0)] wire103;
  wire [(2'h3):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(4'h9):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire79,
                 wire78,
                 wire77,
                 reg101,
                 reg100,
                 reg99,
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
                 (1'h0)};
  assign wire77 = (~wire73[(1'h0):(1'h0)]);
  assign wire78 = (8'hb3);
  assign wire79 = ((((8'hac) > (wire77 ?
                              $signed(wire73) : ((8'h9d) ? wire77 : wire74))) ?
                          (wire75 || $unsigned(((8'ha7) ?
                              wire77 : wire76))) : (wire76 ?
                              ((wire74 | wire77) | wire73) : $signed(((8'ha1) ^ wire75)))) ?
                      (wire76 ?
                          wire77 : $unsigned(wire77[(4'h9):(4'h9)])) : $unsigned(wire74[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire73[(2'h3):(2'h2)])
        begin
          reg80 <= ($unsigned($unsigned((8'hbc))) ?
              $unsigned((|(wire75[(3'h6):(3'h6)] >= wire75))) : $unsigned(wire74[(1'h0):(1'h0)]));
          if ($signed((7'h41)))
            begin
              reg81 <= ($unsigned((~&($unsigned(wire74) <= (wire76 ?
                      wire77 : (8'hb2))))) ?
                  $signed((wire78 & (~&((8'hb9) ?
                      wire78 : wire78)))) : (wire73[(2'h3):(1'h0)] <<< $unsigned((wire74[(1'h1):(1'h0)] ?
                      {wire73} : (~|wire75)))));
            end
          else
            begin
              reg81 <= wire76[(1'h1):(1'h1)];
              reg82 <= (|$signed($signed(reg80[(3'h4):(2'h3)])));
            end
          reg83 <= $unsigned(wire76);
        end
      else
        begin
          reg80 <= {{(wire74[(3'h7):(3'h4)] ? wire73 : $unsigned((~&wire79)))},
              $signed({$unsigned(reg80[(2'h3):(2'h3)])})};
          reg81 <= $unsigned(reg83[(3'h5):(1'h1)]);
        end
      reg84 <= {(^~(~($unsigned(wire73) & wire75))), wire79[(4'hf):(4'h9)]};
      reg85 <= wire78;
      if (wire79[(2'h3):(2'h2)])
        begin
          if ((!wire77[(3'h5):(2'h2)]))
            begin
              reg86 <= ((|$signed((wire76[(1'h1):(1'h1)] ?
                      ((8'ha7) | wire74) : (reg81 ? (8'ha6) : reg80)))) ?
                  (|{$unsigned((~(8'hac))),
                      reg85[(5'h10):(4'hd)]}) : ((reg85[(5'h11):(4'ha)] ?
                          ({(8'hb1)} >>> (wire78 > wire76)) : reg82[(4'h8):(3'h4)]) ?
                      $signed(({reg80} & wire78[(2'h2):(1'h1)])) : reg80[(3'h7):(3'h5)]));
            end
          else
            begin
              reg86 <= ($signed($unsigned(((wire78 >= (8'hb9)) <<< {wire77}))) ?
                  $unsigned($unsigned($unsigned((reg80 ?
                      wire74 : (8'hb8))))) : (reg86 >> wire75[(3'h7):(2'h3)]));
              reg87 <= $unsigned(wire79);
              reg88 <= $unsigned($unsigned((^~$unsigned((&reg81)))));
              reg89 <= $signed(((|{((8'ha8) ? (8'haf) : reg81)}) ?
                  wire74[(3'h4):(2'h2)] : $unsigned($signed(reg87))));
              reg90 <= (~|$unsigned((($signed(reg84) ?
                      (reg84 ? reg87 : wire75) : wire73[(1'h0):(1'h0)]) ?
                  ({reg83, reg88} ?
                      {reg80} : ((8'hae) ~^ wire79)) : $unsigned((reg81 != wire79)))));
            end
          reg91 <= (wire75 <<< (!wire76));
          if ((!wire78))
            begin
              reg92 <= (^~$signed((((wire79 * wire76) ?
                      {wire78, reg86} : $signed(wire76)) ?
                  ($signed(reg82) ?
                      wire77 : reg81[(2'h2):(1'h0)]) : (-(-(8'ha2))))));
              reg93 <= reg89;
              reg94 <= {$unsigned(reg83[(4'he):(3'h4)])};
            end
          else
            begin
              reg92 <= (wire75 ?
                  ((reg93 <= $unsigned(reg90[(2'h2):(1'h0)])) ?
                      {(8'had),
                          {reg88[(4'h9):(3'h7)]}} : (&(~^reg92[(4'h9):(1'h0)]))) : $unsigned(reg90));
            end
        end
      else
        begin
          reg86 <= (+($unsigned(reg90) && $unsigned({$signed((8'ha6)),
              (8'ha4)})));
          reg87 <= ((reg91 >> (8'ha8)) <<< $unsigned(((8'hb0) >> $signed(((7'h44) ^~ wire78)))));
          reg88 <= $unsigned((($unsigned($unsigned(reg83)) ?
              $signed((wire78 || wire75)) : ((reg94 ?
                  (8'ha7) : reg94) + wire76)) && reg85[(2'h2):(1'h0)]));
        end
      reg95 <= $signed(($signed($signed((&reg82))) ?
          reg83 : $unsigned((|$unsigned(reg93)))));
    end
  assign wire96 = (!reg87);
  assign wire97 = reg88;
  assign wire98 = reg90[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg99 <= (wire97 ?
          (wire97 ?
              (&reg90[(2'h2):(2'h2)]) : (wire96 ~^ (~(reg88 & wire79)))) : $unsigned(wire98));
      reg100 <= wire96[(1'h1):(1'h1)];
      reg101 <= (({reg87, (~|(reg93 ? wire75 : wire79))} ?
          (reg93 ?
              (!(8'hba)) : {reg84[(1'h0):(1'h0)],
                  ((7'h40) & wire77)}) : $unsigned($unsigned(reg87))) ^ ((reg80 ?
              reg92 : (reg86 ?
                  wire77[(1'h0):(1'h0)] : (reg80 ? wire98 : reg99))) ?
          ((~|(reg82 | (8'hbb))) ?
              (reg83 ?
                  $signed((8'hbc)) : reg90) : (wire79 && (~^(8'hab)))) : (~&(-$unsigned((7'h40))))));
    end
  assign wire102 = reg86[(1'h0):(1'h0)];
  assign wire103 = (((((+reg95) ?
                               wire102 : $unsigned((7'h44))) || (reg87 > (reg95 ?
                               (8'hae) : wire73))) ?
                           {(~|(8'hba)),
                               (&(reg82 ? wire76 : reg81))} : $signed(reg80)) ?
                       ((({wire102, wire77} ?
                           $unsigned(reg84) : $signed(reg84)) == $signed({reg88,
                           reg90})) == reg80[(1'h1):(1'h0)]) : reg94[(3'h6):(1'h0)]);
  assign wire104 = $unsigned(wire103[(5'h12):(2'h2)]);
  assign wire105 = ((reg92[(4'he):(2'h3)] ?
                           (($signed(wire102) ?
                                   $signed(reg81) : ((8'ha8) - (8'ha6))) ?
                               (^~$signed(reg90)) : ($unsigned(reg99) ?
                                   reg100 : reg91)) : {wire96[(2'h2):(1'h1)]}) ?
                       $signed($signed(wire96[(2'h2):(1'h0)])) : $unsigned(reg92[(4'hf):(3'h6)]));
  assign wire106 = reg101[(2'h3):(1'h0)];
  assign wire107 = (8'h9c);
  assign wire108 = (-$signed($signed((reg80 && (reg84 ? reg91 : reg85)))));
  assign wire109 = $signed((wire76 ?
                       ($unsigned($signed(reg89)) + reg92[(1'h0):(1'h0)]) : $unsigned((wire98[(1'h0):(1'h0)] >>> wire107[(3'h7):(3'h6)]))));
endmodule

module module22
#(parameter param69 = (^(!((^~(~(8'haf))) ? ({(8'haa), (8'hb2)} ? ((8'h9d) ? (8'hb6) : (8'h9c)) : ((8'ha3) <= (8'hb2))) : ({(8'hae), (8'hb3)} >>> (!(8'hbd)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(3'h6):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  assign y = {wire68,
                 wire63,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire28,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
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
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire28 = (wire24[(1'h1):(1'h0)] ?
                      (8'ha4) : (wire27[(2'h2):(1'h0)] ?
                          wire23 : {(wire23 ? (~&(8'hb0)) : ((8'ha1) ^ wire23)),
                              wire23[(1'h1):(1'h0)]}));
  assign wire29 = (^~$unsigned($signed(wire28[(4'hf):(3'h7)])));
  assign wire30 = $signed((!(wire25 ? wire28 : wire25)));
  always
    @(posedge clk) begin
      reg31 <= $unsigned(((~&((wire28 >= wire23) ?
              {wire30} : $signed(wire24))) ?
          (~$signed(((8'h9c) ? (8'hb1) : wire23))) : (((wire24 ?
              wire27 : wire24) | wire23[(1'h0):(1'h0)]) && wire25)));
      reg32 <= (8'hbd);
    end
  assign wire33 = (~^$signed((wire28 ?
                      (wire29[(4'h8):(1'h1)] ?
                          $signed((8'h9c)) : (wire25 ?
                              wire28 : wire25)) : wire29[(4'hc):(4'ha)])));
  assign wire34 = $unsigned($signed($signed($signed(wire23))));
  assign wire35 = wire30[(1'h1):(1'h1)];
  assign wire36 = (wire25[(2'h2):(1'h0)] - wire27);
  assign wire37 = {$signed($signed(((wire27 < (8'h9c)) | (wire28 - wire25)))),
                      ($unsigned($signed($signed(wire24))) ?
                          reg31[(4'hc):(3'h7)] : wire23)};
  assign wire38 = $unsigned((|(~|($unsigned(wire36) ?
                      $unsigned(reg31) : ((8'had) >> wire24)))));
  assign wire39 = (wire29[(1'h1):(1'h0)] & (8'hb0));
  assign wire40 = $signed((($signed($unsigned(wire23)) >>> wire33[(2'h3):(2'h2)]) ?
                      {wire27,
                          (((8'hb8) != (7'h42)) <<< ((8'ha5) <= wire29))} : (wire35 ?
                          ($signed(reg31) ?
                              wire38 : $unsigned(wire33)) : $unsigned($signed(reg31)))));
  assign wire41 = (wire26 ?
                      wire27[(2'h2):(2'h2)] : (~(wire27 & (((8'haf) ?
                              wire34 : wire37) ?
                          wire36[(3'h4):(2'h2)] : {wire35, wire40}))));
  always
    @(posedge clk) begin
      if (wire25)
        begin
          reg42 <= (~^$signed((~|{$unsigned(wire38)})));
          if ((!$signed($unsigned(wire33[(1'h1):(1'h0)]))))
            begin
              reg43 <= ((wire28[(4'hf):(4'hf)] ?
                      {(~&wire29)} : wire30[(2'h3):(1'h0)]) ?
                  {($signed($unsigned((8'ha9))) ?
                          {(^~wire40),
                              (reg31 > wire38)} : wire38)} : ($unsigned({$signed(wire27)}) ?
                      {reg32[(3'h5):(2'h2)], (8'hb3)} : reg42[(2'h3):(1'h1)]));
              reg44 <= wire39;
              reg45 <= $unsigned(((^~wire40) & ({$signed(wire24),
                  wire25} <<< $signed(wire25))));
              reg46 <= $signed(wire34[(4'hd):(1'h1)]);
              reg47 <= $unsigned(($unsigned(wire24[(2'h2):(1'h0)]) ?
                  wire23[(2'h2):(1'h0)] : $unsigned(wire26[(1'h1):(1'h0)])));
            end
          else
            begin
              reg43 <= {reg46[(3'h6):(1'h1)], wire34[(1'h1):(1'h1)]};
            end
          reg48 <= ((^~wire33) && ((wire35[(4'ha):(2'h2)] ?
              wire26 : (wire26 >> {reg31})) <<< wire39));
          reg49 <= $signed(wire28[(3'h6):(3'h6)]);
          reg50 <= (reg49 ?
              reg32 : ((!(~$signed(wire35))) ?
                  $unsigned((^(wire26 ~^ reg42))) : wire39[(1'h0):(1'h0)]));
        end
      else
        begin
          reg42 <= (8'hae);
          reg43 <= $unsigned($signed(({$unsigned(wire23)} ?
              (reg47[(5'h10):(4'hd)] ?
                  (wire24 ? reg49 : wire41) : {wire28,
                      wire33}) : $signed(wire36))));
          if ((({(~&reg44)} <= $signed(((wire36 ? reg43 : reg46) ?
                  (reg46 + wire35) : ((8'hb5) ? reg48 : wire38)))) ?
              $signed($unsigned($unsigned(wire33[(3'h7):(2'h2)]))) : $unsigned(($unsigned($unsigned(wire25)) != $signed((reg43 ?
                  wire36 : reg44))))))
            begin
              reg44 <= ($signed({reg44[(5'h13):(4'h9)],
                  (reg42 ?
                      reg43[(1'h1):(1'h1)] : {wire38})}) ^~ $signed(reg48));
              reg45 <= (reg32[(4'hb):(2'h2)] || reg50);
              reg46 <= {$unsigned($unsigned(wire36))};
              reg47 <= (^~((~wire34) << wire28[(3'h4):(2'h2)]));
              reg48 <= wire40[(4'h9):(3'h6)];
            end
          else
            begin
              reg44 <= (+(!(~^(~|wire26[(1'h0):(1'h0)]))));
              reg45 <= (wire28 ?
                  wire38 : $signed((($unsigned(wire38) << (reg50 == reg32)) ?
                      ((8'ha4) ?
                          (reg32 + wire38) : (&reg32)) : wire30[(3'h6):(3'h6)])));
              reg46 <= ((~&(((wire40 > wire28) + (reg46 ?
                  wire38 : (8'ha4))) == wire29[(4'hc):(3'h5)])) > $signed(wire38));
              reg47 <= (wire27 ?
                  $unsigned($unsigned(((-wire36) & wire33))) : $signed((~|$unsigned(wire28))));
            end
          if (({((wire40[(1'h1):(1'h1)] ?
                  wire23 : $unsigned(reg31)) == (~^(reg43 ? wire41 : (8'hbd)))),
              ($unsigned((8'hb9)) ?
                  {wire27[(4'h8):(2'h3)],
                      (wire26 ? reg50 : reg46)} : (8'hb7))} > {wire41,
              $signed(($unsigned(wire33) ?
                  $signed(wire25) : reg32[(5'h14):(4'he)]))}))
            begin
              reg49 <= $signed($signed(wire36));
              reg50 <= $unsigned({(((reg45 ? reg46 : wire33) ?
                      $unsigned(reg50) : $signed(wire29)) & reg44),
                  $unsigned(($unsigned(wire25) == reg44[(4'he):(4'hb)]))});
            end
          else
            begin
              reg49 <= (^wire23[(2'h2):(1'h1)]);
            end
        end
      reg51 <= ($unsigned(($signed((reg44 == (8'hbf))) * ((reg42 ?
          wire23 : wire30) & wire41))) <= (($unsigned((wire28 << wire33)) * ((reg31 ?
          wire30 : wire26) << wire27)) & (-$unsigned(((8'hb5) + wire40)))));
      reg52 <= ((~|wire41) ~^ $signed($signed($unsigned(wire37[(1'h1):(1'h1)]))));
      reg53 <= ((reg52[(1'h0):(1'h0)] ?
          $unsigned((7'h44)) : ((-(7'h41)) ?
              $unsigned($unsigned(wire38)) : ((+reg52) ?
                  (reg46 ?
                      wire24 : wire28) : reg52))) - {$signed($signed((^~wire36))),
          $unsigned((-reg48[(1'h1):(1'h0)]))});
      reg54 <= (~|$unsigned(((wire36 ?
          {(8'hae)} : $unsigned(wire27)) + ((reg44 ?
          (8'ha5) : reg50) < $signed(reg44)))));
    end
  assign wire55 = $unsigned($unsigned(((-wire39) * wire27)));
  assign wire56 = reg54;
  assign wire57 = wire40[(3'h5):(2'h3)];
  assign wire58 = reg42[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg59 <= reg54;
      reg60 <= (-wire37[(4'h8):(3'h7)]);
      reg61 <= wire40[(2'h3):(1'h1)];
      reg62 <= {$unsigned((^((~&(8'ha2)) && $unsigned(wire30)))),
          wire28[(4'hf):(1'h1)]};
    end
  assign wire63 = (reg60 ?
                      $unsigned(wire27[(3'h7):(2'h3)]) : ($unsigned((reg31 ?
                          reg53 : reg53)) & (-({reg46} <= reg50[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg64 <= $signed($unsigned($unsigned(reg52)));
      if (reg59[(1'h1):(1'h0)])
        begin
          reg65 <= ((-wire57) ?
              wire33 : ((~^reg62) ?
                  (~^$unsigned(wire57[(3'h6):(3'h6)])) : (8'hbd)));
          reg66 <= $signed(wire39);
          reg67 <= (reg51 ?
              ((|$signed((~wire58))) ~^ {($signed(reg49) || $unsigned((8'hb8)))}) : reg49[(3'h6):(1'h1)]);
        end
      else
        begin
          reg65 <= wire40;
          reg66 <= $unsigned($unsigned($unsigned(($signed(reg66) ?
              ((8'hac) | wire58) : ((8'ha7) ? reg31 : wire41)))));
          reg67 <= wire58[(4'hd):(2'h3)];
        end
    end
  assign wire68 = {reg45[(2'h3):(2'h2)]};
endmodule
