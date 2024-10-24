module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h194):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire24,
                 wire23,
                 wire22,
                 wire10,
                 wire9,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(wire2[(4'hf):(4'h8)]);
      reg6 <= (|wire1);
      reg7 <= ($unsigned((wire4[(2'h2):(2'h2)] ?
          wire1 : $signed((wire0 ^~ reg5)))) > $unsigned((((+reg6) ?
              wire2[(3'h7):(2'h3)] : wire0[(4'h8):(3'h5)]) ?
          (^(wire0 || wire1)) : reg5[(4'ha):(3'h4)])));
      reg8 <= $signed($signed((wire0 ^~ $signed((+wire0)))));
    end
  assign wire9 = reg6[(3'h4):(3'h4)];
  assign wire10 = ((wire3 ?
                      wire2 : (^(wire0 != wire9[(2'h2):(1'h1)]))) ^~ (($unsigned((~^wire4)) ?
                          $unsigned($unsigned(reg7)) : ((8'hb8) ?
                              $unsigned(wire1) : reg5[(1'h1):(1'h0)])) ?
                      $signed($signed($signed(wire2))) : $unsigned($signed($signed(reg7)))));
  always
    @(posedge clk) begin
      reg11 <= (|$unsigned($unsigned($unsigned({reg7}))));
      reg12 <= wire0[(3'h6):(3'h4)];
      reg13 <= reg11[(2'h2):(1'h1)];
      if ((^wire0[(4'h9):(4'h8)]))
        begin
          reg14 <= (~(reg12[(4'hb):(4'hb)] ?
              $signed(reg12[(3'h5):(2'h3)]) : $signed(wire0[(1'h0):(1'h0)])));
          reg15 <= $unsigned(reg12[(3'h6):(1'h1)]);
          reg16 <= (&$unsigned({$signed((!wire9)),
              $signed($unsigned((8'hbb)))}));
          reg17 <= reg12[(2'h3):(2'h3)];
          reg18 <= $unsigned((~|$signed($signed($unsigned(reg17)))));
        end
      else
        begin
          reg14 <= ($signed($signed($unsigned(reg13[(2'h3):(2'h3)]))) >= reg7[(1'h0):(1'h0)]);
          reg15 <= ($unsigned(wire10) ?
              reg17[(2'h3):(1'h0)] : ($unsigned(reg13) ? reg16 : wire4));
          reg16 <= ((reg6[(2'h2):(1'h1)] ?
                  $signed((~reg16)) : $unsigned((reg16 ?
                      $unsigned(wire2) : {wire2}))) ?
              (wire2[(4'he):(2'h3)] & {$signed({(8'hab)}),
                  (^{wire10, reg17})}) : $unsigned((!wire9)));
          if (reg11)
            begin
              reg17 <= (wire3[(4'he):(3'h5)] ?
                  wire10[(4'hd):(2'h3)] : {($signed(reg18) ?
                          wire9[(2'h2):(1'h1)] : $unsigned($unsigned(reg16))),
                      {((!wire10) - (8'hab))}});
              reg18 <= wire1[(4'hc):(3'h4)];
              reg19 <= {$signed(wire4[(4'hb):(4'ha)]),
                  $signed((^wire9[(1'h1):(1'h0)]))};
              reg20 <= wire10;
              reg21 <= (reg14 & ((($unsigned(reg19) ?
                      reg20[(2'h2):(2'h2)] : reg19[(3'h6):(1'h1)]) ?
                  wire10[(1'h0):(1'h0)] : $signed((wire4 + reg8))) <<< ((^reg19) ?
                  ({reg20, reg7} >>> reg7) : {{reg7, reg14}})));
            end
          else
            begin
              reg17 <= (+(~$signed($unsigned((wire3 - reg7)))));
              reg18 <= ((wire3 ^ $unsigned(($signed(wire3) ?
                      reg5 : $unsigned(reg16)))) ?
                  reg6[(2'h3):(1'h0)] : reg6);
            end
        end
    end
  assign wire22 = ($unsigned($unsigned($signed(reg19))) >>> wire2[(2'h3):(2'h2)]);
  assign wire23 = reg21[(4'ha):(1'h0)];
  assign wire24 = $signed(((~|{reg20, reg15[(1'h1):(1'h0)]}) != ((&{(8'hbc),
                      wire0}) | reg11)));
  always
    @(posedge clk) begin
      reg25 <= wire4;
      if ({(~|(((reg21 ? wire4 : (7'h42)) ?
              reg18 : reg5[(2'h3):(2'h2)]) < {reg8, wire3[(3'h6):(1'h0)]})),
          $unsigned(($unsigned(wire9) & reg16))})
        begin
          if ((-reg12))
            begin
              reg26 <= $signed((~&($unsigned((reg8 << reg11)) && (~^(!wire0)))));
              reg27 <= wire9;
              reg28 <= {wire4[(3'h6):(1'h1)]};
            end
          else
            begin
              reg26 <= {reg21};
              reg27 <= $signed($signed(wire9[(1'h1):(1'h0)]));
              reg28 <= (reg21[(4'hd):(2'h3)] >= (reg27 ?
                  reg26[(4'hb):(2'h2)] : {$signed((wire4 ~^ reg14))}));
            end
          reg29 <= reg14[(4'hd):(1'h1)];
          reg30 <= (~&(8'hbf));
          if ($unsigned(wire3))
            begin
              reg31 <= (((reg13 ^ reg28) + reg17) + (8'hbc));
              reg32 <= $unsigned($unsigned(({reg12[(3'h5):(3'h4)]} || $unsigned((!wire2)))));
              reg33 <= (reg18 * (8'h9f));
              reg34 <= (reg16 - ((((wire23 <= (8'hb6)) ?
                  {wire4} : (reg6 ^~ reg5)) != $signed({reg20})) && reg27[(4'ha):(1'h0)]));
              reg35 <= wire23[(3'h4):(2'h2)];
            end
          else
            begin
              reg31 <= (!(~^$unsigned(((wire3 ? reg27 : reg20) ^~ (^~wire4)))));
              reg32 <= (+(wire2 ^ reg34));
            end
          reg36 <= {$signed((reg29 >>> $signed(reg12[(3'h4):(2'h3)]))),
              (wire23 * reg28)};
        end
      else
        begin
          reg26 <= $signed(($unsigned($unsigned((reg18 >> reg30))) ?
              (reg35[(1'h0):(1'h0)] ?
                  ((reg29 ? reg11 : (7'h41)) ?
                      $signed((8'h9c)) : $signed(reg8)) : (8'hb1)) : {$signed(((8'hbd) ?
                      reg26 : reg16)),
                  ({reg16} ? reg13 : wire24)}));
          reg27 <= $signed($signed((((8'hac) ?
              (wire22 ?
                  reg8 : (8'ha3)) : reg8[(4'h8):(2'h3)]) <= $signed(wire22[(4'hf):(3'h4)]))));
          if (reg26[(5'h11):(4'h8)])
            begin
              reg28 <= $unsigned((reg25 || (reg18[(1'h0):(1'h0)] ?
                  wire2 : ((reg5 ~^ (8'ha1)) < $signed(wire4)))));
            end
          else
            begin
              reg28 <= (8'ha1);
              reg29 <= $signed($signed(reg8));
              reg30 <= $unsigned($unsigned(wire4));
            end
          if ((+$signed((~reg5[(3'h5):(1'h0)]))))
            begin
              reg31 <= (~^$unsigned(wire22));
              reg32 <= $signed(reg13);
            end
          else
            begin
              reg31 <= reg15[(3'h6):(2'h3)];
              reg32 <= (~^$unsigned(reg27));
            end
        end
      reg37 <= {{reg19[(4'h8):(3'h7)], reg11[(4'hc):(2'h3)]}};
    end
  assign wire38 = $unsigned(($unsigned({$unsigned(reg13), (!(8'hbe))}) ?
                      (!(8'hb0)) : {($signed(reg21) > (wire23 ^~ wire2))}));
  assign wire39 = ((+$signed((reg8 >> (reg5 >= wire4)))) ?
                      reg6 : $signed(reg34[(4'hb):(2'h3)]));
endmodule
