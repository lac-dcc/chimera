module top
#(parameter param16 = ((^((((8'hb5) == (8'hbe)) ? {(8'hac), (8'ha5)} : (~(8'hb7))) ^~ ((8'ha8) ? {(8'hbd), (8'hb4)} : (8'hb6)))) ? ((~&(((7'h43) ? (8'ha4) : (8'hb7)) ~^ ((8'hb3) & (8'had)))) ? {(^~(~|(8'hb3))), (((8'hbf) ? (8'hbf) : (8'hbd)) * ((8'hb3) ? (8'h9f) : (8'ha9)))} : {(^~((8'h9c) << (8'hb0)))}) : (((((8'hb1) >>> (8'ha2)) - {(8'ha9), (8'hb3)}) ? (8'h9e) : ({(7'h41)} >> ((8'had) ? (8'hb5) : (8'haf)))) - ((^~(-(8'hb3))) ? (^((8'hb2) - (7'h41))) : (^~((8'hbd) ? (8'hb2) : (8'hab)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg15,
                 reg14,
                 reg13,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(((~$unsigned(wire0)) ?
              ($unsigned(wire2) ?
                  wire4[(2'h3):(1'h0)] : $signed(wire2)) : ((wire0 || (8'hbb)) != wire3[(1'h1):(1'h1)]))) ?
          ($unsigned((((7'h42) << (8'hb8)) ?
                  $unsigned(wire3) : (wire4 > wire1))) ?
              wire3 : (({wire1} >> (wire3 ?
                  wire4 : (8'hb5))) && $signed(wire3))) : $unsigned((((wire1 ?
                  wire2 : wire3) ?
              wire4 : wire3) & wire2)));
      reg6 <= $signed((+wire4));
      reg7 <= $signed(($signed($signed(((8'ha8) ? wire2 : (8'hb6)))) ?
          $unsigned($unsigned(wire4)) : (wire3 ?
              ({reg6} >= (+wire3)) : $unsigned((~wire2)))));
    end
  assign wire8 = (~^(!wire4));
  assign wire9 = (~&reg7);
  assign wire10 = (~^$unsigned($unsigned($signed(reg5))));
  assign wire11 = wire10[(4'ha):(2'h2)];
  assign wire12 = $signed(wire9);
  always
    @(posedge clk) begin
      reg13 <= (($signed(wire12[(2'h3):(1'h1)]) ?
          (!wire10[(4'hd):(4'hd)]) : wire3[(4'hc):(4'ha)]) * $unsigned((8'ha6)));
      reg14 <= ((wire3[(2'h3):(2'h3)] >> reg6[(3'h4):(1'h0)]) <= $signed(((+(8'hba)) << (^~(^reg7)))));
      reg15 <= wire8[(4'hc):(4'h8)];
    end
endmodule
