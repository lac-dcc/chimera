module top
#(parameter param26 = ({((((8'had) * (8'ha7)) ? ((8'ha7) ^~ (8'hb9)) : ((8'ha3) <= (8'hab))) ? {((8'ha8) & (8'hae)), (!(8'ha9))} : (((8'hac) ? (8'ha5) : (8'hb9)) & (^(8'hbe))))} ? ((~^(((7'h43) ^~ (7'h43)) >= (&(7'h42)))) == (((~|(8'haf)) <= {(8'ha9)}) ? (((8'ha0) >> (7'h43)) ? {(8'ha4)} : ((8'hb9) ? (8'ha7) : (8'hae))) : {{(8'h9c)}})) : (((((8'hbd) > (8'hb9)) ? ((8'hb1) ^ (7'h42)) : (~|(8'ha2))) ? (((8'hbf) ? (8'hb9) : (8'hbd)) ^~ (|(8'hbf))) : (((8'hb3) ? (8'ha5) : (8'hac)) == ((8'hb8) <= (8'hae)))) || (~(((8'hac) ? (8'hbb) : (8'haa)) == ((8'hbd) + (8'hae)))))), 
parameter param27 = ((param26 ^ (param26 ? (+{param26, param26}) : ((8'hb3) ? (param26 <<< (8'ha4)) : param26))) ? {{(~{param26, (8'hb3)})}} : {{{param26, (!param26)}, (~|(param26 ? param26 : param26))}}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire23;
  assign y = {wire25, wire5, wire6, wire23, (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = wire4[(3'h5):(1'h1)];
  module7 #() modinst24 (.wire12(wire6), .wire9(wire2), .wire8(wire3), .clk(clk), .wire11(wire1), .wire10(wire5), .y(wire23));
  assign wire25 = $unsigned(((~^(wire5 != (~|wire0))) ?
                      ((wire23 ?
                          $signed(wire1) : (wire2 & (7'h44))) <= wire6) : $signed(wire3[(5'h11):(5'h11)])));
endmodule

module module7
#(parameter param21 = (~^(((|(&(8'hb2))) && (((8'hb1) >> (7'h43)) ? (~&(8'ha5)) : ((7'h44) ? (8'ha4) : (8'hb9)))) ? (~^(((8'hb5) <<< (8'hbd)) * (~|(8'hb8)))) : ((^((8'hb3) ? (8'hb0) : (8'hb9))) ? {{(8'hb2), (8'h9e)}, ((8'ha2) && (8'ha8))} : (((8'hb4) >>> (7'h42)) ? (8'h9e) : ((8'hbe) >> (8'hae)))))), 
parameter param22 = (~&param21))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg20,
                 (1'h0)};
  assign wire13 = $signed((((-(~wire8)) ^ (^(wire10 * wire10))) < (wire9 ?
                      (wire8[(3'h6):(2'h3)] != (wire8 ?
                          wire10 : wire11)) : wire9)));
  assign wire14 = $unsigned((~^$unsigned((wire10 ~^ (wire12 ?
                      wire8 : wire13)))));
  assign wire15 = (8'hb0);
  assign wire16 = (^~$signed($signed(wire13)));
  assign wire17 = $signed((^$unsigned($unsigned((+(7'h42))))));
  assign wire18 = $signed((^(~$unsigned({wire10, wire16}))));
  assign wire19 = wire8[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= wire15;
    end
endmodule
