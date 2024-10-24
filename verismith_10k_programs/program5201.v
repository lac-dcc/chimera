module top
#(parameter param52 = ((((~^((8'hb0) ? (8'hbf) : (8'hb6))) || (((8'ha6) >> (8'had)) ? (^~(8'haa)) : (~(8'ha2)))) == ((~^((8'ha8) || (8'had))) ? (((8'hb6) ? (8'ha0) : (8'ha7)) && (~&(8'ha4))) : (((8'hb2) <<< (8'h9f)) >= (8'haa)))) ? (((((7'h43) ? (8'ha2) : (8'hb0)) > ((7'h41) * (7'h44))) >= {(~&(7'h42)), {(7'h40)}}) && (!(&(^(8'hbc))))) : ((((!(8'hb7)) ? ((8'ha4) ? (8'hab) : (8'h9d)) : (&(8'hbd))) ? ((8'hb4) ? ((8'hbe) ? (8'hb0) : (8'hb6)) : (-(8'ha4))) : (((8'haf) ~^ (8'hb7)) == (~&(8'hbb)))) >= (8'ha9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire2[(1'h1):(1'h1)];
  assign wire5 = ({wire2} ?
                     $signed(wire1[(5'h10):(2'h2)]) : ((wire0 && $signed({wire4,
                             wire4})) ?
                         ((|(&wire4)) ?
                             wire0 : $unsigned($signed(wire0))) : (^~wire1[(4'hb):(3'h4)])));
  assign wire6 = $signed((^(+$unsigned(wire0))));
  assign wire7 = ($unsigned(wire5) >>> wire4);
  assign wire8 = wire7[(1'h1):(1'h0)];
  assign wire9 = wire4;
  module10 #() modinst48 (.wire13(wire5), .wire11(wire2), .wire12(wire0), .wire14(wire4), .clk(clk), .y(wire47));
  assign wire49 = wire8;
  assign wire50 = $signed($signed(wire49[(3'h4):(1'h0)]));
  assign wire51 = wire49;
endmodule

module module10
#(parameter param45 = (((((~^(8'ha7)) ~^ (^(8'h9e))) ? (((8'h9e) ? (7'h42) : (8'ha4)) + ((8'ha6) != (8'hb9))) : {{(8'hb0), (8'ha8)}, ((8'h9e) ? (8'hb8) : (7'h42))}) * ((((8'h9f) ? (7'h40) : (8'h9f)) * ((8'had) <= (8'h9d))) ? (((8'h9f) || (8'hb1)) ? ((8'hb4) ? (8'ha7) : (8'hb6)) : ((8'hb5) ? (8'hac) : (8'hb2))) : (7'h42))) ~^ (((((7'h42) < (8'haf)) >>> ((8'ha1) || (8'hb5))) << ({(8'ha1)} ? {(8'hac)} : ((8'hba) || (8'hb3)))) ? (!(((8'hb4) ? (8'hbf) : (8'ha3)) ? (7'h40) : ((8'hb2) ? (8'had) : (8'h9f)))) : (8'ha0))), 
parameter param46 = (|({({param45} ? (|param45) : (param45 ? param45 : param45))} ? param45 : (~|param45))))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire38;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire38,
                 (1'h0)};
  assign wire15 = wire11[(3'h5):(1'h0)];
  assign wire16 = {wire15,
                      {((7'h44) >> wire13[(4'hf):(4'hf)]),
                          (wire14 - (|(wire13 >= wire13)))}};
  assign wire17 = wire12;
  assign wire18 = {(^$unsigned(wire14[(3'h6):(3'h6)]))};
  assign wire19 = (-((~|$signed(((8'hbe) ? wire15 : wire17))) ?
                      (wire12 ? wire15 : wire14) : wire16));
  module20 #() modinst39 (wire38, clk, wire11, wire12, wire17, wire13, wire16);
  assign wire40 = $signed(($signed(wire17) * wire16[(4'ha):(3'h4)]));
  assign wire41 = ((~^wire14[(2'h3):(1'h1)]) || wire15[(4'hd):(3'h6)]);
  assign wire42 = wire38;
  assign wire43 = ($unsigned($signed($unsigned($unsigned(wire15)))) + $signed(wire13[(4'hd):(1'h0)]));
  assign wire44 = (+$unsigned(wire42[(3'h7):(2'h3)]));
endmodule

module module20
#(parameter param36 = ((-({(8'hb0)} ? (+(~&(8'hb0))) : (^~(+(8'hbb))))) ? ((^({(8'hb0), (8'haf)} <= {(8'hac), (8'hb8)})) | ((((8'hb8) << (8'ha3)) ? (^(8'hbc)) : ((8'ha6) ? (8'ha5) : (8'hbc))) <<< (|(^~(8'ha5))))) : (~^(((&(8'hbd)) ? ((8'hbb) ? (8'ha0) : (8'ha8)) : ((8'ha1) < (8'hb7))) ? ((~(8'ha3)) ? {(8'h9c)} : ((8'hae) ? (8'hae) : (8'h9f))) : (7'h40)))), 
parameter param37 = (~|((8'haf) ? ((param36 ? (8'hae) : ((8'hb2) < (8'haf))) ? {{param36}, param36} : param36) : (((param36 | param36) & param36) ? param36 : {(+(8'ha2)), param36}))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  input wire signed [(3'h5):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire26;
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire26 = $signed((wire25 ^ (wire24[(3'h5):(1'h0)] >> (wire24[(3'h5):(3'h4)] != {wire22}))));
  always
    @(posedge clk) begin
      reg27 <= wire21[(1'h0):(1'h0)];
      reg28 <= $signed({reg27, (8'hbb)});
      reg29 <= wire25;
      reg30 <= {(wire25 ^ $signed(wire26)),
          ((-(~|(-wire26))) <= wire23[(2'h2):(2'h2)])};
      reg31 <= $signed($signed(({(wire21 ? wire21 : wire23)} ?
          $signed(reg30[(4'hf):(3'h4)]) : $unsigned($unsigned((8'h9d))))));
    end
  assign wire32 = wire23[(2'h2):(2'h2)];
  assign wire33 = wire23[(1'h0):(1'h0)];
  assign wire34 = {$unsigned($signed($signed((reg30 ^~ reg28)))),
                      ($unsigned((^~(reg29 >> reg28))) + wire25[(4'he):(4'h9)])};
  assign wire35 = (&reg29);
endmodule
