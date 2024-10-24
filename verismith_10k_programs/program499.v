module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire23;
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire25,
                 wire5,
                 wire6,
                 wire7,
                 wire23,
                 reg38,
                 reg37,
                 reg36,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire5 = (^~($signed(wire2) * wire3));
  assign wire6 = $signed($unsigned({wire0}));
  assign wire7 = ((((~&(~&(8'hb9))) ?
                         (wire0[(1'h0):(1'h0)] * wire3[(1'h1):(1'h0)]) : $unsigned((8'hb6))) ?
                     ((^$unsigned(wire4)) ?
                         $signed(wire0) : $signed(wire1)) : {((wire0 ?
                             wire5 : (8'hb8)) < wire2[(1'h0):(1'h0)]),
                         ((~^wire0) ?
                             wire1[(3'h6):(1'h0)] : (^~(8'ha7)))}) < (wire6[(2'h2):(1'h1)] <<< wire4[(1'h1):(1'h1)]));
  module8 #() modinst24 (.wire10(wire7), .wire9(wire5), .wire13(wire2), .clk(clk), .wire12(wire6), .wire11(wire3), .y(wire23));
  assign wire25 = {{wire2}, $unsigned(wire4)};
  always
    @(posedge clk) begin
      reg26 <= ((wire3 & wire6[(2'h3):(2'h2)]) ?
          wire7[(1'h1):(1'h1)] : ($unsigned(wire2[(3'h4):(2'h2)]) ^ (wire3[(1'h1):(1'h0)] == {$unsigned(wire1)})));
      reg27 <= wire7;
      reg28 <= (wire2[(2'h3):(2'h3)] ~^ wire23[(2'h3):(2'h2)]);
    end
  assign wire29 = (8'hae);
  assign wire30 = wire1[(1'h0):(1'h0)];
  assign wire31 = ({($signed(reg26) ~^ (^~(&wire7))), wire5} ?
                      wire6 : ((+(~(reg28 ? wire1 : wire30))) ?
                          (^($unsigned(wire2) ?
                              reg27 : $unsigned(reg26))) : wire6[(2'h3):(2'h3)]));
  assign wire32 = wire2[(2'h3):(1'h0)];
  assign wire33 = (^wire2);
  assign wire34 = wire0;
  assign wire35 = wire2;
  always
    @(posedge clk) begin
      reg36 <= ((($signed((wire6 != wire0)) >>> $signed(wire3[(3'h4):(1'h0)])) << (^~((^~wire3) ?
              (~&wire30) : (^~(8'hb8))))) ?
          wire32[(3'h7):(1'h0)] : ((~&wire32) << (^wire25[(5'h10):(4'h9)])));
      reg37 <= ({$unsigned((wire4[(3'h5):(2'h2)] && reg27))} ?
          $unsigned(wire29[(3'h5):(1'h1)]) : {reg27[(3'h5):(3'h5)]});
      reg38 <= (!$signed(((wire25[(3'h7):(3'h6)] + wire31[(1'h0):(1'h0)]) == $signed((~|wire30)))));
    end
  assign wire39 = $signed({{(wire5[(1'h1):(1'h1)] ?
                              {wire30} : (reg26 ? wire7 : wire0))},
                      (^~(7'h43))});
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(3'h5):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(4'hb):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 (1'h0)};
  assign wire14 = ($signed(({wire10[(3'h5):(3'h5)]} ?
                          (wire9[(1'h1):(1'h1)] ^~ $unsigned(wire10)) : wire11)) ?
                      wire10 : $signed(((8'hba) ?
                          $signed($unsigned(wire11)) : $signed((wire11 > wire12)))));
  assign wire15 = (wire14 <<< {(^($signed(wire9) ^ wire10)), (~wire12)});
  assign wire16 = wire13[(2'h3):(1'h1)];
  assign wire17 = ((+$unsigned(wire14)) >>> wire14);
  assign wire18 = ($unsigned((8'hb1)) ?
                      wire11 : $signed($unsigned((wire10 ?
                          $unsigned(wire10) : (|wire12)))));
  assign wire19 = (~|wire13[(4'h9):(4'h9)]);
  assign wire20 = wire13[(4'hf):(4'hf)];
  assign wire21 = $signed($signed(wire15[(2'h2):(1'h1)]));
  assign wire22 = $unsigned($signed((wire14[(1'h0):(1'h0)] ?
                      ($signed(wire20) <<< $unsigned(wire9)) : wire19)));
endmodule
