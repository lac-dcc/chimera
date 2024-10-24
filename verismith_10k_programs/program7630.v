module top
#(parameter param9 = (|((8'hb8) ? ((((8'hba) - (8'hb1)) ? (|(8'ha3)) : (8'haa)) == {{(8'hb9), (8'ha7)}, ((7'h41) ? (7'h43) : (7'h41))}) : (^{{(8'hb2), (8'hac)}, {(8'hbc), (8'ha6)}}))), 
parameter param10 = ((param9 > {((^~param9) ? (!param9) : param9), ({param9, param9} <<< param9)}) != (((param9 ? {(8'ha8)} : (param9 ? param9 : (7'h41))) ? ((~^param9) ~^ (param9 ^ param9)) : {(~&param9), (param9 - param9)}) | (+(param9 & param9)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  assign y = {wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned($unsigned((wire1 ?
                     (wire3 ? wire1 : wire0) : (wire0 ?
                         wire2 : (7'h44))))) >> wire3[(5'h10):(3'h7)]);
  assign wire5 = (wire1 ?
                     $signed((&((wire3 < wire0) ^~ $unsigned(wire4)))) : (-($signed($signed(wire3)) + (~^$unsigned((8'hb2))))));
  assign wire6 = ((~&(^~((wire1 - wire1) ?
                         (wire0 <<< wire3) : (wire5 ? wire0 : (8'ha9))))) ?
                     $unsigned(wire4[(1'h0):(1'h0)]) : (!$signed((~&wire1))));
  assign wire7 = ((~|{wire4}) | ((8'hbf) ?
                     (wire0 ? wire3 : wire1) : (^$unsigned({wire3}))));
  assign wire8 = wire2[(4'hd):(2'h3)];
endmodule
