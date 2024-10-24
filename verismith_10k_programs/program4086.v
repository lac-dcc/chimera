module top
#(parameter param8 = ((~|(((^(8'hbf)) << {(8'hbd), (7'h40)}) < (((8'had) ? (8'haa) : (8'hba)) ? {(7'h41), (8'hb9)} : (^(8'hbf))))) ? ((~{(8'ha9)}) ? ({(^(7'h41)), {(8'hae), (8'ha1)}} <<< ((8'hb6) & (~&(8'hbf)))) : {({(8'ha9)} && {(8'ha2), (8'hb3)})}) : (((~&(|(8'hba))) ? ({(8'hb0)} ? (!(8'hb2)) : (-(8'hab))) : (!((8'ha9) ? (8'ha9) : (7'h40)))) > (8'ha6))), 
parameter param9 = (({((param8 ? param8 : (8'ha9)) ? param8 : {param8})} ? (param8 || {param8, {(8'hbe), param8}}) : ((param8 ? param8 : (param8 ? param8 : param8)) <<< param8)) + (param8 <<< {((7'h44) ? (param8 ? param8 : param8) : (param8 ? param8 : param8))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire7, wire6, wire4, reg5, (1'h0)};
  assign wire4 = $unsigned(wire0);
  always
    @(posedge clk) begin
      reg5 <= (^$unsigned($unsigned((|wire1[(4'h9):(4'h8)]))));
    end
  assign wire6 = $unsigned($unsigned($unsigned(wire1[(3'h6):(3'h4)])));
  assign wire7 = {(|(wire3 ~^ ((+wire2) ? $unsigned(wire1) : $signed(wire4)))),
                     $unsigned(reg5)};
endmodule
