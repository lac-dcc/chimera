module top
#(parameter param166 = (({(((8'hba) >> (8'ha1)) ? ((8'hab) * (8'hb4)) : ((8'hb7) ? (8'h9d) : (8'hbd))), (((8'ha1) - (8'ha5)) ? ((8'hb1) ? (8'hb1) : (8'ha1)) : ((8'h9c) >= (8'ha9)))} ? ((~&((8'hbe) ? (8'hb5) : (8'hb6))) ^~ ((~^(7'h43)) || ((8'had) ? (8'ha0) : (8'ha5)))) : {(^~(8'ha5))}) ? (((|{(8'hbb), (8'ha3)}) & ((^~(8'hb5)) ? (7'h42) : (~(8'hac)))) + (!((~&(7'h43)) ? ((8'hb2) ? (8'haa) : (8'hb7)) : (^(8'hb0))))) : (~|((~{(8'h9d), (8'hb8)}) > (~(!(8'haf)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(3'h7):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'hc):(1'h0)] reg162 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire158,
                 wire114,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire5 = (!(wire2[(1'h0):(1'h0)] ?
                     $signed(($unsigned(wire1) << (~wire3))) : ($signed({wire3}) | ($unsigned(wire4) != wire4[(2'h2):(1'h1)]))));
  assign wire6 = wire5[(2'h3):(1'h1)];
  assign wire7 = $signed($unsigned(wire5[(2'h2):(2'h2)]));
  assign wire8 = ({$signed(($unsigned(wire0) ?
                         wire7 : $signed(wire3)))} <= $unsigned($unsigned((-{(8'hbd),
                     wire7}))));
  module9 #() modinst115 (wire114, clk, wire8, wire4, wire3, wire7);
  module116 #() modinst159 (.y(wire158), .clk(clk), .wire119(wire0), .wire117(wire5), .wire120(wire114), .wire118(wire4));
  assign wire160 = ($unsigned($unsigned((wire0[(3'h4):(2'h2)] ?
                       $unsigned(wire114) : (|wire158)))) <= $signed($unsigned(wire7[(4'he):(4'he)])));
  assign wire161 = $unsigned($signed(($signed($unsigned(wire5)) < (+wire5[(4'ha):(3'h7)]))));
  always
    @(posedge clk) begin
      reg162 <= wire2;
      reg163 <= wire5;
      reg164 <= {$signed($unsigned(wire8[(4'hc):(4'h8)])),
          ({reg162, $signed($signed(wire2))} ?
              (~^wire1) : $signed((((8'ha1) ? wire5 : wire160) ?
                  (wire2 ? (8'hbf) : wire2) : wire5)))};
      reg165 <= $unsigned(reg163);
    end
endmodule

module module116
#(parameter param157 = (8'hbc))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire120;
  input wire [(5'h15):(1'h0)] wire119;
  input wire [(4'hb):(1'h0)] wire118;
  input wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  assign y = {wire156,
                 wire154,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({(~|((^wire120) >= (&wire117))),
          (8'hb7)} != ((({wire118} <= wire119[(2'h3):(1'h1)]) ?
          wire119[(4'hf):(1'h0)] : wire120[(1'h0):(1'h0)]) > wire117)))
        begin
          reg121 <= $unsigned(wire117[(1'h0):(1'h0)]);
        end
      else
        begin
          reg121 <= $unsigned(($unsigned($unsigned(reg121[(1'h0):(1'h0)])) >= $signed((reg121 ?
              reg121[(2'h3):(2'h2)] : $signed(wire118)))));
        end
      reg122 <= reg121[(4'ha):(2'h2)];
      if ((wire118 ?
          (|($signed((~&reg121)) <= reg122[(3'h7):(3'h4)])) : wire117))
        begin
          if ((reg122[(3'h6):(1'h1)] || {$signed(reg122)}))
            begin
              reg123 <= {(((((8'hb4) ? (8'hb9) : wire118) ?
                          wire120[(3'h5):(2'h2)] : (~^reg121)) ?
                      wire119[(5'h10):(3'h4)] : $signed(wire119)) & $unsigned(($signed(wire118) * ((7'h41) ~^ reg121))))};
              reg124 <= ({wire120} ? wire120 : reg123[(5'h11):(1'h1)]);
              reg125 <= ((wire117 ?
                      (wire119 ?
                          $signed((~^wire119)) : (8'hb8)) : $signed((^reg123[(4'h8):(2'h3)]))) ?
                  $signed($unsigned((wire119 ?
                      reg124[(4'hc):(2'h2)] : $signed(reg124)))) : (reg121[(5'h13):(4'ha)] ?
                      $signed($signed((8'h9f))) : reg123));
              reg126 <= reg122;
              reg127 <= ($signed((($signed(reg121) <= reg121[(5'h14):(3'h5)]) ?
                  wire118 : {(reg121 ? reg122 : (7'h40)),
                      {wire119}})) + $signed(({wire118[(3'h7):(2'h3)]} ?
                  reg121 : wire118)));
            end
          else
            begin
              reg123 <= {wire119[(3'h7):(2'h2)],
                  ($unsigned(reg126) ^ wire120[(3'h6):(1'h1)])};
              reg124 <= (~&((wire119 ?
                      $unsigned(reg121) : (~|wire120[(2'h3):(2'h2)])) ?
                  reg125 : {$signed(wire118[(2'h2):(2'h2)])}));
            end
          if ($unsigned(wire118[(4'hb):(3'h5)]))
            begin
              reg128 <= $signed(((reg125 ^~ reg121) ?
                  (8'hb3) : ($signed((wire119 ?
                      reg126 : reg124)) ^ $unsigned(reg127))));
              reg129 <= $signed($unsigned((($unsigned(reg128) ^ reg122[(2'h3):(2'h3)]) > ((reg127 < wire117) ?
                  ((8'hac) != reg126) : $unsigned(wire119)))));
              reg130 <= (~|(^~reg125[(4'he):(3'h6)]));
            end
          else
            begin
              reg128 <= $unsigned(({reg121[(4'hc):(4'ha)]} < (^({reg129,
                      (8'hb3)} ?
                  reg128 : (^(8'ha3))))));
              reg129 <= ($unsigned($signed((~^$unsigned(reg121)))) + (~|$unsigned((~^{reg126}))));
              reg130 <= $unsigned(((+reg130) - $unsigned((&{reg128, reg125}))));
            end
        end
      else
        begin
          reg123 <= (!$signed((|$unsigned((^~(8'hb4))))));
        end
      reg131 <= (({((wire119 ? reg129 : (8'hba)) ? $signed(wire117) : reg123),
              ((reg127 ? reg127 : wire120) ?
                  reg130[(3'h4):(2'h3)] : $signed(reg128))} ?
          reg124 : $unsigned((~|(^~reg127)))) * (~|(((!reg129) ?
          (^~(8'hb8)) : {reg129, reg124}) <<< $unsigned(((8'hbb) ?
          reg122 : wire118)))));
      reg132 <= (($unsigned(({(8'hb4), reg127} ?
              $unsigned(wire118) : {reg126, reg127})) ?
          $signed((reg121 ? wire120 : $unsigned(reg127))) : ($signed((8'ha3)) ?
              ($unsigned(reg125) | reg131[(4'hf):(1'h1)]) : ((~|(8'had)) >> (^reg127)))) <= $unsigned((~^reg121)));
    end
  assign wire133 = reg127[(3'h4):(1'h1)];
  assign wire134 = $signed((reg122[(2'h3):(1'h1)] ?
                       ((reg127 ? {wire117} : reg132) ?
                           wire120 : $unsigned((reg127 ?
                               wire118 : reg123))) : reg131));
  assign wire135 = (8'hb6);
  assign wire136 = {reg125[(3'h7):(2'h2)]};
  assign wire137 = (&(-reg124));
  assign wire138 = ($signed((~^$unsigned((~|wire135)))) ?
                       (wire118[(3'h7):(3'h6)] ?
                           $unsigned({reg127}) : ((~^(reg124 ?
                               wire136 : reg126)) > $signed((wire137 && reg128)))) : $unsigned({(reg128 ?
                               $signed(reg130) : reg131)}));
  module139 #() modinst155 (.wire140(wire138), .wire144(wire136), .wire143(reg122), .wire141(wire134), .y(wire154), .clk(clk), .wire142(wire135));
  assign wire156 = (wire134 ?
                       $signed(wire138[(4'hb):(2'h3)]) : {wire133[(4'ha):(2'h2)],
                           (($unsigned((8'hb1)) <<< {reg131,
                               reg122}) >>> reg128)});
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 wire28,
                 wire27,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire14 = ($signed($signed((wire11[(3'h4):(1'h0)] ?
                      wire13 : wire10))) || (wire11 ?
                      (+wire11) : wire11[(3'h4):(1'h1)]));
  assign wire15 = ((7'h43) && (8'h9f));
  assign wire16 = (wire12 ?
                      (~&(($unsigned((8'ha9)) <= $unsigned(wire11)) && (^~(8'hb1)))) : $signed((!(wire14[(2'h3):(1'h1)] ?
                          (wire12 ? wire14 : (8'hb2)) : $unsigned((8'hb6))))));
  assign wire17 = wire13;
  assign wire18 = $unsigned({{(^~(wire14 <= wire11))},
                      (wire10[(1'h1):(1'h1)] >> ($unsigned((8'hbe)) <<< wire15[(3'h4):(1'h0)]))});
  assign wire19 = wire15;
  always
    @(posedge clk) begin
      if ((~&(8'hbd)))
        begin
          reg20 <= ((^$unsigned({$unsigned(wire15),
              (~wire12)})) >> ({wire12[(1'h0):(1'h0)],
              $unsigned(wire11)} ^~ (&(+$signed(wire18)))));
        end
      else
        begin
          reg20 <= {(&{wire10[(3'h4):(2'h3)]}),
              $unsigned($signed((+$signed((8'ha9)))))};
          reg21 <= ($signed((((wire17 ? wire18 : wire11) & wire13) ?
                  ((wire10 && wire10) ?
                      $unsigned(wire18) : (~|wire15)) : $unsigned(wire14))) ?
              wire16 : wire12);
          reg22 <= (wire16 != (8'had));
        end
      reg23 <= {((($unsigned(wire17) ?
                  (^wire14) : reg20) >> wire16[(3'h6):(3'h4)]) ?
              wire16[(3'h5):(3'h5)] : {wire16})};
      reg24 <= wire17;
      reg25 <= ((&(wire16[(3'h7):(3'h6)] <<< reg23)) ?
          (((8'ha8) ^ $signed(wire15)) && (reg20[(3'h7):(1'h1)] > (((8'hb1) ?
              wire17 : wire15) - (wire16 || wire16)))) : $signed(wire19));
      reg26 <= (({$unsigned(((8'haa) ? (8'ha2) : wire11)),
                  ((~^reg25) ? $signed(wire12) : (wire18 ^~ (8'hb3)))} ?
              wire14 : (wire13[(5'h13):(5'h11)] != (8'hb8))) ?
          ($unsigned(({wire13, (7'h41)} ?
                  $signed(wire12) : reg22[(3'h5):(2'h3)])) ?
              $signed($signed($unsigned(wire15))) : $signed({wire17})) : reg20);
    end
  assign wire27 = wire13;
  assign wire28 = (reg21[(1'h1):(1'h1)] ?
                      {reg24} : ((!$signed((wire27 | wire19))) - $signed(((reg26 << wire27) >> $signed(wire17)))));
  module29 #() modinst106 (wire105, clk, wire17, wire18, reg22, wire28, wire27);
  assign wire107 = $unsigned($unsigned(wire14[(1'h1):(1'h1)]));
  assign wire108 = {wire10};
  assign wire109 = (|(reg26[(2'h3):(2'h3)] << wire15[(1'h0):(1'h0)]));
  assign wire110 = (wire19 | (&wire27));
  assign wire111 = $signed($signed((~&$signed($unsigned(reg26)))));
  assign wire112 = (^$unsigned((((reg20 ^~ reg23) >>> reg22[(2'h3):(2'h3)]) ?
                       wire107 : (reg24[(2'h3):(2'h3)] ?
                           $signed((8'haa)) : (wire105 != reg23)))));
  assign wire113 = ((wire15[(3'h5):(1'h1)] < reg25) ?
                       $signed(($unsigned((reg20 ?
                           wire12 : reg24)) << wire19)) : (^~((wire12 * (^wire12)) ?
                           wire111[(3'h4):(3'h4)] : $signed(reg23))));
endmodule

module module29
#(parameter param103 = ((+{(((8'hb3) != (8'hab)) < ((8'had) >= (8'hbd))), (((7'h43) * (7'h44)) * (|(7'h43)))}) != (+(|{{(8'h9f), (8'hbb)}, ((8'ha9) ? (8'hbb) : (8'ha1))}))), 
parameter param104 = param103)
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h2e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(3'h4):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(4'h8):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'he):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  reg signed [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire70,
                 wire69,
                 wire68,
                 wire60,
                 wire59,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire35 = wire31[(3'h6):(2'h2)];
  assign wire36 = (-wire32);
  assign wire37 = $signed($unsigned($signed({(wire34 ? wire33 : wire31),
                      (~wire36)})));
  assign wire38 = wire32[(1'h1):(1'h1)];
  assign wire39 = $unsigned(wire38);
  assign wire40 = {(!(((wire31 == wire35) * $unsigned(wire39)) ?
                          $signed($signed(wire38)) : ((wire34 ?
                              wire38 : wire35) || (wire35 ?
                              wire37 : (8'haf))))),
                      $unsigned({{(~&wire33), $signed(wire39)},
                          (wire37[(3'h4):(2'h3)] ?
                              wire38[(1'h1):(1'h1)] : (wire31 ?
                                  wire37 : wire39))})};
  assign wire41 = $unsigned({$signed($signed($unsigned(wire37)))});
  assign wire42 = wire39;
  always
    @(posedge clk) begin
      if ((~wire39[(3'h7):(3'h5)]))
        begin
          if (((wire38 ?
                  $signed($unsigned(wire36[(3'h6):(2'h3)])) : ((~^(8'ha5)) >>> $unsigned({(8'had),
                      (8'h9d)}))) ?
              {($unsigned($signed((8'hbf))) ?
                      wire42 : ({wire32, wire37} ?
                          $signed(wire38) : wire42[(1'h1):(1'h1)]))} : $unsigned((^~wire34[(4'hb):(3'h6)]))))
            begin
              reg43 <= (wire40 << {(8'hae)});
              reg44 <= (^wire35[(2'h2):(1'h0)]);
            end
          else
            begin
              reg43 <= $unsigned(wire42);
              reg44 <= wire33;
            end
          reg45 <= $unsigned($signed(wire37));
          if ($signed($signed(wire30[(2'h3):(2'h3)])))
            begin
              reg46 <= reg43[(5'h14):(2'h2)];
            end
          else
            begin
              reg46 <= $signed((7'h40));
              reg47 <= $signed(wire31[(1'h0):(1'h0)]);
              reg48 <= ($unsigned(({$signed((7'h43)),
                      (wire34 < wire37)} - $signed($unsigned(reg43)))) ?
                  {$unsigned(($signed((8'hb8)) <= wire42))} : $signed((wire41[(1'h0):(1'h0)] ?
                      wire38[(3'h4):(3'h4)] : $unsigned((^wire34)))));
              reg49 <= reg43;
              reg50 <= {($unsigned($unsigned(reg48[(4'h8):(2'h3)])) ?
                      (reg48 <= {(wire41 ? reg48 : reg47),
                          wire35}) : ($signed($signed(wire35)) != $unsigned((~&wire31)))),
                  (7'h44)};
            end
          reg51 <= (^~reg49);
        end
      else
        begin
          reg43 <= $signed(wire31[(4'h9):(4'h9)]);
          reg44 <= wire32;
          reg45 <= ({reg50, reg50[(2'h2):(2'h2)]} <<< wire34);
          reg46 <= $signed((~^$signed((wire40 ~^ wire41[(1'h1):(1'h0)]))));
          reg47 <= {reg47,
              ((wire36[(3'h5):(1'h1)] ?
                  wire41[(2'h3):(1'h0)] : {reg43}) ~^ (((+reg45) ^~ (wire31 ?
                      wire39 : wire32)) ?
                  wire42[(3'h4):(1'h0)] : (wire39 <<< wire39)))};
        end
      reg52 <= $unsigned(((reg50[(1'h1):(1'h0)] ?
          ($unsigned(wire36) ?
              reg51[(2'h2):(2'h2)] : reg49[(3'h6):(3'h5)]) : wire38) >>> (|wire33)));
      reg53 <= (($signed((8'h9f)) ?
              $signed((^reg45[(1'h0):(1'h0)])) : (&(~&((8'h9f) ?
                  reg48 : wire42)))) ?
          $unsigned({(+(wire30 ? reg44 : reg52)),
              ((reg49 ? wire33 : wire41) ?
                  (^~wire38) : (reg47 + reg52))}) : {($unsigned(wire41[(3'h5):(1'h1)]) ?
                  $unsigned($signed(reg52)) : (~^$unsigned(wire32)))});
      if ($signed((((~^$signed((7'h44))) ?
          (~|$signed(reg44)) : reg43[(5'h10):(3'h6)]) + (wire30[(1'h0):(1'h0)] ?
          $signed(((8'ha9) ?
              wire32 : (8'hbd))) : ((|wire35) <= (reg47 & wire39))))))
        begin
          reg54 <= (-reg45[(1'h1):(1'h1)]);
          if ($unsigned($signed(wire31[(2'h2):(1'h1)])))
            begin
              reg55 <= wire31[(2'h3):(2'h3)];
              reg56 <= $unsigned($signed((!$signed(reg52[(4'h8):(3'h7)]))));
            end
          else
            begin
              reg55 <= (8'hbe);
              reg56 <= $unsigned(wire32[(1'h0):(1'h0)]);
              reg57 <= reg48[(2'h2):(2'h2)];
              reg58 <= (8'ha5);
            end
        end
      else
        begin
          reg54 <= {({reg51} ?
                  ((^wire42) < $unsigned($unsigned(reg49))) : reg58),
              $signed($unsigned(reg49[(4'h9):(3'h6)]))};
          reg55 <= reg45[(3'h4):(1'h1)];
          reg56 <= ($signed($unsigned(({(8'hae)} ?
                  (8'ha3) : (reg56 != wire32)))) ?
              wire35 : {$signed($unsigned((&wire41))),
                  $signed((-reg52[(4'hd):(2'h2)]))});
          reg57 <= (8'ha7);
        end
    end
  assign wire59 = $signed((8'hb3));
  assign wire60 = ($unsigned(reg44) << reg52[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg61 <= $signed($unsigned($unsigned((|reg57))));
      reg62 <= $unsigned((+wire34[(4'h9):(1'h0)]));
      if ($signed(reg57))
        begin
          reg63 <= (-(+$signed((~(reg54 ? wire40 : wire33)))));
          reg64 <= $unsigned((-$unsigned((|{reg46}))));
          reg65 <= ((~|(((wire41 ? reg62 : (8'ha9)) <<< $signed((8'ha0))) ?
                  wire59[(3'h6):(3'h5)] : ((wire42 ? reg44 : reg56) ?
                      $unsigned(wire33) : $signed(wire33)))) ?
              {(-$signed((wire38 && wire38)))} : reg46);
          reg66 <= $signed(wire41);
        end
      else
        begin
          reg63 <= (((-{(~&reg61), (-reg50)}) >>> reg50[(1'h0):(1'h0)]) ?
              (wire59 && wire33[(3'h6):(3'h5)]) : $unsigned((8'ha8)));
          reg64 <= {(|$signed(({reg63} ? (~&reg58) : (~|wire42))))};
          reg65 <= (-(^((7'h44) ? reg45 : (+$unsigned(wire35)))));
        end
      reg67 <= $signed(reg54[(4'hb):(2'h2)]);
    end
  assign wire68 = $unsigned($unsigned({reg50[(2'h3):(1'h0)], reg66}));
  assign wire69 = wire68[(2'h2):(1'h1)];
  assign wire70 = reg44;
  always
    @(posedge clk) begin
      if (({((wire38[(2'h2):(1'h1)] & (~reg57)) ?
                  {(wire35 ? (8'ha6) : wire32),
                      {(8'hb2),
                          reg67}} : ($signed((7'h44)) | $signed(reg46)))} ?
          (8'ha8) : reg52[(2'h2):(2'h2)]))
        begin
          if (((|wire35) >= ({reg54[(1'h0):(1'h0)],
              $signed((reg66 & reg51))} * wire39[(4'h8):(2'h3)])))
            begin
              reg71 <= reg43[(5'h11):(4'hf)];
              reg72 <= wire33[(3'h6):(3'h5)];
            end
          else
            begin
              reg71 <= (!$signed((~^(wire35 || $unsigned((8'hbf))))));
              reg72 <= ($signed(($signed((+reg52)) ?
                  (8'hb2) : (reg50[(2'h2):(1'h1)] << (wire35 > wire36)))) << (8'hb0));
              reg73 <= {(~&(reg45 ?
                      {(reg65 ? reg48 : reg43)} : (((8'hb4) ?
                          wire70 : wire31) ^~ $signed(reg46))))};
            end
          reg74 <= reg48[(1'h1):(1'h0)];
          if (reg48[(3'h4):(3'h4)])
            begin
              reg75 <= (((reg58[(2'h3):(2'h2)] != reg56) ?
                      ((8'ha0) ?
                          (^~{reg65, wire70}) : reg52) : (reg55[(4'ha):(2'h3)] ?
                          reg43[(2'h2):(1'h1)] : (^~(-reg64)))) ?
                  {{$signed({wire36, reg47}), ((~reg58) ^ (~reg47))},
                      $unsigned($signed(reg71))} : reg46);
              reg76 <= (~&(^reg51[(4'ha):(4'h8)]));
              reg77 <= $unsigned((~{reg55[(4'hc):(1'h1)]}));
              reg78 <= wire33[(4'hd):(3'h5)];
              reg79 <= (+$unsigned($unsigned((reg74 ?
                  $signed(reg74) : (reg48 ? reg74 : wire31)))));
            end
          else
            begin
              reg75 <= ((8'had) ?
                  {{wire36[(3'h4):(1'h0)], wire70[(3'h4):(1'h0)]}} : wire38);
            end
          reg80 <= reg58[(2'h2):(1'h0)];
        end
      else
        begin
          if ($signed(({reg58} <<< $unsigned(reg67))))
            begin
              reg71 <= {($signed(wire35) ?
                      ($signed($signed(reg74)) || wire39[(2'h2):(1'h1)]) : {$signed((&reg61)),
                          (~&wire69[(4'ha):(4'h8)])}),
                  reg51};
              reg72 <= (wire69[(5'h13):(5'h11)] && wire70[(2'h3):(1'h0)]);
              reg73 <= $unsigned((($signed((reg65 ? (8'hbb) : wire41)) ?
                      $signed($signed(reg64)) : ((reg55 - reg45) << reg51[(4'hd):(3'h7)])) ?
                  (({reg63, (8'h9e)} | wire69) <<< (reg56 ?
                      $signed(wire32) : reg53[(4'he):(4'h9)])) : (|(~&reg76[(4'hb):(1'h1)]))));
              reg74 <= $unsigned($unsigned(((~|reg64[(2'h2):(1'h1)]) ?
                  ((reg78 ?
                      reg75 : reg44) - $unsigned(reg75)) : wire31[(4'ha):(1'h1)])));
            end
          else
            begin
              reg71 <= $signed((($unsigned({(8'ha1), (8'hb9)}) ^~ ((wire35 ?
                          wire36 : reg52) ?
                      wire30 : reg54)) ?
                  reg71 : reg54[(4'hd):(2'h2)]));
              reg72 <= reg73;
              reg73 <= $unsigned($unsigned(({{reg51},
                  ((8'had) ^~ (8'hb8))} >= {reg55})));
            end
          if ((~&reg61))
            begin
              reg75 <= ($signed(reg48[(2'h2):(1'h0)]) ?
                  $unsigned(reg45) : (wire31[(4'hb):(3'h4)] == $unsigned((reg61 - reg64[(3'h5):(1'h1)]))));
              reg76 <= $signed(reg48);
              reg77 <= ((^~reg72[(2'h2):(2'h2)]) || wire36[(2'h2):(1'h0)]);
              reg78 <= (~&(-(^~{((8'hbb) + reg54), (+reg58)})));
              reg79 <= (~|$unsigned((reg72[(3'h4):(2'h3)] >>> {{reg45}})));
            end
          else
            begin
              reg75 <= $unsigned(($unsigned(reg78[(3'h6):(3'h4)]) ?
                  ({{reg61}} ?
                      ((-reg46) ?
                          (+reg43) : wire33[(4'ha):(4'h8)]) : ((+reg56) ?
                          (8'h9e) : wire34)) : wire38[(3'h5):(1'h1)]));
              reg76 <= {(({$unsigned(reg44),
                      $unsigned(reg73)} > ({(8'hae)} || (wire40 ?
                      reg63 : (8'hb7)))) ^~ wire35[(2'h2):(2'h2)])};
              reg77 <= ($signed(reg64[(3'h4):(2'h2)]) == wire34);
            end
        end
      reg81 <= $unsigned($signed($signed((reg63 && (8'hb1)))));
      reg82 <= reg77[(3'h6):(2'h3)];
      reg83 <= wire41[(3'h4):(3'h4)];
      if ($signed({(wire39[(1'h0):(1'h0)] != {$signed(reg46),
              $unsigned((8'h9f))}),
          (($unsigned(wire68) ^~ $unsigned(wire34)) <= (+(!reg58)))}))
        begin
          reg84 <= (8'h9c);
        end
      else
        begin
          if (wire38[(2'h3):(2'h2)])
            begin
              reg84 <= reg76[(4'hc):(4'hb)];
              reg85 <= ($signed(wire60[(1'h1):(1'h0)]) ?
                  reg74[(4'h9):(2'h3)] : ($signed((|{reg62,
                      reg82})) * $signed((~&wire68[(1'h1):(1'h0)]))));
              reg86 <= (^~(~|reg74));
              reg87 <= $unsigned((^reg54));
              reg88 <= $signed(($unsigned(reg77[(4'hc):(2'h3)]) + ((wire41[(2'h2):(1'h0)] ^ $unsigned(wire42)) & reg47)));
            end
          else
            begin
              reg84 <= reg44[(1'h1):(1'h0)];
              reg85 <= {$unsigned($unsigned(reg76)),
                  (&((^$unsigned(reg65)) ?
                      (~&(reg51 ?
                          reg84 : reg51)) : $unsigned($unsigned(reg75))))};
              reg86 <= (reg64 && ((($unsigned(reg72) ? reg49 : (~reg49)) ?
                  $signed(reg72) : (wire31[(4'ha):(4'h9)] ^~ (8'h9e))) <= reg72[(3'h4):(2'h2)]));
            end
          reg89 <= (~&((wire59 ^ $unsigned((-wire39))) <= $unsigned(((wire40 ?
              reg66 : wire33) ^ reg64))));
          if ($unsigned(((8'ha1) >> (((wire41 ? (7'h44) : (8'hb9)) ?
              $unsigned(reg71) : wire42[(3'h5):(2'h3)]) >= ($signed(reg72) ?
              {wire42, (8'hb3)} : $unsigned(wire60))))))
            begin
              reg90 <= reg52;
              reg91 <= (!{reg58});
            end
          else
            begin
              reg90 <= (wire30[(2'h2):(1'h1)] ?
                  $signed($signed($signed(reg73))) : ($unsigned((reg87[(4'h9):(4'h9)] * wire38)) ?
                      {((!reg84) ? {(8'hb6), wire30} : {reg90}),
                          (~|{reg65})} : $signed(wire40[(3'h4):(3'h4)])));
              reg91 <= ((!$unsigned(((8'hbd) ?
                      (wire68 ? (8'ha2) : wire42) : (-reg76)))) ?
                  ($unsigned($unsigned($signed(reg58))) ?
                      (~reg55[(3'h6):(1'h0)]) : (|(wire68[(1'h1):(1'h1)] >>> wire31[(3'h7):(3'h5)]))) : ($signed(reg55[(4'hd):(4'ha)]) ?
                      wire30[(1'h1):(1'h1)] : (({wire70, reg61} ?
                              {reg74, (8'haa)} : $signed((8'hb2))) ?
                          (^$signed((8'hac))) : wire35)));
              reg92 <= ($unsigned((({reg78,
                      reg79} ^ {wire68}) ^~ (-reg83[(3'h6):(2'h2)]))) ?
                  $unsigned(($unsigned(((7'h41) ^ (8'hbb))) ^ $signed(wire36[(3'h4):(2'h3)]))) : reg51[(2'h3):(2'h3)]);
              reg93 <= reg48;
              reg94 <= (($signed($signed(reg45)) ?
                  ((^~(+reg87)) ^ $signed((~reg52))) : $unsigned(($unsigned(reg63) ?
                      reg71 : reg86[(1'h1):(1'h1)]))) == ($unsigned($signed((8'ha6))) < reg92[(1'h1):(1'h1)]));
            end
          reg95 <= $signed({reg81[(1'h1):(1'h1)]});
        end
    end
  assign wire96 = {(wire31[(1'h0):(1'h0)] ?
                          ($signed($unsigned(reg88)) >>> reg94) : (({reg48} ?
                                  (reg92 * wire69) : (wire38 ? reg54 : reg93)) ?
                              $unsigned(reg82) : reg79)),
                      reg73};
  assign wire97 = $unsigned(wire70);
  assign wire98 = (((reg85[(4'h9):(3'h4)] ?
                              (reg66[(2'h3):(1'h0)] != (reg83 ?
                                  reg49 : reg90)) : $signed(reg93)) ?
                          {$signed(wire39[(3'h4):(3'h4)])} : (~reg58)) ?
                      (+reg77) : $signed($signed(reg75[(3'h6):(3'h5)])));
  assign wire99 = $signed(reg49[(3'h5):(2'h3)]);
  assign wire100 = wire39[(4'he):(2'h3)];
  assign wire101 = (8'hb2);
  assign wire102 = ($signed(wire36) ?
                       (({$signed(reg65)} >= $unsigned(reg88)) >>> ((~&$unsigned(wire99)) > $signed(reg78[(2'h2):(2'h2)]))) : $signed(reg90));
endmodule

module module139  (y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire144;
  input wire signed [(3'h6):(1'h0)] wire143;
  input wire signed [(5'h10):(1'h0)] wire142;
  input wire [(2'h3):(1'h0)] wire141;
  input wire [(4'hc):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire153;
  wire signed [(5'h12):(1'h0)] wire147;
  wire signed [(4'hd):(1'h0)] wire146;
  wire signed [(2'h3):(1'h0)] wire145;
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  assign y = {wire153,
                 wire147,
                 wire146,
                 wire145,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire145 = (wire142 ?
                       ($signed({(wire143 ? (8'hbf) : wire143),
                           (wire142 ?
                               wire143 : wire140)}) <= (!$signed(wire141))) : $unsigned($unsigned(wire140)));
  assign wire146 = (^~$unsigned(($unsigned(wire140) >>> $unsigned(((8'hb9) ?
                       wire142 : wire141)))));
  assign wire147 = wire144[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg148 <= $signed({{($unsigned((8'ha5)) <= $unsigned(wire143)),
              wire146[(4'ha):(4'h8)]},
          (8'ha0)});
      reg149 <= (^~(wire147[(3'h5):(3'h5)] ?
          ($unsigned((8'ha0)) ?
              $unsigned({wire145,
                  reg148}) : $signed($unsigned(wire141))) : (8'hb9)));
      reg150 <= {(&$signed((wire141[(2'h2):(1'h0)] ?
              wire143 : (wire147 ? wire143 : wire143)))),
          ({wire141[(2'h3):(1'h1)]} ?
              ($unsigned(wire141[(2'h3):(2'h3)]) ?
                  $signed(wire146[(2'h3):(2'h3)]) : ((reg149 < wire146) * (~^reg148))) : ((^((7'h41) ?
                      wire142 : wire142)) ?
                  (wire146[(3'h4):(2'h2)] * wire143[(1'h1):(1'h1)]) : (~$unsigned(wire143))))};
      reg151 <= $signed(wire145);
      reg152 <= (!(~^{(+(^reg150)), $signed((reg151 ? reg148 : (8'hb5)))}));
    end
  assign wire153 = reg151[(3'h5):(3'h5)];
endmodule
