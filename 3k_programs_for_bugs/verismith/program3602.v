module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire31,
                 wire28,
                 wire27,
                 wire26,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
                 reg30,
                 reg29,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
  assign wire4 = $unsigned($signed($unsigned((!((8'hbd) ? wire0 : wire3)))));
  always
    @(posedge clk) begin
      if (($signed(((-$unsigned(wire2)) ?
              wire3 : ({wire0, wire2} ?
                  (wire3 != (8'hb2)) : $unsigned(wire1)))) ?
          wire3 : wire3[(4'he):(4'hd)]))
        begin
          reg5 <= ({((((8'hb8) ? wire2 : (8'ha2)) ?
                  wire4[(1'h1):(1'h1)] : (wire4 >= wire4)) * wire3[(3'h4):(1'h1)]),
              wire1} < $unsigned($unsigned((wire0 ?
              $unsigned(wire3) : (wire2 - wire2)))));
          reg6 <= $unsigned((wire4[(1'h1):(1'h0)] || $unsigned(wire4)));
          reg7 <= $unsigned((&$signed(((wire4 || reg5) ?
              (-wire2) : ((8'h9f) ? reg6 : wire0)))));
        end
      else
        begin
          reg5 <= {((~|((reg6 ? (8'hac) : wire2) ?
                  $signed(wire1) : (reg7 ? wire0 : reg6))) >= $signed((&{wire0,
                  wire1})))};
          if ((reg6[(2'h3):(2'h3)] ?
              (($signed((reg7 >> (8'hb8))) & wire3) & ($unsigned((wire1 ?
                  wire3 : wire2)) <<< wire3[(3'h5):(3'h4)])) : wire2[(5'h11):(2'h3)]))
            begin
              reg6 <= $signed(((&wire4[(2'h2):(1'h1)]) >> wire4));
              reg7 <= reg6[(1'h1):(1'h0)];
              reg8 <= $signed($signed((reg7[(1'h0):(1'h0)] ?
                  reg5 : (wire4[(2'h3):(1'h1)] ?
                      (wire0 & wire1) : $unsigned(wire1)))));
            end
          else
            begin
              reg6 <= reg8;
              reg7 <= (-{(wire0 ~^ (~|{wire0}))});
              reg8 <= (~^(($signed(wire4) <= ($unsigned(wire3) ?
                  $unsigned((8'hb9)) : reg8)) ^~ wire3));
              reg9 <= reg7;
            end
          if ((($signed(wire1[(4'h8):(3'h4)]) ?
                  reg9 : ({(reg7 << wire3)} ?
                      ($unsigned(reg9) && (&wire0)) : {wire4[(1'h1):(1'h1)]})) ?
              wire3[(3'h5):(2'h3)] : ($unsigned($signed($signed(wire4))) && $unsigned(reg7))))
            begin
              reg10 <= (+wire3[(3'h4):(1'h0)]);
              reg11 <= $signed(wire2);
              reg12 <= $unsigned((wire3 && (+(+(reg8 ? (8'hb1) : reg10)))));
              reg13 <= ($unsigned($unsigned(($signed(reg6) <<< $unsigned(reg8)))) ?
                  (&$unsigned((reg11[(4'hc):(3'h7)] < reg10[(2'h3):(2'h3)]))) : (reg9 << $unsigned((&(wire1 ?
                      (8'ha1) : wire4)))));
            end
          else
            begin
              reg10 <= ({$signed(((wire4 ? (8'hb6) : wire4) ?
                          $unsigned(reg6) : {reg10, (8'h9e)})),
                      $signed((!$signed(reg12)))} ?
                  {(~&$unsigned((wire1 ~^ reg13))),
                      ((((8'ha5) ? wire0 : reg10) ?
                          (wire1 ?
                              reg5 : wire0) : ((7'h44) > reg11)) * ({(8'hb8)} ?
                          reg6 : (reg10 ?
                              reg7 : reg8)))} : ($signed(wire4[(2'h3):(2'h3)]) ?
                      reg9 : $signed($unsigned((reg6 < reg8)))));
            end
          reg14 <= (~|(~^wire2));
        end
      reg15 <= reg8[(2'h2):(1'h1)];
      reg16 <= ({{($unsigned(wire3) ? (^reg11) : (wire4 == (8'ha9)))},
              (($unsigned(reg10) == (wire2 ^~ reg11)) >> wire2[(4'h9):(2'h2)])} ?
          $signed($signed(reg5)) : (^(8'ha3)));
    end
  assign wire17 = reg16;
  assign wire18 = (^$unsigned((|($unsigned(wire0) ?
                      $signed((7'h40)) : wire3))));
  assign wire19 = (^~wire0);
  always
    @(posedge clk) begin
      reg20 <= (($signed(((reg6 ? reg14 : reg12) ?
          (reg5 ^~ (8'hbf)) : (reg5 ?
              reg14 : reg8))) ^ (8'ha5)) != (($signed(reg10[(4'hc):(4'hb)]) - (8'hb6)) >> $signed($signed((&wire1)))));
      reg21 <= ($signed(reg10) == wire1[(4'hf):(3'h6)]);
      if ((~^reg16[(3'h6):(3'h5)]))
        begin
          reg22 <= {wire0[(1'h0):(1'h0)], {reg7}};
        end
      else
        begin
          reg22 <= reg12[(2'h2):(1'h0)];
          reg23 <= (8'hb6);
          reg24 <= ($signed(reg12) ?
              $unsigned((8'hbd)) : {((&$signed((8'hbe))) << reg23[(4'ha):(2'h2)]),
                  reg8});
          reg25 <= wire0[(2'h3):(2'h3)];
        end
    end
  assign wire26 = $signed((((reg7 - ((8'had) | wire19)) ?
                      ($unsigned((8'ha0)) && (reg16 << wire17)) : ((^wire1) ?
                          (-reg7) : (+reg9))) < reg14));
  assign wire27 = $unsigned(reg6);
  assign wire28 = (|wire0[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg29 <= (wire4 ^~ (~$signed(wire3[(3'h5):(1'h1)])));
      reg30 <= (((((reg12 << wire18) ?
              (reg12 ? (8'ha1) : (8'hbd)) : (wire3 ^ reg9)) + (+(wire28 ?
              wire0 : reg22))) ^ (~^$unsigned((wire1 && reg11)))) ?
          reg20 : $unsigned(reg10[(2'h2):(2'h2)]));
    end
  assign wire31 = $unsigned((!(reg30[(3'h4):(2'h3)] ?
                      reg22[(2'h3):(2'h2)] : (((8'had) - reg5) > $unsigned(reg25)))));
endmodule
