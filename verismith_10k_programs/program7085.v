module top
#(parameter param9 = ({({(~&(8'hb5)), ((8'hb7) ? (8'hba) : (8'ha7))} ? (((7'h44) <<< (8'ha8)) ? ((8'hba) ~^ (8'ha7)) : {(8'h9d)}) : (|{(8'haf)})), ((~(^~(8'hb0))) ? ({(8'hb6)} ^ ((8'hbe) ? (8'ha1) : (8'h9f))) : ((|(7'h42)) >= ((8'hb3) ? (8'hb2) : (8'ha7))))} >= ((^((&(8'hab)) ? ((7'h40) * (7'h44)) : (!(8'ha1)))) ? (^({(7'h40), (8'hba)} | (~(8'h9f)))) : ((((8'ha8) == (8'hbc)) ? ((8'hb7) ? (8'ha3) : (8'hae)) : (|(8'ha6))) ^~ (~&(8'hbf))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = $unsigned($unsigned(wire4));
  assign wire6 = $signed((^~(wire3[(1'h1):(1'h0)] >>> $signed((&wire0)))));
  assign wire7 = (~|(wire6 ? (8'haa) : ((^$signed(wire2)) <<< wire5)));
  assign wire8 = (wire6[(3'h5):(2'h3)] ~^ (wire0[(1'h0):(1'h0)] ?
                     (8'hab) : wire0[(1'h1):(1'h1)]));
endmodule
