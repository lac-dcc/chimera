module top
#(parameter param162 = ((!(~&(8'hbf))) ? (((-((8'hab) < (8'h9e))) ? (((8'ha5) || (8'ha0)) ~^ (~^(8'ha6))) : (((8'hbd) ? (8'h9d) : (8'hbd)) <= {(8'hb6), (8'hb4)})) != ((((8'hbb) ? (8'had) : (8'hab)) ? (7'h43) : ((7'h40) ? (8'hb3) : (8'hab))) << (((8'hb0) ? (8'hb4) : (8'hb3)) < ((8'h9d) - (8'had))))) : ((~&({(8'haa)} ? (!(8'ha0)) : (-(8'haf)))) * (^~((^(8'ha0)) ? {(8'h9f), (8'ha7)} : ((8'hb1) ? (8'ha0) : (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire161;
  wire signed [(3'h5):(1'h0)] wire159;
  wire [(4'hc):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  assign y = {wire161,
                 wire159,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = ($unsigned($unsigned(wire2)) ?
                     wire3 : (&((^~(^wire1)) - $signed($signed(wire0)))));
  assign wire5 = (wire4 ? wire2 : wire1[(2'h3):(2'h2)]);
  module6 #() modinst43 (wire42, clk, wire4, wire3, wire0, wire1);
  assign wire44 = $unsigned($signed($signed((!(wire1 ? wire5 : (8'h9d))))));
  assign wire45 = (((8'hbf) <= $signed(wire3)) ?
                      ((8'hbe) || {wire4, wire0[(2'h3):(1'h0)]}) : wire44);
  assign wire46 = wire44[(1'h1):(1'h0)];
  assign wire47 = (&$signed((((wire45 << wire2) > $unsigned(wire4)) ?
                      (wire42[(3'h5):(2'h2)] == (wire4 ^~ wire0)) : $unsigned($unsigned(wire2)))));
  assign wire48 = (&$unsigned((8'hbc)));
  assign wire49 = (^~(^wire47[(3'h6):(3'h5)]));
  assign wire50 = $signed((!(8'hb1)));
  assign wire51 = $unsigned(wire42[(1'h1):(1'h1)]);
  assign wire52 = (!$signed(((^~wire46[(2'h3):(2'h2)]) | $signed((wire51 ?
                      wire47 : wire44)))));
  always
    @(posedge clk) begin
      if ((wire45[(4'hd):(3'h7)] ?
          (($signed(wire1) <= $signed($signed(wire50))) < $signed({wire46})) : {(8'hbb),
              $unsigned((!{wire52, wire52}))}))
        begin
          if ({{(8'h9c), wire3[(4'ha):(3'h7)]}})
            begin
              reg53 <= $signed((~($unsigned((8'hb3)) >= wire47)));
              reg54 <= (&((-wire52[(1'h0):(1'h0)]) ?
                  $unsigned(((!wire42) ?
                      (^wire51) : {wire48, wire49})) : (8'ha8)));
            end
          else
            begin
              reg53 <= (wire49[(4'hd):(3'h5)] ^ $unsigned((-$unsigned((wire44 ?
                  wire5 : wire48)))));
            end
        end
      else
        begin
          if (((-$signed(($signed(wire48) >> $unsigned(wire48)))) ?
              $signed((reg54 ?
                  wire52 : $unsigned($unsigned(wire50)))) : (8'ha9)))
            begin
              reg53 <= wire1;
              reg54 <= {wire52, wire49};
              reg55 <= $signed($unsigned(($unsigned(wire50[(4'hb):(4'hb)]) * (wire5[(3'h7):(3'h4)] ?
                  (wire44 ? wire5 : reg53) : {wire45}))));
              reg56 <= $unsigned((wire49 >> (|wire51[(1'h1):(1'h1)])));
            end
          else
            begin
              reg53 <= (reg53[(4'hd):(4'h8)] ? (~&wire3) : (8'hb1));
            end
          if (wire2[(1'h0):(1'h0)])
            begin
              reg57 <= (~(~|$unsigned(wire46)));
              reg58 <= {(({$unsigned(wire47)} * {(wire49 | wire1)}) < ($unsigned({wire1,
                          (8'hbd)}) ?
                      $unsigned((reg57 ?
                          wire44 : (7'h43))) : $signed({reg53})))};
              reg59 <= ((7'h44) ? (8'h9d) : wire45[(4'hc):(3'h5)]);
              reg60 <= reg56[(4'h8):(2'h2)];
            end
          else
            begin
              reg57 <= $signed(wire48[(1'h0):(1'h0)]);
              reg58 <= wire3[(4'hb):(3'h6)];
              reg59 <= wire50;
              reg60 <= $signed((~&$unsigned(reg56)));
            end
          reg61 <= $signed((-($signed(wire42) + reg59)));
        end
      reg62 <= (reg59 ?
          $unsigned(wire48) : $unsigned($signed($signed(wire0[(4'ha):(3'h6)]))));
      reg63 <= (~&((^(-(wire47 ^ wire0))) == {reg58[(3'h4):(2'h2)]}));
      reg64 <= {wire5};
    end
  assign wire65 = (&(($signed(reg63[(1'h1):(1'h0)]) ~^ (wire5[(4'hc):(3'h7)] + (-wire49))) ?
                      (wire42 ^~ wire5) : (reg53 != $unsigned(reg60[(3'h6):(1'h1)]))));
  assign wire66 = ($unsigned((!({reg54,
                      (8'hbc)} ~^ $unsigned(reg59)))) != $signed({(^(reg60 ?
                          wire0 : reg59)),
                      $signed((wire46 ? wire1 : wire5))}));
  assign wire67 = reg57;
  assign wire68 = $unsigned((8'hbc));
  module69 #() modinst160 (.clk(clk), .wire73(wire4), .wire70(wire1), .wire72(wire66), .wire71(wire46), .y(wire159));
  assign wire161 = (wire4 > (8'had));
endmodule

module module69  (y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire73;
  input wire [(4'h9):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  input wire [(3'h6):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(3'h7):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire152;
  wire [(3'h6):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire150;
  wire [(5'h11):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire144;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire144,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg155,
                 (1'h0)};
  assign wire74 = (~^(+wire71[(4'hd):(4'ha)]));
  assign wire75 = $unsigned((((8'hb8) + $signed({wire70})) ?
                      $signed(((~|wire73) == wire73[(3'h5):(1'h1)])) : ({(+(8'ha7))} || ((+wire74) | wire71))));
  assign wire76 = wire73;
  assign wire77 = (wire71 ?
                      $unsigned(wire71[(4'h8):(1'h0)]) : {$unsigned($signed((wire70 < wire74)))});
  assign wire78 = wire77[(3'h6):(2'h3)];
  assign wire79 = $unsigned((8'h9d));
  assign wire80 = (!($signed($signed($signed((7'h41)))) <<< (~&$signed((wire72 ?
                      wire74 : (7'h41))))));
  assign wire81 = $unsigned(wire71[(4'h9):(3'h6)]);
  assign wire82 = ($signed({((!wire79) > wire71[(1'h1):(1'h0)]),
                      {$unsigned(wire81)}}) + wire70[(3'h6):(3'h6)]);
  module83 #() modinst145 (.wire86(wire81), .clk(clk), .y(wire144), .wire85(wire73), .wire87(wire78), .wire84(wire75));
  assign wire146 = (&$unsigned($unsigned(wire79)));
  assign wire147 = $signed({wire76[(3'h7):(1'h1)], (~|wire80[(3'h6):(1'h1)])});
  assign wire148 = (+(|wire74[(1'h1):(1'h1)]));
  assign wire149 = wire74[(3'h4):(2'h3)];
  assign wire150 = (~|wire77[(2'h2):(1'h1)]);
  assign wire151 = (wire76[(3'h6):(2'h2)] - (|$unsigned(((wire144 ^~ (8'ha2)) ?
                       (!wire144) : $unsigned(wire72)))));
  assign wire152 = (8'ha8);
  assign wire153 = wire78;
  assign wire154 = $unsigned($signed((7'h40)));
  always
    @(posedge clk) begin
      reg155 <= (~|(!$unsigned(wire148)));
    end
  assign wire156 = (|((((wire73 ? wire147 : wire72) ?
                           wire71[(3'h7):(3'h5)] : $unsigned(wire70)) ?
                       ((wire148 ? reg155 : (8'hb5)) ?
                           (wire154 <= (8'ha9)) : wire71) : $signed({wire75,
                           wire80})) > (wire73 ?
                       $signed($unsigned(wire74)) : (8'hb8))));
  assign wire157 = wire154[(3'h4):(1'h0)];
  assign wire158 = wire79[(2'h2):(1'h0)];
endmodule

module module6
#(parameter param41 = (8'hbc))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire30;
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire30,
                 reg36,
                 (1'h0)};
  assign wire11 = $unsigned(wire7);
  assign wire12 = $signed((wire11[(4'hd):(2'h3)] != $unsigned($signed((wire9 ?
                      wire10 : wire11)))));
  assign wire13 = $unsigned(wire11);
  assign wire14 = {($signed(wire8) * wire11)};
  assign wire15 = (8'hae);
  module16 #() modinst31 (.wire20(wire12), .wire21(wire15), .clk(clk), .y(wire30), .wire17(wire11), .wire19(wire10), .wire18(wire7));
  assign wire32 = ($signed($signed((|(wire9 ? wire30 : wire9)))) ?
                      $unsigned({((|(8'ha0)) - wire11),
                          {wire8, $unsigned(wire15)}}) : {({$unsigned(wire11)} ?
                              ((~(8'had)) + $unsigned(wire8)) : wire9)});
  assign wire33 = wire9;
  assign wire34 = $signed($unsigned(wire9));
  assign wire35 = (wire12[(3'h4):(2'h2)] ?
                      {{$signed((wire30 ?
                                  (7'h43) : wire9))}} : (wire11 ~^ wire32));
  always
    @(posedge clk) begin
      reg36 <= (~wire7);
    end
  assign wire37 = (($unsigned(($signed((8'ha9)) ?
                              (wire15 != wire15) : {wire32})) ?
                          wire12[(3'h5):(1'h0)] : (wire11[(4'hb):(2'h3)] >>> wire34[(2'h3):(2'h2)])) ?
                      wire11 : (~$signed({$signed(wire15)})));
  assign wire38 = {($unsigned(($signed((8'ha8)) ^ {wire9, wire10})) ?
                          $unsigned((^~reg36[(1'h0):(1'h0)])) : $signed(wire30))};
  assign wire39 = (|((wire12 ?
                      $unsigned(wire14[(1'h1):(1'h1)]) : $unsigned((wire8 >= wire30))) <= wire8[(4'hc):(1'h1)]));
  assign wire40 = $signed($signed(((wire7[(4'ha):(3'h7)] | $signed(wire39)) + wire37[(1'h1):(1'h0)])));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h71):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = wire18;
  assign wire23 = $signed((8'h9f));
  assign wire24 = {$unsigned({wire23[(1'h1):(1'h0)], (~^(8'hb5))})};
  assign wire25 = $signed(({(^((8'hb5) + wire21)), wire21} ?
                      $unsigned(wire17[(4'h9):(4'h9)]) : (^~((wire20 ?
                              (8'hb0) : (8'hba)) ?
                          $unsigned(wire20) : (~&wire17)))));
  assign wire26 = {$signed({($unsigned(wire19) ^ $unsigned(wire21)),
                          (|$unsigned(wire22))}),
                      (wire25 ?
                          (^(!(wire23 ? wire19 : (8'had)))) : ($signed({wire24,
                              (8'hbb)}) < wire21))};
  assign wire27 = (~|wire18[(1'h0):(1'h0)]);
  assign wire28 = ({$unsigned(($signed(wire22) ?
                          (wire24 != wire24) : $signed(wire20))),
                      (({wire26, wire26} & $unsigned(wire24)) ?
                          ($unsigned(wire25) ?
                              (wire26 ?
                                  wire19 : wire19) : $unsigned(wire18)) : (wire22 >>> $unsigned((8'hbd))))} > ((!wire17[(2'h2):(1'h0)]) ?
                      $signed((wire22[(3'h4):(3'h4)] ?
                          (wire26 | wire20) : $unsigned((8'ha1)))) : wire27[(4'h9):(3'h5)]));
  assign wire29 = wire24;
endmodule

module module83  (y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire87;
  input wire [(4'h9):(1'h0)] wire86;
  input wire signed [(4'ha):(1'h0)] wire85;
  input wire signed [(4'h8):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(3'h7):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire signed [(4'hd):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  reg signed [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg [(5'h11):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  assign y = {wire143,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
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
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 (1'h0)};
  assign wire88 = $signed(wire86);
  assign wire89 = $signed($unsigned(wire84[(2'h2):(1'h0)]));
  assign wire90 = (!$signed({wire86[(1'h1):(1'h1)],
                      $unsigned(((8'hb2) ? wire87 : wire87))}));
  assign wire91 = {($signed((~wire88[(3'h4):(1'h0)])) << wire85[(3'h4):(2'h3)]),
                      {{((|wire90) && wire85[(2'h2):(1'h0)])}}};
  assign wire92 = $unsigned({wire84});
  assign wire93 = {(wire87[(3'h7):(3'h7)] ?
                          ($unsigned(wire86) <<< wire87[(2'h2):(2'h2)]) : {(+wire91)})};
  assign wire94 = $unsigned((wire91[(1'h0):(1'h0)] ?
                      $signed(($unsigned(wire93) ?
                          $unsigned(wire86) : wire88[(2'h2):(1'h1)])) : ((wire84[(3'h7):(3'h5)] ?
                          $signed(wire84) : $signed(wire91)) >> $signed($unsigned(wire90)))));
  assign wire95 = ({$unsigned($signed($signed((7'h42))))} ?
                      $signed((wire94[(1'h1):(1'h0)] + {$unsigned(wire93)})) : wire92[(4'ha):(1'h0)]);
  assign wire96 = (~|((wire94[(3'h5):(2'h3)] ?
                      (~|(wire92 ?
                          (8'ha8) : wire90)) : wire94) >>> $unsigned($signed(wire90[(3'h6):(3'h4)]))));
  always
    @(posedge clk) begin
      reg97 <= $signed(wire95[(1'h1):(1'h1)]);
      reg98 <= wire92[(4'hc):(3'h5)];
      if ((|(~|$unsigned(wire96[(3'h4):(2'h2)]))))
        begin
          reg99 <= (wire89 ^~ wire89);
        end
      else
        begin
          reg99 <= $unsigned($signed($unsigned({wire85})));
          reg100 <= $unsigned((~^wire92[(1'h1):(1'h0)]));
          reg101 <= ($signed(((^~reg98) ?
              wire85[(4'h9):(3'h6)] : (+wire94[(1'h1):(1'h1)]))) >>> $unsigned(wire93));
          if ((($signed(wire90[(4'hf):(4'hb)]) != $unsigned($signed((-reg97)))) ?
              $unsigned(wire90) : $unsigned(wire88[(2'h2):(1'h0)])))
            begin
              reg102 <= $signed(($signed(({(8'ha1)} ?
                  {wire85,
                      wire93} : reg101[(2'h3):(2'h2)])) + wire84[(4'h8):(3'h6)]));
              reg103 <= ((wire95 ^ $unsigned(reg102[(4'hd):(2'h3)])) + {reg102[(3'h4):(1'h0)],
                  (^$unsigned($unsigned(wire85)))});
              reg104 <= $signed(wire94);
              reg105 <= (wire92[(3'h4):(3'h4)] ?
                  ($signed(reg101) <<< reg100) : ((reg104 ?
                          {$unsigned(wire87)} : ($signed((7'h42)) | wire92[(4'hc):(2'h3)])) ?
                      ($signed(wire94[(4'h8):(3'h7)]) ?
                          $unsigned((wire89 ? reg97 : wire94)) : ((~&wire91) ?
                              wire84[(1'h1):(1'h0)] : wire87[(3'h6):(3'h4)])) : $unsigned((!(~(8'h9f))))));
              reg106 <= $signed({wire96});
            end
          else
            begin
              reg102 <= reg105;
            end
          reg107 <= $signed($signed($signed((-$signed(wire92)))));
        end
      reg108 <= (8'had);
      if (((wire88 ?
              ($unsigned(reg107) ?
                  $signed((~wire89)) : $unsigned($unsigned(wire94))) : ($unsigned((wire90 < wire94)) ?
                  wire88 : ($unsigned(wire93) >= wire84[(3'h4):(2'h2)]))) ?
          (($unsigned((^~reg99)) | $unsigned({reg104})) ?
              wire85[(4'h9):(2'h2)] : (((reg98 ? reg97 : wire87) ?
                  (reg104 | wire96) : (!reg101)) + (wire91 & (reg103 >>> reg98)))) : {$unsigned((wire94[(2'h3):(2'h3)] ?
                  (reg102 ? reg103 : reg105) : $signed(reg98)))}))
        begin
          reg109 <= wire85[(1'h0):(1'h0)];
          reg110 <= (((wire87 ? {(~^(8'hba))} : reg101) ?
                  $unsigned(wire88) : $signed((~&(|reg101)))) ?
              ((!reg105) ?
                  ((wire88[(2'h3):(2'h2)] * reg97[(2'h2):(1'h1)]) ?
                      wire86 : $signed($signed(reg101))) : reg100[(3'h7):(1'h1)]) : reg103[(2'h3):(1'h1)]);
          reg111 <= (reg99[(4'hc):(4'h9)] * $signed((-$unsigned({wire92}))));
          if ($unsigned((^reg105[(1'h1):(1'h0)])))
            begin
              reg112 <= (~|$signed((wire86[(3'h4):(3'h4)] ^ (8'hb1))));
              reg113 <= ((~^(($signed(wire95) << (reg105 ^ wire91)) ~^ reg103[(1'h1):(1'h0)])) ?
                  (reg108 ~^ (~^{(~^reg102),
                      (&reg99)})) : $unsigned((~(wire89 >>> (reg110 ?
                      wire91 : reg102)))));
            end
          else
            begin
              reg112 <= reg97[(3'h6):(3'h6)];
              reg113 <= $signed($signed(reg113));
              reg114 <= reg99;
              reg115 <= (wire89[(3'h5):(2'h2)] ?
                  (^~reg114) : $signed($unsigned($unsigned(reg106))));
            end
        end
      else
        begin
          if ({{(wire85[(3'h4):(1'h1)] || (~&(7'h41))),
                  $signed(((^reg113) ?
                      (wire95 >>> (8'ha8)) : ((8'hb1) ? (8'had) : wire93)))}})
            begin
              reg109 <= reg108[(4'hd):(1'h1)];
              reg110 <= (~&$unsigned(({$unsigned((8'h9d))} || wire90)));
              reg111 <= {$unsigned($unsigned((~$signed(wire87))))};
              reg112 <= {({$signed($unsigned(reg114)),
                      ($signed(reg104) ~^ (~^reg104))} >>> $unsigned(($unsigned(reg115) ?
                      ((8'hb5) <<< reg113) : (reg107 ? reg99 : (8'ha0)))))};
              reg113 <= (&$signed($signed((^~reg109))));
            end
          else
            begin
              reg109 <= ((reg101 ^ wire92) <<< $unsigned($signed($signed($unsigned(reg108)))));
              reg110 <= $signed($signed(wire93[(3'h6):(3'h5)]));
              reg111 <= $signed((|reg103[(4'h8):(1'h0)]));
            end
          reg114 <= reg103;
          reg115 <= ((&(reg106[(4'h9):(1'h1)] || (&(-wire96)))) >> wire91);
          reg116 <= ($signed(reg100) ?
              ({(~&$unsigned(reg98))} ?
                  wire96[(3'h6):(3'h6)] : $signed($signed({reg104}))) : reg112[(4'ha):(1'h1)]);
        end
    end
  assign wire117 = wire85;
  assign wire118 = reg112[(3'h5):(2'h2)];
  assign wire119 = ((~^(reg106[(3'h4):(2'h2)] - (reg111[(3'h4):(2'h2)] ?
                       reg106 : (reg98 ?
                           (7'h43) : wire96)))) <= $signed($signed(($signed(wire90) * (&reg106)))));
  assign wire120 = $unsigned((~^$unsigned($signed($unsigned(wire87)))));
  always
    @(posedge clk) begin
      if ((^{$signed(((!(7'h44)) - $unsigned(reg99))),
          (~reg107[(3'h6):(2'h2)])}))
        begin
          reg121 <= {$unsigned(reg116)};
          reg122 <= $signed(wire93[(2'h2):(1'h0)]);
          reg123 <= reg101;
          reg124 <= $unsigned($unsigned($unsigned((7'h44))));
        end
      else
        begin
          reg121 <= (wire94 ?
              (-{($signed(reg99) ? reg101 : reg104),
                  (^~$unsigned(reg116))}) : (7'h40));
          reg122 <= $unsigned(wire117[(4'ha):(3'h4)]);
          if (((~&{$signed((reg122 + reg101))}) ?
              $unsigned((^(reg101[(3'h5):(3'h4)] ?
                  (reg97 <= reg99) : (8'hb2)))) : {wire119,
                  wire92[(1'h1):(1'h1)]}))
            begin
              reg123 <= $signed({wire119[(1'h1):(1'h1)], wire90});
              reg124 <= $unsigned((~^(8'ha9)));
              reg125 <= $unsigned({(reg109 <= $signed(wire84[(2'h2):(1'h1)])),
                  reg102[(3'h5):(1'h0)]});
              reg126 <= $signed((reg97 << $unsigned((~|(reg103 == wire120)))));
            end
          else
            begin
              reg123 <= reg126[(2'h3):(1'h1)];
              reg124 <= (wire84 ?
                  reg98 : ((+$signed((8'hbb))) ?
                      reg109 : wire94[(4'ha):(3'h5)]));
            end
          reg127 <= (^~(($signed(((8'hbe) ? (8'hbe) : reg112)) ?
              {((8'h9e) ? reg102 : wire84),
                  {reg121, reg111}} : {(wire94 | reg100)}) ~^ reg122));
        end
      reg128 <= reg100[(4'hf):(2'h2)];
    end
  assign wire129 = ($signed(((^reg99[(4'h8):(3'h7)]) ?
                       reg123[(3'h5):(2'h3)] : ((reg106 >> reg97) ?
                           $unsigned(wire85) : (!reg116)))) & ($signed(reg107) >= reg104[(3'h4):(2'h3)]));
  assign wire130 = ($signed((wire94 || ($unsigned(reg105) - (wire94 ?
                       (8'ha5) : wire91)))) + $unsigned(wire120));
  assign wire131 = (8'ha5);
  assign wire132 = $signed(reg110);
  always
    @(posedge clk) begin
      if ({$signed(reg121), (8'h9c)})
        begin
          reg133 <= reg123;
          if ({$unsigned(reg124[(1'h0):(1'h0)])})
            begin
              reg134 <= wire120[(1'h1):(1'h1)];
              reg135 <= {$signed(wire120), wire85[(4'ha):(4'h9)]};
              reg136 <= ((wire120[(3'h6):(2'h2)] ?
                      $unsigned($unsigned($unsigned(reg114))) : ($signed((reg101 && reg104)) || (~&(&wire86)))) ?
                  (-(wire93[(1'h1):(1'h0)] < ((wire86 ? reg121 : reg111) ?
                      (~^reg121) : ((7'h43) ?
                          wire117 : reg123)))) : $unsigned((8'h9f)));
            end
          else
            begin
              reg134 <= {$signed({{$signed((8'hbf))}}),
                  ({$unsigned(wire88), wire93} >>> wire91[(1'h1):(1'h0)])};
            end
          if ((+$unsigned(reg116[(2'h2):(1'h1)])))
            begin
              reg137 <= reg122;
              reg138 <= reg114[(4'hc):(4'h8)];
            end
          else
            begin
              reg137 <= (-(((^~reg114[(4'ha):(3'h4)]) ?
                  reg107 : $unsigned({(8'hbe),
                      wire85})) ^ (wire87 & ((~reg105) ?
                  $unsigned(wire94) : (^~wire91)))));
              reg138 <= reg123[(3'h7):(3'h6)];
            end
        end
      else
        begin
          reg133 <= $signed((((wire87[(2'h3):(1'h1)] <= (&(7'h40))) ?
                  reg116 : $signed($unsigned(reg100))) ?
              reg133[(3'h7):(2'h3)] : (wire129 <= reg121)));
          if ((~(~^wire95[(2'h2):(2'h2)])))
            begin
              reg134 <= reg124[(3'h5):(2'h3)];
              reg135 <= (reg125[(2'h2):(1'h0)] ~^ $unsigned({reg127}));
            end
          else
            begin
              reg134 <= reg113;
              reg135 <= wire94[(4'h9):(2'h2)];
              reg136 <= ($unsigned(((8'hbd) ?
                  $unsigned((reg134 ? reg136 : (8'hb6))) : (&(wire119 ?
                      reg99 : reg106)))) ^ reg111[(2'h2):(1'h1)]);
              reg137 <= reg107;
              reg138 <= wire84[(2'h3):(2'h3)];
            end
          reg139 <= (wire132[(3'h5):(1'h1)] ?
              reg107[(5'h12):(4'hc)] : (reg99[(1'h1):(1'h0)] ? reg114 : reg99));
          reg140 <= reg111;
          reg141 <= ($signed($unsigned($signed(wire95))) > (($unsigned((reg116 ?
              reg122 : reg97)) >>> (|wire86[(3'h6):(2'h2)])) >>> ({$unsigned(reg99)} ?
              (reg126[(1'h1):(1'h0)] || (wire120 && reg114)) : (~|(reg111 == reg98)))));
        end
      reg142 <= (~&(|$unsigned((^~reg98[(4'h9):(1'h1)]))));
    end
  assign wire143 = wire117[(5'h13):(3'h4)];
endmodule
