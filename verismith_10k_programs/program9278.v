module top
#(parameter param9 = ((((-((8'h9e) < (8'hbe))) ^~ (((8'hab) ^~ (8'hbf)) && ((8'hb0) ^ (7'h44)))) << (!({(8'had), (8'ha9)} | (~|(7'h40))))) ? ((+(~|((7'h43) ? (7'h41) : (8'ha7)))) > {((&(8'hac)) < {(8'hbb), (8'ha6)})}) : (~^({(7'h41), (8'hb0)} && (((8'hb5) ? (8'hbb) : (8'h9f)) ? ((8'hb8) != (8'hb8)) : (~(8'ha3)))))), 
parameter param10 = ({(((~param9) >= ((8'hb3) + param9)) * {(param9 >> param9), param9})} ? param9 : param9))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = ($signed((!$unsigned((wire1 == wire2)))) ?
                     (~|{((wire3 ? wire0 : wire4) ?
                             wire0[(4'hb):(1'h1)] : (wire4 ? (8'hbe) : wire1)),
                         $unsigned(wire2)}) : {((wire0 ?
                             (wire2 ~^ wire4) : (wire0 <<< wire3)) | (~^$unsigned(wire3))),
                         wire0});
  assign wire6 = (8'hbd);
  assign wire7 = (!$signed($unsigned(wire2)));
  assign wire8 = ({$signed(({wire2} ?
                             wire2[(5'h10):(2'h2)] : $unsigned(wire4))),
                         ({(wire3 * wire2)} ?
                             wire0 : $unsigned(wire7[(1'h0):(1'h0)]))} ?
                     wire6 : $unsigned((~&$signed((8'hb7)))));
endmodule
