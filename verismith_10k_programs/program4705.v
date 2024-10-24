module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire64;
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  assign y = {wire76,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire5,
                 wire6,
                 wire7,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire64,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire5 = $signed(wire2);
  assign wire6 = ($signed(wire2[(4'he):(2'h3)]) ~^ ((((wire2 < wire0) - wire3) - {(wire3 ^ wire5)}) ^ (8'ha4)));
  assign wire7 = $unsigned(wire1[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= (~^((wire3[(1'h1):(1'h0)] ? wire3 : wire3) ~^ (8'hb9)));
      reg9 <= wire4;
      if ($unsigned($signed((~^(~{wire4})))))
        begin
          reg10 <= $signed($signed({reg9[(3'h5):(3'h4)],
              ($signed(reg9) <= ((8'ha2) > wire1))}));
          if ($signed(((wire7 >= wire5) >= (((wire1 << reg9) ?
                  ((8'hb7) >= wire6) : $unsigned(wire7)) ?
              $unsigned((|wire0)) : (^~wire2[(4'hc):(1'h1)])))))
            begin
              reg11 <= (($unsigned($unsigned(wire2[(4'he):(4'h8)])) ?
                      $signed((8'h9d)) : (($unsigned(wire4) ?
                          (wire6 ?
                              wire2 : reg9) : {reg9}) ^~ reg10[(3'h7):(2'h3)])) ?
                  {$signed(reg8)} : reg8[(1'h0):(1'h0)]);
              reg12 <= reg11;
            end
          else
            begin
              reg11 <= (^((reg10[(4'hd):(4'ha)] != ((wire6 | wire5) ?
                  (^~reg11) : wire3[(3'h4):(2'h2)])) ~^ ($unsigned({(8'ha6),
                  wire7}) + $unsigned(wire3))));
              reg12 <= (($signed(wire0) ?
                      wire0[(3'h6):(3'h5)] : reg8[(4'h8):(4'h8)]) ?
                  $unsigned(((&wire6[(1'h0):(1'h0)]) ?
                      (!$unsigned(wire6)) : reg9)) : {(8'hbf)});
            end
          reg13 <= (~&(+{(8'hbd), reg9}));
          reg14 <= $unsigned($signed(wire5));
        end
      else
        begin
          reg10 <= (~|wire1[(4'h8):(1'h0)]);
          if (wire5)
            begin
              reg11 <= wire4[(4'hc):(3'h7)];
              reg12 <= wire0[(2'h2):(2'h2)];
              reg13 <= wire0[(4'he):(4'h9)];
              reg14 <= {(reg14[(1'h0):(1'h0)] ?
                      {$signed($unsigned(wire1))} : $signed($unsigned((reg9 - wire4)))),
                  ((wire2[(2'h3):(1'h1)] ?
                          {$unsigned((8'ha6)),
                              {(8'hb4), reg9}} : (|{(8'h9f)})) ?
                      $signed((wire3[(1'h1):(1'h0)] >>> (wire2 ?
                          (8'ha6) : wire5))) : reg9[(4'ha):(2'h2)])};
            end
          else
            begin
              reg11 <= wire3[(2'h3):(2'h3)];
            end
        end
    end
  assign wire15 = (reg9 ?
                      (+$unsigned({(wire6 > (8'hbf))})) : ({((wire6 >>> wire5) == reg12),
                          reg11} <= reg9[(3'h6):(3'h6)]));
  assign wire16 = reg11;
  assign wire17 = {wire2[(4'hc):(4'h9)]};
  assign wire18 = $signed($signed(({(~wire4)} | $signed($unsigned((8'ha6))))));
  module19 #() modinst65 (wire64, clk, reg10, wire4, reg13, reg12);
  assign wire66 = ($signed({reg12[(3'h6):(3'h4)],
                      $signed($signed(wire4))}) ~^ {$unsigned((~&reg11))});
  assign wire67 = (~|$unsigned($signed(((wire15 ? wire4 : (8'ha9)) && {wire6,
                      wire18}))));
  assign wire68 = (((wire0 + (wire1 ^~ reg10[(5'h12):(2'h2)])) ^ $signed({$unsigned(reg13),
                      $signed(wire66)})) - $unsigned($unsigned((wire3 ~^ {wire64,
                      (7'h40)}))));
  assign wire69 = reg8;
  always
    @(posedge clk) begin
      reg70 <= $unsigned($signed(wire0[(4'hf):(4'hf)]));
      if (((wire67[(3'h5):(3'h4)] <<< wire18) ?
          $signed((wire66[(4'hb):(3'h4)] ^ $signed({reg10}))) : (wire16[(3'h6):(2'h2)] ?
              (reg9[(1'h1):(1'h0)] || $signed((wire69 >>> wire3))) : (((reg11 ?
                      reg13 : wire64) + $signed(reg9)) ?
                  (wire64[(4'h8):(4'h8)] ? reg70 : {wire68}) : reg70))))
        begin
          if ((-$signed({(-(~|wire15)), (wire2 * $unsigned(wire67))})))
            begin
              reg71 <= ({wire66[(3'h4):(2'h3)], wire17} ?
                  ({(~|$unsigned(wire6)), reg14} != {reg13,
                      wire66}) : ((8'ha9) ?
                      ((~|$signed(wire4)) ?
                          {(wire1 ?
                                  wire3 : reg9)} : reg10[(4'hd):(3'h5)]) : $signed($signed(reg10))));
              reg72 <= wire0[(1'h0):(1'h0)];
              reg73 <= (8'hbf);
              reg74 <= $unsigned((+$signed($unsigned((~|(8'ha5))))));
            end
          else
            begin
              reg71 <= $unsigned($signed($signed($signed(reg10))));
            end
        end
      else
        begin
          reg71 <= reg70[(3'h5):(3'h5)];
          reg72 <= {{(reg70 << reg9[(3'h5):(1'h0)]),
                  (($signed(reg70) & (reg12 ? wire69 : reg12)) ?
                      $unsigned((|(8'hb7))) : reg8[(3'h7):(3'h5)])},
              (reg9[(4'ha):(3'h4)] > $unsigned(reg14[(4'h9):(3'h6)]))};
          reg73 <= $signed((wire4[(2'h3):(1'h1)] < reg12[(2'h2):(2'h2)]));
        end
      reg75 <= (wire3[(2'h2):(2'h2)] < $signed(wire6[(1'h0):(1'h0)]));
    end
  assign wire76 = ((8'hb2) ?
                      reg8 : ((reg71[(2'h3):(1'h0)] ?
                          $signed((8'ha9)) : ((|reg11) ?
                              {wire18,
                                  wire69} : wire69[(3'h6):(2'h3)])) <= (&reg14)));
endmodule

module module19
#(parameter param63 = (8'haa))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  assign y = {wire62,
                 wire55,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire24 = ((wire20[(3'h4):(2'h2)] != ((wire23[(1'h0):(1'h0)] && $unsigned(wire20)) << $signed($unsigned(wire20)))) ?
                      (~|(8'hae)) : $signed(wire21));
  assign wire25 = wire23[(1'h1):(1'h1)];
  assign wire26 = ($signed($unsigned($unsigned($signed(wire23)))) ^~ wire20);
  assign wire27 = wire21[(3'h5):(3'h4)];
  assign wire28 = ($signed($unsigned(wire26[(5'h13):(5'h10)])) && {($signed(wire24) | (-(wire24 ?
                          (8'haa) : wire23))),
                      ((wire26 & $unsigned(wire20)) ?
                          (((8'hb7) ?
                              wire22 : (8'hab)) * $signed(wire27)) : ((&(8'hb6)) >>> $unsigned(wire20)))});
  assign wire29 = $signed(wire25[(4'he):(4'he)]);
  assign wire30 = wire22;
  module31 #() modinst56 (.y(wire55), .wire32(wire30), .wire34(wire24), .wire33(wire21), .wire35(wire25), .clk(clk));
  always
    @(posedge clk) begin
      if ((wire20[(2'h3):(2'h3)] ?
          wire27 : ($unsigned((wire25 && wire30[(1'h1):(1'h0)])) & ((wire29 < (8'hae)) + $signed($signed(wire29))))))
        begin
          if ((+$unsigned($unsigned((~^wire26)))))
            begin
              reg57 <= (wire29 && (~wire23));
              reg58 <= wire30[(4'h8):(2'h2)];
            end
          else
            begin
              reg57 <= (|(({$unsigned(reg58)} ?
                      wire21 : $signed((reg57 ^~ wire22))) ?
                  wire29[(3'h4):(1'h0)] : (-$signed({wire26}))));
              reg58 <= wire23[(2'h3):(2'h3)];
              reg59 <= ((^~(^~$signed((wire55 ? wire24 : wire29)))) ?
                  (~&((^{(8'hbb)}) < $unsigned($unsigned(wire27)))) : wire25[(5'h12):(2'h2)]);
              reg60 <= wire23[(3'h4):(2'h3)];
              reg61 <= (wire26 ?
                  $unsigned(wire23[(4'h8):(2'h2)]) : (!$unsigned(wire30[(2'h2):(1'h0)])));
            end
        end
      else
        begin
          reg57 <= (((reg60 ?
                  (((8'hbf) ? wire20 : wire55) ?
                      $signed(wire28) : wire27) : wire24) ?
              wire30 : {(reg59 ? (~(8'hb5)) : wire22[(1'h0):(1'h0)]),
                  ($unsigned((8'hbb)) ?
                      wire28 : $unsigned((8'hae)))}) >= (|$signed((~|{wire55}))));
          reg58 <= reg57[(3'h4):(1'h0)];
          reg59 <= (((reg61 >>> (^(^wire30))) - wire27) ?
              wire29 : ($signed(($unsigned(wire30) || wire29)) && reg57[(1'h1):(1'h0)]));
          reg60 <= (~^reg59);
          reg61 <= wire25[(4'h9):(4'h9)];
        end
    end
  assign wire62 = {$signed($signed(((!wire55) ?
                          wire29[(2'h3):(2'h2)] : (7'h40))))};
endmodule

module module31
#(parameter param53 = (~^(^~(((~(8'hb4)) == (~(8'hbc))) | {((8'had) ? (7'h40) : (8'hb7))}))), 
parameter param54 = param53)
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(4'hc):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  assign y = {wire52,
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
                 wire41,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg40,
                 (1'h0)};
  assign wire36 = {wire35, {(~(^wire35))}};
  assign wire37 = wire34;
  assign wire38 = $unsigned(((+($unsigned(wire33) ?
                      $signed(wire35) : (^wire35))) == $unsigned((~^wire36))));
  assign wire39 = (8'hbe);
  always
    @(posedge clk) begin
      reg40 <= (~{($unsigned(wire38[(2'h2):(1'h1)]) >> $signed($unsigned(wire39))),
          wire34[(3'h4):(2'h2)]});
    end
  assign wire41 = $unsigned(wire33);
  assign wire42 = wire38;
  assign wire43 = (((wire42[(5'h11):(3'h4)] || (wire39[(1'h0):(1'h0)] | {wire42})) * ({$signed(wire39)} > (wire32 >> (~|wire35)))) ?
                      (^~wire32) : wire42);
  assign wire44 = ((^(~&((~|(7'h42)) <<< reg40[(5'h11):(4'hb)]))) << wire42[(3'h4):(3'h4)]);
  assign wire45 = ((^~wire37[(4'hf):(2'h2)]) - {$signed(((wire39 ^ wire36) ?
                          ((8'hb9) ? wire39 : wire33) : (wire42 ?
                              wire39 : wire32))),
                      ($signed((wire42 ? wire38 : wire41)) * {(-wire35)})});
  assign wire46 = $signed(wire42[(3'h6):(2'h3)]);
  assign wire47 = wire42[(4'hf):(4'hc)];
  assign wire48 = $signed($unsigned($signed((&$unsigned(wire39)))));
  assign wire49 = wire44[(1'h1):(1'h1)];
  assign wire50 = wire32[(4'ha):(4'h8)];
  assign wire51 = (((8'ha7) | (-wire37[(4'he):(4'hc)])) ?
                      {($signed($signed(wire38)) <<< (~^$signed(wire39))),
                          wire44[(2'h2):(2'h2)]} : wire36[(3'h5):(2'h2)]);
  assign wire52 = (wire41[(1'h0):(1'h0)] || ((wire42[(5'h11):(4'hb)] >>> ($unsigned(wire35) <= $unsigned(wire46))) ?
                      $unsigned($signed($unsigned((8'haf)))) : ({$signed(wire46)} ?
                          wire39 : (wire44 >>> wire33))));
endmodule
