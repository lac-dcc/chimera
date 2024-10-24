module top
#(parameter param95 = (^{((((8'ha5) ? (8'hbe) : (8'hb4)) ^~ ((8'hba) ^~ (8'haa))) ~^ ((^(8'hbb)) == ((8'ha3) ? (8'h9d) : (7'h40)))), ((~&((8'ha9) + (8'had))) ? ((~(8'ha4)) ~^ ((7'h42) ~^ (8'ha1))) : ({(8'ha1)} == (^~(8'hbc))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire46;
  wire [(5'h11):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire93;
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  assign y = {wire40,
                 wire42,
                 wire43,
                 wire45,
                 wire46,
                 wire47,
                 wire93,
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
                 reg44,
                 (1'h0)};
  module5 #() modinst41 (wire40, clk, wire4, wire2, wire3, wire0, wire1);
  assign wire42 = ({wire0} ?
                      $unsigned((+(~|(wire2 ?
                          wire0 : (8'had))))) : wire4[(4'ha):(1'h1)]);
  assign wire43 = wire42[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg44 <= wire1;
    end
  assign wire45 = $unsigned(wire2[(4'h8):(4'h8)]);
  assign wire46 = wire45;
  assign wire47 = $unsigned(wire42[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire2[(3'h4):(2'h3)])
        begin
          if ($unsigned(wire47[(2'h3):(2'h2)]))
            begin
              reg48 <= $unsigned(((wire45 >= (~$unsigned(wire4))) ?
                  ((8'ha7) == wire4) : (wire42[(3'h5):(3'h4)] || (((7'h40) - wire42) ?
                      $unsigned((8'hbc)) : wire4))));
              reg49 <= wire40;
              reg50 <= wire3;
              reg51 <= ((~$unsigned((wire2[(2'h3):(2'h2)] + (wire2 ?
                      wire3 : wire40)))) ?
                  {wire43[(4'hc):(3'h6)]} : wire4[(3'h5):(3'h5)]);
              reg52 <= ($signed($signed((7'h40))) ?
                  (8'hb4) : wire1[(3'h6):(2'h3)]);
            end
          else
            begin
              reg48 <= wire1[(1'h1):(1'h0)];
            end
          reg53 <= wire46;
          reg54 <= $unsigned(reg51);
        end
      else
        begin
          reg48 <= (+(~|reg54[(1'h0):(1'h0)]));
          reg49 <= (~^$signed(($signed((7'h41)) > reg53[(4'he):(3'h6)])));
        end
      reg55 <= $signed((~((wire45 * $unsigned(wire3)) ?
          ($signed(wire46) ?
              (wire40 * wire1) : (^~wire42)) : $unsigned((wire47 + (7'h40))))));
      reg56 <= ($signed($signed((~|$unsigned(wire3)))) ^ (((|reg55[(3'h7):(1'h0)]) == reg51[(1'h0):(1'h0)]) ?
          {$signed($signed(wire0))} : wire40[(4'ha):(1'h1)]));
      reg57 <= ($signed($unsigned(((wire40 - (8'hac)) | {wire43, reg48}))) ?
          (+((~(reg51 ? reg44 : (8'hb1))) ?
              ($signed(wire0) == $signed(reg53)) : reg48)) : reg52);
      reg58 <= (&reg50);
    end
  module59 #() modinst94 (.wire62(reg50), .wire64(reg57), .wire61(wire42), .wire63(wire45), .clk(clk), .wire60(wire0), .y(wire93));
endmodule

module module59
#(parameter param92 = {((~^(((8'h9c) ? (8'ha3) : (8'ha7)) ? ((8'hb7) >> (8'ha1)) : {(8'hb8), (8'ha4)})) ? (((~(8'hbf)) | {(8'hac), (8'hbf)}) ? (&{(8'ha8), (7'h43)}) : ((^(8'ha8)) > (+(8'hb3)))) : ({(|(8'ha3))} ? (~&{(8'hbf)}) : {((8'ha0) > (8'hb3))})), ((~{((8'hb8) - (8'ha4))}) > (&((!(7'h42)) ? (^(7'h44)) : {(8'haa)})))})
(y, clk, wire64, wire63, wire62, wire61, wire60);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire64;
  input wire signed [(4'hd):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire62;
  input wire signed [(4'hb):(1'h0)] wire61;
  input wire [(4'hf):(1'h0)] wire60;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire65;
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire65,
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
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire65 = wire62;
  always
    @(posedge clk) begin
      reg66 <= (((^wire63[(2'h3):(2'h2)]) + (!((wire62 ~^ (8'ha4)) ?
          $signed(wire60) : (wire60 ? wire64 : wire65)))) ^~ wire60);
      reg67 <= wire60;
    end
  assign wire68 = {{{(wire63[(4'h9):(2'h2)] ? $signed(wire62) : (&reg67))},
                          (~$unsigned({reg66}))}};
  assign wire69 = wire63;
  assign wire70 = (wire65 ? (8'hae) : $unsigned(wire65));
  assign wire71 = $signed($unsigned((((wire64 << wire60) ?
                          (wire64 > wire62) : wire65[(1'h1):(1'h0)]) ?
                      (~$signed((8'hb6))) : (~wire65[(5'h11):(2'h2)]))));
  always
    @(posedge clk) begin
      reg72 <= (|reg66);
      reg73 <= ($unsigned((wire62 ?
              ((~^(8'hab)) <<< $unsigned((8'ha0))) : ({wire70,
                  wire65} << ((8'hb4) == wire60)))) ?
          $signed(reg66[(3'h7):(3'h5)]) : $signed(reg67));
      reg74 <= $unsigned(($unsigned((wire69[(4'he):(4'h8)] ?
              $signed(wire62) : $unsigned(wire63))) ?
          $signed(($signed(reg73) ?
              $unsigned(wire70) : {reg67, (7'h42)})) : $unsigned((!wire65))));
      if ((wire68[(2'h2):(1'h1)] ?
          (7'h41) : (~|((+$signed(reg74)) ? reg66[(4'h9):(3'h4)] : reg66))))
        begin
          reg75 <= reg66;
          if ((($unsigned(reg75) ?
                  (+wire61) : (!$unsigned($unsigned((8'hac))))) ?
              $unsigned((((~^wire70) < (8'ha9)) ?
                  reg73 : (wire63[(4'hc):(3'h5)] > (!wire65)))) : wire64[(4'hd):(1'h1)]))
            begin
              reg76 <= $signed((|wire69));
              reg77 <= {wire63, wire71[(1'h0):(1'h0)]};
              reg78 <= $unsigned(((((wire63 ?
                      (8'h9c) : reg72) > (reg72 * reg77)) ?
                  ((^~wire60) | (-wire64)) : $signed(reg77[(3'h4):(2'h3)])) ^~ wire62));
            end
          else
            begin
              reg76 <= ((($unsigned((reg67 | reg67)) >> (^~{(8'hb6),
                  reg78})) != $signed((~^(reg73 ?
                  wire70 : reg73)))) ~^ wire69[(4'hf):(3'h5)]);
            end
          reg79 <= reg74[(3'h6):(1'h1)];
          if ({(8'hbe), $unsigned(reg78)})
            begin
              reg80 <= {reg73[(2'h3):(1'h1)],
                  (wire70 ? reg79[(4'h8):(2'h2)] : wire71)};
              reg81 <= (wire70 ~^ {$signed((-reg77))});
            end
          else
            begin
              reg80 <= $unsigned(((!reg73[(3'h7):(2'h3)]) <= ({$signed(reg74),
                  reg76} <= $unsigned({wire64, reg66}))));
              reg81 <= ($signed((($unsigned(wire62) << $signed(wire64)) < $signed(wire63))) ?
                  wire63[(2'h2):(2'h2)] : $unsigned(($signed(reg77) ?
                      $unsigned($signed(wire62)) : reg73)));
              reg82 <= {reg67};
              reg83 <= (8'hb3);
              reg84 <= ((&$signed($signed((reg80 >>> reg80)))) ?
                  wire69 : wire69);
            end
          reg85 <= ($unsigned($signed($signed(wire71[(2'h3):(1'h0)]))) & wire70);
        end
      else
        begin
          reg75 <= wire60;
          reg76 <= {(8'ha0), reg83};
          if (($signed(wire62) ? $unsigned(wire69) : (&reg72)))
            begin
              reg77 <= (wire63 + $unsigned({$unsigned((|(8'h9e)))}));
            end
          else
            begin
              reg77 <= $signed($signed((-$signed($signed(reg67)))));
              reg78 <= ($signed((((-wire69) * (&wire68)) || wire60)) - $unsigned($unsigned($unsigned((reg78 + (8'hb2))))));
              reg79 <= (|$unsigned((+(reg74 <<< (~|(8'hbf))))));
              reg80 <= wire70;
            end
          reg81 <= reg83[(4'h8):(1'h0)];
        end
      if ((((~reg82[(2'h2):(2'h2)]) > reg74[(3'h5):(3'h4)]) ^ $unsigned($signed({reg77[(4'h9):(3'h5)],
          {reg72}}))))
        begin
          reg86 <= ({$signed(({wire64, reg78} ?
                  (reg81 ^ (8'ha4)) : $unsigned((8'hb2))))} && (8'h9c));
          if ($signed(reg77[(3'h5):(1'h0)]))
            begin
              reg87 <= wire68;
              reg88 <= $signed($unsigned(((+((8'hac) ?
                  wire70 : reg74)) & (~^(reg80 < reg82)))));
              reg89 <= (reg83[(4'h8):(3'h6)] & reg67);
            end
          else
            begin
              reg87 <= reg86;
              reg88 <= ((reg74 != $unsigned((~(^~reg73)))) ?
                  $unsigned(reg77[(1'h0):(1'h0)]) : reg85);
              reg89 <= (~&$unsigned((~&(^$unsigned(reg67)))));
            end
          reg90 <= (^(reg74 ?
              reg84[(3'h7):(1'h0)] : ((&$unsigned(reg74)) + (reg77 ?
                  reg84[(3'h5):(1'h0)] : {wire63, reg86}))));
          reg91 <= ($unsigned((~&(reg83[(2'h2):(2'h2)] | (wire69 ?
              reg85 : reg82)))) ~^ reg75[(2'h3):(1'h0)]);
        end
      else
        begin
          reg86 <= $signed(($signed($unsigned((reg76 == reg75))) ?
              ($unsigned($signed(reg66)) ?
                  reg79 : ((wire62 * reg67) * {reg76,
                      wire60})) : reg76[(5'h12):(1'h0)]));
          reg87 <= (8'hb9);
          reg88 <= wire71;
        end
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire11;
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
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
                 (1'h0)};
  assign wire11 = wire10;
  assign wire12 = ((8'hb0) ?
                      (({wire11[(1'h1):(1'h1)], $signed(wire11)} ?
                              $unsigned($unsigned((8'ha4))) : wire6[(1'h0):(1'h0)]) ?
                          ($unsigned(((8'h9d) || wire6)) ?
                              $signed((~&wire8)) : $signed((^wire9))) : wire9[(3'h4):(2'h3)]) : $signed($signed($signed(wire11[(1'h1):(1'h0)]))));
  assign wire13 = {{$signed($unsigned($unsigned(wire8))), {$unsigned(wire6)}}};
  assign wire14 = ($signed({$unsigned($unsigned((8'had)))}) << $unsigned($unsigned(wire12[(1'h0):(1'h0)])));
  assign wire15 = $unsigned($unsigned({(wire8[(2'h3):(2'h3)] ~^ (~&wire10))}));
  always
    @(posedge clk) begin
      if (((($signed(wire6) ? (8'h9e) : wire12[(4'hd):(2'h3)]) >= (wire14 ?
              ($unsigned(wire6) - (wire9 - (8'haa))) : ($unsigned(wire15) * {wire6,
                  wire8}))) ?
          wire12[(2'h3):(2'h2)] : $unsigned((&wire12))))
        begin
          reg16 <= (8'hb8);
          reg17 <= wire14[(1'h1):(1'h1)];
          if (($unsigned(reg17) >> wire14[(4'h9):(3'h6)]))
            begin
              reg18 <= wire8[(4'he):(3'h6)];
              reg19 <= reg16;
            end
          else
            begin
              reg18 <= reg19;
            end
          reg20 <= (~&$signed((~&wire7)));
        end
      else
        begin
          reg16 <= (((!(wire6[(4'ha):(1'h0)] ?
              wire14 : $signed(reg20))) > (($signed(wire7) ?
                  wire12[(3'h7):(3'h7)] : {wire14, wire7}) ?
              $unsigned((reg17 ?
                  wire11 : reg16)) : (!$signed(wire9)))) | $unsigned({(^~wire6),
              wire15[(4'h8):(2'h3)]}));
          reg17 <= $unsigned($unsigned(wire6[(1'h0):(1'h0)]));
          reg18 <= wire9;
          if ((wire9 < (8'hab)))
            begin
              reg19 <= $unsigned((($signed($signed(wire11)) ?
                  $unsigned((reg20 ?
                      (8'h9e) : wire10)) : reg19) && (^$signed($signed((8'hbf))))));
            end
          else
            begin
              reg19 <= $signed(wire11[(1'h0):(1'h0)]);
              reg20 <= wire8;
            end
        end
      reg21 <= wire6;
      reg22 <= wire7;
      reg23 <= reg21;
      if ($signed(wire8))
        begin
          reg24 <= (($unsigned(wire8) << wire11) ?
              ({($signed(wire7) >>> (+wire12))} ?
                  (|$signed({wire9})) : ($unsigned($unsigned(reg16)) < wire10)) : wire9);
          if ((($unsigned((reg20 ?
                  {reg20} : $signed((8'hbd)))) * {((wire9 ^ (8'hbd)) & $signed(wire14)),
                  (((8'hbb) || wire6) >> {reg21, reg21})}) ?
              (reg22[(4'h8):(2'h2)] ?
                  (reg19 <<< (!(reg22 ?
                      reg19 : wire8))) : (&reg20[(3'h5):(1'h0)])) : (wire11 ?
                  wire9[(3'h6):(3'h4)] : $unsigned(reg19[(2'h2):(1'h0)]))))
            begin
              reg25 <= reg23[(3'h5):(3'h5)];
              reg26 <= $signed($signed((reg24[(2'h2):(1'h0)] ?
                  ($unsigned(wire11) == (8'ha9)) : ($signed(reg16) ?
                      $unsigned(reg16) : reg23[(3'h6):(2'h2)]))));
              reg27 <= (wire14[(4'h8):(2'h2)] && (^{(reg17[(3'h7):(1'h0)] & (wire13 ?
                      wire13 : wire8))}));
              reg28 <= $unsigned(wire14);
              reg29 <= ($signed((reg22[(4'h9):(1'h0)] < {{(8'hbe),
                      reg16}})) | (wire8 ?
                  {$signed(wire7[(5'h12):(3'h6)]),
                      $signed($signed(wire7))} : wire7[(4'hd):(4'h8)]));
            end
          else
            begin
              reg25 <= ($unsigned($signed(wire7[(5'h13):(4'hc)])) << $signed(reg24[(4'h8):(2'h3)]));
              reg26 <= wire6;
              reg27 <= reg27[(1'h0):(1'h0)];
            end
          if ($signed($signed((((&reg21) == $unsigned(wire6)) << {reg21,
              wire13}))))
            begin
              reg30 <= reg26[(3'h5):(2'h2)];
              reg31 <= (($signed($unsigned(wire11)) * $signed(reg22[(1'h1):(1'h1)])) & ((-$signed(reg24)) ?
                  wire14 : (~{$signed(wire10), ((8'had) << wire10)})));
              reg32 <= reg24[(4'h8):(4'h8)];
            end
          else
            begin
              reg30 <= ({wire11} ?
                  reg21 : $signed($signed(($unsigned(reg29) * (reg27 || wire6)))));
              reg31 <= (reg29[(3'h4):(3'h4)] ?
                  (^~$unsigned(wire14[(1'h0):(1'h0)])) : wire13);
              reg32 <= wire10[(2'h2):(2'h2)];
              reg33 <= wire10[(4'hb):(1'h1)];
              reg34 <= wire10;
            end
          reg35 <= $signed(reg25[(2'h2):(1'h1)]);
        end
      else
        begin
          reg24 <= $unsigned((!$unsigned(wire15)));
          reg25 <= reg26[(3'h6):(3'h4)];
          reg26 <= ((+(^~(8'had))) ?
              $signed($unsigned(($signed(reg24) <<< (reg34 ?
                  wire13 : wire12)))) : ($signed({wire12[(4'hc):(4'ha)],
                  wire13}) & $unsigned({wire14, (8'hbe)})));
          if ({$unsigned((~|reg33))})
            begin
              reg27 <= wire15[(4'h9):(1'h0)];
            end
          else
            begin
              reg27 <= reg19[(2'h2):(1'h1)];
              reg28 <= $unsigned(reg25);
            end
        end
    end
  assign wire36 = (~(~&reg18[(4'h8):(3'h4)]));
  assign wire37 = ((($signed($unsigned(reg33)) ?
                          wire15 : reg18[(4'ha):(2'h2)]) ?
                      $unsigned(reg29) : wire12) || reg30[(1'h0):(1'h0)]);
  assign wire38 = $signed(reg17);
  assign wire39 = (-($signed($unsigned(((8'hbe) ? reg35 : reg27))) ?
                      $unsigned($signed({wire13})) : (~|(8'hae))));
endmodule
