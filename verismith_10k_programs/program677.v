module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire232;
  wire signed [(3'h5):(1'h0)] wire231;
  wire signed [(3'h4):(1'h0)] wire230;
  wire signed [(5'h11):(1'h0)] wire229;
  wire [(5'h15):(1'h0)] wire228;
  wire signed [(4'hc):(1'h0)] wire227;
  wire signed [(4'hc):(1'h0)] wire226;
  wire [(5'h14):(1'h0)] wire225;
  wire [(4'hc):(1'h0)] wire224;
  wire signed [(4'hf):(1'h0)] wire222;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  assign y = {wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire222,
                 wire25,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $signed((wire2[(1'h0):(1'h0)] ?
                     wire1[(1'h0):(1'h0)] : $unsigned((8'h9e))));
  assign wire6 = (wire1[(1'h1):(1'h0)] < (~{{{wire0, wire4}}}));
  assign wire7 = ((wire5[(4'ha):(3'h7)] + $unsigned(wire4)) ?
                     $signed($signed((7'h41))) : ((^((wire2 ? wire5 : wire4) ?
                         (wire5 ?
                             (7'h42) : wire6) : wire6[(4'hb):(4'h8)])) - wire0));
  assign wire8 = wire4;
  assign wire9 = wire5[(4'hb):(3'h5)];
  assign wire10 = $unsigned((8'hbd));
  assign wire11 = (wire1 ?
                      {wire10} : (wire9[(5'h12):(5'h11)] + $signed(wire0)));
  assign wire12 = (|wire10);
  always
    @(posedge clk) begin
      reg13 <= (8'hbd);
    end
  always
    @(posedge clk) begin
      if ({reg13[(1'h0):(1'h0)], reg13})
        begin
          reg14 <= wire2;
          reg15 <= {reg14};
          reg16 <= ($unsigned((((wire11 ? wire8 : reg13) >> (wire5 ?
                  (8'hb4) : wire11)) >> wire4)) ?
              (wire0[(2'h2):(2'h2)] & wire6[(4'h9):(1'h1)]) : (+($signed({wire6}) ?
                  $signed((wire9 ? wire1 : wire12)) : wire7[(4'hf):(2'h2)])));
        end
      else
        begin
          if ((^~$signed({{{(8'hb2)}, {wire3}},
              ((~^(7'h41)) ? (wire4 < wire8) : $signed(wire2))})))
            begin
              reg14 <= reg15[(4'hc):(4'h9)];
              reg15 <= (($signed($unsigned($signed(reg14))) ?
                  $signed(wire2) : $signed({$unsigned(reg16),
                      (wire0 && wire4)})) + reg15[(4'hf):(4'he)]);
              reg16 <= (!((wire0 ?
                      ($signed(reg14) ?
                          reg16[(4'h9):(3'h4)] : $signed(wire11)) : {(&reg16),
                          reg13[(3'h5):(3'h4)]}) ?
                  (reg16 ^~ $unsigned(wire0[(4'h8):(2'h2)])) : (~|(-(wire12 != wire2)))));
              reg17 <= reg13;
              reg18 <= ($unsigned(reg17[(5'h13):(3'h7)]) <<< ({(^(reg14 ?
                          wire5 : reg17)),
                      wire0} ?
                  wire7[(3'h7):(2'h3)] : (reg13 < reg15)));
            end
          else
            begin
              reg14 <= (wire1[(1'h1):(1'h1)] >= wire5);
              reg15 <= $signed((wire11[(3'h6):(2'h3)] ?
                  wire9[(3'h7):(2'h3)] : wire3));
            end
          reg19 <= (wire3 - ((~$signed(reg13[(3'h7):(3'h5)])) ?
              $unsigned((^~$unsigned(wire4))) : (|reg13)));
        end
      if (((reg18[(3'h6):(1'h1)] || (|wire2[(3'h7):(2'h2)])) ?
          (+(^~wire4[(3'h7):(1'h0)])) : reg14[(3'h7):(3'h6)]))
        begin
          reg20 <= $unsigned($unsigned({((^wire6) == wire1), wire0}));
          reg21 <= (wire6 ?
              {$unsigned(reg17),
                  (|(!((8'ha7) << (8'ha0))))} : ((&reg20[(4'hb):(1'h1)]) + {{wire0}}));
        end
      else
        begin
          reg20 <= {((($unsigned(wire7) ?
                          $unsigned(wire11) : (reg15 ? (8'ha2) : reg15)) ?
                      $signed((+reg17)) : $signed(reg15)) ?
                  ($unsigned((8'h9e)) ?
                      $unsigned((^wire4)) : (wire6 != $signed(wire3))) : (wire11 << $unsigned($signed(wire3)))),
              $signed($unsigned(wire1[(3'h4):(2'h2)]))};
          if ((($unsigned($signed({wire3, reg16})) ?
              reg13[(3'h7):(1'h0)] : wire4[(1'h0):(1'h0)]) + reg21[(2'h3):(1'h0)]))
            begin
              reg21 <= (7'h42);
              reg22 <= $unsigned(reg16);
            end
          else
            begin
              reg21 <= {{(wire0[(4'h9):(4'h9)] || (|$unsigned(wire7))),
                      (^~({wire9, (8'ha5)} ? $signed(wire11) : reg15))},
                  $signed($unsigned({$signed(wire0)}))};
              reg22 <= (wire2[(3'h4):(1'h0)] ?
                  (&$unsigned((reg19[(1'h0):(1'h0)] * $signed(wire1)))) : reg21);
              reg23 <= $signed(($signed({(reg14 >= reg21)}) ?
                  (|reg15) : $signed(reg19[(4'h8):(1'h1)])));
            end
          reg24 <= reg14[(4'ha):(2'h2)];
        end
    end
  assign wire25 = wire11[(4'he):(4'he)];
  module26 #() modinst223 (wire222, clk, reg17, reg16, wire12, wire25);
  assign wire224 = reg24[(2'h2):(2'h2)];
  assign wire225 = $unsigned((~^$unsigned({{reg16}, (wire6 <= wire3)})));
  assign wire226 = {$unsigned((&((wire10 << reg14) << $unsigned(reg20)))),
                       ($signed({wire6[(2'h2):(2'h2)]}) << $signed((reg18 - (~&wire3))))};
  assign wire227 = $signed(wire8);
  assign wire228 = (wire0 ?
                       {(!($unsigned(wire4) ?
                               (wire225 ?
                                   reg15 : wire5) : reg19[(3'h7):(1'h1)]))} : ($unsigned(reg13[(3'h7):(1'h1)]) ?
                           wire12[(3'h6):(1'h0)] : (~^((wire1 ^~ (8'h9c)) ?
                               wire225[(2'h2):(1'h0)] : (~^wire222)))));
  assign wire229 = ($unsigned({wire10,
                           (wire227 ? {wire11} : wire227[(3'h5):(1'h0)])}) ?
                       wire11 : reg17[(4'he):(1'h0)]);
  assign wire230 = $signed((($unsigned((!reg17)) ^ $signed($unsigned(reg24))) ?
                       $unsigned($signed((wire222 ?
                           wire225 : wire3))) : wire224[(3'h4):(2'h3)]));
  assign wire231 = {({((wire222 == wire225) ?
                               (reg22 > wire8) : (reg21 > wire222))} || $signed(wire1[(3'h5):(2'h3)])),
                       (wire1[(3'h6):(3'h5)] ?
                           wire6 : $unsigned(({wire230, wire222} ?
                               $unsigned(wire9) : wire25[(3'h7):(3'h6)])))};
  module75 #() modinst233 (.clk(clk), .wire76(wire228), .wire78(reg18), .wire79(reg21), .y(wire232), .wire80(reg17), .wire77(wire9));
endmodule

module module26
#(parameter param220 = ((((((8'hb7) >> (8'hb7)) & ((8'hae) ? (8'hb5) : (8'h9e))) ? (((8'hb2) ? (8'hb5) : (8'ha3)) ? (-(8'hab)) : (8'hb6)) : ((^~(8'hbd)) ? ((8'hac) ? (8'ha6) : (8'ha6)) : (8'h9d))) + ((((8'hb0) >> (8'hba)) == ((7'h42) >>> (8'hb3))) ? ((-(8'ha9)) ? (-(8'haa)) : ((8'hbe) ? (8'ha7) : (8'ha5))) : (((8'ha5) | (8'had)) ? ((8'ha3) - (8'hbc)) : (8'hb2)))) > {({((8'hab) ? (8'hb3) : (8'ha4)), ((8'ha5) ? (8'hbc) : (8'hb8))} ? {((8'haa) ~^ (7'h44)), ((7'h41) ? (8'hb5) : (8'ha2))} : (((8'ha1) && (8'hb3)) ? {(8'hbf)} : ((8'hba) + (7'h44)))), (~(((8'hac) * (8'hb5)) ? {(7'h42)} : ((7'h40) || (8'hbf))))}), 
parameter param221 = param220)
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire219;
  wire signed [(3'h7):(1'h0)] wire218;
  wire signed [(4'h8):(1'h0)] wire217;
  wire signed [(4'hd):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(3'h5):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire152;
  wire [(3'h5):(1'h0)] wire153;
  wire signed [(3'h4):(1'h0)] wire197;
  wire signed [(4'he):(1'h0)] wire199;
  wire [(5'h12):(1'h0)] wire215;
  reg signed [(4'hb):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  reg [(4'he):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire116,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire138,
                 wire140,
                 wire152,
                 wire153,
                 wire197,
                 wire199,
                 wire215,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 (1'h0)};
  module31 #() modinst70 (.wire33(wire28), .wire32(wire29), .wire34(wire27), .y(wire69), .clk(clk), .wire35(wire30));
  assign wire71 = (8'hba);
  assign wire72 = $unsigned(wire30[(1'h0):(1'h0)]);
  assign wire73 = $signed((!$unsigned($signed(wire28))));
  assign wire74 = $signed($unsigned($unsigned($signed({wire27, wire28}))));
  module75 #() modinst117 (.y(wire116), .wire78(wire69), .wire80(wire29), .wire76(wire73), .wire77(wire71), .clk(clk), .wire79(wire28));
  assign wire118 = $unsigned(($unsigned(($unsigned(wire73) || $signed(wire27))) ?
                       wire116 : wire69));
  assign wire119 = $signed(wire74[(4'hb):(3'h6)]);
  assign wire120 = (wire118[(2'h2):(2'h2)] ? wire28 : wire118);
  assign wire121 = (+(&(8'h9e)));
  assign wire122 = (8'hb5);
  assign wire123 = $signed((~^$unsigned(wire119[(3'h7):(3'h5)])));
  module124 #() modinst139 (wire138, clk, wire72, wire71, wire74, wire116);
  assign wire140 = wire121;
  always
    @(posedge clk) begin
      if ((~|($signed((8'ha6)) ?
          ((~|$signed(wire72)) < wire74[(5'h11):(3'h5)]) : wire28)))
        begin
          reg141 <= (|{(wire73[(4'h8):(2'h3)] ?
                  ($signed(wire120) ?
                      (wire122 ?
                          wire140 : wire118) : $unsigned(wire30)) : $signed((8'had))),
              wire121});
          if ($signed($unsigned(wire122[(3'h4):(3'h4)])))
            begin
              reg142 <= {wire28};
              reg143 <= ($unsigned(reg142[(4'h9):(4'h9)]) == wire27);
              reg144 <= (($signed((&(wire140 == wire30))) - wire28[(3'h4):(3'h4)]) ^~ $unsigned((~&wire27[(3'h6):(1'h0)])));
            end
          else
            begin
              reg142 <= wire74[(5'h11):(1'h1)];
            end
          reg145 <= $unsigned($signed({(wire28 <= (wire73 - (8'had))),
              $signed($unsigned((8'hb9)))}));
        end
      else
        begin
          reg141 <= reg145[(4'h8):(4'h8)];
          reg142 <= wire28[(2'h2):(1'h0)];
          if (reg142[(4'hd):(3'h5)])
            begin
              reg143 <= $signed($signed(wire118[(3'h4):(1'h0)]));
              reg144 <= ($unsigned(wire72) != ({(-wire121),
                  wire122} ^~ ($signed(wire121) ?
                  (((8'ha5) <= wire72) ?
                      (wire123 == wire73) : (^wire71)) : $signed((&wire119)))));
              reg145 <= $signed((wire28[(5'h10):(2'h3)] == wire74));
              reg146 <= (reg143[(2'h2):(1'h1)] <<< (($signed($unsigned(wire140)) - wire69) ?
                  $signed(wire119[(1'h0):(1'h0)]) : reg141));
              reg147 <= (wire72 ?
                  (wire73 >>> $unsigned(reg145[(3'h7):(3'h4)])) : {wire71[(4'h9):(4'h9)],
                      ($unsigned((reg143 << reg143)) ?
                          (&$unsigned(wire123)) : (!((8'hbe) > (7'h41))))});
            end
          else
            begin
              reg143 <= (($signed($unsigned((-(8'hb7)))) ?
                      (($signed(wire120) >= $unsigned(wire138)) | (&wire73[(4'h9):(3'h4)])) : (wire140 ?
                          (!(^~wire116)) : $unsigned($signed((7'h44))))) ?
                  ($signed(((reg146 ? wire29 : reg142) - (wire73 - wire121))) ?
                      ((wire118 ? (!wire73) : (reg141 >= reg147)) ?
                          ((wire30 ~^ (8'hb9)) ^~ {wire71,
                              wire27}) : {(wire121 > reg141)}) : ({$signed(wire30)} | $unsigned({wire29}))) : $unsigned($unsigned({(-reg142)})));
              reg144 <= $unsigned($unsigned(wire30[(1'h0):(1'h0)]));
              reg145 <= (~wire74);
              reg146 <= reg147[(2'h3):(1'h0)];
              reg147 <= wire71[(3'h4):(2'h3)];
            end
          reg148 <= (8'hac);
          reg149 <= ($unsigned((((wire138 ~^ wire29) ?
                      wire120 : $unsigned(wire116)) ?
                  (|{(8'hac), wire121}) : (|wire123[(1'h1):(1'h1)]))) ?
              $unsigned((8'ha8)) : (~&(((wire27 ? wire123 : wire30) ?
                  $signed(wire69) : (reg142 ?
                      wire74 : wire73)) * $signed(wire122))));
        end
      reg150 <= (8'h9f);
      reg151 <= $signed({$unsigned($unsigned((reg146 ? wire71 : reg149)))});
    end
  assign wire152 = ((!(^{(8'hba)})) ?
                       $unsigned($signed(wire30)) : $unsigned(($unsigned((|(8'hb6))) ?
                           reg143[(2'h2):(1'h0)] : wire140[(4'hf):(4'hf)])));
  assign wire153 = $signed($signed((((reg144 >> wire152) ^~ $unsigned((7'h40))) == reg146)));
  module154 #() modinst198 (.wire155(wire69), .wire157(reg146), .wire156(reg144), .wire159(reg143), .wire158(wire72), .clk(clk), .y(wire197));
  assign wire199 = $unsigned(wire119);
  module200 #() modinst216 (.wire202(wire116), .wire205(wire30), .wire204(wire199), .wire201(wire71), .wire203(wire119), .y(wire215), .clk(clk));
  assign wire217 = reg151;
  assign wire218 = $signed(($unsigned({((8'ha3) <= wire122)}) ?
                       $unsigned((wire28 && wire69)) : {$signed($unsigned(wire28)),
                           $unsigned(wire123[(1'h1):(1'h1)])}));
  assign wire219 = wire118[(3'h4):(2'h3)];
endmodule

module module200  (y, clk, wire205, wire204, wire203, wire202, wire201);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire205;
  input wire signed [(4'he):(1'h0)] wire204;
  input wire [(5'h12):(1'h0)] wire203;
  input wire [(4'hc):(1'h0)] wire202;
  input wire signed [(3'h4):(1'h0)] wire201;
  wire signed [(4'hd):(1'h0)] wire214;
  wire signed [(2'h2):(1'h0)] wire213;
  wire [(4'hb):(1'h0)] wire212;
  wire signed [(3'h4):(1'h0)] wire211;
  wire signed [(2'h2):(1'h0)] wire210;
  wire [(4'hb):(1'h0)] wire209;
  wire [(3'h5):(1'h0)] wire208;
  reg [(3'h4):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg206 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 reg207,
                 reg206,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg206 <= (({wire201[(2'h3):(2'h3)]} << (wire204[(4'hc):(4'h9)] < (((8'hb7) ?
                  wire204 : wire201) ?
              (7'h42) : wire204))) ?
          (($unsigned((wire204 || wire204)) ?
                  wire201 : (wire205[(5'h10):(4'h8)] ^~ (wire205 ?
                      wire203 : wire202))) ?
              wire202 : {$signed($signed(wire203)),
                  (-$signed((8'hbc)))}) : (wire201 ?
              (&((wire204 ? wire201 : (8'hb0)) ?
                  (wire204 ~^ wire202) : {wire204, wire205})) : wire205));
      reg207 <= wire204[(4'h8):(3'h4)];
    end
  assign wire208 = {($signed(wire203) == $unsigned($signed(wire202[(1'h0):(1'h0)]))),
                       $signed($unsigned(($signed((8'ha3)) - (reg206 > (8'hb6)))))};
  assign wire209 = wire202;
  assign wire210 = (7'h41);
  assign wire211 = $unsigned(reg206[(4'h9):(3'h7)]);
  assign wire212 = $signed(wire211);
  assign wire213 = $signed(($signed({(+wire204)}) ?
                       {{(-wire210), (^~wire211)}} : ((((8'hbf) == (8'hb5)) ?
                           wire209 : $unsigned(wire210)) <<< wire210[(1'h0):(1'h0)])));
  assign wire214 = $unsigned(wire202[(3'h7):(1'h1)]);
endmodule

module module154
#(parameter param195 = ((((((8'hbd) && (8'hbb)) ? (-(8'hb2)) : ((8'ha3) + (8'hb9))) ? (^~(-(8'ha2))) : (|((8'h9c) - (7'h40)))) >= ((((8'ha8) ? (8'hb5) : (8'hbd)) ? ((8'hae) ^ (8'hbc)) : ((8'hb6) ? (8'haf) : (8'ha2))) + {((8'ha3) ? (8'hae) : (7'h43)), ((8'ha2) ? (8'hbf) : (8'ha3))})) ? (((((8'hb4) ? (8'ha1) : (8'hab)) < ((8'hbb) * (8'hbf))) ? ({(7'h41)} | ((8'h9c) | (8'ha8))) : {(~&(8'ha5)), (^~(8'ha5))}) + ({{(7'h42), (8'hb5)}, ((8'hbc) << (8'hb9))} >= (8'h9d))) : ((|(!(!(8'ha1)))) <<< (!(&{(8'h9f), (8'hb5)})))), 
parameter param196 = (-(param195 * param195)))
(y, clk, wire159, wire158, wire157, wire156, wire155);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire159;
  input wire [(2'h3):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  input wire signed [(3'h6):(1'h0)] wire156;
  input wire signed [(4'hf):(1'h0)] wire155;
  wire signed [(3'h7):(1'h0)] wire194;
  wire [(5'h11):(1'h0)] wire190;
  wire [(3'h5):(1'h0)] wire189;
  wire [(3'h6):(1'h0)] wire177;
  wire signed [(4'hf):(1'h0)] wire176;
  wire signed [(3'h7):(1'h0)] wire175;
  wire signed [(2'h3):(1'h0)] wire174;
  wire signed [(3'h7):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  wire signed [(5'h14):(1'h0)] wire168;
  wire signed [(5'h11):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(2'h2):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire [(3'h4):(1'h0)] wire160;
  reg signed [(3'h4):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg192 = (1'h0);
  reg [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg187 = (1'h0);
  reg [(5'h12):(1'h0)] reg186 = (1'h0);
  reg [(5'h11):(1'h0)] reg185 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(3'h5):(1'h0)] reg180 = (1'h0);
  reg [(3'h4):(1'h0)] reg179 = (1'h0);
  reg [(4'h9):(1'h0)] reg178 = (1'h0);
  assign y = {wire194,
                 wire190,
                 wire189,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg193,
                 reg192,
                 reg191,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire160 = ((($unsigned(((8'had) ? wire157 : wire155)) ?
                           $signed((wire158 + wire157)) : wire157[(3'h7):(3'h4)]) ?
                       (((wire159 ^~ wire156) >>> wire159[(3'h4):(2'h2)]) || ((8'hb5) <= wire155)) : ({{(8'hb2),
                               wire158},
                           (-wire158)} ~^ ((wire156 ^ wire156) >>> ((8'h9c) ?
                           wire158 : wire157)))) != ({($unsigned(wire155) ?
                               $unsigned(wire158) : wire156[(2'h2):(2'h2)]),
                           wire157[(2'h3):(2'h2)]} ?
                       $signed({(wire155 ? wire156 : wire157)}) : wire159));
  assign wire161 = {((($unsigned(wire159) ?
                           (&wire159) : (wire156 & wire159)) <= $signed((wire159 ?
                           wire159 : wire157))) >> $signed((&$unsigned(wire155))))};
  assign wire162 = {wire158[(1'h0):(1'h0)]};
  assign wire163 = $signed(wire162);
  assign wire164 = wire163[(1'h1):(1'h1)];
  assign wire165 = wire160;
  assign wire166 = (wire161 ?
                       (^~(~^$unsigned((wire159 ?
                           wire160 : (8'hba))))) : (^($unsigned($signed(wire164)) >= wire164)));
  assign wire167 = $signed(wire156);
  assign wire168 = (wire166[(1'h0):(1'h0)] ?
                       (!wire162[(3'h6):(2'h3)]) : (~&{$unsigned(wire161[(5'h11):(3'h6)]),
                           (^~wire167)}));
  assign wire169 = $unsigned({wire164});
  assign wire170 = $signed(wire155[(3'h5):(1'h0)]);
  assign wire171 = ((+(wire156 ?
                       {$unsigned((8'hb8))} : (!(wire159 <= (8'hb4))))) * $unsigned(((^wire155) <<< $signed(wire163[(1'h0):(1'h0)]))));
  assign wire172 = $signed($unsigned({wire164[(1'h1):(1'h1)],
                       $unsigned($unsigned(wire155))}));
  assign wire173 = wire165;
  assign wire174 = {((&wire157) <= (-((wire168 ? wire159 : wire161) ?
                           (8'ha9) : $unsigned((8'hb5))))),
                       ((^~(wire161 ^~ (wire160 >>> wire158))) ?
                           wire166 : wire162)};
  assign wire175 = (($signed(wire161[(4'ha):(2'h2)]) ?
                       $signed((wire165[(4'h9):(2'h3)] ?
                           (wire173 ?
                               wire171 : wire163) : (8'hb5))) : $signed(($unsigned(wire159) ?
                           (8'hb1) : (8'ha7)))) | (8'ha2));
  assign wire176 = $unsigned((8'h9d));
  assign wire177 = ((wire170 ?
                       ((wire158[(1'h1):(1'h1)] ?
                           (~|wire164) : (wire158 ?
                               wire157 : wire175)) >> $unsigned((~(8'haf)))) : $signed(((wire158 >>> wire171) || $unsigned(wire173)))) || wire168);
  always
    @(posedge clk) begin
      if (wire167[(1'h1):(1'h0)])
        begin
          reg178 <= ((^~$unsigned((wire157 <= ((8'hb0) ?
              wire164 : (8'ha4))))) ~^ $unsigned({(~(~&wire167))}));
          if ((|wire156))
            begin
              reg179 <= $unsigned(wire162);
              reg180 <= wire168[(4'hf):(3'h7)];
            end
          else
            begin
              reg179 <= wire173[(3'h7):(2'h3)];
              reg180 <= {($signed(wire156[(3'h5):(1'h1)]) ~^ wire167),
                  (($unsigned(wire167[(4'h9):(3'h7)]) ?
                          wire160[(2'h2):(2'h2)] : (~(wire161 ?
                              wire172 : wire168))) ?
                      wire158 : $unsigned((+(reg179 ? wire163 : (8'haf)))))};
              reg181 <= wire165;
              reg182 <= ($unsigned((wire163[(1'h0):(1'h0)] ?
                      ((&wire166) <<< (wire167 ^~ wire170)) : wire159)) ?
                  $unsigned(((~|$signed(wire170)) & {(~^wire155),
                      $unsigned(reg180)})) : $unsigned((^reg178)));
            end
          reg183 <= $unsigned(wire168);
          reg184 <= reg182[(1'h0):(1'h0)];
          if ((reg182 <<< {wire160}))
            begin
              reg185 <= $signed($unsigned($signed($signed(reg178))));
              reg186 <= {$unsigned((($signed(wire161) > reg185[(4'ha):(2'h3)]) ?
                      reg183[(3'h7):(2'h2)] : wire176))};
              reg187 <= (!wire160[(2'h2):(1'h0)]);
              reg188 <= (^~((-$signed($unsigned((8'ha8)))) ?
                  (((reg182 ? wire168 : wire172) ? wire165 : wire172) ?
                      (^~(wire156 ? reg182 : (8'ha5))) : ((wire163 ?
                          (8'ha6) : wire156) + reg182)) : $unsigned(reg184[(1'h0):(1'h0)])));
            end
          else
            begin
              reg185 <= $signed(reg185[(4'hd):(3'h7)]);
              reg186 <= $unsigned(reg184);
              reg187 <= {wire174[(1'h0):(1'h0)], $signed(wire174)};
            end
        end
      else
        begin
          if ($signed((((-(wire166 ? wire163 : wire169)) ?
              wire161[(4'hd):(4'h8)] : (!(~&(8'hb6)))) | wire168[(3'h6):(3'h6)])))
            begin
              reg178 <= $unsigned(((+(((8'ha6) ? wire171 : (7'h41)) ?
                  $unsigned(wire165) : (wire164 ?
                      wire155 : wire163))) <= $signed($unsigned((^~(8'hb3))))));
              reg179 <= wire161;
              reg180 <= reg188[(4'he):(3'h6)];
            end
          else
            begin
              reg178 <= wire158[(1'h0):(1'h0)];
              reg179 <= wire162[(4'hf):(2'h2)];
              reg180 <= ($signed(wire163[(1'h0):(1'h0)]) ?
                  wire162[(4'he):(3'h5)] : reg184[(3'h7):(2'h3)]);
              reg181 <= ({(wire170 ?
                          $signed({reg184, wire172}) : $unsigned((-(8'hbb))))} ?
                  wire165[(3'h7):(3'h6)] : wire176);
            end
        end
    end
  assign wire189 = $unsigned(({((wire159 > wire166) >>> $unsigned((8'ha1)))} ?
                       (((8'hb9) ^ (8'hb4)) && ((wire176 ?
                           reg183 : (7'h41)) & wire155)) : $signed(wire165)));
  assign wire190 = $unsigned(((^~reg181) >= (-$unsigned($unsigned(wire177)))));
  always
    @(posedge clk) begin
      reg191 <= (&(reg187 >= $unsigned(wire159[(4'h8):(3'h6)])));
      reg192 <= ((wire156 + wire156[(2'h2):(1'h0)]) ?
          $signed((reg191 ?
              (wire175 ?
                  $unsigned(reg182) : reg178[(1'h0):(1'h0)]) : reg186[(3'h6):(1'h0)])) : wire156);
      reg193 <= (^(($unsigned((reg183 ? wire163 : reg192)) ?
          {{reg192},
              wire173} : wire165[(1'h0):(1'h0)]) >>> (($unsigned(wire164) ?
              wire176 : {wire174}) ?
          reg184[(4'hd):(4'hc)] : $signed($signed(reg181)))));
    end
  assign wire194 = {wire165[(4'ha):(2'h3)]};
endmodule

module module124  (y, clk, wire128, wire127, wire126, wire125);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire128;
  input wire [(5'h13):(1'h0)] wire127;
  input wire [(4'hc):(1'h0)] wire126;
  input wire [(4'hc):(1'h0)] wire125;
  wire [(5'h14):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire [(4'hd):(1'h0)] wire129;
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 (1'h0)};
  assign wire129 = wire125;
  assign wire130 = wire126[(1'h1):(1'h1)];
  assign wire131 = wire125[(3'h6):(3'h4)];
  assign wire132 = (~|({wire131} < wire129));
  assign wire133 = ((~&$signed(wire130[(4'hc):(3'h5)])) < wire128);
  assign wire134 = $signed((wire130[(4'hf):(1'h1)] ?
                       ($signed((^wire125)) ?
                           ($signed((8'ha8)) ?
                               (~wire131) : $unsigned(wire126)) : wire131[(2'h2):(1'h1)]) : wire131));
  assign wire135 = {wire126};
  assign wire136 = wire127[(4'he):(1'h0)];
  assign wire137 = {({$signed(((8'hb2) - wire132))} ^ {wire129[(4'h9):(1'h1)]}),
                       $signed($signed($unsigned((wire136 & wire129))))};
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(3'h7):(1'h0)] wire79;
  input wire [(4'ha):(1'h0)] wire78;
  input wire [(4'h9):(1'h0)] wire77;
  input wire [(3'h7):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire115;
  wire [(3'h7):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire81;
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire81,
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
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire81 = $signed(((wire79 ^ (&wire79[(3'h6):(3'h6)])) ^ {wire79[(1'h1):(1'h1)],
                      $signed($signed((8'hbb)))}));
  always
    @(posedge clk) begin
      reg82 <= $unsigned($signed((~^$signed($unsigned(wire78)))));
      if (reg82[(4'hd):(3'h6)])
        begin
          reg83 <= $unsigned(wire80[(1'h0):(1'h0)]);
          reg84 <= reg82;
          if ($signed(((reg83[(3'h6):(3'h4)] == {$signed(reg84)}) ?
              ({(wire78 >>> wire77)} ?
                  (wire79[(2'h2):(1'h0)] ?
                      {wire76} : {wire77}) : wire81[(1'h1):(1'h0)]) : ($unsigned((reg83 <<< wire81)) ?
                  wire79[(1'h1):(1'h0)] : (wire77[(1'h0):(1'h0)] ?
                      $signed(wire77) : ((8'hab) ? wire81 : reg84))))))
            begin
              reg85 <= $signed(wire78[(4'ha):(3'h4)]);
              reg86 <= {($signed(reg85) ?
                      wire80[(3'h7):(2'h2)] : (wire81 != {{wire76, (8'hae)},
                          (~^wire78)})),
                  wire79};
              reg87 <= $signed((8'ha4));
              reg88 <= reg86[(2'h3):(2'h3)];
              reg89 <= (+reg82);
            end
          else
            begin
              reg85 <= $signed({$signed(reg83[(1'h1):(1'h1)]),
                  reg82[(1'h0):(1'h0)]});
              reg86 <= $unsigned(($unsigned(reg89[(3'h5):(3'h5)]) ?
                  ((wire79[(2'h2):(1'h1)] && {(8'ha9),
                      reg85}) && ($signed((8'hb2)) ?
                      wire81[(3'h4):(3'h4)] : (reg85 ?
                          reg88 : wire76))) : {{{reg84, wire78}}}));
              reg87 <= reg82;
              reg88 <= $signed(reg82);
              reg89 <= reg86;
            end
          reg90 <= reg86;
        end
      else
        begin
          reg83 <= (reg83[(4'hb):(4'hb)] ?
              wire79 : $signed((reg83 >> (&(reg83 ? reg87 : (8'hba))))));
          reg84 <= $signed($signed((reg90 ?
              (!(wire77 == wire79)) : (~^reg88))));
          reg85 <= $unsigned(reg84);
          if ((wire81[(2'h2):(1'h0)] + $signed($signed((~$unsigned(reg87))))))
            begin
              reg86 <= (8'ha2);
              reg87 <= (wire79 ~^ wire77);
              reg88 <= $signed(((^~$unsigned($signed(reg88))) << (8'hbc)));
              reg89 <= reg84[(3'h4):(1'h0)];
            end
          else
            begin
              reg86 <= wire79[(2'h3):(2'h3)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg91 <= (8'hb5);
      if (reg85)
        begin
          reg92 <= wire80[(4'hc):(4'h9)];
        end
      else
        begin
          reg92 <= reg87[(1'h0):(1'h0)];
          reg93 <= (reg91[(3'h6):(2'h2)] ?
              wire76[(2'h2):(1'h0)] : ((($unsigned(reg85) ?
                      (!reg84) : (reg83 ? reg82 : reg91)) != $signed(reg92)) ?
                  reg83 : (~&($signed(wire77) ?
                      (~&reg88) : $unsigned(reg92)))));
          reg94 <= (reg92[(4'h8):(3'h6)] ?
              $signed(reg88) : {$signed((+$unsigned(reg82)))});
          reg95 <= $unsigned(($signed(($unsigned((8'hbc)) <= $signed(reg82))) ?
              {$unsigned(reg88[(1'h0):(1'h0)])} : ($unsigned((&reg94)) & (+$signed(reg85)))));
        end
      if ((~|(^~$signed((-$signed((8'hb4)))))))
        begin
          if ((((+reg90) ?
              $unsigned($unsigned(reg92[(4'hb):(4'hb)])) : wire80) <= reg91))
            begin
              reg96 <= {(!$signed(reg91[(3'h5):(3'h5)]))};
              reg97 <= {(reg89[(1'h0):(1'h0)] ?
                      (+{wire76[(1'h0):(1'h0)], reg83}) : (reg83 == (^reg94))),
                  {reg92}};
            end
          else
            begin
              reg96 <= $signed($unsigned({$unsigned(((8'h9f) ?
                      reg93 : reg85))}));
              reg97 <= (~^$unsigned(((|(8'hac)) <= reg95)));
            end
        end
      else
        begin
          if (reg90)
            begin
              reg96 <= reg93[(4'hd):(3'h6)];
              reg97 <= $signed((8'haa));
              reg98 <= (~^reg87[(1'h0):(1'h0)]);
              reg99 <= (($signed($signed((+reg84))) ?
                  $unsigned(reg95) : $unsigned((wire76[(1'h0):(1'h0)] ?
                      {(8'ha2)} : reg87))) ^~ $unsigned(reg95));
            end
          else
            begin
              reg96 <= $signed((reg88[(1'h1):(1'h1)] ^ $unsigned(wire79[(1'h0):(1'h0)])));
              reg97 <= $unsigned({($unsigned((8'ha8)) ?
                      {(&reg87)} : $signed($signed(reg88))),
                  $unsigned($unsigned($unsigned(reg92)))});
              reg98 <= (+reg82[(3'h5):(3'h5)]);
            end
          reg100 <= wire77[(2'h3):(1'h1)];
          if (((|{(8'h9c)}) ? wire78[(2'h3):(2'h3)] : reg100))
            begin
              reg101 <= {$signed({{(reg96 <<< wire79)},
                      $signed((reg95 << (7'h42)))})};
              reg102 <= ($signed((~wire81)) ?
                  reg101 : (+(^((wire76 ? (8'h9c) : wire81) ?
                      (~^reg91) : (wire81 ~^ reg89)))));
              reg103 <= (8'ha4);
              reg104 <= (^~(~|($signed((wire76 ? (8'hb7) : reg93)) | reg91)));
            end
          else
            begin
              reg101 <= (($unsigned(($signed((8'had)) ?
                  $signed(reg102) : $unsigned(reg84))) != (|((~reg89) & (reg82 ?
                  wire77 : reg86)))) | ({{(reg101 & (8'h9c))}, wire76} ?
                  ((+$unsigned((8'haf))) ?
                      reg93 : $signed({reg93, reg86})) : (((reg99 * (7'h40)) ?
                          {reg84} : (reg92 - reg84)) ?
                      $signed(reg92) : ($signed(reg89) * wire76))));
            end
          if ($unsigned(reg88))
            begin
              reg105 <= reg103[(4'h9):(4'h9)];
              reg106 <= (&reg87[(1'h0):(1'h0)]);
            end
          else
            begin
              reg105 <= {(((reg90 ?
                              (reg98 ?
                                  reg101 : (8'ha2)) : reg86[(1'h0):(1'h0)]) ?
                          (((8'haa) ^ reg91) ?
                              (^reg106) : $signed(reg82)) : {reg90}) ?
                      {($unsigned((8'ha2)) >> (wire79 & reg96)),
                          reg103} : $signed((&reg102))),
                  wire81};
              reg106 <= ($unsigned(($unsigned((reg88 ?
                      reg102 : reg97)) || (~&$unsigned(reg99)))) ?
                  {(~&((reg91 <<< reg96) | (~|reg96))),
                      {reg89, {(reg106 ? wire79 : wire81)}}} : (8'hb3));
              reg107 <= wire78[(1'h1):(1'h0)];
            end
        end
    end
  assign wire108 = reg86[(2'h3):(2'h3)];
  assign wire109 = $signed((|$signed({(~&reg107)})));
  assign wire110 = $signed(((((!reg87) ?
                           (reg105 >= reg99) : (wire78 ?
                               reg97 : reg89)) <= ($unsigned(wire76) ^~ $unsigned(reg100))) ?
                       (((reg85 ~^ (7'h44)) ?
                               $unsigned((8'ha0)) : (reg107 & reg96)) ?
                           ({reg91, reg104} ?
                               reg84[(4'h8):(1'h0)] : (reg91 ?
                                   reg84 : reg89)) : {$signed(reg90)}) : $unsigned(reg85[(1'h0):(1'h0)])));
  assign wire111 = wire108;
  assign wire112 = ($unsigned((&(reg99 ? (!reg96) : (reg104 ^~ reg107)))) ?
                       $unsigned(reg105[(3'h6):(3'h5)]) : (((|(-wire81)) >> $unsigned(((8'hbc) ^~ reg82))) ?
                           $unsigned(reg89) : (((|wire79) <= (wire108 ?
                                   wire109 : reg82)) ?
                               $signed((reg94 ? reg89 : (8'hab))) : (reg106 ?
                                   $unsigned(reg84) : (^reg99)))));
  assign wire113 = $signed($signed(reg99[(4'h9):(2'h2)]));
  assign wire114 = {reg94[(4'h9):(4'h9)],
                       ((reg103[(3'h4):(2'h2)] ?
                           wire76[(3'h6):(3'h5)] : wire111) ^~ (~|reg87))};
  assign wire115 = (^~$unsigned($signed(($signed(reg102) >= (reg105 != reg99)))));
endmodule

module module31
#(parameter param67 = (((({(8'hb4)} > ((7'h44) ~^ (8'hb8))) || (|(8'hbf))) | (^~(-((8'ha4) ? (8'ha7) : (8'had))))) & ({(+((7'h41) ? (7'h42) : (8'hb7)))} ? (((-(8'ha6)) ? ((8'hab) ? (8'hbb) : (8'h9c)) : (~^(8'ha7))) <= (-((8'had) ? (8'h9f) : (8'h9c)))) : (~((+(8'h9e)) ? ((8'hb7) ? (8'hb5) : (8'ha9)) : (^~(8'hb7)))))), 
parameter param68 = (((param67 >= ({param67, param67} == (^(8'ha8)))) ? (((param67 >= (7'h43)) < (param67 ? param67 : param67)) ? param67 : (~(~|param67))) : {((param67 << param67) ? {param67, param67} : param67), ((param67 ? param67 : param67) ? (8'hb7) : (param67 * param67))}) ~^ param67))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire33;
  input wire [(3'h4):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'hb):(1'h0)] wire61;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 reg60,
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
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = wire33[(4'ha):(3'h4)];
  assign wire37 = ($unsigned((8'haa)) >> wire32);
  always
    @(posedge clk) begin
      reg38 <= ($unsigned({$unsigned($signed(wire35)), wire34[(2'h2):(2'h2)]}) ?
          ((&((wire32 - wire35) & (8'hbd))) ?
              (((wire36 << wire33) ?
                  wire33 : $unsigned(wire37)) & $unsigned({wire36,
                  wire34})) : {wire34}) : {$unsigned({$signed(wire37)}),
              wire35});
      reg39 <= $signed($unsigned(($unsigned(wire34[(1'h0):(1'h0)]) < $unsigned($unsigned(wire37)))));
      reg40 <= $unsigned((wire36[(4'ha):(4'h9)] ?
          ((~|$signed((8'had))) <<< (reg38[(4'h8):(2'h2)] ?
              (wire37 & wire37) : $signed(reg39))) : (+(8'hb3))));
    end
  assign wire41 = ({($unsigned(wire33) == $signed((reg39 ^~ wire36))),
                      $signed($unsigned((^reg40)))} || (!wire34));
  assign wire42 = ($unsigned((wire33[(4'he):(3'h6)] ^~ wire37[(2'h3):(1'h0)])) ?
                      $unsigned({(~|$unsigned(reg40)),
                          wire35[(1'h0):(1'h0)]}) : $signed(wire37[(2'h2):(1'h1)]));
  assign wire43 = ((wire33 << {reg39[(3'h4):(1'h1)]}) ?
                      ($signed((~&$unsigned(wire37))) ^~ wire36[(4'h8):(3'h5)]) : (^~$signed(($signed(wire32) >= reg39))));
  assign wire44 = wire43;
  assign wire45 = (($unsigned(((wire43 > wire36) ?
                          wire34 : $unsigned((8'hae)))) ?
                      (!(|(wire33 && reg40))) : $unsigned(wire43[(1'h0):(1'h0)])) + $unsigned((($signed((8'ha7)) << wire36[(3'h7):(3'h5)]) ?
                      wire41[(3'h4):(3'h4)] : wire32)));
  assign wire46 = wire32[(2'h2):(1'h0)];
  assign wire47 = wire41;
  assign wire48 = (~^$unsigned(({(~^(8'h9d)), $signed(reg40)} ?
                      ($unsigned(wire36) & wire37) : $signed({(8'hbe)}))));
  always
    @(posedge clk) begin
      if ((reg39 ?
          $signed({(8'hbd)}) : $signed((((+reg39) ?
                  ((8'ha3) ? reg38 : (8'hac)) : {wire41, reg40}) ?
              (~&wire41) : {$unsigned(wire42)}))))
        begin
          reg49 <= (!$unsigned({(wire45 ?
                  (~|wire45) : wire37[(2'h3):(1'h1)])}));
        end
      else
        begin
          if ({(($signed($unsigned(reg39)) ?
                      wire33[(4'hf):(4'hf)] : ($signed(wire37) + (!wire35))) ?
                  wire45[(1'h1):(1'h1)] : wire48)})
            begin
              reg49 <= (($unsigned(wire43) ?
                      $unsigned(((wire44 ?
                          wire44 : reg49) << $signed(wire35))) : ($signed($signed(wire37)) < {$unsigned(wire43),
                          wire46[(4'h8):(2'h3)]})) ?
                  $signed(wire42[(2'h2):(2'h2)]) : $unsigned({wire37,
                      ((wire32 <<< wire47) ?
                          (wire48 ? wire45 : wire42) : (8'ha4))}));
            end
          else
            begin
              reg49 <= wire36[(4'he):(4'h8)];
              reg50 <= (-$signed($signed(((+(8'ha0)) ?
                  wire35[(4'h8):(1'h1)] : wire43[(3'h4):(1'h1)]))));
              reg51 <= reg50[(1'h1):(1'h0)];
              reg52 <= (^~(((-((8'h9c) ? (7'h41) : reg40)) ?
                      wire48[(2'h3):(2'h2)] : wire48) ?
                  $unsigned(((8'ha4) * (reg39 * wire42))) : $signed(wire42[(3'h5):(1'h0)])));
              reg53 <= ((wire41 & ((wire45 >>> wire33) ?
                      {(~wire48)} : wire32)) ?
                  $signed($unsigned(reg49)) : wire44[(4'h9):(1'h1)]);
            end
          if ((&(wire37[(2'h3):(2'h3)] ?
              (~^wire32[(2'h2):(2'h2)]) : (~wire45[(2'h3):(2'h2)]))))
            begin
              reg54 <= $unsigned(wire46);
              reg55 <= $unsigned(wire42[(1'h0):(1'h0)]);
              reg56 <= $signed(((8'hb1) ?
                  (reg54[(1'h1):(1'h1)] <= $signed((+reg38))) : {$unsigned(reg54[(3'h4):(2'h3)])}));
            end
          else
            begin
              reg54 <= reg53;
              reg55 <= reg53;
              reg56 <= wire42;
            end
          reg57 <= wire33;
          reg58 <= $signed((7'h43));
          reg59 <= ((~^(^$signed($signed(reg56)))) < ((~wire43[(3'h4):(1'h1)]) ?
              $signed(wire42[(1'h0):(1'h0)]) : (|wire42)));
        end
      reg60 <= wire47;
    end
  assign wire61 = ((~|$unsigned((~|((8'ha4) ?
                      (8'ha3) : wire42)))) | reg40[(2'h2):(1'h1)]);
  assign wire62 = (~^((^$unsigned($signed(reg38))) ~^ (^($signed(reg53) && (reg40 ?
                      reg56 : (8'hbd))))));
  assign wire63 = $signed({wire34[(2'h2):(2'h2)], reg56[(4'hc):(4'hb)]});
  assign wire64 = wire45;
  assign wire65 = $signed($unsigned($unsigned((+{wire32, reg40}))));
  assign wire66 = wire34;
endmodule
