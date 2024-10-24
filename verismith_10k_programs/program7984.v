module top
#(parameter param79 = ({(8'haa), (-(~((8'haa) ? (7'h44) : (8'hab))))} ? (((~(~|(7'h40))) >>> (|{(7'h43)})) ? (((!(8'hac)) ? ((8'ha9) ? (8'hb1) : (7'h41)) : (~&(8'ha8))) ? ((8'ha3) ? {(8'hbc), (7'h41)} : ((8'hb0) ? (8'h9c) : (8'hbd))) : (!((8'hb6) + (8'ha0)))) : ((~^((7'h40) ? (8'hbd) : (8'h9c))) ? ({(8'hbd)} != ((7'h43) >> (7'h43))) : (!(+(8'hb7))))) : {{(((8'hb3) ? (8'hb9) : (8'hb8)) ? ((8'hac) << (8'hb0)) : {(8'hb7)})}, {(+((8'ha3) * (8'ha2))), (!((7'h43) ? (8'had) : (8'hb5)))}}), 
parameter param80 = param79)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire77;
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire19,
                 wire77,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg6,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(wire3)) ?
                     $signed({(wire0 ^~ wire4),
                         wire3[(3'h7):(2'h2)]}) : (~&(!(-wire4))));
  always
    @(posedge clk) begin
      reg6 <= (~$signed($unsigned({$unsigned(wire1), (wire1 ^ wire1)})));
    end
  assign wire7 = (wire3[(3'h6):(2'h3)] ?
                     ($unsigned($signed(wire3)) - ({reg6} ?
                         $signed({wire0, wire4}) : ((!wire4) ?
                             (wire4 ?
                                 wire2 : wire2) : $unsigned((8'hbf))))) : wire5[(3'h4):(3'h4)]);
  assign wire8 = (^~(wire5 ? (~&$unsigned(wire7)) : wire0[(1'h1):(1'h0)]));
  assign wire9 = $unsigned(wire4);
  assign wire10 = wire8[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ((wire2[(4'hc):(1'h0)] >> $signed((^((+wire0) ?
          (reg6 ? wire7 : wire7) : wire1)))))
        begin
          reg11 <= $unsigned((((8'ha8) - $unsigned(wire3[(2'h3):(1'h0)])) < $signed(((wire4 > wire1) ?
              (wire5 + wire2) : $signed((8'ha0))))));
          reg12 <= ((&(~^{$signed(wire9),
              (wire1 ? reg11 : wire5)})) + (wire4[(4'hc):(1'h0)] ?
              (~|(^wire4)) : wire8[(1'h0):(1'h0)]));
          reg13 <= (wire7 ?
              ((~^$unsigned(((8'hb9) < reg11))) ?
                  ({(wire5 < wire4)} ?
                      (wire3[(2'h3):(2'h3)] ~^ (reg6 ?
                          wire3 : wire1)) : ((!reg6) ?
                          (wire7 * wire1) : {wire3,
                              wire1})) : ($signed($unsigned(wire1)) ?
                      ((+wire5) ?
                          wire1[(4'hb):(3'h6)] : (wire8 && wire2)) : {$unsigned(wire3),
                          (reg6 + reg6)})) : ($unsigned(wire8[(1'h0):(1'h0)]) >= wire9));
        end
      else
        begin
          if ((^~($unsigned($unsigned((wire9 ^~ wire10))) ?
              ((!(wire2 <<< wire9)) <= $unsigned(wire2[(5'h10):(4'he)])) : $signed(wire0))))
            begin
              reg11 <= wire10;
            end
          else
            begin
              reg11 <= $unsigned(((((reg11 & wire4) ?
                          (8'ha5) : (wire5 ? wire4 : wire0)) ?
                      $signed((|reg12)) : wire10[(2'h2):(1'h1)]) ?
                  wire3[(2'h3):(2'h3)] : (~&$signed(((8'hae) - wire9)))));
              reg12 <= (8'ha7);
            end
          reg13 <= wire7;
          reg14 <= wire2;
        end
      reg15 <= (8'hb8);
      reg16 <= $signed(((wire1 <<< ((8'hac) ?
              $unsigned(reg15) : ((7'h40) >>> reg12))) ?
          wire5 : (-wire9[(1'h0):(1'h0)])));
      reg17 <= (~|wire5[(3'h7):(1'h1)]);
      reg18 <= wire5[(2'h3):(1'h1)];
    end
  assign wire19 = ($signed({reg17}) ?
                      {reg17,
                          (wire3 ?
                              ($unsigned(wire4) == $unsigned(reg15)) : wire0[(4'h9):(3'h7)])} : $signed(wire3[(4'h8):(3'h7)]));
  module20 #() modinst78 (wire77, clk, reg13, reg11, reg12, wire3, reg14);
endmodule

module module20
#(parameter param76 = ({((~^((8'hb5) ? (8'hb7) : (8'ha1))) ? ((^(8'hb7)) ^~ {(8'hb4), (8'h9f)}) : ((^~(8'h9f)) ? (~&(8'hb5)) : ((8'ha1) ? (8'hbe) : (8'hbe))))} == (((^~((8'hbc) <<< (8'ha3))) - (8'hbd)) ? (~|{((8'hae) ? (8'hbc) : (8'hb5)), ((8'hb9) ? (7'h43) : (8'hb5))}) : (^(~|((8'ha2) | (8'ha2)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(5'h10):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  wire signed [(3'h6):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(5'h12):(1'h0)] wire70;
  assign y = {wire75, wire74, wire73, wire72, wire70, (1'h0)};
  module26 #() modinst71 (wire70, clk, wire24, wire25, wire21, wire22);
  assign wire72 = wire21[(3'h7):(2'h3)];
  assign wire73 = $unsigned({$signed($unsigned((wire22 >> wire23))),
                      (|wire23[(3'h7):(3'h7)])});
  assign wire74 = (&wire23);
  assign wire75 = $unsigned((wire23 ? wire21 : $signed((~^(!wire74)))));
endmodule

module module26
#(parameter param69 = (|(~|((((8'hb8) - (8'h9f)) <= (^~(8'hbe))) + (8'hb9)))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire signed [(3'h6):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire35,
                 wire34,
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
                 reg47,
                 reg46,
                 reg45,
                 reg38,
                 reg37,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg31 <= wire29[(5'h10):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg32 <= wire28[(2'h3):(2'h2)];
      reg33 <= (-wire27[(3'h5):(2'h2)]);
    end
  assign wire34 = wire30[(3'h6):(3'h5)];
  assign wire35 = reg32[(2'h3):(1'h1)];
  assign wire36 = (-($signed($signed(wire28[(2'h2):(1'h0)])) ?
                      $unsigned($unsigned($unsigned(reg33))) : ((8'hbc) < $unsigned($unsigned((8'h9c))))));
  always
    @(posedge clk) begin
      reg37 <= $signed(((~^$signed($unsigned(wire27))) ?
          (~($signed(wire28) * wire30)) : (+((wire28 ?
              wire27 : reg32) & (reg33 != (8'ha4))))));
      reg38 <= $unsigned(reg32[(1'h1):(1'h1)]);
    end
  assign wire39 = ({$signed($unsigned((-reg32))),
                      ($unsigned(((8'ha8) >= wire30)) ?
                          wire27 : (-((8'h9e) > reg38)))} <<< {reg38[(4'h9):(3'h4)]});
  assign wire40 = $unsigned(wire34);
  assign wire41 = wire36[(3'h6):(3'h6)];
  assign wire42 = (^~{$signed((reg31 ? $signed(reg38) : {reg37, wire36})),
                      wire29});
  assign wire43 = $unsigned(((($signed(reg33) ?
                      $signed((7'h40)) : (+wire40)) >>> ($unsigned(wire29) ?
                      $unsigned((7'h41)) : $signed((8'haf)))) <<< $signed(wire42)));
  assign wire44 = $signed(wire40);
  always
    @(posedge clk) begin
      reg45 <= (((^$unsigned(wire43[(2'h2):(2'h2)])) >> ((~|((8'hb5) ?
              reg37 : reg31)) ?
          (8'hbb) : wire39[(3'h5):(3'h4)])) <<< (wire40[(4'h8):(2'h3)] ?
          $unsigned((+$unsigned(reg37))) : wire42[(1'h1):(1'h0)]));
      if (({wire28} - (+(wire29 ? wire43 : wire44[(4'ha):(4'h9)]))))
        begin
          reg46 <= $signed((wire43[(3'h7):(3'h4)] ?
              (^wire30) : $signed(({(8'hbf)} ? wire41 : (wire27 > wire28)))));
          if ((-$signed(wire40)))
            begin
              reg47 <= $signed($signed(wire43));
              reg48 <= $unsigned({$unsigned(wire39),
                  $unsigned(($unsigned(wire36) - (8'ha7)))});
              reg49 <= (~&wire30[(3'h5):(1'h1)]);
              reg50 <= $signed(({$signed((~wire42))} ?
                  $signed((wire29[(3'h6):(3'h6)] > {wire35})) : ($signed(reg48) ?
                      (-$signed(reg33)) : (^$signed(wire40)))));
            end
          else
            begin
              reg47 <= $signed(((~|$signed((|(8'ha1)))) == (8'ha5)));
              reg48 <= (~|(reg38[(4'he):(3'h5)] >= wire30[(3'h4):(2'h2)]));
              reg49 <= $signed(((((|wire27) == reg45[(4'hb):(4'ha)]) | {(-reg33)}) || $unsigned(wire36[(4'h8):(2'h2)])));
              reg50 <= (~$unsigned((wire39 == (8'hb7))));
              reg51 <= {((~|(wire30[(1'h0):(1'h0)] && wire35[(1'h1):(1'h1)])) <<< $signed((|(reg45 << reg45))))};
            end
          if ($signed(wire44[(4'hc):(3'h4)]))
            begin
              reg52 <= (reg47[(3'h6):(1'h0)] ?
                  $unsigned((wire39[(1'h0):(1'h0)] >> $signed((reg33 ~^ (8'hab))))) : $signed(({reg31[(1'h0):(1'h0)]} + (+(reg32 || reg49)))));
            end
          else
            begin
              reg52 <= ($signed($signed(reg51)) ?
                  wire42 : $unsigned($signed(((!wire41) >> (wire29 ?
                      reg46 : reg32)))));
              reg53 <= reg46[(2'h3):(2'h2)];
              reg54 <= reg46;
              reg55 <= reg54[(2'h2):(1'h1)];
            end
          reg56 <= {{$unsigned($signed(((7'h43) >>> wire35)))}};
        end
      else
        begin
          if ((8'h9f))
            begin
              reg46 <= wire36;
            end
          else
            begin
              reg46 <= reg37;
            end
          reg47 <= wire39;
          if ((reg33 ?
              ((((reg54 ? reg32 : (7'h40)) << ((8'hb8) ? wire34 : reg31)) ?
                  ((wire35 > wire27) ?
                      $signed(wire36) : reg38[(5'h11):(3'h4)]) : $signed(((7'h44) ?
                      wire27 : reg54))) && (|(reg31[(2'h2):(2'h2)] > (8'hb4)))) : reg32[(3'h4):(3'h4)]))
            begin
              reg48 <= reg56[(3'h5):(1'h1)];
              reg49 <= $unsigned(({(8'ha5),
                  ((wire34 ?
                      wire43 : wire34) ^ $unsigned(reg38))} | {$signed((-reg51))}));
              reg50 <= $unsigned(reg31[(3'h6):(1'h0)]);
            end
          else
            begin
              reg48 <= (&(|reg52));
              reg49 <= (8'h9e);
              reg50 <= ($signed(wire30) * (((-$signed(wire29)) ?
                      $signed(((8'ha9) << reg32)) : (wire41[(4'hd):(4'h9)] * (wire43 + reg33))) ?
                  $signed({$signed(reg37),
                      (~|wire43)}) : $unsigned($unsigned((wire44 ?
                      (7'h44) : reg52)))));
            end
          reg51 <= $signed(((~&$signed(reg53[(2'h2):(1'h1)])) <= ((^(~(8'hbc))) <<< (8'hb2))));
        end
      reg57 <= (reg53[(2'h2):(1'h0)] ?
          $unsigned((^(|(-reg52)))) : {wire40[(2'h3):(1'h1)]});
      if ($signed({wire39[(3'h4):(1'h0)]}))
        begin
          reg58 <= reg47[(4'hc):(3'h7)];
          reg59 <= ($signed((&$unsigned(((8'ha4) ? wire35 : (8'hb9))))) ?
              ($signed($unsigned({reg51, reg46})) ?
                  reg38 : ((!(!wire41)) ?
                      $unsigned((reg58 ? wire42 : wire40)) : ((~(8'hb7)) ?
                          (+wire44) : wire34[(3'h7):(3'h7)]))) : ((&$unsigned((!reg51))) ?
                  ((^$signed(wire27)) ?
                      {{reg52, wire43},
                          wire41} : $unsigned($unsigned(reg54))) : ($unsigned((reg46 <<< (8'h9d))) ?
                      wire35[(3'h7):(3'h7)] : (reg55[(4'hb):(4'hb)] == $signed(reg53)))));
          reg60 <= {(wire27[(3'h6):(2'h2)] || $signed($signed(wire28)))};
          reg61 <= $unsigned((^$unsigned($unsigned($signed(wire36)))));
        end
      else
        begin
          if (((reg54[(1'h1):(1'h1)] >= (&$unsigned((wire44 ?
              (8'haf) : wire27)))) && reg57))
            begin
              reg58 <= reg51[(1'h0):(1'h0)];
            end
          else
            begin
              reg58 <= (($signed((+(^~reg57))) * $signed((((8'hb3) == reg48) == $unsigned(wire36)))) ?
                  $signed((^$signed(wire28[(1'h1):(1'h1)]))) : reg58);
              reg59 <= ($unsigned($unsigned((~&(8'ha4)))) || ($signed($unsigned({(8'hab),
                      wire44})) ?
                  (|((~|reg32) ?
                      (reg47 ?
                          reg46 : reg53) : (reg50 * reg32))) : ((~wire35[(4'h9):(4'h9)]) ?
                      (|$signed(reg51)) : (reg47[(2'h3):(1'h1)] ?
                          $unsigned(reg37) : $signed(reg32)))));
            end
          if ((~&$unsigned(reg51)))
            begin
              reg60 <= $signed($signed(((|(wire44 >= wire42)) ?
                  (-((8'ha7) <= (8'hb7))) : wire34)));
              reg61 <= ((~|(-($unsigned(reg31) ?
                      $signed(reg52) : ((8'hb4) == (8'hbf))))) ?
                  $unsigned(((|(^~(8'hbd))) ?
                      $unsigned((~reg47)) : $signed((reg46 ?
                          wire43 : (8'ha2))))) : {((^(wire44 ^ reg49)) ?
                          (reg51[(1'h0):(1'h0)] | (reg53 ?
                              wire39 : wire39)) : reg50)});
            end
          else
            begin
              reg60 <= wire44;
              reg61 <= $signed(reg56[(2'h2):(2'h2)]);
              reg62 <= $unsigned($unsigned(reg56[(2'h2):(2'h2)]));
              reg63 <= (!$unsigned($signed(((~(8'hb4)) >= (reg56 >>> wire41)))));
            end
          reg64 <= reg47[(3'h5):(1'h0)];
        end
    end
  assign wire65 = reg33;
  assign wire66 = wire35;
  assign wire67 = $signed(wire43[(4'ha):(3'h7)]);
  assign wire68 = {(~|wire67[(3'h4):(1'h0)]),
                      (($signed((^reg32)) && (reg62[(2'h2):(2'h2)] ?
                          $unsigned(wire40) : $unsigned(wire35))) ^~ ((^reg62) ?
                          {((7'h44) >> wire67), $signed(reg61)} : {(wire30 ?
                                  reg45 : wire27),
                              (reg54 ^ wire36)}))};
endmodule
