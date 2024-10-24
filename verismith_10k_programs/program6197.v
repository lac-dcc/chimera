module top
#(parameter param20 = (-({(8'hbf)} >> ((^((7'h40) ~^ (8'hbe))) ? {{(8'hbe)}, (~(8'had))} : (8'h9f)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(5'h10):(3'h6)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned((~&$signed($signed((wire1 ? wire1 : wire2)))));
      reg7 <= (wire4[(3'h5):(1'h0)] ? wire4[(1'h1):(1'h0)] : wire5);
    end
  assign wire8 = {$signed(({{(8'hb3)}} ?
                         (!wire3) : (reg6 ?
                             {wire3, (8'hb1)} : (wire3 ? (8'had) : wire5))))};
  assign wire9 = wire1;
  assign wire10 = (8'ha9);
  assign wire11 = $unsigned(wire9);
  assign wire12 = wire2;
  assign wire13 = ((~|$unsigned((~^$unsigned((8'ha1))))) ?
                      (wire3[(4'h8):(3'h6)] != $signed(($signed(wire2) ?
                          {wire9,
                              reg6} : (reg7 ~^ wire4)))) : (wire2[(3'h5):(1'h1)] + $unsigned(wire10[(3'h7):(3'h7)])));
  assign wire14 = wire8[(3'h7):(2'h3)];
  assign wire15 = (|$signed((($unsigned(wire9) ?
                      $signed((8'hac)) : (wire10 ? wire11 : wire2)) > wire10)));
  assign wire16 = {((($unsigned(wire10) ? (~^reg6) : (wire10 << (7'h44))) ?
                              $unsigned(wire15) : {wire3[(4'hb):(1'h0)],
                                  (wire3 >>> wire13)}) ?
                          (^~$unsigned(wire13)) : wire15)};
  assign wire17 = ((wire16[(2'h3):(2'h3)] << (~&(~&(-(8'hb9))))) ?
                      (|{{$signed(reg6)},
                          wire3[(4'h8):(1'h0)]}) : $signed((wire8[(2'h3):(1'h0)] ?
                          (~^wire5[(3'h6):(3'h4)]) : {(wire0 * (8'hbd))})));
  assign wire18 = ($unsigned((($signed(wire16) ?
                      wire15[(1'h0):(1'h0)] : (wire5 ?
                          wire8 : wire14)) ~^ $unsigned($signed(wire14)))) * $signed(wire17[(2'h3):(1'h1)]));
  assign wire19 = reg7[(3'h7):(3'h5)];
endmodule
