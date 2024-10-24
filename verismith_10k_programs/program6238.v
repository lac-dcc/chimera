module top
#(parameter param80 = ({(8'ha3)} == (({((8'hb7) ? (8'h9f) : (8'hb7))} ? (7'h43) : ((~&(8'ha0)) <<< ((8'hac) * (8'h9f)))) | (^(~^{(8'hbc), (8'had)})))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire76;
  wire [(4'hc):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(3'h7):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire44;
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire47,
                 wire46,
                 wire5,
                 wire44,
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
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire5 = ((~(~|$signed({wire1}))) ?
                     wire0[(2'h2):(1'h0)] : wire1[(1'h1):(1'h1)]);
  module6 #() modinst45 (.clk(clk), .wire10(wire3), .wire11(wire0), .y(wire44), .wire8(wire1), .wire7(wire4), .wire9(wire5));
  assign wire46 = (~|(^~(8'h9d)));
  assign wire47 = $unsigned((wire44[(4'hf):(4'hf)] ?
                      $unsigned(($signed(wire5) ?
                          wire46 : (wire5 - wire46))) : ($unsigned((wire5 ?
                          wire5 : wire2)) - (-(8'hb9)))));
  always
    @(posedge clk) begin
      if ($signed(((+(wire1[(1'h1):(1'h0)] ?
              (wire0 * wire5) : $unsigned(wire3))) ?
          wire5[(1'h0):(1'h0)] : wire44)))
        begin
          if (($signed({{wire3}, wire5}) > ((wire3 + wire0[(1'h0):(1'h0)]) ?
              $unsigned(wire2) : wire4)))
            begin
              reg48 <= wire46[(2'h2):(1'h0)];
              reg49 <= wire47;
              reg50 <= ((({(wire0 <<< reg49), wire44} ?
                      (wire5 && (wire46 <<< wire46)) : reg48) ^ ((!$unsigned(wire44)) ?
                      {(&wire0), $unsigned(wire4)} : {reg48})) ?
                  $unsigned($signed({$unsigned(wire47),
                      wire1})) : $unsigned(wire46));
              reg51 <= (($unsigned({wire0}) ?
                  wire46 : (-$unsigned((reg48 & reg48)))) | (~$unsigned(wire47)));
              reg52 <= wire1[(2'h2):(1'h0)];
            end
          else
            begin
              reg48 <= wire4;
              reg49 <= ((+$unsigned(({wire46} & wire47))) ?
                  ({$signed(reg50),
                      wire2[(3'h4):(3'h4)]} && $signed(((~(8'hb8)) & (reg48 ?
                      (8'hb1) : reg50)))) : ($signed(wire1[(3'h6):(3'h6)]) ?
                      $signed(wire2[(2'h2):(1'h1)]) : ($unsigned((&wire46)) ?
                          $signed((wire0 ^~ wire47)) : reg51)));
              reg50 <= $signed($signed(wire1[(4'hb):(4'ha)]));
            end
        end
      else
        begin
          reg48 <= ((((wire3 >>> ((7'h41) ?
                      wire44 : wire5)) <<< $signed((wire3 <= reg49))) ?
                  ($unsigned($signed(reg49)) ?
                      (reg51[(1'h0):(1'h0)] ?
                          (^~reg52) : (wire3 - reg48)) : $signed(wire47)) : wire44) ?
              $signed(({(wire47 <= wire1),
                  (reg48 ?
                      wire47 : (8'hb8))} ^~ (&$signed((8'h9e))))) : $unsigned(((^reg52) ?
                  ($signed(reg51) ?
                      (!wire1) : $unsigned(reg50)) : reg51[(2'h3):(2'h3)])));
          reg49 <= {$unsigned(wire46[(2'h2):(2'h2)]),
              (wire2[(3'h4):(2'h3)] < $unsigned($unsigned($unsigned(reg49))))};
        end
      if (wire2)
        begin
          reg53 <= reg50;
          reg54 <= ((((~^$unsigned(wire44)) + reg51[(2'h2):(1'h0)]) ?
                  ((~(^~wire3)) + {(!wire3)}) : (($signed(reg50) ^~ $signed(reg49)) ?
                      ((8'ha8) ?
                          (reg48 ^ reg53) : $signed(wire47)) : wire46[(1'h1):(1'h1)])) ?
              reg53[(1'h1):(1'h0)] : ($unsigned({$unsigned(wire4)}) ?
                  (~wire5) : $unsigned($signed($unsigned(reg50)))));
          reg55 <= wire3[(4'he):(4'ha)];
          reg56 <= (reg52 || $signed((wire3 * ((wire46 ? wire5 : (8'hb7)) ?
              wire4 : $signed(reg52)))));
        end
      else
        begin
          reg53 <= ((|$unsigned(((&wire3) && {reg55}))) >>> (~^wire4[(5'h10):(4'hb)]));
          if ($unsigned($signed((reg49[(1'h1):(1'h1)] <<< $unsigned(((8'hba) ^ reg49))))))
            begin
              reg54 <= $signed(reg50);
              reg55 <= ((reg53 << reg54[(1'h0):(1'h0)]) ?
                  {$unsigned((&$signed((8'ha3))))} : reg51[(2'h2):(2'h2)]);
              reg56 <= wire5;
              reg57 <= reg53[(3'h4):(1'h1)];
            end
          else
            begin
              reg54 <= ((+(((~|reg54) ?
                  reg57[(2'h3):(1'h1)] : {reg55, reg49}) != wire1)) >> {wire44,
                  $unsigned($unsigned((reg56 - (8'ha6))))});
              reg55 <= {$signed((wire2 ?
                      reg53 : $signed((wire4 ? wire5 : wire1))))};
            end
          reg58 <= $signed($signed($unsigned(((reg57 ? reg57 : wire46) ?
              (wire1 >>> wire44) : $signed(reg48)))));
          if ($unsigned(wire4[(3'h6):(2'h3)]))
            begin
              reg59 <= (^$signed(wire1));
              reg60 <= (reg58[(2'h3):(1'h1)] ?
                  (reg48 & ($unsigned((~|wire3)) >>> reg55)) : {$signed(reg51[(1'h0):(1'h0)])});
              reg61 <= (wire46[(1'h1):(1'h1)] ?
                  $unsigned($signed($signed((|(8'h9c))))) : reg59[(1'h1):(1'h0)]);
              reg62 <= ((((^~wire46[(2'h3):(1'h1)]) ?
                  $signed(reg48) : (^~reg51)) || wire46[(2'h3):(2'h3)]) == (($unsigned($signed(reg53)) ?
                      ((~(8'hb4)) && reg61[(4'h9):(2'h3)]) : (~&{reg53,
                          reg61})) ?
                  wire5[(2'h2):(2'h2)] : $signed((reg56[(2'h3):(2'h2)] && ((8'ha9) ^ reg49)))));
            end
          else
            begin
              reg59 <= $unsigned((8'hb0));
              reg60 <= wire44;
              reg61 <= reg57;
              reg62 <= reg57[(2'h3):(2'h3)];
            end
        end
      reg63 <= ((wire0[(1'h0):(1'h0)] != (8'h9f)) ?
          wire1 : $signed((((~(8'hb5)) ?
                  (reg56 ? (8'haa) : reg62) : (wire47 ? wire1 : reg56)) ?
              $unsigned((!reg57)) : $unsigned((^~reg58)))));
      if (($unsigned($signed(($unsigned(reg55) - (wire4 > wire2)))) && $signed($unsigned((reg57[(4'h9):(3'h4)] == $signed((8'hbd)))))))
        begin
          reg64 <= wire46;
          if ((~|((^$signed((wire1 + reg50))) >= $signed((~|(reg49 < reg61))))))
            begin
              reg65 <= reg63[(4'hb):(3'h4)];
              reg66 <= $signed(((~({reg65} ? (8'ha7) : (^~reg52))) ?
                  reg51[(2'h2):(1'h0)] : (reg49 && (|$signed(wire2)))));
              reg67 <= (((7'h41) ?
                      reg57[(2'h3):(2'h2)] : ((|((8'h9c) >= reg52)) & (~&{(7'h44),
                          wire2}))) ?
                  (!$signed({$signed(reg48)})) : $signed(wire0));
              reg68 <= (!(|(8'hb1)));
              reg69 <= ($unsigned((~&(reg68[(2'h2):(2'h2)] ?
                      reg66 : (~reg52)))) ?
                  reg64[(4'hb):(3'h4)] : reg51);
            end
          else
            begin
              reg65 <= (8'hbe);
              reg66 <= (|$signed((!reg49[(1'h0):(1'h0)])));
              reg67 <= reg64[(1'h1):(1'h1)];
              reg68 <= wire3;
            end
        end
      else
        begin
          reg64 <= $signed(reg59[(2'h2):(2'h2)]);
          reg65 <= {(reg67[(5'h10):(4'he)] | (wire44[(4'h8):(1'h1)] ?
                  $unsigned((wire1 ^~ wire46)) : ((~^(8'hb2)) ?
                      (reg59 <= wire47) : $signed(reg53))))};
          reg66 <= ((wire4[(4'hf):(4'ha)] ~^ ($unsigned((wire1 || reg68)) == (!(^~reg54)))) ?
              wire46[(1'h0):(1'h0)] : reg58[(3'h5):(2'h2)]);
        end
      reg70 <= (~|{{reg67[(4'h8):(3'h7)]}});
    end
  assign wire71 = $unsigned({$unsigned($signed(wire4[(5'h12):(3'h5)])),
                      (|((reg53 < reg48) ?
                          $unsigned(reg65) : (reg58 < reg62)))});
  assign wire72 = ($unsigned(reg57[(4'ha):(3'h4)]) ?
                      (~(8'hb7)) : $unsigned((|($unsigned(reg62) ?
                          wire47 : $signed(wire47)))));
  assign wire73 = wire44;
  assign wire74 = wire44[(4'hf):(1'h1)];
  assign wire75 = reg65[(1'h0):(1'h0)];
  assign wire76 = $unsigned(reg52);
  assign wire77 = ($signed($unsigned(wire47)) * {$signed($signed(wire73))});
  assign wire78 = $unsigned(reg64);
  assign wire79 = $signed(($signed((8'hb2)) ? wire5 : wire78[(4'h8):(3'h7)]));
endmodule

module module6
#(parameter param43 = (7'h42))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire32;
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 (1'h0)};
  module12 #() modinst33 (wire32, clk, wire10, wire9, wire11, wire7, wire8);
  assign wire34 = $unsigned((~|($unsigned((+wire9)) + ($signed(wire11) ?
                      wire10 : {wire10, wire8}))));
  assign wire35 = (+wire9);
  assign wire36 = wire35;
  assign wire37 = $signed((($unsigned(wire9[(1'h1):(1'h1)]) ?
                          ((8'ha8) && {wire7}) : {$unsigned(wire32)}) ?
                      (8'ha8) : wire35));
  assign wire38 = $unsigned(wire32);
  assign wire39 = ({($signed({wire36}) ?
                          ($signed(wire10) == $signed(wire38)) : $signed($signed(wire10)))} != $signed((wire37[(5'h10):(4'h8)] ?
                      $signed((^wire11)) : wire34)));
  assign wire40 = wire8;
  assign wire41 = $signed((wire11[(4'h8):(3'h7)] >> (|$unsigned($unsigned(wire36)))));
  assign wire42 = (wire38[(3'h4):(1'h1)] == ((~$signed({wire11})) ?
                      ((&(wire32 > (7'h44))) ?
                          ((wire34 ? wire32 : wire7) ?
                              $unsigned(wire8) : (~&wire34)) : (((8'hab) || wire38) ?
                              $unsigned(wire7) : (wire34 ^~ wire41))) : $signed((wire10[(4'h9):(1'h1)] ?
                          (wire11 ? wire38 : (8'ha0)) : (wire9 >= wire37)))));
endmodule

module module12
#(parameter param31 = (-{({(&(8'ha0))} ? (|((8'haf) <= (8'hb6))) : (((8'h9e) ? (8'had) : (7'h43)) + {(8'ha1), (8'haa)})), (-(((8'hbb) ? (8'haa) : (8'h9d)) >= (8'h9e)))}))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h13):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= (wire15[(4'h8):(4'h8)] ?
          (!($signed((~&wire15)) != {wire15, wire17})) : {$unsigned((8'ha5))});
      if ($signed($unsigned($signed((wire16 ? {reg18, wire14} : wire16)))))
        begin
          if (((reg18[(4'hb):(3'h6)] + $signed($unsigned((wire14 <<< wire14)))) ?
              ($unsigned($unsigned((wire13 ? wire13 : reg18))) ?
                  $signed((^wire14[(4'h8):(1'h1)])) : $signed((((8'ha4) ?
                          wire15 : (8'ha2)) ?
                      (8'ha7) : wire13))) : ($unsigned(($signed(reg18) && wire15)) < wire17)))
            begin
              reg19 <= wire15;
            end
          else
            begin
              reg19 <= (8'had);
            end
          reg20 <= $signed(wire17);
          reg21 <= reg20[(2'h2):(2'h2)];
          reg22 <= (wire17 ?
              ($unsigned(reg19) ?
                  $signed((8'ha1)) : (^~($signed(reg18) ?
                      (wire17 ^~ reg21) : {wire15}))) : wire17);
        end
      else
        begin
          reg19 <= $signed({$unsigned($unsigned($signed(reg19)))});
          reg20 <= ($signed((reg21[(4'ha):(4'h8)] ?
              ({wire14, wire14} ?
                  (wire16 > wire13) : $signed(reg20)) : wire14)) ^~ ($unsigned($signed(wire17)) >>> ((wire17 * wire15[(2'h3):(2'h2)]) ?
              {wire15[(3'h4):(2'h3)]} : $unsigned(wire15))));
          reg21 <= (8'hb4);
        end
      reg23 <= $signed($signed(({(7'h44)} ?
          (-(wire14 | wire16)) : ((wire16 ?
              wire16 : reg21) ~^ wire17[(4'h8):(3'h7)]))));
      reg24 <= {{(+(reg22[(5'h11):(3'h7)] ? reg18 : reg23)),
              {$signed((~&wire16)), ({(8'hb5)} + {wire15, wire14})}},
          reg20[(2'h3):(2'h2)]};
    end
  assign wire25 = ((-(({reg21, wire16} ? $signed((8'ha4)) : reg21) ?
                      wire13 : (|((7'h41) ?
                          reg20 : reg24)))) * {({$signed((8'hac))} || $unsigned((^reg19)))});
  assign wire26 = reg19[(1'h1):(1'h1)];
  assign wire27 = {reg19[(4'h9):(3'h7)], $signed(reg24)};
  assign wire28 = (!$signed(($unsigned(wire26) + (+(reg23 & reg18)))));
  assign wire29 = {$signed({$unsigned((reg19 ? wire28 : reg18)),
                          $unsigned($unsigned(wire17))}),
                      (!((~&$unsigned((8'hb4))) ? wire28 : wire28))};
  assign wire30 = ((8'hac) ?
                      (wire15 ?
                          $unsigned((~^{wire15,
                              wire16})) : {$unsigned((wire27 || wire27))}) : reg24);
endmodule
