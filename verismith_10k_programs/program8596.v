module top
#(parameter param169 = ({(~^(((8'hb4) * (8'hb5)) && (^(8'haa))))} ? ((~^(^~(^~(8'hb1)))) ? {(((8'hb4) ? (8'hb4) : (8'haa)) >> ((8'ha5) ? (8'h9d) : (8'ha0))), (~|(&(8'hbb)))} : ((8'ha9) - ({(8'hb4)} ? (7'h43) : {(8'hb8), (8'hb9)}))) : (~^(8'h9e))), 
parameter param170 = ((8'h9c) >= ((param169 ? {(param169 ^~ param169)} : (~(param169 + param169))) | param169)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire168;
  wire signed [(4'he):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire signed [(4'hb):(1'h0)] wire163;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(5'h15):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(4'h8):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire114,
                 wire113,
                 wire112,
                 wire90,
                 wire88,
                 wire4,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 (1'h0)};
  assign wire4 = (~&wire2[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg5 <= wire1;
          reg6 <= reg5[(2'h3):(2'h3)];
          reg7 <= ({$unsigned($signed($signed(wire2)))} ?
              ($unsigned((((8'h9e) ?
                  reg5 : reg5) <<< (wire0 | reg6))) * wire0) : (~&$signed(($signed((8'ha0)) ?
                  (^~reg5) : $signed(wire3)))));
        end
      else
        begin
          reg5 <= ({$unsigned($unsigned(((7'h41) & wire1)))} != (~$unsigned($unsigned({wire2}))));
          reg6 <= (reg6[(2'h3):(1'h1)] * (8'haa));
          if ($unsigned(wire2))
            begin
              reg7 <= (((((wire1 ? wire0 : wire0) + (wire1 < wire2)) ?
                  wire4[(1'h1):(1'h0)] : $signed((reg5 ?
                      (8'hb5) : wire4))) <<< (8'ha1)) ~^ $unsigned(reg5));
              reg8 <= ({((~&$unsigned(wire2)) - (|(wire3 >> wire2))),
                      (~$signed(reg7[(1'h0):(1'h0)]))} ?
                  {$unsigned((wire4 ?
                          wire0[(4'h8):(3'h7)] : reg6[(1'h1):(1'h1)])),
                      wire3} : reg6);
              reg9 <= ({({(~^wire2)} - (^$unsigned(reg7))),
                  reg7[(2'h2):(1'h1)]} || reg6);
            end
          else
            begin
              reg7 <= $signed(wire2[(4'h8):(1'h0)]);
              reg8 <= (^(((wire0 <<< wire1) + (reg5[(2'h3):(2'h3)] ?
                  (wire0 ~^ wire3) : (wire1 < wire2))) * wire4[(4'ha):(1'h0)]));
              reg9 <= $unsigned((~&($signed((wire4 ? wire4 : wire1)) ?
                  reg8 : (!(8'ha1)))));
            end
          reg10 <= $signed($unsigned($unsigned(reg5)));
        end
    end
  always
    @(posedge clk) begin
      if ((reg10[(3'h4):(2'h3)] ? (8'hbe) : reg9))
        begin
          reg11 <= (reg8[(3'h6):(1'h0)] * ((+(~&$unsigned(reg9))) ?
              reg8[(1'h0):(1'h0)] : (wire4[(5'h12):(3'h4)] << (reg5 ?
                  $signed(wire1) : {wire3, reg8}))));
          reg12 <= ((^~reg11) < (^$unsigned($signed($unsigned(reg10)))));
          reg13 <= (reg10 ?
              (wire3 || wire4) : $unsigned(($unsigned((~^wire4)) ?
                  ((!reg8) ?
                      $unsigned(reg10) : $unsigned(reg5)) : (reg9[(5'h12):(4'hb)] ?
                      wire4[(4'h9):(4'h8)] : reg6[(2'h3):(1'h0)]))));
        end
      else
        begin
          if (reg6)
            begin
              reg11 <= wire4[(4'h9):(3'h5)];
              reg12 <= (reg13[(3'h4):(2'h3)] <<< (wire0 ^ $unsigned({wire1,
                  (wire3 ? wire1 : reg7)})));
            end
          else
            begin
              reg11 <= {$signed((|reg7))};
              reg12 <= ((-((wire1[(1'h0):(1'h0)] ?
                      (reg12 ? (8'hab) : reg7) : {reg9, wire0}) ?
                  $signed(((7'h41) - reg10)) : (wire3 ?
                      reg5 : wire2))) >> $signed(($signed({reg11}) * reg6)));
              reg13 <= ($signed(reg10) ?
                  {((|$unsigned(reg6)) >= reg11[(2'h3):(1'h0)]),
                      reg12[(3'h6):(3'h5)]} : reg5);
            end
          reg14 <= reg6[(1'h0):(1'h0)];
          reg15 <= {$unsigned((&(^~$unsigned(reg13)))),
              ($signed(reg12) >= $unsigned({$signed((8'hbb))}))};
          reg16 <= (~^{$unsigned({$unsigned(wire0)})});
        end
      reg17 <= (reg12[(4'h8):(3'h4)] ?
          (+$unsigned((~^(reg16 + reg6)))) : ((reg7 ?
                  (reg12[(1'h1):(1'h0)] ^~ $unsigned(reg15)) : reg10[(3'h7):(3'h6)]) ?
              reg15[(1'h0):(1'h0)] : ((wire4 | $unsigned(wire2)) ?
                  {reg6[(1'h1):(1'h0)]} : ($signed(reg13) ?
                      $unsigned(wire1) : reg16))));
      if ((&$unsigned(reg5)))
        begin
          reg18 <= wire2;
          reg19 <= $signed(wire1);
        end
      else
        begin
          reg18 <= $signed((~^reg13[(2'h3):(2'h3)]));
          reg19 <= {$unsigned($signed($unsigned($unsigned(reg17)))),
              (((reg12 << $unsigned((8'haf))) ?
                  reg17 : $signed(((8'hbf) <= reg17))) != {$unsigned((reg15 ?
                      reg8 : (8'ha2))),
                  $signed((reg5 ? reg18 : reg16))})};
          reg20 <= $unsigned(($signed((reg16[(2'h3):(2'h2)] || $unsigned((8'ha0)))) > $unsigned(((reg18 ?
                  reg5 : (7'h40)) ?
              reg5 : (reg10 ? reg7 : wire3)))));
          reg21 <= $signed(reg10);
          if (reg13[(2'h3):(2'h3)])
            begin
              reg22 <= reg15;
            end
          else
            begin
              reg22 <= (-(($unsigned(reg9) ?
                  (~|$signed(reg20)) : ($signed(reg6) * {reg15})) <= reg7));
              reg23 <= $signed((reg7[(2'h2):(2'h2)] ?
                  (~^$unsigned(((7'h40) ? reg19 : (7'h41)))) : (8'ha0)));
              reg24 <= {wire3[(3'h5):(2'h2)]};
              reg25 <= $unsigned({reg5[(2'h3):(1'h0)],
                  ((8'hb7) ? $unsigned($signed(reg15)) : $unsigned(reg6))});
            end
        end
      reg26 <= $unsigned((reg16 + (~&$unsigned($signed(reg12)))));
    end
  module27 #() modinst89 (wire88, clk, reg19, reg16, reg7, reg15);
  assign wire90 = reg25[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg91 <= $unsigned((8'ha5));
      if ($unsigned(wire90))
        begin
          reg92 <= reg7[(4'h8):(2'h2)];
          reg93 <= $unsigned(reg11[(4'h8):(3'h6)]);
          if (wire3)
            begin
              reg94 <= reg12;
            end
          else
            begin
              reg94 <= $signed((reg20[(4'h8):(3'h7)] ?
                  reg13[(3'h4):(1'h1)] : reg24));
              reg95 <= reg5;
              reg96 <= {(|$signed($signed((~|wire88))))};
              reg97 <= ($signed(($signed(reg21[(1'h0):(1'h0)]) >= $signed((~^(8'hae))))) ?
                  $unsigned($signed($unsigned($signed(reg21)))) : $signed(($signed($signed(reg24)) ?
                      $unsigned(reg92[(3'h5):(1'h0)]) : $signed({reg6,
                          wire88}))));
              reg98 <= reg8;
            end
          reg99 <= $signed(reg14[(3'h4):(1'h0)]);
          reg100 <= ((~|reg19[(5'h10):(2'h3)]) - $unsigned($unsigned(({reg15,
              reg98} - (-wire3)))));
        end
      else
        begin
          if ($signed(((wire3[(2'h2):(2'h2)] ?
                  (wire0 ^~ $unsigned(reg25)) : ((~|reg12) ?
                      (|reg97) : (reg98 << (8'hbe)))) ?
              ($unsigned((~|reg26)) ?
                  ((reg94 >= reg11) >>> $signed(reg10)) : wire0[(3'h4):(3'h4)]) : $unsigned(({(8'hb4)} | {reg22})))))
            begin
              reg92 <= $unsigned({wire2, $unsigned($signed({wire3, reg5}))});
              reg93 <= wire88[(1'h1):(1'h0)];
              reg94 <= $unsigned(reg7[(4'he):(3'h6)]);
              reg95 <= reg14;
              reg96 <= reg94;
            end
          else
            begin
              reg92 <= reg91;
              reg93 <= (-((((~|reg17) ?
                      (reg95 ? reg24 : reg23) : (reg95 ? reg12 : (7'h41))) ?
                  reg6[(1'h0):(1'h0)] : ($unsigned(reg98) + (~^(8'hbc)))) ^~ (($signed(wire3) ?
                  ((8'hb2) ? reg15 : reg92) : (reg91 ?
                      reg7 : (8'ha8))) | wire1)));
              reg94 <= (&$unsigned((&reg24[(4'h8):(3'h4)])));
              reg95 <= {$signed(reg98),
                  (((wire3[(4'h9):(3'h7)] ?
                          (reg14 ? reg94 : (8'ha7)) : (wire4 ? reg18 : reg20)) ?
                      (8'hb5) : wire90[(3'h4):(2'h3)]) != $signed($unsigned($signed(reg25))))};
            end
        end
      reg101 <= (!{(((^~(7'h43)) ? $signed(wire3) : reg9) - (+(|reg9)))});
      reg102 <= (({($signed(reg93) | $signed((8'hbe))),
              $unsigned($signed((8'hba)))} - reg91[(2'h2):(1'h1)]) ?
          ((~^($signed(reg95) ?
              wire0[(3'h5):(2'h2)] : $unsigned(reg6))) * (~|($unsigned((8'hb8)) + $signed((8'hbc))))) : ($unsigned(((7'h41) ?
              {reg6, reg98} : $signed(reg15))) >>> reg98));
      if (reg15)
        begin
          reg103 <= (+$unsigned((-$signed($unsigned(reg24)))));
          reg104 <= $unsigned(reg18[(3'h7):(3'h4)]);
          reg105 <= ((((^~$signed(reg21)) ~^ (reg20[(5'h11):(4'h9)] ?
                  (^wire4) : reg22)) ^ {(8'ha4), reg91[(1'h0):(1'h0)]}) ?
              reg16[(5'h11):(3'h6)] : (~|((8'haa) ~^ ((reg17 >>> reg24) ?
                  (8'hbe) : $signed(reg12)))));
          reg106 <= ($signed((~&((reg16 < reg103) > (reg20 <= reg15)))) ~^ ($signed({$unsigned(reg24),
                  $unsigned(reg20)}) ?
              reg17 : (8'hbe)));
          reg107 <= (reg25 ? reg104[(5'h10):(1'h1)] : wire0);
        end
      else
        begin
          reg103 <= (wire90 ^ {reg18});
          reg104 <= (&$signed((&reg93)));
          reg105 <= {$unsigned($signed((&reg13))), $signed($unsigned(reg22))};
          if ($unsigned($unsigned(reg99[(3'h6):(3'h5)])))
            begin
              reg106 <= $unsigned($signed({$unsigned((wire2 ? reg12 : reg17)),
                  ($signed(wire1) < {reg12, reg17})}));
              reg107 <= reg100;
              reg108 <= (&(~|reg92[(1'h1):(1'h1)]));
              reg109 <= $signed(((reg6[(1'h0):(1'h0)] ?
                      $unsigned($unsigned(reg24)) : ($unsigned(reg93) & ((8'hb0) ?
                          reg100 : reg19))) ?
                  reg97 : ((reg17[(3'h4):(2'h3)] ?
                          $signed((8'ha5)) : (wire4 ? reg100 : reg92)) ?
                      ((^~reg98) ?
                          reg105[(3'h7):(3'h5)] : reg6[(1'h1):(1'h1)]) : $unsigned(wire90[(4'h8):(2'h2)]))));
              reg110 <= $signed((~^({$signed(reg105)} * ($signed(wire90) == $signed(wire0)))));
            end
          else
            begin
              reg106 <= $signed(wire3[(3'h6):(2'h2)]);
            end
          reg111 <= (^((((reg16 | reg19) || (~reg96)) ?
                  reg9[(3'h5):(2'h3)] : (reg7[(2'h2):(1'h0)] ?
                      (&reg10) : (reg22 ? reg94 : (8'ha3)))) ?
              {(|reg14),
                  ((wire2 - reg23) ?
                      $signed((7'h42)) : ((8'ha3) >> (8'ha5)))} : reg99[(1'h0):(1'h0)]));
        end
    end
  assign wire112 = wire90;
  assign wire113 = {(^~(!$signed({reg94}))), reg16[(5'h12):(4'hc)]};
  assign wire114 = ($signed((($signed(reg24) ?
                           $signed(reg91) : (8'hbc)) && ((reg11 >= reg107) ?
                           $signed(reg12) : (!(8'hb5))))) ?
                       ((reg93[(2'h2):(1'h0)] ?
                               {reg26} : $unsigned(reg94[(5'h11):(2'h2)])) ?
                           reg17 : $unsigned({(wire3 << (8'ha6)),
                               reg111})) : (($signed((wire2 >> wire0)) ?
                           reg19 : reg92) >= $signed(($signed(reg26) ?
                           $unsigned(reg91) : $unsigned((8'hba))))));
  module115 #() modinst164 (wire163, clk, wire114, reg23, wire1, reg99, reg103);
  assign wire165 = {{$unsigned(($unsigned(reg95) - $signed(reg11)))}};
  assign wire166 = wire114[(4'h9):(3'h4)];
  assign wire167 = reg10[(2'h3):(1'h0)];
  assign wire168 = $unsigned($unsigned(reg17[(2'h3):(2'h3)]));
endmodule

module module115  (y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire120;
  input wire signed [(3'h7):(1'h0)] wire119;
  input wire signed [(4'h8):(1'h0)] wire118;
  input wire [(5'h11):(1'h0)] wire117;
  input wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire signed [(4'hd):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire signed [(3'h4):(1'h0)] wire155;
  wire [(5'h13):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(3'h7):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire155,
                 wire138,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire122,
                 wire121,
                 reg123,
                 reg124,
                 reg125,
                 reg134,
                 reg135,
                 reg136,
                 reg137,
                 (1'h0)};
  assign wire121 = wire119;
  assign wire122 = $signed(wire119);
  always
    @(posedge clk) begin
      reg123 <= ($signed((~wire119)) ? $signed(wire119) : wire116);
      reg124 <= (($unsigned(((wire122 && wire118) ?
                  (wire122 ? wire116 : wire120) : wire118)) ?
              (((wire118 ?
                  wire119 : wire119) ^ (+(8'hb7))) - $signed($unsigned(wire122))) : wire120[(3'h6):(2'h3)]) ?
          {wire120[(4'h9):(3'h7)]} : wire119);
      reg125 <= (|(8'hb3));
    end
  assign wire126 = wire121[(1'h0):(1'h0)];
  assign wire127 = (~^($signed($signed((wire126 >= wire116))) > wire120[(4'hd):(3'h6)]));
  assign wire128 = ((wire120 < $signed(wire126)) ?
                       (~&(((wire116 ? wire116 : (8'hba)) ?
                               wire126 : reg124[(3'h4):(2'h3)]) ?
                           (reg123 ?
                               (wire118 ?
                                   wire122 : wire120) : $signed(wire127)) : ((~|(8'hbc)) ~^ wire127[(2'h2):(1'h1)]))) : $unsigned({(&$unsigned(reg124))}));
  assign wire129 = {(~&(wire122[(3'h5):(2'h3)] - (-$unsigned(reg125))))};
  assign wire130 = $unsigned($signed((($signed((8'had)) ?
                       $signed(wire116) : wire129) == wire118)));
  assign wire131 = wire130;
  assign wire132 = wire129[(2'h3):(2'h2)];
  assign wire133 = wire130[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg134 <= (-(~&$unsigned(wire126[(1'h1):(1'h1)])));
      reg135 <= wire122[(3'h5):(3'h5)];
      reg136 <= (!wire132[(1'h0):(1'h0)]);
      reg137 <= ((reg123 <= reg123) || {wire131[(3'h6):(1'h0)],
          (~reg124[(3'h5):(3'h4)])});
    end
  assign wire138 = $signed(wire133[(2'h3):(1'h1)]);
  module139 #() modinst156 (.y(wire155), .wire140(wire132), .wire142(reg137), .clk(clk), .wire143(wire117), .wire141(wire130), .wire144(wire133));
  assign wire157 = wire131[(4'ha):(4'h9)];
  assign wire158 = (&((({wire120} ? reg124 : (8'h9f)) ?
                           (|wire126) : $signed((-reg137))) ?
                       $signed(wire157) : $signed((8'h9c))));
  assign wire159 = wire130;
  assign wire160 = wire120[(4'hb):(4'h9)];
  assign wire161 = ((&wire118) ^~ ($unsigned(wire126) <= wire128[(4'hb):(3'h6)]));
  assign wire162 = ({$signed($signed(wire122[(1'h1):(1'h0)]))} < wire117);
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire30;
  input wire [(5'h10):(1'h0)] wire29;
  input wire signed [(4'he):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  assign y = {wire85, wire33, wire32, reg87, (1'h0)};
  assign wire32 = (((~(wire31[(3'h5):(1'h0)] ?
                          (wire30 ? wire29 : wire31) : (wire29 ?
                              wire29 : wire30))) && (($signed(wire28) || wire30) ?
                          $unsigned($unsigned(wire30)) : wire31)) ?
                      ((wire30 ?
                          (wire28[(1'h0):(1'h0)] >> (+(8'hba))) : (~^(&(7'h42)))) * {($signed(wire29) & (wire31 ?
                              wire30 : wire29))}) : (+(~^wire28)));
  assign wire33 = wire30[(5'h11):(4'ha)];
  module34 #() modinst86 (wire85, clk, wire29, wire31, wire32, wire28);
  always
    @(posedge clk) begin
      reg87 <= $signed(($unsigned($unsigned((wire28 != (8'hb0)))) & wire33[(5'h10):(3'h5)]));
    end
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire76,
                 wire74,
                 wire61,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
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
                 reg49,
                 reg48,
                 reg47,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= (wire35 == $signed((~&(wire35[(2'h2):(2'h2)] ?
          ((8'hb3) ? wire38 : wire38) : (wire36 ? wire36 : wire38)))));
    end
  assign wire40 = (|(8'ha9));
  assign wire41 = (~($signed((~^wire40[(3'h5):(1'h0)])) ?
                      $signed((wire37 ?
                          (8'hb9) : (reg39 <= wire37))) : (~$signed((8'hac)))));
  assign wire42 = $unsigned(wire38[(4'h8):(2'h3)]);
  assign wire43 = $signed($unsigned(wire42[(2'h2):(2'h2)]));
  assign wire44 = $signed($unsigned(({(wire43 || wire35), (wire40 || wire40)} ?
                      wire35[(3'h5):(1'h1)] : wire40[(4'hb):(2'h2)])));
  assign wire45 = wire40[(3'h5):(3'h5)];
  assign wire46 = wire43[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg47 <= ((~|wire40) == ((wire42[(1'h0):(1'h0)] & ($unsigned(wire35) < $unsigned(reg39))) ?
          ($signed($signed(wire38)) * {wire43[(1'h1):(1'h0)],
              (wire36 <= wire35)}) : (wire36[(1'h1):(1'h1)] ?
              $signed((wire36 ? wire40 : wire42)) : ((wire36 < wire42) ?
                  wire41[(3'h5):(2'h3)] : (~^reg39)))));
      reg48 <= {$unsigned(wire46), {$unsigned((-(8'had)))}};
      reg49 <= (($unsigned(((wire45 ? wire45 : reg48) | reg47)) ?
          wire44 : $unsigned((&wire42))) >= $signed($unsigned((7'h42))));
      if ((~|($unsigned($signed({wire37, wire36})) <= wire40)))
        begin
          reg50 <= wire35;
        end
      else
        begin
          if (wire40)
            begin
              reg50 <= wire36[(1'h0):(1'h0)];
              reg51 <= wire40[(5'h11):(4'hc)];
              reg52 <= (^~({(7'h44), $signed((~wire44))} ?
                  wire45 : reg47[(1'h1):(1'h0)]));
            end
          else
            begin
              reg50 <= $unsigned(({{wire38,
                      $signed(wire46)}} <= $signed((8'hb5))));
            end
          reg53 <= (~^wire38[(4'hc):(4'hb)]);
          reg54 <= $unsigned(({wire43[(2'h2):(1'h0)],
              wire36} || (|$signed((wire40 ? (8'hb4) : wire41)))));
          reg55 <= wire46;
        end
      reg56 <= $signed((^($signed(reg50) ?
          (~$unsigned(wire45)) : $unsigned((reg53 + wire46)))));
    end
  always
    @(posedge clk) begin
      reg57 <= $signed((~&{($unsigned(wire40) ?
              $unsigned((7'h43)) : {wire45})}));
      if ($unsigned(wire43[(2'h2):(2'h2)]))
        begin
          reg58 <= (reg50[(5'h10):(2'h2)] | ((8'hb7) ?
              $unsigned(wire40) : reg53[(2'h3):(2'h3)]));
          if ({((&((reg50 != reg49) ? reg56 : {wire40, wire41})) ?
                  $signed(reg57[(3'h6):(3'h5)]) : $signed(reg39)),
              (!reg47[(2'h3):(2'h2)])})
            begin
              reg59 <= reg51;
            end
          else
            begin
              reg59 <= (^wire46[(3'h6):(3'h6)]);
            end
        end
      else
        begin
          reg58 <= $signed(reg54);
          reg59 <= ((8'hb8) ?
              $signed($unsigned((8'haa))) : $signed($unsigned((8'ha5))));
          reg60 <= $unsigned($signed(reg39));
        end
    end
  assign wire61 = reg53[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      if ((((($unsigned(wire41) && reg56) ~^ $unsigned({wire46,
          reg56})) ~^ ((+wire40[(4'hb):(2'h2)]) || (((8'hbe) ?
          reg57 : reg58) < (8'had)))) + $signed((^(&((8'hb6) == reg47))))))
        begin
          reg62 <= (((&$signed((reg52 ?
                  reg55 : wire46))) != $signed(((^~(8'hb7)) ?
                  $unsigned(reg52) : (~reg54)))) ?
              wire46[(4'h8):(3'h7)] : $unsigned(wire46));
          reg63 <= $signed(wire40);
          reg64 <= wire42;
          if ($unsigned(((($signed(reg39) ?
                  $unsigned(reg62) : (reg55 > (8'hb9))) < (reg60[(5'h10):(4'ha)] & (~^wire37))) ?
              $unsigned($unsigned(reg50)) : $unsigned(((reg63 ?
                  reg55 : wire42) - $unsigned(wire35))))))
            begin
              reg65 <= (8'hb4);
            end
          else
            begin
              reg65 <= (~&(reg60 || ($signed($signed(reg49)) ?
                  (~|reg57) : ($signed(wire61) ^ reg58))));
              reg66 <= (~|(wire45 ?
                  ({(reg49 ^~ wire37)} << reg49[(3'h7):(3'h7)]) : $unsigned((~|(wire42 || wire43)))));
              reg67 <= ($unsigned($unsigned($unsigned(wire46))) ?
                  ($signed(wire45[(3'h4):(1'h1)]) == ({(reg55 ? reg65 : reg59),
                          (^wire61)} ?
                      reg54 : ((~(8'ha6)) ~^ (reg64 || reg51)))) : (~|({reg63} ?
                      reg39[(3'h6):(3'h6)] : (reg64 && (!reg62)))));
            end
        end
      else
        begin
          reg62 <= ((($signed((7'h41)) >= ({reg58,
                  wire37} > $unsigned(wire42))) == ({wire61,
                  reg64} ^ ((reg56 ~^ reg60) < wire40[(1'h0):(1'h0)]))) ?
              reg59[(4'hb):(2'h3)] : ($unsigned(((reg58 ?
                  reg53 : wire42) >= wire35)) > $unsigned(wire36[(2'h2):(1'h0)])));
        end
      if ($unsigned((^~reg67)))
        begin
          reg68 <= (^~reg64);
        end
      else
        begin
          reg68 <= (wire61 <= reg56[(2'h3):(2'h3)]);
        end
      if ($signed(((|wire45) ?
          reg51[(2'h3):(1'h1)] : $signed(wire45[(2'h3):(1'h0)]))))
        begin
          reg69 <= (8'haf);
          reg70 <= $signed($signed((~^reg56[(3'h5):(1'h1)])));
        end
      else
        begin
          reg69 <= reg50[(4'h9):(2'h2)];
          reg70 <= $signed(reg59);
          reg71 <= reg52[(1'h1):(1'h0)];
          reg72 <= ($signed({{$unsigned(reg55)},
              {$signed(reg39), reg68[(1'h1):(1'h0)]}}) && (8'hb1));
        end
      reg73 <= {$signed((~&($signed(reg64) ?
              $unsigned(reg55) : (reg62 ? reg52 : reg72)))),
          reg59};
    end
  assign wire74 = $signed(($unsigned($signed({reg49})) ?
                      (({reg54, reg39} ?
                          ((8'ha8) >= (8'hbb)) : reg57) ^~ (+(wire35 ?
                          reg70 : reg51))) : $unsigned(((reg55 ?
                              reg59 : reg39) ?
                          reg71 : $signed(reg52)))));
  always
    @(posedge clk) begin
      reg75 <= reg54[(2'h2):(1'h1)];
    end
  assign wire76 = (reg73[(1'h1):(1'h1)] * ((~&wire38) >> reg66));
  always
    @(posedge clk) begin
      reg77 <= wire45;
      reg78 <= (reg62[(2'h2):(2'h2)] < $signed({(~|reg72)}));
      reg79 <= $signed($signed($signed(reg52[(3'h4):(1'h1)])));
      reg80 <= $unsigned($signed((+reg71)));
      reg81 <= (((8'ha4) && wire40) || ((reg75[(1'h1):(1'h1)] >>> $unsigned((reg47 ?
              (8'ha0) : wire76))) ?
          (!$unsigned(reg72[(2'h2):(1'h1)])) : {(!reg52[(1'h1):(1'h0)]),
              $unsigned(wire42[(1'h1):(1'h1)])}));
    end
  assign wire82 = {$signed(reg60)};
  assign wire83 = (((|(-(8'hb7))) ?
                      {((reg62 >> reg68) ?
                              $signed(reg47) : (reg64 || wire37))} : (wire36 ?
                          (&(reg64 ?
                              reg56 : wire38)) : $signed($signed(reg71)))) > $unsigned((($unsigned(reg58) & wire61[(1'h0):(1'h0)]) ?
                      $signed(reg81) : wire42[(2'h3):(2'h2)])));
  assign wire84 = $signed((({(!reg53)} + ((|reg59) ^~ reg64[(2'h3):(1'h0)])) ?
                      (~^(^~wire43[(1'h1):(1'h0)])) : ((reg67[(4'ha):(3'h6)] != reg66) << (8'hb8))));
endmodule

module module139
#(parameter param153 = {(~&(({(8'hb4)} || (-(8'ha3))) ? (&((8'hbd) < (8'ha5))) : (^~{(8'hbb), (8'hbf)}))), (~^(+(!(&(8'hbd)))))}, 
parameter param154 = param153)
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire144;
  input wire signed [(5'h11):(1'h0)] wire143;
  input wire signed [(3'h7):(1'h0)] wire142;
  input wire [(4'h9):(1'h0)] wire141;
  input wire [(2'h3):(1'h0)] wire140;
  wire [(5'h11):(1'h0)] wire147;
  wire [(3'h4):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  reg [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  assign wire145 = $signed(wire140);
  assign wire146 = (wire140[(1'h0):(1'h0)] < (({(^wire140),
                       $signed(wire140)} > (^((8'hbb) > wire142))) * ($unsigned($unsigned(wire145)) || (~^(wire145 || wire142)))));
  assign wire147 = (^(($signed($unsigned(wire144)) ?
                           (!wire146) : ((wire146 ?
                               wire144 : wire143) | wire145[(3'h4):(1'h0)])) ?
                       ({wire145,
                           {wire142,
                               wire144}} ^ (~wire144[(4'h8):(3'h6)])) : wire146[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg148 <= wire141;
    end
  always
    @(posedge clk) begin
      reg149 <= (wire142[(2'h2):(1'h1)] ?
          wire144[(4'h9):(3'h4)] : $unsigned(wire140[(1'h1):(1'h0)]));
      reg150 <= ((({(wire144 <= wire140), wire146} ?
                  $signed((wire141 >= reg148)) : (~|$signed(wire144))) ?
              (~^(^~((8'hac) ~^ wire143))) : (wire144 != (!wire144))) ?
          (^$signed(($unsigned(wire146) ?
              (wire145 | wire145) : reg149[(4'h8):(2'h2)]))) : wire141);
      reg151 <= wire145;
      reg152 <= (8'hbf);
    end
endmodule
