module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire16,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (-$unsigned(wire2[(1'h1):(1'h0)]));
  assign wire6 = (|wire5);
  assign wire7 = wire1;
  always
    @(posedge clk) begin
      if ((wire3[(4'h9):(3'h5)] ?
          ((($signed((8'ha4)) ?
              wire2[(1'h1):(1'h0)] : wire0[(3'h5):(3'h5)]) ^ (~{wire6})) ~^ (wire3[(4'h8):(2'h3)] * (^~(wire0 ?
              wire0 : wire5)))) : wire7[(4'h8):(2'h2)]))
        begin
          reg8 <= (wire0[(1'h0):(1'h0)] ?
              $unsigned({(wire4 ?
                      $unsigned(wire0) : (wire1 ?
                          wire4 : wire6))}) : (^$signed((wire4 ?
                  (8'hae) : wire2))));
          reg9 <= wire1;
          reg10 <= wire0[(2'h3):(2'h3)];
          reg11 <= $signed(((7'h41) ? {wire4} : $unsigned({(wire7 ^ wire2)})));
          reg12 <= {(~^reg9)};
        end
      else
        begin
          reg8 <= ((~^(^~$unsigned(wire2[(2'h2):(1'h1)]))) ?
              ($signed(wire0[(2'h2):(1'h1)]) << $signed((wire4[(4'ha):(1'h0)] ?
                  reg10[(3'h6):(2'h3)] : $unsigned(wire1)))) : (wire1 ^ (wire2 & wire0[(4'hc):(1'h0)])));
          reg9 <= wire2[(1'h0):(1'h0)];
          if ($signed(reg9))
            begin
              reg10 <= $signed((~^wire4[(3'h5):(1'h0)]));
            end
          else
            begin
              reg10 <= $signed($unsigned($unsigned((~^(wire5 ?
                  wire0 : wire2)))));
              reg11 <= ({reg8[(3'h5):(3'h5)]} <<< $signed($unsigned(wire4[(1'h1):(1'h0)])));
              reg12 <= wire3[(5'h14):(3'h5)];
            end
          reg13 <= reg11[(2'h3):(2'h2)];
          reg14 <= (8'ha0);
        end
      reg15 <= ({(wire1 >> (reg8[(1'h1):(1'h1)] ?
                  wire3[(5'h13):(2'h3)] : (8'hb5))),
              (reg11 ~^ wire3)} ?
          $unsigned($signed(reg14)) : (!reg9[(4'hc):(3'h5)]));
    end
  assign wire16 = $unsigned($unsigned((wire1 ?
                      reg11 : $signed(reg8[(3'h6):(1'h1)]))));
endmodule
