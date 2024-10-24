module top
#(parameter param17 = (&((-({(8'hb4), (8'ha2)} ^ (|(8'ha6)))) == (((+(8'h9c)) << ((8'hb5) ? (8'hb3) : (8'ha8))) ? (8'hb9) : ((8'h9c) >>> {(8'hbe), (8'ha2)})))), 
parameter param18 = (!({(~|(param17 ? param17 : (7'h40))), param17} ? (8'hb1) : (param17 <= param17))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire16,
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
                 wire4,
                 (1'h0)};
  assign wire4 = {(wire0 ?
                         $signed($unsigned($signed(wire0))) : {((8'hbd) ?
                                 (~|wire0) : wire1),
                             {(wire3 > wire1), wire3}})};
  assign wire5 = $unsigned((8'hb2));
  assign wire6 = ((wire0 ~^ (&(8'hb8))) <= ((($unsigned(wire0) ?
                             {wire3, wire5} : (wire4 ? wire1 : wire5)) ?
                         (8'ha7) : {(wire0 ? (8'ha5) : (8'ha0)), wire2}) ?
                     $signed(wire2) : (((^~wire4) * (+wire2)) && $signed((^(8'h9f))))));
  assign wire7 = $unsigned(wire2);
  assign wire8 = ($signed(wire7) && wire0[(2'h3):(2'h3)]);
  assign wire9 = (8'ha0);
  assign wire10 = wire7[(2'h2):(1'h1)];
  assign wire11 = $unsigned($unsigned($unsigned(({wire10} >> $signed(wire9)))));
  assign wire12 = $unsigned((~{wire11[(2'h3):(1'h0)], wire11}));
  assign wire13 = wire1;
  assign wire14 = $unsigned({(&$signed((~|wire11)))});
  assign wire15 = wire12;
  assign wire16 = ((&wire2) && $signed($signed((&$signed(wire12)))));
endmodule
