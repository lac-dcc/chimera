module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire26;
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire26,
                 reg28,
                 reg27,
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
      reg4 <= (($signed(((wire1 & wire2) + $signed(wire0))) ?
              $signed(wire3[(2'h3):(1'h0)]) : wire3[(2'h2):(1'h0)]) ?
          {$signed(wire0[(3'h4):(2'h3)])} : {wire1});
      reg5 <= ({$signed({reg4, $unsigned(wire2)}),
          ((8'ha4) ~^ wire3[(4'hc):(4'h8)])} & ($unsigned({$signed(wire3)}) && (^$signed(reg4))));
      if (((reg4[(1'h0):(1'h0)] ?
          reg5 : {wire3[(4'hd):(4'h8)],
              $signed($signed(wire2))}) < $signed(wire1[(3'h5):(2'h3)])))
        begin
          reg6 <= wire2;
          reg7 <= wire3;
          if ({($signed({reg6, (wire1 ? reg4 : (8'hb4))}) ?
                  ($signed($signed(wire0)) | (~$signed(reg4))) : {$unsigned($signed(reg5)),
                      ({reg5, reg5} ?
                          wire2[(1'h1):(1'h0)] : wire3[(2'h2):(2'h2)])}),
              $unsigned((^~wire0[(1'h1):(1'h1)]))})
            begin
              reg8 <= (($unsigned($signed($signed(reg5))) ?
                      {((reg4 ? wire0 : (8'hbc)) || (reg4 ?
                              reg4 : reg5))} : (|$signed(reg6))) ?
                  $unsigned($signed((!reg4[(3'h5):(1'h1)]))) : $unsigned($unsigned($unsigned(wire2))));
              reg9 <= $signed((^$signed(((~&wire2) ~^ $signed(wire3)))));
              reg10 <= wire3[(2'h2):(1'h0)];
              reg11 <= reg6[(1'h1):(1'h0)];
              reg12 <= (8'haf);
            end
          else
            begin
              reg8 <= ((|$unsigned($signed((reg7 & reg8)))) ?
                  {((reg6 < (~|reg9)) - {(reg11 | wire0), (^~wire3)}),
                      $signed((-(&wire0)))} : (($signed((^~wire1)) ^ {$signed(reg10),
                          reg7[(1'h1):(1'h1)]}) ?
                      reg12[(2'h2):(2'h2)] : ($signed((wire3 ^ reg6)) ?
                          {(reg11 ? wire2 : reg12)} : (~(~|(8'h9d))))));
              reg9 <= reg10[(1'h1):(1'h1)];
              reg10 <= (~(~^{reg11, reg5}));
              reg11 <= (&reg8);
              reg12 <= (8'ha9);
            end
        end
      else
        begin
          reg6 <= ((~&$signed(reg4[(1'h0):(1'h0)])) & (({(reg7 ? wire0 : reg8),
                      reg5} ?
                  reg9[(4'h9):(3'h6)] : ($signed((8'ha0)) ?
                      (reg8 - reg7) : (~&reg6))) ?
              reg5 : (8'hbf)));
          reg7 <= reg10[(1'h0):(1'h0)];
          reg8 <= (($signed($signed(wire3[(3'h6):(3'h6)])) ?
              (~&{(^~reg11),
                  (wire2 * (7'h43))}) : reg12[(1'h1):(1'h1)]) != reg4[(2'h2):(1'h0)]);
          reg9 <= wire0;
          reg10 <= (~&(^reg12[(3'h4):(2'h2)]));
        end
      reg13 <= reg9;
      if ((reg7[(1'h0):(1'h0)] ? reg4 : $unsigned((8'haf))))
        begin
          if (((~|(({reg13} ?
              reg4 : (reg8 ? wire2 : reg12)) ^~ ($unsigned(reg13) ?
              reg6 : (8'ha5)))) >= wire1))
            begin
              reg14 <= ((reg4 ?
                  $unsigned({(reg4 <= reg12),
                      $unsigned(reg4)}) : $signed((~$unsigned(reg5)))) ^ wire1[(5'h13):(4'hb)]);
            end
          else
            begin
              reg14 <= (|$unsigned(wire2[(3'h4):(3'h4)]));
              reg15 <= reg11[(4'hd):(4'h8)];
              reg16 <= $signed(reg15[(3'h6):(3'h4)]);
            end
          if (((reg12 == reg12[(3'h7):(2'h2)]) ?
              (reg9 ~^ (~|$signed(reg5[(1'h0):(1'h0)]))) : $unsigned($unsigned($unsigned($unsigned(wire3))))))
            begin
              reg17 <= $unsigned(reg16);
              reg18 <= reg14;
              reg19 <= (^~reg5[(2'h3):(2'h3)]);
              reg20 <= $unsigned({$unsigned($unsigned($unsigned(reg18))),
                  ($signed((wire1 - reg10)) * reg8)});
            end
          else
            begin
              reg17 <= $unsigned(reg17[(2'h2):(1'h1)]);
              reg18 <= (($signed((7'h43)) ? reg17[(3'h7):(3'h7)] : reg18) ?
                  (8'hb3) : {({(~^reg19), $signed(reg19)} ?
                          {(^reg7)} : (~|reg20[(3'h5):(1'h0)]))});
              reg19 <= $unsigned(reg5);
              reg20 <= $signed((~(^wire0[(2'h3):(1'h1)])));
            end
          reg21 <= reg18[(1'h0):(1'h0)];
          if (reg20[(1'h0):(1'h0)])
            begin
              reg22 <= (reg13 ^ (8'hab));
              reg23 <= ($signed(reg22) ?
                  $unsigned(wire1) : $unsigned((wire2 >>> reg11)));
              reg24 <= {($signed((reg18[(4'h8):(1'h0)] ?
                          {reg18, reg21} : (reg10 ^~ (7'h40)))) ?
                      $unsigned(({(8'hb0)} ^ reg4[(2'h2):(2'h2)])) : $signed($unsigned((reg18 ?
                          reg7 : reg6)))),
                  ((reg21 == $signed((wire3 ? wire2 : (8'hb7)))) ?
                      ((&((8'ha1) <= reg21)) > (8'hbd)) : reg12)};
              reg25 <= {reg15[(1'h1):(1'h0)],
                  $unsigned($signed(($signed(reg23) >> reg19)))};
            end
          else
            begin
              reg22 <= {$signed((~|((8'h9d) ^ reg16[(2'h3):(1'h0)]))),
                  (~|(((reg16 ?
                      reg22 : reg15) ~^ reg6[(2'h2):(1'h1)]) && (reg17 ?
                      reg8 : $signed(reg10))))};
              reg23 <= reg23;
              reg24 <= reg18;
            end
        end
      else
        begin
          if (reg4[(3'h5):(3'h5)])
            begin
              reg14 <= {($unsigned((~|$unsigned(reg9))) <= (~&reg13)),
                  (~&$signed(reg14))};
              reg15 <= (($unsigned((~^$signed(reg20))) ?
                  reg7[(4'hb):(2'h3)] : $signed(reg12)) == reg24);
              reg16 <= $signed((reg8[(1'h0):(1'h0)] ?
                  reg7[(2'h2):(2'h2)] : (!$unsigned(reg22))));
              reg17 <= {$unsigned((8'ha5)),
                  (reg23[(1'h0):(1'h0)] ?
                      (reg23[(2'h3):(2'h2)] ?
                          $unsigned((reg4 ?
                              reg6 : (8'ha8))) : (((8'ha7) >>> reg17) & wire0)) : reg11[(4'hd):(1'h0)])};
            end
          else
            begin
              reg14 <= $signed(wire1[(4'hc):(2'h2)]);
              reg15 <= reg15[(3'h6):(2'h3)];
              reg16 <= (~|$unsigned($unsigned((^$unsigned(reg8)))));
              reg17 <= (-reg11[(2'h2):(2'h2)]);
            end
          if (reg7)
            begin
              reg18 <= reg10[(2'h3):(2'h3)];
              reg19 <= reg25;
              reg20 <= $signed((!$signed(reg12[(2'h2):(2'h2)])));
            end
          else
            begin
              reg18 <= (~^(^$signed((8'hba))));
            end
          reg21 <= ((8'hb0) || $signed((-reg19)));
          if (reg20[(2'h3):(1'h1)])
            begin
              reg22 <= reg18[(2'h2):(1'h1)];
              reg23 <= (-$unsigned((+$signed($signed(reg23)))));
              reg24 <= (reg9 ? wire2 : reg25);
            end
          else
            begin
              reg22 <= reg17[(4'ha):(3'h5)];
              reg23 <= reg16;
              reg24 <= reg10;
              reg25 <= (reg15[(2'h2):(1'h1)] ?
                  $unsigned($signed((8'hb2))) : (reg11 ?
                      reg14[(4'hc):(4'h8)] : $unsigned($signed(reg13))));
            end
        end
    end
  assign wire26 = $unsigned(reg14[(4'hc):(3'h5)]);
  always
    @(posedge clk) begin
      reg27 <= $signed(reg18);
    end
  always
    @(posedge clk) begin
      reg28 <= (8'hb8);
    end
  assign wire29 = (reg25 ^ (8'hb4));
  assign wire30 = $unsigned((reg23 ?
                      ((((8'ha6) != (8'ha1)) >> (-reg28)) ?
                          (reg28 ?
                              reg14[(4'hc):(4'ha)] : (~|(8'h9d))) : (~$signed(wire29))) : (+(reg20[(2'h3):(2'h2)] || {reg14,
                          reg4}))));
  assign wire31 = ((8'had) >>> wire26);
endmodule
