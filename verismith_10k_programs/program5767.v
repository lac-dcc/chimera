module top
#(parameter param161 = (|(!(+(~|((8'ha4) | (8'ha5)))))), 
parameter param162 = {((!{(param161 * param161), (8'h9f)}) >> {(^~{param161, param161})}), {{(8'h9f)}, param161}})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire25;
  assign y = {wire159,
                 wire28,
                 wire27,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire25,
                 (1'h0)};
  assign wire4 = (wire0 ^ $unsigned((($unsigned(wire0) <<< $unsigned(wire2)) ^ (&(wire0 >>> wire3)))));
  assign wire5 = $unsigned((wire2[(3'h4):(1'h1)] << (~|($unsigned(wire1) ?
                     (wire0 || (8'h9c)) : (wire0 << wire1)))));
  assign wire6 = wire2[(1'h1):(1'h0)];
  assign wire7 = wire1[(2'h2):(2'h2)];
  module8 #() modinst26 (wire25, clk, wire3, wire5, wire1, wire4, wire0);
  assign wire27 = $signed((^wire1[(3'h7):(1'h0)]));
  assign wire28 = wire0;
  module29 #() modinst160 (.y(wire159), .wire32(wire1), .clk(clk), .wire30(wire3), .wire31(wire2), .wire33(wire6));
endmodule

module module29
#(parameter param158 = ((+(8'ha5)) << (((~^((8'hae) ? (8'hb4) : (8'hba))) ? (((8'hbe) ? (8'ha0) : (8'hb5)) ? (8'hb1) : (8'hbf)) : ((^~(7'h44)) << {(8'ha1), (8'hb2)})) ? (!(((8'hba) <= (8'hb7)) ? ((8'hb5) >= (8'hb7)) : {(8'hb7)})) : ((((8'hbf) ? (8'ha7) : (8'h9d)) - ((8'hb0) ? (8'ha6) : (8'hbc))) ? {(&(8'hac)), {(8'h9f)}} : ((8'haf) ? ((8'h9c) >= (8'hab)) : (8'ha5))))))
(y, clk, wire30, wire31, wire32, wire33);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire [(5'h14):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire156;
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  assign y = {wire94,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire77,
                 wire96,
                 wire97,
                 wire156,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire34 = (|$unsigned((($signed(wire33) < wire31) << wire31[(1'h1):(1'h0)])));
  assign wire35 = wire30[(1'h0):(1'h0)];
  assign wire36 = wire35[(4'h8):(3'h6)];
  assign wire37 = $signed(wire32[(4'h9):(2'h2)]);
  assign wire38 = {wire31[(1'h1):(1'h0)],
                      $unsigned((wire31[(1'h1):(1'h1)] || wire35))};
  assign wire39 = $unsigned((wire32[(4'h9):(2'h2)] == wire38));
  always
    @(posedge clk) begin
      reg40 <= $unsigned((wire39[(2'h2):(2'h2)] ?
          wire33[(4'h8):(4'h8)] : $unsigned((&wire35))));
      if ($unsigned($signed(($signed((reg40 ? wire30 : (8'haa))) ?
          $unsigned($unsigned(wire38)) : reg40[(1'h0):(1'h0)]))))
        begin
          reg41 <= (((~($signed(reg40) ? $signed(wire39) : (^(8'hb2)))) ?
                  wire34[(3'h5):(3'h5)] : (+wire30)) ?
              $unsigned(($unsigned($signed((8'h9f))) ?
                  ($signed(wire30) ?
                      {wire37} : (^~wire30)) : (wire34[(1'h0):(1'h0)] < (^~wire30)))) : ($unsigned((^~wire33)) <<< (~&$unsigned($signed((8'hac))))));
          if (($unsigned((wire31 && $signed((!wire33)))) ?
              $signed($unsigned({{(8'hb4)}, wire35})) : $unsigned(reg40)))
            begin
              reg42 <= (~$signed(({(!wire39)} ?
                  (reg40[(2'h2):(2'h2)] ?
                      $signed((8'hba)) : ((8'hae) ^ wire31)) : reg41)));
              reg43 <= (~&$unsigned(wire35[(1'h0):(1'h0)]));
              reg44 <= (!(-(((~&wire33) < reg43) > wire36[(2'h2):(1'h0)])));
              reg45 <= $unsigned($signed((~^({wire38} ?
                  (-wire35) : (wire33 | wire34)))));
            end
          else
            begin
              reg42 <= $unsigned((wire37[(1'h0):(1'h0)] ?
                  (reg41[(3'h7):(3'h5)] + $signed((|reg41))) : $unsigned(((wire33 >>> wire38) ?
                      wire35 : $signed(wire31)))));
              reg43 <= ((({(wire37 <= wire36)} >>> reg42[(4'ha):(3'h4)]) != (wire38 && ({(8'hab)} << ((7'h40) * reg40)))) - wire31[(1'h1):(1'h0)]);
              reg44 <= $signed(wire37);
            end
          reg46 <= (^wire37);
        end
      else
        begin
          if ({wire37[(1'h1):(1'h0)]})
            begin
              reg41 <= $signed($unsigned((^~reg45[(4'h8):(3'h6)])));
              reg42 <= $unsigned((^wire39[(3'h4):(3'h4)]));
            end
          else
            begin
              reg41 <= ($unsigned($unsigned($unsigned({(8'ha8), wire31}))) ?
                  wire36[(1'h0):(1'h0)] : wire39);
              reg42 <= (reg42[(1'h0):(1'h0)] <<< (~$unsigned((~&wire34))));
              reg43 <= (^(wire30 > {{((8'h9d) ? (8'ha9) : (8'hb7))}}));
              reg44 <= ((reg40 ?
                  ((((8'h9e) < wire30) ?
                          ((8'hae) == wire37) : wire38[(3'h4):(2'h2)]) ?
                      wire39[(3'h4):(2'h3)] : $signed($unsigned(wire31))) : (wire37 ?
                      ((wire30 ?
                          wire32 : wire34) & $signed(wire34)) : $unsigned({reg44,
                          reg46}))) & ((reg42 ^~ {wire39[(1'h0):(1'h0)],
                      (reg44 ? (8'had) : (8'hbc))}) ?
                  wire34[(4'h8):(3'h7)] : ({(wire33 ?
                          wire37 : wire34)} ^ ((reg46 - reg41) ?
                      reg40[(2'h2):(1'h1)] : wire30[(3'h7):(1'h0)]))));
              reg45 <= {wire38};
            end
        end
      reg47 <= reg43;
      if (wire37[(1'h0):(1'h0)])
        begin
          reg48 <= wire31[(2'h2):(2'h2)];
          reg49 <= (|reg41[(4'h9):(3'h5)]);
          if ($signed(((-(reg40 ?
              $unsigned(wire33) : wire30)) || reg46[(5'h11):(3'h6)])))
            begin
              reg50 <= $signed(wire30);
              reg51 <= reg49;
            end
          else
            begin
              reg50 <= $unsigned(((~^((~wire35) + (wire31 << reg47))) - $signed($unsigned((wire34 ?
                  wire35 : reg46)))));
            end
        end
      else
        begin
          reg48 <= wire30;
          reg49 <= $unsigned(reg45[(3'h6):(1'h0)]);
          reg50 <= {(7'h43),
              ((-$unsigned(reg41[(2'h2):(2'h2)])) ?
                  reg49 : {wire31[(1'h1):(1'h0)],
                      (-(wire31 ? wire31 : reg48))})};
          reg51 <= $unsigned(wire37[(1'h0):(1'h0)]);
          reg52 <= reg43[(1'h1):(1'h0)];
        end
      reg53 <= ($unsigned((^(wire35[(1'h1):(1'h0)] < (+wire30)))) ?
          $signed(($unsigned(wire37[(2'h2):(1'h0)]) ?
              wire34 : ({wire33,
                  reg40} >= wire31))) : (~|$unsigned(($signed((8'ha0)) > ((8'hb2) ?
              wire35 : wire38)))));
    end
  always
    @(posedge clk) begin
      reg54 <= (|(+reg48[(1'h1):(1'h1)]));
      reg55 <= {({(+$signed(reg41))} || wire30),
          $unsigned(reg42[(1'h0):(1'h0)])};
      reg56 <= {wire37, {reg52[(2'h2):(1'h1)]}};
    end
  assign wire57 = $signed($signed(reg50));
  assign wire58 = ($signed((reg45 + reg44)) ? (8'h9f) : $unsigned(reg48));
  assign wire59 = $unsigned(wire31[(1'h0):(1'h0)]);
  assign wire60 = wire30[(3'h5):(2'h2)];
  assign wire61 = $unsigned($unsigned(wire59));
  module62 #() modinst78 (wire77, clk, wire30, reg43, reg55, reg44);
  module79 #() modinst95 (.wire82(reg56), .clk(clk), .y(wire94), .wire83(wire38), .wire81(wire37), .wire80(wire39));
  assign wire96 = ((8'ha2) ?
                      {reg54,
                          $unsigned((^~$signed(wire30)))} : reg41[(3'h5):(3'h4)]);
  assign wire97 = wire37[(3'h6):(3'h4)];
  module98 #() modinst157 (.wire100(reg52), .clk(clk), .wire103(reg48), .wire101(reg45), .y(wire156), .wire99(wire59), .wire102(reg44));
endmodule

module module8
#(parameter param23 = ((((((8'had) * (7'h41)) <= ((8'h9d) ^~ (8'hbe))) ? (^~((8'h9c) ? (8'h9c) : (7'h42))) : ({(8'hb1)} >= {(8'hbb)})) ? ((8'ha3) ? (((8'ha5) ? (8'hbd) : (8'hbb)) <= ((8'h9e) ? (8'hbf) : (8'hb5))) : (((8'ha6) ~^ (7'h40)) ? (~(7'h41)) : ((8'ha1) ? (8'ha5) : (8'hbc)))) : ((-(-(8'hae))) | ((8'hb9) ? (-(8'hbf)) : (~^(8'h9e))))) ^ {({((7'h42) ? (8'hb7) : (8'hac)), ((8'haa) & (8'hae))} ? (+((8'hbe) >> (8'h9d))) : (~(8'hab)))}), 
parameter param24 = (param23 ? (~({(param23 * param23)} ? ((param23 ? param23 : param23) || (|param23)) : ((7'h42) ? (param23 | param23) : (param23 >= param23)))) : ((param23 != (^(param23 ? param23 : param23))) != (8'hb5))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire14;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire14,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = (~&(~$unsigned({((7'h43) == wire9), wire11[(1'h0):(1'h0)]})));
  always
    @(posedge clk) begin
      reg15 <= (wire11[(3'h7):(2'h3)] ?
          $unsigned(wire9) : (~^$signed($unsigned((|(8'ha5))))));
      if ($signed(wire9[(2'h3):(2'h2)]))
        begin
          reg16 <= $signed(wire9);
        end
      else
        begin
          reg16 <= wire11;
          reg17 <= wire10;
        end
      reg18 <= (reg16 ^~ wire14[(3'h5):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg19 <= $unsigned({{reg18[(4'h9):(4'h9)]}});
      reg20 <= $unsigned($unsigned((8'hae)));
    end
  assign wire21 = (!$unsigned($unsigned((&reg20))));
  assign wire22 = (!$signed((((~^reg16) * ((8'hb4) * reg18)) ?
                      reg20[(3'h4):(1'h0)] : ($unsigned((8'ha6)) ?
                          wire14[(3'h7):(1'h1)] : $unsigned(wire9)))));
endmodule

module module98
#(parameter param154 = (8'haf), 
parameter param155 = param154)
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire103;
  input wire [(4'hd):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire153;
  wire [(3'h7):(1'h0)] wire150;
  wire signed [(4'he):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire signed [(3'h4):(1'h0)] wire147;
  wire signed [(3'h6):(1'h0)] wire146;
  wire signed [(3'h4):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire136;
  wire [(5'h12):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(4'he):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(2'h3):(1'h0)] reg106 = (1'h0);
  reg [(4'hd):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg104 = (1'h0);
  assign y = {wire153,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire136,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 reg152,
                 reg151,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 reg118,
                 reg117,
                 reg116,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg104 <= ((-($signed(wire101[(4'hb):(4'h8)]) == $signed((+wire103)))) <= wire101);
      reg105 <= {$unsigned((($signed(wire100) | {reg104, wire101}) ?
              (((8'ha7) ? reg104 : wire100) ?
                  wire99[(3'h4):(2'h2)] : (reg104 ?
                      wire102 : reg104)) : wire101[(1'h0):(1'h0)]))};
      reg106 <= ($signed($unsigned(wire102[(4'hc):(4'h8)])) >= $unsigned($unsigned((!$signed((8'h9f))))));
      reg107 <= reg105[(4'h9):(1'h0)];
    end
  assign wire108 = (8'ha5);
  assign wire109 = (~&wire100[(4'ha):(3'h7)]);
  assign wire110 = wire109[(4'hb):(4'ha)];
  assign wire111 = (({(wire99[(4'hb):(4'ha)] >= (reg105 ? wire99 : (8'h9f)))} ?
                           (^~(reg104 ? (^(7'h43)) : (+reg104))) : wire101) ?
                       $unsigned($unsigned(wire99[(2'h3):(1'h1)])) : $signed(reg104));
  assign wire112 = {wire108, $unsigned(reg105)};
  assign wire113 = (&wire103);
  assign wire114 = wire109[(4'h8):(1'h1)];
  assign wire115 = $unsigned((($signed({wire99,
                       wire108}) | wire109) <= (wire111[(1'h1):(1'h1)] ?
                       (8'ha1) : ((~^(8'h9d)) + $signed(wire103)))));
  always
    @(posedge clk) begin
      reg116 <= (^({($unsigned(wire113) ?
              wire102 : $unsigned(wire113))} >>> $signed(wire108)));
      if ($unsigned(($signed($unsigned($unsigned((8'h9c)))) ?
          $signed({$signed(wire112)}) : (&$unsigned((7'h40))))))
        begin
          reg117 <= wire102;
          reg118 <= reg106[(2'h2):(2'h2)];
          if ($unsigned(wire99[(4'h8):(2'h3)]))
            begin
              reg119 <= $unsigned(wire114[(4'h9):(3'h5)]);
              reg120 <= (reg106[(2'h2):(1'h0)] > $signed($signed({$signed(reg117),
                  {(8'hbd), wire108}})));
              reg121 <= (^$signed(($signed(reg119) ^ $unsigned({(8'hb5)}))));
              reg122 <= reg121[(2'h2):(2'h2)];
            end
          else
            begin
              reg119 <= $signed(((($signed(reg120) >= $signed(reg107)) && $signed(((8'ha8) ~^ (8'hac)))) * (^~((^~reg118) ?
                  reg121 : (8'hb3)))));
              reg120 <= $signed(((&reg106[(2'h2):(1'h0)]) + $signed($signed((reg120 | wire109)))));
              reg121 <= wire111[(3'h4):(2'h3)];
              reg122 <= (+(!$signed((8'haa))));
              reg123 <= $signed((wire101 + (~&(|wire111[(2'h3):(1'h0)]))));
            end
        end
      else
        begin
          if ({wire114[(4'ha):(3'h5)]})
            begin
              reg117 <= $signed(({$signed(wire111[(3'h6):(3'h4)])} <= $unsigned(($unsigned(wire110) ^ reg118[(4'hd):(2'h2)]))));
              reg118 <= ({$unsigned($unsigned((reg120 >> reg106)))} > reg104);
            end
          else
            begin
              reg117 <= (+(^{reg119[(3'h7):(1'h1)], reg118}));
              reg118 <= $signed(reg107);
            end
        end
      if ({{reg118, (~|$signed(reg122[(1'h0):(1'h0)]))}})
        begin
          reg124 <= {$unsigned(wire101), wire101[(1'h0):(1'h0)]};
          reg125 <= wire103[(1'h1):(1'h0)];
          reg126 <= $signed(reg106[(1'h1):(1'h0)]);
          if (wire109)
            begin
              reg127 <= (wire111[(2'h3):(2'h2)] ?
                  {(8'hba)} : wire111[(3'h7):(2'h3)]);
            end
          else
            begin
              reg127 <= (wire112 ?
                  (~^(reg121 ?
                      ({reg120} ^~ (+wire115)) : ((~^wire110) | (wire115 ?
                          reg105 : reg121)))) : $unsigned(wire115));
              reg128 <= reg120[(2'h2):(2'h2)];
              reg129 <= reg121[(2'h3):(2'h3)];
              reg130 <= (~|(^$unsigned($unsigned(wire103[(4'h8):(3'h7)]))));
              reg131 <= (($unsigned(((reg120 ? (8'haa) : wire113) <<< ((8'ha2) ?
                      reg130 : reg121))) ?
                  $unsigned(($signed(wire110) ?
                      $unsigned(reg107) : reg124)) : (($signed(wire108) ?
                      (wire115 << reg117) : $unsigned(reg129)) < reg105[(2'h2):(2'h2)])) && reg104[(3'h4):(1'h1)]);
            end
          if (reg120[(2'h3):(1'h1)])
            begin
              reg132 <= $signed(wire111);
              reg133 <= (8'hb4);
            end
          else
            begin
              reg132 <= reg130[(1'h1):(1'h0)];
              reg133 <= (wire110[(4'h9):(2'h3)] ?
                  (wire100 & (|reg116)) : (~($signed((~^reg105)) ?
                      wire100 : reg126[(2'h3):(1'h1)])));
            end
        end
      else
        begin
          if ($signed(reg129))
            begin
              reg124 <= (!((reg130[(3'h5):(2'h2)] - (^~$unsigned(wire101))) < ($unsigned($signed(reg133)) ^ wire101)));
              reg125 <= {reg123[(3'h5):(2'h2)]};
              reg126 <= reg127[(3'h6):(3'h5)];
              reg127 <= $unsigned((~^(|$signed({wire109}))));
            end
          else
            begin
              reg124 <= $signed({($signed($signed(reg116)) ?
                      (reg121 ?
                          (wire111 ?
                              wire113 : (8'hb5)) : $unsigned((8'h9e))) : wire110),
                  (^(~^{wire114, reg132}))});
              reg125 <= {(reg116[(5'h13):(4'h9)] ?
                      (((wire109 && reg131) && $unsigned(wire100)) ?
                          $signed($unsigned(wire99)) : (&$signed(wire114))) : reg107[(2'h3):(1'h0)]),
                  $signed(reg107[(1'h1):(1'h1)])};
              reg126 <= ((^($unsigned(wire99[(3'h7):(3'h6)]) >>> (wire103[(4'hc):(4'hb)] ?
                  $unsigned(reg126) : wire111[(1'h0):(1'h0)]))) ^~ reg106);
              reg127 <= reg119;
            end
        end
      reg134 <= (~(reg130 << $unsigned($unsigned({reg107, reg131}))));
      reg135 <= reg127[(3'h6):(3'h4)];
    end
  assign wire136 = reg117;
  always
    @(posedge clk) begin
      reg137 <= wire103;
      reg138 <= $unsigned(wire102);
      if (wire108)
        begin
          reg139 <= $signed($signed($unsigned(wire114)));
        end
      else
        begin
          reg139 <= reg130;
        end
    end
  always
    @(posedge clk) begin
      reg140 <= reg132;
      reg141 <= {$signed(reg124[(3'h5):(2'h2)])};
      reg142 <= {(!{($unsigned(reg141) ^~ reg126[(2'h3):(1'h1)])})};
      reg143 <= reg140;
      reg144 <= (({{(+wire115), reg126[(2'h2):(2'h2)]}} ?
          reg141[(5'h11):(3'h4)] : {(&(~^wire110))}) > $unsigned(wire115));
    end
  assign wire145 = $unsigned({(wire111 ?
                           ((reg133 - reg142) * (wire111 > wire115)) : (~^(reg106 == wire99))),
                       $signed((!(+reg133)))});
  assign wire146 = $unsigned($unsigned((&({wire145, reg118} >> wire111))));
  assign wire147 = $signed($unsigned(wire115[(3'h6):(1'h1)]));
  assign wire148 = $signed((~|((+wire115) ?
                       {$signed(wire103)} : $signed($unsigned((8'h9c))))));
  assign wire149 = ((($signed($unsigned(reg125)) ?
                       ($signed(wire146) | (wire109 ?
                           wire103 : reg116)) : (|wire146)) - $unsigned((((8'hb5) ^~ wire114) ?
                       (&reg140) : ((8'h9f) ?
                           reg144 : reg138)))) >= reg119[(1'h1):(1'h1)]);
  assign wire150 = $unsigned($signed(($unsigned((reg139 ?
                       reg119 : (8'ha7))) >> (-$signed((8'hb4))))));
  always
    @(posedge clk) begin
      reg151 <= $unsigned((($unsigned(reg125) << {{reg104}}) ?
          (^((reg141 >= (8'hb1)) || (!reg134))) : wire145));
      reg152 <= reg132;
    end
  assign wire153 = $signed(reg126);
endmodule

module module79
#(parameter param92 = ((~^{{(~|(7'h42)), ((7'h40) ^~ (8'hbb))}, ((8'hba) ? ((8'hac) ^ (8'hb3)) : (~(8'hbf)))}) + (((~|((8'ha0) == (8'hb7))) ? ((|(8'hb1)) ? ((8'ha1) ? (8'hb4) : (8'h9e)) : (8'hbc)) : ({(8'ha8)} ? (-(8'hbd)) : (8'hb7))) ? {(&((8'ha1) * (8'h9f)))} : {(~|((8'hbc) ? (8'hb2) : (8'haf)))})), 
parameter param93 = (&param92))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire83;
  input wire signed [(4'hc):(1'h0)] wire82;
  input wire [(4'h8):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire84 = (~^wire82);
  assign wire85 = ((+$signed(wire83[(3'h6):(2'h2)])) == wire83[(4'hb):(4'hb)]);
  always
    @(posedge clk) begin
      reg86 <= wire80;
      reg87 <= (~^($unsigned({$unsigned(wire82), $signed((8'hb7))}) & wire85));
    end
  assign wire88 = $unsigned($unsigned((($signed(wire85) ?
                      (!(8'ha3)) : ((8'ha6) ? wire81 : reg86)) <= wire81)));
  assign wire89 = wire82[(4'hc):(4'h9)];
  assign wire90 = ((8'haf) ?
                      reg87[(4'h9):(2'h2)] : (($unsigned(wire89) || $unsigned($signed(reg86))) == $signed(wire88)));
  assign wire91 = $signed((wire88[(5'h10):(3'h6)] ?
                      ($unsigned((wire81 ?
                          wire83 : reg87)) >> $unsigned($unsigned((8'ha6)))) : ($unsigned((!reg86)) << (~&(~wire82)))));
endmodule

module module62
#(parameter param75 = (^~(((((8'ha7) ? (8'hb4) : (8'had)) * {(8'hb3), (8'hae)}) ? (|(^(8'hb0))) : (((8'hb2) <= (7'h44)) ? ((8'ha4) ^ (8'ha9)) : (^(7'h42)))) ? ((((8'hb3) ? (8'ha2) : (8'haa)) < ((7'h41) != (8'haf))) < ({(8'hab)} >> (~(8'hb6)))) : {(-((8'hb1) ^~ (8'hab))), (((8'hb8) ? (8'hbe) : (7'h44)) ? ((7'h44) ? (8'ha4) : (8'hb0)) : (~^(8'hb2)))})), 
parameter param76 = (param75 & (((8'hb3) ? (8'h9d) : param75) < param75)))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire [(4'h8):(1'h0)] wire64;
  input wire signed [(4'hf):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 (1'h0)};
  assign wire67 = wire63[(3'h6):(1'h1)];
  assign wire68 = (wire67 ?
                      $signed($unsigned(($unsigned(wire67) ~^ (wire63 <<< wire66)))) : wire63[(3'h6):(2'h2)]);
  assign wire69 = $unsigned($signed($signed($unsigned(wire65[(2'h2):(1'h0)]))));
  assign wire70 = $unsigned((wire68 ?
                      {$signed((|wire65))} : wire64[(2'h3):(1'h1)]));
  assign wire71 = $unsigned(wire70[(3'h7):(1'h1)]);
  assign wire72 = (wire70[(3'h7):(3'h6)] ?
                      (8'ha6) : $unsigned($signed(wire68)));
  assign wire73 = (!(~&((wire72[(4'hc):(3'h4)] ?
                      wire70[(1'h1):(1'h0)] : wire70[(4'hb):(1'h0)]) - wire65[(4'hf):(4'h8)])));
  assign wire74 = {wire63,
                      (wire65[(4'h9):(3'h7)] ?
                          $unsigned((+$unsigned(wire72))) : ($signed(wire70[(4'hc):(4'h8)]) ?
                              (~&{wire67, wire64}) : (~&$signed((8'h9d)))))};
endmodule
