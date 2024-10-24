module top
#(parameter param196 = (~|(((-((8'hb1) <<< (8'hbf))) && ((+(8'ha5)) + ((8'hba) ? (8'hb9) : (8'ha8)))) ? (|{(^~(8'hbd)), {(8'h9e), (7'h40)}}) : ({((8'ha6) ? (8'haf) : (8'hb1))} < ({(8'hb7), (8'hb8)} + ((7'h41) ? (8'hbd) : (8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(4'h9):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire181;
  wire [(5'h10):(1'h0)] wire183;
  wire [(4'hc):(1'h0)] wire185;
  wire signed [(5'h11):(1'h0)] wire186;
  wire [(3'h6):(1'h0)] wire188;
  wire [(3'h4):(1'h0)] wire190;
  wire signed [(3'h5):(1'h0)] wire191;
  wire [(5'h10):(1'h0)] wire193;
  reg [(5'h10):(1'h0)] reg187 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg192 = (1'h0);
  assign y = {wire195,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire82,
                 wire84,
                 wire85,
                 wire181,
                 wire183,
                 wire185,
                 wire186,
                 wire188,
                 wire190,
                 wire191,
                 wire193,
                 reg187,
                 reg192,
                 (1'h0)};
  assign wire4 = wire2[(3'h4):(1'h1)];
  assign wire5 = wire2[(2'h2):(2'h2)];
  assign wire6 = ({wire4[(4'h8):(3'h5)], $unsigned(wire1[(2'h2):(1'h0)])} ?
                     wire2[(2'h3):(2'h3)] : (+(((~wire2) < (8'hb6)) ?
                         wire1 : (8'haf))));
  assign wire7 = $unsigned($unsigned($signed((+wire5))));
  assign wire8 = (~^(~wire5));
  module9 #() modinst83 (.y(wire82), .wire11(wire7), .clk(clk), .wire10(wire8), .wire13(wire1), .wire12(wire3));
  assign wire84 = $signed($unsigned({$signed((wire82 ? wire2 : wire8))}));
  assign wire85 = (wire8[(4'hb):(1'h0)] ?
                      $unsigned({$signed($unsigned(wire3))}) : (&wire8));
  module86 #() modinst182 (.wire87(wire82), .wire90(wire5), .clk(clk), .y(wire181), .wire88(wire85), .wire89(wire4));
  module86 #() modinst184 (.y(wire183), .wire87(wire6), .wire88(wire4), .wire90(wire85), .clk(clk), .wire89(wire82));
  assign wire185 = wire183[(1'h1):(1'h1)];
  assign wire186 = (^(-wire7));
  always
    @(posedge clk) begin
      reg187 <= (($unsigned((wire5 * (wire1 ?
              wire4 : wire82))) ^~ $unsigned(wire3[(3'h5):(2'h3)])) ?
          (~^wire3[(4'hc):(2'h2)]) : {{(wire85[(4'he):(4'h9)] ?
                      (wire3 >> (8'h9c)) : wire5[(5'h11):(4'he)]),
                  (wire185 + $signed(wire0))}});
    end
  module31 #() modinst189 (.wire34(wire4), .y(wire188), .wire33(reg187), .wire35(wire5), .wire32(wire181), .wire36(wire3), .clk(clk));
  assign wire190 = (($signed((wire1 ^ ((8'ha0) > reg187))) ?
                           wire185 : $signed(wire185)) ?
                       wire0 : wire82[(5'h10):(4'ha)]);
  assign wire191 = $unsigned(wire85[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg192 <= $signed(wire190[(1'h0):(1'h0)]);
    end
  module52 #() modinst194 (.wire53(wire185), .y(wire193), .wire56(reg187), .clk(clk), .wire54(wire186), .wire55(wire183));
  assign wire195 = wire191[(2'h2):(2'h2)];
endmodule

module module86
#(parameter param179 = (-(|{(~&(&(8'had))), (((8'ha7) ? (8'h9d) : (8'hbd)) ? {(8'hbb), (8'hb4)} : ((8'ha2) ~^ (8'ha0)))})), 
parameter param180 = (~^param179))
(y, clk, wire87, wire88, wire89, wire90);
  output wire [(32'h2de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire87;
  input wire [(4'hc):(1'h0)] wire88;
  input wire [(3'h6):(1'h0)] wire89;
  input wire signed [(5'h12):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  wire [(4'hc):(1'h0)] wire176;
  wire signed [(5'h13):(1'h0)] wire175;
  wire [(4'h8):(1'h0)] wire174;
  wire [(3'h5):(1'h0)] wire173;
  wire signed [(5'h11):(1'h0)] wire172;
  wire signed [(5'h15):(1'h0)] wire169;
  wire signed [(4'h8):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire145;
  wire signed [(3'h4):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(5'h10):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire127;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire125;
  reg [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(4'h8):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'hd):(1'h0)] reg147 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  assign y = {wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire169,
                 wire167,
                 wire145,
                 wire144,
                 wire131,
                 wire130,
                 wire129,
                 wire127,
                 wire91,
                 wire92,
                 wire125,
                 reg171,
                 reg170,
                 reg168,
                 reg166,
                 reg165,
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
                 reg128,
                 (1'h0)};
  assign wire91 = $signed(wire87[(4'hc):(1'h1)]);
  assign wire92 = $signed((wire89[(1'h1):(1'h0)] ?
                      $signed(wire90) : (^$signed({wire91, wire90}))));
  module93 #() modinst126 (wire125, clk, wire89, wire87, wire88, wire90, wire91);
  assign wire127 = ($unsigned((wire91[(3'h7):(3'h5)] ?
                       (^(+wire91)) : ($unsigned(wire92) ?
                           wire92 : ((8'had) ?
                               wire87 : wire125)))) ~^ ((^~wire89) ?
                       $unsigned(wire90) : $signed(wire91[(4'hb):(3'h6)])));
  always
    @(posedge clk) begin
      reg128 <= $unsigned(wire90);
    end
  assign wire129 = {(wire125[(3'h6):(1'h0)] ^ {wire125[(4'ha):(1'h1)]}),
                       $signed($unsigned(wire89[(3'h4):(2'h2)]))};
  assign wire130 = (|wire127);
  assign wire131 = $unsigned(({wire129} ?
                       {$unsigned((~&wire92)), $signed(wire127)} : (8'h9e)));
  always
    @(posedge clk) begin
      if (($unsigned(reg128[(3'h4):(2'h2)]) ?
          (((((8'h9c) ?
                  wire88 : wire91) <= $signed(wire92)) | $unsigned($signed(wire92))) ?
              $signed($signed(wire88[(1'h0):(1'h0)])) : (~{$signed(reg128),
                  wire91[(4'hd):(3'h5)]})) : wire131[(2'h2):(2'h2)]))
        begin
          reg132 <= $signed((8'h9e));
          reg133 <= (({reg132[(3'h5):(1'h1)]} ?
                  ((|(wire87 ?
                      wire131 : (8'h9e))) | (wire127[(1'h0):(1'h0)] >>> $unsigned(reg132))) : ((8'hae) ?
                      $unsigned((-wire130)) : (^wire125[(2'h3):(1'h0)]))) ?
              (wire125[(3'h7):(3'h7)] - wire90) : $unsigned(wire89[(2'h3):(1'h1)]));
        end
      else
        begin
          reg132 <= $signed(wire131);
          reg133 <= wire91[(3'h6):(1'h0)];
          if ((~$unsigned(wire92[(5'h11):(3'h4)])))
            begin
              reg134 <= ($unsigned($unsigned(((^~reg133) <<< $unsigned(wire90)))) ^ (wire130[(4'ha):(4'h8)] < ($signed($unsigned(wire127)) ?
                  $unsigned({wire130}) : (8'had))));
            end
          else
            begin
              reg134 <= (8'ha9);
              reg135 <= ((((^~wire130[(1'h0):(1'h0)]) * $signed(wire90[(1'h0):(1'h0)])) ?
                  wire129[(3'h6):(3'h6)] : (wire125 ?
                      ($unsigned(reg134) ^~ $unsigned(wire90)) : {$unsigned(reg134),
                          wire91})) && (~^$unsigned({wire87[(5'h14):(1'h0)],
                  (wire125 == reg132)})));
            end
        end
      if (wire129[(4'h9):(3'h4)])
        begin
          reg136 <= reg128[(2'h3):(2'h2)];
          reg137 <= {wire131};
          if ({$signed(wire130)})
            begin
              reg138 <= reg136[(2'h3):(1'h1)];
              reg139 <= (|$signed(($signed({reg133}) ?
                  reg136[(4'hc):(4'h8)] : $signed(wire88))));
            end
          else
            begin
              reg138 <= $signed((-(((reg137 << reg135) >> wire90[(4'he):(3'h7)]) ?
                  wire130[(4'h8):(3'h7)] : wire125)));
            end
          reg140 <= (reg136[(4'hb):(4'hb)] == $unsigned({(reg136 ?
                  ((8'ha7) >= reg137) : (&reg138))}));
          reg141 <= (^~($signed($unsigned((wire131 * wire89))) < ((8'hb9) ?
              ((wire88 ? wire131 : reg132) == (|wire125)) : (+wire131))));
        end
      else
        begin
          if (({{(!((7'h44) ? wire88 : (8'had)))},
                  (({(8'hb0)} - wire131) <= wire129)} ?
              ($unsigned((7'h43)) | (!wire88)) : wire87))
            begin
              reg136 <= ($unsigned($signed(wire127)) ?
                  wire87[(3'h7):(3'h6)] : (wire88 <<< $unsigned(reg132)));
              reg137 <= (-(($signed((reg135 < wire91)) > {$signed(reg140)}) ?
                  $unsigned((~&reg132)) : reg136[(3'h7):(2'h2)]));
              reg138 <= reg133;
              reg139 <= wire90;
              reg140 <= wire91;
            end
          else
            begin
              reg136 <= reg136[(4'hb):(2'h2)];
              reg137 <= ($unsigned(wire89) * $signed($unsigned(($unsigned(reg137) ?
                  $unsigned(wire130) : (reg137 ? reg140 : wire87)))));
              reg138 <= (~^$signed($unsigned($unsigned(wire130[(4'hc):(4'hb)]))));
              reg139 <= ((7'h40) & (8'ha9));
            end
          reg141 <= $signed($unsigned($unsigned($unsigned(reg141[(2'h3):(2'h2)]))));
          reg142 <= $unsigned(({$signed($signed(wire88))} ~^ $signed((~|reg132[(3'h5):(2'h3)]))));
        end
      reg143 <= (wire89 ~^ $unsigned(reg135));
    end
  assign wire144 = $unsigned($signed($signed((~$signed(reg128)))));
  assign wire145 = (~&reg143[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg146 <= $signed($unsigned((wire129[(4'hf):(4'hc)] ~^ $unsigned($unsigned((8'hb7))))));
      if ($signed($signed(wire145)))
        begin
          reg147 <= ($unsigned($signed(($signed(reg133) <<< reg142))) >>> (^$unsigned($unsigned(reg136))));
          reg148 <= {{(((wire89 > reg138) == reg139[(3'h6):(2'h3)]) ?
                      (^~wire90[(3'h7):(3'h7)]) : {(reg136 || (7'h43))})}};
          reg149 <= (~^wire127[(3'h4):(2'h3)]);
          reg150 <= (~&$signed($signed((7'h40))));
          if (wire145[(4'h8):(3'h7)])
            begin
              reg151 <= (&{reg149[(4'hf):(4'he)]});
              reg152 <= $signed(wire129);
              reg153 <= $unsigned(reg142[(1'h1):(1'h1)]);
              reg154 <= (((~^reg150[(4'he):(4'hd)]) ?
                      $signed((+(~|(8'hb3)))) : ($signed($signed(reg128)) ?
                          $signed(wire127) : $unsigned($signed(wire127)))) ?
                  {$signed((reg137 <= wire92)),
                      $signed($signed((reg133 << reg139)))} : (~|(~(~^(wire145 ?
                      (7'h41) : wire90)))));
            end
          else
            begin
              reg151 <= {reg148[(4'ha):(2'h2)]};
              reg152 <= {reg146};
              reg153 <= $signed({{(((8'haf) ? wire91 : wire130) <= (!reg128))},
                  {((reg137 ? reg133 : wire127) >> (~wire88)), wire92}});
              reg154 <= (reg139 != ($signed(wire88) ?
                  $unsigned({$signed(wire144),
                      reg141}) : $unsigned(((+reg137) | ((8'hab) ?
                      wire127 : wire88)))));
            end
        end
      else
        begin
          reg147 <= ($unsigned((reg154 | (~^reg149[(4'h9):(3'h7)]))) + (~wire91[(4'hd):(4'hc)]));
          reg148 <= $unsigned(wire125);
          if (wire91[(4'ha):(4'ha)])
            begin
              reg149 <= ($signed($unsigned((&(reg128 < reg147)))) || (+$signed((-$signed((8'ha0))))));
              reg150 <= ({wire125} ?
                  {(wire91 ?
                          {{(8'hbd)},
                              ((8'ha1) ^~ wire125)} : $unsigned(reg136))} : (wire92 >> {reg147}));
            end
          else
            begin
              reg149 <= (reg153[(5'h12):(4'hc)] ?
                  $unsigned($unsigned($unsigned($unsigned(reg142)))) : (({(reg142 ?
                          wire127 : wire88),
                      $signed(wire130)} > ($unsigned(reg137) ?
                      {reg134, wire87} : $signed(reg128))) ^~ wire130));
              reg150 <= (~&$unsigned($signed({$unsigned(wire88)})));
              reg151 <= reg140[(4'hc):(2'h2)];
            end
          if (($unsigned(wire87) > (reg141[(4'hc):(4'h9)] ?
              ((8'ha6) ?
                  wire125 : ($unsigned((8'haa)) ?
                      reg133 : (reg137 ? reg135 : (8'hb4)))) : (~|((reg133 ?
                      reg133 : reg148) ?
                  wire145[(5'h10):(3'h6)] : (wire145 > (8'hab)))))))
            begin
              reg152 <= {wire129[(4'hd):(2'h2)],
                  (-({wire90[(3'h4):(1'h1)]} ?
                      (wire144 <= reg150) : $unsigned((reg148 ?
                          reg136 : reg143))))};
              reg153 <= {($unsigned(wire129[(4'hf):(4'he)]) ?
                      wire145 : (reg146[(2'h2):(1'h0)] ?
                          (~|((8'had) ? wire88 : wire129)) : reg154))};
              reg154 <= (~^($signed(((reg143 ? reg140 : reg132) << ((8'ha9) ?
                      reg141 : (8'had)))) ?
                  (^~(~^{reg139})) : $unsigned((&{reg135, wire129}))));
            end
          else
            begin
              reg152 <= $unsigned((wire87 ~^ (^~((8'hb1) && $signed(reg138)))));
              reg153 <= $signed($signed(wire129[(4'hf):(3'h5)]));
              reg154 <= wire144[(3'h4):(3'h4)];
              reg155 <= (~^(reg138[(1'h1):(1'h1)] & reg149[(4'hf):(3'h7)]));
              reg156 <= (reg146[(2'h2):(1'h1)] >> reg146[(1'h1):(1'h0)]);
            end
          reg157 <= (~^{reg155, (^(~(+reg153)))});
        end
      reg158 <= (~&(reg140[(3'h6):(3'h4)] ^~ $unsigned((&(~^wire87)))));
      if (wire131)
        begin
          reg159 <= (~|reg136[(4'h9):(3'h7)]);
          if ((|wire130))
            begin
              reg160 <= (+$signed($signed((+(8'hb5)))));
              reg161 <= (reg150 ?
                  reg157 : ((&($signed(reg132) << {wire91, wire125})) ?
                      {(reg146[(1'h0):(1'h0)] ^ wire91[(4'hf):(4'h9)]),
                          (wire91[(4'hb):(2'h2)] && {reg142,
                              wire130})} : reg159[(4'h8):(4'h8)]));
              reg162 <= reg157;
              reg163 <= (reg136 ?
                  reg140 : ((^{reg154}) > $signed((-(reg128 - wire89)))));
            end
          else
            begin
              reg160 <= ($signed($signed(reg132[(3'h6):(3'h6)])) ?
                  {wire145} : (reg150 << reg138));
              reg161 <= $signed($signed($signed((reg162 ?
                  $unsigned(reg146) : {reg159}))));
              reg162 <= (reg155 <= wire125[(4'hb):(2'h2)]);
              reg163 <= $unsigned(reg138[(2'h3):(1'h1)]);
            end
          reg164 <= {(wire91[(4'hd):(2'h2)] ?
                  $signed((reg147 ?
                      reg160[(4'h9):(2'h2)] : reg163[(4'ha):(4'ha)])) : (!((reg135 ?
                      reg147 : wire130) <<< reg162[(5'h10):(4'hc)]))),
              (-((wire92 ?
                      reg148[(3'h7):(3'h7)] : (reg151 ? (8'hab) : reg146)) ?
                  $signed($unsigned(wire127)) : {$unsigned(wire145)}))};
          reg165 <= $unsigned(($unsigned((!reg154[(3'h4):(1'h1)])) ?
              (reg133 ?
                  ((wire131 - reg164) >> (reg149 || reg160)) : (reg161[(4'hb):(3'h5)] == (reg159 ?
                      wire129 : reg136))) : reg139[(2'h2):(2'h2)]));
        end
      else
        begin
          reg159 <= $signed((&($signed($unsigned(reg150)) + $signed({reg157}))));
        end
      reg166 <= (($signed({(reg132 ^~ (7'h40)), $signed(reg163)}) ?
              (+$signed($unsigned(wire91))) : (~$unsigned($unsigned(wire127)))) ?
          ((reg161 ?
                  (~$signed(reg155)) : ((~|(8'had)) ?
                      $signed(reg157) : reg135[(4'hb):(2'h2)])) ?
              (^$unsigned(reg160)) : wire145) : (!$unsigned({(~&reg143),
              (reg143 ? wire144 : reg138)})));
    end
  assign wire167 = (~|((^reg128[(3'h5):(3'h5)]) | wire129[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg168 <= wire125;
    end
  assign wire169 = reg142[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg170 <= reg158;
      reg171 <= $signed(reg141);
    end
  assign wire172 = reg170;
  assign wire173 = reg164[(4'hc):(4'h9)];
  assign wire174 = (((($unsigned(reg155) ? $unsigned(reg163) : reg148) ?
                           $unsigned($signed(reg164)) : (8'ha8)) <<< ((!wire125[(4'h8):(1'h1)]) < $unsigned((^~wire89)))) ?
                       {(~&((+reg157) ^ reg157[(2'h2):(2'h2)]))} : ((wire131 * (!$unsigned(reg128))) ^ (wire91 ?
                           ({reg149} <<< wire88) : (wire129 ?
                               wire129 : $signed(wire127)))));
  assign wire175 = reg135[(3'h7):(3'h5)];
  assign wire176 = wire145;
  assign wire177 = reg132;
  assign wire178 = ((($signed($signed(reg165)) > wire175) != (+$unsigned($unsigned(reg147)))) ^ {(((^~reg168) ?
                               {reg132} : {reg162}) ?
                           $signed((^~reg139)) : $signed((wire176 != wire87))),
                       reg158[(4'h8):(3'h6)]});
endmodule

module module9
#(parameter param80 = ((^~((^{(8'hac)}) ^ (+((8'hac) + (7'h40))))) ? ((8'hbe) ? ((~(|(8'hb7))) >>> ((!(8'ha5)) >> ((8'ha6) || (8'hbf)))) : ((-(-(8'hbf))) < {{(8'ha3)}})) : (~^({((8'had) & (7'h44))} & (((8'ha4) ? (8'h9f) : (8'h9c)) && ((7'h41) ? (8'hbf) : (8'haa)))))), 
parameter param81 = ((((8'hab) && (!(&param80))) - (((param80 | param80) + (param80 || param80)) <= (param80 > (^(8'ha0))))) > ((((|(7'h42)) + param80) && ((&param80) ? {param80} : (param80 ? param80 : param80))) ? (~|param80) : param80)))
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire78;
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  assign y = {wire18,
                 wire19,
                 wire20,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire41,
                 wire43,
                 wire44,
                 wire49,
                 wire50,
                 wire51,
                 wire78,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (wire10 ?
          (!($signed((wire11 ?
              wire11 : wire11)) >>> $signed(wire10[(3'h6):(2'h2)]))) : (&$signed((~|$signed(wire12)))));
      reg15 <= wire10[(3'h6):(1'h0)];
      reg16 <= (((^(|wire10)) ?
          $unsigned(wire10) : (wire13 ?
              $unsigned($unsigned((8'hb3))) : $unsigned((^~(7'h41))))) | wire11[(3'h4):(2'h2)]);
      reg17 <= (($unsigned(wire12) && ($unsigned($unsigned(reg14)) + (~|(wire12 ?
          wire12 : reg15)))) | $unsigned(((reg16[(3'h4):(3'h4)] ^ (wire11 * reg14)) ?
          (8'ha5) : (reg14[(5'h13):(1'h1)] & (8'h9e)))));
    end
  assign wire18 = (7'h40);
  assign wire19 = wire13;
  assign wire20 = $signed((wire10[(4'h8):(3'h7)] || reg15));
  always
    @(posedge clk) begin
      reg21 <= ($unsigned(reg15) ?
          ($unsigned($signed($signed(wire18))) ^~ wire12[(1'h0):(1'h0)]) : ((wire18 ?
              $unsigned(wire12) : ((wire11 << reg16) <<< wire19)) - reg16));
      reg22 <= (reg16 > $signed((wire13[(3'h5):(2'h2)] ?
          wire20[(3'h4):(2'h3)] : $signed(reg15[(2'h2):(2'h2)]))));
      reg23 <= wire10[(3'h4):(3'h4)];
      reg24 <= $signed(reg14);
      reg25 <= $signed((~&$unsigned({wire10, (reg24 <= (7'h41))})));
    end
  assign wire26 = $unsigned($unsigned(reg17));
  assign wire27 = $signed($unsigned(reg14));
  assign wire28 = (+$signed($unsigned($signed((|wire20)))));
  assign wire29 = $signed(((|(reg21[(4'ha):(2'h2)] ?
                      (wire18 ? wire13 : reg17) : (&reg16))) ^ $signed(reg16)));
  assign wire30 = wire20[(3'h4):(2'h3)];
  module31 #() modinst42 (.wire35(wire19), .wire34(reg24), .wire33(wire20), .wire36(wire29), .wire32(wire12), .clk(clk), .y(wire41));
  assign wire43 = reg15;
  assign wire44 = {wire43, (8'ha2)};
  always
    @(posedge clk) begin
      reg45 <= $unsigned($signed(wire30[(2'h3):(1'h0)]));
      reg46 <= $unsigned(wire11[(3'h7):(1'h1)]);
      reg47 <= $unsigned(((7'h44) >= (&(+(~^(8'ha4))))));
      reg48 <= {(wire27 - (7'h42))};
    end
  assign wire49 = (&wire28[(3'h5):(3'h5)]);
  assign wire50 = ($signed($unsigned(((wire10 ? wire12 : wire10) ?
                      $signed(wire20) : $unsigned(wire44)))) || $signed(($signed(wire41) ?
                      (reg17 ?
                          $signed(wire27) : (reg17 >> reg48)) : $signed((8'hac)))));
  assign wire51 = (^~$signed($signed((|$signed(wire43)))));
  module52 #() modinst79 (.wire54(wire41), .wire56(wire19), .clk(clk), .wire55(reg45), .wire53(wire29), .y(wire78));
endmodule

module module52
#(parameter param77 = ({{(+((7'h42) ? (8'hb5) : (8'ha5)))}} - {(8'h9d)}))
(y, clk, wire56, wire55, wire54, wire53);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire56;
  input wire signed [(5'h10):(1'h0)] wire55;
  input wire signed [(5'h11):(1'h0)] wire54;
  input wire [(3'h5):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg57 <= (-$signed(((7'h41) ?
          ((wire56 * wire55) != {wire53, (7'h43)}) : $unsigned((wire53 ?
              wire55 : wire56)))));
      if ($signed((reg57[(1'h0):(1'h0)] ~^ (&($signed(reg57) ?
          $signed(wire55) : ((8'hb7) ^~ wire55))))))
        begin
          reg58 <= (8'hb8);
          reg59 <= $unsigned(wire53);
          if (reg57[(3'h4):(3'h4)])
            begin
              reg60 <= (^wire56[(4'h9):(3'h4)]);
              reg61 <= reg60[(3'h5):(2'h3)];
            end
          else
            begin
              reg60 <= (8'hb0);
              reg61 <= reg58[(1'h0):(1'h0)];
              reg62 <= (+reg60[(4'ha):(4'h8)]);
            end
          reg63 <= ($unsigned((~^((reg61 ? reg61 : reg61) ?
              $unsigned(reg58) : reg57[(4'h8):(4'h8)]))) <= ((wire56[(4'h8):(2'h2)] || reg60[(4'hd):(3'h5)]) ?
              (8'hb0) : (|$signed((8'hac)))));
          reg64 <= $unsigned((reg63 <= $signed($unsigned(wire55))));
        end
      else
        begin
          if (reg59[(3'h6):(3'h4)])
            begin
              reg58 <= $unsigned((|{{(8'hbb)}}));
              reg59 <= wire55;
            end
          else
            begin
              reg58 <= {((reg63 * reg61[(4'h9):(3'h4)]) ?
                      reg61 : $unsigned((((8'hbf) ?
                          wire53 : wire55) != reg60[(2'h3):(2'h3)]))),
                  ((!(^~$signed(reg60))) ? reg64[(1'h0):(1'h0)] : wire53)};
            end
        end
      reg65 <= {(+reg58)};
      reg66 <= wire55;
      if (reg61[(4'h8):(3'h6)])
        begin
          reg67 <= reg61[(3'h5):(1'h1)];
        end
      else
        begin
          reg67 <= (^$unsigned($signed(($unsigned((8'ha6)) ?
              $unsigned(reg63) : $unsigned(reg57)))));
          reg68 <= reg58;
          reg69 <= reg59[(1'h0):(1'h0)];
          reg70 <= $signed(wire54[(3'h4):(3'h4)]);
        end
    end
  assign wire71 = (-{($signed((reg68 | reg59)) ?
                          ((8'haa) <= (+reg59)) : $signed((-wire55)))});
  assign wire72 = (~|$unsigned((reg65 ?
                      ($signed(reg64) && $unsigned(reg70)) : ({reg64,
                          wire71} | (~|(8'hb5))))));
  assign wire73 = $signed($signed((((reg70 | reg68) == $unsigned(wire72)) ?
                      $unsigned((reg66 != reg66)) : {(reg57 ?
                              reg66 : reg61)})));
  assign wire74 = ((!(-$signed((wire55 ?
                      reg70 : reg70)))) || ((wire56 || $unsigned({wire71})) << (reg63[(2'h2):(1'h0)] ?
                      reg64[(1'h1):(1'h0)] : reg66)));
  assign wire75 = {reg64[(2'h2):(1'h1)]};
  assign wire76 = reg62;
endmodule

module module31  (y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = {($signed($unsigned((wire33 ? wire36 : (8'ha9)))) ?
                          $unsigned((wire32 ?
                              (~&wire36) : wire34)) : (-$unsigned((&wire32)))),
                      ($unsigned(wire34[(3'h4):(1'h0)]) ?
                          wire33 : $unsigned(wire34[(1'h1):(1'h0)]))};
  assign wire38 = wire32[(1'h1):(1'h1)];
  assign wire39 = ($unsigned($unsigned({$unsigned(wire32),
                      $unsigned(wire36)})) != $signed({wire35}));
  assign wire40 = $signed(wire38);
endmodule

module module93  (y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire98;
  input wire [(5'h15):(1'h0)] wire97;
  input wire [(4'hc):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(4'hf):(1'h0)] wire94;
  wire [(4'hb):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire99;
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(4'hc):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire104,
                 wire99,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = $unsigned($unsigned($signed((wire95[(3'h5):(2'h2)] ?
                      wire97 : wire98[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      reg100 <= (+wire97[(4'h8):(2'h2)]);
      reg101 <= ({wire95} <= $unsigned(wire99));
    end
  always
    @(posedge clk) begin
      reg102 <= reg100[(3'h4):(3'h4)];
      reg103 <= (-(wire95 ?
          $unsigned({{wire94, wire95}}) : reg101[(1'h1):(1'h1)]));
    end
  assign wire104 = reg101[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      if ({(reg100[(2'h3):(1'h1)] ? wire104 : (-$signed(reg101)))})
        begin
          reg105 <= ({{$unsigned((~|(8'ha1))), wire104[(4'h9):(1'h0)]},
              (&((reg101 | (8'ha1)) ? (~^wire96) : (^~wire104)))} < (({(wire95 ?
                  wire96 : wire99),
              $signed(wire98)} > ((reg100 ? reg100 : reg100) ?
              $signed(reg100) : (~^(8'hb6)))) > ($unsigned(wire95) < $signed({wire96,
              wire104}))));
        end
      else
        begin
          if ($unsigned($signed({wire97[(5'h15):(3'h4)], wire95})))
            begin
              reg105 <= ((~^(^(^~(~^wire95)))) ?
                  (|$signed(reg103)) : ({$signed(wire98[(1'h1):(1'h0)]),
                      $signed(wire96[(4'h8):(1'h1)])} ^~ (8'h9d)));
            end
          else
            begin
              reg105 <= $unsigned(($unsigned(($unsigned(wire98) ?
                  reg100[(4'h9):(1'h1)] : wire94)) & (((reg103 * (8'hb0)) ?
                      wire94[(1'h1):(1'h1)] : $unsigned(wire96)) ?
                  wire96 : (reg101[(1'h1):(1'h0)] ~^ ((8'hb9) ?
                      (8'ha0) : reg102)))));
              reg106 <= ($unsigned(wire95[(1'h0):(1'h0)]) | reg103[(2'h2):(2'h2)]);
              reg107 <= reg100;
              reg108 <= ($unsigned($unsigned(({wire94,
                  wire96} ^~ (^~wire97)))) - reg103[(3'h5):(2'h3)]);
            end
          reg109 <= ($unsigned(((^~(8'hb1)) ?
                  $unsigned(reg107[(3'h4):(3'h4)]) : ($unsigned((8'had)) ^~ ((8'h9c) ?
                      reg100 : wire94)))) ?
              ($signed((^{reg107,
                  reg103})) != $signed($signed((-reg100)))) : reg101);
        end
    end
  always
    @(posedge clk) begin
      reg110 <= $unsigned($signed($unsigned(({(8'hb6), reg100} ?
          (reg101 ? wire98 : reg107) : $unsigned(reg106)))));
      reg111 <= ($unsigned((reg109[(1'h1):(1'h0)] == wire96[(1'h1):(1'h1)])) ?
          reg100 : (($unsigned($signed(wire95)) ?
              (wire104 ? (-reg110) : {(8'hab), (8'hab)}) : $signed((reg110 ?
                  reg109 : wire99))) + {(reg101 >= $unsigned(reg110)),
              {(reg102 - wire96)}}));
      reg112 <= wire98;
    end
  always
    @(posedge clk) begin
      reg113 <= reg105[(2'h3):(2'h3)];
      reg114 <= $signed(reg110[(1'h1):(1'h1)]);
    end
  assign wire115 = ($unsigned(reg109) <= ({(^~reg100[(4'h9):(3'h5)])} ?
                       {$signed((wire97 >= (7'h42))),
                           (~^$signed(reg113))} : (wire104[(3'h6):(3'h6)] ^ reg105)));
  assign wire116 = ($signed(((reg102 ^~ (reg101 && wire96)) ?
                       ((~reg102) - (+wire104)) : $unsigned(((8'hac) ?
                           reg111 : (8'haf))))) << (&$signed(wire115)));
  assign wire117 = reg113[(2'h3):(1'h0)];
  assign wire118 = $signed((!wire99[(4'ha):(2'h2)]));
  always
    @(posedge clk) begin
      reg119 <= {($signed(reg102) ?
              (wire116[(3'h5):(2'h3)] ?
                  wire98 : wire98) : wire97[(4'h9):(3'h7)]),
          ($signed(($signed((8'hb9)) && (reg103 >> wire94))) < reg101)};
    end
  always
    @(posedge clk) begin
      reg120 <= ((((reg102 ^ (reg100 ?
              wire118 : (8'hae))) <<< $signed($signed((8'ha3)))) ?
          ((~reg103) ?
              (&$unsigned(wire116)) : reg109) : (~&reg100[(3'h5):(2'h3)])) > $signed($signed($unsigned((reg108 < wire99)))));
      reg121 <= ((8'haa) && (^$signed(($signed((8'hb5)) + $unsigned((8'hb8))))));
      reg122 <= ($signed(wire97) ? (!reg105) : (reg121 <= {reg112}));
    end
  assign wire123 = (((~&(reg119 ? reg121[(2'h2):(1'h1)] : $signed((8'hb2)))) ?
                           ($signed((~&reg120)) + $unsigned($unsigned(reg102))) : wire117[(1'h0):(1'h0)]) ?
                       $unsigned($signed(((^reg112) - ((8'hb4) + wire118)))) : (wire96[(4'hc):(1'h1)] ?
                           $unsigned($signed((8'ha3))) : {(wire97[(2'h3):(2'h2)] ?
                                   {reg106, reg110} : reg120),
                               (8'ha3)}));
  assign wire124 = ({reg101, ((~^{wire99, (8'hb1)}) + wire95)} ?
                       reg119[(3'h5):(3'h4)] : ((reg114[(3'h5):(2'h2)] <= wire118) ^ $signed($unsigned({reg111,
                           wire95}))));
endmodule
