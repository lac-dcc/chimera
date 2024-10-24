module top
#(parameter param124 = (^~((~{(+(8'ha5)), (&(8'ha7))}) ? ((((8'haf) ? (8'ha4) : (8'ha1)) ^ (~(8'hbd))) ? ((8'ha2) ? ((8'hbc) ^~ (8'hb3)) : (^~(8'hb9))) : {{(8'ha2), (8'haf)}}) : (~^({(8'ha8), (8'ha1)} <<< {(8'hab)})))), 
parameter param125 = (param124 ? (((~^{param124, param124}) ? (param124 ? (param124 ? param124 : param124) : (~&(8'ha0))) : param124) ? param124 : (~((param124 ? (8'ha6) : param124) ? param124 : (param124 ? param124 : param124)))) : (|(!(~|((8'hb9) >= param124))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(5'h13):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire108;
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire108,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (|$unsigned({(~^wire1[(5'h12):(3'h4)]),
          {wire2, (wire0 ? wire4 : wire0)}}));
      reg6 <= {$unsigned((wire1[(5'h12):(4'hf)] >>> wire0))};
      reg7 <= (reg5 ? ($unsigned(wire4) ^~ {wire4, (~|(8'hb2))}) : {wire3});
      if ((wire2 ?
          {$signed(($unsigned((8'h9d)) ?
                  $unsigned(reg5) : (^wire2)))} : (-({{(8'ha7)}} ?
              (reg7[(4'h8):(3'h4)] == $signed(wire3)) : $signed($signed(wire1))))))
        begin
          reg8 <= $signed((^$unsigned(($unsigned(reg7) ?
              $signed(reg5) : (reg6 >>> (8'ha3))))));
          reg9 <= {$signed((({wire3, wire2} ?
                      ((8'ha4) + (8'hbf)) : wire4[(2'h2):(1'h1)]) ?
                  (reg8 != (wire0 != wire2)) : {(wire4 << reg7)})),
              (($unsigned((wire1 ? reg8 : reg7)) ?
                      $unsigned(wire3[(3'h4):(2'h2)]) : (8'ha1)) ?
                  (^~$signed(wire0)) : (reg6 ?
                      wire3[(1'h1):(1'h1)] : ($unsigned(wire0) << $unsigned(reg5))))};
          reg10 <= reg5;
          reg11 <= {reg6, $signed(reg8[(2'h2):(1'h1)])};
          reg12 <= ({(reg9[(3'h7):(3'h4)] ?
                  (wire4[(2'h3):(2'h2)] << wire1[(5'h13):(5'h12)]) : reg5),
              reg9} <= (wire3 && (wire3 ? wire4[(2'h3):(2'h2)] : wire0)));
        end
      else
        begin
          reg8 <= ((+{(reg10 ?
                  wire1[(4'h9):(3'h7)] : $unsigned(reg12))}) + ({((reg5 ?
                          reg6 : wire4) ?
                      ((7'h42) ? reg8 : reg5) : $unsigned((8'hbd))),
                  (^~$unsigned(reg9))} ?
              reg9 : ($unsigned((+reg9)) ? reg7[(1'h0):(1'h0)] : wire0)));
          if (wire1[(4'hb):(4'h9)])
            begin
              reg9 <= $signed(wire1);
              reg10 <= reg7;
              reg11 <= reg10[(1'h0):(1'h0)];
              reg12 <= reg11[(3'h4):(1'h1)];
              reg13 <= {{reg12, reg6[(1'h1):(1'h0)]},
                  (wire2[(4'hd):(4'ha)] ?
                      wire0 : ($unsigned(wire2) + ((wire2 << (8'haa)) ?
                          (wire3 ? reg7 : reg5) : $unsigned((8'h9f)))))};
            end
          else
            begin
              reg9 <= (((wire1 ?
                  ($unsigned((8'ha4)) <<< $unsigned(wire2)) : reg9[(2'h2):(1'h0)]) ~^ reg13) & reg12);
              reg10 <= reg6;
            end
          reg14 <= (8'h9d);
          reg15 <= (^reg5);
          reg16 <= (&$signed(((-(^~reg9)) ?
              $unsigned(wire4[(3'h4):(1'h1)]) : $signed(reg15))));
        end
    end
  assign wire17 = reg7;
  assign wire18 = reg9[(1'h0):(1'h0)];
  assign wire19 = ((-$signed((^$unsigned((8'ha8))))) ^~ reg12[(1'h1):(1'h1)]);
  assign wire20 = (reg9[(3'h5):(2'h3)] <= ($unsigned(((wire1 - wire4) >= (reg5 ?
                      wire0 : (8'hb1)))) && (8'hb0)));
  assign wire21 = ($signed((~{(reg8 ^ reg12)})) ?
                      wire2 : $signed((+$unsigned((~reg9)))));
  assign wire22 = (~^((reg13[(4'hf):(1'h1)] ?
                          reg13 : $unsigned(wire18[(3'h5):(3'h4)])) ?
                      reg7 : $unsigned((~wire19))));
  module23 #() modinst109 (wire108, clk, wire21, wire4, wire1, reg8);
  assign wire110 = $signed($signed(($unsigned({wire18, reg14}) - wire108)));
  assign wire111 = ((reg10 * {{$unsigned(reg6), reg7[(1'h0):(1'h0)]},
                           (~$signed(wire110))}) ?
                       reg16[(1'h0):(1'h0)] : $signed(reg9[(3'h7):(2'h3)]));
  assign wire112 = (wire22 ?
                       reg9[(3'h4):(2'h2)] : (wire1[(5'h15):(4'h8)] << (~|(-(~wire110)))));
  assign wire113 = (((($unsigned(reg7) != (wire110 > wire3)) ?
                               wire21[(4'h8):(4'h8)] : (^$unsigned(wire112))) ?
                           (!wire20[(2'h3):(2'h2)]) : (-($unsigned(reg8) ?
                               $unsigned(wire20) : {(8'ha4), reg15}))) ?
                       wire108 : $unsigned($unsigned(wire112[(5'h10):(3'h4)])));
  always
    @(posedge clk) begin
      reg114 <= reg16[(1'h1):(1'h0)];
      if (((wire108[(1'h0):(1'h0)] ?
              ($signed(wire113) ?
                  $signed(wire108[(1'h0):(1'h0)]) : reg11[(2'h2):(1'h0)]) : wire1[(4'he):(4'hc)]) ?
          $signed((^((8'ha9) >= (^wire110)))) : reg7))
        begin
          if ((~^(!((|{reg16, wire18}) ? $signed($unsigned(reg6)) : wire21))))
            begin
              reg115 <= (&(~$unsigned(reg13[(4'ha):(2'h2)])));
              reg116 <= {(7'h44)};
              reg117 <= (reg11[(3'h4):(2'h2)] ~^ $signed(($signed((~reg116)) ?
                  wire19 : wire22[(1'h1):(1'h0)])));
              reg118 <= $unsigned((wire18 ?
                  (wire0 || (~&{reg5, reg115})) : (+$signed(reg11))));
            end
          else
            begin
              reg115 <= reg116;
              reg116 <= $signed((^~{$signed((wire1 ^~ reg114)),
                  {reg118, {reg7, reg6}}}));
              reg117 <= $signed(wire112[(4'he):(3'h6)]);
              reg118 <= $unsigned(((^((^~(8'haf)) << $unsigned(wire113))) ?
                  ((wire20[(1'h1):(1'h0)] ? wire20[(1'h0):(1'h0)] : reg7) ?
                      $unsigned((^~reg14)) : ((reg6 <<< wire108) ?
                          (^(8'ha6)) : (wire20 && reg10))) : wire112));
            end
        end
      else
        begin
          reg115 <= wire110;
          reg116 <= $unsigned($unsigned((8'ha4)));
          reg117 <= ((|$unsigned(wire110)) != wire4);
        end
    end
  always
    @(posedge clk) begin
      if ((^reg5[(4'hb):(3'h4)]))
        begin
          reg119 <= (~|reg11);
          reg120 <= wire17[(2'h2):(1'h1)];
        end
      else
        begin
          reg119 <= (^wire18[(3'h4):(3'h4)]);
          reg120 <= (reg7[(4'ha):(2'h3)] == wire1);
        end
      reg121 <= {(~^{(wire2 ?
                  (wire21 * (8'had)) : ((8'ha9) ? reg114 : reg118))}),
          $unsigned(reg114[(3'h7):(2'h3)])};
      reg122 <= $signed($signed($signed((^~(-wire113)))));
      reg123 <= (reg115[(4'hf):(4'hf)] ?
          {(reg16 ? $signed($signed(wire17)) : wire3[(3'h6):(3'h6)])} : ({reg12,
              wire4} - reg12[(1'h0):(1'h0)]));
    end
endmodule

module module23  (y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire25;
  input wire signed [(3'h5):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire106;
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  assign y = {wire28,
                 wire62,
                 wire64,
                 wire67,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire74,
                 wire106,
                 reg73,
                 reg72,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire28 = $signed((((!{wire26}) ?
                          {$signed(wire24)} : wire26[(1'h1):(1'h1)]) ?
                      (((wire25 ~^ wire25) ?
                          (wire25 ?
                              wire25 : (8'hac)) : $signed(wire27)) ~^ {wire27}) : wire26));
  module29 #() modinst63 (wire62, clk, wire28, wire25, wire26, wire24);
  assign wire64 = wire26;
  always
    @(posedge clk) begin
      reg65 <= $signed({wire26});
      reg66 <= (((wire24 ?
              $signed(((8'h9e) ?
                  wire26 : wire25)) : (~|$signed(wire62))) | wire62) ?
          ($unsigned(({wire26, wire28} ? (8'h9f) : wire24)) ?
              {{(wire27 >> reg65)}} : wire27) : wire27[(3'h4):(3'h4)]);
    end
  assign wire67 = (wire26 ?
                      $unsigned(($unsigned(reg65[(3'h5):(3'h5)]) ?
                          reg66 : $unsigned((reg65 ?
                              wire25 : (8'hb6))))) : $signed($unsigned((8'ha9))));
  assign wire68 = (wire64 ?
                      (8'ha1) : ((wire24[(1'h1):(1'h1)] ?
                          ((~(8'hb6)) ?
                              (wire64 | wire28) : $unsigned((8'ha3))) : (|{wire25})) >= $unsigned(wire25[(3'h6):(3'h5)])));
  assign wire69 = wire28[(5'h10):(1'h1)];
  assign wire70 = wire62;
  assign wire71 = $signed((wire64 >= $signed((((8'hb9) << wire24) ?
                      (!wire28) : wire69))));
  always
    @(posedge clk) begin
      reg72 <= $signed(((({wire64} ?
              $signed(wire68) : wire27[(1'h0):(1'h0)]) << wire62[(4'hd):(3'h4)]) ?
          wire71[(1'h0):(1'h0)] : (($signed(wire70) ?
              $unsigned(reg66) : (wire68 ?
                  wire25 : wire28)) || $signed(wire28))));
    end
  always
    @(posedge clk) begin
      reg73 <= (~^wire26);
    end
  assign wire74 = wire71[(1'h0):(1'h0)];
  module75 #() modinst107 (.wire79(wire71), .wire76(reg65), .wire80(wire64), .clk(clk), .y(wire106), .wire77(reg66), .wire78(wire62));
endmodule

module module75
#(parameter param105 = ((-{(((8'hbb) ? (8'ha0) : (8'h9f)) ? (&(7'h40)) : ((8'ha6) ? (8'h9c) : (8'hac))), {(8'ha4), ((8'hb8) ? (8'h9e) : (8'haf))}}) << ((({(7'h43), (8'hac)} ? ((8'hb0) ? (8'hb9) : (7'h41)) : ((8'hbc) ? (7'h42) : (8'ha8))) ? ((7'h44) << (~^(8'ha0))) : (~((7'h40) ? (8'ha8) : (8'ha2)))) ? {((^(8'hb3)) ? ((8'hb2) * (7'h40)) : ((8'hb8) ? (8'had) : (8'h9d))), ((~|(8'hbf)) ? (&(8'ha0)) : ((8'ha6) <= (8'hb0)))} : {(!((8'haa) ? (8'hbe) : (7'h43)))})))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire80;
  input wire signed [(4'ha):(1'h0)] wire79;
  input wire [(5'h13):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  input wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(4'hd):(1'h0)] wire81;
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
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
                 (1'h0)};
  assign wire81 = wire79;
  assign wire82 = {((((!wire79) ? (&wire76) : (wire81 ? wire80 : wire79)) ?
                              $signed({wire79}) : (wire76[(4'h9):(2'h2)] ?
                                  $signed(wire80) : (wire76 == wire80))) ?
                          ((-(wire76 - wire81)) ?
                              {(+wire80),
                                  (wire77 ? (8'hab) : wire80)} : (wire76 ?
                                  ((8'ha5) ?
                                      wire79 : wire76) : $unsigned(wire81))) : (^$signed(wire76))),
                      (wire77 > $signed((^$signed((8'ha5)))))};
  assign wire83 = {(^(+(-wire76))), {(8'hbb)}};
  assign wire84 = wire82;
  assign wire85 = (~|$unsigned($signed((wire76[(5'h13):(4'ha)] ?
                      {wire77, wire76} : {wire82, wire78}))));
  assign wire86 = $unsigned(wire85[(1'h0):(1'h0)]);
  assign wire87 = (8'hb7);
  assign wire88 = wire84[(4'hc):(3'h5)];
  assign wire89 = wire78;
  always
    @(posedge clk) begin
      reg90 <= {(wire79 ~^ $signed($unsigned({wire81, wire82})))};
      if (($unsigned(((~^wire82[(2'h2):(1'h0)]) ?
              wire86[(4'hb):(3'h5)] : wire80[(1'h0):(1'h0)])) ?
          (8'hac) : wire79))
        begin
          reg91 <= $signed(wire86);
          if (($signed((+wire80)) ~^ wire84))
            begin
              reg92 <= $unsigned($unsigned(wire84));
              reg93 <= ({(wire89 ?
                      $unsigned(reg90[(4'he):(4'hc)]) : (!(8'hb0))),
                  $unsigned($signed(wire79[(2'h3):(2'h3)]))} && (^reg90));
              reg94 <= (~^$unsigned(wire79[(2'h3):(1'h0)]));
              reg95 <= $unsigned(($signed({$unsigned((8'h9d)),
                      reg91[(3'h5):(1'h0)]}) ?
                  $signed(wire89[(3'h7):(3'h6)]) : wire88[(4'h8):(4'h8)]));
              reg96 <= {(((wire84[(1'h0):(1'h0)] <= $signed(wire87)) ?
                      $unsigned((+(8'hae))) : wire87[(2'h2):(1'h0)]) << {$signed(wire88)}),
                  ((~|((wire86 ? (8'hb6) : wire80) - $unsigned(reg90))) ?
                      ($unsigned($unsigned(wire80)) ?
                          $unsigned($signed(reg95)) : ($signed((8'ha4)) >> (~^(8'ha8)))) : (((wire79 * (8'hb5)) >>> (wire78 ?
                              reg93 : wire86)) ?
                          ({wire87, (8'hbd)} ?
                              {wire87} : $signed(wire83)) : reg95[(4'hc):(1'h1)]))};
            end
          else
            begin
              reg92 <= $signed(wire87[(4'hb):(3'h4)]);
              reg93 <= reg96[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg91 <= reg91;
          if ((~|((wire88 ?
              (wire80 ?
                  (|reg90) : reg93) : ((|reg94) >> $unsigned(reg94))) != wire81[(1'h0):(1'h0)])))
            begin
              reg92 <= reg94;
              reg93 <= (($unsigned({$unsigned(wire87),
                  (~wire77)}) <= ((~&{wire79}) ?
                  reg95[(4'he):(4'h8)] : wire86)) >> {($unsigned((reg90 < reg91)) + ($unsigned(reg90) || $signed(wire80))),
                  (reg96 ?
                      ($signed(wire79) >= ((8'hae) ?
                          wire82 : reg94)) : ($signed(wire84) ?
                          $unsigned((8'hb2)) : reg91[(1'h0):(1'h0)]))});
              reg94 <= reg92[(3'h6):(2'h2)];
              reg95 <= (7'h44);
              reg96 <= $signed($signed(wire82));
            end
          else
            begin
              reg92 <= $unsigned(reg91[(2'h3):(2'h3)]);
              reg93 <= (~^(8'hb3));
              reg94 <= $unsigned((7'h41));
            end
          reg97 <= wire80[(4'hb):(1'h1)];
        end
      reg98 <= (7'h41);
      reg99 <= $unsigned($unsigned((!((reg95 >>> (8'ha9)) ?
          ((7'h40) ? reg96 : reg95) : $signed(wire89)))));
      reg100 <= wire79[(3'h6):(3'h4)];
    end
  assign wire101 = $signed({wire77});
  assign wire102 = (wire76 ?
                       (reg91[(1'h0):(1'h0)] ~^ {{$signed(wire88)}}) : $signed($unsigned($signed((&reg98)))));
  assign wire103 = reg91[(3'h5):(3'h5)];
  assign wire104 = $signed($unsigned({($signed((7'h43)) ?
                           (wire101 ? wire80 : reg93) : (8'had)),
                       ((^reg91) - (|wire87))}));
endmodule

module module29
#(parameter param60 = (((~^((^(8'haa)) ? (~(8'had)) : (!(8'ha1)))) ? (^(8'ha2)) : (!{{(8'hab), (8'hb0)}})) < {{(((8'ha2) ~^ (8'hbd)) ? ((8'hb8) ? (8'hb9) : (8'h9d)) : ((8'h9d) << (7'h40))), (8'ha2)}, {(|((8'hbd) ? (8'hab) : (7'h44)))}}), 
parameter param61 = (~|(8'hbd)))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire32;
  input wire [(2'h3):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire41,
                 wire40,
                 wire36,
                 wire35,
                 wire34,
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
                 reg42,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire34 = (wire31 <<< wire30[(4'h9):(4'h9)]);
  assign wire35 = ({$unsigned({(wire33 ? wire33 : wire33)}),
                      (^$signed(wire33[(2'h3):(1'h0)]))} ~^ wire32[(2'h2):(1'h1)]);
  assign wire36 = wire30[(4'hb):(2'h3)];
  always
    @(posedge clk) begin
      reg37 <= $signed((({$unsigned(wire32),
          (wire36 ?
              wire34 : (8'haa))} ~^ (wire36[(2'h2):(1'h1)] ~^ $unsigned(wire33))) != $signed(wire30)));
      reg38 <= {wire32, (wire34[(5'h11):(3'h6)] << wire34[(4'ha):(3'h5)])};
      reg39 <= (-wire35[(3'h5):(1'h0)]);
    end
  assign wire40 = wire32;
  assign wire41 = {wire40, wire30[(2'h3):(2'h3)]};
  always
    @(posedge clk) begin
      reg42 <= {reg38[(2'h3):(2'h3)]};
      if (($unsigned((((~|wire40) | (wire41 ? (8'hbe) : (8'h9f))) || wire30)) ?
          ($signed(((wire41 ? wire34 : wire35) - $unsigned(wire34))) ?
              $signed($unsigned($signed(wire41))) : (~^reg42[(1'h0):(1'h0)])) : (+reg38[(1'h0):(1'h0)])))
        begin
          reg43 <= ($unsigned((wire34 ?
              {$signed(wire36),
                  (reg39 & wire34)} : (~^$signed((8'ha7))))) == $unsigned($signed(((8'hbf) * (wire34 ?
              reg38 : wire31)))));
          reg44 <= $signed(((7'h42) ?
              $signed($unsigned((+(8'ha0)))) : $unsigned(wire32)));
        end
      else
        begin
          reg43 <= {({(reg38[(3'h4):(3'h4)] ^~ $signed(reg43)),
                      $unsigned(reg39[(4'hb):(4'h8)])} ?
                  wire36 : reg39[(2'h3):(2'h2)])};
          reg44 <= ($unsigned($signed($unsigned({wire41}))) ?
              (|(!$signed(reg37))) : ((|$unsigned(wire41[(4'hf):(4'h9)])) <= $unsigned(((~|wire41) << (~|(8'ha6))))));
          if ($unsigned((wire32 ?
              $signed(wire35) : (wire32[(4'hc):(4'h9)] > $signed((reg38 <<< wire31))))))
            begin
              reg45 <= ((($unsigned((^~reg43)) ?
                  {{reg38}} : (~^{reg37})) < $unsigned(wire41[(4'he):(1'h1)])) - $unsigned(({$signed(wire30),
                      wire35[(1'h0):(1'h0)]} ?
                  (^~wire33) : $unsigned((reg44 <= (8'h9c))))));
            end
          else
            begin
              reg45 <= wire31;
              reg46 <= $unsigned(($unsigned({$signed(reg42)}) ?
                  $signed(reg45[(3'h5):(2'h3)]) : (~|(reg42 && reg44[(1'h0):(1'h0)]))));
              reg47 <= (((wire31[(1'h1):(1'h1)] == ((reg45 > (8'ha1)) ~^ $signed(reg39))) ?
                      reg37[(2'h2):(1'h1)] : $unsigned((wire40[(1'h1):(1'h1)] + wire41))) ?
                  (((|reg38) ?
                          {(wire30 ? reg45 : reg44),
                              (7'h41)} : $unsigned({(8'ha3), wire30})) ?
                      ($signed((wire31 <<< wire36)) ?
                          $signed(reg37) : wire33[(4'h9):(1'h1)]) : (&wire32[(4'h8):(1'h0)])) : $unsigned((~^{((8'h9d) ?
                          wire36 : (8'hb3))})));
            end
          if ((|$signed({$unsigned({wire35, wire31})})))
            begin
              reg48 <= wire30;
              reg49 <= $signed($signed((((-reg46) <<< reg39) ?
                  $signed(reg38[(2'h3):(2'h3)]) : reg42[(1'h0):(1'h0)])));
              reg50 <= wire34[(4'h9):(2'h3)];
              reg51 <= $unsigned((wire32[(2'h2):(1'h0)] - $unsigned((~reg42))));
            end
          else
            begin
              reg48 <= $signed(reg46);
              reg49 <= wire40[(1'h1):(1'h1)];
              reg50 <= reg39;
            end
        end
      reg52 <= (8'hb8);
      reg53 <= ($signed({reg52}) ?
          (((wire31[(2'h2):(1'h1)] ? (8'hb5) : $signed(wire34)) ?
              reg44 : $signed(reg49)) & {reg37[(1'h1):(1'h1)],
              wire33}) : (!$unsigned(reg51)));
      reg54 <= reg49[(4'h8):(1'h1)];
    end
  assign wire55 = reg52;
  assign wire56 = $signed(($unsigned((reg43 ?
                          wire31[(2'h2):(1'h0)] : (reg39 & reg39))) ?
                      (!$unsigned({reg48, reg44})) : {wire34[(4'hf):(4'h8)]}));
  assign wire57 = $signed(((~|({reg46} >> wire30[(4'hc):(4'h9)])) ^~ wire34));
  assign wire58 = {(wire36[(1'h0):(1'h0)] << wire57), $signed(reg46)};
  assign wire59 = (^~wire57);
endmodule
