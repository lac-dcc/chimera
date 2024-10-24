module top
#(parameter param28 = ((|(7'h44)) ? ((-(((8'hba) ? (8'ha6) : (8'h9c)) ^~ (!(8'hba)))) < ((7'h43) ? ((^~(7'h43)) <= {(8'h9f)}) : (8'ha6))) : (^~((((7'h44) ? (8'hb9) : (8'hb1)) ? (&(8'hac)) : ((8'hba) ? (8'hae) : (8'h9d))) ? (&((8'had) ? (8'ha6) : (8'h9d))) : {((8'hb5) ? (8'haf) : (8'hbb)), ((8'hac) < (8'ha6))}))), 
parameter param29 = {(8'hac), param28})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire20;
  assign y = {wire27, wire26, wire25, wire24, wire23, wire22, wire20, (1'h0)};
  module5 #() modinst21 (.y(wire20), .clk(clk), .wire9(wire0), .wire8(wire4), .wire6(wire3), .wire7(wire1));
  assign wire22 = (^(&$unsigned(wire3)));
  assign wire23 = wire0;
  assign wire24 = wire0[(4'hd):(3'h4)];
  assign wire25 = $signed($unsigned((^~$signed((wire2 ? wire23 : wire24)))));
  assign wire26 = (!{$unsigned($unsigned((wire0 ^ wire0)))});
  assign wire27 = $signed($unsigned($signed({(-wire2), $signed(wire1)})));
endmodule

module module5
#(parameter param19 = (~(~^(((~|(7'h42)) ^ (|(8'hbc))) >>> (~^((8'hac) >= (8'haa)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = $signed($signed($unsigned(wire9[(2'h2):(1'h1)])));
  assign wire11 = ((~&($unsigned(wire8) ?
                      $signed(wire8) : wire9[(3'h4):(1'h1)])) ~^ $unsigned({wire10[(2'h2):(1'h1)],
                      wire6[(3'h6):(3'h5)]}));
  assign wire12 = wire7;
  assign wire13 = {{$unsigned(wire10), wire9}};
  assign wire14 = wire12[(3'h7):(1'h1)];
  assign wire15 = $unsigned(wire7[(5'h11):(4'hc)]);
  always
    @(posedge clk) begin
      reg16 <= (^wire10);
      reg17 <= $signed(wire8[(3'h5):(1'h1)]);
      reg18 <= wire12[(2'h3):(2'h2)];
    end
endmodule
