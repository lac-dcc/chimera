module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire135;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire135,
                 wire78,
                 wire76,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(4'he):(3'h7)];
      reg6 <= ((wire4 >> (~{reg5[(3'h5):(1'h0)]})) ?
          {(|(wire0[(4'hc):(4'hc)] <= wire1)),
              $signed(reg5)} : ($unsigned({$signed(wire1),
                  (wire0 ? wire2 : reg5)}) ?
              $unsigned(wire1) : (^~(+((8'ha0) <= wire1)))));
      reg7 <= {{(wire3[(2'h3):(1'h0)] ?
                  $signed((reg6 ? wire4 : (8'haa))) : (reg5 ?
                      (~&reg6) : $signed(wire0))),
              wire0[(4'h9):(1'h0)]}};
      if ((+wire3))
        begin
          reg8 <= (-((8'hb6) <= (wire0[(3'h7):(1'h0)] ^~ ((wire1 * wire0) >> ((8'hb9) > reg6)))));
          reg9 <= $unsigned(reg5);
          if ($unsigned(reg8))
            begin
              reg10 <= wire3[(1'h0):(1'h0)];
              reg11 <= $signed($unsigned(((reg6 ?
                  wire2[(2'h2):(1'h1)] : (wire1 - (8'hb3))) ^~ ({wire3} ?
                  $signed(reg5) : (8'haf)))));
              reg12 <= $signed($signed((-$unsigned((reg5 ? reg7 : wire2)))));
            end
          else
            begin
              reg10 <= $unsigned((reg8[(5'h14):(4'hc)] * $signed((&$signed(reg5)))));
              reg11 <= reg7;
              reg12 <= ((($signed((reg12 ? reg11 : reg10)) ?
                          (~^(wire3 ~^ reg5)) : $signed($signed(wire0))) ?
                      (reg10 ?
                          reg9 : ($unsigned(reg12) ?
                              (-(8'h9f)) : (~|wire4))) : $unsigned(({wire0,
                          wire3} == (+reg10)))) ?
                  reg12 : wire0);
              reg13 <= $unsigned($unsigned(wire2[(1'h0):(1'h0)]));
              reg14 <= reg9;
            end
          reg15 <= wire1;
        end
      else
        begin
          reg8 <= (8'ha6);
          reg9 <= wire1[(3'h4):(1'h1)];
          reg10 <= ((reg12 ?
              (~&reg5[(1'h1):(1'h0)]) : $unsigned((!((8'hb9) || (7'h41))))) == reg7);
          reg11 <= (~&reg12[(1'h0):(1'h0)]);
        end
    end
  assign wire16 = wire0;
  assign wire17 = {reg5[(4'h8):(2'h2)], $signed((wire4 >= $signed((~&reg7))))};
  assign wire18 = (&reg13[(2'h2):(2'h2)]);
  assign wire19 = {(|reg9[(4'h8):(1'h0)]), (~&{wire16[(5'h14):(4'hc)]})};
  module20 #() modinst77 (wire76, clk, reg6, reg8, wire19, wire16, reg11);
  assign wire78 = (+$unsigned((~&wire2)));
  module79 #() modinst136 (.clk(clk), .wire83(reg8), .y(wire135), .wire82(reg5), .wire81(wire19), .wire80(wire1));
endmodule

module module79
#(parameter param133 = ((^~(({(8'ha7), (8'h9e)} ? ((8'haf) ? (8'hbd) : (8'hb4)) : ((8'ha4) >>> (8'hb3))) & ({(8'haf)} ~^ (|(8'ha0))))) ? (!(((8'hb7) ? {(8'hbf), (8'h9d)} : {(8'h9d), (8'hb4)}) << (((8'hbe) ? (8'hb8) : (8'hb2)) < (^~(8'ha6))))) : (~|((((8'ha9) - (8'hb3)) >>> ((7'h41) || (8'h9d))) <= (+((8'h9e) ? (8'ha9) : (8'hb0)))))), 
parameter param134 = (((^(&(param133 ? (8'ha2) : (7'h40)))) & (param133 <<< ((param133 | param133) ? (param133 ? param133 : param133) : param133))) ? ({{(param133 ? param133 : param133)}, (^param133)} >> (8'ha8)) : ((((~^param133) ? (param133 ? param133 : param133) : {param133}) | {((8'hae) >>> param133)}) ^ ((8'hb9) ? {param133, (~^param133)} : {param133}))))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h1ba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire83;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire [(5'h10):(1'h0)] wire81;
  input wire signed [(4'hb):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire [(3'h5):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(2'h3):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  assign y = {wire132,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire98,
                 wire97,
                 wire96,
                 wire86,
                 wire85,
                 wire84,
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
                 reg120,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire84 = $signed(wire80[(2'h2):(1'h0)]);
  assign wire85 = {wire81[(4'hf):(2'h3)],
                      ((~^$unsigned((wire84 ^~ wire82))) || $unsigned(wire84[(3'h4):(1'h1)]))};
  assign wire86 = wire82[(4'h9):(4'h9)];
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned($unsigned(wire86)))))
        begin
          if ((8'hb7))
            begin
              reg87 <= (wire85 < (wire81[(4'he):(2'h3)] ?
                  $unsigned(wire80) : {(wire80 ?
                          (wire86 <= wire83) : wire84[(3'h6):(3'h4)]),
                      $signed($unsigned(wire82))}));
              reg88 <= wire83[(3'h7):(2'h2)];
              reg89 <= $unsigned(wire85);
            end
          else
            begin
              reg87 <= {(^~{$unsigned($unsigned(wire85)),
                      wire86[(4'hf):(4'hb)]})};
              reg88 <= (({(8'hb2), $unsigned(reg87)} ?
                  (8'hb6) : reg89) > ($signed({wire83[(3'h6):(2'h2)],
                      $unsigned(wire83)}) ?
                  $signed($signed($unsigned(reg88))) : (8'ha2)));
              reg89 <= (wire80[(4'hb):(3'h5)] ?
                  ((~&(reg87[(4'hc):(4'hc)] < wire85[(2'h3):(1'h0)])) & ($signed(wire80) ~^ ($unsigned((8'h9c)) ?
                      $unsigned(wire81) : (~^(8'hbb))))) : wire85);
              reg90 <= (8'hbe);
              reg91 <= wire81;
            end
        end
      else
        begin
          reg87 <= (wire80 ?
              $signed((reg91[(4'hd):(2'h3)] ?
                  (^(8'hb7)) : wire85[(2'h3):(2'h3)])) : $unsigned($signed(($unsigned(wire80) < wire81))));
          if (wire83[(3'h5):(3'h5)])
            begin
              reg88 <= wire82;
              reg89 <= wire85;
            end
          else
            begin
              reg88 <= (~($unsigned(((8'h9e) ?
                      (reg90 ? wire85 : reg91) : ((8'hb8) ^~ (8'h9d)))) ?
                  (|({wire81} ?
                      $unsigned(reg89) : {wire82})) : ((&(wire84 != wire81)) ?
                      ((reg87 ? wire84 : wire83) ?
                          (8'ha9) : (wire85 <= wire86)) : (~&((8'ha9) ~^ (8'hb4))))));
            end
        end
      reg92 <= {wire86, (!$signed($signed((reg89 ? reg87 : wire84))))};
      reg93 <= (reg88[(2'h2):(2'h2)] ?
          reg88[(1'h1):(1'h0)] : ({$signed({reg89, wire83})} ?
              $unsigned($signed(wire83)) : ($unsigned(wire86) ?
                  $unsigned(((8'ha3) - reg87)) : wire81)));
      reg94 <= wire86[(4'hd):(4'hb)];
      reg95 <= (wire85 | $unsigned(wire82));
    end
  assign wire96 = (-(({(~|wire80)} ?
                      {(reg87 + reg88), $unsigned(reg90)} : {(reg87 & reg87),
                          $signed((8'ha1))}) >> (((wire80 == reg92) << (reg93 ?
                          reg91 : reg95)) ?
                      $unsigned($unsigned((8'hb0))) : $signed(((8'ha7) >> reg92)))));
  assign wire97 = $signed(((((|wire83) ?
                          (reg87 >> reg87) : $unsigned((8'hac))) ?
                      (reg94[(1'h1):(1'h1)] ?
                          reg88 : (^~wire96)) : ($signed(wire80) & reg94[(2'h3):(1'h0)])) * $unsigned($unsigned($unsigned(wire83)))));
  assign wire98 = (~^(reg90[(1'h1):(1'h0)] ?
                      (^reg88) : $unsigned($signed((wire96 ?
                          reg89 : wire97)))));
  always
    @(posedge clk) begin
      reg99 <= $unsigned({($unsigned($unsigned(wire86)) == $unsigned($signed(wire82)))});
      reg100 <= (-wire85[(1'h1):(1'h1)]);
    end
  module101 #() modinst115 (wire114, clk, wire85, reg94, wire86, reg95, reg90);
  assign wire116 = (^~reg91[(3'h7):(3'h6)]);
  assign wire117 = ({reg94, (-(~|$signed(wire80)))} ?
                       (&($signed((+wire116)) != $unsigned($signed(wire83)))) : (!reg92[(1'h1):(1'h1)]));
  assign wire118 = reg89;
  assign wire119 = {wire82};
  always
    @(posedge clk) begin
      reg120 <= $signed((((!(wire84 ?
              wire83 : wire118)) ^~ $unsigned((wire96 ^ reg100))) ?
          reg91 : wire97[(2'h2):(1'h1)]));
      if ({((wire84 + ($signed(wire96) ?
                  wire82[(4'he):(4'h8)] : $signed(reg91))) ?
              $unsigned((&$signed(wire81))) : (8'hb9)),
          (reg99 != (+{((7'h42) << wire116), (wire116 == wire96)}))})
        begin
          reg121 <= wire118;
          reg122 <= wire80[(3'h6):(2'h3)];
        end
      else
        begin
          reg121 <= {reg88[(2'h2):(1'h1)]};
          reg122 <= wire84[(2'h3):(1'h0)];
          if ({{(^$signed(wire85[(3'h6):(1'h0)]))}})
            begin
              reg123 <= (~|wire82);
              reg124 <= ((8'hbe) ?
                  $unsigned(wire96[(4'h9):(1'h1)]) : ((reg92 ?
                      (&((8'ha4) ?
                          reg91 : wire96)) : {wire118}) != {$unsigned($signed(wire97))}));
              reg125 <= {(&$unsigned(reg94))};
              reg126 <= {(&$unsigned(((wire118 & reg93) - (wire86 >>> reg100)))),
                  $unsigned((reg89[(2'h2):(1'h1)] <= (&(wire114 ?
                      reg95 : wire98))))};
              reg127 <= ($unsigned(wire117[(2'h3):(1'h1)]) > (reg90[(3'h6):(1'h0)] ^~ reg123[(4'hc):(1'h0)]));
            end
          else
            begin
              reg123 <= (reg127 - reg92[(2'h2):(1'h1)]);
              reg124 <= (wire97 ?
                  (wire86[(4'hd):(3'h7)] ?
                      $signed($unsigned(wire119)) : wire97[(2'h3):(2'h3)]) : $unsigned($unsigned($signed({(8'ha2)}))));
            end
          reg128 <= (wire118 == (reg89 ?
              (&((~|(8'hb2)) && (wire96 ?
                  reg88 : reg125))) : $signed(wire118[(4'h9):(3'h5)])));
          reg129 <= reg126;
        end
      reg130 <= $unsigned(wire96);
      reg131 <= $signed(wire118[(3'h5):(3'h5)]);
    end
  assign wire132 = (wire84[(4'ha):(4'h8)] + (((wire119[(3'h6):(1'h0)] <<< (reg121 - reg120)) || (wire117[(5'h12):(4'ha)] ?
                           (wire85 ? wire118 : reg93) : (reg122 ?
                               reg92 : reg89))) ?
                       wire81[(3'h5):(2'h2)] : wire80));
endmodule

module module20
#(parameter param74 = (^((+{((8'hb1) ? (7'h42) : (8'ha6))}) | (((+(8'hb6)) >>> ((8'hbf) < (8'ha9))) == (^((8'ha2) ? (8'hb2) : (7'h44)))))), 
parameter param75 = param74)
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire signed [(5'h15):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire signed [(4'h9):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire69;
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire69,
                 (1'h0)};
  assign wire26 = {((8'hac) ?
                          wire24[(3'h4):(1'h0)] : (~$signed($unsigned(wire25))))};
  assign wire27 = ((^wire24) <= $unsigned($unsigned((~|wire26))));
  assign wire28 = $signed((+wire23));
  assign wire29 = (wire25[(3'h6):(3'h5)] ?
                      $unsigned({{wire27[(3'h6):(2'h3)]}}) : wire23);
  assign wire30 = $unsigned({wire26,
                      ($unsigned((wire25 ?
                          wire25 : wire27)) >>> wire28[(4'hb):(2'h3)])});
  module31 #() modinst70 (wire69, clk, wire26, wire22, wire24, wire30, wire25);
  assign wire71 = wire27[(3'h7):(3'h7)];
  assign wire72 = ($unsigned((wire29[(3'h4):(3'h4)] > ((wire21 ?
                          wire23 : wire23) >> $signed(wire26)))) ?
                      (^~{{wire29[(4'h8):(2'h2)]},
                          $signed((wire22 * wire26))}) : ((~&wire25[(3'h4):(2'h2)]) ?
                          wire71 : ($signed((wire28 * wire26)) * (wire27[(1'h1):(1'h1)] != $unsigned(wire22)))));
  assign wire73 = ($signed(wire21) & (-(&$unsigned($unsigned((8'h9f))))));
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire36;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire signed [(4'h8):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  input wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire43,
                 wire42,
                 wire38,
                 wire37,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire37 = wire32;
  assign wire38 = wire36[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg39 <= $unsigned(wire36[(1'h1):(1'h0)]);
      reg40 <= $signed({(+$unsigned((^wire38)))});
      reg41 <= (wire34 ?
          (((7'h44) ~^ reg39[(5'h10):(4'ha)]) ?
              reg39[(3'h5):(3'h5)] : $unsigned($unsigned(reg40[(2'h3):(2'h3)]))) : wire36[(1'h1):(1'h0)]);
    end
  assign wire42 = (($signed($signed((|wire38))) ?
                      $signed(((wire32 ^~ reg41) ^ wire34)) : $unsigned(wire32[(2'h3):(1'h0)])) + ((~^{(wire37 ?
                          wire34 : wire35),
                      $signed(wire33)}) > $unsigned((reg40 >= wire34[(1'h1):(1'h1)]))));
  assign wire43 = (~|($signed((+wire42)) < (wire33 ?
                      $signed((~|wire35)) : (8'hb9))));
  always
    @(posedge clk) begin
      reg44 <= {(~|wire43),
          $unsigned((($unsigned(reg40) ?
              (wire37 ? wire35 : wire36) : wire43) >> wire36[(1'h1):(1'h1)]))};
      if ((-($signed($unsigned({wire43, reg40})) > wire42)))
        begin
          reg45 <= (((^wire36[(2'h2):(2'h2)]) == reg44[(3'h7):(2'h3)]) * $signed(($unsigned((wire38 * wire42)) ?
              (~(reg40 ? wire37 : wire33)) : $signed(reg39))));
          reg46 <= wire34[(4'h8):(4'h8)];
          reg47 <= ((8'hb2) ^~ (wire33 == (~|wire35[(3'h7):(3'h6)])));
        end
      else
        begin
          reg45 <= $signed((^~$signed(wire36[(1'h1):(1'h0)])));
          reg46 <= $unsigned(wire37);
        end
      reg48 <= wire38;
    end
  assign wire49 = ({$unsigned((|reg44))} ?
                      reg41[(2'h3):(2'h3)] : ($unsigned(wire42[(4'h9):(3'h5)]) >= {reg44[(3'h7):(3'h5)]}));
  assign wire50 = (8'hbd);
  assign wire51 = reg39[(4'h8):(3'h5)];
  assign wire52 = ({(^~($signed(wire43) ?
                              (wire33 ? reg39 : wire34) : $signed(wire50)))} ?
                      ($unsigned({wire35}) >> (^wire36)) : wire50);
  assign wire53 = ($unsigned(({$unsigned((8'hbc))} + ((wire36 ?
                          wire51 : wire42) ?
                      (reg41 ?
                          reg39 : reg45) : (&wire51)))) ~^ $unsigned((~^(~(+wire34)))));
  always
    @(posedge clk) begin
      reg54 <= {{(-$signed((~reg46)))}};
      if ((|$unsigned($unsigned($unsigned((wire34 >> reg40))))))
        begin
          reg55 <= reg44;
        end
      else
        begin
          reg55 <= $signed((($signed((!(8'hb3))) | $unsigned((!(8'hb9)))) != reg47[(4'he):(4'h9)]));
          reg56 <= (reg44 - (({(reg47 | reg39)} * (&reg47)) != ($unsigned((7'h42)) >= (8'hb5))));
          if (($unsigned($signed(wire33)) >> ($signed($unsigned(reg45[(4'h8):(2'h3)])) - {reg55})))
            begin
              reg57 <= wire35;
              reg58 <= $signed(reg41);
              reg59 <= {(reg40 ?
                      (~&((wire33 * reg41) == reg47[(4'hc):(1'h1)])) : (~|$unsigned(reg48))),
                  wire49[(5'h10):(4'hd)]};
            end
          else
            begin
              reg57 <= $signed((wire34[(3'h7):(3'h4)] ?
                  reg48[(4'hb):(3'h7)] : ((|(^wire36)) ?
                      {$unsigned(wire33)} : ((!reg59) ?
                          $unsigned((8'hbb)) : {reg55, wire38}))));
            end
          if (wire37[(1'h0):(1'h0)])
            begin
              reg60 <= $signed(($signed(wire33[(3'h5):(1'h0)]) | ({(^reg54),
                      $signed(wire36)} ?
                  wire49 : reg57[(1'h0):(1'h0)])));
              reg61 <= reg48;
              reg62 <= {wire37[(2'h3):(1'h1)]};
              reg63 <= (((~|reg61) >= reg47[(3'h4):(2'h3)]) >= (8'hb7));
            end
          else
            begin
              reg60 <= $unsigned($unsigned(reg58[(3'h4):(2'h3)]));
              reg61 <= ({wire43, $signed((-{reg44}))} + ($unsigned({{(8'ha9),
                          (8'ha4)}}) ?
                  ((~|{(8'hb2), reg61}) ?
                      $signed((~&(8'hba))) : ((~wire42) << wire32[(1'h0):(1'h0)])) : (~(~|(reg63 && wire34)))));
              reg62 <= ((^{(|(wire43 ? wire32 : wire50)),
                      $unsigned((wire52 ? wire42 : reg40))}) ?
                  wire50[(3'h4):(2'h2)] : wire35[(4'he):(2'h2)]);
            end
        end
      reg64 <= (8'ha4);
      reg65 <= reg61[(1'h1):(1'h0)];
      reg66 <= ($unsigned(((~|(8'ha0)) >> (wire52 ?
          ((8'had) - reg48) : wire53[(3'h7):(3'h4)]))) + $signed((~^(^~reg41))));
    end
  assign wire67 = ($unsigned(wire53[(2'h3):(1'h0)]) & $unsigned($unsigned($unsigned(wire43))));
  assign wire68 = {((-(-(+wire32))) || (~|reg66)), (~^wire50)};
endmodule

module module101  (y, clk, wire106, wire105, wire104, wire103, wire102);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire106;
  input wire signed [(5'h11):(1'h0)] wire105;
  input wire [(3'h7):(1'h0)] wire104;
  input wire signed [(4'h8):(1'h0)] wire103;
  input wire [(4'he):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire107;
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire107 = wire102[(1'h0):(1'h0)];
  assign wire108 = (~^wire106[(2'h3):(2'h2)]);
  assign wire109 = (^$signed(wire104));
  assign wire110 = ((((wire108[(2'h2):(2'h2)] ?
                                   (wire104 || wire107) : (wire109 ?
                                       (8'hb8) : wire106)) ?
                               $signed(wire102) : $signed((wire102 ?
                                   (8'ha8) : wire108))) ?
                           wire102 : $signed($unsigned(wire109))) ?
                       wire103 : wire106);
  always
    @(posedge clk) begin
      reg111 <= wire104;
      reg112 <= wire107;
      reg113 <= wire105;
    end
endmodule
