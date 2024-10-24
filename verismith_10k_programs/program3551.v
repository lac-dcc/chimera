module top
#(parameter param193 = {(~^{(^~((8'h9c) && (8'ha6))), (8'hb7)}), ((7'h41) >> ({((8'ha3) | (8'hbb)), ((8'ha1) ? (8'hba) : (8'hb2))} ? ({(8'ha2)} >= (~|(7'h43))) : ((-(8'hb6)) ? ((8'hb1) ? (8'hbe) : (7'h41)) : ((8'ha6) <= (8'hbe)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire165;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire168;
  wire [(4'h8):(1'h0)] wire169;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(5'h12):(1'h0)] wire171;
  wire [(4'hc):(1'h0)] wire172;
  wire [(3'h7):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire174;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(4'ha):(1'h0)] wire176;
  wire [(4'h9):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire187;
  wire signed [(3'h6):(1'h0)] wire188;
  wire signed [(3'h7):(1'h0)] wire189;
  reg signed [(5'h15):(1'h0)] reg192 = (1'h0);
  reg [(4'hb):(1'h0)] reg191 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg177 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg186 = (1'h0);
  assign y = {wire165,
                 wire5,
                 wire98,
                 wire167,
                 wire168,
                 wire169,
                 wire170,
                 wire171,
                 wire172,
                 wire173,
                 wire174,
                 wire175,
                 wire176,
                 wire182,
                 wire187,
                 wire188,
                 wire189,
                 reg192,
                 reg191,
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
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(wire2[(3'h6):(2'h3)])) ?
                     ((^(&wire2[(4'hd):(3'h7)])) ?
                         (~^wire2[(2'h3):(2'h2)]) : $unsigned((!{wire2,
                             (8'h9e)}))) : wire0);
  always
    @(posedge clk) begin
      if (wire4)
        begin
          reg6 <= $signed(((^{((8'hba) ? wire0 : wire2),
              wire3[(1'h0):(1'h0)]}) > $signed(($signed(wire4) ?
              {wire2, wire1} : {wire4, wire4}))));
          reg7 <= reg6;
          reg8 <= reg7[(3'h4):(1'h0)];
          if (((^~$unsigned($unsigned(reg8[(4'hb):(2'h2)]))) - wire2))
            begin
              reg9 <= $signed(($signed((~^$signed(reg8))) ?
                  wire3[(3'h6):(3'h6)] : $signed(($unsigned(reg8) ?
                      (^wire5) : $unsigned(wire2)))));
              reg10 <= ({wire3} <= wire4[(3'h5):(3'h5)]);
              reg11 <= {(($unsigned($signed(wire3)) ~^ ({wire3, wire1} ?
                      $signed(reg7) : $unsigned((8'ha9)))) << wire1)};
              reg12 <= ($unsigned(wire1[(1'h1):(1'h1)]) ?
                  $unsigned($unsigned(wire2)) : wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg9 <= wire1[(1'h1):(1'h0)];
              reg10 <= {(reg7[(4'hd):(2'h3)] ? {wire3} : $unsigned(wire3))};
              reg11 <= {$signed(reg11[(1'h0):(1'h0)])};
              reg12 <= $unsigned((^~wire4));
            end
          reg13 <= (~^(reg12 ? reg7 : (~^$signed(wire5))));
        end
      else
        begin
          if ((7'h42))
            begin
              reg6 <= ((wire1[(1'h1):(1'h0)] ?
                      ({(wire1 || reg6)} - $signed((reg8 || reg13))) : {$unsigned(reg7)}) ?
                  (8'hb9) : wire0[(3'h5):(1'h0)]);
              reg7 <= reg13;
              reg8 <= $unsigned(reg11);
              reg9 <= reg9;
              reg10 <= ($signed(reg7) != reg10);
            end
          else
            begin
              reg6 <= $signed($unsigned({{(&reg6)}}));
              reg7 <= (reg9 ?
                  wire4 : $signed((reg12[(4'hc):(4'h8)] ?
                      (&reg9) : reg6[(4'hc):(3'h5)])));
              reg8 <= $unsigned(reg11);
              reg9 <= reg8[(4'ha):(4'h9)];
            end
          reg11 <= (~^$unsigned((wire2 >= (~|(^wire3)))));
        end
      reg14 <= $unsigned(reg8);
      reg15 <= (($signed(reg12[(3'h4):(1'h1)]) ~^ reg7) & $unsigned((($signed(reg14) ?
              reg11[(4'hb):(1'h0)] : (^~wire1)) ?
          $signed($signed(reg6)) : (wire1 ? (|reg9) : $signed(wire4)))));
      reg16 <= ($unsigned((((reg12 ? reg8 : wire1) ?
              (+reg6) : ((7'h44) ?
                  (8'hbc) : wire0)) << (^~reg15[(4'he):(1'h1)]))) ?
          reg8[(2'h2):(1'h0)] : ((~|$signed((^~reg9))) ?
              $signed(reg11) : $unsigned((reg6[(4'ha):(4'ha)] ?
                  (-reg10) : reg9))));
      reg17 <= (^(wire5 ?
          $unsigned($unsigned((~^reg11))) : {((reg12 ? reg11 : wire3) ?
                  (reg8 <= wire1) : (reg8 ~^ reg10))}));
    end
  module18 #() modinst99 (.y(wire98), .wire19(reg11), .wire22(wire0), .wire20(reg14), .wire21(reg17), .clk(clk));
  module100 #() modinst166 (wire165, clk, wire98, wire5, reg10, wire1, reg14);
  assign wire167 = $signed({reg7[(4'h9):(2'h2)],
                       $unsigned($unsigned($unsigned(wire5)))});
  assign wire168 = (&$signed(wire0));
  assign wire169 = $signed($unsigned((wire98[(2'h3):(2'h3)] ?
                       reg13[(3'h5):(2'h3)] : reg10[(3'h6):(3'h6)])));
  assign wire170 = ((reg10[(3'h7):(2'h3)] ?
                           ($unsigned($signed(reg8)) >= $signed(reg8)) : wire1[(4'h8):(1'h0)]) ?
                       (((^(~reg8)) + $signed((~wire98))) ?
                           {((wire5 ? reg14 : reg9) | {reg10, reg10}),
                               $unsigned((|wire1))} : wire1[(4'ha):(3'h6)]) : wire98[(3'h4):(3'h4)]);
  assign wire171 = reg13;
  assign wire172 = (($signed($unsigned((~^wire170))) ?
                           wire171[(4'h9):(2'h2)] : {$unsigned(reg15)}) ?
                       $unsigned($unsigned((8'hb0))) : (~&{reg15[(3'h7):(2'h3)]}));
  assign wire173 = $unsigned((&(($signed((8'hac)) || $unsigned(wire172)) ?
                       (reg13 ? reg8 : wire165) : (7'h41))));
  assign wire174 = {reg8, reg14};
  assign wire175 = $unsigned((&{(|$unsigned(wire173))}));
  assign wire176 = reg13[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if ((~(((8'ha1) ?
              $signed((reg17 ? wire174 : (7'h40))) : ((+wire2) ?
                  wire175[(5'h13):(1'h1)] : wire168[(3'h5):(3'h4)])) ?
          wire1 : {$signed((reg14 ? reg15 : wire4)),
              (reg6[(5'h10):(2'h2)] ?
                  (reg14 & wire167) : (reg13 ? reg8 : reg13))})))
        begin
          if (wire1)
            begin
              reg177 <= wire170[(3'h4):(2'h3)];
              reg178 <= {((-reg17) ? reg9 : $signed((|(reg7 + wire165)))),
                  $unsigned(reg7[(3'h4):(1'h0)])};
            end
          else
            begin
              reg177 <= reg10;
              reg178 <= reg13;
            end
          reg179 <= wire3;
          reg180 <= {(~|((wire173[(3'h4):(2'h2)] ?
                  wire168 : (~|reg14)) < wire170[(3'h4):(1'h1)])),
              wire1[(4'h9):(1'h0)]};
          reg181 <= reg10;
        end
      else
        begin
          reg177 <= reg12;
          reg178 <= wire2;
        end
    end
  assign wire182 = {$signed($unsigned((8'hbf)))};
  always
    @(posedge clk) begin
      reg183 <= ({{$signed((reg12 && reg14)),
              (8'ha0)}} << $unsigned((~^reg179)));
      reg184 <= $unsigned($unsigned($signed($signed(reg179[(4'h8):(2'h3)]))));
      reg185 <= $signed((^((8'hb3) ?
          $signed(wire4[(4'ha):(3'h6)]) : reg179[(1'h0):(1'h0)])));
      reg186 <= reg12[(4'hf):(4'hd)];
    end
  assign wire187 = $unsigned(($signed((~$unsigned((8'ha5)))) ^~ reg180[(2'h3):(1'h1)]));
  assign wire188 = $signed((((^~(|wire4)) || ((^~wire170) ^~ $unsigned(wire169))) * wire167[(4'h8):(3'h4)]));
  module127 #() modinst190 (wire189, clk, reg178, wire3, reg185, reg6);
  always
    @(posedge clk) begin
      reg191 <= (^~(^$unsigned((wire168[(4'hd):(1'h1)] ?
          {wire188} : $unsigned((8'hac))))));
      reg192 <= (~reg17[(5'h12):(2'h2)]);
    end
endmodule

module module100  (y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire105;
  input wire signed [(5'h13):(1'h0)] wire104;
  input wire signed [(2'h2):(1'h0)] wire103;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire [(5'h14):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(4'ha):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  reg [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg153 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire125,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire106 = $signed(wire105[(3'h6):(1'h1)]);
  assign wire107 = (^$unsigned((^~wire105)));
  assign wire108 = (|((~&($unsigned(wire106) ? wire101 : (8'hbe))) ?
                       (+$unsigned(wire104[(2'h2):(1'h0)])) : (wire103 * wire106[(3'h5):(3'h5)])));
  assign wire109 = (8'h9e);
  module110 #() modinst126 (.wire111(wire108), .wire114(wire109), .y(wire125), .clk(clk), .wire113(wire104), .wire112(wire106));
  module127 #() modinst146 (wire145, clk, wire105, wire107, wire109, wire102);
  assign wire147 = (~(~^(wire107 ?
                       {wire101[(2'h2):(1'h0)],
                           $unsigned(wire105)} : ((wire105 ?
                           wire104 : wire105) >= $unsigned(wire102)))));
  assign wire148 = wire102;
  assign wire149 = $signed($signed((^~($signed((8'haf)) | $unsigned(wire106)))));
  assign wire150 = ((((wire105[(1'h1):(1'h0)] >= $signed(wire109)) ^ {wire104[(1'h0):(1'h0)]}) ?
                           $signed($signed((wire104 ?
                               wire107 : wire148))) : (~^{((8'hb2) ^ wire107)})) ?
                       {($signed($signed(wire104)) ?
                               $unsigned((7'h44)) : (!wire148[(3'h7):(2'h3)])),
                           ((~|$unsigned((8'hab))) >>> ((^~wire105) || {wire109}))} : $signed($signed(wire148)));
  assign wire151 = (wire150 + wire107[(3'h4):(2'h2)]);
  assign wire152 = {wire145};
  always
    @(posedge clk) begin
      if (($signed(($unsigned((^wire150)) * (wire151 ?
          (wire151 || wire145) : $unsigned(wire103)))) + ($signed(wire106[(3'h6):(3'h4)]) || ($unsigned((wire101 ^ wire101)) ~^ (~^(wire147 > (8'ha3)))))))
        begin
          if (wire147)
            begin
              reg153 <= wire107;
            end
          else
            begin
              reg153 <= wire125;
            end
          if ((~^(|(($signed(wire149) == ((8'hbb) ?
              wire125 : wire145)) << ($unsigned(wire151) - wire107[(1'h1):(1'h0)])))))
            begin
              reg154 <= (~^wire125);
            end
          else
            begin
              reg154 <= ($signed((!wire104)) <= {($signed(wire106) ?
                      (+{wire104}) : ($unsigned(reg154) ?
                          (-wire147) : (-wire105)))});
              reg155 <= $signed((-(~|{(-wire145)})));
              reg156 <= (~(wire147 ?
                  ($unsigned((wire148 >>> wire151)) != (wire149[(2'h3):(1'h0)] != (wire152 | wire148))) : (wire106 ?
                      $unsigned((reg154 * wire151)) : (^~{wire107, reg155}))));
              reg157 <= ($unsigned(wire152[(3'h5):(1'h0)]) >= $unsigned((+wire101[(5'h10):(2'h2)])));
              reg158 <= $signed((reg156 && (^~$signed($unsigned((8'ha3))))));
            end
        end
      else
        begin
          if (wire149)
            begin
              reg153 <= $unsigned((^~wire152));
            end
          else
            begin
              reg153 <= reg157;
              reg154 <= (!($signed(wire148[(3'h6):(3'h4)]) && (&($signed(wire147) ?
                  wire109 : wire125))));
            end
          reg155 <= (wire125[(5'h15):(3'h7)] ^ $signed(((((8'hbc) << wire145) > {(8'hbc),
                  reg157}) ?
              $unsigned((wire151 || wire105)) : $unsigned($unsigned(wire149)))));
          reg156 <= wire150;
          reg157 <= $unsigned((+$signed(wire125)));
        end
      if ($unsigned(wire106[(1'h1):(1'h1)]))
        begin
          if ((wire149 ?
              $signed((8'hb9)) : {$signed(wire109[(4'h9):(4'h8)]),
                  ((wire152 < (wire152 - wire125)) ?
                      $signed({wire109}) : $unsigned(wire106[(3'h5):(3'h4)]))}))
            begin
              reg159 <= wire152;
              reg160 <= ({wire105} ? wire102 : (8'hbe));
              reg161 <= (&$signed(reg159));
            end
          else
            begin
              reg159 <= (&wire148);
            end
          reg162 <= wire105[(2'h2):(1'h0)];
        end
      else
        begin
          reg159 <= (^~wire107);
          reg160 <= reg162;
          reg161 <= (wire148[(3'h4):(1'h1)] ?
              $unsigned(wire102[(5'h10):(3'h5)]) : $signed(wire148[(2'h2):(1'h0)]));
          reg162 <= (wire106[(3'h5):(2'h3)] ? reg162 : reg153[(1'h0):(1'h0)]);
        end
      reg163 <= reg156;
      reg164 <= $signed(((({wire106} >>> $unsigned(reg154)) * ($signed(wire152) ^~ (wire148 >= wire147))) ?
          wire106 : $unsigned($unsigned($signed(reg161)))));
    end
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire50;
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire50,
                 reg55,
                 reg54,
                 (1'h0)};
  module23 #() modinst51 (.clk(clk), .wire25(wire19), .wire24(wire20), .y(wire50), .wire27(wire21), .wire26(wire22));
  assign wire52 = {wire50,
                      (|($signed((!wire19)) ? wire21 : $unsigned(wire21)))};
  assign wire53 = (((wire52 ? wire22[(1'h1):(1'h1)] : $signed((8'hb1))) ?
                      wire50[(1'h0):(1'h0)] : $unsigned((wire22[(4'hc):(4'hb)] ?
                          wire22 : $unsigned(wire21)))) * wire52);
  always
    @(posedge clk) begin
      reg54 <= $signed((~wire22[(3'h6):(2'h3)]));
      reg55 <= $signed(wire22);
    end
  assign wire56 = (~$signed($signed($signed(((8'ha1) ? (7'h44) : wire20)))));
  assign wire57 = ($unsigned(wire52) ?
                      ((+wire21) ^ ($unsigned({wire53,
                          wire52}) & ($unsigned(wire22) * $signed(wire21)))) : wire53[(2'h2):(2'h2)]);
  assign wire58 = (!(~|(((wire52 <<< (8'hbd)) < (wire50 ? reg55 : wire57)) ?
                      ($signed(wire57) > (^~wire50)) : (wire20 ?
                          $unsigned(wire57) : (reg54 ? wire57 : wire19)))));
  assign wire59 = (~^(8'h9f));
  assign wire60 = wire59;
  assign wire61 = wire53[(1'h1):(1'h1)];
  module62 #() modinst93 (wire92, clk, wire19, wire57, wire56, wire22);
  assign wire94 = (|((wire20[(2'h2):(1'h0)] != $signed((wire57 ?
                          wire21 : wire58))) ?
                      $signed($unsigned(((7'h41) ?
                          (8'hab) : wire61))) : ({{wire21, wire19},
                              (~&wire58)} ?
                          (wire20 ?
                              wire21 : (wire92 + (7'h41))) : $signed(((8'hbb) || wire21)))));
  assign wire95 = {$unsigned((wire60[(3'h7):(2'h3)] != wire21))};
  assign wire96 = (~|{{(^(wire58 << wire50)), $signed($unsigned(wire57))},
                      ($unsigned((+(7'h43))) - reg54)});
  assign wire97 = wire57;
endmodule

module module62  (y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire66;
  input wire [(5'h12):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire69,
                 wire68,
                 wire67,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire67 = $unsigned(wire65[(4'hb):(4'hb)]);
  assign wire68 = (^~$unsigned($signed(wire66)));
  assign wire69 = ((+$unsigned((!((7'h42) ? wire67 : wire63)))) ?
                      $signed((wire66[(2'h3):(2'h3)] ?
                          $signed((wire68 ?
                              wire63 : wire63)) : {$unsigned(wire68),
                              $unsigned((8'had))})) : {wire66,
                          (({wire66} - $unsigned(wire67)) | wire68[(2'h2):(2'h2)])});
  always
    @(posedge clk) begin
      if ((wire66 ?
          $unsigned($signed(wire68)) : $signed($unsigned({$unsigned((8'h9d))}))))
        begin
          reg70 <= (($signed(wire67[(4'ha):(2'h3)]) ?
              wire69[(3'h6):(2'h3)] : $signed(wire69)) <= (|(wire69[(2'h3):(2'h3)] ?
              (~wire64) : {$signed(wire65)})));
        end
      else
        begin
          reg70 <= wire69;
          reg71 <= $signed(($signed({{wire68}}) ?
              wire63[(4'ha):(4'ha)] : (wire64 >= $unsigned({wire64, wire67}))));
          if (($signed((^~$signed((7'h42)))) ^ (!((&(wire69 ?
              wire64 : wire68)) >> ((^wire65) > {wire64, wire67})))))
            begin
              reg72 <= wire68[(2'h3):(2'h2)];
              reg73 <= (^~wire63[(4'h8):(1'h0)]);
              reg74 <= $signed((~|wire63[(4'hc):(1'h1)]));
              reg75 <= $unsigned((7'h40));
              reg76 <= reg70[(2'h3):(2'h3)];
            end
          else
            begin
              reg72 <= {(reg75 ?
                      $unsigned($unsigned({wire64})) : ({$signed(reg73),
                              wire64} ?
                          (reg70 > $unsigned((8'hbd))) : wire67)),
                  (~|{($signed(wire66) ~^ $unsigned(reg71)),
                      wire67[(4'hb):(4'h9)]})};
              reg73 <= reg70[(2'h2):(2'h2)];
              reg74 <= $unsigned((&($signed((-reg74)) & (~&$unsigned(wire65)))));
            end
          reg77 <= wire65[(4'hc):(4'h9)];
          reg78 <= $unsigned((reg74 ?
              $signed(wire66) : ({(!reg77), {wire65}} & wire66)));
        end
      if ((!(reg76[(2'h2):(2'h2)] >= (8'h9e))))
        begin
          reg79 <= ((~&(wire65[(1'h1):(1'h0)] ~^ (((8'ha3) || reg78) ?
                  $unsigned(wire64) : $signed(wire68)))) ?
              wire69[(3'h7):(3'h5)] : wire63[(4'hc):(4'ha)]);
          reg80 <= {{wire68},
              (reg73[(3'h5):(3'h5)] ^~ $unsigned(wire63[(3'h6):(3'h4)]))};
        end
      else
        begin
          reg79 <= $unsigned((~^(&(^~reg74))));
          if ((-reg78))
            begin
              reg80 <= $unsigned(wire69[(1'h0):(1'h0)]);
              reg81 <= $unsigned($signed((reg76[(2'h2):(1'h0)] ?
                  $unsigned({reg77}) : (-(&reg73)))));
              reg82 <= (reg81 != $unsigned((8'h9d)));
              reg83 <= reg76;
            end
          else
            begin
              reg80 <= $signed((+{(~^$unsigned(reg78))}));
              reg81 <= ({(($unsigned(wire69) == (reg76 > reg73)) <= $unsigned({reg82})),
                  (^reg81)} && reg72[(5'h11):(3'h4)]);
              reg82 <= $signed(reg81);
            end
          reg84 <= reg77[(3'h6):(3'h4)];
          reg85 <= reg80;
          reg86 <= ($unsigned((&(reg85 ? wire63[(2'h3):(2'h3)] : {reg85}))) ?
              (+$unsigned(((reg81 - reg84) < $signed(wire68)))) : reg79);
        end
    end
  assign wire87 = ({($unsigned({reg73}) ?
                          reg80 : ({reg76} ^~ $signed(reg83)))} >= ({reg80} && ((|(wire68 && reg70)) ?
                      reg76[(1'h1):(1'h0)] : reg84[(2'h2):(2'h2)])));
  assign wire88 = $signed((8'ha9));
  assign wire89 = wire65[(4'hf):(2'h3)];
  assign wire90 = (((-$signed({reg78})) ?
                      wire63[(1'h1):(1'h1)] : wire68[(4'ha):(3'h4)]) >= $signed($signed(reg75)));
  assign wire91 = (|$signed({$signed(wire90[(1'h0):(1'h0)])}));
endmodule

module module23
#(parameter param49 = {((~(((8'ha9) ? (8'ha8) : (8'hb7)) && ((7'h43) ? (7'h40) : (7'h42)))) ? (&(((8'ha9) >>> (8'ha9)) == ((8'ha6) ? (8'haa) : (8'hab)))) : {(^~(7'h43))})})
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire [(3'h7):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire41,
                 wire40,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg43,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire28 = (wire25[(4'hb):(2'h2)] == ($signed($unsigned($unsigned(wire26))) ?
                      (wire27 <<< $signed($unsigned(wire25))) : ($unsigned(wire26) <<< ((wire27 ?
                              wire24 : wire27) ?
                          (wire25 ? wire25 : wire24) : (~wire27)))));
  assign wire29 = $unsigned($unsigned($signed({wire25[(4'hb):(4'h9)]})));
  assign wire30 = ((~^$unsigned({(wire26 ~^ wire26),
                      (wire27 ? (8'hb2) : (7'h44))})) << (($signed(wire28) ?
                      (~&$signed(wire29)) : wire27) >>> wire27));
  assign wire31 = (8'h9d);
  assign wire32 = wire24[(2'h3):(2'h2)];
  assign wire33 = wire31[(5'h12):(3'h6)];
  assign wire34 = (+(($signed((wire26 ^~ wire32)) ?
                      wire30 : ($unsigned(wire33) | wire30)) ~^ wire27));
  assign wire35 = wire28[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg36 <= ($signed($unsigned((wire26[(5'h13):(3'h7)] ?
              wire24[(4'hb):(1'h0)] : (wire30 ^ wire31)))) ?
          {($signed((|(8'ha0))) - ($signed(wire25) ?
                  $signed(wire25) : $unsigned(wire32)))} : wire33);
      reg37 <= wire31[(2'h2):(1'h1)];
      reg38 <= (($unsigned((+(wire34 || reg37))) ?
          wire30 : $signed((|$unsigned(reg37)))) & $signed($unsigned($signed((reg36 ?
          wire34 : (8'haf))))));
      reg39 <= reg37;
    end
  assign wire40 = $signed({$unsigned(((wire35 ? (7'h43) : wire31) ?
                          $signed(wire35) : wire29)),
                      (!$unsigned($unsigned(wire33)))});
  assign wire41 = (~|$signed(wire28[(2'h2):(1'h0)]));
  assign wire42 = $signed($unsigned(($unsigned((+reg38)) ?
                      reg39[(4'hc):(2'h3)] : $signed($signed(wire31)))));
  always
    @(posedge clk) begin
      reg43 <= $signed((wire33[(1'h0):(1'h0)] ? $unsigned(wire40) : wire42));
    end
  assign wire44 = wire30[(3'h4):(3'h4)];
  assign wire45 = reg38[(1'h1):(1'h1)];
  assign wire46 = $signed((-wire34));
  assign wire47 = (8'hb0);
  assign wire48 = wire31[(2'h2):(2'h2)];
endmodule

module module127  (y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire131;
  input wire [(2'h2):(1'h0)] wire130;
  input wire [(4'hb):(1'h0)] wire129;
  input wire signed [(2'h3):(1'h0)] wire128;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(2'h2):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 (1'h0)};
  assign wire132 = wire130;
  assign wire133 = (^~(-(~wire130[(1'h1):(1'h1)])));
  assign wire134 = wire132;
  assign wire135 = (!(wire131[(2'h3):(1'h0)] ?
                       wire131[(1'h0):(1'h0)] : $signed($unsigned((8'hb4)))));
  assign wire136 = (!$signed(wire132[(1'h0):(1'h0)]));
  assign wire137 = $unsigned(wire131[(2'h3):(1'h0)]);
  assign wire138 = $unsigned((+$signed(($unsigned(wire137) ?
                       $unsigned(wire137) : $unsigned(wire132)))));
  assign wire139 = (&{((|$signed(wire138)) * (~&(8'had)))});
  assign wire140 = wire136;
  assign wire141 = (($signed(((wire139 ? wire138 : wire137) ?
                           (wire131 || (8'hb5)) : $signed(wire135))) + wire138[(1'h0):(1'h0)]) ?
                       (~(~&($signed(wire128) ?
                           wire128[(2'h3):(1'h1)] : wire138[(2'h2):(1'h0)]))) : ($signed($signed(wire138)) ?
                           $signed($unsigned((wire138 ?
                               wire138 : wire130))) : (~wire136)));
  assign wire142 = {wire132[(1'h1):(1'h1)]};
  assign wire143 = {((wire133 ?
                               wire141[(1'h1):(1'h0)] : wire137[(2'h2):(2'h2)]) ?
                           $unsigned($unsigned(((8'hb7) & wire139))) : ($signed((wire133 & wire129)) <= wire142))};
  assign wire144 = $signed($unsigned(wire140[(2'h3):(1'h0)]));
endmodule

module module110
#(parameter param124 = (({(&{(8'ha4), (8'hbb)})} < (8'h9e)) | (+{{(^~(8'ha1)), ((8'hb8) == (8'h9f))}, (~&(+(8'hae)))})))
(y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire114;
  input wire [(4'hf):(1'h0)] wire113;
  input wire signed [(4'h9):(1'h0)] wire112;
  input wire signed [(3'h5):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 (1'h0)};
  assign wire115 = wire113[(3'h6):(3'h5)];
  assign wire116 = wire112[(1'h0):(1'h0)];
  assign wire117 = $unsigned({(~$signed($signed((8'hbd)))),
                       (wire111[(1'h1):(1'h1)] ~^ $signed(wire113[(4'h9):(2'h2)]))});
  assign wire118 = ((wire115[(2'h2):(2'h2)] ?
                           wire113[(2'h3):(1'h0)] : wire116[(3'h5):(2'h2)]) ?
                       ((($unsigned(wire115) ?
                               $unsigned(wire117) : (wire116 <<< wire114)) ?
                           $signed(wire116[(3'h7):(3'h6)]) : $unsigned((wire115 ?
                               wire111 : wire113))) == wire115[(2'h3):(1'h1)]) : $signed($signed(($unsigned(wire117) < (wire117 << wire116)))));
  assign wire119 = ({$signed(($unsigned(wire117) <= wire112[(1'h1):(1'h1)]))} >= (|wire111[(3'h5):(2'h3)]));
  assign wire120 = $unsigned(wire119);
  assign wire121 = (&{$unsigned(wire115), (-$signed($unsigned(wire118)))});
  assign wire122 = $signed(wire111[(2'h2):(1'h1)]);
  assign wire123 = (!$signed($signed($unsigned(wire113))));
endmodule
