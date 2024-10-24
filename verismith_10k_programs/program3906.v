module top
#(parameter param133 = ((((|{(8'ha6)}) * ((8'ha0) ? (~(8'h9e)) : (!(8'ha9)))) ? ((((8'hb7) ? (8'hbd) : (8'hb7)) >> (|(8'h9f))) >> {((8'ha1) ? (8'hbc) : (7'h41)), (|(8'ha2))}) : (~|(((8'ha2) ? (8'hb7) : (8'ha8)) > (8'h9e)))) ? (({((8'hb3) > (8'ha9))} + ((!(8'hac)) ? (~^(8'hac)) : ((8'hb8) ? (8'ha1) : (8'hae)))) ? (((~^(8'h9f)) | ((8'hba) ? (8'haf) : (8'hbf))) ? {((8'h9e) < (8'ha1)), {(8'ha9)}} : ((8'ha7) ? (^~(8'hb1)) : (~(8'ha6)))) : ((((8'hbb) ? (8'hb5) : (8'hba)) - ((7'h43) ? (8'hb6) : (7'h42))) ? (+(&(8'ha0))) : {(~|(8'hb9))})) : {((((8'hb4) ? (8'hbb) : (8'h9f)) ? {(8'hbe), (8'hac)} : ((8'ha3) ^~ (8'hb3))) ? {((8'h9d) ? (8'ha4) : (7'h43))} : ((8'hac) ? ((8'ha6) - (8'h9f)) : (^~(8'ha0)))), ({((8'hab) ? (7'h40) : (7'h44))} + (((8'hb8) ~^ (7'h43)) >> ((8'ha4) ? (8'hb5) : (8'hb3))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire130;
  wire signed [(5'h11):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg123 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire126,
                 wire121,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg129,
                 reg128,
                 reg127,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire5 = (($unsigned((~^(^wire0))) ?
                     $signed((8'ha7)) : (~$unsigned(wire4))) && ({(~|wire1[(2'h2):(2'h2)])} ?
                     wire3 : {($unsigned(wire0) ?
                             (&wire3) : wire2[(4'h9):(3'h6)]),
                         (^$signed(wire2))}));
  assign wire6 = $unsigned(($signed($unsigned(wire5[(4'h8):(3'h6)])) >= $signed(wire3)));
  assign wire7 = ((($signed(wire6[(3'h6):(1'h0)]) < (!$unsigned(wire4))) ?
                         wire3 : $unsigned((wire5[(4'hb):(2'h2)] << (wire2 ^~ wire3)))) ?
                     $unsigned($unsigned(wire6[(2'h2):(1'h1)])) : $signed(wire0[(4'hb):(3'h5)]));
  assign wire8 = {(~($unsigned(wire3) ?
                         $signed((~|wire6)) : wire6[(4'ha):(4'h9)]))};
  assign wire9 = ((($signed($unsigned(wire6)) ?
                             wire4[(1'h0):(1'h0)] : (~^$unsigned(wire2))) ?
                         ({$signed((8'ha4))} ?
                             (^~wire3[(3'h7):(3'h4)]) : wire8[(3'h7):(3'h4)]) : (wire3[(1'h1):(1'h0)] ?
                             $unsigned(wire5) : wire5[(5'h12):(2'h2)])) ?
                     wire3 : $unsigned(wire4[(4'h8):(1'h1)]));
  assign wire10 = (^{(-(wire2 ? (wire4 < (7'h44)) : (wire0 ? (8'ha8) : wire9))),
                      ((^~wire8[(2'h2):(1'h1)]) ?
                          ($signed((8'hb8)) ?
                              $unsigned(wire7) : $unsigned(wire5)) : wire3[(3'h5):(3'h4)])});
  module11 #() modinst122 (.y(wire121), .wire14(wire0), .wire15(wire6), .wire12(wire2), .wire13(wire8), .clk(clk));
  always
    @(posedge clk) begin
      reg123 <= wire10[(1'h1):(1'h0)];
      reg124 <= (^wire9[(4'hc):(1'h1)]);
      reg125 <= {$unsigned(wire4),
          ((~|{wire1[(1'h0):(1'h0)]}) >>> (wire10 ?
              $unsigned((!reg123)) : wire0))};
    end
  assign wire126 = (~&$signed($unsigned($unsigned($unsigned(wire0)))));
  always
    @(posedge clk) begin
      reg127 <= (~|$unsigned((|{$unsigned(wire8)})));
      reg128 <= (^(8'hbc));
      reg129 <= (wire6 < (8'ha0));
    end
  assign wire130 = (wire5 ?
                       {reg128, $unsigned(wire9)} : ({(+reg128)} <= reg123));
  assign wire131 = (($unsigned(reg128) == (reg125 || {(~wire3)})) ?
                       wire7 : wire2);
  assign wire132 = wire7[(1'h0):(1'h0)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire15;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire58;
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  assign y = {wire120,
                 wire118,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire15[(2'h2):(2'h2)])
        begin
          reg16 <= (&{($signed(wire15) ^ wire13)});
          reg17 <= ({(&reg16)} + (~(wire13 > ($unsigned(wire14) >= wire15[(4'h8):(1'h1)]))));
          reg18 <= (reg17[(4'h8):(3'h5)] ^ $unsigned(wire14[(4'ha):(2'h3)]));
          reg19 <= ((wire15 ?
              (wire14 < ($unsigned((8'ha7)) ?
                  (wire14 ~^ wire14) : wire15[(2'h2):(2'h2)])) : $signed($unsigned({reg16,
                  reg17}))) ~^ reg18[(1'h0):(1'h0)]);
        end
      else
        begin
          reg16 <= (($unsigned(reg17[(4'h9):(3'h6)]) * {reg19[(3'h4):(2'h3)],
                  $signed(((8'ha1) ? reg19 : reg17))}) ?
              {(^($unsigned(reg17) ? reg17[(2'h3):(1'h0)] : (8'hb4))),
                  $signed(($signed(wire15) + $signed((8'hbc))))} : reg16);
        end
      if (({$signed($signed((reg18 ? (8'h9f) : reg19)))} ?
          wire14 : wire14[(4'ha):(2'h2)]))
        begin
          reg20 <= (wire15[(2'h3):(2'h2)] ? (reg18 | reg16) : reg17);
          reg21 <= $signed($signed(wire13));
          reg22 <= reg19[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned(reg21))
            begin
              reg20 <= (8'ha3);
            end
          else
            begin
              reg20 <= $unsigned($signed(((!$unsigned((8'ha0))) <<< reg22[(4'h9):(1'h1)])));
              reg21 <= $signed({reg20});
              reg22 <= (~^$unsigned((~|(~^{reg20}))));
              reg23 <= reg18[(3'h7):(3'h6)];
              reg24 <= (~(+($signed($unsigned((8'hb1))) ?
                  reg18[(4'hf):(3'h4)] : $signed($unsigned((8'hb5))))));
            end
          reg25 <= (((reg21[(2'h3):(2'h3)] || reg17[(1'h1):(1'h1)]) ?
                  ($unsigned({reg23, wire15}) ?
                      (+reg20[(3'h7):(1'h1)]) : ((8'hbf) ?
                          $unsigned((8'ha7)) : reg16)) : ($unsigned((reg17 ?
                          wire13 : wire12)) ?
                      ($signed(wire15) ?
                          {reg23, reg24} : reg22) : (~$unsigned((8'hab))))) ?
              ($unsigned(wire13[(1'h1):(1'h1)]) ?
                  (+reg24) : reg16) : $unsigned($signed($unsigned(wire12[(2'h3):(1'h1)]))));
        end
    end
  module26 #() modinst59 (wire58, clk, reg17, wire14, reg23, wire15, reg20);
  assign wire60 = (({$unsigned(((8'hbf) ?
                          wire13 : reg17))} + (wire12 ^~ $unsigned((reg19 < wire58)))) >>> $unsigned(wire15[(2'h2):(2'h2)]));
  assign wire61 = (^~(reg17[(1'h1):(1'h1)] + reg20[(4'ha):(3'h7)]));
  assign wire62 = $signed(($unsigned({$unsigned(wire60)}) * ($signed((wire15 ?
                      wire12 : wire15)) > (~|(8'hb4)))));
  assign wire63 = $unsigned($signed($signed(((reg25 < wire12) >>> (wire58 ?
                      reg21 : reg22)))));
  always
    @(posedge clk) begin
      if ($signed(($unsigned({$unsigned(wire60),
          {wire63, (7'h40)}}) | reg18[(5'h12):(3'h5)])))
        begin
          if (reg16)
            begin
              reg64 <= {$signed($signed((~^$unsigned(wire62))))};
              reg65 <= $signed(((8'hb3) + ((reg17[(3'h7):(3'h5)] ?
                  reg22[(3'h5):(1'h0)] : reg17) - $signed((^wire60)))));
              reg66 <= reg65[(1'h1):(1'h1)];
            end
          else
            begin
              reg64 <= $signed($unsigned($unsigned($signed((reg18 ?
                  wire15 : reg22)))));
              reg65 <= ($signed(wire14) ?
                  $signed(($signed((~^wire12)) ^ $unsigned((reg18 ?
                      wire63 : wire61)))) : (-reg21[(1'h1):(1'h0)]));
              reg66 <= reg25;
              reg67 <= ($signed($unsigned((8'ha9))) ?
                  wire61 : ((~|{$signed(wire58), {reg65}}) ?
                      {($unsigned(wire61) * wire12[(3'h4):(1'h1)]),
                          wire60[(3'h4):(2'h3)]} : (reg21 ?
                          (~$signed(wire15)) : ($unsigned((8'hb1)) ?
                              reg20 : reg23))));
              reg68 <= {$unsigned((~^reg66))};
            end
          reg69 <= $signed((!reg19));
        end
      else
        begin
          reg64 <= ((($signed($signed(wire60)) ?
                  ((wire61 ? wire13 : reg67) ?
                      (reg66 ?
                          reg21 : wire62) : $unsigned((8'hb8))) : (reg21[(4'hc):(1'h1)] ?
                      {wire14} : $unsigned(reg17))) ?
              (reg19[(2'h3):(2'h2)] ? reg20 : (^~{reg67})) : ($signed((reg68 ?
                  wire58 : wire13)) ^~ $unsigned(((8'hb2) | reg25)))) >>> ((&(~|(+wire60))) ?
              (~^((reg18 ? reg24 : wire61) >> reg16)) : $unsigned(wire60)));
          if ($signed(((^~$signed((wire60 ?
              reg23 : reg64))) <<< $signed($signed((reg69 ^ wire15))))))
            begin
              reg65 <= $unsigned({((~&(reg23 ? wire60 : reg25)) >>> (^(wire14 ?
                      reg66 : (8'hac))))});
              reg66 <= reg23;
              reg67 <= wire60[(2'h3):(1'h1)];
              reg68 <= (reg16[(3'h4):(1'h0)] ? wire60[(3'h5):(3'h5)] : reg68);
              reg69 <= $signed(reg22[(1'h1):(1'h0)]);
            end
          else
            begin
              reg65 <= ($signed((+(8'h9c))) ^~ wire14);
              reg66 <= reg25[(3'h7):(1'h0)];
              reg67 <= {reg18[(5'h15):(1'h1)]};
            end
          reg70 <= ((^~reg68[(1'h1):(1'h0)]) ?
              wire14 : $unsigned((((reg16 ? reg18 : reg19) < (~^wire63)) ?
                  ($signed(reg24) <<< (wire12 >>> reg20)) : ((~^reg17) ?
                      (-(8'hb1)) : (8'hb5)))));
          if (wire58)
            begin
              reg71 <= ((($signed((reg17 != reg65)) >> wire14[(3'h7):(1'h1)]) ^ ((^~reg69[(1'h1):(1'h0)]) >>> {$unsigned(wire13)})) >>> reg21);
              reg72 <= {(($unsigned((reg20 ^ reg23)) ?
                      $signed({wire15}) : ((reg64 >>> wire13) >>> $unsigned(reg16))) * (reg21 ?
                      (&reg71) : ((reg24 ? reg24 : reg67) != (|reg71)))),
                  $unsigned(($signed((reg17 ? wire12 : (8'hbb))) && ((reg24 ?
                          reg17 : wire13) ?
                      wire15[(1'h1):(1'h1)] : (wire63 * reg66))))};
              reg73 <= (-((^(-{reg19})) + (^~($signed(wire58) ?
                  $unsigned(wire63) : reg21[(1'h0):(1'h0)]))));
              reg74 <= (~|((8'hbf) << {(~|(wire61 ? reg25 : reg19)),
                  $signed((reg24 ? reg71 : reg64))}));
            end
          else
            begin
              reg71 <= (reg67[(5'h12):(4'hb)] ?
                  ($signed($signed((~^reg64))) ?
                      $signed(wire58[(1'h1):(1'h1)]) : reg23) : ($unsigned($signed($unsigned(wire12))) ?
                      $signed(((8'hab) > (reg24 >> wire13))) : $signed((~|wire60[(1'h0):(1'h0)]))));
              reg72 <= reg19;
              reg73 <= $unsigned(reg73[(4'hf):(2'h3)]);
              reg74 <= {wire12[(1'h0):(1'h0)]};
            end
        end
    end
  assign wire75 = wire62;
  module76 #() modinst119 (.wire78(wire14), .clk(clk), .wire77(wire58), .wire80(reg69), .y(wire118), .wire79(reg23));
  assign wire120 = {{({$signed(reg71), $signed(reg16)} < $unsigned(wire13))},
                       $signed(($unsigned((wire75 | wire75)) ?
                           $unsigned(reg19) : reg71[(4'h8):(1'h1)]))};
endmodule

module module76
#(parameter param116 = ((~(~((~^(8'hb3)) < ((8'hbb) ? (8'h9c) : (8'haf))))) ? (+(((8'hb8) ^~ {(7'h42), (8'hb5)}) | {((8'hae) ? (7'h42) : (8'h9c))})) : (&(~^(^(~^(7'h44)))))), 
parameter param117 = (({((param116 ? param116 : param116) ? (~param116) : (~param116)), (~|{param116, param116})} <= (param116 ? ((param116 * (8'had)) ? {param116} : (param116 ~^ param116)) : ({param116} < param116))) & ((param116 ? {param116} : ((param116 ? param116 : param116) * (param116 ? param116 : param116))) ? {(^(param116 >>> (8'hb6))), ((param116 ? (8'ha2) : param116) != (-param116))} : (|((param116 && param116) ? param116 : param116)))))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire [(5'h15):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  assign y = {wire115,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire83,
                 wire82,
                 wire81,
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
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire81 = wire77[(4'hb):(3'h6)];
  assign wire82 = (|(wire81[(2'h3):(1'h0)] ?
                      (+$unsigned($unsigned(wire79))) : (&({wire79, wire80} ?
                          wire78[(1'h1):(1'h1)] : wire78))));
  assign wire83 = wire80[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      if ((&(wire77 ? wire77 : {($unsigned(wire81) | (~&wire81))})))
        begin
          reg84 <= (($signed($unsigned(wire78)) << {{$signed((8'hb6)),
                  {wire83, wire82}}}) ^~ $signed((!(wire79 ?
              $signed(wire78) : wire80[(4'hd):(3'h5)]))));
          reg85 <= (wire83 * (^(|$signed((~&(8'hb4))))));
          reg86 <= ($signed((8'ha7)) ?
              wire81[(1'h0):(1'h0)] : wire78[(2'h2):(2'h2)]);
        end
      else
        begin
          reg84 <= reg85[(2'h3):(1'h0)];
          reg85 <= (^(^~$signed($unsigned((reg84 ? reg84 : (8'hba))))));
          if (wire83)
            begin
              reg86 <= reg85[(4'h9):(3'h6)];
              reg87 <= (&(+{wire83[(4'h8):(1'h1)]}));
            end
          else
            begin
              reg86 <= {{$unsigned(wire78[(1'h1):(1'h0)]), (~|reg85)}};
              reg87 <= (-$signed((+reg84)));
              reg88 <= $unsigned($unsigned(reg87));
            end
          reg89 <= {((~^reg85) <= (|$signed({(8'hb5)})))};
        end
      reg90 <= {$unsigned({(8'ha2), reg86}), reg85[(4'h9):(4'h9)]};
      reg91 <= (^~reg86[(3'h5):(3'h5)]);
    end
  assign wire92 = reg89;
  assign wire93 = (~&wire83);
  assign wire94 = {$unsigned((^(|wire93[(3'h5):(1'h0)]))),
                      $signed(reg91[(3'h5):(1'h0)])};
  assign wire95 = (reg91[(4'hb):(4'hb)] | $unsigned(reg85));
  assign wire96 = $unsigned(((wire78 ^ $unsigned((reg85 | wire79))) | (8'hbe)));
  assign wire97 = ($unsigned(((&(wire95 != wire81)) ~^ ($signed(reg90) & {wire80}))) ?
                      (reg86 > {{(wire82 ? wire78 : (8'hb5)), wire81},
                          $unsigned({reg88,
                              wire94})}) : (wire78[(1'h1):(1'h0)] * ((wire94[(3'h7):(1'h1)] ?
                          (~reg86) : $unsigned(reg86)) <<< wire78[(2'h3):(2'h3)])));
  assign wire98 = {$unsigned((wire82[(2'h3):(1'h1)] > ({reg86} <= {wire96})))};
  always
    @(posedge clk) begin
      reg99 <= reg85;
      if ($signed($signed((($unsigned(wire98) ?
          $signed(wire95) : (wire97 || wire78)) - (8'hbd)))))
        begin
          reg100 <= (~(reg85[(5'h11):(4'h9)] ~^ wire79));
        end
      else
        begin
          if ((wire92 ? (!reg84) : reg100[(4'hb):(4'hb)]))
            begin
              reg100 <= {($unsigned(wire92) ?
                      ($unsigned($signed((8'h9d))) - ((reg87 ?
                          reg87 : wire93) - (-(8'ha0)))) : (^(+(~wire94))))};
              reg101 <= reg90[(1'h0):(1'h0)];
              reg102 <= $unsigned($signed((wire96[(3'h4):(3'h4)] + {reg99[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg100 <= $unsigned(($signed($unsigned(reg87)) ?
                  $signed($unsigned($unsigned(wire97))) : (wire80[(4'hb):(3'h5)] ?
                      {reg100} : reg85[(4'ha):(2'h3)])));
              reg101 <= $signed((reg102[(3'h6):(1'h1)] ?
                  wire98 : $signed(({wire92, wire98} ?
                      (wire95 ? (8'hb9) : reg88) : (~reg84)))));
              reg102 <= $signed(wire94[(2'h3):(1'h0)]);
              reg103 <= (wire81[(2'h3):(1'h0)] ?
                  wire96[(2'h2):(1'h0)] : ((~^reg85) ?
                      (&(wire93 || ((8'ha8) ? reg102 : wire77))) : wire92));
              reg104 <= $unsigned($signed(($unsigned(wire83) + (~{wire83}))));
            end
          if ($unsigned($signed(wire77[(4'h8):(3'h6)])))
            begin
              reg105 <= wire77;
              reg106 <= ((7'h42) <<< (($unsigned($unsigned(wire80)) ?
                      {(^~reg102)} : $signed((8'h9e))) ?
                  $unsigned(reg84[(4'hd):(4'h9)]) : wire92[(4'hc):(4'ha)]));
            end
          else
            begin
              reg105 <= ($unsigned(({reg105[(2'h2):(1'h1)]} << reg87)) ?
                  ((8'hb0) || (7'h43)) : $unsigned(($unsigned(wire81[(2'h2):(2'h2)]) << {$unsigned(reg103)})));
              reg106 <= {{reg102, reg86}};
              reg107 <= $unsigned($signed(wire83[(2'h2):(1'h1)]));
              reg108 <= wire97;
              reg109 <= $unsigned(wire95[(4'he):(1'h0)]);
            end
          if (reg84[(1'h0):(1'h0)])
            begin
              reg110 <= ((-{($signed((7'h43)) < $unsigned(wire96)),
                      $signed((~|wire78))}) ?
                  $unsigned(({$unsigned(reg87),
                      ((7'h40) ?
                          reg87 : reg88)} + $signed((reg88 & reg108)))) : reg88[(4'hb):(2'h2)]);
              reg111 <= (($signed(($unsigned(reg103) ^ reg102)) ?
                      (reg107[(2'h2):(1'h0)] ?
                          $signed($unsigned((8'ha9))) : ($signed(reg110) <= (^~reg84))) : wire82[(3'h7):(2'h3)]) ?
                  $unsigned((((|wire95) != wire93) ~^ $signed((reg86 ?
                      (7'h40) : wire80)))) : $signed((~|reg106[(4'hb):(1'h1)])));
              reg112 <= $signed({reg87, $unsigned($unsigned(reg90))});
              reg113 <= reg108;
            end
          else
            begin
              reg110 <= (8'h9d);
              reg111 <= reg102;
              reg112 <= reg111;
              reg113 <= wire78[(2'h3):(2'h2)];
              reg114 <= $signed((reg110[(3'h5):(2'h3)] + (!$signed(reg103))));
            end
        end
    end
  assign wire115 = (~&$signed($unsigned((8'ha5))));
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire31;
  input wire [(5'h12):(1'h0)] wire30;
  input wire signed [(3'h5):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire [(5'h15):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire32 = {$unsigned((wire29[(3'h4):(2'h3)] != $signed((wire28 ?
                          wire29 : wire30))))};
  assign wire33 = $signed(($unsigned($unsigned($signed(wire31))) ?
                      (^~wire27[(5'h14):(4'hf)]) : (wire31[(4'h8):(3'h6)] ?
                          $signed((wire32 ?
                              wire29 : wire30)) : $signed((8'haa)))));
  assign wire34 = {wire33, wire27[(5'h12):(5'h10)]};
  assign wire35 = $unsigned(wire30[(3'h7):(3'h5)]);
  assign wire36 = $unsigned(($unsigned($signed((wire28 ? wire27 : (8'hb3)))) ?
                      wire28 : $signed((+(wire34 << wire32)))));
  always
    @(posedge clk) begin
      reg37 <= wire29;
      reg38 <= ($signed(($signed({wire31, (8'h9d)}) + wire34[(1'h1):(1'h1)])) ?
          $unsigned(($unsigned(wire32[(3'h6):(3'h5)]) ?
              ($signed(wire29) < (^wire36)) : (wire31[(4'ha):(4'ha)] << (~(8'hb0))))) : $signed(wire30[(2'h2):(1'h1)]));
      reg39 <= (-($signed((+(+wire34))) || wire28[(5'h15):(4'hf)]));
      if ((~&(~&$unsigned(reg38[(1'h0):(1'h0)]))))
        begin
          if ($signed($signed(($unsigned(reg39) ?
              wire35[(3'h5):(2'h3)] : reg37[(2'h3):(1'h0)]))))
            begin
              reg40 <= ($unsigned((8'ha8)) ? $unsigned(wire36) : reg39);
              reg41 <= reg37;
            end
          else
            begin
              reg40 <= (~|((^$unsigned($unsigned(wire27))) ?
                  $unsigned((&(~^wire30))) : wire34[(1'h1):(1'h1)]));
              reg41 <= (~^wire33[(1'h0):(1'h0)]);
              reg42 <= ((($unsigned(wire33) ?
                      $signed((reg37 ?
                          wire28 : reg37)) : wire29) == (~|wire27[(5'h10):(4'h8)])) ?
                  $signed((~|($unsigned(wire31) | (&reg38)))) : $signed($unsigned((!(wire32 ?
                      wire35 : (8'had))))));
            end
          if (reg39[(1'h1):(1'h1)])
            begin
              reg43 <= ($signed(((^(~wire30)) ?
                  $unsigned($signed((8'h9f))) : ((wire31 ?
                      wire33 : wire31) == (reg37 & wire28)))) >> $unsigned((((wire29 ?
                          (8'had) : reg40) ?
                      $signed(reg38) : $signed(wire28)) ?
                  $signed($unsigned(wire32)) : ((wire31 ^~ (8'hb4)) ^ {wire36,
                      wire35}))));
              reg44 <= $unsigned((reg37[(3'h6):(3'h6)] + $signed((^$signed((8'h9f))))));
              reg45 <= (^$signed((~&($unsigned((8'ha5)) ?
                  (wire27 | reg44) : reg44))));
              reg46 <= (((wire30 ?
                          ((wire29 <= (8'hb0)) ?
                              (-reg39) : $signed(wire33)) : $unsigned((~^wire36))) ?
                      $signed((!(8'hb6))) : $signed(wire29)) ?
                  reg44[(1'h1):(1'h0)] : wire27);
            end
          else
            begin
              reg43 <= (-$unsigned($unsigned((+(wire29 ^~ wire31)))));
              reg44 <= $unsigned(wire27[(5'h10):(3'h7)]);
            end
          if (({(((reg41 ? wire29 : reg40) ?
                      $signed(wire31) : $unsigned(wire32)) ?
                  wire34[(1'h0):(1'h0)] : reg41)} <<< (-$unsigned((reg37[(3'h7):(2'h3)] ?
              $unsigned(reg37) : $signed(reg41))))))
            begin
              reg47 <= (wire29[(2'h2):(1'h0)] ^ (-$signed((~|(8'hb5)))));
              reg48 <= reg42[(3'h6):(3'h5)];
              reg49 <= (~(({reg44[(3'h5):(1'h1)],
                  $unsigned(wire30)} ~^ (-$unsigned((8'ha7)))) & ($signed((+wire33)) ?
                  (&(~reg43)) : (|(|reg44)))));
              reg50 <= (^~$signed(($unsigned(reg39) >= reg41[(4'hc):(3'h7)])));
            end
          else
            begin
              reg47 <= reg44[(4'h9):(1'h1)];
              reg48 <= wire30;
            end
          if ($unsigned(($unsigned($signed({reg49})) > wire29[(3'h4):(3'h4)])))
            begin
              reg51 <= (~wire36[(3'h7):(3'h6)]);
              reg52 <= (wire35[(5'h12):(4'hb)] ?
                  $unsigned($unsigned({(reg47 ^~ reg46)})) : (((wire36[(3'h4):(1'h1)] ?
                          {reg40, reg45} : (reg42 ? (8'ha2) : reg41)) ?
                      {(reg44 ? reg37 : reg47),
                          (reg47 ? reg39 : (8'haa))} : reg48) || (~(8'ha0))));
              reg53 <= reg43;
            end
          else
            begin
              reg51 <= reg46;
              reg52 <= (($signed($unsigned(((8'ha2) >= reg43))) ~^ $signed($unsigned(wire36[(3'h5):(1'h0)]))) ?
                  reg39[(2'h3):(1'h1)] : {({(reg38 ? reg46 : reg46), {reg42}} ?
                          $unsigned({wire30}) : ((8'hb0) ?
                              {reg37} : ((8'hbb) << reg42))),
                      reg52[(1'h0):(1'h0)]});
              reg53 <= $signed((|($unsigned((reg48 ? wire35 : (8'hb2))) ?
                  (wire28[(4'hb):(1'h1)] ?
                      $signed(reg41) : reg48) : $unsigned(wire35[(4'h9):(3'h4)]))));
            end
          reg54 <= (~^(!reg41[(4'ha):(3'h5)]));
        end
      else
        begin
          if ((8'hb2))
            begin
              reg40 <= (wire33 != $signed($unsigned({(reg40 ? reg48 : wire36),
                  (~^reg47)})));
            end
          else
            begin
              reg40 <= reg37;
            end
        end
      reg55 <= (^(~|((reg38 & (wire30 ? wire27 : (7'h41))) ?
          {(reg51 && reg38)} : (reg52 ?
              (wire36 ^ reg49) : wire34[(2'h3):(2'h2)]))));
    end
  assign wire56 = ((~&((wire30 || $signed((8'hb0))) ?
                          reg54[(2'h3):(2'h3)] : $signed((-reg46)))) ?
                      (~$signed((wire36[(2'h2):(1'h0)] < (reg41 ?
                          reg40 : wire33)))) : $unsigned((~$unsigned(wire27))));
  assign wire57 = $unsigned($signed(reg50[(3'h6):(1'h1)]));
endmodule
