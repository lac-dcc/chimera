module top #(parameter param228 = (8'ha3)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire227;
  wire signed [(5'h12):(1'h0)] wire226;
  wire [(4'h8):(1'h0)] wire225;
  wire [(4'he):(1'h0)] wire224;
  wire [(2'h2):(1'h0)] wire223;
  wire [(5'h14):(1'h0)] wire222;
  wire [(4'hf):(1'h0)] wire216;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg221 = (1'h0);
  reg [(5'h10):(1'h0)] reg220 = (1'h0);
  reg [(5'h15):(1'h0)] reg219 = (1'h0);
  reg [(5'h13):(1'h0)] reg218 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire216,
                 wire5,
                 wire4,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1[(4'hf):(4'hc)];
  assign wire5 = ($signed(($unsigned($signed(wire4)) ?
                         $unsigned((~^(8'hbe))) : $signed((wire1 >= wire0)))) ?
                     $unsigned(wire2[(3'h7):(3'h7)]) : (-$unsigned(((wire3 ^~ wire1) == $signed((8'ha3))))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned({(wire2 <<< (~^(wire2 ^ wire2)))});
      reg7 <= $unsigned($unsigned(wire5));
    end
  module8 #() modinst217 (.wire9(wire4), .wire10(wire2), .wire13(wire5), .y(wire216), .wire12(wire3), .wire11(reg7), .clk(clk));
  always
    @(posedge clk) begin
      if ((-$signed((wire0[(3'h7):(3'h7)] & wire3))))
        begin
          reg218 <= ((~&$unsigned(($signed(wire5) + wire5))) ?
              $unsigned((~($signed((7'h41)) != (reg6 - wire5)))) : ($unsigned($unsigned((~|(8'ha1)))) ?
                  $unsigned(((wire3 > (8'hb1)) ?
                      wire4[(1'h1):(1'h1)] : reg7)) : {($unsigned(wire2) ?
                          wire3 : {wire1})}));
          reg219 <= {$signed(((wire2[(4'he):(4'he)] ?
                      $unsigned(wire0) : (reg7 > wire4)) ?
                  wire216 : ($signed(wire0) ?
                      wire3[(5'h10):(4'h8)] : $signed(wire0))))};
          reg220 <= $unsigned((^(((8'hb8) ?
                  (-reg218) : wire216[(4'h8):(3'h5)]) ?
              $signed($unsigned(wire3)) : $unsigned($signed(wire4)))));
        end
      else
        begin
          if (((~&$signed($unsigned(((8'hbf) >>> reg219)))) ?
              wire0[(2'h3):(1'h0)] : ((wire2[(3'h6):(3'h6)] ?
                  ($signed(wire2) == (reg6 ?
                      (8'hbe) : wire0)) : (reg6[(4'h8):(1'h1)] ?
                      wire2 : {wire2})) >= $signed($signed((^~wire1))))))
            begin
              reg218 <= ((wire4[(4'h9):(4'h8)] ?
                  {wire3,
                      $signed({reg220,
                          wire4})} : (^~reg218)) | wire0[(3'h7):(2'h2)]);
              reg219 <= $unsigned((~&(~^((wire0 >> (7'h44)) ?
                  (~&wire5) : (!reg7)))));
              reg220 <= {$signed((~^{{wire4, wire2}, $signed((8'had))}))};
            end
          else
            begin
              reg218 <= ({{(wire4[(1'h0):(1'h0)] ?
                          (reg7 ^~ reg218) : (wire216 >> (7'h41))),
                      $unsigned(wire3[(4'ha):(4'h8)])},
                  (($signed(wire3) - reg218[(3'h7):(1'h1)]) != ($signed(wire216) ?
                      $unsigned((8'ha5)) : $signed(reg7)))} | (($unsigned((^reg219)) ?
                  wire3[(2'h3):(2'h3)] : ($signed(wire1) && (|wire4))) ^~ {(wire3 ?
                      wire0 : reg6[(3'h4):(3'h4)]),
                  ((~&wire5) & ((8'ha7) - wire4))}));
              reg219 <= $signed(reg220);
              reg220 <= (wire4 ^ (^$signed(((&wire216) ?
                  wire3[(5'h10):(4'hb)] : {reg7, wire5}))));
            end
          reg221 <= wire4;
        end
    end
  assign wire222 = ($signed(reg218) ?
                       (reg219 ?
                           $signed((((8'ha2) != wire4) ^ wire216[(2'h3):(2'h3)])) : {((wire1 == (8'ha5)) == (^~(8'hb1)))}) : reg220);
  assign wire223 = reg221[(2'h3):(2'h2)];
  assign wire224 = $unsigned($signed((8'hb4)));
  assign wire225 = $unsigned(((~^wire5[(2'h2):(2'h2)]) - ((~|$signed(reg6)) <<< reg6[(4'h8):(3'h7)])));
  assign wire226 = $signed($signed((($unsigned(reg7) ^ ((8'hb0) > reg219)) ?
                       $unsigned($unsigned(wire225)) : $signed($signed(wire4)))));
  assign wire227 = $signed($signed((8'hb9)));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire214;
  wire signed [(5'h13):(1'h0)] wire190;
  wire [(5'h10):(1'h0)] wire184;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire127;
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  assign y = {wire214,
                 wire190,
                 wire184,
                 wire75,
                 wire18,
                 wire17,
                 wire16,
                 wire14,
                 wire127,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg15,
                 reg129,
                 reg130,
                 (1'h0)};
  assign wire14 = $signed((((wire11 >> $signed(wire11)) + wire11) == (+(8'had))));
  always
    @(posedge clk) begin
      reg15 <= (($signed((^~{wire11})) < (((wire13 ? wire13 : wire10) ?
              wire13[(3'h5):(1'h0)] : (~&wire12)) ?
          wire11[(4'he):(3'h6)] : $signed({wire13}))) | (-wire13[(1'h0):(1'h0)]));
    end
  assign wire16 = $unsigned(wire9);
  assign wire17 = $signed((+$unsigned(wire16[(1'h1):(1'h0)])));
  assign wire18 = $signed((^~(wire12 <<< $unsigned($signed(wire14)))));
  module19 #() modinst76 (wire75, clk, wire13, wire14, wire17, reg15);
  module77 #() modinst128 (wire127, clk, wire12, wire75, wire14, wire11, wire13);
  always
    @(posedge clk) begin
      reg129 <= wire18[(1'h1):(1'h1)];
      reg130 <= $unsigned(((~|wire14) * {$signed($signed(wire75))}));
    end
  module131 #() modinst185 (.wire133(wire16), .clk(clk), .wire135(wire17), .wire136(wire75), .y(wire184), .wire134(wire12), .wire132(reg130));
  always
    @(posedge clk) begin
      reg186 <= (8'hae);
      reg187 <= reg130;
      reg188 <= {(|(|$signed((wire13 ? reg15 : wire12))))};
    end
  always
    @(posedge clk) begin
      reg189 <= {(wire18 ?
              $unsigned(((wire17 ^~ (8'hba)) || ((7'h41) ?
                  wire13 : wire17))) : (reg188[(3'h6):(3'h5)] + {wire18[(3'h6):(3'h4)],
                  $unsigned(wire184)}))};
    end
  assign wire190 = {(reg129 ?
                           (^{reg129, (!wire14)}) : ({wire127[(2'h3):(2'h2)],
                               reg15} ^~ (+(reg187 ? wire14 : (8'ha1))))),
                       (reg189[(3'h6):(3'h6)] ?
                           (~|wire9[(1'h0):(1'h0)]) : reg187)};
  module191 #() modinst215 (.y(wire214), .wire194(wire12), .wire193(wire184), .wire195(wire16), .clk(clk), .wire192(wire190));
endmodule

module module191
#(parameter param213 = ((7'h41) + (8'hb5)))
(y, clk, wire195, wire194, wire193, wire192);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire195;
  input wire signed [(4'hb):(1'h0)] wire194;
  input wire [(4'hb):(1'h0)] wire193;
  input wire signed [(5'h13):(1'h0)] wire192;
  wire [(5'h12):(1'h0)] wire212;
  wire [(4'ha):(1'h0)] wire211;
  wire [(5'h10):(1'h0)] wire210;
  wire [(4'hb):(1'h0)] wire209;
  wire signed [(4'ha):(1'h0)] wire208;
  wire signed [(4'ha):(1'h0)] wire207;
  wire [(3'h4):(1'h0)] wire196;
  reg signed [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg205 = (1'h0);
  reg [(4'h9):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg203 = (1'h0);
  reg [(3'h4):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg200 = (1'h0);
  reg [(5'h12):(1'h0)] reg199 = (1'h0);
  reg [(4'hc):(1'h0)] reg198 = (1'h0);
  reg [(4'hb):(1'h0)] reg197 = (1'h0);
  assign y = {wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire196,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 (1'h0)};
  assign wire196 = $unsigned((($signed((|wire193)) <<< wire192[(3'h4):(3'h4)]) ?
                       (($unsigned(wire194) + (|wire194)) <<< (!(&(8'ha5)))) : wire192[(4'hf):(4'hc)]));
  always
    @(posedge clk) begin
      reg197 <= $signed((|wire196));
      if (($signed($unsigned(wire194[(4'ha):(1'h1)])) ?
          wire196 : wire192[(2'h3):(1'h1)]))
        begin
          reg198 <= $signed((wire196 ? wire195 : wire196));
          reg199 <= $unsigned({(wire193[(3'h5):(1'h1)] <= $unsigned((~^(8'ha0)))),
              (+((wire195 ? reg198 : wire193) ? wire194 : (^~wire194)))});
          reg200 <= $signed($unsigned(wire194));
          if ((^~{$unsigned(((wire192 != wire193) ?
                  $signed(reg200) : {reg198})),
              $unsigned($unsigned((wire194 && wire195)))}))
            begin
              reg201 <= $signed($unsigned($signed({reg199[(4'h9):(4'h9)]})));
              reg202 <= (reg198[(1'h0):(1'h0)] ?
                  wire194 : $signed(wire194[(1'h0):(1'h0)]));
              reg203 <= (-($unsigned(wire192[(3'h4):(1'h1)]) + reg197));
              reg204 <= $signed((+reg199));
              reg205 <= $unsigned($signed($unsigned($unsigned((^reg199)))));
            end
          else
            begin
              reg201 <= {$signed(wire193)};
              reg202 <= wire192;
              reg203 <= $unsigned(wire194[(4'ha):(2'h3)]);
            end
          reg206 <= $signed(reg200);
        end
      else
        begin
          if (reg197)
            begin
              reg198 <= reg200;
              reg199 <= reg204[(4'h9):(4'h8)];
              reg200 <= $signed($unsigned($signed(($unsigned((8'had)) ?
                  reg199[(4'h8):(3'h4)] : reg199[(4'hd):(4'ha)]))));
            end
          else
            begin
              reg198 <= $unsigned($signed((((reg201 ?
                  reg199 : reg203) ~^ reg203[(5'h11):(4'hd)]) >> (+(~|reg205)))));
              reg199 <= reg198;
              reg200 <= (^$unsigned($unsigned((wire195[(2'h2):(2'h2)] ?
                  (+(8'ha0)) : (reg197 >= wire195)))));
              reg201 <= $signed(reg206);
              reg202 <= reg204[(3'h4):(3'h4)];
            end
          if ({reg199, $signed(wire194)})
            begin
              reg203 <= $signed(((($unsigned(reg205) ? (^~reg205) : reg198) ?
                      wire194[(1'h0):(1'h0)] : $unsigned($signed(reg200))) ?
                  (^{$signed(wire194), (8'ha6)}) : $signed(reg197)));
              reg204 <= reg202[(3'h4):(2'h2)];
              reg205 <= (reg205[(4'he):(4'hb)] * (reg205 & ((reg202[(3'h4):(1'h0)] | {reg206}) ?
                  (^~(~|reg198)) : (reg202 ?
                      $signed((8'hbf)) : (reg202 * (8'h9d))))));
            end
          else
            begin
              reg203 <= $unsigned(reg199);
              reg204 <= wire192[(4'hb):(1'h0)];
            end
          reg206 <= ($unsigned($signed(($signed(reg199) <= wire196))) ?
              reg204 : reg198);
        end
    end
  assign wire207 = reg200[(3'h5):(1'h0)];
  assign wire208 = {({$unsigned(wire195[(2'h3):(2'h2)]),
                           (&reg197[(2'h3):(2'h3)])} ^~ ((8'ha7) == (^~$unsigned((8'hac))))),
                       reg198[(3'h5):(1'h0)]};
  assign wire209 = ($unsigned($unsigned(reg205)) << $signed((((reg201 ^~ reg203) ?
                       (^~wire193) : (~&reg199)) <= {(reg206 != wire192)})));
  assign wire210 = wire193;
  assign wire211 = (~&$signed(reg198));
  assign wire212 = (!(&$signed((^~wire209))));
endmodule

module module131
#(parameter param183 = (&{(8'hb6)}))
(y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire136;
  input wire [(2'h3):(1'h0)] wire135;
  input wire signed [(3'h4):(1'h0)] wire134;
  input wire [(5'h14):(1'h0)] wire133;
  input wire signed [(4'hf):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire171;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(3'h4):(1'h0)] wire169;
  wire signed [(5'h15):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire137;
  reg signed [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg176 = (1'h0);
  reg [(4'h8):(1'h0)] reg175 = (1'h0);
  reg [(5'h15):(1'h0)] reg174 = (1'h0);
  reg [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(3'h7):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(4'hd):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(4'hb):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg140 = (1'h0);
  reg [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(2'h2):(1'h0)] reg138 = (1'h0);
  assign y = {wire182,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire137,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
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
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire137 = (!(((8'ha8) ? $signed({wire136}) : wire132) ?
                       wire133 : (~|($unsigned(wire136) < $unsigned(wire135)))));
  always
    @(posedge clk) begin
      if ((^(-$signed($signed(wire137[(4'h8):(3'h4)])))))
        begin
          reg138 <= (((((wire134 >= wire132) * wire134[(1'h1):(1'h1)]) || wire134) ?
              ((wire135[(2'h2):(2'h2)] >>> $signed(wire135)) > (wire137 + ((7'h40) + wire137))) : wire133) && {$signed(wire136[(2'h2):(1'h1)]),
              $unsigned((&(wire136 >> wire137)))});
          reg139 <= ((wire133[(3'h6):(2'h2)] >= ($signed($unsigned(wire132)) ?
                  (-wire132[(4'hf):(3'h7)]) : $unsigned((wire134 ~^ wire134)))) ?
              (($unsigned($signed(wire134)) ?
                      ($signed(wire135) ?
                          (wire135 ?
                              wire135 : reg138) : wire132) : wire134[(3'h4):(2'h3)]) ?
                  $unsigned({{wire135}}) : {wire133[(4'hb):(4'ha)]}) : $unsigned((({wire132} ?
                      (wire132 ? wire137 : wire136) : (-wire134)) ?
                  ((wire133 ?
                      wire135 : wire136) | (^~wire135)) : reg138[(1'h0):(1'h0)])));
          reg140 <= ($signed(wire133[(3'h4):(1'h1)]) ?
              {{$unsigned((-wire134)), (8'h9e)},
                  wire134[(3'h4):(3'h4)]} : (~&{({wire136,
                      reg139} <= (!wire133)),
                  {$signed(wire132)}}));
          reg141 <= $signed((~wire136[(4'h8):(4'h8)]));
          reg142 <= (reg140 ? wire136 : wire136);
        end
      else
        begin
          if (reg141[(1'h1):(1'h1)])
            begin
              reg138 <= ({(~|wire134[(3'h4):(3'h4)]), $signed(reg138)} ?
                  (^((((8'h9c) <= wire136) ?
                          $unsigned((8'h9f)) : (reg138 == wire137)) ?
                      reg141 : reg142[(2'h2):(2'h2)])) : ($signed((wire134[(1'h1):(1'h1)] ^~ (wire133 ?
                      wire136 : wire137))) + $signed({wire134,
                      ((8'hb3) > reg138)})));
              reg139 <= $unsigned($signed((((-wire136) ?
                  (reg139 ?
                      reg142 : reg142) : $unsigned(wire133)) && $signed(reg140))));
              reg140 <= $signed(wire135);
              reg141 <= ($signed(wire133) ?
                  ((~&(-(wire137 ^~ (8'hbc)))) == wire135) : {({$signed(wire132),
                          (reg139 ? wire133 : wire133)} - {$signed(wire134)}),
                      wire136[(5'h15):(4'hd)]});
              reg142 <= wire137[(4'h9):(4'h9)];
            end
          else
            begin
              reg138 <= (wire137[(4'hc):(3'h6)] ?
                  $signed(reg140[(1'h1):(1'h0)]) : reg141[(1'h1):(1'h0)]);
              reg139 <= $signed($unsigned((wire134 == ((&wire133) * (wire137 ?
                  wire136 : reg140)))));
              reg140 <= reg142[(4'h9):(4'h8)];
              reg141 <= $unsigned(((wire132 ?
                  {(~reg142)} : reg138) == {(7'h41)}));
            end
          reg143 <= wire132;
          reg144 <= $signed(((-reg138[(2'h2):(1'h0)]) >> reg139));
          reg145 <= $signed((^~(~&$unsigned((reg139 ? reg139 : wire135)))));
        end
      reg146 <= ((wire136[(5'h10):(2'h2)] ?
          ((8'hb8) ?
              (~$signed(reg141)) : (~&$unsigned(wire137))) : (~|reg142[(3'h4):(2'h2)])) << (!$unsigned(wire135[(1'h0):(1'h0)])));
      if ((|$unsigned({(((8'haf) ? wire136 : wire137) ?
              (wire135 ? reg146 : (8'h9d)) : $unsigned(reg140)),
          $signed({(8'hb7), reg138})})))
        begin
          reg147 <= (reg145 ?
              (($signed((reg139 ? reg139 : wire132)) <<< $signed(((8'hba) ?
                      wire136 : wire132))) ?
                  {$signed(reg138),
                      wire137} : reg138[(2'h2):(1'h0)]) : $signed($unsigned(((reg141 ?
                  reg140 : wire132) + $unsigned(reg143)))));
          reg148 <= {($unsigned(wire133) ?
                  wire134[(3'h4):(3'h4)] : (({reg140, reg141} ?
                      (reg147 ?
                          reg141 : reg145) : (wire137 != reg141)) >= wire132))};
          reg149 <= wire133[(1'h1):(1'h1)];
          reg150 <= (-($signed(((reg148 | wire135) ?
                  reg139 : (reg144 & (7'h41)))) ?
              (~&reg143[(3'h7):(3'h6)]) : (+reg141)));
        end
      else
        begin
          reg147 <= (reg138 ?
              (&{((~&wire134) ?
                      $signed((8'hb4)) : (reg141 ? wire134 : wire132)),
                  ((reg149 + wire134) & {(8'ha2)})}) : (wire132 ?
                  (8'hb4) : $unsigned((~^wire133))));
          if (((^~reg148) ?
              $signed($signed(((reg149 ? reg138 : (8'h9e)) ?
                  $signed(reg149) : (reg140 ^ reg141)))) : wire133))
            begin
              reg148 <= reg140[(1'h0):(1'h0)];
            end
          else
            begin
              reg148 <= (!$signed((((reg145 ? (8'ha2) : wire133) ?
                      reg140[(4'h8):(3'h5)] : (^reg142)) ?
                  reg150 : $unsigned($signed(reg143)))));
            end
        end
      reg151 <= $unsigned(wire135);
      reg152 <= reg148;
    end
  always
    @(posedge clk) begin
      if ((reg146 ? reg146 : reg149[(4'hc):(1'h1)]))
        begin
          reg153 <= ($signed($signed($signed($signed(reg140)))) ?
              {(($unsigned(reg145) ? (8'ha4) : (reg139 - wire133)) ?
                      ($signed(reg150) < reg142) : (reg138[(1'h0):(1'h0)] ?
                          $unsigned(wire132) : (reg143 ? reg145 : reg142))),
                  wire133[(5'h11):(3'h7)]} : ((reg148 - reg150) <<< (wire134 & reg139[(1'h0):(1'h0)])));
          reg154 <= {{$unsigned(($signed(reg138) ?
                      reg143[(2'h3):(2'h3)] : reg140[(1'h0):(1'h0)])),
                  reg150[(2'h2):(1'h1)]}};
        end
      else
        begin
          if (reg139)
            begin
              reg153 <= (!$unsigned(wire135[(2'h2):(2'h2)]));
              reg154 <= $signed($signed($signed($signed(((8'ha1) ?
                  reg150 : reg146)))));
              reg155 <= wire136[(1'h1):(1'h0)];
              reg156 <= reg152;
            end
          else
            begin
              reg153 <= $unsigned(((((wire134 || (8'hb6)) ?
                      (~reg155) : $signed(reg149)) ?
                  ((reg145 ?
                      reg144 : reg151) - reg142[(3'h7):(3'h4)]) : reg143[(4'hc):(4'h8)]) >= $unsigned(reg146)));
              reg154 <= (wire135[(1'h0):(1'h0)] ?
                  ($signed({wire136[(5'h13):(4'hb)], {reg141}}) ?
                      ((reg154[(3'h5):(1'h1)] > (&reg154)) ?
                          reg144 : (8'ha5)) : (^~reg150[(1'h1):(1'h0)])) : reg145);
            end
          reg157 <= (($unsigned($unsigned($signed(wire133))) ^~ $signed(($signed(reg140) || reg140))) ?
              (~|$unsigned((8'ha1))) : (8'ha3));
          if ($unsigned($unsigned($signed($unsigned((wire134 ?
              reg148 : (8'ha4)))))))
            begin
              reg158 <= $signed(wire136[(4'hc):(3'h4)]);
              reg159 <= (((((reg139 ? reg154 : reg158) ?
                              (reg144 <<< reg149) : wire137) ?
                          $unsigned($signed((8'ha4))) : (&((7'h42) << reg158))) ?
                      reg138[(2'h2):(2'h2)] : $signed(reg140)) ?
                  reg138[(2'h2):(1'h0)] : wire133[(3'h6):(3'h5)]);
            end
          else
            begin
              reg158 <= $unsigned(($unsigned((reg156[(1'h0):(1'h0)] | $signed(reg149))) ?
                  $signed((~&(reg145 ? reg146 : wire136))) : reg152));
              reg159 <= $signed(($unsigned(reg142) & (8'hbf)));
              reg160 <= (reg152[(4'ha):(3'h5)] ?
                  ((reg157[(2'h3):(2'h2)] ?
                      (+reg149) : reg150) > ($unsigned($signed(reg149)) - ($unsigned(reg157) >> (wire132 >> reg144)))) : ((wire135 ?
                          $unsigned($unsigned(wire135)) : reg140[(2'h3):(2'h2)]) ?
                      $signed($signed((wire135 | reg138))) : (((reg147 ?
                                  reg154 : reg158) ?
                              ((8'hb0) == (8'hb1)) : (8'hbf)) ?
                          (wire137[(4'he):(4'ha)] ?
                              $unsigned(reg140) : reg140) : reg154)));
              reg161 <= wire135;
            end
          reg162 <= (~&({reg139[(1'h0):(1'h0)]} ?
              {reg148} : {(&(reg158 && reg140)),
                  ((reg149 ? wire136 : (8'hbd)) >= (+reg154))}));
        end
      reg163 <= $unsigned((((!$unsigned(reg145)) <<< (~(!reg158))) ?
          reg145 : (($signed(reg143) ?
              $unsigned((8'hb9)) : (reg156 * reg139)) != $signed($signed(reg142)))));
      reg164 <= {reg151, reg149[(3'h6):(2'h2)]};
      reg165 <= ($signed($unsigned($unsigned((reg141 | reg144)))) >= {reg151[(2'h2):(1'h1)],
          reg141});
      reg166 <= reg147;
    end
  assign wire167 = (-reg147[(4'hd):(4'h8)]);
  assign wire168 = $unsigned($unsigned((8'hb3)));
  assign wire169 = (~^{$unsigned(reg149[(3'h4):(2'h2)]),
                       reg142[(3'h4):(2'h2)]});
  assign wire170 = (^$signed($signed((((8'had) ?
                       reg156 : reg156) + (~reg156)))));
  assign wire171 = (reg163 + (((8'h9c) | $signed({reg139})) ?
                       reg156 : (((|reg152) > $unsigned(reg148)) ?
                           reg140 : ((^~reg152) >>> $unsigned(reg143)))));
  assign wire172 = reg153[(4'he):(4'h9)];
  always
    @(posedge clk) begin
      reg173 <= (-$unsigned({(-$unsigned((8'ha8))), (~(~^reg157))}));
      if ({reg147, wire172[(3'h5):(1'h1)]})
        begin
          reg174 <= $signed((8'hbc));
          reg175 <= ($signed($unsigned(wire169[(1'h1):(1'h1)])) ?
              $unsigned($signed($signed(reg140[(2'h2):(1'h1)]))) : $unsigned($unsigned(reg155)));
          reg176 <= $unsigned($signed(wire135));
        end
      else
        begin
          reg174 <= $signed($signed({(reg143 || (reg157 ? (8'hb1) : reg143))}));
          reg175 <= $signed({(|(wire133 ?
                  $unsigned((8'ha7)) : (reg159 ? reg174 : reg166)))});
          reg176 <= reg140;
          reg177 <= ($signed(reg162) ?
              $signed(reg156) : (|(({reg175, reg139} == (reg164 ?
                  reg148 : (8'h9f))) && {$unsigned(wire134)})));
          reg178 <= ((reg165 != reg176[(2'h3):(1'h0)]) ?
              ($signed($unsigned(reg154[(3'h4):(1'h1)])) < (~&(((8'hac) ?
                      wire168 : reg163) ?
                  (^~(8'h9c)) : (8'h9e)))) : $signed((reg165 ?
                  (+$unsigned((8'hba))) : ((reg145 ? reg161 : (8'hae)) ?
                      reg147[(4'hb):(1'h0)] : reg140[(3'h6):(2'h3)]))));
        end
      reg179 <= ((~&$unsigned($unsigned($signed(reg176)))) - reg158[(1'h1):(1'h1)]);
      reg180 <= (((wire136 ~^ ($signed(reg152) ?
              (reg174 * reg176) : {(7'h40)})) >= ((~(reg160 | reg147)) ?
              reg140 : ((reg165 ? reg157 : wire132) - $unsigned(reg179)))) ?
          reg142 : ((wire171 ^ reg156) && ({{reg159, wire137}, (^~reg141)} ?
              $signed($signed(reg150)) : (~reg151))));
      reg181 <= {$unsigned((~^((reg145 - wire169) <<< (reg179 ?
              reg179 : (8'hbc)))))};
    end
  assign wire182 = reg158[(4'h8):(2'h2)];
endmodule

module module77
#(parameter param126 = ((((((8'ha6) > (7'h44)) ? (8'had) : ((8'hbc) ^~ (8'haa))) ? (^~(|(8'hb7))) : ({(8'hbb)} ? (!(8'h9c)) : ((8'hac) && (8'hbd)))) ? ({(^~(8'haa)), ((8'h9c) ? (8'ha7) : (7'h41))} <<< {((8'hb7) ? (7'h41) : (8'hb6))}) : {(((7'h41) != (8'ha7)) - {(8'hb4)})}) ? (({((8'ha0) && (8'hb4))} <<< (^~(~|(8'had)))) ? {(((8'h9f) >= (8'haa)) >> (&(7'h43)))} : (({(8'ha9)} == (+(7'h40))) - (((8'ha8) ? (7'h43) : (8'hb3)) ? ((8'ha0) ? (8'hbd) : (8'had)) : ((8'hb6) ? (8'hb9) : (7'h42))))) : ((~|((~|(8'h9e)) * {(8'ha0)})) ? ((8'hba) * (~^((8'ha4) & (8'hb9)))) : {{((8'ha2) - (8'had)), {(8'h9f)}}, (((8'hbe) ? (8'hbc) : (8'hb1)) ? ((8'hab) * (7'h40)) : ((8'haf) ? (8'ha4) : (8'hb9)))})))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(4'h9):(1'h0)] wire81;
  input wire [(4'hf):(1'h0)] wire80;
  input wire [(3'h7):(1'h0)] wire79;
  input wire signed [(4'ha):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
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
                 reg84,
                 reg83,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(({(wire82 ? wire79 : wire81), wire81} ?
              $unsigned(wire79) : wire80)) ?
          {$unsigned((+wire80[(4'h9):(3'h4)]))} : (~$unsigned(wire78))))
        begin
          if ($unsigned($unsigned({((wire82 ? wire81 : wire80) ?
                  (wire81 <= wire81) : $signed(wire80)),
              {(wire78 & wire78), wire78}})))
            begin
              reg83 <= {((((!wire82) ?
                      wire78 : $unsigned((8'hb2))) < wire79[(1'h1):(1'h1)]) ~^ $unsigned($unsigned($unsigned(wire79)))),
                  $unsigned((($unsigned(wire81) ?
                      wire79 : wire80) || $signed(wire82)))};
              reg84 <= (((|$signed((^wire81))) ?
                      (wire80 ?
                          wire78[(3'h6):(1'h1)] : wire80) : $unsigned((+$signed(wire80)))) ?
                  ($unsigned(((8'ha3) ? {reg83, wire80} : {wire82})) ?
                      {($unsigned(reg83) ?
                              ((8'ha6) || wire78) : $unsigned(reg83)),
                          ($signed(wire82) < {(8'ha9),
                              wire78})} : ((wire82 >>> $unsigned(wire79)) * $unsigned((!wire79)))) : {$signed(wire81[(1'h1):(1'h0)])});
              reg85 <= wire82;
              reg86 <= wire78;
            end
          else
            begin
              reg83 <= ($signed(($signed({reg85}) ?
                  ({reg83, wire81} || wire78) : ($unsigned(reg84) ?
                      (wire82 ? reg85 : reg85) : {wire80,
                          wire81}))) >> (~$unsigned($unsigned((&reg86)))));
              reg84 <= $unsigned(($unsigned(((reg86 ?
                  (8'hb7) : wire82) | reg85)) & (8'hb3)));
              reg85 <= (~|wire78);
              reg86 <= (-($signed({$unsigned(wire79), wire82[(2'h2):(1'h1)]}) ?
                  wire82[(4'ha):(3'h7)] : wire79));
            end
          reg87 <= wire79[(3'h5):(3'h5)];
          reg88 <= wire81;
          reg89 <= wire78;
        end
      else
        begin
          reg83 <= {($unsigned((~(^~(8'ha8)))) != (reg89[(4'he):(4'hc)] | (reg88 >> wire78)))};
          reg84 <= (~&reg86[(2'h2):(1'h1)]);
          reg85 <= (8'haf);
          if ((+wire78[(4'h9):(4'h9)]))
            begin
              reg86 <= reg89;
              reg87 <= $unsigned(((~($unsigned(reg88) ?
                  $unsigned(reg86) : {(8'hba)})) | $signed((~|$unsigned(wire82)))));
              reg88 <= wire82[(4'hb):(3'h6)];
              reg89 <= (|(^~$signed($unsigned(reg85[(4'ha):(1'h1)]))));
              reg90 <= (~^reg89[(4'hf):(4'ha)]);
            end
          else
            begin
              reg86 <= wire80[(4'hb):(1'h1)];
              reg87 <= (^~$signed($signed($signed(reg83))));
            end
          if ((reg87[(2'h2):(1'h0)] ?
              $unsigned((~(reg86[(3'h7):(1'h1)] ?
                  wire81[(1'h0):(1'h0)] : reg89[(4'h9):(3'h7)]))) : (reg90[(1'h1):(1'h1)] ?
                  (((wire80 >= wire78) & reg85) ?
                      (reg86[(1'h0):(1'h0)] ?
                          $signed(wire81) : (8'hbd)) : (^(~^(8'hab)))) : (&reg89))))
            begin
              reg91 <= $signed((|(7'h41)));
              reg92 <= reg88[(3'h6):(2'h2)];
              reg93 <= reg89;
              reg94 <= (wire82[(2'h2):(1'h0)] ?
                  (~^{{reg85, reg86}}) : reg84[(2'h2):(2'h2)]);
              reg95 <= $signed(wire81[(3'h5):(2'h2)]);
            end
          else
            begin
              reg91 <= (-(reg88 ?
                  ((reg85[(4'hb):(3'h6)] >> $signed(reg85)) ?
                      wire81 : $unsigned((^~(8'ha1)))) : wire79[(3'h4):(3'h4)]));
            end
        end
    end
  assign wire96 = (((((reg87 ? (8'hae) : reg83) ?
                          reg86[(3'h6):(3'h5)] : (wire79 ? reg85 : wire81)) ?
                      reg95[(1'h1):(1'h1)] : ($unsigned(reg94) != (~&(8'haf)))) != (-($unsigned(wire81) < reg85))) != $signed({$signed(reg93[(3'h7):(3'h7)])}));
  assign wire97 = {$signed((reg92 * wire78))};
  assign wire98 = $signed(reg89);
  assign wire99 = {{reg95}, {$signed(wire79[(3'h6):(2'h2)])}};
  assign wire100 = wire98[(3'h6):(2'h2)];
  assign wire101 = ({(^wire79[(3'h6):(1'h1)]),
                       (~(-(reg87 == reg88)))} | wire81);
  always
    @(posedge clk) begin
      reg102 <= wire82;
      reg103 <= $signed({(-reg86[(1'h0):(1'h0)]),
          $signed($unsigned($unsigned(reg94)))});
      reg104 <= reg87[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg105 <= wire81[(2'h3):(1'h0)];
      if ((($unsigned((reg90[(3'h7):(3'h7)] ?
          reg102[(4'ha):(3'h4)] : (reg87 == (8'ha3)))) >= $signed($signed(((8'ha5) || reg103)))) >> reg92[(3'h7):(2'h2)]))
        begin
          reg106 <= $signed({wire100});
          if ({({wire96[(1'h0):(1'h0)]} * $signed(reg91[(4'hf):(4'h8)])),
              $unsigned($signed((~|(~|(8'ha0)))))})
            begin
              reg107 <= (8'hb4);
              reg108 <= reg84;
            end
          else
            begin
              reg107 <= $signed(wire96[(1'h0):(1'h0)]);
              reg108 <= reg95[(1'h0):(1'h0)];
              reg109 <= (~$signed((~&(~$unsigned((8'hbe))))));
              reg110 <= {($signed(reg105[(1'h0):(1'h0)]) >>> wire81[(3'h7):(1'h0)]),
                  $unsigned($unsigned($signed(reg83)))};
              reg111 <= (^~$signed({$signed((reg93 << wire79))}));
            end
        end
      else
        begin
          if ($unsigned((-{reg94[(2'h2):(2'h2)], wire100[(4'hb):(4'h9)]})))
            begin
              reg106 <= (reg83 ?
                  (wire80[(4'ha):(4'h8)] ?
                      (~&reg90) : $unsigned(((8'hb1) ?
                          (reg85 ? reg91 : reg105) : (wire97 ?
                              reg108 : wire79)))) : $signed(reg92));
            end
          else
            begin
              reg106 <= ($unsigned($unsigned((reg108[(2'h2):(1'h0)] ^ $signed(wire82)))) ?
                  $unsigned(wire96) : $unsigned({$signed($signed(reg104)),
                      (reg110[(2'h2):(1'h0)] ?
                          $signed(reg102) : $signed(reg83))}));
              reg107 <= $unsigned({$unsigned(wire99)});
            end
          reg108 <= wire82[(3'h6):(2'h2)];
          if (reg90[(1'h1):(1'h1)])
            begin
              reg109 <= ({{(+(reg103 * reg83)), wire96[(3'h6):(3'h4)]},
                  $signed(((reg90 ? wire96 : wire80) < (wire82 ?
                      reg83 : reg86)))} < (8'ha6));
              reg110 <= {(^$unsigned($signed((reg93 ? reg104 : wire97))))};
              reg111 <= $signed((reg95[(1'h0):(1'h0)] ?
                  $signed((-$signed(wire97))) : reg88));
            end
          else
            begin
              reg109 <= wire82;
              reg110 <= (|(8'hb3));
              reg111 <= (&((reg91 ?
                      $unsigned((~(8'hac))) : $unsigned($signed(wire81))) ?
                  (^~(~reg93[(1'h1):(1'h1)])) : (-($signed(reg110) ?
                      $unsigned((8'hab)) : (reg95 ? reg109 : (8'ha0))))));
              reg112 <= (($unsigned((~^$unsigned(wire97))) > $unsigned($unsigned(reg107))) & ((|(reg91 ?
                      (-reg106) : wire98[(4'h9):(4'h9)])) ?
                  $signed($unsigned($signed(reg83))) : wire78[(3'h7):(2'h3)]));
              reg113 <= reg107;
            end
          reg114 <= {(~|($signed($signed(reg103)) ?
                  ($signed(wire97) ?
                      $unsigned(reg113) : wire97[(3'h4):(2'h3)]) : $signed($unsigned(reg85)))),
              ($signed((!$unsigned(wire82))) ?
                  $unsigned((~&(~^reg110))) : (reg106[(4'hb):(4'hb)] ?
                      (^$unsigned(wire80)) : {(&reg86)}))};
          reg115 <= (((!(~&wire97[(1'h1):(1'h1)])) ?
              reg90[(1'h1):(1'h1)] : reg114[(3'h6):(1'h0)]) >> wire78[(4'ha):(3'h5)]);
        end
      if ($unsigned($unsigned(((wire99 ?
              $unsigned(wire98) : (reg104 ? reg84 : reg104)) ?
          reg89[(2'h3):(1'h0)] : $unsigned(reg92[(4'h8):(3'h6)])))))
        begin
          reg116 <= wire78;
          reg117 <= (((~|$signed((reg88 | reg104))) ?
                  (~$unsigned($signed((8'hac)))) : {($unsigned((8'hb9)) ?
                          $signed(reg114) : ((8'hbd) >> wire97)),
                      {((8'hae) ? wire97 : reg90)}}) ?
              $signed((((wire96 ? reg104 : reg114) ^~ (^~(8'hb6))) ?
                  (~|$signed((8'hb2))) : ((reg87 ? reg89 : reg92) ?
                      $unsigned(wire98) : (reg87 ?
                          reg94 : wire81)))) : (wire99[(3'h4):(1'h0)] || reg83[(1'h0):(1'h0)]));
          reg118 <= wire82[(4'h8):(3'h7)];
          reg119 <= (~(reg89[(1'h0):(1'h0)] || {$signed(reg118)}));
          reg120 <= reg113[(2'h2):(2'h2)];
        end
      else
        begin
          if ((+wire80[(4'ha):(2'h3)]))
            begin
              reg116 <= reg104;
              reg117 <= wire81[(1'h0):(1'h0)];
              reg118 <= (reg84 << $unsigned({($signed(reg88) >> (reg86 ^~ reg109)),
                  ({wire79, reg114} ?
                      (reg95 ? reg89 : reg108) : (wire99 < wire98))}));
              reg119 <= ((!(|$signed($signed(wire97)))) ?
                  {(reg120 <= wire80)} : ((($unsigned((8'hbf)) ?
                              $signed(reg115) : reg95[(2'h2):(1'h0)]) ?
                          {(-reg110), (-(8'ha8))} : wire81[(3'h4):(1'h1)]) ?
                      (^((&wire101) ?
                          (reg116 ?
                              reg119 : reg93) : wire98[(2'h2):(1'h1)])) : (^~(reg94 == reg114))));
              reg120 <= {$unsigned({$signed({wire100})})};
            end
          else
            begin
              reg116 <= $signed(reg113[(3'h7):(2'h2)]);
              reg117 <= $signed(reg106);
            end
          reg121 <= {(8'hab), wire81[(2'h3):(1'h1)]};
          reg122 <= {$unsigned(($signed((~reg120)) == {$unsigned(wire78)})),
              {($unsigned((reg111 * reg103)) ~^ ($unsigned((8'hb8)) ^ (reg117 ?
                      reg91 : reg104))),
                  $unsigned((-(reg104 ^~ (8'ha9))))}};
          reg123 <= (-($signed((reg113 && reg91[(4'h8):(2'h3)])) << (~&reg104)));
          reg124 <= reg90;
        end
      reg125 <= (|$signed({(^$signed((8'hbf)))}));
    end
endmodule

module module19
#(parameter param73 = (~(|(~|((~^(8'ha8)) ? ((8'ha8) ? (8'hb8) : (8'haf)) : (+(8'haa)))))), 
parameter param74 = {{param73, (7'h42)}})
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire72,
                 wire59,
                 wire58,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire39,
                 wire38,
                 wire37,
                 wire25,
                 wire24,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = $unsigned(((8'h9c) ?
                      (^(wire21[(4'hd):(2'h3)] ?
                          ((8'hbf) ?
                              (8'h9e) : (8'h9f)) : wire20[(1'h1):(1'h1)])) : wire23));
  assign wire25 = (!($unsigned($signed((wire21 ^ wire20))) ?
                      $signed($unsigned(wire24[(2'h3):(1'h0)])) : wire23[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg26 <= (8'h9d);
      if (wire24[(1'h0):(1'h0)])
        begin
          reg27 <= wire20;
        end
      else
        begin
          reg27 <= (^~$unsigned(($signed(wire20[(5'h13):(4'hb)]) ?
              ({wire22, wire25} < (wire24 ?
                  wire23 : (8'hbb))) : {(wire22 != wire25),
                  $unsigned((8'ha8))})));
          reg28 <= ($signed(wire25[(2'h3):(1'h1)]) != {(($unsigned((7'h42)) & {wire24,
                  wire22}) - (wire22 ? (~^(7'h41)) : wire24[(2'h2):(1'h0)]))});
        end
      if ((-(wire24[(2'h2):(1'h1)] >> (($unsigned(wire21) - (wire21 ?
          (8'ha2) : (7'h41))) <<< reg28[(3'h6):(1'h0)]))))
        begin
          if (((reg27[(4'ha):(1'h0)] ?
                  $unsigned(((^(8'ha7)) ^~ ((8'hbc) ?
                      wire22 : wire20))) : (!((wire23 ? wire23 : reg27) ?
                      $signed((8'hba)) : reg28))) ?
              $signed({wire22,
                  ((wire23 ? wire23 : wire24) < wire25)}) : (8'haf)))
            begin
              reg29 <= $unsigned($unsigned($signed($unsigned($signed(reg26)))));
              reg30 <= ($unsigned(($unsigned(wire23[(1'h0):(1'h0)]) ?
                  (wire25 >= wire23) : (8'h9f))) >>> $unsigned((({(8'hb9)} | (~&wire21)) <<< $signed((8'hae)))));
            end
          else
            begin
              reg29 <= (reg30 << (!reg30[(3'h4):(1'h1)]));
              reg30 <= ((~reg27) * ((~($signed(wire25) ? reg29 : (~wire22))) ?
                  (&reg29[(1'h1):(1'h1)]) : (|(^(wire21 ? reg28 : wire25)))));
              reg31 <= wire20[(5'h14):(4'hc)];
              reg32 <= ($unsigned(reg31[(2'h2):(1'h1)]) >>> (~&$unsigned($unsigned(wire22[(1'h1):(1'h1)]))));
              reg33 <= ((~|(&(wire25[(2'h2):(1'h0)] ?
                      (wire21 && wire21) : $signed((8'ha7))))) ?
                  reg29[(1'h0):(1'h0)] : reg26[(1'h1):(1'h1)]);
            end
          reg34 <= (reg32[(4'ha):(4'h9)] ?
              $unsigned($signed((8'ha0))) : wire24);
          reg35 <= (reg26 ?
              wire22 : ($unsigned(reg29) >> {((&reg34) * $signed((8'haa)))}));
          reg36 <= ((8'h9c) <<< (^~(reg28[(3'h4):(3'h4)] + $unsigned((8'haa)))));
        end
      else
        begin
          reg29 <= (~reg35);
          reg30 <= (&(wire24 <<< reg35[(4'h8):(2'h3)]));
          reg31 <= reg32[(5'h11):(4'hf)];
        end
    end
  assign wire37 = wire25;
  assign wire38 = $unsigned(reg27[(4'ha):(1'h0)]);
  assign wire39 = (($unsigned(wire38) <= ({wire23, (~|reg32)} ^~ (reg27 ?
                      $signed(reg26) : {reg29}))) < (+((!((8'hbc) < wire24)) ?
                      ($signed(wire37) >>> $signed(wire23)) : ((reg36 >> reg36) ^ $signed(reg28)))));
  always
    @(posedge clk) begin
      reg40 <= reg30;
      reg41 <= $unsigned($signed($signed((|reg36))));
      reg42 <= reg40;
      reg43 <= $unsigned($signed(reg41));
      reg44 <= $unsigned(wire38);
    end
  assign wire45 = $signed((~^$unsigned($unsigned(reg42))));
  assign wire46 = $signed((reg42 ? wire20[(4'he):(4'he)] : reg44));
  assign wire47 = $unsigned($unsigned({reg31, $signed($unsigned(reg44))}));
  assign wire48 = reg42[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg49 <= ($unsigned(({(wire39 ? reg32 : reg43),
          {reg35, wire23}} >> $signed((reg44 ?
          reg28 : wire25)))) > $signed((~|{{wire24}})));
      if (wire22[(2'h3):(1'h1)])
        begin
          if (((8'hb3) ? (+$signed(reg30)) : $signed(reg33)))
            begin
              reg50 <= (reg44 ~^ (&(~|$signed((^~(8'hbd))))));
              reg51 <= (reg34[(3'h4):(1'h1)] ?
                  {wire45[(2'h3):(1'h0)],
                      wire20[(5'h13):(2'h3)]} : $signed($unsigned(($unsigned(reg34) < (reg34 ?
                      reg42 : (8'had))))));
            end
          else
            begin
              reg50 <= (^(^~((reg30 + (+wire20)) == wire45[(3'h6):(3'h4)])));
            end
        end
      else
        begin
          if ($signed($signed(reg33[(3'h5):(3'h4)])))
            begin
              reg50 <= $unsigned({$signed((~reg26[(2'h3):(1'h0)]))});
              reg51 <= ({reg40[(3'h5):(2'h2)]} >> ((^~(8'hb6)) < $signed((-reg49[(2'h2):(1'h0)]))));
              reg52 <= ((|$unsigned(($signed(reg27) ?
                  (reg50 ?
                      reg34 : wire47) : wire23))) * (+((+$unsigned(reg30)) ?
                  reg44[(4'ha):(4'h9)] : ((reg51 ? reg30 : reg42) ?
                      {(8'hbc), reg42} : ((8'ha0) | reg36)))));
              reg53 <= (reg32[(2'h3):(1'h1)] ?
                  $unsigned((!{(~&reg49),
                      {reg34, reg35}})) : $signed(reg44[(3'h7):(3'h6)]));
              reg54 <= reg26;
            end
          else
            begin
              reg50 <= (-reg49);
              reg51 <= wire47;
              reg52 <= $unsigned($signed(reg29[(2'h2):(2'h2)]));
              reg53 <= wire47;
            end
          reg55 <= (^~wire38);
        end
      reg56 <= (reg50 ? (8'hb6) : (~(^$unsigned((reg53 ? wire48 : reg52)))));
      reg57 <= (({wire21,
          $signed((reg51 & reg26))} < $unsigned($unsigned(reg33[(3'h5):(3'h4)]))) > (~&$signed(wire47)));
    end
  assign wire58 = reg30;
  assign wire59 = (~|(~&(((reg35 ? wire48 : wire22) + reg33) ?
                      {wire24[(1'h1):(1'h0)]} : reg53)));
  always
    @(posedge clk) begin
      reg60 <= wire22[(4'he):(3'h4)];
      reg61 <= {$signed(wire22)};
      if (reg26[(3'h4):(1'h1)])
        begin
          reg62 <= (8'haa);
        end
      else
        begin
          reg62 <= (($unsigned($signed({(7'h44)})) & reg62[(5'h13):(5'h12)]) || (((~wire45[(3'h6):(3'h4)]) ?
              (&((8'haa) > reg30)) : wire20[(4'h9):(4'h8)]) != wire23));
          reg63 <= reg31[(2'h2):(2'h2)];
          if ($signed($unsigned($unsigned(wire38))))
            begin
              reg64 <= (reg40 ?
                  $unsigned(reg31) : {{(~$signed(wire46))}, wire58});
              reg65 <= wire24[(1'h0):(1'h0)];
              reg66 <= $unsigned(((^~{reg49,
                  (8'h9d)}) & ($unsigned(wire58) == $unsigned({reg41}))));
              reg67 <= {$unsigned($signed(($unsigned(reg35) ?
                      $unsigned((8'hae)) : $unsigned(wire20))))};
              reg68 <= $unsigned({($unsigned((wire45 ^ (8'h9e))) && reg62)});
            end
          else
            begin
              reg64 <= $unsigned((~wire21[(3'h6):(2'h3)]));
              reg65 <= $signed((8'h9c));
              reg66 <= reg60;
              reg67 <= {$signed((~reg65))};
              reg68 <= wire21;
            end
          reg69 <= (~^wire39);
          reg70 <= $unsigned(wire20[(4'h9):(2'h2)]);
        end
      reg71 <= reg40[(1'h1):(1'h1)];
    end
  assign wire72 = (reg60 ?
                      (wire48[(1'h0):(1'h0)] * ((((7'h41) ?
                              reg36 : reg56) * ((8'h9e) ? wire47 : wire20)) ?
                          ((reg67 ? reg28 : (8'hbe)) ?
                              (wire25 ?
                                  (8'hac) : reg42) : reg27[(4'h8):(1'h0)]) : wire24)) : ({$unsigned(reg61)} > $signed($signed({wire45}))));
endmodule
