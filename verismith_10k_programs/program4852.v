module top
#(parameter param10 = ({({((8'ha2) ? (8'hb3) : (7'h40))} ? {(^~(8'hbf)), (^~(8'hac))} : ((^~(8'ha4)) == (!(8'ha1))))} ? ({(~&{(8'hb2), (8'ha1)}), (((8'h9f) ? (8'hb7) : (8'h9d)) ? ((8'h9e) ? (8'hbf) : (8'hb2)) : {(8'ha1), (8'haf)})} >= (((~^(8'ha9)) >> ((8'had) ? (8'ha2) : (8'hbc))) <= (((8'ha9) ? (8'ha8) : (8'h9f)) ? (~(8'hb6)) : ((8'ha3) * (8'hac))))) : (!(-(-((7'h40) ^~ (7'h43)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  assign y = {wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = wire1[(4'hb):(2'h2)];
  assign wire6 = $signed({{(|$unsigned(wire3))},
                     ($unsigned((^~wire0)) < $signed($unsigned((8'ha5))))});
  assign wire7 = wire0[(2'h2):(1'h0)];
  assign wire8 = {(wire7 ?
                         (((wire6 ? (8'hb3) : wire7) ?
                                 (~^wire1) : $unsigned(wire1)) ?
                             wire6 : $unsigned((wire6 ?
                                 wire4 : wire4))) : $unsigned({$unsigned(wire4),
                             ((8'ha9) != wire5)}))};
  assign wire9 = $unsigned(wire5);
endmodule
