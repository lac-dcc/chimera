module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg11,
                 (1'h0)};
  assign wire5 = ($unsigned($signed((~|(^wire1)))) ?
                     ({$signed($signed((8'hbb)))} ?
                         (8'hb6) : (wire4 == $unsigned((wire4 == wire4)))) : (&wire0));
  assign wire6 = wire5;
  assign wire7 = $unsigned(wire5);
  assign wire8 = (($unsigned(($unsigned(wire6) < $signed(wire6))) ?
                     $signed($unsigned({wire1})) : (({(7'h40),
                         wire5} & (~|wire6)) <<< (^$signed(wire6)))) ^~ ((~|{$unsigned((8'hb2)),
                         (|wire3)}) ?
                     (&(wire0[(4'h8):(4'h8)] ?
                         {wire7, wire2} : (^wire6))) : wire6));
  assign wire9 = wire2[(3'h4):(1'h1)];
  assign wire10 = $unsigned($signed((wire9[(4'hd):(4'hb)] ?
                      $unsigned((wire9 < wire3)) : $unsigned(wire5))));
  always
    @(posedge clk) begin
      reg11 <= $unsigned(wire6);
    end
  assign wire12 = wire9;
  assign wire13 = (^~wire0);
  assign wire14 = {wire9,
                      $unsigned($signed((wire1 == ((8'ha2) ?
                          (8'hbe) : wire4))))};
  assign wire15 = wire10;
endmodule
