module top
#(parameter param8 = ((-(^(!(&(8'hbb))))) == {((((8'haf) ? (8'hb6) : (8'ha6)) + (8'hb2)) >> ({(7'h43), (8'hba)} >>> ((8'ha6) ? (8'hb2) : (8'hbb))))}), 
parameter param9 = {(((param8 ? (~^param8) : (param8 ? param8 : param8)) >>> (|{param8})) ~^ ((((8'h9d) | param8) ? (!param8) : (param8 ? param8 : param8)) ^~ param8)), param8})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~wire2[(2'h2):(1'h1)]);
  assign wire5 = ({(~&$unsigned((wire2 ? wire3 : wire3))), {wire0}} ?
                     (~&(~^$signed($signed(wire1)))) : wire4[(2'h2):(1'h1)]);
  assign wire6 = (wire3 >> wire3[(1'h0):(1'h0)]);
  assign wire7 = (~&wire0);
endmodule
