module top
#(parameter param132 = (|(~^{((8'ha6) < (&(7'h43))), (|((8'hb7) ? (8'hb5) : (7'h40)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire131;
  wire [(4'h9):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire128;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire128,
                 wire126,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg129,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {{$unsigned($unsigned(wire1[(1'h1):(1'h1)]))}};
      reg5 <= (($unsigned((((8'h9c) ? reg4 : wire2) ?
                  wire0[(3'h6):(3'h5)] : $unsigned(wire3))) ?
              ((!wire0[(4'hb):(1'h1)]) ?
                  ((reg4 >> wire3) >= $signed(wire0)) : wire0) : wire3[(3'h4):(2'h2)]) ?
          (8'hb7) : (reg4[(1'h0):(1'h0)] ? (!wire0) : wire0[(4'hc):(1'h1)]));
      if ($signed($unsigned((((~^(8'hb1)) ? (^~reg5) : (8'hab)) ?
          $unsigned(reg4) : ((^~wire1) - (!reg5))))))
        begin
          reg6 <= $signed(wire2);
          if ((8'hb6))
            begin
              reg7 <= (!((!(wire3 >= $signed(wire2))) != ((^(8'ha6)) ?
                  $signed((+wire2)) : $signed(reg6[(4'ha):(2'h3)]))));
              reg8 <= reg4;
              reg9 <= ($unsigned($signed($signed($unsigned(wire1)))) == $signed(({(reg4 ?
                          wire0 : reg5)} ?
                  reg5[(1'h0):(1'h0)] : ((|reg4) ?
                      wire0 : (reg6 ? (8'ha7) : reg6)))));
              reg10 <= wire1[(3'h5):(2'h2)];
              reg11 <= reg9;
            end
          else
            begin
              reg7 <= {$unsigned(reg8),
                  ($signed(reg5[(2'h2):(2'h2)]) ?
                      $unsigned($unsigned(reg8)) : $unsigned((&reg8[(3'h4):(1'h0)])))};
              reg8 <= $signed($signed($unsigned((-$signed(reg8)))));
              reg9 <= {reg11, {wire3[(4'hb):(1'h0)], reg5}};
              reg10 <= {((wire2 ?
                      $unsigned((8'ha4)) : ($signed((8'hbf)) && (~^wire3))) | $signed(($signed(wire3) ?
                      (reg5 ? reg6 : reg10) : (reg11 ^ reg7))))};
            end
          reg12 <= ($unsigned({reg9}) >= {reg10, (&(~|$unsigned(reg7)))});
        end
      else
        begin
          reg6 <= wire3[(1'h0):(1'h0)];
        end
      reg13 <= reg8;
    end
  assign wire14 = (((8'hba) ^ $unsigned($signed((reg12 ? wire1 : reg7)))) ?
                      reg10 : wire1[(3'h5):(1'h0)]);
  assign wire15 = reg6[(2'h2):(1'h0)];
  assign wire16 = $unsigned(($signed(reg5) ?
                      (~|$unsigned(wire2)) : (|(~reg6[(4'h8):(2'h2)]))));
  assign wire17 = (~^(reg6[(4'ha):(4'ha)] ?
                      ($unsigned($signed(wire2)) ?
                          (~|reg13[(2'h3):(2'h3)]) : $unsigned((~reg10))) : (8'haf)));
  module18 #() modinst127 (.wire19(wire14), .clk(clk), .wire21(reg11), .wire22(reg9), .wire20(wire15), .y(wire126));
  assign wire128 = $unsigned($signed($signed((((7'h42) ? reg5 : wire2) ?
                       wire15[(4'ha):(4'h9)] : (reg9 > reg6)))));
  always
    @(posedge clk) begin
      reg129 <= wire126[(4'hb):(4'hb)];
    end
  assign wire130 = reg12[(3'h5):(3'h5)];
  assign wire131 = {$signed((8'ha5))};
endmodule

module module18
#(parameter param124 = (~|(((~^(7'h42)) ? (8'ha3) : (-((8'hb5) ^ (8'hbf)))) != ((-(-(8'ha8))) ? (~((8'h9d) ? (8'hac) : (8'hb1))) : ({(8'hbb), (8'ha1)} | ((8'had) ? (8'ha4) : (8'hab)))))), 
parameter param125 = {param124})
(y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire123;
  wire [(3'h5):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire120;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire57;
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire120,
                 wire77,
                 wire23,
                 wire37,
                 wire57,
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
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = (^~((^($unsigned(wire19) == ((8'ha6) ~^ (8'h9e)))) ?
                      wire22[(1'h1):(1'h1)] : wire22));
  always
    @(posedge clk) begin
      reg24 <= $signed($unsigned(($unsigned((&(8'hbc))) | wire22)));
      if (($unsigned(($unsigned((~wire20)) > ((-wire23) ^~ (wire22 == reg24)))) << ($signed(wire22) ?
          (|(reg24 ?
              {wire23,
                  wire19} : wire19[(2'h2):(1'h1)])) : wire21[(4'hb):(4'h9)])))
        begin
          if ($unsigned((8'ha0)))
            begin
              reg25 <= (!((^{wire21}) > $signed($signed($unsigned((8'had))))));
              reg26 <= $signed((wire20[(3'h7):(3'h5)] ?
                  wire19[(3'h6):(1'h1)] : {wire22, (8'hae)}));
              reg27 <= reg24[(1'h1):(1'h1)];
              reg28 <= $unsigned(reg25[(2'h2):(1'h1)]);
            end
          else
            begin
              reg25 <= wire22;
              reg26 <= (8'hbe);
              reg27 <= (-$signed((~reg28[(4'h8):(4'h8)])));
              reg28 <= reg25;
              reg29 <= {((((reg25 && reg24) ? wire22 : $unsigned(wire23)) ?
                      {(reg26 ? wire21 : wire20)} : {{wire19},
                          $unsigned(wire23)}) >= (+((wire23 - reg24) ?
                      ((8'hb5) ? wire19 : reg28) : (wire20 <<< wire23)))),
                  {$unsigned($signed((wire22 ? wire21 : reg24))),
                      $unsigned(reg27[(3'h4):(1'h0)])}};
            end
          if ($unsigned(reg24[(3'h7):(3'h7)]))
            begin
              reg30 <= $signed((|($signed((8'ha1)) > $signed((reg28 ?
                  reg28 : wire19)))));
              reg31 <= ((!{(8'haa), reg29[(5'h10):(4'hc)]}) ?
                  $signed((wire21 || reg29[(3'h5):(2'h2)])) : $signed($unsigned($unsigned({(7'h43),
                      wire20}))));
              reg32 <= reg31;
              reg33 <= wire20;
            end
          else
            begin
              reg30 <= wire21[(2'h3):(2'h2)];
              reg31 <= {$unsigned(($signed((^~reg26)) >= (((8'hb5) >= wire21) <= (wire19 ?
                      (7'h43) : wire19))))};
              reg32 <= reg32;
            end
          reg34 <= $unsigned({($signed(reg29) ?
                  $signed((reg28 ? wire23 : reg25)) : reg33),
              reg33[(1'h0):(1'h0)]});
          reg35 <= $unsigned(((({reg28} ?
                      wire23[(1'h1):(1'h1)] : (reg26 ? wire19 : (7'h40))) ?
                  ((reg34 ? (8'hb6) : reg24) ?
                      {wire21} : reg31) : $signed(wire19[(4'h9):(2'h2)])) ?
              $unsigned({{wire21}}) : wire20[(3'h4):(3'h4)]));
          reg36 <= reg34[(4'h8):(4'h8)];
        end
      else
        begin
          reg25 <= (wire19 ?
              $signed(((7'h43) ?
                  $signed((^wire23)) : (reg35[(3'h5):(1'h0)] >= $unsigned(wire23)))) : ($unsigned($unsigned({reg36,
                  wire23})) + $signed((&$signed(wire21)))));
        end
    end
  assign wire37 = wire20[(3'h7):(3'h4)];
  module38 #() modinst58 (wire57, clk, wire23, wire22, wire37, reg29, reg27);
  always
    @(posedge clk) begin
      if ($signed((((8'ha9) >> ($signed(reg26) ?
          $unsigned((8'h9f)) : $signed((8'ha1)))) <= {(~^(reg30 ?
              (8'hba) : reg35)),
          (8'hbe)})))
        begin
          reg59 <= wire23;
          reg60 <= (wire57[(2'h2):(2'h2)] ?
              (8'hb7) : $signed(({reg29[(1'h1):(1'h1)],
                  $unsigned(reg35)} >= $unsigned(wire20))));
          reg61 <= $signed(($unsigned((reg60[(1'h0):(1'h0)] ?
              $unsigned(wire19) : reg25[(1'h0):(1'h0)])) >> reg35[(1'h0):(1'h0)]));
          reg62 <= ((~wire21[(1'h0):(1'h0)]) > $signed({$signed({reg34}),
              (reg24 != $unsigned(reg30))}));
        end
      else
        begin
          reg59 <= ((^reg59[(2'h2):(1'h1)]) + $signed((~&$signed($signed(reg27)))));
        end
      reg63 <= {$unsigned(wire20), {$unsigned($unsigned((8'ha5)))}};
      if (reg30)
        begin
          reg64 <= (({reg59} >>> {{(-(8'ha8)), reg31},
              $signed((reg63 < wire57))}) >= reg31);
        end
      else
        begin
          reg64 <= ((((|(reg24 ? reg29 : wire22)) ?
                  wire21[(4'hd):(1'h0)] : wire57[(1'h0):(1'h0)]) ?
              reg61 : (~|wire23)) < {reg36, wire22});
          reg65 <= {(^$unsigned((8'hbd))), $signed((8'ha8))};
          reg66 <= ((reg26[(1'h1):(1'h1)] - $signed($unsigned({reg35}))) ?
              {wire22[(3'h4):(2'h2)]} : reg34);
          if (((&reg27) ?
              (^((|(!reg25)) >= $signed(((8'ha9) ?
                  reg66 : reg62)))) : (&wire37[(4'h9):(3'h4)])))
            begin
              reg67 <= reg25[(2'h2):(1'h1)];
              reg68 <= {reg59[(2'h2):(1'h1)],
                  (~^(~|((~&(8'hb4)) && reg28[(1'h0):(1'h0)])))};
              reg69 <= ((!((~^reg26[(1'h0):(1'h0)]) ?
                      reg32 : ((8'hb7) != ((8'hbe) + reg26)))) ?
                  $unsigned((!(wire19[(1'h1):(1'h0)] <<< (7'h42)))) : $signed((|({reg65,
                      wire21} + (8'hb3)))));
              reg70 <= ($signed((^(+$unsigned(reg24)))) == reg33[(2'h3):(1'h1)]);
            end
          else
            begin
              reg67 <= ((({(reg26 * reg68),
                          (reg32 >> reg60)} - $signed((reg25 == wire22))) ?
                      $signed($unsigned(reg28)) : reg69[(2'h2):(1'h1)]) ?
                  (^$unsigned($unsigned(wire57))) : ((((^reg28) ?
                          reg33[(2'h2):(1'h1)] : $signed(reg68)) << {$unsigned((7'h41))}) ?
                      reg28[(2'h2):(1'h1)] : $signed($signed((reg25 + reg34)))));
              reg68 <= wire21;
              reg69 <= $unsigned($unsigned(reg63[(2'h2):(1'h1)]));
              reg70 <= $signed(((8'hbc) ?
                  ({reg31[(3'h4):(1'h0)], $signed(reg35)} ^ ((~&reg66) ?
                      reg24 : $unsigned(wire37))) : $unsigned((~|$signed(reg29)))));
              reg71 <= reg60[(2'h2):(1'h0)];
            end
          if ($signed((~|$unsigned(wire57[(1'h0):(1'h0)]))))
            begin
              reg72 <= ($unsigned($unsigned(((wire19 << reg35) && reg67))) >= (reg29[(5'h13):(4'hb)] || reg30[(1'h0):(1'h0)]));
              reg73 <= $unsigned(({(reg69 ?
                      wire21[(4'he):(2'h2)] : reg64[(2'h2):(1'h0)])} || (reg31[(3'h7):(2'h2)] ?
                  reg25 : (!reg31[(4'h8):(4'h8)]))));
              reg74 <= (&((reg31 ?
                      $unsigned((reg28 << reg66)) : (reg60[(2'h2):(2'h2)] ?
                          $unsigned(wire23) : reg34[(1'h1):(1'h0)])) ?
                  $unsigned({(reg63 >>> reg24),
                      (^~reg24)}) : $signed((reg30 == reg71))));
            end
          else
            begin
              reg72 <= ($signed(reg33) ? (|reg31) : wire21[(4'hd):(3'h5)]);
              reg73 <= reg59[(1'h1):(1'h1)];
            end
        end
      reg75 <= {(8'hb2)};
      reg76 <= (+((reg62[(4'hb):(3'h5)] ?
          ((reg32 ^~ wire21) ?
              ((8'hae) ?
                  (8'h9f) : reg64) : ((8'hb9) != (8'hb5))) : reg68[(2'h2):(1'h0)]) & (8'ha7)));
    end
  assign wire77 = reg76;
  module78 #() modinst121 (wire120, clk, reg62, reg75, reg68, reg63);
  assign wire122 = (({$unsigned($unsigned(reg35))} <= (-(reg31[(3'h4):(2'h2)] ?
                           (wire20 ? reg65 : (8'hbd)) : $signed((8'hbb))))) ?
                       ($unsigned((~wire37[(2'h2):(1'h1)])) ?
                           reg34 : reg76) : $unsigned($signed(reg34[(4'h8):(2'h2)])));
  assign wire123 = $signed(($unsigned(reg65[(4'hc):(3'h7)]) ?
                       $unsigned((~reg73[(2'h2):(1'h0)])) : (reg61[(2'h3):(2'h3)] >= reg33)));
endmodule

module module78
#(parameter param119 = (((^~{((8'hb5) || (8'hb6)), ((8'hba) >> (7'h42))}) ? (({(8'hbb), (8'ha5)} >= (8'hba)) + (((7'h41) ? (8'hb9) : (8'hb4)) <<< (~^(8'hb4)))) : ((+(|(8'had))) + ((&(8'ha8)) ? (^~(8'h9c)) : ((8'hbf) ? (8'hbb) : (8'hbc))))) << ((!{{(8'ha1)}, ((8'had) > (8'hbb))}) ^ ((~^(8'ha8)) ? (((8'hac) ^ (8'hba)) ^ ((8'hb8) >= (8'ha8))) : (((8'hab) && (7'h40)) >>> {(8'hb6)})))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire82;
  input wire [(4'he):(1'h0)] wire81;
  input wire signed [(4'he):(1'h0)] wire80;
  input wire signed [(3'h5):(1'h0)] wire79;
  wire [(2'h3):(1'h0)] wire118;
  wire signed [(2'h2):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  wire signed [(3'h4):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire signed [(4'ha):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(4'he):(1'h0)] wire84;
  wire [(3'h7):(1'h0)] wire83;
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
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
                 reg85,
                 (1'h0)};
  assign wire83 = ($unsigned(((+wire80[(4'he):(3'h5)]) ?
                      {$signed(wire79)} : $signed(wire82))) >= $signed($unsigned(wire81[(4'ha):(3'h5)])));
  assign wire84 = $signed((wire83[(3'h7):(3'h5)] ?
                      (!$signed((~|wire83))) : $signed($signed(wire81[(4'h9):(2'h2)]))));
  always
    @(posedge clk) begin
      reg85 <= ($signed((wire84[(3'h5):(1'h1)] >= wire84[(1'h1):(1'h0)])) || ($unsigned($signed((wire81 ?
          wire83 : wire81))) - wire81[(3'h5):(1'h1)]));
    end
  assign wire86 = ((^$unsigned($signed($signed(wire80)))) ?
                      ({$unsigned((~|(7'h40))),
                          $signed($unsigned(wire83))} > wire83[(3'h4):(1'h1)]) : wire81[(4'h8):(4'h8)]);
  assign wire87 = $signed(wire86);
  always
    @(posedge clk) begin
      reg88 <= $signed(reg85);
      reg89 <= ((wire87 ?
              $unsigned(wire83[(2'h2):(1'h0)]) : (!$signed((&reg88)))) ?
          (^reg85[(2'h2):(1'h1)]) : reg88);
      if ((~|((8'hbe) > {wire86[(2'h3):(1'h0)],
          ($unsigned(wire87) ? $signed((8'h9c)) : $signed(wire87))})))
        begin
          reg90 <= $unsigned(reg88);
          if (($unsigned((&(|{wire87,
              reg90}))) << $unsigned({$unsigned(wire86)})))
            begin
              reg91 <= {($signed(($unsigned(reg89) < wire82[(3'h5):(3'h5)])) ?
                      ((~&(-(8'h9d))) ?
                          wire84[(1'h1):(1'h0)] : (-$unsigned((8'haf)))) : wire79)};
              reg92 <= wire80[(2'h3):(2'h2)];
            end
          else
            begin
              reg91 <= (~|((+reg88[(5'h11):(4'hf)]) ?
                  {(wire87 ~^ (wire81 <<< wire80))} : $signed((wire83 && wire84))));
              reg92 <= ((({$unsigned(wire82)} ?
                      wire81[(4'hb):(3'h7)] : ((wire79 < wire80) * wire84)) ?
                  wire83[(2'h3):(2'h3)] : $signed(reg90[(2'h3):(2'h2)])) < ($signed((wire87 ?
                      wire79[(3'h4):(3'h4)] : (wire81 >>> wire84))) ?
                  $unsigned((reg92[(4'hb):(4'h9)] ?
                      $unsigned(wire84) : (8'ha3))) : reg85[(1'h1):(1'h1)]));
              reg93 <= ({$unsigned(($signed(reg90) <= (wire80 < wire83)))} << ($signed(wire80[(3'h6):(2'h2)]) ?
                  (reg90 ?
                      $unsigned(wire80) : $signed((reg90 <= reg85))) : reg91[(3'h6):(3'h4)]));
            end
          reg94 <= (^$unsigned(($unsigned($signed(reg90)) ?
              $unsigned((wire83 ? reg91 : reg88)) : {$unsigned(wire84)})));
          reg95 <= wire79[(3'h4):(3'h4)];
          if ($unsigned($signed($signed(($signed(wire82) >> (reg85 - wire86))))))
            begin
              reg96 <= (({$unsigned((wire86 ^~ reg85))} ?
                      (reg88 ?
                          reg94[(2'h2):(1'h0)] : ($signed((8'hbd)) ?
                              $unsigned(wire79) : $signed(reg93))) : $unsigned(reg85[(1'h1):(1'h1)])) ?
                  (~$unsigned(($unsigned(reg94) ?
                      $unsigned(wire81) : $signed(reg85)))) : ({((~|wire87) * (~&(8'hb4)))} >= (wire82 > ({wire84} != $unsigned(wire83)))));
              reg97 <= (wire86[(2'h3):(1'h1)] - $unsigned(wire81[(4'hb):(4'hb)]));
            end
          else
            begin
              reg96 <= $unsigned(reg94[(5'h10):(1'h0)]);
              reg97 <= ($signed(reg92[(4'hf):(3'h4)]) ?
                  (~|(8'ha0)) : $signed((|$signed({reg91}))));
              reg98 <= reg95;
              reg99 <= $signed($unsigned(wire87[(3'h7):(2'h3)]));
              reg100 <= reg92;
            end
        end
      else
        begin
          reg90 <= {reg93[(1'h0):(1'h0)], reg96[(2'h2):(1'h1)]};
          reg91 <= $unsigned((reg89 ?
              reg98[(1'h0):(1'h0)] : $signed({wire79})));
          if ({(+((~^wire84) ?
                  (wire84 ?
                      $unsigned(wire84) : reg93[(1'h1):(1'h0)]) : wire84[(4'h8):(1'h0)])),
              $unsigned((-reg89))})
            begin
              reg92 <= ($signed({reg88[(3'h5):(2'h3)]}) ^~ $unsigned(reg100));
              reg93 <= (wire79 ?
                  $signed(($signed($signed(wire87)) < (^$unsigned(reg88)))) : {(($unsigned(reg98) ?
                          (wire80 ?
                              reg90 : reg93) : wire82[(3'h5):(2'h3)]) ~^ reg95[(4'hb):(4'ha)]),
                      ($signed(wire82) ?
                          ((~|reg88) ?
                              reg93[(2'h2):(1'h1)] : wire84[(2'h2):(1'h1)]) : ($signed(reg97) ?
                              wire82[(3'h6):(1'h1)] : (wire79 >>> reg98)))});
              reg94 <= (~reg88[(4'h8):(3'h4)]);
            end
          else
            begin
              reg92 <= (((~|((reg89 ? (8'h9f) : wire87) ?
                          (reg100 << reg93) : {reg89})) ?
                      $unsigned($signed((~&(8'ha4)))) : $signed(reg99)) ?
                  reg100[(2'h2):(2'h2)] : $signed($signed($signed(((8'hbe) | (8'ha4))))));
              reg93 <= $unsigned(($signed((&(reg90 ? wire81 : wire83))) ?
                  (~|(~&$signed(reg91))) : $unsigned((wire80 ?
                      $signed(wire86) : (reg90 ? reg96 : reg91)))));
              reg94 <= wire84[(2'h2):(1'h1)];
            end
          reg95 <= $unsigned(($signed({(wire80 != (8'ha8)),
              (wire79 + reg90)}) ^~ (8'hb0)));
          reg96 <= (reg94 ?
              (((~&(!reg99)) ?
                      {reg99, $unsigned(wire87)} : {(~|reg97),
                          $unsigned(reg90)}) ?
                  ($unsigned((wire81 ? reg91 : (8'h9f))) ?
                      {(wire82 ? reg100 : wire79)} : {{wire83, reg92},
                          (wire79 >= (8'hb0))}) : (~reg90)) : ($unsigned((8'hab)) + $unsigned(wire87[(3'h7):(3'h7)])));
        end
      reg101 <= reg100;
      reg102 <= (reg98 ?
          $signed(wire82[(3'h5):(3'h5)]) : ((&(~&wire86)) + (((reg94 ^~ reg91) ?
              (reg94 + wire82) : (^~reg97)) << $signed((8'hba)))));
    end
  assign wire103 = (+$signed({(|$signed((8'h9e))), reg101[(1'h1):(1'h0)]}));
  assign wire104 = reg89;
  assign wire105 = (~(8'ha2));
  assign wire106 = (^~$signed({($signed(reg94) >> $unsigned(reg102)),
                       (!wire84)}));
  assign wire107 = ((8'hb6) ?
                       {{{(8'ha9), reg102[(3'h4):(1'h0)]}},
                           (~&reg100[(2'h2):(2'h2)])} : ((8'ha9) && ((^$signed(reg98)) ?
                           $signed((wire103 ?
                               (7'h41) : reg101)) : (^(^~(8'had))))));
  assign wire108 = wire81;
  assign wire109 = reg102;
  assign wire110 = {(($unsigned(reg90) ? (&(reg98 ~^ wire81)) : (!(~|reg100))) ?
                           wire82[(3'h6):(2'h2)] : ({reg102[(3'h6):(1'h1)]} < ({wire107} <= reg91)))};
  assign wire111 = (wire83[(1'h1):(1'h0)] || {{(~reg95[(4'h8):(3'h7)])},
                       (|(((8'hb9) - reg99) ?
                           (reg93 ^~ wire105) : (~|reg97)))});
  assign wire112 = (((~(wire84[(4'ha):(3'h5)] ?
                           ((8'hbc) ?
                               wire81 : reg91) : (reg98 ^~ wire80))) >>> {(-$unsigned(wire106))}) ?
                       ((^wire79[(1'h0):(1'h0)]) < {(wire103[(3'h4):(1'h0)] ?
                               $unsigned(wire86) : (reg101 ^ wire109)),
                           ((wire80 ? wire103 : wire84) ?
                               (reg101 ^ reg85) : $signed(reg94))}) : wire79[(2'h2):(1'h1)]);
  assign wire113 = (~&(&$unsigned(((8'ha6) ?
                       {wire108, (7'h42)} : $signed(reg92)))));
  assign wire114 = ({$unsigned((|(wire112 * reg98)))} + reg89[(4'h8):(1'h1)]);
  assign wire115 = (-(&wire113));
  assign wire116 = {$signed({$signed(reg91[(4'he):(1'h0)]), wire111})};
  assign wire117 = wire113[(2'h3):(1'h1)];
  assign wire118 = (~|wire84);
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire43;
  input wire signed [(4'hc):(1'h0)] wire42;
  input wire [(4'hc):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire signed [(4'he):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire44;
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire44,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire44 = {$unsigned($signed({wire42, {wire42}}))};
  always
    @(posedge clk) begin
      reg45 <= $signed(($unsigned((wire44 ?
              $unsigned(wire39) : (wire44 > wire41))) ?
          (~^(^(~wire41))) : wire41[(3'h4):(2'h2)]));
      reg46 <= (|wire44);
      if (wire41)
        begin
          reg47 <= reg46[(3'h5):(2'h3)];
        end
      else
        begin
          reg47 <= $signed(reg47[(2'h3):(2'h2)]);
          if (reg47[(4'ha):(1'h1)])
            begin
              reg48 <= ($signed($signed(wire40)) <<< reg47);
              reg49 <= (wire41[(3'h4):(2'h3)] ?
                  $signed((wire41[(1'h1):(1'h0)] ?
                      reg46 : ((wire39 ?
                          wire43 : wire40) ^~ (7'h40)))) : wire41);
              reg50 <= wire39[(4'h8):(3'h7)];
            end
          else
            begin
              reg48 <= (wire40[(3'h5):(3'h5)] ~^ reg48);
            end
          reg51 <= reg46;
          reg52 <= (wire44 != (({$signed(wire39)} ?
                  $unsigned({(8'hbf)}) : $signed((wire44 ? reg46 : reg51))) ?
              reg51 : wire39));
          reg53 <= $unsigned($unsigned({(~$signed(reg49))}));
        end
      reg54 <= (wire44 | $signed({((wire42 || reg48) ? reg51 : $signed(reg51)),
          $signed($signed(reg46))}));
    end
  assign wire55 = ($signed(reg48[(3'h7):(3'h4)]) * {$signed(wire44),
                      (^{(reg50 <<< reg52), (wire41 == reg52)})});
  assign wire56 = (($unsigned(($signed(reg53) < wire40[(1'h1):(1'h1)])) * (wire41[(3'h6):(3'h6)] <<< ((^reg48) ?
                      {(8'haf), wire40} : wire40[(2'h3):(2'h2)]))) != reg51);
endmodule
