module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h320):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
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
                 reg31,
                 reg30,
                 reg29,
                 reg28,
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
                 (1'h0)};
  assign wire5 = wire0[(1'h1):(1'h0)];
  assign wire6 = ((~^({(8'hb3), $unsigned(wire2)} ~^ $unsigned({wire1}))) ?
                     ($signed(({wire1} | $signed((8'ha9)))) ?
                         (8'hb4) : $signed(((~wire1) ?
                             {wire0, wire5} : wire1))) : (~&((8'hb4) ?
                         wire1[(3'h7):(2'h2)] : wire0)));
  assign wire7 = $unsigned(((!(~^$signed(wire2))) << wire2[(4'h9):(2'h3)]));
  assign wire8 = (~(|$signed((|$unsigned(wire5)))));
  always
    @(posedge clk) begin
      if ((~&wire3[(2'h3):(1'h1)]))
        begin
          if (((~wire5) ?
              (~|wire3[(2'h2):(2'h2)]) : ((($unsigned(wire6) < (wire1 ?
                  wire6 : wire0)) - $signed($signed((8'ha0)))) ~^ (^wire3[(1'h0):(1'h0)]))))
            begin
              reg9 <= (wire3[(2'h2):(1'h0)] > (~^{wire6[(3'h6):(3'h4)]}));
            end
          else
            begin
              reg9 <= ($signed(((wire7 ?
                      {(8'hb9), wire1} : (wire5 && reg9)) && wire1)) ?
                  wire3[(2'h2):(2'h2)] : $signed($signed($unsigned($unsigned(reg9)))));
            end
          reg10 <= $unsigned($unsigned(wire8));
          reg11 <= (&((wire6 >> (+wire5[(4'he):(2'h2)])) && (reg9 ?
              $unsigned($signed((8'hb7))) : reg10[(3'h4):(1'h1)])));
          reg12 <= (^~{(~^(~(~&wire4))), wire4[(3'h6):(3'h6)]});
        end
      else
        begin
          reg9 <= wire6[(1'h0):(1'h0)];
          if ($unsigned($signed((~((reg10 ? reg12 : wire3) ?
              $signed(wire7) : reg10)))))
            begin
              reg10 <= wire1;
              reg11 <= (~&((wire1[(4'he):(2'h2)] ^ ({wire5} ?
                  {wire0, wire7} : wire4)) >> (((wire7 >> wire1) ?
                  $unsigned(reg12) : reg11) >= $signed((wire6 ?
                  wire7 : wire4)))));
              reg12 <= reg12;
            end
          else
            begin
              reg10 <= (reg9[(5'h13):(5'h13)] <<< wire4);
              reg11 <= wire7;
            end
          reg13 <= reg10;
          reg14 <= wire2;
        end
      if (reg9)
        begin
          reg15 <= ($unsigned((+$signed(reg10))) ?
              $unsigned({$unsigned((reg11 ?
                      reg12 : wire5))}) : (+$signed(reg9)));
          if (reg10)
            begin
              reg16 <= wire6;
              reg17 <= (^$unsigned($signed(({reg15, wire2} + reg16))));
              reg18 <= wire3;
              reg19 <= (((~((^~wire1) >= reg12)) && ({(reg16 ?
                      reg14 : (8'ha7))} && (8'hb9))) < (&(reg9[(4'h9):(3'h7)] ?
                  $unsigned({wire1}) : reg16)));
            end
          else
            begin
              reg16 <= (-reg16[(4'h8):(1'h1)]);
              reg17 <= reg9[(1'h0):(1'h0)];
              reg18 <= (({reg16[(5'h12):(2'h3)]} ^ ($signed((reg18 || (8'hb2))) ^~ (~&(reg18 ?
                      wire3 : (8'h9d))))) ?
                  reg11 : (~^{$unsigned(wire7[(2'h2):(1'h0)]),
                      $unsigned(wire0[(1'h0):(1'h0)])}));
            end
          reg20 <= ((~&$signed($unsigned(reg17[(4'h8):(3'h7)]))) ~^ $signed(reg9));
          reg21 <= (reg20[(2'h3):(2'h3)] != reg11[(5'h11):(4'h9)]);
        end
      else
        begin
          reg15 <= wire8;
          reg16 <= $signed(($signed(wire7[(4'ha):(3'h6)]) == $signed(((wire3 || reg21) <= reg13[(3'h5):(2'h2)]))));
        end
      reg22 <= (8'hbe);
    end
  assign wire23 = $signed(reg13[(3'h5):(1'h1)]);
  assign wire24 = reg22;
  assign wire25 = ((((&wire3) ?
                          reg10[(4'h8):(3'h5)] : reg10) || (((wire7 && (8'hac)) & reg12) * {(reg19 ?
                              (8'hb2) : wire2)})) ?
                      (+$signed(reg19[(2'h3):(2'h3)])) : reg16);
  assign wire26 = $signed((({(wire0 ? wire23 : reg13),
                      (reg9 ? (8'hbb) : reg14)} <= {$signed(reg18),
                      wire5}) | (7'h42)));
  assign wire27 = (wire3 ?
                      $signed($signed((|(reg9 ? wire23 : wire8)))) : (8'ha3));
  always
    @(posedge clk) begin
      if (($signed(((!$signed(reg18)) - ((&(8'hb2)) >= {wire2,
          reg19}))) ^~ (&(wire23 > $unsigned(reg13)))))
        begin
          if (wire3)
            begin
              reg28 <= (^~(8'ha0));
              reg29 <= $signed(($signed(((&reg22) * (reg17 || wire27))) >= (-$unsigned((^~reg28)))));
            end
          else
            begin
              reg28 <= ({wire26[(1'h0):(1'h0)], $signed($signed((8'h9c)))} ?
                  $unsigned((-(~&{reg21}))) : $signed(wire25));
              reg29 <= reg18[(4'h9):(4'h9)];
              reg30 <= $signed(({$signed((wire24 * wire8)),
                  $unsigned((wire7 ? (8'ha0) : wire2))} | ((&(~|reg15)) ?
                  $unsigned({reg28}) : ((reg18 ? (8'hb0) : reg28) < reg16))));
            end
          reg31 <= $unsigned(($signed({reg9}) ?
              $unsigned(wire3[(3'h4):(2'h2)]) : $unsigned(((wire2 == wire6) > (reg17 + reg14)))));
        end
      else
        begin
          if ($unsigned(($unsigned(($unsigned(reg22) + {(8'hab), wire0})) ?
              $unsigned((((8'ha8) ? reg19 : (8'hb6)) ?
                  (wire7 < wire23) : wire8)) : $unsigned((!reg28[(4'ha):(4'h8)])))))
            begin
              reg28 <= wire23[(5'h12):(1'h0)];
              reg29 <= wire1[(4'hd):(1'h1)];
            end
          else
            begin
              reg28 <= {({$unsigned(reg17), $signed((^wire26))} ?
                      {((reg9 ? wire3 : wire3) != (~(7'h40))),
                          {(wire27 ? (8'ha9) : reg22)}} : $signed(((reg15 ?
                          reg18 : reg13) ^~ (reg16 ? wire3 : wire0))))};
              reg29 <= $unsigned(((^~((reg29 << reg14) != (8'hbd))) <<< (($signed(wire24) ^~ $unsigned(reg9)) ?
                  $signed(wire24[(4'hc):(3'h7)]) : ((reg10 | wire23) <<< (~(8'ha3))))));
            end
          reg30 <= reg29;
          reg31 <= (!(+(&(+reg10[(3'h7):(1'h0)]))));
          if ((~($unsigned(((reg20 || wire6) ?
              (-reg20) : {reg15})) & ((^(wire8 ? reg13 : reg17)) && (8'hbf)))))
            begin
              reg32 <= {$unsigned(wire3), (!reg9)};
              reg33 <= (8'hb4);
              reg34 <= $signed(reg17[(2'h3):(2'h3)]);
              reg35 <= (wire27[(4'h8):(3'h6)] > reg12);
            end
          else
            begin
              reg32 <= $signed(wire0);
            end
        end
      reg36 <= (~^$unsigned($unsigned($signed(wire1[(5'h10):(4'he)]))));
      reg37 <= $signed((reg19 ?
          $signed(wire6[(3'h6):(3'h4)]) : $signed($signed(reg20[(1'h1):(1'h1)]))));
      if (reg12)
        begin
          if ($unsigned(reg32[(4'h8):(1'h1)]))
            begin
              reg38 <= (-(wire2 >> ((8'hb4) ?
                  wire25[(3'h4):(3'h4)] : ((^~reg33) ?
                      $unsigned(reg30) : (wire6 ? wire26 : wire7)))));
              reg39 <= $signed((reg29 ?
                  {wire4} : $signed($signed(wire6[(4'h8):(3'h4)]))));
              reg40 <= $signed($signed(reg9[(2'h2):(1'h0)]));
              reg41 <= ($unsigned(wire1[(2'h3):(1'h1)]) >> ($unsigned((+$signed(reg12))) ?
                  ((!(reg33 ? wire6 : reg32)) ?
                      reg35[(1'h0):(1'h0)] : $signed($unsigned(wire0))) : ((reg12 && reg16) ?
                      (&wire2[(1'h1):(1'h1)]) : reg17)));
              reg42 <= {wire8, reg12[(1'h0):(1'h0)]};
            end
          else
            begin
              reg38 <= ($signed((-$unsigned((reg13 ? reg21 : reg16)))) ?
                  (|($unsigned($unsigned(reg41)) >> $signed($signed(wire27)))) : $signed((wire1[(1'h0):(1'h0)] - ((reg40 ?
                          (8'hb5) : reg15) ?
                      (reg13 + reg34) : (reg13 ? reg11 : (8'hb1))))));
              reg39 <= reg21[(4'hc):(3'h7)];
            end
          reg43 <= $signed($unsigned(reg36));
          reg44 <= $signed((|$signed($signed(wire24))));
        end
      else
        begin
          if ($unsigned(wire4))
            begin
              reg38 <= reg13[(2'h2):(1'h0)];
            end
          else
            begin
              reg38 <= reg35[(1'h0):(1'h0)];
              reg39 <= reg13[(2'h3):(1'h0)];
            end
          reg40 <= $unsigned((~&$signed(($signed(wire7) ?
              $unsigned(wire8) : (reg15 ? (8'ha7) : reg31)))));
        end
      reg45 <= {((8'h9c) | $signed(reg21))};
    end
  always
    @(posedge clk) begin
      reg46 <= $signed(reg16);
    end
  always
    @(posedge clk) begin
      reg47 <= $unsigned(reg10[(4'hf):(4'hb)]);
      if (reg33)
        begin
          reg48 <= ((-({$signed(wire1)} ?
                  (~|((8'hb5) ? (8'hb6) : reg12)) : $unsigned((reg21 ?
                      reg17 : reg32)))) ?
              reg43[(4'hf):(2'h3)] : reg22[(2'h2):(1'h1)]);
          reg49 <= reg38;
          reg50 <= (({$signed((^~reg38)),
              $unsigned((^reg42))} || (reg16[(4'he):(4'hb)] ?
              $signed(reg21) : ((wire27 | reg33) <<< wire27[(1'h1):(1'h1)]))) && wire6);
        end
      else
        begin
          reg48 <= reg41;
          reg49 <= (reg42[(4'hb):(3'h7)] ?
              $signed((&$unsigned(reg49[(5'h10):(1'h1)]))) : ({(8'ha4)} ?
                  (((reg14 ? reg49 : reg14) ?
                          (wire25 ? reg44 : reg14) : reg43) ?
                      reg9[(4'h9):(1'h1)] : $unsigned((reg49 && reg12))) : (+(^reg41))));
          if (($signed(reg16[(1'h0):(1'h0)]) ^ $unsigned((reg46[(1'h0):(1'h0)] < ((reg47 ?
              reg47 : reg50) ~^ wire25[(3'h4):(3'h4)])))))
            begin
              reg50 <= $signed(((!(~wire7[(1'h0):(1'h0)])) >= $signed(reg15[(4'hc):(1'h0)])));
            end
          else
            begin
              reg50 <= $unsigned({$signed($unsigned($unsigned(reg42)))});
              reg51 <= $unsigned(($unsigned($signed($unsigned(reg22))) ?
                  (reg36[(2'h2):(1'h0)] <<< (reg10[(4'he):(3'h4)] <= wire0)) : (^{{reg22,
                          reg45}})));
              reg52 <= {$unsigned($signed(((reg46 ? wire24 : reg46) ?
                      (wire3 | reg28) : (wire26 != (8'hb4)))))};
            end
          if ($unsigned(reg50))
            begin
              reg53 <= $unsigned($signed(reg29[(3'h6):(3'h6)]));
              reg54 <= ((((~(~|reg50)) ? $unsigned(wire8) : $signed((&wire6))) ?
                  (8'hb3) : ($unsigned(reg42[(4'h9):(2'h2)]) * reg22)) <= reg14[(2'h2):(1'h1)]);
              reg55 <= ((($signed(reg35[(1'h0):(1'h0)]) <<< (~|(wire24 ?
                      (8'hb1) : reg19))) ?
                  $signed((reg28 < $unsigned((8'hae)))) : $signed((+(8'hba)))) <<< reg31);
              reg56 <= (!{{wire27}, $unsigned(wire5[(3'h4):(2'h2)])});
              reg57 <= (8'h9c);
            end
          else
            begin
              reg53 <= reg30;
              reg54 <= reg55;
              reg55 <= ($unsigned($signed((~^$signed(reg43)))) - $signed(($signed($signed(reg39)) && $unsigned((-reg20)))));
              reg56 <= ({reg39} ?
                  $unsigned(((8'h9c) > (8'hac))) : wire26[(3'h6):(2'h3)]);
              reg57 <= {((~|wire27) >> (+(+reg22[(3'h5):(3'h4)])))};
            end
          if ({(-($signed($unsigned(wire7)) ?
                  $unsigned(wire23) : ($unsigned(wire4) ?
                      reg41[(3'h6):(2'h2)] : (^reg15)))),
              ((reg12[(2'h3):(2'h3)] | (wire1[(4'he):(4'hb)] ?
                  $unsigned(reg21) : reg40[(1'h0):(1'h0)])) ^~ $signed($signed($signed(reg50))))})
            begin
              reg58 <= $unsigned((reg42[(4'he):(3'h6)] + ($signed($signed(reg30)) - reg40)));
              reg59 <= {{$signed(((reg43 - reg17) ? $signed(wire4) : (-reg40))),
                      reg22},
                  (wire25 <<< (reg53 ? $unsigned((reg42 >>> reg21)) : reg20))};
              reg60 <= $signed((-($unsigned((~&wire5)) - $unsigned(reg33))));
              reg61 <= $unsigned(reg38);
            end
          else
            begin
              reg58 <= reg21;
              reg59 <= reg9;
              reg60 <= reg31;
              reg61 <= (({(^~reg16), $signed({reg35, reg48})} ?
                      reg48 : ($signed($unsigned(reg38)) << {$unsigned((8'ha7))})) ?
                  {(-$unsigned((reg42 ?
                          reg50 : reg9)))} : (^~(((reg16 & reg33) ?
                          wire8[(4'h8):(3'h5)] : reg43[(2'h2):(1'h0)]) ?
                      (reg53[(2'h3):(2'h3)] ? reg22 : (~|reg49)) : reg44)));
            end
        end
      if ($signed(($unsigned((reg42 > $unsigned(reg11))) ^~ $signed(reg34[(1'h0):(1'h0)]))))
        begin
          if (reg58[(5'h13):(1'h1)])
            begin
              reg62 <= (~^reg57[(3'h5):(2'h3)]);
              reg63 <= reg59;
              reg64 <= {reg20[(1'h1):(1'h0)]};
            end
          else
            begin
              reg62 <= (((wire25[(2'h2):(1'h1)] ?
                      ($unsigned(reg64) ?
                          (wire24 >= reg20) : reg47[(1'h0):(1'h0)]) : wire23[(5'h11):(4'h8)]) == ((|wire24) >= $unsigned((wire6 ?
                      reg52 : wire1)))) ?
                  $unsigned(($unsigned({wire4}) || {{reg14},
                      ((8'ha2) > (8'hb1))})) : ($signed(reg20[(2'h2):(1'h1)]) < $signed($unsigned($unsigned(reg15)))));
              reg63 <= reg45;
            end
        end
      else
        begin
          reg62 <= reg28[(4'hc):(3'h5)];
          reg63 <= ({(~|$unsigned((~wire27)))} ?
              ({(^~reg33[(4'hb):(2'h2)]), reg39[(5'h11):(2'h2)]} ?
                  wire7 : reg10) : $unsigned($unsigned(((8'hb9) & (wire27 != (8'ha3))))));
          reg64 <= $signed((~|reg51[(3'h4):(2'h3)]));
          if (reg12)
            begin
              reg65 <= ((reg40 ?
                  $signed(((-reg29) < reg60[(3'h6):(3'h5)])) : reg50) - (^~$unsigned((|$unsigned(reg52)))));
              reg66 <= ((~|($unsigned((8'h9f)) | $unsigned((~&reg17)))) ?
                  ($signed($signed({reg41})) ?
                      (~&wire2[(3'h5):(3'h5)]) : $unsigned($signed($unsigned(reg10)))) : reg39);
              reg67 <= (^(($unsigned($signed(reg49)) ?
                  $unsigned((&reg57)) : reg59[(1'h1):(1'h0)]) || (reg38[(4'h9):(1'h0)] ^~ (reg19[(4'hb):(4'h8)] <<< wire25[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg65 <= reg33;
            end
        end
    end
  assign wire68 = (($signed($signed((reg14 ? wire26 : reg57))) ?
                          $signed(reg10) : (wire6[(1'h1):(1'h1)] >> reg33[(2'h3):(2'h3)])) ?
                      (&$unsigned((-$unsigned(reg18)))) : {reg28,
                          ($signed(wire7) * (+$unsigned((8'hb5))))});
  assign wire69 = reg11;
  assign wire70 = $unsigned(((wire69 <= reg59[(1'h1):(1'h1)]) ?
                      (~&reg57) : {reg65}));
endmodule
