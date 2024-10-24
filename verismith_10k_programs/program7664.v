module top
#(parameter param13 = ({(((-(8'hbd)) - ((8'hb6) ? (8'hb9) : (8'hbe))) ? (((8'hb2) ~^ (8'hbb)) ? ((8'ha8) ? (8'h9d) : (8'ha7)) : (!(8'hbf))) : (((8'hbd) - (8'ha5)) ? ((8'ha2) ? (7'h40) : (7'h40)) : (!(8'haf)))), {((^~(8'ha4)) ? (!(8'hb7)) : ((8'hbb) ? (8'ha7) : (8'h9d))), (8'ha9)}} && ((8'hb6) ? {(~(^~(7'h43))), ({(8'ha4)} >>> {(8'hb6), (7'h44)})} : ((&(!(8'ha8))) ? ((^~(7'h41)) ? (|(8'h9e)) : (^~(8'h9d))) : (((8'h9d) || (8'ha4)) >= (~(8'hbb)))))), 
parameter param14 = param13)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  assign y = {wire12,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = $unsigned((wire2 ?
                     $unsigned($signed((~&wire2))) : wire3[(4'h9):(3'h4)]));
  assign wire5 = wire4[(2'h2):(1'h0)];
  assign wire6 = ($signed(({wire2} ~^ wire3)) ?
                     $signed(({(wire1 || wire4), (wire3 | wire4)} ?
                         (wire2 | {wire3}) : (|(wire0 >> wire4)))) : (-((^wire4[(3'h5):(1'h1)]) & wire5)));
  assign wire7 = wire2[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg8 <= $unsigned(($unsigned($unsigned(wire0[(3'h4):(2'h3)])) <<< (($unsigned(wire6) | (!wire7)) ?
          (|$signed(wire6)) : ({wire1} ?
              wire7[(2'h2):(1'h1)] : (wire2 ? wire7 : (8'hba))))));
      reg9 <= wire0;
    end
  always
    @(posedge clk) begin
      reg10 <= $unsigned((!{$unsigned($signed((8'ha4))), wire4}));
      reg11 <= $signed((~wire6));
    end
  assign wire12 = $signed(((|$signed($signed(wire5))) ~^ (wire2 ?
                      (^~wire5) : $unsigned((wire1 << reg8)))));
endmodule
