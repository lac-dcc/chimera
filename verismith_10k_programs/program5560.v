module top
#(parameter param30 = ((+((((8'had) ? (8'had) : (8'hbc)) != ((8'hb9) ? (8'ha2) : (8'hb2))) | (~(-(7'h44))))) ? (({((8'hb6) ? (8'hbb) : (8'hac)), {(7'h43)}} <<< (~|((8'hb6) ? (8'ha1) : (8'hb3)))) ^ {(~&((8'ha4) != (8'hbe)))}) : (((~&(~^(8'hbc))) >> ((~^(8'hb6)) ? (8'hbe) : ((8'h9c) ? (8'hbb) : (8'ha4)))) ? (~((~&(8'hb0)) >= ((8'hbd) < (8'hb8)))) : {(((8'haa) << (8'hbe)) <<< ((8'ha2) | (8'ha7)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire15;
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire15,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  module5 #() modinst16 (wire15, clk, wire1, wire0, wire3, wire4);
  assign wire17 = $unsigned(wire3[(2'h2):(1'h0)]);
  assign wire18 = $signed($signed(wire1[(2'h3):(1'h0)]));
  assign wire19 = (+$signed($unsigned(($signed(wire18) >>> (wire2 ^~ wire3)))));
  assign wire20 = wire17[(4'h8):(3'h5)];
  assign wire21 = $signed((+$signed((~^(wire3 ? wire20 : (7'h42))))));
  assign wire22 = ($unsigned((~&wire21)) ? $signed(wire18) : (8'h9c));
  assign wire23 = $signed(wire21[(2'h2):(1'h1)]);
  assign wire24 = $signed(wire1[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg25 <= $signed(wire23[(5'h13):(4'h8)]);
      reg26 <= wire1;
      reg27 <= wire1[(3'h6):(3'h4)];
    end
  assign wire28 = $signed($signed((wire19 || $unsigned((|wire20)))));
  assign wire29 = {{wire17[(2'h3):(1'h0)], wire1[(3'h4):(3'h4)]}};
endmodule

module module5
#(parameter param14 = ((((!{(8'hb5), (8'hbb)}) ? ((~^(8'hab)) & ((8'h9c) ? (8'hbf) : (8'ha9))) : ((-(8'ha0)) ? ((8'had) ? (8'ha1) : (8'hbf)) : ((8'hab) | (8'hba)))) ? (((!(8'ha0)) ? ((8'had) ? (8'hb4) : (8'hb2)) : {(8'h9c)}) | (((8'hb3) * (8'hb3)) ? (^(8'h9c)) : (~|(8'ha4)))) : {(((8'h9c) ? (7'h44) : (8'hbd)) ? (~(8'ha6)) : ((8'h9e) ~^ (7'h41))), (((8'hb7) + (8'haf)) <= ((7'h42) != (8'ha5)))}) ? (((((8'ha8) & (8'hbb)) ? ((8'haf) ? (8'hb6) : (8'ha0)) : (~(8'hb2))) != {((7'h43) && (8'haf))}) != (((^(8'hae)) ? ((8'hb5) ? (8'hb3) : (8'hbe)) : ((8'hbb) >>> (8'hb1))) ? (((7'h42) <= (8'hb3)) - (+(8'ha7))) : (~(~^(8'h9e))))) : (((((8'hba) || (8'h9d)) ? ((8'hba) <<< (8'hbd)) : (8'hae)) == (((7'h44) || (8'ha9)) >> ((8'hb7) - (8'ha8)))) && ((|((8'hac) ? (8'ha8) : (8'had))) ? (7'h41) : (~^((8'hb3) ? (8'hbd) : (8'ha0)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = (wire6 ?
                      (~^(^~($signed((8'ha3)) ?
                          (wire7 ?
                              (8'haa) : wire9) : wire6[(2'h3):(1'h0)]))) : ($unsigned((wire6 ?
                              (wire6 ? wire6 : wire6) : wire7)) ?
                          ({wire6, {wire6}} || ($unsigned((8'ha0)) ?
                              $unsigned(wire7) : (wire6 + (8'ha1)))) : $signed($unsigned((8'hb8)))));
  assign wire11 = ((($unsigned(wire10[(3'h7):(1'h0)]) == wire9) ?
                      $signed(wire6) : wire10) == $unsigned($unsigned((8'ha9))));
  assign wire12 = $unsigned($unsigned((wire6[(3'h7):(1'h0)] ?
                      (~&$signed(wire11)) : wire11[(4'h8):(1'h0)])));
  assign wire13 = wire11;
endmodule
