module top
#(parameter param74 = ((~|(-(~&((8'hbc) && (8'ha2))))) & (8'had)), 
parameter param75 = ((param74 ? (param74 ^~ param74) : {param74}) ? ((|((|(8'hbf)) ? (!param74) : (param74 ? (8'hb1) : (8'ha8)))) ^ {(param74 ? {param74} : (~&param74))}) : ((param74 && (param74 ~^ (param74 <<< (8'h9f)))) & param74)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  assign y = {wire73,
                 wire69,
                 wire14,
                 wire5,
                 reg72,
                 reg71,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire5 = (wire1 ?
                     ((8'h9c) | {wire1[(4'hd):(4'h9)]}) : wire4[(4'h9):(4'h8)]);
  always
    @(posedge clk) begin
      reg6 <= $signed((wire1[(1'h0):(1'h0)] ?
          $signed($unsigned((wire4 - wire5))) : (wire3[(5'h10):(4'ha)] ?
              wire0 : ({wire1, wire0} ^~ (-wire1)))));
      reg7 <= reg6;
      if (($signed($signed(wire4)) <<< {$signed((wire1[(4'h9):(3'h7)] * $unsigned((8'ha6)))),
          wire0[(3'h6):(2'h2)]}))
        begin
          reg8 <= $unsigned($signed($signed($signed($unsigned(wire0)))));
          reg9 <= ((wire1[(2'h3):(1'h1)] < ($unsigned((wire4 <= reg8)) ?
                  (wire4 | wire0) : reg7)) ?
              reg7[(1'h0):(1'h0)] : $unsigned(((8'haf) < (((7'h40) != (8'hab)) ?
                  (reg6 ? reg8 : (8'hb1)) : (8'h9e)))));
          reg10 <= $unsigned((-(wire0[(1'h1):(1'h0)] ?
              (^wire2) : $unsigned(wire0))));
          reg11 <= (~|($unsigned(reg10[(3'h4):(2'h2)]) ^ (8'hb7)));
        end
      else
        begin
          reg8 <= $unsigned($signed(wire5));
          reg9 <= $unsigned(reg6);
          reg10 <= {wire0[(2'h2):(2'h2)]};
        end
      reg12 <= $signed(wire4);
      reg13 <= reg7[(3'h6):(1'h1)];
    end
  assign wire14 = (($signed((reg7[(4'h8):(3'h7)] ?
                          (wire1 ?
                              reg13 : reg12) : $unsigned(reg13))) <<< $unsigned(((!wire4) ?
                          reg10[(3'h7):(3'h6)] : $signed(wire3)))) ?
                      (wire1 >= $signed((8'ha7))) : wire2);
  module15 #() modinst70 (wire69, clk, wire0, reg10, wire5, reg8, reg7);
  always
    @(posedge clk) begin
      reg71 <= ($signed(wire3[(4'ha):(4'h9)]) < (-wire69[(4'he):(4'ha)]));
      reg72 <= (((!(~&(~^(8'hbc)))) && $signed({(^wire0),
          (wire4 ? wire1 : reg11)})) > reg13[(2'h3):(1'h0)]);
    end
  assign wire73 = ($unsigned(({reg71[(2'h2):(2'h2)],
                          $unsigned((8'ha3))} <= (wire3[(2'h3):(2'h3)] & (wire0 >>> wire69)))) ?
                      ($unsigned(wire4) < ($signed((~&wire5)) ?
                          (~|reg8) : reg10[(4'hb):(3'h4)])) : {(!reg13),
                          $signed(((reg13 ? reg6 : wire69) ?
                              (+wire3) : {wire14, reg8}))});
endmodule

module module15
#(parameter param67 = (~(((8'h9d) ~^ {{(8'haf)}}) <<< {(^~((8'h9f) ? (7'h42) : (8'h9d)))})), 
parameter param68 = (~|{(param67 ? ((param67 ? param67 : (8'hbc)) & ((8'hb4) ? param67 : param67)) : (8'hb1))}))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire64;
  assign y = {wire66, wire43, wire23, wire22, wire21, wire45, wire64, (1'h0)};
  assign wire21 = (wire20[(3'h7):(1'h1)] >>> ($signed(({(8'hb9)} ^ (wire18 < wire16))) ?
                      {$unsigned((+wire19))} : ($signed(wire18) || (-(8'hb9)))));
  assign wire22 = $unsigned(wire19);
  assign wire23 = $unsigned((|(|$signed({wire19, wire19}))));
  module24 #() modinst44 (.y(wire43), .wire29(wire23), .wire25(wire20), .clk(clk), .wire26(wire19), .wire27(wire21), .wire28(wire18));
  assign wire45 = ($unsigned((^$signed((wire43 > wire19)))) >= (!(((wire22 ?
                      wire20 : wire22) & wire18) == {(wire16 ?
                          (8'hb4) : wire22)})));
  module46 #() modinst65 (wire64, clk, wire17, wire19, wire18, wire16, wire22);
  assign wire66 = $signed(wire43);
endmodule

module module46
#(parameter param62 = (((({(8'ha3)} ? (|(7'h42)) : ((8'hb7) ? (8'hb2) : (8'hae))) ? {{(8'hbd)}} : (((8'hb0) ? (8'ha5) : (8'ha8)) ? ((8'hb4) <<< (8'hbf)) : {(7'h41), (8'ha3)})) <= ({((8'ha0) ? (8'hb1) : (8'ha5))} ? (!(^~(8'hb1))) : (^{(8'hbd)}))) ? ((((!(8'hbf)) >= (8'hae)) ? ((&(8'hbc)) & ((8'had) >> (8'hb0))) : (^((8'hb2) ? (7'h42) : (8'hba)))) ? ((~(8'hbe)) ? (~&((8'h9c) ? (7'h42) : (8'hbf))) : {((8'haf) >> (8'hbc)), (~^(8'ha7))}) : ((((8'hb5) << (8'hbe)) >>> ((8'hb8) > (8'hb8))) != (((7'h40) ? (7'h41) : (8'h9e)) ^~ ((8'hb0) ? (7'h43) : (8'hb9))))) : ({(+{(8'hbc), (8'ha4)})} ? ((((8'hb0) != (8'ha2)) ~^ (8'haa)) ^~ (!((8'ha0) ? (8'hbb) : (8'hae)))) : {(((8'ha3) == (8'hb1)) ? ((8'ha9) ? (8'hb3) : (8'h9c)) : ((7'h43) ? (8'hbe) : (8'ha3)))})), 
parameter param63 = param62)
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire [(3'h7):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire [(2'h3):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 (1'h0)};
  assign wire52 = {((~|(8'ha4)) ?
                          (((^~(8'hac)) > (~wire51)) ?
                              ((~^wire51) ?
                                  $unsigned((8'haf)) : $signed(wire51)) : (+wire51)) : $unsigned((~|wire49))),
                      wire47[(3'h4):(1'h0)]};
  assign wire53 = (~|wire48[(2'h3):(2'h2)]);
  assign wire54 = (^~$unsigned($unsigned(((wire50 ? (8'hbc) : (8'ha5)) ?
                      (wire49 < (8'ha6)) : (wire49 | wire53)))));
  assign wire55 = wire51[(4'hb):(4'h8)];
  assign wire56 = (({wire50, wire53[(4'hb):(3'h5)]} ?
                      {wire49[(3'h5):(3'h4)],
                          $unsigned(wire52)} : wire51[(3'h4):(1'h0)]) << (((~^(wire48 ?
                      wire55 : wire49)) << (wire54[(1'h0):(1'h0)] ?
                      $signed(wire51) : wire49)) <= $signed($unsigned((wire50 ?
                      wire52 : wire53)))));
  assign wire57 = (8'hb9);
  assign wire58 = $unsigned({$unsigned(($unsigned((8'hb2)) - (wire53 ?
                          wire50 : wire55)))});
  assign wire59 = wire48[(2'h2):(1'h1)];
  assign wire60 = $signed(((-{wire49}) ^~ wire52));
  assign wire61 = ({$signed(((8'hbb) ^~ (wire58 ? wire60 : wire53)))} ?
                      $unsigned($signed($unsigned($unsigned((7'h40))))) : wire49);
endmodule

module module24
#(parameter param42 = ({((8'ha2) ? (((7'h41) ? (8'h9c) : (8'hb0)) << (~|(8'hb0))) : (((8'hbd) > (7'h44)) != ((8'hba) && (7'h41))))} ? {(!({(8'hb5), (8'h9c)} ? {(8'hbb)} : ((8'hb9) ? (8'h9c) : (8'ha0)))), (+{((8'hbf) <= (8'ha7)), ((8'had) ? (8'hb7) : (8'hbe))})} : (((((8'hb5) > (8'ha1)) <<< (^~(8'hac))) << (((8'had) ^~ (8'ha6)) - ((8'hb1) >>> (8'hac)))) ? ((8'h9d) < (8'ha6)) : (+(((8'hab) > (8'haf)) ? ((8'hbd) ? (8'ha1) : (7'h41)) : ((8'ha2) && (8'hba)))))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  assign y = {wire41,
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
                 (1'h0)};
  assign wire30 = wire26;
  assign wire31 = $signed($signed(($signed((|wire28)) ?
                      wire26[(3'h7):(1'h1)] : $signed((wire29 && wire30)))));
  assign wire32 = {(((~^(wire25 < wire28)) ?
                              {$signed(wire31)} : ((wire25 ? wire27 : wire30) ?
                                  (-wire29) : (wire28 ? wire31 : wire27))) ?
                          wire29 : (($unsigned(wire26) ?
                              {wire25, (8'had)} : (wire26 ?
                                  wire29 : wire27)) > wire25))};
  assign wire33 = wire26;
  assign wire34 = ($unsigned(wire29[(3'h4):(2'h2)]) >>> ($signed($unsigned({(8'hb4)})) << (wire33 <= {$unsigned((8'hae)),
                      $unsigned((8'ha6))})));
  assign wire35 = (7'h42);
  assign wire36 = ({wire30[(4'hb):(4'h9)],
                          {$signed((wire26 >= wire31)),
                              ({(8'hab), (7'h43)} * (|wire32))}} ?
                      $signed(wire27[(1'h1):(1'h0)]) : $signed(wire32));
  assign wire37 = wire26[(4'hd):(3'h4)];
  assign wire38 = wire28[(5'h10):(3'h7)];
  assign wire39 = wire34[(3'h5):(1'h0)];
  assign wire40 = (~$signed(wire36));
  assign wire41 = (-$unsigned($signed((+(wire34 ? wire29 : wire31)))));
endmodule
