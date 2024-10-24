module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(4'he):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire75;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned((((^(8'hb0)) >>> $unsigned(wire1)) ?
                     (wire1 ? $signed((8'hb3)) : ((8'ha4) & wire3)) : ((wire3 ?
                         wire3 : wire3) ^ $unsigned(wire1)))));
  assign wire5 = $signed((wire2 ?
                     $unsigned(((!wire3) ?
                         wire3 : wire4[(2'h2):(2'h2)])) : (~(~{wire4,
                         wire1}))));
  assign wire6 = $signed((($signed((wire0 << wire3)) > ($unsigned(wire4) | wire5)) ?
                     (~wire5[(1'h0):(1'h0)]) : {(((8'ha7) ?
                             wire2 : wire1) ^ wire5)}));
  assign wire7 = wire6[(3'h5):(1'h0)];
  assign wire8 = $unsigned((wire4 ?
                     $signed($signed((wire5 && wire5))) : wire4));
  assign wire9 = $signed(wire4);
  assign wire10 = $signed($signed($unsigned($signed(wire4))));
  assign wire11 = (~^(+wire8));
  assign wire12 = wire8;
  module13 #() modinst76 (.wire14(wire7), .clk(clk), .wire15(wire1), .wire17(wire2), .y(wire75), .wire16(wire5));
  assign wire77 = wire11[(1'h1):(1'h1)];
  assign wire78 = $unsigned(wire10);
  assign wire79 = (((~&$unsigned(wire0[(4'hf):(2'h2)])) > ($unsigned($signed(wire6)) ?
                          wire5[(2'h2):(2'h2)] : ((wire10 ? (8'hb0) : wire9) ?
                              wire78 : $signed(wire8)))) ?
                      $signed(wire4) : ($signed($signed((wire5 * wire8))) <= (^~$signed($unsigned(wire1)))));
  assign wire80 = wire10[(2'h3):(1'h0)];
  assign wire81 = (~|(wire5[(4'h9):(3'h7)] | wire80));
  assign wire82 = {$signed((($unsigned(wire4) ^~ wire6) ?
                          (wire81[(4'h9):(3'h5)] ?
                              (wire4 >>> wire9) : $signed(wire2)) : wire79[(1'h1):(1'h0)]))};
  assign wire83 = ($unsigned(wire82[(4'h9):(3'h5)]) >> $signed(wire80[(3'h4):(1'h0)]));
  assign wire84 = (~|$signed((8'hb6)));
  assign wire85 = {(-wire5[(4'ha):(3'h6)]), $unsigned(wire10)};
  assign wire86 = wire83;
  assign wire87 = wire81;
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  assign y = {wire74,
                 wire72,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire19,
                 wire18,
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
                 (1'h0)};
  assign wire18 = $unsigned($unsigned($signed(($unsigned(wire17) ?
                      wire14 : wire17[(4'hb):(2'h3)]))));
  assign wire19 = (-$unsigned(wire17[(4'h8):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire19[(1'h0):(1'h0)])
        begin
          reg20 <= ((~$signed(wire17)) ?
              (wire18[(5'h12):(1'h1)] ?
                  (^((&(8'hbf)) ?
                      (wire14 && wire16) : {wire16})) : wire16) : $unsigned({$signed((~^(8'hb5))),
                  $signed($unsigned(wire15))}));
          reg21 <= $unsigned(((|(8'hb5)) & $signed(wire19)));
          reg22 <= {((-wire14) ? (8'hb4) : $signed(wire14))};
        end
      else
        begin
          reg20 <= ($signed((~|((~&wire14) + (reg22 ?
              (8'hb1) : wire17)))) && (8'haa));
          reg21 <= ({$signed($signed(reg21[(1'h1):(1'h0)])),
              (!$unsigned($unsigned(reg22)))} <<< wire17);
          reg22 <= ((8'haf) ?
              wire14 : ($signed($unsigned(reg22[(4'hb):(3'h6)])) ?
                  ((-$unsigned(wire15)) ?
                      (wire15[(1'h1):(1'h0)] <<< reg20) : ((reg20 == wire19) ?
                          (wire18 ? (8'hbe) : wire16) : (reg22 ?
                              wire17 : wire16))) : (+((8'haa) || {reg20,
                      wire18}))));
        end
      reg23 <= ((reg20[(1'h1):(1'h1)] == (8'hba)) <<< wire14[(4'h9):(3'h5)]);
      reg24 <= $unsigned($signed(wire19[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg25 <= (^~($signed((!(^~wire15))) ?
          ((reg21[(2'h3):(1'h0)] ? (!wire15) : (reg23 < reg22)) ?
              wire17 : $unsigned((^reg22))) : reg20[(1'h1):(1'h0)]));
      if (wire19)
        begin
          reg26 <= $unsigned((~&reg21));
          reg27 <= ({$signed(($signed(reg23) ?
                  $unsigned(wire17) : (reg25 ^ wire18))),
              $unsigned($signed(wire18))} <<< (&(($signed(wire17) ?
              (reg20 ?
                  reg26 : wire19) : (reg20 != wire19)) >> (~(reg24 + wire18)))));
          reg28 <= $signed(reg24);
          reg29 <= wire19[(2'h2):(1'h1)];
        end
      else
        begin
          if ($signed($unsigned((+wire17[(3'h5):(3'h5)]))))
            begin
              reg26 <= (!{{reg24[(2'h2):(2'h2)]}});
              reg27 <= reg29[(1'h1):(1'h1)];
              reg28 <= (~&$signed((~&$signed((wire18 >>> reg20)))));
              reg29 <= $signed($unsigned((wire15[(3'h4):(2'h3)] >>> ((8'ha6) ?
                  $unsigned(reg25) : $signed(reg27)))));
              reg30 <= (8'had);
            end
          else
            begin
              reg26 <= ($signed({reg21, (reg24 <= ((8'ha5) ? reg24 : reg23))}) ?
                  reg26 : ((reg21[(3'h6):(3'h6)] ?
                      ((reg28 ? reg25 : reg27) ?
                          (8'h9f) : $unsigned(wire18)) : ($unsigned(reg28) ?
                          (reg22 | wire18) : reg24[(3'h5):(1'h1)])) && reg27[(1'h0):(1'h0)]));
              reg27 <= reg27[(2'h3):(1'h0)];
              reg28 <= $unsigned((((reg24 > (reg28 || reg21)) ?
                      $unsigned($unsigned(reg27)) : reg23) ?
                  {(~|(-reg28))} : $signed((~{(8'ha4)}))));
            end
          reg31 <= wire14;
          reg32 <= wire15;
          if ((^~$unsigned(($unsigned(reg28[(4'hf):(1'h0)]) >= ((wire19 & (8'ha9)) ~^ {reg27})))))
            begin
              reg33 <= wire17[(3'h5):(1'h1)];
            end
          else
            begin
              reg33 <= (reg23 * $signed(reg20[(3'h6):(3'h4)]));
            end
          reg34 <= (8'h9c);
        end
    end
  assign wire35 = $unsigned(reg20[(3'h4):(2'h2)]);
  assign wire36 = {({($signed(reg27) ? (reg22 >>> (8'ha8)) : {reg22}),
                          $signed(reg29[(1'h1):(1'h0)])} >>> $unsigned({$signed(wire19),
                          (wire17 ? reg28 : reg26)})),
                      $unsigned(reg33)};
  assign wire37 = wire15[(3'h5):(3'h4)];
  assign wire38 = $unsigned(((|(~(-(7'h44)))) ?
                      ($unsigned({wire15}) ^ $unsigned({reg28,
                          reg20})) : reg34[(1'h0):(1'h0)]));
  module39 #() modinst73 (wire72, clk, reg32, wire14, reg21, reg27, wire17);
  assign wire74 = $unsigned(wire15);
endmodule

module module39
#(parameter param70 = ((((~&{(7'h40), (8'ha6)}) || (8'hac)) != (8'hbe)) ? ({(7'h43)} ? {(((8'hb8) ? (8'ha3) : (7'h41)) ? ((8'hae) ? (8'ha4) : (8'ha1)) : ((8'had) ? (8'haf) : (8'ha3))), {((8'hab) ? (8'had) : (8'hb0))}} : (-(+((8'hb9) | (8'hb3))))) : (((~|(~(8'hb1))) != (((8'had) ? (8'hbe) : (8'hb7)) + (8'had))) ? (&({(8'haf)} ? {(8'hab)} : (|(8'hbf)))) : (~((!(8'hbe)) != ((8'hae) >>> (8'hb2)))))), 
parameter param71 = (8'hba))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire44;
  input wire [(4'hc):(1'h0)] wire43;
  input wire signed [(5'h10):(1'h0)] wire42;
  input wire signed [(4'ha):(1'h0)] wire41;
  input wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire45 = ({(|((wire43 >= (8'hba)) & wire42[(4'h8):(1'h1)]))} ?
                      ((~|$signed($signed(wire40))) ?
                          (+$signed($unsigned(wire40))) : ((+$signed(wire41)) - ({(8'hb7)} ?
                              (!wire43) : {wire42}))) : wire41[(3'h4):(3'h4)]);
  assign wire46 = $signed($unsigned(($unsigned(wire41[(3'h4):(2'h2)]) ?
                      wire43 : ((wire41 >= wire40) && (wire41 ?
                          wire41 : wire40)))));
  assign wire47 = (wire44[(4'h9):(1'h1)] ?
                      wire42 : ($signed({wire44[(4'hc):(2'h3)]}) ^ ((wire42[(4'h8):(4'h8)] ?
                              (wire44 ? wire42 : wire46) : (wire40 != wire45)) ?
                          wire40[(4'hb):(4'hb)] : wire43[(4'h9):(2'h3)])));
  assign wire48 = {wire40[(3'h5):(2'h3)], (~&wire41)};
  assign wire49 = $unsigned(wire44);
  assign wire50 = $signed($signed((wire47 != ((^(8'hbf)) ?
                      $signed(wire46) : wire48))));
  assign wire51 = ((~&wire41[(1'h1):(1'h0)]) ?
                      ((wire45[(5'h13):(1'h1)] ~^ (8'hb1)) ?
                          (((+wire45) > wire41[(3'h6):(1'h0)]) ^ ({wire47,
                                  wire43} ?
                              wire50[(3'h4):(1'h0)] : wire42)) : (wire49 ?
                              wire49[(5'h10):(3'h7)] : wire40[(3'h5):(1'h1)])) : (wire48[(1'h1):(1'h1)] ?
                          $unsigned($unsigned((wire44 >= wire46))) : ($unsigned($unsigned(wire46)) ?
                              $unsigned((wire44 ? wire45 : wire46)) : wire42)));
  assign wire52 = (8'ha9);
  assign wire53 = (^~(-(wire51 ?
                      wire49[(3'h4):(3'h4)] : (|((8'hba) ? wire47 : wire49)))));
  assign wire54 = ({wire52, wire51} ?
                      {$signed(((|wire42) ?
                              (wire53 ?
                                  wire53 : wire53) : {wire53}))} : $unsigned((wire45 ^ $unsigned({wire48}))));
  assign wire55 = (wire45 ?
                      wire45[(3'h4):(2'h3)] : {(wire49 ?
                              ($unsigned(wire49) ?
                                  (+wire53) : wire41[(4'h9):(4'h9)]) : (^(8'h9f))),
                          $unsigned(wire42[(2'h2):(1'h0)])});
  assign wire56 = (^(!{$signed($signed((8'ha1)))}));
  always
    @(posedge clk) begin
      if (wire50[(3'h6):(2'h2)])
        begin
          reg57 <= $unsigned($signed({wire50[(4'hb):(2'h3)],
              ((wire41 && wire47) ? (~^wire42) : (wire55 < (8'hb9)))}));
          reg58 <= $signed(((&$signed($unsigned(wire41))) ?
              ($signed((-wire42)) ?
                  $signed((wire52 ^~ wire51)) : (!$signed(wire56))) : (!(^wire52[(4'he):(2'h3)]))));
        end
      else
        begin
          reg57 <= $unsigned((wire46[(3'h5):(1'h1)] ?
              ((~&reg57[(3'h4):(2'h2)]) ?
                  (wire41 >>> (~|wire55)) : wire40) : (!reg58)));
          if ((!(wire51[(1'h1):(1'h1)] ?
              (8'hbe) : ($signed($signed(wire46)) ?
                  (7'h44) : ((wire54 ? wire46 : reg58) ?
                      $signed(reg58) : wire42[(3'h4):(3'h4)])))))
            begin
              reg58 <= (-$unsigned({(wire51 ~^ (!(8'hbd))),
                  (reg57 ? (wire44 > wire42) : $signed(wire46))}));
              reg59 <= (($signed({wire52}) ^ $unsigned(({wire50} ?
                      {(8'hbd)} : $signed(wire42)))) ?
                  (wire53 < {(wire56[(2'h3):(2'h3)] ?
                          $unsigned(wire41) : $signed(wire40)),
                      ((wire43 ^~ wire46) ^ wire43[(4'h8):(3'h6)])}) : (wire42[(1'h1):(1'h0)] ?
                      $signed($unsigned((wire56 | reg58))) : $unsigned(wire43)));
            end
          else
            begin
              reg58 <= ((({reg59, $unsigned(reg58)} >> $unsigned((+wire50))) ?
                  $unsigned(wire45[(4'h9):(4'h9)]) : $signed({wire42[(4'h8):(4'h8)],
                      wire53})) <<< $unsigned((((!wire49) ?
                  (!wire43) : wire41[(1'h1):(1'h0)]) | (^~{wire54, wire55}))));
              reg59 <= (wire44 && $signed(wire41));
              reg60 <= $unsigned(wire48);
            end
          reg61 <= reg60;
        end
      reg62 <= ((wire52 ?
          $signed($unsigned((wire50 ?
              wire40 : wire49))) : reg57) << reg60[(2'h3):(2'h2)]);
      reg63 <= ($signed($unsigned((!((8'hb7) < wire45)))) ?
          (~|$unsigned(wire51[(1'h1):(1'h0)])) : $unsigned((wire40[(3'h5):(3'h5)] < wire43[(4'hb):(3'h5)])));
      reg64 <= (((((~&wire50) >= (&wire52)) ?
              reg61[(4'ha):(3'h6)] : ((reg59 ?
                  wire45 : (8'ha5)) ^ wire56)) * reg57[(1'h0):(1'h0)]) ?
          (((((8'hbb) < wire51) ?
              (wire41 ^ wire46) : wire49[(5'h11):(1'h0)]) >>> (~^(~reg61))) ^~ ((+wire46[(4'he):(2'h3)]) < wire40)) : wire45[(1'h0):(1'h0)]);
      reg65 <= wire56;
    end
  assign wire66 = ($signed(((!{wire55}) << $unsigned($signed(reg57)))) == $unsigned((~^((wire54 ?
                      wire51 : wire53) ~^ (~wire43)))));
  assign wire67 = $unsigned($signed((8'hac)));
  assign wire68 = (({(~{(7'h40)}), reg60} ?
                      (-(reg65[(4'h9):(2'h3)] - wire66[(5'h10):(3'h5)])) : (&wire56)) << $signed($signed(wire44)));
  assign wire69 = ((reg58 << $signed((~(wire56 == reg60)))) <= $signed($unsigned($unsigned((8'hb3)))));
endmodule
