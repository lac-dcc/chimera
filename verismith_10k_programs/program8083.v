module top
#(parameter param136 = (^{(+(^(~|(8'h9f)))), ((|(^~(7'h40))) == (~|(~(7'h42))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire4;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire114;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire134;
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  assign y = {wire5,
                 wire15,
                 wire16,
                 wire109,
                 wire111,
                 wire112,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire118,
                 wire119,
                 wire120,
                 wire134,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg117,
                 (1'h0)};
  assign wire5 = $unsigned((wire1[(1'h1):(1'h1)] + wire0[(3'h5):(1'h1)]));
  always
    @(posedge clk) begin
      reg6 <= ((|$unsigned(wire1)) ?
          $unsigned($unsigned({wire2[(2'h3):(1'h1)]})) : ((~|wire4) ?
              {$signed(wire2[(1'h1):(1'h1)]),
                  (!$signed(wire1))} : wire4[(2'h3):(1'h0)]));
      reg7 <= reg6;
      if ((!$unsigned(({(8'ha8)} > (8'ha9)))))
        begin
          reg8 <= reg7;
          reg9 <= ($signed($signed((8'h9d))) > ($unsigned(({reg8} ?
              wire2 : (~&wire4))) ~^ $unsigned(reg7[(2'h3):(1'h0)])));
          reg10 <= (((^~wire5) && ($unsigned((wire0 <<< wire2)) ?
              $signed((~&wire1)) : (reg6[(2'h2):(2'h2)] >> wire1))) ^~ (-((^~(~^wire5)) ?
              ({wire0} >>> reg8) : (!$signed((8'hb7))))));
        end
      else
        begin
          reg8 <= ({$signed(((!reg9) ? $unsigned(reg9) : (|reg7))),
              ((-(wire5 ? reg8 : wire4)) ?
                  (wire4[(1'h0):(1'h0)] == reg6) : {$signed(wire0),
                      $signed((8'hba))})} ^ $unsigned((!(!reg7))));
        end
      reg11 <= $signed((~^(reg10[(4'hc):(1'h0)] >= reg7[(4'hc):(4'h8)])));
      if ($unsigned(reg6[(3'h4):(1'h0)]))
        begin
          reg12 <= (&{((wire3 ?
                  wire4[(2'h2):(1'h0)] : $unsigned(wire0)) ~^ (~^((8'hae) & (7'h41)))),
              $signed($signed(reg6))});
          reg13 <= $signed(reg9);
        end
      else
        begin
          reg12 <= reg11;
          reg13 <= $unsigned(reg11[(1'h0):(1'h0)]);
          reg14 <= reg9[(4'h9):(2'h3)];
        end
    end
  assign wire15 = reg9;
  assign wire16 = (^~((((reg14 > (8'hb0)) * $unsigned((8'haa))) ?
                      ($unsigned((8'hb0)) ?
                          (8'haf) : wire1) : $signed((~wire0))) ^ $unsigned(reg10)));
  module17 #() modinst110 (wire109, clk, wire5, wire0, reg12, reg6);
  assign wire111 = (((reg13[(2'h2):(2'h2)] ?
                               reg10[(3'h5):(1'h0)] : {(reg9 ?
                                       (8'hb7) : reg12)}) ?
                           ($signed((wire109 ?
                               reg10 : reg7)) + (~^$unsigned(wire16))) : reg11) ?
                       (~$unsigned(({(8'hbe)} ?
                           wire15 : wire16))) : $signed((8'had)));
  assign wire112 = wire15;
  assign wire113 = (^~$signed(((+((8'hb0) << wire109)) + ($unsigned(wire111) < (wire1 ?
                       reg9 : wire5)))));
  assign wire114 = ((~&reg10) & (~^wire109[(2'h2):(2'h2)]));
  assign wire115 = (reg14[(1'h1):(1'h0)] & (~^(~(-reg13[(3'h4):(1'h0)]))));
  assign wire116 = $unsigned(((!$unsigned($unsigned(wire115))) ?
                       $unsigned((wire109[(1'h0):(1'h0)] >> $unsigned(reg13))) : (+($signed(reg8) ?
                           wire113 : ((8'hb4) ~^ reg13)))));
  always
    @(posedge clk) begin
      reg117 <= reg13[(3'h4):(1'h0)];
    end
  assign wire118 = (($signed((8'haf)) + $signed($signed(wire15[(1'h1):(1'h0)]))) ?
                       $signed(($unsigned((reg6 ^ wire16)) ?
                           {$signed(wire111),
                               $signed((8'ha8))} : $signed(wire1[(4'he):(4'h8)]))) : wire111[(1'h0):(1'h0)]);
  assign wire119 = (8'hb6);
  assign wire120 = reg8;
  module121 #() modinst135 (.wire122(reg9), .wire125(wire111), .wire124(wire15), .y(wire134), .clk(clk), .wire123(wire114));
endmodule

module module121
#(parameter param133 = {(^{{((8'hb9) - (8'ha0))}})})
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire125;
  input wire [(3'h4):(1'h0)] wire124;
  input wire signed [(4'hc):(1'h0)] wire123;
  input wire [(4'hb):(1'h0)] wire122;
  wire [(4'he):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(5'h13):(1'h0)] wire130;
  wire signed [(5'h15):(1'h0)] wire129;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 (1'h0)};
  assign wire126 = {($unsigned(wire125) && (^$unsigned((wire125 ?
                           wire123 : wire122)))),
                       wire125};
  assign wire127 = wire124;
  assign wire128 = ((~^wire122[(2'h3):(1'h1)]) ?
                       (&{wire124,
                           $unsigned($signed(wire124))}) : $signed(wire127));
  assign wire129 = (^~wire127);
  assign wire130 = {($unsigned($unsigned((^wire126))) > (~&$signed(wire129))),
                       (~^wire126)};
  assign wire131 = ({(wire125[(4'h9):(1'h1)] >>> {$signed(wire128)}),
                           (($unsigned((8'ha2)) ?
                                   $signed(wire127) : ((8'hae) <<< wire128)) ?
                               $unsigned(wire122) : $unsigned(wire125))} ?
                       ({$unsigned((wire128 & wire124))} - wire130[(4'he):(4'h8)]) : $unsigned(wire122));
  assign wire132 = (wire131 <<< $unsigned((wire130[(4'hc):(2'h3)] ?
                       (^wire129[(4'hb):(4'h9)]) : wire128)));
endmodule

module module17
#(parameter param108 = (((~({(8'ha7), (7'h41)} || (+(7'h42)))) <<< ((^~((8'ha8) ? (7'h40) : (8'h9f))) | (&(8'hb2)))) ? ((!((^(8'haa)) | {(8'hb1)})) ? {(((8'hac) < (8'hbd)) ? (~&(8'hb1)) : ((8'ha8) == (8'ha3))), (~&(-(8'hb3)))} : (((&(8'hb5)) ? ((8'hb3) & (8'h9f)) : ((8'hb6) ? (7'h41) : (8'h9c))) ~^ ((8'hbd) * ((7'h44) > (8'ha7))))) : {(~|(((8'hbd) < (8'hb1)) >>> (~(8'ha2))))}))
(y, clk, wire18, wire19, wire20, wire21);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire [(4'he):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire46;
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  assign y = {wire106,
                 wire74,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire28,
                 wire46,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg22 <= (($unsigned($unsigned($signed(wire18))) ?
          (($signed(wire21) && $unsigned(wire18)) ?
              (wire20[(2'h2):(1'h0)] <<< wire18) : $signed((wire18 & wire19))) : $unsigned((wire20[(3'h7):(3'h4)] ?
              wire19[(3'h4):(1'h0)] : (wire18 ? wire18 : wire18)))) | (8'hac));
    end
  always
    @(posedge clk) begin
      reg23 <= ((^~$signed(wire21)) | wire19[(2'h3):(2'h2)]);
      reg24 <= {$signed({wire19[(3'h6):(1'h0)], $signed((+reg23))})};
      reg25 <= wire18[(1'h0):(1'h0)];
      reg26 <= reg24;
      reg27 <= $signed(wire20);
    end
  assign wire28 = ($signed({wire18,
                      (reg23[(2'h2):(1'h0)] ?
                          (wire21 ?
                              (8'hb0) : reg23) : wire20[(4'hb):(4'ha)])}) <= {$signed(reg27[(4'h9):(4'h9)])});
  module29 #() modinst47 (.clk(clk), .y(wire46), .wire31(reg25), .wire33(reg27), .wire32(reg22), .wire30(wire18));
  assign wire48 = (wire46[(4'he):(4'hb)] >= ((($signed((8'haf)) ?
                              ((8'ha1) ? reg23 : reg26) : {wire21}) ?
                          (~^$unsigned(wire46)) : reg27) ?
                      (($signed(reg24) ?
                          ((7'h43) ?
                              reg27 : reg24) : $signed(reg22)) || (+(wire20 ?
                          (8'hb3) : reg25))) : ((+(8'ha4)) ?
                          ($unsigned(reg26) == $signed(reg25)) : $unsigned(reg25[(3'h6):(3'h6)]))));
  assign wire49 = $unsigned(({($signed(reg26) + reg23[(2'h2):(1'h1)]),
                      ($signed((8'hb8)) ^~ {reg22})} >> wire46[(3'h6):(3'h6)]));
  assign wire50 = ($unsigned($unsigned(wire46[(4'he):(4'ha)])) * $unsigned(((8'had) ?
                      reg25[(1'h1):(1'h0)] : ({(7'h42),
                          wire49} - $unsigned(reg27)))));
  assign wire51 = $signed((!({(8'hab)} | wire18)));
  always
    @(posedge clk) begin
      reg52 <= {(~|wire19[(3'h7):(3'h5)])};
      if (wire20)
        begin
          reg53 <= {($signed($signed(wire21[(2'h3):(1'h0)])) ?
                  $unsigned($unsigned($unsigned((8'h9f)))) : reg27),
              ((((wire48 ? wire46 : reg23) ?
                  (7'h41) : (~|reg23)) * (-$signed(wire20))) | reg52[(4'hc):(2'h2)])};
        end
      else
        begin
          reg53 <= (!$signed($unsigned($unsigned($signed(wire48)))));
        end
      reg54 <= ((|(wire50 < (&{(8'hb7)}))) ?
          (reg27[(5'h12):(4'ha)] + reg25[(4'h8):(3'h5)]) : reg25[(3'h7):(3'h5)]);
      reg55 <= (reg24[(5'h12):(3'h6)] | (&reg22[(3'h4):(2'h3)]));
    end
  module56 #() modinst75 (wire74, clk, wire46, wire48, wire49, reg54, wire18);
  module76 #() modinst107 (wire106, clk, reg23, reg52, wire48, wire49);
endmodule

module module76
#(parameter param105 = ((-(((^(7'h40)) ^ ((8'h9f) ~^ (8'hb3))) ? ((~|(8'hae)) ? (-(7'h44)) : ((8'ha7) <= (8'ha6))) : (((8'ha2) ? (8'ha0) : (8'hb6)) ? (~(8'hb8)) : ((8'hb7) ? (8'hb4) : (8'had))))) << (8'hb9)))
(y, clk, wire80, wire79, wire78, wire77);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire80;
  input wire signed [(4'he):(1'h0)] wire79;
  input wire [(5'h12):(1'h0)] wire78;
  input wire signed [(4'h9):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire82,
                 wire81,
                 reg101,
                 reg100,
                 reg99,
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
                 reg83,
                 (1'h0)};
  assign wire81 = ($signed((wire79[(1'h0):(1'h0)] ?
                      {(wire77 * (8'hbe))} : (8'ha7))) >= (~&{(wire77 << $unsigned((8'haa))),
                      (8'hb7)}));
  assign wire82 = (wire80[(2'h2):(1'h1)] || wire77[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire79[(4'h8):(2'h2)])
        begin
          reg83 <= (^~{wire77, wire82});
          reg84 <= {wire78[(4'hb):(2'h3)]};
          reg85 <= $signed(reg84);
          if ($unsigned($signed(reg85)))
            begin
              reg86 <= $unsigned($signed((((wire80 || reg83) ?
                      wire79[(4'hc):(3'h4)] : (reg85 ? wire77 : wire82)) ?
                  (~|(wire82 <<< reg84)) : reg85[(3'h6):(1'h0)])));
              reg87 <= (+((((~^reg86) ? $unsigned(reg86) : $unsigned(wire82)) ?
                      (~|wire77) : $unsigned($unsigned(wire77))) ?
                  $signed(($unsigned(wire78) >>> (8'hb2))) : (7'h40)));
              reg88 <= (~wire81[(1'h0):(1'h0)]);
              reg89 <= $unsigned(reg87[(2'h2):(1'h1)]);
            end
          else
            begin
              reg86 <= $signed($unsigned($unsigned((wire78 ? wire78 : reg87))));
              reg87 <= (reg88 ?
                  $unsigned((reg83 - $unsigned((wire81 ?
                      reg83 : wire79)))) : ($signed(((|wire82) ?
                      wire80[(4'h8):(3'h6)] : (reg89 ?
                          wire82 : reg89))) <<< $signed(reg85)));
              reg88 <= (&wire78[(3'h5):(2'h2)]);
              reg89 <= ((((^~wire80[(3'h7):(1'h0)]) ?
                          $signed(wire78[(2'h3):(1'h0)]) : $signed($unsigned((8'hb8)))) ?
                      ($signed((|reg88)) ?
                          reg88 : (|(&reg86))) : {$unsigned((reg88 ?
                              reg88 : reg87))}) ?
                  ({((8'ha8) - (wire79 ? (8'had) : wire78))} ?
                      {$unsigned((&wire79)),
                          $unsigned((reg89 ^~ reg83))} : $unsigned($signed((~&(8'hb7))))) : wire79);
            end
        end
      else
        begin
          reg83 <= wire82[(4'h9):(2'h2)];
        end
      reg90 <= wire81;
      if (wire78)
        begin
          reg91 <= $signed($signed(({(-wire80)} ?
              (((8'haf) == wire77) + wire81[(2'h3):(1'h1)]) : (~|reg86[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg91 <= ((wire81 << reg84[(4'h9):(3'h6)]) ^~ wire80);
          reg92 <= {((-$unsigned($unsigned(wire79))) ^~ (($unsigned((8'hb5)) == wire78) >> wire81[(3'h5):(3'h4)]))};
          reg93 <= ($unsigned((((reg85 & wire82) ^~ reg84[(2'h3):(1'h1)]) ?
                  reg90[(4'hc):(2'h2)] : (reg91 ~^ (reg89 & reg85)))) ?
              $unsigned(reg83[(1'h1):(1'h0)]) : (reg87[(1'h1):(1'h1)] ?
                  $unsigned(reg92) : wire79));
          reg94 <= reg85;
          reg95 <= wire77;
        end
    end
  assign wire96 = (reg87 ?
                      $unsigned((wire77[(3'h4):(2'h3)] << (^~reg95[(4'hb):(1'h1)]))) : reg84[(2'h2):(2'h2)]);
  assign wire97 = (|(+($signed(reg83[(2'h2):(1'h1)]) + (^~$unsigned((8'hbd))))));
  assign wire98 = (wire82[(4'ha):(1'h0)] < reg84);
  always
    @(posedge clk) begin
      reg99 <= wire82;
      reg100 <= (!(reg84[(5'h11):(2'h2)] >>> $signed(reg85)));
      reg101 <= (^(((^~wire82[(3'h7):(2'h3)]) ?
          ((reg83 ? wire79 : reg100) ?
              reg83[(1'h1):(1'h1)] : $signed(reg86)) : ((reg87 ?
              reg87 : reg84) | (wire79 <<< reg88))) < $signed(reg95)));
    end
  assign wire102 = (({(8'hb0)} ? reg100 : reg91) ^ ({($signed(reg93) ?
                               reg90[(1'h0):(1'h0)] : (~&wire81))} ?
                       reg84 : reg83[(1'h0):(1'h0)]));
  assign wire103 = $signed($unsigned((|$unsigned((reg87 ? reg99 : reg93)))));
  assign wire104 = ($signed(reg94) <= reg86[(3'h6):(3'h4)]);
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire61;
  input wire signed [(4'hb):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire [(4'hb):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire62 = (((~$unsigned($signed(wire57))) < ($unsigned($unsigned(wire57)) == wire58)) ?
                      wire60 : $unsigned((!(~^(^~(8'ha7))))));
  assign wire63 = $signed((({wire59[(4'he):(1'h0)]} ?
                      $signed({(8'haf)}) : wire60[(1'h1):(1'h0)]) * wire59));
  assign wire64 = (((~|$unsigned(wire59)) ?
                          {(~|wire63)} : wire63[(1'h1):(1'h1)]) ?
                      (~^($signed((wire60 < wire60)) || (wire57[(2'h2):(2'h2)] ?
                          wire61 : $unsigned(wire62)))) : wire63[(3'h4):(3'h4)]);
  assign wire65 = $unsigned({{$signed({wire58})}, {(8'haa)}});
  assign wire66 = (((~^({wire60} ^~ (wire65 < (8'hb2)))) ?
                      $unsigned(wire57[(4'h9):(4'h8)]) : wire58[(2'h3):(2'h3)]) != wire58);
  always
    @(posedge clk) begin
      if ((~$unsigned(wire63[(1'h0):(1'h0)])))
        begin
          reg67 <= {($unsigned((~&$unsigned(wire66))) >> wire65),
              wire60[(2'h2):(2'h2)]};
          reg68 <= ({($unsigned($unsigned(wire58)) >>> {(wire59 ^ wire66),
                      $unsigned(wire60)}),
                  (^~(~|reg67))} ?
              $signed({(&(wire62 && wire60))}) : wire66);
        end
      else
        begin
          if (((~&{(^$signed(wire63)),
              $unsigned($signed(wire59))}) >= $signed({$signed((reg67 ?
                  (8'hab) : wire65))})))
            begin
              reg67 <= ((({{wire60,
                          wire58}} ^~ ($unsigned(wire62) ^ reg67[(2'h3):(2'h3)])) - ({(wire65 ?
                              (8'hbb) : reg67),
                          $signed((8'haa))} ?
                      wire59 : reg68[(3'h5):(1'h0)])) ?
                  (~(^wire66[(1'h0):(1'h0)])) : ($signed(wire64[(2'h2):(1'h0)]) ?
                      wire65[(2'h2):(2'h2)] : {(wire64[(1'h1):(1'h0)] ^~ wire65[(2'h3):(1'h0)])}));
            end
          else
            begin
              reg67 <= wire62;
            end
          reg68 <= (^($unsigned((wire66 ?
              wire65 : (-wire58))) && (~^$unsigned({wire60}))));
          reg69 <= ({$signed(((wire58 ~^ wire57) ?
                      ((8'ha4) ? wire57 : (8'hab)) : reg68)),
                  ($signed(wire59) - {{(8'h9c)}, wire58[(4'hb):(2'h2)]})} ?
              reg67[(4'hd):(4'ha)] : (~^(^~({wire64, wire62} < (wire66 ?
                  wire61 : wire59)))));
        end
      reg70 <= (8'hab);
    end
  always
    @(posedge clk) begin
      if (wire58[(3'h4):(2'h3)])
        begin
          reg71 <= (reg70[(1'h0):(1'h0)] ^ (wire61[(4'h9):(2'h2)] ?
              $unsigned(reg68) : (((wire59 ? reg67 : (8'h9e)) ?
                      (!reg70) : reg67) ?
                  ((wire61 < reg69) >> wire62) : $signed(wire57[(2'h3):(1'h1)]))));
          reg72 <= reg69;
        end
      else
        begin
          reg71 <= $unsigned(wire62[(4'hc):(4'hc)]);
        end
      reg73 <= $signed(reg72[(3'h7):(3'h6)]);
    end
endmodule

module module29
#(parameter param45 = (8'hab))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire44;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire34 = {(7'h43), (&$unsigned(((~wire32) ^~ $signed((7'h44)))))};
  assign wire35 = $signed((^wire32[(2'h3):(1'h1)]));
  assign wire36 = wire35;
  assign wire37 = $signed($unsigned($signed((wire32 | $signed((8'ha0))))));
  always
    @(posedge clk) begin
      reg38 <= {($signed(($signed(wire35) ?
                  (wire33 ^ wire30) : $signed(wire33))) ?
              (((^(8'ha6)) | wire37[(4'hb):(4'hb)]) & ($unsigned((8'hb7)) ?
                  $unsigned(wire37) : wire36)) : wire37),
          wire35};
      reg39 <= (~&(~&wire33[(3'h7):(3'h4)]));
    end
  assign wire40 = wire36[(4'hd):(3'h4)];
  assign wire41 = wire30[(2'h2):(2'h2)];
  assign wire42 = wire36;
  assign wire43 = $signed(($unsigned({(&wire40)}) ?
                      $signed($signed((~^wire31))) : wire32[(3'h7):(1'h0)]));
  assign wire44 = (^(wire43 ?
                      ((|((8'hbc) ? (8'ha9) : wire41)) ?
                          (8'hb7) : wire42[(4'hb):(3'h6)]) : $unsigned($unsigned(wire42[(4'h8):(2'h2)]))));
endmodule
