module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire164;
  wire signed [(4'ha):(1'h0)] wire162;
  wire [(4'ha):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire160;
  wire signed [(2'h3):(1'h0)] wire159;
  wire signed [(4'ha):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire157;
  wire [(5'h12):(1'h0)] wire156;
  wire signed [(3'h7):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire signed [(4'hb):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire42;
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire145,
                 wire46,
                 wire45,
                 wire44,
                 wire5,
                 wire6,
                 wire42,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire5 = wire2[(2'h2):(2'h2)];
  assign wire6 = ($unsigned(wire0[(3'h6):(1'h1)]) << wire0);
  module7 #() modinst43 (.wire9(wire0), .wire11(wire6), .clk(clk), .wire10(wire3), .y(wire42), .wire12(wire2), .wire8(wire4));
  assign wire44 = wire2[(1'h1):(1'h1)];
  assign wire45 = (wire1 ^~ (wire4[(3'h7):(2'h3)] > wire0));
  assign wire46 = {$unsigned($signed(($unsigned(wire6) ?
                          wire3[(4'he):(3'h4)] : $unsigned(wire45))))};
  module47 #() modinst146 (.wire51(wire5), .wire48(wire4), .y(wire145), .wire50(wire45), .wire49(wire44), .clk(clk));
  always
    @(posedge clk) begin
      reg147 <= wire45;
      reg148 <= $unsigned(($signed((&(wire145 ? wire46 : wire4))) ?
          wire6[(2'h2):(1'h1)] : $signed($unsigned(wire5[(5'h12):(5'h10)]))));
      reg149 <= wire3[(3'h6):(1'h1)];
      reg150 <= $unsigned(wire2);
      reg151 <= (!{(wire145 ? wire6[(3'h6):(1'h0)] : wire6)});
    end
  assign wire152 = ({$signed((~|(wire6 > wire0))), reg150[(4'h8):(4'h8)]} ?
                       (7'h41) : {$signed(wire42),
                           (((~|wire3) ?
                                   $signed(wire45) : (wire3 ? wire1 : wire1)) ?
                               $signed(reg151) : {$signed(wire3),
                                   $unsigned((8'ha6))})});
  assign wire153 = $signed(((!{$unsigned((8'hb3))}) ?
                       $unsigned((~(wire45 >>> reg148))) : wire145[(1'h1):(1'h1)]));
  assign wire154 = wire145[(4'h8):(4'h8)];
  assign wire155 = (((7'h42) ?
                       $signed((wire1[(4'hb):(2'h2)] ?
                           reg151 : wire44[(5'h12):(5'h12)])) : (8'hbc)) >= (wire44[(3'h7):(2'h3)] << (~^((~^wire46) >> wire153))));
  assign wire156 = wire5[(4'hd):(4'h8)];
  assign wire157 = wire152;
  assign wire158 = $signed(((((wire154 ? wire154 : wire145) ?
                           (!wire6) : $signed(wire2)) ?
                       ({(8'ha8),
                           wire0} >>> wire5[(4'h8):(2'h3)]) : $signed((^~wire145))) < ({(reg147 ?
                               wire2 : (8'ha4))} ?
                       ((^~reg151) ?
                           {wire152,
                               wire153} : $unsigned(wire3)) : $unsigned((!reg147)))));
  assign wire159 = (|wire4);
  assign wire160 = $unsigned(($unsigned(((-(8'ha9)) ?
                           $unsigned((8'ha9)) : (wire46 > wire45))) ?
                       wire3[(4'h9):(2'h3)] : ((wire45[(3'h5):(3'h4)] * $unsigned(wire4)) <<< (8'hb2))));
  assign wire161 = (((~(~&(wire2 != wire2))) ?
                       (8'ha8) : reg150) && wire155[(3'h4):(3'h4)]);
  module53 #() modinst163 (.wire56(wire155), .wire57(wire158), .wire55(wire3), .wire54(wire154), .y(wire162), .clk(clk));
  assign wire164 = (+$unsigned(wire154[(3'h4):(3'h4)]));
  assign wire165 = $unsigned(((-$signed((wire44 - reg150))) == (($unsigned(wire0) - (wire5 || (8'hb7))) < (wire145[(1'h1):(1'h0)] >> (wire154 - wire4)))));
  assign wire166 = {$signed({wire162[(2'h3):(1'h1)]}),
                       (^~(|$unsigned((wire44 < wire161))))};
endmodule

module module47  (y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire51;
  input wire signed [(5'h10):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'hb):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire107;
  wire [(4'h8):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire52;
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  assign y = {wire144,
                 wire142,
                 wire113,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire52,
                 reg92,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 (1'h0)};
  assign wire52 = ((((+$signed(wire51)) ?
                          $unsigned((~^wire49)) : wire51[(4'hc):(1'h0)]) ?
                      {{$signed(wire48),
                              wire49}} : wire48[(4'h8):(4'h8)]) < $signed({(^~{wire51}),
                      wire51}));
  module53 #() modinst88 (.clk(clk), .wire54(wire51), .wire57(wire49), .wire56(wire48), .y(wire87), .wire55(wire52));
  assign wire89 = (wire87[(1'h1):(1'h0)] && (8'ha9));
  assign wire90 = wire49[(2'h2):(1'h0)];
  assign wire91 = ({$unsigned($signed((wire50 ? wire87 : wire49))), wire87} ?
                      wire50[(4'hd):(2'h3)] : (~|{wire50[(2'h3):(2'h3)]}));
  always
    @(posedge clk) begin
      reg92 <= {$signed($unsigned(wire50)), wire89[(4'he):(3'h7)]};
    end
  module93 #() modinst104 (wire103, clk, reg92, wire91, wire49, wire50, wire48);
  assign wire105 = $signed(($signed(wire91) != wire91[(1'h1):(1'h0)]));
  assign wire106 = wire49[(3'h4):(1'h0)];
  assign wire107 = wire89[(5'h10):(2'h3)];
  always
    @(posedge clk) begin
      reg108 <= wire50;
      if (wire51[(4'he):(3'h5)])
        begin
          reg109 <= ((wire89 >= $signed(((wire51 != wire103) >>> {wire91}))) && {(^{{wire103,
                      wire90},
                  (wire107 ? wire103 : wire103)})});
          reg110 <= wire52;
          reg111 <= ($signed((~&((|wire103) ?
              wire91 : $signed(wire107)))) ^ wire91[(1'h1):(1'h1)]);
          reg112 <= (|wire52[(1'h1):(1'h0)]);
        end
      else
        begin
          reg109 <= $unsigned($signed((^((reg110 > wire91) ?
              wire49[(4'h8):(4'h8)] : (reg109 ? wire50 : wire90)))));
        end
    end
  assign wire113 = (wire49[(3'h7):(3'h5)] + $unsigned(reg92));
  module114 #() modinst143 (wire142, clk, reg110, wire51, wire107, wire105, wire49);
  assign wire144 = $unsigned(wire49[(4'h8):(3'h5)]);
endmodule

module module7  (y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire40;
  assign y = {wire13, wire14, wire15, wire16, wire40, (1'h0)};
  assign wire13 = (wire8[(2'h2):(1'h0)] ?
                      $signed(($signed((wire11 < wire12)) ?
                          $unsigned(wire8) : wire11[(5'h12):(2'h3)])) : ({((~wire10) - $unsigned(wire10)),
                          $signed(wire10[(4'h8):(2'h3)])} ~^ ((wire10 ?
                          {wire8} : (wire9 ?
                              wire8 : (8'hb6))) & $signed($unsigned((8'haf))))));
  assign wire14 = $signed($signed($signed(wire8)));
  assign wire15 = (+$signed($unsigned(((-wire10) ?
                      $unsigned(wire12) : (wire12 ? wire13 : wire10)))));
  assign wire16 = $signed(wire10[(3'h7):(1'h1)]);
  module17 #() modinst41 (.clk(clk), .wire20(wire14), .wire22(wire9), .y(wire40), .wire18(wire8), .wire19(wire15), .wire21(wire12));
endmodule

module module17
#(parameter param39 = (|{(~|(8'hb0)), ((-(~|(8'hb0))) >> {((8'hab) ? (8'ha8) : (8'ha1)), ((8'hb7) ? (8'hb3) : (7'h40))})}))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(3'h4):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire38,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire23 = ($unsigned($unsigned((-$unsigned((8'ha9))))) ?
                      (8'h9f) : $signed((wire20 >= ((wire21 >>> wire18) ?
                          (wire22 ? wire18 : wire22) : (^(8'hae))))));
  assign wire24 = (~wire18);
  assign wire25 = {(-((|wire23) ?
                          (wire23 ?
                              (wire21 >> wire23) : (wire20 < wire22)) : (+(wire22 ?
                              (7'h42) : wire23))))};
  assign wire26 = (&(~wire18[(1'h1):(1'h0)]));
  assign wire27 = $unsigned(((-((wire22 ? (8'ha3) : wire20) ?
                          $signed(wire22) : (wire20 ? wire18 : wire18))) ?
                      (wire20[(2'h2):(1'h0)] ?
                          ((8'hb1) << (wire26 == wire23)) : ($signed(wire24) >> $signed(wire24))) : $unsigned({$unsigned(wire23)})));
  assign wire28 = $signed((wire26 ^~ (wire22 ? wire20 : wire22)));
  assign wire29 = (wire23[(3'h5):(2'h3)] ^ $signed((wire22[(1'h0):(1'h0)] ?
                      (wire26[(1'h1):(1'h0)] * (^wire20)) : ({wire28} >= wire28[(1'h1):(1'h0)]))));
  assign wire30 = ($signed(wire22) + (8'hbc));
  assign wire31 = $signed(($unsigned(wire24) ?
                      wire26[(2'h2):(2'h2)] : wire21[(2'h2):(1'h1)]));
  assign wire32 = wire30;
  assign wire33 = (~&(((+(-wire21)) << wire19) ?
                      $unsigned($signed({(7'h41)})) : $signed((^~$unsigned(wire26)))));
  always
    @(posedge clk) begin
      reg34 <= ($signed($unsigned($unsigned((~^wire29)))) ?
          $unsigned(($unsigned(wire28[(3'h6):(2'h3)]) >= $signed((~|wire32)))) : $signed(((wire18[(1'h1):(1'h1)] <= (wire18 <<< (8'hbe))) - {wire23[(1'h0):(1'h0)],
              $signed((8'hbe))})));
      reg35 <= (reg34 - (7'h42));
      reg36 <= ((~$signed($signed($signed(wire28)))) ?
          wire23 : ($unsigned(reg35) ?
              (wire28 ?
                  $unsigned((wire31 ? reg35 : wire19)) : ((+wire24) ?
                      {wire29,
                          wire22} : (wire32 * wire18))) : wire21[(2'h2):(1'h1)]));
      reg37 <= {wire29[(1'h0):(1'h0)]};
    end
  assign wire38 = wire28[(2'h2):(1'h1)];
endmodule

module module114  (y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire119;
  input wire signed [(3'h6):(1'h0)] wire118;
  input wire signed [(3'h7):(1'h0)] wire117;
  input wire signed [(4'hb):(1'h0)] wire116;
  input wire signed [(3'h6):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire141;
  wire [(4'h8):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire signed [(5'h13):(1'h0)] wire131;
  wire signed [(4'hd):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(5'h13):(1'h0)] wire124;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'h8):(1'h0)] reg135 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire120 = $unsigned($unsigned($unsigned($unsigned(wire119[(3'h4):(2'h2)]))));
  assign wire121 = (-$signed($unsigned((wire117[(2'h3):(1'h0)] | (^wire119)))));
  assign wire122 = (&(~^$signed($signed(wire120[(4'h8):(2'h2)]))));
  assign wire123 = (8'hb9);
  assign wire124 = $unsigned(wire118[(2'h2):(1'h1)]);
  assign wire125 = $signed((~^(wire118[(3'h5):(3'h4)] > ({wire116, wire118} ?
                       $signed(wire121) : (wire121 ? wire119 : wire122)))));
  assign wire126 = $signed($unsigned($signed($signed({wire124}))));
  assign wire127 = wire117;
  assign wire128 = wire124;
  assign wire129 = ((&{(wire122 == (wire117 <<< wire127)),
                       wire123}) >> wire127[(3'h4):(3'h4)]);
  assign wire130 = (wire121[(4'h9):(3'h7)] ?
                       $unsigned($signed(wire124[(2'h2):(1'h1)])) : (8'hbb));
  assign wire131 = wire122;
  assign wire132 = wire118[(2'h3):(1'h1)];
  assign wire133 = ($unsigned((^wire130)) ? wire128[(2'h2):(1'h1)] : wire123);
  assign wire134 = (~$signed(((wire123 ?
                           $unsigned(wire127) : $signed(wire126)) ?
                       ($signed(wire122) ?
                           (wire130 ?
                               wire122 : wire124) : {wire115}) : ((8'hb6) <<< (-wire126)))));
  always
    @(posedge clk) begin
      reg135 <= (($signed($unsigned($unsigned(wire122))) << wire116[(1'h1):(1'h0)]) ?
          (~&$unsigned(($signed(wire130) ^~ $unsigned(wire134)))) : $signed(wire116));
      reg136 <= (wire128 ?
          ($signed($unsigned((8'hb3))) ^ $unsigned(wire121[(3'h5):(1'h0)])) : ((~(wire131 ?
              $unsigned((8'hb3)) : $signed((8'hbf)))) || wire119[(3'h4):(1'h1)]));
      reg137 <= {(^wire124)};
      reg138 <= $unsigned({(!($unsigned(wire115) <= {wire117})), wire129});
      reg139 <= $unsigned($unsigned(($signed((wire119 ? wire123 : (8'hb4))) ?
          (wire130[(4'hc):(3'h5)] ?
              wire120 : (wire122 ? (8'hbd) : wire131)) : (&wire118))));
    end
  assign wire140 = (wire119[(2'h3):(1'h0)] && $unsigned((wire129[(2'h3):(1'h0)] ^~ ({(7'h41)} ^ (wire121 ?
                       wire118 : (8'ha3))))));
  assign wire141 = $signed(($unsigned({(wire118 + wire127), (~wire126)}) ?
                       (($unsigned(wire121) ?
                           (&reg139) : {(8'ha1),
                               wire124}) < (~^$unsigned((8'hab)))) : (^~$unsigned($unsigned(reg135)))));
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire98;
  input wire [(2'h3):(1'h0)] wire97;
  input wire [(4'h8):(1'h0)] wire96;
  input wire signed [(3'h4):(1'h0)] wire95;
  input wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(5'h14):(1'h0)] wire99;
  assign y = {wire102, wire101, wire100, wire99, (1'h0)};
  assign wire99 = (^$signed($signed(wire98)));
  assign wire100 = wire98;
  assign wire101 = wire97;
  assign wire102 = $unsigned(wire99[(4'h8):(2'h3)]);
endmodule

module module53
#(parameter param85 = ((((~^(8'ha4)) || (~^{(7'h43)})) > ((((8'h9e) ? (8'haa) : (8'ha9)) ? ((8'ha9) ? (8'hac) : (8'ha6)) : {(8'hb5)}) ? ((^(8'hab)) ^~ ((8'had) ? (8'hb7) : (8'had))) : (((8'had) ? (8'hb0) : (8'hac)) << ((7'h43) <= (8'ha6))))) ^ ((8'ha7) < (~|((~|(7'h44)) ^~ ((8'ha9) || (8'hb7)))))), 
parameter param86 = ((((param85 ? {param85, param85} : (^~param85)) ? (8'hba) : (&(param85 * param85))) ? (((-(8'h9e)) != (!param85)) ? ((-(8'hbb)) ? (8'hba) : param85) : {(~param85)}) : param85) ? (((param85 ? ((8'ha9) ? param85 : param85) : (param85 ? param85 : param85)) ? (~|param85) : ((8'hbf) && (-param85))) | param85) : ((-(+(~&param85))) <= (8'h9f))))
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire [(3'h6):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire71,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire58 = $signed($signed((wire57[(4'ha):(4'h9)] >>> wire56)));
  assign wire59 = {wire58};
  assign wire60 = (&(&{$signed(wire55)}));
  assign wire61 = $signed($signed(($unsigned($signed(wire54)) <= (+$signed(wire60)))));
  assign wire62 = wire60;
  assign wire63 = $unsigned((^~wire56));
  assign wire64 = wire55[(3'h7):(3'h5)];
  assign wire65 = ((wire64 ?
                      {(&(^wire56)), $unsigned($signed(wire58))} : ((&{(8'ha5),
                              wire58}) ?
                          {{wire64, wire56},
                              (wire59 + wire64)} : $signed((8'had)))) ^ wire56);
  assign wire66 = ({($signed($signed(wire56)) ~^ {(wire58 ? wire55 : wire58)}),
                          $unsigned((wire54[(2'h3):(1'h0)] ?
                              {wire54, wire55} : wire56))} ?
                      $unsigned((~((wire59 < wire60) ?
                          (wire58 ?
                              (8'hbb) : wire59) : wire58[(4'hd):(4'h8)]))) : (-$unsigned($unsigned((~|wire55)))));
  always
    @(posedge clk) begin
      reg67 <= wire64;
      reg68 <= ($signed({{(~wire60)}}) ?
          wire58[(1'h0):(1'h0)] : wire61[(2'h3):(1'h0)]);
      reg69 <= wire56[(1'h1):(1'h0)];
      reg70 <= (reg68 ?
          (-(wire65[(4'hc):(1'h0)] >> ((wire66 ?
              wire55 : wire59) >= $signed(wire61)))) : $unsigned((wire60 ?
              ((~^wire56) ?
                  (wire65 ?
                      wire57 : (7'h44)) : (wire54 ~^ (8'hbf))) : (|wire63[(3'h4):(1'h1)]))));
    end
  assign wire71 = {$signed($signed($unsigned($unsigned(wire66))))};
  always
    @(posedge clk) begin
      if ($signed((($signed((^~reg70)) - wire61[(1'h0):(1'h0)]) ^~ $signed({(wire63 != wire57)}))))
        begin
          reg72 <= $unsigned(((((wire62 << wire64) * (wire66 ?
              wire66 : wire65)) | ((8'hb8) < wire63[(3'h4):(1'h0)])) != $signed({wire55[(4'hc):(4'hb)]})));
          if ((wire54 && ($signed(wire57[(4'h9):(4'h9)]) << $unsigned($unsigned(reg69[(5'h13):(3'h6)])))))
            begin
              reg73 <= $unsigned($unsigned(wire66[(3'h4):(2'h2)]));
              reg74 <= (~&(~^$signed(reg67[(2'h2):(2'h2)])));
              reg75 <= ((&$signed($signed($signed(wire62)))) ?
                  ((^~(reg73[(4'h9):(3'h5)] >> wire62[(4'hf):(4'he)])) ?
                      (wire60[(3'h5):(2'h3)] ?
                          (reg74[(5'h10):(2'h3)] >>> $signed(wire55)) : reg69) : $unsigned({$unsigned(wire65)})) : ($unsigned(wire54[(3'h6):(3'h5)]) || $unsigned(wire61)));
              reg76 <= (|(!$signed($unsigned((wire61 ? wire65 : reg75)))));
              reg77 <= (~&{$signed(wire57),
                  ((reg68[(3'h5):(1'h1)] ?
                      $signed(reg73) : wire66) || $unsigned({wire59,
                      wire71}))});
            end
          else
            begin
              reg73 <= (8'ha7);
              reg74 <= (~(wire60[(4'hb):(1'h0)] || (($unsigned((8'h9f)) < wire58[(1'h1):(1'h0)]) | (~^(8'hbc)))));
              reg75 <= (~^$signed(wire57));
            end
          reg78 <= wire66;
          reg79 <= {$signed(reg68[(2'h2):(1'h0)]),
              $unsigned(wire58[(3'h5):(2'h3)])};
          reg80 <= (wire63 >> ($unsigned(wire59) < (~$unsigned((^reg74)))));
        end
      else
        begin
          reg72 <= (($signed(wire55) & $signed((+$unsigned((7'h40))))) ?
              (8'hb0) : (~^((&(~^wire54)) >> (8'hbc))));
          reg73 <= (^~{($unsigned((reg77 & reg77)) - $unsigned(reg68)), reg70});
          reg74 <= (&(reg67[(1'h0):(1'h0)] ?
              (^~(((8'h9f) - reg78) == wire60[(4'hc):(3'h7)])) : $signed((wire60 ?
                  wire62 : (8'hb7)))));
          reg75 <= wire58[(5'h15):(5'h10)];
          reg76 <= {($unsigned(($unsigned(reg73) || (reg75 ?
                      (8'hbd) : (8'ha4)))) ?
                  reg67 : reg75),
              (^{$unsigned(reg77[(3'h5):(1'h1)])})};
        end
    end
  assign wire81 = reg73[(4'h8):(1'h1)];
  assign wire82 = (~$unsigned(reg69));
  assign wire83 = ({(&wire54),
                          ({(wire66 > wire55), $signed(wire59)} | wire62)} ?
                      (8'hb9) : (~^(($signed((7'h43)) | $unsigned(wire58)) || ((wire65 ?
                          reg70 : reg73) ~^ (+reg68)))));
  assign wire84 = $signed((reg70[(2'h2):(1'h1)] < $unsigned($signed(reg78[(4'hd):(1'h1)]))));
endmodule
