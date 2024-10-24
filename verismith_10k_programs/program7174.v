module top
#(parameter param10 = (~^((8'hb8) ? (~^((^~(8'hb8)) * ((7'h41) ? (8'ha1) : (8'haf)))) : (((~|(8'hb3)) ^ {(8'hb4)}) >>> (((8'ha4) & (8'ha5)) || ((8'ha8) ? (7'h42) : (8'hb3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire9, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned(wire2) + $signed((&(&(~|wire1)))));
  assign wire5 = (((wire2[(1'h1):(1'h1)] & wire2[(1'h0):(1'h0)]) ?
                     {((~^wire0) ? $signed(wire1) : (^wire1)),
                         wire0} : $signed($unsigned(wire3[(2'h2):(1'h1)]))) == {$unsigned(((wire1 ?
                             wire3 : wire4) ?
                         $unsigned(wire1) : $signed((8'hb5)))),
                     ((wire0[(1'h0):(1'h0)] && (wire4 && (8'hbf))) | wire0[(2'h3):(1'h0)])});
  assign wire6 = (wire1[(1'h0):(1'h0)] ?
                     $unsigned(($signed(wire1[(3'h7):(2'h3)]) >= ((wire4 || wire4) ?
                         wire4 : (wire2 - wire1)))) : wire2[(4'hb):(4'h9)]);
  assign wire7 = $signed(wire5[(4'h8):(3'h6)]);
  assign wire8 = ($signed((({wire6,
                     wire4} - wire6[(2'h3):(1'h1)]) & $unsigned(((8'hae) && wire5)))) <= (wire1 ?
                     (((&(8'hb2)) ?
                         (^wire5) : (|wire7)) + wire6) : (({wire3} << (wire2 ?
                             wire2 : wire2)) ?
                         $unsigned({wire3, wire1}) : ((wire6 ? wire1 : wire0) ?
                             $unsigned((8'ha4)) : {(8'hb5), (8'hae)}))));
  assign wire9 = $signed((~|$signed(((wire6 ? wire3 : wire3) ?
                     (wire2 || wire8) : (~|wire4)))));
endmodule
