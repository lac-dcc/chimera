module top
#(parameter param13 = ((!((((8'hb4) ? (8'hac) : (8'hb0)) & (&(8'hb5))) ? (-((8'hba) ? (8'hb0) : (8'hb1))) : {(!(8'hb9))})) ? (|((~((8'hb6) ? (8'hbc) : (8'h9c))) - (((8'ha4) ? (8'ha9) : (8'hbe)) != (~(8'hb1))))) : (({(8'h9c)} ? {((8'hb3) ? (8'hb4) : (8'hb8)), ((7'h44) ? (8'ha8) : (8'hbc))} : (((7'h43) ? (7'h44) : (8'ha5)) ? ((8'haf) ? (8'hb9) : (8'hb6)) : ((8'h9c) & (8'ha7)))) | ((^{(8'hb2)}) & ({(8'ha3), (7'h42)} ? ((8'hb4) ? (8'hb3) : (8'hb6)) : (|(8'h9e)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(2'h2)];
  assign wire5 = (wire2[(2'h2):(1'h0)] ^~ ((wire2[(2'h3):(2'h3)] || ({wire4} <= $unsigned(wire1))) ?
                     $signed($unsigned($unsigned(wire3))) : (($unsigned(wire4) <<< $signed((8'hbd))) ?
                         wire4 : $unsigned($unsigned(wire4)))));
  assign wire6 = (&wire1);
  assign wire7 = (8'hbe);
  assign wire8 = $signed((^wire0[(2'h2):(2'h2)]));
  assign wire9 = (+(|(-$unsigned((~wire6)))));
  assign wire10 = (wire2[(3'h6):(3'h6)] ?
                      (!wire9) : $signed($unsigned(({wire9,
                          (8'h9f)} - (~wire9)))));
  assign wire11 = $unsigned(($unsigned(wire4) ?
                      $signed(($signed(wire7) << wire6[(4'h9):(2'h3)])) : (~&wire1[(5'h14):(4'h9)])));
  assign wire12 = {wire5[(2'h3):(1'h1)]};
endmodule
