module top #(parameter param9 = (8'ha5)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, wire4, reg8, (1'h0)};
  assign wire4 = (8'hb7);
  assign wire5 = $signed(($unsigned((^~$signed(wire4))) ?
                     {((wire0 ? wire1 : wire4) ?
                             wire1[(2'h2):(1'h0)] : (-wire2)),
                         wire1} : (|(~^(wire3 == wire1)))));
  assign wire6 = {(&$signed(wire5))};
  assign wire7 = (-(($signed(wire2) ?
                     (+(~&wire0)) : (~&{wire5, wire1})) | (~((wire3 ?
                         wire4 : wire5) ?
                     $signed(wire2) : $signed(wire4)))));
  always
    @(posedge clk) begin
      reg8 <= (-{(wire5 || wire7), (8'hb5)});
    end
endmodule
