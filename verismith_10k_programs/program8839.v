module top
#(parameter param93 = {(^{(((8'hbc) && (8'hb7)) < ((8'ha0) && (8'ha5))), (((7'h40) ? (8'hb7) : (8'ha3)) && (8'hac))}), (|((~^(+(8'ha1))) < ((~(8'hab)) ? (&(8'h9e)) : ((8'hba) ? (8'ha7) : (8'hb2)))))}, 
parameter param94 = (+{param93, param93}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  assign y = {wire91,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire4 = {{wire0[(1'h1):(1'h0)]},
                     ($signed($signed((wire1 || wire1))) ?
                         wire2[(3'h4):(1'h0)] : wire0[(1'h1):(1'h0)])};
  assign wire5 = $unsigned(wire0);
  assign wire6 = (wire0[(1'h0):(1'h0)] * ((wire5 ?
                         ($unsigned(wire1) || wire5[(1'h1):(1'h1)]) : $signed($signed(wire1))) ?
                     wire1[(2'h2):(1'h1)] : wire2));
  assign wire7 = ((wire3[(4'h8):(1'h1)] + (!wire3)) || wire4);
  always
    @(posedge clk) begin
      reg8 <= $signed({$signed({wire3[(4'ha):(3'h4)]})});
      reg9 <= reg8;
    end
  always
    @(posedge clk) begin
      reg10 <= wire5;
      reg11 <= ({(&$signed($unsigned(reg10))), (^~{wire1})} ?
          wire3 : $signed(reg10));
      reg12 <= {{(({(8'hb7), reg10} || ((8'hab) ? wire0 : (8'hb5))) ?
                  (wire5 != (&(8'ha0))) : ($unsigned(reg11) ?
                      $unsigned((8'hb1)) : $signed(reg8))),
              $unsigned(wire4[(3'h7):(3'h6)])}};
      reg13 <= $unsigned($signed(reg9));
      reg14 <= $unsigned(wire1);
    end
  assign wire15 = $unsigned(wire2);
  assign wire16 = ($signed((wire4 ?
                      wire0 : (7'h40))) <= ((~|wire15[(3'h7):(3'h6)]) <= (($signed(wire2) ?
                          $unsigned(wire15) : wire1) ?
                      ($unsigned((7'h43)) ?
                          $signed(wire6) : (reg9 && reg11)) : wire4)));
  assign wire17 = {wire6};
  assign wire18 = wire17;
  assign wire19 = (wire17 ^ $unsigned(($unsigned(wire1) - reg9)));
  assign wire20 = ((~|(~(~^wire5))) ?
                      $signed({$unsigned(wire18[(4'ha):(3'h7)]),
                          {reg13[(3'h5):(1'h1)]}}) : ((wire2 ^~ $signed($unsigned(wire18))) || ((wire19 << {wire15}) ?
                          wire7 : $unsigned($signed((7'h42))))));
  assign wire21 = $signed(((reg9[(1'h0):(1'h0)] ?
                      {$unsigned(reg8)} : {$signed((7'h40)),
                          $signed(wire1)}) ^~ $unsigned(reg12)));
  always
    @(posedge clk) begin
      reg22 <= (-($unsigned(reg13) <= {reg11[(2'h3):(1'h0)], wire2}));
      reg23 <= ((-{($signed((8'haf)) ? (reg13 + wire1) : {wire16, wire4}),
          reg8}) << wire17[(4'h8):(3'h4)]);
      reg24 <= wire19[(2'h3):(2'h2)];
    end
  assign wire25 = $signed(wire21);
  assign wire26 = $unsigned(wire4[(5'h10):(4'h8)]);
  assign wire27 = ((~^wire21) ? $unsigned(wire25) : wire18[(1'h1):(1'h0)]);
  assign wire28 = wire21;
  module29 #() modinst92 (.wire33(wire1), .wire30(reg10), .y(wire91), .wire34(wire16), .wire32(wire19), .clk(clk), .wire31(wire20));
endmodule

module module29
#(parameter param89 = (((((^(8'hae)) ? ((7'h44) ? (8'ha4) : (8'h9f)) : {(8'ha1)}) ~^ (-{(8'hbb)})) >= ((~|((8'ha1) ^~ (8'hba))) ? {(~|(8'hbd)), ((8'ha4) ? (8'hb0) : (8'hab))} : (((8'h9e) && (8'hb6)) ? ((8'hb0) ? (8'hb5) : (7'h42)) : ((8'hbb) | (8'hba))))) ? {(!({(8'ha2)} ^ {(8'haf)}))} : ({{((7'h41) == (8'ha4)), (!(8'ha9))}, {(~(7'h43)), ((8'hbe) ? (8'h9f) : (8'hb0))}} ? {(((8'hae) <<< (8'ha7)) == (8'ha2)), ({(7'h41)} ? ((8'haa) ? (8'hb3) : (8'hbd)) : {(8'ha3), (8'ha0)})} : ({((8'ha6) ? (8'hb5) : (8'hbf))} ? ({(8'h9c), (8'ha6)} ? (^~(8'hae)) : {(8'hb2)}) : (!((7'h40) > (8'hbe)))))), 
parameter param90 = param89)
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(4'hd):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  assign y = {wire88,
                 wire87,
                 wire85,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = $signed(wire33);
  assign wire36 = $unsigned(((|wire30[(4'hc):(1'h0)]) ?
                      wire30 : $signed(((wire33 <<< (8'hac)) <<< {wire33}))));
  module37 #() modinst48 (.wire40(wire31), .wire39(wire34), .wire41(wire33), .clk(clk), .y(wire47), .wire38(wire36));
  assign wire49 = $unsigned(wire34[(4'he):(4'h9)]);
  assign wire50 = $signed($unsigned((($signed(wire33) ?
                      (~^wire33) : (7'h44)) > (!wire47))));
  assign wire51 = (!{($unsigned(wire31[(3'h4):(1'h1)]) ?
                          (~$signed((8'ha3))) : wire34[(5'h15):(4'hb)]),
                      wire31});
  assign wire52 = wire34;
  module53 #() modinst86 (wire85, clk, wire52, wire30, wire31, wire34);
  assign wire87 = {(~&$signed({(wire33 || wire32), wire31[(4'hd):(4'hb)]})),
                      (($signed({wire35}) ?
                              $signed($signed(wire34)) : $signed($unsigned(wire47))) ?
                          wire51[(3'h6):(3'h6)] : wire51[(3'h6):(2'h2)])};
  assign wire88 = wire51;
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire57;
  input wire [(5'h11):(1'h0)] wire56;
  input wire [(3'h7):(1'h0)] wire55;
  input wire [(3'h5):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire67;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire58;
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire58 = $unsigned($signed($unsigned(wire57)));
  assign wire59 = (8'hb3);
  assign wire60 = $unsigned((~$signed(($unsigned(wire55) ?
                      $unsigned(wire55) : (7'h43)))));
  assign wire61 = $signed((^~$unsigned({wire57})));
  always
    @(posedge clk) begin
      if ($signed(($unsigned((&(wire61 ?
          (8'hac) : wire55))) > {wire59[(3'h6):(1'h1)], wire58})))
        begin
          reg62 <= $signed($signed((wire55[(1'h1):(1'h0)] ?
              (8'h9c) : (&wire61))));
          reg63 <= (~wire56[(3'h5):(3'h4)]);
          reg64 <= $unsigned((8'h9f));
        end
      else
        begin
          reg62 <= reg64[(4'hb):(4'h8)];
        end
    end
  assign wire65 = $signed((reg63[(2'h2):(2'h2)] & $signed((^~$signed(wire61)))));
  assign wire66 = $unsigned($unsigned(wire55));
  assign wire67 = {(^$unsigned($signed((wire56 ? wire66 : wire66))))};
  assign wire68 = ((wire60[(2'h2):(2'h2)] ?
                      $signed($unsigned((^reg63))) : $unsigned($signed($unsigned((7'h40))))) << (($signed({wire55,
                          wire56}) ~^ wire58[(1'h0):(1'h0)]) ?
                      ((8'hb5) ?
                          wire57 : {{wire67, wire67},
                              (wire66 ? wire59 : (7'h40))}) : wire57));
  always
    @(posedge clk) begin
      reg69 <= ($signed($signed($signed(wire55[(1'h1):(1'h0)]))) + $signed((!wire66)));
      if (wire61)
        begin
          if (((-wire61[(1'h1):(1'h1)]) ?
              wire68[(1'h0):(1'h0)] : $unsigned({reg69})))
            begin
              reg70 <= ($unsigned(((((8'hb1) == wire58) ~^ (wire60 ?
                  wire57 : wire60)) - {(~&wire54)})) + wire58);
            end
          else
            begin
              reg70 <= $signed(wire66[(2'h2):(1'h1)]);
              reg71 <= $unsigned(wire60);
              reg72 <= (8'ha5);
              reg73 <= (~&reg71);
            end
          reg74 <= $signed((^~(({reg63, (8'ha1)} >>> $signed(reg73)) ?
              ((wire67 ? wire60 : reg71) ?
                  $unsigned(wire65) : wire59) : (wire61 + (8'ha8)))));
        end
      else
        begin
          reg70 <= $signed((^$signed($unsigned((+reg69)))));
          if ($unsigned(wire58[(3'h5):(2'h3)]))
            begin
              reg71 <= reg63[(3'h5):(2'h3)];
              reg72 <= ((8'hb5) ?
                  ($signed($signed(reg72)) || $unsigned($unsigned(((8'hba) * wire59)))) : (((^$signed(wire59)) ^ {((8'hbc) ?
                              reg62 : reg74),
                          wire65[(4'h8):(3'h6)]}) ?
                      (^reg63) : (($unsigned((8'hb1)) ~^ (!reg71)) != (reg62[(2'h3):(2'h3)] & (reg62 ?
                          wire65 : reg64)))));
              reg73 <= $unsigned($signed((8'hb2)));
              reg74 <= $signed(((~^($signed(reg64) <<< (~reg63))) ?
                  ($unsigned((!wire54)) && ($signed(wire68) ?
                      (wire55 ?
                          wire66 : wire61) : reg73[(1'h1):(1'h1)])) : $signed(reg71[(3'h6):(3'h4)])));
              reg75 <= $signed(reg71);
            end
          else
            begin
              reg71 <= wire60[(1'h1):(1'h1)];
              reg72 <= $signed((reg63[(3'h6):(1'h1)] ?
                  wire56[(4'hd):(3'h6)] : (wire54 ?
                      (+$unsigned(wire56)) : reg64)));
              reg73 <= (~|wire61);
            end
          reg76 <= ({(wire60 ?
                      $unsigned($unsigned(wire68)) : $unsigned({reg69,
                          reg72}))} ?
              wire57 : $unsigned((((wire67 ? reg72 : wire60) ?
                      reg63 : (reg74 ? reg70 : wire65)) ?
                  reg71[(2'h2):(1'h1)] : ($signed((8'hb5)) >>> reg72))));
        end
      reg77 <= (~|reg63[(3'h6):(2'h3)]);
      reg78 <= $unsigned((~|(~&{(wire57 ? wire66 : wire61)})));
    end
  assign wire79 = ($unsigned(((8'ha2) ?
                      {(wire54 ? (8'ha6) : wire66), (^wire56)} : ((+(8'hbe)) ?
                          $unsigned(reg70) : $unsigned(wire54)))) >>> reg78);
  assign wire80 = reg76[(3'h6):(3'h5)];
  assign wire81 = $unsigned($unsigned($unsigned(((reg71 | wire67) != (^wire68)))));
  assign wire82 = (wire79[(2'h2):(1'h1)] ?
                      wire57[(4'hd):(4'hb)] : $signed($unsigned(reg62[(2'h3):(2'h3)])));
  assign wire83 = (^$signed(wire57));
  assign wire84 = $unsigned(wire61[(3'h5):(3'h4)]);
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire41;
  input wire signed [(4'hb):(1'h0)] wire40;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  assign y = {wire46, wire45, wire44, wire43, wire42, (1'h0)};
  assign wire42 = {wire39[(4'ha):(4'h9)]};
  assign wire43 = wire40[(4'h8):(3'h7)];
  assign wire44 = wire43[(4'h8):(1'h1)];
  assign wire45 = $signed(($signed(wire42[(3'h6):(1'h0)]) ^~ $unsigned(wire41[(5'h11):(3'h5)])));
  assign wire46 = ((~($unsigned((8'ha1)) ~^ $unsigned((wire42 ^~ wire43)))) <<< wire43);
endmodule
