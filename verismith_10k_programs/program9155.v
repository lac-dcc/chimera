module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg10, reg9, (1'h0)};
  assign wire5 = (wire1 ?
                     ($signed(($unsigned(wire1) ?
                         wire0[(1'h0):(1'h0)] : (^~wire2))) ~^ $unsigned((~|(wire4 ?
                         wire2 : wire0)))) : wire0[(1'h0):(1'h0)]);
  assign wire6 = $unsigned((8'h9c));
  assign wire7 = wire5;
  assign wire8 = wire5[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg9 <= $unsigned($signed((wire2[(2'h2):(1'h1)] ?
          wire0 : (~|(wire1 <= wire2)))));
      reg10 <= (~&{wire4, $unsigned((wire1 > $unsigned(wire0)))});
    end
endmodule
