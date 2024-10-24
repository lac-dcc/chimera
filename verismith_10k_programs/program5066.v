module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h118):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire108;
  reg signed [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  assign y = {wire117,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire4,
                 wire6,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire108,
                 reg116,
                 reg5,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg5 <= $signed((8'haf));
    end
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= $signed({(~&wire0[(3'h5):(1'h0)])});
      if ($signed(reg7[(4'hc):(4'ha)]))
        begin
          reg8 <= (wire6 ?
              wire0[(4'hf):(3'h7)] : $signed($signed($unsigned({(8'hb7)}))));
          reg9 <= wire2[(3'h5):(1'h1)];
          reg10 <= {wire2};
        end
      else
        begin
          reg8 <= wire4[(3'h5):(2'h3)];
          reg9 <= ((8'ha0) && wire1);
          reg10 <= $signed(((8'ha8) ?
              $signed((~&{reg10, wire4})) : (~&$unsigned({wire3}))));
        end
      reg11 <= wire1;
      reg12 <= ((&$unsigned($signed((reg8 ? reg9 : reg9)))) ?
          reg10[(2'h2):(1'h1)] : wire3[(1'h0):(1'h0)]);
    end
  assign wire13 = {((wire4 || reg12[(4'h8):(3'h4)]) > reg11)};
  assign wire14 = $unsigned($unsigned($unsigned(((reg11 ? reg12 : (8'ha4)) ?
                      $unsigned(reg8) : $unsigned(wire13)))));
  assign wire15 = reg11;
  assign wire16 = ((((8'hb0) & $signed((reg11 ^ wire14))) ?
                          {(!$signed((8'hb1)))} : (~&(^~(8'ha9)))) ?
                      wire15 : $unsigned((~|(8'hb9))));
  assign wire17 = $unsigned(($signed(reg10[(3'h5):(3'h5)]) ?
                      reg10[(3'h4):(1'h0)] : ($signed(wire1) <<< $signed(reg9))));
  assign wire18 = (wire0[(4'he):(1'h0)] ?
                      reg7 : $signed(wire14[(3'h5):(3'h5)]));
  module19 #() modinst109 (wire108, clk, wire2, reg7, wire15, wire4);
  assign wire110 = (~|$unsigned($unsigned(wire17)));
  assign wire111 = (((($signed(wire14) ? {reg5} : ((8'hb1) * reg5)) ^~ ((reg9 ?
                                   wire1 : reg11) ?
                               wire15 : reg12)) ?
                           (~|((wire3 == wire110) < reg11[(2'h2):(1'h0)])) : $signed(wire16)) ?
                       $signed((~|((reg12 ?
                           wire2 : (8'h9d)) <<< $unsigned(wire16)))) : ((|wire4) ?
                           {$signed($unsigned(wire1)),
                               (~^(wire16 || (8'hbe)))} : (8'hb4)));
  assign wire112 = $signed(($signed(($signed(wire16) ?
                           (wire15 ^~ reg10) : (8'hb8))) ?
                       wire15[(3'h6):(1'h0)] : ((+(wire3 == reg5)) ~^ $signed($unsigned(wire108)))));
  assign wire113 = $signed((((|$unsigned(wire0)) ?
                           $signed(wire16) : ($unsigned(wire110) ?
                               (wire14 || reg5) : {wire2})) ?
                       $signed({wire111,
                           $signed(wire16)}) : $signed(($signed(reg8) ^~ $unsigned((8'hbb))))));
  assign wire114 = {$unsigned((&{{wire111, (8'hbc)}, wire112[(2'h2):(1'h0)]}))};
  assign wire115 = ($unsigned(((&wire18) && $unsigned(wire14))) < (~^reg7[(4'he):(1'h0)]));
  always
    @(posedge clk) begin
      reg116 <= $signed({wire6[(4'h9):(4'h8)], wire112[(2'h3):(1'h1)]});
    end
  assign wire117 = ({$signed(((reg7 ? wire115 : wire110) ?
                               (^~wire18) : (|wire3))),
                           {reg8[(3'h7):(2'h2)],
                               ($signed(reg5) ?
                                   reg10[(1'h0):(1'h0)] : {wire110, reg8})}} ?
                       (8'hb7) : {$signed(reg7), wire16});
endmodule

module module19  (y, clk, wire20, wire21, wire22, wire23);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire [(4'hb):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(4'hb):(1'h0)] wire106;
  wire [(3'h4):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire [(3'h4):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire47;
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg83 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire81,
                 wire50,
                 wire49,
                 wire24,
                 wire25,
                 wire47,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire24 = $signed(((+(-$signed(wire22))) <= (~&{(-wire23)})));
  assign wire25 = (~^(wire21[(3'h5):(2'h3)] ?
                      ($signed($signed(wire22)) > (^~$signed((8'hbe)))) : wire22));
  module26 #() modinst48 (.y(wire47), .wire31(wire24), .wire29(wire21), .wire27(wire20), .clk(clk), .wire30(wire22), .wire28(wire25));
  assign wire49 = $signed(wire23);
  assign wire50 = $unsigned($unsigned(wire23[(2'h3):(1'h1)]));
  module51 #() modinst82 (.wire55(wire49), .clk(clk), .wire53(wire20), .y(wire81), .wire54(wire25), .wire52(wire23));
  always
    @(posedge clk) begin
      reg83 <= (~&$signed(wire81[(2'h3):(1'h0)]));
      reg84 <= wire50;
    end
  assign wire85 = wire49;
  assign wire86 = $signed($signed($signed(((!(8'ha1)) >> $signed(wire50)))));
  assign wire87 = (wire21 || ({(wire47[(5'h10):(3'h6)] ? wire49 : wire86),
                      $unsigned(wire25[(4'h9):(3'h6)])} > (8'hab)));
  assign wire88 = {$signed({($unsigned((8'hbd)) >>> (wire87 ?
                              wire47 : wire47))})};
  assign wire89 = wire88;
  assign wire90 = (^~($signed($unsigned((reg83 && reg83))) ?
                      $unsigned($unsigned(wire86)) : reg84));
  assign wire91 = ((|$unsigned($signed((~^wire85)))) < $unsigned((-wire49[(2'h2):(1'h1)])));
  module92 #() modinst103 (wire102, clk, wire85, wire23, wire22, wire90);
  assign wire104 = $signed((~({wire47[(1'h0):(1'h0)], wire47[(4'ha):(4'h9)]} ?
                       (wire85 ^ wire89) : (wire22 ?
                           $unsigned(wire24) : wire102))));
  assign wire105 = $unsigned(wire20);
  assign wire106 = wire88;
  assign wire107 = $signed(wire23[(3'h4):(1'h0)]);
endmodule

module module92
#(parameter param101 = (7'h44))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire96;
  input wire signed [(2'h3):(1'h0)] wire95;
  input wire [(3'h7):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire97;
  assign y = {wire100, wire99, wire98, wire97, (1'h0)};
  assign wire97 = wire94;
  assign wire98 = $unsigned(wire94);
  assign wire99 = $unsigned($unsigned((($unsigned(wire96) >> $unsigned(wire98)) || wire96[(4'hb):(2'h3)])));
  assign wire100 = wire99;
endmodule

module module51
#(parameter param79 = (-((~^(^(-(8'hba)))) ? (|{((8'hbe) >= (8'ha5))}) : {{((8'ha2) ? (8'ha7) : (8'haa))}, {{(8'hac), (8'hb1)}, ((8'had) ? (7'h41) : (8'hb2))}})), 
parameter param80 = param79)
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  input wire [(2'h2):(1'h0)] wire53;
  input wire [(4'h8):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire56;
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire56,
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
                 (1'h0)};
  assign wire56 = $unsigned((~|$unsigned(wire52[(3'h7):(1'h1)])));
  always
    @(posedge clk) begin
      reg57 <= (+wire52[(1'h0):(1'h0)]);
      reg58 <= (^~wire52);
      reg59 <= (((({reg57, wire52} << $unsigned(reg58)) && wire52) ?
          (((wire53 ? wire54 : (8'hb3)) || $signed(reg57)) ?
              ((wire54 || (8'ha9)) >> wire52) : ($signed((8'hba)) >> (reg58 <<< wire52))) : (^~reg58[(1'h1):(1'h1)])) >= (({((7'h41) ?
              reg58 : wire53),
          $unsigned(wire54)} > wire54) ^~ (8'hb0)));
      if (($unsigned($signed((reg58 ?
              (reg57 || reg58) : wire52[(1'h1):(1'h1)]))) ?
          {reg57[(1'h1):(1'h1)],
              $signed((wire53[(2'h2):(2'h2)] > (wire56 ?
                  wire54 : reg59)))} : ((8'hac) ?
              (((reg58 ? (7'h42) : wire56) - (~|wire56)) ?
                  wire54[(5'h14):(3'h7)] : wire53[(2'h2):(1'h1)]) : ($unsigned(wire53) ?
                  (^~(wire54 >= (8'hb2))) : reg58[(2'h3):(1'h1)]))))
        begin
          reg60 <= wire54;
          reg61 <= $unsigned((wire55[(1'h0):(1'h0)] ?
              {(((7'h43) ? reg57 : wire52) ?
                      (^~(8'hb9)) : (reg60 ? reg60 : wire53)),
                  ((reg59 ?
                      wire53 : wire52) || (8'ha7))} : wire53[(2'h2):(1'h0)]));
          reg62 <= (wire56 ?
              $signed(wire54[(2'h3):(2'h2)]) : (($unsigned(reg58[(2'h2):(1'h0)]) ?
                      wire55[(3'h5):(3'h4)] : (~^$unsigned(wire53))) ?
                  (&$signed(wire55)) : (($unsigned(wire56) ?
                      {(8'hbd), reg57} : wire53) << ((wire54 >>> reg57) ?
                      $unsigned(wire53) : reg58))));
        end
      else
        begin
          reg60 <= (($unsigned((wire52 > $signed(wire54))) + $unsigned(reg62)) ?
              $unsigned(wire54[(4'ha):(1'h1)]) : reg60);
          if ($unsigned($unsigned($unsigned($unsigned($unsigned(reg61))))))
            begin
              reg61 <= (-(8'had));
              reg62 <= $unsigned(((~&reg58[(2'h3):(1'h1)]) ?
                  wire54[(4'hb):(3'h7)] : (((reg62 >>> wire52) ?
                      $signed(wire52) : $signed(reg62)) * {reg59[(3'h7):(3'h5)],
                      {reg59, (8'ha2)}})));
              reg63 <= {$unsigned(wire54[(4'hb):(3'h6)])};
            end
          else
            begin
              reg61 <= (wire54 ?
                  ($unsigned({$signed((8'hbe))}) ?
                      reg58[(2'h3):(2'h3)] : $signed($unsigned($signed(wire53)))) : wire56);
              reg62 <= (8'hb7);
              reg63 <= (((((reg61 <<< reg63) ?
                      $signed((8'had)) : reg61) != (~&$unsigned(wire55))) != (!reg62[(5'h11):(4'ha)])) ?
                  reg63[(4'h9):(2'h3)] : reg61[(1'h1):(1'h0)]);
              reg64 <= (wire55 ? $unsigned(wire53) : (8'ha7));
              reg65 <= reg57[(1'h0):(1'h0)];
            end
          reg66 <= reg63[(3'h5):(2'h2)];
          reg67 <= reg58[(1'h1):(1'h1)];
        end
      reg68 <= (^~(wire54 ? reg65[(3'h6):(3'h4)] : reg65[(4'ha):(4'h8)]));
    end
  assign wire69 = (~^$unsigned($signed((^(reg66 ? reg67 : wire55)))));
  assign wire70 = (8'haa);
  assign wire71 = (reg66 != (wire55 ?
                      (~|(~&(wire56 ?
                          reg60 : reg68))) : ((+{reg59}) & ((^reg58) >>> (reg59 * wire69)))));
  assign wire72 = ({reg68, reg65[(1'h0):(1'h0)]} >= reg66);
  assign wire73 = ((~^$signed(wire70)) & reg67);
  assign wire74 = $signed($signed((8'hb4)));
  assign wire75 = ((~|wire69[(2'h2):(1'h1)]) ? reg64 : reg62[(1'h1):(1'h1)]);
  assign wire76 = $unsigned((reg64[(3'h4):(1'h0)] ?
                      reg68 : $unsigned(({reg58} ?
                          $signed(wire56) : (+reg62)))));
  assign wire77 = wire73[(1'h1):(1'h1)];
  assign wire78 = (&$signed(reg59));
endmodule

module module26
#(parameter param45 = (-(((((8'hb9) << (7'h41)) ? (8'hb0) : ((8'haa) || (8'ha9))) > (!((8'hab) << (8'hbd)))) & {((&(8'hac)) ? {(8'ha6), (8'hae)} : ((8'ha3) ? (8'ha5) : (8'hae))), ((~|(8'h9c)) ? ((8'hb6) != (8'hbb)) : (-(8'hac)))})), 
parameter param46 = ((({param45, param45} && (~(param45 ? param45 : (8'hbc)))) ? param45 : (param45 ? (~^param45) : ((-param45) && param45))) ^~ param45))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  input wire signed [(5'h11):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg41,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= $unsigned($signed($signed(wire28)));
    end
  assign wire33 = ({$unsigned(((wire27 != wire28) << wire30[(2'h3):(1'h0)]))} ?
                      $unsigned($signed((^~((8'ha3) ?
                          reg32 : wire30)))) : (^~wire30));
  assign wire34 = {$unsigned(wire27[(5'h10):(4'hd)])};
  assign wire35 = ((+(^(wire29[(4'h8):(3'h6)] >> (^~wire30)))) ?
                      (wire30 && (&(~(wire31 & wire34)))) : $unsigned(wire29));
  assign wire36 = $signed($unsigned(((wire27[(4'hb):(3'h4)] ?
                      (wire31 ?
                          wire27 : wire35) : $unsigned(wire33)) * ({wire31,
                      wire27} < (wire27 >> wire28)))));
  assign wire37 = $unsigned(wire29);
  assign wire38 = (^~({(8'hb2), (wire30[(1'h0):(1'h0)] <<< (~^wire35))} ?
                      wire31 : (wire33 >>> wire29)));
  assign wire39 = $unsigned(reg32);
  assign wire40 = (wire35[(3'h5):(3'h4)] << ((((-reg32) ?
                              $unsigned(wire37) : wire28[(4'he):(3'h4)]) ?
                          $signed((wire31 ?
                              (8'hb8) : wire31)) : (|$signed((8'hb4)))) ?
                      wire39[(4'ha):(4'ha)] : ($signed($unsigned(wire37)) ?
                          $unsigned(((8'hb9) >= (7'h44))) : $signed(wire35[(4'h8):(3'h6)]))));
  always
    @(posedge clk) begin
      reg41 <= ($signed($unsigned((!$signed(wire28)))) ?
          $signed((8'hb3)) : (((^$unsigned(wire34)) ?
                  (!$unsigned(wire38)) : wire27) ?
              $signed({$unsigned(wire28), wire34}) : ($signed($signed(wire35)) ?
                  wire33[(3'h7):(3'h7)] : wire27[(4'hb):(3'h6)])));
    end
  assign wire42 = ((($unsigned((^~wire29)) <<< wire29) | {((wire36 >= wire34) != $unsigned(wire28))}) ?
                      (8'hbc) : (~&$signed($signed($unsigned((8'h9c))))));
  assign wire43 = wire37;
  assign wire44 = $signed((^$signed((wire33[(3'h5):(2'h2)] ?
                      (reg32 ? wire30 : (8'ha4)) : wire29[(1'h1):(1'h0)]))));
endmodule
