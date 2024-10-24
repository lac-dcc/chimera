module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire4,
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
  assign wire4 = $unsigned({$unsigned($unsigned(wire3[(3'h7):(3'h5)])),
                     {($unsigned(wire0) ? $unsigned((8'h9e)) : (&wire2)),
                         ($signed(wire0) ^ wire3)}});
  always
    @(posedge clk) begin
      reg5 <= ((8'ha5) >>> wire2[(5'h10):(4'hb)]);
      reg6 <= wire3;
      if ((wire3[(2'h2):(1'h0)] ?
          $signed(wire0[(1'h1):(1'h0)]) : $unsigned(wire2)))
        begin
          reg7 <= (~|wire0);
        end
      else
        begin
          if ($unsigned((8'hbf)))
            begin
              reg7 <= wire2;
              reg8 <= {(~&{$signed((wire2 ? wire1 : wire4))})};
              reg9 <= {(~&reg8[(4'hb):(4'ha)])};
              reg10 <= $unsigned($signed(($signed($unsigned(reg7)) ?
                  wire3 : wire1[(1'h0):(1'h0)])));
              reg11 <= wire3;
            end
          else
            begin
              reg7 <= ({$signed($unsigned($unsigned(reg5)))} | wire3);
            end
          if ($signed(((~&(wire0 ?
              $signed((8'hb1)) : {wire4,
                  reg9})) >>> $unsigned($unsigned((reg6 | reg6))))))
            begin
              reg12 <= ((((~^{(8'hb5)}) ?
                      ((&(8'hbd)) <<< (8'hb7)) : (8'hba)) < reg11[(3'h7):(1'h0)]) ?
                  reg6[(3'h6):(2'h3)] : ({((reg9 ^ reg9) & $unsigned((8'h9c)))} ?
                      reg7 : reg5[(4'hc):(4'h9)]));
              reg13 <= $signed((reg10[(2'h2):(1'h0)] <= (($signed((8'hb8)) < $unsigned((8'ha5))) < (wire2[(4'hd):(2'h3)] ?
                  reg7 : (wire4 ? wire0 : reg5)))));
              reg14 <= (($unsigned(reg9) ?
                  {{$signed(wire3), (reg9 ? wire3 : wire1)},
                      $signed($unsigned(reg13))} : ((~^reg8[(1'h1):(1'h0)]) ?
                      $unsigned({(8'hb3)}) : ((7'h43) ?
                          (reg10 ? reg8 : reg13) : wire1))) >>> reg6);
              reg15 <= $signed(wire4[(4'hc):(4'h8)]);
            end
          else
            begin
              reg12 <= wire2;
              reg13 <= $signed((wire0 << (|$unsigned($signed(reg15)))));
              reg14 <= (!wire1[(3'h4):(1'h0)]);
              reg15 <= reg13;
              reg16 <= wire1;
            end
        end
    end
  assign wire17 = $signed($signed(reg13[(3'h6):(3'h6)]));
  assign wire18 = reg7[(3'h6):(3'h4)];
  assign wire19 = reg12;
endmodule
