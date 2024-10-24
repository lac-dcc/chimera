module top
#(parameter param206 = ({{((-(8'ha6)) >= (8'hb3)), {{(7'h42), (8'hb0)}}}, {({(8'hb8)} ? {(8'hb2)} : ((8'h9d) + (8'h9e))), (((8'hb7) + (8'hae)) ? ((8'hb3) + (8'h9d)) : (-(7'h44)))}} ^~ ({(((8'hb8) ? (8'ha7) : (8'ha3)) ? ((8'hbf) ^ (8'hb4)) : ((7'h43) < (8'ha5))), (!((8'hbc) ? (8'had) : (8'h9c)))} >> (^~{((8'had) ^~ (8'h9c))}))), 
parameter param207 = (param206 ? (~&(param206 > ((param206 | param206) ? (~|param206) : param206))) : (param206 ? param206 : param206)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire205;
  wire [(5'h10):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire189;
  wire [(5'h11):(1'h0)] wire188;
  wire signed [(4'hf):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire186;
  wire [(4'ha):(1'h0)] wire185;
  wire signed [(5'h10):(1'h0)] wire184;
  wire signed [(5'h15):(1'h0)] wire183;
  wire [(5'h13):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg203 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg201 = (1'h0);
  reg [(5'h10):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg199 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg198 = (1'h0);
  reg [(4'ha):(1'h0)] reg197 = (1'h0);
  reg [(5'h12):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg195 = (1'h0);
  reg [(4'he):(1'h0)] reg194 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg190 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire6,
                 wire5,
                 wire4,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 (1'h0)};
  assign wire4 = $unsigned(((wire2[(3'h7):(1'h1)] ?
                         $signed($signed(wire3)) : wire1[(3'h5):(2'h3)]) ?
                     ({wire2[(3'h6):(1'h1)]} ?
                         wire1[(4'h8):(3'h5)] : (wire0 ?
                             (wire0 + wire1) : wire2[(3'h7):(3'h6)])) : ($signed(wire3) < wire1[(3'h6):(3'h4)])));
  assign wire5 = ($signed($unsigned({$signed(wire4)})) ?
                     $unsigned(wire1[(3'h7):(3'h4)]) : (~$unsigned((wire2 <= (wire3 ^ wire1)))));
  assign wire6 = wire0[(1'h1):(1'h1)];
  module7 #() modinst182 (.wire11(wire0), .clk(clk), .y(wire181), .wire8(wire5), .wire9(wire1), .wire10(wire6));
  assign wire183 = wire2[(1'h0):(1'h0)];
  assign wire184 = (!(wire2[(3'h7):(3'h7)] ^~ (!$signed((wire4 ?
                       wire5 : wire183)))));
  assign wire185 = (wire4 ?
                       (&(wire6 ?
                           (wire184[(2'h2):(1'h1)] ?
                               (wire5 <<< wire2) : $unsigned(wire4)) : $unsigned((wire3 | wire5)))) : ((~|(~|wire1)) <= ({wire184[(5'h10):(2'h2)]} ?
                           (+$unsigned(wire184)) : ((wire183 ^~ wire184) ?
                               $unsigned(wire6) : $unsigned(wire3)))));
  assign wire186 = ($unsigned(wire1) ?
                       $signed((^~(wire6[(4'hf):(4'hc)] & wire185))) : wire3[(4'hf):(2'h2)]);
  assign wire187 = wire181[(4'hd):(2'h2)];
  assign wire188 = ($unsigned($unsigned((8'hac))) ?
                       wire185[(2'h3):(2'h2)] : wire184);
  assign wire189 = $signed($unsigned(wire184));
  always
    @(posedge clk) begin
      if (($unsigned(wire3[(3'h4):(3'h4)]) <<< (wire185 - (((wire0 ?
          wire4 : wire183) == $signed(wire5)) <= wire189))))
        begin
          reg190 <= (&((($signed(wire187) * {wire6}) ?
              $unsigned(((8'had) >= wire185)) : {$unsigned((8'ha0))}) & wire3[(5'h11):(3'h6)]));
        end
      else
        begin
          reg190 <= wire181;
          if (reg190)
            begin
              reg191 <= wire186[(4'hf):(3'h6)];
            end
          else
            begin
              reg191 <= ((^~$signed(wire189[(4'h9):(4'h9)])) * $signed((+$signed(wire188[(3'h7):(3'h4)]))));
              reg192 <= reg190[(3'h5):(3'h4)];
              reg193 <= wire183[(3'h6):(3'h5)];
            end
          reg194 <= $unsigned(wire1);
          reg195 <= (wire5[(4'hc):(2'h3)] ?
              {(!(!(wire6 == reg190)))} : $unsigned((^~({wire185,
                  (8'ha0)} & ((8'ha5) == wire181)))));
          reg196 <= (wire181[(4'hd):(1'h0)] ?
              $unsigned(((8'had) ?
                  wire3[(3'h7):(2'h2)] : $unsigned((^~wire4)))) : (wire2[(2'h3):(2'h2)] >= reg194));
        end
      reg197 <= (wire3[(2'h3):(1'h0)] ? reg193 : reg196);
      reg198 <= ((8'hb9) ?
          ((!((+wire186) ?
              (!wire3) : $signed(wire185))) || (+reg193[(1'h1):(1'h0)])) : ($signed(wire3) + (~|wire5[(1'h1):(1'h1)])));
      if (({reg196[(1'h0):(1'h0)]} ?
          wire189[(4'h9):(2'h3)] : ((^reg195) ?
              wire188 : {$signed(((8'haf) ^ (7'h40)))})))
        begin
          reg199 <= wire4[(1'h0):(1'h0)];
          reg200 <= (wire4[(3'h4):(2'h2)] < $signed($signed(((+wire181) | reg197))));
          reg201 <= $signed(wire3);
          reg202 <= $signed(wire2);
        end
      else
        begin
          reg199 <= (!wire5);
        end
      reg203 <= ({$signed(($signed(wire188) ~^ {wire183}))} ?
          (^~(&$unsigned({wire6}))) : reg201[(2'h3):(1'h1)]);
    end
  assign wire204 = wire188[(4'h8):(3'h7)];
  assign wire205 = (|((reg196[(4'hd):(4'ha)] ?
                       reg195 : $unsigned((wire188 ?
                           wire0 : wire189))) - (reg202 ?
                       {reg202,
                           (reg191 ?
                               reg202 : reg194)} : $signed($unsigned((8'ha6))))));
endmodule

module module7
#(parameter param179 = (^~((8'ha6) ? (&(((8'hbb) != (8'hba)) ? (~(8'hb3)) : ((8'hac) ? (8'ha8) : (8'hae)))) : (8'h9c))), 
parameter param180 = (~&(|({param179, (~param179)} <= ((param179 ? param179 : (7'h42)) || {param179, param179})))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire178;
  wire [(4'he):(1'h0)] wire146;
  wire signed [(3'h7):(1'h0)] wire118;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire [(3'h5):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(4'he):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire176;
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  assign y = {wire178,
                 wire146,
                 wire118,
                 wire70,
                 wire69,
                 wire68,
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
                 wire41,
                 wire176,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  module12 #() modinst42 (.y(wire41), .wire13(wire9), .wire15(wire8), .wire16(wire11), .wire14(wire10), .clk(clk));
  always
    @(posedge clk) begin
      if ($signed($signed($unsigned(($signed(wire11) ?
          wire9 : $unsigned((8'hbb)))))))
        begin
          reg43 <= $signed(wire8);
          reg44 <= $unsigned($unsigned($unsigned(wire8)));
          reg45 <= (((8'hb9) ?
              (wire11[(2'h3):(2'h3)] << wire41) : wire9[(4'h8):(3'h4)]) && (($unsigned($signed((8'hb4))) + reg44) >> (~&wire11)));
          reg46 <= $unsigned($unsigned(reg44[(1'h1):(1'h1)]));
          reg47 <= wire10;
        end
      else
        begin
          if (((wire9[(3'h5):(1'h0)] > (($signed(reg44) ?
                  (wire11 ? reg43 : (7'h44)) : ((8'hbf) ? wire10 : wire41)) ?
              reg45[(4'hc):(3'h7)] : (~|(wire41 << reg44)))) >= (((reg46 != wire11) ?
                  $signed(wire10) : $unsigned(wire10[(3'h4):(1'h0)])) ?
              wire10 : $signed($signed($unsigned(wire41))))))
            begin
              reg43 <= reg47[(3'h6):(3'h5)];
              reg44 <= ((!(~$signed(wire10))) >= ($unsigned($signed((8'h9f))) ?
                  wire8 : (~{$unsigned(reg47), $signed(reg45)})));
              reg45 <= (({wire11, wire11[(3'h4):(3'h4)]} >>> ((!(reg45 ?
                      reg45 : reg47)) ?
                  $signed({reg47}) : ($unsigned((8'hb2)) + (reg44 ?
                      (8'hab) : reg45)))) + (&reg45[(4'hc):(3'h6)]));
            end
          else
            begin
              reg43 <= $unsigned((wire10[(2'h2):(2'h2)] << (reg47[(1'h1):(1'h1)] ?
                  (|wire8) : (wire10 ~^ reg45))));
              reg44 <= (reg45 ?
                  (+(reg47 ?
                      $unsigned(wire11[(3'h7):(3'h5)]) : $unsigned(wire10))) : reg46[(3'h5):(3'h4)]);
              reg45 <= (!(~$signed($signed(wire11))));
              reg46 <= $unsigned(wire8);
            end
          reg47 <= (reg45[(5'h11):(2'h3)] == (~(reg44[(2'h2):(1'h0)] ?
              {$unsigned(reg45), $signed(wire8)} : reg46[(4'hb):(4'h8)])));
          reg48 <= ((|($signed(reg44) + (wire10[(1'h0):(1'h0)] ^~ $signed(wire8)))) < (reg44[(2'h3):(2'h3)] ?
              ($signed((+reg45)) >= {$unsigned(wire9)}) : (reg46 ?
                  (((8'ha8) ? (8'hb4) : reg47) ?
                      ((8'ha0) ? wire10 : wire10) : ((7'h40) ?
                          wire8 : (7'h44))) : (^$signed(reg45)))));
          if (($signed(((reg45[(3'h4):(3'h4)] >= $unsigned(wire11)) > (&reg44[(3'h5):(2'h2)]))) ?
              ((~|reg46[(4'hd):(4'h9)]) ?
                  ({(reg43 ? reg48 : reg44)} | $unsigned({wire11,
                      wire9})) : $unsigned(reg47[(2'h2):(1'h1)])) : (~|$unsigned(wire8[(3'h6):(3'h4)]))))
            begin
              reg49 <= $unsigned($signed(reg44[(1'h1):(1'h0)]));
              reg50 <= (8'hbd);
            end
          else
            begin
              reg49 <= reg49[(5'h12):(3'h6)];
            end
          reg51 <= ($unsigned($unsigned($unsigned($unsigned(reg49)))) + ({((reg48 ?
                          reg48 : wire8) ?
                      (reg50 ? reg43 : reg45) : wire41)} ?
              ((reg43 ? (!(8'had)) : reg50[(3'h5):(3'h5)]) ?
                  ($signed(wire8) ?
                      (reg44 + (8'ha0)) : (wire9 != reg43)) : $unsigned($unsigned(reg45))) : wire8));
        end
      reg52 <= $signed((reg49 ?
          $unsigned($signed(reg49[(3'h7):(3'h6)])) : wire8));
      reg53 <= (wire41[(3'h4):(1'h0)] ~^ $signed(wire11[(3'h4):(3'h4)]));
      reg54 <= ((~^$unsigned((&{reg52}))) && (|(+wire8[(2'h3):(2'h3)])));
    end
  assign wire55 = ((~^$signed($unsigned($signed(reg47)))) && ($unsigned(((^reg52) & $unsigned(reg44))) ?
                      ($signed(wire41) >> $signed(reg45)) : ($signed((^~reg53)) != $unsigned($signed((7'h41))))));
  assign wire56 = $unsigned($unsigned($unsigned(wire9[(3'h7):(1'h1)])));
  assign wire57 = (reg44 ? (8'hab) : wire10);
  assign wire58 = ((((~&{reg47, reg44}) ?
                      ((reg50 ? reg43 : reg54) ?
                          wire41[(3'h5):(1'h0)] : (reg48 ~^ reg43)) : wire10[(1'h1):(1'h0)]) != $signed(wire10)) & ($unsigned(wire56) ?
                      wire8 : $signed(reg44)));
  assign wire59 = (wire56 ?
                      reg43[(3'h7):(3'h4)] : $signed({$unsigned(((8'hbe) ?
                              reg45 : wire58))}));
  assign wire60 = $unsigned($unsigned((wire57 ?
                      (^reg52[(4'he):(4'ha)]) : ($unsigned(wire11) >= {reg50}))));
  assign wire61 = (^~(^((8'hb9) | $signed((reg52 ? wire60 : reg50)))));
  assign wire62 = ((reg53 * reg50) > {(-$unsigned((~&reg44))),
                      {($unsigned(reg45) > wire8)}});
  assign wire63 = $signed((($signed(reg50) == (8'h9d)) && wire11[(1'h1):(1'h0)]));
  assign wire64 = $signed((|wire63[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg65 <= ($signed(wire56[(3'h5):(3'h5)]) >> ((wire11 <<< wire59[(1'h0):(1'h0)]) ?
          reg54 : ((wire61 ? {reg50, wire9} : wire11) ?
              {(reg51 ? wire41 : wire62),
                  $unsigned((8'ha4))} : $unsigned(((7'h43) <<< reg54)))));
      reg66 <= reg48[(1'h0):(1'h0)];
      reg67 <= (wire56 < wire64);
    end
  assign wire68 = wire62;
  assign wire69 = reg66;
  assign wire70 = (((+wire10[(3'h7):(1'h0)]) ^~ reg54[(2'h2):(1'h1)]) ?
                      (reg48[(4'h9):(4'h8)] ?
                          {$unsigned($signed(reg53))} : (+reg67[(4'hd):(4'hc)])) : {reg53[(2'h2):(2'h2)]});
  module71 #() modinst119 (.clk(clk), .wire74(reg45), .y(wire118), .wire72(wire62), .wire73(wire60), .wire76(wire55), .wire75(wire61));
  always
    @(posedge clk) begin
      reg120 <= ($signed((~|(reg52 | wire118[(1'h0):(1'h0)]))) ~^ wire56);
      reg121 <= $unsigned({reg45[(5'h11):(3'h7)]});
      reg122 <= wire55;
      reg123 <= (((^~{$unsigned(wire9)}) ?
              $unsigned($unsigned($unsigned((8'hb3)))) : wire11) ?
          $unsigned((!((wire10 ?
              reg66 : (8'hb9)) <= wire11[(4'h9):(2'h2)]))) : wire57[(2'h2):(2'h2)]);
      if ($unsigned(((|reg123[(3'h4):(3'h4)]) ?
          (($unsigned(reg65) <<< reg52[(2'h2):(1'h1)]) ?
              reg52[(4'ha):(4'ha)] : {reg67}) : (^$unsigned((^reg45))))))
        begin
          reg124 <= $unsigned(wire70);
        end
      else
        begin
          reg124 <= $signed($unsigned({{wire58, (^reg54)},
              (-reg120[(2'h3):(2'h3)])}));
        end
    end
  module125 #() modinst147 (.wire129(wire11), .wire128(wire10), .clk(clk), .wire127(wire118), .y(wire146), .wire130(wire70), .wire126(wire55));
  module148 #() modinst177 (wire176, clk, wire11, reg46, reg53, wire10, wire8);
  assign wire178 = wire57[(4'hf):(4'he)];
endmodule

module module148  (y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire153;
  input wire signed [(3'h4):(1'h0)] wire152;
  input wire signed [(4'ha):(1'h0)] wire151;
  input wire signed [(4'h8):(1'h0)] wire150;
  input wire [(3'h5):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire175;
  wire signed [(5'h10):(1'h0)] wire174;
  wire signed [(3'h4):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire [(4'h8):(1'h0)] wire170;
  wire signed [(4'hf):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire158;
  wire [(3'h7):(1'h0)] wire157;
  wire [(3'h7):(1'h0)] wire156;
  wire signed [(5'h12):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(3'h4):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(4'hd):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 (1'h0)};
  assign wire154 = $unsigned($unsigned(wire149[(2'h2):(2'h2)]));
  assign wire155 = $signed(((wire154 ?
                       $unsigned($unsigned(wire153)) : (wire151 ?
                           {wire154} : (|wire150))) != $unsigned($unsigned(wire149[(2'h3):(1'h1)]))));
  assign wire156 = (wire149[(2'h2):(1'h1)] ?
                       {wire152[(1'h0):(1'h0)]} : $signed((~|wire149[(3'h4):(2'h3)])));
  assign wire157 = {wire149[(1'h1):(1'h0)]};
  assign wire158 = wire149;
  always
    @(posedge clk) begin
      reg159 <= (~&(8'hab));
      reg160 <= $unsigned($signed($signed($signed(wire153))));
      reg161 <= ((reg160 ?
          wire158[(2'h2):(2'h2)] : (+(wire150[(2'h2):(2'h2)] ?
              $unsigned((8'hb8)) : (reg159 ?
                  (7'h43) : wire156)))) ^ (!$signed(($unsigned(wire154) ?
          $unsigned(wire156) : (8'hb2)))));
    end
  always
    @(posedge clk) begin
      if ((wire152[(2'h3):(2'h3)] ?
          ($unsigned(wire157[(3'h6):(1'h0)]) > $signed(wire152)) : reg161))
        begin
          if (reg160[(3'h6):(1'h0)])
            begin
              reg162 <= (({$signed({wire157,
                      wire156})} <<< $signed($unsigned($unsigned(wire158)))) != ((!$unsigned(wire149[(2'h2):(1'h0)])) ^ $unsigned((((8'ha8) ?
                      reg160 : wire149) ?
                  $signed(wire150) : $unsigned(reg161)))));
            end
          else
            begin
              reg162 <= ({(&reg162)} >>> (~|(-((wire158 ^ (8'hba)) ?
                  $unsigned(reg161) : {(8'hac), wire158}))));
              reg163 <= reg159;
              reg164 <= $unsigned((((|reg163) ?
                  (8'hab) : (reg159[(2'h2):(2'h2)] ?
                      (~reg159) : $signed(wire154))) | wire158[(1'h0):(1'h0)]));
              reg165 <= $signed((($signed((&wire158)) ?
                  $unsigned({wire149,
                      wire156}) : wire152[(3'h4):(2'h2)]) || ($unsigned({wire154}) ?
                  reg164 : ($signed(reg163) ?
                      (wire157 || reg160) : (wire152 >>> reg161)))));
            end
          reg166 <= ($unsigned((+reg160[(4'he):(4'h8)])) != ($signed((!(wire149 <<< reg164))) * $unsigned($unsigned((reg163 - reg164)))));
          reg167 <= wire149;
        end
      else
        begin
          reg162 <= reg164[(2'h2):(1'h1)];
          reg163 <= (reg161[(4'ha):(3'h7)] & (7'h44));
          if ((($unsigned($unsigned($unsigned(wire155))) | wire150) ?
              (!wire155) : (!(~^(|reg160)))))
            begin
              reg164 <= $unsigned($signed({($unsigned(reg165) ?
                      $signed(reg167) : {reg167, reg164}),
                  reg164}));
              reg165 <= ((($signed($unsigned((8'hb3))) == {$signed(reg163)}) >>> $unsigned($unsigned(wire150[(3'h4):(2'h3)]))) ?
                  reg165 : $unsigned(({(^(8'hbf))} - reg165[(3'h4):(1'h0)])));
            end
          else
            begin
              reg164 <= ($unsigned(wire151) ?
                  {wire151,
                      (reg159[(2'h2):(2'h2)] - ((reg160 ? wire151 : (8'hbc)) ?
                          wire154[(2'h2):(1'h1)] : (reg164 ?
                              reg162 : reg159)))} : (reg159 + reg160[(4'h8):(1'h0)]));
              reg165 <= $signed((8'hb5));
            end
          reg166 <= wire156;
        end
      reg168 <= reg167[(2'h3):(2'h3)];
    end
  assign wire169 = (((($unsigned(wire156) >= (wire156 ?
                               (8'hab) : reg165)) && $signed((reg166 <<< wire157))) ?
                           $unsigned((^~reg159[(2'h2):(1'h1)])) : (($unsigned(wire152) ?
                               (~reg165) : $signed(reg168)) << wire150)) ?
                       ($unsigned(wire154[(4'he):(4'hb)]) ?
                           reg164 : $signed(((wire150 ^~ reg167) ?
                               (^~reg162) : ((7'h42) ?
                                   wire157 : wire154)))) : (8'ha2));
  assign wire170 = ((reg167[(2'h2):(1'h0)] ?
                       wire151 : reg165) ~^ (~&reg160[(4'he):(3'h4)]));
  assign wire171 = reg166[(1'h1):(1'h1)];
  assign wire172 = $unsigned((~^($signed((reg164 ?
                       wire169 : wire151)) > wire171)));
  assign wire173 = $unsigned($unsigned(((reg168[(4'he):(4'he)] ^~ (!wire158)) ?
                       wire170 : $unsigned(reg163))));
  assign wire174 = wire169[(3'h5):(3'h5)];
  assign wire175 = (((((-wire170) ? wire154[(4'h8):(3'h6)] : {(8'hb5)}) ?
                               $unsigned(wire173) : reg161[(3'h6):(3'h5)]) ?
                           reg164[(1'h1):(1'h0)] : $signed((wire150[(1'h1):(1'h0)] < (8'hb6)))) ?
                       wire173 : wire152);
endmodule

module module125
#(parameter param144 = {(!(&(((8'ha2) >= (8'hb5)) ? {(8'hb8), (8'hbf)} : ((8'hbc) ? (8'h9c) : (8'hb8)))))}, 
parameter param145 = {(param144 ? ((param144 ^ param144) | (param144 + (param144 ? param144 : param144))) : ((8'ha3) << (!((8'ha0) ~^ param144))))})
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire130;
  input wire signed [(5'h13):(1'h0)] wire129;
  input wire signed [(5'h15):(1'h0)] wire128;
  input wire signed [(3'h7):(1'h0)] wire127;
  input wire [(3'h5):(1'h0)] wire126;
  wire [(4'hf):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire signed [(5'h11):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire140;
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg131 <= (+{$signed($unsigned(wire130[(3'h6):(3'h6)]))});
      reg132 <= $signed((wire127[(1'h1):(1'h0)] ?
          $unsigned((+(8'had))) : wire128));
      if ($unsigned(wire126))
        begin
          if ((~^$signed($signed((~|reg132)))))
            begin
              reg133 <= $unsigned(wire126);
              reg134 <= $signed($unsigned($unsigned((+$unsigned((8'hbe))))));
              reg135 <= $unsigned(reg131[(4'h9):(2'h2)]);
              reg136 <= (+reg135);
              reg137 <= reg135[(2'h3):(1'h1)];
            end
          else
            begin
              reg133 <= wire130[(4'h8):(2'h3)];
              reg134 <= (reg135[(2'h3):(2'h3)] ?
                  (-$signed(wire130[(4'h9):(1'h1)])) : $unsigned($signed({{wire129},
                      (7'h42)})));
            end
          reg138 <= reg133[(4'h9):(1'h0)];
          reg139 <= ($unsigned((~^{{(7'h42)},
              (wire127 ? wire129 : (8'ha2))})) >> reg135[(4'h9):(2'h3)]);
        end
      else
        begin
          reg133 <= (($signed(wire130) ?
              ($signed((^(8'hb8))) >>> $unsigned((wire130 ~^ wire128))) : reg136) >= $signed(($signed($signed(reg135)) & ((reg139 | wire129) ?
              (reg137 << reg139) : {wire129}))));
        end
    end
  assign wire140 = $signed(reg137[(1'h1):(1'h1)]);
  assign wire141 = wire129[(4'hf):(4'hb)];
  assign wire142 = $unsigned($signed($signed({(|reg133),
                       wire127[(2'h2):(1'h0)]})));
  assign wire143 = (-((({wire127, reg138} ?
                       wire127 : $unsigned((8'hb4))) - $unsigned((wire127 ?
                       reg134 : reg131))) && reg135[(4'h8):(2'h2)]));
endmodule

module module71
#(parameter param117 = {{(^(((8'h9f) - (8'hac)) ? {(7'h44), (8'ha2)} : ((8'ha6) ? (8'haa) : (8'hb8))))}})
(y, clk, wire76, wire75, wire74, wire73, wire72);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire [(4'hc):(1'h0)] wire73;
  input wire signed [(5'h13):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire113;
  wire signed [(3'h7):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire77;
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  assign y = {wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg115,
                 reg114,
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
                 (1'h0)};
  assign wire77 = (~&(wire76[(3'h4):(2'h3)] ?
                      (wire73 ?
                          wire75[(3'h4):(1'h1)] : {(wire75 ? (8'hba) : wire74),
                              (wire74 ?
                                  wire73 : wire75)}) : (~$unsigned(wire74[(1'h1):(1'h0)]))));
  assign wire78 = (~|wire76[(1'h1):(1'h1)]);
  assign wire79 = (wire77 ?
                      (wire76[(2'h3):(1'h0)] | (|(~&wire77[(4'hf):(3'h4)]))) : ($unsigned((!(wire77 | wire77))) ?
                          ((-{(8'h9c)}) ?
                              wire72[(4'hd):(2'h2)] : $signed((^~(8'hae)))) : (wire75[(2'h2):(2'h2)] ^ ((wire74 ?
                                  wire78 : (8'haf)) ?
                              (&wire73) : $signed(wire72)))));
  assign wire80 = ($unsigned($unsigned(wire75)) ?
                      wire74 : ({wire73, wire79} ?
                          wire72[(5'h12):(4'he)] : (&(!wire75))));
  assign wire81 = $unsigned((+(+wire77[(4'h8):(1'h1)])));
  assign wire82 = $unsigned($signed((wire73[(4'h9):(4'h9)] + ((wire74 ^~ wire77) ?
                      (~|wire81) : wire78[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if (wire82)
        begin
          if (wire82[(3'h7):(3'h4)])
            begin
              reg83 <= wire78;
              reg84 <= (~|(($signed(wire75) ?
                  {{(8'ha6), wire80}} : ($signed(reg83) ?
                      wire72 : $signed(wire76))) < wire80[(1'h0):(1'h0)]));
              reg85 <= ($signed(wire72) & ((~^wire74) ?
                  ($signed(((8'ha4) ^~ wire72)) && ((wire79 << wire82) >> $unsigned(wire74))) : $unsigned($signed(reg83[(4'hb):(4'hb)]))));
              reg86 <= ($unsigned(wire78[(2'h2):(1'h1)]) ?
                  (reg84 << (reg85[(2'h3):(2'h3)] ?
                      wire74 : wire76)) : reg83[(4'ha):(1'h0)]);
            end
          else
            begin
              reg83 <= $unsigned($signed(($unsigned((~&wire75)) != wire76[(3'h4):(2'h2)])));
              reg84 <= wire80;
            end
          reg87 <= (((~(~&((8'hbe) ? reg85 : wire81))) <= $unsigned(wire80)) ?
              (&(^~(+reg85))) : wire79);
          if ($signed(wire79[(1'h1):(1'h1)]))
            begin
              reg88 <= wire81;
              reg89 <= $unsigned($unsigned({({wire76} ?
                      ((8'ha7) || (8'hb2)) : (wire73 - wire81)),
                  {(wire72 ^~ reg87), $signed(reg88)}}));
              reg90 <= (-(wire75 == $unsigned($signed(((7'h40) + reg85)))));
              reg91 <= (((({wire81} ?
                  wire73[(3'h5):(2'h2)] : $unsigned(reg87)) >= ((~&wire72) ?
                  (wire82 != wire75) : reg83[(4'ha):(4'h9)])) << reg90[(3'h4):(2'h3)]) && $signed($unsigned((+$unsigned(wire78)))));
            end
          else
            begin
              reg88 <= {$unsigned(reg85[(2'h2):(1'h1)])};
              reg89 <= wire73[(3'h7):(3'h4)];
              reg90 <= (8'hab);
            end
          reg92 <= ((-wire80) && $signed((wire75[(3'h6):(1'h0)] ?
              ((!wire77) ?
                  (wire77 ? wire78 : reg86) : (^~wire80)) : $signed(wire79))));
        end
      else
        begin
          reg83 <= $signed((~|$unsigned($unsigned((~|(7'h41))))));
          reg84 <= reg83[(3'h5):(2'h2)];
        end
      reg93 <= (reg85[(1'h1):(1'h0)] ?
          $signed($unsigned(reg91[(3'h4):(3'h4)])) : $unsigned(({(reg86 & reg91)} ^~ (-reg85[(2'h3):(2'h2)]))));
      reg94 <= reg90[(4'ha):(2'h3)];
      reg95 <= ((($signed((wire75 != (8'hbe))) ?
          wire74[(2'h3):(2'h3)] : {wire81}) << reg88[(3'h4):(1'h0)]) && (~^(-reg92)));
      if (((+(~(-reg90))) <<< (^(~|reg93[(2'h2):(1'h0)]))))
        begin
          reg96 <= ($unsigned((&$signed((+wire77)))) ?
              ({$signed(reg94[(5'h13):(5'h13)])} ?
                  (^$unsigned(wire81[(3'h4):(3'h4)])) : wire72[(3'h5):(1'h1)]) : $signed((((reg94 ?
                          wire80 : wire76) ?
                      $unsigned(reg88) : (reg84 < reg92)) ?
                  {(reg94 ? reg86 : wire75)} : (wire80 ?
                      (reg85 >= (8'hbf)) : (reg88 == wire78)))));
        end
      else
        begin
          reg96 <= (wire78 >>> (((8'ha0) > $unsigned($signed(reg89))) ?
              $unsigned((wire73[(4'h8):(3'h6)] * {wire78,
                  (8'hb0)})) : $signed(reg86[(3'h6):(3'h5)])));
          reg97 <= reg91[(3'h5):(2'h2)];
          if ((($unsigned(((reg85 & reg88) ?
                  wire72[(3'h6):(2'h2)] : ((8'hae) < reg92))) - wire73[(2'h2):(1'h0)]) ?
              wire76 : ((8'h9d) <= (7'h42))))
            begin
              reg98 <= wire74;
              reg99 <= $signed($unsigned((reg85[(2'h2):(1'h0)] | $unsigned($signed(wire81)))));
              reg100 <= (reg96[(1'h1):(1'h1)] ?
                  (~&reg85[(1'h0):(1'h0)]) : ($unsigned((~&(-wire77))) ?
                      wire79 : ($signed(((8'ha0) ? reg83 : wire74)) ?
                          (!$unsigned(wire77)) : $signed(reg88[(3'h5):(1'h0)]))));
              reg101 <= $unsigned($signed(reg94));
            end
          else
            begin
              reg98 <= reg93[(3'h5):(3'h5)];
            end
          reg102 <= (&(+(^~reg94)));
        end
    end
  assign wire103 = $signed($unsigned((reg93[(4'ha):(2'h3)] ?
                       ($signed(wire72) ^ (~wire79)) : $unsigned((reg90 ?
                           reg87 : (8'hbc))))));
  assign wire104 = (({$unsigned((reg85 * wire73)),
                           ($unsigned(reg99) ^~ $unsigned(reg96))} != wire72) ?
                       (^~$signed(reg90[(4'h8):(1'h0)])) : (reg102 - wire76[(2'h2):(1'h0)]));
  assign wire105 = $signed(wire76);
  assign wire106 = wire80[(1'h0):(1'h0)];
  assign wire107 = $signed((reg87 >>> $unsigned(reg101[(2'h3):(2'h3)])));
  assign wire108 = wire77[(5'h13):(3'h6)];
  assign wire109 = (wire73 ?
                       wire82[(4'hf):(4'hf)] : (^(reg93 ?
                           ($unsigned((8'hb9)) < {wire72,
                               reg101}) : $signed({wire81, reg93}))));
  assign wire110 = (~reg91[(4'hc):(1'h1)]);
  assign wire111 = (&(($unsigned((wire109 ? reg98 : reg99)) ~^ ($signed(reg95) ?
                       wire80 : wire109)) + wire80));
  assign wire112 = wire74[(1'h0):(1'h0)];
  assign wire113 = $unsigned($unsigned($unsigned((wire76[(2'h3):(1'h0)] & $unsigned((8'hb6))))));
  always
    @(posedge clk) begin
      reg114 <= wire112[(3'h7):(3'h6)];
      reg115 <= (reg100[(1'h1):(1'h0)] >= (wire75[(1'h0):(1'h0)] < (~&{(!reg97)})));
    end
  assign wire116 = reg94[(5'h11):(4'he)];
endmodule

module module12
#(parameter param39 = (^({(+(^~(8'hae))), (((8'ha1) + (8'ha7)) >= (8'hb7))} | ((!{(8'ha7), (7'h44)}) ? (~&(^~(8'ha3))) : (((8'hbf) ? (8'hac) : (8'h9c)) >> {(8'hae), (8'ha3)})))), 
parameter param40 = (param39 ? (|(~(~{param39, (8'hb4)}))) : (param39 >= (^~(|(param39 == param39))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire [(3'h7):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(5'h12):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire [(4'hd):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire17 = $signed((|(($signed(wire16) ?
                          wire16[(4'hb):(1'h1)] : $signed(wire14)) ?
                      {$unsigned(wire15),
                          wire14[(4'ha):(4'h8)]} : wire13[(1'h1):(1'h1)])));
  assign wire18 = ($signed($unsigned(((wire14 * (8'h9e)) ?
                      {wire14} : (wire15 - wire15)))) && (((^~(^wire13)) ?
                          $signed((~&wire13)) : $unsigned($unsigned(wire13))) ?
                      ((~&wire15[(1'h1):(1'h0)]) ?
                          ((wire16 ? (8'hb5) : wire15) ?
                              $signed(wire16) : $unsigned(wire13)) : ((!(8'hbc)) ?
                              $signed(wire15) : $signed((8'hbb)))) : wire16));
  assign wire19 = ($signed((-(!$signed(wire14)))) ?
                      ((!(wire13[(2'h3):(1'h0)] ?
                          $signed(wire13) : wire13)) && wire18) : (8'h9c));
  assign wire20 = wire18;
  assign wire21 = ($signed($unsigned(($signed(wire13) > {wire17}))) ?
                      (($signed(wire18[(4'h9):(4'h8)]) >= (wire17 >> $unsigned(wire15))) - wire20[(4'h9):(3'h7)]) : ($signed(wire19) ?
                          wire17 : ({{wire16, wire18},
                              (wire19 ^ wire19)} >> (wire19 != wire16))));
  assign wire22 = ($signed(wire17[(2'h2):(1'h0)]) ^ ($unsigned(({wire20} ?
                      (wire13 ? wire19 : wire16) : (wire17 ?
                          (8'ha1) : wire16))) > wire13));
  always
    @(posedge clk) begin
      reg23 <= (-$signed(($signed(wire18[(1'h0):(1'h0)]) * (+wire17))));
      reg24 <= $signed(wire22);
    end
  assign wire25 = ({reg24, $signed((+wire20))} ?
                      $unsigned(reg23[(3'h6):(2'h3)]) : $unsigned(reg23));
  assign wire26 = {((((reg24 ? wire21 : reg23) * wire19) ^ wire21) ?
                          {$signed($signed(reg24))} : wire21)};
  assign wire27 = $signed(wire17);
  assign wire28 = ($signed($signed((reg23[(1'h1):(1'h0)] >> reg24))) ?
                      (wire19[(4'ha):(3'h6)] <= (((|(8'ha2)) ?
                          $unsigned(wire19) : $signed(wire14)) <<< {wire27[(3'h5):(3'h4)],
                          (wire16 ?
                              wire17 : wire13)})) : wire17[(4'hc):(4'h8)]);
  assign wire29 = $unsigned($signed(wire22));
  assign wire30 = (^(((8'ha3) <= $signed((wire15 ? (8'ha3) : wire27))) ?
                      $signed((wire27[(4'hb):(1'h1)] ?
                          $unsigned(wire26) : $unsigned(wire25))) : (($unsigned((8'hbb)) ?
                          reg24[(2'h3):(2'h2)] : ((8'ha8) & wire18)) ~^ $unsigned({wire21}))));
  assign wire31 = ($unsigned(($signed((wire26 ?
                          wire14 : wire16)) >>> (^~wire21[(3'h4):(2'h3)]))) ?
                      {$signed((~|wire29[(1'h1):(1'h1)]))} : (-(-((wire26 ?
                          wire22 : wire21) * wire14))));
  assign wire32 = (($signed(wire17[(3'h4):(2'h2)]) >= (-((wire29 ?
                              wire22 : wire25) ?
                          (8'h9d) : (wire21 ? wire20 : wire30)))) ?
                      $signed({wire19}) : ((wire20[(3'h7):(3'h4)] ~^ wire21) >>> (((wire20 + wire22) ?
                              $signed((8'h9d)) : wire17) ?
                          wire13[(2'h2):(1'h0)] : (&(+wire30)))));
  assign wire33 = (wire26[(4'ha):(3'h7)] ~^ ((~&wire29[(1'h0):(1'h0)]) ?
                      wire25[(3'h4):(1'h0)] : ({(wire15 <= wire32)} >>> $signed(wire21))));
  assign wire34 = {wire13[(2'h2):(1'h1)],
                      ((8'hae) ?
                          wire15[(2'h2):(2'h2)] : {(~^$unsigned(wire13))})};
  assign wire35 = $signed(wire22);
  assign wire36 = wire28[(4'hf):(1'h1)];
  assign wire37 = (~&wire17);
  assign wire38 = wire30[(2'h3):(1'h0)];
endmodule
