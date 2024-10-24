module top
#(parameter param10 = (~^(~|(|(((8'ha8) && (8'hb6)) ? {(8'hae), (8'h9e)} : (!(8'hb8)))))), 
parameter param11 = {(param10 ? param10 : (((param10 ? param10 : (8'hae)) ? (param10 ? (8'h9e) : param10) : (param10 > param10)) ? (^~((8'haf) && param10)) : ((|param10) == ((8'hb4) ? param10 : param10))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (~^(8'haa));
  assign wire5 = wire3[(1'h0):(1'h0)];
  assign wire6 = ($unsigned(wire3) > $unsigned((((wire3 ? wire1 : wire1) ?
                     (wire0 ?
                         wire3 : wire5) : $unsigned(wire0)) + wire1[(1'h1):(1'h0)])));
  assign wire7 = (+$signed((wire3 ? wire5 : $signed($unsigned((7'h40))))));
  assign wire8 = ((wire5[(5'h11):(4'he)] >>> wire5[(4'ha):(1'h1)]) ?
                     $unsigned($signed(((~wire3) ?
                         $unsigned(wire7) : wire3[(2'h2):(1'h0)]))) : wire7[(4'hd):(4'hb)]);
  assign wire9 = wire2[(3'h5):(3'h4)];
endmodule
