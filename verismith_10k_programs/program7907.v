module top
#(parameter param18 = ((8'h9d) ? ((~{((8'hbe) & (7'h44)), ((8'hb4) ? (8'ha7) : (8'ha1))}) ? (&({(8'hab), (8'hb4)} >> (~&(8'hbb)))) : ((~^((8'ha7) ? (8'h9f) : (8'hb1))) ? {((8'hac) ^ (8'hb8))} : (((7'h40) >>> (7'h44)) ^~ ((8'h9e) ? (8'hbc) : (8'hac))))) : ((^~(+((7'h44) ? (8'h9d) : (8'hbe)))) | (|(-((8'hbf) ? (8'ha5) : (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (-(wire1 ? wire4[(2'h3):(1'h0)] : $signed({$signed(wire1)})));
  assign wire6 = (|$unsigned((~&(-$unsigned(wire3)))));
  assign wire7 = wire2;
  assign wire8 = $signed(wire4);
  assign wire9 = wire4;
  assign wire10 = $unsigned(($signed(($unsigned((8'hba)) << (wire0 ^ wire8))) != {$unsigned((^(8'hac)))}));
  always
    @(posedge clk) begin
      reg11 <= wire8[(4'h9):(1'h1)];
      reg12 <= ((~|wire0) ~^ wire10[(5'h10):(3'h4)]);
      reg13 <= (^~(~^reg12[(3'h6):(1'h0)]));
      reg14 <= (7'h43);
      reg15 <= $signed($unsigned(($signed(wire8) ?
          {$signed(wire4)} : {(wire1 < wire5), (wire7 << wire1)})));
    end
  assign wire16 = $signed(reg12[(2'h3):(2'h2)]);
  assign wire17 = wire0;
endmodule
