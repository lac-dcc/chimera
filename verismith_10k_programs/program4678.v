module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire119;
  wire signed [(2'h2):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'h9):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire87;
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 wire89,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire87,
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
                 reg96,
                 reg91,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire3);
      if (wire0[(2'h2):(2'h2)])
        begin
          reg6 <= $unsigned(wire3[(3'h4):(2'h3)]);
          if (($unsigned((^~(-$signed(wire1)))) != (($signed((wire2 ?
                      wire0 : reg5)) ?
                  reg5[(5'h12):(4'hd)] : (wire4 ? {wire3} : $unsigned(wire0))) ?
              (reg5 ?
                  $unsigned($unsigned(reg5)) : (|{wire3})) : reg5[(5'h11):(3'h4)])))
            begin
              reg7 <= $unsigned((($signed((-reg5)) < ((wire4 ?
                      wire0 : wire2) | {wire1, wire4})) ?
                  (8'hb6) : (&$unsigned((wire1 ^ wire0)))));
              reg8 <= (reg6[(1'h1):(1'h1)] ?
                  (~&{{reg6[(3'h4):(2'h2)], $unsigned(reg7)},
                      wire3[(2'h3):(2'h2)]}) : $signed(reg5[(1'h1):(1'h1)]));
            end
          else
            begin
              reg7 <= (+{wire4[(4'hc):(2'h2)],
                  (wire0[(2'h2):(1'h0)] || $signed((reg8 ? wire3 : reg6)))});
              reg8 <= $signed((^{wire0}));
              reg9 <= wire3[(4'hd):(2'h3)];
              reg10 <= $signed(reg8);
              reg11 <= (8'ha1);
            end
          reg12 <= (((~|$unsigned(reg8)) ?
              $signed((~wire0[(1'h1):(1'h0)])) : {$signed($signed(reg9))}) * (reg11[(1'h1):(1'h0)] <<< (({reg6} | $signed(reg7)) ^ $unsigned((wire3 ?
              reg9 : reg10)))));
          reg13 <= $unsigned($signed(wire0));
        end
      else
        begin
          reg6 <= reg10;
          reg7 <= reg6;
          reg8 <= {reg13[(4'ha):(3'h5)], (~^(!reg9))};
          reg9 <= $unsigned(reg13[(1'h0):(1'h0)]);
        end
      reg14 <= $unsigned(wire2[(1'h1):(1'h1)]);
    end
  assign wire15 = wire2;
  assign wire16 = reg7;
  assign wire17 = $signed(reg6[(1'h0):(1'h0)]);
  assign wire18 = wire0[(4'h9):(3'h4)];
  assign wire19 = reg6[(1'h1):(1'h1)];
  assign wire20 = {wire0[(3'h7):(3'h4)]};
  assign wire21 = (wire16[(1'h1):(1'h0)] <= wire18);
  assign wire22 = reg13;
  module23 #() modinst88 (wire87, clk, wire22, wire0, wire15, reg8, reg14);
  assign wire89 = (reg10 != (wire16[(1'h0):(1'h0)] >= (~^(|(wire17 ?
                      (8'h9f) : reg11)))));
  assign wire90 = (+reg14);
  always
    @(posedge clk) begin
      reg91 <= wire15;
    end
  assign wire92 = (wire20[(4'he):(4'h9)] ?
                      ($unsigned($signed((reg5 ? wire90 : reg7))) ?
                          ({wire1, wire89} + {$signed(reg8),
                              $unsigned(wire90)}) : (^reg11[(2'h2):(1'h0)])) : $unsigned(($signed(wire16[(1'h1):(1'h1)]) <<< $unsigned((wire20 & reg5)))));
  assign wire93 = ($unsigned(wire18[(3'h5):(1'h0)]) <= (($signed(wire18[(4'he):(4'hc)]) ?
                      (~^$signed(wire0)) : $unsigned(wire2[(2'h2):(1'h0)])) * (+(+{reg13}))));
  assign wire94 = {reg6[(3'h5):(1'h0)]};
  assign wire95 = ((reg14[(5'h13):(3'h5)] ?
                      (|$unsigned({wire15})) : $signed(((!wire15) ?
                          (wire21 <= reg8) : {wire92}))) | (^reg13[(4'ha):(2'h2)]));
  always
    @(posedge clk) begin
      reg96 <= (+$signed(wire95[(1'h0):(1'h0)]));
      reg97 <= ((wire1 * $signed($signed(wire17[(2'h2):(1'h1)]))) == reg5);
      if ((^wire17[(3'h7):(2'h2)]))
        begin
          reg98 <= (-{(wire15 <<< wire2)});
          reg99 <= wire19[(4'ha):(1'h1)];
          reg100 <= (|(wire22[(1'h0):(1'h0)] ?
              {(+(&reg12)), wire0} : (&wire18[(5'h10):(3'h7)])));
        end
      else
        begin
          if ((~wire3[(4'h9):(3'h6)]))
            begin
              reg98 <= (reg13[(4'hc):(2'h2)] >>> (reg97[(2'h3):(1'h1)] & {{(wire95 != wire92),
                      wire22[(3'h5):(1'h1)]}}));
              reg99 <= ($signed({(|(reg14 ?
                      reg10 : wire1))}) != $signed((reg96[(1'h1):(1'h0)] ?
                  reg14[(4'h9):(3'h5)] : {$unsigned(reg12),
                      wire89[(2'h3):(1'h1)]})));
              reg100 <= (8'hb9);
              reg101 <= $unsigned({$unsigned(wire20[(3'h7):(3'h7)])});
              reg102 <= {$signed((+(reg14 ?
                      (reg9 * wire87) : $signed(reg91))))};
            end
          else
            begin
              reg98 <= $signed((~^{(^~wire93[(1'h1):(1'h1)]),
                  ((+(8'hac)) ?
                      (reg5 ? wire94 : (8'hb0)) : (reg14 <= (7'h42)))}));
              reg99 <= reg14;
              reg100 <= $signed((8'ha0));
            end
          reg103 <= wire18;
          reg104 <= ($signed(((((8'ha6) <= wire3) ?
                      (~reg100) : $signed((8'ha5))) ?
                  (reg102 + $unsigned(reg11)) : (~&(wire16 ?
                      reg100 : wire0)))) ?
              reg8[(3'h7):(3'h4)] : wire93);
          reg105 <= $signed(wire19[(1'h0):(1'h0)]);
        end
      if (($signed(reg14) <<< reg8[(4'hf):(4'ha)]))
        begin
          reg106 <= $signed((reg6[(1'h0):(1'h0)] ^ reg6[(2'h3):(2'h3)]));
          reg107 <= $signed($unsigned(((!(reg100 ?
              wire92 : wire4)) >> $signed(reg97))));
          if ((!(~|((reg91[(2'h3):(2'h3)] ? (^reg13) : (8'ha4)) ?
              (wire2[(3'h6):(3'h6)] ? reg7 : reg100) : {reg14, wire2}))))
            begin
              reg108 <= (-{$unsigned($signed((^~reg106))), reg97});
              reg109 <= ($signed(reg13[(3'h5):(3'h5)]) <= (reg5 >> (~($signed(wire15) ?
                  wire16[(1'h1):(1'h1)] : $signed((8'ha3))))));
              reg110 <= reg10;
              reg111 <= ((8'ha6) ?
                  wire94 : $signed($unsigned(wire3[(3'h4):(2'h3)])));
            end
          else
            begin
              reg108 <= reg91[(1'h1):(1'h1)];
              reg109 <= ($unsigned((~wire92[(2'h2):(1'h0)])) ?
                  wire2[(3'h7):(3'h4)] : reg91);
              reg110 <= $signed(wire93[(3'h6):(1'h1)]);
              reg111 <= reg109;
            end
          reg112 <= $signed($unsigned((wire95[(1'h0):(1'h0)] ?
              (wire89 && $unsigned(reg106)) : $signed((wire22 == reg13)))));
        end
      else
        begin
          reg106 <= (8'hbb);
          reg107 <= $unsigned(reg110[(2'h3):(1'h0)]);
          if (reg103)
            begin
              reg108 <= (!$signed($unsigned({$signed(reg91)})));
              reg109 <= $signed(wire89[(1'h0):(1'h0)]);
              reg110 <= (8'hb9);
            end
          else
            begin
              reg108 <= $signed(($unsigned($unsigned(wire17)) ?
                  ($unsigned($signed((7'h43))) ?
                      ((wire90 ? reg101 : wire92) ?
                          (reg104 & reg101) : (wire92 ?
                              wire17 : reg12)) : ((reg91 ?
                          wire15 : wire89) >= $unsigned(reg111))) : $signed($unsigned($unsigned(reg8)))));
              reg109 <= $signed($signed($unsigned(({(8'hb7)} || (wire4 ?
                  wire87 : reg6)))));
              reg110 <= (~^(reg108[(3'h5):(2'h2)] ?
                  $unsigned(reg100[(1'h1):(1'h1)]) : ((&(wire1 && (8'ha2))) & reg91)));
            end
          if (reg10)
            begin
              reg111 <= (~(&wire0));
              reg112 <= ($signed({(wire18 && (wire18 ? reg104 : reg91)),
                  (reg102[(5'h13):(4'h8)] ?
                      (wire21 < (8'ha8)) : reg10[(2'h2):(1'h1)])}) >>> (!$unsigned(wire20)));
              reg113 <= (-wire22);
              reg114 <= $unsigned($unsigned((!wire17)));
              reg115 <= (reg8[(4'hf):(4'hb)] ?
                  {(reg104 ^~ $unsigned(wire0))} : reg107[(3'h7):(2'h2)]);
            end
          else
            begin
              reg111 <= (+$signed((reg110 << reg113[(1'h0):(1'h0)])));
              reg112 <= ((8'hbc) ?
                  reg7[(3'h6):(3'h4)] : $signed(($unsigned((^~(8'hbd))) ?
                      $signed((8'hb2)) : wire94)));
              reg113 <= (wire17[(1'h0):(1'h0)] ?
                  $signed(wire16[(1'h0):(1'h0)]) : $unsigned($signed({reg108,
                      (reg109 ? wire87 : reg7)})));
              reg114 <= $unsigned(reg14);
            end
        end
      reg116 <= (-(^((+(reg8 ? reg9 : wire94)) & $signed((&reg12)))));
    end
  assign wire117 = ((~&($signed($signed(reg12)) ?
                       (^reg113) : reg115[(3'h5):(2'h2)])) >> (~&(&reg100)));
  assign wire118 = reg98[(3'h5):(1'h1)];
  assign wire119 = ($signed((8'ha3)) ?
                       $signed(($signed((!reg11)) ?
                           (8'ha1) : (+reg113))) : (~&$unsigned(($signed(wire18) || $unsigned(reg106)))));
endmodule

module module23
#(parameter param85 = {({(^~((8'hb0) - (7'h42)))} ? ((&((8'ha1) | (8'h9c))) && (((8'ha4) ? (8'hb3) : (8'hbd)) == ((8'hb8) ? (8'h9f) : (7'h40)))) : ({(^(8'hb2)), ((8'had) ? (7'h42) : (8'hb1))} ? (((8'h9d) + (7'h42)) ? {(8'hb4)} : ((8'hbf) <<< (8'haa))) : (^((8'hbd) ? (8'hab) : (8'hb3)))))}, 
parameter param86 = ((^~((~(^~param85)) - (param85 * (~param85)))) ? (~&{({param85} <<< {param85})}) : param85))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire29;
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  assign y = {wire84,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
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
                 wire62,
                 wire29,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire29 = wire26;
  module30 #() modinst63 (wire62, clk, wire27, wire24, wire29, wire28);
  assign wire64 = wire24;
  assign wire65 = wire64[(4'h8):(3'h7)];
  assign wire66 = $signed((!wire27));
  assign wire67 = $unsigned($signed((wire27[(4'hb):(3'h7)] ?
                      ($signed(wire64) ?
                          {wire27,
                              (8'hae)} : wire29[(3'h5):(1'h1)]) : wire25)));
  assign wire68 = {{$unsigned(((+wire66) > (~&wire24))), wire24[(3'h7):(1'h0)]},
                      $signed($unsigned({{wire27}}))};
  assign wire69 = $unsigned(wire28[(2'h2):(1'h0)]);
  assign wire70 = {{wire27,
                          {((wire66 ? wire27 : wire68) ?
                                  (^wire27) : wire66[(5'h14):(4'h9)]),
                              ($signed(wire24) ?
                                  (+(8'had)) : wire69[(1'h1):(1'h0)])}},
                      $signed((+wire65[(2'h3):(1'h1)]))};
  assign wire71 = $signed(($signed({wire62}) ?
                      ($signed({(8'h9d)}) >> wire67[(2'h3):(1'h0)]) : (~^wire26)));
  assign wire72 = $signed(wire28[(4'h9):(1'h0)]);
  assign wire73 = ((~^($signed(wire68[(3'h5):(2'h2)]) >>> wire29[(4'h9):(3'h6)])) != (wire25 ?
                      (8'hac) : $signed(wire68[(3'h4):(1'h1)])));
  assign wire74 = wire66[(5'h12):(4'h9)];
  assign wire75 = $signed(wire67[(2'h3):(1'h1)]);
  assign wire76 = (&(($unsigned(wire67) * wire75) ?
                      ($signed($signed(wire29)) ?
                          wire25 : {{wire28},
                              wire68[(1'h0):(1'h0)]}) : (~|$signed(wire74))));
  assign wire77 = (8'ha1);
  assign wire78 = (|wire29);
  assign wire79 = (~|wire69);
  assign wire80 = ($signed((~^((~^wire24) << (wire25 ? wire64 : wire62)))) ?
                      (((wire28[(3'h7):(3'h4)] ?
                              $signed(wire28) : (~wire78)) & {wire65}) ?
                          (|(+$unsigned(wire28))) : wire65) : (-$unsigned($unsigned($signed(wire77)))));
  always
    @(posedge clk) begin
      reg81 <= $signed((^~wire29));
      reg82 <= $signed({wire27});
      reg83 <= $signed({($unsigned(reg81[(1'h1):(1'h0)]) > (((8'ha3) ?
              wire80 : wire72) * {wire76, wire76}))});
    end
  assign wire84 = $signed((((wire27 ? $signed(wire76) : $signed(wire65)) ?
                      (~&$unsigned((7'h42))) : ($unsigned(wire75) >= (wire25 ?
                          reg81 : wire28))) ~^ (8'hbe)));
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire34;
  input wire signed [(3'h6):(1'h0)] wire33;
  input wire [(5'h11):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h13):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 (1'h0)};
  assign wire35 = wire33[(3'h5):(1'h0)];
  assign wire36 = ($unsigned(wire34) == ($unsigned((^wire31[(3'h7):(3'h4)])) ^ ($unsigned(wire34[(4'hc):(1'h1)]) ?
                      (&wire33) : (+(-wire32)))));
  assign wire37 = (|wire34);
  assign wire38 = $unsigned(wire37[(4'hd):(4'hb)]);
  assign wire39 = (~|{wire33,
                      (wire38 ?
                          $unsigned((wire35 ?
                              wire34 : (8'hb5))) : ($unsigned(wire32) && (wire38 << wire36)))});
  assign wire40 = (~|wire37[(2'h3):(2'h2)]);
  assign wire41 = $unsigned(wire34);
  assign wire42 = (&(|$signed($unsigned((~wire35)))));
  assign wire43 = wire42;
  assign wire44 = wire42;
  assign wire45 = ($unsigned(wire41[(1'h1):(1'h1)]) ?
                      ($unsigned({$signed(wire43), $signed(wire38)}) ?
                          (~|((wire39 - wire33) << $signed(wire44))) : wire38) : (~|(wire32 <= ((8'ha2) ?
                          (wire38 - wire33) : wire32[(1'h0):(1'h0)]))));
  assign wire46 = (wire40 >>> wire41);
  assign wire47 = ($signed((|$unsigned({(8'hb6), wire45}))) - $signed(wire41));
  assign wire48 = $unsigned({(wire39 >>> $unsigned(wire46))});
  assign wire49 = wire37;
  assign wire50 = $unsigned(($unsigned(({wire33, wire39} >= (wire44 ?
                      wire42 : wire45))) >>> $signed(wire33)));
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire46[(4'hf):(4'hd)]) ?
          wire37[(4'he):(4'hc)] : (-((wire36 | wire41) | (&wire42))))))
        begin
          if (wire44)
            begin
              reg51 <= $signed(((~|wire39) - wire35));
              reg52 <= wire39;
            end
          else
            begin
              reg51 <= ($unsigned($signed((~|wire38))) & $unsigned((7'h44)));
              reg52 <= ((8'h9d) == $signed((|((wire50 ?
                  wire42 : wire31) == (wire43 - wire46)))));
              reg53 <= (((~|wire49) ~^ wire38[(3'h6):(2'h3)]) <= reg52);
              reg54 <= wire43[(3'h4):(1'h1)];
            end
          if (((wire40 ?
                  $signed((wire46[(1'h0):(1'h0)] >= (wire40 <= (8'ha7)))) : $unsigned($unsigned(wire50[(5'h11):(4'hb)]))) ?
              (wire42[(3'h6):(1'h0)] && $unsigned((~^{wire39}))) : ($unsigned(({wire42,
                      reg52} < (+(7'h44)))) ?
                  ($signed(wire45) == {(wire43 ? (8'h9f) : reg53),
                      wire45}) : {$unsigned((wire49 ? reg51 : reg52))})))
            begin
              reg55 <= (({(+wire34[(4'hc):(4'h9)]), (&(8'hb7))} ?
                  (-$unsigned(wire37)) : {$unsigned((wire41 ^ wire49)),
                      $signed((!wire33))}) ^~ wire37);
              reg56 <= $unsigned((reg53[(3'h4):(2'h3)] || (-(-wire40[(3'h4):(2'h3)]))));
            end
          else
            begin
              reg55 <= wire48[(1'h1):(1'h1)];
              reg56 <= (&$signed($signed($signed(wire36))));
            end
          reg57 <= (~((+({(8'hb1)} ?
              (|wire40) : $unsigned(wire41))) == wire48));
          reg58 <= $unsigned($signed(wire41[(1'h1):(1'h1)]));
        end
      else
        begin
          reg51 <= ({((~|$unsigned(wire37)) | $unsigned($signed(wire47)))} ?
              (^{(wire42[(4'h9):(4'h8)] != $unsigned(wire32))}) : (wire33[(3'h4):(2'h3)] ?
                  $unsigned(wire46[(2'h2):(1'h0)]) : reg57));
        end
      reg59 <= $unsigned(($unsigned(reg56[(2'h2):(1'h1)]) * reg52));
      reg60 <= (wire44[(4'ha):(4'h8)] ?
          wire38 : {$unsigned((reg55 || wire35[(4'hd):(1'h0)]))});
      reg61 <= ($signed((|wire40[(4'hd):(2'h3)])) ?
          reg52 : ((reg56 ? $unsigned((wire39 ? wire50 : wire43)) : reg55) ?
              ((wire48 ? (!wire44) : $signed(wire35)) >> ($signed(wire34) ?
                  wire46 : $unsigned(wire44))) : reg60[(3'h7):(3'h5)]));
    end
endmodule
