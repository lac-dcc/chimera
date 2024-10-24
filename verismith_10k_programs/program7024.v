module top
#(parameter param200 = ((~&(((8'ha3) ? ((8'h9d) ? (8'h9d) : (8'ha3)) : (-(8'hbb))) ? {{(8'hbd), (8'hb6)}} : ((-(8'haf)) ? (&(8'ha6)) : {(8'ha4)}))) ? ((8'haf) * {(8'hbb), (((7'h43) ? (8'h9d) : (8'hbf)) <<< {(8'h9c)})}) : {((((8'h9c) ^ (8'hb4)) < {(8'ha8)}) == (^((8'ha5) ~^ (8'had))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire198;
  wire signed [(5'h15):(1'h0)] wire197;
  wire [(4'hb):(1'h0)] wire196;
  wire signed [(5'h10):(1'h0)] wire195;
  wire signed [(4'hc):(1'h0)] wire191;
  wire signed [(4'h8):(1'h0)] wire190;
  wire signed [(4'hc):(1'h0)] wire189;
  wire [(3'h4):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(3'h5):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire193;
  reg signed [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire185,
                 wire22,
                 wire21,
                 wire20,
                 wire17,
                 wire16,
                 wire15,
                 wire6,
                 wire5,
                 wire4,
                 wire193,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire1[(4'h9):(3'h6)];
  assign wire6 = ((((~|$unsigned(wire4)) ?
                             ($signed(wire1) ?
                                 wire2 : ((8'hbe) + wire2)) : wire3) ?
                         $unsigned(wire5[(3'h6):(2'h2)]) : (wire1[(4'he):(2'h2)] ?
                             ((wire5 - (8'hae)) ?
                                 wire2 : $unsigned((7'h44))) : $unsigned(wire5))) ?
                     wire2[(4'h8):(1'h0)] : wire0[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg7 <= {wire5[(3'h7):(3'h7)]};
          reg8 <= (wire5[(3'h4):(1'h0)] ?
              $signed(({$signed(wire0), $unsigned((8'h9c))} ?
                  (^$unsigned(wire5)) : wire2)) : wire3);
          reg9 <= $signed(wire5[(1'h1):(1'h0)]);
          if (wire0[(2'h2):(1'h1)])
            begin
              reg10 <= (((!(&$signed(reg9))) && ($signed({wire4, wire1}) ?
                      (^((8'hb4) >= (8'hb7))) : (~&(reg7 ? (8'hab) : wire3)))) ?
                  ((-{(wire1 & wire2), {(8'ha0), wire2}}) ?
                      ($unsigned(reg8[(3'h7):(3'h5)]) ?
                          $unsigned((wire0 > wire0)) : reg8[(3'h7):(1'h0)]) : reg8) : (wire6[(1'h1):(1'h1)] ?
                      (+(wire6[(2'h3):(2'h3)] ?
                          $signed(wire4) : (~reg9))) : $unsigned(((reg8 ?
                              (8'hb0) : wire3) ?
                          ((8'hae) ~^ reg9) : $signed(reg8)))));
            end
          else
            begin
              reg10 <= $signed({(~&(^$signed((8'hb7)))),
                  (((7'h42) ^~ (wire1 >= (8'ha2))) ? reg7 : (~&reg8))});
            end
          reg11 <= (!reg8);
        end
      else
        begin
          reg7 <= {(wire2 ?
                  $signed((wire1[(4'h8):(2'h2)] ?
                      (&wire2) : reg9)) : $unsigned($signed(wire3)))};
          reg8 <= ($signed((~^wire3)) ?
              {$signed((~^(wire6 ? (8'hb6) : reg11))),
                  $signed(reg7[(4'hb):(2'h2)])} : ($signed(wire4[(3'h5):(1'h1)]) != (~($unsigned(reg11) >>> $signed(wire6)))));
          if ($unsigned((~&(+wire5[(1'h0):(1'h0)]))))
            begin
              reg9 <= ((((8'hb6) ?
                  reg11[(2'h2):(1'h0)] : reg7[(4'he):(1'h1)]) || ({$unsigned((8'hac)),
                      (wire4 ? reg11 : wire5)} ?
                  wire4[(4'h8):(3'h4)] : wire1)) <= reg8[(1'h1):(1'h1)]);
              reg10 <= ((reg10[(4'he):(4'hc)] ?
                  (reg10 ?
                      (!(wire0 * reg10)) : reg10) : wire3) * (&($signed((reg8 <<< wire5)) ^~ reg10)));
              reg11 <= {($unsigned($signed($unsigned(wire2))) ?
                      (((~&(8'ha5)) * (~|reg11)) <<< (8'ha5)) : wire4[(1'h1):(1'h0)]),
                  wire3};
            end
          else
            begin
              reg9 <= ((~^wire4) ? (8'hbc) : (8'hb1));
              reg10 <= $signed((&$unsigned((7'h43))));
            end
          reg12 <= (&(8'h9d));
        end
      reg13 <= ((8'hb5) + $signed($signed(reg12)));
      reg14 <= (8'hae);
    end
  assign wire15 = (reg8[(4'hb):(2'h3)] ?
                      (reg9 ?
                          ({(8'ha7),
                              $unsigned(wire2)} < $unsigned((~|(8'hb2)))) : reg9) : $unsigned({((wire5 >>> wire6) && reg12[(4'ha):(4'ha)])}));
  assign wire16 = ({reg13[(1'h0):(1'h0)]} ?
                      (((&(reg11 ?
                          (8'hb4) : (8'hbb))) + $unsigned(reg12)) ~^ wire15) : (((&wire5[(4'h8):(2'h2)]) ^~ $unsigned((^~wire4))) ?
                          ($signed((reg10 ? reg7 : (8'hb0))) ?
                              (8'hb3) : $unsigned((+reg10))) : wire3[(3'h4):(2'h2)]));
  assign wire17 = $unsigned(reg10);
  always
    @(posedge clk) begin
      reg18 <= wire1[(2'h3):(1'h0)];
      reg19 <= {(-((8'hbd) ? reg9 : (^{reg18, reg14})))};
    end
  assign wire20 = (&wire0);
  assign wire21 = (reg11 ? wire1[(2'h3):(2'h2)] : wire20[(1'h1):(1'h0)]);
  assign wire22 = wire6;
  module23 #() modinst186 (.wire27(wire16), .wire24(wire0), .clk(clk), .y(wire185), .wire25(reg10), .wire26(reg11));
  assign wire187 = (8'hba);
  assign wire188 = {wire3};
  assign wire189 = reg18[(2'h3):(2'h3)];
  assign wire190 = ($signed(($signed($signed(reg10)) ?
                       ($signed(reg11) ?
                           wire185[(1'h0):(1'h0)] : ((8'hb0) + wire4)) : wire16[(2'h2):(2'h2)])) <= ($signed((~^{reg9})) && {$unsigned(reg9[(1'h0):(1'h0)])}));
  module102 #() modinst192 (wire191, clk, reg11, wire2, reg8, reg13, reg19);
  module83 #() modinst194 (wire193, clk, reg18, wire4, reg7, reg10, reg9);
  assign wire195 = ($unsigned((&(8'hab))) + (+wire5));
  assign wire196 = wire6[(2'h2):(1'h0)];
  assign wire197 = ((reg10 && ((&$unsigned(reg9)) * ((wire190 <= (8'ha3)) || wire0))) < ((wire5 ?
                           reg11 : ((wire193 >= wire16) * (!wire3))) ?
                       $signed(((8'hab) > $signed(wire196))) : reg10[(5'h13):(1'h0)]));
  module83 #() modinst199 (.wire86(reg14), .wire84(wire5), .clk(clk), .wire87(wire193), .wire85(wire1), .wire88(wire0), .y(wire198));
endmodule

module module23
#(parameter param184 = ({((((7'h43) ? (8'ha9) : (8'h9c)) ^ ((8'hbd) ? (8'ha1) : (8'hb1))) >= (~{(8'h9f), (8'hbf)}))} ? {{(+((8'hb7) ? (8'hb7) : (8'ha3)))}, (^~((8'hac) ? (~(8'hb7)) : ((8'hb2) ? (8'hb4) : (8'ha3))))} : (~^({((7'h40) != (8'hbc)), (~^(8'hb6))} << (((8'hb3) ? (7'h44) : (8'hb1)) != {(8'h9d), (8'hac)})))))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire183;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire181;
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  assign y = {wire183,
                 wire116,
                 wire101,
                 wire99,
                 wire28,
                 wire34,
                 wire81,
                 wire181,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire28 = wire26;
  always
    @(posedge clk) begin
      reg29 <= {({(+{wire26, wire25}),
              (~|(wire27 ? wire25 : wire25))} | wire27),
          $signed($unsigned({wire27, wire25}))};
      reg30 <= (-$signed({$signed((wire25 ~^ wire25)), wire24[(3'h7):(3'h7)]}));
      reg31 <= $signed((+$unsigned((!$signed(wire27)))));
      reg32 <= ((~&{wire26, $unsigned((reg30 + reg30))}) * wire26);
      reg33 <= (~(+$unsigned(reg31[(4'h8):(3'h7)])));
    end
  assign wire34 = (&$signed(reg30));
  module35 #() modinst82 (.wire39(reg30), .clk(clk), .wire36(wire28), .wire37(reg31), .y(wire81), .wire38(wire24), .wire40(wire34));
  module83 #() modinst100 (wire99, clk, wire27, reg33, reg29, reg31, wire81);
  assign wire101 = (reg31[(4'h8):(3'h5)] ?
                       (($unsigned({wire25,
                           reg31}) * (&$unsigned(reg32))) < $signed((^((8'hbb) & wire25)))) : ({wire24,
                           wire27[(3'h7):(3'h7)]} <= {(^~$unsigned(wire99)),
                           (8'hbb)}));
  module102 #() modinst117 (.wire105(wire25), .y(wire116), .clk(clk), .wire103(reg32), .wire104(wire27), .wire107(reg29), .wire106(wire99));
  module118 #() modinst182 (.wire120(wire28), .wire119(wire24), .wire122(wire34), .y(wire181), .clk(clk), .wire121(reg32));
  assign wire183 = wire99[(4'hc):(3'h6)];
endmodule

module module118
#(parameter param180 = {{({((8'haa) >= (8'hb4))} ? {((7'h41) & (8'ha8))} : (~(!(8'hb6)))), (~|((8'ha7) >>> (7'h41)))}, (~{({(8'hb2)} ? ((8'ha9) ? (8'hbe) : (8'haa)) : {(7'h42), (7'h41)})})})
(y, clk, wire122, wire121, wire120, wire119);
  output wire [(32'h2b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire122;
  input wire signed [(3'h4):(1'h0)] wire121;
  input wire signed [(3'h7):(1'h0)] wire120;
  input wire [(4'he):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire175;
  wire [(4'hb):(1'h0)] wire174;
  wire signed [(4'he):(1'h0)] wire173;
  wire [(4'he):(1'h0)] wire172;
  wire signed [(4'hf):(1'h0)] wire171;
  wire [(3'h4):(1'h0)] wire170;
  wire [(4'hb):(1'h0)] wire169;
  wire signed [(5'h14):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  reg [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg160 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(3'h7):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(3'h7):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(4'hc):(1'h0)] reg138 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg [(4'ha):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire165,
                 wire132,
                 wire131,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 reg177,
                 reg168,
                 reg167,
                 reg166,
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
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire123 = (~|($unsigned((~&{wire120})) << wire121[(2'h2):(1'h1)]));
  assign wire124 = wire122[(1'h0):(1'h0)];
  assign wire125 = wire119[(4'ha):(4'h8)];
  assign wire126 = $signed(wire125[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg127 <= ($unsigned(((8'hbe) ^ (wire122 & ((7'h40) ?
          (8'h9e) : wire119)))) == (wire123[(2'h2):(1'h0)] ?
          $signed((wire122 >= ((8'ha6) ?
              wire126 : (8'ha0)))) : (wire125 >> wire123[(1'h0):(1'h0)])));
      reg128 <= (((|wire119[(4'he):(4'hd)]) ?
              (((-reg127) << (~wire123)) ~^ (~^wire121)) : $signed((~|$unsigned(reg127)))) ?
          ($unsigned(((~^(8'haf)) ?
              (wire119 ?
                  wire121 : wire121) : $signed((8'ha5)))) | $signed((~((8'hb1) + reg127)))) : $unsigned($signed(($unsigned((8'hbc)) + wire124[(4'hb):(1'h1)]))));
      reg129 <= $signed((wire125 & ($unsigned({wire122}) ?
          (~^(~wire119)) : ((wire120 ? wire126 : wire125) ?
              ((8'ha3) || wire120) : wire120))));
      reg130 <= (!$unsigned({reg128, (~^(reg129 < (8'h9d)))}));
    end
  assign wire131 = {wire123[(3'h4):(1'h1)],
                       ({wire120[(2'h3):(2'h2)]} ?
                           ({(~|reg129), $unsigned(wire121)} ?
                               ($unsigned(wire122) ?
                                   (~&wire125) : wire126[(4'hf):(4'ha)]) : $unsigned(reg129[(1'h1):(1'h0)])) : wire124[(5'h12):(3'h5)])};
  assign wire132 = (reg130 ?
                       $unsigned({$unsigned((~wire121)),
                           reg129}) : ($unsigned(wire120) ?
                           wire123 : (+{$unsigned(wire125)})));
  always
    @(posedge clk) begin
      reg133 <= (8'hb5);
      reg134 <= wire122[(3'h6):(1'h1)];
      if ((((~(~&(~^reg128))) ?
              ((!$unsigned(wire125)) * wire121[(1'h0):(1'h0)]) : (^~$signed($unsigned(wire131)))) ?
          $unsigned(wire121[(1'h0):(1'h0)]) : {{$signed($signed(wire124))},
              (((^~wire120) ?
                  $unsigned(wire126) : reg134) >> reg128[(1'h0):(1'h0)])}))
        begin
          reg135 <= reg130;
          if ((reg127 ^~ reg134))
            begin
              reg136 <= $unsigned(wire120[(1'h1):(1'h0)]);
              reg137 <= (!$unsigned($signed(reg134)));
              reg138 <= $signed(wire121);
              reg139 <= reg137[(3'h6):(3'h5)];
              reg140 <= wire124;
            end
          else
            begin
              reg136 <= ({(|wire119[(3'h6):(1'h0)]),
                  $unsigned($signed(((8'haf) ? wire123 : wire132)))} | wire126);
              reg137 <= (((wire126[(1'h1):(1'h1)] ?
                      ({reg134,
                          wire131} >> (7'h44)) : (~^(~&reg138))) & {(reg127[(1'h0):(1'h0)] ?
                          (^reg128) : ((8'hb0) ? reg139 : wire124))}) ?
                  ($unsigned((~&$unsigned(reg135))) ?
                      (reg127 != {reg134[(3'h6):(3'h6)],
                          wire122[(1'h0):(1'h0)]}) : reg138[(4'hc):(4'hb)]) : wire123);
              reg138 <= reg133[(3'h5):(2'h2)];
              reg139 <= $unsigned({reg140[(4'hb):(2'h2)]});
              reg140 <= $signed($unsigned((reg138[(3'h4):(2'h3)] >= ((wire120 ?
                      wire123 : wire119) ?
                  wire119 : (reg134 ? reg127 : (8'ha9))))));
            end
          if ({(wire125 ?
                  {(reg129 ? $signed((8'hb0)) : (~reg130)),
                      reg137} : wire121[(2'h3):(1'h1)])})
            begin
              reg141 <= (+((^$signed($unsigned(reg129))) ?
                  wire125[(3'h6):(2'h3)] : (((reg133 ~^ wire131) ~^ (|reg134)) < {$unsigned((8'hbf))})));
              reg142 <= (((~|wire124) ?
                      ((8'hab) ?
                          (|(wire123 ?
                              reg141 : wire119)) : reg137[(2'h3):(1'h0)]) : wire121[(1'h0):(1'h0)]) ?
                  $signed((((^~reg128) ?
                      (reg133 ?
                          reg139 : wire121) : (wire124 && reg136)) != reg128[(3'h6):(1'h1)])) : (^(wire126[(4'ha):(3'h6)] * $unsigned($signed(reg137)))));
              reg143 <= {reg139[(4'hc):(4'hb)]};
              reg144 <= reg130[(2'h2):(1'h0)];
            end
          else
            begin
              reg141 <= reg127[(3'h7):(2'h3)];
              reg142 <= wire120;
              reg143 <= $signed($unsigned($signed($signed((reg127 ?
                  wire123 : wire124)))));
              reg144 <= $signed((^$unsigned(($signed(reg134) >> {reg133,
                  wire121}))));
            end
          if (wire120[(3'h6):(2'h2)])
            begin
              reg145 <= (((|($signed(wire120) ?
                      (reg133 & reg130) : wire120[(3'h4):(1'h1)])) == reg129) ?
                  (wire123[(3'h4):(2'h3)] ?
                      reg129 : {(~reg143[(4'h9):(1'h0)]),
                          reg140}) : $signed(({(~&reg127),
                      (reg138 | (8'hab))} >>> (((8'hab) ?
                      wire120 : (8'had)) == {reg127}))));
              reg146 <= (reg136 ?
                  ((reg127[(1'h1):(1'h1)] > ((wire126 ?
                          reg143 : reg127) >= (^wire121))) ?
                      $signed(((8'ha3) ?
                          (&wire125) : ((7'h44) > (8'haf)))) : wire131) : $unsigned($signed(reg136[(3'h4):(1'h0)])));
              reg147 <= (reg130 ?
                  ($signed(reg142) ?
                      (~&($unsigned(reg142) && $unsigned(reg136))) : $signed(({reg128} ?
                          (^wire124) : $unsigned(wire131)))) : reg133);
              reg148 <= $unsigned(reg130[(1'h1):(1'h0)]);
              reg149 <= $signed(reg148[(1'h0):(1'h0)]);
            end
          else
            begin
              reg145 <= reg139[(4'hd):(3'h5)];
            end
          if ({$signed((({reg147, reg129} ?
                      reg130[(1'h0):(1'h0)] : $signed(reg127)) ?
                  $unsigned($signed(reg128)) : (-(8'ha1))))})
            begin
              reg150 <= ($signed(((8'hb7) ?
                  reg140[(5'h12):(5'h11)] : $signed((reg148 ?
                      reg133 : wire120)))) ~^ ($signed(reg140) ?
                  reg141[(2'h2):(2'h2)] : (~&$unsigned($unsigned(wire131)))));
            end
          else
            begin
              reg150 <= (({(reg144[(2'h3):(1'h1)] <<< ((7'h40) - reg142))} + (wire120[(3'h6):(1'h1)] ?
                      reg128[(4'hd):(3'h4)] : {(reg135 * reg133)})) ?
                  ((-(|(reg146 ? reg150 : reg145))) << {(((8'ha1) ?
                          reg137 : reg150) <= $unsigned((8'h9c))),
                      ($signed(reg146) <<< (reg148 - (8'ha9)))}) : ({reg146} > ($unsigned((reg137 ?
                      reg139 : wire120)) != wire123[(1'h1):(1'h0)])));
              reg151 <= $signed($signed(reg136));
              reg152 <= $signed((~$signed(((|reg146) && reg139[(3'h4):(1'h1)]))));
              reg153 <= ({(wire122 > $unsigned((-reg135)))} ?
                  $unsigned((^(wire119[(3'h5):(3'h5)] ?
                      reg137 : wire121))) : $signed(($unsigned({wire121,
                          reg140}) ?
                      {wire131[(3'h6):(2'h2)]} : reg134[(3'h5):(1'h0)])));
              reg154 <= ($signed((((wire126 ?
                      reg151 : reg133) >> (|reg148)) - (reg151[(4'h9):(2'h2)] * $signed(reg128)))) ?
                  wire119 : $signed((($unsigned(wire132) ?
                      (8'hba) : $signed(wire126)) && $unsigned((wire124 ?
                      wire132 : reg144)))));
            end
        end
      else
        begin
          reg135 <= {reg134};
          reg136 <= ($signed((8'hae)) ^ $signed($signed(reg133[(2'h2):(1'h0)])));
        end
      reg155 <= (~reg147);
      reg156 <= wire124;
    end
  always
    @(posedge clk) begin
      if ((reg133[(2'h3):(2'h2)] ?
          (|$unsigned(reg133[(4'h9):(3'h7)])) : reg150[(3'h5):(1'h0)]))
        begin
          reg157 <= {reg144[(1'h1):(1'h1)], reg139};
          reg158 <= ({$signed($signed(reg144[(2'h3):(2'h2)])),
                  reg155[(4'hf):(4'hb)]} ?
              ((-(~&(+reg130))) <= (~|{$unsigned(reg148),
                  reg153})) : $signed(wire122[(1'h0):(1'h0)]));
        end
      else
        begin
          reg157 <= reg139;
          if ($unsigned({reg134[(5'h13):(3'h6)]}))
            begin
              reg158 <= wire126;
            end
          else
            begin
              reg158 <= reg127[(2'h2):(1'h1)];
            end
          reg159 <= (wire120[(3'h4):(3'h4)] - $unsigned((^(~&reg155))));
          reg160 <= {reg152};
          reg161 <= reg142;
        end
      reg162 <= reg160[(2'h2):(2'h2)];
      reg163 <= ($unsigned(({$unsigned(reg139), (reg151 & reg139)} ?
          reg135[(5'h11):(3'h6)] : $signed(reg156[(1'h0):(1'h0)]))) != reg137);
      reg164 <= (!reg161[(3'h5):(3'h4)]);
    end
  assign wire165 = reg140[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg166 <= (((reg144 & (8'hbc)) - (((reg137 < reg155) >>> reg161) ?
          (!wire124[(3'h7):(3'h5)]) : (~|(!wire123)))) << reg163);
      reg167 <= {(~|$unsigned(($signed(reg152) ?
              (~reg130) : $unsigned(reg159)))),
          $unsigned(reg156[(2'h3):(2'h2)])};
      reg168 <= reg154[(3'h4):(3'h4)];
    end
  assign wire169 = reg134[(4'h9):(3'h4)];
  assign wire170 = (+((+reg148) << wire123));
  assign wire171 = ($signed(reg150) > $unsigned({((reg143 ? reg163 : (8'hb0)) ?
                           (~&reg160) : (+reg127))}));
  assign wire172 = ($signed({{reg151}}) >>> wire122[(3'h6):(2'h3)]);
  assign wire173 = (~({(8'ha4),
                       ($unsigned((8'h9c)) ?
                           $unsigned(reg146) : $unsigned(wire120))} ~^ reg148));
  assign wire174 = (~^((&reg148[(4'hb):(3'h7)]) != $signed($unsigned(reg158[(4'hd):(2'h2)]))));
  assign wire175 = reg145;
  assign wire176 = (&$unsigned(wire170[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg177 <= $signed(wire165[(4'hd):(3'h6)]);
    end
  assign wire178 = ((wire176[(4'hb):(2'h3)] ^~ $signed($signed((wire173 - wire174)))) >>> (wire121[(3'h4):(3'h4)] ?
                       $unsigned($unsigned(wire165[(4'ha):(4'h9)])) : wire172[(4'he):(3'h4)]));
  assign wire179 = ((8'hbf) & ($signed(reg153) ?
                       reg145[(3'h4):(3'h4)] : $signed($unsigned(wire171[(4'hb):(1'h0)]))));
endmodule

module module102
#(parameter param115 = ((^(!(((8'hb1) ^~ (8'h9e)) ? ((8'hbf) ? (8'hba) : (8'ha8)) : ((7'h41) ? (8'haa) : (7'h41))))) != (((((7'h41) <<< (8'hac)) ? ((8'ha8) ? (8'hbb) : (7'h41)) : ((8'ha0) ~^ (8'ha5))) ^~ ((&(8'h9f)) && (^~(7'h40)))) ? {(((8'hbe) ? (8'hae) : (8'hb5)) ^~ {(8'h9e), (8'hbf)})} : (~(((8'haa) ? (8'hb8) : (8'hbe)) ~^ (+(8'hba)))))))
(y, clk, wire107, wire106, wire105, wire104, wire103);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire107;
  input wire signed [(5'h10):(1'h0)] wire106;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire [(4'hf):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(4'hc):(1'h0)] wire111;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(4'hd):(1'h0)] wire109;
  wire signed [(4'he):(1'h0)] wire108;
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 (1'h0)};
  assign wire108 = ($signed(wire107) >>> (wire107 - ($unsigned($signed((8'ha6))) >= $unsigned(wire107[(3'h5):(2'h3)]))));
  assign wire109 = $signed((^~$unsigned(wire107)));
  assign wire110 = $unsigned($unsigned(wire107));
  assign wire111 = (+$signed({((wire105 - wire108) <<< wire110[(2'h2):(1'h1)]),
                       $signed(wire105)}));
  assign wire112 = ((((~^{wire111}) ?
                           ($signed(wire103) + (wire104 ?
                               wire109 : wire105)) : $signed((^wire108))) ?
                       ({$signed(wire106)} >>> $unsigned({wire106,
                           wire107})) : (($unsigned(wire111) == (wire107 ^~ wire103)) ?
                           $unsigned(((8'haf) ?
                               wire109 : wire111)) : {(+wire104),
                               {(7'h40)}})) || wire110[(1'h0):(1'h0)]);
  assign wire113 = wire103[(4'ha):(3'h7)];
  assign wire114 = ($signed((^~($signed(wire106) ?
                       wire107[(3'h7):(3'h6)] : $signed(wire105)))) <<< wire110);
endmodule

module module83
#(parameter param97 = (+(((~&(~^(8'h9c))) ? {{(7'h40)}, {(7'h44), (8'hba)}} : (((8'hbc) ? (7'h44) : (8'hbd)) ? ((8'hac) ? (8'hae) : (8'hba)) : ((8'ha6) > (8'hb9)))) < ((8'haa) + {(+(8'h9e)), ((8'hb4) & (8'ha8))}))), 
parameter param98 = ((param97 ? (((&param97) << (^(8'ha9))) ^~ ((param97 > param97) ? ((8'haf) - param97) : (+param97))) : (param97 ? ({param97} ? (param97 & param97) : (8'hb0)) : ((~^param97) < (param97 ? param97 : param97)))) ? {(~(8'hbb)), ((!((8'ha1) ? (8'ha9) : (8'hbc))) ? param97 : param97)} : ((-(param97 >= (param97 ? param97 : param97))) ? ((^~(~|param97)) | (~^param97)) : param97)))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire [(4'he):(1'h0)] wire87;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(4'h8):(1'h0)] wire85;
  input wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire signed [(5'h15):(1'h0)] wire94;
  wire [(3'h6):(1'h0)] wire90;
  wire [(5'h11):(1'h0)] wire89;
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire90,
                 wire89,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire89 = (+wire87[(4'ha):(2'h3)]);
  assign wire90 = (wire89 ?
                      wire86[(4'h8):(3'h7)] : (({wire86[(2'h3):(2'h3)]} > wire85[(2'h2):(1'h1)]) ?
                          $unsigned($unsigned($signed((7'h42)))) : {((wire87 ?
                                      wire87 : wire89) ?
                                  wire85 : ((8'ha0) < wire86)),
                              $unsigned(wire86)}));
  always
    @(posedge clk) begin
      reg91 <= wire90;
      reg92 <= $unsigned($signed(reg91[(2'h2):(1'h0)]));
      reg93 <= $signed((|(!{wire90[(1'h1):(1'h0)]})));
    end
  assign wire94 = (reg93 ?
                      ((($unsigned(wire89) ?
                              wire88[(1'h0):(1'h0)] : (!(8'hbb))) ?
                          $unsigned((^wire90)) : reg91[(3'h6):(3'h6)]) > wire86[(3'h4):(1'h0)]) : wire85[(1'h1):(1'h1)]);
  assign wire95 = (reg93[(2'h3):(1'h1)] ~^ wire84[(4'hd):(4'h8)]);
  assign wire96 = wire86;
endmodule

module module35  (y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire [(5'h11):(1'h0)] wire39;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire [(3'h6):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire41;
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  assign y = {wire80,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire52,
                 wire51,
                 wire41,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire41 = wire40;
  always
    @(posedge clk) begin
      reg42 <= (-((|$signed(wire41)) ? wire40 : ((^~(|wire37)) != wire40)));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire38[(3'h5):(2'h2)]))
        begin
          reg43 <= wire37;
          reg44 <= (~^(wire39[(4'ha):(3'h4)] + (wire38[(3'h4):(1'h0)] ?
              wire41[(2'h3):(1'h1)] : {((8'ha7) ? wire40 : (8'hb4))})));
          reg45 <= (^~wire37[(2'h3):(1'h1)]);
          reg46 <= wire37[(3'h6):(1'h1)];
          reg47 <= (~|(~|((wire41 - (~^(7'h43))) << reg42)));
        end
      else
        begin
          reg43 <= ($unsigned(reg43) ?
              $signed($signed(reg44[(1'h1):(1'h1)])) : wire40[(1'h1):(1'h0)]);
          if (wire41)
            begin
              reg44 <= (((wire41[(1'h0):(1'h0)] ?
                      $signed((~^reg42)) : {wire41, $unsigned(reg42)}) ?
                  $signed($signed((reg44 | wire37))) : $unsigned({$unsigned(wire40)})) + $unsigned({wire38[(3'h4):(3'h4)]}));
            end
          else
            begin
              reg44 <= (wire40[(1'h0):(1'h0)] ?
                  $unsigned($signed(wire36)) : wire40[(2'h2):(1'h1)]);
            end
        end
      reg48 <= (~&reg43[(1'h1):(1'h1)]);
      reg49 <= $signed({wire39[(3'h5):(1'h1)]});
    end
  always
    @(posedge clk) begin
      reg50 <= $signed(($signed((8'ha8)) ?
          (-{(^~wire38), ((8'haa) >> wire36)}) : ($unsigned((reg43 == reg47)) ?
              $unsigned(reg46) : (&$unsigned(reg44)))));
    end
  assign wire51 = reg47[(1'h0):(1'h0)];
  assign wire52 = (reg46[(3'h6):(3'h4)] ? reg48[(4'he):(1'h1)] : (~&reg44));
  always
    @(posedge clk) begin
      reg53 <= reg46[(2'h2):(2'h2)];
      if (wire52)
        begin
          if (reg48)
            begin
              reg54 <= wire39[(4'ha):(1'h1)];
            end
          else
            begin
              reg54 <= $signed({(!wire36), (~wire51[(3'h4):(2'h3)])});
              reg55 <= $signed(((~|((reg53 || wire39) ?
                  reg48 : wire36)) || (&({wire38, wire37} ?
                  reg48 : $unsigned((8'hba))))));
            end
        end
      else
        begin
          reg54 <= ((reg54[(5'h11):(3'h5)] || (~|(8'ha6))) ^ $unsigned(({wire37[(3'h6):(3'h6)],
              $unsigned((8'hb4))} ~^ wire36)));
          if (reg53)
            begin
              reg55 <= reg44;
              reg56 <= $signed($unsigned((!wire38)));
              reg57 <= reg54;
            end
          else
            begin
              reg55 <= wire39;
            end
          reg58 <= ((wire36 & (^~{$signed(wire51)})) ?
              $signed(({reg53} ?
                  wire37[(3'h4):(1'h0)] : $signed($unsigned((8'hb6))))) : wire52[(3'h5):(2'h2)]);
        end
      if (reg44[(1'h0):(1'h0)])
        begin
          reg59 <= (!$signed((~|$unsigned((7'h40)))));
          reg60 <= (reg43 ?
              wire39[(4'h9):(2'h3)] : ({({reg50,
                      wire52} > (reg43 >= reg58))} >> (~({reg44, reg42} ?
                  reg57 : reg44[(2'h2):(2'h2)]))));
          reg61 <= reg58;
          if (reg59)
            begin
              reg62 <= reg46;
              reg63 <= reg57;
              reg64 <= $signed($signed((((~reg55) - (reg62 ? reg50 : reg53)) ?
                  ((reg49 ? reg60 : reg47) ?
                      reg60 : {reg47, reg50}) : $unsigned((8'h9f)))));
              reg65 <= (wire40 ?
                  $unsigned({($unsigned(reg53) - $signed(reg46)),
                      reg44[(1'h1):(1'h0)]}) : $unsigned((((^~wire38) ?
                      $signed(reg55) : $unsigned(reg58)) & reg45[(3'h4):(1'h0)])));
              reg66 <= (+$unsigned(((~&wire40[(1'h0):(1'h0)]) ?
                  $unsigned($signed(wire38)) : wire36)));
            end
          else
            begin
              reg62 <= $signed((wire37[(3'h4):(1'h0)] ?
                  $unsigned((reg42 || (^~reg61))) : $signed((~&(reg49 | wire38)))));
              reg63 <= (((reg61[(1'h0):(1'h0)] ?
                      {(-reg43)} : $unsigned($signed(reg61))) ?
                  ($signed($unsigned(reg62)) <<< ((reg61 ? reg46 : (8'hac)) ?
                      (reg50 ^ wire40) : reg61[(2'h2):(1'h1)])) : ($signed($signed(wire40)) - {$unsigned((8'ha1))})) >> (^~$signed(reg54[(4'h8):(1'h0)])));
            end
        end
      else
        begin
          reg59 <= (((reg62 ?
                      $unsigned($unsigned(wire51)) : {$signed((8'haf)),
                          (&wire40)}) ?
                  {(~reg47),
                      ($unsigned(reg57) ?
                          reg53 : (~|reg53))} : {($signed(reg59) >> (reg48 && reg57)),
                      reg65}) ?
              ($signed({(8'ha1), (!reg63)}) == $unsigned((reg53[(1'h0):(1'h0)] ?
                  (-reg56) : reg55))) : ($unsigned((^~$unsigned((8'hb4)))) * reg46[(2'h2):(1'h0)]));
          if ((|($unsigned(($signed((8'hbf)) << $unsigned(wire38))) >>> ((~^((8'h9f) ?
              reg62 : reg50)) && $signed(reg62[(2'h3):(2'h2)])))))
            begin
              reg60 <= ($signed((&(!{reg45, reg66}))) - (^~(+(~^((8'h9e) ?
                  (8'h9e) : (8'hbf))))));
              reg61 <= ($unsigned((-$signed(wire40[(2'h3):(2'h2)]))) ?
                  reg64[(3'h4):(1'h0)] : {$unsigned(((reg57 ?
                          (7'h41) : reg45) <= (wire38 | reg65))),
                      (~|(wire51 ? reg44[(1'h1):(1'h1)] : (wire39 < wire52)))});
              reg62 <= $signed((reg49 ?
                  $signed((~&(wire37 <= wire52))) : (^~$unsigned((reg59 ^~ reg54)))));
            end
          else
            begin
              reg60 <= ((wire52[(3'h5):(1'h0)] ?
                      (($unsigned(reg64) <= {reg53}) ?
                          ($unsigned(reg57) > {reg47,
                              wire52}) : reg46[(3'h5):(3'h4)]) : {$signed(reg43),
                          (reg57 <<< reg50)}) ?
                  $unsigned(((reg65 && (8'ha0)) < reg64)) : $signed(($signed($unsigned(reg54)) ?
                      $unsigned((|reg53)) : $unsigned($unsigned(wire40)))));
              reg61 <= (^~reg59);
            end
          if ($unsigned($signed(reg58)))
            begin
              reg63 <= {$signed({($signed(reg66) ?
                          reg46 : wire41[(2'h2):(2'h2)])})};
              reg64 <= reg47[(1'h0):(1'h0)];
              reg65 <= reg42;
              reg66 <= ((reg64 ?
                      $signed({((8'hbd) << reg46),
                          (wire51 && reg56)}) : (^$unsigned({wire40}))) ?
                  wire39[(1'h0):(1'h0)] : reg57[(1'h0):(1'h0)]);
            end
          else
            begin
              reg63 <= reg46;
              reg64 <= (((({wire40} <= (8'hba)) >= {(^~wire41)}) ?
                      (&wire40[(1'h0):(1'h0)]) : $signed($signed($signed(reg50)))) ?
                  $signed($unsigned($signed($signed(wire41)))) : $signed(reg54));
              reg65 <= ((!reg59) ?
                  ((8'ha4) ?
                      reg49 : wire52[(1'h0):(1'h0)]) : $unsigned({$signed($signed(wire38)),
                      reg56[(2'h2):(1'h1)]}));
              reg66 <= ($unsigned((reg65 - (((7'h42) == wire39) > {reg64}))) ?
                  reg57[(4'hf):(3'h7)] : {reg54});
              reg67 <= (7'h40);
            end
          reg68 <= ($signed($unsigned(reg55)) * reg60);
          reg69 <= ($signed(((reg60[(2'h3):(2'h2)] << reg49[(2'h2):(1'h0)]) ?
              wire41[(2'h3):(1'h0)] : wire37)) || (~({(reg58 ?
                  wire40 : reg64)} <= wire39)));
        end
    end
  assign wire70 = {$unsigned(({{reg55}} ?
                          (!(8'hbc)) : $signed($signed(wire51)))),
                      reg45[(3'h4):(2'h3)]};
  assign wire71 = ($unsigned(((^~(wire51 <<< wire52)) ^ wire51)) ~^ (wire38 - reg47[(1'h0):(1'h0)]));
  assign wire72 = (((+((&reg62) ? reg68 : $signed(reg56))) - $signed({(^reg64),
                      wire41})) ~^ $unsigned(($signed((!wire51)) | {$signed(reg50)})));
  assign wire73 = (((reg64[(3'h6):(1'h1)] ?
                      (~|$unsigned(reg45)) : ({reg62} ?
                          $signed(reg68) : (-reg67))) <<< (-reg49[(1'h1):(1'h0)])) >>> reg48[(3'h7):(2'h3)]);
  assign wire74 = $unsigned($signed($signed({$signed(reg60)})));
  always
    @(posedge clk) begin
      reg75 <= (^~((reg54[(5'h15):(4'hb)] | $unsigned($unsigned(reg58))) ?
          ((((7'h42) <= reg59) ?
              (reg42 != reg61) : (reg47 ? (8'hbc) : reg58)) & (((8'hb2) ?
              wire70 : reg66) ^ reg67[(1'h1):(1'h1)])) : ({reg64[(3'h4):(2'h2)],
              reg54[(4'hb):(3'h6)]} * ((~|reg46) ^~ $unsigned((8'haa))))));
      reg76 <= {reg55, reg63[(2'h3):(2'h2)]};
      reg77 <= reg48[(3'h6):(3'h6)];
      reg78 <= (wire37 ? $signed(reg59) : reg64);
      reg79 <= (!$unsigned(reg61[(1'h1):(1'h0)]));
    end
  assign wire80 = (-(((~|reg65) ^~ ((~wire70) <<< (wire40 | (8'ha0)))) <<< reg44[(4'h8):(3'h5)]));
endmodule
