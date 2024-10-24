module top
#(parameter param142 = (+(~{(((8'hbc) << (8'h9d)) ? ((7'h44) ? (8'hb1) : (8'hb6)) : (&(8'hbc)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h288):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire [(4'h8):(1'h0)] wire128;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire [(5'h13):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire [(4'he):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire90;
  wire [(4'he):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire118;
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'hb):(1'h0)] reg140 = (1'h0);
  reg [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'hc):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire4,
                 wire5,
                 wire6,
                 wire25,
                 wire90,
                 wire92,
                 wire93,
                 wire118,
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
                 reg127,
                 reg126,
                 reg125,
                 reg124,
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
                 (1'h0)};
  assign wire4 = (wire3[(1'h1):(1'h1)] ?
                     wire3 : ($signed(wire1[(3'h4):(1'h1)]) ?
                         wire3 : $signed(wire2)));
  assign wire5 = wire1[(4'hd):(4'h8)];
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      if ((((~^wire4[(1'h0):(1'h0)]) ?
          wire1[(2'h3):(1'h0)] : ({$signed(wire6)} ?
              (8'h9f) : {(8'hb3),
                  $unsigned(wire1)})) & $unsigned(wire6[(2'h3):(2'h3)])))
        begin
          reg7 <= wire2[(2'h3):(1'h1)];
          reg8 <= {(((~wire0[(3'h5):(3'h5)]) >= reg7) & (^~$signed(wire0[(2'h3):(1'h0)]))),
              ($signed({reg7}) + {wire0[(2'h2):(1'h0)], wire0})};
          reg9 <= $unsigned((8'hb8));
          reg10 <= reg7[(5'h13):(5'h10)];
          reg11 <= $signed($signed(wire4));
        end
      else
        begin
          if (($unsigned($unsigned($signed((~^wire3)))) ?
              (((~&(reg7 ? wire5 : wire3)) ?
                      $signed((wire0 >> wire0)) : {{(8'hb9), wire2}}) ?
                  ((^~(reg10 && reg7)) <<< $signed($signed(wire6))) : ($unsigned($unsigned((8'h9e))) ?
                      $signed((wire5 ?
                          wire5 : reg8)) : $unsigned((~^wire3)))) : reg7[(1'h1):(1'h1)]))
            begin
              reg7 <= $unsigned($signed(wire0));
              reg8 <= $signed(((($signed(reg7) >>> {reg10,
                  (8'hba)}) & wire1[(1'h1):(1'h1)]) <<< $signed(((wire6 << (8'ha1)) ?
                  (reg8 ? wire5 : wire4) : (reg9 > wire1)))));
              reg9 <= (&($unsigned(wire0[(3'h4):(2'h2)]) ?
                  {$unsigned(wire0)} : (8'ha1)));
              reg10 <= wire5[(1'h0):(1'h0)];
            end
          else
            begin
              reg7 <= wire1[(1'h1):(1'h0)];
              reg8 <= $signed({wire2[(3'h5):(3'h5)]});
              reg9 <= wire4;
              reg10 <= $signed((-(+$unsigned(reg8))));
              reg11 <= $unsigned($unsigned($unsigned(((^~reg10) << wire0))));
            end
          if ((((({wire6, wire2} ? (-reg11) : wire6[(3'h7):(2'h3)]) ?
              {(reg11 ^~ wire3),
                  (|reg11)} : (^~wire4[(1'h1):(1'h1)])) ~^ ($unsigned(wire6) ?
              $signed((wire1 ? wire2 : reg11)) : (reg8 ?
                  {wire0} : {(8'hbe), (8'h9d)}))) <<< (-$signed((reg8 ?
              reg9 : wire1)))))
            begin
              reg12 <= ((7'h41) > $unsigned((!(reg11 ?
                  $signed(reg11) : ((8'hb8) ~^ wire3)))));
              reg13 <= {$signed($signed(($unsigned(reg8) | $unsigned(reg10))))};
              reg14 <= (+($signed(((reg13 && reg10) ?
                  (wire4 * reg11) : $signed(wire6))) <<< (^(~&$signed(wire6)))));
              reg15 <= reg10[(4'hb):(3'h6)];
              reg16 <= {(((!(wire0 | (8'hba))) | ($signed(reg11) ?
                      {wire1} : $signed(wire4))) >>> (reg7 ?
                      {(8'hb3), (^~(8'h9c))} : wire0[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg12 <= reg9[(4'hb):(2'h3)];
            end
        end
      reg17 <= (8'hb2);
      reg18 <= {{wire2},
          ((($unsigned(wire3) ? reg11 : $signed(wire5)) ?
              {reg11[(3'h5):(1'h0)],
                  (^~(8'hb0))} : reg15[(1'h1):(1'h0)]) != (~^{(8'hb9), reg9}))};
      reg19 <= wire5;
      if (reg13[(2'h2):(1'h0)])
        begin
          reg20 <= (reg12[(1'h0):(1'h0)] << (~^{(&$unsigned((8'ha5))), reg8}));
          reg21 <= $unsigned($unsigned($unsigned(((wire5 ?
              reg10 : reg12) <= reg20))));
          reg22 <= $unsigned((8'hb1));
          reg23 <= wire5;
          reg24 <= wire6[(3'h4):(2'h3)];
        end
      else
        begin
          reg20 <= $signed(wire3);
        end
    end
  assign wire25 = ($signed((-(!(reg8 + (8'hae))))) ?
                      (&(($unsigned(reg22) ? ((7'h42) > wire4) : (~^reg16)) ?
                          ($unsigned(reg23) && $signed((8'hbd))) : wire6[(2'h2):(1'h0)])) : (^~$signed(((^~reg14) < reg8))));
  module26 #() modinst91 (.clk(clk), .y(wire90), .wire27(wire4), .wire28(reg20), .wire31(wire2), .wire29(reg13), .wire30(reg23));
  assign wire92 = (-$unsigned(wire1[(2'h3):(2'h3)]));
  assign wire93 = (~&($unsigned($unsigned((reg16 ? reg12 : wire1))) ?
                      reg15[(3'h6):(3'h4)] : wire0));
  module94 #() modinst119 (wire118, clk, reg9, reg14, reg24, wire90);
  assign wire120 = reg10;
  assign wire121 = ($unsigned($signed($signed((-reg23)))) || {{{$signed((8'haa)),
                               $unsigned(wire92)}}});
  assign wire122 = {$unsigned($signed(wire4))};
  assign wire123 = reg18[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg124 <= reg22[(5'h13):(4'h9)];
      if ((wire5[(2'h2):(1'h1)] ?
          $unsigned(reg14) : $unsigned(((+(wire25 + wire121)) | $unsigned((wire93 && reg15))))))
        begin
          reg125 <= reg124[(3'h7):(3'h7)];
          reg126 <= reg16[(3'h6):(3'h5)];
          reg127 <= (reg22 ?
              (($unsigned({wire3}) | ((reg21 >= reg18) == reg11[(3'h5):(2'h3)])) & $signed((wire0[(3'h5):(3'h5)] < (reg125 ?
                  reg7 : reg16)))) : wire93[(1'h0):(1'h0)]);
        end
      else
        begin
          reg125 <= $unsigned((^{(reg9[(2'h2):(1'h1)] && (wire120 ?
                  reg17 : wire3))}));
          reg126 <= wire1;
        end
    end
  assign wire128 = wire4;
  assign wire129 = {(((|wire92) - (reg125 ?
                               wire121[(3'h6):(2'h2)] : ((8'haa) ?
                                   reg17 : wire92))) ?
                           $unsigned(({wire93,
                               reg124} - $signed(reg10))) : ($signed(reg22) ?
                               ((&wire118) != $unsigned(reg7)) : $signed($signed(reg24)))),
                       (reg23[(3'h7):(2'h2)] < ((reg10 ?
                           reg9[(3'h4):(1'h0)] : $signed(wire120)) >= reg126))};
  assign wire130 = {wire90,
                       ($signed(reg20) ?
                           $signed(reg11[(3'h5):(2'h2)]) : wire6)};
  always
    @(posedge clk) begin
      if (((reg10 || (!(8'hb5))) ?
          $unsigned($signed($unsigned(wire90[(2'h3):(2'h2)]))) : wire123[(5'h11):(1'h1)]))
        begin
          reg131 <= ($signed({($signed((8'hbd)) ? wire3 : $signed(reg11))}) ?
              reg15[(3'h6):(2'h2)] : ((-$unsigned({wire1,
                  wire90})) == {({reg126, reg19} ? (~wire1) : $signed(wire118)),
                  $signed($signed((8'h9c)))}));
          reg132 <= (($signed((^reg131)) ?
                  (-(-$unsigned(wire120))) : ($signed($unsigned(reg23)) + (wire128 << reg11))) ?
              {((reg8 >>> reg12) ~^ (8'hbd))} : ({($signed(reg18) ?
                      (reg15 >= reg17) : reg18[(2'h3):(1'h1)]),
                  ((reg8 ?
                      wire90 : wire3) < (reg127 << wire92))} == (+$signed($unsigned((8'hb7))))));
          reg133 <= $unsigned(reg131);
          reg134 <= (((~^({wire25, (8'hb0)} ?
                  reg132 : (wire3 ?
                      reg124 : reg23))) ^~ (($signed(reg14) + $signed(wire6)) ?
                  $unsigned((reg125 >> reg9)) : (~(wire6 - reg131)))) ?
              ((+(wire129 ? (~^wire118) : wire0)) <<< (wire118 ?
                  (reg19 > (reg125 ? wire93 : reg21)) : $unsigned((reg126 ?
                      reg12 : wire130)))) : {(((wire129 ?
                      wire90 : reg8) - (wire2 + reg126)) && ($unsigned(reg14) <<< $unsigned(reg20)))});
          reg135 <= wire90;
        end
      else
        begin
          reg131 <= (~$unsigned((wire0[(1'h1):(1'h0)] << (~$signed((8'h9d))))));
          reg132 <= reg127[(4'hd):(4'h9)];
          reg133 <= reg133;
          reg134 <= ($signed((wire129[(4'h9):(1'h0)] ?
                  reg15[(4'ha):(3'h5)] : reg24)) ?
              {((^~(~|wire93)) ? wire118[(3'h7):(3'h7)] : ((~^wire3) < wire0)),
                  ((!$signed(reg133)) ?
                      reg14 : $unsigned({reg124,
                          reg9}))} : ((&$unsigned((!(8'hb4)))) >> wire118[(3'h6):(2'h2)]));
        end
      reg136 <= ((((8'hbc) ^ $unsigned((^wire122))) - ({(wire120 & wire128)} - $unsigned((wire2 ?
          reg13 : (8'hab))))) <<< reg18);
      reg137 <= reg134[(3'h7):(3'h7)];
      reg138 <= $unsigned($signed((|reg7)));
      reg139 <= wire120;
    end
  always
    @(posedge clk) begin
      if ((!{wire121, $unsigned(reg17[(2'h2):(1'h0)])}))
        begin
          reg140 <= $signed((reg16[(4'hc):(4'h8)] ~^ (&$unsigned((reg24 - wire128)))));
        end
      else
        begin
          reg140 <= (~&({reg15[(4'ha):(4'h9)]} ^ reg135[(2'h2):(1'h0)]));
          reg141 <= (~($unsigned(reg11[(3'h4):(1'h0)]) ?
              $unsigned(wire2[(4'ha):(4'ha)]) : (((wire6 > (8'ha2)) ~^ ((8'ha8) > (8'hac))) ?
                  (~^reg140) : ($signed(reg9) == {wire129, reg132}))));
        end
    end
endmodule

module module94
#(parameter param116 = ((~^(!(((8'haa) ? (8'haf) : (7'h43)) >>> {(8'hba)}))) ~^ {(({(8'hba), (8'ha2)} ? (8'hae) : ((8'hb8) != (8'ha4))) - (((8'hb8) * (8'h9e)) && ((8'hb3) ? (7'h40) : (8'hb3))))}), 
parameter param117 = (7'h41))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire98;
  input wire signed [(5'h14):(1'h0)] wire97;
  input wire [(4'hb):(1'h0)] wire96;
  input wire [(5'h15):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire100,
                 wire99,
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
                 (1'h0)};
  assign wire99 = ($signed({(wire95[(5'h13):(5'h10)] * (wire97 && wire97))}) ^~ $signed({$unsigned(((8'hb1) ?
                          (7'h41) : wire98)),
                      wire98[(4'ha):(4'h9)]}));
  assign wire100 = {((~$unsigned((wire97 * wire97))) - $signed($unsigned({wire99,
                           wire98})))};
  always
    @(posedge clk) begin
      reg101 <= ((wire99[(3'h5):(1'h1)] + (+$signed($signed(wire99)))) ?
          (+wire100[(4'hb):(2'h3)]) : wire96[(3'h5):(1'h1)]);
      reg102 <= ((((^$unsigned(wire98)) ^ $unsigned((~&reg101))) ?
          $signed(($unsigned((8'hab)) ?
              reg101[(4'hf):(2'h3)] : (wire97 ?
                  reg101 : wire97))) : wire100) - {$unsigned(((-wire95) ?
              wire100[(4'h8):(3'h7)] : wire98[(3'h7):(3'h4)]))});
      reg103 <= wire100[(4'hc):(4'hc)];
      if (wire100)
        begin
          reg104 <= (^((($signed(wire95) ?
              $unsigned(wire97) : $signed((8'haf))) - $signed(reg101[(1'h0):(1'h0)])) <<< ($unsigned((~^wire96)) - $unsigned((wire95 ?
              wire95 : wire98)))));
          reg105 <= ((7'h41) ?
              ((+(wire97 || (reg104 ?
                  wire96 : wire99))) >> reg103[(3'h7):(3'h4)]) : {$unsigned({$unsigned(wire100)})});
          reg106 <= $unsigned(wire96[(4'h8):(4'h8)]);
          if (((reg103[(3'h4):(3'h4)] + reg102) << (((8'hb7) ?
                  $signed($unsigned(reg102)) : ((wire98 ? reg101 : (8'haf)) ?
                      $signed(wire98) : {wire95, reg103})) ?
              (reg103[(5'h13):(3'h4)] ?
                  $unsigned($signed((8'haf))) : $signed((reg106 || (8'h9e)))) : (wire98 != wire95))))
            begin
              reg107 <= ($unsigned($signed($signed($unsigned(wire97)))) >> ((((wire96 != wire95) ?
                  (wire95 ?
                      wire99 : reg101) : reg103[(2'h2):(2'h2)]) || ((reg101 | (8'hb2)) ?
                  $unsigned(reg103) : $unsigned(wire97))) - reg105[(1'h0):(1'h0)]));
              reg108 <= (^~((~^(reg105[(3'h4):(2'h2)] >= (reg104 ~^ reg106))) >>> (reg104[(3'h4):(1'h1)] <<< reg106)));
            end
          else
            begin
              reg107 <= $signed(({reg103} ?
                  (reg103 ?
                      (~{wire98, reg106}) : (reg101 ?
                          reg105 : wire100[(4'ha):(2'h2)])) : (reg103 ?
                      $unsigned((&(8'ha4))) : $signed((wire97 == (7'h42))))));
              reg108 <= $signed($unsigned((~reg106)));
              reg109 <= {(|reg107[(3'h5):(2'h3)]), (|wire98[(3'h7):(3'h7)])};
            end
          if ((~&$unsigned((~|$signed($signed(wire95))))))
            begin
              reg110 <= $unsigned($signed($unsigned($signed(wire99))));
              reg111 <= reg105;
              reg112 <= reg103[(4'ha):(3'h6)];
              reg113 <= $signed(wire98);
            end
          else
            begin
              reg110 <= wire97[(2'h2):(2'h2)];
              reg111 <= (^~reg105);
              reg112 <= $signed(wire100[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg104 <= $signed((($signed((wire97 ? wire97 : reg104)) ?
                  $signed((reg110 >>> wire100)) : (!reg112[(3'h4):(1'h0)])) ?
              $unsigned({$unsigned(wire100)}) : (reg110 ?
                  $unsigned($unsigned(reg102)) : ($unsigned(reg108) ^ ((8'hb7) >= wire95)))));
          if ((|((!$signed($unsigned(wire97))) ?
              ({reg111[(2'h3):(2'h2)], $signed(reg107)} ?
                  reg103[(2'h2):(2'h2)] : (^~reg108)) : reg113)))
            begin
              reg105 <= (&$unsigned($unsigned((reg112[(3'h6):(2'h2)] ?
                  (&(8'haf)) : reg108[(2'h2):(1'h1)]))));
              reg106 <= $unsigned(((~^$unsigned((reg110 <= wire95))) ?
                  reg107[(2'h3):(1'h0)] : (~$unsigned(reg102))));
            end
          else
            begin
              reg105 <= $signed({($signed((~reg112)) ?
                      $unsigned((|wire99)) : reg102[(4'hc):(3'h5)])});
            end
          reg107 <= ({wire98[(4'ha):(3'h4)]} >>> {wire97,
              $unsigned(wire96[(1'h1):(1'h0)])});
        end
    end
  assign wire114 = (((~|{$unsigned(wire96), $signed(reg102)}) ?
                           {wire97,
                               ($signed(wire97) ?
                                   $signed(reg112) : (8'hbd))} : $signed($unsigned({wire97,
                               reg112}))) ?
                       reg103 : (&reg109));
  assign wire115 = (^(|$signed(reg107[(4'h9):(3'h7)])));
endmodule

module module26
#(parameter param88 = (8'hb8), 
parameter param89 = ((!((~(param88 < param88)) ? (8'hbe) : ((|param88) ? (param88 ? (8'hac) : param88) : (-param88)))) ? {(((param88 && param88) >= (param88 ? param88 : param88)) ? ((param88 != param88) * {param88}) : (((8'hbb) ? (8'ha1) : param88) ? (param88 != param88) : (param88 ? param88 : param88)))} : {((-(param88 << param88)) ? param88 : (+param88)), ({(param88 ~^ param88)} < (^(param88 ? param88 : param88)))}))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(4'he):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  assign y = {wire87,
                 wire82,
                 wire37,
                 wire33,
                 wire32,
                 reg86,
                 reg85,
                 reg84,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = {((~(wire31[(5'h11):(4'hb)] << (wire28 >= wire29))) ^~ {$unsigned({wire31})})};
  assign wire33 = wire30[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg34 <= ($signed((($signed(wire29) ?
              (wire29 ?
                  wire33 : wire27) : $unsigned(wire33)) + ((~&wire27) >> $signed(wire28)))) ?
          $signed(($unsigned(wire33[(2'h3):(1'h1)]) ~^ ({(8'hb3),
              wire31} && $signed(wire31)))) : $unsigned($unsigned(((~^wire31) ?
              $unsigned((8'hac)) : wire30))));
      reg35 <= $signed(($unsigned(wire32[(1'h1):(1'h1)]) ?
          (~^reg34) : $signed(((wire29 << wire28) < (&(8'haf))))));
      reg36 <= $signed({$signed(reg34[(3'h5):(2'h2)])});
    end
  assign wire37 = $unsigned(reg34[(3'h6):(3'h6)]);
  module38 #() modinst83 (.wire40(wire29), .y(wire82), .wire41(wire31), .wire42(wire37), .clk(clk), .wire39(wire28));
  always
    @(posedge clk) begin
      reg84 <= ($signed($unsigned((wire27 <<< $unsigned(wire28)))) ?
          $signed($signed(((wire33 ? reg35 : reg34) ?
              (wire82 ?
                  reg35 : reg34) : $signed(wire37)))) : wire32[(1'h1):(1'h0)]);
      reg85 <= (8'hbb);
      reg86 <= wire32[(1'h1):(1'h1)];
    end
  assign wire87 = wire28[(3'h6):(2'h2)];
endmodule

module module38
#(parameter param80 = ({(({(8'h9c), (8'ha5)} ? ((8'hbe) || (8'hab)) : (-(8'hab))) & {((7'h42) ? (8'ha3) : (8'hbf))})} > {((((7'h44) ? (8'ha1) : (8'ha2)) >> (~|(8'hb1))) ? ((+(8'hb5)) ? ((8'hb9) ? (8'ha6) : (8'ha9)) : ((8'hb5) + (8'hb0))) : (8'ha6))}), 
parameter param81 = (^~param80))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire42;
  input wire signed [(3'h4):(1'h0)] wire41;
  input wire signed [(4'h8):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  assign y = {wire79,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 (1'h0)};
  assign wire43 = (^~((^wire42[(5'h12):(3'h7)]) ?
                      ({(wire41 ?
                              (8'haf) : wire40)} ^ wire41) : $unsigned(wire42)));
  assign wire44 = $signed(wire42);
  assign wire45 = (~(({$unsigned(wire42), $unsigned(wire44)} ?
                          $signed($signed(wire44)) : $signed(((8'hae) ?
                              wire43 : wire40))) ?
                      (wire42 ? (|{wire42}) : wire40) : wire40));
  assign wire46 = (^wire41);
  assign wire47 = ({wire41, wire44[(3'h4):(3'h4)]} ?
                      $signed((($unsigned(wire43) >= ((8'hb3) ?
                              wire43 : (8'hbf))) ?
                          ({wire46, (8'hbc)} ?
                              {(8'hbe), wire41} : (wire46 ?
                                  wire46 : (8'hbb))) : (~^$unsigned(wire39)))) : wire44);
  always
    @(posedge clk) begin
      reg48 <= (wire42[(5'h15):(3'h6)] & wire46);
      reg49 <= (~^((&$unsigned((reg48 ? wire42 : wire47))) ?
          $unsigned($unsigned(wire41[(1'h1):(1'h1)])) : $unsigned((8'haf))));
      reg50 <= {reg48[(5'h13):(4'hd)]};
    end
  always
    @(posedge clk) begin
      if (((!((~(wire42 ?
          (8'hbf) : wire44)) ^~ $signed({wire44}))) >= {(($signed(wire46) == wire39[(4'h9):(4'h9)]) ^~ $signed(wire46[(4'he):(4'h9)])),
          wire43[(5'h15):(3'h7)]}))
        begin
          reg51 <= wire42[(2'h2):(2'h2)];
          reg52 <= $signed(($signed({wire40,
              $unsigned(reg50)}) << (~^(~|reg48[(5'h12):(4'h9)]))));
          if (wire46[(4'hd):(3'h7)])
            begin
              reg53 <= wire44;
            end
          else
            begin
              reg53 <= $signed({(8'hb6)});
              reg54 <= wire39[(5'h10):(4'hc)];
              reg55 <= reg54;
              reg56 <= reg54[(3'h5):(3'h5)];
            end
          reg57 <= (reg56 <<< reg49[(2'h2):(2'h2)]);
          reg58 <= (((8'hb0) ?
                  reg49[(3'h6):(3'h4)] : (reg55 ?
                      (|(~&reg55)) : (~(^~wire45)))) ?
              wire39 : (reg54[(1'h0):(1'h0)] ?
                  (reg53 ^ ($unsigned(wire42) ~^ {(8'hbf),
                      reg50})) : $signed(((reg49 << reg51) ?
                      wire42 : reg50[(2'h3):(2'h2)]))));
        end
      else
        begin
          if ((^~$signed(wire45[(2'h3):(2'h2)])))
            begin
              reg51 <= reg56;
              reg52 <= reg48;
              reg53 <= {{((^~$unsigned(wire42)) ~^ wire47[(1'h1):(1'h1)])}};
              reg54 <= ((+(!(reg54[(1'h1):(1'h0)] & (wire46 ?
                      wire43 : wire42)))) ?
                  reg55[(2'h2):(2'h2)] : ($signed(reg58[(1'h1):(1'h1)]) ?
                      ((+((7'h44) <= wire40)) > ((wire42 + wire40) - reg48)) : $signed((+(+(8'haa))))));
              reg55 <= (~^($signed(wire47) ?
                  (({reg54, reg48} ? reg52 : {reg52}) ?
                      (!reg49[(2'h2):(1'h0)]) : $unsigned($signed(reg48))) : $unsigned({$signed(wire44)})));
            end
          else
            begin
              reg51 <= $unsigned($unsigned({$signed(wire44)}));
              reg52 <= (8'hba);
              reg53 <= $signed($signed(wire44));
              reg54 <= $signed({((~((8'ha9) << reg48)) != ((wire39 ?
                      reg53 : (8'hb6)) << (wire39 && (8'ha1)))),
                  (^~reg55)});
              reg55 <= $unsigned((~&$signed(((wire41 ? wire42 : reg50) ?
                  $signed(reg52) : reg53))));
            end
          reg56 <= $signed(wire45);
          reg57 <= $unsigned((8'hbb));
          reg58 <= $signed(wire42);
        end
      reg59 <= (((reg54 ?
          ((8'hb6) >= wire39[(4'ha):(3'h7)]) : reg54[(1'h0):(1'h0)]) + (-$signed((wire45 >>> wire43)))) * reg58);
    end
  assign wire60 = reg52[(3'h4):(1'h1)];
  assign wire61 = wire45[(3'h6):(1'h1)];
  assign wire62 = (8'ha5);
  assign wire63 = (reg50 ^ $signed(($signed(wire40[(4'h8):(3'h4)]) + ({wire45} * reg49[(3'h6):(2'h3)]))));
  assign wire64 = wire43;
  assign wire65 = wire61;
  assign wire66 = {((reg49[(4'ha):(3'h6)] ?
                          $signed($signed(wire45)) : (~|$unsigned(reg52))) >> (!reg59[(1'h0):(1'h0)])),
                      $signed((^((wire63 ? wire64 : reg51) ^ (^wire60))))};
  assign wire67 = wire41[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg68 <= {$signed($unsigned(wire41))};
      reg69 <= {reg59};
      reg70 <= (~(|(~^$unsigned(wire45[(4'h9):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      if (reg69[(4'h9):(3'h5)])
        begin
          reg71 <= $signed(reg51);
          reg72 <= $signed(((^$signed((reg52 && (8'ha8)))) ?
              $signed($unsigned((reg53 + reg48))) : {(reg55[(2'h3):(2'h3)] ?
                      $signed(wire65) : $unsigned(reg52)),
                  (~|reg49[(3'h4):(2'h2)])}));
          reg73 <= {reg71[(3'h7):(2'h2)], reg70};
        end
      else
        begin
          reg71 <= ($unsigned((($signed(wire43) >= {reg71}) | $signed(reg51[(2'h3):(2'h3)]))) ^~ $signed($unsigned(({reg51} && $signed((8'ha5))))));
          reg72 <= $signed((((((8'had) + reg68) ^ ((8'ha3) & wire66)) ?
                  {(&reg69), (reg56 ^ reg58)} : $signed((wire42 ?
                      reg53 : reg52))) ?
              reg68[(2'h3):(1'h0)] : {$unsigned($unsigned(wire39)),
                  (reg51[(2'h3):(2'h3)] ?
                      $signed(reg72) : (wire60 <<< reg54))}));
          reg73 <= reg69;
          reg74 <= ((8'hbf) <<< (wire41 ?
              $unsigned(reg69[(4'h8):(3'h7)]) : (~{reg54, (reg51 - reg73)})));
          reg75 <= (!(((wire45 ~^ (wire40 - (8'had))) ?
                  $signed(wire41[(3'h4):(2'h3)]) : (8'hab)) ?
              $unsigned(((^~(8'ha3)) ?
                  $unsigned((8'ha5)) : ((7'h44) ? wire43 : wire60))) : wire61));
        end
      reg76 <= reg72[(3'h5):(3'h4)];
      reg77 <= wire64[(1'h0):(1'h0)];
      reg78 <= wire41;
    end
  assign wire79 = $signed((~^reg57));
endmodule
