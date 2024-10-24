module top
#(parameter param94 = ((!({(8'haf)} ? (^~(~|(8'hab))) : (|{(8'ha6), (8'had)}))) < (((+{(8'hb3), (7'h41)}) >>> ((8'hb0) ? (!(8'hbd)) : (&(8'hac)))) ~^ (|((|(8'hb5)) ^ (8'haa))))), 
parameter param95 = {((({param94} >> (param94 ~^ param94)) ^~ (~((8'haa) <<< param94))) <<< (^~((^param94) ? (param94 && (8'hae)) : (param94 >= param94)))), (({(param94 && param94)} ? param94 : param94) | ({(param94 ? param94 : param94), (param94 & (8'hb9))} * {(param94 ? param94 : param94), (-param94)}))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire87;
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  assign y = {wire93,
                 wire89,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 wire20,
                 wire87,
                 reg92,
                 reg91,
                 reg90,
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
                 (1'h0)};
  assign wire5 = (~&{wire0[(3'h4):(1'h0)]});
  assign wire6 = (({{{(7'h44), wire2}}} ~^ $unsigned(wire0)) ?
                     ({(^~{wire1})} & {wire0[(1'h0):(1'h0)],
                         $signed((wire2 ?
                             wire4 : wire3))}) : $unsigned($signed($signed(wire2))));
  assign wire7 = ({($signed({wire4}) < $unsigned((wire6 << wire4)))} != $signed(wire3));
  always
    @(posedge clk) begin
      reg8 <= wire1;
      reg9 <= ((wire4[(2'h3):(2'h3)] ?
          $unsigned({{wire7}}) : (((wire2 & wire1) ~^ wire3) >>> $signed({wire1,
              wire2}))) ~^ $unsigned($unsigned($signed(wire4))));
      reg10 <= (wire7[(3'h5):(1'h0)] | ($signed(wire2[(4'hd):(1'h0)]) > reg8));
      if ($signed($unsigned($signed(($signed(wire3) ?
          $signed(wire0) : $signed(wire2))))))
        begin
          if (({(~|$signed((~|(8'ha9))))} || (8'haf)))
            begin
              reg11 <= (wire4 <<< {(wire3 ~^ ($unsigned(wire5) + wire3))});
              reg12 <= ($signed((reg8 & wire7)) ?
                  (~|$unsigned(({reg8} != $unsigned(wire4)))) : ((-$signed($unsigned(reg8))) ?
                      $unsigned(($unsigned(wire0) >> ((8'hab) ?
                          wire3 : wire3))) : ($signed((wire2 ?
                          reg9 : reg8)) - wire0)));
              reg13 <= wire2;
              reg14 <= $signed($unsigned({reg12}));
            end
          else
            begin
              reg11 <= $unsigned($unsigned($unsigned($signed(wire3))));
              reg12 <= {reg8[(2'h2):(1'h0)],
                  ({$signed($unsigned((8'hbd))),
                      wire5[(3'h4):(2'h2)]} > (8'hbe))};
              reg13 <= $unsigned({{wire0[(2'h2):(1'h0)], (8'ha7)}});
              reg14 <= reg14[(4'h8):(2'h2)];
            end
          reg15 <= ($signed($signed($signed((8'hae)))) & $signed(wire5[(2'h2):(2'h2)]));
          if ((~^$signed(reg11)))
            begin
              reg16 <= (wire1[(4'hd):(4'hb)] ?
                  $signed((reg9 ?
                      {(8'ha1)} : $unsigned((wire3 <= wire6)))) : wire1);
              reg17 <= $unsigned((wire1[(4'h9):(3'h6)] ?
                  ($signed($unsigned(wire0)) ?
                      reg10 : (wire1 ?
                          $unsigned(reg15) : wire5)) : $signed((((7'h43) ~^ wire3) ?
                      reg12 : wire6[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg16 <= (+reg13);
              reg17 <= wire3[(1'h1):(1'h0)];
              reg18 <= $unsigned((^$unsigned($signed(wire2[(3'h4):(2'h3)]))));
            end
        end
      else
        begin
          reg11 <= {(^~reg13), reg15};
          reg12 <= (((reg11 >= $unsigned(wire1[(3'h7):(3'h6)])) >= {reg13,
                  $unsigned((~|reg8))}) ?
              ((($unsigned(reg18) ? wire1 : wire5) ?
                  (8'hb8) : (~&(^wire3))) && {($signed(wire2) ?
                      ((8'ha5) & wire1) : reg16),
                  {(wire1 * wire5),
                      reg16[(4'h9):(3'h7)]}}) : ($signed({$unsigned(wire2)}) ?
                  {$signed((reg15 & reg17)), reg11} : reg16[(2'h2):(1'h0)]));
          reg13 <= wire2;
          reg14 <= (~&$signed(wire1[(3'h5):(2'h3)]));
        end
    end
  assign wire19 = $unsigned($unsigned(wire5[(3'h6):(2'h2)]));
  assign wire20 = (reg13[(1'h1):(1'h1)] ?
                      (^~({(8'ha9)} ?
                          wire0[(3'h4):(3'h4)] : ((reg9 ^ reg11) << $signed(wire7)))) : (^~(~|(&((8'hb4) ?
                          wire7 : wire19)))));
  module21 #() modinst88 (.wire24(reg17), .wire23(reg14), .wire22(wire20), .clk(clk), .wire25(reg18), .y(wire87));
  assign wire89 = ($unsigned(($signed(((8'hbd) || reg18)) | (~^(wire1 ?
                      wire19 : wire3)))) << ({wire19} ?
                      reg17 : ({(reg15 ^ (8'hbc)), reg8} >= (8'hae))));
  always
    @(posedge clk) begin
      reg90 <= ((8'hb0) ?
          $signed($signed(((-wire0) <= wire1))) : ((reg10[(3'h5):(2'h3)] <= $signed({reg13,
              reg9})) < {($signed(wire19) >> (wire7 + wire4))}));
      reg91 <= reg13[(3'h4):(2'h2)];
      reg92 <= $signed({reg10});
    end
  assign wire93 = (8'hb9);
endmodule

module module21
#(parameter param86 = ((^(!({(8'haf), (8'h9d)} ? (~&(8'had)) : ((8'ha4) ? (8'had) : (8'hba))))) || ((~&(8'hb5)) ? (|((+(8'hb1)) && ((8'hba) ? (8'hb6) : (8'hae)))) : (((^~(8'hae)) - (|(8'hb1))) ? {(+(8'hbd)), ((8'hb6) - (8'had))} : {((7'h44) ? (8'hba) : (8'ha9)), ((8'ha9) ~^ (8'hb6))}))))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire23;
  input wire signed [(5'h12):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire [(4'hf):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire26;
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire31,
                 wire26,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  assign wire26 = $signed((^(($signed(wire23) <<< {wire24}) ?
                      (~^wire22[(4'h9):(1'h1)]) : ($signed(wire24) <= wire24))));
  always
    @(posedge clk) begin
      reg27 <= wire23;
      reg28 <= $unsigned(wire22[(1'h0):(1'h0)]);
      reg29 <= (({reg28[(3'h4):(1'h0)],
          {(~|reg27),
              (wire22 ?
                  wire22 : wire23)}} >>> (^wire26[(1'h1):(1'h1)])) - $unsigned(($unsigned((wire25 ?
              wire26 : wire23)) ?
          (!(wire24 & wire24)) : ({reg27, reg28} || $unsigned(wire26)))));
      reg30 <= (($signed($unsigned((reg28 ~^ reg28))) ?
          (^~wire23[(3'h6):(3'h5)]) : $signed(($unsigned((8'ha9)) + $signed(reg27)))) >>> ((((wire26 | wire26) ?
              reg29 : ((8'haf) >> wire25)) ?
          (wire23 > (~|reg28)) : (8'hb4)) * $signed(($unsigned(wire26) ?
          $unsigned(wire26) : wire26))));
    end
  assign wire31 = wire25[(3'h4):(3'h4)];
  module32 #() modinst65 (wire64, clk, wire23, wire26, wire31, wire24, reg29);
  assign wire66 = $signed(reg29[(3'h6):(1'h1)]);
  assign wire67 = (wire23 ?
                      wire31 : (~|(^~((reg30 ^~ (8'haf)) ?
                          wire22[(5'h10):(1'h0)] : (8'haf)))));
  assign wire68 = ((!$unsigned((~|(wire64 ? wire23 : (8'h9f))))) ?
                      ((|wire64[(2'h3):(2'h2)]) <<< ((~^(|wire67)) >>> $signed($signed(reg27)))) : $signed($signed(wire66)));
  assign wire69 = $signed(wire68);
  always
    @(posedge clk) begin
      reg70 <= (8'ha5);
      reg71 <= $signed(wire64);
    end
  always
    @(posedge clk) begin
      reg72 <= $signed($unsigned(wire26));
      if ({((&(reg29 ?
              (!wire64) : ((8'hbc) ?
                  reg28 : reg27))) && $unsigned((-(reg29 == wire66))))})
        begin
          reg73 <= wire23;
          if ($unsigned((wire68 ? reg71 : wire68)))
            begin
              reg74 <= reg28[(4'h9):(3'h6)];
              reg75 <= {wire64, wire64[(2'h3):(1'h0)]};
              reg76 <= reg29;
              reg77 <= {reg29[(4'ha):(1'h0)]};
              reg78 <= (wire67 >>> wire67[(3'h7):(2'h3)]);
            end
          else
            begin
              reg74 <= (($unsigned(((wire67 * (8'h9c)) | $unsigned(wire24))) ?
                      ((~(wire23 * reg73)) >> (((8'haa) || reg70) ?
                          reg27 : reg28)) : wire25) ?
                  $unsigned(({wire31,
                      $unsigned(reg74)} - reg27)) : $unsigned($unsigned(wire68[(2'h3):(2'h3)])));
              reg75 <= ((reg78[(3'h6):(1'h1)] ?
                      (($signed(wire24) << $unsigned(reg76)) ?
                          ((-wire31) ?
                              $unsigned((8'ha6)) : (reg75 != reg74)) : $signed((reg78 ?
                              reg71 : wire25))) : (reg74 ?
                          $unsigned($unsigned(reg29)) : ((^~reg29) ?
                              (wire31 ^~ reg77) : $unsigned(reg27)))) ?
                  $signed($unsigned(wire24)) : $unsigned((8'ha8)));
            end
        end
      else
        begin
          reg73 <= $signed(((|wire24[(4'hc):(3'h7)]) << ((!(reg70 <= reg29)) ?
              ((reg77 ? wire66 : wire23) ?
                  wire68 : (wire23 & wire64)) : {wire67[(4'h8):(2'h2)]})));
          reg74 <= $unsigned({($unsigned(reg29[(5'h11):(5'h10)]) ?
                  (~reg76[(3'h7):(2'h3)]) : $unsigned($signed(wire22)))});
        end
    end
  assign wire79 = {reg75};
  assign wire80 = reg29[(1'h1):(1'h0)];
  assign wire81 = (|(((!wire24[(4'ha):(3'h5)]) >> {{reg28},
                          (wire25 ? reg77 : reg74)}) ?
                      ($unsigned($signed(wire25)) ?
                          {(~^reg71)} : $unsigned((wire23 || reg77))) : {((wire31 ?
                              reg74 : reg29) >>> wire68),
                          (~^wire66)}));
  assign wire82 = $unsigned($unsigned(reg77[(3'h5):(3'h4)]));
  assign wire83 = wire81;
  assign wire84 = wire25;
  assign wire85 = (|(wire67[(4'hc):(4'h8)] ?
                      $signed(wire26) : ({$signed(wire66)} <= (+wire24))));
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire37;
  input wire signed [(4'hc):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire35;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(5'h13):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
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
                 wire38,
                 reg57,
                 reg56,
                 reg55,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire38 = (-(8'hb6));
  assign wire39 = $signed(((~|wire35[(5'h15):(5'h10)]) != {(((8'ha9) ?
                              wire33 : wire38) ?
                          wire33[(1'h1):(1'h1)] : ((7'h43) <<< wire35)),
                      $signed($unsigned(wire37))}));
  always
    @(posedge clk) begin
      reg40 <= $unsigned($signed($signed(((^wire38) << $unsigned(wire34)))));
      reg41 <= wire38[(3'h7):(1'h1)];
    end
  assign wire42 = (~$signed(wire37));
  assign wire43 = (-$signed(($signed((8'hbc)) ?
                      (~^$signed(wire38)) : $unsigned(wire36))));
  assign wire44 = $unsigned((8'hb8));
  assign wire45 = $unsigned(wire33[(2'h2):(2'h2)]);
  assign wire46 = (~(8'hba));
  assign wire47 = ({(~&wire45)} > (!wire36[(2'h2):(2'h2)]));
  assign wire48 = {$unsigned($signed(((wire44 & (8'hb1)) + (~|wire46))))};
  assign wire49 = wire36;
  assign wire50 = $unsigned({$signed($unsigned(((8'hb6) < wire33)))});
  assign wire51 = $unsigned((~&(^wire42)));
  assign wire52 = $signed(reg41);
  assign wire53 = (&$unsigned(wire34));
  assign wire54 = (wire38[(4'h8):(2'h3)] | (($unsigned($signed(reg40)) & wire45[(3'h4):(2'h3)]) ?
                      $signed(($unsigned(wire53) == (wire44 ?
                          reg40 : (8'ha7)))) : (^~wire46[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg55 <= wire43[(4'he):(3'h4)];
      reg56 <= wire47;
      reg57 <= {(wire43 - ($unsigned($unsigned(wire37)) ?
              $signed(reg55[(4'h8):(2'h2)]) : ($signed((8'hb6)) < (8'hb8)))),
          (wire36 || ($signed((8'hbc)) >>> $unsigned($unsigned(reg40))))};
    end
  assign wire58 = (-(8'hbd));
  assign wire59 = $unsigned({($unsigned((wire34 <<< wire37)) ?
                          $unsigned((wire58 ?
                              reg55 : reg40)) : {wire52[(3'h7):(3'h5)],
                              wire36[(3'h6):(3'h6)]})});
  assign wire60 = (&($unsigned((wire52[(4'ha):(4'h9)] ?
                      (wire59 ?
                          wire51 : wire38) : (^wire49))) - wire36[(1'h1):(1'h0)]));
  assign wire61 = $signed($unsigned((&$signed($unsigned(wire50)))));
  assign wire62 = (wire58[(1'h0):(1'h0)] << wire48);
  assign wire63 = (reg57 <= (&(&($unsigned(wire47) >= (wire37 < wire61)))));
endmodule
