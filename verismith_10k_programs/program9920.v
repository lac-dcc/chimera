module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire20,
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
  assign wire5 = ($unsigned((wire0 == (wire3[(1'h1):(1'h0)] <= wire0[(4'hf):(4'hb)]))) < $unsigned($unsigned((wire0 || ((8'ha2) ?
                     wire0 : wire4)))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire4);
      if (($signed(reg6) ?
          $signed(wire3[(4'ha):(1'h0)]) : $signed((({wire1,
              wire4} || wire2[(1'h1):(1'h0)]) - ($unsigned(wire2) ?
              (^~reg6) : reg6)))))
        begin
          reg7 <= ((!$unsigned((~^$unsigned(wire1)))) != (~&((wire3 ?
                  ((8'hbc) < wire0) : $signed(wire5)) ?
              ((wire0 ? (8'ha0) : wire1) ^~ $unsigned(wire3)) : ((~^wire2) ?
                  {wire0, wire2} : (wire2 ? wire0 : wire5)))));
          reg8 <= (^$unsigned(wire0));
          if (((wire3 ?
                  (~($unsigned(reg6) ?
                      (!wire1) : {wire2})) : {$unsigned(wire5[(1'h1):(1'h1)])}) ?
              wire5[(1'h0):(1'h0)] : {(7'h43), $unsigned($signed(reg6))}))
            begin
              reg9 <= (wire0[(4'hb):(4'h8)] || $unsigned(($unsigned((reg6 <<< (8'hb8))) == wire2[(1'h0):(1'h0)])));
              reg10 <= reg6[(3'h7):(3'h6)];
            end
          else
            begin
              reg9 <= $signed({(wire3 << wire2[(3'h7):(2'h2)]),
                  ($signed((!wire0)) && wire1)});
              reg10 <= reg6[(4'hb):(4'h8)];
            end
          reg11 <= reg6[(4'ha):(2'h2)];
          if ((^{(~&wire0[(1'h0):(1'h0)])}))
            begin
              reg12 <= (wire3 ^~ $unsigned(reg10));
              reg13 <= reg12[(2'h3):(1'h0)];
              reg14 <= (wire4[(5'h10):(4'hc)] ? wire5 : reg12[(3'h6):(3'h4)]);
            end
          else
            begin
              reg12 <= reg11[(1'h1):(1'h1)];
              reg13 <= (8'ha5);
            end
        end
      else
        begin
          reg7 <= ((^$signed($unsigned((reg10 ? (8'hbf) : (8'h9e))))) ?
              {reg14} : ($signed((reg13[(5'h11):(4'hd)] ?
                      {wire2, wire0} : $unsigned(wire2))) ?
                  (!wire2[(1'h0):(1'h0)]) : $unsigned((wire2[(1'h0):(1'h0)] == (8'hbe)))));
          reg8 <= reg8;
        end
      reg15 <= (8'hb3);
      reg16 <= reg14;
    end
  assign wire17 = reg14;
  assign wire18 = {$signed(reg7[(4'h9):(3'h6)])};
  assign wire19 = $unsigned({(((reg16 ?
                          wire2 : wire17) ^ (reg8 <= reg8)) == $signed($signed(reg9))),
                      $signed($unsigned(reg14))});
  assign wire20 = {$unsigned($signed(reg13))};
endmodule
