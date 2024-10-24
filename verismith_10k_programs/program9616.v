module top
#(parameter param12 = (~&(({{(7'h42), (8'hb6)}} ? (|(&(8'ha8))) : (~&((7'h43) ? (8'hbc) : (8'ha6)))) ? ({((8'hb2) ? (8'hba) : (8'hb5))} | ({(8'ha9), (8'h9d)} || ((8'ha7) ? (8'hbf) : (8'had)))) : (~{(~(8'h9c)), (-(8'ha8))}))), 
parameter param13 = ((~|(+(8'had))) ~^ param12))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  assign y = {wire11, wire10, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ((|wire4) != (8'hba));
  assign wire6 = wire1;
  assign wire7 = $unsigned((((~&wire3[(2'h3):(1'h1)]) ?
                     ((wire0 ? wire6 : wire1) ?
                         (wire5 ?
                             wire6 : wire2) : wire1[(2'h3):(2'h3)]) : $signed((!wire6))) >> (((wire3 ^~ wire5) ?
                         wire1 : (wire3 ? wire4 : (8'hbb))) ?
                     (-((7'h40) ? wire0 : (7'h43))) : wire6)));
  assign wire8 = {$unsigned(((~&$signed(wire3)) * $signed($signed(wire2)))),
                     $unsigned(wire0[(2'h2):(2'h2)])};
  assign wire9 = ((~{($unsigned(wire8) ?
                             $unsigned((8'hb4)) : (wire3 ? (8'hbc) : wire2))}) ?
                     wire0[(1'h1):(1'h0)] : ($unsigned(wire1[(1'h0):(1'h0)]) ?
                         $unsigned(((&(8'haa)) >> $unsigned(wire8))) : wire8[(2'h3):(1'h1)]));
  assign wire10 = ({$unsigned((&(+wire8)))} ?
                      wire7[(3'h5):(2'h3)] : $unsigned((wire1 ?
                          {((8'ha8) < wire5), $unsigned(wire6)} : wire8)));
  assign wire11 = (~(wire2 ?
                      ($unsigned($unsigned((7'h40))) >= $unsigned((wire0 != wire10))) : wire6[(4'hf):(4'hc)]));
endmodule
