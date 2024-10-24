module top
#(parameter param41 = (^~(^{{(~(8'ha4)), ((8'hb4) ? (8'hbb) : (8'hbf))}})), 
parameter param42 = param41)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg4 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3;
      if (wire2[(4'h9):(3'h7)])
        begin
          if (wire2)
            begin
              reg5 <= {{wire0[(1'h0):(1'h0)],
                      ($signed((~^wire3)) ?
                          {reg4[(1'h1):(1'h0)]} : $signed(wire2))},
                  (!(!((wire0 ? (8'ha4) : wire3) <<< $unsigned((7'h42)))))};
            end
          else
            begin
              reg5 <= reg4;
              reg6 <= reg4[(2'h3):(1'h0)];
              reg7 <= ($unsigned($signed(((wire3 ^ (7'h40)) ?
                  (wire3 < (8'hb9)) : (&reg4)))) && (-$signed(($unsigned(reg5) ?
                  reg5[(5'h11):(3'h4)] : $signed((8'h9c))))));
              reg8 <= (^(wire2[(3'h7):(3'h5)] ?
                  reg7[(1'h0):(1'h0)] : (|(reg6[(3'h5):(1'h0)] ?
                      $signed(wire0) : $unsigned((7'h43))))));
              reg9 <= wire1;
            end
          reg10 <= wire2;
          if ((~&reg10))
            begin
              reg11 <= (8'ha4);
            end
          else
            begin
              reg11 <= wire0;
              reg12 <= $unsigned($unsigned({$signed(reg11[(3'h5):(2'h3)])}));
              reg13 <= {({reg10[(3'h5):(3'h5)],
                      {reg4, (~|wire0)}} >= ($unsigned(wire0) != wire0)),
                  (~^$unsigned(wire1))};
            end
          if ($signed((~|$unsigned(wire1[(4'h8):(3'h4)]))))
            begin
              reg14 <= $unsigned((!{wire3}));
              reg15 <= (reg14 && {reg6[(4'h9):(3'h5)],
                  ((8'ha8) ?
                      (8'hb8) : (reg13 ? (reg13 ? reg13 : reg4) : (8'ha3)))});
            end
          else
            begin
              reg14 <= $unsigned({$unsigned(reg14[(3'h6):(3'h5)])});
              reg15 <= reg8[(4'h9):(3'h7)];
            end
          reg16 <= ((~&((^~(7'h40)) << ((reg12 >= wire3) <= (reg10 ?
              wire0 : wire2)))) >= (wire2[(4'hb):(4'ha)] ?
              {reg13} : $signed((reg14 ? $signed(reg7) : $unsigned((8'h9f))))));
        end
      else
        begin
          reg5 <= ((~&(^$unsigned(reg10))) < wire2);
          reg6 <= $unsigned((~|(($signed(reg15) & (wire3 > reg7)) >> (~(reg9 ^ (8'hbf))))));
          reg7 <= ({(&($signed(reg4) ?
                      (wire0 ? reg5 : (8'hb9)) : $signed(reg12)))} ?
              $signed(reg12[(1'h1):(1'h1)]) : reg16);
        end
      if ($signed(reg12[(1'h0):(1'h0)]))
        begin
          if ((+wire3))
            begin
              reg17 <= reg9[(5'h12):(4'he)];
              reg18 <= reg7;
              reg19 <= (!(^$unsigned($unsigned(((7'h40) < reg12)))));
              reg20 <= $unsigned($signed((((reg8 ?
                      (8'hbd) : reg19) ^~ (reg11 < (8'h9f))) ?
                  reg19[(5'h10):(1'h0)] : ($signed(wire3) ?
                      (~reg6) : $unsigned(reg9)))));
            end
          else
            begin
              reg17 <= wire0[(3'h5):(1'h0)];
              reg18 <= $signed($unsigned(({wire3[(2'h2):(2'h2)],
                  $unsigned((8'hb6))} ^ ($unsigned(reg17) >= reg19[(4'he):(3'h7)]))));
              reg19 <= (|{(^~$unsigned(reg11))});
              reg20 <= reg8[(4'hc):(3'h6)];
              reg21 <= reg4[(2'h3):(1'h1)];
            end
          reg22 <= $signed($unsigned(reg17[(3'h7):(3'h4)]));
          reg23 <= (^~{({(8'ha5)} ?
                  ((reg18 <= reg9) > $unsigned((8'hbc))) : ((reg22 ?
                          (8'ha9) : wire0) ?
                      wire1[(3'h7):(3'h7)] : {reg19, (7'h44)})),
              reg16});
          if ($unsigned({{(~^$signed(reg6))}}))
            begin
              reg24 <= ($unsigned(reg15) | (reg18[(4'hc):(2'h3)] ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : ($unsigned({reg11, reg16}) ?
                      $signed($unsigned(reg4)) : (~&reg12))));
              reg25 <= reg18;
              reg26 <= reg16;
              reg27 <= (|reg23);
            end
          else
            begin
              reg24 <= (^reg13);
              reg25 <= wire3[(4'h8):(3'h5)];
            end
          reg28 <= reg15;
        end
      else
        begin
          reg17 <= (!($unsigned((^~$unsigned(reg19))) ^~ $unsigned(wire1)));
          reg18 <= reg10[(1'h0):(1'h0)];
        end
      reg29 <= reg5;
      if ((({reg24[(3'h5):(3'h5)], reg15[(4'h9):(3'h7)]} ?
          $signed((!(reg27 > reg27))) : reg28) >> (-((!reg28[(4'h9):(3'h5)]) ?
          ((reg22 != (7'h40)) ?
              {reg9, reg6} : $unsigned((8'ha1))) : $unsigned((~|reg5))))))
        begin
          reg30 <= $unsigned(((^{((7'h40) > reg21), reg5[(3'h7):(3'h7)]}) ?
              reg18[(3'h4):(1'h1)] : $unsigned(reg16)));
          reg31 <= $signed($unsigned((|((reg12 || wire1) ?
              $unsigned(wire3) : (reg27 ? wire3 : reg12)))));
          reg32 <= ((reg16[(3'h5):(2'h2)] ?
                  ((^$signed(reg27)) | reg15[(4'hc):(4'h8)]) : ($signed(reg12) ?
                      $unsigned($signed(reg6)) : reg23)) ?
              (((^reg7[(2'h2):(1'h1)]) ?
                  $signed((-reg4)) : $unsigned(reg14)) + ($unsigned($unsigned(wire2)) ?
                  ($unsigned(reg25) & {reg30}) : reg12)) : ((reg22 + (reg24 ^ (~reg27))) + reg20));
          reg33 <= ((~|((7'h43) >> ((8'hb9) ?
              (reg25 ?
                  reg13 : reg28) : $unsigned(reg27)))) <= {($unsigned($unsigned(reg22)) > $signed(reg20[(4'h8):(3'h5)]))});
        end
      else
        begin
          reg30 <= $unsigned({$signed((|(reg29 + wire3)))});
          if ((~({reg21, $signed((reg19 & wire0))} ?
              (reg33[(3'h7):(3'h5)] <= wire0[(3'h5):(3'h4)]) : (~$unsigned((reg16 <<< (8'hbc)))))))
            begin
              reg31 <= $signed($unsigned(($signed(reg16[(3'h5):(1'h0)]) > ((reg12 ?
                      reg8 : reg4) ?
                  wire2[(2'h2):(1'h1)] : reg16))));
            end
          else
            begin
              reg31 <= (reg22[(5'h11):(4'he)] << ($signed($unsigned({(8'haf)})) < $signed(reg33)));
              reg32 <= (({(reg13 << (8'ha6)),
                      $unsigned((&(8'ha6)))} | (~|(8'hba))) ?
                  reg28[(2'h2):(1'h0)] : (reg7[(2'h3):(1'h1)] ?
                      reg15[(4'hc):(1'h1)] : $signed(reg6[(1'h1):(1'h0)])));
              reg33 <= wire2;
              reg34 <= $unsigned($signed($signed(reg27)));
              reg35 <= reg16[(3'h4):(1'h1)];
            end
        end
    end
  assign wire36 = reg8;
  assign wire37 = (-(($unsigned(reg30) >= reg4[(1'h1):(1'h0)]) ?
                      $signed((reg35 ?
                          reg16[(2'h2):(1'h1)] : (wire3 && (8'hb2)))) : ((^~(|reg18)) ~^ (~$unsigned(reg17)))));
  assign wire38 = ($signed(wire0[(2'h2):(1'h0)]) ? (8'hb6) : reg6);
  assign wire39 = (((^reg15[(4'hf):(4'ha)]) >>> ((8'hae) ?
                          $unsigned(reg6[(1'h0):(1'h0)]) : reg21)) ?
                      ($unsigned((~|reg30[(4'h9):(1'h1)])) ?
                          $unsigned($unsigned(reg6)) : (reg7[(2'h3):(2'h3)] ?
                              reg7 : reg9)) : (&reg4));
  assign wire40 = ($signed($unsigned(wire36[(5'h13):(1'h1)])) >> $signed(reg22));
endmodule
