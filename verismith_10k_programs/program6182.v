module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire141;
  wire signed [(4'hc):(1'h0)] wire140;
  wire signed [(2'h2):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire12,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = (-$signed(wire1));
  assign wire5 = wire3;
  assign wire6 = (wire2[(2'h2):(1'h1)] ?
                     ({($signed(wire4) ?
                             {wire4} : (wire1 ?
                                 wire3 : wire0))} >>> {((|wire3) != (wire1 * wire0))}) : $unsigned($unsigned((~&(wire2 ?
                         wire1 : wire3)))));
  assign wire7 = $unsigned({(wire1[(4'hb):(2'h2)] <<< ((~wire5) ?
                         wire1[(4'he):(4'hb)] : wire3[(4'hd):(1'h0)])),
                     (~|$unsigned($unsigned(wire4)))});
  always
    @(posedge clk) begin
      reg8 <= $signed(wire2);
      if (($unsigned($unsigned(reg8[(5'h11):(4'he)])) & $signed(wire6)))
        begin
          reg9 <= $signed($unsigned($unsigned($unsigned($signed(wire1)))));
          reg10 <= (~&(|(&{$signed(wire2)})));
          reg11 <= ($unsigned($signed(((8'ha5) ?
              (wire0 || wire6) : wire0))) * (^{wire2}));
        end
      else
        begin
          reg9 <= $unsigned((8'ha8));
          reg10 <= $signed({reg10});
          reg11 <= ((wire2 ?
                  ((8'hb3) * wire3[(2'h3):(2'h3)]) : wire7[(1'h0):(1'h0)]) ?
              reg9 : $unsigned((~|$unsigned((reg8 && wire2)))));
        end
    end
  assign wire12 = $unsigned(((wire2[(1'h0):(1'h0)] ^~ ((reg8 << wire6) ?
                      (wire2 ? wire0 : wire4) : {reg9, (7'h41)})) >> (-wire7)));
  module13 #() modinst138 (.clk(clk), .wire15(reg9), .wire14(wire5), .wire18(wire6), .wire17(wire2), .y(wire137), .wire16(wire12));
  assign wire139 = wire6;
  assign wire140 = reg11;
  assign wire141 = wire6;
endmodule

module module13
#(parameter param135 = ({(((8'ha8) ~^ ((8'h9e) ^~ (8'hac))) < (-(~|(8'hb7)))), {(~(~&(8'hb8)))}} ? {(~((~|(8'hbf)) ? ((8'haf) ? (8'hb2) : (8'hb5)) : ((8'h9e) ? (8'hba) : (8'ha4))))} : (~|((((8'hba) >= (8'ha6)) < ((8'ha9) <<< (8'haa))) >= (|{(8'hb8)})))), 
parameter param136 = (((((8'hb1) ? param135 : param135) && param135) | ({{param135}, param135} | (-{param135}))) ? {param135} : param135))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(5'h14):(1'h0)] wire118;
  wire signed [(5'h14):(1'h0)] wire117;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire70;
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  assign y = {wire134,
                 wire118,
                 wire117,
                 wire115,
                 wire19,
                 wire20,
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
                 wire70,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
                 (1'h0)};
  assign wire19 = (^$signed((((~^wire16) + (8'ha2)) ?
                      {$signed(wire14)} : (wire14[(1'h0):(1'h0)] >>> {(8'h9c),
                          wire17}))));
  assign wire20 = $unsigned(({{{wire17, (8'hbe)}, (^wire18)}} ?
                      $signed((((8'hbe) ? wire15 : wire15) * {wire16,
                          wire17})) : {($unsigned(wire16) & {(8'hb1),
                              (8'ha1)})}));
  assign wire21 = (($unsigned(((~^wire15) ?
                          (~wire17) : wire19[(4'hc):(4'h9)])) ?
                      (~|(~&wire17)) : wire19) | wire16);
  assign wire22 = {wire15[(2'h2):(2'h2)], wire15};
  assign wire23 = {{$signed($signed((wire17 ? wire19 : wire16))),
                          (|$signed((wire19 | wire17)))}};
  assign wire24 = wire14[(2'h3):(1'h1)];
  assign wire25 = $unsigned(wire20);
  assign wire26 = wire21;
  assign wire27 = (~|wire21[(2'h2):(2'h2)]);
  assign wire28 = wire14[(2'h2):(2'h2)];
  assign wire29 = (&((wire19 ?
                      (~((8'ha3) ? wire20 : wire26)) : wire18) - wire14));
  assign wire30 = $unsigned(wire22[(1'h0):(1'h0)]);
  assign wire31 = $signed(wire26);
  assign wire32 = (wire19[(3'h4):(2'h3)] ? wire24[(4'h8):(1'h0)] : wire24);
  module33 #() modinst71 (wire70, clk, wire27, wire28, wire24, wire32, wire14);
  module72 #() modinst116 (wire115, clk, wire30, wire22, wire23, wire32);
  assign wire117 = $signed($unsigned(((8'h9d) ~^ {{(8'hb6), wire17}})));
  assign wire118 = (^~wire26);
  always
    @(posedge clk) begin
      if ($signed((-$signed((wire20 ? (wire25 >>> wire32) : (^(8'haf)))))))
        begin
          reg119 <= wire21[(2'h3):(1'h0)];
          if (wire21)
            begin
              reg120 <= (wire29[(3'h7):(2'h3)] ?
                  wire118 : (|$unsigned(wire27)));
            end
          else
            begin
              reg120 <= $signed((wire28[(3'h4):(2'h2)] ?
                  (wire22 >>> ($unsigned((8'ha7)) ?
                      wire16[(4'he):(2'h2)] : $unsigned(wire19))) : $signed(((wire20 ?
                      wire17 : wire19) * $unsigned(wire28)))));
              reg121 <= (wire27 ? wire16[(3'h4):(2'h3)] : wire118);
              reg122 <= (($unsigned(((wire115 ? wire19 : reg120) ?
                      $unsigned(wire17) : {wire14, wire14})) >> {{((8'hb2) ?
                              wire25 : wire14)},
                      ((~wire23) <= {wire19})}) ?
                  wire25 : $signed(wire27[(1'h1):(1'h1)]));
              reg123 <= (~&{{wire21[(3'h6):(3'h6)]}});
            end
          reg124 <= ({((8'hb1) ?
                  wire16[(4'h8):(2'h2)] : (~&(reg122 ? wire20 : (8'hb5)))),
              $signed($unsigned($unsigned(wire15)))} ~^ wire25);
        end
      else
        begin
          if (((~|$unsigned(($unsigned((8'hb0)) ?
                  (wire32 ? wire28 : wire16) : wire21))) ?
              wire29 : $signed($unsigned($unsigned($unsigned(reg120))))))
            begin
              reg119 <= $unsigned((($unsigned((+(8'haf))) ?
                      (!$unsigned(wire20)) : ((wire28 * wire29) * (^(8'hbf)))) ?
                  $signed(wire22[(1'h0):(1'h0)]) : $signed(wire28[(4'hc):(4'hc)])));
              reg120 <= ((&(~wire26)) ^~ $signed((((wire28 <= (8'had)) ?
                  wire17 : {wire15, wire20}) * $signed(wire21))));
            end
          else
            begin
              reg119 <= $unsigned(((((wire29 ?
                      (8'hb4) : wire17) & (wire19 & wire21)) ?
                  $unsigned(((8'hb1) ? wire14 : reg121)) : $unsigned((wire27 ?
                      reg124 : wire14))) >>> (~((^~(8'hbe)) ?
                  (wire23 ? wire15 : wire25) : wire26[(3'h6):(3'h5)]))));
              reg120 <= $signed((reg121 | reg119[(3'h5):(3'h5)]));
              reg121 <= reg121[(2'h2):(2'h2)];
            end
          reg122 <= wire31[(1'h0):(1'h0)];
          reg123 <= $signed((8'h9d));
        end
      reg125 <= wire30[(2'h3):(1'h0)];
      reg126 <= (+wire16);
      reg127 <= wire24[(4'h8):(2'h3)];
      if (wire115)
        begin
          if (({$signed($signed({reg126, (8'ha5)})), wire118[(4'hc):(4'h8)]} ?
              (((((8'ha9) ? wire28 : wire24) ?
                      {wire24} : reg120[(3'h5):(1'h0)]) ?
                  {{wire18}} : $unsigned($unsigned(wire32))) | ($unsigned((reg125 ^ wire28)) >>> (wire25 <<< $signed(wire26)))) : $unsigned(({wire28,
                  wire31} - $signed((~^wire15))))))
            begin
              reg128 <= ((!(~|$unsigned($unsigned((8'ha5))))) << $signed((reg121[(1'h0):(1'h0)] || wire15)));
              reg129 <= $signed(reg121);
              reg130 <= $signed(wire14);
              reg131 <= ($signed(wire16[(4'hb):(2'h3)]) ?
                  {({$signed(reg124)} ?
                          (-(&reg124)) : ((wire28 ? wire29 : reg126) ?
                              $signed(wire30) : (^~reg119)))} : ({((wire28 ?
                              (8'hb5) : (7'h41)) ?
                          $unsigned(wire16) : (reg126 == wire20)),
                      ((&wire117) ?
                          reg123[(4'h9):(2'h2)] : (|wire27))} - $signed((^~$signed(reg119)))));
              reg132 <= {(((-(~&wire32)) * wire117[(4'h9):(1'h0)]) ?
                      ($signed((wire29 ? (8'hbf) : wire22)) ?
                          $signed($unsigned(wire118)) : reg121[(2'h3):(2'h2)]) : (~&(reg120[(1'h1):(1'h0)] ?
                          {reg119} : wire31))),
                  (+{wire18, (&(wire27 ? wire16 : reg128))})};
            end
          else
            begin
              reg128 <= $signed(wire16);
              reg129 <= $signed((!$unsigned(wire117)));
              reg130 <= (wire26 && {(+wire23[(3'h6):(2'h2)])});
            end
          reg133 <= (&((^$unsigned({(8'hab), (8'ha3)})) ?
              {$signed(reg121[(1'h0):(1'h0)])} : ((8'ha5) >= reg123)));
        end
      else
        begin
          reg128 <= wire70;
          reg129 <= (wire31 ? reg119 : $unsigned((+{reg133})));
          reg130 <= (($signed(reg128[(1'h0):(1'h0)]) >> wire32[(2'h3):(1'h0)]) ?
              wire20[(2'h3):(2'h3)] : $signed($signed((reg125[(1'h1):(1'h1)] + {wire18}))));
          reg131 <= wire14;
        end
    end
  assign wire134 = wire15;
endmodule

module module72
#(parameter param113 = ((~&((((8'hbc) ? (8'ha7) : (8'h9c)) ? ((8'hb0) + (8'hb6)) : (-(8'hbb))) ^~ {((8'ha2) >= (8'hba))})) ? ((~&({(8'hab)} >>> (8'ha5))) ? (8'hab) : (~&{(~|(8'hb3)), (~^(8'h9f))})) : (((&(^(8'hab))) ? (((8'hb7) ? (7'h40) : (8'h9d)) ? {(8'hbc), (8'hbb)} : {(8'hb6), (8'ha4)}) : (((8'hb5) ? (8'hb4) : (8'haa)) >= {(7'h42)})) >> {(((8'ha0) ? (8'hb9) : (8'ha4)) && (~^(8'h9e)))})), 
parameter param114 = (({{{param113}}} ? param113 : ((param113 ? (param113 ? param113 : param113) : (param113 ? param113 : param113)) | {param113})) ? (({((7'h44) == param113), (|param113)} ? (((8'h9e) > param113) ~^ param113) : (8'hae)) ? {({(8'hb2)} <<< (param113 & param113))} : param113) : param113))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire76;
  input wire [(3'h7):(1'h0)] wire75;
  input wire signed [(2'h2):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire105;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(2'h3):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire106,
                 wire105,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire79,
                 wire78,
                 wire77,
                 reg109,
                 reg108,
                 reg107,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
  assign wire77 = (^{wire75[(1'h0):(1'h0)]});
  assign wire78 = (wire74 ? $signed({wire77[(1'h0):(1'h0)]}) : (8'hae));
  assign wire79 = wire75;
  always
    @(posedge clk) begin
      reg80 <= $signed((~|(~&(((8'hbb) ? wire73 : wire76) ?
          wire78[(4'ha):(3'h5)] : wire77[(1'h0):(1'h0)]))));
      reg81 <= (^~wire75[(2'h2):(2'h2)]);
      if (wire73[(4'h8):(1'h1)])
        begin
          reg82 <= $signed(wire74[(1'h0):(1'h0)]);
          reg83 <= wire73[(3'h5):(3'h4)];
          reg84 <= reg82[(2'h2):(2'h2)];
          reg85 <= (-((~&$unsigned((reg81 ?
              wire79 : wire79))) == $unsigned(((~wire74) ?
              (wire73 - reg84) : $unsigned((8'hb2))))));
          reg86 <= $unsigned(reg85[(4'he):(4'hb)]);
        end
      else
        begin
          reg82 <= $unsigned((reg86[(2'h2):(1'h1)] ?
              {(-reg82),
                  reg81[(2'h3):(2'h2)]} : $unsigned($unsigned($unsigned(reg81)))));
          reg83 <= reg81;
          reg84 <= (^~(($signed($signed(reg84)) ?
                  (~|((8'hae) & (8'hb9))) : reg84) ?
              ((^$signed(reg83)) ?
                  reg84 : $unsigned((reg80 ?
                      reg83 : reg86))) : ($unsigned((wire78 ?
                  (8'hb1) : reg84)) > (~&reg80))));
          if ({(wire77 <<< ($unsigned((reg83 ?
                  reg83 : (8'hb4))) - {$unsigned(wire74)}))})
            begin
              reg85 <= ($unsigned(reg80) | (({$unsigned(reg85)} - $signed($unsigned(reg82))) - ((reg84[(3'h7):(1'h0)] ?
                  $signed(wire79) : wire78) > (wire78[(2'h2):(1'h0)] ?
                  ((8'hb1) ? wire76 : wire74) : wire76[(2'h3):(1'h1)]))));
              reg86 <= reg80[(4'hb):(3'h6)];
              reg87 <= ($unsigned((reg83 ?
                  reg81 : ((~reg85) ?
                      {wire76} : ((8'hb6) + reg85)))) >>> $unsigned(reg84[(2'h3):(2'h3)]));
            end
          else
            begin
              reg85 <= $signed(reg87[(4'h8):(3'h6)]);
              reg86 <= (!$unsigned(wire75));
              reg87 <= $unsigned(reg81[(2'h2):(1'h1)]);
            end
          reg88 <= (8'ha1);
        end
      if (wire74[(1'h1):(1'h1)])
        begin
          reg89 <= wire75;
          reg90 <= (~&reg82);
          reg91 <= reg87[(3'h6):(3'h6)];
          reg92 <= ((((~&(8'hb7)) ?
                  reg83 : $unsigned(wire79[(1'h1):(1'h1)])) > {reg83[(4'hb):(3'h5)],
                  ($signed(reg86) ? $signed(reg81) : $signed(reg81))}) ?
              ((({wire78} ? (&wire76) : {reg81}) && wire78) ?
                  wire78[(4'ha):(3'h5)] : reg89) : ((&(~&(~reg91))) >= $signed(wire75[(2'h2):(1'h0)])));
        end
      else
        begin
          reg89 <= (reg83[(1'h1):(1'h0)] & (~^((|(reg86 ?
              wire77 : (8'hb0))) * wire74)));
        end
      reg93 <= ($unsigned($unsigned($unsigned((^~reg81)))) > ($signed($signed($unsigned(reg91))) >= $unsigned(reg80[(4'h8):(3'h5)])));
    end
  assign wire94 = $signed((~|{(!(wire73 | reg89))}));
  assign wire95 = wire76[(3'h4):(1'h0)];
  assign wire96 = $unsigned((reg83[(3'h7):(3'h4)] >= (({(8'hbb),
                          reg80} & {reg91, wire94}) ?
                      {reg90[(4'he):(3'h7)]} : $unsigned($unsigned(reg86)))));
  assign wire97 = $signed(((wire78[(3'h5):(2'h3)] ?
                      $signed((~|reg85)) : $unsigned((wire78 >> (7'h41)))) && (8'hbb)));
  assign wire98 = $signed($signed(wire96[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if ((reg84[(3'h4):(2'h2)] ?
          $unsigned(({reg87[(3'h6):(2'h3)]} < {wire79})) : $unsigned((wire78[(3'h4):(3'h4)] ?
              ((reg80 ? wire78 : wire94) ?
                  (reg86 >>> reg89) : (wire76 ? reg86 : reg83)) : (reg92 ?
                  $signed(wire77) : $signed(reg90))))))
        begin
          if (((+wire76[(2'h2):(1'h1)]) & wire75[(3'h5):(2'h3)]))
            begin
              reg99 <= (((^((reg82 ? (8'h9f) : wire73) ?
                          {reg91} : $signed(wire73))) ?
                      (8'hb1) : (~$signed(reg83))) ?
                  $signed($unsigned(((8'hb6) == {wire95,
                      wire95}))) : (((wire74 ?
                      wire97[(1'h0):(1'h0)] : reg92) - ((+(8'hb8)) == $signed(wire75))) ^ wire98));
              reg100 <= (((($signed(reg87) & (+wire94)) << ((reg89 ?
                          wire76 : reg87) ?
                      wire97 : $unsigned(wire74))) > (!$unsigned($unsigned(wire96)))) ?
                  (wire78[(4'hb):(2'h2)] > {$signed((~^(8'hb2)))}) : {(~&reg82[(2'h2):(1'h0)]),
                      wire98[(1'h0):(1'h0)]});
              reg101 <= $unsigned(reg84[(3'h7):(2'h2)]);
            end
          else
            begin
              reg99 <= $unsigned($unsigned(reg85));
              reg100 <= $signed(reg91[(1'h1):(1'h1)]);
            end
          reg102 <= (~&reg87);
          if ((({reg84[(3'h6):(3'h5)]} ?
                  {$signed((8'hac)), (+{reg86, reg99})} : wire98) ?
              wire79 : (($signed($signed((7'h44))) ?
                  {(reg92 ?
                          reg80 : wire75)} : wire77[(2'h2):(2'h2)]) <<< (~&$unsigned((~wire77))))))
            begin
              reg103 <= wire74[(2'h2):(1'h1)];
              reg104 <= $unsigned(wire76[(1'h0):(1'h0)]);
            end
          else
            begin
              reg103 <= (-$unsigned($signed(($signed(reg85) ?
                  reg82 : reg80[(4'hb):(3'h6)]))));
              reg104 <= (~wire76[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg99 <= reg82[(1'h0):(1'h0)];
          reg100 <= wire78[(4'hd):(4'hc)];
        end
    end
  assign wire105 = $signed($signed(wire77));
  assign wire106 = ($signed(reg103[(2'h2):(1'h0)]) * $unsigned(($signed((~|reg91)) ?
                       ($unsigned(reg99) ?
                           (8'hb3) : (wire75 << (8'hae))) : $unsigned($signed(wire95)))));
  always
    @(posedge clk) begin
      reg107 <= wire78;
      reg108 <= reg93;
      reg109 <= ($unsigned(((8'haa) ?
          wire98 : {$signed(reg93),
              reg107})) >> $signed((+wire96[(4'h9):(3'h6)])));
    end
  assign wire110 = $signed(reg104[(1'h0):(1'h0)]);
  assign wire111 = $unsigned(((reg81 || $unsigned((wire105 ? reg99 : reg100))) ?
                       (!wire76[(2'h2):(1'h1)]) : $signed(reg82)));
  assign wire112 = (($unsigned((!$unsigned(reg85))) ?
                           (((reg102 ^~ (8'ha6)) >> wire77[(1'h1):(1'h0)]) | reg108[(1'h0):(1'h0)]) : (!reg85)) ?
                       wire98 : (~reg93));
endmodule

module module33
#(parameter param69 = {(&(|((^(8'ha4)) != (~^(8'hb0)))))})
(y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(3'h6):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire39;
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire39,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire39 = ((~&(({wire35, wire37} || $signed(wire36)) ?
                      ((wire38 ? (8'ha3) : wire37) ?
                          wire35[(5'h12):(4'hc)] : (wire35 ?
                              wire37 : wire38)) : wire34[(2'h2):(1'h1)])) > ((($signed(wire35) ?
                          (^wire36) : ((8'h9f) << wire36)) ?
                      $unsigned(wire37[(4'h9):(3'h4)]) : wire34[(3'h4):(2'h2)]) * wire38));
  always
    @(posedge clk) begin
      reg40 <= (wire35[(4'hd):(2'h2)] << wire35[(2'h2):(1'h0)]);
      reg41 <= {$signed($signed(wire34))};
    end
  assign wire42 = (-$unsigned(reg40));
  assign wire43 = $signed(reg40[(3'h6):(2'h3)]);
  assign wire44 = ((+{((reg40 ? (8'h9c) : (8'ha2)) ?
                              (wire36 * wire42) : (8'ha2)),
                          wire37}) ?
                      ($unsigned(((+wire42) ? reg41 : $signed(wire35))) ?
                          $unsigned(((-wire36) ^ {reg41,
                              wire34})) : (&$signed((&wire34)))) : {$signed($unsigned(((8'hb6) | wire42))),
                          (~^((wire37 >> reg41) - (reg40 < wire36)))});
  assign wire45 = (|wire42);
  assign wire46 = wire44;
  assign wire47 = $signed($signed($unsigned($signed((+reg41)))));
  assign wire48 = $unsigned(wire38);
  assign wire49 = wire34[(3'h5):(1'h1)];
  assign wire50 = ($unsigned($signed($signed($unsigned((7'h41))))) & reg40[(1'h1):(1'h1)]);
  assign wire51 = ($unsigned(wire42[(4'hf):(4'ha)]) ?
                      wire37 : $unsigned($signed(($unsigned((8'ha6)) != (wire48 ~^ (8'had))))));
  assign wire52 = $signed($signed(((-(wire48 || wire49)) > wire51[(3'h6):(2'h2)])));
  assign wire53 = $unsigned((wire50 ?
                      $signed(((wire47 ?
                          wire51 : wire42) >> wire46)) : ((wire45 & (8'hb4)) ?
                          $unsigned((wire45 == (8'ha2))) : reg40)));
  assign wire54 = wire53;
  assign wire55 = {(wire52[(1'h1):(1'h0)] ~^ ((wire44[(1'h1):(1'h0)] ?
                              wire48 : wire39) ?
                          (&(wire48 && wire47)) : wire38[(2'h3):(1'h0)])),
                      {{wire46, $unsigned(wire53[(1'h1):(1'h0)])}}};
  assign wire56 = $signed(wire53[(3'h6):(3'h6)]);
  assign wire57 = wire36;
  assign wire58 = ($unsigned((+wire49[(3'h5):(2'h2)])) ?
                      (|$signed(wire45)) : $signed((^~((&wire51) ?
                          $unsigned(wire35) : $signed(wire43)))));
  assign wire59 = ($signed(wire39) - wire49);
  always
    @(posedge clk) begin
      if ((wire52 ^ (wire51 ? (&(|{wire34, wire58})) : wire54[(1'h1):(1'h1)])))
        begin
          reg60 <= $unsigned(wire46[(1'h1):(1'h1)]);
        end
      else
        begin
          if (((reg60 != (~|$unsigned(wire43[(5'h10):(3'h6)]))) && wire51))
            begin
              reg60 <= (($unsigned(wire38[(3'h4):(2'h3)]) ?
                  {wire34[(4'hd):(1'h1)], $signed((^reg41))} : (((wire55 ?
                              (8'ha4) : wire51) ?
                          (wire58 ? wire34 : wire46) : $unsigned((8'ha4))) ?
                      $signed((wire45 >> (8'hb9))) : $unsigned({wire34,
                          wire58}))) ^~ wire43[(1'h0):(1'h0)]);
              reg61 <= $unsigned(wire55[(3'h6):(3'h4)]);
            end
          else
            begin
              reg60 <= (wire43 ?
                  (-(~^((~&wire58) ~^ ((8'hbf) ?
                      wire49 : wire50)))) : $signed(wire42));
            end
          reg62 <= $unsigned((~($signed(wire54) ?
              wire57 : ((-(8'hbe)) & wire36))));
          reg63 <= $unsigned({($signed($unsigned(wire39)) != (8'hb1))});
          reg64 <= $unsigned($signed(($unsigned($unsigned((8'hac))) << ($unsigned(wire36) ?
              (wire36 <<< wire59) : (!wire57)))));
        end
      reg65 <= ({$unsigned(reg64),
          (!((~&wire43) + wire38))} <= ($unsigned(($unsigned(wire55) ?
              $unsigned(reg60) : (reg61 ? reg62 : wire58))) ?
          reg62 : $signed($signed($signed(reg61)))));
      reg66 <= wire44[(3'h6):(2'h2)];
    end
  assign wire67 = wire54[(1'h1):(1'h1)];
  assign wire68 = reg60[(3'h6):(2'h2)];
endmodule
