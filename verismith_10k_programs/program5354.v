module top
#(parameter param8 = (({({(8'hb2), (8'h9f)} >> {(8'hbc), (8'ha0)}), {((8'hbd) <<< (8'hb4)), ((8'ha5) | (8'ha3))}} && (8'hba)) <= (-((((8'ha6) ? (8'h9d) : (8'ha2)) == ((8'haf) ? (8'ha6) : (8'had))) ? ((8'ha4) - ((8'hbc) ? (7'h40) : (8'ha7))) : (7'h44)))), 
parameter param9 = (~((~^({param8} ? {param8} : (param8 ? param8 : param8))) > param8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned({((~&wire3) ? wire3[(4'hb):(3'h4)] : (8'hae))});
  assign wire5 = wire3[(3'h5):(3'h4)];
  assign wire6 = ($signed(((wire1 < (8'ha8)) ?
                         $unsigned(((8'hbc) ? wire0 : wire4)) : wire2)) ?
                     (wire5[(2'h2):(1'h1)] ?
                         $unsigned(wire1[(2'h3):(1'h1)]) : (wire2[(4'he):(3'h7)] & $signed(wire5))) : wire3[(3'h7):(2'h3)]);
  assign wire7 = ($unsigned((wire5 ?
                     $signed(wire6[(1'h0):(1'h0)]) : (!wire5[(1'h0):(1'h0)]))) == (!($signed((wire1 ?
                     wire5 : wire2)) || $signed(wire3[(1'h1):(1'h0)]))));
endmodule
