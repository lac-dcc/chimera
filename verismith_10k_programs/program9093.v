module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire251;
  wire signed [(4'hd):(1'h0)] wire250;
  wire signed [(5'h10):(1'h0)] wire249;
  wire signed [(4'h9):(1'h0)] wire240;
  wire signed [(3'h5):(1'h0)] wire239;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire237;
  wire signed [(4'hf):(1'h0)] wire242;
  wire signed [(5'h11):(1'h0)] wire243;
  wire signed [(5'h15):(1'h0)] wire244;
  wire signed [(4'ha):(1'h0)] wire245;
  wire signed [(4'ha):(1'h0)] wire246;
  wire [(4'hb):(1'h0)] wire247;
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire251,
                 wire250,
                 wire249,
                 wire240,
                 wire239,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire168,
                 wire237,
                 wire242,
                 wire243,
                 wire244,
                 wire245,
                 wire246,
                 wire247,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (($unsigned(wire3) << ({{wire3}} ?
                     {{wire0,
                             wire1}} : (((8'hb9) && wire3) << $signed(wire1)))) <<< (wire3[(2'h2):(1'h0)] ?
                     (($signed(wire3) ? (wire2 ? wire1 : wire2) : (+wire2)) ?
                         wire3 : ((^wire0) & $unsigned(wire1))) : {((~&wire3) <<< (wire1 ?
                             wire1 : wire2))}));
  assign wire5 = (-(wire3[(1'h0):(1'h0)] ?
                     (8'h9d) : ((&$signed((8'hbb))) ?
                         wire0 : wire0[(2'h3):(1'h1)])));
  assign wire6 = {((wire0[(2'h3):(1'h1)] ^ wire2[(1'h0):(1'h0)]) ?
                         wire0 : ($unsigned($signed(wire1)) > (wire1[(2'h3):(2'h3)] ?
                             $unsigned((8'hbb)) : wire4))),
                     (wire2 == $unsigned($unsigned($unsigned(wire4))))};
  assign wire7 = (^~wire2[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= ($unsigned((^~($unsigned(wire4) << wire4))) | $signed((~|(wire3 | (~^wire1)))));
      reg9 <= ((~^{($signed(wire0) ? (wire6 ? wire7 : reg8) : wire7),
              ((wire6 ? wire0 : wire6) ?
                  $unsigned(wire3) : $unsigned(wire6))}) ?
          (^((~^$signed(wire1)) >> (^(!wire1)))) : wire5);
    end
  module10 #() modinst169 (.y(wire168), .wire15(wire3), .clk(clk), .wire12(wire0), .wire14(reg8), .wire11(wire5), .wire13(wire4));
  module170 #() modinst238 (wire237, clk, wire5, wire0, reg8, wire6);
  assign wire239 = wire237[(5'h10):(1'h1)];
  module27 #() modinst241 (wire240, clk, wire2, reg9, wire168, wire237, reg8);
  assign wire242 = $signed($signed(($signed($signed(wire7)) != $signed(wire6))));
  assign wire243 = $unsigned(wire242);
  assign wire244 = wire5;
  assign wire245 = $unsigned((~|$unsigned(wire4[(2'h3):(1'h1)])));
  assign wire246 = wire244[(4'he):(3'h6)];
  module27 #() modinst248 (.clk(clk), .wire31(wire7), .y(wire247), .wire32(wire168), .wire30(wire240), .wire29(wire243), .wire28(wire2));
  assign wire249 = (wire244[(3'h7):(3'h6)] >>> $unsigned(($signed(wire243[(3'h7):(1'h1)]) >> (|{wire5}))));
  assign wire250 = $unsigned($unsigned($signed(wire244[(3'h6):(1'h0)])));
  assign wire251 = wire2[(4'hb):(3'h5)];
endmodule

module module170
#(parameter param235 = (~&(~|((^~((7'h41) ? (8'ha5) : (8'hbb))) ? ((~^(8'hb4)) >= (7'h41)) : (~&((8'h9e) ? (8'haa) : (8'ha6)))))), 
parameter param236 = (|param235))
(y, clk, wire171, wire172, wire173, wire174);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire171;
  input wire [(5'h12):(1'h0)] wire172;
  input wire signed [(4'hd):(1'h0)] wire173;
  input wire [(5'h13):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire234;
  wire [(5'h15):(1'h0)] wire233;
  wire [(5'h11):(1'h0)] wire232;
  wire [(4'hb):(1'h0)] wire231;
  wire [(4'hc):(1'h0)] wire229;
  wire signed [(4'h8):(1'h0)] wire201;
  wire signed [(5'h11):(1'h0)] wire200;
  wire [(4'hf):(1'h0)] wire175;
  wire [(4'hb):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire198;
  assign y = {wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire229,
                 wire201,
                 wire200,
                 wire175,
                 wire176,
                 wire198,
                 (1'h0)};
  assign wire175 = wire174[(4'ha):(2'h2)];
  assign wire176 = wire175;
  module177 #() modinst199 (.wire179(wire174), .y(wire198), .wire182(wire173), .clk(clk), .wire181(wire172), .wire178(wire175), .wire180(wire176));
  assign wire200 = ((8'hab) ?
                       (wire176 ?
                           ($unsigned((wire174 <= wire175)) ?
                               (^(-wire176)) : {$unsigned(wire172),
                                   wire171}) : {$unsigned(wire176[(3'h4):(1'h1)])}) : ($signed($unsigned((wire174 - (7'h44)))) >>> (wire176[(1'h0):(1'h0)] ^~ $signed((^wire198)))));
  assign wire201 = $unsigned((|$unsigned($signed((wire174 ?
                       (8'hae) : wire173)))));
  module202 #() modinst230 (wire229, clk, wire198, wire175, wire174, wire172);
  assign wire231 = $signed($signed((((~&wire200) > (~wire200)) ?
                       $unsigned((!wire200)) : wire172[(2'h2):(2'h2)])));
  assign wire232 = $signed(({$signed((wire171 | (8'ha5)))} ?
                       wire201[(2'h3):(2'h2)] : (~|($unsigned(wire229) ?
                           (wire174 > wire175) : {wire175}))));
  assign wire233 = (^(+wire176[(1'h0):(1'h0)]));
  assign wire234 = wire176[(4'hb):(4'hb)];
endmodule

module module10
#(parameter param166 = {(8'hb2)}, 
parameter param167 = param166)
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h219):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire158;
  wire [(3'h5):(1'h0)] wire157;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(5'h15):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire138;
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg153 = (1'h0);
  reg [(2'h3):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire52,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire59,
                 wire138,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
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
                 reg58,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire16 = ((~|(wire13 ?
                      $signed({wire15, wire15}) : (((8'haa) ? wire12 : wire15) ?
                          wire12[(2'h2):(1'h0)] : wire12))) == (((^~wire11[(4'he):(2'h2)]) && wire13[(4'hc):(4'hc)]) >>> (!wire13)));
  assign wire17 = wire11;
  assign wire18 = $unsigned(wire12[(1'h1):(1'h1)]);
  assign wire19 = $unsigned((wire15[(4'h9):(1'h1)] ?
                      (+$signed($unsigned(wire18))) : $signed(wire16)));
  always
    @(posedge clk) begin
      if ((wire19 ?
          wire19 : ((~&({wire16, (8'hab)} ?
              wire12[(2'h3):(2'h2)] : {wire17})) | {(wire16 - wire17[(4'hc):(4'h8)])})))
        begin
          if ($signed($signed($unsigned((wire19 ? {wire13} : wire18)))))
            begin
              reg20 <= ($unsigned(({{wire14}, (^~wire11)} ?
                  $signed((+wire12)) : $unsigned((wire17 ?
                      wire18 : wire18)))) & {wire14,
                  (~((wire19 ^~ wire16) ? (wire13 >> wire15) : (^~wire15)))});
              reg21 <= $signed($unsigned((((wire14 ?
                  wire12 : (8'hab)) || $unsigned(wire12)) & $unsigned($unsigned(wire15)))));
            end
          else
            begin
              reg20 <= $signed($signed(({wire14} ?
                  ((reg20 && wire17) << (+(8'hab))) : {$unsigned(wire18)})));
              reg21 <= ((+wire13) + $unsigned(wire12[(4'h9):(3'h4)]));
            end
        end
      else
        begin
          reg20 <= (wire12[(4'h8):(3'h4)] != wire16);
          reg21 <= (!((+wire18) ?
              (~&{wire13[(5'h10):(4'h8)]}) : wire17[(4'hd):(4'ha)]));
          reg22 <= ($unsigned(wire17) || $signed((~&({(8'hbc), wire19} ?
              (~|wire17) : (wire14 != (8'had))))));
          reg23 <= (&($unsigned(wire17) && (^(+wire12))));
        end
      reg24 <= ($signed((~wire12)) * $unsigned({({wire16,
              reg21} && (reg22 * reg22)),
          (~&wire14[(4'he):(3'h4)])}));
      reg25 <= (^(($signed($unsigned(wire12)) ?
          $signed(wire13) : (~^$unsigned((8'hb4)))) + {(~|(reg21 ?
              wire11 : wire13))}));
      reg26 <= wire19[(4'h8):(2'h2)];
    end
  module27 #() modinst53 (wire52, clk, reg24, wire16, reg26, wire12, wire15);
  assign wire54 = $signed($signed(($unsigned(((8'hbc) ? reg26 : reg25)) ?
                      $unsigned(wire17) : $signed(wire12[(3'h6):(1'h0)]))));
  assign wire55 = wire54;
  assign wire56 = reg25;
  assign wire57 = (&((((~reg20) ?
                          $signed(wire13) : $signed(reg23)) >> (~|$signed(reg23))) ?
                      (!$signed({wire54})) : ($signed((reg24 ?
                              wire54 : reg25)) ?
                          $unsigned($signed(wire15)) : (|wire14[(5'h13):(1'h0)]))));
  always
    @(posedge clk) begin
      reg58 <= (8'hba);
    end
  assign wire59 = (~($unsigned($unsigned(reg58)) >> ({(^~reg21),
                      $signed((8'hb9))} ^ (reg23 <<< $signed(reg23)))));
  module60 #() modinst139 (wire138, clk, reg25, wire18, reg24, wire55, wire54);
  always
    @(posedge clk) begin
      reg140 <= ($unsigned((8'hb4)) ? $unsigned(reg26) : wire18);
      reg141 <= $signed((8'hae));
      reg142 <= (&(~^wire57[(2'h3):(2'h2)]));
      reg143 <= $unsigned(($unsigned({((8'ha5) ? wire57 : reg24),
          {wire16, (7'h43)}}) > wire59));
    end
  always
    @(posedge clk) begin
      if (wire55[(4'h8):(3'h7)])
        begin
          reg144 <= reg22;
        end
      else
        begin
          reg144 <= reg26;
          reg145 <= (wire138 ?
              (~$unsigned(((reg141 ?
                  reg144 : wire13) <<< (|reg58)))) : reg24[(4'hf):(4'he)]);
          reg146 <= ((~|($signed((wire15 < (8'ha1))) ?
              ((reg25 ? wire19 : reg25) <= {(8'hb4), wire13}) : (^((8'ha5) ?
                  wire55 : wire12)))) >= reg141);
        end
      if (reg26[(3'h5):(2'h2)])
        begin
          if ({(8'ha5)})
            begin
              reg147 <= $unsigned(wire57);
              reg148 <= $signed((reg25[(1'h0):(1'h0)] ?
                  reg141 : ($unsigned($signed(wire52)) || ((wire54 ?
                          reg142 : (8'haa)) ?
                      wire52 : ((8'hb3) <<< reg140)))));
              reg149 <= (|wire11[(2'h2):(1'h0)]);
              reg150 <= $unsigned((+((reg146[(1'h0):(1'h0)] ?
                  reg147[(2'h3):(2'h3)] : $signed(wire14)) || $signed(reg23[(2'h3):(2'h3)]))));
              reg151 <= ((reg24 ?
                      $unsigned(((~&(8'haf)) ?
                          reg147[(4'h8):(1'h0)] : wire54)) : reg141[(3'h4):(2'h2)]) ?
                  wire14[(4'hc):(2'h3)] : (!wire19));
            end
          else
            begin
              reg147 <= $signed(wire59);
              reg148 <= (reg142[(4'he):(3'h5)] ?
                  {((^$unsigned(wire14)) ?
                          reg143[(4'h9):(3'h4)] : (reg21 ?
                              reg24[(3'h7):(3'h6)] : (^reg26))),
                      {$signed($signed((7'h43))),
                          ($unsigned(wire14) && (+reg21))}} : wire59[(3'h5):(2'h2)]);
              reg149 <= ($unsigned({wire12[(5'h10):(2'h3)],
                      $unsigned({reg58, (8'hb1)})}) ?
                  (^~((wire138[(1'h0):(1'h0)] || (+(7'h41))) + (~^$unsigned(reg144)))) : (reg58[(1'h0):(1'h0)] ?
                      (reg150[(2'h3):(2'h2)] <= {(&reg143)}) : ($unsigned((|reg23)) ?
                          reg148 : (~|$signed(wire57)))));
              reg150 <= $unsigned($unsigned((((~^reg23) ?
                  reg148 : (wire16 ? wire56 : wire19)) * {$signed(wire138)})));
              reg151 <= $unsigned(wire15);
            end
          reg152 <= (!$signed(reg148[(2'h3):(1'h1)]));
          reg153 <= reg149[(5'h10):(2'h3)];
          reg154 <= $signed((^(reg147 ? reg153 : {reg21, $unsigned(reg58)})));
        end
      else
        begin
          if ({((^~{(wire11 ? reg143 : reg154)}) ?
                  ($unsigned($signed(wire19)) ^~ wire12[(2'h3):(1'h1)]) : $unsigned((!$unsigned((8'ha9))))),
              ((!($signed((8'ha5)) == wire54)) >>> ($signed(((8'ha4) ^ (7'h44))) - wire59[(2'h3):(2'h3)]))})
            begin
              reg147 <= $signed(($signed((((7'h44) ? reg151 : (8'hb6)) ?
                      (8'hbd) : $signed((8'hba)))) ?
                  $signed($signed($signed((8'hae)))) : $signed(reg154)));
              reg148 <= wire54;
              reg149 <= {$signed($signed(($unsigned(reg25) ?
                      (reg150 > wire138) : (reg145 ? wire56 : reg23))))};
            end
          else
            begin
              reg147 <= wire59;
            end
          reg150 <= (|$unsigned((~(reg26 == {(8'hb3), wire11}))));
          reg151 <= (+{$signed(({wire15} ?
                  $signed(reg22) : $unsigned((8'hbf))))});
        end
      reg155 <= reg143[(2'h2):(1'h0)];
      reg156 <= reg152;
    end
  assign wire157 = ($signed(((~(wire19 - reg149)) | $signed((^~reg155)))) ?
                       $signed({$unsigned($signed((8'hbf)))}) : (wire13[(5'h14):(4'hf)] ?
                           wire17[(4'hd):(3'h7)] : (reg21[(2'h2):(1'h1)] <<< reg152[(1'h0):(1'h0)])));
  assign wire158 = reg20[(3'h5):(1'h0)];
  always
    @(posedge clk) begin
      if (reg153)
        begin
          reg159 <= {$signed({$signed((&wire15)), $signed(wire19)})};
        end
      else
        begin
          if ({$signed((~^$signed((^~reg150))))})
            begin
              reg159 <= {(8'ha5),
                  ($unsigned(wire12[(4'h8):(3'h4)]) && (((~^reg154) ?
                      reg147 : reg149) <= wire13[(4'hc):(3'h6)]))};
              reg160 <= (wire11[(4'hc):(2'h2)] << reg156);
              reg161 <= (wire54[(1'h0):(1'h0)] ?
                  (({(8'hab),
                          reg21[(2'h3):(1'h1)]} < ($unsigned(reg159) & $unsigned(reg151))) ?
                      $signed({reg22[(5'h10):(4'hd)]}) : wire158[(4'ha):(4'ha)]) : (!($signed((wire138 | wire12)) ~^ reg146)));
              reg162 <= (((&$signed((~&reg156))) ?
                      reg20[(2'h2):(1'h1)] : ($signed(wire138) ?
                          ($unsigned(reg150) < $unsigned(wire54)) : (&((8'h9d) ^~ wire56)))) ?
                  reg26 : reg154[(2'h3):(2'h3)]);
              reg163 <= ((!reg148) <<< (-$unsigned(($signed(reg144) ?
                  ((8'hbf) ? reg152 : wire52) : (reg23 ? (8'hb8) : reg152)))));
            end
          else
            begin
              reg159 <= ((($unsigned($unsigned(reg149)) ?
                  (((8'ha3) ?
                      wire55 : wire59) <= $signed(reg149)) : $signed(((8'hbf) ?
                      reg147 : reg148))) ^ $signed(((wire57 == (8'h9d)) >>> (wire15 ?
                  (8'haa) : reg22)))) << $signed(wire138));
              reg160 <= $signed(((|reg22[(1'h0):(1'h0)]) || (($unsigned((8'hb5)) ?
                      $signed(wire157) : reg146[(2'h2):(1'h1)]) ?
                  ($unsigned(wire12) ? (|reg159) : reg22) : ((wire15 ?
                          reg140 : (8'ha0)) ?
                      $signed(wire52) : $signed(reg144)))));
              reg161 <= $unsigned($signed(reg144[(3'h5):(1'h1)]));
              reg162 <= reg25;
            end
          reg164 <= reg155;
        end
      reg165 <= {(8'ha0), reg160};
    end
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h2ea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire65;
  input wire signed [(4'hf):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire [(3'h6):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(3'h5):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire67;
  wire [(4'hf):(1'h0)] wire66;
  reg signed [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'he):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(4'ha):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire85,
                 wire68,
                 wire67,
                 wire66,
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
                 reg115,
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
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
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
                 reg69,
                 (1'h0)};
  assign wire66 = $unsigned(wire61);
  assign wire67 = (|(((!(~^wire66)) <<< wire66[(4'hf):(1'h1)]) >= wire61));
  assign wire68 = (+($unsigned(((wire63 ? (8'hb1) : wire67) ?
                      wire61[(2'h3):(2'h2)] : (&wire64))) != (&wire61)));
  always
    @(posedge clk) begin
      if (((&(!((wire63 ?
          (8'ha7) : wire61) + $signed((8'hb5))))) + ((($unsigned(wire65) ?
          $signed(wire66) : $signed(wire65)) || wire67[(2'h3):(1'h1)]) + wire63)))
        begin
          if ($unsigned((wire68[(4'h8):(3'h7)] <<< $signed((~^$signed(wire61))))))
            begin
              reg69 <= wire61[(3'h5):(3'h5)];
              reg70 <= (((wire68[(3'h7):(2'h2)] <<< $signed($unsigned(wire67))) ^~ (wire66 > ((reg69 != wire67) != ((8'h9d) ^~ wire64)))) || wire67[(5'h10):(4'hb)]);
            end
          else
            begin
              reg69 <= ({$unsigned((8'hbb))} ?
                  $unsigned(wire68) : wire64[(3'h5):(1'h1)]);
              reg70 <= wire66[(1'h0):(1'h0)];
              reg71 <= wire68[(4'h8):(3'h4)];
              reg72 <= (~&wire68[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg69 <= reg70;
          reg70 <= reg71;
          reg71 <= $unsigned(reg71[(4'h9):(3'h7)]);
        end
      reg73 <= reg72[(2'h2):(1'h0)];
      reg74 <= $signed((wire65[(3'h6):(3'h6)] + (((reg73 == wire64) ?
          $unsigned(wire68) : (wire67 ?
              wire62 : wire62)) << $unsigned((&reg73)))));
      if (wire65[(3'h4):(1'h0)])
        begin
          if ((($unsigned({(~&(8'ha6)), wire64[(4'h8):(3'h7)]}) ?
              $signed($unsigned($signed(wire66))) : $signed((~^$signed(wire61)))) != $signed((~(wire61 << $unsigned(reg74))))))
            begin
              reg75 <= reg69[(2'h3):(2'h2)];
              reg76 <= wire68[(4'ha):(1'h0)];
            end
          else
            begin
              reg75 <= $signed($unsigned(reg72));
              reg76 <= (^$unsigned($unsigned(((8'ha0) ?
                  $signed((8'hb3)) : wire64))));
              reg77 <= (({($signed(wire64) ?
                          wire64 : (reg70 ? reg74 : wire68))} ?
                  (^$unsigned($signed(reg71))) : ($unsigned(reg75) ?
                      {$signed(wire62)} : ((^wire61) | $signed(reg71)))) & ((reg71 >> (!(wire67 ?
                  reg71 : wire61))) - (($unsigned(wire65) << (8'haa)) ?
                  $unsigned((reg71 - (7'h43))) : wire61[(3'h5):(3'h5)])));
              reg78 <= (wire68 ?
                  $signed((&$unsigned((wire66 ?
                      reg74 : reg75)))) : ($unsigned({(!wire63), (-wire68)}) ?
                      (~&wire63) : $unsigned(((reg72 * reg74) != $signed(wire68)))));
              reg79 <= $unsigned($signed((wire66 + reg78)));
            end
          reg80 <= reg79[(3'h6):(1'h0)];
          reg81 <= (reg80[(4'hc):(4'h9)] ?
              reg75[(4'h8):(1'h1)] : $signed($unsigned($unsigned((reg69 ?
                  wire65 : reg80)))));
          reg82 <= (reg72[(4'hd):(3'h5)] + wire68[(3'h5):(1'h1)]);
          reg83 <= $unsigned($signed(wire67));
        end
      else
        begin
          if (((reg71 ^~ ($signed($unsigned((8'ha9))) ^~ reg75[(4'h8):(1'h0)])) >>> (|(~$signed($unsigned(reg79))))))
            begin
              reg75 <= (~|(reg78 ?
                  $unsigned($signed((^~reg79))) : $unsigned(wire61[(1'h0):(1'h0)])));
              reg76 <= (~^reg79[(3'h6):(1'h1)]);
              reg77 <= reg77;
              reg78 <= $unsigned({$signed($signed((~(7'h43))))});
              reg79 <= wire68[(3'h4):(2'h3)];
            end
          else
            begin
              reg75 <= reg79[(1'h1):(1'h0)];
              reg76 <= (^$unsigned(reg81));
            end
          reg80 <= $unsigned($unsigned(wire66));
        end
      reg84 <= (&$unsigned($unsigned($signed((reg75 ? reg72 : reg77)))));
    end
  assign wire85 = $unsigned({$unsigned(reg76[(3'h4):(2'h3)])});
  always
    @(posedge clk) begin
      reg86 <= $unsigned((wire62 ^ reg76));
      reg87 <= ((wire63 >= (reg78[(5'h10):(1'h1)] && (reg73 ?
              (reg70 ? wire63 : wire62) : (reg80 <<< reg80)))) ?
          $unsigned(wire68) : $unsigned(($unsigned($signed(wire64)) & reg81)));
      if (($unsigned(wire68[(4'h9):(2'h3)]) ?
          ((~^wire66[(4'hd):(3'h7)]) <= $unsigned(($unsigned(reg71) <= $unsigned(reg82)))) : (wire67 ?
              (((wire62 ? reg72 : wire85) << wire63) ?
                  reg84 : (|(wire68 + wire66))) : $signed(reg84))))
        begin
          reg88 <= reg86[(4'h8):(1'h1)];
          reg89 <= ((8'hba) ? wire61 : wire85);
          reg90 <= (((8'hba) - (($unsigned(wire68) + reg70[(1'h1):(1'h1)]) <<< ($unsigned(reg81) - (reg69 ?
                  reg73 : (8'hbb))))) ?
              $unsigned((^(|$unsigned(reg70)))) : (~|wire85));
          if (reg73)
            begin
              reg91 <= $unsigned($signed((($unsigned(wire68) ?
                  (8'hba) : (8'hb7)) | reg76[(2'h2):(1'h1)])));
              reg92 <= (8'hbb);
            end
          else
            begin
              reg91 <= ((~&(|reg73[(3'h5):(1'h1)])) ?
                  $unsigned(reg83[(4'ha):(4'h9)]) : wire63);
            end
        end
      else
        begin
          if (reg80[(3'h7):(2'h2)])
            begin
              reg88 <= (+{wire66[(4'h9):(4'h8)], $unsigned(reg88)});
            end
          else
            begin
              reg88 <= (8'hb2);
              reg89 <= (&((8'had) ?
                  (&$signed((reg72 | reg86))) : ($unsigned((reg84 ?
                          reg76 : reg80)) ?
                      $unsigned(wire63[(3'h7):(1'h1)]) : (^(reg91 > (8'haf))))));
              reg90 <= ($unsigned(reg83[(2'h2):(2'h2)]) ?
                  reg78[(1'h1):(1'h1)] : $unsigned(({$signed(reg86),
                          ((8'hb4) | reg74)} ?
                      $signed($signed(wire66)) : (~$signed(reg91)))));
              reg91 <= {reg89[(2'h2):(2'h2)]};
            end
          reg92 <= ((|$unsigned(reg88)) >> ((8'ha1) <<< reg72[(5'h11):(4'hf)]));
          reg93 <= ({reg83} && (^~reg78[(4'hd):(4'ha)]));
          if ((reg93 ? wire85 : $unsigned(wire64)))
            begin
              reg94 <= (wire65[(2'h3):(2'h3)] ?
                  (~|wire68) : $unsigned($signed($unsigned((reg70 ~^ reg72)))));
              reg95 <= ($unsigned($signed(reg88[(3'h4):(3'h4)])) >> reg84[(1'h0):(1'h0)]);
              reg96 <= $signed(wire67[(4'hd):(2'h2)]);
              reg97 <= reg95;
              reg98 <= $unsigned({$unsigned((((8'hba) ?
                      (8'hb7) : reg78) && reg89)),
                  $signed(reg74[(2'h2):(1'h0)])});
            end
          else
            begin
              reg94 <= (~reg69[(3'h4):(1'h1)]);
            end
          if ({wire66[(4'hb):(2'h3)],
              $signed(($signed((reg98 ? reg75 : reg98)) ?
                  reg82[(1'h0):(1'h0)] : reg75))})
            begin
              reg99 <= (-((($unsigned(wire61) ?
                      reg77 : (reg69 ? wire67 : (8'had))) ?
                  ($unsigned(reg89) | reg95) : ((reg91 != reg94) && (~&reg98))) != ($unsigned(wire65[(2'h3):(1'h0)]) << $unsigned($unsigned(wire66)))));
              reg100 <= reg72[(4'hd):(4'h8)];
              reg101 <= $signed($unsigned(wire85[(1'h0):(1'h0)]));
              reg102 <= reg71;
              reg103 <= ({{((wire85 ^~ reg71) ?
                              $signed(reg87) : $unsigned(reg88))},
                      $signed($signed($unsigned(reg77)))} ?
                  wire62[(1'h0):(1'h0)] : (+wire67[(4'h8):(3'h5)]));
            end
          else
            begin
              reg99 <= $signed(((^~$signed(reg83)) ?
                  $unsigned(reg96[(2'h2):(2'h2)]) : (((reg78 || reg97) ?
                          {(8'hb3), reg102} : ((8'ha0) ? (8'h9e) : reg102)) ?
                      (reg72 ?
                          wire65[(3'h4):(1'h1)] : $signed(reg101)) : reg86[(4'hc):(4'hb)])));
              reg100 <= $unsigned((8'hb3));
            end
        end
      reg104 <= $unsigned($signed({reg81}));
      reg105 <= wire66;
    end
  always
    @(posedge clk) begin
      reg106 <= {reg103[(2'h3):(1'h1)]};
    end
  always
    @(posedge clk) begin
      reg107 <= reg84;
      reg108 <= ($signed($signed($unsigned(reg83))) ?
          (reg72[(3'h6):(3'h6)] ?
              $signed($unsigned(wire62[(4'ha):(3'h6)])) : $signed({(reg75 >= reg74)})) : reg82[(2'h2):(2'h2)]);
      reg109 <= reg95[(4'h8):(1'h1)];
      if ($signed((-({(wire65 ? (8'hb6) : reg84),
          $signed(reg78)} + (reg96[(1'h1):(1'h0)] << wire63[(1'h1):(1'h0)])))))
        begin
          reg110 <= ((^(((reg69 ? reg74 : reg98) ~^ (wire66 >= reg90)) ?
              reg80 : $unsigned({reg74,
                  (8'hbb)}))) & $unsigned($signed(((wire68 ?
              reg72 : reg94) > {(8'hbb), reg95}))));
        end
      else
        begin
          reg110 <= ($signed(reg99) ?
              $signed((!$unsigned($unsigned(reg100)))) : reg98);
          if (reg104[(4'h9):(2'h2)])
            begin
              reg111 <= ((-$unsigned(reg89[(4'h8):(3'h6)])) || ($unsigned((!(wire85 ?
                  reg93 : reg90))) >>> (reg74 == $unsigned(reg78))));
              reg112 <= $signed((((!$unsigned(reg76)) ?
                  reg75 : ((-reg95) + (reg94 < reg86))) < $signed((reg105[(3'h7):(3'h6)] ?
                  (^~wire64) : $unsigned(reg95)))));
            end
          else
            begin
              reg111 <= (reg80[(4'hc):(4'hb)] ?
                  (reg112 ?
                      {$unsigned($unsigned(reg82))} : (8'hbd)) : reg97[(5'h10):(4'h8)]);
              reg112 <= (~((~wire62[(1'h1):(1'h1)]) ?
                  (+reg106[(3'h6):(1'h0)]) : (~&reg82)));
              reg113 <= (reg100 | reg87[(1'h1):(1'h0)]);
              reg114 <= ($signed($unsigned(wire68[(4'h9):(3'h7)])) ?
                  $unsigned({(^~(reg93 ? reg72 : reg83)),
                      {(wire65 <<< reg92)}}) : $unsigned($unsigned($unsigned({reg96,
                      reg74}))));
              reg115 <= reg78[(4'h8):(3'h6)];
            end
          reg116 <= ({($unsigned((!reg103)) || (wire66[(3'h7):(2'h2)] ?
                      (-reg111) : (~reg106))),
                  wire65} ?
              {(^((reg83 ? reg69 : reg92) ?
                      (~^reg102) : {reg90, reg105}))} : $unsigned(reg104));
          reg117 <= (+$unsigned((7'h40)));
        end
      if (((8'h9e) & ($signed(reg76[(2'h3):(1'h1)]) >>> ($unsigned((8'hae)) >>> ((reg95 ?
              reg116 : (8'haf)) ?
          (reg107 ? reg84 : (8'h9e)) : $unsigned(reg100))))))
        begin
          if ((~wire61))
            begin
              reg118 <= reg111;
            end
          else
            begin
              reg118 <= ((~^(((^~(8'hb7)) ?
                          (reg74 ~^ reg74) : (reg106 ? reg101 : reg82)) ?
                      ((reg92 ? (8'hb8) : reg104) ?
                          $unsigned((8'haf)) : {(8'ha3)}) : (-reg70))) ?
                  ((^$unsigned({wire68})) ?
                      reg112 : ($unsigned({reg74, (8'hbf)}) ?
                          $signed((~|(8'had))) : reg109[(3'h6):(3'h6)])) : {$signed(reg109[(2'h2):(1'h0)])});
              reg119 <= (~&({$signed((&wire85)), (~{(8'haa)})} ?
                  $signed($signed(reg75)) : {($signed(reg77) << $signed(reg80))}));
            end
          reg120 <= reg110[(3'h4):(3'h4)];
          reg121 <= wire65[(2'h3):(2'h3)];
          if (reg99)
            begin
              reg122 <= {$unsigned((|(~$unsigned((8'hbd))))),
                  ($unsigned($unsigned((reg111 ^~ reg116))) || {$signed(reg114),
                      (~^(reg72 ? reg111 : wire66))})};
              reg123 <= $signed($unsigned((+$signed((reg99 < reg71)))));
            end
          else
            begin
              reg122 <= (+reg105);
              reg123 <= $signed(reg119[(4'h9):(3'h4)]);
              reg124 <= reg77;
              reg125 <= (|(~|{reg115[(3'h5):(2'h3)]}));
            end
        end
      else
        begin
          if ({$signed((!((|(8'hb5)) ?
                  wire65[(1'h0):(1'h0)] : reg80[(3'h7):(3'h4)])))})
            begin
              reg118 <= $signed((^reg87[(1'h0):(1'h0)]));
            end
          else
            begin
              reg118 <= reg107[(3'h6):(2'h2)];
              reg119 <= (&reg79);
              reg120 <= (($unsigned(((wire68 ?
                  reg93 : reg86) ^~ (wire85 > reg93))) - (reg121 >= $unsigned($signed(reg75)))) <= ({($signed(reg111) ?
                          $signed(wire68) : (wire66 || reg108))} ?
                  reg113[(1'h0):(1'h0)] : {reg75}));
            end
          if (reg104)
            begin
              reg121 <= (+$signed($unsigned($unsigned(reg110))));
              reg122 <= reg93[(2'h2):(1'h1)];
              reg123 <= reg103[(3'h6):(1'h1)];
              reg124 <= $unsigned((+reg72[(5'h12):(1'h1)]));
            end
          else
            begin
              reg121 <= reg121[(4'h8):(1'h0)];
              reg122 <= reg101;
              reg123 <= $unsigned(reg90);
            end
        end
    end
  assign wire126 = {($signed($signed($signed(reg71))) >= $signed((!$signed(reg119)))),
                       (!($unsigned(reg82) ?
                           reg86 : $signed((reg71 & reg116))))};
  assign wire127 = (8'hba);
  assign wire128 = ($unsigned(reg118[(2'h2):(1'h1)]) ?
                       {((8'ha6) + $unsigned($signed(wire61))),
                           reg115[(2'h3):(1'h1)]} : wire62[(3'h7):(1'h0)]);
  assign wire129 = ((~^{reg115, reg73[(4'hf):(4'hf)]}) - (reg70 ?
                       {reg105} : $unsigned($signed(reg74[(1'h0):(1'h0)]))));
  assign wire130 = $unsigned(($signed($unsigned((^~wire61))) <= reg89));
  assign wire131 = $unsigned(((~|reg119) ?
                       wire63[(3'h4):(3'h4)] : (((^~wire64) ?
                           {reg125} : (~^reg101)) || $unsigned((8'hb3)))));
  assign wire132 = $unsigned({$unsigned($signed((~&(8'hab)))),
                       ($signed({reg94, reg104}) ?
                           reg124[(2'h2):(1'h1)] : ((~^reg96) ?
                               (reg115 > reg107) : ((8'hb6) & (8'hb8))))});
  assign wire133 = {(~((8'hab) ?
                           (reg122[(3'h6):(3'h4)] >> (~|reg108)) : $signed($signed(reg115)))),
                       $unsigned((!reg88[(4'h8):(1'h0)]))};
  assign wire134 = reg109[(2'h2):(2'h2)];
  assign wire135 = wire129[(4'hb):(4'h8)];
  assign wire136 = reg100;
  assign wire137 = {reg98,
                       {$signed(({reg78, wire126} ? (!reg96) : {reg71})),
                           (~((reg102 ^ reg71) ?
                               $unsigned(wire130) : (reg82 != wire64)))}};
endmodule

module module27
#(parameter param51 = (((^~((~|(7'h43)) ? (!(8'h9c)) : ((8'ha2) ? (8'hbd) : (8'hb5)))) ^~ (-(((8'haf) ? (8'ha7) : (8'had)) <= ((8'hb1) ? (8'ha9) : (8'hb5))))) ? (8'haa) : (((~^((8'ha5) ? (8'ha1) : (8'ha0))) + (~|((8'hb7) ? (7'h43) : (7'h42)))) < {((~(7'h43)) ? ((8'hae) != (8'hb5)) : (^(8'hbe))), {(~(8'ha2)), ((8'ha9) ? (8'hac) : (8'h9c))}})))
(y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire32;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire signed [(4'h9):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  assign y = {wire50,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
  assign wire33 = wire31[(1'h0):(1'h0)];
  assign wire34 = $signed(wire30[(2'h2):(1'h0)]);
  assign wire35 = $signed($unsigned($signed(wire32)));
  assign wire36 = {wire34,
                      ($signed($unsigned(wire29)) != (((|(7'h43)) & (wire29 ?
                          wire34 : wire31)) > (^~$signed(wire32))))};
  assign wire37 = wire36[(2'h2):(2'h2)];
  assign wire38 = ({wire32} <= (^wire30[(2'h2):(1'h1)]));
  assign wire39 = wire31;
  always
    @(posedge clk) begin
      reg40 <= $signed($signed((wire38[(2'h3):(1'h0)] & $signed({(8'hbd),
          wire35}))));
      if (wire37)
        begin
          reg41 <= ($unsigned((wire29 ? wire29 : (!$signed(wire36)))) ?
              wire38 : (7'h41));
          reg42 <= wire38[(1'h1):(1'h1)];
          reg43 <= wire39[(4'ha):(4'h8)];
          if (wire39[(4'h9):(4'h8)])
            begin
              reg44 <= $signed($unsigned((~^{(wire35 * wire31), (&wire33)})));
              reg45 <= (!(-(+reg41[(2'h2):(1'h0)])));
              reg46 <= (8'hb7);
            end
          else
            begin
              reg44 <= $unsigned(({$signed((wire29 >= reg43)),
                      $unsigned(wire31[(2'h3):(2'h3)])} ?
                  ((+(~&reg43)) && reg40) : $unsigned(wire34[(2'h3):(2'h2)])));
              reg45 <= wire36[(1'h0):(1'h0)];
              reg46 <= (^~(-((wire34 ? $signed(reg45) : $unsigned(reg46)) ?
                  wire29 : (reg44 - $signed(wire31)))));
              reg47 <= $unsigned($unsigned(((wire30[(1'h0):(1'h0)] ?
                      $signed(wire36) : $unsigned((8'ha3))) ?
                  (wire29 ^~ reg41) : (~|(reg40 != (8'hb5))))));
            end
        end
      else
        begin
          if ((({wire29, ($signed(wire39) <<< (^~wire37))} ?
              reg41[(2'h2):(1'h1)] : ((~^(wire31 - reg45)) ?
                  wire36 : (((8'hbc) ? wire32 : reg46) ?
                      (^reg45) : $signed(wire30)))) >= $unsigned((reg45[(2'h3):(2'h2)] >>> (wire39[(3'h7):(1'h0)] - (~^wire28))))))
            begin
              reg41 <= (($signed(((~^wire36) ?
                  $signed(wire37) : $unsigned(wire37))) == (^~$signed((~^wire34)))) << $unsigned(reg41[(1'h1):(1'h1)]));
              reg42 <= $signed((((|((8'hb0) || wire32)) ?
                      reg40[(4'hc):(3'h6)] : ($unsigned(wire39) ?
                          ((8'ha9) ? wire39 : reg44) : (^reg47))) ?
                  (+(~|wire33)) : $signed(((wire35 * (8'hbd)) ?
                      $signed(reg40) : $signed(wire33)))));
              reg43 <= ((8'h9c) ?
                  (wire36 ?
                      $signed(wire29[(4'hc):(3'h5)]) : reg46) : ($unsigned($signed($unsigned((8'hb2)))) ?
                      (((reg47 ? reg47 : wire37) - $signed(wire32)) ?
                          (wire28 ?
                              (-wire37) : (wire31 ?
                                  wire37 : wire31)) : reg44[(4'hd):(1'h0)]) : $signed(wire31[(2'h2):(2'h2)])));
              reg44 <= $unsigned((reg43[(1'h0):(1'h0)] - $unsigned(wire31)));
              reg45 <= $signed(reg41[(2'h2):(2'h2)]);
            end
          else
            begin
              reg41 <= wire28;
              reg42 <= ((~^(((wire32 ?
                  wire39 : wire37) << (wire38 - wire31)) ~^ {wire37})) >> {$unsigned($unsigned($unsigned(wire28))),
                  (&((wire36 ? wire35 : wire30) ? wire33 : reg47))});
              reg43 <= (reg43[(1'h1):(1'h0)] ?
                  $unsigned(($signed((|wire28)) ?
                      reg47[(3'h5):(2'h2)] : ((8'ha0) > $signed(wire36)))) : reg46[(3'h4):(1'h0)]);
            end
          reg46 <= {((+(~^$signed(reg41))) ?
                  (+$unsigned((wire38 ? wire28 : wire39))) : wire29),
              wire30[(2'h2):(2'h2)]};
        end
      reg48 <= reg42[(1'h0):(1'h0)];
      reg49 <= wire33;
    end
  assign wire50 = $unsigned(({$signed($signed(wire31))} > (^~(+$signed((8'hb6))))));
endmodule

module module202
#(parameter param227 = ((((((8'had) ? (8'hbb) : (7'h42)) ? {(8'ha5)} : {(8'h9f), (8'hb3)}) + {((8'hba) > (7'h40)), ((8'hbf) && (8'hb4))}) ? (((!(8'haf)) ? ((8'h9c) || (8'ha7)) : (-(8'hb7))) ? (((7'h43) ? (8'hb9) : (8'hbd)) ? (^~(8'hbb)) : {(8'haa)}) : (((8'hb1) - (8'ha9)) <= ((8'hb0) ? (8'h9e) : (8'ha0)))) : (^(((8'h9d) ? (8'ha1) : (8'hb6)) >>> (-(8'ha3))))) ? (8'had) : (((~|((8'hbc) << (8'hb0))) > (((8'ha8) ? (8'hbc) : (8'haf)) ? ((8'hba) ? (8'hbe) : (7'h44)) : (-(8'hbe)))) ? (~(^{(8'ha0)})) : {(((8'ha9) ? (7'h40) : (8'ha9)) ? ((8'ha9) ? (8'hb1) : (8'hb1)) : {(8'ha5), (8'hbd)})})), 
parameter param228 = {{((8'ha0) >> ((param227 ? param227 : (8'hab)) ? (param227 >= param227) : (param227 ? param227 : param227))), (param227 ^~ (+(^~param227)))}})
(y, clk, wire206, wire205, wire204, wire203);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire206;
  input wire signed [(2'h3):(1'h0)] wire205;
  input wire signed [(2'h3):(1'h0)] wire204;
  input wire [(4'hd):(1'h0)] wire203;
  wire [(5'h15):(1'h0)] wire226;
  wire signed [(2'h3):(1'h0)] wire225;
  wire [(4'hc):(1'h0)] wire224;
  wire [(3'h5):(1'h0)] wire223;
  wire [(4'h8):(1'h0)] wire217;
  wire signed [(5'h15):(1'h0)] wire210;
  wire [(3'h7):(1'h0)] wire209;
  wire signed [(4'h8):(1'h0)] wire208;
  wire signed [(3'h6):(1'h0)] wire207;
  reg [(5'h14):(1'h0)] reg222 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg220 = (1'h0);
  reg [(5'h14):(1'h0)] reg219 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg216 = (1'h0);
  reg [(2'h2):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg [(3'h4):(1'h0)] reg213 = (1'h0);
  reg [(5'h10):(1'h0)] reg212 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg211 = (1'h0);
  assign y = {wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire217,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire207 = ($unsigned(wire204[(2'h3):(2'h3)]) * (|wire204[(2'h2):(2'h2)]));
  assign wire208 = ((^~(($unsigned(wire207) >= (wire207 ? (8'haf) : wire204)) ?
                       wire204[(2'h2):(1'h0)] : ({(8'hab), wire204} ?
                           (wire206 || wire205) : (wire207 ?
                               wire207 : wire207)))) <= $unsigned({(|{wire206,
                           wire206}),
                       (&(wire203 ? (7'h42) : wire205))}));
  assign wire209 = ($unsigned((-$signed(wire204))) ?
                       wire206[(1'h1):(1'h0)] : (((wire205[(2'h2):(1'h0)] ?
                                   (-wire205) : wire204) ?
                               (wire208[(1'h1):(1'h0)] && (+wire208)) : (wire207 + wire203)) ?
                           (wire203 ?
                               $signed(wire205) : $unsigned((wire207 ?
                                   wire204 : wire206))) : ((wire207 ?
                               (wire206 == wire203) : wire203) * wire205)));
  assign wire210 = ((&wire206) > $unsigned($signed(({wire209,
                       wire207} ^~ $signed((8'hac))))));
  always
    @(posedge clk) begin
      if ({wire209[(1'h1):(1'h0)],
          {($signed(wire210[(5'h13):(3'h6)]) >> (wire209[(3'h5):(3'h4)] + (wire208 | wire207)))}})
        begin
          if ($unsigned(wire203[(4'hc):(3'h4)]))
            begin
              reg211 <= ((($signed($unsigned(wire208)) ?
                          ($signed(wire207) ~^ (wire206 != (8'hbe))) : (wire203[(3'h6):(2'h2)] ?
                              wire209[(1'h0):(1'h0)] : wire204)) ?
                      $signed(wire207) : $signed(wire205[(1'h1):(1'h0)])) ?
                  ($unsigned(wire210[(5'h13):(2'h2)]) ?
                      $signed($unsigned({(8'h9d)})) : (^~($signed(wire209) & $signed((8'ha8))))) : {(wire204 > (wire208 ?
                          (wire210 ? (8'ha5) : (8'hb9)) : (!wire208)))});
            end
          else
            begin
              reg211 <= wire203[(4'h9):(4'h8)];
              reg212 <= (~|((({(8'haf)} * $signed((8'had))) <= wire206[(2'h2):(1'h1)]) ?
                  (|wire208) : $unsigned(($signed(wire209) << wire209[(1'h1):(1'h0)]))));
              reg213 <= ((~^{wire203}) ?
                  (((wire210 ?
                      $unsigned((8'hbb)) : wire209) + (8'ha8)) ~^ $signed((|wire204))) : wire209);
            end
          reg214 <= reg212[(4'he):(1'h1)];
        end
      else
        begin
          reg211 <= (($signed((-$signed(reg211))) ~^ $signed($signed((reg212 >>> wire206)))) < ($unsigned(($unsigned(wire203) >> (|wire203))) ^ wire203));
          reg212 <= $signed((8'hb0));
        end
    end
  always
    @(posedge clk) begin
      reg215 <= wire208;
      reg216 <= ((wire205[(2'h3):(1'h1)] ~^ $signed(((~(8'hbb)) * {wire208,
              wire207}))) ?
          reg215[(1'h0):(1'h0)] : $signed((wire204 ~^ ($signed(wire209) == (reg215 ?
              wire209 : wire206)))));
    end
  assign wire217 = wire208;
  always
    @(posedge clk) begin
      reg218 <= wire205;
      reg219 <= wire209[(2'h2):(1'h1)];
      reg220 <= wire210;
    end
  always
    @(posedge clk) begin
      reg221 <= (8'h9f);
      reg222 <= ((wire203 ?
              (|$signed(wire209)) : ($signed(reg220[(4'h9):(3'h4)]) ?
                  wire208 : reg219)) ?
          {($signed(reg214[(1'h1):(1'h1)]) || (8'ha2))} : (8'hae));
    end
  assign wire223 = $unsigned(($unsigned({{wire205,
                           (8'h9f)}}) ^ $unsigned(({reg214,
                       reg216} >>> $unsigned(reg214)))));
  assign wire224 = {$signed((|(!(reg212 ? wire207 : wire203))))};
  assign wire225 = reg216[(1'h0):(1'h0)];
  assign wire226 = (~|{{reg212, ((~&wire225) && $signed(wire217))}});
endmodule

module module177
#(parameter param197 = {(((((8'hbd) < (8'ha1)) != {(8'h9e)}) ? (^~((8'h9d) < (8'hb9))) : (^(8'hb8))) ~^ {(((8'hab) ~^ (8'ha0)) >>> {(8'ha3), (7'h41)}), ({(8'ha1)} ? ((8'h9e) ? (7'h42) : (8'hbb)) : ((8'h9f) <<< (8'ha4)))}), (|(~^((~|(8'haa)) << ((8'ha1) | (8'hbc)))))})
(y, clk, wire182, wire181, wire180, wire179, wire178);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire182;
  input wire [(3'h5):(1'h0)] wire181;
  input wire [(3'h6):(1'h0)] wire180;
  input wire signed [(4'h8):(1'h0)] wire179;
  input wire signed [(4'hf):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire196;
  wire [(2'h2):(1'h0)] wire195;
  wire signed [(4'hb):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire193;
  wire signed [(4'hc):(1'h0)] wire192;
  wire signed [(5'h14):(1'h0)] wire191;
  wire [(2'h3):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire [(4'he):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire184;
  wire [(4'hb):(1'h0)] wire183;
  reg signed [(4'h9):(1'h0)] reg187 = (1'h0);
  reg [(4'h8):(1'h0)] reg186 = (1'h0);
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire184,
                 wire183,
                 reg187,
                 reg186,
                 reg185,
                 (1'h0)};
  assign wire183 = wire178[(3'h4):(2'h3)];
  assign wire184 = {wire183, wire179[(2'h2):(2'h2)]};
  always
    @(posedge clk) begin
      reg185 <= wire178;
      reg186 <= wire182;
      reg187 <= $signed($signed((|((wire179 ?
          (8'h9e) : wire184) >> (+wire181)))));
    end
  assign wire188 = reg187;
  assign wire189 = wire183[(4'h9):(3'h5)];
  assign wire190 = ((~&{$signed((~^reg185))}) >= $unsigned(wire178));
  assign wire191 = wire178[(4'h8):(1'h1)];
  assign wire192 = {(|$unsigned(((wire183 <= wire179) == $unsigned(wire181))))};
  assign wire193 = ($signed($unsigned(wire191[(5'h11):(4'ha)])) ?
                       (!(|($signed(wire188) + $unsigned(wire180)))) : $signed({wire183[(4'hb):(1'h1)],
                           wire180[(1'h1):(1'h0)]}));
  assign wire194 = {($unsigned(((wire193 >>> (8'ha0)) ?
                           $unsigned(wire188) : ((8'hbf) > reg187))) ^~ {{wire181},
                           wire183[(4'hb):(3'h6)]})};
  assign wire195 = wire194;
  assign wire196 = $signed(($unsigned($signed((wire189 | wire191))) ?
                       (~^{wire193[(4'hf):(4'hc)]}) : $signed(($signed(reg186) ?
                           ((8'h9f) ? wire184 : reg187) : wire178))));
endmodule
