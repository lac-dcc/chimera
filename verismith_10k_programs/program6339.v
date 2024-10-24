module top
#(parameter param97 = (((7'h44) >= ((&((8'had) ? (8'ha2) : (8'hb9))) ? ((~|(7'h40)) ? (^~(8'ha7)) : (8'hba)) : (+((8'hbe) > (8'haa))))) ~^ {(-{((8'h9c) ? (8'h9e) : (8'haf))}), {{(~&(8'hb7))}, {((8'h9f) < (8'hb4))}}}), 
parameter param98 = ({(((param97 + param97) >> (param97 >= param97)) >>> ((param97 <<< param97) - (param97 ? param97 : param97))), (^(!((8'h9d) ? param97 : param97)))} ? (~param97) : param97))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire96;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = (~^$unsigned(wire4[(1'h0):(1'h0)]));
  assign wire7 = $signed(wire1);
  module8 #() modinst92 (wire91, clk, wire5, wire0, wire2, wire4);
  assign wire93 = ((wire4 >> $unsigned(($unsigned((7'h43)) ?
                          $signed(wire5) : (wire3 - wire0)))) ?
                      wire2 : $signed(wire1[(3'h7):(3'h6)]));
  assign wire94 = wire1[(2'h3):(1'h1)];
  assign wire95 = $unsigned({$signed({wire0[(2'h2):(1'h1)]}),
                      wire4[(1'h1):(1'h1)]});
  assign wire96 = wire7;
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire90,
                 wire88,
                 wire34,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = (((~|((wire9 ? wire11 : wire11) ?
                      wire9[(1'h1):(1'h1)] : (!wire10))) - (((wire12 ?
                          wire12 : wire9) ?
                      wire11 : wire11[(1'h1):(1'h1)]) * ($signed(wire10) - $unsigned(wire12)))) <= wire12);
  assign wire14 = $unsigned(($unsigned(((8'hae) ~^ wire11[(2'h2):(1'h0)])) ?
                      wire9[(1'h0):(1'h0)] : (wire13[(3'h5):(3'h5)] ?
                          (^$signed((8'ha9))) : (^~$signed(wire13)))));
  assign wire15 = wire11[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= (8'hb8);
      reg17 <= $signed(wire12[(3'h6):(3'h4)]);
    end
  assign wire18 = ((8'ha2) ?
                      $signed(({((8'ha8) ? (8'hab) : wire11),
                          wire9} <= {{wire13}})) : wire10[(3'h4):(2'h3)]);
  assign wire19 = ((~$unsigned((|wire15))) != (^(~$signed(wire12[(3'h5):(3'h4)]))));
  assign wire20 = ($signed({(^~(wire11 <= wire18))}) + wire10[(3'h6):(3'h4)]);
  assign wire21 = $signed(reg17[(4'h9):(1'h1)]);
  assign wire22 = $signed((~&wire19[(3'h5):(3'h4)]));
  assign wire23 = wire11;
  assign wire24 = (wire12 ?
                      wire18[(1'h0):(1'h0)] : {({{wire13}} & ({wire18} && (8'hb0)))});
  assign wire25 = reg17[(4'hc):(3'h6)];
  always
    @(posedge clk) begin
      reg26 <= (8'ha6);
      reg27 <= $signed({wire23[(2'h2):(2'h2)]});
      reg28 <= {((wire19 ~^ {(wire12 ?
                  wire18 : wire19)}) > $unsigned(wire20[(4'hc):(3'h7)]))};
      if (wire21[(4'ha):(2'h2)])
        begin
          reg29 <= wire20;
        end
      else
        begin
          reg29 <= (+$signed(wire15));
          reg30 <= $signed((|(!($unsigned(wire11) ?
              wire20[(1'h0):(1'h0)] : $unsigned(wire21)))));
          reg31 <= (({(~|$signed(reg29))} ?
              (7'h43) : (~|(&(wire22 || reg26)))) <= $unsigned(wire15));
          reg32 <= reg29;
        end
      reg33 <= wire24[(2'h3):(1'h0)];
    end
  assign wire34 = $signed($signed(reg29));
  always
    @(posedge clk) begin
      reg35 <= wire13[(3'h6):(3'h6)];
      reg36 <= wire10;
      if ((reg32[(3'h7):(3'h6)] ?
          $unsigned((wire25 <= ((reg27 * (8'hb3)) && reg16[(3'h5):(2'h2)]))) : $signed(($signed($signed(reg31)) * wire18))))
        begin
          reg37 <= (reg29 - $signed({(wire13[(2'h2):(1'h1)] ?
                  (reg30 ? wire13 : wire25) : (wire22 >>> wire13))}));
          reg38 <= $signed((wire23[(1'h1):(1'h1)] < $signed($signed((reg29 ?
              (8'hbf) : wire22)))));
          if (reg36)
            begin
              reg39 <= wire21[(5'h11):(4'h9)];
              reg40 <= ($unsigned({(reg39 ? (^~(7'h42)) : $signed(reg33))}) ?
                  $unsigned((reg39 >> (wire34[(3'h6):(3'h6)] >> $signed(wire13)))) : wire20[(4'hb):(3'h6)]);
              reg41 <= (+($unsigned((reg17 ? (^reg31) : $unsigned(reg27))) ?
                  reg38[(2'h2):(1'h1)] : wire23[(3'h5):(1'h0)]));
            end
          else
            begin
              reg39 <= {wire20, reg17[(4'h9):(3'h7)]};
              reg40 <= ((reg31[(4'hb):(1'h1)] && (~&(reg27 ^~ (8'hae)))) + {($signed((reg37 <= reg27)) ?
                      {$signed(wire21),
                          wire23[(3'h7):(3'h7)]} : reg30[(4'h8):(3'h4)])});
            end
          reg42 <= ($unsigned((-{(wire19 ?
                  wire23 : reg26)})) ^~ ($signed(((^wire20) ?
                  (|wire15) : (reg32 >= reg32))) ?
              (8'haa) : $signed(({wire24} >> (&reg41)))));
        end
      else
        begin
          reg37 <= $unsigned(($unsigned($unsigned((wire20 <= reg37))) == (~^$unsigned((~&wire19)))));
          reg38 <= wire19;
          reg39 <= (wire34[(1'h1):(1'h0)] != {(8'ha0),
              $signed((~(wire15 == reg32)))});
          reg40 <= $signed(wire20[(4'hd):(3'h6)]);
        end
    end
  module43 #() modinst89 (wire88, clk, reg29, wire22, wire20, reg35);
  assign wire90 = reg36;
endmodule

module module43
#(parameter param86 = (-((~^(((8'ha9) ^ (8'hac)) ? ((8'hb8) * (8'hb5)) : ((8'ha1) ? (8'ha7) : (8'hbf)))) ? ((~((8'hbd) <= (8'haa))) * {((8'ha6) == (8'haf)), ((8'hbf) | (8'hb5))}) : (|(-((8'hba) ^~ (8'ha6)))))), 
parameter param87 = param86)
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire signed [(5'h14):(1'h0)] wire46;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(5'h10):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire70,
                 wire69,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg81,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
                 reg52,
                 (1'h0)};
  assign wire48 = (wire45[(3'h5):(3'h4)] ?
                      $unsigned(wire46) : (({$unsigned(wire44)} ?
                          (|(wire47 == wire46)) : $unsigned((wire47 <<< wire44))) ^ (wire47[(3'h7):(3'h7)] ?
                          wire45 : ((wire45 ? wire45 : wire45) ^~ wire44))));
  assign wire49 = {$unsigned($unsigned(wire44)),
                      ({{(^~wire47)}} ?
                          ($signed($signed(wire48)) ~^ (^~$unsigned(wire48))) : {($unsigned(wire46) + $signed(wire46))})};
  assign wire50 = ($signed(($signed($unsigned(wire49)) ?
                      (wire45[(1'h1):(1'h1)] ?
                          (wire47 == (8'hae)) : wire45[(2'h2):(2'h2)]) : wire44[(4'he):(4'hb)])) >>> (&wire48[(4'h8):(3'h6)]));
  assign wire51 = {$signed(wire45[(2'h2):(1'h0)]),
                      (wire46 * $signed({$signed(wire50)}))};
  always
    @(posedge clk) begin
      if (wire48)
        begin
          reg52 <= $signed($signed(wire51[(3'h5):(1'h0)]));
        end
      else
        begin
          reg52 <= (-($unsigned(wire50[(3'h6):(2'h2)]) & {$signed((~&wire49))}));
        end
      reg53 <= (~wire48);
      reg54 <= $signed((($unsigned(wire44) - ((wire50 ^~ wire46) | (wire46 == reg52))) == $unsigned(((8'hb0) ?
          wire45[(1'h1):(1'h1)] : wire50))));
      if ($unsigned($signed(reg54)))
        begin
          reg55 <= $signed({($unsigned($signed(reg53)) ?
                  (^~$signed((8'hac))) : (wire48[(4'hb):(4'h8)] ^~ (wire46 ?
                      wire48 : reg52))),
              reg52});
          reg56 <= reg54[(1'h0):(1'h0)];
          reg57 <= reg52[(3'h6):(3'h5)];
          if ($unsigned($signed((-({wire51, wire49} ? (^~wire49) : (|reg53))))))
            begin
              reg58 <= $signed((((reg56 + (8'ha7)) ?
                      ((8'ha3) ?
                          reg57 : wire44[(3'h4):(2'h3)]) : $unsigned($signed(wire45))) ?
                  $signed(wire47) : $unsigned((!$signed(reg56)))));
            end
          else
            begin
              reg58 <= {$unsigned((~{$unsigned((8'h9c)),
                      (wire49 ? reg57 : wire45)}))};
              reg59 <= ((&(~^$unsigned($unsigned(reg56)))) ?
                  ((~wire49[(4'he):(4'he)]) ^~ wire45) : wire46);
              reg60 <= reg59;
              reg61 <= (&$unsigned($signed($unsigned((~^wire49)))));
            end
          if (wire47[(4'hf):(4'hd)])
            begin
              reg62 <= reg57;
              reg63 <= (wire51[(4'ha):(1'h1)] && wire50);
              reg64 <= (~&$unsigned(((&(^reg52)) ?
                  ((~reg58) ?
                      (^(8'hb3)) : (&(8'hb1))) : reg57[(1'h1):(1'h1)])));
              reg65 <= (wire50[(3'h4):(3'h4)] & (wire44[(5'h10):(4'he)] ?
                  ((reg64[(4'h8):(2'h2)] >> reg61[(4'h9):(2'h2)]) < reg64) : (((reg62 ?
                              reg62 : reg54) ?
                          (^wire44) : (+wire45)) ?
                      (^~(reg59 ~^ reg64)) : (((8'ha6) ? reg58 : reg54) ?
                          (reg57 ? reg54 : wire45) : (8'ha4)))));
            end
          else
            begin
              reg62 <= (wire48 != (!wire51));
              reg63 <= (|reg63[(4'hd):(4'hb)]);
              reg64 <= (8'ha4);
              reg65 <= (|reg57);
            end
        end
      else
        begin
          if (reg62[(5'h12):(2'h2)])
            begin
              reg55 <= ((~^$signed(($unsigned(reg60) && (reg58 >= reg63)))) << wire44[(4'hb):(1'h0)]);
              reg56 <= (-reg59[(4'hb):(3'h4)]);
            end
          else
            begin
              reg55 <= ((reg52 > (reg64[(4'h9):(3'h5)] << reg64)) & $signed(reg55));
            end
          reg57 <= (+(wire47 ?
              $unsigned($signed(reg56)) : $signed({(wire51 ?
                      wire48 : wire50)})));
          reg58 <= (+(({reg55, (wire51 ? wire48 : wire48)} ?
              $signed((reg60 ? wire46 : reg65)) : (^{(8'haa),
                  wire44})) >> (((wire51 == reg62) > (wire50 ?
              reg53 : reg59)) && $unsigned($unsigned(wire47)))));
          reg59 <= (wire49[(4'hc):(3'h7)] ?
              (wire47[(4'hc):(1'h0)] <= $unsigned(((!wire48) + wire50[(3'h6):(3'h6)]))) : ($signed($signed((wire50 << reg55))) ?
                  ($signed((reg60 ? reg58 : wire44)) < ((~reg53) ?
                      $unsigned(reg59) : reg61)) : reg53));
        end
      reg66 <= (&{(($signed(reg63) ~^ $unsigned((8'ha4))) ?
              ((reg59 ? wire44 : wire46) ?
                  reg56 : $signed(reg54)) : reg60[(4'hd):(3'h7)]),
          (8'ha3)});
    end
  always
    @(posedge clk) begin
      reg67 <= $signed((|reg63[(2'h3):(2'h2)]));
      reg68 <= $unsigned((~^wire49));
    end
  assign wire69 = reg68;
  assign wire70 = $unsigned(reg68[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      reg71 <= reg53[(1'h0):(1'h0)];
      reg72 <= {$unsigned($unsigned((~&wire70[(3'h5):(1'h0)]))),
          $unsigned($unsigned(reg63[(4'hc):(3'h4)]))};
      reg73 <= reg55[(4'hb):(3'h5)];
      reg74 <= $unsigned(reg58[(3'h4):(2'h2)]);
    end
  assign wire75 = $unsigned($unsigned(((reg53[(1'h1):(1'h1)] ?
                      {(8'ha3)} : (~reg53)) << (7'h44))));
  assign wire76 = $unsigned(wire47);
  assign wire77 = (~$unsigned((reg68[(3'h4):(3'h4)] > (-wire49))));
  assign wire78 = reg60[(1'h0):(1'h0)];
  assign wire79 = {(((reg73 ?
                              $signed(reg61) : reg58[(4'h9):(1'h0)]) | $signed($signed(wire46))) ?
                          (|(^((8'haa) >> wire76))) : wire45[(3'h7):(2'h2)])};
  assign wire80 = (((8'haa) ^ $signed($signed((wire76 ? reg71 : reg64)))) ?
                      (reg74 && ($unsigned(((8'ha4) ~^ wire77)) ?
                          ({(8'hb7)} ?
                              $signed(wire44) : (wire50 > reg74)) : $signed(reg68))) : ((reg53[(4'ha):(4'ha)] >>> wire51[(4'ha):(2'h3)]) ?
                          wire79 : {(&(wire76 ? wire44 : wire49)),
                              (reg71[(3'h4):(1'h0)] > $unsigned((8'ha7)))}));
  always
    @(posedge clk) begin
      reg81 <= (-($unsigned($unsigned((wire51 >>> wire51))) ?
          $signed(reg59) : $signed(reg57)));
    end
  assign wire82 = $signed(((($signed(reg56) && $signed(wire48)) ?
                      (~|(wire70 ? (8'hbd) : reg54)) : ((^~reg53) ?
                          (+reg65) : reg81[(4'hd):(3'h6)])) < ((^{wire48,
                          wire80}) ?
                      reg65 : wire77)));
  assign wire83 = $signed(reg73);
  assign wire84 = (&$unsigned(($signed(wire79) <= (~&reg64[(5'h10):(4'hb)]))));
  assign wire85 = reg72;
endmodule
