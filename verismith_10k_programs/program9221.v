module top
#(parameter param11 = (((~&(8'ha7)) ? (!((&(8'hb0)) ? (|(7'h41)) : (+(8'ha6)))) : (8'hae)) ? (8'hbd) : {(({(8'ha5)} || ((8'hb6) >>> (8'hbd))) >> (((7'h44) <= (7'h43)) <= (|(8'hb8))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire10, wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = $signed((~|(((^~wire3) ?
                     $signed(wire2) : (^~wire3)) ~^ $signed((-wire1)))));
  assign wire5 = (((wire2 ?
                         $signed((wire2 ?
                             (8'haf) : (8'ha3))) : (-$signed(wire4))) ?
                     {$signed(wire2)} : wire3[(5'h14):(5'h12)]) <= (~|wire2));
  always
    @(posedge clk) begin
      reg6 <= (~|$unsigned(($signed($unsigned((8'had))) | $unsigned({wire0,
          (8'ha5)}))));
      reg7 <= reg6[(3'h4):(1'h0)];
      reg8 <= $unsigned(wire5[(2'h3):(2'h2)]);
    end
  assign wire9 = ((wire4[(3'h7):(1'h1)] > ($unsigned({wire1, (8'haa)}) ?
                         wire1[(3'h4):(3'h4)] : (!(|wire4)))) ?
                     ($unsigned(((+reg7) == (8'ha1))) ?
                         {$signed({(8'hb7)})} : wire1) : wire0);
  assign wire10 = wire0;
endmodule
