module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire167;
  wire signed [(5'h10):(1'h0)] wire168;
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  assign y = {wire158,
                 wire5,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire168,
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
                 reg160,
                 reg161,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      if ((!($unsigned(wire4[(3'h5):(1'h1)]) ^ wire3[(1'h1):(1'h0)])))
        begin
          reg6 <= wire0;
        end
      else
        begin
          if ((^~reg6))
            begin
              reg6 <= wire5;
              reg7 <= (+{($unsigned((^~wire0)) ?
                      wire3[(2'h2):(1'h0)] : wire1[(4'h9):(4'h8)]),
                  $unsigned(((&wire1) >>> (wire2 ? wire2 : wire2)))});
              reg8 <= (((8'h9f) ?
                      $signed((&((8'ha0) ? (8'hb0) : wire0))) : {(^~(-reg7))}) ?
                  ({{(8'hbe), (wire2 ? reg7 : reg6)},
                      ($signed(wire1) - wire5[(3'h7):(3'h6)])} && {(|reg7[(4'hf):(4'hb)])}) : $signed(wire0));
            end
          else
            begin
              reg6 <= wire4;
              reg7 <= wire5[(3'h5):(1'h1)];
              reg8 <= (|(!{((reg7 ? reg6 : wire2) ?
                      (wire0 ? (8'hba) : wire1) : $unsigned((8'haf)))}));
            end
        end
      reg9 <= (((wire5[(2'h2):(2'h2)] <<< reg7[(4'h8):(3'h5)]) ?
              $signed(reg6) : (~&wire5[(3'h6):(1'h0)])) ?
          {wire0,
              {$unsigned($unsigned(reg7)),
                  wire0[(1'h1):(1'h0)]}} : ($signed(((reg6 ?
                  (8'hb0) : (8'hbd)) + ((8'hb0) && wire5))) ?
              (wire4 ^ reg7) : wire0[(1'h1):(1'h1)]));
      reg10 <= (~(wire2[(4'hd):(4'hd)] ?
          (~&((reg6 | wire4) >>> (reg9 < (8'hbb)))) : $unsigned(reg8[(1'h0):(1'h0)])));
      if (wire0)
        begin
          reg11 <= ((reg6 ?
                  wire3[(3'h4):(1'h0)] : ((wire1[(1'h1):(1'h0)] ?
                      (^(8'h9d)) : {reg7, wire2}) < wire2)) ?
              (reg7[(3'h4):(2'h2)] || ({(&reg10), reg6[(1'h0):(1'h0)]} ?
                  $unsigned($unsigned(reg8)) : wire5)) : $unsigned($signed({(|wire4)})));
          if ($unsigned(($unsigned(wire0[(3'h4):(3'h4)]) ?
              $unsigned(((|wire0) | (reg8 > wire4))) : (((reg7 ?
                  wire5 : wire5) <<< wire0) * ((8'hb3) ?
                  reg9[(4'h9):(3'h4)] : $signed(reg10))))))
            begin
              reg12 <= wire4;
              reg13 <= {$signed(((~^wire3[(1'h0):(1'h0)]) >> wire2)),
                  ($unsigned(wire4[(2'h2):(1'h0)]) ?
                      $unsigned($signed($unsigned(wire4))) : wire1)};
              reg14 <= $unsigned(wire1[(3'h6):(2'h2)]);
              reg15 <= {((^(+{(8'hb2), reg8})) ?
                      (wire1 ?
                          (|(wire2 ? reg9 : wire3)) : ((reg13 > reg6) ?
                              reg14[(4'hb):(1'h0)] : (wire5 | reg13))) : $signed(({wire3} >>> (reg13 ?
                          reg10 : reg14)))),
                  $unsigned((reg6 || $signed($unsigned((8'had)))))};
              reg16 <= $signed($unsigned($unsigned((wire5 ?
                  $signed((8'hbc)) : reg9))));
            end
          else
            begin
              reg12 <= reg6[(2'h3):(2'h2)];
              reg13 <= $unsigned((reg11[(1'h0):(1'h0)] >> $unsigned(reg10[(3'h5):(3'h5)])));
              reg14 <= wire5;
            end
        end
      else
        begin
          if ((wire5[(1'h0):(1'h0)] < reg15))
            begin
              reg11 <= {$signed($signed(((!(8'hb9)) > (~&wire1)))),
                  (($signed(wire4) & reg9[(4'hf):(4'hd)]) >>> wire5)};
              reg12 <= ($signed(((reg16[(2'h3):(1'h0)] ?
                  reg7[(4'hb):(1'h1)] : $signed((7'h41))) >= $unsigned($signed((8'hbd))))) < (&$signed(($signed(reg15) ?
                  reg13[(4'hd):(4'h8)] : $signed(wire1)))));
            end
          else
            begin
              reg11 <= (~(|$unsigned($unsigned((wire3 ? wire5 : reg15)))));
              reg12 <= (~^(!$unsigned((^$unsigned(reg12)))));
              reg13 <= wire4[(3'h5):(1'h1)];
            end
          reg14 <= $unsigned((|$signed(reg15)));
          reg15 <= ($signed({{(~^reg7), reg14}}) ?
              (reg7[(4'hb):(4'ha)] <<< $unsigned(($signed(wire3) ?
                  reg10 : wire0[(3'h4):(1'h0)]))) : $unsigned({$unsigned(reg14[(4'h9):(2'h2)])}));
        end
    end
  module17 #() modinst159 (.wire19(reg10), .wire21(wire5), .clk(clk), .y(wire158), .wire20(reg7), .wire22(reg12), .wire18(reg14));
  always
    @(posedge clk) begin
      reg160 <= wire4;
      reg161 <= $signed({$unsigned(($signed(reg7) & {(8'hb1)}))});
    end
  assign wire162 = reg15;
  assign wire163 = $signed({$signed(reg14[(3'h5):(1'h1)])});
  assign wire164 = reg16[(2'h2):(2'h2)];
  assign wire165 = (wire158[(4'hb):(1'h1)] ?
                       (~|(((-reg13) > (8'h9e)) ~^ $unsigned((reg13 ?
                           wire1 : reg16)))) : wire3[(3'h4):(2'h2)]);
  assign wire166 = (8'ha8);
  assign wire167 = $signed(wire162[(1'h0):(1'h0)]);
  module133 #() modinst169 (wire168, clk, reg7, reg161, wire2, reg11);
endmodule

module module17
#(parameter param156 = ((((((7'h44) ~^ (8'hb8)) ? {(8'ha9), (8'hb2)} : ((8'hbe) ? (8'hbe) : (8'h9c))) ? (((8'hb0) ? (8'hbf) : (7'h44)) ? ((8'ha2) ? (8'hbb) : (8'haa)) : ((8'hbc) + (8'ha4))) : (((8'ha2) ? (8'haf) : (8'hb8)) ? (7'h42) : ((8'hb6) >= (8'ha1)))) ? (~^{(+(8'hb3))}) : ({((8'hb6) ? (8'h9e) : (8'had))} ? ((^~(8'hb0)) <= (^(8'hb8))) : (^{(8'hae)}))) ? ((~&{(~&(8'h9f))}) ? ((~|(&(8'hb4))) ? (^(^~(8'ha5))) : ((+(7'h41)) ? {(8'h9f)} : ((8'ha4) ? (8'h9e) : (8'hb1)))) : ((((8'hb8) == (8'ha8)) < ((8'ha1) ? (8'ha1) : (8'hba))) ? {{(8'hae), (8'ha6)}} : {(!(8'hb5))})) : (((((8'ha2) ~^ (8'ha7)) - ((7'h43) << (8'hae))) | (!(~&(8'h9e)))) & ((~|(~|(8'ha8))) ? {{(8'ha2)}, {(8'hab)}} : (((8'ha9) >= (8'hb0)) ? (^~(8'ha1)) : ((8'ha0) ? (8'had) : (8'hb8)))))), 
parameter param157 = (param156 <= param156))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire100;
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire152,
                 wire132,
                 wire130,
                 wire103,
                 wire102,
                 wire51,
                 wire26,
                 wire53,
                 wire54,
                 wire100,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= wire19;
      reg24 <= $unsigned((8'had));
      reg25 <= {(reg24[(1'h1):(1'h1)] ?
              {$signed(wire18[(2'h2):(1'h1)]),
                  $signed(((8'hbb) | (8'hbc)))} : reg23)};
    end
  assign wire26 = (!($unsigned($unsigned((wire21 ? wire20 : reg24))) ?
                      wire20[(5'h11):(4'ha)] : (((|wire22) ?
                              $signed(wire18) : {(7'h40)}) ?
                          ((~&wire22) << wire21[(1'h1):(1'h0)]) : reg25)));
  module27 #() modinst52 (wire51, clk, wire26, wire21, wire19, reg25, reg23);
  assign wire53 = ((!reg25) != (reg25 ?
                      $unsigned(wire51) : $unsigned($unsigned((reg24 >> wire26)))));
  assign wire54 = (8'ha6);
  module55 #() modinst101 (.wire56(wire21), .wire57(wire26), .y(wire100), .wire58(wire18), .clk(clk), .wire59(reg23), .wire60(reg25));
  assign wire102 = $signed(wire22);
  assign wire103 = wire20[(1'h1):(1'h0)];
  module104 #() modinst131 (wire130, clk, wire102, wire100, reg25, wire22, wire51);
  assign wire132 = (wire103[(3'h7):(3'h5)] >>> (wire26[(1'h0):(1'h0)] ?
                       reg23[(4'hc):(4'h8)] : $signed(wire103[(3'h5):(2'h2)])));
  module133 #() modinst153 (.y(wire152), .wire136(reg23), .wire134(wire100), .wire137(wire53), .clk(clk), .wire135(reg25));
  assign wire154 = wire26[(4'hd):(4'hb)];
  assign wire155 = wire26[(2'h3):(1'h1)];
endmodule

module module133
#(parameter param150 = (|(((8'hb5) >> ({(8'hb0)} | ((8'hb3) ~^ (8'h9d)))) ^ (({(8'hbf), (8'ha4)} >> ((8'hac) << (8'hb7))) ? ((|(8'ha1)) ? ((8'ha2) ~^ (8'hb3)) : ((8'haa) ? (7'h44) : (8'hb6))) : (~&((8'hb7) ? (8'ha4) : (8'hbc)))))), 
parameter param151 = ((!(((param150 || param150) || (param150 + (8'h9f))) ? param150 : param150)) ? ({(~&((8'hbc) ? param150 : param150))} ? (^~param150) : ({(^~(8'haf))} ? (^~{param150, param150}) : (param150 >= (^param150)))) : ((~|{(+param150)}) ? (({(8'hb8), param150} << {param150}) | ((param150 ? param150 : param150) ? (param150 >>> (8'hb8)) : (7'h43))) : ((~(param150 >> param150)) ? {((8'ha1) ? (8'hb6) : param150), param150} : (~^(~^param150))))))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire137;
  input wire signed [(4'hf):(1'h0)] wire136;
  input wire [(3'h7):(1'h0)] wire135;
  input wire signed [(4'hf):(1'h0)] wire134;
  wire [(5'h10):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((&{{wire134, wire134[(4'h8):(4'h8)]}, wire134}))
        begin
          reg138 <= $signed(wire135);
          reg139 <= wire137[(4'hc):(3'h7)];
          reg140 <= (wire134 | $unsigned(reg138));
        end
      else
        begin
          reg138 <= {reg139[(4'hb):(1'h0)], (^~wire134)};
          reg139 <= wire136;
          reg140 <= (|$unsigned((^$unsigned({(8'ha3)}))));
        end
    end
  always
    @(posedge clk) begin
      reg141 <= ({wire134[(3'h7):(3'h7)]} ~^ $signed((^(&wire136))));
      reg142 <= ($unsigned((^($unsigned(wire137) + (8'ha3)))) >= (8'ha2));
      reg143 <= reg142;
    end
  assign wire144 = ((({(^(8'h9d))} ?
                               reg143[(2'h3):(1'h0)] : (wire136 + (+wire135))) ?
                           wire137 : reg141[(4'h8):(3'h7)]) ?
                       $unsigned({(reg138 ^~ (reg141 + (8'ha4)))}) : (reg140 ?
                           $unsigned(((8'ha6) ?
                               (reg142 ?
                                   reg141 : wire136) : ((8'ha7) && reg138))) : (($signed(reg142) && $signed(reg143)) ?
                               ($unsigned(reg140) ?
                                   {wire136, wire135} : (wire135 ?
                                       wire135 : wire137)) : ((wire135 + (8'ha2)) ?
                                   (wire135 ?
                                       wire136 : wire134) : $signed((8'ha1))))));
  assign wire145 = reg138[(1'h1):(1'h1)];
  assign wire146 = (~^((&(-$signed(wire145))) ?
                       $unsigned(((wire136 ? reg139 : wire135) ?
                           (~&wire137) : (wire145 == wire137))) : reg140));
  assign wire147 = $unsigned($signed(reg142[(4'hd):(4'hb)]));
  assign wire148 = $signed($unsigned(wire135));
  assign wire149 = $unsigned((8'hac));
endmodule

module module104
#(parameter param128 = (8'hb9), 
parameter param129 = param128)
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire109;
  input wire signed [(5'h11):(1'h0)] wire108;
  input wire [(3'h6):(1'h0)] wire107;
  input wire signed [(5'h11):(1'h0)] wire106;
  input wire [(3'h6):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire115;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire [(3'h6):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
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
                 (1'h0)};
  assign wire110 = wire109[(3'h6):(1'h1)];
  assign wire111 = ((wire108[(2'h2):(2'h2)] >>> $signed((wire107[(3'h6):(3'h6)] ?
                           (wire107 ? wire107 : wire108) : wire107))) ?
                       $signed((wire109 ?
                           ($signed(wire110) * ((8'hbd) >= wire110)) : ((wire105 && wire109) ?
                               ((8'ha6) ?
                                   wire107 : wire107) : $signed(wire105)))) : (8'hae));
  assign wire112 = (wire109[(2'h3):(2'h2)] << $unsigned((8'ha7)));
  assign wire113 = $unsigned((!(+{wire112[(2'h2):(1'h0)]})));
  assign wire114 = $unsigned(wire107);
  assign wire115 = $signed(((((wire112 ?
                       wire109 : wire107) == (wire106 < wire108)) == (^~wire114)) - ((^~$unsigned(wire113)) >> $signed((wire109 | wire113)))));
  assign wire116 = (($signed(((wire109 ? wire107 : wire112) ?
                       (wire114 ?
                           wire105 : wire114) : (!wire112))) + wire109) + ($signed($signed($signed(wire107))) <= wire105[(1'h1):(1'h0)]));
  assign wire117 = $signed(((wire113 ?
                           {((7'h40) ? wire114 : wire110),
                               $signed(wire106)} : wire105) ?
                       wire113 : ($signed(wire116) >>> wire109[(4'hd):(4'ha)])));
  always
    @(posedge clk) begin
      reg118 <= $unsigned((~^(&wire117)));
      if (wire108)
        begin
          reg119 <= ((^~wire105[(1'h1):(1'h1)]) >> wire110[(3'h6):(2'h3)]);
          reg120 <= (^~{wire108[(3'h6):(2'h2)]});
          if ($signed(((~^$unsigned((reg120 ? wire106 : (8'hba)))) ?
              ($unsigned($signed(wire107)) <= $unsigned(wire109)) : reg120[(5'h13):(4'he)])))
            begin
              reg121 <= $unsigned(wire109);
              reg122 <= (^($signed($unsigned((wire106 ? wire113 : (8'hbb)))) ?
                  (~^((wire105 ?
                      (8'haa) : wire113) > (reg118 << wire109))) : (^~{$signed((8'hb2))})));
            end
          else
            begin
              reg121 <= (({reg121[(2'h3):(2'h3)],
                      ({wire106, wire108} ?
                          (8'hba) : ((8'had) ?
                              wire116 : reg121))} == $signed($unsigned((wire116 ?
                      reg119 : wire113)))) ?
                  (((|wire108[(4'h9):(4'h9)]) ?
                          ($signed(reg121) && $signed(reg119)) : {(wire112 ^~ reg118)}) ?
                      wire117 : ($signed($unsigned(wire111)) > $signed($signed(wire116)))) : wire114);
              reg122 <= $unsigned($signed((-($unsigned(reg118) && ((8'hb4) ?
                  (8'ha2) : wire114)))));
              reg123 <= wire105[(3'h6):(2'h3)];
              reg124 <= wire112;
              reg125 <= reg124;
            end
          reg126 <= reg121;
          reg127 <= {wire105};
        end
      else
        begin
          reg119 <= wire114;
        end
    end
endmodule

module module55
#(parameter param98 = (((^~(-((8'hb1) >> (8'haa)))) ? (~^({(8'ha0), (8'h9c)} ? {(8'hb6), (8'ha3)} : {(8'hbb)})) : (({(8'hbd), (8'ha9)} ? ((8'hae) | (8'hb3)) : ((8'hbc) ? (8'haa) : (8'hb1))) == (((8'ha1) ? (8'hb5) : (8'haf)) ^~ (&(8'hbc))))) ? ((~|{((7'h44) | (8'hba))}) ^ ((~((8'hb6) != (8'hb7))) ? ({(8'had)} ? {(8'ha1)} : (^(8'hae))) : ((!(7'h42)) ^~ {(7'h40), (8'ha8)}))) : ((((!(8'h9c)) ? ((8'hb6) ~^ (8'h9d)) : {(8'hab)}) == (((7'h42) | (8'h9f)) ? {(8'h9d)} : ((8'h9f) ? (8'hba) : (8'ha0)))) ? {{((7'h40) > (8'h9d))}, ((~^(8'hb6)) ? (-(8'hb8)) : {(8'ha3)})} : (&(&((7'h42) == (8'hb9)))))), 
parameter param99 = param98)
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire [(3'h5):(1'h0)] wire58;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire [(4'he):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(5'h15):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'ha):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(4'hf):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 reg93,
                 reg92,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg75,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= $signed((-({(wire57 ? wire57 : wire58)} - ($signed(wire56) ?
          wire57[(4'h9):(4'h8)] : $signed(wire59)))));
      if ((^~$signed(wire58[(2'h3):(1'h1)])))
        begin
          reg62 <= $signed($unsigned(({(+wire60)} ?
              $signed((~^wire60)) : $signed(wire59[(1'h0):(1'h0)]))));
          reg63 <= (8'hb0);
          if ((($signed(reg62[(1'h0):(1'h0)]) ~^ (~|$unsigned((wire56 == (7'h42))))) ?
              wire56 : reg62))
            begin
              reg64 <= $unsigned(wire57);
            end
          else
            begin
              reg64 <= (|$signed($signed((((8'h9d) + wire56) ?
                  wire58[(3'h4):(2'h3)] : $unsigned(wire57)))));
              reg65 <= reg61;
              reg66 <= $unsigned((~($signed((+wire57)) ?
                  $signed((&reg65)) : wire56[(4'hc):(4'h8)])));
              reg67 <= ($signed({$signed((&reg64))}) ?
                  ($signed($signed(reg63[(5'h12):(4'h8)])) < (((wire57 ?
                              wire59 : reg62) ?
                          wire56[(4'hc):(4'hc)] : $signed(reg65)) ?
                      (8'ha8) : $signed((8'ha4)))) : wire57[(5'h12):(3'h4)]);
              reg68 <= reg63[(4'hc):(4'ha)];
            end
          reg69 <= $unsigned(reg63[(2'h3):(2'h3)]);
        end
      else
        begin
          reg62 <= wire56;
          reg63 <= (^(-$signed($unsigned(((8'hbd) ? wire59 : (8'ha0))))));
          reg64 <= ($unsigned(((reg62[(1'h0):(1'h0)] ?
              $signed((8'ha0)) : {reg68}) ^~ (8'hb9))) > $unsigned((~&((^~(8'hbe)) - (reg61 ?
              wire60 : reg67)))));
        end
    end
  assign wire70 = $signed({reg65});
  assign wire71 = reg66[(3'h4):(2'h2)];
  assign wire72 = $unsigned($unsigned($unsigned((~|$signed(wire57)))));
  assign wire73 = reg61;
  assign wire74 = $signed($unsigned(((wire57[(1'h0):(1'h0)] ?
                      (wire56 ? wire58 : (8'had)) : (wire73 ?
                          (7'h41) : reg66)) - (wire58 + reg67[(4'hd):(4'ha)]))));
  always
    @(posedge clk) begin
      reg75 <= $signed((&{(reg65[(4'hd):(1'h1)] * wire59)}));
    end
  assign wire76 = $signed(reg67);
  assign wire77 = $signed({(~&reg63), reg69});
  assign wire78 = $signed(reg62[(1'h1):(1'h1)]);
  assign wire79 = {{$unsigned(((|(8'ha2)) >> $signed(reg62)))}, {reg63}};
  assign wire80 = $unsigned(($signed($unsigned((reg75 <<< wire72))) ~^ (reg68[(1'h1):(1'h0)] ?
                      $signed((wire73 ?
                          reg75 : (8'ha4))) : $signed($unsigned(reg63)))));
  always
    @(posedge clk) begin
      if ((^~((8'hb7) ? wire78[(3'h6):(2'h2)] : wire79[(4'h8):(4'h8)])))
        begin
          reg81 <= reg62;
          reg82 <= (|$unsigned((~^reg81[(4'ha):(1'h0)])));
        end
      else
        begin
          if (wire79[(4'h9):(3'h5)])
            begin
              reg81 <= (((~^(&((8'hb6) ? (8'ha4) : (8'haa)))) ?
                  (8'ha1) : $unsigned(wire60[(2'h3):(2'h3)])) == wire72);
              reg82 <= $signed(wire70);
              reg83 <= (~&$signed($signed((~^reg68[(4'hd):(4'hb)]))));
              reg84 <= {wire57, wire59};
            end
          else
            begin
              reg81 <= ((($signed((reg68 ? wire56 : wire77)) ?
                      $unsigned(wire58[(1'h0):(1'h0)]) : ($unsigned(wire79) < wire70)) ?
                  (~&((reg83 && wire56) * ((7'h41) ?
                      reg65 : wire73))) : $signed(wire73[(4'h9):(3'h5)])) || reg83[(3'h5):(2'h3)]);
            end
          reg85 <= wire72;
          if ({$signed(((~^$unsigned(reg64)) ?
                  reg82[(2'h3):(2'h2)] : reg85[(3'h7):(3'h5)]))})
            begin
              reg86 <= wire57;
            end
          else
            begin
              reg86 <= wire77[(3'h5):(3'h5)];
            end
        end
      reg87 <= (wire56[(4'hd):(3'h5)] ?
          (($signed($unsigned(wire73)) ?
                  reg65 : (+((7'h40) ? reg68 : (8'ha6)))) ?
              $signed(wire72) : (wire71 ^~ $signed((wire56 - reg63)))) : ((&((reg68 ?
                  reg85 : reg61) ?
              $signed(reg85) : {(7'h44)})) > wire60));
      reg88 <= ((reg69[(3'h4):(3'h4)] ?
          ($signed((~|(7'h42))) >> (^~(reg81 ? reg65 : reg65))) : (((reg63 ?
                  (8'haf) : wire60) >> (8'had)) ?
              wire77[(3'h6):(3'h5)] : (!(reg65 ~^ reg87)))) <= (&$signed({wire58})));
    end
  assign wire89 = $signed(reg66);
  assign wire90 = $signed({(reg84[(1'h1):(1'h1)] ?
                          (wire57[(4'hb):(3'h7)] - (reg88 ?
                              reg65 : wire74)) : wire57)});
  assign wire91 = wire89[(5'h14):(3'h6)];
  always
    @(posedge clk) begin
      reg92 <= {(|(!{((7'h42) <= reg69), $signed(reg86)})),
          {(~|(~|(reg81 ? reg85 : wire70)))}};
      reg93 <= wire56[(4'ha):(1'h0)];
    end
  assign wire94 = (reg63 ? wire57 : $unsigned({wire76}));
  assign wire95 = $unsigned({(($signed(reg75) ?
                          (wire71 ?
                              wire76 : wire56) : (reg86 != reg93)) > (8'hbe)),
                      (wire72[(4'he):(2'h3)] ?
                          wire60[(1'h1):(1'h0)] : reg69[(1'h1):(1'h0)])});
  assign wire96 = $unsigned($signed(reg92[(2'h3):(2'h2)]));
  assign wire97 = $signed(reg68[(4'h9):(1'h1)]);
endmodule

module module27
#(parameter param49 = {(({((8'hbc) ? (8'ha3) : (8'hb5))} ? (^~(8'h9d)) : (7'h42)) ? (~&(8'ha4)) : (((+(7'h44)) ^ ((8'h9d) ? (8'hbe) : (7'h44))) ? ({(7'h41)} ? {(8'hb3), (8'ha8)} : ((8'hbf) ? (8'hb0) : (8'hba))) : (((8'hbf) ? (8'ha2) : (8'hbb)) ? ((8'ha2) << (8'hbd)) : ((7'h40) ? (8'h9d) : (8'ha7))))), (((((8'haa) ? (8'hb7) : (8'hb0)) ? ((8'ha3) ? (8'ha9) : (8'ha8)) : (~^(7'h42))) ? ((&(8'hac)) ? (+(8'ha3)) : ((8'hb4) + (8'hb8))) : (^((7'h43) ? (8'hb5) : (8'hb0)))) > (8'h9d))}, 
parameter param50 = ((~(((param49 ? param49 : param49) + param49) - param49)) <= ((!{param49}) ? (^(~|(~|param49))) : (&((param49 ? (8'hbb) : (7'h41)) - param49)))))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire31;
  input wire [(4'h8):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire29;
  input wire [(2'h2):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg46,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg33 <= (+wire32[(1'h0):(1'h0)]);
      reg34 <= ((+((~|{wire30}) ?
          {(wire28 || reg33)} : ($signed(wire31) <<< (wire28 ^~ wire30)))) + ((^{(wire31 != wire32),
          (~|wire28)}) & wire28[(1'h0):(1'h0)]));
      reg35 <= ($signed($signed({wire30})) ?
          wire32[(1'h1):(1'h0)] : (&$unsigned(wire28)));
      reg36 <= (^~wire29[(4'he):(3'h4)]);
      if ((wire30[(3'h5):(3'h4)] ^ $unsigned(wire32[(2'h2):(1'h1)])))
        begin
          reg37 <= {{reg33[(1'h1):(1'h0)]}};
          reg38 <= (~^$signed($unsigned(((wire31 * wire29) ?
              reg36 : (reg33 ? wire29 : wire29)))));
          reg39 <= reg37;
        end
      else
        begin
          reg37 <= (&((!wire32) ?
              wire29 : ($unsigned((~|reg35)) > reg35[(4'h9):(3'h7)])));
          reg38 <= ($unsigned({$unsigned((reg36 ?
                  reg36 : reg36))}) > $signed($signed($unsigned((7'h41)))));
          reg39 <= (wire28 <<< reg39[(1'h1):(1'h0)]);
        end
    end
  assign wire40 = (!({(~$unsigned(reg35)), (~&$signed(reg34))} ?
                      wire30[(2'h3):(1'h0)] : $signed(($signed(reg33) - ((8'h9c) >> reg36)))));
  assign wire41 = ($signed(({(wire29 ? reg39 : (8'h9f))} ?
                      wire40[(2'h2):(1'h0)] : ($signed(wire32) ?
                          (reg33 < reg34) : $unsigned(wire29)))) | $signed(wire29));
  assign wire42 = reg36;
  assign wire43 = (reg33 & $unsigned(reg36));
  assign wire44 = {$signed((wire28 == $unsigned((reg33 ? wire31 : (7'h43)))))};
  assign wire45 = reg33;
  always
    @(posedge clk) begin
      reg46 <= $unsigned($signed({$signed((reg35 & reg38))}));
    end
  assign wire47 = (^wire45[(4'ha):(1'h1)]);
  assign wire48 = (-(|(7'h44)));
endmodule
