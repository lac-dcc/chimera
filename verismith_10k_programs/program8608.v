module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h133):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire202;
  wire signed [(5'h11):(1'h0)] wire201;
  wire [(3'h7):(1'h0)] wire173;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire175;
  wire signed [(5'h12):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire194;
  wire signed [(5'h15):(1'h0)] wire196;
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg199 = (1'h0);
  reg [(4'he):(1'h0)] reg198 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire173,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire175,
                 wire176,
                 wire177,
                 wire194,
                 wire196,
                 reg200,
                 reg199,
                 reg198,
                 (1'h0)};
  assign wire5 = $signed(wire3);
  assign wire6 = (wire2 & (((^~{wire3}) ?
                         wire4[(3'h5):(3'h5)] : wire0[(4'ha):(4'h8)]) ?
                     (&$unsigned((wire1 ? wire4 : wire4))) : wire3));
  assign wire7 = (wire0[(3'h5):(2'h3)] ?
                     $signed($unsigned($unsigned(wire5))) : ((|$unsigned((|wire4))) & (|wire6)));
  assign wire8 = $unsigned({$unsigned((^~(&wire6)))});
  assign wire9 = (wire6 >> wire8[(3'h5):(1'h0)]);
  assign wire10 = {(~{$unsigned((wire5 || wire9)),
                          ($unsigned(wire0) && wire0[(2'h3):(1'h0)])}),
                      $unsigned($unsigned((!wire6[(1'h1):(1'h1)])))};
  assign wire11 = (wire6 || $unsigned(wire4));
  assign wire12 = wire9[(4'hd):(2'h2)];
  assign wire13 = ($signed((~(^~$unsigned(wire10)))) ?
                      $signed((((wire2 > wire5) == {(8'ha0), wire9}) ?
                          ((wire7 ^~ wire7) ?
                              $signed((8'h9d)) : wire2[(4'hd):(4'hc)]) : $unsigned($signed(wire9)))) : wire6[(3'h4):(1'h0)]);
  assign wire14 = ($unsigned(wire1) && wire0[(4'hd):(3'h4)]);
  assign wire15 = {wire4[(1'h0):(1'h0)], wire0};
  assign wire16 = ((((wire13 <= $unsigned(wire9)) ?
                      ($signed((8'ha1)) ?
                          (~^(8'hb7)) : (wire9 * (8'haa))) : (|wire4[(3'h6):(2'h2)])) && (~&$signed({wire10,
                      wire6}))) >= wire5);
  module17 #() modinst174 (wire173, clk, wire3, wire8, wire15, wire10, wire0);
  assign wire175 = wire12[(2'h2):(1'h0)];
  assign wire176 = wire10;
  assign wire177 = (^~($signed(($signed(wire14) + {(8'hab)})) * (wire175 && ((8'hb2) >>> {wire4}))));
  module178 #() modinst195 (.clk(clk), .wire179(wire6), .wire180(wire175), .wire181(wire13), .wire182(wire5), .y(wire194));
  module79 #() modinst197 (wire196, clk, wire0, wire176, wire14, wire194, wire13);
  always
    @(posedge clk) begin
      if (($signed({{wire12}, ({wire2} != (~&wire7))}) < wire14[(3'h7):(1'h1)]))
        begin
          if (((((+wire7[(2'h2):(1'h1)]) <<< {$unsigned(wire173),
                  $unsigned((8'ha0))}) ?
              $signed(($unsigned((8'hbe)) << (-wire1))) : $signed(wire173)) && ($signed((^((8'ha7) || wire175))) ~^ ($signed($unsigned(wire0)) ^ wire13[(3'h6):(2'h2)]))))
            begin
              reg198 <= wire14;
              reg199 <= $unsigned((&(!$unsigned((wire196 ? wire5 : (8'ha2))))));
              reg200 <= ({$signed((wire3 != (7'h41))),
                      (wire3[(5'h11):(3'h5)] == {$signed(wire196),
                          ((8'hba) <<< wire2)})} ?
                  ($signed($signed((wire175 ? wire7 : wire194))) ?
                      ($signed($unsigned(wire14)) ?
                          ($signed((8'ha4)) | wire9) : {wire0,
                              wire14}) : ((~|wire2[(5'h10):(3'h6)]) ?
                          reg199[(3'h5):(1'h0)] : wire12[(1'h1):(1'h0)])) : ($unsigned(((8'hbb) ?
                          (wire15 && wire8) : (~wire177))) ?
                      $unsigned($signed({wire6})) : $unsigned(($unsigned((8'hb6)) ?
                          (wire4 > wire8) : {wire5}))));
            end
          else
            begin
              reg198 <= $signed((8'ha8));
            end
        end
      else
        begin
          reg198 <= reg199;
          reg199 <= (~(~$unsigned((^(|wire177)))));
          if ($signed({$unsigned($signed((wire0 >= wire16)))}))
            begin
              reg200 <= (wire12 ?
                  $signed((wire15[(1'h0):(1'h0)] * ($signed(wire8) ?
                      $signed(wire177) : (wire7 ?
                          (8'had) : wire173)))) : ((!{{wire2, wire14}}) ?
                      $signed((((8'ha4) ? wire177 : wire0) ?
                          $unsigned(wire14) : $unsigned(wire13))) : {wire1[(4'h9):(3'h5)]}));
            end
          else
            begin
              reg200 <= wire176;
            end
        end
    end
  assign wire201 = $unsigned(wire13);
  assign wire202 = wire14[(3'h4):(2'h2)];
endmodule

module module178  (y, clk, wire182, wire181, wire180, wire179);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire182;
  input wire signed [(5'h11):(1'h0)] wire181;
  input wire signed [(4'hb):(1'h0)] wire180;
  input wire signed [(5'h11):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire193;
  wire signed [(4'hc):(1'h0)] wire188;
  wire [(2'h2):(1'h0)] wire187;
  wire signed [(4'hd):(1'h0)] wire186;
  wire signed [(3'h5):(1'h0)] wire185;
  wire signed [(3'h6):(1'h0)] wire184;
  wire [(5'h14):(1'h0)] wire183;
  reg [(4'he):(1'h0)] reg192 = (1'h0);
  reg [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg189 = (1'h0);
  assign y = {wire193,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 (1'h0)};
  assign wire183 = wire179;
  assign wire184 = ($signed(wire182) ^ wire181);
  assign wire185 = (~^((~^(~wire179[(3'h4):(1'h1)])) != wire183[(5'h14):(3'h7)]));
  assign wire186 = {((wire182 ?
                               wire179 : ({(8'hb6), wire185} & (wire183 ?
                                   wire182 : wire185))) ?
                           $unsigned($unsigned($signed((8'hbd)))) : wire180)};
  assign wire187 = wire183;
  assign wire188 = $unsigned({(~$signed((8'hbd))), wire181[(1'h0):(1'h0)]});
  always
    @(posedge clk) begin
      reg189 <= {(wire183 ~^ wire186[(2'h2):(1'h0)]),
          $unsigned(wire182[(4'ha):(1'h0)])};
      reg190 <= (~|({$signed((wire186 ^~ wire184)),
          $unsigned((wire184 ?
              (8'hb5) : wire186))} > $signed(reg189[(4'hb):(3'h4)])));
      reg191 <= $signed((wire179 > {$unsigned((!wire187))}));
      reg192 <= wire180[(1'h0):(1'h0)];
    end
  assign wire193 = wire185[(1'h0):(1'h0)];
endmodule

module module17
#(parameter param171 = ((((((8'ha3) <<< (8'hb6)) ? ((8'ha8) ? (8'hac) : (8'hb5)) : ((8'ha5) - (8'hac))) ? (((8'hb3) ? (8'ha5) : (8'hab)) ? ((8'had) == (8'hbf)) : (!(8'hb4))) : (((8'hb0) ~^ (8'ha3)) ? ((8'hb0) >= (8'h9e)) : (!(7'h41)))) ? (8'ha8) : {(&{(8'hbf)}), (((8'h9c) >> (8'ha0)) - (^(7'h41)))}) ? (({((8'ha9) ? (8'hab) : (8'hb3)), (~(8'hbf))} ? (((8'h9e) ? (7'h43) : (8'hbe)) >> ((8'ha0) && (7'h40))) : (8'haf)) ? {(~((8'hba) >>> (8'ha2)))} : (+(((7'h41) << (8'hbc)) ? (~|(8'h9f)) : (8'hb2)))) : (~&(8'hb4))), 
parameter param172 = (&param171))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(5'h15):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire [(5'h13):(1'h0)] wire168;
  wire signed [(4'h9):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire166;
  wire [(4'h9):(1'h0)] wire165;
  wire [(3'h5):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire108;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire110,
                 wire74,
                 wire76,
                 wire77,
                 wire78,
                 wire108,
                 (1'h0)};
  module23 #() modinst75 (wire74, clk, wire18, wire21, wire19, wire22, wire20);
  assign wire76 = (-wire21);
  assign wire77 = (wire76 <= $unsigned({wire18}));
  assign wire78 = wire20[(3'h4):(1'h0)];
  module79 #() modinst109 (.y(wire108), .wire84(wire22), .wire83(wire18), .wire81(wire21), .clk(clk), .wire80(wire76), .wire82(wire20));
  assign wire110 = (~^$unsigned(wire108[(5'h13):(4'hd)]));
  module111 #() modinst164 (wire163, clk, wire76, wire108, wire110, wire21);
  assign wire165 = (&$unsigned({wire78, (8'had)}));
  assign wire166 = wire110;
  assign wire167 = $unsigned(wire78[(5'h10):(3'h6)]);
  assign wire168 = {wire78[(4'h8):(2'h2)]};
  assign wire169 = wire110[(1'h1):(1'h0)];
  assign wire170 = $unsigned($signed($unsigned(wire20)));
endmodule

module module111
#(parameter param161 = ((~^((+((8'hb3) ? (8'h9f) : (8'hb5))) >> {((8'ha9) ? (8'hb4) : (8'ha2)), {(8'h9d), (7'h43)}})) - ({(((8'haf) ? (8'hae) : (8'ha4)) ? ((8'had) ? (8'hb2) : (8'haa)) : ((8'h9c) ? (8'hbc) : (8'hbb))), ((7'h43) >= (^~(8'hb5)))} ? ({(^~(8'hb5))} == (((8'hb7) ? (8'ha5) : (8'haf)) ? {(7'h41), (8'hbe)} : ((8'ha5) <= (7'h40)))) : (7'h43))), 
parameter param162 = (({(^~(&param161)), ({param161, param161} ? {param161, param161} : param161)} ? ((!param161) ? (8'ha4) : param161) : ((((8'ha0) ? param161 : param161) * {(8'hb8), param161}) ? (~^param161) : param161)) ? ((^(param161 + (param161 >> param161))) >>> param161) : ((param161 * (param161 & {param161, param161})) ^ ({(param161 ? param161 : param161), (param161 | (8'hb1))} < param161))))
(y, clk, wire115, wire114, wire113, wire112);
  output wire [(32'h1d5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire115;
  input wire signed [(4'he):(1'h0)] wire114;
  input wire signed [(4'hb):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire160;
  wire [(3'h7):(1'h0)] wire159;
  wire signed [(4'hc):(1'h0)] wire158;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(3'h5):(1'h0)] wire133;
  wire signed [(4'hd):(1'h0)] wire132;
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
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
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire113)
        begin
          if (wire115[(1'h1):(1'h1)])
            begin
              reg116 <= $signed(wire113[(3'h4):(3'h4)]);
              reg117 <= wire115[(2'h2):(1'h1)];
            end
          else
            begin
              reg116 <= $signed($unsigned($unsigned(((reg117 ?
                  reg116 : wire115) > reg117))));
              reg117 <= (~(&(|(((8'hbe) ~^ wire112) < (-wire115)))));
              reg118 <= (((($signed(wire114) ?
                      reg117[(3'h4):(1'h0)] : (wire115 ?
                          wire114 : reg117)) && ((reg117 & wire112) ?
                      (&reg116) : $signed(wire113))) >>> (((reg117 ?
                          (8'ha3) : (8'hb8)) ?
                      $unsigned((8'hb8)) : $signed(wire112)) * (|(~|wire113)))) ?
                  $signed({wire113}) : wire115);
            end
          if ((($unsigned({(wire114 ? wire112 : reg116)}) ?
              wire114 : $unsigned(reg116)) * reg117))
            begin
              reg119 <= (reg117[(3'h4):(1'h1)] ? wire114 : wire115);
              reg120 <= (+reg118);
              reg121 <= reg118;
              reg122 <= reg119[(3'h4):(1'h0)];
            end
          else
            begin
              reg119 <= $unsigned((reg121 ?
                  $signed((^~$unsigned(wire112))) : $signed({reg119[(2'h2):(2'h2)],
                      $signed(reg121)})));
              reg120 <= $unsigned(reg118);
              reg121 <= wire115[(3'h4):(2'h3)];
            end
          if (wire114[(4'ha):(3'h5)])
            begin
              reg123 <= (((reg122[(3'h6):(2'h2)] ?
                      ($signed(wire112) ?
                          reg116 : $unsigned(wire113)) : (&reg122[(3'h7):(3'h6)])) ?
                  (8'ha6) : $signed($signed(wire112))) << $signed($unsigned(reg119[(3'h7):(1'h1)])));
              reg124 <= (wire115 ?
                  reg117[(3'h4):(3'h4)] : $unsigned($unsigned($signed((~&wire114)))));
              reg125 <= $unsigned($signed((8'hb2)));
            end
          else
            begin
              reg123 <= wire112[(3'h4):(3'h4)];
              reg124 <= {reg120};
              reg125 <= $signed(((((-(8'hb4)) > (reg120 ? wire113 : (8'h9c))) ?
                      ((^wire112) ?
                          {reg124,
                              (8'ha6)} : reg121[(1'h0):(1'h0)]) : wire114) ?
                  (~^(^{wire112, reg122})) : $unsigned(reg117)));
              reg126 <= reg119[(1'h0):(1'h0)];
              reg127 <= $signed((reg123[(1'h1):(1'h1)] + reg120[(4'hb):(3'h7)]));
            end
        end
      else
        begin
          reg116 <= reg116;
          reg117 <= ({$unsigned({{(8'ha0), (8'h9e)}, $signed((7'h43))}),
              ((~$unsigned(reg116)) ?
                  reg124[(3'h5):(3'h4)] : $unsigned((reg120 || reg125)))} | reg118[(4'h8):(3'h5)]);
        end
      if (((reg116[(1'h1):(1'h1)] | (((&reg124) == (&reg116)) ?
              {reg122[(3'h7):(3'h5)]} : reg122)) ?
          reg116 : reg124[(3'h4):(2'h3)]))
        begin
          reg128 <= ((&(^~(reg123 - reg116[(3'h7):(2'h2)]))) ?
              (~|$unsigned(wire112[(2'h2):(2'h2)])) : reg117);
          reg129 <= reg124[(3'h4):(3'h4)];
          reg130 <= ((wire113[(3'h5):(1'h0)] ? reg126[(2'h2):(2'h2)] : reg122) ?
              (8'had) : {(reg119[(3'h5):(2'h3)] ^~ wire114)});
          reg131 <= $signed({reg120});
        end
      else
        begin
          reg128 <= reg124;
          reg129 <= $unsigned((^~(reg130[(4'ha):(3'h4)] <<< reg119)));
        end
    end
  assign wire132 = reg117[(3'h4):(3'h4)];
  assign wire133 = $unsigned(((~|$unsigned((reg127 ?
                       reg122 : reg127))) | (reg124 ?
                       (~^(^reg116)) : (^~$unsigned(reg118)))));
  assign wire134 = ($signed(reg127[(1'h1):(1'h1)]) == $signed($unsigned($signed(reg117))));
  assign wire135 = (reg119 * $unsigned((~|(reg127[(1'h1):(1'h0)] ?
                       $unsigned(wire132) : reg130[(5'h14):(5'h10)]))));
  assign wire136 = $unsigned(reg131);
  always
    @(posedge clk) begin
      if ($signed($unsigned(wire135[(2'h2):(1'h1)])))
        begin
          reg137 <= (wire115[(2'h3):(2'h3)] || (&wire113));
          reg138 <= $signed((reg120 | (8'ha9)));
          reg139 <= $unsigned(wire114[(4'hc):(2'h2)]);
          reg140 <= $unsigned(reg119[(2'h2):(1'h1)]);
          if ((reg125 ?
              {reg116, {reg118[(1'h0):(1'h0)]}} : $signed({{(wire134 ?
                          reg119 : reg139),
                      $unsigned((8'hbe))},
                  reg130[(3'h5):(3'h5)]})))
            begin
              reg141 <= (!{$unsigned(reg117), reg126[(2'h3):(1'h1)]});
              reg142 <= (reg117[(2'h3):(2'h2)] ?
                  {reg138[(3'h5):(2'h2)]} : ($signed(($unsigned(reg138) >> (!reg122))) ?
                      $signed({$unsigned(reg130)}) : $signed(wire134)));
              reg143 <= (+reg130);
              reg144 <= $signed(reg126);
              reg145 <= (wire133[(2'h3):(1'h1)] ?
                  $unsigned($unsigned((reg140[(4'he):(3'h5)] ?
                      (~&reg126) : reg122))) : (reg122 ?
                      $signed(reg128[(3'h6):(2'h3)]) : ((reg142 || (~reg128)) ?
                          wire135 : (!reg121[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg141 <= $signed((8'hb5));
            end
        end
      else
        begin
          reg137 <= ((reg143[(2'h2):(1'h0)] ?
              $signed((8'haf)) : ((((8'hab) ? reg120 : reg124) ?
                      (reg144 ? reg130 : wire133) : (8'h9d)) ?
                  $unsigned((!(8'ha8))) : {(reg119 + reg124)})) - $unsigned($signed($unsigned(reg138[(4'h8):(3'h7)]))));
          reg138 <= ((-reg116[(3'h4):(1'h0)]) ^~ {reg145[(4'h9):(1'h1)]});
          if (reg118)
            begin
              reg139 <= ((-$signed((^(wire113 ? wire113 : reg128)))) ?
                  wire112[(1'h0):(1'h0)] : $unsigned(((&(~&reg123)) ?
                      (reg121[(1'h1):(1'h1)] ?
                          (wire134 ?
                              reg127 : reg145) : $signed((8'hbc))) : $unsigned((reg130 ?
                          (8'hbc) : reg139)))));
              reg140 <= wire112;
            end
          else
            begin
              reg139 <= $signed($signed((^(+(8'ha1)))));
              reg140 <= reg128[(3'h6):(1'h0)];
            end
        end
      if ((~&$unsigned(reg118[(1'h0):(1'h0)])))
        begin
          reg146 <= ((~^reg116) < {((8'ha4) != wire114),
              (|wire132[(2'h3):(2'h3)])});
          if ($signed((-(&(wire115 ?
              reg140[(3'h5):(1'h0)] : $unsigned(reg131))))))
            begin
              reg147 <= $signed((-(wire135 ?
                  $unsigned((reg138 ^ (8'ha9))) : (~reg142[(3'h7):(3'h7)]))));
              reg148 <= (~&$unsigned($unsigned(reg131[(4'hd):(3'h5)])));
              reg149 <= $unsigned($signed((((reg126 ?
                  reg124 : reg126) > $signed(wire136)) && (7'h43))));
              reg150 <= (((reg122 ?
                  reg140 : reg143) * $unsigned(($unsigned(reg127) <<< $unsigned(reg149)))) > ((~|((wire114 ?
                      (8'hba) : wire112) || (^reg142))) ?
                  ((!$signed(reg131)) <= wire114) : (^$unsigned((reg138 ?
                      reg146 : reg129)))));
              reg151 <= wire135[(2'h2):(1'h1)];
            end
          else
            begin
              reg147 <= reg119[(3'h4):(3'h4)];
              reg148 <= reg147[(2'h3):(1'h0)];
              reg149 <= reg148[(4'hc):(1'h0)];
              reg150 <= $unsigned(reg137[(4'h9):(4'h9)]);
            end
          reg152 <= (^~($signed($signed($unsigned(reg144))) & {reg119}));
          reg153 <= $signed(reg150);
          reg154 <= $signed($signed((~(((8'hbf) ? wire115 : (8'h9e)) ?
              $unsigned(reg146) : (reg141 ? wire114 : (8'hbb))))));
        end
      else
        begin
          reg146 <= $signed(reg145[(4'ha):(4'h9)]);
          reg147 <= (-(~&$signed((reg145[(4'hd):(3'h5)] ?
              ((8'hab) ? reg146 : (8'hb3)) : $signed(reg121)))));
        end
      reg155 <= (reg153 >= $signed($signed($unsigned($unsigned(reg119)))));
    end
  always
    @(posedge clk) begin
      reg156 <= $unsigned(reg141[(3'h4):(1'h0)]);
      reg157 <= reg120;
    end
  assign wire158 = ((^~(~^reg137)) ^~ (~|(-$unsigned($signed(reg139)))));
  assign wire159 = {$signed((((reg118 < (8'h9e)) ?
                               (reg151 && (8'h9e)) : wire135[(2'h2):(2'h2)]) ?
                           (~^$signed(reg125)) : {$unsigned(wire113),
                               wire158[(2'h2):(2'h2)]})),
                       wire113[(2'h2):(1'h1)]};
  assign wire160 = ({reg147[(3'h4):(3'h4)], (&(|reg152[(3'h5):(1'h1)]))} ?
                       (reg151 ?
                           {{(reg153 && wire114), (!wire159)},
                               (^wire159[(2'h3):(1'h1)])} : (reg139 ?
                               reg130[(5'h15):(3'h4)] : (+reg125[(3'h4):(2'h2)]))) : {{reg140[(4'he):(3'h4)],
                               (wire133[(3'h4):(2'h3)] ?
                                   (reg122 == reg118) : reg120)},
                           wire132});
endmodule

module module79  (y, clk, wire84, wire83, wire82, wire81, wire80);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  input wire [(3'h4):(1'h0)] wire82;
  input wire signed [(5'h11):(1'h0)] wire81;
  input wire signed [(5'h12):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire [(3'h4):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire85;
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire107,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 reg106,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire85 = wire80;
  assign wire86 = $unsigned((~|(!(^~wire84))));
  assign wire87 = {$signed((|(wire84 || (wire82 ? wire82 : wire81)))), wire86};
  assign wire88 = $unsigned($unsigned((8'hb5)));
  assign wire89 = (^(8'h9d));
  assign wire90 = wire88[(1'h0):(1'h0)];
  assign wire91 = (($signed($unsigned($unsigned((8'hb5)))) << ((^~wire87[(5'h10):(4'h8)]) ~^ (7'h41))) ?
                      $unsigned(wire86) : (8'hae));
  always
    @(posedge clk) begin
      reg92 <= $unsigned((!(^wire90)));
      reg93 <= (wire80 ?
          (^(wire86[(1'h1):(1'h1)] + {(wire82 >> wire86),
              wire81})) : $signed(($unsigned((wire91 && wire80)) ?
              (!$unsigned(wire91)) : $signed(wire86))));
      if (wire83[(1'h1):(1'h0)])
        begin
          reg94 <= (reg92[(4'h8):(1'h1)] ? reg93[(4'hd):(1'h1)] : (^~wire87));
          reg95 <= wire82[(2'h2):(2'h2)];
          reg96 <= ((reg92 ?
              {{(wire80 ? wire81 : reg93),
                      $signed(reg95)}} : ((reg94[(3'h4):(2'h3)] * (wire83 ?
                      wire88 : (7'h44))) ?
                  ((reg95 | wire89) ?
                      $unsigned(wire83) : ((8'hb1) <= wire87)) : (~&{(8'ha7),
                      wire83}))) & wire84[(1'h0):(1'h0)]);
          reg97 <= $unsigned(wire83[(4'hd):(3'h5)]);
        end
      else
        begin
          if ($unsigned(reg93))
            begin
              reg94 <= ($signed((8'h9d)) ?
                  (wire80[(4'hf):(2'h2)] <<< (($signed(wire80) > (wire85 ?
                          wire83 : reg93)) ?
                      {$signed(reg94)} : {$signed(wire91),
                          $unsigned(wire82)})) : wire89[(1'h0):(1'h0)]);
              reg95 <= ({$unsigned((wire91[(3'h4):(2'h3)] ?
                      (reg93 << wire86) : wire91))} || ({$unsigned(wire82)} - wire84[(3'h5):(3'h5)]));
              reg96 <= reg92;
              reg97 <= (((wire89[(1'h1):(1'h1)] <<< (8'ha2)) ?
                      wire85[(3'h5):(2'h2)] : $signed($signed($signed(wire83)))) ?
                  wire85[(1'h0):(1'h0)] : (~&(((wire91 - wire88) ?
                      $unsigned(wire81) : wire86[(2'h2):(1'h0)]) >> $signed(wire84[(2'h3):(2'h3)]))));
              reg98 <= (8'hb7);
            end
          else
            begin
              reg94 <= wire88[(1'h0):(1'h0)];
              reg95 <= $signed(wire83);
            end
        end
      reg99 <= ((wire85[(2'h3):(2'h2)] ?
          {$unsigned(((8'hb5) < wire84))} : (wire83[(4'ha):(3'h4)] ?
              {(reg92 ? reg93 : (8'hbc)),
                  wire82[(1'h0):(1'h0)]} : (8'hb0))) ^ (!$unsigned((reg97 ?
          $unsigned(wire84) : $signed(wire91)))));
      reg100 <= $signed((-$unsigned({wire81[(1'h1):(1'h0)],
          $signed((8'hba))})));
    end
  assign wire101 = $signed((-wire88));
  assign wire102 = ((($unsigned($unsigned(wire83)) ?
                           $unsigned(reg98[(1'h0):(1'h0)]) : $signed($signed(reg99))) ?
                       wire82[(1'h0):(1'h0)] : $signed($signed((wire81 >= wire85)))) >= {(reg97 ?
                           reg94 : wire90)});
  assign wire103 = (!((wire88 > $signed(reg95)) ?
                       wire83[(4'hc):(4'hb)] : wire86));
  assign wire104 = (!$signed((~|wire81)));
  assign wire105 = $unsigned($unsigned((~&$unsigned(reg97))));
  always
    @(posedge clk) begin
      reg106 <= (wire83 ?
          $unsigned((8'h9c)) : $signed((~^$signed((wire105 & wire102)))));
    end
  assign wire107 = reg92;
endmodule

module module23
#(parameter param72 = ((~&(((&(8'ha9)) ? (^(8'ha9)) : ((8'hb8) ? (8'ha6) : (8'ha0))) ? ({(8'hbe)} >= ((8'ha5) - (8'hb8))) : {(~&(8'ha0)), (^~(8'hbe))})) <<< (~&((|((8'ha5) ? (8'hbe) : (8'hb9))) >= ((-(8'hbc)) >>> (-(8'haf)))))), 
parameter param73 = param72)
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(3'h7):(1'h0)] wire27;
  input wire signed [(3'h6):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire50;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  assign y = {wire71,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire50,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire30,
                 wire29,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = wire27;
  assign wire30 = $signed({(($unsigned(wire28) <= $unsigned(wire24)) ?
                          $unsigned(wire28[(4'hf):(4'hc)]) : $signed($signed((8'hb0))))});
  always
    @(posedge clk) begin
      reg31 <= $signed($unsigned((-(!(wire30 ? (8'hb5) : wire24)))));
      if (wire26[(3'h6):(2'h3)])
        begin
          reg32 <= wire29;
          reg33 <= (~|$signed((((wire27 <= wire27) ? wire27 : $signed(wire29)) ?
              wire25 : (8'hbb))));
          reg34 <= (-($signed((reg31 || (wire27 && (8'h9c)))) || wire29));
          reg35 <= (reg33 ?
              $signed(wire25[(1'h0):(1'h0)]) : reg34[(4'h9):(4'h8)]);
        end
      else
        begin
          reg32 <= $signed((&$signed(((wire27 ? reg32 : wire30) ?
              (reg34 ? wire30 : reg32) : (reg32 * (8'hab))))));
          if (wire30)
            begin
              reg33 <= (~|(~reg34));
              reg34 <= $signed({$signed(reg34[(1'h1):(1'h0)])});
            end
          else
            begin
              reg33 <= $signed($signed({(reg34[(1'h0):(1'h0)] | (wire28 ?
                      (8'h9d) : wire24)),
                  reg32}));
              reg34 <= (wire29 ? reg31 : (+((^wire25) + wire24)));
              reg35 <= reg34;
              reg36 <= wire25;
              reg37 <= (|(((8'h9e) > ($signed(reg35) ?
                      $signed(reg32) : $signed((8'ha6)))) ?
                  {wire30,
                      wire26[(2'h2):(1'h1)]} : {$unsigned(wire30[(1'h0):(1'h0)]),
                      ((wire25 ? wire24 : wire26) ?
                          (wire27 ?
                              (8'ha1) : wire25) : reg35[(3'h4):(1'h0)])}));
            end
          reg38 <= (wire29 >= $signed($unsigned((reg34 ?
              (reg31 ? wire27 : reg35) : $signed(wire30)))));
        end
      reg39 <= reg36;
    end
  assign wire40 = (reg33[(1'h0):(1'h0)] ?
                      (reg32[(4'he):(4'h9)] ?
                          {(~|$signed((8'h9c))),
                              ((8'hb2) ?
                                  (~^wire24) : $signed(reg34))} : reg39) : $unsigned(wire24[(4'h9):(3'h6)]));
  assign wire41 = $unsigned($signed({wire24,
                      ($unsigned(reg32) ? (&wire40) : reg32)}));
  assign wire42 = $signed(((+wire40) ?
                      reg31 : $signed(($unsigned(wire40) >>> reg33))));
  assign wire43 = wire27[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg44 <= (~((((wire25 ~^ reg36) ? wire24 : $signed(wire29)) == wire28) ?
          (wire29[(2'h3):(2'h2)] ?
              wire26 : ({(8'haa), reg38} == $unsigned((7'h40)))) : reg37));
    end
  always
    @(posedge clk) begin
      if (wire41[(3'h4):(3'h4)])
        begin
          reg45 <= (8'hb7);
        end
      else
        begin
          reg45 <= ($unsigned($unsigned(reg39[(2'h2):(2'h2)])) ?
              $signed(($unsigned(reg37) ?
                  $signed((reg31 ? reg35 : (8'hb8))) : {reg32,
                      $unsigned((8'ha7))})) : (^reg33[(1'h0):(1'h0)]));
          reg46 <= {(~&(~^$unsigned(reg36)))};
          reg47 <= wire26[(3'h6):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      reg48 <= reg38[(2'h3):(2'h2)];
      reg49 <= reg32;
    end
  assign wire50 = $signed(reg47);
  always
    @(posedge clk) begin
      reg51 <= $unsigned(($unsigned({$signed(wire42)}) ?
          ({$signed(wire25)} ~^ $unsigned($signed(reg34))) : reg35));
      if (((-wire26) ^~ ($unsigned((-{reg36, reg45})) - wire28)))
        begin
          if ((-{(((reg34 ? (8'haf) : wire24) ?
                      (wire42 ? reg31 : reg44) : reg51[(5'h13):(2'h3)]) ?
                  ($unsigned(reg37) ? reg38 : (~|wire25)) : ((~|reg45) ?
                      $signed((8'hb8)) : wire29)),
              $signed(({(8'hac), (8'ha6)} ^~ (wire26 ? reg36 : (8'hb5))))}))
            begin
              reg52 <= {wire30,
                  ((reg51 ? wire50[(3'h5):(2'h2)] : reg48) ?
                      $signed(((reg47 & (8'hb2)) ^ $signed(reg31))) : $signed($unsigned(reg49[(3'h4):(2'h3)])))};
              reg53 <= reg52[(4'hf):(3'h6)];
              reg54 <= $unsigned(wire29[(1'h1):(1'h0)]);
            end
          else
            begin
              reg52 <= (^((((reg54 ?
                  reg33 : reg34) + (wire42 >> wire24)) ^ ((reg37 | reg37) >> reg45)) - (^~({wire27,
                  reg33} ^ $unsigned(reg35)))));
              reg53 <= (($unsigned(reg38[(1'h0):(1'h0)]) ?
                      reg47[(1'h0):(1'h0)] : $signed((~|(8'ha8)))) ?
                  $unsigned(({(^~(8'h9d))} >= (~$unsigned(wire30)))) : $unsigned($signed(wire42[(3'h7):(3'h4)])));
              reg54 <= wire50;
            end
          reg55 <= ((~$signed((^$signed(wire41)))) ?
              $signed($unsigned(reg32[(2'h3):(1'h0)])) : {$unsigned($signed((~^reg54))),
                  $signed($unsigned((reg38 ? wire50 : wire28)))});
        end
      else
        begin
          if ((reg55[(4'hc):(4'h8)] - ({$unsigned(((8'ha8) ?
                      wire42 : (8'hbd)))} ?
              {wire50} : $signed($unsigned(reg54[(1'h0):(1'h0)])))))
            begin
              reg52 <= (~(reg46 ?
                  (((^wire28) && (reg49 ? reg51 : reg52)) ?
                      wire30[(3'h5):(2'h2)] : reg51) : $signed($signed($signed(reg36)))));
              reg53 <= (^{(($signed(reg45) ?
                          (reg47 ? reg48 : wire29) : (wire41 ? reg36 : reg34)) ?
                      ($unsigned(reg54) ?
                          reg54[(4'h8):(3'h7)] : wire28) : $signed((~^wire28)))});
            end
          else
            begin
              reg52 <= (|reg51[(5'h14):(5'h11)]);
              reg53 <= ((reg49 ? reg53 : $signed($signed(reg49))) ?
                  reg32[(4'hf):(4'he)] : (wire50 != $signed(reg39[(3'h5):(2'h2)])));
            end
          reg54 <= wire28;
          reg55 <= {wire25[(1'h0):(1'h0)], (|reg31[(4'hb):(3'h5)])};
          if (($unsigned($signed(($signed(wire28) ?
              {reg38, reg33} : (8'hb7)))) <= reg53[(1'h0):(1'h0)]))
            begin
              reg56 <= ((+reg52) <= $signed(($unsigned($unsigned((8'ha4))) | $signed((wire30 ?
                  reg54 : reg49)))));
              reg57 <= $unsigned((^~({$unsigned(reg48)} ?
                  (((7'h41) ? (8'ha6) : reg46) << (^~wire27)) : ((-wire30) ?
                      $signed(wire24) : reg55[(5'h12):(3'h6)]))));
              reg58 <= $unsigned($unsigned((8'hae)));
              reg59 <= ({{((8'h9d) == {reg56, wire27}),
                      $signed($signed(reg47))},
                  $signed({reg33[(3'h4):(1'h0)],
                      $signed(reg44)})} << $signed((($signed(wire25) >= (^reg58)) && ({reg36,
                  (8'ha8)} != (~|wire29)))));
            end
          else
            begin
              reg56 <= ($unsigned({reg51[(4'ha):(4'h8)],
                      ((~wire43) >>> wire28[(5'h11):(3'h5)])}) ?
                  wire43 : $unsigned(((reg45 ? $signed(reg52) : reg57) ?
                      (~|(reg57 + reg53)) : ((8'ha5) ?
                          $signed(reg58) : (^~(8'ha8))))));
              reg57 <= (wire40 ?
                  $signed((-($unsigned(reg48) ?
                      {reg59} : (wire29 | wire26)))) : $signed((~(reg51 ?
                      $signed(reg44) : (reg35 - reg45)))));
              reg58 <= $unsigned($signed($unsigned({reg37[(4'h8):(2'h2)],
                  reg38[(2'h2):(1'h1)]})));
              reg59 <= (reg38 ? reg59 : $unsigned($unsigned(wire30)));
            end
        end
    end
  assign wire60 = reg49[(4'h8):(1'h0)];
  assign wire61 = $unsigned($signed(($unsigned(((8'h9e) ?
                      reg32 : (8'ha7))) < $unsigned((reg33 && reg53)))));
  assign wire62 = (reg34 ?
                      (~^$signed(((reg34 + wire28) ?
                          (-reg45) : reg44))) : (wire50[(3'h6):(3'h4)] ^ ((~(~^reg34)) <= (8'hb5))));
  assign wire63 = $unsigned(($signed(reg46) + {{reg57}, (^~reg32)}));
  assign wire64 = ($unsigned(wire43) ? $unsigned(wire50) : reg35);
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          if ($signed(reg59))
            begin
              reg65 <= (+($unsigned(reg37) ? $unsigned(reg34) : reg34));
              reg66 <= reg33[(3'h5):(1'h0)];
              reg67 <= (~^$unsigned(reg45));
              reg68 <= {((|((^wire63) ? wire41 : wire26[(3'h6):(1'h0)])) ?
                      ($signed(((7'h42) ?
                          reg44 : reg52)) && (8'hb7)) : $signed($unsigned((8'ha9)))),
                  ((7'h42) ?
                      $signed(($signed((8'ha0)) != {(8'hb3),
                          wire28})) : $signed(reg32))};
            end
          else
            begin
              reg65 <= ($signed((((reg49 >= reg31) ^ (reg36 >= reg33)) ?
                      $signed((^~(7'h42))) : wire63)) ?
                  wire27 : $signed($signed(reg58[(4'h9):(2'h2)])));
              reg66 <= $signed($signed($signed(wire64)));
            end
        end
      else
        begin
          reg65 <= (reg44 == (wire61 ^ $unsigned(($unsigned(wire61) == (~^reg36)))));
          reg66 <= ($signed((&((|reg58) ?
              (wire40 | reg34) : {(8'hbb),
                  wire41}))) ^ $signed(({$signed(wire60),
              (wire61 ? wire62 : reg38)} >= $unsigned(reg48[(3'h5):(1'h1)]))));
        end
      reg69 <= $signed(reg55[(4'hd):(3'h7)]);
      reg70 <= reg37;
    end
  assign wire71 = (reg53 ? $signed(wire25) : $signed((-reg66)));
endmodule
