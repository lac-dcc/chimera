module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire21,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire4[(4'h9):(2'h2)];
  assign wire6 = {wire5[(3'h5):(3'h5)]};
  always
    @(posedge clk) begin
      reg7 <= $signed(((-((8'ha8) ? (~|(8'ha0)) : $unsigned(wire1))) ?
          ({wire5,
              (+wire3)} <<< ($signed(wire4) || {wire3})) : $signed($unsigned((wire2 && wire0)))));
      reg8 <= (&$unsigned((wire0[(4'hc):(4'hc)] >= $unsigned(wire1[(3'h5):(1'h1)]))));
      reg9 <= reg7;
      reg10 <= $signed((+(($unsigned(wire2) && (8'ha8)) * reg8)));
      if ((((&($unsigned(wire6) ? wire6[(2'h2):(1'h1)] : $signed(wire4))) ?
              (8'h9f) : $signed(({wire5} && (~reg10)))) ?
          reg9 : wire5[(3'h4):(3'h4)]))
        begin
          reg11 <= (|wire1[(2'h2):(1'h0)]);
          reg12 <= (((-((reg7 ? (8'hab) : wire6) ?
              wire2 : $signed((7'h42)))) < (-reg10)) + {($unsigned((reg10 > reg10)) > reg10[(1'h1):(1'h1)])});
          reg13 <= ($unsigned(({(wire4 & reg8)} >>> {wire6,
                  wire6[(2'h3):(2'h2)]})) ?
              wire5[(1'h0):(1'h0)] : reg7[(1'h1):(1'h1)]);
          reg14 <= reg11[(3'h5):(2'h2)];
        end
      else
        begin
          reg11 <= (-(8'hbe));
          if ($signed(($unsigned(((wire1 ? wire5 : reg7) ?
                  (reg13 ? wire5 : reg13) : (wire0 ? wire5 : wire5))) ?
              $signed({$signed(reg10),
                  $signed(reg11)}) : $signed(($unsigned((7'h43)) <= (reg11 < wire1))))))
            begin
              reg12 <= (~|(~&(!wire5)));
              reg13 <= (7'h43);
            end
          else
            begin
              reg12 <= $signed($unsigned(($unsigned((^wire1)) ?
                  reg8 : $signed((reg12 ? reg13 : wire0)))));
              reg13 <= (((reg9 ? $unsigned((reg11 + reg9)) : reg12) ?
                  $signed($unsigned($signed((8'h9d)))) : wire6[(3'h7):(1'h1)]) ^~ {wire2[(4'h9):(4'h9)]});
              reg14 <= wire1[(3'h4):(1'h0)];
            end
          reg15 <= ((8'hb1) ^~ wire5);
          if ((wire3 ?
              reg12[(1'h0):(1'h0)] : {($unsigned({wire4,
                      reg15}) ~^ $unsigned($signed(wire5))),
                  $signed($signed($signed(reg7)))}))
            begin
              reg16 <= ((reg8 << (~|((reg9 ^~ wire3) >>> $signed(wire6)))) <<< reg14[(1'h0):(1'h0)]);
              reg17 <= ({(^~reg13)} && $unsigned((|wire1)));
              reg18 <= (~reg14);
              reg19 <= $signed({wire3[(4'h9):(2'h2)]});
            end
          else
            begin
              reg16 <= reg11;
              reg17 <= (&{((+{reg17, wire5}) ?
                      $unsigned((^~reg9)) : wire5[(1'h1):(1'h1)])});
            end
          reg20 <= (~|$signed($signed(reg7)));
        end
    end
  assign wire21 = (^$unsigned(($unsigned((wire4 ?
                      (8'hb8) : reg8)) + ((^~(7'h42)) ?
                      (reg19 ? wire0 : wire4) : ((8'ha6) ? wire5 : reg16)))));
  module22 #() modinst61 (.y(wire60), .clk(clk), .wire25(reg15), .wire24(reg16), .wire26(wire4), .wire23(wire21));
  assign wire62 = reg13[(3'h6):(3'h4)];
  assign wire63 = reg16;
  assign wire64 = reg18;
  assign wire65 = reg20;
  assign wire66 = (wire5 ?
                      wire65[(2'h2):(1'h0)] : $signed(($unsigned($signed(wire3)) ?
                          {reg17[(3'h7):(3'h7)],
                              $signed(reg7)} : $unsigned({reg15, (8'hac)}))));
  assign wire67 = (wire1 >= ($signed((8'haf)) ?
                      reg12[(1'h1):(1'h1)] : (wire0 ?
                          (reg14[(2'h3):(2'h3)] ?
                              reg17 : {reg12}) : ($signed((8'hab)) * (reg11 ?
                              wire66 : wire63)))));
  assign wire68 = (|{$signed(($signed(reg19) < (reg15 <= wire3)))});
endmodule

module module22
#(parameter param58 = ((!{((8'hbe) ? ((8'haa) ? (7'h44) : (8'ha0)) : {(8'hab)})}) < {(7'h42), (((8'hb3) ~^ (~(8'ha3))) ? {((8'hab) >= (8'hb1))} : (((8'hbd) ? (8'ha0) : (7'h42)) ~^ (~(7'h44))))}), 
parameter param59 = ((param58 <<< param58) ? (({(param58 ? param58 : param58), param58} >>> ((param58 ? param58 : (8'ha3)) ? param58 : ((7'h40) & param58))) - (~(param58 ? (param58 <= param58) : param58))) : (8'hba)))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 (1'h0)};
  assign wire27 = $signed((+(~|{wire25[(3'h6):(2'h3)]})));
  assign wire28 = $unsigned($signed(($unsigned({wire26}) | (~(wire25 ~^ (8'haf))))));
  assign wire29 = wire28[(4'h9):(3'h5)];
  assign wire30 = $signed($signed($unsigned((~|((8'hb1) ?
                      (8'haa) : (8'hb2))))));
  assign wire31 = {$signed(wire28[(2'h2):(1'h1)])};
  assign wire32 = wire23[(5'h12):(3'h5)];
  module33 #() modinst52 (.wire37(wire26), .wire34(wire25), .clk(clk), .wire36(wire31), .y(wire51), .wire35(wire28));
  assign wire53 = wire23[(3'h4):(1'h1)];
  assign wire54 = ({{wire29,
                              ((-wire29) ?
                                  (wire29 ~^ (8'ha0)) : ((8'hbf) << (8'h9e)))},
                          $unsigned(($unsigned(wire27) > $unsigned(wire53)))} ?
                      (^($unsigned((wire24 ? wire28 : wire24)) ?
                          ((wire30 ?
                              wire24 : wire27) >> wire27) : wire29[(3'h4):(1'h1)])) : $signed($unsigned(wire51)));
  assign wire55 = (!{(wire31 > ($signed(wire27) >= (-(8'ha8)))),
                      wire32[(2'h3):(2'h3)]});
  assign wire56 = wire32;
  assign wire57 = (8'ha1);
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire signed [(4'hb):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire44;
  wire signed [(4'h9):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  wire signed [(5'h15):(1'h0)] wire38;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 (1'h0)};
  assign wire38 = ((((-wire34[(5'h11):(3'h7)]) >> (~wire37[(4'ha):(2'h3)])) ?
                          (!wire37) : (((+wire37) ?
                                  (wire36 - wire34) : (wire37 ?
                                      (8'hb9) : wire35)) ?
                              (wire37[(4'h8):(1'h1)] ?
                                  wire37 : ((8'haf) ?
                                      wire37 : (8'ha9))) : wire35)) ?
                      (($signed($signed(wire36)) ?
                          (~^wire37[(1'h1):(1'h0)]) : (7'h44)) >= (&$signed((-wire37)))) : wire36[(4'hb):(4'h9)]);
  assign wire39 = (^~$unsigned((+(+wire34))));
  assign wire40 = wire39[(5'h14):(4'hd)];
  assign wire41 = (+(-($unsigned((wire40 ? wire38 : wire35)) & (^wire39))));
  assign wire42 = $unsigned($unsigned(((&wire36[(1'h0):(1'h0)]) ?
                      wire35 : ((~^wire39) ?
                          $unsigned(wire39) : (wire36 == (8'haa))))));
  assign wire43 = wire35;
  assign wire44 = (|$signed((~^wire35[(2'h2):(2'h2)])));
  assign wire45 = {$unsigned(wire35[(3'h4):(1'h1)])};
  assign wire46 = ($unsigned($unsigned((-(wire34 != wire40)))) ^ ({wire36[(3'h5):(2'h3)]} & wire44));
  assign wire47 = wire35;
  assign wire48 = (~&(($unsigned($signed(wire40)) >>> (wire39[(4'hb):(3'h6)] ?
                      $signed(wire38) : wire46)) ^~ (~^wire44[(5'h11):(2'h3)])));
  assign wire49 = (((wire46[(2'h2):(1'h1)] ? wire45[(3'h4):(1'h0)] : wire41) ?
                      $signed($unsigned((wire46 ^~ wire43))) : ((((8'ha7) ?
                              wire35 : wire36) * (8'hb7)) ?
                          wire41[(3'h4):(2'h2)] : wire48)) != (((wire37[(3'h7):(3'h7)] ?
                              $unsigned(wire42) : (wire43 ^ wire41)) ?
                          $signed((^~wire44)) : $signed($unsigned(wire38))) ?
                      wire43 : (8'hb4)));
  assign wire50 = ((^~(((-wire44) ^~ (wire35 ?
                          wire37 : wire43)) ^ (~|wire34[(4'he):(3'h7)]))) ?
                      {(($signed(wire49) == (8'h9c)) >> {wire40[(4'h9):(1'h0)],
                              $unsigned(wire46)})} : ({($unsigned((8'hab)) ^ wire40)} ?
                          (({wire36, wire37} < (wire48 - wire37)) ?
                              $signed($unsigned(wire43)) : wire42[(3'h6):(2'h3)]) : {$unsigned(((8'hb1) ?
                                  wire45 : wire36)),
                              (wire43[(4'h8):(1'h1)] > {(8'ha7)})}));
endmodule
