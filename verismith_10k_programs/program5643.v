module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
                 wire5,
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
  assign wire5 = (-(&wire1[(4'hb):(4'ha)]));
  assign wire6 = $signed(wire2[(3'h5):(3'h4)]);
  assign wire7 = {$signed($signed($signed((|wire3))))};
  always
    @(posedge clk) begin
      reg8 <= (|$signed(((~&$unsigned(wire6)) ?
          $unsigned(wire0[(1'h0):(1'h0)]) : ((wire5 ? wire5 : wire5) ?
              wire2 : wire0[(1'h0):(1'h0)]))));
      reg9 <= (|($unsigned(((reg8 ? wire2 : wire2) ?
          $signed(wire1) : ((8'hb0) ?
              (7'h40) : wire1))) | wire4[(1'h1):(1'h0)]));
      reg10 <= $unsigned(wire5);
      if (wire6)
        begin
          reg11 <= (8'hba);
        end
      else
        begin
          reg11 <= (&(~(($unsigned(wire6) ?
                  $unsigned(wire2) : (wire6 == (7'h44))) ?
              $unsigned(reg8[(3'h6):(2'h2)]) : reg11)));
          reg12 <= {reg8};
          if ((~|((~&$signed($unsigned(reg11))) ?
              reg8 : (^~wire1[(5'h14):(3'h7)]))))
            begin
              reg13 <= $unsigned($signed(wire5));
              reg14 <= (wire3 << $signed(reg12));
              reg15 <= (((wire0 > {wire3}) + reg9[(1'h1):(1'h1)]) >= ({wire2[(3'h4):(3'h4)]} != $unsigned((^reg12))));
              reg16 <= $signed((reg12 ~^ (($unsigned((7'h41)) ?
                  $unsigned(wire5) : $unsigned(wire2)) | (^(reg11 ?
                  reg15 : wire0)))));
            end
          else
            begin
              reg13 <= ($unsigned($unsigned($unsigned((wire3 ?
                  wire1 : reg8)))) | $unsigned((|reg13[(3'h5):(3'h5)])));
              reg14 <= ({$unsigned((8'h9d)),
                  ((~^wire3) ?
                      $unsigned(reg16) : $signed(reg13[(5'h10):(2'h2)]))} + wire7[(1'h0):(1'h0)]);
              reg15 <= ({$signed(({reg15, (8'ha3)} ?
                          $unsigned(reg15) : (reg12 ? (8'hb8) : wire7)))} ?
                  wire6 : ($signed((~reg12)) ?
                      (reg8[(4'h9):(3'h6)] - (&{wire4})) : (~wire7[(4'h8):(3'h7)])));
            end
          reg17 <= $unsigned($unsigned(wire0));
        end
      reg18 <= reg15;
    end
endmodule
