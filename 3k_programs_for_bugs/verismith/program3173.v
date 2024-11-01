module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire125;
  wire [(5'h12):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire [(3'h5):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire93,
                 wire91,
                 wire14,
                 wire13,
                 wire6,
                 wire5,
                 wire4,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg114,
                 reg113,
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
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = $signed((!{(|$unsigned(wire3))}));
  assign wire5 = (&($unsigned(wire3) > (^(wire2 * wire1))));
  assign wire6 = $signed({wire2[(3'h6):(3'h6)], $unsigned((|(wire5 + wire5)))});
  always
    @(posedge clk) begin
      reg7 <= $unsigned(wire3[(3'h7):(1'h1)]);
      if (($unsigned($signed($unsigned(wire2[(3'h5):(3'h4)]))) ?
          wire4 : (~({$unsigned(wire0),
              $signed((8'hb9))} >>> ((reg7 != wire0) << (8'hb4))))))
        begin
          reg8 <= wire0;
          if ((^~((+wire0) ^ (((!(7'h42)) != (wire1 ?
              (8'ha0) : wire4)) ~^ reg8))))
            begin
              reg9 <= (wire4 ~^ $unsigned(((^wire2) + $unsigned(wire2[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg9 <= $unsigned((8'ha3));
            end
          reg10 <= reg7[(1'h0):(1'h0)];
          reg11 <= $signed(($unsigned(((reg8 <= reg9) ?
                  (+wire2) : $signed((7'h40)))) ?
              ((^{wire5}) ?
                  wire5[(4'hc):(4'h9)] : {$signed(wire0)}) : (8'h9f)));
          reg12 <= (&{(~^reg8[(3'h6):(3'h5)])});
        end
      else
        begin
          reg8 <= $signed($unsigned(reg7));
          reg9 <= $unsigned(((reg8 ? wire0 : reg11) ?
              reg8[(3'h5):(1'h0)] : reg8));
        end
    end
  assign wire13 = (~$unsigned($unsigned(((8'ha5) ?
                      wire3[(3'h7):(2'h2)] : (wire4 ? wire4 : reg7)))));
  assign wire14 = ((~|(~^((wire6 ? wire2 : reg8) ?
                      (reg12 * reg11) : {wire5,
                          wire5}))) || reg9[(4'h9):(1'h0)]);
  module15 #() modinst92 (.wire18(reg10), .wire19(reg7), .wire20(wire6), .y(wire91), .wire16(reg11), .wire17(wire1), .clk(clk));
  assign wire93 = reg7;
  always
    @(posedge clk) begin
      reg94 <= wire13[(4'h9):(3'h5)];
      reg95 <= (~^wire2[(3'h6):(2'h2)]);
      reg96 <= (-(reg95[(3'h6):(1'h0)] ^ (^~(~|wire4))));
      if (((($unsigned((!reg12)) ? reg7 : $unsigned((wire93 ? wire0 : reg95))) ?
              (wire0 > $unsigned((reg9 ?
                  (8'ha1) : reg94))) : (~^($unsigned(wire3) < wire1[(2'h2):(1'h1)]))) ?
          $signed(((8'ha4) << (wire4 ?
              (reg9 ?
                  wire1 : (8'ha3)) : $signed((8'ha4))))) : wire5[(4'hb):(4'h9)]))
        begin
          if (reg94[(3'h7):(1'h1)])
            begin
              reg97 <= ({$unsigned(((^wire3) * wire6[(1'h0):(1'h0)]))} ?
                  $signed((wire0[(1'h0):(1'h0)] <<< $unsigned((wire14 && reg8)))) : (reg9 ^~ ($signed((reg10 ?
                      wire0 : reg96)) != (7'h40))));
              reg98 <= reg8;
              reg99 <= (8'hab);
              reg100 <= ({($unsigned(reg8) ~^ ($signed(reg7) >>> $signed(reg96)))} ?
                  $unsigned({$unsigned(((8'hb6) >>> reg96))}) : (~|reg98[(1'h0):(1'h0)]));
            end
          else
            begin
              reg97 <= $unsigned(reg9);
              reg98 <= reg100[(1'h0):(1'h0)];
              reg99 <= ($signed($signed($signed({wire5, reg12}))) ?
                  {({wire6[(1'h1):(1'h1)],
                          {reg100, reg100}} ~^ $signed($unsigned(reg94))),
                      (|(^(~^(8'hae))))} : (-($signed($signed(wire5)) ?
                      reg12[(3'h4):(1'h1)] : $signed($signed(reg94)))));
            end
          reg101 <= $unsigned((~^wire1));
          if ($unsigned(((wire2 >> $unsigned($signed(reg99))) ?
              {($unsigned(reg10) * wire91[(2'h2):(1'h0)]),
                  $signed((wire2 ? (7'h43) : (8'hae)))} : $signed(wire5))))
            begin
              reg102 <= ($signed(reg95) || (8'hbd));
              reg103 <= (~&$signed(wire5[(4'h8):(2'h2)]));
              reg104 <= (8'ha8);
              reg105 <= (~wire2[(1'h0):(1'h0)]);
              reg106 <= ($unsigned($unsigned($unsigned({wire91,
                  (8'hba)}))) != (^wire91[(2'h2):(1'h1)]));
            end
          else
            begin
              reg102 <= {wire91[(3'h4):(3'h4)], reg106};
              reg103 <= reg96;
              reg104 <= (-(+reg97[(4'hd):(4'ha)]));
              reg105 <= $unsigned($signed(({(reg94 ? (8'haa) : reg7)} ?
                  ($signed(reg9) ^~ (wire13 ^ reg7)) : $signed($signed(wire91)))));
            end
          reg107 <= (~&reg96[(4'h9):(4'h8)]);
          reg108 <= reg97[(4'h8):(1'h0)];
        end
      else
        begin
          reg97 <= {(reg101[(2'h2):(1'h0)] > (($signed(reg106) <<< reg102) ?
                  ($unsigned(reg12) ?
                      reg106 : wire4[(1'h1):(1'h0)]) : reg97[(1'h1):(1'h0)])),
              wire93};
          reg98 <= $signed((~|((|(wire6 ?
              reg102 : (8'hb7))) || $unsigned((~^reg12)))));
        end
    end
  assign wire109 = $signed(wire1);
  assign wire110 = $signed($unsigned(((reg105[(2'h2):(2'h2)] <= {reg105}) ?
                       reg102[(5'h10):(4'hd)] : (8'hb3))));
  assign wire111 = $signed((&$unsigned($unsigned(wire6[(4'hd):(1'h1)]))));
  assign wire112 = (|((^~($signed(reg95) && (reg106 != (8'h9e)))) | ($unsigned($signed(reg100)) | wire1[(3'h6):(2'h3)])));
  always
    @(posedge clk) begin
      reg113 <= (reg11 ?
          ((&{{wire111, wire109}, $signed(reg105)}) ?
              (-reg102[(2'h2):(1'h0)]) : wire112[(4'h8):(3'h4)]) : (~^wire3));
      reg114 <= {{(~^$signed(reg108[(2'h3):(2'h3)])),
              (~|$signed(((8'ha7) > wire6)))},
          $signed((~|((reg113 ? reg99 : wire93) ^ (wire91 ?
              reg104 : (8'hac)))))};
    end
  assign wire115 = wire13;
  assign wire116 = (^~(!(($signed(reg11) ?
                       (reg96 ? reg103 : wire109) : (~|(8'ha7))) || (~^(wire14 ?
                       reg100 : wire1)))));
  assign wire117 = {$signed(($signed((!wire4)) ?
                           {$unsigned(reg97), reg105} : ((wire13 < wire4) ?
                               reg102[(2'h3):(2'h3)] : wire13[(4'h8):(1'h1)])))};
  assign wire118 = $unsigned((~|reg96[(4'ha):(2'h2)]));
  assign wire119 = wire109;
  always
    @(posedge clk) begin
      reg120 <= {(^~($unsigned({reg99}) - (((8'ha3) & (7'h40)) << reg10[(4'hc):(4'ha)]))),
          {(8'hae)}};
      reg121 <= (|reg8[(1'h1):(1'h1)]);
      reg122 <= ((((wire6[(5'h10):(2'h3)] ?
              {wire115} : (reg98 == wire119)) || {reg104,
              $unsigned(wire111)}) < wire93[(1'h0):(1'h0)]) ?
          reg106 : ($signed(wire111) <= wire1));
      reg123 <= wire3;
      reg124 <= reg123;
    end
  assign wire125 = wire116;
  assign wire126 = reg121;
  assign wire127 = (wire6[(3'h4):(1'h0)] <= $unsigned(wire91));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire88;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  assign y = {wire90,
                 wire88,
                 wire83,
                 wire42,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg89,
                 reg87,
                 reg86,
                 reg85,
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
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire21 = wire19[(4'hd):(1'h1)];
  assign wire22 = $unsigned((!wire16[(3'h4):(2'h3)]));
  assign wire23 = $unsigned((&(((wire17 >= wire21) ?
                          wire19[(1'h1):(1'h0)] : $signed(wire22)) ?
                      wire19 : (~&wire18[(4'h9):(3'h6)]))));
  assign wire24 = {{{({wire22} >= (^~wire17)),
                              ({wire16, wire22} || wire16[(2'h3):(1'h0)])}}};
  assign wire25 = $signed((wire24[(2'h3):(2'h3)] ?
                      $signed($signed($signed((8'ha1)))) : (8'h9c)));
  assign wire26 = (~|(wire20[(4'hd):(4'hb)] ? wire20 : wire17));
  assign wire27 = (8'hb4);
  always
    @(posedge clk) begin
      reg28 <= wire24[(3'h6):(3'h6)];
      reg29 <= {$signed(wire17[(5'h12):(1'h1)]),
          ((^~{(reg28 ? wire22 : wire21), (8'hbd)}) ?
              wire20 : ($unsigned({(7'h41)}) - wire19[(3'h5):(1'h0)]))};
    end
  assign wire30 = wire25;
  always
    @(posedge clk) begin
      if ((&$unsigned((reg29 && wire26))))
        begin
          if ((wire23 ?
              ((^((|wire23) <= $unsigned(wire21))) ?
                  {(&((8'ha8) >= wire23))} : $unsigned($unsigned($unsigned(wire24)))) : ((!({wire30} ?
                  reg29 : (~|(8'ha7)))) && ($signed((wire16 >= wire27)) < $unsigned((~^wire27))))))
            begin
              reg31 <= (~&(+((&(+wire23)) ?
                  wire20 : $signed((reg29 <= wire17)))));
              reg32 <= reg31[(2'h2):(2'h2)];
              reg33 <= {($signed(wire22) >= (~(wire27 ^ $signed((7'h42))))),
                  $signed((((wire23 <<< wire23) | ((8'ha3) ?
                      wire16 : wire24)) + wire16))};
              reg34 <= wire22;
              reg35 <= $signed($unsigned({$unsigned($unsigned((8'ha5)))}));
            end
          else
            begin
              reg31 <= $signed(((wire21[(3'h6):(3'h5)] ?
                      ($unsigned(reg28) ?
                          wire25[(3'h5):(2'h3)] : wire23) : $unsigned($unsigned(wire27))) ?
                  wire19 : (^~((wire18 << wire23) ?
                      ((7'h40) <<< reg33) : wire17[(4'he):(4'hb)]))));
              reg32 <= ((^~(wire17[(2'h3):(1'h0)] ~^ wire25)) ?
                  (($unsigned((wire26 ?
                          (8'hb5) : wire26)) ^ $unsigned((reg28 >>> reg34))) ?
                      ($signed($unsigned((8'hb9))) ^~ ($signed((8'h9c)) != (8'haa))) : (reg28 ?
                          {$signed(wire25),
                              wire26[(4'hd):(4'hc)]} : (&(!reg34)))) : {({(wire17 ?
                              reg34 : wire25),
                          ((8'hbf) < wire17)} ^ reg33[(2'h3):(1'h0)]),
                      wire22});
            end
        end
      else
        begin
          reg31 <= $signed((^~$unsigned((~$unsigned(reg28)))));
        end
      reg36 <= $unsigned(((+((wire22 ?
              reg29 : wire22) != wire22[(3'h7):(2'h2)])) ?
          wire21[(2'h2):(2'h2)] : $signed(wire19)));
      if ($unsigned(wire20[(3'h6):(3'h6)]))
        begin
          reg37 <= reg29;
        end
      else
        begin
          reg37 <= $signed(wire18[(4'ha):(4'h9)]);
          reg38 <= wire19;
          reg39 <= (-(~&reg33[(4'h8):(3'h6)]));
          reg40 <= $signed(reg36);
        end
      reg41 <= reg37;
    end
  assign wire42 = $signed((^~$signed($unsigned((~reg31)))));
  module43 #() modinst84 (.wire45(wire42), .wire47(wire27), .clk(clk), .y(wire83), .wire46(wire23), .wire44(wire19));
  always
    @(posedge clk) begin
      reg85 <= (^~({reg33, reg41} <= $signed($signed(reg37[(2'h3):(2'h3)]))));
      reg86 <= $signed(reg35[(2'h2):(1'h0)]);
      reg87 <= wire23[(3'h7):(2'h3)];
    end
  assign wire88 = $unsigned(wire24[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg89 <= ($unsigned(reg87[(1'h1):(1'h0)]) >= (+wire88[(3'h6):(1'h1)]));
    end
  assign wire90 = ({$unsigned($unsigned((wire25 ? (7'h40) : reg87))), wire23} ?
                      (~|reg33[(2'h2):(1'h1)]) : wire24[(2'h3):(1'h0)]);
endmodule

module module43
#(parameter param82 = (((!{((8'h9c) ^~ (8'h9d))}) ? {(((8'hbb) != (8'h9c)) ? ((8'hba) ? (8'hba) : (7'h42)) : ((8'ha4) ~^ (8'ha6)))} : (((~|(8'hb4)) ^ {(8'h9e)}) ? (((8'hb7) >>> (8'hbd)) ~^ ((8'ha7) ? (8'ha8) : (8'ha8))) : (~^(-(8'hb6))))) >>> ((~^(((8'hae) ? (7'h43) : (8'ha8)) <= ((8'hbd) ? (8'haf) : (8'ha9)))) >>> ((((8'ha6) < (8'hba)) ? ((8'ha4) ? (8'h9e) : (8'h9c)) : (&(8'hb2))) != (((7'h44) ? (8'hba) : (8'haa)) ? (~(8'ha7)) : ((8'hb2) ? (8'hb7) : (7'h43)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire45;
  input wire signed [(4'h8):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire [(5'h10):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg71,
                 reg70,
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
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= {$unsigned(($signed($unsigned((7'h41))) ?
              $signed((8'hb1)) : $signed((&wire45))))};
      reg49 <= {wire46[(1'h0):(1'h0)],
          $signed(($signed(wire46) ? (7'h42) : {$signed(wire45)}))};
      reg50 <= (wire44[(3'h6):(2'h3)] <= (^wire45));
    end
  assign wire51 = $unsigned(wire45[(4'hc):(2'h2)]);
  assign wire52 = (~&($unsigned(wire45) && $unsigned(wire47[(3'h6):(2'h3)])));
  assign wire53 = reg50[(2'h2):(2'h2)];
  assign wire54 = reg48;
  assign wire55 = wire52;
  assign wire56 = (~$signed($signed($signed((reg50 ? wire52 : (8'hae))))));
  always
    @(posedge clk) begin
      if (wire56[(4'hd):(4'ha)])
        begin
          reg57 <= $signed({$signed(wire47[(3'h7):(2'h2)])});
          reg58 <= $unsigned((wire53 ?
              $signed(wire51[(1'h0):(1'h0)]) : reg57[(3'h7):(2'h2)]));
          reg59 <= (~&(-{(^(wire51 ? (8'hac) : wire45)),
              reg57[(2'h3):(1'h0)]}));
          reg60 <= ((($unsigned({wire55,
              wire56}) == $unsigned(wire45)) * $unsigned(wire52)) ^~ ($unsigned($signed((wire52 ?
              wire56 : wire51))) * wire44[(3'h4):(3'h4)]));
          reg61 <= $signed($unsigned((^(wire54[(4'ha):(1'h1)] ?
              wire45 : $unsigned(wire45)))));
        end
      else
        begin
          reg57 <= wire52[(2'h2):(2'h2)];
          reg58 <= reg57;
          if (wire53[(1'h0):(1'h0)])
            begin
              reg59 <= (((8'ha7) ?
                      (({reg48} - wire44) ~^ $signed((~^reg48))) : $unsigned((~|$unsigned(reg59)))) ?
                  (($signed(wire44) ^ (~|{wire47})) ^~ $signed((-(!wire55)))) : reg58[(5'h10):(4'hb)]);
              reg60 <= reg50;
              reg61 <= wire51;
            end
          else
            begin
              reg59 <= (+(($unsigned(wire45[(3'h5):(1'h0)]) ^ {(wire52 <<< wire51)}) | wire54));
              reg60 <= (wire54[(4'h9):(4'h8)] ?
                  ($signed($signed($signed(reg48))) >>> $unsigned(((-wire45) ?
                      (~wire55) : (reg61 ?
                          reg58 : reg59)))) : {($unsigned((8'hb0)) <= wire45),
                      $signed((+wire56))});
              reg61 <= wire54;
              reg62 <= $signed(wire47);
            end
          reg63 <= (reg59[(2'h3):(1'h1)] ?
              $unsigned($signed(wire55)) : ((-((^reg57) << ((7'h44) ?
                      (8'hbc) : wire51))) ?
                  wire44 : reg60));
          reg64 <= wire51;
        end
      if (wire44[(4'h8):(2'h2)])
        begin
          reg65 <= reg63;
          reg66 <= (({wire47[(4'hc):(3'h7)]} > (($unsigned(reg64) != reg65) ^ reg50)) ^~ $unsigned({reg59[(3'h6):(2'h3)]}));
          reg67 <= ($unsigned($signed(reg66)) ?
              reg57 : (^~($unsigned((reg57 ?
                  reg66 : reg63)) <= reg49[(2'h2):(1'h0)])));
          reg68 <= $signed(reg66[(5'h10):(1'h0)]);
        end
      else
        begin
          if ($unsigned(reg67))
            begin
              reg65 <= ($unsigned($signed((^~reg61[(2'h2):(2'h2)]))) && ({(reg60[(4'hd):(1'h0)] ?
                          (|reg60) : (wire53 * reg68))} ?
                  (wire47[(2'h3):(1'h1)] ~^ wire47) : (($unsigned(reg61) && {reg58,
                          reg48}) ?
                      reg64 : wire44[(3'h4):(3'h4)])));
              reg66 <= {(!reg62), $signed(reg49[(2'h2):(1'h1)])};
            end
          else
            begin
              reg65 <= $unsigned({wire51[(3'h5):(1'h1)]});
            end
          reg67 <= wire45;
          reg68 <= ($unsigned(reg48[(2'h3):(1'h0)]) ?
              reg67[(1'h0):(1'h0)] : ({($signed(reg61) ?
                      $unsigned((8'hac)) : (|(8'h9c))),
                  ($signed((7'h40)) ?
                      $signed(wire46) : {reg63})} == (^~(wire47 ?
                  ((8'ha9) << wire47) : (reg64 ? wire46 : reg60)))));
        end
    end
  assign wire69 = wire54[(5'h10):(3'h4)];
  always
    @(posedge clk) begin
      reg70 <= $unsigned({(8'ha4)});
      reg71 <= $signed($unsigned($signed(((wire52 ?
          reg65 : wire44) >> reg61[(1'h0):(1'h0)]))));
    end
  assign wire72 = $signed(reg62);
  assign wire73 = wire54;
  assign wire74 = $unsigned(($unsigned(($signed(reg48) ?
                      $signed((8'ha7)) : (^wire69))) | $signed($unsigned({reg50,
                      (8'hb8)}))));
  assign wire75 = ((wire53 ?
                      ((8'hb4) >>> (~&(&reg68))) : (($unsigned(wire44) ?
                              $signed(reg66) : (wire44 >>> wire51)) ?
                          (reg68[(4'he):(4'hb)] < (wire52 & reg49)) : $unsigned(((8'ha8) || wire51)))) <<< wire52[(1'h1):(1'h1)]);
  assign wire76 = reg68[(3'h7):(3'h4)];
  assign wire77 = reg64;
  assign wire78 = $signed((wire69[(4'h8):(3'h6)] ^~ reg62));
  assign wire79 = ({((~^$unsigned(wire75)) ?
                              wire52 : {{reg59, wire46}, (~|reg48)})} ?
                      $unsigned(wire46[(2'h2):(1'h1)]) : reg70[(3'h4):(1'h1)]);
  assign wire80 = $unsigned(reg70[(1'h1):(1'h1)]);
  assign wire81 = (+reg50);
endmodule
