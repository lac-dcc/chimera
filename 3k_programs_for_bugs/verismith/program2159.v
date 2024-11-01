module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire8, wire6, wire5, reg7, (1'h0)};
  assign wire5 = $signed($signed(wire2));
  assign wire6 = $signed((8'ha3));
  always
    @(posedge clk) begin
      reg7 <= ((&(&(wire3[(4'h8):(2'h3)] ?
          (wire1 || wire0) : (wire0 ? wire5 : wire6)))) || $signed((8'had)));
    end
  assign wire8 = (((|wire4) ?
                         ((wire1[(3'h6):(3'h4)] >>> (&wire6)) ?
                             $unsigned(wire4) : $signed((wire1 >> wire0))) : wire6) ?
                     wire1 : wire1);
endmodule
