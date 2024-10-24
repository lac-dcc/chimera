module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire213;
  wire signed [(5'h14):(1'h0)] wire212;
  wire signed [(4'hf):(1'h0)] wire211;
  wire [(5'h14):(1'h0)] wire210;
  wire signed [(4'h9):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire signed [(4'hf):(1'h0)] wire207;
  wire [(3'h4):(1'h0)] wire205;
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire205,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3;
      reg6 <= (!(!$signed($signed((wire1 ? wire0 : reg5)))));
      reg7 <= wire4[(3'h6):(2'h3)];
      reg8 <= $signed($unsigned(wire2));
      reg9 <= $signed(((+(~&((8'ha6) << reg5))) ?
          $signed($unsigned((8'hbd))) : (8'h9f)));
    end
  module10 #() modinst206 (.wire13(reg5), .wire11(reg8), .wire15(wire3), .wire12(wire1), .clk(clk), .wire14(wire0), .y(wire205));
  assign wire207 = wire4[(3'h5):(3'h5)];
  assign wire208 = $unsigned($signed(wire1[(3'h6):(2'h2)]));
  assign wire209 = $unsigned({wire1[(1'h0):(1'h0)], (~&reg5[(4'h9):(3'h7)])});
  assign wire210 = (-($signed($unsigned((~^wire205))) ?
                       (^$unsigned((wire3 * wire0))) : (8'hb5)));
  assign wire211 = $unsigned((8'hb4));
  assign wire212 = (~&wire1[(2'h2):(2'h2)]);
  module87 #() modinst214 (wire213, clk, reg7, wire210, wire1, wire211, wire208);
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire204;
  wire [(3'h7):(1'h0)] wire193;
  wire [(5'h14):(1'h0)] wire192;
  wire [(4'hc):(1'h0)] wire191;
  wire [(4'hc):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire189;
  wire [(2'h3):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire114;
  wire [(5'h12):(1'h0)] wire187;
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg [(2'h2):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg200 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(5'h12):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  reg [(4'ha):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg195 = (1'h0);
  reg [(4'ha):(1'h0)] reg194 = (1'h0);
  assign y = {wire204,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire109,
                 wire86,
                 wire85,
                 wire84,
                 wire82,
                 wire45,
                 wire44,
                 wire42,
                 wire16,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire187,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 (1'h0)};
  assign wire16 = wire13;
  module17 #() modinst43 (wire42, clk, wire15, wire14, wire11, wire16);
  assign wire44 = wire16;
  assign wire45 = (~$unsigned($signed({(wire44 ? wire42 : wire11)})));
  module46 #() modinst83 (wire82, clk, wire42, wire44, wire11, wire14);
  assign wire84 = wire82[(3'h4):(2'h3)];
  assign wire85 = wire45[(3'h4):(2'h3)];
  assign wire86 = {((wire45 < {(~(8'hba)), $signed(wire14)}) > wire14),
                      (^~{$unsigned({wire12, wire45})})};
  module87 #() modinst110 (wire109, clk, wire44, wire85, wire84, wire42, wire82);
  assign wire111 = wire82[(3'h5):(1'h0)];
  assign wire112 = {{(^($unsigned(wire111) ?
                               {wire85, wire85} : $signed((8'hbb))))},
                       ($signed((wire16[(1'h0):(1'h0)] ?
                           (+wire111) : (8'hbd))) && (((wire85 || wire16) + $unsigned(wire44)) - (!(wire14 >>> (8'hb4)))))};
  assign wire113 = $unsigned(wire86[(1'h0):(1'h0)]);
  assign wire114 = wire112;
  module115 #() modinst188 (.wire120(wire11), .y(wire187), .wire117(wire111), .wire119(wire85), .wire118(wire12), .wire116(wire44), .clk(clk));
  assign wire189 = wire11;
  assign wire190 = (((-$signed($unsigned(wire16))) ?
                           wire114[(1'h1):(1'h0)] : $signed(wire86[(1'h1):(1'h0)])) ?
                       wire187 : $signed(((~^(wire44 ?
                           wire86 : wire11)) >>> $signed((wire13 ?
                           wire84 : wire109)))));
  assign wire191 = $signed(wire190[(3'h4):(1'h1)]);
  assign wire192 = (~(+wire114[(1'h1):(1'h1)]));
  assign wire193 = $unsigned(wire13);
  always
    @(posedge clk) begin
      if (wire109)
        begin
          reg194 <= $unsigned(($signed(((!wire14) * $unsigned(wire82))) ?
              (wire84 ?
                  (~{wire112, wire84}) : ((wire190 ^~ wire112) ?
                      (!wire189) : (|wire82))) : ($unsigned((wire82 - wire193)) - wire113)));
          if (wire85[(5'h13):(3'h4)])
            begin
              reg195 <= $unsigned(({$signed($signed(wire187))} ?
                  wire86[(1'h1):(1'h0)] : $signed(($unsigned(wire193) & wire190[(2'h3):(1'h1)]))));
              reg196 <= ($unsigned(wire42) ?
                  $signed({(wire193 ?
                          (reg194 ? wire109 : (8'hbe)) : (+(7'h40))),
                      {$signed(wire187), wire113[(3'h4):(1'h0)]}}) : wire45);
              reg197 <= $signed((wire82 == ($signed(((7'h44) ?
                      wire189 : (8'hbb))) ?
                  (wire112 != ((8'hbc) <= wire114)) : (8'h9e))));
              reg198 <= (~^$signed(wire11[(4'hb):(4'h8)]));
              reg199 <= $signed(($signed($unsigned((wire192 ?
                  (8'hbe) : wire114))) > wire44[(4'hc):(3'h5)]));
            end
          else
            begin
              reg195 <= (reg195[(1'h0):(1'h0)] && wire192);
            end
          reg200 <= (&$unsigned((!wire109[(1'h0):(1'h0)])));
          reg201 <= (reg198[(5'h10):(5'h10)] ? (~^wire84) : reg196);
          reg202 <= wire85;
        end
      else
        begin
          reg194 <= ($signed($unsigned({{wire86}})) <= wire82[(1'h1):(1'h1)]);
          if ($signed(wire44[(4'h8):(1'h1)]))
            begin
              reg195 <= (8'hb7);
              reg196 <= reg200[(4'hd):(4'h9)];
              reg197 <= $unsigned((^~(wire191[(1'h0):(1'h0)] ^ ($signed(wire109) ?
                  reg197 : $signed(wire109)))));
            end
          else
            begin
              reg195 <= wire114[(1'h1):(1'h0)];
              reg196 <= $signed($unsigned($unsigned($signed(wire86[(2'h3):(2'h3)]))));
            end
          if (reg198[(4'hb):(3'h7)])
            begin
              reg198 <= wire13[(3'h4):(2'h2)];
              reg199 <= ((~|$signed($signed({(8'ha7), reg200}))) ?
                  (|wire192[(4'h8):(3'h4)]) : (8'haf));
              reg200 <= ($unsigned((~wire112)) && (+{(^(reg196 < wire11))}));
              reg201 <= ($unsigned((wire84[(3'h7):(1'h1)] | ((reg195 ?
                          wire112 : wire112) ?
                      $signed(reg197) : (reg197 ? reg195 : reg201)))) ?
                  (8'hbc) : $unsigned($signed(({wire190} ?
                      (wire192 <= wire109) : wire114))));
              reg202 <= $unsigned(wire82[(3'h5):(3'h4)]);
            end
          else
            begin
              reg198 <= ($unsigned((((wire84 ? wire13 : wire189) < reg201) ?
                  ((~|wire114) ?
                      wire111 : (-wire44)) : reg198)) >>> $signed(((reg200 ?
                  {wire191} : (reg197 ?
                      wire14 : wire13)) < reg200[(2'h2):(1'h1)])));
              reg199 <= {$unsigned((~|{(~|wire85),
                      (wire84 ? wire192 : wire44)}))};
              reg200 <= ((((-$unsigned(reg200)) ? reg194 : (|{wire82})) ?
                      wire187[(3'h6):(3'h6)] : (($signed((8'hac)) - (wire187 ?
                              wire189 : (8'ha4))) ?
                          (wire11 ?
                              (^~(8'hbc)) : wire109[(1'h1):(1'h1)]) : (^wire114[(3'h5):(1'h1)]))) ?
                  $signed((~|{$unsigned(wire84)})) : $unsigned($signed((+(wire14 + wire113)))));
            end
        end
      reg203 <= (reg201[(1'h1):(1'h1)] != $signed((+($unsigned(wire82) & $signed(wire13)))));
    end
  assign wire204 = $signed($signed((^{(|wire86), wire14[(4'h8):(2'h2)]})));
endmodule

module module115  (y, clk, wire120, wire119, wire118, wire117, wire116);
  output wire [(32'h315):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire120;
  input wire [(2'h2):(1'h0)] wire119;
  input wire signed [(5'h12):(1'h0)] wire118;
  input wire signed [(5'h10):(1'h0)] wire117;
  input wire [(4'he):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire186;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(5'h14):(1'h0)] wire184;
  wire signed [(4'hf):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire150;
  wire [(5'h12):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire [(4'hb):(1'h0)] wire138;
  wire signed [(5'h15):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(5'h13):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'hf):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(2'h3):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(4'ha):(1'h0)] reg159 = (1'h0);
  reg [(4'hf):(1'h0)] reg158 = (1'h0);
  reg [(5'h15):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(4'h8):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(5'h11):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(5'h10):(1'h0)] reg123 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  assign y = {wire186,
                 wire185,
                 wire184,
                 wire162,
                 wire161,
                 wire150,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= (~&(((wire117 ?
                  wire118[(4'ha):(1'h0)] : ((8'hba) ? wire117 : wire116)) ?
              wire116 : {wire117}) ?
          ({$unsigned((8'hb0)), ((8'hbf) ? wire116 : wire118)} ?
              (^(~(8'hb4))) : ($signed(wire116) ?
                  $signed(wire119) : (^wire118))) : {($signed(wire116) ?
                  wire118[(3'h5):(1'h1)] : $signed(wire118))}));
      if (wire117)
        begin
          reg122 <= $signed((~$signed(reg121)));
          if (wire118)
            begin
              reg123 <= wire119;
              reg124 <= reg121[(3'h4):(1'h0)];
            end
          else
            begin
              reg123 <= $signed($unsigned(($unsigned((reg124 | wire119)) ^ ((&wire118) | (!wire118)))));
              reg124 <= reg123;
              reg125 <= (($signed((reg121 == {reg123})) + $unsigned(reg123[(4'hf):(1'h0)])) ?
                  wire119 : $signed(reg122[(4'ha):(3'h7)]));
              reg126 <= reg124;
              reg127 <= reg126[(3'h4):(1'h1)];
            end
        end
      else
        begin
          if ($unsigned($unsigned($signed($signed((|wire118))))))
            begin
              reg122 <= (8'haf);
            end
          else
            begin
              reg122 <= {$unsigned($signed($unsigned((&wire120)))),
                  $signed(($unsigned((~|reg124)) <= (reg122[(3'h4):(3'h4)] > (~wire120))))};
              reg123 <= $unsigned($unsigned(reg124));
              reg124 <= ((wire120[(4'hd):(3'h4)] ?
                  $signed(((reg124 ?
                      reg124 : reg123) - $unsigned(wire120))) : (wire116 && reg123)) || {$unsigned(reg127),
                  (-$unsigned((wire116 || wire117)))});
              reg125 <= (8'ha5);
              reg126 <= $signed(wire118[(4'ha):(3'h6)]);
            end
          if (reg126)
            begin
              reg127 <= (!(reg124 ?
                  {reg124[(4'hf):(1'h0)], (8'hbb)} : (&((reg127 ?
                          wire119 : reg122) ?
                      ((8'hb9) <<< reg126) : $unsigned((8'hb5))))));
              reg128 <= (~^(&(((reg123 ? wire119 : reg121) & (wire118 ?
                      reg127 : wire118)) ?
                  ($signed(wire116) ?
                      wire119[(1'h0):(1'h0)] : wire117[(5'h10):(4'hf)]) : reg124)));
            end
          else
            begin
              reg127 <= reg127[(1'h0):(1'h0)];
              reg128 <= (^reg127[(3'h4):(1'h1)]);
              reg129 <= wire119;
              reg130 <= (8'hab);
            end
        end
      if ($signed(reg128))
        begin
          reg131 <= (~^{wire117[(1'h1):(1'h0)],
              $signed(reg129[(1'h0):(1'h0)])});
          reg132 <= $unsigned((wire120 ?
              $unsigned($signed((reg124 >= reg125))) : wire119));
          reg133 <= $unsigned((((reg124[(1'h1):(1'h1)] ?
                      $signed(reg130) : ((8'hae) - wire120)) ?
                  {$signed(reg124), (-reg132)} : ($unsigned(reg128) ?
                      {reg132} : $unsigned(wire120))) ?
              $unsigned($signed($signed(wire117))) : (+wire117)));
        end
      else
        begin
          reg131 <= $unsigned($signed(wire120));
          reg132 <= (&wire117[(3'h6):(1'h0)]);
        end
      reg134 <= $unsigned((!$signed(reg128)));
      reg135 <= {((^~$unsigned((~&reg133))) ?
              (reg129[(1'h0):(1'h0)] ^~ $unsigned(reg122)) : (((reg128 ?
                      reg127 : reg127) ?
                  reg122[(4'hd):(3'h4)] : (+reg128)) >> $unsigned((reg127 ?
                  reg134 : wire119)))),
          $signed(($signed($unsigned(reg131)) ?
              (~|reg124[(3'h7):(2'h2)]) : $unsigned(reg122)))};
    end
  assign wire136 = $unsigned(((&($unsigned((8'hb8)) ?
                           (reg129 ? reg122 : (7'h43)) : reg125)) ?
                       {reg134} : $unsigned((^{wire120, reg121}))));
  assign wire137 = $unsigned(((~&$signed({reg124, reg123})) ?
                       $unsigned($unsigned($signed(reg135))) : (((reg123 >= reg135) & reg133) != (reg130[(4'h8):(3'h4)] * reg127))));
  assign wire138 = reg122[(3'h4):(3'h4)];
  assign wire139 = (wire138 ?
                       $unsigned((reg135[(2'h3):(2'h3)] ?
                           ((wire120 - reg128) ?
                               wire138 : ((8'hbd) ?
                                   wire118 : (8'hb5))) : ((reg128 ^~ reg134) > $unsigned(reg132)))) : (({reg123} && (|(^wire119))) ?
                           wire117 : {($unsigned(wire117) ?
                                   $signed(reg133) : $signed(reg131)),
                               $signed((wire119 ? reg122 : (7'h44)))}));
  assign wire140 = $signed($unsigned({wire137}));
  assign wire141 = (|(reg127 ?
                       (reg127[(4'hc):(4'hb)] <<< $signed((reg131 | reg123))) : ($unsigned(reg131) && reg134[(1'h1):(1'h1)])));
  assign wire142 = wire138;
  assign wire143 = ((((^~$signed(reg133)) >> (~|{wire140})) & wire137[(5'h10):(4'hb)]) ?
                       $signed($signed(((~|wire119) ?
                           wire117[(1'h1):(1'h0)] : ((8'hbc) <= wire141)))) : ((8'ha6) + $signed((!wire136))));
  always
    @(posedge clk) begin
      if ((~|(~^((8'ha4) ?
          (!((7'h40) + (8'h9e))) : (reg126[(1'h1):(1'h1)] * {wire119,
              reg133})))))
        begin
          if ($unsigned($signed(reg129[(1'h0):(1'h0)])))
            begin
              reg144 <= ($unsigned(wire140) <= $signed(reg123));
              reg145 <= (($signed(reg129) ?
                      (($signed(reg123) ?
                          (8'hb2) : (wire118 - (8'hae))) <= ((&reg125) ?
                          ((7'h42) >> (8'hb7)) : (|reg126))) : (~^(|reg124[(4'hc):(4'hc)]))) ?
                  {$signed(reg133[(1'h1):(1'h0)]),
                      (((^~wire119) & reg133[(4'h8):(3'h5)]) + ($signed(wire139) ?
                          (wire140 ?
                              reg144 : reg135) : (reg127 & reg121)))} : ($unsigned((wire120[(4'hd):(2'h2)] ?
                      $signed(reg132) : (^(7'h41)))) != $unsigned($unsigned((-(8'ha9))))));
              reg146 <= wire140;
              reg147 <= ($signed($signed($signed({wire138,
                  reg135}))) + reg121[(3'h5):(3'h5)]);
            end
          else
            begin
              reg144 <= wire116[(4'he):(3'h5)];
              reg145 <= reg130[(3'h4):(2'h2)];
              reg146 <= {$unsigned((((8'ha1) ?
                          (wire143 ? reg134 : (8'h9f)) : (^~wire140)) ?
                      wire116[(2'h3):(2'h3)] : (~|reg131))),
                  wire137[(3'h4):(1'h1)]};
              reg147 <= (&$unsigned((+$unsigned($signed(wire118)))));
            end
          reg148 <= ($unsigned($signed($unsigned($signed(reg129)))) ?
              $unsigned(($signed($unsigned((8'had))) == (^$signed(wire138)))) : $signed($unsigned(reg133[(3'h5):(1'h0)])));
        end
      else
        begin
          reg144 <= $unsigned((&(8'h9d)));
          reg145 <= wire117;
          reg146 <= $signed(reg132[(3'h4):(3'h4)]);
          reg147 <= reg133[(3'h6):(1'h0)];
        end
      reg149 <= reg146[(3'h6):(1'h0)];
    end
  assign wire150 = ((({reg135[(1'h1):(1'h1)]} ?
                       wire120 : reg134[(4'ha):(2'h3)]) <<< $unsigned((8'haf))) ^ $unsigned((((reg131 + (8'h9c)) << $unsigned(wire136)) || reg133[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      if (reg145)
        begin
          reg151 <= ($unsigned($unsigned((reg127[(3'h6):(2'h2)] >> (reg129 ?
              wire137 : wire119)))) << {$signed($unsigned($unsigned(wire150)))});
          if (((((^reg151[(3'h4):(2'h3)]) ~^ (8'h9c)) || ({(wire119 ?
                          reg129 : wire136),
                      ((8'hbf) ? (8'h9f) : reg127)} ?
                  reg134[(1'h1):(1'h0)] : (~&reg147))) ?
              (~&(reg124 ?
                  ((&reg122) ?
                      wire141 : (reg122 ?
                          reg124 : (8'hb2))) : (|(^~wire140)))) : reg149))
            begin
              reg152 <= {(((~&(&reg129)) && ($signed(reg122) ?
                          $signed((7'h41)) : $unsigned(reg122))) ?
                      (((reg132 && wire136) ?
                          $unsigned(wire117) : $signed(reg131)) ^~ reg131) : $signed(reg127[(4'h9):(1'h1)]))};
              reg153 <= $unsigned(((~|{$signed(wire118),
                  ((8'hbb) << (8'haf))}) < $unsigned($unsigned((-reg152)))));
              reg154 <= reg126[(3'h5):(1'h0)];
              reg155 <= $signed(reg129[(1'h0):(1'h0)]);
            end
          else
            begin
              reg152 <= (~(($unsigned((+reg133)) < wire138) > $signed({{reg149}})));
              reg153 <= ((~^wire150[(4'ha):(4'ha)]) ? wire142 : (8'hbd));
              reg154 <= $signed(wire142[(5'h13):(4'hc)]);
            end
          if (reg127[(4'h8):(1'h1)])
            begin
              reg156 <= (8'hb0);
              reg157 <= reg124;
              reg158 <= reg148[(5'h10):(3'h4)];
              reg159 <= ((reg145[(5'h10):(3'h5)] ?
                      wire119 : $signed((^~$unsigned(reg155)))) ?
                  (8'hb4) : {$signed($signed($unsigned(reg154))),
                      $signed($signed(wire141[(1'h0):(1'h0)]))});
            end
          else
            begin
              reg156 <= (-reg152);
            end
        end
      else
        begin
          reg151 <= $unsigned(reg132);
          reg152 <= (wire140 ? {wire118[(1'h1):(1'h1)]} : (8'hb7));
          reg153 <= (8'ha6);
          reg154 <= $unsigned(reg132);
          if ($unsigned(reg132))
            begin
              reg155 <= reg146;
              reg156 <= wire137;
              reg157 <= {reg126,
                  ((reg153 ^ $signed((^~reg152))) != $signed(wire137))};
            end
          else
            begin
              reg155 <= (^$signed(reg151[(3'h7):(2'h2)]));
            end
        end
      reg160 <= (&((&$signed(((8'hb6) ?
          reg126 : reg133))) > $unsigned(($signed(wire140) ?
          reg157 : reg156[(3'h4):(2'h2)]))));
    end
  assign wire161 = (reg144[(2'h2):(1'h1)] ?
                       wire139[(2'h3):(2'h2)] : ((8'hab) ?
                           (8'ha7) : (&(~&(wire136 << reg152)))));
  assign wire162 = (($signed(wire140[(4'hf):(4'hb)]) & reg151) ?
                       $unsigned(reg147) : reg133[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg163 <= wire136[(3'h5):(2'h2)];
      if (((^~reg163) ?
          (({(~^reg149), reg121} < reg160[(3'h7):(3'h6)]) ?
              (8'hb3) : (wire120 ?
                  $unsigned(reg146) : $unsigned($unsigned(reg124)))) : $signed(($signed((reg126 ?
                  reg155 : (8'hb3))) ?
              (((8'had) >> reg125) >>> ((7'h44) + reg144)) : wire162[(4'h8):(3'h6)]))))
        begin
          if ($signed(wire118))
            begin
              reg164 <= (reg133[(3'h5):(2'h3)] > (~&$unsigned(({reg156,
                  (8'hab)} - (reg130 ? wire150 : reg123)))));
              reg165 <= wire143[(4'hb):(1'h0)];
              reg166 <= $unsigned($unsigned((wire120 ?
                  reg158[(4'h8):(2'h3)] : ({reg149} << {(8'h9d)}))));
              reg167 <= reg126;
            end
          else
            begin
              reg164 <= (~&$signed(reg125[(3'h7):(3'h4)]));
              reg165 <= $signed(wire120);
              reg166 <= ($signed({((reg121 == (8'hab)) ?
                      (8'h9e) : (reg124 ? reg165 : (8'hba))),
                  reg166}) ^~ $signed(($signed(reg148) ?
                  $unsigned((reg155 > reg129)) : (reg123 >>> (reg151 * reg134)))));
            end
          reg168 <= {$unsigned({{reg167}})};
          reg169 <= (reg168[(3'h5):(1'h1)] && ($unsigned(reg146[(3'h5):(2'h2)]) != ((&(^wire139)) << (wire142[(3'h4):(2'h3)] << wire116[(1'h0):(1'h0)]))));
          reg170 <= $signed(reg164);
          reg171 <= {$signed(($signed($signed(reg146)) ?
                  (!(reg146 ? wire143 : wire140)) : wire150[(3'h6):(3'h4)]))};
        end
      else
        begin
          if (((8'h9c) ^~ (8'ha4)))
            begin
              reg164 <= reg165[(2'h2):(1'h1)];
              reg165 <= reg145[(4'hf):(4'h8)];
              reg166 <= $signed(((|$signed($unsigned(wire150))) + $unsigned(reg165[(4'h9):(1'h1)])));
              reg167 <= (({reg156[(3'h5):(3'h4)], reg121} <= (^~((reg134 ?
                      reg126 : reg135) ?
                  (^~reg133) : ((8'hbe) ? reg169 : reg129)))) << wire140);
              reg168 <= ($signed(((7'h40) & (reg170 * wire142[(3'h6):(2'h3)]))) ?
                  reg156 : ((wire138[(2'h3):(1'h0)] < {(reg130 ?
                              reg135 : reg157)}) ?
                      (!(8'ha0)) : (+reg125[(2'h2):(1'h0)])));
            end
          else
            begin
              reg164 <= $signed((~&{($unsigned(wire150) ?
                      (-reg130) : reg149[(4'hf):(4'hb)]),
                  $signed({reg160, (8'ha8)})}));
            end
        end
      if ({reg135})
        begin
          if ((reg148 ?
              reg155[(4'h9):(3'h5)] : (($unsigned((reg170 ~^ wire120)) * (wire142[(4'h8):(1'h1)] ?
                  wire161 : (reg125 + wire161))) <= $signed($signed($signed(reg168))))))
            begin
              reg172 <= wire139;
              reg173 <= $signed(reg145);
              reg174 <= ($signed((reg167[(1'h0):(1'h0)] <<< reg158[(3'h5):(2'h3)])) < (reg123 ?
                  reg124 : ({(reg157 ?
                          reg152 : reg149)} | reg169[(4'h9):(2'h2)])));
              reg175 <= reg132[(2'h3):(2'h2)];
            end
          else
            begin
              reg172 <= reg158;
              reg173 <= ((reg130 + {((!reg145) == (|reg129))}) | ($unsigned((((8'hbd) & (8'hbf)) >= {wire138})) ~^ reg175));
              reg174 <= $unsigned(($signed(((&reg121) ?
                  $unsigned(wire141) : (~^reg146))) ^~ ((+(reg123 > reg123)) ?
                  (wire161 >= (reg134 ?
                      (8'hab) : reg128)) : $signed($signed(reg174)))));
              reg175 <= (-($unsigned($unsigned((reg131 ? reg152 : reg135))) ?
                  reg175 : (reg166[(3'h4):(1'h0)] != $signed(reg170[(4'h8):(3'h4)]))));
            end
          reg176 <= $unsigned(wire116[(4'h9):(2'h3)]);
          reg177 <= reg132;
          reg178 <= reg130[(4'he):(2'h3)];
          if (((($signed((^(8'hb3))) == reg130) - reg156[(3'h6):(2'h3)]) << {wire136[(3'h5):(2'h3)],
              (^~(^~$signed(reg135)))}))
            begin
              reg179 <= ($unsigned(reg126) ?
                  (-($signed((+reg169)) ?
                      $unsigned($signed(reg164)) : reg158)) : ((reg164 ?
                          ($unsigned(reg171) ?
                              (wire117 ?
                                  wire161 : wire143) : $signed(reg144)) : reg145) ?
                      ((!$unsigned(reg132)) ?
                          ($signed(reg171) >= (~^wire117)) : $signed(reg124)) : (~reg130)));
            end
          else
            begin
              reg179 <= $unsigned($signed($signed(((^~reg146) ?
                  reg133[(3'h6):(3'h4)] : $unsigned((8'h9f))))));
              reg180 <= $signed(((|({wire142} ?
                  (+reg176) : (~^reg160))) & $unsigned((8'haa))));
              reg181 <= $signed(reg128);
              reg182 <= $signed({(!reg129[(1'h1):(1'h0)]), reg131});
            end
        end
      else
        begin
          reg172 <= (reg165[(2'h2):(2'h2)] - $signed((reg145[(4'hd):(2'h2)] <<< reg145)));
          reg173 <= $unsigned($unsigned($unsigned(reg164)));
          reg174 <= reg126;
          if (reg134)
            begin
              reg175 <= reg152;
              reg176 <= (~|reg131[(3'h5):(3'h4)]);
            end
          else
            begin
              reg175 <= (+$signed(($signed({reg148,
                  wire141}) >>> $unsigned($signed(reg157)))));
              reg176 <= reg160[(4'hf):(4'he)];
            end
          reg177 <= reg169;
        end
      reg183 <= {($unsigned((^~$signed(reg125))) <= (+((reg124 ?
                  reg151 : (8'hb1)) ?
              ((7'h41) ? reg129 : reg130) : $signed(reg130)))),
          reg122};
    end
  assign wire184 = (~|reg171[(2'h3):(1'h0)]);
  assign wire185 = (8'hb2);
  assign wire186 = $signed($unsigned($unsigned($unsigned((wire116 ~^ reg132)))));
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire92;
  input wire [(5'h14):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire90;
  input wire signed [(4'hf):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire98;
  wire signed [(2'h2):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 reg106,
                 reg101,
                 reg100,
                 reg99,
                 reg96,
                 (1'h0)};
  assign wire93 = (^~wire92[(4'h9):(2'h3)]);
  assign wire94 = $signed((wire91 ?
                      (wire92[(2'h2):(1'h0)] < wire91) : {wire92[(3'h7):(3'h5)],
                          ((&(8'hb1)) << (^~wire88))}));
  assign wire95 = $signed({$signed({(wire92 - (8'hb5)), wire91}), wire88});
  always
    @(posedge clk) begin
      reg96 <= {$unsigned($unsigned((~|((8'ha2) ^ wire95))))};
    end
  assign wire97 = wire93[(5'h15):(2'h3)];
  assign wire98 = wire92[(5'h11):(4'hd)];
  always
    @(posedge clk) begin
      reg99 <= {$signed($signed((wire98 + (8'h9f))))};
      reg100 <= wire95;
      reg101 <= $signed(wire93);
    end
  assign wire102 = {(~|reg101),
                       $signed((wire98 ?
                           (-wire88[(1'h0):(1'h0)]) : ($unsigned(reg96) | wire97)))};
  assign wire103 = (($unsigned(($unsigned(wire97) ^ $unsigned(wire88))) ?
                           (|reg99) : $signed($unsigned((wire91 ?
                               wire93 : wire88)))) ?
                       {wire91, $signed($unsigned(wire89))} : ((({wire102,
                                   wire98} || (wire93 ? wire93 : wire97)) ?
                               $signed(wire92) : $signed(wire90)) ?
                           (wire89 > wire91[(3'h7):(3'h7)]) : ((^reg96[(3'h4):(1'h0)]) > reg99)));
  assign wire104 = ((^~(^~$signed((~|wire89)))) ?
                       wire98[(2'h3):(1'h0)] : ($unsigned($unsigned((-(8'ha5)))) + (|$signed((-(8'ha2))))));
  assign wire105 = wire92;
  always
    @(posedge clk) begin
      reg106 <= $unsigned((($signed($unsigned(wire102)) ?
              wire105[(2'h2):(1'h0)] : (reg101[(3'h4):(2'h3)] ~^ $signed(wire93))) ?
          (8'ha5) : (~wire104[(4'hd):(3'h4)])));
    end
  assign wire107 = (^~wire93);
  assign wire108 = {wire94,
                       $signed((wire94[(4'hf):(4'hd)] - (~$unsigned(wire92))))};
endmodule

module module46
#(parameter param80 = (((~^(8'hab)) & {{((8'ha6) ? (8'ha7) : (8'ha0)), ((8'hbc) ? (8'hb4) : (8'had))}}) && (!{(&(~^(8'hb8))), {(|(8'hbd))}})), 
parameter param81 = ((+((~^(-param80)) ? ((!(8'h9f)) ^~ param80) : {{param80, param80}, ((8'ha7) - param80)})) * ({param80, ((~&(8'hae)) * (param80 ? param80 : param80))} >= ((~&(param80 + param80)) ? ((~&(8'h9e)) ? param80 : (&param80)) : param80))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire50;
  input wire [(4'hd):(1'h0)] wire49;
  input wire signed [(3'h4):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  assign y = {wire79,
                 wire75,
                 wire53,
                 wire52,
                 wire51,
                 reg78,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire51 = ($signed(($signed($signed((8'hba))) ?
                          wire50[(2'h3):(1'h0)] : $signed((wire49 - wire47)))) ?
                      $signed($signed(wire48[(3'h4):(2'h2)])) : $signed($unsigned({$unsigned(wire47)})));
  assign wire52 = $signed((&$unsigned((!(8'hb7)))));
  assign wire53 = (~^(~^{((&(8'hbc)) ^~ wire51)}));
  always
    @(posedge clk) begin
      reg54 <= (wire53[(4'hd):(4'h9)] >> wire51[(1'h1):(1'h0)]);
      if ($signed({($signed($unsigned(wire50)) ?
              {wire49} : ((wire51 < wire50) ^~ wire48[(1'h0):(1'h0)])),
          wire53}))
        begin
          if ($unsigned((8'had)))
            begin
              reg55 <= $unsigned($unsigned(wire49));
              reg56 <= $signed($unsigned(($unsigned((reg55 < wire51)) ?
                  ({wire53, (8'ha7)} ?
                      $signed(wire52) : $signed((8'hb4))) : ($signed((8'hbd)) == wire50))));
            end
          else
            begin
              reg55 <= $unsigned({$unsigned(({(8'ha8)} ?
                      $unsigned(wire49) : (reg55 < wire47))),
                  $signed((8'hb2))});
              reg56 <= $signed((({(8'hb5)} == $unsigned((wire49 ?
                      (8'ha2) : wire50))) ?
                  wire50[(1'h1):(1'h0)] : $signed(reg55)));
              reg57 <= {(($unsigned({wire48, wire47}) ?
                          $unsigned(wire48[(3'h4):(2'h2)]) : $unsigned($unsigned(wire47))) ?
                      wire53[(4'h9):(2'h3)] : $unsigned($unsigned((wire52 & (8'hae)))))};
              reg58 <= $signed(wire49);
            end
          reg59 <= wire51;
        end
      else
        begin
          reg55 <= (reg58[(2'h2):(2'h2)] - $unsigned((^~((|wire47) ?
              (~wire51) : (wire48 & reg57)))));
        end
      reg60 <= ($signed(wire53[(4'hb):(3'h6)]) ?
          wire53[(4'h8):(2'h2)] : wire48);
      if ($unsigned({$unsigned(reg58), reg58}))
        begin
          reg61 <= wire52[(4'hb):(1'h0)];
        end
      else
        begin
          reg61 <= $signed(reg57[(3'h6):(2'h2)]);
          if (wire50)
            begin
              reg62 <= (($signed((8'ha1)) <= reg59) || reg54);
              reg63 <= (~^(~^wire49));
              reg64 <= reg58[(4'h9):(3'h5)];
              reg65 <= reg56;
              reg66 <= {(+{(wire51 << wire50[(2'h2):(1'h1)])}),
                  reg65[(1'h0):(1'h0)]};
            end
          else
            begin
              reg62 <= reg65;
              reg63 <= wire53;
              reg64 <= (reg60[(2'h3):(2'h3)] >>> $unsigned($unsigned(($signed(reg64) ?
                  (wire53 ? reg56 : reg55) : reg65[(2'h3):(1'h1)]))));
              reg65 <= $signed(($signed(reg60) ?
                  reg56[(3'h5):(1'h0)] : (8'hb3)));
            end
        end
      if (reg57)
        begin
          if ((reg58[(2'h2):(2'h2)] && $unsigned({($signed(reg60) ?
                  (~^reg66) : reg63),
              $unsigned($signed(reg64))})))
            begin
              reg67 <= (~^(~|(~((^~reg64) || (~&(8'hac))))));
            end
          else
            begin
              reg67 <= (reg61 ? wire53 : reg63[(4'ha):(3'h7)]);
              reg68 <= (reg61[(4'ha):(4'h8)] ?
                  reg60[(2'h2):(2'h2)] : $unsigned({$unsigned((wire52 ?
                          reg54 : (8'ha0)))}));
              reg69 <= $unsigned(($unsigned(wire47) ^ (~^reg64)));
            end
          reg70 <= {((reg69 & $signed((reg57 ?
                  reg69 : wire49))) ^~ $signed((8'ha6))),
              ((+((-reg66) ? (reg56 <= wire52) : (^~wire47))) ?
                  ((reg60[(1'h0):(1'h0)] ? {(8'hb5)} : wire51[(1'h1):(1'h1)]) ?
                      (wire52 && reg54) : $signed((~^(8'haa)))) : $unsigned((+(&wire52))))};
          if (((!wire53) & reg65[(1'h1):(1'h0)]))
            begin
              reg71 <= $unsigned(($unsigned({{(8'hb9), reg68},
                      {reg66, (8'hbc)}}) ?
                  ($unsigned(reg58) ?
                      ($signed(reg67) && $signed(reg70)) : $signed((~&wire51))) : ((~&(~|wire47)) ?
                      (|$signed(reg61)) : $unsigned((reg54 ? reg68 : reg58)))));
              reg72 <= reg56[(3'h5):(3'h4)];
              reg73 <= (^$signed($unsigned($signed((reg72 >= reg70)))));
              reg74 <= ({(((wire49 ? wire51 : (8'h9c)) ^~ (reg67 ?
                          wire51 : reg67)) ?
                      ({wire53, reg61} * reg54) : reg54),
                  (((~&wire49) | (~|reg57)) ?
                      reg57[(2'h2):(1'h0)] : ($unsigned(wire52) && {reg67}))} != (!{$signed((wire50 ?
                      reg70 : reg70)),
                  $signed((reg56 < reg60))}));
            end
          else
            begin
              reg71 <= wire53[(3'h7):(3'h5)];
              reg72 <= (+reg56[(4'ha):(3'h6)]);
              reg73 <= (^reg73[(5'h12):(1'h0)]);
              reg74 <= (reg66 >= (8'ha3));
            end
        end
      else
        begin
          reg67 <= wire50[(1'h1):(1'h1)];
        end
    end
  assign wire75 = $signed({(wire51[(3'h7):(2'h2)] ?
                          reg57[(3'h5):(2'h2)] : reg58[(2'h2):(2'h2)]),
                      $unsigned(wire49[(4'h9):(3'h6)])});
  always
    @(posedge clk) begin
      reg76 <= (wire49 << ($signed(reg64) <<< {$signed($unsigned(wire75))}));
      reg77 <= $signed((({$unsigned((8'haf))} ?
              wire48[(1'h0):(1'h0)] : $signed((~|reg69))) ?
          (~|(reg61 & {reg69, reg66})) : (reg76[(1'h0):(1'h0)] ?
              reg54[(3'h5):(3'h5)] : (8'hac))));
      reg78 <= $signed($unsigned({(+(&wire51))}));
    end
  assign wire79 = wire52;
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= (-{$signed({wire18[(3'h5):(2'h2)], {wire19, wire20}}),
          ({$signed((8'hba)), $signed(wire19)} <= (+(7'h44)))});
      reg23 <= (wire20[(5'h10):(3'h4)] | (~&{((wire21 * (8'hb6)) ?
              $unsigned((8'hbf)) : wire20[(4'ha):(3'h6)]),
          wire20}));
    end
  always
    @(posedge clk) begin
      reg24 <= wire20[(4'hb):(4'h9)];
      reg25 <= wire21;
      if ((($signed($signed($unsigned((7'h41)))) ?
          ({wire19[(2'h2):(1'h1)]} ?
              reg25[(4'hc):(3'h5)] : wire18) : (reg25[(4'h8):(4'h8)] ?
              ((wire20 ? wire21 : reg22) || {wire18,
                  reg23}) : wire21[(2'h3):(2'h3)])) & (-($unsigned((wire21 && (8'ha2))) ?
          ((wire19 < reg24) ?
              (!wire18) : $signed(wire21)) : $unsigned((!(8'ha2)))))))
        begin
          reg26 <= $signed(wire21[(2'h2):(2'h2)]);
          if (($unsigned(wire21[(2'h3):(2'h2)]) ? wire18 : $unsigned(wire18)))
            begin
              reg27 <= ((reg25[(1'h0):(1'h0)] != {(^~(-(8'hbb)))}) ?
                  $unsigned((($unsigned(wire21) ? reg26 : (reg24 >> reg23)) ?
                      wire18 : $signed((7'h41)))) : wire19[(1'h1):(1'h1)]);
              reg28 <= reg22;
            end
          else
            begin
              reg27 <= reg25[(3'h5):(3'h5)];
            end
        end
      else
        begin
          if (wire18[(4'he):(1'h0)])
            begin
              reg26 <= (((~&reg27) ^~ $unsigned($signed(reg22))) != $signed($signed($signed((!reg22)))));
              reg27 <= (^$unsigned(($unsigned((reg25 ? wire21 : (7'h43))) ?
                  $signed(reg28[(3'h6):(1'h1)]) : {$unsigned((8'hac)),
                      (wire20 ? reg23 : reg24)})));
            end
          else
            begin
              reg26 <= $signed($unsigned((reg28[(3'h4):(1'h0)] ?
                  $signed({reg26, reg25}) : (&$signed(wire21)))));
              reg27 <= $unsigned(reg27);
              reg28 <= $unsigned(reg27[(1'h1):(1'h0)]);
            end
        end
    end
  assign wire29 = (reg28 >>> {$unsigned((reg28 && {reg24, reg27}))});
  assign wire30 = $unsigned(($signed((+reg27)) ?
                      $unsigned(($unsigned(reg24) ?
                          (8'hb9) : $signed(reg27))) : $unsigned(($signed(reg22) ?
                          ((8'hbd) + (8'h9e)) : $signed((8'hac))))));
  assign wire31 = (wire18 <= {(^~$unsigned($unsigned(reg25)))});
  assign wire32 = $unsigned(($signed((+$signed((8'ha9)))) ^ (^~($signed(reg27) ?
                      wire31 : $signed((8'hb5))))));
  always
    @(posedge clk) begin
      if ($unsigned(reg27))
        begin
          if ($unsigned(((reg26[(4'h8):(4'h8)] && (wire21 >= (~^wire29))) * reg24[(1'h0):(1'h0)])))
            begin
              reg33 <= {$unsigned(({$signed(wire21), $signed((8'h9f))} ?
                      (8'ha9) : {(reg25 == reg24)}))};
              reg34 <= (8'hbd);
              reg35 <= $signed($signed(reg23[(4'h8):(2'h3)]));
            end
          else
            begin
              reg33 <= (^~((~&($unsigned(reg22) + $signed(wire29))) ?
                  ({(~wire18)} >> $signed($signed((8'ha3)))) : $unsigned(wire18)));
              reg34 <= (~^$signed(reg27[(3'h4):(2'h2)]));
              reg35 <= wire18;
              reg36 <= $signed({(!$unsigned((8'hb2))),
                  $unsigned($signed((8'h9f)))});
              reg37 <= ((8'hb9) ?
                  reg35 : (reg27 ? $signed(reg35[(3'h5):(1'h0)]) : reg34));
            end
          reg38 <= wire19;
          reg39 <= reg22;
        end
      else
        begin
          if ($unsigned($signed($unsigned((^$signed(wire19))))))
            begin
              reg33 <= {(&(8'h9e))};
              reg34 <= ((reg24[(1'h1):(1'h1)] ?
                      $unsigned((~^(8'hb5))) : wire29) ?
                  ({{$signed(reg28)}} <<< ($unsigned($signed(reg25)) - {(wire32 ?
                          reg28 : (8'ha7))})) : {{reg25[(2'h3):(2'h2)]},
                      {(!{reg27, reg35})}});
              reg35 <= ((&(((reg26 ? (8'haf) : wire30) == (!reg33)) ?
                  (-(|reg38)) : ($signed(reg33) ?
                      $signed(reg36) : ((8'hbc) * reg38)))) ^ $signed(reg28));
            end
          else
            begin
              reg33 <= $unsigned(((-reg28[(1'h0):(1'h0)]) != (8'ha1)));
            end
          reg36 <= $unsigned(reg38);
        end
      reg40 <= ((~^wire30) ?
          {(((^~wire18) < (reg39 ? (8'haf) : wire21)) ?
                  ((~reg33) && $unsigned((8'hb5))) : wire29[(4'hc):(3'h4)]),
              ($unsigned($unsigned(reg27)) >> $signed(((8'ha5) > reg23)))} : wire19);
      reg41 <= $signed(($signed($signed({wire30})) || reg34));
    end
endmodule
