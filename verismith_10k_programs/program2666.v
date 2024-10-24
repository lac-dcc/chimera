module top
#(parameter param14 = (~^{(&(~|(~&(8'hba)))), ((|((8'h9e) ? (8'hac) : (8'hb2))) & ((^(8'hb2)) & ((8'hb6) ^~ (8'hbe))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(2'h2):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 (1'h0)};
  assign wire4 = (~|(+(^($unsigned(wire1) ? (8'ha6) : wire2[(4'h9):(3'h5)]))));
  assign wire5 = wire3[(4'he):(4'h8)];
  assign wire6 = (+((&$unsigned((wire4 ?
                     wire2 : wire3))) ~^ wire1[(2'h3):(2'h3)]));
  assign wire7 = (wire3 || $signed(($unsigned((8'hbf)) ?
                     (wire5 >> (8'hbd)) : (~(wire2 ? (8'hac) : wire1)))));
  always
    @(posedge clk) begin
      reg8 <= $signed(((^~wire2[(2'h2):(1'h1)]) ?
          wire1[(2'h2):(1'h1)] : $signed($signed(wire3))));
    end
  assign wire9 = (((wire0 ?
                         wire6 : ((^~reg8) ?
                             (wire4 ?
                                 wire2 : wire0) : wire4[(3'h7):(1'h0)])) == ($unsigned((wire5 >>> (7'h44))) * ({wire3,
                             reg8} ?
                         ((8'hac) ? wire6 : reg8) : $signed(wire0)))) ?
                     ({$unsigned({wire2})} ?
                         $signed(((~reg8) ?
                             (wire6 >>> wire0) : $unsigned(wire0))) : (^~reg8)) : wire4[(1'h1):(1'h0)]);
  assign wire10 = (($unsigned(wire5[(3'h5):(2'h3)]) || (~&($signed(wire7) ^~ (^wire7)))) ?
                      {wire5[(2'h3):(1'h0)]} : ((wire5 ?
                              ((wire9 || wire4) ?
                                  $unsigned(wire3) : $signed(wire3)) : {$signed((8'hb0)),
                                  $signed(wire5)}) ?
                          ({(!(8'ha2)), wire6} ?
                              (|$unsigned(reg8)) : wire6[(1'h0):(1'h0)]) : {((-wire3) ^ wire1)}));
  assign wire11 = ((wire4 ?
                      ($unsigned(wire3) - $signed((wire7 ?
                          wire3 : (8'hb3)))) : wire5[(3'h4):(2'h3)]) & $signed($unsigned(wire9)));
  assign wire12 = ({wire3,
                      ({wire7, wire7} != ((wire3 ?
                          (8'ha3) : (8'h9f)) >> wire10[(3'h4):(2'h3)]))} != $signed({$unsigned($signed(wire4)),
                      wire7[(4'he):(2'h3)]}));
  assign wire13 = (~wire5);
endmodule
