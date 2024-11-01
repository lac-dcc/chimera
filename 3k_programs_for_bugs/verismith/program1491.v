module top
#(parameter param31 = ((&(+(((7'h43) ^ (8'hb7)) + ((8'hae) < (8'hb6))))) ? ({(^~((8'ha2) * (8'ha5)))} ? {((+(8'hb3)) ? {(8'hb3), (8'hb7)} : (-(8'ha4))), (!(7'h43))} : ((((7'h41) * (8'hb8)) >> (~^(8'hb7))) ? {((8'hb1) < (7'h43)), ((8'haf) < (8'ha2))} : (^(&(8'hb3))))) : (|(8'hbb))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire26;
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire26,
                 (1'h0)};
  assign wire5 = {wire3[(2'h2):(1'h1)], wire4};
  assign wire6 = wire4[(3'h4):(2'h3)];
  assign wire7 = (~&{$unsigned(((&wire3) ? wire6[(1'h0):(1'h0)] : wire1)),
                     wire3});
  assign wire8 = (wire3 ?
                     wire4 : (((8'ha4) <<< $signed(wire1[(1'h1):(1'h0)])) <= $signed(wire7[(3'h6):(3'h4)])));
  module9 #() modinst27 (.clk(clk), .wire13(wire1), .wire12(wire6), .wire11(wire8), .y(wire26), .wire14(wire2), .wire10(wire5));
  assign wire28 = wire2[(4'h8):(3'h7)];
  assign wire29 = wire8[(2'h2):(2'h2)];
  assign wire30 = wire0[(2'h2):(1'h1)];
endmodule

module module9
#(parameter param25 = (-(({(~^(8'hb9)), ((8'hab) <<< (8'ha5))} ^~ (!{(8'hae)})) ? ((~&((8'hae) < (7'h42))) ? (8'ha8) : {((8'hab) == (8'hab)), ((8'ha3) * (8'hab))}) : ((((8'hab) ? (7'h40) : (8'ha2)) ? ((8'hbe) != (8'hbb)) : (-(8'hb2))) > ((8'hb9) ? ((8'haf) ? (8'h9f) : (8'ha2)) : ((8'ha8) ? (8'ha8) : (8'hb9)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire15 = $unsigned(wire14[(4'h9):(4'h8)]);
  assign wire16 = $signed(($unsigned({(~wire13)}) > wire14));
  assign wire17 = wire13[(3'h6):(1'h1)];
  assign wire18 = {((8'hb0) ?
                          wire16[(1'h1):(1'h0)] : (wire14[(3'h5):(2'h2)] ?
                              ({(8'ha6)} & wire17[(2'h2):(1'h1)]) : $unsigned($unsigned(wire12))))};
  assign wire19 = (^$unsigned($signed((wire12[(2'h3):(1'h0)] | (wire15 ?
                      (8'hba) : (8'hbe))))));
  assign wire20 = (wire19 ?
                      (8'hbb) : $unsigned((($signed((7'h43)) * (~^wire18)) ^~ $unsigned(((8'hb8) ^ wire10)))));
  always
    @(posedge clk) begin
      reg21 <= (8'hae);
      reg22 <= ({$unsigned((~$signed(wire19))), (^~wire19)} ?
          wire15[(3'h7):(3'h6)] : (wire10 ?
              $unsigned($signed(wire16)) : $signed(wire15)));
      reg23 <= ($unsigned(wire11[(4'h9):(3'h5)]) > wire19[(2'h3):(1'h1)]);
    end
  assign wire24 = wire11;
endmodule
