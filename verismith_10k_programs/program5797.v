module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(2'h3):(1'h0)] wire87;
  wire [(5'h14):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire5;
  assign y = {wire89, wire87, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (8'hae);
  assign wire6 = wire5;
  assign wire7 = {$unsigned(wire5)};
  assign wire8 = $signed(wire0);
  module9 #() modinst88 (.y(wire87), .wire13(wire7), .wire10(wire3), .wire12(wire2), .clk(clk), .wire11(wire0));
  assign wire89 = ((wire8[(3'h4):(1'h0)] != wire0) ?
                      wire7 : (^({(8'ha1)} ?
                          wire5 : $unsigned((wire5 ? (8'ha1) : wire5)))));
endmodule

module module9
#(parameter param86 = {(~&((((8'h9f) ? (8'hb1) : (8'hb5)) ^~ (~(7'h41))) ? (~^{(8'hb6), (8'h9f)}) : (^((8'ha7) ? (7'h43) : (7'h41)))))})
(y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire82;
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire14,
                 wire15,
                 wire16,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire82,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = wire10;
  assign wire15 = wire12[(2'h2):(1'h0)];
  assign wire16 = (wire12 ?
                      $unsigned($signed($signed(((7'h42) != wire15)))) : wire13);
  always
    @(posedge clk) begin
      reg17 <= $unsigned((|$signed(wire16[(2'h2):(1'h1)])));
      reg18 <= ((($unsigned(wire15[(2'h2):(1'h0)]) ^~ (((8'ha6) ?
                  wire15 : wire12) ?
              (wire15 & wire11) : $unsigned(wire15))) <<< wire14[(5'h11):(4'h8)]) ?
          wire12[(3'h6):(1'h0)] : $unsigned(wire15[(2'h2):(1'h0)]));
    end
  assign wire19 = ($signed(reg18) <<< (~&(($signed(reg17) ?
                          $unsigned(wire11) : (^wire12)) ?
                      wire10 : ((~|wire15) > $signed(wire12)))));
  assign wire20 = $signed(reg18[(2'h2):(1'h1)]);
  assign wire21 = $unsigned(($unsigned(wire10[(1'h0):(1'h0)]) ?
                      ((wire10[(1'h1):(1'h0)] ?
                              $signed((7'h43)) : wire13[(2'h2):(2'h2)]) ?
                          $signed((+wire15)) : (wire10 ^~ $unsigned(reg18))) : {$signed($signed((8'hba)))}));
  assign wire22 = $signed((8'hba));
  assign wire23 = wire10;
  assign wire24 = (~|(reg18[(2'h2):(1'h1)] << ($unsigned(wire21) ?
                      (wire11 ?
                          (wire14 <= reg18) : wire12[(3'h5):(3'h4)]) : (wire20 ?
                          $signed(wire22) : (^~wire19)))));
  module25 #() modinst83 (wire82, clk, wire15, wire12, wire14, wire22, wire16);
  assign wire84 = ($unsigned((((wire13 & wire82) - $signed(wire22)) >> (^$signed(wire19)))) ?
                      $signed((&$signed(reg17[(2'h2):(2'h2)]))) : (-wire10));
  assign wire85 = $unsigned({$unsigned($signed($signed((8'ha2)))),
                      (!$unsigned(wire23))});
endmodule

module module25
#(parameter param81 = (8'ha9))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire30;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(4'he):(1'h0)] wire28;
  input wire signed [(5'h10):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire37;
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire80,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
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
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((+(~^((wire28 ^~ wire30) ?
          $unsigned(wire26) : (wire28 ? wire28 : wire27))))))
        begin
          if ((~$unsigned((|((wire29 <= wire28) ?
              wire26[(2'h2):(2'h2)] : wire27[(2'h2):(1'h1)])))))
            begin
              reg31 <= $unsigned((~(|$signed((wire27 ? wire28 : wire30)))));
              reg32 <= wire26;
            end
          else
            begin
              reg31 <= $unsigned($signed($signed((~|(|wire29)))));
              reg32 <= wire27[(4'h8):(4'h8)];
              reg33 <= wire28;
              reg34 <= (wire28[(4'hb):(3'h5)] ? $unsigned(reg33) : reg31);
              reg35 <= reg31[(1'h0):(1'h0)];
            end
          reg36 <= (|(8'ha6));
        end
      else
        begin
          reg31 <= $unsigned(reg36[(3'h6):(3'h4)]);
          reg32 <= reg32[(1'h0):(1'h0)];
          if ($unsigned($unsigned($unsigned($unsigned($unsigned(wire28))))))
            begin
              reg33 <= wire27[(3'h7):(3'h4)];
              reg34 <= reg35[(4'hc):(4'h9)];
              reg35 <= (8'ha6);
            end
          else
            begin
              reg33 <= wire28[(4'h9):(3'h6)];
              reg34 <= reg35;
            end
          reg36 <= (~(8'ha2));
        end
    end
  assign wire37 = $unsigned((!($unsigned(wire29[(2'h3):(1'h1)]) << $signed(((8'hbd) - reg33)))));
  assign wire38 = (+reg32[(1'h1):(1'h1)]);
  assign wire39 = (~^$signed(reg33[(4'h8):(3'h4)]));
  assign wire40 = reg31[(2'h2):(1'h0)];
  assign wire41 = {{wire26[(3'h7):(3'h6)]}};
  assign wire42 = wire29;
  assign wire43 = (wire38 == $signed($unsigned($unsigned($unsigned(wire40)))));
  assign wire44 = (({{$signed(wire38)}} ? wire27[(4'h8):(3'h5)] : reg33) ?
                      {{(((8'ha2) ? (8'hbe) : (7'h43)) ? (+reg31) : (-wire39)),
                              (&wire26[(3'h5):(3'h4)])}} : {$signed(wire41),
                          $signed(($signed(wire26) ?
                              wire41[(1'h0):(1'h0)] : $unsigned((8'had))))});
  assign wire45 = $unsigned(reg33[(2'h2):(1'h0)]);
  assign wire46 = wire39;
  assign wire47 = ((~(wire41[(2'h2):(2'h2)] * $unsigned((wire37 >> wire30)))) ?
                      $unsigned(((~|$signed(wire27)) ?
                          (&(wire30 ?
                              wire30 : wire42)) : $unsigned($unsigned(wire37)))) : $unsigned(wire28));
  assign wire48 = (~&($signed(wire29[(3'h7):(3'h5)]) ?
                      wire41 : {{wire43[(1'h1):(1'h0)],
                              ((8'h9c) ? wire44 : wire40)},
                          $signed((wire30 <<< reg33))}));
  assign wire49 = (~&(wire40 ?
                      wire29[(4'he):(4'ha)] : (^~(wire27 & reg35[(3'h5):(1'h0)]))));
  assign wire50 = (($signed(((~^wire37) <<< {wire48})) ?
                          wire45[(1'h0):(1'h0)] : wire28) ?
                      $unsigned($unsigned($unsigned({wire48}))) : (reg32 ?
                          ((-(wire43 ? wire46 : wire37)) ?
                              (~&$unsigned((8'h9e))) : $signed({wire44,
                                  wire44})) : $unsigned(wire42[(1'h0):(1'h0)])));
  assign wire51 = $signed($unsigned({{$unsigned((8'hb2))},
                      wire30[(3'h7):(3'h5)]}));
  assign wire52 = wire26[(4'h8):(3'h7)];
  assign wire53 = $unsigned($signed($unsigned({(wire26 ? wire38 : wire27),
                      $unsigned((8'haa))})));
  always
    @(posedge clk) begin
      if (((~|wire51[(2'h2):(2'h2)]) > (wire37[(4'he):(4'hd)] ?
          $signed((reg33 ^ (|wire30))) : (wire41[(4'hb):(4'hb)] >> (wire27 ?
              wire43[(1'h0):(1'h0)] : $unsigned(reg34))))))
        begin
          reg54 <= (^(((&$signed(wire52)) ?
                  ({reg35, wire42} ?
                      (8'hbf) : $signed(wire39)) : (wire50 * (reg31 ^~ reg34))) ?
              $signed(wire28) : wire49[(4'h9):(4'h8)]));
          reg55 <= ({$signed($signed((reg32 >= (8'ha4)))),
                  ({reg35[(3'h7):(3'h5)], $unsigned(wire41)} ?
                      $unsigned(wire27) : (8'ha8))} ?
              reg31 : $signed($signed($unsigned($signed(wire28)))));
        end
      else
        begin
          reg54 <= $unsigned(wire44);
          if ((+$unsigned(((reg33 ? reg34[(3'h6):(2'h3)] : $unsigned(reg32)) ?
              ((8'h9d) ?
                  reg33 : (wire51 ?
                      wire48 : (8'hb2))) : $signed(wire30[(3'h6):(1'h0)])))))
            begin
              reg55 <= ($signed((reg33 ?
                      (!(&wire43)) : $signed($unsigned(wire46)))) ?
                  (($unsigned(((7'h41) ~^ wire42)) ?
                      {$unsigned(wire50), reg35} : (wire41[(2'h3):(1'h0)] ?
                          $unsigned(wire45) : (wire42 <= wire51))) && (($unsigned(wire47) == reg31) <<< ((|wire27) & wire53))) : reg36[(4'ha):(3'h4)]);
              reg56 <= (^(^reg33[(3'h5):(2'h2)]));
              reg57 <= wire45;
              reg58 <= (8'ha8);
            end
          else
            begin
              reg55 <= (^~(+wire41[(3'h5):(1'h1)]));
            end
        end
      if (reg35)
        begin
          reg59 <= $signed(wire48);
          reg60 <= ($signed((wire37[(5'h11):(4'h9)] >= ((reg55 && reg55) ?
                  (reg36 | wire38) : (8'hb6)))) ?
              ((~|wire46) ?
                  (~((~^wire42) ?
                      $unsigned(wire44) : $unsigned((8'hb8)))) : $unsigned({(wire51 ?
                          wire48 : wire48),
                      $signed(wire48)})) : (8'haa));
          reg61 <= $unsigned(reg54);
          reg62 <= ({reg55} ?
              (8'haf) : ($unsigned(($signed(reg60) ?
                      wire41[(2'h2):(1'h1)] : (|wire30))) ?
                  (|((reg32 >= wire47) ?
                      $signed(wire39) : $unsigned(reg33))) : wire29[(4'h9):(2'h2)]));
          reg63 <= ($unsigned((wire47[(4'hb):(1'h1)] ?
              $signed(reg56) : ($unsigned(wire52) ?
                  (wire52 - reg54) : {wire29, reg35}))) << ((({wire49, wire29} ?
                  reg57 : (!wire38)) & wire51) ?
              {wire48[(1'h0):(1'h0)]} : reg32));
        end
      else
        begin
          reg59 <= ({reg31[(2'h2):(2'h2)],
              $unsigned($signed((wire52 ?
                  reg54 : reg57)))} << (~|$unsigned(reg56)));
          reg60 <= {$unsigned($unsigned(((reg54 ? reg31 : wire51) <= wire50))),
              (~(((-wire38) ? $unsigned((7'h44)) : (reg55 ? wire40 : reg31)) ?
                  wire37 : ((reg31 <<< (8'hb2)) + (8'haa))))};
          if (((((reg57 ? $unsigned(wire44) : $signed(reg36)) >> ((~wire43) ?
                      (wire53 ? (8'hbc) : wire38) : (wire39 ? reg35 : reg35))) ?
                  wire26[(4'h8):(1'h0)] : $unsigned(wire38)) ?
              $unsigned(($unsigned(wire27[(3'h5):(1'h0)]) || reg61[(2'h2):(1'h1)])) : (~&(($signed(wire29) ?
                  $signed((8'hb2)) : (wire40 || wire47)) * (wire37[(5'h12):(2'h3)] ?
                  (wire30 >= reg33) : $unsigned((7'h41)))))))
            begin
              reg61 <= (wire51[(4'hd):(3'h5)] & $unsigned({wire29}));
            end
          else
            begin
              reg61 <= $signed(((^wire50[(4'hb):(4'hb)]) ?
                  (^$signed($signed(reg36))) : {(~&wire37[(1'h1):(1'h1)]),
                      ((~&reg34) ? reg33[(2'h2):(2'h2)] : (^wire41))}));
              reg62 <= $signed($unsigned($unsigned(($signed(wire52) != $signed((8'hb7))))));
              reg63 <= (wire26 != $unsigned(wire52[(3'h4):(2'h3)]));
            end
          reg64 <= {(~&(reg62[(4'h9):(3'h5)] << (reg63 ^ (&reg56))))};
          reg65 <= $signed((&wire50));
        end
    end
  always
    @(posedge clk) begin
      if ($signed(wire27))
        begin
          reg66 <= ((^(wire38[(2'h3):(2'h2)] <= {(+wire46),
                  reg32[(1'h0):(1'h0)]})) ?
              (^~$unsigned(reg31[(1'h1):(1'h1)])) : $unsigned((|(~reg32[(2'h3):(1'h1)]))));
        end
      else
        begin
          reg66 <= $signed($signed((!(reg33[(2'h2):(2'h2)] && {wire47,
              reg64}))));
          if ((^~(^(8'hb4))))
            begin
              reg67 <= reg64;
              reg68 <= $signed($unsigned($signed(({reg54} ?
                  (reg33 > wire40) : $signed(wire26)))));
            end
          else
            begin
              reg67 <= reg57;
              reg68 <= wire27[(1'h0):(1'h0)];
              reg69 <= reg68;
              reg70 <= $unsigned($signed((8'haf)));
              reg71 <= {($signed((wire47[(2'h2):(1'h1)] * (wire41 >= reg70))) ~^ (~^wire47))};
            end
          reg72 <= $unsigned((+wire26));
          reg73 <= $unsigned((~(((^wire39) ?
                  $unsigned(reg55) : (wire43 ? reg69 : reg59)) ?
              (+(reg60 <<< wire50)) : $signed($signed(wire41)))));
          if ($signed($signed((wire29 ?
              $signed(reg56) : wire45[(1'h1):(1'h0)]))))
            begin
              reg74 <= $signed($unsigned($signed($unsigned(reg71))));
              reg75 <= $unsigned($signed(wire53[(2'h2):(2'h2)]));
              reg76 <= $signed(wire47[(4'h9):(4'h8)]);
              reg77 <= reg76[(3'h6):(3'h5)];
              reg78 <= ($signed($unsigned($unsigned($signed(reg76)))) ?
                  reg57[(3'h5):(2'h2)] : $unsigned(wire53[(4'he):(4'hb)]));
            end
          else
            begin
              reg74 <= (8'h9c);
              reg75 <= (wire53 ?
                  $signed(($unsigned((reg70 ^ (8'hb6))) ?
                      $signed(wire46[(1'h0):(1'h0)]) : ((wire47 ?
                          (8'hbf) : reg68) * $unsigned((8'hbb))))) : (!($unsigned((reg63 ~^ (8'hbb))) >>> (~^(wire47 <= reg56)))));
              reg76 <= ($unsigned((|(wire46 * $signed(wire38)))) ?
                  (wire40[(2'h3):(1'h0)] ~^ (~&$unsigned(reg67[(2'h3):(1'h0)]))) : $unsigned(reg62[(1'h0):(1'h0)]));
            end
        end
      reg79 <= (!reg58);
    end
  assign wire80 = $signed((~^$unsigned($unsigned($signed(wire47)))));
endmodule
