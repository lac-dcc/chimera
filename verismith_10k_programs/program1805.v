module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h263):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire221;
  wire signed [(5'h12):(1'h0)] wire220;
  wire [(3'h4):(1'h0)] wire219;
  wire [(4'hb):(1'h0)] wire218;
  wire signed [(5'h12):(1'h0)] wire204;
  wire [(3'h6):(1'h0)] wire190;
  wire [(5'h14):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire196;
  wire signed [(3'h5):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire198;
  wire signed [(4'hf):(1'h0)] wire199;
  wire [(3'h4):(1'h0)] wire200;
  wire signed [(4'h9):(1'h0)] wire201;
  wire signed [(3'h7):(1'h0)] wire202;
  wire [(2'h2):(1'h0)] wire206;
  reg [(5'h10):(1'h0)] reg217 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg215 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg214 = (1'h0);
  reg [(3'h5):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg211 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(5'h11):(1'h0)] reg209 = (1'h0);
  reg [(5'h15):(1'h0)] reg208 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  assign y = {wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire204,
                 wire190,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire5,
                 wire196,
                 wire197,
                 wire198,
                 wire199,
                 wire200,
                 wire201,
                 wire202,
                 wire206,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned($signed(($signed(wire1) ?
                     $unsigned(wire1) : ((8'hb4) <= (8'hb8))))));
  always
    @(posedge clk) begin
      reg6 <= $signed(wire3);
      if ($signed((wire2[(2'h2):(1'h1)] <= (~^(((8'hb4) ? wire0 : wire2) ?
          (+wire5) : (~(8'hb8)))))))
        begin
          reg7 <= $unsigned({(reg6 ? wire1 : $unsigned(wire3))});
        end
      else
        begin
          reg7 <= (wire4[(3'h5):(3'h4)] ?
              ((+(~|((8'ha5) ? wire3 : wire5))) ?
                  ({(~&reg6),
                      (reg6 && reg6)} << (~|$unsigned(reg7))) : {((wire3 ?
                              wire1 : wire1) ?
                          $unsigned(wire4) : wire5[(4'ha):(3'h6)]),
                      wire1}) : $signed(wire4));
          if (wire4[(1'h1):(1'h1)])
            begin
              reg8 <= $unsigned($unsigned(($signed($signed(wire0)) ^~ ((wire3 ?
                      wire3 : wire1) ?
                  $signed(wire1) : (wire4 > wire1)))));
              reg9 <= (+((7'h40) + $signed((wire1 ?
                  (wire3 ? wire5 : (8'ha8)) : (^~wire3)))));
            end
          else
            begin
              reg8 <= (~^reg6);
              reg9 <= {$unsigned(reg9),
                  $unsigned($unsigned($signed($unsigned(wire5))))};
              reg10 <= (reg7[(2'h2):(2'h2)] ?
                  ((~^wire0[(4'hc):(4'hb)]) ?
                      (wire5[(4'hb):(3'h6)] + $unsigned((reg9 <= wire3))) : wire3) : $signed({wire4[(2'h2):(1'h1)],
                      $unsigned((reg7 ? (8'hb0) : wire3))}));
            end
          if ((wire1 ?
              $signed({(8'ha4),
                  ((reg6 ^~ reg7) != (!wire0))}) : $unsigned({((wire1 ^ wire0) * {wire5,
                      wire2})})))
            begin
              reg11 <= reg6[(2'h2):(1'h0)];
            end
          else
            begin
              reg11 <= reg7[(2'h2):(1'h1)];
              reg12 <= wire3[(3'h4):(1'h0)];
            end
          reg13 <= reg6[(1'h0):(1'h0)];
        end
      if (reg10[(2'h3):(1'h1)])
        begin
          if ((~^wire1))
            begin
              reg14 <= wire1;
              reg15 <= $unsigned(($signed(wire5) && $unsigned((~(reg9 - wire3)))));
              reg16 <= $unsigned(($signed($unsigned(reg13[(2'h2):(2'h2)])) - reg7[(3'h4):(1'h1)]));
              reg17 <= $signed((^$signed(reg8)));
              reg18 <= (-(+($signed(reg16[(5'h10):(3'h4)]) ?
                  ((reg17 || reg17) ?
                      (!reg16) : $signed((8'haf))) : (^~((8'ha1) >>> reg13)))));
            end
          else
            begin
              reg14 <= $unsigned(reg10[(4'h9):(1'h0)]);
              reg15 <= ((|reg9[(1'h1):(1'h0)]) <= reg10[(3'h6):(3'h6)]);
            end
          reg19 <= {reg15[(1'h1):(1'h1)]};
          reg20 <= reg6[(1'h0):(1'h0)];
          reg21 <= wire1[(5'h11):(4'ha)];
          reg22 <= (wire0[(4'h9):(2'h3)] ?
              reg21[(3'h6):(2'h3)] : reg20[(1'h1):(1'h0)]);
        end
      else
        begin
          reg14 <= ($unsigned((wire3[(5'h14):(1'h0)] ?
                  ($unsigned(reg6) ?
                      ((8'h9c) ? reg20 : reg6) : (reg21 ?
                          reg16 : reg21)) : (wire3[(5'h15):(1'h1)] >> $unsigned(reg16)))) ?
              $unsigned({$unsigned($unsigned(reg15)),
                  {((8'ha7) >>> (8'hba)),
                      (reg20 <= reg20)}}) : (((!reg11) < reg19[(2'h3):(1'h0)]) ?
                  (wire0[(2'h2):(1'h1)] ?
                      ({wire3} ?
                          $signed(reg10) : reg8[(4'h9):(1'h0)]) : $signed(((8'hb7) ?
                          reg16 : reg9))) : (reg6 ?
                      $unsigned((+reg13)) : reg16)));
          reg15 <= (reg20 | (($signed(reg19) ?
                  $unsigned((|reg9)) : wire5[(4'hb):(2'h2)]) ?
              (((reg20 >= reg13) <<< (reg17 ? reg16 : wire0)) ?
                  (8'hbf) : wire5[(3'h6):(3'h5)]) : $signed((wire1[(4'hd):(2'h2)] >= reg16[(1'h1):(1'h0)]))));
          reg16 <= ((~^{$unsigned((reg12 ? reg6 : reg7))}) ?
              (reg10 ?
                  (!(~&(~^reg19))) : (&$unsigned((8'hb8)))) : reg18[(2'h2):(1'h0)]);
          reg17 <= $unsigned($unsigned($signed(reg13)));
        end
    end
  assign wire23 = $signed($unsigned((^~$signed(((8'hb8) >= wire0)))));
  assign wire24 = $unsigned(reg7[(3'h4):(2'h3)]);
  assign wire25 = $signed((($signed($signed(wire1)) && ((reg8 ?
                          reg12 : reg11) != $signed(reg9))) ?
                      {$unsigned((wire23 ?
                              reg17 : wire0))} : (+reg18[(2'h2):(2'h2)])));
  assign wire26 = wire5;
  module27 #() modinst191 (wire190, clk, wire24, reg9, reg12, wire4, wire5);
  always
    @(posedge clk) begin
      reg192 <= $unsigned(((8'hb5) ? (reg21[(4'hd):(4'hd)] >> reg19) : reg20));
      reg193 <= reg192[(2'h2):(2'h2)];
      reg194 <= reg18;
      reg195 <= reg14[(1'h1):(1'h1)];
    end
  assign wire196 = wire23[(4'h9):(3'h6)];
  assign wire197 = ($signed((8'hb0)) ?
                       reg7 : ((^wire26) ?
                           reg15[(2'h2):(1'h0)] : (~|$unsigned((wire1 ?
                               reg9 : wire26)))));
  assign wire198 = reg16;
  assign wire199 = {(reg20 | {{wire1}})};
  assign wire200 = ((wire197 >> $signed($unsigned($signed(wire23)))) ?
                       reg14[(2'h3):(2'h2)] : wire3);
  assign wire201 = ($unsigned((~wire196[(1'h0):(1'h0)])) ?
                       reg17[(3'h4):(2'h2)] : $signed((wire0 ?
                           ($unsigned(reg16) * reg16[(4'he):(3'h5)]) : $unsigned(reg18))));
  module116 #() modinst203 (wire202, clk, reg195, reg13, wire1, reg10);
  module116 #() modinst205 (.wire117(reg20), .wire120(reg9), .wire119(wire1), .clk(clk), .wire118(reg11), .y(wire204));
  module33 #() modinst207 (.y(wire206), .clk(clk), .wire36(wire24), .wire37(wire2), .wire35(wire198), .wire34(reg18));
  always
    @(posedge clk) begin
      reg208 <= $unsigned($unsigned(((reg21 ?
          (reg6 - wire196) : ((8'ha2) ? (8'hb4) : reg10)) || {(&wire190)})));
      if (wire204[(5'h10):(5'h10)])
        begin
          reg209 <= (wire24[(4'hb):(2'h2)] ~^ $unsigned($signed(wire202[(3'h5):(2'h2)])));
          reg210 <= $signed($signed(wire5[(4'h9):(4'h8)]));
        end
      else
        begin
          reg209 <= (($signed(((reg17 ? wire204 : reg20) ?
                  reg208 : (^~wire1))) ?
              reg8 : {wire202[(3'h5):(2'h3)]}) <<< ($signed(reg20[(3'h6):(2'h3)]) ?
              $unsigned(wire26) : $unsigned(reg193)));
        end
      reg211 <= $unsigned(($unsigned($unsigned((~^(8'h9c)))) ?
          $unsigned({(wire196 << wire3),
              (reg8 << reg209)}) : ($unsigned((reg15 * (7'h41))) || ((^~reg21) <<< (reg16 > wire190)))));
      if ({$signed((8'hb6)),
          ($unsigned(($signed(reg12) < $unsigned((8'hac)))) ?
              reg21[(3'h6):(2'h2)] : (^(|(reg209 >> (7'h43)))))})
        begin
          reg212 <= $unsigned(wire200[(2'h2):(1'h1)]);
        end
      else
        begin
          reg212 <= $signed(wire202);
          if ({$signed(($unsigned(wire197) ?
                  $signed((reg9 == wire26)) : $signed((wire197 + reg16)))),
              ($signed(((reg9 != reg209) >= wire26)) ?
                  reg7[(2'h2):(1'h1)] : $unsigned(wire5))})
            begin
              reg213 <= reg9;
              reg214 <= ($unsigned(reg193) >= (reg21 ?
                  {(~|{reg22}),
                      ((!reg8) | wire3[(5'h12):(3'h5)])} : reg12[(4'ha):(3'h4)]));
              reg215 <= $signed({reg210[(3'h5):(3'h4)]});
              reg216 <= (+$signed((|$signed($unsigned(wire206)))));
              reg217 <= (8'hb1);
            end
          else
            begin
              reg213 <= {reg10};
              reg214 <= $signed(({((^wire4) & reg22)} >>> (~reg15)));
              reg215 <= ((^({(reg208 ? reg210 : wire23)} ?
                  reg21[(5'h11):(5'h11)] : {reg210[(4'he):(3'h4)]})) ~^ reg17);
            end
        end
    end
  assign wire218 = $unsigned({(8'had)});
  assign wire219 = $signed({(8'ha4), (+$unsigned($signed((8'hbf))))});
  assign wire220 = wire3[(3'h4):(2'h2)];
  assign wire221 = $unsigned($signed(reg194));
endmodule

module module27  (y, clk, wire28, wire29, wire30, wire31, wire32);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire29;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire187;
  wire signed [(5'h13):(1'h0)] wire186;
  wire signed [(4'hb):(1'h0)] wire180;
  wire signed [(2'h2):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(3'h7):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire182;
  reg signed [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire180,
                 wire142,
                 wire136,
                 wire135,
                 wire133,
                 wire114,
                 wire89,
                 wire88,
                 wire87,
                 wire64,
                 wire66,
                 wire67,
                 wire68,
                 wire85,
                 wire182,
                 reg185,
                 reg184,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  module33 #() modinst65 (.clk(clk), .wire36(wire30), .wire35(wire28), .wire34(wire29), .wire37(wire32), .y(wire64));
  assign wire66 = (~|((wire30[(5'h13):(4'hb)] ^~ ($signed((8'ha2)) + wire31[(3'h5):(1'h0)])) && wire31[(3'h4):(1'h1)]));
  assign wire67 = (~(wire30 == wire31[(4'hf):(4'h8)]));
  assign wire68 = wire29;
  module69 #() modinst86 (.wire71(wire64), .wire73(wire67), .wire70(wire32), .wire74(wire28), .clk(clk), .wire72(wire29), .y(wire85));
  assign wire87 = ($unsigned($unsigned($unsigned(wire30))) | ((wire31[(4'ha):(3'h5)] || (|wire68)) ?
                      wire32[(3'h5):(1'h0)] : ($signed((~&wire30)) ~^ $signed($signed(wire31)))));
  assign wire88 = {$unsigned(wire85)};
  assign wire89 = wire87;
  module90 #() modinst115 (wire114, clk, wire31, wire29, wire85, wire28);
  module116 #() modinst134 (.wire120(wire64), .wire118(wire88), .wire117(wire28), .y(wire133), .wire119(wire32), .clk(clk));
  assign wire135 = ((wire85[(4'hd):(4'h9)] == wire29) >= wire67[(4'hc):(1'h1)]);
  assign wire136 = {$unsigned(wire68[(1'h1):(1'h1)]), wire89};
  always
    @(posedge clk) begin
      reg137 <= {({$unsigned($signed(wire87))} >> ({$signed(wire89)} ?
              $unsigned((^wire114)) : $signed((&wire31)))),
          (^wire88)};
      reg138 <= wire31;
      reg139 <= $signed(($signed(($unsigned(wire87) ?
          (8'hb5) : $unsigned(wire29))) >> $signed(wire28)));
      reg140 <= {$unsigned((+{(wire32 ~^ reg137)})), reg139[(3'h7):(2'h3)]};
      reg141 <= (reg138[(3'h6):(3'h4)] ?
          wire32 : {(&{$signed((8'ha9)), $unsigned(wire64)}), wire29});
    end
  assign wire142 = (!(~$unsigned({(wire89 ? (8'hb6) : (8'ha5)),
                       wire29[(3'h5):(2'h3)]})));
  module143 #() modinst181 (wire180, clk, reg140, wire135, reg141, wire68, wire28);
  module143 #() modinst183 (wire182, clk, wire133, wire32, wire67, wire31, wire28);
  always
    @(posedge clk) begin
      reg184 <= $unsigned($unsigned({(&reg138[(4'h9):(3'h4)]), reg137}));
      reg185 <= $signed(wire28[(5'h11):(5'h10)]);
    end
  assign wire186 = $signed((~^((~|(&reg184)) ^~ reg140[(2'h3):(2'h2)])));
  assign wire187 = ({((&(reg141 * wire32)) ? wire142 : wire88[(3'h5):(3'h5)]),
                           reg138[(4'ha):(3'h7)]} ?
                       (wire68[(5'h11):(4'h8)] >> $signed(reg138[(3'h5):(2'h2)])) : {wire67});
  assign wire188 = (~^$unsigned(($signed(wire85) ?
                       $unsigned(wire68) : wire186)));
  assign wire189 = $signed($unsigned(wire180[(1'h0):(1'h0)]));
endmodule

module module143
#(parameter param179 = ((({(^~(8'ha2))} ? {((8'h9f) * (8'hac))} : ((~|(8'hac)) + ((8'hb0) <<< (8'hb4)))) ^~ (^((!(7'h43)) ? ((8'hba) ? (8'ha7) : (8'hb8)) : ((7'h43) ? (8'hb1) : (8'hb3))))) <= {((|((8'ha2) <<< (8'ha2))) * (((8'ha6) >> (8'hb2)) <<< ((8'hb1) ? (8'hba) : (8'hac))))}))
(y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire148;
  input wire [(4'h9):(1'h0)] wire147;
  input wire signed [(2'h3):(1'h0)] wire146;
  input wire signed [(2'h2):(1'h0)] wire145;
  input wire [(5'h13):(1'h0)] wire144;
  wire signed [(5'h11):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire signed [(5'h12):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire149;
  reg [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg [(3'h7):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(5'h10):(1'h0)] reg150 = (1'h0);
  assign y = {wire178,
                 wire165,
                 wire164,
                 wire153,
                 wire152,
                 wire149,
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
                 reg151,
                 reg150,
                 (1'h0)};
  assign wire149 = $unsigned((+(((wire145 ? wire146 : wire144) ~^ wire144) ?
                       ((wire147 ? wire145 : wire148) ?
                           {wire144} : $signed((8'hb1))) : ((!(8'hb8)) ?
                           (wire147 ^ wire145) : (wire148 ?
                               wire146 : wire144)))));
  always
    @(posedge clk) begin
      reg150 <= wire144[(4'hb):(4'hb)];
      reg151 <= {{(+$unsigned({wire144, (8'hb7)})), wire147[(2'h3):(1'h1)]}};
    end
  assign wire152 = wire144;
  assign wire153 = ((wire149 ?
                           $signed({(reg151 ~^ (7'h42)),
                               {wire148}}) : ({((8'hb1) ? wire144 : wire144),
                                   $unsigned(reg150)} ?
                               (wire148[(2'h2):(1'h1)] > wire152) : $signed({(8'hbf)}))) ?
                       $unsigned($unsigned({(8'haf)})) : (^(&(~wire144[(3'h7):(3'h5)]))));
  always
    @(posedge clk) begin
      if (wire148[(3'h4):(2'h3)])
        begin
          reg154 <= $unsigned((({wire148, wire147} ?
              ((~wire146) <<< (wire146 ?
                  wire152 : wire152)) : wire145) ^ ((wire144[(4'h8):(3'h5)] <= (8'h9d)) >= ((wire153 ?
                  reg151 : wire147) ?
              (reg150 >>> reg150) : (^~wire145)))));
          if (reg151[(1'h1):(1'h0)])
            begin
              reg155 <= $signed(wire153);
              reg156 <= wire153;
              reg157 <= ((8'had) ?
                  {reg155[(4'h8):(2'h3)],
                      (^{reg151[(4'hd):(4'h8)],
                          {(8'ha0), (8'hbe)}})} : (wire147 ?
                      $signed({(~|wire146)}) : (^(~^(wire152 ?
                          wire149 : wire146)))));
            end
          else
            begin
              reg155 <= wire153[(3'h5):(1'h0)];
              reg156 <= ((^$unsigned(wire149)) ?
                  $signed((wire148[(3'h7):(3'h6)] ^ ((~|(8'h9f)) ?
                      reg150 : (&(8'hb2))))) : wire145);
              reg157 <= $signed($signed($unsigned($signed($unsigned(reg150)))));
              reg158 <= $signed((~^wire148[(1'h0):(1'h0)]));
              reg159 <= ((8'hb3) ?
                  {wire149[(3'h7):(2'h2)]} : $unsigned(((~reg157) ?
                      $unsigned({reg158,
                          reg158}) : ($signed(wire147) ^ wire149[(2'h2):(1'h0)]))));
            end
          reg160 <= reg157[(3'h6):(1'h1)];
        end
      else
        begin
          reg154 <= reg158;
          reg155 <= {$signed(reg156), reg156};
          if (reg151)
            begin
              reg156 <= {$unsigned(({(~|reg154)} && $signed($unsigned(reg155)))),
                  $signed((reg158[(1'h1):(1'h0)] > reg160[(4'hc):(1'h0)]))};
              reg157 <= $signed($signed((^(wire149 >= (8'hb9)))));
              reg158 <= $signed(reg151);
              reg159 <= reg156;
              reg160 <= reg154;
            end
          else
            begin
              reg156 <= $signed(wire147);
              reg157 <= $signed((~|(((reg159 * (8'ha1)) ~^ wire144[(4'hf):(4'h8)]) ?
                  (-$signed(reg157)) : wire146[(1'h0):(1'h0)])));
              reg158 <= reg150;
              reg159 <= $signed({$signed(wire144[(5'h13):(2'h3)])});
              reg160 <= $signed(($signed($unsigned(wire149[(2'h3):(2'h3)])) ?
                  (($unsigned(wire146) ?
                          wire145[(1'h0):(1'h0)] : $unsigned(wire147)) ?
                      $signed(wire153[(4'hb):(4'ha)]) : wire145) : (!((wire147 >> wire144) ?
                      (reg156 ? (8'haa) : reg156) : {wire147, (8'hb3)}))));
            end
          reg161 <= $signed(($unsigned($signed($signed(reg158))) ?
              wire149 : wire147[(3'h5):(1'h0)]));
          reg162 <= $unsigned(reg154);
        end
      reg163 <= {wire144[(5'h12):(1'h0)]};
    end
  assign wire164 = $unsigned($unsigned(($signed(wire146) ?
                       reg151[(3'h5):(3'h5)] : reg157)));
  assign wire165 = reg163[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      if (($unsigned((reg158 << (reg150 ^~ (~&reg161)))) ?
          ($signed(($signed((7'h41)) < (!wire147))) <<< $unsigned($unsigned({reg158,
              wire153}))) : $signed(reg158[(1'h1):(1'h0)])))
        begin
          reg166 <= $signed(reg157[(4'h9):(1'h1)]);
          reg167 <= (!((^~{{reg163, reg163}, (reg158 ~^ reg160)}) ?
              wire153 : wire144[(4'hf):(4'he)]));
        end
      else
        begin
          reg166 <= (+reg158[(1'h0):(1'h0)]);
          reg167 <= {(wire145 ?
                  ($signed(reg156) ^~ $unsigned(reg155)) : (~^(8'hbf)))};
        end
      reg168 <= (|wire165[(3'h5):(3'h4)]);
      reg169 <= (wire164 | wire152);
      if ($signed(($signed($unsigned(wire147)) ?
          (8'ha2) : (wire146[(2'h2):(2'h2)] ?
              (wire164[(3'h4):(2'h2)] >>> $unsigned(reg158)) : (+(wire148 < reg167))))))
        begin
          reg170 <= $signed((reg163 >= ($unsigned({reg150, reg156}) & reg166)));
        end
      else
        begin
          reg170 <= ($unsigned($unsigned((reg156[(1'h0):(1'h0)] ?
                  (-reg163) : (reg159 ? wire145 : reg156)))) ?
              {($signed((reg159 ?
                      reg160 : reg151)) <= $signed(reg168[(4'he):(2'h2)])),
                  {$unsigned(wire146)}} : (reg156[(1'h0):(1'h0)] == (8'hb1)));
          reg171 <= (-{(8'hac)});
        end
      reg172 <= ($signed(reg168) ?
          $signed((reg156[(1'h0):(1'h0)] && wire164)) : reg155[(3'h6):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg173 <= ((reg159[(1'h0):(1'h0)] ?
          {(+(reg171 * wire153)),
              wire153[(4'ha):(4'h9)]} : (!wire153)) * reg166[(4'h9):(3'h5)]);
      reg174 <= (reg151[(3'h5):(2'h3)] ?
          (({(reg151 ? (8'hb9) : (8'ha4)), reg163[(4'hc):(4'h9)]} ?
              ((|reg172) + (~^(7'h42))) : ((wire147 | reg158) | {wire145})) ^~ (~|{reg172,
              (!reg169)})) : wire152[(2'h2):(1'h0)]);
      reg175 <= ({($unsigned((~(8'ha7))) ?
              ((wire152 * wire148) ?
                  reg158[(2'h3):(1'h1)] : reg173[(4'h8):(2'h2)]) : $signed(wire146)),
          ({{wire164}} ?
              reg168[(4'hd):(4'hd)] : $unsigned($unsigned(reg154)))} ~^ reg162);
      reg176 <= wire153;
      reg177 <= ((+{((wire144 <<< reg157) ? reg168[(3'h7):(1'h0)] : reg163)}) ?
          $signed((((reg160 | wire144) ?
                  reg168[(4'ha):(3'h7)] : (reg150 ? (8'hb5) : reg157)) ?
              (!(reg163 ?
                  reg166 : reg159)) : $unsigned($signed(wire144)))) : (8'ha5));
    end
  assign wire178 = $unsigned($signed(reg166));
endmodule

module module116
#(parameter param131 = {((&{(^~(8'hac)), (~|(8'haf))}) || ((((8'hab) ? (8'hbd) : (8'hb1)) * (|(8'hab))) & (((8'hb6) ? (8'ha9) : (8'hb6)) ^ {(8'hb1)})))}, 
parameter param132 = (((|(~param131)) ^~ ((param131 ? (~^param131) : ((8'hba) ~^ param131)) ? ((^~param131) >> (^~param131)) : (~|param131))) - (-((~|(!(8'hbe))) ? (((8'haf) > param131) + {param131}) : ({param131} == (param131 ? param131 : param131))))))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire120;
  input wire signed [(4'hb):(1'h0)] wire119;
  input wire [(4'hd):(1'h0)] wire118;
  input wire signed [(4'he):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'he):(1'h0)] wire121;
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire121,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire121 = $unsigned(wire119[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg122 <= (~|wire119);
      reg123 <= wire118;
      reg124 <= ($unsigned((-wire119)) << ($signed((+{wire119, wire120})) ?
          {((wire121 ~^ wire121) ?
                  (wire120 ? wire118 : reg122) : reg123[(3'h7):(3'h6)]),
              {(~wire120), $unsigned(reg122)}} : {(8'haf),
              $unsigned((wire118 != wire118))}));
      reg125 <= ($unsigned($unsigned((~&reg124))) ^~ ($unsigned(({wire118} > {reg123,
          wire120})) <= (^~(^(^reg124)))));
    end
  assign wire126 = {((~^wire119) ?
                           (reg125[(4'hc):(3'h6)] + (~&(!reg124))) : (8'hb3))};
  assign wire127 = wire119[(3'h4):(2'h3)];
  assign wire128 = (^(~^$unsigned((-(wire121 ? wire121 : reg124)))));
  assign wire129 = wire127[(4'h8):(3'h6)];
  assign wire130 = {wire126[(5'h10):(2'h2)]};
endmodule

module module90
#(parameter param113 = ((8'hba) ? (-(^~(8'haa))) : (~&((((8'hb6) ? (8'ha8) : (8'hb5)) >= (-(8'hba))) ? (|{(7'h40)}) : {((8'had) && (8'hb8))}))))
(y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire94;
  input wire [(4'h9):(1'h0)] wire93;
  input wire [(4'ha):(1'h0)] wire92;
  input wire [(4'ha):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire [(4'hd):(1'h0)] wire95;
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire95 = $unsigned($unsigned($signed(((^~wire94) << wire93))));
  assign wire96 = wire91;
  assign wire97 = {(~&(((~&wire96) ?
                              (wire92 || wire92) : wire93[(3'h7):(3'h4)]) ?
                          (|(wire91 ? wire93 : wire96)) : ({wire93, (7'h40)} ?
                              $signed((8'hb0)) : $unsigned((8'ha8)))))};
  assign wire98 = wire93;
  assign wire99 = $signed($unsigned(($signed($signed(wire97)) ?
                      (+(wire98 ? wire93 : wire93)) : wire96[(5'h11):(3'h5)])));
  assign wire100 = (~|wire92);
  assign wire101 = wire92;
  assign wire102 = ((({wire91} << wire92) >= wire94[(2'h2):(1'h1)]) == wire99[(1'h0):(1'h0)]);
  assign wire103 = (8'hae);
  assign wire104 = ($signed($unsigned((8'ha1))) ?
                       $unsigned($signed(($signed(wire102) && $signed(wire94)))) : $unsigned(wire96[(3'h6):(3'h4)]));
  always
    @(posedge clk) begin
      reg105 <= (8'hb3);
      reg106 <= $unsigned(({($unsigned(wire93) ?
              reg105[(1'h1):(1'h1)] : $signed(wire92)),
          wire91[(2'h3):(2'h3)]} | wire93[(3'h6):(2'h3)]));
      reg107 <= $signed($signed(reg105));
    end
  assign wire108 = (wire102 >= wire97[(4'h8):(3'h4)]);
  assign wire109 = (~&(7'h44));
  assign wire110 = (^~wire104[(4'hb):(2'h2)]);
  assign wire111 = ({wire110,
                       wire100[(2'h2):(1'h1)]} * $unsigned($unsigned((wire92[(3'h7):(3'h5)] ?
                       (wire92 ? reg105 : reg107) : $signed(wire108)))));
  assign wire112 = (~^wire95);
endmodule

module module69  (y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire74;
  input wire [(4'ha):(1'h0)] wire73;
  input wire signed [(4'hf):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire81;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 (1'h0)};
  assign wire75 = $unsigned($unsigned($signed(wire73)));
  assign wire76 = $unsigned(((((wire71 > wire74) ?
                          {wire74, (8'haa)} : $signed(wire72)) ?
                      wire71[(2'h2):(1'h0)] : wire71) ^~ $signed((&$signed(wire73)))));
  assign wire77 = $unsigned(wire75);
  assign wire78 = (^wire77[(4'ha):(4'ha)]);
  assign wire79 = ($signed(wire72) ?
                      $unsigned({((wire70 <<< wire73) ?
                              wire72[(3'h7):(3'h6)] : (8'haf))}) : wire71[(3'h7):(1'h1)]);
  assign wire80 = wire70;
  assign wire81 = $signed(wire77);
  assign wire82 = (wire71 ?
                      {($unsigned((!(8'ha0))) < ((!wire76) <= (^~(8'hbf)))),
                          ($unsigned($signed(wire77)) ^~ {wire75[(5'h12):(4'hb)]})} : $unsigned($unsigned($unsigned((wire78 ?
                          wire74 : wire74)))));
  assign wire83 = (((wire72 ?
                          wire71[(2'h2):(1'h1)] : $unsigned((wire73 >= wire74))) ?
                      $signed($signed($signed(wire72))) : (-((wire81 - wire74) ?
                          wire79[(1'h1):(1'h1)] : (-wire73)))) & $signed((wire75 ?
                      {wire78[(5'h14):(3'h6)],
                          ((8'hb9) ? wire70 : wire73)} : {wire79,
                          $signed(wire82)})));
  assign wire84 = {wire74[(2'h2):(2'h2)]};
endmodule

module module33
#(parameter param63 = ({((((8'hb4) || (8'h9d)) - ((7'h40) <<< (8'h9d))) ? ({(8'haa), (8'hb4)} << ((8'ha4) ? (8'ha4) : (8'ha3))) : (-(~&(7'h43))))} ? ((|(((8'hbb) ? (8'hbc) : (8'hae)) ~^ (8'hbc))) - ((((8'ha3) ? (8'ha9) : (8'ha3)) ? ((8'h9e) ? (8'h9c) : (8'ha6)) : {(8'hba)}) ? (~^((8'hbd) && (8'ha2))) : ((-(8'ha4)) == ((8'hb4) ? (8'hbb) : (8'h9e))))) : ((^~(^~((8'ha6) ? (8'hb9) : (8'haa)))) ? ((~^(|(8'hba))) >= ((~|(8'hb1)) ? {(7'h44), (7'h44)} : {(8'hb2), (8'hbe)})) : {((8'h9e) || ((8'hab) != (8'hb1))), ((+(8'hb9)) | ((8'hb5) ? (8'hbd) : (8'ha9)))})))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire [(4'hf):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire53,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
                 (1'h0)};
  assign wire38 = (({($unsigned(wire35) | {wire34})} >= (($signed(wire36) ?
                          (wire34 ? wire36 : wire37) : $unsigned(wire37)) ?
                      (wire36[(4'h9):(4'h8)] != (|wire36)) : ((wire37 ?
                              wire35 : wire35) ?
                          $signed(wire36) : $unsigned(wire37)))) & (-(-$unsigned($unsigned((8'hb1))))));
  assign wire39 = (((($signed(wire34) ? (~|wire37) : wire36[(4'hc):(3'h5)]) ?
                          wire35[(4'ha):(1'h1)] : (~^(wire37 ?
                              wire37 : wire36))) >> (8'hb3)) ?
                      (wire34[(1'h1):(1'h0)] == {$signed(((7'h42) || wire35)),
                          $unsigned((8'haa))}) : $signed(($unsigned(wire35[(1'h1):(1'h0)]) > (wire35 - wire35))));
  assign wire40 = wire35[(4'h8):(2'h2)];
  assign wire41 = $signed($unsigned(((wire34[(1'h0):(1'h0)] || $unsigned((8'h9f))) | wire34[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg42 <= wire35;
      reg43 <= {($signed((8'ha2)) != wire39[(2'h2):(2'h2)])};
      reg44 <= ((&$signed(($unsigned(wire41) ?
              (reg42 ? wire37 : wire38) : (reg43 && wire36)))) ?
          (wire36[(2'h3):(2'h3)] ?
              $signed(wire35[(3'h5):(2'h2)]) : $signed(reg42)) : ((+{$unsigned(wire38)}) ?
              ($unsigned((wire40 > reg42)) < ((7'h43) >>> (|wire35))) : (~|($unsigned(wire41) ?
                  $signed(reg43) : $signed(wire35)))));
      reg45 <= wire35[(4'h9):(3'h5)];
      if (((wire34 ?
          (~^{{wire41},
              (~&reg43)}) : $unsigned($unsigned(wire35))) - ({reg43[(2'h3):(2'h3)],
              reg42} ?
          reg45 : wire40)))
        begin
          reg46 <= (~wire40);
          if ((wire35[(3'h4):(1'h1)] ^~ {reg45[(1'h1):(1'h0)]}))
            begin
              reg47 <= (~|(((&wire35) ?
                  ($signed(wire41) ?
                      $unsigned(wire34) : wire39[(2'h2):(2'h2)]) : ((wire40 >>> reg43) ?
                      $unsigned(reg44) : $unsigned(reg43))) * reg44[(5'h12):(3'h6)]));
            end
          else
            begin
              reg47 <= (wire40 ?
                  $unsigned(wire36[(3'h6):(2'h2)]) : $signed((!(8'hb0))));
              reg48 <= ($signed((!$signed($unsigned(wire39)))) & $unsigned((~^$unsigned($unsigned(wire39)))));
              reg49 <= $signed((~|reg45[(2'h3):(2'h2)]));
              reg50 <= ($signed(((~^(wire35 != reg48)) ?
                  (|(^wire36)) : (~|(reg44 ?
                      reg42 : wire38)))) || (wire36[(4'hf):(4'hd)] > reg45));
            end
          reg51 <= $unsigned(({(reg47[(3'h5):(1'h0)] & reg45)} >>> ((+$unsigned(wire36)) ?
              {{wire36, wire35}, reg49[(1'h0):(1'h0)]} : (8'h9d))));
          reg52 <= {$unsigned((($unsigned((8'hac)) ?
                      (wire35 ~^ reg44) : {wire40, (8'ha8)}) ?
                  {((8'ha9) ? reg44 : wire36),
                      $signed(reg44)} : $signed((~|wire40))))};
        end
      else
        begin
          reg46 <= $unsigned(wire37);
          if ($unsigned((&($unsigned(reg51[(3'h6):(1'h0)]) >>> wire40))))
            begin
              reg47 <= (~|{wire36[(4'hb):(1'h1)]});
              reg48 <= {(|wire36[(4'ha):(4'h9)])};
              reg49 <= wire40[(3'h7):(3'h6)];
              reg50 <= ($signed(($unsigned((-reg52)) | ($signed(reg49) ?
                      ((8'h9f) ? reg51 : reg43) : wire41))) ?
                  ((&reg44[(4'h9):(4'h9)]) && (~&$unsigned({reg48}))) : $signed({reg46}));
            end
          else
            begin
              reg47 <= $unsigned(reg43);
              reg48 <= $signed($unsigned((+reg42)));
              reg49 <= ((^~$signed(((8'h9c) ?
                  {wire40,
                      reg48} : $unsigned(wire36)))) <<< wire36[(1'h1):(1'h1)]);
            end
        end
    end
  assign wire53 = ((|((&wire39[(2'h2):(1'h1)]) ?
                          {reg47[(4'h9):(4'h9)],
                              {reg42, wire34}} : (^~reg45[(2'h2):(1'h0)]))) ?
                      reg42[(1'h1):(1'h1)] : (wire40[(4'h9):(1'h1)] ~^ wire40[(4'h9):(1'h0)]));
  always
    @(posedge clk) begin
      reg54 <= $unsigned(({$signed((wire35 ? (8'had) : wire34)),
          $signed((wire35 <= wire38))} ~^ $unsigned(reg50[(3'h4):(2'h2)])));
      reg55 <= $signed(((~&$unsigned((reg43 ? reg49 : reg48))) && reg44));
      reg56 <= $unsigned(wire37[(3'h4):(1'h1)]);
      reg57 <= $unsigned($unsigned((+(-reg52))));
    end
  always
    @(posedge clk) begin
      reg58 <= {$unsigned($unsigned((reg45 ?
              wire53 : (reg48 ? wire39 : reg51))))};
      reg59 <= wire53[(4'h9):(4'h8)];
      if (wire39)
        begin
          reg60 <= wire41[(5'h10):(2'h3)];
          reg61 <= {reg46, (~&reg60)};
          reg62 <= (|$unsigned({(+{reg55}), reg48}));
        end
      else
        begin
          reg60 <= {(($unsigned((reg48 + wire37)) ?
                      $signed(wire38) : (+(reg42 ? reg54 : reg43))) ?
                  (reg62[(2'h2):(2'h2)] ?
                      (wire41 ^~ ((8'ha5) == wire34)) : reg60[(1'h0):(1'h0)]) : $signed($unsigned(reg47[(4'hc):(3'h6)]))),
              $signed((($signed(wire38) ^ reg58) != (-(wire35 ?
                  reg57 : reg49))))};
        end
    end
endmodule
