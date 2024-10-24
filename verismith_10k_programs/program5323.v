module top
#(parameter param8 = ((8'hbb) ^~ (((|(+(8'hae))) ? (|(~|(8'ha6))) : {((7'h41) ? (7'h42) : (8'ha6))}) || (!{(-(8'hbd))}))), 
parameter param9 = (((8'haa) ? (^~((param8 ? param8 : param8) ? (param8 ? param8 : param8) : ((8'ha1) || param8))) : (param8 ? ((param8 ? param8 : param8) ? ((8'h9f) && (8'hb5)) : ((8'h9c) ? param8 : param8)) : ({(8'h9e)} >= param8))) ? {(~|(8'h9d))} : ((!(((8'haf) ? param8 : param8) >= param8)) ? {(((8'hb9) > (8'hb8)) ? (param8 == param8) : param8)} : {({(8'hb3)} ? (^param8) : (|param8))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  assign y = {wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned({{{$unsigned(wire2), {wire1}}, wire1[(4'h9):(1'h0)]},
                     wire0});
  assign wire5 = $signed(($unsigned((|wire2[(1'h0):(1'h0)])) ?
                     $unsigned((wire3[(3'h6):(3'h4)] ?
                         wire1[(1'h0):(1'h0)] : {(8'h9c),
                             wire4})) : ($signed(wire2) && ((+(8'hb3)) ?
                         (~^wire0) : wire2[(1'h0):(1'h0)]))));
  assign wire6 = $unsigned(wire2);
  assign wire7 = (&$signed($unsigned(wire0)));
endmodule
