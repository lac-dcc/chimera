module top
#(parameter param196 = (((~{(~^(8'h9c))}) ? ((~&((8'h9f) ^~ (8'ha4))) ? (~^((8'ha4) ? (8'hab) : (8'hbf))) : ({(8'hb9), (8'ha2)} ? ((8'hbe) ? (8'ha1) : (8'hb1)) : ((8'hbb) != (8'ha5)))) : (^(|((8'haf) ? (8'hb7) : (8'h9e))))) ? (~^(~&({(8'hb4)} | ((8'h9f) ? (8'haf) : (8'hb7))))) : (((((8'h9d) <<< (8'ha8)) * ((8'hbb) >> (8'ha4))) >> ({(8'hb4)} >>> ((8'h9f) || (8'ha5)))) ? ((((8'ha7) ^ (8'hb1)) ? (^(8'ha6)) : ((8'had) ? (8'hb9) : (8'hae))) ? (((8'hb7) ? (8'hae) : (8'ha5)) > ((8'ha7) <= (8'haa))) : (7'h41)) : ((8'hba) <= ((~&(8'hb5)) - (~&(8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire194;
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  assign y = {wire82,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire194,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((~^($unsigned(wire1) | $signed(((8'hb4) - wire2)))) > (8'ha6));
      reg6 <= $unsigned(wire1[(3'h5):(3'h5)]);
      reg7 <= (~&(~|$unsigned($unsigned($signed(wire0)))));
      reg8 <= $signed((8'hba));
    end
  always
    @(posedge clk) begin
      reg9 <= $unsigned((((((8'hbb) >= wire4) || wire0[(4'hb):(2'h2)]) == $signed((^~reg7))) <= $signed(($unsigned(wire2) ?
          (~|(8'ha9)) : {wire3}))));
      if (wire2[(2'h3):(2'h2)])
        begin
          reg10 <= wire1[(2'h2):(1'h1)];
          reg11 <= $signed(wire1);
        end
      else
        begin
          reg10 <= $unsigned(reg7[(1'h0):(1'h0)]);
          reg11 <= $signed((8'hae));
          reg12 <= $signed({($unsigned((reg8 ?
                  reg9 : reg6)) >>> reg8[(1'h1):(1'h0)])});
          reg13 <= $signed(reg12[(3'h5):(2'h3)]);
          reg14 <= $unsigned($signed(wire2));
        end
      reg15 <= (wire3[(1'h0):(1'h0)] << (reg11 && $signed(reg5[(2'h3):(1'h1)])));
      reg16 <= $unsigned((reg13 ?
          reg5[(2'h3):(2'h2)] : ((wire2[(4'hd):(4'hd)] * $signed(reg14)) ?
              $signed((!reg8)) : $unsigned(wire2[(4'hd):(3'h5)]))));
    end
  assign wire17 = (($unsigned(reg6[(5'h10):(4'hc)]) ?
                          (wire4 == {(wire3 ?
                                  wire4 : reg14)}) : $unsigned($unsigned($unsigned(reg10)))) ?
                      $unsigned((+($unsigned(reg10) > reg13[(4'he):(1'h0)]))) : (~$unsigned((!$unsigned(reg5)))));
  assign wire18 = $signed(wire2[(4'ha):(2'h2)]);
  assign wire19 = (reg7 >= ((^{$unsigned(reg14), reg16[(1'h0):(1'h0)]}) ?
                      $unsigned($unsigned(reg11)) : {$signed({(8'h9f),
                              reg6})}));
  assign wire20 = (($signed($signed(reg7)) < ((~reg6[(4'ha):(1'h0)]) ?
                          (^~wire0[(3'h5):(2'h3)]) : ({reg10,
                              (8'ha1)} <<< $unsigned(reg8)))) ?
                      (((|(wire19 ? wire2 : reg10)) ?
                              reg7[(2'h3):(2'h2)] : (wire3 ?
                                  wire2[(5'h11):(5'h11)] : (~&reg8))) ?
                          wire2 : (8'hbd)) : (reg12 ?
                          (^reg12[(4'h8):(3'h4)]) : (7'h41)));
  module21 #() modinst83 (wire82, clk, wire1, reg16, reg10, reg11);
  module84 #() modinst195 (wire194, clk, reg9, wire1, wire17, wire20, reg14);
endmodule

module module84
#(parameter param193 = (&(-(^~{((8'hb7) <<< (8'hb4)), ((7'h43) != (8'h9d))}))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h24b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire89;
  input wire signed [(5'h14):(1'h0)] wire88;
  input wire signed [(4'hd):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire [(5'h13):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire192;
  wire signed [(2'h2):(1'h0)] wire191;
  wire [(3'h5):(1'h0)] wire190;
  wire [(4'hd):(1'h0)] wire189;
  wire signed [(2'h3):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire168;
  wire signed [(4'hb):(1'h0)] wire167;
  wire [(5'h10):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire165;
  wire [(4'h9):(1'h0)] wire164;
  wire [(5'h11):(1'h0)] wire163;
  wire [(4'hd):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire117;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire [(5'h14):(1'h0)] wire147;
  wire [(3'h6):(1'h0)] wire159;
  reg [(4'he):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(4'hc):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire117,
                 wire91,
                 wire90,
                 wire147,
                 wire159,
                 reg146,
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
                 reg119,
                 (1'h0)};
  assign wire90 = ({wire87, wire85} ? (7'h42) : wire86);
  assign wire91 = $signed($signed($signed($unsigned((8'h9e)))));
  module92 #() modinst118 (.clk(clk), .wire93(wire87), .wire95(wire91), .y(wire117), .wire96(wire89), .wire94(wire90), .wire97(wire88));
  always
    @(posedge clk) begin
      if ($unsigned((wire91[(3'h7):(3'h6)] ?
          ((wire91 <= $signed(wire88)) ?
              wire85[(2'h3):(2'h3)] : $signed((wire87 ?
                  wire87 : (8'ha1)))) : (((wire117 ? wire88 : (7'h43)) ?
              wire89 : (-wire88)) << $unsigned((^(8'hb8)))))))
        begin
          if (($signed($signed($signed(wire87[(1'h1):(1'h0)]))) ?
              (8'hb0) : (~|wire86[(3'h4):(2'h3)])))
            begin
              reg119 <= ({$signed(((wire89 ? wire90 : (7'h41)) ?
                          (8'hb1) : (wire88 ? wire91 : wire88))),
                      wire89[(3'h6):(3'h4)]} ?
                  ((~{(wire87 ?
                          wire87 : wire85)}) * (^$signed($signed(wire91)))) : {((+$signed(wire117)) > (+wire85))});
              reg120 <= $unsigned($unsigned((wire87 || {{wire85, (8'hb6)},
                  (~&wire90)})));
              reg121 <= ((^~$unsigned($signed((^~reg120)))) ?
                  ((+wire90) >>> (($signed(wire90) ?
                      $signed(reg120) : wire117[(5'h10):(4'h9)]) + (+(wire89 ?
                      wire85 : wire86)))) : (-$unsigned(reg120[(1'h0):(1'h0)])));
            end
          else
            begin
              reg119 <= wire117[(4'hb):(4'hb)];
              reg120 <= {$signed(wire88[(4'he):(3'h6)])};
            end
        end
      else
        begin
          reg119 <= (!wire85[(3'h4):(2'h2)]);
          reg120 <= {{wire117[(4'hf):(4'he)]}, wire117[(5'h10):(4'hb)]};
          if ($unsigned(wire86))
            begin
              reg121 <= wire87[(4'ha):(3'h4)];
              reg122 <= reg120[(4'ha):(1'h1)];
              reg123 <= (wire86[(3'h6):(3'h6)] ^~ {$signed(($signed(wire86) >>> $unsigned(wire87))),
                  ((wire86[(4'h8):(3'h5)] >>> (~&wire90)) ?
                      wire86 : $unsigned(((8'haa) > wire86)))});
              reg124 <= ($signed(($unsigned(wire86) ?
                  (8'hb1) : ($signed(wire91) ^ $unsigned(wire86)))) && reg123[(2'h2):(1'h0)]);
              reg125 <= (~|wire85);
            end
          else
            begin
              reg121 <= $signed(reg119[(1'h0):(1'h0)]);
              reg122 <= (+wire89[(2'h2):(2'h2)]);
              reg123 <= (~^({(!$signed(wire90))} * (~&(~|wire91))));
            end
          reg126 <= $unsigned(reg124);
        end
      reg127 <= (reg120[(4'h9):(3'h5)] ?
          ((8'hab) ?
              ($signed(((8'ha0) >> reg119)) ?
                  ((~reg119) ?
                      reg126 : (reg126 ? wire89 : (8'hb9))) : (^(wire91 ?
                      wire86 : wire91))) : (~$unsigned(wire90[(3'h6):(1'h1)]))) : ((({reg123,
                      reg122} ?
                  wire90[(3'h4):(1'h0)] : $signed(wire89)) ?
              (&$unsigned(reg122)) : {((8'hb7) ?
                      (7'h41) : wire87)}) * (8'hb3)));
    end
  always
    @(posedge clk) begin
      reg128 <= (reg126[(5'h10):(2'h2)] ?
          $unsigned($signed(wire117[(4'h8):(3'h4)])) : ({$signed((8'ha3))} >>> ({$unsigned(wire89)} >= ($signed(wire86) == {wire117}))));
      reg129 <= ((+$unsigned((wire86 * $signed(reg126)))) ?
          ($unsigned(wire117) ?
              $unsigned(reg126[(3'h6):(2'h2)]) : (wire90[(4'hb):(1'h0)] ?
                  (reg123[(3'h5):(3'h4)] ?
                      (reg123 ? wire88 : (8'hb0)) : ((8'ha9) ?
                          reg120 : reg119)) : reg119[(2'h3):(2'h3)])) : ($unsigned($signed(reg119[(1'h0):(1'h0)])) > $unsigned(wire90[(4'hc):(3'h4)])));
      if ((reg121 ^ ((7'h44) ?
          (!((wire85 || reg124) > (reg122 != wire90))) : {reg126})))
        begin
          reg130 <= reg122[(4'hd):(3'h6)];
          if (reg130[(1'h1):(1'h0)])
            begin
              reg131 <= (|(8'hb2));
              reg132 <= reg125;
              reg133 <= $signed((^~$signed((~(~&reg124)))));
              reg134 <= (({{$signed(wire90)},
                      wire85[(3'h7):(1'h0)]} ^~ reg127) ?
                  reg125[(1'h0):(1'h0)] : (~^reg127));
            end
          else
            begin
              reg131 <= (((((wire85 >>> reg131) ^~ $signed(reg119)) ?
                          (wire91 >> (8'hb0)) : (!$unsigned(wire89))) ?
                      ((reg131[(2'h2):(2'h2)] & (reg120 ?
                          (8'h9d) : wire85)) >= $unsigned((~&wire91))) : {reg131,
                          $unsigned($unsigned(wire86))}) ?
                  $unsigned($signed($signed(((8'h9c) ?
                      reg119 : reg127)))) : (reg124[(4'ha):(3'h6)] ?
                      $unsigned($signed($signed(wire88))) : {$unsigned(wire88),
                          (~&(^~reg127))}));
              reg132 <= reg123;
              reg133 <= reg119;
            end
          if (reg123)
            begin
              reg135 <= (wire87[(4'hb):(1'h0)] < {wire117[(3'h6):(3'h4)]});
            end
          else
            begin
              reg135 <= (^wire117[(3'h4):(2'h3)]);
              reg136 <= (($unsigned((!{wire88, (8'ha2)})) ?
                      (wire88[(4'hb):(4'h9)] ?
                          (((8'hb9) ? reg135 : reg123) ?
                              $unsigned(reg119) : reg135[(3'h5):(1'h0)]) : {(-wire89),
                              (wire117 != (8'ha3))}) : (^~(wire90[(3'h7):(2'h2)] ?
                          $signed(reg120) : reg126))) ?
                  (wire89[(3'h4):(3'h4)] ?
                      (~$unsigned((^~wire85))) : reg129[(5'h11):(1'h1)]) : $signed((8'ha8)));
              reg137 <= $unsigned((({reg134} == reg126[(2'h3):(2'h2)]) + reg135[(1'h0):(1'h0)]));
            end
          if (reg137[(4'h8):(3'h6)])
            begin
              reg138 <= ($signed($signed(((reg130 ? reg127 : reg137) ?
                      reg128 : (reg136 ? reg135 : reg122)))) ?
                  reg121 : $unsigned((8'ha3)));
              reg139 <= (reg124 ?
                  $signed((!($signed(wire86) >= (wire88 ~^ wire117)))) : reg122);
              reg140 <= ((wire89[(4'h8):(3'h6)] * ($signed(reg124) | $signed((!wire88)))) >> $unsigned(reg123[(3'h5):(1'h0)]));
              reg141 <= $signed({(7'h40),
                  (($signed(reg130) ?
                          (reg137 >> wire90) : (wire87 ? (8'hb5) : reg135)) ?
                      ($signed(reg131) ?
                          wire85[(1'h1):(1'h0)] : (^(7'h43))) : $signed(wire87))});
              reg142 <= (reg120[(2'h2):(1'h0)] ?
                  $unsigned(reg127[(1'h1):(1'h0)]) : $unsigned({$signed(((8'hbe) ?
                          (8'haa) : (8'ha7)))}));
            end
          else
            begin
              reg138 <= (-reg129[(1'h1):(1'h1)]);
            end
          reg143 <= $signed($unsigned(((((8'hab) ? reg123 : (8'hb7)) ?
              (~&(8'hbf)) : (reg125 < reg122)) >= $unsigned((reg122 || reg126)))));
        end
      else
        begin
          if ($unsigned($unsigned(reg136)))
            begin
              reg130 <= (&(reg122 * (reg139[(4'h8):(4'h8)] ?
                  {(reg132 ? reg131 : wire117),
                      (wire88 - reg129)} : $unsigned((^wire85)))));
            end
          else
            begin
              reg130 <= $unsigned(($unsigned({$signed(reg119)}) ?
                  wire89 : $signed(reg139[(4'h8):(3'h4)])));
              reg131 <= ((({$signed(reg123), (reg131 ? reg119 : reg139)} ?
                      ((wire87 ? reg133 : (8'hbc)) ?
                          ((8'hbd) > wire86) : reg134) : (~^(reg141 ^~ reg119))) ^~ ((8'h9c) ^~ $unsigned($unsigned(reg126)))) ?
                  (^~$unsigned(reg123)) : ({$signed({wire87})} << reg141));
              reg132 <= wire117;
              reg133 <= $signed(wire117);
            end
          reg134 <= reg143;
          if ((~&$signed(($unsigned((reg125 != reg136)) ?
              ($unsigned(reg140) <<< $unsigned((8'hb5))) : (8'hbf)))))
            begin
              reg135 <= ((($signed(((8'h9c) ? reg133 : reg139)) ?
                      reg123 : ((wire89 ?
                          reg140 : wire88) || $signed((8'hb0)))) ?
                  reg122 : (^~wire117[(4'hb):(2'h3)])) * (+wire87));
              reg136 <= (~(({$signed(reg127), $signed(reg141)} ?
                      {(reg119 ?
                              wire86 : reg119)} : $signed(reg125[(1'h1):(1'h0)])) ?
                  (|(~reg124)) : wire88[(5'h10):(4'hb)]));
              reg137 <= {($signed({$signed(reg124), (^reg131)}) ?
                      $unsigned(((reg135 ? reg127 : reg130) ?
                          $signed(wire85) : reg120[(1'h0):(1'h0)])) : wire88),
                  ((reg141[(4'he):(3'h6)] ?
                          (((8'ha9) ? reg120 : wire91) ?
                              reg136[(2'h2):(2'h2)] : reg140[(1'h0):(1'h0)]) : {(reg140 ?
                                  reg143 : reg138),
                              reg128[(4'h8):(4'h8)]}) ?
                      (!((~&reg132) ?
                          $signed(wire89) : reg143[(2'h3):(1'h0)])) : ({(~reg137),
                              reg134} ?
                          (~(reg119 ? reg137 : reg135)) : (~|(-reg129))))};
              reg138 <= $unsigned({{$signed(reg138)}});
              reg139 <= reg119;
            end
          else
            begin
              reg135 <= (^~$signed({wire87[(1'h1):(1'h0)]}));
            end
          if ($unsigned($unsigned(((reg125[(1'h1):(1'h1)] | $unsigned((7'h41))) ?
              $signed((reg120 <= wire86)) : reg142))))
            begin
              reg140 <= {(reg126[(4'he):(3'h7)] <= (reg126[(2'h3):(2'h2)] ^~ {{reg133,
                          (8'hbb)},
                      reg134}))};
              reg141 <= reg122;
              reg142 <= (^wire86);
              reg143 <= reg138[(4'h8):(3'h5)];
              reg144 <= (reg123 || {($signed($signed(reg131)) ?
                      $signed((wire89 * (8'hbe))) : {{wire88}})});
            end
          else
            begin
              reg140 <= ((!$signed($unsigned($signed(reg135)))) & wire117[(1'h1):(1'h1)]);
              reg141 <= (^~wire89);
            end
          reg145 <= wire87[(1'h0):(1'h0)];
        end
      reg146 <= (8'h9e);
    end
  assign wire147 = reg126;
  module148 #() modinst160 (.wire151(reg131), .clk(clk), .wire152(reg139), .y(wire159), .wire150(reg146), .wire149(wire89));
  assign wire161 = $signed((reg130[(3'h4):(3'h4)] ^ ((-$unsigned(reg130)) ?
                       $unsigned(reg128) : ((8'hbe) >> $unsigned((8'ha3))))));
  assign wire162 = wire159;
  assign wire163 = $signed($signed(reg133));
  assign wire164 = $signed((^~wire162));
  assign wire165 = wire91;
  assign wire166 = wire88[(3'h5):(3'h5)];
  assign wire167 = $unsigned($signed({$signed((wire147 * wire89))}));
  assign wire168 = $unsigned(((+{reg139,
                       $signed(reg142)}) ^ (wire166[(3'h5):(3'h5)] ?
                       $signed((reg136 << (8'hb3))) : ($unsigned(wire90) * $signed(wire164)))));
  module169 #() modinst188 (.wire170(reg129), .clk(clk), .wire174(wire85), .wire173(wire147), .wire171(reg136), .y(wire187), .wire172(reg133));
  assign wire189 = reg127[(2'h2):(2'h2)];
  assign wire190 = wire167;
  assign wire191 = wire162[(1'h1):(1'h0)];
  assign wire192 = $signed(((reg122[(4'he):(2'h3)] ?
                           {(wire187 ? (8'ha6) : wire90),
                               (wire86 ?
                                   wire166 : wire89)} : (wire90[(4'hf):(4'hb)] < reg145)) ?
                       (|({wire168} < (-wire117))) : ($signed({(8'ha0)}) - ((reg122 && reg125) ?
                           (~&wire89) : $signed(reg130)))));
endmodule

module module21
#(parameter param80 = ((((((8'haa) * (8'ha0)) ? (8'h9d) : {(8'hb6)}) - {((8'ha5) ? (7'h43) : (8'haa))}) ? (+(-(8'ha2))) : (({(8'hb0), (8'hb7)} ~^ (8'hb0)) ? (|((8'ha5) ? (8'haa) : (8'hac))) : ({(8'ha9), (8'hbd)} ? (!(8'hbf)) : (~|(8'hb4))))) != (({(8'ha3)} * ((^~(8'hbf)) >= ((8'hab) | (8'ha2)))) ? (~|{(8'ha8)}) : (((8'hab) ? (~|(8'h9f)) : ((8'hb9) & (7'h41))) ? ((~|(8'ha3)) < ((8'hb9) ~^ (8'hb4))) : (^((8'ha0) >> (8'hb6)))))), 
parameter param81 = ((~^param80) > (!{((param80 ? param80 : param80) != param80), param80})))
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(4'h9):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire26;
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire60,
                 wire58,
                 wire26,
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
                 reg61,
                 (1'h0)};
  assign wire26 = ({(^({wire22} ?
                              (~^(7'h41)) : ((8'hb8) ? wire22 : (8'hb6))))} ?
                      $signed(wire24[(4'h8):(2'h2)]) : $signed(($unsigned((wire25 ?
                              wire24 : wire25)) ?
                          (~|(wire24 > wire22)) : ($unsigned(wire24) >>> (&wire24)))));
  module27 #() modinst59 (.wire30(wire23), .wire29(wire25), .wire28(wire24), .y(wire58), .clk(clk), .wire31(wire26));
  assign wire60 = (8'h9f);
  always
    @(posedge clk) begin
      if ((^{(wire26[(4'h9):(1'h0)] ?
              wire58 : {(wire22 ? wire22 : wire25), (~&wire60)})}))
        begin
          reg61 <= (|{((+wire60) <<< (8'ha8))});
          if (wire26[(3'h4):(2'h3)])
            begin
              reg62 <= $unsigned({$unsigned($unsigned(wire60))});
              reg63 <= {wire24, $signed((-$unsigned((&wire24))))};
              reg64 <= $signed({(-{$signed(reg62)}),
                  $signed($signed((+wire26)))});
              reg65 <= $unsigned($unsigned({($unsigned((8'ha1)) ?
                      {wire23, (7'h40)} : (wire22 ? (8'hb3) : (8'had))),
                  $signed($signed((7'h42)))}));
              reg66 <= $signed($signed(($unsigned((reg64 ? wire26 : (8'hbc))) ?
                  reg63 : reg65[(1'h0):(1'h0)])));
            end
          else
            begin
              reg62 <= wire58;
              reg63 <= wire58[(3'h5):(3'h5)];
              reg64 <= (~{$signed(wire25[(4'hb):(4'h9)])});
            end
          reg67 <= $unsigned(({(8'hac),
              {{wire23, reg62}}} || $unsigned(($unsigned(reg66) ?
              $signed(wire22) : (|(7'h42))))));
        end
      else
        begin
          if (reg65)
            begin
              reg61 <= reg62;
              reg62 <= (~(^(((wire23 ? wire23 : wire58) <= reg66) ?
                  $signed($unsigned(reg67)) : wire22[(3'h6):(3'h6)])));
              reg63 <= wire26;
              reg64 <= reg67[(3'h7):(3'h7)];
              reg65 <= ((!$unsigned({((8'ha0) ? reg65 : wire25)})) ?
                  wire60 : wire25[(1'h1):(1'h1)]);
            end
          else
            begin
              reg61 <= ((~&$signed({(&wire23)})) - ($signed({wire23[(3'h6):(3'h5)]}) ?
                  wire25 : $signed(wire22)));
              reg62 <= reg62[(5'h10):(4'h9)];
              reg63 <= {reg65};
              reg64 <= (wire60[(1'h0):(1'h0)] ?
                  (((^~(reg61 ?
                      reg65 : wire24)) == $unsigned($unsigned(wire24))) != ((~&$signed(reg67)) ?
                      reg65[(2'h3):(2'h2)] : $unsigned($unsigned(reg64)))) : reg65);
            end
        end
      reg68 <= (wire23[(4'he):(2'h3)] ?
          (reg63 ?
              ({(8'h9c)} < (wire58[(2'h2):(2'h2)] ?
                  reg62 : (wire24 ?
                      wire58 : wire60))) : $signed(wire60)) : ((((reg63 ?
                      (7'h44) : reg63) ?
                  {(8'h9e)} : reg66) >>> $unsigned(wire26)) ?
              reg65[(3'h5):(1'h1)] : ({(|reg67), (reg63 ^~ wire26)} ?
                  wire23[(2'h2):(1'h1)] : reg64[(4'hc):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg69 <= $unsigned((+(&(~&((8'hb1) - wire23)))));
      reg70 <= (8'hb6);
      reg71 <= (reg64 ?
          {(-((reg64 < wire23) * reg63[(4'h8):(3'h6)])),
              ($signed(wire23[(4'hf):(4'h9)]) ?
                  $unsigned($signed(reg66)) : ($unsigned(wire26) ?
                      (~&(8'hb2)) : (wire26 ?
                          wire24 : (8'ha1))))} : ((~&$unsigned($signed(reg68))) ?
              $signed($signed((reg69 ^~ (8'ha4)))) : $signed(($unsigned(reg66) ?
                  (reg63 ? reg67 : reg64) : {(8'hbd), reg70}))));
    end
  assign wire72 = ((wire25[(3'h6):(3'h5)] ?
                          $unsigned((reg63[(3'h6):(1'h0)] * $unsigned((8'h9c)))) : $signed(wire25)) ?
                      $unsigned((((reg67 | reg65) ?
                          (8'ha7) : (wire58 ^~ wire24)) * (wire23[(4'h8):(2'h2)] ?
                          reg69 : (|reg61)))) : reg66);
  assign wire73 = (^(wire72 ?
                      $signed($unsigned((reg68 ? wire24 : reg64))) : (reg65 ?
                          {$signed(reg71)} : reg71)));
  assign wire74 = {$unsigned($signed($unsigned({(8'h9e), (8'hb4)})))};
  assign wire75 = ((~(reg67 ?
                      reg71 : $unsigned((wire25 && reg69)))) << $unsigned(reg67[(5'h13):(4'hb)]));
  assign wire76 = reg67[(1'h1):(1'h1)];
  assign wire77 = (reg62 || wire26);
  assign wire78 = $signed($signed((reg67[(3'h7):(3'h7)] ?
                      reg65 : reg63[(1'h1):(1'h0)])));
  assign wire79 = wire60[(2'h2):(2'h2)];
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire32;
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire35,
                 wire34,
                 wire32,
                 reg55,
                 reg54,
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
                 reg38,
                 reg37,
                 reg36,
                 reg33,
                 (1'h0)};
  assign wire32 = $signed((wire31[(4'h8):(1'h1)] ^ {wire28[(4'h9):(3'h4)]}));
  always
    @(posedge clk) begin
      reg33 <= $unsigned($signed(wire31[(2'h3):(2'h3)]));
    end
  assign wire34 = $signed($unsigned(wire29));
  assign wire35 = reg33;
  always
    @(posedge clk) begin
      reg36 <= $unsigned((wire34 ?
          (((^(8'ha0)) ? (wire30 ? reg33 : wire32) : $unsigned((8'h9d))) ?
              $unsigned($signed(wire34)) : $signed($unsigned((8'h9e)))) : {((^wire29) ?
                  $unsigned(reg33) : wire29),
              $signed((wire32 | wire35))}));
      reg37 <= (-(^~$unsigned(reg36)));
      reg38 <= wire32;
    end
  assign wire39 = wire30;
  assign wire40 = (!$signed(wire30));
  assign wire41 = (~&wire29);
  assign wire42 = (((wire29 && $unsigned($unsigned(wire39))) >> reg37[(2'h2):(1'h0)]) != $signed($signed({(wire28 ^ wire34),
                      (reg33 == wire31)})));
  assign wire43 = $unsigned(wire32);
  always
    @(posedge clk) begin
      reg44 <= ($unsigned($signed((~&wire40[(4'he):(4'hd)]))) ?
          $unsigned({$signed(wire40[(4'hf):(4'ha)])}) : (({(wire30 ?
                          wire41 : wire34),
                      (-(8'ha0))} ?
                  ((wire30 ? wire34 : wire40) << {wire41, wire29}) : wire31) ?
              {(~&(wire34 ? wire43 : wire30))} : (^~wire39[(4'h9):(3'h6)])));
      if (($unsigned(wire31[(4'hb):(3'h5)]) < $unsigned((((reg44 - reg44) ?
          $signed((8'ha1)) : $unsigned(wire29)) - $unsigned((wire32 ?
          reg37 : wire39))))))
        begin
          reg45 <= $unsigned(wire30[(2'h3):(2'h3)]);
          reg46 <= (reg37[(2'h2):(2'h2)] ?
              ({wire28, $signed(reg37)} ?
                  reg45[(4'hd):(4'hb)] : $unsigned($unsigned(wire43[(2'h3):(2'h3)]))) : ((wire31 ?
                      $unsigned(reg36[(4'h8):(2'h2)]) : {{wire42, reg44}}) ?
                  $signed(((wire41 ? wire40 : reg36) - {(8'ha3)})) : reg36));
          if ($signed($signed(((8'hb0) ^ reg38[(3'h5):(2'h2)]))))
            begin
              reg47 <= {reg33[(2'h3):(1'h1)]};
              reg48 <= wire31;
            end
          else
            begin
              reg47 <= ($signed(((~^reg47[(2'h2):(2'h2)]) ?
                      ((+reg45) ~^ $signed(wire31)) : (^~(~&(8'had))))) ?
                  $unsigned(reg37) : $signed($signed((reg38 ?
                      $signed((7'h41)) : wire34))));
              reg48 <= (reg47 ?
                  (~|{(~^(wire31 >= wire31)), (|(reg33 ^~ reg36))}) : wire39);
              reg49 <= wire34[(3'h5):(3'h5)];
              reg50 <= {$unsigned((($signed(reg49) ?
                      (reg48 == reg37) : $signed(reg46)) * ({wire32, reg46} ?
                      wire34 : wire42[(1'h0):(1'h0)])))};
            end
          if (((|$unsigned(wire28)) == wire28[(3'h4):(1'h1)]))
            begin
              reg51 <= $unsigned(((~&wire43) && $unsigned(($unsigned(wire39) ?
                  reg47[(3'h7):(2'h2)] : ((8'hb5) ? reg50 : reg36)))));
              reg52 <= wire35[(3'h5):(1'h0)];
              reg53 <= $unsigned($unsigned($unsigned(reg33)));
              reg54 <= reg47;
            end
          else
            begin
              reg51 <= (reg53[(4'h8):(3'h6)] > $unsigned(reg54));
              reg52 <= wire40[(2'h3):(2'h2)];
              reg53 <= (~{{{wire28[(3'h5):(3'h4)]}}});
              reg54 <= (({$unsigned($unsigned(wire35)),
                      reg46[(3'h6):(3'h5)]} >> ((wire39 ?
                      (~&reg51) : (wire43 ?
                          wire28 : wire34)) + wire32[(3'h7):(1'h1)])) ?
                  (&wire35) : (8'hbe));
            end
        end
      else
        begin
          reg45 <= reg44;
          if ($unsigned(reg51[(2'h2):(1'h1)]))
            begin
              reg46 <= $unsigned($unsigned($signed(((~&(8'hb3)) ^~ $unsigned(wire35)))));
              reg47 <= ((wire28 <= $unsigned({reg45})) >= ($signed($unsigned((wire31 <<< (7'h42)))) + ((~|(8'hbd)) | (^wire30))));
            end
          else
            begin
              reg46 <= {$unsigned((|$signed((wire40 != wire32))))};
              reg47 <= $unsigned((^~wire40));
            end
          reg48 <= ((|(($signed(reg50) ?
                  {reg49,
                      reg51} : $unsigned(reg45)) - $unsigned($unsigned(reg54)))) ?
              (~|($unsigned((wire28 ? (8'ha3) : wire35)) ?
                  $signed(wire40) : $unsigned((wire43 ?
                      wire29 : reg46)))) : ((reg49 ?
                  reg36 : (!{reg48})) || (~|wire28[(4'h9):(4'h9)])));
          reg49 <= (|$unsigned($signed($signed(reg49[(1'h0):(1'h0)]))));
          reg50 <= $unsigned(($unsigned(((~&(8'ha3)) + (8'hb7))) << ((~|reg51) ^~ $unsigned((reg44 > wire30)))));
        end
      reg55 <= (($unsigned($signed($unsigned(wire35))) ?
              ($signed(reg49[(3'h4):(3'h4)]) ?
                  (~|(reg52 * wire30)) : ((^wire43) >> wire32[(4'h9):(1'h0)])) : $unsigned($unsigned((wire29 < wire43)))) ?
          ((^~reg46[(3'h7):(1'h0)]) ~^ (wire34[(4'h8):(1'h0)] && ((&reg37) <= $signed(reg47)))) : reg54[(4'h9):(3'h5)]);
    end
  assign wire56 = reg47;
  assign wire57 = reg38;
endmodule

module module169  (y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire174;
  input wire [(5'h14):(1'h0)] wire173;
  input wire signed [(4'he):(1'h0)] wire172;
  input wire [(4'h9):(1'h0)] wire171;
  input wire [(4'he):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire186;
  wire [(4'h8):(1'h0)] wire185;
  wire [(4'h9):(1'h0)] wire184;
  wire signed [(3'h7):(1'h0)] wire183;
  wire signed [(4'hf):(1'h0)] wire182;
  wire signed [(5'h13):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire178;
  wire signed [(3'h7):(1'h0)] wire177;
  wire [(4'ha):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg180 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 reg181,
                 reg180,
                 (1'h0)};
  assign wire175 = {wire170[(4'h9):(1'h1)]};
  assign wire176 = wire172[(4'he):(3'h6)];
  assign wire177 = $unsigned(($signed(((wire170 != wire174) << $unsigned(wire175))) * (~^(wire171 <= $unsigned((7'h40))))));
  assign wire178 = (wire174 <<< ((wire172[(4'h9):(1'h1)] << {(wire175 > wire173),
                           $unsigned(wire177)}) ?
                       wire170 : $unsigned($unsigned($signed(wire177)))));
  assign wire179 = $unsigned({{({wire174, (8'hb8)} ?
                               ((8'ha8) | wire176) : wire174[(5'h12):(5'h11)])}});
  always
    @(posedge clk) begin
      reg180 <= $unsigned({wire173});
      reg181 <= $signed($unsigned(wire179[(4'hc):(3'h4)]));
    end
  assign wire182 = ({(8'ha8)} ?
                       $signed(($unsigned((wire170 ?
                           wire170 : wire172)) > $unsigned({wire173,
                           wire176}))) : {(wire179[(4'hc):(1'h0)] ?
                               $signed(wire177[(1'h0):(1'h0)]) : $signed($unsigned(wire173)))});
  assign wire183 = $unsigned(wire174);
  assign wire184 = (reg180[(4'ha):(3'h5)] ?
                       wire170[(2'h2):(1'h0)] : ($signed(wire179[(4'hf):(3'h7)]) ?
                           $unsigned(($signed(wire173) ~^ {wire173})) : {(!$unsigned(wire178)),
                               $unsigned($unsigned(wire174))}));
  assign wire185 = (8'hb5);
  assign wire186 = wire184;
endmodule

module module148
#(parameter param157 = ((((-{(8'hb8)}) ? ({(8'hb9), (8'ha4)} >> ((8'ha9) && (8'hae))) : (~|((8'hae) ? (8'hb7) : (8'ha7)))) ? {{((8'haa) + (8'ha3))}, ((~(7'h41)) | ((8'hb0) > (8'haf)))} : ((((8'hb9) ? (8'hbc) : (8'hb2)) < (!(8'ha8))) > (((8'h9f) - (8'hae)) ^~ ((8'hbe) || (8'hb4))))) ? ({(!{(7'h43)}), (((8'ha5) && (7'h44)) ^ (~^(8'ha1)))} << {((|(8'hb0)) <<< ((8'hb7) + (8'hac)))}) : (+(^~(((8'hb3) & (7'h43)) ^ ((8'hb7) ~^ (8'hba)))))), 
parameter param158 = (8'hb8))
(y, clk, wire152, wire151, wire150, wire149);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire152;
  input wire [(3'h4):(1'h0)] wire151;
  input wire signed [(4'he):(1'h0)] wire150;
  input wire [(4'h9):(1'h0)] wire149;
  wire signed [(5'h12):(1'h0)] wire156;
  wire [(5'h13):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire153;
  assign y = {wire156, wire155, wire154, wire153, (1'h0)};
  assign wire153 = wire152[(2'h2):(1'h0)];
  assign wire154 = wire151;
  assign wire155 = (wire151 ?
                       $signed((~|$signed({(8'hbb)}))) : {{(^~{wire150})}});
  assign wire156 = wire150;
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire97;
  input wire signed [(4'h9):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire signed [(4'hb):(1'h0)] wire94;
  input wire signed [(4'hd):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(5'h14):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  assign y = {wire116,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg98,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg98 <= ((|{((wire97 < wire96) >= (wire95 ^~ wire97)),
          wire97}) ^ ((~|$unsigned((~^wire93))) ? (8'ha1) : $unsigned(wire95)));
    end
  assign wire99 = $signed($unsigned($signed((wire94[(1'h0):(1'h0)] || {wire96,
                      wire93}))));
  assign wire100 = (~^((((wire95 + wire96) ?
                               (wire96 ? wire99 : reg98) : $signed(reg98)) ?
                           $unsigned((reg98 << wire97)) : $signed(wire93[(3'h5):(3'h4)])) ?
                       $unsigned((~&wire96)) : reg98[(3'h7):(3'h7)]));
  assign wire101 = wire100[(4'hd):(2'h2)];
  assign wire102 = wire96[(2'h3):(2'h3)];
  assign wire103 = $signed((!((&wire102) ?
                       ($signed(wire94) ?
                           wire101[(3'h4):(2'h2)] : wire102) : ((-wire99) ?
                           wire95[(2'h2):(2'h2)] : $unsigned(reg98)))));
  assign wire104 = (^~$signed(wire96));
  assign wire105 = $signed(wire101[(2'h3):(1'h1)]);
  assign wire106 = (|$unsigned(wire102[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg107 <= $unsigned(((!(~|(~(8'had)))) * wire106[(4'hb):(3'h7)]));
      if ($unsigned(wire93))
        begin
          reg108 <= wire103[(4'hc):(2'h2)];
          if ((-{reg108}))
            begin
              reg109 <= (&(7'h42));
            end
          else
            begin
              reg109 <= {(&reg109[(2'h3):(2'h3)]), (~wire97)};
              reg110 <= wire95;
              reg111 <= (~|$unsigned(($signed(((8'hb8) ? (8'hb0) : wire104)) ?
                  reg107[(4'hf):(4'hd)] : wire95)));
              reg112 <= ($unsigned($unsigned(((^~(7'h44)) ^ wire94[(3'h4):(2'h3)]))) ?
                  wire106 : (~&(8'haf)));
              reg113 <= (($signed((8'hae)) < (-wire106)) << wire97);
            end
          reg114 <= (reg112 - wire96[(3'h6):(1'h0)]);
        end
      else
        begin
          reg108 <= $signed($signed((($unsigned((7'h44)) >> $unsigned(reg110)) || reg112)));
          reg109 <= $signed(($unsigned(reg114) ?
              $signed(((wire102 ? wire104 : wire93) ?
                  $signed((8'ha4)) : $signed(reg108))) : ({(-wire93),
                      (~^reg109)} ?
                  $signed(wire101[(1'h0):(1'h0)]) : $unsigned((wire101 ?
                      reg111 : reg98)))));
        end
      reg115 <= (wire100[(4'h9):(3'h4)] ?
          (~^(^$signed($unsigned(reg107)))) : (((8'h9e) ?
                  (((8'hb4) >= reg98) ?
                      wire97 : (reg108 | reg112)) : wire93[(3'h7):(2'h3)]) ?
              $signed(wire104) : (~^{(!wire100), $signed(wire95)})));
    end
  assign wire116 = $unsigned(wire94);
endmodule
