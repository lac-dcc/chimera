module top
#(parameter param57 = (((~(((8'ha0) >> (8'ha2)) ? (~(8'hbc)) : ((8'hb1) ~^ (8'hb7)))) & (({(8'hb3), (8'hb2)} ? ((8'hb7) ? (8'ha9) : (8'hb4)) : ((8'hae) ? (8'ha9) : (8'hb2))) || (((8'haa) || (8'ha4)) ^ ((8'hbb) ? (8'ha1) : (8'hb6))))) | ((8'h9d) ? ((((8'ha3) > (8'ha6)) ? (|(7'h41)) : ((8'hb1) != (8'hb3))) ? ((+(8'h9d)) ? (^~(8'hab)) : ((8'hab) ? (8'ha6) : (8'ha0))) : (~&{(7'h42), (8'hb7)})) : (((|(8'hae)) <= (~(8'hb9))) | (!(~^(8'hb0)))))), 
parameter param58 = {(((8'hbc) ? (~(param57 ? (8'h9c) : param57)) : (+param57)) ? {(!{param57, param57}), param57} : param57)})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire55,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire1[(3'h7):(3'h4)];
  assign wire6 = $signed(({((wire1 << wire0) ?
                         $unsigned(wire2) : wire2[(4'h9):(3'h6)])} | $unsigned($unsigned((wire2 ?
                     wire5 : wire4)))));
  always
    @(posedge clk) begin
      reg7 <= (^$unsigned((&$unsigned(((8'ha4) << wire6)))));
      reg8 <= {reg7, wire2[(3'h5):(3'h5)]};
      reg9 <= ($signed({($unsigned((8'hac)) >= $unsigned(wire6)),
          (wire1 ?
              (wire4 ? wire4 : wire5) : (reg7 ?
                  wire2 : wire0))}) || wire2[(4'h8):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg10 <= wire0;
      reg11 <= $unsigned({$signed((~|((8'hb4) ? wire0 : reg10)))});
      reg12 <= reg10[(4'he):(4'ha)];
      reg13 <= {$signed($signed(wire4[(4'ha):(4'h8)])), wire4[(4'ha):(3'h4)]};
      reg14 <= (reg11[(3'h5):(1'h1)] ?
          ({($signed(reg13) << {reg8, reg8}),
              (((8'hb6) >= reg7) ?
                  ((8'hab) ? wire6 : reg8) : (reg12 ?
                      wire5 : wire2))} > $unsigned($signed((wire3 || wire3)))) : (~&$unsigned(wire4[(4'h9):(1'h0)])));
    end
  module15 #() modinst56 (.y(wire55), .wire19(wire2), .clk(clk), .wire18(reg13), .wire17(wire5), .wire16(reg8));
endmodule

module module15
#(parameter param53 = ({({((8'hb0) ? (8'ha8) : (8'h9c))} << (^(~^(8'ha5)))), ((~|(-(8'ha8))) ? ({(8'hab)} >= (|(8'ha7))) : (((8'hb7) ? (8'ha4) : (8'h9c)) >>> (|(8'hbc))))} ? {({(~&(7'h44)), {(8'ha0), (8'hb4)}} && ({(8'hb1)} >> ((8'ha5) ^ (8'hb4))))} : ((({(8'hba)} ? (+(8'h9e)) : ((8'hae) ? (8'h9d) : (8'haa))) != ((!(8'haf)) != (~&(8'hb3)))) == (~&((!(8'hb7)) ? {(8'ha4)} : {(8'ha6), (8'ha1)})))), 
parameter param54 = {({param53, ((param53 ? param53 : param53) || (!param53))} ? (param53 ? ((param53 ? param53 : param53) ? (param53 ^~ param53) : ((7'h42) ? param53 : param53)) : ((-param53) ? (param53 ~^ param53) : (param53 ? (8'hb3) : param53))) : (~|({param53} ? (-param53) : (~^(8'hb2))))), {param53, {param53, (((8'haf) - (8'hb3)) ~^ ((8'hb1) ^~ param53))}}})
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire52;
  wire signed [(4'h9):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hc):(1'h0)] wire46;
  assign y = {wire52, wire51, wire50, wire49, wire48, wire46, (1'h0)};
  module20 #() modinst47 (.clk(clk), .wire22(wire19), .y(wire46), .wire23(wire17), .wire21((7'h43)), .wire25(wire16), .wire24(wire18));
  assign wire48 = $unsigned($unsigned({wire46[(2'h2):(1'h1)],
                      $unsigned((~&wire18))}));
  assign wire49 = (($unsigned(wire16) - (|wire48[(4'hc):(3'h6)])) ?
                      $signed($unsigned($unsigned($signed(wire19)))) : $signed($signed($signed(wire18))));
  assign wire50 = (&$unsigned((+$unsigned($unsigned(wire48)))));
  assign wire51 = wire16;
  assign wire52 = (({(wire17 ?
                          (~|wire17) : wire19[(2'h3):(2'h2)])} << wire49) >> wire48);
endmodule

module module20
#(parameter param45 = ({((((8'hbb) ? (8'ha5) : (8'ha1)) ^~ (-(8'hb2))) ^ (((8'hb3) ? (8'ha7) : (8'ha6)) ~^ ((8'hb3) == (8'hbc)))), ({(8'hb0)} ? (^~((8'hae) ? (8'hab) : (8'hb3))) : (((8'hb8) ? (8'h9e) : (8'hb3)) && ((7'h41) ? (8'hb6) : (8'h9e))))} ? ((((^~(8'ha9)) ^ (~|(8'hb6))) ? (^((8'hbb) ? (8'hbf) : (8'hba))) : (~&(~(8'hb6)))) ? ({(8'h9d), (~(7'h42))} ? {((8'hbf) ? (8'ha9) : (8'ha5))} : {(~|(7'h42)), (!(8'ha7))}) : (({(8'ha6), (8'h9e)} ? {(8'haa), (8'hba)} : ((8'ha5) << (8'ha0))) || (!((8'hb3) <= (8'hbc))))) : ((|((~^(8'ha0)) || ((8'ha1) <= (7'h43)))) ? {(8'haf), ((!(8'haf)) + (~&(7'h42)))} : (-(&((8'h9e) <<< (8'hb9)))))))
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(2'h2):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
                 wire28,
                 wire27,
                 wire26,
                 (1'h0)};
  assign wire26 = ($unsigned(((wire23[(3'h6):(1'h1)] ^ (wire21 ?
                          wire21 : wire22)) <<< ((wire23 ? wire23 : wire23) ?
                          (wire25 || wire25) : $signed(wire21)))) ?
                      $unsigned({{{wire21}},
                          wire22[(1'h1):(1'h0)]}) : (($unsigned(wire24) << wire23[(3'h7):(3'h6)]) ?
                          ((~&(wire21 ?
                              wire25 : wire21)) << $unsigned((wire24 != wire21))) : (~|$signed(wire21[(3'h5):(2'h3)]))));
  assign wire27 = wire24;
  assign wire28 = wire21;
  assign wire29 = $signed(($unsigned((wire22 ?
                      (wire26 << (7'h42)) : {wire26,
                          wire22})) ~^ $signed((wire24 ?
                      $signed((8'hb6)) : $signed(wire22)))));
  assign wire30 = (~|$unsigned({wire28[(2'h2):(1'h1)],
                      $unsigned(((8'hb9) ? wire28 : wire25))}));
  assign wire31 = wire25[(3'h4):(3'h4)];
  assign wire32 = $signed(($unsigned(wire25[(1'h0):(1'h0)]) >>> $signed($unsigned((|wire27)))));
  assign wire33 = ($unsigned(wire22) * ((($signed(wire26) != (wire27 >= wire31)) ~^ $unsigned((&(8'h9e)))) ?
                      (~&wire30[(2'h3):(1'h1)]) : (^~$unsigned((wire27 ?
                          wire22 : wire27)))));
  assign wire34 = $unsigned(wire21[(4'hc):(3'h5)]);
  assign wire35 = wire33;
  assign wire36 = wire23[(3'h5):(3'h5)];
  assign wire37 = {(8'hab), wire35};
  assign wire38 = wire21;
  assign wire39 = ($unsigned(wire28[(2'h3):(1'h0)]) ?
                      (~|{wire28,
                          $signed({wire32})}) : (^$signed(($unsigned((8'h9d)) >= wire25))));
  assign wire40 = wire34;
  assign wire41 = (8'hac);
  assign wire42 = wire21;
  assign wire43 = ((~|(7'h43)) * $unsigned(wire39[(3'h5):(3'h5)]));
  assign wire44 = $signed($signed((wire29 ?
                      $unsigned(wire35[(4'hf):(1'h0)]) : wire39[(4'hf):(4'ha)])));
endmodule
