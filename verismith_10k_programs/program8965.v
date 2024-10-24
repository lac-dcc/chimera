module top
#(parameter param9 = ((~|(~(+((8'h9c) ? (8'ha1) : (8'haa))))) ? ((((~(8'hb6)) > (~(8'hb4))) < ((&(8'ha9)) >>> ((8'hb2) ? (8'hb7) : (8'hbd)))) ^ ((((8'hb6) != (8'had)) >>> ((8'had) ? (8'hb2) : (8'hba))) ? {{(8'ha7), (8'ha8)}} : ({(8'hbe), (8'ha8)} <<< (-(7'h43))))) : (8'hbe)), 
parameter param10 = param9)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h22):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = {$signed(wire3)};
  assign wire6 = (wire2 ~^ wire3[(1'h1):(1'h1)]);
  assign wire7 = (8'h9e);
  assign wire8 = (((&(wire6 ?
                     (wire7 ^~ wire7) : wire0[(3'h5):(3'h4)])) < (wire3[(3'h5):(2'h3)] ?
                     wire4[(5'h13):(4'he)] : (~&(8'ha4)))) >> {wire1,
                     wire7[(4'h8):(2'h3)]});
endmodule
