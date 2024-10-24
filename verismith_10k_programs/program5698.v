module top
#(parameter param126 = (((((~(8'ha1)) != ((8'hac) ? (8'ha7) : (8'hb9))) ? {((8'haa) ? (8'hb2) : (8'had))} : (~^(8'hbe))) >= {((|(8'h9f)) <= (8'hac))}) & {(-({(8'ha0), (7'h43)} >= ((7'h42) ? (8'hbc) : (8'hb0)))), {((|(8'hbe)) ~^ (~^(8'hb8)))}}), 
parameter param127 = (-(!((8'hb5) ? ((+param126) ? (&param126) : (param126 - (8'hbc))) : ((param126 ^~ (8'ha9)) || (param126 > param126))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire124;
  assign y = {wire35,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire124,
                 (1'h0)};
  assign wire5 = $signed(wire2[(2'h2):(1'h0)]);
  assign wire6 = {(!((8'ha1) && wire1[(2'h2):(1'h1)])), wire5};
  assign wire7 = ($signed({wire4[(2'h2):(2'h2)], (8'hbc)}) ?
                     wire6[(3'h4):(3'h4)] : (wire6 && (wire1 < $unsigned((wire2 ?
                         (8'h9c) : wire5)))));
  assign wire8 = (8'hab);
  assign wire9 = wire7[(4'hd):(4'hd)];
  assign wire10 = wire8[(2'h2):(2'h2)];
  assign wire11 = $unsigned(wire8);
  assign wire12 = wire10[(1'h1):(1'h0)];
  assign wire13 = wire1;
  assign wire14 = $unsigned(wire12[(3'h5):(2'h3)]);
  assign wire15 = ($unsigned(wire14[(5'h12):(3'h5)]) ~^ ((+wire9) ?
                      $unsigned($unsigned((wire11 >>> wire3))) : wire5));
  assign wire16 = wire13[(2'h3):(2'h2)];
  assign wire17 = wire4;
  module18 #() modinst36 (.wire22(wire8), .wire23(wire2), .y(wire35), .wire19(wire4), .wire20(wire3), .wire21(wire12), .clk(clk));
  assign wire37 = $signed($signed((8'hb3)));
  assign wire38 = (+wire35[(2'h3):(2'h2)]);
  assign wire39 = $unsigned($unsigned(($signed(wire16) ?
                      ($unsigned(wire6) ?
                          $unsigned(wire3) : (wire14 ?
                              wire35 : wire15)) : wire0[(4'he):(4'h8)])));
  assign wire40 = $signed($signed($unsigned($unsigned({wire7, wire13}))));
  module41 #() modinst125 (wire124, clk, wire16, wire5, wire15, wire39, wire38);
endmodule

module module41
#(parameter param123 = ((((((8'hb6) || (8'ha7)) > {(8'hb9), (8'h9c)}) || (~((7'h40) ? (8'haa) : (8'ha7)))) ^ (({(8'hac), (7'h42)} > ((8'hba) ? (8'hbb) : (8'h9d))) >>> (|(7'h40)))) ? ((^(~((8'ha4) ? (7'h42) : (8'h9c)))) ? ((((8'hac) ? (8'ha5) : (8'hbd)) ? (-(7'h40)) : (~|(8'hb1))) ? (((8'hb0) >>> (8'hae)) ? {(8'h9d)} : ((8'ha1) ? (8'hb3) : (8'hb6))) : (|((8'hb5) ^~ (8'ha9)))) : ((8'hbb) * ({(8'ha8)} ? ((8'hb1) ? (8'hb1) : (8'haa)) : {(7'h43)}))) : {(8'hb9), ((((7'h42) >> (8'hb7)) < (+(8'hab))) ? (8'hb2) : {((8'hb5) << (8'hbc)), (^(8'ha7))})}))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire [(4'hc):(1'h0)] wire44;
  input wire signed [(5'h15):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire122;
  wire [(4'hf):(1'h0)] wire121;
  wire signed [(2'h3):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire67;
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire116,
                 wire114,
                 wire112,
                 wire67,
                 reg119,
                 reg118,
                 reg117,
                 reg115,
                 (1'h0)};
  module47 #() modinst68 (.wire50(wire46), .wire51(wire43), .wire49(wire44), .y(wire67), .clk(clk), .wire48(wire45));
  module69 #() modinst113 (wire112, clk, wire46, wire44, wire42, wire67);
  assign wire114 = wire112;
  always
    @(posedge clk) begin
      reg115 <= ($signed($unsigned({wire43,
          wire45})) << $signed(((~(wire46 && wire45)) && wire45[(1'h0):(1'h0)])));
    end
  assign wire116 = wire46[(4'hb):(1'h0)];
  always
    @(posedge clk) begin
      reg117 <= $signed(wire44);
      reg118 <= $unsigned((~^($unsigned(reg117) >> ($signed(wire116) ?
          reg115[(4'h8):(3'h4)] : wire44))));
      reg119 <= wire114;
    end
  assign wire120 = (($signed((~wire112[(2'h2):(1'h1)])) ?
                           (wire42[(4'h8):(1'h0)] || wire112[(2'h2):(1'h1)]) : (reg119 ?
                               wire67[(1'h0):(1'h0)] : ($unsigned(reg115) >>> (wire114 ?
                                   wire43 : wire46)))) ?
                       wire67 : ((8'hb7) + $unsigned((8'haf))));
  assign wire121 = wire67;
  assign wire122 = wire44[(2'h3):(2'h3)];
endmodule

module module18
#(parameter param34 = (((-((+(8'hb7)) ? ((8'ha8) ? (8'ha6) : (7'h41)) : ((8'hb1) || (8'hb7)))) ? ((((8'hb0) ? (7'h41) : (8'hb5)) && ((7'h42) ^~ (8'hb8))) ? ((~^(8'hb7)) & ((8'hbd) ? (8'ha0) : (8'hb3))) : ((~^(8'ha3)) ^~ ((8'h9d) >= (8'hb3)))) : ({((8'hac) ? (8'ha5) : (8'ha8))} >> {((7'h41) & (8'hb6))})) ? (!((8'hb4) || (~|(~^(8'ha6))))) : (&(^((-(8'hba)) & ((8'ha2) ? (8'ha3) : (8'ha6)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(3'h6):(1'h0)] wire21;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg31,
                 (1'h0)};
  assign wire24 = wire21;
  assign wire25 = (wire23 || (wire24[(3'h6):(3'h6)] ?
                      ((wire20 ?
                          $unsigned((7'h44)) : (&wire21)) == {wire20}) : wire21));
  assign wire26 = $unsigned(wire23[(4'hf):(2'h3)]);
  assign wire27 = ($signed((~|wire24)) <= (wire21 | $signed(wire24[(4'h8):(1'h0)])));
  assign wire28 = (({($signed(wire24) < {wire20, wire22})} ?
                          $signed(((wire27 ?
                              wire19 : (8'haa)) || {wire24})) : (8'hb4)) ?
                      $signed($signed(({wire25} ?
                          $signed(wire20) : wire27[(3'h7):(2'h3)]))) : wire22[(5'h12):(1'h0)]);
  assign wire29 = wire20[(3'h4):(2'h2)];
  assign wire30 = ((^((wire20 > wire26[(1'h0):(1'h0)]) << $signed($unsigned((7'h40))))) ^ wire27[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg31 <= (wire21[(2'h2):(1'h1)] - (^({(8'hb6),
          ((8'h9f) ? wire28 : wire24)} >= $signed($unsigned(wire27)))));
    end
  assign wire32 = wire23[(1'h0):(1'h0)];
  assign wire33 = (~&$signed($unsigned((~|wire29))));
endmodule

module module69
#(parameter param110 = (8'hbe), 
parameter param111 = (((((param110 ? param110 : param110) >= param110) ? param110 : (!(~|param110))) ? (((~^(8'ha0)) == (param110 ? param110 : param110)) ? ((param110 ? param110 : param110) ? (param110 >= param110) : param110) : param110) : (((param110 != param110) ? (~&param110) : param110) * param110)) ? ((8'h9f) ? ((param110 << (-param110)) ? {(~^param110)} : param110) : (~((~^param110) >>> (^param110)))) : {param110, param110}))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h18b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire73;
  input wire signed [(3'h6):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(4'h8):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire90;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire74;
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  assign y = {wire109,
                 wire90,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
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
  assign wire74 = (~$unsigned($unsigned(wire70)));
  assign wire75 = (((((8'ha3) >= (wire73 ?
                              wire72 : wire72)) == $signed($signed(wire72))) ?
                          ($unsigned(wire70[(2'h2):(2'h2)]) <<< ((&wire72) ?
                              wire70[(1'h0):(1'h0)] : wire71)) : $unsigned((wire70 ?
                              $unsigned(wire71) : wire71[(1'h0):(1'h0)]))) ?
                      $signed(wire72[(1'h0):(1'h0)]) : $unsigned(wire72[(1'h0):(1'h0)]));
  assign wire76 = (~|((wire71 ?
                          (+wire74[(2'h3):(1'h1)]) : {{wire71, (8'haf)},
                              wire72}) ?
                      (|($signed(wire74) >= {wire75,
                          wire74})) : $unsigned({(~^(8'ha0)),
                          wire70[(2'h2):(1'h1)]})));
  assign wire77 = wire76;
  assign wire78 = $unsigned((~{(wire74 ~^ wire72[(3'h5):(2'h3)])}));
  assign wire79 = ($unsigned(($signed(wire75[(1'h0):(1'h0)]) ^~ (8'hb2))) ?
                      (~^{wire71}) : $unsigned($signed(wire74[(3'h6):(1'h0)])));
  always
    @(posedge clk) begin
      reg80 <= (8'ha1);
      reg81 <= wire73;
    end
  always
    @(posedge clk) begin
      reg82 <= {(~^({((8'hb7) ? wire71 : wire72), (wire75 < (7'h44))} ?
              (reg80 ? (~^wire74) : wire78) : reg81[(1'h1):(1'h0)])),
          wire72[(1'h0):(1'h0)]};
      reg83 <= (8'h9c);
      if ($unsigned((~wire74)))
        begin
          reg84 <= {$signed($signed(wire77[(2'h3):(2'h3)]))};
          reg85 <= {wire71};
          reg86 <= $unsigned(wire75);
        end
      else
        begin
          reg84 <= ((!{$unsigned((wire72 ? reg80 : wire74)), reg80}) - (8'hb5));
          reg85 <= wire74;
          reg86 <= ((&$signed(({wire70} ?
              $signed(reg82) : $signed(reg84)))) <<< (((~^(^~reg81)) != {(wire72 + wire75),
              $unsigned(wire73)}) <= {$signed((~&reg83))}));
          if ((reg82 > (~wire78)))
            begin
              reg87 <= reg82;
            end
          else
            begin
              reg87 <= reg80[(3'h7):(3'h5)];
            end
          reg88 <= ((-wire71[(4'hc):(2'h2)]) ^~ (!reg86));
        end
      reg89 <= ((($signed($unsigned(wire75)) ?
                  ((+wire77) < $signed((8'hbd))) : {(reg84 - wire78), wire76}) ?
              wire72[(1'h0):(1'h0)] : (7'h43)) ?
          (&wire70) : wire70[(2'h2):(1'h0)]);
    end
  assign wire90 = ((wire79[(1'h0):(1'h0)] << (reg83[(4'h9):(3'h5)] - $signed((+wire72)))) ~^ $signed(reg89));
  always
    @(posedge clk) begin
      reg91 <= $unsigned((reg80[(4'hc):(4'h8)] ?
          (^$signed(reg87)) : (({wire70,
              reg80} + $unsigned((8'hba))) << ($unsigned((8'h9d)) > (wire73 != reg87)))));
      reg92 <= ((reg85[(2'h3):(1'h0)] < (+$unsigned($unsigned(wire71)))) ?
          $signed((~|wire76[(3'h6):(2'h3)])) : (+($unsigned($unsigned(reg88)) <= ((|reg81) ~^ $signed(wire73)))));
      if (($signed($signed($signed($signed(wire79)))) ? reg92 : reg83))
        begin
          if ($unsigned((^reg80[(4'hd):(3'h4)])))
            begin
              reg93 <= $unsigned(($signed(reg82[(3'h4):(2'h2)]) - reg92[(3'h4):(2'h2)]));
              reg94 <= $signed((reg91 ?
                  $signed({((8'ha3) ? reg85 : (8'ha5))}) : wire73));
            end
          else
            begin
              reg93 <= (~&(8'hb8));
              reg94 <= (^($unsigned(wire90) > reg84));
              reg95 <= wire74;
              reg96 <= (8'hb2);
              reg97 <= (reg83 ?
                  (|(~^$signed((wire76 ? reg87 : wire70)))) : (&(!{reg85,
                      wire71[(4'h9):(3'h7)]})));
            end
          if ((((wire78 == $unsigned($signed(reg80))) + $unsigned($unsigned(wire72[(2'h3):(2'h2)]))) - $signed(reg85[(2'h2):(1'h0)])))
            begin
              reg98 <= (|(~reg95[(4'he):(3'h6)]));
              reg99 <= reg98[(2'h2):(1'h1)];
              reg100 <= $signed({(&{(wire76 ? wire74 : (8'hb3)),
                      $signed((7'h43))})});
            end
          else
            begin
              reg98 <= (&($unsigned(wire79) & (8'ha5)));
              reg99 <= $signed((reg81 ?
                  $unsigned($signed($signed(reg86))) : $signed($signed(reg89[(4'hc):(4'hc)]))));
              reg100 <= wire71;
              reg101 <= reg93[(3'h6):(1'h1)];
            end
        end
      else
        begin
          reg93 <= $signed(((reg86 ~^ $unsigned(wire78[(3'h4):(1'h1)])) ?
              ((^~(~^reg94)) ~^ reg95[(3'h7):(3'h4)]) : $signed(($unsigned(wire78) ?
                  $unsigned(reg83) : reg96[(1'h0):(1'h0)]))));
          reg94 <= $unsigned(reg100);
          reg95 <= reg101;
          reg96 <= reg101;
        end
      if (reg88)
        begin
          reg102 <= $unsigned(reg85[(1'h0):(1'h0)]);
          if ($signed((~{$signed($unsigned(reg87)),
              (reg86[(3'h4):(1'h1)] ?
                  (reg98 ? (8'hb2) : wire71) : (reg100 == (8'h9d)))})))
            begin
              reg103 <= $unsigned($signed(($signed(reg83) <= reg94)));
              reg104 <= (^~$unsigned((&wire71)));
              reg105 <= {((&wire71) ~^ $unsigned(($unsigned(reg80) ?
                      ((7'h43) && wire72) : (reg80 ? wire79 : (8'ha4)))))};
              reg106 <= $signed((reg104[(4'hd):(3'h6)] <<< ($signed(reg94[(4'h9):(3'h7)]) >>> ($signed(reg88) == (&reg101)))));
              reg107 <= $unsigned($unsigned({$unsigned((~|reg91)),
                  $signed($signed(wire72))}));
            end
          else
            begin
              reg103 <= (+({reg94[(3'h5):(3'h5)]} ?
                  reg106[(3'h7):(3'h4)] : $unsigned(wire77[(1'h0):(1'h0)])));
              reg104 <= $signed($signed($unsigned($unsigned(((8'ha5) ?
                  (8'hba) : wire73)))));
              reg105 <= $signed((reg103[(4'h9):(1'h0)] ~^ ({$unsigned(reg107),
                  ((8'hb4) ?
                      wire79 : reg98)} >>> $unsigned(reg101[(4'h8):(3'h5)]))));
              reg106 <= (reg91 < $signed({((~&reg101) ?
                      $unsigned((8'h9e)) : $signed(reg104)),
                  $unsigned((reg93 == (8'hb3)))}));
              reg107 <= $unsigned((wire71[(3'h5):(1'h1)] - (+reg94)));
            end
          reg108 <= (-reg105);
        end
      else
        begin
          reg102 <= ({$signed(($signed(wire73) >> $unsigned((7'h43))))} ?
              reg81 : {$signed((reg107[(1'h0):(1'h0)] >>> {reg102})),
                  ($unsigned((|reg92)) ?
                      ($signed(wire90) || $signed(wire70)) : reg100)});
          reg103 <= ($signed((~reg98)) ?
              $signed($unsigned((-$unsigned(reg92)))) : reg92[(1'h1):(1'h1)]);
          if ($signed(wire71))
            begin
              reg104 <= reg101[(4'hc):(2'h3)];
              reg105 <= $signed((({(reg84 ? reg83 : wire78)} ?
                  $signed({wire79}) : ((!reg100) ?
                      ((8'hb1) == (8'h9f)) : $signed((8'hbe)))) >= ({(^wire70)} ?
                  (-(reg88 ^~ (7'h40))) : ($signed(wire71) + (~reg98)))));
            end
          else
            begin
              reg104 <= $unsigned($signed((reg97 ?
                  (reg80 || reg106[(2'h2):(1'h1)]) : ((+wire74) ?
                      $signed(reg85) : (reg85 ? reg104 : reg99)))));
              reg105 <= $signed(reg88);
              reg106 <= (~^(reg101[(1'h1):(1'h1)] ?
                  (((wire78 ? reg98 : wire78) < $signed(reg85)) ?
                      $signed($unsigned(reg88)) : $signed(wire73)) : reg85));
              reg107 <= $unsigned(((~|({reg107,
                      reg95} || wire79[(2'h3):(1'h1)])) ?
                  (-$unsigned(wire70[(1'h1):(1'h0)])) : (7'h40)));
            end
          reg108 <= ($signed((&$signed((~|reg83)))) && (((~&(reg82 ?
                      reg96 : reg99)) ?
                  {$signed(reg82), (^~reg87)} : reg81[(1'h0):(1'h0)]) ?
              (($signed(reg84) & $unsigned(wire77)) ?
                  $unsigned({(8'hb4),
                      reg91}) : reg93[(1'h1):(1'h0)]) : $unsigned(({reg96} >>> (~reg94)))));
        end
    end
  assign wire109 = $unsigned((&reg86[(1'h0):(1'h0)]));
endmodule

module module47  (y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(3'h4):(1'h0)] wire49;
  input wire [(4'hb):(1'h0)] wire48;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(4'h9):(1'h0)] wire65;
  wire [(4'h9):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire54,
                 wire53,
                 wire52,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire52 = ({$unsigned((((8'h9d) ? wire49 : wire51) ?
                              (wire51 != (8'hae)) : wire48)),
                          (8'ha7)} ?
                      ((+(|$signed((8'hb8)))) << $signed(wire49)) : wire49[(2'h3):(1'h1)]);
  assign wire53 = wire49[(1'h1):(1'h0)];
  assign wire54 = ($signed(wire50) ?
                      $unsigned($unsigned((-{wire48}))) : wire48);
  always
    @(posedge clk) begin
      reg55 <= $unsigned(wire48[(1'h0):(1'h0)]);
      if (wire53[(4'hb):(2'h2)])
        begin
          reg56 <= wire50;
          reg57 <= ({wire51} ?
              (((wire54[(4'hc):(2'h2)] ?
                      $unsigned(wire52) : {wire52, (8'hb9)}) ?
                  wire52[(1'h1):(1'h1)] : {wire49,
                      ((8'hb7) ? wire52 : (8'had))}) && (wire48 ?
                  wire50 : $unsigned((!wire48)))) : (~&(wire51 || ((-wire48) > (wire48 ?
                  (8'h9d) : wire53)))));
        end
      else
        begin
          if ($unsigned((reg56[(1'h1):(1'h0)] & reg56)))
            begin
              reg56 <= $signed((^~wire50));
              reg57 <= $unsigned($signed(((((8'ha5) < reg56) >> wire54[(3'h5):(2'h2)]) >>> (~|(7'h40)))));
              reg58 <= (wire51 ?
                  $unsigned((^(+$unsigned(wire53)))) : (~&reg55));
            end
          else
            begin
              reg56 <= (7'h41);
              reg57 <= (-(reg57 ?
                  (wire50 ?
                      $signed(wire54) : $unsigned((wire50 ?
                          reg55 : wire49))) : $unsigned(reg58[(4'hf):(1'h1)])));
              reg58 <= $unsigned($signed($signed($signed(wire49))));
              reg59 <= (+wire48);
              reg60 <= $signed((wire52[(1'h1):(1'h1)] >> $signed(((reg57 ?
                  wire48 : (8'hb5)) ^ {reg55, reg57}))));
            end
          reg61 <= ((wire48 < ((~^$signed(wire52)) | reg57[(5'h10):(3'h4)])) != {((reg55 || (wire53 ?
                      reg56 : reg60)) ?
                  $signed($signed(reg59)) : wire54),
              {($unsigned(wire49) ?
                      wire50[(2'h2):(1'h1)] : $unsigned(reg60))}});
        end
    end
  assign wire62 = (($unsigned((|$signed(wire50))) != $signed({$signed(reg59)})) ?
                      (8'ha6) : wire52[(1'h1):(1'h1)]);
  assign wire63 = $signed((((!$signed(reg61)) ?
                      ({wire51, (8'h9f)} ?
                          wire48[(3'h5):(2'h3)] : (reg60 ?
                              (8'hbb) : wire51)) : $signed((^reg60))) || $unsigned($signed($unsigned(wire53)))));
  assign wire64 = ((~^($signed((wire48 ?
                          wire62 : reg58)) >> $signed((wire63 & wire52)))) ?
                      ($signed((reg58 ? {wire62, (8'haa)} : (~&(8'hb3)))) ?
                          $signed({wire51}) : wire53[(4'hb):(2'h2)]) : (~(reg61 <<< $signed($signed(wire62)))));
  assign wire65 = $unsigned(wire63[(2'h3):(2'h3)]);
  assign wire66 = $unsigned($signed(reg56[(4'h9):(1'h1)]));
endmodule
