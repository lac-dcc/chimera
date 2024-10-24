module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire124;
  reg [(3'h6):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  assign y = {wire160,
                 wire158,
                 wire134,
                 wire133,
                 wire127,
                 wire126,
                 wire4,
                 wire5,
                 wire6,
                 wire124,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 (1'h0)};
  assign wire4 = wire2[(4'ha):(2'h2)];
  assign wire5 = wire0;
  assign wire6 = ((({$unsigned(wire3), (wire5 << wire2)} ?
                             (+(wire4 && wire5)) : ($signed(wire4) ?
                                 {wire5} : $unsigned((8'h9e)))) ?
                         wire0[(4'hc):(2'h2)] : ((wire4 ?
                             (wire3 ~^ wire3) : (^~wire2)) >> $signed((wire5 ?
                             wire1 : wire3)))) ?
                     (~&{wire3}) : ((&wire3[(4'hb):(4'h8)]) ?
                         $unsigned(wire5[(2'h3):(2'h2)]) : (wire2 ^ (wire3[(4'he):(3'h6)] >> $unsigned(wire1)))));
  module7 #() modinst125 (.wire11(wire5), .clk(clk), .wire12(wire2), .wire9(wire4), .wire8(wire0), .wire10(wire6), .y(wire124));
  assign wire126 = ($unsigned((8'hb5)) ?
                       $signed($unsigned((wire3 ?
                           (wire5 ?
                               wire0 : wire1) : (wire5 | wire3)))) : wire2);
  assign wire127 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg128 <= {wire5[(4'h9):(2'h3)]};
      if ((|(($signed({wire3, (7'h42)}) && (wire5 ?
              (wire5 << (8'hbc)) : wire4[(4'h9):(3'h6)])) ?
          $signed($unsigned(wire126[(3'h5):(1'h0)])) : (((~^reg128) ?
                  (-(7'h41)) : (&wire6)) ?
              (wire3 ? (^~wire3) : (^~wire6)) : (|(wire2 << (8'ha8)))))))
        begin
          reg129 <= (($unsigned(($unsigned(wire126) ?
                  $unsigned(wire126) : $unsigned(wire127))) ?
              (^wire126[(3'h7):(3'h7)]) : wire127) >>> wire127);
          reg130 <= $unsigned(reg129[(2'h3):(2'h2)]);
          reg131 <= $signed((-$signed($unsigned(wire3[(4'hd):(2'h3)]))));
        end
      else
        begin
          reg129 <= ($signed(wire124) & (~|$unsigned(wire6[(3'h6):(3'h4)])));
          reg130 <= wire3[(2'h3):(2'h3)];
        end
      reg132 <= wire1[(3'h4):(2'h2)];
    end
  assign wire133 = {$unsigned(wire1[(2'h2):(1'h1)]), {(8'hb6)}};
  assign wire134 = $signed($unsigned(((~^wire5) ?
                       $signed((!(8'had))) : {(~wire3)})));
  module135 #() modinst159 (wire158, clk, wire134, wire6, wire127, wire0);
  assign wire160 = reg129;
endmodule

module module135
#(parameter param156 = (^~(7'h42)), 
parameter param157 = ((param156 ? (((param156 << param156) ? param156 : (param156 ? param156 : param156)) ? ({(8'hb5), param156} ? (param156 ? (8'hbc) : param156) : (+param156)) : {(param156 - param156)}) : param156) ? (((param156 ? (8'haa) : (param156 ^ (8'hae))) ? param156 : (-(param156 ? param156 : param156))) != (((param156 ? param156 : param156) >>> (param156 << param156)) ? ({(8'hb2)} != (param156 ? param156 : param156)) : param156)) : (((~^param156) && (^param156)) ? (-(+param156)) : (param156 ? ((~^param156) == ((7'h44) == param156)) : {(~param156), (^param156)}))))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire139;
  input wire signed [(4'h9):(1'h0)] wire138;
  input wire signed [(4'hd):(1'h0)] wire137;
  input wire [(5'h15):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire155;
  wire signed [(4'hf):(1'h0)] wire153;
  wire [(2'h3):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  wire [(5'h15):(1'h0)] wire140;
  assign y = {wire155, wire153, wire142, wire141, wire140, (1'h0)};
  assign wire140 = $signed({(!(~^((8'hbf) ? wire138 : wire136)))});
  assign wire141 = $signed((wire137 == wire137));
  assign wire142 = ((wire136[(2'h2):(1'h0)] <<< wire141) ~^ (((wire136 ?
                       (wire136 & wire140) : {wire137,
                           wire141}) <= wire139) >> $signed($unsigned(wire139[(2'h3):(1'h0)]))));
  module143 #() modinst154 (.wire146(wire140), .clk(clk), .wire145(wire138), .wire147(wire141), .y(wire153), .wire144(wire139));
  assign wire155 = (8'hab);
endmodule

module module7
#(parameter param122 = ((!(|({(8'hb9)} ? ((8'hba) ? (8'hae) : (8'ha5)) : (~&(8'hb8))))) | {(-(((8'h9d) ~^ (8'ha6)) ? (&(8'ha3)) : {(8'haa)}))}), 
parameter param123 = (param122 ? param122 : {(~^{param122}), {param122, (param122 ? param122 : (param122 >= (8'ha6)))}}))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire111;
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire51,
                 wire77,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire111,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= (~^wire8);
    end
  assign wire14 = {wire8};
  assign wire15 = wire14[(4'h9):(4'h9)];
  assign wire16 = $signed($unsigned($signed($signed($signed(reg13)))));
  assign wire17 = wire8;
  assign wire18 = (($signed($signed(wire12)) >> $signed($unsigned(((8'ha0) <= wire8)))) <<< (^~$unsigned($signed(wire17))));
  module19 #() modinst52 (.wire21(wire11), .y(wire51), .wire23(wire15), .wire22(wire12), .wire20(wire16), .clk(clk));
  module53 #() modinst78 (.wire57(wire12), .wire54(wire51), .y(wire77), .wire55(wire11), .clk(clk), .wire56(wire9));
  assign wire79 = $unsigned(wire9);
  assign wire80 = $signed(wire77[(3'h4):(1'h1)]);
  assign wire81 = ($unsigned($signed($unsigned(wire11))) ?
                      ($unsigned((((8'ha6) ? wire18 : wire10) ?
                              wire15 : ((8'ha5) <<< wire11))) ?
                          ($signed((^~wire80)) >= wire12) : ((wire79[(2'h2):(1'h1)] != (wire9 ?
                                  wire80 : reg13)) ?
                              ((wire14 < wire14) - $signed(wire17)) : (~wire14[(4'he):(1'h1)]))) : (wire79 ?
                          wire17 : $unsigned((-((8'hb1) <= wire80)))));
  assign wire82 = $signed((((reg13[(1'h1):(1'h0)] - (wire79 ?
                          wire80 : wire77)) ?
                      $signed(wire51[(2'h3):(2'h3)]) : (~^((8'hb9) >= wire11))) + (~^(wire14[(5'h10):(4'hb)] ?
                      $signed(wire17) : wire79[(4'h8):(3'h6)]))));
  module83 #() modinst112 (.wire87(wire16), .wire85(wire77), .wire88(wire81), .clk(clk), .y(wire111), .wire84(wire11), .wire86(wire15));
  assign wire113 = $unsigned((($unsigned((reg13 ?
                       wire12 : wire111)) >= $unsigned(wire10)) != $unsigned(((8'ha2) ?
                       $signed(wire77) : $signed((8'h9c))))));
  assign wire114 = ($unsigned($unsigned($unsigned($signed(wire80)))) ^ (+$unsigned((&$signed((7'h41))))));
  assign wire115 = $unsigned((^$signed(wire8[(1'h1):(1'h1)])));
  assign wire116 = $unsigned((wire14[(4'h9):(3'h4)] ^ wire15));
  assign wire117 = wire15;
  assign wire118 = wire80[(3'h4):(2'h3)];
  assign wire119 = {{(~&wire18), (^~$unsigned($signed(wire14)))}};
  assign wire120 = (^~wire11[(1'h0):(1'h0)]);
  assign wire121 = ((($unsigned(wire79) | $signed(wire119[(3'h6):(3'h6)])) & (((wire14 - wire51) << (^~wire120)) - (&wire11))) ?
                       wire18[(2'h3):(2'h2)] : {(((-wire119) <<< reg13) >>> (|$signed(wire16)))});
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire88;
  input wire [(4'ha):(1'h0)] wire87;
  input wire signed [(4'hb):(1'h0)] wire86;
  input wire signed [(5'h10):(1'h0)] wire85;
  input wire signed [(4'hb):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(3'h7):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire [(4'hd):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire96;
  wire [(2'h2):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire89;
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg90,
                 (1'h0)};
  assign wire89 = wire84;
  always
    @(posedge clk) begin
      reg90 <= $unsigned({wire84});
    end
  assign wire91 = $unsigned($unsigned({wire87[(3'h5):(2'h2)],
                      ((wire88 && (8'ha3)) | (+wire84))}));
  assign wire92 = ({$unsigned((((8'haf) ? (8'haa) : wire86) <<< (wire86 ?
                          wire87 : wire87))),
                      ((wire87 ?
                          (+wire86) : ((7'h40) ~^ wire87)) < ({wire87} >> ((8'hb6) ?
                          (8'had) : (7'h44))))} ~^ $unsigned({$unsigned({(8'haf),
                          wire86})}));
  assign wire93 = (wire89[(4'ha):(4'h9)] ?
                      wire89[(4'h9):(3'h7)] : (((~^(^wire88)) ?
                          reg90[(4'hc):(4'ha)] : $signed($signed(wire92))) ~^ $signed(reg90)));
  assign wire94 = (~|$signed($signed(($unsigned(wire88) ?
                      reg90 : wire93[(3'h4):(1'h0)]))));
  assign wire95 = ((7'h43) && $signed((wire89[(3'h5):(2'h2)] ?
                      {$signed(wire87), $signed(wire85)} : wire91)));
  assign wire96 = (($unsigned((wire93[(4'h8):(1'h1)] ?
                      (8'hb1) : $unsigned((8'hbc)))) << $unsigned(($unsigned(wire86) <<< $signed(wire89)))) && (((8'ha6) - wire87[(4'ha):(3'h7)]) == wire89));
  assign wire97 = (reg90[(5'h12):(4'hc)] >> wire85[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg98 <= $signed($signed((((wire91 >> (8'hba)) ?
              (wire93 ? (8'h9d) : wire97) : $unsigned(wire95)) ?
          $unsigned(wire87[(1'h1):(1'h0)]) : (wire94[(1'h0):(1'h0)] || wire91))));
      reg99 <= $unsigned($signed(($signed((~wire85)) != ({reg90,
          wire91} <<< $unsigned(reg90)))));
      reg100 <= $unsigned(($signed(reg99) * (~&$signed(wire96[(3'h6):(3'h5)]))));
      reg101 <= {$unsigned($signed({$signed((8'hb1))}))};
    end
  assign wire102 = $signed($signed((reg100[(1'h1):(1'h0)] * $unsigned($unsigned(reg100)))));
  assign wire103 = wire102;
  assign wire104 = wire87[(1'h0):(1'h0)];
  assign wire105 = (^({(-reg90),
                       wire93[(2'h2):(1'h1)]} == {$unsigned($unsigned(reg100))}));
  assign wire106 = (~$signed((wire89 ? wire104 : wire93[(3'h5):(2'h2)])));
  assign wire107 = $signed(($signed(($unsigned(wire106) < reg99)) | (~wire87[(3'h7):(1'h0)])));
  assign wire108 = $unsigned($unsigned(wire106[(1'h1):(1'h1)]));
  assign wire109 = ($signed($signed($signed((wire108 && (8'ha0))))) ?
                       wire94[(4'he):(4'h8)] : reg101[(2'h3):(2'h2)]);
  assign wire110 = $signed({wire88, wire93[(3'h4):(2'h3)]});
endmodule

module module53
#(parameter param76 = (&{((((8'hba) ? (8'hbd) : (8'h9d)) <<< (~|(8'hb6))) ? ({(8'hbd)} ? {(8'had), (8'ha8)} : (-(8'hb0))) : (((8'hb9) ? (8'hbc) : (8'hbd)) ^~ ((8'hae) ? (7'h43) : (8'ha2))))}))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  input wire signed [(4'hf):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(5'h15):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 (1'h0)};
  assign wire58 = $signed(wire54[(1'h1):(1'h1)]);
  assign wire59 = wire54[(4'ha):(4'h8)];
  assign wire60 = $signed(($unsigned({$signed(wire54)}) ?
                      (((|wire54) ?
                          $unsigned(wire54) : wire57[(2'h2):(1'h0)]) > wire55) : $unsigned((~&(wire59 < wire58)))));
  assign wire61 = wire60[(1'h1):(1'h1)];
  assign wire62 = wire60[(3'h5):(3'h4)];
  assign wire63 = $signed(wire61);
  assign wire64 = ($signed($signed(wire60)) ?
                      (~&wire62[(3'h5):(3'h4)]) : wire55[(4'ha):(2'h3)]);
  assign wire65 = ({{$unsigned($unsigned(wire56)),
                          $unsigned(wire59[(1'h1):(1'h1)])},
                      ($unsigned($signed(wire57)) ?
                          ((wire58 ?
                              (8'hbf) : (8'ha5)) && $unsigned(wire54)) : (~|(wire62 ^~ wire64)))} <= wire59[(1'h1):(1'h0)]);
  assign wire66 = ($signed(wire65[(3'h5):(2'h2)]) && ({$unsigned(wire64[(3'h6):(3'h5)]),
                      (|$unsigned(wire64))} != $signed((~^$unsigned(wire56)))));
  assign wire67 = (+{wire59[(3'h4):(2'h3)], wire56[(2'h3):(1'h0)]});
  assign wire68 = (~&(({$unsigned((8'hb7)), wire56[(1'h0):(1'h0)]} ?
                      $unsigned(wire66) : wire67) >>> $signed($unsigned($unsigned(wire67)))));
  assign wire69 = wire55;
  assign wire70 = wire68[(4'hf):(1'h0)];
  assign wire71 = $unsigned((^wire54));
  assign wire72 = wire68;
  assign wire73 = (~&(($unsigned((wire65 == wire62)) ?
                          ((wire60 * wire63) * (wire61 > wire71)) : ((wire72 ?
                              wire66 : (8'ha8)) >= (&(8'ha2)))) ?
                      {$unsigned($unsigned(wire54)),
                          (wire57 ?
                              wire55[(3'h7):(1'h1)] : (~^wire72))} : $unsigned(((-wire71) ?
                          wire63 : (~&wire63)))));
  assign wire74 = $unsigned(wire68[(4'h8):(2'h2)]);
  assign wire75 = $signed(wire71);
endmodule

module module19
#(parameter param49 = (&(+(((~|(8'hb6)) - ((8'hb0) ? (8'ha4) : (8'hae))) << (!((8'hb9) ^~ (8'hb0)))))), 
parameter param50 = (param49 ~^ param49))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(3'h4):(1'h0)] wire22;
  input wire [(4'hd):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg48,
                 reg47,
                 reg46,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire24 = $signed($unsigned(wire20[(2'h3):(2'h2)]));
  assign wire25 = $signed({wire22, $unsigned((-(wire24 >> wire23)))});
  assign wire26 = wire25;
  assign wire27 = wire23;
  always
    @(posedge clk) begin
      reg28 <= wire20[(4'h8):(1'h0)];
      reg29 <= reg28[(4'hf):(4'hd)];
      reg30 <= wire25[(4'hc):(3'h6)];
      reg31 <= {reg30};
      if ({{$unsigned($signed($signed(wire22))),
              {$signed($unsigned(wire23)), wire26[(1'h0):(1'h0)]}},
          (wire23 >= $unsigned($signed(((8'hbf) ? wire27 : (8'haf)))))})
        begin
          reg32 <= $signed({wire25});
          reg33 <= {(wire21 ?
                  $unsigned(wire20) : (($unsigned(reg30) <= $unsigned(wire21)) ?
                      ($unsigned((8'hb9)) ^ $signed(wire23)) : wire20))};
        end
      else
        begin
          reg32 <= (((((wire20 | reg29) * (reg32 ?
                  wire27 : wire21)) <= ($unsigned(reg31) >= (wire25 ~^ reg33))) ?
              $signed(wire22) : ($unsigned($signed(reg28)) ?
                  (wire22[(1'h0):(1'h0)] ?
                      wire24[(2'h3):(2'h3)] : {reg31}) : $unsigned($unsigned(wire25)))) >= {wire22[(1'h1):(1'h1)]});
          reg33 <= (&(wire23 || (wire24[(4'ha):(2'h3)] ?
              (!wire21[(1'h1):(1'h0)]) : wire26)));
          if ((wire26[(1'h1):(1'h1)] ^ $unsigned((8'ha8))))
            begin
              reg34 <= $signed($signed((((wire26 ?
                      (8'h9e) : wire27) <= $signed(wire26)) ?
                  (!$signed(wire25)) : (&wire24))));
              reg35 <= wire26[(2'h3):(2'h2)];
              reg36 <= (!{$unsigned($signed($unsigned((8'ha1)))), (7'h40)});
            end
          else
            begin
              reg34 <= reg29[(3'h4):(2'h2)];
              reg35 <= reg29[(5'h13):(4'h9)];
              reg36 <= ($unsigned({(!(reg28 & reg33)),
                      (reg29[(1'h1):(1'h1)] & wire20[(4'h8):(3'h6)])}) ?
                  ($signed(($unsigned((8'hba)) >= {reg32})) <<< {$signed((reg30 >> (8'ha9)))}) : $unsigned((^~((wire26 ?
                          wire23 : wire23) ?
                      $unsigned(wire22) : {reg32, (8'hbf)}))));
              reg37 <= (((~&reg28) ^ reg30[(4'hb):(3'h6)]) ?
                  $signed(($signed($unsigned(reg33)) == ((8'hb9) ?
                      $signed(reg29) : (-wire23)))) : wire25[(4'hc):(1'h0)]);
            end
          reg38 <= ((~|{((reg28 ? (8'ha0) : (8'ha7)) ?
                  ((7'h43) == reg30) : $signed(reg35)),
              (8'h9f)}) <= (((8'hac) ?
                  reg29[(4'ha):(3'h6)] : reg33[(1'h1):(1'h1)]) ?
              (($unsigned((8'ha2)) - reg35[(1'h1):(1'h1)]) ?
                  (reg29[(4'h9):(2'h3)] ?
                      wire22 : (wire27 ?
                          wire23 : reg30)) : (reg34 <= (+reg33))) : (-reg31[(4'hd):(4'h8)])));
          reg39 <= (7'h43);
        end
    end
  assign wire40 = $signed({$signed((~|$unsigned(reg32)))});
  assign wire41 = $signed(wire25);
  assign wire42 = $unsigned((^$signed($unsigned((wire22 <<< wire40)))));
  assign wire43 = (+(-(((wire41 & (8'ha1)) ?
                      (~&reg29) : {reg39, reg33}) >= ({reg31} || (7'h43)))));
  assign wire44 = (^$signed((^~({wire26, (8'hb5)} ? {wire25, reg32} : reg28))));
  assign wire45 = (wire41[(4'h9):(4'h9)] ?
                      $signed(((((8'ha1) >> wire22) ~^ wire21) != wire42[(1'h0):(1'h0)])) : (7'h40));
  always
    @(posedge clk) begin
      reg46 <= wire42;
      reg47 <= wire41;
      reg48 <= wire26;
    end
endmodule

module module143  (y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire146;
  input wire signed [(4'h9):(1'h0)] wire145;
  input wire [(3'h4):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(5'h14):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire [(4'hc):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire148;
  assign y = {wire152, wire151, wire150, wire149, wire148, (1'h0)};
  assign wire148 = (wire147[(2'h3):(2'h2)] + (~^wire147[(4'hb):(3'h4)]));
  assign wire149 = ($unsigned(({(wire148 ? wire146 : (8'hba)),
                       (wire145 ? wire144 : (8'ha6))} < ((+wire145) ?
                       $unsigned((8'hab)) : $signed(wire144)))) <= (((((8'hbc) ?
                               wire148 : wire148) ?
                           (wire148 ? wire145 : wire144) : {wire148,
                               wire147}) <<< ($signed(wire146) ?
                           wire147[(3'h4):(1'h1)] : $signed(wire148))) ?
                       ($signed({wire146}) ?
                           (~|(8'ha1)) : (!((8'hba) ?
                               wire148 : wire145))) : ((~|$signed(wire144)) ?
                           wire148[(2'h2):(2'h2)] : wire145)));
  assign wire150 = wire145;
  assign wire151 = (wire148[(2'h3):(1'h1)] ? (&wire148) : wire150);
  assign wire152 = {(&(wire149[(1'h1):(1'h0)] - wire149)), $unsigned(wire146)};
endmodule
