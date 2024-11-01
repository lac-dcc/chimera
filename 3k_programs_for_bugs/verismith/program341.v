module top
#(parameter param27 = {(((~{(8'hbf), (7'h41)}) ? ((|(8'hab)) ? ((8'hae) ? (8'hb9) : (8'ha1)) : {(8'ha6)}) : {(+(8'h9f)), {(8'hab)}}) << (~|((8'hb2) ? ((8'ha3) && (8'ha5)) : ((8'ha5) ? (8'h9f) : (8'hb1)))))}, 
parameter param28 = (^(({{(8'ha7), param27}, {param27, param27}} * ({param27, param27} ? {(8'hbd), param27} : (+param27))) > param27)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire15;
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire15,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  module4 #() modinst16 (.wire8(wire1), .wire6(wire3), .wire5(wire0), .wire7(wire2), .y(wire15), .clk(clk));
  always
    @(posedge clk) begin
      reg17 <= wire2;
      reg18 <= $signed(({wire3, ((|(8'hb7)) ? (8'hb8) : $signed((8'ha0)))} ?
          ({(~&wire1)} ^~ ((~|wire2) ?
              $unsigned((8'hba)) : wire15[(2'h2):(2'h2)])) : (|{wire3[(5'h10):(1'h0)]})));
      reg19 <= reg18[(4'hd):(2'h3)];
    end
  assign wire20 = {(!(8'hb2))};
  assign wire21 = wire20;
  assign wire22 = wire20;
  assign wire23 = wire15;
  assign wire24 = wire20[(1'h1):(1'h1)];
  assign wire25 = (((($unsigned(wire15) >= $unsigned(wire20)) ?
                      ($signed(reg19) <= (wire21 ?
                          wire23 : wire22)) : {(-wire22),
                          (&wire3)}) | wire24) >>> (((~&((8'hb0) ?
                              reg19 : wire21)) ?
                          (reg19[(4'h8):(2'h2)] || $signed((7'h41))) : $unsigned(reg19)) ?
                      wire3 : (~&(wire2[(3'h5):(2'h3)] ?
                          {(8'ha5)} : (reg17 ? wire22 : reg18)))));
  assign wire26 = wire24;
endmodule

module module4
#(parameter param14 = (((^({(8'h9e), (8'hbc)} ? (~(8'ha4)) : {(8'hb6)})) >> (((^~(8'haf)) ? ((8'h9f) <<< (8'hbd)) : ((8'ha5) && (8'ha9))) >>> (((8'hb3) ^~ (8'hb7)) >> ((8'hac) >>> (8'hbb))))) ? {(~&(8'hb1))} : (!((((8'hb6) <<< (8'ha5)) + ((8'ha2) >>> (8'ha8))) ? {((8'hb1) ? (8'ha5) : (8'h9f))} : (8'ha8)))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(4'hf):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  assign y = {wire13, wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = ((!wire8[(1'h1):(1'h0)]) < $signed((wire5[(4'h8):(3'h4)] << $signed({wire8,
                     wire7}))));
  assign wire10 = $signed((^(~^$unsigned((wire6 ? wire9 : wire7)))));
  assign wire11 = $unsigned({$unsigned($unsigned(wire10[(4'hc):(4'ha)])),
                      $signed((wire7 * {(8'hb0)}))});
  assign wire12 = $signed(wire6[(3'h6):(1'h0)]);
  assign wire13 = $unsigned($unsigned(wire8[(2'h2):(1'h0)]));
endmodule
