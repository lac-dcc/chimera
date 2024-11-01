module top
#(parameter param130 = {{(((~(8'hb6)) ? ((8'hae) ~^ (8'hb0)) : (~&(8'ha1))) && (|{(8'ha9), (8'hb9)})), ((((8'hbf) != (8'ha9)) > (8'hbe)) ? ((~^(8'ha6)) ? (+(8'hb1)) : (^~(7'h40))) : {((8'hbe) - (8'haf)), ((8'ha5) ? (8'hb5) : (8'ha6))})}, {(~^{((8'ha4) + (8'h9e)), ((8'hbe) ^ (8'hbd))}), (^(((8'hbf) ? (8'ha9) : (8'hab)) << (-(8'haa))))}}, 
parameter param131 = ({{{((8'hab) ? param130 : param130)}}, ((+param130) ? ({param130, param130} ? (param130 ? param130 : param130) : param130) : (&(param130 * param130)))} ? ({((^param130) ? {param130} : (8'ha7)), (8'hac)} ? {(-(~&param130))} : (~param130)) : param130))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(4'hd):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire98;
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire104,
                 wire101,
                 wire100,
                 wire4,
                 wire5,
                 wire6,
                 wire14,
                 wire15,
                 wire98,
                 reg129,
                 reg128,
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
                 reg103,
                 reg102,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = ((((!$unsigned(wire1)) - wire0[(3'h5):(2'h3)]) <<< (wire2 ?
                     $signed((!(8'hba))) : {wire1[(5'h11):(1'h1)],
                         wire3[(4'hb):(4'h9)]})) | $unsigned((((^~wire1) & $unsigned(wire1)) ?
                     (8'hae) : (^wire0))));
  assign wire5 = $unsigned((((~&$signed(wire4)) - wire0[(4'h8):(3'h4)]) ?
                     wire0[(4'hb):(3'h4)] : ((((8'ha3) ? wire2 : wire0) ?
                         (wire4 ?
                             wire4 : wire2) : (wire0 >>> wire2)) < (8'ha0))));
  assign wire6 = $signed((wire1 != wire3));
  always
    @(posedge clk) begin
      reg7 <= (-($unsigned(({wire1} ? ((8'haa) ^ wire5) : $unsigned(wire4))) ?
          wire5[(3'h4):(2'h3)] : (^~wire0[(4'h8):(3'h7)])));
      reg8 <= (-((reg7 ^ $unsigned(reg7)) < $unsigned($unsigned((wire1 || wire3)))));
      reg9 <= wire2[(1'h1):(1'h1)];
      if (wire4[(4'hd):(3'h5)])
        begin
          reg10 <= wire0;
          reg11 <= reg8[(3'h4):(1'h1)];
          reg12 <= {(wire1[(1'h1):(1'h1)] >>> (^~wire4[(4'hc):(4'h8)])),
              $signed($unsigned($signed(reg10[(2'h2):(2'h2)])))};
          reg13 <= (8'h9e);
        end
      else
        begin
          reg10 <= (^~$unsigned((&(reg12[(1'h0):(1'h0)] ?
              {wire6, reg9} : $signed(reg10)))));
          reg11 <= (-$signed((!($unsigned(reg9) ?
              (reg7 ? reg9 : reg12) : (-wire1)))));
        end
    end
  assign wire14 = $signed({{((wire0 ? wire1 : reg9) >> reg9)},
                      reg11[(3'h4):(2'h2)]});
  assign wire15 = (^~($signed(reg12[(3'h5):(2'h3)]) ?
                      (^reg7[(2'h3):(2'h3)]) : {$unsigned(reg11),
                          ((|wire0) ? (~&wire2) : $signed(reg11))}));
  module16 #() modinst99 (wire98, clk, wire0, reg13, reg11, reg7);
  assign wire100 = (+reg9);
  assign wire101 = (-(wire14[(2'h3):(1'h1)] ?
                       $unsigned(({reg10} & reg8)) : $signed((!(8'hb1)))));
  always
    @(posedge clk) begin
      reg102 <= (^~reg11[(2'h3):(1'h0)]);
      reg103 <= wire14[(4'ha):(4'ha)];
    end
  assign wire104 = wire1[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg105 <= $signed(wire15[(2'h2):(1'h0)]);
      if ($signed({$signed(wire0), wire14[(4'he):(4'h8)]}))
        begin
          if ($unsigned((+wire2[(1'h0):(1'h0)])))
            begin
              reg106 <= reg12[(1'h0):(1'h0)];
              reg107 <= $signed($signed(($signed($unsigned(wire1)) ?
                  reg105[(1'h0):(1'h0)] : reg11[(4'hc):(3'h7)])));
              reg108 <= (($signed((|wire5[(1'h0):(1'h0)])) >> wire1[(3'h6):(3'h4)]) < reg13[(4'h9):(3'h6)]);
              reg109 <= $signed($unsigned(reg13[(1'h1):(1'h1)]));
              reg110 <= $signed(reg106[(3'h5):(3'h5)]);
            end
          else
            begin
              reg106 <= $signed(reg110);
              reg107 <= {(7'h44)};
              reg108 <= $signed($signed($unsigned({(reg108 ? (7'h43) : (8'hbe)),
                  wire14[(4'hc):(4'h9)]})));
              reg109 <= $unsigned(reg10[(3'h5):(2'h2)]);
              reg110 <= reg107[(3'h5):(3'h5)];
            end
          reg111 <= wire101[(2'h3):(1'h1)];
          if ((wire100 ?
              {$signed($signed((-(8'ha8)))),
                  ((reg13 || (wire3 << wire104)) == {reg8[(4'ha):(3'h4)],
                      (|reg103)})} : (reg10[(4'he):(3'h6)] << (~|($unsigned(wire104) ?
                  (~^reg7) : (^~reg8))))))
            begin
              reg112 <= (&((~|{wire101, (~^wire5)}) ?
                  (&{(~&reg107)}) : reg110[(4'ha):(4'h9)]));
            end
          else
            begin
              reg112 <= (^({$unsigned((~|wire2)),
                  $signed((reg109 ? (8'ha5) : reg110))} > $unsigned(reg112)));
              reg113 <= $signed($signed({(~|reg111[(3'h4):(2'h2)]),
                  {reg110, (~&reg7)}}));
              reg114 <= $signed((~&wire14));
            end
        end
      else
        begin
          reg106 <= (~$signed($unsigned($signed($signed(reg107)))));
          reg107 <= ($signed($unsigned(wire15[(5'h10):(5'h10)])) * (~&reg102));
          if ({$signed({reg105[(1'h1):(1'h1)]})})
            begin
              reg108 <= wire4[(4'hd):(2'h3)];
              reg109 <= reg105;
              reg110 <= reg111;
              reg111 <= {((wire98 && ($unsigned(reg111) ?
                      (reg113 ?
                          reg109 : reg106) : reg112[(3'h4):(3'h4)])) * $unsigned(($unsigned(reg102) ?
                      (reg13 ? reg112 : wire6) : $signed(reg103)))),
                  reg111};
              reg112 <= (^~$signed(({{reg113, wire4}} ?
                  (wire104[(4'h8):(1'h1)] != reg102) : wire100)));
            end
          else
            begin
              reg108 <= ($unsigned((wire100[(3'h6):(3'h6)] ?
                      (reg103[(3'h4):(1'h1)] <<< $signed(reg109)) : reg12)) ?
                  (^~reg107[(3'h7):(2'h3)]) : ((~&(^~(reg113 ?
                      wire101 : reg11))) ^ (~|$signed($unsigned(reg112)))));
              reg109 <= $signed((+reg107));
              reg110 <= $unsigned((+$unsigned((~^(wire104 ? reg102 : wire1)))));
            end
        end
    end
  assign wire115 = (($unsigned($signed(reg109[(4'he):(4'he)])) < reg106) || (($signed($signed((8'hbf))) >>> $unsigned(wire1[(2'h3):(1'h1)])) ^~ reg103));
  assign wire116 = ((wire2 >= (^($unsigned(reg9) ?
                           wire2[(2'h2):(2'h2)] : reg114))) ?
                       (7'h43) : $signed((^~wire104)));
  always
    @(posedge clk) begin
      reg117 <= (-((|reg112) << reg105));
      reg118 <= reg114;
      if (({reg107, $signed($signed((~&reg105)))} ?
          reg102[(5'h10):(4'ha)] : ({{wire0}} >>> ($unsigned($signed(wire115)) | $signed((reg107 ^~ reg103))))))
        begin
          if (((8'hbc) ? $unsigned($unsigned((-$unsigned(reg118)))) : reg10))
            begin
              reg119 <= (8'hbc);
              reg120 <= ({wire6[(4'hd):(4'hc)], wire14} ~^ reg107);
              reg121 <= $unsigned((-wire2));
              reg122 <= (7'h44);
              reg123 <= reg103[(4'h9):(2'h2)];
            end
          else
            begin
              reg119 <= ((reg8[(1'h1):(1'h0)] ?
                  (8'hbe) : {$signed((wire6 || (8'h9d))),
                      ($signed((8'ha8)) > wire14[(4'he):(4'hb)])}) >>> (~|$unsigned(($signed(wire1) ^ reg123))));
              reg120 <= reg118;
            end
          reg124 <= $unsigned(wire115);
          reg125 <= {(($unsigned($unsigned(reg121)) >= ({(8'ha8)} ?
                  $unsigned(reg117) : reg114)) << (reg102[(2'h2):(1'h1)] * ((8'hb0) > {reg124}))),
              reg122};
          reg126 <= $signed(reg125);
        end
      else
        begin
          if ((-reg105[(1'h1):(1'h0)]))
            begin
              reg119 <= {$unsigned({(-$unsigned(wire115)),
                      $signed((reg7 ? wire3 : reg7))}),
                  $signed($unsigned($signed((^~reg111))))};
              reg120 <= $signed((^~$signed((-$signed(reg114)))));
              reg121 <= (~|(reg121[(2'h2):(1'h1)] ?
                  ((|(^~reg123)) ^ reg8) : (reg8 != (!$signed(wire115)))));
              reg122 <= ($signed($signed(((+wire104) < $unsigned(reg11)))) ?
                  (8'haa) : wire14);
              reg123 <= (~&($unsigned((reg109[(4'h8):(2'h3)] ?
                  (^~reg114) : (wire104 ^~ reg9))) >> ($unsigned(reg103) > wire2)));
            end
          else
            begin
              reg119 <= {$unsigned(($unsigned((8'h9d)) ^ $unsigned($signed(reg13)))),
                  (~^$unsigned($unsigned($unsigned(reg124))))};
              reg120 <= reg121;
              reg121 <= {reg114, reg125[(2'h2):(1'h0)]};
              reg122 <= reg125;
            end
          if (((~&reg13[(2'h2):(1'h0)]) ?
              (((((8'ha3) <= wire5) & (~^reg124)) && reg8[(4'hb):(3'h5)]) ?
                  $unsigned((-$unsigned(reg124))) : $unsigned($unsigned(wire15[(4'h9):(1'h1)]))) : ({reg120,
                  (~|(reg112 ? wire98 : wire104))} << {reg7[(3'h7):(3'h7)]})))
            begin
              reg124 <= $unsigned(($unsigned(((reg114 ^ reg118) ?
                      (reg11 ? (8'hb8) : wire104) : (wire115 ?
                          (8'hbe) : reg108))) ?
                  wire15[(3'h6):(2'h2)] : (!reg113[(2'h2):(2'h2)])));
              reg125 <= reg119[(3'h5):(3'h5)];
              reg126 <= (-wire98);
            end
          else
            begin
              reg124 <= ((!$unsigned(((reg123 <<< reg119) ?
                  ((8'h9d) << reg9) : (~&(8'h9e))))) * {$unsigned(($signed(reg111) ?
                      $signed(reg10) : (~&reg13)))});
              reg125 <= reg10[(4'hc):(3'h7)];
              reg126 <= $unsigned(reg110);
              reg127 <= reg111;
            end
          reg128 <= (|(^~reg109[(1'h1):(1'h1)]));
        end
      reg129 <= $signed(reg125);
    end
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire18;
  input wire signed [(4'hc):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire75;
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire93,
                 wire77,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire42,
                 wire43,
                 wire75,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire21 = $unsigned(wire20[(4'hb):(3'h5)]);
  assign wire22 = $signed(($unsigned({((8'hb7) ?
                          (8'ha6) : (8'ha8))}) <<< {$unsigned((wire20 ?
                          wire19 : wire21))}));
  assign wire23 = ((8'hb2) + (($signed($unsigned(wire22)) < ((-wire17) >>> $signed(wire20))) ?
                      $signed(((wire20 && wire19) ?
                          wire19[(2'h2):(1'h0)] : $signed((8'hbe)))) : $unsigned(wire21[(2'h2):(1'h0)])));
  assign wire24 = $unsigned({(7'h44),
                      ($unsigned($signed(wire18)) ?
                          ((^~wire18) ?
                              wire21 : (wire20 + (8'ha6))) : wire20[(4'h9):(2'h3)])});
  assign wire25 = $unsigned((&$signed(wire23)));
  assign wire26 = ($unsigned((wire22[(4'hc):(4'hb)] <= wire18)) - wire23);
  assign wire27 = wire25;
  assign wire28 = ((^wire22[(4'h9):(2'h3)]) - wire18);
  assign wire29 = wire23;
  assign wire30 = ((+($signed(wire23[(1'h1):(1'h1)]) << wire22[(4'ha):(4'h8)])) ?
                      $unsigned(wire21[(3'h5):(1'h0)]) : (8'hba));
  assign wire31 = wire18[(1'h1):(1'h1)];
  assign wire32 = (8'h9c);
  assign wire33 = $unsigned(wire31[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned({(&(&wire18)), wire28})))
        begin
          reg34 <= ({wire31} ?
              {$unsigned((wire32 ? (~wire21) : (~&wire23))),
                  $signed(((&wire26) ?
                      (wire20 ?
                          wire32 : (8'hb5)) : {wire23}))} : ((-$unsigned($unsigned(wire26))) != ($unsigned($signed(wire29)) >= {(wire22 ?
                      wire23 : (8'hb3)),
                  (wire23 ? wire29 : wire29)})));
          reg35 <= wire27[(3'h7):(3'h4)];
        end
      else
        begin
          reg34 <= $signed((^$signed($unsigned((~|wire32)))));
          reg35 <= $signed($unsigned({$unsigned((8'ha6)),
              ((wire31 * wire23) ^ {wire17, wire29})}));
          reg36 <= ((~|{$unsigned((wire17 ? wire17 : wire19))}) ?
              (wire29[(4'h8):(2'h2)] ?
                  (((~|wire24) <= {wire26, wire20}) == {((8'h9e) ?
                          wire20 : (8'had))}) : {$unsigned((8'hb2)),
                      wire31[(1'h1):(1'h0)]}) : (wire31[(4'h8):(1'h1)] <= $unsigned(wire31[(1'h1):(1'h0)])));
          reg37 <= $signed($unsigned(wire28[(3'h6):(3'h6)]));
          reg38 <= wire31[(4'h8):(1'h0)];
        end
      reg39 <= wire32[(1'h0):(1'h0)];
      reg40 <= {($signed(((&(8'hab)) < $signed(reg38))) < {$signed($unsigned(wire26)),
              $signed((reg39 ? wire20 : (7'h42)))}),
          wire18};
      reg41 <= ((7'h41) >>> (reg40[(1'h0):(1'h0)] ?
          {wire22,
              reg39} : (((reg35 >>> (8'h9d)) <<< $signed(wire25)) + (reg40 + wire30))));
    end
  assign wire42 = (~&(!{reg38, (wire33[(2'h2):(2'h2)] >>> (wire30 + wire31))}));
  assign wire43 = reg35;
  module44 #() modinst76 (wire75, clk, wire28, reg38, reg37, wire27, wire21);
  assign wire77 = wire25[(1'h1):(1'h1)];
  module78 #() modinst94 (.clk(clk), .wire79(wire21), .wire81(wire19), .wire80(wire24), .wire82(wire31), .y(wire93));
  assign wire95 = wire28;
  assign wire96 = (8'hb9);
  assign wire97 = $unsigned(($signed({{reg35}}) >> ({(wire42 || reg35)} & wire26[(2'h3):(1'h1)])));
endmodule

module module78
#(parameter param92 = ((8'hb9) | (^({{(8'hb3)}} ? (^(+(8'ha8))) : (^~((8'ha4) ? (8'h9f) : (8'hbc)))))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire82;
  input wire [(4'hc):(1'h0)] wire81;
  input wire signed [(5'h14):(1'h0)] wire80;
  input wire signed [(5'h11):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(5'h12):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire83;
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire83,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire83 = $unsigned(wire80);
  always
    @(posedge clk) begin
      reg84 <= wire79[(1'h1):(1'h0)];
      reg85 <= $signed((-wire80[(4'he):(4'hd)]));
      reg86 <= {$signed((wire79[(5'h10):(4'he)] <= wire81[(2'h3):(2'h2)]))};
      reg87 <= (^($signed((-wire83[(3'h7):(3'h4)])) ?
          $signed($unsigned({reg85})) : (reg86[(3'h4):(2'h2)] != ((reg86 <<< wire80) ?
              (~&wire80) : (-wire79)))));
    end
  assign wire88 = (+((^$signed((reg84 ? wire82 : reg86))) ?
                      wire79[(4'he):(4'h8)] : wire80));
  assign wire89 = wire81;
  assign wire90 = $unsigned({reg87[(3'h5):(1'h0)]});
  assign wire91 = $signed($unsigned($signed(({wire88, wire81} ?
                      wire88 : $signed(wire79)))));
endmodule

module module44
#(parameter param74 = ((+((~(~^(8'h9e))) ? (((8'h9d) ? (8'ha2) : (8'h9c)) ? (~|(8'ha0)) : ((8'had) ? (7'h44) : (8'hbb))) : ((-(7'h43)) ? ((8'h9c) < (8'hb3)) : (~^(8'hbf))))) | ((((|(8'had)) ? ((8'ha9) <= (7'h42)) : {(8'hb0)}) ? (^~(~^(8'haa))) : (~((8'h9f) != (8'hb5)))) & ((~&(~^(7'h44))) ^~ (((8'hb7) && (7'h42)) || (8'had))))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire [(4'he):(1'h0)] wire47;
  input wire signed [(4'h9):(1'h0)] wire46;
  input wire [(5'h14):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  assign y = {wire73,
                 wire52,
                 wire51,
                 wire50,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire50 = (($signed(((wire47 ? wire45 : wire47) ?
                          (wire47 ? wire47 : (8'ha5)) : ((8'hbd) ?
                              wire45 : wire45))) & (|wire48[(3'h5):(1'h0)])) ?
                      $signed((((wire46 ?
                          wire46 : wire48) & (wire46 ^~ wire48)) & (wire46[(1'h1):(1'h1)] ?
                          wire48[(2'h2):(1'h1)] : $unsigned((8'hac))))) : {(wire47 != wire48[(1'h1):(1'h1)]),
                          (((~wire46) && wire45[(5'h12):(3'h4)]) - (wire48[(2'h3):(2'h2)] ^~ {wire46,
                              wire46}))});
  assign wire51 = $unsigned($unsigned((^((wire45 < wire47) ?
                      $unsigned(wire48) : $unsigned(wire47)))));
  assign wire52 = {wire47, $unsigned($signed(wire48))};
  always
    @(posedge clk) begin
      reg53 <= $signed($signed($unsigned($unsigned(wire47))));
      reg54 <= $signed(wire52);
      reg55 <= wire49;
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed(($signed((8'had)) ?
          (8'hb1) : $unsigned(wire52))))))
        begin
          reg56 <= (+((wire45 + wire51) ? wire51 : $unsigned((8'ha5))));
          reg57 <= reg53[(2'h3):(2'h2)];
          if ($signed($signed((+reg57[(1'h0):(1'h0)]))))
            begin
              reg58 <= ({wire48[(3'h5):(3'h5)]} < {$unsigned(((|wire52) & {reg55})),
                  $signed(wire46[(1'h0):(1'h0)])});
              reg59 <= ((!({$signed((8'hb0)), {wire47}} ?
                  wire49[(4'ha):(1'h1)] : ($unsigned((8'hb6)) || (reg55 ?
                      reg57 : reg58)))) || reg57);
              reg60 <= wire48;
            end
          else
            begin
              reg58 <= $unsigned(reg55);
              reg59 <= ($signed({(wire52 ? reg59 : wire50[(3'h7):(1'h0)]),
                      reg53[(4'h9):(3'h7)]}) ?
                  (wire47[(3'h4):(2'h2)] ?
                      $unsigned($signed($unsigned(wire49))) : (~$unsigned({wire47}))) : (+$signed({$unsigned(reg58)})));
            end
          reg61 <= reg56;
          reg62 <= (8'hb0);
        end
      else
        begin
          if (reg61[(1'h0):(1'h0)])
            begin
              reg56 <= wire50;
              reg57 <= ((!wire46) ^ {wire49[(3'h7):(2'h2)]});
              reg58 <= $signed(((^~(reg61 ?
                  (~|wire51) : wire47[(2'h3):(1'h1)])) == (8'ha1)));
              reg59 <= (~|(({reg59} ?
                  ((!wire45) ?
                      $signed(wire47) : (wire52 ? reg53 : reg61)) : (+(wire51 ?
                      wire51 : (8'hac)))) == $signed((wire49[(1'h0):(1'h0)] ?
                  ((8'h9e) ? reg55 : reg62) : $unsigned(reg53)))));
              reg60 <= ($unsigned((8'hbe)) ~^ reg59[(4'ha):(4'h8)]);
            end
          else
            begin
              reg56 <= ({(($signed(reg58) - $unsigned(reg59)) ?
                      wire51[(4'hd):(2'h3)] : $signed({wire52,
                          reg59}))} ~^ ((wire52 ?
                      (+$unsigned(wire45)) : wire46) ?
                  (!$signed({reg59,
                      (8'ha9)})) : $unsigned(wire51[(3'h7):(3'h5)])));
              reg57 <= {reg57[(1'h0):(1'h0)], (&wire50)};
            end
          if ((~&$unsigned(wire46)))
            begin
              reg61 <= ((reg59 ?
                  (8'hbf) : ((^(~^reg54)) ?
                      ((~reg58) ? (!reg61) : wire47) : (reg58 ?
                          ((8'hb1) ? (8'h9f) : reg62) : {(7'h41),
                              (7'h41)}))) >>> wire47[(3'h7):(1'h0)]);
            end
          else
            begin
              reg61 <= reg62[(1'h0):(1'h0)];
              reg62 <= $unsigned((wire51 ?
                  wire45 : $signed(reg54[(1'h1):(1'h1)])));
              reg63 <= reg53;
              reg64 <= $unsigned((^{(reg56 ?
                      (wire45 >= reg59) : (reg57 ? reg59 : reg59))}));
            end
          reg65 <= wire49;
          if (reg59[(4'h8):(3'h5)])
            begin
              reg66 <= ($signed($signed((^~(~^reg58)))) ?
                  wire51 : $signed((&(~^reg55[(2'h3):(1'h1)]))));
              reg67 <= ($unsigned($signed($unsigned({reg54}))) ?
                  (((~|(reg61 ? wire49 : wire47)) ?
                      ((~wire47) ?
                          (8'hbe) : $unsigned(reg54)) : $unsigned({wire47})) || (^reg61)) : reg55);
            end
          else
            begin
              reg66 <= $unsigned($unsigned((wire52 ~^ $signed({reg61,
                  reg55}))));
            end
          reg68 <= reg63;
        end
      reg69 <= (wire51[(2'h3):(1'h0)] & ($signed({(reg59 ? reg61 : wire52)}) ?
          (reg65 ? reg63 : reg58[(4'he):(3'h5)]) : (^reg61[(1'h0):(1'h0)])));
      reg70 <= $signed(reg65[(3'h7):(2'h3)]);
      reg71 <= ($unsigned((~wire51)) >>> reg59[(2'h2):(1'h1)]);
      reg72 <= ($unsigned(wire45) < (wire49 ? wire47 : reg58[(4'he):(2'h3)]));
    end
  assign wire73 = {((!$unsigned(reg62)) * $signed((wire46 >>> {(8'ha0)})))};
endmodule
