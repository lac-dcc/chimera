module top
#(parameter param15 = {{(+({(7'h44)} ? {(8'hab), (8'had)} : (~(8'hbd))))}, (~&(-{((8'h9f) + (8'had))}))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 (1'h0)};
  assign wire4 = (($signed(wire3) ^ wire3) ? wire2[(2'h3):(2'h2)] : (8'hb4));
  assign wire5 = wire3[(3'h4):(2'h2)];
  assign wire6 = $signed(wire4[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg7 <= $signed(wire4);
    end
  assign wire8 = (7'h43);
  assign wire9 = reg7;
  assign wire10 = $signed({(+$signed((wire2 ? wire9 : (8'hb9)))),
                      {((|(8'hbe)) ? {reg7, wire1} : $signed(wire6)),
                          (wire8[(1'h1):(1'h1)] ? wire0 : (wire1 ^~ wire4))}});
  assign wire11 = $unsigned(wire9);
  assign wire12 = wire10;
  assign wire13 = $signed(((reg7[(2'h2):(1'h1)] ~^ wire10) ?
                      $unsigned(($signed((8'had)) ?
                          (8'hae) : wire8[(2'h2):(1'h0)])) : (8'had)));
  assign wire14 = wire0;
endmodule
