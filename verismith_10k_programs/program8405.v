module top
#(parameter param41 = (|((!(-((7'h42) >= (8'hbc)))) & (((^(8'haa)) ? (~&(8'h9f)) : (|(8'h9d))) ? ((8'hba) ? ((7'h40) | (7'h44)) : {(8'hb1), (8'hae)}) : {((8'ha4) == (8'hbb)), ((8'ha6) ? (8'hbe) : (8'hb1))}))), 
parameter param42 = (|((^~param41) ? (param41 ? (~^(param41 ? (8'hab) : param41)) : ((param41 << (8'ha3)) ? {param41, param41} : ((8'hbe) * (8'h9c)))) : param41)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire13,
                 wire12,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire5 = (~|(~^(((wire0 > wire2) ?
                         (wire3 ^ wire2) : wire4[(1'h0):(1'h0)]) ?
                     wire0 : ((wire4 && wire3) != (wire1 + wire0)))));
  assign wire6 = ($unsigned($unsigned(wire4[(3'h4):(2'h3)])) * (^~(({(8'ha6)} ?
                     wire0 : (wire4 ? wire3 : wire1)) ^~ (~|$signed(wire4)))));
  assign wire7 = wire4[(3'h4):(3'h4)];
  assign wire8 = $unsigned(wire6[(4'h9):(3'h6)]);
  always
    @(posedge clk) begin
      reg9 <= {$signed(wire7[(2'h3):(2'h3)])};
      reg10 <= {(^~wire5[(4'hc):(3'h6)])};
      reg11 <= {($signed($unsigned(wire5[(4'he):(4'hb)])) <<< wire1), wire8};
    end
  assign wire12 = ($unsigned(wire2) ?
                      $signed((~($signed(wire6) | $signed((8'hb3))))) : wire8[(1'h1):(1'h1)]);
  assign wire13 = $signed((8'h9c));
  module14 #() modinst28 (wire27, clk, wire6, reg9, wire8, wire0, wire1);
  assign wire29 = (($signed({wire4}) + wire6[(3'h5):(2'h3)]) < wire5[(3'h7):(3'h4)]);
  assign wire30 = $signed($unsigned((reg9 == $unsigned(wire3))));
  assign wire31 = ((($signed(wire0) ?
                              $signed($unsigned(reg10)) : ({(8'hb3),
                                  wire29} + (reg10 ? wire29 : wire5))) ?
                          {{$signed(wire8),
                                  (!wire1)}} : $signed(((wire30 || reg10) ?
                              $signed(wire13) : reg9[(4'hc):(3'h7)]))) ?
                      ((8'hb0) | wire3) : $signed((&wire8[(3'h4):(2'h2)])));
  assign wire32 = {wire3};
  assign wire33 = wire27[(4'h8):(3'h4)];
  assign wire34 = ({(!wire30), wire0} >= wire4);
  assign wire35 = (((($unsigned((7'h43)) >= ((8'hbd) ?
                              wire4 : reg9)) - ($unsigned(wire34) == ((8'h9f) ?
                              wire27 : reg10))) ?
                          (($unsigned(wire30) ?
                              (-wire33) : reg10[(2'h3):(2'h3)]) ^ (~^(wire32 ?
                              wire29 : (8'ha7)))) : $signed(wire27)) ?
                      $unsigned(($signed($signed(wire34)) - (wire31 ?
                          $signed(wire31) : $unsigned(wire13)))) : ($unsigned(wire8) <<< ($signed((wire27 >= wire1)) ?
                          {(reg9 | wire8)} : $signed((8'hab)))));
  assign wire36 = wire7[(4'h9):(4'h8)];
  assign wire37 = wire32;
  assign wire38 = $unsigned(wire1[(2'h3):(1'h1)]);
  assign wire39 = $unsigned((wire1 ? wire27 : wire30));
  assign wire40 = wire7[(3'h5):(3'h5)];
endmodule

module module14
#(parameter param25 = ((~^((&(7'h42)) ? ((-(8'hab)) ? ((8'ha8) <<< (7'h41)) : {(8'ha4)}) : (~&((8'ha6) >= (8'h9f))))) ? (+((((8'hb9) <= (8'haf)) == (8'hb7)) ? {(&(8'hb7)), (|(8'ha4))} : (8'hb7))) : (&((((8'hae) & (8'h9d)) ? ((8'hbb) >= (8'h9f)) : (~|(8'ha8))) < (~|(&(8'had)))))), 
parameter param26 = (({(!(!param25))} * {param25, ((param25 || param25) ? {param25} : ((8'h9f) ? param25 : param25))}) != (~&(((+(8'hbb)) >= (~&param25)) >>> (+(param25 ? param25 : param25))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  assign y = {wire24, wire23, wire22, wire21, wire20, (1'h0)};
  assign wire20 = wire15[(1'h1):(1'h0)];
  assign wire21 = wire20;
  assign wire22 = $unsigned(((&wire20[(2'h3):(1'h0)]) > (8'hb6)));
  assign wire23 = $unsigned(wire18);
  assign wire24 = wire17[(3'h4):(1'h1)];
endmodule
