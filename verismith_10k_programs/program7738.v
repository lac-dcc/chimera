module top
#(parameter param17 = {((((-(8'h9c)) ^~ ((8'ha7) | (8'hae))) == (((8'hab) >>> (8'haf)) || ((7'h42) ? (8'ha7) : (8'hb8)))) ? ((~^{(8'had), (7'h44)}) < (&(|(8'h9e)))) : ((~^((8'ha3) ? (8'hb9) : (7'h43))) >= (|((8'hbe) - (8'h9c)))))}, 
parameter param18 = (~{(^(~^(param17 ? param17 : param17)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(3'h5):(1'h0)] wire4;
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (wire1[(4'he):(4'he)] <<< $signed($unsigned($unsigned(wire3))));
  assign wire6 = (&wire5[(2'h3):(1'h1)]);
  assign wire7 = ($signed($unsigned(((^~wire1) - $signed((8'h9e))))) + (({$unsigned(wire3),
                         (^~wire1)} * $unsigned($signed(wire2))) ?
                     wire2[(3'h7):(1'h0)] : {($unsigned(wire2) ?
                             wire2[(2'h3):(1'h1)] : wire6[(4'hb):(4'h9)])}));
  assign wire8 = $signed(wire4[(1'h1):(1'h0)]);
  assign wire9 = $unsigned(wire8);
  assign wire10 = (^~$unsigned((~wire9)));
  assign wire11 = (($signed(((~(8'hb4)) ? (^~wire10) : $signed((8'ha4)))) ?
                          $unsigned($signed((wire7 ?
                              wire4 : (8'hbd)))) : $unsigned(wire9[(4'he):(4'hb)])) ?
                      wire6 : ($signed($signed((wire8 ? wire4 : wire2))) ?
                          (wire4 ?
                              (wire4[(3'h5):(2'h2)] ?
                                  wire4[(2'h3):(2'h3)] : (wire5 ?
                                      (8'hb0) : (8'ha0))) : $unsigned((wire1 + wire9))) : (&(+wire0))));
  assign wire12 = ($unsigned(((|(~&wire3)) >>> $unsigned($signed(wire4)))) | wire6);
  assign wire13 = (~^$unsigned(wire10));
  assign wire14 = $signed(wire1);
  assign wire15 = ({wire14[(4'hd):(4'ha)],
                      $unsigned($signed($unsigned((8'ha2))))} ~^ wire13);
  assign wire16 = $unsigned(wire13);
endmodule
