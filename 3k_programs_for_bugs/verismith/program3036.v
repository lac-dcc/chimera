module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire216;
  wire [(3'h7):(1'h0)] wire212;
  wire [(4'ha):(1'h0)] wire211;
  wire signed [(4'h8):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire209;
  wire [(4'h8):(1'h0)] wire208;
  wire [(3'h5):(1'h0)] wire206;
  wire signed [(3'h4):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire197;
  wire signed [(5'h10):(1'h0)] wire199;
  wire [(5'h13):(1'h0)] wire200;
  wire [(4'ha):(1'h0)] wire201;
  wire signed [(4'ha):(1'h0)] wire202;
  wire signed [(4'hc):(1'h0)] wire204;
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg [(5'h14):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  assign y = {wire216,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire206,
                 wire145,
                 wire70,
                 wire69,
                 wire4,
                 wire32,
                 wire33,
                 wire67,
                 wire197,
                 wire199,
                 wire200,
                 wire201,
                 wire202,
                 wire204,
                 reg215,
                 reg214,
                 reg213,
                 reg5,
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
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire4 = $unsigned({$unsigned((wire0[(2'h2):(1'h0)] * (wire1 ?
                         wire1 : wire2))),
                     ({(wire3 | wire3)} || (~|wire2))});
  always
    @(posedge clk) begin
      if (wire4)
        begin
          if ($signed((wire1 ?
              $unsigned(wire1[(2'h3):(2'h3)]) : (($signed(wire2) * wire3[(4'hd):(1'h1)]) || $signed($unsigned(wire3))))))
            begin
              reg5 <= {{$signed((-wire3[(5'h12):(2'h3)]))}};
              reg6 <= $signed((reg5 ?
                  wire4 : (($signed((8'hb7)) >> wire2) == wire0)));
              reg7 <= ((^(^~(~(wire1 ? wire1 : wire1)))) >> {wire1});
              reg8 <= reg5[(3'h5):(2'h2)];
            end
          else
            begin
              reg5 <= reg5;
              reg6 <= $signed(((((&wire3) ?
                      $signed(reg5) : $unsigned((8'ha0))) ?
                  (reg7[(1'h0):(1'h0)] >= wire0[(3'h5):(1'h0)]) : ((wire4 && (8'h9f)) ?
                      $unsigned(wire4) : ((8'haf) <= wire3))) == reg6));
              reg7 <= {($signed($unsigned(wire4)) <= reg8[(2'h3):(2'h3)])};
            end
          if (({$unsigned(wire2)} >> wire4))
            begin
              reg9 <= (wire0[(4'h8):(4'h8)] ? reg5 : wire2[(2'h3):(2'h3)]);
              reg10 <= $signed((8'hbe));
              reg11 <= $signed((|(((^wire3) && $signed(wire1)) > $unsigned(wire3[(4'ha):(4'h8)]))));
            end
          else
            begin
              reg9 <= ((8'ha9) ?
                  reg5[(3'h5):(1'h1)] : {$signed(reg7),
                      {(~^$unsigned(reg10)), {(~^reg11), reg7}}});
              reg10 <= ($signed(((+reg8) ?
                  (!(|reg8)) : (((8'hb9) & wire4) | (|reg7)))) << $signed((~&(^reg8[(3'h6):(3'h6)]))));
              reg11 <= $unsigned(reg9);
            end
        end
      else
        begin
          reg5 <= wire0;
          reg6 <= reg10[(1'h0):(1'h0)];
          reg7 <= $signed(((+$signed((^reg6))) ^~ (((wire0 - reg5) ^~ ((8'hab) > (7'h44))) ?
              (((8'hb9) ?
                  wire4 : reg6) << ((8'ha2) != wire0)) : ((~|reg6) != $signed(wire4)))));
          reg8 <= wire2;
          reg9 <= $unsigned((^($unsigned($unsigned(reg8)) ?
              ((-(8'h9d)) ?
                  ((7'h41) ?
                      (8'hb2) : wire4) : reg10[(2'h2):(2'h2)]) : (^(wire2 & reg7)))));
        end
      reg12 <= (reg9 ?
          ($signed({$signed(wire1)}) || wire1[(3'h5):(2'h2)]) : $signed(((reg11 ?
                  {(8'hb0)} : wire1[(1'h1):(1'h1)]) ?
              (^$signed((8'hbc))) : $signed((wire1 >> wire4)))));
      reg13 <= (~&$signed({$unsigned($signed(wire2))}));
      reg14 <= {$signed($signed((~^$unsigned(reg6))))};
      if ((~({{reg12, {reg6, (8'hb5)}}} < $unsigned((-wire1[(2'h2):(2'h2)])))))
        begin
          reg15 <= (reg5[(3'h4):(2'h2)] ^ $signed(reg11));
          reg16 <= reg15[(1'h0):(1'h0)];
          reg17 <= {(~&($unsigned(reg10[(1'h1):(1'h0)]) ?
                  $signed($unsigned(reg15)) : (7'h44)))};
          reg18 <= (reg13[(4'hd):(4'hd)] != $unsigned($unsigned($unsigned($unsigned(reg17)))));
        end
      else
        begin
          if ((+(&reg17)))
            begin
              reg15 <= reg8[(4'h8):(4'h8)];
              reg16 <= $signed((wire1 ?
                  wire2[(3'h7):(3'h5)] : $signed((reg10 ^~ $signed(reg5)))));
              reg17 <= (({$unsigned($unsigned(reg16)),
                      reg7} - (+$signed((reg18 ? reg13 : reg15)))) ?
                  (&$signed($unsigned($signed(reg7)))) : $signed($unsigned($signed((^~reg18)))));
              reg18 <= reg12[(4'h9):(2'h2)];
              reg19 <= (!($unsigned((8'h9f)) << $unsigned(reg16)));
            end
          else
            begin
              reg15 <= ((((wire3 ? reg12 : $unsigned(reg12)) ?
                          reg7 : {(~^reg8)}) ?
                      (^(~wire2)) : (&(&$unsigned(reg13)))) ?
                  $signed($signed((!$unsigned((7'h44))))) : ({((&reg10) ?
                          $unsigned(wire1) : {wire3}),
                      reg8} - (($unsigned(reg12) || (wire3 || reg11)) ?
                      (-(reg8 < reg8)) : (-(~|(8'ha7))))));
              reg16 <= ($unsigned($signed((^(reg11 ?
                  reg10 : reg7)))) == $unsigned((~^wire4[(1'h1):(1'h1)])));
              reg17 <= $signed($signed($signed(reg18)));
            end
          if ($signed((^~($signed($signed(reg16)) != wire0))))
            begin
              reg20 <= (reg14[(2'h2):(2'h2)] ?
                  (~&$signed(wire3[(4'ha):(2'h2)])) : $unsigned((-(~|$signed(wire1)))));
              reg21 <= reg19;
              reg22 <= (!((reg7[(4'h8):(3'h6)] ?
                      {{wire4, (8'hb2)}} : reg7[(3'h6):(1'h0)]) ?
                  (&$signed((reg13 == reg7))) : (8'ha1)));
              reg23 <= (wire0 * reg10);
              reg24 <= wire2[(4'ha):(4'h9)];
            end
          else
            begin
              reg20 <= {$signed(($signed(reg20[(3'h4):(2'h3)]) <= {$unsigned((8'h9c)),
                      (reg5 ? reg20 : wire1)})),
                  ((reg13 <= $signed((+reg17))) ?
                      $unsigned($signed($signed(wire0))) : ((+reg5[(3'h4):(2'h3)]) ?
                          $signed(wire4) : $signed($signed(reg13))))};
              reg21 <= $signed(((((^~reg15) >>> $unsigned(reg7)) * (~^$signed(reg17))) ?
                  {wire0[(2'h3):(2'h3)]} : reg11[(2'h2):(2'h2)]));
              reg22 <= ($signed(($unsigned($unsigned(reg8)) ?
                      (reg13[(2'h3):(2'h2)] ?
                          (wire3 ^ reg11) : (+reg10)) : $signed((reg22 ?
                          reg13 : wire3)))) ?
                  reg11[(1'h1):(1'h1)] : (reg14[(3'h6):(2'h2)] ?
                      (reg11 && ((reg7 ? (8'hbb) : reg24) ?
                          (reg13 ? (8'hb0) : reg14) : (reg14 ?
                              reg7 : reg20))) : reg20[(1'h1):(1'h1)]));
              reg23 <= $signed(reg24[(3'h4):(1'h1)]);
              reg24 <= (8'hab);
            end
          if (reg22[(4'hb):(2'h3)])
            begin
              reg25 <= ((-$signed($signed(((8'hb8) ~^ wire4)))) * $signed($signed(($signed(reg14) ?
                  ((8'haf) ? reg11 : reg8) : wire0[(3'h4):(1'h0)]))));
              reg26 <= {reg15, reg7[(5'h10):(3'h6)]};
              reg27 <= $unsigned((wire0 ?
                  {($unsigned(reg24) ^~ (reg15 != reg7))} : ((reg22[(1'h0):(1'h0)] < $unsigned((8'haa))) ?
                      $signed((reg25 ? reg6 : reg11)) : wire2)));
            end
          else
            begin
              reg25 <= (reg21 >>> $signed((^reg22)));
              reg26 <= {(!$unsigned(reg6))};
              reg27 <= ($signed(($signed((8'haf)) ^~ ($signed(reg22) > $unsigned(reg11)))) > $unsigned(reg26));
            end
          reg28 <= wire0;
          if (reg11[(2'h3):(1'h1)])
            begin
              reg29 <= reg9;
            end
          else
            begin
              reg29 <= $unsigned(({$unsigned($unsigned((7'h44))),
                  {reg28, reg25}} - reg15[(1'h0):(1'h0)]));
              reg30 <= ((((~|(+reg11)) ?
                          $signed(reg27) : ((&(8'ha1)) ?
                              reg16[(4'ha):(4'h9)] : (-reg10))) ?
                      reg6[(4'he):(4'hc)] : wire2[(3'h5):(2'h2)]) ?
                  {$signed((reg21 | (reg19 < reg18))),
                      reg20[(4'hb):(1'h1)]} : (!$signed($unsigned($signed(reg26)))));
              reg31 <= reg30[(5'h12):(5'h10)];
            end
        end
    end
  assign wire32 = reg10;
  assign wire33 = $signed($unsigned($unsigned((!$unsigned(reg12)))));
  module34 #() modinst68 (wire67, clk, wire2, reg21, reg13, reg10, reg11);
  assign wire69 = ($signed(($signed(reg17) ?
                          $unsigned(wire4[(2'h3):(1'h1)]) : reg13)) ?
                      (+(((reg22 << wire33) + {reg15}) ^~ (7'h43))) : ($signed($signed((reg17 ?
                              reg10 : reg27))) ?
                          (&wire33) : (($signed(reg10) ?
                              (reg27 ?
                                  (8'haf) : reg29) : $unsigned(wire32)) == $unsigned(reg28))));
  assign wire70 = $signed(((^~reg12) >>> $unsigned((~$unsigned(wire2)))));
  module71 #() modinst146 (wire145, clk, reg14, reg18, reg26, wire67);
  module147 #() modinst198 (.clk(clk), .wire151(reg13), .wire148(reg5), .wire149(reg12), .wire150(reg23), .y(wire197));
  assign wire199 = reg6;
  assign wire200 = wire32;
  assign wire201 = {wire2, (!wire197[(1'h0):(1'h0)])};
  module76 #() modinst203 (wire202, clk, reg23, reg13, wire1, wire69);
  module76 #() modinst205 (.wire78(reg5), .clk(clk), .wire79(reg13), .y(wire204), .wire80(wire3), .wire77(reg29));
  module34 #() modinst207 (.wire37(reg8), .wire38(wire70), .wire36(reg11), .clk(clk), .wire39(reg22), .y(wire206), .wire35(wire67));
  assign wire208 = (|(|(~|(~|(reg8 & reg21)))));
  assign wire209 = ($signed(wire206) > reg6);
  assign wire210 = $signed({(^{(wire208 ? wire32 : wire4)})});
  assign wire211 = $unsigned((8'ha8));
  assign wire212 = wire201;
  always
    @(posedge clk) begin
      reg213 <= reg28;
      reg214 <= {(wire69 ?
              $unsigned((wire3[(4'hf):(2'h3)] ?
                  {wire212,
                      (8'ha3)} : $signed(wire3))) : ($signed($unsigned(wire210)) ?
                  $signed($signed(reg6)) : ((reg11 ?
                      wire32 : wire209) << ((8'hb8) <= (8'hb0))))),
          $unsigned((8'hac))};
      reg215 <= {{reg26[(3'h7):(3'h4)], $signed(((~|wire4) ^ (8'h9f)))},
          wire208};
    end
  assign wire216 = (wire4[(2'h2):(1'h0)] ?
                       $unsigned(reg24) : reg9[(4'he):(3'h6)]);
endmodule

module module147  (y, clk, wire151, wire150, wire149, wire148);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire151;
  input wire [(5'h14):(1'h0)] wire150;
  input wire signed [(5'h11):(1'h0)] wire149;
  input wire signed [(2'h2):(1'h0)] wire148;
  wire [(4'he):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(5'h12):(1'h0)] wire187;
  wire signed [(4'h8):(1'h0)] wire186;
  wire signed [(5'h14):(1'h0)] wire185;
  wire signed [(2'h3):(1'h0)] wire184;
  wire [(4'h9):(1'h0)] wire183;
  wire signed [(4'hb):(1'h0)] wire182;
  wire signed [(3'h4):(1'h0)] wire181;
  wire [(4'hc):(1'h0)] wire180;
  wire signed [(5'h10):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire177;
  wire signed [(4'h8):(1'h0)] wire159;
  wire [(5'h11):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire157;
  wire [(5'h14):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire [(4'hb):(1'h0)] wire154;
  wire [(4'hd):(1'h0)] wire152;
  reg [(5'h11):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg193 = (1'h0);
  reg [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  assign y = {wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire177,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg153,
                 (1'h0)};
  assign wire152 = ((!{wire148[(2'h2):(2'h2)]}) << ($unsigned((~&wire148)) && $unsigned((&wire149[(4'hf):(2'h3)]))));
  always
    @(posedge clk) begin
      reg153 <= $unsigned((~&{{wire151[(4'hc):(4'h8)]}}));
    end
  assign wire154 = $signed($signed($signed($unsigned((wire150 >> wire149)))));
  assign wire155 = (+((!($signed(wire154) ?
                           ((8'ha0) ? (8'h9c) : wire151) : (!wire149))) ?
                       (&$unsigned($signed(wire151))) : ($signed((wire152 ?
                           wire151 : wire148)) <= wire150[(4'hd):(3'h6)])));
  assign wire156 = wire148[(1'h1):(1'h0)];
  assign wire157 = wire154;
  assign wire158 = (|wire150);
  assign wire159 = $unsigned({$signed(wire156[(4'ha):(4'ha)]), wire151});
  module160 #() modinst178 (wire177, clk, wire158, reg153, wire150, wire151, wire149);
  assign wire179 = (~|$unsigned($signed($signed($unsigned(wire159)))));
  assign wire180 = (~&(~^{($unsigned(wire149) ?
                           {wire154, wire158} : $signed(wire149))}));
  assign wire181 = $unsigned(wire155[(1'h1):(1'h1)]);
  assign wire182 = $unsigned(($signed((8'ha6)) ?
                       wire149 : (wire158[(4'hf):(4'hf)] ?
                           ((wire154 ? (8'hbb) : wire152) ?
                               wire149[(4'hb):(2'h3)] : $signed(wire148)) : $unsigned((wire177 * reg153)))));
  assign wire183 = (^~wire182);
  assign wire184 = (((($signed(wire154) >>> $unsigned(wire158)) ?
                               $signed((^~reg153)) : $unsigned(wire182[(2'h3):(2'h3)])) ?
                           $signed(wire179[(4'h8):(3'h5)]) : (($signed(wire151) ?
                                   $signed(wire151) : (wire181 ?
                                       wire182 : wire177)) ?
                               (^wire154) : ((~&(8'hae)) != (~(8'hac))))) ?
                       wire159 : (^wire182[(4'h9):(4'h9)]));
  assign wire185 = wire181;
  assign wire186 = (^$unsigned(((8'hbd) ?
                       ({wire159} - wire182[(4'hb):(3'h6)]) : {(~^wire184),
                           $signed(wire180)})));
  assign wire187 = wire186[(3'h5):(3'h5)];
  assign wire188 = (~|($unsigned(wire181) ?
                       (reg153[(2'h2):(1'h1)] ?
                           $signed(wire154) : (~|$signed(wire150))) : ($signed((wire181 ?
                               wire151 : wire158)) ?
                           ($signed(wire152) || (+wire183)) : $unsigned((^wire149)))));
  assign wire189 = $unsigned(($signed($signed({wire150, wire179})) ?
                       (~|wire186) : (!wire184)));
  assign wire190 = wire188;
  always
    @(posedge clk) begin
      reg191 <= (reg153 ?
          $unsigned(wire148) : (+$unsigned(({wire189} <= $unsigned(wire149)))));
      reg192 <= ({$signed({{wire149, wire149}, {(8'hb3)}}),
          $unsigned(wire151[(4'hc):(2'h3)])} ^ wire177);
      reg193 <= $unsigned(({($unsigned(wire158) >> ((8'ha3) ?
              wire188 : wire177)),
          $unsigned(wire177)} << $signed({(wire190 ? (8'hbf) : wire156),
          $signed(wire187)})));
    end
  always
    @(posedge clk) begin
      reg194 <= $signed($signed((wire157[(1'h1):(1'h1)] || reg192)));
      reg195 <= (wire148[(1'h1):(1'h0)] ?
          (~|wire154[(3'h5):(1'h1)]) : wire179[(3'h6):(3'h4)]);
      reg196 <= ((8'ha7) <= $unsigned(($unsigned(wire177[(1'h0):(1'h0)]) ?
          (((8'hbb) ? reg153 : wire184) ?
              $unsigned(wire149) : $signed((8'hb7))) : {wire180[(4'h9):(4'h9)],
              (^reg195)})));
    end
endmodule

module module71
#(parameter param144 = ((((((7'h40) & (7'h41)) ? ((7'h43) <= (8'hbb)) : ((8'had) ? (8'hb8) : (8'ha0))) ? ({(8'hb6)} ? ((8'hba) << (8'hb7)) : ((8'hb6) < (7'h41))) : (((8'h9d) ? (8'h9c) : (8'hb6)) * ((8'hba) | (8'h9e)))) ? (|(~(!(8'hb6)))) : (({(8'ha3)} <= ((8'h9d) >> (8'ha6))) && (-{(8'ha0)}))) ? (^~({(~&(8'hbf)), ((8'had) ? (8'hb2) : (8'hae))} <= (((8'had) ? (8'haf) : (8'hbc)) ? ((8'haa) - (8'ha9)) : ((8'h9e) >>> (8'haa))))) : (((((8'hb0) ? (8'ha2) : (8'hb9)) ? ((8'haa) ? (7'h44) : (8'hb8)) : {(8'h9c)}) == (((8'hb6) ? (8'hbd) : (8'hb5)) ? {(8'ha4), (8'ha1)} : ((7'h44) >>> (8'ha1)))) < {((^(8'ha6)) & ((7'h43) ? (8'ha3) : (8'h9f)))})))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire75;
  input wire [(5'h12):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  input wire [(5'h11):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire signed [(3'h6):(1'h0)] wire141;
  wire signed [(5'h14):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire133;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire129;
  reg [(3'h7):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 (1'h0)};
  module76 #() modinst130 (wire129, clk, wire73, wire74, wire72, wire75);
  assign wire131 = wire74[(3'h6):(1'h1)];
  assign wire132 = ((wire73 ?
                       $signed({{wire129}}) : {(|$signed((8'h9e))),
                           wire73}) <= ((((wire129 ? wire129 : (8'hbc)) ?
                           (wire131 ?
                               wire131 : wire72) : $unsigned(wire74)) && $unsigned((wire75 || wire73))) ?
                       ((-$signed(wire72)) ?
                           {(^wire74), $unsigned((8'hb1))} : (wire73 ?
                               $unsigned(wire131) : wire74[(2'h3):(2'h2)])) : {(^{wire73}),
                           ({wire131} <<< (wire129 ^ wire73))}));
  assign wire133 = {{wire132, (~&wire73)}};
  assign wire134 = (($signed((~^$unsigned((8'hb5)))) ?
                           ({(-wire131),
                               $unsigned(wire131)} ~^ {wire72[(3'h6):(1'h1)],
                               (wire74 <= wire129)}) : (({wire131, wire133} ?
                               wire75[(4'h8):(1'h0)] : (^~wire129)) || $signed({wire73}))) ?
                       wire72 : wire72[(3'h7):(3'h6)]);
  assign wire135 = $signed(wire132);
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned($unsigned((wire129 ? wire131 : (8'hb4)))))))
        begin
          if ($signed($signed((($signed(wire73) ? (~|wire131) : (+wire75)) ?
              (8'hb6) : ((8'hb9) ? wire129 : wire73)))))
            begin
              reg136 <= $signed(($unsigned((~&wire135[(3'h5):(1'h0)])) ?
                  (~|$signed((wire72 || wire74))) : wire73[(4'h9):(2'h3)]));
            end
          else
            begin
              reg136 <= wire134[(3'h5):(1'h0)];
              reg137 <= (~^({$signed(((8'had) <= reg136))} ?
                  wire131[(4'hb):(4'h9)] : wire133));
            end
          reg138 <= wire132[(3'h6):(2'h3)];
          reg139 <= (wire135[(1'h1):(1'h1)] ?
              reg138[(5'h13):(1'h0)] : $signed((wire133 ^ wire131)));
        end
      else
        begin
          reg136 <= ((!{$unsigned(wire72[(3'h5):(1'h0)])}) <<< wire134);
          reg137 <= $signed(reg139[(4'hc):(3'h4)]);
          if (($unsigned(($unsigned({wire131}) << ((wire75 ?
                  wire75 : reg137) >> $signed(wire72)))) ?
              $unsigned((reg139 ?
                  wire73[(5'h10):(4'hc)] : ((wire74 ?
                      reg137 : wire134) >>> $unsigned(reg139)))) : $unsigned(($signed($unsigned(wire73)) ?
                  $signed($unsigned(reg139)) : (reg139[(4'h9):(3'h6)] ?
                      reg139 : (wire75 & reg137))))))
            begin
              reg138 <= {$unsigned($signed((+reg139[(4'h8):(1'h1)]))),
                  ($unsigned(wire74) + reg138)};
            end
          else
            begin
              reg138 <= ($unsigned((+((wire132 * wire134) ?
                      $unsigned((8'hb5)) : {(8'ha3), wire74}))) ?
                  reg138 : {$unsigned($signed(reg136[(2'h3):(1'h0)])),
                      ($unsigned((|reg139)) ~^ (!(8'hb9)))});
              reg139 <= wire73[(4'hd):(4'ha)];
            end
        end
      reg140 <= reg139;
    end
  assign wire141 = $signed({reg137[(1'h0):(1'h0)], reg137});
  assign wire142 = wire135[(4'ha):(2'h3)];
  assign wire143 = $signed($unsigned($unsigned((wire132 || $unsigned(reg139)))));
endmodule

module module34
#(parameter param65 = ((~^(~{((7'h44) >> (8'hbb))})) ? (~|((~(8'hbc)) && (~^(-(8'haa))))) : {((+((7'h43) * (8'ha5))) ? (((8'haa) == (8'hbb)) ? (^~(7'h40)) : ((8'haa) ? (8'hb0) : (8'hb4))) : (((8'haf) * (8'hb9)) <<< ((8'hbe) - (8'hb0))))}), 
parameter param66 = (param65 ? (param65 << ((~&param65) ? ((param65 < (8'hbb)) ? {param65} : (param65 >> param65)) : ((param65 ? param65 : param65) + (param65 ? param65 : param65)))) : (((param65 ? (8'h9c) : ((8'hb9) ^ param65)) <<< param65) ? (^~param65) : param65)))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire39;
  input wire [(5'h15):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire36;
  input wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(5'h10):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
                 reg53,
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
  always
    @(posedge clk) begin
      reg40 <= ($unsigned(wire38) ?
          $unsigned($signed((wire35 ?
              (wire39 >>> wire36) : (^wire36)))) : wire36);
      if ($signed(($unsigned($signed($unsigned(wire35))) ?
          (!($unsigned(wire37) ?
              $signed(wire36) : {wire36,
                  wire37})) : $signed($unsigned((reg40 >> (8'hbe)))))))
        begin
          reg41 <= wire36;
        end
      else
        begin
          reg41 <= $signed($unsigned(((!(wire38 ^~ wire35)) == $unsigned($unsigned(wire37)))));
        end
      reg42 <= (8'hab);
      if (({reg41[(3'h6):(2'h3)], wire37} ?
          wire35[(1'h0):(1'h0)] : reg40[(3'h7):(3'h7)]))
        begin
          reg43 <= wire39;
          if ({$unsigned($unsigned((+$unsigned((7'h43)))))})
            begin
              reg44 <= $signed($signed($unsigned(reg40[(1'h1):(1'h0)])));
            end
          else
            begin
              reg44 <= $unsigned($unsigned({reg44[(1'h1):(1'h1)],
                  (~(~reg42))}));
              reg45 <= ($signed({{((8'hae) ? wire39 : wire35)},
                  reg41[(3'h6):(1'h0)]}) & wire39);
              reg46 <= $unsigned(($signed({$unsigned(reg42),
                      reg40[(3'h6):(1'h0)]}) ?
                  $signed((8'hb0)) : $unsigned((reg41[(2'h3):(1'h1)] ?
                      reg44 : {wire36}))));
              reg47 <= $signed(((~&((wire38 & (7'h43)) >> $signed(reg40))) ?
                  (^$signed(reg45)) : $unsigned(wire36)));
              reg48 <= (reg42[(2'h3):(2'h2)] ^ (&(^~$unsigned((!reg46)))));
            end
        end
      else
        begin
          reg43 <= (~&$signed((8'ha1)));
          if (wire38[(3'h7):(1'h1)])
            begin
              reg44 <= $unsigned($signed(reg47));
            end
          else
            begin
              reg44 <= (~^($signed(reg47[(4'h9):(1'h0)]) ?
                  wire39[(4'h9):(3'h7)] : (wire39 ?
                      reg48 : wire35[(1'h0):(1'h0)])));
              reg45 <= $signed(reg40[(2'h3):(1'h1)]);
              reg46 <= (&(reg46 ~^ reg46[(3'h4):(2'h3)]));
              reg47 <= reg47;
            end
          reg48 <= ($signed((&(^~$signed(wire39)))) >>> ((-{reg46}) ?
              $signed(((wire39 ^~ reg41) ?
                  (wire39 + reg44) : ((8'hb7) <= wire36))) : $unsigned($unsigned($unsigned(reg48)))));
        end
      reg49 <= $signed((-$unsigned(reg48)));
    end
  assign wire50 = $unsigned($signed({$unsigned((8'h9f)), $signed((!reg48))}));
  assign wire51 = wire39;
  assign wire52 = (($unsigned((!wire51[(2'h3):(2'h3)])) ?
                          $unsigned((8'ha3)) : wire35[(4'h9):(2'h2)]) ?
                      (8'hb7) : ((((^reg41) ?
                              (^wire50) : (~|wire35)) ^~ $signed({reg48,
                              reg46})) ?
                          (+$signed($signed(reg42))) : reg48[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg53 <= wire37;
    end
  assign wire54 = ($unsigned($unsigned(wire38[(3'h6):(2'h2)])) ^~ ($signed(wire52) || reg42[(1'h1):(1'h0)]));
  assign wire55 = (reg46[(3'h7):(2'h3)] ? $signed(wire36) : reg42);
  assign wire56 = {(reg43[(4'h8):(3'h5)] ^~ $signed({$signed((8'hb6))})),
                      (!$unsigned((reg48 ? (8'ha6) : $signed(wire51))))};
  assign wire57 = (+wire54[(3'h4):(1'h1)]);
  assign wire58 = (~$unsigned((wire55[(1'h0):(1'h0)] ?
                      ({(8'hb5)} ?
                          reg49 : ((8'hb6) ? wire39 : wire50)) : {(&reg45),
                          (reg46 >= wire36)})));
  assign wire59 = (~|(^$unsigned(wire36[(4'h8):(3'h5)])));
  assign wire60 = {(+$signed((+$signed(wire55)))),
                      $signed((((^~(8'ha7)) ?
                              $unsigned(wire39) : (reg42 ? (7'h42) : wire38)) ?
                          wire51[(1'h1):(1'h0)] : {$unsigned(reg40),
                              ((8'hbc) ? reg45 : wire38)}))};
  assign wire61 = wire56;
  assign wire62 = $signed((($signed(wire58) ?
                          $unsigned($unsigned(wire54)) : wire58) ?
                      $unsigned($unsigned($unsigned((8'h9f)))) : wire37[(2'h3):(2'h3)]));
  assign wire63 = (8'hb6);
  assign wire64 = (8'h9d);
endmodule

module module76
#(parameter param128 = ((~^(((-(8'hb2)) ? ((8'hbe) ? (8'hae) : (8'hba)) : ((8'ha8) != (8'ha6))) >>> ((!(8'ha0)) ^ {(8'h9f), (8'ha3)}))) && ((+(((8'hab) < (8'hbb)) ? ((8'ha2) ? (8'ha7) : (8'h9f)) : {(8'hb0), (8'h9e)})) << (+(-((8'hbe) ? (8'hbc) : (8'hac)))))))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire79;
  input wire signed [(5'h11):(1'h0)] wire78;
  input wire signed [(5'h15):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire127;
  wire [(3'h7):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire124;
  wire [(5'h10):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire99;
  wire signed [(3'h4):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(3'h7):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'hc):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire124,
                 wire122,
                 wire114,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 reg125,
                 reg123,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire81 = $signed((wire79 ?
                      ($unsigned({wire78,
                          wire79}) && ((~^wire80) - (8'h9c))) : $signed(((wire80 < wire78) >>> ((8'hbf) ?
                          wire79 : wire80)))));
  assign wire82 = $unsigned(((wire78[(1'h0):(1'h0)] ?
                          $signed((~wire78)) : (^(+wire78))) ?
                      {$signed(wire81[(1'h1):(1'h0)])} : ((^~(~wire77)) >= ((wire81 >> wire78) ^~ wire79))));
  assign wire83 = (-$signed((!wire78[(3'h7):(1'h1)])));
  assign wire84 = ($unsigned((^(&$unsigned(wire83)))) > ((~|{wire79,
                      $unsigned(wire79)}) > (-(((8'ha7) > wire80) ?
                      wire81[(1'h0):(1'h0)] : (!wire78)))));
  always
    @(posedge clk) begin
      reg85 <= wire82[(3'h4):(1'h1)];
      reg86 <= $unsigned({(($signed(wire82) ?
                  $unsigned(wire77) : (wire84 != wire83)) ?
              ((+wire81) ? (8'hb5) : wire78[(4'hd):(4'h8)]) : (&(+wire81))),
          (&$unsigned(reg85[(3'h4):(2'h3)]))});
    end
  always
    @(posedge clk) begin
      reg87 <= {$unsigned($signed(((wire84 ? wire81 : reg85) && (8'ha2)))),
          $unsigned(wire78)};
      reg88 <= {$unsigned(wire83),
          (~|($unsigned((reg87 != wire84)) >>> (~&wire77)))};
      reg89 <= ({$signed((wire77[(3'h7):(2'h3)] ?
                  {(8'h9e), wire79} : {(8'hb8)}))} ?
          wire77[(4'hd):(2'h3)] : {reg85,
              ($signed(wire83[(1'h0):(1'h0)]) <= ($unsigned(reg86) < wire79[(1'h0):(1'h0)]))});
      reg90 <= ($unsigned($unsigned(reg85)) >>> {($signed((reg87 ?
              reg88 : (8'hb3))) <= ($unsigned(reg88) * $unsigned(reg87)))});
      reg91 <= {reg90,
          ((wire81 ? {((8'ha3) - reg85), $signed(reg87)} : wire84) ?
              reg88[(3'h7):(3'h4)] : ($signed($unsigned(reg85)) ?
                  wire77 : ((-wire78) ? wire80 : {wire82})))};
    end
  assign wire92 = reg91[(5'h10):(1'h0)];
  assign wire93 = (($unsigned((!(~reg90))) ?
                      (^~wire80[(4'h8):(3'h7)]) : (($unsigned(reg87) ?
                              (reg89 ? wire80 : wire83) : (wire82 ?
                                  reg87 : wire81)) ?
                          ((wire79 <<< reg88) || $unsigned(wire92)) : $unsigned(wire78[(5'h11):(3'h6)]))) >>> ($unsigned(wire83[(2'h3):(1'h1)]) | (((reg91 << wire84) > (^~wire77)) ?
                      reg90[(1'h0):(1'h0)] : {$unsigned(reg86)})));
  assign wire94 = wire81[(2'h2):(2'h2)];
  assign wire95 = reg88[(1'h0):(1'h0)];
  assign wire96 = (8'ha8);
  assign wire97 = (reg87 ^ ((($unsigned(wire78) ?
                          wire93 : wire77[(4'hf):(4'hf)]) ?
                      wire92[(4'ha):(3'h6)] : wire93) <= ($signed({reg85,
                      wire82}) == ((wire82 ? wire95 : wire84) + reg90))));
  assign wire98 = wire95;
  assign wire99 = (wire82 ?
                      (wire78[(3'h6):(2'h2)] ~^ wire98[(1'h0):(1'h0)]) : reg89[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg100 <= {(~&$unsigned(reg89)), wire83[(1'h0):(1'h0)]};
      reg101 <= wire82;
      if ($unsigned($unsigned($unsigned($unsigned(wire77[(4'hf):(3'h4)])))))
        begin
          reg102 <= (~&($signed(({wire79} != $signed(reg89))) * ((wire81 ?
              $unsigned(wire81) : (7'h43)) | (reg90[(3'h7):(3'h7)] ?
              reg100[(3'h7):(2'h3)] : $unsigned(reg101)))));
          if (reg88[(3'h6):(1'h1)])
            begin
              reg103 <= (wire95 ? {(8'hb2)} : wire96);
              reg104 <= {reg88[(3'h4):(3'h4)]};
              reg105 <= reg104[(4'h9):(4'h8)];
              reg106 <= $unsigned(reg88[(3'h4):(3'h4)]);
            end
          else
            begin
              reg103 <= ($unsigned($unsigned((~$unsigned(reg101)))) <<< wire77);
              reg104 <= $signed((-$unsigned($unsigned((wire97 & wire80)))));
              reg105 <= $unsigned((-$signed((^wire80[(4'h9):(4'h8)]))));
            end
          reg107 <= (+((&reg90) ?
              ({(wire78 <<< reg86)} ?
                  ({wire78, reg101} < (8'h9d)) : ({wire96, (8'hbe)} ?
                      {reg86,
                          reg86} : (^wire79))) : (^(wire96[(1'h1):(1'h1)] << (reg90 < (8'hac))))));
          reg108 <= {reg104};
          reg109 <= wire95[(3'h6):(3'h5)];
        end
      else
        begin
          reg102 <= (reg100[(4'h9):(3'h4)] > $signed((((wire84 ?
              wire93 : wire96) & $unsigned(reg86)) != $unsigned((wire99 ?
              wire99 : (8'ha2))))));
          reg103 <= {($signed(({wire99} ^~ $signed(reg104))) >> wire99[(4'hb):(4'hb)]),
              reg90};
          if ((wire82 ?
              ($unsigned(reg104) ?
                  reg104 : reg85[(3'h4):(2'h2)]) : (|$unsigned(reg105))))
            begin
              reg104 <= (|{{({reg90} ^~ (wire97 ? wire79 : reg90))}});
            end
          else
            begin
              reg104 <= (&$signed($unsigned(wire98[(3'h4):(1'h1)])));
              reg105 <= $signed(($unsigned((~&(reg87 ?
                  wire84 : reg108))) ^ $signed(wire93)));
              reg106 <= ((wire80 ?
                  reg109[(2'h2):(1'h0)] : reg107[(5'h10):(2'h3)]) || (^~(reg105[(1'h1):(1'h1)] ?
                  ($unsigned(reg109) ?
                      {wire99, reg105} : (reg88 & reg109)) : $unsigned((reg86 ?
                      reg87 : reg101)))));
              reg107 <= (((&wire95[(3'h7):(1'h0)]) >= $signed({(^~reg88)})) ?
                  {reg101,
                      ({reg91,
                          (~reg109)} >> ($unsigned((8'hb2)) >>> (reg101 ^~ (8'hab))))} : ({wire98,
                      ((wire80 ^~ wire97) || {(8'hbd)})} ^~ $unsigned((~{reg88}))));
              reg108 <= reg100[(5'h10):(1'h0)];
            end
          if ($signed($unsigned($unsigned($signed((~(8'hb8)))))))
            begin
              reg109 <= {$signed(wire92[(2'h3):(2'h3)]), wire78[(4'hf):(4'he)]};
              reg110 <= (($unsigned($signed({reg101, reg105})) ^ (7'h41)) ?
                  wire80 : (((^$unsigned(wire98)) ?
                          $unsigned(reg90[(4'h9):(3'h5)]) : ($signed(reg88) != $signed(wire81))) ?
                      wire82[(2'h3):(2'h3)] : (wire94 ^~ ((reg103 ?
                          reg87 : (8'h9c)) + $unsigned(reg109)))));
              reg111 <= (~^($signed(($signed((8'hb5)) ?
                  (wire81 < (8'ha0)) : (~|reg110))) >= (~&$signed(wire78))));
            end
          else
            begin
              reg109 <= $signed(({(((8'hbb) ? wire93 : reg105) ?
                          (reg103 ? reg101 : reg89) : (wire99 ?
                              wire94 : wire96)),
                      {wire84[(3'h6):(3'h6)]}} ?
                  (&$unsigned((8'ha2))) : reg106[(3'h5):(2'h3)]));
              reg110 <= wire97;
            end
        end
      reg112 <= (|reg108[(2'h2):(2'h2)]);
      reg113 <= $signed((~&wire77));
    end
  assign wire114 = reg89[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg115 <= {$unsigned(((~&(~^reg100)) >>> ((wire83 == reg91) ?
              (wire79 ? wire77 : reg110) : {reg85, wire84})))};
      reg116 <= (~(((+(|wire95)) != reg100) ?
          (~&wire79[(3'h6):(3'h6)]) : ($signed({wire78, (7'h44)}) >>> (reg88 ?
              (wire81 | reg101) : $unsigned(wire94)))));
      reg117 <= $unsigned($unsigned((reg108[(1'h0):(1'h0)] ?
          (!reg109[(1'h0):(1'h0)]) : (^$signed((8'ha6))))));
      if (reg91[(5'h10):(4'ha)])
        begin
          reg118 <= wire96;
          reg119 <= (~^reg113[(4'h9):(4'h9)]);
        end
      else
        begin
          if (($signed(reg87) != reg87))
            begin
              reg118 <= (wire96[(1'h0):(1'h0)] ?
                  (^~reg100) : wire78[(4'hb):(4'h8)]);
              reg119 <= {$unsigned((^~$unsigned(reg89[(1'h1):(1'h0)]))),
                  (~^reg104)};
              reg120 <= reg104;
            end
          else
            begin
              reg118 <= reg87[(2'h3):(2'h2)];
            end
        end
      reg121 <= {reg110[(1'h1):(1'h0)]};
    end
  assign wire122 = {$unsigned((-$unsigned((reg116 | (7'h44)))))};
  always
    @(posedge clk) begin
      reg123 <= $signed(reg100);
    end
  assign wire124 = $unsigned((~reg108[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg125 <= (8'h9e);
    end
  assign wire126 = $unsigned((reg121[(4'he):(4'h9)] ?
                       reg125 : $unsigned(($signed(wire81) ^~ (&reg118)))));
  assign wire127 = $signed($signed((!$unsigned(wire92[(3'h6):(3'h5)]))));
endmodule

module module160  (y, clk, wire165, wire164, wire163, wire162, wire161);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire165;
  input wire signed [(5'h13):(1'h0)] wire164;
  input wire signed [(2'h3):(1'h0)] wire163;
  input wire signed [(4'h8):(1'h0)] wire162;
  input wire [(5'h11):(1'h0)] wire161;
  wire signed [(3'h4):(1'h0)] wire176;
  wire signed [(4'h8):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire174;
  wire signed [(5'h13):(1'h0)] wire173;
  wire [(5'h13):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire171;
  wire signed [(4'hf):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  wire [(4'h8):(1'h0)] wire168;
  wire signed [(5'h13):(1'h0)] wire166;
  reg signed [(4'h9):(1'h0)] reg167 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire166,
                 reg167,
                 (1'h0)};
  assign wire166 = (($signed({$unsigned(wire164)}) ?
                           wire161 : (~&wire165[(3'h5):(3'h5)])) ?
                       wire163 : (-$signed($signed(wire163))));
  always
    @(posedge clk) begin
      reg167 <= $unsigned((~&(|{wire166[(3'h5):(2'h3)]})));
    end
  assign wire168 = (wire164[(4'he):(3'h4)] ?
                       $signed((!(~$unsigned((8'ha4))))) : $signed(wire164));
  assign wire169 = wire161;
  assign wire170 = ($signed((wire162 ?
                           wire166[(4'hd):(4'ha)] : (~^(wire169 < wire168)))) ?
                       $unsigned(wire165) : ($signed(wire161) > {(wire165[(4'ha):(3'h5)] ?
                               (reg167 ?
                                   wire168 : (8'hbc)) : (wire164 > wire161))}));
  assign wire171 = ((|(8'haf)) * ($signed(wire169[(1'h0):(1'h0)]) >> wire163));
  assign wire172 = {wire164};
  assign wire173 = $unsigned($unsigned($signed(((wire164 ^~ wire169) < (!wire161)))));
  assign wire174 = ((((wire172 >> (8'h9e)) && ((8'hb2) | $signed(wire169))) - (-(^~wire166))) ?
                       $unsigned((((~&wire172) ?
                           (^~wire164) : wire163) ~^ (~^wire173))) : (^~(({reg167} ?
                           (wire168 ?
                               reg167 : (8'h9c)) : $unsigned(wire166)) < $signed((wire166 ?
                           (8'ha1) : wire173)))));
  assign wire175 = $signed((^{(~$unsigned(wire174))}));
  assign wire176 = wire165;
endmodule
