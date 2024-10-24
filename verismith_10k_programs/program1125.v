module top #(parameter param8 = (8'hbe)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (wire3[(5'h13):(5'h11)] <= wire1);
  assign wire5 = wire0;
  assign wire6 = (((-{wire5}) ?
                     $unsigned(((wire0 ? wire0 : wire3) ?
                         {wire3, wire0} : (wire4 ?
                             (8'ha2) : wire4))) : (+((8'hbf) && wire1))) >>> (wire3[(4'he):(1'h0)] ?
                     (~|wire2[(2'h2):(1'h0)]) : (($signed((8'hb9)) ?
                             $signed(wire1) : $unsigned(wire0)) ?
                         wire0 : wire2[(1'h0):(1'h0)])));
  assign wire7 = {wire2, wire2[(1'h0):(1'h0)]};
endmodule
