module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = {{$signed(wire4), {$unsigned($unsigned(wire0))}},
                     (~$signed($signed(((8'hb8) <= wire0))))};
  assign wire6 = $unsigned((^wire1));
  assign wire7 = $signed(({wire0[(5'h11):(4'h9)]} - $signed($unsigned($unsigned(wire2)))));
  assign wire8 = wire6;
  assign wire9 = wire7;
  always
    @(posedge clk) begin
      reg10 <= wire0;
      reg11 <= ($unsigned(wire4) ?
          {$unsigned(((wire9 < (8'hac)) && $signed(wire9))), wire8} : wire6);
    end
  assign wire12 = wire5;
endmodule
