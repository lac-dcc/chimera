module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 (1'h0)};
  assign wire4 = ($unsigned((!$signed((^wire1)))) & wire1[(3'h4):(3'h4)]);
  assign wire5 = wire0;
  assign wire6 = $unsigned($signed($signed(wire0[(4'h8):(3'h7)])));
  assign wire7 = $unsigned($unsigned(wire1[(4'h8):(1'h1)]));
  assign wire8 = wire5;
  assign wire9 = ($signed($signed(wire4)) != wire1[(4'hf):(1'h0)]);
  assign wire10 = (~(!(~|((wire7 || wire0) ?
                      $unsigned((8'ha1)) : ((8'haa) ? wire6 : wire0)))));
  assign wire11 = ((8'hac) ? wire0[(2'h2):(1'h1)] : wire4);
  assign wire12 = {$unsigned($unsigned(((wire1 - wire3) <<< (wire5 ?
                          wire6 : wire10))))};
  always
    @(posedge clk) begin
      reg13 <= wire11;
    end
  assign wire14 = wire0[(3'h4):(1'h1)];
endmodule
