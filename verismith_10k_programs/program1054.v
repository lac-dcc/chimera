module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0[(5'h10):(2'h2)];
      reg6 <= $unsigned((8'hae));
      reg7 <= (~|(~&reg5[(2'h3):(2'h3)]));
      reg8 <= ($signed(wire4) | reg6);
    end
  assign wire9 = reg6;
  assign wire10 = {((-$unsigned($signed(wire9))) ?
                          wire4[(1'h0):(1'h0)] : ($signed((^~reg6)) ?
                              {$signed((8'hb1)), reg6} : $signed((wire2 ?
                                  (8'ha8) : wire2))))};
  assign wire11 = $signed(wire2[(3'h5):(2'h2)]);
  assign wire12 = $unsigned({(&($signed(reg6) ? (wire10 - wire0) : (8'hbf))),
                      $unsigned(wire1[(1'h1):(1'h1)])});
  assign wire13 = $unsigned((((((8'hb6) >> wire1) ?
                          (wire9 && wire1) : ((8'hb9) ? wire2 : wire10)) ?
                      ($unsigned(reg6) ?
                          (^reg7) : ((8'hbb) ?
                              reg8 : (8'ha1))) : wire11[(2'h3):(1'h1)]) - $unsigned((7'h40))));
  assign wire14 = (-$signed($signed((8'ha9))));
endmodule
