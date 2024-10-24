module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = (&$unsigned((-wire0[(1'h1):(1'h0)])));
  assign wire5 = wire1[(3'h4):(2'h3)];
  assign wire6 = {$unsigned($unsigned($unsigned((wire4 ? wire4 : wire2))))};
  assign wire7 = {$unsigned((8'hb4)), $unsigned(wire2)};
  assign wire8 = (+$signed((($signed(wire0) << $signed((8'h9e))) || ((^~wire5) ?
                     wire2 : wire0[(3'h6):(2'h2)]))));
  always
    @(posedge clk) begin
      reg9 <= $signed($unsigned(((+wire3[(5'h11):(5'h11)]) ?
          (wire4 ? $unsigned(wire3) : wire3) : ((~&wire2) ?
              ((8'ha1) ? (7'h40) : wire3) : $unsigned(wire4)))));
      reg10 <= ((+(~&((wire5 ? wire8 : wire0) ?
          (8'ha2) : (wire7 <= wire0)))) == ((!$signed({wire0})) ?
          $unsigned($signed($signed(wire8))) : $signed(reg9[(2'h3):(2'h3)])));
      reg11 <= wire4;
      reg12 <= {(~($unsigned({wire2, wire0}) && $unsigned((wire6 ?
              wire3 : wire2))))};
    end
endmodule
