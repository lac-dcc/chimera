module top
#(parameter param156 = (((~^(((8'hbb) ^ (8'hab)) && {(7'h40), (8'h9c)})) ? ((((8'hb2) ? (7'h41) : (8'hbf)) >>> (^~(8'ha6))) ? (((8'hb4) ? (8'hb7) : (8'h9d)) ? (^(8'ha3)) : {(7'h41), (8'hb1)}) : (&{(8'h9e), (8'hb6)})) : (({(8'h9e), (8'hb6)} > (8'had)) ? {((8'ha9) && (8'h9f))} : (((8'ha9) >= (8'ha2)) - {(8'ha5)}))) << (~{({(8'hb4), (8'haa)} ? {(8'hbf), (8'ha0)} : ((8'hac) ? (8'ha4) : (8'hbc))), ((^(8'hbb)) ^~ ((8'hb3) & (8'hae)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire115;
  wire signed [(5'h10):(1'h0)] wire153;
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire155,
                 wire4,
                 wire5,
                 wire6,
                 wire12,
                 wire112,
                 wire114,
                 wire115,
                 wire153,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  assign wire4 = (wire1 ?
                     (~&wire2) : $unsigned((wire2 * (wire1[(1'h0):(1'h0)] ?
                         (|wire2) : $signed(wire1)))));
  assign wire5 = $signed(wire2);
  assign wire6 = (!$signed(wire0));
  always
    @(posedge clk) begin
      if ((({(wire0[(4'h8):(2'h3)] ? wire1 : {(8'h9e)})} ?
              wire4[(2'h2):(1'h1)] : (((wire4 && wire4) != (wire5 >>> (8'hb9))) ?
                  $signed($signed(wire0)) : (~wire6))) ?
          $unsigned(wire5[(3'h6):(3'h4)]) : wire6))
        begin
          reg7 <= (wire5[(4'hb):(4'h8)] ? $unsigned(wire6) : wire6);
          reg8 <= (+(~&wire1));
          reg9 <= (|{($unsigned((~&wire1)) <= reg8[(3'h6):(3'h5)]),
              (reg7 ? wire1 : (-wire3))});
        end
      else
        begin
          reg7 <= {(wire0 < (^(^$unsigned(wire1)))), wire3};
          reg8 <= reg7;
          reg9 <= (~^wire6);
        end
      reg10 <= $unsigned((!(8'hb6)));
      reg11 <= (wire6 & (|((wire6 ? reg10 : (-(8'ha2))) != wire4)));
    end
  assign wire12 = $signed((((~&$signed(reg11)) - $unsigned(reg8[(5'h12):(3'h5)])) != (~|(8'h9d))));
  module13 #() modinst113 (.wire16(reg11), .wire17(wire6), .clk(clk), .wire15(reg8), .y(wire112), .wire14(reg9), .wire18(wire1));
  assign wire114 = $signed(((((reg8 ? wire5 : wire12) - {reg10}) ?
                       $unsigned($unsigned(reg7)) : $unsigned((wire0 + reg9))) << (reg10[(2'h3):(2'h2)] >= wire12[(4'hb):(2'h2)])));
  assign wire115 = $unsigned(reg7[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg116 <= (reg10[(3'h4):(1'h0)] - reg11);
      reg117 <= (((~|((+(8'hbc)) ?
          wire1[(3'h6):(2'h2)] : (&wire6))) <<< wire3[(2'h3):(1'h1)]) && $unsigned((wire1 ?
          ((~^reg11) ? $unsigned(wire114) : (wire3 > wire6)) : wire12)));
      if (reg7)
        begin
          reg118 <= wire0;
          reg119 <= (wire5 ?
              reg7[(2'h3):(2'h2)] : ((wire115 ?
                      (~&(wire3 ~^ reg8)) : {(reg7 ? reg11 : wire0)}) ?
                  (wire3 <<< (~&$signed(reg10))) : (({(8'hba)} * (wire114 ?
                          reg117 : (8'ha0))) ?
                      wire2 : wire6[(4'h9):(3'h5)])));
          reg120 <= ($unsigned((((^wire3) * (+(8'hb9))) + $unsigned(reg9[(1'h0):(1'h0)]))) < wire5[(4'hc):(2'h3)]);
          reg121 <= $signed(((&$signed((!wire114))) ?
              {$unsigned((8'ha3))} : (reg117 ^ {(reg9 ? reg120 : wire2),
                  $unsigned(reg11)})));
          reg122 <= $signed(wire1[(4'he):(4'he)]);
        end
      else
        begin
          reg118 <= (~&$unsigned(((wire0[(4'hc):(4'hb)] ?
                  (reg122 & (8'hb2)) : {(8'h9e)}) ?
              $unsigned($unsigned(reg120)) : (~^(reg9 && reg11)))));
          if (wire6)
            begin
              reg119 <= (wire0 ?
                  ($signed(wire1) * reg8) : (~^(|(~((8'hbf) ? wire6 : reg8)))));
            end
          else
            begin
              reg119 <= ((&$signed($unsigned($unsigned(reg122)))) ?
                  $signed(reg119[(3'h4):(2'h3)]) : $unsigned(($signed($unsigned(wire112)) == $unsigned(wire114[(4'hc):(1'h0)]))));
              reg120 <= ((+{reg10[(3'h6):(2'h3)]}) ^ (~&$signed(reg120)));
              reg121 <= (({(8'h9f)} || (($unsigned(wire112) ?
                          $signed(reg7) : $signed((8'hb3))) ?
                      ($signed(reg7) > reg11) : wire115[(2'h3):(2'h3)])) ?
                  (!$signed($signed(reg121))) : wire1[(4'he):(4'hb)]);
              reg122 <= wire5;
            end
          reg123 <= wire0;
          reg124 <= (wire2 > wire112[(4'h8):(1'h1)]);
        end
    end
  module125 #() modinst154 (.wire130(wire3), .y(wire153), .wire129(wire5), .wire128(wire4), .clk(clk), .wire127(reg118), .wire126(reg120));
  assign wire155 = reg117[(4'ha):(3'h7)];
endmodule

module module125
#(parameter param152 = ((({((8'hab) > (8'ha0)), (^(8'ha1))} > (((7'h43) ? (8'haf) : (8'h9f)) != ((8'hb3) == (8'ha6)))) ? {(!((8'hbc) < (8'ha6))), (((7'h41) >= (8'ha9)) ? ((8'hb9) >> (8'hb7)) : ((8'hb7) ^ (8'hb8)))} : (((^~(8'hb2)) || ((8'hae) >>> (8'hbc))) ? (~{(8'ha1), (8'hbd)}) : (((8'ha6) ? (8'hba) : (8'hb3)) && (+(8'hb2))))) >>> ((!(8'ha3)) ^ (~&(((8'ha6) & (8'hb2)) <= ((8'hb0) ? (8'hae) : (8'hab)))))))
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire130;
  input wire [(5'h12):(1'h0)] wire129;
  input wire [(4'he):(1'h0)] wire128;
  input wire [(5'h11):(1'h0)] wire127;
  input wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire150;
  wire [(4'h9):(1'h0)] wire134;
  wire signed [(5'h14):(1'h0)] wire133;
  wire signed [(2'h3):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(2'h2):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg137 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire131 = wire128;
  assign wire132 = {(wire129[(3'h7):(2'h2)] + (wire130[(3'h7):(3'h4)] ?
                           wire131[(4'hd):(4'ha)] : (~|(wire130 > wire128))))};
  assign wire133 = ($signed(wire126) ?
                       wire128 : (wire131[(4'ha):(3'h4)] ?
                           ((^~(wire129 ?
                               wire128 : wire131)) < ((^wire130) >> (wire128 | wire132))) : (&(^~wire130))));
  assign wire134 = ($unsigned({(^~$signed(wire127)),
                           (wire131[(3'h7):(2'h2)] ?
                               (wire130 >>> wire128) : (wire128 ^~ wire129))}) ?
                       (~($unsigned($unsigned(wire126)) ?
                           wire129 : wire132[(1'h0):(1'h0)])) : (wire129[(5'h11):(4'hb)] ?
                           ((~&$unsigned(wire130)) ?
                               wire128 : (wire132[(1'h1):(1'h1)] ?
                                   ((8'hb2) | wire126) : wire133)) : $unsigned(wire127[(4'hf):(3'h5)])));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned({(wire129 <= wire132[(1'h1):(1'h1)])})))
        begin
          reg135 <= wire134[(3'h4):(3'h4)];
          reg136 <= $signed($unsigned($unsigned(reg135[(2'h2):(2'h2)])));
          reg137 <= wire126;
        end
      else
        begin
          reg135 <= $unsigned((($signed((~|reg136)) ?
              wire126[(3'h5):(2'h2)] : $unsigned($signed(wire128))) <= $unsigned(($signed(wire129) != $unsigned((8'hb4))))));
          reg136 <= ({$signed(($unsigned(reg136) | reg136)),
              (((|wire132) ? (wire130 * reg136) : wire131[(3'h5):(2'h3)]) ?
                  (^{wire126}) : ($signed((8'hb2)) == wire129[(4'h8):(2'h3)]))} < (+$signed({(+(8'ha7))})));
        end
      reg138 <= (|wire133[(4'ha):(3'h6)]);
      if (wire132[(2'h3):(1'h0)])
        begin
          reg139 <= (+wire126[(4'hf):(4'h9)]);
          reg140 <= (~&(7'h43));
          reg141 <= $signed($unsigned((reg136 ? (8'had) : (!(8'hb9)))));
        end
      else
        begin
          if (wire126[(5'h14):(4'hb)])
            begin
              reg139 <= (-(^~(|reg141[(3'h7):(2'h3)])));
              reg140 <= (wire132 ?
                  $unsigned((($signed(wire126) * $unsigned((8'ha6))) ?
                      ((reg138 ?
                          wire134 : reg135) * (-wire128)) : $unsigned($signed(reg140)))) : {(((wire126 * (8'ha3)) ?
                              {(8'ha3)} : reg138) ?
                          $signed((wire130 << wire126)) : {(reg137 ?
                                  wire134 : wire132),
                              reg136[(3'h6):(1'h0)]}),
                      (~&(&(!(8'hbf))))});
            end
          else
            begin
              reg139 <= wire133;
              reg140 <= wire128[(1'h0):(1'h0)];
              reg141 <= (-(~|((^(wire128 * reg138)) >= (wire129[(4'hb):(3'h5)] ?
                  wire134[(1'h1):(1'h1)] : {wire126}))));
              reg142 <= (^$unsigned(($unsigned(reg139) ?
                  $unsigned(wire133[(4'hd):(1'h0)]) : (wire127 ?
                      $signed(reg135) : (reg140 ? wire129 : wire132)))));
            end
          reg143 <= {($signed($signed($unsigned(wire134))) ?
                  (~|reg141[(4'hb):(3'h6)]) : (~|$signed(reg135[(2'h3):(1'h0)])))};
          if ($unsigned(wire129))
            begin
              reg144 <= reg140[(3'h4):(1'h0)];
              reg145 <= $unsigned($unsigned((~&((reg135 << (8'haa)) || reg140[(4'hb):(3'h4)]))));
              reg146 <= wire129;
            end
          else
            begin
              reg144 <= ($signed($unsigned(reg139[(1'h0):(1'h0)])) ?
                  $unsigned($signed($unsigned(reg138))) : ((({reg143} > ((8'hac) ~^ wire129)) >>> reg145[(1'h0):(1'h0)]) ?
                      $signed((reg139 <<< (wire133 ?
                          reg140 : wire129))) : ((8'hbc) + ((reg141 ?
                          wire133 : reg146) << {reg139}))));
              reg145 <= reg135[(1'h1):(1'h0)];
              reg146 <= (-reg136[(2'h3):(2'h2)]);
              reg147 <= $signed((&wire126));
              reg148 <= (&({(^~$signed(reg141)),
                  (|$signed(wire131))} <= reg140));
            end
          reg149 <= (wire134 >= $unsigned(reg139[(1'h1):(1'h0)]));
        end
    end
  assign wire150 = {(~&(~wire133))};
  assign wire151 = {$signed((~^wire128[(4'h9):(1'h1)])),
                       ({(8'hbb),
                               (wire133[(3'h7):(3'h4)] ?
                                   wire134 : (~wire129))} ?
                           $unsigned(reg144[(3'h4):(1'h0)]) : wire126)};
endmodule

module module13
#(parameter param110 = ((((((7'h40) ? (8'hbd) : (8'ha6)) == ((8'hb3) ? (8'hba) : (8'hae))) ? ({(8'ha7), (8'h9e)} ? ((8'hb7) >> (8'haf)) : ((8'h9c) << (8'hbd))) : (((8'hac) & (8'hba)) ? (^(8'hbe)) : ((8'hba) <= (8'haf)))) ? ((((8'ha3) ^~ (8'hbf)) ? ((8'ha2) == (8'ha9)) : (8'ha5)) <<< (((8'hbc) ? (8'hb5) : (8'hb4)) ^ ((8'hb6) ? (8'ha6) : (8'hb2)))) : {((!(8'hb7)) ? ((8'h9c) ? (7'h40) : (7'h43)) : ((8'ha5) ? (8'h9c) : (7'h41)))}) || (+(~((|(8'ha3)) ? ((8'ha4) ? (8'h9c) : (8'ha7)) : ((8'ha0) >>> (7'h43)))))), 
parameter param111 = {(!param110), (+((param110 ? (param110 == param110) : {param110, (8'ha4)}) ? (~^(param110 && param110)) : (&{param110})))})
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire106;
  assign y = {wire109,
                 wire108,
                 wire19,
                 wire20,
                 wire21,
                 wire58,
                 wire60,
                 wire61,
                 wire106,
                 (1'h0)};
  assign wire19 = (-wire14[(1'h0):(1'h0)]);
  assign wire20 = ($unsigned((($unsigned(wire15) != (wire18 ?
                          wire16 : (8'hb0))) ?
                      $signed((wire15 ?
                          (8'h9f) : (8'hb6))) : $unsigned((wire16 & wire15)))) != $signed({$unsigned(wire17[(4'hb):(3'h7)])}));
  assign wire21 = wire18[(3'h4):(3'h4)];
  module22 #() modinst59 (wire58, clk, wire18, wire21, wire20, wire14);
  assign wire60 = $signed((~^$unsigned($unsigned((&wire21)))));
  assign wire61 = $signed(wire18[(4'hd):(3'h6)]);
  module62 #() modinst107 (wire106, clk, wire19, wire15, wire18, wire60, wire14);
  assign wire108 = $signed($unsigned($signed(((~^wire21) ^~ $signed(wire106)))));
  assign wire109 = {wire21[(4'hf):(3'h6)],
                       $unsigned($unsigned((~^(wire18 ^ wire61))))};
endmodule

module module62
#(parameter param105 = (((^~(~((8'hba) <= (8'hbf)))) ? ({((8'h9e) ? (8'ha4) : (8'ha6))} ? (~&{(8'haf), (8'hb1)}) : ((&(8'h9e)) ? (~&(7'h43)) : ((8'hb8) ? (8'ha0) : (8'h9f)))) : (!(~&((8'hb8) ? (8'ha2) : (7'h40))))) >> ((-({(8'h9f)} ? {(8'hbc), (8'ha9)} : ((8'ha5) ? (8'haf) : (8'hb5)))) ? ({(~&(8'hb7)), {(7'h43)}} > (((8'ha2) >>> (8'hbb)) >> ((8'hbe) + (8'ha8)))) : ({(~(8'ha9))} <<< (((8'ha9) ? (8'hba) : (8'hbd)) ? ((8'hb8) >= (7'h41)) : (8'ha7))))))
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire67;
  input wire [(4'h8):(1'h0)] wire66;
  input wire [(4'h9):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(3'h5):(1'h0)] wire63;
  wire signed [(5'h13):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg [(5'h13):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire69,
                 wire68,
                 reg102,
                 reg101,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire68 = ($unsigned((~&$signed((wire63 ?
                      (8'haa) : wire65)))) + (wire66[(3'h4):(1'h1)] * $unsigned(((wire63 ^~ wire66) | $signed((8'had))))));
  assign wire69 = $signed((^~{({wire68, wire65} ?
                          (~^wire68) : wire66[(3'h5):(2'h3)])}));
  always
    @(posedge clk) begin
      reg70 <= wire66;
      reg71 <= $unsigned((-wire63));
      if (wire66)
        begin
          reg72 <= ({{(+(reg71 << (8'hbf))),
                  {(reg71 ? wire65 : wire66),
                      wire64}}} <<< (!(~&$signed((~^wire68)))));
          if (($signed(wire69[(5'h10):(1'h1)]) ?
              {(~$signed((~|wire67)))} : (|$signed((!$unsigned(wire63))))))
            begin
              reg73 <= (wire64 ? reg72 : (8'had));
              reg74 <= $unsigned($signed($unsigned((~wire64))));
              reg75 <= $unsigned(((~^$unsigned($signed(reg72))) + ($signed(wire66[(2'h3):(1'h0)]) == $unsigned((-wire66)))));
              reg76 <= wire66[(3'h7):(1'h0)];
            end
          else
            begin
              reg73 <= $unsigned(($signed((&reg73[(1'h0):(1'h0)])) ?
                  {wire67,
                      ((wire63 & wire63) ?
                          ((8'ha8) <<< reg72) : (reg73 ?
                              reg75 : wire68))} : reg70[(4'hc):(4'hc)]));
              reg74 <= reg76[(2'h3):(1'h0)];
              reg75 <= reg73[(4'ha):(4'ha)];
            end
          reg77 <= (7'h44);
        end
      else
        begin
          reg72 <= reg75;
        end
      reg78 <= ({reg77[(3'h5):(2'h3)]} ?
          $signed(wire63) : $unsigned(((~&$unsigned(reg70)) >> $signed((|reg73)))));
    end
  always
    @(posedge clk) begin
      reg79 <= wire63[(2'h3):(2'h3)];
      if (($unsigned(reg75) >>> (reg79[(3'h6):(3'h4)] ?
          $unsigned(reg78) : ((&reg71[(1'h0):(1'h0)]) || reg78))))
        begin
          reg80 <= reg74;
          reg81 <= (reg80[(2'h3):(1'h1)] ?
              $signed((reg80 ?
                  wire66[(1'h0):(1'h0)] : $unsigned((reg75 ~^ reg78)))) : ($signed({$signed(wire64)}) | $unsigned(($signed(reg79) <<< {reg76}))));
          reg82 <= (-reg71);
          reg83 <= $unsigned(reg76);
        end
      else
        begin
          if (($unsigned($signed({{reg78, reg72}, (reg76 ? reg73 : reg81)})) ?
              reg80[(2'h2):(2'h2)] : (((8'ha0) <= $unsigned(reg72)) ^ reg80)))
            begin
              reg80 <= reg82[(1'h1):(1'h0)];
              reg81 <= reg70;
              reg82 <= wire69;
            end
          else
            begin
              reg80 <= ((($signed(wire67[(2'h2):(1'h1)]) <<< ((~reg80) ?
                      (reg80 ? (8'ha4) : reg80) : reg82)) ?
                  ($unsigned((8'haf)) ?
                      (8'hb1) : {reg74[(1'h1):(1'h1)],
                          wire68[(1'h0):(1'h0)]}) : (~&($unsigned(reg81) << (!reg83)))) ^~ $unsigned((-{wire65})));
              reg81 <= ((~|(|(8'ha0))) >> ({reg71} < (!wire65)));
            end
          if ((^~(^wire66)))
            begin
              reg83 <= (~|reg72);
              reg84 <= $unsigned(wire63[(3'h5):(1'h1)]);
              reg85 <= reg76;
              reg86 <= (|$signed({reg75[(2'h3):(1'h0)]}));
              reg87 <= $unsigned((~&reg84[(1'h0):(1'h0)]));
            end
          else
            begin
              reg83 <= reg86;
              reg84 <= {$signed($unsigned({(reg75 ? (8'hab) : reg76)})),
                  $signed(reg85)};
            end
          reg88 <= (($signed($unsigned({reg71})) ?
                  (-$unsigned({reg83, reg74})) : $signed($signed((reg75 ?
                      (8'hb8) : reg75)))) ?
              {$unsigned($signed($signed((8'h9c))))} : reg76);
          reg89 <= ({$unsigned($unsigned((reg74 <<< reg75))), reg75} ?
              $signed(reg71) : ({{((8'had) <<< wire69), (^reg77)}} <<< reg73));
          reg90 <= (8'hbe);
        end
      reg91 <= {(-reg80[(1'h1):(1'h1)]),
          (~&((wire63[(1'h0):(1'h0)] ?
              $unsigned((8'hb1)) : (wire69 ? wire65 : reg76)) != ((reg77 ?
                  reg81 : (8'ha6)) ?
              wire69 : (reg71 ? reg83 : reg84))))};
      reg92 <= reg74;
    end
  assign wire93 = $unsigned($signed($signed($unsigned($unsigned(wire64)))));
  assign wire94 = ((|(({(8'ha6), (7'h44)} ?
                      $signed(reg86) : reg90) + $unsigned($unsigned(reg83)))) ^ reg73[(4'h8):(3'h4)]);
  assign wire95 = (reg82 <= $signed($unsigned(reg88[(4'ha):(3'h5)])));
  assign wire96 = ($unsigned($signed($unsigned((~(8'hb1))))) ?
                      $signed(wire67[(2'h3):(2'h2)]) : reg74);
  assign wire97 = (8'hb1);
  assign wire98 = (~&(+{{$unsigned(reg79), {(8'h9c), reg85}},
                      (+(reg72 * (8'haf)))}));
  assign wire99 = reg79[(3'h6):(2'h2)];
  assign wire100 = wire63;
  always
    @(posedge clk) begin
      reg101 <= {(&{((8'hb0) ? reg72 : (reg76 ? reg76 : reg92)),
              {(reg75 ? wire66 : reg72), (8'haa)}})};
      reg102 <= $signed($signed($signed(wire63)));
    end
  assign wire103 = $signed(wire66[(1'h0):(1'h0)]);
  assign wire104 = (~|$signed({$signed(reg102)}));
endmodule

module module22
#(parameter param57 = (&(((|((8'ha1) | (7'h43))) ? ((|(7'h40)) >>> {(8'hb7)}) : (((8'hb9) ? (8'h9d) : (8'ha1)) ? ((8'hac) != (8'ha5)) : (!(8'h9e)))) & (({(8'ha5)} <= {(8'hbe)}) || {((8'ha2) ~^ (8'h9d))}))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(4'h8):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire27;
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg56,
                 reg55,
                 reg54,
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
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire27 = (&(^~(8'hba)));
  assign wire28 = $signed($signed(wire25));
  assign wire29 = (wire27 & (wire25[(4'he):(4'hd)] ?
                      $unsigned($signed((wire24 ?
                          wire25 : wire25))) : (((wire25 ? (8'hb3) : wire23) ?
                          (-wire28) : wire27[(4'hf):(4'ha)]) * {$signed(wire26)})));
  assign wire30 = (((wire27 <= wire29[(3'h5):(3'h4)]) || (wire26[(3'h4):(1'h1)] ^~ {(~&(8'hb2))})) + (wire26 >> (wire25[(4'ha):(3'h6)] || ({wire29} ?
                      (wire28 != wire26) : $signed(wire28)))));
  assign wire31 = $signed($unsigned((((wire29 << wire29) ?
                          $signed(wire27) : (wire25 ? wire27 : wire24)) ?
                      $unsigned((-wire25)) : ((~&wire26) ?
                          (wire26 ? wire24 : wire24) : $unsigned(wire28)))));
  assign wire32 = $unsigned((8'hac));
  assign wire33 = (~|$unsigned(($unsigned($signed(wire26)) ?
                      ($unsigned(wire26) ?
                          wire32 : (wire25 ?
                              (8'h9d) : wire28)) : {$unsigned(wire30)})));
  assign wire34 = ((~($signed($unsigned(wire29)) || $signed($unsigned((8'hb9))))) ?
                      (8'ha0) : (~|$signed(($signed((8'ha4)) & (wire29 > wire30)))));
  always
    @(posedge clk) begin
      reg35 <= ((wire32[(2'h2):(2'h2)] ?
              $unsigned(((wire24 ? wire25 : wire29) ?
                  $unsigned(wire31) : (wire25 ? wire27 : wire34))) : (wire33 ?
                  $unsigned((~wire32)) : {$unsigned(wire29),
                      wire24[(3'h4):(3'h4)]})) ?
          (($signed($unsigned((8'hb4))) ? (!{wire28}) : wire25) ?
              {wire25[(3'h6):(2'h3)]} : {(~|(8'hab)),
                  $signed($signed(wire32))}) : wire30);
      reg36 <= wire27;
      reg37 <= ((wire23 ?
              ($unsigned((wire33 << reg35)) ?
                  wire28 : $unsigned((reg35 ?
                      wire27 : reg35))) : ((reg35[(3'h7):(2'h2)] ^ $signed(wire26)) ?
                  ($signed(wire29) == (wire23 & wire24)) : $unsigned({reg35,
                      wire27}))) ?
          (wire28[(2'h3):(1'h0)] ?
              $unsigned((-(^~(8'ha1)))) : $signed({((8'hbf) ? (8'ha5) : wire25),
                  (8'haf)})) : (|(wire23 ?
              ($unsigned(wire32) > wire31[(2'h2):(1'h0)]) : $unsigned($signed(wire25)))));
      reg38 <= ($unsigned((!$signed($unsigned(wire23)))) >>> (!(((wire34 > wire24) ?
              wire32 : reg35) ?
          reg35[(4'hf):(1'h1)] : $unsigned(wire26))));
      reg39 <= (wire23[(1'h0):(1'h0)] ?
          reg38 : $unsigned($unsigned(wire29[(3'h6):(2'h2)])));
    end
  always
    @(posedge clk) begin
      if ($unsigned((~|$unsigned(reg39))))
        begin
          if ($signed($unsigned(wire28)))
            begin
              reg40 <= ((((wire28 ? $unsigned(reg37) : $unsigned(wire33)) ?
                          ((^~wire33) > $signed((7'h44))) : $signed(wire30)) ?
                      $signed(wire29) : (wire23 ?
                          (&(wire34 ? reg35 : wire31)) : wire34)) ?
                  (-((|wire34[(2'h2):(1'h1)]) ?
                      (^~$unsigned(wire31)) : reg36[(1'h0):(1'h0)])) : wire24[(1'h1):(1'h1)]);
              reg41 <= reg36;
            end
          else
            begin
              reg40 <= {reg38[(4'h9):(3'h4)], $signed(wire32)};
              reg41 <= $signed(($signed($unsigned((~|reg38))) < ((wire31 <<< ((8'hba) >= wire34)) == (|$signed(wire29)))));
            end
          if ((8'ha9))
            begin
              reg42 <= $signed(((^(^(wire33 != wire29))) | $unsigned($unsigned($signed(reg37)))));
              reg43 <= ($signed({{wire23[(3'h4):(1'h1)],
                      $signed(reg38)}}) != wire24);
              reg44 <= $unsigned(((^~$unsigned((reg39 ? reg37 : wire32))) ?
                  ($signed($signed(wire33)) ^~ ((~|(8'ha6)) == $unsigned(wire31))) : (wire23 | (reg36[(3'h6):(3'h6)] << (~&reg35)))));
              reg45 <= $signed(($unsigned(reg39) ?
                  reg41[(3'h5):(2'h2)] : wire29));
              reg46 <= $signed(reg35[(1'h1):(1'h0)]);
            end
          else
            begin
              reg42 <= reg40[(4'ha):(3'h5)];
              reg43 <= reg38[(4'hd):(3'h7)];
              reg44 <= $signed((&$signed(wire32)));
              reg45 <= $signed(reg40[(5'h12):(5'h11)]);
            end
          if (wire31[(2'h2):(1'h1)])
            begin
              reg47 <= ($unsigned(wire24) | {reg39,
                  ((~wire31[(1'h0):(1'h0)]) - (8'ha0))});
              reg48 <= {{$unsigned($unsigned((wire23 ^ reg46)))},
                  ($unsigned(reg43[(4'hb):(4'h9)]) ? (-(8'hb4)) : wire29)};
            end
          else
            begin
              reg47 <= reg45;
            end
          reg49 <= {{$unsigned($unsigned($signed(wire23)))},
              (~((!$unsigned(reg45)) * (!wire26)))};
          reg50 <= reg42[(1'h1):(1'h1)];
        end
      else
        begin
          if ((~&reg40))
            begin
              reg40 <= {((({wire28} ?
                      wire26[(4'hd):(3'h5)] : $signed(reg43)) >> (~|$signed(reg36))) > $unsigned((~|((8'hb0) ?
                      wire23 : wire33)))),
                  (~&((~&$signed(wire33)) ?
                      ((~wire30) * {wire30}) : $signed($unsigned(reg43))))};
              reg41 <= $unsigned(((reg36 ?
                  reg50[(5'h13):(3'h7)] : {reg36,
                      wire34[(1'h0):(1'h0)]}) ~^ {wire27,
                  $signed((reg47 ? (8'hb7) : wire33))}));
            end
          else
            begin
              reg40 <= {(|$unsigned((reg46[(1'h0):(1'h0)] - ((8'hb0) ?
                      wire34 : (8'ha4))))),
                  (~|($signed(((7'h43) ? reg49 : wire31)) ?
                      (^(~^wire29)) : $unsigned((wire26 ? (8'hb1) : reg37))))};
            end
        end
    end
  assign wire51 = (-wire31);
  assign wire52 = wire27;
  assign wire53 = $signed((^$unsigned($unsigned($unsigned(wire23)))));
  always
    @(posedge clk) begin
      reg54 <= (|($signed(reg47) | (^~(8'hb0))));
      reg55 <= reg35;
      reg56 <= ($unsigned((wire52 ^ $signed($signed(reg39)))) ^ reg50[(2'h3):(1'h0)]);
    end
endmodule
