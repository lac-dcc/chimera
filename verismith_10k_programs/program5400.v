module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  assign y = {wire91, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire3[(4'ha):(2'h3)];
  assign wire5 = {((~&$unsigned($signed(wire0))) ?
                         (!((wire4 ?
                             wire1 : wire3) >> wire3[(4'ha):(4'h8)])) : {wire3,
                             {(+wire2), (wire0 + (8'ha1))}})};
  assign wire6 = $unsigned(wire5[(2'h2):(2'h2)]);
  assign wire7 = ({wire3[(4'ha):(3'h7)],
                     wire4[(3'h7):(3'h4)]} ^~ wire3[(3'h4):(1'h0)]);
  module8 #() modinst92 (.clk(clk), .wire10(wire4), .y(wire91), .wire9(wire6), .wire12(wire0), .wire11(wire2));
endmodule

module module8
#(parameter param90 = (8'ha0))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire88;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire43;
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  assign y = {wire88,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire43,
                 reg61,
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
  assign wire13 = wire12;
  assign wire14 = ($unsigned(({(wire11 ? wire9 : wire13),
                      ((8'hbf) >> wire13)} > $signed($unsigned(wire12)))) ^ $signed({((wire12 ?
                          wire13 : wire13) > (^~wire12)),
                      wire11[(3'h6):(3'h4)]}));
  assign wire15 = wire11[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= (wire14 * ((wire10[(3'h4):(1'h0)] ?
              wire10 : ($signed(wire15) ? $unsigned(wire11) : wire10)) ?
          $unsigned(wire12) : (!wire10)));
      if ((~^(($unsigned($signed((8'hb2))) >>> {{reg16}}) ?
          wire13 : ($signed({wire9}) | reg16))))
        begin
          reg17 <= (wire9 ? (8'hbf) : reg16[(1'h1):(1'h0)]);
          reg18 <= (~^{$signed(wire11[(2'h3):(1'h0)]), $unsigned(wire15)});
          reg19 <= ((&$signed((8'ha1))) | ($unsigned(wire14) ?
              (7'h40) : $signed(($unsigned(wire14) != (wire14 > (8'hb1))))));
          reg20 <= wire15;
          if ((8'hb4))
            begin
              reg21 <= $signed((8'ha0));
              reg22 <= $unsigned((8'hbe));
            end
          else
            begin
              reg21 <= ($signed(($unsigned((reg22 ^ wire12)) ?
                      (wire9 ? {reg16} : $unsigned(reg16)) : (8'hac))) ?
                  (|(({reg19,
                      (7'h44)} ^~ $unsigned(reg22)) != $signed((+reg16)))) : wire12);
              reg22 <= (~&wire10);
              reg23 <= (((($unsigned(reg19) ?
                  (~&wire10) : (reg16 ?
                      wire9 : (8'hab))) << $unsigned((^~reg18))) > (&wire10[(3'h6):(3'h6)])) > (~|($unsigned($unsigned((8'hb1))) ?
                  (8'hbc) : ((^~wire14) ?
                      (wire15 ? reg20 : wire12) : (&reg22)))));
              reg24 <= (wire12 << $unsigned($unsigned((reg22 ?
                  wire15[(2'h3):(2'h3)] : $unsigned(reg23)))));
            end
        end
      else
        begin
          reg17 <= $signed((((8'ha4) ?
                  (8'hba) : {(wire10 >>> wire13), $signed(reg18)}) ?
              (-{$unsigned(reg24)}) : (^$unsigned({reg17}))));
          reg18 <= wire15[(2'h3):(2'h2)];
        end
    end
  assign wire25 = {(((~&(~&wire13)) ?
                          wire11[(1'h1):(1'h1)] : $signed(((8'haa) <<< reg17))) >>> ((reg17 || (8'h9d)) >>> (^(reg22 ?
                          reg20 : reg20))))};
  module26 #() modinst44 (wire43, clk, reg18, reg16, reg17, wire25);
  assign wire45 = $signed((&(~&((8'ha5) ? reg20 : (reg17 ? wire43 : reg18)))));
  assign wire46 = (wire14 ^~ {((reg24[(5'h12):(3'h6)] ?
                              $unsigned((8'hbc)) : reg22) ?
                          reg22 : $signed((~^wire12))),
                      ($signed((reg22 ~^ wire43)) ?
                          wire9[(2'h2):(1'h0)] : $signed(wire12))});
  assign wire47 = ({$signed({$unsigned(wire14), wire12}),
                      {{reg23}, reg24}} * (reg19[(3'h7):(3'h7)] ?
                      $signed($signed($unsigned((8'hbf)))) : wire13));
  assign wire48 = $signed((($unsigned(((8'hba) ^ reg22)) & $signed(reg23)) ?
                      (($signed(reg23) >= (wire46 ?
                          wire46 : wire11)) == ($unsigned(reg19) + $signed(reg21))) : (($unsigned(wire13) ^ $unsigned(wire10)) <<< (reg24 ^~ {wire43,
                          wire45}))));
  assign wire49 = wire12[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg50 <= (((|wire12) ?
              $signed((wire46 >> $unsigned(wire9))) : wire45[(2'h2):(2'h2)]) ?
          (wire47[(4'hb):(4'h8)] + $signed({$signed(wire12)})) : reg20);
      if ($unsigned(reg50[(2'h2):(1'h1)]))
        begin
          reg51 <= {($unsigned($unsigned($unsigned(wire46))) ~^ ($signed($unsigned((8'hb6))) << (~&{reg18,
                  reg50})))};
          reg52 <= (($signed((+wire14)) ?
              wire47 : wire9) ~^ $signed(((~|reg51[(2'h3):(2'h3)]) + {{reg18,
                  wire49},
              wire43})));
        end
      else
        begin
          if ($signed(reg22[(3'h7):(3'h5)]))
            begin
              reg51 <= $signed($unsigned(((~&((7'h41) > (7'h43))) ?
                  (~^(&wire47)) : ((reg18 ? reg24 : (8'hbc)) ?
                      $signed(wire47) : (~|reg19)))));
              reg52 <= {reg21};
              reg53 <= reg50;
              reg54 <= {(~^((~^$signed(wire25)) >> (!wire47[(4'ha):(2'h3)]))),
                  (-reg51[(2'h3):(2'h2)])};
              reg55 <= wire46;
            end
          else
            begin
              reg51 <= (^~(~&wire14[(1'h0):(1'h0)]));
            end
          reg56 <= {wire10, reg50[(1'h1):(1'h0)]};
          reg57 <= ($unsigned($unsigned(($signed(reg22) ^ (reg19 <<< wire10)))) || $signed(reg52[(3'h5):(2'h2)]));
          reg58 <= $unsigned(reg21);
        end
      reg59 <= wire15;
      reg60 <= (~wire13);
      reg61 <= ((+(^(8'hb8))) >>> $unsigned((!($unsigned(reg17) >= {reg20}))));
    end
  module62 #() modinst89 (.wire63(wire46), .clk(clk), .wire64(reg17), .wire65(reg61), .wire66(wire49), .y(wire88));
endmodule

module module62
#(parameter param86 = (8'hbc), 
parameter param87 = ({param86, (^{(~&param86), (^param86)})} ? {((param86 >>> (~param86)) || (~|(~param86)))} : (((param86 ? param86 : {param86, param86}) ? ((param86 ? param86 : param86) > {(8'h9f), param86}) : param86) ? {(^(param86 ? param86 : param86)), ((param86 ? (8'hb4) : param86) ? param86 : param86)} : (&param86))))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire66;
  input wire signed [(4'hf):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire67;
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire72,
                 wire67,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg74,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire67 = ({wire63, wire66[(3'h4):(2'h3)]} ?
                      ((-($signed(wire66) ?
                              wire65[(4'hd):(3'h7)] : $unsigned(wire64))) ?
                          ((wire66 || ((8'hbb) == wire63)) ?
                              (!wire65[(4'hf):(3'h7)]) : wire65[(4'h9):(3'h7)]) : {$signed((wire63 >> wire63)),
                              wire64}) : ($signed(((wire66 <= wire63) << $signed(wire63))) ?
                          $unsigned(wire64[(1'h1):(1'h1)]) : $unsigned(wire63)));
  always
    @(posedge clk) begin
      reg68 <= (!(~&(-({wire63, wire65} && {wire63, wire66}))));
      if (wire63[(1'h1):(1'h1)])
        begin
          reg69 <= (-(+$signed(({reg68} ? (~&wire63) : (~wire67)))));
          reg70 <= $signed($signed(wire64));
          reg71 <= (-(wire63 << $signed($unsigned(wire67))));
        end
      else
        begin
          reg69 <= (((&reg69[(1'h0):(1'h0)]) != $unsigned({(~&wire64),
                  (wire64 & (8'haf))})) ?
              $unsigned((!wire66[(2'h3):(1'h1)])) : {(((^reg71) ?
                          $unsigned(reg71) : (wire63 ? reg69 : wire65)) ?
                      (^wire65) : (wire65[(4'hd):(3'h7)] ?
                          {wire63, wire63} : $signed(wire65))),
                  (wire67[(1'h0):(1'h0)] < ($signed((7'h41)) >= $unsigned(reg70)))});
          reg70 <= (wire64 ? wire64[(1'h0):(1'h0)] : wire63[(4'hf):(4'hd)]);
        end
    end
  assign wire72 = (~^($signed((+$unsigned(reg69))) & ((8'hbf) - (reg69 && (+reg68)))));
  always
    @(posedge clk) begin
      reg73 <= $signed(wire63[(5'h12):(5'h10)]);
      reg74 <= {$signed((({wire63, wire66} ?
                  reg71[(4'hd):(4'hc)] : {reg68, wire66}) ?
              (wire65 | (wire66 & reg70)) : reg71[(4'hb):(4'hb)])),
          (wire67 ? reg71 : wire67[(3'h5):(1'h1)])};
    end
  assign wire75 = ((($unsigned({(7'h40)}) ~^ $signed($unsigned(wire65))) ?
                          wire72 : reg70[(2'h3):(2'h2)]) ?
                      {(~|($signed(wire67) ?
                              (reg73 ? reg69 : wire72) : (wire67 ?
                                  reg73 : (8'had))))} : reg68);
  assign wire76 = (reg70 >= $unsigned(reg69));
  assign wire77 = (-$signed((($signed(wire66) ?
                          (wire67 ? wire75 : wire67) : reg73) ?
                      (~|{wire66, wire64}) : ((wire66 ?
                          reg71 : reg68) | wire67[(3'h4):(1'h1)]))));
  assign wire78 = ($signed((($unsigned(wire66) ?
                          wire63[(5'h10):(4'hf)] : $signed(wire72)) && $signed({wire66,
                          reg73}))) ?
                      (((wire66 + reg74) >>> {$unsigned(wire76)}) ?
                          {((wire77 >= wire64) && wire63[(4'hb):(4'hb)])} : ((&reg71[(4'hd):(2'h2)]) & ((8'h9f) ?
                              $unsigned(reg71) : wire72))) : wire64[(4'hb):(2'h2)]);
  assign wire79 = (((reg70[(4'hd):(4'ha)] << ((8'ha4) ?
                              $signed(wire64) : (reg69 >> wire77))) ?
                          (^((reg68 ? wire77 : wire64) ?
                              (~^wire72) : wire75[(3'h4):(2'h2)])) : $unsigned(($unsigned((8'hba)) || $signed(reg69)))) ?
                      reg70[(4'h9):(3'h4)] : {($unsigned((reg74 < wire75)) ^~ $unsigned(wire72))});
  always
    @(posedge clk) begin
      reg80 <= wire78;
      reg81 <= reg68;
      reg82 <= ($unsigned(wire63) ? wire79[(3'h6):(1'h1)] : $signed(reg73));
      reg83 <= (($signed(((-wire67) ~^ wire66)) >= ($signed((reg71 > wire64)) ?
              (!{wire75}) : (reg71 < $signed(reg74)))) ?
          reg80 : reg74);
    end
  assign wire84 = (~&wire64);
  assign wire85 = ((8'ha6) + reg82[(1'h1):(1'h0)]);
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire30;
  input wire [(5'h13):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  assign y = {wire42,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= (^({wire30[(2'h2):(1'h0)], $unsigned((wire30 ^ wire29))} ?
          (~$unsigned((+wire29))) : wire27));
      reg32 <= $unsigned((($unsigned((reg31 ?
              wire30 : (7'h42))) != $signed({wire30})) ?
          ($unsigned(wire29[(3'h5):(2'h2)]) ?
              ($unsigned(wire27) ?
                  wire28[(3'h4):(2'h2)] : {reg31}) : (8'hb9)) : (!wire30)));
      reg33 <= reg31[(1'h0):(1'h0)];
      reg34 <= (~^(7'h43));
      reg35 <= $unsigned($unsigned((~^{(wire28 * reg31)})));
    end
  assign wire36 = $signed((((~&reg34) ?
                      reg34[(3'h5):(3'h4)] : ((&reg31) <<< (reg35 ?
                          reg31 : reg34))) * $unsigned($unsigned(wire30))));
  assign wire37 = ($signed($unsigned(reg31)) ?
                      ((^~((reg34 != reg33) ?
                              wire27[(3'h5):(2'h3)] : $unsigned(wire27))) ?
                          wire27[(1'h0):(1'h0)] : {((-reg34) ?
                                  (+reg31) : (wire36 == (8'hbb)))}) : wire29);
  assign wire38 = $unsigned({$signed($signed({wire37})),
                      (~((~(7'h42)) <<< reg33))});
  assign wire39 = (($unsigned(($signed(wire29) ^ {wire37})) != wire30) ?
                      (reg35[(4'hb):(2'h2)] >= ((~|wire29) <<< $signed(reg33))) : $signed(($signed((8'ha6)) * $signed(reg34))));
  assign wire40 = (((((wire36 ? wire38 : reg35) ?
                              $signed(reg33) : $signed(reg34)) - (^(~&wire29))) ?
                          $unsigned((~|(wire36 ?
                              wire36 : reg33))) : {$signed((+(8'h9e)))}) ?
                      ({(wire30 > {wire39, wire29}),
                          (~(wire38 <= wire37))} <<< $signed($unsigned($unsigned(wire37)))) : (~|((~(&wire37)) ^ $signed($unsigned(wire38)))));
  assign wire41 = {(^wire30[(2'h3):(1'h0)]), wire40};
  assign wire42 = wire41;
endmodule
