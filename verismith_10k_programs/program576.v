module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, reg12, reg11, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire5 = (|wire4);
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= ($signed({(|wire6[(4'h9):(3'h7)]),
              ((wire4 ? (8'hb8) : wire4) >>> wire6)}) ?
          wire0 : wire3);
    end
  always
    @(posedge clk) begin
      reg8 <= ((wire0 | $signed(((wire5 < wire3) ?
          (wire6 ? wire1 : wire1) : (wire4 ?
              wire3 : wire2)))) | $unsigned($unsigned(wire1[(4'hf):(1'h1)])));
      reg9 <= ((8'ha5) ?
          ((wire1[(4'he):(4'he)] >>> $signed($signed(wire5))) ?
              (~wire5[(4'h9):(3'h7)]) : ((((8'hb7) ? (8'hbe) : wire0) ?
                      reg7 : $signed(wire1)) ?
                  (&(wire6 << reg8)) : $signed(((7'h42) ^~ wire5)))) : $signed((reg8 * wire6[(5'h13):(4'hc)])));
      reg10 <= (^{($unsigned(wire3[(1'h0):(1'h0)]) ^~ ((&wire3) ^ reg8[(3'h4):(2'h3)])),
          ((!$unsigned(wire4)) ?
              (wire6[(3'h4):(1'h0)] ?
                  $unsigned(wire3) : wire6) : $signed(reg8))});
      reg11 <= {(wire4 ?
              (({reg9, wire6} ? $signed(wire0) : (wire5 ? (8'hae) : wire6)) ?
                  $unsigned(reg10) : $unsigned((wire4 >>> reg10))) : $unsigned(reg8))};
      reg12 <= (~&wire2);
    end
endmodule
