module top
#(parameter param211 = (-((8'hb9) ? (((&(8'hbb)) ? ((8'hab) | (8'hba)) : ((8'h9c) * (8'hb1))) < (((8'hb2) ? (8'ha9) : (8'hb4)) + (~^(8'hb0)))) : ((~|((8'h9d) == (8'hbe))) > (((8'hab) ? (7'h40) : (8'hb9)) ? (^~(8'ha8)) : ((8'ha6) ? (8'ha1) : (8'ha5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire210;
  wire [(4'hf):(1'h0)] wire184;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire186;
  wire [(5'h10):(1'h0)] wire197;
  wire [(5'h14):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire199;
  wire [(5'h14):(1'h0)] wire200;
  wire signed [(4'hf):(1'h0)] wire201;
  wire [(4'hb):(1'h0)] wire203;
  wire signed [(2'h3):(1'h0)] wire204;
  reg signed [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg207 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(4'he):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg192 = (1'h0);
  reg [(4'h8):(1'h0)] reg193 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(4'hb):(1'h0)] reg196 = (1'h0);
  assign y = {wire210,
                 wire184,
                 wire5,
                 wire4,
                 wire186,
                 wire197,
                 wire198,
                 wire199,
                 wire200,
                 wire201,
                 wire203,
                 wire204,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 (1'h0)};
  assign wire4 = $unsigned((~&(wire3[(2'h2):(1'h1)] || (+$signed(wire3)))));
  assign wire5 = $unsigned($unsigned((8'hb8)));
  module6 #() modinst185 (.clk(clk), .y(wire184), .wire11(wire5), .wire10(wire1), .wire8(wire4), .wire9(wire2), .wire7(wire3));
  assign wire186 = {((wire4[(4'hb):(3'h7)] > $signed((wire1 ^ wire5))) ?
                           $signed((~(^~wire2))) : wire4),
                       wire0};
  always
    @(posedge clk) begin
      if ($unsigned((~(wire5 ?
          (wire184 ?
              wire4[(2'h2):(1'h0)] : (~&(8'hbc))) : $signed((wire3 >> wire1))))))
        begin
          reg187 <= (((((wire184 ? wire3 : wire3) ?
                  $unsigned(wire184) : $unsigned((8'hac))) & wire0[(1'h1):(1'h0)]) ?
              wire0 : ((8'had) ?
                  (~&$unsigned(wire186)) : wire184)) > $signed($signed($signed(wire0))));
        end
      else
        begin
          reg187 <= $signed(wire5[(3'h6):(3'h4)]);
          reg188 <= wire186;
        end
      if (wire4)
        begin
          reg189 <= ((($signed(((8'hbd) >>> (8'ha3))) * wire2) ?
                  (~wire184) : $unsigned(wire0)) ?
              (+$signed({wire5[(4'h9):(3'h4)]})) : ($unsigned(($signed(wire1) ?
                  wire184[(3'h6):(2'h3)] : wire4)) == (~&(wire4[(3'h5):(1'h0)] >> $unsigned(wire3)))));
          reg190 <= reg187[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned(($signed(((reg187 >> wire186) != wire4[(2'h2):(2'h2)])) ?
              (+({wire186} >> (wire3 && reg187))) : (((reg190 ?
                  wire4 : (8'hac)) + reg189[(4'h8):(3'h6)]) >>> wire4))))
            begin
              reg189 <= wire2;
              reg190 <= (wire0[(3'h4):(1'h1)] && wire0[(1'h0):(1'h0)]);
              reg191 <= (wire5 ?
                  (~&(wire184[(3'h4):(1'h1)] + (reg189[(1'h1):(1'h1)] < $signed(wire5)))) : (+{{(reg188 >>> (8'hbc)),
                          $unsigned(wire5)},
                      reg189[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg189 <= (^~(^~wire2));
              reg190 <= wire1[(3'h6):(3'h5)];
              reg191 <= {$signed((~($signed(wire184) ?
                      ((8'haf) & wire184) : wire2[(4'hb):(3'h5)]))),
                  (^~wire2[(1'h0):(1'h0)])};
              reg192 <= (8'ha5);
            end
          reg193 <= $signed($signed(($unsigned({reg188}) ?
              wire5[(3'h6):(3'h4)] : {$unsigned(wire4)})));
        end
      reg194 <= (^($signed($signed(wire0[(2'h3):(1'h0)])) | (^(^$unsigned(wire4)))));
      reg195 <= ($signed((~(+$unsigned(reg191)))) ?
          (8'haa) : $unsigned(reg188[(2'h3):(2'h3)]));
      reg196 <= (($unsigned(wire186) ?
              (((wire2 ^~ wire3) >>> {wire0}) ?
                  wire184 : (&wire184)) : (8'ha6)) ?
          $unsigned((^($signed(wire2) < ((8'hb0) ?
              (8'hb9) : wire5)))) : (!wire2[(5'h10):(3'h6)]));
    end
  assign wire197 = $unsigned((+((((8'hb2) ?
                           reg193 : reg195) && $signed(wire3)) ?
                       (8'h9c) : ($signed(reg196) - wire4[(3'h4):(2'h3)]))));
  assign wire198 = (^($signed(((7'h42) << $unsigned(wire4))) >> $signed((wire4 ?
                       reg196[(1'h0):(1'h0)] : (reg189 != (8'ha8))))));
  assign wire199 = $signed((reg196 ?
                       wire4[(4'he):(3'h4)] : reg187[(2'h2):(1'h0)]));
  assign wire200 = ($signed(wire2[(3'h4):(1'h0)]) << reg195);
  module6 #() modinst202 (.wire9(wire2), .y(wire201), .wire7(wire0), .wire11(reg187), .clk(clk), .wire10(wire198), .wire8(wire3));
  assign wire203 = {(8'hb2)};
  module68 #() modinst205 (.wire73(reg196), .wire70(wire199), .clk(clk), .wire71(wire186), .wire72(reg194), .wire69(wire184), .y(wire204));
  always
    @(posedge clk) begin
      reg206 <= $unsigned((wire199[(2'h2):(1'h0)] && $signed({$unsigned(reg192)})));
      if ($unsigned((^reg195[(4'ha):(1'h1)])))
        begin
          reg207 <= $signed(reg188[(2'h3):(2'h2)]);
          reg208 <= reg189;
        end
      else
        begin
          reg207 <= $unsigned({(~^$signed((~&reg206)))});
          reg208 <= (reg194 ?
              {$unsigned(reg187[(4'hb):(4'h9)]),
                  wire197} : (~(reg194[(1'h0):(1'h0)] && (^$unsigned(wire4)))));
          reg209 <= {(8'hba), wire2};
        end
    end
  assign wire210 = ((~&{({wire200} ^ {(8'hbe), reg194})}) ?
                       (reg206 ^ (((reg187 * wire197) * wire184) ?
                           reg190 : $signed($unsigned((8'ha8))))) : reg190[(3'h4):(2'h3)]);
endmodule

module module6
#(parameter param182 = (~&((~^(((8'had) > (8'hb9)) && ((8'ha8) ? (8'hb4) : (8'ha8)))) > (({(8'hbf), (7'h44)} ? ((8'hbe) >>> (8'hb3)) : (8'ha0)) ~^ (~&{(8'had), (8'haa)})))), 
parameter param183 = param182)
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h190):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire181;
  wire [(5'h15):(1'h0)] wire180;
  wire [(4'hc):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire177;
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire116,
                 wire67,
                 wire66,
                 wire64,
                 wire32,
                 wire30,
                 wire118,
                 wire119,
                 wire131,
                 wire132,
                 wire133,
                 wire134,
                 wire135,
                 wire136,
                 wire177,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 (1'h0)};
  module12 #() modinst31 (.wire15(wire8), .y(wire30), .wire17(wire9), .wire13(wire11), .wire16(wire10), .wire14(wire7), .clk(clk));
  assign wire32 = (wire9 ?
                      ((~|(wire9 ~^ wire7)) ?
                          $signed(((-wire10) ^~ wire7[(4'hc):(4'ha)])) : {((wire10 ?
                                      (8'hb5) : wire11) ?
                                  $signed(wire7) : (8'ha2))}) : (8'had));
  module33 #() modinst65 (wire64, clk, wire10, wire8, wire9, wire30);
  assign wire66 = (~|wire30);
  assign wire67 = ({$signed(wire9[(1'h1):(1'h1)])} ?
                      $signed((~^((wire66 == wire7) - (wire64 ^ wire11)))) : wire66[(1'h1):(1'h0)]);
  module68 #() modinst117 (.wire70(wire10), .y(wire116), .wire71(wire8), .wire73(wire9), .wire69(wire30), .clk(clk), .wire72(wire67));
  assign wire118 = ($unsigned($signed(wire11[(4'hb):(3'h5)])) ^~ (^~$unsigned($unsigned((wire116 <<< (7'h43))))));
  assign wire119 = wire7[(4'hf):(1'h1)];
  always
    @(posedge clk) begin
      reg120 <= wire10[(2'h2):(1'h0)];
      reg121 <= wire67;
      reg122 <= $signed(($unsigned($signed($signed(wire32))) ?
          (~|$signed($unsigned((7'h43)))) : ($signed(wire119[(2'h3):(2'h3)]) ?
              (reg121[(4'ha):(2'h2)] - (~&wire8)) : (wire30 ?
                  (wire7 ? wire7 : reg121) : $unsigned(wire119)))));
      reg123 <= wire8;
      if (reg121)
        begin
          reg124 <= $signed(reg121);
          reg125 <= (|(~({(!(7'h42)), ((8'ha0) >> wire9)} <= wire66)));
          if (wire30)
            begin
              reg126 <= ((reg123[(3'h4):(2'h2)] ?
                      {wire11[(3'h4):(3'h4)]} : $signed(wire10[(4'h9):(1'h1)])) ?
                  reg122[(3'h5):(1'h1)] : $signed(((&(&wire119)) ?
                      $unsigned(reg124) : ($unsigned(wire119) ?
                          (~|wire11) : wire30[(4'hd):(4'hd)]))));
              reg127 <= (+(|wire8));
              reg128 <= (8'hbc);
              reg129 <= $unsigned(reg128);
            end
          else
            begin
              reg126 <= wire30;
              reg127 <= (($unsigned($unsigned(wire116[(1'h0):(1'h0)])) ?
                      (reg124[(5'h13):(5'h13)] ?
                          reg123[(2'h3):(1'h1)] : $signed((wire10 | reg122))) : wire7) ?
                  reg126 : $signed(wire64[(1'h0):(1'h0)]));
            end
          reg130 <= $unsigned(((((~^wire118) <= (wire119 >> wire9)) == ((-wire64) ?
              $unsigned((7'h42)) : wire119[(4'h8):(2'h2)])) ^~ ((wire64 < $unsigned(wire8)) ?
              $signed((~&reg123)) : $unsigned(reg126[(2'h3):(2'h3)]))));
        end
      else
        begin
          if ((~wire116[(4'h9):(3'h4)]))
            begin
              reg124 <= (8'ha4);
              reg125 <= reg122[(4'ha):(3'h5)];
              reg126 <= reg120;
              reg127 <= ({(!((~&wire119) != (~&wire8))),
                  {wire9[(2'h2):(1'h0)],
                      $unsigned(wire64)}} ~^ ($unsigned($unsigned((reg122 ?
                  reg124 : wire64))) >>> {$unsigned($unsigned(reg128))}));
            end
          else
            begin
              reg124 <= $unsigned($unsigned($unsigned($signed($signed(wire67)))));
              reg125 <= reg121[(2'h3):(2'h2)];
              reg126 <= wire118;
              reg127 <= (-{(((+wire9) >>> $unsigned(wire64)) ?
                      (((8'hba) * reg120) != (^wire67)) : ((^~reg127) ?
                          $unsigned(wire10) : $signed(reg128)))});
            end
        end
    end
  assign wire131 = $unsigned(((^~$unsigned($signed(wire7))) && $unsigned($unsigned({(8'haa),
                       wire119}))));
  assign wire132 = $unsigned(reg123);
  assign wire133 = ((($unsigned((wire67 ? reg120 : reg129)) ?
                               {(wire8 ?
                                       reg130 : wire64)} : ((|wire132) >>> {(8'haf)})) ?
                           ({$unsigned(reg127)} == reg123) : (($signed(wire131) ?
                                   (wire132 ?
                                       wire116 : reg121) : reg122[(4'h9):(4'h8)]) ?
                               reg125[(2'h3):(2'h2)] : (&reg121))) ?
                       $unsigned((&(+(reg124 ?
                           reg123 : wire64)))) : ((!($signed(reg127) ?
                           $unsigned(wire7) : (wire64 <= reg129))) - $unsigned(reg126[(2'h3):(2'h2)])));
  assign wire134 = reg125;
  assign wire135 = (~|reg128[(4'hb):(4'ha)]);
  assign wire136 = $unsigned((wire67[(3'h6):(2'h3)] >= $unsigned((&(wire135 <<< wire132)))));
  module137 #() modinst178 (.y(wire177), .wire141(wire134), .clk(clk), .wire140(wire133), .wire139(wire66), .wire138(reg127));
  assign wire179 = ($unsigned($signed($unsigned(reg122))) ?
                       (^~{$signed((^~wire134)),
                           $unsigned(wire119)}) : $signed($signed((reg123 ?
                           reg130[(4'h8):(3'h6)] : reg128[(3'h7):(3'h6)]))));
  assign wire180 = (~&(($signed((8'hb4)) & ($signed(reg128) ?
                           (reg121 ? wire30 : reg120) : {wire11})) ?
                       $signed((reg127[(3'h7):(1'h0)] + reg125)) : $signed(reg125)));
  assign wire181 = $unsigned({wire32,
                       {(reg124[(4'h9):(3'h6)] ?
                               reg121[(2'h2):(1'h1)] : (~wire118)),
                           $signed($unsigned(wire136))}});
endmodule

module module137  (y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h17f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire141;
  input wire signed [(5'h15):(1'h0)] wire140;
  input wire [(3'h7):(1'h0)] wire139;
  input wire signed [(4'h8):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire176;
  wire signed [(3'h6):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire173;
  wire signed [(4'hc):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire [(4'hb):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire signed [(4'he):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire165;
  wire [(3'h6):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire142;
  reg [(5'h15):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg166 = (1'h0);
  reg [(3'h4):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg156 = (1'h0);
  reg [(2'h2):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg [(5'h14):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg143 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire165,
                 wire160,
                 wire142,
                 reg174,
                 reg167,
                 reg166,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
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
                 reg143,
                 (1'h0)};
  assign wire142 = $signed($signed($signed({wire138,
                       (wire138 ? wire138 : wire138)})));
  always
    @(posedge clk) begin
      reg143 <= ((wire138 ?
          (^~$signed(wire139[(3'h4):(1'h1)])) : wire142) == wire139);
      reg144 <= wire140;
      if (wire142)
        begin
          reg145 <= wire141[(3'h4):(1'h0)];
        end
      else
        begin
          reg145 <= (~({(~(reg144 ?
                  (8'hbc) : reg143))} ^ {reg145[(1'h0):(1'h0)]}));
          if (reg144[(3'h5):(1'h1)])
            begin
              reg146 <= reg144;
              reg147 <= $signed(wire141);
              reg148 <= wire141[(3'h7):(3'h6)];
              reg149 <= (~^((($unsigned(wire140) << $unsigned(wire139)) == (!$unsigned(reg145))) ?
                  ((reg148[(2'h3):(2'h2)] ?
                      (reg145 ?
                          reg143 : reg143) : reg146) + $signed(wire140[(4'he):(3'h5)])) : {reg147[(4'hc):(4'ha)]}));
              reg150 <= wire140[(5'h12):(3'h6)];
            end
          else
            begin
              reg146 <= ((reg143[(1'h0):(1'h0)] != (({(8'ha5)} >> $signed(reg150)) ?
                  {reg143[(1'h0):(1'h0)],
                      ((7'h42) ?
                          (8'ha6) : reg144)} : $signed(reg143[(2'h2):(1'h0)]))) >>> $signed(reg148));
              reg147 <= $signed(reg147);
              reg148 <= $signed((|(~($unsigned(reg146) ^ (wire142 - (8'ha4))))));
              reg149 <= ((reg145 + reg149) ?
                  ($unsigned(((!reg149) ?
                      $unsigned((8'ha1)) : (-reg148))) ^ (~&wire140[(5'h14):(4'hb)])) : reg145);
              reg150 <= wire141[(4'hd):(2'h3)];
            end
          reg151 <= $unsigned($signed(reg149[(2'h3):(2'h2)]));
          reg152 <= ((wire138 ?
                  wire141[(3'h7):(3'h6)] : {$unsigned((8'hbb)), {(8'hba)}}) ?
              reg144 : (|{(~^(-reg147)), $signed($signed(wire142))}));
          if ({({wire142[(3'h4):(1'h0)],
                  reg148[(2'h2):(2'h2)]} ^ $unsigned(wire139)),
              (8'ha4)})
            begin
              reg153 <= $unsigned((-$unsigned($signed(reg150))));
              reg154 <= $signed({reg147});
              reg155 <= {$signed({$unsigned((reg143 ? reg152 : reg149)),
                      wire139[(3'h5):(3'h4)]}),
                  (~|reg147)};
              reg156 <= reg150[(5'h10):(1'h1)];
              reg157 <= ((wire142 <= (reg147[(3'h4):(1'h0)] ?
                      (|(8'h9f)) : {$signed(wire141)})) ?
                  (^~($signed(wire140[(5'h11):(2'h3)]) ?
                      wire142[(1'h0):(1'h0)] : reg153[(1'h0):(1'h0)])) : $signed($unsigned((|(reg153 != wire138)))));
            end
          else
            begin
              reg153 <= $signed(reg149[(2'h3):(2'h3)]);
              reg154 <= (!$signed({(^~((8'hb6) ? reg149 : (7'h40)))}));
            end
        end
      reg158 <= wire139;
      reg159 <= wire139[(1'h1):(1'h1)];
    end
  assign wire160 = ({($signed((reg159 | reg158)) ?
                               reg159 : $signed(reg158[(4'hc):(4'h8)])),
                           {((reg147 | reg156) ? reg150 : $signed(reg148))}} ?
                       {($signed($unsigned(reg146)) - $signed((reg153 >> (8'ha2))))} : reg155[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg161 <= (($signed($unsigned({wire160, reg146})) ?
              (~^(&(^reg153))) : ((8'hb7) ?
                  ($signed((8'hbf)) ?
                      reg144[(5'h11):(4'ha)] : reg155[(1'h0):(1'h0)]) : $unsigned($unsigned(wire141)))) ?
          {{reg149[(2'h2):(1'h0)]}, reg159} : reg150[(3'h4):(1'h1)]);
      reg162 <= reg156;
      reg163 <= $unsigned($signed(reg161));
      reg164 <= reg145[(1'h0):(1'h0)];
    end
  assign wire165 = {((!((reg151 ? reg146 : reg150) ?
                           (reg158 ?
                               reg152 : reg152) : reg163[(1'h1):(1'h1)])) > $unsigned((+(reg158 << reg149))))};
  always
    @(posedge clk) begin
      reg166 <= $unsigned(reg143);
      reg167 <= (8'haf);
    end
  assign wire168 = {$signed($unsigned(reg164[(1'h1):(1'h0)]))};
  assign wire169 = $signed($signed(wire141));
  assign wire170 = $signed($signed($unsigned((8'hbf))));
  assign wire171 = wire168[(3'h7):(2'h2)];
  assign wire172 = wire165;
  assign wire173 = (($unsigned((((7'h44) << reg152) ?
                           {wire139, wire171} : reg143)) ?
                       $unsigned(reg144[(5'h14):(2'h3)]) : wire168[(3'h6):(1'h1)]) << wire170);
  always
    @(posedge clk) begin
      reg174 <= ($signed(reg158[(3'h7):(3'h7)]) | reg147[(4'ha):(4'h9)]);
    end
  assign wire175 = ((reg163[(4'h9):(2'h3)] - wire173) ?
                       $unsigned((8'ha2)) : (reg150 ~^ wire172));
  assign wire176 = reg156[(1'h1):(1'h1)];
endmodule

module module68
#(parameter param115 = ((&(((&(8'ha0)) | (~(8'hb6))) ? (((7'h42) ? (8'haf) : (8'had)) ? (+(8'ha8)) : ((8'hab) ? (8'hbd) : (8'hac))) : (~&((8'ha3) ? (8'hb6) : (8'hb9))))) < {{(((8'hbd) + (8'ha9)) < (8'hba))}, ({((8'ha1) ^ (8'ha4)), (~^(8'hb3))} >>> ((~|(7'h41)) ? {(8'ha3)} : ((8'h9e) | (8'hb5))))}))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h20c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire73;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  input wire [(4'hf):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire [(4'hd):(1'h0)] wire112;
  wire [(3'h4):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(5'h10):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(4'hb):(1'h0)] wire99;
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg74 <= $unsigned((($unsigned({wire70}) & $unsigned($unsigned(wire73))) ?
          (~^$signed($unsigned(wire69))) : $signed(($signed((8'hb4)) * (+wire73)))));
      if (wire72)
        begin
          reg75 <= $unsigned((+($unsigned((wire72 ?
              wire73 : (8'hb2))) == wire73)));
        end
      else
        begin
          reg75 <= {{(reg74 ? wire69[(2'h3):(2'h3)] : (^reg75)),
                  $signed((((8'hbf) & wire69) <<< wire73[(3'h6):(3'h4)]))},
              ($unsigned({(^wire70), wire71[(4'hf):(1'h1)]}) ?
                  ({$signed(wire72), $unsigned((8'hba))} > ((wire69 ?
                      wire71 : (8'ha4)) + (+wire70))) : (((wire73 < reg74) * $signed(reg75)) ?
                      ((~reg75) ?
                          (8'hac) : (-(8'hbe))) : (!$unsigned(wire71))))};
        end
      if ({(wire71[(4'hd):(3'h6)] ^ reg75[(4'hf):(3'h6)])})
        begin
          reg76 <= $signed({(~{(wire69 ? reg74 : wire69), $signed(wire69)}),
              (((7'h41) == reg75[(4'hd):(2'h3)]) ?
                  $unsigned(wire72) : {(~wire73)})});
          if ($signed(reg74))
            begin
              reg77 <= reg76;
              reg78 <= wire69[(3'h6):(2'h2)];
              reg79 <= (wire73 ? wire70[(2'h2):(2'h2)] : wire72[(2'h3):(1'h0)]);
              reg80 <= (-wire73[(3'h4):(2'h2)]);
            end
          else
            begin
              reg77 <= (wire73[(2'h3):(1'h1)] ?
                  reg78[(1'h1):(1'h0)] : wire71[(4'he):(4'hc)]);
              reg78 <= (^($signed(($signed(reg75) & reg77[(4'ha):(4'h8)])) << {({wire72,
                          wire70} ?
                      (^wire71) : {(7'h42), wire72}),
                  reg76[(2'h3):(1'h0)]}));
              reg79 <= $signed(($signed($signed((reg75 ?
                  wire69 : wire69))) == reg74));
              reg80 <= reg79;
            end
          reg81 <= reg75[(4'hb):(3'h5)];
          reg82 <= $unsigned((!($unsigned(wire70[(1'h1):(1'h1)]) - $unsigned(wire70))));
        end
      else
        begin
          reg76 <= $signed((reg81[(1'h0):(1'h0)] ?
              ($signed(((8'hbf) + wire71)) ?
                  ({wire70, reg80} ?
                      (reg75 ?
                          wire71 : wire70) : $signed((8'ha6))) : wire72[(3'h5):(2'h2)]) : $signed(({reg81} ?
                  (~^(8'hb6)) : wire72[(3'h5):(2'h2)]))));
          reg77 <= $unsigned($signed($unsigned((reg74 ?
              (8'haa) : $signed(wire73)))));
          reg78 <= $unsigned(reg81[(1'h1):(1'h1)]);
        end
      reg83 <= $signed(reg82[(5'h13):(1'h0)]);
      reg84 <= reg74[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg85 <= $unsigned($unsigned(((wire69 ? $signed(wire69) : reg84) ?
          reg78 : (wire71 > (reg83 >= reg84)))));
      reg86 <= {(wire70 > ((wire72 != (&(8'ha2))) ?
              (~(~&wire72)) : $signed(reg81)))};
      reg87 <= ((reg78 ? $unsigned($signed((8'ha9))) : $signed((~|reg76))) ?
          ((((reg85 ?
              (8'h9f) : wire70) || (reg74 ^~ reg77)) >> $unsigned($signed(wire72))) != (^(~|reg85[(4'ha):(4'ha)]))) : {reg74[(1'h1):(1'h0)],
              (+wire73[(2'h2):(1'h1)])});
      reg88 <= wire72;
    end
  always
    @(posedge clk) begin
      if (((reg86 ?
              (((~reg76) ? (reg80 >= (8'hb4)) : wire70[(1'h1):(1'h1)]) ?
                  $unsigned((reg75 ^~ (8'ha8))) : reg78) : $unsigned((|reg80[(2'h2):(1'h0)]))) ?
          ((^{$unsigned(reg78),
              (wire71 + reg76)}) ^ wire73[(2'h2):(1'h0)]) : reg74))
        begin
          reg89 <= (($unsigned(wire72[(2'h2):(1'h1)]) <= (|{reg77[(1'h0):(1'h0)],
                  (reg75 >> reg78)})) ?
              wire69 : $signed({((reg80 ? wire70 : wire73) < wire70),
                  ((8'hbc) ?
                      (wire72 ? reg87 : reg78) : reg79[(2'h3):(1'h1)])}));
        end
      else
        begin
          reg89 <= ((&wire70[(2'h3):(2'h3)]) ^ $unsigned(($signed($signed(reg86)) < ((wire72 && (8'hb9)) ?
              $signed(reg80) : reg77[(1'h0):(1'h0)]))));
          reg90 <= (|reg82[(5'h13):(4'hf)]);
          if ((reg87 ~^ $signed((reg88[(4'h9):(2'h3)] >>> $unsigned((^(7'h42)))))))
            begin
              reg91 <= reg74;
              reg92 <= ((8'ha2) ?
                  {($unsigned({(8'ha2),
                          reg81}) + wire72[(3'h4):(3'h4)])} : (reg85 ?
                      $signed(((&reg91) < {wire69})) : $unsigned({(reg82 * reg82),
                          reg77[(2'h3):(1'h0)]})));
            end
          else
            begin
              reg91 <= reg88[(5'h13):(5'h13)];
              reg92 <= (((~|((~&(8'h9f)) * reg92[(3'h6):(3'h5)])) ?
                  reg83 : $unsigned($unsigned((wire71 || reg87)))) << (reg87 ?
                  reg79[(4'h9):(1'h0)] : reg91[(2'h2):(1'h0)]));
              reg93 <= $unsigned((!reg81[(3'h6):(1'h0)]));
            end
          reg94 <= (&$unsigned((reg74 > reg78[(3'h5):(3'h4)])));
          reg95 <= (($signed(($unsigned(wire71) ?
                      $unsigned((8'hbb)) : reg92[(1'h0):(1'h0)])) ?
                  $unsigned($unsigned(reg86)) : ($unsigned({reg81}) ?
                      reg84[(4'h9):(1'h0)] : (reg77 << $signed((8'ha6))))) ?
              wire70[(3'h4):(2'h3)] : {($signed((+reg77)) <<< ((reg86 ?
                      reg86 : reg88) >= reg92[(3'h7):(2'h3)]))});
        end
      reg96 <= {reg76};
      reg97 <= (^$unsigned((|((&reg84) >>> reg85))));
      reg98 <= (-(reg92[(1'h1):(1'h1)] ?
          wire69 : $signed({(reg77 == reg74), (+reg88)})));
    end
  assign wire99 = (7'h41);
  assign wire100 = (8'haf);
  assign wire101 = ({(8'hab)} <= $signed(($signed(reg79) ?
                       $signed((reg92 >>> reg75)) : reg79[(1'h1):(1'h0)])));
  assign wire102 = (8'hb3);
  assign wire103 = (({reg96} ? (8'hb6) : reg94) ?
                       $signed(($signed((|reg79)) ^~ $unsigned((^~(8'had))))) : (((reg94 ?
                               $signed(reg96) : (wire70 * reg95)) ?
                           {wire101[(3'h6):(3'h5)],
                               $signed(reg95)} : ($unsigned((8'hb9)) << $signed((8'hbb)))) ~^ wire102));
  assign wire104 = {((~$signed((wire100 ? (8'ha0) : reg78))) ?
                           (~|$signed((&wire69))) : (-$signed((wire72 + reg92))))};
  always
    @(posedge clk) begin
      if (reg82[(3'h4):(1'h1)])
        begin
          reg105 <= wire101[(3'h5):(1'h1)];
          reg106 <= wire100;
        end
      else
        begin
          reg105 <= (^$unsigned((+($unsigned(reg98) ?
              (wire73 ? reg105 : reg86) : {(8'h9e), wire73}))));
        end
      reg107 <= reg84[(4'h9):(3'h5)];
      reg108 <= reg107;
      reg109 <= $signed((reg98[(4'h9):(1'h1)] | (wire70[(1'h1):(1'h1)] ?
          $signed((|reg85)) : (reg105 & (^reg95)))));
    end
  assign wire110 = {(((reg80[(3'h5):(2'h3)] & reg108[(3'h6):(1'h0)]) & ($signed(reg96) > (^wire99))) - ((wire104 ?
                           reg95 : wire73[(3'h6):(3'h5)]) - ({reg74,
                           wire104} >>> ((8'had) ? (8'ha2) : (8'hbb))))),
                       $unsigned(((~&{wire100, wire99}) ?
                           ((8'ha9) ?
                               reg79 : (reg91 - reg109)) : {$unsigned(wire70),
                               (wire103 ~^ reg97)}))};
  assign wire111 = {reg90,
                       ($unsigned(($unsigned(reg84) ?
                           reg88 : $unsigned((8'h9f)))) << (+reg92[(3'h7):(3'h6)]))};
  assign wire112 = $signed(reg89[(2'h2):(1'h0)]);
  assign wire113 = (reg84 ? (+(^~(~|(reg106 * (7'h43))))) : $signed(reg96));
  assign wire114 = $unsigned({reg88});
endmodule

module module33
#(parameter param62 = (((~{(!(8'ha0))}) ^~ ((+((8'hb5) ? (7'h43) : (8'hac))) ? (8'hb3) : (~^(8'hba)))) ? {(!(((8'had) ? (8'hbe) : (8'haf)) & (~(8'ha4))))} : ((((+(8'hac)) && ((8'hb8) <= (8'hb2))) ? ({(8'hae)} * ((8'hbf) ? (8'hae) : (7'h41))) : ({(7'h41), (8'ha2)} >>> (~^(8'h9d)))) & (+((~^(8'hb3)) ? ((8'ha5) ? (8'hba) : (8'hb8)) : ((7'h42) ? (8'hab) : (8'ha0)))))), 
parameter param63 = ((param62 ? (((param62 && param62) ? (^(8'hb4)) : (!(7'h40))) ? ((8'ha5) ? (8'hb2) : {param62}) : {{param62, param62}, (~^param62)}) : (-{{param62}})) ? (~&((+(param62 ? param62 : param62)) != (8'h9c))) : (param62 ? (((param62 == param62) <<< (-param62)) && (param62 | {param62})) : (!param62))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire signed [(2'h3):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire56;
  wire [(4'hb):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(3'h7):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire38;
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire38,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire38 = (8'hb6);
  always
    @(posedge clk) begin
      reg39 <= wire36[(4'h9):(2'h2)];
      reg40 <= ($unsigned($unsigned($unsigned((8'hb7)))) ?
          (wire34 & $unsigned(((wire35 ^~ wire37) ?
              $signed((8'hb9)) : wire35))) : wire36);
      reg41 <= wire37;
      reg42 <= wire37;
    end
  always
    @(posedge clk) begin
      reg43 <= ($unsigned((($unsigned(reg39) ^~ wire38[(4'ha):(2'h3)]) ?
              $unsigned(((8'hba) ? wire36 : wire38)) : reg40)) ?
          (-$signed(((wire35 > wire38) << ((8'hbe) || wire36)))) : $signed(wire35));
    end
  assign wire44 = (7'h43);
  assign wire45 = $unsigned((wire34[(2'h3):(1'h0)] << (wire34 < $unsigned((reg43 ?
                      reg42 : reg43)))));
  assign wire46 = ($unsigned(wire35) << $unsigned(({reg39[(2'h3):(1'h0)],
                      $unsigned(wire34)} >>> (7'h43))));
  assign wire47 = wire37[(2'h2):(1'h0)];
  assign wire48 = (wire36 + (~&(~^$signed(reg39[(2'h2):(2'h2)]))));
  assign wire49 = ($unsigned(wire46) ?
                      $signed(reg40[(3'h6):(2'h2)]) : reg43[(3'h4):(3'h4)]);
  assign wire50 = $signed($signed($signed(wire46[(3'h4):(2'h2)])));
  assign wire51 = wire48[(4'h9):(2'h2)];
  assign wire52 = {($signed(($unsigned(wire45) <<< (wire35 >= wire46))) > (&wire48))};
  assign wire53 = $unsigned(wire44[(1'h1):(1'h0)]);
  assign wire54 = wire38;
  assign wire55 = {{{($signed((8'hb0)) ? wire45 : $signed(wire45)),
                              $signed($unsigned(wire35))},
                          (((~&wire46) ?
                              $signed(reg43) : (wire37 ?
                                  wire51 : reg39)) >>> (-$unsigned(reg39)))},
                      ($unsigned(wire51[(2'h3):(2'h2)]) ?
                          wire46[(2'h3):(1'h0)] : (({wire36, wire49} ?
                                  (wire44 * wire54) : wire34) ?
                              wire54 : wire48[(5'h11):(3'h4)]))};
  assign wire56 = wire44[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg57 <= ({wire56[(3'h4):(3'h4)],
          $unsigned(reg42[(3'h6):(3'h6)])} + wire53);
      reg58 <= ((^(~&((^reg41) ?
          $unsigned(wire34) : (^wire56)))) >= $signed((^~{(wire47 ?
              wire35 : reg57),
          $unsigned(reg39)})));
      reg59 <= $signed((($signed((~^wire46)) ?
          reg43 : $signed({wire44, wire47})) ^ $signed($signed(reg40))));
      reg60 <= (~^$signed($unsigned(($signed(wire34) && {reg58, wire46}))));
    end
  assign wire61 = $unsigned(((wire35 - (reg60[(4'hc):(3'h6)] >> wire55)) ?
                      $unsigned(((wire56 ? (8'ha0) : wire53) ^~ (wire46 ?
                          wire49 : wire34))) : ($signed($unsigned(reg43)) >>> $signed((~^wire37)))));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  input wire signed [(3'h7):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire18;
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire18,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = wire14;
  always
    @(posedge clk) begin
      reg19 <= (!wire14[(5'h10):(3'h6)]);
      reg20 <= $unsigned(((!(wire18[(4'h9):(3'h4)] & wire14)) ?
          ($signed(wire13) ?
              $signed((reg19 ?
                  wire14 : wire17)) : ($signed(wire16) >= (&reg19))) : wire17[(3'h6):(2'h3)]));
      reg21 <= (wire13 >> $signed($unsigned(wire18)));
      reg22 <= (-$signed($unsigned($unsigned((~^(8'haf))))));
    end
  assign wire23 = wire17;
  assign wire24 = wire13[(1'h1):(1'h0)];
  assign wire25 = (~&$unsigned(wire24));
  assign wire26 = (-$unsigned(({(wire18 == (8'hb3))} * reg21[(1'h0):(1'h0)])));
  assign wire27 = (wire16 ?
                      (wire13 ?
                          wire14[(3'h6):(3'h5)] : wire16[(2'h2):(2'h2)]) : (wire23[(4'hc):(2'h3)] ?
                          ($unsigned($unsigned(reg20)) ?
                              $unsigned((!(8'haf))) : ($unsigned(reg19) ?
                                  $signed(wire14) : (reg19 && wire25))) : (|wire23[(4'he):(1'h1)])));
  assign wire28 = {reg20};
  assign wire29 = (&{{{(reg21 < wire15), (!reg20)}},
                      {(~&((8'haf) ? reg19 : reg19))}});
endmodule
