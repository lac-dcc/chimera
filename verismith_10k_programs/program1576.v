module top
#(parameter param14 = (((-(!((7'h41) ? (8'hbc) : (8'hb2)))) ? ((8'hb0) ? ((^(8'had)) ? ((7'h44) ? (8'ha6) : (8'ha9)) : (^~(8'hba))) : (7'h40)) : (({(8'hb2)} == (~^(8'hb6))) ? ((~(8'hb3)) <<< (-(8'hb5))) : ({(8'hb1)} ? ((8'hb9) ? (8'ha0) : (8'hbb)) : {(8'hbd)}))) ? ((((8'hab) ? {(8'hac), (8'hbe)} : ((8'hb0) ? (8'haa) : (8'ha9))) + (((8'hbd) ? (7'h42) : (8'h9e)) ^~ (-(8'hb2)))) ? (&(((8'hae) ? (8'ha0) : (8'hbf)) ? ((8'hb6) >= (8'ha7)) : ((8'hb9) != (8'hb2)))) : ((((7'h41) ? (8'ha4) : (8'hb6)) == ((8'hbf) ? (8'ha7) : (8'hb8))) || (((8'hb5) ? (7'h42) : (8'hb1)) ^ ((8'ha9) ? (8'ha3) : (7'h40))))) : ((+(((8'hb0) ? (8'hb9) : (8'hbf)) ? ((8'ha0) << (7'h43)) : (~^(8'ha1)))) + ((~^((7'h42) - (8'had))) && (|((8'ha8) ? (8'hae) : (8'hb1)))))), 
parameter param15 = (((param14 ? (^(param14 ? param14 : param14)) : (8'h9c)) > (~|param14)) ? (!(~|((param14 < param14) < (param14 + param14)))) : (param14 ~^ param14)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = (~|wire1);
  assign wire7 = wire1[(3'h4):(1'h0)];
  assign wire8 = $unsigned(($signed({(^wire1)}) ~^ {$signed($signed(wire3))}));
  assign wire9 = (~wire5);
  assign wire10 = (wire6[(1'h1):(1'h0)] ?
                      $unsigned(($signed((wire4 || wire1)) ?
                          $unsigned($signed((8'ha0))) : $unsigned((8'had)))) : $unsigned(wire7));
  assign wire11 = ($unsigned({$signed(wire5[(3'h4):(1'h1)])}) == wire5[(1'h1):(1'h1)]);
  assign wire12 = wire2;
  assign wire13 = $signed((wire5 ~^ (~&((wire0 ? (8'hb4) : wire2) ?
                      (wire8 ? wire11 : (8'h9f)) : (wire9 ?
                          wire11 : (8'ha5))))));
endmodule
