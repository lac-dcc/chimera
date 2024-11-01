module top
#(parameter param26 = (!((^{{(8'hbd)}, ((8'hb4) ? (8'hac) : (8'hb2))}) ? (+(8'hac)) : (~&(~((8'h9f) ~^ (8'hae)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire4;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire19, wire4, (1'h0)};
  assign wire4 = (^{(($unsigned(wire2) ? $signed((8'hb8)) : wire2) ?
                         wire2 : ($unsigned(wire0) ?
                             $signed(wire2) : $signed(wire0)))});
  module5 #() modinst20 (.wire9(wire2), .wire7(wire0), .y(wire19), .clk(clk), .wire8(wire3), .wire6(wire4));
  assign wire21 = ((-$unsigned($signed((wire0 ? wire19 : wire2)))) | (((wire2 ?
                              wire2 : wire3[(4'h8):(1'h1)]) ?
                          ((wire19 != wire4) ?
                              wire1 : (wire2 ~^ wire1)) : wire2) ?
                      $unsigned({$signed(wire1)}) : $signed(wire0[(4'hd):(4'ha)])));
  assign wire22 = wire1;
  assign wire23 = wire4[(3'h4):(1'h1)];
  assign wire24 = (wire3[(4'hd):(4'hc)] ?
                      {$signed(wire19[(3'h6):(3'h4)])} : wire3);
  assign wire25 = (wire24 > wire0[(2'h2):(1'h0)]);
endmodule

module module5
#(parameter param18 = (((|((^~(8'ha6)) ? ((8'hb4) ? (8'hac) : (8'hba)) : (~|(7'h43)))) ? (((~|(7'h43)) ^~ ((8'hb1) ? (8'h9d) : (8'hb1))) ? ((~&(8'h9f)) << ((8'ha3) ? (7'h42) : (8'haa))) : ((^~(8'hbb)) ? (^~(8'h9c)) : ((8'ha0) - (8'ha3)))) : {({(8'hab), (8'hb9)} ? (^(7'h43)) : (~&(8'hb6))), {{(8'hba)}, ((7'h40) ? (8'hbe) : (8'hbf))}}) < ((~(((8'hb4) - (8'hb6)) ? (!(8'ha2)) : (8'hba))) >= (~(((7'h42) - (8'haa)) ? ((8'ha0) > (7'h44)) : ((8'ha2) ? (8'hb6) : (8'hb3)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire17,
                 wire12,
                 wire11,
                 wire10,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire10 = $unsigned({wire7});
  assign wire11 = ($signed($signed(wire9)) ? wire8[(1'h1):(1'h0)] : wire7);
  assign wire12 = ($unsigned(wire6[(3'h4):(1'h1)]) ?
                      ((wire11[(2'h3):(1'h0)] & $unsigned({wire9, (8'hbd)})) ?
                          {wire9} : $unsigned($unsigned($signed(wire10)))) : ((8'ha8) == {($signed(wire10) ?
                              (wire6 ? wire10 : wire6) : (|wire6)),
                          ($unsigned(wire6) ? (wire8 ^~ wire10) : wire10)}));
  always
    @(posedge clk) begin
      reg13 <= wire9;
      reg14 <= wire11[(3'h6):(2'h3)];
      reg15 <= reg13[(3'h5):(3'h5)];
      reg16 <= wire12[(2'h3):(2'h2)];
    end
  assign wire17 = wire10[(1'h0):(1'h0)];
endmodule
