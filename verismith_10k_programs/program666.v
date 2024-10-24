module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(5'h14):(1'h0)] wire157;
  wire signed [(5'h13):(1'h0)] wire159;
  wire [(4'ha):(1'h0)] wire160;
  wire signed [(4'hb):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire162;
  wire [(4'he):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire164;
  wire [(5'h12):(1'h0)] wire165;
  wire [(4'hf):(1'h0)] wire166;
  wire [(2'h2):(1'h0)] wire167;
  wire [(5'h12):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire367;
  wire [(5'h15):(1'h0)] wire369;
  reg signed [(5'h15):(1'h0)] reg378 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg377 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg376 = (1'h0);
  reg [(2'h3):(1'h0)] reg375 = (1'h0);
  reg [(3'h7):(1'h0)] reg374 = (1'h0);
  reg [(3'h5):(1'h0)] reg373 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg372 = (1'h0);
  reg [(3'h5):(1'h0)] reg371 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg [(4'hf):(1'h0)] reg178 = (1'h0);
  reg [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(3'h6):(1'h0)] reg169 = (1'h0);
  reg [(4'he):(1'h0)] reg168 = (1'h0);
  assign y = {wire5,
                 wire60,
                 wire157,
                 wire159,
                 wire160,
                 wire161,
                 wire162,
                 wire163,
                 wire164,
                 wire165,
                 wire166,
                 wire167,
                 wire181,
                 wire182,
                 wire367,
                 wire369,
                 reg378,
                 reg377,
                 reg376,
                 reg375,
                 reg374,
                 reg373,
                 reg372,
                 reg371,
                 reg180,
                 reg179,
                 reg178,
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
                 (1'h0)};
  assign wire5 = (~(&wire0));
  module6 #() modinst61 (.y(wire60), .wire9(wire1), .wire8(wire2), .clk(clk), .wire10(wire5), .wire7(wire3));
  module62 #() modinst158 (.wire66(wire60), .wire63(wire5), .y(wire157), .wire64(wire0), .clk(clk), .wire65(wire2));
  assign wire159 = wire2[(4'hc):(1'h1)];
  assign wire160 = (&(-(-((wire2 <<< wire1) ?
                       $unsigned((8'h9c)) : {wire0, wire157}))));
  assign wire161 = (-$unsigned((|wire60)));
  assign wire162 = (wire2 ?
                       (8'hb9) : ({(wire5[(4'hd):(4'hb)] ?
                               (wire4 & wire4) : (7'h42)),
                           wire4[(4'he):(4'he)]} - {(|wire1[(2'h2):(2'h2)])}));
  assign wire163 = (~&((wire161[(1'h1):(1'h1)] ?
                       wire2[(5'h11):(3'h7)] : (^~wire161)) & ({$signed(wire5),
                       {wire162, (7'h40)}} || {(8'hbb), $unsigned(wire159)})));
  assign wire164 = ((~|{$unsigned({wire159,
                           wire161})}) <<< $signed((wire60[(1'h0):(1'h0)] ?
                       $signed(wire5[(4'hd):(4'hd)]) : {$unsigned(wire159)})));
  assign wire165 = $unsigned((wire2 ?
                       (({wire3} > $signed(wire60)) ?
                           (-((8'ha3) ^ wire163)) : (8'h9c)) : ({$signed(wire157)} >> (8'ha7))));
  assign wire166 = (wire3 ?
                       ((8'hae) > wire0[(2'h2):(1'h0)]) : $signed(wire3[(4'h8):(3'h7)]));
  assign wire167 = ((wire2 ~^ (((wire157 - wire163) ?
                           (wire160 ? (8'hb8) : wire1) : $unsigned(wire166)) ?
                       $signed(wire162[(3'h4):(3'h4)]) : $signed(wire157))) <= {wire2});
  always
    @(posedge clk) begin
      reg168 <= wire2;
      reg169 <= (wire161[(4'hb):(4'ha)] ?
          $signed($signed(($unsigned(reg168) ?
              wire159 : $signed((8'h9e))))) : ((wire4[(2'h3):(1'h1)] ?
                  wire159 : $signed({(8'hb2)})) ?
              (&wire165[(3'h6):(3'h4)]) : ((~^$signed(reg168)) <<< ($unsigned(wire160) ?
                  (wire161 ? wire157 : wire165) : (wire165 - wire161)))));
      reg170 <= wire165;
    end
  always
    @(posedge clk) begin
      if ((~^$signed({reg169})))
        begin
          reg171 <= (wire5[(1'h1):(1'h1)] ^~ (8'haa));
          reg172 <= wire160;
        end
      else
        begin
          reg171 <= (wire2 ?
              $unsigned($unsigned((~&(~wire157)))) : $signed(wire159[(3'h4):(1'h1)]));
          if (reg172)
            begin
              reg172 <= $signed($unsigned((((-wire164) ?
                  wire163[(3'h4):(1'h0)] : (wire160 ?
                      (8'hbe) : reg168)) >>> $unsigned((wire5 - reg170)))));
              reg173 <= (~&$signed($unsigned(wire160)));
              reg174 <= $unsigned((reg173[(2'h2):(1'h0)] ?
                  $unsigned(wire161[(3'h4):(1'h1)]) : wire161));
            end
          else
            begin
              reg172 <= reg169[(3'h6):(1'h0)];
            end
          reg175 <= (|(+{(~&{wire5, reg168}), $unsigned($unsigned(reg172))}));
          if ($signed({$unsigned((((8'ha3) | wire163) ? (-wire0) : (&reg173))),
              wire5[(4'hb):(4'hb)]}))
            begin
              reg176 <= {wire159[(2'h2):(1'h0)], wire3[(3'h7):(3'h5)]};
              reg177 <= ($unsigned((~&$signed((wire167 ? reg174 : (8'ha5))))) ?
                  $signed((((!reg175) == wire162[(2'h2):(1'h0)]) ?
                      ({wire60, wire3} ?
                          (wire162 ?
                              reg176 : wire160) : (+reg170)) : (|$unsigned(wire3)))) : ($unsigned((~|wire1)) <<< $signed(($signed(reg169) ?
                      {wire162, (8'h9c)} : (wire162 ~^ wire162)))));
            end
          else
            begin
              reg176 <= reg177[(5'h12):(4'he)];
              reg177 <= $signed($unsigned((($signed(wire164) ?
                      ((8'ha1) ^~ wire167) : $unsigned((8'ha8))) ?
                  (wire164 ^ wire159) : (+wire159))));
              reg178 <= reg170;
              reg179 <= (($signed(wire157[(2'h2):(1'h0)]) << reg170[(2'h2):(2'h2)]) + (~&($unsigned($signed(wire4)) != wire162)));
            end
        end
      reg180 <= wire159;
    end
  assign wire181 = wire5[(4'hf):(4'hc)];
  assign wire182 = wire157;
  module183 #() modinst368 (.clk(clk), .wire188(wire164), .wire186(wire166), .wire185(wire162), .y(wire367), .wire187(wire157), .wire184(reg179));
  module303 #() modinst370 (wire369, clk, reg175, wire166, reg172, reg177);
  always
    @(posedge clk) begin
      if ($signed(($unsigned((reg175 - $unsigned(wire0))) ?
          wire367 : (|({wire0, wire2} == $unsigned(wire157))))))
        begin
          if ($unsigned(((&wire367[(4'h9):(3'h5)]) & {$signed({wire5}),
              (|$signed(reg174))})))
            begin
              reg371 <= reg172[(4'hc):(3'h4)];
            end
          else
            begin
              reg371 <= wire2;
              reg372 <= {reg178[(4'hc):(2'h2)],
                  $unsigned($signed((wire161[(1'h0):(1'h0)] || $unsigned(wire167))))};
            end
          reg373 <= wire160;
          if ((reg177 <= wire157[(4'hf):(4'hb)]))
            begin
              reg374 <= wire1[(3'h7):(3'h7)];
              reg375 <= wire4;
              reg376 <= (!$unsigned(wire182[(4'hc):(2'h2)]));
            end
          else
            begin
              reg374 <= (&($unsigned((!$unsigned(wire181))) | (($signed(reg375) ^~ wire3[(3'h7):(2'h2)]) ~^ {(reg371 ?
                      wire0 : reg175),
                  (reg170 ? wire162 : reg372)})));
            end
          reg377 <= {wire161[(3'h4):(2'h3)]};
          reg378 <= $signed($signed((wire165[(4'hc):(3'h6)] ?
              $unsigned(reg372) : (reg176 * (reg170 < reg169)))));
        end
      else
        begin
          if ((((+(reg376[(1'h1):(1'h1)] != (-(8'hb8)))) | $unsigned(wire369)) ?
              reg373[(3'h5):(2'h2)] : ((!{(!reg179)}) >>> (!$unsigned({wire4,
                  wire4})))))
            begin
              reg371 <= reg173[(2'h3):(2'h2)];
              reg372 <= $unsigned((8'ha4));
              reg373 <= $unsigned($signed(((~(wire1 + (7'h44))) >>> wire159)));
            end
          else
            begin
              reg371 <= wire164[(1'h0):(1'h0)];
              reg372 <= wire60;
              reg373 <= $signed(reg375);
              reg374 <= wire60;
            end
          reg375 <= $unsigned({$signed(wire166[(4'h8):(3'h7)]),
              (&wire60[(2'h3):(2'h2)])});
          reg376 <= $unsigned((reg180[(3'h5):(3'h5)] ?
              $signed(reg173[(2'h3):(1'h1)]) : wire159));
        end
    end
endmodule

module module183  (y, clk, wire188, wire187, wire186, wire185, wire184);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire188;
  input wire signed [(3'h7):(1'h0)] wire187;
  input wire signed [(4'he):(1'h0)] wire186;
  input wire signed [(5'h13):(1'h0)] wire185;
  input wire signed [(5'h10):(1'h0)] wire184;
  wire signed [(4'hb):(1'h0)] wire366;
  wire signed [(5'h11):(1'h0)] wire220;
  wire signed [(5'h14):(1'h0)] wire195;
  wire signed [(3'h7):(1'h0)] wire194;
  wire [(5'h10):(1'h0)] wire193;
  wire signed [(4'hf):(1'h0)] wire190;
  wire [(5'h13):(1'h0)] wire189;
  wire [(5'h14):(1'h0)] wire222;
  wire signed [(4'h9):(1'h0)] wire223;
  wire [(4'hc):(1'h0)] wire227;
  wire [(4'hd):(1'h0)] wire301;
  wire [(3'h5):(1'h0)] wire364;
  reg signed [(4'hf):(1'h0)] reg191 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(4'he):(1'h0)] reg197 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg199 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg201 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg224 = (1'h0);
  reg [(4'h8):(1'h0)] reg225 = (1'h0);
  reg [(4'hc):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg228 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg229 = (1'h0);
  reg [(5'h13):(1'h0)] reg230 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(4'h9):(1'h0)] reg232 = (1'h0);
  assign y = {wire366,
                 wire220,
                 wire195,
                 wire194,
                 wire193,
                 wire190,
                 wire189,
                 wire222,
                 wire223,
                 wire227,
                 wire301,
                 wire364,
                 reg191,
                 reg192,
                 reg196,
                 reg197,
                 reg198,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg224,
                 reg225,
                 reg226,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 (1'h0)};
  assign wire189 = $signed({wire188,
                       (wire187[(3'h5):(1'h1)] >= $unsigned((wire186 ?
                           (8'ha2) : wire185)))});
  assign wire190 = $unsigned(wire189[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg191 <= (8'h9e);
      reg192 <= (wire184 | $signed({reg191[(1'h0):(1'h0)], {wire184}}));
    end
  assign wire193 = {{(~&((wire189 * wire190) || (+(7'h40))))}};
  assign wire194 = (wire186[(4'h9):(2'h3)] == {wire184[(4'h9):(3'h6)],
                       (-wire185)});
  assign wire195 = (wire188[(1'h0):(1'h0)] ?
                       wire186[(4'ha):(1'h1)] : $unsigned((-$unsigned($unsigned(wire186)))));
  always
    @(posedge clk) begin
      if (({wire190, wire190[(3'h4):(3'h4)]} || wire193[(2'h2):(1'h0)]))
        begin
          reg196 <= {(8'ha9)};
          if (((~&((8'hac) * ((wire187 > wire190) <= wire186))) ?
              ($unsigned({reg191[(4'hc):(4'hc)],
                  (-wire194)}) && reg192[(2'h3):(1'h1)]) : (^$signed(wire185[(4'hb):(4'ha)]))))
            begin
              reg197 <= $unsigned(((($signed(reg192) != $unsigned(wire189)) && {(^~reg192)}) ?
                  wire194 : (|(|$unsigned(wire189)))));
              reg198 <= reg192[(3'h4):(2'h3)];
            end
          else
            begin
              reg197 <= wire184[(4'ha):(3'h5)];
            end
          reg199 <= $signed(wire189[(4'h9):(4'h8)]);
          reg200 <= wire187;
        end
      else
        begin
          reg196 <= $signed(((~^{(wire193 ? reg196 : wire188),
                  (wire184 ? wire194 : wire194)}) ?
              reg199 : (8'ha5)));
          reg197 <= (~&(&($signed((-(8'ha5))) ?
              reg197[(4'h9):(3'h6)] : {{wire189}})));
        end
      reg201 <= (reg191 ?
          {reg191[(4'he):(2'h2)],
              $unsigned(((~wire193) ?
                  $unsigned(reg196) : (reg196 ?
                      wire184 : wire187)))} : (((8'hb6) <<< ((reg199 & wire188) & (wire185 ?
              reg192 : wire186))) >> reg197));
      reg202 <= (&((~|(-(reg198 ? reg198 : reg200))) >= reg197));
      reg203 <= (reg196 && (~reg191));
    end
  module204 #() modinst221 (.clk(clk), .wire207(wire195), .wire206(wire189), .wire208(reg192), .y(wire220), .wire205(wire190), .wire209(reg197));
  assign wire222 = $unsigned((8'hb9));
  assign wire223 = (-$signed($unsigned(wire189[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg224 <= (-($signed((8'hb5)) ?
          (wire189[(3'h4):(2'h2)] <<< {(wire185 ?
                  reg198 : wire195)}) : ((wire190 <<< {(8'h9f), wire194}) ?
              $unsigned($unsigned(wire194)) : {$unsigned(reg192),
                  (^wire184)})));
      reg225 <= reg191;
      reg226 <= $unsigned((((~^{(7'h41), reg224}) ?
              ((^wire189) ?
                  $unsigned(wire220) : $unsigned(wire185)) : ((reg200 ^ wire195) <<< $signed(reg191))) ?
          $signed(reg200) : ($unsigned(reg200[(4'hc):(3'h5)]) ?
              reg201[(4'hb):(3'h5)] : (wire189 ?
                  $signed(wire194) : (wire187 <= reg203)))));
    end
  assign wire227 = ((~^reg191) != (8'ha0));
  always
    @(posedge clk) begin
      reg228 <= reg198;
      reg229 <= (&wire220[(4'hb):(1'h0)]);
      reg230 <= $unsigned({wire222[(5'h11):(4'hd)]});
      reg231 <= {{$unsigned(reg224)},
          (~&(($signed(wire184) ^~ (wire227 ^~ wire223)) ?
              {$unsigned(reg200)} : reg191[(4'hb):(2'h3)]))};
      if ((~^reg231))
        begin
          reg232 <= {(((^~(8'haa)) ?
                  ((reg203 ? reg196 : (8'h9f)) ?
                      (~|reg192) : (wire187 ?
                          reg200 : reg201)) : (wire190 >> $signed(wire190))) >= {$unsigned(wire190),
                  wire194[(3'h6):(2'h2)]}),
              $unsigned($signed((~$signed(reg203))))};
        end
      else
        begin
          reg232 <= ((($signed(reg200[(5'h10):(1'h0)]) ?
                  (^((7'h43) | reg224)) : wire220) ~^ reg230[(2'h3):(2'h2)]) ?
              reg192[(2'h2):(1'h0)] : $unsigned($signed(($unsigned(wire185) ^~ (reg199 ?
                  (8'hbd) : reg201)))));
        end
    end
  module233 #() modinst302 (wire301, clk, reg230, wire223, reg225, wire190);
  module303 #() modinst365 (.wire305(reg225), .wire304(reg203), .wire307(wire193), .y(wire364), .clk(clk), .wire306(reg201));
  assign wire366 = ($signed($unsigned({wire188[(3'h4):(1'h1)],
                       (~&wire194)})) ^~ $signed((8'h9d)));
endmodule

module module62
#(parameter param155 = (((!{(8'hb6), ((8'hb3) && (8'hb1))}) + ((!{(8'hb8), (8'hb1)}) ? (~((7'h44) ? (8'hb4) : (8'haf))) : (((8'h9d) << (8'hb0)) < ((8'hb7) ? (8'hbc) : (8'hb8))))) ? ({{((8'ha3) != (8'hb5))}, (((7'h42) ? (8'h9d) : (8'ha4)) ^~ ((8'hb3) || (8'hab)))} - {(8'hb3)}) : (~^((((7'h43) || (8'ha6)) ? (8'ha7) : (~^(8'hb6))) ? (((8'ha6) ? (8'hba) : (8'haa)) ? ((7'h41) & (8'hb8)) : ((8'hbe) && (8'hbd))) : ((-(8'had)) <= ((8'had) ? (7'h42) : (8'hab)))))), 
parameter param156 = param155)
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire66;
  input wire signed [(5'h15):(1'h0)] wire65;
  input wire [(5'h13):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire signed [(3'h6):(1'h0)] wire146;
  wire signed [(4'h9):(1'h0)] wire67;
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  assign y = {wire154,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire146,
                 wire67,
                 reg153,
                 reg152,
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
                 reg68,
                 (1'h0)};
  assign wire67 = wire65;
  always
    @(posedge clk) begin
      if ($unsigned(wire67[(3'h4):(3'h4)]))
        begin
          if (wire63[(2'h2):(1'h0)])
            begin
              reg68 <= wire63[(2'h2):(2'h2)];
              reg69 <= ($unsigned($signed(wire63[(3'h5):(1'h0)])) ?
                  $signed($unsigned(((~wire64) - wire67[(3'h7):(3'h7)]))) : $unsigned(($signed((wire66 ?
                          wire65 : wire63)) ?
                      $unsigned((~&wire66)) : wire63[(3'h7):(3'h7)])));
              reg70 <= (^(wire65 || (8'hab)));
              reg71 <= wire66[(1'h0):(1'h0)];
              reg72 <= wire67[(4'h9):(3'h6)];
            end
          else
            begin
              reg68 <= ($unsigned(reg72) ?
                  {wire64,
                      ({((8'hb8) ? wire67 : reg69)} ?
                          (reg68 ?
                              $unsigned(reg70) : (reg68 ?
                                  reg72 : reg69)) : {(reg72 ?
                                  (8'h9f) : (8'ha3)),
                              (reg69 - (8'h9e))})} : wire64[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          reg68 <= wire65[(4'hf):(4'h9)];
          if (($unsigned(reg69) || reg71))
            begin
              reg69 <= ($unsigned((wire63[(2'h3):(1'h1)] ?
                  reg70 : ({reg68, wire66} ?
                      $unsigned(wire67) : (reg71 ?
                          reg72 : wire65)))) * $unsigned(wire67));
            end
          else
            begin
              reg69 <= (((&(&{wire63, wire64})) ?
                  (!{(wire67 ? wire64 : reg71),
                      $signed(wire67)}) : (-reg72)) <= reg70[(3'h6):(1'h0)]);
              reg70 <= (|(wire66 * (~^((reg69 || (8'hac)) <<< reg68[(1'h1):(1'h0)]))));
            end
          reg71 <= ((({{(8'ha0), wire65}, reg71} ?
              (!wire63) : $signed((&reg68))) || $unsigned($unsigned((^reg70)))) | wire67);
          if (wire64[(2'h2):(2'h2)])
            begin
              reg72 <= ($unsigned($signed(reg72[(4'hb):(1'h1)])) <<< (&(reg70 ?
                  wire63 : (wire64 ? wire66 : (~^(8'hb8))))));
              reg73 <= $unsigned((~$signed($signed({reg68, wire64}))));
              reg74 <= (wire66 ?
                  (-$signed($signed(reg72[(4'he):(3'h4)]))) : (+wire64));
              reg75 <= ($signed((reg73[(4'h8):(3'h4)] ?
                  $unsigned((^~wire66)) : ((^reg70) ?
                      ((8'ha6) + reg74) : wire66))) ~^ wire64);
            end
          else
            begin
              reg72 <= ((~&(($signed(reg70) <= wire65[(4'hc):(4'h8)]) ?
                  (~|(~|reg69)) : ({wire63,
                      wire65} || reg71[(5'h12):(4'h9)]))) >= (({{reg72, reg75},
                          (~|reg69)} ?
                      ($signed(reg75) - (reg69 ? reg72 : wire67)) : wire64) ?
                  {(-$signed((8'hb7))),
                      $unsigned($unsigned((8'haa)))} : $unsigned(reg74)));
              reg73 <= reg68;
            end
          reg76 <= $signed((~$signed($signed((&wire66)))));
        end
      reg77 <= reg70;
      reg78 <= ({((reg77[(4'hf):(2'h3)] || (!reg71)) ?
              ($signed(wire64) + (wire64 ?
                  reg71 : (8'h9f))) : $signed($signed(wire67)))} != wire66);
    end
  module79 #() modinst147 (.clk(clk), .wire81(wire66), .wire83(reg70), .wire82(wire64), .wire80(reg75), .y(wire146));
  assign wire148 = (!reg78);
  assign wire149 = (reg76[(1'h0):(1'h0)] ?
                       $unsigned(($signed(wire146[(3'h6):(2'h3)]) ?
                           (~&(8'hb7)) : reg70)) : $signed(reg71[(5'h11):(5'h11)]));
  assign wire150 = reg73;
  assign wire151 = ((~^{(!$unsigned((8'hb1)))}) * (|$unsigned(($signed(wire67) ?
                       (wire67 ? (8'h9e) : reg76) : (8'hb8)))));
  always
    @(posedge clk) begin
      reg152 <= (^~(wire149[(2'h2):(2'h2)] ^~ reg74[(2'h2):(1'h1)]));
      reg153 <= reg73;
    end
  assign wire154 = wire146[(3'h4):(2'h3)];
endmodule

module module6
#(parameter param59 = {((8'hb1) ? (8'hb6) : {(+((8'hbd) | (8'ha5)))})})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(2'h3):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  reg [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire13,
                 wire12,
                 wire11,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = (wire7 + wire7);
  assign wire12 = {{wire10},
                      $unsigned((((wire11 ?
                          (7'h44) : wire10) > (wire8 & wire9)) - ((wire11 ?
                          wire7 : (8'haf)) >>> {wire9, wire9})))};
  assign wire13 = wire11;
  always
    @(posedge clk) begin
      if ($signed((^~$signed({(wire13 ? wire8 : wire7),
          wire12[(2'h2):(1'h1)]}))))
        begin
          if ((wire7 ?
              (((|(8'h9c)) <<< (^(wire11 > wire13))) >= $signed({$unsigned(wire7),
                  wire11})) : wire10[(1'h0):(1'h0)]))
            begin
              reg14 <= ($unsigned($signed({(wire7 * wire7)})) >> (~(|wire7[(4'h8):(3'h7)])));
              reg15 <= (~(($signed((8'hb0)) ?
                  ((^~wire10) ?
                      $signed((8'ha3)) : wire13[(3'h6):(1'h0)]) : {(wire12 >> (7'h44)),
                      wire9}) <<< reg14[(1'h1):(1'h1)]));
              reg16 <= (^~wire7);
              reg17 <= ({(wire11[(2'h3):(1'h1)] ?
                          reg15 : $signed($unsigned((8'ha5)))),
                      reg15} ?
                  $unsigned(reg14[(2'h2):(2'h2)]) : {wire11});
            end
          else
            begin
              reg14 <= $signed((~wire13[(3'h6):(3'h4)]));
              reg15 <= (~&{(~&$signed((^(8'hb7)))),
                  (((wire11 ^~ wire11) & wire11) ?
                      wire10[(1'h0):(1'h0)] : $signed({wire11, reg15}))});
            end
          reg18 <= wire9[(2'h3):(2'h3)];
          reg19 <= (^~wire13[(1'h0):(1'h0)]);
        end
      else
        begin
          reg14 <= $unsigned(reg15);
        end
    end
  always
    @(posedge clk) begin
      if ($signed((reg14 != {((reg16 + wire7) ^ wire8[(1'h1):(1'h1)]),
          (+(wire9 >> reg18))})))
        begin
          reg20 <= reg17;
          reg21 <= (~|$unsigned((($unsigned(wire12) && (reg17 <<< reg14)) ?
              $signed((&reg18)) : (!(reg19 ? reg14 : reg17)))));
          reg22 <= $unsigned($signed($unsigned((!wire7[(3'h6):(1'h1)]))));
          reg23 <= (wire9[(2'h2):(1'h1)] >= $unsigned({((reg22 ^~ wire7) ?
                  $signed(reg14) : $signed((8'haa)))}));
          reg24 <= $unsigned($unsigned(($unsigned(wire13) <= $unsigned(reg15))));
        end
      else
        begin
          if (wire11[(3'h6):(1'h0)])
            begin
              reg20 <= $unsigned((!({(reg15 ? reg18 : reg20), (!wire7)} ?
                  (^(8'ha3)) : reg16[(2'h2):(1'h1)])));
              reg21 <= (&$unsigned((~|$unsigned($signed(wire12)))));
            end
          else
            begin
              reg20 <= $signed(reg20[(3'h4):(2'h3)]);
              reg21 <= {$unsigned($signed($unsigned($unsigned(reg20))))};
              reg22 <= (~&$signed(reg24));
              reg23 <= (wire10[(1'h1):(1'h1)] ?
                  ($unsigned(reg20[(3'h4):(1'h1)]) | reg21) : $unsigned(reg17));
            end
          reg24 <= $unsigned((reg19[(1'h0):(1'h0)] << {($signed(reg22) ?
                  (^~reg18) : (~reg18)),
              $unsigned(wire7[(3'h4):(1'h0)])}));
          reg25 <= $signed(({(!$unsigned(reg22)), (~&$unsigned(reg17))} ?
              $unsigned(reg17[(5'h10):(3'h4)]) : (((8'haf) ?
                  {reg14} : (reg14 ?
                      (8'ha2) : reg22)) + $unsigned($signed(wire13)))));
          if ($signed($signed((((reg22 ? wire7 : reg23) ?
              {reg15} : $unsigned(wire12)) - $signed({wire9})))))
            begin
              reg26 <= wire9[(3'h4):(2'h2)];
              reg27 <= $unsigned($signed(((!reg15[(4'hc):(2'h2)]) + reg19)));
              reg28 <= $signed((8'ha4));
              reg29 <= ((({reg22[(4'h9):(3'h6)], reg25} ?
                      ((!(8'hba)) || (wire9 ?
                          reg25 : (8'hbf))) : $unsigned((~reg18))) >> (|$unsigned(reg19))) ?
                  reg20[(1'h0):(1'h0)] : reg23[(4'hb):(2'h2)]);
            end
          else
            begin
              reg26 <= wire13[(1'h1):(1'h1)];
              reg27 <= $unsigned(wire11);
              reg28 <= $unsigned((((~^reg23[(3'h5):(3'h4)]) * reg18[(4'hf):(4'he)]) ?
                  (-(7'h40)) : $unsigned(({(8'haf)} + reg20[(1'h0):(1'h0)]))));
              reg29 <= reg22;
              reg30 <= ($signed(($signed({wire10}) ?
                      (reg14 ?
                          $signed(reg26) : wire13) : reg27[(2'h3):(1'h1)])) ?
                  $signed(reg25[(2'h3):(2'h3)]) : ((wire12[(1'h1):(1'h0)] ?
                      $signed(wire11) : reg26) | (reg14 ~^ {$unsigned(reg25)})));
            end
          reg31 <= ((reg26 ^ (reg25 < ((wire8 ? wire8 : reg28) ?
                  (reg29 ? reg27 : reg20) : reg17))) ?
              (((&reg23[(4'hd):(4'hb)]) ? reg18[(5'h12):(3'h7)] : (-{reg24})) ?
                  (~|($unsigned((7'h40)) ?
                      $signed(wire13) : $unsigned(reg15))) : (($signed(reg15) ?
                          reg20[(2'h2):(2'h2)] : reg28) ?
                      $unsigned((reg23 ? reg23 : wire10)) : $signed((reg26 ?
                          (8'ha5) : reg14)))) : $unsigned((^~reg28)));
        end
    end
  always
    @(posedge clk) begin
      reg32 <= (wire13[(1'h0):(1'h0)] ?
          $signed($unsigned(((wire12 ~^ reg23) == (~&(8'hab))))) : (8'hab));
      reg33 <= (~|(~|wire10));
      if ($unsigned(reg18))
        begin
          reg34 <= wire10[(1'h1):(1'h0)];
          if ((^~((((reg28 & reg16) ?
                  ((8'hb4) ?
                      reg22 : reg30) : $unsigned(reg26)) < ($signed(reg29) ?
                  $signed(wire9) : (~reg23))) ?
              reg19[(1'h0):(1'h0)] : reg33)))
            begin
              reg35 <= reg21;
              reg36 <= ($unsigned((+$signed($unsigned(reg14)))) ?
                  ($signed($signed((~reg30))) ?
                      ({{reg26, wire10},
                          (7'h41)} & $signed(wire9)) : (~&reg24[(4'h9):(3'h5)])) : $unsigned(reg24));
              reg37 <= reg33[(3'h6):(2'h2)];
              reg38 <= ($signed({(reg15[(4'h8):(3'h5)] - $signed(reg31))}) ^~ (((reg33 ?
                      $signed(wire7) : (!(8'ha4))) == reg29) ?
                  (8'hb7) : (!reg24[(4'h8):(3'h5)])));
              reg39 <= ($unsigned(reg35[(4'h8):(2'h2)]) ?
                  (7'h44) : ((((wire7 <= reg28) == {reg34,
                          reg18}) > {(wire13 ~^ reg22), $unsigned((8'h9e))}) ?
                      ((!wire9[(2'h3):(1'h1)]) ?
                          reg29[(2'h3):(2'h3)] : $signed($signed(reg16))) : reg21[(4'h9):(2'h3)]));
            end
          else
            begin
              reg35 <= $signed($unsigned(($unsigned($signed(reg22)) ?
                  ((~reg16) - {(8'hb5), reg39}) : $signed((wire8 ?
                      reg33 : wire10)))));
              reg36 <= {$signed((&(+reg35[(2'h2):(2'h2)])))};
            end
          if ($signed($signed($signed((!reg18)))))
            begin
              reg40 <= $unsigned((+({(wire7 ? reg22 : reg22)} >= reg30)));
              reg41 <= {(^~$unsigned((wire10[(1'h1):(1'h1)] == reg21)))};
              reg42 <= reg18;
            end
          else
            begin
              reg40 <= reg36;
              reg41 <= reg34;
              reg42 <= reg35;
              reg43 <= reg34;
              reg44 <= reg36[(2'h3):(1'h0)];
            end
          reg45 <= (reg31 ? $unsigned(reg26) : wire13);
          reg46 <= (&reg22[(4'hb):(4'ha)]);
        end
      else
        begin
          reg34 <= $signed((!reg42));
          reg35 <= $unsigned(((!$unsigned((reg16 && reg29))) - (wire9 ^~ ((reg45 <<< reg24) < wire13[(1'h1):(1'h0)]))));
          reg36 <= reg23[(1'h0):(1'h0)];
          reg37 <= $unsigned((|reg46[(4'h8):(3'h7)]));
          if ((|reg22))
            begin
              reg38 <= $unsigned((8'had));
              reg39 <= wire13;
            end
          else
            begin
              reg38 <= (wire12[(1'h0):(1'h0)] ?
                  wire13 : ((&(((8'hbd) ? wire7 : reg21) << {reg34,
                      reg22})) < (^~$signed((wire12 * wire13)))));
              reg39 <= wire11[(1'h1):(1'h0)];
              reg40 <= $unsigned(reg43);
              reg41 <= wire11[(1'h0):(1'h0)];
              reg42 <= reg30;
            end
        end
      if (({wire8} + reg43[(4'hb):(3'h6)]))
        begin
          reg47 <= ($signed(($unsigned((reg41 ?
              (8'hb5) : reg33)) < reg46[(4'hc):(2'h3)])) & ((reg23 ?
                  $unsigned(reg23[(1'h1):(1'h1)]) : (&$unsigned(reg15))) ?
              (~^$unsigned($unsigned(reg43))) : (reg44[(1'h0):(1'h0)] + ({reg36,
                  reg32} && ((7'h42) | reg20)))));
          reg48 <= (^~$signed((~|reg27)));
          if ((reg47[(5'h10):(4'hd)] && ((&reg14[(1'h1):(1'h1)]) ?
              ((((8'hb0) ? (8'h9f) : reg31) | $unsigned((8'hb8))) ?
                  reg26[(4'hb):(3'h7)] : (reg22[(4'h8):(3'h6)] ^ $signed(reg19))) : (^$signed({reg19,
                  reg29})))))
            begin
              reg49 <= reg23[(4'hc):(4'h9)];
              reg50 <= (reg24 ?
                  reg44[(1'h1):(1'h0)] : $unsigned($unsigned((8'hba))));
            end
          else
            begin
              reg49 <= ($unsigned((-reg35)) != ($signed(reg22[(1'h0):(1'h0)]) != $signed((reg36[(1'h0):(1'h0)] <= $unsigned((8'haf))))));
              reg50 <= reg20;
            end
          reg51 <= reg28;
        end
      else
        begin
          reg47 <= $unsigned({$signed(((wire12 && reg48) ?
                  (reg42 ? (8'ha8) : wire7) : reg33[(2'h3):(1'h1)])),
              ($signed(reg48) <<< (reg28 > ((8'hb4) ? wire11 : reg36)))});
        end
      reg52 <= $signed((^wire7));
    end
  assign wire53 = (^~(reg44[(3'h5):(1'h0)] ?
                      reg20[(2'h2):(1'h0)] : ((-reg32) ?
                          reg37 : ((reg33 >= reg46) ?
                              (reg31 ? reg46 : reg15) : (8'hbd)))));
  assign wire54 = reg42;
  assign wire55 = (({reg33[(2'h2):(1'h1)],
                      (((8'hb9) ?
                          reg25 : reg35) >> (+reg25))} - (8'ha2)) & ((!$unsigned((&reg33))) + reg18[(5'h11):(5'h10)]));
  assign wire56 = (~^$signed(($signed(wire11[(1'h0):(1'h0)]) ?
                      ($unsigned(reg41) <= $unsigned(wire7)) : $unsigned($signed(reg51)))));
  assign wire57 = ({($signed((reg29 ? reg33 : reg19)) ?
                              ((8'ha5) >= (reg16 <<< reg28)) : wire53[(3'h5):(1'h0)])} ?
                      {{($unsigned(reg49) ?
                                  wire13 : reg46[(5'h10):(4'hf)])}} : $unsigned((~((reg26 ?
                          reg47 : reg36) << (!(8'hae))))));
  assign wire58 = reg51;
endmodule

module module79
#(parameter param144 = (!(~^(~^(((8'ha5) ? (8'hb6) : (8'hab)) ? ((8'ha3) ? (7'h41) : (8'hb2)) : {(8'hbf), (8'hb6)})))), 
parameter param145 = ({(8'ha6), param144} | (~(!((param144 >= param144) ? {(8'ha3), param144} : (&param144))))))
(y, clk, wire83, wire82, wire81, wire80);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire83;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire [(2'h3):(1'h0)] wire81;
  input wire [(4'hb):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire127;
  wire [(5'h15):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire [(4'hb):(1'h0)] wire124;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire84;
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h14):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg105 = (1'h0);
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  assign y = {wire132,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire90,
                 wire89,
                 wire84,
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
                 reg131,
                 reg130,
                 reg129,
                 reg128,
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
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire84 = wire80[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg85 <= ({((((8'ha2) ? wire80 : wire80) ?
              wire82 : {wire82}) > wire81[(2'h2):(1'h0)])} >>> (~^((|$unsigned(wire80)) ?
          ((wire83 ? (8'ha9) : wire81) ?
              (+wire84) : (wire84 ? wire83 : wire84)) : {wire84[(2'h2):(1'h1)],
              (wire83 < wire80)})));
      reg86 <= wire84[(3'h6):(2'h2)];
      reg87 <= $signed((~|wire84[(4'hb):(4'h9)]));
      reg88 <= reg87;
    end
  assign wire89 = ((reg87[(3'h6):(3'h6)] ? wire84 : (-reg86[(3'h7):(1'h1)])) ?
                      (&(reg86 ?
                          wire80 : $unsigned($signed(reg87)))) : ($signed($unsigned((wire83 ?
                          wire84 : reg87))) & ($signed((~wire82)) ?
                          {(wire80 < wire82),
                              {reg86}} : $signed(((8'ha2) <= reg85)))));
  assign wire90 = wire80[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg91 <= $unsigned((wire81 | wire80[(3'h7):(3'h4)]));
      if ($unsigned((^~$unsigned($signed(reg87)))))
        begin
          reg92 <= (wire80 ?
              ((wire83[(2'h2):(2'h2)] < (+(reg86 ?
                  (8'hac) : wire89))) ^ (reg86[(2'h3):(1'h0)] ?
                  (~$unsigned((8'ha5))) : {(wire83 ? reg87 : wire89),
                      {wire89, wire83}})) : $unsigned({(~^reg91[(4'hf):(3'h6)]),
                  $unsigned((!(8'haf)))}));
          reg93 <= (~|(wire84[(4'hb):(4'h9)] << reg92[(3'h4):(2'h3)]));
          if (($signed(reg92[(1'h1):(1'h0)]) && (8'h9d)))
            begin
              reg94 <= {($signed((~((8'ha2) ? reg85 : wire84))) ?
                      $unsigned(reg93[(4'hd):(1'h0)]) : wire81)};
              reg95 <= reg93[(3'h5):(3'h4)];
              reg96 <= $signed(reg94[(2'h3):(1'h0)]);
              reg97 <= wire82[(1'h1):(1'h1)];
            end
          else
            begin
              reg94 <= $signed($signed($unsigned(($unsigned(reg96) > (wire82 > reg95)))));
              reg95 <= ($signed(wire84) <= reg87);
              reg96 <= (!$unsigned(reg96));
            end
          reg98 <= wire90[(3'h6):(3'h6)];
          if ($signed(({($unsigned(wire84) ? (|reg95) : (8'hbf)),
                  $signed((8'h9e))} ?
              $signed({$unsigned(reg98),
                  reg96[(3'h7):(1'h0)]}) : $signed(((-reg98) >> reg94)))))
            begin
              reg99 <= $unsigned(reg93);
            end
          else
            begin
              reg99 <= wire81[(1'h1):(1'h1)];
            end
        end
      else
        begin
          reg92 <= (&reg96);
          reg93 <= {reg87, wire89[(2'h2):(1'h1)]};
          reg94 <= wire81[(2'h3):(2'h2)];
          reg95 <= (wire90[(3'h5):(1'h0)] ? (~^$unsigned((~reg87))) : (+reg87));
        end
      reg100 <= $unsigned((reg98[(4'hc):(4'ha)] & ((&(8'hb3)) ~^ (8'ha7))));
    end
  always
    @(posedge clk) begin
      if ((wire82 != $unsigned({reg96, reg88[(2'h2):(1'h1)]})))
        begin
          reg101 <= $signed((reg93 != (((+reg88) ?
                  $unsigned(reg91) : ((8'hb1) * (8'hbe))) ?
              reg97 : {{(8'hb1), reg97}})));
          reg102 <= reg88;
          reg103 <= (^~reg94);
        end
      else
        begin
          reg101 <= $signed(({$signed(((8'ha7) ? reg102 : reg86))} ?
              reg91[(1'h1):(1'h0)] : (($unsigned(reg86) >>> (wire80 >> wire89)) ?
                  reg95[(3'h5):(3'h5)] : ((reg103 | reg96) != (^~reg98)))));
          reg102 <= reg102[(4'hf):(3'h6)];
          if ($unsigned(((reg91 ? $signed((~^reg91)) : reg99[(3'h5):(2'h3)]) ?
              reg93[(3'h7):(3'h7)] : $signed((((8'hb7) > reg97) | $signed(reg93))))))
            begin
              reg103 <= ($signed((((wire89 ?
                          wire80 : reg101) <<< reg91[(4'hc):(4'ha)]) ?
                      ($unsigned(reg92) ?
                          (~|reg88) : (reg95 <<< reg100)) : $unsigned((8'hbe)))) ?
                  $signed((!{reg94, reg99[(3'h4):(1'h1)]})) : ((+((wire81 ?
                          reg94 : wire80) ?
                      reg91[(4'ha):(1'h0)] : reg93)) >= (reg91 ?
                      reg95 : (-{reg93, reg96}))));
            end
          else
            begin
              reg103 <= {$unsigned($unsigned(wire80[(2'h3):(1'h1)]))};
              reg104 <= wire84[(2'h3):(2'h3)];
              reg105 <= (((($unsigned(reg97) ? $unsigned(reg92) : (~|reg103)) ?
                          $signed((wire83 ?
                              reg104 : wire81)) : ((reg95 << wire81) >> (|reg86))) ?
                      (~^reg95[(4'hd):(3'h4)]) : (~|(reg97[(3'h4):(1'h0)] >>> $unsigned(wire84)))) ?
                  $signed((8'hb4)) : $signed(((8'hbd) ?
                      {(~^reg100), reg94} : $unsigned(wire84[(2'h3):(1'h1)]))));
              reg106 <= reg95;
              reg107 <= (reg86[(1'h1):(1'h1)] >= (reg99[(1'h1):(1'h0)] ?
                  wire89[(2'h3):(1'h1)] : {$unsigned((reg105 - (8'hae)))}));
            end
          reg108 <= wire82;
        end
      reg109 <= ((|(($signed(reg98) > (reg85 * wire90)) && ($signed(reg87) ?
          reg87 : (reg102 * (8'hbb))))) & ((8'hae) || (^~((reg101 >= reg95) >>> wire82))));
      if ((|{$unsigned($signed(wire90[(3'h7):(1'h0)])),
          (^~$signed((wire82 ? reg88 : reg101)))}))
        begin
          reg110 <= (reg88 ?
              ($unsigned($unsigned(wire81[(1'h0):(1'h0)])) + (reg104[(3'h4):(2'h2)] >> ({reg88} ?
                  (&reg106) : {reg87, reg107}))) : reg94[(1'h0):(1'h0)]);
          reg111 <= $signed(wire82[(4'hd):(1'h0)]);
          if (wire82[(3'h6):(1'h1)])
            begin
              reg112 <= ((reg109 ?
                  wire80[(3'h6):(1'h1)] : reg85[(2'h2):(1'h1)]) ^~ reg99);
              reg113 <= (reg109 ? reg98 : (&wire89[(2'h2):(2'h2)]));
            end
          else
            begin
              reg112 <= (+{((^~{reg106}) & ($signed((8'hb5)) * {reg109}))});
              reg113 <= reg111;
              reg114 <= reg100;
              reg115 <= ($signed($unsigned((reg93[(4'hd):(3'h7)] ?
                  $signed(wire83) : {reg91}))) << {reg113[(2'h3):(2'h3)]});
              reg116 <= ($unsigned($unsigned(reg104)) ?
                  (reg95 >= $signed(wire89)) : {reg107[(4'hc):(1'h1)],
                      ($signed(((8'hb5) ? reg111 : reg108)) ?
                          (~(reg112 + reg102)) : (^~$signed(reg110)))});
            end
          reg117 <= $signed({$signed(wire89), $unsigned($unsigned(reg103))});
        end
      else
        begin
          reg110 <= $unsigned(reg85);
          reg111 <= $unsigned($unsigned($unsigned(reg112)));
        end
      reg118 <= reg85;
    end
  assign wire119 = reg109[(4'h9):(2'h3)];
  assign wire120 = (~wire89[(3'h4):(3'h4)]);
  assign wire121 = reg93[(4'ha):(3'h5)];
  assign wire122 = ($unsigned(reg93[(1'h0):(1'h0)]) ?
                       wire121[(3'h5):(3'h5)] : $unsigned(reg99));
  assign wire123 = ((|(($unsigned(reg101) << (wire80 < reg109)) ?
                           ((wire122 ?
                               (8'hb6) : reg118) == {reg95}) : ((~reg105) > ((8'hbc) != reg113)))) ?
                       $signed($signed(reg99[(1'h1):(1'h0)])) : ({$signed(reg117),
                           (((8'ha5) ?
                               reg104 : reg100) ^~ $signed(reg111))} & {$unsigned((+reg103)),
                           reg96}));
  assign wire124 = {{$signed(($signed(reg103) ? {wire122} : reg96))}};
  assign wire125 = (~^$signed(wire89[(3'h4):(1'h0)]));
  assign wire126 = reg103[(4'ha):(1'h0)];
  assign wire127 = reg98;
  always
    @(posedge clk) begin
      reg128 <= (8'ha8);
      reg129 <= reg87;
      reg130 <= (8'hb9);
      reg131 <= reg109;
    end
  assign wire132 = (~|(reg110[(4'hf):(4'h9)] ?
                       $signed(($unsigned(reg114) ?
                           (~reg108) : $signed(wire84))) : (~$signed(wire124))));
  always
    @(posedge clk) begin
      reg133 <= reg108[(4'h9):(3'h4)];
      reg134 <= ($signed($signed(reg113)) ~^ reg103[(3'h7):(2'h3)]);
      reg135 <= $signed((((~^reg101) ?
              {{wire89}, (reg112 ? wire127 : (8'hbd))} : (reg109 & wire80)) ?
          (^~reg117) : {(+((8'hbe) || reg88))}));
      reg136 <= $signed((($signed((reg111 ~^ reg133)) ?
          (~$signed(reg100)) : reg133) && (((wire121 ?
              wire122 : reg102) <<< $unsigned(reg112)) ?
          (8'ha5) : (reg97 ? (reg97 ? reg113 : reg91) : $signed(reg118)))));
      if ($signed(reg133))
        begin
          reg137 <= reg93[(1'h1):(1'h0)];
          reg138 <= (reg85 >> ({$unsigned((wire119 | wire127)), (~reg103)} ?
              ((wire132 >> reg88[(2'h2):(1'h1)]) ?
                  (~&{reg95, reg101}) : $unsigned(reg114)) : $unsigned((reg128 ?
                  $signed((8'hba)) : reg98[(1'h0):(1'h0)]))));
          reg139 <= {$unsigned(reg109[(4'ha):(4'h9)])};
        end
      else
        begin
          if (reg88[(2'h2):(2'h2)])
            begin
              reg137 <= {(((!reg109) ^ ($signed(wire89) - reg114)) + (~&reg137[(1'h1):(1'h1)])),
                  ((~^((wire132 >= reg103) * (reg100 ? (8'ha0) : reg129))) ?
                      ({(reg136 ? reg118 : wire125), reg99} ?
                          wire125[(1'h0):(1'h0)] : reg106) : (!$signed({reg109})))};
            end
          else
            begin
              reg137 <= (((((reg138 ?
                      reg92 : wire82) > reg114[(3'h5):(2'h2)]) + (-$unsigned((8'h9e)))) ?
                  reg105[(1'h1):(1'h1)] : $unsigned($unsigned((reg108 >>> reg133)))) + $unsigned({wire132[(4'h8):(1'h1)]}));
              reg138 <= reg112;
              reg139 <= wire123[(5'h11):(3'h4)];
              reg140 <= $signed(reg117[(2'h2):(1'h0)]);
              reg141 <= $signed(((reg102[(3'h6):(2'h3)] ?
                      $unsigned(reg128) : {$unsigned(wire122)}) ?
                  $unsigned(($signed(reg117) ^ (reg101 || wire81))) : {wire127,
                      reg94[(1'h0):(1'h0)]}));
            end
          reg142 <= reg136;
          reg143 <= ($unsigned((((7'h43) ? {reg91, reg107} : $signed(reg88)) ?
                  (^reg95) : $signed(((8'hbd) == wire123)))) ?
              $unsigned({{(^wire121)}}) : wire81);
        end
    end
endmodule

module module303
#(parameter param363 = ((~|{((|(8'hb7)) ? ((8'hbb) ? (8'h9d) : (8'hb6)) : (~^(8'hbd))), (((8'haf) ? (8'hb3) : (8'ha5)) >> (8'h9c))}) ? (7'h44) : (~&(!(~|(|(8'ha7)))))))
(y, clk, wire307, wire306, wire305, wire304);
  output wire [(32'h28a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire307;
  input wire signed [(4'hf):(1'h0)] wire306;
  input wire signed [(3'h6):(1'h0)] wire305;
  input wire [(2'h2):(1'h0)] wire304;
  wire signed [(5'h11):(1'h0)] wire362;
  wire signed [(4'hb):(1'h0)] wire361;
  wire [(4'h8):(1'h0)] wire360;
  wire [(3'h7):(1'h0)] wire359;
  wire [(4'he):(1'h0)] wire358;
  wire [(4'h9):(1'h0)] wire348;
  wire signed [(5'h14):(1'h0)] wire330;
  wire signed [(3'h4):(1'h0)] wire329;
  wire signed [(3'h5):(1'h0)] wire328;
  wire signed [(4'h9):(1'h0)] wire327;
  wire signed [(5'h13):(1'h0)] wire324;
  wire [(5'h15):(1'h0)] wire313;
  wire [(5'h13):(1'h0)] wire311;
  wire [(5'h15):(1'h0)] wire310;
  wire signed [(3'h7):(1'h0)] wire309;
  wire [(3'h5):(1'h0)] wire308;
  reg [(4'h9):(1'h0)] reg357 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg356 = (1'h0);
  reg [(3'h6):(1'h0)] reg355 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg354 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg353 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg352 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg351 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg350 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg349 = (1'h0);
  reg [(5'h11):(1'h0)] reg347 = (1'h0);
  reg [(4'ha):(1'h0)] reg346 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg345 = (1'h0);
  reg [(2'h2):(1'h0)] reg344 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg343 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg342 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg341 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg340 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg339 = (1'h0);
  reg [(2'h2):(1'h0)] reg338 = (1'h0);
  reg [(5'h11):(1'h0)] reg337 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg336 = (1'h0);
  reg [(4'ha):(1'h0)] reg335 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg334 = (1'h0);
  reg [(5'h12):(1'h0)] reg333 = (1'h0);
  reg [(4'h9):(1'h0)] reg332 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg331 = (1'h0);
  reg [(4'ha):(1'h0)] reg326 = (1'h0);
  reg [(4'hb):(1'h0)] reg325 = (1'h0);
  reg [(4'ha):(1'h0)] reg323 = (1'h0);
  reg [(5'h13):(1'h0)] reg322 = (1'h0);
  reg [(5'h13):(1'h0)] reg321 = (1'h0);
  reg [(4'hc):(1'h0)] reg320 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg319 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg318 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg317 = (1'h0);
  reg [(5'h10):(1'h0)] reg316 = (1'h0);
  reg [(3'h4):(1'h0)] reg315 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg314 = (1'h0);
  reg [(3'h4):(1'h0)] reg312 = (1'h0);
  assign y = {wire362,
                 wire361,
                 wire360,
                 wire359,
                 wire358,
                 wire348,
                 wire330,
                 wire329,
                 wire328,
                 wire327,
                 wire324,
                 wire313,
                 wire311,
                 wire310,
                 wire309,
                 wire308,
                 reg357,
                 reg356,
                 reg355,
                 reg354,
                 reg353,
                 reg352,
                 reg351,
                 reg350,
                 reg349,
                 reg347,
                 reg346,
                 reg345,
                 reg344,
                 reg343,
                 reg342,
                 reg341,
                 reg340,
                 reg339,
                 reg338,
                 reg337,
                 reg336,
                 reg335,
                 reg334,
                 reg333,
                 reg332,
                 reg331,
                 reg326,
                 reg325,
                 reg323,
                 reg322,
                 reg321,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 reg316,
                 reg315,
                 reg314,
                 reg312,
                 (1'h0)};
  assign wire308 = ((~|(wire304[(1'h1):(1'h1)] ?
                           $unsigned(wire306) : wire304[(1'h0):(1'h0)])) ?
                       (wire306[(3'h6):(2'h3)] >= $signed(wire304)) : (~|(~|($signed(wire307) <= (|wire305)))));
  assign wire309 = $unsigned((($signed(wire304[(2'h2):(1'h1)]) | $signed((wire307 ?
                           wire306 : wire307))) ?
                       wire305[(1'h1):(1'h0)] : (^~(~^wire307))));
  assign wire310 = (~^$signed($unsigned((!(wire308 ? wire306 : wire306)))));
  assign wire311 = $unsigned((wire306[(4'hc):(3'h5)] ?
                       (wire308 < {(wire307 >> wire304)}) : (!$unsigned(wire310))));
  always
    @(posedge clk) begin
      reg312 <= ((-(wire309 ^~ (^~wire306))) < (~{(|(|wire305))}));
    end
  assign wire313 = reg312[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg314 <= $unsigned($unsigned(wire310[(3'h7):(3'h6)]));
      if (wire304[(2'h2):(1'h1)])
        begin
          reg315 <= ($unsigned($unsigned(((~&wire304) == $signed(wire307)))) ?
              {$signed(reg312[(3'h4):(3'h4)])} : wire308);
          reg316 <= (wire304[(2'h2):(1'h1)] ?
              wire305 : (reg315[(2'h2):(1'h1)] <<< $unsigned(((^~(8'ha6)) >>> (~^wire304)))));
        end
      else
        begin
          reg315 <= (wire304 >= ((((wire313 & reg315) ?
                  wire310 : (-(8'hbb))) & ((reg312 - wire304) != $signed(wire308))) ?
              wire308[(2'h2):(1'h1)] : reg315[(2'h3):(2'h3)]));
          if ((7'h44))
            begin
              reg316 <= wire313[(5'h15):(4'hd)];
              reg317 <= wire305;
              reg318 <= $unsigned(wire307);
              reg319 <= {{((8'hb2) ?
                          reg318[(4'hb):(2'h3)] : (~|((8'had) << reg317)))},
                  wire306[(3'h4):(2'h3)]};
            end
          else
            begin
              reg316 <= reg314[(3'h4):(3'h4)];
              reg317 <= {{{$signed((reg315 ? wire313 : reg316)), reg318}}};
              reg318 <= reg318[(1'h0):(1'h0)];
              reg319 <= ($unsigned(($signed($signed((8'hb8))) ?
                  $unsigned((wire304 ?
                      reg318 : (8'hb5))) : $unsigned($signed(reg315)))) ~^ wire308[(2'h2):(1'h0)]);
            end
          reg320 <= ((wire310 || ($unsigned(wire309[(3'h7):(1'h1)]) ?
                  reg319 : $signed($signed(reg315)))) ?
              $unsigned({((8'ha4) ?
                      (wire304 ^ wire309) : $unsigned(reg315))}) : (reg314[(3'h4):(1'h1)] ~^ $signed(wire309)));
          reg321 <= (!wire310);
        end
      reg322 <= wire305;
      reg323 <= (reg312[(1'h1):(1'h1)] ?
          $unsigned(((reg320 ?
              (reg316 ?
                  reg317 : reg321) : reg318) <<< (~^{reg320}))) : reg314[(1'h1):(1'h0)]);
    end
  assign wire324 = wire309;
  always
    @(posedge clk) begin
      reg325 <= (wire324[(4'hf):(3'h5)] >>> $unsigned(reg323));
      reg326 <= reg319[(4'hd):(4'h8)];
    end
  assign wire327 = (reg322[(1'h1):(1'h1)] ?
                       ((~|reg322) ?
                           {reg317,
                               (wire308[(3'h5):(2'h3)] <<< reg318[(4'ha):(3'h4)])} : reg321) : $signed((~^($signed(reg323) ?
                           (reg319 ? wire310 : (8'hbd)) : reg317))));
  assign wire328 = reg312;
  assign wire329 = reg325[(3'h4):(2'h3)];
  assign wire330 = {(reg319[(4'h9):(4'h9)] != wire304[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      reg331 <= (&(~|$unsigned($unsigned(wire313[(5'h12):(4'h9)]))));
      if ($signed((^~wire324)))
        begin
          reg332 <= reg320;
          reg333 <= wire307;
          reg334 <= $unsigned(wire307);
          reg335 <= wire328[(3'h5):(1'h1)];
        end
      else
        begin
          reg332 <= (~|($unsigned((wire307[(4'ha):(3'h6)] << $signed(reg334))) * ({$unsigned(reg317)} << reg317[(1'h0):(1'h0)])));
          if ($unsigned($signed((~&wire304[(1'h0):(1'h0)]))))
            begin
              reg333 <= $unsigned($signed($signed(wire328)));
              reg334 <= $signed(wire307[(4'h8):(3'h7)]);
            end
          else
            begin
              reg333 <= {(~&$signed($signed((wire313 ? reg322 : reg316))))};
              reg334 <= (^~{(((reg325 <= reg321) ^ (wire307 ?
                      (8'hb7) : (8'ha1))) | reg318)});
            end
          reg335 <= reg335[(2'h2):(1'h1)];
          if ((wire313[(4'he):(4'h9)] ?
              (reg318[(1'h0):(1'h0)] && reg319) : ((reg320 | (~|$unsigned(reg331))) ?
                  reg316 : $unsigned(wire324))))
            begin
              reg336 <= (|(^reg318));
            end
          else
            begin
              reg336 <= reg319[(1'h1):(1'h0)];
              reg337 <= reg319;
              reg338 <= (((~^wire305[(1'h0):(1'h0)]) * $unsigned({(reg325 ?
                          reg334 : wire313)})) ?
                  reg321[(1'h0):(1'h0)] : $unsigned($unsigned($unsigned($unsigned((8'h9e))))));
            end
          reg339 <= reg325[(3'h5):(2'h3)];
        end
      reg340 <= (~^(((|$signed(wire304)) <<< wire330) || reg314));
      if ($unsigned($unsigned((($unsigned(reg325) ~^ (reg318 ?
          reg335 : wire324)) >= (~|{reg336})))))
        begin
          reg341 <= wire306[(4'hb):(4'h8)];
        end
      else
        begin
          reg341 <= reg323;
          reg342 <= reg331[(5'h10):(4'hb)];
          reg343 <= ($signed(reg316[(1'h1):(1'h1)]) ?
              (8'hb0) : {(~^reg340[(3'h5):(1'h1)])});
        end
    end
  always
    @(posedge clk) begin
      reg344 <= (($unsigned(((7'h43) ?
              (reg337 ? reg319 : wire330) : reg316[(4'hb):(3'h7)])) ?
          $unsigned($unsigned((reg341 ?
              reg320 : reg334))) : (reg317 == $signed((8'hae)))) <= ((((~reg319) ?
                  $unsigned((8'hb7)) : (reg319 ? reg325 : reg325)) ?
              $unsigned((+wire307)) : reg318[(5'h10):(4'hf)]) ?
          $unsigned(reg319[(3'h4):(2'h2)]) : reg341[(3'h4):(2'h2)]));
      reg345 <= {reg341[(1'h0):(1'h0)], wire306[(3'h7):(2'h2)]};
      reg346 <= (reg320[(1'h0):(1'h0)] < (^~wire305[(1'h1):(1'h0)]));
      reg347 <= reg335[(4'h8):(3'h7)];
    end
  assign wire348 = $unsigned((reg319 >> (+((reg333 ?
                       reg338 : reg333) >= reg342[(3'h5):(3'h5)]))));
  always
    @(posedge clk) begin
      reg349 <= {wire308,
          $unsigned(((reg333[(1'h1):(1'h0)] | (+reg347)) << ((reg347 + (8'ha1)) << $signed(wire313))))};
      if ($signed(((~^wire328) || wire306)))
        begin
          reg350 <= $unsigned({wire313, (~&reg334)});
          reg351 <= ((^reg314) ?
              wire348[(3'h6):(3'h4)] : (~$unsigned(reg318[(3'h5):(3'h5)])));
          reg352 <= $signed($signed($signed(((!reg318) ?
              $unsigned(reg346) : ((8'hb3) <<< wire313)))));
          reg353 <= (reg317[(2'h2):(1'h0)] ?
              wire324[(4'hf):(2'h3)] : {{(~(reg317 <<< wire324))}});
        end
      else
        begin
          reg350 <= (7'h42);
          reg351 <= reg322;
          reg352 <= wire307;
          reg353 <= {($unsigned(($unsigned(reg343) ^~ reg338[(2'h2):(1'h0)])) == wire309)};
          reg354 <= (wire309 ? $signed((+$unsigned((~|reg340)))) : wire309);
        end
      reg355 <= $signed(wire307[(4'h8):(3'h6)]);
      reg356 <= {$unsigned((|$signed((~^reg342))))};
      reg357 <= wire313[(2'h2):(2'h2)];
    end
  assign wire358 = ($signed((wire311 ?
                           {reg325[(4'h9):(2'h3)],
                               $signed(reg317)} : $signed(reg312))) ?
                       (reg337[(3'h6):(1'h0)] - (reg342 & (-wire309[(2'h2):(1'h1)]))) : (7'h40));
  assign wire359 = reg334[(3'h4):(2'h2)];
  assign wire360 = wire359[(1'h0):(1'h0)];
  assign wire361 = ((&(reg357 * $unsigned((wire304 ?
                       reg345 : (8'h9f))))) ~^ reg314[(2'h3):(1'h0)]);
  assign wire362 = $unsigned(((~&($signed((8'h9f)) || $unsigned(reg356))) ?
                       $signed(reg343) : {$unsigned(reg357)}));
endmodule

module module233  (y, clk, wire237, wire236, wire235, wire234);
  output wire [(32'h313):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire237;
  input wire signed [(4'h9):(1'h0)] wire236;
  input wire [(2'h3):(1'h0)] wire235;
  input wire [(4'hd):(1'h0)] wire234;
  wire signed [(5'h13):(1'h0)] wire300;
  wire [(4'ha):(1'h0)] wire299;
  wire [(4'hd):(1'h0)] wire298;
  wire signed [(2'h2):(1'h0)] wire297;
  wire signed [(5'h12):(1'h0)] wire279;
  wire signed [(4'he):(1'h0)] wire278;
  wire [(4'hb):(1'h0)] wire277;
  wire signed [(5'h14):(1'h0)] wire276;
  wire signed [(4'hd):(1'h0)] wire275;
  wire signed [(5'h13):(1'h0)] wire265;
  wire signed [(4'h8):(1'h0)] wire264;
  wire signed [(4'hc):(1'h0)] wire249;
  wire [(3'h5):(1'h0)] wire248;
  wire [(2'h2):(1'h0)] wire247;
  wire signed [(3'h6):(1'h0)] wire246;
  wire [(3'h7):(1'h0)] wire245;
  wire signed [(4'hc):(1'h0)] wire244;
  wire signed [(4'he):(1'h0)] wire238;
  reg signed [(5'h10):(1'h0)] reg296 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg295 = (1'h0);
  reg [(5'h12):(1'h0)] reg294 = (1'h0);
  reg [(4'ha):(1'h0)] reg293 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg292 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg291 = (1'h0);
  reg [(4'ha):(1'h0)] reg290 = (1'h0);
  reg [(4'h9):(1'h0)] reg289 = (1'h0);
  reg [(4'hf):(1'h0)] reg288 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg287 = (1'h0);
  reg [(2'h3):(1'h0)] reg286 = (1'h0);
  reg [(5'h15):(1'h0)] reg285 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg284 = (1'h0);
  reg [(4'ha):(1'h0)] reg283 = (1'h0);
  reg [(3'h5):(1'h0)] reg282 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg281 = (1'h0);
  reg [(3'h7):(1'h0)] reg280 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg274 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg273 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg272 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg271 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg270 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg269 = (1'h0);
  reg [(4'hb):(1'h0)] reg268 = (1'h0);
  reg [(5'h15):(1'h0)] reg267 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg266 = (1'h0);
  reg [(4'he):(1'h0)] reg263 = (1'h0);
  reg [(4'hf):(1'h0)] reg262 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg261 = (1'h0);
  reg [(5'h15):(1'h0)] reg260 = (1'h0);
  reg [(3'h7):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg258 = (1'h0);
  reg [(4'ha):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg255 = (1'h0);
  reg signed [(4'he):(1'h0)] reg254 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg253 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg252 = (1'h0);
  reg [(5'h10):(1'h0)] reg251 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg250 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg243 = (1'h0);
  reg [(4'hd):(1'h0)] reg242 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg241 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg240 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg239 = (1'h0);
  assign y = {wire300,
                 wire299,
                 wire298,
                 wire297,
                 wire279,
                 wire278,
                 wire277,
                 wire276,
                 wire275,
                 wire265,
                 wire264,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire238,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg283,
                 reg282,
                 reg281,
                 reg280,
                 reg274,
                 reg273,
                 reg272,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 (1'h0)};
  assign wire238 = (((^(~|{(8'ha4), wire234})) + $unsigned($signed((wire234 ?
                       wire235 : wire235)))) & {(wire236[(2'h2):(2'h2)] <<< (~^$unsigned(wire234))),
                       wire234[(3'h6):(3'h6)]});
  always
    @(posedge clk) begin
      if ((($signed($unsigned((wire235 & wire234))) ?
          wire234[(4'ha):(3'h7)] : ((wire235 ?
              (~(8'hac)) : $unsigned(wire236)) <<< ((wire238 ?
              wire238 : wire235) && wire238))) | $unsigned($unsigned((+$signed(wire238))))))
        begin
          reg239 <= $unsigned(($signed($signed((wire237 && wire235))) ~^ wire238[(1'h1):(1'h0)]));
        end
      else
        begin
          reg239 <= wire237;
        end
      reg240 <= {$signed((8'hbf))};
      reg241 <= wire237;
      reg242 <= $signed(($signed((~^(reg240 ? wire236 : reg241))) ?
          (8'hbf) : (((wire235 ^~ wire237) <<< wire238) ?
              ((wire236 ?
                  wire235 : reg241) <<< wire234) : $unsigned(reg239[(3'h4):(2'h2)]))));
      reg243 <= (!($signed(reg242) ?
          (!reg240) : (|((&wire235) && wire238[(4'hc):(4'ha)]))));
    end
  assign wire244 = {(~^(((wire238 ~^ wire237) | (+wire238)) == ($unsigned(reg243) <<< $signed(wire237)))),
                       (|$unsigned($unsigned({reg242, (8'hac)})))};
  assign wire245 = (reg242 | (~^(!$unsigned($unsigned(wire236)))));
  assign wire246 = reg239[(3'h6):(3'h6)];
  assign wire247 = $unsigned($unsigned({{(~&(8'hb3)), reg241}}));
  assign wire248 = $unsigned((!(({wire247} ?
                       (wire246 ?
                           (7'h40) : wire235) : $signed(reg242)) < (+(wire236 ?
                       (8'ha6) : reg243)))));
  assign wire249 = (($unsigned($unsigned($signed((8'ha8)))) < ($unsigned((+wire238)) ?
                           wire244 : wire248[(3'h4):(1'h1)])) ?
                       $signed(reg243) : $signed((~&{(~^wire235)})));
  always
    @(posedge clk) begin
      reg250 <= wire235[(2'h2):(1'h0)];
      reg251 <= reg240;
      if ($unsigned((-((wire236[(3'h7):(3'h6)] ?
              wire244[(1'h0):(1'h0)] : {wire248, reg250}) ?
          ({wire247} <= reg242) : reg242[(2'h2):(1'h1)]))))
        begin
          reg252 <= (({$signed((reg240 ? reg251 : wire237))} ?
                  wire245 : wire235) ?
              $signed(reg242[(4'hc):(4'h9)]) : $signed(reg250));
        end
      else
        begin
          reg252 <= {reg241[(4'h9):(4'h8)]};
          if ((reg239 <= $signed((wire236 < $signed({(8'hb4)})))))
            begin
              reg253 <= $unsigned((+$unsigned((^(~(8'h9c))))));
            end
          else
            begin
              reg253 <= wire247[(1'h1):(1'h1)];
              reg254 <= (!$signed($signed((8'ha6))));
              reg255 <= (|wire234);
            end
          reg256 <= $unsigned(wire244);
          reg257 <= $signed($unsigned(reg242));
        end
      if ($signed((wire244[(2'h2):(1'h1)] ?
          $unsigned(wire235[(2'h3):(1'h0)]) : ($signed((wire245 >= reg242)) - (-(reg250 ^~ wire249))))))
        begin
          reg258 <= (+(-($unsigned({wire248,
              (8'h9d)}) && ($signed(reg241) | reg256))));
        end
      else
        begin
          reg258 <= (~^((|(((8'h9e) == (8'hb0)) ?
              (~^reg243) : $signed(reg253))) <= ((+$unsigned(reg257)) - (reg250 ?
              ((8'hb9) * (8'hba)) : $unsigned((8'hb8))))));
          reg259 <= ($signed(wire248[(3'h5):(2'h2)]) ?
              $signed((wire244[(3'h7):(3'h7)] | (~{reg242}))) : wire236[(3'h4):(2'h3)]);
          if ($signed({$signed((((8'hbb) ? reg242 : wire234) ?
                  reg259[(1'h1):(1'h1)] : (wire237 * reg257))),
              {$unsigned($unsigned(wire244))}}))
            begin
              reg260 <= reg258[(4'hd):(3'h5)];
              reg261 <= reg254;
              reg262 <= wire235;
              reg263 <= wire248[(1'h1):(1'h1)];
            end
          else
            begin
              reg260 <= ((($unsigned((7'h43)) || (~(reg258 ?
                  reg257 : reg241))) ^~ (($signed(reg254) < (reg252 <<< reg259)) ?
                  ($unsigned(reg258) ?
                      $unsigned(reg241) : reg257) : $unsigned(reg255))) ^ {$signed(((reg260 ^~ wire244) ?
                      (^reg240) : (reg242 ? reg261 : reg256)))});
            end
        end
    end
  assign wire264 = $signed((^reg255));
  assign wire265 = (^$signed({(~(reg241 <= reg241)), $unsigned((8'hb9))}));
  always
    @(posedge clk) begin
      if ((~&$unsigned(reg253[(4'h8):(1'h0)])))
        begin
          if (reg263)
            begin
              reg266 <= wire247;
              reg267 <= $unsigned((&$unsigned($unsigned(((8'hbb) * reg261)))));
              reg268 <= $unsigned($signed($signed(wire244)));
              reg269 <= reg258[(3'h4):(1'h0)];
              reg270 <= reg254[(2'h3):(2'h2)];
            end
          else
            begin
              reg266 <= {(^~$signed($signed($signed(wire238)))), (8'hae)};
              reg267 <= (reg243 ?
                  $signed((^~reg268)) : (reg257 ?
                      reg263 : (((~|reg258) ?
                          reg258 : $unsigned(reg261)) + reg263[(3'h5):(1'h0)])));
              reg268 <= (+$unsigned((reg255 > {(-wire244)})));
              reg269 <= (reg262[(1'h0):(1'h0)] ? reg239 : (-(~^(8'hb6))));
              reg270 <= $unsigned($signed(reg240));
            end
          reg271 <= (~|$signed($unsigned((^{reg269}))));
          reg272 <= (~((wire249[(4'h8):(3'h6)] ?
              (reg263[(3'h6):(1'h0)] <= reg241[(4'hd):(4'ha)]) : (&(reg267 ?
                  reg252 : reg240))) & $unsigned(reg261)));
        end
      else
        begin
          reg266 <= ($signed({wire237}) ?
              {(-((reg255 ?
                      reg251 : wire246) ^ {wire248}))} : ((reg250[(2'h2):(1'h1)] || (|$unsigned(reg258))) + $unsigned($signed($signed(reg262)))));
          reg267 <= (+reg269);
          reg268 <= ((~^{(|reg268[(4'hb):(4'h8)]),
                  ((reg252 ? wire245 : reg266) > $unsigned(wire245))}) ?
              (|$unsigned((~&(~^wire246)))) : ($signed($unsigned($unsigned(reg267))) ?
                  (((~^wire248) == (reg255 ? (8'hbd) : wire235)) ?
                      reg254[(2'h3):(2'h2)] : (~|(8'ha9))) : ($unsigned(wire248[(3'h4):(3'h4)]) ^ {(-wire236)})));
          reg269 <= ($signed((^~$unsigned($signed(reg262)))) ?
              (~^(-$unsigned((reg253 <<< wire236)))) : $signed($unsigned((^(~reg270)))));
          reg270 <= reg239[(3'h6):(2'h2)];
        end
      reg273 <= {($unsigned(((+wire247) << $unsigned(reg271))) ?
              reg257 : (&$signed(reg259))),
          reg263[(4'hb):(4'h9)]};
      reg274 <= (({reg262} <<< $signed($unsigned({reg252}))) < reg262[(4'he):(4'hd)]);
    end
  assign wire275 = $signed(wire265);
  assign wire276 = $signed((8'hb9));
  assign wire277 = (8'h9d);
  assign wire278 = $signed(($unsigned(reg239[(4'h8):(4'h8)]) ?
                       ((&(^reg243)) ?
                           (!((8'ha5) ?
                               (8'h9f) : (8'hb6))) : reg252) : (reg260 ?
                           (reg251 <<< $unsigned((7'h40))) : ({reg268} ^~ ((8'ha1) ?
                               wire235 : reg251)))));
  assign wire279 = ({reg272[(2'h2):(2'h2)],
                       ($unsigned((&(8'ha4))) >> {reg240,
                           (&wire278)})} <<< (!(!$unsigned(wire238))));
  always
    @(posedge clk) begin
      reg280 <= (^~((&{$signed(wire238)}) ?
          $unsigned(((wire277 ? reg257 : wire265) == {reg267,
              reg262})) : $unsigned((~(8'h9d)))));
      if (((wire249[(3'h6):(3'h5)] ?
              (($unsigned(wire276) ?
                  reg266[(5'h10):(4'hf)] : (reg255 + reg268)) && (reg257 ?
                  (wire275 ?
                      reg255 : (8'hbd)) : (^wire244))) : (~|$unsigned((reg269 && reg257)))) ?
          reg242 : reg258[(5'h13):(4'hb)]))
        begin
          reg281 <= (~^(~^(($unsigned(reg280) * $signed(wire265)) ?
              $signed(reg257) : $signed((reg269 ? wire246 : reg266)))));
          reg282 <= $unsigned({(wire238 ~^ $signed($signed((8'ha3)))),
              (!$unsigned((reg281 ? reg266 : wire238)))});
          if ((reg252[(4'h9):(3'h6)] ?
              ($unsigned(wire275) ?
                  reg262[(4'hb):(4'hb)] : (+{$unsigned(reg257),
                      reg256[(2'h3):(1'h1)]})) : $unsigned($unsigned({$signed(reg281),
                  $signed((8'hb2))}))))
            begin
              reg283 <= reg272[(1'h0):(1'h0)];
              reg284 <= reg242[(4'ha):(3'h5)];
              reg285 <= {reg239};
              reg286 <= $unsigned(reg283[(3'h7):(2'h3)]);
              reg287 <= ((+(-reg286)) ^ reg256);
            end
          else
            begin
              reg283 <= (({(((8'ha1) ~^ reg273) >>> (&reg252))} ?
                      (((reg254 | reg251) ^ (^~reg273)) ?
                          (!(reg257 ^ reg269)) : reg240) : ($signed(wire277[(3'h4):(2'h2)]) << ((wire234 ?
                          reg280 : reg274) - reg256))) ?
                  (wire236[(2'h2):(2'h2)] ?
                      reg269[(4'hb):(1'h0)] : ((^wire247) ^ $unsigned((reg283 ?
                          reg253 : reg280)))) : $unsigned(reg239[(4'hc):(4'hc)]));
              reg284 <= wire249;
              reg285 <= $signed($unsigned((wire248 - (~^(&wire249)))));
            end
          if (($unsigned($unsigned($unsigned((reg254 <= reg258)))) > (|(!reg262))))
            begin
              reg288 <= $signed((8'h9d));
            end
          else
            begin
              reg288 <= ((((reg241[(4'h8):(3'h6)] ?
                          (~&wire277) : (reg255 & reg270)) ?
                      $signed($unsigned(wire264)) : (|wire277[(3'h6):(3'h4)])) ?
                  reg260 : reg259[(3'h4):(1'h1)]) + reg287);
              reg289 <= (!$signed({$unsigned((reg257 ? reg266 : reg269))}));
              reg290 <= (^~reg240);
              reg291 <= $unsigned(reg242[(3'h4):(2'h3)]);
              reg292 <= (&reg269);
            end
          if (($unsigned($signed(reg250)) ?
              reg284 : (&(^(~|$unsigned(wire234))))))
            begin
              reg293 <= reg282;
            end
          else
            begin
              reg293 <= (8'ha5);
              reg294 <= reg243[(2'h2):(2'h2)];
              reg295 <= reg294;
            end
        end
      else
        begin
          if (reg257[(4'ha):(4'ha)])
            begin
              reg281 <= {$signed({({reg240, reg291} ^ reg285[(4'hf):(4'ha)])})};
              reg282 <= (wire265[(3'h6):(2'h2)] ?
                  $unsigned(reg280[(3'h5):(2'h2)]) : reg256);
            end
          else
            begin
              reg281 <= (reg285[(5'h11):(4'he)] <<< $unsigned(($unsigned($unsigned(reg258)) ?
                  $signed((reg258 ? (8'ha9) : reg262)) : ($signed(reg273) ?
                      $unsigned((8'haa)) : wire245[(1'h1):(1'h1)]))));
              reg282 <= wire236;
              reg283 <= ($signed(reg285[(1'h0):(1'h0)]) ?
                  (!$unsigned(reg288)) : (8'haf));
              reg284 <= reg292;
              reg285 <= reg255[(3'h6):(3'h5)];
            end
          reg286 <= (!(8'ha9));
          if ($signed((~|(8'ha5))))
            begin
              reg287 <= (wire245[(3'h7):(1'h1)] ?
                  ($signed(($unsigned((7'h43)) ?
                      $unsigned(reg243) : (+reg284))) ^ $unsigned((((8'ha2) << reg291) ?
                      {wire248} : reg282))) : $unsigned(reg294));
              reg288 <= ((!(^~$signed((~^reg242)))) << (reg288 || wire279));
            end
          else
            begin
              reg287 <= {$signed((((reg284 && wire249) ? {reg259} : reg261) ?
                      ({reg260, wire246} ?
                          {reg252,
                              reg271} : (reg241 ~^ reg291)) : ((reg291 ~^ (8'haf)) >>> (reg242 <= reg250)))),
                  (~|(($signed(reg256) ^ (reg271 != (8'hbd))) * (((8'ha8) ?
                      (8'h9c) : reg263) >> reg261)))};
            end
          reg289 <= wire249[(3'h4):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg296 <= (reg295 ?
          wire245[(1'h0):(1'h0)] : $unsigned(({$unsigned(wire235)} ?
              (wire249[(4'hc):(4'h9)] != ((8'ha6) ?
                  reg293 : wire247)) : ((reg242 & reg269) ?
                  (reg286 ? (8'hba) : wire264) : (+wire275)))));
    end
  assign wire297 = (reg274 > $signed($unsigned(reg257[(2'h2):(1'h1)])));
  assign wire298 = (((reg267[(4'ha):(3'h4)] + reg242[(2'h2):(1'h1)]) & reg252) ?
                       {{{$signed(wire276), (|(8'hb3))}, $unsigned(reg281)},
                           $unsigned($signed(((8'ha0) ?
                               wire248 : reg282)))} : wire265[(2'h2):(1'h0)]);
  assign wire299 = $signed($unsigned(({(reg263 ? reg256 : reg263),
                       $signed((8'hb7))} || $signed($unsigned(wire278)))));
  assign wire300 = wire248[(2'h3):(1'h1)];
endmodule

module module204  (y, clk, wire209, wire208, wire207, wire206, wire205);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire209;
  input wire [(4'h8):(1'h0)] wire208;
  input wire [(5'h14):(1'h0)] wire207;
  input wire signed [(5'h11):(1'h0)] wire206;
  input wire signed [(4'hf):(1'h0)] wire205;
  wire [(4'hf):(1'h0)] wire219;
  wire [(4'hd):(1'h0)] wire218;
  wire signed [(4'h8):(1'h0)] wire217;
  wire signed [(4'he):(1'h0)] wire216;
  wire signed [(5'h11):(1'h0)] wire215;
  wire [(3'h5):(1'h0)] wire211;
  wire [(4'hd):(1'h0)] wire210;
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg [(2'h2):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg212 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire211,
                 wire210,
                 reg214,
                 reg213,
                 reg212,
                 (1'h0)};
  assign wire210 = (&wire205);
  assign wire211 = ($unsigned(($unsigned($signed((8'ha1))) ?
                       (^~wire210) : $signed($signed(wire206)))) | ($unsigned($signed($unsigned(wire207))) ?
                       $signed(wire207) : wire209[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg212 <= (^{{wire209, wire210}, wire211[(3'h4):(2'h3)]});
      reg213 <= ((reg212 ?
          {((~wire209) ?
                  ((8'hb4) ? wire211 : wire210) : (wire206 ?
                      wire209 : wire210)),
              $signed(wire211[(2'h3):(1'h0)])} : (&$unsigned((wire206 + (8'ha1))))) * (+(~&$signed($signed(reg212)))));
      reg214 <= $signed(wire208);
    end
  assign wire215 = ((wire205[(4'ha):(3'h5)] + (!$signed($unsigned(wire211)))) ?
                       (^~(wire207[(3'h5):(3'h4)] ?
                           (-wire209) : (wire208 <= wire211[(1'h1):(1'h0)]))) : (+$unsigned((8'hb7))));
  assign wire216 = {($signed($signed(wire210[(4'hd):(4'hb)])) - (|$signed($unsigned(wire209))))};
  assign wire217 = {$signed(wire208[(3'h7):(3'h7)]),
                       $signed($signed(((wire210 ? (8'haf) : (8'hb9)) ?
                           (8'had) : $unsigned((8'hac)))))};
  assign wire218 = {((~&(wire216[(4'hc):(3'h4)] & reg213)) ?
                           wire207 : (wire211 ~^ $unsigned($signed(reg213))))};
  assign wire219 = $unsigned(wire208);
endmodule
