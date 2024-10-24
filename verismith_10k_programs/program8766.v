module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = (wire3 <= (wire2[(1'h1):(1'h1)] ?
                     wire2[(3'h4):(3'h4)] : $unsigned(((wire1 ? wire3 : wire0) ?
                         $unsigned(wire3) : wire1[(3'h6):(2'h2)]))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire1[(3'h4):(2'h3)]);
    end
  assign wire6 = (!wire0[(4'hf):(4'hc)]);
  assign wire7 = $signed(wire4[(1'h1):(1'h1)]);
  assign wire8 = (($signed($unsigned((+wire2))) ?
                         (wire3 ?
                             (((8'haf) ? wire2 : wire4) ?
                                 $unsigned(wire6) : $signed(wire1)) : $unsigned((~^wire6))) : (8'hb3)) ?
                     wire4[(2'h2):(1'h0)] : (8'hb1));
  assign wire9 = wire3[(3'h5):(2'h2)];
endmodule
