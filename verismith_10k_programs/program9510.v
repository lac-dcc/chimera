module top
#(parameter param39 = (!(({(~|(8'ha7))} ? (((8'hbe) ? (8'ha6) : (8'ha7)) ~^ ((8'ha1) ~^ (7'h43))) : ((^(8'hbe)) > ((8'ha2) ? (8'haf) : (8'hb0)))) ? (8'haf) : (!{((8'ha8) ? (8'hb0) : (8'had)), (~^(8'had))}))), 
parameter param40 = param39)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(3'h7):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire33;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire33,
                 (1'h0)};
  assign wire5 = $signed((~&$signed(({(8'haf)} >> wire1))));
  assign wire6 = $signed(($unsigned(((~|wire4) ?
                     (8'h9d) : (~&wire3))) | (^(~|$unsigned(wire3)))));
  assign wire7 = $unsigned((wire5 ?
                     {($unsigned(wire4) ?
                             (wire5 ? (8'hb3) : wire1) : (~|wire5)),
                         $signed($signed(wire5))} : ($unsigned(wire2[(4'hf):(4'h9)]) ?
                         wire1[(2'h2):(2'h2)] : $unsigned((wire3 <<< wire3)))));
  assign wire8 = (-(wire0[(1'h0):(1'h0)] - $unsigned((~^$unsigned(wire3)))));
  assign wire9 = (^(wire8[(3'h4):(2'h3)] ?
                     (~|($signed(wire3) ?
                         wire8 : wire3)) : wire6[(3'h5):(2'h2)]));
  assign wire10 = wire4[(3'h4):(3'h4)];
  assign wire11 = $signed((+((^$unsigned(wire0)) ?
                      $signed((wire4 <= wire6)) : wire0)));
  assign wire12 = wire8;
  module13 #() modinst34 (wire33, clk, wire6, wire12, wire0, wire7, wire8);
  assign wire35 = (((!wire6) == wire12) ?
                      $signed((($signed(wire33) | $signed(wire10)) ?
                          ((wire0 ? wire11 : (8'hb4)) ?
                              $signed(wire6) : $signed(wire5)) : wire33[(3'h6):(3'h6)])) : (|(8'hb5)));
  assign wire36 = wire6[(5'h15):(5'h12)];
  assign wire37 = wire1;
  assign wire38 = $signed(((~^$unsigned((wire7 - wire11))) || {($unsigned(wire9) >= wire33)}));
endmodule

module module13
#(parameter param32 = (({((^~(8'ha4)) + (|(7'h41)))} ~^ (((!(8'ha1)) != {(8'hb9), (7'h43)}) && {((8'haa) <<< (8'hbf))})) ? (((((8'ha9) ? (8'ha9) : (7'h43)) ? {(8'ha2), (8'hbd)} : ((8'hac) ^~ (8'ha8))) ? ({(8'ha2), (8'hb2)} ? ((7'h44) ? (8'hb8) : (8'hbf)) : ((8'ha6) ? (8'ha6) : (8'had))) : {((8'h9d) ? (7'h41) : (8'h9f)), ((8'hb2) ? (8'h9f) : (8'hbc))}) ? (((!(8'hb4)) <= ((8'h9d) > (8'ha0))) + ((!(8'ha7)) ? ((8'hb0) + (8'h9e)) : ((8'h9f) > (8'h9c)))) : ((((8'hb4) != (7'h43)) ? ((8'hb8) ? (8'haa) : (8'haf)) : (&(8'ha5))) ? (((8'had) ? (7'h44) : (8'ha1)) ^ (-(8'hb9))) : (((8'ha8) ? (7'h41) : (8'hb5)) || (-(8'ha7))))) : (((((8'hb1) ? (8'hb7) : (8'haf)) < (!(8'hb9))) ? (8'hbb) : {((8'hb8) - (8'ha1)), (^(8'ha8))}) ? ((&((8'h9d) ? (8'hb1) : (7'h44))) - (((8'hb2) ? (8'hb1) : (8'hb7)) ? ((8'hb7) > (8'hb1)) : ((8'hb1) && (8'ha2)))) : (&(!((8'hb8) ? (8'hb8) : (8'hbd)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire22;
  wire signed [(2'h3):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire19 = $unsigned($signed(((|(wire17 ?
                      wire17 : wire15)) != $signed($unsigned(wire15)))));
  assign wire20 = (&wire15[(2'h2):(2'h2)]);
  assign wire21 = wire14;
  assign wire22 = {(~wire18), (+wire21[(2'h3):(1'h0)])};
  assign wire23 = $signed({((wire18[(4'h8):(3'h7)] >= $signed(wire16)) <= (|{wire14}))});
  assign wire24 = (+(^({(wire19 + wire16)} ? wire16 : wire15)));
  assign wire25 = {$unsigned($signed(wire18)),
                      $signed((wire18 <<< ($signed(wire15) ?
                          (wire24 ? wire17 : wire16) : $signed(wire19))))};
  assign wire26 = (~^$unsigned({wire18[(3'h4):(1'h1)],
                      ((&wire20) ? {wire20} : {wire15, wire16})}));
  always
    @(posedge clk) begin
      reg27 <= ((((~|$unsigned(wire21)) ?
                  ({wire22, wire16} == (7'h44)) : wire24[(4'he):(3'h5)]) ?
              wire25 : $signed(wire17)) ?
          wire16[(3'h7):(3'h6)] : ($signed($unsigned(wire21)) >= wire15[(4'h8):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg28 <= wire23;
      reg29 <= wire23;
    end
  assign wire30 = wire19;
  assign wire31 = $signed(({(~$unsigned(wire20)),
                      ({wire21, (8'hbd)} ?
                          wire15[(3'h6):(3'h4)] : $signed(wire17))} || (~&(!$signed((8'hb2))))));
endmodule
