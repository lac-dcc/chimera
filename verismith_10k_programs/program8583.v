module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, wire6, wire5, reg7, (1'h0)};
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = (8'hb6);
  always
    @(posedge clk) begin
      reg7 <= $signed(wire3);
    end
  assign wire8 = ((8'hbf) - ($signed({$signed(wire0)}) >= wire1[(1'h1):(1'h0)]));
  assign wire9 = wire0[(1'h0):(1'h0)];
  assign wire10 = ((~wire8) << (&(((~^wire6) == (wire3 <= wire2)) <= ((+wire0) ?
                      wire3 : wire5[(2'h2):(1'h0)]))));
  assign wire11 = wire9;
endmodule
