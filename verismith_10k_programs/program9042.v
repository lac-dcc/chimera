module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  assign y = {wire14,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = $signed($unsigned((wire3[(2'h2):(2'h2)] ?
                     ((8'ha0) ^ $unsigned(wire1)) : wire3[(1'h1):(1'h1)])));
  assign wire7 = $unsigned((+{(8'hb7)}));
  assign wire8 = (wire2[(1'h0):(1'h0)] ? (7'h43) : wire7[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg9 <= wire5[(3'h6):(1'h1)];
      reg10 <= (^~wire0);
      reg11 <= (((~^$unsigned($signed(wire1))) ?
              {wire4[(1'h1):(1'h1)]} : wire8[(4'hc):(4'h9)]) ?
          (wire1[(5'h13):(4'h8)] ?
              $unsigned(((&wire2) ?
                  $signed(wire3) : {wire4,
                      wire0})) : (~wire0)) : $signed((~wire4[(1'h1):(1'h0)])));
      reg12 <= reg10[(1'h0):(1'h0)];
      reg13 <= reg12;
    end
  assign wire14 = $signed($signed(wire3));
endmodule
