module top
#(parameter param13 = (-(({((8'hb1) <<< (8'haf)), ((8'hba) ? (8'hb1) : (8'ha4))} <<< (~^(+(8'h9d)))) ? (((~(8'hba)) << ((8'hbb) - (8'hb8))) <<< ((8'hba) ? ((8'h9e) ? (8'hb6) : (8'hb6)) : {(8'h9c), (8'hbd)})) : {(((8'hb1) + (8'hb2)) ^ (|(7'h44))), {(|(8'ha4)), ((7'h44) ? (8'ha7) : (8'hb3))}})), 
parameter param14 = ((&param13) ? ((~^(!param13)) || param13) : param13))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = ((wire4[(4'ha):(2'h2)] ~^ wire0) ?
                     $unsigned((wire4[(5'h13):(5'h11)] << ($unsigned(wire2) ?
                         (wire0 || wire0) : {wire1, wire0}))) : ((7'h41) ?
                         (($unsigned(wire1) ?
                                 $unsigned((7'h43)) : wire0[(1'h0):(1'h0)]) ?
                             wire3[(2'h2):(1'h1)] : wire0) : $signed((^(&wire1)))));
  assign wire6 = ($signed(((~{wire2,
                     wire2}) ^~ (|((8'ha1) * (8'h9f))))) == (|$signed($signed(wire5[(4'hf):(1'h1)]))));
  assign wire7 = wire6;
  assign wire8 = (!wire3[(3'h7):(2'h2)]);
  assign wire9 = (-((^~(wire8[(2'h2):(1'h0)] ~^ $signed(wire4))) != {$signed({wire4})}));
  assign wire10 = $signed({$signed({((8'hbf) < wire8)}),
                      ({$unsigned(wire2)} ?
                          wire4 : $unsigned($unsigned(wire3)))});
  assign wire11 = $signed((&(~&(7'h44))));
  assign wire12 = (^~{$unsigned($signed(((7'h42) ? wire5 : (8'h9c))))});
endmodule
