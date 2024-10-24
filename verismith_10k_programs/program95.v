module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed({{$signed(((8'h9d) ? wire1 : wire1))}});
  assign wire5 = wire1[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= {wire5, $signed(wire2)};
    end
  assign wire7 = (((wire1[(1'h1):(1'h1)] ?
                         $unsigned($signed(wire5)) : ((wire4 + wire4) ?
                             (reg6 ? wire2 : wire2) : $signed(wire4))) ?
                     (^{(!wire3)}) : (^(wire2[(1'h0):(1'h0)] * wire1))) | $unsigned({$signed($signed(wire2)),
                     $signed((wire2 << wire0))}));
  assign wire8 = wire3[(4'hc):(3'h6)];
  assign wire9 = (+wire7);
  assign wire10 = $unsigned(({(8'ha3), $unsigned((^(8'hbb)))} ?
                      {wire7, {(&wire7), wire8}} : wire8));
  assign wire11 = wire9;
  always
    @(posedge clk) begin
      reg12 <= (8'ha5);
      reg13 <= wire5[(2'h3):(1'h1)];
      reg14 <= (~|wire9);
    end
endmodule
