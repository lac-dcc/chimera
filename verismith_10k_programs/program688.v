module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h232):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire82;
  wire [(3'h5):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(5'h14):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire76;
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire104,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire11,
                 wire76,
                 reg103,
                 reg102,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg80,
                 reg7,
                 reg8,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire5 = (+(|wire1));
  assign wire6 = (+{({((7'h43) ? wire3 : wire3)} * wire2),
                     $unsigned($unsigned((wire3 ~^ wire4)))});
  always
    @(posedge clk) begin
      reg7 <= {($unsigned(({(8'hb6), wire3} ?
              (8'hbf) : (wire2 ?
                  wire5 : wire1))) == (wire1[(3'h4):(1'h1)] ^~ ((wire2 <<< wire0) ^~ $signed(wire1)))),
          (!{$unsigned(wire2[(4'hf):(4'h9)]), (~^wire2)})};
      reg8 <= wire1[(1'h0):(1'h0)];
    end
  assign wire9 = {(reg7 ?
                         $signed((&(wire3 ?
                             wire6 : wire6))) : ($unsigned((wire6 ?
                                 reg7 : wire1)) ?
                             (+$unsigned(wire0)) : reg8[(4'hc):(3'h5)]))};
  assign wire10 = (^~$unsigned(($unsigned(wire9[(2'h2):(2'h2)]) ?
                      (^~(8'hbc)) : (&(|wire2)))));
  assign wire11 = $signed((wire4[(3'h5):(3'h5)] && $signed($signed($unsigned(wire2)))));
  always
    @(posedge clk) begin
      reg12 <= wire6;
      reg13 <= $signed((wire11[(4'hd):(4'h9)] - ($signed((8'hb2)) ?
          $signed((wire1 < (8'haa))) : wire10[(4'hd):(4'hc)])));
      reg14 <= $unsigned(wire6[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      if ((wire2 ?
          (~(wire9 >= {(wire0 ? (8'hb0) : (7'h44)),
              $unsigned(wire11)})) : $unsigned((wire9[(1'h0):(1'h0)] || $signed((reg14 ?
              reg13 : wire11))))))
        begin
          if ($unsigned((^~wire3)))
            begin
              reg15 <= ((&reg12[(4'hf):(3'h7)]) ?
                  $unsigned(reg13[(1'h1):(1'h1)]) : $signed($unsigned($unsigned(wire2[(2'h3):(1'h1)]))));
              reg16 <= {reg12[(5'h10):(5'h10)], (~^$unsigned($signed(reg12)))};
              reg17 <= $signed(wire9[(3'h5):(1'h1)]);
              reg18 <= $unsigned($unsigned(wire4[(2'h3):(2'h2)]));
            end
          else
            begin
              reg15 <= $signed($unsigned(wire0));
              reg16 <= ({$unsigned($signed((reg18 * reg17))),
                      {(-(wire2 ? wire0 : wire3)), $signed({reg18, wire2})}} ?
                  (&{reg7[(4'h9):(2'h3)], (8'hb7)}) : reg16[(3'h5):(2'h3)]);
              reg17 <= $signed($signed(((-(wire6 ?
                  wire6 : (8'hae))) ~^ (~&wire5))));
            end
          reg19 <= ($unsigned((((wire5 <= wire11) ?
                  (wire11 > wire4) : reg17[(1'h0):(1'h0)]) - (|wire10))) ?
              $unsigned(wire3[(3'h4):(1'h1)]) : wire1);
        end
      else
        begin
          reg15 <= $signed(($signed($unsigned((reg14 == reg7))) ?
              $unsigned((&$signed(wire4))) : wire9[(3'h6):(2'h3)]));
        end
      reg20 <= reg13;
      if ((+$signed((reg15[(2'h2):(1'h0)] && ($unsigned(reg16) ?
          wire4 : $signed(wire3))))))
        begin
          reg21 <= ($unsigned((!(reg19[(1'h0):(1'h0)] ?
              (8'ha8) : wire4))) || $unsigned(wire9));
          reg22 <= wire4[(3'h7):(2'h2)];
          reg23 <= reg15;
          reg24 <= $signed((~$unsigned((~^$unsigned(wire10)))));
        end
      else
        begin
          reg21 <= wire10[(4'he):(1'h1)];
          reg22 <= ((($signed($signed(reg16)) ?
                  ({reg24, wire4} ?
                      $unsigned((8'ha7)) : reg16) : (8'ha5)) >>> (-$signed((reg13 << wire5)))) ?
              $signed($unsigned((^~$unsigned(reg21)))) : $unsigned(((^reg15[(2'h2):(1'h0)]) ?
                  wire11 : ($signed(wire2) ? (7'h43) : reg18))));
          if ((reg22 <= $unsigned(((((8'had) >> wire10) ~^ $unsigned(wire10)) >>> ($signed(reg24) ?
              (~|reg18) : (~wire1))))))
            begin
              reg23 <= wire3[(3'h5):(3'h4)];
              reg24 <= ($unsigned((&$signed((~|reg16)))) ?
                  ($signed(reg20[(5'h12):(4'hf)]) && $unsigned((+$unsigned(reg7)))) : $unsigned((({wire10} ?
                      wire10[(4'ha):(3'h6)] : $signed(wire2)) * ($signed(wire2) ?
                      $unsigned(wire10) : ((8'hb4) + reg22)))));
              reg25 <= (((((reg15 ? reg15 : (8'hac)) ?
                              {(8'hb1), reg24} : $unsigned(wire1)) ?
                          $unsigned((reg18 ?
                              (8'haf) : wire4)) : (+$signed(wire3))) ?
                      reg13[(2'h3):(2'h2)] : (8'hb8)) ?
                  $signed($signed(((reg22 != reg7) < reg16[(1'h1):(1'h1)]))) : (((reg16 ?
                          $signed(wire9) : (wire2 > reg14)) >> ((reg20 << wire1) + wire1[(3'h5):(3'h5)])) ?
                      $signed($unsigned((reg15 | reg14))) : (|((wire1 != reg12) >>> (+(8'hb0))))));
            end
          else
            begin
              reg23 <= $signed($signed(((reg14[(1'h0):(1'h0)] ^ wire11[(3'h4):(1'h0)]) ?
                  $signed($signed(reg12)) : (+$signed(reg12)))));
              reg24 <= {(reg25 * (^(~|$unsigned((8'ha2))))),
                  reg12[(1'h1):(1'h0)]};
            end
          reg26 <= (reg18 ?
              $signed((+((&reg13) ?
                  $unsigned(reg20) : reg21[(1'h1):(1'h1)]))) : wire3);
          if ({reg17[(3'h4):(2'h2)],
              $signed((reg26 == (+reg23[(3'h7):(3'h6)])))})
            begin
              reg27 <= ({$unsigned({reg22}), {wire3}} ?
                  $unsigned($unsigned($unsigned((|reg25)))) : (|(^~wire1)));
              reg28 <= (~($signed(((reg22 | wire2) ?
                  reg15[(1'h1):(1'h0)] : reg27)) == wire10));
            end
          else
            begin
              reg27 <= (!$signed($unsigned(($signed(wire10) > (wire4 <<< reg21)))));
              reg28 <= (((~reg26[(4'h9):(2'h2)]) << (($unsigned(reg19) ?
                  (reg14 ?
                      (8'ha9) : wire3) : $unsigned(wire9)) ~^ $unsigned($unsigned(reg18)))) - reg8);
            end
        end
    end
  module29 #() modinst77 (wire76, clk, reg17, reg24, wire4, reg15);
  assign wire78 = (7'h40);
  assign wire79 = ($unsigned((8'ha7)) ?
                      {wire3[(1'h0):(1'h0)]} : {((|reg21[(2'h3):(1'h1)]) ?
                              wire2 : wire2[(1'h1):(1'h0)]),
                          wire11});
  always
    @(posedge clk) begin
      reg80 <= wire78[(4'hb):(2'h3)];
    end
  assign wire81 = ((-wire1[(2'h3):(2'h2)]) ^~ reg26);
  assign wire82 = wire78;
  assign wire83 = ($signed(wire79) ?
                      reg16[(2'h3):(2'h3)] : $unsigned({($signed(reg23) << $unsigned(reg28))}));
  always
    @(posedge clk) begin
      if (({reg23,
          (&($unsigned(wire6) > (~&wire10)))} ^~ $unsigned((($unsigned(reg20) ?
          $signed(wire3) : (reg26 ? reg20 : reg17)) ^~ (wire83 ?
          (-wire1) : (reg13 ? reg24 : reg80))))))
        begin
          if (reg22)
            begin
              reg84 <= reg19;
              reg85 <= ($signed((wire79[(3'h4):(1'h0)] & reg20)) ~^ (8'haf));
              reg86 <= $unsigned($signed(wire6[(2'h2):(1'h0)]));
            end
          else
            begin
              reg84 <= $unsigned(($unsigned((~|reg20[(3'h5):(3'h4)])) ?
                  reg18 : {$unsigned(reg13[(2'h3):(1'h0)]),
                      (((8'hac) ? wire6 : wire6) ?
                          (reg14 >> reg23) : (!(8'hb6)))}));
              reg85 <= (reg13 ?
                  (+($signed($signed(reg15)) ?
                      $signed(wire11) : $unsigned((wire82 ?
                          (7'h42) : reg7)))) : (+wire1));
            end
          reg87 <= $signed($unsigned($unsigned(reg23)));
          reg88 <= $unsigned($signed((((wire6 ?
              (8'hb3) : reg14) & $unsigned(wire10)) != reg7[(4'h9):(3'h5)])));
        end
      else
        begin
          reg84 <= wire11[(5'h13):(3'h4)];
          reg85 <= (^reg13[(2'h3):(2'h2)]);
          reg86 <= (~|($signed(reg20) ?
              (reg28[(3'h7):(2'h2)] ?
                  $signed((reg26 ? wire9 : (7'h43))) : {$unsigned(reg27),
                      ((8'haa) <<< wire5)}) : wire10[(3'h5):(3'h4)]));
        end
      reg89 <= ($unsigned(((^reg21) > $signed((+reg87)))) && {$signed(($signed(reg28) ?
              wire82[(2'h3):(1'h0)] : $unsigned(wire3))),
          $signed({((8'hbd) - wire79)})});
      reg90 <= (8'h9c);
      if (($signed($unsigned($signed((wire83 ?
          reg89 : (7'h43))))) & wire2[(3'h4):(1'h1)]))
        begin
          if ((^($unsigned($unsigned(wire1)) ?
              reg18[(1'h0):(1'h0)] : {((reg89 ? reg89 : reg86) ?
                      wire4[(4'hd):(3'h4)] : $unsigned(reg26)),
                  (reg17 | (wire3 ? reg24 : (8'hb1)))})))
            begin
              reg91 <= $signed($signed((8'h9c)));
            end
          else
            begin
              reg91 <= (({(reg18[(1'h0):(1'h0)] || (reg21 - wire83))} ?
                      reg12 : reg19[(2'h2):(1'h1)]) ?
                  ((~^({(8'hbf), reg16} ? reg88 : $unsigned(reg13))) ?
                      wire11 : reg19[(2'h2):(1'h1)]) : wire82[(1'h0):(1'h0)]);
              reg92 <= wire83;
              reg93 <= ({wire11, {$unsigned($signed((8'hbc)))}} ?
                  $unsigned({(&wire0[(4'he):(4'h9)]),
                      reg15[(1'h1):(1'h0)]}) : wire2[(4'hf):(3'h4)]);
            end
          reg94 <= {(wire6[(1'h1):(1'h1)] - reg8),
              $unsigned((reg16 ? {$signed(reg14)} : reg92))};
        end
      else
        begin
          reg91 <= $signed($signed((wire78[(5'h11):(5'h11)] ?
              ($unsigned((8'hbb)) ^~ wire78[(2'h3):(2'h2)]) : (8'hb5))));
          reg92 <= $unsigned(({(8'hbe),
              $unsigned($signed(reg26))} >= ($unsigned($signed(reg12)) & $unsigned(((8'haf) <<< reg23)))));
          if ((reg19 ?
              $signed(reg14[(4'h9):(1'h1)]) : $unsigned($signed(({reg89,
                  wire2} * wire3)))))
            begin
              reg93 <= $signed((~^(reg93[(2'h3):(1'h0)] + (|(reg26 ?
                  wire79 : reg8)))));
            end
          else
            begin
              reg93 <= (-$unsigned($unsigned(((reg28 * reg24) ?
                  $signed(reg25) : reg16[(3'h5):(2'h3)]))));
              reg94 <= wire5[(3'h4):(3'h4)];
              reg95 <= $signed({($unsigned($unsigned(wire5)) >>> reg26[(4'h9):(3'h6)]),
                  $signed(({reg86, (8'hae)} & $unsigned(wire83)))});
            end
          reg96 <= ($unsigned($unsigned(((8'haa) <= {wire2, reg7}))) < (8'ha6));
        end
      reg97 <= reg18[(1'h0):(1'h0)];
    end
  assign wire98 = reg88;
  assign wire99 = wire4[(3'h4):(2'h2)];
  assign wire100 = ($signed(((~^$unsigned(reg27)) <= $signed(wire99[(4'he):(1'h1)]))) ?
                       $signed(($signed(reg14[(3'h4):(1'h1)]) ?
                           reg93 : {(~&(8'hb8))})) : {$unsigned(((!(8'ha3)) || ((8'had) ?
                               wire1 : reg19))),
                           reg15[(2'h3):(1'h1)]});
  assign wire101 = $unsigned($signed(wire4));
  always
    @(posedge clk) begin
      reg102 <= (($unsigned($signed(reg24)) <<< (reg90 * reg15[(4'h9):(3'h5)])) >>> (wire101[(2'h3):(2'h3)] < (~^$signed((8'hb0)))));
      reg103 <= (wire76[(2'h2):(2'h2)] ?
          {(reg7 <= $signed($signed(reg22))),
              wire6} : {(-($signed((8'hb8)) ^ (!wire0)))});
    end
  assign wire104 = $signed(wire98[(3'h7):(2'h2)]);
endmodule

module module29
#(parameter param75 = (({(((8'hb9) <= (7'h44)) ? (^(8'had)) : (!(7'h41))), {(^(8'hb9))}} <<< ((((8'hbf) ? (8'hb9) : (7'h43)) ? {(8'ha5)} : (~(7'h40))) <<< {((8'ha6) <= (8'hb6)), {(8'hbf), (8'ha1)}})) == (+({((7'h40) ? (7'h44) : (8'haf))} ? {{(8'ha9)}} : ({(8'h9f), (8'ha1)} | ((8'ha7) ? (8'ha5) : (8'hb5)))))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire signed [(5'h15):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(3'h4):(1'h0)] wire61;
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg66,
                 (1'h0)};
  module34 #() modinst62 (.wire38(wire30), .wire36(wire31), .y(wire61), .wire37(wire33), .clk(clk), .wire35((8'h9e)), .wire39(wire32));
  assign wire63 = (wire33[(4'h9):(3'h4)] ?
                      $signed(wire32) : ($signed((wire33 & (~wire30))) ?
                          wire33[(4'hc):(3'h4)] : ((wire31[(3'h5):(1'h0)] ?
                              {wire31} : $unsigned(wire30)) >= wire31[(4'hf):(4'hc)])));
  assign wire64 = wire31;
  assign wire65 = wire32[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg66 <= (!(~&$signed(((wire64 ? (7'h43) : (8'hbf)) ?
          $unsigned(wire63) : {(8'hbe), wire31}))));
    end
  assign wire67 = wire63;
  assign wire68 = wire67;
  assign wire69 = (wire68[(2'h3):(2'h3)] ?
                      (^wire31) : {($unsigned((&wire31)) ?
                              $signed(wire33[(5'h14):(5'h11)]) : wire31)});
  always
    @(posedge clk) begin
      reg70 <= $signed(wire61[(2'h3):(1'h1)]);
      reg71 <= (~wire32[(2'h2):(1'h0)]);
      reg72 <= (reg66[(4'h8):(3'h6)] ?
          ($signed($unsigned(wire30[(2'h2):(1'h0)])) - (((reg71 ?
                  reg71 : wire65) <= (wire67 ? wire65 : wire65)) ?
              wire69[(2'h3):(2'h3)] : wire61[(3'h4):(1'h1)])) : (8'hab));
      reg73 <= wire31[(2'h3):(1'h0)];
      reg74 <= $signed($signed((~&(~|wire61[(1'h0):(1'h0)]))));
    end
endmodule

module module34
#(parameter param59 = ((~|(((8'hb2) * {(8'hb5)}) | ((&(8'hb8)) != ((8'haa) << (8'hb8))))) < (((((8'hac) ? (8'ha6) : (8'ha6)) >= {(7'h44)}) == (((8'h9e) ? (8'hbc) : (7'h40)) <= ((8'hbd) ? (8'hb2) : (7'h40)))) >= ({((8'had) ? (7'h42) : (8'haa))} != {((8'hb6) ^ (7'h41))}))), 
parameter param60 = (~|param59))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire signed [(4'hf):(1'h0)] wire36;
  input wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(3'h6):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
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
                 wire41,
                 wire40,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = {($unsigned($signed({wire35, wire38})) ?
                          $unsigned((wire37[(5'h10):(3'h6)] ?
                              wire38 : (+wire36))) : wire39),
                      (&(wire39 ? (~^$signed((8'h9e))) : (8'hac)))};
  assign wire41 = $unsigned($signed(wire39[(4'hd):(3'h7)]));
  always
    @(posedge clk) begin
      reg42 <= ($unsigned(wire36) ?
          wire40 : (((+$unsigned(wire39)) >= (~|(wire37 == wire39))) ?
              (wire40[(1'h1):(1'h0)] | (wire35[(4'hc):(4'hc)] ?
                  (wire35 - wire36) : $signed(wire40))) : wire35));
      reg43 <= (8'ha1);
      reg44 <= wire36[(4'h8):(2'h3)];
    end
  assign wire45 = {((-$unsigned(reg43[(3'h7):(3'h7)])) ? reg43 : wire38)};
  assign wire46 = reg42;
  assign wire47 = wire37;
  assign wire48 = wire46[(3'h4):(1'h0)];
  assign wire49 = reg44;
  assign wire50 = wire39;
  assign wire51 = ($signed((!wire38[(4'hb):(3'h4)])) ?
                      ((~&reg43[(4'hd):(3'h4)]) ?
                          (((~&(8'hb4)) ^ $signed(wire35)) ^~ (+reg42)) : {{(wire40 ?
                                      wire45 : (8'hb2)),
                                  wire50}}) : (wire46[(2'h2):(2'h2)] ?
                          ($unsigned($unsigned((8'hab))) + ((wire47 ?
                                  wire46 : wire50) ?
                              $unsigned(wire47) : wire45)) : ((|(wire47 ?
                                  wire36 : wire45)) ?
                              $signed({wire46, wire37}) : (8'hb7))));
  assign wire52 = wire45;
  assign wire53 = $unsigned($unsigned(wire36[(2'h2):(1'h0)]));
  assign wire54 = $unsigned($signed(wire41));
  assign wire55 = (^$signed(($signed((reg42 - wire36)) || $unsigned((wire39 ^ wire48)))));
  assign wire56 = ($signed((($signed(reg43) ?
                      (wire36 >> wire53) : (+reg42)) != wire41)) <<< (+reg44));
  assign wire57 = $unsigned($unsigned(($signed(wire38) >> ($unsigned(reg43) ^ $signed((8'hb7))))));
  assign wire58 = (wire53[(4'ha):(1'h0)] ?
                      wire57[(2'h2):(2'h2)] : $unsigned(wire45[(5'h10):(3'h6)]));
endmodule
