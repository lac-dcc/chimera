module top
#(parameter param44 = ((~(~(~|{(8'ha7), (8'h9f)}))) ? {((~((8'hb8) ? (8'haa) : (8'ha1))) || ({(8'ha9), (8'ha8)} ? ((8'hb9) * (8'ha5)) : ((8'hba) ? (8'hbe) : (8'ha1))))} : ((((^~(8'h9f)) <<< ((8'ha6) ? (8'haa) : (8'hbb))) == ({(8'ha7)} >>> ((8'hbe) != (8'ha2)))) ? (((~(8'hb2)) || ((8'ha9) - (8'hb8))) ? (((8'hb1) ? (8'hbd) : (7'h41)) >> ((8'hb9) ? (8'hac) : (8'h9f))) : (((8'hb7) ^ (7'h40)) ? (^(8'hb3)) : (~|(8'h9d)))) : (&(-(~&(7'h43)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire43,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire6,
                 wire5,
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
                 reg29,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ((^$unsigned(wire3)) ?
                     $signed((((!wire1) ?
                         $signed(wire5) : (~|(8'h9c))) >= wire5[(2'h2):(1'h1)])) : {($unsigned((8'hbd)) ?
                             wire1 : $signed(wire3))});
  always
    @(posedge clk) begin
      if (wire4[(3'h6):(1'h1)])
        begin
          if (wire1[(4'he):(2'h2)])
            begin
              reg7 <= ($unsigned((((wire4 ?
                      wire0 : wire4) <= $unsigned(wire4)) >> ((^wire4) ?
                      (~&(7'h42)) : $unsigned(wire0)))) ?
                  wire6 : wire5[(2'h2):(1'h1)]);
              reg8 <= $unsigned((-$signed((+(~|wire4)))));
              reg9 <= {(wire6[(3'h7):(3'h6)] == ((~wire4) ?
                      reg7 : $signed((~|wire2)))),
                  $unsigned(($unsigned({wire6}) ?
                      $unsigned(((8'ha8) ^~ wire4)) : wire3))};
              reg10 <= ($unsigned($signed({reg7, $unsigned(wire1)})) ?
                  wire0 : (|(($signed(reg8) ?
                      $signed(wire2) : {(8'hab), (8'haa)}) > (8'haa))));
            end
          else
            begin
              reg7 <= {(reg10 ? reg10 : (^~wire2))};
              reg8 <= $signed(wire5);
              reg9 <= reg8[(3'h6):(3'h6)];
              reg10 <= wire5[(2'h2):(1'h1)];
              reg11 <= (~&{$unsigned($unsigned(reg9)),
                  ((+reg10[(2'h3):(2'h3)]) || (wire5[(1'h0):(1'h0)] ^ wire6[(2'h3):(2'h2)]))});
            end
          if (reg11)
            begin
              reg12 <= (^~{{(+$signed(wire6))}});
              reg13 <= $unsigned(reg12);
              reg14 <= (({reg13} > (|reg13[(3'h7):(2'h3)])) >>> $signed((reg8 + ($unsigned(wire5) == $signed(reg10)))));
            end
          else
            begin
              reg12 <= ((!reg7[(2'h2):(1'h0)]) < (^~$unsigned(wire0[(4'h9):(4'h9)])));
              reg13 <= ($unsigned(wire0[(4'h9):(1'h1)]) < $signed((wire0[(4'ha):(3'h6)] ?
                  wire2[(2'h3):(2'h3)] : $signed($unsigned((8'hb5))))));
              reg14 <= (~wire6);
              reg15 <= (~^$unsigned(reg13));
            end
          reg16 <= $signed(wire2[(1'h0):(1'h0)]);
          reg17 <= $unsigned((~&$signed((+(reg9 ? wire6 : (8'ha4))))));
        end
      else
        begin
          if (((reg10 & (!$unsigned($unsigned(reg11)))) ?
              reg7 : reg12[(3'h6):(3'h5)]))
            begin
              reg7 <= $signed(reg10);
              reg8 <= (wire0[(2'h3):(2'h3)] * $unsigned((wire3[(2'h2):(2'h2)] >> ((wire1 == reg11) ?
                  {wire5} : $signed(reg15)))));
            end
          else
            begin
              reg7 <= (wire6[(3'h4):(1'h0)] || reg8[(1'h0):(1'h0)]);
              reg8 <= (reg17 ~^ ((((8'hb0) - (^~reg15)) != $unsigned($signed(reg9))) > $unsigned($unsigned($unsigned(wire3)))));
              reg9 <= (-(wire2 ?
                  ((((8'hab) ? (8'hb6) : reg17) ?
                      (wire2 ? (8'ha8) : wire1) : $signed((8'hb4))) | {(wire5 ?
                          reg7 : reg7)}) : $signed(((wire1 ?
                      reg12 : wire1) == wire3[(2'h2):(1'h1)]))));
              reg10 <= $signed(reg10);
            end
          if ($unsigned($unsigned({((wire1 ? reg15 : wire1) ?
                  $unsigned(reg15) : (wire4 <<< wire4)),
              (((8'hae) ? reg15 : wire5) ? (^~reg16) : (^~reg13))})))
            begin
              reg11 <= (-(8'ha7));
            end
          else
            begin
              reg11 <= (~|(wire5[(1'h1):(1'h0)] - $signed({reg15})));
              reg12 <= (reg15 ?
                  (&(^(wire6 ? ((8'hb0) & reg7) : (reg9 <= wire2)))) : reg7);
            end
        end
      reg18 <= $unsigned((reg13 | (^~({reg12} ?
          $unsigned(reg16) : $unsigned(reg17)))));
      if ($unsigned($signed((((reg14 >> wire0) ?
          (~|wire2) : (reg12 ? wire0 : reg10)) == (^~wire2[(1'h1):(1'h0)])))))
        begin
          if ((($signed($signed((reg13 ? wire5 : reg13))) ?
              ($signed(wire1[(4'h8):(1'h1)]) & reg13) : $signed((-$unsigned(reg9)))) >>> ($signed($signed(reg8[(2'h3):(2'h2)])) ?
              wire3[(1'h0):(1'h0)] : $unsigned(reg10[(2'h3):(1'h1)]))))
            begin
              reg19 <= reg8;
              reg20 <= (~&$signed({(~^reg9)}));
              reg21 <= (^$signed((((wire6 & reg20) ?
                      reg16[(1'h1):(1'h0)] : wire6[(3'h7):(2'h2)]) ?
                  reg11[(5'h10):(1'h1)] : ((reg15 ? wire5 : reg18) ?
                      {wire6, wire0} : (wire4 ? (8'h9e) : wire1)))));
              reg22 <= $signed($unsigned((reg21 ?
                  wire6[(2'h3):(1'h0)] : {(8'h9e), wire4[(3'h6):(1'h1)]})));
              reg23 <= $unsigned((~|$signed($signed({reg7}))));
            end
          else
            begin
              reg19 <= (reg20[(3'h5):(3'h5)] << ((($signed(reg21) < $unsigned((8'hac))) ?
                      ($unsigned(reg10) ?
                          (reg18 >>> wire0) : $signed(reg9)) : reg8) ?
                  ({$signed(reg10),
                      $signed(reg9)} != $signed((reg13 ^ wire0))) : ($signed(reg12[(4'h8):(3'h6)]) >>> $unsigned((wire5 ?
                      (8'haf) : (8'ha8))))));
            end
        end
      else
        begin
          reg19 <= $unsigned($signed($signed((~|(!(8'ha7))))));
          reg20 <= $unsigned((!reg12[(1'h0):(1'h0)]));
          reg21 <= $unsigned($signed($signed($signed((wire6 > reg18)))));
        end
      reg24 <= (reg10 == (8'hb8));
      reg25 <= (((+(~^(wire2 ?
          reg20 : reg20))) >>> (~reg17)) & $signed($unsigned($unsigned({(8'h9e),
          reg21}))));
    end
  assign wire26 = (reg7 ?
                      reg21[(2'h2):(2'h2)] : $unsigned(reg20[(3'h4):(3'h4)]));
  assign wire27 = {(reg18 << reg8[(2'h2):(2'h2)]),
                      (wire6[(3'h6):(3'h4)] + reg20)};
  assign wire28 = (~|(|{(7'h40)}));
  always
    @(posedge clk) begin
      reg29 <= $unsigned({wire0[(4'hd):(4'h8)]});
    end
  assign wire30 = ($unsigned(({(-reg10)} ?
                          ((^reg29) ^~ $signed(reg11)) : {(reg23 >> reg19)})) ?
                      {((wire5[(1'h0):(1'h0)] ?
                                  (wire2 || (8'hb5)) : $signed(reg8)) ?
                              (7'h41) : (7'h40))} : (-reg21[(1'h0):(1'h0)]));
  assign wire31 = (&(8'ha6));
  always
    @(posedge clk) begin
      if (reg10[(2'h3):(2'h3)])
        begin
          reg32 <= ($signed($signed($signed(reg23))) != reg29[(1'h0):(1'h0)]);
          reg33 <= $signed({(reg14[(2'h2):(2'h2)] == {$unsigned(wire27),
                  ((8'hb5) ? wire31 : reg23)}),
              {($signed(reg13) == {reg16, reg14}), (^~$signed(wire26))}});
        end
      else
        begin
          reg32 <= wire28;
          reg33 <= ((^~(($unsigned(wire30) ?
              $unsigned(reg21) : (8'h9f)) < reg13[(3'h7):(1'h0)])) == $signed((((wire3 ^~ reg11) ?
              $unsigned(wire0) : $signed(reg23)) ^ $unsigned((reg25 | wire26)))));
          reg34 <= (8'h9f);
        end
      if ((^~$unsigned($signed(reg21[(1'h0):(1'h0)]))))
        begin
          if (reg11)
            begin
              reg35 <= (~&({{{(8'had), reg19}, ((8'ha2) > reg8)},
                  $signed((~^reg21))} ~^ reg33));
              reg36 <= (({{(reg9 || (8'ha9))},
                      reg29[(5'h14):(4'h9)]} < $unsigned($unsigned((reg29 ?
                      reg32 : (8'hbc))))) ?
                  (reg23 ?
                      (&($signed(wire26) ?
                          (reg23 ?
                              reg13 : reg18) : wire3[(2'h2):(1'h0)])) : $signed(((wire31 + wire27) ?
                          (reg14 || (8'hbf)) : $signed(reg9)))) : $signed((+$unsigned($unsigned(reg21)))));
              reg37 <= wire26;
              reg38 <= (~(reg34 ^~ reg13[(3'h7):(3'h6)]));
              reg39 <= reg35;
            end
          else
            begin
              reg35 <= {(7'h41), $unsigned((8'hb6))};
              reg36 <= {({(&$unsigned(wire6)), wire4} ^ $signed(reg38)),
                  $unsigned($unsigned((^~{wire30})))};
              reg37 <= ($unsigned(wire26[(1'h0):(1'h0)]) << (reg12[(3'h6):(3'h4)] && ($signed((-reg33)) >> (reg17[(1'h1):(1'h1)] <<< $unsigned(wire2)))));
              reg38 <= $signed({reg13[(1'h1):(1'h0)], reg32[(3'h7):(1'h0)]});
            end
          reg40 <= {$signed((8'hb5))};
        end
      else
        begin
          reg35 <= ($unsigned({reg20[(2'h3):(2'h2)], (8'ha6)}) ?
              $signed((^~$unsigned(reg37))) : $unsigned((+($signed(reg20) >= (^reg14)))));
          reg36 <= (wire1[(5'h14):(4'hc)] ?
              wire1[(4'h9):(4'h9)] : ($signed((^(wire27 ?
                  (8'hbe) : (8'hb6)))) > {$unsigned((wire27 ?
                      wire26 : wire6))}));
          reg37 <= (-{{(-(|wire1))}});
          reg38 <= $unsigned(($signed(reg10[(2'h2):(1'h0)]) & reg12));
        end
      reg41 <= ($unsigned(reg36) ? (~&reg14[(4'h8):(2'h2)]) : wire5);
      reg42 <= $signed($signed($unsigned(((reg13 ? reg16 : reg13) ?
          (~&reg40) : (reg20 ? wire6 : reg10)))));
    end
  assign wire43 = wire2;
endmodule
