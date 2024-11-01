module top
#(parameter param42 = ((((((8'ha4) ? (8'hb3) : (8'ha2)) != (~|(8'hb1))) ? (-(~(8'h9e))) : (!((8'had) ? (8'ha2) : (8'hb5)))) ~^ (~(((8'haf) ? (8'hb1) : (7'h42)) ? ((8'hbc) ? (8'hb5) : (8'hb6)) : ((8'hbd) ? (8'hab) : (8'haf))))) << (!((((8'hb2) < (8'hba)) || ((8'ha3) ? (7'h42) : (7'h44))) ? ((-(8'ha2)) ? ((8'hab) ? (8'ha3) : (8'hbc)) : ((8'hb5) ? (8'ha7) : (8'h9c))) : (((8'ha3) >= (8'h9f)) ~^ (&(8'hae)))))), 
parameter param43 = (~((param42 | (~&(+param42))) ? (8'h9e) : {(-(param42 ~^ param42))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire40;
  assign y = {wire5, wire6, wire7, wire40, (1'h0)};
  assign wire5 = ((-(^(~|{wire3}))) >> $unsigned((~|$unsigned({wire4}))));
  assign wire6 = $unsigned({wire5[(1'h1):(1'h1)], wire1[(4'he):(4'h9)]});
  assign wire7 = (wire1[(5'h14):(5'h12)] ?
                     ((((wire0 ? wire0 : wire6) >> ((8'ha2) ?
                             wire0 : wire0)) * ({(8'ha5)} | $unsigned(wire1))) ?
                         (^~(-wire3)) : $signed(wire4)) : (~&wire2));
  module8 #() modinst41 (wire40, clk, wire2, wire6, wire7, wire0, wire5);
endmodule

module module8
#(parameter param39 = (!((-(((8'h9f) || (8'hb3)) ? (8'hb1) : {(8'ha3)})) >= ((((8'hb5) == (8'ha2)) > (!(8'hb5))) | {(-(8'ha2)), ((8'hb9) ? (8'ha1) : (8'hb0))}))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire11;
  input wire [(5'h15):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire33;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire33,
                 (1'h0)};
  assign wire14 = wire13;
  assign wire15 = (wire14 >>> ((wire11[(2'h2):(1'h0)] * $unsigned((^~(8'hb3)))) ?
                      (((wire14 + wire9) ~^ $signed((8'h9f))) ^~ (~|$signed(wire13))) : (wire12[(4'hf):(4'hc)] <<< wire10[(4'hb):(4'h9)])));
  assign wire16 = {(~(|wire14))};
  assign wire17 = $unsigned($signed(wire11));
  assign wire18 = (~&$unsigned({wire14[(3'h5):(1'h0)]}));
  assign wire19 = (~^$signed(wire15));
  module20 #() modinst34 (.y(wire33), .wire23(wire13), .wire21(wire14), .wire25(wire15), .wire22(wire19), .clk(clk), .wire24(wire16));
  assign wire35 = (^(wire16[(2'h3):(1'h1)] ?
                      (8'hbc) : $unsigned($unsigned((wire33 << wire17)))));
  assign wire36 = $signed(({$unsigned(wire15)} ?
                      (((^~wire10) ? $unsigned(wire10) : (!(8'hae))) ?
                          (wire15[(4'hc):(4'ha)] != $unsigned(wire19)) : wire14[(5'h11):(4'hd)]) : $unsigned(($signed(wire12) >>> (wire10 ~^ wire33)))));
  assign wire37 = wire10;
  assign wire38 = $signed(wire33[(4'h8):(1'h1)]);
endmodule

module module20
#(parameter param31 = (((8'ha4) & ((((8'ha5) ? (8'ha0) : (8'ha4)) && ((8'ha8) ? (8'ha1) : (8'ha4))) <<< (7'h44))) - ((((^~(8'ha2)) >>> (7'h43)) * (((8'ha6) ? (8'hb7) : (8'had)) << (&(8'h9e)))) ? ((^(+(8'hbd))) != (-{(8'ha0)})) : (((|(8'ha6)) >>> (-(8'hb6))) ? ({(8'hb8)} >= (~&(8'ha0))) : (((8'hb5) ? (8'ha5) : (8'ha6)) ? (8'h9c) : ((8'ha1) ? (8'hb9) : (8'h9d)))))), 
parameter param32 = (((~^param31) ? (({param31} >= {(7'h42)}) >> {param31, (^param31)}) : param31) + ((param31 <= param31) ? ((~(8'hab)) ? (8'hab) : (param31 ? {param31} : {param31})) : ({(8'hb3), (param31 ? param31 : param31)} ? (~^param31) : param31))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  assign y = {wire30, wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = (((!$signed(wire22)) ^~ (($signed(wire25) ?
                      (wire23 ?
                          wire21 : wire23) : $unsigned((8'ha0))) ^ (8'hbc))) & (~|$unsigned(wire22)));
  assign wire27 = wire22[(3'h5):(2'h3)];
  assign wire28 = wire26;
  assign wire29 = $unsigned($unsigned(wire23[(3'h4):(2'h2)]));
  assign wire30 = wire25[(5'h12):(4'h8)];
endmodule
