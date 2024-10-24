module top
#(parameter param35 = (({((^~(8'ha4)) < ((8'haf) ? (8'ha7) : (8'ha0))), (((8'h9c) ? (8'h9d) : (8'ha4)) ? (&(8'hb6)) : {(8'hb5)})} | (&{(&(8'hb6))})) ? (-((!(|(8'ha6))) ? (~&((8'hae) ~^ (8'haa))) : (((8'ha2) | (8'ha8)) & (&(8'h9f))))) : (8'h9f)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (&wire3[(3'h4):(2'h3)]);
  assign wire5 = {$signed($unsigned(((|(8'hb2)) <<< (wire4 ?
                         (8'h9e) : wire0))))};
  assign wire6 = ($unsigned(wire1[(3'h6):(1'h1)]) ?
                     $signed(wire3[(2'h2):(1'h1)]) : $unsigned(wire0));
  always
    @(posedge clk) begin
      reg7 <= $unsigned($unsigned(((8'hae) ?
          $unsigned(wire4) : ((wire6 ? wire5 : wire0) ?
              (wire2 ? wire6 : wire4) : (wire5 ? wire4 : wire5)))));
      reg8 <= {wire1[(1'h1):(1'h1)], (7'h40)};
      reg9 <= ({reg7[(4'h9):(3'h7)],
          $signed((reg7 ^ (|wire6)))} & $unsigned((8'hb9)));
      reg10 <= $signed({(!((reg8 ? wire3 : wire2) * (wire4 ?
              (8'hb3) : wire4)))});
    end
  always
    @(posedge clk) begin
      if (((-wire1) && wire1))
        begin
          if (reg10)
            begin
              reg11 <= ($unsigned($unsigned(($signed(wire3) ?
                      reg9 : $unsigned(wire0)))) ?
                  $signed({$unsigned((~wire0))}) : wire6);
            end
          else
            begin
              reg11 <= (8'hb9);
              reg12 <= (^~((reg11[(2'h2):(1'h0)] << wire6[(3'h5):(1'h0)]) ?
                  $unsigned(($signed(wire0) ?
                      $unsigned(reg8) : $signed(wire3))) : wire1));
              reg13 <= ({wire4[(4'hd):(4'hd)]} ?
                  {((~(~&reg11)) & wire0), wire6} : ((+(!(reg8 ?
                          reg10 : (8'hb4)))) ?
                      $signed(wire5) : (|(^reg9[(3'h5):(1'h1)]))));
              reg14 <= reg13[(4'h9):(4'h8)];
              reg15 <= wire4;
            end
          reg16 <= (-$signed(((-(reg7 != reg10)) ?
              wire2 : (&$unsigned(wire2)))));
          reg17 <= reg16;
          reg18 <= (&$signed(($signed($signed(reg14)) ^ $signed($unsigned((8'hab))))));
        end
      else
        begin
          reg11 <= reg8[(4'hc):(4'hb)];
          reg12 <= (wire3 - (8'hba));
          reg13 <= wire1;
          reg14 <= $signed((($signed(wire5[(5'h12):(4'hb)]) ?
              $signed($signed(wire1)) : wire4[(3'h7):(1'h1)]) && reg9[(2'h3):(1'h1)]));
        end
      reg19 <= $unsigned(reg16);
      if (({({(reg12 ? (7'h44) : reg9), $signed(wire5)} > reg10[(1'h0):(1'h0)]),
              $signed(reg7[(3'h4):(3'h4)])} ?
          reg12[(4'h9):(2'h3)] : ((-$signed((reg19 ? reg13 : reg17))) ?
              reg13 : reg12[(1'h1):(1'h0)])))
        begin
          reg20 <= $unsigned($unsigned((($unsigned(reg10) ^~ $signed(reg14)) + reg15)));
        end
      else
        begin
          if (($signed($signed(($signed((7'h40)) < $signed(wire5)))) ?
              ($unsigned(reg17[(1'h0):(1'h0)]) ?
                  (~&((~^reg13) ?
                      $unsigned(reg16) : (^~(8'hb4)))) : ($signed(wire0[(2'h2):(1'h0)]) ?
                      reg14[(4'hb):(3'h4)] : $unsigned(wire3[(3'h5):(1'h0)]))) : $signed(reg18[(2'h3):(2'h3)])))
            begin
              reg20 <= {$unsigned((($signed(reg7) || $unsigned(reg18)) << ($unsigned(reg18) > $signed(wire1))))};
              reg21 <= reg9;
              reg22 <= (~^reg18);
              reg23 <= $signed((7'h41));
            end
          else
            begin
              reg20 <= $unsigned(reg8);
            end
          reg24 <= (reg9 ?
              (((reg11 ?
                      {reg7,
                          wire5} : reg9[(2'h3):(2'h2)]) ^ {$unsigned(reg12)}) ?
                  reg20[(1'h1):(1'h1)] : (wire2[(4'hf):(4'hd)] < (wire0[(1'h1):(1'h1)] == $unsigned(reg19)))) : $signed($unsigned(($signed((8'hb1)) || reg10))));
          reg25 <= $unsigned(wire6);
          reg26 <= (^~$unsigned($signed(reg9)));
        end
      reg27 <= $unsigned((~&$signed(wire1)));
      reg28 <= $unsigned($signed(($unsigned($signed(reg14)) ?
          $signed(reg18[(4'ha):(2'h2)]) : {reg18[(5'h11):(4'h8)]})));
    end
  assign wire29 = (reg11 ?
                      (+reg9[(1'h0):(1'h0)]) : $signed(reg23[(3'h4):(2'h3)]));
  assign wire30 = ({($unsigned({reg17}) ?
                              reg11[(2'h3):(1'h1)] : (((8'hbd) < reg7) ?
                                  (8'ha8) : wire5)),
                          {(reg7 ^~ $signed((8'h9d))),
                              (wire5 ? $signed(reg18) : (~reg23))}} ?
                      {($unsigned(reg20) ?
                              wire4 : (((8'ha9) > (7'h42)) ?
                                  $unsigned(reg23) : (reg16 == wire29))),
                          wire6[(2'h2):(1'h0)]} : (($unsigned(reg25) - reg15) ^~ {(^~(!reg11)),
                          (reg27[(4'hc):(4'hb)] ?
                              $signed(reg24) : (^~wire1))}));
  assign wire31 = (|$signed((reg8 & ((wire6 ? reg13 : wire4) ?
                      $unsigned(reg14) : $signed(reg15)))));
  assign wire32 = reg12[(1'h0):(1'h0)];
  assign wire33 = (($unsigned((~^(reg7 ?
                          (8'hb0) : wire1))) + (~{$unsigned(reg14)})) ?
                      reg20[(4'hc):(3'h4)] : $unsigned((wire29 <<< ((reg13 ?
                          reg15 : reg10) | reg21[(4'h9):(1'h1)]))));
  assign wire34 = $signed(reg9[(3'h6):(1'h0)]);
endmodule
