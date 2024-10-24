module top
#(parameter param40 = (8'h9f), 
parameter param41 = {(((((8'hae) & param40) ? (8'ha8) : param40) ? (|param40) : (param40 <= param40)) <= (param40 != {(param40 + param40), ((8'had) ? param40 : param40)}))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire32;
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire32,
                 (1'h0)};
  assign wire4 = (8'had);
  assign wire5 = wire4;
  assign wire6 = (~|$unsigned((((^~wire2) ?
                         (wire4 ? wire3 : wire4) : (wire4 | wire0)) ?
                     wire0 : {(wire2 ? wire1 : wire3), wire5[(4'hf):(1'h1)]})));
  assign wire7 = wire4;
  assign wire8 = $signed(((&(wire0 ^~ wire0[(4'h9):(2'h3)])) >= (((wire6 ?
                         (8'had) : wire0) <<< {wire7, wire5}) ?
                     wire4 : wire4)));
  assign wire9 = $signed($signed(wire4));
  assign wire10 = wire4;
  assign wire11 = $signed(wire8[(2'h3):(1'h1)]);
  assign wire12 = (wire11[(3'h7):(2'h2)] < $unsigned((~|(!$signed((8'hb4))))));
  assign wire13 = ($signed(wire9[(4'hf):(4'h9)]) && wire9[(2'h3):(1'h0)]);
  assign wire14 = ($signed({(wire4 ^ wire13[(3'h7):(3'h7)]), wire3}) > (8'h9d));
  assign wire15 = wire0[(2'h3):(1'h1)];
  assign wire16 = {wire14,
                      ((+(wire10 ?
                          (wire6 ?
                              wire0 : wire9) : (wire2 & wire8))) ~^ $unsigned($unsigned((wire15 ?
                          wire13 : wire1))))};
  assign wire17 = wire13[(4'he):(3'h5)];
  assign wire18 = ($signed((wire14 ?
                      ((wire8 ? wire8 : wire16) ?
                          (&wire12) : wire14) : wire7)) > wire12[(2'h2):(1'h0)]);
  assign wire19 = (|wire5);
  module20 #() modinst33 (wire32, clk, wire14, wire9, wire11, wire2, wire1);
  assign wire34 = ($unsigned((^(^~wire18[(2'h3):(2'h2)]))) ?
                      $unsigned(((~&wire2) ?
                          ((wire17 ? wire6 : (7'h41)) ^ (wire14 ?
                              wire19 : wire19)) : (7'h44))) : $signed(wire12));
  assign wire35 = ({(wire14 >> {wire3[(5'h15):(5'h15)]}),
                          $signed((~|$signed((8'haa))))} ?
                      wire7[(3'h7):(3'h7)] : $signed(wire5));
  assign wire36 = wire2;
  assign wire37 = (^~(wire12 - wire34[(4'h8):(4'h8)]));
  assign wire38 = wire13;
  assign wire39 = wire14[(4'hd):(4'hc)];
endmodule

module module20
#(parameter param30 = {(((((8'hb5) ^ (8'hb9)) ? ((7'h44) + (8'hb0)) : (-(8'hba))) ? ({(8'hb8), (8'hb7)} ^ (!(8'ha5))) : ((~&(8'hb9)) > (~&(8'hb8)))) ? (((~|(8'hb9)) ~^ {(8'hb4), (8'ha0)}) ? (|((8'h9c) || (7'h42))) : ((~|(8'hbc)) ? {(8'hb1), (8'haf)} : ((8'hab) && (8'hbd)))) : ({(~(8'ha3)), ((8'hb1) ? (8'hbb) : (8'haa))} ? (((8'hb1) ? (8'hbf) : (8'hab)) + ((7'h43) ? (8'hae) : (8'hb3))) : {((8'haa) ? (8'hae) : (8'hb9)), ((8'hb5) ? (8'ha1) : (7'h43))}))}, 
parameter param31 = (8'hb7))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire24;
  input wire [(3'h4):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  assign y = {wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = ({(wire22[(2'h2):(1'h1)] + wire21[(2'h3):(1'h0)]),
                          $signed((wire21[(4'hc):(4'hc)] ?
                              $unsigned(wire24) : {wire23}))} ?
                      $unsigned({($unsigned(wire23) ^~ wire24),
                          ({wire22, wire22} ?
                              (^(8'hba)) : wire24[(3'h6):(3'h6)])}) : $unsigned(wire24));
  assign wire27 = $signed(wire21[(5'h12):(4'hc)]);
  assign wire28 = wire21[(3'h6):(3'h6)];
  assign wire29 = wire24[(4'h9):(4'h9)];
endmodule
