module top
#(parameter param16 = (((^(((8'hb2) ? (8'h9c) : (8'hb9)) >>> ((8'ha6) ? (8'h9c) : (8'ha9)))) != ((8'ha8) ^ {((8'hba) ? (8'ha5) : (8'ha3))})) ? {{(((8'hbe) ? (8'had) : (8'ha3)) >= ((8'hbe) ? (8'hae) : (7'h43)))}, ((~|(^(8'h9d))) > (^{(8'hb7)}))} : ((7'h40) ? (^((~^(8'ha0)) ? ((8'haa) ? (8'hb1) : (8'hbf)) : ((7'h41) ? (8'hb5) : (7'h44)))) : ((((8'ha9) != (8'hb4)) <<< (8'haa)) && {(-(8'h9f)), ((8'hb7) ^ (8'hb8))}))), 
parameter param17 = (&({((param16 <= param16) - param16), {(param16 || param16), (param16 ? param16 : param16)}} >= ((param16 ? {(8'ha1)} : (8'ha1)) ? ((8'hb5) ? param16 : param16) : (8'ha5)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  assign y = {wire15,
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
                 (1'h0)};
  assign wire5 = (^~($unsigned(wire2[(4'hc):(1'h1)]) ?
                     wire1 : (((wire3 ? wire0 : (8'hab)) ?
                         (wire0 ? wire0 : wire3) : wire3) * (wire2 ?
                         ((8'ha1) ? wire2 : wire4) : (8'hb6)))));
  assign wire6 = ({(^wire1[(4'h8):(2'h3)]),
                         (|$signed(((7'h40) ? wire3 : wire5)))} ?
                     {wire2} : (~|$signed($unsigned($unsigned(wire0)))));
  assign wire7 = {$signed($signed((^~wire6[(2'h3):(2'h3)])))};
  assign wire8 = ((7'h40) >= $unsigned(wire3[(1'h1):(1'h1)]));
  assign wire9 = $unsigned(wire3[(3'h5):(3'h4)]);
  assign wire10 = (wire6 ?
                      $unsigned((wire9[(4'ha):(3'h7)] ?
                          $signed({wire4,
                              wire4}) : $unsigned((&wire6)))) : (-(-wire0)));
  assign wire11 = wire4[(1'h1):(1'h1)];
  assign wire12 = (wire8 ?
                      (-({wire5, (~wire0)} ?
                          {wire11} : ({wire7,
                              wire7} - $signed(wire0)))) : $unsigned(wire3[(3'h4):(2'h2)]));
  assign wire13 = (wire11 ?
                      {(({wire7,
                              wire3} > wire2[(4'hf):(1'h1)]) >> ((^wire2) || wire0[(4'hd):(2'h2)]))} : $unsigned($unsigned($unsigned(wire2))));
  assign wire14 = wire11;
  assign wire15 = (wire5[(2'h2):(1'h0)] >= (+wire2[(1'h0):(1'h0)]));
endmodule
