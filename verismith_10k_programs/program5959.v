module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire9, wire8, wire7, wire6, reg5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned(wire1));
      reg5 <= reg4;
    end
  assign wire6 = wire2[(2'h3):(2'h2)];
  assign wire7 = wire3;
  assign wire8 = $unsigned((((~^$signed((8'hb8))) ?
                     $signed(wire3[(2'h3):(1'h1)]) : ((^~wire2) ?
                         (wire3 || reg5) : $unsigned(wire3))) | (~|$signed((~|wire2)))));
  assign wire9 = (~((^~((8'ha1) ?
                     $unsigned(wire2) : wire1[(2'h2):(1'h1)])) <= ((8'h9e) ?
                     {(|wire1)} : $unsigned((8'ha5)))));
endmodule
