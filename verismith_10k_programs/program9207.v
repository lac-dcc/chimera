module top
#(parameter param10 = (^((~|(~|(-(8'had)))) == ((((8'ha2) - (8'ha8)) ? ((8'hba) ? (7'h43) : (8'h9f)) : ((7'h40) || (8'hb1))) ? {((8'hae) ? (8'hb2) : (8'ha5)), {(8'hb5)}} : {(|(8'hac))}))), 
parameter param11 = {(((~^(param10 + (8'hb3))) ? param10 : ((param10 ? (8'ha2) : param10) <= {param10})) ? (-((param10 != param10) ? (~&param10) : (param10 + (8'ha6)))) : param10), param10})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire0[(1'h0):(1'h0)];
  assign wire6 = (~|$unsigned((~&$unsigned($unsigned(wire3)))));
  assign wire7 = wire5[(1'h0):(1'h0)];
  assign wire8 = wire7;
  assign wire9 = (^({(~^wire8[(2'h2):(1'h1)])} >> ((~(8'hbe)) ?
                     $signed(wire7) : wire5[(1'h1):(1'h0)])));
endmodule
