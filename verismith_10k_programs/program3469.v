module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire25,
                 wire24,
                 wire23,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg27,
                 reg26,
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
                 (1'h0)};
  assign wire4 = ((8'hb5) != (~^wire0[(4'h9):(1'h0)]));
  assign wire5 = ((~(wire3 ?
                         {(wire1 > wire3)} : $unsigned(wire2[(1'h0):(1'h0)]))) ?
                     $unsigned((^($unsigned(wire3) ?
                         {wire0} : $unsigned(wire2)))) : ((+($unsigned(wire4) ?
                         wire3[(1'h0):(1'h0)] : (wire2 ?
                             wire1 : wire2))) <<< ((^~(wire1 ?
                         (8'hb4) : wire1)) & {(+wire4), $unsigned((8'had))})));
  assign wire6 = wire4[(2'h2):(1'h0)];
  assign wire7 = (($unsigned((wire4[(3'h5):(1'h1)] < ((8'hb8) || wire4))) != wire0[(5'h12):(5'h12)]) >= $unsigned(((wire4 ?
                     $signed(wire0) : $unsigned(wire2)) >>> (wire6 - ((8'h9e) & wire4)))));
  always
    @(posedge clk) begin
      reg8 <= ($unsigned((8'hbe)) ?
          $signed({(8'ha9), $unsigned(wire4[(3'h4):(1'h0)])}) : (8'hab));
      if (($unsigned($unsigned((wire3[(3'h6):(1'h0)] ?
              {wire5} : $signed(wire5)))) ?
          $signed($signed((wire3 ?
              (wire7 ?
                  (8'hb6) : wire7) : wire7))) : $unsigned($signed($unsigned((7'h44))))))
        begin
          reg9 <= $signed(reg8);
          if ($signed(wire7[(1'h1):(1'h0)]))
            begin
              reg10 <= $unsigned($signed(({$signed(wire2),
                      (reg9 ? wire6 : (8'haa))} ?
                  ((+(8'ha1)) ? (8'hbb) : $signed(reg9)) : $signed({wire0,
                      wire3}))));
            end
          else
            begin
              reg10 <= {wire3, wire7};
              reg11 <= ({(-wire6)} >> (reg8[(1'h1):(1'h1)] ?
                  (~&(wire0 ?
                      $unsigned(wire6) : reg8[(2'h2):(2'h2)])) : {$signed($unsigned(wire2))}));
              reg12 <= reg11[(2'h3):(1'h1)];
            end
          reg13 <= (^~$signed(wire6[(4'h9):(3'h7)]));
          if ({(~&(8'ha0))})
            begin
              reg14 <= reg8;
              reg15 <= ((~wire1) || ($unsigned((+(reg10 >> wire1))) ?
                  $unsigned(reg13) : ($unsigned((reg14 >>> wire6)) < {(wire5 ?
                          wire7 : reg8),
                      $signed(reg9)})));
            end
          else
            begin
              reg14 <= (-$signed((7'h42)));
            end
          if ($signed(wire5))
            begin
              reg16 <= ((8'hb8) ^ (&$signed((&{(8'ha3)}))));
              reg17 <= reg13;
              reg18 <= (~&reg16);
              reg19 <= (((reg13 ^~ reg10) ?
                  ((~|((7'h41) ?
                      wire4 : reg11)) ^ reg9) : (($signed(wire0) ~^ (wire0 & reg15)) ?
                      ((wire6 ?
                          wire5 : reg14) != $signed(wire6)) : (~$unsigned(reg16)))) | (~$unsigned((|$signed(wire3)))));
            end
          else
            begin
              reg16 <= ({((8'hb2) >> ((&reg13) - reg13))} && {{wire2[(2'h2):(1'h1)]}});
              reg17 <= wire5[(1'h0):(1'h0)];
              reg18 <= reg16[(3'h6):(2'h3)];
              reg19 <= ((~|(8'hb7)) ?
                  wire4[(3'h4):(2'h2)] : {{reg13, $signed((&reg16))},
                      (reg15[(1'h0):(1'h0)] >> (((8'hbe) < wire5) ?
                          (~^reg10) : ((8'hba) ? reg15 : wire5)))});
            end
        end
      else
        begin
          reg9 <= reg19[(1'h1):(1'h1)];
          if (((($unsigned((wire4 >= reg17)) ?
                  ($unsigned(reg12) ?
                      {wire7} : (wire3 ? reg9 : wire0)) : reg14) ?
              reg12[(2'h2):(2'h2)] : $unsigned(((wire7 ? reg8 : wire0) ?
                  reg12 : {wire4}))) - (|(^~((reg10 <= reg15) | $signed(reg14))))))
            begin
              reg10 <= $signed($unsigned((&reg10[(3'h6):(2'h2)])));
              reg11 <= reg19;
              reg12 <= {reg9[(2'h3):(1'h1)]};
            end
          else
            begin
              reg10 <= $signed(wire7);
              reg11 <= (^(|$signed(((wire2 & reg9) ?
                  $signed(reg17) : (~^wire5)))));
              reg12 <= {(reg14[(2'h2):(1'h1)] > reg16),
                  ((reg14 ? (^~(wire1 ? reg13 : wire0)) : (+(-wire7))) ?
                      reg8[(1'h0):(1'h0)] : (|{wire5[(2'h2):(2'h2)]}))};
            end
          reg13 <= (-reg12);
        end
      reg20 <= {((+((reg11 ~^ (7'h44)) || reg18)) ^ wire1),
          ({$signed(reg14[(3'h4):(1'h1)])} ?
              $signed($unsigned((8'haf))) : ($signed((reg17 > reg8)) ?
                  wire5[(3'h5):(1'h1)] : ({reg8,
                      (7'h44)} >> (wire0 < wire7))))};
      reg21 <= (reg12 > (~|(((reg15 ? wire3 : reg16) == (reg18 <= reg12)) ?
          reg17 : (|(wire5 <= reg10)))));
      reg22 <= reg19;
    end
  assign wire23 = {{({(reg19 <<< reg12)} ?
                              ((-reg21) ? wire4 : (wire5 + reg8)) : reg20)},
                      (~|(8'hbe))};
  assign wire24 = $signed($unsigned($signed($signed($signed(wire6)))));
  assign wire25 = {(8'hbe)};
  always
    @(posedge clk) begin
      reg26 <= $unsigned((wire5 ?
          ((~$signed((8'ha1))) || {(7'h42)}) : (wire24 <<< reg22[(2'h2):(1'h0)])));
      if ({reg22,
          (wire1 ?
              reg12[(3'h4):(1'h1)] : (~^({(8'hb2),
                  wire0} <<< $signed((8'hbf)))))})
        begin
          reg27 <= reg10[(4'h9):(1'h1)];
          reg28 <= (wire25 <= wire25);
          reg29 <= (~(~reg28[(1'h0):(1'h0)]));
          reg30 <= {(reg22[(2'h2):(1'h0)] | {$signed(reg16[(2'h3):(1'h1)]),
                  (!$unsigned(reg11))}),
              (+$unsigned((^~(wire6 ? reg17 : wire3))))};
        end
      else
        begin
          if ((((({wire4} > (reg21 ?
              reg18 : (8'hb8))) <<< $unsigned(reg21[(3'h6):(1'h1)])) >> $unsigned($unsigned((-(8'h9c))))) ^ ((^(~|{reg22,
                  reg30})) ?
              (~^$signed((&wire1))) : ($unsigned((reg11 ? wire0 : reg30)) ?
                  $unsigned(wire1[(3'h7):(3'h7)]) : $signed({wire3,
                      (7'h43)})))))
            begin
              reg27 <= $signed(reg18[(1'h0):(1'h0)]);
              reg28 <= reg19;
            end
          else
            begin
              reg27 <= reg20;
              reg28 <= $unsigned(wire2);
              reg29 <= $unsigned(($signed(reg10) ^~ ({(reg11 ? reg9 : reg13),
                  (wire7 ? wire7 : (8'hb6))} >= $unsigned(wire4))));
              reg30 <= reg14;
              reg31 <= ((~^$unsigned(((!reg20) != ((8'had) ?
                  reg26 : reg11)))) || (|reg22));
            end
          if ((reg15[(2'h2):(1'h1)] ?
              $signed($unsigned($signed(wire24[(2'h2):(1'h0)]))) : (!(((~&(8'hab)) ?
                  (~^(8'hb5)) : $unsigned((8'hae))) | $signed($signed(wire4))))))
            begin
              reg32 <= reg15[(4'ha):(3'h4)];
            end
          else
            begin
              reg32 <= ($unsigned($unsigned((wire4[(3'h5):(3'h5)] ?
                  wire24[(1'h1):(1'h0)] : (|(8'hbe))))) >= $unsigned($unsigned(wire2)));
              reg33 <= wire1;
              reg34 <= reg30;
              reg35 <= (~^$signed($unsigned(((reg34 >> reg12) ?
                  (reg16 ~^ reg16) : reg32))));
            end
          reg36 <= $unsigned((7'h43));
          reg37 <= {$signed(reg22)};
          if ((-reg18[(1'h1):(1'h0)]))
            begin
              reg38 <= $unsigned($unsigned((!$unsigned(wire23))));
              reg39 <= (-(&reg26));
              reg40 <= reg27[(1'h1):(1'h0)];
              reg41 <= reg39[(1'h1):(1'h1)];
            end
          else
            begin
              reg38 <= wire0[(5'h10):(1'h1)];
              reg39 <= wire25[(4'hc):(2'h2)];
              reg40 <= $unsigned(reg17[(4'ha):(4'h9)]);
              reg41 <= $signed(reg40[(2'h2):(2'h2)]);
              reg42 <= (reg15 ~^ (~&reg21[(4'hc):(2'h3)]));
            end
        end
      reg43 <= $signed(($signed((7'h43)) ?
          (reg35[(4'h9):(1'h1)] ^~ wire1[(3'h6):(3'h5)]) : (+(8'hab))));
      if ((($signed(reg28) & (((~|(8'ha6)) ?
              (reg39 ? wire5 : reg22) : $unsigned(reg18)) > (reg34 ?
              {reg33} : (!reg39)))) ?
          (wire25 ?
              wire6[(2'h2):(2'h2)] : (~reg43[(1'h1):(1'h0)])) : {((wire4 * {wire24,
                      reg8}) ?
                  reg40[(3'h6):(2'h3)] : wire25[(1'h0):(1'h0)]),
              ((!wire4[(3'h7):(3'h5)]) < wire0[(5'h10):(4'hc)])}))
        begin
          reg44 <= $signed($unsigned(wire24[(1'h0):(1'h0)]));
        end
      else
        begin
          reg44 <= $unsigned($signed(((-reg37[(1'h0):(1'h0)]) & $unsigned(reg38))));
          reg45 <= (($signed(reg21) ~^ ($unsigned(reg22[(2'h2):(1'h1)]) > $unsigned($unsigned(reg43)))) ?
              (~|reg37) : reg22);
          reg46 <= (~(|$signed(((reg31 ? reg15 : reg12) == {reg21}))));
        end
      reg47 <= (!((~&$signed((^~reg34))) ?
          $signed(((~^reg41) ^~ {wire0, (7'h41)})) : reg43[(3'h5):(2'h3)]));
    end
  assign wire48 = $unsigned(reg29);
  assign wire49 = reg45[(1'h0):(1'h0)];
endmodule
