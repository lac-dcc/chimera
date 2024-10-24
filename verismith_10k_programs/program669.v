module top
#(parameter param164 = (({(~((8'hab) ? (7'h42) : (8'ha7)))} == ((((8'hb2) ? (7'h42) : (8'had)) ? {(8'ha4), (7'h40)} : (^(8'ha4))) + (&((7'h43) ? (8'haa) : (8'ha9))))) << (({((8'ha6) ? (8'ha1) : (7'h43)), (~(8'hab))} | (&(^(8'hb1)))) || ((((8'had) >> (8'ha2)) ? ((8'hb8) ? (8'hab) : (8'hb4)) : ((8'hb0) ? (8'hb7) : (8'ha1))) >= ({(8'hbd), (8'haa)} << (~^(8'hb4)))))), 
parameter param165 = ((((((7'h41) ? param164 : param164) ? {param164} : (8'hbf)) <= (~^((8'hae) ? param164 : param164))) ? param164 : (^((param164 ? param164 : param164) ~^ (param164 == param164)))) ? (param164 || (+((-param164) ? (param164 | param164) : {param164}))) : (&(8'hbd))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire [(5'h14):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire155;
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire20,
                 wire21,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire155,
                 reg163,
                 reg162,
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
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire3);
      reg5 <= ($unsigned(wire3[(1'h1):(1'h1)]) ?
          (+($signed($signed(wire2)) ^ wire0[(4'ha):(3'h5)])) : (^~{($unsigned(wire1) ?
                  reg4 : (wire0 ? wire3 : reg4)),
              (reg4[(4'h9):(3'h7)] != wire2[(1'h1):(1'h0)])}));
      reg6 <= $unsigned(((($signed(reg4) ^ {wire2}) > $signed($signed((8'ha9)))) ?
          {$signed($signed(reg4))} : (-(~$unsigned(wire0)))));
    end
  always
    @(posedge clk) begin
      if (((((~^wire2[(1'h1):(1'h1)]) <= $signed((reg5 ? wire0 : wire1))) ?
              ($unsigned((8'hbe)) ?
                  {(!reg6),
                      $unsigned(wire3)} : $signed(wire3[(1'h1):(1'h0)])) : {$unsigned((~&reg6))}) ?
          (|reg4[(1'h1):(1'h0)]) : reg6[(1'h1):(1'h0)]))
        begin
          reg7 <= (8'hac);
          reg8 <= ($unsigned(reg6[(3'h7):(2'h2)]) ?
              ({(~|$signed(reg4)), (|$unsigned(wire1))} ?
                  $signed(reg5[(2'h3):(1'h0)]) : (+(!(-wire1)))) : wire1[(3'h5):(3'h5)]);
          reg9 <= ((reg4[(4'h8):(3'h7)] * (reg6 ?
              (&$signed((8'ha3))) : reg7[(4'ha):(3'h5)])) != (8'ha6));
        end
      else
        begin
          if (((8'hb2) * reg6[(4'he):(4'hb)]))
            begin
              reg7 <= (((reg9[(2'h3):(2'h2)] ?
                      ({wire0, reg7} >= {reg5}) : wire0) ?
                  $signed(reg8) : $signed(wire0)) + reg9);
              reg8 <= reg5[(3'h4):(3'h4)];
              reg9 <= ((~|$unsigned((!$unsigned(reg9)))) >= reg5[(4'hf):(4'hf)]);
              reg10 <= {{$signed(reg5),
                      ((reg9 ?
                          $unsigned((8'ha8)) : $unsigned(reg8)) - $unsigned($signed((8'haa))))}};
            end
          else
            begin
              reg7 <= $unsigned($signed({(8'hab)}));
              reg8 <= (reg5 || reg5);
            end
          reg11 <= $unsigned($signed(reg9[(3'h5):(3'h4)]));
        end
      reg12 <= $signed((~^(wire3[(1'h0):(1'h0)] ?
          $signed({(8'ha5)}) : (&(^~(8'h9f))))));
      reg13 <= $unsigned((8'hbf));
      if (((reg4 << reg13[(4'h8):(4'h8)]) ? ((^~reg8) ? reg12 : reg4) : wire3))
        begin
          reg14 <= reg10[(2'h3):(1'h1)];
          reg15 <= (+reg14[(1'h1):(1'h1)]);
        end
      else
        begin
          reg14 <= (wire1 ^~ {wire2[(2'h3):(2'h3)]});
          reg15 <= (^$unsigned(reg15[(4'h9):(3'h5)]));
          if ((($signed((!reg10[(1'h1):(1'h1)])) + (reg7 ?
                  $signed((reg8 ? reg5 : reg7)) : reg8[(3'h7):(3'h6)])) ?
              $unsigned($signed(reg11)) : reg7[(4'h9):(4'h8)]))
            begin
              reg16 <= ((-wire1[(1'h1):(1'h0)]) >= (((reg9 < (reg15 ?
                      reg4 : (8'hba))) + {$unsigned(reg5)}) ?
                  $signed($signed($signed(reg9))) : $unsigned(wire0)));
            end
          else
            begin
              reg16 <= wire3[(1'h0):(1'h0)];
              reg17 <= wire2[(2'h3):(2'h2)];
              reg18 <= $unsigned((~|$signed(((reg6 ? (7'h42) : (8'had)) ?
                  reg7 : (reg6 == wire1)))));
            end
        end
      reg19 <= (8'hb0);
    end
  assign wire20 = $unsigned(reg4[(4'h8):(4'h8)]);
  assign wire21 = (^~reg12[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      reg22 <= {reg17};
      if ($signed(reg4[(3'h5):(2'h3)]))
        begin
          reg23 <= $signed({$signed($signed((8'hb5)))});
          reg24 <= (^reg7);
        end
      else
        begin
          reg23 <= (&((~&(~(~reg6))) ?
              {($unsigned((8'hbb)) ? $signed(reg23) : (reg18 * reg18)),
                  $signed($signed(reg18))} : reg16[(1'h0):(1'h0)]));
          reg24 <= ($unsigned((^(reg11 ^ (reg7 <<< reg14)))) ?
              (($unsigned(reg6) && ((wire0 < reg24) || $unsigned(reg7))) <= (({wire20,
                      reg9} >>> (8'h9d)) ?
                  $signed(reg8[(3'h6):(1'h0)]) : reg22[(1'h1):(1'h1)])) : {(~^($signed(wire21) - (~^reg10)))});
          reg25 <= (-reg18[(1'h1):(1'h0)]);
          reg26 <= (reg24 >> ((!wire0) ?
              ($signed({wire3, (8'hbf)}) ?
                  (-(wire20 == reg12)) : (^~(reg5 <= reg11))) : $signed($unsigned({reg22}))));
          if (reg18[(2'h2):(1'h1)])
            begin
              reg27 <= ((reg25 << wire2) || ((reg23[(2'h3):(1'h1)] * reg18) != ($unsigned(wire3[(2'h2):(1'h0)]) ?
                  {(8'ha4)} : ($signed((7'h43)) * wire20))));
              reg28 <= (($signed((~&$unsigned((8'hab)))) ?
                      (reg16[(3'h5):(2'h2)] != wire0) : wire3) ?
                  (&{$signed((reg6 ? wire3 : wire0)),
                      {$signed(reg6),
                          reg26[(1'h0):(1'h0)]}}) : ((^(~reg25)) <= (((reg18 ?
                              reg17 : (8'h9f)) ?
                          $signed((8'hb4)) : (wire2 ? reg16 : reg24)) ?
                      ({wire0, reg23} ?
                          reg27[(1'h0):(1'h0)] : reg18) : reg4[(1'h1):(1'h1)])));
            end
          else
            begin
              reg27 <= $unsigned((reg16 ?
                  reg19[(1'h1):(1'h1)] : {$signed((+wire2)),
                      (wire21 ? reg5[(1'h1):(1'h0)] : reg9)}));
              reg28 <= (reg16[(3'h4):(1'h1)] ?
                  ((reg5 == (reg16[(1'h1):(1'h0)] >>> {wire3})) ?
                      wire3[(2'h2):(1'h1)] : ($unsigned(reg16) >= reg18)) : $unsigned(($unsigned((reg18 ?
                          reg26 : wire2)) ?
                      reg4 : $unsigned((reg4 * (8'h9d))))));
            end
        end
    end
  assign wire29 = $signed($signed($unsigned($signed((~&reg17)))));
  assign wire30 = ($unsigned(reg8[(2'h2):(2'h2)]) < {($signed((!reg5)) != $signed((reg7 || reg12))),
                      wire29});
  assign wire31 = {reg6, reg19[(4'h9):(3'h7)]};
  assign wire32 = ((8'hbe) && {wire20[(4'hc):(1'h0)]});
  assign wire33 = (&$signed(reg18[(1'h0):(1'h0)]));
  assign wire34 = wire32[(1'h0):(1'h0)];
  assign wire35 = $unsigned((~($unsigned(wire30[(5'h11):(4'h9)]) > ((reg27 ?
                          reg12 : reg16) ?
                      (reg10 ? reg10 : wire32) : {reg23, reg28}))));
  module36 #() modinst156 (wire155, clk, reg19, wire29, wire30, wire21);
  assign wire157 = $unsigned(($unsigned($unsigned((&wire29))) << reg6[(4'h9):(3'h7)]));
  assign wire158 = (wire32[(3'h6):(3'h4)] << (wire157[(4'h9):(3'h5)] ?
                       reg6[(4'he):(4'he)] : (^~reg14)));
  assign wire159 = (^((wire21[(3'h4):(1'h1)] ~^ {wire3[(1'h0):(1'h0)]}) >>> reg22));
  assign wire160 = ($unsigned((!(wire157[(1'h0):(1'h0)] ?
                           reg13[(4'h8):(3'h7)] : wire20))) ?
                       (~^$signed(wire155[(3'h5):(2'h2)])) : wire29);
  assign wire161 = ($signed((|$signed($unsigned((8'hb2))))) > reg19);
  always
    @(posedge clk) begin
      reg162 <= ((({reg7[(3'h4):(3'h4)], (reg17 ^ wire21)} | $signed({reg11})) ?
              (wire35[(4'hf):(2'h3)] < $unsigned($unsigned(reg8))) : ({wire1[(4'ha):(3'h4)]} * $signed((reg25 & reg7)))) ?
          $signed(reg4[(3'h7):(3'h6)]) : reg8[(3'h4):(1'h1)]);
      reg163 <= $unsigned((reg12[(4'h8):(2'h3)] << (($signed(reg28) ?
              reg11 : (reg27 ? reg9 : reg11)) ?
          (8'hba) : $unsigned((~&reg7)))));
    end
endmodule

module module36
#(parameter param153 = {{(!(^{(8'hae), (8'h9e)}))}}, 
parameter param154 = (({(param153 ? (param153 ? param153 : param153) : (param153 | param153)), (&((8'haf) || param153))} && {({param153} ? (param153 >>> param153) : (param153 != param153))}) - ({((param153 ? param153 : param153) != (param153 || (7'h43)))} ? (+param153) : ({(param153 ? param153 : param153)} <<< ({param153} ? (param153 <<< (8'h9c)) : (8'ha8))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire40;
  input wire [(5'h14):(1'h0)] wire39;
  input wire signed [(5'h10):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire151;
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire80, wire123, wire125, wire126, wire151, reg41, reg42, (1'h0)};
  always
    @(posedge clk) begin
      reg41 <= $signed((!wire37[(1'h1):(1'h1)]));
      reg42 <= (wire39 && {wire38[(3'h6):(2'h2)]});
    end
  module43 #() modinst81 (wire80, clk, wire40, wire37, wire39, reg41);
  module82 #() modinst124 (.wire86(reg41), .wire85(wire38), .wire84(wire40), .wire83(reg42), .clk(clk), .y(wire123));
  assign wire125 = $unsigned(wire40[(1'h1):(1'h0)]);
  assign wire126 = {{(8'hbc)},
                       {(~&wire37[(4'hf):(4'hd)]),
                           $unsigned({$signed(wire123),
                               (wire37 ? wire38 : wire123)})}};
  module127 #() modinst152 (wire151, clk, wire40, wire80, wire39, wire125, wire126);
endmodule

module module127
#(parameter param149 = ({{(8'hb6), (((8'hae) ? (7'h40) : (8'ha7)) ? ((8'hb6) ? (8'hae) : (7'h42)) : ((7'h43) ? (8'ha8) : (8'ha9)))}, ((((8'hae) || (8'ha0)) ~^ (~&(8'h9d))) ? ({(8'ha1)} ? ((8'hb0) ? (8'ha2) : (8'hb1)) : {(8'ha1)}) : (^~((8'hb8) ? (8'hb9) : (7'h42))))} >>> (|((((8'ha9) ? (8'hab) : (8'hb4)) <<< ((8'ha2) <<< (8'ha9))) | (-(!(8'ha6)))))), 
parameter param150 = (8'hae))
(y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire132;
  input wire signed [(4'he):(1'h0)] wire131;
  input wire [(3'h4):(1'h0)] wire130;
  input wire [(5'h15):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire133;
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire134,
                 wire133,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire133 = {(~|(~|(wire129[(2'h2):(1'h1)] ?
                           (wire130 > wire129) : wire129[(2'h3):(1'h0)])))};
  assign wire134 = wire130;
  always
    @(posedge clk) begin
      if ((($unsigned($signed($unsigned((8'hb8)))) ?
          $unsigned(($signed(wire132) >>> $unsigned(wire134))) : wire133) > {$signed(({wire132} ?
              $signed(wire133) : wire133[(4'hf):(4'hd)]))}))
        begin
          reg135 <= $signed((wire132[(2'h2):(2'h2)] * $signed((!{wire132}))));
          if ((((($signed(wire131) ?
                  wire132[(2'h2):(1'h1)] : $signed(wire128)) >>> $signed($unsigned(wire130))) >> $signed({$unsigned(wire133)})) ?
              {$signed((8'hab)),
                  {wire134[(1'h0):(1'h0)],
                      ($signed(wire130) * ((8'ha6) ?
                          wire129 : reg135))}} : {($unsigned($unsigned(wire130)) - (!reg135[(3'h4):(2'h2)])),
                  wire131[(3'h6):(2'h2)]}))
            begin
              reg136 <= $unsigned(wire129[(5'h11):(4'hb)]);
              reg137 <= {$unsigned((~|(&wire128[(3'h4):(1'h0)])))};
              reg138 <= ($unsigned((reg136 ?
                      $signed($unsigned(wire130)) : wire131)) ?
                  $unsigned((+$signed($signed(wire132)))) : ($signed($signed((wire131 ?
                      wire133 : wire128))) <= $signed($unsigned((reg135 ?
                      (7'h40) : wire129)))));
              reg139 <= (^((~&((reg135 ?
                  reg136 : reg135) <<< (wire130 ^~ reg137))) >>> $signed((^~wire128))));
              reg140 <= (|($unsigned(reg138) != wire130[(2'h2):(2'h2)]));
            end
          else
            begin
              reg136 <= $unsigned(((~^reg136) ?
                  (~$unsigned(((8'ha4) & wire134))) : $signed((^((8'hab) && wire129)))));
              reg137 <= $unsigned((8'hbf));
            end
          if ($unsigned(((^(^~$signed(wire134))) * (reg139[(2'h3):(1'h0)] >>> ($unsigned(reg137) ?
              $signed(wire128) : {wire134, reg135})))))
            begin
              reg141 <= $signed($unsigned((~^(7'h42))));
            end
          else
            begin
              reg141 <= $unsigned(wire134[(2'h2):(1'h0)]);
              reg142 <= reg139[(1'h1):(1'h1)];
              reg143 <= $unsigned($signed((((|wire130) > (wire132 >= (7'h44))) ^ reg139[(1'h1):(1'h0)])));
            end
        end
      else
        begin
          reg135 <= $unsigned((reg143 <= $signed($unsigned(reg143))));
          reg136 <= (((~|$unsigned(wire129)) ?
                  wire132[(2'h2):(1'h0)] : (&$unsigned((~|wire134)))) ?
              $unsigned({($signed(wire131) > (wire133 ? wire134 : reg138)),
                  (wire132 ?
                      reg140[(3'h6):(2'h2)] : {reg139,
                          reg137})}) : (~|(+((^~reg137) > $signed(wire130)))));
          reg137 <= $unsigned($unsigned({wire130[(1'h0):(1'h0)]}));
        end
      reg144 <= $unsigned({reg142,
          (~&({wire130, reg140} > (reg141 >= wire128)))});
      reg145 <= {(~wire130),
          ((reg135 | $unsigned(((8'hbf) >= reg142))) ?
              (~(+((8'ha4) >= reg142))) : {(wire129[(3'h5):(2'h3)] ?
                      (wire133 ? (8'hbf) : wire132) : (reg143 - wire134))})};
    end
  assign wire146 = reg145;
  assign wire147 = (~|$unsigned({(~&$signed((8'hbb))), wire133}));
  assign wire148 = wire131;
endmodule

module module82  (y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire86;
  input wire [(5'h10):(1'h0)] wire85;
  input wire signed [(3'h4):(1'h0)] wire84;
  input wire [(4'hb):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire121;
  wire signed [(5'h12):(1'h0)] wire120;
  wire [(5'h12):(1'h0)] wire119;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(5'h11):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire [(5'h14):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire87;
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire87,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire87 = $unsigned(wire84);
  always
    @(posedge clk) begin
      reg88 <= wire86;
      reg89 <= wire85[(1'h0):(1'h0)];
      reg90 <= ((+$signed($unsigned(wire84))) ?
          $signed(reg88[(1'h0):(1'h0)]) : wire86);
    end
  assign wire91 = (wire86[(4'ha):(3'h6)] <= (8'haa));
  assign wire92 = {(8'hba), reg89};
  assign wire93 = $signed($unsigned($signed((wire83 ?
                      (~|wire85) : $signed(reg90)))));
  assign wire94 = (((!wire85[(4'ha):(4'h9)]) - (+$unsigned((reg90 ?
                          wire85 : wire83)))) ?
                      wire87[(1'h1):(1'h0)] : ((((&reg89) ?
                          $signed(wire83) : wire93) - wire84[(2'h3):(1'h0)]) & $unsigned(((~^wire93) | $signed(reg89)))));
  always
    @(posedge clk) begin
      reg95 <= {({{(~|wire92), (wire85 | wire84)}, $signed(reg90)} ?
              $unsigned({wire91,
                  wire83}) : ($unsigned($signed(wire84)) & $unsigned(((8'hb3) && wire93))))};
      reg96 <= (~&((8'hbc) ~^ $signed($signed($unsigned(reg88)))));
      if (($signed($unsigned($unsigned(((8'ha6) ?
          wire91 : wire84)))) >= wire87[(3'h6):(3'h6)]))
        begin
          reg97 <= (^~((+(^$signed(reg95))) ?
              wire85[(4'hc):(3'h7)] : $unsigned(((wire85 > wire91) ?
                  {wire93, wire85} : (wire94 < wire84)))));
        end
      else
        begin
          if (((~$unsigned($unsigned(((7'h40) <= (8'hb6))))) ?
              ($signed(wire94[(2'h3):(2'h2)]) ~^ $unsigned($unsigned($unsigned(wire94)))) : ((reg96 >> $unsigned($unsigned(reg89))) && (~((wire91 ?
                      wire83 : wire93) ?
                  wire85 : wire85[(4'hb):(3'h5)])))))
            begin
              reg97 <= (wire84[(1'h1):(1'h1)] ?
                  ((((!reg88) ?
                      ((8'hbb) | (8'hbc)) : $unsigned(wire85)) >> (reg95[(1'h0):(1'h0)] ?
                      $unsigned((7'h40)) : (^~(8'hbc)))) >= wire84) : {$signed(reg97[(4'hb):(3'h6)])});
              reg98 <= {$unsigned($signed($signed(wire83))),
                  wire91[(3'h4):(2'h3)]};
              reg99 <= $signed((wire85[(1'h1):(1'h0)] + (+((8'ha8) ?
                  (reg98 ? reg88 : wire85) : {reg89, wire84}))));
            end
          else
            begin
              reg97 <= wire94;
              reg98 <= reg99;
              reg99 <= reg98[(4'hc):(3'h5)];
              reg100 <= ({wire91} + $unsigned($unsigned(reg96[(2'h2):(2'h2)])));
            end
          if ($signed((~&(~|wire91[(1'h0):(1'h0)]))))
            begin
              reg101 <= (reg95 >= (((((8'h9f) ?
                  wire91 : wire94) >> $unsigned(reg88)) ^ wire84[(1'h0):(1'h0)]) + $unsigned($signed($signed(wire87)))));
              reg102 <= $signed(($unsigned(wire91) <<< wire84[(3'h4):(3'h4)]));
              reg103 <= reg101[(3'h5):(3'h5)];
            end
          else
            begin
              reg101 <= wire92;
              reg102 <= reg101[(1'h0):(1'h0)];
            end
          if ($signed(($signed(((reg90 ? wire94 : wire85) ?
              wire92 : wire86)) <<< ((8'hbb) ?
              reg102[(2'h3):(2'h2)] : wire94[(2'h2):(1'h1)]))))
            begin
              reg104 <= $unsigned((~|(reg101[(2'h2):(1'h1)] ?
                  ((reg90 ?
                      reg103 : reg96) != (reg102 * reg101)) : {$signed(reg90)})));
              reg105 <= reg90;
              reg106 <= wire91[(3'h6):(3'h6)];
              reg107 <= (~|((((&reg88) - reg100[(2'h2):(2'h2)]) ?
                  $signed(reg88) : (~&reg101)) || (8'hbc)));
            end
          else
            begin
              reg104 <= ((+(&($signed(reg103) * $signed(reg89)))) ?
                  (~|({{wire93}, (~reg95)} ?
                      {reg90[(4'hd):(1'h1)]} : ((~^reg89) ?
                          (~&wire86) : $signed(reg96)))) : (8'hbf));
              reg105 <= reg106[(1'h0):(1'h0)];
              reg106 <= $signed((7'h41));
            end
          reg108 <= ((wire92 ?
              (((^~reg99) ? reg98[(3'h5):(3'h5)] : $unsigned(reg102)) ?
                  reg90[(5'h12):(4'hd)] : $unsigned((wire93 ?
                      wire83 : reg98))) : $signed($unsigned(reg97[(2'h3):(1'h0)]))) || ({{(wire84 ?
                          reg88 : wire94),
                      ((8'had) ? reg89 : reg100)},
                  {reg106[(2'h2):(1'h1)]}} ?
              {reg103, $signed(wire94)} : wire91[(3'h7):(1'h1)]));
          reg109 <= (+(!$signed((~^((8'hb8) == reg97)))));
        end
      reg110 <= $unsigned((reg100[(2'h3):(1'h1)] ?
          (^~$signed($signed(reg107))) : {{(reg97 > reg104)}, reg96}));
    end
  assign wire111 = ($signed(reg108[(2'h3):(1'h1)]) ?
                       reg89[(4'he):(3'h7)] : wire87);
  assign wire112 = wire86;
  assign wire113 = {{($unsigned((reg89 ?
                               reg88 : reg89)) >= reg109[(2'h2):(2'h2)])},
                       (~|$signed($unsigned({reg98, wire93})))};
  assign wire114 = ($unsigned($unsigned(reg96)) < ($unsigned((reg89[(3'h6):(1'h0)] ?
                           (~|wire87) : reg88)) ?
                       $unsigned(((reg107 ? wire91 : (8'hbb)) ?
                           reg95 : wire112[(3'h7):(3'h5)])) : $unsigned((wire83 ?
                           (-reg106) : {reg99, reg96}))));
  assign wire115 = (wire113[(3'h7):(1'h1)] ?
                       $signed($unsigned(((wire93 + wire91) <= $unsigned((7'h41))))) : reg89);
  assign wire116 = (~&$unsigned((((&(8'ha4)) ?
                       (wire87 & wire87) : {wire111,
                           reg97}) >> $signed((8'h9d)))));
  assign wire117 = wire111;
  assign wire118 = $signed((wire94[(3'h5):(1'h0)] ?
                       reg108 : ($unsigned((!wire91)) > ((wire87 > reg100) > reg95))));
  assign wire119 = ({$signed($signed((wire113 > wire83)))} ?
                       (+{reg97}) : (8'hb3));
  assign wire120 = wire91;
  assign wire121 = (^((wire115[(4'hd):(2'h3)] ?
                       (~&{(8'h9e)}) : $signed($signed((8'ha7)))) - (^wire111[(2'h2):(1'h1)])));
  assign wire122 = $unsigned((($signed(reg90) ?
                           wire115[(5'h10):(3'h5)] : (reg106[(1'h0):(1'h0)] * {wire114})) ?
                       {$signed({wire117}),
                           $unsigned($signed(wire111))} : $signed(reg97[(2'h2):(2'h2)])));
endmodule

module module43
#(parameter param78 = ((8'hb9) >>> {(~&(+((8'hbb) == (8'hac))))}), 
parameter param79 = ((8'hb5) ? ((((+param78) ? (param78 | param78) : (param78 ? (7'h44) : param78)) | ((&param78) == (!param78))) | {param78}) : (param78 ^ (param78 ^ (~&param78)))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire47;
  input wire signed [(5'h10):(1'h0)] wire46;
  input wire [(3'h5):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire77;
  wire signed [(2'h2):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire [(5'h14):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire48,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg57,
                 reg56,
                 reg50,
                 (1'h0)};
  assign wire48 = wire47[(2'h3):(1'h0)];
  assign wire49 = {(!wire45)};
  always
    @(posedge clk) begin
      reg50 <= $signed((~^wire46[(4'h9):(3'h6)]));
    end
  assign wire51 = $unsigned(((^~reg50) ?
                      wire44[(3'h6):(3'h4)] : (^~$unsigned($signed(wire49)))));
  assign wire52 = wire48[(2'h2):(1'h1)];
  assign wire53 = (((~^$signed((-wire44))) ?
                          (wire49 >> $signed($unsigned(wire49))) : reg50) ?
                      (~&(((~^wire46) << (~^wire48)) ?
                          $unsigned($signed(wire49)) : {$unsigned((8'ha4))})) : $signed((($unsigned(wire51) ?
                          (wire49 ?
                              reg50 : reg50) : (8'hb1)) * $signed({(8'hae)}))));
  assign wire54 = wire52;
  assign wire55 = ($signed(wire53) << $unsigned(({(reg50 ?
                          wire47 : wire51)} + ($signed(wire52) ?
                      wire47 : wire47))));
  always
    @(posedge clk) begin
      reg56 <= (|$unsigned({wire55, $unsigned($unsigned(wire46))}));
      reg57 <= $signed($unsigned($signed($unsigned((-wire53)))));
    end
  assign wire58 = $unsigned(wire47[(2'h2):(2'h2)]);
  assign wire59 = $signed((^reg57[(4'hb):(3'h7)]));
  assign wire60 = ($signed({($signed(wire58) ? $signed(reg50) : wire47)}) ?
                      wire59[(5'h12):(5'h12)] : (({$unsigned(wire47)} ?
                              $signed({wire48, wire54}) : (|(+wire48))) ?
                          ({(^~(7'h41))} ?
                              reg56 : $signed((wire51 ?
                                  wire58 : wire59))) : $signed(wire45[(3'h5):(2'h2)])));
  assign wire61 = ((wire48 + (-wire51[(5'h14):(3'h7)])) <<< wire48[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg62 <= {wire61, wire53};
      reg63 <= {$unsigned((!wire54)),
          $signed($unsigned((wire60[(4'ha):(4'ha)] ~^ wire53)))};
      reg64 <= wire48[(1'h1):(1'h1)];
      reg65 <= wire59[(5'h11):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg66 <= wire61[(1'h1):(1'h1)];
    end
  assign wire67 = (^(&(|wire58)));
  assign wire68 = $unsigned($signed(reg63));
  assign wire69 = $unsigned($signed(wire49));
  always
    @(posedge clk) begin
      reg70 <= ({((((8'h9c) ? reg62 : reg66) << (|wire60)) ?
              (^~{reg50,
                  wire60}) : $unsigned($unsigned(wire69)))} ~^ $unsigned(wire46));
      reg71 <= (8'ha3);
      reg72 <= (^~wire61[(1'h0):(1'h0)]);
      reg73 <= wire52;
      reg74 <= $unsigned((~^{$signed((wire68 >>> reg57)),
          reg50[(4'h9):(1'h1)]}));
    end
  assign wire75 = ($signed($signed((&(reg63 ?
                      wire46 : reg74)))) ~^ ((~($signed(wire58) ^ $signed(reg74))) ?
                      reg63[(4'ha):(3'h4)] : (~&{reg64[(1'h1):(1'h0)],
                          reg64})));
  assign wire76 = $unsigned((((wire67[(4'hd):(2'h3)] < $unsigned(reg66)) ?
                      $unsigned($unsigned((8'hba))) : wire75) >>> (wire61 ?
                      (|wire44[(4'hb):(4'ha)]) : $unsigned(((8'h9e) == reg62)))));
  assign wire77 = $unsigned({$unsigned($unsigned(reg65)),
                      {{(^~reg70), {wire47, reg70}}}});
endmodule
