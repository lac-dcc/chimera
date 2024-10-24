module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire22;
  assign y = {wire29, wire28, wire27, wire26, wire25, wire24, wire22, (1'h0)};
  module4 #() modinst23 (wire22, clk, wire1, wire0, wire3, wire2);
  assign wire24 = (wire1[(2'h3):(2'h3)] ?
                      {(wire2 ?
                              (wire1[(4'h9):(2'h2)] << (^(8'ha6))) : (wire3 ?
                                  wire2[(3'h4):(2'h3)] : (wire1 ?
                                      wire22 : wire3))),
                          (!($signed(wire1) != $signed(wire22)))} : $signed($signed(wire22[(3'h4):(1'h1)])));
  assign wire25 = wire2;
  assign wire26 = wire24[(1'h1):(1'h1)];
  assign wire27 = $signed((-$unsigned($unsigned($unsigned(wire1)))));
  assign wire28 = $signed(wire3);
  assign wire29 = (~^wire3);
endmodule

module module4
#(parameter param21 = ({(({(8'h9e), (8'hbd)} ^ ((8'hab) != (8'hb0))) ? ((^(8'ha2)) ? ((8'hae) ? (8'hb6) : (8'ha8)) : ((8'ha1) ? (8'ha2) : (8'ha9))) : {((8'h9c) ? (8'hb3) : (8'hb3))})} - (8'h9f)))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire9 = $signed(wire6[(4'h9):(4'h8)]);
  assign wire10 = ($unsigned({$unsigned(((8'ha6) < wire8))}) + wire5[(3'h7):(3'h4)]);
  assign wire11 = (~|wire6[(3'h7):(2'h3)]);
  assign wire12 = (^((|wire10[(2'h3):(1'h0)]) ?
                      $signed($signed((8'ha7))) : wire8[(4'ha):(3'h7)]));
  always
    @(posedge clk) begin
      reg13 <= ((($signed($signed(wire5)) ?
          wire11 : wire8[(3'h4):(2'h3)]) > (wire8 ?
          wire11[(1'h1):(1'h0)] : ((wire9 ? (8'hb5) : wire12) <<< (wire9 ?
              wire8 : wire5)))) <= wire11);
      reg14 <= (wire12 ?
          wire12[(4'hc):(2'h2)] : ($unsigned(($signed(wire7) ?
                  (reg13 ? wire7 : wire12) : (wire9 ? wire7 : (8'ha0)))) ?
              {wire9} : {((wire5 << wire6) ? reg13 : (8'hb6))}));
      reg15 <= (+((wire9[(2'h3):(1'h1)] ^~ reg14[(1'h0):(1'h0)]) ?
          $unsigned((^(wire9 ?
              reg13 : wire6))) : $unsigned($signed((wire6 >>> (8'h9e))))));
    end
  assign wire16 = {$unsigned(wire10[(3'h4):(1'h0)])};
  assign wire17 = (wire9[(2'h2):(2'h2)] ?
                      reg13[(4'ha):(4'ha)] : ($signed(wire10[(2'h3):(2'h2)]) == (((!reg14) >= {wire9,
                          wire16}) * $signed((^wire5)))));
  assign wire18 = $unsigned($unsigned(wire11[(3'h5):(2'h3)]));
  assign wire19 = wire6;
  assign wire20 = reg15;
endmodule
