module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire172;
  wire signed [(3'h4):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  assign y = {wire172,
                 wire24,
                 wire23,
                 reg4,
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
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire3, wire0[(4'h9):(2'h3)]})
        begin
          if ({((($unsigned(wire1) ? $unsigned(wire2) : wire1) ?
                  $unsigned(wire3) : ((wire2 && (7'h44)) ?
                      (wire3 && wire2) : wire1[(3'h4):(3'h4)])) >> (wire1[(3'h4):(2'h2)] ?
                  $signed(((8'ha9) - wire2)) : wire1[(3'h5):(2'h3)]))})
            begin
              reg4 <= (~&{wire2[(2'h3):(1'h1)],
                  (wire1 ? wire3[(3'h7):(1'h1)] : wire2[(1'h1):(1'h0)])});
              reg5 <= (-reg4[(4'he):(3'h6)]);
              reg6 <= (wire1[(2'h3):(1'h1)] ^ (wire0[(4'he):(1'h1)] > $unsigned((~&$signed(wire3)))));
              reg7 <= (wire1[(4'h9):(2'h2)] ^ reg6);
              reg8 <= $signed(((^$signed((wire0 || reg5))) ?
                  $unsigned(reg4[(3'h7):(3'h7)]) : ((-wire3[(2'h3):(1'h0)]) ?
                      ((~^wire2) + $signed(reg5)) : (^wire1[(2'h3):(2'h2)]))));
            end
          else
            begin
              reg4 <= $signed((-(7'h43)));
            end
        end
      else
        begin
          reg4 <= (&(^~reg8));
          reg5 <= $signed($unsigned($unsigned((8'had))));
        end
      reg9 <= $signed($unsigned(($signed(wire3[(3'h6):(1'h0)]) ?
          ((reg8 ? reg4 : wire1) > wire0) : $signed((+wire0)))));
      reg10 <= (~^reg6);
      reg11 <= reg7[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire0[(2'h3):(2'h2)]);
      reg13 <= $signed((wire1[(1'h0):(1'h0)] ?
          (8'h9f) : $signed(reg9[(1'h0):(1'h0)])));
      if ($unsigned($signed(wire3[(3'h5):(3'h5)])))
        begin
          reg14 <= reg8;
          if ($signed((reg11[(4'hb):(4'ha)] > ((7'h42) <= (+wire3)))))
            begin
              reg15 <= $unsigned({(^reg11)});
              reg16 <= (+$signed((^~wire1[(4'h8):(3'h5)])));
            end
          else
            begin
              reg15 <= reg9[(2'h3):(2'h2)];
              reg16 <= reg16[(3'h5):(2'h2)];
              reg17 <= $unsigned($unsigned($signed((reg9 > (reg9 ?
                  wire0 : reg9)))));
              reg18 <= $unsigned(reg8[(4'hb):(1'h0)]);
              reg19 <= reg10[(2'h3):(1'h0)];
            end
          reg20 <= (8'ha3);
          reg21 <= ({(($unsigned(reg12) != (~&wire0)) ?
                  ((reg17 - reg5) <<< ((8'hbb) | reg12)) : reg6)} != reg9);
          reg22 <= ($unsigned((((!reg13) ?
                      {(8'hb2), (8'ha3)} : $unsigned(wire2)) ?
                  (|reg19[(3'h5):(1'h1)]) : (7'h42))) ?
              $unsigned(reg15[(1'h1):(1'h0)]) : {reg4[(1'h0):(1'h0)]});
        end
      else
        begin
          reg14 <= reg14;
          reg15 <= $signed(reg11);
          if (reg20)
            begin
              reg16 <= $unsigned(reg14[(4'h8):(2'h2)]);
              reg17 <= wire2;
              reg18 <= reg15;
              reg19 <= $signed({reg8[(4'h8):(1'h1)]});
              reg20 <= reg10;
            end
          else
            begin
              reg16 <= ($unsigned((+$signed({reg12}))) - $unsigned((((~&reg7) >>> wire3[(3'h6):(3'h5)]) != $signed((wire2 ?
                  reg14 : wire2)))));
              reg17 <= reg8;
              reg18 <= $signed(((^~($signed(reg21) ?
                  wire1 : (wire2 ?
                      (7'h43) : wire3))) <<< (|reg20[(3'h5):(1'h0)])));
              reg19 <= $unsigned(((~((wire2 ~^ (8'ha6)) ?
                  reg16 : (reg11 & reg4))) >> $unsigned($unsigned($unsigned(wire0)))));
            end
        end
    end
  assign wire23 = wire0;
  assign wire24 = ((&$signed($signed($unsigned(wire1)))) != {{reg9[(1'h0):(1'h0)],
                          $signed((&(8'hb6)))}});
  module25 #() modinst173 (wire172, clk, reg11, reg6, reg12, reg15, reg20);
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire [(4'hf):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire171;
  wire [(5'h13):(1'h0)] wire170;
  wire [(3'h6):(1'h0)] wire169;
  wire signed [(5'h12):(1'h0)] wire168;
  wire [(4'hf):(1'h0)] wire167;
  wire signed [(5'h13):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire71;
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire165,
                 wire94,
                 wire93,
                 wire83,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  module31 #() modinst72 (.wire35(wire30), .wire32(wire26), .wire34(wire27), .y(wire71), .wire33(wire29), .clk(clk));
  assign wire73 = $signed($signed((({wire71, wire30} ?
                      wire28 : $unsigned(wire28)) >>> (&(&wire26)))));
  assign wire74 = {{($unsigned((7'h43)) | $signed(wire71[(4'h8):(3'h7)])),
                          $signed({{wire27, (8'h9e)}, (~wire73)})}};
  assign wire75 = ((^~$unsigned($unsigned(wire30[(3'h5):(2'h2)]))) ?
                      wire73[(3'h4):(2'h3)] : {wire27,
                          (wire28 + ((wire73 ? wire29 : wire74) ?
                              (~|wire27) : $signed(wire71)))});
  assign wire76 = $signed($unsigned(($unsigned($unsigned(wire28)) | wire29[(3'h6):(1'h1)])));
  assign wire77 = (~^({($signed(wire27) >>> $signed(wire28))} ?
                      (wire29[(4'hc):(3'h6)] ?
                          ($unsigned(wire28) ?
                              (wire76 ?
                                  (8'h9d) : wire30) : $signed(wire29)) : {((8'h9c) || (8'hab)),
                              (|wire29)}) : wire76));
  assign wire78 = $unsigned((-wire74[(1'h1):(1'h0)]));
  assign wire79 = $signed(wire30);
  always
    @(posedge clk) begin
      reg80 <= wire79[(2'h2):(2'h2)];
      reg81 <= wire77[(1'h0):(1'h0)];
      reg82 <= ({wire71} ?
          $signed($unsigned(({reg80} << (wire26 ^~ wire71)))) : $unsigned((wire76[(3'h7):(2'h2)] <<< {$signed(wire27)})));
    end
  assign wire83 = (~|(|reg81[(5'h15):(5'h13)]));
  always
    @(posedge clk) begin
      if ((~^$unsigned((~|wire76))))
        begin
          if (reg81[(2'h3):(1'h1)])
            begin
              reg84 <= wire71[(3'h6):(3'h5)];
              reg85 <= $signed((~^$signed({wire29[(4'hb):(3'h7)],
                  wire76[(4'h9):(2'h3)]})));
              reg86 <= $unsigned((wire30 ^ (&$unsigned((!reg81)))));
              reg87 <= ($signed(((~^(wire26 ? wire74 : wire29)) ?
                      ($signed(wire76) ?
                          reg86 : (reg82 ? wire75 : reg80)) : (~wire73))) ?
                  $signed((((wire78 > (8'h9f)) >= $signed(reg81)) ?
                      (8'h9d) : reg81[(3'h6):(3'h6)])) : {$signed(($signed(wire79) ^ {(8'ha2)})),
                      reg82});
            end
          else
            begin
              reg84 <= ($signed(({wire74} ?
                  {((8'ha3) ? reg81 : wire71),
                      (reg84 ^~ reg86)} : $unsigned((reg87 ?
                      (7'h41) : wire29)))) ^ $signed((!((-(8'hb7)) < (reg87 ^ reg86)))));
              reg85 <= wire83;
              reg86 <= wire27;
              reg87 <= (((wire30[(1'h1):(1'h1)] ?
                      (-reg81) : $unsigned($unsigned(wire76))) ?
                  (~^($signed(reg81) | reg80[(3'h5):(2'h3)])) : (!(~|(reg86 ?
                      reg87 : wire27)))) * {((~|wire78[(1'h0):(1'h0)]) >> ($signed(wire27) >= (~^reg84))),
                  $signed((((8'hb6) ? reg82 : wire79) < $unsigned(wire27)))});
            end
          reg88 <= wire74[(3'h5):(1'h0)];
          reg89 <= (($signed((|(8'hb7))) - (^(~((8'hbe) ?
              reg84 : wire74)))) && ((((-(8'hbb)) >>> reg84[(4'h8):(3'h5)]) ?
                  $unsigned({(8'hae)}) : (~&$signed(reg85))) ?
              $signed(reg86[(2'h3):(1'h1)]) : {$unsigned(((8'hbf) ?
                      (8'ha4) : wire71)),
                  $unsigned(((8'hac) ? wire28 : reg86))}));
          reg90 <= $unsigned((($signed((wire78 <= (8'h9e))) > ((8'hab) <<< $unsigned(wire71))) ?
              (((-wire26) ?
                  $signed(wire30) : (8'hbb)) & (!(~&wire74))) : $signed(reg87)));
        end
      else
        begin
          reg84 <= {$signed({($signed(reg80) >>> $signed(wire79))}), (8'hb5)};
          reg85 <= ($unsigned((8'hb3)) + (wire79[(1'h0):(1'h0)] ?
              reg80[(4'hf):(4'hd)] : {$unsigned(wire75[(4'h8):(4'h8)]),
                  ($unsigned((8'hbe)) || reg88)}));
          reg86 <= {(&$unsigned(wire74))};
          reg87 <= ($signed(reg81[(3'h6):(3'h6)]) >= (-(8'haf)));
          if ($unsigned(((^($signed(wire79) ?
                  $signed(reg87) : (reg81 ? (8'h9e) : (8'hac)))) ?
              ($signed(((7'h40) ?
                  wire79 : reg81)) >= reg82[(2'h3):(1'h1)]) : reg88)))
            begin
              reg88 <= (~&(~(((wire27 >= wire28) ?
                  $signed(reg85) : (8'h9d)) && wire83[(3'h4):(1'h1)])));
              reg89 <= {(wire27[(3'h5):(3'h5)] ^ (^~wire28[(2'h2):(1'h0)]))};
              reg90 <= ($signed((~|wire74[(1'h1):(1'h0)])) ?
                  (reg89[(4'hf):(3'h4)] ^~ {$signed((~^reg84)),
                      reg80[(3'h5):(2'h3)]}) : (reg90 ?
                      (8'h9d) : {reg81[(1'h0):(1'h0)]}));
              reg91 <= reg80;
              reg92 <= $unsigned(((($signed(wire29) >>> (~&(8'ha0))) ?
                  wire78[(1'h1):(1'h1)] : (reg82[(2'h3):(2'h3)] | $signed(wire71))) >>> (((wire30 ?
                      reg80 : (8'ha8)) ?
                  reg82[(2'h3):(1'h1)] : $unsigned(wire73)) + (&(|wire26)))));
            end
          else
            begin
              reg88 <= (((~|({reg89, wire26} ?
                          (wire79 ? (8'hb8) : (8'hb9)) : $signed(reg91))) ?
                      reg87[(1'h0):(1'h0)] : ((~^$unsigned(reg86)) ?
                          wire75[(2'h2):(2'h2)] : $unsigned(wire71))) ?
                  (+((~^wire28[(3'h7):(1'h0)]) ?
                      $unsigned($signed(reg91)) : reg87)) : $unsigned((reg89[(3'h5):(1'h0)] ?
                      ((wire30 ^ wire30) + wire29[(2'h2):(1'h0)]) : $unsigned((reg85 == reg86)))));
              reg89 <= ($signed(wire79[(2'h2):(1'h0)]) ?
                  $signed(wire27) : ((~|(reg90[(3'h7):(1'h0)] ?
                      (reg92 > reg82) : (wire27 ?
                          reg91 : wire83))) ~^ ((wire78[(3'h5):(1'h1)] ?
                          wire74 : wire76) ?
                      (^~$signed(reg84)) : $signed(wire29[(4'ha):(2'h2)]))));
            end
        end
    end
  assign wire93 = $unsigned((reg91[(1'h1):(1'h0)] ?
                      reg92 : {(wire78[(1'h1):(1'h0)] != (&wire76)), wire74}));
  assign wire94 = (|(-(~&(wire29 ? $signed(reg81) : {wire74}))));
  module95 #() modinst166 (wire165, clk, wire29, wire30, reg86, reg90);
  assign wire167 = $unsigned(reg92[(2'h2):(2'h2)]);
  assign wire168 = $signed((~&$signed({(~|wire74), (~wire71)})));
  assign wire169 = wire94[(1'h1):(1'h0)];
  assign wire170 = $unsigned({reg80[(4'hf):(4'h9)]});
  assign wire171 = wire73;
endmodule

module module95
#(parameter param163 = ((|({(~(8'hbb)), (^(8'hba))} - (((8'h9e) ? (8'hbf) : (8'ha0)) == (^(8'hbf))))) - (((~{(8'hba)}) * (((8'hb0) ? (8'ha4) : (8'had)) & (~^(8'ha6)))) ? {(+(~^(7'h42)))} : (((-(8'ha0)) ? (8'hba) : ((8'hbc) ? (8'hbb) : (8'ha0))) - ((8'ha2) ? (^(8'hae)) : ((8'haf) + (8'h9c)))))), 
parameter param164 = (((((param163 > param163) ? (^~param163) : (&param163)) ^ param163) ? (^~((param163 ? param163 : param163) << (&(7'h44)))) : param163) && (((8'ha4) ? ((param163 ? param163 : param163) ? (param163 != param163) : param163) : (^(param163 <= param163))) ? {param163} : param163)))
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h2f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire99;
  input wire [(4'hf):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire97;
  input wire [(5'h15):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(5'h10):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(5'h11):(1'h0)] reg159 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(3'h4):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(3'h4):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg100 = (1'h0);
  assign y = {wire162,
                 wire143,
                 wire142,
                 wire119,
                 wire118,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
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
                 reg120,
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
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({$unsigned(wire96[(4'hb):(3'h5)]),
          (^~(wire96[(4'hb):(4'h9)] & wire96[(4'hd):(4'hb)]))})
        begin
          if ({(8'hb5),
              $signed(($signed($unsigned(wire97)) ?
                  $unsigned(((8'hab) ? wire97 : wire97)) : ((wire96 <= wire98) ?
                      ((8'hb3) <<< wire96) : {wire97})))})
            begin
              reg100 <= wire97[(5'h11):(4'hc)];
            end
          else
            begin
              reg100 <= $unsigned(((+reg100) ?
                  (-reg100) : wire98[(1'h1):(1'h0)]));
            end
        end
      else
        begin
          reg100 <= (($unsigned($signed(reg100)) ?
                  (!{{(8'hb7), reg100},
                      ((8'had) * wire99)}) : $unsigned(wire96)) ?
              reg100[(3'h6):(1'h0)] : wire97[(4'hb):(4'hb)]);
          if ({wire98[(3'h5):(1'h1)],
              (&(|((7'h40) ? (8'hac) : (wire97 < (8'hb0)))))})
            begin
              reg101 <= $signed({wire96,
                  {((8'h9f) + (|(8'ha4))), (~&$signed(reg100))}});
              reg102 <= ((~(!($signed(wire98) >= $unsigned(reg100)))) > wire96);
            end
          else
            begin
              reg101 <= (&((($unsigned(wire99) - $signed((8'haa))) + ($signed(reg100) && $signed(wire98))) ?
                  (^(~reg102)) : (wire96 ~^ (8'hb2))));
              reg102 <= $signed(reg101);
              reg103 <= wire98[(4'h8):(2'h3)];
              reg104 <= (+reg102[(2'h3):(1'h0)]);
            end
          reg105 <= $unsigned($signed($signed(wire98[(4'hd):(4'hd)])));
          if ((((8'had) ? reg103[(4'h8):(1'h0)] : (8'h9c)) ^ $signed(wire97)))
            begin
              reg106 <= $unsigned(reg100[(3'h5):(3'h5)]);
              reg107 <= (~|reg106);
              reg108 <= reg101[(4'hf):(4'h8)];
              reg109 <= wire96;
              reg110 <= ($unsigned(((!(~^wire99)) ?
                  (~&reg104[(1'h0):(1'h0)]) : $unsigned((reg100 ^ reg109)))) && $signed($unsigned(reg105[(2'h3):(2'h3)])));
            end
          else
            begin
              reg106 <= ($signed($signed((((8'hb1) ?
                      reg107 : reg101) - reg108))) ?
                  $unsigned(((8'hab) ? reg108 : wire99)) : reg110);
              reg107 <= ($unsigned($signed(reg104)) ?
                  ((reg101 ?
                      wire96 : reg104[(3'h7):(3'h5)]) ^ reg103) : (~|wire98[(1'h1):(1'h1)]));
              reg108 <= reg100[(2'h2):(1'h0)];
              reg109 <= wire96[(5'h13):(4'h8)];
            end
          reg111 <= (8'hb8);
        end
      if ((+wire97[(3'h4):(2'h3)]))
        begin
          if (({reg106[(1'h0):(1'h0)]} ?
              (((^~$signed(reg110)) <<< $unsigned(reg109[(1'h0):(1'h0)])) ^~ (~^((wire98 ^ reg105) >= {reg111}))) : $unsigned((8'ha3))))
            begin
              reg112 <= $signed({{$signed($signed(reg107))},
                  $unsigned(reg109)});
              reg113 <= reg110[(3'h4):(1'h1)];
              reg114 <= wire96[(4'he):(4'hd)];
              reg115 <= wire98;
            end
          else
            begin
              reg112 <= ((~^(&wire96[(3'h6):(2'h2)])) ?
                  reg102[(1'h0):(1'h0)] : (reg103 ?
                      $unsigned($unsigned((~&reg104))) : reg114));
              reg113 <= $signed(((reg109[(2'h2):(1'h1)] ?
                  reg114[(3'h6):(1'h1)] : $unsigned(reg105)) || (~^reg114[(1'h0):(1'h0)])));
            end
          reg116 <= $signed({($signed((~(8'ha9))) > reg111[(4'h9):(4'h9)])});
          reg117 <= $signed(reg112[(4'hb):(2'h2)]);
        end
      else
        begin
          reg112 <= ((^~(((~reg108) ? ((8'ha6) ? wire96 : reg106) : (8'ha0)) ?
                  (~|reg111[(4'ha):(4'ha)]) : ((^reg117) - reg110))) ?
              $signed((!(!reg103))) : wire97[(4'hb):(2'h3)]);
          reg113 <= ({reg101[(4'ha):(3'h5)]} ?
              reg116 : $signed({(~^$unsigned(reg114)),
                  $unsigned($unsigned(reg115))}));
          reg114 <= (&reg111);
          reg115 <= {(^($unsigned((reg112 * (8'hb0))) ?
                  ($unsigned((8'hb7)) ?
                      (~|(8'hbf)) : $unsigned(reg115)) : reg111)),
              {{{$signed(reg115)}}}};
        end
    end
  assign wire118 = ((&$signed(reg115[(4'ha):(4'ha)])) <= $signed({reg107}));
  assign wire119 = (reg100[(2'h3):(2'h3)] ? reg115 : $unsigned({reg110}));
  always
    @(posedge clk) begin
      reg120 <= {$signed(reg102[(3'h4):(1'h0)])};
      if (((($unsigned((reg107 >>> reg115)) == wire118[(4'h9):(1'h1)]) >= $signed(reg120[(4'h8):(3'h7)])) * $unsigned($unsigned((wire119 + (|reg115))))))
        begin
          reg121 <= reg102[(1'h0):(1'h0)];
          if ((wire96[(4'he):(3'h5)] ?
              (reg121 << ($unsigned(reg105[(2'h3):(1'h1)]) <= (!(7'h41)))) : $signed({wire98[(4'ha):(3'h5)]})))
            begin
              reg122 <= reg103[(3'h4):(1'h1)];
              reg123 <= ((($unsigned((reg105 ? reg110 : reg108)) ?
                          reg109 : (reg108[(5'h14):(1'h1)] & $signed((8'ha4)))) ?
                      ((8'had) & reg112[(4'hd):(3'h6)]) : (~|{reg103})) ?
                  ($signed(((~^reg120) ?
                      reg102[(2'h2):(1'h1)] : reg117[(4'he):(4'hc)])) ^~ $signed($signed((reg103 ?
                      reg115 : reg107)))) : wire118);
              reg124 <= reg120[(1'h0):(1'h0)];
              reg125 <= wire119[(2'h3):(1'h1)];
              reg126 <= (~&reg115);
            end
          else
            begin
              reg122 <= reg111;
            end
        end
      else
        begin
          reg121 <= $signed(({wire118[(4'h8):(3'h7)]} ^~ (reg107[(2'h3):(1'h0)] + reg123[(4'h9):(4'h8)])));
          if ((~^(((~&(~^wire99)) ?
              reg103[(4'ha):(4'h8)] : (|reg102)) <<< reg121)))
            begin
              reg122 <= $unsigned((wire98 ?
                  $signed(((reg123 != reg125) ?
                      (&reg121) : {reg111})) : (&$unsigned(((8'ha1) ?
                      (7'h41) : reg102)))));
              reg123 <= reg101[(3'h4):(2'h2)];
              reg124 <= ($unsigned(reg115) ?
                  reg106 : ({((reg101 ?
                          reg123 : reg117) >> $unsigned(wire118))} ^ $unsigned((reg102[(1'h0):(1'h0)] ~^ (~&reg115)))));
            end
          else
            begin
              reg122 <= $unsigned(reg116[(2'h2):(2'h2)]);
            end
          reg125 <= $unsigned(reg115);
          if ($signed((8'hb1)))
            begin
              reg126 <= (($unsigned({$signed(reg104)}) ?
                  ($signed((wire119 ~^ wire96)) ^ $unsigned(reg108[(3'h6):(2'h2)])) : (8'ha7)) == (~|reg102));
              reg127 <= (^$unsigned((~$signed({(8'ha1)}))));
              reg128 <= ((8'hb4) ?
                  ((($unsigned(reg126) != (reg106 ? reg111 : (8'hb2))) ?
                      (~&$unsigned(reg113)) : (reg124[(2'h2):(1'h1)] ?
                          $signed(reg108) : reg100)) >>> $unsigned(({reg105} << ((7'h42) ?
                      (7'h40) : reg104)))) : wire118);
            end
          else
            begin
              reg126 <= ({(~&$signed({reg106})),
                      $unsigned(((reg101 ? reg106 : reg108) || (&reg108)))} ?
                  ((~|reg100) ?
                      ($unsigned((reg114 ? (8'ha4) : reg103)) ?
                          (!$signed((8'hba))) : reg107) : (!($unsigned(reg127) ?
                          (&reg111) : $unsigned(wire118)))) : reg108[(5'h14):(1'h0)]);
              reg127 <= ($unsigned((+((reg102 >>> wire119) | $signed(reg114)))) && $signed(($unsigned(reg115) ?
                  reg100 : reg102)));
              reg128 <= ($signed((($unsigned(reg115) ^ (reg125 ?
                          (8'h9c) : reg106)) ?
                      ($signed(reg127) ?
                          reg121 : reg123[(4'h8):(3'h4)]) : $signed((reg127 ?
                          wire96 : reg124)))) ?
                  reg103[(1'h0):(1'h0)] : reg124);
            end
          if ({reg120[(4'hd):(4'ha)]})
            begin
              reg129 <= (~{(|(reg109[(2'h2):(1'h0)] ?
                      reg121[(1'h1):(1'h1)] : $unsigned(reg111))),
                  $unsigned(reg111)});
            end
          else
            begin
              reg129 <= $unsigned($unsigned(wire96));
              reg130 <= $unsigned(reg102);
              reg131 <= ($signed($signed(((reg121 ?
                      reg100 : reg129) > reg106))) ?
                  $signed(reg123[(5'h14):(5'h13)]) : $signed((reg108[(4'hf):(4'h9)] * ((-(8'had)) <= (reg106 ?
                      reg128 : reg108)))));
            end
        end
      reg132 <= (reg129 || $unsigned(((reg109 - ((7'h44) | (8'ha6))) ?
          $unsigned((7'h43)) : {((8'h9e) ? reg107 : reg120), reg111})));
      if ((wire118[(4'ha):(3'h4)] ?
          $unsigned($signed((+$unsigned((8'h9c))))) : {reg121[(1'h0):(1'h0)],
              (~(8'ha4))}))
        begin
          reg133 <= reg105[(2'h3):(2'h3)];
        end
      else
        begin
          if ($unsigned(wire119[(2'h2):(1'h0)]))
            begin
              reg133 <= reg130[(1'h1):(1'h0)];
            end
          else
            begin
              reg133 <= (&$signed((^~((-wire97) >> reg127))));
            end
          if (reg122[(1'h1):(1'h1)])
            begin
              reg134 <= reg128[(3'h7):(3'h7)];
            end
          else
            begin
              reg134 <= ($unsigned(reg128[(3'h6):(3'h6)]) ?
                  (reg125 ?
                      (wire96 && ((reg110 ~^ reg132) ?
                          (reg130 ?
                              reg105 : wire99) : wire99[(4'h9):(3'h4)])) : $unsigned(($unsigned(reg105) << (wire98 || reg120)))) : $signed(wire97));
              reg135 <= {{$signed({((8'h9c) ^~ wire118), $unsigned((8'ha5))})}};
            end
          if (($signed(reg112[(2'h2):(2'h2)]) ?
              (|(-$unsigned({(8'hab), wire119}))) : (^~reg133[(1'h1):(1'h0)])))
            begin
              reg136 <= (!((reg126[(3'h7):(3'h6)] & reg129[(3'h5):(2'h2)]) > ($signed((reg131 ?
                      reg102 : reg122)) ?
                  (+$unsigned(reg133)) : $signed(reg100))));
              reg137 <= reg129[(3'h4):(2'h3)];
              reg138 <= {$signed(reg110)};
            end
          else
            begin
              reg136 <= $signed(reg130);
              reg137 <= reg121[(2'h2):(2'h2)];
              reg138 <= (|{$signed($unsigned((reg127 ? reg123 : (8'h9d))))});
              reg139 <= ((wire119[(1'h1):(1'h0)] ?
                      (reg131[(4'hf):(3'h7)] - {(wire98 != (8'ha7)),
                          (wire98 ? reg116 : (8'hb3))}) : (wire98 ?
                          ((reg129 ^~ reg101) < (-reg112)) : (reg133[(1'h0):(1'h0)] + (reg121 ?
                              (8'ha1) : reg104)))) ?
                  ((!((~|reg106) ? (^~(8'hb0)) : $signed(reg115))) ?
                      (+$signed({(8'h9d),
                          wire98})) : reg127[(3'h5):(3'h5)]) : (~&{(^$signed(reg124))}));
              reg140 <= ($unsigned(reg123[(4'he):(3'h5)]) ?
                  {(($unsigned(wire119) ^~ (reg125 ^~ reg113)) >> reg103[(4'hd):(3'h6)]),
                      $unsigned(reg103)} : {$signed((((8'ha2) ?
                          reg112 : reg137) || wire119[(2'h3):(2'h3)])),
                      reg123});
            end
        end
      reg141 <= reg101;
    end
  assign wire142 = $signed((((+$signed(reg136)) < reg116) <<< (^reg126[(4'he):(4'hc)])));
  assign wire143 = ((~&reg131[(3'h6):(3'h6)]) ?
                       (reg131[(4'hb):(2'h3)] ?
                           reg113[(3'h4):(3'h4)] : reg141) : ((reg137[(3'h5):(1'h1)] ?
                           $unsigned((!reg141)) : $unsigned(reg130)) - (+{(reg112 && reg134),
                           (8'ha4)})));
  always
    @(posedge clk) begin
      reg144 <= reg128[(3'h7):(3'h5)];
      reg145 <= ({$signed(wire97),
          $signed((!reg104[(4'h9):(3'h7)]))} ^ (!$signed(reg129)));
      reg146 <= $signed(reg128[(3'h6):(3'h6)]);
      if ({reg123[(5'h13):(5'h10)]})
        begin
          reg147 <= ($signed({reg133[(1'h0):(1'h0)]}) - (wire118 & $unsigned((^~$unsigned(reg125)))));
        end
      else
        begin
          reg147 <= wire119;
          reg148 <= wire96[(5'h14):(5'h13)];
          reg149 <= wire98;
        end
      reg150 <= {wire96[(4'ha):(3'h6)], reg135};
    end
  always
    @(posedge clk) begin
      reg151 <= (~&(^(~&reg145)));
      reg152 <= (~{((+(reg101 ?
              wire97 : (8'ha2))) && ($signed(reg139) >= $unsigned(reg126)))});
      if (reg121[(1'h1):(1'h1)])
        begin
          reg153 <= reg120;
          if (reg128)
            begin
              reg154 <= $unsigned($unsigned((reg102[(1'h1):(1'h1)] == reg137)));
            end
          else
            begin
              reg154 <= (reg125 ?
                  $unsigned((-{reg117, {reg151}})) : (!(&reg127)));
              reg155 <= $unsigned($signed(reg122[(4'he):(3'h7)]));
              reg156 <= (reg121[(3'h6):(1'h0)] < $unsigned(reg121[(3'h4):(1'h0)]));
              reg157 <= (~^$unsigned(reg131));
            end
          reg158 <= wire99;
          reg159 <= (&(+(^~$unsigned((+reg147)))));
        end
      else
        begin
          reg153 <= ({reg144,
              $unsigned(reg129[(1'h1):(1'h1)])} - $signed({reg107[(3'h7):(2'h2)]}));
          if ((((-(!$unsigned(reg137))) ?
                  (({(8'ha8),
                      reg128} == (~^reg144)) << reg104[(2'h3):(2'h3)]) : (wire97 < reg138)) ?
              ($unsigned(wire98[(2'h2):(2'h2)]) >>> (~^(8'hbc))) : ((reg115[(4'hf):(4'h8)] <<< ((reg122 < reg117) ?
                  (reg110 << reg112) : $signed(reg136))) >>> $unsigned(reg150))))
            begin
              reg154 <= reg145;
              reg155 <= $signed($unsigned(reg129));
              reg156 <= wire97[(3'h5):(2'h3)];
            end
          else
            begin
              reg154 <= ($unsigned($unsigned(reg151[(3'h4):(3'h4)])) >= ($signed((^~(reg124 ?
                  reg126 : (8'hbe)))) << (8'hba)));
              reg155 <= reg134;
            end
          reg157 <= (reg130 - {reg134});
        end
      reg160 <= reg122;
      reg161 <= $signed($unsigned((8'hb1)));
    end
  assign wire162 = reg121;
endmodule

module module31
#(parameter param69 = ((!({(|(8'ha8)), {(7'h43), (8'hb7)}} >>> (+{(8'hb6), (8'ha8)}))) == (^((((8'ha0) || (7'h43)) ? ((8'ha6) ? (8'hae) : (8'ha2)) : ((8'ha0) ? (8'hab) : (8'h9d))) ? (((7'h42) ? (8'ha1) : (8'ha5)) << (|(8'ha4))) : (^~((8'hb3) > (8'hb2)))))), 
parameter param70 = {{(7'h43), (((param69 ? param69 : param69) ? (~&param69) : (param69 | (8'had))) ? ((-param69) << (~^param69)) : {param69})}, ((((~param69) ? (param69 == param69) : (param69 ? param69 : param69)) ? (8'haf) : param69) - param69)})
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  input wire [(4'hf):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg55,
                 reg54,
                 reg53,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire36 = $unsigned($unsigned(($unsigned((&wire32)) ?
                      ({wire33, (8'ha3)} ?
                          (wire34 & wire32) : (wire33 ?
                              wire35 : wire35)) : {wire35,
                          $unsigned(wire35)})));
  assign wire37 = wire36;
  assign wire38 = wire37;
  assign wire39 = {$signed(wire35), $signed($signed(wire33[(4'ha):(3'h6)]))};
  always
    @(posedge clk) begin
      reg40 <= (($signed(wire35) >>> $unsigned($signed($unsigned(wire36)))) ?
          (^wire32) : $unsigned(wire35[(2'h3):(1'h1)]));
      reg41 <= ((($unsigned($signed(wire35)) < wire37[(4'hf):(4'hb)]) ?
          wire39 : ({$signed(wire35)} ?
              (!$unsigned(wire35)) : ($unsigned((8'ha8)) ?
                  wire35 : $unsigned(wire37)))) ^ (!(~|wire39)));
      if ((&wire33[(3'h6):(3'h6)]))
        begin
          reg42 <= $signed(wire36[(3'h7):(3'h5)]);
          reg43 <= $unsigned(($signed(((wire38 * reg42) >= $unsigned((8'ha0)))) ?
              (~|((reg42 ? wire36 : wire34) ?
                  (&wire32) : wire38[(5'h10):(2'h2)])) : (&wire36)));
          reg44 <= (($unsigned((~$signed(reg40))) ^ (((-wire35) << (|reg42)) ?
                  {$signed(wire38)} : (~|$signed(reg41)))) ?
              ($unsigned(({wire33,
                  (8'hbf)} >> $unsigned((8'ha5)))) >= reg40[(3'h5):(1'h0)]) : (~$unsigned((wire33[(4'hb):(2'h2)] ?
                  ((8'hac) ? wire39 : wire37) : $unsigned(wire34)))));
        end
      else
        begin
          reg42 <= wire34;
          if ((($unsigned($unsigned(wire32)) >= ($unsigned($unsigned(reg44)) ~^ ((wire36 ?
                  reg41 : reg42) <= $signed(reg43)))) ?
              wire35 : (-wire38[(4'hc):(4'hb)])))
            begin
              reg43 <= $signed(($signed((reg40[(1'h0):(1'h0)] ?
                  $signed(wire33) : $unsigned(wire32))) & wire34));
              reg44 <= $unsigned(wire32);
              reg45 <= ((reg41[(5'h10):(4'ha)] ^~ (~reg40)) | $signed(((reg41[(4'hc):(2'h3)] ?
                  {wire38,
                      reg44} : wire36) | $unsigned(reg44[(3'h5):(3'h4)]))));
              reg46 <= (~reg43);
            end
          else
            begin
              reg43 <= reg40;
              reg44 <= reg44;
              reg45 <= reg40;
              reg46 <= $unsigned({((&wire34) ?
                      ($signed(wire32) ?
                          (-reg40) : {wire34, (8'ha1)}) : {reg46[(2'h3):(1'h0)],
                          wire36[(4'h9):(3'h5)]}),
                  reg43[(3'h6):(3'h5)]});
            end
          reg47 <= {reg44[(4'h9):(3'h5)],
              ($unsigned(reg44[(3'h5):(1'h1)]) > $signed((~|$unsigned(reg46))))};
          reg48 <= wire34;
          reg49 <= $signed((wire34 >> wire34[(3'h4):(1'h1)]));
        end
    end
  assign wire50 = wire35;
  assign wire51 = (($unsigned(((wire39 ? wire37 : (8'hba)) ?
                          $unsigned((8'haf)) : reg41[(5'h15):(5'h11)])) ?
                      wire32 : (|((8'ha3) >>> $signed(reg49)))) <= $signed((7'h40)));
  assign wire52 = wire33;
  always
    @(posedge clk) begin
      reg53 <= wire32[(4'h8):(3'h6)];
      reg54 <= (wire39[(1'h1):(1'h0)] ? wire52 : wire51);
    end
  always
    @(posedge clk) begin
      reg55 <= ($unsigned($unsigned(($unsigned(reg54) ?
              (wire34 ? wire38 : wire36) : $unsigned(wire38)))) ?
          ((reg46[(1'h1):(1'h0)] ?
              (^~$signed(reg40)) : $unsigned($signed(reg41))) ^ wire51[(5'h10):(5'h10)]) : $signed($signed(($unsigned(reg46) ?
              reg49[(4'ha):(2'h3)] : $unsigned(wire32)))));
    end
  assign wire56 = (~&wire39);
  assign wire57 = $unsigned(((reg40[(3'h7):(1'h1)] ?
                          {(wire52 ? wire39 : wire51)} : (reg45[(4'ha):(2'h3)] ?
                              (8'ha7) : (8'hbe))) ?
                      $signed($signed((!wire34))) : {$unsigned($signed((8'hb5)))}));
  assign wire58 = wire50;
  assign wire59 = {$unsigned((~^((~^wire33) - (~|reg44)))), (&wire57)};
  assign wire60 = wire50[(1'h0):(1'h0)];
  assign wire61 = $signed(wire56[(4'ha):(3'h6)]);
  assign wire62 = ({(-(~&((7'h44) ?
                          reg46 : wire61)))} * {($signed(reg44[(3'h7):(1'h1)]) ?
                          $signed((&reg47)) : reg54)});
  assign wire63 = (~^reg43);
  assign wire64 = ($unsigned(reg42) ~^ ({{((8'hb2) << wire63),
                          (wire32 == wire50)}} | ($unsigned($unsigned(wire39)) > ({wire35} ?
                      reg43[(3'h5):(3'h4)] : $signed((7'h44))))));
  assign wire65 = reg48[(4'h8):(3'h7)];
  assign wire66 = (~|reg42);
  assign wire67 = wire39[(1'h0):(1'h0)];
  assign wire68 = reg48[(4'h9):(3'h7)];
endmodule
