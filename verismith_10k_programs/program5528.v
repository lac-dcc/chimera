module top
#(parameter param197 = ((8'ha7) ? (~|(8'ha8)) : {(^~({(7'h44)} | ((8'ha3) ? (8'hac) : (8'hbf))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire196;
  wire [(3'h5):(1'h0)] wire195;
  wire signed [(4'hd):(1'h0)] wire193;
  wire [(4'ha):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire20;
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire193,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire90,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
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
                 (1'h0)};
  module5 #() modinst21 (wire20, clk, wire3, wire2, wire1, wire0, wire4);
  assign wire22 = (&({wire20[(3'h5):(3'h4)],
                          $unsigned((wire20 ? (8'haa) : wire3))} ?
                      $unsigned(((|wire0) <= $unsigned(wire0))) : (~^$signed({wire3}))));
  assign wire23 = ((wire3 ?
                      ($signed(wire0[(4'ha):(2'h3)]) ^~ ((wire1 ?
                          wire22 : (7'h44)) ^ (wire4 >> wire0))) : {{(wire0 & wire0)},
                          (wire4[(3'h6):(2'h3)] ?
                              $signed(wire0) : (^wire0))}) <= $unsigned(($unsigned($unsigned(wire4)) ?
                      ($unsigned(wire2) ?
                          (8'hb7) : wire22[(4'h9):(1'h0)]) : ($signed(wire1) ?
                          $unsigned(wire22) : $signed((8'h9e))))));
  assign wire24 = ((&$unsigned(wire22[(3'h6):(1'h0)])) ?
                      ($unsigned((-wire20)) != (~wire20[(1'h0):(1'h0)])) : (-(-($signed(wire0) < {wire1}))));
  module25 #() modinst91 (.wire28(wire22), .wire26(wire0), .clk(clk), .wire27(wire1), .y(wire90), .wire29(wire24));
  always
    @(posedge clk) begin
      reg92 <= (wire3[(4'h9):(1'h1)] >> (wire2[(1'h1):(1'h1)] ?
          ($unsigned($signed(wire22)) + ((8'ha1) ?
              (wire1 | wire24) : (~^(8'h9d)))) : ((~(!(8'ha7))) << $unsigned({wire23}))));
      reg93 <= {(|(wire1[(5'h12):(1'h0)] ?
              wire4 : $signed(((8'hb9) ? wire3 : (7'h42))))),
          $signed(((wire22 ? (^~wire90) : $signed(reg92)) + {wire0}))};
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned(($signed(reg93) >= (8'hb4))))))
        begin
          reg94 <= $signed(wire3[(3'h6):(3'h5)]);
          reg95 <= $unsigned((|wire1));
          reg96 <= (^~reg94[(4'ha):(1'h0)]);
          if (wire2)
            begin
              reg97 <= $signed({$unsigned($signed($signed((8'hb9))))});
              reg98 <= {reg95, wire3[(4'hb):(1'h0)]};
              reg99 <= $signed(((reg98 ?
                  (((8'hb7) <<< wire22) <<< $unsigned(reg96)) : ($signed(wire24) ?
                      $signed(reg95) : $unsigned(wire24))) >= ($signed($signed((7'h44))) ?
                  wire1[(3'h4):(3'h4)] : $unsigned((&wire3)))));
              reg100 <= $signed(wire20[(3'h4):(2'h2)]);
              reg101 <= reg93;
            end
          else
            begin
              reg97 <= $signed((~&($signed((wire23 <= wire3)) ?
                  $unsigned(wire4) : $signed($unsigned(wire4)))));
              reg98 <= (({wire90[(3'h5):(2'h2)]} ^~ reg95) * wire2[(3'h4):(1'h0)]);
              reg99 <= wire24;
              reg100 <= {$unsigned(reg99), (8'haa)};
              reg101 <= $signed(reg97);
            end
        end
      else
        begin
          reg94 <= ((&$unsigned(((8'ha3) ?
              (~^reg97) : {reg101,
                  (8'had)}))) ^~ $signed($unsigned((!(+wire4)))));
          if ({{(wire20 * (~^(wire1 + wire23))), reg95[(3'h4):(3'h4)]}})
            begin
              reg95 <= $signed($unsigned($signed((^(wire1 ?
                  wire1 : (8'h9e))))));
              reg96 <= wire23;
              reg97 <= $signed((~|$signed((reg92[(4'hd):(1'h0)] >= ((7'h44) << wire3)))));
              reg98 <= wire4;
            end
          else
            begin
              reg95 <= reg101;
            end
          reg99 <= $unsigned((^$unsigned(($signed(wire0) ^ (!(8'hb1))))));
          reg100 <= reg94;
        end
    end
  assign wire102 = $unsigned($unsigned($signed(($unsigned(reg97) >> (wire0 ?
                       reg100 : reg101)))));
  assign wire103 = wire24[(3'h6):(1'h0)];
  assign wire104 = wire90[(3'h7):(3'h7)];
  assign wire105 = ((&reg99[(1'h0):(1'h0)]) ?
                       reg94[(5'h11):(1'h0)] : (!{$signed({wire102}),
                           ((reg92 >> reg100) ? $unsigned(wire90) : (8'hae))}));
  assign wire106 = reg101;
  module107 #() modinst194 (.wire109(wire102), .clk(clk), .wire108(wire2), .wire112(wire22), .wire110(reg99), .wire111(wire103), .y(wire193));
  assign wire195 = $unsigned(reg93[(4'ha):(4'ha)]);
  assign wire196 = (reg95 ? wire3[(4'h8):(1'h1)] : (-wire22[(4'hf):(2'h3)]));
endmodule

module module107  (y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'h2d0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire112;
  input wire signed [(4'hf):(1'h0)] wire111;
  input wire signed [(5'h14):(1'h0)] wire110;
  input wire signed [(2'h3):(1'h0)] wire109;
  input wire [(2'h3):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire191;
  wire [(5'h12):(1'h0)] wire190;
  wire signed [(4'h8):(1'h0)] wire189;
  wire signed [(4'he):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire187;
  wire signed [(5'h10):(1'h0)] wire186;
  wire [(5'h15):(1'h0)] wire185;
  wire [(5'h12):(1'h0)] wire181;
  wire [(4'h8):(1'h0)] wire160;
  wire signed [(3'h7):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  assign y = {wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire181,
                 wire160,
                 wire125,
                 wire114,
                 wire113,
                 reg184,
                 reg183,
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
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 (1'h0)};
  assign wire113 = $signed(($unsigned($signed($unsigned((8'ha8)))) ?
                       wire109[(2'h2):(1'h1)] : $unsigned((~&((7'h40) >= wire109)))));
  assign wire114 = {$unsigned(wire112[(1'h1):(1'h1)]),
                       (wire108 >>> $signed((&$unsigned(wire108))))};
  always
    @(posedge clk) begin
      if (wire112)
        begin
          if (((!wire113) ?
              (wire109 >= wire109[(2'h3):(1'h1)]) : $signed(wire109[(2'h3):(2'h2)])))
            begin
              reg115 <= wire112;
              reg116 <= $signed(($signed({wire108}) ?
                  $signed($signed($signed(reg115))) : $signed(wire110[(3'h5):(3'h4)])));
            end
          else
            begin
              reg115 <= (&{$signed((8'ha3))});
              reg116 <= $signed($unsigned($signed($signed((wire113 && (8'ha3))))));
              reg117 <= (8'h9d);
              reg118 <= $signed((reg116 ?
                  $unsigned($signed((reg116 || wire110))) : {((wire114 | reg116) ?
                          (wire109 ?
                              wire113 : wire113) : wire113[(3'h7):(1'h0)]),
                      wire108[(1'h1):(1'h0)]}));
            end
          reg119 <= reg115;
          reg120 <= wire111;
          reg121 <= $signed(wire109[(2'h3):(1'h0)]);
        end
      else
        begin
          reg115 <= ({{$signed((reg121 >>> reg115)), reg115},
              {(~((8'h9d) ? reg116 : wire113))}} >= $signed((+(^~(7'h44)))));
        end
      reg122 <= {(wire114 ?
              $unsigned((&$unsigned(wire109))) : {($signed((8'ha4)) ?
                      $unsigned(wire113) : $signed(wire114))}),
          wire110[(2'h3):(1'h0)]};
      reg123 <= $signed((wire114[(3'h4):(3'h4)] * reg122));
      reg124 <= (|($unsigned(({reg122} < $unsigned(wire111))) == $unsigned(((wire108 ?
          wire111 : wire108) | (reg119 ? wire113 : wire113)))));
    end
  assign wire125 = (|$unsigned($unsigned(((wire113 + reg117) ?
                       $signed(reg116) : (wire112 ? wire110 : wire111)))));
  always
    @(posedge clk) begin
      if ((+(!(({wire125} ? (8'hae) : (reg124 >= reg123)) ?
          wire113[(2'h3):(2'h3)] : ((wire108 <<< reg121) != wire108[(1'h1):(1'h0)])))))
        begin
          reg126 <= ({{({(8'h9f), wire110} ?
                      {wire125} : (reg115 ?
                          (8'hba) : reg124))}} < $signed((($unsigned(wire114) ?
              $unsigned(wire111) : $unsigned(reg120)) - ((^~wire108) ?
              (&wire111) : reg119[(4'hf):(3'h6)]))));
          if ((reg124 ?
              $unsigned($signed(reg120)) : $signed((reg118 ?
                  $unsigned((reg120 ?
                      wire125 : (8'hb2))) : reg118[(4'he):(3'h6)]))))
            begin
              reg127 <= (|wire114);
            end
          else
            begin
              reg127 <= reg116;
              reg128 <= (!reg116[(1'h0):(1'h0)]);
              reg129 <= (&(reg122 == {$unsigned(reg127[(4'hb):(3'h7)])}));
            end
          reg130 <= (($signed(reg115[(4'hc):(4'hc)]) ?
                  (($unsigned(wire114) ?
                      $unsigned(wire110) : $unsigned(reg123)) <<< reg120[(4'h8):(2'h3)]) : $signed($unsigned(reg118))) ?
              reg118[(2'h2):(2'h2)] : {$signed($signed((wire111 ?
                      (8'hbc) : reg116))),
                  ($signed({reg117}) ?
                      ((^~reg120) >= $unsigned(reg121)) : reg116)});
          reg131 <= reg127[(4'hd):(3'h6)];
          reg132 <= ($signed(reg131) ?
              reg124[(1'h1):(1'h1)] : ($unsigned(reg120[(3'h6):(3'h6)]) * ($unsigned((|reg128)) <<< reg118)));
        end
      else
        begin
          reg126 <= reg124;
          reg127 <= (((8'ha7) & (|($unsigned((8'ha2)) & (reg115 ?
                  reg129 : reg132)))) ?
              $signed($signed(reg115[(1'h0):(1'h0)])) : reg120[(4'hb):(4'hb)]);
          reg128 <= $signed(wire125[(3'h7):(2'h3)]);
        end
      if (wire112)
        begin
          reg133 <= reg119;
          if ($signed(((-wire114) ~^ $signed((8'h9f)))))
            begin
              reg134 <= ({(&$signed((reg120 ? reg129 : (8'hb8))))} ?
                  $unsigned(($signed((^(8'h9c))) ?
                      (reg122[(2'h2):(1'h0)] ?
                          reg132 : (reg118 ?
                              (8'ha3) : wire112)) : ($unsigned((8'hb1)) ?
                          reg120[(1'h0):(1'h0)] : $signed(reg119)))) : $signed($signed(wire108[(1'h0):(1'h0)])));
              reg135 <= (~|{$signed(wire112)});
            end
          else
            begin
              reg134 <= {wire112, $signed($signed(wire113[(2'h3):(2'h2)]))};
              reg135 <= (reg127 ? reg127[(3'h6):(3'h5)] : reg129);
              reg136 <= reg132[(2'h3):(1'h0)];
              reg137 <= $signed(wire114);
              reg138 <= reg123;
            end
          reg139 <= (8'hae);
        end
      else
        begin
          reg133 <= $unsigned($unsigned({{(^~reg135)}}));
          reg134 <= $signed($unsigned((((reg115 ? reg137 : (8'hb7)) ?
              {reg122} : wire114) ^~ $unsigned((reg138 ? wire110 : (7'h43))))));
          reg135 <= reg124;
          reg136 <= $signed(reg130);
          reg137 <= reg138[(2'h3):(1'h1)];
        end
      if (reg127[(4'hf):(4'hf)])
        begin
          reg140 <= (reg118[(1'h0):(1'h0)] == (reg121 ?
              $unsigned((+(reg133 >>> reg137))) : $unsigned(($unsigned(reg123) & (8'ha0)))));
          reg141 <= $signed($unsigned($signed({(wire109 ? (8'hb0) : wire111),
              reg119})));
        end
      else
        begin
          if ($unsigned((reg137[(1'h0):(1'h0)] & (($unsigned(reg133) ?
                  {wire109} : {reg124}) ?
              wire125[(2'h2):(1'h0)] : $signed(reg130[(3'h4):(2'h3)])))))
            begin
              reg140 <= ({reg118[(2'h3):(2'h3)]} ?
                  ((&($signed(reg138) + (reg120 <= (8'hbb)))) - $unsigned((^~wire110[(2'h3):(2'h2)]))) : reg139);
              reg141 <= (~&($signed(((reg126 ?
                      reg122 : reg141) - wire113[(3'h4):(1'h0)])) ?
                  (~reg119[(5'h11):(2'h2)]) : wire113[(4'h8):(3'h4)]));
              reg142 <= $unsigned(reg121);
              reg143 <= reg122;
            end
          else
            begin
              reg140 <= (reg140[(2'h2):(1'h1)] ?
                  ((((wire109 | (8'hab)) < ((8'hbe) ?
                      reg123 : (8'h9e))) || (-reg139)) >> (8'hb2)) : (reg142[(3'h4):(3'h4)] >> (8'hbf)));
              reg141 <= (+$unsigned(reg130));
              reg142 <= {$signed(wire108[(2'h3):(1'h1)]),
                  (+(reg116 ?
                      {$unsigned(reg134),
                          wire109} : (^reg134[(4'hd):(1'h1)])))};
            end
          if ((^(-(|reg138))))
            begin
              reg144 <= (reg141[(2'h2):(2'h2)] ?
                  reg143 : (reg119 ? (8'hb2) : reg140));
            end
          else
            begin
              reg144 <= ($signed(reg132[(1'h0):(1'h0)]) ^ $unsigned(reg124[(3'h5):(2'h2)]));
              reg145 <= reg119;
              reg146 <= reg132[(2'h2):(1'h0)];
              reg147 <= $unsigned($unsigned((($signed(reg145) & (wire112 ?
                      wire113 : (8'ha8))) ?
                  reg134[(3'h7):(3'h6)] : $unsigned($unsigned(reg146)))));
            end
          if (reg132)
            begin
              reg148 <= reg119;
              reg149 <= reg129[(3'h4):(2'h2)];
              reg150 <= ($unsigned({reg134[(4'h8):(3'h5)],
                  ((reg139 != reg131) <<< $unsigned(reg133))}) ^ reg124[(2'h2):(1'h1)]);
              reg151 <= $signed(reg144[(4'h8):(4'h8)]);
            end
          else
            begin
              reg148 <= reg142[(3'h7):(3'h4)];
              reg149 <= (reg117 << ($signed({reg123, {reg138}}) ?
                  reg124 : ($unsigned((8'hb9)) || $unsigned($signed(reg136)))));
              reg150 <= wire111[(4'hb):(3'h4)];
              reg151 <= $signed(wire109[(2'h2):(1'h0)]);
              reg152 <= reg115;
            end
          if ($unsigned($unsigned((reg146[(3'h5):(2'h2)] ? reg133 : (8'h9e)))))
            begin
              reg153 <= (~|($unsigned($unsigned($unsigned(reg134))) == wire114));
            end
          else
            begin
              reg153 <= $unsigned($unsigned(((reg119 ^ $signed(reg131)) ^ ({reg120,
                  (8'hb0)} >> $unsigned(reg132)))));
              reg154 <= wire108;
              reg155 <= (reg148[(1'h1):(1'h1)] ?
                  (reg122[(4'ha):(1'h0)] ?
                      {$unsigned($unsigned(reg117))} : $signed($signed({reg146}))) : {(|{(reg124 ?
                              reg128 : (8'hbe))}),
                      reg129});
              reg156 <= $unsigned(({$unsigned((wire112 ?
                      reg153 : wire109))} ^ $unsigned((~|reg131))));
              reg157 <= {reg131, (&((8'hba) << reg127[(5'h13):(5'h13)]))};
            end
          reg158 <= reg115[(1'h0):(1'h0)];
        end
      reg159 <= ($signed(reg151[(4'he):(2'h3)]) ?
          {$signed($signed(((8'h9d) ? wire125 : reg129)))} : reg148);
    end
  assign wire160 = (reg122 ? wire109 : reg116);
  module161 #() modinst182 (wire181, clk, reg133, reg131, reg115, reg128);
  always
    @(posedge clk) begin
      reg183 <= reg122;
      reg184 <= reg142[(3'h6):(1'h1)];
    end
  assign wire185 = (($unsigned(((reg148 & (8'hbe)) ^ ((8'hbe) ?
                               reg158 : (8'h9c)))) ?
                           reg117 : $unsigned(reg151)) ?
                       ((($unsigned(reg152) > (-reg153)) + (reg128 - reg154[(4'hd):(4'ha)])) ?
                           reg136 : (((reg119 <= (8'hb3)) ?
                               (reg138 * reg146) : (wire108 ?
                                   (8'hba) : reg118)) > (~&((8'hb3) < reg140)))) : {{(wire160[(3'h7):(1'h1)] ?
                                   ((7'h42) & reg128) : $signed((8'ha9))),
                               (reg150 + (reg121 * reg120))},
                           (reg134 >= (~|$signed(wire125)))});
  assign wire186 = $unsigned(((^reg138) ?
                       $signed($signed({reg143, wire110})) : reg184));
  assign wire187 = $unsigned(reg123[(3'h5):(2'h3)]);
  assign wire188 = (-$signed(reg121[(3'h5):(1'h0)]));
  assign wire189 = reg145;
  assign wire190 = (reg122[(2'h3):(1'h1)] ?
                       $unsigned(((!(+reg118)) | (&$signed(reg135)))) : (reg129 ?
                           (($signed(reg159) ?
                                   (reg126 ^ reg158) : $signed(wire111)) ?
                               $signed((^~reg159)) : (wire110 > {reg158,
                                   wire160})) : $signed((8'h9d))));
  assign wire191 = (^~((wire112 ? reg115[(3'h5):(2'h3)] : (8'ha4)) ?
                       {$signed((~&wire111))} : $signed((~|(reg159 ?
                           (8'haf) : wire111)))));
  assign wire192 = $unsigned((reg140 != ($unsigned(wire186[(4'hc):(3'h6)]) && {reg159,
                       $signed(reg129)})));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire [(5'h14):(1'h0)] wire27;
  input wire [(4'ha):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire85,
                 wire59,
                 wire46,
                 wire45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg30 <= (8'ha8);
      reg31 <= wire29;
      reg32 <= (~&$signed(($signed(wire29) <<< {$signed(reg31)})));
      if ((({$unsigned($signed((8'hb4))), (8'h9d)} ?
              $unsigned(((wire28 ?
                  (8'ha2) : wire29) + $signed((7'h40)))) : ((~&wire26[(4'ha):(3'h5)]) >> $unsigned($signed(reg32)))) ?
          $signed($signed(reg31[(2'h3):(2'h2)])) : $unsigned(wire29[(2'h2):(1'h1)])))
        begin
          if (reg32[(1'h0):(1'h0)])
            begin
              reg33 <= (8'hac);
            end
          else
            begin
              reg33 <= {$unsigned($signed(((+reg33) ?
                      wire27[(5'h13):(3'h4)] : $signed(reg33)))),
                  (((~(!wire27)) ?
                          reg31 : ((reg30 >>> wire28) > reg32[(2'h2):(1'h0)])) ?
                      $signed(wire28) : $signed($unsigned((wire27 ?
                          reg32 : wire28))))};
              reg34 <= (wire26 <= ($unsigned($signed(wire29[(3'h7):(3'h5)])) == (reg31 ?
                  reg31[(3'h4):(2'h3)] : wire28[(3'h5):(3'h4)])));
              reg35 <= ((wire26[(1'h1):(1'h0)] << $signed((^{wire26}))) ?
                  ((~$signed(reg31)) ?
                      $unsigned($signed($signed((8'hbd)))) : (reg33 != (+$unsigned((8'ha4))))) : $signed({reg33,
                      wire28}));
              reg36 <= (-{($unsigned($signed(reg35)) ?
                      reg30 : wire27[(5'h13):(4'hc)]),
                  reg32[(2'h2):(1'h1)]});
              reg37 <= reg36[(4'h9):(2'h2)];
            end
          reg38 <= wire28;
          if (((reg34 ?
              reg33[(4'ha):(2'h2)] : $signed(reg32[(1'h1):(1'h1)])) - $signed(({$unsigned(reg38)} == (&{reg36})))))
            begin
              reg39 <= (&$signed((^~(8'hb8))));
              reg40 <= (~^($unsigned($signed($unsigned(reg39))) >= wire28));
              reg41 <= {(((8'hb6) ^ $unsigned($unsigned(wire29))) ?
                      (8'hae) : reg38[(3'h5):(2'h3)])};
              reg42 <= reg34[(2'h2):(2'h2)];
              reg43 <= (wire27 ?
                  $unsigned((~^$unsigned(reg38[(3'h6):(1'h1)]))) : reg33[(4'hc):(1'h1)]);
            end
          else
            begin
              reg39 <= reg30[(1'h0):(1'h0)];
              reg40 <= ({$signed($signed(reg41[(2'h3):(1'h0)])),
                  $unsigned(wire29)} == (($signed($unsigned(reg42)) && wire27[(3'h4):(2'h2)]) ?
                  ({reg40} ~^ reg43[(4'h8):(3'h4)]) : wire27));
            end
        end
      else
        begin
          reg33 <= ($signed($unsigned((&$unsigned(reg42)))) ?
              $unsigned((|reg34)) : ((8'haa) == wire27));
          if (($unsigned(reg33) ?
              reg30 : $unsigned($unsigned((reg43[(5'h10):(4'ha)] ?
                  (reg40 * reg32) : ((8'hbb) ? reg39 : reg34))))))
            begin
              reg34 <= $unsigned($unsigned({reg32[(1'h0):(1'h0)],
                  ((~^reg30) < $signed(reg38))}));
              reg35 <= $signed((~&reg36[(4'h8):(2'h2)]));
              reg36 <= (~^((((wire29 ? reg38 : reg41) ? reg31 : {wire27}) ?
                      reg34 : $signed((^reg43))) ?
                  reg39[(1'h0):(1'h0)] : (($signed(reg35) ?
                      $unsigned(wire29) : wire29) ~^ ((-reg41) == (wire26 <= reg40)))));
            end
          else
            begin
              reg34 <= ((8'ha3) ?
                  ($signed($signed($signed(wire27))) ^ (reg32 || (~reg35[(1'h0):(1'h0)]))) : reg40[(1'h1):(1'h0)]);
            end
          if ($signed($signed(reg38)))
            begin
              reg37 <= $unsigned((~$signed(reg41[(2'h3):(2'h2)])));
            end
          else
            begin
              reg37 <= (8'hba);
            end
        end
      reg44 <= $unsigned(($signed((|reg32[(2'h2):(1'h1)])) ?
          ((-reg33) ? reg36[(4'he):(4'h8)] : wire26) : (({reg42} ?
              $signed(reg43) : $unsigned(reg39)) ^ wire28[(2'h3):(2'h3)])));
    end
  assign wire45 = (~&(8'ha5));
  assign wire46 = ($unsigned((reg41 & wire45[(4'h9):(4'h9)])) * $unsigned({((~&reg43) ?
                          reg34 : (|(8'hbf)))}));
  module47 #() modinst60 (.y(wire59), .clk(clk), .wire51(reg30), .wire49(wire27), .wire48(reg35), .wire50(wire46));
  module61 #() modinst86 (.clk(clk), .y(wire85), .wire65(reg39), .wire62(wire27), .wire63(reg40), .wire64(wire46));
  assign wire87 = reg34;
  assign wire88 = $signed(({(~(reg40 ? reg40 : reg40)),
                      (+{reg44})} <<< $unsigned(wire26[(4'h8):(2'h3)])));
  assign wire89 = reg43;
endmodule

module module5
#(parameter param19 = (!({(^(!(8'h9e))), (((8'ha2) ? (8'ha1) : (8'hbb)) ? ((8'ha9) ? (8'hac) : (8'hb7)) : (8'hbd))} + ((8'ha0) ? (((8'h9f) && (8'h9f)) ^ (+(8'hb7))) : ((~|(8'haa)) ~^ ((8'ha9) ? (8'h9e) : (8'haa)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire14,
                 wire13,
                 wire12,
                 reg16,
                 reg15,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed($unsigned((wire6 <= $unsigned(wire8))));
    end
  assign wire12 = ((8'hb5) | $signed($unsigned(wire9)));
  assign wire13 = wire6[(2'h2):(1'h0)];
  assign wire14 = ({$signed((&$signed(wire10)))} ?
                      ($signed((8'hb4)) ?
                          $unsigned(((wire12 ?
                              wire13 : wire9) && reg11[(1'h1):(1'h0)])) : ($signed(wire6) ?
                              ((wire13 ?
                                  wire12 : (8'hae)) ^~ (wire12 > wire10)) : $signed((~&reg11)))) : wire7[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      reg15 <= ($unsigned((^~((~|wire6) << $signed(wire12)))) << $signed($unsigned(wire8)));
      reg16 <= ($unsigned((({wire12, wire10} < $unsigned(wire14)) ?
              wire14 : $signed(wire12[(3'h5):(1'h1)]))) ?
          $signed({($signed(wire6) || (wire9 ? wire9 : (8'had)))}) : wire10);
    end
  assign wire17 = $unsigned($unsigned($unsigned(reg16)));
  assign wire18 = (wire12[(2'h2):(2'h2)] ?
                      $signed(reg11) : wire17[(5'h13):(4'ha)]);
endmodule

module module61
#(parameter param84 = (|(~{(+(+(8'ha1))), ({(8'hab)} << ((7'h44) ? (8'ha8) : (8'hab)))})))
(y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire65;
  input wire [(3'h4):(1'h0)] wire64;
  input wire [(3'h4):(1'h0)] wire63;
  input wire [(5'h14):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  assign y = {wire83,
                 wire67,
                 wire66,
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
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire66 = (wire64 ? $signed(wire62[(5'h13):(2'h3)]) : $signed(wire65));
  assign wire67 = wire62;
  always
    @(posedge clk) begin
      if ((wire66[(4'hb):(1'h1)] ?
          wire64[(3'h4):(2'h2)] : $unsigned(wire62[(4'hc):(2'h2)])))
        begin
          if (wire62[(4'hd):(4'ha)])
            begin
              reg68 <= (({(wire62[(4'h8):(4'h8)] + $signed(wire65))} ^~ (!(^~(~^wire65)))) >>> (~|wire63[(2'h2):(1'h1)]));
              reg69 <= ((wire67 ?
                      wire64[(1'h1):(1'h0)] : $signed(wire64[(2'h2):(1'h0)])) ?
                  $unsigned($signed(wire64)) : $unsigned(reg68));
            end
          else
            begin
              reg68 <= ((wire64[(2'h2):(1'h1)] ?
                  $unsigned(wire63[(1'h1):(1'h0)]) : wire62[(4'ha):(1'h0)]) >>> (~&reg69));
              reg69 <= {(reg68[(3'h5):(1'h0)] ?
                      {(~(~(8'hbb))),
                          {(+(8'hb0))}} : $signed(wire66[(4'ha):(2'h2)]))};
            end
          reg70 <= {(^wire66), reg68[(3'h4):(1'h1)]};
          if ((|(({(+wire66)} << (-{wire64, wire64})) ?
              reg69 : ($unsigned(wire66[(4'hf):(4'h8)]) == reg68[(2'h2):(2'h2)]))))
            begin
              reg71 <= $unsigned(wire67[(2'h3):(1'h0)]);
              reg72 <= $unsigned($unsigned({$unsigned((reg71 ?
                      wire67 : wire62))}));
              reg73 <= $signed(wire67);
              reg74 <= (~reg72[(2'h3):(1'h0)]);
            end
          else
            begin
              reg71 <= {(8'ha2), wire63[(2'h2):(1'h0)]};
              reg72 <= $unsigned((!$unsigned({$unsigned(reg70)})));
            end
          if ((~&wire62[(4'hc):(4'hc)]))
            begin
              reg75 <= $signed((({$signed(wire66),
                      ((8'ha9) ?
                          reg69 : reg71)} < ($signed(wire64) >= (^wire62))) ?
                  (((8'hb7) | (reg70 || wire65)) ?
                      {{(7'h44), reg73}, reg74[(1'h1):(1'h1)]} : ((reg72 ?
                          reg71 : reg73) <<< $unsigned(wire63))) : reg71[(3'h5):(3'h4)]));
              reg76 <= (wire65 ~^ reg72[(1'h0):(1'h0)]);
            end
          else
            begin
              reg75 <= ($signed($unsigned($signed((~&wire63)))) < $unsigned($unsigned(wire63)));
              reg76 <= (8'ha9);
              reg77 <= {$signed((+((8'hb2) ?
                      (reg73 * reg75) : ((8'ha9) > (8'ha0)))))};
              reg78 <= reg70;
            end
        end
      else
        begin
          reg68 <= (~|({(+(wire65 ? reg78 : reg71)), reg78} ?
              (8'hb8) : ((((8'ha9) ? reg72 : (8'ha9)) >>> (reg74 ^ reg76)) ?
                  (~^((8'ha0) ?
                      reg77 : reg77)) : $signed(wire63[(2'h2):(2'h2)]))));
          reg69 <= reg68[(2'h2):(1'h1)];
          reg70 <= $signed(wire64);
        end
      reg79 <= $signed($unsigned((wire67 <<< $unsigned((+(8'h9f))))));
      if ((reg72[(5'h14):(4'hb)] << reg68))
        begin
          reg80 <= (~&reg76[(2'h3):(1'h0)]);
          reg81 <= reg76[(1'h0):(1'h0)];
        end
      else
        begin
          if ((~^(reg74[(2'h2):(1'h0)] && (8'ha4))))
            begin
              reg80 <= wire62;
              reg81 <= ($signed($signed(((reg77 * (8'hb7)) >> (reg77 == reg77)))) & $unsigned(wire62[(5'h12):(4'hf)]));
            end
          else
            begin
              reg80 <= wire67[(2'h2):(2'h2)];
              reg81 <= (|$signed(($signed(reg71[(3'h5):(1'h1)]) != wire63)));
            end
        end
      reg82 <= {reg74[(2'h2):(1'h1)]};
    end
  assign wire83 = (reg68[(2'h3):(2'h3)] ?
                      wire63 : (wire63 ?
                          wire66[(1'h0):(1'h0)] : $unsigned($unsigned({(8'hbc),
                              reg73}))));
endmodule

module module47
#(parameter param57 = (-((|(~((8'hae) ? (8'hae) : (8'hb9)))) ? ((((8'ha8) || (8'hb8)) ? {(8'hbd)} : ((8'hbb) >= (8'hac))) == ({(8'hba), (8'hbc)} & ((8'hb4) * (8'h9d)))) : {((-(8'hb6)) ? {(8'h9f)} : ((8'ha4) || (8'ha3)))})), 
parameter param58 = param57)
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire51;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(4'hd):(1'h0)] wire49;
  input wire [(3'h4):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  assign y = {wire56, wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = $unsigned($unsigned(($signed(wire48[(2'h3):(1'h0)]) ^~ ({wire49,
                      wire50} >> wire50))));
  assign wire53 = (|(-wire50[(3'h4):(3'h4)]));
  assign wire54 = {($unsigned($signed($unsigned(wire50))) ?
                          (^(~^wire48[(2'h2):(1'h1)])) : wire52)};
  assign wire55 = $signed(($signed(wire49) ?
                      wire53[(1'h1):(1'h0)] : ({$signed(wire51),
                          wire51[(5'h11):(1'h1)]} && ({wire50} ?
                          $signed(wire51) : ((8'hbd) ? wire48 : (8'haa))))));
  assign wire56 = (|wire50);
endmodule

module module161
#(parameter param180 = ((~|(+{{(8'ha4)}})) ? (~|(^~(((8'hb2) ^ (7'h40)) ? {(8'hb5)} : {(8'hb0), (8'h9d)}))) : {(((-(8'hab)) ? ((8'ha2) * (7'h41)) : ((8'ha2) == (8'hbd))) ? ((7'h44) - ((8'ha9) & (8'ha2))) : ({(8'hb2)} > ((8'hbe) ~^ (8'ha2)))), ((((8'hae) >>> (8'hb6)) != (~^(7'h44))) ? ({(8'ha4), (8'hb7)} ? (~^(8'hbf)) : ((8'hb5) || (7'h41))) : {((7'h40) ? (8'hb1) : (7'h40)), ((8'h9c) == (8'had))})}))
(y, clk, wire165, wire164, wire163, wire162);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire165;
  input wire signed [(4'he):(1'h0)] wire164;
  input wire [(4'hc):(1'h0)] wire163;
  input wire [(3'h7):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire178;
  wire [(5'h13):(1'h0)] wire177;
  wire [(4'h9):(1'h0)] wire176;
  wire [(2'h2):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(5'h12):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire169;
  wire [(4'hf):(1'h0)] wire168;
  wire [(4'hc):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire166;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 (1'h0)};
  assign wire166 = $unsigned((8'h9c));
  assign wire167 = $unsigned(((^~wire162[(3'h5):(3'h5)]) && wire163[(3'h7):(2'h3)]));
  assign wire168 = wire163[(1'h1):(1'h1)];
  assign wire169 = (wire167[(4'h9):(2'h3)] ?
                       (-$unsigned(wire166[(4'h8):(1'h0)])) : $signed((~^$signed((!wire167)))));
  assign wire170 = (($signed($unsigned((wire169 ? wire167 : wire169))) ?
                           $unsigned(($unsigned(wire165) ?
                               $unsigned(wire169) : $signed(wire164))) : ((&(~|(7'h41))) >= wire165[(2'h3):(1'h1)])) ?
                       wire169[(2'h3):(2'h3)] : (~({wire166, {wire166}} ?
                           $unsigned($signed(wire164)) : (8'haa))));
  assign wire171 = (&($signed(((wire162 + wire170) || (wire162 != wire162))) ?
                       $signed(wire165[(2'h3):(2'h2)]) : ({$signed(wire167),
                           wire169} >= (wire163 >>> $signed(wire163)))));
  assign wire172 = {wire169};
  assign wire173 = $signed((wire170 >>> $unsigned(wire162)));
  assign wire174 = {$unsigned(wire167)};
  assign wire175 = (((&wire169) ?
                       ((~^(8'hb9)) ?
                           ((wire174 ?
                               wire163 : wire170) >> $signed(wire165)) : wire168) : $unsigned($unsigned($unsigned(wire167)))) >> wire163[(4'hb):(4'h9)]);
  assign wire176 = ($unsigned(((|(wire175 ^~ wire168)) ?
                       $signed((^wire169)) : (+wire165))) != wire171);
  assign wire177 = $signed(wire172);
  assign wire178 = ({((~&(~&wire168)) ?
                               (((8'hbd) | wire162) - wire168) : wire167),
                           wire174} ?
                       $unsigned((7'h44)) : $unsigned($signed($unsigned({wire170}))));
  assign wire179 = (~|(~(wire173 ^ {(wire171 ~^ wire171),
                       wire162[(3'h5):(3'h4)]})));
endmodule
