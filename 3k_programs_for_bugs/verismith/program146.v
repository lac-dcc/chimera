module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg10, reg9, reg8, reg7, (1'h0)};
  assign wire4 = (wire0 ^~ (wire1 ? (-wire0) : wire1));
  assign wire5 = $signed((wire4 * $unsigned($signed(wire4))));
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= (((!wire6) || wire6) ? $signed(wire2) : (!wire5));
      reg8 <= (((~&((reg7 ~^ reg7) < (^(8'hb5)))) << {$signed((wire0 ?
                  (8'ha2) : wire6)),
              wire1}) ?
          ($unsigned((^~{wire3, wire2})) << (~^$unsigned((wire6 ?
              wire6 : wire2)))) : wire4[(1'h0):(1'h0)]);
      reg9 <= (|($unsigned(((+wire0) ? reg7[(3'h6):(2'h2)] : {wire2, wire5})) ?
          ((-(~|(8'hb7))) < $signed(((8'ha7) ?
              reg8 : reg8))) : (!wire2[(1'h0):(1'h0)])));
      reg10 <= wire3;
    end
endmodule
