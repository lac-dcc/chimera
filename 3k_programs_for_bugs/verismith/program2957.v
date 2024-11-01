module top
#(parameter param110 = (~&(-((~&((8'hb1) >>> (8'h9c))) >> (((8'hb5) ? (8'h9c) : (8'ha0)) - ((8'h9e) & (8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire98;
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire98,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg20,
                 reg10,
                 (1'h0)};
  assign wire5 = {wire3, wire4};
  assign wire6 = (^($signed(wire4[(2'h3):(2'h3)]) ?
                     ((((8'h9c) < wire5) ?
                             wire4[(1'h0):(1'h0)] : wire2[(1'h0):(1'h0)]) ?
                         $signed((wire5 ? wire0 : wire5)) : (|(wire0 ?
                             (8'h9e) : wire3))) : wire2[(1'h1):(1'h0)]));
  assign wire7 = $signed(((~($unsigned(wire5) ~^ wire1)) ^~ wire4[(1'h0):(1'h0)]));
  assign wire8 = ((+$signed($unsigned((|wire4)))) ?
                     $signed({((wire5 == wire7) && wire2)}) : ((!((~&(8'hbb)) <<< $signed((8'hac)))) ?
                         (($unsigned(wire3) ^ (8'hbf)) >= {(wire5 <= wire1)}) : wire6));
  assign wire9 = ($unsigned(($unsigned((+wire6)) ?
                     (((7'h41) ?
                         wire0 : wire8) >>> {wire2}) : wire7[(3'h5):(2'h2)])) == $signed(($unsigned($signed(wire0)) ?
                     $signed(wire6) : (-$unsigned(wire7)))));
  always
    @(posedge clk) begin
      reg10 <= $unsigned(((8'hb1) ? $unsigned(wire1) : wire1));
    end
  assign wire11 = ($unsigned({(7'h44)}) << ((wire6 ^ (wire1 != (wire4 << wire0))) ?
                      (wire8 ? wire6 : (wire7 <<< (wire2 >> wire5))) : wire2));
  assign wire12 = ($unsigned((8'h9d)) - (wire1 ?
                      $signed({(wire2 <= wire3)}) : {(7'h40)}));
  assign wire13 = $unsigned(((~|(^~wire12)) ?
                      $unsigned($unsigned($unsigned(wire11))) : wire7));
  assign wire14 = {$signed(($unsigned($signed(wire4)) ?
                          {(!wire12)} : ($signed(wire3) ?
                              (!reg10) : (wire6 ? wire3 : reg10))))};
  assign wire15 = $signed({{$signed(wire2[(2'h3):(1'h1)])},
                      (wire13[(4'hb):(4'h8)] ?
                          wire6[(3'h7):(3'h5)] : (8'haa))});
  assign wire16 = ((((+(wire8 | (8'ha6))) - $unsigned((wire0 * wire12))) - ($unsigned($signed(wire14)) <<< $unsigned(((8'hab) ?
                      wire7 : wire3)))) ^ {(+wire5[(1'h0):(1'h0)])});
  assign wire17 = (~{(8'hbd)});
  assign wire18 = $unsigned(wire2[(1'h0):(1'h0)]);
  assign wire19 = wire4;
  always
    @(posedge clk) begin
      reg20 <= (-wire18);
    end
  module21 #() modinst99 (wire98, clk, wire19, wire13, wire4, wire18, wire3);
  assign wire100 = $unsigned((wire14[(2'h2):(1'h0)] ?
                       $unsigned(({wire15} - wire9[(2'h3):(2'h2)])) : wire14));
  assign wire101 = wire4;
  assign wire102 = wire4;
  assign wire103 = wire0;
  always
    @(posedge clk) begin
      if (($signed((|$unsigned($signed(wire100)))) ?
          (~&wire6) : (|($unsigned($signed(wire6)) & wire98[(4'hd):(1'h1)]))))
        begin
          reg104 <= {wire0[(3'h7):(3'h7)]};
          reg105 <= (^$unsigned($signed($unsigned((wire16 ? reg20 : wire7)))));
        end
      else
        begin
          if ((8'hac))
            begin
              reg104 <= $signed($signed((wire17 < ($unsigned(wire103) ?
                  $unsigned(wire1) : reg105[(3'h4):(1'h0)]))));
              reg105 <= $signed(wire102);
              reg106 <= ({(-(8'hb8)),
                  wire1} ^ (^$unsigned($signed($unsigned(wire4)))));
              reg107 <= wire7[(2'h2):(1'h1)];
              reg108 <= $unsigned($signed(($unsigned((~^wire16)) <<< ($unsigned(wire98) ?
                  (wire3 ? wire5 : (8'ha4)) : $signed(wire8)))));
            end
          else
            begin
              reg104 <= wire6[(3'h5):(1'h0)];
              reg105 <= $signed(((~&$signed((~^reg20))) ?
                  (reg107[(4'ha):(3'h6)] ?
                      {$unsigned(wire15),
                          (wire13 > wire98)} : ((reg10 & wire13) | (reg108 ?
                          wire98 : wire18))) : $signed(($signed(wire3) >= (wire9 >>> wire0)))));
              reg106 <= (((!$signed({wire15, reg107})) ?
                      reg20[(3'h6):(3'h5)] : wire18[(5'h12):(4'hc)]) ?
                  $signed((~^wire3[(1'h1):(1'h0)])) : $unsigned((&(!reg20[(2'h3):(1'h1)]))));
              reg107 <= $signed((^~wire16[(1'h0):(1'h0)]));
            end
          reg109 <= ($unsigned((~|wire5[(1'h1):(1'h1)])) ?
              (($signed((~&wire102)) ?
                  $unsigned($unsigned((8'haa))) : (&(&wire98))) << (~|{(8'ha8)})) : ($unsigned((wire9[(3'h7):(3'h5)] * (wire12 >>> wire1))) || (wire98 > $signed($unsigned((8'had))))));
        end
    end
endmodule

module module21
#(parameter param97 = (|(~^(~|(+((8'hbb) ? (8'hb6) : (8'hb0)))))))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire26;
  input wire signed [(3'h6):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire89;
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire74,
                 wire32,
                 wire27,
                 wire89,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire27 = wire24;
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire26);
      if (wire22[(4'hc):(3'h6)])
        begin
          reg29 <= $unsigned($unsigned($signed(wire24)));
          reg30 <= ((($unsigned(wire23[(1'h1):(1'h1)]) != (-(wire25 ~^ reg28))) << (~&$signed($unsigned((7'h41))))) >>> ($signed($unsigned($signed(wire24))) - $unsigned(((wire27 | wire27) ^~ wire23))));
        end
      else
        begin
          reg29 <= ($signed((reg28[(2'h2):(1'h1)] ?
                  (wire26 ?
                      ((8'ha3) ?
                          reg28 : (8'ha8)) : wire23[(1'h0):(1'h0)]) : $signed((reg29 << reg28)))) ?
              (&((~^(wire23 ? wire22 : wire24)) ?
                  ((reg29 ? reg29 : wire22) ?
                      (^reg29) : $signed((8'ha0))) : {(reg28 >>> (8'ha7))})) : (($unsigned($unsigned(wire27)) & wire23[(2'h3):(1'h1)]) ?
                  $signed(reg30[(3'h6):(3'h5)]) : ({{wire22}} - (7'h43))));
          reg30 <= reg29[(3'h6):(2'h2)];
          reg31 <= (^({({wire23, wire26} ?
                      wire27[(4'hc):(3'h4)] : (wire25 ? wire23 : wire24)),
                  wire23} ?
              (wire25[(2'h2):(1'h1)] < $unsigned($unsigned(wire24))) : ($signed(wire25) ?
                  ($signed((8'hbf)) ?
                      (wire22 ?
                          wire24 : reg30) : wire23[(1'h0):(1'h0)]) : reg28)));
        end
    end
  assign wire32 = $unsigned(reg29);
  module33 #() modinst75 (wire74, clk, wire32, wire26, wire23, reg29);
  module76 #() modinst90 (wire89, clk, reg28, wire23, wire27, wire74);
  assign wire91 = reg31[(2'h3):(1'h0)];
  assign wire92 = (|((^~wire25[(1'h0):(1'h0)]) ?
                      $signed((+{wire74,
                          wire24})) : ((reg30[(3'h7):(1'h1)] > (reg29 != wire74)) || reg28[(4'hc):(1'h1)])));
  assign wire93 = ($signed($unsigned(reg31)) >>> wire74);
  assign wire94 = ((8'h9f) ?
                      wire24 : ((8'ha1) | $unsigned($signed($signed(wire89)))));
  assign wire95 = wire22;
  assign wire96 = wire27[(4'he):(1'h1)];
endmodule

module module76
#(parameter param88 = (~^(+(|{((7'h40) | (8'ha8))}))))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire80;
  input wire [(2'h2):(1'h0)] wire79;
  input wire [(3'h4):(1'h0)] wire78;
  input wire [(5'h11):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  assign y = {wire87, wire86, wire85, wire84, wire83, wire82, wire81, (1'h0)};
  assign wire81 = wire78;
  assign wire82 = (wire78 || $signed({(~&(&wire80))}));
  assign wire83 = wire81[(1'h1):(1'h1)];
  assign wire84 = wire78;
  assign wire85 = (+(8'h9e));
  assign wire86 = wire78[(2'h3):(2'h3)];
  assign wire87 = $unsigned((+wire84[(4'ha):(2'h2)]));
endmodule

module module33
#(parameter param73 = (~&(|((((8'hbf) == (8'ha0)) < (8'ha2)) + ((~&(7'h42)) ? {(7'h40), (8'h9d)} : {(8'hbf)})))))
(y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire signed [(5'h14):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire52,
                 wire51,
                 wire50,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire38 = $signed(wire34);
  assign wire39 = wire37[(3'h6):(3'h4)];
  assign wire40 = wire37[(1'h1):(1'h0)];
  assign wire41 = (($unsigned(wire40) & (~&$signed((wire39 ?
                          wire40 : wire35)))) ?
                      (({wire38,
                          wire39[(1'h1):(1'h0)]} < wire36) * wire34[(1'h0):(1'h0)]) : wire39[(4'h9):(4'h9)]);
  assign wire42 = {$signed(wire41)};
  assign wire43 = ((~|(-(|(+wire39)))) ?
                      $unsigned((!((wire42 ? wire37 : (8'hbc)) ?
                          (~&wire39) : $unsigned(wire37)))) : (wire41[(3'h5):(1'h1)] >> {wire42[(1'h1):(1'h0)],
                          $unsigned($unsigned(wire39))}));
  assign wire44 = (~&(~|$signed((+wire43[(1'h1):(1'h1)]))));
  assign wire45 = {wire38[(4'ha):(4'h8)],
                      $unsigned($unsigned(wire39[(2'h3):(2'h3)]))};
  assign wire46 = (wire43[(3'h7):(1'h1)] ?
                      (((7'h41) ?
                          $unsigned($signed(wire44)) : ($signed((7'h44)) ?
                              (|wire41) : (wire44 & wire38))) || {(-wire45),
                          (wire40 ?
                              $signed(wire34) : (wire39 ?
                                  wire35 : wire36))}) : ($signed(wire35[(4'h8):(2'h2)]) | wire40[(3'h6):(2'h2)]));
  assign wire47 = wire43[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg48 <= $unsigned((~|((+wire44) > ($unsigned(wire37) ?
          wire39 : $signed(wire43)))));
      reg49 <= {($unsigned((7'h40)) ~^ wire43)};
    end
  assign wire50 = $signed($signed((7'h44)));
  assign wire51 = $unsigned($signed((^$unsigned((wire41 ? reg49 : (8'h9f))))));
  assign wire52 = (+wire35[(4'hc):(4'h8)]);
  always
    @(posedge clk) begin
      reg53 <= (wire45 ?
          $signed((((8'ha3) ? reg49[(3'h5):(3'h4)] : $unsigned(wire39)) ?
              (wire38 ?
                  ((8'hb1) * wire40) : $unsigned(wire50)) : $signed(wire41))) : $signed($signed(wire50[(3'h5):(2'h2)])));
      if (wire43)
        begin
          reg54 <= wire34;
          reg55 <= (wire35[(3'h6):(3'h5)] ?
              ({(wire45[(3'h7):(2'h2)] ? $signed((8'ha7)) : $signed(wire46))} ?
                  $signed((~^(reg49 ?
                      reg49 : (8'ha6)))) : wire42) : $signed(((~^{reg49,
                      (7'h42)}) ?
                  wire41[(4'hb):(4'h9)] : $unsigned((wire38 ?
                      (8'hb5) : wire44)))));
          reg56 <= {(~|(($unsigned(wire35) - (^~wire37)) && (!reg53[(3'h5):(1'h0)]))),
              wire51[(1'h0):(1'h0)]};
        end
      else
        begin
          if ((~(~|{$unsigned(reg56), (~^(~|wire36))})))
            begin
              reg54 <= $unsigned($signed({wire36, wire43[(1'h1):(1'h0)]}));
              reg55 <= wire41;
            end
          else
            begin
              reg54 <= (~^$signed($signed(((wire52 ? reg49 : reg48) ?
                  $signed(wire34) : wire42))));
              reg55 <= (~&((!(~|(wire39 ^~ wire39))) ?
                  (-wire51[(3'h7):(2'h2)]) : $signed(($signed(wire39) ?
                      wire42[(3'h6):(1'h1)] : (~&wire47)))));
              reg56 <= $unsigned(wire46);
            end
          reg57 <= reg55;
          reg58 <= reg55[(3'h4):(1'h0)];
          reg59 <= $signed(reg54[(4'h8):(3'h6)]);
        end
    end
  always
    @(posedge clk) begin
      if ((+((&$signed((reg59 ?
          reg55 : wire34))) > ($unsigned((wire40 | (8'haa))) || wire47[(4'h8):(3'h6)]))))
        begin
          if (($unsigned(wire50) - reg53))
            begin
              reg60 <= (wire36 ?
                  (!(((^~wire45) ~^ {wire52}) ?
                      $unsigned(reg59[(3'h6):(3'h6)]) : reg55[(1'h1):(1'h0)])) : ($signed(wire37) ?
                      $unsigned(wire42) : wire42[(1'h0):(1'h0)]));
              reg61 <= $unsigned($unsigned($unsigned({reg56[(2'h2):(2'h2)]})));
              reg62 <= $signed(((({reg58} ?
                      ((8'hbc) ?
                          reg60 : wire50) : $unsigned(wire44)) << $signed({wire46,
                      wire40})) ?
                  wire38 : (~^wire39)));
            end
          else
            begin
              reg60 <= reg48[(2'h2):(1'h0)];
              reg61 <= wire45;
              reg62 <= $signed($signed((~$unsigned(wire37[(3'h4):(1'h0)]))));
            end
        end
      else
        begin
          reg60 <= ((((+(wire34 + wire45)) == wire36) ?
              (!((~wire36) && wire38)) : $unsigned((-$unsigned((8'hae))))) - {{((wire34 ^ wire37) <<< wire43)},
              reg62[(3'h5):(2'h3)]});
          reg61 <= $signed((($signed((wire43 ?
                  wire42 : wire42)) <<< (!(reg57 ~^ reg53))) ?
              ($signed((reg54 ? wire34 : wire43)) ?
                  (8'hb0) : (|(reg62 >>> wire46))) : $unsigned((~&(wire38 ?
                  reg54 : reg48)))));
          reg62 <= (8'hbf);
        end
      if (wire45[(3'h7):(1'h0)])
        begin
          if ($signed((|reg49)))
            begin
              reg63 <= reg49;
              reg64 <= ((!(~|(~|reg63[(1'h0):(1'h0)]))) == (~reg59[(2'h3):(2'h3)]));
              reg65 <= wire34;
              reg66 <= wire38[(2'h2):(2'h2)];
            end
          else
            begin
              reg63 <= wire46[(1'h1):(1'h1)];
              reg64 <= reg62;
            end
          reg67 <= wire39;
          reg68 <= {(!$signed((+reg53[(2'h2):(2'h2)])))};
          reg69 <= $signed((-reg67));
          reg70 <= (&({(^reg63[(3'h7):(3'h4)])} ^~ ($signed((!(8'ha1))) >= reg64)));
        end
      else
        begin
          if ((^reg49))
            begin
              reg63 <= (!($unsigned({(wire51 && wire45), $signed(wire42)}) ?
                  ($unsigned($unsigned(reg58)) ^~ $unsigned((8'ha1))) : ($unsigned($signed(wire44)) ?
                      $signed(((8'hb9) ?
                          reg54 : reg60)) : $signed((wire39 >>> wire52)))));
              reg64 <= $unsigned($signed(wire43[(4'h9):(3'h6)]));
              reg65 <= ($unsigned(($unsigned({reg65, reg68}) ?
                      wire34[(4'hc):(1'h1)] : reg56)) ?
                  ((~&wire36) ^~ (|((~wire52) ?
                      (reg48 ? (8'hbd) : reg58) : ((8'hbe) ?
                          wire36 : reg68)))) : reg68);
            end
          else
            begin
              reg63 <= $signed($signed(wire35[(4'he):(2'h2)]));
              reg64 <= ($signed((((wire50 ?
                      wire50 : wire51) && $signed((8'hb3))) ?
                  ((8'hac) >>> (wire38 ?
                      wire47 : wire50)) : (~^(~^reg49)))) == {reg48});
            end
          reg66 <= (~($signed($signed($signed(wire40))) ?
              reg58 : (((reg48 << reg65) ?
                      ((8'had) <= wire47) : (reg70 < reg63)) ?
                  {(wire39 >= reg67)} : wire46)));
        end
    end
  assign wire71 = $signed($unsigned((~|((reg67 ? wire45 : (8'ha0)) ?
                      {reg67} : $signed(reg49)))));
  assign wire72 = ((~(~|$signed((8'ha2)))) - reg67);
endmodule
