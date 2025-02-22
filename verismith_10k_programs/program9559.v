module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire10, wire7, wire6, wire5, wire4, reg9, reg8, (1'h0)};
  assign wire4 = ($signed($signed((^~wire0[(2'h3):(2'h3)]))) ^ {$signed(((wire2 - (8'hb1)) ?
                         $unsigned(wire3) : (wire3 ? wire3 : wire1))),
                     $signed((~|$unsigned(wire2)))});
  assign wire5 = ($signed((~{wire3, (+wire2)})) || wire4);
  assign wire6 = ($unsigned($unsigned($signed((wire0 ? wire2 : wire4)))) ?
                     wire3 : (wire5 ?
                         $unsigned($unsigned(wire5[(2'h3):(2'h2)])) : (~&(!$unsigned(wire1)))));
  assign wire7 = ({wire0[(3'h4):(1'h1)], $signed({(^~wire0), (|wire4)})} ?
                     $unsigned(($unsigned($signed(wire2)) == (wire4 ?
                         $unsigned(wire6) : (&wire0)))) : {({wire3[(2'h2):(2'h2)],
                             (wire1 ?
                                 wire5 : (8'hbd))} ~^ $unsigned((^wire0)))});
  always
    @(posedge clk) begin
      reg8 <= wire1;
      reg9 <= wire5[(4'h9):(2'h2)];
    end
  assign wire10 = $unsigned($signed((^$unsigned($signed(wire3)))));
endmodule
