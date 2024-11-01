module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(4'hc):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire112;
  wire [(2'h3):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire102;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  assign y = {wire142,
                 wire140,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire105,
                 wire104,
                 wire102,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire5 = wire1[(3'h5):(1'h0)];
  assign wire6 = wire0;
  assign wire7 = (wire6 >> ((((wire6 ? wire0 : wire4) ?
                     {wire2,
                         wire2} : (!wire4)) ^ wire2[(2'h3):(2'h3)]) << wire6[(3'h5):(3'h5)]));
  assign wire8 = wire1[(2'h2):(1'h0)];
  module9 #() modinst103 (.wire10(wire6), .y(wire102), .clk(clk), .wire13(wire5), .wire11(wire7), .wire12(wire8));
  assign wire104 = ($signed($unsigned(wire8)) <= {wire5[(4'hc):(3'h6)],
                       $signed(wire3[(3'h7):(3'h4)])});
  assign wire105 = {$signed($unsigned($unsigned((wire5 == wire0)))),
                       $signed((wire7[(4'he):(4'h9)] * ($signed(wire2) ?
                           wire7[(3'h5):(1'h0)] : wire104[(3'h7):(1'h1)])))};
  always
    @(posedge clk) begin
      reg106 <= wire3[(2'h2):(1'h0)];
      if ($signed((&(wire0 + (((7'h41) ?
          wire1 : wire8) * wire1[(4'hd):(2'h2)])))))
        begin
          reg107 <= wire3;
          reg108 <= (8'ha5);
        end
      else
        begin
          reg107 <= (!$unsigned($unsigned((wire105 ?
              $unsigned(reg108) : wire2[(3'h7):(3'h7)]))));
          reg108 <= ((^$signed(((wire2 ~^ (8'h9c)) | (^~reg107)))) <<< wire4);
        end
      if (wire1[(4'hb):(4'h9)])
        begin
          reg109 <= (&((((reg107 ? wire1 : wire7) ?
                  {wire7, wire105} : {wire6}) & (|$signed(wire1))) ?
              {(reg108 * $signed(reg107)), wire1[(4'hb):(3'h6)]} : wire102));
          reg110 <= (((wire0 ?
                  ({wire8} ?
                      {reg109, (8'hbb)} : (reg106 ?
                          wire102 : wire105)) : (wire104 ?
                      {wire104,
                          reg108} : $unsigned(wire105))) * $unsigned({(wire8 | reg109)})) ?
              (|(~^$signed(((8'hb7) ? reg106 : reg108)))) : reg109);
        end
      else
        begin
          reg109 <= {$signed(wire104[(1'h0):(1'h0)])};
        end
      reg111 <= {(wire3 ?
              ($signed(wire4) ?
                  reg110 : {(8'hb4)}) : $signed($unsigned(wire2[(3'h5):(3'h5)]))),
          wire7};
    end
  assign wire112 = $unsigned($unsigned(($signed((reg106 == wire1)) ?
                       {wire4[(2'h3):(2'h3)], $unsigned(wire0)} : ({wire104,
                               wire1} ?
                           (wire8 <= wire104) : wire102[(2'h3):(2'h2)]))));
  assign wire113 = ($signed($signed(((wire112 >>> (8'hae)) ?
                       {wire6} : {reg108}))) > ((((^~reg111) ?
                           (wire7 ? reg106 : wire112) : (~^(8'hb5))) * ((wire6 ?
                           wire6 : reg108) >>> $unsigned(wire105))) ?
                       ((wire2 ? (~^wire2) : {wire2, wire102}) ?
                           ($signed(wire6) ?
                               $unsigned(reg108) : (wire1 ?
                                   reg106 : (7'h43))) : $unsigned($unsigned(wire5))) : $signed($signed({wire102}))));
  assign wire114 = wire6;
  assign wire115 = $unsigned(wire105);
  assign wire116 = ($unsigned((~|$signed($signed(reg106)))) ?
                       (+(wire115 ?
                           reg106 : ($unsigned((8'hb4)) << (^~wire113)))) : $signed({({wire114} ?
                               reg106 : (~|(8'hbe))),
                           $unsigned({reg106})}));
  assign wire117 = $signed($signed(wire0));
  assign wire118 = wire113[(3'h6):(3'h5)];
  assign wire119 = $unsigned($unsigned((|(wire115[(4'hc):(3'h6)] - $unsigned(wire118)))));
  assign wire120 = wire8[(3'h7):(2'h2)];
  module121 #() modinst141 (.clk(clk), .wire122(wire6), .wire124(wire114), .wire123(wire115), .wire126(reg111), .wire125(wire3), .y(wire140));
  assign wire142 = (8'haa);
endmodule

module module121
#(parameter param139 = {({(-((8'ha2) ? (8'h9c) : (8'h9c)))} > ((((8'ha9) >>> (8'ha4)) ^ ((8'hac) ~^ (8'had))) ? (~(|(7'h44))) : ({(8'hb3), (8'ha4)} ^~ ((8'hbc) ? (8'had) : (8'h9f)))))})
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire126;
  input wire [(4'ha):(1'h0)] wire125;
  input wire signed [(4'he):(1'h0)] wire124;
  input wire [(4'ha):(1'h0)] wire123;
  input wire [(4'he):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire129;
  wire signed [(3'h7):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire127;
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire129,
                 wire128,
                 wire127,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 (1'h0)};
  assign wire127 = (wire125 ?
                       (~$signed(wire126[(1'h0):(1'h0)])) : $unsigned((wire125[(1'h1):(1'h0)] ?
                           ($signed(wire126) ?
                               $signed(wire123) : $unsigned(wire123)) : {wire125[(4'h8):(1'h1)]})));
  assign wire128 = ($unsigned(wire123) ?
                       $unsigned(($unsigned(wire123[(1'h0):(1'h0)]) ?
                           {$signed(wire127)} : (wire125 ?
                               $signed(wire123) : {wire122}))) : ($unsigned(((wire122 ^~ wire125) <= (wire125 ?
                               (8'h9f) : wire127))) ?
                           (~&wire127[(1'h1):(1'h0)]) : $unsigned($unsigned($signed(wire122)))));
  assign wire129 = wire122[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg130 <= $unsigned(wire123);
      reg131 <= (~wire129);
      reg132 <= (-wire122[(2'h3):(2'h2)]);
      if (wire128[(1'h1):(1'h0)])
        begin
          reg133 <= wire122[(4'hc):(1'h1)];
          reg134 <= (~^$signed($unsigned($unsigned((reg133 << wire126)))));
        end
      else
        begin
          if (wire129)
            begin
              reg133 <= $signed((wire129 >= wire122[(3'h7):(1'h1)]));
              reg134 <= (wire126[(2'h3):(2'h2)] >>> wire126);
            end
          else
            begin
              reg133 <= (8'ha9);
            end
        end
    end
  always
    @(posedge clk) begin
      reg135 <= {wire122[(4'hd):(4'hb)]};
      reg136 <= (reg132[(4'hc):(4'h8)] + (reg132 ?
          (wire129[(1'h0):(1'h0)] < (~^(|reg130))) : reg133[(3'h6):(3'h5)]));
    end
  assign wire137 = $unsigned(((($unsigned(wire124) * {(8'ha0),
                           (8'h9f)}) || wire125) ?
                       (~|($signed(reg133) ?
                           (~^reg130) : reg130[(2'h3):(2'h3)])) : {(wire122 ?
                               ((7'h41) <<< reg134) : (~&wire122)),
                           reg135[(2'h3):(2'h3)]}));
  assign wire138 = wire127[(4'hb):(3'h6)];
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire80;
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  assign y = {wire82,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire35,
                 wire36,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire80,
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
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg37,
                 reg38,
                 (1'h0)};
  assign wire14 = (^~wire11[(4'h9):(3'h4)]);
  assign wire15 = $unsigned($unsigned(wire10));
  assign wire16 = (&(~wire14));
  assign wire17 = (((wire14[(3'h4):(2'h3)] ? wire16 : wire16) ?
                      ($unsigned((wire13 <<< wire16)) ?
                          $signed(wire16[(1'h0):(1'h0)]) : wire14[(4'hb):(3'h7)]) : wire15[(2'h3):(1'h1)]) << ((8'hb6) & ($unsigned((wire13 ?
                      wire15 : wire10)) && $unsigned($signed(wire15)))));
  assign wire18 = {wire10[(1'h0):(1'h0)]};
  assign wire19 = wire16;
  always
    @(posedge clk) begin
      reg20 <= $signed((8'hba));
      if ({(((~&$signed(wire16)) - reg20) * $signed($signed(wire17[(3'h6):(1'h1)])))})
        begin
          reg21 <= (!wire11[(4'he):(3'h4)]);
        end
      else
        begin
          reg21 <= $signed((wire17 ?
              ((&(wire15 ?
                  wire14 : reg20)) >> (^(wire17 != wire11))) : $unsigned($signed((wire15 - wire18)))));
          if ($signed($signed((8'ha6))))
            begin
              reg22 <= wire11[(2'h3):(1'h1)];
              reg23 <= ({(reg20[(2'h3):(1'h0)] | reg21)} <<< (reg22 ?
                  $signed(reg20) : wire14[(3'h7):(3'h7)]));
              reg24 <= (~^wire13[(3'h6):(2'h2)]);
              reg25 <= $signed((~&$unsigned($unsigned(wire16))));
            end
          else
            begin
              reg22 <= ((8'ha7) < ($unsigned($unsigned((wire13 ?
                  wire19 : reg21))) - (wire16[(1'h1):(1'h1)] ?
                  $signed(reg22) : wire11[(4'hb):(3'h7)])));
              reg23 <= wire12;
              reg24 <= (wire12 <<< (+$unsigned(wire15)));
              reg25 <= (wire15 ?
                  wire13 : ($signed((-(reg21 <<< wire18))) ?
                      $signed(wire15[(1'h1):(1'h1)]) : $unsigned($signed((~&wire17)))));
            end
          reg26 <= {wire19};
          reg27 <= wire14;
          if (((&({$unsigned(wire19)} ?
                  $signed(wire15) : ((~reg24) && $signed(wire12)))) ?
              $signed($unsigned((wire14 * ((8'had) ~^ wire19)))) : $unsigned($signed(reg22))))
            begin
              reg28 <= ({(!$signed((~|wire13)))} || $signed((~($unsigned(reg21) ?
                  {(8'h9f)} : $signed(wire17)))));
            end
          else
            begin
              reg28 <= (($unsigned($unsigned(reg24[(4'h8):(1'h1)])) ?
                  (({reg21} ?
                      (reg28 ?
                          reg26 : reg25) : (-wire12)) >> (wire14 != (8'h9d))) : (((wire13 ?
                              wire18 : wire12) ?
                          ((7'h43) - reg21) : (~|wire18)) ?
                      {reg27[(1'h1):(1'h1)]} : wire17[(4'h9):(3'h7)])) && reg20);
              reg29 <= $signed(wire19);
              reg30 <= $signed((-$signed($unsigned(wire16[(2'h2):(1'h0)]))));
              reg31 <= (!{wire19});
            end
        end
      reg32 <= wire19[(5'h10):(3'h7)];
      reg33 <= (wire19 ?
          (|($signed((reg23 <= wire12)) == {(reg32 >> wire11)})) : (~|($signed(wire16) ?
              $signed(((8'hbd) ? reg27 : (8'hb4))) : reg21[(3'h4):(1'h1)])));
      reg34 <= $signed((($signed((~^wire17)) ?
              $unsigned($unsigned(reg26)) : reg31) ?
          $signed((|reg22[(2'h2):(1'h0)])) : ($signed((reg29 - (7'h41))) ?
              $unsigned((reg27 ? wire13 : wire12)) : wire17)));
    end
  assign wire35 = {reg32};
  assign wire36 = $signed((^~$unsigned(((-reg30) ^~ {reg24, reg34}))));
  always
    @(posedge clk) begin
      reg37 <= wire35;
      reg38 <= (((8'ha6) ?
          reg34 : (-(!$unsigned(wire11)))) < (($signed((8'hb7)) ^~ wire19[(4'hc):(3'h7)]) - ((~$signed(reg30)) ?
          ((8'hb2) <= wire16) : reg21)));
    end
  assign wire39 = (reg23[(3'h5):(2'h3)] && (wire19[(4'hf):(4'hf)] ~^ ({(reg29 ?
                          reg31 : reg28),
                      reg28} <<< (wire11 ?
                      (reg23 ? (8'hb4) : wire17) : (reg32 ~^ (7'h42))))));
  assign wire40 = $signed(wire18[(2'h3):(1'h0)]);
  assign wire41 = ((($unsigned((~^(8'hbf))) ~^ ({wire18} ?
                          {wire36} : reg33[(1'h0):(1'h0)])) ?
                      $unsigned(reg37) : wire36) | $unsigned($unsigned($signed(wire35[(3'h6):(2'h3)]))));
  assign wire42 = wire11[(3'h7):(3'h4)];
  assign wire43 = reg37;
  assign wire44 = (($signed({((8'haa) ? reg33 : wire40)}) ?
                          (wire17 ?
                              ((wire12 ? (8'haf) : (7'h41)) ?
                                  (+(8'hae)) : $unsigned(reg24)) : ((reg25 ?
                                      reg30 : wire13) ?
                                  $unsigned(reg31) : {reg28})) : {{wire39,
                                  (|wire42)},
                              (7'h43)}) ?
                      reg23[(1'h1):(1'h0)] : {$signed($unsigned($unsigned(wire10)))});
  assign wire45 = ($signed(wire39[(2'h2):(2'h2)]) ^~ reg38);
  assign wire46 = {(~wire45[(2'h3):(2'h2)]), $unsigned(reg25)};
  assign wire47 = wire44[(4'hf):(3'h7)];
  module48 #() modinst81 (wire80, clk, reg38, reg33, reg30, wire47);
  assign wire82 = $signed(reg21[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire35[(3'h6):(3'h5)])
        begin
          reg83 <= ((&(~^wire14[(4'hb):(3'h6)])) == ((8'ha5) ?
              $signed($signed({wire44})) : wire42[(1'h1):(1'h0)]));
          if ($unsigned(reg33[(1'h0):(1'h0)]))
            begin
              reg84 <= (8'hb5);
              reg85 <= reg26;
              reg86 <= (~&$signed((~^reg34)));
              reg87 <= (~^(~^$unsigned(wire16)));
            end
          else
            begin
              reg84 <= wire15[(3'h4):(1'h0)];
              reg85 <= $signed(((8'ha1) == wire10[(1'h1):(1'h1)]));
              reg86 <= $unsigned($unsigned($unsigned(reg28)));
              reg87 <= wire36[(3'h4):(2'h2)];
            end
          reg88 <= $unsigned((wire16 ^~ (8'ha9)));
        end
      else
        begin
          reg83 <= (8'ha2);
          reg84 <= $unsigned((wire44 ?
              (!reg84[(1'h0):(1'h0)]) : (~&((wire40 ? reg84 : reg84) ?
                  wire19[(3'h5):(2'h3)] : {wire40, reg21}))));
          reg85 <= $signed((((reg84[(1'h1):(1'h0)] ~^ (8'hb0)) ?
              ($unsigned(reg30) ?
                  (~reg29) : (wire19 >>> wire17)) : ($signed(wire46) ?
                  {wire39} : (&(8'hbe)))) || (($unsigned(wire43) ?
              {(8'ha6), wire44} : (reg29 > reg28)) > {wire47[(3'h5):(3'h4)],
              $unsigned(wire13)})));
          reg86 <= reg24;
        end
      if ($unsigned($unsigned(($signed((^wire40)) >>> (+(-reg29))))))
        begin
          reg89 <= {(wire45 > wire14)};
          if ((wire82[(4'h8):(3'h6)] ?
              {wire45,
                  (wire44 ?
                      wire11[(1'h1):(1'h0)] : ((wire46 ? (8'hb8) : reg25) ?
                          (|reg86) : (reg83 ?
                              wire40 : wire80)))} : (~^(~|$unsigned((!wire12))))))
            begin
              reg90 <= reg23[(2'h3):(1'h1)];
              reg91 <= ((reg30[(3'h7):(3'h5)] ?
                      reg22 : $unsigned($signed($signed(wire36)))) ?
                  ((reg37 ?
                      wire14[(4'h9):(3'h4)] : ((~&reg30) ?
                          $signed(wire40) : (wire39 >>> reg86))) + wire12) : {wire43[(4'h8):(2'h2)],
                      $signed((~&(8'hae)))});
              reg92 <= reg83;
              reg93 <= reg26[(2'h3):(2'h3)];
              reg94 <= $unsigned(((8'h9f) < $signed(({(8'hb9)} << (~&reg38)))));
            end
          else
            begin
              reg90 <= $signed(wire17);
              reg91 <= $unsigned((((^~$unsigned((8'hab))) ?
                  (+(~&(8'h9f))) : $signed({wire11,
                      (8'hbf)})) | reg23[(2'h3):(2'h2)]));
              reg92 <= ($unsigned((reg29[(5'h10):(4'h8)] ?
                      ((8'hb1) != reg26) : ((reg84 ?
                          reg28 : wire17) > (8'hbd)))) ?
                  ($unsigned(reg26) >>> (reg33[(1'h1):(1'h0)] >> ((|wire14) << $unsigned(wire11)))) : $signed(((|$unsigned(wire40)) ^~ ((!reg31) ?
                      (reg31 ? reg92 : wire36) : $unsigned(reg88)))));
              reg93 <= (~|$signed(wire45));
              reg94 <= (reg21 ?
                  (!{(^{(8'hb0)}),
                      ($signed((8'h9d)) < $unsigned(wire10))}) : reg27[(2'h3):(1'h1)]);
            end
          if ({wire14[(1'h0):(1'h0)], $unsigned((-$signed($signed(reg38))))})
            begin
              reg95 <= reg24[(1'h1):(1'h1)];
              reg96 <= (8'hae);
            end
          else
            begin
              reg95 <= (($unsigned(((wire17 | wire18) ?
                  wire82 : wire19)) >>> {$signed($unsigned(reg96)),
                  {$signed((8'hb9))}}) << wire14);
              reg96 <= $unsigned({$unsigned($signed($unsigned((8'hb9)))),
                  wire17});
              reg97 <= $unsigned(wire19);
              reg98 <= ((&reg22[(1'h0):(1'h0)]) >= reg89);
            end
          reg99 <= $unsigned($signed(wire15));
        end
      else
        begin
          reg89 <= (reg99 ? reg86 : {(~^$unsigned((~|reg84)))});
        end
      reg100 <= $signed((({(reg96 ? reg85 : (8'hb7)),
          (-reg99)} > ((~&reg22) == $unsigned(wire36))) | {((reg27 < wire42) ?
              (reg84 >> wire42) : wire19[(2'h2):(1'h1)])}));
      reg101 <= reg91[(3'h5):(3'h5)];
    end
endmodule

module module48
#(parameter param79 = (({({(7'h41), (8'hb0)} << ((7'h44) ? (8'h9e) : (8'ha4)))} ? ({((7'h42) * (8'hae)), ((8'h9c) ? (8'hab) : (8'hac))} ? ({(8'hb7), (8'hb5)} - ((8'haa) > (8'hb1))) : (((8'hb9) ? (8'hb8) : (8'h9c)) ~^ {(8'ha5)})) : {{{(8'hb4), (8'ha9)}}}) || (((~^{(7'h44), (7'h40)}) ^ ((-(7'h40)) ? (|(8'hbe)) : ((7'h43) == (8'h9d)))) ? (((-(8'ha1)) ^~ ((8'ha3) + (8'ha5))) - ({(7'h43)} || (~&(8'ha1)))) : (({(8'ha4)} ? ((8'hb6) || (8'hba)) : {(8'hab)}) >= (((8'hae) * (8'hb6)) >>> ((8'h9d) ? (8'hae) : (8'hac)))))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire52;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(4'hd):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(5'h15):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire53 = $signed((($unsigned(wire50) >> $signed(wire51[(2'h3):(2'h3)])) ?
                      wire51 : (&(~|{(7'h43)}))));
  assign wire54 = (wire53 ?
                      $unsigned(wire51[(1'h1):(1'h1)]) : wire53[(4'hf):(2'h2)]);
  assign wire55 = wire49;
  assign wire56 = wire51[(1'h0):(1'h0)];
  assign wire57 = ((wire54[(2'h3):(2'h3)] ?
                          $unsigned(($unsigned((8'haa)) ?
                              wire55 : (^(8'hb2)))) : wire53) ?
                      wire50 : $signed(wire53));
  assign wire58 = (&$unsigned($signed((&(wire54 ? wire55 : (8'hab))))));
  assign wire59 = wire50;
  assign wire60 = ({wire53[(3'h5):(2'h3)]} ?
                      wire53 : $signed(wire56[(3'h4):(1'h1)]));
  assign wire61 = $signed({(-{wire52}), (^($unsigned(wire55) << (~&wire57)))});
  assign wire62 = $unsigned($signed($signed(wire61[(2'h3):(1'h0)])));
  assign wire63 = (~^wire53);
  assign wire64 = $unsigned(wire53);
  assign wire65 = wire62;
  assign wire66 = (wire64 ?
                      $unsigned(((((8'ha7) << wire49) ?
                              wire52 : (wire54 ^ wire55)) ?
                          wire65 : wire55[(4'ha):(3'h4)])) : $signed(wire65[(3'h7):(3'h7)]));
  assign wire67 = (wire51 == ({wire49} >= ({{(8'ha9)},
                      (wire56 ?
                          wire57 : wire58)} == $signed($signed((8'ha1))))));
  assign wire68 = (8'ha6);
  always
    @(posedge clk) begin
      reg69 <= ((|(-$signed(wire68))) ?
          (($unsigned((-wire61)) != wire61[(1'h0):(1'h0)]) ?
              (({wire66} ^~ (wire53 ? wire50 : wire65)) ?
                  ((wire58 + wire52) ?
                      wire57[(4'h8):(1'h0)] : wire54[(4'hf):(1'h1)]) : $unsigned((wire64 ^~ (8'hab)))) : (~{(wire56 & wire60),
                  $unsigned(wire62)})) : wire58);
      reg70 <= wire51;
      reg71 <= (|wire66[(4'ha):(4'ha)]);
      reg72 <= wire67[(2'h3):(2'h2)];
    end
  assign wire73 = wire61[(3'h5):(1'h0)];
  assign wire74 = ((&(^$unsigned((wire54 ?
                      wire54 : wire73)))) <= (+reg72[(3'h7):(3'h4)]));
  assign wire75 = ($unsigned((&$signed($signed(wire55)))) ?
                      ($signed({(wire74 ? reg71 : (8'hb7))}) ?
                          wire61 : {wire63[(3'h6):(2'h3)]}) : ((~^$signed($unsigned(wire52))) ~^ $signed(($signed(wire55) <= (^reg69)))));
  assign wire76 = wire63;
  assign wire77 = (wire68[(1'h1):(1'h1)] <<< ($unsigned(reg72) + ({(wire59 ?
                          wire65 : reg70)} > wire64)));
  assign wire78 = $unsigned($signed((~&wire64)));
endmodule
