module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire107;
  wire [(4'he):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(4'h8):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire103;
  wire [(3'h5):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire96;
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg99 = (1'h0);
  assign y = {wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire98,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire96,
                 reg109,
                 reg108,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire5 = (+wire1);
  assign wire6 = wire0;
  assign wire7 = ((^wire4[(3'h5):(3'h5)]) != $signed(({$unsigned(wire6)} <= {((8'hb3) ?
                         wire2 : wire2)})));
  assign wire8 = (({(^~(wire7 <<< wire7))} | wire3) ?
                     $signed((8'hb7)) : wire0[(4'hd):(4'ha)]);
  module9 #() modinst97 (.wire11(wire6), .wire14(wire5), .y(wire96), .wire13(wire4), .clk(clk), .wire12(wire2), .wire10(wire3));
  assign wire98 = ($signed($signed({$unsigned(wire6),
                      $unsigned(wire3)})) == wire3);
  always
    @(posedge clk) begin
      reg99 <= $unsigned((~&$signed(wire8[(3'h7):(1'h1)])));
      reg100 <= wire2;
      reg101 <= ($signed((~|wire4)) < wire6[(3'h5):(1'h0)]);
      reg102 <= $unsigned(reg99[(4'hd):(2'h2)]);
    end
  assign wire103 = $unsigned(reg99);
  assign wire104 = ($signed(($signed(wire5) ?
                       (wire98[(3'h5):(3'h4)] ?
                           wire5[(3'h6):(1'h1)] : wire2[(3'h4):(1'h0)]) : wire0)) ^~ ((^(wire5 & (wire8 | reg102))) == (wire96[(3'h4):(1'h1)] >> (~^wire8[(3'h5):(2'h3)]))));
  assign wire105 = ($unsigned($signed((~|(~^wire1)))) != ($unsigned($signed(wire98)) ?
                       $signed($unsigned((8'hb0))) : $signed($signed($unsigned(reg101)))));
  assign wire106 = wire104[(2'h2):(2'h2)];
  assign wire107 = $signed($signed($unsigned((&(wire4 ? reg102 : (7'h40))))));
  always
    @(posedge clk) begin
      reg108 <= ((~wire96[(4'h8):(3'h5)]) ?
          (~^(~^(reg100 ?
              $unsigned((8'had)) : $signed(wire106)))) : (reg99[(4'he):(4'he)] << {wire106}));
      reg109 <= (~^(reg99[(1'h1):(1'h1)] == (~((~|wire8) <<< reg101[(4'hf):(4'hb)]))));
    end
  assign wire110 = reg109[(2'h2):(2'h2)];
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire94;
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  assign y = {wire30,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire94,
                 reg41,
                 reg40,
                 (1'h0)};
  module15 #() modinst31 (wire30, clk, wire12, wire14, wire10, wire11);
  assign wire32 = wire10[(1'h0):(1'h0)];
  assign wire33 = ({{$signed($unsigned(wire32)), $signed($signed((8'hb8)))},
                      (($signed(wire11) - wire14[(5'h10):(4'hc)]) ~^ wire32)} - wire13);
  assign wire34 = ($signed((!wire13)) ?
                      (({$signed(wire32),
                              {wire32, (8'ha2)}} < wire30[(3'h4):(1'h1)]) ?
                          wire13 : {({wire13, wire10} ?
                                  (|wire12) : $signed((8'h9f)))}) : ($signed((wire33[(3'h5):(1'h1)] ?
                              (wire12 ? wire13 : wire12) : {(8'hae)})) ?
                          wire11[(1'h1):(1'h0)] : $signed($unsigned(wire11))));
  assign wire35 = wire12[(3'h4):(2'h3)];
  assign wire36 = (!$signed(wire34));
  assign wire37 = $signed((+$signed({(wire33 ? wire11 : (8'hb7))})));
  assign wire38 = wire12[(1'h1):(1'h1)];
  assign wire39 = wire10;
  always
    @(posedge clk) begin
      reg40 <= wire12;
      reg41 <= (wire13[(2'h3):(2'h2)] ?
          (&$signed(wire32)) : $signed($unsigned(((wire32 ?
              wire13 : wire37) <= wire12))));
    end
  assign wire42 = wire39[(4'h9):(1'h1)];
  assign wire43 = $unsigned(wire33);
  assign wire44 = (8'ha8);
  assign wire45 = ($unsigned(($unsigned(wire13[(4'ha):(4'h8)]) ?
                      wire43 : (~^((8'haa) ~^ wire33)))) >>> wire13[(3'h4):(2'h3)]);
  module46 #() modinst95 (wire94, clk, wire10, wire45, wire37, wire42, wire39);
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h204):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire50;
  input wire signed [(4'ha):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(4'hb):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg76,
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
                 (1'h0)};
  assign wire52 = $unsigned(($unsigned((~^wire49)) ?
                      (~^$signed((wire51 ? wire51 : wire48))) : (~(&wire51))));
  assign wire53 = $unsigned((~&$unsigned(((~^wire48) >= {wire48}))));
  assign wire54 = (wire49[(4'h8):(4'h8)] != (^~$unsigned(wire49)));
  assign wire55 = wire52[(4'hc):(4'ha)];
  assign wire56 = ((~((wire48[(4'h9):(3'h4)] ?
                          (wire51 ? wire52 : wire55) : (8'ha2)) ?
                      ((^~(8'haa)) ?
                          wire51[(2'h2):(1'h0)] : (wire50 ?
                              wire51 : (8'hbe))) : wire50[(2'h2):(1'h1)])) >>> (wire48[(4'hd):(1'h0)] < wire55));
  assign wire57 = $signed((wire48[(4'h8):(3'h7)] && $signed((8'hb1))));
  assign wire58 = wire55[(3'h7):(3'h4)];
  assign wire59 = wire50[(4'ha):(1'h0)];
  assign wire60 = wire52;
  assign wire61 = wire53[(2'h2):(2'h2)];
  assign wire62 = $signed({(!wire51[(4'hc):(3'h4)])});
  always
    @(posedge clk) begin
      if (wire53[(5'h11):(2'h3)])
        begin
          if ((8'ha8))
            begin
              reg63 <= $unsigned({(wire61[(3'h4):(3'h4)] & ((wire58 ?
                      (8'h9c) : (8'haa)) + $unsigned(wire60))),
                  wire54[(4'h9):(3'h4)]});
            end
          else
            begin
              reg63 <= (((($signed((8'hba)) != ((8'ha2) ? wire50 : wire58)) ?
                  reg63[(2'h2):(1'h0)] : (-$signed((8'hbc)))) || wire48[(1'h0):(1'h0)]) | reg63);
              reg64 <= (^~($signed((~|wire54)) <= $signed(wire59[(4'h8):(2'h3)])));
              reg65 <= (~(8'hbf));
            end
          reg66 <= $signed(({(wire53 * $unsigned(wire49)),
                  $unsigned(reg65[(4'hb):(4'ha)])} ?
              $unsigned($unsigned(((8'hb7) & wire56))) : (8'hb7)));
        end
      else
        begin
          if (wire50[(3'h4):(3'h4)])
            begin
              reg63 <= (wire62 ?
                  {(wire48 ?
                          ((~&(8'hae)) <<< $unsigned(wire62)) : wire47[(5'h11):(4'hd)])} : wire57);
              reg64 <= (&wire48[(3'h7):(3'h4)]);
            end
          else
            begin
              reg63 <= wire53[(2'h2):(1'h0)];
              reg64 <= (~&$unsigned(wire56));
              reg65 <= wire58[(2'h3):(1'h1)];
            end
          reg66 <= reg65[(4'ha):(2'h3)];
          reg67 <= $unsigned((wire62 ?
              (wire61 << wire55[(2'h3):(1'h0)]) : (reg66[(2'h2):(2'h2)] ^~ $signed((reg65 ^~ reg66)))));
        end
      reg68 <= $unsigned($signed(wire55));
      if (wire56[(4'ha):(1'h0)])
        begin
          reg69 <= (wire56[(3'h7):(2'h2)] ?
              reg67[(4'hb):(3'h7)] : (^{wire49, {reg64[(3'h6):(3'h6)]}}));
          reg70 <= ($unsigned(($unsigned((^~wire61)) ^ $unsigned($signed(wire47)))) << wire61);
          reg71 <= (wire52 ^~ reg64[(4'hf):(4'he)]);
          reg72 <= $signed($signed($signed({(wire50 ^ reg66)})));
        end
      else
        begin
          reg69 <= $unsigned((reg67[(1'h0):(1'h0)] * $signed($signed((~&wire60)))));
          reg70 <= (reg71 ?
              wire58[(1'h0):(1'h0)] : (wire53[(2'h2):(2'h2)] >> ((~^(wire52 || wire49)) * (!(reg65 ?
                  reg65 : wire61)))));
          if ((wire56[(1'h0):(1'h0)] ?
              ((((wire60 ? wire58 : (8'ha5)) > (wire50 ?
                      reg66 : (8'ha7))) + wire52[(5'h13):(3'h6)]) ?
                  wire50 : $signed(wire59)) : reg71))
            begin
              reg71 <= (~&{$unsigned($signed($signed(wire56))),
                  ((wire59[(4'hc):(4'h8)] ?
                      (wire51 << wire54) : $signed((7'h42))) <= (wire58[(2'h3):(2'h2)] >= wire58))});
              reg72 <= reg65[(3'h5):(1'h1)];
              reg73 <= (((^~(^~$signed(reg67))) < (wire56 << (wire57 ?
                  $unsigned(wire59) : wire60[(1'h0):(1'h0)]))) || (8'hb3));
              reg74 <= (~^(wire60[(1'h0):(1'h0)] ?
                  (($unsigned((8'ha6)) - wire60[(1'h0):(1'h0)]) ?
                      wire61[(4'h8):(1'h0)] : wire54[(4'h8):(2'h2)]) : ((~{(8'h9c),
                          reg70}) ?
                      ((wire51 ? wire54 : reg71) | wire59) : ((reg69 ?
                              (8'hab) : wire53) ?
                          (&wire55) : wire55[(4'h9):(1'h1)]))));
            end
          else
            begin
              reg71 <= wire61;
              reg72 <= (((^~((!wire61) ? (+wire56) : $signed(wire49))) ?
                      wire60 : ((8'hba) ^~ ($unsigned(reg74) ?
                          (wire48 != reg65) : reg70))) ?
                  wire53 : {$signed(((wire56 || reg69) >= $unsigned(reg67))),
                      (($signed(reg64) ? wire54 : (8'ha2)) ^ (8'ha2))});
              reg73 <= (8'h9c);
            end
          reg75 <= ($unsigned(wire55[(4'hf):(4'hb)]) || (wire59 <= (wire55 ?
              {{wire54}} : (^~(|wire52)))));
          reg76 <= $signed(wire48[(4'hf):(4'hd)]);
        end
    end
  assign wire77 = $unsigned($signed($unsigned((-$unsigned(wire58)))));
  assign wire78 = {(-(((&wire51) ? $signed(reg72) : $unsigned(reg72)) ?
                          ({wire77} ^ (^~(7'h41))) : (8'ha3)))};
  assign wire79 = wire78[(2'h2):(1'h0)];
  assign wire80 = (reg70[(1'h1):(1'h0)] ?
                      (^wire78) : (~^(^~reg74[(3'h7):(3'h4)])));
  assign wire81 = (wire49[(1'h1):(1'h0)] && $signed(($signed($unsigned(reg68)) ~^ (8'hb7))));
  assign wire82 = (8'h9e);
  always
    @(posedge clk) begin
      if ($signed(((~^$unsigned({reg76})) ?
          $signed($unsigned((^wire80))) : $unsigned($unsigned((8'ha9))))))
        begin
          reg83 <= $signed(wire48[(3'h5):(1'h1)]);
        end
      else
        begin
          reg83 <= wire53;
          if ($unsigned($signed(reg69[(3'h6):(3'h6)])))
            begin
              reg84 <= (wire60 ? reg70[(2'h3):(2'h2)] : reg65);
              reg85 <= reg74[(1'h1):(1'h1)];
            end
          else
            begin
              reg84 <= (8'ha5);
              reg85 <= ((($unsigned({wire51,
                  wire57}) || $signed((-reg67))) == $unsigned(wire80)) == reg68[(1'h0):(1'h0)]);
              reg86 <= (+(8'hb4));
              reg87 <= (wire80[(2'h2):(1'h1)] >>> {$unsigned($unsigned((reg70 & reg66))),
                  ($unsigned($signed(wire62)) ? wire79 : $signed((~&wire59)))});
              reg88 <= ($signed(($unsigned((+(8'hb1))) ?
                  ($unsigned(wire81) ?
                      $unsigned(reg87) : (wire81 >> wire61)) : ($unsigned(wire58) ?
                      wire58[(1'h0):(1'h0)] : (-(8'haa))))) <<< wire56[(4'h8):(4'h8)]);
            end
          reg89 <= wire49[(3'h7):(3'h5)];
        end
      reg90 <= $signed(($signed(reg85[(2'h2):(1'h1)]) == (~(reg67 ?
          wire82[(2'h3):(2'h2)] : $unsigned(wire60)))));
    end
  assign wire91 = (wire53[(4'h9):(3'h5)] != {{(8'haf)},
                      ((reg85[(3'h5):(1'h0)] ?
                          (^reg84) : (reg69 ? wire80 : reg69)) == ({wire50} ?
                          wire59 : {reg87}))});
  assign wire92 = $unsigned($signed((|(((8'ha6) ? wire61 : reg75) ?
                      reg90 : (reg65 <= reg83)))));
  assign wire93 = reg65;
endmodule

module module15
#(parameter param28 = {(~&((((8'hb2) ? (8'hbc) : (8'hbd)) ? {(8'hbc)} : ((8'hb2) - (8'hbf))) ? (((8'hb4) - (8'hbf)) <= ((8'hbd) > (8'hae))) : ({(8'hb1), (8'hb7)} ? ((8'hbc) ? (8'hb9) : (8'h9e)) : ((8'hbe) ? (8'hba) : (7'h41))))), (|(((8'hb9) ? {(8'hbc)} : (-(8'ha6))) ^ {(^~(8'ha5))}))}, 
parameter param29 = param28)
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(2'h2):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 (1'h0)};
  assign wire20 = ($unsigned($unsigned(((-wire16) == {wire17}))) ?
                      wire18 : (8'hb1));
  assign wire21 = wire17;
  assign wire22 = (wire17[(3'h6):(3'h4)] ^ $signed(({(wire19 ?
                          wire17 : wire18)} >>> (~|$signed(wire20)))));
  assign wire23 = wire19;
  assign wire24 = $unsigned(((&(wire18[(4'he):(4'h8)] ?
                      {wire22} : wire19)) << wire19));
  assign wire25 = (((({wire21, wire18} >> wire17) ?
                          ((wire24 ~^ wire17) ?
                              (wire16 ?
                                  wire21 : wire18) : (~&wire22)) : (~(wire17 <= wire24))) <<< (^$signed(wire22))) ?
                      ({($signed(wire23) > {wire20, wire19}),
                              $signed((wire19 >>> wire19))} ?
                          wire19[(3'h5):(3'h5)] : $signed((wire17 || $unsigned((8'ha8))))) : (~&{{{(8'h9d)},
                              {wire18}},
                          wire16}));
  assign wire26 = ($signed({wire25[(2'h2):(1'h0)],
                      wire20[(4'hd):(2'h2)]}) < wire25[(3'h5):(1'h1)]);
  assign wire27 = $unsigned((~|wire21));
endmodule
