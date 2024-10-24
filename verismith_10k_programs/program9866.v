module top
#(parameter param153 = ((8'hb5) ? (~^((((8'hb9) == (8'had)) ^ ((8'hac) ^ (8'hab))) ^~ (((8'h9e) || (8'ha4)) ^ ((8'hb7) ? (8'ha0) : (8'ha9))))) : (^((~&((8'hb3) > (8'hbf))) & ((~&(8'hbc)) << {(8'hbe)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire151;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(5'h10):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire68;
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire151,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (&wire0[(5'h14):(4'h8)]);
      reg5 <= wire2[(3'h5):(2'h3)];
      if (reg4[(1'h1):(1'h0)])
        begin
          reg6 <= (wire0[(4'he):(2'h3)] ?
              {((reg5 | wire0[(5'h10):(1'h0)]) ?
                      (+wire0) : ((~wire0) ? $signed(reg5) : $unsigned(wire3))),
                  wire0[(1'h0):(1'h0)]} : {$signed((((8'ha4) | reg4) ?
                      (~&reg5) : $signed((7'h44)))),
                  $signed(wire3)});
        end
      else
        begin
          reg6 <= (($unsigned((^reg4)) ?
              ((wire1 ?
                  $signed(wire2) : {reg6}) || ($unsigned(wire1) && $unsigned(wire0))) : (($unsigned(wire3) ?
                      reg4[(1'h0):(1'h0)] : (reg5 == wire2)) ?
                  $signed($signed(wire1)) : reg4[(1'h0):(1'h0)])) | (&{reg4}));
          if ($unsigned(($signed(((reg4 ? reg5 : reg4) ? reg6 : (~&wire3))) ?
              $unsigned(wire1) : (-wire3[(2'h3):(1'h0)]))))
            begin
              reg7 <= ((^~(wire2[(3'h7):(3'h4)] ?
                  ($signed(wire1) ?
                      wire3 : (reg5 < reg5)) : {$signed(wire1)})) >>> (($unsigned((&wire2)) ?
                  reg5 : (wire0 ^ (wire3 <<< (8'hb4)))) & {reg5[(1'h0):(1'h0)]}));
              reg8 <= $signed(reg5[(1'h0):(1'h0)]);
              reg9 <= (&({((wire2 + reg6) ?
                          $unsigned((8'hb6)) : $unsigned(wire1))} ?
                  ({wire0} ? reg6 : wire3[(3'h4):(1'h0)]) : (8'hbf)));
              reg10 <= $unsigned(({reg6[(1'h0):(1'h0)]} ?
                  {{(8'ha4)}} : $unsigned($signed(wire3))));
            end
          else
            begin
              reg7 <= (&$signed((8'hb2)));
              reg8 <= wire2[(4'h9):(2'h2)];
              reg9 <= (!(8'hba));
            end
        end
    end
  module11 #() modinst69 (.clk(clk), .wire12(wire1), .wire14(wire0), .wire15(reg4), .wire13(wire3), .y(wire68));
  assign wire70 = $unsigned((^~wire1));
  assign wire71 = ($signed((&($unsigned((8'hb0)) > reg7))) ?
                      (!(((wire2 <<< reg10) ?
                          (wire70 > wire2) : ((8'ha7) < reg10)) ^~ (8'hae))) : (8'hae));
  assign wire72 = $unsigned(($unsigned(($unsigned(reg7) <<< (!reg7))) * {({wire3} ?
                          (^~(8'hb9)) : reg10[(4'hd):(3'h5)]),
                      ($signed(wire70) ?
                          (reg4 ? reg6 : wire71) : (reg7 != reg5))}));
  assign wire73 = wire0;
  assign wire74 = reg4;
  assign wire75 = (~&(!($unsigned((^reg9)) <<< $signed(wire74))));
  assign wire76 = (($unsigned(reg8[(2'h2):(1'h0)]) << (reg6 << {wire72})) ?
                      (wire71[(1'h0):(1'h0)] || (($unsigned(wire3) ?
                              (reg10 ? (8'ha4) : wire1) : {wire2}) ?
                          (wire2[(1'h0):(1'h0)] < (wire70 || reg9)) : $signed(wire2[(4'hb):(1'h1)]))) : ((reg5[(2'h3):(1'h0)] ?
                          ((wire75 ? wire3 : wire71) ?
                              (reg9 * wire71) : ((8'ha1) ?
                                  wire72 : wire70)) : $signed({wire72,
                              reg5})) ^~ reg10[(4'hc):(2'h3)]));
  assign wire77 = (reg9[(2'h3):(1'h1)] - wire72);
  module78 #() modinst152 (wire151, clk, reg4, wire74, wire0, wire1, wire2);
endmodule

module module78
#(parameter param150 = (8'ha8))
(y, clk, wire79, wire80, wire81, wire82, wire83);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire80;
  input wire [(4'hd):(1'h0)] wire81;
  input wire [(5'h14):(1'h0)] wire82;
  input wire [(3'h4):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire144;
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  assign y = {wire149,
                 wire146,
                 wire84,
                 wire85,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire102,
                 wire144,
                 reg148,
                 reg147,
                 reg101,
                 reg100,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = ($signed(wire80) ?
                      (&wire81) : ((^wire82[(1'h1):(1'h0)]) * (({wire80,
                                  wire83} ?
                              wire80 : $signed(wire81)) ?
                          (-{(8'ha8)}) : $signed($signed((8'h9c))))));
  assign wire85 = (~&$signed($signed($unsigned(wire79[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($unsigned((((wire84 >>> ((8'hbd) <<< wire80)) ?
          (8'hb3) : (8'hb6)) == ($signed(wire79[(1'h1):(1'h1)]) & $signed($signed((8'ha5)))))))
        begin
          reg86 <= wire85[(4'hf):(4'h9)];
          if ({(wire84[(2'h3):(1'h0)] > wire81[(2'h3):(2'h2)]),
              $signed((+wire85))})
            begin
              reg87 <= $signed($unsigned($signed(wire81[(1'h1):(1'h1)])));
              reg88 <= $unsigned((~^((-wire81) * {wire85[(4'ha):(4'h9)],
                  $signed(wire83)})));
            end
          else
            begin
              reg87 <= reg86;
              reg88 <= $signed(((~&$signed((wire79 ? wire80 : wire82))) ?
                  $signed(reg86[(5'h11):(3'h6)]) : $signed((wire80[(4'hf):(4'he)] ?
                      (wire83 >= wire82) : (~&wire85)))));
            end
          reg89 <= $signed($signed(wire84[(3'h6):(2'h3)]));
        end
      else
        begin
          reg86 <= $unsigned((|wire79[(1'h0):(1'h0)]));
          reg87 <= wire79;
          if (reg88)
            begin
              reg88 <= ((wire82 <= ($unsigned($signed((8'h9c))) ^ wire84[(5'h10):(2'h3)])) ?
                  $unsigned(wire85) : (wire79 | (!($signed(wire79) <<< $signed((7'h40))))));
              reg89 <= wire83[(2'h2):(2'h2)];
              reg90 <= reg89;
            end
          else
            begin
              reg88 <= wire79[(2'h2):(1'h0)];
              reg89 <= {$unsigned($unsigned({reg87[(3'h7):(1'h0)], wire84})),
                  ((reg87 << (reg90[(3'h4):(3'h4)] ?
                      ((8'haf) & wire80) : (reg89 ?
                          wire81 : wire83))) << (reg86[(5'h12):(4'ha)] < reg89[(1'h0):(1'h0)]))};
            end
          if ((wire83[(2'h3):(1'h0)] <<< $unsigned((8'hbe))))
            begin
              reg91 <= {wire85};
              reg92 <= {reg87};
              reg93 <= $signed(wire81);
              reg94 <= reg93;
            end
          else
            begin
              reg91 <= reg94;
            end
        end
      reg95 <= $unsigned((^($signed((reg90 >>> (8'hb6))) + wire79)));
    end
  assign wire96 = (~|wire81);
  assign wire97 = reg93[(1'h1):(1'h1)];
  assign wire98 = reg92;
  assign wire99 = $signed((^$unsigned(($signed(reg90) ?
                      (wire85 ^~ wire97) : wire84[(5'h10):(4'he)]))));
  always
    @(posedge clk) begin
      reg100 <= ($signed(reg88) ? {$unsigned(reg87[(5'h14):(2'h2)])} : reg95);
      reg101 <= $unsigned($unsigned({{reg92[(5'h12):(3'h4)]},
          ($unsigned(wire82) == (wire80 <<< (8'hb0)))}));
    end
  assign wire102 = $unsigned($unsigned($signed(({wire84} | wire79[(1'h1):(1'h1)]))));
  module103 #() modinst145 (wire144, clk, wire81, reg101, reg88, wire85, wire82);
  assign wire146 = (reg93[(1'h1):(1'h1)] ^ ((((reg87 ?
                           wire81 : wire144) != ((7'h44) ? reg95 : reg100)) ?
                       (^(!reg86)) : (((8'ha1) ?
                           reg100 : (8'hb8)) + reg89[(1'h0):(1'h0)])) ~^ (^~reg90)));
  always
    @(posedge clk) begin
      reg147 <= $signed(reg88[(2'h2):(1'h0)]);
      reg148 <= {(^~(~&$signed({reg95, wire98}))),
          $unsigned((($signed(reg147) - (|(8'hb1))) ?
              wire82 : (wire102[(1'h1):(1'h0)] >= $signed(reg95))))};
    end
  assign wire149 = $signed((~|$signed({reg90[(2'h3):(1'h1)], (~^reg89)})));
endmodule

module module11
#(parameter param67 = (~|(((&(^(8'hba))) >>> ((&(7'h40)) <<< (!(7'h41)))) << (^~({(8'had), (8'ha1)} ? ((8'hb0) >> (8'hb3)) : ((8'ha4) & (8'ha7)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire41;
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire50,
                 wire44,
                 wire43,
                 wire41,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  module16 #() modinst42 (.wire20(wire14), .y(wire41), .wire17(wire13), .clk(clk), .wire19(wire15), .wire18(wire12));
  assign wire43 = {$unsigned($signed((!(|(8'ha5)))))};
  assign wire44 = wire12[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg45 <= $unsigned($unsigned(wire13));
      if ((~|$unsigned(wire12[(3'h6):(3'h4)])))
        begin
          reg46 <= {$unsigned(wire44)};
        end
      else
        begin
          reg46 <= reg46[(2'h2):(1'h1)];
          reg47 <= wire12;
          reg48 <= {$unsigned((wire44 ^~ wire13[(4'hf):(3'h6)])),
              $unsigned(reg45[(3'h5):(3'h5)])};
        end
      reg49 <= (|$signed(wire43[(2'h3):(2'h2)]));
    end
  assign wire50 = reg49[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg51 <= (($signed((-reg48[(3'h7):(1'h0)])) >= {wire15[(4'ha):(4'h9)],
              $unsigned($signed(wire12))}) ?
          $signed($signed(wire14[(3'h6):(3'h4)])) : $unsigned($unsigned((wire41[(1'h1):(1'h1)] ?
              (8'ha7) : {reg47}))));
      reg52 <= $unsigned(reg47[(3'h4):(2'h2)]);
      if (reg48[(4'hd):(2'h3)])
        begin
          reg53 <= {({({wire12} ?
                      (reg49 ? (8'hb3) : wire14) : (reg51 ?
                          (7'h43) : wire14))} <= ({$signed(reg51)} + $unsigned((wire12 ?
                  reg49 : (8'ha7))))),
              $unsigned(reg45)};
          reg54 <= $signed(reg47[(4'h8):(3'h6)]);
          reg55 <= $unsigned(wire12);
          if ({{{($signed(reg47) < wire50), wire14[(3'h5):(2'h3)]}}})
            begin
              reg56 <= ($signed($signed($signed((^~wire41)))) ?
                  reg52 : {$signed(reg45), (~wire13[(4'h8):(1'h1)])});
              reg57 <= $unsigned({$signed((8'hbb))});
              reg58 <= $unsigned((8'h9f));
              reg59 <= $signed((($unsigned({reg57,
                  reg46}) * reg55[(2'h2):(2'h2)]) >> (!(^~$signed(wire50)))));
              reg60 <= ((!((^~$signed(reg53)) >> $signed((wire14 & reg52)))) - (reg57[(3'h6):(2'h3)] || reg55));
            end
          else
            begin
              reg56 <= (~&wire41[(1'h0):(1'h0)]);
              reg57 <= {reg57, (~|$unsigned((^~wire43)))};
            end
          if ($signed({($unsigned(wire13) ?
                  (reg51[(4'ha):(4'ha)] != (~^reg56)) : $unsigned((~|(8'hb4)))),
              $unsigned({reg53[(3'h7):(3'h7)]})}))
            begin
              reg61 <= (|{(+{reg57, reg49})});
              reg62 <= $unsigned($unsigned((~(reg54[(2'h2):(2'h2)] ?
                  $unsigned((8'hbe)) : $signed(wire15)))));
              reg63 <= ((^~wire43) ? reg49 : wire50[(3'h5):(2'h2)]);
              reg64 <= $unsigned(($unsigned((|(reg51 ?
                  reg52 : reg54))) << $unsigned(($signed(wire14) != (reg47 ?
                  reg61 : (8'hb8))))));
            end
          else
            begin
              reg61 <= ((+$unsigned((7'h40))) ?
                  ({$signed($signed(reg48)), (~^$unsigned(wire44))} ?
                      reg52 : reg56) : reg57[(4'h9):(3'h7)]);
              reg62 <= reg57[(4'h8):(2'h2)];
              reg63 <= ($unsigned((8'hb8)) << $signed(reg63));
              reg64 <= $signed(($signed(reg55[(2'h2):(2'h2)]) ?
                  ({(wire13 ? reg59 : wire50)} ?
                      ((8'hb6) ?
                          $unsigned(reg55) : ((8'ha7) ?
                              reg53 : (8'hb9))) : reg56) : $unsigned($signed(reg55[(2'h3):(2'h3)]))));
              reg65 <= {$signed(((8'ha5) && wire44[(4'hc):(4'h8)])),
                  {wire50, (reg49 ? reg61 : (&wire43[(3'h7):(3'h7)]))}};
            end
        end
      else
        begin
          reg53 <= reg52[(3'h6):(1'h0)];
          reg54 <= {$unsigned(reg45[(4'h9):(2'h3)]),
              $signed({reg49[(4'h9):(4'h8)], reg59[(1'h1):(1'h1)]})};
          if (wire15[(4'ha):(3'h7)])
            begin
              reg55 <= (!(~&$signed(reg56)));
              reg56 <= $signed((((reg62 <<< (reg53 ?
                  reg59 : wire12)) && (8'ha0)) && $signed($signed($unsigned(reg62)))));
              reg57 <= reg55[(1'h1):(1'h1)];
              reg58 <= $signed(({(reg65 ? (!reg49) : (reg59 ? (8'ha9) : reg53)),
                      $signed($signed(reg65))} ?
                  $signed((~&{reg59, (8'hb0)})) : (^reg56)));
              reg59 <= $unsigned(($unsigned(reg60[(4'h9):(4'h8)]) | (reg55 == (~|$unsigned((8'hbe))))));
            end
          else
            begin
              reg55 <= $signed(reg55);
              reg56 <= reg48[(5'h10):(3'h5)];
              reg57 <= {($signed(wire44) > $signed(((reg59 ?
                      reg63 : reg54) <= reg65))),
                  ({{{reg49}}} != (~^$unsigned({reg55, wire41})))};
              reg58 <= $signed((~reg57));
            end
          reg60 <= $unsigned((reg52 ?
              $unsigned((reg46[(1'h0):(1'h0)] == (-reg63))) : wire50[(3'h6):(3'h5)]));
        end
      reg66 <= ({reg56[(2'h2):(1'h0)], $signed($signed((~&reg47)))} ?
          (reg48 <<< (((wire44 ?
              wire13 : wire13) & $signed(reg46)) | $signed({reg65}))) : (~$unsigned(((+reg51) + reg64[(3'h4):(1'h0)]))));
    end
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire21;
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 reg40,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = ((^~$unsigned($signed(wire18))) > ((&$unsigned($signed(wire19))) ?
                      (^($signed(wire17) ?
                          $unsigned(wire20) : (^wire18))) : wire18));
  always
    @(posedge clk) begin
      reg22 <= wire18[(3'h4):(1'h0)];
      reg23 <= $signed(((^reg22) ?
          ($unsigned(wire18) ?
              $signed(((7'h41) ?
                  (8'ha4) : wire18)) : $unsigned(wire18[(2'h2):(2'h2)])) : $unsigned($signed(wire18))));
      reg24 <= wire21;
    end
  assign wire25 = {(~&(wire21[(2'h3):(2'h3)] ?
                          {{reg23}, (reg22 ? (8'haa) : reg24)} : (8'ha9)))};
  assign wire26 = ($signed(((&reg24[(5'h12):(5'h11)]) ?
                          ((wire18 ?
                              wire19 : wire19) << {wire21}) : $signed((reg22 != wire21)))) ?
                      (+(wire17 | reg24)) : reg22[(1'h0):(1'h0)]);
  assign wire27 = wire21;
  assign wire28 = wire18[(3'h4):(2'h3)];
  assign wire29 = wire18;
  assign wire30 = $unsigned($unsigned($unsigned(wire27)));
  assign wire31 = ((($signed($signed(wire20)) != $signed((wire26 ?
                              (8'ha8) : wire25))) ?
                          $signed(wire21[(1'h1):(1'h0)]) : {$signed((+wire28)),
                              (wire30 == (wire26 ? wire25 : wire19))}) ?
                      (+$unsigned($unsigned((wire30 ?
                          wire26 : (8'ha5))))) : {wire21[(4'h9):(1'h1)]});
  assign wire32 = (reg24[(4'hc):(1'h1)] ?
                      (wire28[(4'h9):(3'h5)] ?
                          {((reg22 ^~ wire19) ?
                                  $signed(wire17) : reg22[(3'h4):(1'h1)])} : $unsigned($signed((wire19 ?
                              reg24 : wire30)))) : $signed(wire19[(3'h4):(3'h4)]));
  assign wire33 = ((~^({(&(8'ha5)), {wire21}} ?
                          wire26 : $signed((wire32 ~^ wire31)))) ?
                      reg23[(1'h0):(1'h0)] : ($unsigned((((8'hb4) ?
                          wire28 : (8'hb6)) * $unsigned(reg22))) || (wire30 & (!$unsigned(wire32)))));
  assign wire34 = (-$unsigned($unsigned(wire28[(1'h1):(1'h0)])));
  assign wire35 = wire26;
  assign wire36 = wire29[(2'h2):(2'h2)];
  assign wire37 = ((-(reg24[(3'h6):(2'h3)] >= ((wire36 ?
                          wire32 : wire34) < $unsigned(wire18)))) ?
                      $unsigned({((~&wire32) <<< $unsigned(wire17)),
                          $signed((~&wire31))}) : (wire29 ?
                          (wire30 ?
                              ($unsigned(wire36) > wire25) : ({wire34,
                                  wire21} > (wire25 > wire26))) : (~^$signed({wire28,
                              (8'hac)}))));
  assign wire38 = {((((wire35 ?
                              wire36 : wire18) && wire26[(1'h0):(1'h0)]) == {$unsigned(wire26)}) ?
                          $unsigned(wire30) : (((wire19 ?
                              wire33 : wire30) ~^ $signed(wire36)) & wire17[(4'h9):(1'h0)]))};
  assign wire39 = wire37;
  always
    @(posedge clk) begin
      reg40 <= wire28;
    end
endmodule

module module103
#(parameter param143 = (~|{(7'h42)}))
(y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire108;
  input wire signed [(2'h2):(1'h0)] wire107;
  input wire [(5'h15):(1'h0)] wire106;
  input wire signed [(5'h11):(1'h0)] wire105;
  input wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire142;
  wire signed [(3'h7):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire [(3'h4):(1'h0)] wire139;
  wire signed [(5'h12):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(4'ha):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(2'h3):(1'h0)] wire117;
  wire [(5'h12):(1'h0)] wire116;
  wire [(4'hb):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  reg signed [(4'h9):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire111,
                 wire110,
                 wire109,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire109 = wire105;
  assign wire110 = ((((~^(wire104 >> wire109)) != ($signed(wire108) ?
                           (wire104 + wire108) : $unsigned(wire109))) ?
                       $unsigned($unsigned((^~(8'hb3)))) : wire108[(2'h3):(2'h3)]) <= (wire105[(4'he):(3'h7)] > (^~{$unsigned(wire107),
                       (wire106 < (8'hbf))})));
  assign wire111 = {wire107, (wire106 - (~&(^(^wire109))))};
  always
    @(posedge clk) begin
      reg112 <= (+{((((7'h41) & wire108) ?
              (^~wire104) : wire104[(5'h11):(4'h8)]) <<< (wire111[(3'h5):(3'h4)] ?
              $signed(wire108) : wire106[(4'hb):(2'h3)])),
          wire107[(2'h2):(2'h2)]});
      reg113 <= {$signed(({reg112, $unsigned(wire109)} ?
              (^~(8'ha3)) : ($unsigned(wire106) < (~(8'ha7)))))};
    end
  assign wire114 = $signed($unsigned($signed(($unsigned((8'hb7)) - (reg113 ?
                       wire106 : wire110)))));
  assign wire115 = wire104;
  assign wire116 = ((|$signed((|(wire115 & (8'hb7))))) << wire107);
  assign wire117 = ((+{$unsigned(wire106)}) ?
                       $signed($signed({{reg113},
                           $unsigned(wire105)})) : wire115[(2'h3):(1'h1)]);
  assign wire118 = ($signed($unsigned((wire106 ~^ reg112))) ~^ wire111[(3'h5):(3'h4)]);
  assign wire119 = $unsigned(wire115);
  assign wire120 = reg112[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg121 <= wire105;
      reg122 <= (+(((~$unsigned((7'h44))) ?
              $unsigned((wire106 + wire117)) : $signed({wire114, reg121})) ?
          $unsigned($signed((~^wire108))) : reg113[(1'h1):(1'h0)]));
      reg123 <= (((~&(|(wire105 ? wire116 : wire117))) ?
          {$unsigned($signed(wire120)),
              $unsigned($unsigned(reg121))} : wire109[(3'h4):(2'h2)]) != reg112[(2'h3):(1'h0)]);
      reg124 <= ((&(reg122 >> wire110[(2'h2):(1'h0)])) ?
          $unsigned((~|(^$unsigned(wire111)))) : (^~(&wire110[(1'h0):(1'h0)])));
      if (reg124)
        begin
          if (wire104)
            begin
              reg125 <= ((wire107[(2'h2):(1'h1)] ?
                      (8'ha4) : (^(|(wire114 <= wire119)))) ?
                  $signed((~|wire116)) : $signed($unsigned(($unsigned(wire106) ?
                      (^~reg112) : (wire108 <<< (8'ha3))))));
              reg126 <= ((($signed(((8'hbd) - reg125)) + wire120[(4'h8):(4'h8)]) ?
                      $signed($signed((|wire105))) : (^~(-{(8'haf)}))) ?
                  $signed(reg112[(3'h5):(3'h5)]) : ({reg124[(1'h0):(1'h0)]} < (^((~&wire118) - (wire115 <= (8'h9f))))));
            end
          else
            begin
              reg125 <= (reg121 != {$unsigned(wire106[(4'h9):(1'h0)]),
                  reg125[(1'h0):(1'h0)]});
              reg126 <= wire111;
              reg127 <= (wire120[(2'h3):(1'h1)] + reg124);
            end
        end
      else
        begin
          if ($signed($signed($signed(reg126))))
            begin
              reg125 <= ((($signed(((7'h43) ?
                      reg123 : wire114)) <<< (&(~|wire116))) - {wire115[(3'h6):(3'h5)]}) ?
                  ($unsigned(((~wire119) ^ (reg113 < wire107))) ?
                      wire115[(3'h4):(3'h4)] : (($signed((8'hac)) ?
                              $signed(wire104) : (reg112 >> reg126)) ?
                          (~$signed(reg124)) : wire119[(3'h6):(3'h4)])) : (|((wire114 ?
                          $unsigned(reg123) : (wire110 && reg123)) ?
                      $unsigned($unsigned(wire119)) : $signed({reg126,
                          wire114}))));
              reg126 <= (wire116[(1'h1):(1'h0)] ?
                  reg112[(2'h3):(2'h3)] : (&(wire120 & wire105[(5'h11):(3'h5)])));
            end
          else
            begin
              reg125 <= wire114;
              reg126 <= {reg123,
                  ($signed((8'hbd)) ?
                      ((wire111[(4'h9):(1'h0)] << $unsigned(wire110)) ?
                          {reg125,
                              (wire114 && wire107)} : reg121) : (^($unsigned(reg124) ?
                          $unsigned(wire115) : ((8'hba) ?
                              wire105 : wire117))))};
              reg127 <= $unsigned(($unsigned(wire114[(1'h0):(1'h0)]) & $unsigned(reg127)));
              reg128 <= (+($unsigned(reg124) ?
                  {($signed(wire108) ?
                          ((8'hb6) || wire115) : reg126[(1'h0):(1'h0)]),
                      reg127} : (+($unsigned(wire110) ?
                      (~|reg122) : (reg126 >>> (8'hbd))))));
            end
          reg129 <= (!reg112[(3'h7):(3'h6)]);
          if ($unsigned($unsigned($signed(wire110))))
            begin
              reg130 <= wire104;
              reg131 <= reg124[(2'h2):(1'h1)];
              reg132 <= (7'h41);
              reg133 <= {(((&wire107) ?
                      reg127 : ((^~wire109) * $signed(wire111))) ~^ reg132[(3'h4):(2'h3)])};
              reg134 <= (wire115 ?
                  $signed(((wire119 ? wire116[(4'h9):(3'h6)] : (&reg126)) ?
                      ($unsigned(wire114) ?
                          ((8'hb7) < wire104) : $unsigned(wire106)) : (((8'ha6) ?
                              reg122 : reg125) ?
                          $signed(wire106) : (&(7'h43))))) : wire120[(4'he):(4'ha)]);
            end
          else
            begin
              reg130 <= (&$signed($unsigned($signed(reg121[(4'h8):(2'h2)]))));
              reg131 <= $signed($signed({$unsigned(reg130[(1'h0):(1'h0)])}));
              reg132 <= (!reg113[(3'h5):(1'h1)]);
            end
        end
    end
  assign wire135 = $unsigned($signed(reg113));
  assign wire136 = ($unsigned(wire116) - $signed(reg132));
  assign wire137 = ({$signed({reg123,
                           $unsigned(wire120)})} > (wire105[(4'hc):(1'h0)] || {((reg133 ^ wire111) >>> ((8'hbf) ?
                           wire116 : wire114))}));
  assign wire138 = wire119;
  assign wire139 = (^~{(~reg123[(4'h8):(1'h1)]), reg123});
  assign wire140 = (wire119[(1'h0):(1'h0)] & $unsigned(reg129));
  assign wire141 = $signed({((^(wire107 << wire136)) ?
                           ({reg134,
                               reg112} ~^ $unsigned(reg113)) : reg132[(1'h1):(1'h0)]),
                       (8'h9d)});
  assign wire142 = ((($signed((^~wire140)) ?
                           wire138 : ((7'h42) == (wire106 > wire108))) ?
                       reg130[(2'h2):(1'h1)] : (wire104 - ((~|reg133) ?
                           (wire120 ?
                               reg131 : wire116) : wire120))) && reg125[(4'h9):(2'h2)]);
endmodule
