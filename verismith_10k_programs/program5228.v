module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = ((~^$signed({(&(8'hb8)), $unsigned((8'hba))})) ?
                     $signed((-(+$signed(wire1)))) : ($unsigned($signed(wire4[(3'h6):(1'h0)])) ?
                         {({wire1} ?
                                 $unsigned(wire0) : (+(8'hbb)))} : $signed($signed(wire4[(1'h1):(1'h1)]))));
  assign wire6 = $signed(((($signed(wire0) ^ (8'hb8)) ?
                     (wire0 > $unsigned(wire3)) : wire0) > (((wire5 ?
                             wire0 : wire0) ?
                         $signed((7'h41)) : wire4) ?
                     ((wire1 - wire1) ?
                         (wire4 + wire3) : $signed(wire1)) : $unsigned((~&(8'hb5))))));
  assign wire7 = ({wire1} >> $unsigned((wire0[(3'h4):(1'h1)] != (+(8'hb0)))));
  assign wire8 = (|wire3[(1'h0):(1'h0)]);
  assign wire9 = wire0[(2'h2):(2'h2)];
  assign wire10 = $unsigned($signed({(8'hbe), wire6}));
  always
    @(posedge clk) begin
      reg11 <= ((+$signed(((wire1 ^ wire8) + (wire9 ^ wire8)))) ?
          {(!wire5)} : $signed(($signed(((7'h41) >= (8'had))) ?
              {(^~wire2)} : wire7)));
      reg12 <= ((|reg11[(3'h4):(1'h1)]) <= wire9);
      reg13 <= wire0;
      reg14 <= $unsigned(((($unsigned((8'haf)) ?
              reg11[(2'h3):(1'h1)] : (8'hac)) || ((wire3 || (8'h9d)) ?
              ((7'h41) ? wire2 : wire3) : (wire5 * wire5))) ?
          $unsigned($unsigned({reg11})) : wire1));
    end
endmodule
