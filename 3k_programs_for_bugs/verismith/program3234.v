module top
#(parameter param173 = (|(8'hb0)), 
parameter param174 = (~^param173))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h335):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire172;
  wire [(4'ha):(1'h0)] wire171;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire169,
                 wire40,
                 wire39,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire0[(3'h4):(3'h4)] ?
          {($unsigned((|wire4)) >= wire1[(1'h0):(1'h0)]),
              wire2} : $signed($signed($signed(((7'h43) * wire4))))))
        begin
          if (wire2)
            begin
              reg5 <= wire3[(1'h1):(1'h1)];
              reg6 <= $unsigned($unsigned($signed((~&wire2[(3'h6):(3'h6)]))));
            end
          else
            begin
              reg5 <= (wire3[(1'h1):(1'h1)] < {reg6});
            end
          if (wire1)
            begin
              reg7 <= $unsigned(wire1);
              reg8 <= wire0;
            end
          else
            begin
              reg7 <= wire3;
              reg8 <= (|(^~$unsigned((~^{wire2}))));
              reg9 <= (($unsigned((^reg8[(2'h3):(2'h2)])) + reg5) ?
                  ((|wire1[(1'h0):(1'h0)]) ?
                      wire0[(2'h2):(2'h2)] : (^~(8'haa))) : ($signed({wire2,
                      reg7[(1'h1):(1'h0)]}) >>> ((~^wire0[(3'h4):(1'h1)]) ?
                      $unsigned((-reg6)) : $signed((|wire2)))));
            end
          reg10 <= $unsigned($unsigned(wire0[(1'h1):(1'h0)]));
        end
      else
        begin
          if (reg10)
            begin
              reg5 <= ($unsigned(($unsigned($signed((8'h9d))) ?
                      ((^(8'ha6)) != $signed(wire4)) : $signed($unsigned(wire4)))) ?
                  reg8 : wire0[(1'h1):(1'h0)]);
              reg6 <= ((((^~$signed((8'h9d))) || wire1) ?
                      $signed(wire3[(2'h2):(1'h0)]) : (~^(wire0[(2'h2):(2'h2)] >= wire1[(2'h2):(2'h2)]))) ?
                  wire1[(2'h2):(1'h1)] : wire2[(5'h12):(5'h12)]);
              reg7 <= $signed((reg10[(4'ha):(3'h6)] ?
                  $unsigned($unsigned({reg10, reg5})) : $unsigned({(wire3 ?
                          wire4 : reg8)})));
            end
          else
            begin
              reg5 <= (($unsigned({(reg7 + reg5)}) >= reg8[(4'hc):(3'h7)]) ?
                  $signed($signed({(wire1 <<< reg7)})) : {$unsigned(reg8[(5'h12):(4'hc)]),
                      ((-(wire4 && wire2)) ?
                          {$unsigned(reg9)} : $signed((wire2 ?
                              (8'ha9) : reg8)))});
              reg6 <= (&$unsigned((({reg7, reg10} ?
                  reg9 : {reg5, reg5}) ^~ $signed((8'haf)))));
              reg7 <= (~&$unsigned({({wire0} ? (^reg10) : (-reg8))}));
              reg8 <= wire0;
            end
          reg9 <= reg8;
          if (reg7)
            begin
              reg10 <= ((8'hba) ? wire2[(5'h12):(4'ha)] : wire4[(3'h6):(1'h0)]);
            end
          else
            begin
              reg10 <= reg9[(1'h0):(1'h0)];
              reg11 <= {wire3, wire0[(2'h2):(1'h1)]};
              reg12 <= reg11[(1'h1):(1'h1)];
              reg13 <= reg8;
            end
        end
      if ($unsigned(reg12[(3'h7):(2'h2)]))
        begin
          reg14 <= reg6[(1'h1):(1'h1)];
          reg15 <= {(-(wire4 ? $signed((^~reg5)) : wire3)),
              $unsigned({reg7[(1'h0):(1'h0)], reg7})};
          reg16 <= (-($unsigned(reg13[(4'hd):(3'h4)]) ?
              reg5[(3'h7):(3'h6)] : {$signed((reg10 <= reg9))}));
          if ($signed(reg5))
            begin
              reg17 <= wire4;
              reg18 <= ($unsigned($unsigned(((reg8 != reg8) ?
                  (^reg17) : $signed(reg17)))) + reg13[(3'h5):(2'h3)]);
              reg19 <= ($signed(reg15) ?
                  $signed({(+{reg18})}) : $unsigned($unsigned((~reg18[(3'h6):(1'h1)]))));
              reg20 <= ((|$signed(reg16[(3'h6):(2'h3)])) >>> wire2[(1'h0):(1'h0)]);
              reg21 <= reg5[(1'h0):(1'h0)];
            end
          else
            begin
              reg17 <= $unsigned($unsigned((~(((7'h42) ? reg10 : reg8) ?
                  (|reg13) : wire0))));
            end
        end
      else
        begin
          if ((^$signed($unsigned(wire2[(2'h3):(2'h3)]))))
            begin
              reg14 <= $unsigned(reg17[(1'h1):(1'h1)]);
              reg15 <= (wire4[(3'h4):(3'h4)] | reg5);
              reg16 <= $unsigned((~&(8'h9d)));
              reg17 <= $unsigned(reg14);
            end
          else
            begin
              reg14 <= {wire3[(2'h2):(1'h0)]};
              reg15 <= reg20[(4'hd):(2'h2)];
            end
          if ({($unsigned(((reg21 ? reg17 : reg9) >>> (reg12 ?
                  wire0 : wire2))) && reg8)})
            begin
              reg18 <= (reg10 >> reg5);
              reg19 <= $unsigned(reg7);
              reg20 <= reg13[(4'ha):(4'ha)];
              reg21 <= (reg18 ^~ (reg21 <<< reg19[(5'h10):(1'h0)]));
              reg22 <= $unsigned(reg18);
            end
          else
            begin
              reg18 <= reg19[(5'h13):(2'h3)];
              reg19 <= (($unsigned(($signed(wire3) <= (~&reg6))) ?
                      ({$signed(reg10)} ?
                          $signed(reg9) : (+(reg21 * reg13))) : $signed((~&(reg14 ?
                          (8'ha0) : reg13)))) ?
                  (8'hb7) : $unsigned(($unsigned($unsigned(wire3)) < $signed($unsigned(reg15)))));
              reg20 <= wire1[(2'h2):(1'h0)];
              reg21 <= $signed(({reg10,
                  $signed(reg17[(1'h1):(1'h0)])} == $signed(($signed(reg9) <<< (reg16 ?
                  reg13 : reg6)))));
            end
          reg23 <= ($signed($unsigned({wire3})) >= {($signed(reg13) ^~ $unsigned($signed(reg16)))});
          reg24 <= $unsigned($signed((~|(wire1 ?
              $unsigned(reg8) : ((8'hb9) ^ wire1)))));
          reg25 <= ($signed((wire4[(2'h3):(1'h0)] | {reg22[(1'h0):(1'h0)],
                  (reg8 * reg24)})) ?
              ((&reg23[(2'h2):(1'h1)]) || {($unsigned(reg16) ?
                      reg17[(2'h3):(1'h1)] : (wire0 == wire3))}) : reg20[(3'h4):(3'h4)]);
        end
      if ($signed((reg18 ?
          reg23[(4'hc):(3'h5)] : $unsigned($unsigned((reg25 - reg14))))))
        begin
          reg26 <= $signed((((|$signed(reg23)) ?
              $unsigned(reg22) : reg13[(4'hb):(4'h9)]) == ($signed(reg22[(2'h2):(1'h0)]) ~^ wire2[(4'h8):(3'h4)])));
          if (wire0)
            begin
              reg27 <= {{(reg7 ?
                          ({reg8} ?
                              $signed(reg14) : (reg8 > reg8)) : reg24[(4'h8):(3'h4)])},
                  $unsigned((((reg17 >> reg7) >> (wire3 == reg18)) << $signed($unsigned(reg22))))};
              reg28 <= $signed($signed((((!reg14) ?
                  reg26 : reg7) <= $signed($signed((8'hae))))));
              reg29 <= reg28;
            end
          else
            begin
              reg27 <= {$unsigned((!$signed(reg7[(1'h0):(1'h0)])))};
              reg28 <= $signed($signed(reg16));
              reg29 <= (&reg10);
            end
          reg30 <= (($signed({$unsigned(reg21),
                  reg16}) >= (wire3[(1'h0):(1'h0)] <= (^~((8'h9f) ?
                  reg9 : reg15)))) ?
              (8'ha1) : (8'ha8));
          reg31 <= $signed($unsigned((~&wire2)));
          if ($unsigned((((wire2 ? reg7 : $signed(reg9)) ?
                  {reg17[(1'h0):(1'h0)], wire4} : reg24[(4'h9):(3'h6)]) ?
              (|reg8[(3'h7):(1'h0)]) : (^~((|reg17) >>> $unsigned(reg20))))))
            begin
              reg32 <= reg7[(2'h2):(2'h2)];
              reg33 <= $unsigned(reg19);
              reg34 <= {(~^$unsigned(($signed((7'h40)) ?
                      reg27 : reg24[(4'h8):(3'h6)])))};
            end
          else
            begin
              reg32 <= $signed($signed({reg25,
                  $signed((reg15 ? (7'h41) : reg11))}));
              reg33 <= ((^$unsigned((8'h9c))) ?
                  $signed(reg11[(2'h2):(1'h0)]) : (+(~$signed($unsigned(reg21)))));
              reg34 <= (~$signed($signed(reg14)));
              reg35 <= reg11;
              reg36 <= $signed($unsigned(reg27));
            end
        end
      else
        begin
          if (($signed($signed(wire0)) ?
              $unsigned((8'ha0)) : {($signed({reg8,
                      (8'ha5)}) ^ (&$signed(reg35)))}))
            begin
              reg26 <= $signed($signed(reg24));
              reg27 <= ((+$unsigned((8'had))) < ($unsigned((reg30 | (reg32 ?
                      reg6 : (7'h42)))) ?
                  (8'hb0) : ($signed((|wire1)) && ((reg27 ^~ reg36) ?
                      (reg13 ? reg30 : (8'ha2)) : $unsigned(reg11)))));
              reg28 <= $signed($unsigned($signed(((reg31 ?
                  reg28 : reg22) - (~|reg27)))));
              reg29 <= ($signed($unsigned($unsigned(reg35))) >> $unsigned($signed($unsigned(reg16[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg26 <= $signed(reg33);
              reg27 <= reg26[(3'h7):(2'h3)];
              reg28 <= (reg17[(2'h2):(2'h2)] <= {(!reg26),
                  (~^$signed((reg31 <= reg35)))});
              reg29 <= ({($unsigned(reg33[(1'h1):(1'h1)]) ^ ((wire3 + reg31) >= reg17))} ^~ (reg25[(3'h6):(3'h4)] == $unsigned((7'h41))));
              reg30 <= ($unsigned($unsigned((&{reg35, (8'hb4)}))) ^ reg29);
            end
          reg31 <= reg10;
        end
      reg37 <= reg25[(1'h1):(1'h1)];
      reg38 <= ((^~{reg8}) <<< $unsigned((wire4[(3'h5):(2'h2)] ?
          reg17 : (-((8'ha1) ? reg17 : (8'hbe))))));
    end
  assign wire39 = (reg31[(1'h1):(1'h1)] ?
                      ((8'hac) != ((reg37[(4'h8):(1'h1)] < (&reg26)) ?
                          reg21 : (-$signed(reg34)))) : reg14[(4'ha):(4'h9)]);
  assign wire40 = $unsigned((reg13 && (8'h9f)));
  always
    @(posedge clk) begin
      if ({reg34})
        begin
          reg41 <= reg8[(3'h4):(2'h2)];
          reg42 <= (~&{reg15, reg24[(2'h3):(1'h1)]});
        end
      else
        begin
          reg41 <= reg14;
          if ((($unsigned(($unsigned(reg32) ?
                  (-reg15) : (reg32 ? reg20 : wire4))) ^ wire3[(1'h0):(1'h0)]) ?
              ($signed(reg38) ?
                  (($signed(reg31) ? (~reg11) : wire2[(1'h1):(1'h0)]) ?
                      (!(reg26 ? wire3 : reg18)) : (!(reg33 ?
                          reg33 : reg32))) : $signed(reg17)) : $unsigned(reg26[(2'h2):(1'h0)])))
            begin
              reg42 <= reg22[(2'h3):(2'h3)];
              reg43 <= (-$unsigned($unsigned(((!(8'hb2)) ^~ ((8'ha3) - (7'h43))))));
              reg44 <= reg12[(3'h5):(1'h0)];
              reg45 <= $unsigned((($signed(((8'h9c) ?
                  reg44 : reg23)) >= reg43[(4'hc):(3'h7)]) < reg21[(4'hf):(3'h7)]));
            end
          else
            begin
              reg42 <= (wire3 != {$unsigned((((8'ha5) >> reg30) ?
                      $unsigned(reg10) : $unsigned(reg31)))});
              reg43 <= (^$signed(($signed((reg42 ?
                  wire3 : (8'hb2))) && ((reg45 - wire2) <= wire2[(5'h14):(4'h8)]))));
            end
        end
      if ($signed(($unsigned(reg28[(1'h0):(1'h0)]) ?
          reg14 : ((+reg21) ?
              wire0[(1'h1):(1'h1)] : ((~|reg42) ?
                  (wire39 ^~ reg14) : $signed(reg10))))))
        begin
          reg46 <= (&reg9);
          if ((($signed((|(&reg14))) ?
                  $unsigned(reg44[(3'h7):(3'h4)]) : ((reg33 > {reg44}) >> reg43[(4'hf):(4'hd)])) ?
              reg19[(5'h10):(3'h7)] : $signed(reg21)))
            begin
              reg47 <= reg11[(3'h4):(1'h1)];
              reg48 <= $unsigned($signed(((reg27[(2'h3):(2'h3)] ?
                  $unsigned(reg37) : (reg13 <= reg19)) + {wire1})));
              reg49 <= (8'ha2);
              reg50 <= $unsigned((+$unsigned(($unsigned(reg5) ?
                  (reg26 - reg44) : (8'hbf)))));
              reg51 <= $unsigned({$signed((reg50[(2'h3):(1'h1)] >= (reg26 ?
                      reg35 : reg30)))});
            end
          else
            begin
              reg47 <= ($unsigned($unsigned((^$unsigned(wire3)))) >>> $unsigned((-$unsigned((reg8 ?
                  wire3 : reg26)))));
              reg48 <= reg10[(4'h8):(2'h2)];
            end
          if ($unsigned(reg25))
            begin
              reg52 <= (~&$unsigned(reg23[(3'h6):(1'h1)]));
              reg53 <= reg52[(1'h0):(1'h0)];
            end
          else
            begin
              reg52 <= (reg19 + (!(~^((reg47 < reg17) ? (&reg5) : (|reg23)))));
              reg53 <= (!$unsigned((|reg13)));
              reg54 <= {reg51};
              reg55 <= $signed((&($signed($unsigned(wire0)) | reg25[(4'ha):(2'h3)])));
            end
          reg56 <= $signed(((~(!(reg34 ? reg13 : reg28))) ?
              (reg54 ?
                  reg36 : {((8'ha6) ? reg19 : (8'hb4))}) : $signed((((7'h42) ?
                      reg37 : reg37) ?
                  wire2 : (~&reg53)))));
          reg57 <= ((~^({(-reg33), reg15} ? $signed($unsigned(reg5)) : reg14)) ?
              reg32[(4'h8):(2'h2)] : {(&($unsigned(reg33) ?
                      (~^(8'ha0)) : $unsigned(reg41))),
                  $signed($signed((reg29 <<< reg15)))});
        end
      else
        begin
          reg46 <= {$signed(reg29),
              $unsigned((reg47[(1'h1):(1'h0)] || $unsigned({reg54, reg14})))};
          reg47 <= $unsigned($unsigned(wire3));
          if ({$unsigned(wire0[(1'h1):(1'h1)]),
              $signed($unsigned(wire39[(3'h5):(2'h3)]))})
            begin
              reg48 <= (~|($unsigned(($signed(reg7) ?
                  reg29 : (|reg32))) ^~ $unsigned({$unsigned((7'h43)),
                  wire3})));
            end
          else
            begin
              reg48 <= $signed($unsigned($signed({$unsigned(reg28)})));
              reg49 <= $unsigned(reg49);
            end
        end
      if (reg49)
        begin
          reg58 <= $signed((~&$unsigned(((~^(8'ha6)) ?
              $unsigned(reg27) : (~^reg41)))));
          if (reg18[(2'h3):(1'h1)])
            begin
              reg59 <= $signed(reg53[(1'h0):(1'h0)]);
              reg60 <= reg15;
              reg61 <= (reg34[(3'h4):(3'h4)] ^~ reg28[(2'h2):(1'h1)]);
            end
          else
            begin
              reg59 <= (7'h41);
              reg60 <= reg25;
            end
          if ({$signed((reg49[(3'h7):(3'h5)] ~^ $unsigned((~|reg14))))})
            begin
              reg62 <= reg41;
              reg63 <= (wire1 == (^($signed(reg38[(3'h5):(2'h3)]) ?
                  $unsigned(reg22[(2'h2):(2'h2)]) : ((~^reg36) ?
                      (reg47 <= reg13) : (&reg11)))));
              reg64 <= $unsigned((~|reg10));
            end
          else
            begin
              reg62 <= {$signed($signed(($unsigned(reg54) ?
                      (wire0 < wire1) : reg56[(4'h9):(3'h6)]))),
                  {reg31}};
            end
          reg65 <= (^reg16);
        end
      else
        begin
          reg58 <= ((&$signed(((~&reg57) ?
              $unsigned((8'ha0)) : reg27[(4'he):(3'h6)]))) | $unsigned(($unsigned({reg56}) ?
              (-$unsigned((8'hab))) : (+$signed(reg18)))));
          if ((~|(~^(wire2 >= $signed(reg9[(2'h3):(1'h1)])))))
            begin
              reg59 <= reg24;
              reg60 <= {$unsigned($unsigned(($signed(reg55) ?
                      {reg26, reg26} : reg37[(2'h3):(1'h1)])))};
              reg61 <= $signed($unsigned(((reg63 <<< $signed(wire2)) >>> $unsigned((reg34 >>> reg43)))));
            end
          else
            begin
              reg59 <= wire0;
            end
          reg62 <= $unsigned(($unsigned((^~reg13[(4'hb):(4'ha)])) | {$signed($signed(wire3)),
              $signed(reg41[(4'ha):(1'h1)])}));
        end
      reg66 <= {$unsigned($signed(((^~wire39) ? reg21 : $unsigned(reg31))))};
      reg67 <= reg54;
    end
  module68 #() modinst170 (wire169, clk, reg32, reg51, reg61, reg46, reg9);
  assign wire171 = wire0;
  assign wire172 = $signed((~&(7'h40)));
endmodule

module module68
#(parameter param168 = (((~|(~^{(7'h44), (8'hb5)})) & ((^((8'haf) < (8'ha0))) & (((8'hbd) ? (8'hbe) : (8'hb9)) ? ((8'haf) ? (8'had) : (8'ha0)) : ((8'h9c) ? (8'ha8) : (8'ha9))))) != {(((^(7'h40)) ? (^~(8'ha4)) : {(8'ha7)}) >>> (+((8'h9c) && (7'h43)))), (~^({(8'h9e), (7'h41)} != (8'ha6)))}))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire [(5'h13):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire [(4'hc):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire147;
  wire [(4'h8):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire76;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire74;
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg161 = (1'h0);
  reg [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  assign y = {wire157,
                 wire147,
                 wire144,
                 wire142,
                 wire94,
                 wire76,
                 wire75,
                 wire74,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg146,
                 reg145,
                 (1'h0)};
  assign wire74 = wire70[(1'h0):(1'h0)];
  assign wire75 = wire74;
  assign wire76 = {{$unsigned(wire75), (|wire71[(3'h5):(1'h1)])}, wire69};
  module77 #() modinst95 (wire94, clk, wire70, wire76, wire71, wire69);
  module96 #() modinst143 (.wire98(wire71), .wire97(wire72), .clk(clk), .wire100(wire74), .wire99(wire76), .y(wire142));
  assign wire144 = wire94;
  always
    @(posedge clk) begin
      reg145 <= $signed(($signed(({wire74} ?
          (&wire70) : wire71)) >>> $signed((+{wire70}))));
      reg146 <= (8'ha4);
    end
  assign wire147 = $signed(wire76[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg148 <= wire76;
      reg149 <= {(({(wire147 ? wire70 : wire71),
                  $signed(wire71)} ^~ (reg145 <<< (reg148 ?
                  wire73 : (8'hac)))) ?
              $signed($signed($unsigned(wire70))) : wire76[(4'he):(2'h2)])};
      if (wire75[(2'h2):(1'h1)])
        begin
          reg150 <= wire147[(2'h3):(1'h1)];
          if ((8'hb1))
            begin
              reg151 <= ($signed((&(~|$unsigned(reg148)))) == reg148[(3'h7):(1'h0)]);
            end
          else
            begin
              reg151 <= wire147[(2'h3):(2'h2)];
              reg152 <= (^~(8'hb5));
              reg153 <= $signed($signed({(&(wire69 || reg151)), {reg145}}));
            end
          reg154 <= $unsigned(wire69);
        end
      else
        begin
          reg150 <= reg151;
          reg151 <= $signed(($signed(($unsigned(reg149) & reg153)) + $unsigned($unsigned($signed((8'h9f))))));
          reg152 <= {(wire75[(1'h1):(1'h0)] <= ((~&wire76) ?
                  $signed($unsigned(wire147)) : (|$signed(wire76)))),
              reg146};
          reg153 <= (reg149[(1'h1):(1'h1)] ?
              (^~reg153) : ((($signed((8'hbc)) ?
                      $unsigned(reg152) : (reg146 ?
                          (8'hb3) : (8'ha9))) != (~^(wire144 >>> reg154))) ?
                  (~&wire73) : (-wire72[(5'h10):(4'ha)])));
        end
      reg155 <= {((((wire76 ? reg148 : reg145) ?
                  wire70 : $unsigned(wire147)) & $unsigned((&reg150))) ?
              ((~&(8'hac)) + $unsigned((wire76 ^~ wire142))) : (~(wire147[(4'h8):(2'h3)] ?
                  (wire144 ? reg150 : reg146) : (~^(8'ha6)))))};
      reg156 <= $signed($signed(((8'hbb) >= ($signed((8'hba)) << wire142[(3'h5):(3'h4)]))));
    end
  assign wire157 = (^(~^$unsigned((~|(wire94 ? wire147 : wire71)))));
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire73) + (8'hb9))))
        begin
          reg158 <= wire70[(2'h3):(2'h3)];
          if ($signed($unsigned(((~|(-(8'hb1))) ?
              (~&(~|wire144)) : {wire147[(4'h8):(4'h8)]}))))
            begin
              reg159 <= wire76;
              reg160 <= (!$signed($unsigned($unsigned(wire157))));
            end
          else
            begin
              reg159 <= wire144;
              reg160 <= $unsigned((reg148 ? reg156 : reg160));
              reg161 <= $unsigned($signed((reg153 ? (7'h42) : (~^(-wire142)))));
            end
          reg162 <= ((wire70[(4'hb):(2'h2)] ?
              wire94 : (-$unsigned(wire157))) << $signed(wire147));
          if (reg146)
            begin
              reg163 <= (((~^reg151) ?
                      (!$unsigned(reg153[(3'h6):(1'h0)])) : ($signed((wire73 || (8'haa))) ?
                          reg159[(1'h0):(1'h0)] : (!(reg162 - wire144)))) ?
                  reg150[(1'h1):(1'h1)] : wire71[(3'h7):(2'h3)]);
              reg164 <= (reg158 ?
                  reg162 : ((($signed(reg148) < $unsigned((7'h44))) >= (^reg155)) ?
                      reg158 : $signed(((~&(8'hab)) <= ((8'haa) ?
                          (8'ha3) : reg152)))));
              reg165 <= (wire142[(1'h0):(1'h0)] >> (8'hbd));
              reg166 <= $signed($signed((reg156 ?
                  (~(+reg164)) : $unsigned(reg148))));
            end
          else
            begin
              reg163 <= $unsigned((($unsigned(reg148[(4'h8):(2'h2)]) ?
                  $signed((reg161 ?
                      (8'ha2) : reg151)) : $signed($unsigned(reg145))) > reg154));
              reg164 <= (&({$signed(reg156)} ?
                  ({((8'h9c) ?
                          reg160 : wire144)} <= $unsigned($unsigned((7'h41)))) : (&reg158[(4'he):(2'h3)])));
              reg165 <= (((reg165[(4'h8):(1'h1)] * (~|(wire142 <= wire76))) != {($unsigned(wire71) ^~ {reg161,
                      reg165})}) ^ $unsigned((&$signed(wire157))));
            end
        end
      else
        begin
          reg158 <= $signed(reg159[(2'h3):(2'h2)]);
          reg159 <= ($signed(reg156[(3'h7):(2'h2)]) ?
              $signed($signed((8'hbe))) : ((~^$unsigned(((8'ha4) != reg152))) + (((reg160 + (8'ha7)) ?
                      {(8'ha1), (8'hb7)} : reg153) ?
                  wire142[(4'h8):(1'h1)] : (8'hb5))));
          reg160 <= (~wire69[(3'h5):(2'h2)]);
          reg161 <= reg146[(4'hc):(1'h0)];
          if (reg155)
            begin
              reg162 <= (~^((((wire74 ^~ wire69) ^ $signed(wire94)) <<< ($signed(reg156) ?
                  $signed(wire147) : {reg156, (8'ha8)})) == wire94));
              reg163 <= (8'ha0);
              reg164 <= $unsigned($unsigned((((~|wire71) >> $signed(reg163)) ?
                  ((wire72 ? reg153 : reg152) ?
                      $signed(wire94) : $signed(reg145)) : {(!wire71)})));
              reg165 <= (({{(reg164 ? wire74 : reg162), wire76},
                  reg154} ^ $unsigned({$unsigned(reg148)})) ^ (&(8'hb5)));
            end
          else
            begin
              reg162 <= wire71[(4'h9):(2'h3)];
            end
        end
      reg167 <= $unsigned($unsigned((8'ha8)));
    end
endmodule

module module96
#(parameter param141 = {{(({(8'hac)} ? ((8'ha2) ? (8'hbb) : (8'hae)) : (8'hb7)) ? ((~(8'hb9)) <= (|(8'hb5))) : ((|(7'h40)) | ((8'hab) ? (8'haf) : (8'h9c))))}, (~&((^~((8'h9c) <<< (8'h9e))) ? {((8'h9c) ? (8'hb6) : (8'hb8)), ((8'haa) ? (8'hbd) : (8'had))} : (((7'h40) + (8'ha5)) ? (^~(8'ha7)) : (^(8'ha5)))))})
(y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire100;
  input wire [(4'hf):(1'h0)] wire99;
  input wire signed [(3'h7):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(4'hf):(1'h0)] wire139;
  wire [(4'ha):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(5'h12):(1'h0)] wire136;
  wire [(4'h9):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(3'h6):(1'h0)] wire113;
  wire signed [(4'hc):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire signed [(4'hc):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire101;
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire106,
                 wire101,
                 reg135,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg108,
                 reg107,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire101 = wire100[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg102 <= (&{wire101, wire99});
      reg103 <= $signed((wire99 << {($signed(wire100) - (~|wire100))}));
      reg104 <= (~|($unsigned(($signed(wire100) ?
              $signed(wire98) : (^wire97))) ?
          (~(~&(8'ha8))) : (wire100[(4'hd):(4'h9)] < $signed((|reg102)))));
      reg105 <= $signed((($unsigned($signed(wire98)) ?
          $signed((!wire101)) : {{wire101},
              (reg102 == reg104)}) < $signed($signed($signed(reg104)))));
    end
  assign wire106 = (&$unsigned(((^wire99[(4'hd):(1'h0)]) < (wire100 >> $unsigned(reg104)))));
  always
    @(posedge clk) begin
      reg107 <= reg102;
      reg108 <= (^~$signed({wire99[(3'h7):(3'h6)]}));
    end
  assign wire109 = ($signed($unsigned((7'h41))) ?
                       $signed((reg105[(3'h6):(3'h6)] - (wire106[(2'h2):(1'h1)] ^~ {wire106}))) : {reg108[(3'h7):(3'h5)]});
  assign wire110 = wire109;
  assign wire111 = wire110;
  assign wire112 = wire110;
  assign wire113 = wire109[(3'h6):(3'h5)];
  assign wire114 = ((($unsigned((~|wire99)) <= wire109[(4'hd):(1'h0)]) ^~ $unsigned($unsigned({wire97,
                           reg103}))) ?
                       wire106[(1'h0):(1'h0)] : $signed(wire106));
  assign wire115 = ((($signed($unsigned(wire114)) < (~^$signed(reg108))) & $signed($unsigned(((8'hbf) ?
                           wire97 : wire100)))) ?
                       (^((-(wire99 <<< wire114)) ?
                           $signed($signed((8'ha4))) : ((wire100 ?
                               wire97 : (8'hbd)) <= $signed(reg108)))) : $signed($unsigned($unsigned($signed(wire114)))));
  assign wire116 = $unsigned({reg102[(3'h4):(2'h3)],
                       (~|$unsigned($signed(wire112)))});
  assign wire117 = (wire111[(1'h1):(1'h0)] - (((reg102[(3'h7):(3'h4)] ?
                       (wire111 ?
                           wire114 : wire98) : $signed((8'ha3))) || $signed(((8'hb0) ?
                       wire111 : wire106))) & ($unsigned(reg102[(1'h0):(1'h0)]) >= $unsigned(wire106))));
  assign wire118 = reg105;
  always
    @(posedge clk) begin
      if (reg107[(5'h10):(2'h2)])
        begin
          reg119 <= $unsigned(($signed(($signed(wire117) <<< $unsigned((8'h9e)))) || (-(~^$unsigned(wire100)))));
          reg120 <= ((($unsigned(wire111) ?
                      ((&wire98) ?
                          $unsigned(wire111) : (~&wire110)) : (~|wire100)) ?
                  reg107[(2'h3):(1'h1)] : {reg107[(5'h10):(1'h1)],
                      (wire110[(4'h8):(3'h4)] ?
                          (wire112 + wire109) : {wire113})}) ?
              wire115 : (^~{wire101[(1'h1):(1'h1)]}));
          reg121 <= $signed(wire99[(4'h9):(2'h2)]);
          reg122 <= (wire112 << (wire115[(1'h1):(1'h1)] ^ (|$unsigned($signed(wire116)))));
          reg123 <= $signed($signed((!$unsigned($unsigned(wire100)))));
        end
      else
        begin
          reg119 <= (~wire106[(1'h1):(1'h0)]);
        end
      reg124 <= wire113[(3'h5):(1'h0)];
      reg125 <= {(+(reg121[(2'h2):(1'h1)] ?
              $signed({wire110}) : (wire114 > (wire118 ? wire101 : (8'h9e)))))};
      reg126 <= ((((reg104 ?
                  (8'hb7) : $unsigned(wire115)) < wire111[(2'h2):(1'h0)]) ?
              (8'hae) : {$signed((reg102 ? reg108 : (8'hb4)))}) ?
          ({wire100,
              $signed({wire116})} >>> $signed((!$signed(wire117)))) : ($unsigned(reg125) >> (~(~^$signed((8'hb1))))));
      if ((~($unsigned((~|$signed((8'hb6)))) ?
          {$signed((reg125 ?
                  wire100 : reg124))} : $signed({$signed(wire106)}))))
        begin
          if ((({wire110[(2'h2):(1'h0)]} ?
                  ((^~$unsigned(reg126)) ~^ wire106) : (~|(+wire117))) ?
              wire110 : $unsigned($signed($signed((wire113 ^ reg104))))))
            begin
              reg127 <= (($unsigned($signed($signed(wire106))) <= (((~^wire109) ?
                      wire112[(2'h3):(1'h1)] : (reg119 ? reg102 : wire114)) ?
                  wire115[(3'h5):(3'h4)] : wire118[(4'hb):(4'ha)])) ^ $signed(wire115));
              reg128 <= ($signed(((wire113 ? $unsigned((8'hbe)) : reg121) ?
                  $signed({reg108,
                      wire99}) : wire111)) - reg121[(4'hc):(4'ha)]);
              reg129 <= wire111[(1'h1):(1'h1)];
              reg130 <= $signed((wire106 >> $signed(wire118)));
              reg131 <= ($unsigned((reg103 ?
                  $signed((reg120 ?
                      (8'h9e) : wire117)) : $signed(wire97[(1'h1):(1'h1)]))) <= (^~reg123));
            end
          else
            begin
              reg127 <= $signed((~^reg120[(2'h2):(1'h0)]));
            end
          reg132 <= {{(~$unsigned({reg105}))}};
        end
      else
        begin
          reg127 <= wire97;
          if ($signed((wire98[(3'h4):(2'h3)] * {$unsigned($unsigned(wire112))})))
            begin
              reg128 <= ($signed($unsigned(wire111[(1'h1):(1'h1)])) ?
                  ({wire117[(2'h2):(1'h1)],
                      (wire115[(3'h4):(2'h3)] ?
                          $unsigned(reg126) : ((8'hbd) + (8'ha4)))} ^~ wire101) : ($signed(((wire101 ?
                              (8'hbf) : (7'h41)) ?
                          (wire101 ?
                              reg132 : reg103) : wire114[(3'h6):(2'h2)])) ?
                      {(wire110[(4'ha):(3'h4)] > reg132[(1'h0):(1'h0)])} : ($signed((~wire100)) ?
                          $signed(wire97) : (~^reg130[(5'h10):(2'h3)]))));
              reg129 <= (-{reg120});
              reg130 <= (8'hb9);
              reg131 <= (^~(($signed($unsigned(reg102)) ?
                      reg130[(2'h2):(1'h0)] : $unsigned(reg108[(3'h6):(3'h4)])) ?
                  (|wire111) : $unsigned(($signed(wire98) ?
                      wire116[(3'h5):(2'h3)] : ((8'ha2) ^ reg131)))));
              reg132 <= (~&(+{$unsigned((~wire101))}));
            end
          else
            begin
              reg128 <= $signed($signed(reg126[(2'h3):(2'h2)]));
            end
          reg133 <= (!(wire114 >= $unsigned(reg122[(2'h3):(2'h3)])));
        end
    end
  assign wire134 = (-$unsigned({(reg130 ?
                           $unsigned((8'hb3)) : $signed(reg125))}));
  always
    @(posedge clk) begin
      reg135 <= reg133[(2'h3):(2'h2)];
    end
  assign wire136 = wire110;
  assign wire137 = (8'ha3);
  assign wire138 = ((reg108 ?
                       ((8'ha9) ~^ $unsigned({reg119})) : wire109) || wire117);
  assign wire139 = $signed(reg102[(2'h2):(1'h0)]);
  assign wire140 = (reg125 >= {wire118});
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire81;
  input wire signed [(5'h14):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(4'hb):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 (1'h0)};
  assign wire82 = $unsigned((|$signed($unsigned((^wire79)))));
  assign wire83 = {($signed($signed((+(8'hae)))) ^ wire81)};
  assign wire84 = $unsigned(wire83);
  assign wire85 = {(wire80[(3'h6):(1'h0)] ?
                          (~wire80) : ({(~wire82)} ?
                              wire82 : (((8'hac) ?
                                  wire79 : wire79) ~^ (8'hb3))))};
  assign wire86 = ($unsigned((+$signed(wire84[(1'h1):(1'h1)]))) ~^ (($unsigned((wire78 ?
                              wire81 : (7'h44))) ?
                          ($signed((8'hb5)) ?
                              (wire79 ?
                                  wire82 : wire81) : (~|wire82)) : wire78[(1'h0):(1'h0)]) ?
                      $signed(((&wire81) ~^ (wire80 < wire81))) : wire78[(3'h4):(2'h3)]));
  assign wire87 = ((-($unsigned((wire86 & wire80)) ?
                      (8'haf) : ((wire81 ? (8'ha2) : wire85) ?
                          wire79 : $unsigned(wire83)))) >= wire85[(4'ha):(1'h0)]);
  assign wire88 = wire83;
  assign wire89 = (+$signed((8'hbe)));
  assign wire90 = wire86[(1'h0):(1'h0)];
  assign wire91 = wire79[(1'h0):(1'h0)];
  assign wire92 = wire90;
  assign wire93 = (wire84[(2'h3):(1'h0)] >>> ({{$unsigned((8'ha1))}} ?
                      (~|(+(~&wire89))) : ((+$unsigned(wire83)) <<< {$signed(wire87)})));
endmodule
