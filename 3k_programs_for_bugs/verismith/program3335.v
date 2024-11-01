module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned((((~|wire3) >>> wire1) ?
                     $unsigned($signed(((8'hb3) ?
                         (8'hb3) : (8'hbe)))) : wire0));
  assign wire5 = (~|((((wire0 & wire2) ? wire3 : $unsigned(wire1)) ?
                         ($signed(wire3) <<< (wire4 || wire0)) : (8'hb1)) ?
                     wire2[(1'h0):(1'h0)] : $signed((8'hb5))));
  assign wire6 = ((~|(~|$signed(wire2[(1'h1):(1'h0)]))) >>> ($unsigned($signed(wire5)) ?
                     wire0 : wire0[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= $unsigned(($signed((~&$signed((8'ha3)))) != {wire5[(2'h3):(2'h2)],
          ((~wire0) ? wire1[(1'h0):(1'h0)] : wire0)}));
      reg8 <= (~&$unsigned((-wire3)));
      reg9 <= $unsigned((~&(|((wire6 >>> (8'hb7)) ?
          $signed(reg7) : (reg7 ? wire0 : wire0)))));
      reg10 <= $unsigned((+wire6));
    end
  assign wire11 = wire2[(3'h5):(2'h3)];
  assign wire12 = {(wire5[(3'h4):(2'h2)] ?
                          ($unsigned({reg10}) ?
                              (~^$unsigned(wire1)) : (8'haf)) : (((^wire5) && (|reg8)) ?
                              wire1 : ($unsigned(wire5) > $signed(wire6))))};
  assign wire13 = $unsigned({{wire1[(5'h11):(4'hc)]}});
  assign wire14 = (~^(7'h44));
endmodule
