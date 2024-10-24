module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire115;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  assign y = {wire117,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire115,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire5 = $signed((wire0 ?
                     $unsigned((wire0 ^ (~|wire1))) : $signed(($signed(wire4) ?
                         (|wire3) : wire3))));
  assign wire6 = wire5[(1'h0):(1'h0)];
  assign wire7 = ({wire3[(4'he):(3'h4)], (^~(8'hbc))} ?
                     (^(+(7'h41))) : wire5[(4'hb):(4'h8)]);
  assign wire8 = $unsigned(wire5[(4'h8):(4'h8)]);
  assign wire9 = (^~wire6[(3'h4):(1'h0)]);
  assign wire10 = $unsigned(wire9[(1'h0):(1'h0)]);
  assign wire11 = (~^$signed({wire8[(1'h0):(1'h0)], wire0}));
  always
    @(posedge clk) begin
      reg12 <= (wire10 ? (+(~$unsigned((wire9 <= (8'ha6))))) : wire0);
      reg13 <= wire2[(3'h6):(1'h0)];
      reg14 <= $unsigned(((^~wire9) ?
          reg13 : ((|wire6[(3'h6):(3'h4)]) ?
              $signed(wire9) : $signed(((8'haf) ? wire9 : wire8)))));
      reg15 <= ((-wire8) >= $signed(($unsigned((reg14 ?
          wire4 : wire0)) == $unsigned(wire0))));
    end
  module16 #() modinst116 (.wire19(wire11), .clk(clk), .y(wire115), .wire17(wire10), .wire18(reg15), .wire20(wire5));
  assign wire117 = ($unsigned(reg15[(2'h2):(1'h0)]) ?
                       {(+wire5[(3'h6):(3'h5)]),
                           ((((8'hb7) ^ wire8) == wire6[(4'h9):(3'h4)]) >> $unsigned((8'h9e)))} : $signed((wire4 + wire5)));
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire41;
  reg signed [(4'he):(1'h0)] reg114 = (1'h0);
  reg [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire96,
                 wire94,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire41,
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
                 reg64,
                 reg63,
                 reg62,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire21 = (wire17 ?
                      ((!$unsigned({wire20})) ?
                          wire20 : wire19) : $unsigned($unsigned(($signed((8'hb3)) ?
                          wire18 : $unsigned(wire17)))));
  assign wire22 = $signed(wire18);
  assign wire23 = (|$signed(((!wire18[(2'h3):(2'h2)]) & ((wire21 ?
                          wire19 : wire21) ?
                      $signed(wire22) : wire20))));
  assign wire24 = ((-wire23) ? (~$signed(wire17)) : wire22[(3'h6):(3'h4)]);
  module25 #() modinst42 (.wire26(wire23), .wire30(wire24), .wire29(wire19), .y(wire41), .clk(clk), .wire28(wire18), .wire27(wire20));
  assign wire43 = {wire20, {$unsigned(wire24), wire18[(4'h9):(2'h3)]}};
  assign wire44 = $signed((({wire18[(1'h1):(1'h0)]} ?
                          wire22 : (wire21[(2'h3):(2'h3)] == wire24[(4'ha):(4'ha)])) ?
                      wire43[(1'h1):(1'h0)] : wire18));
  assign wire45 = ((wire24[(4'hc):(3'h5)] ^ (&(~$unsigned(wire44)))) ?
                      ((!$signed($signed(wire22))) < wire17[(3'h7):(2'h3)]) : {wire24[(1'h0):(1'h0)],
                          wire41[(1'h1):(1'h1)]});
  assign wire46 = (!$unsigned((wire41[(1'h0):(1'h0)] <= ({wire22} ?
                      wire44 : (~^wire18)))));
  assign wire47 = $unsigned((wire45 ?
                      $unsigned(($signed(wire20) ?
                          wire20[(4'hc):(1'h1)] : $unsigned((8'ha5)))) : $signed($unsigned($signed((8'hac))))));
  assign wire48 = $signed($signed($signed((((8'hb5) ? wire18 : wire43) ?
                      wire24[(4'hd):(1'h1)] : wire45))));
  always
    @(posedge clk) begin
      if (wire45[(3'h4):(3'h4)])
        begin
          reg49 <= $signed(wire20[(3'h5):(1'h1)]);
          reg50 <= $unsigned((~|(-{(wire41 ? wire24 : wire22), {(7'h40)}})));
        end
      else
        begin
          reg49 <= {{({$unsigned(wire44)} <<< ($unsigned(wire41) ^ ((8'h9e) + wire45))),
                  (wire22[(1'h0):(1'h0)] ?
                      ((!(8'hb0)) != (^wire20)) : (-(^~wire44)))},
              (wire22[(3'h5):(3'h4)] ?
                  wire20 : ($unsigned(wire24) ?
                      (wire21 ? wire41 : (reg49 ? (8'hba) : wire17)) : (wire19 ?
                          (!wire22) : wire22)))};
          reg50 <= wire18[(3'h6):(2'h2)];
          reg51 <= $signed(reg50[(5'h14):(5'h10)]);
          reg52 <= $signed(wire44[(3'h4):(1'h1)]);
          reg53 <= $unsigned(($unsigned(wire22[(3'h4):(1'h1)]) ?
              (~^({wire17} & wire46)) : (reg50[(5'h11):(1'h0)] ?
                  $signed(wire24[(3'h6):(2'h2)]) : $unsigned($unsigned((8'hb4))))));
        end
      reg54 <= ({(wire17 ^~ $signed(wire43[(3'h7):(3'h7)])),
              $unsigned((|$signed(wire43)))} ?
          (-$unsigned(wire41)) : (reg50 ?
              (wire21 & wire22[(2'h2):(1'h0)]) : (^$signed(((7'h44) << reg49)))));
      reg55 <= (((wire48[(5'h10):(4'hd)] | (!(&(8'ha2)))) * (+$signed((wire22 >>> (8'ha2))))) ?
          (($signed(wire19[(4'ha):(1'h1)]) ?
              ($signed(wire47) ? (wire44 <= reg53) : (^(8'ha9))) : ((wire23 ?
                      wire19 : reg51) ?
                  (|reg52) : ((8'hbe) ?
                      (7'h43) : reg52))) << wire17[(3'h4):(2'h3)]) : ((((wire24 ?
                      wire47 : reg52) >= ((8'had) >>> wire20)) ?
                  $signed(wire22[(2'h3):(2'h3)]) : (!(+wire20))) ?
              reg51 : $signed(reg49[(4'hd):(4'hc)])));
    end
  assign wire56 = wire20[(4'he):(3'h4)];
  assign wire57 = $signed(wire24);
  assign wire58 = wire44[(3'h6):(2'h2)];
  assign wire59 = ($signed((~|($signed(reg52) >> reg52[(4'hf):(4'hb)]))) ^ (wire48 ^~ (($unsigned(reg54) ?
                          wire22[(3'h4):(2'h2)] : (reg52 || wire41)) ?
                      {reg53[(4'ha):(1'h1)],
                          wire24} : $unsigned(wire46[(2'h3):(1'h1)]))));
  assign wire60 = (8'hbf);
  assign wire61 = (8'hab);
  always
    @(posedge clk) begin
      reg62 <= ($unsigned(($unsigned(wire57[(1'h1):(1'h0)]) ^~ (-wire17[(3'h6):(1'h1)]))) ?
          ((8'h9d) <= {(wire23 ? (~wire44) : $signed(wire19)),
              reg49}) : (wire46[(3'h5):(3'h5)] >> {reg55,
              ((wire23 ^~ wire47) ?
                  (wire58 ? wire18 : wire23) : (reg49 * reg54))}));
      reg63 <= wire46[(1'h0):(1'h0)];
      reg64 <= (-$unsigned((~^(^~(wire46 - reg62)))));
    end
  assign wire65 = reg51;
  module66 #() modinst95 (.wire68(wire56), .wire67(wire45), .wire69(wire23), .clk(clk), .wire70(wire21), .y(wire94));
  assign wire96 = wire23;
  always
    @(posedge clk) begin
      reg97 <= (8'hae);
      if ((8'haa))
        begin
          if ((reg55 ?
              (wire41[(2'h2):(1'h0)] >> $unsigned(((reg52 <<< wire17) ?
                  {wire17} : reg50))) : wire18[(1'h0):(1'h0)]))
            begin
              reg98 <= (~&(wire65 + wire20[(3'h4):(3'h4)]));
              reg99 <= $signed((wire43 * $unsigned((~$unsigned(wire60)))));
              reg100 <= $signed($signed({(+reg55), wire44}));
            end
          else
            begin
              reg98 <= wire58;
              reg99 <= ($unsigned((!{(^~wire22)})) || ($signed(wire23[(4'hb):(2'h3)]) ?
                  {$unsigned((wire18 >>> reg54))} : $unsigned(($unsigned(reg100) ?
                      $signed(wire47) : $unsigned(wire96)))));
              reg100 <= (8'ha3);
              reg101 <= ((reg62[(4'hf):(4'ha)] >>> wire58[(4'hf):(3'h4)]) ?
                  (((^~(wire20 | wire19)) ? reg63[(5'h10):(4'ha)] : wire58) ?
                      {((~^wire96) || ((8'ha4) | wire65))} : wire20) : $signed(($unsigned($signed(reg51)) | (|$signed(wire61)))));
              reg102 <= $signed(((!wire58[(2'h3):(1'h0)]) == (+wire56[(4'ha):(3'h5)])));
            end
          reg103 <= wire65;
        end
      else
        begin
          if ($unsigned((~reg53)))
            begin
              reg98 <= $signed($signed(((-{reg102}) ?
                  $unsigned($unsigned(wire17)) : reg97)));
              reg99 <= (~$signed({$unsigned((reg102 ? wire47 : wire94))}));
            end
          else
            begin
              reg98 <= ($unsigned(((reg97[(4'hb):(2'h3)] ?
                      {reg54} : {reg100, wire48}) < {(~|reg98)})) ?
                  $signed($unsigned((~(|reg97)))) : (~&(^~((wire19 ?
                          reg98 : reg102) ?
                      (wire58 ? wire96 : reg64) : wire20[(3'h4):(2'h2)]))));
            end
          reg100 <= ($signed($unsigned((&$unsigned(wire94)))) & reg52[(4'he):(4'ha)]);
          if ($unsigned(({$unsigned(wire41[(2'h2):(1'h1)]),
              (&wire47)} > $unsigned(wire96[(2'h2):(2'h2)]))))
            begin
              reg101 <= $unsigned((~&($signed(wire65) ^ reg101)));
              reg102 <= (reg103 ?
                  reg97 : ($signed((!(~^(8'ha0)))) && ($unsigned((wire17 <<< reg55)) ?
                      ($unsigned(wire47) >>> wire57) : wire22)));
              reg103 <= (8'ha7);
              reg104 <= (!$signed(reg62[(4'hd):(2'h2)]));
            end
          else
            begin
              reg101 <= wire22;
              reg102 <= (reg55 ^~ wire94[(2'h3):(1'h0)]);
              reg103 <= wire96[(5'h12):(1'h0)];
            end
          if ({$signed($signed(($unsigned(wire48) ?
                  ((8'ha9) ? (7'h40) : wire60) : wire94)))})
            begin
              reg105 <= reg54;
              reg106 <= $signed(wire21[(5'h15):(5'h13)]);
            end
          else
            begin
              reg105 <= (-wire24[(5'h12):(1'h1)]);
              reg106 <= wire47[(1'h1):(1'h0)];
              reg107 <= wire19;
            end
        end
      reg108 <= ((&$signed($signed($unsigned((8'hae))))) >>> $signed($signed(wire18)));
      reg109 <= $unsigned(reg98[(1'h0):(1'h0)]);
      if (reg64)
        begin
          reg110 <= (-((8'hac) ?
              (~^((~^(8'hb8)) || $signed(reg103))) : reg102));
          reg111 <= ((((~^$signed(reg110)) * (^~((8'hbf) >> reg100))) ?
                  {wire22[(3'h6):(3'h5)]} : $signed((&$unsigned(wire48)))) ?
              {($unsigned((reg102 ? reg53 : (8'ha2))) <= (~(wire23 ?
                      reg64 : wire17))),
                  (wire24[(5'h10):(3'h7)] ?
                      (+reg98) : wire24[(4'hf):(3'h4)])} : $signed(reg52));
        end
      else
        begin
          if ($signed($unsigned((~wire65[(1'h0):(1'h0)]))))
            begin
              reg110 <= $signed((!wire94[(1'h0):(1'h0)]));
              reg111 <= ((~$unsigned($unsigned(reg105[(2'h3):(2'h3)]))) > $unsigned($unsigned($signed((wire22 ?
                  wire24 : (8'hac))))));
              reg112 <= (~&(wire44 << $unsigned(($unsigned((8'hac)) || (reg97 ?
                  (8'h9c) : reg97)))));
            end
          else
            begin
              reg110 <= (reg103 ?
                  (~&$signed((reg64 ?
                      $signed(wire23) : $signed(wire96)))) : (((wire24[(3'h6):(1'h1)] ?
                          $signed(reg49) : $unsigned(wire20)) ?
                      ($signed(wire19) ?
                          (reg103 ?
                              (8'hbc) : wire17) : reg110[(4'hc):(4'h9)]) : ($signed(wire22) << reg104[(3'h7):(2'h2)])) - ((reg109 ~^ (-wire41)) ?
                      $signed((!wire41)) : $signed(reg105))));
              reg111 <= {(reg100 && wire44[(2'h2):(1'h1)]),
                  (wire24[(5'h11):(1'h0)] ?
                      reg54 : (wire19 ^ $unsigned(wire44)))};
              reg112 <= (reg111 << reg63);
              reg113 <= reg106[(3'h4):(2'h2)];
              reg114 <= ({(~|{$signed(wire41)}),
                      (reg99 == $unsigned(reg113[(3'h5):(3'h4)]))} ?
                  $unsigned((~&reg110[(3'h4):(3'h4)])) : wire46[(1'h1):(1'h1)]);
            end
        end
    end
endmodule

module module66
#(parameter param92 = (&(((((8'ha2) | (8'hb6)) ? ((7'h40) ? (8'hb9) : (8'ha4)) : (~(8'hac))) ? (&(~|(8'hab))) : {{(7'h40), (7'h44)}, ((8'ha2) ? (8'hbc) : (8'ha6))}) | (({(8'h9c)} || ((8'ha2) - (8'h9f))) ? {(|(8'hb0)), (~&(8'h9d))} : (-((7'h41) ? (8'ha0) : (8'hb4)))))), 
parameter param93 = param92)
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire [(4'h9):(1'h0)] wire69;
  input wire [(4'he):(1'h0)] wire68;
  input wire signed [(3'h7):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire91;
  wire [(4'he):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire85,
                 wire84,
                 wire81,
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
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire71 = $signed(wire67[(3'h4):(1'h1)]);
  assign wire72 = wire69;
  assign wire73 = wire72[(1'h0):(1'h0)];
  assign wire74 = wire73[(4'hb):(3'h7)];
  assign wire75 = (~$signed($signed(((~|wire67) ?
                      (~&wire67) : (wire71 ? wire71 : wire70)))));
  assign wire76 = (^~wire68[(4'ha):(4'h8)]);
  assign wire77 = ((((~^{wire68, wire71}) ?
                          $unsigned(wire68) : (^wire70[(5'h13):(3'h7)])) << ($signed((^wire70)) ?
                          $signed((wire69 ? wire73 : wire72)) : wire75)) ?
                      wire70 : wire72);
  assign wire78 = {$unsigned(wire77[(4'ha):(1'h1)]),
                      {(wire77 >> $unsigned(wire75))}};
  assign wire79 = $signed(((wire78[(1'h0):(1'h0)] | (7'h43)) ^ $unsigned({(wire75 ?
                          wire68 : wire70)})));
  assign wire80 = (~(wire76[(2'h2):(1'h0)] || (({wire79} <<< wire69[(2'h3):(2'h3)]) ?
                      ($signed(wire79) | (&wire67)) : (((8'ha2) >> wire67) >>> ((7'h42) ^~ (8'h9e))))));
  assign wire81 = ($unsigned((~|((wire73 ? wire78 : wire68) - (wire68 ?
                      (8'hb1) : wire72)))) ^~ (^~wire80));
  always
    @(posedge clk) begin
      reg82 <= ($unsigned(($signed((-wire71)) ?
          ((wire67 ? (7'h44) : wire80) <= {wire67, wire74}) : (^~(wire78 ?
              (8'ha1) : wire76)))) <<< $signed($unsigned({{(8'haf), wire69},
          wire71})));
      reg83 <= $unsigned((((wire67 <= wire69[(3'h6):(1'h0)]) ?
          wire79 : $signed((wire79 ? wire79 : wire80))) == {wire75}));
    end
  assign wire84 = wire69[(1'h0):(1'h0)];
  assign wire85 = wire71[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg86 <= reg83[(4'h9):(2'h2)];
      reg87 <= wire70[(3'h6):(1'h1)];
      reg88 <= (~|wire75);
    end
  assign wire89 = {$signed($signed(wire70[(5'h14):(3'h7)]))};
  assign wire90 = (wire73 ?
                      ($signed(wire78[(3'h6):(1'h1)]) >= $unsigned(($unsigned((8'hb1)) ?
                          ((8'hb9) ? (7'h44) : reg88) : (reg82 ?
                              wire69 : (7'h41))))) : (wire72 ?
                          {wire70} : wire73));
  assign wire91 = ($unsigned({(wire74 ? $unsigned(wire72) : (~^wire71))}) ?
                      reg87[(4'h8):(3'h7)] : wire89);
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire31;
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire31,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = (!$unsigned($unsigned((wire26 ?
                      (wire27 < (8'h9e)) : (wire27 ^ wire29)))));
  always
    @(posedge clk) begin
      reg32 <= $signed($signed($unsigned($unsigned((~&(8'had))))));
      reg33 <= (wire27 ? wire27 : wire28[(4'hb):(3'h6)]);
      reg34 <= {$signed((~^$unsigned((+wire27)))), $unsigned(wire26)};
      reg35 <= wire29[(1'h1):(1'h0)];
    end
  assign wire36 = wire27;
  assign wire37 = wire29[(5'h10):(4'ha)];
  assign wire38 = wire26[(2'h2):(1'h0)];
  assign wire39 = ($signed(wire38) ?
                      (~($unsigned(wire37) ?
                          $signed({reg35}) : (((8'h9c) ? reg32 : (8'hb3)) ?
                              wire30 : wire27))) : $signed(wire38));
  assign wire40 = {($signed($unsigned((wire36 ?
                          reg33 : wire29))) != ((wire28[(1'h0):(1'h0)] ^ (|reg34)) - (+(wire39 >> reg35))))};
endmodule
