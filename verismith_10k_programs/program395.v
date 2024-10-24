module top
#(parameter param15 = (((7'h44) ? ({(&(8'ha9)), (-(7'h40))} ? (((8'hb4) != (8'hb7)) ^~ ((8'ha5) ? (8'hb9) : (8'hb8))) : ((8'hb2) && ((8'hb1) > (8'hb7)))) : ((((8'had) ~^ (8'ha1)) > {(8'ha7), (8'ha2)}) != ({(8'hba), (8'hbc)} - ((7'h42) + (8'ha6))))) ? (((((8'had) ? (8'hb5) : (8'hb3)) <<< ((8'hb5) ? (8'haf) : (7'h41))) ? (^~((7'h44) != (8'had))) : (((8'hb3) || (8'hbe)) ^~ ((8'hb8) ~^ (8'hb5)))) || {(7'h42), {((8'hb0) ? (8'hb3) : (8'hae)), (^(8'ha2))}}) : (((8'had) ? {((8'hbb) ? (8'hba) : (8'ha1))} : (((8'hb5) ? (8'h9d) : (8'hb2)) ? (^(8'hbe)) : ((8'hab) ? (8'hab) : (8'hbe)))) - (~&(&((8'ha3) && (8'hb2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  assign y = {wire14,
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
  assign wire4 = ($unsigned({{(7'h41)}}) ?
                     (+(wire0 - wire2)) : ((~&(~|(8'hb8))) ?
                         wire3[(1'h1):(1'h1)] : ($signed(((7'h44) ?
                             (7'h40) : wire0)) < $signed((^wire3)))));
  assign wire5 = $unsigned($unsigned($unsigned($signed(wire3[(2'h3):(1'h1)]))));
  assign wire6 = $unsigned(wire4[(2'h3):(2'h3)]);
  assign wire7 = ({wire5[(2'h3):(2'h2)]} & $signed($signed($signed((wire0 ~^ wire2)))));
  assign wire8 = wire4;
  assign wire9 = {$signed(wire5),
                     $signed((~&($unsigned(wire3) ?
                         wire5 : (wire2 ~^ wire6))))};
  assign wire10 = wire5[(2'h3):(1'h0)];
  assign wire11 = (({wire6, $unsigned($signed(wire1))} ?
                      wire1 : $signed(wire9)) * wire3[(1'h1):(1'h1)]);
  assign wire12 = wire5[(1'h0):(1'h0)];
  assign wire13 = $unsigned((~&{wire1[(1'h1):(1'h0)]}));
  assign wire14 = (wire13[(4'hc):(1'h1)] < wire9[(2'h2):(1'h1)]);
endmodule
