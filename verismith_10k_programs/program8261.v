module top
#(parameter param8 = ({(({(8'hb1), (8'hb3)} - ((8'ha3) ? (8'hb2) : (8'hb2))) + (~&((8'hac) ? (8'ha8) : (7'h44))))} >= (^~((+(&(8'hb0))) ? {(8'ha3), (&(8'ha9))} : ((~^(8'haf)) ? ((8'haf) ? (8'ha6) : (7'h44)) : ((8'h9e) ? (8'ha1) : (8'h9d)))))), 
parameter param9 = {(((param8 ? (^~param8) : (param8 < param8)) <= (~|param8)) ~^ {(|(param8 ? param8 : param8)), (param8 ? param8 : param8)})})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire7, wire5, wire4, reg6, (1'h0)};
  assign wire4 = ($unsigned({$unsigned((wire3 >>> wire2)),
                         wire3[(1'h0):(1'h0)]}) ?
                     $signed($unsigned($unsigned($signed(wire2)))) : ((~^wire0) >= {{(wire2 & wire3)}}));
  assign wire5 = (wire0[(4'h9):(3'h7)] ? wire4 : wire1);
  always
    @(posedge clk) begin
      reg6 <= (!wire0);
    end
  assign wire7 = ((!{wire1[(1'h0):(1'h0)]}) ^ {$signed(({wire1,
                         reg6} >>> $unsigned(wire1)))});
endmodule
