module top
#(parameter param11 = (((~|(((8'ha7) ? (8'hbf) : (8'ha9)) ? ((7'h40) == (8'hb9)) : (+(8'ha5)))) ? {{((7'h41) ? (8'hb5) : (8'hb9)), ((8'hae) < (8'h9e))}, (8'h9f)} : ((((8'h9d) ? (8'hbc) : (8'hbd)) || {(7'h42)}) < (~^((8'haa) ? (8'h9c) : (8'ha1))))) >= (|((((8'hb1) ? (8'h9f) : (7'h41)) && ((8'ha4) ? (8'hb2) : (8'hb2))) <<< ((~^(8'ha9)) ? (^~(8'h9d)) : ((8'ha6) >> (8'hb6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg10, reg9, reg8, (1'h0)};
  assign wire5 = wire3;
  assign wire6 = ({wire3[(2'h3):(1'h0)]} & (8'hb9));
  assign wire7 = $unsigned($signed($signed((!(wire1 ? wire5 : wire1)))));
  always
    @(posedge clk) begin
      reg8 <= wire6[(5'h12):(3'h7)];
      reg9 <= ({$unsigned({{(8'ha3)}}), wire4[(2'h2):(2'h2)]} ?
          $unsigned((+{(8'hb1)})) : $signed($unsigned(wire3)));
      reg10 <= (^~{(wire7 ? $signed({wire0, reg9}) : wire4[(4'h9):(3'h4)])});
    end
endmodule
