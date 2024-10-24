module top
#(parameter param26 = ({(^~(((8'hbf) ? (7'h42) : (8'h9d)) ? (~^(8'hb8)) : (~|(8'ha6))))} ^~ (8'hae)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire13,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = (8'ha9);
  assign wire6 = (wire1 ?
                     {(8'ha5),
                         {(~wire1[(4'ha):(2'h3)]),
                             $signed(wire3)}} : $unsigned(wire2[(1'h1):(1'h1)]));
  assign wire7 = $unsigned(wire1[(4'h9):(4'h9)]);
  assign wire8 = wire2;
  assign wire9 = $signed($signed((|wire3)));
  always
    @(posedge clk) begin
      reg10 <= wire3[(1'h1):(1'h1)];
      reg11 <= ($unsigned((!wire6)) < $unsigned($signed(((^~wire3) << (wire6 || wire3)))));
    end
  assign wire12 = ((~^wire6[(1'h0):(1'h0)]) ?
                      ((((wire7 ? reg10 : wire6) >>> (reg11 ?
                              reg10 : wire8)) >> wire8) ?
                          {wire9} : $signed($unsigned(wire0))) : $unsigned({wire6[(2'h2):(1'h1)]}));
  assign wire13 = $signed($unsigned((8'ha8)));
  always
    @(posedge clk) begin
      reg14 <= wire4[(4'h9):(3'h4)];
      reg15 <= (&$signed((!((wire7 ? wire2 : wire6) ?
          (wire9 > reg11) : (^~wire9)))));
      reg16 <= $signed($signed((8'hb7)));
      reg17 <= (+$unsigned((wire9[(3'h5):(3'h4)] << ((reg16 ?
              wire13 : (8'h9d)) ?
          $unsigned(wire6) : $unsigned(reg16)))));
    end
  assign wire18 = (reg16[(1'h1):(1'h0)] && wire5[(3'h4):(1'h1)]);
  assign wire19 = ((8'ha2) ? reg16[(1'h0):(1'h0)] : reg11);
  assign wire20 = (+$signed((|($signed(wire1) ? reg16 : (wire9 + wire8)))));
  assign wire21 = wire6;
  assign wire22 = wire6;
  assign wire23 = $signed(wire20);
  assign wire24 = reg17[(1'h0):(1'h0)];
  assign wire25 = $signed({$signed($signed(reg10)), (~(wire6 ^ wire2))});
endmodule
