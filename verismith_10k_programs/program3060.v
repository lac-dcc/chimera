module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h213):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire141;
  wire [(4'hc):(1'h0)] wire142;
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire138,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire14,
                 wire42,
                 wire140,
                 wire141,
                 wire142,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {((-wire1[(1'h1):(1'h0)]) ?
                         $unsigned($signed((wire0 ?
                             (8'ha7) : wire3))) : $unsigned((wire1 ?
                             $signed(wire2) : wire4[(1'h1):(1'h0)]))),
                     wire2};
  assign wire6 = (+(wire0 < wire0[(2'h3):(1'h0)]));
  assign wire7 = $signed(((8'ha4) ~^ wire2));
  assign wire8 = wire1;
  always
    @(posedge clk) begin
      reg9 <= (8'ha6);
      reg10 <= wire3;
      reg11 <= $unsigned(($unsigned(($unsigned(wire8) ?
          $signed(wire5) : (wire0 ? wire7 : wire7))) | wire8));
      reg12 <= $unsigned($unsigned(wire6));
      reg13 <= wire0;
    end
  assign wire14 = (~|{{$signed($unsigned(wire0)), wire7[(1'h0):(1'h0)]},
                      reg11});
  module15 #() modinst43 (wire42, clk, wire2, wire1, wire0, reg11, reg12);
  assign wire44 = reg11[(1'h0):(1'h0)];
  assign wire45 = wire5[(2'h2):(1'h1)];
  assign wire46 = wire44[(4'h8):(2'h3)];
  assign wire47 = $unsigned(wire1[(4'hb):(2'h3)]);
  always
    @(posedge clk) begin
      reg48 <= wire47[(4'hf):(4'he)];
      reg49 <= wire46;
      if ((8'h9f))
        begin
          reg50 <= (($unsigned((8'hb6)) >>> (wire1 ?
                  wire5[(3'h6):(2'h3)] : $signed($signed(wire0)))) ?
              $signed((-$unsigned($signed(wire14)))) : ($unsigned($signed(wire2)) << $unsigned((!$unsigned(wire46)))));
          reg51 <= ((|{reg48[(3'h5):(3'h5)],
              reg48[(4'hb):(4'h8)]}) + ((reg49[(3'h5):(3'h5)] ?
              ((!reg48) * $signed(wire42)) : $signed(reg49[(3'h5):(2'h3)])) ~^ (~(wire44 ?
              wire45[(1'h1):(1'h1)] : ((7'h41) + reg48)))));
          reg52 <= wire0;
          reg53 <= wire4;
        end
      else
        begin
          if ($signed($unsigned(reg13[(4'h8):(1'h1)])))
            begin
              reg50 <= wire47[(1'h0):(1'h0)];
            end
          else
            begin
              reg50 <= (-((+((~^wire4) ?
                      $signed(reg52) : (reg11 ? wire44 : (8'ha9)))) ?
                  wire42 : $signed(reg48[(3'h4):(2'h2)])));
              reg51 <= (($unsigned($unsigned({(8'hbd)})) ?
                      reg48 : reg51[(3'h6):(2'h3)]) ?
                  $unsigned($unsigned((~wire14))) : wire44);
              reg52 <= $signed((($signed($unsigned(reg13)) != (((8'hb8) ?
                      wire3 : reg53) >>> $signed(reg52))) ?
                  $unsigned({(8'hb7)}) : ($signed($unsigned((8'haf))) ?
                      $signed($signed(wire14)) : {wire6, {wire46, wire2}})));
              reg53 <= ($unsigned(wire8[(3'h4):(2'h2)]) ?
                  ($signed(wire47[(4'hd):(4'h9)]) != (8'ha9)) : $unsigned({wire2[(3'h4):(1'h1)],
                      ((-reg10) * (|wire0))}));
              reg54 <= {(($signed($signed((8'hac))) ? wire42 : {{(8'hbf)}}) ?
                      ((&wire14) ?
                          wire14 : (wire47 ?
                              $signed(reg10) : {wire14})) : $unsigned($signed(reg48[(4'ha):(3'h5)]))),
                  $unsigned((^~($unsigned((8'hb4)) >>> (~reg10))))};
            end
          reg55 <= (~^reg52[(4'hb):(3'h4)]);
          reg56 <= ((!(~|wire8)) ?
              {wire42,
                  $unsigned($signed($signed((8'h9f))))} : wire1[(4'hd):(4'h8)]);
          if (wire46)
            begin
              reg57 <= reg13;
            end
          else
            begin
              reg57 <= ($signed($signed((wire1 ?
                  reg12 : (+(8'ha1))))) >= (&reg9));
              reg58 <= $signed($signed((^(reg54 << (reg9 ? reg52 : wire42)))));
              reg59 <= $signed((&($unsigned($signed((8'hbe))) ~^ $signed(wire47[(4'hf):(2'h3)]))));
              reg60 <= (reg48 <<< reg57);
            end
          reg61 <= {((~|(8'hae)) ~^ $signed($unsigned($signed(wire4)))),
              ($signed($signed((7'h43))) ?
                  {(8'h9f), reg54[(5'h11):(2'h2)]} : wire3)};
        end
      if ($signed($signed((($signed(wire4) << (wire7 ?
          reg53 : (8'hbf))) & wire4))))
        begin
          if (({reg49[(3'h6):(1'h1)]} < (8'ha2)))
            begin
              reg62 <= wire46[(3'h6):(2'h2)];
              reg63 <= {wire44, wire14[(3'h4):(2'h2)]};
              reg64 <= $unsigned(reg55);
            end
          else
            begin
              reg62 <= reg49;
              reg63 <= (|$signed(wire1));
            end
          reg65 <= (~&((~$unsigned($signed(reg10))) ?
              {(reg57[(2'h2):(1'h1)] != $signed(reg9)),
                  {$unsigned(reg48),
                      wire14[(1'h0):(1'h0)]}} : ((^~$unsigned((8'hb6))) ?
                  wire45 : (~$signed(reg10)))));
        end
      else
        begin
          reg62 <= (wire44 != $signed($unsigned(wire6[(3'h4):(2'h2)])));
          reg63 <= $signed($unsigned(reg56[(3'h4):(2'h3)]));
          reg64 <= reg61;
          reg65 <= $unsigned((wire8 == (reg51[(4'ha):(4'h9)] >= ((8'hb2) + reg51[(1'h0):(1'h0)]))));
          if ($signed($signed((((-reg53) ?
              $signed(wire8) : (wire3 * reg61)) != wire42[(1'h0):(1'h0)]))))
            begin
              reg66 <= (7'h43);
            end
          else
            begin
              reg66 <= reg64[(4'he):(1'h1)];
              reg67 <= $signed(((|((wire8 ? (8'ha8) : wire6) ?
                  reg66 : reg57)) >>> reg50));
              reg68 <= $unsigned(reg53[(1'h1):(1'h1)]);
              reg69 <= wire44;
            end
        end
    end
  module70 #() modinst139 (.wire71(wire8), .clk(clk), .wire74(wire7), .wire75(wire2), .wire72(reg64), .y(wire138), .wire73(reg9));
  assign wire140 = ($unsigned($signed(wire6[(3'h4):(2'h2)])) ?
                       (!(($unsigned(reg66) != $unsigned(reg62)) ?
                           ((reg48 ? wire42 : reg49) ?
                               (|reg49) : reg12) : $unsigned((^~wire1)))) : (reg67[(1'h0):(1'h0)] ?
                           ($signed({reg56, wire45}) != ((wire42 ?
                               (8'ha0) : (8'ha6)) - wire6)) : $signed($signed($signed(reg55)))));
  assign wire141 = wire46;
  module15 #() modinst143 (wire142, clk, reg59, reg61, wire45, reg60, reg55);
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire75;
  input wire signed [(5'h15):(1'h0)] wire74;
  input wire signed [(5'h12):(1'h0)] wire73;
  input wire [(4'hb):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire132;
  wire [(4'hd):(1'h0)] wire130;
  wire signed [(4'he):(1'h0)] wire117;
  wire signed [(5'h12):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  reg signed [(4'h9):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(4'hb):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  assign y = {wire136,
                 wire132,
                 wire130,
                 wire117,
                 wire116,
                 wire114,
                 wire82,
                 wire77,
                 wire76,
                 reg137,
                 reg135,
                 reg134,
                 reg133,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire76 = ((~|(~&wire71[(4'hb):(4'ha)])) >> $unsigned(((wire74 ^~ wire73[(4'h8):(2'h2)]) >= $unsigned((wire75 * wire75)))));
  assign wire77 = $unsigned($unsigned(($signed(wire75[(1'h0):(1'h0)]) ?
                      (((8'hb6) ? wire74 : wire76) ?
                          $unsigned(wire71) : (wire76 ?
                              wire73 : wire75)) : $unsigned($unsigned(wire74)))));
  always
    @(posedge clk) begin
      reg78 <= ($signed(wire72) ?
          wire73[(2'h2):(1'h1)] : (-($signed($unsigned((8'hb8))) ?
              $unsigned(wire76) : ((wire72 ?
                  (8'hbd) : wire77) && (^~wire74)))));
      reg79 <= wire72[(2'h3):(1'h0)];
      reg80 <= wire76;
      reg81 <= {((wire73[(4'h9):(1'h0)] ? (wire74 == (~^(8'hb1))) : wire74) ?
              wire74[(2'h3):(1'h0)] : $signed(({wire74, wire73} & reg78)))};
    end
  assign wire82 = reg78[(3'h4):(1'h0)];
  module83 #() modinst115 (wire114, clk, wire76, wire82, wire73, wire71, reg80);
  assign wire116 = $unsigned($signed($signed($unsigned(reg81))));
  assign wire117 = wire75;
  module118 #() modinst131 (.clk(clk), .wire119(reg79), .wire123(reg78), .wire122(reg81), .y(wire130), .wire120(wire74), .wire121(wire117));
  assign wire132 = $unsigned(wire72);
  always
    @(posedge clk) begin
      reg133 <= reg80;
      reg134 <= wire130;
      reg135 <= $unsigned({$signed(reg134[(2'h2):(1'h1)]), (!(8'haf))});
    end
  assign wire136 = ((8'hb1) ^ ((wire132 - ($signed(reg78) ?
                       wire72[(2'h2):(1'h1)] : reg80[(1'h0):(1'h0)])) ~^ (wire72 ?
                       wire72[(4'h8):(3'h6)] : (wire76 - $unsigned(reg79)))));
  always
    @(posedge clk) begin
      reg137 <= {reg134[(3'h4):(1'h1)]};
    end
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  assign y = {wire40, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $signed($unsigned($unsigned(($unsigned(wire19) == wire18[(2'h3):(2'h3)]))));
  assign wire22 = wire16;
  assign wire23 = (~|wire18[(3'h4):(2'h3)]);
  module24 #() modinst41 (wire40, clk, wire19, wire16, wire20, wire18);
endmodule

module module24
#(parameter param38 = {{(|{((8'hbd) ? (8'hbd) : (8'hb6)), ((8'hbb) ? (8'hba) : (8'hac))}), {((+(8'hb7)) ? {(8'hbe)} : (^~(7'h42))), ({(8'ha8)} * (&(8'ha2)))}}}, 
parameter param39 = (param38 || {(8'hb0)}))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire28;
  input wire [(3'h6):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 (1'h0)};
  assign wire29 = $signed(wire28);
  assign wire30 = (+$signed((($signed(wire27) ?
                          wire26[(3'h5):(1'h1)] : $unsigned(wire27)) ?
                      (^~wire29) : wire25[(1'h0):(1'h0)])));
  assign wire31 = ((($unsigned($signed((7'h44))) ?
                          $unsigned(wire27) : (|(wire28 && (8'hbc)))) ?
                      wire30[(1'h1):(1'h1)] : ($signed($signed(wire28)) + (+(&wire29)))) && $unsigned(wire29));
  assign wire32 = (^(wire29[(3'h5):(2'h2)] << wire30));
  assign wire33 = (8'hb8);
  assign wire34 = $unsigned(wire28);
  assign wire35 = (&$unsigned({$unsigned((~wire28))}));
  assign wire36 = (!$unsigned(wire26[(3'h7):(1'h0)]));
  assign wire37 = ({wire33} >= ($unsigned($unsigned($unsigned(wire26))) ?
                      $unsigned((~(^~wire29))) : {wire25,
                          $unsigned((^~wire29))}));
endmodule

module module118
#(parameter param129 = (({(7'h42), {((8'hb7) ? (8'hba) : (8'h9d))}} == ((8'hba) ? (((8'ha3) ? (8'hbb) : (7'h43)) != ((8'hab) == (8'ha2))) : ((8'ha6) >= (~(8'hb4))))) ? ({{{(8'ha1), (8'hb6)}, (|(8'ha2))}, ((^~(8'hbf)) ? ((8'hbb) >= (7'h44)) : ((8'h9e) ? (8'ha2) : (8'ha0)))} ? ((((8'h9d) ? (8'haa) : (8'hb2)) ^ {(8'hb2)}) ^~ (((8'haf) || (8'hb4)) ? {(8'hbc), (8'ha1)} : ((7'h41) == (7'h41)))) : (^~{((7'h42) ? (8'hbc) : (7'h40)), ((7'h44) * (8'hbd))})) : ((^~(8'ha3)) + ({((8'hba) ? (8'ha6) : (8'h9c))} ? ((~&(8'h9d)) ~^ (~&(8'ha4))) : (((8'hb3) ? (8'hbb) : (8'hb8)) + (~|(8'ha6)))))))
(y, clk, wire123, wire122, wire121, wire120, wire119);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire123;
  input wire signed [(2'h2):(1'h0)] wire122;
  input wire signed [(4'h8):(1'h0)] wire121;
  input wire signed [(5'h15):(1'h0)] wire120;
  input wire signed [(4'h8):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  assign y = {wire128, wire127, wire126, wire125, wire124, (1'h0)};
  assign wire124 = (wire123[(1'h1):(1'h1)] ?
                       $signed((8'hbc)) : wire121[(1'h0):(1'h0)]);
  assign wire125 = (wire122 && (-wire122[(1'h0):(1'h0)]));
  assign wire126 = ((|wire123[(5'h13):(3'h4)]) ?
                       $unsigned(($unsigned($signed(wire124)) ?
                           wire121[(1'h0):(1'h0)] : $signed(((8'h9e) << wire121)))) : wire119);
  assign wire127 = (((~{wire125,
                           wire124[(2'h3):(2'h2)]}) >> (!wire120[(2'h2):(2'h2)])) ?
                       $signed((-$unsigned({wire125}))) : (($unsigned(wire124) >>> wire124[(1'h0):(1'h0)]) >> $unsigned((~&wire122[(1'h0):(1'h0)]))));
  assign wire128 = (wire126 >> wire123);
endmodule

module module83
#(parameter param113 = ((+(((^(7'h41)) ? ((8'hb6) >>> (8'hb3)) : (8'hb7)) > (((8'h9f) != (8'hb3)) - ((8'hba) ? (8'had) : (8'ha8))))) & ((({(8'hb5), (8'ha5)} ? {(8'haa)} : {(8'hbc), (8'hb5)}) ? {((8'ha6) || (8'ha3)), ((8'h9c) ? (8'ha3) : (8'ha8))} : (^~{(8'hac)})) & ((^(&(8'hbf))) != {(^~(8'h9c)), (~^(7'h42))}))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire [(2'h2):(1'h0)] wire87;
  input wire signed [(5'h12):(1'h0)] wire86;
  input wire signed [(2'h3):(1'h0)] wire85;
  input wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire100,
                 wire99,
                 wire97,
                 wire96,
                 wire95,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
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
                 reg98,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire89 = (($unsigned(wire88) <= wire85) >= wire84[(1'h1):(1'h0)]);
  assign wire90 = (wire84[(3'h6):(1'h1)] != wire85);
  assign wire91 = wire89;
  assign wire92 = $signed((~|($unsigned($signed(wire90)) && $unsigned($signed((8'hac))))));
  always
    @(posedge clk) begin
      reg93 <= wire90;
      reg94 <= {{wire88},
          $signed(((8'ha3) ? wire89 : (^(wire89 ? wire84 : reg93))))};
    end
  assign wire95 = (~(~^((wire86 ?
                      $signed(wire86) : {wire87,
                          wire85}) >>> wire89[(3'h7):(2'h3)])));
  assign wire96 = $unsigned(reg94);
  assign wire97 = ($unsigned(wire88) ?
                      wire90[(2'h3):(2'h2)] : {(!$unsigned($unsigned(wire96)))});
  always
    @(posedge clk) begin
      reg98 <= wire84;
    end
  assign wire99 = wire85;
  assign wire100 = $unsigned($signed(((^(wire91 <<< wire86)) ?
                       $signed($signed(wire88)) : wire85)));
  always
    @(posedge clk) begin
      reg101 <= wire97;
      reg102 <= wire89;
      reg103 <= {$signed((wire96 ?
              (&(~&reg94)) : (wire85 > wire87[(2'h2):(1'h1)])))};
    end
  always
    @(posedge clk) begin
      reg104 <= $signed((wire91 - wire99));
      if (wire100[(4'h9):(3'h5)])
        begin
          reg105 <= $unsigned($signed((reg102 ~^ ($signed((7'h40)) ?
              $unsigned(wire97) : reg94))));
          if ($unsigned((8'hbb)))
            begin
              reg106 <= reg103;
            end
          else
            begin
              reg106 <= $signed((8'haf));
              reg107 <= (8'ha2);
            end
        end
      else
        begin
          reg105 <= reg105;
          if (({reg107[(5'h11):(4'hd)],
              reg107[(4'hb):(2'h2)]} - ((wire90[(2'h3):(2'h2)] ~^ $unsigned($unsigned(reg94))) ~^ {(wire99 ?
                  (wire100 ? reg93 : reg94) : (reg103 ? reg94 : reg101))})))
            begin
              reg106 <= wire92;
              reg107 <= $signed((reg94[(3'h5):(2'h2)] ?
                  wire91[(3'h4):(1'h0)] : $unsigned({(wire100 ?
                          (7'h42) : wire91)})));
              reg108 <= ($unsigned((wire85[(2'h2):(2'h2)] >> ((!reg105) ?
                      $signed(reg106) : $signed(reg94)))) ?
                  wire100[(4'h8):(3'h7)] : (~&(reg94[(1'h1):(1'h1)] ?
                      (-reg94[(4'ha):(4'h8)]) : wire99)));
              reg109 <= reg101[(5'h11):(5'h11)];
              reg110 <= $unsigned((wire87 != (&(^wire87))));
            end
          else
            begin
              reg106 <= $unsigned(($unsigned(reg108) ?
                  (($unsigned((7'h40)) - wire92[(5'h15):(4'hb)]) ?
                      (wire97 ^~ (-reg101)) : reg108) : ($unsigned($signed((8'h9e))) ?
                      reg93[(3'h6):(1'h1)] : ($unsigned(reg93) || $signed(reg110)))));
              reg107 <= $signed((&$signed({(wire88 || (8'ha7))})));
              reg108 <= ((reg93[(3'h5):(2'h3)] ?
                  wire84 : (reg105[(4'hb):(4'h9)] ~^ $signed(((8'hab) ?
                      wire100 : wire89)))) >= ($unsigned(({(8'h9c)} <= ((8'ha4) - (8'ha5)))) << reg98));
              reg109 <= (wire95 == reg98);
            end
        end
    end
  assign wire111 = (8'h9c);
  assign wire112 = {(-$signed(wire92[(4'he):(2'h2)]))};
endmodule
