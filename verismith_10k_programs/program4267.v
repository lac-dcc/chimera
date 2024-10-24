module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire4;
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
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
  assign wire4 = ((({(wire1 ? wire3 : wire1),
                     (wire1 > wire0)} == ((wire0 ~^ wire3) ?
                     $signed(wire2) : $signed((8'hb3)))) - (~^$unsigned(wire2[(4'ha):(1'h0)]))) ^~ wire2);
  assign wire5 = (wire1[(4'h8):(3'h6)] ^~ $unsigned($signed($unsigned((wire3 > (8'hbc))))));
  assign wire6 = wire2[(1'h1):(1'h1)];
  assign wire7 = $signed(($signed(($signed(wire3) ?
                     {wire0, (8'hb8)} : (wire3 ?
                         (8'ha2) : wire4))) | wire5[(3'h7):(3'h7)]));
  assign wire8 = wire3[(5'h12):(5'h10)];
  assign wire9 = {$signed(({(8'ha5)} ?
                         {{wire7}, (~|(8'hbd))} : $signed(wire3)))};
  assign wire10 = {wire5, $signed($signed((~^(~&(8'ha2)))))};
  assign wire11 = $unsigned(wire8);
  assign wire12 = wire6[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg13 <= (-wire2[(1'h0):(1'h0)]);
    end
  assign wire14 = {reg13[(2'h2):(1'h1)], (|(wire10 | $signed((~wire10))))};
  assign wire15 = $signed(($unsigned($signed((wire14 ? wire14 : wire10))) ?
                      wire14 : wire0));
  assign wire16 = (+($unsigned({wire1}) ?
                      $unsigned({(wire11 >= wire10)}) : wire14[(5'h12):(2'h3)]));
endmodule
