module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire88;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'ha):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire33,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 wire4,
                 reg32,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = {wire1, (8'h9f)};
  assign wire5 = {wire3};
  always
    @(posedge clk) begin
      if ($signed((~^(~^wire2))))
        begin
          reg6 <= $signed(wire2);
          if ({wire4, wire5[(4'hb):(3'h7)]})
            begin
              reg7 <= {$unsigned(wire0[(2'h3):(2'h3)]),
                  (+$signed(($signed(wire4) != wire5)))};
              reg8 <= wire5;
            end
          else
            begin
              reg7 <= $signed({(^~reg8), wire2[(3'h4):(2'h2)]});
              reg8 <= ((wire3[(2'h2):(1'h1)] ? {wire4} : reg7[(4'hb):(2'h2)]) ?
                  (((~&$unsigned(reg8)) ?
                      (^~(wire1 ? reg7 : (8'h9e))) : (wire2[(2'h2):(1'h1)] ?
                          (~^wire1) : ((8'h9f) == (8'hbc)))) && reg6[(1'h0):(1'h0)]) : wire2[(1'h1):(1'h1)]);
              reg9 <= {(|wire1)};
              reg10 <= $unsigned(($signed(({wire1} ?
                      (wire2 ? wire3 : reg6) : wire4)) ?
                  (wire5 ? reg8[(4'hc):(2'h2)] : reg8) : wire2[(2'h2):(1'h0)]));
              reg11 <= $unsigned(($signed($unsigned((!(8'ha5)))) >>> (~&$signed(reg6))));
            end
          if (wire2[(2'h3):(2'h3)])
            begin
              reg12 <= wire4;
              reg13 <= $signed(reg11[(4'h9):(4'h9)]);
            end
          else
            begin
              reg12 <= wire3;
            end
        end
      else
        begin
          reg6 <= $unsigned((($signed(wire1) ?
              wire2[(2'h3):(1'h1)] : reg6[(2'h3):(1'h0)]) >= ($signed((reg12 >> reg11)) >= ((wire0 ?
                  wire3 : wire3) ?
              (^reg12) : $signed(reg11)))));
          reg7 <= $signed(reg13[(4'hd):(4'hb)]);
          reg8 <= ($unsigned($signed((^(8'ha7)))) != $unsigned(reg9));
          if (($unsigned((~reg12)) ?
              ((reg8 | ((wire0 > reg9) ?
                  (+reg10) : $signed(reg12))) << (7'h40)) : $unsigned((8'h9c))))
            begin
              reg9 <= reg9[(5'h11):(4'h8)];
              reg10 <= {(((+(~reg11)) - $unsigned($signed(wire5))) ?
                      ((^~(-reg13)) ^ (-wire5)) : (7'h43))};
              reg11 <= wire5[(4'ha):(2'h2)];
              reg12 <= {$signed((+$signed($signed((8'hae))))),
                  (wire0[(4'h8):(1'h1)] ?
                      $signed({reg12}) : wire0[(4'h9):(4'h8)])};
            end
          else
            begin
              reg9 <= (reg13 ^ (8'hb6));
            end
        end
      if (((!((reg13 << (8'hbb)) ?
          $signed((reg8 == wire2)) : (~^(~|reg11)))) ~^ (^(reg13 ?
          (wire3[(2'h3):(2'h2)] < (|wire1)) : $signed((+(7'h43)))))))
        begin
          if ({reg12[(1'h1):(1'h0)], (8'ha3)})
            begin
              reg14 <= {wire3};
              reg15 <= (reg10 | $unsigned($unsigned(reg9[(4'hb):(3'h7)])));
              reg16 <= (+$unsigned($unsigned(({reg14, reg6} ?
                  reg15[(2'h2):(1'h1)] : reg8))));
              reg17 <= (((reg8[(1'h1):(1'h1)] ? wire4 : reg8[(4'h9):(2'h3)]) ?
                  ($unsigned($unsigned((8'hb3))) ?
                      reg16 : (!(~wire4))) : wire0[(3'h6):(3'h4)]) * $signed((8'hb2)));
              reg18 <= wire5;
            end
          else
            begin
              reg14 <= ($unsigned(reg17) ? (7'h40) : reg10[(1'h1):(1'h1)]);
              reg15 <= reg16;
              reg16 <= $signed($signed($unsigned($signed($signed(reg17)))));
              reg17 <= $unsigned(wire0);
            end
          reg19 <= reg8;
        end
      else
        begin
          reg14 <= $unsigned((wire4[(3'h4):(2'h2)] < (~^((~&reg15) ~^ $unsigned(reg8)))));
          if ($unsigned($unsigned($signed($unsigned($unsigned(reg13))))))
            begin
              reg15 <= $signed(reg8[(3'h5):(1'h0)]);
              reg16 <= (-reg15);
              reg17 <= (^(|((!$unsigned((8'haf))) ?
                  (reg16 ? wire1 : (reg11 > wire3)) : reg8)));
              reg18 <= reg9[(1'h0):(1'h0)];
              reg19 <= {{($unsigned(reg17) <<< reg10)}};
            end
          else
            begin
              reg15 <= {reg10, $unsigned(reg19)};
              reg16 <= reg8;
              reg17 <= reg15[(4'hc):(3'h4)];
              reg18 <= $unsigned(wire1[(3'h6):(2'h3)]);
              reg19 <= (reg13 >= {($unsigned(reg17) ?
                      $unsigned(reg15) : $unsigned($unsigned(wire2)))});
            end
        end
      reg20 <= (&$signed({($unsigned(reg8) ? (reg16 ? reg11 : reg9) : reg14),
          $signed(wire4)}));
      reg21 <= ($unsigned((~reg9)) >> reg10);
      reg22 <= reg10;
    end
  assign wire23 = reg19;
  assign wire24 = (&(|reg21));
  assign wire25 = (!(8'hb1));
  assign wire26 = reg21[(1'h1):(1'h0)];
  assign wire27 = ($unsigned((^~$signed((reg14 ? (8'hbc) : (8'ha2))))) ?
                      ($unsigned({(wire26 ^ reg12),
                          (reg7 && reg9)}) != $unsigned(reg14)) : (8'hb9));
  assign wire28 = ((~|($unsigned((wire1 ? reg18 : reg15)) >= (wire2 ?
                          $signed(reg22) : $unsigned(wire3)))) ?
                      {reg17} : reg22);
  assign wire29 = (~^reg21[(2'h2):(1'h0)]);
  assign wire30 = (!(($unsigned((reg16 != wire5)) && wire5[(4'ha):(2'h2)]) << reg8));
  assign wire31 = (|({(8'hb2),
                      reg11[(4'h8):(3'h4)]} <<< ($unsigned((~wire27)) + ((~reg17) ?
                      reg20[(2'h2):(1'h0)] : wire24[(3'h5):(1'h0)]))));
  always
    @(posedge clk) begin
      reg32 <= $signed(reg7[(4'hd):(1'h0)]);
    end
  assign wire33 = ({$unsigned($signed((~&reg9)))} ? {(8'hb2)} : reg16);
  module34 #() modinst89 (wire88, clk, wire3, reg14, wire0, reg22);
  assign wire90 = reg9;
  assign wire91 = (+wire2);
  assign wire92 = (8'hb4);
  assign wire93 = (8'had);
  assign wire94 = $signed($unsigned($signed($signed({wire0, wire3}))));
  assign wire95 = $signed(wire24);
endmodule

module module34
#(parameter param87 = (((~^({(8'haf)} | ((8'hae) ^~ (8'ha9)))) ? ({((8'hb7) ? (8'hb2) : (8'hba)), ((8'hbb) < (8'hb7))} ~^ (((8'h9d) + (8'ha3)) && ((8'hbb) ? (8'hbd) : (8'hac)))) : {(((8'haa) <<< (8'hbe)) ? (~(8'hbb)) : (-(7'h40))), {((7'h44) ? (8'haf) : (7'h40)), ((8'ha1) ^~ (8'hb6))}}) ? (((~&((8'hb4) ? (8'hb1) : (7'h43))) ^ (!((8'haa) >> (8'hb1)))) ? {(((8'hb3) >> (8'hbb)) ? {(8'hb1)} : ((8'hbd) ? (8'hab) : (7'h40)))} : (~|{((8'haf) == (8'ha2))})) : (+((((8'ha7) ^~ (8'ha6)) ? (~&(7'h41)) : ((8'ha2) + (8'hb1))) ? (-((8'hb4) >> (8'hbd))) : (((8'h9c) << (8'ha4)) ? ((8'haa) - (8'hb5)) : ((8'hbb) ? (8'hb3) : (8'ha6)))))))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire39;
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  assign y = {wire86,
                 wire80,
                 wire78,
                 wire40,
                 wire39,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire39 = wire35;
  assign wire40 = (((8'hb9) ?
                      (|({(8'hbe),
                          wire36} ~^ $signed(wire39))) : wire38) + (!wire39[(4'h8):(2'h2)]));
  module41 #() modinst79 (.clk(clk), .wire43(wire37), .wire44(wire38), .wire45(wire36), .wire42(wire40), .y(wire78));
  assign wire80 = $signed({((+wire37) >= wire38[(3'h5):(2'h2)]),
                      (^~(wire36 | $unsigned(wire37)))});
  always
    @(posedge clk) begin
      reg81 <= $unsigned(((~|(wire35[(4'he):(4'ha)] | wire36[(5'h13):(3'h7)])) ?
          wire38 : wire80));
      reg82 <= (8'hb7);
      reg83 <= (({wire78[(2'h2):(1'h1)]} >>> wire78[(1'h0):(1'h0)]) - (^~(!((~|wire36) ?
          (&wire38) : reg81))));
      reg84 <= wire38;
      reg85 <= $unsigned((8'ha3));
    end
  assign wire86 = ((~^wire37[(3'h4):(2'h3)]) * (($unsigned($unsigned((8'hb7))) ^~ wire38) > ($unsigned((!wire35)) ?
                      ($signed((8'hb1)) | (reg84 ?
                          wire39 : wire80)) : {$signed(wire37),
                          $unsigned(reg85)})));
endmodule

module module41
#(parameter param76 = ((+((((8'hb2) == (8'hbf)) - ((8'ha3) ? (8'had) : (8'h9f))) && ({(8'hb8), (8'ha1)} || ((8'ha2) + (8'haf))))) ? (~^({(~&(7'h42))} ? ((~&(8'had)) ^ ((8'ha9) ~^ (8'haf))) : (((8'hb5) ~^ (8'hb1)) && ((8'hbd) - (8'ha9))))) : {((((7'h43) || (8'h9e)) ? {(8'h9f)} : ((8'ha9) ? (8'hb8) : (8'hb2))) - {(&(8'hbb)), ((8'h9e) <<< (8'hac))})}), 
parameter param77 = (param76 != (((^(param76 ? param76 : param76)) ? ((param76 & param76) ~^ (&(8'hb0))) : (~|param76)) & param76)))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire45;
  input wire signed [(3'h4):(1'h0)] wire44;
  input wire [(5'h10):(1'h0)] wire43;
  input wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire46 = wire42;
  assign wire47 = wire43;
  assign wire48 = wire42[(4'h8):(2'h3)];
  assign wire49 = {(wire47[(1'h1):(1'h0)] ?
                          ($unsigned((8'ha2)) ?
                              ((8'haf) && (~wire45)) : (wire42 ?
                                  (wire47 ?
                                      wire45 : wire46) : (~&(8'had)))) : $signed($signed($signed(wire45))))};
  always
    @(posedge clk) begin
      reg50 <= {($unsigned(($unsigned(wire47) < (-wire47))) ?
              $signed($signed((wire46 - wire49))) : $unsigned((~|{wire48})))};
      reg51 <= $unsigned($signed(((~|(&wire47)) ?
          (|(wire46 ? wire42 : wire42)) : ($signed((8'hb7)) ?
              wire47[(1'h0):(1'h0)] : wire42))));
      if (wire44)
        begin
          reg52 <= ((|(($signed((8'h9d)) == (reg51 ? wire45 : wire43)) ?
                  wire42 : $unsigned(wire43[(3'h5):(3'h5)]))) ?
              $signed((^$signed((!wire42)))) : $unsigned((~|(^(wire49 >> wire45)))));
          if (wire47)
            begin
              reg53 <= (((&(~^$signed(wire49))) - $signed($unsigned(wire46[(2'h3):(2'h3)]))) || ((~|$signed((wire44 ?
                  reg51 : wire48))) + {(^~reg52[(3'h6):(3'h5)])}));
              reg54 <= $unsigned(reg52[(3'h4):(1'h1)]);
              reg55 <= (wire43[(4'he):(3'h6)] >= (8'hb6));
              reg56 <= {wire47[(1'h1):(1'h1)],
                  (wire45[(2'h3):(1'h1)] <= (reg51[(4'he):(1'h0)] >>> $unsigned($signed(wire46))))};
              reg57 <= (|reg55[(4'h9):(1'h0)]);
            end
          else
            begin
              reg53 <= (reg57[(5'h13):(1'h0)] ?
                  (^(|$unsigned((reg52 ?
                      (8'ha3) : wire46)))) : wire49[(2'h2):(1'h1)]);
              reg54 <= (~|wire44[(1'h0):(1'h0)]);
              reg55 <= $unsigned($unsigned(wire43[(5'h10):(4'hd)]));
            end
          reg58 <= reg57;
          reg59 <= ($unsigned($unsigned((wire46[(2'h3):(1'h1)] ^~ wire44[(1'h0):(1'h0)]))) << reg57[(5'h12):(4'hd)]);
          reg60 <= $signed((reg57 < $signed($unsigned((reg53 >> wire45)))));
        end
      else
        begin
          reg52 <= $unsigned((({(^~(8'hbc))} ?
                  ($unsigned(reg57) == $unsigned(reg60)) : (reg54[(3'h4):(1'h0)] >>> wire48)) ?
              {{$unsigned(reg52)}} : ((-wire44[(2'h2):(1'h0)]) ?
                  {wire46} : ((8'hb4) ?
                      (reg60 ? reg54 : reg55) : (reg54 == reg52)))));
          reg53 <= reg56;
          reg54 <= ((|(~(~|reg53))) ?
              (reg51[(5'h10):(4'hf)] ?
                  (!((reg60 ? wire49 : wire49) ?
                      $signed((8'hb6)) : reg54[(2'h3):(2'h3)])) : $signed({$signed(wire43)})) : (~|wire49[(3'h4):(3'h4)]));
        end
      reg61 <= reg52[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      if (wire47[(3'h4):(2'h2)])
        begin
          reg62 <= (+reg58[(1'h1):(1'h1)]);
          if (reg60)
            begin
              reg63 <= wire45;
              reg64 <= (($unsigned((^(reg63 * (8'ha0)))) || (!$unsigned(reg58))) >>> $signed((^(&$signed(wire46)))));
              reg65 <= reg53;
            end
          else
            begin
              reg63 <= (((((&reg55) < reg61[(5'h14):(1'h1)]) ?
                      ((wire43 ? reg56 : reg54) ?
                          (~&wire43) : reg59) : {(reg62 < reg63)}) ?
                  ($signed({wire45, (8'ha8)}) ?
                      wire42 : $signed((wire49 ~^ wire47))) : (~^(wire44 ?
                      $unsigned(reg65) : {reg61,
                          reg59}))) - $signed(({$unsigned(reg58),
                  (wire45 ? wire44 : reg57)} > (|(reg50 ? reg56 : (8'hb6))))));
              reg64 <= $signed($unsigned(reg56[(1'h0):(1'h0)]));
              reg65 <= (~(-(($unsigned(reg60) >>> $unsigned((8'hb8))) ^ reg54)));
              reg66 <= {{($signed({reg51}) * reg50),
                      ($signed((wire49 > reg56)) ?
                          ((reg57 ?
                              reg60 : reg62) ~^ $unsigned(reg61)) : wire45[(1'h0):(1'h0)])}};
            end
        end
      else
        begin
          reg62 <= ((^wire46[(3'h6):(1'h1)]) ?
              $unsigned($unsigned($signed(wire42))) : $unsigned((wire44 ?
                  {(reg61 >= (8'hac)),
                      $signed(reg53)} : (reg62 != (wire43 && (8'hb1))))));
          reg63 <= ($unsigned(reg66) ?
              $unsigned({$unsigned($unsigned(reg56))}) : reg65);
          reg64 <= (-$signed((($signed(wire44) ?
                  $signed(reg52) : {wire48, reg50}) ?
              (wire46 != (reg61 * wire45)) : $signed((reg51 ?
                  wire48 : (7'h41))))));
        end
      reg67 <= (reg59[(4'ha):(4'ha)] ^~ reg64);
    end
  always
    @(posedge clk) begin
      reg68 <= ({wire43} ?
          ((reg58 ? $unsigned($unsigned(wire46)) : (~|{reg61, reg66})) ?
              (+(8'haf)) : ((~&(~&wire42)) ^ $signed(wire44))) : reg66);
    end
  assign wire69 = $signed(wire48);
  assign wire70 = $signed($unsigned({$signed((wire48 && wire47)),
                      ((reg54 || reg66) ?
                          $unsigned(reg61) : ((8'ha4) && wire46))}));
  assign wire71 = $signed(wire49);
  assign wire72 = ((($signed((~|reg51)) | (|wire70)) - {$unsigned((wire49 && (8'haf))),
                      wire45[(1'h0):(1'h0)]}) >= $unsigned(($unsigned($signed(reg51)) ~^ ($unsigned(reg57) ^~ $signed(wire44)))));
  assign wire73 = (8'haf);
  assign wire74 = wire45;
  assign wire75 = $signed(reg67);
endmodule
