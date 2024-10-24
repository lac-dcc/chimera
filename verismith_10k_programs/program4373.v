module top
#(parameter param66 = (&({(~^((8'ha3) ? (8'h9f) : (8'haf)))} ? ((-{(8'hb1)}) >>> ((^~(8'hb3)) < ((8'hb4) ? (8'h9c) : (8'hbd)))) : (((8'h9d) & {(8'ha3)}) ? (^((8'hb7) || (7'h44))) : ((^~(8'ha3)) <<< ((7'h44) ^~ (8'hb7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(5'h12):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire50;
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire50,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire5 = $unsigned((^~($unsigned((8'ha0)) ?
                     ((wire4 ? wire0 : wire1) ?
                         wire1[(1'h0):(1'h0)] : wire2) : (wire0 | (wire1 ?
                         wire3 : wire3)))));
  assign wire6 = (!$unsigned({((~|wire2) >= (|wire0))}));
  assign wire7 = $unsigned($signed($signed(wire6[(1'h1):(1'h1)])));
  assign wire8 = (8'ha0);
  assign wire9 = $signed($signed((wire2[(4'h8):(3'h7)] ?
                     (|wire2[(2'h3):(1'h0)]) : {(wire8 <= wire5)})));
  assign wire10 = (^{(~wire1[(2'h3):(1'h1)])});
  module11 #() modinst51 (wire50, clk, wire10, wire9, wire6, wire4, wire3);
  always
    @(posedge clk) begin
      reg52 <= $unsigned(($unsigned((-$unsigned(wire50))) <= ((~&$signed(wire7)) ?
          (~&(~^(8'hb0))) : ((wire9 && wire0) - (wire7 >>> wire3)))));
      reg53 <= $unsigned(wire4);
      reg54 <= $unsigned((~(wire7[(4'hd):(3'h6)] ~^ wire6[(3'h4):(1'h1)])));
      reg55 <= reg54[(3'h5):(1'h0)];
      reg56 <= wire8[(4'he):(4'hc)];
    end
  assign wire57 = $signed(wire8);
  assign wire58 = $unsigned(reg55);
  assign wire59 = (~^$signed($unsigned({$signed((8'ha7)), $unsigned(wire3)})));
  assign wire60 = (wire59[(2'h3):(1'h1)] ?
                      (~|wire7[(4'hb):(1'h0)]) : (~^(((~|(8'ha3)) ?
                          (wire50 ^ reg52) : (wire8 ?
                              reg54 : wire1)) <= $signed($signed(wire6)))));
  assign wire61 = {(~(($unsigned(wire10) >> (wire9 || (8'hbb))) >= wire7))};
  assign wire62 = $unsigned(wire7);
  assign wire63 = wire5;
  assign wire64 = (((wire3 >> $unsigned((~^wire10))) > (~^($unsigned(reg55) ?
                          reg52 : reg52))) ?
                      $unsigned((-((8'hb9) ?
                          wire62[(4'h8):(2'h2)] : (8'ha5)))) : $signed(($signed((wire60 ?
                          wire4 : wire59)) + (~^$unsigned(wire3)))));
  assign wire65 = wire61;
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire17;
  assign y = {wire49, wire48, wire46, wire18, wire17, (1'h0)};
  assign wire17 = (wire14 ^~ wire16[(1'h1):(1'h0)]);
  assign wire18 = (8'hb4);
  module19 #() modinst47 (.wire23(wire18), .y(wire46), .wire20(wire16), .wire22(wire12), .wire21(wire15), .clk(clk));
  assign wire48 = $unsigned({($signed({wire17, (8'hb6)}) ?
                          wire16[(3'h5):(2'h3)] : $signed({wire15, (7'h43)}))});
  assign wire49 = ((+$unsigned(((^wire17) ? (~|(8'hab)) : wire15))) ?
                      ($signed(($signed(wire17) ?
                          wire17[(3'h4):(3'h4)] : $unsigned((8'hbc)))) > (wire48[(3'h4):(2'h3)] ?
                          (((8'ha1) ? (7'h42) : wire14) ?
                              $unsigned(wire13) : (wire13 <= wire14)) : $unsigned($signed((8'hb5))))) : (wire46[(2'h3):(1'h1)] << wire16[(2'h2):(1'h0)]));
endmodule

module module19
#(parameter param44 = {(((((8'hb3) ? (8'ha2) : (8'ha3)) ~^ ((8'h9e) == (8'hb8))) ? {{(8'hb9), (8'h9c)}} : ((~&(8'hbb)) ^ {(8'hbd), (8'hbd)})) ? (+(8'hb9)) : ((~^(^(8'ha8))) ? (^~((8'h9d) <<< (8'haf))) : (((8'haa) ? (8'ha5) : (8'ha7)) ? ((8'hbb) & (8'hac)) : ((8'ha7) > (8'hba)))))}, 
parameter param45 = ({param44} >> (param44 || ((param44 ^ param44) ? ((param44 >= param44) ? param44 : (param44 | param44)) : param44))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire24;
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire24,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = (wire21[(3'h5):(2'h3)] ?
                      ((8'hae) < $unsigned(wire21[(1'h0):(1'h0)])) : wire20);
  always
    @(posedge clk) begin
      reg25 <= (7'h43);
      reg26 <= (^(wire23[(1'h1):(1'h0)] | $signed($unsigned((wire20 ?
          wire20 : (8'hac))))));
      reg27 <= wire24[(2'h2):(1'h0)];
      reg28 <= (((+($signed(reg27) == (wire22 > wire23))) >> (+((wire21 < reg26) >= $unsigned(reg27)))) ?
          ((((wire24 || reg27) >= wire20) ?
              (&{reg27}) : ((wire23 * reg27) ^~ $unsigned(wire24))) >= wire20[(4'h9):(3'h6)]) : reg27[(2'h2):(1'h1)]);
    end
  assign wire29 = ({$signed($signed((reg28 ?
                          wire21 : wire21)))} <<< (|(8'hb4)));
  assign wire30 = (wire29 ?
                      $signed($signed($signed((reg28 & (8'hb1))))) : {wire21,
                          wire20});
  assign wire31 = wire23[(3'h7):(3'h6)];
  assign wire32 = wire23[(3'h7):(2'h3)];
  assign wire33 = ($unsigned((!wire31[(1'h1):(1'h0)])) ^ reg26[(3'h5):(1'h0)]);
  assign wire34 = (($signed(wire23) ?
                      wire23[(3'h4):(2'h3)] : ({wire32} <= {(reg26 ?
                              (8'ha2) : reg26),
                          $unsigned(wire29)})) ^ $signed(((8'haa) >= {wire21[(4'h8):(3'h4)],
                      $signed(reg27)})));
  always
    @(posedge clk) begin
      reg35 <= $unsigned($signed(wire21));
      if ((~&$signed((^$signed((wire31 == reg25))))))
        begin
          reg36 <= (^~(~wire20[(4'ha):(3'h7)]));
          reg37 <= {(8'ha9)};
        end
      else
        begin
          reg36 <= {({$unsigned((!(8'ha9))), (^wire30[(3'h5):(3'h4)])} ?
                  reg27 : (8'hb3)),
              wire31};
          reg37 <= ($unsigned(reg28) ?
              reg25[(4'h8):(3'h7)] : ($unsigned($unsigned(wire29)) ?
                  ((reg35 ? $unsigned(wire23) : wire24[(1'h0):(1'h0)]) ?
                      (reg25[(4'h8):(2'h3)] ?
                          wire31[(2'h3):(2'h2)] : reg28) : wire30[(3'h7):(2'h3)]) : (((~wire29) ?
                      (wire21 ?
                          wire29 : (8'hba)) : (wire29 > wire23)) || (8'ha5))));
          reg38 <= {({wire33[(4'h9):(1'h1)]} ?
                  (&(wire30[(2'h3):(1'h1)] & (reg27 ^ wire29))) : wire22[(1'h0):(1'h0)]),
              $signed((~&reg37))};
          reg39 <= wire23[(2'h2):(1'h1)];
          reg40 <= ($unsigned($signed($signed(reg39))) ?
              (-($signed($unsigned(wire34)) ^~ (~|$unsigned(reg39)))) : (8'hbf));
        end
      reg41 <= (&(reg36 ?
          $signed(((+(8'ha4)) ?
              wire23 : (reg25 && wire31))) : {reg39[(4'h9):(1'h0)]}));
      reg42 <= $signed((~|(reg26[(4'hc):(3'h6)] ?
          $signed((reg38 | reg28)) : (^(reg40 ? reg26 : reg27)))));
      reg43 <= ({$unsigned($unsigned((reg35 & reg38)))} & wire30[(3'h5):(3'h4)]);
    end
endmodule
