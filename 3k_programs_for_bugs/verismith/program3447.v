module top
#(parameter param26 = {(|((((8'hba) >> (8'hbf)) << {(8'haf)}) >>> {(~(7'h40))}))}, 
parameter param27 = param26)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire4 = ((($signed(wire3) != (+$unsigned(wire0))) ?
                     (wire0[(2'h3):(2'h3)] != wire3[(4'hb):(1'h0)]) : {wire2[(2'h2):(1'h1)],
                         $unsigned(((8'hb5) ?
                             wire2 : wire3))}) << $signed((~|(wire1[(1'h0):(1'h0)] || wire0[(4'hd):(4'h8)]))));
  assign wire5 = ($unsigned((~^wire1)) <<< $signed($signed((&$signed(wire0)))));
  assign wire6 = $signed(($unsigned(($signed(wire1) ?
                         wire2[(2'h2):(2'h2)] : $signed(wire1))) ?
                     (^wire0[(1'h1):(1'h0)]) : (+({wire4,
                         wire5} ^~ ((8'hb5) >>> wire3)))));
  assign wire7 = (((wire6[(1'h0):(1'h0)] ?
                         {wire4[(4'hd):(3'h5)]} : {(wire2 <<< wire1)}) - ($unsigned($signed(wire3)) ?
                         (((8'had) ?
                             wire1 : wire4) <= $unsigned(wire1)) : wire5)) ?
                     wire6[(3'h4):(1'h0)] : $signed(((~^{(8'hb6)}) * (8'hbe))));
  always
    @(posedge clk) begin
      reg8 <= wire6;
      reg9 <= (~&wire3);
    end
  module10 #() modinst22 (wire21, clk, wire2, reg9, wire5, wire4, wire6);
  assign wire23 = (~|reg8);
  assign wire24 = (((-{(wire1 >>> wire23), wire2}) ?
                      ($signed((wire7 ? reg8 : wire23)) ?
                          (8'hbd) : ($signed(wire1) + ((8'hb5) ?
                              (8'hbb) : wire6))) : ({wire6} ?
                          ((~wire1) | (wire2 ?
                              wire3 : wire1)) : wire0[(3'h5):(1'h0)])) >= $signed((reg9[(1'h0):(1'h0)] - (!(~^wire3)))));
  assign wire25 = {(&(wire6 <= (&(^~wire24)))),
                      (wire0 ?
                          $unsigned(({reg9} ^~ (wire1 && (8'hb8)))) : ({(~&(8'hb4)),
                                  $signed(wire7)} ?
                              {wire6[(2'h2):(1'h0)],
                                  $signed(wire5)} : reg9[(4'hb):(3'h5)]))};
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire signed [(3'h6):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  assign y = {wire20, wire17, wire16, reg19, reg18, (1'h0)};
  assign wire16 = wire11;
  assign wire17 = $unsigned(wire13[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg18 <= wire16;
      reg19 <= $unsigned(wire11[(4'hd):(3'h7)]);
    end
  assign wire20 = $unsigned(reg19[(4'hd):(3'h6)]);
endmodule
