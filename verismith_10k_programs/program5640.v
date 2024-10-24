module top
#(parameter param190 = (~|{{(((8'haf) ? (8'hb8) : (8'ha6)) != ((8'ha5) == (8'hbf))), (((8'hbe) ^ (8'hb6)) > ((8'hbf) & (7'h44)))}, (~&{((8'hb6) ? (8'hbc) : (8'hb5)), ((8'h9f) ? (8'hac) : (8'ha5))})}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire189;
  wire [(4'h9):(1'h0)] wire188;
  wire [(3'h5):(1'h0)] wire187;
  wire [(5'h14):(1'h0)] wire183;
  wire [(3'h5):(1'h0)] wire181;
  wire [(5'h14):(1'h0)] wire179;
  wire [(4'h9):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire55;
  reg [(3'h4):(1'h0)] reg186 = (1'h0);
  reg [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire183,
                 wire181,
                 wire179,
                 wire177,
                 wire58,
                 wire57,
                 wire5,
                 wire55,
                 reg186,
                 reg185,
                 reg184,
                 (1'h0)};
  assign wire5 = $unsigned(((($unsigned(wire1) ~^ $signed(wire0)) ?
                         $unsigned($signed(wire2)) : (wire3[(4'h8):(4'h8)] ?
                             wire4 : $unsigned(wire0))) ?
                     wire4 : (wire0 ?
                         (^((8'haf) ?
                             (8'hb4) : wire0)) : ($signed(wire1) <= $unsigned(wire4)))));
  module6 #() modinst56 (.wire10(wire3), .wire8(wire5), .wire7(wire0), .clk(clk), .wire11(wire2), .y(wire55), .wire9(wire1));
  assign wire57 = (wire4[(4'h8):(3'h5)] ?
                      wire55 : ((wire1[(4'h8):(4'h8)] + ($signed(wire1) <<< $unsigned((7'h41)))) ?
                          $unsigned((~|(wire3 && wire2))) : ((~|wire2) ?
                              wire5[(2'h2):(1'h0)] : wire3[(4'ha):(3'h5)])));
  assign wire58 = wire2[(4'hf):(4'hb)];
  module59 #() modinst178 (.wire63(wire0), .wire62(wire55), .y(wire177), .wire60(wire3), .clk(clk), .wire61(wire1));
  module116 #() modinst180 (.wire118(wire4), .clk(clk), .wire117(wire177), .y(wire179), .wire120(wire55), .wire119(wire5));
  module59 #() modinst182 (.y(wire181), .wire63(wire3), .wire62(wire0), .wire60(wire58), .clk(clk), .wire61(wire179));
  assign wire183 = wire55[(5'h12):(4'h9)];
  always
    @(posedge clk) begin
      reg184 <= wire58;
      reg185 <= $signed({(~^(wire57 < (7'h41))),
          (((wire3 || wire0) < wire5) ?
              {wire57[(3'h7):(3'h4)], (!wire4)} : (reg184[(1'h1):(1'h1)] ?
                  $unsigned(wire58) : ((8'hbd) ? reg184 : wire0)))});
      reg186 <= (~|$signed(($unsigned($unsigned(wire3)) || $signed((&wire58)))));
    end
  assign wire187 = wire181[(3'h4):(2'h3)];
  assign wire188 = ($signed(($signed((wire2 >>> wire177)) < $unsigned((wire177 ?
                           wire57 : wire181)))) ?
                       (7'h44) : ((($signed(wire58) - $unsigned(wire3)) ?
                           ($unsigned((8'ha5)) ?
                               ((8'h9f) ?
                                   wire187 : wire2) : $unsigned(reg186)) : wire1[(2'h2):(2'h2)]) ^~ $unsigned((reg184 ?
                           wire0[(1'h1):(1'h1)] : reg184[(1'h1):(1'h0)]))));
  assign wire189 = (^(wire58 ?
                       {wire5, wire2[(2'h2):(1'h1)]} : {wire5,
                           ((~&wire58) ?
                               (wire5 ?
                                   wire3 : reg184) : wire1[(5'h11):(3'h7)])}));
endmodule

module module59
#(parameter param175 = ((~(~&{((8'hbd) >= (7'h42)), (8'hae)})) * (^(8'hb9))), 
parameter param176 = param175)
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire signed [(5'h14):(1'h0)] wire61;
  input wire signed [(5'h12):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire [(4'hd):(1'h0)] wire172;
  wire signed [(3'h4):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire113;
  assign y = {wire174, wire173, wire172, wire170, wire115, wire113, (1'h0)};
  module64 #() modinst114 (wire113, clk, wire63, wire61, wire60, wire62);
  assign wire115 = (&(~^$signed(wire62[(1'h0):(1'h0)])));
  module116 #() modinst171 (wire170, clk, wire115, wire61, wire60, wire63);
  assign wire172 = {wire61[(5'h12):(4'h9)]};
  assign wire173 = wire113;
  assign wire174 = (&((-wire63[(4'hb):(4'ha)]) ? $unsigned(wire113) : (7'h40)));
endmodule

module module6
#(parameter param53 = (~&(^((!(^~(8'hb0))) + (7'h44)))), 
parameter param54 = {(^((8'h9f) | param53))})
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire49;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire36;
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire39,
                 wire38,
                 wire36,
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
  module12 #() modinst37 (.wire13(wire10), .y(wire36), .clk(clk), .wire14(wire8), .wire15(wire9), .wire16(wire7));
  assign wire38 = ($signed(wire7[(4'h9):(1'h1)]) <<< ((wire36 ?
                      $signed(wire9) : ((wire36 ?
                          (8'hba) : wire7) >> $unsigned(wire10))) >> {$signed(wire8[(4'hb):(4'h9)])}));
  assign wire39 = wire9[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg40 <= wire38[(4'h8):(3'h7)];
      reg41 <= wire39;
      reg42 <= $signed($unsigned((!((8'hb2) <<< wire8))));
      if ({$signed((|$signed((reg42 + (7'h43))))),
          {wire39[(1'h0):(1'h0)], $unsigned(((wire39 < reg41) > (~|reg41)))}})
        begin
          reg43 <= reg41;
          reg44 <= {wire8, (~^(^({wire9, reg43} ? $unsigned(wire7) : wire10)))};
          if (($unsigned(reg44) * (^~$signed(reg43[(1'h1):(1'h0)]))))
            begin
              reg45 <= $unsigned(({{wire38[(3'h7):(2'h3)]},
                  reg44} <= $signed((~|$unsigned(wire9)))));
              reg46 <= wire7;
              reg47 <= $unsigned($signed(reg41[(4'h8):(3'h7)]));
            end
          else
            begin
              reg45 <= $signed(wire10);
              reg46 <= $signed((wire36[(1'h0):(1'h0)] ?
                  ((reg47[(1'h1):(1'h1)] + (wire10 * reg44)) ?
                      ((reg47 ? reg42 : reg43) ?
                          $unsigned(reg40) : $signed(wire8)) : ((reg43 >= reg43) == (wire36 ?
                          reg41 : reg45))) : ((reg40 == reg42[(3'h4):(2'h3)]) & (-(+reg40)))));
            end
          reg48 <= (wire11[(2'h2):(1'h1)] ?
              reg43[(3'h5):(3'h5)] : {reg46, $unsigned(reg45)});
        end
      else
        begin
          reg43 <= ({reg48} ?
              ($signed(reg44) ?
                  $signed((+(reg44 && reg46))) : (7'h44)) : $unsigned($unsigned($unsigned(((7'h40) >> reg46)))));
        end
    end
  assign wire49 = ((reg48 ?
                      $signed(($unsigned(reg40) ?
                          (^~(8'hb9)) : reg41)) : $signed(({reg42,
                          wire11} > (wire36 != wire9)))) >>> {(^~(+$unsigned((8'ha4)))),
                      (~|{(wire8 ? wire7 : wire38)})});
  assign wire50 = (8'hb9);
  assign wire51 = (($signed((8'hae)) ?
                      ($unsigned({wire38}) == wire50[(1'h1):(1'h1)]) : reg42) >>> $unsigned(reg47));
  assign wire52 = ((-(8'ha7)) ?
                      $unsigned(((reg43 || $unsigned(wire8)) ?
                          (-(^wire10)) : $unsigned($signed(wire11)))) : (($signed((reg40 ?
                              reg40 : wire50)) ?
                          (&$signed(reg44)) : $signed({wire49,
                              wire7})) || (((^wire10) ?
                              (~|(8'ha8)) : (~^wire7)) ?
                          $unsigned((wire49 ?
                              wire9 : wire39)) : ((wire49 <= reg40) ?
                              $unsigned(reg46) : (wire8 ? (8'h9e) : wire38)))));
endmodule

module module12
#(parameter param34 = (8'hbb), 
parameter param35 = param34)
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire33;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  reg signed [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = ($signed((^$unsigned((~^wire13)))) ?
                      (wire14 ?
                          $signed(wire14) : $signed({(wire13 >>> wire16)})) : wire14[(4'h9):(4'h9)]);
  assign wire18 = (($signed($signed((wire17 ?
                      wire14 : wire16))) * ($unsigned((wire17 * wire15)) ?
                      (~^(wire15 * (8'hb3))) : (wire15[(3'h5):(1'h1)] >>> $signed(wire16)))) >> wire16);
  assign wire19 = $unsigned(wire15[(1'h1):(1'h0)]);
  assign wire20 = (&wire15);
  always
    @(posedge clk) begin
      reg21 <= ((wire17 || (|wire19[(2'h2):(1'h0)])) ?
          (^~({(wire16 ? wire14 : wire18), wire16} ?
              wire14[(1'h1):(1'h0)] : wire14)) : wire16[(3'h6):(3'h4)]);
      reg22 <= ((wire20[(3'h6):(1'h0)] ?
          (~((|(7'h42)) << reg21)) : wire13) | (($signed((&reg21)) <<< $signed($unsigned((8'hac)))) ?
          $unsigned(wire16[(3'h4):(1'h0)]) : $signed($signed($signed(reg21)))));
      reg23 <= {(8'ha5)};
    end
  assign wire24 = wire14[(1'h0):(1'h0)];
  assign wire25 = ((~^(wire14[(2'h2):(1'h0)] ^ $unsigned(((8'h9f) * wire17)))) ?
                      reg23[(1'h1):(1'h1)] : $unsigned(((reg23[(1'h0):(1'h0)] < reg21[(3'h5):(1'h1)]) >>> wire17)));
  assign wire26 = (^(8'ha8));
  assign wire27 = wire13[(1'h1):(1'h1)];
  assign wire28 = ({(~reg23[(1'h0):(1'h0)])} ^ ((8'hb8) << (&wire16[(1'h0):(1'h0)])));
  assign wire29 = wire28;
  assign wire30 = (8'ha8);
  assign wire31 = (~^$unsigned(reg22[(3'h4):(1'h0)]));
  assign wire32 = ($unsigned((((^reg22) ^~ $unsigned(wire17)) ?
                      wire25[(2'h2):(1'h1)] : (~|(wire27 ~^ wire31)))) ^~ wire27);
  assign wire33 = ((wire16[(3'h6):(2'h3)] ?
                      {wire17[(3'h5):(2'h3)]} : reg22[(4'h9):(1'h0)]) ^ wire14);
endmodule

module module116
#(parameter param169 = (~&(~|{((!(8'ha5)) >= ((7'h41) ? (8'hbd) : (8'ha2)))})))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h246):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire120;
  input wire [(5'h12):(1'h0)] wire119;
  input wire signed [(2'h2):(1'h0)] wire118;
  input wire signed [(4'h9):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire150;
  wire signed [(4'ha):(1'h0)] wire149;
  wire [(5'h12):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire121;
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(4'ha):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(5'h13):(1'h0)] reg122 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire151,
                 wire150,
                 wire149,
                 wire132,
                 wire131,
                 wire121,
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
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire121 = (^~({(8'hb2), (~&((8'hb8) ? wire117 : wire120))} ?
                       $unsigned(wire120[(4'h8):(3'h6)]) : (+$signed((wire118 ?
                           wire118 : wire120)))));
  always
    @(posedge clk) begin
      reg122 <= (|(wire117 ?
          wire120[(3'h4):(2'h3)] : $signed((wire121[(5'h13):(4'h8)] ?
              $unsigned(wire118) : {wire119, (8'ha8)}))));
      reg123 <= ((|($signed(wire118[(2'h2):(2'h2)]) * $signed($signed(wire117)))) - ({{$unsigned(wire119)}} ?
          ((wire120 ^~ $signed(wire120)) && $unsigned((~&(8'hab)))) : ($signed({wire121}) >>> $unsigned(wire120[(4'h8):(3'h5)]))));
      if ($signed(reg122[(5'h12):(5'h10)]))
        begin
          if (($unsigned($unsigned(wire121)) < ((~&$unsigned(reg122[(2'h3):(1'h0)])) & ((wire120[(2'h3):(1'h0)] + (wire118 ?
                  wire121 : reg122)) ?
              {(8'hac)} : $unsigned({wire118, wire121})))))
            begin
              reg124 <= ({(($unsigned(wire119) << $signed(wire118)) ?
                      $signed($signed(wire117)) : reg123[(2'h3):(2'h3)]),
                  ({wire118,
                      wire118} || $unsigned({reg123}))} << $signed(($unsigned((~^wire120)) & (((8'hae) ~^ wire120) ?
                  $signed(wire118) : $unsigned(wire119)))));
              reg125 <= wire120;
              reg126 <= (reg122[(5'h13):(5'h10)] || ($signed(({(7'h41),
                  (8'had)} | (wire119 ? (8'hbb) : reg124))) && reg123));
              reg127 <= (wire121 <<< wire120);
              reg128 <= wire117[(3'h4):(1'h0)];
            end
          else
            begin
              reg124 <= ({(((reg125 - wire119) << (reg122 ?
                          wire117 : wire117)) ?
                      $unsigned(reg124) : $unsigned({reg125})),
                  ((&$unsigned(wire117)) < ((^reg124) * reg123))} == $unsigned($signed($unsigned((!(8'hb8))))));
            end
          reg129 <= (^~reg123);
        end
      else
        begin
          if ((((wire117 ?
              reg123 : (8'ha0)) - reg128) ^ (wire119 && ((((8'hb4) ?
                  wire121 : (8'ha2)) & wire121[(4'hd):(1'h1)]) ?
              {$unsigned((8'ha0))} : (((8'hbf) ?
                  reg128 : wire119) >= $signed(wire121))))))
            begin
              reg124 <= $signed(reg126);
            end
          else
            begin
              reg124 <= $unsigned($unsigned($signed((~|reg129))));
              reg125 <= (8'hba);
            end
          reg126 <= $signed(reg123);
          reg127 <= (reg129 > ($signed(((wire121 ? wire117 : wire117) ?
              (wire118 ?
                  wire120 : wire119) : wire121)) <<< ((wire117[(2'h3):(2'h2)] ?
              (wire117 << reg126) : $signed(reg127)) + reg123)));
          reg128 <= {$signed(((~^$unsigned(reg125)) * ({wire120} < reg127[(2'h3):(1'h1)])))};
          reg129 <= ((7'h40) ?
              reg128[(1'h1):(1'h0)] : $unsigned($signed(wire119[(5'h10):(4'hc)])));
        end
      reg130 <= (~|reg125[(1'h0):(1'h0)]);
    end
  assign wire131 = reg130;
  assign wire132 = reg122[(4'ha):(4'h9)];
  always
    @(posedge clk) begin
      reg133 <= $signed((-$unsigned(({reg125,
          wire117} > wire118[(1'h0):(1'h0)]))));
      reg134 <= $signed($unsigned(wire132[(3'h5):(2'h2)]));
      reg135 <= reg122;
    end
  always
    @(posedge clk) begin
      if (reg123[(2'h2):(1'h1)])
        begin
          reg136 <= $unsigned($signed($signed(reg124)));
        end
      else
        begin
          reg136 <= $unsigned({(|$signed((^~(8'hba)))),
              ((-(reg122 >>> reg122)) ?
                  wire117 : ({(8'hb8)} > reg128[(1'h0):(1'h0)]))});
          reg137 <= (+(!(|(&wire121[(5'h14):(3'h4)]))));
          if (($signed(reg122[(2'h3):(2'h2)]) ?
              (reg125 ?
                  (wire131 ?
                      ((reg122 | reg130) ?
                          (reg127 && wire121) : (reg127 | reg126)) : reg136[(3'h6):(3'h5)]) : $unsigned($signed(reg134))) : $signed($signed(((wire132 && (8'ha5)) ~^ $signed(wire131))))))
            begin
              reg138 <= {($unsigned(reg135[(5'h11):(1'h1)]) >= $signed(((wire131 ^~ (8'hae)) >>> reg133[(3'h5):(3'h4)]))),
                  (|reg129)};
            end
          else
            begin
              reg138 <= $unsigned($signed((wire132[(1'h0):(1'h0)] | reg135)));
              reg139 <= $signed((reg137 ?
                  {(&$unsigned(reg137))} : ($signed(reg133[(2'h3):(2'h3)]) < wire120[(4'hc):(2'h3)])));
              reg140 <= wire119[(4'hc):(3'h5)];
              reg141 <= $signed($signed(reg140[(3'h4):(1'h1)]));
              reg142 <= ($signed((reg136[(4'hd):(3'h7)] ?
                      $unsigned((reg139 ?
                          reg122 : reg137)) : $signed($unsigned(wire121)))) ?
                  ((^~(reg139 ? reg140 : (reg133 ? (8'hab) : (8'h9c)))) ?
                      wire118[(1'h0):(1'h0)] : $signed(reg134[(2'h3):(2'h2)])) : (($unsigned((reg127 ?
                          reg140 : reg129)) ?
                      wire121 : (~&reg137[(2'h3):(2'h3)])) <<< $signed(reg139)));
            end
          if (wire120[(4'hd):(3'h7)])
            begin
              reg143 <= (&wire118[(2'h2):(1'h0)]);
              reg144 <= $signed((~^wire121));
              reg145 <= reg144;
            end
          else
            begin
              reg143 <= {(+($signed($unsigned(wire117)) ?
                      (8'haa) : (|(reg127 ? reg129 : reg134))))};
            end
          reg146 <= $unsigned((reg142[(4'h8):(3'h5)] < {$signed((~^reg123))}));
        end
      reg147 <= {reg146[(3'h5):(3'h5)],
          ((~|wire132[(1'h1):(1'h0)]) ? (8'h9d) : (~|(8'hb5)))};
      reg148 <= wire118;
    end
  assign wire149 = (~$unsigned(reg129[(1'h1):(1'h1)]));
  assign wire150 = (|{$unsigned(reg143),
                       {(wire132 ?
                               $signed(wire132) : (reg136 ?
                                   reg135 : (8'ha9)))}});
  assign wire151 = ((((reg124[(4'hb):(4'ha)] ^~ {wire117,
                           reg144}) ^~ (8'hac)) <<< $unsigned(($unsigned(wire132) ~^ (~^(8'hbf))))) ?
                       reg137[(4'hc):(2'h3)] : $unsigned((+$unsigned(((8'hab) ?
                           reg139 : (7'h40))))));
  always
    @(posedge clk) begin
      reg152 <= ($signed((~|wire149[(4'h8):(3'h6)])) ~^ ($signed(($unsigned(reg129) ?
              (reg137 ? wire132 : wire150) : ((8'hac) ? wire119 : wire150))) ?
          $signed(($signed(reg145) ?
              (reg142 ? wire118 : wire132) : (-reg137))) : reg140));
      if ((reg123[(1'h1):(1'h1)] == reg140[(1'h1):(1'h0)]))
        begin
          reg153 <= ($signed($signed(reg142)) ^ $signed((~&wire151[(3'h4):(1'h0)])));
          reg154 <= reg142[(3'h4):(2'h2)];
          reg155 <= (wire118[(2'h2):(1'h1)] ?
              ($signed($unsigned($unsigned(reg138))) ?
                  reg153 : $signed(wire151[(4'h8):(3'h5)])) : ((!wire118[(1'h0):(1'h0)]) ?
                  ($unsigned(reg136) ?
                      {$unsigned(reg147),
                          (reg154 ?
                              reg147 : reg153)} : $signed($signed(reg143))) : (!(-$signed(reg145)))));
          reg156 <= reg136[(3'h5):(2'h2)];
        end
      else
        begin
          reg153 <= (reg147[(1'h1):(1'h1)] ?
              (+(((8'hb1) > (!reg145)) ?
                  {(!reg127), $unsigned(reg154)} : (wire150[(3'h5):(1'h1)] ?
                      {(7'h41),
                          reg147} : reg136))) : $signed($signed({$unsigned(reg126)})));
          reg154 <= reg153[(4'hb):(4'h8)];
          if ($unsigned((($unsigned($signed(reg147)) || reg129) ?
              reg135 : reg140)))
            begin
              reg155 <= wire118;
              reg156 <= reg123;
              reg157 <= reg145[(3'h4):(3'h4)];
            end
          else
            begin
              reg155 <= $unsigned({((wire149 == reg123) || (^~(!wire118)))});
            end
          reg158 <= ($signed($signed(((^reg125) ?
              reg135 : (reg154 <<< reg136)))) <= ((~$unsigned($signed(wire118))) ?
              wire149[(3'h6):(3'h6)] : $signed((7'h43))));
        end
      if ((-reg141[(1'h1):(1'h1)]))
        begin
          reg159 <= $unsigned((~|$unsigned($signed({(8'had), reg125}))));
        end
      else
        begin
          reg159 <= $signed($signed($signed(wire121[(2'h2):(1'h0)])));
          reg160 <= ((reg158[(5'h10):(4'hf)] ?
              $unsigned(($signed(reg136) + reg128)) : ((-reg127[(2'h3):(2'h2)]) <= (8'hb7))) > reg142);
          reg161 <= ((^~$signed(reg145)) ?
              reg142 : $unsigned({$signed(reg146)}));
          if (reg147)
            begin
              reg162 <= (~&(~($unsigned(reg125) != ($unsigned((8'hb8)) ?
                  {wire119} : reg161))));
            end
          else
            begin
              reg162 <= wire149[(1'h0):(1'h0)];
              reg163 <= (~{({{reg123, reg134},
                      {reg162}} - $signed((reg154 & wire117)))});
              reg164 <= (8'ha6);
              reg165 <= (-reg159[(1'h0):(1'h0)]);
              reg166 <= (~^((((reg141 ? reg160 : reg154) ?
                          ((8'hb1) ? reg153 : reg129) : (wire149 ^ reg137)) ?
                      reg160[(4'hd):(3'h4)] : (reg160 ?
                          {(8'hab), reg133} : (reg135 >= (8'hb6)))) ?
                  (7'h42) : $unsigned({(!wire120), wire119})));
            end
        end
    end
  assign wire167 = (-$unsigned((wire151[(2'h2):(1'h1)] | $unsigned($unsigned(reg126)))));
  assign wire168 = reg130;
endmodule

module module64
#(parameter param112 = {(&((&(+(8'h9f))) ~^ {{(8'ha2)}}))})
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire68;
  input wire signed [(4'hd):(1'h0)] wire67;
  input wire [(5'h12):(1'h0)] wire66;
  input wire [(3'h5):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire69;
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(3'h5):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  assign y = {wire111,
                 wire110,
                 wire109,
                 wire106,
                 wire105,
                 wire104,
                 wire87,
                 wire69,
                 reg108,
                 reg107,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = ((-($unsigned((wire66 ~^ (8'hb4))) <<< (~|(wire65 ?
                          wire65 : (8'ha4))))) ?
                      wire65 : (8'haf));
  always
    @(posedge clk) begin
      reg70 <= (wire69 ? wire68 : $unsigned((^wire66)));
      reg71 <= wire68[(4'h9):(4'h9)];
      if ((|(wire68[(3'h4):(2'h2)] ^~ $signed(wire65[(3'h4):(3'h4)]))))
        begin
          reg72 <= ($signed(wire65[(3'h5):(2'h3)]) >>> {($signed((wire65 >> wire69)) * $signed($signed((8'ha4)))),
              (((wire68 ? wire69 : wire67) ?
                  wire65 : (wire66 ?
                      wire67 : (8'hb4))) >>> $unsigned(wire65))});
          if ((^(($signed($signed(wire68)) > $unsigned($unsigned(wire65))) ^ (~reg72))))
            begin
              reg73 <= reg71[(4'h9):(2'h3)];
              reg74 <= ($signed(reg71) >>> (wire67[(4'h9):(3'h6)] || (reg73[(4'hc):(1'h1)] ^ wire68)));
              reg75 <= wire68;
              reg76 <= reg75[(2'h2):(1'h1)];
            end
          else
            begin
              reg73 <= $unsigned(((~&{(reg71 | reg76)}) ?
                  {(8'ha5)} : ((8'hb7) + (~|reg72))));
              reg74 <= ($unsigned($signed(reg74[(2'h2):(1'h0)])) ^~ ($unsigned({wire66}) ?
                  {((reg73 - wire67) ?
                          wire66 : (reg75 ^ wire67))} : $unsigned(((wire68 | (8'hbd)) ?
                      (^~reg75) : $unsigned((8'ha6))))));
              reg75 <= $unsigned((^{$signed(reg76[(5'h12):(4'h8)])}));
              reg76 <= reg72[(3'h6):(3'h6)];
            end
          reg77 <= {$signed(($signed($unsigned(reg75)) ?
                  wire69[(1'h0):(1'h0)] : reg75[(2'h2):(2'h2)])),
              (&(reg72 ?
                  (|wire68) : ((wire69 * reg70) > wire69[(3'h5):(2'h2)])))};
          if ((~|$signed($unsigned((^(reg70 ? reg70 : wire66))))))
            begin
              reg78 <= ({(~$unsigned((~&reg74)))} - (~&(wire65 ?
                  ((wire66 ? reg73 : reg75) != (wire65 ?
                      reg71 : wire66)) : $unsigned($unsigned((8'hb3))))));
              reg79 <= {{$unsigned((8'ha9)),
                      (+{reg78, wire68[(4'hc):(3'h5)]})}};
              reg80 <= reg71;
              reg81 <= reg73;
              reg82 <= (!$unsigned((reg70 < (~&(reg70 <<< reg73)))));
            end
          else
            begin
              reg78 <= $signed($unsigned(($unsigned(wire68[(2'h2):(1'h0)]) ?
                  reg81 : reg76[(4'hc):(3'h4)])));
              reg79 <= wire66;
              reg80 <= (8'ha8);
              reg81 <= reg72;
              reg82 <= reg74;
            end
        end
      else
        begin
          reg72 <= (^((~|reg77) >> (|wire67[(4'h9):(1'h1)])));
          reg73 <= reg81[(4'h9):(4'h8)];
          if (wire69[(1'h1):(1'h0)])
            begin
              reg74 <= ((wire68 == ($unsigned(reg74[(2'h3):(1'h1)]) <= (~|reg80[(3'h5):(3'h4)]))) ?
                  reg75[(2'h3):(2'h3)] : ((-(+(+reg70))) ?
                      $signed((((8'hbc) | wire66) ?
                          (reg73 ?
                              reg72 : reg81) : wire65[(2'h2):(2'h2)])) : $signed(reg73)));
              reg75 <= {(-reg78[(3'h6):(3'h6)])};
              reg76 <= {($unsigned((~&$signed(reg79))) ~^ {($signed((8'h9d)) ?
                          $unsigned(reg75) : reg81[(1'h1):(1'h0)])}),
                  ((~&(-$unsigned(wire67))) ?
                      (reg70 ~^ wire65[(2'h3):(2'h2)]) : $unsigned(reg75))};
              reg77 <= $unsigned(reg75[(2'h3):(2'h2)]);
              reg78 <= (!$unsigned((~^($unsigned(reg80) < (-wire67)))));
            end
          else
            begin
              reg74 <= {($signed(reg74[(2'h3):(1'h1)]) << (reg72[(4'h9):(3'h6)] >= ((reg78 ?
                          reg82 : reg73) ?
                      (reg72 <<< wire67) : {reg74}))),
                  $unsigned((~^wire66))};
              reg75 <= $signed(reg70);
              reg76 <= $unsigned(wire66[(3'h7):(3'h5)]);
              reg77 <= ({((((8'hbd) ? reg70 : reg70) ?
                      wire65[(1'h1):(1'h0)] : {reg78,
                          (8'ha5)}) > reg78)} <<< ($unsigned({reg80[(3'h5):(1'h1)],
                      wire68}) ?
                  (((reg75 << reg76) <= (reg82 ? (8'hbe) : reg73)) ?
                      $signed(reg75) : (~&(reg80 || reg72))) : reg74));
            end
        end
      if (((wire66[(5'h10):(2'h2)] ?
              ((^~$unsigned(reg78)) ?
                  {reg78[(3'h5):(3'h4)]} : ($signed(reg82) ?
                      reg81 : (reg70 > wire66))) : ((~^reg80) ?
                  $unsigned(wire66[(5'h10):(2'h2)]) : $unsigned((reg75 != reg82)))) ?
          {(~|wire65[(3'h5):(1'h0)]), reg74[(4'h8):(1'h0)]} : $signed((((reg78 ?
                  wire67 : reg71) ?
              (wire65 ?
                  wire69 : wire67) : $unsigned((8'h9f))) <= reg79[(4'h9):(2'h2)]))))
        begin
          reg83 <= wire68[(1'h0):(1'h0)];
        end
      else
        begin
          reg83 <= $unsigned((reg71[(2'h3):(1'h1)] ?
              reg81 : reg72[(4'hc):(3'h4)]));
          reg84 <= {{wire68}};
        end
    end
  always
    @(posedge clk) begin
      reg85 <= $signed($signed($signed(($signed(reg79) ?
          $unsigned(reg71) : $signed(wire67)))));
      reg86 <= (((-wire66[(4'h9):(3'h4)]) <= reg81) ?
          reg77[(1'h1):(1'h1)] : reg82);
    end
  assign wire87 = $signed((-($signed(((8'hb3) ? reg75 : reg83)) ?
                      {(~|reg71)} : (reg78[(4'h9):(1'h1)] ?
                          $unsigned(reg84) : $unsigned(reg76)))));
  always
    @(posedge clk) begin
      reg88 <= (~|wire65[(1'h1):(1'h0)]);
      if ($unsigned(reg72))
        begin
          if ($unsigned(($unsigned($signed((-reg81))) && reg77[(3'h4):(1'h0)])))
            begin
              reg89 <= reg88;
            end
          else
            begin
              reg89 <= ((($unsigned((reg84 ? reg76 : reg89)) ?
                      ({wire69} ^~ $signed(reg82)) : ((reg79 ?
                          reg88 : (7'h42)) < {reg83})) <<< ((reg70 ?
                          (~reg86) : reg85[(2'h3):(2'h3)]) ?
                      $unsigned({reg89}) : $signed($unsigned(wire66)))) ?
                  reg81 : reg84[(1'h0):(1'h0)]);
              reg90 <= $signed(((($signed(wire67) ?
                          $unsigned(wire65) : (reg79 + reg79)) ?
                      wire87 : $unsigned((&reg77))) ?
                  reg81[(3'h6):(1'h1)] : {$signed((reg70 ? reg71 : wire67)),
                      reg85[(2'h3):(1'h0)]}));
              reg91 <= ((reg85[(1'h1):(1'h1)] + ((^~reg71) ?
                      {reg81} : $unsigned(reg77))) ?
                  reg76[(4'h8):(1'h0)] : reg85[(1'h0):(1'h0)]);
              reg92 <= (+reg86[(3'h6):(2'h2)]);
            end
          if ((reg88[(5'h10):(5'h10)] & ($signed(reg76) && (~reg79))))
            begin
              reg93 <= ((&$signed($unsigned((reg84 ? wire68 : wire69)))) ?
                  wire67 : (((8'hbf) ? (-(8'hb2)) : reg70) ?
                      wire69 : $signed(wire65[(3'h5):(1'h1)])));
              reg94 <= $unsigned(reg80);
              reg95 <= wire67[(4'h9):(1'h1)];
            end
          else
            begin
              reg93 <= {wire67[(1'h0):(1'h0)]};
              reg94 <= wire87[(2'h2):(1'h1)];
            end
          reg96 <= (|{reg83[(3'h4):(1'h1)]});
          reg97 <= {reg80[(3'h7):(3'h7)], ((|(~&(+reg89))) & reg92)};
        end
      else
        begin
          reg89 <= (($signed(reg83[(4'hd):(2'h2)]) ?
                  (~|$unsigned($unsigned(reg93))) : (^~(reg82[(3'h5):(1'h0)] ?
                      (~^reg79) : (reg86 ? reg70 : wire69)))) ?
              (~|(~&(8'hb4))) : $signed(($unsigned(reg70) ?
                  ((wire66 ? (8'hab) : reg93) ?
                      $unsigned(reg86) : (reg91 ~^ reg76)) : (8'h9d))));
          reg90 <= $signed($unsigned($unsigned($signed(wire65[(1'h0):(1'h0)]))));
          if (((wire66 > {(~|(wire69 ? wire66 : reg81))}) ?
              ({reg80} - (reg71[(3'h6):(1'h1)] < ($unsigned(wire67) && (!(8'hbb))))) : (~{(-$unsigned((8'ha2))),
                  $signed(reg91[(2'h2):(1'h0)])})))
            begin
              reg91 <= ({(8'hb4), reg76} ?
                  {(wire69 ? reg90 : $signed({wire87})),
                      ($unsigned(wire87) ?
                          {((8'ha1) | reg88)} : (+(~|(8'hbc))))} : ($signed({reg91[(2'h2):(2'h2)],
                          reg88[(3'h4):(1'h0)]}) ?
                      reg75 : reg97[(4'h9):(1'h1)]));
            end
          else
            begin
              reg91 <= $unsigned(($signed($unsigned(reg90[(2'h3):(2'h3)])) ~^ $unsigned($unsigned(((8'hab) ?
                  reg90 : reg91)))));
            end
          if (reg85)
            begin
              reg92 <= (((+{wire87,
                  (reg81 | reg72)}) > (~^reg86[(1'h1):(1'h1)])) == ((reg81 ?
                  $unsigned($unsigned(reg84)) : ((~&(8'ha7)) ?
                      (-reg91) : $signed(wire66))) ~^ reg88));
            end
          else
            begin
              reg92 <= (reg80[(3'h5):(2'h3)] | $signed($signed((~^$signed(reg84)))));
              reg93 <= reg91[(1'h0):(1'h0)];
              reg94 <= (reg88[(1'h1):(1'h1)] ?
                  reg70[(1'h1):(1'h1)] : (&(8'ha4)));
              reg95 <= ($unsigned((~$unsigned(wire69))) ?
                  ({{$unsigned(reg76)}, reg74} ?
                      (~|((reg80 ? reg74 : reg74) < (reg82 ?
                          reg75 : wire69))) : $unsigned($signed(reg83))) : reg72[(2'h2):(2'h2)]);
            end
        end
      if (reg71)
        begin
          reg98 <= reg82;
          if ({reg83, reg88[(2'h3):(1'h0)]})
            begin
              reg99 <= (~|(^~(reg72 ? (^$signed((8'h9c))) : $unsigned(reg96))));
              reg100 <= ($signed($unsigned(reg88)) & (&$unsigned(($unsigned(reg78) ~^ $signed(reg78)))));
              reg101 <= $signed($unsigned($unsigned(wire66[(4'hd):(1'h0)])));
              reg102 <= (^(reg81[(3'h6):(1'h1)] ?
                  reg85 : ((!(|reg70)) ?
                      {(reg73 <= reg98),
                          (reg100 ? reg75 : (8'ha4))} : reg83[(4'hb):(2'h2)])));
              reg103 <= reg86;
            end
          else
            begin
              reg99 <= ($signed(((+((8'hbf) ? wire67 : wire69)) ?
                      $signed((~|(8'hb4))) : reg80[(3'h5):(2'h2)])) ?
                  reg75 : reg89);
              reg100 <= $signed(reg76[(5'h14):(4'hd)]);
              reg101 <= reg80[(2'h3):(1'h1)];
              reg102 <= $signed(reg93[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          if (((reg83 >= reg78) & reg98))
            begin
              reg98 <= reg74[(4'h8):(2'h3)];
              reg99 <= reg82;
              reg100 <= reg94[(3'h4):(2'h3)];
            end
          else
            begin
              reg98 <= reg97[(4'hc):(4'h8)];
              reg99 <= $unsigned(($unsigned($signed(reg91)) ? {reg99} : reg79));
              reg100 <= reg73[(2'h2):(2'h2)];
            end
        end
    end
  assign wire104 = ($signed(wire68) != $signed({(^(reg70 <<< wire87)),
                       {(reg92 || reg97), reg84}}));
  assign wire105 = $unsigned(reg92);
  assign wire106 = (8'ha7);
  always
    @(posedge clk) begin
      reg107 <= reg78[(4'h8):(2'h2)];
      reg108 <= ($unsigned(reg96[(4'ha):(1'h0)]) == $unsigned(((8'ha8) | wire69)));
    end
  assign wire109 = $signed((reg102[(4'h8):(3'h7)] ?
                       reg91[(3'h4):(2'h3)] : {$unsigned(reg84[(2'h2):(1'h0)])}));
  assign wire110 = $signed((reg73 <<< (reg107[(4'hc):(2'h2)] >>> ($signed(wire104) & ((8'haa) <<< reg75)))));
  assign wire111 = (($signed(((reg75 ? reg92 : (8'h9c)) < (wire105 ?
                           (8'hbc) : reg94))) ?
                       reg71 : reg93) != reg79);
endmodule
