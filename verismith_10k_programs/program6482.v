module top
#(parameter param41 = (|(!((8'hb4) ? ({(8'hb6), (8'hbc)} ? {(8'hbf), (8'hb7)} : {(8'h9e)}) : {(&(8'hb7))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
                 reg8,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(wire2)) | ((8'hb6) ^ ((-{(8'h9c)}) ?
                     $unsigned({(8'hab), (8'hb1)}) : $unsigned({wire3,
                         wire4}))));
  assign wire6 = ($unsigned((|((wire2 != wire5) ?
                     (wire1 << wire1) : $unsigned((8'ha8))))) & wire2);
  assign wire7 = wire3[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (wire7[(1'h0):(1'h0)])
        begin
          reg8 <= wire6[(4'ha):(1'h1)];
        end
      else
        begin
          reg8 <= (~|(((~(+(8'ha3))) ?
                  {wire7[(1'h1):(1'h1)], (wire4 - wire2)} : ($unsigned(wire6) ?
                      (wire0 ^~ wire0) : $unsigned(wire4))) ?
              $signed($signed((reg8 >>> wire0))) : (((wire1 == wire1) ?
                      {wire5} : $unsigned(wire0)) ?
                  ((!wire6) || {wire5, wire0}) : ($signed(wire7) ?
                      (wire3 <<< wire3) : $unsigned(wire4)))));
          reg9 <= wire3;
          reg10 <= wire1;
          reg11 <= ($unsigned(wire1[(1'h0):(1'h0)]) ?
              wire5 : {(wire5 != ((reg10 ? wire4 : wire5) ?
                      (wire1 && wire3) : ((8'haf) ? wire1 : wire7)))});
        end
      if ($signed(reg8[(2'h3):(1'h0)]))
        begin
          reg12 <= reg8;
          reg13 <= ($unsigned((^~$unsigned((wire4 ? reg8 : (8'hbf))))) ?
              (|(((~&(8'ha6)) + {wire3}) - $unsigned(reg12))) : $signed($signed($signed({wire0}))));
          reg14 <= (wire7 || (((~{(8'hb3)}) >>> ((wire4 - (8'hb7)) ?
                  wire1 : $signed((8'ha7)))) ?
              wire6[(3'h5):(1'h0)] : (-{(reg8 ? wire4 : (8'hbc)),
                  wire5[(2'h2):(1'h1)]})));
        end
      else
        begin
          if (wire3)
            begin
              reg12 <= reg14;
              reg13 <= $unsigned(reg11);
              reg14 <= {reg14[(3'h4):(3'h4)], reg13};
              reg15 <= {(^~((!{reg12, wire2}) ?
                      $signed((~(8'hb2))) : {(!reg9), $unsigned((8'hb3))})),
                  (~|$unsigned(wire0[(3'h5):(3'h4)]))};
              reg16 <= (~$signed((reg10[(4'hd):(4'hc)] >> reg14[(4'hc):(4'hc)])));
            end
          else
            begin
              reg12 <= (~(8'ha0));
              reg13 <= wire1;
              reg14 <= reg11[(4'ha):(2'h3)];
            end
        end
      if ($signed(($signed($signed(reg9)) ? (-(-wire1)) : reg8)))
        begin
          reg17 <= reg16[(1'h1):(1'h0)];
          reg18 <= $signed($unsigned($unsigned($unsigned((wire0 ?
              wire6 : reg16)))));
          reg19 <= reg16[(4'h9):(2'h2)];
          reg20 <= (~|($signed({$unsigned(reg12), $unsigned(wire7)}) ?
              (~^$unsigned((reg16 ? (8'hb6) : reg8))) : wire4[(3'h6):(3'h6)]));
          reg21 <= ((&reg11) << (!((reg12 ?
              {reg8} : {wire7, wire4}) | ((^~wire4) || (7'h44)))));
        end
      else
        begin
          reg17 <= wire4;
          reg18 <= (~&$signed(($unsigned(wire3) ?
              $unsigned((!reg17)) : {(!wire2), reg21[(4'h9):(3'h7)]})));
          reg19 <= $signed((((&wire5) ?
                  (|wire2) : $signed(wire2[(3'h4):(1'h0)])) ?
              reg11[(3'h4):(3'h4)] : ((~(~^reg15)) ?
                  (~&{reg8, reg18}) : wire0[(3'h4):(2'h2)])));
          reg20 <= reg21;
          if (reg10)
            begin
              reg21 <= $unsigned({reg21});
              reg22 <= (($unsigned($signed(reg19[(1'h1):(1'h1)])) ?
                      wire1 : ($unsigned(reg13[(1'h0):(1'h0)]) ?
                          ($unsigned((7'h42)) != wire2[(5'h10):(4'hf)]) : {wire0})) ?
                  {reg21[(4'he):(3'h5)]} : $signed(({$signed(reg17)} ?
                      wire2[(1'h0):(1'h0)] : reg9[(3'h5):(2'h3)])));
              reg23 <= (|$unsigned(($signed({reg11}) ? (^~(&reg19)) : wire6)));
              reg24 <= (!({$unsigned(reg19[(2'h3):(2'h2)])} >>> (+($signed(reg11) <= $signed(wire4)))));
              reg25 <= ($signed(($signed((reg17 ?
                  (8'hba) : wire2)) <= wire3[(3'h4):(1'h0)])) ^ $unsigned((^~((reg13 - wire7) ?
                  (wire4 << reg19) : $unsigned(reg19)))));
            end
          else
            begin
              reg21 <= (~&$unsigned((!(!(reg17 <<< (7'h44))))));
            end
        end
    end
  always
    @(posedge clk) begin
      reg26 <= ((^~$signed(reg15[(1'h1):(1'h0)])) ?
          ((-(reg15 + (wire2 ? reg22 : wire0))) * ($unsigned($signed(reg22)) ?
              (((8'ha7) ? wire7 : reg10) ?
                  $unsigned(reg14) : wire5) : $unsigned((8'hba)))) : wire2[(5'h11):(4'h9)]);
      reg27 <= (~&{wire4});
      reg28 <= (+$unsigned(reg12[(3'h6):(3'h4)]));
      if (wire5)
        begin
          reg29 <= reg20[(3'h7):(3'h7)];
          if (($unsigned((((~^reg17) ? (wire5 >= reg28) : (-(8'ha0))) ?
                  (+$unsigned((8'ha4))) : $unsigned(reg14))) ?
              reg23[(4'hc):(2'h3)] : $unsigned($signed($signed(reg9[(1'h0):(1'h0)])))))
            begin
              reg30 <= reg24[(4'h8):(3'h4)];
            end
          else
            begin
              reg30 <= reg24[(3'h6):(3'h4)];
              reg31 <= (~^(~^(~^((reg11 <<< reg30) ^ $unsigned((8'hbe))))));
            end
        end
      else
        begin
          reg29 <= reg15[(2'h3):(2'h2)];
          if ($signed($unsigned(reg10)))
            begin
              reg30 <= $unsigned(($signed(reg22) ?
                  reg12[(4'h8):(4'h8)] : {(((8'hb8) ? wire0 : (8'ha1)) ?
                          reg13 : (reg12 != reg9))}));
              reg31 <= (wire1 != (((~|{wire2}) < (+reg26[(1'h1):(1'h1)])) >= (~^((reg31 ?
                      (8'ha6) : (8'haa)) ?
                  reg8[(4'h9):(3'h4)] : $unsigned((8'h9f))))));
            end
          else
            begin
              reg30 <= ($unsigned((~&reg20)) ^~ reg31[(3'h4):(3'h4)]);
            end
          reg32 <= ($signed((&reg12[(4'h8):(2'h2)])) ?
              $signed(reg23[(4'hf):(4'hd)]) : $unsigned(reg11[(3'h6):(2'h3)]));
          reg33 <= $signed($unsigned(((((8'ha8) ? wire6 : wire4) ?
              (|wire3) : (wire1 ?
                  reg27 : reg8)) >= $unsigned($signed((8'ha1))))));
        end
      if ({((8'hbf) ? {reg18, wire7} : wire1[(1'h0):(1'h0)]),
          (^reg17[(3'h4):(1'h0)])})
        begin
          reg34 <= (^~{$unsigned(reg24),
              ($unsigned((^(8'had))) ?
                  reg18[(2'h2):(1'h1)] : wire5[(3'h6):(1'h1)])});
          reg35 <= {(^(8'hb1)),
              ((reg11 ?
                  ((wire6 != reg16) - $signed(reg23)) : (^(+wire1))) << $signed((wire1 ?
                  $signed(reg33) : $unsigned(reg18))))};
          reg36 <= $signed($unsigned(($signed(reg16[(2'h3):(2'h3)]) ^~ $signed($unsigned(reg15)))));
          reg37 <= ({(reg28 && $signed((~&reg24)))} ^~ ((+reg16) ~^ (8'h9d)));
        end
      else
        begin
          reg34 <= $unsigned((~|reg15));
          if ($signed(reg36))
            begin
              reg35 <= (wire1[(1'h0):(1'h0)] ?
                  reg37 : ($signed(reg11) ?
                      wire4[(3'h4):(3'h4)] : ($unsigned({reg28}) <<< (reg24 <= ((8'h9e) ?
                          (8'ha1) : reg13)))));
              reg36 <= $unsigned($signed(reg30[(4'h9):(3'h7)]));
              reg37 <= $unsigned($signed((~$signed(((8'hbe) ?
                  reg37 : reg28)))));
              reg38 <= reg20;
            end
          else
            begin
              reg35 <= $signed(((~|reg12) ?
                  (reg37 - wire3[(1'h0):(1'h0)]) : {(&reg24)}));
              reg36 <= $unsigned($signed(($unsigned($unsigned((7'h44))) | $unsigned(wire1[(2'h2):(2'h2)]))));
              reg37 <= reg37;
            end
          reg39 <= {(($unsigned({(8'hb2),
                      reg8}) >>> (reg16[(4'hb):(1'h0)] ~^ $unsigned(wire0))) ?
                  reg32[(2'h2):(1'h1)] : $signed({$signed(wire1),
                      $unsigned((8'had))})),
              $unsigned(reg30)};
          reg40 <= $unsigned((|$signed(reg34)));
        end
    end
endmodule
