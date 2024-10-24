module top
#(parameter param18 = (~{(^~((&(8'hae)) ? {(8'hb3)} : ((8'hae) ? (8'hac) : (8'hb2)))), (^~(((8'hbf) ? (8'hb3) : (8'ha5)) > ((8'hb5) ? (7'h44) : (8'hb1))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire11,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 (1'h0)};
  assign wire5 = wire2;
  assign wire6 = ({(^~(~wire4[(1'h1):(1'h0)]))} ?
                     ((wire4[(2'h3):(1'h0)] ?
                             (~|wire0) : $unsigned((wire1 ^ wire4))) ?
                         wire5[(3'h4):(2'h2)] : $signed(wire2[(4'hc):(3'h7)])) : (^{$unsigned($signed(wire2)),
                         $unsigned($signed((8'haf)))}));
  assign wire7 = ((~(~&(!wire6[(2'h3):(2'h2)]))) | $signed(wire0[(2'h2):(1'h1)]));
  assign wire8 = $unsigned(((wire4 ? wire5[(3'h4):(3'h4)] : wire0) ?
                     $unsigned(($unsigned(wire4) ?
                         wire1 : $unsigned(wire2))) : wire7));
  assign wire9 = $unsigned(($unsigned($unsigned((wire0 * wire6))) ?
                     $signed({(~&wire4),
                         $signed(wire3)}) : {wire7[(3'h6):(2'h3)], (8'hbe)}));
  always
    @(posedge clk) begin
      reg10 <= wire0;
    end
  assign wire11 = wire8[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= wire0;
      reg13 <= (wire0[(3'h4):(1'h0)] - (~^(~&((wire3 ?
          (8'ha1) : wire5) <<< $signed(wire6)))));
      reg14 <= (|$signed($unsigned($signed((wire6 ? (8'hb8) : (8'ha1))))));
      reg15 <= (wire4 ?
          (wire5[(1'h1):(1'h1)] ?
              $unsigned({(reg13 ?
                      wire3 : wire9)}) : (&wire6[(1'h1):(1'h0)])) : {(&wire6[(2'h3):(2'h3)]),
              $signed(reg14[(5'h13):(3'h6)])});
      reg16 <= (((wire8 ~^ reg13) ?
          wire8[(3'h7):(3'h6)] : $unsigned((!((7'h44) ?
              wire9 : wire3)))) != wire7);
    end
  assign wire17 = wire6;
endmodule
