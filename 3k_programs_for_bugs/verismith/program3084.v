module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire95;
  wire [(3'h7):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = $unsigned((&($signed({wire2}) ?
                     (wire1 || {(8'hb2), wire1}) : wire1)));
  assign wire7 = wire5[(1'h0):(1'h0)];
  assign wire8 = ((!wire3) ?
                     wire5[(2'h2):(1'h0)] : (!{({wire0} ?
                             wire1[(4'h9):(2'h3)] : {wire4, wire1}),
                         wire0[(3'h7):(3'h7)]}));
  always
    @(posedge clk) begin
      reg9 <= (({(((8'ha7) - (8'ha7)) ~^ (wire7 ? wire8 : (7'h43))),
              ($signed((8'hbc)) ? {wire7} : $signed(wire0))} ?
          $unsigned((&(|wire5))) : wire2[(3'h4):(3'h4)]) | {wire1[(2'h3):(2'h2)],
          $signed(((wire3 >> (8'hac)) ? $signed(wire1) : $unsigned(wire5)))});
      reg10 <= wire3[(4'h8):(3'h4)];
      reg11 <= $signed($unsigned(wire1));
      if ($signed($signed(($unsigned((wire1 ?
          wire1 : reg11)) ^~ $unsigned(wire4)))))
        begin
          reg12 <= (reg10[(4'hc):(4'ha)] <= $unsigned((wire0[(1'h1):(1'h1)] <<< reg11)));
          if ((+$signed(($signed(wire8) ? (8'ha4) : {$unsigned(reg12)}))))
            begin
              reg13 <= wire7[(3'h5):(1'h0)];
              reg14 <= ({wire8,
                  (+($signed(reg9) < (reg11 >>> wire7)))} ^ (|$signed($signed((~^wire6)))));
              reg15 <= wire6[(1'h1):(1'h1)];
            end
          else
            begin
              reg13 <= (~&(8'had));
            end
        end
      else
        begin
          if ((~&($unsigned(($signed(wire1) ?
              (~(7'h40)) : (wire4 | wire6))) >>> reg11[(3'h6):(3'h5)])))
            begin
              reg12 <= (((~|wire1[(3'h5):(2'h3)]) ?
                      $signed(wire0[(3'h7):(3'h7)]) : (reg12 ?
                          $signed(wire5) : reg14[(3'h5):(3'h4)])) ?
                  $signed((wire2 * (|(reg13 ?
                      reg14 : wire6)))) : ((wire1 && {{reg13,
                          wire8}}) - $unsigned({wire3[(2'h3):(1'h1)]})));
            end
          else
            begin
              reg12 <= ($unsigned((({reg13, wire0} == (|wire6)) != (^{wire5,
                      (8'hb3)}))) ?
                  $signed($unsigned(((wire4 < (8'ha4)) < (!reg9)))) : {$signed($signed($unsigned(wire7)))});
              reg13 <= (^(8'hb3));
              reg14 <= reg13[(1'h0):(1'h0)];
            end
          reg15 <= {wire1,
              (({$signed(reg15)} ?
                  $unsigned((reg11 * wire3)) : ($signed(wire2) ?
                      (~|wire4) : reg11)) ^ wire5)};
          if ($unsigned($signed($unsigned(($unsigned(reg9) ?
              {(7'h43), (8'h9e)} : ((8'hbc) ? wire8 : (8'hbd)))))))
            begin
              reg16 <= (reg15 ? reg15 : (8'hb8));
            end
          else
            begin
              reg16 <= (^~wire1[(1'h1):(1'h1)]);
            end
          reg17 <= reg13[(1'h1):(1'h0)];
        end
      reg18 <= (!{(!reg17)});
    end
  assign wire19 = (~reg16);
  assign wire20 = ($unsigned((((reg12 | reg18) ?
                      {wire2} : reg10) - $signed((reg14 ?
                      (8'had) : reg13)))) + (!reg14));
  assign wire21 = $unsigned(wire1);
  assign wire22 = (wire20 ~^ $unsigned(((^~(&reg17)) ?
                      wire2[(2'h2):(1'h1)] : ($unsigned((8'hb7)) ?
                          (reg13 == (8'hb0)) : reg13))));
  module23 #() modinst96 (.wire28(reg10), .wire24(wire1), .y(wire95), .wire26(reg15), .clk(clk), .wire27(reg13), .wire25(wire20));
  assign wire97 = ((wire95[(1'h1):(1'h1)] ? reg15 : wire8[(1'h0):(1'h0)]) ?
                      $signed(($signed($signed(wire21)) ?
                          $signed(wire20[(5'h11):(2'h3)]) : reg10)) : (!(($unsigned(reg18) ?
                          ((8'h9e) && wire8) : (reg9 ^ reg13)) >= $signed(((8'hab) ?
                          reg17 : reg14)))));
  assign wire98 = $unsigned(((^~$unsigned($unsigned(wire4))) ?
                      reg18 : $unsigned(reg9[(4'ha):(4'ha)])));
  assign wire99 = reg15[(3'h5):(3'h4)];
endmodule

module module23
#(parameter param93 = (((((^~(8'ha6)) >>> {(7'h40), (8'hbf)}) << (|((8'ha6) ~^ (7'h42)))) ? (~|(8'hb4)) : {(((8'hb0) ? (8'hb9) : (8'haf)) ? (^~(8'ha6)) : ((8'hb9) || (7'h41)))}) >= ((((&(8'ha3)) < (8'hb0)) != ((!(8'haf)) ? ((8'ha8) ? (8'hbc) : (8'ha1)) : {(8'h9c)})) ? ({{(8'had), (8'ha0)}} >> (8'hb0)) : (^~(|((8'hb4) ? (8'hb9) : (8'hb1)))))), 
parameter param94 = (8'h9c))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire [(5'h11):(1'h0)] wire27;
  input wire signed [(4'hb):(1'h0)] wire26;
  input wire [(5'h10):(1'h0)] wire25;
  input wire [(4'h9):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire29;
  reg [(5'h13):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire76,
                 wire29,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  assign wire29 = $signed($unsigned((($unsigned(wire25) ?
                          wire27[(2'h2):(1'h0)] : {wire27, wire26}) ?
                      (-wire27[(3'h6):(1'h0)]) : $signed({wire24}))));
  always
    @(posedge clk) begin
      reg30 <= wire25;
      reg31 <= wire24;
      reg32 <= wire24;
    end
  module33 #() modinst77 (.wire38(wire28), .wire34(wire29), .clk(clk), .wire37(reg32), .wire36(wire26), .y(wire76), .wire35(wire27));
  assign wire78 = ((~|$signed({(-(8'ha3)), wire27})) ?
                      (+(($unsigned(reg30) & $unsigned(reg30)) ?
                          ($unsigned(wire25) << wire28) : {(8'ha6)})) : wire27[(4'he):(3'h7)]);
  assign wire79 = $signed(((wire29 ? reg32 : wire76) * ($unsigned((wire76 ?
                          (8'ha3) : wire28)) ?
                      wire24[(3'h4):(3'h4)] : ((wire27 >>> wire28) & (wire24 ?
                          wire76 : wire78)))));
  assign wire80 = $unsigned({(+(8'ha3))});
  always
    @(posedge clk) begin
      reg81 <= ((($signed($signed(wire24)) ?
              $signed((reg32 + wire80)) : (((8'hbf) ?
                  reg30 : wire24) == ((8'ha2) == wire26))) < (8'had)) ?
          $signed(reg30[(2'h3):(2'h2)]) : wire27);
      reg82 <= wire80[(1'h0):(1'h0)];
      if ((!{$unsigned(reg31)}))
        begin
          reg83 <= {{((~|wire29) ?
                      $signed(wire24) : ((8'hb9) ?
                          (reg32 ? wire78 : wire24) : wire79)),
                  (((-reg82) + (wire79 ? wire28 : (8'hae))) ?
                      reg81[(3'h4):(1'h0)] : reg82[(4'h8):(3'h4)])}};
          reg84 <= (8'hb7);
          if ((((~^reg81[(3'h7):(1'h1)]) ? reg31 : (8'ha3)) ?
              ((8'hbf) ?
                  $signed(((^~reg83) ?
                      reg30[(5'h13):(1'h1)] : $signed((7'h40)))) : {(8'had)}) : ($signed($signed(reg30[(4'hd):(3'h5)])) ?
                  reg84[(4'he):(4'he)] : (~^(~(wire25 ? wire76 : reg83))))))
            begin
              reg85 <= {$signed(reg83)};
              reg86 <= $unsigned(wire29);
              reg87 <= $signed((wire28[(4'hc):(3'h5)] ?
                  reg83[(2'h3):(2'h2)] : $unsigned(reg84[(3'h4):(2'h2)])));
              reg88 <= ({$unsigned($signed($unsigned((8'hbe)))),
                      $signed({(reg85 - reg86)})} ?
                  $signed(((!(-wire27)) & (wire78 ?
                      (reg31 >= wire79) : $signed(reg82)))) : reg82);
            end
          else
            begin
              reg85 <= wire29;
              reg86 <= $signed(((~reg82) != wire79[(1'h1):(1'h1)]));
              reg87 <= (+reg32);
            end
        end
      else
        begin
          if (reg88)
            begin
              reg83 <= ($signed($signed((reg30[(4'h9):(4'h8)] ?
                  $signed((8'hac)) : $unsigned((8'hbf))))) ~^ ((((!reg81) < (8'h9f)) || reg82) | $unsigned($unsigned({reg32}))));
              reg84 <= (({reg88} ?
                  wire26 : wire25) == (($unsigned(reg30[(3'h7):(2'h3)]) < (wire25[(2'h2):(1'h1)] ?
                  (~^wire27) : wire24)) | (|$signed(reg87[(3'h7):(1'h0)]))));
              reg85 <= reg30;
              reg86 <= $signed((reg82 ?
                  $signed(reg88[(3'h7):(1'h0)]) : wire80[(2'h3):(1'h1)]));
            end
          else
            begin
              reg83 <= $unsigned({(|reg82), (8'haa)});
              reg84 <= wire26;
            end
          if ((8'ha9))
            begin
              reg87 <= ({reg84[(4'hb):(1'h1)]} <<< ((reg88[(2'h3):(2'h3)] ?
                  ((^reg86) ?
                      $unsigned(reg81) : {reg87,
                          wire24}) : $signed($signed(wire25))) <= $unsigned(((~&wire24) ?
                  $unsigned(wire79) : reg82))));
              reg88 <= ((!(8'ha5)) ?
                  ((8'hb3) ?
                      $unsigned((|(reg88 ^~ reg84))) : {($unsigned(wire78) ?
                              (7'h40) : reg31)}) : (^~((8'hbd) ?
                      (8'hb2) : ($unsigned(wire25) ?
                          reg32[(2'h3):(1'h1)] : $unsigned(wire27)))));
              reg89 <= ((+(((wire28 ~^ (7'h42)) ? {reg86, wire24} : reg88) ?
                      ((wire26 ? wire29 : wire29) ?
                          (wire28 - reg30) : wire80) : (~&$unsigned(wire24)))) ?
                  {$signed($unsigned($signed(reg82)))} : {wire28,
                      ((reg87[(3'h5):(1'h1)] <= {wire79, reg82}) <= reg82)});
              reg90 <= reg30[(2'h3):(1'h0)];
            end
          else
            begin
              reg87 <= (~|($signed((|((8'ha9) || reg32))) || reg31));
              reg88 <= (8'hb4);
              reg89 <= (wire27 ?
                  ($signed($unsigned(reg84)) - reg31) : ((wire80 ?
                          ((reg84 ? wire78 : (8'hb6)) ?
                              reg85 : $signed(reg89)) : reg81[(3'h6):(2'h2)]) ?
                      reg81 : {((wire29 * wire80) < wire29)}));
              reg90 <= (-reg82);
              reg91 <= ((($signed(reg84) ~^ wire76) < ($signed($signed(reg90)) ?
                      {(-(8'ha3))} : $signed((wire76 ? reg82 : wire26)))) ?
                  reg30 : (&((((8'h9f) ? reg31 : wire26) ?
                      (reg86 - (8'ha5)) : wire27) >= reg82[(3'h6):(3'h5)])));
            end
        end
      reg92 <= (&$unsigned(($signed(reg83[(3'h5):(2'h3)]) ?
          reg32 : $unsigned(reg30))));
    end
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire signed [(3'h5):(1'h0)] wire36;
  input wire [(5'h11):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire39 = {wire34};
  assign wire40 = wire38;
  assign wire41 = ((8'ha3) ? wire37 : $signed(wire34));
  assign wire42 = {($signed(((~&wire41) <= $unsigned(wire39))) == wire38[(3'h4):(2'h3)]),
                      ($signed(wire37[(2'h2):(1'h0)]) ?
                          ((wire37[(3'h4):(1'h1)] ?
                                  (^~wire41) : wire34[(5'h13):(5'h12)]) ?
                              {{wire37, wire35}} : {wire36,
                                  $unsigned(wire38)}) : {wire39})};
  assign wire43 = ($unsigned((wire37[(3'h6):(3'h6)] ? wire40 : wire41)) ?
                      {(wire42 ?
                              {(!wire36)} : $unsigned((~&wire36)))} : (wire35[(4'hc):(3'h4)] || (!$signed((^~wire34)))));
  assign wire44 = wire37[(4'hb):(3'h5)];
  assign wire45 = (8'ha8);
  assign wire46 = wire45;
  assign wire47 = wire44;
  assign wire48 = ($unsigned($signed($unsigned((~&wire45)))) ?
                      wire47 : $signed(wire38[(4'ha):(3'h6)]));
  assign wire49 = ({{$unsigned($unsigned(wire48)),
                          $unsigned(wire35[(5'h11):(3'h4)])}} ^~ wire39[(4'hb):(3'h4)]);
  assign wire50 = {$signed({$signed((7'h42)), ((+wire40) << $signed(wire48))}),
                      wire39};
  assign wire51 = wire50[(3'h7):(2'h2)];
  assign wire52 = wire34[(2'h3):(2'h3)];
  assign wire53 = (wire52 ?
                      wire44 : {($signed($signed(wire43)) >> $unsigned((wire46 == (8'h9e)))),
                          (wire37 != $signed($unsigned(wire41)))});
  assign wire54 = $unsigned($unsigned((-((wire43 >= wire39) ?
                      (wire40 >>> wire36) : wire44[(3'h4):(1'h0)]))));
  assign wire55 = $signed($signed({($signed(wire35) ?
                          (wire49 >> (7'h41)) : wire34),
                      $unsigned((^wire39))}));
  assign wire56 = wire53;
  assign wire57 = wire49[(4'hf):(3'h6)];
  assign wire58 = ($unsigned((wire47[(3'h6):(1'h1)] != wire41)) ?
                      wire50 : (wire43 >> (-(~^$signed(wire48)))));
  always
    @(posedge clk) begin
      reg59 <= $unsigned((+{(wire34 ? $signed(wire34) : wire43[(3'h4):(1'h0)]),
          (wire48 == wire49)}));
      reg60 <= ((($signed($unsigned(wire47)) ?
              {(wire50 ? wire34 : wire42),
                  $unsigned(wire40)} : $unsigned(wire48)) - ((8'ha1) | (8'ha3))) ?
          wire52[(4'h8):(2'h2)] : ((^~(wire44[(2'h3):(2'h3)] - (-wire49))) ?
              {wire46[(4'h9):(3'h5)], (~|wire57[(1'h1):(1'h0)])} : wire50));
      if ($unsigned($unsigned((|((wire45 + (8'ha9)) ? (~wire56) : wire38)))))
        begin
          if (({((8'h9c) ?
                  (~^(wire40 ? (8'ha7) : wire52)) : ({wire35, wire38} ?
                      wire35[(4'h9):(3'h6)] : $unsigned(wire48))),
              (wire54 & ($signed(wire49) ~^ (~&(8'ha8))))} << (wire39[(3'h4):(1'h1)] ?
              wire58 : wire58[(4'h9):(1'h0)])))
            begin
              reg61 <= (~|{(+{wire57[(3'h4):(2'h2)]}),
                  (wire46[(3'h5):(1'h1)] ?
                      ({wire55, wire37} ?
                          wire42 : (wire48 || wire44)) : (!(~(7'h42))))});
              reg62 <= wire54;
              reg63 <= (8'hbf);
              reg64 <= (8'ha4);
              reg65 <= ((&((8'h9f) ~^ $unsigned(wire52[(1'h0):(1'h0)]))) ?
                  reg63 : (8'hb7));
            end
          else
            begin
              reg61 <= $unsigned($signed({((|reg64) ?
                      (wire45 ? wire35 : (8'ha0)) : $unsigned(wire41))}));
              reg62 <= ((8'h9d) && wire36);
              reg63 <= (~^(|$unsigned($unsigned($signed(wire42)))));
            end
        end
      else
        begin
          if (((8'hb3) ? reg60[(4'hb):(3'h7)] : wire57))
            begin
              reg61 <= ($unsigned({wire43[(1'h1):(1'h1)],
                  (reg59[(5'h11):(4'h8)] ?
                      $signed((8'hbf)) : (~|(8'hab)))}) == (^~wire48[(4'hd):(4'hc)]));
              reg62 <= $signed(wire34[(4'hf):(1'h1)]);
              reg63 <= reg61[(3'h5):(3'h4)];
            end
          else
            begin
              reg61 <= {((8'hbc) <= (^~reg63))};
              reg62 <= wire37[(1'h0):(1'h0)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg66 <= reg61;
      reg67 <= {wire43,
          ((wire44[(1'h0):(1'h0)] <<< $signed((reg60 ?
              reg66 : wire54))) & reg61)};
      if (($unsigned((((~wire56) ?
              (8'hba) : $unsigned(wire37)) ^ ((wire57 ^~ wire46) ?
              $signed(wire45) : (reg59 || wire53)))) ?
          (&($signed((reg67 & wire58)) * $signed((wire57 - reg66)))) : (-$signed(($unsigned(wire50) - $signed(wire46))))))
        begin
          reg68 <= wire58;
          reg69 <= {reg60[(1'h0):(1'h0)]};
          reg70 <= wire58;
        end
      else
        begin
          if (reg63[(3'h7):(1'h0)])
            begin
              reg68 <= {$signed($signed($unsigned((~wire43))))};
              reg69 <= ((|reg68) ?
                  $unsigned({(|wire50)}) : $unsigned(($unsigned((~^reg67)) ?
                      ($signed(reg67) > $unsigned(reg63)) : $signed((reg64 & (7'h42))))));
            end
          else
            begin
              reg68 <= $unsigned(reg68);
              reg69 <= {$signed((~&$signed($signed(wire45)))),
                  $signed((~&$signed((wire53 ? reg62 : (8'had)))))};
              reg70 <= $unsigned($unsigned((wire42 + (~&(reg60 ^~ reg65)))));
              reg71 <= wire46[(3'h6):(2'h3)];
            end
          if ({$unsigned(reg66)})
            begin
              reg72 <= reg71[(4'he):(4'hc)];
            end
          else
            begin
              reg72 <= $unsigned(((~|(~^reg72)) ?
                  {{(!(8'ha7))}} : {(reg68[(2'h2):(2'h2)] * wire41[(3'h4):(3'h4)])}));
            end
          reg73 <= (~&wire38[(2'h3):(1'h0)]);
        end
      reg74 <= (wire53 & (wire43 != (8'h9d)));
      reg75 <= ((reg72[(3'h4):(2'h3)] ?
          ($signed((!(8'hbe))) ?
              wire35[(4'h9):(3'h5)] : $unsigned((wire45 >> wire57))) : $unsigned(wire48[(3'h6):(1'h0)])) || (((~$unsigned(wire48)) >= {(reg68 == wire50),
          (^wire58)}) == ($unsigned($unsigned(wire50)) ?
          reg60 : wire46[(4'h8):(4'h8)])));
    end
endmodule
