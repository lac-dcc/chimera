module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire94,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire6,
                 wire5,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire5 = (wire2[(3'h6):(3'h4)] ?
                     (~|($unsigned({(8'hae),
                         wire0}) <= (&$unsigned(wire3)))) : {(^~wire0[(5'h12):(3'h4)]),
                         wire1});
  assign wire6 = $unsigned((wire1 >= {$signed({wire3, (8'ha9)})}));
  always
    @(posedge clk) begin
      if ({(({(~^wire1)} ?
                  (wire1[(2'h2):(1'h1)] || (wire0 ? wire4 : wire4)) : wire4) ?
              wire6 : $unsigned($signed((~|(8'hbc))))),
          (^(+wire3))})
        begin
          reg7 <= $signed({wire3[(4'h8):(3'h4)]});
          reg8 <= (~wire0[(5'h12):(3'h6)]);
          reg9 <= $signed(({{{wire4}, wire2}} ? wire2 : wire4[(2'h3):(1'h1)]));
          reg10 <= $unsigned(reg7[(4'h8):(3'h6)]);
          if ({$unsigned($unsigned(wire0[(4'ha):(4'h9)]))})
            begin
              reg11 <= $unsigned((~((wire1 ?
                      (wire0 > (8'hb9)) : (wire0 > wire6)) ?
                  {(wire3 ? wire2 : reg7)} : $signed((reg7 & (8'hbe))))));
              reg12 <= $unsigned({wire4[(1'h0):(1'h0)]});
              reg13 <= $signed(reg7);
            end
          else
            begin
              reg11 <= ((|(~|($signed(wire6) ?
                      $signed(reg10) : wire4[(2'h2):(1'h1)]))) ?
                  (!$unsigned((+(wire3 != wire0)))) : $unsigned($unsigned(reg10)));
              reg12 <= reg13;
              reg13 <= reg8[(3'h4):(1'h0)];
              reg14 <= $unsigned(wire3[(5'h13):(4'h8)]);
              reg15 <= ({$signed(wire1)} && wire6[(5'h10):(4'hc)]);
            end
        end
      else
        begin
          reg7 <= ({reg15} && (wire5[(3'h5):(2'h2)] ?
              $signed({(reg10 != (7'h40)), (wire3 ? wire6 : reg10)}) : reg11));
          if ((~|(8'hab)))
            begin
              reg8 <= {$unsigned(reg12),
                  (reg11 * ($unsigned((8'h9d)) ^ $unsigned((~(8'hb9)))))};
              reg9 <= $signed(((((|wire5) ?
                  wire4 : (wire5 >> reg8)) <= (8'h9e)) & reg15[(3'h5):(3'h5)]));
              reg10 <= $unsigned(wire0);
              reg11 <= $unsigned(wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg8 <= $signed((reg7 ? reg10[(3'h7):(3'h4)] : reg12));
              reg9 <= (((((reg14 ? reg10 : reg15) ?
                          reg10[(2'h2):(1'h0)] : (wire4 ? (8'hb3) : reg10)) ?
                      wire3 : $signed($signed(wire2))) ?
                  ($unsigned((reg8 ~^ reg12)) ~^ reg13[(3'h4):(2'h2)]) : $signed(wire3)) ~^ (8'hb2));
              reg10 <= ((($unsigned(wire6[(4'ha):(3'h6)]) ?
                      ((reg11 ? (8'hb6) : wire3) ?
                          {wire5, reg11} : {reg10, reg13}) : (reg14 ?
                          (wire4 ?
                              reg15 : reg15) : (~&wire6))) >> ($signed((wire5 ?
                          reg8 : (8'h9e))) ?
                      $signed(wire2[(4'hc):(4'h9)]) : {(8'haf), wire4})) ?
                  (($signed((!(8'ha9))) ~^ (~^$unsigned(wire1))) ?
                      (~^(reg9[(1'h0):(1'h0)] <<< ((8'hbb) && (8'ha8)))) : (8'hae)) : (~^(((reg8 ?
                              reg13 : reg7) ?
                          (^reg12) : $unsigned(wire4)) ?
                      ($unsigned(reg12) ?
                          {reg14} : reg8[(4'h8):(3'h5)]) : reg14[(4'h8):(3'h4)])));
            end
          if (wire3[(3'h7):(2'h3)])
            begin
              reg12 <= $unsigned($signed(wire6[(2'h3):(1'h1)]));
              reg13 <= $unsigned({(((^~(8'ha3)) ?
                      (reg8 ~^ wire5) : (wire5 ?
                          reg9 : reg8)) <= ((reg13 < wire6) != reg14[(4'ha):(4'h8)])),
                  wire3[(2'h2):(2'h2)]});
              reg14 <= ((~(~&$signed((|reg9)))) <= reg14);
              reg15 <= (((^~reg15[(4'ha):(4'h9)]) ~^ {$signed((-reg14)),
                  ((wire1 ? reg7 : wire2) ?
                      (^~wire4) : {(8'ha3)})}) - ($unsigned(wire5) ?
                  reg15 : {(reg13[(4'hf):(4'he)] || (reg7 ? reg10 : (8'haa))),
                      $signed((~^reg9))}));
            end
          else
            begin
              reg12 <= {wire3[(1'h1):(1'h0)]};
              reg13 <= ((~|(((~^reg11) ? (&reg10) : reg7) ?
                      reg11[(1'h1):(1'h1)] : wire4[(1'h1):(1'h1)])) ?
                  {(-((~^(8'hae)) >>> (7'h40)))} : $unsigned($unsigned(((reg14 ?
                      wire3 : (7'h43)) + $signed(reg8)))));
              reg14 <= ((reg14 ?
                      $signed((reg13[(5'h11):(3'h4)] || $unsigned(wire4))) : $signed($unsigned(reg8))) ?
                  (^wire5) : wire5[(3'h4):(2'h3)]);
              reg15 <= ($signed((wire1 ^ (|(wire5 ?
                  reg8 : wire5)))) ^ $signed(wire0[(5'h13):(4'hd)]));
            end
          if (wire2[(2'h3):(1'h0)])
            begin
              reg16 <= reg9[(3'h4):(3'h4)];
              reg17 <= $unsigned(($unsigned(reg10) ?
                  ({((8'ha7) ? wire0 : wire1), (|reg13)} ?
                      reg10[(3'h7):(1'h0)] : (8'ha4)) : ((8'haa) ?
                      reg11 : $signed($signed(wire0)))));
            end
          else
            begin
              reg16 <= (8'hb3);
              reg17 <= (reg13 != (wire4[(1'h1):(1'h1)] ?
                  {wire0} : $signed($signed($unsigned(wire6)))));
              reg18 <= $signed(wire1[(1'h1):(1'h0)]);
            end
        end
      if (wire2[(2'h3):(1'h0)])
        begin
          if ($unsigned(reg12))
            begin
              reg19 <= wire2[(2'h2):(2'h2)];
              reg20 <= {$unsigned((~^{{reg8, reg18}})),
                  $unsigned((($unsigned(wire5) - ((8'hba) ? wire4 : wire5)) ?
                      $signed((~|reg15)) : wire3))};
            end
          else
            begin
              reg19 <= $signed($signed($signed((((8'hb3) <= reg18) && $unsigned((8'hb9))))));
              reg20 <= {((wire6 == ({wire3} ? wire1 : reg11)) ?
                      wire0[(5'h11):(4'he)] : ($unsigned((8'hb5)) ?
                          $signed((wire2 ? wire1 : reg13)) : ({reg18,
                              reg16} <= (wire4 >> reg15)))),
                  {reg14[(4'h9):(4'h9)],
                      ((~^(8'hbd)) == $signed(((8'hbe) ? wire1 : reg10)))}};
              reg21 <= $unsigned(reg18[(1'h1):(1'h0)]);
              reg22 <= reg7;
            end
          reg23 <= ({($unsigned({wire0, reg16}) ?
                  (8'hba) : $unsigned(((7'h41) & (8'hbf)))),
              (reg10[(4'hb):(2'h2)] ?
                  ($signed(wire1) << {reg13}) : $signed({reg12,
                      reg7}))} * reg11);
          reg24 <= ($signed((wire3 + $unsigned(reg13[(5'h11):(3'h7)]))) != ((~|($unsigned(wire3) ?
                  $unsigned(reg16) : ((8'ha8) && reg15))) ?
              ((~^(wire1 ?
                  wire5 : reg9)) && ((8'hbe) ~^ $signed((7'h42)))) : wire1[(2'h2):(1'h0)]));
        end
      else
        begin
          reg19 <= reg10[(1'h1):(1'h0)];
          reg20 <= (((&reg10) ? reg12[(2'h3):(1'h1)] : reg16) > reg16);
        end
      reg25 <= ((~&(8'ha5)) ?
          $unsigned({(wire6[(4'hb):(2'h2)] ?
                  wire5[(2'h2):(2'h2)] : $unsigned(reg19))}) : $signed((((wire1 ?
                      reg13 : reg12) ?
                  wire1 : $signed((8'had))) ?
              reg18 : reg23[(2'h3):(1'h0)])));
    end
  assign wire26 = ((reg22 ^ (wire0 >= ($signed(wire0) - (7'h40)))) ^~ wire3[(1'h1):(1'h1)]);
  assign wire27 = (~|(&$unsigned(reg19)));
  assign wire28 = wire4[(1'h1):(1'h0)];
  assign wire29 = (|{($unsigned(((8'ha5) & reg8)) && (((8'ha8) == wire28) & (reg7 - reg9)))});
  assign wire30 = wire29[(3'h4):(2'h2)];
  module31 #() modinst95 (.wire34(reg25), .wire36(wire26), .wire33(reg14), .wire35(wire6), .wire32(reg16), .y(wire94), .clk(clk));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(5'h11):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire signed [(5'h10):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire92;
  assign y = {wire74, wire39, wire38, wire37, wire76, wire77, wire92, (1'h0)};
  assign wire37 = wire33[(4'h9):(3'h4)];
  assign wire38 = wire35[(3'h6):(3'h6)];
  assign wire39 = wire38;
  module40 #() modinst75 (wire74, clk, wire39, wire35, wire38, wire34, wire36);
  assign wire76 = wire36[(4'he):(4'he)];
  assign wire77 = (wire37 ? (8'ha3) : wire33[(1'h1):(1'h1)]);
  module78 #() modinst93 (wire92, clk, wire34, wire35, wire38, wire39, wire76);
endmodule

module module78
#(parameter param91 = (~^{(~|(((7'h40) || (8'hbb)) ? {(8'hbf), (8'h9d)} : (|(8'hb4))))}))
(y, clk, wire83, wire82, wire81, wire80, wire79);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire83;
  input wire [(3'h5):(1'h0)] wire82;
  input wire [(5'h11):(1'h0)] wire81;
  input wire signed [(3'h7):(1'h0)] wire80;
  input wire [(5'h15):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  assign y = {wire90, wire89, wire88, wire87, wire86, wire85, wire84, (1'h0)};
  assign wire84 = (wire83 ?
                      (($unsigned($signed((8'ha5))) + $signed($unsigned(wire82))) && (&wire79[(5'h11):(3'h7)])) : (^$unsigned($unsigned($signed(wire82)))));
  assign wire85 = $signed($signed((^(8'haa))));
  assign wire86 = wire79[(1'h0):(1'h0)];
  assign wire87 = ($unsigned((!$signed({wire85,
                      wire83}))) * $unsigned((($unsigned(wire80) ?
                          $unsigned(wire84) : (8'hba)) ?
                      $unsigned((8'ha6)) : {{wire84}})));
  assign wire88 = {wire85};
  assign wire89 = $unsigned({$signed((~|((8'hab) ? wire81 : wire83))), wire87});
  assign wire90 = wire83[(4'h9):(4'h9)];
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  input wire signed [(4'he):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
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
                 (1'h0)};
  assign wire46 = wire45;
  assign wire47 = {$unsigned((+{wire43}))};
  assign wire48 = (({(~&wire43[(5'h10):(4'h8)])} ?
                      (wire46[(2'h3):(1'h0)] ~^ (^~wire47[(4'hd):(4'h9)])) : ($signed({wire41}) + $signed({wire45}))) ^ (!wire42[(4'hf):(4'hf)]));
  assign wire49 = (($signed($unsigned(wire47[(4'h9):(3'h7)])) ?
                      (8'ha2) : (($unsigned(wire45) ~^ (wire47 ?
                          wire47 : (8'ha9))) < (wire41[(3'h7):(3'h6)] >= wire42[(4'hd):(3'h7)]))) << $signed(wire46[(4'hf):(4'hc)]));
  assign wire50 = {(($unsigned(((8'ha4) > wire48)) > wire46[(1'h1):(1'h0)]) <= wire45),
                      {$signed(wire41[(2'h3):(2'h3)])}};
  assign wire51 = {(wire45 & ($unsigned($unsigned(wire50)) ?
                          wire45[(2'h2):(1'h0)] : wire48[(1'h0):(1'h0)])),
                      {(+((wire50 * wire42) ? (+wire41) : $signed(wire44)))}};
  assign wire52 = (~|(&$signed((((8'ha9) ^ wire41) ?
                      (!(8'h9c)) : $signed(wire48)))));
  assign wire53 = $unsigned(wire41[(1'h0):(1'h0)]);
  assign wire54 = wire42;
  assign wire55 = (+(-wire52[(5'h11):(4'he)]));
  always
    @(posedge clk) begin
      if ((^$signed(wire47[(3'h4):(1'h1)])))
        begin
          reg56 <= $signed($signed($unsigned((~^$unsigned(wire45)))));
          reg57 <= ((((wire43 ?
                  {wire48, wire50} : ((8'ha5) ? wire45 : wire46)) & ({reg56,
                  wire54} && reg56[(5'h12):(1'h0)])) ?
              {$unsigned($signed(wire46)),
                  {(&wire55)}} : wire51[(2'h2):(2'h2)]) >> $unsigned($unsigned($unsigned(wire52))));
          reg58 <= {(~^wire53), (wire41 == $unsigned($signed(wire52)))};
          reg59 <= ($unsigned((+wire47)) != wire53);
        end
      else
        begin
          if (wire49[(3'h4):(3'h4)])
            begin
              reg56 <= ($unsigned({(8'hbb),
                  ((wire54 ?
                      wire45 : wire42) != $unsigned(wire50))}) < $signed($unsigned($signed((~|wire48)))));
              reg57 <= reg58[(1'h0):(1'h0)];
            end
          else
            begin
              reg56 <= $unsigned({(($signed((7'h41)) >= (wire49 > reg58)) ?
                      ($signed(wire52) ?
                          wire48[(1'h0):(1'h0)] : {wire51}) : (^~(wire55 ?
                          (8'haa) : wire42)))});
              reg57 <= $unsigned($signed(wire51[(1'h0):(1'h0)]));
              reg58 <= $unsigned($signed(wire41));
              reg59 <= (~|((~^wire44[(1'h0):(1'h0)]) << wire51[(1'h1):(1'h0)]));
              reg60 <= ({(~&$unsigned(wire46[(4'hd):(2'h2)])),
                  (wire41[(4'he):(1'h1)] == (wire51[(1'h1):(1'h1)] ?
                      $unsigned(reg59) : (8'hb6)))} >>> $unsigned(reg56));
            end
          if (wire51[(2'h3):(1'h1)])
            begin
              reg61 <= (((!($unsigned(reg60) ?
                          (|wire51) : wire54[(4'ha):(3'h7)])) ?
                      (!(8'hbc)) : {$unsigned((wire41 < wire41)), (~^wire54)}) ?
                  {wire41[(1'h1):(1'h0)],
                      ($signed($unsigned(wire44)) ?
                          reg57 : ((wire47 ?
                              (8'ha5) : reg60) <<< $signed(reg60)))} : $signed(((~|((8'ha4) ?
                      wire41 : wire48)) ^~ (^$signed(wire41)))));
              reg62 <= $signed($unsigned({($signed(reg56) ?
                      $unsigned((8'ha2)) : $signed(wire50))}));
              reg63 <= $unsigned($unsigned((8'hb1)));
            end
          else
            begin
              reg61 <= $unsigned(((wire53[(5'h10):(2'h3)] > wire52[(1'h1):(1'h1)]) ?
                  $unsigned($unsigned(reg63)) : wire51[(3'h4):(2'h3)]));
              reg62 <= wire55;
              reg63 <= reg58[(2'h3):(2'h2)];
              reg64 <= wire48;
              reg65 <= (^~(~|(8'h9e)));
            end
          reg66 <= ($unsigned($signed(((reg61 | (8'ha8)) <= ((8'hae) ?
                  reg64 : reg65)))) ?
              ({(^~(wire41 * (8'hb5))), reg62} ?
                  $unsigned(((reg56 ?
                      reg62 : reg65) * {reg64})) : $signed($signed($signed(reg61)))) : (-(8'hb0)));
          reg67 <= reg56;
          reg68 <= wire49;
        end
      reg69 <= (!{$signed($unsigned((~&wire49)))});
    end
  assign wire70 = (((~|(~reg64[(1'h0):(1'h0)])) - (~|(~reg61[(3'h6):(3'h5)]))) ^~ reg56);
  assign wire71 = ($signed((~&$unsigned((8'ha5)))) & reg68);
  assign wire72 = (|$unsigned($unsigned($signed(((8'ha5) || (7'h41))))));
  assign wire73 = $signed((((wire53[(4'h9):(4'h8)] ?
                          (reg67 ~^ (8'ha2)) : wire42[(4'hf):(4'he)]) - ((reg62 != (8'haa)) ?
                          (~&reg64) : (reg59 || wire54))) ?
                      (8'hb9) : $signed($signed($signed((8'haf))))));
endmodule
