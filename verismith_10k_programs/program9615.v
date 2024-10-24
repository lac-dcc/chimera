module top
#(parameter param15 = (8'ha9), 
parameter param16 = param15)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire12,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = {(~^(~(wire0 ~^ (8'hbd)))), $signed(wire2)};
  assign wire5 = wire0;
  assign wire6 = (wire5 ? {$unsigned(wire4)} : (~^(|{((8'ha9) | wire5)})));
  assign wire7 = (7'h41);
  assign wire8 = (~wire2[(2'h2):(1'h0)]);
  assign wire9 = wire0;
  always
    @(posedge clk) begin
      reg10 <= ((^$signed((~&wire9[(1'h0):(1'h0)]))) ?
          wire9[(2'h2):(1'h0)] : wire7);
      reg11 <= ($unsigned((+wire4[(5'h11):(2'h2)])) || (^(($unsigned(wire3) >> (wire2 ^ wire9)) * $signed((wire2 && (8'hb4))))));
    end
  assign wire12 = wire9[(1'h0):(1'h0)];
  assign wire13 = (-(wire6 ?
                      ((^$signed(wire0)) ?
                          (~|(~wire8)) : $signed($signed(wire12))) : ((~wire3[(4'hc):(2'h3)]) * ({wire3} ?
                          wire12 : wire3))));
  assign wire14 = wire12;
endmodule
