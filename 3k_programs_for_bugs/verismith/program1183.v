module top
#(parameter param25 = ({(((~(8'hab)) ? {(7'h43)} : (7'h44)) ^ (-((8'hb2) ? (8'hb5) : (8'hbb)))), (({(8'hba)} * {(8'h9f), (8'hba)}) || ((^(8'hb1)) ? {(8'haa), (8'ha2)} : ((8'ha1) ? (8'ha5) : (8'h9e))))} >> (((!((8'ha1) + (8'hb3))) ? ((|(8'ha2)) ~^ ((8'h9f) < (8'hab))) : (^((8'ha6) <<< (8'h9d)))) - ((8'hbb) ^ ((~(8'hb0)) ? {(8'hb5)} : ((8'hab) || (8'ha8)))))), 
parameter param26 = (param25 ? (((~(~|param25)) <<< (-(-param25))) ^~ (-(~&(param25 ? param25 : param25)))) : (((!(param25 ? param25 : param25)) ? param25 : ((param25 <<< param25) != (8'hb3))) << param25)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire18,
                 wire6,
                 wire5,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire4 = ((!$signed((wire3 ?
                     wire0 : $unsigned(wire3)))) * ((~^wire1[(1'h1):(1'h0)]) ?
                     wire3 : {(~$signed(wire2))}));
  assign wire5 = (wire3 >>> (wire4[(3'h6):(3'h5)] ?
                     wire1[(5'h11):(1'h0)] : (($unsigned(wire4) ?
                         $signed(wire0) : wire2) - ((&wire4) ?
                         $unsigned((8'hb2)) : (wire2 <= wire1)))));
  assign wire6 = $signed(wire3[(5'h11):(4'h9)]);
  module7 #() modinst19 (wire18, clk, wire2, wire6, wire3, wire5);
  always
    @(posedge clk) begin
      reg20 <= ($signed($unsigned($signed(wire4))) || ({{((8'hab) ?
                  wire3 : wire1)},
          (&$unsigned(wire3))} >= wire4));
      reg21 <= $signed((8'ha9));
      reg22 <= $signed((8'hb1));
    end
  assign wire23 = $unsigned(({{reg22, wire4},
                      $unsigned((8'ha6))} < wire0[(2'h2):(1'h1)]));
  assign wire24 = wire23[(1'h0):(1'h0)];
endmodule

module module7
#(parameter param17 = {{((&(+(8'hbe))) ? (((8'ha4) >> (8'ha9)) && {(7'h41)}) : (+{(7'h41), (8'hbf)}))}})
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  assign y = {wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = wire10;
  assign wire13 = (((wire9[(1'h0):(1'h0)] ?
                      ({wire8, (8'hb4)} ?
                          wire11[(3'h7):(3'h5)] : wire9[(5'h10):(4'h9)]) : (^~wire12[(1'h0):(1'h0)])) >> $signed((&(~^wire12)))) && (^~wire9));
  assign wire14 = wire11[(3'h4):(3'h4)];
  assign wire15 = ((~|$unsigned(wire12)) ?
                      (((^~wire12[(1'h1):(1'h0)]) ?
                              $unsigned({wire14}) : wire10) ?
                          wire10 : (^(wire8[(3'h4):(1'h0)] ?
                              $unsigned(wire10) : (wire14 ?
                                  wire13 : wire9)))) : $unsigned((~|$signed((+wire11)))));
  assign wire16 = ((((wire8 && (wire15 | wire10)) ?
                          (wire12 >= wire9[(4'hc):(3'h7)]) : $signed((wire8 ?
                              wire10 : (8'hb3)))) ~^ ($unsigned((~^wire8)) ?
                          ((8'ha2) ^~ wire11) : (!$signed(wire8)))) ?
                      (~&wire11) : (($unsigned($unsigned((8'hbd))) ?
                          $unsigned(wire13[(1'h1):(1'h1)]) : ({wire14,
                              (8'ha2)} << (wire11 ?
                              (7'h42) : wire15))) * wire10));
endmodule
