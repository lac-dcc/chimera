module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg10, reg9, reg8, (1'h0)};
  assign wire5 = (wire3[(5'h15):(5'h14)] && wire2);
  assign wire6 = $unsigned(wire0[(4'he):(2'h3)]);
  assign wire7 = $unsigned({($signed((wire5 ?
                         wire5 : wire3)) >> wire4[(4'hd):(3'h4)]),
                     (|($signed(wire1) | ((8'ha8) ? wire0 : wire6)))});
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned((wire1 ?
          ($unsigned(wire1) <<< wire0[(5'h11):(1'h0)]) : ((^~(8'hbc)) ?
              $signed(wire1) : wire3))));
      reg9 <= (8'hbd);
      reg10 <= wire4;
    end
endmodule
