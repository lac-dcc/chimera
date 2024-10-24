module top
#(parameter param8 = (((~&{((8'ha6) ? (8'hbd) : (8'hbe)), (~|(8'hbc))}) == ({(|(8'ha0)), ((8'ha8) - (8'ha1))} ? (((8'hab) ? (8'hbc) : (8'hb4)) ^~ ((8'ha7) ~^ (8'ha4))) : (!(^~(8'had))))) ? (({((8'h9e) ? (8'hb5) : (8'hb8)), (~^(8'hab))} + ((~|(8'ha5)) ^~ (~|(8'ha9)))) * (+(((8'ha1) ~^ (8'h9d)) >> ((8'ha5) ? (8'h9c) : (8'haf))))) : ((-((7'h42) ~^ ((8'hb4) && (8'had)))) ^ ((((8'hb0) < (8'had)) <<< {(8'hbc), (7'h41)}) ? (|((8'hbd) ? (8'hb8) : (8'haa))) : ((8'hbf) >= ((8'haa) ? (8'ha7) : (7'h43)))))), 
parameter param9 = (((^(~(param8 ? param8 : param8))) < param8) ? ({param8, (param8 ? param8 : (param8 < (7'h44)))} ? param8 : ((((7'h40) - param8) >= param8) ? param8 : ((^~(8'ha8)) ? param8 : {param8}))) : param8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $signed($signed($unsigned($signed(wire3))));
  assign wire5 = wire2[(1'h1):(1'h1)];
  assign wire6 = wire5;
  assign wire7 = wire2;
endmodule
