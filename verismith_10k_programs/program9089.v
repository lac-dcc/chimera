module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire4,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(wire1[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire2[(3'h6):(2'h2)]);
      reg6 <= $unsigned(((|{wire1, {(8'h9c), wire1}}) ?
          (wire2[(4'h8):(2'h2)] ?
              {$signed(reg5), reg5[(2'h2):(1'h0)]} : {(~wire3)}) : (!wire2)));
      reg7 <= {wire2};
      reg8 <= $signed(((8'hbd) ~^ reg6));
    end
  assign wire9 = (~|$signed(reg7));
  assign wire10 = wire2[(4'h8):(2'h3)];
  assign wire11 = wire4[(4'hd):(1'h0)];
  assign wire12 = (|reg7);
endmodule
