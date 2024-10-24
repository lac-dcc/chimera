module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire12, wire11, wire10, wire5, reg9, reg8, reg7, reg6, (1'h0)};
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      reg6 <= $signed(wire0[(4'ha):(3'h7)]);
      reg7 <= {(wire1 >= wire2[(1'h1):(1'h0)]), wire5};
      reg8 <= (-(&wire0));
      reg9 <= {($signed((!(wire5 ? (8'hb1) : wire4))) ?
              reg8[(1'h0):(1'h0)] : ($unsigned((reg6 < (7'h40))) ?
                  wire4 : ((reg7 ^~ wire3) ? $unsigned(wire5) : (~wire4))))};
    end
  assign wire10 = (~|(-(|(8'ha8))));
  assign wire11 = (~^(^~reg8));
  assign wire12 = (~&wire5[(4'h9):(3'h5)]);
endmodule
