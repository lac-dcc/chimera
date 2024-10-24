module top
#(parameter param20 = (((|((|(8'hbc)) ? (&(8'ha1)) : (+(8'had)))) ? (((~^(8'hbf)) ? ((8'ha1) ? (8'haf) : (8'hbf)) : {(8'hb6)}) ~^ ((+(8'haa)) <= (~^(8'hb6)))) : ((((8'hab) ^ (7'h40)) ? ((8'hb3) ? (8'h9d) : (8'ha3)) : {(8'hb9)}) + (((8'h9f) * (8'hb2)) ? ((8'hb7) == (8'hab)) : (^(8'hbd))))) >>> (((~&((8'hb0) ^~ (7'h41))) == ({(8'ha7)} >> ((8'hb6) ? (8'hb4) : (8'ha2)))) ? (|(~&((8'hae) & (8'ha9)))) : ((((8'ha6) + (8'hbc)) ? (8'h9d) : ((8'hb8) ~^ (8'ha6))) && ((-(8'hb6)) ? ((8'ha7) <<< (8'had)) : (~&(8'ha6)))))), 
parameter param21 = ((param20 ? {((param20 ? param20 : param20) ? (&param20) : (param20 ? (8'ha3) : param20)), param20} : param20) || (8'hbf)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  assign y = {wire19, wire17, wire5, wire4, (1'h0)};
  assign wire4 = $signed((-wire0[(4'hc):(3'h7)]));
  assign wire5 = wire2;
  module6 #() modinst18 (.y(wire17), .wire9(wire4), .wire10(wire0), .wire8(wire1), .clk(clk), .wire7(wire2));
  assign wire19 = {(($unsigned(wire1) << ({wire1} * $signed(wire5))) ?
                          $unsigned($unsigned($unsigned(wire2))) : {($unsigned((8'h9d)) > {wire4,
                                  wire3})}),
                      $unsigned((wire3[(2'h3):(1'h1)] <<< {(wire4 ?
                              (8'hab) : wire5)}))};
endmodule

module module6
#(parameter param15 = ((7'h42) << {((-((8'hb5) ? (8'ha9) : (7'h41))) ~^ (((8'hbe) ? (8'hbe) : (7'h41)) > ((8'hb4) >>> (8'hb8))))}), 
parameter param16 = param15)
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $unsigned((~$unsigned((((8'hb4) ^~ wire7) ?
                      $unsigned(wire7) : (wire8 ^~ wire9)))));
  assign wire12 = $unsigned(wire8);
  assign wire13 = (~{(wire7 ? wire8[(3'h5):(1'h1)] : wire11[(1'h1):(1'h1)])});
  assign wire14 = ((wire12[(4'h8):(4'h8)] ?
                          (^$unsigned((wire8 ?
                              (8'h9d) : wire12))) : $signed({wire13,
                              (8'hb7)})) ?
                      (wire9 ?
                          $signed((+{wire13})) : (wire11 ?
                              ($unsigned(wire11) >> $signed((8'hb7))) : ((wire11 >>> wire12) <= (wire12 < wire7)))) : $signed((~$signed((wire10 && wire11)))));
endmodule
