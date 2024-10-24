module top
#(parameter param37 = (({(7'h44)} ? (8'h9c) : {(|((8'hb8) ? (7'h44) : (8'hb3)))}) ? ((^~(((8'hac) ? (7'h42) : (8'hae)) ^ {(8'hb1), (8'hb9)})) ? {(((8'hb4) != (8'hae)) || ((8'ha3) ? (8'hb9) : (8'ha5))), (|(&(8'h9c)))} : (|(^~(8'haa)))) : ((({(8'ha1)} >> (~|(8'h9d))) ? ((~&(8'hb6)) > (8'hab)) : ((-(8'hb5)) >>> ((7'h44) ? (7'h44) : (8'ha5)))) ? (&{(!(8'had)), {(8'hbf)}}) : {(|(8'ha0)), (((8'hb2) ? (8'ha3) : (8'ha8)) >>> ((8'hb4) & (8'ha8)))})), 
parameter param38 = ({(8'hb3)} ? (|(8'hb9)) : {(-param37), (({param37} | (param37 < param37)) && param37)}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire36,
                 wire33,
                 wire32,
                 wire31,
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(2'h2):(1'h0)];
      reg6 <= reg5[(2'h2):(1'h0)];
      reg7 <= ((~&reg5) && reg6);
      reg8 <= (((({reg6} >> (wire2 ^ (8'hab))) ?
              $signed(reg7) : ({wire3, reg5} <= reg5[(2'h2):(2'h2)])) ?
          $signed({(^~(8'ha9)),
              (wire1 ?
                  reg6 : reg7)}) : $signed(wire1[(2'h3):(2'h2)])) ^ ($unsigned((~&((7'h41) ?
              reg6 : wire2))) ?
          {(((8'hbf) ^ wire4) ?
                  (~|reg7) : (reg7 ? wire2 : reg7))} : wire0[(3'h7):(2'h2)]));
    end
  always
    @(posedge clk) begin
      if ((($signed($unsigned($unsigned(wire4))) >= reg6[(1'h1):(1'h0)]) <<< ({$unsigned({(8'ha4)}),
              $unsigned($unsigned(reg7))} ?
          ($unsigned(reg7[(5'h13):(4'hd)]) ?
              wire3 : reg5) : (&(&reg6[(3'h6):(2'h2)])))))
        begin
          reg9 <= $unsigned((($signed({(8'ha9), wire0}) ^~ wire3) ?
              (reg7[(4'ha):(4'h8)] >>> (~|$signed((8'h9d)))) : {(|(wire1 ?
                      reg7 : wire1))}));
        end
      else
        begin
          reg9 <= (((^~{(reg9 ? (7'h40) : wire2)}) ?
              (~|({wire2, reg6} ?
                  (reg9 ?
                      reg8 : reg5) : $signed(wire4))) : $signed(((wire1 ^ wire4) >>> reg7[(3'h6):(1'h1)]))) > (((!((8'hae) ?
                      (8'hb4) : (8'hb2))) ?
                  $unsigned((reg8 ?
                      (8'hbc) : (8'hb2))) : (reg9 * $unsigned(wire4))) ?
              (((reg9 ? wire2 : (8'ha1)) ? {reg6, reg7} : wire3) ?
                  wire0 : reg5[(1'h1):(1'h1)]) : ((+$signed(reg5)) >>> (reg7[(4'hb):(4'h9)] ^ reg5))));
          reg10 <= $signed(wire0);
          reg11 <= reg7;
          reg12 <= reg11[(4'h9):(2'h3)];
          reg13 <= ($unsigned((reg11 ?
              $unsigned(reg11) : (&wire1[(1'h1):(1'h1)]))) != (+$unsigned({(~^reg12)})));
        end
      reg14 <= ($unsigned((+(8'ha0))) ?
          ({($unsigned(wire1) ? $unsigned((8'ha2)) : $unsigned(reg8)),
              (^$unsigned(wire3))} + (+$signed($unsigned(reg8)))) : (&wire0[(4'ha):(3'h7)]));
      reg15 <= $signed(wire0);
    end
  always
    @(posedge clk) begin
      reg16 <= $signed($signed({reg12}));
      reg17 <= (~^(($signed((reg15 ? reg12 : reg5)) ?
              reg7 : $signed((reg11 == wire4))) ?
          $signed($unsigned(reg6[(1'h0):(1'h0)])) : (((wire1 || wire1) ?
                  ((8'hbd) == reg16) : $signed(reg12)) ?
              wire1 : wire1)));
      reg18 <= ((~|$unsigned(wire3[(2'h2):(2'h2)])) ~^ reg15);
      if ((($unsigned(wire1[(2'h3):(1'h1)]) <= (((~&reg7) ?
              $signed(reg17) : (|reg7)) ?
          ((~|reg15) ?
              (|reg9) : {reg18}) : $signed(reg9[(5'h11):(4'h8)]))) == {($unsigned({(8'h9c),
              reg8}) >>> reg9),
          (-(reg6 >= (reg12 ? (8'ha0) : reg13)))}))
        begin
          reg19 <= (wire4[(2'h3):(2'h2)] + ($signed($signed($signed(reg18))) ?
              (~&(wire1[(1'h0):(1'h0)] ?
                  $signed((8'ha4)) : (reg10 > reg5))) : {wire4[(2'h2):(1'h0)],
                  ((reg12 ? (8'hba) : reg18) ?
                      $unsigned(wire4) : $signed(reg6))}));
          if (((reg13[(4'he):(1'h0)] == (8'hbe)) ?
              $unsigned($signed(((wire4 ?
                  wire3 : reg13) * reg13[(1'h1):(1'h1)]))) : (|(8'h9c))))
            begin
              reg20 <= reg14;
              reg21 <= $signed(((^~(8'h9f)) ^ (~^(~{(8'h9f)}))));
              reg22 <= ($signed(wire1[(1'h1):(1'h1)]) >= (({$signed(reg9)} > {(-wire4),
                  {reg11, wire3}}) - wire4));
              reg23 <= reg9[(3'h7):(3'h5)];
            end
          else
            begin
              reg20 <= reg15;
              reg21 <= (reg6[(3'h4):(1'h1)] ?
                  $signed(wire1[(2'h2):(1'h0)]) : (((~&(reg11 * (8'haf))) <= wire1[(2'h2):(2'h2)]) ?
                      $unsigned((((8'hb1) ? reg17 : reg8) ?
                          (reg23 ?
                              reg14 : reg9) : $unsigned(reg19))) : (+wire3)));
              reg22 <= $unsigned(reg13[(1'h1):(1'h1)]);
              reg23 <= {(($signed(wire2[(4'h8):(3'h4)]) ?
                          reg13[(2'h2):(1'h0)] : wire2) ?
                      (reg19 ?
                          (|(~wire0)) : reg6[(3'h4):(1'h0)]) : $signed((|(~reg9))))};
            end
          if ($signed($signed(reg10)))
            begin
              reg24 <= (reg22 ?
                  ($signed(((reg7 ^~ (8'hb5)) ?
                          $signed(reg14) : $unsigned(wire3))) ?
                      $unsigned(reg13) : ($signed(wire0[(4'hb):(1'h1)]) & $unsigned($signed(reg17)))) : $unsigned(reg23[(2'h2):(2'h2)]));
              reg25 <= (8'hba);
              reg26 <= ((reg19 ?
                  $unsigned({$signed(reg17),
                      {reg18}}) : (^~{$signed(reg22)})) < reg19[(4'h8):(1'h1)]);
              reg27 <= ($unsigned(wire2[(4'hc):(1'h1)]) ?
                  (^(wire0 ?
                      (+(wire1 ?
                          wire1 : reg9)) : (reg13 || wire4))) : $unsigned((7'h43)));
              reg28 <= reg10;
            end
          else
            begin
              reg24 <= $unsigned({$signed({$signed(reg17), (!reg13)})});
              reg25 <= {(reg16 ?
                      (((reg27 && reg9) + $signed((8'hb9))) ?
                          $signed(reg24[(2'h3):(1'h1)]) : $unsigned($unsigned(reg12))) : $unsigned($unsigned(reg28[(4'ha):(3'h6)]))),
                  $unsigned((+(-(reg27 || reg12))))};
              reg26 <= (~&(8'ha0));
            end
          reg29 <= wire1[(2'h2):(2'h2)];
        end
      else
        begin
          if (reg6)
            begin
              reg19 <= $signed($signed($unsigned(((+reg24) ? reg6 : (|reg9)))));
              reg20 <= (($signed((&$unsigned(wire2))) && (!$signed(reg7[(4'hd):(1'h1)]))) ?
                  reg17[(3'h4):(2'h2)] : reg6[(2'h2):(1'h1)]);
              reg21 <= reg10[(3'h6):(3'h4)];
              reg22 <= $signed({wire4,
                  $signed(((reg29 + wire0) ?
                      {reg14, reg29} : reg13[(3'h5):(3'h5)]))});
              reg23 <= (($unsigned(reg29[(1'h1):(1'h0)]) ?
                      ($signed((reg28 ? wire0 : reg6)) ?
                          wire0[(1'h1):(1'h1)] : wire3) : (((reg11 >> (8'hae)) ?
                          (|reg5) : (8'hac)) ~^ (~reg14))) ?
                  wire3[(1'h0):(1'h0)] : (-(reg15[(2'h3):(1'h0)] ~^ $signed({wire1,
                      (8'ha0)}))));
            end
          else
            begin
              reg19 <= $signed(reg16);
              reg20 <= ((wire2[(2'h3):(1'h1)] ?
                      reg12 : $unsigned($unsigned($unsigned(reg16)))) ?
                  {reg11} : (~((!(reg25 + reg17)) ~^ reg23)));
              reg21 <= ({wire3[(3'h4):(1'h0)], reg28[(2'h3):(2'h2)]} ?
                  $signed($signed($unsigned((reg8 ?
                      reg27 : reg29)))) : (&($unsigned((+reg28)) ?
                      (((8'hb5) >> reg28) ?
                          $unsigned(reg17) : (!reg22)) : (reg20 >> ((7'h43) ?
                          wire3 : (8'ha8))))));
            end
          if (reg22)
            begin
              reg24 <= ((reg7[(4'hc):(2'h2)] & $unsigned(reg7)) <= reg5);
              reg25 <= reg16[(3'h4):(2'h3)];
              reg26 <= {(reg11 - (~&(~$unsigned(wire4)))),
                  (reg24[(2'h2):(1'h1)] < (((~|reg25) ?
                      ((8'hab) ?
                          (8'hb2) : wire0) : $unsigned(reg17)) < (((8'ha1) != reg25) ^ (reg9 != (8'hbf)))))};
              reg27 <= $signed(($unsigned((reg16 ?
                      (reg11 ? reg8 : wire0) : reg25)) ?
                  reg27[(1'h1):(1'h1)] : reg14));
              reg28 <= (8'hbb);
            end
          else
            begin
              reg24 <= (!({wire4} ^ (~&(reg6 ^~ {(8'hbf)}))));
              reg25 <= {{(reg15[(4'h9):(3'h6)] ~^ ($signed((8'hb8)) ?
                          (reg29 ^~ wire4) : reg6[(1'h1):(1'h1)])),
                      reg10[(1'h1):(1'h0)]},
                  $unsigned((~|{reg28[(3'h6):(1'h0)]}))};
              reg26 <= $unsigned(((|$signed(reg27[(1'h1):(1'h1)])) ?
                  reg8[(2'h3):(1'h1)] : reg21));
              reg27 <= (($signed(reg10[(1'h1):(1'h1)]) ?
                      $signed(reg19[(3'h6):(2'h3)]) : reg8) ?
                  reg18[(3'h5):(1'h0)] : reg7);
            end
        end
      reg30 <= reg20[(2'h2):(1'h1)];
    end
  assign wire31 = {$signed(reg11), $signed((+(^reg7)))};
  assign wire32 = reg24[(2'h3):(1'h1)];
  assign wire33 = (wire32[(4'he):(3'h5)] << (~&(8'had)));
  always
    @(posedge clk) begin
      if (($unsigned($signed(reg14[(3'h6):(2'h2)])) << (($unsigned((~^wire33)) ?
              reg18 : ((!wire4) > reg30)) ?
          $unsigned({(reg23 ?
                  reg29 : reg30)}) : $unsigned($unsigned($unsigned(reg10))))))
        begin
          reg34 <= $unsigned((($unsigned($signed((8'hb7))) ?
                  reg14[(2'h3):(2'h2)] : {$signed(reg21)}) ?
              {reg12,
                  (reg23[(4'hb):(2'h2)] + (wire0 | wire2))} : (^~(&((8'hb5) * reg9)))));
          reg35 <= $signed($signed(reg15[(4'he):(3'h5)]));
        end
      else
        begin
          reg34 <= (&{$signed(({reg11} <<< $signed(wire0)))});
        end
    end
  assign wire36 = {{reg30[(2'h3):(1'h1)], wire3}};
endmodule
