module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire82;
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  assign y = {wire119,
                 wire54,
                 wire56,
                 wire57,
                 wire82,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 (1'h0)};
  module4 #() modinst55 (.wire5(wire2), .wire7(wire3), .wire6(wire1), .y(wire54), .wire8(wire0), .clk(clk));
  assign wire56 = $signed((!($unsigned((&wire54)) <= (&(wire1 ?
                      wire54 : (8'hac))))));
  assign wire57 = $signed(($signed($signed($unsigned(wire1))) <= $unsigned($unsigned($unsigned(wire54)))));
  module58 #() modinst83 (.y(wire82), .wire63(wire3), .wire60(wire57), .wire61(wire2), .clk(clk), .wire62(wire1), .wire59(wire54));
  always
    @(posedge clk) begin
      if (wire56)
        begin
          if (((&wire57[(1'h1):(1'h0)]) >= wire3))
            begin
              reg84 <= $signed((~&{wire3[(1'h1):(1'h0)], $unsigned({wire57})}));
              reg85 <= (~reg84[(2'h2):(2'h2)]);
            end
          else
            begin
              reg84 <= (~|{reg84[(2'h2):(1'h0)]});
              reg85 <= (wire54[(4'he):(4'ha)] ?
                  ((wire2[(4'hf):(4'he)] ?
                          (wire57[(3'h6):(2'h3)] ?
                              wire1 : wire56[(1'h1):(1'h1)]) : wire3) ?
                      reg84[(2'h2):(1'h0)] : {(8'hb8),
                          $unsigned(wire1[(5'h14):(4'hb)])}) : $unsigned((^reg84[(1'h1):(1'h0)])));
              reg86 <= $unsigned($signed((wire3 ?
                  (+$unsigned((8'ha0))) : ($unsigned(reg85) == (wire82 || reg84)))));
            end
          reg87 <= (^($signed(($signed((8'haa)) > {wire1,
              wire56})) ^~ (~|reg85[(3'h4):(2'h2)])));
          reg88 <= ({(-$signed((-reg85))), {$signed((8'hbd))}} != wire1);
          reg89 <= ((~|{{(wire0 ? wire0 : reg85), reg87[(2'h2):(1'h1)]}}) ?
              $unsigned($unsigned((~&$unsigned(wire2)))) : (((&$unsigned(wire82)) ?
                      ((reg88 * wire2) ?
                          wire57[(3'h4):(1'h1)] : (wire3 ?
                              wire3 : wire2)) : (reg87[(2'h2):(2'h2)] ?
                          (8'ha8) : $unsigned(wire0))) ?
                  {(wire3[(3'h5):(1'h0)] > (~&(8'haf))),
                      (^reg86)} : ($signed((~&wire54)) ?
                      $unsigned((reg84 ? reg86 : wire0)) : (((8'haa) >= reg84) ?
                          (8'ha5) : $signed(wire57)))));
        end
      else
        begin
          reg84 <= wire2[(4'hf):(2'h2)];
          reg85 <= reg84[(2'h3):(2'h3)];
          reg86 <= ((((wire3[(4'h8):(2'h3)] & ((8'hb8) ?
                      (8'hb6) : wire2)) >= wire56[(5'h10):(4'hc)]) ?
                  {((~|(8'hb0)) ?
                          {wire1,
                              wire3} : (+wire3))} : ((|(wire3 >>> (8'hbf))) ~^ reg86)) ?
              $signed({((reg89 ? reg87 : reg88) ?
                      (wire0 > wire1) : (~&wire1))}) : wire0[(4'hb):(3'h7)]);
        end
    end
  module90 #() modinst120 (wire119, clk, wire2, wire1, reg88, reg89, reg84);
endmodule

module module90  (y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire95;
  input wire [(4'hf):(1'h0)] wire94;
  input wire signed [(5'h11):(1'h0)] wire93;
  input wire signed [(3'h5):(1'h0)] wire92;
  input wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'h9):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire [(2'h3):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(5'h13):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'h9):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 (1'h0)};
  assign wire96 = (wire91 ?
                      $unsigned((+(-wire93[(4'he):(4'ha)]))) : (wire93 ^~ ($unsigned({wire91}) <<< {(8'ha9)})));
  assign wire97 = wire91;
  assign wire98 = ((~|wire92[(2'h2):(1'h1)]) != $unsigned((~|wire94)));
  assign wire99 = (~|((^~(|(wire94 ?
                      wire96 : wire91))) <= $signed($signed(wire92[(3'h5):(1'h1)]))));
  assign wire100 = ($unsigned((7'h42)) && ($unsigned((8'ha1)) > $signed($signed((wire94 ?
                       wire91 : (8'hb9))))));
  assign wire101 = (((({wire96} ?
                       (wire98 * wire100) : (^(8'hba))) <= ($unsigned(wire93) ?
                       wire95[(3'h5):(3'h5)] : (^wire99))) - $signed(($signed(wire96) != (~^wire100)))) && $signed((~wire91[(4'hb):(3'h7)])));
  assign wire102 = ($signed($unsigned((^{wire93}))) | (wire96[(2'h2):(2'h2)] | wire101[(1'h1):(1'h0)]));
  assign wire103 = (~|wire100);
  assign wire104 = $signed($signed(($signed($unsigned(wire91)) ?
                       ($signed(wire101) << $signed(wire100)) : (wire96[(3'h7):(2'h2)] ?
                           $unsigned(wire96) : (wire96 >>> wire96)))));
  assign wire105 = $signed($unsigned($unsigned((-(wire95 ?
                       wire103 : wire92)))));
  assign wire106 = wire94;
  always
    @(posedge clk) begin
      reg107 <= $unsigned(wire101);
      reg108 <= $unsigned(((wire105[(3'h4):(3'h4)] > ((^~wire101) & $signed((8'ha7)))) ?
          wire94[(4'ha):(2'h2)] : $signed((wire95 ?
              (wire105 || wire97) : (wire95 || wire91)))));
      if (reg108)
        begin
          reg109 <= {(^$unsigned(wire93[(5'h10):(3'h6)]))};
        end
      else
        begin
          reg109 <= $unsigned({wire102[(2'h3):(1'h0)], reg108[(3'h6):(3'h4)]});
        end
      reg110 <= (^$signed(wire98[(1'h0):(1'h0)]));
      if ((~^wire102))
        begin
          reg111 <= (wire100 ?
              (wire103[(2'h2):(1'h1)] <= $unsigned(((~&wire103) ?
                  $unsigned(wire106) : (~^wire91)))) : (($unsigned($signed(wire105)) ~^ ((|(8'hae)) ?
                      wire94[(3'h5):(1'h1)] : reg107)) ?
                  $signed({$signed(wire94)}) : (+reg107)));
          reg112 <= wire101[(1'h0):(1'h0)];
          reg113 <= $signed($unsigned((~^(-{(8'hb5), wire100}))));
          reg114 <= ((($unsigned((reg110 ^ wire106)) == (~&(wire105 ?
                  reg111 : reg109))) * reg110[(4'hb):(4'h9)]) ?
              $unsigned(wire94) : ((((~|(8'ha9)) == ((8'h9d) ?
                  reg113 : reg109)) >> $unsigned(reg109[(4'hb):(4'h8)])) || (!(|(wire99 ?
                  reg110 : wire106)))));
          reg115 <= ($signed(({(wire96 ?
                      reg107 : (8'had))} + $signed($signed(reg109)))) ?
              $unsigned((((reg113 >= wire106) ^ $unsigned((8'h9c))) ?
                  wire93[(4'hd):(4'hb)] : (~^reg107))) : $unsigned(wire105));
        end
      else
        begin
          if ((wire103[(3'h4):(3'h4)] + $signed(wire100[(2'h2):(2'h2)])))
            begin
              reg111 <= reg115[(4'h8):(3'h5)];
            end
          else
            begin
              reg111 <= ($unsigned(((wire100[(3'h7):(3'h5)] && wire93) ?
                      wire104[(3'h7):(2'h3)] : $unsigned($unsigned((8'hb1))))) ?
                  ($signed((wire92 ? (reg110 * reg107) : $unsigned(reg112))) ?
                      reg110[(4'h9):(3'h7)] : reg115[(3'h7):(2'h3)]) : (|$signed(reg109)));
            end
          reg112 <= (8'ha8);
          reg113 <= (|reg114);
          if (reg107[(2'h2):(2'h2)])
            begin
              reg114 <= (wire95[(3'h4):(1'h0)] ?
                  (~&reg107[(1'h0):(1'h0)]) : ((($unsigned(reg112) ?
                      $unsigned(reg108) : (wire91 << wire99)) <<< (reg108[(3'h7):(3'h4)] ?
                      $signed((8'ha7)) : (reg113 >> reg111))) ^ $unsigned(((wire100 - reg112) != {wire91}))));
              reg115 <= {wire96,
                  $unsigned((((reg111 ? (8'hb2) : reg107) ?
                      (wire100 ? wire101 : wire103) : (&wire92)) ^~ ({wire93,
                          reg112} ?
                      (reg114 ? wire106 : wire91) : (~&wire92))))};
            end
          else
            begin
              reg114 <= $unsigned($unsigned($unsigned(((|wire104) ?
                  ((8'h9c) || wire93) : reg109))));
              reg115 <= wire96[(1'h0):(1'h0)];
            end
          reg116 <= reg109;
        end
    end
  assign wire117 = ((reg113 ~^ (~&(reg114 | reg113))) != $signed((7'h41)));
  assign wire118 = ($signed(wire100[(1'h0):(1'h0)]) ?
                       wire101[(2'h2):(2'h2)] : (~&($unsigned($signed((8'hb6))) ?
                           {((7'h41) & wire101),
                               (wire101 ? wire95 : wire105)} : wire99)));
endmodule

module module58
#(parameter param81 = ({(+({(8'hbc), (8'hb9)} <= ((8'hbe) > (8'hb6))))} ? ({({(7'h42), (8'h9d)} ? ((8'ha1) + (8'hbc)) : ((8'ha0) ? (8'ha5) : (8'hae))), {((8'hac) ? (8'hbb) : (7'h42)), ((8'hbf) ? (8'hb7) : (8'haa))}} ? (8'h9e) : (|({(8'hb9), (7'h44)} >> (8'h9e)))) : ((8'hab) ? (((|(8'h9f)) ^~ ((8'hb8) * (8'hb7))) >= ({(8'ha0)} <= (|(8'hbb)))) : ((~&(-(8'hab))) <<< (|((8'hb6) & (8'ha6)))))))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire63;
  input wire signed [(2'h3):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  input wire signed [(4'hc):(1'h0)] wire60;
  input wire [(4'he):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 reg68,
                 (1'h0)};
  assign wire64 = (($unsigned($signed(wire61[(2'h3):(1'h1)])) ?
                          $unsigned($unsigned($signed(wire60))) : (-((^wire61) <<< ((8'h9d) ?
                              wire63 : wire59)))) ?
                      (wire59 >= wire63) : ((&(wire60 - wire59)) || ((~&(^wire61)) ?
                          wire60 : ((wire63 << wire63) > wire63[(3'h5):(3'h5)]))));
  assign wire65 = $unsigned((^((wire63 ?
                      wire62[(1'h1):(1'h1)] : {wire63,
                          (8'haa)}) == wire62[(2'h3):(2'h2)])));
  assign wire66 = (&wire61[(1'h1):(1'h0)]);
  assign wire67 = $unsigned(wire61[(3'h5):(2'h3)]);
  always
    @(posedge clk) begin
      reg68 <= {$unsigned(($unsigned($unsigned(wire63)) > ($unsigned(wire63) == (~&wire60)))),
          $signed($signed((+$signed(wire65))))};
      reg69 <= wire66;
      if (((((~&(wire62 << wire66)) ?
              (|{reg68, wire59}) : $signed($unsigned((8'hb0)))) ?
          wire62 : ($signed((-wire62)) >= wire60[(1'h0):(1'h0)])) ~^ wire60[(2'h3):(1'h1)]))
        begin
          reg70 <= $signed($signed({$signed(wire64[(4'hb):(1'h1)])}));
          reg71 <= $unsigned(wire60[(1'h1):(1'h1)]);
          if ($signed((wire65 != reg70[(3'h7):(3'h6)])))
            begin
              reg72 <= reg69[(4'he):(2'h2)];
              reg73 <= (~^((^~wire67) + reg70));
              reg74 <= wire64;
              reg75 <= $unsigned(wire66);
              reg76 <= {((^~reg70[(3'h5):(2'h3)]) ?
                      wire67[(3'h5):(2'h3)] : wire60[(1'h0):(1'h0)]),
                  reg74[(1'h0):(1'h0)]};
            end
          else
            begin
              reg72 <= $signed(((wire66[(1'h0):(1'h0)] >>> ((reg70 ?
                      reg73 : (8'hb7)) - (&reg72))) ?
                  reg71 : ((!$unsigned((8'hba))) ?
                      $signed((|reg73)) : (reg75 ? wire59 : $signed(wire65)))));
              reg73 <= (+{{$unsigned((8'hb4)), $signed($unsigned(reg76))}});
              reg74 <= wire65[(4'hb):(4'h8)];
            end
          if (((wire66[(1'h1):(1'h1)] && $signed((^~$signed(reg74)))) ?
              (&(((reg69 >= wire62) >>> {reg68}) && wire59[(4'ha):(1'h1)])) : (((wire65 | (wire66 ?
                      wire64 : wire64)) >> (+{reg73})) ?
                  wire67[(3'h7):(2'h3)] : wire65[(2'h3):(2'h3)])))
            begin
              reg77 <= (wire66 >> (-(((reg73 > wire65) ?
                  $signed((8'hb3)) : wire63) & $unsigned($unsigned(wire64)))));
              reg78 <= reg72;
            end
          else
            begin
              reg77 <= reg75;
              reg78 <= (((reg68[(3'h5):(3'h5)] ?
                      $signed($signed(wire63)) : reg70) >>> ($signed($unsigned(wire62)) ?
                      (~^$unsigned(reg74)) : {reg69, $signed(reg71)})) ?
                  (((reg77[(4'hc):(3'h4)] ?
                      (|wire61) : wire61) < $signed($unsigned(reg74))) <= reg68) : $unsigned($unsigned((reg73[(3'h7):(2'h2)] ?
                      $unsigned(wire59) : wire67[(3'h6):(1'h1)]))));
            end
        end
      else
        begin
          if (((8'h9f) & ((~reg70[(4'h8):(3'h7)]) ?
              (-wire61) : (reg70 ?
                  $signed(reg78[(4'ha):(2'h2)]) : (wire64 - (reg69 + reg69))))))
            begin
              reg70 <= {((((~&reg75) ?
                          (wire67 ~^ reg74) : wire66) ^~ $unsigned({wire60,
                          wire60})) ?
                      $unsigned((-wire64[(2'h3):(1'h0)])) : (8'hae))};
              reg71 <= reg71[(4'hd):(4'h9)];
              reg72 <= (reg71[(2'h3):(2'h2)] ?
                  reg73 : $signed(wire67[(2'h3):(1'h1)]));
            end
          else
            begin
              reg70 <= ((((8'h9f) <<< (8'hac)) ?
                  (reg77[(1'h0):(1'h0)] ?
                      wire62[(2'h2):(1'h1)] : $signed({wire67,
                          reg76})) : ($unsigned((wire60 || reg75)) >= ((reg71 & reg72) >> $unsigned(wire59)))) != ($unsigned(wire62[(1'h0):(1'h0)]) ?
                  $unsigned((&reg75[(1'h1):(1'h1)])) : $signed($unsigned((-wire66)))));
              reg71 <= reg74[(2'h2):(2'h2)];
              reg72 <= reg75[(1'h1):(1'h0)];
              reg73 <= reg75[(1'h0):(1'h0)];
            end
          reg74 <= $unsigned(wire60);
          reg75 <= {$signed($signed(((wire65 ? reg74 : reg75) ?
                  (reg72 ? wire61 : wire61) : (wire61 ? reg68 : (8'haa)))))};
        end
    end
  assign wire79 = $signed(((~(8'ha4)) + ($signed(wire61) || (~^(~wire66)))));
  assign wire80 = {$signed($signed(((wire67 ? wire61 : reg75) ?
                          {reg78} : ((8'ha6) ? reg73 : (8'hb5))))),
                      $unsigned($signed((wire63[(1'h0):(1'h0)] ?
                          (reg73 ^~ (8'hb3)) : $unsigned(reg73))))};
endmodule

module module4
#(parameter param52 = (((!(((8'hbc) <<< (8'ha8)) ? ((8'ha4) - (8'ha3)) : (8'hb2))) && ((!{(8'hab)}) ? (((8'haf) ? (8'ha8) : (8'hbb)) ? ((8'hb1) ? (8'ha5) : (7'h40)) : (-(7'h42))) : {((8'haa) == (8'hba)), (~(8'hb7))})) >> ((((7'h42) ? ((8'ha1) | (8'hbd)) : (~^(8'ha4))) ? (-((8'hb5) ? (8'ha0) : (8'hba))) : (((8'ha0) ? (7'h41) : (7'h43)) & (~|(8'hb4)))) ^ (+((8'haf) ? ((8'hb4) ? (8'hbe) : (8'had)) : ((7'h44) != (8'hb2)))))), 
parameter param53 = (^~(^param52)))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  assign y = {wire50, wire14, wire13, wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = wire8;
  assign wire10 = $unsigned($signed((wire8[(3'h4):(1'h1)] <<< {$unsigned(wire9),
                      {wire5, wire8}})));
  assign wire11 = $unsigned(wire8[(3'h6):(3'h4)]);
  assign wire12 = ({wire7[(2'h3):(1'h1)]} ?
                      ({$unsigned((wire8 ? wire9 : wire6))} ?
                          $unsigned((wire8[(3'h5):(2'h3)] ?
                              $unsigned(wire5) : {wire6,
                                  wire10})) : (~($signed(wire6) == (wire10 ?
                              wire10 : (8'hb1))))) : wire7[(3'h5):(1'h1)]);
  assign wire13 = ((wire11 == $signed(((wire9 << wire7) ? wire12 : wire8))) ?
                      (&wire12[(1'h1):(1'h1)]) : $unsigned({wire8[(2'h3):(1'h0)],
                          $signed((wire10 ~^ wire7))}));
  assign wire14 = (wire12 + {wire13[(3'h4):(1'h0)], wire5});
  module15 #() modinst51 (.y(wire50), .wire18(wire6), .clk(clk), .wire19(wire5), .wire17(wire11), .wire16(wire13));
endmodule

module module15
#(parameter param49 = (-(!((+((8'had) ? (8'ha4) : (8'hbc))) ? {((7'h44) ? (8'hbf) : (8'hb1))} : {{(8'hb9)}, (~(8'hbf))}))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire20;
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire28,
                 wire20,
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
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire20 = wire18[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg21 <= $unsigned(wire17);
      reg22 <= (^reg21[(1'h1):(1'h1)]);
      reg23 <= $signed(((wire20[(2'h2):(1'h1)] != wire18[(4'he):(3'h6)]) ?
          reg22 : (wire20 >> reg21)));
      if ($unsigned(({$signed((&reg21))} ?
          reg22 : (((wire17 ? wire18 : (8'hb8)) ? $unsigned((8'ha4)) : wire17) ?
              (8'ha4) : ($unsigned(wire18) ? $signed(wire16) : (8'hab))))))
        begin
          reg24 <= wire19;
          reg25 <= $unsigned(($signed((wire19 >> (wire19 ? (8'haa) : wire17))) ?
              (reg24[(1'h0):(1'h0)] ?
                  (((8'ha4) ?
                      reg23 : reg22) + $signed(reg21)) : (+$signed(reg22))) : wire18));
          reg26 <= $unsigned((($unsigned((wire18 ^ reg24)) ?
              (wire18[(3'h7):(3'h5)] ?
                  (reg21 ~^ wire19) : (reg22 | wire17)) : $signed(reg23)) && (wire20[(2'h3):(2'h2)] ^~ reg21[(3'h6):(1'h1)])));
          reg27 <= (-(wire17[(3'h4):(1'h0)] ?
              $unsigned($signed(((8'hae) ?
                  wire19 : wire20))) : ($unsigned(wire18) + reg22[(4'ha):(3'h6)])));
        end
      else
        begin
          reg24 <= (((~|(wire19[(2'h3):(1'h0)] <= (reg24 ? reg25 : reg27))) ?
                  {(~|$unsigned(reg23)), wire19} : reg24[(3'h6):(2'h3)]) ?
              (8'ha6) : reg21[(1'h0):(1'h0)]);
        end
    end
  assign wire28 = $signed(($signed(($unsigned(reg25) == reg26[(2'h3):(1'h1)])) <= $signed(reg26)));
  always
    @(posedge clk) begin
      if (reg23)
        begin
          reg29 <= {(8'hac)};
          if (reg29)
            begin
              reg30 <= {$signed((~reg24[(2'h3):(2'h2)])),
                  (wire18 ^~ ($signed(((8'hac) && reg29)) ^ ($signed(reg22) ?
                      $unsigned(wire19) : reg24)))};
              reg31 <= $signed(((({reg29} ~^ $signed(reg21)) && ((~|reg25) ^ wire28[(4'hb):(3'h7)])) >>> reg22[(4'ha):(3'h4)]));
              reg32 <= $signed(wire17);
            end
          else
            begin
              reg30 <= $signed(((!wire20) ?
                  (reg27 ? $signed((~reg24)) : reg26) : $signed({(~reg32)})));
              reg31 <= reg25[(3'h7):(3'h7)];
            end
          reg33 <= reg24[(3'h4):(2'h3)];
          reg34 <= ($unsigned((reg33[(3'h6):(3'h6)] > {((8'haa) ?
                  (8'hba) : reg21),
              $signed(reg26)})) ~^ {((reg24[(3'h6):(1'h0)] ?
                  {reg29, reg25} : $unsigned(reg32)) - $unsigned(reg30))});
          reg35 <= $unsigned((^~reg30[(3'h7):(3'h7)]));
        end
      else
        begin
          reg29 <= {$unsigned(reg30[(3'h5):(3'h4)])};
          reg30 <= (reg24[(3'h6):(3'h6)] ?
              (+{($signed(reg35) == {wire19})}) : ((~^reg22) ^ $unsigned($unsigned((^(8'ha2))))));
          reg31 <= $signed((~(($unsigned(reg21) ? (reg31 >>> reg23) : wire18) ?
              $signed(reg35[(2'h3):(1'h0)]) : {reg35, wire28[(4'hd):(4'h9)]})));
          reg32 <= (reg31[(4'hc):(3'h6)] >= {(reg25[(2'h3):(2'h2)] < wire28[(5'h12):(4'hc)]),
              (($unsigned((8'hb6)) ?
                  reg34 : (wire20 ?
                      wire17 : reg21)) || {reg33[(1'h1):(1'h1)]})});
          reg33 <= ((~{$unsigned($signed(wire17))}) ?
              (wire18[(4'h8):(3'h7)] ?
                  $signed($signed($unsigned(reg34))) : $signed($unsigned((reg26 >> wire17)))) : (reg30[(3'h5):(2'h3)] ?
                  reg31[(4'h9):(3'h4)] : reg27));
        end
      reg36 <= reg27;
      if ((^$unsigned((reg24 - $signed((-wire18))))))
        begin
          if (((^~(reg27 ?
              reg34 : $unsigned($signed((8'ha7))))) + (~&$unsigned(reg21[(3'h5):(2'h3)]))))
            begin
              reg37 <= {(~^$unsigned($signed((8'h9c))))};
              reg38 <= ($unsigned({$signed(reg31[(2'h2):(2'h2)])}) == (8'ha1));
              reg39 <= ($unsigned(reg25) ?
                  {reg22[(3'h7):(2'h2)]} : ((7'h40) ? $signed(reg33) : reg26));
              reg40 <= ((reg39 == (($signed(reg29) | (~reg27)) <= ((reg39 ?
                      reg32 : reg21) <<< {(8'hb2)}))) ?
                  (({$unsigned((8'hab))} + reg33) == ({reg32[(3'h6):(3'h4)]} ^~ wire28)) : $unsigned((((!reg23) ?
                      (wire19 != (8'ha2)) : {reg38,
                          reg31}) <<< (wire28[(3'h7):(2'h2)] ?
                      reg26[(2'h2):(1'h0)] : (8'hb8)))));
            end
          else
            begin
              reg37 <= wire28;
              reg38 <= {(^(~^($unsigned(reg33) ?
                      reg38[(2'h2):(2'h2)] : $unsigned(reg21))))};
              reg39 <= wire18[(5'h13):(3'h5)];
              reg40 <= reg39;
              reg41 <= (!$unsigned(($signed(reg39[(4'hd):(2'h3)]) ?
                  (~&(reg32 || wire17)) : reg21)));
            end
          reg42 <= (~|(($unsigned((reg24 ? reg36 : reg30)) ?
                  {reg32[(5'h11):(1'h0)]} : reg21) ?
              (-(+(wire18 ? (8'hb6) : reg32))) : (~|reg40[(2'h3):(2'h3)])));
          if ({((((8'hb3) || $unsigned(reg42)) ?
                      reg41[(3'h5):(1'h0)] : {$unsigned(reg30)}) ?
                  (({(8'ha5), reg27} ?
                      (8'had) : reg26[(4'ha):(3'h6)]) <<< $signed(reg30[(1'h0):(1'h0)])) : $unsigned(reg21))})
            begin
              reg43 <= ($unsigned(reg26) ?
                  $signed($unsigned(reg38[(3'h7):(3'h7)])) : ($unsigned($unsigned($signed((8'ha5)))) < (reg31 ?
                      reg42[(3'h7):(2'h3)] : (reg23[(2'h2):(1'h0)] > reg37))));
              reg44 <= ($unsigned(($unsigned((reg22 ^~ reg29)) || ((reg38 ?
                      (8'hba) : reg32) != $signed(reg32)))) ?
                  ((~^(|reg29[(3'h4):(3'h4)])) & ((~|(reg22 >>> reg21)) ?
                      reg39 : ($signed(reg40) ?
                          $signed(wire28) : (~|reg32)))) : reg26);
              reg45 <= (8'hb1);
            end
          else
            begin
              reg43 <= (~&wire16[(2'h2):(2'h2)]);
            end
        end
      else
        begin
          reg37 <= reg31;
          reg38 <= $unsigned($unsigned(reg30));
          reg39 <= $signed(((reg32 ^~ $unsigned({reg45, reg41})) ?
              (~^reg22) : ($signed((!reg35)) != {(+reg26)})));
          if (((wire16 ?
              reg34[(3'h4):(2'h3)] : $signed(reg29[(2'h3):(2'h2)])) ^~ ({($signed((8'hac)) <<< reg22),
              $signed((|reg26))} ^ reg44[(2'h2):(1'h1)])))
            begin
              reg40 <= $signed($unsigned(reg24));
              reg41 <= $signed((!{$unsigned((~&reg39)),
                  $signed((reg40 && wire28))}));
            end
          else
            begin
              reg40 <= ($unsigned((((wire16 ? wire19 : reg23) ?
                      $unsigned(reg33) : reg45) ?
                  (reg34 ?
                      wire19[(3'h4):(3'h4)] : reg31[(4'ha):(2'h2)]) : (reg21 ?
                      {reg29,
                          reg30} : wire28[(5'h11):(4'hc)]))) < $signed($unsigned($signed($unsigned(reg22)))));
              reg41 <= ((wire20 ? reg25[(1'h0):(1'h0)] : reg45) ?
                  ({$signed(reg30)} << reg27[(3'h4):(1'h1)]) : (reg45 && $signed(reg33[(3'h4):(2'h2)])));
            end
        end
      reg46 <= ($signed(((reg33 ?
              reg31 : (reg42 ? reg25 : wire20)) ^~ $signed((reg21 ?
              (8'h9c) : reg31)))) ?
          $unsigned(reg35[(2'h2):(1'h1)]) : (!$signed(reg36)));
    end
  assign wire47 = $signed((^~($unsigned($signed(reg31)) | $signed(reg34))));
  assign wire48 = $unsigned((^$signed($unsigned((wire28 ? reg32 : reg24)))));
endmodule
