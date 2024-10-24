module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = ($signed(wire0[(2'h2):(1'h0)]) ~^ wire0);
  always
    @(posedge clk) begin
      reg5 <= wire4;
    end
  assign wire6 = $unsigned((~wire1[(3'h6):(2'h3)]));
  assign wire7 = $unsigned(((~|wire3[(2'h2):(1'h1)]) ?
                     (~^$unsigned($signed(reg5))) : {$signed(wire1), (8'hb2)}));
endmodule
