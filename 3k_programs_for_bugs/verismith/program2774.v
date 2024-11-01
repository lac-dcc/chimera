module top
#(parameter param122 = {(+((((8'haa) != (7'h43)) ? ((8'had) ? (7'h42) : (8'ha0)) : ((8'hba) ? (7'h41) : (8'hbf))) + (-{(8'hb6)})))}, 
parameter param123 = param122)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire [(4'h9):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(2'h2):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire101,
                 wire100,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg104,
                 reg103,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      reg5 <= wire0;
    end
  assign wire6 = ((($signed((~wire3)) | (wire0[(3'h4):(1'h0)] ?
                         $signed(reg4) : ((8'hbd) ? wire1 : wire2))) ?
                     (~&(~reg5[(4'he):(4'hd)])) : ((~$signed(reg4)) <<< $unsigned((reg4 != wire0)))) | reg5[(4'hf):(4'h8)]);
  assign wire7 = reg5;
  assign wire8 = (^{wire6});
  assign wire9 = reg5[(3'h6):(3'h6)];
  assign wire10 = (($signed($unsigned((wire1 ^ wire1))) | $signed($signed(wire0))) ?
                      ($unsigned(((reg5 ?
                          wire6 : reg5) == (+wire3))) > $signed(wire3[(3'h4):(3'h4)])) : {wire1[(3'h7):(2'h2)]});
  assign wire11 = (($unsigned(reg5[(4'hf):(4'ha)]) == (wire7[(3'h6):(3'h5)] <<< (|(reg5 ^ reg4)))) ?
                      {$signed(($signed(wire2) < $signed(wire2))),
                          (~^(~wire10))} : ((((~^reg5) ?
                              wire7[(1'h1):(1'h1)] : (wire6 ?
                                  reg5 : reg4)) || ((wire8 ? reg4 : wire3) ?
                              (~|wire6) : $unsigned(reg4))) ?
                          (8'hb8) : {wire7[(3'h4):(1'h1)]}));
  assign wire12 = (((wire6[(4'hb):(3'h4)] & $unsigned({wire9})) ?
                          (wire9 == $signed(wire9[(4'hb):(4'h8)])) : wire7[(1'h0):(1'h0)]) ?
                      ((8'ha1) ^~ wire3[(3'h4):(1'h1)]) : $signed($signed(((reg4 ?
                          wire2 : reg5) <= (reg4 ? wire7 : wire1)))));
  module13 #() modinst91 (.wire15(wire8), .wire14(wire6), .y(wire90), .wire17(wire9), .wire16(wire1), .clk(clk));
  assign wire92 = (~&wire6[(4'h9):(3'h6)]);
  assign wire93 = $unsigned($unsigned(wire3));
  assign wire94 = $unsigned(wire8[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg95 <= {((wire3 >>> ($unsigned(wire1) || wire8[(3'h5):(3'h5)])) <= wire10)};
      reg96 <= $signed(reg5[(2'h2):(1'h1)]);
      reg97 <= (~^(&wire12[(3'h7):(2'h2)]));
      reg98 <= (((8'h9c) ?
              $signed(({wire11, reg4} ?
                  $signed(wire90) : (wire9 == wire9))) : $signed($signed(wire3[(2'h2):(2'h2)]))) ?
          (~^($unsigned(reg96[(3'h4):(1'h1)]) ?
              wire94[(3'h5):(3'h5)] : $signed((wire8 ^ (8'hb3))))) : $signed(($signed((wire92 - (8'ha1))) == $signed(reg95))));
      reg99 <= $unsigned((8'ha9));
    end
  assign wire100 = reg4[(3'h4):(1'h1)];
  assign wire101 = reg95;
  always
    @(posedge clk) begin
      reg102 <= wire94[(4'h9):(4'h9)];
      reg103 <= {(~&reg102),
          ($unsigned($signed(reg98)) ?
              wire101[(4'hd):(1'h1)] : $signed(((wire3 ~^ wire7) <<< wire100[(5'h11):(1'h1)])))};
      reg104 <= $unsigned($signed((reg98 >= wire2)));
    end
  assign wire105 = (+$unsigned($signed((wire101 | reg104))));
  assign wire106 = {{reg98[(3'h5):(1'h0)],
                           (reg4[(4'hd):(4'hd)] ?
                               wire3[(2'h3):(1'h1)] : ((reg104 ~^ wire7) <= wire3[(1'h1):(1'h0)]))}};
  assign wire107 = wire105;
  assign wire108 = wire12[(2'h3):(1'h0)];
  assign wire109 = ($unsigned(wire93[(1'h0):(1'h0)]) && wire11[(4'hd):(3'h7)]);
  always
    @(posedge clk) begin
      reg110 <= $signed(wire6);
      reg111 <= wire2[(4'h8):(2'h2)];
      if ($unsigned((wire11 & (8'hb1))))
        begin
          if (wire90)
            begin
              reg112 <= ($signed({({wire7, (8'hbe)} ?
                      (reg5 != reg103) : $signed(reg111)),
                  $signed((8'hae))}) <<< (8'hb7));
              reg113 <= $unsigned(((({reg95, (8'hb6)} && (reg111 ?
                      (8'hb0) : wire12)) + reg99) ?
                  wire9 : {((wire3 ? (8'ha9) : wire2) > wire3[(4'h8):(4'h8)]),
                      (&wire90)}));
            end
          else
            begin
              reg112 <= wire8;
              reg113 <= (((wire93 ?
                          $unsigned(wire0) : {(wire108 ? (8'hae) : reg102),
                              ((8'hbd) ? wire2 : wire94)}) ?
                      (^~$signed((+wire100))) : wire106) ?
                  ($signed($signed($unsigned(wire3))) ?
                      (((wire7 >> (8'hb7)) << $unsigned(wire100)) ?
                          ((wire107 ? wire107 : (8'hac)) ?
                              $unsigned((8'hbb)) : reg97) : ({reg97,
                              reg104} & (wire101 ?
                              wire3 : wire92))) : (($unsigned((8'hac)) <<< $unsigned(wire101)) >= $unsigned((wire107 ?
                          reg111 : reg102)))) : $unsigned(($signed($signed(reg110)) ?
                      {(reg98 ? wire1 : reg98), $unsigned(reg103)} : ((reg102 ?
                          wire7 : reg104) || (8'hac)))));
              reg114 <= $unsigned(wire105);
              reg115 <= wire101;
              reg116 <= (wire94[(3'h7):(3'h5)] || wire10);
            end
        end
      else
        begin
          if ({wire12, $signed($signed({$unsigned(wire7)}))})
            begin
              reg112 <= $signed(reg97[(1'h1):(1'h1)]);
              reg113 <= reg110[(4'he):(3'h4)];
              reg114 <= (~$signed($signed(reg104[(4'ha):(3'h4)])));
            end
          else
            begin
              reg112 <= ((({wire8[(3'h5):(1'h0)], (~^reg98)} ?
                      wire109 : ({wire0} ?
                          (wire94 >> wire8) : wire105[(4'hc):(1'h0)])) >> reg95) ?
                  (&$signed($unsigned(reg102))) : $unsigned((reg98 || wire6[(4'ha):(3'h7)])));
              reg113 <= $unsigned($signed(($unsigned($signed(wire93)) << (reg116[(1'h1):(1'h1)] ?
                  reg104[(1'h0):(1'h0)] : $unsigned(reg113)))));
              reg114 <= {$signed((reg4[(2'h3):(1'h0)] ?
                      $unsigned($unsigned(wire2)) : {(wire108 <<< wire11),
                          $signed(reg95)})),
                  (&wire8)};
              reg115 <= reg96;
              reg116 <= $unsigned(wire1[(3'h5):(1'h1)]);
            end
          if (((!(((reg110 ~^ reg116) ? $unsigned(wire92) : (reg95 <= reg113)) ?
              {reg98[(2'h3):(2'h3)]} : ($unsigned((8'ha5)) ?
                  (wire3 ?
                      reg102 : reg113) : wire100[(3'h5):(2'h3)]))) * {wire10[(4'h8):(1'h1)],
              (reg110[(4'h9):(2'h2)] ^ ((reg96 ? reg104 : wire10) ?
                  $unsigned(wire7) : reg99[(1'h0):(1'h0)]))}))
            begin
              reg117 <= ($signed(reg113) ?
                  $signed($signed(reg98)) : wire105[(4'ha):(3'h7)]);
              reg118 <= $signed(wire1);
              reg119 <= ((8'hba) | wire106[(3'h6):(1'h0)]);
            end
          else
            begin
              reg117 <= ($unsigned(reg97) ?
                  ({(8'ha6), reg103[(5'h10):(4'he)]} ?
                      ((8'h9d) > wire11[(4'h9):(1'h0)]) : (($signed(wire109) ?
                              $signed((8'ha1)) : wire9) ?
                          {(-reg4), (|wire109)} : {((8'hb7) << wire7),
                              (8'ha7)})) : wire3);
              reg118 <= {wire106[(2'h2):(1'h0)],
                  $unsigned({(^$signed(reg102))})};
              reg119 <= $unsigned($unsigned($unsigned($unsigned(wire0))));
            end
        end
      reg120 <= wire101[(3'h4):(2'h2)];
      reg121 <= (^~(~|{$signed((^~wire3)), reg104[(5'h12):(4'he)]}));
    end
endmodule

module module13
#(parameter param89 = ((~^(~&((~^(8'ha7)) ? ((8'hbf) ? (7'h42) : (8'ha1)) : {(8'hae), (8'hbc)}))) ? (8'ha3) : (&{(~^(7'h41))})))
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire65;
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire18,
                 wire19,
                 wire44,
                 wire45,
                 wire46,
                 wire65,
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
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire18 = wire15;
  assign wire19 = ($unsigned((wire15 ~^ ((~&(7'h42)) > ((8'hbd) ?
                      wire15 : wire18)))) ^ $signed((~^(!(wire18 ?
                      wire17 : wire15)))));
  always
    @(posedge clk) begin
      reg20 <= (wire16[(4'ha):(3'h4)] ?
          (wire15 << $signed($unsigned(wire17[(2'h2):(1'h0)]))) : (&(+$unsigned(wire16[(3'h5):(1'h0)]))));
      if (wire18[(1'h1):(1'h0)])
        begin
          if ({(|($signed($signed(wire18)) * wire14[(3'h4):(1'h0)]))})
            begin
              reg21 <= wire16;
              reg22 <= $unsigned(($unsigned(wire18) | (^~($unsigned(wire18) << reg20[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg21 <= wire14[(3'h5):(2'h2)];
              reg22 <= wire19;
              reg23 <= ((wire17 <<< wire17[(3'h6):(1'h1)]) <<< ($signed({((8'hac) ?
                          (8'had) : reg20),
                      (8'hba)}) ?
                  wire14 : {($unsigned(wire17) > (+reg20))}));
              reg24 <= ((~&{($unsigned(reg20) ?
                          (wire15 == (8'ha8)) : (^wire17)),
                      reg20}) ?
                  wire17 : ($signed(reg21) >> (!$signed((|reg23)))));
            end
          reg25 <= $unsigned((8'ha7));
          if ($signed($signed({((wire17 ~^ wire16) ?
                  (wire18 & reg22) : wire19[(2'h3):(1'h1)]),
              {(8'hb1), $signed(wire15)}})))
            begin
              reg26 <= wire14[(3'h4):(2'h2)];
              reg27 <= (~&$signed((~|reg25)));
              reg28 <= {(~^{(~|$unsigned(reg26)), (^~wire14)}),
                  $unsigned((^reg20))};
            end
          else
            begin
              reg26 <= (-$unsigned($signed(((reg25 << wire16) ?
                  wire19 : (wire15 ? reg25 : (8'ha1))))));
              reg27 <= $signed(reg20[(2'h3):(2'h3)]);
              reg28 <= (($signed({$signed((7'h40))}) < ((wire19[(4'h8):(1'h1)] <<< $unsigned(wire19)) - $signed(reg21))) ?
                  reg24[(4'hb):(1'h1)] : $signed($signed(((reg23 >= reg27) ?
                      (-reg21) : wire14[(2'h2):(2'h2)]))));
              reg29 <= (8'hb3);
              reg30 <= ((wire18[(3'h4):(1'h0)] ?
                      ($signed($unsigned(reg20)) ?
                          wire16[(3'h6):(3'h6)] : $signed((^~reg28))) : $unsigned(wire17[(2'h2):(1'h0)])) ?
                  $unsigned((8'hb7)) : ((~^reg21[(1'h0):(1'h0)]) ^~ ($signed($unsigned(wire18)) > $signed(wire18[(2'h2):(1'h1)]))));
            end
          if ((!{(~reg22), wire16[(3'h6):(2'h3)]}))
            begin
              reg31 <= ($unsigned($signed(reg22)) ? wire14 : reg26);
              reg32 <= {reg31,
                  (~$signed(((~|reg30) ?
                      $signed((8'hb8)) : reg31[(1'h1):(1'h0)])))};
              reg33 <= $unsigned($unsigned((^($signed(reg23) ?
                  reg23 : reg29[(4'hc):(3'h4)]))));
              reg34 <= $unsigned(reg24[(3'h6):(3'h4)]);
            end
          else
            begin
              reg31 <= $unsigned($unsigned((8'hb1)));
              reg32 <= (((reg27 ?
                          reg27[(1'h0):(1'h0)] : ({reg26} ~^ $unsigned(reg21))) ?
                      ($unsigned(reg29[(4'hc):(4'ha)]) == $signed(reg26[(2'h2):(1'h0)])) : ((reg30[(4'h8):(1'h1)] ?
                              $unsigned(wire19) : reg27) ?
                          reg26[(4'hf):(4'hb)] : wire18)) ?
                  $signed(wire16) : wire15);
            end
        end
      else
        begin
          if (($unsigned(reg25) ~^ ({reg27[(1'h0):(1'h0)],
              ($signed(reg34) ?
                  wire14 : (reg23 & wire17))} ^~ $signed((^~$signed(reg20))))))
            begin
              reg21 <= wire18;
            end
          else
            begin
              reg21 <= (-(!(8'ha7)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg35 <= (reg33 != wire16[(3'h5):(1'h1)]);
      reg36 <= (~reg25[(3'h5):(3'h4)]);
      reg37 <= $signed(reg29);
      reg38 <= reg27[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg39 <= (|wire15);
      reg40 <= (|{(reg28[(2'h2):(1'h1)] ?
              reg23[(2'h3):(2'h3)] : (!$signed(wire18)))});
      reg41 <= $unsigned(reg40[(4'ha):(3'h7)]);
      reg42 <= $unsigned($signed((^(^reg41))));
      reg43 <= (~^reg22);
    end
  assign wire44 = {{(reg39[(4'hc):(3'h4)] & ($signed(reg38) ?
                              wire14[(3'h4):(1'h0)] : reg31)),
                          (8'ha2)}};
  assign wire45 = wire14[(1'h1):(1'h0)];
  assign wire46 = (^(|(|(~^(~^reg23)))));
  module47 #() modinst66 (.clk(clk), .wire50(reg43), .wire51(wire15), .wire52(reg29), .wire48(reg25), .y(wire65), .wire49(reg20));
  assign wire67 = (|$signed((^((~|reg36) < (&reg26)))));
  assign wire68 = reg24;
  assign wire69 = ((!$signed(reg43)) ? wire45[(2'h3):(1'h1)] : reg29);
  assign wire70 = ((reg35 ?
                      {{(reg21 ? wire68 : reg27)},
                          wire65} : $unsigned($unsigned((reg22 <= reg36)))) & (^wire68[(3'h6):(2'h2)]));
  assign wire71 = $signed(reg22[(2'h2):(1'h0)]);
  assign wire72 = reg34;
  assign wire73 = {$unsigned(wire72[(1'h0):(1'h0)])};
  assign wire74 = $unsigned({(|(8'ha0))});
  always
    @(posedge clk) begin
      reg75 <= ((^wire44) >> wire16);
      if ((|$unsigned((+reg35[(2'h2):(1'h1)]))))
        begin
          if ((~^$signed($unsigned((8'h9c)))))
            begin
              reg76 <= ({$signed((~^{reg40}))} ?
                  wire44 : {{((reg30 ?
                              (8'ha3) : wire72) ~^ (wire74 >>> reg21))},
                      {reg30[(2'h3):(1'h0)]}});
              reg77 <= {{reg76,
                      (reg27 ? (reg36 >> (-reg33)) : (&$unsigned(wire70)))},
                  ($unsigned(wire70[(1'h0):(1'h0)]) ?
                      $signed({(^wire46),
                          $unsigned((8'h9f))}) : (reg23 - ((8'ha6) ?
                          $unsigned(reg38) : wire73[(5'h12):(3'h6)])))};
              reg78 <= wire73[(3'h5):(2'h2)];
              reg79 <= $unsigned($signed($signed((~&{reg37, reg41}))));
              reg80 <= $signed(wire17[(2'h2):(1'h0)]);
            end
          else
            begin
              reg76 <= wire46[(5'h10):(3'h7)];
              reg77 <= (reg39[(3'h7):(1'h0)] ?
                  (reg23[(4'h9):(4'h9)] ? reg20 : wire74) : (($unsigned({reg41,
                      wire70}) - (reg21 >> {reg22, wire15})) >> wire67));
              reg78 <= wire46[(5'h12):(3'h7)];
              reg79 <= $unsigned((^(~&reg78)));
            end
          reg81 <= $unsigned($unsigned($signed($unsigned((wire69 <<< reg31)))));
        end
      else
        begin
          reg76 <= $unsigned((wire71 >> wire71));
          reg77 <= $signed({$signed((wire70 ?
                  (reg81 << wire14) : wire74[(3'h6):(2'h3)]))});
          if (($unsigned($signed($unsigned({reg26}))) << $unsigned(reg32)))
            begin
              reg78 <= ($signed(wire16[(3'h6):(1'h0)]) ?
                  reg22[(4'hd):(2'h2)] : {(wire16[(1'h0):(1'h0)] < $unsigned($signed(reg76))),
                      (^($unsigned(wire18) ?
                          (wire71 <<< reg36) : $signed((8'hb4))))});
              reg79 <= {((($signed(reg41) ? (+reg42) : {(8'ha4), wire70}) ?
                      wire68[(3'h5):(2'h2)] : ((reg27 >= (8'hb7)) ?
                          $unsigned(reg79) : $unsigned(reg22))) == wire74),
                  reg77[(2'h3):(2'h3)]};
              reg80 <= {{($unsigned(reg41[(4'h9):(1'h1)]) ?
                          $unsigned(reg81) : ($signed(reg21) - {reg28}))},
                  (((wire72[(3'h4):(1'h1)] + $unsigned(wire45)) ?
                      ((wire72 && reg22) & $signed(reg77)) : ($unsigned(reg29) ?
                          (8'hb5) : reg34[(5'h13):(3'h4)])) <<< ({(reg42 ?
                          wire45 : reg23)} >>> $unsigned(wire17[(1'h1):(1'h0)])))};
              reg81 <= reg27[(1'h0):(1'h0)];
            end
          else
            begin
              reg78 <= reg32;
              reg79 <= {$unsigned({reg77[(1'h0):(1'h0)],
                      ($signed((8'ha8)) >>> reg43[(3'h5):(2'h3)])})};
              reg80 <= $unsigned(($unsigned((&$unsigned((8'hb2)))) ?
                  (8'hac) : {(-reg34[(3'h4):(2'h3)])}));
              reg81 <= {(-$signed(reg29[(4'hf):(3'h7)]))};
            end
          reg82 <= (~^$signed(reg32));
          if ({(+$unsigned($signed((reg24 != reg26)))), reg79[(1'h1):(1'h0)]})
            begin
              reg83 <= wire46[(3'h7):(2'h3)];
              reg84 <= {(~^wire44[(3'h5):(3'h4)])};
              reg85 <= (8'hb5);
              reg86 <= ((reg37[(2'h2):(2'h2)] ^~ $signed((8'ha4))) ?
                  $signed(((reg38 >>> (~|wire74)) <= ($unsigned((8'hb3)) >= $unsigned(wire67)))) : (&reg37));
            end
          else
            begin
              reg83 <= ($signed(((8'hbb) ?
                      ({reg35,
                          (8'hbf)} & $signed(reg22)) : ($signed(reg30) || reg34))) ?
                  $unsigned($signed((wire70[(4'h8):(3'h4)] ?
                      (reg31 < reg79) : $signed(reg37)))) : (wire16[(3'h4):(1'h0)] ^~ {(7'h41)}));
              reg84 <= (reg37[(1'h1):(1'h0)] ?
                  $signed(reg33[(3'h4):(1'h0)]) : $unsigned(reg39[(5'h13):(2'h3)]));
            end
        end
    end
  assign wire87 = (~wire17);
  assign wire88 = (reg29 ?
                      reg81 : ((((reg30 ?
                          reg29 : reg32) > {wire17}) * $unsigned((wire69 ?
                          wire17 : reg80))) >> (|$signed(reg36))));
endmodule

module module47
#(parameter param64 = ((((((7'h44) ? (8'hbf) : (8'ha9)) ? ((7'h41) & (8'hb0)) : (7'h42)) ? (^(+(7'h43))) : (8'h9d)) - {(((8'ha1) <<< (8'ha8)) != (~&(8'ha5))), (|{(8'hae), (8'haf)})}) ^~ ((((+(8'ha1)) << (^~(8'haf))) ? ((|(8'ha6)) ? (~(8'had)) : (~&(8'hb3))) : ((~^(8'hb2)) ? (8'ha9) : (8'ha8))) - (({(8'hbf)} >= ((8'hbf) <= (8'hae))) ? ((~^(8'hae)) ? ((8'haa) ? (8'hb0) : (8'ha0)) : ((8'hbb) ? (8'hb7) : (8'hb3))) : (^((8'haf) <= (8'hb6)))))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire52;
  input wire signed [(3'h5):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire [(5'h14):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire53;
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire53,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = $unsigned($signed(wire48[(2'h3):(2'h2)]));
  always
    @(posedge clk) begin
      reg54 <= ($signed(wire50) + $signed($signed($signed({wire52}))));
      reg55 <= (($unsigned(((wire51 ? (8'hb2) : wire51) ?
          $unsigned(reg54) : $unsigned(wire50))) >>> {wire49}) * $signed((|$unsigned($unsigned(wire49)))));
      if ($unsigned(($signed(($unsigned(reg54) != (wire49 ?
          wire50 : wire50))) > (8'hb2))))
        begin
          reg56 <= (~&{wire48,
              {$unsigned($unsigned(reg55)),
                  $signed((wire51 ? wire48 : reg54))}});
        end
      else
        begin
          reg56 <= {(wire51 ?
                  {wire53,
                      ($unsigned((8'h9c)) + ((8'hbb) + wire53))} : {(wire50 ?
                          (~^wire53) : $signed(wire52))}),
              {$signed((+(-wire49))),
                  (reg56[(2'h2):(2'h2)] ? wire48 : (8'ha5))}};
          reg57 <= ($unsigned(($signed($signed(wire53)) <= (8'ha3))) >> wire49);
        end
      reg58 <= (wire53[(4'h8):(2'h3)] << $signed((|reg54)));
      reg59 <= {((({wire48} ?
                  reg54[(3'h4):(1'h1)] : wire52) ~^ $unsigned($unsigned(wire48))) ?
              wire49 : $unsigned($signed($signed(wire50)))),
          (wire50[(2'h2):(2'h2)] ?
              {($signed((8'had)) + ((8'hb9) ? (8'hbd) : wire51)),
                  reg57} : wire51[(3'h5):(2'h2)])};
    end
  assign wire60 = ((!(wire51 ?
                          ((!wire49) ?
                              (reg56 << wire53) : (^~wire51)) : (|reg58[(1'h0):(1'h0)]))) ?
                      $unsigned(wire48[(2'h2):(2'h2)]) : (+wire52));
  assign wire61 = $signed(($unsigned(wire50) - {((wire50 ? wire60 : reg55) ?
                          reg55[(4'h8):(2'h2)] : reg55[(4'hc):(3'h7)])}));
  assign wire62 = (^(~^reg56));
  assign wire63 = wire52[(1'h1):(1'h0)];
endmodule
