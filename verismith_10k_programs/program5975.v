module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (8'hae);
  assign wire6 = wire5;
  assign wire7 = (^~{$signed((^~$unsigned(wire4))), wire4});
  assign wire8 = wire4;
  always
    @(posedge clk) begin
      reg9 <= (wire4 >> (~&{wire0}));
      if ({wire6[(2'h2):(2'h2)]})
        begin
          reg10 <= ((wire3[(2'h2):(1'h0)] - $unsigned($unsigned((wire0 << wire7)))) ?
              (~&(&(!(wire6 ^~ wire2)))) : {$signed((wire2 ?
                      wire1 : ((8'hb4) | wire2))),
                  wire7});
          reg11 <= $unsigned({wire1[(4'h8):(1'h1)], $signed((8'ha7))});
          reg12 <= $signed($signed(wire1));
          reg13 <= wire2[(3'h5):(2'h3)];
          reg14 <= (reg9 ?
              $signed(($unsigned((+reg13)) ?
                  (((8'hb9) == wire7) >= (wire6 ?
                      reg12 : wire4)) : reg10)) : $signed($unsigned((~(^~wire6)))));
        end
      else
        begin
          reg10 <= $unsigned($signed(wire4));
        end
      reg15 <= $unsigned($signed((reg12 ?
          wire3[(4'hc):(1'h1)] : wire8[(3'h4):(1'h1)])));
      reg16 <= (!wire8[(3'h6):(3'h6)]);
      reg17 <= wire4[(3'h4):(1'h0)];
    end
endmodule
