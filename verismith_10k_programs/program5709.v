module top
#(parameter param18 = (8'ha2), 
parameter param19 = ((((^(-param18)) <= ((param18 ? (7'h42) : param18) ? (param18 * param18) : (|param18))) ? ((!{param18}) >= {param18}) : ((&(param18 ? (8'haf) : param18)) ? param18 : {param18})) ? ((((param18 || param18) ? (param18 ? param18 : param18) : (param18 ? (8'hb9) : param18)) ? {(-param18), (~^param18)} : {(+param18), (param18 ? param18 : param18)}) ? param18 : (~^(8'ha6))) : (param18 ? (~(+{(8'hb8)})) : (~^((param18 ? param18 : param18) <= (8'hbf))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
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
                 (1'h0)};
  assign wire5 = ({((^$unsigned(wire3)) ?
                             wire2[(4'h8):(3'h6)] : wire0[(3'h4):(1'h0)]),
                         $unsigned(wire1[(5'h11):(4'h9)])} ?
                     (($unsigned($unsigned(wire3)) ?
                         ((wire1 ? wire0 : wire0) <<< (wire0 ?
                             wire4 : wire0)) : wire1[(3'h7):(1'h0)]) > wire4[(3'h7):(3'h4)]) : $signed((wire0[(2'h2):(2'h2)] ~^ {{wire0,
                             wire0}})));
  assign wire6 = $signed({$signed({wire4})});
  assign wire7 = $unsigned((wire1 + $signed((~&$signed(wire0)))));
  assign wire8 = (^(($signed({wire2,
                     (8'ha6)}) & (wire3 <<< (~wire1))) ^ ({$signed(wire0),
                         (-wire5)} ?
                     ((-wire5) != (wire2 ^~ wire1)) : wire1[(4'h8):(3'h7)])));
  assign wire9 = (wire2[(3'h6):(2'h2)] ? wire0[(4'h8):(3'h7)] : wire6);
  assign wire10 = (wire7 ?
                      ($signed(wire6) ?
                          $unsigned(wire9[(3'h4):(2'h3)]) : (+wire8[(3'h6):(1'h1)])) : $signed({$unsigned($signed(wire7))}));
  assign wire11 = (+wire3);
  assign wire12 = (^~(^~wire0));
  assign wire13 = $unsigned(($signed(((wire1 <<< wire1) ?
                      wire1 : $unsigned(wire6))) && wire8[(3'h5):(3'h5)]));
  assign wire14 = ($unsigned((7'h43)) & {(-wire1[(4'ha):(2'h3)])});
  assign wire15 = (~^wire9[(2'h3):(1'h0)]);
  assign wire16 = (~^((wire12 ?
                      $unsigned({wire5,
                          wire8}) : wire12) << $signed((!wire1))));
  assign wire17 = ((~&(^~wire5[(3'h7):(2'h2)])) ?
                      wire7[(3'h7):(1'h1)] : $unsigned(wire15));
endmodule
