module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire87;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire39;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire85;
  assign y = {wire87, wire37, wire5, wire4, wire39, wire40, wire85, (1'h0)};
  assign wire4 = ($signed($unsigned(wire1)) ?
                     {$signed((wire0[(1'h0):(1'h0)] ?
                             (wire0 ?
                                 wire1 : wire2) : (~wire3)))} : $signed({wire3[(2'h3):(2'h3)],
                         (-(8'ha8))}));
  assign wire5 = $signed(wire2[(3'h4):(1'h0)]);
  module6 #() modinst38 (wire37, clk, wire1, wire2, wire5, wire0, wire4);
  assign wire39 = (-wire2[(2'h2):(1'h0)]);
  assign wire40 = (+(wire39[(4'hb):(1'h0)] || wire5[(4'hf):(3'h4)]));
  module41 #() modinst86 (wire85, clk, wire0, wire39, wire5, wire2, wire40);
  assign wire87 = $signed(wire85);
endmodule

module module41
#(parameter param84 = (((8'hba) << (((^(8'ha8)) * ((8'hb4) ? (8'ha5) : (8'hb6))) == (((8'hbe) ? (8'ha7) : (8'ha8)) ? ((8'ha4) ^~ (8'hac)) : (|(8'hb4))))) != ((~(^~((8'hb2) >= (8'hbf)))) - (~^{((8'hbf) ? (8'ha3) : (8'ha4)), {(8'hba)}}))))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  input wire [(5'h12):(1'h0)] wire44;
  input wire [(2'h3):(1'h0)] wire43;
  input wire [(2'h2):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire47;
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 reg80,
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
                 reg53,
                 reg52,
                 reg48,
                 (1'h0)};
  assign wire47 = wire46[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg48 <= wire46;
    end
  assign wire49 = $unsigned((reg48 != $signed((^~(wire47 <<< wire47)))));
  assign wire50 = $signed((wire43 >>> wire49[(4'hb):(1'h0)]));
  assign wire51 = $signed($unsigned($unsigned($signed(((8'ha4) ?
                      wire44 : wire49)))));
  always
    @(posedge clk) begin
      reg52 <= wire43[(2'h2):(2'h2)];
      if (wire50[(3'h5):(1'h0)])
        begin
          reg53 <= wire49;
          reg54 <= wire43;
          reg55 <= $signed(((~&$unsigned($signed(wire45))) ?
              (8'haa) : (&(8'haa))));
          reg56 <= $signed(($unsigned($unsigned(((7'h40) << wire49))) ?
              $signed($unsigned({wire42})) : $unsigned({reg48,
                  (reg54 ? wire42 : wire47)})));
          reg57 <= wire43;
        end
      else
        begin
          reg53 <= reg48[(1'h0):(1'h0)];
          if ((8'haf))
            begin
              reg54 <= (+($unsigned(({reg56} ? reg48 : reg54[(4'he):(4'hc)])) ?
                  (8'ha7) : (wire46 * wire43[(2'h3):(2'h3)])));
              reg55 <= {((wire50[(3'h5):(3'h5)] && reg52[(4'h9):(4'h9)]) ?
                      (wire50 ?
                          wire42[(1'h1):(1'h0)] : $signed($unsigned(reg55))) : $unsigned({$unsigned(reg48),
                          reg48}))};
            end
          else
            begin
              reg54 <= $signed((~^((reg53[(1'h1):(1'h0)] + $unsigned(reg54)) <= {$unsigned(reg57)})));
              reg55 <= (^(~{reg55[(3'h5):(3'h5)]}));
              reg56 <= $signed($signed(wire46[(1'h0):(1'h0)]));
              reg57 <= wire43[(1'h0):(1'h0)];
            end
          reg58 <= (7'h41);
          reg59 <= ($signed((($signed(wire51) ^~ (wire50 ? wire46 : reg53)) ?
              $unsigned($signed(wire51)) : (&((8'hbb) == reg48)))) == ({($signed(reg52) ?
                      wire47[(3'h4):(1'h1)] : $unsigned(wire49))} ?
              (!((wire43 | reg53) ?
                  (reg54 ?
                      wire45 : wire49) : $unsigned(wire45))) : ((~^(-reg53)) ?
                  (reg57 != reg56[(2'h3):(2'h2)]) : ($unsigned(reg53) ?
                      (reg58 ? reg48 : reg55) : wire44))));
          reg60 <= {$unsigned(wire43[(1'h0):(1'h0)]),
              ($unsigned((|reg52)) ?
                  ((8'ha8) ?
                      $unsigned(wire50[(1'h0):(1'h0)]) : $signed($unsigned(reg54))) : (8'hb3))};
        end
      if (reg53[(1'h1):(1'h1)])
        begin
          if (wire51[(3'h6):(2'h3)])
            begin
              reg61 <= (($signed((+reg54)) < $signed(reg58)) << {$signed((reg58 * (!wire44))),
                  ($signed(reg52[(5'h10):(4'he)]) < (reg48[(3'h6):(3'h4)] ?
                      reg48 : (wire43 | reg52)))});
              reg62 <= {({reg61[(3'h4):(1'h1)]} && $unsigned((~reg53))),
                  wire47[(4'ha):(2'h3)]};
              reg63 <= $signed(($signed($signed((~^reg62))) & {(wire50 * $unsigned(wire47))}));
              reg64 <= $signed(reg48);
            end
          else
            begin
              reg61 <= ($signed(((wire44[(5'h12):(4'he)] && wire49) ?
                  reg56[(3'h4):(3'h4)] : reg48[(4'hd):(1'h1)])) < reg59);
              reg62 <= $unsigned(({((wire43 ? (8'hbf) : reg48) ?
                      (~|reg61) : (reg59 >>> wire51))} - ({(wire46 ^ wire47)} ?
                  reg55[(1'h1):(1'h1)] : {(reg55 ? reg56 : (8'hba)),
                      (wire44 ? (8'hba) : wire46)})));
              reg63 <= (~^reg62[(2'h3):(2'h3)]);
              reg64 <= ($signed((^~(+$unsigned(wire44)))) & ((($signed((8'ha0)) & (reg55 < reg58)) ?
                  reg58 : $unsigned({reg54})) >> (8'hbd)));
            end
          reg65 <= (~$unsigned((({wire46} + $unsigned(wire47)) ^~ reg59[(3'h6):(3'h6)])));
          reg66 <= wire49;
          reg67 <= $unsigned((reg63[(4'h9):(3'h6)] ?
              (!wire42[(1'h1):(1'h1)]) : reg66));
        end
      else
        begin
          reg61 <= {(8'hb9), reg62};
          if ({((((~^wire43) << (wire49 < wire43)) >> ((!reg55) <= (|wire45))) ^~ (($signed(reg54) ?
                      $signed((7'h40)) : (8'hb4)) ?
                  $unsigned((wire44 <<< wire50)) : reg63))})
            begin
              reg62 <= ((+wire49) ?
                  (wire46[(3'h6):(1'h1)] ?
                      (~(8'haf)) : {$signed((&(8'h9d)))}) : $signed(reg66[(3'h4):(2'h3)]));
              reg63 <= (reg58 << ($signed($signed((reg48 || (8'hb5)))) + reg64[(1'h1):(1'h1)]));
              reg64 <= ({wire42, $signed((&(wire49 | reg60)))} ?
                  ($signed(reg57[(3'h4):(1'h0)]) ? wire51 : reg62) : reg58);
              reg65 <= $unsigned($unsigned((wire46 >> $unsigned(wire47[(1'h0):(1'h0)]))));
              reg66 <= (reg63 ?
                  (wire51 >> $unsigned(wire51[(1'h0):(1'h0)])) : $signed(((&((8'haf) <= reg52)) != (+reg67))));
            end
          else
            begin
              reg62 <= reg66;
              reg63 <= (^~wire44[(4'hb):(2'h3)]);
              reg64 <= $unsigned((!((8'ha5) ? reg59[(2'h2):(1'h1)] : reg60)));
              reg65 <= $unsigned(($signed(wire47) ?
                  wire42 : ((+$signed(reg66)) ?
                      reg54[(3'h5):(2'h3)] : $unsigned($signed(reg60)))));
            end
          reg67 <= reg65;
          reg68 <= reg66;
          if ((((!wire42[(1'h0):(1'h0)]) == ($signed($signed(wire51)) ~^ (wire51 ?
                  (reg52 ? wire44 : wire47) : $unsigned(reg67)))) ?
              (wire45 << (~((reg64 << wire43) >= $signed(reg53)))) : $unsigned(wire51)))
            begin
              reg69 <= $unsigned(reg58[(3'h4):(1'h1)]);
              reg70 <= wire51[(3'h7):(2'h2)];
            end
          else
            begin
              reg69 <= (+({$signed(reg62[(3'h6):(3'h4)])} >>> reg60[(2'h2):(2'h2)]));
              reg70 <= (({$unsigned((~^(8'hb6)))} ?
                      (($signed(reg68) ? $signed(reg64) : {reg61, wire47}) ?
                          wire45[(3'h6):(2'h3)] : $unsigned({reg52})) : $unsigned((&((7'h41) ?
                          reg52 : wire49)))) ?
                  reg62 : (($signed((reg59 ? wire43 : wire50)) ?
                          (8'hab) : reg65[(1'h1):(1'h1)]) ?
                      {(wire47 ? $signed(reg65) : reg64),
                          (^$unsigned(reg58))} : $signed($unsigned($unsigned((8'ha1))))));
            end
        end
      reg71 <= (reg65[(4'h9):(3'h5)] >>> (!reg62));
      if (wire44)
        begin
          reg72 <= (&wire47[(3'h5):(1'h0)]);
          reg73 <= $unsigned($unsigned($signed(($unsigned(reg48) > (reg62 + reg70)))));
          reg74 <= reg61[(2'h3):(1'h1)];
          reg75 <= reg73;
        end
      else
        begin
          reg72 <= (~|(({{(8'hbb), reg52}} >>> ($signed((8'hb8)) ?
              $unsigned(reg54) : ((8'hb4) ?
                  reg75 : (8'hbd)))) & reg63[(4'he):(4'hd)]));
          if (wire51)
            begin
              reg73 <= $signed(wire50[(1'h1):(1'h0)]);
              reg74 <= (((~|$signed($unsigned(reg73))) ^~ {(reg68 ?
                      reg48 : reg68[(3'h4):(2'h3)]),
                  ($unsigned(wire50) ?
                      $unsigned(wire43) : {reg69,
                          reg63})}) ^~ $unsigned(($signed(((8'hab) & reg53)) ^~ reg68)));
            end
          else
            begin
              reg73 <= $unsigned($signed(($unsigned($unsigned(reg74)) + reg53)));
              reg74 <= $signed((wire49[(4'he):(4'h9)] <= $unsigned(({reg66,
                      reg75} ?
                  $unsigned(reg55) : reg64))));
              reg75 <= {(reg55[(1'h1):(1'h0)] ? reg68 : reg64),
                  ($unsigned($signed((wire43 * wire47))) >> {wire45[(3'h4):(3'h4)]})};
            end
          reg76 <= reg54;
          reg77 <= $signed($signed(wire44));
          if (reg48)
            begin
              reg78 <= $signed(reg72);
            end
          else
            begin
              reg78 <= $signed((&$unsigned($unsigned(wire44))));
              reg79 <= $signed(($signed(reg75) ~^ reg56[(3'h6):(3'h4)]));
              reg80 <= (+(^~(((reg65 >= (8'ha8)) << (reg52 <= reg68)) << {(reg57 >>> reg63)})));
            end
        end
    end
  assign wire81 = (wire51 ?
                      (reg80[(2'h2):(1'h0)] ~^ ({(8'hb7), reg72} ?
                          (8'ha3) : $unsigned($unsigned(reg67)))) : (reg69[(3'h4):(2'h3)] ?
                          reg73 : (|wire47)));
  assign wire82 = $unsigned(($signed((wire49 << $signed(reg68))) ?
                      ($unsigned(wire46[(4'ha):(1'h0)]) ?
                          (((7'h43) ? (8'hab) : reg66) ?
                              reg64 : wire46[(4'h9):(2'h3)]) : $unsigned((reg64 == reg80))) : (|$unsigned((wire43 - reg80)))));
  assign wire83 = $unsigned((((!(reg60 ~^ (8'ha7))) ?
                          (^~$signed(reg57)) : ((reg57 << (8'ha8)) ?
                              $unsigned(reg68) : (reg55 < reg72))) ?
                      reg70[(4'hc):(1'h0)] : $unsigned(reg55)));
endmodule

module module6
#(parameter param35 = ({((|((8'hb9) ? (8'hbb) : (7'h43))) == ((8'hb9) ? ((8'hb9) > (8'hb1)) : ((8'hbd) ? (8'ha6) : (8'ha0))))} <<< (~|{(((8'hb9) ? (7'h44) : (8'hbf)) ? ((7'h43) ? (8'hbc) : (8'hb9)) : ((8'hb1) ? (8'hb2) : (8'hbf))), ({(8'hb0), (8'h9e)} ~^ ((8'hba) < (8'ha2)))})), 
parameter param36 = ((8'hb0) != (&({(param35 >> param35), param35} | (^param35)))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h139):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire12;
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg13,
                 (1'h0)};
  assign wire12 = $signed(((~(7'h42)) ?
                      ({wire11[(1'h1):(1'h0)],
                          $unsigned(wire10)} + (wire8 | {wire9,
                          wire8})) : wire10));
  always
    @(posedge clk) begin
      reg13 <= ($unsigned($unsigned({(!wire8)})) ?
          ($unsigned($signed((8'haa))) ?
              wire8[(3'h7):(3'h5)] : ($unsigned(wire9) & ((wire9 > (7'h41)) && ((8'ha3) && wire9)))) : wire10[(4'hb):(4'h9)]);
    end
  assign wire14 = wire7;
  assign wire15 = ($unsigned((wire10[(2'h2):(1'h0)] ?
                          {(wire9 ^~ (7'h42))} : $signed((!wire14)))) ?
                      wire11 : {($signed($unsigned(reg13)) && wire11[(1'h0):(1'h0)])});
  assign wire16 = (~^wire14);
  assign wire17 = {$signed($unsigned($unsigned((wire8 && (8'hae)))))};
  assign wire18 = ((~&wire7[(4'he):(3'h6)]) ?
                      wire12 : (($unsigned(wire16[(1'h1):(1'h0)]) << $signed((+wire15))) ?
                          (8'haa) : (wire10 - wire10[(4'h9):(2'h3)])));
  assign wire19 = wire12[(1'h1):(1'h0)];
  assign wire20 = (^~wire15);
  assign wire21 = wire15;
  assign wire22 = {wire20[(1'h0):(1'h0)]};
  assign wire23 = (8'hb7);
  assign wire24 = (($signed((wire19[(2'h2):(2'h2)] ?
                              (wire20 ? wire22 : wire19) : $signed(wire7))) ?
                          (!((!wire12) ?
                              (~wire22) : $signed((8'ha5)))) : (+$signed($signed(wire14)))) ?
                      {reg13,
                          wire7[(4'hf):(3'h6)]} : (~|((|$unsigned((8'ha5))) ^~ ({(8'ha1)} <= $unsigned(wire17)))));
  assign wire25 = $unsigned((8'hbb));
  assign wire26 = wire20;
  always
    @(posedge clk) begin
      reg27 <= {($signed((~^$signed(wire20))) || (wire15 * wire18)),
          $unsigned(($signed(wire12[(2'h2):(2'h2)]) ?
              $signed((wire22 ? wire16 : wire26)) : $signed(wire12)))};
      reg28 <= wire15;
      reg29 <= {(wire17 - $unsigned({((8'hbe) * wire21),
              reg27[(4'hb):(2'h3)]})),
          $signed(wire15[(5'h12):(3'h6)])};
      reg30 <= ($unsigned($signed((8'hb6))) ?
          (+((8'hb4) < (((7'h42) ?
              wire15 : wire25) <= wire19))) : (reg28 > $unsigned(wire24[(2'h3):(1'h0)])));
    end
  assign wire31 = $signed(({wire22} ?
                      $unsigned((^~wire18[(1'h1):(1'h1)])) : $signed(reg29[(4'h8):(3'h4)])));
  assign wire32 = (8'h9d);
  assign wire33 = (-wire26[(4'h9):(3'h7)]);
  assign wire34 = {$unsigned((wire9[(3'h6):(2'h2)] <<< (~|wire9[(4'he):(3'h7)])))};
endmodule
