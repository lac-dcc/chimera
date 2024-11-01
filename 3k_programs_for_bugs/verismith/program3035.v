module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire23;
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire23,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h1)];
  assign wire5 = $unsigned(wire4[(4'hd):(3'h4)]);
  always
    @(posedge clk) begin
      reg6 <= (wire4[(1'h1):(1'h0)] != (wire3 ?
          (!(wire4 ?
              (-wire0) : wire2[(3'h7):(3'h7)])) : $unsigned($signed(wire2))));
      reg7 <= reg6[(4'h8):(3'h4)];
      reg8 <= $unsigned(reg6[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg9 <= (^(~|$unsigned({$signed(reg6)})));
      reg10 <= reg9;
      reg11 <= ((^~$signed(reg8)) | {{$signed(reg6[(3'h6):(2'h2)]),
              {$unsigned((8'haa)), reg6[(3'h6):(3'h4)]}}});
    end
  module12 #() modinst24 (.y(wire23), .wire15(reg6), .wire13(wire2), .clk(clk), .wire16(wire3), .wire14(reg8), .wire17(wire0));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  assign y = {wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = (&(^~wire16[(3'h7):(3'h4)]));
  assign wire19 = (($unsigned(wire13[(3'h7):(3'h4)]) ?
                          wire13[(3'h6):(2'h3)] : ((~^{wire18,
                              wire17}) >>> (wire14 ?
                              (wire18 * wire17) : (wire13 <= wire13)))) ?
                      (wire13[(4'h8):(1'h0)] ?
                          $unsigned({(wire15 ?
                                  wire15 : wire13)}) : $signed($unsigned($signed((8'hbc))))) : ((+{{wire13}}) ?
                          (($unsigned(wire18) ^~ wire14) >= (^wire15[(4'h8):(1'h1)])) : (8'hbc)));
  assign wire20 = $unsigned($unsigned({$signed((~^wire16)),
                      $unsigned((wire15 ? wire16 : wire15))}));
  assign wire21 = wire20[(2'h2):(2'h2)];
  assign wire22 = wire16;
endmodule
