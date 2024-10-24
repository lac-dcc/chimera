module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire238;
  wire signed [(4'he):(1'h0)] wire237;
  wire [(4'hc):(1'h0)] wire236;
  wire signed [(4'hd):(1'h0)] wire235;
  wire signed [(3'h4):(1'h0)] wire234;
  wire signed [(4'h9):(1'h0)] wire233;
  wire signed [(5'h13):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire221;
  wire [(3'h5):(1'h0)] wire223;
  wire [(3'h4):(1'h0)] wire227;
  wire signed [(5'h13):(1'h0)] wire228;
  wire [(2'h2):(1'h0)] wire229;
  reg [(2'h2):(1'h0)] reg232 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg231 = (1'h0);
  reg [(5'h11):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg225 = (1'h0);
  reg [(5'h12):(1'h0)] reg226 = (1'h0);
  assign y = {wire238,
                 wire237,
                 wire236,
                 wire235,
                 wire234,
                 wire233,
                 wire134,
                 wire221,
                 wire223,
                 wire227,
                 wire228,
                 wire229,
                 reg232,
                 reg231,
                 reg224,
                 reg225,
                 reg226,
                 (1'h0)};
  module5 #() modinst135 (wire134, clk, wire2, wire0, wire1, wire3, wire4);
  module136 #() modinst222 (.wire140(wire4), .clk(clk), .y(wire221), .wire138(wire1), .wire139(wire134), .wire137(wire0));
  assign wire223 = ($unsigned($unsigned(((+wire0) ?
                           wire0[(4'hc):(1'h1)] : wire4[(4'ha):(4'ha)]))) ?
                       $signed($unsigned(((wire221 ?
                           wire2 : wire4) | $unsigned((8'hb8))))) : wire4);
  always
    @(posedge clk) begin
      reg224 <= $unsigned(($signed((-$unsigned(wire0))) ?
          ({$unsigned((8'hb8))} | (^(wire223 >> wire3))) : $signed($signed((wire0 ?
              wire221 : (8'h9e))))));
      reg225 <= ((+$unsigned($unsigned(wire134[(3'h5):(3'h5)]))) >> (~wire3));
      reg226 <= $signed((($signed((wire0 ^~ wire1)) ^~ $signed(wire4)) < $signed($unsigned(wire3))));
    end
  assign wire227 = reg226[(3'h5):(2'h2)];
  assign wire228 = ((-wire3) ?
                       (~|((|(^~reg225)) | (~(reg224 ?
                           wire4 : wire2)))) : wire223);
  module136 #() modinst230 (wire229, clk, reg226, wire0, wire4, wire228);
  always
    @(posedge clk) begin
      reg231 <= wire229[(2'h2):(1'h0)];
      reg232 <= wire1[(5'h11):(1'h0)];
    end
  assign wire233 = $signed({(((~&(7'h40)) + {wire227}) ?
                           $unsigned((wire3 ?
                               wire229 : wire0)) : $unsigned(wire221[(4'h8):(1'h0)])),
                       ($unsigned(((7'h40) + wire229)) + $unsigned((wire1 + wire227)))});
  assign wire234 = (+(!{(+wire4), $unsigned(reg231[(4'hf):(4'hf)])}));
  assign wire235 = wire227;
  assign wire236 = wire0;
  assign wire237 = ($unsigned($unsigned((~|(^wire227)))) ?
                       $signed((reg226 >> wire134)) : {(((8'ha5) != (wire236 << (8'ha5))) ?
                               $unsigned($unsigned(wire3)) : $unsigned((wire223 ?
                                   (8'ha2) : wire236))),
                           ((!(-wire221)) & ({wire236} <<< $signed((8'haa))))});
  assign wire238 = $signed((wire4 ?
                       (wire3 ?
                           $unsigned(wire1[(4'ha):(3'h4)]) : (~^$signed(wire233))) : wire229[(2'h2):(2'h2)]));
endmodule

module module136  (y, clk, wire137, wire138, wire139, wire140);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire137;
  input wire signed [(4'hd):(1'h0)] wire138;
  input wire [(5'h13):(1'h0)] wire139;
  input wire [(5'h12):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire219;
  wire signed [(4'ha):(1'h0)] wire218;
  wire signed [(3'h5):(1'h0)] wire216;
  wire [(4'ha):(1'h0)] wire180;
  wire signed [(4'hc):(1'h0)] wire179;
  wire [(5'h10):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire177;
  reg [(5'h15):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(3'h7):(1'h0)] reg156 = (1'h0);
  reg [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg [(4'hf):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire216,
                 wire180,
                 wire179,
                 wire161,
                 wire177,
                 reg220,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire140 ?
          $unsigned((wire140[(4'hf):(3'h5)] ~^ $signed(wire139[(3'h4):(1'h0)]))) : (($signed($unsigned(wire140)) ?
                  $unsigned((wire137 | wire140)) : $unsigned($unsigned(wire137))) ?
              $unsigned(($unsigned(wire140) ?
                  wire138[(1'h1):(1'h1)] : (wire140 || wire139))) : wire138)))
        begin
          reg141 <= (&((8'haf) == (wire138 ?
              {(&(8'hbc)), {wire139, wire138}} : $signed($signed(wire138)))));
        end
      else
        begin
          reg141 <= $signed(($unsigned(({reg141} ? {reg141} : wire137)) ?
              $signed(($unsigned(wire138) ?
                  (reg141 <<< wire139) : (wire139 >>> wire138))) : wire139[(3'h4):(1'h0)]));
          reg142 <= ($signed($signed(wire137)) ?
              (~(+(wire140[(4'h9):(3'h4)] * (|reg141)))) : (~&wire139[(1'h0):(1'h0)]));
          if (($unsigned(($signed((!reg142)) ?
                  (~(&reg142)) : (wire140 <= wire140[(2'h2):(1'h0)]))) ?
              wire137[(5'h12):(3'h5)] : $signed((~&$unsigned((~|wire137))))))
            begin
              reg143 <= $unsigned((^~wire137));
              reg144 <= wire137[(1'h1):(1'h0)];
              reg145 <= $unsigned({reg141});
              reg146 <= $signed((reg142[(1'h0):(1'h0)] ?
                  (($signed(reg144) ? (~&reg141) : reg144) ?
                      (+$unsigned((8'hac))) : (!(reg144 ?
                          reg145 : wire140))) : ((~|$unsigned(reg141)) ?
                      reg143[(1'h1):(1'h1)] : ($unsigned(reg144) ?
                          {reg145, wire138} : reg144[(2'h3):(1'h0)]))));
              reg147 <= $unsigned(($signed(reg142) ?
                  ($signed(wire138[(4'hd):(4'hd)]) & {$unsigned(reg143)}) : (((reg144 == wire137) <<< {reg142}) ~^ (~reg142))));
            end
          else
            begin
              reg143 <= ((8'hbf) ^~ $unsigned(reg144));
              reg144 <= (+reg147[(4'ha):(3'h5)]);
            end
          reg148 <= {wire140[(2'h3):(1'h0)]};
        end
      reg149 <= $signed(reg148[(4'hb):(4'hb)]);
      reg150 <= $signed((~&reg145[(4'he):(4'h8)]));
      if (wire139[(2'h3):(1'h1)])
        begin
          reg151 <= reg150;
          if ((({((~wire137) >= {reg148, wire137}),
              wire140} ^ reg141) & {(~^(|(reg146 ? reg147 : wire139)))}))
            begin
              reg152 <= (reg145 ?
                  ($unsigned((8'h9c)) & ({reg147} ?
                      reg142[(2'h3):(1'h0)] : $unsigned(reg145[(5'h11):(3'h5)]))) : {(^~(((8'h9d) != reg144) & (~|reg148))),
                      reg142});
              reg153 <= (&{reg145});
            end
          else
            begin
              reg152 <= reg149[(2'h2):(1'h0)];
              reg153 <= {reg152[(4'h8):(1'h1)]};
              reg154 <= reg143;
              reg155 <= $signed((~^($unsigned($signed(reg153)) ?
                  $unsigned($signed(reg151)) : wire140[(3'h4):(1'h0)])));
            end
          if ($signed(((($unsigned(reg152) ?
                      $signed(reg154) : $unsigned((7'h44))) ?
                  ((|reg141) | $signed(reg151)) : $unsigned((8'hbc))) ?
              ($signed((8'ha0)) ?
                  $signed(reg155[(4'h8):(4'h8)]) : $signed((reg144 ?
                      reg144 : (8'hb2)))) : $unsigned(({reg142} - $unsigned(reg152))))))
            begin
              reg156 <= ((~^reg142[(2'h2):(1'h0)]) <= $signed((wire138 <<< ({wire137,
                  reg141} - reg155[(4'h9):(1'h0)]))));
              reg157 <= ((wire139[(4'h8):(3'h5)] != $signed({$signed(reg142)})) + {(~(^(!reg144))),
                  reg154});
            end
          else
            begin
              reg156 <= (reg155 ? $signed(reg156[(3'h4):(1'h1)]) : reg157);
            end
          reg158 <= reg151;
          reg159 <= $unsigned((wire137 ^~ (~|reg149[(4'hc):(4'ha)])));
        end
      else
        begin
          reg151 <= reg153;
          reg152 <= (8'hb1);
          reg153 <= reg159[(2'h2):(1'h1)];
          reg154 <= reg148[(4'ha):(4'h9)];
        end
      reg160 <= (+reg156);
    end
  assign wire161 = $signed($unsigned((!(8'hb6))));
  module162 #() modinst178 (wire177, clk, reg149, wire137, reg148, reg155);
  assign wire179 = $signed((~^($unsigned((reg143 ? reg145 : (7'h44))) ?
                       ({reg160} | (&reg151)) : $unsigned(((8'ha8) ?
                           wire177 : (8'ha5))))));
  assign wire180 = reg155[(5'h11):(2'h2)];
  module181 #() modinst217 (wire216, clk, reg153, wire180, wire139, reg142, reg158);
  assign wire218 = (reg145 ?
                       $signed(reg146[(3'h5):(2'h3)]) : $unsigned(reg149));
  assign wire219 = (wire218 ?
                       (~^reg141[(3'h7):(3'h5)]) : {((reg153[(1'h1):(1'h1)] ?
                                   reg151 : (~^reg146)) ?
                               $unsigned(reg144) : $unsigned((^~reg142))),
                           reg144[(3'h6):(2'h2)]});
  always
    @(posedge clk) begin
      reg220 <= (-((reg147 + (~&(reg145 > reg156))) ? (8'ha2) : reg144));
    end
endmodule

module module5
#(parameter param133 = ((+(+({(8'hbc), (8'hbc)} ? (+(8'h9e)) : {(8'ha3)}))) ? (7'h44) : ((~(((8'hb2) ? (8'had) : (8'ha5)) ? {(8'h9e)} : {(8'haa)})) ? (+({(8'hbb), (8'hae)} ? ((8'haa) ? (8'hbe) : (8'hb6)) : (!(8'had)))) : (~^{(+(8'hb6))}))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire108;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire11;
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire132,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire108,
                 wire47,
                 wire45,
                 wire11,
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
                 (1'h0)};
  assign wire11 = ((wire6[(1'h1):(1'h1)] ?
                      $unsigned(($unsigned(wire8) ?
                          (wire8 < wire9) : (8'hbb))) : wire8[(4'h9):(3'h5)]) >>> wire10);
  always
    @(posedge clk) begin
      reg12 <= wire8[(2'h3):(2'h3)];
      reg13 <= $unsigned(($signed((~&(!wire7))) ^ wire8));
      reg14 <= $unsigned(((!(^reg13)) ? reg12 : wire8));
      reg15 <= $unsigned(reg13[(3'h7):(3'h6)]);
      if ((reg13 ?
          ($signed((wire9[(4'hf):(2'h2)] ? reg14 : (reg15 != reg13))) ?
              wire10 : (((~(8'h9c)) ?
                      $unsigned(reg14) : wire10[(2'h3):(2'h3)]) ?
                  ($unsigned(reg12) ?
                      $signed(reg12) : reg13) : $signed((wire11 ?
                      reg15 : wire6)))) : (~^((|(wire11 ?
              wire9 : wire6)) - $signed($signed((8'hb9)))))))
        begin
          reg16 <= (^($unsigned($unsigned((wire10 ^ (7'h42)))) ?
              {$unsigned((+reg13)),
                  ($unsigned(wire11) >= wire9[(3'h5):(3'h5)])} : (8'ha7)));
        end
      else
        begin
          reg16 <= {((wire9 ?
                  $unsigned((reg15 ?
                      wire11 : (8'h9c))) : $signed(wire11)) * reg14[(4'he):(4'h9)])};
          reg17 <= reg16[(1'h1):(1'h0)];
          if ((+({{wire6, $signed(wire10)}} ?
              (^~$signed(reg13)) : wire7[(4'h8):(1'h0)])))
            begin
              reg18 <= (-{{(~^(!reg12)), $signed((~^wire10))},
                  (((reg13 | reg17) - (-wire11)) ?
                      reg17[(3'h7):(2'h2)] : $signed(reg17))});
              reg19 <= wire8;
              reg20 <= $signed($signed({wire7[(1'h1):(1'h1)],
                  wire8[(2'h2):(1'h1)]}));
              reg21 <= ((^$unsigned((reg14[(3'h4):(3'h4)] >> $unsigned((8'hbf))))) ^~ (reg19[(1'h1):(1'h1)] ?
                  wire11 : wire6));
            end
          else
            begin
              reg18 <= {$unsigned({reg14, $signed(reg13[(2'h3):(2'h3)])}),
                  (($unsigned(wire8[(3'h7):(1'h1)]) << (wire11 >>> (wire8 && wire8))) <<< reg20[(1'h1):(1'h1)])};
              reg19 <= reg13;
              reg20 <= ((8'hbd) ?
                  $signed(reg20[(5'h10):(3'h6)]) : $signed((($unsigned(reg13) >> reg14[(2'h2):(2'h2)]) ?
                      (+$signed(wire6)) : (~&$unsigned(reg21)))));
            end
        end
    end
  module22 #() modinst46 (.wire26(reg14), .clk(clk), .wire24(wire10), .y(wire45), .wire23(reg21), .wire27(reg15), .wire25(wire7));
  assign wire47 = {{((wire45[(1'h1):(1'h1)] && $unsigned(wire6)) ?
                              reg18 : reg20)}};
  module48 #() modinst109 (wire108, clk, wire8, reg12, reg21, wire47);
  assign wire110 = $signed(reg12);
  assign wire111 = ({wire10[(4'hf):(4'ha)]} - $signed({$signed(wire6[(1'h1):(1'h1)]),
                       (~&$signed(wire8))}));
  assign wire112 = (wire110[(4'hc):(3'h6)] && wire9);
  assign wire113 = $unsigned(wire110);
  assign wire114 = (~|wire47);
  assign wire115 = $unsigned((^~($unsigned({wire108}) ^ (~(8'ha0)))));
  assign wire116 = $unsigned(reg12[(4'hc):(4'ha)]);
  assign wire117 = (!reg14);
  assign wire118 = (&{wire111[(4'ha):(4'h9)], (~&reg12)});
  always
    @(posedge clk) begin
      reg119 <= (!(($signed(reg13[(2'h3):(1'h0)]) != (8'haf)) <<< (reg19[(1'h0):(1'h0)] <= ((wire116 << reg18) ?
          reg20[(3'h6):(3'h5)] : $unsigned(wire8)))));
      reg120 <= wire10;
      reg121 <= wire8;
      if (wire115)
        begin
          if ((wire45 >>> reg121[(1'h0):(1'h0)]))
            begin
              reg122 <= $unsigned($unsigned(((wire116 >>> (reg14 + wire112)) ^ $unsigned({wire6,
                  wire114}))));
              reg123 <= ({$signed(($unsigned((8'haf)) ?
                          wire9[(4'ha):(3'h4)] : (wire113 ?
                              wire112 : wire111))),
                      (~{(!reg13), wire47[(2'h3):(2'h2)]})} ?
                  (&(&($signed(wire8) ?
                      wire110[(4'h8):(4'h8)] : $unsigned(reg13)))) : (reg13 ?
                      $signed((~|(wire116 >>> (8'hb0)))) : ((~|(wire110 * wire7)) ?
                          $signed($signed((8'ha7))) : (8'had))));
            end
          else
            begin
              reg122 <= (!{$signed($signed($unsigned(wire45)))});
              reg123 <= ((wire113[(5'h14):(4'h9)] ?
                  $signed(reg120[(4'ha):(2'h2)]) : $unsigned(reg13)) << (8'h9c));
              reg124 <= reg121[(2'h2):(2'h2)];
              reg125 <= reg17;
              reg126 <= wire7[(4'h8):(4'h8)];
            end
          if ($unsigned((^$signed((reg125 - reg125[(1'h1):(1'h0)])))))
            begin
              reg127 <= wire7;
              reg128 <= $unsigned($signed($unsigned(((+wire116) ?
                  $unsigned(wire110) : (~|wire6)))));
            end
          else
            begin
              reg127 <= ($unsigned($signed((&((8'hbc) ? reg19 : reg19)))) ?
                  ($unsigned(reg124) ?
                      {{$unsigned(wire11)}} : $unsigned(wire112[(3'h7):(3'h7)])) : {reg127});
              reg128 <= (-(((&(reg17 >= (8'hb1))) - (wire9[(1'h0):(1'h0)] ?
                      (reg20 & (8'h9d)) : (^wire10))) ?
                  (!$unsigned({wire114,
                      wire112})) : $unsigned($unsigned((~|wire7)))));
              reg129 <= (~|wire112);
              reg130 <= ($signed(wire45) | $signed((+(reg126 << reg15[(2'h2):(1'h0)]))));
            end
        end
      else
        begin
          reg122 <= wire11;
          reg123 <= (((~^($signed(reg15) ?
              (~|wire108) : wire115)) + (~((~^wire10) >= (&(7'h43))))) >> ($unsigned(((~&wire108) ?
              (wire11 ? wire115 : wire47) : (reg15 >>> wire116))) > reg119));
        end
      reg131 <= {(&((reg121 ? {reg19} : (+wire118)) ^ ($signed(reg17) ?
              $signed((8'ha2)) : (+(8'h9c)))))};
    end
  assign wire132 = reg120[(3'h7):(2'h2)];
endmodule

module module48
#(parameter param106 = ((&(~&({(8'ha0), (8'h9f)} ? (8'hba) : ((8'h9c) ~^ (8'hb6))))) ? (&(8'hb9)) : ((({(8'hac)} ? (~^(8'hab)) : ((8'hbf) <<< (7'h42))) ? ((8'hb6) * (~^(8'hac))) : ({(8'hac)} != ((8'hb7) <= (8'hb7)))) <= ((((8'ha8) ? (8'ha6) : (8'hbd)) - ((8'ha7) == (8'hb1))) ? (((8'ha9) ? (8'hab) : (8'hb4)) - {(8'ha7)}) : {((8'hbf) ? (8'hbc) : (8'hb1))}))), 
parameter param107 = param106)
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h222):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire52;
  input wire signed [(4'hb):(1'h0)] wire51;
  input wire signed [(3'h7):(1'h0)] wire50;
  input wire [(2'h3):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  assign y = {wire84,
                 wire69,
                 wire64,
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
                 wire53,
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
                 reg85,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire53 = {$signed(wire50[(3'h6):(2'h3)])};
  assign wire54 = wire53;
  assign wire55 = (|((wire50 <<< ($signed(wire52) != (wire52 | wire53))) ^ $unsigned((8'ha1))));
  assign wire56 = wire53[(1'h0):(1'h0)];
  assign wire57 = $signed(wire49[(2'h2):(1'h0)]);
  assign wire58 = (|(|{$signed((wire52 | wire54)),
                      $signed((wire57 ? wire56 : wire57))}));
  assign wire59 = ($unsigned($signed($unsigned({wire51}))) ?
                      $unsigned(wire49) : ((((^~wire49) << $unsigned(wire49)) ?
                          (wire52 >>> (8'ha1)) : $signed(wire55[(3'h4):(2'h2)])) > wire53[(2'h3):(2'h2)]));
  assign wire60 = $unsigned(({(~|(-wire50))} >= wire53[(3'h5):(2'h2)]));
  assign wire61 = $unsigned({{$signed(wire51[(1'h1):(1'h1)])}});
  assign wire62 = wire52[(4'h9):(3'h5)];
  assign wire63 = $unsigned($signed((7'h43)));
  assign wire64 = $unsigned(wire61);
  always
    @(posedge clk) begin
      reg65 <= wire61[(3'h6):(2'h2)];
      reg66 <= ($signed(wire63) ?
          wire58[(1'h0):(1'h0)] : (|$signed(wire50[(3'h4):(2'h2)])));
    end
  always
    @(posedge clk) begin
      reg67 <= (!$unsigned((~|(!(wire51 + reg65)))));
      reg68 <= reg66;
    end
  assign wire69 = reg65[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg70 <= ($signed($unsigned({$unsigned(wire54)})) ?
          $unsigned($signed(wire56)) : (wire62 && ($unsigned(wire58[(3'h5):(2'h2)]) ?
              $signed((~(8'hb0))) : ((&(8'hb0)) ?
                  {wire52} : $unsigned(wire63)))));
      if ((8'hb3))
        begin
          if ((|$signed({$unsigned($unsigned(reg65))})))
            begin
              reg71 <= wire59;
              reg72 <= $signed((^~wire59));
              reg73 <= $unsigned(reg72);
              reg74 <= ((~|{((~wire61) * (~|wire51))}) - ((+$unsigned($signed((8'hae)))) ?
                  reg71 : $signed(reg73)));
              reg75 <= wire54[(4'hb):(3'h6)];
            end
          else
            begin
              reg71 <= (|{(!(reg70 ?
                      reg71[(2'h3):(2'h3)] : wire50[(3'h7):(1'h0)])),
                  $signed({$unsigned(wire54), $unsigned(wire53)})});
              reg72 <= {wire59[(4'hb):(3'h4)]};
              reg73 <= $unsigned((wire56 ^ ($signed($unsigned((8'ha1))) ?
                  (~^(~(8'hb4))) : {reg66[(1'h0):(1'h0)], $unsigned(reg73)})));
              reg74 <= {(^(wire56 ? reg68 : (^{wire60})))};
              reg75 <= reg70;
            end
          reg76 <= reg71;
          reg77 <= $unsigned((($signed(reg75) <<< $signed((8'hb6))) ?
              (^$unsigned($unsigned((8'hae)))) : ((-$signed(wire56)) ?
                  ($signed(wire61) ?
                      wire57[(4'ha):(2'h2)] : (reg75 ?
                          wire56 : wire57)) : ($unsigned(wire51) ~^ ((8'hbc) == reg75)))));
          if ($unsigned((wire63 ?
              wire69[(2'h3):(1'h0)] : ($unsigned(wire61[(3'h5):(2'h3)]) < $unsigned(((8'hbf) || reg73))))))
            begin
              reg78 <= $signed((~|{((8'hbb) != $signed(reg77)), wire49}));
              reg79 <= {wire64[(3'h5):(3'h4)],
                  $signed($unsigned((^$signed(reg67))))};
              reg80 <= $signed(((($unsigned((8'haa)) ?
                  $signed(wire69) : $signed(reg78)) || ((-reg73) <<< $unsigned((8'ha8)))) | reg79));
            end
          else
            begin
              reg78 <= (8'h9e);
              reg79 <= (+wire59[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg71 <= wire62[(2'h2):(1'h1)];
        end
      if (($signed((((8'hab) + (!(8'h9e))) ?
          {(wire63 ? wire56 : reg67),
              wire55[(3'h4):(3'h4)]} : (~^(+(8'h9c))))) == (wire55[(2'h3):(1'h1)] ?
          $unsigned($signed($unsigned((8'hb7)))) : $unsigned(wire54))))
        begin
          reg81 <= {({{(reg66 | (8'hbd))}} - $unsigned(($unsigned(wire50) - (^wire52))))};
        end
      else
        begin
          reg81 <= (wire60[(3'h5):(1'h0)] ?
              (~wire59) : ({{reg66, wire62[(1'h0):(1'h0)]}} ?
                  wire54 : (($signed((8'ha0)) ? reg70[(3'h4):(2'h2)] : wire49) ?
                      (8'hbc) : $signed(reg81[(2'h2):(1'h0)]))));
          reg82 <= ((|reg71[(2'h2):(1'h1)]) ?
              ((~&reg66[(4'hf):(3'h7)]) ?
                  wire63 : (reg71 ?
                      (reg80 ?
                          (wire62 | (8'had)) : $unsigned(wire60)) : ($signed(wire56) ?
                          (wire55 * reg72) : (reg73 ?
                              wire59 : wire62)))) : wire57);
        end
      reg83 <= (reg80[(2'h3):(1'h0)] ?
          ($unsigned(wire61[(3'h7):(3'h6)]) <<< reg72) : $unsigned($signed(wire63[(1'h0):(1'h0)])));
    end
  assign wire84 = $unsigned((8'haa));
  always
    @(posedge clk) begin
      reg85 <= wire49[(1'h0):(1'h0)];
      reg86 <= reg73[(2'h2):(1'h1)];
      reg87 <= wire52;
      reg88 <= (((wire60[(2'h3):(1'h1)] ?
                  ((reg82 ? reg80 : reg75) ?
                      $unsigned(wire51) : wire61[(2'h3):(1'h1)]) : (8'hbb)) ?
              ((!((8'hb9) ? wire60 : reg85)) ?
                  $signed($unsigned(reg72)) : (~&$signed((8'hbd)))) : (~wire60[(1'h1):(1'h1)])) ?
          $unsigned(reg67[(3'h6):(3'h6)]) : $signed((reg65 - $signed($signed(reg71)))));
    end
  always
    @(posedge clk) begin
      reg89 <= ({(+{(reg87 ? wire62 : wire49),
              (reg72 ? (8'h9c) : (8'ha0))})} >= $signed(reg87[(4'hf):(1'h1)]));
      reg90 <= ($unsigned({$unsigned((wire55 > wire62)),
          {wire49[(2'h2):(1'h0)], (reg85 > reg73)}}) >>> {{{((8'haa) ?
                      reg89 : wire61),
                  (~^reg68)},
              (~$unsigned(reg80))},
          $signed($signed(wire56[(2'h3):(2'h2)]))});
      reg91 <= wire51;
      if ($signed(((^~$signed(reg72[(1'h1):(1'h1)])) && (reg82[(3'h6):(3'h4)] ?
          ((^reg76) > (reg72 ?
              reg83 : reg71)) : ($unsigned(reg73) || (wire56 ^ (8'ha4)))))))
        begin
          if ($signed((-reg90[(2'h2):(1'h0)])))
            begin
              reg92 <= (wire58 <<< $signed((wire57 >= reg77)));
              reg93 <= (~^$signed({{$unsigned(wire61), wire60}}));
              reg94 <= $signed({(($signed(reg86) >= (reg78 * reg71)) ?
                      ({reg92, (8'hb0)} >>> wire59) : (~|(reg92 ?
                          reg82 : reg85))),
                  (~|$signed(wire55[(3'h4):(2'h3)]))});
              reg95 <= reg86[(5'h10):(4'hd)];
            end
          else
            begin
              reg92 <= $signed((^(|$unsigned($signed(wire64)))));
              reg93 <= wire63[(3'h5):(3'h4)];
              reg94 <= reg83[(1'h0):(1'h0)];
              reg95 <= reg78;
              reg96 <= $unsigned($signed(reg92));
            end
          reg97 <= $signed((~|reg65));
          reg98 <= wire69[(3'h6):(3'h5)];
          reg99 <= reg90[(2'h2):(1'h1)];
          if ({{$unsigned({(reg91 ? wire52 : (8'h9c)), {reg72}})}})
            begin
              reg100 <= ((|$unsigned({(wire53 ? wire52 : reg75),
                  (|reg72)})) >= ($signed($signed($unsigned(wire55))) != $unsigned(((~^(7'h44)) + (wire51 ^~ wire62)))));
              reg101 <= wire60;
              reg102 <= reg82;
              reg103 <= (((reg102 ?
                  (7'h42) : ($signed(reg72) ?
                      (~|reg78) : (reg65 >> reg98))) >= $unsigned($unsigned((^wire50)))) != (~^wire59[(4'ha):(1'h0)]));
              reg104 <= (reg65 + $signed(($unsigned($unsigned(reg91)) ?
                  $signed(wire56) : $unsigned((reg74 ? wire49 : reg93)))));
            end
          else
            begin
              reg100 <= ((+((wire62[(2'h2):(1'h1)] * (~|(8'ha3))) ?
                  ($unsigned(wire59) * reg92) : $signed(reg82))) || {(~&($unsigned((8'hbe)) < wire52)),
                  wire64});
              reg101 <= $signed(reg95);
            end
        end
      else
        begin
          if ($signed((($unsigned(reg81) >>> ((reg80 ?
                  (8'hab) : reg87) ~^ reg70)) ?
              (-($signed((8'ha1)) ?
                  reg77[(4'hb):(4'h9)] : reg91)) : ($unsigned($unsigned(wire69)) ?
                  {wire60, (reg85 <<< reg92)} : ((reg96 > wire63) ?
                      (-reg71) : $signed((8'ha4)))))))
            begin
              reg92 <= (wire50 ?
                  {{$unsigned((reg71 - wire63))},
                      (+(8'hb2))} : $signed($signed(((&reg81) ^~ (8'haf)))));
            end
          else
            begin
              reg92 <= $signed((~&$unsigned({{reg78, reg102}, wire51})));
              reg93 <= wire51;
              reg94 <= $signed($signed({wire52}));
            end
          reg95 <= (8'ha4);
          reg96 <= $unsigned(reg73);
        end
      reg105 <= reg71[(1'h1):(1'h0)];
    end
endmodule

module module22
#(parameter param44 = (+(~(+((8'h9c) ? ((8'hb5) - (8'ha7)) : ((8'h9f) ? (7'h42) : (8'ha8)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= ($unsigned($signed((wire24 ?
          $unsigned(wire25) : $unsigned(wire24)))) * $signed(wire25));
      reg29 <= $unsigned($signed((~&$signed(((8'hbd) == wire27)))));
      reg30 <= ($signed({$signed((reg29 ? reg29 : wire24))}) ?
          ((~&(~|{reg29, reg28})) ?
              {wire23[(3'h5):(1'h0)],
                  wire26[(2'h2):(1'h1)]} : $unsigned(reg29[(1'h1):(1'h0)])) : wire27);
      if (wire26[(2'h2):(2'h2)])
        begin
          if (reg29[(3'h6):(2'h2)])
            begin
              reg31 <= $unsigned($unsigned((8'ha9)));
              reg32 <= $signed((($unsigned($unsigned(reg28)) ?
                      $signed({reg31}) : reg30) ?
                  {$signed((wire24 ? reg28 : reg30))} : $unsigned({wire27})));
            end
          else
            begin
              reg31 <= $unsigned(({$signed((reg30 ? wire26 : wire27)),
                  $unsigned(reg28[(3'h6):(3'h4)])} ^ ((~|wire26[(1'h1):(1'h1)]) + (8'ha1))));
              reg32 <= wire26;
            end
          reg33 <= (^reg31);
          reg34 <= $unsigned($signed((^$unsigned((wire26 ?
              (8'hae) : wire26)))));
        end
      else
        begin
          reg31 <= wire25[(2'h2):(1'h0)];
          if (($signed(($unsigned(reg30) ?
              $signed((wire24 && reg33)) : reg28)) >> (reg30 ?
              (reg28[(3'h7):(1'h0)] ?
                  reg34 : $unsigned((wire26 >= (8'h9c)))) : wire26[(2'h2):(2'h2)])))
            begin
              reg32 <= reg29[(3'h5):(2'h3)];
            end
          else
            begin
              reg32 <= $signed($signed(reg32[(3'h4):(1'h0)]));
            end
        end
      reg35 <= (|(reg31[(1'h0):(1'h0)] != ($signed(wire25[(1'h0):(1'h0)]) ?
          reg30[(2'h3):(2'h3)] : reg33)));
    end
  assign wire36 = $unsigned(($signed((8'hb8)) ?
                      ((!(reg33 ? wire27 : reg34)) ?
                          ((wire25 ? reg30 : (8'ha8)) ?
                              wire24 : (7'h43)) : reg28[(2'h3):(2'h2)]) : wire27));
  assign wire37 = {reg30};
  assign wire38 = (wire24 ?
                      wire27 : (&((reg29 && ((8'hb2) | wire27)) >>> $signed($unsigned(reg35)))));
  assign wire39 = (($signed($unsigned(((8'ha5) & wire26))) ^~ reg28[(1'h1):(1'h0)]) ?
                      reg32[(2'h3):(1'h0)] : $signed(wire24[(3'h6):(2'h2)]));
  assign wire40 = (-$signed((((8'hb7) ~^ wire36) ?
                      (-wire36) : wire38[(1'h1):(1'h1)])));
  assign wire41 = (($signed(reg29) ?
                      (~((^~wire26) * ((8'hb5) & reg31))) : (((wire37 << reg28) || $unsigned(reg30)) ^~ ($unsigned((8'ha3)) ?
                          $unsigned(reg31) : (~|reg35)))) <<< (8'hb7));
  assign wire42 = {wire39};
  assign wire43 = reg35[(3'h5):(3'h5)];
endmodule

module module181
#(parameter param214 = {(|(((~&(8'hb8)) ^~ ((8'hbc) ? (8'hba) : (8'ha0))) && (~^((8'hb6) ? (8'h9d) : (8'ha0))))), (((^~(!(8'h9c))) ? {((8'hbe) ? (8'hae) : (8'ha5))} : ({(8'ha7)} ^ (-(7'h42)))) ? {((~(8'haa)) + (~(8'h9e)))} : (^(|((8'h9f) ? (8'h9f) : (7'h40)))))}, 
parameter param215 = {param214})
(y, clk, wire186, wire185, wire184, wire183, wire182);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire186;
  input wire signed [(4'ha):(1'h0)] wire185;
  input wire [(5'h13):(1'h0)] wire184;
  input wire [(4'he):(1'h0)] wire183;
  input wire [(4'he):(1'h0)] wire182;
  wire [(5'h13):(1'h0)] wire211;
  wire [(4'ha):(1'h0)] wire210;
  wire signed [(3'h5):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire [(5'h13):(1'h0)] wire207;
  wire [(4'ha):(1'h0)] wire206;
  wire [(4'h8):(1'h0)] wire205;
  wire signed [(4'hf):(1'h0)] wire204;
  wire signed [(4'hc):(1'h0)] wire203;
  wire signed [(2'h2):(1'h0)] wire202;
  wire signed [(4'h8):(1'h0)] wire201;
  wire signed [(3'h7):(1'h0)] wire191;
  wire [(3'h4):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire189;
  wire [(2'h2):(1'h0)] wire188;
  wire [(3'h6):(1'h0)] wire187;
  reg signed [(5'h13):(1'h0)] reg213 = (1'h0);
  reg [(3'h6):(1'h0)] reg212 = (1'h0);
  reg [(5'h12):(1'h0)] reg200 = (1'h0);
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'hd):(1'h0)] reg198 = (1'h0);
  reg [(4'hf):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg196 = (1'h0);
  reg [(2'h3):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg192 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 reg213,
                 reg212,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 (1'h0)};
  assign wire187 = wire186[(1'h1):(1'h0)];
  assign wire188 = (!((~&wire182[(2'h3):(1'h1)]) ?
                       (wire185 ?
                           {$unsigned(wire186),
                               $signed(wire185)} : wire184[(4'hb):(3'h4)]) : wire186[(1'h0):(1'h0)]));
  assign wire189 = $unsigned($unsigned(wire185[(1'h0):(1'h0)]));
  assign wire190 = (((wire182 ?
                       $signed($signed(wire183)) : $signed((wire186 < wire185))) && {$unsigned(wire187[(2'h3):(2'h3)])}) << ((({wire184} != $unsigned(wire187)) - wire183[(4'h9):(3'h7)]) ?
                       $signed(wire186) : (^~(((8'h9f) >> (8'hac)) == (wire184 ?
                           wire187 : wire188)))));
  assign wire191 = wire184[(5'h12):(2'h2)];
  always
    @(posedge clk) begin
      reg192 <= $signed($signed($unsigned($signed($unsigned(wire185)))));
      reg193 <= $signed($unsigned($unsigned(wire185)));
      reg194 <= (wire188 ?
          wire182 : ((~&(8'h9d)) ?
              (($signed(wire185) ^ wire187) ?
                  $unsigned($unsigned(wire186)) : $unsigned($unsigned(wire187))) : wire188));
      reg195 <= wire190;
      reg196 <= (reg195[(1'h0):(1'h0)] ?
          $signed($signed((wire185 >= $unsigned(wire184)))) : ((wire190[(1'h0):(1'h0)] ~^ reg195) ?
              $unsigned((+{reg192})) : (!reg192)));
    end
  always
    @(posedge clk) begin
      reg197 <= $signed($unsigned(wire188[(2'h2):(1'h1)]));
      reg198 <= reg196;
      reg199 <= (reg198[(1'h0):(1'h0)] ?
          wire186 : ((reg192 ?
                  ($unsigned(wire188) && $signed(wire185)) : (reg193[(2'h2):(1'h1)] ?
                      $unsigned(reg197) : reg197[(2'h2):(1'h0)])) ?
              ({reg195[(2'h2):(2'h2)],
                  wire186} == wire187[(1'h1):(1'h1)]) : ($unsigned(wire189[(4'ha):(4'ha)]) <<< wire185)));
      reg200 <= (reg195[(1'h1):(1'h1)] != (|($unsigned(((8'hb7) ?
              reg196 : (8'hba))) ?
          (~&$unsigned(reg197)) : reg193[(1'h0):(1'h0)])));
    end
  assign wire201 = reg194;
  assign wire202 = ($unsigned(reg194[(1'h0):(1'h0)]) ?
                       (~^($signed((reg194 ? wire184 : reg199)) <<< (((8'hab) ?
                               reg197 : wire186) ?
                           ((8'ha4) ? wire188 : wire183) : (reg199 ?
                               reg193 : reg194)))) : wire184);
  assign wire203 = $signed(reg196);
  assign wire204 = wire190[(2'h2):(1'h0)];
  assign wire205 = $unsigned($signed((~&((wire188 != reg197) == $signed(reg198)))));
  assign wire206 = (~|$unsigned(wire191));
  assign wire207 = reg195[(1'h1):(1'h1)];
  assign wire208 = wire201[(3'h4):(2'h2)];
  assign wire209 = wire184;
  assign wire210 = wire184;
  assign wire211 = $unsigned($signed(($signed(wire206[(3'h7):(2'h2)]) ^~ (^wire201[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg212 <= $unsigned({{($signed(reg197) << wire202[(1'h0):(1'h0)]),
              ((~&wire201) < reg195)}});
      reg213 <= $signed($unsigned({($unsigned(reg192) || (wire209 ?
              wire203 : wire201))}));
    end
endmodule

module module162  (y, clk, wire166, wire165, wire164, wire163);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire166;
  input wire [(3'h5):(1'h0)] wire165;
  input wire [(4'he):(1'h0)] wire164;
  input wire [(5'h13):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire [(5'h12):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire [(4'ha):(1'h0)] wire172;
  wire [(5'h12):(1'h0)] wire171;
  wire [(3'h6):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire167;
  reg [(5'h12):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg168 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire167,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire167 = {(wire163 ^ (^~($unsigned(wire166) ?
                           (wire166 ?
                               wire165 : wire163) : wire165[(2'h2):(1'h0)])))};
  always
    @(posedge clk) begin
      reg168 <= wire166[(1'h0):(1'h0)];
      reg169 <= (-wire166[(1'h0):(1'h0)]);
    end
  assign wire170 = ($unsigned(($signed((wire166 ? wire164 : wire167)) ?
                       reg169 : wire167[(4'ha):(3'h7)])) * (!wire164[(3'h4):(2'h2)]));
  assign wire171 = wire165[(3'h4):(2'h3)];
  assign wire172 = reg168[(4'ha):(4'ha)];
  assign wire173 = wire164[(3'h4):(1'h1)];
  assign wire174 = (((wire166[(2'h2):(1'h0)] <<< wire171[(4'h9):(2'h2)]) ^~ (reg168 ?
                           wire164[(4'hb):(4'h9)] : wire164)) ?
                       $signed((-$unsigned({wire164,
                           (8'haa)}))) : wire163[(4'he):(3'h6)]);
  assign wire175 = ((!($unsigned(wire174) ?
                           (wire164[(3'h4):(2'h2)] ?
                               (wire165 == reg168) : wire167[(3'h6):(2'h3)]) : (8'ha3))) ?
                       $signed(wire163[(3'h7):(3'h5)]) : wire171[(1'h1):(1'h0)]);
  assign wire176 = $unsigned((wire175 <<< $unsigned(wire174[(4'hf):(2'h3)])));
endmodule
