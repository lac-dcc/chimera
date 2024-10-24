module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h284):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire47,
                 wire45,
                 wire6,
                 wire5,
                 wire4,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (7'h41);
  assign wire5 = (((~$unsigned((wire3 ? wire1 : wire4))) >>> (~(wire0 ?
                         (wire2 ? wire3 : wire4) : {wire4}))) ?
                     ((8'hb0) ?
                         wire1[(3'h7):(3'h6)] : $unsigned(wire2)) : {wire3,
                         wire4});
  assign wire6 = $unsigned((wire2 >> wire2[(3'h7):(3'h5)]));
  always
    @(posedge clk) begin
      if (($unsigned($signed(wire2[(4'hd):(1'h0)])) <= wire0[(1'h1):(1'h0)]))
        begin
          reg7 <= (7'h40);
          reg8 <= ((8'hae) ? reg7[(2'h2):(1'h0)] : reg7);
        end
      else
        begin
          reg7 <= ((-$signed(wire2[(3'h6):(2'h3)])) ?
              reg7[(2'h2):(1'h1)] : wire3[(1'h1):(1'h1)]);
          reg8 <= $signed((8'h9d));
          if (wire1)
            begin
              reg9 <= {wire4[(2'h2):(1'h1)]};
              reg10 <= ((8'hbb) ? wire3 : wire3);
            end
          else
            begin
              reg9 <= reg9;
            end
          if (($unsigned(reg8[(4'hb):(4'h8)]) ?
              (8'ha1) : $signed(wire6[(2'h2):(1'h0)])))
            begin
              reg11 <= $unsigned(((~^wire5) ?
                  (reg7[(2'h2):(2'h2)] ?
                      (((8'hba) >= (8'hab)) * $signed(reg7)) : reg9[(4'h9):(1'h0)]) : wire4));
              reg12 <= ($signed((($unsigned(reg7) <<< (reg9 ? wire4 : wire3)) ?
                  {$signed(reg11)} : $signed((+wire6)))) ^~ (((~|wire3[(1'h0):(1'h0)]) + ($unsigned(wire6) ?
                  $unsigned(wire2) : reg8[(3'h4):(1'h1)])) > $unsigned($signed(reg7[(1'h0):(1'h0)]))));
              reg13 <= $unsigned(reg10);
            end
          else
            begin
              reg11 <= ({({$signed(reg10), $unsigned(reg13)} ?
                      ((wire3 != reg12) ?
                          $unsigned(reg9) : (wire4 ?
                              wire6 : wire2)) : $unsigned($signed(wire6))),
                  ($unsigned($signed((8'hb8))) ?
                      $signed(wire1[(3'h7):(3'h5)]) : {wire3[(1'h1):(1'h1)]})} - ($unsigned(reg11) ?
                  $signed(wire2[(2'h3):(2'h3)]) : $signed(((reg7 ?
                      wire2 : wire2) >= wire3[(1'h0):(1'h0)]))));
            end
          reg14 <= wire3;
        end
      if ((($unsigned(((reg12 - reg13) ~^ reg13)) & (wire2[(4'h8):(1'h1)] != reg7[(2'h2):(1'h0)])) ?
          reg7 : wire1[(4'h8):(3'h4)]))
        begin
          if ({wire0[(1'h0):(1'h0)], $signed((^~reg12))})
            begin
              reg15 <= $unsigned(wire2);
            end
          else
            begin
              reg15 <= $signed((wire0 ?
                  reg10[(4'h8):(4'h8)] : (((~&reg7) ?
                      (reg10 << reg8) : (reg12 - wire0)) >> ((8'h9d) << reg14[(3'h6):(3'h4)]))));
              reg16 <= (((~|wire1[(5'h10):(3'h5)]) ?
                      (~((7'h41) ?
                          (wire5 ?
                              wire3 : (8'haa)) : (wire6 && reg15))) : reg12[(2'h2):(1'h0)]) ?
                  $unsigned(reg7[(3'h4):(3'h4)]) : (+reg11[(1'h0):(1'h0)]));
              reg17 <= ($unsigned((|(~&(wire2 ?
                  reg7 : (8'hae))))) + $unsigned(reg15[(2'h3):(2'h3)]));
              reg18 <= $unsigned(wire5[(1'h1):(1'h1)]);
              reg19 <= $unsigned((reg10[(2'h3):(1'h0)] ? wire1 : (7'h42)));
            end
          if ((reg14 ?
              (wire4[(1'h0):(1'h0)] << (reg8[(3'h6):(2'h3)] ?
                  reg16 : ((reg13 >>> reg11) ?
                      (reg19 >> reg12) : (~^reg10)))) : ({{reg8,
                          $signed(reg18)}} ?
                  (reg15 ?
                      reg15 : (reg14[(1'h0):(1'h0)] == $signed(reg14))) : $unsigned((wire6 >> (+wire4))))))
            begin
              reg20 <= {$signed((~^wire5)), reg9};
              reg21 <= $signed((wire6 <= wire0[(4'h8):(1'h0)]));
              reg22 <= ($unsigned($signed({(wire0 ? wire4 : wire3)})) ?
                  reg11 : (&(|$unsigned((wire1 << reg7)))));
            end
          else
            begin
              reg20 <= reg9[(4'h8):(3'h6)];
              reg21 <= reg16[(3'h7):(2'h2)];
            end
        end
      else
        begin
          reg15 <= reg14;
          if ((((&(reg9 ?
                  (wire0 != wire6) : reg19)) ^~ $unsigned(($unsigned(reg10) && $unsigned(reg22)))) ?
              (wire0[(2'h3):(2'h3)] ^~ $unsigned($unsigned(reg8[(3'h4):(1'h0)]))) : ((reg10[(1'h1):(1'h1)] * $unsigned($unsigned(reg8))) | ($signed((wire3 & wire4)) ?
                  $signed($signed(reg19)) : (reg11 || (reg19 ?
                      reg19 : reg11))))))
            begin
              reg16 <= $unsigned(({$signed((wire5 ? reg11 : reg19))} ?
                  (((reg7 == reg14) ? $unsigned(reg15) : (reg19 >> reg21)) ?
                      (8'hb4) : ($unsigned(reg8) + reg19)) : reg20));
              reg17 <= {wire1};
            end
          else
            begin
              reg16 <= (((-reg13) >> ((~|$signed((8'had))) - $unsigned(((7'h44) != reg21)))) ?
                  $signed((-$unsigned($signed(reg11)))) : wire0[(3'h7):(3'h7)]);
              reg17 <= ({reg12, $unsigned((!$unsigned(wire5)))} ?
                  $signed((wire5[(2'h2):(1'h1)] * wire6)) : (^~reg10[(4'h8):(2'h2)]));
              reg18 <= reg17;
            end
          reg19 <= $signed((8'ha1));
        end
    end
  module23 #() modinst46 (wire45, clk, reg21, wire4, reg16, wire1);
  assign wire47 = $unsigned(wire6);
  always
    @(posedge clk) begin
      reg48 <= $signed((($unsigned((~^reg21)) && $signed($unsigned(reg15))) ?
          wire4 : {{wire4}}));
      reg49 <= (wire4 ^ (({(8'hb3), wire3} ? $signed((-reg11)) : reg17) ?
          $signed({(~&wire5)}) : (((wire45 ? reg11 : wire2) ?
              ((8'hba) - wire1) : $signed(reg11)) || wire45)));
      reg50 <= $signed((7'h44));
      if (((~(((8'hb2) ? reg17 : $signed((8'ha5))) != reg13[(2'h2):(2'h2)])) ?
          $signed($unsigned(({reg13} ?
              {reg17, reg7} : {(8'hb8)}))) : $unsigned(reg19[(5'h11):(4'hd)])))
        begin
          if (wire2)
            begin
              reg51 <= $signed((reg12[(2'h3):(2'h3)] ?
                  ($unsigned($signed(wire5)) ?
                      $signed((reg16 || reg16)) : $signed(wire6)) : ($unsigned(((8'hb3) ?
                      reg19 : reg50)) <= wire1[(4'h9):(3'h4)])));
              reg52 <= ({(&$unsigned((reg14 ? (8'hbf) : wire45))), reg20} ?
                  wire5 : wire4[(3'h4):(1'h1)]);
              reg53 <= ($signed((8'ha1)) >>> ($signed(reg9[(4'hf):(3'h6)]) > $unsigned($unsigned((+wire47)))));
              reg54 <= (($signed($unsigned(reg17)) ?
                      {$signed((reg52 ?
                              (8'ha3) : reg12))} : $signed(((reg48 >= reg8) ?
                          $unsigned(reg21) : (wire4 | reg13)))) ?
                  (^~reg8) : reg52[(2'h3):(1'h1)]);
              reg55 <= $signed(($unsigned($unsigned((~^reg21))) ?
                  $unsigned($signed(wire45)) : reg12));
            end
          else
            begin
              reg51 <= (wire2 ?
                  (wire6[(2'h2):(1'h1)] * reg16[(1'h1):(1'h0)]) : $signed(($unsigned((8'ha0)) || (reg14[(3'h6):(1'h1)] ?
                      (reg15 ? wire47 : reg50) : {(8'hbd), reg18}))));
              reg52 <= $unsigned(reg8[(3'h7):(3'h7)]);
              reg53 <= wire5;
              reg54 <= $unsigned({{((8'ha0) >> (&reg50)),
                      $signed($signed(wire5))}});
            end
          if ($signed(({reg48,
              $unsigned((reg50 >>> reg50))} >> $unsigned((^$unsigned(reg12))))))
            begin
              reg56 <= $unsigned(($signed($unsigned((!reg48))) + (^((reg48 ?
                      reg11 : (8'hb8)) ?
                  $signed((8'haa)) : ((8'hbb) ? reg7 : reg20)))));
              reg57 <= reg10[(1'h1):(1'h1)];
              reg58 <= $signed(((~|((reg20 ?
                      reg22 : (8'hb9)) * ((8'ha5) == reg49))) ?
                  $unsigned(wire1[(5'h11):(4'hf)]) : $unsigned(($unsigned(reg48) ?
                      $unsigned(reg11) : (&wire0)))));
              reg59 <= ((((8'hb7) && $unsigned((reg20 ?
                  reg58 : reg18))) >> ((reg51 + wire45[(2'h2):(1'h0)]) + reg8)) || $unsigned(reg51));
            end
          else
            begin
              reg56 <= (+((reg17 >>> ($unsigned(wire2) > reg14[(3'h4):(1'h1)])) ?
                  (~((|wire3) ?
                      $unsigned(wire6) : ((8'ha7) ?
                          reg9 : reg52))) : ($signed(wire5) ?
                      ((8'hba) ?
                          (8'h9f) : $unsigned(wire2)) : reg22[(2'h3):(2'h3)])));
              reg57 <= reg48[(3'h7):(3'h6)];
              reg58 <= reg51[(2'h2):(1'h1)];
              reg59 <= {((7'h40) ?
                      $signed($signed((reg52 >= reg13))) : wire45[(1'h0):(1'h0)]),
                  wire47};
              reg60 <= (reg20[(1'h0):(1'h0)] ^ (~$signed($unsigned((reg15 || reg12)))));
            end
          reg61 <= reg59[(1'h0):(1'h0)];
          reg62 <= (+{(wire0 ?
                  ((reg14 ? reg52 : reg53) ?
                      reg58[(4'h8):(3'h4)] : $signed(reg10)) : reg61[(2'h2):(2'h2)])});
          reg63 <= reg62;
        end
      else
        begin
          if (((-wire5) ?
              $unsigned($signed(($signed((7'h41)) == reg62))) : reg11))
            begin
              reg51 <= (($signed($signed(((8'hb7) == reg9))) ?
                      ($signed((-wire2)) ?
                          (|((8'hb0) ^~ reg51)) : (~&(^(8'ha1)))) : ($unsigned($signed(reg58)) ?
                          reg9 : reg50)) ?
                  $signed($signed((8'ha7))) : $unsigned((~(reg18[(1'h1):(1'h0)] ?
                      reg57 : $unsigned((8'hbc))))));
              reg52 <= ($signed($signed((~|(wire45 | wire4)))) ?
                  $unsigned((-$unsigned((wire1 ?
                      reg60 : reg50)))) : ((reg60[(3'h4):(1'h0)] * reg19[(4'ha):(1'h0)]) == reg61));
            end
          else
            begin
              reg51 <= (reg57 ?
                  $unsigned(reg11) : {($unsigned(reg18) ?
                          ((!wire3) * reg52[(1'h0):(1'h0)]) : (~$unsigned((8'hbf)))),
                      wire5[(4'h9):(3'h4)]});
              reg52 <= {(reg13 ^~ $unsigned(((8'hb5) + $signed(reg54))))};
              reg53 <= reg16[(1'h0):(1'h0)];
            end
        end
      if ((8'ha8))
        begin
          reg64 <= ($signed(($unsigned(wire1) ?
              $signed((reg18 - reg53)) : (8'ha6))) * ($unsigned((~(-reg48))) & $unsigned($unsigned(reg9))));
          if ($unsigned(reg17[(3'h7):(3'h6)]))
            begin
              reg65 <= reg17;
              reg66 <= $signed(reg48);
              reg67 <= ((|($signed($signed((8'hb1))) << (~((8'had) ?
                      reg15 : wire2)))) ?
                  (^(reg15 || $signed((wire47 < reg17)))) : reg63);
              reg68 <= ((8'ha4) && (^~(&$unsigned((reg60 != reg22)))));
              reg69 <= reg55;
            end
          else
            begin
              reg65 <= $unsigned(wire6[(1'h1):(1'h0)]);
              reg66 <= $unsigned((&($unsigned(reg49[(3'h5):(2'h2)]) || wire0)));
              reg67 <= (^~(reg16[(3'h5):(1'h0)] || (({reg14, reg64} ?
                  (~^reg15) : {reg8, reg8}) | ((|reg58) ?
                  reg51 : reg64[(4'h9):(3'h6)]))));
            end
          reg70 <= {wire6[(2'h3):(1'h1)],
              $signed((reg63[(4'hb):(3'h5)] ^ ((7'h42) != reg50[(1'h0):(1'h0)])))};
          reg71 <= $signed($signed(reg51[(2'h2):(2'h2)]));
        end
      else
        begin
          if ((reg69 <= $unsigned(reg69)))
            begin
              reg64 <= $signed($unsigned((8'h9c)));
              reg65 <= $signed($signed((reg12[(4'hc):(3'h6)] ?
                  $unsigned((reg64 | (7'h41))) : {(|reg21)})));
            end
          else
            begin
              reg64 <= $signed((((((8'hb4) == wire47) ^~ reg57[(5'h15):(2'h2)]) ?
                  wire47[(1'h0):(1'h0)] : ((^reg66) >> {reg61,
                      (7'h43)})) ~^ $unsigned((+reg58))));
              reg65 <= $signed(wire6);
              reg66 <= (8'ha7);
              reg67 <= $unsigned(($unsigned((|(reg55 ?
                  (8'ha5) : reg71))) << $unsigned($signed({reg20, reg22}))));
              reg68 <= (({wire6[(2'h3):(2'h3)],
                      ($signed(reg54) >= (reg17 ? wire3 : reg15))} && reg7) ?
                  $signed(reg13) : ((8'haa) ?
                      reg10[(4'h8):(1'h1)] : (reg48[(2'h2):(2'h2)] ?
                          $unsigned((reg68 <<< reg63)) : (((8'hb1) ?
                              reg13 : (8'h9c)) >= reg13[(2'h3):(2'h2)]))));
            end
          reg69 <= $signed(((~&reg56) ?
              (reg71 ?
                  (~|(reg8 ^ wire45)) : $signed((reg61 ?
                      wire1 : (8'ha3)))) : $signed($unsigned($unsigned(wire5)))));
          reg70 <= (8'hb7);
          if ({(~|{$unsigned(reg68), $unsigned((reg62 ? reg65 : (8'hb5)))}),
              (~|$unsigned(((wire0 ? wire47 : reg14) && $unsigned(reg63))))})
            begin
              reg71 <= ($unsigned({(8'hba),
                  ($signed(reg62) ?
                      (~&reg59) : $signed((8'ha9)))}) - ((((reg70 ^ reg60) >> {reg17}) ?
                  ($unsigned(reg11) << $signed((8'ha7))) : reg61[(3'h7):(3'h7)]) + wire45[(1'h1):(1'h0)]));
              reg72 <= reg17;
            end
          else
            begin
              reg71 <= reg21;
              reg72 <= ($unsigned({((reg55 ~^ reg71) != $unsigned(reg8))}) || (reg12 < $signed(reg17[(1'h0):(1'h0)])));
              reg73 <= (!($signed(reg62[(3'h6):(1'h1)]) ?
                  $unsigned($signed((~^reg49))) : (reg60[(1'h0):(1'h0)] ?
                      $signed(reg7[(3'h5):(2'h2)]) : {(reg53 == reg68)})));
            end
          reg74 <= (|((reg17[(3'h4):(1'h1)] ?
              $unsigned((-reg69)) : wire6[(2'h2):(1'h0)]) ^ (reg66[(2'h2):(1'h0)] | (~$signed(reg68)))));
        end
    end
  assign wire75 = $unsigned($unsigned($signed(reg56[(2'h2):(2'h2)])));
  assign wire76 = $signed(($signed(($signed(reg12) ?
                      reg56[(4'h8):(3'h6)] : {wire75, reg16})) - (-(+(reg14 ?
                      reg22 : reg8)))));
  assign wire77 = reg61[(3'h7):(1'h1)];
  assign wire78 = reg53[(2'h2):(2'h2)];
  assign wire79 = ($unsigned(((((8'hb5) ? wire1 : wire78) && reg11) ?
                      ((&wire45) != (reg70 || wire47)) : (reg66 ?
                          reg67[(4'hc):(3'h6)] : $signed((8'hb1))))) & $unsigned(({reg57,
                          $signed(wire5)} ?
                      $unsigned(reg57[(4'h8):(2'h3)]) : $signed({wire3,
                          reg64}))));
  assign wire80 = $signed(((8'h9d) * (($signed(reg62) ?
                      $unsigned(reg8) : $signed(reg19)) > ((~|wire78) >= (^~(8'hb9))))));
  assign wire81 = reg65[(4'ha):(3'h7)];
endmodule

module module23
#(parameter param43 = {(~&((|(^(8'hbb))) ? (((8'hac) ^~ (7'h42)) ? ((8'ha4) | (8'hbe)) : ((8'ha3) ? (8'ha0) : (8'hbc))) : (~^(+(8'hbb)))))}, 
parameter param44 = param43)
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire28;
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire28 = wire27[(3'h6):(3'h5)];
  assign wire29 = wire28;
  assign wire30 = ($signed((!wire24[(1'h1):(1'h1)])) ?
                      wire28 : $signed($unsigned($unsigned((wire24 ?
                          wire28 : wire25)))));
  assign wire31 = (wire30 ~^ (8'hac));
  assign wire32 = $signed((wire25 ?
                      ((8'hbb) * ((wire26 ?
                          wire27 : wire29) > wire26)) : (|(~(wire25 ?
                          wire24 : wire25)))));
  assign wire33 = $unsigned({($signed($unsigned(wire24)) ?
                          wire30[(3'h5):(2'h2)] : (wire32[(3'h6):(3'h4)] - {wire26,
                              wire27})),
                      wire31});
  assign wire34 = wire24;
  assign wire35 = $unsigned((wire34 ?
                      wire25 : $unsigned(({wire24} ?
                          (~&wire29) : ((8'hbd) ? wire25 : (8'haa))))));
  assign wire36 = $signed(((((wire30 - wire31) && wire35) ? (7'h40) : wire27) ?
                      ((7'h40) ?
                          {wire32[(3'h5):(3'h4)]} : wire31) : $signed(($unsigned(wire24) ?
                          ((8'hb2) + wire31) : wire31))));
  always
    @(posedge clk) begin
      if ($signed(wire33))
        begin
          reg37 <= ((|$unsigned({(wire25 == wire24)})) > {(($unsigned(wire34) ?
                      wire25 : wire33) ?
                  (~^wire30) : (+(wire24 ? wire33 : wire25))),
              wire26});
          reg38 <= $unsigned(({($signed(wire25) | (^~wire29))} ?
              (8'hb8) : (wire33 > ((&(7'h40)) ?
                  (~reg37) : (wire24 << wire30)))));
        end
      else
        begin
          reg37 <= wire24;
          reg38 <= (&(~|($signed($signed(reg37)) == $unsigned(wire27[(3'h6):(1'h0)]))));
        end
      reg39 <= $signed({{((reg37 >= wire24) ? {wire32, wire31} : wire29)},
          $unsigned(wire30[(3'h4):(2'h2)])});
      reg40 <= reg39;
    end
  assign wire41 = $unsigned(wire36);
  assign wire42 = wire36[(4'he):(4'he)];
endmodule
