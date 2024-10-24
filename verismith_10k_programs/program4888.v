module top
#(parameter param166 = (({{((8'hb7) ? (8'hbf) : (8'ha0))}, {((8'haa) ? (8'ha7) : (8'hac))}} < ((+(~|(8'ha9))) ? (8'haf) : {(+(8'h9c)), ((8'hba) ? (8'h9f) : (8'hab))})) ? (^~{(((8'ha3) >>> (8'hba)) ? (~|(8'hb4)) : {(8'hbc)})}) : (8'h9c)), 
parameter param167 = (((~(param166 ^~ param166)) ? (param166 == ((param166 ? (8'hb3) : param166) >> (param166 ? param166 : param166))) : ((param166 ? (|param166) : (&param166)) | param166)) | param166))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire164;
  wire [(3'h6):(1'h0)] wire163;
  wire signed [(5'h10):(1'h0)] wire162;
  wire [(2'h2):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire signed [(4'h9):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire157;
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire4,
                 wire5,
                 wire15,
                 wire32,
                 wire33,
                 wire77,
                 wire157,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
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
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg34,
                 (1'h0)};
  assign wire4 = $unsigned($signed($unsigned(((wire1 != wire1) ?
                     (~|wire3) : (^~wire1)))));
  assign wire5 = (8'hb0);
  always
    @(posedge clk) begin
      reg6 <= {({({wire2} * wire4[(3'h5):(2'h2)]),
              wire4[(3'h7):(1'h0)]} ~^ wire0)};
      reg7 <= (~^wire3);
      if ($unsigned((^$signed(((^~reg6) ?
          (wire2 <= reg7) : $unsigned((7'h42)))))))
        begin
          reg8 <= (|wire5);
          reg9 <= (wire0[(1'h0):(1'h0)] ^~ $unsigned(wire5[(1'h0):(1'h0)]));
          reg10 <= wire2[(1'h1):(1'h0)];
          reg11 <= ((reg7[(3'h6):(1'h1)] >= (({reg8, reg6} < ((8'ha8) ?
                  wire5 : wire2)) - (-wire3[(3'h5):(2'h2)]))) ?
              wire1[(3'h5):(1'h0)] : $signed(wire3));
          reg12 <= wire3[(4'h9):(3'h4)];
        end
      else
        begin
          reg8 <= {$unsigned((&(wire3 - $unsigned(wire1)))),
              $signed((wire1 ?
                  ((wire4 ^~ wire1) ?
                      $unsigned(wire2) : $unsigned(wire5)) : (((8'hbd) || wire0) ?
                      $unsigned(wire4) : reg9[(4'ha):(1'h0)])))};
          reg9 <= $unsigned((wire2 ^~ ($unsigned(reg8) <= ((wire2 != reg9) ?
              $unsigned(wire0) : reg12))));
        end
      reg13 <= reg12;
      reg14 <= (-$unsigned($signed($signed(wire0))));
    end
  assign wire15 = wire5[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= wire2;
      reg17 <= {reg7,
          $signed((wire2[(3'h4):(1'h1)] - $signed((reg11 ? reg11 : reg8))))};
      if ($signed({$unsigned($unsigned((~wire3))), reg6}))
        begin
          reg18 <= reg12;
          if ($unsigned((wire3 ?
              reg18[(3'h4):(1'h1)] : $unsigned($unsigned((~reg9))))))
            begin
              reg19 <= ((-$unsigned(($unsigned(reg11) ?
                      $unsigned(wire3) : reg11))) ?
                  (({$unsigned(wire4)} < wire3) == $signed((~&(wire15 != reg14)))) : wire3[(4'he):(2'h3)]);
              reg20 <= (~^{(wire1[(4'h8):(3'h7)] ?
                      ($unsigned(reg19) ?
                          $unsigned(wire0) : $signed(reg18)) : reg10[(2'h3):(2'h2)]),
                  ({(^~wire5)} >> ((wire3 ? reg12 : reg6) ?
                      (&reg9) : (+wire2)))});
              reg21 <= (&$unsigned((~$signed((~|reg19)))));
              reg22 <= reg18;
              reg23 <= ((((wire1 ? reg6 : $signed(reg10)) ?
                      {$unsigned(reg6)} : reg9) >>> (~&(reg6 << (!wire15)))) ?
                  $signed(reg19) : $unsigned((+$unsigned(reg6))));
            end
          else
            begin
              reg19 <= ((($signed((wire1 ? (8'hb2) : wire0)) ?
                  wire5[(4'ha):(4'ha)] : (!(wire15 & (8'hba)))) ^ (reg23 ?
                  ((~reg16) ~^ $signed(reg6)) : (reg22[(3'h6):(2'h2)] ?
                      (reg22 ? reg6 : reg14) : reg10[(2'h3):(2'h3)]))) < reg14);
              reg20 <= reg8;
            end
        end
      else
        begin
          reg18 <= $unsigned({{{$signed(wire3)},
                  $unsigned($unsigned(wire15))}});
        end
      reg24 <= reg17;
      if (wire4)
        begin
          reg25 <= (^~$signed(reg16));
          if ($unsigned($unsigned(wire1)))
            begin
              reg26 <= {(+$unsigned($signed((reg16 ~^ wire1)))), reg8};
              reg27 <= reg19[(4'he):(3'h6)];
              reg28 <= (~^reg13[(2'h3):(1'h1)]);
              reg29 <= $signed(wire15);
            end
          else
            begin
              reg26 <= (wire5[(4'hd):(4'hc)] ? (&(!(^~reg24))) : wire4);
              reg27 <= ({$signed(wire5),
                      (~($unsigned(reg19) ?
                          reg12[(1'h0):(1'h0)] : $signed(wire5)))} ?
                  $unsigned($signed((reg8 ?
                      (-(8'hb2)) : reg14[(4'h8):(1'h0)]))) : reg8);
              reg28 <= reg28;
              reg29 <= {$signed({reg21[(1'h1):(1'h1)]})};
            end
        end
      else
        begin
          reg25 <= (^(!(+reg6[(4'hc):(4'h8)])));
          if (wire5[(2'h3):(1'h1)])
            begin
              reg26 <= reg25;
            end
          else
            begin
              reg26 <= ((reg26 >> reg24[(3'h7):(1'h1)]) | reg20);
            end
          if ($signed((-(^~$unsigned((~|wire0))))))
            begin
              reg27 <= (((8'h9c) << (~($unsigned(wire0) ?
                      $signed(reg13) : (reg26 ? reg17 : reg19)))) ?
                  $signed(wire3[(5'h12):(1'h1)]) : ({wire4, reg23} ?
                      ($unsigned($signed(wire4)) ?
                          wire3[(4'he):(3'h6)] : ((~^wire1) ?
                              {reg13,
                                  reg18} : $signed(reg25))) : {wire0[(1'h1):(1'h1)]}));
              reg28 <= $unsigned($unsigned((^(|(reg25 ? reg22 : reg16)))));
              reg29 <= $unsigned(reg21);
              reg30 <= reg19[(4'ha):(4'ha)];
            end
          else
            begin
              reg27 <= ((~^wire3) ?
                  reg26[(4'ha):(4'h9)] : $signed($unsigned({reg29[(5'h10):(4'hd)]})));
            end
          reg31 <= {reg29[(4'he):(2'h3)]};
        end
    end
  assign wire32 = reg22[(4'hc):(4'hb)];
  assign wire33 = (reg16[(1'h0):(1'h0)] ?
                      (|(({reg28} >= $unsigned(reg23)) ?
                          ((reg9 <= (8'h9d)) + ((8'haa) | reg22)) : reg10[(2'h3):(1'h0)])) : reg7);
  always
    @(posedge clk) begin
      reg34 <= $unsigned((^~reg31));
    end
  module35 #() modinst78 (.wire40(reg17), .wire39(reg19), .wire36(reg11), .wire38(reg27), .clk(clk), .wire37(reg9), .y(wire77));
  module79 #() modinst158 (.wire82(reg8), .clk(clk), .wire83(reg12), .wire84(wire0), .y(wire157), .wire81(wire3), .wire80(wire77));
  assign wire159 = ((^~reg20) ?
                       wire33 : ($unsigned(($signed(wire32) ?
                               (reg22 ^ reg16) : (reg17 ? reg12 : reg7))) ?
                           $signed(reg11) : reg29[(4'h9):(2'h2)]));
  assign wire160 = (~^reg14);
  assign wire161 = ((~|($unsigned({reg11}) ?
                           ($signed(reg9) ?
                               (~&reg12) : (reg21 ?
                                   (8'hb0) : reg7)) : $signed(wire15))) ?
                       $signed(((&(reg11 >>> reg31)) <= wire77)) : (((~(8'h9f)) > ({reg12,
                           wire77} <= reg9)) >> reg20[(3'h4):(1'h1)]));
  assign wire162 = {((wire77[(5'h10):(4'ha)] >= $signed(reg16[(4'h8):(2'h3)])) ?
                           $signed((!wire32[(2'h2):(1'h0)])) : $unsigned($unsigned({(8'ha6)})))};
  assign wire163 = (+wire157[(2'h2):(2'h2)]);
  assign wire164 = $signed((wire157[(2'h2):(1'h0)] ?
                       (!$signed((8'ha9))) : $unsigned(wire161[(2'h2):(1'h0)])));
  assign wire165 = reg11[(4'h8):(3'h4)];
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'h25f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire84;
  input wire [(4'h9):(1'h0)] wire83;
  input wire signed [(4'h9):(1'h0)] wire82;
  input wire signed [(3'h7):(1'h0)] wire81;
  input wire signed [(5'h10):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire137;
  wire signed [(4'h9):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire101;
  wire [(4'h8):(1'h0)] wire100;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire85;
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  reg [(3'h4):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire137,
                 wire135,
                 wire116,
                 wire115,
                 wire101,
                 wire100,
                 wire99,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
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
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire85 = ($signed((wire83[(3'h7):(1'h1)] ?
                      $signed(((7'h42) + wire84)) : $unsigned($unsigned(wire84)))) ~^ (wire82 == $signed((-wire84))));
  assign wire86 = ({$signed(((^~wire81) != ((8'hbc) ? wire81 : wire84))),
                          (wire81 | ((wire80 ^ wire84) | ((8'ha6) ?
                              wire84 : wire82)))} ?
                      $unsigned($signed($signed($unsigned(wire81)))) : wire84[(3'h7):(3'h7)]);
  assign wire87 = (8'ha6);
  assign wire88 = (|(!(^~(!(wire81 != wire85)))));
  assign wire89 = ($signed({wire87, wire82}) ?
                      ($unsigned(($unsigned(wire81) ?
                          wire86 : (-wire85))) || ({(wire87 ? wire84 : wire81),
                          $unsigned(wire81)} ^~ $signed($signed(wire88)))) : wire83[(4'h9):(3'h5)]);
  always
    @(posedge clk) begin
      if (wire84)
        begin
          reg90 <= ((^~$unsigned((~^(wire85 ? wire87 : wire87)))) ?
              {((wire89[(2'h2):(1'h1)] ?
                          wire87[(4'hc):(4'hb)] : (wire80 == wire83)) ?
                      (~|wire83) : wire89)} : (8'haf));
          reg91 <= ((wire86 & {{((8'ha5) | wire87)},
              $unsigned({reg90, wire89})}) || (wire85[(4'hb):(4'ha)] ?
              ((8'hab) ?
                  ($unsigned((8'hb9)) - wire81[(2'h3):(2'h3)]) : ((~&wire83) != wire85[(3'h5):(1'h0)])) : wire83[(1'h0):(1'h0)]));
          if (wire88[(2'h2):(1'h1)])
            begin
              reg92 <= $unsigned($signed(($signed((wire88 ?
                  wire89 : wire81)) <<< {wire88[(2'h3):(2'h2)],
                  $signed(wire85)})));
              reg93 <= $unsigned(((wire80 << wire82) ?
                  reg91 : wire86[(3'h6):(1'h1)]));
            end
          else
            begin
              reg92 <= ((($signed($unsigned(reg90)) ?
                  (~&(wire85 ?
                      wire81 : wire82)) : wire81[(2'h2):(1'h1)]) | (^~reg90[(2'h2):(2'h2)])) + wire83);
            end
          reg94 <= (8'hba);
          if ($signed(({(^wire84),
              ($signed(reg91) ?
                  (+wire81) : (wire80 ?
                      wire84 : reg93))} <<< ((|$unsigned(wire80)) && $unsigned({wire84})))))
            begin
              reg95 <= ($signed(({(|reg92),
                      reg90[(1'h0):(1'h0)]} + ($signed(reg90) | wire83))) ?
                  ((reg93 ?
                      wire88 : (wire83 ?
                          {wire86, (8'hb3)} : {wire85})) + ($unsigned(((8'h9e) ?
                      wire84 : wire85)) ^~ ($signed(wire86) > $signed(reg90)))) : $signed($unsigned($unsigned((&wire86)))));
              reg96 <= (~((~&wire82[(2'h3):(1'h1)]) <= $unsigned(reg93)));
            end
          else
            begin
              reg95 <= (((|wire89[(1'h1):(1'h0)]) ?
                  (^~(^~$signed(wire80))) : (^(((8'ha6) | reg92) ?
                      (~&reg91) : reg92))) != (((!(reg95 << wire85)) ?
                      (|((8'hb5) ? reg93 : wire82)) : ({reg91, wire83} ?
                          (-reg95) : {reg94})) ?
                  (-reg96) : ($signed(wire82) ?
                      $unsigned($unsigned((8'hbb))) : (~$unsigned((8'hb0))))));
              reg96 <= (((wire80[(4'ha):(3'h6)] ?
                      wire88[(3'h4):(1'h1)] : $signed((wire80 ?
                          reg96 : wire85))) <= (8'hbb)) ?
                  $unsigned(wire86) : $signed(($unsigned(wire80[(5'h10):(3'h5)]) == (~|((8'ha8) ?
                      wire83 : reg93)))));
              reg97 <= $signed(wire81);
            end
        end
      else
        begin
          reg90 <= $unsigned((^~(|reg91)));
          reg91 <= reg96[(2'h3):(1'h0)];
          reg92 <= (~&$signed($signed(reg96[(1'h1):(1'h1)])));
        end
      reg98 <= (!($signed((wire87[(3'h6):(2'h3)] ?
              ((8'had) << wire80) : reg92)) ?
          reg93[(2'h2):(2'h2)] : ($unsigned((+(8'ha8))) ?
              wire82 : ((8'hb7) ? $signed(wire86) : $signed((8'ha0))))));
    end
  assign wire99 = $signed({((&$signed((8'hb6))) ?
                          wire84[(3'h6):(1'h0)] : $signed((wire86 <= wire85)))});
  assign wire100 = $signed(reg94[(4'he):(4'he)]);
  assign wire101 = ($unsigned($unsigned((|$signed(reg96)))) ?
                       {wire88,
                           $unsigned(wire99)} : $signed(($unsigned((wire86 ?
                               wire87 : (7'h42))) ?
                           (8'hbb) : ((~^reg98) <= $unsigned(wire80)))));
  always
    @(posedge clk) begin
      if ((((wire89[(4'h8):(1'h1)] ?
                  $unsigned({reg92}) : reg94[(3'h7):(1'h0)]) ?
              (^$signed($unsigned(reg94))) : wire84[(3'h5):(3'h5)]) ?
          $unsigned($unsigned({reg90[(1'h1):(1'h0)],
              (~|reg97)})) : $unsigned(wire84[(3'h6):(2'h3)])))
        begin
          reg102 <= $unsigned($signed($unsigned($unsigned(((8'hb9) && reg90)))));
          reg103 <= (8'hb9);
          if ((~reg90[(2'h2):(2'h2)]))
            begin
              reg104 <= ($unsigned(wire80) ?
                  $signed(reg98[(4'h9):(3'h7)]) : reg96[(2'h3):(2'h3)]);
              reg105 <= {(^((&(^~reg91)) < (wire99[(2'h3):(1'h0)] >= (reg97 ?
                      reg97 : reg92))))};
              reg106 <= (8'ha2);
              reg107 <= $unsigned((((~&((8'had) ^~ reg105)) ?
                  (wire83[(3'h5):(2'h3)] ?
                      reg92 : {(7'h41), reg105}) : wire83) != wire87));
            end
          else
            begin
              reg104 <= ((reg103 << ($signed((!(8'hb5))) * (reg103[(1'h0):(1'h0)] && $signed((7'h40))))) == (-$signed({(reg94 <<< reg105),
                  (reg102 ? reg92 : (8'hae))})));
              reg105 <= ((reg92[(1'h0):(1'h0)] + $unsigned(reg105)) > $unsigned(($signed(reg93[(3'h6):(1'h1)]) * ((reg96 >>> reg98) ?
                  wire99[(1'h1):(1'h1)] : (~|(8'hb7))))));
              reg106 <= (~$signed(wire80));
              reg107 <= ((|($unsigned(wire83[(3'h5):(2'h3)]) ?
                  (((8'ha9) ? reg91 : wire87) ?
                      (wire81 << reg96) : (8'h9e)) : ((reg92 + reg106) ?
                      reg96[(1'h1):(1'h1)] : (reg96 ?
                          wire84 : wire87)))) ^ wire89[(4'h9):(4'h9)]);
            end
          if ($unsigned($signed($unsigned(($unsigned(wire86) ?
              {reg93} : (wire100 >= wire81))))))
            begin
              reg108 <= $unsigned({$unsigned(wire86[(3'h6):(1'h0)]), (8'haf)});
            end
          else
            begin
              reg108 <= wire101;
              reg109 <= wire86[(5'h14):(5'h13)];
              reg110 <= $unsigned({reg90[(1'h0):(1'h0)]});
            end
          reg111 <= reg110[(4'he):(3'h6)];
        end
      else
        begin
          reg102 <= (^((({(8'hb0),
              reg90} == wire86) == reg107[(4'hb):(4'h8)]) >>> {($signed(wire85) > $signed(reg97))}));
          reg103 <= {((~wire85[(4'ha):(2'h2)]) >>> reg103),
              $signed(($unsigned($signed(wire83)) ?
                  reg110[(4'h8):(3'h6)] : reg109))};
          reg104 <= reg91[(3'h5):(1'h1)];
          reg105 <= $unsigned((8'hbc));
          reg106 <= reg98;
        end
      reg112 <= wire81[(3'h7):(3'h5)];
      reg113 <= ($signed(((8'hae) ?
              (((8'ha2) + reg110) ?
                  $unsigned(reg103) : (reg93 & reg107)) : $unsigned($signed(wire83)))) ?
          reg91[(2'h3):(1'h1)] : wire87[(4'hc):(2'h3)]);
      reg114 <= ($unsigned(reg98[(2'h3):(1'h1)]) ?
          reg90 : $unsigned({wire83[(2'h2):(1'h0)]}));
    end
  assign wire115 = (wire99[(1'h1):(1'h0)] ?
                       $unsigned(wire80[(4'hc):(4'h8)]) : wire101);
  assign wire116 = {(!$signed({(|reg106)}))};
  module117 #() modinst136 (.y(wire135), .wire121(reg113), .wire120(wire99), .wire119(reg111), .wire118(wire82), .clk(clk));
  assign wire137 = ($unsigned(wire135[(3'h6):(1'h1)]) ? wire82 : (8'ha3));
  always
    @(posedge clk) begin
      if (((-(((|reg91) ?
          wire83 : reg103[(4'hf):(4'hc)]) >>> wire81)) << reg114))
        begin
          reg138 <= {wire86};
          reg139 <= $unsigned(reg96);
          reg140 <= wire137[(1'h1):(1'h1)];
          if ((($unsigned($unsigned(reg97[(2'h3):(1'h1)])) ?
              (reg103 ?
                  $unsigned((wire88 < (8'hbe))) : ((reg108 ?
                          (8'hbb) : (8'hb5)) ?
                      $unsigned(wire137) : (reg105 >>> reg105))) : $signed($signed(reg113))) - ($unsigned((reg105[(2'h3):(1'h1)] && (reg98 - reg139))) == $signed($signed((reg104 ?
              wire99 : (7'h44)))))))
            begin
              reg141 <= $signed(wire84[(1'h0):(1'h0)]);
              reg142 <= $unsigned((~^{$signed($signed(wire83)),
                  (reg90 ~^ (~|reg94))}));
              reg143 <= $signed($unsigned(reg141));
              reg144 <= reg114[(3'h4):(1'h0)];
            end
          else
            begin
              reg141 <= ((reg93 ?
                  reg94[(3'h5):(3'h4)] : (&reg138[(4'hb):(4'hb)])) > reg138[(3'h5):(2'h2)]);
              reg142 <= {wire137,
                  $signed(($unsigned($signed((7'h43))) ?
                      ($signed(wire115) - reg114[(2'h3):(1'h1)]) : reg105[(3'h7):(3'h5)]))};
              reg143 <= wire82;
              reg144 <= (8'ha3);
              reg145 <= (+wire86[(5'h12):(1'h0)]);
            end
        end
      else
        begin
          if ((~reg106))
            begin
              reg138 <= {reg103};
              reg139 <= ($signed($signed(reg107[(3'h4):(2'h3)])) ?
                  $unsigned((^reg98)) : (+($unsigned(reg104) ^~ $signed((wire81 & (8'hb9))))));
              reg140 <= ($signed($signed(((^~reg96) && (reg114 * wire89)))) > reg105);
              reg141 <= $unsigned(($unsigned(((reg106 & reg104) ?
                  wire101 : reg94[(5'h15):(4'ha)])) - ((((8'hbe) ?
                      wire84 : wire89) >>> $signed(reg143)) ?
                  (reg98[(3'h7):(1'h1)] == (reg93 || (8'haf))) : (8'hbc))));
            end
          else
            begin
              reg138 <= ((+{(wire100[(3'h6):(3'h5)] ?
                          (wire84 ? (8'hba) : reg108) : $signed(wire86)),
                      $signed($unsigned(reg142))}) ?
                  wire87 : reg141[(2'h2):(2'h2)]);
            end
          reg142 <= (reg140 ?
              (~&reg113[(3'h7):(3'h7)]) : ($signed((&(reg139 * (8'ha5)))) + reg139));
          reg143 <= $unsigned($unsigned((wire81[(2'h3):(1'h0)] | reg94)));
        end
      if ($unsigned($signed(($signed((reg93 >> reg108)) && (8'ha7)))))
        begin
          if ($signed((7'h41)))
            begin
              reg146 <= $unsigned((($signed(((8'ha8) <<< wire99)) ?
                      reg107 : reg107[(4'hf):(4'hc)]) ?
                  (&$signed((|reg140))) : ($signed(reg110) ?
                      (~&(~|wire80)) : ({reg139} ?
                          $unsigned(reg114) : reg105))));
              reg147 <= {($unsigned((reg92[(1'h0):(1'h0)] < ((8'h9c) ?
                          reg111 : reg143))) ?
                      $signed((8'hbc)) : {reg112[(4'h8):(3'h6)],
                          $signed(reg97)})};
              reg148 <= ($unsigned($signed((8'hba))) <= reg141);
              reg149 <= $signed(($signed({$signed(reg110)}) * reg143[(1'h1):(1'h1)]));
            end
          else
            begin
              reg146 <= {reg149,
                  (^(($unsigned(reg109) >= (~^reg103)) == $unsigned({wire83,
                      reg103})))};
              reg147 <= reg94[(5'h10):(4'ha)];
              reg148 <= {reg98[(3'h4):(3'h4)]};
              reg149 <= (~|$signed($signed(($unsigned((8'ha5)) >>> reg96))));
              reg150 <= (+wire82);
            end
          if (($unsigned((reg106[(5'h14):(3'h6)] * reg140[(2'h2):(1'h1)])) >>> $signed(reg143)))
            begin
              reg151 <= $unsigned(reg113);
              reg152 <= $signed(reg143);
              reg153 <= $unsigned((reg112 > (-((!reg147) ?
                  (reg149 ? reg109 : reg147) : {wire89, reg113}))));
            end
          else
            begin
              reg151 <= reg97;
              reg152 <= reg151[(4'h8):(1'h0)];
              reg153 <= wire82;
            end
        end
      else
        begin
          reg146 <= (((($unsigned(reg103) ?
                  reg90 : reg102[(1'h0):(1'h0)]) & ($unsigned((8'haa)) ?
                  $signed(reg94) : (wire100 <= (8'h9f)))) ?
              wire135[(4'h9):(2'h2)] : reg107) <<< reg98[(4'hb):(4'h9)]);
          if (((($unsigned($unsigned((7'h44))) != $signed(wire81)) << $signed(($signed(reg103) ?
                  (8'hac) : $unsigned(reg91)))) ?
              reg114[(3'h5):(1'h1)] : wire89))
            begin
              reg147 <= (reg92[(1'h1):(1'h1)] ?
                  wire88[(2'h3):(2'h2)] : $unsigned(reg146[(1'h1):(1'h0)]));
            end
          else
            begin
              reg147 <= $signed($signed((~|{$unsigned(reg147)})));
              reg148 <= $signed($unsigned(reg95[(4'h8):(1'h1)]));
              reg149 <= reg143[(2'h3):(1'h0)];
            end
        end
    end
  assign wire154 = (reg149 != reg142);
  assign wire155 = (reg112[(3'h7):(2'h2)] ?
                       $unsigned((reg139 >> $signed($signed(reg91)))) : ($unsigned(reg109) ?
                           ($signed({reg139,
                               reg94}) >> ((|wire81) >= wire99)) : {(~|(reg113 || reg111)),
                               $unsigned(((8'hb4) ? reg102 : reg147))}));
  assign wire156 = (reg151 << $signed((~reg109[(4'ha):(4'h8)])));
endmodule

module module35
#(parameter param76 = {(|((&(|(8'hac))) - (-((8'hb3) << (8'ha9)))))})
(y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire71;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire71,
                 (1'h0)};
  assign wire41 = (|(+{wire36[(1'h1):(1'h1)],
                      ($unsigned(wire39) ?
                          $unsigned(wire37) : $signed((8'h9e)))}));
  assign wire42 = $unsigned((($signed((8'hb9)) ?
                      wire38 : wire36) - ((8'ha6) <= ($signed(wire36) << (wire39 & wire37)))));
  assign wire43 = {$signed((8'h9f)), wire37};
  assign wire44 = (8'hb7);
  module45 #() modinst72 (wire71, clk, wire37, wire42, wire44, wire41, wire43);
  assign wire73 = wire43;
  assign wire74 = $unsigned(((wire44[(4'h8):(3'h5)] < wire44[(3'h4):(1'h0)]) ?
                      wire41 : ({wire41[(4'he):(2'h2)], wire42} >> wire43)));
  assign wire75 = (8'ha7);
endmodule

module module45
#(parameter param70 = (~((8'haa) ? (((8'h9e) > ((8'hb1) ? (8'hac) : (8'hbb))) ? ({(7'h44)} ~^ ((8'ha3) ? (8'h9d) : (7'h43))) : ({(8'hba)} != {(8'hb0), (7'h41)})) : {{((8'hb4) || (8'ha5))}, (((8'ha7) ? (8'h9e) : (8'ha7)) + ((7'h44) ? (8'hbe) : (8'hbf)))})))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire50;
  input wire signed [(3'h5):(1'h0)] wire49;
  input wire signed [(4'hb):(1'h0)] wire48;
  input wire signed [(5'h12):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h12):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg69,
                 reg68,
                 reg67,
                 reg63,
                 reg56,
                 (1'h0)};
  assign wire51 = wire49;
  assign wire52 = $unsigned(((~|(^(~^(7'h41)))) ?
                      (wire50 ?
                          $signed((wire50 ?
                              wire47 : wire49)) : $unsigned(wire48)) : $signed(wire47)));
  assign wire53 = $unsigned($signed(wire46[(3'h4):(2'h2)]));
  assign wire54 = ($signed(wire46) ?
                      $unsigned({$signed({wire50, wire47}),
                          (((8'ha7) <= wire50) ?
                              (^wire49) : (wire50 <<< wire52))}) : wire50[(2'h3):(2'h2)]);
  assign wire55 = $unsigned((wire49[(1'h1):(1'h1)] ?
                      wire46 : $unsigned(wire50[(3'h7):(2'h2)])));
  always
    @(posedge clk) begin
      reg56 <= $unsigned($signed(wire48[(4'h9):(3'h5)]));
    end
  assign wire57 = (((~|($signed((8'hb3)) ?
                          ((7'h41) << wire55) : {wire54, (8'ha0)})) ?
                      (^~$signed((wire49 ?
                          wire46 : wire55))) : wire52) - wire49);
  assign wire58 = wire54[(3'h4):(2'h2)];
  assign wire59 = wire58[(3'h7):(3'h6)];
  assign wire60 = ((~^(((wire47 ? (7'h42) : wire59) ?
                          wire50 : (wire54 ?
                              (8'hb2) : wire58)) <<< (wire50 >= (|(8'ha2))))) ?
                      wire54 : $signed(wire58));
  assign wire61 = ($unsigned(wire53[(1'h1):(1'h0)]) ?
                      $signed(wire58[(1'h1):(1'h0)]) : $unsigned((wire51[(2'h2):(2'h2)] ?
                          ($unsigned(wire53) ?
                              wire54[(3'h5):(3'h4)] : (wire54 - wire48)) : (wire48[(1'h0):(1'h0)] <<< $unsigned((8'ha9))))));
  assign wire62 = wire60[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      reg63 <= wire50;
    end
  assign wire64 = $signed(wire50);
  assign wire65 = {$unsigned((+$signed((reg63 > wire61))))};
  assign wire66 = wire59[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg67 <= $signed(({$unsigned($unsigned((8'h9e)))} ~^ ($signed((wire57 >= (8'hb4))) ?
          $signed($unsigned((8'h9d))) : (|((8'ha7) ? wire60 : wire53)))));
      reg68 <= $unsigned($unsigned($signed(wire52)));
      reg69 <= $signed(($unsigned(wire49[(1'h0):(1'h0)]) <<< $unsigned(reg68)));
    end
endmodule

module module117  (y, clk, wire121, wire120, wire119, wire118);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire121;
  input wire signed [(4'hf):(1'h0)] wire120;
  input wire [(5'h14):(1'h0)] wire119;
  input wire [(4'h9):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire134;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire signed [(4'ha):(1'h0)] wire131;
  wire [(4'ha):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire122;
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 (1'h0)};
  assign wire122 = {$signed($unsigned($signed(wire121)))};
  assign wire123 = wire120;
  assign wire124 = (^~$unsigned($unsigned((~|(~&wire121)))));
  assign wire125 = (wire119 ^~ wire122[(2'h3):(1'h0)]);
  assign wire126 = (^~{($unsigned($unsigned((8'hac))) ?
                           (8'hbb) : $unsigned({wire119})),
                       (8'hba)});
  assign wire127 = wire122[(4'ha):(4'ha)];
  assign wire128 = $signed($unsigned((~^$signed($unsigned((8'hb9))))));
  assign wire129 = $unsigned($unsigned((({wire119} >> wire118[(2'h2):(2'h2)]) ?
                       wire123 : (~|wire118[(3'h4):(3'h4)]))));
  assign wire130 = $unsigned((($signed($signed(wire120)) + wire122) + (~&wire129)));
  assign wire131 = ($unsigned($signed((-wire121))) ?
                       wire126[(1'h1):(1'h1)] : ({wire119[(4'hd):(4'hd)]} ?
                           $signed((wire128[(3'h6):(1'h1)] ?
                               $signed(wire122) : {wire125,
                                   wire118})) : {(8'h9e), wire128}));
  assign wire132 = (^(!(wire128 - wire128)));
  assign wire133 = (~|($signed(wire127[(1'h1):(1'h0)]) << $signed(($signed(wire125) << ((8'hb8) ?
                       (8'haa) : wire120)))));
  assign wire134 = (8'ha6);
endmodule
