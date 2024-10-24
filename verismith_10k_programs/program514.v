module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire8, wire7, wire5, reg6, (1'h0)};
  assign wire5 = $signed(wire0);
  always
    @(posedge clk) begin
      reg6 <= (8'had);
    end
  assign wire7 = (~|wire1);
  assign wire8 = ($signed((((reg6 << wire7) | wire0) & $unsigned($signed(wire2)))) ?
                     $signed(wire4[(2'h3):(1'h1)]) : ($unsigned($signed((reg6 ?
                             wire2 : wire1))) ?
                         ((+(wire3 << reg6)) ?
                             ((wire4 ? wire2 : wire1) * ((8'ha3) ?
                                 wire4 : (7'h40))) : wire3) : ($unsigned(wire1[(4'ha):(3'h6)]) & $signed(wire7[(1'h1):(1'h0)]))));
  assign wire9 = wire8;
endmodule
