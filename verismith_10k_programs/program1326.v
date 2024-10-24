module top
#(parameter param30 = ((^~(-{((8'haa) && (8'ha2))})) << (((((7'h40) ? (8'haf) : (8'hb5)) + ((8'hb8) << (8'ha2))) ^ (|((8'haa) ? (7'h40) : (8'h9f)))) ? {((~^(8'hb4)) ? {(8'hb5), (8'ha4)} : (~&(8'hbe))), (&(^~(7'h44)))} : ({(!(7'h40))} * (&(+(8'hb6)))))), 
parameter param31 = (param30 ? {(~|param30)} : param30))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire29, wire27, wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = wire3[(1'h1):(1'h1)];
  assign wire5 = ((|($unsigned({wire3, wire0}) ?
                         (~|wire0[(4'h8):(4'h8)]) : {$unsigned(wire2)})) ?
                     wire4[(4'hb):(4'ha)] : $signed($signed({{(8'haf)}})));
  assign wire6 = ($signed(((wire1[(4'hb):(2'h3)] ? (^wire4) : $signed(wire2)) ?
                     (8'hac) : (7'h42))) <= (wire4 ?
                     $unsigned($signed((~^wire1))) : $signed($unsigned($signed(wire0)))));
  always
    @(posedge clk) begin
      reg7 <= {({($signed(wire3) ? (~&wire6) : {wire6})} - (^~((wire4 ?
              (8'ha7) : wire0) | wire4[(3'h7):(2'h3)]))),
          wire5[(4'h8):(2'h3)]};
    end
  module8 #() modinst28 (.wire12(wire6), .clk(clk), .wire10(reg7), .y(wire27), .wire13(wire4), .wire9(wire3), .wire11(wire5));
  assign wire29 = (^~(+((^wire4[(3'h6):(2'h3)]) ?
                      wire2[(4'h8):(1'h0)] : (wire2 <= $unsigned(wire4)))));
endmodule

module module8
#(parameter param25 = ((^~(~&(&((8'hb1) ? (8'ha8) : (7'h43))))) - (|(({(7'h40), (8'hb0)} ? (8'hba) : {(8'hb7)}) >>> (((8'h9c) ? (8'hac) : (8'hb2)) >>> ((7'h43) ? (8'ha1) : (8'hab)))))), 
parameter param26 = (~|(((~^(^~param25)) ? {(param25 < param25)} : param25) ? param25 : (8'hb8))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire16,
                 wire15,
                 wire14,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = ((~&{(8'hb3)}) && $signed($signed($unsigned($signed((7'h43))))));
  assign wire15 = (wire13 ?
                      wire10[(3'h5):(1'h1)] : $unsigned($signed(({wire14} << wire9[(3'h7):(3'h6)]))));
  assign wire16 = wire14[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= wire14;
      reg18 <= $signed(wire16[(2'h3):(2'h2)]);
      reg19 <= ($signed($unsigned({wire16[(3'h7):(2'h2)]})) && $unsigned(wire10[(3'h5):(3'h4)]));
      reg20 <= ($signed($unsigned(((~^wire15) ?
              reg17 : wire16[(1'h1):(1'h1)]))) ?
          $unsigned($unsigned((~(|(8'hb5))))) : (&reg17));
      reg21 <= $signed($signed((^~(wire13 ?
          $signed(wire12) : {(8'hb6), (8'h9c)}))));
    end
  assign wire22 = {((reg19[(4'h9):(3'h4)] + (reg17 >> (wire16 ?
                          wire15 : reg19))) < $signed($signed($signed(wire15)))),
                      wire12};
  assign wire23 = {(+(^~reg21[(2'h2):(1'h1)]))};
  assign wire24 = ($unsigned((reg19[(2'h2):(1'h0)] ?
                      $signed((+reg21)) : reg17)) == reg21[(1'h0):(1'h0)]);
endmodule
