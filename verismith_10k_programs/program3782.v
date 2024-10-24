module top
#(parameter param11 = {((~((+(8'ha4)) >>> ((8'h9e) ? (8'hbf) : (8'ha5)))) ? ((((8'hb3) ? (8'h9e) : (8'hbc)) || ((7'h43) >= (8'hbe))) ? (~&((8'ha4) & (8'hb9))) : ((~(8'ha6)) ? ((8'ha1) ? (7'h43) : (8'h9f)) : ((8'hb4) ? (8'hb5) : (8'hb6)))) : ((|((8'hb7) <= (7'h43))) ? ((8'hbd) & (^~(8'hb8))) : ((^(8'hab)) ? ((8'ha1) ? (8'hb5) : (8'ha8)) : ((8'hb6) ? (8'hab) : (8'hae)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  assign y = {wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (~{(~&wire1[(1'h0):(1'h0)])});
  assign wire6 = {({(wire2 ? wire1 : $signed(wire2))} && wire1[(4'ha):(3'h6)])};
  assign wire7 = {(&((wire2[(4'ha):(3'h5)] || (wire2 ~^ wire2)) & (8'hab))),
                     $signed($signed((+wire3[(2'h2):(2'h2)])))};
  assign wire8 = ($unsigned($unsigned(wire4[(3'h4):(3'h4)])) ? wire5 : (8'h9e));
  assign wire9 = wire7[(5'h11):(2'h2)];
  assign wire10 = $unsigned($unsigned({$signed((wire1 ? wire8 : wire5)),
                      wire2}));
endmodule
