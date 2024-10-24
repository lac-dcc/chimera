module top
#(parameter param29 = {(((((8'hbe) ? (8'haf) : (7'h43)) ? {(8'hac)} : {(8'ha4)}) > {{(7'h40)}, ((8'hba) ? (8'ha9) : (8'hb6))}) ? (8'hb9) : (~|{(+(8'ha9)), (~^(8'hb6))}))}, 
parameter param30 = (((param29 ? (param29 ? (^param29) : (param29 ? param29 : param29)) : {(+param29), (param29 << param29)}) < (((param29 ? (8'hb3) : param29) ? (~|param29) : (param29 - param29)) ? ((param29 && param29) >> param29) : (~|param29))) < param29))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'h8):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  assign y = {wire28, wire27, wire25, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3[(4'hb):(3'h4)]);
  assign wire5 = (~^$signed({$unsigned($unsigned(wire2)),
                     ((wire0 ? wire3 : wire3) ? (^wire4) : wire4)}));
  assign wire6 = wire3[(4'hd):(1'h0)];
  assign wire7 = ((~^{$signed(((8'h9e) & wire2)),
                         {wire5[(4'hd):(1'h0)], $unsigned(wire3)}}) ?
                     wire1 : $signed($unsigned($signed($unsigned(wire3)))));
  module8 #() modinst26 (.wire12(wire0), .wire10(wire1), .y(wire25), .clk(clk), .wire9(wire5), .wire11(wire3));
  assign wire27 = ({$signed(wire7[(2'h3):(2'h3)])} >= $unsigned(wire7));
  assign wire28 = {((((wire3 ? wire5 : wire0) ?
                          (|wire5) : (wire25 ?
                              wire7 : (8'hb1))) <<< $unsigned($unsigned(wire3))) & wire27[(3'h6):(1'h0)])};
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(2'h2):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = $unsigned((wire9 ? wire10 : $signed($unsigned((!wire9)))));
  assign wire14 = $unsigned(wire9);
  assign wire15 = wire14;
  assign wire16 = {(!((wire15[(1'h0):(1'h0)] << (~^wire12)) <<< wire13[(4'hc):(2'h2)]))};
  assign wire17 = $unsigned(wire13[(4'h8):(1'h0)]);
  assign wire18 = wire12;
  assign wire19 = $signed(($signed(((~^wire17) - (~^wire16))) ~^ ({(wire11 << wire17),
                          (~&wire10)} ?
                      ($unsigned(wire10) ?
                          {wire13} : wire16[(4'ha):(3'h6)]) : $signed((wire13 ?
                          wire10 : wire9)))));
  assign wire20 = (~&(~&((|(^~wire17)) <= (~^wire14))));
  assign wire21 = ($unsigned($unsigned(wire15)) | $signed($unsigned(($signed(wire18) & $signed(wire15)))));
  assign wire22 = {wire9[(1'h1):(1'h1)],
                      $signed($unsigned((wire10 & wire12[(1'h0):(1'h0)])))};
  assign wire23 = (wire21[(4'ha):(2'h2)] == ((8'hb0) != {($unsigned(wire9) + ((8'hb6) ~^ wire19)),
                      wire9}));
  assign wire24 = (8'ha5);
endmodule
