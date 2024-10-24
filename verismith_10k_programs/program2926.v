module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      if (wire3)
        begin
          if ($signed(({$signed(wire2[(1'h1):(1'h1)])} ?
              wire0 : wire4[(4'hb):(4'ha)])))
            begin
              reg6 <= wire0[(2'h2):(1'h1)];
              reg7 <= (^((~^$unsigned(wire4[(4'ha):(1'h0)])) ?
                  (&wire4) : (+reg6[(1'h0):(1'h0)])));
              reg8 <= wire2[(4'hd):(3'h4)];
              reg9 <= (((+$unsigned(wire5[(1'h0):(1'h0)])) || (8'h9c)) == (($signed(((8'hb8) ?
                  wire4 : wire0)) != {{wire1},
                  $unsigned(reg6)}) << ($unsigned(reg7[(4'hf):(2'h3)]) ?
                  $signed($unsigned(wire0)) : $unsigned((wire1 ?
                      wire1 : wire2)))));
              reg10 <= (($signed((((8'hbe) ^~ wire1) ? (8'hb9) : reg9)) ?
                  ($signed(wire3[(2'h3):(2'h3)]) ?
                      ((wire3 >> wire5) ?
                          wire5 : reg9[(3'h6):(3'h6)]) : $unsigned((8'h9f))) : $unsigned(reg8)) <= $signed($unsigned($unsigned((reg8 ?
                  (8'ha7) : wire1)))));
            end
          else
            begin
              reg6 <= (!$signed($unsigned(reg9[(3'h6):(2'h2)])));
              reg7 <= $signed((|$signed(reg6[(2'h2):(2'h2)])));
              reg8 <= ($unsigned((wire4 ?
                  wire5 : (reg10[(3'h7):(3'h5)] == (8'hbe)))) <<< reg9);
            end
          reg11 <= ($signed(wire1[(1'h0):(1'h0)]) <<< reg7[(4'hc):(3'h6)]);
          if (wire1[(4'hc):(4'hb)])
            begin
              reg12 <= ($signed({($signed(wire3) & $unsigned((8'haf)))}) ?
                  $unsigned((8'hac)) : $unsigned($unsigned(wire5)));
              reg13 <= $signed(($signed(($unsigned(reg8) <<< $unsigned((8'hbc)))) ?
                  reg11 : $signed(reg8[(1'h1):(1'h0)])));
              reg14 <= $signed($signed($signed(wire5[(2'h3):(2'h3)])));
              reg15 <= $unsigned($unsigned({reg8}));
              reg16 <= $signed($signed($unsigned($signed({(8'ha8), reg13}))));
            end
          else
            begin
              reg12 <= $signed($signed(($unsigned(wire0) ?
                  wire3[(2'h2):(1'h1)] : $unsigned({reg7, reg14}))));
              reg13 <= (reg6 >> wire0);
            end
          reg17 <= (wire1 * (+($signed($signed(reg10)) ? wire4 : wire0)));
        end
      else
        begin
          reg6 <= (((8'hbf) && $unsigned($unsigned(reg7[(4'h9):(1'h1)]))) ?
              reg17[(3'h4):(2'h2)] : reg14[(4'he):(3'h6)]);
          reg7 <= (({$signed((^~reg9)), reg7[(2'h3):(1'h1)]} ?
              (8'hb2) : wire4[(2'h2):(2'h2)]) || $signed(reg10));
          reg8 <= (((8'ha2) ?
                  ((~|(^(8'had))) > reg12) : $signed($signed(reg15[(1'h1):(1'h0)]))) ?
              (~&wire2[(2'h3):(1'h1)]) : reg17);
          if ((&$unsigned(($unsigned({reg15}) ?
              $signed({(8'ha7), reg7}) : {reg12[(4'h9):(1'h0)],
                  {wire1, reg16}}))))
            begin
              reg9 <= $unsigned($signed($unsigned($unsigned($signed(wire5)))));
              reg10 <= {reg7[(4'hc):(3'h5)],
                  ($signed($unsigned($signed(wire3))) ?
                      $signed($signed($signed(reg16))) : wire0)};
            end
          else
            begin
              reg9 <= $signed((reg10 ?
                  (&((reg6 ?
                      reg11 : (8'ha6)) ^~ reg15)) : {$unsigned($unsigned(wire3)),
                      {$signed((8'hb3)), (wire1 ? reg11 : reg17)}}));
              reg10 <= wire0[(1'h0):(1'h0)];
              reg11 <= $unsigned($signed($unsigned(reg12)));
              reg12 <= (!reg15[(1'h0):(1'h0)]);
              reg13 <= wire1[(4'h8):(1'h1)];
            end
        end
      reg18 <= $signed((&reg6));
      if ((~$unsigned((wire1[(4'hc):(2'h3)] ^~ reg8[(2'h2):(1'h1)]))))
        begin
          reg19 <= (~(~&reg12));
          reg20 <= ($unsigned((reg18 ?
              wire1[(4'h8):(2'h2)] : (((8'hbf) > reg18) ?
                  $unsigned(wire2) : (!reg12)))) ^~ reg12[(1'h0):(1'h0)]);
        end
      else
        begin
          reg19 <= (reg11[(4'h8):(3'h7)] >= ((reg17 & {(reg13 ? reg9 : wire0),
                  reg9}) ?
              $signed(((~^reg12) < (~|reg14))) : {($unsigned(reg10) ?
                      (reg16 ? reg20 : wire2) : $signed(wire1)),
                  (reg6 ? $signed((8'hbf)) : (+reg14))}));
        end
    end
  assign wire21 = reg14[(4'hd):(4'ha)];
  assign wire22 = (((~|reg15[(4'he):(4'h9)]) ?
                          wire3[(2'h2):(2'h2)] : (reg16 != reg16)) ?
                      (wire0 <<< ($unsigned((wire2 ^ reg10)) || (reg20 + (reg10 ?
                          wire4 : (8'h9c))))) : reg20);
  assign wire23 = reg19;
  assign wire24 = (~&reg15);
  assign wire25 = ((~(~&reg10)) ?
                      (8'hb6) : ((($unsigned(wire5) ?
                              $unsigned(reg20) : (wire21 ? (8'hb0) : reg16)) ?
                          ((reg16 - reg13) ?
                              (reg12 ?
                                  reg15 : (8'hab)) : {wire0}) : (8'hb6)) || (!$unsigned($signed(reg7)))));
  assign wire26 = ((8'had) ?
                      ({(|((8'h9e) ? (8'hba) : wire2))} ?
                          wire2[(4'ha):(3'h5)] : reg17[(1'h0):(1'h0)]) : $unsigned((~|(8'ha0))));
  assign wire27 = wire25;
endmodule
