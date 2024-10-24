module top
#(parameter param28 = (~((+(8'ha5)) ~^ (({(8'hb2), (8'hb7)} ? (~(8'hb7)) : (!(8'ha6))) ? (((8'had) ? (8'hb0) : (7'h43)) ? (&(8'hb0)) : ((8'ha0) ^~ (7'h40))) : (((8'hb6) ? (8'ha0) : (8'hab)) >> ((7'h43) ? (8'hb2) : (8'ha5)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire18;
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire5,
                 wire6,
                 wire18,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (wire0 >> (wire3[(1'h1):(1'h0)] ?
                     (^$signed({wire5})) : (((|(8'ha3)) ?
                         $signed(wire2) : (wire0 ? wire1 : wire4)) || ((8'h9d) ?
                         wire1 : (wire0 ^~ wire3)))));
  module7 #() modinst19 (.wire12(wire6), .wire10(wire1), .y(wire18), .wire8(wire3), .wire9(wire0), .wire11(wire5), .clk(clk));
  assign wire20 = $signed($unsigned($signed($signed(wire5))));
  always
    @(posedge clk) begin
      reg21 <= $unsigned(wire3[(4'h8):(1'h0)]);
      reg22 <= wire5[(3'h6):(2'h2)];
      reg23 <= ((~&(!{{wire1, wire1}})) && (+$signed((&{(8'hbd)}))));
    end
  assign wire24 = (wire20 << {(wire18 ? $unsigned((8'hbd)) : wire20),
                      (reg21 ? wire18 : {{(8'ha6), reg23}, $signed(wire2)})});
  assign wire25 = $unsigned((wire3[(3'h4):(1'h1)] & $signed((-$signed((8'had))))));
  assign wire26 = (8'ha3);
  assign wire27 = wire3;
endmodule

module module7
#(parameter param17 = {(^((((8'hb3) == (8'ha8)) ? {(8'ha5), (8'hbf)} : ((8'haa) ^~ (8'hba))) >>> (~^{(8'ha7)}))), ({{((8'ha6) ? (8'h9f) : (8'ha0)), {(8'ha2)}}} ~^ ((((8'had) >> (8'hbf)) ? ((8'ha1) ? (8'hb6) : (8'hac)) : ((8'hb6) ? (8'h9e) : (8'hb1))) << (^((8'h9d) >= (8'h9e)))))})
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  assign y = {wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = {wire8[(3'h6):(3'h6)]};
  assign wire14 = ($unsigned({wire8[(1'h0):(1'h0)]}) - $signed($signed(wire9[(3'h5):(2'h3)])));
  assign wire15 = {wire14};
  assign wire16 = wire13[(3'h7):(3'h7)];
endmodule
