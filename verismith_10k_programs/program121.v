module top
#(parameter param154 = ((8'h9e) << (-((|((8'ha5) ? (8'ha3) : (8'ha5))) ? ({(8'haa), (8'hb3)} | ((8'ha7) > (8'hb9))) : (((8'hb7) && (8'had)) ? ((8'haa) ? (8'hb7) : (7'h43)) : ((8'hac) ^~ (8'h9f)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(3'h6):(1'h0)] wire151;
  reg signed [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire91,
                 wire93,
                 wire94,
                 wire95,
                 wire96,
                 wire151,
                 reg153,
                 reg8,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire1[(3'h6):(3'h6)];
  assign wire6 = wire3[(4'ha):(3'h4)];
  assign wire7 = wire3[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg8 <= (((~&(wire2[(2'h2):(2'h2)] ^ wire5[(3'h7):(3'h7)])) ?
          wire1 : {wire7}) == $signed({$unsigned($signed(wire6))}));
    end
  assign wire9 = wire4;
  module10 #() modinst92 (wire91, clk, wire4, wire1, wire9, reg8, wire6);
  assign wire93 = {wire3};
  assign wire94 = (|({{(-wire93)}} ~^ reg8));
  assign wire95 = wire93[(2'h3):(1'h0)];
  assign wire96 = (~$unsigned((8'hb7)));
  module97 #() modinst152 (wire151, clk, wire2, wire4, wire96, reg8);
  always
    @(posedge clk) begin
      reg153 <= ((wire151[(2'h2):(1'h1)] ?
              (~|(-wire95[(4'he):(4'hb)])) : (($unsigned(wire3) ?
                      wire1[(2'h2):(1'h0)] : (~|(8'hab))) ?
                  ((wire9 + wire3) ^~ reg8) : wire5[(1'h1):(1'h1)])) ?
          (^~(($unsigned(reg8) ?
              (8'h9c) : wire91) && $unsigned(wire1))) : (wire9[(5'h10):(4'hd)] != wire151[(3'h5):(1'h1)]));
    end
endmodule

module module97
#(parameter param149 = ((&{{((8'hb2) ? (8'hbe) : (8'ha0))}}) != ((~(~|((8'had) <= (8'h9c)))) != ({(|(8'ha3)), (!(8'hbb))} - (((8'ha2) ? (8'hb6) : (8'hb9)) == ((8'hb5) ? (8'ha0) : (8'ha2)))))), 
parameter param150 = param149)
(y, clk, wire98, wire99, wire100, wire101);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire98;
  input wire signed [(3'h6):(1'h0)] wire99;
  input wire [(3'h6):(1'h0)] wire100;
  input wire [(5'h11):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire146;
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  assign y = {wire148,
                 wire102,
                 wire103,
                 wire104,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire146,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 (1'h0)};
  assign wire102 = $signed(((!(wire99[(3'h6):(1'h0)] != (wire99 || wire99))) ?
                       wire101[(2'h3):(2'h3)] : wire101));
  assign wire103 = wire101;
  assign wire104 = $signed((!(wire102[(3'h5):(2'h2)] ?
                       {wire100[(3'h5):(1'h0)]} : (|$unsigned(wire101)))));
  always
    @(posedge clk) begin
      reg105 <= wire98[(4'he):(3'h7)];
      reg106 <= ((wire98[(2'h3):(2'h2)] ?
              $signed($signed(wire102[(4'hc):(3'h4)])) : $signed((wire98 && (wire102 + wire99)))) ?
          $unsigned(((~wire101[(4'hc):(4'h8)]) > wire101[(2'h3):(1'h0)])) : ((wire104[(1'h1):(1'h0)] << ($signed(wire98) || $signed(wire99))) > wire100));
      reg107 <= (!(wire99 ?
          $unsigned(reg106[(4'hb):(1'h0)]) : (|wire104[(3'h4):(2'h2)])));
      reg108 <= (^~{$signed((8'ha6))});
    end
  assign wire109 = $unsigned((~wire98));
  assign wire110 = (8'ha2);
  assign wire111 = ((8'h9c) > ($signed($signed($signed(reg106))) * (wire101 | $unsigned({reg105}))));
  assign wire112 = wire100[(2'h2):(1'h0)];
  assign wire113 = (8'ha1);
  assign wire114 = {wire104[(3'h7):(2'h2)]};
  assign wire115 = $unsigned((wire109[(1'h0):(1'h0)] <<< ($signed((^(8'h9f))) <= wire98)));
  module116 #() modinst147 (.clk(clk), .wire118(wire113), .y(wire146), .wire120(reg105), .wire121(reg108), .wire117(wire99), .wire119(wire115));
  assign wire148 = (((wire114[(3'h5):(2'h2)] ?
                           (!$unsigned(reg106)) : reg106[(4'ha):(3'h6)]) - $unsigned(wire104)) ?
                       (!(({wire102} >> (wire101 ? wire101 : wire113)) ?
                           ((~^wire115) == (reg106 ?
                               wire115 : wire102)) : wire100[(3'h6):(3'h5)])) : $signed((reg108[(2'h3):(1'h1)] >= (~|wire110[(4'h9):(3'h4)]))));
endmodule

module module10
#(parameter param89 = (({(8'ha0)} ? ((^((8'hb1) <<< (8'hb3))) >> (~^(|(8'hb7)))) : (8'hb1)) || (((~^(~|(8'hbb))) & ((~&(8'haa)) <<< ((8'h9c) ? (8'h9f) : (8'hba)))) <= ((|((8'hb8) << (7'h43))) > ((8'ha7) ? ((8'h9d) ? (8'ha0) : (8'h9e)) : ((8'hb2) ? (7'h44) : (8'ha2)))))), 
parameter param90 = {(8'hb3)})
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire35;
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  assign y = {wire88,
                 wire86,
                 wire52,
                 wire51,
                 wire35,
                 reg53,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  module16 #() modinst36 (.wire18(wire15), .clk(clk), .wire19(wire13), .y(wire35), .wire17(wire12), .wire20(wire11));
  always
    @(posedge clk) begin
      reg37 <= wire35[(1'h1):(1'h0)];
      reg38 <= (wire14 ~^ (^((wire35 << ((8'ha3) ? wire11 : (8'hbb))) ?
          ($signed(reg37) * (~|wire12)) : $unsigned(wire35[(1'h1):(1'h1)]))));
      reg39 <= $signed(wire14);
      if (reg37)
        begin
          reg40 <= {(7'h41), wire12};
          if (reg40)
            begin
              reg41 <= (~|wire14[(1'h0):(1'h0)]);
            end
          else
            begin
              reg41 <= ($signed($signed((8'hba))) ?
                  reg40[(3'h5):(3'h4)] : {wire14[(3'h7):(2'h3)]});
              reg42 <= ($signed((~|{reg40})) >>> reg37[(4'hb):(4'hb)]);
              reg43 <= wire35;
            end
          if (wire14[(3'h7):(3'h6)])
            begin
              reg44 <= (wire12 <= reg43);
              reg45 <= ((wire14[(3'h5):(3'h4)] | $signed(reg41)) ?
                  $signed((({wire35} ?
                      (reg38 <= reg38) : wire12[(1'h1):(1'h0)]) * (~reg39))) : {(-(wire12 != $signed((7'h44)))),
                      {{(^~(7'h40))}}});
            end
          else
            begin
              reg44 <= ((reg42[(2'h2):(2'h2)] ?
                  $signed(($unsigned(wire14) * wire35)) : reg40) ^~ $unsigned(({reg39[(1'h0):(1'h0)]} ~^ wire12)));
              reg45 <= ((reg45[(4'hc):(2'h2)] ?
                  reg38 : ($signed((!(8'had))) ?
                      $unsigned((reg40 <<< reg37)) : $signed((wire11 ?
                          reg42 : reg44)))) < reg40);
              reg46 <= (((8'ha4) >> ($signed((~|(7'h43))) || {(reg43 == reg38)})) || wire12[(4'h8):(3'h4)]);
              reg47 <= reg41;
            end
          reg48 <= reg39;
          reg49 <= $signed((8'h9f));
        end
      else
        begin
          reg40 <= $signed((($signed({wire15}) == ($unsigned((8'ha2)) >= reg43)) ?
              $signed($unsigned(reg40[(1'h1):(1'h0)])) : (({reg37,
                  wire13} <= (^~reg37)) >> ($unsigned((8'ha1)) ?
                  $unsigned(reg39) : ((8'hbd) ? reg44 : (7'h41))))));
          if (($signed((~reg49)) != $signed({((reg43 ? reg39 : wire15) ?
                  $unsigned(wire11) : $unsigned((8'hbe)))})))
            begin
              reg41 <= reg43;
              reg42 <= reg49[(4'hc):(3'h4)];
              reg43 <= (&(reg37[(2'h2):(1'h0)] ? wire13 : $signed((^~reg45))));
              reg44 <= {reg43[(1'h0):(1'h0)]};
              reg45 <= $signed($unsigned({reg46[(3'h6):(2'h3)],
                  $unsigned((~^reg46))}));
            end
          else
            begin
              reg41 <= (~&$signed(wire12));
              reg42 <= $unsigned(($signed({$unsigned(reg45), (|reg38)}) ?
                  (8'h9c) : ($unsigned($unsigned(reg45)) ?
                      $signed((&wire11)) : (reg41[(2'h2):(1'h0)] | reg42))));
              reg43 <= {(~reg41[(4'hb):(4'h8)]),
                  $unsigned(($signed($unsigned(reg41)) ?
                      ($signed(wire14) ?
                          (reg44 + (8'haf)) : wire15[(4'hb):(3'h7)]) : (wire35 ?
                          $unsigned(wire35) : wire14[(1'h1):(1'h1)])))};
              reg44 <= wire15;
              reg45 <= reg41[(3'h6):(2'h3)];
            end
          reg46 <= (reg47[(1'h0):(1'h0)] >= reg39);
        end
      reg50 <= $signed($signed(wire12[(4'he):(3'h4)]));
    end
  assign wire51 = (($unsigned((~reg47[(1'h1):(1'h0)])) ?
                      reg39[(4'h9):(3'h7)] : (|$signed((|reg47)))) - ($signed((8'hb1)) == (~^{((8'ha6) + wire15)})));
  assign wire52 = wire15;
  always
    @(posedge clk) begin
      reg53 <= (~^(((+reg42[(1'h1):(1'h0)]) ^~ wire13[(1'h0):(1'h0)]) | ($signed((wire13 ?
              (8'ha4) : reg46)) ?
          ((wire13 ? reg39 : reg42) >>> (~&reg47)) : wire35)));
    end
  module54 #() modinst87 (wire86, clk, wire11, wire52, reg48, reg50);
  assign wire88 = ((wire11 <= $unsigned($signed((reg38 ?
                      reg41 : reg37)))) > reg48[(4'h8):(2'h3)]);
endmodule

module module54
#(parameter param85 = {((!{(&(8'ha1))}) ? ((8'h9e) ? {((8'hb5) ? (8'hb8) : (8'h9e))} : (|(~(8'h9c)))) : (8'hab))})
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire58;
  input wire [(3'h6):(1'h0)] wire57;
  input wire signed [(2'h2):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire82;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire68;
  wire signed [(4'he):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(4'hf):(1'h0)] wire63;
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire73,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg75,
                 reg74,
                 reg71,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= wire58;
      reg60 <= $signed($unsigned(({(~&wire57)} >> reg59)));
      reg61 <= (wire57 ?
          (8'hb2) : $unsigned((($unsigned(wire57) ?
                  $unsigned((8'ha1)) : (reg59 ? wire57 : (7'h42))) ?
              {(wire56 ? wire58 : reg59)} : $unsigned((wire55 ?
                  reg60 : reg60)))));
      reg62 <= ($unsigned(wire55[(4'hc):(4'h8)]) ^~ (8'hbc));
    end
  assign wire63 = $signed(reg59);
  assign wire64 = $unsigned(((~((^wire63) >= (reg62 && reg60))) && ((reg61 >> ((8'hbf) ?
                          reg61 : reg61)) ?
                      (wire56[(1'h0):(1'h0)] <= (~|wire58)) : $signed($unsigned(reg59)))));
  assign wire65 = wire58[(4'hd):(4'hc)];
  assign wire66 = reg61[(4'hf):(3'h4)];
  assign wire67 = ($unsigned((~^$signed($signed(reg60)))) != (&(^~wire58[(4'h9):(2'h3)])));
  assign wire68 = reg62;
  assign wire69 = reg62;
  assign wire70 = ((^$unsigned(((wire69 ? wire65 : wire63) ?
                      $signed(reg61) : wire69))) != (|{$unsigned((~|(8'haa))),
                      (+$signed(wire57))}));
  always
    @(posedge clk) begin
      reg71 <= $signed($signed((reg62 <= (^(reg61 > wire65)))));
    end
  assign wire72 = $signed((+(^~$signed(reg60))));
  assign wire73 = {$unsigned(wire69[(3'h7):(1'h1)])};
  always
    @(posedge clk) begin
      if (($signed((^wire65[(4'hb):(1'h1)])) >> ({$unsigned((wire65 && wire58))} < reg60[(1'h0):(1'h0)])))
        begin
          reg74 <= {$unsigned((~^(wire66[(5'h12):(5'h12)] | wire57)))};
        end
      else
        begin
          reg74 <= wire72[(1'h1):(1'h1)];
        end
      reg75 <= (($signed(reg71) ?
          {(|wire55), $unsigned((&reg62))} : $signed(reg60)) == reg60);
    end
  assign wire76 = (wire55 ?
                      ((({(8'hb2), wire70} ?
                              ((8'hbb) ?
                                  (8'hb7) : wire63) : (|wire55)) + $signed((wire69 >>> wire65))) ?
                          wire65[(4'h8):(3'h7)] : {wire69,
                              {(!wire56)}}) : $signed($unsigned(((reg59 < wire69) ?
                          (reg60 ? reg61 : wire65) : wire63[(4'hf):(3'h6)]))));
  assign wire77 = $signed((wire56 ?
                      wire63 : $unsigned((wire73 >> (wire63 ?
                          wire66 : reg59)))));
  assign wire78 = wire69;
  assign wire79 = (~^wire70);
  assign wire80 = wire70;
  assign wire81 = $signed(({$unsigned(reg61)} << ($signed({wire80}) <= wire73[(4'hc):(3'h6)])));
  assign wire82 = (|$signed((-(~(~wire72)))));
  assign wire83 = ((~&wire64[(4'hb):(2'h2)]) << ($signed($signed($signed(wire79))) << $unsigned($unsigned(wire58[(3'h5):(3'h4)]))));
  assign wire84 = wire64[(3'h6):(1'h1)];
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire23,
                 wire22,
                 wire21,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire21 = (^$signed((($unsigned((8'hbf)) == {wire20,
                      wire20}) >>> {$unsigned(wire17), (-wire19)})));
  assign wire22 = $signed((^wire19[(2'h2):(1'h1)]));
  assign wire23 = (~(wire21[(3'h4):(2'h3)] ^ $unsigned(wire19)));
  always
    @(posedge clk) begin
      reg24 <= wire19;
      if ((reg24 ^~ (wire18[(3'h6):(1'h0)] ? wire21 : wire23[(2'h3):(2'h2)])))
        begin
          reg25 <= ($signed({{{(8'hac), wire23},
                  reg24[(3'h4):(3'h4)]}}) << ($unsigned($unsigned((~wire23))) * (~&wire19[(2'h2):(1'h1)])));
        end
      else
        begin
          if ({wire21,
              ((($unsigned(wire17) == (~^wire17)) ?
                  $signed((reg24 ^~ reg25)) : wire21[(4'h8):(1'h1)]) * {((wire19 ?
                      (8'h9e) : wire22) | $signed(reg24))})})
            begin
              reg25 <= $signed($signed({{wire22[(1'h1):(1'h1)],
                      {wire19, wire23}}}));
              reg26 <= $unsigned({wire23});
              reg27 <= wire18;
            end
          else
            begin
              reg25 <= reg25;
            end
        end
      reg28 <= $unsigned(((wire23 <= $unsigned(wire17)) ^~ wire23));
    end
  assign wire29 = $signed({($signed((wire19 ? wire19 : reg24)) ?
                          ((wire20 >>> reg26) ?
                              reg25 : $signed(wire23)) : reg27)});
  assign wire30 = $signed(wire23[(1'h1):(1'h1)]);
  assign wire31 = $signed((!(-((reg26 > (8'hbf)) - (8'had)))));
  assign wire32 = reg25;
  assign wire33 = (reg24 ?
                      wire29 : ($signed(((8'h9d) < (&wire19))) <= reg25[(3'h6):(3'h5)]));
  assign wire34 = (&((&$signed((~^wire33))) ?
                      (((reg27 != wire32) * wire17[(3'h4):(3'h4)]) ?
                          $unsigned($unsigned(wire22)) : (^wire17)) : $signed({$unsigned(wire29),
                          (^~wire30)})));
endmodule

module module116
#(parameter param144 = ({(7'h43)} ~^ (~^(~|(~^(~&(8'haa)))))), 
parameter param145 = param144)
(y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire121;
  input wire signed [(2'h3):(1'h0)] wire120;
  input wire [(2'h2):(1'h0)] wire119;
  input wire [(4'ha):(1'h0)] wire118;
  input wire [(3'h5):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire138;
  wire [(4'he):(1'h0)] wire137;
  wire signed [(5'h14):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(4'hd):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire [(4'he):(1'h0)] wire130;
  wire signed [(5'h14):(1'h0)] wire129;
  wire [(3'h7):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 reg140,
                 reg139,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire122 = {wire120[(1'h1):(1'h0)]};
  assign wire123 = ({((((8'hb6) >= (8'had)) ?
                           $unsigned(wire118) : (wire118 ?
                               wire118 : wire118)) ^~ wire120),
                       $unsigned(wire121[(2'h2):(1'h1)])} && (8'hb2));
  always
    @(posedge clk) begin
      reg124 <= ($signed((-((wire121 != (8'ha6)) ~^ (wire122 * wire117)))) * wire118);
      reg125 <= wire120;
      reg126 <= (!(8'hba));
      reg127 <= (&($unsigned($unsigned({reg125})) != $signed(wire117[(1'h1):(1'h1)])));
    end
  assign wire128 = (reg126 ?
                       $signed((8'ha0)) : $unsigned(wire123[(4'he):(1'h0)]));
  assign wire129 = (8'hb3);
  assign wire130 = $signed((($signed($signed(reg124)) ?
                       wire129 : (7'h41)) ^ (^{(wire117 >= (8'hbe)),
                       (wire120 ^ wire118)})));
  assign wire131 = $signed((^($unsigned({(8'hac)}) ?
                       $signed((reg126 >> wire128)) : $unsigned(wire122))));
  assign wire132 = $unsigned((!($signed((wire130 ? wire129 : wire118)) ?
                       $unsigned((wire121 ? reg125 : (8'haf))) : ((wire131 ?
                               wire129 : wire130) ?
                           (+wire119) : $signed(reg124)))));
  assign wire133 = (^~{($unsigned((~&(8'hb7))) ?
                           reg125[(3'h7):(3'h6)] : (~&$unsigned((8'hb4))))});
  assign wire134 = {(-wire117[(3'h4):(1'h1)])};
  assign wire135 = reg127[(4'he):(3'h5)];
  assign wire136 = {$signed($signed($unsigned($unsigned(wire123)))),
                       wire122[(4'hb):(4'ha)]};
  assign wire137 = $unsigned(wire132[(2'h2):(2'h2)]);
  assign wire138 = wire117[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg139 <= ($unsigned(wire118) ?
          {wire137} : (wire119[(1'h1):(1'h1)] * (~|wire137)));
      reg140 <= (wire123 ? wire138[(2'h3):(1'h1)] : wire118[(4'h9):(1'h1)]);
    end
  assign wire141 = $signed($signed(((|((8'hb8) != reg140)) != $unsigned({(8'h9f)}))));
  assign wire142 = (($signed((8'hb7)) ?
                       {$unsigned((reg126 >= wire137))} : ({(wire117 ?
                                   (8'ha8) : (8'hba)),
                               (reg126 >= (8'h9d))} ?
                           ($unsigned(wire119) + (wire134 & wire138)) : $unsigned($unsigned((8'hbb))))) >> ((((wire131 ?
                                   reg127 : wire141) ?
                               {(8'hb7)} : $unsigned((8'h9d))) ?
                           ($signed((8'hb4)) <= $signed(wire121)) : ({reg125,
                               wire119} < $signed(wire134))) ?
                       (reg139 != wire141[(3'h4):(3'h4)]) : wire122));
  assign wire143 = wire119[(1'h1):(1'h1)];
endmodule
