module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire21, wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = wire0;
  assign wire5 = $unsigned(wire2);
  assign wire6 = $unsigned($unsigned((((wire5 ? (8'hb6) : (8'hbe)) ?
                     wire4[(2'h2):(2'h2)] : wire4) * $unsigned(wire3[(3'h4):(1'h0)]))));
  assign wire7 = wire6;
  assign wire8 = $unsigned($signed((~$signed($unsigned(wire6)))));
  assign wire9 = {$unsigned((~|((wire6 >= wire5) ?
                         (wire7 ? wire0 : (8'hbb)) : (wire4 ? wire7 : wire4)))),
                     $unsigned(wire1)};
  module10 #() modinst22 (wire21, clk, wire7, wire6, wire2, wire8);
endmodule

module module10
#(parameter param19 = {(^(!(&(8'hba))))}, 
parameter param20 = ((!((((8'h9e) ? param19 : param19) || (param19 + param19)) <<< (8'hbe))) && (|(((^param19) ~^ {param19, param19}) <<< ((param19 ? param19 : param19) >>> param19)))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  assign y = {wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = $unsigned(((^~$unsigned((wire11 ?
                      (7'h43) : wire14))) && $unsigned(wire14)));
  assign wire16 = ((wire12[(3'h6):(3'h6)] || wire14[(4'hd):(3'h6)]) ?
                      wire13[(1'h0):(1'h0)] : ((^($signed((8'hae)) <= wire13[(2'h2):(2'h2)])) ?
                          $unsigned((8'hbb)) : $unsigned({wire15[(5'h11):(5'h11)]})));
  assign wire17 = ((8'hb6) ?
                      (|(-$unsigned(((8'hb6) + (8'ha6))))) : ({(wire13[(1'h1):(1'h1)] ^ $signed(wire12))} | {(wire11[(4'h8):(2'h3)] == {wire11}),
                          (+$signed(wire14))}));
  assign wire18 = $signed($unsigned((((~wire16) ?
                      {wire13,
                          wire14} : (wire11 <<< wire11)) >>> $unsigned(wire12[(4'he):(4'ha)]))));
endmodule
