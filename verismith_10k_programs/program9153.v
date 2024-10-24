module top
#(parameter param43 = ({(((&(8'ha4)) << ((8'hab) - (8'ha3))) ? {((8'ha4) >>> (8'hbc))} : (|{(8'haa)})), ((((8'hba) ? (8'ha5) : (8'ha5)) ? ((7'h42) <<< (8'ha8)) : {(8'ha9), (8'hac)}) ? (((8'h9c) <<< (8'h9c)) >> ((8'hb6) ? (7'h43) : (8'hac))) : (((8'ha7) <<< (8'hab)) ? ((8'ha9) ? (8'hbd) : (8'hb4)) : ((7'h41) ? (8'ha2) : (8'hbc))))} > (~((((8'hb6) ? (8'h9c) : (7'h42)) & {(8'hae)}) ? ((-(8'hae)) ? ((8'ha3) ? (8'h9d) : (8'hac)) : ((8'hbf) ? (8'haf) : (8'ha4))) : (((8'ha9) ? (8'hb2) : (8'hb2)) ? (8'haa) : (|(8'hab)))))), 
parameter param44 = param43)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire7;
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  assign y = {wire8,
                 wire7,
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
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($signed({wire4[(2'h2):(1'h1)]}) << (((8'ha7) ?
              ((wire0 ? wire4 : wire3) ?
                  (wire4 - wire0) : wire2[(1'h1):(1'h0)]) : ({wire2, wire4} ?
                  (^~wire0) : (wire0 ? wire3 : wire3))) ?
          wire4 : $signed((wire0[(2'h3):(1'h0)] ? (~|(8'hab)) : wire2))));
      reg6 <= (8'h9e);
    end
  assign wire7 = $signed(wire0);
  assign wire8 = {($signed(wire2) ^~ wire1[(1'h0):(1'h0)]), (8'hab)};
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed(($signed(wire0) < wire8)))))
        begin
          reg9 <= ((~((^{wire1, wire3}) + $unsigned((8'h9c)))) <= wire2);
          reg10 <= wire8;
          reg11 <= (wire8 != (&$unsigned(((reg9 | wire1) < (wire4 ?
              reg6 : wire8)))));
          if (wire0)
            begin
              reg12 <= ($signed($unsigned((^~wire7))) ? reg5 : reg10);
              reg13 <= wire2;
              reg14 <= $unsigned(reg10[(3'h4):(3'h4)]);
            end
          else
            begin
              reg12 <= $signed($unsigned((^(((7'h42) <= wire7) ?
                  $unsigned(reg14) : (~|wire7)))));
              reg13 <= ((reg10 ^~ wire3[(4'h9):(3'h5)]) ?
                  (wire8[(2'h3):(1'h0)] ?
                      reg11 : (8'h9e)) : ({((~^wire8) ~^ (|reg11))} ?
                      ({(&wire3),
                          (^~(8'hba))} - wire7[(1'h1):(1'h0)]) : $signed((reg12 ?
                          $signed(reg12) : (reg13 ? wire0 : wire3)))));
            end
          reg15 <= $unsigned($unsigned((wire0 ?
              reg12[(2'h3):(1'h0)] : $signed(wire0))));
        end
      else
        begin
          reg9 <= (($unsigned(($signed(reg12) ?
                      {reg5} : (reg15 ? reg12 : reg11))) ?
                  ($unsigned(wire3) ~^ {(-wire3), (reg6 ^~ wire8)}) : reg9) ?
              (($signed((reg9 ? wire0 : reg9)) <<< {reg10,
                  reg9[(2'h2):(2'h2)]}) || (^~((wire0 + wire4) ?
                  (~^wire7) : $unsigned(wire7)))) : (+$signed((reg12[(3'h7):(1'h0)] ?
                  wire4[(1'h1):(1'h1)] : $signed(reg10)))));
        end
      if ({$unsigned({(^wire3[(4'hb):(1'h0)]), (~(reg14 == reg9))})})
        begin
          if (((~|reg11[(3'h7):(1'h1)]) ?
              (^$signed((wire7[(3'h6):(3'h4)] ?
                  wire7[(3'h4):(1'h0)] : $unsigned(wire8)))) : {(~^((wire1 | wire1) ?
                      (8'ha4) : (wire8 ? reg5 : wire1))),
                  (($signed(wire3) ? reg5 : $unsigned(reg5)) | (!(!reg14)))}))
            begin
              reg16 <= $signed((!{{{reg12, wire7}, reg10[(2'h3):(1'h0)]}}));
              reg17 <= wire3;
              reg18 <= reg6;
            end
          else
            begin
              reg16 <= {$signed({(!(reg12 >= reg11))})};
              reg17 <= (~reg11[(2'h3):(1'h1)]);
            end
          if ((8'hba))
            begin
              reg19 <= wire8[(2'h2):(2'h2)];
              reg20 <= (&(($unsigned(wire2) ?
                  wire3[(4'h9):(4'h8)] : reg9[(2'h2):(2'h2)]) > $unsigned(wire4)));
              reg21 <= reg20[(4'h9):(2'h2)];
              reg22 <= $signed(wire8[(2'h3):(1'h1)]);
            end
          else
            begin
              reg19 <= (7'h42);
              reg20 <= $unsigned((((((8'hb4) ? wire4 : reg5) ?
                      $unsigned(reg13) : wire2[(1'h1):(1'h0)]) ?
                  (~reg20) : ($signed(reg13) ?
                      $signed(reg11) : ((8'ha8) ?
                          reg10 : (8'h9f)))) ~^ {$signed((reg20 != (8'hab)))}));
              reg21 <= {$unsigned(reg17[(2'h3):(1'h0)])};
              reg22 <= (~^(reg18[(4'hb):(2'h2)] ?
                  ({(-wire1),
                      $signed(reg13)} >> (-$unsigned(reg14))) : {($unsigned(reg22) >> reg16[(4'ha):(2'h3)])}));
              reg23 <= reg16;
            end
          if ((8'hae))
            begin
              reg24 <= {{$signed((~^(wire8 ~^ reg10))),
                      $unsigned(reg14[(2'h2):(2'h2)])}};
              reg25 <= (~|(($signed((reg19 ?
                  reg20 : wire2)) <= {wire8[(3'h4):(2'h3)],
                  (reg24 >> (7'h40))}) * reg17));
              reg26 <= (!{wire4,
                  (|((wire0 ~^ reg19) ?
                      $unsigned(wire8) : reg19[(2'h3):(1'h1)]))});
              reg27 <= reg9[(1'h0):(1'h0)];
              reg28 <= ($unsigned(reg10) && ((^~(8'hbc)) ?
                  (!(reg18 ?
                      $unsigned((8'hb0)) : $signed(reg24))) : $unsigned($unsigned((~&wire1)))));
            end
          else
            begin
              reg24 <= $signed($unsigned(((-{reg6, wire8}) != ((reg28 ?
                      reg24 : reg15) ?
                  {reg11, (8'hbc)} : $signed(reg6)))));
            end
        end
      else
        begin
          if ($signed((~|wire8)))
            begin
              reg16 <= wire2[(1'h1):(1'h0)];
              reg17 <= {reg19[(2'h3):(1'h0)]};
              reg18 <= (^~$signed((~&$signed($signed(reg9)))));
              reg19 <= (~^(reg9 ^ reg15));
            end
          else
            begin
              reg16 <= reg18[(3'h4):(2'h3)];
            end
          reg20 <= reg13;
          reg21 <= $unsigned($signed({reg13}));
        end
      reg29 <= $unsigned(reg23[(4'h9):(3'h4)]);
      if (wire4)
        begin
          reg30 <= {$unsigned(reg10), (7'h42)};
          if (wire7[(1'h1):(1'h0)])
            begin
              reg31 <= {(((wire2 * (wire7 ?
                      reg5 : reg6)) <= ($unsigned(reg11) ~^ reg18)) + ($unsigned((+wire0)) ^~ (reg13 ?
                      $signed(reg12) : (reg6 ? reg5 : wire2))))};
              reg32 <= (reg18 ?
                  wire7 : ({$signed(reg29[(4'h8):(2'h3)]),
                      ({reg6} ?
                          (reg30 ?
                              (8'hb7) : wire7) : (reg22 && reg14))} & ($unsigned(reg11[(4'h9):(1'h0)]) ?
                      ((wire1 ?
                          (8'ha4) : reg28) <= (reg19 << reg17)) : reg11)));
              reg33 <= ($unsigned($signed(((reg18 ? wire2 : reg28) ?
                  $unsigned(reg20) : $unsigned((8'ha8))))) || $unsigned(($signed(reg23) | ((reg30 ?
                  reg17 : wire1) <<< reg10[(2'h3):(2'h2)]))));
              reg34 <= reg23;
              reg35 <= {$signed(reg6)};
            end
          else
            begin
              reg31 <= $unsigned($unsigned($signed($signed($signed(wire3)))));
              reg32 <= $unsigned(reg27[(4'ha):(1'h0)]);
              reg33 <= $signed({reg24,
                  $unsigned(((reg6 >= (8'haf)) ? (^~wire7) : {reg25}))});
            end
          reg36 <= wire1[(3'h7):(1'h1)];
          reg37 <= reg28[(2'h3):(2'h2)];
        end
      else
        begin
          if (wire4)
            begin
              reg30 <= (^reg35);
            end
          else
            begin
              reg30 <= reg31[(2'h3):(1'h0)];
              reg31 <= $signed($signed(reg32));
              reg32 <= ((reg31 ?
                  (~^($unsigned(reg28) < (reg28 ?
                      (7'h40) : (8'ha2)))) : $unsigned(reg37[(3'h7):(1'h1)])) ^~ ((8'ha6) >> $unsigned(({reg25} == (reg26 ^ (8'had))))));
              reg33 <= $unsigned($signed((-{wire2})));
              reg34 <= $signed((^~($signed(reg37[(3'h5):(1'h0)]) ?
                  $unsigned((-reg14)) : reg29[(2'h3):(1'h0)])));
            end
          reg35 <= {(|wire1), $unsigned($signed(reg27))};
          reg36 <= reg33;
          if (wire3[(3'h7):(1'h1)])
            begin
              reg37 <= $unsigned((^{$unsigned((~|reg16))}));
              reg38 <= (8'ha0);
              reg39 <= ($unsigned(((^~$signed(reg38)) ?
                      {reg22[(3'h4):(2'h3)], {reg6, wire7}} : ((~reg24) ?
                          {reg36, reg36} : {reg34}))) ?
                  wire4 : ((!$signed($unsigned(reg11))) ?
                      $signed((~^reg15[(3'h5):(1'h0)])) : {($signed(reg30) < (reg18 + reg6)),
                          reg19[(1'h1):(1'h1)]}));
              reg40 <= (8'hba);
              reg41 <= $unsigned(reg16);
            end
          else
            begin
              reg37 <= ($unsigned($signed(($signed(reg12) & $unsigned(reg28)))) ~^ $signed(({(reg34 ?
                      (8'hbc) : reg34),
                  $unsigned(wire8)} == ((reg31 & reg12) ?
                  (reg10 ~^ reg17) : reg28[(1'h1):(1'h1)]))));
              reg38 <= {$signed((8'had)), reg34};
              reg39 <= ($unsigned((&reg39[(3'h7):(2'h3)])) ?
                  ((8'haf) ?
                      $unsigned({$unsigned(reg27)}) : $signed({((8'hac) ?
                              reg27 : reg10)})) : (((!(reg12 ~^ wire2)) > ({reg24} >>> $unsigned(reg25))) ?
                      ((reg17 <<< (|reg23)) ?
                          (reg17[(3'h5):(2'h2)] - reg18[(2'h3):(2'h3)]) : (~|{reg31})) : (($signed(wire4) ?
                          $signed(reg38) : reg34[(4'hf):(4'hf)]) > ({reg6,
                              wire2} ?
                          {reg40} : {reg23, reg14}))));
              reg40 <= (&{wire7[(1'h0):(1'h0)],
                  (|$unsigned(wire7[(2'h3):(1'h0)]))});
            end
        end
      reg42 <= (+($unsigned($signed($signed(reg26))) ? reg31 : reg40));
    end
endmodule
