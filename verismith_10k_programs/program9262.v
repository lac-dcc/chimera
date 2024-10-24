module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
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
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= ($signed(wire4[(3'h4):(1'h1)]) ?
          wire4[(2'h2):(1'h0)] : wire4[(2'h2):(1'h0)]);
      reg7 <= $signed((-(!$signed(wire4[(3'h4):(3'h4)]))));
      reg8 <= reg6[(2'h3):(2'h3)];
      reg9 <= wire2;
      if ($signed({wire5}))
        begin
          reg10 <= (reg9[(3'h5):(3'h4)] ?
              wire5 : (~^($signed({reg7, reg7}) ?
                  $unsigned(((8'hbd) < wire4)) : {(reg8 ? (8'hb4) : (7'h43)),
                      (reg8 | (8'hbf))})));
          reg11 <= wire2[(1'h1):(1'h0)];
          reg12 <= {($unsigned((^{reg7})) ^~ (((|reg6) | {reg10}) * reg9[(4'hc):(1'h1)])),
              $signed({(reg9[(2'h2):(1'h1)] ? reg8[(4'hb):(4'ha)] : wire4),
                  reg7})};
        end
      else
        begin
          reg10 <= (+$signed((reg6 ^~ (+$unsigned((8'ha6))))));
          reg11 <= {$unsigned(($unsigned({wire5}) ^~ reg10[(1'h0):(1'h0)]))};
          if ({{(($signed(reg10) * reg9[(3'h6):(2'h3)]) ^ $signed((reg8 ?
                      wire2 : (8'hbd))))},
              reg10[(5'h10):(4'ha)]})
            begin
              reg12 <= (~|(reg10[(4'he):(4'he)] ?
                  ($unsigned($unsigned((8'ha3))) <<< wire4) : $unsigned(((-(8'h9c)) ?
                      (~reg10) : (reg11 > reg12)))));
              reg13 <= $unsigned($signed($signed(((~|reg6) & reg6))));
              reg14 <= $unsigned($unsigned((((&wire1) ^ reg13) ?
                  reg13[(4'hd):(4'hb)] : wire3)));
            end
          else
            begin
              reg12 <= $unsigned(($unsigned((wire2[(3'h5):(2'h3)] ?
                  wire5[(4'hd):(3'h7)] : $unsigned(wire1))) == $signed((^$signed(reg8)))));
              reg13 <= reg8[(3'h5):(3'h4)];
              reg14 <= $unsigned((((&{wire5}) <= reg13[(4'hf):(2'h2)]) || ((^$signed(wire2)) ^ $signed(reg6))));
            end
          reg15 <= $signed((~^(((wire2 ? reg9 : wire3) ~^ ((8'hbc) ?
                  reg14 : reg10)) ?
              reg9 : {{reg13, wire4}, (|reg9)})));
          reg16 <= ((|$unsigned((reg11 * (reg6 || reg15)))) ?
              wire2[(3'h6):(3'h5)] : (^((8'hb6) < $unsigned(((8'hbf) ?
                  reg13 : wire0)))));
        end
    end
  assign wire17 = (+((reg11 <<< reg7[(2'h2):(2'h2)]) ?
                      reg11 : (&((-reg14) ?
                          (reg16 ? reg6 : wire1) : $signed(wire1)))));
  assign wire18 = (reg13[(3'h6):(1'h0)] && reg14[(3'h6):(3'h5)]);
  assign wire19 = $unsigned($unsigned(reg13));
  assign wire20 = (reg8 & $unsigned({((wire18 <<< (8'ha8)) ?
                          $signed(wire5) : (wire1 || (8'hb1))),
                      wire1}));
  assign wire21 = wire18;
  assign wire22 = (+(($signed($signed(wire19)) << $unsigned((wire0 ?
                          wire2 : (8'hba)))) ?
                      (~&(-$signed(wire20))) : reg9));
  assign wire23 = reg16[(2'h2):(2'h2)];
endmodule
