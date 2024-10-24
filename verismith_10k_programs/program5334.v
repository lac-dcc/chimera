module top
#(parameter param18 = (+(~&(((8'had) || ((8'haf) ? (8'h9d) : (8'ha5))) ? (8'haf) : (((8'hb3) ? (8'hae) : (8'ha0)) >>> ((8'hb0) >> (8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned(((wire1 ~^ ((~^wire1) ?
                     wire2 : (wire0 <<< wire3))) & ($signed((~^wire3)) || {wire0,
                     $signed(wire1)})));
  always
    @(posedge clk) begin
      reg5 <= wire3[(1'h0):(1'h0)];
    end
  assign wire6 = $signed($signed((($signed(wire4) << (reg5 ~^ reg5)) * ($unsigned((8'hb1)) <<< $signed((8'ha5))))));
  assign wire7 = (((-wire3) - ($unsigned({reg5,
                         (8'haf)}) | $signed((wire2 | reg5)))) ?
                     ((^(~^$unsigned(reg5))) & wire3[(2'h2):(1'h0)]) : (8'hbe));
  assign wire8 = $signed(wire6);
  assign wire9 = ($unsigned($signed($unsigned((+wire4)))) ?
                     (~&wire3) : $unsigned(wire2));
  assign wire10 = $unsigned((((&(-wire8)) || wire9) >> wire0));
  assign wire11 = wire4[(2'h3):(2'h3)];
  assign wire12 = $unsigned($unsigned(reg5[(1'h0):(1'h0)]));
  assign wire13 = wire2[(4'ha):(3'h7)];
  assign wire14 = wire12[(2'h3):(2'h3)];
  assign wire15 = $signed((~^wire2[(4'ha):(1'h1)]));
  assign wire16 = $signed($unsigned(($signed(wire4) || $unsigned(wire10))));
  assign wire17 = ($unsigned(({wire13[(3'h6):(2'h2)]} ?
                      $unsigned((wire9 ? wire13 : wire1)) : $unsigned((wire4 ?
                          wire8 : (7'h41))))) <= ((^wire15[(1'h1):(1'h0)]) ?
                      (wire11 ?
                          {$unsigned(reg5),
                              (wire2 ? (8'hb9) : wire13)} : (((8'hb0) ?
                              wire15 : wire14) != $unsigned(reg5))) : wire14[(1'h0):(1'h0)]));
endmodule
