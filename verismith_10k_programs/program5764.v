module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire93;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire62;
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire93,
                 wire91,
                 wire64,
                 wire62,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  module4 #() modinst63 (.wire7(wire3), .wire5((7'h42)), .y(wire62), .clk(clk), .wire8(wire0), .wire9(wire1), .wire6(wire2));
  assign wire64 = ((wire3[(4'hd):(3'h7)] ?
                          (wire0[(4'h8):(1'h0)] < ((wire2 ? wire62 : wire0) ?
                              (wire1 ?
                                  wire0 : wire3) : (~&(8'ha8)))) : (8'hb3)) ?
                      (~{(|$unsigned(wire2)),
                          {wire3[(2'h3):(2'h3)]}}) : ((wire2[(4'ha):(1'h1)] > $signed(wire62)) ~^ wire62));
  module65 #() modinst92 (wire91, clk, wire3, wire0, wire2, wire1);
  assign wire93 = wire3;
  always
    @(posedge clk) begin
      reg94 <= (wire2 ?
          ($signed($unsigned({wire93})) ?
              (wire91[(4'ha):(1'h1)] ?
                  {(~(8'hac)),
                      (wire3 ?
                          wire64 : (8'hb4))} : ($unsigned(wire62) + (~|(8'ha2)))) : wire1) : (~|$unsigned((^wire91[(4'h9):(3'h6)]))));
      if ($signed({wire64[(4'ha):(3'h7)], $unsigned((-(!wire93)))}))
        begin
          reg95 <= (wire64[(4'hd):(4'hc)] >> wire1[(4'hb):(4'h9)]);
          reg96 <= $signed(reg94);
        end
      else
        begin
          reg95 <= {{($signed((wire3 ~^ reg94)) ?
                      reg95[(4'ha):(4'ha)] : ((~^reg96) ? wire3 : (-wire64)))}};
          reg96 <= $unsigned(wire3[(1'h0):(1'h0)]);
        end
    end
  assign wire97 = ((8'ha2) | $unsigned(((&(reg96 ? reg96 : reg96)) >>> reg96)));
  assign wire98 = $unsigned(($unsigned(wire0) << wire2[(2'h2):(2'h2)]));
  assign wire99 = (-wire91[(2'h2):(1'h1)]);
  assign wire100 = {$unsigned(((~&(wire1 ? wire91 : wire99)) ?
                           (~&wire2[(3'h4):(1'h1)]) : $signed($unsigned((8'ha1))))),
                       {($signed((^wire99)) ^ wire91[(2'h2):(1'h1)]), wire97}};
  assign wire101 = (&(^~wire100[(1'h0):(1'h0)]));
  assign wire102 = (wire93 ? reg94[(3'h7):(2'h2)] : reg95[(4'hf):(4'he)]);
  always
    @(posedge clk) begin
      reg103 <= $signed(((((~(8'ha6)) == wire99[(4'h9):(4'h8)]) < {wire99[(3'h6):(2'h3)],
          wire93}) * $signed(($signed(wire99) <<< $signed(wire1)))));
      reg104 <= (((((~wire64) <<< $unsigned((8'hba))) ?
              ((wire99 ?
                  reg96 : reg95) - reg96[(4'hb):(2'h3)]) : $signed((~^wire102))) ?
          (|wire99[(3'h5):(1'h1)]) : reg94[(1'h1):(1'h0)]) | reg94[(3'h7):(3'h4)]);
      reg105 <= $unsigned((~(&wire64[(1'h0):(1'h0)])));
      reg106 <= ((+{wire91[(5'h10):(3'h5)], ($unsigned(wire101) ^~ wire2)}) ?
          $signed(wire101[(1'h0):(1'h0)]) : {{((wire99 ? wire97 : reg104) ?
                      (wire99 >= wire3) : $signed((8'hb4)))}});
    end
endmodule

module module65
#(parameter param89 = (((!({(7'h42)} >>> (&(8'hae)))) >= ((!((7'h40) ? (8'hb6) : (8'hb3))) ? (&((7'h44) ? (7'h40) : (8'hac))) : (&(&(8'ha4))))) >>> (!(-{((7'h40) ? (8'ha5) : (8'hac))}))), 
parameter param90 = param89)
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(5'h10):(1'h0)] wire68;
  input wire [(5'h15):(1'h0)] wire67;
  input wire [(5'h11):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire [(4'h9):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg70 <= ((!($signed((^wire69)) <<< $unsigned(((8'hb4) - wire68)))) | wire69);
      reg71 <= reg70[(3'h5):(2'h3)];
      reg72 <= {(~|$unsigned($signed(wire66))),
          ($signed((reg71[(3'h6):(2'h3)] || (~wire69))) ?
              (8'hb2) : (((8'haf) || (wire68 < reg70)) ?
                  ($signed(wire68) >= wire67) : $signed($unsigned(wire68))))};
      reg73 <= ($unsigned(wire68) ? $signed((reg72 <= (~&wire66))) : wire69);
    end
  assign wire74 = {{$signed(reg71[(3'h4):(3'h4)]),
                          (reg73[(4'hb):(2'h2)] <= wire68)},
                      (wire66[(2'h3):(1'h0)] ?
                          (~&(^~wire66[(3'h6):(1'h0)])) : (($unsigned(reg73) ?
                                  reg71[(3'h7):(1'h0)] : $unsigned(wire68)) ?
                              $signed(reg73) : {(wire67 ? (8'hb9) : wire68)}))};
  assign wire75 = (({reg71[(4'h9):(2'h3)],
                      $signed($signed(reg72))} <= wire69[(4'hc):(2'h2)]) ~^ reg70);
  assign wire76 = (wire68 ? wire66 : $signed((8'haf)));
  assign wire77 = wire75;
  assign wire78 = reg72;
  assign wire79 = wire76[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg80 <= (8'hb3);
      reg81 <= (|((-wire78[(4'h8):(4'h8)]) ?
          (wire67[(5'h14):(1'h1)] | ($signed(reg73) ?
              (wire68 < wire77) : $unsigned(wire68))) : $unsigned({reg71})));
      if (wire79)
        begin
          reg82 <= (wire66[(4'ha):(3'h4)] ?
              $unsigned((((~wire76) ^~ (wire78 <= wire74)) == $unsigned(wire75[(3'h6):(1'h0)]))) : ($signed((8'hb9)) > wire79));
          if ({wire69})
            begin
              reg83 <= {{($signed($unsigned(wire69)) > $signed($signed((8'ha0))))},
                  wire79};
              reg84 <= $unsigned(wire67[(1'h0):(1'h0)]);
              reg85 <= (|($signed($signed((~&reg82))) ? wire75 : reg84));
            end
          else
            begin
              reg83 <= ((~wire68[(5'h10):(4'he)]) <= ($signed(reg82[(2'h2):(1'h0)]) == $unsigned(wire79[(3'h7):(2'h3)])));
              reg84 <= (8'hac);
              reg85 <= $signed((reg82 - ((^wire67[(5'h15):(4'hf)]) ?
                  {reg71} : reg83)));
            end
          reg86 <= $unsigned((wire77[(3'h6):(3'h6)] ?
              reg70[(3'h5):(3'h5)] : reg81));
          reg87 <= $unsigned($unsigned($unsigned($signed(reg85))));
        end
      else
        begin
          reg82 <= ({reg83} <= (~|wire76));
          reg83 <= $unsigned(wire77);
          if ($signed(reg87))
            begin
              reg84 <= $unsigned(((^~$unsigned($unsigned(reg82))) <<< (!{$unsigned(reg87)})));
            end
          else
            begin
              reg84 <= ({wire76} ?
                  wire78 : (reg81[(4'hd):(4'hb)] & ($signed({(8'hb2)}) > reg84[(3'h7):(3'h6)])));
              reg85 <= reg85[(3'h7):(3'h7)];
              reg86 <= wire76;
            end
          reg87 <= ($signed(($unsigned((-wire74)) ?
              $unsigned(reg84) : {$unsigned(reg71),
                  {wire74}})) == (wire69[(4'ha):(3'h7)] > ({$unsigned((8'ha3)),
                  {reg72, wire66}} ?
              ({wire79, (8'h9e)} ?
                  $signed((8'hba)) : reg72[(3'h4):(2'h3)]) : (!reg83[(2'h2):(1'h1)]))));
        end
      reg88 <= {reg82, {((&(^~wire74)) || $signed((~&(8'ha2)))), reg71}};
    end
endmodule

module module4
#(parameter param61 = ({{(^((7'h44) ? (8'hbb) : (8'hac)))}, ((^((8'hbb) ? (8'ha4) : (8'hab))) >> (~((8'hb1) << (8'hb7))))} >>> (-({(^(8'ha9)), {(8'hbf), (8'hb8)}} ? (((8'hb4) ^ (8'hb8)) ? {(8'ha1), (8'hb7)} : (-(8'hbf))) : (!((8'hab) ? (8'ha2) : (8'hb8)))))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'hd):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  input wire signed [(3'h7):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire24;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire48;
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  assign y = {wire60,
                 wire52,
                 wire51,
                 wire50,
                 wire22,
                 wire11,
                 wire10,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire48,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 (1'h0)};
  assign wire10 = ($signed($unsigned(($unsigned(wire8) >> $signed(wire8)))) || wire9);
  assign wire11 = (wire8[(2'h3):(1'h0)] <= (wire9 ?
                      (7'h41) : (-$signed((|wire10)))));
  module12 #() modinst23 (wire22, clk, wire7, wire6, wire8, wire10, wire11);
  assign wire24 = (&(~&{wire11,
                      {(wire6 ? wire6 : wire5), $unsigned((8'hbc))}}));
  assign wire25 = (($unsigned(wire8[(1'h0):(1'h0)]) == $signed(((wire5 <= wire8) ?
                      (wire11 <= (8'ha3)) : (wire11 && wire7)))) >>> (wire9[(1'h1):(1'h0)] | (((wire11 >> wire11) > {wire8}) ^ $unsigned(wire11[(4'hc):(1'h1)]))));
  assign wire26 = wire5;
  assign wire27 = $signed($signed($signed((~|(wire10 ? wire6 : (8'hb8))))));
  module28 #() modinst49 (wire48, clk, wire8, wire10, wire25, wire7, wire24);
  assign wire50 = (~|((&(wire10[(2'h3):(2'h2)] ?
                      (wire27 >>> wire48) : $signed(wire27))) ^ wire8[(3'h5):(2'h2)]));
  assign wire51 = wire6;
  assign wire52 = wire25[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg53 <= {(~|wire52),
          ($unsigned(wire8) < (wire50 >= ((wire22 ? wire26 : wire11) > (wire50 ?
              wire52 : wire6))))};
      reg54 <= $signed(wire52[(4'hb):(4'h9)]);
      if ({wire9,
          (reg54 ?
              $unsigned(($unsigned(wire8) ?
                  (wire48 ? wire8 : wire5) : (wire10 ?
                      wire50 : (7'h41)))) : (!(|$unsigned((8'hbc)))))})
        begin
          reg55 <= {$unsigned(reg53), $signed(wire10[(3'h6):(1'h0)])};
          reg56 <= (({{reg55, $unsigned((8'ha4))}} ?
                  ($signed($unsigned(wire52)) >= (~|wire9[(4'ha):(3'h6)])) : $signed(wire22)) ?
              {$unsigned($signed((-wire5)))} : $signed(wire8[(3'h7):(1'h0)]));
          reg57 <= $unsigned(wire52[(4'ha):(2'h3)]);
        end
      else
        begin
          reg55 <= $unsigned(wire9);
        end
      reg58 <= (($signed($unsigned($signed(wire51))) + (!((wire10 << (8'hb0)) ~^ wire22))) >= $signed(wire8));
      reg59 <= ((+wire50[(3'h4):(1'h1)]) ?
          (($signed((reg57 ?
              wire9 : reg55)) <= (^~$unsigned(wire22))) || $signed(((wire26 ?
              wire6 : wire22) && wire10))) : (reg57 & $unsigned(reg54[(2'h2):(1'h1)])));
    end
  assign wire60 = {wire48};
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire signed [(4'hb):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  assign y = {wire47,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire34 = ($unsigned(wire31) ?
                      (|wire30) : $unsigned({(wire31[(2'h2):(1'h0)] ?
                              $signed((8'hb1)) : (wire31 ? wire31 : wire30))}));
  assign wire35 = $unsigned(((wire32[(3'h4):(1'h0)] > wire34) ?
                      (~|wire29) : wire33[(1'h0):(1'h0)]));
  assign wire36 = ($signed(wire34[(4'hd):(4'hb)]) ?
                      (~^$signed($signed((~wire29)))) : $signed((+wire31)));
  assign wire37 = $signed((^wire34));
  always
    @(posedge clk) begin
      if ((&((~&($signed(wire31) & (wire37 ? wire34 : wire29))) ?
          ((^$signed((8'hbb))) >>> (|(wire37 ? wire32 : wire36))) : ({wire37,
              wire29[(2'h2):(1'h0)]} | (wire32 < $unsigned(wire32))))))
        begin
          reg38 <= wire35[(2'h3):(2'h2)];
        end
      else
        begin
          reg38 <= (+(wire33[(2'h2):(1'h0)] ?
              ((^$signed(wire36)) - wire37) : {wire32[(4'h8):(3'h4)]}));
          if ((($unsigned(wire33) << wire36[(2'h2):(1'h0)]) ?
              (8'hba) : {($unsigned((~&wire35)) || ($signed((8'haf)) ?
                      ((8'ha6) ? wire33 : wire35) : (~^(8'h9d)))),
                  (wire32[(2'h3):(1'h0)] ?
                      ((!(8'ha0)) << (wire34 ~^ wire34)) : (wire30 ?
                          (~|(8'haa)) : $signed(reg38)))}))
            begin
              reg39 <= $signed(wire34);
              reg40 <= $unsigned(($unsigned((!$unsigned((7'h43)))) - $unsigned({(wire33 ?
                      reg38 : wire32),
                  $unsigned((8'ha1))})));
              reg41 <= reg38;
            end
          else
            begin
              reg39 <= (wire33[(4'h8):(2'h3)] ? wire36[(4'hd):(4'hc)] : wire31);
              reg40 <= {reg39[(1'h0):(1'h0)]};
              reg41 <= (wire33 >>> $unsigned((8'hb7)));
              reg42 <= wire33[(1'h1):(1'h0)];
            end
          reg43 <= ($unsigned((~&reg40)) ?
              ($unsigned((^wire37[(1'h0):(1'h0)])) ~^ wire31[(4'h9):(2'h3)]) : $signed((((reg42 || wire30) <= {reg42,
                  wire29}) == ((8'ha3) | {wire31, wire37}))));
          reg44 <= (&wire30);
        end
      reg45 <= (^~wire29[(3'h4):(2'h3)]);
      reg46 <= ($signed(wire36) ?
          $unsigned($signed(($signed(wire33) < (wire29 ?
              wire35 : reg41)))) : ($signed({wire30}) >>> $unsigned(wire31)));
    end
  assign wire47 = reg40[(1'h1):(1'h0)];
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire18;
  assign y = {wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = ({$unsigned(wire16[(4'hd):(3'h4)]),
                          $signed((wire14 << wire13[(2'h2):(1'h0)]))} ?
                      $signed(wire13[(3'h5):(2'h3)]) : (~^$unsigned(($signed(wire17) > wire17))));
  assign wire19 = ((|($unsigned((wire13 || wire16)) ?
                          wire13[(1'h0):(1'h0)] : ((|wire17) ?
                              (~|wire15) : (wire15 ? wire18 : wire16)))) ?
                      wire17 : $unsigned((~&(&(~&(8'hbc))))));
  assign wire20 = wire18;
  assign wire21 = {{(wire18 ?
                              $signed(wire20[(5'h12):(4'h9)]) : (+wire19[(3'h4):(1'h1)]))}};
endmodule
