module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire126,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg24,
                 reg23,
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
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire2[(4'h9):(3'h5)])
        begin
          reg5 <= wire4[(4'hf):(2'h2)];
          reg6 <= {reg5[(4'h9):(2'h2)], wire4};
          reg7 <= {wire4};
        end
      else
        begin
          reg5 <= $signed($signed(((~&$unsigned(reg7)) ?
              (reg5 ? (wire4 && wire0) : (8'hb4)) : reg6[(4'ha):(2'h2)])));
          if (wire2)
            begin
              reg6 <= (-(reg5[(4'h8):(1'h0)] ?
                  {((reg6 && wire3) - $signed(wire4))} : ({wire1} && $unsigned((8'haa)))));
              reg7 <= (reg6 ?
                  $signed($unsigned((~&reg6[(4'h9):(4'h8)]))) : $signed((!wire3[(3'h6):(1'h1)])));
              reg8 <= wire1[(2'h2):(1'h1)];
              reg9 <= reg6;
            end
          else
            begin
              reg6 <= ($signed($unsigned($signed((wire1 ?
                  wire2 : reg7)))) > wire0[(3'h5):(1'h0)]);
              reg7 <= $unsigned(({reg8[(3'h4):(2'h2)]} ~^ wire1));
              reg8 <= wire3;
            end
          reg10 <= {(((~^{wire1}) || $unsigned({(8'hae)})) ?
                  $signed(reg7[(4'hc):(2'h3)]) : (!(!$unsigned(reg5)))),
              reg5};
          reg11 <= (&($unsigned((~|((8'hb9) ? reg7 : reg5))) || wire4));
        end
      if ((wire2 > wire4[(4'he):(1'h1)]))
        begin
          reg12 <= (^~wire1);
        end
      else
        begin
          reg12 <= ({$signed($unsigned($signed(reg5))),
                  (+(wire3 >> $signed(reg6)))} ?
              wire1[(2'h2):(2'h2)] : reg7);
          if ($signed((($unsigned((^~reg9)) ?
                  $signed((reg12 << wire4)) : $signed($unsigned(reg7))) ?
              (&((wire3 * reg6) >>> $signed(wire4))) : wire4[(3'h4):(1'h0)])))
            begin
              reg13 <= reg5;
            end
          else
            begin
              reg13 <= reg8;
              reg14 <= ($signed(reg9[(3'h7):(2'h3)]) ?
                  (($unsigned((8'ha5)) ?
                          (reg10 ? $unsigned(reg8) : (~reg10)) : (8'ha0)) ?
                      (~^$unsigned(((8'h9d) ?
                          (8'hbc) : reg9))) : (~wire4)) : ($signed(({wire0,
                          (8'hb1)} ?
                      wire2[(5'h10):(4'h8)] : {reg12})) | $signed((^(!wire2)))));
              reg15 <= (({$unsigned(reg7[(4'he):(2'h2)])} ?
                      wire2[(3'h6):(3'h5)] : {reg5}) ?
                  (!reg14) : $unsigned((wire1[(3'h6):(2'h2)] < $unsigned($unsigned((8'ha1))))));
            end
          reg16 <= $signed(($signed(wire0[(1'h0):(1'h0)]) ?
              $signed((reg14 < $signed(wire3))) : {reg9[(2'h2):(1'h0)]}));
          if (wire1[(1'h0):(1'h0)])
            begin
              reg17 <= {($unsigned(wire4) < reg11[(2'h3):(2'h3)]),
                  reg16[(3'h4):(2'h3)]};
              reg18 <= $unsigned(wire4[(4'ha):(3'h7)]);
              reg19 <= $signed($signed($signed(reg9[(2'h2):(2'h2)])));
            end
          else
            begin
              reg17 <= $unsigned($signed($signed($unsigned(reg16))));
              reg18 <= ((reg18[(3'h4):(2'h3)] ?
                  (8'hb6) : (reg17[(1'h1):(1'h0)] & (reg8[(2'h3):(2'h3)] <<< $signed(reg12)))) ~^ ((((reg19 ?
                      reg10 : reg18) ?
                  $unsigned(wire4) : (reg14 ? reg15 : reg19)) + {(wire0 ?
                      (8'ha7) : reg17)}) || $unsigned(($signed(reg13) <= $unsigned(reg13)))));
              reg19 <= (~|((&((~|wire2) ? wire3 : reg7)) ?
                  (($signed(reg9) > $signed(reg13)) >= $signed($signed(reg12))) : $signed(({(8'hb4),
                          reg17} ?
                      (^~wire0) : (reg9 << reg15)))));
              reg20 <= ((~&{((+(8'h9e)) || wire1[(3'h4):(1'h1)]),
                  ({reg14} ?
                      reg14[(4'h9):(3'h6)] : (8'hb7))}) >= (|$unsigned((wire2[(4'hc):(4'hc)] != {wire0,
                  reg10}))));
              reg21 <= ($unsigned($signed(reg16)) ?
                  reg19[(1'h0):(1'h0)] : (~(8'h9f)));
            end
          reg22 <= wire3;
        end
      reg23 <= (8'ha3);
      reg24 <= {reg20[(4'h9):(1'h0)], reg12[(3'h4):(1'h1)]};
    end
  assign wire25 = ((^(wire4[(4'hf):(4'hd)] ? reg14 : reg16)) || ((reg18 ?
                      $unsigned((~|reg18)) : reg6) >= (^$unsigned($unsigned(wire3)))));
  assign wire26 = $signed({(-wire25)});
  assign wire27 = reg19[(2'h2):(2'h2)];
  assign wire28 = reg13[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg29 <= {((~^(reg18[(3'h4):(1'h1)] ?
              $signed(reg8) : ((8'ha8) ?
                  reg17 : wire4))) - ($unsigned((reg14 > wire1)) <<< $signed(reg15))),
          wire27};
      reg30 <= ({($unsigned($unsigned((8'haf))) ?
                  (reg23[(4'ha):(4'h8)] <<< reg13) : $unsigned(reg13[(3'h5):(3'h4)])),
              $signed(((reg10 && (7'h44)) * (wire27 && (7'h44))))} ?
          {($unsigned(reg15[(4'h8):(3'h6)]) >= $signed(((8'ha8) ?
                  reg16 : reg13))),
              reg20} : reg11[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg31 <= wire26;
      reg32 <= (8'hbc);
    end
  assign wire33 = reg32;
  assign wire34 = $unsigned((~|(~reg10)));
  assign wire35 = {$signed((~^(~&reg24)))};
  module36 #() modinst127 (wire126, clk, reg16, reg9, reg30, reg18);
endmodule

module module36  (y, clk, wire37, wire38, wire39, wire40);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire38;
  input wire [(2'h3):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire [(4'h9):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire114;
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire49,
                 wire50,
                 wire67,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire114,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire41 = $signed($signed(wire37));
  assign wire42 = wire38;
  assign wire43 = ((wire39 ^~ $unsigned($unsigned((wire42 ?
                      (8'hab) : wire39)))) - ({$unsigned((wire41 <<< wire41))} ?
                      $signed($unsigned((8'h9c))) : wire41[(1'h0):(1'h0)]));
  assign wire44 = $signed(((((wire40 ?
                      wire41 : wire42) >>> wire38) <<< (8'hbb)) ~^ $unsigned(((|wire40) ?
                      wire40[(1'h1):(1'h0)] : (+wire43)))));
  assign wire45 = (|(~(wire40 || ((~|wire38) ?
                      $unsigned(wire39) : {(8'hac)}))));
  assign wire46 = wire41[(4'hd):(3'h7)];
  always
    @(posedge clk) begin
      reg47 <= ($signed($unsigned(wire41)) != (~$signed(($unsigned(wire46) ~^ $unsigned(wire41)))));
      reg48 <= (-($unsigned({((8'hb2) ? wire44 : wire41)}) ?
          $signed($unsigned((wire40 ? wire43 : wire44))) : (~^wire39)));
    end
  assign wire49 = $signed((8'ha8));
  assign wire50 = (8'ha6);
  module51 #() modinst68 (wire67, clk, wire43, wire38, wire42, wire45);
  assign wire69 = (~&{$unsigned($signed($signed(wire38)))});
  assign wire70 = reg48;
  assign wire71 = wire43[(4'he):(4'hb)];
  assign wire72 = $unsigned(wire71[(1'h1):(1'h0)]);
  assign wire73 = (&wire40);
  assign wire74 = (^~wire49[(2'h2):(2'h2)]);
  module75 #() modinst115 (.wire76(reg48), .clk(clk), .wire77(wire41), .y(wire114), .wire79(wire38), .wire80(wire46), .wire78(reg47));
  assign wire116 = wire69;
  assign wire117 = $signed($signed(wire71[(3'h6):(3'h6)]));
  assign wire118 = ((8'ha1) * wire73);
  always
    @(posedge clk) begin
      if ($signed($signed((reg48 <= $signed((wire117 ? (8'hab) : wire38))))))
        begin
          reg119 <= (((wire46 << (wire42[(3'h7):(3'h7)] < $unsigned((8'haa)))) ?
                  {{wire69[(2'h3):(2'h3)]}} : wire45) ?
              wire41[(4'h8):(3'h5)] : (+$signed(reg48[(3'h7):(2'h2)])));
          reg120 <= ($unsigned(wire42) ?
              $signed(((wire49 ? wire72[(3'h6):(2'h2)] : (wire43 | wire72)) ?
                  $signed(wire46) : ((wire70 < reg47) ?
                      {wire37,
                          wire38} : (wire70 != wire69)))) : (wire38[(4'hf):(4'h8)] | ($signed((&(8'hae))) & (^~reg47))));
          reg121 <= (!$unsigned($signed($signed((wire45 * (7'h43))))));
        end
      else
        begin
          if (((wire114 ^~ (wire39 ?
                  wire73[(2'h3):(2'h2)] : ({wire38} ?
                      (&wire73) : (wire114 <= (8'had))))) ?
              wire40[(2'h3):(1'h0)] : wire49[(2'h3):(2'h2)]))
            begin
              reg119 <= (8'ha2);
              reg120 <= reg121;
            end
          else
            begin
              reg119 <= wire73[(3'h4):(2'h3)];
              reg120 <= (wire118[(2'h2):(2'h2)] && (~^$unsigned(((wire71 ^~ wire46) >> $signed(wire67)))));
              reg121 <= {$unsigned($unsigned(({wire42, wire69} | {wire50}))),
                  $signed((((wire71 ^~ wire67) & wire50) ?
                      (wire45[(4'he):(4'ha)] >> $unsigned((8'ha3))) : wire40))};
            end
          reg122 <= (wire38 >> $signed((&$signed(wire45))));
          reg123 <= (~|(wire42 + ({{(8'ha6),
                  wire38}} << $unsigned($signed(wire41)))));
        end
      reg124 <= $signed($unsigned((-reg119)));
      reg125 <= ((($signed(wire37) ?
              wire41[(2'h2):(2'h2)] : $signed((~^(8'ha4)))) ~^ $unsigned((^~(8'hac)))) ?
          wire45 : (((8'hb8) ?
                  ({wire46, reg119} & (8'h9d)) : ($unsigned((8'ha3)) ?
                      wire72[(2'h2):(2'h2)] : ((8'ha0) > wire114))) ?
              reg120[(3'h5):(2'h2)] : wire50));
    end
endmodule

module module75
#(parameter param112 = (~|{({((8'hb5) ? (8'ha3) : (8'haa)), {(8'hae)}} ~^ ((8'ha8) == (8'h9d))), ({((8'hb4) ? (8'ha2) : (8'hae)), ((8'had) ? (8'hac) : (8'ha5))} * ((-(7'h40)) <= ((8'hab) ^~ (8'ha8))))}), 
parameter param113 = {param112})
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire80;
  input wire [(5'h13):(1'h0)] wire79;
  input wire [(3'h6):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  input wire [(3'h7):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire109;
  wire [(5'h10):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire97;
  wire signed [(5'h12):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg111,
                 reg110,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg81,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg81 <= ((((-$signed(wire78)) ?
                  $signed(wire79) : {$signed((8'hbf)), (8'hb8)}) ?
              (wire76 ?
                  wire79[(3'h6):(3'h4)] : {$signed((8'hb1))}) : wire77[(4'hf):(4'he)]) ?
          $signed((!wire76)) : (|(&$unsigned(wire79))));
    end
  assign wire82 = (+wire79);
  assign wire83 = wire79;
  assign wire84 = wire77;
  assign wire85 = reg81;
  always
    @(posedge clk) begin
      if ($unsigned(reg81[(1'h0):(1'h0)]))
        begin
          reg86 <= (wire77 || reg81);
          reg87 <= ((!wire84[(4'hc):(4'ha)]) ?
              (~|(~((wire84 - wire83) ?
                  (wire80 ? wire79 : wire76) : (!(8'hb6))))) : (^~(wire79 ?
                  wire79 : $signed(reg86[(2'h3):(2'h2)]))));
          reg88 <= (wire83 ? $signed(wire85) : (+{reg87}));
        end
      else
        begin
          reg86 <= {((!($unsigned(wire84) ?
                  (-reg81) : $signed(wire85))) != $unsigned($signed(wire78[(2'h3):(1'h0)])))};
          reg87 <= (reg86 >>> wire85);
          reg88 <= wire82;
          reg89 <= (($signed(((8'haf) ?
                  wire76[(3'h7):(3'h6)] : reg88[(4'ha):(3'h5)])) <<< reg81) ?
              ((8'ha4) >= (8'h9f)) : (~^$signed($unsigned((wire77 ?
                  (8'h9d) : reg87)))));
          reg90 <= $unsigned($unsigned($unsigned((~&(wire83 ?
              (8'hb1) : reg87)))));
        end
      reg91 <= ((8'h9d) ? (+wire80) : reg87);
    end
  assign wire92 = $signed($signed(wire82));
  assign wire93 = $unsigned((&wire92));
  assign wire94 = (&($signed(wire76[(3'h4):(2'h3)]) ^~ (wire93[(1'h0):(1'h0)] ?
                      (wire92 >>> wire76) : reg86[(1'h0):(1'h0)])));
  assign wire95 = ($signed(((8'ha0) ?
                          ($signed(reg81) >= $unsigned(wire78)) : wire83)) ?
                      wire82 : (~($signed(wire76[(3'h5):(1'h0)]) - $unsigned($unsigned((8'h9d))))));
  assign wire96 = wire85[(1'h0):(1'h0)];
  assign wire97 = (~&((($unsigned(reg86) ? (+wire92) : (reg88 | wire79)) ?
                      (wire82 != $signed(reg91)) : wire92) >= $signed($unsigned((wire83 ?
                      wire95 : wire93)))));
  always
    @(posedge clk) begin
      reg98 <= wire83[(2'h3):(2'h3)];
      if (wire77)
        begin
          reg99 <= reg89;
          reg100 <= {reg81[(1'h1):(1'h0)],
              {($unsigned(reg89) ?
                      reg98[(2'h3):(1'h0)] : (wire76 & (!(7'h44)))),
                  ($unsigned((8'ha8)) || $unsigned(reg98[(1'h1):(1'h0)]))}};
          reg101 <= (!(!$unsigned(reg98)));
          if ((8'ha6))
            begin
              reg102 <= $signed({$unsigned(wire78)});
            end
          else
            begin
              reg102 <= ({$signed(wire92[(3'h7):(3'h5)]),
                  (+(-(~&(8'hbf))))} <= $unsigned((wire83 <= (^(!reg90)))));
              reg103 <= reg98[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg99 <= wire93[(3'h6):(1'h1)];
          reg100 <= reg103;
          if ((((8'hb6) == wire93[(2'h3):(1'h0)]) >= {$signed($unsigned({reg81})),
              (wire82[(4'hd):(2'h3)] ?
                  {(wire93 ^~ reg91),
                      (reg103 ? wire84 : wire95)} : {{wire83}})}))
            begin
              reg101 <= (wire92[(1'h0):(1'h0)] <<< $signed({$signed($signed(reg91)),
                  $unsigned((reg89 ? wire77 : (7'h41)))}));
              reg102 <= (reg90[(1'h1):(1'h1)] > $signed(wire76[(3'h4):(2'h2)]));
            end
          else
            begin
              reg101 <= ({{({wire85, wire77} <<< wire78)},
                  (reg102 ?
                      reg102[(5'h13):(5'h12)] : (+(wire80 ^~ reg81)))} ~^ (~(~(reg86 ?
                  reg86 : {(7'h44)}))));
              reg102 <= $unsigned($signed($signed(reg86[(1'h0):(1'h0)])));
              reg103 <= ($signed(((^(^reg100)) ~^ reg86[(3'h4):(1'h0)])) == ($signed(((wire78 >= reg101) ^~ reg101[(3'h7):(1'h1)])) <<< ((&(|wire96)) & (8'h9f))));
              reg104 <= reg99;
            end
          reg105 <= (7'h40);
          reg106 <= (|(wire76 ? wire84[(1'h1):(1'h1)] : wire92[(3'h5):(3'h5)]));
        end
    end
  assign wire107 = ($unsigned(wire79) * {((-$unsigned(reg87)) ?
                           ($unsigned(reg91) ?
                               reg104[(3'h5):(3'h4)] : (reg90 ^~ reg100)) : (8'hae))});
  assign wire108 = (8'hb9);
  assign wire109 = reg81;
  always
    @(posedge clk) begin
      reg110 <= reg88;
      reg111 <= ($signed(reg104[(2'h2):(1'h1)]) >> ((&(+(~^reg90))) <<< (^{(~|wire97)})));
    end
endmodule

module module51
#(parameter param65 = ((-((~((8'ha1) + (8'ha7))) < ((!(8'ha7)) ? {(8'haa)} : ((8'hbc) & (8'ha1))))) ? (^(^(^~((8'hba) <<< (8'hb6))))) : (^(((8'hbd) ? ((8'hb5) > (8'hbf)) : ((8'hb7) <= (8'ha1))) + (8'hbd)))), 
parameter param66 = ({{((param65 ? param65 : param65) <= (param65 >= param65))}, ({(param65 ? param65 : param65)} & {(param65 != (8'hb5)), (8'hb9)})} >= {(param65 && (&param65)), (((param65 ? param65 : param65) ? (^param65) : param65) == {(!param65)})}))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire55;
  input wire signed [(3'h5):(1'h0)] wire54;
  input wire signed [(4'h9):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(5'h15):(1'h0)] wire56;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 (1'h0)};
  assign wire56 = $signed((($unsigned($unsigned((8'hb2))) ?
                          (~$signed(wire55)) : wire53[(3'h5):(2'h3)]) ?
                      {(~(wire52 >= wire53)),
                          $signed($unsigned(wire55))} : wire55[(1'h0):(1'h0)]));
  assign wire57 = wire52;
  assign wire58 = $signed((8'ha4));
  assign wire59 = ($unsigned(wire55) ? wire54[(3'h5):(1'h0)] : (^~(8'ha7)));
  assign wire60 = ($signed((-wire55)) != $signed($unsigned(((wire57 + wire53) < (wire58 ^ wire56)))));
  assign wire61 = wire59[(4'h9):(3'h5)];
  assign wire62 = wire58[(3'h4):(2'h3)];
  assign wire63 = $unsigned(($signed(wire58) ? $unsigned(wire53) : (8'ha6)));
  assign wire64 = $signed(wire57[(3'h7):(3'h5)]);
endmodule
