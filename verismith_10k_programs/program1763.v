module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire153;
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire155,
                 wire4,
                 wire5,
                 wire6,
                 wire23,
                 wire24,
                 wire25,
                 wire153,
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
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = $unsigned(($signed(wire0[(4'ha):(3'h4)]) ?
                     ((wire0 ?
                         {wire2,
                             wire0} : wire2) <<< $unsigned($unsigned(wire4))) : wire2));
  assign wire6 = {((~&$signed((wire1 + wire5))) ?
                         wire1 : (~wire5[(4'hb):(1'h0)]))};
  always
    @(posedge clk) begin
      if ($unsigned(({$signed(((8'haa) >> wire0)), wire5} ?
          {{(wire6 ? (8'hb0) : wire3)},
              (wire1[(2'h3):(2'h2)] ?
                  wire2 : wire0[(4'hb):(3'h6)])} : ({wire0} ?
              wire4[(4'hd):(1'h0)] : $unsigned((wire6 ? (7'h44) : wire0))))))
        begin
          reg7 <= (~|$signed(wire4));
          reg8 <= wire0;
        end
      else
        begin
          reg7 <= {(($unsigned((wire6 < reg8)) <= $signed(wire0)) ?
                  (wire1[(4'h8):(3'h4)] ?
                      (~&$unsigned(reg7)) : $signed((reg8 ?
                          wire0 : wire4))) : reg8[(4'h9):(3'h7)])};
          if ((wire5 ? (-$unsigned((~|((8'hb7) && reg7)))) : wire0))
            begin
              reg8 <= $unsigned(reg7[(4'hc):(2'h2)]);
              reg9 <= $unsigned(({wire6[(1'h0):(1'h0)]} * (wire5[(4'h8):(4'h8)] ?
                  reg7[(5'h14):(4'ha)] : (-wire4[(5'h10):(4'h8)]))));
            end
          else
            begin
              reg8 <= ((^~{reg7}) != (wire2 ?
                  $unsigned((reg8 && $unsigned(wire1))) : wire4));
            end
          reg10 <= wire3;
          reg11 <= {(&(((reg8 ?
                  wire1 : (8'hbf)) ^ (^~reg9)) < (^~wire1[(3'h4):(1'h1)])))};
        end
      reg12 <= wire6;
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg7[(3'h4):(1'h1)]))
        begin
          reg13 <= $unsigned(reg11);
        end
      else
        begin
          if (((($signed((reg8 ? (8'hb4) : wire2)) ?
              reg13 : ($signed(reg12) ?
                  wire5[(3'h6):(3'h5)] : {(7'h41),
                      wire6})) <= $signed(reg7[(4'h9):(1'h0)])) >>> ($signed((^~$signed(wire0))) ?
              {reg8[(3'h6):(3'h5)],
                  $unsigned((reg12 ? reg9 : wire5))} : reg12[(1'h1):(1'h0)])))
            begin
              reg13 <= ({$unsigned(((wire0 <= reg7) > (wire0 ? wire4 : reg12))),
                      reg11} ?
                  wire3[(3'h5):(1'h1)] : reg12);
              reg14 <= (|$signed((-(reg10[(3'h6):(3'h6)] ?
                  (|wire1) : $unsigned(wire1)))));
            end
          else
            begin
              reg13 <= $signed($unsigned((~($signed(wire2) >>> (wire6 ?
                  reg7 : reg12)))));
              reg14 <= {(reg11[(1'h1):(1'h1)] ?
                      $unsigned(reg9[(4'hd):(4'ha)]) : (($unsigned((8'hb8)) ?
                              reg10 : $unsigned(reg14)) ?
                          (reg11[(4'hb):(1'h1)] ?
                              wire1 : wire6[(1'h1):(1'h1)]) : (^((8'haf) ~^ wire6)))),
                  {{(((8'hb9) || reg9) ?
                              (reg9 ? wire3 : reg14) : {wire3, wire2})},
                      (^(!reg12[(1'h1):(1'h0)]))}};
            end
          reg15 <= $unsigned($unsigned($unsigned({$signed(reg10)})));
          reg16 <= {((~|$unsigned(reg15[(2'h3):(1'h1)])) ?
                  ($unsigned((wire3 == reg7)) ?
                      $signed($unsigned(wire5)) : {$unsigned(wire6)}) : (wire2[(2'h2):(1'h0)] << $unsigned($unsigned((8'hbf)))))};
          if (reg11[(4'hf):(3'h6)])
            begin
              reg17 <= {$unsigned($signed(reg12))};
              reg18 <= {(wire0 ?
                      (reg12[(4'h8):(2'h2)] ?
                          $unsigned($unsigned(wire1)) : (reg17 ~^ (&wire1))) : ({reg12[(2'h2):(1'h0)],
                          (+wire6)} ^ $signed(reg17[(3'h4):(1'h0)])))};
            end
          else
            begin
              reg17 <= wire1[(3'h6):(2'h3)];
              reg18 <= ($unsigned(((wire2 ?
                      $unsigned(reg7) : $unsigned(wire2)) ?
                  $unsigned(reg8) : $signed(reg9[(4'hc):(1'h0)]))) >= wire2);
              reg19 <= $signed(((reg9[(3'h6):(2'h2)] >> (-(8'ha6))) ^ $unsigned((~&(wire4 ?
                  reg14 : reg8)))));
            end
        end
      reg20 <= (^$unsigned(reg7));
      reg21 <= ($unsigned(reg17[(4'h8):(3'h5)]) * (reg12 >> {$signed(reg15[(4'ha):(1'h1)])}));
      reg22 <= $unsigned($signed(wire0));
    end
  assign wire23 = (~({(wire6[(4'hb):(2'h3)] ?
                          reg20[(2'h3):(2'h2)] : (&wire3))} >= reg15));
  assign wire24 = $signed(((^~((&reg16) ?
                      wire4[(3'h5):(2'h3)] : (wire5 ^ reg12))) != wire0[(3'h4):(2'h3)]));
  assign wire25 = {wire4[(4'he):(4'he)],
                      {$unsigned(((~|reg9) && (reg22 ? (8'hbc) : reg11))),
                          (8'hb9)}};
  module26 #() modinst154 (.clk(clk), .wire27(reg14), .wire29(reg22), .wire30(wire6), .wire28(reg15), .y(wire153));
  assign wire155 = $signed(wire25[(4'hc):(2'h2)]);
endmodule

module module26
#(parameter param151 = {(((~&(|(8'ha1))) ? (((8'hab) <= (8'ha1)) && (~&(8'had))) : (^(~|(8'hb8)))) != ((!((7'h40) & (7'h40))) ? (((8'ha9) != (8'ha7)) >>> ((8'ha3) <= (8'hb5))) : (((8'ha6) ^ (8'hac)) ? {(8'h9c)} : ((8'hbc) ? (8'ha8) : (8'hb7)))))}, 
parameter param152 = ({(~^((param151 ? param151 : (8'h9c)) ? (param151 ? param151 : param151) : (param151 ~^ param151)))} > (param151 >= ((7'h44) ? (~|param151) : {(param151 > param151)}))))
(y, clk, wire27, wire28, wire29, wire30);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire27;
  input wire [(4'he):(1'h0)] wire28;
  input wire [(3'h7):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire64;
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire146,
                 wire144,
                 wire66,
                 wire36,
                 wire37,
                 wire64,
                 reg148,
                 reg147,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= (~(!wire30));
      reg32 <= (wire28 <= wire29);
      reg33 <= $unsigned((&$unsigned(reg31[(2'h2):(1'h0)])));
      reg34 <= $signed($signed(wire29));
      reg35 <= (((~&(8'hb4)) * ({reg34} ?
          $signed((~&(8'ha0))) : ({wire28, wire30} * (!wire30)))) <<< reg31);
    end
  assign wire36 = $unsigned(reg32[(1'h1):(1'h1)]);
  assign wire37 = {$unsigned(wire28),
                      $unsigned($unsigned(((reg34 ?
                          reg32 : wire28) ^~ {reg32})))};
  module38 #() modinst65 (.clk(clk), .y(wire64), .wire41(wire28), .wire39(wire36), .wire40(reg33), .wire42(wire27));
  assign wire66 = ($unsigned($unsigned(((reg33 >= reg33) ^ {(8'h9e),
                          wire36}))) ?
                      (wire30[(4'hd):(3'h4)] == wire27) : (^~wire37));
  module67 #() modinst145 (wire144, clk, wire66, wire36, wire28, reg31, wire29);
  assign wire146 = reg34[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg147 <= {wire37};
      reg148 <= $unsigned(reg32[(5'h10):(1'h0)]);
    end
  assign wire149 = {reg31};
  assign wire150 = (^(((+((8'ha5) || reg32)) ?
                       wire36 : wire146) ^~ (~$unsigned({wire149}))));
endmodule

module module67
#(parameter param142 = (|((8'ha8) && (~^(((7'h43) ? (8'hb1) : (8'ha1)) ^ ((8'ha4) ? (8'ha5) : (8'hb3)))))), 
parameter param143 = param142)
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h32a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire72;
  input wire [(5'h15):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire [(3'h4):(1'h0)] wire69;
  input wire [(3'h7):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(3'h4):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  assign y = {wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire103,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire73 = {$signed($signed($signed(wire72))),
                      $unsigned($unsigned((^(|wire72))))};
  assign wire74 = wire71[(4'hb):(3'h6)];
  assign wire75 = $signed(wire73);
  assign wire76 = wire71[(3'h5):(2'h3)];
  assign wire77 = $signed($unsigned(wire74[(3'h4):(2'h2)]));
  assign wire78 = {(wire73[(4'hb):(4'ha)] ?
                          {($unsigned(wire77) ?
                                  wire77[(3'h7):(3'h7)] : wire77[(3'h5):(2'h2)])} : (^~$signed($unsigned(wire76)))),
                      $unsigned((8'h9f))};
  assign wire79 = ($unsigned((({(8'ha3), (8'ha4)} ?
                              $signed(wire78) : (wire73 & (8'ha4))) ?
                          $unsigned({wire71, wire71}) : {$signed(wire72),
                              (wire76 ? wire78 : wire74)})) ?
                      wire74[(4'h8):(2'h3)] : $signed(wire68[(3'h4):(3'h4)]));
  assign wire80 = wire79[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if (wire77[(3'h7):(3'h4)])
        begin
          if (((8'hbf) ~^ (wire76[(1'h1):(1'h1)] != wire73[(4'ha):(3'h6)])))
            begin
              reg81 <= $signed((~&$signed({wire74, wire69})));
              reg82 <= (~&($unsigned($unsigned((~&wire68))) ^~ wire68));
              reg83 <= ($unsigned(($unsigned((wire80 >> wire78)) ?
                  (8'hb1) : $unsigned($unsigned(wire75)))) << wire71);
            end
          else
            begin
              reg81 <= $signed((-{$signed((^~wire77)), $unsigned(wire77)}));
            end
          reg84 <= (~|$signed((((wire70 ? (8'ha0) : reg81) ?
                  {wire75, (8'hbc)} : (+reg83)) ?
              ($signed(wire73) ? reg82 : (|wire80)) : {$signed(wire80),
                  $signed(wire75)})));
          reg85 <= (((!($signed(wire79) ~^ $unsigned(reg82))) ?
              $unsigned((+reg83)) : reg81[(3'h4):(3'h4)]) ^~ reg82[(2'h3):(1'h1)]);
          reg86 <= wire71;
          if ($unsigned($unsigned(wire73[(5'h12):(5'h11)])))
            begin
              reg87 <= $unsigned(wire79);
              reg88 <= reg81[(3'h4):(2'h2)];
            end
          else
            begin
              reg87 <= wire75;
              reg88 <= ($unsigned(($unsigned(wire74[(3'h5):(1'h0)]) > (~wire73[(1'h0):(1'h0)]))) < $unsigned(reg83[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          if (reg82[(2'h2):(1'h1)])
            begin
              reg81 <= reg87[(4'h9):(4'h9)];
              reg82 <= {(~|$signed($unsigned((wire77 ? reg88 : reg86))))};
              reg83 <= wire72;
            end
          else
            begin
              reg81 <= (~|$signed($signed((wire69[(1'h1):(1'h1)] ?
                  $unsigned(reg88) : wire68[(2'h3):(1'h0)]))));
            end
          reg84 <= reg86;
          reg85 <= (|reg85[(3'h5):(1'h1)]);
          reg86 <= {(~&($signed((~^(8'hb8))) ?
                  (!(8'ha5)) : ($unsigned((8'ha2)) >> reg84[(4'hf):(4'hb)])))};
          if ($unsigned((~&((reg82 >= reg82[(3'h5):(1'h0)]) != wire74))))
            begin
              reg87 <= wire77;
            end
          else
            begin
              reg87 <= ($signed($unsigned(($signed(wire68) | wire70[(4'hb):(3'h7)]))) ?
                  (~^{($unsigned(wire75) ^ $unsigned(reg84)),
                      $signed((wire78 ?
                          wire68 : reg81))}) : $unsigned((~$signed(reg85))));
            end
        end
      if ({((8'hbb) ?
              ($unsigned({wire80}) != ($signed(wire71) <= wire80[(4'hd):(4'h9)])) : $signed($unsigned(wire74)))})
        begin
          if (wire73[(2'h2):(2'h2)])
            begin
              reg89 <= (^$unsigned(((&(~&wire72)) ?
                  reg85[(4'h9):(3'h5)] : $unsigned($signed((8'haf))))));
              reg90 <= wire70[(4'h9):(1'h0)];
            end
          else
            begin
              reg89 <= (~&$signed((8'hba)));
            end
          if (($signed($unsigned(((^wire73) ^~ (reg89 ?
              (8'ha6) : reg86)))) - $unsigned((^~(+(wire78 <<< reg89))))))
            begin
              reg91 <= ({(~^reg87),
                  $unsigned($signed(wire68))} >= wire77[(4'he):(4'hc)]);
              reg92 <= reg88[(3'h4):(2'h2)];
            end
          else
            begin
              reg91 <= $signed(({((!reg88) ^ {reg83, reg82}),
                  $unsigned($signed(reg81))} < {$signed((wire80 ?
                      reg86 : reg89))}));
              reg92 <= {$signed((8'hba)), reg85};
            end
          reg93 <= (((&reg84[(5'h10):(4'hc)]) ?
              (($signed((8'had)) >= $unsigned(wire80)) <<< ({wire73,
                  reg91} + {reg83, wire68})) : {{(reg90 ?
                          wire78 : (8'hb8))}}) >>> reg88[(3'h7):(2'h3)]);
          reg94 <= (8'hb5);
        end
      else
        begin
          reg89 <= $signed($signed((reg84[(3'h5):(2'h3)] ?
              ((&wire74) ? $signed(wire75) : reg86) : $signed(reg87))));
          reg90 <= $unsigned($unsigned(($unsigned($unsigned((8'ha5))) ?
              (&(|reg90)) : (~((8'ha6) && wire72)))));
          if ((~^{reg82, reg81[(4'h8):(3'h4)]}))
            begin
              reg91 <= ($unsigned((^~$signed({wire69}))) ?
                  reg90[(3'h6):(1'h1)] : (^~reg87[(3'h4):(2'h3)]));
              reg92 <= $unsigned($signed(reg81[(2'h2):(2'h2)]));
              reg93 <= {($signed(((wire80 ? wire71 : wire71) ?
                      $unsigned(wire73) : (reg86 - reg88))) | $unsigned(reg91)),
                  $unsigned($signed(((wire73 ? (8'haa) : reg93) ?
                      (8'hae) : (wire80 ? (8'ha6) : reg82))))};
              reg94 <= $signed($signed(wire76));
            end
          else
            begin
              reg91 <= ({(~^($unsigned(reg92) ^ ((8'hb2) ~^ (8'had))))} ^~ (+wire73));
              reg92 <= $unsigned((((8'hb0) ?
                  (^~wire73) : $unsigned(wire77)) << reg85));
              reg93 <= $signed({$unsigned(reg82[(3'h5):(1'h0)])});
            end
        end
      reg95 <= (wire68[(2'h3):(2'h3)] == ((+reg83) ?
          $unsigned($unsigned((reg82 ?
              reg91 : (8'ha9)))) : ($unsigned($signed(wire80)) >= reg92[(3'h5):(3'h4)])));
      if ((wire78 ?
          (wire78 ?
              {(((8'hb3) ? (8'ha8) : (8'hbb)) != $signed(reg82)),
                  (~&((8'ha1) >= (8'hac)))} : (~&reg93)) : (~^(^wire77))))
        begin
          if ((~{(|wire74[(4'h8):(3'h7)])}))
            begin
              reg96 <= $unsigned((^({(reg81 ? wire72 : wire69)} * reg83)));
              reg97 <= reg95[(3'h7):(3'h4)];
            end
          else
            begin
              reg96 <= $signed((reg88[(1'h1):(1'h0)] ?
                  (~^($signed(reg84) | reg83)) : {(reg94[(3'h7):(3'h5)] <= {wire68})}));
              reg97 <= reg86[(1'h0):(1'h0)];
              reg98 <= (wire69 > reg83);
            end
          reg99 <= (((+((8'hb6) << $signed(reg89))) >= {(((8'hb4) <<< wire70) * reg95),
              ((wire77 ~^ wire72) ?
                  reg95 : (-wire72))}) >>> (&$signed($signed({wire75}))));
          reg100 <= $unsigned((reg87[(3'h7):(3'h5)] & $signed($unsigned((&reg95)))));
        end
      else
        begin
          reg96 <= $unsigned(((!$signed($unsigned(reg91))) ^~ (($signed(wire73) ?
                  wire70[(3'h5):(3'h5)] : ((8'haa) ? reg84 : reg89)) ?
              reg90[(4'h8):(2'h2)] : $signed($signed(wire76)))));
          if ((^wire73[(5'h12):(4'hb)]))
            begin
              reg97 <= $unsigned(reg99[(2'h2):(2'h2)]);
            end
          else
            begin
              reg97 <= ((wire76 ?
                      (!(^$unsigned((8'ha9)))) : reg89[(1'h0):(1'h0)]) ?
                  $unsigned((^reg95)) : (($signed({wire80, reg81}) + wire76) ?
                      ($unsigned(((8'hb7) - wire73)) ?
                          ($signed(reg95) ^ (reg90 ?
                              reg98 : reg86)) : (!reg98)) : ((8'hb2) & $unsigned((wire74 ?
                          wire71 : reg84)))));
              reg98 <= (~|((&$signed(wire73)) ?
                  $unsigned((~&$unsigned(reg85))) : $unsigned(((wire78 >>> wire71) <= (reg92 && reg81)))));
              reg99 <= $signed((|($unsigned($signed(reg90)) == ((~^reg84) ?
                  (^reg92) : reg94))));
              reg100 <= reg85[(4'h9):(1'h0)];
              reg101 <= $signed(reg87);
            end
        end
      reg102 <= reg100;
    end
  assign wire103 = reg83;
  always
    @(posedge clk) begin
      if ({(|(~|(!$signed(reg93))))})
        begin
          reg104 <= $unsigned($signed($unsigned(wire78)));
        end
      else
        begin
          reg104 <= (~|(+(&reg104)));
          reg105 <= (8'ha4);
          if ((reg98 <<< {(((~reg93) ?
                      $unsigned(reg96) : ((8'ha2) ? wire76 : (8'ha9))) ?
                  reg95 : (~^reg88))}))
            begin
              reg106 <= {reg91[(1'h1):(1'h0)]};
              reg107 <= (8'ha0);
              reg108 <= wire80[(4'he):(4'h9)];
            end
          else
            begin
              reg106 <= ($signed($signed($unsigned(reg88[(4'hd):(4'hc)]))) ~^ (reg84 ?
                  (reg81[(2'h2):(2'h2)] | $signed($signed(reg96))) : $signed(({(8'hbc),
                          reg88} ?
                      ((8'haf) || reg97) : $unsigned(wire69)))));
              reg107 <= (8'ha0);
            end
          if ($signed((8'hbe)))
            begin
              reg109 <= (~&$signed($unsigned($signed((reg92 ^ wire80)))));
              reg110 <= wire78[(4'hb):(4'ha)];
              reg111 <= wire72[(3'h7):(3'h5)];
              reg112 <= (wire76 | ((+$unsigned((+reg94))) ?
                  $unsigned(reg106) : $unsigned($signed((reg96 + reg92)))));
              reg113 <= $signed({($signed(reg112[(4'h8):(3'h4)]) && reg91[(1'h1):(1'h1)]),
                  $signed(reg105[(3'h4):(3'h4)])});
            end
          else
            begin
              reg109 <= ($signed($unsigned((~(reg97 ?
                  reg85 : (8'hb4))))) | $signed((wire76 ?
                  (~|(reg111 == reg90)) : $unsigned((^reg101)))));
              reg110 <= ((+({((8'ha5) ~^ reg109), (wire70 ? (7'h44) : reg82)} ?
                      ($unsigned((8'haf)) ?
                          (wire72 ? wire68 : wire80) : (8'h9e)) : reg104)) ?
                  (reg104 ?
                      ((!(reg91 - reg110)) <<< reg89) : (~|$signed((-reg82)))) : (reg111 ^ wire75[(3'h6):(2'h2)]));
              reg111 <= {{(+(-$unsigned(reg102))), $unsigned(wire74)},
                  $signed($unsigned(reg107))};
              reg112 <= $unsigned($unsigned((~({reg84, reg93} ^~ (^wire80)))));
            end
          reg114 <= reg107[(4'hd):(4'h9)];
        end
      if ((8'h9c))
        begin
          reg115 <= (~|wire76);
          reg116 <= $unsigned((reg86 ?
              $unsigned(reg108) : (((reg97 ^~ reg84) ?
                      (reg86 >>> reg94) : wire69) ?
                  reg83[(2'h2):(1'h1)] : reg90[(4'ha):(3'h7)])));
          reg117 <= reg114[(1'h0):(1'h0)];
        end
      else
        begin
          reg115 <= reg106[(4'hd):(2'h3)];
          if (((((^~reg99) > ((reg106 ? reg89 : (8'hb8)) ?
                  (^~wire75) : $signed(reg115))) ^~ reg102) ?
              ($signed(reg115) >>> $signed($unsigned($unsigned(reg105)))) : ($unsigned($unsigned($signed((8'hbd)))) ?
                  {$signed({reg88})} : ({$signed(wire103),
                      $signed(wire70)} << reg104[(2'h3):(2'h2)]))))
            begin
              reg116 <= $signed((wire74[(4'h8):(1'h0)] || $signed({reg97[(3'h4):(3'h4)],
                  reg99})));
              reg117 <= wire80;
              reg118 <= wire78[(5'h10):(4'h9)];
            end
          else
            begin
              reg116 <= (^~($signed(reg90[(4'h9):(2'h3)]) || wire75[(1'h0):(1'h0)]));
            end
        end
      if ($signed($signed((~((reg110 ? wire69 : reg113) ?
          {(8'hb0), reg111} : {reg87, reg100})))))
        begin
          if ($unsigned(wire70))
            begin
              reg119 <= ((~^{$signed((!reg98)), (-reg106)}) != (~|reg107));
              reg120 <= reg90;
              reg121 <= $signed(reg90);
              reg122 <= reg83[(3'h5):(2'h3)];
              reg123 <= $signed($signed($signed($unsigned((^~wire77)))));
            end
          else
            begin
              reg119 <= reg87;
              reg120 <= $unsigned({reg85});
              reg121 <= reg89[(3'h4):(1'h1)];
              reg122 <= wire70[(4'hb):(3'h6)];
              reg123 <= $signed($unsigned($signed((8'hb3))));
            end
          reg124 <= $unsigned($unsigned(reg88));
          reg125 <= (!wire74);
          reg126 <= reg109;
        end
      else
        begin
          reg119 <= wire79;
          reg120 <= ($unsigned($signed($unsigned($signed(reg119)))) ?
              (reg120[(1'h1):(1'h0)] ?
                  (wire76 << $unsigned((^reg112))) : reg114[(2'h3):(2'h3)]) : reg121);
          if ($signed(reg121))
            begin
              reg121 <= (8'hb7);
              reg122 <= wire74;
              reg123 <= $signed(wire70);
              reg124 <= $signed((~&((reg102 ?
                      reg119[(4'h9):(3'h6)] : $signed(reg122)) ?
                  $unsigned(((8'hac) ^ reg89)) : $signed($signed((7'h42))))));
            end
          else
            begin
              reg121 <= (+wire70[(3'h7):(3'h5)]);
              reg122 <= {(-$unsigned({$signed(wire72)})), wire68};
              reg123 <= {$signed(reg82),
                  ((((wire80 != (8'hbd)) && ((8'hbf) < reg105)) ?
                          (|$unsigned(reg88)) : (!(reg87 ?
                              (8'hb9) : (7'h42)))) ?
                      $signed($signed(reg114)) : (reg119 ?
                          $unsigned($signed((8'hbe))) : ((reg104 > reg119) < (~&(7'h42)))))};
              reg124 <= ($signed((~&(reg90 ^~ (reg123 ~^ reg105)))) ?
                  {reg126} : ($signed((^~reg93[(3'h5):(2'h3)])) ?
                      (($unsigned(reg91) == $signed(reg113)) ?
                          {{reg119,
                                  wire73}} : reg99[(2'h2):(1'h0)]) : (wire68 + reg124)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg127 <= wire103[(1'h0):(1'h0)];
      reg128 <= ((reg118[(4'hc):(3'h6)] ?
          ($unsigned(wire103[(3'h4):(2'h3)]) > {reg124[(4'h9):(2'h2)],
              ((8'ha6) ?
                  reg127 : reg89)}) : reg102[(4'hc):(4'hc)]) == {wire80[(4'hd):(2'h3)]});
      if ((wire73[(5'h12):(4'hc)] | $unsigned(reg96)))
        begin
          if ($unsigned(($unsigned((reg105[(2'h3):(2'h2)] ?
              reg106[(5'h12):(4'hd)] : $signed(reg98))) != $signed(reg99[(2'h3):(2'h2)]))))
            begin
              reg129 <= (~&(wire76[(5'h13):(5'h13)] >= (8'ha9)));
            end
          else
            begin
              reg129 <= $signed(wire77[(4'ha):(4'ha)]);
            end
          reg130 <= $signed((8'ha5));
          if ((^(~^(reg98[(3'h6):(2'h3)] ?
              reg125[(2'h3):(1'h1)] : wire76[(1'h1):(1'h1)]))))
            begin
              reg131 <= {(reg123[(2'h2):(2'h2)] - reg83)};
            end
          else
            begin
              reg131 <= wire70;
              reg132 <= reg85[(4'h8):(2'h2)];
            end
        end
      else
        begin
          reg129 <= ((~&$signed(reg88[(5'h11):(4'h8)])) - (wire76[(3'h5):(1'h1)] ?
              $signed($signed((reg102 <= reg116))) : ((wire79 ?
                      (^~reg93) : (reg89 - reg118)) ?
                  ((~&reg101) ?
                      {reg117,
                          wire73} : $unsigned(reg116)) : (&reg131[(4'hc):(3'h7)]))));
        end
    end
  assign wire133 = {$unsigned($signed(($signed(reg86) ?
                           $unsigned(wire79) : reg85))),
                       {(($signed((8'hb4)) ?
                                   reg98[(4'h8):(4'h8)] : $unsigned(reg119)) ?
                               {(reg93 > reg101),
                                   wire73} : (^~(reg85 * reg119))),
                           (~^$signed((^reg84)))}};
  assign wire134 = (+((^~(reg106[(5'h10):(3'h7)] ?
                       $unsigned(wire78) : $unsigned((8'hab)))) >= {($signed(reg106) ?
                           reg106 : reg122[(4'h9):(4'h8)])}));
  assign wire135 = (&(((|reg123[(2'h2):(1'h0)]) || (reg86 & $unsigned(reg115))) ?
                       (8'ha4) : ({wire74[(4'h8):(2'h3)],
                           {reg82, reg104}} && ({reg132} ?
                           (wire77 <<< reg109) : (reg117 && (8'haf))))));
  assign wire136 = wire77;
  assign wire137 = (reg88 ?
                       $unsigned($unsigned((&$signed((8'hbb))))) : reg104[(2'h3):(1'h1)]);
  assign wire138 = $signed($unsigned(($unsigned((8'ha2)) ?
                       ($signed(reg102) - (reg123 ?
                           reg114 : reg127)) : $signed({reg87, wire76}))));
  assign wire139 = reg97;
  assign wire140 = reg114[(2'h2):(1'h1)];
  assign wire141 = (~^(wire79 & wire79));
endmodule

module module38
#(parameter param63 = {((((~&(8'hba)) ? ((7'h43) ? (8'hbf) : (8'ha9)) : ((8'hb8) ? (8'haf) : (8'hb3))) ? (^((7'h41) >>> (8'hac))) : ((~|(8'hba)) - {(8'hb4), (8'hac)})) & ({((8'hb2) >= (8'ha9))} + {((8'h9d) ? (8'h9f) : (8'h9c)), (~(8'hbe))})), (~((((8'hb6) >>> (8'hbd)) < ((8'ha0) <= (8'hac))) ? {((8'haf) >> (7'h41))} : ((-(8'haf)) ? ((7'h44) ? (7'h41) : (8'hb9)) : ((8'hbe) ? (8'haf) : (8'haa)))))})
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(2'h2):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((&$signed(((wire40 ? wire42 : (8'ha7)) ?
          wire42[(2'h2):(2'h2)] : wire41[(4'he):(4'hc)]))) - (^($unsigned(wire41) != wire39[(1'h0):(1'h0)]))))
        begin
          reg43 <= $unsigned(((wire41 == wire40[(3'h4):(2'h2)]) ?
              ($signed((wire41 ? (8'hb2) : wire40)) ^~ ((+wire39) ?
                  $unsigned(wire42) : (wire39 ?
                      wire39 : wire41))) : ($unsigned((wire39 ?
                      (8'hba) : wire41)) ?
                  $signed(wire39[(1'h0):(1'h0)]) : ((wire40 || (8'hac)) != $unsigned(wire39)))));
          reg44 <= {wire40};
        end
      else
        begin
          reg43 <= $signed(reg43[(1'h0):(1'h0)]);
          reg44 <= (|(($unsigned($signed((8'ha2))) > ($unsigned((8'ha4)) >>> (reg43 ?
              reg43 : reg44))) == (|(wire39 ? (&wire41) : (~&reg43)))));
          reg45 <= ($unsigned($signed(((~wire39) ?
              (wire42 ?
                  wire40 : reg43) : wire41[(3'h5):(1'h0)]))) | (+{($unsigned(wire42) * $signed(wire40)),
              (wire41[(1'h1):(1'h0)] ^ (~^reg43))}));
        end
      reg46 <= ((reg44 ^~ (wire41[(3'h5):(3'h5)] ?
              $signed(reg44) : (!(wire41 ? wire41 : (8'hb5))))) ?
          (wire42 != $unsigned((|wire42[(3'h4):(1'h0)]))) : (~^(reg44 >>> ($unsigned(reg44) + wire42))));
      if ((reg45[(2'h2):(1'h1)] ~^ (&$signed($unsigned(wire41[(4'hc):(3'h6)])))))
        begin
          reg47 <= $signed(reg44[(4'h9):(3'h6)]);
          if (wire40[(3'h4):(2'h2)])
            begin
              reg48 <= ($unsigned($signed(wire41)) ?
                  (^(8'h9e)) : $signed(reg46));
              reg49 <= ($unsigned({(reg43[(1'h1):(1'h0)] - reg46[(5'h11):(4'h9)])}) ?
                  $unsigned($signed(((reg47 << reg46) > wire42))) : (wire39 <= reg45[(2'h2):(1'h0)]));
              reg50 <= {$unsigned({(~^(~reg46)), $signed($signed(reg44))}),
                  wire41};
            end
          else
            begin
              reg48 <= ($signed((~&(|(reg45 ?
                  (8'hbe) : reg44)))) >> $unsigned($signed((((8'hbd) <<< reg45) & (|wire39)))));
            end
        end
      else
        begin
          reg47 <= {(8'hba)};
          reg48 <= (($unsigned((reg43[(1'h0):(1'h0)] ^ (~reg43))) ?
                  $signed($signed((reg44 ? (8'hb8) : reg44))) : (wire40 ?
                      reg48[(1'h0):(1'h0)] : (reg49 | (8'hb8)))) ?
              $signed($signed((&(reg48 ?
                  (8'hb5) : reg47)))) : reg45[(3'h5):(1'h0)]);
          reg49 <= reg48[(3'h6):(2'h3)];
          reg50 <= ({$signed((~(reg50 ? reg49 : wire41))),
              wire42} >= $signed({(+(~^reg49))}));
          reg51 <= (&$signed((reg45 ^ reg46[(3'h4):(2'h3)])));
        end
      reg52 <= {$unsigned($unsigned($unsigned(wire39[(1'h0):(1'h0)])))};
      reg53 <= (|{{(^$signed((8'hbb))), (-reg51)}});
    end
  assign wire54 = reg51;
  assign wire55 = (8'had);
  assign wire56 = $signed(wire39);
  assign wire57 = (+$signed(($unsigned({(8'hac), reg52}) == (8'haa))));
  assign wire58 = {(!{($unsigned(reg52) ? $unsigned(reg53) : (^wire40)),
                          wire42}),
                      $signed((wire39[(2'h2):(2'h2)] | ($unsigned(wire39) > $signed(wire42))))};
  assign wire59 = ((-(reg44[(4'hd):(4'h8)] & $unsigned(wire41[(3'h6):(3'h6)]))) != $unsigned((reg44[(3'h6):(2'h2)] <= {$unsigned((8'ha6))})));
  assign wire60 = (&(8'hbf));
  assign wire61 = (reg53 ?
                      (((!$signed(reg50)) ?
                          $unsigned($signed(wire59)) : ($signed(wire40) <<< $unsigned(wire54))) < $signed((~|(^reg46)))) : wire41);
  assign wire62 = $signed($unsigned(reg48[(3'h6):(2'h2)]));
endmodule
