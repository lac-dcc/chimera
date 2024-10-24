module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
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
                 wire5,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire5 = wire3[(3'h5):(2'h2)];
  assign wire6 = wire4;
  assign wire7 = wire1;
  assign wire8 = $signed($unsigned((wire5 - ((wire4 ?
                     wire0 : wire3) >= $unsigned(wire6)))));
  assign wire9 = wire6[(1'h1):(1'h1)];
  assign wire10 = wire0;
  assign wire11 = {wire7,
                      ((^~$unsigned($signed(wire8))) ?
                          $unsigned((wire3[(3'h6):(1'h0)] > wire6[(3'h6):(2'h3)])) : $unsigned(wire3[(3'h6):(1'h1)]))};
  assign wire12 = ((7'h43) ?
                      {(wire9 <<< (wire8 < (|wire3))),
                          $unsigned(({wire1,
                              (8'ha4)} == wire7))} : $unsigned(wire7));
  assign wire13 = ($unsigned($signed((wire1[(1'h1):(1'h0)] && {(8'hb9),
                          wire0}))) ?
                      wire8 : ($signed((((8'ha1) ?
                          wire1 : wire7) - wire4[(1'h0):(1'h0)])) && wire3[(2'h3):(2'h3)]));
  assign wire14 = wire8[(3'h4):(3'h4)];
  assign wire15 = (($signed((~&(~wire9))) ~^ {$signed(((8'ha3) ?
                          wire8 : wire8)),
                      (+wire11[(4'hc):(2'h3)])}) + ({(wire8 ?
                          $unsigned(wire11) : {wire12}),
                      ($unsigned(wire2) ?
                          $unsigned(wire4) : $signed(wire9))} << ({wire6[(1'h0):(1'h0)]} ?
                      wire0[(4'hb):(4'ha)] : wire2[(1'h1):(1'h1)])));
  assign wire16 = $signed((wire10[(1'h0):(1'h0)] ?
                      $unsigned($signed(wire4[(1'h1):(1'h0)])) : (((wire11 >>> wire12) ?
                          $unsigned((8'hbb)) : (~^(8'hb0))) != (wire0[(4'hc):(3'h7)] ~^ {wire0,
                          wire14}))));
  assign wire17 = wire4[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg18 <= {$signed($signed($signed((8'hba))))};
      reg19 <= ((~&$signed($unsigned((+wire7)))) ~^ $signed((wire11 >> (+(^wire17)))));
    end
endmodule
