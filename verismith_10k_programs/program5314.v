module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned(((($unsigned(wire3) ?
                         $unsigned(wire1) : $unsigned(wire2)) >= (8'ha4)) ?
                     wire3[(3'h4):(1'h0)] : wire2[(5'h11):(4'ha)]));
  assign wire5 = wire4;
  assign wire6 = wire2;
  assign wire7 = wire4;
  module8 #() modinst112 (wire111, clk, wire7, wire2, wire6, wire0);
  assign wire113 = (|wire0[(2'h3):(1'h0)]);
  assign wire114 = $signed(wire3[(3'h4):(1'h1)]);
  assign wire115 = $unsigned(($signed(($unsigned(wire4) ?
                       $signed((8'ha9)) : wire5)) >= (({wire7} | (wire5 ?
                       wire1 : wire114)) >> wire113)));
endmodule

module module8
#(parameter param109 = {((-(((8'haf) ? (8'hba) : (8'hb6)) || ((8'hbe) ? (8'hb7) : (8'ha2)))) ? (({(7'h40), (8'ha1)} > (~&(8'hba))) ? (8'hab) : (((8'hb3) >> (8'hb2)) ^ (~^(8'ha9)))) : ((((7'h41) ? (8'haa) : (8'hb8)) ? (~^(7'h43)) : ((8'hab) ? (8'hb7) : (8'hbb))) ? (((8'ha2) ? (8'haa) : (8'hb2)) || ((7'h43) >> (8'ha7))) : ({(8'ha6)} ~^ ((8'hb2) ? (8'hbe) : (8'ha9)))))}, 
parameter param110 = {{{((param109 ? param109 : param109) ? (param109 - param109) : (-(8'hb0))), (((7'h40) * param109) || param109)}, (&(~(+param109)))}, param109})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h212):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire99;
  wire [(5'h13):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  assign y = {wire99,
                 wire97,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire15,
                 wire14,
                 wire13,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 (1'h0)};
  assign wire13 = {((^wire9) ?
                          {(wire11[(2'h3):(2'h3)] >> (wire10 ?
                                  wire9 : wire12))} : (~(((8'hbe) <= wire11) ?
                              wire10 : (wire10 ? (8'h9c) : (8'hb0)))))};
  assign wire14 = $signed($signed($unsigned(((wire13 ~^ wire12) && (^(8'hb0))))));
  assign wire15 = (($unsigned($signed($unsigned(wire13))) + ($unsigned((wire14 ?
                          wire14 : wire11)) ?
                      $unsigned(wire12[(1'h1):(1'h0)]) : {wire13[(4'ha):(1'h1)],
                          {wire10}})) <= (wire10[(4'hb):(3'h5)] ?
                      $signed(((wire13 + wire11) ~^ (wire12 ~^ wire10))) : wire14));
  always
    @(posedge clk) begin
      reg16 <= (~({{{wire13, wire13}, $signed(wire11)}} ?
          ($unsigned($unsigned(wire9)) ?
              ((^wire14) ~^ (~|wire12)) : (!(wire13 < (7'h41)))) : wire15));
      reg17 <= (wire11 ?
          ((~&((^~wire15) - $signed(wire14))) <<< wire10) : {wire12,
              wire12[(2'h2):(1'h1)]});
      if ({wire12[(3'h4):(2'h2)],
          (((8'h9c) | ((|wire12) <<< (!wire9))) < {({(8'hbe)} || (+wire12)),
              wire12[(3'h5):(1'h0)]})})
        begin
          reg18 <= wire10[(2'h2):(1'h1)];
          reg19 <= ($signed($unsigned((7'h41))) < (8'hb0));
          if (($signed($signed(((^~reg19) ?
              {wire14, reg18} : $unsigned((8'ha8))))) == wire9))
            begin
              reg20 <= $signed(wire9);
              reg21 <= (((~^wire9) != reg17) ^ (!(((~&(8'h9f)) >> $signed(wire9)) - $unsigned($signed(wire13)))));
              reg22 <= $unsigned($unsigned(wire10[(1'h1):(1'h1)]));
              reg23 <= (8'hb2);
              reg24 <= (^~{((wire15[(3'h5):(2'h2)] ?
                      reg18 : $unsigned(reg21)) ^~ ((reg23 ?
                      wire9 : wire14) != $signed(wire9)))});
            end
          else
            begin
              reg20 <= wire9;
            end
          reg25 <= (reg18[(4'hd):(3'h6)] | ($unsigned((reg18 >= $unsigned(wire11))) << ($unsigned((reg21 ?
                  reg19 : reg17)) ?
              ({wire11, wire15} ? wire13 : reg19) : reg18[(2'h2):(1'h0)])));
        end
      else
        begin
          if ($signed($unsigned((wire12 << ((wire10 ? reg23 : (8'hbc)) ?
              $signed(reg17) : $signed(wire10))))))
            begin
              reg18 <= (~|$signed(reg24[(4'ha):(3'h6)]));
              reg19 <= (!{(((reg22 <<< reg21) || $signed(wire12)) < $signed({reg22,
                      (8'hb7)}))});
            end
          else
            begin
              reg18 <= (($unsigned($unsigned($unsigned((7'h41)))) <= $unsigned(wire10[(4'ha):(1'h1)])) >>> $signed((((wire13 ?
                      (8'hb4) : (8'h9c)) ?
                  reg19 : reg22) ^~ (reg23[(1'h1):(1'h1)] ?
                  $unsigned(wire14) : wire14))));
            end
          if ({(~{((!wire10) ? {reg23, wire11} : (wire15 != wire15)),
                  {$signed(reg17)}}),
              wire10})
            begin
              reg20 <= reg21[(1'h1):(1'h0)];
              reg21 <= ((~|(~|wire9[(3'h6):(2'h3)])) ?
                  ($signed(((~wire10) ? reg18 : reg18)) ?
                      reg22[(2'h3):(2'h2)] : ((reg20[(4'ha):(4'h9)] >> $unsigned(wire9)) ?
                          wire15 : wire15)) : ($signed((^~{reg21})) == wire15[(4'hd):(2'h3)]));
            end
          else
            begin
              reg20 <= (wire10[(4'he):(4'h9)] > $signed(reg22[(1'h1):(1'h1)]));
              reg21 <= reg17[(3'h5):(3'h5)];
              reg22 <= $signed(((^~$signed((wire9 ?
                  (8'h9d) : wire9))) << (^($unsigned(wire15) ?
                  $unsigned(reg21) : $signed(wire12)))));
              reg23 <= reg21[(2'h3):(2'h2)];
              reg24 <= {reg16[(4'hc):(1'h0)]};
            end
          reg25 <= reg18;
          reg26 <= reg22[(1'h0):(1'h0)];
          reg27 <= ($signed($unsigned((+$unsigned(reg18)))) ?
              ($signed(((reg22 && wire12) >>> {wire10, wire13})) ?
                  $unsigned(wire13[(2'h3):(2'h2)]) : ((&wire13) ?
                      reg19 : $unsigned(reg24))) : $unsigned(reg22));
        end
    end
  always
    @(posedge clk) begin
      if (($signed((reg23 ^ {reg25,
          wire13[(2'h2):(1'h1)]})) >>> $unsigned(((~^reg22) ~^ wire10[(2'h3):(1'h0)]))))
        begin
          if (wire9)
            begin
              reg28 <= reg18;
              reg29 <= $signed(reg23);
              reg30 <= $signed((~reg17[(4'ha):(1'h0)]));
              reg31 <= $signed({$signed((|(wire9 && reg30))), reg17});
            end
          else
            begin
              reg28 <= ((({(wire14 >= (8'hbf)), ((8'hbf) ~^ reg28)} ?
                      $unsigned($unsigned(reg29)) : $unsigned((~^(8'hb9)))) ?
                  {reg19, wire11} : (wire9 ^~ $unsigned({(8'hb8)}))) << reg27);
              reg29 <= $unsigned((({(reg25 & (8'ha1)), $signed((8'ha9))} ?
                      reg30[(3'h6):(3'h6)] : reg26) ?
                  $signed(wire11[(1'h0):(1'h0)]) : (~&($unsigned(reg27) ?
                      $signed(reg20) : (reg30 || reg25)))));
              reg30 <= reg16[(3'h6):(3'h6)];
              reg31 <= reg22;
            end
          reg32 <= $unsigned((-reg17[(4'ha):(1'h1)]));
        end
      else
        begin
          reg28 <= (|$signed($unsigned(($unsigned(reg31) <<< (!wire14)))));
          reg29 <= reg32;
          reg30 <= ((^~((+$signed(reg27)) * {(|(8'ha5))})) - reg26[(2'h3):(1'h1)]);
          reg31 <= reg26[(1'h0):(1'h0)];
        end
      reg33 <= $signed((wire9 <= (reg22 ^~ (^$signed(wire15)))));
    end
  assign wire34 = {{$unsigned((~^$signed((8'ha4)))),
                          $unsigned(((reg24 >>> reg24) - (~reg31)))},
                      $signed($unsigned(({reg33} ?
                          $signed(reg25) : (reg31 ? wire9 : reg27))))};
  assign wire35 = (7'h40);
  assign wire36 = $signed(wire15[(4'ha):(4'ha)]);
  always
    @(posedge clk) begin
      reg37 <= (~|{(wire10 + $unsigned(wire9[(1'h0):(1'h0)]))});
      reg38 <= (reg37[(3'h6):(3'h5)] ?
          reg27[(2'h3):(1'h0)] : {((~&((7'h44) ? (8'hac) : reg16)) ?
                  wire13 : wire10[(3'h4):(1'h1)])});
      reg39 <= $signed(reg33);
      reg40 <= wire12;
    end
  assign wire41 = (|$unsigned(reg33[(2'h3):(1'h1)]));
  assign wire42 = wire13[(1'h0):(1'h0)];
  assign wire43 = (^(|(wire9 ? wire12[(3'h4):(2'h3)] : (~^$unsigned(reg24)))));
  assign wire44 = wire34;
  assign wire45 = (~|wire42[(4'hf):(4'ha)]);
  module46 #() modinst98 (.wire47(reg23), .wire49(wire15), .wire48(reg32), .wire50(reg27), .y(wire97), .clk(clk), .wire51(wire35));
  assign wire99 = (8'ha9);
  always
    @(posedge clk) begin
      reg100 <= {(wire9[(4'hd):(4'h8)] ?
              (~|$unsigned(reg22)) : {reg39[(4'hd):(3'h4)],
                  wire12[(1'h0):(1'h0)]})};
      reg101 <= reg30[(2'h2):(2'h2)];
      reg102 <= ((!$unsigned({$unsigned(reg101),
          {wire10}})) >> (^(wire43[(2'h2):(2'h2)] ?
          reg33[(4'h8):(2'h2)] : reg20)));
      reg103 <= (~|$unsigned((~|$unsigned($signed(wire10)))));
      if ((((^~reg31[(4'hb):(3'h6)]) || wire9[(3'h5):(1'h0)]) ?
          wire41[(1'h0):(1'h0)] : $unsigned((reg18 ?
              wire43 : reg38[(3'h4):(1'h1)]))))
        begin
          reg104 <= ($signed((8'hbe)) ~^ reg16);
          reg105 <= wire15;
          reg106 <= ((reg33 ?
              reg32[(3'h5):(1'h1)] : (|reg32)) == $signed(((&((8'h9e) ?
              (8'haf) : reg38)) ~^ wire42)));
          reg107 <= $signed(reg28[(2'h2):(1'h0)]);
          reg108 <= $signed(($signed(reg102[(2'h3):(2'h3)]) ~^ wire97));
        end
      else
        begin
          reg104 <= (reg108 ?
              (|wire43[(3'h4):(2'h3)]) : ($unsigned(reg37[(4'h9):(3'h5)]) || ($unsigned((reg19 ^~ reg25)) <<< (^wire35[(4'ha):(4'h9)]))));
        end
    end
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire51;
  input wire signed [(2'h3):(1'h0)] wire50;
  input wire signed [(5'h10):(1'h0)] wire49;
  input wire [(3'h4):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  wire signed [(5'h14):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire52;
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire58,
                 wire52,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire52 = (^~(^~$signed((((8'hb6) ? wire50 : wire51) ^~ wire50))));
  always
    @(posedge clk) begin
      reg53 <= $signed((^(wire49 ?
          wire50 : $unsigned(wire51[(5'h13):(3'h7)]))));
      reg54 <= wire48[(2'h3):(2'h2)];
      reg55 <= ($unsigned(wire47) ?
          $signed((~&reg53)) : $signed({$signed(wire48)}));
      reg56 <= $unsigned($unsigned($signed($unsigned(reg54[(4'hf):(4'he)]))));
      reg57 <= (~^(((~|$unsigned(wire48)) & (|wire48)) == ({(wire48 ?
              reg54 : (8'h9f)),
          (wire50 ?
              wire47 : wire52)} == (((8'ha1) >>> (8'ha2)) ~^ (~|(7'h44))))));
    end
  assign wire58 = wire51;
  always
    @(posedge clk) begin
      reg59 <= $signed($unsigned(($unsigned(reg56[(2'h3):(1'h1)]) ?
          $unsigned($unsigned(wire52)) : (wire52[(3'h7):(3'h6)] >> wire50[(1'h0):(1'h0)]))));
      if ((~^($unsigned(wire47) ?
          $signed({$signed(reg57)}) : (($signed(wire47) ?
              $signed(wire48) : (|reg56)) ^ reg59[(4'h9):(3'h4)]))))
        begin
          if ((wire47[(4'h8):(3'h4)] >> (8'ha2)))
            begin
              reg60 <= wire49;
              reg61 <= ((($signed(reg60[(4'h8):(3'h7)]) <= $unsigned((reg54 ?
                  wire48 : (8'hac)))) && $signed($unsigned((wire49 | reg60)))) == (wire51 >= (reg54[(4'h9):(3'h6)] <= $unsigned(wire50[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg60 <= (+(wire51 ?
                  ($signed(reg54[(5'h11):(5'h11)]) >> $signed(wire50)) : $signed($unsigned($unsigned(wire51)))));
              reg61 <= wire50;
            end
          reg62 <= $unsigned((reg54 | $unsigned(($unsigned((8'hb3)) || (~|(8'hb3))))));
          reg63 <= $signed($signed((reg53 != ({(8'ha6), wire51} < (~wire47)))));
          if ((~|reg53))
            begin
              reg64 <= reg61;
              reg65 <= $signed((8'hb7));
              reg66 <= wire49[(2'h2):(1'h1)];
              reg67 <= $unsigned($unsigned(wire52));
              reg68 <= reg62;
            end
          else
            begin
              reg64 <= wire58[(4'ha):(4'h9)];
              reg65 <= (((((wire51 & wire49) ?
                      wire47[(3'h4):(1'h0)] : $unsigned(wire52)) ?
                  reg68 : wire50[(1'h0):(1'h0)]) != reg68) < ((~|reg66[(3'h5):(3'h4)]) - reg59[(2'h2):(1'h1)]));
              reg66 <= wire48;
              reg67 <= (~^($unsigned(wire47) == reg55[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg60 <= reg68[(4'h8):(2'h3)];
          if (reg60[(4'hc):(2'h2)])
            begin
              reg61 <= (+$unsigned(reg63[(3'h4):(2'h3)]));
              reg62 <= ({reg68} ?
                  ($unsigned($signed($signed(reg60))) ?
                      $unsigned((~$signed(wire50))) : wire58[(3'h5):(3'h4)]) : ($unsigned(wire58[(4'h9):(4'h9)]) || $unsigned(((~(7'h43)) > wire50))));
              reg63 <= reg55[(2'h2):(1'h0)];
              reg64 <= ((reg61 ?
                      {(reg60[(2'h3):(2'h2)] ?
                              wire47[(3'h4):(2'h2)] : (~^reg55))} : reg64) ?
                  reg62[(1'h0):(1'h0)] : (&(8'ha3)));
              reg65 <= $unsigned(reg62);
            end
          else
            begin
              reg61 <= $unsigned(reg55[(1'h1):(1'h0)]);
              reg62 <= wire49[(4'he):(4'h8)];
              reg63 <= reg54;
              reg64 <= reg62[(3'h4):(2'h2)];
            end
          if ($signed((8'hbe)))
            begin
              reg66 <= ($signed((reg62 << $unsigned($unsigned(reg61)))) < ({(reg53 ?
                          {(8'ha7)} : wire52[(1'h1):(1'h0)]),
                      $unsigned(reg54[(4'hd):(4'h8)])} ?
                  ({(reg56 != reg59), reg68[(4'h9):(4'h8)]} ?
                      reg53 : {(reg56 | (8'ha5))}) : {(-(8'ha6)),
                      ($unsigned(reg64) ? $unsigned(wire52) : (~&(8'hae)))}));
            end
          else
            begin
              reg66 <= (!reg53[(4'ha):(1'h1)]);
              reg67 <= ($unsigned({(reg54 ?
                          $unsigned(reg64) : $signed((8'hb9))),
                      reg66}) ?
                  reg64 : $signed(reg60[(5'h12):(5'h11)]));
            end
          reg68 <= (-($unsigned({$unsigned(wire58)}) ?
              wire50 : (-(|(reg54 && (7'h43))))));
        end
    end
  always
    @(posedge clk) begin
      reg69 <= {(~wire49[(3'h5):(3'h4)])};
      reg70 <= $unsigned((reg65[(5'h14):(3'h5)] ?
          (reg67 ?
              ($unsigned(wire51) ? (8'ha2) : wire51) : ((wire51 ?
                  reg53 : (8'hb5)) < (wire48 < reg65))) : ((wire48[(2'h2):(1'h0)] ~^ reg68) ?
              reg65[(4'h8):(1'h0)] : $signed($signed(reg59)))));
    end
  assign wire71 = (reg66[(1'h0):(1'h0)] | {wire49[(1'h1):(1'h0)]});
  assign wire72 = reg63[(3'h4):(1'h1)];
  assign wire73 = reg61[(3'h4):(2'h3)];
  assign wire74 = ({$signed({wire48[(3'h4):(1'h1)]}),
                      $signed(wire52)} ~^ $unsigned(($unsigned((|reg55)) ?
                      ((reg62 > reg59) ?
                          (reg67 ?
                              wire71 : reg66) : $unsigned(wire50)) : (^~reg54))));
  assign wire75 = ((wire50[(1'h1):(1'h1)] ?
                          (~^$signed(wire58[(4'h8):(3'h4)])) : (&reg59)) ?
                      (wire74 | ($signed((~reg55)) - wire71)) : wire51[(5'h14):(4'hb)]);
  always
    @(posedge clk) begin
      reg76 <= reg65;
      reg77 <= ((reg59 <<< (|$signed($unsigned(reg59)))) ?
          $unsigned($signed($signed((wire48 <= reg60)))) : (8'hb0));
      if ($signed(((~&reg63) << $signed(($unsigned(wire73) >>> (reg62 < reg53))))))
        begin
          reg78 <= reg62[(2'h3):(1'h1)];
          reg79 <= wire72;
          reg80 <= reg79;
          reg81 <= reg70[(1'h0):(1'h0)];
          reg82 <= (((!(8'hbb)) ?
              $signed(($unsigned(reg64) >>> $unsigned(reg81))) : {{reg59[(3'h6):(1'h0)],
                      reg66},
                  reg66[(3'h4):(1'h0)]}) & (^reg67[(2'h2):(1'h1)]));
        end
      else
        begin
          reg78 <= $signed($unsigned(($unsigned(reg61) ?
              (reg61[(4'hf):(3'h7)] ?
                  (wire75 ?
                      reg55 : reg54) : $signed(reg82)) : ((&wire51) ^~ $unsigned(wire49)))));
          if ($signed((($unsigned(wire75) ? {(!(7'h44)), wire73} : reg57) ?
              ({{reg59, wire74}, wire58} ?
                  reg77[(3'h6):(3'h6)] : (wire52[(2'h2):(1'h0)] != (reg76 * wire75))) : {(~^(reg54 ^ reg78)),
                  {((8'hb7) ? reg82 : reg55), ((8'hbc) ? (8'hb2) : reg56)}})))
            begin
              reg79 <= (((-$unsigned(((8'ha9) ? wire58 : (7'h42)))) ?
                      (!reg76[(3'h4):(1'h0)]) : $signed(reg76)) ?
                  ((reg67 ?
                      wire73 : reg66) ^~ $unsigned($unsigned($unsigned((8'ha4))))) : reg78);
              reg80 <= wire50[(2'h2):(2'h2)];
            end
          else
            begin
              reg79 <= ($signed($signed(wire49)) ?
                  wire75[(2'h2):(2'h2)] : $signed(reg59));
              reg80 <= $signed($unsigned({(~&wire48),
                  ($signed(reg76) - $unsigned((8'hb2)))}));
            end
          reg81 <= $unsigned((wire49[(5'h10):(1'h1)] | $signed($unsigned(wire74))));
          reg82 <= wire73[(4'hc):(3'h7)];
          reg83 <= $unsigned(wire50[(1'h0):(1'h0)]);
        end
      reg84 <= $unsigned(wire47[(3'h7):(2'h3)]);
    end
  assign wire85 = {((&$signed((reg81 >> reg76))) ~^ reg64), (-(8'ha3))};
  assign wire86 = $unsigned(($unsigned((~^(wire85 ?
                      wire47 : reg69))) == $unsigned(reg56[(4'hb):(3'h5)])));
  assign wire87 = $unsigned($unsigned($unsigned($signed((wire86 <= reg53)))));
  assign wire88 = (~$unsigned($unsigned($signed($unsigned(reg82)))));
  assign wire89 = reg65[(4'hc):(3'h5)];
  assign wire90 = (wire86[(4'hc):(3'h6)] || $signed(reg82[(4'hd):(1'h1)]));
  assign wire91 = $unsigned({(^((wire87 ? reg78 : (8'ha9)) ?
                          (reg64 != reg81) : $unsigned(reg65))),
                      reg56[(3'h6):(1'h1)]});
  assign wire92 = reg53[(2'h2):(1'h0)];
  assign wire93 = $signed(($signed(((wire48 >>> reg83) ?
                      {reg64, reg83} : reg59)) & wire48[(2'h3):(1'h1)]));
  assign wire94 = ((7'h42) == $signed((($unsigned(reg56) ?
                      (reg68 >> (8'hb5)) : (^wire93)) - $signed((&(8'had))))));
  assign wire95 = reg65[(5'h12):(5'h11)];
  assign wire96 = (^(reg79[(4'he):(4'ha)] ? (~wire93) : $signed(reg83)));
endmodule
