module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, wire7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire3;
      reg6 <= $unsigned({{wire3}, wire4[(2'h2):(2'h2)]});
    end
  assign wire7 = wire0;
  assign wire8 = (wire2 >= $unsigned((($unsigned(reg5) <= {wire4, (8'hbe)}) ?
                     $unsigned(reg5[(1'h1):(1'h1)]) : $unsigned({reg6,
                         reg6}))));
  assign wire9 = $signed((&(((!reg5) ?
                     (reg5 << wire3) : wire0[(2'h3):(1'h0)]) * wire3)));
  assign wire10 = $signed($signed(wire8));
  assign wire11 = wire2[(1'h0):(1'h0)];
endmodule
