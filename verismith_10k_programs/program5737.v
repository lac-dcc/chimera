module top
#(parameter param27 = ((8'hbd) ? (((((8'hba) ^~ (8'hb7)) ? {(8'had), (8'hac)} : (~(8'hb9))) ? (((8'hba) ? (7'h44) : (8'hbe)) ? (~&(7'h44)) : {(7'h40), (8'hac)}) : (~|{(7'h41)})) ? (&(8'ha5)) : ((((7'h44) ? (7'h40) : (8'ha3)) ? ((8'haf) != (7'h42)) : ((7'h42) && (8'ha0))) ? (((8'hb9) || (8'hae)) ? (~^(7'h40)) : {(8'hba), (8'ha8)}) : (((8'ha2) ~^ (8'ha9)) ? ((8'hb1) ? (8'ha9) : (8'hb0)) : ((8'ha6) == (8'hb8))))) : (^~(8'hb9))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire25;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire25, (1'h0)};
  assign wire4 = {(((8'hb6) < wire0[(1'h1):(1'h1)]) ^~ $signed({wire3,
                         $unsigned(wire0)})),
                     wire3[(2'h2):(1'h0)]};
  assign wire5 = wire4[(2'h3):(1'h1)];
  assign wire6 = (wire0[(2'h2):(1'h0)] > (~&((wire0[(2'h2):(2'h2)] ~^ (|wire3)) > wire2)));
  assign wire7 = (|{wire6[(1'h1):(1'h1)]});
  assign wire8 = ((wire7 << wire3[(1'h1):(1'h1)]) ? (-$signed(wire3)) : wire1);
  module9 #() modinst26 (.wire13(wire1), .wire12(wire7), .clk(clk), .wire10(wire2), .wire14(wire4), .wire11(wire0), .y(wire25));
endmodule

module module9
#(parameter param23 = ((~&(!(((8'ha3) >>> (8'h9f)) ? ((8'hb7) == (8'ha6)) : ((8'hb5) >> (8'hae))))) ? (7'h40) : (((^~((8'hb4) ? (8'hab) : (8'hb7))) == (~&(~&(8'ha9)))) ? (8'ha2) : (|{((7'h44) || (8'ha5))}))), 
parameter param24 = (((8'hb4) ? (({param23, param23} << (param23 ? param23 : param23)) && {(param23 ? param23 : param23), (-param23)}) : ((+(param23 ? param23 : param23)) ^~ ((&(8'ha6)) != (param23 ? param23 : param23)))) ? ({param23} << (param23 ? param23 : (8'hb0))) : {param23, (({param23, param23} - param23) ? ({param23} ? {param23, param23} : param23) : ((param23 ? param23 : param23) != param23))}))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire14;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = $unsigned(wire12[(2'h2):(1'h1)]);
  assign wire16 = wire11[(4'hf):(4'hc)];
  assign wire17 = (wire14[(1'h1):(1'h1)] <<< $unsigned(wire15));
  assign wire18 = (~|{(wire12[(1'h0):(1'h0)] ?
                          ((^wire10) ?
                              $signed(wire17) : (!wire13)) : ((wire12 == wire10) ?
                              $unsigned((8'hb1)) : wire16)),
                      (wire11 == ({(7'h44), wire17} ?
                          (wire17 ? wire15 : (7'h42)) : $signed(wire15)))});
  assign wire19 = (wire18 && (+($unsigned($signed(wire17)) ?
                      $signed(wire10[(4'hb):(1'h0)]) : $signed(wire16))));
  assign wire20 = wire14[(1'h1):(1'h1)];
  assign wire21 = wire15[(3'h5):(3'h4)];
  assign wire22 = wire10;
endmodule
