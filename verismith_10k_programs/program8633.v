module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire16;
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 (1'h0)};
  module4 #() modinst17 (wire16, clk, wire1, wire0, wire3, wire2, (7'h44));
  assign wire18 = $unsigned(wire1[(1'h1):(1'h0)]);
  assign wire19 = (~$signed($signed(wire3)));
  assign wire20 = $signed(wire18[(3'h7):(1'h0)]);
  assign wire21 = $signed((&$signed(wire18[(4'hc):(4'h9)])));
  assign wire22 = $unsigned((-$signed($signed({wire3}))));
  assign wire23 = $signed(({wire19} >>> wire18[(1'h1):(1'h0)]));
  assign wire24 = $signed({{wire23}, wire20[(3'h4):(2'h3)]});
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  assign y = {wire15, wire11, wire10, reg14, reg13, reg12, (1'h0)};
  assign wire10 = ((8'ha6) > ((+$unsigned(wire9[(4'he):(1'h1)])) < ((((8'hbe) >> wire8) ?
                      wire5[(3'h6):(2'h3)] : wire5[(4'h8):(4'h8)]) ~^ {{wire7}})));
  assign wire11 = $signed({((&wire7[(3'h4):(2'h3)]) <<< wire6[(1'h1):(1'h1)])});
  always
    @(posedge clk) begin
      reg12 <= (8'hba);
      reg13 <= $signed(((~(wire11 ? wire9[(4'h9):(4'h8)] : $unsigned(wire6))) ?
          $unsigned(((wire5 <<< wire7) | wire6[(1'h0):(1'h0)])) : wire7[(2'h3):(1'h1)]));
      reg14 <= (^(~&wire9));
    end
  assign wire15 = $unsigned($unsigned((reg12 ?
                      (^~(!reg12)) : wire7[(1'h1):(1'h0)])));
endmodule
