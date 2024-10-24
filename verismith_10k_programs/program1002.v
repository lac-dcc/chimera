module top
#(parameter param199 = (~&((((+(7'h41)) ? (8'hac) : ((8'hb3) ? (8'hbf) : (8'hb2))) <<< ((8'had) ? ((8'hbd) - (8'ha5)) : (~&(8'hb6)))) ? (((^~(8'hb3)) ? ((7'h43) ? (8'hac) : (8'ha2)) : {(8'hb1), (8'ha6)}) ? (^~(~^(8'hbd))) : (8'ha3)) : ((~(~(8'ha1))) ? ((|(7'h40)) ? {(8'hb5), (7'h41)} : (-(8'ha7))) : ({(7'h40)} == ((8'h9d) ? (8'h9f) : (8'hb7)))))), 
parameter param200 = param199)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire198;
  wire [(5'h10):(1'h0)] wire197;
  wire [(3'h6):(1'h0)] wire194;
  wire signed [(5'h14):(1'h0)] wire193;
  wire signed [(2'h3):(1'h0)] wire190;
  wire signed [(3'h4):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire181;
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg [(4'hc):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(5'h14):(1'h0)] reg191 = (1'h0);
  reg [(5'h15):(1'h0)] reg188 = (1'h0);
  reg [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg [(3'h5):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  assign y = {wire198,
                 wire197,
                 wire194,
                 wire193,
                 wire190,
                 wire189,
                 wire5,
                 wire6,
                 wire181,
                 reg196,
                 reg195,
                 reg192,
                 reg191,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = ($unsigned(wire0) == ({$signed(wire2[(2'h3):(1'h0)]),
                     (wire1[(3'h7):(3'h6)] == $unsigned(wire5))} ^~ wire1[(1'h0):(1'h0)]));
  module7 #() modinst182 (.wire11(wire2), .clk(clk), .y(wire181), .wire10(wire3), .wire12(wire5), .wire8(wire4), .wire9(wire0));
  always
    @(posedge clk) begin
      reg183 <= wire3[(5'h11):(4'hf)];
      if (((($unsigned($unsigned(wire6)) ?
                  ($unsigned((8'h9d)) - $signed(wire3)) : $signed(wire181)) ?
              (8'hb7) : ($signed((^~wire4)) < {(wire0 ? wire181 : wire3),
                  wire4[(3'h7):(1'h0)]})) ?
          wire4 : {((^(wire3 >= reg183)) ?
                  (^(wire6 || wire1)) : $signed(wire0[(4'hd):(4'hc)])),
              ((~|wire1[(4'h8):(3'h7)]) << (wire181[(3'h5):(3'h4)] < $signed((8'hb6))))}))
        begin
          reg184 <= wire181;
          reg185 <= wire2;
          reg186 <= {($signed($signed((wire5 - wire3))) * $unsigned($signed(wire5[(4'hf):(1'h1)])))};
          reg187 <= (-$unsigned(reg186[(2'h2):(1'h1)]));
          reg188 <= (&((wire6[(3'h6):(2'h3)] ?
              reg183[(1'h1):(1'h0)] : reg187[(4'hf):(4'hd)]) - reg183));
        end
      else
        begin
          reg184 <= {$signed($unsigned($signed($unsigned(reg188))))};
          reg185 <= {$unsigned(($unsigned($signed(wire4)) >> $unsigned((wire181 ?
                  wire181 : wire3))))};
          reg186 <= wire4;
        end
    end
  assign wire189 = wire3[(3'h4):(2'h2)];
  assign wire190 = wire3;
  always
    @(posedge clk) begin
      reg191 <= (~^$unsigned((reg185[(3'h4):(3'h4)] ^~ reg186)));
      reg192 <= reg186[(2'h2):(1'h0)];
    end
  assign wire193 = wire190;
  assign wire194 = $signed(reg187[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg195 <= (8'h9f);
      reg196 <= $unsigned(wire181);
    end
  assign wire197 = $unsigned($signed({(8'hbc), (^(~^reg188))}));
  assign wire198 = ($unsigned((|(reg196 ^ (reg184 ?
                       wire0 : reg187)))) >>> ({(reg183[(1'h1):(1'h0)] ?
                           wire1[(4'ha):(3'h6)] : wire189[(2'h3):(2'h3)]),
                       $signed(wire0)} != (8'ha7)));
endmodule

module module7
#(parameter param180 = (!{(((8'hae) > (8'hb2)) ^ (-(~^(8'ha4)))), {{((8'hb5) && (8'hae)), ((8'hba) != (8'ha8))}, {((8'hb5) ? (8'hb4) : (8'hb5))}}}))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h1a7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire179;
  wire [(4'ha):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire [(5'h15):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(3'h6):(1'h0)] wire175;
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire66,
                 wire13,
                 wire34,
                 wire68,
                 wire69,
                 wire70,
                 wire86,
                 wire88,
                 wire134,
                 wire136,
                 wire137,
                 wire175,
                 reg87,
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
                 (1'h0)};
  assign wire13 = wire10;
  module14 #() modinst35 (.wire16(wire10), .wire18(wire13), .y(wire34), .wire15(wire11), .clk(clk), .wire17(wire9), .wire19(wire12));
  module36 #() modinst67 (wire66, clk, wire13, wire9, wire11, wire34, wire8);
  assign wire68 = (+((wire66[(4'hd):(4'hb)] ^~ (~&(+(8'hbc)))) ?
                      (wire10 ?
                          wire34[(5'h13):(2'h3)] : ((~wire9) ?
                              (~&wire11) : wire34)) : ($unsigned({wire12,
                          wire66}) || wire9)));
  assign wire69 = wire10[(2'h3):(2'h2)];
  assign wire70 = (((wire13[(4'hc):(3'h7)] & wire68[(4'ha):(3'h4)]) - ((wire8[(4'h8):(1'h0)] ?
                          $signed(wire12) : (wire12 == wire69)) ?
                      ($signed(wire9) < (wire12 ^ wire34)) : $unsigned(wire8[(3'h4):(1'h1)]))) ^ (($signed((~&wire69)) ?
                      $signed($unsigned(wire66)) : (-(wire10 & wire10))) > ($signed((wire8 < (8'hb5))) ?
                      (^(~|wire11)) : (((8'had) << wire11) > (wire13 <<< wire12)))));
  always
    @(posedge clk) begin
      reg71 <= wire69[(3'h5):(3'h5)];
      if ((wire9 ?
          {(wire8[(1'h0):(1'h0)] ? (~&(~^wire11)) : {wire13}),
              ((wire66[(5'h14):(5'h10)] <= wire69) ?
                  ((wire68 ?
                      wire12 : wire13) != wire8[(2'h3):(2'h2)]) : wire69)} : $unsigned($signed(wire11[(2'h3):(2'h2)]))))
        begin
          if ((({wire13[(5'h12):(3'h7)],
              wire68[(4'he):(3'h4)]} == (|(~&$unsigned(wire69)))) ~^ (wire66[(4'hf):(4'he)] ?
              (~&$signed({wire66, wire8})) : wire69)))
            begin
              reg72 <= ($signed(wire66) ? wire34[(3'h7):(1'h0)] : wire66);
              reg73 <= (~&wire69[(3'h5):(1'h0)]);
              reg74 <= $signed((7'h40));
              reg75 <= wire70;
            end
          else
            begin
              reg72 <= $unsigned(wire9);
              reg73 <= reg74[(3'h4):(3'h4)];
            end
          reg76 <= (({reg74[(4'hb):(3'h6)]} ?
              (((reg74 ? reg73 : reg73) >> (wire11 ?
                  wire8 : wire12)) <= ((^~wire8) ?
                  wire12 : (wire8 ?
                      wire70 : wire68))) : (wire34[(4'h8):(3'h4)] ?
                  (((8'h9d) + reg71) >> wire13) : $unsigned((reg73 ^ reg72)))) - (reg72 >= {(!wire70[(1'h0):(1'h0)]),
              wire9[(1'h1):(1'h0)]}));
        end
      else
        begin
          reg72 <= $signed((($unsigned($unsigned(reg74)) ?
              ((wire34 ?
                  (8'ha9) : wire34) < $signed((8'ha3))) : reg73[(5'h10):(5'h10)]) + ((~$signed(wire66)) * ((reg73 || wire12) ?
              $signed(wire10) : $unsigned((8'hab))))));
        end
      if ($signed($unsigned($unsigned($signed(reg76[(3'h4):(1'h0)])))))
        begin
          reg77 <= $unsigned(reg71[(4'he):(3'h7)]);
          if ((&(!reg76[(2'h3):(2'h3)])))
            begin
              reg78 <= (~&wire68);
              reg79 <= $unsigned({((~(reg71 ? wire12 : wire10)) ?
                      {(8'had)} : $signed($signed((7'h42)))),
                  $signed((8'hb7))});
              reg80 <= (8'ha0);
              reg81 <= $unsigned($unsigned(wire34));
              reg82 <= $signed((~&reg79[(4'h8):(3'h4)]));
            end
          else
            begin
              reg78 <= $unsigned((8'hbb));
              reg79 <= (&$unsigned(wire13[(1'h0):(1'h0)]));
              reg80 <= ((-$unsigned(((reg78 ? wire66 : (7'h42)) != {wire68,
                  reg72}))) <= $signed(reg76[(3'h4):(2'h3)]));
              reg81 <= (|(wire8[(4'he):(4'hd)] ?
                  reg74[(2'h3):(2'h2)] : {((wire9 ?
                          wire9 : wire11) || reg81)}));
              reg82 <= (($signed(wire10[(1'h0):(1'h0)]) > reg74[(4'ha):(1'h0)]) ?
                  ($signed(reg82[(2'h3):(2'h2)]) << $signed($unsigned((reg78 ?
                      wire13 : wire12)))) : $signed($signed((~^wire66[(5'h11):(2'h3)]))));
            end
          if (wire66[(3'h5):(3'h5)])
            begin
              reg83 <= wire10[(3'h5):(2'h3)];
              reg84 <= wire13[(3'h5):(3'h5)];
            end
          else
            begin
              reg83 <= {(&(($signed(reg76) ?
                      reg80 : $signed(reg83)) || (wire13 ?
                      $unsigned((8'ha3)) : $unsigned(wire34)))),
                  {$signed(wire12)}};
            end
        end
      else
        begin
          reg77 <= $unsigned((~|reg84[(3'h6):(2'h3)]));
          if ({$signed(reg74)})
            begin
              reg78 <= {$unsigned($unsigned((!(~reg84))))};
            end
          else
            begin
              reg78 <= $unsigned($signed($unsigned($signed(reg84[(4'hc):(3'h6)]))));
              reg79 <= reg76[(4'h9):(1'h0)];
              reg80 <= (~&reg74[(4'h9):(3'h5)]);
              reg81 <= reg74;
              reg82 <= (((reg75[(1'h1):(1'h0)] ?
                      ((wire66 ?
                          reg84 : wire66) | $unsigned(reg74)) : (8'h9f)) ?
                  $unsigned((~^(reg72 > wire9))) : (wire13[(2'h2):(1'h1)] <= (~|(~wire68)))) < $signed(reg71));
            end
          if (reg71)
            begin
              reg83 <= ({wire8[(4'ha):(2'h3)],
                      ((~&wire12[(4'hf):(4'hc)]) | wire10)} ?
                  $unsigned((~&((7'h44) + $signed(reg77)))) : {$signed($signed((-reg82))),
                      {((~^reg75) ?
                              (wire69 ? reg71 : reg76) : $signed(wire70))}});
              reg84 <= {$unsigned(($unsigned((~wire9)) ?
                      wire10[(3'h7):(2'h3)] : wire8))};
              reg85 <= {$signed({(|$unsigned(reg78))}),
                  ((wire12 & (reg79 ?
                      (+reg81) : (^~reg72))) - reg73[(3'h6):(3'h5)])};
            end
          else
            begin
              reg83 <= {$unsigned((~^$unsigned((~^reg72))))};
              reg84 <= $unsigned(({$unsigned(reg76[(4'hb):(4'h9)])} | reg75));
              reg85 <= (^$signed(wire8[(3'h5):(3'h5)]));
            end
        end
    end
  assign wire86 = $unsigned(({((reg82 << reg77) ?
                          $signed(reg78) : {reg79, reg79})} ^~ wire12));
  always
    @(posedge clk) begin
      reg87 <= $signed(reg77);
    end
  assign wire88 = reg80[(1'h1):(1'h0)];
  module89 #() modinst135 (.wire92(reg73), .clk(clk), .wire90(reg71), .wire93(reg76), .y(wire134), .wire94(reg81), .wire91(reg80));
  assign wire136 = wire68;
  assign wire137 = (reg84[(4'ha):(1'h0)] ?
                       $unsigned((wire13[(4'he):(4'ha)] * (~^reg73))) : (reg78[(1'h1):(1'h1)] ?
                           (^~(((8'ha4) * reg75) ?
                               reg80 : (&wire70))) : $signed($signed(wire34))));
  module138 #() modinst176 (wire175, clk, wire13, wire134, reg73, wire66);
  assign wire177 = $signed(reg73[(3'h4):(3'h4)]);
  assign wire178 = $unsigned((~{(8'hb2)}));
  assign wire179 = wire8[(4'hf):(2'h2)];
endmodule

module module138
#(parameter param173 = (~((^(((8'haf) <= (8'hb3)) * (~&(8'had)))) ? (-(|((7'h42) ? (8'hb2) : (8'hae)))) : (~&(((8'hb4) ? (8'hbf) : (8'hb0)) ? ((8'h9f) ? (8'ha7) : (8'hbc)) : (-(8'ha6)))))), 
parameter param174 = (((^(&param173)) ? (~|((param173 ? param173 : param173) > (param173 ? (8'h9e) : param173))) : param173) ? {param173, (((~|param173) ? (param173 ? (8'hb7) : (8'hb3)) : (~&param173)) ? ((param173 ? (7'h44) : param173) && (param173 ? param173 : param173)) : param173)} : param173))
(y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire142;
  input wire [(4'he):(1'h0)] wire141;
  input wire [(4'he):(1'h0)] wire140;
  input wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire172;
  wire signed [(5'h14):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(5'h15):(1'h0)] wire163;
  wire signed [(3'h6):(1'h0)] wire143;
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg [(5'h12):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire165,
                 wire164,
                 wire163,
                 wire143,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
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
                 (1'h0)};
  assign wire143 = ((($signed($signed(wire141)) ?
                           $unsigned(wire141[(4'h8):(3'h4)]) : $unsigned((wire142 == wire141))) ?
                       (((^(8'hb4)) ?
                               $unsigned(wire142) : wire139[(5'h14):(3'h4)]) ?
                           ({wire140} ?
                               wire140 : (wire141 ?
                                   (8'hbb) : wire139)) : wire139) : wire142) << ($unsigned((~wire142[(4'h8):(2'h3)])) <<< wire142));
  always
    @(posedge clk) begin
      reg144 <= $signed(wire140);
      reg145 <= $unsigned((~(($unsigned(wire140) <<< (wire143 ?
          wire141 : wire142)) >>> (~&(8'haa)))));
      if ($unsigned(reg145[(1'h1):(1'h1)]))
        begin
          reg146 <= $signed(wire141[(4'he):(4'hc)]);
          if (wire139[(2'h3):(1'h1)])
            begin
              reg147 <= wire139[(4'hf):(4'he)];
              reg148 <= $unsigned($unsigned(reg145[(3'h5):(2'h2)]));
              reg149 <= (((^~reg145[(3'h7):(3'h6)]) >> (reg144 < $signed((~reg146)))) ?
                  ((^~reg148) >> wire141[(3'h7):(2'h3)]) : wire139);
              reg150 <= ({$unsigned(reg148[(5'h11):(4'hb)]),
                  reg147} < $unsigned(reg148[(4'hd):(3'h5)]));
            end
          else
            begin
              reg147 <= reg145;
              reg148 <= (^~($signed((8'ha2)) ?
                  $signed(($unsigned(wire139) < $signed(wire143))) : {reg144[(2'h3):(2'h3)],
                      (^~(wire142 * reg146))}));
            end
          if (((wire141 - (~|($unsigned(wire140) ?
              $unsigned(wire139) : $signed(reg148)))) == (((~^wire139[(3'h4):(3'h4)]) ?
                  $unsigned(reg148[(5'h10):(4'h8)]) : $signed(reg150)) ?
              (&$signed((reg147 ?
                  (7'h44) : wire140))) : (($unsigned(reg144) > wire143[(1'h1):(1'h0)]) ?
                  (~reg150[(4'ha):(1'h0)]) : wire143))))
            begin
              reg151 <= {wire139[(4'h8):(4'h8)]};
              reg152 <= (^~((wire139[(3'h5):(3'h5)] & (reg144 >= reg147)) ?
                  {$signed((reg150 ? (8'ha7) : reg146)),
                      ((wire142 >= reg145) | {(8'ha6)})} : (reg150 ?
                      $unsigned(reg146[(3'h6):(2'h2)]) : ((~^wire140) != $unsigned(wire142)))));
              reg153 <= {$signed($unsigned(((&wire141) & $unsigned(reg151))))};
              reg154 <= ($signed($signed((~|(reg148 ? (8'ha4) : (8'haf))))) ?
                  (reg146 >= (8'haf)) : (~&{$signed({(8'ha0), reg148})}));
            end
          else
            begin
              reg151 <= wire139[(5'h10):(5'h10)];
              reg152 <= $signed((reg144 ? reg153[(1'h0):(1'h0)] : reg144));
            end
        end
      else
        begin
          reg146 <= (8'ha7);
          reg147 <= $signed({(~&reg145[(4'ha):(2'h3)])});
        end
      reg155 <= ((^(reg153[(2'h2):(1'h0)] ?
          (((8'hab) ?
              reg145 : (7'h40)) || wire141) : $unsigned((+wire142)))) == $unsigned((+(8'hbc))));
    end
  always
    @(posedge clk) begin
      reg156 <= reg146[(3'h4):(1'h1)];
      if ($unsigned(reg150))
        begin
          reg157 <= reg150;
        end
      else
        begin
          reg157 <= $signed(wire139[(5'h12):(4'h9)]);
          reg158 <= (reg149[(4'hf):(1'h0)] * (((^~$unsigned(reg151)) != (+reg149)) < reg148));
        end
      reg159 <= reg144[(3'h7):(2'h3)];
      reg160 <= $unsigned({reg154[(1'h1):(1'h1)],
          (((reg158 ~^ reg152) ? reg154 : $unsigned(reg149)) ?
              reg158 : reg145)});
      reg161 <= $unsigned(reg146);
    end
  always
    @(posedge clk) begin
      reg162 <= $signed($unsigned($signed(reg159)));
    end
  assign wire163 = (reg147 != $unsigned((reg144[(2'h3):(1'h0)] > $signed($unsigned(wire141)))));
  assign wire164 = $unsigned((+(^$unsigned((|wire142)))));
  assign wire165 = ({(^~((^~wire142) ?
                           (&reg155) : (reg161 ? (8'hb6) : reg149))),
                       reg160[(2'h2):(2'h2)]} == (((reg149 ?
                               (~reg147) : (wire163 ? reg149 : reg161)) ?
                           (wire140[(2'h2):(2'h2)] ?
                               (wire142 * reg156) : $signed(wire141)) : ((~wire142) | reg149)) ?
                       ($signed({reg153}) ?
                           ($signed(wire140) & reg162) : wire141[(1'h0):(1'h0)]) : wire164[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      reg166 <= reg152[(2'h3):(2'h3)];
      reg167 <= reg146;
      reg168 <= (^$signed(reg166[(2'h2):(1'h0)]));
      reg169 <= (+(wire163 << (((reg149 ?
              reg147 : (8'ha4)) != $signed(reg149)) ?
          wire142[(3'h4):(1'h1)] : {$signed((8'hbf)), $unsigned((8'hac))})));
      reg170 <= reg168;
    end
  assign wire171 = wire141[(4'hd):(4'h9)];
  assign wire172 = $signed(reg159[(5'h15):(5'h15)]);
endmodule

module module89
#(parameter param132 = {((~&(((8'hbc) | (8'hbf)) < {(7'h42)})) << ((((8'ha8) * (8'hb5)) ? ((8'ha1) ^~ (8'h9f)) : {(8'ha6)}) != (((8'hba) ? (8'hac) : (8'hb5)) ? {(8'hb0)} : ((8'haa) > (8'hb0)))))}, 
parameter param133 = ({((param132 ? {(8'hb3), param132} : param132) ~^ {param132})} || param132))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire94;
  input wire signed [(5'h10):(1'h0)] wire93;
  input wire [(3'h6):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire91;
  input wire [(3'h6):(1'h0)] wire90;
  wire signed [(5'h10):(1'h0)] wire131;
  wire signed [(3'h5):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire128;
  wire [(5'h11):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire [(4'hd):(1'h0)] wire124;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(4'he):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(3'h4):(1'h0)] wire120;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(4'hf):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire95;
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire112,
                 wire102,
                 wire101,
                 wire100,
                 wire95,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire95 = wire91[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= (^~$unsigned(wire93[(4'ha):(4'ha)]));
      if ((~&wire93[(4'he):(1'h1)]))
        begin
          reg97 <= wire91[(3'h4):(1'h0)];
          reg98 <= (~&wire92);
        end
      else
        begin
          reg97 <= $unsigned((!(wire92 ?
              (reg96 ?
                  wire91[(2'h2):(1'h1)] : {(8'hbf),
                      wire91}) : $unsigned((+wire93)))));
        end
      reg99 <= (+reg96[(1'h1):(1'h1)]);
    end
  assign wire100 = ((reg96[(3'h4):(1'h0)] | $signed((!$signed(wire93)))) - reg97[(3'h6):(2'h2)]);
  assign wire101 = $signed(wire94[(4'hb):(4'hb)]);
  assign wire102 = (+wire93);
  always
    @(posedge clk) begin
      if (wire90[(1'h0):(1'h0)])
        begin
          reg103 <= ((8'hac) ?
              ($unsigned(($unsigned(wire100) || $signed(wire100))) || (~&wire90)) : wire102);
        end
      else
        begin
          reg103 <= reg99;
          if (wire102)
            begin
              reg104 <= ((wire95[(4'hd):(4'h8)] == wire92[(1'h1):(1'h1)]) ?
                  wire94[(1'h0):(1'h0)] : (reg96[(1'h0):(1'h0)] ?
                      $signed(($unsigned(wire101) ?
                          wire102 : (8'hb9))) : reg103));
              reg105 <= $signed($unsigned((-{(reg98 ? wire102 : reg103),
                  (|reg98)})));
              reg106 <= ((^$signed(((reg98 ? wire91 : reg96) - reg99))) ?
                  {((~|(~wire90)) && $unsigned($signed(reg103)))} : ((($signed(wire90) ?
                          ((8'ha5) ?
                              wire100 : wire101) : (wire95 ~^ wire93)) == reg96) ?
                      (!{reg103, reg98}) : $unsigned(wire102[(5'h11):(3'h7)])));
              reg107 <= (~|{(($unsigned(wire93) & $signed((8'haa))) && ({wire100,
                          wire102} ?
                      $signed(reg97) : reg104[(1'h1):(1'h0)])),
                  wire102[(4'he):(1'h0)]});
              reg108 <= $signed(reg99);
            end
          else
            begin
              reg104 <= $signed($signed($unsigned(wire95)));
              reg105 <= ($signed($unsigned(($unsigned(wire93) != wire101[(2'h3):(2'h3)]))) ^ ($signed(((|reg96) ?
                  $unsigned(wire100) : ((8'h9e) ?
                      wire101 : reg99))) <<< (-(|$unsigned(wire92)))));
              reg106 <= ($unsigned(((((8'ha5) - wire102) ?
                          (-wire95) : {reg96}) ?
                      $unsigned((wire91 ?
                          reg105 : reg108)) : $unsigned((~&wire90)))) ?
                  (|$signed((reg106[(1'h0):(1'h0)] ?
                      (reg103 + (8'h9d)) : (&wire93)))) : $signed({$signed(reg98[(3'h4):(2'h3)])}));
              reg107 <= ((~{reg107[(2'h2):(1'h0)], (|((8'hb1) | wire90))}) ?
                  $unsigned(({reg96} ?
                      ({reg106, wire101} ?
                          $unsigned(wire92) : $signed(wire91)) : (wire90[(3'h4):(3'h4)] ?
                          $unsigned((8'ha6)) : wire102[(3'h4):(1'h0)]))) : reg99[(3'h7):(3'h4)]);
            end
          reg109 <= ($signed((((~|(8'hbd)) >= $unsigned(reg105)) ?
                  ((~|wire94) << wire91) : $signed((wire91 < reg105)))) ?
              {wire101} : (~&((reg107[(2'h2):(1'h1)] ?
                      {wire91, wire92} : (reg104 | reg98)) ?
                  ($unsigned(wire94) <= reg98[(3'h4):(2'h3)]) : {$unsigned(wire91),
                      (wire100 ? wire93 : wire90)})));
          reg110 <= (reg105 ? reg104 : wire92);
          reg111 <= (reg105[(3'h4):(1'h0)] ?
              $signed((~&reg103[(2'h2):(1'h1)])) : wire94);
        end
    end
  assign wire112 = reg99[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if (wire92[(3'h4):(1'h1)])
        begin
          if ($signed(reg104))
            begin
              reg113 <= $unsigned(wire100);
              reg114 <= ((~|$signed($signed((~^(7'h41))))) - (^reg110));
              reg115 <= (!$unsigned((($unsigned(reg99) ?
                  reg109 : $signed(wire112)) >> ((^(8'hac)) > reg105[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg113 <= $unsigned($signed(((((8'had) ? wire100 : reg97) ?
                  (7'h41) : $signed(reg97)) | ((-reg111) & (reg99 & reg96)))));
            end
          reg116 <= $signed({$signed($signed((wire90 ? wire95 : wire94))),
              {$unsigned((reg106 ? wire92 : wire112))}});
          reg117 <= $unsigned($signed($unsigned({$signed(reg108)})));
          reg118 <= ((($signed((reg115 ? reg106 : reg99)) ~^ wire102) ?
                  reg116 : $signed(reg108)) ?
              $signed($signed(($signed(reg105) >= $unsigned(reg109)))) : reg103);
          reg119 <= ((-$signed({(^reg98),
              (reg110 ? wire91 : reg98)})) == reg118);
        end
      else
        begin
          if ({$unsigned((($signed(reg98) >= reg113) * ({reg107} ?
                  reg98 : (-wire101))))})
            begin
              reg113 <= (8'hb2);
              reg114 <= $unsigned((^$unsigned($signed(((8'hb2) ^~ reg109)))));
              reg115 <= reg97;
              reg116 <= (^$signed(wire100));
            end
          else
            begin
              reg113 <= {{reg113[(2'h2):(1'h1)]}};
              reg114 <= $signed((^~{wire95}));
              reg115 <= (&({(~^$signed((8'ha6)))} ?
                  $signed($unsigned({wire94,
                      reg111})) : ((reg110[(1'h1):(1'h0)] ?
                      (reg117 ? reg108 : reg108) : (wire92 ?
                          wire93 : reg103)) || ($signed(reg117) ?
                      (reg114 ? wire100 : (8'ha8)) : reg111))));
              reg116 <= wire100[(3'h6):(2'h2)];
              reg117 <= reg105;
            end
        end
    end
  assign wire120 = reg104;
  assign wire121 = ((~$unsigned($signed((wire102 ^~ reg119)))) ?
                       ((({reg111} ? reg110 : wire91[(2'h3):(1'h1)]) ?
                           ($unsigned(reg111) ?
                               (^~reg98) : $unsigned(reg109)) : wire90[(3'h6):(1'h1)]) + reg107) : ($unsigned((!{wire101,
                               wire102})) ?
                           $unsigned({reg98, reg99}) : $unsigned(((8'ha6) ?
                               (+reg116) : reg106))));
  assign wire122 = wire121[(1'h0):(1'h0)];
  assign wire123 = $unsigned((8'ha7));
  assign wire124 = $signed(wire95[(4'hb):(4'h9)]);
  assign wire125 = $signed(reg96[(4'h8):(2'h3)]);
  assign wire126 = (8'hb1);
  assign wire127 = $unsigned(((wire120[(2'h2):(2'h2)] == $unsigned(reg105)) ?
                       $unsigned(wire122[(1'h1):(1'h1)]) : reg109));
  assign wire128 = reg115[(1'h0):(1'h0)];
  assign wire129 = wire128;
  assign wire130 = $unsigned(((8'hb2) ^ ($signed(reg115[(2'h2):(1'h0)]) ?
                       $unsigned($signed(reg115)) : $unsigned(wire92))));
  assign wire131 = wire128[(3'h5):(3'h5)];
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire signed [(3'h4):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  input wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire44;
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire44,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg42 <= $signed(wire40[(3'h4):(3'h4)]);
      reg43 <= wire40;
    end
  assign wire44 = $signed((reg42[(4'he):(4'ha)] << $unsigned((8'ha3))));
  always
    @(posedge clk) begin
      reg45 <= wire37;
      if ($signed(wire37[(2'h3):(2'h2)]))
        begin
          reg46 <= $signed(wire37);
          reg47 <= {(8'hae)};
          if ((8'hb8))
            begin
              reg48 <= $signed((~|(((wire38 == reg45) ?
                  (^(7'h42)) : $unsigned(wire41)) <<< (7'h44))));
              reg49 <= (|wire44[(4'h8):(2'h3)]);
              reg50 <= ((&$signed((wire38 < (-(8'ha5))))) >>> (^$unsigned(((-(8'h9d)) ?
                  {(8'ha1), reg46} : $unsigned((7'h41))))));
              reg51 <= ($unsigned($unsigned((reg48 <<< $signed(reg50)))) ?
                  ({((reg49 ~^ wire38) | (+reg46))} ?
                      wire38 : ((~^$unsigned(reg43)) - $signed((8'ha4)))) : (wire39[(1'h0):(1'h0)] + reg48[(5'h12):(1'h1)]));
            end
          else
            begin
              reg48 <= {({(wire37[(3'h6):(3'h6)] >= (^~reg43))} + wire39[(3'h4):(1'h1)])};
              reg49 <= wire38;
            end
          reg52 <= {$unsigned((~|(8'hb2))),
              (~&$unsigned(reg47[(2'h2):(2'h2)]))};
        end
      else
        begin
          reg46 <= ((8'hb2) <= ({(&(reg47 + reg52)),
              wire38} || $signed((!$signed((8'hbc))))));
          reg47 <= ($unsigned(wire39[(2'h2):(1'h0)]) > ($signed($signed($signed((8'ha1)))) ?
              ({$signed(wire44)} << {((8'hab) ? (8'hbb) : wire41)}) : ((reg42 ?
                  ((8'hb1) <<< wire37) : $signed((7'h43))) >> reg46[(1'h1):(1'h1)])));
          reg48 <= ((~&$unsigned((+$signed(reg49)))) ?
              (((^~$signed(wire39)) * (reg43 ?
                  wire44[(3'h5):(3'h5)] : $signed((8'hbe)))) && $unsigned(((reg47 ?
                      (7'h40) : reg43) ?
                  {reg52, reg52} : reg46))) : (!wire39));
          reg49 <= (&(reg49 && ($unsigned(reg51[(3'h6):(3'h6)]) ^ reg52)));
          reg50 <= wire38;
        end
      if ((wire39 <= wire41))
        begin
          if ((8'hb8))
            begin
              reg53 <= $unsigned((8'hb4));
              reg54 <= $signed((8'ha0));
              reg55 <= wire38;
              reg56 <= (^~$unsigned(reg45));
              reg57 <= $signed((|reg43));
            end
          else
            begin
              reg53 <= $signed((~&({(reg45 << reg51)} + $unsigned($signed(reg54)))));
              reg54 <= $signed($unsigned((({wire41} ?
                      $unsigned(reg47) : (reg56 ? wire39 : (8'h9c))) ?
                  ((reg55 ? wire44 : wire37) >= (~(8'hbf))) : (&(wire41 ?
                      reg45 : (8'hb9))))));
            end
          reg58 <= $unsigned((^wire41));
          reg59 <= {$unsigned(reg55[(1'h0):(1'h0)]), reg56[(3'h5):(2'h2)]};
        end
      else
        begin
          reg53 <= reg47;
          if ((^~(!(^($unsigned((8'had)) ^ $unsigned(reg57))))))
            begin
              reg54 <= $unsigned($unsigned((($signed(reg56) - reg59[(2'h2):(1'h1)]) >>> (^$signed(reg53)))));
              reg55 <= reg54[(3'h5):(1'h0)];
              reg56 <= (~&(reg54[(1'h0):(1'h0)] ?
                  reg59[(1'h1):(1'h0)] : wire37[(4'hd):(1'h1)]));
              reg57 <= $signed((8'ha5));
              reg58 <= ($signed((!(8'ha6))) ?
                  {(^(((8'hb4) > reg42) <= (reg45 == reg42)))} : wire39);
            end
          else
            begin
              reg54 <= reg58[(4'h8):(3'h4)];
            end
          reg59 <= ($unsigned({$unsigned((reg56 < reg53))}) ?
              (~^($unsigned(wire40[(2'h3):(2'h2)]) & reg50)) : (reg59[(2'h2):(1'h1)] ?
                  reg59 : (reg53 ? (^reg57[(2'h3):(2'h3)]) : reg57)));
        end
    end
  assign wire60 = $signed((8'ha1));
  assign wire61 = (~(wire39[(2'h3):(1'h0)] ~^ reg47));
  assign wire62 = (wire37 ? $signed({{$unsigned(wire39)}}) : {reg42});
  assign wire63 = {reg55[(1'h0):(1'h0)], $unsigned(wire41)};
  assign wire64 = $signed({(((!wire37) ? (reg46 ? (8'h9e) : (8'haf)) : reg45) ?
                          {{reg56, reg43},
                              (wire38 ^~ reg43)} : ($signed((8'ha3)) == {reg43})),
                      $signed((&(reg45 ? wire63 : wire37)))});
  assign wire65 = {(reg48 << $unsigned(reg57)),
                      (~^$unsigned($unsigned((^(8'hbe)))))};
endmodule

module module14
#(parameter param33 = ((^~({((8'hbe) ^~ (8'had))} ? ({(8'ha8)} ? ((8'hb5) * (8'hbf)) : ((8'hb5) ? (8'h9f) : (8'hb5))) : ((&(8'ha7)) * (+(8'hba))))) ? (&((((8'h9e) ? (8'h9f) : (7'h42)) ^~ {(8'hbd)}) ? {((8'hb4) ? (8'hb5) : (8'h9e))} : (-((7'h40) > (8'hb6))))) : {({((8'hb8) ? (8'hb9) : (8'hb3))} != ((-(8'hb0)) ? {(8'had), (8'hb6)} : (&(8'hba))))}))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg30,
                 (1'h0)};
  assign wire20 = {wire16[(3'h6):(1'h1)]};
  assign wire21 = wire18;
  assign wire22 = (-(~&((-(wire19 ?
                      wire17 : wire20)) ^~ wire16[(1'h0):(1'h0)])));
  assign wire23 = $unsigned(wire18);
  assign wire24 = wire15;
  assign wire25 = $signed($signed((wire23[(3'h7):(2'h2)] ?
                      wire20[(3'h6):(1'h1)] : $unsigned({wire16, wire21}))));
  assign wire26 = $signed((8'hbd));
  assign wire27 = ($unsigned((~|(wire17[(3'h4):(1'h1)] ?
                          (wire16 != wire22) : $signed(wire16)))) ?
                      {($unsigned((~^wire24)) ?
                              (~&wire19) : ((^~wire15) - wire19))} : $unsigned(((wire24 ?
                          $unsigned(wire22) : (^wire18)) && wire17[(1'h1):(1'h1)])));
  assign wire28 = wire27[(4'h9):(3'h5)];
  assign wire29 = (!$signed(wire21));
  always
    @(posedge clk) begin
      reg30 <= (wire22[(1'h0):(1'h0)] ?
          wire27 : $signed($unsigned(({wire22} ?
              (wire22 > wire20) : (wire21 ~^ wire20)))));
    end
  assign wire31 = $unsigned((($signed({wire18}) <<< (((8'hb1) >= wire23) >= (7'h43))) ^~ ((~wire25[(4'h9):(3'h7)]) ?
                      wire26 : {wire21[(1'h0):(1'h0)]})));
  assign wire32 = wire25[(4'h9):(1'h0)];
endmodule
