module top
#(parameter param46 = ((~^(((!(8'hb2)) ? ((7'h44) ? (8'h9d) : (8'had)) : (~^(8'ha3))) != {((7'h41) < (8'hb8))})) == (~(~(((8'ha9) && (8'h9e)) ? (&(7'h40)) : (&(8'hbd)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire43;
  assign y = {wire45, wire5, wire6, wire7, wire8, wire9, wire43, (1'h0)};
  assign wire5 = wire2[(2'h2):(1'h1)];
  assign wire6 = (~^wire0[(4'he):(4'hc)]);
  assign wire7 = wire6[(5'h12):(4'hd)];
  assign wire8 = $signed(wire7[(3'h4):(2'h3)]);
  assign wire9 = $unsigned((~$signed(({wire8, wire4} <<< ((8'hb5) | wire0)))));
  module10 #() modinst44 (wire43, clk, wire0, wire4, wire3, wire7, wire6);
  assign wire45 = (((~^$signed(((8'hbe) ?
                      wire6 : wire9))) >= (^$signed($unsigned(wire7)))) <<< $signed(({(|(8'hbe)),
                      (wire3 ? wire1 : wire2)} || (8'hbd))));
endmodule

module module10
#(parameter param41 = {(&(~(~|((8'hb8) & (8'h9c))))), (|(({(8'hb5)} + ((7'h44) < (8'hb0))) || (8'ha2)))}, 
parameter param42 = ((((^{param41}) ^ (&(param41 && param41))) ? (8'ha9) : (((param41 ? param41 : param41) > param41) <= ((param41 ? param41 : param41) >= (param41 <<< param41)))) ? (~^(~&(^~{(8'hbb), param41}))) : ((-(7'h43)) ? param41 : ((&(8'ha6)) ? ((param41 * param41) ? (param41 ? param41 : param41) : (8'had)) : (|(param41 ? param41 : param41))))))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire31;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire16,
                 wire31,
                 (1'h0)};
  assign wire16 = $signed((&$unsigned({{wire13}})));
  module17 #() modinst32 (.y(wire31), .wire20(wire11), .wire18(wire16), .wire22(wire13), .wire19(wire15), .wire21(wire12), .clk(clk));
  assign wire33 = ((wire12 ? wire31[(4'h8):(3'h7)] : $signed(wire16)) ?
                      (8'h9c) : $signed((((wire11 <<< wire16) ?
                              (^~wire14) : (|(8'h9c))) ?
                          ((+wire31) ?
                              (~&(8'hb3)) : (~wire31)) : ($signed((8'hbb)) ?
                              wire11[(3'h5):(2'h3)] : wire14))));
  assign wire34 = wire33;
  assign wire35 = (+(((-(-(7'h41))) || (~^{wire16,
                      wire14})) <<< $signed((8'haf))));
  assign wire36 = (+($unsigned((wire14 ^~ (-wire15))) || (wire31[(4'he):(4'hd)] & $signed(wire13[(3'h4):(1'h1)]))));
  assign wire37 = wire15;
  assign wire38 = (wire16 >> (~^$signed(($signed((8'hb6)) < (wire13 >> wire15)))));
  assign wire39 = (wire38[(3'h6):(1'h0)] && $signed($signed({((8'hb4) ?
                          wire13 : wire36)})));
  assign wire40 = {($signed((~{(8'hb4)})) == wire11)};
endmodule

module module17
#(parameter param30 = ((^({(~^(8'hb9)), (~^(8'hb9))} - (((8'h9f) ? (8'ha9) : (8'hac)) ? ((8'haa) ? (7'h44) : (8'h9d)) : ((8'hbb) >> (8'haa))))) ? (((^~((8'h9d) ^ (8'ha1))) > (((8'ha1) & (7'h42)) << ((8'h9f) ? (8'haa) : (7'h40)))) <= (((8'h9f) << (^~(8'ha0))) || {(~(8'haf)), ((8'hbd) ^~ (7'h40))})) : {((-{(8'hb1), (7'h41)}) & {((8'hb2) || (8'haf))}), {(((8'h9d) != (8'h9c)) ? ((8'hab) ? (8'hb5) : (8'h9c)) : ((8'hb5) || (8'ha5))), (&((8'hbe) ? (8'hb2) : (7'h44)))}}))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  assign y = {wire29, wire27, wire26, wire25, wire24, wire23, reg28, (1'h0)};
  assign wire23 = wire21[(3'h7):(3'h6)];
  assign wire24 = $signed(wire22);
  assign wire25 = ($signed(wire24[(4'hb):(4'hb)]) ?
                      $unsigned((wire19[(3'h4):(1'h0)] * (7'h42))) : wire23);
  assign wire26 = (~^$unsigned(wire22));
  assign wire27 = wire18[(4'h8):(2'h2)];
  always
    @(posedge clk) begin
      reg28 <= {$unsigned(wire19), $signed(wire19[(1'h1):(1'h1)])};
    end
  assign wire29 = (8'hb4);
endmodule
