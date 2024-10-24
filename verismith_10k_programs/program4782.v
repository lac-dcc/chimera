module top
#(parameter param89 = ((((((8'hb1) ? (8'ha1) : (8'ha4)) ? (!(8'h9f)) : ((8'had) != (8'h9f))) << (((8'hb4) << (8'h9c)) ? (+(8'hbb)) : (+(8'hbb)))) ? (-(|((7'h44) <= (7'h43)))) : (!{((8'haf) && (8'hb6))})) * (8'ha1)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire41;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire68,
                 wire43,
                 wire41,
                 (1'h0)};
  module4 #() modinst42 (wire41, clk, wire0, wire2, wire3, wire1);
  assign wire43 = ($unsigned((8'h9d)) - wire1[(1'h1):(1'h1)]);
  module44 #() modinst69 (wire68, clk, wire2, wire41, wire3, wire0);
  module70 #() modinst82 (wire81, clk, wire43, wire68, wire2, wire3);
  assign wire83 = $unsigned(wire2[(2'h2):(1'h1)]);
  assign wire84 = wire41[(2'h3):(2'h2)];
  assign wire85 = (~|$unsigned(({wire84[(4'h8):(2'h2)], $signed(wire0)} ?
                      ($unsigned(wire3) < $signed(wire2)) : ((wire1 ?
                          wire81 : wire1) - wire68[(3'h6):(2'h2)]))));
  assign wire86 = {{(((wire2 ? (8'h9d) : wire41) ?
                                  {wire1, wire2} : (wire85 ? wire0 : wire84)) ?
                              (8'hb9) : (wire85[(3'h6):(3'h5)] <<< wire1[(2'h2):(2'h2)])),
                          (wire85 >= $unsigned($signed(wire68)))},
                      (wire81 << wire1)};
  assign wire87 = (&$unsigned((+$unsigned((8'ha4)))));
  assign wire88 = ($signed(($unsigned($unsigned(wire0)) < wire1[(4'h9):(2'h3)])) ?
                      {wire1} : (&((!wire2) ?
                          ((wire83 <= wire87) < wire83[(3'h5):(3'h5)]) : wire84)));
endmodule

module module70
#(parameter param80 = (~|(-((((8'ha7) <<< (8'ha4)) ? (&(8'ha7)) : ((8'hbf) ? (8'hb2) : (8'ha1))) <= {((8'h9e) ? (8'h9d) : (8'hb4))}))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire74;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire [(4'he):(1'h0)] wire72;
  input wire signed [(4'hc):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'hb):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  assign y = {wire79, wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = ($unsigned(wire71) | $signed((~$signed($unsigned(wire74)))));
  assign wire76 = (8'ha4);
  assign wire77 = (wire74[(2'h2):(1'h1)] ?
                      wire74 : $unsigned($unsigned(wire71[(3'h4):(2'h2)])));
  assign wire78 = wire77;
  assign wire79 = wire74[(4'ha):(3'h4)];
endmodule

module module44
#(parameter param67 = (!((^(+(~(8'ha2)))) ? ((((8'ha8) ? (8'hbc) : (8'ha3)) ? ((7'h43) < (8'hb8)) : ((8'ha4) ? (8'hba) : (8'ha4))) ? (((8'h9c) >> (8'hb5)) <<< ((8'h9c) ? (8'h9e) : (8'ha3))) : (((8'hbc) ? (8'h9f) : (8'hbd)) ? ((8'haa) + (8'hb6)) : ((7'h41) ? (8'hb8) : (8'ha3)))) : ((((8'hba) ~^ (7'h43)) ? (!(7'h43)) : ((8'hae) ? (8'had) : (8'ha1))) <<< (~^{(8'hab), (8'had)})))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  input wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire49;
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire66,
                 wire52,
                 wire49,
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
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire49 = wire48[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg50 <= wire49[(2'h3):(2'h2)];
      reg51 <= (({(-(|wire47)),
          (wire49[(4'ha):(3'h5)] | wire47[(4'ha):(3'h5)])} ~^ wire46[(3'h6):(1'h0)]) << $signed((~|wire45[(1'h0):(1'h0)])));
    end
  assign wire52 = {wire47[(4'hc):(3'h5)]};
  always
    @(posedge clk) begin
      if (wire45[(3'h5):(2'h2)])
        begin
          if ((8'ha0))
            begin
              reg53 <= (8'hbc);
              reg54 <= $unsigned($unsigned(($unsigned($signed(wire48)) ?
                  $unsigned((wire46 << wire46)) : reg50[(4'hc):(1'h0)])));
              reg55 <= $signed($unsigned(reg54[(4'he):(3'h6)]));
              reg56 <= $signed({reg55[(2'h2):(2'h2)]});
            end
          else
            begin
              reg53 <= ({{{$unsigned(wire47), (reg56 ^~ wire52)},
                      $unsigned((-wire48))}} >= (&(^reg56)));
              reg54 <= wire49;
              reg55 <= (reg54[(1'h1):(1'h0)] ?
                  ($unsigned((reg53 ?
                      wire47 : $unsigned((8'ha7)))) != (~&reg51)) : ($unsigned($signed($unsigned((8'ha6)))) ?
                      {((reg50 != wire52) ?
                              (^~reg54) : $unsigned(wire45))} : $unsigned(wire48)));
              reg56 <= wire48;
            end
          if (((~&(reg50[(1'h1):(1'h1)] ?
              (reg55[(2'h3):(1'h0)] ?
                  (wire48 <<< wire46) : $signed(reg56)) : $signed((wire45 ^ (8'hbd))))) ^ $unsigned((wire47[(3'h6):(2'h3)] ?
              $signed(wire49) : $unsigned($signed(reg51))))))
            begin
              reg57 <= ((wire52[(2'h3):(2'h3)] & ((~^((8'hac) ?
                          wire49 : (8'ha2))) ?
                      reg56 : (reg51[(4'h9):(3'h7)] ?
                          $unsigned(wire47) : (wire45 ? (8'ha1) : (8'hb1))))) ?
                  (((reg54[(2'h2):(1'h1)] >>> (wire48 ? (8'hac) : wire52)) ?
                          wire47[(4'hc):(4'hc)] : $signed($unsigned(reg50))) ?
                      ((~|$unsigned(wire45)) ?
                          reg55[(2'h2):(1'h0)] : $signed(wire47)) : $signed(reg51)) : {$signed($signed(reg55[(1'h0):(1'h0)]))});
              reg58 <= wire47;
              reg59 <= reg58;
              reg60 <= (|({{(8'ha7), (^~reg58)}, (reg56 ~^ $signed(reg57))} ?
                  ($unsigned($signed(reg53)) ?
                      (+((8'ha6) * reg57)) : reg50) : reg53[(1'h1):(1'h0)]));
            end
          else
            begin
              reg57 <= {$unsigned($unsigned(((reg56 & reg60) ?
                      ((8'ha1) || reg58) : $signed(reg54)))),
                  (|{(reg60[(4'hd):(4'hc)] & (reg53 != reg57)),
                      {$unsigned(wire49), reg53}})};
              reg58 <= wire47[(4'hb):(1'h0)];
              reg59 <= reg58[(4'ha):(3'h5)];
              reg60 <= $unsigned($unsigned((&reg55[(1'h0):(1'h0)])));
            end
          reg61 <= $signed((8'hbc));
          reg62 <= (+$unsigned(($signed($signed(reg54)) ?
              (~^$unsigned(reg57)) : {(!reg50), $signed(wire46)})));
        end
      else
        begin
          if ((+(~((!reg57[(4'hb):(1'h1)]) ?
              ((wire45 - reg60) ?
                  $signed(wire52) : (reg57 ? reg61 : (8'hb8))) : {(~reg54)}))))
            begin
              reg53 <= (&(~&reg58));
              reg54 <= (((wire47 ?
                  (!{reg60}) : ((reg61 ? wire52 : (8'hb3)) + (reg51 ?
                      reg56 : reg59))) | (((~&(8'ha6)) ^~ wire47) >> (reg62 ?
                  (+(8'hbc)) : (reg55 >= reg57)))) ^ reg56);
              reg55 <= ($signed(reg54) && reg53[(2'h2):(2'h2)]);
              reg56 <= reg60[(4'hf):(2'h3)];
              reg57 <= $signed(wire48[(3'h5):(1'h0)]);
            end
          else
            begin
              reg53 <= (^{$unsigned((~wire47)), reg62});
              reg54 <= reg60;
              reg55 <= reg59;
              reg56 <= ((reg53 ?
                  wire46 : $unsigned(((wire47 >>> wire49) - $signed(wire49)))) >= $signed(reg57[(4'hd):(3'h5)]));
              reg57 <= $signed($unsigned(wire48[(3'h7):(3'h6)]));
            end
          reg58 <= $signed(reg57[(3'h4):(3'h4)]);
        end
      reg63 <= ((^wire45) ?
          ({$unsigned($signed(wire46)), $signed({wire48})} ?
              reg50 : $unsigned((8'h9e))) : wire52[(1'h0):(1'h0)]);
      reg64 <= wire48;
      reg65 <= $unsigned(wire49[(1'h1):(1'h1)]);
    end
  assign wire66 = {$signed(wire46[(3'h5):(2'h2)])};
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire5;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire [(4'h9):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire38;
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  assign y = {wire40,
                 wire9,
                 wire38,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire9 = wire5[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      if ((~|((($unsigned(wire5) ?
                  (wire6 ? (8'ha9) : wire8) : (wire5 + wire7)) ?
              $unsigned((wire9 ? wire8 : wire9)) : {$unsigned(wire7)}) ?
          (wire7[(3'h4):(2'h3)] + $signed($signed((8'hb7)))) : ((((7'h41) * wire8) ?
                  (wire6 ^~ wire9) : wire6[(4'h8):(3'h6)]) ?
              $unsigned((wire6 ? (8'haf) : wire8)) : $unsigned(wire5)))))
        begin
          reg10 <= wire7[(2'h3):(2'h3)];
          reg11 <= (+wire6[(2'h2):(1'h0)]);
          reg12 <= wire5[(3'h6):(2'h2)];
        end
      else
        begin
          reg10 <= ($signed((~^({wire7, reg12} ?
              (reg11 ? reg11 : wire8) : (reg10 >>> reg11)))) << reg12);
          if ((+$unsigned($unsigned({(reg11 * wire5), $unsigned(wire5)}))))
            begin
              reg11 <= ($signed((&$signed(reg10))) ?
                  ((!wire5) ?
                      (~|wire6) : reg12) : $signed((($signed(reg12) ^ wire7[(3'h4):(1'h0)]) ?
                      wire5 : $unsigned($signed(wire8)))));
              reg12 <= reg10;
              reg13 <= wire6[(3'h4):(1'h1)];
            end
          else
            begin
              reg11 <= $signed(wire9[(3'h7):(1'h0)]);
              reg12 <= reg13;
              reg13 <= reg12[(4'hd):(2'h3)];
              reg14 <= wire9;
              reg15 <= $unsigned({{wire6}, wire8[(3'h7):(2'h3)]});
            end
          reg16 <= $signed($signed($unsigned($unsigned($signed(reg14)))));
          reg17 <= (!reg13);
        end
    end
  module18 #() modinst39 (wire38, clk, reg11, reg16, wire8, reg12);
  assign wire40 = wire7;
endmodule

module module18
#(parameter param37 = ({(((-(8'ha4)) << (^~(8'ha5))) ? ((&(8'hbd)) << (8'hb9)) : (((8'ha1) == (8'hb7)) & {(8'hbe), (8'h9e)})), (8'ha9)} - (+(!(((8'ha7) || (8'haf)) ? {(8'ha6)} : (^(8'hae)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(4'hd):(1'h0)] wire20;
  input wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire23;
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire25,
                 wire24,
                 wire23,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire23 = wire21;
  assign wire24 = ($signed($unsigned({$signed(wire20),
                      $unsigned(wire19)})) >> {wire22[(1'h1):(1'h0)],
                      $signed(wire19)});
  assign wire25 = $signed(wire24[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      if ($signed(wire25))
        begin
          reg26 <= wire20[(1'h1):(1'h1)];
          if ((($signed((wire24 ?
                  {wire20} : (reg26 ?
                      wire23 : (7'h44)))) < wire24[(2'h3):(1'h1)]) ?
              $unsigned(wire20) : {($unsigned({wire25, wire20}) ?
                      ({(8'hbe), wire24} ?
                          (~^(8'hb7)) : reg26[(5'h11):(5'h10)]) : $unsigned($signed(wire22)))}))
            begin
              reg27 <= $unsigned($signed(wire23));
            end
          else
            begin
              reg27 <= (~|wire24[(2'h3):(2'h2)]);
              reg28 <= $unsigned({reg27[(1'h1):(1'h0)]});
            end
          reg29 <= ($signed((^wire22[(4'hd):(3'h5)])) ?
              $signed({wire24[(1'h1):(1'h1)],
                  $unsigned(wire23[(3'h7):(3'h4)])}) : $signed(reg27[(1'h0):(1'h0)]));
        end
      else
        begin
          if (((wire19[(3'h4):(2'h2)] ?
                  (8'h9f) : (reg28 < wire20[(3'h4):(2'h2)])) ?
              wire20 : (&$unsigned((reg28 <<< (wire19 && wire19))))))
            begin
              reg26 <= $signed(($signed(((wire25 ?
                      wire20 : wire23) && wire23)) ?
                  $unsigned(((reg26 + wire23) != (^wire25))) : $signed((~|(8'h9c)))));
              reg27 <= ($signed(reg26[(4'ha):(3'h5)]) ?
                  $unsigned($signed(reg29[(4'hc):(2'h2)])) : $signed($signed(wire19[(3'h4):(1'h1)])));
              reg28 <= reg27;
              reg29 <= {(($unsigned($unsigned(wire21)) >> $signed($unsigned(reg28))) < ($signed((wire22 ?
                          (8'h9c) : (8'had))) ?
                      wire25[(4'h9):(3'h7)] : (+$signed(wire22)))),
                  (~^(wire22 * {$unsigned(wire22), (reg28 || wire21)}))};
            end
          else
            begin
              reg26 <= $unsigned((~^((-((8'hbd) >> wire24)) ?
                  (~(&wire24)) : $signed((|reg26)))));
              reg27 <= ($unsigned({$signed((reg27 >> wire23))}) ?
                  wire23 : $unsigned(($unsigned($unsigned(reg27)) ?
                      ({reg27, reg26} ?
                          (reg27 ?
                              reg26 : reg26) : (wire25 << (8'hbd))) : (reg29[(4'ha):(2'h2)] && (reg26 | (7'h44))))));
            end
          reg30 <= $signed($unsigned($signed(wire20[(4'hb):(1'h1)])));
          reg31 <= wire25[(3'h6):(3'h5)];
        end
      reg32 <= ({(~&(^$unsigned(reg31)))} ?
          $signed($signed((-(reg29 - (8'hb7))))) : ((8'ha1) ?
              (wire25[(4'ha):(4'h8)] ?
                  ($unsigned(reg27) & $signed(wire24)) : (^~$unsigned(wire25))) : (((~|wire23) ?
                  wire20 : reg31[(3'h5):(3'h4)]) >= $unsigned($signed(reg30)))));
      reg33 <= $signed((~($unsigned({reg29, reg27}) ?
          $signed(reg29[(3'h5):(2'h3)]) : {wire20[(1'h0):(1'h0)]})));
      reg34 <= $signed((-$signed(({wire24, wire20} <= (wire24 ?
          wire22 : reg29)))));
    end
  assign wire35 = (&(((((8'ha0) ^~ reg26) ?
                              wire21[(4'hd):(4'h9)] : (wire21 | (8'hbb))) ?
                          (reg30[(3'h4):(2'h3)] ?
                              $unsigned(wire21) : (wire19 ?
                                  reg31 : reg26)) : ({reg31, reg34} ?
                              wire22[(4'hd):(1'h1)] : wire23[(4'h8):(3'h7)])) ?
                      ((^(wire24 ?
                          wire23 : reg32)) && (~|reg26[(4'hc):(4'hc)])) : $unsigned(wire22[(4'hb):(3'h6)])));
  assign wire36 = (wire20[(4'ha):(1'h0)] ?
                      (|(reg29 ?
                          ($unsigned((8'ha4)) < (reg30 ~^ reg33)) : {(&(8'hb4))})) : $unsigned(reg26[(4'he):(2'h2)]));
endmodule
